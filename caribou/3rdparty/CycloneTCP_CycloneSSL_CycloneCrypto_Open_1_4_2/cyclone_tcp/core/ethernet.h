/**
 * @file ethernet.h
 * @brief Ethernet
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

#ifndef _ETHERNET_H
#define _ETHERNET_H

//Dependencies
#include "tcp_ip_stack.h"

//Ethernet support
#ifndef ETH_SUPPORT
   #define ETH_SUPPORT ENABLED
#elif (ETH_SUPPORT != ENABLED && ETH_SUPPORT != DISABLED)
   #error ETH_SUPPORT parameter is not valid
#endif

//Maximum size of the MAC filter table
#ifndef MAC_FILTER_MAX_SIZE
   #define MAC_FILTER_MAX_SIZE 8
#elif (MAC_FILTER_MAX_SIZE < 4)
   #error MAC_FILTER_MAX_SIZE parameter is not valid
#endif

//CRC32 calculation using pre-calculated lookup table
#ifndef ETH_FAST_CRC_SUPPORT
   #define ETH_FAST_CRC_SUPPORT DISABLED
#elif (ETH_FAST_CRC_SUPPORT != ENABLED && ETH_FAST_CRC_SUPPORT != DISABLED)
   #error ETH_FAST_CRC_SUPPORT parameter is not valid
#endif

//Minimum Ethernet frame size
#define ETH_MIN_FRAME_SIZE 64
//Maximum Ethernet frame size
#define ETH_MAX_FRAME_SIZE 1518
//Ethernet maximum transmission unit
#define ETH_MTU 1500
//Ethernet CRC field size
#define ETH_CRC_SIZE 4

//Copy MAC address
#define macCopyAddr(dest, src) memcpy(dest, src, sizeof(MacAddr))
//Compare MAC addresses
#define macCompAddr(a, b) (!memcmp(a, b, sizeof(MacAddr)))


/**
 * @brief MAC address flags
 **/

typedef enum
{
   MAC_ADDR_FLAG_MULTICAST = 0x01,
   MAC_ADDR_FLAG_LOCAL     = 0x02
} MacAddrFlags;


/**
 * @brief Ethernet Type field
 **/

typedef enum
{
   ETH_TYPE_IPV4 = 0x0800,
   ETH_TYPE_ARP  = 0x0806,
   ETH_TYPE_RARP = 0x8035,
   ETH_TYPE_IPV6 = 0x86DD
} EthType;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif

/**
 * @brief MAC address
 **/

typedef __packed struct
{
   __packed union
   {
      uint8_t b[6];
      uint16_t w[3];
   };
} MacAddr;


/**
 * @brief Ethernet frame header
 **/

typedef __packed struct
{
   MacAddr destAddr; //0-5
   MacAddr srcAddr;  //6-11
   uint16_t type;    //12-13
   uint8_t data[];   //14
} EthHeader;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief MAC filter table entry
 **/

typedef struct
{
   MacAddr addr;    ///<MAC address
   uint_t refCount; ///<Reference count for the current entry
} MacFilterEntry;


//Ethernet related constants
extern const MacAddr MAC_UNSPECIFIED_ADDR;
extern const MacAddr MAC_BROADCAST_ADDR;

//Ethernet related functions
error_t ethInit(NetInterface *interface);

void ethProcessFrame(NetInterface *interface, EthHeader *ethFrame, size_t length);

error_t ethSendFrame(NetInterface *interface, const MacAddr *destAddr,
   ChunkedBuffer *buffer, size_t offset, uint16_t type);

error_t ethCheckDestAddr(NetInterface *interface, const MacAddr *macAddr);
error_t ethAcceptMulticastAddr(NetInterface *interface, const MacAddr *macAddr);
error_t ethDropMulticastAddr(NetInterface *interface, const MacAddr *macAddr);

uint32_t ethCalcCrc(const void *data, size_t length);
uint32_t ethCalcCrcEx(const ChunkedBuffer *buffer, size_t offset, size_t length);

ChunkedBuffer *ethAllocBuffer(size_t length, size_t *offset);

error_t macStringToAddr(const char_t *str, MacAddr *macAddr);
char_t *macAddrToString(const MacAddr *macAddr, char_t *str);

void ethDumpHeader(const EthHeader *ethHeader);

#endif
