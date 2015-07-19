/**
 * @file ping.c
 * @brief Ping utility
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

//Dependencies
#include "tcp_ip_stack.h"
#include "ping.h"
#include "ip.h"
#include "icmp.h"
#include "icmpv6.h"
#include "socket.h"
#include "debug.h"

//Sequence number field
static uint16_t pingSequenceNumber = 0;


/**
 * @brief Test the reachability of a host
 *
 * Ping operates by sending an ICMP Echo Request message to the
 * target host and waiting for an ICMP Echo Reply message
 *
 * @param[in] interface Underlying network interface (optional parameter)
 * @param[in] ipAddr IP address of the host to reach
 * @param[in] timeout Maximum time to wait before giving up
 * @param[out] rtt Round-trip time (optional parameter)
 * @return Error code
 **/

error_t ping(NetInterface *interface, const IpAddr *ipAddr, systime_t timeout, systime_t *rtt)
{
   error_t error;
   uint_t i;
   size_t length;
   uint16_t identifier;
   uint16_t sequenceNumber;
   systime_t startTime;
   systime_t roundTripTime;
   Socket *socket;
   IcmpEchoMessage *message;

   //Debug message
   TRACE_INFO("Pinging %s with 64 bytes of data...\r\n", ipAddrToString(ipAddr, NULL));

   //Length of the complete ICMP message including header and data
   length = sizeof(IcmpEchoMessage) + PING_DATA_SIZE;

   //Allocate memory buffer to hold an ICMP message
   message = osMemAlloc(length);
   //Failed to allocate memory?
   if(!message) return ERROR_OUT_OF_MEMORY;

   //Identifier field is used to help matching requests and replies
   identifier = tcpIpStackGetRand();
   //Sequence Number field is increment each time an Echo Request is sent
   sequenceNumber = osAtomicInc16(&pingSequenceNumber);

   //Format ICMP Echo Request message
   message->type = ICMP_TYPE_ECHO_REQUEST;
   message->code = 0;
   message->checksum = 0;
   message->identifier = identifier;
   message->sequenceNumber = sequenceNumber;

   //Copy data
   for(i = 0; i < PING_DATA_SIZE; i++)
      message->data[i] = i;

#if (IPV4_SUPPORT == ENABLED)
   //Target address is an IPv4 address?
   if(ipAddr->length == sizeof(Ipv4Addr))
   {
      Ipv4Addr srcIpAddr;

      //Select the source IPv4 address and the relevant network
      //interface to use when pinging the specified host
      error = ipv4SelectSourceAddr(&interface, ipAddr->ipv4Addr, &srcIpAddr);

      //Any error to report?
      if(error)
      {
         //Free previously allocated memory
         osMemFree(message);
         //Return the corresponding error code
         return error;
      }

      //ICMP Echo Request message
      message->type = ICMP_TYPE_ECHO_REQUEST;
      //Message checksum calculation
      message->checksum = ipCalcChecksum(message, length);

      //Open a raw socket
      socket = socketOpen(SOCKET_TYPE_RAW, SOCKET_PROTOCOL_ICMP);
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //Target address is an IPv6 address?
   if(ipAddr->length == sizeof(Ipv6Addr))
   {
      Ipv6PseudoHeader pseudoHeader;

      //Select the source IPv6 address and the relevant network
      //interface to use when pinging the specified host
      error = ipv6SelectSourceAddr(&interface, &ipAddr->ipv6Addr, &pseudoHeader.srcAddr);

      //Any error to report?
      if(error)
      {
         //Free previously allocated memory
         osMemFree(message);
         //Return the corresponding error code
         return error;
      }

      //ICMPv6 Echo Request message
      message->type = ICMPV6_TYPE_ECHO_REQUEST;
      //Format IPv6 pseudo header
      pseudoHeader.destAddr = ipAddr->ipv6Addr;
      pseudoHeader.length = htonl(length);
      pseudoHeader.reserved = 0;
      pseudoHeader.nextHeader = IPV6_ICMPV6_HEADER;

      //Message checksum calculation
      message->checksum = ipCalcUpperLayerChecksum(
         &pseudoHeader, sizeof(Ipv6PseudoHeader), message, length);

      //Open a raw socket
      socket = socketOpen(SOCKET_TYPE_RAW, SOCKET_PROTOCOL_ICMPV6);
   }
   else
#endif
   //Target address is not valid?
   {
      //Free previously allocated memory
      osMemFree(message);
      //Report an error
      return ERROR_INVALID_ADDRESS;
   }

   //Failed to open socket?
   if(!socket)
   {
      //Free previously allocated memory
      osMemFree(message);
      //Report an error
      return ERROR_OPEN_FAILED;
   }

   //Associate the newly created socket with the relevant interface
   error = socketBindToInterface(socket, interface);

   //Unable to bind the socket to the desired interface?
   if(error)
   {
      //Free previously allocated memory
      osMemFree(message);
      //Close socket
      socketClose(socket);
      //Return status code
      return error;
   }

   //Connect the socket to the target host
   error = socketConnect(socket, ipAddr, 0);

   //Any error to report?
   if(error)
   {
      //Free previously allocated memory
      osMemFree(message);
      //Close socket
      socketClose(socket);
      //Return status code
      return error;
   }

   //Send Echo Request message
   error = socketSend(socket, message, length, NULL, 0);

   //Failed to send message ?
   if(error)
   {
      //Free previously allocated memory
      osMemFree(message);
      //Close socket
      socketClose(socket);
      //Return status code
      return error;
   }

   //Save the time at which the request was sent
   startTime = osGetTickCount();

   //Timeout value exceeded?
   while((osGetTickCount() - startTime) < timeout)
   {
      //Adjust receive timeout
      error = socketSetTimeout(socket, timeout);
      //Any error to report?
      if(error) break;

      //Wait for an incoming ICMP message
      error = socketReceive(socket, message,
         sizeof(IcmpEchoMessage) + PING_DATA_SIZE, &length, 0);
      //Any error to report?
      if(error) break;

      //Check message length
      if(length != (sizeof(IcmpEchoMessage) + PING_DATA_SIZE))
         continue;
      //Verify message type
      if(ipAddr->length == sizeof(Ipv4Addr) && message->type != ICMP_TYPE_ECHO_REPLY)
         continue;
      if(ipAddr->length == sizeof(Ipv6Addr) && message->type != ICMPV6_TYPE_ECHO_REPLY)
         continue;
      //Response identifier matches request identifier?
      if(message->identifier != identifier)
         continue;
      //Make sure the sequence number is correct
      if(message->sequenceNumber != sequenceNumber)
         continue;

      //Loop through data field
      for(i = 0; i < PING_DATA_SIZE; i++)
      {
         //Compare received data against expected data
         if(message->data[i] != i) break;
      }

      //Valid Echo Reply message received?
      if(i == PING_DATA_SIZE)
      {
         //Calculate round-trip time
         roundTripTime = osGetTickCount() - startTime;
         //Debug message
         TRACE_INFO("Echo received (round-trip time = %" PRIu32 " ms)...\r\n", roundTripTime);

         //Free previously allocated memory
         osMemFree(message);
         //Close socket
         socketClose(socket);

         //Return round-trip time
         if(rtt) *rtt = roundTripTime;

         //No error to report
         return NO_ERROR;
      }
   }

   //Debug message
   TRACE_INFO("No echo received!\r\n");
   //Free previously allocated memory
   osMemFree(message);
   //Close socket
   socketClose(socket);

   //No Echo Reply received from host...
   return ERROR_NO_RESPONSE;
}
