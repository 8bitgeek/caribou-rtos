/**
 * @file ftp_client.c
 * @brief FTP client (File Transfer Protocol)
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
 * File Transfer Protocol (FTP) is a standard network protocol used to
 * transfer files from one host to another host over a TCP-based network.
 * Refer to the following RFCs for complete details:
 * - RFC 959: File Transfer Protocol (FTP)
 * - RFC 2428: FTP Extensions for IPv6 and NATs
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL FTP_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include <ctype.h>
#include "ftp_client.h"
#include "str.h"
#include "error.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (FTP_CLIENT_SUPPORT == ENABLED)


/**
 * @brief Establish a connection with the specified FTP server
 * @param[in] context Pointer to the FTP client context
 * @param[in] interface Underlying network interface (optional parameter)
 * @param[in] serverAddr IP address of the FTP server
 * @param[in] serverPort Port number
 * @param[in] flags Connection options
 * @return Error code
 **/

error_t ftpConnect(FtpClientContext *context, NetInterface *interface,
   IpAddr *serverAddr, uint16_t serverPort, uint_t flags)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Clear context
   memset(context, 0, sizeof(FtpClientContext));

   //Underlying network interface
   context->interface = interface;
   //Save the IP address of the FTP server
   context->serverAddr = *serverAddr;

   //Use passive mode?
   if(flags & FTP_PASSIVE_MODE)
      context->passiveMode = TRUE;

   //Open control socket
   context->controlSocket = socketOpen(SOCKET_TYPE_STREAM, SOCKET_PROTOCOL_TCP);
   //Failed to open socket?
   if(!context->controlSocket)
      return ERROR_OPEN_FAILED;

   //Start of exception handling block
   do
   {
      //Bind the socket to a particular network interface?
      if(context->interface != NULL)
      {
         //Associate the socket with the relevant interface
         error = socketBindToInterface(context->controlSocket, context->interface);
         //Any error to report?
         if(error) break;
      }

      //Set timeout for blocking operations
      error = socketSetTimeout(context->controlSocket, FTP_CLIENT_DEFAULT_TIMEOUT);
      //Any error to report?
      if(error) break;

      //Specify the size of the send buffer
      error = socketSetTxBufferSize(context->controlSocket,
         FTP_CLIENT_SOCKET_MIN_TX_BUFFER_SIZE);
      //Any error to report?
      if(error) break;

      //Specify the size of the receive buffer
      error = socketSetRxBufferSize(context->controlSocket,
         FTP_CLIENT_SOCKET_MIN_RX_BUFFER_SIZE);
      //Any error to report?
      if(error) break;

      //Connect to the FTP server
      error = socketConnect(context->controlSocket, serverAddr, serverPort);
      //Connection to server failed?
      if(error) break;

      //Wait for the connection greeting reply
      error = ftpSendCommand(context, NULL, &replyCode);
      //Any communication error to report?
      if(error) break;

      //Check FTP response code
      if(!FTP_REPLY_CODE_2YZ(replyCode))
         error = ERROR_UNEXPECTED_RESPONSE;

      //End of exception handling block
   } while(0);

   //Any error to report?
   if(error)
   {
      //Clean up side effects
      socketClose(context->controlSocket);
      context->controlSocket = NULL;
   }

   //Return status code
   return error;
}


/**
 * @brief Login to the FTP server using the provided username and password
 * @param[in] context Pointer to the FTP client context
 * @param[in] username The username to login under
 * @param[in] password The password to use
 * @param[in] account Account name
 * @return Error code
 **/

error_t ftpLogin(FtpClientContext *context, const char_t *username,
   const char_t *password, const char_t *account)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the USER command
   sprintf(context->buffer, "USER %s\r\n", username);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(FTP_REPLY_CODE_2YZ(replyCode))
      return NO_ERROR;
   else if(!FTP_REPLY_CODE_3YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Format the PASS command
   sprintf(context->buffer, "PASS %s\r\n", password);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(FTP_REPLY_CODE_2YZ(replyCode))
      return NO_ERROR;
   else if(!FTP_REPLY_CODE_3YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Format the ACCT command
   sprintf(context->buffer, "ACCT %s\r\n", account);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set the port to be used in data connection
 * @param[in] context Pointer to the FTP client context
 * @param[in] ipAddr Host address
 * @param[in] port Port number
 * @return Error code
 **/

error_t ftpSetPort(FtpClientContext *context, const IpAddr *ipAddr, uint16_t port)
{
   error_t error;
   uint_t replyCode;
   char_t *p;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 FTP client?
   if(ipAddr->length == sizeof(Ipv4Addr))
   {
      //Format the PORT command
      strcpy(context->buffer, "PORT ");

      //Append host address
      ipv4AddrToString(ipAddr->ipv4Addr, context->buffer + 5);

      //Parse the resulting string
      for(p = context->buffer; *p != '\0'; p++)
      {
         //Change dots to commas
         if(*p == '.') *p = ',';
      }

      //Append port number
      sprintf(p, ",%" PRIu8 ",%" PRIu8 "\r\n", MSB(port), LSB(port));
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 FTP client?
   if(ipAddr->length == sizeof(Ipv6Addr))
   {
      //Format the EPRT command
      strcpy(context->buffer, "EPRT |2|");

      //Append host address
      ipv6AddrToString(&ipAddr->ipv6Addr, context->buffer + 8);

      //Point to the end of the resulting string
      p = context->buffer + strlen(context->buffer);
      //Append port number
      sprintf(p, "|%" PRIu16 "|\r\n", port);
   }
   else
#endif
   //Invalid IP address?
   {
      //Report an error
      return ERROR_INVALID_ADDRESS;
   }

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Enter passive mode
 * @param[in] context Pointer to the FTP client context
 * @param[out] port The port number the server is listening on
 * @return Error code
 **/

error_t ftpSetPassiveMode(FtpClientContext *context, uint16_t *port)
{
   error_t error;
   uint_t replyCode;
   char_t delimiter;
   char_t *p;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

#if (IPV4_SUPPORT == ENABLED)
   //IPv4 FTP server?
   if(context->serverAddr.length == sizeof(Ipv4Addr))
   {
      //Send the command to the server
      error = ftpSendCommand(context, "PASV\r\n", &replyCode);
      //Any error to report?
      if(error) return error;

      //Check FTP response code
      if(!FTP_REPLY_CODE_2YZ(replyCode))
         return ERROR_UNEXPECTED_RESPONSE;

      //Delimiter character
      delimiter = ',';

      //Retrieve the low byte of the port number
      p = strrchr(context->buffer, delimiter);
      //Failed to parse the response?
      if(!p) return ERROR_INVALID_SYNTAX;

      //Convert the resulting string
      *port = atoi(p + 1);
      //Split the string
      *p = '\0';

      //Retrieve the high byte of the port number
      p = strrchr(context->buffer, delimiter);
      //Failed to parse the response?
      if(!p) return ERROR_INVALID_SYNTAX;

      //Convert the resulting string
      *port |= atoi(p + 1) << 8;
   }
   else
#endif
#if (IPV6_SUPPORT == ENABLED)
   //IPv6 FTP server?
   if(context->serverAddr.length == sizeof(Ipv6Addr))
   {
      //Send the command to the server
      error = ftpSendCommand(context, "EPSV\r\n", &replyCode);
      //Any error to report?
      if(error) return error;

      //Check FTP response code
      if(!FTP_REPLY_CODE_2YZ(replyCode))
         return ERROR_UNEXPECTED_RESPONSE;

      //Search for the opening parenthesis
      p = strrchr(context->buffer, '(');
      //Failed to parse the response?
      if(!p || p[1] == '\0') return ERROR_INVALID_SYNTAX;

      //Retrieve the delimiter character
      delimiter = p[1];

      //Search for the last delimiter character
      p = strrchr(context->buffer, delimiter);
      //Failed to parse the response?
      if(!p) return ERROR_INVALID_SYNTAX;

      //Split the string
      *p = '\0';

      //Search for the last but one delimiter character
      p = strrchr(context->buffer, delimiter);
      //Failed to parse the response?
      if(!p) return ERROR_INVALID_SYNTAX;

      //Convert the resulting string
      *port = atoi(p + 1);
   }
   else
#endif
   //Invalid IP address?
   {
      //Report an error
      return ERROR_INVALID_ADDRESS;
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set representation type
 * @param[in] context Pointer to the FTP client context
 * @param[in] type Single character identifying the desired type
 * @return Error code
 **/

error_t ftpSetType(FtpClientContext *context, char_t type)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the TYPE command
   sprintf(context->buffer, "TYPE %c\r\n", type);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Get the working directory from the FTP server
 * @param[in] context Pointer to the FTP client context
 * @param[out] path Output buffer where to store the current directory
 * @param[in] size Size of the output buffer
 * @return Error code
 **/

error_t ftpGetWorkingDir(FtpClientContext *context, char_t *path, size_t size)
{
   error_t error;
   size_t length;
   uint_t replyCode;
   char_t *p;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Check parameters
   if(path == NULL || size == 0)
      return ERROR_INVALID_PARAMETER;

   //Send the command to the server
   error = ftpSendCommand(context, "PWD\r\n", &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Search for the last double quote
   p = strrchr(context->buffer, '\"');
   //Failed to parse the response?
   if(!p) return ERROR_INVALID_SYNTAX;

   //Split the string
   *p = '\0';

   //Search for the first double quote
   p = strchr(context->buffer, '\"');
   //Failed to parse the response?
   if(!p) return ERROR_INVALID_SYNTAX;

   //Retrieve the length of the working directory
   length = strlen(p + 1);
   //Limit the number of characters to copy
   length = min(length, size - 1);

   //Copy the string
   strncpy(path, p + 1, length);
   //Properly terminate the string with a NULL character
   path[length] = '\0';

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Change the current working directory of the FTP session
 * @param[in] context Pointer to the FTP client context
 * @param[in] path The new current working directory
 * @return Error code
 **/

error_t ftpChangeWorkingDir(FtpClientContext *context, const char_t *path)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the CWD command
   sprintf(context->buffer, "CWD %s\r\n", path);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Change the current working directory to the parent directory
 * @param[in] context Pointer to the FTP client context
 * @return Error code
 **/

error_t ftpChangeToParentDir(FtpClientContext *context)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Send the command to the server
   error = ftpSendCommand(context, "CDUP\r\n", &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Create a new directory
 * @param[in] context Pointer to the FTP client context
 * @param[in] path The name of the new directory
 * @return Error code
 **/

error_t ftpMakeDir(FtpClientContext *context, const char_t *path)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the MKD command
   sprintf(context->buffer, "MKD %s\r\n", path);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Remove a directory on the FTP server
 * @param[in] context Pointer to the FTP client context
 * @param[in] path Path to the directory to be removed
 * @return Error code
 **/

error_t ftpRemoveDir(FtpClientContext *context, const char_t *path)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the RMD command
   sprintf(context->buffer, "RMD %s\r\n", path);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Open a file for reading, writing, or appending
 * @param[in] context Pointer to the FTP client context
 * @param[in] path Path to the file to be be opened
 * @param[in] flags Access mode
 * @return Error code
 **/

error_t ftpOpenFile(FtpClientContext *context, const char_t *path, uint_t flags)
{
   error_t error;
   uint_t replyCode;
   IpAddr ipAddr;
   uint16_t port;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Open data socket
   context->dataSocket = socketOpen(SOCKET_TYPE_STREAM, SOCKET_PROTOCOL_TCP);
   //Failed to open socket?
   if(!context->dataSocket)
      return ERROR_OPEN_FAILED;

   //Start of exception handling block
   do
   {
      //Bind the socket to a particular network interface?
      if(context->interface != NULL)
      {
         //Associate the socket with the relevant interface
         error = socketBindToInterface(context->dataSocket, context->interface);
         //Any error to report?
         if(error) break;
      }

      //Set timeout for blocking operations
      error = socketSetTimeout(context->dataSocket, FTP_CLIENT_DEFAULT_TIMEOUT);
      //Any error to report?
      if(error) break;

      //Check data transfer direction
      if(flags & (FTP_FOR_WRITING | FTP_FOR_APPENDING))
      {
         //Maximize transmission throughput by using a large buffer
         error = socketSetTxBufferSize(context->dataSocket,
            FTP_CLIENT_SOCKET_MAX_TX_BUFFER_SIZE);
         //Any error to report?
         if(error) break;

         //Use a small buffer for the reception path
         error = socketSetRxBufferSize(context->dataSocket,
            FTP_CLIENT_SOCKET_MIN_RX_BUFFER_SIZE);
         //Any error to report?
         if(error) break;
      }
      else
      {
         //Use a small buffer for the transmission path
         error = socketSetTxBufferSize(context->dataSocket,
            FTP_CLIENT_SOCKET_MIN_TX_BUFFER_SIZE);
         //Any error to report?
         if(error) break;

         //Maximize reception throughput by using a large buffer
         error = socketSetRxBufferSize(context->dataSocket,
            FTP_CLIENT_SOCKET_MAX_RX_BUFFER_SIZE);
         //Any error to report?
         if(error) break;
      }

      //Set representation type
      if(flags & FTP_TEXT_TYPE)
      {
         //Use ASCII type
         error = ftpSetType(context, 'A');
         //Any error to report?
         if(error) break;
      }
      else
      {
         //Use image type
         error = ftpSetType(context, 'I');
         //Any error to report?
         if(error) break;
      }

      //Check transfer mode
      if(!context->passiveMode)
      {
         //Place the data socket in the listening state
         error = socketListen(context->dataSocket);
         //Any error to report?
         if(error) break;

         //Retrieve local IP address
         error = socketGetLocalAddr(context->controlSocket, &ipAddr, NULL);
         //Any error to report?
         if(error) break;

         //Retrieve local port number
         error = socketGetLocalAddr(context->dataSocket, NULL, &port);
         //Any error to report?
         if(error) break;

         //Set the port to be used in data connection
         error = ftpSetPort(context, &ipAddr, port);
         //Any error to report?
         if(error) break;
      }
      else
      {
         //Enter passive mode
         error = ftpSetPassiveMode(context, &port);
         //Any error to report?
         if(error) break;

         //Establish data connection
         error = socketConnect(context->dataSocket, &context->serverAddr, port);
         //Connection to server failed?
         if(error) break;
      }

      //Format the command
      if(flags & FTP_FOR_WRITING)
         sprintf(context->buffer, "STOR %s\r\n", path);
      else if(flags & FTP_FOR_APPENDING)
         sprintf(context->buffer, "APPE %s\r\n", path);
      else
         sprintf(context->buffer, "RETR %s\r\n", path);

      //Send the command to the server
      error = ftpSendCommand(context, context->buffer, &replyCode);
      //Any error to report?
      if(error) break;

      //Check FTP response code
      if(!FTP_REPLY_CODE_1YZ(replyCode))
      {
         //Report an error
         error = ERROR_UNEXPECTED_RESPONSE;
         break;
      }

      //Check transfer mode
      if(!context->passiveMode)
      {
         //Wait for the server to connect back to the client's data port
         Socket *socket = socketAccept(context->dataSocket, NULL, NULL);

         //No connection request?
         if(!socket)
         {
            //Report an error
            error = ERROR_FAILURE;
            break;
         }

         //Close the listening socket
         socketClose(context->dataSocket);
         //Save socket handle
         context->dataSocket = socket;

         //Set timeout for blocking operations
         error = socketSetTimeout(context->dataSocket, FTP_CLIENT_DEFAULT_TIMEOUT);
         //Any error to report?
         if(error) break;
      }

      //End of exception handling block
   } while(0);

   //Any error to report?
   if(error)
   {
      //Clean up side effects
      socketClose(context->dataSocket);
      context->dataSocket = NULL;
   }

   //Return status code
   return error;
}


/**
 * @brief Write to a remote file
 * @param[in] context Pointer to the FTP client context
 * @param[in] data Pointer to a buffer containing the data to be written
 * @param[in] length Number of data bytes to write
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t ftpWriteFile(FtpClientContext *context,
   const void *data, size_t length, uint_t flags)
{
   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Transmit data to the FTP server
   return socketSend(context->dataSocket, data, length, NULL, flags);
}


/**
 * @brief Read from a remote file
 * @param[in] context Pointer to the FTP client context
 * @param[out] data Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be read
 * @param[out] length Actual number of bytes that have been read
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t ftpReadFile(FtpClientContext *context,
   void *data, size_t size, size_t *length, uint_t flags)
{
   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Receive data from the FTP server
   return socketReceive(context->dataSocket, data, size, length, flags);
}


/**
 * @brief Close file
 * @param[in] context Pointer to the FTP client context
 * @return Error code
 **/

error_t ftpCloseFile(FtpClientContext *context)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Graceful shutdown
   error = socketShutdown(context->dataSocket, SOCKET_SD_BOTH);

   //Close the data socket
   socketClose(context->dataSocket);
   context->dataSocket = NULL;

   //Check the transfer status
   error = ftpSendCommand(context, NULL, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Rename a remote file
 * @param[in] context Pointer to the FTP client context
 * @param[in] oldName The name of the remote file to rename
 * @param[in] newName The new name of the remote file
 * @return Error code
 **/

error_t ftpRenameFile(FtpClientContext *context,
   const char_t *oldName, const char_t *newName)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the RNFR command
   sprintf(context->buffer, "RNFR %s\r\n", oldName);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_3YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Format the RNTO command
   sprintf(context->buffer, "RNTO %s\r\n", newName);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Delete a file
 * @param[in] context Pointer to the FTP client context
 * @param[in] path Path to the file to be be deleted
 * @return Error code
 **/

error_t ftpDeleteFile(FtpClientContext *context, const char_t *path)
{
   error_t error;
   uint_t replyCode;

   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Format the DELE command
   sprintf(context->buffer, "DELE %s\r\n", path);

   //Send the command to the server
   error = ftpSendCommand(context, context->buffer, &replyCode);
   //Any error to report?
   if(error) return error;

   //Check FTP response code
   if(!FTP_REPLY_CODE_2YZ(replyCode))
      return ERROR_UNEXPECTED_RESPONSE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Close the connection with the FTP server
 * @param[in] context Pointer to the FTP client context
 * @return Error code
 **/

error_t ftpClose(FtpClientContext *context)
{
   //Invalid context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Close data socket
   if(context->dataSocket)
   {
      socketClose(context->dataSocket);
      context->dataSocket = NULL;
   }

   //Close control socket
   if(context->controlSocket)
   {
      socketClose(context->controlSocket);
      context->controlSocket = NULL;
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send FTP command and wait for a reply
 * @param[in] context Pointer to the FTP client context
 * @param[in] command Command line
 * @param[out] replyCode Response code from the FTP server
 * @return Error code
 **/

error_t ftpSendCommand(FtpClientContext *context,
   const char_t *command, uint_t *replyCode)
{
   error_t error;
   size_t length;
   char_t *p;

   //Any command line to send?
   if(command)
   {
      //Debug message
      TRACE_DEBUG("FTP client: %s", command);

      //Send the command to the FTP server
      error = socketSend(context->controlSocket, command,
         strlen(command), NULL, SOCKET_FLAG_WAIT_ACK);

      //Failed to send command?
      if(error) return error;
   }

   //Multiline replies are allowed for any command
   while(1)
   {
      //Wait for a response from the server
      error = socketReceive(context->controlSocket, context->buffer,
         FTP_CLIENT_BUFFER_SIZE - 1, &length, SOCKET_FLAG_BREAK_CRLF);

      //The remote server did not respond as expected?
      if(error) return error;

      //Point to the beginning of the buffer
      p = context->buffer;
      //Properly terminate the string with a NULL character
      p[length] = '\0';

      //Remove trailing whitespace from the response
      strRemoveTrailingSpace(p);

      //Debug message
      TRACE_DEBUG("FTP server: %s\r\n", p);

      //Check the length of the response
      if(strlen(p) >= 3)
      {
         //All replies begin with a three digit numeric code
         if(isdigit((uint8_t) p[0]) && isdigit((uint8_t) p[1]) && isdigit((uint8_t) p[2]))
         {
            //A space character follows the response code for the last line
            if(p[3] == ' ' || p[3] == '\0')
            {
               //Get the server response code
               *replyCode = strtoul(p, NULL, 10);
               //Exit immediately
               break;
            }
         }
      }
   }

   //Successful processing
   return NO_ERROR;
}

#endif
