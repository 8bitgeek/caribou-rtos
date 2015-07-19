/**
 * @file icecast_client.c
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

//Dependencies
#include <stdlib.h>
#include "icecast_client.h"
#include "str.h"
#include "debug.h"

/*#if 0
   //RTL
   const char server[] = "streaming.radio.rtl.fr";
   const char file[] = "rtl-1-44-96";
   const uint16_t port = 80;
#elif 0
   //RTL2
   const char server[] = "streaming.radio.funradio.fr";
   const char file[] = "rtl2-1-44-96";
   const uint16_t port = 80;
#elif 0
   //XMR radio
   const char server[] = "lush.wavestreamer.com";
   const char file[] = "";
   const uint16_t port = 2479;
#elif 0
   //Couleur 3
   const char server[] = "broadcast.infomaniak.net";
   const char file[] = "rsr-couleur3-high.mp3";
   const uint16_t port = 80;
#elif 0
   //Virage radio
   const char server[] = "broadcast.infomaniak.net";
   const char file[] = "virageradio-high.mp3";
   const uint16_t port = 80;
#elif 0
   //Virgin radio
   const char server[] = "vipicecast.yacast.net";
   const char file[] = "virginradio";
   const uint16_t port = 80;
#elif 0
   //Virgin radio rock alternative
   const char server[] = "vipicecast.yacast.net";
   const char file[] = "vra_webradio01";
   const uint16_t port = 80;
#elif 0
   //OUI FM
   const char server[] = "broadcast.infomaniak.net";
   const char file[] = "ouifm-high.mp3";
   const uint16_t port = 80;
#elif 1
   //OUI FM
   const char server[] = "ouifm.ice.infomaniak.ch";
   const char file[] = "ouifm-high.mp3";
   const uint16_t port = 80;
#endif*/


/**
 * @brief Start Icecast client
 * @param[in] context Pointer to the Icecast client context
 * @param[in] settings Icecast client specific settings
 * @return Error code
 **/

error_t icecastClientStart(IcecastClientContext *context,
   const IcecastClientSettings *settings)
{
   error_t error;
   OsTask *task;

   //Debug message
   TRACE_INFO("Starting Icecast client...\r\n");

   //Ensure the parameters are valid
   if(!context || !settings)
      return ERROR_INVALID_PARAMETER;

   //Clear the Icecast client context
   memset(context, 0, sizeof(IcecastClientContext));
   //Save user settings
   context->settings = *settings;

   //Get the size of the circular buffer
   context->bufferSize = settings->bufferSize;

   //Start of exception handling block
   do
   {
      //Allocate a memory block to hold the circular buffer
      context->streamBuffer = osMemAlloc(context->bufferSize);

      //Failed to allocate memory?
      if(!context->streamBuffer)
      {
         //Report an error to the calling function
         error = ERROR_OUT_OF_MEMORY;
         break;
      }

      //Create mutex object to protect critical sections
      context->mutex = osMutexCreate(FALSE);

      //Failed to create mutex object?
      if(context->mutex == OS_INVALID_HANDLE)
      {
         //Report an error to the calling function
         error = ERROR_OUT_OF_RESOURCES;
         break;
      }

      //Create events to get notified when the buffer is writable/readable
      context->writeEvent = osEventCreate(TRUE);
      context->readEvent = osEventCreate(FALSE);

      //Failed to create event object?
      if(context->writeEvent == OS_INVALID_HANDLE ||
         context->readEvent == OS_INVALID_HANDLE)
      {
         //Report an error to the calling function
         error = ERROR_OUT_OF_RESOURCES;
         break;
      }

      //Create the Icecast client task
      task = osTaskCreate("Icecast client", icecastClientTask,
         context, ICECAST_CLIENT_STACK_SIZE, ICECAST_CLIENT_PRIORITY);

      //Unable to create the task?
      if(task == OS_INVALID_HANDLE)
      {
         //Report an error to the calling function
         error = ERROR_OUT_OF_RESOURCES;
         break;
      }

      //Successful initialization
      error = NO_ERROR;

      //End of exception handling block
   } while(0);

   //Check whether an error occurred
   if(error)
   {
      //Clean up side effects...
      osMemFree(context->streamBuffer);
      osMutexClose(context->mutex);
      osEventClose(context->writeEvent);
      osEventClose(context->readEvent);
   }

   //Return status code
   return error;
}


/**
 * @brief Copy data from input stream
 * @param[in] context Pointer to the Icecast client context
 * @param[out] data Pointer to the user buffer
 * @param[in] size Maximum number of bytes that can be read
 * @param[out] length Number of bytes that have been read
 * @param[in] timeout Maximum time to wait before returning
 * @return Error code
 **/

error_t icecastClientReadStream(IcecastClientContext *context,
   uint8_t *data, size_t size, size_t *length, systime_t timeout)
{
   bool_t status;

   //Ensure the parameters are valid
   if(!context || !data)
      return ERROR_INVALID_PARAMETER;

   //Wait for the buffer to be available for reading
   status = osEventWait(context->readEvent, timeout);
   //Timeout error?
   if(!status) return ERROR_TIMEOUT;

   //Enter critical section
   osMutexAcquire(context->mutex);
   //Compute the number of bytes to read at a time
   *length = min(size, context->bufferLength);
   //Leave critical section
   osMutexRelease(context->mutex);

   //Check whether the specified data crosses buffer boundaries
   if((context->readIndex + *length) <= context->bufferSize)
   {
      //Copy the data
      memcpy(data, context->streamBuffer + context->readIndex, *length);
   }
   else
   {
      //Copy the first part of the data
      memcpy(data, context->streamBuffer + context->readIndex,
         context->bufferSize - context->readIndex);
      //Wrap around to the beginning of the circular buffer
      memcpy(data + context->bufferSize - context->readIndex, context->streamBuffer,
         *length - context->bufferSize + context->readIndex);
   }

   //Enter critical section
   osMutexAcquire(context->mutex);

   //Increment read index
   context->readIndex += *length;
   //Wrap around if necessary
   if(context->readIndex >= context->bufferSize)
      context->readIndex -= context->bufferSize;

   //Update buffer length
   context->bufferLength -= *length;
   //Check whether the buffer is available for writing
   if(context->bufferLength < context->bufferSize)
      osEventSet(context->writeEvent);
   //Check whether the buffer is available for reading
   if(context->bufferLength > 0)
      osEventSet(context->readEvent);

   //Leave critical section
   osMutexRelease(context->mutex);

   //Successful read operation
   return NO_ERROR;
}


/**
 * @brief Copy metadata from input stream
 * @param[in] context Pointer to the Icecast client context
 * @param[out] metadata Pointer to the user buffer
 * @param[in] size Maximum number of bytes that can be read
 * @param[out] length Number of bytes that have been read
 * @return Error code
 **/

error_t icecastClientReadMetadata(IcecastClientContext *context,
   char_t *metadata, size_t size, size_t *length)
{
   //Ensure the parameters are valid
   if(!context || !metadata)
      return ERROR_INVALID_PARAMETER;

   //Enter critical section
   osMutexAcquire(context->mutex);

   //Limit the number of data to read
   *length = min(size, context->metadataLength);
   //Save metadata information
   memcpy(metadata, context->metadata, *length);

   //Leave critical section
   osMutexRelease(context->mutex);

   //Successful read operation
   return NO_ERROR;
}


/**
 * @brief Icecast client task
 * @param[in] param Pointer to the Icecast client context
 **/

void icecastClientTask(void *param)
{
   error_t error;
   bool_t end;
   size_t n;
   size_t length;
   size_t received;
   IcecastClientContext *context;

   //Retrieve the Icecast client context
   context = (IcecastClientContext *) param;

   //Main loop
   while(1)
   {
      //Initiate a connection to the Icecast server
      error = icecastClientConnect(context);

      //Connection to server failed?
      if(error)
      {
         //Debug message
         TRACE_ERROR("Connection to Icecast server failed!\r\n");
         //Recovery delay
         osDelay(ICECAST_RECOVERY_DELAY);
         //Try to reconnect...
         continue;
      }

      //Debug message
      TRACE_INFO("Block size = %" PRIuSIZE "\r\n", context->blockSize);

      //Check block size
      if(!context->blockSize)
      {
         socketClose(context->socket);
         continue;
      }

      //Initialize loop condition variable
      end = FALSE;

      //Read as much data as possible...
      while(!end)
      {
         //Process the stream block by block
         length = context->blockSize;

         //Read current block
         while(!end && length > 0)
         {
            //Wait for the buffer to be available for writing
            osEventWait(context->writeEvent, INFINITE_DELAY);

            //Enter critical section
            osMutexAcquire(context->mutex);
            //Compute the number of bytes to read at a time
            n = min(length, context->bufferSize - context->bufferLength);
            //Leave critical section
            osMutexRelease(context->mutex);

            //Check whether the specified data crosses buffer boundaries
            if((context->writeIndex + n) > context->bufferSize)
               n = context->bufferSize - context->writeIndex;

            //Receive data
            error = socketReceive(context->socket, context->streamBuffer +
               context->writeIndex, n, &received, SOCKET_FLAG_WAIT_ALL);

            //Make sure the expected number of bytes have been received
            if(error || received != n)
               end = TRUE;

            //Enter critical section
            osMutexAcquire(context->mutex);

            //Increment write index
            context->writeIndex += n;
            //Wrap around if necessary
            if(context->writeIndex >= context->bufferSize)
               context->writeIndex -= context->bufferSize;

            //Update buffer length
            context->bufferLength += n;
            //Check whether the buffer is available for writing
            if(context->bufferLength < context->bufferSize)
               osEventSet(context->writeEvent);
            //Check whether the buffer is available for reading
            if(context->bufferLength > 0)
               osEventSet(context->readEvent);

            //Leave critical section
            osMutexRelease(context->mutex);

            //Update the total number of bytes that have been received
            context->totalLength += n;
            //Number of remaining data to read
            length -= n;
         }

         //Debug message
         TRACE_DEBUG("Total bytes received = %" PRIuSIZE "\r\n", context->totalLength);

         //Check whether the metadata block should be read
         if(!end)
         {
            //Process the metadata block
            error = icecastClientProcessMetadata(context);
            //Any error to report?
            if(error) end = TRUE;
         }
      }

      //Close connection
      socketClose(context->socket);
   }
}


/**
 * @brief Connect to the specified Icecast server
 * @param[in] context Pointer to the Icecast client context
 **/

error_t icecastClientConnect(IcecastClientContext *context)
{
   error_t error;
   size_t length;
   IpAddr serverIpAddr;

   //Icecast request template
   const char_t requestTemplate[] =
      "GET /%s HTTP/1.1\r\n"
      "Host: %s\r\n"
      "User-agent: UserAgent\r\n"
      "Icy-MetaData: 1\r\n"
      "Connection: close\r\n"
      "\r\n";

   //The specified Icecast server can be either an IP or a host name
   error = getHostByName(context->settings.interface,
      context->settings.serverName, &serverIpAddr, 0);
   //Unable to resolve server name?
   if(error) return error;

   //Open a TCP socket
   context->socket = socketOpen(SOCKET_TYPE_STREAM, SOCKET_PROTOCOL_TCP);
   //Failed to open socket?
   if(!context->socket) return ERROR_OUT_OF_RESOURCES;

   //Start of exception handling block
   do
   {
      //Adjust receive timeout
      error = socketSetTimeout(context->socket, ICECAST_CLIENT_TIMEOUT);
      //Any error to report?
      if(error) return error;

      //Connect to the specified Icecast server
      error = socketConnect(context->socket, &serverIpAddr, context->settings.serverPort);
      //Connection with server failed?
      if(error) return error;

      //Format Icecast request
      length = sprintf(context->buffer, requestTemplate,
         context->settings.resource, context->settings.serverName);

      //Debug message
      TRACE_DEBUG(context->buffer);

      //Send Icecast request
      error = socketSend(context->socket, context->buffer,
         length, NULL, SOCKET_FLAG_WAIT_ACK);

      //Failed to send the request?
      if(error) return error;

      //Parse response header
      while(1)
      {
         char_t *separator;
         char_t *property;
         char_t *value;

         //Read a line from the response header
         error = socketReceive(context->socket, context->buffer,
            ICECAST_CLIENT_METADATA_MAX_SIZE, &length, SOCKET_FLAG_BREAK_CRLF);
         //Failed to read data?
         if(error)
            break;

         //Properly terminate the string with a NULL character
         context->buffer[length] = '\0';

         //The end of the header has been reached?
         if(!strcmp(context->buffer, "\r\n"))
            break;

         //Check whether a separator is present
         separator = strchr(context->buffer, ':');

         //Separator found?
         if(separator)
         {
            //Split the line
            *separator = '\0';

            //Get property name and value
            property = strTrimWhitespace(context->buffer);
            value = strTrimWhitespace(separator + 1);

            //Debug message
            TRACE_INFO("<%s>=<%s>\r\n", property, value);

            //Icy-Metaint property found?
            if(!strcasecmp(property, "Icy-Metaint"))
               context->blockSize = atoi(value);
         }
      }

      //End of exception handling block
   } while(0);

   //Check whether an error occurred
   if(error)
   {
      //Clean up side effects
      socketClose(context->socket);
   }

   //Return status code
   return error;
}


/**
 * @brief Decode metadata block
 * @param[in] context Pointer to the Icecast client context
 **/

error_t icecastClientProcessMetadata(IcecastClientContext *context)
{
   error_t error;
   size_t n;
   size_t length;
   size_t metadataLength;

   //The metadata block begins with a single byte which indicates
   //how many 16-byte segments need to be read
   error = socketReceive(context->socket, context->buffer,
      sizeof(uint8_t), &length, SOCKET_FLAG_WAIT_ALL);

   //Any error to report?
   if(error)
      return error;
   //Make sure the expected number of bytes have been received
   if(length != sizeof(uint8_t))
      return ERROR_INVALID_METADATA;

   //Compute the length of the following metadata block
   metadataLength = context->buffer[0] * 16;
   //Debug message
   TRACE_DEBUG("Icecast metadata length = %" PRIuSIZE "\r\n", metadataLength);

   //Limit the number of bytes to read
   n = min(metadataLength, ICECAST_CLIENT_METADATA_MAX_SIZE - 1);

   //Read the metadata information
   error = socketReceive(context->socket, context->buffer,
      n, &length, SOCKET_FLAG_WAIT_ALL);

   //Any error to report?
   if(error)
      return error;
   //Make sure the expected number of bytes have been received
   if(length != n)
      return ERROR_INVALID_METADATA;

   //Enter critical section
   osMutexAcquire(context->mutex);

   //Save metadata information
   memcpy(context->metadata, context->buffer, n);
   //Terminate the string properly
   context->metadata[n] = '\0';
   //Record the length of the metadata
   context->metadataLength = n;

   //Leave critical section
   osMutexRelease(context->mutex);

   //Debug message
   TRACE_DEBUG("<%s>\r\n", context->metadata);

   //Compute the number of bytes that have not been processed
   metadataLength -= n;

   //Read the complete metadata
   while(metadataLength > 0)
   {
      //Compute the number of data to read at a time
      n = min(metadataLength, ICECAST_CLIENT_METADATA_MAX_SIZE);

      //Drop incoming data...
      error = socketReceive(context->socket, context->buffer,
         n, &length, SOCKET_FLAG_WAIT_ALL);

      //Any error to report?
      if(error)
         return error;
      //Make sure the expected number of bytes have been received
      if(length != n)
         return ERROR_INVALID_METADATA;

      //Update byte counter
      metadataLength -= n;
   }

   //Successful processing
   return NO_ERROR;
}
