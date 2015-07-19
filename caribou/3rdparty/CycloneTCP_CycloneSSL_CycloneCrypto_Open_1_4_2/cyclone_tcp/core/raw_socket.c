/**
 * @file raw_socket.c
 * @brief TCP/IP raw sockets
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
 * A raw socket is a type of socket that allows access to the
 * underlying transport provider
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL RAW_SOCKET_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "raw_socket.h"
#include "socket.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (RAW_SOCKET_SUPPORT == ENABLED)


/**
 * @brief Process incoming raw datagram
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv4 or IPv6 pseudo header
 * @param[in] buffer Multi-part buffer containing the raw datagram
 * @param[in] offset Offset to the first byte of the raw datagram
 * @return Error code
 **/

error_t rawSocketProcessDatagram(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, const ChunkedBuffer *buffer, size_t offset)
{
   uint_t i;
   size_t length;
   Socket *socket;
   SocketQueueItem *queueItem;
   ChunkedBuffer *p;

   //Retrieve the length of the raw datagram
   length = chunkedBufferGetLength(buffer) - offset;

   //Enter critical section
   osMutexAcquire(socketMutex);

   //Loop through opened sockets
   for(i = 0; i < SOCKET_MAX_COUNT; i++)
   {
      //Point to the current socket
      socket = socketTable + i;

      //Raw socket found?
      if(socket->type != SOCKET_TYPE_RAW)
         continue;
      //Check whether the socket is bound to a particular interface
      if(socket->interface && socket->interface != interface)
         continue;

#if (IPV4_SUPPORT == ENABLED)
      //An IPv4 packet was received?
      if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
      {
         //Check protocol field
         if(socket->protocol != pseudoHeader->ipv4Data.protocol)
            continue;
         //Destination IP address filtering
         if(socket->localIpAddr.length)
         {
            //An IPv4 address is expected
            if(socket->localIpAddr.length != sizeof(Ipv4Addr))
               continue;
            //Filter out non-matching addresses
            if(socket->localIpAddr.ipv4Addr != pseudoHeader->ipv4Data.destAddr)
               continue;
         }
         //Source IP address filtering
         if(socket->remoteIpAddr.length)
         {
            //An IPv4 address is expected
            if(socket->remoteIpAddr.length != sizeof(Ipv4Addr))
               continue;
            //Filter out non-matching addresses
            if(socket->remoteIpAddr.ipv4Addr != pseudoHeader->ipv4Data.srcAddr)
               continue;
         }
      }
      else
#endif
#if (IPV6_SUPPORT == ENABLED)
      //An IPv6 packet was received?
      if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
      {
         //Check protocol field
         if(socket->protocol != pseudoHeader->ipv6Data.nextHeader)
            continue;
         //Destination IP address filtering
         if(socket->localIpAddr.length)
         {
            //An IPv6 address is expected
            if(socket->localIpAddr.length != sizeof(Ipv6Addr))
               continue;
            //Filter out non-matching addresses
            if(!ipv6CompAddr(&socket->localIpAddr.ipv6Addr, &pseudoHeader->ipv6Data.destAddr))
               continue;
         }
         //Source IP address filtering
         if(socket->remoteIpAddr.length)
         {
            //An IPv6 address is expected
            if(socket->remoteIpAddr.length != sizeof(Ipv6Addr))
               continue;
            //Filter out non-matching addresses
            if(!ipv6CompAddr(&socket->remoteIpAddr.ipv6Addr, &pseudoHeader->ipv6Data.srcAddr))
               continue;
         }
      }
      else
#endif
      //An invalid packet was received?
      {
         //This should never occur...
         continue;
      }

      //The current socket meets all the criteria
      break;
   }

   //Drop incoming packet if no matching socket was found
   if(i >= SOCKET_MAX_COUNT)
   {
      //Leave critical section
      osMutexRelease(socketMutex);
      //Unreachable protocol...
      return ERROR_PROTOCOL_UNREACHABLE;
   }

   //Empty receive queue?
   if(!socket->receiveQueue)
   {
      //Allocate a memory buffer to hold the data and the associated descriptor
      p = chunkedBufferAlloc(sizeof(SocketQueueItem) + length);

      //Successful memory allocation?
      if(p != NULL)
      {
         //Point to the newly created item
         queueItem = chunkedBufferAt(p, 0);
         queueItem->buffer = p;
         //Add the newly created item to the queue
         socket->receiveQueue = queueItem;
      }
      else
      {
         //Memory allocation failed
         queueItem = NULL;
      }
   }
   else
   {
      //Point to the very first item
      queueItem = socket->receiveQueue;
      //Reach the last item in the receive queue
      for(i = 1; queueItem->next; i++)
         queueItem = queueItem->next;

      //Make sure the receive queue is not full
      if(i >= RAW_SOCKET_RX_QUEUE_SIZE)
      {
         //Leave critical section
         osMutexRelease(socketMutex);
         //Notify the calling function that the queue is full
         return ERROR_RECEIVE_QUEUE_FULL;
      }

      //Allocate a memory buffer to hold the data and the associated descriptor
      p = chunkedBufferAlloc(sizeof(SocketQueueItem) + length);

      //Successful memory allocation?
      if(p != NULL)
      {
         //Add the newly created item to the queue
         queueItem->next = chunkedBufferAt(p, 0);
         //Point to the newly created item
         queueItem = queueItem->next;
         queueItem->buffer = p;
      }
      else
      {
         //Memory allocation failed
         queueItem = NULL;
      }
   }

   //Failed to allocate memory?
   if(!queueItem)
   {
      //Leave critical section
      osMutexRelease(socketMutex);
      //Return error code
      return ERROR_OUT_OF_MEMORY;
   }

   //Initialize next field
   queueItem->next = NULL;
   //Port number is unused
   queueItem->srcPort = 0;

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 remote address?
   if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
   {
      //Save the source IPv4 address
      queueItem->srcIpAddr.length = sizeof(Ipv4Addr);
      queueItem->srcIpAddr.ipv4Addr = pseudoHeader->ipv4Data.srcAddr;
      //Save the destination IPv4 address
      queueItem->destIpAddr.length = sizeof(Ipv4Addr);
      queueItem->destIpAddr.ipv4Addr = pseudoHeader->ipv4Data.destAddr;
   }
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 remote address?
   if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
   {
      //Save the source IPv6 address
      queueItem->srcIpAddr.length = sizeof(Ipv6Addr);
      queueItem->srcIpAddr.ipv6Addr = pseudoHeader->ipv6Data.srcAddr;
      //Save the destination IPv6 address
      queueItem->destIpAddr.length = sizeof(Ipv6Addr);
      queueItem->destIpAddr.ipv6Addr = pseudoHeader->ipv6Data.destAddr;
   }
#endif

   //Offset to the raw datagram
   queueItem->offset = sizeof(SocketQueueItem);
   //Copy the raw data
   chunkedBufferCopy(queueItem->buffer, queueItem->offset, buffer, offset, length);

   //Notify user that data is available
   rawSocketUpdateEvents(socket);

   //Leave critical section
   osMutexRelease(socketMutex);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send an raw datagram
 * @param[in] socket Handle referencing the socket
 * @param[in] destIpAddr IP address of the target host
 * @param[in] data Pointer to raw data
 * @param[in] length Length of the raw data
 * @param[out] written Actual number of bytes written (optional parameter)
 * @return Error code
 **/

error_t rawSocketSendDatagram(Socket *socket, const IpAddr *destIpAddr,
   const void *data, size_t length, size_t *written)
{
   error_t error;
   size_t offset;
   uint_t timeToLive;
   ChunkedBuffer *buffer;
   NetInterface *interface;
   IpPseudoHeader pseudoHeader;

   //The socket may be bound to a particular network interface
   interface = socket->interface;

   //Allocate a buffer memory to hold the raw datagram
   buffer = ipAllocBuffer(0, &offset);
   //Failed to allocate memory?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Start of exception handling block
   do
   {
      //Copy the raw data
      error = chunkedBufferAppend(buffer, data, length);
      //Any error to report?
      if(error) break;

#if (IPV4_SUPPORT == ENABLED)
      //Destination address is an IPv4 address?
      if(destIpAddr->length == sizeof(Ipv4Addr))
      {
         Ipv4Addr srcIpAddr;

         //Select the source IPv4 address and the relevant network interface
         //to use when sending data to the specified destination host
         error = ipv4SelectSourceAddr(&interface, destIpAddr->ipv4Addr, &srcIpAddr);
         //Any error to report?
         if(error) break;

         //Format IPv4 pseudo header
         pseudoHeader.length = sizeof(Ipv4PseudoHeader);
         pseudoHeader.ipv4Data.srcAddr = srcIpAddr;
         pseudoHeader.ipv4Data.destAddr = destIpAddr->ipv4Addr;
         pseudoHeader.ipv4Data.reserved = 0;
         pseudoHeader.ipv4Data.protocol = socket->protocol;
         pseudoHeader.ipv4Data.length = htons(length);

         //Set TTL value
         timeToLive = IPV4_DEFAULT_TTL;
      }
      else
#endif
#if (IPV6_SUPPORT == ENABLED)
      //Destination address is an IPv6 address?
      if(destIpAddr->length == sizeof(Ipv6Addr))
      {
         //Select the source IPv6 address and the relevant network interface
         //to use when sending data to the specified destination host
         error = ipv6SelectSourceAddr(&interface,
            &destIpAddr->ipv6Addr, &pseudoHeader.ipv6Data.srcAddr);

         //Any error to report?
         if(error) break;

         //Format IPv6 pseudo header
         pseudoHeader.length = sizeof(Ipv6PseudoHeader);
         pseudoHeader.ipv6Data.destAddr = destIpAddr->ipv6Addr;
         pseudoHeader.ipv6Data.length = htonl(length);
         pseudoHeader.ipv6Data.reserved = 0;
         pseudoHeader.ipv6Data.nextHeader = socket->protocol;

         //Set Hop Limit value
         timeToLive = IPV6_DEFAULT_HOP_LIMIT;
      }
      else
#endif
      //Invalid destination address?
      {
         //An internal error has occurred
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Send raw datagram
      error = ipSendDatagram(interface, &pseudoHeader, buffer, offset, timeToLive);
      //Failed to send data?
      if(error) break;

      //Total number of bytes successfully transmitted
      if(written != NULL) *written = length;

      //End of exception handling block
   } while(0);

   //Free previously allocated memory block
   chunkedBufferFree(buffer);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Receive data from a raw socket
 * @param[in] socket Handle referencing the socket
 * @param[out] srcIpAddr Source IP address (optional)
 * @param[out] destIpAddr Destination IP address (optional)
 * @param[out] data Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @param[out] received Number of bytes that have been received
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t rawSocketReceiveDatagram(Socket *socket, IpAddr *srcIpAddr,
   IpAddr *destIpAddr, void *data, size_t size, size_t *received, uint_t flags)
{
   SocketQueueItem *queueItem;

   //The receive queue is empty?
   if(!socket->receiveQueue)
   {
      //Set the events the application is interested in
      socket->eventMask = SOCKET_EVENT_RX_READY;
      //Reset the event object
      osEventReset(socket->event);
      //Leave critical section
      osMutexRelease(socketMutex);
      //Wait until an event is triggered
      osEventWait(socket->event, socket->timeout);
      //Enter critical section
      osMutexAcquire(socketMutex);
   }

   //Check whether the read operation timed out
   if(!socket->receiveQueue)
   {
      //No data can be read
      *received = 0;
      //Report a timeout error
      return ERROR_TIMEOUT;
   }

   //Point to the first item in the receive queue
   queueItem = socket->receiveQueue;
   //Copy data to user buffer
   *received = chunkedBufferRead(data, queueItem->buffer, queueItem->offset, size);

   //Save the source IP address
   if(srcIpAddr)
      *srcIpAddr = queueItem->srcIpAddr;
   //Save the destination IP address
   if(destIpAddr)
      *destIpAddr = queueItem->destIpAddr;

   //If the SOCKET_FLAG_PEEK flag is set, the data is copied
   //into the buffer but is not removed from the input queue
   if(!(flags & SOCKET_FLAG_PEEK))
   {
      //Remove the item from the receive queue
      socket->receiveQueue = queueItem->next;
      //Deallocate memory buffer
      chunkedBufferFree(queueItem->buffer);
   }

   //Update the state of events
   rawSocketUpdateEvents(socket);

   //Successful read operation
   return NO_ERROR;
}


/**
 * @brief Update event state for raw sockets
 * @param[in] socket Handle referencing the socket
 **/

void rawSocketUpdateEvents(Socket *socket)
{
   //Clear event flags
   socket->eventFlags = 0;

   //The socket is marked as readable if a datagram is pending in the queue
   if(socket->receiveQueue)
      socket->eventFlags |= SOCKET_EVENT_RX_READY;

   //Handle link up and link down events
   if(socket->interface->linkState)
      socket->eventFlags |= SOCKET_EVENT_LINK_UP;
   else
      socket->eventFlags |= SOCKET_EVENT_LINK_DOWN;

   //Mask unused events
   socket->eventFlags &= socket->eventMask;

   //Any event to signal?
   if(socket->eventFlags)
   {
      //Unblock I/O operations currently in waiting state
      osEventSet(socket->event);

      //Set user event to signaled state if necessary
      if(socket->userEvent != NULL)
         osEventSet(socket->userEvent);
   }
}

#endif
