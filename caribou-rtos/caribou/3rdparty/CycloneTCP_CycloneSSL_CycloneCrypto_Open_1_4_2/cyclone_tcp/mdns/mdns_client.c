/**
 * @file mdns_client.c
 * @brief mDNS client (Multicast DNS)
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
#include "mdns_client.h"
#include "mdns_common.h"
#include "dns_debug.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (MDNS_CLIENT_SUPPORT == ENABLED)


/**
 * @brief Resolve a host name using mDNS
 * @param[in] interface Underlying network interface
 * @param[in] name Name of the host to be resolved
 * @param[in] type Host type (IPv4 or IPv6)
 * @param[out] ipAddr IP address corresponding to the specified host name
 **/

error_t mdnsResolve(NetInterface *interface,
   const char_t *name, HostType type, IpAddr *ipAddr)
{
   error_t error;
   systime_t delay;
   DnsCacheEntry *entry;

   //Debug message
   TRACE_INFO("Resolving host name %s (mDNS resolver)...\r\n", name);

   //Acquire exclusive access to the DNS cache
   osMutexAcquire(dnsCacheMutex);

   //Search the DNS cache for the specified host name
   entry = dnsFindEntry(interface, name, type, HOST_NAME_RESOLVER_MDNS);

   //Check whether a matching entry has been found
   if(entry)
   {
      //Host name already resolved?
      if(entry->state == DNS_STATE_RESOLVED ||
         entry->state == DNS_STATE_PERMANENT)
      {
         //Return the corresponding IP address
         *ipAddr = entry->ipAddr;
         //Successful host name resolution
         error = NO_ERROR;
      }
      else
      {
         //Host name resolution is in progress...
         error = ERROR_IN_PROGRESS;
      }
   }
   else
   {
      //If no entry exists, then create a new one
      entry = dnsCreateEntry();

      //Record the host name whose IP address is unknown
      strcpy(entry->name, name);

      //Initialize DNS cache entry
      entry->type = type;
      entry->protocol = HOST_NAME_RESOLVER_MDNS;
      entry->interface = interface;

      //Initialize retransmission counter
      entry->retransmitCount = MDNS_CLIENT_MAX_RETRIES;
      //Send mDNS query
      error = mdnsSendQuery(entry);

      //mDNS message successfully sent?
      if(!error)
      {
         //Save the time at which the query message was sent
         entry->timestamp = osGetTickCount();
         //Set timeout value
         entry->timeout = MDNS_CLIENT_INIT_TIMEOUT;
         entry->maxTimeout = MDNS_CLIENT_MAX_TIMEOUT;
         //Decrement retransmission counter
         entry->retransmitCount--;

         //Switch state
         entry->state = DNS_STATE_IN_PROGRESS;
         //Host name resolution is in progress
         error = ERROR_IN_PROGRESS;
      }
   }

   //Release exclusive access to the DNS cache
   osMutexRelease(dnsCacheMutex);

   //Set default polling interval
   delay = DNS_CACHE_INIT_POLLING_INTERVAL;

   //Wait the host name resolution to complete
   while(error == ERROR_IN_PROGRESS)
   {
      //Wait until the next polling period
      osDelay(delay);

      //Acquire exclusive access to the DNS cache
      osMutexAcquire(dnsCacheMutex);

      //Search the DNS cache for the specified host name
      entry = dnsFindEntry(interface, name, type, HOST_NAME_RESOLVER_MDNS);

      //Check whether a matching entry has been found
      if(entry)
      {
         //Host name successfully resolved?
         if(entry->state == DNS_STATE_RESOLVED)
         {
            //Return the corresponding IP address
            *ipAddr = entry->ipAddr;
            //Successful host name resolution
            error = NO_ERROR;
         }
      }
      else
      {
         //Host name resolution failed
         error = ERROR_FAILURE;
      }

      //Release exclusive access to the DNS cache
      osMutexRelease(dnsCacheMutex);

      //Backoff support for less aggressive polling
      delay = min(delay * 2, DNS_CACHE_MAX_POLLING_INTERVAL);
   }

   //Check status code
   if(error)
   {
      //Failed to resolve host name
      TRACE_INFO("Host name resolution failed!\r\n");
   }
   else
   {
      //Successful host name resolution
      TRACE_INFO("Host name resolved to %s...\r\n", ipAddrToString(ipAddr, NULL));
   }

   //Return status code
   return error;
}


/**
 * @brief Send a mDNS query message
 * @param[in] entry Pointer to a valid DNS cache entry
 * @return Error code
 **/

error_t mdnsSendQuery(DnsCacheEntry *entry)
{
   error_t error;
   size_t length;
   size_t offset;
   ChunkedBuffer *buffer;
   DnsHeader *message;
   DnsQuestion *dnsQuestion;
   IpAddr destIpAddr;

#if (IPV4_SUPPORT == ENABLED)
   //An IPv4 address is expected?
   if(entry->type == HOST_TYPE_IPV4)
   {
      //Select the relevant multicast address (224.0.0.251)
      destIpAddr.length = sizeof(Ipv4Addr);
      destIpAddr.ipv4Addr = MDNS_IPV4_MULTICAST_ADDR;
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //An IPv6 address is expected?
   if(entry->type == HOST_TYPE_IPV6)
   {
      //Select the relevant multicast address (ff02::fb)
      destIpAddr.length = sizeof(Ipv6Addr);
      destIpAddr.ipv6Addr = MDNS_IPV6_MULTICAST_ADDR;
   }
   else
#endif
   //Invalid host type?
   {
      //Report an error
      return ERROR_INVALID_PARAMETER;
   }

   //Allocate a memory buffer to hold the mDNS query message
   buffer = udpAllocBuffer(DNS_MESSAGE_MAX_SIZE, &offset);
   //Failed to allocate buffer?
   if(!buffer) return ERROR_OUT_OF_MEMORY;

   //Point to the mDNS header
   message = chunkedBufferAt(buffer, offset);

   //Format mDNS query message
   message->id = 0;
   message->qr = 0;
   message->opcode = DNS_OPCODE_QUERY;
   message->aa = 0;
   message->tc = 0;
   message->rd = 0;
   message->ra = 0;
   message->z = 0;
   message->rcode = DNS_RCODE_NO_ERROR;

   //The mDNS query contains one question
   message->qdcount = HTONS(1);
   message->ancount = 0;
   message->nscount = 0;
   message->arcount = 0;

   //Length of the mDNS query message
   length = sizeof(DnsHeader);

   //Encode the host name using the DNS name notation
   length += dnsEncodeName(entry->name, message->questions);

   //Point to the corresponding question structure
   dnsQuestion = DNS_GET_QUESTION(message, length);

#if (IPV4_SUPPORT == ENABLED)
   //An IPv4 address is expected?
   if(entry->type == HOST_TYPE_IPV4)
   {
      //Fill in question structure
      dnsQuestion->qtype = HTONS(DNS_RR_TYPE_A);
      dnsQuestion->qclass = HTONS(DNS_RR_CLASS_IN);
   }
#endif
#if (IPV6_SUPPORT == ENABLED)
   //An IPv6 address is expected?
   if(entry->type == HOST_TYPE_IPV6)
   {
      //Fill in question structure
      dnsQuestion->qtype = HTONS(DNS_RR_TYPE_AAAA);
      dnsQuestion->qclass = HTONS(DNS_RR_CLASS_IN);
   }
#endif

   //Update the length of the mDNS query message
   length += sizeof(DnsQuestion);

   //Adjust the length of the multi-part buffer
   chunkedBufferSetLength(buffer, offset + length);

   //Debug message
   TRACE_INFO("Sending mDNS message (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message
   dnsDumpMessage(message, length);

   //All multicast DNS queries should be sent with an IP TTL set to 255
   error = udpSendDatagramEx(entry->interface, MDNS_PORT,
      &destIpAddr, MDNS_PORT, buffer, offset, MDNS_DEFAULT_IP_TTL);

   //Free previously allocated memory
   chunkedBufferFree(buffer);
   //Return status code
   return error;
}


/**
 * @brief Process mDNS response message
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader UDP pseudo header
 * @param[in] udpHeader UDP header
 * @param[in] message Pointer to the mDNS response message
 * @param[in] length Length of the message
 **/

void mdnsProcessResponse(NetInterface *interface, const IpPseudoHeader *pseudoHeader,
   const UdpHeader *udpHeader, const DnsHeader *message, size_t length)
{
   uint_t i;
   uint_t j;
   size_t n;
   size_t pos;
   uint16_t rclass;
   DnsResourceRecord *resourceRecord;
   DnsCacheEntry *entry;

   //Acquire exclusive access to the DNS cache
   osMutexAcquire(dnsCacheMutex);

   //Loop through DNS cache entries
   for(i = 0; i < DNS_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &dnsCache[i];

      //mDNS name resolution in progress?
      if(entry->state == DNS_STATE_IN_PROGRESS &&
         entry->protocol == HOST_NAME_RESOLVER_MDNS)
      {
         //Point to the question section
         pos = sizeof(DnsHeader);

         //Any questions in the question section of a received mDNS
         //response must be silently ignored
         for(j = 0; j < ntohs(message->qdcount); j++)
         {
            //Parse domain name
            pos = dnsParseName(message, length, pos, NULL);
            //Invalid name?
            if(!pos) break;

            //Point to the next question
            pos += sizeof(DnsQuestion);
            //Make sure the mDNS message is valid
            if(pos > length) break;
         }

         //Malformed mDNS message
         if(j < ntohs(message->qdcount))
            break;

         //Parse answer resource records
         for(j = 0; j < ntohs(message->ancount); j++)
         {
            //Parse domain name
            n = dnsParseName(message, length, pos, NULL);
            //Invalid name?
            if(!n) break;

            //Point to the associated resource record
            resourceRecord = DNS_GET_RESOURCE_RECORD(message, n);
            //Point to the resource data
            n += sizeof(DnsResourceRecord);

            //Make sure the resource record is valid
            if(n >= length)
               break;
            if((n + ntohs(resourceRecord->rdlength)) > length)
               break;

            //Compare domain name
            if(dnsCompareName(message, length, pos, entry->name))
            {
               //Convert the class to host byte order
               rclass = ntohs(resourceRecord->rclass);
               //Discard Cache Flush flag
               rclass &= ~MDNS_RCLASS_CACHE_FLUSH;

               //Check the class of the resource record
               if(rclass == DNS_RR_CLASS_IN)
               {
#if (IPV4_SUPPORT == ENABLED)
                  //IPv4 address expected?
                  if(entry->type == HOST_TYPE_IPV4)
                  {
                     //A resource record found?
                     if(ntohs(resourceRecord->rtype) == DNS_RR_TYPE_A)
                     {
                        //Verify the length of the data field
                        if(ntohs(resourceRecord->rdlength) == sizeof(Ipv4Addr))
                        {
                           //Copy the IPv4 address
                           entry->ipAddr.length = sizeof(Ipv4Addr);
                           ipv4CopyAddr(&entry->ipAddr.ipv4Addr, resourceRecord->rdata);

                           //Save current time
                           entry->timestamp = osGetTickCount();
                           //Save TTL value
                           entry->timeout = ntohl(resourceRecord->ttl) * 1000;
                           //Limit the lifetime of the mDNS cache entries
                           entry->timeout = min(entry->timeout, MDNS_MAX_LIFETIME);

                           //Host name successfully resolved
                           entry->state = DNS_STATE_RESOLVED;
                        }
                     }
                  }
#endif
#if (IPV6_SUPPORT == ENABLED)
                  //IPv6 address expected?
                  if(entry->type == HOST_TYPE_IPV6)
                  {
                     //AAAA resource record found?
                     if(ntohs(resourceRecord->rtype) == DNS_RR_TYPE_AAAA)
                     {
                        //Verify the length of the data field
                        if(ntohs(resourceRecord->rdlength) == sizeof(Ipv6Addr))
                        {
                           //Copy the IPv6 address
                           entry->ipAddr.length = sizeof(Ipv6Addr);
                           ipv6CopyAddr(&entry->ipAddr.ipv6Addr, resourceRecord->rdata);

                           //Save current time
                           entry->timestamp = osGetTickCount();
                           //Save TTL value
                           entry->timeout = ntohl(resourceRecord->ttl) * 1000;
                           //Limit the lifetime of the mDNS cache entries
                           entry->timeout = min(entry->timeout, MDNS_MAX_LIFETIME);

                           //Host name successfully resolved
                           entry->state = DNS_STATE_RESOLVED;
                        }
                     }
                  }
#endif
               }
            }

            //Point to the next resource record
            pos = n + ntohs(resourceRecord->rdlength);
         }

         //Malformed mDNS message
         if(j < ntohs(message->ancount))
            break;
      }
   }

   //Release exclusive access to the DNS cache
   osMutexRelease(dnsCacheMutex);
}

#endif
