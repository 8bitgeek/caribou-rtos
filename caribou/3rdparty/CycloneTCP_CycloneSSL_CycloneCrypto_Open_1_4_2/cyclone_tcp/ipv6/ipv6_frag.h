/**
 * @file ipv6_frag.h
 * @brief IPv6 fragmentation and reassembly
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

#ifndef _IPV6_FRAG_H
#define _IPV6_FRAG_H

//Dependencies
#include "tcp_ip_stack.h"
#include "ipv6.h"

//IPv6 fragmentation support
#ifndef IPV6_FRAG_SUPPORT
   #define IPV6_FRAG_SUPPORT DISABLED
#elif (IPV6_FRAG_SUPPORT != ENABLED && IPV6_FRAG_SUPPORT != DISABLED)
   #error IPV6_FRAG_SUPPORT parameter is not valid
#endif

//Reassembly algorithm tick interval
#ifndef IPV6_FRAG_TICK_INTERVAL
   #define IPV6_FRAG_TICK_INTERVAL 1000
#elif (IPV6_FRAG_TICK_INTERVAL < 100)
   #error IPV6_FRAG_TICK_INTERVAL parameter is not valid
#endif

//Maximum number of fragmented packets the host will accept
//and hold in the reassembly queue simultaneously
#ifndef IPV6_MAX_FRAG_DATAGRAMS
   #define IPV6_MAX_FRAG_DATAGRAMS 4
#elif (IPV6_MAX_FRAG_DATAGRAMS < 1)
   #error IPV6_MAX_FRAG_DATAGRAMS parameter is not valid
#endif

//Maximum datagram size the host will accept when reassembling fragments
#ifndef IPV6_MAX_FRAG_DATAGRAM_SIZE
   #define IPV6_MAX_FRAG_DATAGRAM_SIZE 8192
#elif (IPV6_MAX_FRAG_DATAGRAM_SIZE < 1)
   #error IPV6_MAX_FRAG_DATAGRAM_SIZE parameter is not valid
#endif

//Maximum time an IPv6 fragment can spend waiting to be reassembled
#ifndef IPV6_FRAG_TIME_TO_LIVE
   #define IPV6_FRAG_TIME_TO_LIVE 15000
#elif (IPV6_FRAG_TIME_TO_LIVE < 1000)
   #error IPV6_FRAG_TIME_TO_LIVE parameter is not valid
#endif

//Maximum payload size for fragmented packets (shall be a multiple of 8-byte blocks)
#define IPV6_MAX_FRAG_SIZE ((IPV6_MAX_PAYLOAD_SIZE - sizeof(Ipv6FragmentHeader)) & ~0x0007)
//Infinity is implemented by a very large integer
#define IPV6_INFINITY 0xFFFF


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief Hole descriptor
 **/

__packed typedef struct
{
   uint16_t first;
   uint16_t last;
   uint16_t next;
} Ipv6HoleDesc;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief Reassembly buffer
 **/

typedef struct
{
   uint_t chunkCount;
   uint_t maxChunkCount;
   ChunkDesc chunk[N(IPV6_MAX_FRAG_DATAGRAM_SIZE) + 1];
} Ipv6ReassemblyBuffer;


/**
 * @brief Fragmented packet descriptor
 **/

typedef struct
{
   systime_t timestamp;         ///<Time at which the first fragment was received
   uint32_t identification;     ///<Fragment identification field
   size_t unfragPartLength;     ///<Length of the unfragmentable part
   size_t fragPartLength;       ///<Length of the fragmentable part
   uint16_t firstHole;          ///<Index of the first hole
   Ipv6ReassemblyBuffer buffer; ///<Buffer containing the reassembled datagram
} Ipv6FragDesc;


//IPv6 datagram fragmentation and reassembly
error_t ipv6FragmentDatagram(NetInterface *interface, Ipv6PseudoHeader *pseudoHeader,
   const ChunkedBuffer *payload, size_t payloadOffset, uint8_t hopLimit);

void ipv6ParseFragmentHeader(NetInterface *interface, const ChunkedBuffer *buffer,
   size_t fragHeaderOffset, size_t nextHeaderOffset);

void ipv6FragTick(NetInterface *interface);

Ipv6FragDesc *ipv6SearchFragQueue(NetInterface *interface,
   Ipv6Header *packet, Ipv6FragmentHeader *header);

void ipv6FlushFragQueue(NetInterface *interface);

Ipv6HoleDesc *ipv6FindHole(Ipv6FragDesc *frag, uint16_t offset);
void ipv6DumpHoleList(Ipv6FragDesc *frag);

#endif
