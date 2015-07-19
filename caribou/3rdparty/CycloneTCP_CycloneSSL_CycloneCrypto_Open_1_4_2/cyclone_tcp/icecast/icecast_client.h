/**
 * @file icecast_client.h
 * @brief Icecast client
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

#ifndef _ICECAST_CLIENT_H
#define _ICECAST_CLIENT_H

//Dependencies
#include "tcp_ip_stack.h"
#include "socket.h"

//Stack size required to run the Icecast client
#define ICECAST_CLIENT_STACK_SIZE 500
//Priority at which the Icecast client should run
#define ICECAST_CLIENT_PRIORITY 1

//Maximum time the Icecast client will wait before closing the connection
#define ICECAST_CLIENT_TIMEOUT 10000
//Recovery delay
#define ICECAST_RECOVERY_DELAY 5000
//Maximum length of the server name
#define ICECAST_SERVER_NAME_MAX_LEN 32
//Maxmimum length of the requested resource
#define ICECAST_RESOURCE_MAX_LEN 32
//Maximum size of metadata blocks
#define ICECAST_CLIENT_METADATA_MAX_SIZE 512


/**
 * @brief Icecast client settings
 **/

typedef struct
{
   NetInterface *interface;                        ///<Underlying network interface
   char_t serverName[ICECAST_SERVER_NAME_MAX_LEN]; ///<Icecast server name
   uint16_t serverPort;                            ///<Icecast server port
   char_t resource[ICECAST_RESOURCE_MAX_LEN];      ///<Requested resource
   size_t bufferSize;                              ///<Streaming buffer size
} IcecastClientSettings;


/**
 * @brief Icecast client context
 **/

typedef struct
{
   IcecastClientSettings settings;                    ///<User settings
   OsMutex *mutex;                                    ///<Mutex protecting critical sections
   OsEvent *writeEvent;                               ///<This event tells whether the buffer is writable
   OsEvent *readEvent;                                ///<This event tells whether the buffer is readable
   Socket *socket;                                    ///<Underlying socket
   size_t blockSize;                                  ///<Number of data bytes between subsequent metadata blocks
   uint8_t *streamBuffer;                             ///<Streaming buffer
   size_t bufferSize;                                 ///<Streaming buffer size
   size_t bufferLength;                               ///<Streaming buffer length
   size_t writeIndex;                                 ///<Current write index within the buffer
   size_t readIndex;                                  ///<Current read index within the buffer
   size_t totalLength;                                ///<Total number of bytes that have been received
   char_t buffer[ICECAST_CLIENT_METADATA_MAX_SIZE];   ///<Memory buffer for input/output operations
   char_t metadata[ICECAST_CLIENT_METADATA_MAX_SIZE]; ///<Metadata information
   size_t metadataLength;                             ///<Length of the metadata
} IcecastClientContext;


//Icecast related functions
error_t icecastClientStart(IcecastClientContext *context,
   const IcecastClientSettings *settings);

error_t icecastClientReadStream(IcecastClientContext *context,
   uint8_t *data, size_t size, size_t *length, systime_t timeout);

error_t icecastClientReadMetadata(IcecastClientContext *context,
   char_t *metadata, size_t size, size_t *length);

void icecastClientTask(void *param);

error_t icecastClientConnect(IcecastClientContext *context);
error_t icecastClientProcessMetadata(IcecastClientContext *context);

#endif
