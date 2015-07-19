/**
 * @file tls_server.c
 * @brief Handshake message processing (TLS server)
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
#include "tls.h"
#include "tls_cipher_suites.h"
#include "tls_server.h"
#include "tls_common.h"
#include "tls_record.h"
#include "tls_cache.h"
#include "tls_misc.h"
#include "x509.h"
#include "pem.h"
#include "date_time.h"
#include "debug.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED && TLS_SERVER_SUPPORT == ENABLED)


/**
 * @brief TLS server handshake
 *
 * TLS handshake protocol is responsible for the authentication
 * and key exchange necessary to establish a secure session
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsServerHandshake(TlsContext *context)
{
   error_t error;

   //The client initiates the TLS handshake by sending
   //a ClientHello message to the server
   context->state = TLS_STATE_CLIENT_HELLO;

   //Wait for the handshake to complete
   while(context->state != TLS_STATE_APPLICATION_DATA)
   {
      //The TLS handshake is implemented as a state machine
      //representing the current location in the protocol
      switch(context->state)
      {
      //Send ServerHello message?
      case TLS_STATE_SERVER_HELLO:
         //The server will send this message in response to a ClientHello
         //message when it was able to find an acceptable set of algorithms
         error = tlsSendServerHello(context);
         break;
      //Send Certificate message?
      case TLS_STATE_SERVER_CERTIFICATE:
         //The server must send a Certificate message whenever the agreed-
         //upon key exchange method uses certificates for authentication. This
         //message will always immediately follow the ServerHello message
         error = tlsSendCertificate(context);
         break;
      //Send ServerKeyExchange message?
      case TLS_STATE_SERVER_KEY_EXCHANGE:
         //The ServerKeyExchange message is sent by the server only when the
         //server Certificate message (if sent) does not contain enough data
         //to allow the client to exchange a premaster secret
         error = tlsSendServerKeyExchange(context);
         break;
      //Send Certificate message?
      case TLS_STATE_CERTIFICATE_REQUEST:
         //A non-anonymous server can optionally request a certificate from the
         //client, if appropriate for the selected cipher suite. This message,
         //if sent, will immediately follow the ServerKeyExchange message
         error = tlsSendCertificateRequest(context);
         break;
      //Send ServerHelloDone message?
      case TLS_STATE_SERVER_HELLO_DONE:
         //The ServerHelloDone message is sent by the server to indicate the
         //end of the ServerHello and associated messages
         error = tlsSendServerHelloDone(context);
         break;
      //Send ChangeCipherSpec message?
      case TLS_STATE_SERVER_CHANGE_CIPHER_SPEC:
         //The ChangeCipherSpec message is sent by the server and to notify the
         //client that subsequent records will be protected under the newly
         //negotiated CipherSpec and keys
         error = tlsSendChangeCipherSpec(context);
         break;
      //Send Finished message?
      case TLS_STATE_SERVER_FINISHED:
         //A Finished message is always sent immediately after a changeCipherSpec
         //message to verify that the key exchange and authentication processes
         //were successful
         error = tlsSendFinished(context);
         break;
      //Wait for a message from the client?
      case TLS_STATE_CLIENT_HELLO:
      case TLS_STATE_CLIENT_CERTIFICATE:
      case TLS_STATE_CLIENT_KEY_EXCHANGE:
      case TLS_STATE_CERTIFICATE_VERIFY:
      case TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC:
      case TLS_STATE_CLIENT_FINISHED:
         //Parse incoming handshake message
         error = tlsParseClientMessage(context);
         break;
      //A fatal error was encountered?
      case TLS_STATE_FATAL_ERROR:
         //Debug message
         TRACE_WARNING("TLS handshake failure!\r\n");
         //Terminate immediately the connection
         error = ERROR_HANDSHAKE_FAILED;
         break;
      //Invalid state?
      default:
         //Report an error and exit immediately
         error = ERROR_UNEXPECTED_STATE;
         break;
      }

      //Abort TLS handshake if an error was encountered
      if(error)
      {
         //Send an alert message to the client
         tlsProcessError(context, error);
         //Exit immediately
         break;
      }
   }

   //Successful TLS handshake?
   if(!error)
   {
      //Save current session in the session cache for further reuse
      tlsSaveToCache(context);
   }

   //Return status code
   return error;
}


/**
 * @brief Parse incoming handshake message
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsParseClientMessage(TlsContext *context)
{
   error_t error;
   size_t length;
   void *message;
   TlsContentType contentType;

   //A message can be fragmented across several records...
   error = tlsReadProtocolData(context, &message, &length, &contentType);
   //Any error to report?
   if(error) return error;

   //Handshake message received?
   if(contentType == TLS_TYPE_HANDSHAKE)
   {
      //Check handshake message type
      switch(((TlsHandshake *) message)->msgType)
      {
      //ClientHello message received?
      case TLS_TYPE_CLIENT_HELLO:
         //When a client first connects to a server, it is required to send
         //the ClientHello as its first message
         error = tlsParseClientHello(context, message, length);
         break;
      //Certificate message received?
      case TLS_TYPE_CERTIFICATE:
         //This is the first message the client can send after receiving a
         //ServerHelloDone message. This message is only sent if the server
         //requests a certificate
         error = tlsParseCertificate(context, message, length);
         break;
      //ClientKeyExchange message received?
      case TLS_TYPE_CLIENT_KEY_EXCHANGE:
         //This message is always sent by the client. It must immediately
         //follow the client certificate message, if it is sent. Otherwise,
         //it must be the first message sent by the client after it receives
         //the ServerHelloDone message
         error = tlsParseClientKeyExchange(context, message, length);
         break;
      //CertificateVerify message received?
      case TLS_TYPE_CERTIFICATE_VERIFY:
         //This message is used to provide explicit verification of a client
         //certificate. This message is only sent following a client certificate
         //that has signing capability. When sent, it must immediately follow
         //the clientKeyExchange message
         error = tlsParseCertificateVerify(context, message, length);
         break;
      //Finished message received?
      case TLS_TYPE_FINISHED:
         //A Finished message is always sent immediately after a changeCipherSpec
         //message to verify that the key exchange and authentication processes
         //were successful
         error = tlsParseFinished(context, message, length);
         break;
      //Invalid handshake message received?
      default:
         //Report an error
         error = ERROR_UNEXPECTED_MESSAGE;
         break;
      }
   }
   //ChangeCipherSpec message received?
   else if(contentType == TLS_TYPE_CHANGE_CIPHER_SPEC)
   {
      //The ChangeCipherSpec message is sent by the client and to notify the
      //server that subsequent records will be protected under the newly
      //negotiated CipherSpec and keys
      error = tlsParseChangeCipherSpec(context, message, length);
   }
   //Alert message received?
   else if(contentType == TLS_TYPE_ALERT)
   {
      //Parse Alert message
      error = tlsParseAlert(context, message, length);
   }
   //Application data received?
   else
   {
      //The client cannot transmit application data
      //before the handshake is completed
      error = ERROR_UNEXPECTED_MESSAGE;
   }

   //Advance read index
   context->rxBufferReadIndex += length;
   //Number of bytes still pending in the receive buffer
   context->rxBufferLength -= length;

   //Return status code
   return error;
}


/**
 * @brief Send ServerHello message
 *
 * The server will send this message in response to a ClientHello
 * message when it was able to find an acceptable set of algorithms.
 * If it cannot find such a match, it will respond with a handshake
 * failure alert
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendServerHello(TlsContext *context)
{
   error_t error;
   size_t length;
   uint8_t *p;
   TlsServerHello *message;
   TlsExtensions *extensionList;

   //Get current time
   uint32_t t = (uint32_t) getCurrentUnixTime();

   //Generate the server random value. The first four bytes code
   //the current time and date in standard Unix format
   context->serverRandom.gmtUnixTime = htonl(t);

   //The last 28 bytes contain securely-generated random bytes
   error = context->prngAlgo->read(context->prngContext,
      context->serverRandom.randomBytes, 28);
   //Any error to report?
   if(error) return error;

   //Point to the ServerHello message
   message = (TlsServerHello *) (context->txBuffer + sizeof(TlsRecord));
   //Format message header
   message->msgType = TLS_TYPE_SERVER_HELLO;

   //This field contains the lower of the version suggested by the client
   //in the ClientHello and the highest supported by the server
   message->serverVersion = htons(context->version);

   //Server random value
   message->random = context->serverRandom;

   //Point to the session ID
   p = (uint8_t *) message + sizeof(TlsServerHello);
   //Initialize byte counter
   length = sizeof(TlsServerHello);

#if (TLS_SESSION_RESUME_SUPPORT == ENABLED)
   //The SessionID uniquely identifies the current session
   memcpy(message->sessionId.value, context->sessionId, context->sessionIdLength);
   message->sessionId.length = context->sessionIdLength;
#else
   //The server may return an empty session ID to indicate that the session
   //will not be cached and therefore cannot be resumed
   message->sessionId.length = 0;
#endif

   //Debug message
   TRACE_INFO("Session ID (%" PRIu8 " bytes):\r\n", message->sessionId.length);
   TRACE_INFO_ARRAY("  ", message->sessionId.value, message->sessionId.length);

   //Advance data pointer
   p += message->sessionId.length;
   //Adjust the length of the message
   length += message->sessionId.length;

   //The single cipher suite selected by the server
   STORE16BE(context->cipherSuite, p);
   //Advance data pointer
   p += sizeof(TlsCipherSuite);
   //Adjust the length of the message
   length += sizeof(TlsCipherSuite);

   //The single compression algorithm selected by the server
   *p = context->compressionMethod;
   //Advance data pointer
   p += sizeof(TlsCompressionMethod);
   //Adjust the length of the message
   length += sizeof(TlsCompressionMethod);

   //Only extensions offered by the client can appear in the server's list
   extensionList = (TlsExtensions *) p;
   //Total length of the extension list
   extensionList->length = 0;

   //Point to the next field
   p += sizeof(TlsExtensions);
   //Total length of the message
   length += sizeof(TlsExtensions);

#if (TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED || TLS_ECDH_ANON_SUPPORT == ENABLED)
   //A server that selects an ECC cipher suite in response to a ClientHello
   //message including an EcPointFormats extension appends this extension
   //to its ServerHello message
   if(tlsIsEccCipherSuite(context->cipherSuite) && context->ecPointFormatExtFound)
   {
      uint_t n;
      TlsExtension *extension;
      TlsEcPointFormatList *ecPointFormatList;

      //Add the EcPointFormats extension
      extension = (TlsExtension *) p;
      //Type of the extension
      extension->type = HTONS(TLS_EXT_EC_POINT_FORMATS);

      //Point to the list of supported EC point formats
      ecPointFormatList = (TlsEcPointFormatList *) extension->value;
      //Items in the list are ordered according to server's preferences
      n = 0;

      //The server can parse only the uncompressed point format...
      ecPointFormatList->value[n++] = TLS_EC_POINT_FORMAT_UNCOMPRESSED;
      //Fix the length of the list
      ecPointFormatList->length = n;

      //Consider the 2-byte length field that precedes the list
      n += sizeof(TlsEcPointFormatList);
      //Fix the length of the extension
      extension->length = htons(n);

      //Compute the length, in bytes, of the EcPointFormats extension
      n += sizeof(TlsExtension);
      //Fix the length of the extension list
      extensionList->length += n;

      //Point to the next field
      p += n;
      //Total length of the message
      length += n;
   }
#endif

   //Convert the length of the extension list to network byte order
   extensionList->length = htons(extensionList->length);

   //Fix the length field
   STORE24BE(length - sizeof(TlsHandshake), message->length);

   //Debug message
   TRACE_INFO("Sending ServerHello message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send handshake message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
   //Failed to send TLS record?
   if(error) return error;

#if (TLS_SESSION_RESUME_SUPPORT == ENABLED)
   //Use abbreviated handshake?
   if(context->resume)
   {
      //Derive session keys from the master secret
      error = tlsGenerateKeys(context);
      //Unable to generate key material?
      if(error) return error;

      //At this point, both client and server must send ChangeCipherSpec
      //messages and proceed directly to Finished messages
      context->state = TLS_STATE_SERVER_CHANGE_CIPHER_SPEC;
   }
   else
#endif
   {
      //Perform a full handshake
      context->state = TLS_STATE_SERVER_CERTIFICATE;
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send ServerKeyExchange message
 *
 * The ServerKeyExchange message is sent by the server only when the
 * server Certificate message does not contain enough data to allow
 * the client to exchange a premaster secret
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendServerKeyExchange(TlsContext *context)
{
   error_t error;
   size_t length;
   size_t n;
   uint8_t *p;
   TlsServerKeyExchange *message;

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_DHE_DSS_SUPPORT == ENABLED || TLS_DH_ANON_SUPPORT == ENABLED)
   //Diffie-Hellman key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS ||
      context->keyExchMethod == TLS_KEY_EXCH_DH_ANON)
   {
      //Point to the ServerKeyExchange message
      message = (TlsServerKeyExchange *) (context->txBuffer + sizeof(TlsRecord));
      //Format message header
      message->msgType = TLS_TYPE_SERVER_KEY_EXCHANGE;

      //Generate an ephemeral key pair
      error = dhGenerateKeyPair(&context->dhContext, context->prngAlgo, context->prngContext);
      //Any error to report?
      if(error) return error;

      //Debug message
      TRACE_DEBUG("Diffie-Hellman parameters:\r\n");
      TRACE_DEBUG("  Prime modulus:\r\n");
      TRACE_DEBUG_MPI("    ", &context->dhContext.params.p);
      TRACE_DEBUG("  Generator:\r\n");
      TRACE_DEBUG_MPI("    ", &context->dhContext.params.g);
      TRACE_DEBUG("  Server public value:\r\n");
      TRACE_DEBUG_MPI("    ", &context->dhContext.ya);

      //Point to the server's key exchange parameters
      p = message->params;

      //Encode the prime modulus to an opaque vector
      error = tlsWriteMpi(&context->dhContext.params.p, p, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Initialize byte counter
      length = n;

      //Encode the generator to an opaque vector
      error = tlsWriteMpi(&context->dhContext.params.g, p, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Adjust byte counter
      length += n;

      //Encode the server's public value to an opaque vector
      error = tlsWriteMpi(&context->dhContext.ya, p, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Compute the total length of the key exchange parameters
      length += n;
   }
   else
#endif
#if (TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED || TLS_ECDH_ANON_SUPPORT == ENABLED)
   //ECDH key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDH_ANON)
   {
      const EcCurveInfo *curveInfo;

      //Point to the ServerKeyExchange message
      message = (TlsServerKeyExchange *) (context->txBuffer + sizeof(TlsRecord));
      //Format message header
      message->msgType = TLS_TYPE_SERVER_KEY_EXCHANGE;

      //Retrieve the elliptic curve to be used
      curveInfo = tlsGetCurveInfo(context->namedCurve);
      //Any error to report?
      if(curveInfo == NULL)
         return ERROR_FAILURE;

      //Load EC domain parameters
      error = ecLoadDomainParameters(&context->ecdhContext.params, curveInfo);
      //Failed to load parameters
      if(error) return error;

      //Generate an ephemeral key pair
      error = ecdhGenerateKeyPair(&context->ecdhContext, context->prngAlgo, context->prngContext);
      //Any error to report?
      if(error) return error;

      //Debug message
      TRACE_DEBUG("  Server public key X:\r\n");
      TRACE_DEBUG_MPI("    ", &context->ecdhContext.qa.x);
      TRACE_DEBUG("  Server public key Y:\r\n");
      TRACE_DEBUG_MPI("    ", &context->ecdhContext.qa.y);

      //Point to the server's key exchange parameters
      p = message->params;

      //Set the type of the elliptic curve domain parameters
      *p = TLS_EC_CURVE_TYPE_NAMED_CURVE;

      //Advance data pointer
      p += sizeof(uint8_t);
      //Initialize byte counter
      length = sizeof(uint8_t);

      //Get elliptic curve identifier
      STORE16BE(context->namedCurve, p);

      //Advance data pointer
      p += sizeof(uint16_t);
      //Adjust byte counter
      length += sizeof(uint16_t);

      //Write server's public key
      error = tlsWriteEcPoint(&context->ecdhContext.params,
         &context->ecdhContext.qa, p, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p +=n;
      //Compute the total length of the key exchange parameters
      length += n;
   }
   else
#endif
   //Any other key exchange method?
   {
      //Skip ServerKeyExchange message
      context->state = TLS_STATE_CERTIFICATE_REQUEST;
      //Successful processing
      return NO_ERROR;
   }

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_DHE_DSS_SUPPORT == ENABLED || \
   TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED)
   //For non-anonymous Diffie-Hellman and ECDH key exchanges, a signature
   //over the server's key exchange parameters shall be generated
   if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA)
   {
#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= TLS_VERSION_1_1)
      //SSL 3.0, TLS 1.0 or TLS 1.1 currently selected?
      if(context->version <= TLS_VERSION_1_1)
      {
         //Point to the digitally-signed element
         TlsDigitalSignature *signature = (TlsDigitalSignature *) p;

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_RSA_SUPPORT == ENABLED)
         //Check whether DHE_RSA or ECDHE_RSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
            context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA)
         {
            Md5Context *md5Context;
            Sha1Context *sha1Context;
            RsaPrivateKey privateKey;

            //Allocate a memory buffer to hold the MD5 context
            md5Context = osMemAlloc(sizeof(Md5Context));
            //Failed to allocate memory?
            if(!md5Context) return ERROR_OUT_OF_MEMORY;

            //Compute MD5(ClientHello.random + ServerHello.random + ServerDhParams)
            md5Init(md5Context);
            md5Update(md5Context, context->random, 64);
            md5Update(md5Context, message->params, length);
            md5Final(md5Context, context->verifyData);
            //Release previously allocated memory
            osMemFree(md5Context);

            //Allocate a memory buffer to hold the SHA-1 context
            sha1Context = osMemAlloc(sizeof(Sha1Context));
            //Failed to allocate memory?
            if(!sha1Context) return ERROR_OUT_OF_MEMORY;

            //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
            sha1Init(sha1Context);
            sha1Update(sha1Context, context->random, 64);
            sha1Update(sha1Context, message->params, length);
            sha1Final(sha1Context, context->verifyData + MD5_DIGEST_SIZE);
            //Release previously allocated memory
            osMemFree(sha1Context);

            //Initialize RSA private key
            rsaInitPrivateKey(&privateKey);

            //Decode the PEM structure that holds the RSA private key
            error = pemReadRsaPrivateKey(context->cert->privateKey,
               context->cert->privateKeyLength, &privateKey);

            //Check status code
            if(!error)
            {
               //Sign the key exchange parameters using RSA
               error = tlsGenerateRsaSignature(&privateKey,
                  context->verifyData, signature->value, &n);
            }

            //Release previously allocated resources
            rsaFreePrivateKey(&privateKey);
         }
         else
#endif
#if (TLS_DHE_DSS_SUPPORT == ENABLED)
         //Check whether DHE_DSS key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS)
         {
            Sha1Context *sha1Context;
            DsaPrivateKey privateKey;

            //Allocate a memory buffer to hold the SHA-1 context
            sha1Context = osMemAlloc(sizeof(Sha1Context));
            //Failed to allocate memory?
            if(!sha1Context) return ERROR_OUT_OF_MEMORY;

            //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
            sha1Init(sha1Context);
            sha1Update(sha1Context, context->random, 64);
            sha1Update(sha1Context, message->params, length);
            sha1Final(sha1Context, NULL);

            //Initialize DSA private key
            dsaInitPrivateKey(&privateKey);

            //Decode the PEM structure that holds the DSA private key
            error = pemReadDsaPrivateKey(context->cert->privateKey,
               context->cert->privateKeyLength, &privateKey);

            //Check status code
            if(!error)
            {
               //Sign the key exchange parameters using DSA
               error = tlsGenerateDsaSignature(context->prngAlgo, context->prngContext,
                  &privateKey, sha1Context->digest, SHA1_DIGEST_SIZE, signature->value, &n);
            }

            //Release previously allocated memory
            osMemFree(sha1Context);
            dsaFreePrivateKey(&privateKey);
         }
         else
#endif
#if (TLS_ECDHE_ECDSA_SUPPORT == ENABLED)
         //Check whether ECDHE_ECDSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA)
         {
            Sha1Context *sha1Context;
            EcDomainParameters params;
            Mpi privateKey;

            //Allocate a memory buffer to hold the SHA-1 context
            sha1Context = osMemAlloc(sizeof(Sha1Context));
            //Failed to allocate memory?
            if(!sha1Context) return ERROR_OUT_OF_MEMORY;

            //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
            sha1Init(sha1Context);
            sha1Update(sha1Context, context->random, 64);
            sha1Update(sha1Context, message->params, length);
            sha1Final(sha1Context, NULL);

            //Initialize EC domain parameters
            ecInitDomainParameters(&params);
            //Initialize EC private key
            mpiInit(&privateKey);

            //Decode the PEM structure that holds the EC domain parameters
            error = pemReadEcParameters(context->cert->privateKey,
               context->cert->privateKeyLength, &params);

            //Check status code
            if(!error)
            {
               //Decode the PEM structure that holds the EC private key
               error = pemReadEcPrivateKey(context->cert->privateKey,
                  context->cert->privateKeyLength, &privateKey);
            }

            //Check status code
            if(!error)
            {
               //Sign the key exchange parameters using ECDSA
               error = tlsGenerateEcdsaSignature(&params, context->prngAlgo,
                  context->prngContext, &privateKey, sha1Context->digest,
                  SHA1_DIGEST_SIZE, signature->value, &n);
            }

            //Release previously allocated memory
            osMemFree(sha1Context);
            ecFreeDomainParameters(&params);
            mpiFree(&privateKey);
         }
         else
#endif
         //Invalid signature algorithm?
         {
            //Report an error
            error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
         }

         //Signature generation failed?
         if(error) return error;

         //Fix the length of the digitally-signed element
         signature->length = htons(n);
         //Adjust the length of the message
         length += sizeof(TlsDigitalSignature) + n;
      }
      else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
      //TLS 1.2 currently selected?
      if(context->version == TLS_VERSION_1_2)
      {
         const HashAlgo *hashAlgo;
         HashContext *hashContext;

         //Point to the digitally-signed element
         TlsDigitalSignature2 *signature = (TlsDigitalSignature2 *) p;

         //Retrieve the hash algorithm used for signing
         hashAlgo = tlsGetHashAlgo(context->signHashAlgo);
         //Hash algorithm not supported?
         if(!hashAlgo) return ERROR_INVALID_SIGNATURE;

         //Allocate a memory buffer to hold the hash context
         hashContext = osMemAlloc(hashAlgo->contextSize);
         //Failed to allocate memory?
         if(!hashContext) return ERROR_OUT_OF_MEMORY;

         //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
         hashAlgo->init(hashContext);
         hashAlgo->update(hashContext, context->random, 64);
         hashAlgo->update(hashContext, message->params, length);
         hashAlgo->final(hashContext, NULL);

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_RSA_SUPPORT == ENABLED)
         //Check whether DHE_RSA or ECDHE_RSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
            context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA)
         {
            RsaPrivateKey privateKey;

            //Set the relevant signature algorithm
            signature->algorithm.signature = TLS_SIGN_ALGO_RSA;
            signature->algorithm.hash = context->signHashAlgo;

            //Initialize RSA private key
            rsaInitPrivateKey(&privateKey);

            //Decode the PEM structure that holds the RSA private key
            error = pemReadRsaPrivateKey(context->cert->privateKey,
               context->cert->privateKeyLength, &privateKey);

            //Check status code
            if(!error)
            {
               //Use the signature algorithm defined in PKCS #1 v1.5
               error = rsassaPkcs1v15Sign(&privateKey, hashAlgo,
                  hashContext->digest, signature->value, &n);
            }

            //Release previously allocated resources
            rsaFreePrivateKey(&privateKey);
         }
         else
#endif
#if (TLS_DHE_DSS_SUPPORT == ENABLED)
         //Check whether DHE_DSS key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS)
         {
            DsaPrivateKey privateKey;

            //Set the relevant signature algorithm
            signature->algorithm.signature = TLS_SIGN_ALGO_DSA;
            signature->algorithm.hash = context->signHashAlgo;

            //Initialize DSA private key
            dsaInitPrivateKey(&privateKey);

            //Decode the PEM structure that holds the DSA private key
            error = pemReadDsaPrivateKey(context->cert->privateKey,
               context->cert->privateKeyLength, &privateKey);

            //Check status code
            if(!error)
            {
               //Sign the key exchange parameters using DSA
               error = tlsGenerateDsaSignature(context->prngAlgo, context->prngContext,
                  &privateKey, hashContext->digest, hashAlgo->digestSize, signature->value, &n);
            }

            //Release previously allocated resources
            dsaFreePrivateKey(&privateKey);
         }
         else
#endif
#if (TLS_ECDHE_ECDSA_SUPPORT == ENABLED)
         //Check whether ECDHE_ECDSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA)
         {
            EcDomainParameters params;
            Mpi privateKey;

            //Set the relevant signature algorithm
            signature->algorithm.signature = TLS_SIGN_ALGO_ECDSA;
            signature->algorithm.hash = context->signHashAlgo;

            //Initialize EC domain parameters
            ecInitDomainParameters(&params);
            //Initialize EC private key
            mpiInit(&privateKey);

            //Decode the PEM structure that holds the EC domain parameters
            error = pemReadEcParameters(context->cert->privateKey,
               context->cert->privateKeyLength, &params);

            //Check status code
            if(!error)
            {
               //Decode the PEM structure that holds the EC private key
               error = pemReadEcPrivateKey(context->cert->privateKey,
                  context->cert->privateKeyLength, &privateKey);
            }

            //Check status code
            if(!error)
            {
               //Sign the key exchange parameters using ECDSA
               error = tlsGenerateEcdsaSignature(&params, context->prngAlgo,
                  context->prngContext, &privateKey, hashContext->digest,
                  hashAlgo->digestSize, signature->value, &n);
            }

            //Release previously allocated memory
            ecFreeDomainParameters(&params);
            mpiFree(&privateKey);
         }
         else
#endif
         //Invalid signature algorithm?
         {
            //Report an error
            error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
         }

         //Release previously allocated memory
         osMemFree(hashContext);

         //Fix the length of the digitally-signed element
         signature->length = htons(n);
         //Adjust the length of the message
         length += sizeof(TlsDigitalSignature2) + n;
      }
      else
#endif
      {
         //The negotiated TLS version is not valid
         error = ERROR_INVALID_VERSION;
      }
   }

   //Signature generation failed?
   if(error) return error;
#endif

   //Fix message header
   STORE24BE(length, message->length);
   //Length of the complete handshake message
   length += sizeof(TlsHandshake);

   //Debug message
   TRACE_INFO("Sending ServerKeyExchange message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send handshake message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
   //Failed to send TLS record?
   if(error) return error;

   //Prepare to send a CertificateRequest message...
   context->state = TLS_STATE_CERTIFICATE_REQUEST;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send CertificateRequest message
 *
 * A server can optionally request a certificate from the client, if
 * appropriate for the selected cipher suite. This message will
 * immediately follow the ServerKeyExchange message
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendCertificateRequest(TlsContext *context)
{
   error_t error;
   size_t n;
   size_t length;
   uint8_t *p;
   const char_t *pemCert;
   size_t pemCertLength;
   uint8_t *derCert;
   size_t derCertSize;
   size_t derCertLength;
   X509CertificateInfo *certInfo;
   TlsCertificateRequest *message;
   TlsCertAuthorities *certAuthorities;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED || TLS_DSA_SIGN_SUPPORT == ENABLED || TLS_ECDSA_SIGN_SUPPORT == ENABLED)
   //A server can optionally request a certificate from the client
   if(context->clientAuthMode != TLS_CLIENT_AUTH_NONE &&
      context->keyExchMethod != TLS_KEY_EXCH_DH_ANON &&
      context->keyExchMethod != TLS_KEY_EXCH_ECDH_ANON)
   {
      //Point to the CertificateRequest message
      message = (TlsCertificateRequest *) (context->txBuffer + sizeof(TlsRecord));
      //Format message header
      message->msgType = TLS_TYPE_CERTIFICATE_REQUEST;

      //Enumerate the types of certificate types that the client may offer
      n = 0;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
      //Accept certificates that contain a RSA public key
      message->certificateTypes.value[n++] = TLS_CERT_RSA_SIGN;
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
      //Accept certificates that contain a DSA public key
      message->certificateTypes.value[n++] = TLS_CERT_DSS_SIGN;
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
      //Accept certificates that contain an ECDSA public key
      message->certificateTypes.value[n++] = TLS_CERT_ECDSA_SIGN;
#endif

      //Set the length of the list
      message->certificateTypes.length = n;
      //Total length of the message
      length = sizeof(TlsCertificateRequest) + n;

#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
      //Check whether TLS 1.2 is currently used
      if(context->version == TLS_VERSION_1_2)
      {
         //Point to the list of the hash/signature algorithm pairs that
         //the server is able to verify
         TlsSignHashAlgos *supportedSignAlgos = PTR_OFFSET(message, length);

         //Enumerate the hash/signature algorithm pairs in descending
         //order of preference
         n = 0;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
         //SHA-1 with RSA is always supported
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA1;

         //The hash algorithm used for PRF operations can also be used for signing
         if(context->prfHashAlgo == SHA256_HASH_ALGO)
         {
            //SHA-256 with RSA is supported
            supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
            supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA256;
         }
#if (TLS_SHA384_SUPPORT == ENABLED)
         else if(context->prfHashAlgo == SHA384_HASH_ALGO)
         {
            //SHA-384 with RSA is supported
            supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
            supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA384;
         }
#endif
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
         //DSA with SHA-1 is always supported
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_DSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA1;

         //The hash algorithm used for PRF operations can also be used for signing
         if(context->prfHashAlgo == SHA256_HASH_ALGO)
         {
            //DSA with SHA-256 is supported
            supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_DSA;
            supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA256;
         }
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
         //ECDSA with SHA-1 is always supported
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA1;

         //The hash algorithm used for PRF operations can also be used for signing
         if(context->prfHashAlgo == SHA256_HASH_ALGO)
         {
            //ECDSA with SHA-256 is supported
            supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
            supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA256;
         }
#if (TLS_SHA384_SUPPORT == ENABLED)
         else if(context->prfHashAlgo == SHA384_HASH_ALGO)
         {
            //ECDSA with SHA-384 is supported
            supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
            supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA384;
         }
#endif
#endif
         //Fix the length of the list
         supportedSignAlgos->length = htons(n * sizeof(TlsSignHashAlgo));
         //Total length of the message
         length += sizeof(TlsSignHashAlgos) + n * sizeof(TlsSignHashAlgo);
      }
#endif

      //Point to the list of the distinguished names of acceptable
      //certificate authorities
      certAuthorities = PTR_OFFSET(message, length);
      //Total length of the message
      length += sizeof(TlsCertAuthorities);

      //Point to the first certificate authority
      p = certAuthorities->value;
      //Length of the list in bytes
      n = 0;

      //Point to the first trusted CA certificate
      pemCert = context->trustedCaList;
      //Get the total length, in bytes, of the trusted CA list
      pemCertLength = context->trustedCaListLength;

      //DER encoded certificate
      derCert = NULL;
      derCertSize = 0;
      derCertLength = 0;

      //Allocate a memory buffer to store X.509 certificate info
      certInfo = osMemAlloc(sizeof(X509CertificateInfo));
      //Failed to allocate memory?
      if(!certInfo) return ERROR_OUT_OF_MEMORY;

      //Loop through the list of trusted CA certificates
      while(pemCertLength > 0)
      {
         //Decode PEM certificate
         error = pemReadCertificate(&pemCert, &pemCertLength,
            &derCert, &derCertSize, &derCertLength);
         //Any error to report?
         if(error) break;

         //Parse X.509 certificate
         error = x509ParseCertificate(derCert, derCertLength, certInfo);
         //Failed to parse the X.509 certificate?
         if(error) break;

         //Total length of the message
         length += certInfo->subject.rawDataLen + 2;

         //Prevent the buffer from overflowing
         if(length > TLS_MAX_PROTOCOL_DATA_LENGTH)
            return ERROR_MESSAGE_TOO_LONG;

         //Each distinguished name is preceded by a 2-byte length field
         STORE16BE(certInfo->subject.rawDataLen, p);
         //The distinguished name shall be DER encoded
         memcpy(p + 2, certInfo->subject.rawData, certInfo->subject.rawDataLen);

         //Advance data pointer
         p += certInfo->subject.rawDataLen + 2;
         //Adjust the length of the list
         n += certInfo->subject.rawDataLen + 2;
      }

      //Free previously allocated memory
      osMemFree(derCert);
      osMemFree(certInfo);

      //Fix the length of the list
      certAuthorities->length = htons(n);

      //Fix message header
      STORE24BE(length - sizeof(TlsHandshake), message->length);

      //Debug message
      TRACE_INFO("Sending CertificateRequest message (%" PRIuSIZE " bytes)...\r\n", length);
      TRACE_DEBUG_ARRAY("  ", message, length);

      //Send handshake message
      error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
      //Failed to send TLS record?
      if(error) return error;
   }
#endif

   //Prepare to send a ServerHelloDone message...
   context->state = TLS_STATE_SERVER_HELLO_DONE;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send ServerHelloDone message
 *
 * The ServerHelloDone message is sent by the server to indicate the
 * end of the ServerHello and associated messages. After sending this
 * message, the server will wait for a client response
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendServerHelloDone(TlsContext *context)
{
   error_t error;
   size_t length;
   TlsServerHelloDone *message;

   //Point to the ServerHelloDone message
   message = (TlsServerHelloDone *) (context->txBuffer + sizeof(TlsRecord));
   //Format message header
   message->msgType = TLS_TYPE_SERVER_HELLO_DONE;

   //The ServerHelloDone message does not contain any data
   STORE24BE(0, message->length);
   //Length of the complete handshake message
   length = sizeof(TlsHandshake);

   //Debug message
   TRACE_INFO("Sending ServerHelloDone message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send handshake message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
   //Failed to send TLS record?
   if(error) return error;

   //The client must send a Certificate message if the server requests it
   if(context->clientAuthMode != TLS_CLIENT_AUTH_NONE)
      context->state = TLS_STATE_CLIENT_CERTIFICATE;
   else
      context->state = TLS_STATE_CLIENT_KEY_EXCHANGE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse ClientHello message
 *
 * When a client first connects to a server, it is required to send
 * the ClientHello as its first message. The client can also send a
 * ClientHello in response to a HelloRequest or on its own initiative
 * in order to renegotiate the security parameters in an existing
 * connection
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming ClientHello message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseClientHello(TlsContext *context, const TlsClientHello *message, size_t length)
{
   error_t error;
   size_t i;
   size_t j;
   size_t k;
   size_t n;
   bool_t acceptable;
   uint8_t certType;
   const uint8_t *p;
   const TlsCipherSuites *cipherSuites;
   const TlsCompressionMethods *compressionMethods;
   const TlsExtension *extension;
   const TlsSignHashAlgos *supportedSignAlgos;
   const TlsEllipticCurveList *curveList;

   //Debug message
   TRACE_INFO("ClientHello message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ClientHello message
   if(length < sizeof(TlsClientHello))
      return ERROR_DECODING_FAILED;

   //Check current state
   if(context->state != TLS_STATE_CLIENT_HELLO)
      return ERROR_UNEXPECTED_MESSAGE;

   //Point to the session ID
   p = (uint8_t *) message + sizeof(TlsClientHello);
   //Remaining bytes to process
   n = length - sizeof(TlsClientHello);

   //Check the length of the session ID
   if(message->sessionId.length > n)
      return ERROR_DECODING_FAILED;
   if(message->sessionId.length > 32)
      return ERROR_ILLEGAL_PARAMETER;

   //Debug message
   TRACE_INFO("Session ID (%" PRIu8 " bytes):\r\n", message->sessionId.length);
   TRACE_INFO_ARRAY("  ", message->sessionId.value, message->sessionId.length);

   //Point to the next field
   p += message->sessionId.length;
   //Remaining bytes to process
   n -= message->sessionId.length;

   //Malformed ClientHello message?
   if(n < sizeof(TlsCipherSuites))
      return ERROR_DECODING_FAILED;

   //List of cryptographic algorithms supported by the client
   cipherSuites = (TlsCipherSuites *) p;
   //Remaining bytes to process
   n -= sizeof(TlsCipherSuites);

   //Check the length of the list
   if(ntohs(cipherSuites->length) < 2)
      return ERROR_ILLEGAL_PARAMETER;
   if(ntohs(cipherSuites->length) > n)
      return ERROR_DECODING_FAILED;

   //Get the number of cipher suite identifiers present in the list
   k = ntohs(cipherSuites->length) / 2;

   //Debug message
   TRACE_DEBUG("Cipher suites:\r\n");

   //Dump the list of cipher suites
   for(i = 0; i < k; i++)
   {
      //Debug message
      TRACE_DEBUG("  0x%04" PRIX16 " (%s)\r\n", ntohs(cipherSuites->value[i]),
         tlsGetCipherSuiteName(ntohs(cipherSuites->value[i])));
   }

   //Point to the next field
   p += sizeof(TlsCipherSuites) + ntohs(cipherSuites->length);
   //Remaining bytes to process
   n -= ntohs(cipherSuites->length);

   //Malformed ClientHello message?
   if(n < sizeof(TlsCompressionMethods))
      return ERROR_DECODING_FAILED;

   //List of compression algorithms supported by the client
   compressionMethods = (TlsCompressionMethods *) p;
   //Remaining bytes to process
   n -= sizeof(TlsCompressionMethods);

   //Check the length of the list
   if(compressionMethods->length < 1)
      return ERROR_ILLEGAL_PARAMETER;
   if(compressionMethods->length > n)
      return ERROR_DECODING_FAILED;

   //Point to the next field
   p += sizeof(TlsCompressionMethods) + compressionMethods->length;
   //Remaining bytes to process
   n -= compressionMethods->length;

   //Parse the list of extensions offered by the client
   extension = tlsGetExtension(p, n, TLS_EXT_ELLIPTIC_CURVES);

   //The EllipticCurves extension was found?
   if(extension)
   {
      //This extension allows a client to enumerate the elliptic curves it supports
      curveList = (TlsEllipticCurveList *) extension->value;

      //Check the length of the list
      if(ntohs(extension->length) < sizeof(TlsEllipticCurveList))
         return ERROR_DECODING_FAILED;
      if(ntohs(extension->length) < (sizeof(TlsEllipticCurveList) + ntohs(curveList->length)))
         return ERROR_DECODING_FAILED;
   }
   else
   {
      //The client may omit the SignatureAlgorithms extension
      curveList = NULL;
   }

   //Parse the list of extensions offered by the client
   extension = tlsGetExtension(p, n, TLS_EXT_EC_POINT_FORMATS);

   //The EcPointFormats extension was found?
   if(extension)
      context->ecPointFormatExtFound = TRUE;
   else
      context->ecPointFormatExtFound = FALSE;

   //Parse the list of extensions offered by the client
   extension = tlsGetExtension(p, n, TLS_EXT_SIGNATURE_ALGORITHMS);

   //The SignatureAlgorithms extension was found?
   if(extension)
   {
      //Point to the list of supported hash/signature algorithm pairs
      supportedSignAlgos = (TlsSignHashAlgos *) extension->value;

      //Check the length of the list
      if(ntohs(extension->length) < sizeof(TlsSignHashAlgos))
         return ERROR_DECODING_FAILED;
      if(ntohs(extension->length) < (sizeof(TlsSignHashAlgos) + ntohs(supportedSignAlgos->length)))
         return ERROR_DECODING_FAILED;
   }
   else
   {
      //The client may omit the SignatureAlgorithms extension
      supportedSignAlgos = NULL;
   }

   //Get the version the client wishes to use during this session
   context->clientVersion = ntohs(message->clientVersion);

   //If a TLS server receives a ClientHello containing a version number
   //greater than the highest version supported by the server, it must
   //reply according to the highest version supported by the server
   error = tlsSetVersion(context, min(context->clientVersion, TLS_MAX_VERSION));
   //The specified TLS version is not supported?
   if(error) return error;

   //Save client random value
   context->clientRandom = message->random;

#if (TLS_SESSION_RESUME_SUPPORT == ENABLED)
   //Check whether session caching is supported
   if(context->cache != NULL)
   {
      //If the session ID was non-empty, the server will look in
      //its session cache for a match
      TlsSession *session = tlsFindCache(context->cache,
         message->sessionId.value, message->sessionId.length);

      //Check whether a matching entry has been found in the cache
      if(session != NULL)
      {
         //Restore session parameters
         tlsRestoreSession(context, session);

         //Select the relevant cipher suite
         error = tlsSetCipherSuite(context, session->cipherSuite);
         //Any error to report?
         if(error) return error;

         //Perform abbreviated handshake
         context->resume = TRUE;
      }
      else
      {
         //Generate a new random ID
         error = context->prngAlgo->read(context->prngContext, context->sessionId, 32);
         //Any error to report?
         if(error) return error;

         //Session ID is limited to 32 bytes
         context->sessionIdLength = 32;
         //Perform a full handshake
         context->resume = FALSE;
      }
   }
   else
#endif
   {
      //This session cannot be resumed
      context->sessionIdLength = 0;
      //Perform a full handshake
      context->resume = FALSE;
   }

   //Full handshake?
   if(!context->resume)
   {
      //Get the size of the cipher suite list
      k = ntohs(cipherSuites->length) / 2;

      //The cipher suite list contains the combinations of cryptographic algorithms
      //supported by the client in order of the client's preference
      for(i = 0; i < k; i++)
      {
         //Check whether the current cipher suite is supported
         error = tlsSetCipherSuite(context, ntohs(cipherSuites->value[i]));

         //Successful processing?
         if(!error)
         {
            //ECC cipher suite?
            if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA ||
               context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA ||
               context->keyExchMethod == TLS_KEY_EXCH_ECDH_ANON)
            {
               //One of the proposed ECC cipher suites must be negotiated only
               //if the server can successfully complete the handshake while
               //using the curves and point formats supported by the client
               error = tlsSelectNamedCurve(context, curveList);
            }
         }

         //Successful processing?
         if(!error)
         {
            //The server requires a valid certificate whenever the agreed-upon
            //key exchange method uses certificates for authentication
            if(context->keyExchMethod == TLS_KEY_EXCH_RSA ||
               context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
               context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA)
            {
               //RSA, DHE_RSA and ECDHE_RSA key exchange methods require a RSA certificate
               certType = TLS_CERT_RSA_SIGN;
            }
            else if(context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS)
            {
               //DHE_DSS key exchange method requires a DSA certificate
               certType = TLS_CERT_DSS_SIGN;
            }
            else if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA)
            {
               //ECDHE_ECDSA key exchange method requires an ECDSA certificate
               certType = TLS_CERT_ECDSA_SIGN;
            }
            else
            {
               //DH_anon and ECDH_anon key exchange methods do not require any certificate
               certType = TLS_CERT_NONE;
            }

            //Check whether a certificate is required
            if(certType != TLS_CERT_NONE)
            {
               //Do not accept the specified cipher suite unless a suitable
               //certificate has been previously loaded by the user
               error = ERROR_NO_CERTIFICATE;

               //Loop through the list of available certificates
               for(j = 0; j < context->numCerts; j++)
               {
                  //Check whether the current certificate is acceptable
                  acceptable = tlsIsCertificateAcceptable(&context->certs[j],
                     &certType, 1, supportedSignAlgos, curveList, NULL);

                  //Is certificate suitable for the the selected cipher suite?
                  if(acceptable)
                  {
                     //The hash algorithm to be used when generating signatures must be
                     //one of those present in the SignatureAlgorithms extension
                     error = tlsSelectSignHashAlgo(context,
                        context->certs[j].signAlgo, supportedSignAlgos);

                     //If all the requirements were met, the certificate can be
                     //used in conjunction with the selected cipher suite
                     if(!error)
                     {
                        context->cert = &context->certs[j];
                        break;
                     }
                  }
               }
            }
         }

         //If the list contains cipher suites the server does not recognize,
         //support, or wish to use, the server must ignore those cipher
         //suites, and process the remaining ones as usual
         if(!error) break;
      }

      //If no acceptable choices are presented, return a handshake failure
      //alert and close the connection
      if(error) return ERROR_HANDSHAKE_FAILED;

      //The list of the compression methods supported by the client
      //is sorted by client preference
      for(i = 0; i < compressionMethods->length; i++)
      {
         //Check whether the algorithm to be used for data compression is supported
         error = tlsSetCompressionMethod(context, compressionMethods->value[i]);

         //If the compression method is not supported, process the remaining ones
         if(!error) break;
      }

      //If no compression algorithm is acceptable, return a handshake failure
      //alert and close the connection
      if(error) return ERROR_HANDSHAKE_FAILED;
   }

   //Initialize handshake message hashing
   error = tlsInitHandshakeHash(context);
   //Any error to report?
   if(error) return error;

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //Prepare to send ServerHello message...
   context->state = TLS_STATE_SERVER_HELLO;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse ClientKeyExchange message
 *
 * This message is always sent by the client. It must immediately
 * follow the client Certificate message, if it is sent. Otherwise,
 * it must be the first message sent by the client after it receives
 * the ServerHelloDone message
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming ClientKeyExchange message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseClientKeyExchange(TlsContext *context, const TlsClientKeyExchange *message, size_t length)
{
   error_t error;
   size_t n;
   const uint8_t *p;

   //Debug message
   TRACE_INFO("ClientKeyExchange message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ClientKeyExchange message
   if(length < sizeof(TlsClientKeyExchange))
      return ERROR_DECODING_FAILED;

   //Check current state
   if(context->state == TLS_STATE_CLIENT_CERTIFICATE)
   {
      //A an non-anonymous server can optionally request a certificate from the client
      if(context->keyExchMethod != TLS_KEY_EXCH_DH_ANON &&
         context->keyExchMethod != TLS_KEY_EXCH_ECDH_ANON)
      {
         //If client authentication is required by the server for the handshake
         //to continue, it may respond with a fatal handshake failure alert
         if(context->clientAuthMode == TLS_CLIENT_AUTH_REQUIRED)
            return ERROR_HANDSHAKE_FAILED;
      }
   }
   else if(context->state != TLS_STATE_CLIENT_KEY_EXCHANGE)
   {
      //Send a fatal alert to the client
      return ERROR_UNEXPECTED_MESSAGE;
   }

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //Point to the exchange keys
   p = message->exchangeKeys;
   //Remaining bytes to process
   length -= sizeof(TlsClientKeyExchange);

#if (TLS_RSA_SUPPORT == ENABLED)
   //RSA key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_RSA)
   {
      uint16_t version;
      RsaPrivateKey privateKey;

      //The RSA-encrypted premaster secret in a ClientKeyExchange is preceded by
      //two length bytes. SSL 3.0 implementations do not include these bytes
      if(context->version > SSL_VERSION_3_0)
      {
         //Malformed ClientKeyExchange message?
         if(length < 2)
            return ERROR_DECODING_FAILED;

         //Decode the length field
         n = LOAD16BE(p);

         //Check the length of the RSA-encrypted premaster secret
         if(n > (length - 2))
            return ERROR_DECODING_FAILED;

         //Save the length of the RSA-encrypted premaster secret
         length = n;
         //Advance the pointer over the length field
         p += 2;
      }

      //Initialize RSA private key
      rsaInitPrivateKey(&privateKey);

      //Decode the PEM structure that holds the RSA private key
      error = pemReadRsaPrivateKey(context->cert->privateKey,
         context->cert->privateKeyLength, &privateKey);
      //Any error to report?
      if(error) return error;

      //Decrypt the premaster secret using the server private key
      error = rsaesPkcs1v15Decrypt(&privateKey, p, length,
         context->premasterSecret, 48, &context->premasterSecretLength);

      //Release RSA private key
      rsaFreePrivateKey(&privateKey);

      //Retrieve the latest version supported by the client. This is used
      //to detect version roll-back attacks
      version = LOAD16BE(context->premasterSecret);

      //The best way to avoid vulnerability to the Bleichenbacher attack is to
      //treat incorrectly formatted messages in a manner indistinguishable from
      //correctly formatted RSA blocks
      if(error || context->premasterSecretLength != 48 || version != context->clientVersion)
      {
         //When it receives an incorrectly formatted RSA block, the server
         //should generate a random 48-byte value and proceed using it as
         //the premaster secret
         error = context->prngAlgo->read(context->prngContext, context->premasterSecret, 48);
         //Any error to report?
         if(error) return error;

         //Fix the length of the premaster secret
         context->premasterSecretLength = 48;
      }
   }
   else
#endif
#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_DHE_DSS_SUPPORT == ENABLED || TLS_DH_ANON_SUPPORT == ENABLED)
   //Diffie-Hellman key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS ||
      context->keyExchMethod == TLS_KEY_EXCH_DH_ANON)
   {
      //Convert the client's public value to a multiple precision integer
      error = tlsReadMpi(&context->dhContext.yb, p, length, &n);
      //Any error to report?
      if(error) return error;

      //Verify client's public value
      error = dhCheckPublicKey(&context->dhContext.params, &context->dhContext.yb);
      //Weak public value?
      if(error) return error;

      //Calculate the negotiated key Z
      error = dhComputeSharedSecret(&context->dhContext, context->premasterSecret,
         sizeof(context->premasterSecret), &context->premasterSecretLength);
      //Any error to report?
      if(error) return error;

      //Leading bytes of Z that contain all zero bits are stripped before
      //it is used as the premaster secret (RFC 4346, section 8.2.1)
      for(n = 0; n < context->premasterSecretLength; n++)
      {
         if(context->premasterSecret[n] != 0x00)
            break;
      }

      //Any leading zero bytes?
      if(n > 0)
      {
         //Strip leading zero bytes from the negotiated key
         memmove(context->premasterSecret, context->premasterSecret + n,
            context->premasterSecretLength - n);

         //Adjust the length of the premaster secret
         context->premasterSecretLength -= n;
      }
   }
   else
#endif
#if (TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED || TLS_ECDH_ANON_SUPPORT == ENABLED)
   //ECDH key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDH_ANON)
   {
      //Decode client's public key
      error = tlsReadEcPoint(&context->ecdhContext.params, &context->ecdhContext.qb, p, length, &n);
      //Any error to report?
      if(error) return error;

      //Verify client's public key and make sure that it is on the same
      //elliptic curve as the server's ECDH key
      error = ecdhCheckPublicKey(&context->ecdhContext.params, &context->ecdhContext.qb);
      //Weak public value?
      if(error) return error;

      //Calculate the shared secret Z. Leading zeros found in this octet
      //string must not be truncated (see RFC 4492, section 5.10)
      error = ecdhComputeSharedSecret(&context->ecdhContext, context->premasterSecret,
         sizeof(context->premasterSecret), &context->premasterSecretLength);
      //Any error to report?
      if(error) return error;
   }
   else
#endif
   //Invalid key exchange method?
   {
      //The specified key exchange method is not supported
      return ERROR_UNSUPPORTED_KEY_EXCH_METHOD;
   }

   //Derive session keys from the premaster secret
   error = tlsGenerateKeys(context);
   //Unable to generate key material?
   if(error) return error;

   //Update FSM state
   if(context->peerCertType != TLS_CERT_NONE)
      context->state = TLS_STATE_CERTIFICATE_VERIFY;
   else
      context->state = TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse CertificateVerify message
 *
 * The CertificateVerify message is used to provide explicit verification
 * of a client certificate. This message is only sent following a client
 * certificate that has signing capability
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming CertificateVerify message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseCertificateVerify(TlsContext *context, const TlsCertificateVerify *message, size_t length)
{
   error_t error;
   size_t n;

   //Debug message
   TRACE_INFO("CertificateVerify message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the CertificateVerify message
   if(length < sizeof(TlsCertificateVerify))
      return ERROR_DECODING_FAILED;

   //Check current state
   if(context->state != TLS_STATE_CERTIFICATE_VERIFY)
      return ERROR_UNEXPECTED_MESSAGE;

   //Remaining bytes to process
   n = length - sizeof(TlsCertificateVerify);

#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= TLS_VERSION_1_1)
   //SSL 3.0, TLS 1.0 or TLS 1.1 currently selected?
   if(context->version <= TLS_VERSION_1_1)
   {
      //Point to the digitally-signed element
      TlsDigitalSignature *signature = (TlsDigitalSignature *) message->signature;

      //Check the length of the digitally-signed element
      if(n < sizeof(TlsDigitalSignature))
         return ERROR_DECODING_FAILED;
      if(n < (sizeof(TlsDigitalSignature) + ntohs(signature->length)))
         return ERROR_DECODING_FAILED;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
      //The client's certificate contains a valid RSA public key?
      if(context->peerCertType == TLS_CERT_RSA_SIGN)
      {
         //Digest all the handshake messages starting at ClientHello (using MD5)
         error = tlsFinalizeHandshakeHash(context, MD5_HASH_ALGO,
            context->handshakeMd5Context, "", context->verifyData);
         //Any error to report?
         if(error) return error;

         //Digest all the handshake messages starting at ClientHello (using SHA-1)
         error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
            context->handshakeSha1Context, "", context->verifyData + MD5_DIGEST_SIZE);
         //Any error to report?
         if(error) return error;

         //Verify RSA signature using client's public key
         error = tlsVerifyRsaSignature(&context->peerRsaPublicKey,
            context->verifyData, signature->value, ntohs(signature->length));
      }
      else
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
      //The client's certificate contains a valid DSA public key?
      if(context->peerCertType == TLS_CERT_DSS_SIGN)
      {
         //Digest all the handshake messages starting at ClientHello
         error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
            context->handshakeSha1Context, "", context->verifyData);
         //Any error to report?
         if(error) return error;

         //Verify DSA signature using client's public key
         error = tlsVerifyDsaSignature(&context->peerDsaPublicKey, context->verifyData,
            SHA1_DIGEST_SIZE, signature->value, ntohs(signature->length));
      }
      else
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
      //The client's certificate contains a valid ECDSA public key?
      if(context->peerCertType == TLS_CERT_ECDSA_SIGN)
      {
         //Digest all the handshake messages starting at ClientHello
         error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
            context->handshakeSha1Context, "", context->verifyData);
         //Any error to report?
         if(error) return error;

         //Verify ECDSA signature using client's public key
         error = tlsVerifyEcdsaSignature(&context->peerEcParams, &context->peerEcPublicKey,
            context->verifyData, SHA1_DIGEST_SIZE, signature->value, ntohs(signature->length));
      }
      else
#endif
      //Invalid signature algorithm?
      {
         //Report an error
         error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
      }
   }
   else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
   //TLS 1.2 currently selected?
   if(context->version == TLS_VERSION_1_2)
   {
      const HashAlgo *hashAlgo;

      //Point to the digitally-signed element
      TlsDigitalSignature2 *signature = (TlsDigitalSignature2 *) message->signature;

      //Check the length of the digitally-signed element
      if(n < sizeof(TlsDigitalSignature2))
         return ERROR_DECODING_FAILED;
      if(n < (sizeof(TlsDigitalSignature2) + ntohs(signature->length)))
         return ERROR_DECODING_FAILED;

      //Retrieve the hash algorithm used for signing
      hashAlgo = tlsGetHashAlgo(signature->algorithm.hash);

      //Digest all the handshake messages starting at ClientHello
      if(hashAlgo == SHA1_HASH_ALGO)
      {
         //Use SHA-1 hash algorithm
         error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
            context->handshakeSha1Context, "", context->verifyData);
      }
      else if(hashAlgo == context->prfHashAlgo)
      {
         //Use PRF hash algorithm (SHA-256 or SHA-384)
         error = tlsFinalizeHandshakeHash(context, hashAlgo,
            context->handshakeHashContext, "", context->verifyData);
      }
      else
      {
         //The specified hash algorithm is not supported
         error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
      }

      //Any error to report?
      if(error) return error;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
      //The client's certificate contains a valid RSA public key?
      if(signature->algorithm.signature == TLS_SIGN_ALGO_RSA)
      {
         //Use the signature verification algorithm defined in PKCS #1 v1.5
         error = rsassaPkcs1v15Verify(&context->peerRsaPublicKey, hashAlgo,
            context->verifyData, signature->value, ntohs(signature->length));
      }
      else
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
      //The client's certificate contains a valid DSA public key?
      if(signature->algorithm.signature == TLS_SIGN_ALGO_DSA)
      {
         //Verify DSA signature using client's public key
         error = tlsVerifyDsaSignature(&context->peerDsaPublicKey, context->verifyData,
            hashAlgo->digestSize, signature->value, ntohs(signature->length));
      }
      else
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
      //The client's certificate contains a valid ECDSA public key?
      if(signature->algorithm.signature == TLS_SIGN_ALGO_ECDSA)
      {
         //Verify ECDSA signature using client's public key
         error = tlsVerifyEcdsaSignature(&context->peerEcParams, &context->peerEcPublicKey,
            context->verifyData, hashAlgo->digestSize, signature->value, ntohs(signature->length));
      }
      else
#endif
      //Invalid signature algorithm?
      {
         //Report an error
         error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
      }
   }
   else
#endif
   {
      //The negotiated TLS version is not valid
      error = ERROR_INVALID_VERSION;
   }

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //Prepare to receive a ChangeCipherSpec message...
   context->state = TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC;
   //Return status code
   return error;
}

#endif
