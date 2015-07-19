/**
 * @file icmp.h
 * @brief ICMP (Internet Control Message Protocol)
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

#ifndef _ICMP_H
#define _ICMP_H

//Dependencies
#include "tcp_ip_stack.h"


/**
 * @brief ICMP message type
 *
 * The type field indicates the type of the message. Its
 * value determines the format of the remaining data
 *
 **/

typedef enum
{
   ICMP_TYPE_ECHO_REPLY        = 0,
   ICMP_TYPE_DEST_UNREACHABLE  = 3,
   ICMP_TYPE_SOURCE_QUENCH     = 4,
   ICMP_TYPE_REDIRECT          = 5,
   ICMP_TYPE_ECHO_REQUEST      = 8,
   ICMP_TYPE_TIME_EXCEEDED     = 11,
   ICMP_TYPE_PARAM_PROBLEM     = 12,
   ICMP_TYPE_TIMESTAMP_REQUEST = 13,
   ICMP_TYPE_TIMESTAMP_REPLY   = 14,
   ICMP_TYPE_INFO_REQUEST      = 15,
   ICMP_TYPE_INFO_REPLY        = 16
} IcmpType;


/**
 * @brief Destination Unreachable message codes
 **/

typedef enum
{
   ICMP_CODE_NET_UNREACHABLE      = 0,
   ICMP_CODE_HOST_UNREACHABLE     = 1,
   ICMP_CODE_PROTOCOL_UNREACHABLE = 2,
   ICMP_CODE_PORT_UNREACHABLE     = 3,
   ICMP_CODE_FRAGMENTATION_NEEDED = 4,
   ICMP_CODE_SOURCE_ROUTE_FAILED  = 5
} IcmpDestUnreachableCode;


/**
 * @brief Time Exceeded message codes
 **/

typedef enum
{
   ICMP_CODE_TTL_EXCEEDED             = 0,
   ICMP_CODE_REASSEMBLY_TIME_EXCEEDED = 1
} IcmpTimeExceededCode;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief ICMP header
 **/

typedef __packed struct
{
   uint8_t type;      //0
   uint8_t code;      //1
   uint16_t checksum; //2-3
   uint8_t data[];    //4
} IcmpHeader;


/**
 * @brief ICMP Error message
 **/

typedef __packed struct
{
   uint8_t type;           //0
   uint8_t code;           //1
   uint16_t checksum;      //2-3
   uint32_t parameter : 8; //4
   uint32_t unused : 24;   //5-7
   uint8_t data[];         //8
} IcmpErrorMessage;


/**
 * @brief ICMP Destination Unreachable message
 **/

typedef __packed struct
{
   uint8_t type;      //0
   uint8_t code;      //1
   uint16_t checksum; //2-3
   uint32_t unused;   //4-7
   uint8_t data[];    //8
} IcmpDestUnreachableMessage;


/**
 * @brief ICMP Time Exceeded message
 **/

typedef __packed struct
{
   uint8_t type;      //0
   uint8_t code;      //1
   uint16_t checksum; //2-3
   uint32_t unused;   //4-7
   uint8_t data[];    //8
} IcmpTimeExceededMessage;


/**
 * @brief ICMP Parameter Problem message
 **/

typedef __packed struct
{
   uint8_t type;         //0
   uint8_t code;         //1
   uint16_t checksum;    //2-3
   uint32_t pointer : 8; //4
   uint32_t unused : 24; //5-7
   uint8_t data[];       //8
} IcmpParamProblemMessage;


/**
 * @brief ICMP Echo Request and Echo Reply messages
 **/

typedef __packed struct
{
   uint8_t type;            //0
   uint8_t code;            //1
   uint16_t checksum;       //2-3
   uint16_t identifier;     //4-5
   uint16_t sequenceNumber; //6-7
   uint8_t data[];          //8
} IcmpEchoMessage;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


//ICMP related functions
void icmpProcessMessage(NetInterface *interface,
   Ipv4Addr srcIpAddr, const ChunkedBuffer *buffer, size_t offset);

void icmpProcessEchoRequest(NetInterface *interface,
   Ipv4Addr srcIpAddr, const ChunkedBuffer *request, size_t requestOffset);

error_t icmpSendErrorMessage(NetInterface *interface, uint8_t type,
   uint8_t code, uint8_t parameter, const ChunkedBuffer *ipPacket);

void icmpDumpMessage(const IcmpHeader *message);
void icmpDumpEchoMessage(const IcmpEchoMessage *message);
void icmpDumpErrorMessage(const IcmpErrorMessage *message);

#endif
