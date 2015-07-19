/**
 * @file ndp.c
 * @brief NDP (Neighbor Discovery Protocol)
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
 * The Neighbor Discovery Protocol is responsible for address autoconfiguration
 * of nodes, discovery of the link-layer addresses of other nodes, duplicate
 * address detection, finding available routers and address prefix discovery.
 * Refer to RFC 4861 for more details
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL NDP_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "ip.h"
#include "ipv6.h"
#include "icmpv6.h"
#include "ndp.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED && NDP_SUPPORT == ENABLED)


/**
 * @brief Neighbor cache initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t ndpInit(NetInterface *interface)
{
   //Create a mutex to prevent simultaneous access to Neighbor cache
   interface->ndpCacheMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(interface->ndpCacheMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Initialize Neighbor cache
   memset(interface->ndpCache, 0, sizeof(interface->ndpCache));

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Flush Neighbor cache
 * @param[in] interface Underlying network interface
 **/

void ndpFlushCache(NetInterface *interface)
{
   uint_t i;
   NdpCacheEntry *entry;

   //Acquire exclusive access to Neighbor cache
   osMutexAcquire(interface->ndpCacheMutex);

   //Loop through Neighbor cache entries
   for(i = 0; i < NDP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->ndpCache[i];

      //Drop packets that are waiting for address resolution
      ndpFlushQueuedPackets(interface, entry);
      //Release Neighbor cache entry
      entry->state = NDP_STATE_NONE;
   }

   //Release exclusive access to Neighbor cache
   osMutexRelease(interface->ndpCacheMutex);
}


/**
 * @brief Create a new entry in the Neighbor cache
 * @param[in] interface Underlying network interface
 * @return Pointer to the newly created entry
 **/

NdpCacheEntry *ndpCreateEntry(NetInterface *interface)
{
   uint_t i;
   NdpCacheEntry *entry;
   NdpCacheEntry *oldestEntry;

   //Keep track of the oldest entry
   oldestEntry = &interface->ndpCache[0];

   //Loop through Neighbor cache entries
   for(i = 0; i < NDP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->ndpCache[i];

      //Check whether the entry is currently in used or not
      if(entry->state == NDP_STATE_NONE)
      {
         //Erase contents
         memset(entry, 0, sizeof(NdpCacheEntry));
         //Return a pointer to the Neighbor cache entry
         return entry;
      }

      //Keep track of the oldest entry in the table
      if(timeCompare(entry->timestamp, oldestEntry->timestamp) < 0)
         oldestEntry = entry;
   }

   //Drop any pending packets
   ndpFlushQueuedPackets(interface, oldestEntry);
   //The oldest entry is removed whenever the table runs out of space
   memset(oldestEntry, 0, sizeof(NdpCacheEntry));
   //Return a pointer to the Neighbor cache entry
   return oldestEntry;
}


/**
 * @brief Search the Neighbor cache for a given IPv6 address
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr IPv6 address
 * @return A pointer to the matching entry is returned. NULL is returned if
 *   the specified IPv6 address could not be found in the Neighbor cache
 **/

NdpCacheEntry *ndpFindEntry(NetInterface *interface, const Ipv6Addr *ipAddr)
{
   uint_t i;
   NdpCacheEntry *entry;

   //Loop through Neighbor cache entries
   for(i = 0; i < NDP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->ndpCache[i];

      //Check whether the entry is currently in used
      if(entry->state != NDP_STATE_NONE)
      {
         //Current entry matches the specified address?
         if(ipv6CompAddr(&entry->ipAddr, ipAddr))
            return entry;
      }
   }

   //No matching entry in Neighbor cache...
   return NULL;
}


/**
 * @brief Send packets that are waiting for address resolution
 * @param[in] interface Underlying network interface
 * @param[in] entry Pointer to a Neighbor cache entry
 **/

void ndpSendQueuedPackets(NetInterface *interface, NdpCacheEntry *entry)
{
   uint_t i;

   //Check current state
   if(entry->state == NDP_STATE_INCOMPLETE)
   {
      //Loop through queued packets
      for(i = 0; i < entry->queueSize; i++)
      {
         //Send current packet
         ethSendFrame(interface, &entry->macAddr, entry->queue[i].buffer,
            entry->queue[i].offset, ETH_TYPE_IPV6);
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

void ndpFlushQueuedPackets(NetInterface *interface, NdpCacheEntry *entry)
{
   uint_t i;

   //Check current state
   if(entry->state == NDP_STATE_INCOMPLETE)
   {
      //Drop packets that are waiting for address resolution
      for(i = 0; i < entry->queueSize; i++)
         chunkedBufferFree(entry->queue[i].buffer);
   }

   //The queue is now empty
   entry->queueSize = 0;
}


/**
 * @brief Address resolution using Neighbor Discovery protocol
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr IPv6 address
 * @param[in] macAddr Physical address matching the specified IPv6 address
 * @return Error code
 **/

error_t ndpResolve(NetInterface *interface, const Ipv6Addr *ipAddr, MacAddr *macAddr)
{
   NdpCacheEntry *entry;

   //Acquire exclusive access to Neighbor cache
   osMutexAcquire(interface->ndpCacheMutex);

   //Search the ndpCacheMutex cache for the specified IPv6 address
   entry = ndpFindEntry(interface, ipAddr);

   //Check whether a matching entry has been found
   if(entry)
   {
      //Check the state of the Neighbor cache entry
      if(entry->state == NDP_STATE_INCOMPLETE)
      {
         //Release exclusive access to Neighbor cache
         osMutexRelease(interface->ndpCacheMutex);
         //The address resolution is already in progress
         return ERROR_IN_PROGRESS;
      }
      else if(entry->state == NDP_STATE_STALE)
      {
         //Copy the MAC address associated with the specified IPv6 address
         *macAddr = entry->macAddr;

         //Start delay timer
         entry->timestamp = osGetTickCount();
         //Delay before sending the first probe
         entry->timeout = NDP_DELAY_FIRST_PROBE_TIME;
         //Switch to the DELAY state
         entry->state = NDP_STATE_DELAY;

         //Release exclusive access to Neighbor cache
         osMutexRelease(interface->ndpCacheMutex);
         //Successful address resolution
         return NO_ERROR;
      }
      else
      {
         //Copy the MAC address associated with the specified IPv6 address
         *macAddr = entry->macAddr;

         //Release exclusive access to Neighbor cache
         osMutexRelease(interface->ndpCacheMutex);
         //Successful address resolution
         return NO_ERROR;
      }
   }

   //If no entry exists, then create a new one
   entry = ndpCreateEntry(interface);

   //Any error to report?
   if(!entry)
   {
      //Release exclusive access to Neighbor cache
      osMutexRelease(interface->ndpCacheMutex);
      //Report an error to the calling function
      return ERROR_OUT_OF_RESOURCES;
   }

   //Record the IPv6 address whose MAC address is unknown
   entry->ipAddr = *ipAddr;
   entry->macAddr = MAC_UNSPECIFIED_ADDR;

   //Reset retransmission counter
   entry->retransmitCount = 0;
   //No packet are pending in the transmit queue
   entry->queueSize = 0;

   //Send a multicast Neighbor Solicitation message
   ndpSendNeighborSol(interface, ipAddr);

   //Save the time at which the message was sent
   entry->timestamp = osGetTickCount();
   //Set timeout value
   entry->timeout = NDP_RETRANS_TIMER;
   //Enter INCOMPLETE state
   entry->state = NDP_STATE_INCOMPLETE;

   //Release exclusive access to Neighbor cache
   osMutexRelease(interface->ndpCacheMutex);

   //The address resolution is in progress
   return ERROR_IN_PROGRESS;
}


/**
 * @brief Enqueue a packet waiting for address resolution
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr IPv6 address of the destination host
 * @param[in] buffer Multi-part buffer containing the packet to be enqueued
 * @param[in] offset Offset to the first byte of the packet
 * @return Error code
 **/

error_t ndpEnqueuePacket(NetInterface *interface,
   const Ipv6Addr *ipAddr, ChunkedBuffer *buffer, size_t offset)
{
   error_t error;
   uint_t i;
   size_t length;
   NdpCacheEntry *entry;

   //Retrieve the length of the multi-part buffer
   length = chunkedBufferGetLength(buffer);

   //Acquire exclusive access to Neighbor cache
   osMutexAcquire(interface->ndpCacheMutex);

   //Search the Neighbor cache for the specified Ipv6 address
   entry = ndpFindEntry(interface, ipAddr);

   //No matching entry in Neighbor cache?
   if(!entry)
   {
      //Release exclusive access to Neighbor cache
      osMutexRelease(interface->ndpCacheMutex);
      //Report an error to the calling function
      return ERROR_FAILURE;
   }

   //Check current state
   if(entry->state == NDP_STATE_INCOMPLETE)
   {
      //Check whether the packet queue is full
      if(entry->queueSize >= NDP_MAX_PENDING_PACKETS)
      {
         //When the queue overflows, the new arrival should replace the oldest entry
         chunkedBufferFree(entry->queue[0].buffer);

         //Make room for the new packet
         for(i = 1; i < NDP_MAX_PENDING_PACKETS; i++)
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
         //Release exclusive access to Neighbor cache
         osMutexRelease(interface->ndpCacheMutex);
         //Report an error to the calling function
         return ERROR_OUT_OF_MEMORY;
      }

      //Copy packet contents
      chunkedBufferCopy(entry->queue[i].buffer, 0, buffer, 0, length);
      //Offset to the first byte of the IPv6 header
      entry->queue[i].offset = offset;

      //Increment the number of queued packets
      entry->queueSize++;
      //The packet was successfully enqueued
      error = NO_ERROR;
   }
   else
   {
      //Send immediately the packet since the address is already resolved
      error = ethSendFrame(interface, &entry->macAddr, buffer, offset, ETH_TYPE_IPV6);
   }

   //Release exclusive access to Neighbor cache
   osMutexRelease(interface->ndpCacheMutex);
   //Return status code
   return error;
}


/**
 * @brief Neighbor Discovery timer handler
 *
 * This routine must be periodically called by the TCP/IP stack to
 * manage Neighbor cache
 *
 * @param[in] interface Underlying network interface
 **/

void ndpTick(NetInterface *interface)
{
   uint_t i;
   systime_t time;
   NdpCacheEntry *entry;

   //Get current time
   time = osGetTickCount();

   //Acquire exclusive access to Neighbor cache
   osMutexAcquire(interface->ndpCacheMutex);

   //Go through Neighbor cache
   for(i = 0; i < NDP_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &interface->ndpCache[i];

      //INCOMPLETE state?
      if(entry->state == NDP_STATE_INCOMPLETE)
      {
         //The Neighbor Solicitation timed out?
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Increment retransmission counter
            entry->retransmitCount++;

            //Check whether the maximum number of retransmissions has been exceeded
            if(entry->retransmitCount < NDP_MAX_MULTICAST_SOLICIT)
            {
               //Retransmit a multicast Neighbor Solicitation message
               ndpSendNeighborSol(interface, &entry->ipAddr);

               //Save the time at which the message was sent
               entry->timestamp = time;
               //Set timeout value
               entry->timeout = NDP_RETRANS_TIMER;
            }
            else
            {
               //Drop packets that are waiting for address resolution
               ndpFlushQueuedPackets(interface, entry);
               //The entry should be deleted since address resolution has failed
               entry->state = NDP_STATE_NONE;
            }
         }
      }
      //REACHABLE state?
      else if(entry->state == NDP_STATE_REACHABLE)
      {
         //Periodically time out Neighbor cache entries
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Save current time
            entry->timestamp = osGetTickCount();
            //Enter STALE state
            entry->state = NDP_STATE_STALE;
         }
      }
      //DELAY state?
      else if(entry->state == NDP_STATE_DELAY)
      {
         //Wait for the specified delay before sending the first probe
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Send a unicast Neighbor Solicitation message
            ndpSendNeighborSol(interface, &entry->ipAddr);

            //Save the time at which the message was sent
            entry->timestamp = time;
            //Set timeout value
            entry->timeout = NDP_RETRANS_TIMER;
            //Switch to the PROBE state
            entry->state = NDP_STATE_PROBE;
         }
      }
      //PROBE state?
      else if(entry->state == NDP_STATE_PROBE)
      {
         //The request timed out?
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Increment retransmission counter
            entry->retransmitCount++;

            //Check whether the maximum number of retransmissions has been exceeded
            if(entry->retransmitCount < NDP_MAX_UNICAST_SOLICIT)
            {
               //Send a unicast Neighbor Solicitation message
               ndpSendNeighborSol(interface, &entry->ipAddr);

               //Save the time at which the packet was sent
               entry->timestamp = time;
               //Set timeout value
               entry->timeout = NDP_RETRANS_TIMER;
            }
            else
            {
               //The entry should be deleted since the host is not reachable anymore
               entry->state = NDP_STATE_NONE;
            }
         }
      }
   }

   //Release exclusive access to Neighbor cache
   osMutexRelease(interface->ndpCacheMutex);
}


/**
 * @brief Neighbor Solicitation message processing
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv6 pseudo header
 * @param[in] buffer Multi-part buffer containing the Neighbor Solicitation message
 * @param[in] offset Offset to the first byte of the message
 * @param[in] hopLimit Hop Limit field from IPv6 header
 **/

void ndpProcessNeighborSol(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit)
{
   size_t length;
   NdpNeighborSolMessage *message;
   NdpLinkLayerAddrOption *option;
   NdpCacheEntry *entry;

   //Retrieve the length of the message
   length = chunkedBufferGetLength(buffer) - offset;

   //Check the length of the Neighbor Solicitation message
   if(length < sizeof(NdpNeighborSolMessage))
      return;

   //Point to the beginning of the message
   message = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!message) return;

   //Debug message
   TRACE_INFO("Neighbor Solicitation message received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   ndpDumpNeighborSolMessage(message);

   //The IPv6 Hop Limit field must have a value of 255 to ensure
   //that the packet has not been forwarded by a router
   if(hopLimit != NDP_HOP_LIMIT)
      return;

   //ICMPv6 Code must be 0
   if(message->code)
      return;

   //The target address must a valid unicast address assigned to the interface
   //or a tentative address on which DAD is being performed
   if(!ipv6CompAddr(&message->targetAddr, &interface->ipv6Config.linkLocalAddr) &&
      !ipv6CompAddr(&message->targetAddr, &interface->ipv6Config.globalAddr))
   {
      //Debug message
      TRACE_WARNING("Wrong target address!\r\n");
      //Exit immediately
      return;
   }

   //If the IP source address is the unspecified address, the IP
   //destination address must be a solicited-node multicast address
   if(ipv6CompAddr(&pseudoHeader->srcAddr, &IPV6_UNSPECIFIED_ADDR) &&
      !ipv6IsSolicitedNodeAddr(&pseudoHeader->destAddr))
   {
      //Debug message
      TRACE_WARNING("Destination address must be a solicited-node address!\r\n");
      //Exit immediately
      return;
   }

   //Calculate the length of the Options field
   length -= sizeof(NdpNeighborSolMessage);
   //Search for the Source Link-Layer Address option
   option = ndpGetOption(message->options, length, NDP_OPT_SOURCE_LINK_LAYER_ADDR);

   //Source Link-Layer Address option found?
   if(option && option->length == 1)
   {
      //Debug message
      TRACE_DEBUG("  Source Link-Layer Address = %s\r\n",
         macAddrToString(&option->linkLayerAddr, NULL));

      //If the Source Address is not the unspecified address, then the Neighbor
      //cache should be updated for the IP source address of the solicitation
      if(ipv6CompAddr(&pseudoHeader->srcAddr, &IPV6_UNSPECIFIED_ADDR))
         return;

      //Acquire exclusive access to Neighbor cache
      osMutexAcquire(interface->ndpCacheMutex);

      //Search the Neighbor cache for the source address of the solicitation
      entry = ndpFindEntry(interface, &pseudoHeader->srcAddr);

      //No matching entry has been found?
      if(!entry)
      {
         //Create an entry
         entry = ndpCreateEntry(interface);

         //Neighbor cache entry successfully created?
         if(entry)
         {
            //Record the IPv6 and the corresponding MAC address
            entry->ipAddr = pseudoHeader->srcAddr;
            entry->macAddr = option->linkLayerAddr;
            //Save current time
            entry->timestamp = osGetTickCount();
            //Enter the STALE state
            entry->state = NDP_STATE_STALE;
         }
      }
      else
      {
         //INCOMPLETE state?
         if(entry->state == NDP_STATE_INCOMPLETE)
         {
            //Record link-layer address
            entry->macAddr = option->linkLayerAddr;
            //Send all the packets that are pending for transmission
            ndpSendQueuedPackets(interface, entry);
            //Save current time
            entry->timestamp = osGetTickCount();
            //Enter the STALE state
            entry->state = NDP_STATE_STALE;
         }
         //REACHABLE, STALE, DELAY or PROBE state?
         else
         {
            //Different link-layer address than cached?
            if(!macCompAddr(&entry->macAddr, &option->linkLayerAddr))
            {
               //Update link-layer address
               entry->macAddr = option->linkLayerAddr;
               //Save current time
               entry->timestamp = osGetTickCount();
               //Enter the STALE state
               entry->state = NDP_STATE_STALE;
            }
         }
      }

      //Release exclusive access to Neighbor cache
      osMutexRelease(interface->ndpCacheMutex);
   }
   //Source Link-Layer Address option not found?
   else
   {
      //This option must be included in multicast solicitations
      if(ipv6IsMulticastAddr(&pseudoHeader->destAddr))
      {
         //Debug message
         TRACE_WARNING("The Source Link-Layer Address must be included!\r\n");
         //Exit immediately
         return;
      }
   }

   //After any updates to the Neighbor cache, the node sends a Neighbor
   //Advertisement response as described in RFC 4861 7.2.4
   ndpSendNeighborAdv(interface, &message->targetAddr, &pseudoHeader->srcAddr);
}


/**
 * @brief Neighbor Advertisement message processing
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv6 pseudo header
 * @param[in] buffer Multi-part buffer containing the Neighbor Advertisement message
 * @param[in] offset Offset to the first byte of the message
 * @param[in] hopLimit Hop Limit field from IPv6 header
 **/

void ndpProcessNeighborAdv(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit)
{
   size_t length;
   NdpNeighborAdvMessage *message;
   NdpLinkLayerAddrOption *option;
   NdpCacheEntry *entry;

   //Retrieve the length of the message
   length = chunkedBufferGetLength(buffer) - offset;

   //Check the length of the Neighbor Advertisement message
   if(length < sizeof(NdpNeighborAdvMessage))
      return;

   //Point to the beginning of the message
   message = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!message) return;

   //Debug message
   TRACE_INFO("Neighbor Advertisement message received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   ndpDumpNeighborAdvMessage(message);

   //The IPv6 Hop Limit field must have a value of 255 to ensure
   //that the packet has not been forwarded by a router
   if(hopLimit != NDP_HOP_LIMIT)
      return;

   //ICMPv6 Code must be 0
   if(message->code)
      return;

   //Target address must not be a multicast address
   if(ipv6IsMulticastAddr(&message->targetAddr))
   {
      //Debug message
      TRACE_WARNING("Target address must not be a multicast address!\r\n");
      //Exit immediately
      return;
   }
   //If the destination address is a multicast address
   //then the Solicited flag must be zero
   if(ipv6IsMulticastAddr(&pseudoHeader->destAddr) && message->s)
   {
      //Debug message
      TRACE_WARNING("Solicited flag must be zero!\r\n");
      //Exit immediately
      return;
   }

   //Calculate the length of the Options field
   length -= sizeof(NdpNeighborSolMessage);
   //Search for the Target Link-Layer Address option
   option = ndpGetOption(message->options, length, NDP_OPT_TARGET_LINK_LAYER_ADDR);

   //Source Link-Layer Address option found?
   if(option && option->length == 1)
   {
      //Debug message
      TRACE_DEBUG("  Target Link-Layer Address = %s\r\n",
         macAddrToString(&option->linkLayerAddr, NULL));

      //Acquire exclusive access to Neighbor cache
      osMutexAcquire(interface->ndpCacheMutex);

      //Search the Neighbor cache for the specified target address
      entry = ndpFindEntry(interface, &message->targetAddr);

      //If no entry exists, the advertisement should be silently discarded
      if(entry)
      {
         //INCOMPLETE state?
         if(entry->state == NDP_STATE_INCOMPLETE)
         {
            //Record link-layer address
            entry->macAddr = option->linkLayerAddr;
            //Send all the packets that are pending for transmission
            ndpSendQueuedPackets(interface, entry);
            //Save current time
            entry->timestamp = osGetTickCount();

            //Solicited flag is set?
            if(message->s)
            {
               //Computing the random ReachableTime value
               entry->timeout = NDP_REACHABLE_TIME;
               //Switch to the REACHABLE state
               entry->state = NDP_STATE_REACHABLE;
            }
            //Solicited flag is cleared?
            else
            {
               //Enter the STALE state
               entry->state = NDP_STATE_STALE;
            }
         }
         //REACHABLE, STALE, DELAY or PROBE state?
         else
         {
            //Solicited flag is set and Override flag is cleared?
            if(message->s && !message->o)
            {
               //Same link-layer address than cached?
               if(macCompAddr(&entry->macAddr, &option->linkLayerAddr))
               {
                  //Save current time
                  entry->timestamp = osGetTickCount();
                  //Computing the random ReachableTime value
                  entry->timeout = NDP_REACHABLE_TIME;
                  //Switch to the REACHABLE state
                  entry->state = NDP_STATE_REACHABLE;
               }
               //Different link-layer address than cached?
               else
               {
                  //REACHABLE state?
                  if(entry->state == NDP_STATE_REACHABLE)
                  {
                     //Save current time
                     entry->timestamp = osGetTickCount();
                     //Enter the STALE state
                     entry->state = NDP_STATE_STALE;
                  }
               }
            }
            //Both Solicited and Override flags are set?
            else if(message->s && message->o)
            {
               //Record link-layer address (if different)
               entry->macAddr = option->linkLayerAddr;
               //Save current time
               entry->timestamp = osGetTickCount();
               //Computing the random ReachableTime value
               entry->timeout = NDP_REACHABLE_TIME;
               //Switch to the REACHABLE state
               entry->state = NDP_STATE_REACHABLE;
            }
            //Solicited flag is cleared and Override flag is set?
            else if(!message->s && message->o)
            {
               //Different link-layer address than cached?
               if(!macCompAddr(&entry->macAddr, &option->linkLayerAddr))
               {
                  //Record link-layer address
                  entry->macAddr = option->linkLayerAddr;
                  //Save current time
                  entry->timestamp = osGetTickCount();
                  //Enter the STALE state
                  entry->state = NDP_STATE_STALE;
               }
            }
         }
      }
   }
   //Source Link-Layer Address option not found?
   else
   {
      //Update content of IsRouter flag
   }

   //Release exclusive access to Neighbor cache
   osMutexRelease(interface->ndpCacheMutex);
}


/**
 * @brief Send a Router Solicitation message
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t ndpSendRouterSol(NetInterface *interface)
{
   error_t error;
   size_t offset;
   size_t length;
   ChunkedBuffer *buffer;
   NdpRouterSolMessage *message;
   Ipv6PseudoHeader pseudoHeader;

   //Allocate a memory buffer to hold the Router Solicitation
   //message and the Source Link-Layer Address option
   buffer = ipAllocBuffer(sizeof(NdpRouterSolMessage) +
      sizeof(NdpLinkLayerAddrOption), &offset);

   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the message
   message = chunkedBufferAt(buffer, offset);

   //Format Router Solicitation message
   message->type = ICMPV6_TYPE_ROUTER_SOL;
   message->code = 0;
   message->checksum = 0;
   message->reserved = 0;

   //Length of the message, excluding any option
   length = sizeof(NdpRouterSolMessage);

   //The Source Link-Layer Address option must not be included
   //when the host IPv6 address is unspecified
   if(!ipv6CompAddr(&interface->ipv6Config.linkLocalAddr, &IPV6_UNSPECIFIED_ADDR))
   {
      //Add Source Link-Layer Address option
      ndpAddOption(message, &length, NDP_OPT_SOURCE_LINK_LAYER_ADDR,
         &interface->macAddr, sizeof(MacAddr));
   }

   //Adjust the length of the multi-part buffer
   chunkedBufferSetLength(buffer, offset + length);

   //Format IPv6 pseudo header
   pseudoHeader.srcAddr = interface->ipv6Config.linkLocalAddr;
   pseudoHeader.destAddr = IPV6_LINK_LOCAL_ALL_ROUTERS_ADDR;
   pseudoHeader.length = htonl(length);
   pseudoHeader.reserved = 0;
   pseudoHeader.nextHeader = IPV6_ICMPV6_HEADER;

   //Calculate ICMPv6 header checksum
   message->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader,
      sizeof(Ipv6PseudoHeader), buffer, offset, length);

   //Debug message
   TRACE_INFO("Sending Router Solicitation message (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   ndpDumpRouterSolMessage(message);

   //Send Router Solicitation message
   error = ipv6SendDatagram(interface, &pseudoHeader, buffer, offset, NDP_HOP_LIMIT);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Send a Neighbor Solicitation message
 * @param[in] interface Underlying network interface
 * @param[in] targetIpAddr Target IPv6 address
 * @return Error code
 **/

error_t ndpSendNeighborSol(NetInterface *interface, const Ipv6Addr *targetIpAddr)
{
   error_t error;
   size_t offset;
   size_t length;
   ChunkedBuffer *buffer;
   NdpNeighborSolMessage *message;
   Ipv6PseudoHeader pseudoHeader;

   //Allocate a memory buffer to hold the Neighbor Solicitation
   //message and the Source Link-Layer Address option
   buffer = ipAllocBuffer(sizeof(NdpNeighborSolMessage) +
      sizeof(NdpLinkLayerAddrOption), &offset);

   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the message
   message = chunkedBufferAt(buffer, offset);

   //Format Neighbor Solicitation message
   message->type = ICMPV6_TYPE_NEIGHBOR_SOL;
   message->code = 0;
   message->checksum = 0;
   message->reserved = 0;
   message->targetAddr = *targetIpAddr;

   //Length of the message, excluding any option
   length = sizeof(NdpNeighborSolMessage);

   //The Source Link-Layer Address option must not be included
   //when the host IPv6 address is unspecified
   if(!ipv6CompAddr(&interface->ipv6Config.linkLocalAddr, &IPV6_UNSPECIFIED_ADDR))
   {
      //Add Source Link-Layer Address option
      ndpAddOption(message, &length, NDP_OPT_SOURCE_LINK_LAYER_ADDR,
         &interface->macAddr, sizeof(MacAddr));
   }

   //Adjust the length of the multi-part buffer
   chunkedBufferSetLength(buffer, offset + length);

   //Compute the solicited-node multicast address that
   //corresponds to the target IPv6 address
   ipv6ComputeSolicitedNodeAddr(targetIpAddr, &pseudoHeader.destAddr);

   //Format IPv6 pseudo header
   pseudoHeader.srcAddr = interface->ipv6Config.linkLocalAddr;
   pseudoHeader.length = htonl(length);
   pseudoHeader.reserved = 0;
   pseudoHeader.nextHeader = IPV6_ICMPV6_HEADER;

   //Calculate ICMPv6 header checksum
   message->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader,
      sizeof(Ipv6PseudoHeader), buffer, offset, length);

   //Debug message
   TRACE_INFO("Sending Neighbor Solicitation message (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   ndpDumpNeighborSolMessage(message);

   //Send Neighbor Solicitation message
   error = ipv6SendDatagram(interface, &pseudoHeader, buffer, offset, NDP_HOP_LIMIT);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Send a Neighbor Advertisement message
 * @param[in] interface Underlying network interface
 * @param[in] targetIpAddr Target IPv6 address
 * @param[in] destIpAddr Destination IPv6 address
 * @return Error code
 **/

error_t ndpSendNeighborAdv(NetInterface *interface,
   const Ipv6Addr *targetIpAddr, const Ipv6Addr *destIpAddr)
{
   error_t error;
   size_t offset;
   size_t length;
   ChunkedBuffer *buffer;
   NdpNeighborAdvMessage *message;
   Ipv6PseudoHeader pseudoHeader;

   //Allocate a memory buffer to hold the Neighbor Advertisement
   //message and the Target Link-Layer Address option
   buffer = ipAllocBuffer(sizeof(NdpNeighborAdvMessage) +
      sizeof(NdpLinkLayerAddrOption), &offset);

   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the message
   message = chunkedBufferAt(buffer, offset);

   //Format Neighbor Advertisement message
   message->type = ICMPV6_TYPE_NEIGHBOR_ADV;
   message->code = 0;
   message->checksum = 0;
   message->reserved1 = 0;
   message->o = TRUE;
   message->s = FALSE;
   message->r = FALSE;
   message->reserved2 = 0;
   message->targetAddr = *targetIpAddr;

   //Length of the message, excluding any option
   length = sizeof(NdpNeighborAdvMessage);

   //Add Target Link-Layer Address option
   ndpAddOption(message, &length, NDP_OPT_TARGET_LINK_LAYER_ADDR,
      &interface->macAddr, sizeof(MacAddr));

   //Adjust the length of the multi-part buffer
   chunkedBufferSetLength(buffer, offset + length);

   //Format IPv6 pseudo header
   pseudoHeader.srcAddr = *targetIpAddr;
   pseudoHeader.destAddr = *destIpAddr;
   pseudoHeader.length = htonl(length);
   pseudoHeader.reserved = 0;
   pseudoHeader.nextHeader = IPV6_ICMPV6_HEADER;

   //Destination IP address is the unspecified address?
   if(ipv6CompAddr(destIpAddr, &IPV6_UNSPECIFIED_ADDR))
   {
      //If the destination is the unspecified address, the node
      //must set the Solicited flag to zero and multicast the
      //advertisement to the all-nodes address
      pseudoHeader.destAddr = IPV6_LINK_LOCAL_ALL_NODES_ADDR;
   }
   else
   {
      //Otherwise, the node must set the Solicited flag to one and
      //unicast the advertisement to the destination IP address
      message->s = TRUE;
   }

   //Calculate ICMPv6 header checksum
   message->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader,
      sizeof(Ipv6PseudoHeader), buffer, offset, length);

   //Debug message
   TRACE_INFO("Sending Neighbor Advertisement message (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   ndpDumpNeighborAdvMessage(message);

   //Send Neighbor Advertisement message
   error = ipv6SendDatagram(interface, &pseudoHeader, buffer, offset, NDP_HOP_LIMIT);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Append an option to a NDP message
 * @param[in] message Pointer to the NDP message
 * @param[in,out] messageLength Length of the entire message
 * @param[in] type Option type
 * @param[in] value Option value
 * @param[in] length Length of the option value
 **/

void ndpAddOption(void *message, size_t *messageLength,
   uint8_t type, const void *value, uint8_t length)
{
   size_t paddingLength;

   //Location where to write the option
   NdpOption *option = PTR_OFFSET(message, *messageLength);

   //Option type
   option->type = type;
   //Length of the option in units of 8 bytes including the type and length fields
   option->length = (length + sizeof(NdpOption) + 7) / 8;
   //Option value
   memcpy(option->value, value, length);

   //Options should be padded when necessary
   if((length + sizeof(NdpOption)) < (option->length * 8))
   {
      //Determine the amount of padding data to append
      paddingLength = (option->length * 8) - length - sizeof(NdpOption);
      //Write padding data
      memset(option->value + length, 0, paddingLength);
   }

   //Adjust the length of the NDP message
   *messageLength += option->length * 8;
}


/**
 * @brief Find a specified option in a NDP message
 * @param[in] options Pointer to the Options field
 * @param[in] length Length of the Options field
 * @param[in] type Type of the option to find
 * @return If the specified option is found, a pointer to the corresponding
 *   option is returned. Otherwise NULL pointer is returned
 **/


void *ndpGetOption(uint8_t *options, size_t length, uint8_t type)
{
   uint_t i;
   NdpOption *option;

   //Parse NDP message options
   for(i = 0; (i + sizeof(NdpOption)) <= length; i++)
   {
      //Point to the current option
      option = (NdpOption *) (options + i);

      //Nodes must silently discard an NDP message
      //that contains an option with length zero
      if(!option->length)
         break;
      //Check option length
      if((i + option->length * 8) > length)
         break;

      //Current option type matches the specified one?
      if(option->type == type)
         return option;

      //Jump to next the next option
      i += option->length * 8;
   }

   //Specified option type not found
   return NULL;
}


/**
 * @brief Dump Router Solicitation message for debugging purpose
 * @param[in] message Router Solicitation message
 **/

void ndpDumpRouterSolMessage(const NdpRouterSolMessage *message)
{
   //Dump Router Solicitation message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
}


/**
 * @brief Dump Router Advertisement message for debugging purpose
 * @param[in] message Router Advertisement message
 **/

void ndpDumpRouterAdvMessage(const NdpRouterAdvMessage *message)
{
   //Dump Router Advertisement message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
   TRACE_DEBUG("  Cur Hop Limit = %" PRIu8 "\r\n", message->curHopLimit);
   TRACE_DEBUG("  M = %" PRIu8 "\r\n", message->m);
   TRACE_DEBUG("  O = %" PRIu8 "\r\n", message->o);
   TRACE_DEBUG("  Router Lifetime = %" PRIu16 "\r\n", ntohs(message->routerLifetime));
   TRACE_DEBUG("  Reachable Time = %" PRIu32 "\r\n", ntohl(message->reachableTime));
   TRACE_DEBUG("  Retrans Timer = %" PRIu32 "\r\n", ntohl(message->retransTimer));
}


/**
 * @brief Dump Neighbor Solicitation message for debugging purpose
 * @param[in] message Neighbor Solicitation message
 **/

void ndpDumpNeighborSolMessage(const NdpNeighborSolMessage *message)
{
   //Dump Neighbor Solicitation message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
   TRACE_DEBUG("  Target Address = %s\r\n", ipv6AddrToString(&message->targetAddr, NULL));
}


/**
 * @brief Dump Neighbor Advertisement message for debugging purpose
 * @param[in] message Neighbor Advertisement message
 **/

void ndpDumpNeighborAdvMessage(const NdpNeighborAdvMessage *message)
{
   //Dump Neighbor Advertisement message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
   TRACE_DEBUG("  R = %" PRIu8 "\r\n", message->r);
   TRACE_DEBUG("  S = %" PRIu8 "\r\n", message->s);
   TRACE_DEBUG("  O = %" PRIu8 "\r\n", message->o);
   TRACE_DEBUG("  Target Address = %s\r\n", ipv6AddrToString(&message->targetAddr, NULL));
}

#endif
