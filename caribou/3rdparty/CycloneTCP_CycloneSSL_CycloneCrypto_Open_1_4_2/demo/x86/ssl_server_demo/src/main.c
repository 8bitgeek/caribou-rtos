/**
 * @file main.c
 * @brief SSL server demo
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
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

#define _CRTDBG_MAP_ALLOC
#define _WINERROR_

//Dependencies
#include <stdlib.h>
#include <crtdbg.h>
#include <winsock2.h>
#include "os_port.h"
#include "tls.h"
#include "tls_cipher_suites.h"
#include "tls_misc.h"
#include "yarrow.h"
#include "error.h"
#include "debug.h"

//Libraries
#pragma comment(lib, "ws2_32.lib")

//Server port
#define SERVER_PORT 443

//Diffie-Hellman parameters
#define SERVER_DH_PARAMS "..\\certs\\dh_params.pem"

//Server's RSA certificate and private key
#define SERVER_RSA_CERT "..\\certs\\server_rsa_cert.pem"
#define SERVER_RSA_PRIVATE_KEY "..\\certs\\server_rsa_key.pem"

//Server's DSA certificate and private key
#define SERVER_DSA_CERT "..\\certs\\server_dsa_cert.pem"
#define SERVER_DSA_PRIVATE_KEY "..\\certs\\server_dsa_key.pem"

//Server's ECDSA certificate and private key
#define SERVER_ECDSA_CERT "..\\certs\\server_ecdsa_cert.pem"
#define SERVER_ECDSA_PRIVATE_KEY "..\\certs\\server_ecdsa_key.pem"

//Trusted CA bundle
#define CA_CERT_BUNDLE "..\\certs\\ca_cert_bundle.pem"

//Forward declaration of functions
error_t readPemFile(const char_t *filename, char_t **buffer, size_t *length);
error_t processClientRequest(SOCKET clientSocket);
const char_t *dumpArray(char_t *buffer, const uint8_t *data, size_t length);

//Credentials
char_t *dhParams = NULL;
size_t dhParamsLength = 0;
char_t *serverRsaCert = NULL;
size_t serverRsaCertLength = 0;
char_t *serverRsaPrivateKey = NULL;
size_t serverRsaPrivateKeyLength = 0;
char_t *serverDsaCert = NULL;
size_t serverDsaCertLength = 0;
char_t *serverDsaPrivateKey = NULL;
size_t serverDsaPrivateKeyLength = 0;
char_t *serverEcdsaCert = NULL;
size_t serverEcdsaCertLength = 0;
char_t *serverEcdsaPrivateKey = NULL;
size_t serverEcdsaPrivateKeyLength = 0;
char_t *trustedCaList = NULL;
size_t trustedCaListLength = 0;

//Pseudo-random number generator
YarrowContext yarrowContext;

//Session cache
TlsCache *tlsCache = NULL;

//Hit counter
uint_t hitCounter = 0;


/**
 * @brief Main entry point
 * @return Unused value
 **/

int_t main(void)
{
   error_t error;
   int_t ret;
   int_t clientAddrLen;
   SOCKADDR_IN serverAddr;
   SOCKADDR_IN clientAddr;
   WSADATA wsaData;
   HCRYPTPROV hProvider;
   uint8_t seed[32];

   //Server socket descriptor
   SOCKET serverSocket = SOCKET_ERROR;
   //Client socket descriptor
   SOCKET clientSocket = SOCKET_ERROR;

   //Start-up message
   TRACE_INFO("******************************\r\n");
   TRACE_INFO("*** CycloneSSL Server Demo ***\r\n");
   TRACE_INFO("******************************\r\n");
   TRACE_INFO("\r\n");

   //PRNG initialization
   error = yarrowInit(&yarrowContext);
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: PRNG initialization failed (%d)\r\n", error);
      //Exit immediately
      return ERROR_FAILURE;
   }

   //Acquire cryptographic context
   ret = CryptAcquireContext(&hProvider, 0, 0, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT | CRYPT_SILENT);
   //Any error to report?
   if(!ret)
   {
      //Debug message
      TRACE_ERROR("Error: Cannot acquire cryptographic context (%d)\r\n", GetLastError());
      //Exit immediately
      return ERROR_FAILURE;
   }

   //Generate a random seed
   ret = CryptGenRandom(hProvider, sizeof(seed), seed);
   //Any error to report?
   if(!ret)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to generate random data (%d)\r\n", GetLastError());
      //Exit immediately
      return ERROR_FAILURE;
   }

   //Release cryptographic context
   CryptReleaseContext(hProvider, 0);

   //Properly seed the PRNG
   error = yarrowSeed(&yarrowContext, seed, sizeof(seed));
   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: Failed to seed PRNG (%d)\r\n", error);
      //Exit immediately
      return error;
   }

   //Winsock initialization
   ret = WSAStartup(MAKEWORD(2, 2), &wsaData);
   //Any error to report?
   if(ret)
   {
      //Debug message
      TRACE_ERROR("Error: Winsock initialization failed (%d)\r\n", ret);
      //Exit immediately
      return ERROR_FAILURE;
   }

   //Start of exception handling block
   do
   {
      //Debug message
      TRACE_INFO("Loading credentials...\r\n");

      //Load Diffie-Hellman parameters
      error = readPemFile(SERVER_DH_PARAMS,  &dhParams, &dhParamsLength);
      //Any error to report?
      if(error) break;

      //Load server's RSA certificate
      error = readPemFile(SERVER_RSA_CERT, &serverRsaCert, &serverRsaCertLength);
      //Any error to report?
      if(error) break;

      //Load server's RSA private key
      error = readPemFile(SERVER_RSA_PRIVATE_KEY, &serverRsaPrivateKey, &serverRsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Load server's DSA certificate
      error = readPemFile(SERVER_DSA_CERT, &serverDsaCert, &serverDsaCertLength);
      //Any error to report?
      if(error) break;

      //Load server's DSA private key
      error = readPemFile(SERVER_DSA_PRIVATE_KEY, &serverDsaPrivateKey, &serverDsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Load server's ECDSA certificate
      error = readPemFile(SERVER_ECDSA_CERT, &serverEcdsaCert, &serverEcdsaCertLength);
      //Any error to report?
      if(error) break;

      //Load server's ECDSA private key
      error = readPemFile(SERVER_ECDSA_PRIVATE_KEY, &serverEcdsaPrivateKey, &serverEcdsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Load trusted CA certificates
      error = readPemFile(CA_CERT_BUNDLE, &trustedCaList, &trustedCaListLength);
      //Any error to report?
      if(error) break;

      //TLS session cache initialization
      tlsCache = tlsInitCache(16);
      //Any error to report?
      if(!tlsCache)
      {
         //Debug message
         TRACE_ERROR("Error: TLS cache initialization failed\r\n");
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Open a socket
      serverSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
      //Failed to open socket?
      if(serverSocket < 0)
      {
         //Debug message
         TRACE_ERROR("Error: Cannot open socket (%d)\r\n", WSAGetLastError());
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Server port
      serverAddr.sin_family = AF_INET;
      serverAddr.sin_addr.s_addr = INADDR_ANY;
      serverAddr.sin_port = htons(SERVER_PORT);

      //Bind the socket to the relevant port number
      ret = bind(serverSocket, (PSOCKADDR) &serverAddr, sizeof(serverAddr));
      //Any error to report?
      if(ret < 0)
      {
         //Debug message
         TRACE_ERROR("Error: Failed to bind socket (%d)\r\n", WSAGetLastError());
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Place the socket in the listening state
      ret = listen(serverSocket, 10);
      //Any error to report?
      if(ret < 0)
      {
         //Debug message
         TRACE_ERROR("Error: Failed to enter listening state (%d)\r\n", WSAGetLastError());
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Main loop
      while(1)
      {
         //Debug message
         TRACE_INFO("\r\n\r\n");
         TRACE_INFO("Waiting for an incoming connection...\r\n\r\n");

         //Initialize address length
         clientAddrLen = sizeof(clientAddr);

         //Accept a new connection request
         clientSocket = accept(serverSocket, (PSOCKADDR) &clientAddr, &clientAddrLen);
         //Any error to report?
         if(clientSocket < 0)
         {
            //Debug message
            TRACE_ERROR("Error: Cannot accept new connection request (%d)\r\n", WSAGetLastError());
            //Report an error
            error = ERROR_FAILURE;
            //Exit immediately
            break;
         }

         //Increment hit counter
         hitCounter++;

         //Debug message
         TRACE_INFO("Connection #%u established with client %s port %u...\r\n",
            hitCounter, inet_ntoa(clientAddr.sin_addr), ntohs(clientAddr.sin_port));

         //Process incoming request
         error = processClientRequest(clientSocket);

         //Failed to service client request?
         if(error)
         {
            //Debug message
            TRACE_ERROR("Error: Failed to process client request (%d)\r\n", error);
         }

         //Debug message
         TRACE_INFO("Closing connection...\r\n");
         //Close socket
         closesocket(clientSocket);
      }

   //End of exception handling block
   } while(0);

   //Close server socket if necessary
   if(serverSocket >= 0)
      closesocket(serverSocket);

   //Release session cache
   tlsFreeCache(tlsCache);

   //Free previously allocated resources
   free(dhParams);
   free(serverRsaCert);
   free(serverRsaPrivateKey);
   free(serverDsaCert);
   free(serverDsaPrivateKey);
   free(trustedCaList);

   //Release PRNG context
   yarrowRelease(&yarrowContext);

   //Winsock related cleanup
   WSACleanup();
   //Dumps all the memory blocks in the heap when a memory leak has occurred
   _CrtDumpMemoryLeaks();

   //Wait for the user to press a key
   system("pause");

   //Return status code
   return error;
}


/**
 * @brief Process incoming request
 * @param[in] clientSocket Socket descriptor
 * @return Error code
 **/

error_t processClientRequest(SOCKET clientSocket)
{
   error_t error;
   size_t n;
   char_t *p;
   char_t buffer[512];
   char_t response[2048];
   TlsContext *tlsContext;

   //Start of exception handling block
   do
   {
      //Initialize SSL/TLS context
      tlsContext = tlsInit();
      //Initialization failed?
      if(!tlsContext)
      {
         //Report an error
         error = ERROR_OUT_OF_MEMORY;
         //Exit immediately
         break;
      }

      //Select server operation mode
      error = tlsSetConnectionEnd(tlsContext, TLS_CONNECTION_END_SERVER);
      //Any error to report?
      if(error) break;

      //Bind TLS to the relevant socket
      error = tlsSetSocket(tlsContext, clientSocket);
      //Any error to report?
      if(error) break;

      //Set the PRNG algorithm to be used
      error = tlsSetPrng(tlsContext, YARROW_PRNG_ALGO, &yarrowContext);
      //Any error to report?
      if(error) break;

      //Session cache that will be used to save/resume TLS sessions
      error = tlsSetCache(tlsContext, tlsCache);
      //Any error to report?
      if(error) break;

      //Client authentication is optional
      error = tlsSetClientAuthMode(tlsContext, TLS_CLIENT_AUTH_OPTIONAL);
      //Any error to report?
      if(error) break;

      //Import Diffie-Hellman parameters
      error = tlsSetDhParameters(tlsContext, dhParams, dhParamsLength);
      //Any error to report?
      if(error) break;

      //Import the server's RSA certificate
      error = tlsAddCertificate(tlsContext, serverRsaCert,
         serverRsaCertLength, serverRsaPrivateKey, serverRsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Import the server's DSA certificate
      error = tlsAddCertificate(tlsContext, serverDsaCert,
         serverDsaCertLength, serverDsaPrivateKey, serverDsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Import the server's ECDSA certificate
      error = tlsAddCertificate(tlsContext, serverEcdsaCert,
         serverEcdsaCertLength, serverEcdsaPrivateKey, serverEcdsaPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Import the list of trusted CA certificates
      error = tlsSetTrustedCaList(tlsContext, trustedCaList, trustedCaListLength);
      //Any error to report?
      if(error) break;

      //Establish a secure session
      error = tlsConnect(tlsContext);
      //TLS handshake failure?
      if(error) break;

      //Debug message
      TRACE_INFO("\r\n");
      TRACE_INFO("HTTP request:\r\n");

      //Read HTTP request
      while(1)
      {
         //Read a complete line
         error = tlsRead(tlsContext, buffer, sizeof(buffer), &n, TLS_FLAG_BREAK_CRLF);
         //Any error to report?
         if(error) break;

         //Properly terminate the string with a NULL character
         buffer[n] = '\0';
         //Dump HTTP request
         TRACE_INFO("%s", buffer);

         //The end of the header has been reached?
         if(!strcmp(buffer, "\r\n")) break;
      }

      //Propagate exception if necessary...
      if(error) break;

      //Point to the beginning of the response
      p = response;

      //Format response
      p += sprintf(p, "HTTP/1.0 200 OK\r\n");
      p += sprintf(p, "Content-Type: text/html\r\n");
      p += sprintf(p, "\r\n");

      p += sprintf(p, "<!DOCTYPE html>\r\n");
      p += sprintf(p, "<html>\r\n");
      p += sprintf(p, "<head>\r\n");
      p += sprintf(p, "  <title>Oryx Embedded - CycloneSSL Server Demo</title>\r\n");
      p += sprintf(p, "  <style>\r\n");
      p += sprintf(p, "    body {font-family: monospace; font-size: 13px;}\r\n");
      p += sprintf(p, "    table {border-width: 1px; border-style: ouset; border-collapse: collapse;}\r\n");
      p += sprintf(p, "    td {border-width: 1px; border-style: inset; padding: 3px;}\r\n");
      p += sprintf(p, "  </style>\r\n");
      p += sprintf(p, "</head>\r\n");
      p += sprintf(p, "<body>\r\n");
      p += sprintf(p, "  <p>Welcome to the CycloneSSL demo server!</p>\r\n");
      p += sprintf(p, "  <table>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Hit counter</td>\r\n");
      p += sprintf(p, "    <td>%d</td>\r\n", hitCounter);
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Server version</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetVersionName(TLS_MAX_VERSION));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Client version</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetVersionName(tlsContext->clientVersion));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Negotiated version</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetVersionName(tlsContext->version));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Cipher suite</td>\r\n");
      p += sprintf(p, "    <td>%s</td>\r\n", tlsGetCipherSuiteName(tlsContext->cipherSuite));
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Client random</td>\r\n");
      p += sprintf(p, "      <td>\r\n");
      p += sprintf(p, "        %s\r\n", dumpArray(buffer, (uint8_t *) &tlsContext->clientRandom, 32));
      p += sprintf(p, "      </td>\r\n");
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Server random</td>\r\n");
      p += sprintf(p, "      <td>\r\n");
      p += sprintf(p, "        %s\r\n", dumpArray(buffer, (uint8_t *) &tlsContext->serverRandom, 32));
      p += sprintf(p, "      </td>\r\n");
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  <tr>\r\n");
      p += sprintf(p, "    <td>Session ID</td>\r\n");
      p += sprintf(p, "      <td>\r\n");
      p += sprintf(p, "        %s\r\n", dumpArray(buffer, tlsContext->sessionId, tlsContext->sessionIdLength));
      p += sprintf(p, "      </td>\r\n");
      p += sprintf(p, "  </tr>\r\n");

      p += sprintf(p, "  </table>\r\n");
      p += sprintf(p, "</body>\r\n");
      p += sprintf(p, "</html>\r\n");

      //Dump HTTP response
      TRACE_INFO("HTTP response:\r\n");
      TRACE_INFO("%s\r\n", response);

      //Send response to the client
      error = tlsWrite(tlsContext, response, strlen(response), 0);
      //Any error to report?
      if(error) break;

      //End of exception handling block
   } while(0);

   //Terminate SSL session
   tlsFree(tlsContext);

   //Return status code
   return error;
}


/**
 * @brief Load the specified PEM file
 * @param[in] filename Name of the PEM file to load
 * @param[out] buffer Memory buffer that holds the contents of the file
 * @param[out] length Length of the file in bytes
 * @return Error code
 **/

error_t readPemFile(const char_t *filename, char_t **buffer, size_t *length)
{
   int_t ret;
   error_t error;
   FILE *fp;

   //Initialize output parameters
   *buffer = NULL;
   *length = 0;

   //Start of exception handling block
   do
   {
      //Open the specified file
      fp = fopen(filename, "rb");

      //Failed to open the file?
      if(fp == NULL)
      {
         error = ERROR_OPEN_FAILED;
         break;
      }

      //Jump to the end of the file
      ret = fseek(fp, 0, SEEK_END);

      //Any error to report?
      if(ret != 0)
      {
         error = ERROR_FAILURE;
         break;
      }

      //Retrieve the length of the file
      *length = ftell(fp);
      //Allocate a buffer to hold the contents of the file
      *buffer = malloc(*length);

      //Failed to allocate memory?
      if(*buffer == NULL)
      {
         error = ERROR_OUT_OF_MEMORY;
         break;
      }

      //Rewind to the beginning of the file
      rewind(fp);
      //Read file contents
      ret = fread(*buffer, 1, *length, fp);

      //Failed to read data?
      if(ret != *length)
      {
         error = ERROR_READ_FAILED;
         break;
      }

      //Successful processing
      error = NO_ERROR;

      //End of exception handling block
   } while(0);

   //Close file
   if(fp != NULL)
      fclose(fp);

   //Any error to report?
   if(error)
   {
      //Debug message
      TRACE_ERROR("Error: Cannot load file %s\r\n", filename);
      //Clean up side effects
      free(*buffer);
   }

   //Return status code
   return error;
}


/**
 * @brief Display the contents of an array
 * @param[out] buffer Output buffer where to format the resulting string
 * @param[in] data Pointer to the data array
 * @param[in] length Number of bytes in the array
 * @return Pointer to the output buffer
 **/

const char_t *dumpArray(char_t *buffer, const uint8_t *data, size_t length)
{
   size_t i;
   char_t *p;

   //Point to the output buffer
   p = buffer;
   //Properly terminate the string
   p[0] = '\0';

   //Process input data
   for(i = 0; i < length; i++)
   {
      //Beginning of a new line?
      if(i != 0 && (i % 16) == 0)
         p += sprintf(p, "\r\n        ");
      //Display current data byte
      p += sprintf(p, "%02X ", data[i]);
   }

   //Return a pointer the output string
   return buffer;
}
