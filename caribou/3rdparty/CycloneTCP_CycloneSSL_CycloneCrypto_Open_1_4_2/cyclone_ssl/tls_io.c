/**
 * @file tls_io.c
 * @brief I/O abstraction layer
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneSSL Open.
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
#define TRACE_LEVEL TLS_TRACE_LEVEL

//Dependencies
#include "tls.h"
#include "tls_io.h"
#include "bsd_socket.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED)


/**
 * @brief Write data to the underlying socket
 * @param[in] context Pointer to the TLS context
 * @param[in] data Buffer containing the data to be written
 * @param[in] length Total number of bytes to be transmitted
 * @return Error code
 **/

error_t tlsIoWrite(TlsContext *context, const void *data, size_t length)
{
#if (TLS_BSD_SOCKET_SUPPORT == ENABLED)
   //Send the specified number of bytes
   int_t n = send(context->socket, data, length, 0);
   //Check return value
   if(n != length) return ERROR_WRITE_FAILED;

   //Successful write operation
   return NO_ERROR;
#else
   error_t error;

   //Send the specified number of bytes
   error = socketSend(context->socket, data, length, NULL, 0);
   //Any error to report?
   if(error) return ERROR_WRITE_FAILED;

   //Successful write operation
   return NO_ERROR;
#endif
}


/**
 * @brief Read data from the underlying socket
 * @param[in] context Pointer to the TLS context
 * @param[out] data Buffer where to store the incoming data
 * @param[in] length Requested number of bytes to read
 * @return Error code
 **/

error_t tlsIoRead(TlsContext *context, void *data, size_t length)
{
#if (TLS_BSD_SOCKET_SUPPORT == ENABLED)
   //Read as much data as possible
   while(length > 0)
   {
      //Read data
      int_t n = recv(context->socket, data, length, 0);
      //Any error to report?
      if(n <= 0) break;

      //Advance data pointer
      data = (uint8_t *) data + n;
      //Number of bytes remaining to read
      length -= n;
   }

   //Make sure that the requested number of bytes have been read
   if(length != 0) return ERROR_READ_FAILED;

   //Successful read operation
   return NO_ERROR;
#else
   error_t error;
   size_t n;

   //Read data
   error = socketReceive(context->socket, data, length, &n, SOCKET_FLAG_WAIT_ALL);
   //Any error to report?
   if(error) return ERROR_READ_FAILED;

   //Make sure that the requested number of bytes have been read
   if(n != length) return ERROR_READ_FAILED;

   //Successful read operation
   return NO_ERROR;
#endif
}

#endif
