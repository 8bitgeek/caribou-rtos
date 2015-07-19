/**
 * @file dns_cache.c
 * @brief DNS cache management
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
#define TRACE_LEVEL DNS_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include "tcp_ip_stack.h"
#include "dns_cache.h"
#include "dns_client.h"
#include "mdns_client.h"
#include "udp.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (DNS_CLIENT_SUPPORT == ENABLED || MDNS_CLIENT_SUPPORT == ENABLED)

//Mutex preventing simultaneous access to the DNS cache
OsMutex *dnsCacheMutex;
//DNS cache
DnsCacheEntry dnsCache[DNS_CACHE_SIZE];


/**
 * @brief DNS cache initialization
 * @return Error code
 **/

error_t dnsInit(void)
{
   //Create a mutex to prevent simultaneous access to the DNS cache
   dnsCacheMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(dnsCacheMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Initialize DNS cache
   memset(dnsCache, 0, sizeof(dnsCache));

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Flush DNS cache
 * @param[in] interface Underlying network interface
 **/

void dnsFlushCache(NetInterface *interface)
{
   uint_t i;
   DnsCacheEntry *entry;

   //Acquire exclusive access to the DNS cache
   osMutexAcquire(dnsCacheMutex);

   //Go through DNS cache
   for(i = 0; i < DNS_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &dnsCache[i];

      //Check whether the entry is currently in used
      if(entry->state != DNS_STATE_NONE)
      {
         //Delete DNS entries only for the given network interface
         if(entry->interface == interface)
            dnsDeleteEntry(entry);
      }
   }

   //Release exclusive access to the DNS cache
   osMutexRelease(dnsCacheMutex);
}


/**
 * @brief Create a new entry in the DNS cache
 * @return Pointer to the newly created entry
 **/

DnsCacheEntry *dnsCreateEntry(void)
{
   uint_t i;
   DnsCacheEntry *entry;
   DnsCacheEntry *oldestEntry;

   //Keep track of the oldest entry
   oldestEntry = &dnsCache[0];

   //Loop through DNS cache entries
   for(i = 0; i < DNS_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &dnsCache[i];

      //Check whether the entry is currently in used or not
      if(entry->state == DNS_STATE_NONE)
      {
         //Erase contents
         memset(entry, 0, sizeof(DnsCacheEntry));
         //Return a pointer to the DNS entry
         return entry;
      }

      //Keep track of the oldest entry in the table
      if(timeCompare(entry->timestamp, oldestEntry->timestamp) < 0)
         oldestEntry = entry;
   }

   //The oldest entry is removed whenever the table runs out of space
   dnsDeleteEntry(oldestEntry);
   //Erase contents
   memset(oldestEntry, 0, sizeof(DnsCacheEntry));
   //Return a pointer to the DNS entry
   return oldestEntry;
}


/**
 * @brief Delete the specified DNS cache entry
 * @param[in] entry Pointer to the DNS cache entry to be deleted
 **/

void dnsDeleteEntry(DnsCacheEntry *entry)
{
   //Make sure the specified entry is valid
   if(entry != NULL)
   {
#if (DNS_CLIENT_SUPPORT == ENABLED)
      //DNS resolver?
      if(entry->protocol == HOST_NAME_RESOLVER_DNS)
      {
         //Name resolution in progress?
         if(entry->state == DNS_STATE_IN_PROGRESS)
         {
            //Unregister user callback
            udpDetachRxCallback(entry->interface, entry->port);
         }
      }
#endif
      //Delete DNS cache entry
      entry->state = DNS_STATE_NONE;
   }
}


/**
 * @brief Search the DNS cache for a given domain name
 * @param[in] interface Underlying network interface
 * @param[in] name Domain name
 * @param[in] type Host type (IPv4 or IPv6)
 * @param[in] protocol Host name resolution protocol
 * @return A pointer to the matching DNS entry is returned. NULL is returned
 *   if the specified domain name could not be found in the DNS cache
 **/

DnsCacheEntry *dnsFindEntry(NetInterface *interface,
   const char_t *name, HostType type, HostnameResolver protocol)
{
   uint_t i;
   DnsCacheEntry *entry;

   //Loop through DNS cache entries
   for(i = 0; i < DNS_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &dnsCache[i];

      //Make sure that the entry is currently in used
      if(entry->state == DNS_STATE_NONE)
         continue;

      //Filter out entries that do not match the specified criteria
      if(entry->interface != interface)
         continue;
      if(entry->type != type && type != HOST_TYPE_ANY)
         continue;
      if(entry->protocol != protocol && protocol != HOST_NAME_RESOLVER_ANY)
         continue;

      //Does the entry match the specified domain name?
      if(name == NULL || !strcasecmp(entry->name, name))
         return entry;
   }

   //No matching entry in the DNS cache...
   return NULL;
}


/**
 * @brief DNS timer handler
 *
 * This routine must be periodically called by the TCP/IP stack to
 * manage DNS cache
 *
 **/

void dnsTick(void)
{
   error_t error;
   uint_t i;
   systime_t time;
   DnsCacheEntry *entry;

   //Get current time
   time = osGetTickCount();

   //Acquire exclusive access to the DNS cache
   osMutexAcquire(dnsCacheMutex);

   //Go through DNS cache
   for(i = 0; i < DNS_CACHE_SIZE; i++)
   {
      //Point to the current entry
      entry = &dnsCache[i];

      //Name resolution in progress?
      if(entry->state == DNS_STATE_IN_PROGRESS)
      {
         //The request timed out?
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Check whether the maximum number of retransmissions has been exceeded
            if(entry->retransmitCount > 0)
            {
#if (DNS_CLIENT_SUPPORT == ENABLED)
               //DNS resolver?
               if(entry->protocol == HOST_NAME_RESOLVER_DNS)
               {
                  //Retransmit DNS query
                  error = dnsSendQuery(entry);
               }
               else
#endif
#if (MDNS_CLIENT_SUPPORT == ENABLED)
               //mDNS resolver?
               if(entry->protocol == HOST_NAME_RESOLVER_MDNS)
               {
                  //Retransmit mDNS query
                  error = mdnsSendQuery(entry);
               }
               else
#endif
               //Unknown protocol?
               {
                  error = ERROR_FAILURE;
               }

               //Query message successfully sent?
               if(!error)
               {
                  //Save the time at which the query message was sent
                  entry->timestamp = time;
                  //The timeout value is doubled for each subsequent retransmission
                  entry->timeout = min(entry->timeout * 2, entry->maxTimeout);
                  //Decrement retransmission counter
                  entry->retransmitCount--;
               }
               else
               {
                  //The entry should be deleted since name resolution has failed
                  dnsDeleteEntry(entry);
               }
            }
#if (DNS_CLIENT_SUPPORT == ENABLED)
            //DNS resolver?
            else if(entry->protocol == HOST_NAME_RESOLVER_DNS)
            {
               //Select the next DNS server
               entry->dnsServerNum++;
               //Initialize retransmission counter
               entry->retransmitCount = DNS_CLIENT_MAX_RETRIES;
               //Send DNS query
               error = dnsSendQuery(entry);

               //DNS message successfully sent?
               if(!error)
               {
                  //Save the time at which the query message was sent
                  entry->timestamp = time;
                  //Set timeout value
                  entry->timeout = DNS_CLIENT_INIT_TIMEOUT;
                  //Decrement retransmission counter
                  entry->retransmitCount--;
               }
               else
               {
                  //The entry should be deleted since name resolution has failed
                  dnsDeleteEntry(entry);
               }
            }
#endif
            else
            {
               //The maximum number of retransmissions has been exceeded
               dnsDeleteEntry(entry);
            }
         }
      }
      //Name successfully resolved?
      else if(entry->state == DNS_STATE_RESOLVED)
      {
         //Check the lifetime of the current DNS cache entry
         if((time - entry->timestamp) >= entry->timeout)
         {
            //Periodically time out DNS cache entries
            dnsDeleteEntry(entry);
         }
      }
   }

   //Release exclusive access to the DNS cache
   osMutexRelease(dnsCacheMutex);
}

#endif
