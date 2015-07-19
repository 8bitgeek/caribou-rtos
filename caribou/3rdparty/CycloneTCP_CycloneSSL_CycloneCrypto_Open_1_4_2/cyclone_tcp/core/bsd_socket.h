/**
 * @file bsd_socket.h
 * @brief BSD socket API
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

#ifndef _BSD_SOCKET_H
#define _BSD_SOCKET_H

#ifdef _WIN32

//Undefine conflicting macros
#undef htons
#undef htonl
#undef ntohs
#undef ntohl

//Dependencies
#include <winsock2.h>

#else

//Dependencies
#include "os_port.h"

//Address families
#define AF_INET  2
#define AF_INET6 23

//Socket types
#define SOCK_STREAM 1
#define SOCK_DGRAM  2
#define SOCK_RAW    3

//Protocols
#define IPPROTO_ICMP   1
#define IPPROTO_IGMP   2
#define IPPROTO_TCP    6
#define IPPROTO_UDP    17
#define IPPROTO_ICMPV6 58

//Option levels
#define SOL_SOCKET 0xFFFF

//Common addresses
#define INADDR_ANY       0x00000000
#define INADDR_LOOPBACK  0x7F000001
#define INADDR_BROADCAST 0xFFFFFFFF

//Flags used by I/O functions
#define MSG_PEEK      0x02
#define MSG_DONTROUTE 0x04
#define MSG_WAITALL   0x08

//Flags used by shutdown function
#define SD_RECEIVE 0
#define SD_SEND    1
#define SD_BOTH    2

//Socket level options
#define SO_REUSEADDR    0x0004
#define SO_KEEPALIVE    0x0008
#define SO_DONTROUTE    0x0010
#define SO_LINGER       0x0080
#define SO_SNDBUF       0x1001
#define SO_RCVBUF       0x1002
#define SO_SNDTIMEO     0x1005
#define SO_RCVTIMEO     0x1006
#define SO_ERROR        0x1007
#define SO_TYPE         0x1008
#define SO_MAX_MSG_SIZE 0x2003
#define SO_BINDTODEVICE 0x3000

//TCP level options
#define TCP_NODELAY 0x0001

//Status codes
#define SOCKET_SUCCESS 0
#define SOCKET_ERROR (-1)

//Macros for manipulating and checking descriptor sets
#define FD_SETSIZE 8
#define FD_ZERO(fds) selectFdZero(fds)
#define FD_SET(s, fds) selectFdSet(fds, s)
#define FD_CLR(s, fds) selectFdClr(fds, s)
#define FD_ISSET(s, fds) selectFdIsSet(fds, s)


/**
 * @brief Socket address
 **/

typedef struct sockaddr
{
   uint16_t sa_family;
   uint8_t sa_data[14];
} sockaddr;


/**
 * @brief Single IPv4 address
 **/

typedef struct in_addr
{
   uint32_t s_addr;
} in_addr;


/**
 * @brief IPv4 address information
 **/

typedef struct sockaddr_in
{
   uint16_t sin_family;
   uint16_t sin_port;
   in_addr sin_addr;
   uint8_t sin_zero[8];
} sockaddr_in;


/**
 * @brief Single IPv6 address
 **/

typedef struct in6_addr
{
   uint8_t s6_addr[16];
} in6_addr;


/**
 * @brief IPv6 address information
 **/

typedef struct sockaddr_in6
{
   uint16_t sin6_family;
   uint16_t sin6_port;
   in6_addr sin6_addr;
} sockaddr_in6;


/**
 * @brief Set of sockets
 **/

typedef struct fd_set
{
  int_t fd_count;
  int_t fd_array[FD_SETSIZE];
} fd_set;


/**
 * @brief Timeout structure
 **/

typedef struct timeval
{
   uint32_t tv_sec;
   uint32_t tv_usec;
} timeval;


/**
 * @brief Information about a given host
 **/

typedef struct hostent
{
   uint16_t h_addrtype;
   uint16_t h_length;
   uint8_t h_addr[16];
} hostent;


//BSD socket related constants
extern const in6_addr in6addr_any;
extern const in6_addr in6addr_loopback;

//BSD socket API
int_t socket(int_t family, int_t type, int_t protocol);
int_t bind(int_t s, const sockaddr *addr, int_t addrlen);
int_t connect(int_t s, const sockaddr *addr, int_t addrlen);
int_t listen(int_t s, int_t backlog);
int_t accept(int_t s, sockaddr *addr, int_t *addrlen);
int_t send(int_t s, const void *data, int_t length, int_t flags);

int_t sendto(int_t s, const void *data, int_t length,
   int_t flags, const sockaddr *addr, int_t addrlen);

int_t recv(int_t s, void *data, int_t size, int_t flags);

int_t recvfrom(int_t s, void *data, int_t size,
   int_t flags, sockaddr *addr, int_t *addrlen);

int_t getsockname(int_t s, sockaddr *addr, int_t *addrlen);
int_t getpeername(int_t s, sockaddr *addr, int_t *addrlen);
int_t setsockopt(int_t s, int_t level, int_t optname, const void *optval, int_t optlen);
int_t getsockopt(int_t s, int_t level, int_t optname, void *optval, int_t *optlen);
int_t shutdown(int_t s, int_t how);
int_t closesocket(int_t s);

int_t select(int_t nfds, fd_set *readfds, fd_set *writefds,
   fd_set *exceptfds, const timeval *timeout);

void selectFdZero(fd_set *fds);
void selectFdSet(fd_set *fds, int_t s);
void selectFdClr(fd_set *fds, int_t s);
int_t selectFdIsSet(fd_set *fds, int_t s);

int_t gethostbyname(const char_t *name, hostent *info);

#endif

#endif
