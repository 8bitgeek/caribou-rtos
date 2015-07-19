/**
 * @file slaac.h
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
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

#ifndef _SLAAC_H
#define _SLAAC_H


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief IPv6 modified EUI-64 identifier
 **/

typedef __packed struct
{
   __packed union
   {
      uint8_t b[8];
      uint16_t w[4];
      uint32_t dw[2];
   };
} Eui64;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


//SLAAC related functions
error_t statelessAddrConfig(NetInterface *interface);
error_t slaacDetectDuplicateAddr(const Ipv6Addr *ipAddr);

void macAddrToEui64(const MacAddr *macAddr, Eui64 *interfaceId);

#endif
