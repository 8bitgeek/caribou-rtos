/**
 * @file arp.c
 * @brief ARP (Address Resolution Protocol)
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
 * @section Description
 *
 * Address Resolution Protocol is used to determine the hardware address of
 * a specific host when only its IPv4 address is known. Refer to RFC 826
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL ARP_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "ethernet.h"
#include "arp.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV4_SUPPORT == ENABLED)


/**
 * @brief ARP cache initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t arpInit(NetInterface *interface)
{
   //Create a mutex to prevent simultaneous access to ARP cache
   interface->arpCacheMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(interface->arpCacheMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Initialize ARP cache
   memset(interface->arpCache, 0, sizeof(interface->arpCache));

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Flush ARP cache
 * @param[in] interface Underlying network interface
 **/

void arpFlushCache(NetInterface *interface)
{
   uint_t i;
   ArpCacheEntry *entry;

   //Acquire exclusive access to ARP cache
   osMutexAcquire(interface->arpCacheMutex);

   //Loop through ARP cache entries
   for(i = 0; i < ARP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->arpCache[i];

      //Drop packets that are waiting for address resolution
      arpFlushQueuedPackets(interface, entry);
      //Release ARP entry
      entry->state = ARP_STATE_NONE;
   }

   //Release exclusive access to ARP cache
   osMutexRelease(interface->arpCacheMutex);
}


/**
 * @brief Create a new entry in the ARP cache
 * @param[in] interface Underlying network interface
 * @return Pointer to the newly created entry
 **/

ArpCacheEntry *arpCreateEntry(NetInterface *interface)
{
   uint_t i;
   ArpCacheEntry *entry;
   ArpCacheEntry *oldestEntry;

   //Keep track of the oldest entry
   oldestEntry = &interface->arpCache[0];

   //Loop through ARP cache entries
   for(i = 0; i < ARP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->arpCache[i];

      //Check whether the entry is currently in used or not
      if(entry->state == ARP_STATE_NONE)
      {
         //Erase contents
         memset(entry, 0, sizeof(ArpCacheEntry));
         //Return a pointer to the ARP entry
         return entry;
      }

      //Keep track of the oldest entry in the table
      if(timeCompare(entry->timestamp, oldestEntry->timestamp) < 0)
         oldestEntry = entry;
   }

   //Drop any pending packets
   arpFlushQueuedPackets(interface, oldestEntry);
   //The oldest entry is removed whenever the table runs out of space
   memset(oldestEntry, 0, sizeof(ArpCacheEntry));
   //Return a pointer to the ARP entry
   return oldestEntry;
}


/**
 * @brief Search the ARP cache for a given IPv4 address
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr IPv4 address
 * @return A pointer to the matching ARP entry is returned. NULL is returned
 *   if the specified IPv4 address could not be found in ARP cache
 **/

ArpCacheEntry *arpFindEntry(NetInterface *interface, Ipv4Addr ipAddr)
{
   uint_t i;
   ArpCacheEntry *entry;

   //Loop through ARP cache entries
   for(i = 0; i < ARP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->arpCache[i];

      //Check whether the entry is currently in used
      if(entry->state != ARP_STATE_NONE)
      {
         //Current entry matches the specified address?
         if(entry->ipAddr == ipAddr)
            return entry;
      }
   }

   //No matching entry in ARP cache...
   return NULL;
}


/**
 * @brief Send packets that are waiting for address resolution
 * @param[in] interface Underlying network interface
 * @param[in] entry Pointer to a Neighbor cache entry
 **/

void arpSendQueuedPackets(NetInterface *interface, ArpCacheEntry *entry)
{
   uint_t i;

   //Check current state
   if(entry->state == ARP_STATE_INCOMPLETE)
   {
      //Loop through queued packets
      for(i = 0; i < entry->queueSize; i++)
      {
         //Send current packet
         ethSendFrame(interface, &entry->macAddr, entry->queue[i].buffer,
            entry->queue[i].offset, ETH_TYPE_IPV4);
         //Release previously allocated memory
         chunkedBufferFree(entry->queue[i].buffer);
      }
   }

   //The queue is now empty
   entry->queueSize = 0;
}


/**
 * @brief Flush packet queue
 * @param[in] interface Underlying network interface
 * @param[in] entry Pointer to a Neighbor cache entry
 **/

void arpFlushQueuedPackets(NetInterface *interface, ArpCacheEntry *entry)
{
   uint_t i;

   //Check current state
   if(entry->state == ARP_STATE_INCOMPLETE)
   {
      //Drop packets that are waiting for address resolution
      for(i = 0; i < entry->queueSize; i++)
         chunkedBufferFree(entry->queue[i].buffer);
   }

   //The queue is now empty
   entry->queueSize = 0;
}


/**
 * @brief Address resolution using ARP protocol
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr IPv4 address
 * @param[in] macAddr Physical address matching the specified IPv4 address
 * @return Error code
 **/

error_t arpResolve(NetInterface *interface, Ipv4Addr ipAddr, MacAddr *macAddr)
{
   ArpCacheEntry *entry;

   //Acquire exclusive access to ARP cache
   osMutexAcquire(interface->arpCacheMutex);

   //Search the ARP cache for the specified IPv4 address
   entry = arpFindEntry(interface, ipAddr);

   //Check whether a matching entry has been found
   if(entry)
   {
      //Check the state of the ARP entry
      if(entry->state == ARP_STATE_INCOMPLETE)
      {
         //Release exclusive access to ARP cache
         osMutexRelease(interface->arpCacheMutex);
         //The address resolution is already in progress
         return ERROR_IN_PROGRESS;
      }
      else if(entry->state == ARP_STATE_STALE)
      {
         //Copy the MAC address associated with the specified IPv4 address
         *macAddr = entry->macAddr;

         //Start delay timer
         entry->timestamp = osGetTickCount();
         //Delay before sending the first probe
         entry->timeout = ARP_DELAY_FIRST_PROBE_TIME;
         //Switch to the DELAY state
         entry->state = ARP_STATE_DELAY;

         //Release exclusive access to ARP cache
         osMutexRelease(interface->arpCacheMutex);
         //Successful address resolution
         return NO_ERROR;
      }
      else
      {
         //Copy the MAC address associated with the specified IPv4 address
         *macAddr = entry->macAddr;

         //Release exclusive access to ARP cache
         osMutexRelease(interface->arpCacheMutex);
         //Successful address resolution
         return NO_ERROR;
      }
   }

   //If no entry exists, then create a new one
   entry = arpCreateEntry(interface);

   //Any error to report?
   if(!entry)
   {
      //Release exclusive access to ARP cache
      osMutexRelease(interface->arpCacheMutex);
      //Report an error to the calling function
      return ERROR_OUT_OF_RESOURCES;
   }

   //Record the IPv4 address whose MAC address is unknown
   entry->ipAddr = ipAddr;
   entry->macAddr = MAC_UNSPECIFIED_ADDR;

   //Reset retransmission counter
   entry->retransmitCount = 0;
   //No packet are pending in the transmit queue
   entry->queueSize = 0;

   //Send an ARP request
   arpSendRequest(interface, interface->ipv4Config.addr,
      entry->ipAddr, &MAC_BROADCAST_ADDR);

   //Save the time at which the packet was sent
   entry->timestamp = osGetTickCount();
   //Set timeout value
   entry->timeout = ARP_REQUEST_TIMEOUT;
   //Enter INCOMPLETE state
   entry->state = ARP_STATE_INCOMPLETE;

   //Release exclusive access to ARP cache
   osMutexRelease(interface->arpCacheMutex);

   //The address resolution is in progress
   return ERROR_IN_PROGRESS;
}


/**
 * @brief Enqueue a packet waiting for address resolution
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr IPv4 address of the destination host
 * @param[in] buffer Multi-part buffer containing the packet to be enqueued
 * @param[in] offset Offset to the first byte of the packet
 * @return Error code
 **/

error_t arpEnqueuePacket(NetInterface *interface,
   Ipv4Addr ipAddr, ChunkedBuffer *buffer, size_t offset)
{
   error_t error;
   uint_t i;
   size_t length;
   ArpCacheEntry *entry;

   //Retrieve the length of the multi-part buffer
   length = chunkedBufferGetLength(buffer);

   //Acquire exclusive access to ARP cache
   osMutexAcquire(interface->arpCacheMutex);

   //Search the ARP cache for the specified Ipv4 address
   entry = arpFindEntry(interface, ipAddr);

   //No matching entry in ARP cache?
   if(!entry)
   {
      //Release exclusive access to ARP cache
      osMutexRelease(interface->arpCacheMutex);
      //Report an error to the calling function
      return ERROR_FAILURE;
   }

   //Check current state
   if(entry->state == ARP_STATE_INCOMPLETE)
   {
      //Check whether the packet queue is full
      if(entry->queueSize >= ARP_MAX_PENDING_PACKETS)
      {
         //When the queue overflows, the new arrival should replace the oldest entry
         chunkedBufferFree(entry->queue[0].buffer);

         //Make room for the new packet
         for(i = 1; i < ARP_MAX_PENDING_PACKETS; i++)
            entry->queue[i - 1] = entry->queue[i];

         //Adjust the number of pending packets
         entry->queueSize--;
      }

      //Index of the entry to be filled in
      i = entry->queueSize;
      //Allocate a memory buffer to store the packet
      entry->queue[i].buffer = chunkedBufferAlloc(length);

      //Failed to allocate memory?
      if(!entry->queue[i].buffer)
      {
         //Release exclusive access to ARP cache
         osMutexRelease(interface->arpCacheMutex);
         //Report an error to the calling function
         return ERROR_OUT_OF_MEMORY;
      }

      //Copy packet contents
      chunkedBufferCopy(entry->queue[i].buffer, 0, buffer, 0, length);
      //Offset to the first byte of the IPv4 header
      entry->queue[i].offset = offset;

      //Increment the number of queued packets
      entry->queueSize++;
      //The packet was successfully enqueued
      error = NO_ERROR;
   }
   else
   {
      //Send immediately the packet since the address is already resolved
      error = ethSendFrame(interface, &entry->macAddr, buffer, offset, ETH_TYPE_IPV4);
   }

   //Release exclusive access to ARP cache
   osMutexRelease(interface->arpCacheMutex);
   //Return status code
   return error;
}


/**
 * @brief ARP timer handler
 *
 * This routine must be periodically called by the TCP/IP stack to
 * manage ARP cache
 *
 * @param[in] interface Underlying network interface
 **/

void arpTick(NetInterface *interface)
{
   uint_t i;
   systime_t time;
   ArpCacheEntry *entry;

   //Get current time
   time = osGetTickCount();

   //Acquire exclusive access to ARP cache
   osMutexAcquire(interface->arpCacheMutex);

   //Go through ARP cache
   for(i = 0; i < ARP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->arpCache[i];

      //INCOMPLETE state?
      if(entry->state == ARP_STATE_INCOMPLETE)
      {
         //The request timed out?
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Increment retransmission counter
            entry->retransmitCount++;

            //Check whether the maximum number of retransmissions has been exceeded
            if(entry->retransmitCount < ARP_MAX_REQUESTS)
            {
               //Retransmit ARP request
               arpSendRequest(interface, interface->ipv4Config.addr,
                  entry->ipAddr, &MAC_BROADCAST_ADDR);

               //Save the time at which the packet was sent
               entry->timestamp = time;
               //Set timeout value
               entry->timeout = ARP_REQUEST_TIMEOUT;
            }
            else
            {
               //Drop packets that are waiting for address resolution
               arpFlushQueuedPackets(interface, entry);
               //The entry should be deleted since address resolution has failed
               entry->state = ARP_STATE_NONE;
            }
         }
      }
      //REACHABLE state?
      else if(entry->state == ARP_STATE_REACHABLE)
      {
         //Periodically time out ARP cache entries
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Save current time
            entry->timestamp = osGetTickCount();
            //Enter STALE state
            entry->state = ARP_STATE_STALE;
         }
      }
      //DELAY state?
      else if(entry->state == ARP_STATE_DELAY)
      {
         //Wait for the specified delay before sending the first probe
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Send a point-to-point ARP request to the host
            arpSendRequest(interface, interface->ipv4Config.addr,
               entry->ipAddr, &entry->macAddr);

            //Save the time at which the packet was sent
            entry->timestamp = time;
            //Set timeout value
            entry->timeout = ARP_PROBE_TIMEOUT;
            //Switch to the PROBE state
            entry->state = ARP_STATE_PROBE;
         }
      }
      //PROBE state?
      else if(entry->state == ARP_STATE_PROBE)
      {
         //The request timed out?
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Increment retransmission counter
            entry->retransmitCount++;

            //Check whether the maximum number of retransmissions has been exceeded
            if(entry->retransmitCount < ARP_MAX_PROBES)
            {
               //Send a point-to-point ARP request to the host
               arpSendRequest(interface, interface->ipv4Config.addr,
                  entry->ipAddr, &entry->macAddr);

               //Save the time at which the packet was sent
               entry->timestamp = time;
               //Set timeout value
               entry->timeout = ARP_PROBE_TIMEOUT;
            }
            else
            {
               //The entry should be deleted since the host is not reachable anymore
               entry->state = ARP_STATE_NONE;
            }
         }
      }
   }

   //Release exclusive access to ARP cache
   osMutexRelease(interface->arpCacheMutex);
}


/**
 * @brief Incoming ARP packet processing
 * @param[in] interface Underlying network interface
 * @param[in] arpPacket Incoming ARP packet
 * @param[in] length Packet length
 **/

void arpProcessPacket(NetInterface *interface, ArpPacket *arpPacket, size_t length)
{
   //Discard invalid ARP packets
   if(length < sizeof(ArpPacket))
      return;

   //Debug message
   TRACE_INFO("ARP packet received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump ARP packet contents for debugging purpose
   arpDumpPacket(arpPacket);

   //Make sure the hardware type is valid
   if(arpPacket->hrd != HTONS(ARP_HARDWARE_TYPE_ETH))
      return;
   //Make sure the protocol type is valid
   if(arpPacket->pro != HTONS(ARP_PROTOCOL_TYPE_IPV4))
      return;
   //Check the length of the hardware address
   if(arpPacket->hln != sizeof(MacAddr))
      return;
   //Check the length of the protocol address
   if(arpPacket->pln != sizeof(Ipv4Addr))
      return;
   //Make sure the target protocol address is valid
   if(arpPacket->tpa == IPV4_UNSPECIFIED_ADDR)
      return;

   //Check whether the target protocol address matches the IP
   //address assigned to the interface
   if(arpPacket->tpa != interface->ipv4Config.addr)
      return;

   //Check operation code
   switch(ntohs(arpPacket->op))
   {
   //ARP request?
   case ARP_OPCODE_ARP_REQUEST:
      //Process incoming ARP request
      arpProcessRequest(interface, arpPacket);
      break;
   //ARP reply?
   case ARP_OPCODE_ARP_REPLY:
      //Process incoming ARP reply
      arpProcessReply(interface, arpPacket);
      break;
   //Unknown operation code?
   default:
      //Debug message
      TRACE_INFO("Unknown operation code!\r\n");
      //Discard incoming packet
      break;
   }
}


/**
 * @brief Incoming ARP request processing
 * @param[in] interface Underlying network interface
 * @param[in] arpRequest Incoming ARP request
 **/

void arpProcessRequest(NetInterface *interface, ArpPacket *arpRequest)
{
   //Debug message
   TRACE_INFO("ARP Request received...\r\n");

   //Send ARP reply
   arpSendReply(interface, arpRequest->spa, &arpRequest->sha, &arpRequest->sha);
}


/**
 * @brief Incoming ARP reply processing
 * @param[in] interface Underlying network interface
 * @param[in] arpReply Incoming ARP reply
 **/

void arpProcessReply(NetInterface *interface, ArpPacket *arpReply)
{
   ArpCacheEntry *entry;

   //Debug message
   TRACE_INFO("ARP Reply received...\r\n");

   //Check sender protocol address
   if(arpReply->spa == IPV4_UNSPECIFIED_ADDR)
      return;
   if(ipv4IsMulticastAddr(arpReply->spa))
      return;
   if(ipv4IsBroadcastAddr(interface, arpReply->spa))
      return;

   //Check sender hardware address
   if(macCompAddr(&arpReply->sha, &MAC_UNSPECIFIED_ADDR))
      return;
   if(macCompAddr(&arpReply->sha, &MAC_BROADCAST_ADDR))
      return;

   //Acquire exclusive access to ARP cache
   osMutexAcquire(interface->arpCacheMutex);

   //Search the ARP cache for the specified IPv4 address
   entry = arpFindEntry(interface, arpReply->spa);

   //A matching ARP entry has been found
   if(entry)
   {
      //Check current state
      if(entry->state == ARP_STATE_INCOMPLETE)
      {
         //Record the corresponding MAC address
         entry->macAddr = arpReply->sha;

         //Send all the packets that are pending for transmission
         arpSendQueuedPackets(interface, entry);

         //Save current time
         entry->timestamp = osGetTickCount();
         //The validity of the ARP entry is limited in time
         entry->timeout = ARP_REACHABLE_TIME;
         //Switch to the REACHABLE state
         entry->state = ARP_STATE_REACHABLE;
      }
      else if(entry->state == ARP_STATE_REACHABLE)
      {
         //Different link-layer address than cached?
         if(!macCompAddr(&arpReply->sha, &entry->macAddr))
         {
            //Enter STALE state
            entry->state = ARP_STATE_STALE;
         }
      }
      else if(entry->state == ARP_STATE_PROBE)
      {
         //Record IPv4/MAC address pair
         entry->ipAddr = arpReply->spa;
         entry->macAddr = arpReply->sha;

         //Save current time
         entry->timestamp = osGetTickCount();
         //The validity of the ARP entry is limited in time
         entry->timeout = ARP_REACHABLE_TIME;
         //Switch to the REACHABLE state
         entry->state = ARP_STATE_REACHABLE;
      }
   }

   //Release exclusive access to ARP cache
   osMutexRelease(interface->arpCacheMutex);
}


/**
 * @brief Send ARP request
 * @param[in] interface Underlying network interface
 * @param[in] senderIpAddr Sender IPv4 address
 * @param[in] targetIpAddr Target IPv4 address
 * @param[in] destMacAddr Destination MAC address
 * @return Error code
 **/

error_t arpSendRequest(NetInterface *interface, Ipv4Addr senderIpAddr,
   Ipv4Addr targetIpAddr, const MacAddr *destMacAddr)
{
   error_t error;
   size_t offset;
   ChunkedBuffer *buffer;
   ArpPacket *arpRequest;

   //Allocate a memory buffer to hold an ARP packet
   buffer = ethAllocBuffer(sizeof(ArpPacket), &offset);
   //Failed to allocate buffer?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the ARP packet
   arpRequest = chunkedBufferAt(buffer, offset);

   //Format ARP request
   arpRequest->hrd = htons(ARP_HARDWARE_TYPE_ETH);
   arpRequest->pro = htons(ARP_PROTOCOL_TYPE_IPV4);
   arpRequest->hln = sizeof(MacAddr);
   arpRequest->pln = sizeof(Ipv4Addr);
   arpRequest->op = htons(ARP_OPCODE_ARP_REQUEST);
   arpRequest->sha = interface->macAddr;
   arpRequest->spa = senderIpAddr;
   arpRequest->tha = MAC_UNSPECIFIED_ADDR;
   arpRequest->tpa = targetIpAddr;

   //Debug message
   TRACE_INFO("Sending ARP Request (%" PRIuSIZE " bytes)...\r\n", sizeof(ArpPacket));
   //Dump ARP packet contents for debugging purpose
   arpDumpPacket(arpRequest);

   //Send ARP request
   error = ethSendFrame(interface, destMacAddr, buffer, offset, ETH_TYPE_ARP);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Send ARP reply
 * @param[in] interface Underlying network interface
 * @param[in] targetIpAddr Target IPv4 address
 * @param[in] targetMacAddr Target MAC address
 * @param[in] destMacAddr Destination MAC address
 * @return Error code
 **/

error_t arpSendReply(NetInterface *interface, Ipv4Addr targetIpAddr,
   const MacAddr *targetMacAddr, const MacAddr *destMacAddr)
{
   error_t error;
   size_t offset;
   ChunkedBuffer *buffer;
   ArpPacket *arpReply;

   //Allocate a memory buffer to hold an ARP packet
   buffer = ethAllocBuffer(sizeof(ArpPacket), &offset);
   //Failed to allocate buffer?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the ARP packet
   arpReply = chunkedBufferAt(buffer, offset);

   //Format ARP reply
   arpReply->hrd = htons(ARP_HARDWARE_TYPE_ETH);
   arpReply->pro = htons(ETH_TYPE_IPV4);
   arpReply->hln = sizeof(MacAddr);
   arpReply->pln = sizeof(Ipv4Addr);
   arpReply->op = htons(ARP_OPCODE_ARP_REPLY);
   arpReply->sha = interface->macAddr;
   arpReply->spa = interface->ipv4Config.addr;
   arpReply->tha = *targetMacAddr;
   arpReply->tpa = targetIpAddr;

   //Debug message
   TRACE_INFO("Sending ARP Reply (%" PRIuSIZE " bytes)...\r\n", sizeof(ArpPacket));
   //Dump ARP packet contents for debugging purpose
   arpDumpPacket(arpReply);

   //Send ARP reply
   error = ethSendFrame(interface, destMacAddr, buffer, offset, ETH_TYPE_ARP);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Dump ARP packet for debugging purpose
 * @param[in] arpPacket ARP header
 **/

void arpDumpPacket(const ArpPacket *arpPacket)
{
   //Dump ARP packet contents
   TRACE_DEBUG("  Hardware Type (hrd) = 0x%04" PRIX16 "\r\n", ntohs(arpPacket->hrd));
   TRACE_DEBUG("  Protocol Type (pro) = 0x%04" PRIX16 "\r\n", ntohs(arpPacket->pro));
   TRACE_DEBUG("  Hardware Address Length (hln) = %" PRIu8 "\r\n", arpPacket->hln);
   TRACE_DEBUG("  Protocol Address Length (pln) = %" PRIu8 "\r\n", arpPacket->pln);
   TRACE_DEBUG("  Opcode (op) = %" PRIu16 "\r\n", ntohs(arpPacket->op));
   TRACE_DEBUG("  Sender Hardware Address (sha)= %s\r\n", macAddrToString(&arpPacket->sha, NULL));
   TRACE_DEBUG("  Sender Protocol Address (spa) = %s\r\n", ipv4AddrToString(arpPacket->spa, NULL));
   TRACE_DEBUG("  Target Hardware Address (tha)= %s\r\n", macAddrToString(&arpPacket->tha, NULL));
   TRACE_DEBUG("  Target Protocol Address (tpa) = %s\r\n", ipv4AddrToString(arpPacket->tpa, NULL));
}

#endif
