/**
 * @file ipv6_frag.c
 * @brief IPv6 fragmentation and reassembly
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneTCP Open.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL IPV6_TRACE_LEVEL

//Dependencies
#include "tcp_ip_stack.h"
#include "ip.h"
#include "ipv6.h"
#include "ipv6_frag.h"
#include "icmpv6.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED && IPV6_FRAG_SUPPORT == ENABLED)


/**
 * @brief Fragment IPv6 datagram into smaller packets
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv6 pseudo header
 * @param[in] payload Multi-part buffer containing the payload
 * @param[in] payloadOffset Offset to the first payload byte
 * @param[in] hopLimit Hop Limit value
 * @return Error code
 **/

error_t ipv6FragmentDatagram(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *payload, size_t payloadOffset, uint8_t hopLimit)
{
   error_t error;
   uint32_t id;
   size_t offset;
   size_t length;
   size_t payloadLength;
   size_t fragmentOffset;
   ChunkedBuffer *fragment;

   //Identification field is used to identify fragments of an original IP datagram
   id = osAtomicInc32(&interface->ipv6Identification);

   //Retrieve the length of the payload
   payloadLength = chunkedBufferGetLength(payload) - payloadOffset;

   //Allocate a memory buffer to hold IP fragments
   fragment = ipAllocBuffer(0, &fragmentOffset);
   //Failed to allocate memory?
   if(!fragment)
      return ERROR_OUT_OF_MEMORY;

   //Split the payload into multiple IP fragments
   for(offset = 0; offset < payloadLength; offset += length)
   {
      //Flush the contents of the fragment
      error = chunkedBufferSetLength(fragment, fragmentOffset);
      //Sanity check
      if(error) break;

      //Process the last fragment?
      if((payloadLength - offset) <= IPV6_MAX_FRAG_SIZE)
      {
         //Size of the current fragment
         length = payloadLength - offset;
         //Copy fragment data
         chunkedBufferConcat(fragment, payload, payloadOffset + offset, length);

         //Do not set the MF flag for the last fragment
         error = ipv6SendPacket(interface, pseudoHeader, id,
            offset, fragment, fragmentOffset, hopLimit);
      }
      else
      {
         //Size of the current fragment (must be a multiple of 8-byte blocks)
         length = IPV6_MAX_FRAG_SIZE;
         //Copy fragment data
         chunkedBufferConcat(fragment, payload, payloadOffset + offset, length);

         //Fragmented packets must have the M flag set
         error = ipv6SendPacket(interface, pseudoHeader, id,
            offset | IPV6_FLAG_M, fragment, fragmentOffset, hopLimit);
      }

      //Failed to send current IP fragment?
      if(error) break;
   }

   //Free previously allocated memory
   chunkedBufferFree(fragment);
   //Return status code
   return error;
}


/**
 * @brief Parse Fragment header and reassemble original datagram
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the incoming IPv6 packet
 * @param[in] fragHeaderOffset Offset to the Fragment header
 * @param[in] nextHeaderOffset Offset to the Next Header field of the previous header
 **/

void ipv6ParseFragmentHeader(NetInterface *interface, const ChunkedBuffer *buffer,
   size_t fragHeaderOffset, size_t nextHeaderOffset)
{
   error_t error;
   size_t length;
   uint16_t offset;
   uint16_t dataFirst;
   uint16_t dataLast;
   Ipv6FragDesc *frag;
   Ipv6HoleDesc *hole;
   Ipv6HoleDesc *prevHole;
   Ipv6Header *packet;
   Ipv6FragmentHeader *header;

   //Remaining bytes to process in the payload
   length = chunkedBufferGetLength(buffer) - fragHeaderOffset;

   //Ensure the fragment header is valid
   if(length < sizeof(Ipv6FragmentHeader))
      return;

   //Point to the IPv6 header
   packet = chunkedBufferAt(buffer, 0);
   //Sanity check
   if(!packet) return;

   //Point to the IPv6 Fragment header
   header = chunkedBufferAt(buffer, fragHeaderOffset);
   //Sanity check
   if(!header) return;

   //Calculate the length of the fragment
   length -= sizeof(Ipv6FragmentHeader);
   //Convert the fragment offset from network byte order
   offset = ntohs(header->fragmentOffset);

   //Every fragment except the last must contain a multiple of 8 bytes of data
   if((offset & IPV6_FLAG_M) && (length % 8))
   {
      //Compute the offset of the Payload Length field within the packet
      size_t n = (uint8_t *) &packet->payloadLength - (uint8_t *) packet;

      //The fragment must be discarded and an ICMP Parameter Problem
      //message should be sent to the source of the fragment, pointing
      //to the Payload Length field of the fragment packet
      icmpv6SendErrorMessage(interface, ICMPV6_TYPE_PARAM_PROBLEM,
         ICMPV6_CODE_INVALID_HEADER_FIELD, n, buffer);

      //Exit immediately
      return;
   }

   //Calculate the index of the first byte
   dataFirst = offset & IPV6_OFFSET_MASK;
   //Calculate the index immediately following the last byte
   dataLast = dataFirst + length;

   //Search for a matching IP datagram being reassembled
   frag = ipv6SearchFragQueue(interface, packet, header);
   //No matching entry in the reassembly queue?
   if(!frag) return;

   //The very first fragment requires special handling
   if(!(offset & IPV6_OFFSET_MASK))
   {
      uint8_t *p;

      //Calculate the length of the unfragmentable part
      frag->unfragPartLength = fragHeaderOffset;

      //The size of the reconstructed datagram exceeds the maximum value?
      if((frag->unfragPartLength + frag->fragPartLength) > IPV6_MAX_FRAG_DATAGRAM_SIZE)
      {
         //Compute the offset of the Fragment Offset field within the packet
         size_t n = fragHeaderOffset + (uint8_t *) &header->fragmentOffset -
            (uint8_t *) header;

         //The fragment must be discarded and an ICMP Parameter Problem
         //message should be sent to the source of the fragment, pointing
         //to the Fragment Offset field of the fragment packet
         icmpv6SendErrorMessage(interface, ICMPV6_TYPE_PARAM_PROBLEM,
            ICMPV6_CODE_INVALID_HEADER_FIELD, n, buffer);

         //Drop any allocated resources
         chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
         //Exit immediately
         return;
      }

      //Make sure the unfragmentable part entirely fits in the first chunk
      if(frag->unfragPartLength > frag->buffer.chunk[0].size)
      {
         //Drop the reconstructed datagram
         chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
         //Exit immediately
         return;
      }

      //Fix the length of the first chunk
      frag->buffer.chunk[0].length = frag->unfragPartLength;

      //The unfragmentable part of the reassembled packet consists
      //of all headers up to, but not including, the Fragment header
      //of the first fragment packet
      chunkedBufferCopy((ChunkedBuffer *) &frag->buffer, 0, buffer, 0, frag->unfragPartLength);

      //Point to the Next Header field of the last header
      p = chunkedBufferAt((ChunkedBuffer *) &frag->buffer, nextHeaderOffset);

      //The Next Header field of the last header of the unfragmentable
      //part is obtained from the Next Header field of the first
      //fragment's Fragment header
      *p = header->nextHeader;
   }

   //It may be necessary to increase the size of the buffer...
   if(dataLast > frag->fragPartLength)
   {
      //The size of the reconstructed datagram exceeds the maximum value?
      if((frag->unfragPartLength + dataLast) > IPV6_MAX_FRAG_DATAGRAM_SIZE)
      {
         //Compute the offset of the Fragment Offset field within the packet
         size_t n = fragHeaderOffset + (uint8_t *) &header->fragmentOffset - (uint8_t *) header;

         //The fragment must be discarded and an ICMP Parameter Problem
         //message should be sent to the source of the fragment, pointing
         //to the Fragment Offset field of the fragment packet
         icmpv6SendErrorMessage(interface, ICMPV6_TYPE_PARAM_PROBLEM,
            ICMPV6_CODE_INVALID_HEADER_FIELD, n, buffer);

         //Drop any allocated resources
         chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
         //Exit immediately
         return;
      }

      //Adjust the size of the reconstructed datagram
      error = chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer,
         frag->unfragPartLength + dataLast + sizeof(Ipv6HoleDesc));

      //Any error to report?
      if(error)
      {
         //Drop the reconstructed datagram
         chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
         //Exit immediately
         return;
      }

      //Actual length of the fragmentable part
      frag->fragPartLength = dataLast;
   }

   //Select the first hole descriptor from the list
   hole = ipv6FindHole(frag, frag->firstHole);
   //Keep track of the previous hole in the list
   prevHole = NULL;

   //Iterate through the hole descriptors
   while(hole != NULL)
   {
      //Save lower and upper boundaries for later use
      uint16_t holeFirst = hole->first;
      uint16_t holeLast = hole->last;

      //Check whether the newly arrived fragment
      //interacts with this hole in some way
      if(dataFirst < holeLast && dataLast > holeFirst)
      {
         //The current descriptor is no longer valid. We will destroy
         //it, and in the next two steps, we will determine whether
         //or not it is necessary to create any new hole descriptors
         if(prevHole != NULL)
            prevHole->next = hole->next;
         else
            frag->firstHole = hole->next;

         //Is there still a hole at the beginning of the segment?
         if(dataFirst > holeFirst)
         {
            //Create a new entry that describes this hole
            hole = ipv6FindHole(frag, holeFirst);
            hole->first = holeFirst;
            hole->last = dataFirst;

            //Insert the newly created entry into the hole descriptor list
            if(prevHole != NULL)
            {
               hole->next = prevHole->next;
               prevHole->next = hole->first;
            }
            else
            {
               hole->next = frag->firstHole;
               frag->firstHole = hole->first;
            }

            //Always keep track of the previous hole
            prevHole = hole;
         }

         //Is there still a hole at the end of the segment?
         if(dataLast < holeLast && (offset & IPV6_FLAG_M))
         {
            //Create a new entry that describes this hole
            hole = ipv6FindHole(frag, dataLast);
            hole->first = dataLast;
            hole->last = holeLast;

            //Insert the newly created entry into the hole descriptor list
            if(prevHole != NULL)
            {
               hole->next = prevHole->next;
               prevHole->next = hole->first;
            }
            else
            {
               hole->next = frag->firstHole;
               frag->firstHole = hole->first;
            }

            //Always keep track of the previous hole
            prevHole = hole;
         }
      }
      else
      {
         //The newly arrived fragment does not interact with the current hole
         prevHole = hole;
      }

      //Select the next hole descriptor from the list
      hole = ipv6FindHole(frag, prevHole ? prevHole->next : frag->firstHole);
   }

   //Copy data from the fragment to the reassembly buffer
   chunkedBufferCopy((ChunkedBuffer *) &frag->buffer, frag->unfragPartLength + dataFirst,
      buffer, fragHeaderOffset + sizeof(Ipv6FragmentHeader), length);

   //Dump hole descriptor list
   ipv6DumpHoleList(frag);

   //If the hole descriptor list is empty, the reassembly process is now complete
   if(!ipv6FindHole(frag, frag->firstHole))
   {
      //Discard the extra hole descriptor that follows the reconstructed datagram
      error = chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer,
         frag->unfragPartLength + frag->fragPartLength);

      //Check status code
      if(!error)
      {
         //Point to the IPv6 header
         Ipv6Header *datagram = chunkedBufferAt((ChunkedBuffer *) &frag->buffer, 0);

         //Fix the Payload Length field
         datagram->payloadLength = htons(frag->unfragPartLength +
            frag->fragPartLength - sizeof(Ipv6Header));

         //Pass the original IPv6 datagram to the higher protocol layer
         ipv6ProcessPacket(interface, (ChunkedBuffer *) &frag->buffer);
      }

      //Release previously allocated memory
      chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
   }
}


/**
 * @brief Fragment reassembly timeout handler
 *
 * This routine must be periodically called by the TCP/IP stack to
 * handle IPv6 fragment reassembly timeout
 *
 * @param[in] interface Underlying network interface
 **/

void ipv6FragTick(NetInterface *interface)
{
   error_t error;
   uint_t i;
   systime_t time;
   Ipv6HoleDesc *hole;

   //Acquire exclusive access to the reassembly queue
   osMutexAcquire(interface->ipv6FragQueueMutex);

   //Get current time
   time = osGetTickCount();

   //Loop through the reassembly queue
   for(i = 0; i < IPV6_MAX_FRAG_DATAGRAMS; i++)
   {
      //Point to the current entry in the reassembly queue
      Ipv6FragDesc *frag = &interface->ipv6FragQueue[i];

      //Make sure the entry is currently in use
      if(frag->buffer.chunkCount > 0)
      {
         //If the timer runs out, the partially-reassembled datagram must be
         //discarded and ICMPv6 Time Exceeded message sent to the source host
         if((time - frag->timestamp) >= IPV6_FRAG_TIME_TO_LIVE)
         {
            //Debug message
            TRACE_INFO("IPv6 fragment reassembly timeout...\r\n");
            //Dump IP header contents for debugging purpose
            ipv6DumpHeader(frag->buffer.chunk[0].address);

            //Point to the first hole descriptor
            hole = ipv6FindHole(frag, frag->firstHole);

            //Make sure the fragment zero has been received
            //before sending an ICMPv6 message
            if(hole != NULL && hole->first > 0)
            {
               //Fix the size of the reconstructed datagram
               error = chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer,
                  frag->unfragPartLength + hole->first);

               //Check status code
               if(!error)
               {
                  //Send an ICMPv6 Time Exceeded message
                  icmpv6SendErrorMessage(interface, ICMPV6_TYPE_TIME_EXCEEDED,
                     ICMPV6_CODE_REASSEMBLY_TIME_EXCEEDED, 0, (ChunkedBuffer *) &frag->buffer);
               }
            }

            //Drop the partially reconstructed datagram
            chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
         }
      }
   }

   //Release exclusive access to the reassembly queue
   osMutexRelease(interface->ipv6FragQueueMutex);
}


/**
 * @brief Search for a matching datagram in the reassembly queue
 * @param[in] interface Underlying network interface
 * @param[in] packet Incoming IPv6 packet
 * @param[in] header Pointer to the Fragment header
 * @return Matching fragment descriptor
 **/

Ipv6FragDesc *ipv6SearchFragQueue(NetInterface *interface,
   Ipv6Header *packet, Ipv6FragmentHeader *header)
{
   error_t error;
   uint_t i;
   Ipv6Header *datagram;
   Ipv6FragDesc *frag;
   Ipv6HoleDesc *hole;

   //Search for a matching IP datagram being reassembled
   for(i = 0; i < IPV6_MAX_FRAG_DATAGRAMS; i++)
   {
      //Point to the current entry in the reassembly queue
      frag = &interface->ipv6FragQueue[i];

      //Check whether the current entry is used?
      if(frag->buffer.chunkCount > 0)
      {
         //Point to the corresponding datagram
         datagram = chunkedBufferAt((ChunkedBuffer *) &frag->buffer, 0);

         //Check source and destination addresses
         if(!ipv6CompAddr(&datagram->srcAddr, &packet->srcAddr))
            continue;
         if(!ipv6CompAddr(&datagram->destAddr, &packet->destAddr))
            continue;
         //Compare fragment identification fields
         if(frag->identification != header->identification)
            continue;

         //A matching entry has been found in the reassembly queue
         return frag;
      }
   }

   //If the current packet does not match an existing entry
   //in the reassembly queue, then create a new entry
   for(i = 0; i < IPV6_MAX_FRAG_DATAGRAMS; i++)
   {
      //Point to the current entry in the reassembly queue
      frag = &interface->ipv6FragQueue[i];

      //The current entry is free?
      if(!frag->buffer.chunkCount)
      {
         //Number of chunks that comprise the reassembly buffer
         frag->buffer.maxChunkCount = arraysize(frag->buffer.chunk);

         //Allocate sufficient memory to hold the IPv6 header and
         //the first hole descriptor
         error = chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer,
            MEM_POOL_BUFFER_SIZE + sizeof(Ipv6HoleDesc));

         //Failed to allocate memory?
         if(error)
         {
            //Clean up side effects
            chunkedBufferSetLength((ChunkedBuffer *) &frag->buffer, 0);
            //Exit immediately
            return NULL;
         }

         //Initial length of the reconstructed datagram
         frag->unfragPartLength = sizeof(Ipv6Header);
         frag->fragPartLength = 0;

         //Fix the length of the first chunk
         frag->buffer.chunk[0].length = frag->unfragPartLength;
         //Copy IPv6 header from the incoming fragment
         chunkedBufferWrite((ChunkedBuffer *) &frag->buffer, 0, packet, frag->unfragPartLength);

         //Save current time
         frag->timestamp = osGetTickCount();
         //Record fragment identification field
         frag->identification = header->identification;
         //Create a new entry in the hole descriptor list
         frag->firstHole = 0;

         //Point to first hole descriptor
         hole = ipv6FindHole(frag, frag->firstHole);
         //The entry describes the datagram  as  being completely missing
         hole->first = 0;
         hole->last = IPV6_INFINITY;
         hole->next = IPV6_INFINITY;

         //Dump hole descriptor list
         ipv6DumpHoleList(frag);

         //Return the matching fragment descriptor
         return frag;
      }
   }

   //The reassembly queue is full
   return NULL;
}


/**
 * @brief Flush IPv6 reassembly queue
 * @param[in] interface Underlying network interface
 **/

void ipv6FlushFragQueue(NetInterface *interface)
{
   uint_t i;

   //Acquire exclusive access to the reassembly queue
   osMutexAcquire(interface->ipv6FragQueueMutex);

   //Loop through the reassembly queue
   for(i = 0; i < IPV6_MAX_FRAG_DATAGRAMS; i++)
   {
      //Drop any partially reconstructed datagram
      chunkedBufferSetLength((ChunkedBuffer *) &interface->ipv6FragQueue[i].buffer, 0);
   }

   //Release exclusive access to the reassembly queue
   osMutexRelease(interface->ipv6FragQueueMutex);
}


/**
 * @brief Retrieve hole descriptor
 * @param[in] frag IPv6 fragment descriptor
 * @param[in] offset Offset of the hole
 * @return A pointer to the hole descriptor is returned if the
 *   specified offset is valid. Otherwise NULL is returned
 **/

Ipv6HoleDesc *ipv6FindHole(Ipv6FragDesc *frag, uint16_t offset)
{
   //Return a pointer to the hole descriptor
   return chunkedBufferAt((ChunkedBuffer *) &frag->buffer, frag->unfragPartLength + offset);
}


/**
 * @brief Dump hole descriptor list
 * @param[in] frag IPv6 fragment descriptor
 **/

void ipv6DumpHoleList(Ipv6FragDesc *frag)
{
//Check debugging level
#if (TRACE_LEVEL >= TRACE_LEVEL_DEBUG)
   Ipv6HoleDesc *hole;

   //Debug message
   TRACE_DEBUG("Hole descriptor list:\r\n");
   //Select the first hole descriptor from the list
   hole = ipv6FindHole(frag, frag->firstHole);

   //Loop through the hole descriptor list
   while(hole != NULL)
   {
      //Display current hole
      TRACE_DEBUG("  %" PRIu16 " - %" PRIu16 "\r\n", hole->first, hole->last);
      //Select the next hole descriptor from the list
      hole = ipv6FindHole(frag, hole->next);
   }
#endif
}

#endif
