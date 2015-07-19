/**
 * @file ipv6.c
 * @brief IPv6 (Internet Protocol Version 6)
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
 * IP version 6 (IPv6) is a new version of the Internet Protocol, designed
 * as the successor to IP version 4 (IPv4). Refer to RFC 2460
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL IPV6_TRACE_LEVEL

//Dependencies
#include <string.h>
#include <ctype.h>
#include "tcp_ip_stack.h"
#include "ipv6.h"
#include "icmpv6.h"
#include "mld.h"
#include "ndp.h"
#include "udp.h"
#include "tcp_fsm.h"
#include "raw_socket.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED)

//Unspecified IPv6 address
const Ipv6Addr IPV6_UNSPECIFIED_ADDR =
   IPV6_ADDR(0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000);

//Loopback IPv6 address
const Ipv6Addr IPV6_LOOPBACK_ADDR =
   IPV6_ADDR(0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001);

//Link-local all-nodes IPv6 address
const Ipv6Addr IPV6_LINK_LOCAL_ALL_NODES_ADDR =
   IPV6_ADDR(0xFF02, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001);

//Link-local all-routers IPv6 address
const Ipv6Addr IPV6_LINK_LOCAL_ALL_ROUTERS_ADDR =
   IPV6_ADDR(0xFF02, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0002);

//Solicited-node IPv6 address prefix
const Ipv6Addr IPV6_SOLICITED_NODE_ADDR_PREFIX =
   IPV6_ADDR(0xFF02, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001, 0xFF00, 0x0000);


/**
 * @brief IPv6 related initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t ipv6Init(NetInterface *interface)
{
   //Create a mutex to prevent simultaneous access to the IPv6 filter table
   interface->ipv6FilterMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(interface->ipv6FilterMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Clear IPv6 filter table contents
   memset(interface->ipv6Filter, 0, sizeof(interface->ipv6Filter));
   //No entry in the filter table
   interface->ipv6FilterSize = 0;

#if (IPV6_FRAG_SUPPORT == ENABLED)
   //Identification field is used to identify fragments of an original IP datagram
   interface->ipv6Identification = 0;

   //Create a mutex to prevent simultaneous access to the reassembly queue
   interface->ipv6FragQueueMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(interface->ipv6FragQueueMutex == OS_INVALID_HANDLE)
   {
      //Clean up side effects
      osMutexClose(interface->ipv6FilterMutex);
      //Stop immediately
      return ERROR_OUT_OF_RESOURCES;
   }

   //Clear the reassembly queue
   memset(interface->ipv6FragQueue, 0, sizeof(interface->ipv6FragQueue));
#endif

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Configure link-local address
 * @param[in] interface Pointer to the desired network interface
 * @param[in] addr Link-Local address
 * @return Error code
 **/

error_t ipv6SetLinkLocalAddr(NetInterface *interface, const Ipv6Addr *addr)
{
   error_t error;
   Ipv6Addr solicitedNodeAddr;

   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv6IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Check whether the link-local address was already configured
   if(!ipv6CompAddr(&interface->ipv6Config.linkLocalAddr, &IPV6_UNSPECIFIED_ADDR))
   {
      //Form the Solicited-Node address
      error = ipv6ComputeSolicitedNodeAddr(&interface->ipv6Config.linkLocalAddr, &solicitedNodeAddr);
      //Any error to report?
      if(error) return error;

      //Leave the Solicited-Node multicast group
      error = ipv6LeaveMulticastGroup(interface, &solicitedNodeAddr);
      //Any error to report?
      if(error) return error;
   }

   //Set up link-local address
   interface->ipv6Config.linkLocalAddr = *addr;

   //Form the Solicited-Node address for the link-local address
   error = ipv6ComputeSolicitedNodeAddr(&interface->ipv6Config.linkLocalAddr, &solicitedNodeAddr);
   //Any error to report?
   if(error) return error;

   //Join the Solicited-Node multicast group for each assigned address
   error = ipv6JoinMulticastGroup(interface, &solicitedNodeAddr);
   //Return status code
   return error;
}


/**
 * @brief Retrieve link-local address
 * @param[in] interface Pointer to the desired network interface
 * @param[out] addr link-local address
 * @return Error code
 **/

error_t ipv6GetLinkLocalAddr(NetInterface *interface, Ipv6Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get link-local address
   *addr = interface->ipv6Config.linkLocalAddr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure IPv6 prefix
 * @param[in] interface Pointer to the desired network interface
 * @param[in] prefix IPv6 prefix
 * @param[in] length Prefix length
 **/

error_t ipv6SetPrefix(NetInterface *interface, const Ipv6Addr *prefix, uint_t length)
{
   //Check parameters
   if(interface == NULL || prefix == NULL)
      return ERROR_INVALID_PARAMETER;

   //Make sure the prefix length is valid
   if(length >= 128)
      return ERROR_INVALID_PARAMETER;

   //Set up IPv6 prefix
   interface->ipv6Config.prefix = *prefix;
   //Save prefix length
   interface->ipv6Config.prefixLength = length;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Retrieve IPv6 prefix
 * @param[in] interface Pointer to the desired network interface
 * @param[out] prefix IPv6 prefix
 * @param[out] length Prefix length
 * @return Error code
 **/

error_t ipv6GetPrefix(NetInterface *interface, Ipv6Addr *prefix, uint_t *length)
{
   //Check parameters
   if(interface == NULL || prefix == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get IPv6 prefix
   *prefix = interface->ipv6Config.prefix;
   //Get prefix length
   *length = interface->ipv6Config.prefixLength;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure global address
 * @param[in] interface Pointer to the desired network interface
 * @param[in] addr Global address
 * @return Error code
 **/

error_t ipv6SetGlobalAddr(NetInterface *interface, const Ipv6Addr *addr)
{
   error_t error;
   Ipv6Addr solicitedNodeAddr;

   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv6IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Check whether the global address was already configured
   if(!ipv6CompAddr(&interface->ipv6Config.globalAddr, &IPV6_UNSPECIFIED_ADDR))
   {
      //Form the Solicited-Node address
      error = ipv6ComputeSolicitedNodeAddr(&interface->ipv6Config.globalAddr, &solicitedNodeAddr);
      //Any error to report?
      if(error) return error;

      //Leave the Solicited-Node multicast group
      error = ipv6LeaveMulticastGroup(interface, &solicitedNodeAddr);
      //Any error to report?
      if(error) return error;
   }

   //Set up global address
   interface->ipv6Config.globalAddr = *addr;

   //Form the Solicited-Node address for the global address
   error = ipv6ComputeSolicitedNodeAddr(&interface->ipv6Config.globalAddr, &solicitedNodeAddr);
   //Any error to report?
   if(error) return error;

   //Join the Solicited-Node multicast group for each assigned address
   error = ipv6JoinMulticastGroup(interface, &solicitedNodeAddr);
   //Return status code
   return error;
}


/**
 * @brief Retrieve global address
 * @param[in] interface Pointer to the desired network interface
 * @param[out] addr Global address
 * @return Error code
 **/

error_t ipv6GetGlobalAddr(NetInterface *interface, Ipv6Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get global address
   *addr = interface->ipv6Config.globalAddr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure router address
 * @param[in] interface Pointer to the desired network interface
 * @param[in] addr Router address
 * @return Error code
 **/

error_t ipv6SetRouter(NetInterface *interface, const Ipv6Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv6IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Set up router address
   interface->ipv6Config.router = *addr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Retrieve router address
 * @param[in] interface Pointer to the desired network interface
 * @param[out] addr Router address
 * @return Error code
 **/

error_t ipv6GetRouter(NetInterface *interface, Ipv6Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get router address
   *addr = interface->ipv6Config.router;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure DNS server
 * @param[in] interface Pointer to the desired network interface
 * @param[in] num This parameter selects between the primary and secondary DNS server
 * @param[in] addr DNS server address
 * @return Error code
 **/

error_t ipv6SetDnsServer(NetInterface *interface, uint_t num, const Ipv6Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv6IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Set up DNS server address
   if(num < IPV6_MAX_DNS_SERVERS)
      interface->ipv6Config.dnsServer[num] = *addr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Retrieve DNS server
 * @param[in] interface Pointer to the desired network interface
 * @param[in] num This parameter selects between the primary and secondary DNS server
 * @param[out] addr DNS server address
 * @return Error code
 **/

error_t ipv6GetDnsServer(NetInterface *interface, uint_t num, Ipv6Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get DNS server address
   if(num < IPV6_MAX_DNS_SERVERS)
      *addr = interface->ipv6Config.dnsServer[num];
   else
      *addr = IPV6_UNSPECIFIED_ADDR;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Incoming IPv6 packet processing
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer that holds the incoming IPv6 packet
 **/

void ipv6ProcessPacket(NetInterface *interface, ChunkedBuffer *buffer)
{
   error_t error;
   size_t offset;
   size_t length;
   size_t nextHeaderOffset;
   Ipv6Header *packet;
   IpPseudoHeader pseudoHeader;

   //Retrieve the length of the IPv6 packet
   length = chunkedBufferGetLength(buffer);

   //Ensure the packet length is greater than 40 bytes
   if(length < sizeof(Ipv6Header))
      return;

   //Point to the IPv6 header
   packet = chunkedBufferAt(buffer, 0);
   //Sanity check
   if(!packet) return;

   //Debug message
   TRACE_INFO("IPv6 packet received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump IPv6 header contents for debugging purpose
   ipv6DumpHeader(packet);

   //Check IP version number
   if(packet->version != IPV6_VERSION)
      return;
   //Ensure the payload length is correct before processing the packet
   if(ntohs(packet->payloadLength) > (length - sizeof(Ipv6Header)))
      return;
   //Destination address filtering
   if(ipv6CheckDestAddr(interface, &packet->destAddr))
      return;
   //Source address filtering
   if(ipv6CheckSourceAddr(interface, &packet->srcAddr))
      return;

   //Calculate the effective length of the IPv6 packet
   length = sizeof(Ipv6Header) + ntohs(packet->payloadLength);
   //Adjust the length of the multi-part buffer if necessary
   chunkedBufferSetLength(buffer, length);

   //Form the IPv6 pseudo header
   pseudoHeader.length = sizeof(Ipv6PseudoHeader);
   pseudoHeader.ipv6Data.srcAddr = packet->srcAddr;
   pseudoHeader.ipv6Data.destAddr = packet->destAddr;
   pseudoHeader.ipv6Data.reserved = 0;

   //Keep track of Next Header field
   nextHeaderOffset = &packet->nextHeader - (uint8_t *) packet;
   //Point to the first extension header
   offset = sizeof(Ipv6Header);

   //Parse extension headers
   while(offset < length)
   {
      //Retrieve the Next Header field of preceding header
      uint8_t *type = chunkedBufferAt(buffer, nextHeaderOffset);

      //Update IPv6 pseudo header
      pseudoHeader.ipv6Data.length = htonl(length - offset);
      pseudoHeader.ipv6Data.nextHeader = *type;

      //Each extension header is identified by the
      //Next Header field of the preceding header
      switch(*type)
      {
      //Hop-by-Hop Options header?
      case IPV6_HOP_BY_HOP_OPT_HEADER:
         //Parse current extension header
         error = ipv6ParseHopByHopOptHeader(interface, buffer, &offset, &nextHeaderOffset);
         //Continue processing
         break;

      //Destination Options header?
      case IPV6_DEST_OPT_HEADER:
         //Parse current extension header
         error = ipv6ParseDestOptHeader(interface, buffer, &offset, &nextHeaderOffset);
         //Continue processing
         break;

      //Routing header?
      case IPV6_ROUTING_HEADER:
         //Parse current extension header
         error = ipv6ParseRoutingHeader(interface, buffer, &offset, &nextHeaderOffset);
         //Continue processing
         break;

      //Fragment header?
      case IPV6_FRAGMENT_HEADER:
#if (IPV6_FRAG_SUPPORT == ENABLED)
         //Acquire exclusive access to the reassembly queue
         osMutexAcquire(interface->ipv6FragQueueMutex);
         //Parse current extension header
         ipv6ParseFragmentHeader(interface, buffer, offset, nextHeaderOffset);
         //Release exclusive access to the reassembly queue
         osMutexRelease(interface->ipv6FragQueueMutex);
#endif
         //Exit immediately
         return;

      //Authentication header?
      case IPV6_AUTH_HEADER:
         //Parse current extension header
         error = ipv6ParseAuthHeader(interface, buffer, &offset, &nextHeaderOffset);
         //Continue processing
         break;

      //Encapsulating Security Payload header?
      case IPV6_ESP_HEADER:
         //Parse current extension header
         error = ipv6ParseEspHeader(interface, buffer, &offset, &nextHeaderOffset);
         //Continue processing
         break;

      //ICMPv6 header?
      case IPV6_ICMPV6_HEADER:
         //Process incoming ICMPv6 message
         icmpv6ProcessMessage(interface, &pseudoHeader.ipv6Data, buffer, offset, packet->hopLimit);
#if (RAW_SOCKET_SUPPORT == ENABLED)
         //Allow raw sockets to process ICMPv6 messages
         rawSocketProcessDatagram(interface, &pseudoHeader, buffer, offset);
#endif
         //Exit immediately
         return;

#if (TCP_SUPPORT == ENABLED)
      //TCP header?
      case IPV6_TCP_HEADER:
         //Process incoming TCP segment
         tcpProcessSegment(interface, &pseudoHeader, buffer, offset);
         //Exit immediately
         return;
#endif

#if (UDP_SUPPORT == ENABLED)
      //UDP header?
      case IPV6_UDP_HEADER:
         //Process incoming UDP datagram
         udpProcessDatagram(interface, &pseudoHeader, buffer, offset);
         //Exit immediately
         return;
#endif

      //No next header?
      case IPV6_NO_NEXT_HEADER:
         //If the payload length field of the IPv6 header indicates the presence of
         //octets past the end of the previous header, these octets must be ignored
         return;

      //Unrecognized header type?
      default:
         //Debug message
         TRACE_WARNING("Unrecognized Next Header type\r\n");

         //Send an ICMP Parameter Problem message
         icmpv6SendErrorMessage(interface, ICMPV6_TYPE_PARAM_PROBLEM,
            ICMPV6_CODE_UNKNOWN_NEXT_HEADER, nextHeaderOffset, buffer);

         //Discard incoming packet
         return;
      }

      //En error was encountered while processing
      //the current extension header?
      if(error) return;
   }
}


/**
 * @brief Parse Hop-by-Hop Options header
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the IPv6 packet
 * @param[in,out] offset Offset to the Hop-by-Hop Options header
 * @param[in,out] nextHeaderOffset Offset to the Next Header field
 * @brief Error code
 **/

error_t ipv6ParseHopByHopOptHeader(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t *offset, size_t *nextHeaderOffset)
{
   size_t length;
   size_t headerLength;
   Ipv6HopByHopOptHeader *header;

   //Remaining bytes to process in the IPv6 packet
   length = chunkedBufferGetLength(buffer) - *offset;

   //Ensure the extension header is valid
   if(length < sizeof(Ipv6HopByHopOptHeader))
      return ERROR_INVALID_HEADER;

   //Point to the Hop-by-Hop Options header
   header = chunkedBufferAt(buffer, *offset);
   //Calculate the length of the entire header
   headerLength = (header->hdrExtLen * 8) + 8;

   //Check header length
   if(headerLength > length)
      return ERROR_INVALID_HEADER;

   //The Hop-by-Hop Options header, when present, must immediately follow the IPv6 header
   if(*offset != sizeof(Ipv6Header))
   {
      //Debug message
      TRACE_WARNING("Next Header value of zero!\r\n");

      //Send an ICMP Parameter Problem message to the source of
      //the packet if we encounter a Next Header value of zero
      icmpv6SendErrorMessage(interface, ICMPV6_TYPE_PARAM_PROBLEM,
         ICMPV6_CODE_UNKNOWN_NEXT_HEADER, *nextHeaderOffset, buffer);

      //Discard incoming packet
      return ERROR_INVALID_HEADER;
   }

   //Debug message
   TRACE_DEBUG("  Hop-by-Hop Options header\r\n");

   //Keep track of Next Header field
   *nextHeaderOffset = *offset + &header->nextHeader - (uint8_t *) header;
   //Remaining bytes to process in the payload
   *offset += headerLength;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse Destination Options header
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the IPv6 packet
 * @param[in,out] offset Offset to the Destination Options header
 * @param[in,out] nextHeaderOffset Offset to the Next Header field
 * @brief Error code
 **/

error_t ipv6ParseDestOptHeader(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t *offset, size_t *nextHeaderOffset)
{
   size_t length;
   size_t headerLength;
   Ipv6DestOptHeader *header;

   //Remaining bytes to process in the IPv6 packet
   length = chunkedBufferGetLength(buffer) - *offset;

   //Ensure the extension header is valid
   if(length < sizeof(Ipv6DestOptHeader))
      return ERROR_INVALID_HEADER;

   //Point to the Destination Options header
   header = chunkedBufferAt(buffer, *offset);
   //Calculate the length of the entire header
   headerLength = (header->hdrExtLen * 8) + 8;

   //Check header length
   if(headerLength > length)
      return ERROR_INVALID_HEADER;

   //Debug message
   TRACE_DEBUG("  Destination Options header\r\n");

   //Keep track of Next Header field
   *nextHeaderOffset = *offset + &header->nextHeader - (uint8_t *) header;
   //Remaining bytes to process in the payload
   *offset += headerLength;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse Routing header
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the IPv6 packet
 * @param[in,out] offset Offset to the Routing header
 * @param[in,out] nextHeaderOffset Offset to the Next Header field
 * @brief Error code
 **/

error_t ipv6ParseRoutingHeader(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t *offset, size_t *nextHeaderOffset)
{
   size_t length;
   size_t headerLength;
   Ipv6RoutingHeader *header;

   //Remaining bytes to process in the IPv6 packet
   length = chunkedBufferGetLength(buffer) - *offset;

   //Ensure the extension header is valid
   if(length < sizeof(Ipv6RoutingHeader))
      return ERROR_INVALID_HEADER;

   //Point to the Routing header
   header = chunkedBufferAt(buffer, *offset);
   //Calculate the length of the entire header
   headerLength = (header->hdrExtLen * 8) + 8;

   //Check header length
   if(headerLength > length)
      return ERROR_INVALID_HEADER;

   //Debug message
   TRACE_DEBUG("  Routing header\r\n");

   //Keep track of Next Header field
   *nextHeaderOffset = *offset + &header->nextHeader - (uint8_t *) header;
   //Remaining bytes to process in the payload
   *offset += headerLength;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse Authentication header
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the IPv6 packet
 * @param[in,out] offset Offset to the Authentication header
 * @param[in,out] nextHeaderOffset Offset to the Next Header field
 * @brief Error code
 **/

error_t ipv6ParseAuthHeader(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t *offset, size_t *nextHeaderOffset)
{
   //Debug message
   TRACE_DEBUG("  Authentication header\r\n");
   //Authentication not supported
   return ERROR_FAILURE;
}


/**
 * @brief Parse Encapsulating Security Payload header
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the IPv6 packet
 * @param[in,out] offset Offset to the Encapsulating Security Payload header
 * @param[in,out] nextHeaderOffset Offset to the Next Header field
 * @brief Error code
 **/

error_t ipv6ParseEspHeader(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t *offset, size_t *nextHeaderOffset)
{
   //Debug message
   TRACE_DEBUG("  Encapsulating Security Payload header\r\n");
   //Authentication not supported
   return ERROR_FAILURE;
}


/**
 * @brief Send an IPv6 datagram
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv6 pseudo header
 * @param[in] buffer Multi-part buffer containing the payload
 * @param[in] offset Offset to the first byte of the payload
 * @param[in] hopLimit Hop Limit value. Default value is used when this parameter is zero
 * @return Error code
 **/

error_t ipv6SendDatagram(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit)
{
   error_t error;
   size_t length;

   //Retrieve the length of payload
   length = chunkedBufferGetLength(buffer) - offset;

   //Use default Hop Limit value?
   if(!hopLimit) hopLimit = IPV6_DEFAULT_HOP_LIMIT;

   //If the payload length is smaller than the network
   //interface MTU then no fragmentation is needed
   if(length <= IPV6_MAX_PAYLOAD_SIZE)
   {
      //Send data as is
      error = ipv6SendPacket(interface,
         pseudoHeader, 0, 0, buffer, offset, hopLimit);
   }
   //If the payload length exceeds the network interface MTU
   //then the device must fragment the data
   else
   {
#if (IPV6_FRAG_SUPPORT == ENABLED)
      //Fragment IP datagram into smaller packets
      error = ipv6FragmentDatagram(interface,
         pseudoHeader, buffer, offset, hopLimit);
#else
      //Fragmentation is not supported
      error = ERROR_MESSAGE_TOO_LONG;
#endif
   }

   //Return status code
   return error;
}


/**
 * @brief Send an IPv6 packet
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv6 pseudo header
 * @param[in] fragId Fragment identification field
 * @param[in] fragOffset Fragment offset field
 * @param[in] buffer Multi-part buffer containing the payload
 * @param[in] offset Offset to the first byte of the payload
 * @param[in] hopLimit Hop Limit value
 * @return Error code
 **/

error_t ipv6SendPacket(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   uint32_t fragId, uint16_t fragOffset, ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit)
{
   error_t error;
   size_t length;
   Ipv6Header *packet;
#if (ETH_SUPPORT == ENABLED)
   Ipv6Addr destIpAddr;
   MacAddr destMacAddr;
#endif

   //Calculate the length of the payload
   length = chunkedBufferGetLength(buffer) - offset;

   //Add Fragment header?
   if(fragOffset != 0)
   {
      Ipv6FragmentHeader *header;

      //Is there enough space for the IPv6 header and the Fragment header?
      if(offset < (sizeof(Ipv6Header) + sizeof(Ipv6FragmentHeader)))
         return ERROR_INVALID_PARAMETER;

      //Make room for the Fragment header
      offset -= sizeof(Ipv6FragmentHeader);
      length += sizeof(Ipv6FragmentHeader);

      //Point to the Fragment header
      header = chunkedBufferAt(buffer, offset);
      //Format the Fragment header
      header->nextHeader = pseudoHeader->nextHeader;
      header->reserved = 0;
      header->fragmentOffset = htons(fragOffset);
      header->identification = htonl(fragId);

      //Make room for the IPv6 header
      offset -= sizeof(Ipv6Header);
      length += sizeof(Ipv6Header);

      //Point to the IPv6 header
      packet = chunkedBufferAt(buffer, offset);
      //Properly set the Next Header field
      packet->nextHeader = IPV6_FRAGMENT_HEADER;
   }
   else
   {
      //Is there enough space for the IPv6 header?
      if(offset < sizeof(Ipv6Header))
         return ERROR_INVALID_PARAMETER;

      //Make room for the IPv6 header
      offset -= sizeof(Ipv6Header);
      length += sizeof(Ipv6Header);

      //Point to the IPv6 header
      packet = chunkedBufferAt(buffer, offset);
      //Properly set the Next Header field
      packet->nextHeader = pseudoHeader->nextHeader;
   }

   //Format IPv6 header
   packet->version = IPV6_VERSION;
   packet->trafficClassH = 0;
   packet->trafficClassL = 0;
   packet->flowLabelH = 0;
   packet->flowLabelL = 0;
   packet->payloadLength = htons(length - sizeof(Ipv6Header));
   packet->hopLimit = hopLimit;
   packet->srcAddr = pseudoHeader->srcAddr;
   packet->destAddr = pseudoHeader->destAddr;

   //Check whether the source address is acceptable
   error = ipv6CheckSourceAddr(interface, &pseudoHeader->srcAddr);
   //Invalid source address?
   if(error) return error;

   //Destination IPv6 address is the unspecified address?
   if(ipv6CompAddr(&pseudoHeader->destAddr, &IPV6_UNSPECIFIED_ADDR))
   {
      //Destination address is not acceptable
      return ERROR_INVALID_ADDRESS;
   }
   //Destination address is the loopback address?
   else if(ipv6CompAddr(&pseudoHeader->destAddr, &IPV6_LOOPBACK_ADDR))
   {
      //Not yet implemented...
      return ERROR_NOT_IMPLEMENTED;
   }

#if (ETH_SUPPORT == ENABLED)
   //Destination IPv6 address is a multicast address?
   if(ipv6IsMulticastAddr(&pseudoHeader->destAddr))
   {
      //Destination IPv6 address
      destIpAddr = pseudoHeader->destAddr;
      //Map IPv6 multicast address to MAC-layer multicast address
      error = ipv6MapMulticastAddrToMac(&pseudoHeader->destAddr, &destMacAddr);
   }
   //Destination IPv6 address is a link-local unicast address?
   else if(ipv6IsLinkLocalUnicastAddr(&pseudoHeader->destAddr))
   {
      //Destination IPv6 address
      destIpAddr = pseudoHeader->destAddr;
      //Resolve host address using Neighbor Discovery protocol
      error = ndpResolve(interface, &pseudoHeader->destAddr, &destMacAddr);
   }
   //Destination host is on the same link?
   else if(ipv6CompPrefix(&pseudoHeader->destAddr,
      &interface->ipv6Config.prefix, interface->ipv6Config.prefixLength))
   {
      //Destination IPv6 address
      destIpAddr = pseudoHeader->destAddr;
      //Resolve host address using Neighbor Discovery protocol
      error = ndpResolve(interface, &pseudoHeader->destAddr, &destMacAddr);
   }
   //Destination host is outside the local network?
   else
   {
      //Make sure the default router is properly set
      if(!ipv6CompAddr(&interface->ipv6Config.router, &IPV6_UNSPECIFIED_ADDR))
      {
         //Use the default router to forward the packet
         destIpAddr = interface->ipv6Config.router;
         //Perform address resolution
         error = ndpResolve(interface, &interface->ipv6Config.router, &destMacAddr);
      }
      else
      {
         //There is no route to the outside world...
         error = ERROR_NO_ROUTE;
      }
   }

   //Successful address resolution?
   if(!error)
   {
      //Debug message
      TRACE_INFO("Sending IPv6 packet (%" PRIuSIZE " bytes)...\r\n", length);
      //Dump IP header contents for debugging purpose
      ipv6DumpHeader(packet);

      //Send Ethernet frame
      error = ethSendFrame(interface, &destMacAddr, buffer, offset, ETH_TYPE_IPV6);
   }
   //Address resolution is in progress?
   else if(error == ERROR_IN_PROGRESS)
   {
      //Debug message
      TRACE_INFO("Enqueuing IPv6 packet (%" PRIuSIZE " bytes)...\r\n", length);
      //Dump IP header contents for debugging purpose
      ipv6DumpHeader(packet);

      //Enqueue packets waiting for address resolution
      error = ndpEnqueuePacket(interface, &destIpAddr, buffer, offset);
   }
   //Address resolution failed?
   else
   {
      //Debug message
      TRACE_WARNING("Cannot map IPv6 address to Ethernet address!\r\n");
   }
#else
   //Debug message
   TRACE_INFO("Sending IPv6 packet (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump IP header contents for debugging purpose
   ipv6DumpHeader(packet);

   //Send the packet over the specified link
   error = nicSendPacket(interface, buffer, offset);
#endif

   //Return status code
   return error;
}


/**
 * @brief Source IPv6 address filtering
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr Source IPv6 address to be checked
 * @return Error code
 **/

error_t ipv6CheckSourceAddr(NetInterface *interface, const Ipv6Addr *ipAddr)
{
   //Multicast addresses cannot be used as source address
   if(ipv6IsMulticastAddr(ipAddr))
   {
      //Debug message
      TRACE_WARNING("Wrong source IPv6 address!\r\n");
      //The source address not is acceptable
      return ERROR_INVALID_ADDRESS;
   }

   //The source address is acceptable
   return NO_ERROR;
}


/**
 * @brief Destination IPv6 address filtering
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr Destination IPv6 address to be checked
 * @return Error code
 **/

error_t ipv6CheckDestAddr(NetInterface *interface, const Ipv6Addr *ipAddr)
{
   uint_t i;

   //Filter out any invalid addresses
   error_t error = ERROR_INVALID_ADDRESS;

   //Multicast address?
   if(ipv6IsMulticastAddr(ipAddr))
   {
      //Acquire exclusive access to the IPv6 filter table
      osMutexAcquire(interface->ipv6FilterMutex);

      //Loop through the IPv6 filter table
      for(i = 0; i < interface->ipv6FilterSize; i++)
      {
         //Check whether the destination IPv6 address matches
         //a relevant multicast address
         if(ipv6CompAddr(&interface->ipv6Filter[i].addr, ipAddr))
         {
            //The multicast address is acceptable
            error = NO_ERROR;
            //Stop immediately
            break;
         }
      }

      //Release exclusive access to the IPv6 filter table
      osMutexRelease(interface->ipv6FilterMutex);
   }
   //Unicast address?
   else
   {
      //Link-local address?
      if(ipv6CompAddr(ipAddr, &interface->ipv6Config.linkLocalAddr))
         error = NO_ERROR;
      //Global address?
      else if(ipv6CompAddr(ipAddr, &interface->ipv6Config.globalAddr))
         error = NO_ERROR;
   }

   //Return status code
   return error;
}


/**
 * @brief IPv6 source address selection
 *
 * This function selects the source address and the relevant network interface
 * to be used in order to join the specified destination address
 *
 * @param[in,out] interface A pointer to a valid network interface may provided as
 *   a hint. The function returns a pointer identifying the interface to be used
 * @param[in] destAddr Destination IPv6 address
 * @param[out] srcAddr Local IPv6 address to be used
 * @return Error code
 **/

error_t ipv6SelectSourceAddr(NetInterface **interface,
   const Ipv6Addr *destAddr, Ipv6Addr *srcAddr)
{
   //Use default network interface?
   if(*interface == NULL)
      *interface = tcpIpStackGetDefaultInterface();

   //Get the most appropriate source address to use
   if(ipv6IsLinkLocalUnicastAddr(destAddr))
   {
      //Use link local address
      *srcAddr = (*interface)->ipv6Config.linkLocalAddr;
   }
   else if(ipv6IsMulticastAddr(destAddr) && ipv6MulticastAddrScope(destAddr) < IPV6_SCOPE_GLOBAL)
   {
      //Use link local address
      *srcAddr = (*interface)->ipv6Config.linkLocalAddr;
   }
   else
   {
      //Use global address
      *srcAddr = (*interface)->ipv6Config.globalAddr;
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Join an IPv6 multicast group
 * @param[in] interface Underlying network interface
 * @param[in] groupAddr IPv6 Multicast address to join
 * @return Error code
 **/

error_t ipv6JoinMulticastGroup(NetInterface *interface, const Ipv6Addr *groupAddr)
{
   error_t error;
   uint_t i;
   MacAddr macAddr;

   //Ensure the specified IPv6 address is a multicast address
   if(!ipv6IsMulticastAddr(groupAddr))
      return ERROR_INVALID_ADDRESS;

   //Acquire exclusive access to the IPv6 filter table
   osMutexAcquire(interface->ipv6FilterMutex);

   //Loop through filter table entries
   for(i = 0; i < interface->ipv6FilterSize; i++)
   {
      //Check whether the table already contains the specified IPv6 address
      if(ipv6CompAddr(&interface->ipv6Filter[i].addr, groupAddr))
      {
         //Increment the reference count
         interface->ipv6Filter[i].refCount++;
         //Release exclusive access to the IPv6 filter table
         osMutexRelease(interface->ipv6FilterMutex);
         //No error to report
         return NO_ERROR;
      }
   }

   //The IPv6 filter table is full ?
   if(i >= IPV6_FILTER_MAX_SIZE)
   {
      //Release exclusive access to the IPv6 filter table
      osMutexRelease(interface->ipv6FilterMutex);
      //A new entry cannot be added
      return ERROR_FAILURE;
   }

   //Map the multicast IPv6 address to a MAC-layer address
   ipv6MapMulticastAddrToMac(groupAddr, &macAddr);

#if (ETH_SUPPORT == ENABLED)
   //Add the corresponding address to the MAC filter table
   error = ethAcceptMulticastAddr(interface, &macAddr);
#else
   error = NO_ERROR;
#endif

   //Ensure the MAC filter table was successfully updated
   if(!error)
   {
      //Now we can safely add a new entry to the table
      interface->ipv6Filter[i].addr = *groupAddr;
      //Initialize the reference count
      interface->ipv6Filter[i].refCount = 1;
      //Adjust the size of the IPv6 filter table
      interface->ipv6FilterSize++;

#if (MLD_SUPPORT == ENABLED)
      //Start listening to the multicast address
      mldStartListening(interface, &interface->ipv6Filter[i]);
#endif
   }

   //Release exclusive access to the IPv6 filter table
   osMutexRelease(interface->ipv6FilterMutex);
   //Return status code
   return error;
}


/**
 * @brief Leave an IPv6 multicast group
 * @param[in] interface Underlying network interface
 * @param[in] groupAddr Multicast IPv6 address to drop
 * @return Error code
 **/

error_t ipv6LeaveMulticastGroup(NetInterface *interface, const Ipv6Addr *groupAddr)
{
   uint_t i;
   uint_t j;
   MacAddr macAddr;

   //Ensure the specified IPv6 address is a multicast address
   if(!ipv6IsMulticastAddr(groupAddr))
      return ERROR_INVALID_ADDRESS;

   //Acquire exclusive access to the IPv6 filter table
   osMutexAcquire(interface->ipv6FilterMutex);

   //Loop through filter table entries
   for(i = 0; i < interface->ipv6FilterSize; i++)
   {
      //Specified IPv6 address found?
      if(ipv6CompAddr(&interface->ipv6Filter[i].addr, groupAddr))
      {
         //Decrement the reference count
         interface->ipv6Filter[i].refCount--;

         //Remove the entry if the reference count drops to zero
         if(interface->ipv6Filter[i].refCount < 1)
         {
#if (MLD_SUPPORT == ENABLED)
            //Stop listening to the multicast address
            mldStopListening(interface, &interface->ipv6Filter[i]);
#endif
            //Map the multicast IPv6 address to a MAC-layer address
            ipv6MapMulticastAddrToMac(groupAddr, &macAddr);

#if (ETH_SUPPORT == ENABLED)
            //Drop the corresponding address from the MAC filter table
            ethDropMulticastAddr(interface, &macAddr);
#endif
            //Adjust the size of the IPv6 filter table
            interface->ipv6FilterSize--;

            //Remove the corresponding entry
            for(j = i; j < interface->ipv6FilterSize; j++)
               interface->ipv6Filter[j] = interface->ipv6Filter[j + 1];
         }

         //Release exclusive access to the IPv6 filter table
         osMutexRelease(interface->ipv6FilterMutex);
         //No error to report
         return NO_ERROR;
      }
   }

   //Release exclusive access to the IPv6 filter table
   osMutexRelease(interface->ipv6FilterMutex);
   //The specified IPv6 address does not exist
   return ERROR_FAILURE;
}


/**
 * @brief Compare IPv6 address prefixes
 * @param[in] ipAddr1 Pointer to the first IPv6 address
 * @param[in] ipAddr2 Pointer to the second IPv6 address
 * @param[in] length Prefix length
 * @return TRUE if the prefixes match each other, else FALSE
 **/

bool_t ipv6CompPrefix(const Ipv6Addr *ipAddr1, const Ipv6Addr *ipAddr2, size_t length)
{
   size_t n = length / 8;
   size_t m = length % 8;

   //Ensure the prefix length is valid
   if(length < 1 || length > 128)
      return FALSE;

   //Compare the first part
   if(n > 0)
   {
      if(memcmp(ipAddr1, ipAddr2, n))
         return FALSE;
   }

   //Compare the remaining bits, if any
   if(m > 0)
   {
      //Calculate the mask to apply
      uint8_t mask = ((1 << m) - 1) << (8 - m);

      //Check remaining bits
      if((ipAddr1->b[n] & mask) != (ipAddr2->b[n] & mask))
         return FALSE;
   }

   //The prefixes match each other
   return TRUE;
}


/**
 * @brief Form a solicited-node address from an IPv6 address
 * @param[in] ipAddr Unicast or anycast address
 * @param[out] solicitedNodeAddr Corresponding solicited-node address
 * @return Error code
 **/

error_t ipv6ComputeSolicitedNodeAddr(const Ipv6Addr *ipAddr, Ipv6Addr *solicitedNodeAddr)
{
   //Ensure the specified address is a valid unicast or anycast address
   if(ipv6IsMulticastAddr(ipAddr))
      return ERROR_INVALID_ADDRESS;

   //Copy the 104-bit prefix
   ipv6CopyAddr(solicitedNodeAddr, &IPV6_SOLICITED_NODE_ADDR_PREFIX);
   //Take the low-order 24 bits of the address (unicast or
   //anycast) and append those bits to the prefix
   solicitedNodeAddr->b[13] = ipAddr->b[13];
   solicitedNodeAddr->b[14] = ipAddr->b[14];
   solicitedNodeAddr->b[15] = ipAddr->b[15];

   //No error to report
   return NO_ERROR;
}


/**
 * @brief Map an IPv6 multicast address to a MAC-layer multicast address
 * @param[in] ipAddr IPv6 multicast address
 * @param[out] macAddr Corresponding MAC-layer multicast address
 * @return Error code
 **/

error_t ipv6MapMulticastAddrToMac(const Ipv6Addr *ipAddr, MacAddr *macAddr)
{
   //Ensure the specified IPv6 address is a multicast address
   if(!ipv6IsMulticastAddr(ipAddr))
      return ERROR_INVALID_ADDRESS;

   //To support IPv6 multicasting, MAC address range of 33-33-00-00-00-00
   //to 33-33-FF-FF-FF-FF is reserved (refer to RFC 2464)
   macAddr->b[0] = 0x33;
   macAddr->b[1] = 0x33;
   //The low-order 32 bits of the IPv6 multicast address are mapped directly
   //to the low-order 32 bits in the MAC-layer multicast address
   macAddr->b[2] = ipAddr->b[12];
   macAddr->b[3] = ipAddr->b[13];
   macAddr->b[4] = ipAddr->b[14];
   macAddr->b[5] = ipAddr->b[15];

   //The specified IPv6 multicast address was successfully
   //mapped to a MAC-layer address
   return NO_ERROR;
}


/**
 * @brief Convert a string representation of an IPv6 address to a binary IPv6 address
 * @param[in] str NULL-terminated string representing the IPv6 address
 * @param[out] ipAddr Binary representation of the IPv6 address
 * @return Error code
 **/

error_t ipv6StringToAddr(const char_t *str, Ipv6Addr *ipAddr)
{
   int_t i = 0;
   int_t j = -1;
   int_t k = 0;
   int32_t value = -1;

   //Parse input string
   while(1)
   {
      //Hexadecimal digit found?
      if(isxdigit((uint8_t) *str))
      {
         //First digit to be decoded?
         if(value < 0) value = 0;
         //Update the value of the current 16-bit word
         if(isdigit((uint8_t) *str))
            value = (value * 16) + (*str - '0');
         else if(isupper((uint8_t) *str))
            value = (value * 16) + (*str - 'A' + 10);
         else
            value = (value * 16) + (*str - 'a' + 10);
         //Check resulting value
         if(value > 0xFFFF) return ERROR_FAILURE;
      }
      //"::" symbol found?
      else if(!strncmp(str, "::", 2))
      {
         //The "::" can only appear once in an IPv6 address
         if(j >= 0) return ERROR_FAILURE;
         //The "::" symbol is preceded by a number?
         if(value >= 0)
         {
            //Save the current 16-bit word
            ipAddr->w[i++] = htons(value);
            //Prepare to decode the next 16-bit word
            value = -1;
         }
         //Save the position of the "::" symbol
         j = i;
         //Point to the next character
         str++;
      }
      //":" symbol found?
      else if(*str == ':' && i < 8)
      {
         //Each ":" must be preceded by a valid number
         if(value < 0) return ERROR_FAILURE;
         //Save the current 16-bit word
         ipAddr->w[i++] = htons(value);
         //Prepare to decode the next 16-bit word
         value = -1;
      }
      //End of string detected?
      else if(*str == '\0' && i == 7 && j < 0)
      {
         //The NULL character must be preceded by a valid number
         if(value < 0) return ERROR_FAILURE;
         //Save the last 16-bit word of the IPv6 address
         ipAddr->w[i] = htons(value);
         //The conversion succeeded
         return NO_ERROR;
      }
      else if(*str == '\0' && i < 7 && j >= 0)
      {
         //Save the last 16-bit word of the IPv6 address
         if(value >= 0)
            ipAddr->w[i++] = htons(value);
         //Move the part of the address that follows the "::" symbol
         for(k = 0; k < (i - j); k++)
            ipAddr->w[7 - k] = ipAddr->w[i - 1 - k];
         //A sequence of zeroes can now be written in place of "::"
         for(k = 0; k < (8 - i); k++)
            ipAddr->w[j + k] = 0;
         //The conversion succeeded
         return NO_ERROR;
      }
      //Invalid character...
      else
      {
         //The conversion failed
         return ERROR_FAILURE;
      }

      //Point to the next character
      str++;
   }
}


/**
 * @brief Convert a binary IPv6 address to a string representation
 *
 * Call ipv6AddrToString() to convert an IPv6 address to a text representation. The
 * implementation of ipv6AddrToString() function follows RFC 5952 recommendations
 *
 * @param[in] ipAddr Binary representation of the IPv6 address
 * @param[out] str NULL-terminated string representing the IPv6 address
 * @return Pointer to the formatted string
 **/

char_t *ipv6AddrToString(const Ipv6Addr *ipAddr, char_t *str)
{
   static char_t buffer[40];
   uint_t i;
   uint_t j;
   char_t *p;

   //Best run of zeroes
   uint_t zeroRunStart = 0;
   uint_t zeroRunEnd = 0;

   //The str parameter is optional
   if(!str) str = buffer;

   //Find the longest run of zeros for "::" short-handing
   for(i = 0; i < 8; i++)
   {
      //Compute the length of the current sequence of zeroes
      for(j = i; j < 8 && !ipAddr->w[j]; j++);
      //Keep track of the longest one
      if((j - i) > 1 && (j - i) > (zeroRunEnd - zeroRunStart))
      {
         //The symbol "::" should not be used to shorten just one zero field
         zeroRunStart = i;
         zeroRunEnd = j;
      }
   }

   //Format IPv6 address
   for(p = str, i = 0; i < 8; i++)
   {
      //Are we inside the best run of zeroes?
      if(i >= zeroRunStart && i < zeroRunEnd)
      {
         //Append a separator
         *(p++) = ':';
         //Skip the sequence of zeroes
         i = zeroRunEnd - 1;
      }
      else
      {
         //Add a separator between each 16-bit word
         if(i > 0) *(p++) = ':';
         //Convert the current 16-bit word to string
         p += sprintf(p, "%" PRIx16, ntohs(ipAddr->w[i]));
      }
   }

   //A trailing run of zeroes has been found?
   if(zeroRunEnd == 8) *(p++) = ':';
   //Properly terminate the string
   *p = '\0';

   //Return a pointer to the formatted string
   return str;
}


/**
 * @brief Dump IPv6 header for debugging purpose
 * @param[in] ipHeader IPv6 header
 **/

void ipv6DumpHeader(const Ipv6Header *ipHeader)
{
   //Dump IPv6 header contents
   TRACE_DEBUG("  Version = %" PRIu8 "\r\n", ipHeader->version);
   TRACE_DEBUG("  Traffic Class = %u\r\n", (ipHeader->trafficClassH << 4) | ipHeader->trafficClassL);
   TRACE_DEBUG("  Flow Label = 0x%05X\r\n", (ipHeader->flowLabelH << 16) | ntohs(ipHeader->flowLabelL));
   TRACE_DEBUG("  Payload Length = %" PRIu16 "\r\n", ntohs(ipHeader->payloadLength));
   TRACE_DEBUG("  Next Header = %" PRIu8 "\r\n", ipHeader->nextHeader);
   TRACE_DEBUG("  Hop Limit = %" PRIu8 "\r\n", ipHeader->hopLimit);
   TRACE_DEBUG("  Src Addr = %s\r\n", ipv6AddrToString(&ipHeader->srcAddr, NULL));
   TRACE_DEBUG("  Dest Addr = %s\r\n", ipv6AddrToString(&ipHeader->destAddr, NULL));
}

#endif
