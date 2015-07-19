/**
 * @file mdns_common.h
 * @brief Functions common to mDNS client and mDNS responder
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

#ifndef _MDNS_COMMON_H
#define _MDNS_COMMON_H

//Dependencies
#include "tcp_ip_stack.h"
#include "dns_common.h"

//Default TTL value for mDNS resource records
#ifndef MDNS_DEFAULT_RESOURCE_RECORD_TTL
   #define MDNS_DEFAULT_RESOURCE_RECORD_TTL 120
#elif (MDNS_DEFAULT_RESOURCE_RECORD_TTL < 1)
   #error MDNS_DEFAULT_RESOURCE_RECORD_TTL parameter is not valid
#endif

//mDNS port number
#define MDNS_PORT 5353
//Default IP Time-To-Live value
#define MDNS_DEFAULT_IP_TTL 255

//QU flag
#define MDNS_QCLASS_QU 0x8000;
//Cache Flush flag
#define MDNS_RCLASS_CACHE_FLUSH 0x8000;

//mDNS IPv4 multicast group
#define MDNS_IPV4_MULTICAST_ADDR IPV4_ADDR(224, 0, 0, 251)

//mDNS IPv6 multicast group
extern const Ipv6Addr MDNS_IPV6_MULTICAST_ADDR;

//mDNS related functions
error_t mdnsInit(NetInterface *interface);

void mdnsProcessMessage(NetInterface *interface, const IpPseudoHeader *pseudoHeader,
   const UdpHeader *udpHeader, const ChunkedBuffer *buffer, size_t offset, void *params);

#endif
