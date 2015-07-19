/**
 * @file mdns_common.c
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

//Switch to the appropriate trace level
#define TRACE_LEVEL MDNS_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "tcp_ip_stack.h"
#include "mdns_client.h"
#include "mdns_responder.h"
#include "mdns_common.h"
#include "dns_debug.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (MDNS_CLIENT_SUPPORT == ENABLED || MDNS_RESPONDER_SUPPORT == ENABLED)

#if (IPV6_SUPPORT == ENABLED)

//mDNS IPv6 multicast group (ff02::fb)
const Ipv6Addr MDNS_IPV6_MULTICAST_ADDR =
   IPV6_ADDR(0xFF02, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x00FB);

#endif


/**
 * @brief mDNS related initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t mdnsInit(NetInterface *interface)
{
   error_t error;

#if (IPV4_SUPPORT == ENABLED)
   //Join the mDNS IPv4 multicast group
   error = ipv4JoinMulticastGroup(interface, MDNS_IPV4_MULTICAST_ADDR);
   //Any error to report?
   if(error) return error;
#endif

#if (IPV6_SUPPORT == ENABLED)
   //Join the mDNS IPv6 multicast group
   error = ipv6JoinMulticastGroup(interface, &MDNS_IPV6_MULTICAST_ADDR);
   //Any error to report?
   if(error) return error;
#endif

   //Callback function to be called when a mDNS message is received
   error = udpAttachRxCallback(interface, MDNS_PORT, mdnsProcessMessage, NULL);
   //Any error to report?
   if(error) return error;

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Process incoming mDNS message
 * @param[in] interface Underlying network interface
 * @param[in] pseudoHeader UDP pseudo header
 * @param[in] udpHeader UDP header
 * @param[in] buffer Multi-part buffer containing the incoming mDNS message
 * @param[in] offset Offset to the first byte of the mDNS message
 * @param[in] params Callback function parameter (not used)
 **/

void mdnsProcessMessage(NetInterface *interface, const IpPseudoHeader *pseudoHeader,
   const UdpHeader *udpHeader, const ChunkedBuffer *buffer, size_t offset, void *params)
{
   size_t length;
   DnsHeader *message;

   //Retrieve the length of the mDNS message
   length = chunkedBufferGetLength(buffer) - offset;

   //Ensure the mDNS message is valid
   if(length < sizeof(DnsHeader))
      return;
   if(length > DNS_MESSAGE_MAX_SIZE)
      return;

   //Point to the mDNS message header
   message = chunkedBufferAt(buffer, offset);
   //Sanity check
   if(!message) return;

   //Debug message
   TRACE_INFO("mDNS message received (%" PRIuSIZE " bytes)...\r\n", length);
   //Dump message
   dnsDumpMessage(message, length);

   //mDNS messages received with an opcode other than zero must be silently ignored
   if(message->opcode != DNS_OPCODE_QUERY)
      return;
   //mDNS messages received with non-zero response codes must be silently ignored
   if(message->rcode != DNS_RCODE_NO_ERROR)
      return;

#if (MDNS_RESPONDER_SUPPORT == ENABLED)
   //mDNS query received?
   if(!message->qr)
   {
      //Process incoming mDNS query message
      mdnsProcessQuery(interface, pseudoHeader, udpHeader, message, length);
   }
#endif
#if (MDNS_CLIENT_SUPPORT == ENABLED)
   //mDNS response received?
   if(message->qr)
   {
      //Process incoming mDNS response message
      mdnsProcessResponse(interface, pseudoHeader, udpHeader, message, length);
   }
#endif
}

#endif
