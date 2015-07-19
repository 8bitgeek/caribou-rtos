/**
 * @file http_server.c
 * @brief HTTP server (HyperText Transfer Protocol)
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
 * Using the HyperText Transfer Protocol, the HTTP server delivers web pages
 * to browsers as well as other data files to web-based applications. Refers
 * to the following RFCs for complete details:
 * - RFC 1945 : Hypertext Transfer Protocol - HTTP/1.0
 * - RFC 2616 : Hypertext Transfer Protocol - HTTP/1.1
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL HTTP_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include <string.h>
#include <limits.h>
#include "tcp_ip_stack.h"
#include "http_server.h"
#include "mime.h"
#include "ssi.h"
#include "str.h"
#include "debug.h"

//File system support?
#if (HTTP_SERVER_FS_SUPPORT == ENABLED)
   #include "fs_port.h"
#else
   #include "resource_manager.h"
#endif

//Check TCP/IP stack configuration
#if (HTTP_SERVER_SUPPORT == ENABLED)


/**
 * @brief HTTP status codes
 **/

static const HttpStatusCodeDesc statusCodeList[] =
{
   //Success
   {200, "OK"},
   {201, "Created"},
   {202, "Accepted"},
   {204, "No Content"},
   //Redirection
   {301, "Moved Permanently"},
   {302, "Moved Temporarily"},
   {304, "Not Modified"},
   //Client error
   {400, "Bad Request"},
   {401, "Unauthorized"},
   {403, "Forbidden"},
   {404, "Not Found"},
   //Server error
   {500, "Internal Server Error"},
   {501, "Not Implemented"},
   {502, "Bad Gateway"},
   {503, "Service Unavailable"}
};


/**
 * @brief Initialize settings with default values
 * @param[out] settings Structure that contains HTTP server settings
 **/

void httpServerGetDefaultSettings(HttpServerSettings *settings)
{
   //Use default interface
   settings->interface = NULL;
   //Listen to port 80
   settings->port = HTTP_PORT;
   //Specify the server's root directory
   strcpy(settings->rootDirectory, "/");
   //Set default home page
   strcpy(settings->defaultDocument, "index.htm");
   //Callback functions
   settings->cgiCallback = NULL;
   settings->uriNotFoundCallback = NULL;
}


/**
 * @brief HTTP server initialization
 * @param[in] context Pointer to the HTTP server context
 * @param[in] settings HTTP server specific settings
 * @return Error code
 **/

error_t httpServerInit(HttpServerContext *context, const HttpServerSettings *settings)
{
   error_t error;
   OsTask *task;

   //Debug message
   TRACE_INFO("Initializing HTTP server...\r\n");

   //Ensure the parameters are valid
   if(!context || !settings)
      return ERROR_INVALID_PARAMETER;

   //Clear the HTTP server context
   memset(context, 0, sizeof(HttpServerContext));
   //Save user settings
   context->settings = *settings;

   //Create a semaphore to limit the number of simultaneous connections
   context->semaphore = osSemaphoreCreate(HTTP_SERVER_MAX_CONNECTIONS,
      HTTP_SERVER_MAX_CONNECTIONS);
   //Out of resources?
   if(context->semaphore == OS_INVALID_HANDLE)
      return ERROR_OUT_OF_RESOURCES;

   //Start of exception handling block
   do
   {
      //Open a TCP socket
      context->socket = socketOpen(SOCKET_TYPE_STREAM, SOCKET_PROTOCOL_TCP);
      //Failed to open socket?
      if(!context->socket)
      {
         //Report an error
         error = ERROR_OPEN_FAILED;
         //Exit immediately
         break;
      }

      //Set timeout for blocking functions
      error = socketSetTimeout(context->socket, INFINITE_DELAY);
      //Any error to report?
      if(error) break;

      //Associate the socket with the relevant interface
      error = socketBindToInterface(context->socket, settings->interface);
      //Unable to bind the socket to the desired interface?
      if(error) break;

      //Bind newly created socket to port 80
      error = socketBind(context->socket, &IP_ADDR_ANY, settings->port);
      //Failed to bind socket to port 80?
      if(error) break;

      //Place socket in listening state
      error = socketListen(context->socket);
      //Any failure to report?
      if(error) break;

      //Create the HTTP server task
      task = osTaskCreate("HTTP Listener", httpListenerTask,
         context, HTTP_SERVER_STACK_SIZE, HTTP_SERVER_PRIORITY);

      //Unable to create the task?
      if(task == OS_INVALID_HANDLE)
         error = ERROR_OUT_OF_RESOURCES;

   //End of exception handling block
   } while(0);

   //Did we encounter an error?
   if(error)
   {
      //Free previously allocated resources
      osSemaphoreClose(context->semaphore);
      //Close socket
      socketClose(context->socket);
   }

   //Return status code
   return error;
}


/**
 * @brief Start HTTP server
 * @param[in] context Pointer to the HTTP server context
 * @return Error code
 **/

error_t httpServerStart(HttpServerContext *context)
{
   //Debug message
   TRACE_INFO("Starting HTTP server...\r\n");
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Stop HTTP server
 * @param[in] context Pointer to the HTTP server context
 * @return Error code
 **/

error_t httpServerStop(HttpServerContext *context)
{
   //Debug message
   TRACE_INFO("Stopping HTTP server...\r\n");
   //Not implemented
   return ERROR_NOT_IMPLEMENTED;
}


/**
 * @brief HTTP server listener task
 * @param[in] param Pointer to the HTTP server context
 **/

void httpListenerTask(void *param)
{
   error_t error;
   uint_t counter;
   uint16_t clientPort;
   IpAddr clientIpAddr;
   HttpServerContext *context;
   HttpConnection* connection;
   Socket *socket;
   OsTask *task;

   //Retrieve the HTTP server context
   context = (HttpServerContext *) param;

   //Process incoming connections to the server
   for(counter = 1; ; counter++)
   {
      //Debug message
      TRACE_INFO("Ready to accept a new connection...\r\n");

      //Accept an incoming connection
      socket = socketAccept(context->socket, &clientIpAddr, &clientPort);
      //Failure detected?
      if(!socket) continue;

      //Limit the number of simultaneous connections to the server
      if(!osSemaphoreWait(context->semaphore, 0))
      {
         //Debug message
         TRACE_INFO("Connection #%u refused with client %s port %" PRIu16 "...\r\n",
            counter, ipAddrToString(&clientIpAddr, NULL), clientPort);
         //Close socket
         socketClose(socket);
         //Connection request is refused
         continue;
      }

      //Debug message
      TRACE_INFO("Connection #%u established with client %s port %" PRIu16 "...\r\n",
         counter, ipAddrToString(&clientIpAddr, NULL), clientPort);

      //Allocate resources for the new connection
      connection = osMemAlloc(sizeof(HttpConnection));

      //Successful memory allocation?
      if(connection)
      {
         //Reference to the HTTP server settings
         connection->settings = &context->settings;
         //Reference to the semaphore
         connection->semaphore = context->semaphore;
         //Reference to the new socket
         connection->socket = socket;

         //Set timeout for blocking functions
         error = socketSetTimeout(connection->socket, HTTP_SERVER_TIMEOUT);

         //Check error code
         if(!error)
         {
            //Create a task to service the current connection
            task = osTaskCreate("HTTP Connection", httpConnectionTask,
               connection, HTTP_SERVER_STACK_SIZE, HTTP_SERVER_PRIORITY);

            //Did we encounter an error?
            if(task == OS_INVALID_HANDLE)
            {
               //Close socket
               socketClose(connection->socket);
               //Release semaphore
               osSemaphoreRelease(connection->semaphore);
               //Free previously allocated memory
               osMemFree(connection);
            }
         }
      }
   }
}


/**
 * @brief Task that services requests from an active connection
 * @param[in] param Structure representing an HTTP connection with a client
 **/

void httpConnectionTask(void *param)
{
   error_t error;
   uint_t counter;

   //Point to the structure representing the HTTP connection
   HttpConnection *connection = (HttpConnection *) param;

   //Process incoming requests
   for(counter = 0; counter < HTTP_SERVER_MAX_REQUESTS; counter++)
   {
      //Debug message
      TRACE_INFO("Waiting for request...\r\n");

      //Read the HTTP request header and parse its contents
      error = httpReadHeader(connection);
      //Any error to report?
      if(error)
      {
         //Debug message
         TRACE_INFO("No HTTP request received or parsing error...\r\n");
         break;
      }

      //Debug message
      TRACE_INFO("Sending HTTP response to the client...\r\n");

      //Redirect to the default home page if necessary
      if(!strcasecmp(connection->request.uri, "/"))
         strcpy(connection->request.uri, connection->settings->defaultDocument);

#if (HTTP_SERVER_SSI_SUPPORT == ENABLED)
      //Use server-side scripting to dynamically generate HTML code?
      if(httpCompExtension(connection->request.uri, ".stm") ||
         httpCompExtension(connection->request.uri, ".shtm") ||
         httpCompExtension(connection->request.uri, ".shtml"))
      {
         //SSI processing (Server Side Includes)
         error = ssiExecuteScript(connection, connection->request.uri, 0);
      }
      else
#endif
      {
         //Send the contents of the requested page
         error = httpSendResponse(connection);
      }

      //The requested resource is not available?
      if(error == ERROR_NOT_FOUND)
      {
         //Invoke user-defined callback, if any
         if(connection->settings->uriNotFoundCallback != NULL)
            error = connection->settings->uriNotFoundCallback(connection);
      }

      //Page not found?
      if(error == ERROR_NOT_FOUND)
      {
         //Send an error 404 and keep the connection alive
         httpSendErrorResponse(connection, 404, "The requested page could not be found");
      }
      //Bad request?
      else if(error == ERROR_INVALID_REQUEST)
      {
         //Send an error 400
         httpSendErrorResponse(connection, 400, "The request is badly formed");
         //Close the connection immediately
         break;
      }
      //Internal error?
      else if(error)
      {
         //Close the connection immediately
         break;
      }

      //Check whether the connection is persistent or not
      if(!connection->request.keepAlive || !connection->response.keepAlive)
      {
         //Close the connection immediately
         break;
      }
   }

   //Debug message
   TRACE_INFO("Graceful shutdown...\r\n");
   //Graceful shutdown
   socketShutdown(connection->socket, SOCKET_SD_BOTH);

   //Debug message
   TRACE_INFO("Close socket...\r\n");
   //Close socket
   socketClose(connection->socket);

   //Release semaphore
   osSemaphoreRelease(connection->semaphore);
   //Release connection context
   osMemFree(connection);

   //Kill ourselves
   osTaskDelete(NULL);
}


/**
 * @brief Read HTTP request header and parse its contents
 * @param[in] connection Structure representing an HTTP connection
 * @return Error code
 **/

error_t httpReadHeader(HttpConnection *connection)
{
   error_t error;
   uint_t length;
   char_t *token;
   char_t *p;
   char_t *s;

   //Read the first line of the request
   error = socketReceive(connection->socket, connection->buffer,
      HTTP_SERVER_BUFFER_SIZE - 1, &length, SOCKET_FLAG_BREAK_CRLF);
   //Unable to read any data?
   if(error) return error;

   //Properly terminate the string with a NULL character
   connection->buffer[length] = '\0';
   //Debug message
   TRACE_INFO("%s\r\n", connection->buffer);

   //The Request-Line begins with a method token
   token = strtok_r(connection->buffer, " \r\n", &p);
   //Unable to retrieve the method?
   if(!token) return ERROR_INVALID_REQUEST;

   //GET method?
   if(!strcasecmp(token, "GET"))
      connection->request.method = HTTP_METHOD_GET;
   //HEAD method?
   else if(!strcasecmp(token, "HEAD"))
      connection->request.method = HTTP_METHOD_HEAD;
   //POST method?
   else if(!strcasecmp(token, "POST"))
      connection->request.method = HTTP_METHOD_POST;
   //Unsupported method?
   else
      return ERROR_INVALID_REQUEST;

   //The Request-URI is following the method token
   token = strtok_r(NULL, " \r\n", &p);
   //Unable to retrieve the Request-URI?
   if(!token)
      return ERROR_INVALID_REQUEST;

   //Check whether a query string is present
   s = strchr(token, '?');
   //Query string found?
   if(s != NULL)
   {
      //Calculate the length of the Request-URI
      uint_t n = s - token;

      //Check the length of the field
      if(n > HTTP_SERVER_URI_MAX_LEN)
         return ERROR_INVALID_REQUEST;

      //Save the Request-URI
      strncpy(connection->request.uri, token, n);
      //Properly terminate the string
      connection->request.uri[n] = '\0';

      //Check the length of the query string
      if(strlen(s + 1) > HTTP_SERVER_QUERY_STRING_MAX_LEN)
         return ERROR_INVALID_REQUEST;

      //Save the query string
      strcpy(connection->request.queryString, s + 1);
   }
   else
   {
      //Check the length of the field
      if(strlen(token) > HTTP_SERVER_URI_MAX_LEN)
         return ERROR_INVALID_REQUEST;

      //Save the Request-URI
      strcpy(connection->request.uri, token);
      //No query string
      connection->request.queryString[0] = '\0';
   }

   //The protocol version is following the Request-URI
   token = strtok_r(NULL, " \r\n", &p);

   //HTTP version 0.9?
   if(!token)
   {
      //Save version number
      connection->request.version = HTTP_VERSION_0_9;
      //Persistent connections are not supported
      connection->request.keepAlive = FALSE;
   }
   //HTTP version 1.0?
   else if(!strcasecmp(token, "HTTP/1.0"))
   {
      //Save version number
      connection->request.version = HTTP_VERSION_1_0;
      //By default connections are not persistent
      connection->request.keepAlive = FALSE;
   }
   //HTTP version 1.1?
   else if(!strcasecmp(token, "HTTP/1.1"))
   {
      //Save version number
      connection->request.version = HTTP_VERSION_1_1;
      //HTTP 1.1 makes persistent connections the default
      connection->request.keepAlive = TRUE;
   }
   //HTTP version not supported?
   else
   {
      return ERROR_INVALID_REQUEST;
   }

   //Default value for properties
   connection->request.chunkedEncoding = FALSE;
   connection->request.contentLength = 0;

   //HTTP 0.9 does not support Full-Request
   if(connection->request.version >= HTTP_VERSION_1_0)
   {
      //Local variables
      char_t *separator;
      char_t *property;
      char_t *value;

      //Parse header request fields
      while(1)
      {
         //Read a complete line
         error = socketReceive(connection->socket, connection->buffer,
            HTTP_SERVER_BUFFER_SIZE - 1, &length, SOCKET_FLAG_BREAK_CRLF);

         //Any error to report?
         if(error)
            return error;
         //Unable to read any data?
         if(!length)
            return ERROR_INVALID_REQUEST;

         //Properly terminate the string with a NULL character
         connection->buffer[length] = '\0';

         //The end of the header has been reached?
         if(!strcmp(connection->buffer, "\r\n"))
            break;

         //Check whether a separator is present
         separator = strchr(connection->buffer, ':');
         //Separator found?
         if(separator)
         {
            //Split the line
            *separator = '\0';

            //Get property name and value
            property = strTrimWhitespace(connection->buffer);
            value = strTrimWhitespace(separator + 1);

            //Connection property found?
            if(!strcasecmp(property, "Connection"))
            {
               //Check whether persistent connections are supported or not
               if(!strcasecmp(value, "keep-alive"))
                  connection->request.keepAlive = TRUE;
               else if(!strcasecmp(value, "close"))
                  connection->request.keepAlive = FALSE;
            }
            //Transfer-Encoding property found?
            else if(!strcasecmp(property, "Transfer-Encoding"))
            {
               //Check whether chunked encoding is used
               if(!strcasecmp(value, "chunked"))
                  connection->request.chunkedEncoding = TRUE;
            }
            //Content-Length property found?
            else if(!strcasecmp(property, "Content-Length"))
            {
               //Get the length of the body data
               connection->request.contentLength = atoi(value);
            }
         }
      }
   }

   //Prepare to read the HTTP request body
   if(connection->request.chunkedEncoding)
   {
      connection->request.byteCount = 0;
      connection->request.firstChunk = TRUE;
      connection->request.lastChunk = FALSE;
   }
   else
   {
      connection->request.byteCount = connection->request.contentLength;
   }

   //The request header has been successfully parsed
   return NO_ERROR;
}


/**
 * @brief Send HTTP response header
 * @param[in] connection Structure representing an HTTP connection
 * @return Error code
 **/

error_t httpWriteHeader(HttpConnection *connection)
{
   error_t error;
   uint_t i;
   char_t *p;

   //HTTP version 0.9?
   if(connection->response.version == HTTP_VERSION_0_9)
   {
      //Enforce default parameters
      connection->response.keepAlive = FALSE;
      connection->response.chunkedEncoding = FALSE;
      //The size of the response body is not limited
      connection->response.byteCount = UINT_MAX;
      //We are done since HTTP 0.9 does not support Full-Response format
      return NO_ERROR;
   }

   //When generating dynamic web pages with HTTP 1.0, the only way to
   //signal the end of the body is to close the connection
   if(connection->response.version == HTTP_VERSION_1_0 &&
      connection->response.chunkedEncoding)
   {
      //Make the connection non persistent
      connection->response.keepAlive = FALSE;
      connection->response.chunkedEncoding = FALSE;
      //The size of the response body is not limited
      connection->response.byteCount = UINT_MAX;
   }
   else
   {
      //Limit the size of the response body
      connection->response.byteCount = connection->response.contentLength;
   }

   //Point to the beginning of the buffer
   p = connection->buffer;

   //The first line of a response message is the Status-Line, consisting
   //of the protocol version followed by a numeric status code and its
   //associated textual phrase
   p += sprintf(p, "HTTP/%u.%u %u ", MSB(connection->response.version),
      LSB(connection->response.version), connection->response.statusCode);

   //Retrieve the Reason-Phrase that corresponds to the Status-Code
   for(i = 0; i < arraysize(statusCodeList); i++)
   {
      //Check the status code
      if(statusCodeList[i].value == connection->response.statusCode)
      {
         //Append the textual phrase to the Status-Line
         p += sprintf(p, statusCodeList[i].message);
         //Break the loop and continue processing
         break;
      }
   }

   //Properly terminate the Status-Line
   p += sprintf(p, "\r\n");
   //The Server response-header field contains information about the
   //software used by the origin server to handle the request
   p += sprintf(p, "Server: Oryx Embedded HTTP Server\r\n");

   //Persistent connection?
   if(connection->response.keepAlive)
   {
      //Set Connection property
      p += sprintf(p, "Connection: keep-alive\r\n");

      //Set Keep-Alive property
      p += sprintf(p, "Keep-Alive: timeout=%u, max=%u\r\n",
         HTTP_SERVER_TIMEOUT / 1000, HTTP_SERVER_MAX_REQUESTS);
   }
   else
   {
      //Set Connection property
      p += sprintf(p, "Connection: close\r\n");
   }

   //Prevent the client from using cache?
   if(connection->response.noCache)
   {
      //Set Pragma property
      p += sprintf(p, "Pragma: no-cache\r\n");
      //Set Cache-Control property
      p += sprintf(p, "Cache-Control: no-store, no-cache, must-revalidate\r\n");
      p += sprintf(p, "Cache-Control: post-check=0, pre-check=0\r\n");
   }

   //Content type
   p += sprintf(p, "Content-Type: %s\r\n", connection->response.contentType);

   //Use chunked encoding transfer?
   if(connection->response.chunkedEncoding)
   {
      //Set Transfer-Encoding field
      p += sprintf(p, "Transfer-Encoding: chunked\r\n");
   }
   //Persistent connection?
   else if(connection->response.keepAlive)
   {
      //Set Content-Length field
      p += sprintf(p, "Content-Length: %" PRIuSIZE "\r\n", connection->response.contentLength);
   }

   //Terminate the header with an empty line
   p += sprintf(p, "\r\n");

   //Debug message
   TRACE_DEBUG("HTTP response header:\r\n%s", connection->buffer);

   //Send HTTP response header to the client
   error = socketSend(connection->socket, connection->buffer,
      strlen(connection->buffer), NULL, 0);

   //Return status code
   return error;
}


/**
 * @brief Read data from client request
 * @param[in] connection Structure representing an HTTP connection
 * @param[out] data Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @param[out] received Number of bytes that have been received
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t httpReadStream(HttpConnection *connection, void *data, size_t size, size_t *received, uint_t flags)
{
   error_t error;
   uint_t n;

   //No data has been read yet
   *received = 0;

   //Chunked encoding transfer is used?
   if(connection->request.chunkedEncoding)
   {
      //Point to the output buffer
      char_t *p = data;

      //Read as much data as possible
      while(*received < size)
      {
         //End of HTTP request body?
         if(connection->request.lastChunk)
            return ERROR_END_OF_STREAM;

         //Acquire a new chunk when the current chunk
         //has been completely consumed
         if(connection->request.byteCount == 0)
         {
            //The size of each chunk is sent right before the chunk itself
            error = httpReadChunkSize(connection);
            //Failed to decode the chunk-size field?
            if(error) return error;

            //Any chunk whose size is zero terminates the data transfer
            if(!connection->request.byteCount)
            {
               //The user must be satisfied with data already on hand
               return (*received > 0) ? NO_ERROR : ERROR_END_OF_STREAM;
            }
         }

         //Limit the number of bytes to read at a time
         n = min(size - *received, connection->request.byteCount);

         //Read data
         error = socketReceive(connection->socket, p, n, &n, flags);
         //Any error to report?
         if(error) return error;

         //Total number of data that have been read
         *received += n;
         //Remaining data still available in the current chunk
         connection->request.byteCount -= n;

         //The HTTP_FLAG_BREAK_CHAR flag causes the function to stop reading
         //data as soon as the specified break character is encountered
         if(flags & HTTP_FLAG_BREAK_CRLF)
         {
            //Check whether a break character has been received
            if(p[n - 1] == LSB(flags)) break;
         }
         //The HTTP_FLAG_WAIT_ALL flag causes the function to return
         //only when the requested number of bytes have been read
         else if(!(flags & HTTP_FLAG_WAIT_ALL))
         {
            break;
         }

         //Advance data pointer
         p += n;
      }
   }
   //Default encoding?
   else
   {
      //Return immediately if the end of the request body has been reached
      if(!connection->request.byteCount)
         return ERROR_END_OF_STREAM;

      //Limit the number of bytes to read
      n = min(size, connection->request.byteCount);

      //Read data
      error = socketReceive(connection->socket, data, n, received, flags);
      //Any error to report
      if(error) return error;

      //Decrement the count of remaining bytes to read
      connection->request.byteCount -= *received;
   }

   //Successful read operation
   return NO_ERROR;
}


/**
 * @brief Read chunk-size field from the input stream
 * @param[in] connection Structure representing an HTTP connection
 **/

error_t httpReadChunkSize(HttpConnection *connection)
{
   error_t error;
   uint_t n;
   char_t *end;
   char_t s[8];

   //First chunk to be received?
   if(connection->request.firstChunk)
   {
      //Clear the flag
      connection->request.firstChunk = FALSE;
   }
   else
   {
      //Read the CRLF that follows the previous chunk-data field
      error = socketReceive(connection->socket,
         s, sizeof(s) - 1, &n, SOCKET_FLAG_BREAK_CRLF);
      //Any error to report?
      if(error) return error;

      //Properly terminate the string with a NULL character
      s[n] = '\0';

      //The chunk data must be terminated by CRLF
      if(strcmp(s, "\r\n"))
         return ERROR_WRONG_ENCODING;
   }

   //Read the chunk-size field
   error = socketReceive(connection->socket,
      s, sizeof(s) - 1, &n, SOCKET_FLAG_BREAK_CRLF);
   //Any error to report?
   if(error) return error;

   //Properly terminate the string with a NULL character
   s[n] = '\0';
   //Remove extra whitespaces
   strRemoveTrailingSpace(s);

   //Retrieve the size of the chunk
   connection->request.byteCount = strtoul(s, &end, 16);

   //No valid conversion could be performed?
   if(end == s || *end != '\0')
      return ERROR_WRONG_ENCODING;

   //Any chunk whose size is zero terminates the data transfer
   if(!connection->request.byteCount)
   {
      //The end of the HTTP request body has been reached
      connection->request.lastChunk = TRUE;

      //Skip the trailer
      while(1)
      {
         //Read a complete line
         error = socketReceive(connection->socket,
            s, sizeof(s) - 1, &n, SOCKET_FLAG_BREAK_CRLF);
         //Unable to read any data?
         if(error) return error;

         //Properly terminate the string with a NULL character
         s[n] = '\0';

         //The trailer is terminated by an empty line
         if(!strcmp(s, "\r\n"))
            break;
      }
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Write data to the client
 * @param[in] connection Structure representing an HTTP connection
 * @param[in] data Buffer containing the data to be transmitted
 * @param[in] length Number of bytes to be transmitted
 * @return Error code
 **/

error_t httpWriteStream(HttpConnection *connection, const void *data, size_t length)
{
   error_t error;
   uint_t n;

   //Use chunked encoding transfer?
   if(connection->response.chunkedEncoding)
   {
      //Any data to send?
      if(length > 0)
      {
         char_t s[8];

         //The chunk-size field is a string of hex digits
         //indicating the size of the chunk
         n = sprintf(s, "%X\r\n", length);

         //Send the chunk-size field
         error = socketSend(connection->socket, s, n, NULL, 0);
         //Failed to send data?
         if(error) return error;

         //Send the chunk-data
         error = socketSend(connection->socket, data, length, NULL, 0);
         //Failed to send data?
         if(error) return error;

         //Terminate the chunk-data by CRLF
         error = socketSend(connection->socket, "\r\n", 2, NULL, 0);
      }
      else
      {
         //Any chunk whose size is zero may terminate the data
         //transfer and must be discarded
         error = NO_ERROR;
      }
   }
   //Default encoding?
   else
   {
      //The length of the body shall not exceed the value
      //specified in the Content-Length field
      length = min(length, connection->response.byteCount);

      //Send user data
      error = socketSend(connection->socket, data, length, NULL, 0);

      //Decrement the count of remaining bytes to be transferred
      connection->response.byteCount -= length;
   }

   //Return status code
   return error;
}


/**
 * @brief Close output stream
 * @param[in] connection Structure representing an HTTP connection
 * @return Error code
 **/

error_t httpCloseStream(HttpConnection *connection)
{
   error_t error;

   //Use chunked encoding transfer?
   if(connection->response.chunkedEncoding)
   {
      //The chunked encoding is ended by any chunk whose size is zero
      error = socketSend(connection->socket, "0\r\n\r\n", 5, NULL, 0);
   }
   else
   {
      //Chunked encoding is not used...
      error = NO_ERROR;
   }

   //Return status code
   return error;
}


/**
 * @brief Send HTTP response
 * @param[in] connection Structure representing an HTTP connection
 * @return Error code
 **/

error_t httpSendResponse(HttpConnection *connection)
{
#if (HTTP_SERVER_FS_SUPPORT == ENABLED)
   error_t error;
   uint32_t length;
   size_t n;
   FsFile *file;

   //Get absolute path to the specified URI
   httpGetAbsolutePath(connection, connection->request.uri, connection->buffer);

   //Retrieve the size of the specified file
   error = fsFileGetSize(connection->buffer, &length);
   //The specified URI cannot be found?
   if(error) return ERROR_NOT_FOUND;

   //Open the file for reading
   file = fsFileOpen(connection->buffer, FS_FILE_MODE_READ);
   //Failed to open the file?
   if(!file) return ERROR_NOT_FOUND;
#else
   error_t error;
   size_t length;
   uint8_t *data;

   //Get absolute path to the specified URI
   httpGetAbsolutePath(connection, connection->request.uri, connection->buffer);

   //Get the resource data associated with the URI
   error = resGetData(connection->buffer, &data, &length);
   //The specified URI cannot be found?
   if(error) return error;
#endif

   //Format HTTP response header
   connection->response.version = connection->request.version;
   connection->response.statusCode = 200;
   connection->response.keepAlive = connection->request.keepAlive;
   connection->response.noCache = FALSE;
   connection->response.contentType = mimeGetType(connection->request.uri);
   connection->response.chunkedEncoding = FALSE;
   connection->response.contentLength = length;

   //Send the header to the client
   error = httpWriteHeader(connection);
   //Any error to report?
   if(error)
   {
#if (HTTP_SERVER_FS_SUPPORT == ENABLED)
      //Close the file
      fsFileClose(file);
#endif
      //Return status code
      return error;
   }

#if (HTTP_SERVER_FS_SUPPORT == ENABLED)
   //Send response body
   while(length > 0)
   {
      //Limit the number of bytes to read at a time
      n = min(length, HTTP_SERVER_BUFFER_SIZE);

      //Read data from the specified file
      error = fsFileRead(file, connection->buffer, n, &n);
      //End of input stream?
      if(error) break;

      //Send data to the client
      error = httpWriteStream(connection, connection->buffer, n);
      //Any error to report?
      if(error) break;

      //Decrement the count of remaining bytes to be transferred
      length -= n;
   }

   //Close the file
   fsFileClose(file);

   //Successful file transfer?
   if(length == 0 && error == ERROR_END_OF_STREAM)
   {
      //Properly close the output stream
      error = httpCloseStream(connection);
   }
#else
   //Send response body
   error = httpWriteStream(connection, data, length);
   //Any error to report?
   if(error) return error;

   //Properly close output stream
   error = httpCloseStream(connection);
#endif

   //Return status code
   return error;
}


/**
 * @brief Send error response to the client
 * @param[in] connection Structure representing an HTTP connection
 * @param[in] statusCode HTTP status code
 * @param[in] message User message
 * @return Error code
 **/

error_t httpSendErrorResponse(HttpConnection *connection, uint_t statusCode, const char_t *message)
{
   error_t error;
   size_t length;

   //HTML response template
   static const char_t template[] =
      "<!doctype html>\r\n"
      "<html>\r\n"
      "<head><title>Error %03d</title></head>\r\n"
      "<body>\r\n"
      "<h2>Error %03d</h2>\r\n"
      "<p>%s</p>\r\n"
      "</body>\r\n"
      "</html>\r\n";

   //Compute the length of the response
   length = strlen(template) + strlen(message) - 4;

   //Format HTTP response header
   connection->response.version = connection->request.version;
   connection->response.statusCode = statusCode;
   connection->response.keepAlive = connection->request.keepAlive;
   connection->response.noCache = FALSE;
   connection->response.contentType = mimeGetType(".htm");
   connection->response.chunkedEncoding = FALSE;
   connection->response.contentLength = length;

   //Send the header to the client
   error = httpWriteHeader(connection);
   //Any error to report?
   if(error) return error;

   //Format HTML response
   sprintf(connection->buffer, template, statusCode, statusCode, message);

   //Send response body
   error = httpWriteStream(connection, connection->buffer, length);
   //Any error to report?
   if(error) return error;

   //Properly close output stream
   error = httpCloseStream(connection);
   //Return status code
   return error;
}


/**
 * @brief Get absolute path to a resource
 * @param[in] connection Structure representing an HTTP connection
 * @param[in] relative String containing the relative path to the resource
 * @param[out] absolute Resulting string containing the absolute path
 **/

void httpGetAbsolutePath(HttpConnection *connection, const char_t *relative, char_t *absolute)
{
   uint_t n;

   //Copy the root directory
   strcpy(absolute, connection->settings->rootDirectory);

   //Remove trailing slash characters from the end of the root directory
   for(n = strlen(absolute); n > 0; n--)
   {
      //Check current character
      if(absolute[n - 1] != '/' && absolute[n - 1] != '\\')
         break;
      //Remove unnecessary characters...
      absolute[n - 1] = '\0';
   }

   //Trim slash characters at the beginning of the relative path
   while(*relative == '/' || *relative == '\\') relative++;

   //Append a single slash separator
   strcat(absolute, "/");
   //Append the relative path
   strcat(absolute, relative);
}


/**
 * @brief Compare filename extension
 * @param[in] filename Filename whose extension is to be checked
 * @param[in] extension String defining the extension to be checked
 * @return TRUE is the filename matches the given extension, else FALSE
 **/

bool_t httpCompExtension(const char_t *filename, const char_t *extension)
{
   uint_t n;
   uint_t m;

   //Get the length of the specified filename
   n = strlen(filename);
   //Get the length of the extension
   m = strlen(extension);

   //Check the length of the filename
   if(n < m)
      return FALSE;

   //Compare extensions
   if(!strncasecmp(filename + n - m, extension, m))
      return TRUE;
   else
      return FALSE;
}

#endif
