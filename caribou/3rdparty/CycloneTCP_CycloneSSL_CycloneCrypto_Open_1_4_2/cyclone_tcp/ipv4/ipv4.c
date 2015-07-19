/**
 * @file ipv4.c
 * @brief IPv4 (Internet Protocol Version 4)
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
 * The Internet Protocol (IP) provides the functions necessary to deliver a
 * datagram from a source to a destination over an interconnected system of
 * networks. Refer to RFC 791 for complete details
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL IPV4_TRACE_LEVEL

//Dependencies
#include <string.h>
#include <ctype.h>
#include "tcp_ip_stack.h"
#include "ethernet.h"
#include "arp.h"
#include "ip.h"
#include "ipv4.h"
#include "icmp.h"
#include "igmp.h"
#include "udp.h"
#include "tcp_fsm.h"
#include "raw_socket.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV4_SUPPORT == ENABLED)


/**
 * @brief IPv4 related initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t ipv4Init(NetInterface *interface)
{
   //Identification field is primarily used to identify
   //fragments of an original IP datagram
   interface->ipv4Identification = 0;

   //Create a mutex to prevent simultaneous access to the IPv4 filter table
   interface->ipv4FilterMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(interface->ipv4FilterMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Clear IPv4 filter table contents
   memset(interface->ipv4Filter, 0, sizeof(interface->ipv4Filter));
   //No entry in the filter table
   interface->ipv4FilterSize = 0;

#if (IPV4_FRAG_SUPPORT == ENABLED)
   //Create a mutex to prevent simultaneous access to the reassembly queue
   interface->ipv4FragQueueMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(interface->ipv4FragQueueMutex == OS_INVALID_HANDLE)
   {
      //Clean up side effects
      osMutexClose(interface->ipv4FilterMutex);
      //Stop immediately
      return ERROR_OUT_OF_RESOURCES;
   }

   //Clear the reassembly queue
   memset(interface->ipv4FragQueue, 0, sizeof(interface->ipv4FragQueue));
#endif

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Configure IPv4 host address
 * @param[in] interface Pointer to the desired network interface
 * @param[in] addr IPv4 host address
 * @return Error code
 **/

error_t ipv4SetHostAddr(NetInterface *interface, Ipv4Addr addr)
{
   //Check parameters
   if(interface == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv4IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Set up IPv4 host address
   interface->ipv4Config.addr = addr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Retrieve IPv4 host address
 * @param[in] interface Pointer to the desired network interface
 * @param[out] addr IPv4 host address
 * @return Error code
 **/

error_t ipv4GetHostAddr(NetInterface *interface, Ipv4Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get IPv4 host address
   *addr = interface->ipv4Config.addr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure subnet mask
 * @param[in] interface Pointer to the desired network interface
 * @param[in] mask Subnet mask
 * @return Error code
 **/

error_t ipv4SetSubnetMask(NetInterface *interface, Ipv4Addr mask)
{
   //Check parameters
   if(interface == NULL)
      return ERROR_INVALID_PARAMETER;

   //Set up subnet mask
   interface->ipv4Config.subnetMask = mask;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Retrieve subnet mask
 * @param[in] interface Pointer to the desired network interface
 * @param[out] mask Subnet mask
 * @return Error code
 **/

error_t ipv4GetSubnetMask(NetInterface *interface, Ipv4Addr *mask)
{
   //Check parameters
   if(interface == NULL || mask == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get subnet mask
   *mask = interface->ipv4Config.subnetMask;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure default gateway
 * @param[in] interface Pointer to the desired network interface
 * @param[in] addr Default gateway address
 * @return Error code
 **/

error_t ipv4SetDefaultGateway(NetInterface *interface, Ipv4Addr addr)
{
   //Check parameters
   if(interface == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv4IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Set up default gateway address
   interface->ipv4Config.defaultGateway = addr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Retrieve default gateway
 * @param[in] interface Pointer to the desired network interface
 * @param[out] addr Default gateway address
 * @return Error code
 **/

error_t ipv4GetDefaultGateway(NetInterface *interface, Ipv4Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get default gateway address
   *addr = interface->ipv4Config.defaultGateway;

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

error_t ipv4SetDnsServer(NetInterface *interface, uint_t num, Ipv4Addr addr)
{
   //Check parameters
   if(interface == NULL)
      return ERROR_INVALID_PARAMETER;
   if(ipv4IsMulticastAddr(addr))
      return ERROR_INVALID_ADDRESS;

   //Set up DNS server address
   if(num < IPV4_MAX_DNS_SERVERS)
      interface->ipv4Config.dnsServer[num] = addr;

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

error_t ipv4GetDnsServer(NetInterface *interface, uint_t num, Ipv4Addr *addr)
{
   //Check parameters
   if(interface == NULL || addr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get DNS server address
   if(num < IPV4_MAX_DNS_SERVERS)
      *addr = interface->ipv4Config.dnsServer[num];
   else
      *addr = IPV4_UNSPECIFIED_ADDR;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Incoming IPv4 packet processing
 * @param[in] interface Underlying network interface
 * @param[in] packet Incoming IPv4 packet
 * @param[in] length Packet length including header and payload
 **/

void ipv4ProcessPacket(NetInterface *interface, Ipv4Header *packet, size_t length)
{
   //Ensure the packet length is greater than 20 bytes
   if(length < sizeof(Ipv4Header))
      return;

   //Debug message
   TRACE_INFO("IPv4 packet received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump IP header contents for debugging purpose
   ipv4DumpHeader(packet);

   //A packet whose version number is not 4 must be silently discarded
   if(packet->version != IPV4_VERSION)
      return;
   //Valid IPv4 header shall contains more than five 32-bit words
   if(packet->headerLength < 5)
      return;
   //Ensure the total length is correct before processing the packet
   if(ntohs(packet->totalLength) < (packet->headerLength * 4))
      return;
   if(ntohs(packet->totalLength) > length)
      return;
   //Destination address filtering
   if(ipv4CheckDestAddr(interface, packet->destAddr))
      return;
   //Source address filtering
   if(ipv4CheckSourceAddr(interface, packet->srcAddr))
      return;

   //The host must verify the IP header checksum on every received
   //datagram and silently discard every datagram that has a bad
   //checksum (see RFC 1122 3.2.1.2)
   if(ipCalcChecksum(packet, packet->headerLength * 4) != 0x0000)
   {
      //Debug message
      TRACE_WARNING("Wrong IP header checksum!\r\n");
      //Discard incoming packet
      return;
   }

   //Convert the total length from network byte order
   length = ntohs(packet->totalLength);

   //A fragmented packet was received?
   if(ntohs(packet->fragmentOffset) & (IPV4_FLAG_MF | IPV4_OFFSET_MASK))
   {
#if (IPV4_FRAG_SUPPORT == ENABLED)
      //Acquire exclusive access to the reassembly queue
      osMutexAcquire(interface->ipv4FragQueueMutex);
      //Reassemble the original datagram
      ipv4ReassembleDatagram(interface, packet, length);
      //Release exclusive access to the reassembly queue
      osMutexRelease(interface->ipv4FragQueueMutex);
#endif
   }
   else
   {
      ChunkedBuffer1 buffer;

      //Unfragmented datagrams fit in a single chunk
      buffer.chunkCount = 1;
      buffer.maxChunkCount = 1;
      buffer.chunk[0].address = packet;
      buffer.chunk[0].length = length;

      //Pass the IPv4 datagram to the higher protocol layer
      ipv4ProcessDatagram(interface, (ChunkedBuffer *) &buffer);
   }
}


/**
 * @brief Incoming IPv4 datagram processing
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer that holds the incoming IPv4 datagram
 **/

void ipv4ProcessDatagram(NetInterface *interface, const ChunkedBuffer *buffer)
{
   error_t error;
   size_t offset;
   size_t length;
   Ipv4Header *header;
   IpPseudoHeader pseudoHeader;

   //Retrieve the length of the IPv4 datagram
   length = chunkedBufferGetLength(buffer);

   //Point to the IPv4 header
   header = chunkedBufferAt(buffer, 0);
   //Sanity check
   if(!header) return;

   //Debug message
   TRACE_INFO("IPv4 datagram received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump IP header contents for debugging purpose
   ipv4DumpHeader(header);

   //Get the offset to the payload
   offset = header->headerLength * 4;
   //Compute the length of the payload
   length -= header->headerLength * 4;

   //Form the IPv4 pseudo header
   pseudoHeader.length = sizeof(Ipv4PseudoHeader);
   pseudoHeader.ipv4Data.srcAddr = header->srcAddr;
   pseudoHeader.ipv4Data.destAddr = header->destAddr;
   pseudoHeader.ipv4Data.reserved = 0;
   pseudoHeader.ipv4Data.protocol = header->protocol;
   pseudoHeader.ipv4Data.length = htons(length);

   //Check the protocol field
   switch(header->protocol)
   {
   //ICMP protocol?
   case IPV4_PROTOCOL_ICMP:
      //Process incoming ICMP message
      icmpProcessMessage(interface, header->srcAddr, buffer, offset);
#if (RAW_SOCKET_SUPPORT == ENABLED)
      //Allow raw sockets to process ICMP messages
      rawSocketProcessDatagram(interface, &pseudoHeader, buffer, offset);
#endif
      //No error to report
      error = NO_ERROR;
      //Continue processing
      break;

#if (IGMP_SUPPORT == ENABLED)
   //IGMP protocol?
   case IPV4_PROTOCOL_IGMP:
      //Process incoming IGMP message
      igmpProcessMessage(interface, buffer, offset);
#if (RAW_SOCKET_SUPPORT == ENABLED)
      //Allow raw sockets to process IGMP messages
      rawSocketProcessDatagram(interface, &pseudoHeader, buffer, offset);
#endif
      //No error to report
      error = NO_ERROR;
      //Continue processing
      break;
#endif

#if (TCP_SUPPORT == ENABLED)
   //TCP protocol?
   case IPV4_PROTOCOL_TCP:
      //Process incoming TCP segment
      tcpProcessSegment(interface, &pseudoHeader, buffer, offset);
      //No error to report
      error = NO_ERROR;
      //Continue processing
      break;
#endif

#if (UDP_SUPPORT == ENABLED)
   //UDP protocol?
   case IPV4_PROTOCOL_UDP:
      //Process incoming UDP datagram
      error = udpProcessDatagram(interface, &pseudoHeader, buffer, offset);
      //Continue processing
      break;
#endif

   //Unknown protocol?
   default:
#if (RAW_SOCKET_SUPPORT == ENABLED)
      //Allow raw sockets to process IPv4 packets
      error = rawSocketProcessDatagram(interface, &pseudoHeader, buffer, offset);
#else
      //Report an error
      error = ERROR_PROTOCOL_UNREACHABLE;
#endif
      //Continue processing
      break;
   }

   //Unreachable protocol?
   if(error == ERROR_PROTOCOL_UNREACHABLE)
   {
      //Send a Destination Unreachable message
      icmpSendErrorMessage(interface, ICMP_TYPE_DEST_UNREACHABLE,
         ICMP_CODE_PROTOCOL_UNREACHABLE, 0, buffer);
   }
   //Unreachable port?
   else if(error == ERROR_PORT_UNREACHABLE)
   {
      //Send a Destination Unreachable message
      icmpSendErrorMessage(interface, ICMP_TYPE_DEST_UNREACHABLE,
         ICMP_CODE_PORT_UNREACHABLE, 0, buffer);
   }
}


/**
 * @brief Send an IPv4 datagram
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv4 pseudo header
 * @param[in] buffer Multi-part buffer containing the payload
 * @param[in] offset Offset to the first byte of the payload
 * @param[in] ttl TTL value. Default Time-To-Live is used when this parameter is zero
 * @return Error code
 **/

error_t ipv4SendDatagram(NetInterface *interface, Ipv4PseudoHeader *pseudoHeader,
   ChunkedBuffer *buffer, size_t offset, uint8_t ttl)
{
   error_t error;
   size_t length;
   uint16_t id;

   //Retrieve the length of payload
   length = chunkedBufferGetLength(buffer) - offset;

   //Use default Time-To-Live value?
   if(!ttl) ttl = IPV4_DEFAULT_TTL;

   //Identification field is primarily used to identify
   //fragments of an original IP datagram
   id = osAtomicInc16(&interface->ipv4Identification);

   //If the payload length is smaller than the network
   //interface MTU then no fragmentation is needed
   if(length <= IPV4_MAX_PAYLOAD_SIZE)
   {
      //Send data as is
      error = ipv4SendPacket(interface,
         pseudoHeader, id, 0, buffer, offset, ttl);
   }
   //If the payload length exceeds the network interface MTU
   //then the device must fragment the data
   else
   {
#if (IPV4_FRAG_SUPPORT == ENABLED)
      //Fragment IP datagram into smaller packets
      error = ipv4FragmentDatagram(interface,
         pseudoHeader, id, buffer, offset, ttl);
#else
      //Fragmentation is not supported
      error = ERROR_MESSAGE_TOO_LONG;
#endif
   }

   //Return status code
   return error;
}


/**
 * @brief Send an IPv4 packet
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader IPv4 pseudo header
 * @param[in] fragId Fragment identification field
 * @param[in] fragOffset Fragment offset field
 * @param[in] buffer Multi-part buffer containing the payload
 * @param[in] offset Offset to the first byte of the payload
 * @param[in] ttl Time-To-Live value
 * @return Error code
 **/

error_t ipv4SendPacket(NetInterface *interface, Ipv4PseudoHeader *pseudoHeader,
   uint16_t fragId, uint16_t fragOffset, ChunkedBuffer *buffer, size_t offset, uint8_t ttl)
{
   error_t error;
   size_t length;
   Ipv4Addr destIpAddr;
   MacAddr destMacAddr;
   Ipv4Header *packet;

   //Is there enough space for the IPv4 header?
   if(offset < sizeof(Ipv4Header))
      return ERROR_INVALID_PARAMETER;

   //Make room for the header
   offset -= sizeof(Ipv4Header);
   //Calculate the size of the entire packet, including header and data
   length = chunkedBufferGetLength(buffer) - offset;

   //Point to the IPv4 header
   packet = chunkedBufferAt(buffer, offset);

   //Format IPv4 header
   packet->version = IPV4_VERSION;
   packet->headerLength = 5;
   packet->typeOfService = 0;
   packet->totalLength = htons(length);
   packet->identification = htons(fragId);
   packet->fragmentOffset = htons(fragOffset);
   packet->timeToLive = ttl;
   packet->protocol = pseudoHeader->protocol;
   packet->headerChecksum = 0;
   packet->srcAddr = pseudoHeader->srcAddr;
   packet->destAddr = pseudoHeader->destAddr;

   //Calculate IP header checksum
   packet->headerChecksum = ipCalcChecksumEx(buffer, offset, packet->headerLength * 4);

   //Ensure the source address is valid
   error = ipv4CheckSourceAddr(interface, pseudoHeader->srcAddr);
   //Invalid source address?
   if(error) return error;

   //Destination address is the unspecified address?
   if(pseudoHeader->destAddr == IPV4_UNSPECIFIED_ADDR)
   {
      //Destination address is not acceptable
      error = ERROR_INVALID_ADDRESS;
   }
   //Destination address is the loopback address?
   else if(pseudoHeader->destAddr == IPV4_LOOPBACK_ADDR)
   {
      //Not yet implemented...
      error = ERROR_NOT_IMPLEMENTED;
   }
   //Destination address is a broadcast address?
   else if(ipv4IsBroadcastAddr(interface, pseudoHeader->destAddr))
   {
      //Destination IPv4 address
      destIpAddr = pseudoHeader->destAddr;
      //Make use of the broadcast MAC address
      destMacAddr = MAC_BROADCAST_ADDR;
      //No error to report
      error = NO_ERROR;
   }
   //Destination address is a multicast address?
   else if(ipv4IsMulticastAddr(pseudoHeader->destAddr))
   {
      //Destination IPv4 address
      destIpAddr = pseudoHeader->destAddr;
      //Map IPv4 multicast address to MAC-layer multicast address
      error = ipv4MapMulticastAddrToMac(pseudoHeader->destAddr, &destMacAddr);
   }
   //Destination host is in the local subnet?
   else if(ipv4IsInLocalSubnet(interface, pseudoHeader->destAddr))
   {
      //Destination IPv4 address
      destIpAddr = pseudoHeader->destAddr;
      //Resolve host address before sending the packet
      error = arpResolve(interface, pseudoHeader->destAddr, &destMacAddr);
   }
   //Destination host is outside the local subnet?
   else
   {
      //Make sure the default gateway is properly set
      if(interface->ipv4Config.defaultGateway != IPV4_UNSPECIFIED_ADDR)
      {
         //Use the default gateway to forward the packet
         destIpAddr = interface->ipv4Config.defaultGateway;
         //Perform address resolution
         error = arpResolve(interface, interface->ipv4Config.defaultGateway, &destMacAddr);
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
      TRACE_INFO("Sending IPv4 packet (%" PRIuSIZE " bytes)...\r\n", length);
      //Dump IP header contents for debugging purpose
      ipv4DumpHeader(packet);

      //Send Ethernet frame
      error = ethSendFrame(interface, &destMacAddr, buffer, offset, ETH_TYPE_IPV4);
   }
   //Address resolution is in progress?
   else if(error == ERROR_IN_PROGRESS)
   {
      //Debug message
      TRACE_INFO("Enqueuing IPv4 packet (%" PRIuSIZE " bytes)...\r\n", length);
      //Dump IP header contents for debugging purpose
      ipv4DumpHeader(packet);

      //Enqueue packets waiting for address resolution
      error = arpEnqueuePacket(interface, destIpAddr, buffer, offset);
   }
   //Address resolution failed?
   else
   {
      //Debug message
      TRACE_WARNING("Cannot map IPv4 address to Ethernet address!\r\n");
   }

   //Return status code
   return error;
}


/**
 * @brief Source IPv4 address filtering
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr Source IPv4 address to be checked
 * @return Error code
 **/

error_t ipv4CheckSourceAddr(NetInterface *interface, Ipv4Addr ipAddr)
{
   //Broadcast and multicast addresses must not be used as source
   //address (see RFC 1122 3.2.1.3)
   if(ipv4IsBroadcastAddr(interface, ipAddr) || ipv4IsMulticastAddr(ipAddr))
   {
      //Debug message
      TRACE_WARNING("Wrong source IPv4 address!\r\n");
      //The source address not is acceptable
      return ERROR_INVALID_ADDRESS;
   }

   //The source address is acceptable
   return NO_ERROR;
}


/**
 * @brief Destination IPv4 address filtering
 * @param[in] interface Underlying network interface
 * @param[in] ipAddr Destination IPv4 address to be checked
 * @return Error code
 **/

error_t ipv4CheckDestAddr(NetInterface *interface, Ipv4Addr ipAddr)
{
   uint_t i;

   //Filter out any invalid addresses
   error_t error = ERROR_INVALID_ADDRESS;

   //Broadcast address?
   if(ipv4IsBroadcastAddr(interface, ipAddr))
   {
      //Always accept broadcast address
      error = NO_ERROR;
   }
   //Multicast address?
   else if(ipv4IsMulticastAddr(ipAddr))
   {
      //Acquire exclusive access to the IPv4 filter table
      osMutexAcquire(interface->ipv4FilterMutex);

      //Loop through the IPv4 filter table
      for(i = 0; i < interface->ipv4FilterSize; i++)
      {
         //Check whether the destination IPv4 address matches
         //a relevant multicast address
         if(interface->ipv4Filter[i].addr == ipAddr)
         {
            //The multicast address is acceptable
            error = NO_ERROR;
            //Stop immediately
            break;
         }
      }

      //Release exclusive access to the IPv4 filter table
      osMutexRelease(interface->ipv4FilterMutex);
   }
   //Unicast address?
   else
   {
      //Host address?
      if(ipAddr == interface->ipv4Config.addr)
         error = NO_ERROR;
   }

   //Return status code
   return error;
}


/**
 * @brief IPv4 source address selection
 *
 * This function selects the source address and the relevant network interface
 * to be used in order to join the specified destination address
 *
 * @param[in,out] interface A pointer to a valid network interface may provided as
 *   a hint. The function returns a pointer identifying the interface to be used
 * @param[in] destAddr Destination IPv4 address
 * @param[out] srcAddr Local IPv4 address to be used
 * @return Error code
 **/

error_t ipv4SelectSourceAddr(NetInterface **interface,
   Ipv4Addr destAddr, Ipv4Addr *srcAddr)
{
   //Use default network interface?
   if(*interface == NULL)
      *interface = tcpIpStackGetDefaultInterface();

   //Select the most appropriate source address
   *srcAddr = (*interface)->ipv4Config.addr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Join the specified host group
 * @param[in] interface Underlying network interface
 * @param[in] groupAddr IPv4 address identifying the host group to join
 * @return Error code
 **/

error_t ipv4JoinMulticastGroup(NetInterface *interface, Ipv4Addr groupAddr)
{
   error_t error;
   uint_t i;
   MacAddr macAddr;

   //Ensure the specified IPv4 address is a multicast address
   if(!ipv4IsMulticastAddr(groupAddr))
      return ERROR_INVALID_ADDRESS;

   //Acquire exclusive access to the IPv4 filter table
   osMutexAcquire(interface->ipv4FilterMutex);

   //Loop through filter table entries
   for(i = 0; i < interface->ipv4FilterSize; i++)
   {
      //Check whether the table already contains the specified IPv4 address
      if(interface->ipv4Filter[i].addr == groupAddr)
      {
         //Increment the reference count
         interface->ipv4Filter[i].refCount++;
         //Release exclusive access to the IPv4 filter table
         osMutexRelease(interface->ipv4FilterMutex);
         //No error to report
         return NO_ERROR;
      }
   }

   //The IPv4 filter table is full ?
   if(i >= IPV4_FILTER_MAX_SIZE)
   {
      //Release exclusive access to the IPv4 filter table
      osMutexRelease(interface->ipv4FilterMutex);
      //A new entry cannot be added
      return ERROR_FAILURE;
   }

   //Map the multicast IPv4 address to a MAC-layer address
   ipv4MapMulticastAddrToMac(groupAddr, &macAddr);
   //Add the corresponding address to the MAC filter table
   error = ethAcceptMulticastAddr(interface, &macAddr);

   //Ensure the MAC filter table was successfully updated
   if(!error)
   {
      //Now we can safely add a new entry to the table
      interface->ipv4Filter[i].addr = groupAddr;
      //Initialize the reference count
      interface->ipv4Filter[i].refCount = 1;
      //Adjust the size of the IPv4 filter table
      interface->ipv4FilterSize++;

#if (IGMP_SUPPORT == ENABLED)
      //Report multicast group membership to the router
      igmpJoinGroup(interface, &interface->ipv4Filter[i]);
#endif
   }

   //Release exclusive access to the IPv4 filter table
   osMutexRelease(interface->ipv4FilterMutex);
   //Return status code
   return error;
}


/**
 * @brief Leave the specified host group
 * @param[in] interface Underlying network interface
 * @param[in] groupAddr IPv4 address identifying the host group to leave
 * @return Error code
 **/

error_t ipv4LeaveMulticastGroup(NetInterface *interface, Ipv4Addr groupAddr)
{
   uint_t i;
   uint_t j;
   MacAddr macAddr;

   //Ensure the specified IPv4 address is a multicast address
   if(!ipv4IsMulticastAddr(groupAddr))
      return ERROR_INVALID_ADDRESS;

   //Acquire exclusive access to the IPv4 filter table
   osMutexAcquire(interface->ipv4FilterMutex);

   //Loop through filter table entries
   for(i = 0; i < interface->ipv4FilterSize; i++)
   {
      //Specified IPv4 address found?
      if(interface->ipv4Filter[i].addr == groupAddr)
      {
         //Decrement the reference count
         interface->ipv4Filter[i].refCount--;

         //Remove the entry if the reference count drops to zero
         if(interface->ipv4Filter[i].refCount < 1)
         {
#if (IGMP_SUPPORT == ENABLED)
            //Report group membership termination
            igmpLeaveGroup(interface, &interface->ipv4Filter[i]);
#endif
            //Map the multicast IPv4 address to a MAC-layer address
            ipv4MapMulticastAddrToMac(groupAddr, &macAddr);
            //Drop the corresponding address from the MAC filter table
            ethDropMulticastAddr(interface, &macAddr);

            //Adjust the size of the IPv4 filter table
            interface->ipv4FilterSize--;

            //Remove the corresponding entry
            for(j = i; j < interface->ipv4FilterSize; j++)
               interface->ipv4Filter[j] = interface->ipv4Filter[j + 1];
         }

         //Release exclusive access to the IPv4 filter table
         osMutexRelease(interface->ipv4FilterMutex);
         //No error to report
         return NO_ERROR;
      }
   }

   //Release exclusive access to the IPv4 filter table
   osMutexRelease(interface->ipv4FilterMutex);
   //The specified IPv4 address does not exist
   return ERROR_FAILURE;
}


/**
 * @brief Map an host group address to a MAC-layer multicast address
 * @param[in] ipAddr IPv4 host group address
 * @param[out] macAddr Corresponding MAC-layer multicast address
 * @return Error code
 **/

error_t ipv4MapMulticastAddrToMac(Ipv4Addr ipAddr, MacAddr *macAddr)
{
   //Ensure the specified IPv4 address is a valid host group address
   if(!ipv4IsMulticastAddr(ipAddr))
      return ERROR_INVALID_ADDRESS;

   //An IP host group address is mapped to an Ethernet multicast address
   //by placing the low-order 23-bits of the IP address into the low-order
   //23 bits of the Ethernet multicast address 01-00-5E-00-00-00
   macAddr->b[0] = 0x01;
   macAddr->b[1] = 0x00;
   macAddr->b[2] = 0x5E;
   macAddr->b[3] = (ipAddr >> 8) & 0x7F;
   macAddr->b[4] = (ipAddr >> 16) & 0xFF;
   macAddr->b[5] = (ipAddr >> 24) & 0xFF;

   //The specified host group address was successfully
   //mapped to a MAC-layer address
   return NO_ERROR;
}


/**
 * @brief Convert a dot-decimal string to a binary IPv4 address
 * @param[in] str NULL-terminated string representing the IPv4 address
 * @param[out] ipAddr Binary representation of the IPv4 address
 * @return Error code
 **/

error_t ipv4StringToAddr(const char_t *str, Ipv4Addr *ipAddr)
{
   int_t i = 0;
   int_t value = -1;

   //Parse input string
   while(1)
   {
      //Decimal digit found?
      if(isdigit((uint8_t) *str))
      {
         //First digit to be decoded?
         if(value < 0) value = 0;
         //Update the value of the current byte
         value = (value * 10) + (*str - '0');
         //The resulting value shall be in range 0 to 255
         if(value > 255) return ERROR_FAILURE;
      }
      //Dot separator found?
      else if(*str == '.' && i < 4)
      {
         //Each dot must be preceded by a valid number
         if(value < 0) return ERROR_FAILURE;
         //Save the current byte
         ((uint8_t *) ipAddr)[i++] = value;
         //Prepare to decode the next byte
         value = -1;
      }
      //End of string detected?
      else if(*str == '\0' && i == 3)
      {
         //The NULL character must be preceded by a valid number
         if(value < 0) return ERROR_FAILURE;
         //Save the last byte of the IPv4 address
         ((uint8_t *) ipAddr)[i] = value;
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
 * @brief Convert a binary IPv4 address to dot-decimal notation
 * @param[in] ipAddr Binary representation of the IPv4 address
 * @param[out] str NULL-terminated string representing the IPv4 address
 * @return Pointer to the formatted string
 **/

char_t *ipv4AddrToString(Ipv4Addr ipAddr, char_t *str)
{
   uint8_t *p;
   static char_t buffer[16];

   //The str parameter is optional
   if(!str) str = buffer;

   //Cast the address to byte array
   p = (uint8_t *) &ipAddr;
   //Format IPv4 address
   sprintf(str, "%" PRIu8 ".%" PRIu8 ".%" PRIu8 ".%" PRIu8 "", p[0], p[1], p[2], p[3]);

   //Return a pointer to the formatted string
   return str;
}


/**
 * @brief Dump IPv4 header for debugging purpose
 * @param[in] ipHeader Pointer to the IPv4 header
 **/

void ipv4DumpHeader(const Ipv4Header *ipHeader)
{
   //Dump IP header contents
   TRACE_DEBUG("  Version = %" PRIu8 "\r\n", ipHeader->version);
   TRACE_DEBUG("  Header Length = %" PRIu8 "\r\n", ipHeader->headerLength);
   TRACE_DEBUG("  Type Of Service = %" PRIu8 "\r\n", ipHeader->typeOfService);
   TRACE_DEBUG("  Total Length = %" PRIu16 "\r\n", ntohs(ipHeader->totalLength));
   TRACE_DEBUG("  Identification = %" PRIu16 "\r\n", ntohs(ipHeader->identification));
   TRACE_DEBUG("  Flags = 0x%01X\r\n", ntohs(ipHeader->fragmentOffset) >> 13);
   TRACE_DEBUG("  Fragment Offset = %" PRIu16 "\r\n", ntohs(ipHeader->fragmentOffset) & 0x1FFF);
   TRACE_DEBUG("  Time To Live = %" PRIu8 "\r\n", ipHeader->timeToLive);
   TRACE_DEBUG("  Protocol = %" PRIu8 "\r\n", ipHeader->protocol);
   TRACE_DEBUG("  Header Checksum = 0x%04" PRIX16 "\r\n", ntohs(ipHeader->headerChecksum));
   TRACE_DEBUG("  Src Addr = %s\r\n", ipv4AddrToString(ipHeader->srcAddr, NULL));
   TRACE_DEBUG("  Dest Addr = %s\r\n", ipv4AddrToString(ipHeader->destAddr, NULL));
}

#endif
