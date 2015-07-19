/**
 * @file slaac.c
 * @brief IPv6 Stateless Address Autoconfiguration
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
 * @section Description
 *
 * Stateless Address Autoconfiguration is a facility to allow devices to
 * configure themselves independently. The autoconfiguration process is
 * described in RFC 4862
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL SLAAC_TRACE_LEVEL

//Dependencies
#include "tcp_ip_stack.h"
#include "ethernet.h"
#include "ndp.h"
#include "slaac.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED)


error_t statelessAddrConfig(NetInterface *interface)
{
   error_t error;
   Eui64 interfaceId;
   Ipv6Addr linkLocalAddr;
   Ipv6Addr solicitedNodeAddr;

   //Generate the 64-bit interface identifier
   macAddrToEui64(&interface->macAddr, &interfaceId);

   //A link-local address is formed by combining the well-known
   //link-local prefix fe80::0 with the interface identifier
   linkLocalAddr.w[0] = htons(0xFE80);
   linkLocalAddr.w[1] = htons(0x0000);
   linkLocalAddr.w[2] = htons(0x0000);
   linkLocalAddr.w[3] = htons(0x0000);
   linkLocalAddr.w[4] = interfaceId.w[0];
   linkLocalAddr.w[5] = interfaceId.w[1];
   linkLocalAddr.w[6] = interfaceId.w[2];
   linkLocalAddr.w[7] = interfaceId.w[3];

   //Form the Solicited-Node address
   ipv6ComputeSolicitedNodeAddr(&linkLocalAddr, &solicitedNodeAddr);
   //Join the Solicited-Node multicast group for the tentative address
   ipv6JoinMulticastGroup(interface, &solicitedNodeAddr);

   //Ensure that the address is not already in use on the local network
   error = slaacDetectDuplicateAddr(&linkLocalAddr);
   //If a duplicate address is discovered during the procedure,
   //the address cannot be assigned to the interface
   if(error)
   {
      ipv6LeaveMulticastGroup(interface, &solicitedNodeAddr);
      return error;
   }

   //Assign the link-local address to the local IPv6 address
   interface->ipv6Config.linkLocalAddr = linkLocalAddr;

   //The node next attempts to contact a local router for more
   //information on continuing the configuration

   //The global address is formed by appending the interface
   //identifier to a prefix of appropriate length

   //Successful configuration
   return NO_ERROR;
}


/**
 * @brief Duplicate IPv6 Address Detection
 * @param[in] ipAddr Tentative address
 * @return Error code
 **/

error_t slaacDetectDuplicateAddr(const Ipv6Addr *ipAddr)
{
   //Send a Neighbor Solicitation message
   //Attention pas d'option !!
   //ndpSendNeighborSol(ipAddr);

   return NO_ERROR;
}


/**
 * @brief Map a MAC address to the IPv6 modified EUI-64 identifier
 * @param[in] macAddr Host MAC address
 * @param[out] interfaceId IPv6 modified EUI-64 identifier
 **/

void macAddrToEui64(const MacAddr *macAddr, Eui64 *interfaceId)
{
   //Copy the Organization Unique Identifier (OUI)
   interfaceId->b[0] = macAddr->b[0];
   interfaceId->b[1] = macAddr->b[1];
   interfaceId->b[2] = macAddr->b[2];

   //The middle 16 bits are given the value 0xFFFE
   interfaceId->b[3] = 0xFF;
   interfaceId->b[4] = 0xFE;

   //Copy the right-most 24 bits of the MAC address
   interfaceId->b[5] = macAddr->b[3];
   interfaceId->b[6] = macAddr->b[4];
   interfaceId->b[7] = macAddr->b[5];

   //Modified EUI-64 format interface identifiers are
   //formed by inverting the Universal/Local bit
   interfaceId->b[0] ^= MAC_ADDR_FLAG_LOCAL;
}

#endif
