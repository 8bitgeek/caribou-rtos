/**
 * @file tls.c
 * @brief TLS (Transport Layer Security)
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
 * @section Description
 *
 * The TLS protocol provides communications security over the Internet. The
 * protocol allows client/server applications to communicate in a way that
 * is designed to prevent eavesdropping, tampering, or message forgery
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL TLS_TRACE_LEVEL

//Dependencies
#include <string.h>
#include <ctype.h>
#include "tls.h"
#include "tls_client.h"
#include "tls_server.h"
#include "tls_common.h"
#include "tls_record.h"
#include "tls_misc.h"
#include "x509.h"
#include "pem.h"
#include "bsd_socket.h"
#include "debug.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED)


/**
 * @brief TLS context initialization
 * @return Handle referencing the fully initialized TLS context
 **/

TlsContext *tlsInit(void)
{
   TlsContext *context;

   //Allocate a memory buffer to hold the TLS context
   context = osMemAlloc(sizeof(TlsContext));
   //Failed to allocate memory
   if(!context) return NULL;

   //Clear TLS context
   memset(context, 0, sizeof(TlsContext));

   //Reference to the underlying socket
#if (TLS_BSD_SOCKET_SUPPORT == ENABLED)
   context->socket = SOCKET_ERROR;
#else
   context->socket = NULL;
#endif

   //Default operation mode
   context->entity = TLS_CONNECTION_END_CLIENT;
   //Default TLS version
   context->version = TLS_MIN_VERSION;
   //Default client authentication mode
   context->clientAuthMode = TLS_CLIENT_AUTH_NONE;

   //Initialize Diffie-Hellman context
   dhInit(&context->dhContext);
   //Initialize ECDH context
   ecdhInit(&context->ecdhContext);
   //Initialize peer's RSA public key
   rsaInitPublicKey(&context->peerRsaPublicKey);
   //Initialize peer's DSA public key
   dsaInitPublicKey(&context->peerDsaPublicKey);
   //Initialize peer's EC domain parameters
   ecInitDomainParameters(&context->peerEcParams);
   //Initialize peer's EC public key
   ecInit(&context->peerEcPublicKey);

   //Allocate send and receive buffers
   context->txBuffer = osMemAlloc(TLS_TX_BUFFER_SIZE);
   context->rxBuffer = osMemAlloc(TLS_RX_BUFFER_SIZE);
   //Failed to allocate memory?
   if(!context->txBuffer || !context->rxBuffer)
   {
      //Free previously allocated memory
      osMemFree(context->txBuffer);
      osMemFree(context->rxBuffer);
      osMemFree(context);
      //Report an error
      return NULL;
   }

   //Clear send and receive buffers
   memset(context->txBuffer, 0, TLS_TX_BUFFER_SIZE);
   memset(context->rxBuffer, 0, TLS_RX_BUFFER_SIZE);

   //Return a handle to the freshly created TLS context
   return context;
}


/**
 * @brief Bind TLS to a particular socket
 * @param[in] context Pointer to the TLS context
 * @param[in] socket Reference to the underlying socket
 * @return Error code
 **/

error_t tlsSetSocket(TlsContext *context, TlsSocket socket)
{
   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

#if (TLS_BSD_SOCKET_SUPPORT == ENABLED)
   //Ensure the socket handle is valid
   if(socket == SOCKET_ERROR)
      return ERROR_INVALID_PARAMETER;
#else
   //Ensure the socket handle is valid
   if(socket == NULL)
      return ERROR_INVALID_PARAMETER;
#endif

   //Underlying socket
   context->socket = socket;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set operation mode (client or server)
 * @param[in] context Pointer to the TLS context
 * @param[in] entity Specifies whether this entity is considered a client or a server
 * @return Error code
 **/

error_t tlsSetConnectionEnd(TlsContext *context, TlsConnectionEnd entity)
{
   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Invalid parameter?
   if(entity != TLS_CONNECTION_END_CLIENT && entity != TLS_CONNECTION_END_SERVER)
      return ERROR_INVALID_PARAMETER;

   //Check whether TLS operates as a client or a server
   context->entity = entity;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set the pseudo-random number generator to be used
 * @param[in] context Pointer to the TLS context
 * @param[in] prngAlgo PRNG algorithm
 * @param[in] prngContext Pointer to the PRNG context
 * @return Error code
 **/

error_t tlsSetPrng(TlsContext *context, const PrngAlgo *prngAlgo, void *prngContext)
{
   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Invalid parameters?
   if(prngAlgo == NULL || prngContext == NULL)
      return ERROR_INVALID_PARAMETER;

   //PRNG algorithm that will be used to generate random numbers
   context->prngAlgo = prngAlgo;
   //PRNG context
   context->prngContext = prngContext;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set the name of the remote server
 * @param[in] context Pointer to the TLS context
 * @param[in] serverName Fully qualified domain name of the server
 * @return Error code
 **/

error_t tlsSetServerName(TlsContext *context, const char_t *serverName)
{
   size_t i;
   size_t length;

   //Invalid parameters?
   if(context == NULL || serverName == NULL)
      return ERROR_INVALID_PARAMETER;

   //Retrieve the length of the server name
   length = strlen(serverName);

   //Allocate a memory block to hold the hostname
   context->serverName = osMemAlloc(length + 1);
   //Failed to allocate memory?
   if(!context->serverName) return ERROR_OUT_OF_MEMORY;

   //Convert the hostname into lowercase
   for(i = 0; i < length; i++)
      context->serverName[i] = tolower((uint8_t) serverName[i]);

   //Properly terminate the string with a NULL character
   context->serverName[length] = '\0';

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set session cache
 * @param[in] context Pointer to the TLS context
 * @param[in] cache Session cache that will be used to save/resume TLS sessions
 * @return Error code
 **/

error_t tlsSetCache(TlsContext *context, TlsCache *cache)
{
   //Check parameters
   if(context == NULL || cache == NULL)
      return ERROR_INVALID_PARAMETER;

   //The cache will be used to save/resume TLS sessions
   context->cache = cache;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set client authentication mode
 * @param[in] context Pointer to the TLS context
 * @param[in] mode Client authentication mode
 * @return Error code
 **/

error_t tlsSetClientAuthMode(TlsContext *context, TlsClientAuthMode mode)
{
   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Save client authentication mode
   context->clientAuthMode = mode;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Specify the list of allowed cipher suites
 * @param[in] context Pointer to the TLS context
 * @param[in] cipherSuites Pointer to the cipher suite list
 * @param[in] length Number of cipher suites in the list
 * @return Error code
 **/

error_t tlsSetCipherSuites(TlsContext *context, const uint16_t *cipherSuites, uint_t length)
{
   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Check parameters
   if(cipherSuites == NULL && length != 0)
      return ERROR_INVALID_PARAMETER;

   //Restrict the cipher suites that can be used
   context->cipherSuites = cipherSuites;
   context->numCipherSuites = length;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Import Diffie-Hellman parameters
 * @param[in] context Pointer to the TLS context
 * @param[in] params PEM structure that holds Diffie-Hellman parameters
 * @param[in] length Total length of the DER structure
 * @return Error code
 **/

error_t tlsSetDhParameters(TlsContext *context, const char_t *params, size_t length)
{
   error_t error;

   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Check parameters
   if(params == NULL && length != 0)
      return ERROR_INVALID_PARAMETER;

   //Decode the PEM structure that holds Diffie-Hellman parameters
   error = pemReadDhParameters(params, length, &context->dhContext.params);

   //return status code
   return error;
}


/**
 * @brief Import a trusted CA list
 * @param[in] context Pointer to the TLS context
 * @param[in] trustedCaList List of trusted CA (PEM format)
 * @param[in] length Total length of the list
 * @return Error code
 **/

error_t tlsSetTrustedCaList(TlsContext *context, const char_t *trustedCaList, size_t length)
{
   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Check parameters
   if(trustedCaList == NULL && length != 0)
      return ERROR_INVALID_PARAMETER;

   //Save the certificate chain
   context->trustedCaList = trustedCaList;
   context->trustedCaListLength = length;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Import a certificate and the corresponding private key
 * @param[in] context Pointer to the TLS context
 * @param[in] certChain Certificate chain (PEM format)
 * @param[in] certChainLength Total length of the certificate chain
 * @param[in] privateKey Private key (PEM format)
 * @param[in] privateKeyLength Total length of the private key
 * @return Error code
 **/

error_t tlsAddCertificate(TlsContext *context, const char_t *certChain,
   size_t certChainLength, const char_t *privateKey, size_t privateKeyLength)
{
   error_t error;
   const char_t *p;
   size_t n;
   uint8_t *derCert;
   size_t derCertSize;
   size_t derCertLength;
   X509CertificateInfo *certInfo;
   TlsCertificateType certType;
   TlsSignatureAlgo certSignAlgo;
   TlsHashAlgo certHashAlgo;
   TlsEcNamedCurve namedCurve;

   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Check parameters
   if(certChain == NULL || certChainLength == 0)
      return ERROR_INVALID_PARAMETER;
   if(privateKey == NULL || privateKeyLength == 0)
      return ERROR_INVALID_PARAMETER;

   //Make sure there is enough room to add the certificate
   if(context->numCerts >= TLS_MAX_CERTIFICATES)
      return ERROR_OUT_OF_RESOURCES;

   //Allocate a memory buffer to store X.509 certificate info
   certInfo = osMemAlloc(sizeof(X509CertificateInfo));
   //Failed to allocate memory?
   if(!certInfo) return ERROR_OUT_OF_MEMORY;

   //Point to the beginning of the certificate chain
   p = certChain;
   n = certChainLength;

   //DER encoded certificate
   derCert = NULL;
   derCertSize = 0;
   derCertLength = 0;

   //Start of exception handling block
   do
   {
      //Decode end entity certificate
      error = pemReadCertificate(&p, &n, &derCert, &derCertSize, &derCertLength);
      //Any error to report?
      if(error) break;

      //Parse X.509 certificate
      error = x509ParseCertificate(derCert, derCertLength, certInfo);
      //Failed to parse the X.509 certificate?
      if(error) break;

      //Retrieve the signature algorithm that has been used to sign the certificate
      error = tlsGetCertificateType(certInfo, &certType,
         &certSignAlgo, &certHashAlgo, &namedCurve);
      //The specified signature algorithm is not supported?
      if(error) break;

      //End of exception handling block
   } while(0);

   //Check whether the certificate is acceptable
   if(!error)
   {
      //Point to the structure that describes the certificate
      TlsCertDesc *cert = &context->certs[context->numCerts];

      //Save the certificate chain and the corresponding private key
      cert->certChain = certChain;
      cert->certChainLength = certChainLength;
      cert->privateKey = privateKey;
      cert->privateKeyLength = privateKeyLength;
      cert->type = certType;
      cert->signAlgo = certSignAlgo;
      cert->hashAlgo = certHashAlgo;
      cert->namedCurve = namedCurve;

      //Update the number of certificates
      context->numCerts++;
   }

   //Release previously allocated memory
   osMemFree(derCert);
   osMemFree(certInfo);

   //Return status code
   return error;
}


/**
 * @brief Initiate the TLS handshake
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsConnect(TlsContext *context)
{
   error_t error;

   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

#if (TLS_BSD_SOCKET_SUPPORT == ENABLED)
   //Ensure the socket handle is valid
   if(context->socket == SOCKET_ERROR)
      return ERROR_NOT_CONFIGURED;
#else
   //Ensure the socket handle is valid
   if(context->socket == NULL)
      return ERROR_NOT_CONFIGURED;
#endif

   //Verify that the PRNG is properly set
   if(context->prngAlgo == NULL || context->prngContext == NULL)
      return ERROR_NOT_CONFIGURED;

#if (TLS_CLIENT_SUPPORT == ENABLED)
   //TLS operates as a client?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Initiate TLS handshake with the remote server
      error = tlsClientHandshake(context);
   }
   else
#endif
#if (TLS_SERVER_SUPPORT == ENABLED)
   //TLS operates as a server?
   if(context->entity == TLS_CONNECTION_END_SERVER)
   {
      //Initiate TLS handshake with the remote client
      error = tlsServerHandshake(context);
   }
   else
#endif
   //Unsupported mode of operation?
   {
      //Cannot establish a secure session between the server and the client...
      error = ERROR_INVALID_PARAMETER;
   }

   //Return status code
   return error;
}


/**
 * @brief Send application data to the remote host using TLS
 * @param[in] context Pointer to the TLS context
 * @param[in] data Pointer to a buffer containing the data to be transmitted
 * @param[in] length Number of bytes to be transmitted
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t tlsWrite(TlsContext *context, const void *data, size_t length, uint_t flags)
{
   error_t error;
   size_t n;
   uint8_t *p;

   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Check parameters
   if(data == NULL && length != 0)
      return ERROR_INVALID_PARAMETER;

   //Pointer to the buffer where to copy the data
   p = context->txBuffer + sizeof(TlsRecord);

   //Send all the data
   while(length > 0)
   {
      //Check the current state before sending data
      if(context->state != TLS_STATE_APPLICATION_DATA)
         return ERROR_NOT_CONNECTED;

      //Calculate the number of bytes to write at a time
      n = min(length, TLS_MAX_PROTOCOL_DATA_LENGTH);
      //The record length cannot exceed 16384 bytes
      n = min(n, TLS_MAX_RECORD_LENGTH);

      //Copy data to the send buffer
      memcpy(p, data, n);

      //Send application data
      error = tlsWriteProtocolData(context, n, TLS_TYPE_APPLICATION_DATA);

      //Failed to send data?
      if(error)
      {
         //Send an alert message to the peer
         tlsProcessError(context, error);
         //Report an error
         return error;
      }

      //Advance data pointer
      data = (uint8_t *) data + n;
      //Data left to be written
      length -= n;
   }

   //Successful write operation
   return NO_ERROR;
}


/**
 * @brief Receive application data from a the remote host using TLS
 * @param[in] context Pointer to the TLS context
 * @param[out] data Buffer into which received data will be placed
 * @param[in] size Maximum number of bytes that can be received
 * @param[out] received Number of bytes that have been received
 * @param[in] flags Set of flags that influences the behavior of this function
 * @return Error code
 **/

error_t tlsRead(TlsContext *context, void *data, size_t size, size_t *received, uint_t flags)
{
   error_t error;
   size_t i;
   size_t n;
   uint8_t *p;
   TlsContentType contentType;

   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;
   //Check parameters
   if(data == NULL && received == NULL)
      return ERROR_INVALID_PARAMETER;

   //No data has been read yet
   *received = 0;

   //Read as much data as possible
   for(*received = 0; *received < size; )
   {
      //Check the current state before reading data
      if(context->state == TLS_STATE_CLOSED)
      {
         //The user must be satisfied with data already on hand
         return (*received > 0) ? NO_ERROR : ERROR_END_OF_STREAM;
      }
      else if(context->state == TLS_STATE_FATAL_ERROR)
      {
         //A fatal alert message has been received
         return ERROR_FAILURE;
      }
      else if(context->state != TLS_STATE_APPLICATION_DATA)
      {
         //The connection has not yet been established
         return ERROR_NOT_CONNECTED;
      }

      //The TLS record layer receives uninterpreted data from higher layers
      error = tlsReadProtocolData(context, (void **) &p, &n, &contentType);

      //Check the higher-level protocol that was used to convey the data
      if(!error)
      {
         //Application data received?
         if(contentType == TLS_TYPE_APPLICATION_DATA)
         {
            //Limit the number of bytes to read at a time
            n = min(n, size - *received);

            //The TLS_FLAG_BREAK_CHAR flag causes the function to stop reading
            //data as soon as the specified break character is encountered
            if(flags & TLS_FLAG_BREAK_CHAR)
            {
               //Retrieve the break character code
               char_t c = LSB(flags);

               //Search for the specified break character
               for(i = 0; i < n && p[i] != c; i++);
               //Adjust the number of data to read
               n = min(n, i + 1);

               //Copy data to user buffer
               memcpy(data, p, n);
               //Total number of data that have been read
               *received += n;

               //Advance read index
               context->rxBufferReadIndex += n;
               //Number of bytes still pending in the receive buffer
               context->rxBufferLength -= n;

               //Check whether a break character has been found
               if(n > 1 && p[n - 1] == c)
                  break;
            }
            else
            {
               //Copy data to user buffer
               memcpy(data, p, n);
               //Total number of data that have been read
               *received += n;

               //Advance read index
               context->rxBufferReadIndex += n;
               //Number of bytes still pending in the receive buffer
               context->rxBufferLength -= n;

               //The TLS_FLAG_WAIT_ALL flag causes the function to return
               //only when the requested number of bytes have been read
               if(!(flags & TLS_FLAG_WAIT_ALL))
                  break;
            }

            //Advance data pointer
            data = (uint8_t *) data + n;
         }
         //Alert message received?
         else if(contentType == TLS_TYPE_ALERT)
         {
            //Parse Alert message
            error = tlsParseAlert(context, (TlsAlert *) p, n);

            //Advance read index
            context->rxBufferReadIndex += n;
            //Number of bytes still pending in the receive buffer
            context->rxBufferLength -= n;
         }
         //An inappropriate message was received?
         else
         {
            //Report an error
            error = ERROR_UNEXPECTED_MESSAGE;
         }
      }

      //An error was encountered?
      if(error)
      {
         //Send an alert message to the peer
         tlsProcessError(context, error);
         //Exit immediately
         return error;
      }
   }

   //Successful read operation
   return NO_ERROR;
}


/**
 * @brief Gracefully close TLS session
 * @param[in] context Pointer to the TLS context
 **/

error_t tlsShutdown(TlsContext *context)
{
   error_t error;

   //Invalid TLS context?
   if(context == NULL)
      return ERROR_INVALID_PARAMETER;

   //Check current state
   if(context->state == TLS_STATE_APPLICATION_DATA ||
      context->state == TLS_STATE_CLOSED)
   {
      //Notifies the recipient that the sender will not send
      //any more messages on this connection
      error = tlsSendAlert(context, TLS_ALERT_LEVEL_WARNING, TLS_ALERT_CLOSE_NOTIFY);
      //Update FSM state
      context->state = TLS_STATE_CLOSED;
   }
   else
   {
      //Report an error
      error = ERROR_NOT_CONNECTED;
   }

   //Return status code
   return error;
}


/**
 * @brief Release TLS context
 * @param[in] context Pointer to the TLS context
 **/

void tlsFree(TlsContext *context)
{
   //Invalid TLS context?
   if(context == NULL)
      return;

   //Properly close the TLS session by sending a close notify
   tlsShutdown(context);

   //Release server name
   osMemFree(context->serverName);

   //Free Diffie-Hellman context
   dhFree(&context->dhContext);
   //Free ECDH context
   ecdhFree(&context->ecdhContext);
   //Release peer's RSA public key
   rsaFreePublicKey(&context->peerRsaPublicKey);
   //Release peer's DSA public key
   dsaFreePublicKey(&context->peerDsaPublicKey);
   //Release peer's EC domain parameters
   ecFreeDomainParameters(&context->peerEcParams);
   //Release peer's EC public key
   ecFree(&context->peerEcPublicKey);

   //Release send buffer
   memset(context->txBuffer, 0, TLS_TX_BUFFER_SIZE);
   osMemFree(context->txBuffer);

   //Release receive buffer
   memset(context->rxBuffer, 0, TLS_RX_BUFFER_SIZE);
   osMemFree(context->rxBuffer);

   //Release resources used to compute handshake message hash
   osMemFree(context->handshakeMd5Context);
   osMemFree(context->handshakeSha1Context);
   osMemFree(context->handshakeHashContext);

   //Release the write encryption context
   if(context->writeCipherContext)
   {
      //Clear context contents, then release memory
      memset(context->writeCipherContext, 0, context->cipherAlgo->contextSize);
      osMemFree(context->writeCipherContext);
   }

   //Release the read encryption context
   if(context->readCipherContext)
   {
      //Clear context contents, then release memory
      memset(context->readCipherContext, 0, context->cipherAlgo->contextSize);
      osMemFree(context->readCipherContext);
   }

   //Clear the TLS context before freeing memory
   memset(context, 0, sizeof(TlsContext));
   osMemFree(context);
}


/**
 * @brief Save TLS session
 * @param[in] context Pointer to the TLS context
 * @param[out] session Buffer where to store the current session parameters
 * @return Error code
 **/

error_t tlsSaveSession(const TlsContext *context, TlsSession *session)
{
   //Check parameters
   if(context == NULL || session == NULL)
      return ERROR_INVALID_PARAMETER;

   //Invalid session parameters?
   if(!context->sessionIdLength || !context->cipherSuite)
      return ERROR_FAILURE;

   //Save session identifier
   memcpy(session->id, context->sessionId, context->sessionIdLength);
   session->idLength = context->sessionIdLength;

   //Get current time
   session->timestamp = osGetTickCount();

   //Negotiated cipher suite and compression method
   session->cipherSuite = context->cipherSuite;
   session->compressionMethod = context->compressionMethod;

   //Save master secret
   memcpy(session->masterSecret, context->masterSecret, 48);

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Restore TLS session
 * @param[in] context Pointer to the TLS context
 * @param[in] session Pointer to the session to be restored
 * @return Error code
 **/

error_t tlsRestoreSession(TlsContext *context, const TlsSession *session)
{
   //Check parameters
   if(context == NULL || session == NULL)
      return ERROR_INVALID_PARAMETER;

   //Restore session identifier
   memcpy(context->sessionId, session->id, session->idLength);
   context->sessionIdLength = session->idLength;

   //Negotiated cipher suite and compression method
   context->cipherSuite = session->cipherSuite;
   context->compressionMethod = session->compressionMethod;

   //Restore master secret
   memcpy(context->masterSecret, session->masterSecret, 48);

   //Successful processing
   return NO_ERROR;
}

#endif
