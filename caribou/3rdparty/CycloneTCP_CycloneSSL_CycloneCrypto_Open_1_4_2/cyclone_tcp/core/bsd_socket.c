/**
 * @file bsd_socket.c
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

//Switch to the appropriate trace level
#define TRACE_LEVEL BSD_SOCKET_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tcp_ip_stack.h"
#include "bsd_socket.h"
#include "socket.h"
#include "debug.h"

//Common IPv6 addresses
const in6_addr in6addr_any =
   {{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}};

const in6_addr in6addr_loopback =
   {{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01}};


/**
 * @brief Create a socket that is bound to a specific transport service provider
 * @param[in] family Address family
 * @param[in] type Type specification for the new socket
 * @param[in] protocol Protocol to be used
 * @return On success, a file descriptor for the new socket is returned.
 *   On failure, SOCKET_ERROR is returned
 **/

int_t socket(int_t family, int_t type, int_t protocol)
{
   Socket *sock;

   //Valid address family?
   if(family != AF_INET && family != AF_INET6)
   {
      socketError(NULL, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Create a socket
   sock = socketOpen(type, protocol);

   //Failed to create a new socket?
   if(!sock)
   {
      socketError(NULL, ERROR_OUT_OF_MEMORY);
      return SOCKET_ERROR;
   }

   //Return the socket descriptor
   return sock->descriptor;
}


/**
 * @brief Associate a local address with a socket
 * @param[in] s Descriptor identifying an unbound socket
 * @param[in] addr Local address to assign to the bound socket
 * @param[in] addrlen Length in bytes of the address
 * @return If no error occurs, bind returns SOCKET_SUCCESS.
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t bind(int_t s, const sockaddr *addr, int_t addrlen)
{
   error_t error;
   uint16_t port;
   IpAddr ipAddr;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Check the length of the address
   if(addrlen < sizeof(sockaddr))
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 address?
   if(addr->sa_family == AF_INET && addrlen >= sizeof(sockaddr_in))
   {
      //Point to the IPv4 address information
      sockaddr_in *sa = (sockaddr_in *) addr;
      //Get port number
      port = ntohs(sa->sin_port);

      //Copy IPv4 address
      if(sa->sin_addr.s_addr == INADDR_ANY)
      {
         ipAddr.length = 0;
         ipAddr.ipv4Addr = IPV4_UNSPECIFIED_ADDR;
      }
      else
      {
         ipAddr.length = sizeof(Ipv4Addr);
         ipAddr.ipv4Addr = sa->sin_addr.s_addr;
      }
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 address?
   if(addr->sa_family == AF_INET6 && addrlen >= sizeof(sockaddr_in6))
   {
      //Point to the IPv6 address information
      sockaddr_in6 *sa = (sockaddr_in6 *) addr;
      //Get port number
      port = ntohs(sa->sin6_port);

      //Copy IPv6 address
      if(ipv6CompAddr(sa->sin6_addr.s6_addr, &in6addr_any))
      {
         ipAddr.length = 0;
         ipAddr.ipv6Addr = IPV6_UNSPECIFIED_ADDR;
      }
      else
      {
         ipAddr.length = sizeof(Ipv6Addr);
         ipv6CopyAddr(&ipAddr.ipv6Addr, sa->sin6_addr.s6_addr);
      }
   }
   else
#endif
   //Invalid address?
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Associate the local address with the socket
   error = socketBind(sock, &ipAddr, port);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief Establish a connection to a specified socket
 * @param[in] s Descriptor identifying an unconnected socket
 * @param[in] addr Address to which the connection should be established
 * @param[in] addrlen Length in bytes of the address
 * @return If no error occurs, connect returns SOCKET_SUCCESS.
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t connect(int_t s, const sockaddr *addr, int_t addrlen)
{
   error_t error;
   uint16_t port;
   IpAddr ipAddr;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Check the length of the address
   if(addrlen < sizeof(sockaddr))
   {
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 address?
   if(addr->sa_family == AF_INET && addrlen >= sizeof(sockaddr_in))
   {
      //Point to the IPv4 address information
      sockaddr_in *sa = (sockaddr_in *) addr;
      //Get port number
      port = ntohs(sa->sin_port);

      //Copy IPv4 address
      if(sa->sin_addr.s_addr == INADDR_ANY)
      {
         ipAddr.length = 0;
         ipAddr.ipv4Addr = IPV4_UNSPECIFIED_ADDR;
      }
      else
      {
         ipAddr.length = sizeof(Ipv4Addr);
         ipAddr.ipv4Addr = sa->sin_addr.s_addr;
      }
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 address?
   if(addr->sa_family == AF_INET6 && addrlen == sizeof(sockaddr_in6))
   {
      //Point to the IPv6 address information
      sockaddr_in6 *sa = (sockaddr_in6 *) addr;
      //Get port number
      port = ntohs(sa->sin6_port);

      //Copy IPv6 address
      if(ipv6CompAddr(sa->sin6_addr.s6_addr, &in6addr_any))
      {
         ipAddr.length = 0;
         ipAddr.ipv6Addr = IPV6_UNSPECIFIED_ADDR;
      }
      else
      {
         ipAddr.length = sizeof(Ipv6Addr);
         ipv6CopyAddr(&ipAddr.ipv6Addr, sa->sin6_addr.s6_addr);
      }
   }
   else
#endif
   //Invalid address?
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Establish connection
   error = socketConnect(sock, &ipAddr, port);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief Place a socket in the listening state
 *
 * Place a socket in a state in which it is listening for an incoming connection
 *
 * @param[in] s Descriptor identifying a bound, unconnected socket
 * @param[in] backlog Maximum length of the queue of pending connections
 * @return If no error occurs, listen returns SOCKET_SUCCESS.
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t listen(int_t s, int_t backlog)
{
   error_t error;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Place the socket in the listening state
   error = socketListen(sock);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief Permit an incoming connection attempt on a socket
 * @param[in] s Descriptor that identifies a socket in the listening state
 * @param[out] addr Address of the connecting entity (optional)
 * @param[in,out] addrlen Length in bytes of the address (optional)
 * @return If no error occurs, accept returns a descriptor for the new socket.
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t accept(int_t s, sockaddr *addr, int_t *addrlen)
{
   uint16_t port;
   IpAddr ipAddr;
   Socket *sock;
   Socket *newSock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Permit an incoming connection attempt on a socket
   newSock = socketAccept(sock, &ipAddr, &port);

   //The address is optional
   if(addr != NULL && addrlen != NULL)
   {
#if (IPV4_SUPPORT == ENABLED)
      //IPv4 address?
      if(ipAddr.length == sizeof(Ipv4Addr) && *addrlen >= sizeof(sockaddr_in))
      {
         //Point to the IPv4 address information
         sockaddr_in *sa = (sockaddr_in *) addr;

         //Set address family and port number
         sa->sin_family = AF_INET;
         sa->sin_port = htons(port);
         //Copy IPv4 address
         sa->sin_addr.s_addr = ipAddr.ipv4Addr;

         //Return the actual length of the address
         *addrlen = sizeof(sockaddr_in);
      }
      else
#endif
#if (IPV6_SUPPORT == ENABLED)
      //IPv6 address?
      if(ipAddr.length == sizeof(Ipv6Addr) && *addrlen >= sizeof(sockaddr_in6))
      {
         //Point to the IPv6 address information
         sockaddr_in6 *sa = (sockaddr_in6 *) addr;

         //Set address family and port number
         sa->sin6_family = AF_INET6;
         sa->sin6_port = htons(port);
         //Copy IPv6 address
         ipv6CopyAddr(sa->sin6_addr.s6_addr, &ipAddr.ipv6Addr);

         //Return the actual length of the address
         *addrlen = sizeof(sockaddr_in6);
      }
      else
#endif
      //Invalid address?
      {
         //Close socket
         socketClose(newSock);
         //Report an error
         socketError(sock, ERROR_INVALID_PARAMETER);
         return SOCKET_ERROR;
      }
   }

   //Return the descriptor to the new socket
   return newSock->descriptor;
}


/**
 * @brief Send data to a connected socket
 * @param[in] s Descriptor that identifies a connected socket
 * @param[in] data Pointer to a buffer containing the data to be transmitted
 * @param[in] length Number of bytes to be transmitted
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return If no error occurs, send returns the total number of bytes sent,
 *   which can be less than the number requested to be sent in the
 *   length parameter. Otherwise, a value of SOCKET_ERROR is returned
 **/

int_t send(int_t s, const void *data, int_t length, int_t flags)
{
   error_t error;
   size_t written;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Send data
   error = socketSend(sock, data, length, &written, flags << 8);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Return the number of bytes sent
   return written;
}


/**
 * @brief Send a datagram to a specific destination
 * @param[in] s Descriptor that identifies a socket
 * @param[in] data Pointer to a buffer containing the data to be transmitted
 * @param[in] length Number of bytes to be transmitted
 * @param[in] flags Set of flags that influences the behavior of this function
 * @param[in] addr Destination address
 * @param[in] addrlen Length in bytes of the destination address
 * @return If no error occurs, sendto returns the total number of bytes sent,
 *   which can be less than the number requested to be sent in the
 *   length parameter. Otherwise, a value of SOCKET_ERROR is returned
 **/

int_t sendto(int_t s, const void *data, int_t length,
   int_t flags, const sockaddr *addr, int_t addrlen)
{
   error_t error;
   size_t written;
   uint16_t port;
   IpAddr ipAddr;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Check the length of the address
   if(addrlen < sizeof(sockaddr))
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 address?
   if(addr->sa_family == AF_INET && addrlen == sizeof(sockaddr_in))
   {
      //Point to the IPv4 address information
      sockaddr_in *sa = (sockaddr_in *) addr;

      //Get port number
      port = ntohs(sa->sin_port);
      //Copy IPv4 address
      ipAddr.length = sizeof(Ipv4Addr);
      ipAddr.ipv4Addr = sa->sin_addr.s_addr;
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 address?
   if(addr->sa_family == AF_INET6 && addrlen == sizeof(sockaddr_in6))
   {
      //Point to the IPv6 address information
      sockaddr_in6 *sa = (sockaddr_in6 *) addr;

      //Get port number
      port = ntohs(sa->sin6_port);
      //Copy IPv6 address
      ipAddr.length = sizeof(Ipv6Addr);
      ipv6CopyAddr(&ipAddr.ipv6Addr, sa->sin6_addr.s6_addr);
   }
   else
#endif
   //Invalid address?
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Send data
   error = socketSendTo(sock, &ipAddr, port, data, length, &written, flags << 8);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Return the number of bytes sent
   return written;
}


/**
 * @brief Receive data from a connected socket
 * @param[in] s Descriptor that identifies a connected socket
 * @param[out] data Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return If no error occurs, recv returns the number of bytes received. If the
 *   connection has been gracefully closed, the return value is zero.
 *   Otherwise, a value of SOCKET_ERROR is returned
 **/

int_t recv(int_t s, void *data, int_t size, int_t flags)
{
   error_t error;
   size_t received;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Receive data
   error = socketReceive(sock, data, size, &received, flags << 8);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Return the number of bytes received
   return received;
}


/**
 * @brief Receive a datagram
 * @param[in] s Descriptor that identifies a socket
 * @param[out] data Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @param[in] flags Set of flags that influences the behavior of this function
 * @param[out] addr Source address upon return (optional)
 * @param[in,out] addrlen Length in bytes of the address (optional)
 * @return If no error occurs, recvfrom returns the number of bytes received.
 *   If the connection has been gracefully closed, the return value is
 *   zero. Otherwise, a value of SOCKET_ERROR is returned
 **/

int_t recvfrom(int_t s, void *data, int_t size,
   int_t flags, sockaddr *addr, int_t *addrlen)
{
   error_t error;
   size_t received;
   uint16_t port;
   IpAddr ipAddr;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Receive data
   error = socketReceiveFrom(sock, &ipAddr, &port, data, size, &received, flags << 8);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //The address is optional
   if(addr != NULL && addrlen != NULL)
   {
#if (IPV4_SUPPORT == ENABLED)
      //IPv4 address?
      if(ipAddr.length == sizeof(Ipv4Addr) && *addrlen >= sizeof(sockaddr_in))
      {
         //Point to the IPv4 address information
         sockaddr_in *sa = (sockaddr_in *) addr;

         //Set address family and port number
         sa->sin_family = AF_INET;
         sa->sin_port = htons(port);
         //Copy IPv4 address
         sa->sin_addr.s_addr = ipAddr.ipv4Addr;

         //Return the actual length of the address
         *addrlen = sizeof(sockaddr_in);
      }
      else
#endif
#if (IPV6_SUPPORT == ENABLED)
      //IPv6 address?
      if(ipAddr.length == sizeof(Ipv6Addr) && *addrlen >= sizeof(sockaddr_in6))
      {
         //Point to the IPv6 address information
         sockaddr_in6 *sa = (sockaddr_in6 *) addr;

         //Set address family and port number
         sa->sin6_family = AF_INET6;
         sa->sin6_port = htons(port);
         //Copy IPv6 address
         ipv6CopyAddr(sa->sin6_addr.s6_addr, &ipAddr.ipv6Addr);

         //Return the actual length of the address
         *addrlen = sizeof(sockaddr_in6);
      }
      else
#endif
      //Invalid address?
      {
         //Report an error
         socketError(sock, ERROR_INVALID_PARAMETER);
         return SOCKET_ERROR;
      }
   }

   //Return the number of bytes received
   return received;
}


/**
 * @brief Retrieves the local name for a socket
 * @param[in] s Descriptor identifying a socket
 * @param[out] addr Address of the socket
 * @param[in,out] addrlen Length in bytes of the address
 * @return If no error occurs, getsockname returns SOCKET_SUCCESS
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t getsockname(int_t s, sockaddr *addr, int_t *addrlen)
{
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //The socket has not been bound to an address?
   if(!sock->localIpAddr.length)
   {
      socketError(sock, ERROR_NO_BINDING);
      return SOCKET_ERROR;
   }

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 address?
   if(sock->localIpAddr.length == sizeof(Ipv4Addr) && *addrlen >= sizeof(sockaddr_in))
   {
      //Point to the IPv4 address information
      sockaddr_in *sa = (sockaddr_in *) addr;

      //Set address family and port number
      sa->sin_family = AF_INET;
      sa->sin_port = htons(sock->localPort);
      //Copy IPv4 address
      sa->sin_addr.s_addr = sock->localIpAddr.ipv4Addr;

      //Return the actual length of the address
      *addrlen = sizeof(sockaddr_in);
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 address?
   if(sock->localIpAddr.length == sizeof(Ipv6Addr) && *addrlen >= sizeof(sockaddr_in6))
   {
      //Point to the IPv6 address information
      sockaddr_in6 *sa = (sockaddr_in6 *) addr;

      //Set address family and port number
      sa->sin6_family = AF_INET6;
      sa->sin6_port = htons(sock->localPort);
      //Copy IPv6 address
      ipv6CopyAddr(sa->sin6_addr.s6_addr, &sock->localIpAddr.ipv6Addr);

      //Return the actual length of the address
      *addrlen = sizeof(sockaddr_in6);
   }
   else
#endif
   //Invalid address?
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief Retrieves the address of the peer to which a socket is connected
 * @param[in] s Descriptor identifying a socket
 * @param[out] addr Address of the peer
 * @param[in,out] addrlen Length in bytes of the address
 * @return If no error occurs, getpeername returns SOCKET_SUCCESS
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t getpeername(int_t s, sockaddr *addr, int_t *addrlen)
{
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //The socket has not been bound to an address?
   if(!sock->remoteIpAddr.length)
   {
      socketError(sock, ERROR_NO_BINDING);
      return SOCKET_ERROR;
   }

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 address?
   if(sock->remoteIpAddr.length == sizeof(Ipv4Addr) && *addrlen >= sizeof(sockaddr_in))
   {
      //Point to the IPv4 address information
      sockaddr_in *sa = (sockaddr_in *) addr;

      //Set address family and port number
      sa->sin_family = AF_INET;
      sa->sin_port = htons(sock->remotePort);
      //Copy IPv4 address
      sa->sin_addr.s_addr = sock->remoteIpAddr.ipv4Addr;

      //Return the actual length of the address
      *addrlen = sizeof(sockaddr_in);
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 address?
   if(sock->remoteIpAddr.length == sizeof(Ipv6Addr) && *addrlen >= sizeof(sockaddr_in6))
   {
      //Point to the IPv6 address information
      sockaddr_in6 *sa = (sockaddr_in6 *) addr;

      //Set address family and port number
      sa->sin6_family = AF_INET6;
      sa->sin6_port = htons(sock->remotePort);
      //Copy IPv6 address
      ipv6CopyAddr(sa->sin6_addr.s6_addr, &sock->remoteIpAddr.ipv6Addr);

      //Return the actual length of the address
      *addrlen = sizeof(sockaddr_in6);
   }
   else
#endif
   //Invalid address?
   {
      //Report an error
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief The setsockopt function sets a socket option
 * @param[in] s Descriptor that identifies a socket
 * @param[in] level The level at which the option is defined
 * @param[in] optname The socket option for which the value is to be set
 * @param[in] optval A pointer to the buffer in which the value for the requested option is specified
 * @param[in] optlen The size, in bytes, of the buffer pointed to by the optval parameter
 * @return If no error occurs, setsockopt returns SOCKET_SUCCESS
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t setsockopt(int_t s, int_t level, int_t optname, const void *optval, int_t optlen)
{
   timeval *t;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Make sure the option is valid
   if(!optval)
   {
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Level at which the option is defined?
   if(level == SOL_SOCKET)
   {
      //Check option type
      switch(optname)
      {
      //Timeout option?
      case SO_SNDTIMEO:
      case SO_RCVTIMEO:
         //Check option length
         if(optlen < sizeof(timeval))
         {
            socketError(NULL, ERROR_INVALID_LENGTH);
            return SOCKET_ERROR;
         }

         //Point to the timeval structure
         t = (timeval *) optval;

         //If the specified value is of zero, I/O operations shall not time out
         if(!t->tv_sec && !t->tv_usec)
            sock->timeout = INFINITE_DELAY;
         else
            sock->timeout = t->tv_sec * 1000 + t->tv_usec / 1000;

         //Successful processing
         break;

      //Unknown option?
      default:
         //Report an error
         socketError(NULL, ERROR_INVALID_OPTION);
         return SOCKET_ERROR;
      }
   }
   //Unknown level
   else
   {
      //Report an error
      socketError(NULL, ERROR_INVALID_LEVEL);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief The getsockopt function retrieves a socket option
 * @param[in] s Descriptor that identifies a socket
 * @param[in] level The level at which the option is defined
 * @param[in] optname The socket option for which the value is to be retrieved
 * @param[out] optval A pointer to the buffer in which the value for the requested option is to be returned
 * @param[in,out] optlen The size, in bytes, of the buffer pointed to by the optval parameter
 * @return If no error occurs, getsockopt returns SOCKET_SUCCESS
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t getsockopt(int_t s, int_t level, int_t optname, void *optval, int_t *optlen)
{
   timeval *t;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Make sure the option is valid
   if(!optval)
   {
      socketError(sock, ERROR_INVALID_PARAMETER);
      return SOCKET_ERROR;
   }

   //Level at which the option is defined?
   if(level == SOL_SOCKET)
   {
      //Check option type
      switch(optname)
      {
      //Timeout option?
      case SO_SNDTIMEO:
      case SO_RCVTIMEO:
         //Check option length
         if(*optlen < sizeof(timeval))
         {
            socketError(NULL, ERROR_INVALID_LENGTH);
            return SOCKET_ERROR;
         }

         //Point to the timeval structure
         t = (timeval *) optval;

         //Copy timeout value
         if(sock->timeout == INFINITE_DELAY)
         {
            t->tv_sec = 0;
            t->tv_usec = 0;
         }
         else
         {
            t->tv_sec = sock->timeout / 1000;
            t->tv_usec = (sock->timeout % 1000) * 1000;
         }

         //Return the actual length of the option
         *optlen = sizeof(timeval);
         //Successful processing
         break;

      //Last error code on this socket?
      case SO_ERROR:
         //Check option length
         if(*optlen < sizeof(sock->lastError))
         {
            socketError(NULL, ERROR_INVALID_LENGTH);
            return SOCKET_ERROR;
         }
         //Copy timeout value
         memcpy(optval, &sock->lastError, sizeof(sock->lastError));
         //Return the actual length of the option
         *optlen = sizeof(sock->lastError);
         //Successful processing
         break;

      //Unknown option?
      default:
         //Report an error
         socketError(NULL, ERROR_INVALID_OPTION);
         return SOCKET_ERROR;
      }
   }
   //Unknown level
   else
   {
      //Report an error
      socketError(NULL, ERROR_INVALID_LEVEL);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief The shutdown function disables sends or receives on a socket
 * @param[in] s Descriptor that identifies a socket
 * @param[in] how A flag that describes what types of operation will no longer be allowed
 * @return If no error occurs, shutdown returns SOCKET_SUCCESS
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t shutdown(int_t s, int_t how)
{
   error_t error;
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Shut down socket
   error = socketShutdown(sock, how);

   //Any error to report?
   if(error)
   {
      socketError(sock, error);
      return SOCKET_ERROR;
   }

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief The closesocket function closes an existing socket
 * @param[in] s Descriptor that identifies a socket
 * @return If no error occurs, closesocket returns SOCKET_SUCCESS
 *   Otherwise, it returns SOCKET_ERROR
 **/

int_t closesocket(int_t s)
{
   Socket *sock;

   //Make sure the socket descriptor is valid
   if(s < 0 || s >= SOCKET_MAX_COUNT)
   {
      socketError(NULL, ERROR_INVALID_SOCKET);
      return SOCKET_ERROR;
   }

   //Point to the socket structure
   sock = &socketTable[s];

   //Close socket
   socketClose(sock);

   //Successful processing
   return SOCKET_SUCCESS;
}


/**
 * @brief Determine the status of one or more sockets
 *
 * The select function determines the status of one or more sockets,
 * waiting if necessary, to perform synchronous I/O
 *
 * @param[in] nfds Unused parameter included only for compatibility with Berkeley socket
 * @param[in,out] readfds An optional pointer to a set of sockets to be checked for readability
 * @param[in,out] writefds An optional pointer to a set of sockets to be checked for writability
 * @param[in,out] exceptfds An optional pointer to a set of sockets to be checked for errors
 * @param[in] timeout The maximum time for select to wait. Set the timeout
 *   parameter to null for blocking operations
 * @return The select function returns the total number of socket handles that
 *   are ready and contained in the fd_set structures, zero if the time
 *   limit expired, or SOCKET_ERROR if an error occurred
 **/

int_t select(int_t nfds, fd_set *readfds, fd_set *writefds,
   fd_set *exceptfds, const timeval *timeout)
{
   int_t i;
   int_t j;
   int_t n;
   int_t s;
   systime_t time;
   uint_t eventMask;
   uint_t eventFlags;
   OsEvent *event;
   fd_set *fds;

   //Create an event object to get notified of socket events
   event = osEventCreate(FALSE);

   //Any error to report?
   if(event == OS_INVALID_HANDLE)
   {
      socketError(NULL, ERROR_OUT_OF_RESOURCES);
      return SOCKET_ERROR;
   }

   //Parse all the descriptor sets
   for(i = 0; i < 3; i ++)
   {
      //Select the suitable descriptor set
      switch(i)
      {
      case 0:
         //Set of sockets to be checked for readability
         fds = readfds;
         eventMask = SOCKET_EVENT_RX_READY;
         break;
      case 1:
         //Set of sockets to be checked for writability
         fds = writefds;
         eventMask = SOCKET_EVENT_TX_READY;
         break;
      default:
         //Set of sockets to be checked for errors
         fds = exceptfds;
         eventMask = SOCKET_EVENT_CLOSED;
         break;
      }

      //Each descriptor is optional and may be omitted
      if(fds != NULL)
      {
         //Parse the current set of sockets
         for(j = 0; j < fds->fd_count; j++)
         {
            //Get the descriptor associated with the current entry
            s = fds->fd_array[j];
            //Subscribe to the requested events
            socketRegisterEvents(&socketTable[s], event, eventMask);
         }
      }
   }

   //Retrieve timeout value
   if(timeout != NULL)
      time = timeout->tv_sec * 1000 + timeout->tv_usec / 1000;
   else
      time = INFINITE_DELAY;

   //Block the current task until an event occurs
   osEventWait(event, time);

   //Count the number of events in the signaled state
   n = 0;

   //Parse all the descriptor sets
   for(i = 0; i < 3; i ++)
   {
      //Select the suitable descriptor set
      switch(i)
      {
      case 0:
         //Set of sockets to be checked for readability
         fds = readfds;
         eventMask = SOCKET_EVENT_RX_READY;
         break;
      case 1:
         //Set of sockets to be checked for writability
         fds = writefds;
         eventMask = SOCKET_EVENT_TX_READY;
         break;
      default:
         //Set of sockets to be checked for errors
         fds = exceptfds;
         eventMask = SOCKET_EVENT_CLOSED;
         break;
      }

      //Each descriptor is optional and may be omitted
      if(fds != NULL)
      {
         //Parse the current set of sockets
         for(j = 0; j < fds->fd_count; )
         {
            //Get the descriptor associated with the current entry
            s = fds->fd_array[j];
            //Retrieve event flags for the current socket
            socketGetEvents(&socketTable[s], &eventFlags);
            //Unsubscribe previously registered events
            socketUnregisterEvents(&socketTable[s]);

            //Event flag is set?
            if(eventFlags & eventMask)
            {
               //Track the number of events in the signaled state
               n++;
               //Jump to the next socket descriptor
               j++;
            }
            else
            {
               //Remove descriptor from the current set
               selectFdClr(fds, s);
            }
         }
      }
   }

   //Close event
   osEventClose(event);
   //Return the number of events in the signaled state
   return n;
}


/**
 * @brief Initializes a descriptor set
 * @param[in] fds Pointer to a descriptor set
 **/

void selectFdZero(fd_set *fds)
{
   //Reset the descriptor count
   fds->fd_count = 0;
}


/**
 * @brief Add a descriptor to an existing set
 * @param[in] fds Pointer to a descriptor set
 * @param[in] s Descriptor that identifies the socket to add
 **/

void selectFdSet(fd_set *fds, int_t s)
{
   int_t i;

   //Loop through descriptors
   for(i = 0; i < fds->fd_count; i++)
   {
      //The specified descriptor is already set?
      if(fds->fd_array[i] == s)
         return;
   }

   //Ensure the descriptor set is not full
   if(i < FD_SETSIZE)
   {
      //The specified descriptor can be safely added
      fds->fd_array[i] = s;
      //Adjust the size of the descriptor set
      fds->fd_count++;
   }
}


/**
 * @brief Remove a descriptor from an existing set
 * @param[in] fds Pointer to a descriptor set
 * @param[in] s Descriptor that identifies the socket to remove
 **/

void selectFdClr(fd_set *fds, int_t s)
{
   int_t i;
   int_t j;

   //Loop through descriptors
   for(i = 0; i < fds->fd_count; i++)
   {
      //Specified descriptor found?
      if(fds->fd_array[i] == s)
      {
         //Adjust the size of the descriptor set
         fds->fd_count--;

         //Remove the entry from the descriptor set
         for(j = i; j < fds->fd_count; j++)
            fds->fd_array[j] = fds->fd_array[j + 1];

         //Return immediately
         return;
      }
   }
}


/**
 * @brief Check whether a descriptor is set
 * @param[in] fds Pointer to a descriptor set
 * @param[in] s Descriptor that identifies the socket to test
 * @return Nonzero if s is a member of the set. Otherwise, zero
 **/

int_t selectFdIsSet(fd_set *fds, int_t s)
{
   int_t i;

   //Loop through descriptors
   for(i = 0; i < fds->fd_count; i++)
   {
      //Check whether the specified descriptor is set
      if(fds->fd_array[i] == s)
         return TRUE;
   }

   //The specified descriptor is not currently set
   return FALSE;
}


/**
 * @brief Retrieve host address corresponding to a host name
 * @param[in] name Name of the host to resolve
 * @param[out] info Address of the specified host
 * @return If no error occurs, gethostbyname returns 0. Otherwise
 *   it returns an appropriate error code
 **/

int_t gethostbyname(const char_t *name, hostent *info)
{
   error_t error;
   IpAddr ipAddr;

   //Check input parameters
   if(!name || !info)
      return ERROR_INVALID_PARAMETER;

   //Resolve host address
   error = getHostByName(NULL, name, &ipAddr, 0);
   //Address resolution failed?
   if(error) return error;

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 address?
   if(ipAddr.length == sizeof(Ipv4Addr))
   {
      //Set address family
      info->h_addrtype = AF_INET;
      //Copy IPv4 address
      info->h_length = sizeof(Ipv4Addr);
      ipv4CopyAddr(info->h_addr, &ipAddr.ipv4Addr);
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 address?
   if(ipAddr.length == sizeof(Ipv6Addr))
   {
      //Set address family
      info->h_addrtype = AF_INET6;
      //Copy IPv6 address
      info->h_length = sizeof(Ipv6Addr);
      ipv6CopyAddr(info->h_addr, &ipAddr.ipv6Addr);
   }
   else
#endif
   //Invalid address?
   {
      //Report an error
      return ERROR_FAILURE;
   }

   //Successful processing
   return NO_ERROR;
}
