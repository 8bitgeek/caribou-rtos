/**
 * @file http_server.h
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
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

#ifndef _HTTP_SERVER_H
#define _HTTP_SERVER_H

//Dependencies
#include "os_port.h"
#include "socket.h"

//Enable HTTP server support
#ifndef HTTP_SERVER_SUPPORT
   #define HTTP_SERVER_SUPPORT ENABLED
#elif (HTTP_SERVER_SUPPORT != ENABLED && HTTP_SERVER_SUPPORT != DISABLED)
   #error HTTP_SERVER_SUPPORT parameter is not valid
#endif

//File system support
#ifndef HTTP_SERVER_FS_SUPPORT
   #define HTTP_SERVER_FS_SUPPORT DISABLED
#elif (HTTP_SERVER_FS_SUPPORT != ENABLED && HTTP_SERVER_FS_SUPPORT != DISABLED)
   #error HTTP_SERVER_FS_SUPPORT parameter is not valid
#endif

//Server Side Includes support
#ifndef HTTP_SERVER_SSI_SUPPORT
   #define HTTP_SERVER_SSI_SUPPORT DISABLED
#elif (HTTP_SERVER_SSI_SUPPORT != ENABLED && HTTP_SERVER_SSI_SUPPORT != DISABLED)
   #error HTTP_SERVER_SSI_SUPPORT parameter is not valid
#endif

//Stack size required to run the HTTP server
#ifndef HTTP_SERVER_STACK_SIZE
   #define HTTP_SERVER_STACK_SIZE 650
#elif (HTTP_SERVER_STACK_SIZE < 1)
   #error HTTP_SERVER_STACK_SIZE parameter is not valid
#endif

//Priority at which the HTTP server should run
#ifndef HTTP_SERVER_PRIORITY
   #define HTTP_SERVER_PRIORITY 1
#elif (HTTP_SERVER_PRIORITY < 0)
   #error HTTP_SERVER_PRIORITY parameter is not valid
#endif

//Maximum time the server will wait for a subsequent
//request before closing the connection
#ifndef HTTP_SERVER_TIMEOUT
   #define HTTP_SERVER_TIMEOUT 10000
#elif (HTTP_SERVER_TIMEOUT < 1000)
   #error HTTP_SERVER_TIMEOUT parameter is not valid
#endif

//Maximum number of simultaneous connections
#ifndef HTTP_SERVER_MAX_CONNECTIONS
   #define HTTP_SERVER_MAX_CONNECTIONS 8
#elif (HTTP_SERVER_MAX_CONNECTIONS < 1)
   #error HTTP_SERVER_MAX_CONNECTIONS parameter is not valid
#endif

//Maximum number of requests per connection
#ifndef HTTP_SERVER_MAX_REQUESTS
   #define HTTP_SERVER_MAX_REQUESTS 1000
#elif (HTTP_SERVER_MAX_REQUESTS < 1)
   #error HTTP_SERVER_MAX_REQUESTS parameter is not valid
#endif

//Size of buffer used for input/output operations
#ifndef HTTP_SERVER_BUFFER_SIZE
   #define HTTP_SERVER_BUFFER_SIZE 1024
#elif (HTTP_SERVER_BUFFER_SIZE < 128)
   #error HTTP_SERVER_BUFFER_SIZE parameter is not valid
#endif

//Maximum size of root directory
#ifndef HTTP_SERVER_ROOT_DIR_MAX_LEN
   #define HTTP_SERVER_ROOT_DIR_MAX_LEN 31
#elif (HTTP_SERVER_ROOT_DIR_MAX_LEN < 7)
   #error HTTP_SERVER_ROOT_DIR_MAX_LEN parameter is not valid
#endif

//Maximum size of default index file
#ifndef HTTP_SERVER_DEFAULT_DOC_MAX_LEN
   #define HTTP_SERVER_DEFAULT_DOC_MAX_LEN 31
#elif (HTTP_SERVER_DEFAULT_DOC_MAX_LEN < 7)
   #error HTTP_SERVER_DEFAULT_DOC_MAX_LEN parameter is not valid
#endif

//Maximum length of URI
#ifndef HTTP_SERVER_URI_MAX_LEN
   #define HTTP_SERVER_URI_MAX_LEN 255
#elif (HTTP_SERVER_URI_MAX_LEN < 31)
   #error HTTP_SERVER_URI_MAX_LEN parameter is not valid
#endif

//Maximum length of query strings
#ifndef HTTP_SERVER_QUERY_STRING_MAX_LEN
   #define HTTP_SERVER_QUERY_STRING_MAX_LEN 255
#elif (HTTP_SERVER_QUERY_STRING_MAX_LEN < 7)
   #error HTTP_SERVER_QUERY_STRING_MAX_LEN parameter is not valid
#endif

//Maximum length of CGI parameters
#ifndef HTTP_SERVER_CGI_PARAM_MAX_LEN
   #define HTTP_SERVER_CGI_PARAM_MAX_LEN 31
#elif (HTTP_SERVER_CGI_PARAM_MAX_LEN < 7)
   #error HTTP_SERVER_CGI_PARAM_MAX_LEN parameter is not valid
#endif

//Maximum recursion limit
#ifndef HTTP_SERVER_SSI_MAX_RECURSION
   #define HTTP_SERVER_SSI_MAX_RECURSION 3
#elif (HTTP_SERVER_SSI_MAX_RECURSION < 1 || HTTP_SERVER_SSI_MAX_RECURSION > 8)
   #error HTTP_SERVER_SSI_MAX_RECURSION parameter is not valid
#endif

//HTTP port number
#define HTTP_PORT 80
//HTTPS port number (HTTP over SSL/TLS)
#define HTTPS_PORT 443

//Forward declaration of HttpConnection structure
struct _HttpConnection;
typedef struct _HttpConnection HttpConnection;


/**
 * @brief HTTP version numbers
 **/

typedef enum
{
   HTTP_VERSION_0_9 = 0x0009,
   HTTP_VERSION_1_0 = 0x0100,
   HTTP_VERSION_1_1 = 0x0101
} HttpVersion;


/**
 * @brief HTTP method list
 *
 * The Method token indicates the method to be performed
 * on the resource identified by the Request-URI
 *
 **/

typedef enum
{
   HTTP_METHOD_OPTIONS,
   HTTP_METHOD_GET,
   HTTP_METHOD_HEAD,
   HTTP_METHOD_POST,
   HTTP_METHOD_PUT,
   HTTP_METHOD_DELETE,
   HTTP_METHOD_TRACE,
   HTTP_METHOD_CONNECT,
} HttpMethod;


/**
 * @brief Flags used by I/O functions
 **/

typedef enum
{
   HTTP_FLAG_WAIT_ALL   = 0x0800,
   HTTP_FLAG_BREAK_CHAR = 0x1000,
   HTTP_FLAG_BREAK_CRLF = 0x100A,
   HTTP_FLAG_WAIT_ACK   = 0x2000
} HttpFlags;


//The HTTP_FLAG_BREAK macro causes the httpReadStream() function to stop
//reading data whenever the specified break character is encountered
#define HTTP_FLAG_BREAK(c) (HTTP_FLAG_BREAK_CHAR | LSB(c))


/**
 * @brief CGI callback function
 **/

typedef error_t (*CgiCallback)(HttpConnection *connection, const char_t *param);


/**
 * @brief URI not found callback function
 **/

typedef error_t (*UriNotFoundCallback)(HttpConnection *connection);


/**
 * @brief HTTP status code
 **/

typedef struct
{
   uint_t value;
   const char_t message[28];
} HttpStatusCodeDesc;



/**
 * @brief HTTP request
 **/

typedef struct
{
   uint_t version;                                           ///<HTTP version number
   HttpMethod method;                                        ///<HTTP method
   char_t uri[HTTP_SERVER_URI_MAX_LEN + 1];                  ///<Resource identifier
   char_t queryString[HTTP_SERVER_QUERY_STRING_MAX_LEN + 1]; ///<Query string
   bool_t keepAlive;
   bool_t chunkedEncoding;
   size_t contentLength;
   size_t byteCount;
   bool_t firstChunk;
   bool_t lastChunk;
} HttpRequest;


/**
 * @brief HTTP response
 **/

typedef struct
{
   uint_t version;
   uint_t statusCode;
   bool_t keepAlive;
   bool_t noCache;
   const char_t *contentType;
   bool_t chunkedEncoding;
   size_t contentLength;
   size_t byteCount;
} HttpResponse;



/**
 * @brief HTTP server settings
 **/

typedef struct
{
   NetInterface *interface;                                     ///<Underlying network interface
   uint16_t port;                                               ///<HTTP server port number
   char_t rootDirectory[HTTP_SERVER_ROOT_DIR_MAX_LEN + 1];      ///<Web root directory
   char_t defaultDocument[HTTP_SERVER_DEFAULT_DOC_MAX_LEN + 1]; ///<Default home page
   CgiCallback cgiCallback;                                     ///<CGI callback function
   UriNotFoundCallback uriNotFoundCallback;                     ///<URI not found callback function
} HttpServerSettings;


/**
 * @brief HTTP server context
 **/

typedef struct
{
   HttpServerSettings settings;  ///<User settings
   OsSemaphore *semaphore;       ///<Semaphore limiting the number of connections
   Socket *socket;               ///<Listening socket
} HttpServerContext;


/**
 * @brief HTTP connection
 *
 * An HttpConnection instance represents one
 * transaction with an HTTP client
 *
 **/

typedef struct _HttpConnection
{
   HttpServerSettings *settings;                       ///<HTTP server settings
   OsSemaphore *semaphore;                             ///<Semaphore limiting the number of connections
   Socket *socket;                                     ///<Socket
   HttpRequest request;                                ///<Incoming HTTP request header
   HttpResponse response;                              ///<HTTP response header
   char_t cgiParam[HTTP_SERVER_CGI_PARAM_MAX_LEN + 1]; ///<CGI parameter
   char_t buffer[HTTP_SERVER_BUFFER_SIZE];             ///<Memory buffer for input/output operations
} HttpConnection;


//HTTP server related functions
void httpServerGetDefaultSettings(HttpServerSettings *settings);
error_t httpServerInit(HttpServerContext *context, const HttpServerSettings *settings);
error_t httpServerStart(HttpServerContext *context);
error_t httpServerStop(HttpServerContext *context);

void httpListenerTask(void *param);
void httpConnectionTask(void *param);

error_t httpReadHeader(HttpConnection *connection);
error_t httpWriteHeader(HttpConnection *connection);

error_t httpReadStream(HttpConnection *connection, void *data, size_t size, size_t *received, uint_t flags);
error_t httpWriteStream(HttpConnection *connection, const void *data, size_t length);
error_t httpReadChunkSize(HttpConnection *connection);
error_t httpCloseStream(HttpConnection *connection);

error_t httpSendResponse(HttpConnection *connection);
error_t httpSendErrorResponse(HttpConnection *connection, uint_t statusCode, const char_t *message);

void httpGetAbsolutePath(HttpConnection *connection, const char_t *relative, char_t *absolute);
bool_t httpCompExtension(const char_t *filename, const char_t *extension);

#endif
