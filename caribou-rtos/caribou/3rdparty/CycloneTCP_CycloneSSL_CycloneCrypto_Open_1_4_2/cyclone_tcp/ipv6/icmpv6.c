/**
 * @file icmpv6.c
 * @brief ICMPv6 (Internet Control Message Protocol Version 6)
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
 * ICMPv6 is used by IPv6 nodes to report errors encountered in
 * processing packets, and to perform other Internet-layer functions.
 * ICMPv6 is an integral part of IPv6 and must be fully implemented
 * by every IPv6 node. Refer to the RFC 2463 for more details
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL ICMPV6_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "ip.h"
#include "ipv6.h"
#include "icmpv6.h"
#include "mld.h"
#include "ndp.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED)


/**
 * @brief Incoming ICMPv6 message processing
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv6 pseudo header
 * @param[in] buffer Multi-part buffer containing the incoming ICMPv6 message
 * @param[in] offset Offset to the first byte of the ICMPv6 message
 * @param[in] hopLimit Hop Limit field from IPv6 header
 **/

void icmpv6ProcessMessage(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit)
{
   size_t length;
   Icmpv6Header *header;

   //Retrieve the length of the ICMPv6 message
   length = chunkedBufferGetLength(buffer) - offset;

   //Ensure the message length is correct
   if(length < sizeof(Icmpv6Header))
   {
      //Debug message
      TRACE_WARNING("ICMPv6 message length is invalid!\r\n");
      //Exit immediately
      return;
   }

   //Point to the ICMPv6 message header
   header = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!header) return;

   //Debug message
   TRACE_INFO("ICMPv6 message received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   icmpv6DumpMessage(header);

   //Verify checksum value
   if(ipCalcUpperLayerChecksumEx(pseudoHeader,
      sizeof(Ipv6PseudoHeader), buffer, offset, length) != 0xFFFF)
   {
      //Debug message
      TRACE_WARNING("Wrong ICMPv6 header checksum!\r\n");
      //Exit immediately
      return;
   }

   //Check the type of message
   switch(header->type)
   {
   //Echo Request message?
   case ICMPV6_TYPE_ECHO_REQUEST:
      //Process Echo Request message
      icmpv6ProcessEchoRequest(interface, pseudoHeader, buffer, offset);
      break;
#if (MLD_SUPPORT == ENABLED)
   //Multicast Listener Query message?
   case ICMPV6_TYPE_MULTICAST_LISTENER_QUERY:
      //Process Multicast Listener Query message
      mldProcessListenerQuery(interface, pseudoHeader, buffer, offset, hopLimit);
      break;
   //Version 1 Multicast Listener Report message?
   case ICMPV6_TYPE_MULTICAST_LISTENER_REPORT_V1:
      //Process Version 1 Multicast Listener Report message
      mldProcessListenerReport(interface, pseudoHeader, buffer, offset, hopLimit);
      break;
#endif
#if (NDP_SUPPORT == ENABLED)
   //Neighbor Solicitation message?
   case ICMPV6_TYPE_NEIGHBOR_SOL:
      //Process Neighbor Solicitation message
      ndpProcessNeighborSol(interface, pseudoHeader, buffer, offset, hopLimit);
      break;
   //Neighbor Advertisement message?
   case ICMPV6_TYPE_NEIGHBOR_ADV:
      //Process Neighbor Advertisement message
      ndpProcessNeighborAdv(interface, pseudoHeader, buffer, offset, hopLimit);
      break;
#endif
   //Unknown type?
   default:
      //Debug message
      TRACE_WARNING("Unknown ICMPv6 message type!\r\n");
      //Discard incoming ICMPv6 message
      break;
   }
}


/**
 * @brief Echo Request message processing
 * @param[in] interface Underlying network interface
 * @param[in] requestPseudoHeader IPv6 pseudo header
 * @param[in] request Multi-part buffer containing the incoming Echo Request message
 * @param[in] requestOffset Offset to the first byte of the Echo Request message
 **/

void icmpv6ProcessEchoRequest(NetInterface *interface, Ipv6PseudoHeader *requestPseudoHeader,
   const ChunkedBuffer *request, size_t requestOffset)
{
   error_t error;
   size_t requestLength;
   size_t replyOffset;
   size_t replyLength;
   ChunkedBuffer *reply;
   Icmpv6EchoMessage *requestHeader;
   Icmpv6EchoMessage *replyHeader;
   Ipv6PseudoHeader replyPseudoHeader;

   //Retrieve the length of the Echo Request message
   requestLength = chunkedBufferGetLength(request) - requestOffset;

   //Ensure the packet length is correct
   if(requestLength < sizeof(Icmpv6EchoMessage))
      return;

   //Point to the Echo Request header
   requestHeader = chunkedBufferAt(request, requestOffset);
   //Sanity check
   if(!requestHeader) return;

   //Debug message
   TRACE_INFO("ICMPv6 Echo Request message received (%" PRIuSIZE " bytes)...\r\n", requestLength);
   //Dump message contents for debugging purpose
   icmpv6DumpEchoMessage(requestHeader);

   //Allocate memory to hold the Echo Reply message
   reply = ipAllocBuffer(sizeof(Icmpv6EchoMessage), &replyOffset);
   //Failed to allocate memory?
   if(!reply) return;

   //Point to the Echo Reply header
   replyHeader = chunkedBufferAt(reply, replyOffset);

   //Format Echo Reply header
   replyHeader->type = ICMPV6_TYPE_ECHO_REPLY;
   replyHeader->code = 0;
   replyHeader->checksum = 0;
   replyHeader->identifier = requestHeader->identifier;
   replyHeader->sequenceNumber = requestHeader->sequenceNumber;

   //Point to the first data byte
   requestOffset += sizeof(Icmpv6EchoMessage);
   requestLength -= sizeof(Icmpv6EchoMessage);

   //Copy data
   error = chunkedBufferConcat(reply, request, requestOffset, requestLength);
   //Any error to report?
   if(error)
   {
      //Clean up side effects
      chunkedBufferFree(reply);
      //Exit immediately
      return;
   }

   //Get the length of the resulting message
   replyLength = chunkedBufferGetLength(reply) - replyOffset;

   //Format IPv6 pseudo header
   replyPseudoHeader.srcAddr = requestPseudoHeader->destAddr;
   replyPseudoHeader.destAddr = requestPseudoHeader->srcAddr;
   replyPseudoHeader.length = htonl(replyLength);
   replyPseudoHeader.reserved = 0;
   replyPseudoHeader.nextHeader = IPV6_ICMPV6_HEADER;

   //Message checksum calculation
   replyHeader->checksum = ipCalcUpperLayerChecksumEx(&replyPseudoHeader,
      sizeof(Ipv6PseudoHeader), reply, replyOffset, replyLength);

   //Debug message
   TRACE_INFO("Sending ICMPv6 Echo Reply message (%" PRIuSIZE " bytes)...\r\n", replyLength);
   //Dump message contents for debugging purpose
   icmpv6DumpEchoMessage(replyHeader);

   //Send Echo Reply message
   ipv6SendDatagram(interface, &replyPseudoHeader, reply, replyOffset, IPV6_DEFAULT_HOP_LIMIT);

   //Free previously allocated memory block
   chunkedBufferFree(reply);
}


/**
 * @brief Send an ICMPv6 Error message
 * @param[in] interface Underlying network interface
 * @param[in] type Message type
 * @param[in] code Specific message code
 * @param[in] parameter Specific message parameter
 * @param[in] ipPacket Multi-part buffer that holds the invoking IPv6 packet
 * @return Error code
 **/

error_t icmpv6SendErrorMessage(NetInterface *interface, uint8_t type,
   uint8_t code, uint32_t parameter, const ChunkedBuffer *ipPacket)
{
   error_t error;
   size_t offset;
   size_t length;
   Ipv6Header *ipHeader;
   ChunkedBuffer *icmpMessage;
   Icmpv6ErrorMessage *icmpHeader;
   Ipv6PseudoHeader pseudoHeader;

   //Retrieve the length of the invoking IPv6 packet
   length = chunkedBufferGetLength(ipPacket);

   //Check the length of the IPv6 packet
   if(length < sizeof(Ipv6Header))
      return ERROR_INVALID_LENGTH;

   //Point to the header of the invoking packet
   ipHeader = chunkedBufferAt(ipPacket, 0);
   //Sanity check
   if(!ipHeader) return ERROR_FAILURE;

   //Never respond to a packet destined to an IPv6 multicast address
   if(ipv6IsMulticastAddr(&ipHeader->destAddr))
      return ERROR_INVALID_ADDRESS;

   //Return as much of invoking IPv6 packet as possible without
   //the ICMPv6 packet exceeding the minimum IPv6 MTU
   length = min(length, IPV6_DEFAULT_MTU -
      sizeof(Ipv6Header) - sizeof(Icmpv6ErrorMessage));

   //Allocate a memory buffer to hold the ICMPv6 message
   icmpMessage = ipAllocBuffer(sizeof(Icmpv6ErrorMessage), &offset);
   //Failed to allocate memory?
   if(!icmpMessage) return ERROR_OUT_OF_MEMORY;

   //Point to the ICMPv6 header
   icmpHeader = chunkedBufferAt(icmpMessage, offset);

   //Format ICMPv6 Error message
   icmpHeader->type = type;
   icmpHeader->code = code;
   icmpHeader->checksum = 0;
   icmpHeader->parameter = htonl(parameter);

   //Copy incoming IPv6 packet contents
   error = chunkedBufferConcat(icmpMessage, ipPacket, 0, length);
   //Any error to report?
   if(error)
   {
      //Clean up side effects
      chunkedBufferFree(icmpMessage);
      //Exit immediately
      return error;
   }

   //Get the length of the resulting message
   length = chunkedBufferGetLength(icmpMessage) - offset;

   //Format IPv6 pseudo header
   pseudoHeader.srcAddr = ipHeader->destAddr;
   pseudoHeader.destAddr = ipHeader->srcAddr;
   pseudoHeader.length = htonl(length);
   pseudoHeader.reserved = 0;
   pseudoHeader.nextHeader = IPV6_ICMPV6_HEADER;

   //Message checksum calculation
   icmpHeader->checksum = ipCalcUpperLayerChecksumEx(&pseudoHeader,
      sizeof(Ipv6PseudoHeader), icmpMessage, offset, length);

   //Debug message
   TRACE_INFO("Sending ICMPv6 Error message (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message contents for debugging purpose
   icmpv6DumpErrorMessage(icmpHeader);

   //Send ICMPv6 Error message
   error = ipv6SendDatagram(interface, &pseudoHeader,
      icmpMessage, offset, IPV6_DEFAULT_HOP_LIMIT);

   //Free previously allocated memory
   chunkedBufferFree(icmpMessage);
   //Return status code
   return error;
}


/**
 * @brief Dump ICMPv6 message for debugging purpose
 * @param[in] message Pointer to the ICMP message
 **/

void icmpv6DumpMessage(const Icmpv6Header *message)
{
   //Dump ICMPv6 message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
}


/**
 * @brief Dump ICMPv6 Echo Request of Echo Reply message
 * @param[in] message Pointer to the ICMPv6 message
 **/

void icmpv6DumpEchoMessage(const Icmpv6EchoMessage *message)
{
   //Dump ICMPv6 message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
   TRACE_DEBUG("  Identifier = 0x%04" PRIX16 "\r\n", ntohs(message->identifier));
   TRACE_DEBUG("  Sequence Number = 0x%04" PRIX16 "\r\n", ntohs(message->sequenceNumber));
}


/**
 * @brief Dump generic ICMPv6 Error message
 * @param[in] message Pointer to the ICMPv6 message
 **/

void icmpv6DumpErrorMessage(const Icmpv6ErrorMessage *message)
{
   //Dump ICMP message
   TRACE_DEBUG("  Type = %" PRIu8 "\r\n", message->type);
   TRACE_DEBUG("  Code = %" PRIu8 "\r\n", message->code);
   TRACE_DEBUG("  Checksum = 0x%04" PRIX16 "\r\n", ntohs(message->checksum));
   TRACE_DEBUG("  Parameter = %" PRIu32 "\r\n", ntohl(message->parameter));
}

#endif
