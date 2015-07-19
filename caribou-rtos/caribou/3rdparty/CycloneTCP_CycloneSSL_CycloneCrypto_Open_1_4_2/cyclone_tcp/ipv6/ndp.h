/**
 * @file ndp.h
 * @brief NDP (Neighbor Discovery Protocol)
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

#ifndef _NDP_H
#define _NDP_H

//Dependencies
#include "tcp_ip_stack.h"

//NDP support
#ifndef NDP_SUPPORT
   #define NDP_SUPPORT ENABLED
#elif (NDP_SUPPORT != ENABLED && NDP_SUPPORT != DISABLED)
   #error NDP_SUPPORT parameter is not valid
#endif

//NDP tick interval
#ifndef NDP_TICK_INTERVAL
   #define NDP_TICK_INTERVAL 200
#elif (NDP_TICK_INTERVAL < 100)
   #error NDP_TICK_INTERVAL parameter is not valid
#endif

//Neighbor cache size
#ifndef NDP_CACHE_SIZE
   #define NDP_CACHE_SIZE 8
#elif (NDP_CACHE_SIZE < 4)
   #error NDP_CACHE_SIZE parameter is not valid
#endif

//Maximum number of packets waiting for address resolution to complete
#ifndef NDP_MAX_PENDING_PACKETS
   #define NDP_MAX_PENDING_PACKETS 2
#elif (NDP_MAX_PENDING_PACKETS < 1)
   #error NDP_MAX_PENDING_PACKETS parameter is not valid
#endif

//Number of retransmissions for multicast Neighbor Solicitation messages
#ifndef NDP_MAX_MULTICAST_SOLICIT
   #define NDP_MAX_MULTICAST_SOLICIT 3
#elif (NDP_MAX_MULTICAST_SOLICIT < 1)
   #error NDP_MAX_MULTICAST_SOLICIT parameter is not valid
#endif

//Number of retransmissions for unicast Neighbor Solicitation messages
#ifndef NDP_MAX_UNICAST_SOLICIT
   #define NDP_MAX_UNICAST_SOLICIT 3
#elif (NDP_MAX_UNICAST_SOLICIT < 1)
   #error NDP_MAX_UNICAST_SOLICIT parameter is not valid
#endif

//The time between retransmissions of Neighbor Solicitation messages
#ifndef NDP_RETRANS_TIMER
   #define NDP_RETRANS_TIMER 1000
#elif (NDP_RETRANS_TIMER < 100)
   #error NDP_RETRANS_TIMER parameter is not valid
#endif

//The time a neighbor is considered reachable after receiving a reachability confirmation
#ifndef NDP_REACHABLE_TIME
   #define NDP_REACHABLE_TIME 30000
#elif (NDP_REACHABLE_TIME < 1000)
   #error NDP_REACHABLE_TIME parameter is not valid
#endif

//Delay before sending the first probe
#ifndef NDP_DELAY_FIRST_PROBE_TIME
   #define NDP_DELAY_FIRST_PROBE_TIME 5000
#elif (NDP_DELAY_FIRST_PROBE_TIME < 1000)
   #error NDP_DELAY_FIRST_PROBE_TIME parameter is not valid
#endif

//Hop Limit used by NDP messages
#define NDP_HOP_LIMIT 255


/**
 * @brief Neighbor Discovery options
 **/

typedef enum
{
   NDP_OPT_SOURCE_LINK_LAYER_ADDR = 1,
   NDP_OPT_TARGET_LINK_LAYER_ADDR = 2,
   NDP_OPT_PREFIX_INFORMATION     = 3,
   NDP_OPT_REDIRECTED_HEADER      = 4,
   NDP_OPT_MTU                    = 5
} NdpOptionType;


/**
 * @brief Neighbor cache entry states
 **/

typedef enum
{
   NDP_STATE_NONE       = 0,
   NDP_STATE_INCOMPLETE = 1,
   NDP_STATE_REACHABLE  = 2,
   NDP_STATE_STALE      = 3,
   NDP_STATE_DELAY      = 4,
   NDP_STATE_PROBE      = 5,
   NDP_STATE_PERMANENT  = 6
} NdpState;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief Router Solicitation message
 **/

typedef __packed struct
{
   uint8_t type;      //0
   uint8_t code;      //1
   uint16_t checksum; //2-3
   uint32_t reserved; //4-7
   uint8_t options[]; //8
} NdpRouterSolMessage;


/**
 * @brief Router Advertisement message
 **/

typedef __packed struct
{
   uint8_t type;                  //0
   uint8_t code;                  //1
   uint16_t checksum;             //2-3
   uint8_t curHopLimit;           //4
   uint8_t reserved : 6;          //5
   uint8_t o : 1;
   uint8_t m : 1;
   uint16_t routerLifetime;       //6-7
   uint32_t reachableTime;        //8-11
   uint32_t retransTimer;         //12-15
   uint8_t options[];             //16
} NdpRouterAdvMessage;


/**
 * @brief Neighbor Solicitation message
 **/

typedef __packed struct
{
   uint8_t type;        //0
   uint8_t code;        //1
   uint16_t checksum;   //2-3
   uint32_t reserved;   //4-7
   Ipv6Addr targetAddr; //8-23
   uint8_t options[];   //24
} NdpNeighborSolMessage;


/**
 * @brief Neighbor Advertisement message
 **/

typedef __packed struct
{
   uint8_t type;            //0
   uint8_t code;            //1
   uint16_t checksum;       //2-3
   uint32_t reserved1 : 5;  //4
   uint32_t o : 1;
   uint32_t s : 1;
   uint32_t r : 1;
   uint32_t reserved2 : 24; //5-7
   Ipv6Addr targetAddr;     //8-23
   uint8_t options[];       //24
} NdpNeighborAdvMessage;


/**
 * @brief Neighbor Discovery option general format
 **/

typedef __packed struct
{
   uint8_t type;    //0
   uint8_t length;  //1
   uint8_t value[]; //2
} NdpOption;


/**
 * @brief Source/Target Link-Layer Address option
 **/

typedef __packed struct
{
   uint8_t type;          //0
   uint8_t length;        //1
   MacAddr linkLayerAddr; //2-7
} NdpLinkLayerAddrOption;


/**
 * @brief Prefix Information option
 **/

typedef __packed struct
{
   uint8_t type;               //0
   uint8_t length;             //1
   uint8_t prefixLength;       //2
   uint8_t reserved1 : 6;      //3
   uint8_t a : 1;
   uint8_t l : 1;
   uint32_t validLifetime;     //4-7
   uint32_t preferredLifetime; //8-11
   uint32_t reserved2;         //12-15
   uint8_t prefix[];           //16
} NdpPrefixInfoOption;


/**
 * @brief Redirected Header option
 **/

typedef __packed struct
{
   uint8_t type;       //0
   uint8_t length;     //1
   uint16_t reserved1; //2-3
   uint32_t reserved2; //4-7
   uint8_t ipPacket[]; //8
} NdpRedirectedHeaderOption;


/**
 * @brief MTU option
 **/

typedef __packed struct
{
   uint8_t type;      //0
   uint8_t length;    //1
   uint16_t reserved; //2-3
   uint32_t mtu;      //4-7
} NdpMtuOption;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief NDP queue item
 **/

typedef struct
{
   ChunkedBuffer *buffer; //Packet waiting for address resolution
   size_t offset;         //Offset to the first byte of the packet
} NdpQueueItem;


/**
 * @brief Neighbor cache entry
 **/

typedef struct
{
   NdpState state;                              //Reachability state
   Ipv6Addr ipAddr;                             //Unicast IPv6 address
   MacAddr macAddr;                             //Link layer address associated with the IPv6 address
   systime_t timestamp;                         //Timestamp to manage entry lifetime
   systime_t timeout;                           //Timeout value
   uint_t retransmitCount;                      //Retransmission counter
   NdpQueueItem queue[NDP_MAX_PENDING_PACKETS]; //Packets waiting for address resolution to complete
   uint_t queueSize;                            //Number of queued packets
} NdpCacheEntry;


//NDP related functions
error_t ndpInit(NetInterface *interface);
void ndpFlushCache(NetInterface *interface);

NdpCacheEntry *ndpCreateEntry(NetInterface *interface);
NdpCacheEntry *ndpFindEntry(NetInterface *interface, const Ipv6Addr *ipAddr);

void ndpSendQueuedPackets(NetInterface *interface, NdpCacheEntry *entry);
void ndpFlushQueuedPackets(NetInterface *interface, NdpCacheEntry *entry);

error_t ndpResolve(NetInterface *interface, const Ipv6Addr *ipAddr, MacAddr *macAddr);

error_t ndpEnqueuePacket(NetInterface *interface,
   const Ipv6Addr *ipAddr, ChunkedBuffer *buffer, size_t offset);

void ndpTick(NetInterface *interface);

void ndpProcessNeighborSol(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit);

void ndpProcessNeighborAdv(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *buffer, size_t offset, uint8_t hopLimit);

error_t ndpSendRouterSol(NetInterface *interface);
error_t ndpSendNeighborSol(NetInterface *interface, const Ipv6Addr *targetIpAddr);

error_t ndpSendNeighborAdv(NetInterface *interface,
   const Ipv6Addr *targetIpAddr, const Ipv6Addr *destIpAddr);

void ndpAddOption(void *message, size_t *messageLength,
   uint8_t type, const void *value, uint8_t length);

void *ndpGetOption(uint8_t *options, size_t length, uint8_t type);

void ndpDumpRouterSolMessage(const NdpRouterSolMessage *message);
void ndpDumpRouterAdvMessage(const NdpRouterAdvMessage *message);
void ndpDumpNeighborSolMessage(const NdpNeighborSolMessage *message);
void ndpDumpNeighborAdvMessage(const NdpNeighborAdvMessage *message);

#endif
