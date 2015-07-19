/**
 * @file ipv4_frag.h
 * @brief IPv4 fragmentation and reassembly
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

#ifndef _IPV4_FRAG_H
#define _IPV4_FRAG_H

//Dependencies
#include "tcp_ip_stack.h"
#include "ipv4.h"

//IPv4 fragmentation support
#ifndef IPV4_FRAG_SUPPORT
   #define IPV4_FRAG_SUPPORT DISABLED
#elif (IPV4_FRAG_SUPPORT != ENABLED && IPV4_FRAG_SUPPORT != DISABLED)
   #error IPV4_FRAG_SUPPORT parameter is not valid
#endif

//Reassembly algorithm tick interval
#ifndef IPV4_FRAG_TICK_INTERVAL
   #define IPV4_FRAG_TICK_INTERVAL 1000
#elif (IPV4_FRAG_TICK_INTERVAL < 100)
   #error IPV4_FRAG_TICK_INTERVAL parameter is not valid
#endif

//Maximum number of fragmented packets the host will accept
//and hold in the reassembly queue simultaneously
#ifndef IPV4_MAX_FRAG_DATAGRAMS
   #define IPV4_MAX_FRAG_DATAGRAMS 4
#elif (IPV4_MAX_FRAG_DATAGRAMS < 1)
   #error IPV4_MAX_FRAG_DATAGRAMS parameter is not valid
#endif

//Maximum datagram size the host will accept when reassembling fragments
#ifndef IPV4_MAX_FRAG_DATAGRAM_SIZE
   #define IPV4_MAX_FRAG_DATAGRAM_SIZE 8192
#elif (IPV4_MAX_FRAG_DATAGRAM_SIZE < 1)
   #error IPV4_MAX_FRAG_DATAGRAM_SIZE parameter is not valid
#endif

//Maximum time an IPv4 fragment can spend waiting to be reassembled
#ifndef IPV4_FRAG_TIME_TO_LIVE
   #define IPV4_FRAG_TIME_TO_LIVE 15000
#elif (IPV4_FRAG_TIME_TO_LIVE < 1000)
   #error IPV4_FRAG_TIME_TO_LIVE parameter is not valid
#endif

//Maximum payload size for fragmented packets (shall be a multiple of 8-byte blocks)
#define IPV4_MAX_FRAG_SIZE (IPV4_MAX_PAYLOAD_SIZE & ~0x0007)
//Infinity is implemented by a very large integer
#define IPV4_INFINITY 0xFFFF


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
} Ipv4HoleDesc;


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
   ChunkDesc chunk[N(IPV4_MAX_FRAG_DATAGRAM_SIZE) + 1];
} Ipv4ReassemblyBuffer;


/**
 * @brief Fragmented packet descriptor
 **/

typedef struct
{
   systime_t timestamp;         ///<Time at which the first fragment was received
   size_t headerLength;         ///<Length of the header
   size_t dataLength;           ///<Length of the payload
   uint16_t firstHole;          ///<Index of the first hole
   Ipv4ReassemblyBuffer buffer; ///<Buffer containing the reassembled datagram
} Ipv4FragDesc;


//IPv4 datagram fragmentation and reassembly
error_t ipv4FragmentDatagram(NetInterface *interface, Ipv4PseudoHeader *pseudoHeader,
   uint16_t id, const ChunkedBuffer *payload, size_t payloadOffset, uint8_t timeToLive);

void ipv4ReassembleDatagram(NetInterface *interface,
   const Ipv4Header *packet, size_t length);

void ipv4FragTick(NetInterface *interface);

Ipv4FragDesc *ipv4SearchFragQueue(NetInterface *interface, const Ipv4Header *packet);
void ipv4FlushFragQueue(NetInterface *interface);

Ipv4HoleDesc *ipv4FindHole(Ipv4FragDesc *frag, uint16_t offset);
void ipv4DumpHoleList(Ipv4FragDesc *frag);

#endif
