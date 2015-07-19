/**
 * @file ipv4.h
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
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

#ifndef _IPV4_H
#define _IPV4_H

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "ethernet.h"

//IPv4 support
#ifndef IPV4_SUPPORT
   #define IPV4_SUPPORT ENABLED
#elif (IPV4_SUPPORT != ENABLED && IPV4_SUPPORT != DISABLED)
   #error IPV4_SUPPORT parameter is not valid
#endif

//Default IPv4 time-to-live value
#ifndef IPV4_DEFAULT_TTL
   #define IPV4_DEFAULT_TTL 64
#elif (IPV4_DEFAULT_TTL < 1)
   #error IPV4_DEFAULT_TTL parameter is not valid
#endif

//Maximum number of DNS servers
#ifndef IPV4_MAX_DNS_SERVERS
   #define IPV4_MAX_DNS_SERVERS 2
#elif (IPV4_MAX_DNS_SERVERS < 1)
   #error IPV4_MAX_DNS_SERVERS parameter is not valid
#endif

//Maximum size of the IPv4 filter table
#ifndef IPV4_FILTER_MAX_SIZE
   #define IPV4_FILTER_MAX_SIZE 8
#elif (IPV4_FILTER_MAX_SIZE < 1)
   #error IPV4_FILTER_MAX_SIZE parameter is not valid
#endif

//Version number for IPv4
#define IPV4_VERSION 4
//Minimum MTU that routers and physical links are required to handle
#define IPV4_DEFAULT_MTU 576
//Minimum header length
#define IPV4_MIN_HEADER_LENGTH 20
//Maximum header length
#define IPV4_MAX_HEADER_LENGTH 60
//Maximum payload size
#define IPV4_MAX_PAYLOAD_SIZE (ETH_MTU - sizeof(Ipv4Header))
//Shortcut to data field
#define IPV4_DATA(packet) PTR_OFFSET(packet, packet->headerLength * 4)

//Macro used for defining IPv4 addresses
#define IPV4_ADDR(a, b, c, d) ((a) | ((b) << 8) | ((c) << 16) | ((uint_t) (d) << 24))

//Unspecified IPv4 address
#define IPV4_UNSPECIFIED_ADDR IPV4_ADDR(0, 0, 0, 0)
//Loopback IPv4 address
#define IPV4_LOOPBACK_ADDR IPV4_ADDR(127, 0, 0, 1)
//Broadcast IPv4 address
#define IPV4_BROADCAST_ADDR IPV4_ADDR(255, 255, 255, 255)

//IPv4 address classes
#define IPV4_CLASS_A_ADDR IPV4_ADDR(0, 0, 0, 0)
#define IPV4_CLASS_A_MASK IPV4_ADDR(128, 0, 0, 0)
#define IPV4_CLASS_B_ADDR IPV4_ADDR(128, 0, 0, 0)
#define IPV4_CLASS_B_MASK IPV4_ADDR(192, 0, 0, 0)
#define IPV4_CLASS_C_ADDR IPV4_ADDR(192, 0, 0, 0)
#define IPV4_CLASS_C_MASK IPV4_ADDR(224, 0, 0, 0)
#define IPV4_CLASS_D_ADDR IPV4_ADDR(224, 0, 0, 0)
#define IPV4_CLASS_D_MASK IPV4_ADDR(255, 0, 0, 0)
#define IPV4_CLASS_E_ADDR IPV4_ADDR(255, 0, 0, 0)
#define IPV4_CLASS_E_MASK IPV4_ADDR(255, 0, 0, 0)

//Copy IPv4 address
#define ipv4CopyAddr(destIpAddr, srcIpAddr) \
   memcpy(destIpAddr, srcIpAddr, sizeof(Ipv4Addr))
//Compare IPv4 addresses
#define ipv4CompAddr(ipAddr1, ipAddr2) \
   (!memcmp(ipAddr1, ipAddr2, sizeof(Ipv4Addr)))

//Determine whether an IPv4 address belongs to the local network
#define ipv4IsInLocalSubnet(interface, ipAddr) \
   ((ipAddr & interface->ipv4Config.subnetMask) == (interface->ipv4Config.addr & interface->ipv4Config.subnetMask))
//Determine whether an IPv4 address is a broadcast address
#define ipv4IsBroadcastAddr(interface, ipAddr) \
   ((ipAddr | interface->ipv4Config.subnetMask) == IPV4_BROADCAST_ADDR)
//Determine whether an IPv4 address is a multicast address
#define ipv4IsMulticastAddr(ipAddr) \
   ((ipAddr & IPV4_CLASS_D_MASK) == IPV4_CLASS_D_ADDR)

/**
 * @brief IPv4 fragment offset field
 **/

typedef enum
{
   IPV4_FLAG_RES    = 0x8000,
   IPV4_FLAG_DF     = 0x4000,
   IPV4_FLAG_MF     = 0x2000,
   IPV4_OFFSET_MASK = 0x1FFF
} Ipv4FragmentOffset;


/**
 * @brief IPv4 protocol field
 **/

typedef enum
{
   IPV4_PROTOCOL_ICMP = 1,
   IPV4_PROTOCOL_IGMP = 2,
   IPV4_PROTOCOL_TCP  = 6,
   IPV4_PROTOCOL_UDP  = 17
} Ipv4Protocol;


/**
 * @brief IPv4 option types
 **/

typedef enum
{
   IPV4_OPTION_EEOL   = 0,
   IPV4_OPTION_NOP    = 1,
   IPV4_OPTION_RTRALT = 148
} Ipv4OptionType;


/**
 * @brief IPv4 network address
 **/

typedef uint32_t Ipv4Addr;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief IPv4 header
 **/

typedef __packed struct
{
   uint8_t headerLength : 4; //0
   uint8_t version : 4;
   uint8_t typeOfService;    //1
   uint16_t totalLength;     //2-3
   uint16_t identification;  //4-5
   uint16_t fragmentOffset;  //6-7
   uint8_t timeToLive;       //8
   uint8_t protocol;         //9
   uint16_t headerChecksum;  //10-11
   Ipv4Addr srcAddr;         //12-15
   Ipv4Addr destAddr;        //16-19
   uint8_t options[];        //20
} Ipv4Header;


/**
 * @brief IPv4 pseudo header
 **/

typedef __packed struct
{
   Ipv4Addr srcAddr;  //0-3
   Ipv4Addr destAddr; //4-7
   uint8_t reserved;  //8
   uint8_t protocol;  //9
   uint16_t length;   //10-11
} Ipv4PseudoHeader;


/**
 * @brief IPv4 option
 **/

typedef __packed struct
{
   uint8_t type;    //0
   uint8_t length;  //1
   uint8_t value[]; //2
} Ipv4Option;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief IPv4 configuration
 **/

typedef struct
{
   Ipv4Addr addr;                            ///<IPv4 address
   Ipv4Addr subnetMask;                      ///<Subnet mask
   Ipv4Addr defaultGateway;                  ///<Default gateway
   Ipv4Addr dnsServer[IPV4_MAX_DNS_SERVERS]; ///<IPv4 DNS servers
   uint_t dnsServerCount;                    ///<Number of IPv4 DNS servers
} Ipv4Config;


/**
 * @brief IPv4 filter table entry
 **/

typedef struct
{
   Ipv4Addr addr;    ///<IPv4 address
   uint_t refCount;  ///<Reference count for the current entry
   uint_t state;     ///<IGMP host state
   bool_t flag;      ///<IGMP flag
   systime_t timer;  ///<Delay timer
} Ipv4FilterEntry;


//IPv4 related functions
error_t ipv4Init(NetInterface *interface);

error_t ipv4SetHostAddr(NetInterface *interface, Ipv4Addr addr);
error_t ipv4GetHostAddr(NetInterface *interface, Ipv4Addr *addr);

error_t ipv4SetSubnetMask(NetInterface *interface, Ipv4Addr mask);
error_t ipv4GetSubnetMask(NetInterface *interface, Ipv4Addr *mask);

error_t ipv4SetDefaultGateway(NetInterface *interface, Ipv4Addr addr);
error_t ipv4GetDefaultGateway(NetInterface *interface, Ipv4Addr *addr);

error_t ipv4SetDnsServer(NetInterface *interface, uint_t num, Ipv4Addr addr);
error_t ipv4GetDnsServer(NetInterface *interface, uint_t num, Ipv4Addr *addr);

void ipv4ProcessPacket(NetInterface *interface, Ipv4Header *packet, size_t length);
void ipv4ProcessDatagram(NetInterface *interface, const ChunkedBuffer *buffer);

error_t ipv4SendDatagram(NetInterface *interface, Ipv4PseudoHeader *pseudoHeader,
   ChunkedBuffer *buffer, size_t offset, uint8_t ttl);

error_t ipv4SendPacket(NetInterface *interface, Ipv4PseudoHeader *pseudoHeader,
   uint16_t fragId, uint16_t fragOffset, ChunkedBuffer *buffer, size_t offset, uint8_t ttl);

error_t ipv4CheckSourceAddr(NetInterface *interface, Ipv4Addr ipAddr);
error_t ipv4CheckDestAddr(NetInterface *interface, Ipv4Addr ipAddr);

error_t ipv4SelectSourceAddr(NetInterface **interface,
   Ipv4Addr destAddr, Ipv4Addr *srcAddr);

error_t ipv4JoinMulticastGroup(NetInterface *interface, Ipv4Addr groupAddr);
error_t ipv4LeaveMulticastGroup(NetInterface *interface, Ipv4Addr groupAddr);

error_t ipv4MapMulticastAddrToMac(Ipv4Addr ipAddr, MacAddr *macAddr);

error_t ipv4StringToAddr(const char_t *str, Ipv4Addr *ipAddr);
char_t *ipv4AddrToString(Ipv4Addr ipAddr, char_t *str);

void ipv4DumpHeader(const Ipv4Header *ipHeader);

#endif
