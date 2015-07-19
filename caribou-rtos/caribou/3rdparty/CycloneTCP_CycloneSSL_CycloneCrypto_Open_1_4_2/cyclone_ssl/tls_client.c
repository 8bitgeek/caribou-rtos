/**
 * @file tls_client.c
 * @brief Handshake message processing (TLS client)
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
#include "tls_client.h"
#include "tls_common.h"
#include "tls_record.h"
#include "tls_misc.h"
#include "pem.h"
#include "date_time.h"
#include "debug.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED && TLS_CLIENT_SUPPORT == ENABLED)


/**
 * @brief TLS client handshake
 *
 * TLS handshake protocol is responsible for the authentication
 * and key exchange necessary to establish a secure session
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsClientHandshake(TlsContext *context)
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
      //Send ClientHello message?
      case TLS_STATE_CLIENT_HELLO:
         //When a client first connects to a server, it is required to send
         //the ClientHello as its first message
         error = tlsSendClientHello(context);
         break;
      //Send Certificate message?
      case TLS_STATE_CLIENT_CERTIFICATE:
         //This is the first message the client can send after receiving a
         //ServerHelloDone message. This message is only sent if the server
         //requests a certificate
         error = tlsSendCertificate(context);
         break;
      //Send ClientKeyExchange message?
      case TLS_STATE_CLIENT_KEY_EXCHANGE:
         //This message is always sent by the client. It must immediately
         //follow the client certificate message, if it is sent. Otherwise,
         //it must be the first message sent by the client after it receives
         //the ServerHelloDone message
         error = tlsSendClientKeyExchange(context);
         break;
      //Send CertificateVerify message?
      case TLS_STATE_CERTIFICATE_VERIFY:
         //This message is used to provide explicit verification of a client
         //certificate. This message is only sent following a client certificate
         //that has signing capability. When sent, it must immediately follow
         //the clientKeyExchange message
         error = tlsSendCertificateVerify(context);
         break;
      //Send ChangeCipherSpec message?
      case TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC:
         //The ChangeCipherSpec message is sent by the client and to notify the
         //server that subsequent records will be protected under the newly
         //negotiated CipherSpec and keys
         error = tlsSendChangeCipherSpec(context);
         break;
      //Send Finished message?
      case TLS_STATE_CLIENT_FINISHED:
         //A Finished message is always sent immediately after a changeCipherSpec
         //message to verify that the key exchange and authentication processes
         //were successful
         error = tlsSendFinished(context);
         break;
      //Wait for a message from the server?
      case TLS_STATE_SERVER_HELLO:
      case TLS_STATE_SERVER_CERTIFICATE:
      case TLS_STATE_SERVER_KEY_EXCHANGE:
      case TLS_STATE_CERTIFICATE_REQUEST:
      case TLS_STATE_SERVER_HELLO_DONE:
      case TLS_STATE_SERVER_CHANGE_CIPHER_SPEC:
      case TLS_STATE_SERVER_FINISHED:
         //Parse incoming handshake message
         error = tlsParseServerMessage(context);
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
         //Send an alert message to the server
         tlsProcessError(context, error);
         //Exit immediately
         break;
      }
   }

   //Return status code
   return error;
}


/**
 * @brief Parse incoming handshake message
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsParseServerMessage(TlsContext *context)
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
      //HelloRequest message received?
      case TLS_TYPE_HELLO_REQUEST:
         //The HelloRequest message can be sent at any time but it should be
         //ignored by the client if it arrives in the middle of a handshake
         error = NO_ERROR;
         break;
      //ServerHello message received?
      case TLS_TYPE_SERVER_HELLO:
         //The server will send this message in response to a ClientHello
         //message when it was able to find an acceptable set of algorithms
         error = tlsParseServerHello(context, message, length);
         break;
      //Certificate message received?
      case TLS_TYPE_CERTIFICATE:
         //The server must send a Certificate message whenever the agreed-
         //upon key exchange method uses certificates for authentication. This
         //message will always immediately follow the ServerHello message
         error = tlsParseCertificate(context, message, length);
         break;
      //ServerKeyExchange message received?
      case TLS_TYPE_SERVER_KEY_EXCHANGE:
         //The ServerKeyExchange message is sent by the server only when the
         //server Certificate message (if sent) does not contain enough data
         //to allow the client to exchange a premaster secret
         error = tlsParseServerKeyExchange(context, message, length);
         break;
      //CertificateRequest message received?
      case TLS_TYPE_CERTIFICATE_REQUEST:
         //A non-anonymous server can optionally request a certificate from the
         //client, if appropriate for the selected cipher suite. This message,
         //if sent, will immediately follow the ServerKeyExchange message
         error = tlsParseCertificateRequest(context, message, length);
         break;
      //ServerHelloDone message received?
      case TLS_TYPE_SERVER_HELLO_DONE:
         //The ServerHelloDone message is sent by the server to indicate the
         //end of the ServerHello and associated messages
         error = tlsParseServerHelloDone(context, message, length);
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
      }
   }
   //ChangeCipherSpec message received?
   else if(contentType == TLS_TYPE_CHANGE_CIPHER_SPEC)
   {
      //The ChangeCipherSpec message is sent by the server and to notify the
      //client that subsequent records will be protected under the newly
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
      //The server cannot transmit application data
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
 * @brief Send ClientHello message
 *
 * When a client first connects to a server, it is required to send
 * the ClientHello as its first message. The client can also send a
 * ClientHello in response to a HelloRequest or on its own initiative
 * in order to renegotiate the security parameters in an existing
 * connection
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendClientHello(TlsContext *context)
{
   error_t error;
   uint_t i;
   uint_t n;
   size_t length;
   uint8_t *p;
   TlsClientHello *message;
   TlsCipherSuites *cipherSuites;
   TlsCompressionMethods *compressionMethods;
   TlsExtensions *extensionList;

   //Get current time
   uint32_t t = (uint32_t) getCurrentUnixTime();
   //This flag tells whether any ECC cipher suite is proposed by the client
   bool_t eccCipherSuite = FALSE;

   //Generate the client random value. The first four bytes code
   //the current time and date in standard Unix format
   context->clientRandom.gmtUnixTime = htonl(t);

   //The last 28 bytes contain securely-generated random bytes
   error = context->prngAlgo->read(context->prngContext,
      context->clientRandom.randomBytes, 28);
   //Any error to report?
   if(error) return error;

   //Buffer where to format the message
   p = context->txBuffer + sizeof(TlsRecord);

   //Point to the ClientHello message
   message = (TlsClientHello *) p;
   //Format message header
   message->msgType = TLS_TYPE_CLIENT_HELLO;
   message->clientVersion = HTONS(TLS_MAX_VERSION);
   message->random = context->clientRandom;

#if (TLS_SESSION_RESUME_SUPPORT == ENABLED)
   //The SessionID value identifies a session the client wishes
   //to reuse for this connection
   message->sessionId.length = context->sessionIdLength;
   memcpy(message->sessionId.value, context->sessionId, context->sessionIdLength);
#else
   //Session resumption is not supported
   message->sessionId.length = 0;
#endif

   //Point to the next field
   p += sizeof(TlsClientHello) + message->sessionId.length;
   //Total length of the message
   length = sizeof(TlsClientHello) + message->sessionId.length;

   //List of cryptographic algorithms supported by the client
   cipherSuites = (TlsCipherSuites *) p;

   //Debug message
   TRACE_DEBUG("Cipher suites:\r\n");

   //User preferred cipher suite list
   if(context->numCipherSuites > 0)
   {
      //Number of cipher suites in the array
      n = 0;

      //Parse cipher suites
      for(i = 0; i < context->numCipherSuites; i++)
      {
         //Make sure the specified cipher suite is supported
         if(tlsIsCipherSuiteSupported(context->cipherSuites[i]))
         {
            //Copy cipher suite identifier
            cipherSuites->value[n++] = htons(context->cipherSuites[i]);

            //Debug message
            TRACE_DEBUG("  0x%04" PRIX16 " (%s)\r\n", context->cipherSuites[i],
               tlsGetCipherSuiteName(context->cipherSuites[i]));

            //ECC cipher suite?
            if(tlsIsEccCipherSuite(context->cipherSuites[i]))
               eccCipherSuite = TRUE;
         }
      }
   }
   //Default cipher suite list
   else
   {
      //Determine the number of supported cipher suites
      n = tlsGetNumSupportedCipherSuites();

      //Parse cipher suites
      for(i = 0; i < n; i++)
      {
         //Copy cipher suite identifier
         cipherSuites->value[i] = htons(tlsSupportedCipherSuites[i].identifier);

         //Debug message
         TRACE_DEBUG("  0x%04" PRIX16 " (%s)\r\n", tlsSupportedCipherSuites[i].identifier,
            tlsSupportedCipherSuites[i].name);

         //ECC cipher suite?
         if(tlsIsEccCipherSuite(tlsSupportedCipherSuites[i].identifier))
            eccCipherSuite = TRUE;
      }
   }

   //Length of the array, in bytes
   cipherSuites->length = htons(n * 2);
   //Point to the next field
   p += sizeof(TlsCipherSuites) + n * 2;
   //Total length of the message
   length += sizeof(TlsCipherSuites) + n * 2;

   //List of compression algorithms supported by the client
   compressionMethods = (TlsCompressionMethods *) p;

   //The CRIME exploit takes advantage of TLS compression, so conservative
   //implementations do not enable compression at the TLS level
   compressionMethods->length = 1;
   compressionMethods->value[0] = TLS_COMPRESSION_METHOD_NULL;

   //Point to the next field
   p += sizeof(TlsCompressionMethods) + compressionMethods->length;
   //Total length of the message
   length += sizeof(TlsCompressionMethods) + compressionMethods->length;

   //Clients may request extended functionality from servers by sending
   //data in the extensions field
   extensionList = (TlsExtensions *) p;
   //Total length of the extension list
   extensionList->length = 0;

   //Point to the next field
   p += sizeof(TlsExtensions);
   //Total length of the message
   length += sizeof(TlsExtensions);

#if (TLS_SNI_SUPPORT == ENABLED)
   //In order to provide the server name, clients may include a ServerName extension
   if(context->serverName != NULL)
   {
      TlsExtension *extension;
      TlsServerNameList *serverNameList;
      TlsServerName *serverName;

      //Determine the length of the server name
      n = strlen(context->serverName);

      //Add SNI (Server Name Indication) extension
      extension = (TlsExtension *) p;
      //Type of the extension
      extension->type = HTONS(TLS_EXT_SERVER_NAME);

      //Point to the list of server names
      serverNameList = (TlsServerNameList *) extension->value;

      //Point to the server name
      serverName = (TlsServerName *) serverNameList->value;
      //Fill in the type and the length fields
      serverName->type = TLS_NAME_TYPE_HOSTNAME;
      serverName->length = htons(n);
      //Copy server name
      memcpy(serverName->hostname, context->serverName, n);

      //Compute the length, in byte, of the structure
      n += sizeof(TlsServerName);
      //Fix the length of the list
      serverNameList->length = htons(n);

      //Consider the 2-byte length field that precedes the list
      n += sizeof(TlsServerNameList);
      //Fix the length of the extension
      extension->length = htons(n);

      //Compute the length, in bytes, of the ServerName extension
      n += sizeof(TlsExtension);
      //Fix the length of the extension list
      extensionList->length += n;

      //Point to the next field
      p += n;
      //Total length of the message
      length += n;
   }
#endif

#if (TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED || TLS_ECDH_ANON_SUPPORT == ENABLED)
   //A client that proposes ECC cipher suites in its ClientHello message
   //should send the EllipticCurves extension
   if(eccCipherSuite)
   {
      TlsExtension *extension;
      TlsEllipticCurveList *ellipticCurveList;

      //Add the EllipticCurves extension
      extension = (TlsExtension *) p;
      //Type of the extension
      extension->type = HTONS(TLS_EXT_ELLIPTIC_CURVES);

      //Point to the list of supported elliptic curves
      ellipticCurveList = (TlsEllipticCurveList *) extension->value;
      //Items in the list are ordered according to client's preferences
      n = 0;

#if (TLS_SECP160K1_SUPPORT == ENABLED)
      //Support for secp160k1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP160K1);
#endif
#if (TLS_SECP160R1_SUPPORT == ENABLED)
      //Support for secp160r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP160R1);
#endif
#if (TLS_SECP160R2_SUPPORT == ENABLED)
      //Support for secp160r2 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP160R2);
#endif
#if (TLS_SECP192K1_SUPPORT == ENABLED)
      //Support for secp192k1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP192K1);
#endif
#if (TLS_SECP192R1_SUPPORT == ENABLED)
      //Support for secp192r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP192R1);
#endif
#if (TLS_SECP224K1_SUPPORT == ENABLED)
      //Support for secp224k1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP224K1);
#endif
#if (TLS_SECP224R1_SUPPORT == ENABLED)
      //Support for secp224r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP224R1);
#endif
#if (TLS_SECP256K1_SUPPORT == ENABLED)
      //Support for secp256k1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP256K1);
#endif
#if (TLS_SECP256R1_SUPPORT == ENABLED)
      //Support for secp256r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP256R1);
#endif
#if (TLS_SECP384R1_SUPPORT == ENABLED)
      //Support for secp384r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP384R1);
#endif
#if (TLS_SECP521R1_SUPPORT == ENABLED)
      //Support for secp521r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_SECP521R1);
#endif
#if (TLS_BRAINPOOLP256R1_SUPPORT == ENABLED)
      //Support for brainpoolP256r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_BRAINPOOLP256R1);
#endif
#if (TLS_BRAINPOOLP384R1_SUPPORT == ENABLED)
      //Support for brainpoolP384r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_BRAINPOOLP384R1);
#endif
#if (TLS_BRAINPOOLP512R1_SUPPORT == ENABLED)
      //Support for brainpoolP512r1 elliptic curve
      ellipticCurveList->value[n++] = HTONS(TLS_EC_CURVE_BRAINPOOLP512R1);
#endif

      //Compute the length, in bytes, of the list
      n *= 2;
      //Fix the length of the list
      ellipticCurveList->length = htons(n);

      //Consider the 2-byte length field that precedes the list
      n += sizeof(TlsEllipticCurveList);
      //Fix the length of the extension
      extension->length = htons(n);

      //Compute the length, in bytes, of the EllipticCurves extension
      n += sizeof(TlsExtension);
      //Fix the length of the extension list
      extensionList->length += n;

      //Point to the next field
      p += n;
      //Total length of the message
      length += n;
   }

   //A client that proposes ECC cipher suites in its ClientHello message
   //should send the EcPointFormats extension
   if(eccCipherSuite)
   {
      TlsExtension *extension;
      TlsEcPointFormatList *ecPointFormatList;

      //Add the EcPointFormats extension
      extension = (TlsExtension *) p;
      //Type of the extension
      extension->type = HTONS(TLS_EXT_EC_POINT_FORMATS);

      //Point to the list of supported EC point formats
      ecPointFormatList = (TlsEcPointFormatList *) extension->value;
      //Items in the list are ordered according to client's preferences
      n = 0;

      //The client can parse only the uncompressed point format...
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

#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
   //Include the SignatureAlgorithms extension only if TLS 1.2 is supported
   {
      TlsExtension *extension;
      TlsSignHashAlgos *supportedSignAlgos;

      //Add the SignatureAlgorithms extension
      extension = (TlsExtension *) p;
      //Type of the extension
      extension->type = HTONS(TLS_EXT_SIGNATURE_ALGORITHMS);

      //Point to the list of the hash/signature algorithm pairs that
      //the server is able to verify
      supportedSignAlgos = (TlsSignHashAlgos *) extension->value;

      //Enumerate the hash/signature algorithm pairs in descending
      //order of preference
      n = 0;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
      //MD5 with RSA is always supported
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_MD5;
      //SHA-1 with RSA is always supported
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA1;
#if (TLS_SHA224_SUPPORT == ENABLED)
      //SHA-224 with RSA support is optional
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA224;
#endif
      //SHA-256 with RSA is always supported
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA256;
#if (TLS_SHA384_SUPPORT == ENABLED)
      //SHA-384 with RSA support is optional
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA384;
#endif
#if (TLS_SHA512_SUPPORT == ENABLED)
      //SHA-512 with RSA support is optional
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_RSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA512;
#endif
#endif

#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
      //DSA with SHA-1 is always supported
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_DSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA1;
#if (TLS_SHA224_SUPPORT == ENABLED)
      //DSA with SHA-224 support is optional
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_DSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA224;
#endif
      //DSA with SHA-256 is always supported
      supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_DSA;
      supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA256;
#endif

#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
      //Any ECC cipher suite proposed by the client?
      if(eccCipherSuite)
      {
         //ECDSA with SHA-1 is always supported
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA1;
#if (TLS_SHA224_SUPPORT == ENABLED)
         //ECDSA with SHA-224 support is optional
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA224;
#endif
         //ECDSA with SHA-256 is always supported
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA256;
#if (TLS_SHA384_SUPPORT == ENABLED)
         //ECDSA with SHA-384 support is optional
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA384;
#endif
#if (TLS_SHA512_SUPPORT == ENABLED)
         //ECDSA with SHA-512 support is optional
         supportedSignAlgos->value[n].signature = TLS_SIGN_ALGO_ECDSA;
         supportedSignAlgos->value[n++].hash = TLS_HASH_ALGO_SHA512;
#endif
      }
#endif

      //Compute the length, in bytes, of the list
      n *= sizeof(TlsSignHashAlgo);
      //Fix the length of the list
      supportedSignAlgos->length = htons(n);

      //Consider the 2-byte length field that precedes the list
      n += sizeof(TlsSignHashAlgos);
      //Fix the length of the extension
      extension->length = htons(n);

      //Compute the length, in bytes, of the SignatureAlgorithms extension
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
   TRACE_INFO("Sending ClientHello message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send handshake message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
   //Failed to send TLS record?
   if(error) return error;

   //Prepare to receive ServerHello message...
   context->state = TLS_STATE_SERVER_HELLO;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send ClientKeyExchange message
 *
 * This message is always sent by the client. It must immediately
 * follow the client Certificate message, if it is sent. Otherwise,
 * it must be the first message sent by the client after it receives
 * the ServerHelloDone message
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendClientKeyExchange(TlsContext *context)
{
   error_t error;
   size_t length;
   TlsClientKeyExchange *message;

   //Point to the ClientKeyExchange message
   message = (TlsClientKeyExchange *) (context->txBuffer + sizeof(TlsRecord));
   //Set message type
   message->msgType = TLS_TYPE_CLIENT_KEY_EXCHANGE;

#if (TLS_RSA_SUPPORT == ENABLED)
   //RSA key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_RSA)
   {
      uint_t n;

      //If RSA is being used for key agreement and authentication, the
      //client generates a 48-byte premaster secret
      context->premasterSecretLength = 48;

      //The first 2 bytes code the latest version supported by the client
      context->premasterSecret[0] = MSB(TLS_MAX_VERSION);
      context->premasterSecret[1] = LSB(TLS_MAX_VERSION);

      //The last 46 bytes contain securely-generated random bytes
      error = context->prngAlgo->read(context->prngContext, context->premasterSecret + 2, 46);
      //Any error to report?
      if(error) return error;

      //Offset at which the encrypted premaster secret will be stored
      n = (context->version > SSL_VERSION_3_0) ? 2 : 0;

      //Encrypt the premaster secret using the server public key
      error = rsaesPkcs1v15Encrypt(context->prngAlgo, context->prngContext, &context->peerRsaPublicKey,
         context->premasterSecret, 48, message->exchangeKeys + n, &length);
      //RSA encryption failed?
      if(error) return error;

      //The RSA-encrypted premaster secret in a ClientKeyExchange is preceded by
      //two length bytes. SSL 3.0 implementations do not include these bytes
      if(context->version > SSL_VERSION_3_0)
      {
         //Write the length field
         message->exchangeKeys[0] = MSB(length);
         message->exchangeKeys[1] = LSB(length);
         //Length of the resulting octet string
         length += 2;
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
      uint_t n;

      //Generate an ephemeral key pair
      error = dhGenerateKeyPair(&context->dhContext, context->prngAlgo, context->prngContext);
      //Any error to report?
      if(error) return error;

      //Encode the client's public value to an opaque vector
      error = tlsWriteMpi(&context->dhContext.ya, message->exchangeKeys, &length);
      //Any error to report?
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
      //Generate an ephemeral key pair
      error = ecdhGenerateKeyPair(&context->ecdhContext, context->prngAlgo, context->prngContext);
      //Any error to report?
      if(error) return error;

      //Encode the client's public key to an opaque vector
      error = tlsWriteEcPoint(&context->ecdhContext.params,
         &context->ecdhContext.qa, message->exchangeKeys, &length);
      //Any error to report?
      if(error) return error;

      //Calculate the negotiated key Z
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

   //Fix message header
   STORE24BE(length, message->length);
   //Length of the complete handshake message
   length += sizeof(TlsHandshake);

   //Debug message
   TRACE_INFO("Sending ClientKeyExchange message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send handshake message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
   //Failed to send TLS record?
   if(error) return error;

   //Derive session keys from the premaster secret
   error = tlsGenerateKeys(context);
   //Unable to generate key material?
   if(error) return error;

   //Prepare to send CertificateVerify message...
   context->state = TLS_STATE_CERTIFICATE_VERIFY;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send CertificateVerify message
 *
 * The CertificateVerify message is used to provide explicit verification
 * of a client certificate. This message is only sent following a client
 * certificate that has signing capability
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendCertificateVerify(TlsContext *context)
{
   error_t error;
   size_t length;
   TlsCertificateVerify *message;

   //Message length
   length = 0;

   //This message is only sent following a client certificate
   //that has signing capability
   if(context->cert != NULL)
   {
      //Check certificate type
      if(context->cert->type == TLS_CERT_RSA_SIGN ||
         context->cert->type == TLS_CERT_DSS_SIGN ||
         context->cert->type == TLS_CERT_ECDSA_SIGN)
      {
         //Point to the CertificateVerify message
         message = (TlsCertificateVerify *) (context->txBuffer + sizeof(TlsRecord));
         //Set message type
         message->msgType = TLS_TYPE_CERTIFICATE_VERIFY;

#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= TLS_VERSION_1_1)
         //SSL 3.0, TLS 1.0 or TLS 1.1 currently selected?
         if(context->version <= TLS_VERSION_1_1)
         {
            //Point to the digitally-signed element
            TlsDigitalSignature *signature = (TlsDigitalSignature *) message->signature;

#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
            //The client's certificate contains a valid RSA public key?
            if(context->cert->type == TLS_CERT_RSA_SIGN)
            {
               RsaPrivateKey privateKey;

               //Initialize RSA private key
               rsaInitPrivateKey(&privateKey);

               //Digest all the handshake messages starting at ClientHello (using MD5)
               error = tlsFinalizeHandshakeHash(context, MD5_HASH_ALGO,
                  context->handshakeMd5Context, "", context->verifyData);

               //Check status code
               if(!error)
               {
                  //Digest all the handshake messages starting at ClientHello (using SHA-1)
                  error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
                     context->handshakeSha1Context, "", context->verifyData + MD5_DIGEST_SIZE);
               }

               //Check status code
               if(!error)
               {
                  //Decode the PEM structure that holds the RSA private key
                  error = pemReadRsaPrivateKey(context->cert->privateKey,
                     context->cert->privateKeyLength, &privateKey);
               }

               //Check status code
               if(!error)
               {
                  //Generate a RSA signature using the client's private key
                  error = tlsGenerateRsaSignature(&privateKey,
                     context->verifyData, signature->value, &length);
               }

               //Release previously allocated resources
               rsaFreePrivateKey(&privateKey);
            }
            else
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
            //The client's certificate contains a valid DSA public key?
            if(context->cert->type == TLS_CERT_DSS_SIGN)
            {
               DsaPrivateKey privateKey;

               //Initialize DSA private key
               dsaInitPrivateKey(&privateKey);

               //Digest all the handshake messages starting at ClientHello
               error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
                  context->handshakeSha1Context, "", context->verifyData);

               //Check status code
               if(!error)
               {
                  //Decode the PEM structure that holds the DSA private key
                  error = pemReadDsaPrivateKey(context->cert->privateKey,
                     context->cert->privateKeyLength, &privateKey);
               }

               //Check status code
               if(!error)
               {
                  //Generate a DSA signature using the client's private key
                  error = tlsGenerateDsaSignature(context->prngAlgo,
                     context->prngContext, &privateKey, context->verifyData,
                     SHA1_DIGEST_SIZE, signature->value, &length);
               }

               //Release previously allocated resources
               dsaFreePrivateKey(&privateKey);
            }
            else
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
            //The client's certificate contains a valid ECDSA public key?
            if(context->cert->type == TLS_CERT_ECDSA_SIGN)
            {
               EcDomainParameters params;
               Mpi privateKey;

               //Initialize EC domain parameters
               ecInitDomainParameters(&params);
               //Initialize EC private key
               mpiInit(&privateKey);

               //Digest all the handshake messages starting at ClientHello
               error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
                  context->handshakeSha1Context, "", context->verifyData);

               //Check status code
               if(!error)
               {
                  //Decode the PEM structure that holds the EC domain parameters
                  error = pemReadEcParameters(context->cert->privateKey,
                     context->cert->privateKeyLength, &params);
               }

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
                  //Generate an ECDSA signature using the client's private key
                  error = tlsGenerateEcdsaSignature(&params, context->prngAlgo,
                     context->prngContext, &privateKey, context->verifyData,
                     SHA1_DIGEST_SIZE, signature->value, &length);
               }

               //Release previously allocated resources
               ecFreeDomainParameters(&params);
               mpiFree(&privateKey);
            }
            else
#endif
            //Invalid signature algorithm?
            {
               //No signature generated
               length = 0;
               //Report an error
               error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
            }

            //Length of the signature
            signature->length = htons(length);
            //Total length of the digitally-signed element
            length += sizeof(TlsDigitalSignature);
         }
         else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
         //TLS 1.2 currently selected?
         if(context->version == TLS_VERSION_1_2)
         {
            //Point to the digitally-signed element
            TlsDigitalSignature2 *signature = (TlsDigitalSignature2 *) message->signature;

            //Retrieve the hash algorithm to be used for signing
            const HashAlgo *hashAlgo = tlsGetHashAlgo(context->signHashAlgo);

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
            if(context->cert->type == TLS_CERT_RSA_SIGN)
            {
               RsaPrivateKey privateKey;

               //Initialize RSA private key
               rsaInitPrivateKey(&privateKey);

               //Set the relevant signature algorithm
               signature->algorithm.signature = TLS_SIGN_ALGO_RSA;
               signature->algorithm.hash = context->signHashAlgo;

               //Decode the PEM structure that holds the RSA private key
               error = pemReadRsaPrivateKey(context->cert->privateKey,
                  context->cert->privateKeyLength, &privateKey);

               //Check status code
               if(!error)
               {
                  //Use the signature algorithm defined in PKCS #1 v1.5
                  error = rsassaPkcs1v15Sign(&privateKey, hashAlgo,
                     context->verifyData, signature->value, &length);
               }

               //Release previously allocated resources
               rsaFreePrivateKey(&privateKey);
            }
            else
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
            //The client's certificate contains a valid DSA public key?
            if(context->cert->type == TLS_CERT_DSS_SIGN)
            {
               DsaPrivateKey privateKey;

               //Initialize DSA private key
               dsaInitPrivateKey(&privateKey);

               //Set the relevant signature algorithm
               signature->algorithm.signature = TLS_SIGN_ALGO_DSA;
               signature->algorithm.hash = context->signHashAlgo;

               //Decode the PEM structure that holds the DSA private key
               error = pemReadDsaPrivateKey(context->cert->privateKey,
                  context->cert->privateKeyLength, &privateKey);

               //Check status code
               if(!error)
               {
                  //Generate a DSA signature using the client's private key
                  error = tlsGenerateDsaSignature(context->prngAlgo,
                     context->prngContext, &privateKey, context->verifyData,
                     hashAlgo->digestSize, signature->value, &length);
               }

               //Release previously allocated resources
               dsaFreePrivateKey(&privateKey);
            }
            else
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
            //The client's certificate contains a valid ECDSA public key?
            if(context->cert->type == TLS_CERT_ECDSA_SIGN)
            {
               EcDomainParameters params;
               Mpi privateKey;

               //Initialize EC domain parameters
               ecInitDomainParameters(&params);
               //Initialize EC private key
               mpiInit(&privateKey);

               //Set the relevant signature algorithm
               signature->algorithm.signature = TLS_SIGN_ALGO_ECDSA;
               signature->algorithm.hash = context->signHashAlgo;

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
                  //Generate an ECDSA signature using the client's private key
                  error = tlsGenerateEcdsaSignature(&params, context->prngAlgo,
                     context->prngContext, &privateKey, context->verifyData,
                     hashAlgo->digestSize, signature->value, &length);
               }

               //Release previously allocated resources
               ecFreeDomainParameters(&params);
               mpiFree(&privateKey);
            }
            else
#endif
            //Invalid signature algorithm?
            {
               //No signature generated
               length = 0;
               //Report an error
               error = ERROR_UNSUPPORTED_SIGNATURE_ALGO;
            }

            //Length of the signature
            signature->length = htons(length);
            //Length of the digitally-signed element
            length += sizeof(TlsDigitalSignature2);
         }
         else
#endif
         {
            //The negotiated TLS version is not valid
            error = ERROR_INVALID_VERSION;
         }

         //Failed to generate signature?
         if(error) return error;

         //Fix message header
         STORE24BE(length, message->length);
         //Length of the complete handshake message
         length += sizeof(TlsHandshake);

         //Debug message
         TRACE_INFO("Sending CertificateVerify message (%" PRIuSIZE " bytes)...\r\n", length);
         TRACE_DEBUG_ARRAY("  ", message, length);

         //Send handshake message
         error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
         //Failed to send TLS record?
         if(error) return error;
      }
   }

   //Prepare to send ChangeCipherSpec message...
   context->state = TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse ServerHello message
 *
 * The server will send this message in response to a ClientHello
 * message when it was able to find an acceptable set of algorithms.
 * If it cannot find such a match, it will respond with a handshake
 * failure alert
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming ServerHello message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseServerHello(TlsContext *context, const TlsServerHello *message, size_t length)
{
   error_t error;
   size_t n;
   const uint8_t *p;
   TlsCipherSuite cipherSuite;
   TlsCompressionMethod compressionMethod;

   //Debug message
   TRACE_INFO("ServerHello message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ServerHello message
   if(length < sizeof(TlsServerHello))
      return ERROR_DECODING_FAILED;

   //Check current state
   if(context->state != TLS_STATE_SERVER_HELLO)
      return ERROR_UNEXPECTED_MESSAGE;

   //Point to the session ID
   p = (uint8_t *) message + sizeof(TlsServerHello);
   //Remaining bytes to process
   n = length - sizeof(TlsServerHello);

   //Check the length of the session ID
   if(message->sessionId.length > n)
      return ERROR_DECODING_FAILED;
   if(message->sessionId.length > 32)
      return ERROR_ILLEGAL_PARAMETER;

   //Point to the next field
   p += message->sessionId.length;
   //Remaining bytes to process
   n -= message->sessionId.length;

   //Malformed ServerHello message?
   if(n < (sizeof(TlsCipherSuite) + sizeof(TlsCompressionMethod)))
      return ERROR_DECODING_FAILED;

   //Get the negotiated cipher suite
   cipherSuite = LOAD16BE(p);
   //Point to the next field
   p += sizeof(TlsCipherSuite);
   //Remaining bytes to process
   n -= sizeof(TlsCipherSuite);

   //Get the negotiated compression method
   compressionMethod = *p;
   //Point to the next field
   p += sizeof(TlsCompressionMethod);
   //Remaining bytes to process
   n -= sizeof(TlsCompressionMethod);

   //Server version
   TRACE_INFO("  serverVersion = 0x%04" PRIX16 " (%s)\r\n", ntohs(message->serverVersion),
      tlsGetVersionName(ntohs(message->serverVersion)));
   //Server random value
   TRACE_INFO("  random\r\n");
   TRACE_INFO_ARRAY("    ", &message->random, sizeof(TlsRandom));
   //Session identifier
   TRACE_INFO("  sessionId\r\n");
   TRACE_INFO_ARRAY("    ", message->sessionId.value, message->sessionId.length);
   //Cipher suite identifier
   TRACE_INFO("  cipherSuite = 0x%04" PRIX16 " (%s)\r\n",
      cipherSuite, tlsGetCipherSuiteName(cipherSuite));
   //Compression method
   TRACE_INFO("  compressionMethod = 0x%02" PRIX8 "\r\n", compressionMethod);

#if (TLS_SESSION_RESUME_SUPPORT == ENABLED)
   //Check whether the session ID matches the value that was supplied by the client
   if(message->sessionId.length > 0 && message->sessionId.length == context->sessionIdLength &&
      !memcmp(message->sessionId.value, context->sessionId, context->sessionIdLength))
   {
      //For resumed sessions, the selected cipher suite and compression
      //method shall be the same as the session being resumed
      if(cipherSuite != context->cipherSuite ||
         compressionMethod != context->compressionMethod)
      {
         //The session ID is no more valid
         context->sessionIdLength = 0;
         //When renegotiating, if the server tries to use another
         //version or compression method than previously, abort
         return ERROR_HANDSHAKE_FAILED;
      }

      //Perform abbreviated handshake
      context->resume = TRUE;
   }
   else
#endif
   {
      //Perform a full handshake
      context->resume = FALSE;
   }

   //Save server random value
   context->serverRandom = message->random;

   //Save session identifier
   memcpy(context->sessionId, message->sessionId.value, message->sessionId.length);
   context->sessionIdLength = message->sessionId.length;

   //Set the TLS version to use
   error = tlsSetVersion(context, ntohs(message->serverVersion));
   //The specified TLS version is not supported?
   if(error) return error;

   //Set cipher suite
   error = tlsSetCipherSuite(context, cipherSuite);
   //The specified cipher suite is not supported?
   if(error) return error;

   //Set compression method
   error = tlsSetCompressionMethod(context, compressionMethod);
   //The specified compression method is not supported?
   if(error) return error;

   //Initialize handshake message hashing
   error = tlsInitHandshakeHash(context);
   //Any error to report?
   if(error) return error;

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

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
      if(context->keyExchMethod == TLS_KEY_EXCH_DH_ANON ||
         context->keyExchMethod == TLS_KEY_EXCH_ECDH_ANON)
      {
         context->state = TLS_STATE_SERVER_KEY_EXCHANGE;
      }
      else
      {
         context->state = TLS_STATE_SERVER_CERTIFICATE;
      }
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse ServerKeyExchange message
 *
 * The ServerKeyExchange message is sent by the server only when the
 * server Certificate message does not contain enough data to allow
 * the client to exchange a premaster secret
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming ServerKeyExchange message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseServerKeyExchange(TlsContext *context, const TlsServerKeyExchange *message, size_t length)
{
   error_t error;
   uint_t n;
   const uint8_t *p;

   //Debug message
   TRACE_INFO("ServerKeyExchange message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ServerKeyExchange message
   if(length < sizeof(TlsServerKeyExchange))
      return ERROR_DECODING_FAILED;

   //Check current state
   if(context->state != TLS_STATE_SERVER_KEY_EXCHANGE)
      return ERROR_UNEXPECTED_MESSAGE;

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_DHE_DSS_SUPPORT == ENABLED || TLS_DH_ANON_SUPPORT == ENABLED)
   //Diffie-Hellman key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS ||
      context->keyExchMethod == TLS_KEY_EXCH_DH_ANON)
   {
      //Point to the server's key exchange parameters
      p = message->params;
      //Remaining bytes to process
      length -= sizeof(TlsServerKeyExchange);

      //Convert the prime modulus to a multiple precision integer
      error = tlsReadMpi(&context->dhContext.params.p, p, length, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Remaining bytes to process
      length -= n;

      //Convert the generator to a multiple precision integer
      error = tlsReadMpi(&context->dhContext.params.g, p, length, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Remaining bytes to process
      length -= n;

      //Convert the server's public value to a multiple precision integer
      error = tlsReadMpi(&context->dhContext.yb, p, length, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Remaining bytes to process
      length -= n;

      //Verify peer's public value
      error = dhCheckPublicKey(&context->dhContext.params, &context->dhContext.yb);
      //Weak public value?
      if(error) return error;

      //Save the length of the server's Diffie-Hellman parameters
      n = p - message->params;

      //Debug message
      TRACE_DEBUG("Diffie-Hellman parameters:\r\n");
      TRACE_DEBUG("  Prime modulus:\r\n");
      TRACE_DEBUG_MPI("    ", &context->dhContext.params.p);
      TRACE_DEBUG("  Generator:\r\n");
      TRACE_DEBUG_MPI("    ", &context->dhContext.params.g);
      TRACE_DEBUG("  Server public value:\r\n");
      TRACE_DEBUG_MPI("    ", &context->dhContext.yb);
   }
   else
#endif
#if (TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED || TLS_ECDH_ANON_SUPPORT == ENABLED)
   //ECDH key exchange method?
   if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDH_ANON)
   {
      uint8_t curveType;
      uint16_t namedCurve;
      const EcCurveInfo *curveInfo;

      //Point to the server's key exchange parameters
      p = message->params;
      //Remaining bytes to process
      length -= sizeof(TlsServerKeyExchange);

      //Malformed ServerKeyExchange message?
      if(length < sizeof(curveType))
         return ERROR_DECODING_FAILED;

      //Retrieve the type of the elliptic curve domain parameters
      curveType = *p;
      //Only named curves are supported
      if(curveType != TLS_EC_CURVE_TYPE_NAMED_CURVE)
         return ERROR_ILLEGAL_PARAMETER;

      //Advance data pointer
      p += sizeof(curveType);
      //Remaining bytes to process
      length -= sizeof(curveType);

      //Get elliptic curve identifier
      namedCurve = LOAD16BE(p);

      //Retrieve the corresponding EC domain parameters
      curveInfo = tlsGetCurveInfo(namedCurve);
      //Make sure the specified elliptic curve is supported
      if(curveInfo == NULL)
         return ERROR_ILLEGAL_PARAMETER;

      //Load EC domain parameters
      error = ecLoadDomainParameters(&context->ecdhContext.params, curveInfo);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += sizeof(namedCurve);
      //Remaining bytes to process
      length -= sizeof(namedCurve);

      //Read server's public key
      error = tlsReadEcPoint(&context->ecdhContext.params,
         &context->ecdhContext.qb, p, length, &n);
      //Any error to report?
      if(error) return error;

      //Advance data pointer
      p += n;
      //Remaining bytes to process
      length -= n;

      //Verify peer's public key
      error = ecdhCheckPublicKey(&context->ecdhContext.params, &context->ecdhContext.qb);
      //Invalid public key?
      if(error) return error;

      //Save the length of the server's ECDH parameters
      n = p - message->params;

      //Debug message
      TRACE_DEBUG("  Server public key X:\r\n");
      TRACE_DEBUG_MPI("    ", &context->ecdhContext.qb.x);
      TRACE_DEBUG("  Server public key Y:\r\n");
      TRACE_DEBUG_MPI("    ", &context->ecdhContext.qb.y);
   }
   else
#endif
   //Invalid key exchange method?
   {
      //It is not legal to send the ServerKeyExchange message when a key
      //exchange method other than DHE_DSS, DHE_RSA, DH_anon, ECDHE_RSA,
      //ECDHE_ECDSA or ECDH_anon is selected
      return ERROR_UNEXPECTED_MESSAGE;
   }

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_DHE_DSS_SUPPORT == ENABLED || \
   TLS_ECDHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_ECDSA_SUPPORT == ENABLED)
   //For non-anonymous Diffie-Hellman and ECDH key exchanges, the signature
   //over the server's key exchange parameters shall be verified
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

         //Check the length of the digitally-signed element
         if(length < sizeof(TlsDigitalSignature))
            return ERROR_DECODING_FAILED;
         if(length < (sizeof(TlsDigitalSignature) + ntohs(signature->length)))
            return ERROR_DECODING_FAILED;

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_RSA_SUPPORT == ENABLED)
         //Check whether DHE_RSA or ECDHE_RSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
            context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA)
         {
            Md5Context *md5Context;
            Sha1Context *sha1Context;

            //Allocate a memory buffer to hold the MD5 context
            md5Context = osMemAlloc(sizeof(Md5Context));
            //Failed to allocate memory?
            if(!md5Context) return ERROR_OUT_OF_MEMORY;

            //Compute MD5(ClientHello.random + ServerHello.random + ServerDhParams)
            md5Init(md5Context);
            md5Update(md5Context, context->random, 64);
            md5Update(md5Context, message->params, n);
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
            sha1Update(sha1Context, message->params, n);
            sha1Final(sha1Context, context->verifyData + MD5_DIGEST_SIZE);
            //Release previously allocated memory
            osMemFree(sha1Context);

            //RSA signature verification
            error = tlsVerifyRsaSignature(&context->peerRsaPublicKey,
               context->verifyData, signature->value, ntohs(signature->length));
         }
         else
#endif
#if (TLS_DHE_DSS_SUPPORT == ENABLED)
         //Check whether DHE_DSS key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS)
         {
            //Allocate a memory buffer to hold the SHA-1 context
            Sha1Context *sha1Context = osMemAlloc(sizeof(Sha1Context));
            //Failed to allocate memory?
            if(!sha1Context) return ERROR_OUT_OF_MEMORY;

            //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
            sha1Init(sha1Context);
            sha1Update(sha1Context, context->random, 64);
            sha1Update(sha1Context, message->params, n);
            sha1Final(sha1Context, NULL);

            //DSA signature verification
            error = tlsVerifyDsaSignature(&context->peerDsaPublicKey, sha1Context->digest,
               SHA1_DIGEST_SIZE, signature->value, ntohs(signature->length));

            //Release previously allocated memory
            osMemFree(sha1Context);
         }
         else
#endif
#if (TLS_ECDHE_ECDSA_SUPPORT == ENABLED)
         //Check whether ECDHE_ECDSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA)
         {
            //Allocate a memory buffer to hold the SHA-1 context
            Sha1Context *sha1Context = osMemAlloc(sizeof(Sha1Context));
            //Failed to allocate memory?
            if(!sha1Context) return ERROR_OUT_OF_MEMORY;

            //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
            sha1Init(sha1Context);
            sha1Update(sha1Context, context->random, 64);
            sha1Update(sha1Context, message->params, n);
            sha1Final(sha1Context, NULL);

            //ECDSA signature verification
            error = tlsVerifyEcdsaSignature(&context->peerEcParams, &context->peerEcPublicKey,
               sha1Context->digest, SHA1_DIGEST_SIZE, signature->value, ntohs(signature->length));

            //Release previously allocated memory
            osMemFree(sha1Context);
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
         HashContext *hashContext;

         //Point to the digitally-signed element
         TlsDigitalSignature2 *signature = (TlsDigitalSignature2 *) p;

         //Check the length of the digitally-signed element
         if(length < sizeof(TlsDigitalSignature2))
            return ERROR_DECODING_FAILED;
         if(length < (sizeof(TlsDigitalSignature2) + ntohs(signature->length)))
            return ERROR_DECODING_FAILED;

         //Retrieve the hash algorithm used for signing
         hashAlgo = tlsGetHashAlgo(signature->algorithm.hash);
         //Hash algorithm not supported?
         if(!hashAlgo) return ERROR_INVALID_SIGNATURE;

         //Allocate a memory buffer to hold the hash context
         hashContext = osMemAlloc(hashAlgo->contextSize);
         //Failed to allocate memory?
         if(!hashContext) return ERROR_OUT_OF_MEMORY;

         //Compute SHA(ClientHello.random + ServerHello.random + ServerDhParams)
         hashAlgo->init(hashContext);
         hashAlgo->update(hashContext, context->random, 64);
         hashAlgo->update(hashContext, message->params, n);
         hashAlgo->final(hashContext, NULL);

#if (TLS_DHE_RSA_SUPPORT == ENABLED || TLS_ECDHE_RSA_SUPPORT == ENABLED)
         //Check whether DHE_RSA or ECDHE_RSA key exchange method is currently used
         if((context->keyExchMethod == TLS_KEY_EXCH_DHE_RSA ||
            context->keyExchMethod == TLS_KEY_EXCH_ECDHE_RSA) &&
            signature->algorithm.signature == TLS_SIGN_ALGO_RSA)
         {
            //Use the signature verification algorithm defined in PKCS #1 v1.5
            error = rsassaPkcs1v15Verify(&context->peerRsaPublicKey, hashAlgo,
               hashContext->digest, signature->value, ntohs(signature->length));
         }
         else
#endif
#if (TLS_DHE_DSS_SUPPORT == ENABLED)
         //Check whether DHE_DSS key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_DHE_DSS &&
            signature->algorithm.signature == TLS_SIGN_ALGO_DSA)
         {
            //DSA signature verification
            error = tlsVerifyDsaSignature(&context->peerDsaPublicKey, hashContext->digest,
               hashAlgo->digestSize, signature->value, ntohs(signature->length));
         }
         else
#endif
#if (TLS_ECDHE_ECDSA_SUPPORT == ENABLED)
         //Check whether DHE_ECDSA key exchange method is currently used
         if(context->keyExchMethod == TLS_KEY_EXCH_ECDHE_ECDSA &&
            signature->algorithm.signature == TLS_SIGN_ALGO_ECDSA)
         {
            //ECDSA signature verification
            error = tlsVerifyEcdsaSignature(&context->peerEcParams, &context->peerEcPublicKey,
               hashContext->digest, hashAlgo->digestSize, signature->value, ntohs(signature->length));
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

      }
      else
#endif
      {
         //The negotiated TLS version is not valid
         error = ERROR_INVALID_VERSION;
      }
   }
#endif

   //Prepare to decode a CertificateRequest or a ServerHelloDone message
   context->state = TLS_STATE_CERTIFICATE_REQUEST;
   //Return status code
   return error;
}


/**
 * @brief Parse CertificateRequest message
 *
 * A server can optionally request a certificate from the client, if
 * appropriate for the selected cipher suite. This message will
 * immediately follow the ServerKeyExchange message
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming CertificateRequest message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseCertificateRequest(TlsContext *context, const TlsCertificateRequest *message, size_t length)
{
   uint_t i;
   size_t n;
   uint8_t *p;
   bool_t acceptable;
   TlsSignHashAlgos *supportedSignAlgos;
   TlsCertAuthorities *certAuthorities;

   //Debug message
   TRACE_INFO("CertificateRequest message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ServerKeyExchange message
   if(length < sizeof(TlsCertificateRequest))
      return ERROR_DECODING_FAILED;

   //Check current state
   if(context->state != TLS_STATE_CERTIFICATE_REQUEST)
      return ERROR_UNEXPECTED_MESSAGE;

   //It is a fatal handshake failure alert for an anonymous server
   //to request client authentication
   if(context->keyExchMethod == TLS_KEY_EXCH_DH_ANON ||
      context->keyExchMethod == TLS_KEY_EXCH_ECDH_ANON)
   {
      return ERROR_HANDSHAKE_FAILED;
   }

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //The server requests a certificate from the client, so that
   //the connection can be mutually authenticated
   context->clientCertRequested = TRUE;

   //Point to the beginning of the message
   p = (uint8_t *) message;
   //Remaining bytes to process
   length -= sizeof(TlsCertificateRequest);

   //Retrieve the size of the list of supported certificate types
   n = message->certificateTypes.length;
   //Make sure the length field is valid
   if(n > length) return ERROR_DECODING_FAILED;

   //Point to the next field
   p += sizeof(TlsCertificateRequest) + n;
   //Remaining bytes to process
   length -= n;

#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
   //TLS 1.2 currently selected?
   if(context->version == TLS_VERSION_1_2)
   {
      //Malformed CertificateRequest message?
      if(length < sizeof(TlsSignHashAlgos))
         return ERROR_DECODING_FAILED;

      //Point to the list of the hash/signature algorithm pairs that
      //the server is able to verify
      supportedSignAlgos = (TlsSignHashAlgos *) p;
      //Remaining bytes to process
      length -= sizeof(TlsSignHashAlgos);

      //Get the size of the list
      n = ntohs(supportedSignAlgos->length);
      //Make sure the length field is valid
      if(n > length) return ERROR_DECODING_FAILED;

      //Point to the next field
      p += sizeof(TlsSignHashAlgos) + n;
      //Remaining bytes to process
      length -= n;
   }
   //SSL 3.0, TLS 1.0 or TLS 1.1 currently selected?
   else
#endif
   {
      //Implementations prior to TLS 1.2 do not include a
      //list of supported hash/signature algorithm pairs
      supportedSignAlgos = NULL;
   }

   //Malformed CertificateRequest message?
   if(length < sizeof(TlsCertAuthorities))
      return ERROR_DECODING_FAILED;

   //Point to the list of the distinguished names of acceptable
   //certificate authorities
   certAuthorities = (TlsCertAuthorities *) p;
   //Remaining bytes to process
   length -= sizeof(TlsCertAuthorities);

   //Get the size of the list
   n = ntohs(certAuthorities->length);
   //Make sure the length field is valid
   if(n > length) return ERROR_DECODING_FAILED;

   //No suitable certificate has been found for the moment
   context->cert = NULL;

   //Loop through the list of available certificates
   for(i = 0; i < context->numCerts; i++)
   {
      //Check whether the current certificate is suitable
      acceptable = tlsIsCertificateAcceptable(&context->certs[i],
         message->certificateTypes.value, message->certificateTypes.length,
         supportedSignAlgos, NULL, certAuthorities);

#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
      //TLS 1.2 requires additional examinations
      if(acceptable && context->version == TLS_VERSION_1_2)
      {
         //The hash and signature algorithms used in the signature of the
         //CertificateVerify message must be one of those present in the
         //SupportedSignatureAlgorithms field
         if(tlsSelectSignHashAlgo(context, context->certs[i].signAlgo, supportedSignAlgos))
            acceptable = FALSE;
      }
#endif

      //If all the requirements were met, the certificate can be
      //used to authenticate the client
      if(acceptable)
      {
         context->cert = &context->certs[i];
         break;
      }
   }

   //Prepare to receive ServerHelloDone message...
   context->state = TLS_STATE_SERVER_HELLO_DONE;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse ServerHelloDone message
 *
 * The ServerHelloDone message is sent by the server to indicate the
 * end of the ServerHello and associated messages. After sending this
 * message, the server will wait for a client response
 *
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming ServerHelloDone message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseServerHelloDone(TlsContext *context, const TlsServerHelloDone *message, size_t length)
{
   //Debug message
   TRACE_INFO("ServerHelloDone message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ServerHelloDone message
   if(length < sizeof(TlsServerHelloDone))
      return ERROR_DECODING_FAILED;

   //The server may omit the CertificateRequest message and go
   //directly to the ServerHelloDone message...
   if(context->state != TLS_STATE_CERTIFICATE_REQUEST &&
      context->state != TLS_STATE_SERVER_HELLO_DONE)
   {
      //Handshake failure
      return ERROR_UNEXPECTED_MESSAGE;
   }

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //Prepare to send client Certificate message...
   context->state = TLS_STATE_CLIENT_CERTIFICATE;
   //Successful processing
   return NO_ERROR;
}

#endif
