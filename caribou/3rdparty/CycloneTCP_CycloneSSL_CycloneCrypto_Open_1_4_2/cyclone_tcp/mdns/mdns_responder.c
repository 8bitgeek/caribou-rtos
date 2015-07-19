/**
 * @file mdns_responder.c
 * @brief mDNS responder (Multicast DNS)
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
#define TRACE_LEVEL MDNS_TRACE_LEVEL

//Dependencies
#include "tcp_ip_stack.h"
#include "mdns_responder.h"
#include "mdns_common.h"
#include "dns_debug.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (MDNS_RESPONDER_SUPPORT == ENABLED)


/**
 * @brief Process mDNS query message
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader UDP pseudo header
 * @param[in] udpHeader UDP header
 * @param[in] message Pointer to the mDNS query message
 * @param[in] length Length of the message
 **/

void mdnsProcessQuery(NetInterface *interface, const IpPseudoHeader *pseudoHeader,
   const UdpHeader *udpHeader, const DnsHeader *message, size_t length)
{
   uint_t i;
   size_t n;

   //The following flags tell whether any A or AAAA queries have been found
   bool_t a = FALSE;
   bool_t aaaa = FALSE;

   //Point to the first question
   size_t pos = sizeof(DnsHeader);

   //Parse question section
   for(i = 0; i < ntohs(message->qdcount); i++)
   {
      //Parse domain name
      n = dnsParseName(message, length, pos, NULL);

      //Invalid name?
      if(!n)
         return;
      //Malformed mDNS message?
      if((n + sizeof(DnsQuestion)) > length)
         return;

      //Compare domain name
      if(dnsCompareName(message, length, pos, interface->mdnsHostname))
      {
         uint16_t qclass;
         DnsQuestion *question;

         //Point to the corresponding entry
         question = DNS_GET_QUESTION(message, n);
         //Convert the query class to host byte order
         qclass = ntohs(question->qclass);
         //Discard QU flag
         qclass &= ~MDNS_QCLASS_QU;

         //Check the class of the query
         if(qclass == DNS_RR_CLASS_IN)
         {
#if (IPV4_SUPPORT == ENABLED)
            //A query found?
            if(ntohs(question->qtype) == DNS_RR_TYPE_A)
               a = TRUE;
#endif
#if (IPV6_SUPPORT == ENABLED)
            //AAAA query found?
            if(ntohs(question->qtype) == DNS_RR_TYPE_AAAA)
               aaaa = TRUE;
#endif
         }
      }

      //Point to the next question
      pos = n + sizeof(DnsQuestion);
   }

   //Check whether a match occurred
   if(a || aaaa)
   {
      uint16_t destPort;
      IpAddr destIpAddr;

#if (IPV4_SUPPORT == ENABLED)
      //Check whether the mDNS query was received from an IPv4 peer
      if(pseudoHeader->length == sizeof(Ipv4PseudoHeader))
      {
         //If the source UDP port in a received Multicast DNS query is not port 5353,
         //this indicates that the querier originating the query is a simple resolver
         if(udpHeader->srcPort != HTONS(MDNS_PORT))
         {
            //the mDNS responder must send a UDP response directly back to the querier,
            //via unicast, to the query packet's source IP address and port
            destIpAddr.length = sizeof(Ipv4Addr);
            destIpAddr.ipv4Addr = pseudoHeader->ipv4Data.srcAddr;
         }
         else
         {
            //Use mDNS IPv4 multicast address
            destIpAddr.length = sizeof(Ipv4Addr);
            destIpAddr.ipv4Addr = MDNS_IPV4_MULTICAST_ADDR;
         }
      }
#endif
#if (IPV6_SUPPORT == ENABLED)
      //Check whether the mDNS query was received from an IPv6 peer
      if(pseudoHeader->length == sizeof(Ipv6PseudoHeader))
      {
         //If the source UDP port in a received Multicast DNS query is not port 5353,
         //this indicates that the querier originating the query is a simple resolver
         if(udpHeader->srcPort != HTONS(MDNS_PORT))
         {
            //the mDNS responder must send a UDP response directly back to the querier,
            //via unicast, to the query packet's source IP address and port
            destIpAddr.length = sizeof(Ipv6Addr);
            destIpAddr.ipv6Addr = pseudoHeader->ipv6Data.srcAddr;
         }
         else
         {
            //Use mDNS IPv6 multicast address
            destIpAddr.length = sizeof(Ipv6Addr);
            destIpAddr.ipv6Addr = MDNS_IPV6_MULTICAST_ADDR;
         }
      }
#endif

      //Destination port
      destPort = ntohs(udpHeader->srcPort);

      //Send mDNS response message
      mdnsSendResponse(interface, &destIpAddr, destPort, message->id, a, aaaa);
   }
}


/**
 * @brief Process incoming mDNS query message
 * @param[in] interface Underlying network interface
 * @param[in] destIpAddr Destination IP address
 * @param[in] destPort destination port
 * @param[in] id 16-bit identifier to be used when sending mDNS query
 * @param[in] a A resource record requested
 * @param[in] aaaa AAAA resource record requested
 **/

error_t mdnsSendResponse(NetInterface *interface, const IpAddr *destIpAddr,
   uint16_t destPort, uint16_t id, bool_t a, bool_t aaaa)
{
   error_t error;
   size_t length;
   size_t offset;
   ChunkedBuffer *buffer;
   DnsHeader *message;
   DnsResourceRecord *resourceRecord;

   //Allocate a memory buffer to hold the mDNS response message
   buffer = udpAllocBuffer(DNS_MESSAGE_MAX_SIZE, &offset);
   //Failed to allocate buffer?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the mDNS header
   message = chunkedBufferAt(buffer, offset);

   //Take the identifier from the query message
   message->id = id;

   //Format mDNS response header
   message->qr = 1;
   message->opcode = DNS_OPCODE_QUERY;
   message->aa = 1;
   message->tc = 0;
   message->rd = 0;
   message->ra = 0;
   message->z = 0;
   message->rcode = DNS_RCODE_NO_ERROR;

   //Multicast DNS responses must not contain any questions
   message->qdcount = 0;
   message->ancount = 0;
   message->nscount = 0;
   message->arcount = 0;

   //mDNS response message length
   length = sizeof(DnsHeader);

#if (IPV4_SUPPORT == ENABLED)
   //Send A resource record?
   if(a)
   {
      //Encode the host name using the DNS name notation
      length += dnsEncodeName(interface->mdnsHostname, (uint8_t *) message + length);

      //Point to the corresponding resource record
      resourceRecord = DNS_GET_RESOURCE_RECORD(message, length);
      //Fill in resource record
      resourceRecord->rtype = HTONS(DNS_RR_TYPE_A);
      resourceRecord->rclass = HTONS(DNS_RR_CLASS_IN);
      resourceRecord->ttl = HTONL(MDNS_DEFAULT_RESOURCE_RECORD_TTL);
      resourceRecord->rdlength = HTONS(sizeof(Ipv4Addr));
      //Copy IPv4 address
      ipv4CopyAddr(resourceRecord->rdata, &interface->ipv4Config.addr);

      //Update the length of the mDNS response message
      length += sizeof(DnsResourceRecord) + sizeof(Ipv4Addr);
      //Number of resource records in the answer section
      message->ancount++;
   }
#endif
#if (IPV6_SUPPORT == ENABLED)
   //Send AAAA resource record?
   if(aaaa)
   {
      //Encode the host name using the DNS name notation
      length += dnsEncodeName(interface->mdnsHostname, (uint8_t *) message + length);

      //Point to the corresponding resource record
      resourceRecord = DNS_GET_RESOURCE_RECORD(message, length);
      //Fill in resource record
      resourceRecord->rtype = HTONS(DNS_RR_TYPE_AAAA);
      resourceRecord->rclass = HTONS(DNS_RR_CLASS_IN);
      resourceRecord->ttl = HTONL(MDNS_DEFAULT_RESOURCE_RECORD_TTL);
      resourceRecord->rdlength = HTONS(sizeof(Ipv6Addr));
      //Copy IPv6 address
      ipv6CopyAddr(resourceRecord->rdata, &interface->ipv6Config.linkLocalAddr);

      //Update the length of the mDNS response message
      length += sizeof(DnsResourceRecord) + sizeof(Ipv6Addr);
      //Number of resource records in the answer section
      message->ancount++;
   }
#endif

   //Convert 16-bit value to network byte order
   message->ancount = htons(message->ancount);

   //Adjust the length of the multi-part buffer
   chunkedBufferSetLength(buffer, offset + length);

   //Debug message
   TRACE_INFO("Sending mDNS message (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message
   dnsDumpMessage(message, length);

   //All multicast DNS responses should be sent with an IP TTL set to 255
   error = udpSendDatagramEx(interface, MDNS_PORT, destIpAddr,
      destPort, buffer, offset, MDNS_DEFAULT_IP_TTL);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}

#endif
