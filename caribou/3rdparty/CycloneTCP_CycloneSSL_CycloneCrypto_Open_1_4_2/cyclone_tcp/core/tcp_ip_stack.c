/**
 * @file tcp_ip_stack.c
 * @brief TCP/IP stack
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
#define TRACE_LEVEL ETH_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include "tcp_ip_stack.h"
#include "socket.h"
#include "tcp_timer.h"
#include "ethernet.h"
#include "arp.h"
#include "ipv4.h"
#include "igmp.h"
#include "ipv6.h"
#include "mld.h"
#include "ndp.h"
#include "dns_cache.h"
#include "dns_client.h"
#include "mdns_client.h"
#include "mdns_responder.h"
#include "mdns_common.h"
#include "debug.h"

//Network interfaces
NetInterface netInterface[NET_INTERFACE_COUNT];

//Pseudo-random number generator state
static uint32_t prngState = 0;

//Mutex to prevent simultaneous access to the callback table
static OsMutex *callbackTableMutex;
//Table that holds the registered user callbacks
static LinkChangeCallbackDesc callbackTable[TCP_IP_CALLBACK_TABLE_SIZE];

//Check TCP/IP stack configuration
#if (TCP_IP_STATIC_OS_RESOURCES == ENABLED)

//Task responsible for handling periodic operations
static OsTask tickTask;
static uint_t tickTaskStack[TCP_IP_TICK_STACK_SIZE];

#endif


/**
 * @brief TCP/IP stack initialization
 * @return Error code
 **/

error_t tcpIpStackInit(void)
{
   error_t error;
   uint_t i;

#if (TCP_IP_STATIC_OS_RESOURCES == DISABLED)
   OsTask *task;
#endif

   //Memory pool initialization
   error = memPoolInit();
   //Any error to report?
   if(error) return error;

   //Clear configuration data for each interface
   memset(netInterface, 0, sizeof(netInterface));

   //Loop through network interfaces
   for(i = 0; i < NET_INTERFACE_COUNT; i++)
   {
      //Default interface identifier
      netInterface[i].id = i;
      //Default name
      sprintf(netInterface[i].name, "eth%u", i);
   }

   //Create a mutex to prevent simultaneous access to the callback table
   callbackTableMutex = osMutexCreate(FALSE);
   //Any error to report?
   if(callbackTableMutex == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Initialize callback table
   memset(callbackTable, 0, sizeof(callbackTable));

   //Socket related initialization
   error = socketInit();
   //Any error to report?
   if(error) return error;

#if (UDP_SUPPORT == ENABLED)
   //UDP related initialization
   error = udpInit();
   //Any error to report?
   if(error) return error;
#endif

#if (DNS_CLIENT_SUPPORT == ENABLED || MDNS_CLIENT_SUPPORT == ENABLED)
   //DNS cache initialization
   error = dnsInit();
   //Any error to report?
   if(error) return error;
#endif

#if (TCP_IP_STATIC_OS_RESOURCES == ENABLED)
   //Create task to handle periodic operations
   osTaskCreateStatic(&tickTask, "TCP/IP Stack (Tick)", tcpIpStackTickTask,
      NULL, tickTaskStack, TCP_IP_TICK_STACK_SIZE, TCP_IP_TICK_PRIORITY);
#else
   //Create task to handle periodic operations
   task = osTaskCreate("TCP/IP Stack (Tick)", tcpIpStackTickTask,
      NULL, TCP_IP_TICK_STACK_SIZE, TCP_IP_TICK_PRIORITY);

   //Unable to create the task?
   if(task == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;
#endif

   //Return status code
   return error;
}


/**
 * @brief Set interface name
 * @param[in] interface Pointer to the desired network interface
 * @param[in] name NULL-terminated string that contains the interface name
 * @return Error code
 **/

error_t tcpIpStackSetInterfaceName(NetInterface *interface, const char_t *name)
{
   size_t n;

   //Check parameters
   if(interface == NULL || name == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get the length of the string
   n = strlen(name);
   //Limit the number of characters to be copied
   n = min(n, TCP_IP_MAX_IF_NAME_LEN - 1);

   //Set interface name
   strncpy(interface->name, name, n);
   //Properly terminate the string with a NULL character
   interface->name[n] = '\0';

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set host name
 * @param[in] interface Pointer to the desired network interface
 * @param[in] name NULL-terminated string that contains the host name
 * @return Error code
 **/

error_t tcpIpStackSetHostname(NetInterface *interface, const char_t *name)
{
   size_t n;

   //Check parameters
   if(interface == NULL || name == NULL)
      return ERROR_INVALID_PARAMETER;

   //Get the length of the string
   n = strlen(name);
   //Limit the number of characters to be copied
   n = min(n, TCP_IP_MAX_HOSTNAME_LEN - 1);

   //Set host name
   strncpy(interface->hostname, name, n);
   //Properly terminate the string with a NULL character
   interface->hostname[n] = '\0';

   //mDNS names always end with .local
   strncpy(interface->mdnsHostname, name, n);
   strcpy(interface->mdnsHostname + n, ".local");

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set Ethernet MAC driver
 * @param[in] interface Pointer to the desired network interface
 * @param[in] driver Ethernet MAC driver
 * @return Error code
 **/

error_t tcpIpStackSetDriver(NetInterface *interface, const NicDriver *driver)
{
   //Check parameters
   if(interface == NULL || driver == NULL)
      return ERROR_INVALID_PARAMETER;

   //Set MAC driver
   interface->nicDriver = driver;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set Ethernet PHY driver
 * @param[in] interface Pointer to the desired network interface
 * @param[in] driver Ethernet PHY driver (can be NULL for MAC + PHY controller)
 * @return Error code
 **/

error_t tcpIpStackSetPhyDriver(NetInterface *interface, const PhyDriver *driver)
{
   //Check parameters
   if(interface == NULL || driver == NULL)
      return ERROR_INVALID_PARAMETER;

   //Set PHY driver
   interface->phyDriver = driver;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set MAC address
 * @param[in] interface Pointer to the desired network interface
 * @param[in] macAddr MAC address
 * @return Error code
 **/


error_t tcpIpStackSetMacAddr(NetInterface *interface, const MacAddr *macAddr)
{
   //Check parameters
   if(interface == NULL || macAddr == NULL)
      return ERROR_INVALID_PARAMETER;

   //Set MAC address
   interface->macAddr = *macAddr;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Configure network interface
 * @param[in] interface Network interface to configure
 * @return Error code
 **/

error_t tcpIpStackConfigInterface(NetInterface *interface)
{
   error_t error;

   //Check parameter
   if(interface == NULL)
      return ERROR_INVALID_PARAMETER;

   //Disable Ethernet controller interrupts
   interface->nicDriver->disableIrq(interface);

   //Start of exception handling block
   do
   {
      //Receive notifications when the transmitter is ready to send
      interface->nicTxEvent = osEventCreate(FALSE);
      //Out of resources?
      if(interface->nicTxEvent == OS_INVALID_HANDLE)
      {
         //Report an error
         error = ERROR_OUT_OF_RESOURCES;
         //Stop immediately
         break;
      }

      //Receive notifications when a Ethernet frame has been received,
      //or the link status has changed
      interface->nicRxEvent = osEventCreate(FALSE);
      //Out of resources?
      if(interface->nicRxEvent == OS_INVALID_HANDLE)
      {
         //Report an error
         error = ERROR_OUT_OF_RESOURCES;
         //Stop immediately
         break;
      }

      //Create a mutex to prevent simultaneous access to the NIC driver
      interface->nicDriverMutex = osMutexCreate(FALSE);
      //Out of resources?
      if(interface->nicDriverMutex == OS_INVALID_HANDLE)
      {
         //Report an error
         error = ERROR_OUT_OF_RESOURCES;
         //Stop immediately
         break;
      }

      //Network controller initialization
      error = interface->nicDriver->init(interface);
      //Any error to report?
      if(error) break;

#if (ETH_SUPPORT == ENABLED)
      //Ethernet related initialization
      error = ethInit(interface);
      //Any error to report?
      if(error) break;
#endif

//IPv4 specific initialization
#if (IPV4_SUPPORT == ENABLED)
      //Network layer initialization
      error = ipv4Init(interface);
      //Any error to report?
      if(error) break;

      //ARP cache initialization
      error = arpInit(interface);
      //Any error to report?
      if(error) break;

#if (IGMP_SUPPORT == ENABLED)
      //IGMP related initialization
      error = igmpInit(interface);
      //Any error to report?
      if(error) break;

      //Join the all-systems group
      error = ipv4JoinMulticastGroup(interface, IGMP_ALL_SYSTEMS_ADDR);
      //Any error to report?
      if(error) break;
#endif
#endif

//IPv6 specific initialization
#if (IPV6_SUPPORT == ENABLED)
      //Network layer initialization
      error = ipv6Init(interface);
      //Any error to report?
      if(error) break;

#if (NDP_SUPPORT == ENABLED)
      //Neighbor cache initialization
      error = ndpInit(interface);
      //Any error to report?
      if(error) break;
#endif

#if (MLD_SUPPORT == ENABLED)
      ///MLD related initialization
      error = mldInit(interface);
      //Any error to report?
      if(error) break;
#endif

      //Join the All-Nodes multicast address
      error = ipv6JoinMulticastGroup(interface, &IPV6_LINK_LOCAL_ALL_NODES_ADDR);
      //Any error to report?
      if(error) break;
#endif

#if (MDNS_CLIENT_SUPPORT == ENABLED || MDNS_RESPONDER_SUPPORT == ENABLED)
   //mDNS related initialization
   error = mdnsInit(interface);
   //Any error to report?
   if(error) break;
#endif

#if (TCP_IP_STATIC_OS_RESOURCES == ENABLED)
      //Create a task to process incoming frames
      osTaskCreateStatic(&interface->rxTask, "TCP/IP Stack (RX)", tcpIpStackRxTask,
         interface, interface->rxTaskStack, TCP_IP_TICK_STACK_SIZE, TCP_IP_TICK_PRIORITY);
#else
      //Create a task to process incoming frames
      interface->rxTask = osTaskCreate("TCP/IP Stack (RX)", tcpIpStackRxTask,
         interface, TCP_IP_RX_STACK_SIZE, TCP_IP_RX_PRIORITY);

      //Unable to create the task?
      if(interface->rxTask == OS_INVALID_HANDLE)
         error = ERROR_OUT_OF_RESOURCES;
#endif

      //End of exception handling block
   } while(0);

   //Check whether the interface is fully configured
   if(!error)
   {
      //Successful interface configuration
      interface->configured = TRUE;
      //Interrupts can be safely enabled
      interface->nicDriver->enableIrq(interface);
   }
   else
   {
      //Clean up side effects before returning
      osEventClose(interface->nicTxEvent);
      osEventClose(interface->nicRxEvent);
      osMutexClose(interface->nicDriverMutex);
   }

   //Return status code
   return error;
}


/**
 * @brief Task responsible for handling periodic operations
 **/

void tcpIpStackTickTask(void *param)
{
   uint_t i;

   //Initialize prescalers
   uint_t nicTickPrescaler = 0;
#if (IPV4_SUPPORT == ENABLED)
   uint_t arpTickPrescaler = 0;
#endif
#if (IPV4_SUPPORT == ENABLED && IPV4_FRAG_SUPPORT == ENABLED)
   uint_t ipv4FragTickPrescaler = 0;
#endif
#if (IPV4_SUPPORT == ENABLED && IGMP_SUPPORT == ENABLED)
   uint_t igmpTickPrescaler = 0;
#endif
#if (IPV6_SUPPORT == ENABLED && NDP_SUPPORT == ENABLED)
   uint_t ndpTickPrescaler = 0;
#endif
#if (IPV6_SUPPORT == ENABLED && IPV6_FRAG_SUPPORT == ENABLED)
   uint_t ipv6FragTickPrescaler = 0;
#endif
#if (IPV6_SUPPORT == ENABLED && MLD_SUPPORT == ENABLED)
   uint_t mldTickPrescaler = 0;
#endif
#if (TCP_SUPPORT == ENABLED)
   uint_t tcpTickPrescaler = 0;
#endif
#if (DNS_CLIENT_SUPPORT == ENABLED || MDNS_CLIENT_SUPPORT == ENABLED)
   uint_t dnsTickPrescaler = 0;
#endif

   //Main loop
   while(1)
   {
      //Wait for the TCP/IP stack tick interval
      osDelay(TCP_IP_TICK_INTERVAL);

      //Update prescaler
      nicTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Handle periodic operations such as polling the link state
      if(nicTickPrescaler >= NIC_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               nicTick(&netInterface[i]);
         }

         //Clear prescaler
         nicTickPrescaler = 0;
      }

#if (IPV4_SUPPORT == ENABLED)
      //Update prescaler
      arpTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Manage ARP cache
      if(arpTickPrescaler >= ARP_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               arpTick(&netInterface[i]);
         }

         //Clear prescaler
         arpTickPrescaler = 0;
      }
#endif

#if (IPV4_SUPPORT == ENABLED && IPV4_FRAG_SUPPORT == ENABLED)
      //Update prescaler
      ipv4FragTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Handle IPv4 fragment reassembly timeout
      if(ipv4FragTickPrescaler >= IPV4_FRAG_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               ipv4FragTick(&netInterface[i]);
         }

         //Clear prescaler
         ipv4FragTickPrescaler = 0;
      }
#endif

#if (IPV4_SUPPORT == ENABLED && IGMP_SUPPORT == ENABLED)
      //Update prescaler
      igmpTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Handle IGMP related timers
      if(igmpTickPrescaler >= IGMP_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               igmpTick(&netInterface[i]);
         }

         //Clear prescaler
         igmpTickPrescaler = 0;
      }
#endif

#if (IPV6_SUPPORT == ENABLED && NDP_SUPPORT == ENABLED)
      //Update prescaler
      ndpTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Manage Neighbor cache
      if(ndpTickPrescaler >= NDP_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               ndpTick(&netInterface[i]);
         }

         //Clear prescaler
         ndpTickPrescaler = 0;
      }
#endif

#if (IPV6_SUPPORT == ENABLED && IPV6_FRAG_SUPPORT == ENABLED)
      //Update prescaler
      ipv6FragTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Handle IPv4 fragment reassembly timeout
      if(ipv6FragTickPrescaler >= IPV6_FRAG_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               ipv6FragTick(&netInterface[i]);
         }

         //Clear prescaler
         ipv6FragTickPrescaler = 0;
      }
#endif

#if (IPV6_SUPPORT == ENABLED && MLD_SUPPORT == ENABLED)
      //Update prescaler
      mldTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Handle MLD related timers
      if(mldTickPrescaler >= MLD_TICK_INTERVAL)
      {
         //Loop through network interfaces
         for(i = 0; i < NET_INTERFACE_COUNT; i++)
         {
            //Make sure the interface has been properly configured
            if(netInterface[i].configured)
               mldTick(&netInterface[i]);
         }

         //Clear prescaler
         mldTickPrescaler = 0;
      }
#endif

#if (TCP_SUPPORT == ENABLED)
      //Update TCP tick prescaler
      tcpTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Manage TCP related timers
      if(tcpTickPrescaler >= TCP_TICK_INTERVAL)
      {
         //TCP timer handler
         tcpTick();
         //Clear prescaler
         tcpTickPrescaler = 0;
      }
#endif

#if (DNS_CLIENT_SUPPORT == ENABLED || MDNS_CLIENT_SUPPORT == ENABLED)
      //Update DNS tick prescaler
      dnsTickPrescaler += TCP_IP_TICK_INTERVAL;

      //Manage DNS cache
      if(dnsTickPrescaler >= DNS_TICK_INTERVAL)
      {
         //DNS timer handler
         dnsTick();
         //Clear prescaler
         dnsTickPrescaler = 0;
      }
#endif
   }
}


/**
 * @brief Task in charge of processing incoming frames
 * @param[in] param Underlying network interface
 **/

void tcpIpStackRxTask(void *param)
{
   //Point to the structure describing the network interface
   NetInterface *interface = (NetInterface *) param;

   //Main loop
   while(1)
   {
      //Receive notifications when a Ethernet frame has been received,
      //or the link status has changed
      osEventWait(interface->nicRxEvent, INFINITE_DELAY);

      //Get exclusive access to the device
      osMutexAcquire(interface->nicDriverMutex);
      //Disable Ethernet controller interrupts
      interface->nicDriver->disableIrq(interface);

      //Handle incoming packets and link state changes
      interface->nicDriver->rxEventHandler(interface);

      //Re-enable Ethernet controller interrupts
      interface->nicDriver->enableIrq(interface);
      //Release exclusive access to the device
      osMutexRelease(interface->nicDriverMutex);
   }
}


/**
 * @brief Get default network interface
 * @return Pointer to the default network interface to be used
 **/

NetInterface *tcpIpStackGetDefaultInterface(void)
{
   //Default network interface
   return &netInterface[0];
}


/**
 * @brief Seed random number generator
 * @param[in] seed Seed for a new sequence of pseudo-random data
 * @return Error code
 **/

error_t tcpIpStackInitRand(uint32_t seed)
{
   //Seed the pseudo-random number generator
   prngState += seed;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Get a random value
 * @return Error code
 **/

uint32_t tcpIpStackGetRand(void)
{
   uint32_t result;

   //Use a linear congruential generator (LCG) to update the state of the PRNG
   prngState *= 1103515245;
   prngState += 12345;
   result = (prngState >> 16) & 0x07FF;

   prngState *= 1103515245;
   prngState += 12345;
   result <<= 10;
   result |= (prngState >> 16) & 0x03FF;

   prngState *= 1103515245;
   prngState += 12345;
   result <<= 10;
   result |= (prngState >> 16) & 0x03FF;

   //Return the resulting value
   return result;
}


/**
 * @brief Register link change callback
 * @param[in] interface Underlying network interface
 * @param[in] callback Callback function to be called when the link state changed
 * @param[in] params Callback function parameter (optional)
 * @param[out] cookie Identifier that can be used to unregister the callback function
 * @return Error code
 **/

error_t tcpIpStackAttachLinkChangeCallback(NetInterface *interface,
   LinkChangeCallback callback, void *params, uint_t *cookie)
{
   uint_t i;
   LinkChangeCallbackDesc *entry;

   //Acquire exclusive access to the callback table
   osMutexAcquire(callbackTableMutex);

   //Loop through the table
   for(i = 0; i < TCP_IP_CALLBACK_TABLE_SIZE; i++)
   {
      //Point to the current entry
      entry = &callbackTable[i];

      //Check whether the entry is currently in used
      if(entry->callback == NULL)
      {
         //Create a new entry
         entry->interface = interface;
         entry->callback = callback;
         entry->params = params;
         //We are done
         break;
      }
   }

   //Release exclusive access to the callback table
   osMutexRelease(callbackTableMutex);

   //Failed to attach the specified user callback?
   if(i >= TCP_IP_CALLBACK_TABLE_SIZE)
      return ERROR_OUT_OF_RESOURCES;

   //Return a cookie that can be used later to unregister the callback
   if(cookie != NULL)
      *cookie = i;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Unregister link change callback
 * @param[in] cookie Identifier specifying the callback to be unregistered
 * @return Error code
 **/

error_t tcpIpStackDetachLinkChangeCallback(uint_t cookie)
{
   //Make sure the cookie is valid
   if(cookie >= TCP_IP_CALLBACK_TABLE_SIZE)
      return ERROR_INVALID_PARAMETER;

   //Acquire exclusive access to the callback table
   osMutexAcquire(callbackTableMutex);
   //Unregister user callback
   callbackTable[cookie].callback = NULL;
   //Release exclusive access to the callback table
   osMutexRelease(callbackTableMutex);

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Invoke link change callback
 * @param[in] interface Underlying network interface
 * @param[in] linkState Link state
 **/

void tcpIpStackInvokeLinkChangeCallback(NetInterface *interface, bool_t linkState)
{
   uint_t i;
   LinkChangeCallbackDesc *entry;

   //Acquire exclusive access to the callback table
   osMutexAcquire(callbackTableMutex);

   //Loop through the table
   for(i = 0; i < TCP_IP_CALLBACK_TABLE_SIZE; i++)
   {
      //Point to the current entry
      entry = &callbackTable[i];

      //Any registered callback?
      if(entry->callback != NULL)
      {
         //Check whether the network interface matches the current entry
         if(entry->interface == NULL || entry->interface == interface)
         {
            //Invoke user callback function
            entry->callback(interface, linkState, entry->params);
         }
      }
   }

   //Release exclusive access to the callback table
   osMutexRelease(callbackTableMutex);
}
