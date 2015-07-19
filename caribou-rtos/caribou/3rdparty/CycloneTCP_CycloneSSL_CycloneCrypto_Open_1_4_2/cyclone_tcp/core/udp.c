/**
 * @file udp.c
 * @brief UDP (User Datagram Protocol)
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
#define TRACE_LEVEL UDP_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "ip.h"
#include "ipv4.h"
#include "ipv6.h"
#include "udp.h"
#include "socket.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (UDP_SUPPORT == ENABLED)

//Mutex to prevent simultaneous access to the callback table
static OsMutex *udpCallbackMutex;
//Table that holds the registered user callbacks
static UdpRxCallbackDesc udpCallbackTable[UDP_CALLBACK_TABLE_SIZE];


/**
 * @brief UDP related initialization
 * @return Error code
 **/

error_t udpInit(void)
{
   //Create a mutex to prevent simultaneous access to the callback table
   udpCallbackMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(udpCallbackMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Initialize callback table
   memset(udpCallbackTable, 0, sizeof(udpCallbackTable));
   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Incoming UDP datagram processing
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader UDP pseudo header
 * @param[in] buffer Multi-part buffer containing the incoming UDP datagram
 * @param[in] offset Offset to the first byte of the UDP header
 * @return Error code
 **/

error_t udpProcessDatagram(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, const ChunkedBuffer *buffer, size_t offset)
{
   error_t error;
   uint_t i;
   size_t length;
   UdpHeader *header;
   Socket *socket;
   SocketQueueItem *queueItem;
   ChunkedBuffer *p;

   //Retrieve the length of the UDP datagram
   length = chunkedBufferGetLength(buffer) - offset;

   //Ensure the UDP header is valid
   if(length < sizeof(UdpHeader))
   {
      //Debug message
      TRACE_WARNING("UDP datagram length is invalid!\r\n");
      //Report an error
      return ERROR_INVALID_HEADER;
   }

   //Point to the UDP header
   header = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!header) return ERROR_FAILURE;

   //Debug message
   TRACE_INFO("UDP datagram received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump UDP header contents for debugging purpose
   udpDumpHeader(header);

   //When UDP runs over IPv6, the checksum is mandatory
   if(header->checksum || pseudoHeader->length == sizeof(Ipv6PseudoHeader))
   {
      //Verify UDP checksum
      if(ipCalcUpperLayerChecksumEx(pseudoHeader->data,
         pseudoHeader->length, buffer, offset, length) != 0xFFFF)
      {
         //Debug message
         TRACE_WARNING("Wrong UDP header checksum!\r\n");
         //Report an error
         return ERROR_WRONG_CHECKSUM;
      }
   }

   //Enter critical section
   osMutexAcquire(socketMutex);

   //Loop through opened sockets
   for(i = 0; i < SOCKET_MAX_COUNT; i++)
   {
      //Point to the current socket
      socket = socketTable + i;

      //UDP socket found?
      if(socket->type != SOCKET_TYPE_DGRAM)
         continue;
      //Check whether the socket is bound to a particular interface
      if(socket->interface && socket->interface != interface)
         continue;
      //Check destination port number
      if(socket->localPort != ntohs(header->destPort))
         continue;
      //Source port number filtering
      if(socket->remotePort && socket->remotePort != ntohs(header->srcPort))
         continue;

#if (IPV4_SUPPORT == ENABLED)
      //An IPv4 packet was received?
      if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
      {
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

   //Point to the payload
   offset += sizeof(UdpHeader);
   length -= sizeof(UdpHeader);

   //No matching socket found?
   if(i >= SOCKET_MAX_COUNT)
   {
      //Leave critical section
      osMutexRelease(socketMutex);
      //Invoke user callback, if any
      error = udpInvokeRxCallback(interface, pseudoHeader, header, buffer, offset);
      //Return status code
      return error;
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
      if(i >= UDP_RX_QUEUE_SIZE)
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
   //Record the source port number
   queueItem->srcPort = ntohs(header->srcPort);

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

   //Offset to the payload
   queueItem->offset = sizeof(SocketQueueItem);
   //Copy the payload
   chunkedBufferCopy(queueItem->buffer, queueItem->offset, buffer, offset, length);

   //Notify user that data is available
   udpUpdateEvents(socket);

   //Leave critical section
   osMutexRelease(socketMutex);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send a UDP datagram
 * @param[in] socket Handle referencing the socket
 * @param[in] destIpAddr IP address of the target host
 * @param[in] destPort Target port number
 * @param[in] data Pointer to data payload
 * @param[in] length Length of the payload data
 * @param[out] written Actual number of bytes written (optional parameter)
 * @return Error code
 **/

error_t udpSendDatagram(Socket *socket, const IpAddr *destIpAddr,
   uint16_t destPort, const void *data, size_t length, size_t *written)
{
   error_t error;
   size_t offset;
   ChunkedBuffer *buffer;

   //Allocate a memory buffer to hold the UDP datagram
   buffer = udpAllocBuffer(0, &offset);
   //Failed to allocate buffer?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Copy data payload
   error = chunkedBufferAppend(buffer, data, length);

   //Successful processing?
   if(!error)
   {
      //Send UDP datagram
      error = udpSendDatagramEx(socket->interface, socket->localPort,
         destIpAddr, destPort, buffer, offset, socket->ttl);
   }

   //Successful processing?
   if(!error)
   {
      //Total number of data bytes successfully transmitted
      if(written != NULL)
         *written = length;
   }

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Send a UDP datagram (raw interface)
 * @param[in] interface Underlying network interface
 * @param[in] srcPort Source port
 * @param[in] destIpAddr IP address of the target host
 * @param[in] destPort Target port number
 * @param[in] buffer Multi-part buffer containing the payload
 * @param[in] offset Offset to the first payload byte
 * @param[in] ttl TTL value. Default Time-To-Live is used when this parameter is zero
 * @return Error code
 **/

error_t udpSendDatagramEx(NetInterface *interface, uint16_t srcPort, const IpAddr *destIpAddr,
   uint16_t destPort, ChunkedBuffer *buffer, size_t offset, uint8_t ttl)
{
   error_t error;
   size_t length;
   UdpHeader *header;
   IpPseudoHeader pseudoHeader;

   //Make room for the UDP header
   offset -= sizeof(UdpHeader);
   //Retrieve the length of the datagram
   length = chunkedBufferGetLength(buffer) - offset;

   //Point to the UDP header
   header = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!header) return ERROR_FAILURE;

   //Format UDP header
   header->srcPort = htons(srcPort);
   header->destPort = htons(destPort);
   header->length = htons(length);
   header->checksum = 0;

#if (IPV4_SUPPORT == ENABLED)
   //Destination address is an IPv4 address?
   if(destIpAddr->length == sizeof(Ipv4Addr))
   {
      Ipv4Addr srcIpAddr;

      //Select the source IPv4 address and the relevant network interface
      //to use when sending data to the specified destination host
      error = ipv4SelectSourceAddr(&interface, destIpAddr->ipv4Addr, &srcIpAddr);
      //Any error to report?
      if(error) return error;

      //Format IPv4 pseudo header
      pseudoHeader.length = sizeof(Ipv4PseudoHeader);
      pseudoHeader.ipv4Data.srcAddr = srcIpAddr;
      pseudoHeader.ipv4Data.destAddr = destIpAddr->ipv4Addr;
      pseudoHeader.ipv4Data.reserved = 0;
      pseudoHeader.ipv4Data.protocol = IPV4_PROTOCOL_UDP;
      pseudoHeader.ipv4Data.length = htons(length);

      //Calculate UDP header checksum
      header->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader.ipv4Data,
         sizeof(Ipv4PseudoHeader), buffer, offset, length);
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
      if(error) return error;

      //Format IPv6 pseudo header
      pseudoHeader.length = sizeof(Ipv6PseudoHeader);
      pseudoHeader.ipv6Data.destAddr = destIpAddr->ipv6Addr;
      pseudoHeader.ipv6Data.length = htonl(length);
      pseudoHeader.ipv6Data.reserved = 0;
      pseudoHeader.ipv6Data.nextHeader = IPV6_UDP_HEADER;

      //Calculate UDP header checksum
      header->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader.ipv6Data,
         sizeof(Ipv6PseudoHeader), buffer, offset, length);
   }
   else
#endif
   //Invalid destination address?
   {
      //An internal error has occurred
      return ERROR_FAILURE;
   }

   //Debug message
   TRACE_INFO("Sending UDP datagram (%" PRIuSIZE " bytes)\r\n", length);
   //Dump UDP header contents for debugging purpose
   udpDumpHeader(header);

   //Send UDP datagram
   return ipSendDatagram(interface, &pseudoHeader, buffer, offset, ttl);
}


/**
 * @brief Receive data from a UDP socket
 * @param[in] socket Handle referencing the socket
 * @param[out] srcIpAddr Source IP address (optional)
 * @param[out] srcPort Source port number (optional)
 * @param[out] destIpAddr Destination IP address (optional)
 * @param[out] data Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @param[out] received Number of bytes that have been received
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t udpReceiveDatagram(Socket *socket, IpAddr *srcIpAddr, uint16_t *srcPort,
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
   //Save the source port number
   if(srcPort)
      *srcPort = queueItem->srcPort;
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
   udpUpdateEvents(socket);

   //Successful read operation
   return NO_ERROR;
}


/**
 * @brief Allocate a buffer to hold a UDP packet
 * @param[in] length Desired payload length
 * @param[out] offset Offset to the first byte of the payload
 * @return The function returns a pointer to the newly allocated
 *   buffer. If the system is out of resources, NULL is returned
 **/

ChunkedBuffer *udpAllocBuffer(size_t length, size_t *offset)
{
   ChunkedBuffer *buffer;

   //Allocate a buffer to hold the UDP header and the payload
   buffer = ipAllocBuffer(length + sizeof(UdpHeader), offset);
   //Failed to allocate buffer?
   if(!buffer) return NULL;

   //Offset to the first byte of the payload
   *offset += sizeof(UdpHeader);

   //Return a pointer to the freshly allocated buffer
   return buffer;
}


/**
 * @brief Update UDP related events
 * @param[in] socket Handle referencing the socket
 **/

void udpUpdateEvents(Socket *socket)
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


/**
 * @brief Register user callback
 * @param[in] interface Underlying network interface
 * @param[in] port UDP port number
 * @param[in] callback Callback function to be called when a datagram is received
 * @param[in] params Callback function parameter (optional)
 * @return Error code
 **/

error_t udpAttachRxCallback(NetInterface *interface,
   uint16_t port, UdpRxCallback callback, void *params)
{
   uint_t i;
   UdpRxCallbackDesc *entry;

   //Acquire exclusive access to the callback table
   osMutexAcquire(udpCallbackMutex);

   //Loop through the table
   for(i = 0; i < UDP_CALLBACK_TABLE_SIZE; i++)
   {
      //Point to the current entry
      entry = &udpCallbackTable[i];

      //Check whether the entry is currently in used
      if(entry->callback == NULL)
      {
         //Create a new entry
         entry->interface = interface;
         entry->port = port;
         entry->callback = callback;
         entry->params = params;
         //We are done
         break;
      }
   }

   //Release exclusive access to the callback table
   osMutexRelease(udpCallbackMutex);

   //Failed to attach the specified user callback?
   if(i >= UDP_CALLBACK_TABLE_SIZE)
      return ERROR_OUT_OF_RESOURCES;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Unregister user callback
 * @param[in] interface Underlying network interface
 * @param[in] port UDP port number
 * @return Error code
 **/

error_t udpDetachRxCallback(NetInterface *interface, uint16_t port)
{
   uint_t i;
   UdpRxCallbackDesc *entry;

   //This flag tells whether an entry has been found
   bool_t found = FALSE;

   //Acquire exclusive access to the callback table
   osMutexAcquire(udpCallbackMutex);

   //Loop through the table
   for(i = 0; i < UDP_CALLBACK_TABLE_SIZE; i++)
   {
      //Point to the current entry
      entry = &udpCallbackTable[i];

      //Check whether the entry is currently in used
      if(entry->callback != NULL)
      {
         //Does the specified port number match the current entry?
         if(entry->port == port && entry->interface == interface)
         {
            //Unregister user callback
            entry->callback = NULL;
            //A matching entry was found
            found = TRUE;
         }
      }
   }

   //Release exclusive access to the callback table
   osMutexRelease(udpCallbackMutex);

   //Check whether the specified callback has been successfully unregistered
   return found ? NO_ERROR : ERROR_FAILURE;
}


/**
 * @brief Invoke user callback
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader UDP pseudo header
 * @param[in] header UDP header
 * @param[in] buffer Multi-part buffer containing the payload
 * @param[in] offset Offset to the first byte of the payload
 * @return Error code
 **/

error_t udpInvokeRxCallback(NetInterface *interface, const IpPseudoHeader *pseudoHeader,
   const UdpHeader *header, const ChunkedBuffer *buffer, size_t offset)
{
   uint_t i;
   void *params;
   UdpRxCallbackDesc *entry;

   //This flag tells whether a matching entry has been found
   bool_t found = FALSE;

   //Acquire exclusive access to the callback table
   osMutexAcquire(udpCallbackMutex);

   //Loop through the table
   for(i = 0; i < UDP_CALLBACK_TABLE_SIZE; i++)
   {
      //Point to the current entry
      entry = &udpCallbackTable[i];

      //Check whether the entry is currently in used
      if(entry->callback != NULL)
      {
         //Bound to a particular interface?
         if(entry->interface == NULL || entry->interface == interface)
         {
            //Does the specified port number match the current entry?
            if(entry->port == ntohs(header->destPort))
            {
               //Retrieve callback parameters
               params = entry->params;

               //Release mutex to prevent any deadlock
               if(params == NULL)
                  osMutexRelease(udpCallbackMutex);

               //Invoke user callback function
               entry->callback(interface, pseudoHeader,
                  header, buffer, offset, params);

               //Acquire mutex
               if(params == NULL)
                  osMutexAcquire(udpCallbackMutex);

               //A matching entry was found
               found = TRUE;
            }
         }
      }
   }

   //Release exclusive access to the callback table
   osMutexRelease(udpCallbackMutex);

   //Return status code
   return found ? NO_ERROR : ERROR_PORT_UNREACHABLE;
}


/**
 * @brief Dump UDP header for debugging purpose
 * @param[in] datagram Pointer to the UDP header
 **/

void udpDumpHeader(const UdpHeader *datagram)
{
   //Dump UDP header contents
   TRACE_DEBUG("  Source Port = %" PRIu16 "\r\n", ntohs(datagram->srcPort));
   TRACE_DEBUG("  Destination Port = %" PRIu16 "\r\n", ntohs(datagram->destPort));
   TRACE_DEBUG("  Length = %" PRIu16 "\r\n", ntohs(datagram->length));
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(datagram->checksum));
}

#endif
