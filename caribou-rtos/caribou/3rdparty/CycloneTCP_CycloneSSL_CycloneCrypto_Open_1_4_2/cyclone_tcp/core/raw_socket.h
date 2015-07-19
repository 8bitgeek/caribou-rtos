/**
 * @file raw_socket.h
 * @brief TCP/IP raw sockets
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

#ifndef _RAW_SOCKET_H
#define _RAW_SOCKET_H

//Dependencies
#include "tcp_ip_stack.h"
#include "ip.h"
#include "socket.h"

//Raw socket support
#ifndef RAW_SOCKET_SUPPORT
   #define RAW_SOCKET_SUPPORT ENABLED
#elif (RAW_SOCKET_SUPPORT != ENABLED && RAW_SOCKET_SUPPORT != DISABLED)
   #error RAW_SOCKET_SUPPORT parameter is not valid
#endif

//Receive queue depth for raw sockets
#ifndef RAW_SOCKET_RX_QUEUE_SIZE
   #define RAW_SOCKET_RX_QUEUE_SIZE 4
#elif (RAW_SOCKET_RX_QUEUE_SIZE < 1)
   #error RAW_SOCKET_RX_QUEUE_SIZE parameter is not valid
#endif

//Raw socket related functions
error_t rawSocketProcessDatagram(NetInterface *interface,
   IpPseudoHeader *pseudoHeader, const ChunkedBuffer *buffer, size_t offset);

error_t rawSocketSendDatagram(Socket *socket, const IpAddr *destIpAddr,
   const void *data, size_t length, size_t *written);

error_t rawSocketReceiveDatagram(Socket *socket, IpAddr *srcIpAddr,
   IpAddr *destIpAddr, void *data, size_t size, size_t *received, uint_t flags);

void rawSocketUpdateEvents(Socket *socket);

#endif
