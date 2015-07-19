/**
 * @file dhcpv6_relay.h
 * @brief DHCPv6 relay agent (Dynamic Host Configuration Protocol for IPv6)
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

#ifndef _DHCPV6_RELAY_H
#define _DHCPV6_RELAY_H

//Dependencies
#include "dhcpv6_common.h"
#include "socket.h"

//Stack size required to run the DHCPv6 relay agent
#ifndef DHCPV6_RELAY_STACK_SIZE
   #define DHCPV6_RELAY_STACK_SIZE 500
#elif (DHCPV6_RELAY_STACK_SIZE < 1)
   #error DHCPV6_RELAY_STACK_SIZE parameter is not valid
#endif

//Priority at which the DHCPv6 relay agent should run
#ifndef DHCPV6_RELAY_PRIORITY
   #define DHCPV6_RELAY_PRIORITY 1
#elif (DHCPV6_RELAY_PRIORITY < 0)
   #error DHCPV6_RELAY_PRIORITY parameter is not valid
#endif

//Maximum number of client-facing interfaces
#ifndef DHCPV6_RELAY_MAX_CLIENT_IF
   #define DHCPV6_RELAY_MAX_CLIENT_IF 4
#elif (DHCPV6_RELAY_MAX_CLIENT_IF < 1)
   #error DHCPV6_RELAY_MAX_CLIENT_IF parameter is not valid
#endif

//The amount of overhead added by relay forwarding
#define DHCPV6_RELAY_FORW_OVERHEAD (sizeof(Dhcpv6RelayMessage) + 2 * sizeof(Dhcpv6Option) + sizeof(uint32_t))


/**
 * @brief DHCPv6 relay agent settings
 **/

typedef struct
{
   NetInterface *serverInterface;                             ///<Network-facing interface
   NetInterface *clientInterface[DHCPV6_RELAY_MAX_CLIENT_IF]; ///<Client-facing interfaces
   uint_t clientInterfaceCount;                               ///<Number of client-facing interfaces
   Ipv6Addr serverAddress;                                    ///<Address to be used when relaying messages to the server
} Dhcpv6RelaySettings;


/**
 * @brief DHCPv6 relay agent context
 **/

typedef struct
{
   NetInterface *serverInterface;                             ///<Network-facing interface
   NetInterface *clientInterface[DHCPV6_RELAY_MAX_CLIENT_IF]; ///<Client-facing interfaces
   uint_t clientInterfaceCount;                               ///<Number of client-facing interfaces
   Ipv6Addr serverAddress;                                    ///<Address to be used when relaying messages to the server
   Socket *serverSocket;                                      ///<Socket that handles the network-facing interface
   Socket *clientSocket[DHCPV6_RELAY_MAX_CLIENT_IF];          ///<Sockets that handle client-facing interfaces
   SocketEventDesc eventDesc[DHCPV6_RELAY_MAX_CLIENT_IF];     ///<The events the application is interested in
   bool_t running;                                            ///<DHCPv6 relay agent is currently running or not?
   bool_t stopRequest;                                        ///<Stop request
   OsEvent *ackEvent;                                         ///<Event object use to acknowledge user requests
   OsEvent *event;                                            ///<Event object used to poll the sockets
   uint8_t buffer[DHCPV6_MAX_MSG_SIZE];                       ///<Scratch buffer to store DHCPv6 messages
} Dhcpv6RelayCtx;


//DHCPv6 relay agent specific functions
error_t dhcpv6RelayStart(Dhcpv6RelayCtx *context, const Dhcpv6RelaySettings *settings);
error_t dhcpv6RelayStop(Dhcpv6RelayCtx *context);

error_t dhcpv6RelayJoinMulticastGroup(Dhcpv6RelayCtx *context);
error_t dhcpv6RelayLeaveMulticastGroup(Dhcpv6RelayCtx *context);

void dhcpv6RelayTask(void *param);

error_t dhcpv6ForwardClientMessage(Dhcpv6RelayCtx *context, uint_t index);
error_t dhcpv6ForwardRelayReplyMessage(Dhcpv6RelayCtx *context);

#endif
