/**
 * @file mdns_responder.h
 * @brief mDNS responder (Multicast DNS)
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

#ifndef _MDNS_RESPONDER_H
#define _MDNS_RESPONDER_H

//Dependencies
#include "tcp_ip_stack.h"
#include "dns_common.h"
#include "udp.h"

//mDNS responder support
#ifndef MDNS_RESPONDER_SUPPORT
   #define MDNS_RESPONDER_SUPPORT ENABLED
#elif (MDNS_RESPONDER_SUPPORT != ENABLED && MDNS_RESPONDER_SUPPORT != DISABLED)
   #error MDNS_RESPONDER_SUPPORT parameter is not valid
#endif

//mDNS related functions
void mdnsProcessQuery(NetInterface *interface, const IpPseudoHeader *pseudoHeader,
   const UdpHeader *udpHeader, const DnsHeader *message, size_t length);

error_t mdnsSendResponse(NetInterface *interface, const IpAddr *destIpAddr,
   uint16_t destPort, uint16_t id, bool_t a, bool_t aaaa);

#endif
