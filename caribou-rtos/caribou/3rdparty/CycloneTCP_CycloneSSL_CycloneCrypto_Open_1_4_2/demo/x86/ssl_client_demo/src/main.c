/**
 * @file main.c
 * @brief SSL client demo
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
#include "yarrow.h"
#include "error.h"
#include "debug.h"

//Libraries
#pragma comment(lib, "ws2_32.lib")

//Server hostname and port
#define SERVER_NAME "localhost"
#define SERVER_PORT 443
#define REQUEST_URI "/"

//Compilation options
#define SET_CIPHER_SUITES FALSE
#define SET_SERVER_NAME FALSE
#define SET_TRUSTED_CA_LIST FALSE
#define SET_CLIENT_CERT FALSE

//Trusted CA bundle
#define CA_CERT_BUNDLE "..\\certs\\ca_cert_bundle.pem"

//Client's certificate and private key
#define CLIENT_CERT "..\\certs\\client_rsa_cert.pem"
#define CLIENT_PRIVATE_KEY "..\\certs\\client_rsa_key.pem"

//Forward declaration of functions
error_t readPemFile(const char_t *filename, char_t **buffer, size_t *length);


#if SET_CIPHER_SUITES

//List of preferred ciphersuites
static const unsigned short cipherSuites[] =
{
   TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384,
   TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384,
   TLS_RSA_WITH_AES_256_GCM_SHA384,
   TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,
   TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256,
   TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256,
   TLS_RSA_WITH_AES_128_GCM_SHA256,
   TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,
   TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256,
   TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256,
   TLS_RSA_WITH_AES_256_CBC_SHA256,
   TLS_DHE_RSA_WITH_AES_256_CBC_SHA256,
   TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256,
   TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256,
   TLS_RSA_WITH_AES_128_CBC_SHA256,
   TLS_DHE_RSA_WITH_AES_128_CBC_SHA256,
   TLS_RSA_WITH_CAMELLIA_256_CBC_SHA,
   TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA,
   TLS_RSA_WITH_AES_256_CBC_SHA,
   TLS_DHE_RSA_WITH_AES_256_CBC_SHA,
   TLS_RSA_WITH_CAMELLIA_128_CBC_SHA,
   TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA,
   TLS_RSA_WITH_AES_128_CBC_SHA,
   TLS_DHE_RSA_WITH_AES_128_CBC_SHA,
   TLS_RSA_WITH_SEED_CBC_SHA,
   TLS_DHE_RSA_WITH_SEED_CBC_SHA,
   TLS_RSA_WITH_3DES_EDE_CBC_SHA,
   TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA,
   TLS_RSA_WITH_RC4_128_SHA
};

#endif


/**
 * @brief Main entry point
 * @return Status code
 **/

int_t main(void)
{
   error_t error;
   size_t length;
   int_t ret;
   WSADATA wsaData;
   HOSTENT *host;
   SOCKADDR_IN addr;
   HCRYPTPROV hProvider;
   YarrowContext yarrowContext;
   char_t buffer[512];
   uint8_t seed[32];

   //Socket descriptor
   SOCKET sock = SOCKET_ERROR;

   //SSL/TLS context
   TlsContext *tlsContext = NULL;

   //Credentials
   char_t *clientCert = NULL;
   size_t clientCertLength = 0;
   char_t *clientPrivateKey = NULL;
   size_t clientPrivateKeyLength = 0;
   char_t *trustedCaList = NULL;
   size_t trustedCaListLength = 0;

   //Start-up message
   TRACE_INFO("******************************\r\n");
   TRACE_INFO("*** CycloneSSL Client Demo ***\r\n");
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

      //Load trusted CA certificates
      error = readPemFile(CA_CERT_BUNDLE, &trustedCaList, &trustedCaListLength);
      //Any error to report?
      if(error) break;

      //Load client's certificate
      error = readPemFile(CLIENT_CERT, &clientCert, &clientCertLength);
      //Any error to report?
      if(error) break;

      //Load client's private key
      error = readPemFile(CLIENT_PRIVATE_KEY, &clientPrivateKey, &clientPrivateKeyLength);
      //Any error to report?
      if(error) break;

      //Debug message
      TRACE_INFO("Trying to resolve %s...\r\n", SERVER_NAME);

      //Resolve server name
      host = gethostbyname(SERVER_NAME);
      //Failed to resolve server name?
      if(!host)
      {
         //Debug message
         TRACE_ERROR("Error: Cannot resolve server name (%d)\r\n", WSAGetLastError());
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Open a socket
      sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
      //Failed to open socket?
      if(sock < 0)
      {
         //Debug message
         TRACE_ERROR("Error: Cannot open socket (%d)\r\n", WSAGetLastError());
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

      //Destination address
      addr.sin_family = host->h_addrtype;
      memcpy(&addr.sin_addr, host->h_addr, host->h_length);
      addr.sin_port = htons(SERVER_PORT);

      //Connect to the SSL server
      ret = connect(sock, (PSOCKADDR) &addr, sizeof(addr));
      //Connection with server failed?
      if(ret < 0)
      {
         //Debug message
         TRACE_ERROR("Error: Failed to connect (%d)\r\n", WSAGetLastError());
         //Report an error
         error = ERROR_FAILURE;
         //Exit immediately
         break;
      }

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

      //Bind TLS to the relevant socket
      error = tlsSetSocket(tlsContext, sock);
      //Any error to report?
      if(error) break;

      //Select client operation mode
      error = tlsSetConnectionEnd(tlsContext, TLS_CONNECTION_END_CLIENT);
      //Any error to report?
      if(error) break;

      //Set the PRNG algorithm to be used
      error = tlsSetPrng(tlsContext, YARROW_PRNG_ALGO, &yarrowContext);
      //Any error to report?
      if(error) break;

#if SET_CIPHER_SUITES
      //Preferred cipher suite list
      error = tlsSetCipherSuites(tlsContext, cipherSuites, arraysize(cipherSuites));
      //Any error to report?
      if(error) break;
#endif

#if SET_SERVER_NAME
      //Set the fully qualified domain name of the server
      error = tlsSetServerName(tlsContext, SERVER_NAME);
      //Any error to report?
      if(error) break;
#endif

#if SET_TRUSTED_CA_LIST
      //Import the list of trusted CA certificates
      error = tlsSetTrustedCaList(tlsContext, trustedCaList, trustedCaListLength);
      //Any error to report?
      if(error) break;
#endif

#if SET_CLIENT_CERT
      //Import the client's certificate
      error = tlsAddCertificate(tlsContext, clientCert,
         clientCertLength, clientPrivateKey, clientPrivateKeyLength);
      //Any error to report?
      if(error) break;
#endif

      //Establish a secure session
      error = tlsConnect(tlsContext);
      //TLS handshake failure?
      if(error) break;

      //Format HTTP request
      sprintf(buffer, "GET %s HTTP/1.0\r\nHost: %s:%u\r\n\r\n",
         REQUEST_URI, SERVER_NAME, SERVER_PORT);

      //Debug message
      TRACE_INFO("\r\n");
      TRACE_INFO("HTTP request:\r\n%s", buffer);

      //Send the request
      error = tlsWrite(tlsContext, buffer, strlen(buffer), 0);
      //Any error to report?
      if(error) break;

      //Debug message
      TRACE_INFO("HTTP response:\r\n");

      //Read the whole response
      while(1)
      {
         //Read data
         error = tlsRead(tlsContext, buffer, sizeof(buffer) - 1, &length, 0);
         //End of stream?
         if(error) break;

         //Properly terminate the string with a NULL character
         buffer[length] = '\0';
         //Debug message
         TRACE_INFO("%s", buffer);
      }

      //Successfull processing
      error = NO_ERROR;

   //End of exception handling block
   } while(0);

   //Terminate TLS session
   tlsFree(tlsContext);

   //Close socket if necessary
   if(sock >= 0)
      closesocket(sock);

   //Free previously allocated resources
   free(trustedCaList);
   free(clientCert);
   free(clientPrivateKey);

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
 * @brief Load the specified PEM file
 * @param[in] filename Name of the PEM file to load
 * @param[out] buffer Memory buffer that holds the contents of the file
 * @param[out] length Length of the file in bytes
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
