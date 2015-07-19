/**
 * @file tls_misc.c
 * @brief TLS miscellaneous functions
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
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL TLS_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "tls.h"
#include "tls_cipher_suites.h"
#include "tls_common.h"
#include "tls_record.h"
#include "tls_misc.h"
#include "ssl_common.h"
#include "asn1.h"
#include "x509.h"
#include "pem.h"
#include "debug.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED)


/**
 * @brief Translate an error code to an alert message
 * @param[in] context Pointer to the TLS context
 * @param[in] errorCode Internal error code
 * @return Error code
 **/

void tlsProcessError(TlsContext *context, error_t errorCode)
{
   //Check status code
   switch(errorCode)
   {
   //I/O operation failed
   case ERROR_WRITE_FAILED:
   case ERROR_READ_FAILED:
      break;
   //An inappropriate message was received
   case ERROR_UNEXPECTED_MESSAGE:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_UNEXPECTED_MESSAGE);
      break;
   //A record is received with an incorrect MAC
   case ERROR_BAD_RECORD_MAC:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_BAD_RECORD_MAC);
      break;
   //Invalid record length
   case ERROR_RECORD_OVERFLOW:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_RECORD_OVERFLOW);
      break;
   //Unable to negotiate an acceptable set of security parameters
   case ERROR_HANDSHAKE_FAILED:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_HANDSHAKE_FAILURE);
      break;
   //A certificate was corrupt
   case ERROR_BAD_CERTIFICATE:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_BAD_CERTIFICATE);
      break;
   //A certificate was of an unsupported type
   case ERROR_UNSUPPORTED_CERTIFICATE:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_UNSUPPORTED_CERTIFICATE);
      break;
   //A certificate has expired or is not currently valid
   case ERROR_CERTIFICATE_EXPIRED:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_CERTIFICATE_EXPIRED);
      break;
   //A field in the handshake was out of range or inconsistent with other fields
   case ERROR_ILLEGAL_PARAMETER:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_ILLEGAL_PARAMETER);
      break;
   //The certificate could not be matched with a known, trusted CA
   case ERROR_UNKNOWN_CA:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_UNKNOWN_CA);
      break;
   //A message could not be decoded because some field was incorrect
   case ERROR_DECODING_FAILED:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_DECODE_ERROR);
      break;
   //A handshake cryptographic operation failed
   case ERROR_INVALID_SIGNATURE:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_DECRYPT_ERROR);
      break;
   //The protocol version the client has attempted to negotiate is not supported
   case ERROR_VERSION_NOT_SUPPORTED:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_PROTOCOL_VERSION);
      break;
   //Internal error
   default:
      tlsSendAlert(context, TLS_ALERT_LEVEL_FATAL, TLS_ALERT_INTERNAL_ERROR);
      break;
   }
}


/**
 * @brief Set TLS version to use
 * @param[in] context Pointer to the TLS context
 * @param[in] version TLS version
 * @return Error code
 **/

error_t tlsSetVersion(TlsContext *context, uint16_t version)
{
   //Check TLS version
   if(version < TLS_MIN_VERSION || version > TLS_MAX_VERSION)
   {
      //Debug message
      TRACE_WARNING("TLS version not supported!\r\n");
      //Report an error
      return ERROR_VERSION_NOT_SUPPORTED;
   }

   //Save the TLS protocol version to use
   context->version = version;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Set cipher suite
 * @param[in] context Pointer to the TLS context
 * @param[in] identifier Cipher suite identifier
 * @return Error code
 **/

error_t tlsSetCipherSuite(TlsContext *context, uint16_t identifier)
{
   error_t error;
   uint_t i;
   uint_t n;
   bool_t acceptable;
   const TlsCipherSuiteInfo *cipherSuite;

   //This flag tells whether the specified cipher suite is acceptable
   acceptable = TRUE;

   //Restrict the use of certain cipher suites?
   if(context->numCipherSuites > 0)
   {
      //Loop through allowed cipher suites
      for(acceptable = FALSE, i = 0; i < context->numCipherSuites; i++)
      {
         //Compare cipher suite identifiers
         if(context->cipherSuites[i] == identifier)
         {
            acceptable = TRUE;
            break;
         }
      }
   }

   //No restrictions exist concerning the use of the specified cipher suite?
   if(acceptable)
   {
      //Determine the number of supported cipher suites
      n = tlsGetNumSupportedCipherSuites();

      //Loop through the list of supported cipher suites
      for(acceptable = FALSE, i = 0; i < n; i++)
      {
         //Point to the current item
         cipherSuite = &tlsSupportedCipherSuites[i];

         //Compare cipher suite identifiers
         if(cipherSuite->identifier == identifier)
         {
            acceptable = TRUE;
            break;
         }
      }
   }

   //TLS 1.2 cipher suites must not be negotiated in older versions of TLS
   if(acceptable && context->version < TLS_VERSION_1_2)
   {
      if(cipherSuite->prfHashAlgo != NULL)
         acceptable = FALSE;
   }

   //Ensure that the selected cipher suite matches all the criteria
   if(acceptable)
   {
      //Save cipher suite identifier
      context->cipherSuite = identifier;
      //Set key exchange method
      context->keyExchMethod = cipherSuite->keyExchMethod;

      //Set encryption algorithm and hash function
      context->cipherAlgo = cipherSuite->cipherAlgo;
      context->cipherMode = cipherSuite->cipherMode;
      context->hashAlgo = cipherSuite->hashAlgo;
      context->prfHashAlgo = cipherSuite->prfHashAlgo;

      //Set appropriate length for MAC keys, encryption keys and IVs
      context->macKeyLength = cipherSuite->macKeyLength;
      context->encKeyLength = cipherSuite->encKeyLength;
      context->fixedIvLength = cipherSuite->fixedIvLength;
      context->recordIvLength = cipherSuite->recordIvLength;

      //Size of the authentication tag
      context->authTagLength = cipherSuite->authTagLength;
      //Size of the verify data
      context->verifyDataLength = cipherSuite->verifyDataLength;

      //PRF with the SHA-256 is used for all cipher suites published
      //prior than TLS 1.2 when TLS 1.2 is negotiated
      if(context->prfHashAlgo == NULL)
         context->prfHashAlgo = SHA256_HASH_ALGO;

      //The length of the verify data depends on the TLS version currently used
      if(context->version == SSL_VERSION_3_0)
         context->verifyDataLength = 36;
      else if(context->version <= TLS_VERSION_1_1)
         context->verifyDataLength = 12;

      //Successful processing
      error = NO_ERROR;
   }
   else
   {
      //Debug message
      TRACE_ERROR("Cipher suite not supported!\r\n");
      //The specified cipher suite is not supported
      error = ERROR_HANDSHAKE_FAILED;
   }

   //Return status code
   return error;
}


/**
 * @brief Set compression method
 * @param[in] context Pointer to the TLS context
 * @param[in] identifier Compression method identifier
 * @return Error code
 **/

error_t tlsSetCompressionMethod(TlsContext *context, uint8_t identifier)
{
   //Check if the requested compression algorithm is supported
   if(identifier != TLS_COMPRESSION_METHOD_NULL)
      return ERROR_HANDSHAKE_FAILED;

   //Save compression method identifier
   context->compressionMethod = identifier;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Select the hash algorithm to be used when generating signatures
 * @param[in] context Pointer to the TLS context
 * @param[in] signAlgo Desired signature algorithm (RSA, DSA or ECDSA)
 * @param[in] supportedSignAlgos List of supported signature/hash algorithm pairs
 * @return Error code
 **/

error_t tlsSelectSignHashAlgo(TlsContext *context,
   TlsSignatureAlgo signAlgo, const TlsSignHashAlgos *supportedSignAlgos)
{
   uint_t i;
   uint_t n;

   //Check whether the peer has provided a list of supported
   //hash/signature algorithm pairs?
   if(supportedSignAlgos != NULL)
   {
      //Process the list and select the relevant hash algorithm...
      context->signHashAlgo = TLS_HASH_ALGO_NONE;
      //Get the number of hash/signature algorithm pairs present in the list
      n = ntohs(supportedSignAlgos->length) / sizeof(TlsSignHashAlgo);

      //The hash algorithm to be used when generating signatures must be
      //one of those present in the list
      for(i = 0; i < n; i++)
      {
         //Acceptable signature algorithm found?
         if(supportedSignAlgos->value[i].signature == signAlgo)
         {
            //TLS operates as a client?
            if(context->entity == TLS_CONNECTION_END_CLIENT)
            {
               //Check whether the associated hash algorithm is supported
               if(supportedSignAlgos->value[i].hash == TLS_HASH_ALGO_SHA1)
                  context->signHashAlgo = (TlsHashAlgo) supportedSignAlgos->value[i].hash;
               else if(tlsGetHashAlgo(supportedSignAlgos->value[i].hash) == context->prfHashAlgo)
                  context->signHashAlgo = (TlsHashAlgo) supportedSignAlgos->value[i].hash;
            }
            //TLS operates as a server?
            else
            {
               //Check whether the associated hash algorithm is supported
               switch(supportedSignAlgos->value[i].hash)
               {
               case TLS_HASH_ALGO_MD5:
               case TLS_HASH_ALGO_SHA1:
               case TLS_HASH_ALGO_SHA224:
               case TLS_HASH_ALGO_SHA256:
               case TLS_HASH_ALGO_SHA384:
               case TLS_HASH_ALGO_SHA512:
                  context->signHashAlgo = (TlsHashAlgo) supportedSignAlgos->value[i].hash;
                  break;
               default:
                  break;
               }
            }

            //Acceptable hash algorithm found?
            if(context->signHashAlgo != TLS_HASH_ALGO_NONE)
               break;
         }
      }
   }
   else
   {
      //Use default hash algorithm when generating RSA, DSA or ECDSA signatures
      context->signHashAlgo = TLS_HASH_ALGO_SHA1;
   }

   //If no acceptable choices are presented, return an error
   if(context->signHashAlgo == TLS_HASH_ALGO_NONE)
      return ERROR_FAILURE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Select the named curve to be used when performing ECDH key exchange
 * @param[in] context Pointer to the TLS context
 * @param[in] curveList Set of elliptic curves supported by the peer
 * @return Error code
 **/

error_t tlsSelectNamedCurve(TlsContext *context,
   const TlsEllipticCurveList *curveList)
{
   uint_t i;
   uint_t n;

   //Check whether a list of elliptic curves has been provided
   if(curveList != NULL)
   {
      //Process the list and select the relevant elliptic curve...
      context->namedCurve = TLS_EC_CURVE_NONE;
      //Get the number of named curves present in the list
      n = ntohs(curveList->length) / sizeof(uint16_t);

      //The named curve to be used when performing ECDH key exchange must be
      //one of those present in the list
      for(i = 0; i < n; i++)
      {
         //Acceptable elliptic curve found?
         if(tlsGetCurveInfo(ntohs(curveList->value[i])) != NULL)
         {
            //Save the named curve
            context->namedCurve = ntohs(curveList->value[i]);
            //We are done
            break;
         }
      }
   }
   else
   {
      //No list provided
      context->namedCurve = TLS_EC_CURVE_NONE;
   }

   //If no acceptable choices are presented, return an error
   if(context->namedCurve == TLS_EC_CURVE_NONE)
      return ERROR_FAILURE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Initialize handshake message hashing
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsInitHandshakeHash(TlsContext *context)
{
   //Allocate SHA-1 context
   context->handshakeSha1Context = osMemAlloc(sizeof(Sha1Context));
   //Failed to allocate memory?
   if(!context->handshakeSha1Context) return ERROR_OUT_OF_MEMORY;

   //Initialize SHA-1 context
   sha1Init(context->handshakeSha1Context);

   //SSL 3.0, TLS 1.0 or 1.1 currently selected?
   if(context->version <= TLS_VERSION_1_1)
   {
      //Allocate MD5 context
      context->handshakeMd5Context = osMemAlloc(sizeof(Md5Context));

      //Failed to allocate memory?
      if(!context->handshakeMd5Context)
      {
         //Clean up side effects
         osMemFree(context->handshakeSha1Context);
         //Report an error
         return ERROR_OUT_OF_MEMORY;
      }

      //Initialize MD5 context
      md5Init(context->handshakeMd5Context);
   }
   //TLS 1.2 currently selected?
   else
   {
      //Allocate a memory buffer to hold the hash algorithm context
      context->handshakeHashContext = osMemAlloc(context->prfHashAlgo->contextSize);

      //Failed to allocate memory?
      if(!context->handshakeHashContext)
      {
         //Clean up side effects
         osMemFree(context->handshakeSha1Context);
         //Report an error
         return ERROR_OUT_OF_MEMORY;
      }

      //Initialize the hash algorithm context
      context->prfHashAlgo->init(context->handshakeHashContext);
   }

   //TLS operates as a client?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Point to the ClientHello message
      TlsHandshake *message = (TlsHandshake *) (context->txBuffer + sizeof(TlsRecord));
      //Retrieve the length of the message
      size_t length = LOAD24BE(message->length);

      //Sanity check
      if(length <= TLS_MAX_PROTOCOL_DATA_LENGTH)
      {
         //Update the hash value with ClientHello message contents
         tlsUpdateHandshakeHash(context, message, length + sizeof(TlsHandshake));
      }
   }

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Update hash value with a handshake message
 * @param[in] context Pointer to the TLS context
 * @param[in] data Pointer to the handshake message being hashed
 * @param[in] length Length of the message
 **/

void tlsUpdateHandshakeHash(TlsContext *context, const void *data, size_t length)
{
   //Update SHA-1 hash value with message contents
   if(context->handshakeSha1Context)
      sha1Update(context->handshakeSha1Context, data, length);

   //SSL 3.0, TLS 1.0 or 1.1 currently selected?
   if(context->version <= TLS_VERSION_1_1)
   {
      //Update MD5 hash value with message contents
      if(context->handshakeMd5Context)
         md5Update(context->handshakeMd5Context, data, length);
   }
   //TLS 1.2 currently selected?
   else
   {
      //Update hash value with message contents
      if(context->handshakeHashContext)
         context->prfHashAlgo->update(context->handshakeHashContext, data, length);
   }
}


/**
 * @brief Finalize hash calculation from previous handshake messages
 * @param[in] context Pointer to the TLS context
 * @param[in] hash Hash function used to digest the handshake messages
 * @param[in] hashContext Pointer to the hash context
 * @param[in] label NULL terminated string
 * @param[out] output Buffer where to store the resulting hash value
 * @return Error code
 **/

error_t tlsFinalizeHandshakeHash(TlsContext *context, const HashAlgo *hash,
   const void *hashContext, const char_t *label, uint8_t *output)
{
   error_t error;
   size_t labelLength;
   HashContext *tempHashContext;

   //Check parameters
   if(!context || !hash || !hashContext || !label || !output)
      return ERROR_INVALID_PARAMETER;

   //Allocate a temporary hash context
   tempHashContext = osMemAlloc(hash->contextSize);
   //Memory allocation failed?
   if(!tempHashContext) return ERROR_OUT_OF_MEMORY;

   //Original hash context must be preserved
   memcpy(tempHashContext, hashContext, hash->contextSize);

   //Compute the length of the label
   labelLength = strlen(label);

#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= SSL_VERSION_3_0)
   //SSL 3.0 currently selected?
   if(context->version == SSL_VERSION_3_0)
   {
      //The pad character is repeated 48 times for MD5 or 40 times for SHA-1
      size_t padLength = (hash == MD5_HASH_ALGO) ? 48 : 40;

      //hash(handshakeMessages + label + masterSecret + pad1)
      hash->update(tempHashContext, label, labelLength);
      hash->update(tempHashContext, context->masterSecret, 48);
      hash->update(tempHashContext, sslPad1, padLength);
      hash->final(tempHashContext, output);

      //hash(masterSecret + pad2 + hash(handshakeMessages + label + masterSecret + pad1))
      hash->init(tempHashContext);
      hash->update(tempHashContext, context->masterSecret, 48);
      hash->update(tempHashContext, sslPad2, padLength);
      hash->update(tempHashContext, output, hash->digestSize);
      hash->final(tempHashContext, output);

      //Successful processing
      error = NO_ERROR;
   }
   else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_0 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
   //TLS 1.0, TLS 1.1 or TLS 1.2 currently selected?
   if(context->version >= TLS_VERSION_1_0 && context->version <= TLS_VERSION_1_2)
   {
      //Compute hash(handshakeMessages)
      hash->final(tempHashContext, output);
      //Successful processing
      error = NO_ERROR;
   }
   else
#endif
   //The negotiated TLS version is not valid...
   {
      //Report an error
      error = ERROR_INVALID_VERSION;
   }

   //Release previously allocated resources
   osMemFree(tempHashContext);
   //Return status code
   return error;
}


/**
 * @brief Compute verify data from previous handshake messages
 * @param[in] context Pointer to the TLS context
 * @param[in] entity Specifies whether the computation is performed at client or server side
 * @return Error code
 **/

error_t tlsComputeVerifyData(TlsContext *context, TlsConnectionEnd entity)
{
   error_t error;
   const char_t *label;

#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= SSL_VERSION_3_0)
   //SSL 3.0 currently selected?
   if(context->version == SSL_VERSION_3_0)
   {
      //Computation is performed at client or server side?
      label = (entity == TLS_CONNECTION_END_CLIENT) ? "CLNT" : "SRVR";

      //Compute MD5(masterSecret + pad2 + MD5(handshakeMessages + label + masterSecret + pad1))
      error = tlsFinalizeHandshakeHash(context, MD5_HASH_ALGO,
         context->handshakeMd5Context, label, context->verifyData);
      //Any error to report?
      if(error) return error;

      //Compute SHA(masterSecret + pad2 + SHA(handshakeMessages + label + masterSecret + pad1))
      error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
         context->handshakeSha1Context, label, context->verifyData + MD5_DIGEST_SIZE);
      //Any error to report?
      if(error) return error;
   }
   else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_0 && TLS_MIN_VERSION <= TLS_VERSION_1_1)
   //TLS 1.0 or 1.1 currently selected?
   if(context->version == TLS_VERSION_1_0 || context->version == TLS_VERSION_1_1)
   {
      //A temporary buffer is needed to concatenate MD5
      //and SHA-1 hash values before computing PRF
      uint8_t buffer[MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE];

      //Finalize MD5 hash computation
      error = tlsFinalizeHandshakeHash(context, MD5_HASH_ALGO,
         context->handshakeMd5Context, "", buffer);
      //Any error to report?
      if(error) return error;

      //Finalize SHA-1 hash computation
      error = tlsFinalizeHandshakeHash(context, SHA1_HASH_ALGO,
         context->handshakeSha1Context, "", buffer + MD5_DIGEST_SIZE);
      //Any error to report?
      if(error) return error;

      //Computation is performed at client or server side?
      label = (entity == TLS_CONNECTION_END_CLIENT) ? "client finished" : "server finished";

      //Verify data is always 12-byte long for TLS 1.0 and 1.1
      error = tlsPrf(context->masterSecret, 48, label, buffer,
         MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE, context->verifyData, 12);
      //Any error to report?
      if(error) return error;
   }
   else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_2 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
   //TLS 1.2 currently selected?
   if(context->version == TLS_VERSION_1_2)
   {
      //Allocate a memory buffer to hold the hash algorithm context
      HashContext *hashContext = osMemAlloc(context->prfHashAlgo->contextSize);
      //Failed to allocate memory?
      if(!hashContext) return ERROR_OUT_OF_MEMORY;

      //The original hash context must be preserved
      memcpy(hashContext, context->handshakeHashContext, context->prfHashAlgo->contextSize);
      //Finalize hash computation
      context->prfHashAlgo->final(hashContext, NULL);

      //Computation is performed at client or server side?
      label = (entity == TLS_CONNECTION_END_CLIENT) ? "client finished" : "server finished";

      //Generate the verify data
      error = tlsPrf2(context->prfHashAlgo, context->masterSecret, 48, label, hashContext->digest,
         context->prfHashAlgo->digestSize, context->verifyData, context->verifyDataLength);

      //Release previously allocated memory
      osMemFree(hashContext);

      //Any error to report?
      if(error) return error;
   }
   else
#endif
   //The negotiated TLS version is not valid...
   {
      //Report an error
      return ERROR_INVALID_VERSION;
   }

   //Debug message
   TRACE_DEBUG("Verify data:\r\n");
   TRACE_DEBUG_ARRAY("  ", context->verifyData, context->verifyDataLength);

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Encode a multiple precision integer to an opaque vector
 * @param[in] a Pointer to a multiple precision integer
 * @param[out] data Buffer where to store the opaque vector
 * @param[out] length Total number of bytes that have been written
 * @return Error code
 **/

error_t tlsWriteMpi(const Mpi *a, uint8_t *data, size_t *length)
{
   error_t error;
   size_t n;

   //Retrieve the actual size of the integer
   n = mpiGetByteLength(a);

   //The data is preceded by a 2-byte length field
   STORE16BE(n, data);

   //Convert the integer to an octet string
   error = mpiWriteRaw(a, data + 2, n);
   //Conversion failed?
   if(error) return error;

   //Return the total number of bytes that have been written
   *length = n + 2;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Read a multiple precision integer from an opaque vector
 * @param[out] a Resulting multiple precision integer
 * @param[in] data Buffer where to read the opaque vector
 * @param[in] size Total number of bytes available in the buffer
 * @param[out] length Total number of bytes that have been read
 * @return Error code
 **/

error_t tlsReadMpi(Mpi *a, const uint8_t *data, size_t size, size_t *length)
{
   error_t error;
   size_t n;

   //Buffer underrun?
   if(size < 2)
      return ERROR_DECODING_FAILED;

   //Decode the length field
   n = LOAD16BE(data);

   //Buffer underrun?
   if(size < (n + 2))
      return ERROR_DECODING_FAILED;

   //Convert the octet string to a multiple precision integer
   error = mpiReadRaw(a, data + 2, n);
   //Any error to report?
   if(error) return error;

   //Return the total number of bytes that have been read
   *length = n + 2;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Encode an EC point to an opaque vector
 * @param[in] params EC domain parameters
 * @param[in] a Pointer to an EC point
 * @param[out] data Buffer where to store the opaque vector
 * @param[out] length Total number of bytes that have been written
 * @return Error code
 **/

error_t tlsWriteEcPoint(const EcDomainParameters *params,
   const EcPoint *a, uint8_t *data, size_t *length)
{
   error_t error;

   //Convert the EC point to an octet string
   error = ecExport(params, a, data + 1, length);
   //Any error to report?
   if(error) return error;

   //Set the length of the opaque vector
   data[0] = *length;

   //Return the total number of bytes that have been written
   *length += 1;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Read an EC point from an opaque vector
 * @param[in] params EC domain parameters
 * @param[out] a Resulting EC point
 * @param[in] data Buffer where to read the opaque vector
 * @param[in] size Total number of bytes available in the buffer
 * @param[out] length Total number of bytes that have been read
 * @return Error code
 **/

error_t tlsReadEcPoint(const EcDomainParameters *params,
   EcPoint *a, const uint8_t *data, size_t size, size_t *length)
{
   error_t error;
   size_t n;

   //Buffer underrun?
   if(size < 1)
      return ERROR_DECODING_FAILED;

   //The EC point representation is preceded by a length field
   n = data[0];

   //Valid EC point representation?
   if(size < (n + 1))
      return ERROR_DECODING_FAILED;

   //Convert the octet string to an EC point
   error = ecImport(params, a, data + 1, n);
   //Any error to report?
   if(error) return error;

   //Return the total number of bytes that have been read
   *length = n + 1;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Generate RSA signature (SSL 3.0, TLS 1.0 and TLS 1.1)
 * @param[in] key Signer's RSA private key
 * @param[in] digest Digest of the message to be signed
 * @param[out] signature Resulting signature
 * @param[out] signatureLength Length of the resulting signature
 * @return Error code
 **/

error_t tlsGenerateRsaSignature(const RsaPrivateKey *key,
   const uint8_t *digest, uint8_t *signature, size_t *signatureLength)
{
   error_t error;
   size_t k;
   size_t paddingLength;
   uint8_t *em;
   Mpi m;
   Mpi s;

   //Debug message
   TRACE_DEBUG("RSA signature generation...\r\n");
   TRACE_DEBUG("  Modulus:\r\n");
   TRACE_DEBUG_MPI("    ", &key->n);
   TRACE_DEBUG("  Public exponent:\r\n");
   TRACE_DEBUG_MPI("    ", &key->e);
   TRACE_DEBUG("  Private exponent:\r\n");
   TRACE_DEBUG_MPI("    ", &key->d);
   TRACE_DEBUG("  Prime 1:\r\n");
   TRACE_DEBUG_MPI("    ", &key->p);
   TRACE_DEBUG("  Prime 2:\r\n");
   TRACE_DEBUG_MPI("    ", &key->q);
   TRACE_DEBUG("  Prime exponent 1:\r\n");
   TRACE_DEBUG_MPI("    ", &key->dp);
   TRACE_DEBUG("  Prime exponent 2:\r\n");
   TRACE_DEBUG_MPI("    ", &key->dq);
   TRACE_DEBUG("  Coefficient:\r\n");
   TRACE_DEBUG_MPI("    ", &key->qinv);
   TRACE_DEBUG("  Message digest:\r\n");
   TRACE_DEBUG_ARRAY("    ", digest, MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE);

   //Initialize multiple-precision integers
   mpiInit(&m);
   mpiInit(&s);

   //Get the length in octets of the modulus n
   k = mpiGetByteLength(&key->n);

   //Check the length of the modulus
   if(k < (MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE + 11))
      return ERROR_INVALID_KEY;

   //Point to the buffer where the encoded message EM will be generated
   em = signature;

   //The leading 0x00 octet ensures that the encoded message,
   //converted to an integer, is less than the modulus
   em[0] = 0x00;
   //Block type 0x01 is used for private-key operations
   em[1] = 0x01;

   //Compute the length of the padding string PS
   paddingLength = k - (MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE + 3);
   //Fill the padding string with 0xFF
   memset(em + 2, 0xFF, paddingLength);
   //Append a 0x00 octet to PS
   em[paddingLength + 2] = 0x00;

   //Append the digest value
   memcpy(em + paddingLength + 3, digest, MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE);

   //Debug message
   TRACE_DEBUG("  Encoded message\r\n");
   TRACE_DEBUG_ARRAY("    ", em, k);

   //Start of exception handling block
   do
   {
      //Convert the encoded message EM to an integer message representative m
      error = mpiReadRaw(&m, em, k);
      //Conversion failed?
      if(error) break;

      //Apply the RSASP1 signature primitive
      error = rsasp1(key, &m, &s);
      //Any error to report?
      if(error) break;

      //Convert the signature representative s to a signature of length k octets
      error = mpiWriteRaw(&s, signature, k);
      //Conversion failed?
      if(error) break;

      //Length of the resulting signature
      *signatureLength = k;

      //Debug message
      TRACE_DEBUG("  Signature:\r\n");
      TRACE_DEBUG_ARRAY("    ", signature, *signatureLength);

      //End of exception handling block
   } while(0);

   //Free previously allocated memory
   mpiFree(&m);
   mpiFree(&s);

   //Return status code
   return error;
}


/**
 * @brief Verify RSA signature (SSL 3.0, TLS 1.0 and TLS 1.1)
 * @param[in] key Signer's RSA public key
 * @param[in] digest Digest of the message whose signature is to be verified
 * @param[in] signature Signature to be verified
 * @param[in] signatureLength Length of the signature to be verified
 * @return Error code
 **/

error_t tlsVerifyRsaSignature(const RsaPublicKey *key,
   const uint8_t *digest, const uint8_t *signature, size_t signatureLength)
{
   error_t error;
   uint_t i;
   uint_t k;
   uint8_t *em;
   Mpi s;
   Mpi m;

   //Debug message
   TRACE_DEBUG("RSA signature verification...\r\n");
   TRACE_DEBUG("  Modulus:\r\n");
   TRACE_DEBUG_MPI("    ", &key->n);
   TRACE_DEBUG("  Public exponent:\r\n");
   TRACE_DEBUG_MPI("    ", &key->e);
   TRACE_DEBUG("  Message digest:\r\n");
   TRACE_DEBUG_ARRAY("    ", digest, MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE);
   TRACE_DEBUG("  Signature:\r\n");
   TRACE_DEBUG_ARRAY("    ", signature, signatureLength);

   //Get the length in octets of the modulus n
   k = mpiGetByteLength(&key->n);

   //Check the length of the signature
   if(signatureLength != k)
      return ERROR_INVALID_SIGNATURE;

   //Initialize multiple-precision integers
   mpiInit(&s);
   mpiInit(&m);

   //Allocate a memory buffer to hold the encoded message
   em = osMemAlloc(k);
   //Failed to allocate memory?
   if(!em) return ERROR_OUT_OF_MEMORY;

   //Start of exception handling block
   do
   {
      //Convert the signature to an integer signature representative s
      error = mpiReadRaw(&s, signature, signatureLength);
      //Conversion failed?
      if(error) break;

      //Apply the RSAVP1 verification primitive
      error = rsavp1(key, &s, &m);
      //Any error to report?
      if(error) break;

      //Convert the message representative m to an encoded message EM of length k octets
      error = mpiWriteRaw(&m, em, k);
      //Conversion failed?
      if(error) break;

      //Debug message
      TRACE_DEBUG("  Encoded message\r\n");
      TRACE_DEBUG_ARRAY("    ", em, k);

      //Assume an error...
      error = ERROR_INVALID_SIGNATURE;

      //The first octet of EM must have a value of 0x00
      if(em[0] != 0x00) break;
      //The block type BT shall be 0x01
      if(em[1] != 0x01) break;

      //Check the padding string PS
      for(i = 2; i < k; i++)
      {
         //A 0x00 octet indicates the end of the padding string
         if(em[i] == 0x00) break;
         //Each byte of PS must be set to 0xFF when the block type is 0x01
         if(em[i] != 0xFF) break;
      }

      //Check whether the padding string is properly terminated
      if(i >= k || em[i] != 0x00) break;
      //The length of PS cannot be less than 8 octets
      if(i < 10) break;

      //Check the length of the digest
      if((k - i - 1) != (MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE))
         break;
      //Check the digest value
      if(memcmp(digest, em + i + 1, MD5_DIGEST_SIZE + SHA1_DIGEST_SIZE))
         break;

      //The RSA signature is valid
      error = NO_ERROR;

      //End of exception handling block
   } while(0);

   //Release multiple precision integers
   mpiFree(&s);
   mpiFree(&m);
   //Release previously allocated memory
   osMemFree(em);

   //Return status code
   return error;
}


/**
 * @brief Generate DSA signature
 * @param[in] prngAlgo PRNG algorithm
 * @param[in] prngContext Pointer to the PRNG context
 * @param[in] key Signer's DSA private key
 * @param[in] digest Digest of the message to be signed
 * @param[in] digestLength Length in octets of the digest
 * @param[out] signature Resulting signature
 * @param[out] signatureLength Length of the resulting signature
 * @return Error code
 **/

error_t tlsGenerateDsaSignature(const PrngAlgo *prngAlgo, void *prngContext, const DsaPrivateKey *key,
   const uint8_t *digest, size_t digestLength, uint8_t *signature, size_t *signatureLength)
{
   error_t error;
   DsaSignature dsaSignature;

   //Initialize DSA signature
   dsaInitSignature(&dsaSignature);

   //Generate DSA signature
   error = dsaGenerateSignature(prngAlgo, prngContext,
      key, digest, digestLength, &dsaSignature);
   //Failed to generate signature?
   if(error) return error;

   //Encode the resulting (R, S) integer pair using ASN.1
   error = dsaWriteSignature(&dsaSignature, signature, signatureLength);

   //Free previously allocated resources
   dsaFreeSignature(&dsaSignature);

   //Return status code
   return error;
}


/**
 * @brief Verify DSA signature
 * @param[in] key Signer's DSA public key
 * @param[in] digest Digest of the message whose signature is to be verified
 * @param[in] digestLength Length in octets of the digest
 * @param[in] signature Signature to be verified
 * @param[in] signatureLength Length of the signature to be verified
 * @return Error code
 **/

error_t tlsVerifyDsaSignature(const DsaPublicKey *key, const uint8_t *digest,
   size_t digestLength, const uint8_t *signature, size_t signatureLength)
{
   error_t error;
   DsaSignature dsaSignature;

   //Initialize DSA signature
   dsaInitSignature(&dsaSignature);

   //Read the ASN.1 encoded DSA signature
   error = dsaReadSignature(signature, signatureLength, &dsaSignature);
   //Failed to decode ASN.1 structure?
   if(error) return error;

   //DSA signature verification
   error = dsaVerifySignature(key, digest, digestLength, &dsaSignature);

   //Free previously allocated resources
   dsaFreeSignature(&dsaSignature);

   //Return status code
   return error;
}


/**
 * @brief Generate ECDSA signature
 * @param[in] params EC domain parameters
 * @param[in] prngAlgo PRNG algorithm
 * @param[in] prngContext Pointer to the PRNG context
 * @param[in] key Signer's ECDSA private key
 * @param[in] digest Digest of the message to be signed
 * @param[in] digestLength Length in octets of the digest
 * @param[out] signature Resulting signature
 * @param[out] signatureLength Length of the resulting signature
 * @return Error code
 **/

error_t tlsGenerateEcdsaSignature(const EcDomainParameters *params,
   const PrngAlgo *prngAlgo, void *prngContext, const Mpi *key, const uint8_t *digest,
   size_t digestLength, uint8_t *signature, size_t *signatureLength)
{
   error_t error;
   EcdsaSignature ecdsaSignature;

   //Initialize ECDSA signature
   ecdsaInitSignature(&ecdsaSignature);

   //Generate ECDSA signature
   error = ecdsaGenerateSignature(params, prngAlgo,
      prngContext, key, digest, digestLength, &ecdsaSignature);
   //Failed to generate signature?
   if(error) return error;

   //Encode the resulting (R, S) integer pair using ASN.1
   error = ecdsaWriteSignature(&ecdsaSignature, signature, signatureLength);

   //Free previously allocated resources
   ecdsaFreeSignature(&ecdsaSignature);

   //Return status code
   return error;
}


/**
 * @brief Verify ECDSA signature
 * @param[in] params EC domain parameters
 * @param[in] key Signer's ECDSA public key
 * @param[in] digest Digest of the message whose signature is to be verified
 * @param[in] digestLength Length in octets of the digest
 * @param[in] signature Signature to be verified
 * @param[in] signatureLength Length of the signature to be verified
 * @return Error code
 **/

error_t tlsVerifyEcdsaSignature(const EcDomainParameters *params,
   const EcPoint *key, const uint8_t *digest, size_t digestLength,
   const uint8_t *signature, size_t signatureLength)
{
   error_t error;
   EcdsaSignature ecdsaSignature;

   //Initialize ECDSA signature
   ecdsaInitSignature(&ecdsaSignature);

   //Read the ASN.1 encoded ECDSA signature
   error = ecdsaReadSignature(signature, signatureLength, &ecdsaSignature);
   //Failed to decode ASN.1 structure?
   if(error) return error;

   //ECDSA signature verification
   error = ecdsaVerifySignature(params, key,
      digest, digestLength, &ecdsaSignature);

   //Free previously allocated resources
   ecdsaFreeSignature(&ecdsaSignature);

   //Return status code
   return error;
}


/**
 * @brief Key generation
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsGenerateKeys(TlsContext *context)
{
   error_t error;
   size_t i;
   size_t n;
   uint8_t temp;

   //Length of necessary key material
   n = 2 * (context->macKeyLength + context->encKeyLength + context->fixedIvLength);

   //Make sure that the key block is large enough
   if(n > sizeof(context->keyBlock))
      return ERROR_FAILURE;

   //Debug message
   TRACE_DEBUG("Generating keys...\r\n");
   TRACE_DEBUG("  Client random bytes:\r\n");
   TRACE_DEBUG_ARRAY("    ", &context->clientRandom, 32);
   TRACE_DEBUG("  Server random bytes:\r\n");
   TRACE_DEBUG_ARRAY("    ", &context->serverRandom, 32);

   //If a full handshake is being performed, the premaster secret
   //shall be first converted to the master secret
   if(!context->resume)
   {
      //Debug message
      TRACE_DEBUG("  Premaster secret:\r\n");
      TRACE_DEBUG_ARRAY("    ", context->premasterSecret, context->premasterSecretLength);

      //Convert the premaster secret to the master secret
      if(context->version == SSL_VERSION_3_0)
      {
         //SSL 3.0 does not use a PRF, instead makes use abundantly of MD5
         error = sslExpandKey(context->premasterSecret, context->premasterSecretLength,
            context->random, 64, context->masterSecret, 48);
      }
      else if(context->version <= TLS_VERSION_1_1)
      {
         //TLS 1.0 and 1.1 use a PRF that combines MD5 and SHA-1
         error = tlsPrf(context->premasterSecret, context->premasterSecretLength,
            "master secret", context->random, 64, context->masterSecret, 48);
      }
      else
      {
         //TLS 1.2 PRF uses SHA-256 or a stronger hash algorithm
         //as the core function in its construction
         error = tlsPrf2(context->prfHashAlgo, context->premasterSecret,
            context->premasterSecretLength, "master secret",
            context->random, 64, context->masterSecret, 48);
      }

      //Check the return status
      if(error) return error;

      //The premaster secret should be deleted from memory
      //once the master secret has been computed
      memset(context->premasterSecret, 0, 48);
   }

   //Debug message
   TRACE_DEBUG("  Master secret:\r\n");
   TRACE_DEBUG_ARRAY("    ", context->masterSecret, 48);

   //Exchange client and server random bytes
   for(i = 0; i < 32; i++)
   {
      //Swap each byte
      temp = context->random[i];
      context->random[i] = context->random[i + 32];
      context->random[i + 32] = temp;
   }

   //Perform key expansion
   if(context->version == SSL_VERSION_3_0)
   {
      //SSL 3.0 does not use a PRF, instead makes use abundantly of MD5
      error = sslExpandKey(context->masterSecret, 48,
         context->random, 64, context->keyBlock, n);
   }
   else if(context->version <= TLS_VERSION_1_1)
   {
      //TLS 1.0 and 1.1 use a PRF that combines MD5 and SHA-1
      error = tlsPrf(context->masterSecret, 48, "key expansion",
         context->random, 64, context->keyBlock, n);
   }
   else
   {
      //TLS 1.2 PRF uses SHA-256 or a stronger hash algorithm
      //as the core function in its construction
      error = tlsPrf2(context->prfHashAlgo, context->masterSecret, 48,
         "key expansion", context->random, 64, context->keyBlock, n);
   }

   //Exchange client and server random bytes
   for(i = 0; i < 32; i++)
   {
      //Swap each byte
      temp = context->random[i];
      context->random[i] = context->random[i + 32];
      context->random[i + 32] = temp;
   }

   //Any error while performing key expansion?
   if(error) return error;

   //Debug message
   TRACE_DEBUG("  Key block:\r\n");
   TRACE_DEBUG_ARRAY("    ", context->keyBlock, n);

   //TLS operates as a client?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //MAC keys
      context->writeMacKey = context->keyBlock;
      context->readMacKey = context->writeMacKey + context->macKeyLength;
      //Encryption keys
      context->writeEncKey = context->readMacKey + context->macKeyLength;
      context->readEncKey = context->writeEncKey + context->encKeyLength;
      //Initialization vectors
      context->writeIv = context->readEncKey + context->encKeyLength;
      context->readIv = context->writeIv + context->fixedIvLength;
   }
   //TLS operates as a server?
   else
   {
      //MAC keys
      context->readMacKey = context->keyBlock;
      context->writeMacKey = context->readMacKey + context->macKeyLength;
      //Encryption keys
      context->readEncKey = context->writeMacKey + context->macKeyLength;
      context->writeEncKey = context->readEncKey + context->encKeyLength;
      //Initialization vectors
      context->readIv = context->writeEncKey + context->encKeyLength;
      context->writeIv = context->readIv + context->fixedIvLength;
   }

   //Dump MAC keys for debugging purpose
   if(context->macKeyLength > 0)
   {
      TRACE_DEBUG("  Write MAC key:\r\n");
      TRACE_DEBUG_ARRAY("    ", context->writeMacKey, context->macKeyLength);
      TRACE_DEBUG("  Read MAC key:\r\n");
      TRACE_DEBUG_ARRAY("    ", context->readMacKey, context->macKeyLength);
   }

   //Dump encryption keys for debugging purpose
   TRACE_DEBUG("  Write encryption key:\r\n");
   TRACE_DEBUG_ARRAY("    ", context->writeEncKey, context->encKeyLength);
   TRACE_DEBUG("  Read encryption key:\r\n");
   TRACE_DEBUG_ARRAY("    ", context->readEncKey, context->encKeyLength);

   //Dump initialization vectors for debugging purpose
   if(context->fixedIvLength > 0)
   {
      TRACE_DEBUG("  Write IV:\r\n");
      TRACE_DEBUG_ARRAY("    ", context->writeIv, context->fixedIvLength);
      TRACE_DEBUG("  Read IV:\r\n");
      TRACE_DEBUG_ARRAY("    ", context->readIv, context->fixedIvLength);
   }

   //Key generation is successful
   return NO_ERROR;
}


/**
 * @brief Pseudorandom function (TLS 1.0 and 1.1)
 *
 * The pseudorandom function (PRF) takes as input a secret, a seed, and
 * an identifying label and produces an output of arbitrary length. This
 * function is used to expand secrets into blocks of data for the purpose
 * of key generation
 *
 * @param[in] secret Pointer to the secret
 * @param[in] secretLength Length of the secret
 * @param[in] label Identifying label (NULL-terminated string)
 * @param[in] seed Pointer to the seed
 * @param[in] seedLength Length of the seed
 * @param[out] output Pointer to the output
 * @param[in] outputLength Desired output length
 * @return Error code
 **/

error_t tlsPrf(const uint8_t *secret, size_t secretLength, const char_t *label,
   const uint8_t *seed, size_t seedLength, uint8_t *output, size_t outputLength)
{
   uint_t i;
   uint_t j;
   size_t labelLength;
   size_t sLength;
   const uint8_t *s1;
   const uint8_t *s2;
   uint8_t a[SHA1_DIGEST_SIZE];

   //Allocate a memory buffer to hold the HMAC context
   HmacContext *context = osMemAlloc(sizeof(HmacContext));
   //Failed to allocate memory?
   if(!context) return ERROR_OUT_OF_MEMORY;

   //Compute the length of the label
   labelLength = strlen(label);

   //The secret is partitioned into two halves S1 and S2
   //with the possibility of one shared byte
   sLength = (secretLength + 1) / 2;
   //S1 is taken from the first half of the secret
   s1 = secret;
   //S2 is taken from the second half
   s2 = secret + secretLength - sLength;

   //First compute A(1) = HMAC_MD5(S1, label + seed)
   hmacInit(context, MD5_HASH_ALGO, s1, sLength);
   hmacUpdate(context, label, labelLength);
   hmacUpdate(context, seed, seedLength);
   hmacFinal(context, a);

   //Apply the data expansion function P_MD5
   for(i = 0; i < outputLength; )
   {
      //Compute HMAC_MD5(S1, A(i) + label + seed)
      hmacInit(context, MD5_HASH_ALGO, s1, sLength);
      hmacUpdate(context, a, MD5_DIGEST_SIZE);
      hmacUpdate(context, label, labelLength);
      hmacUpdate(context, seed, seedLength);
      hmacFinal(context, NULL);

      //Copy the resulting digest
      for(j = 0; i < outputLength && j < MD5_DIGEST_SIZE; i++, j++)
         output[i] = context->digest[j];

      //Compute A(i + 1) = HMAC_MD5(S1, A(i))
      hmacInit(context, MD5_HASH_ALGO, s1, sLength);
      hmacUpdate(context, a, MD5_DIGEST_SIZE);
      hmacFinal(context, a);
   }

   //First compute A(1) = HMAC_SHA1(S2, label + seed)
   hmacInit(context, SHA1_HASH_ALGO, s2, sLength);
   hmacUpdate(context, label, labelLength);
   hmacUpdate(context, seed, seedLength);
   hmacFinal(context, a);

   //Apply the data expansion function P_SHA1
   for(i = 0; i < outputLength; )
   {
      //Compute HMAC_SHA1(S2, A(i) + label + seed)
      hmacInit(context, SHA1_HASH_ALGO, s2, sLength);
      hmacUpdate(context, a, SHA1_DIGEST_SIZE);
      hmacUpdate(context, label, labelLength);
      hmacUpdate(context, seed, seedLength);
      hmacFinal(context, NULL);

      //Copy the resulting digest
      for(j = 0; i < outputLength && j < SHA1_DIGEST_SIZE; i++, j++)
         output[i] ^= context->digest[j];

      //Compute A(i + 1) = HMAC_SHA1(S2, A(i))
      hmacInit(context, SHA1_HASH_ALGO, s2, sLength);
      hmacUpdate(context, a, SHA1_DIGEST_SIZE);
      hmacFinal(context, a);
   }

   //Free previously allocated memory
   osMemFree(context);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Pseudorandom function (TLS 1.2)
 *
 * The pseudorandom function (PRF) takes as input a secret, a seed, and
 * an identifying label and produces an output of arbitrary length. This
 * function is used to expand secrets into blocks of data for the purpose
 * of key generation
 *
 * @param[in] hash Hash function used to compute PRF
 * @param[in] secret Pointer to the secret
 * @param[in] secretLength Length of the secret
 * @param[in] label Identifying label (NULL-terminated string)
 * @param[in] seed Pointer to the seed
 * @param[in] seedLength Length of the seed
 * @param[out] output Pointer to the output
 * @param[in] outputLength Desired output length
 * @return Error code
 **/

error_t tlsPrf2(const HashAlgo *hash, const uint8_t *secret, size_t secretLength,
   const char_t *label, const uint8_t *seed, size_t seedLength, uint8_t *output, size_t outputLength)
{
   size_t n;
   size_t labelLength;
   uint8_t a[MAX_HASH_DIGEST_SIZE];

   //Allocate a memory buffer to hold the HMAC context
   HmacContext *context = osMemAlloc(sizeof(HmacContext));
   //Failed to allocate memory?
   if(!context) return ERROR_OUT_OF_MEMORY;

   //Compute the length of the label
   labelLength = strlen(label);

   //First compute A(1) = HMAC_hash(secret, label + seed)
   hmacInit(context, hash, secret, secretLength);
   hmacUpdate(context, label, labelLength);
   hmacUpdate(context, seed, seedLength);
   hmacFinal(context, a);

   //Apply the data expansion function P_hash
   while(outputLength > 0)
   {
      //Compute HMAC_hash(secret, A(i) + label + seed)
      hmacInit(context, hash, secret, secretLength);
      hmacUpdate(context, a, hash->digestSize);
      hmacUpdate(context, label, labelLength);
      hmacUpdate(context, seed, seedLength);
      hmacFinal(context, NULL);

      //Calculate the number of bytes to copy
      n = min(outputLength, hash->digestSize);
      //Copy the resulting digest
      memcpy(output, context->digest, n);

      //Compute A(i + 1) = HMAC_hash(secret, A(i))
      hmacInit(context, hash, secret, secretLength);
      hmacUpdate(context, a, hash->digestSize);
      hmacFinal(context, a);

      //Advance data pointer
      output += n;
      //Decrement byte counter
      outputLength -= n;
   }

   //Free previously allocated memory
   osMemFree(context);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Check whether a certificate is acceptable
 * @param[in] cert End entity certificate
 * @param[in] certTypes List of supported certificate types
 * @param[in] numCertTypes Size of the list that contains the supported certificate types
 * @param[in] signHashAlgos List of supported signature algorithms
 * @param[in] curveList List of supported elliptic curves
 * @param[in] certAuthorities List of trusted CA
 * @return TRUE if the specified certificate conforms to the requirements, else FALSE
 **/

bool_t tlsIsCertificateAcceptable(const TlsCertDesc *cert,
   const uint8_t *certTypes, size_t numCertTypes, const TlsSignHashAlgos *signHashAlgos,
   const TlsEllipticCurveList *curveList, const TlsCertAuthorities *certAuthorities)
{
   size_t i;
   size_t n;
   size_t length;
   bool_t acceptable;

   //Make sure that a valid certificate has been loaded
   if(!cert->certChain || !cert->certChainLength)
      return FALSE;

   //This flag tells whether the certificate is acceptable
   acceptable = TRUE;

   //Filter out certificates with unsupported type
   if(numCertTypes > 0)
   {
      //Loop through the list of supported certificate types
      for(acceptable = FALSE, i = 0; i < numCertTypes; i++)
      {
         //Check whether the certificate type is acceptable
         if(certTypes[i] == cert->type)
         {
            acceptable = TRUE;
            break;
         }
      }
   }

   //Filter out certificates that are signed with an unsupported
   //hash/signature algorithm
   if(acceptable && signHashAlgos != NULL)
   {
      //Retrieve the number of items in the list
      n = ntohs(signHashAlgos->length) / sizeof(TlsSignHashAlgo);

      //Loop through the list of supported hash/signature algorithm pairs
      for(acceptable = FALSE, i = 0; i < n; i++)
      {
         //The certificate must be signed using a valid hash/signature algorithm pair
         if(signHashAlgos->value[i].signature == cert->signAlgo &&
            signHashAlgos->value[i].hash == cert->hashAlgo)
         {
            acceptable = TRUE;
            break;
         }
      }
   }

   //Check whether the certificate contains an ECDSA public key
   if(cert->type == TLS_CERT_ECDSA_SIGN)
   {
      //Filter out ECDSA certificates that use an unsupported elliptic curve
      if(acceptable && curveList != NULL)
      {
         //Retrieve the number of items in the list
         n = ntohs(curveList->length) / sizeof(uint16_t);

         //Loop through the list of supported elliptic curves
         for(acceptable = FALSE, i = 0; i < n; i++)
         {
            //Check whether the elliptic curve is supported
            if(htons(curveList->value[i]) == cert->namedCurve)
            {
               acceptable = TRUE;
               break;
            }
         }
      }
   }

   //Filter out certificates that are issued by a non trusted CA
   if(acceptable && certAuthorities != NULL)
   {
      //Retrieve the length of the list
      length = ntohs(certAuthorities->length);

      //If the certificate authorities list is empty, then the client
      //may send any certificate of the appropriate type
      if(length > 0)
      {
         error_t error;
         const uint8_t *p;
         const char_t *pemCert;
         size_t pemCertLength;
         uint8_t *derCert;
         size_t derCertSize;
         size_t derCertLength;
         X509CertificateInfo *certInfo;

         //The list of acceptable certificate authorities describes the known roots CA
         acceptable = FALSE;

         //Point to the first distinguished name
         p = certAuthorities->value;

         //Point to the end entity certificate
         pemCert = cert->certChain;
         //Get the total length, in bytes, of the certificate chain
         pemCertLength = cert->certChainLength;

         //DER encoded certificate
         derCert = NULL;
         derCertSize = 0;
         derCertLength = 0;

         //Start of exception handling block
         do
         {
            //Allocate a memory buffer to store X.509 certificate info
            certInfo = osMemAlloc(sizeof(X509CertificateInfo));
            //Failed to allocate memory?
            if(!certInfo) break;

            //Point to the last certificate of the chain
            do
            {
               //Read PEM certificates, one by one
               error = pemReadCertificate(&pemCert, &pemCertLength,
                  &derCert, &derCertSize, &derCertLength);

               //Loop as long as necessary
            } while(!error);

            //Any error to report?
            if(error != ERROR_END_OF_FILE)
               break;

            //Parse the last certificate of the chain
            error = x509ParseCertificate(derCert, derCertLength, certInfo);
            //Failed to parse the X.509 certificate?
            if(error) break;

            //Parse each distinguished name of the list
            while(length > 0)
            {
               //Sanity check
               if(length < 2)
                  break;

               //Each distinguished name is preceded by a 2-byte length field
               n = LOAD16BE(p);

               //Make sure the length field is valid
               if(length < (n + 2))
                  break;

               //Check if the distinguished name matches the root CA
               if(n == certInfo->issuer.rawDataLen && !memcmp(p + 2, certInfo->issuer.rawData, n))
               {
                  acceptable = TRUE;
                  break;
               }

               //Advance data pointer
               p += n + 2;
               //Number of bytes left in the list
               length -= n + 2;
            }

            //End of exception handling block
         } while(0);

         //Release previously allocated memory
         osMemFree(derCert);
         osMemFree(certInfo);
      }
   }

   //The return value specifies whether all the criteria were matched
   return acceptable;
}


/**
 * @brief Retrieve the certificate type
 * @param[in] certInfo X.509 certificate
 * @param[out] certType Certificate type
 * @param[out] certSignAlgo Signature algorithm that has been used to sign the certificate
 * @param[out] certHashAlgo Hash algorithm that has been used to sign the certificate
 * @param[out] namedCurve Elliptic curve (only for ECDSA certificates)
 * @return Error code
 **/

error_t tlsGetCertificateType(const X509CertificateInfo *certInfo, TlsCertificateType *certType,
   TlsSignatureAlgo *certSignAlgo, TlsHashAlgo *certHashAlgo, TlsEcNamedCurve *namedCurve)
{
   //Check parameters
   if(certInfo == NULL || certType == NULL || certSignAlgo == NULL ||
      certHashAlgo == NULL || namedCurve == NULL)
   {
      //Report an error
      return ERROR_INVALID_PARAMETER;
   }

   //A valid RSA public key has been found?
   if(oidComp(certInfo->subjectPublicKeyInfo.oid, certInfo->subjectPublicKeyInfo.oidLen,
      RSA_ENCRYPTION_OID, sizeof(RSA_ENCRYPTION_OID)))
   {
      //Save certificate type
      *certType = TLS_CERT_RSA_SIGN;
      //Elliptic curve cryptography is not used
      *namedCurve = TLS_EC_CURVE_NONE;
   }
   //A valid DSA public key has been found?
   else if(oidComp(certInfo->subjectPublicKeyInfo.oid, certInfo->subjectPublicKeyInfo.oidLen,
      DSA_OID, sizeof(DSA_OID)))
   {
      //Save certificate type
      *certType = TLS_CERT_DSS_SIGN;
      //Elliptic curve cryptography is not used
      *namedCurve = TLS_EC_CURVE_NONE;
   }
   //A valid EC public key has been found?
   else if(oidComp(certInfo->subjectPublicKeyInfo.oid, certInfo->subjectPublicKeyInfo.oidLen,
      EC_PUBLIC_KEY_OID, sizeof(EC_PUBLIC_KEY_OID)))
   {
      //Save certificate type
      *certType = TLS_CERT_ECDSA_SIGN;

      //Retrieve the named curve that has been used to generate the EC public key
      *namedCurve = tlsGetNamedCurve(certInfo->subjectPublicKeyInfo.ecParams.namedCurve,
         certInfo->subjectPublicKeyInfo.ecParams.namedCurveLen);
   }
   //The certificate does not contain any valid public key...
   else
   {
      //Report an error
      return ERROR_BAD_CERTIFICATE;
   }

   //Retrieve the signature algorithm that has been used to sign the certificate
   if(!certInfo->signatureAlgo || !certInfo->signatureAlgoLen)
   {
      //Invalid certificate
      return ERROR_BAD_CERTIFICATE;
   }
#if (TLS_RSA_SIGN_SUPPORT == ENABLED)
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      MD5_WITH_RSA_ENCRYPTION_OID, sizeof(MD5_WITH_RSA_ENCRYPTION_OID)))
   {
      //MD5 with RSA signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_RSA;
      *certHashAlgo = TLS_HASH_ALGO_MD5;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      SHA1_WITH_RSA_ENCRYPTION_OID, sizeof(SHA1_WITH_RSA_ENCRYPTION_OID)))
   {
      //SHA-1 with RSA signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_RSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA1;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      SHA256_WITH_RSA_ENCRYPTION_OID, sizeof(SHA256_WITH_RSA_ENCRYPTION_OID)))
   {
      //SHA-256 with RSA signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_RSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA256;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      SHA384_WITH_RSA_ENCRYPTION_OID, sizeof(SHA384_WITH_RSA_ENCRYPTION_OID)))
   {
      //SHA-384 with RSA signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_RSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA384;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      SHA512_WITH_RSA_ENCRYPTION_OID, sizeof(SHA512_WITH_RSA_ENCRYPTION_OID)))
   {
      //SHA-512 with RSA signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_RSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA512;
   }
#endif
#if (TLS_DSA_SIGN_SUPPORT == ENABLED)
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      DSA_WITH_SHA1_OID, sizeof(DSA_WITH_SHA1_OID)))
   {
      //DSA with SHA-1 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_DSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA1;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      DSA_WITH_SHA224_OID, sizeof(DSA_WITH_SHA224_OID)))
   {
      //DSA with SHA-224 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_DSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA224;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      DSA_WITH_SHA256_OID, sizeof(DSA_WITH_SHA256_OID)))
   {
      //DSA with SHA-256 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_DSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA256;
   }
#endif
#if (TLS_ECDSA_SIGN_SUPPORT == ENABLED)
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      ECDSA_WITH_SHA1_OID, sizeof(ECDSA_WITH_SHA1_OID)))
   {
      //ECDSA with SHA-1 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_ECDSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA1;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      ECDSA_WITH_SHA224_OID, sizeof(ECDSA_WITH_SHA224_OID)))
   {
      //ECDSA with SHA-224 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_ECDSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA224;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      ECDSA_WITH_SHA256_OID, sizeof(ECDSA_WITH_SHA256_OID)))
   {
      //ECDSA with SHA-256 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_ECDSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA256;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      ECDSA_WITH_SHA384_OID, sizeof(ECDSA_WITH_SHA384_OID)))
   {
      //ECDSA with SHA-384 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_ECDSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA384;
   }
   else if(oidComp(certInfo->signatureAlgo, certInfo->signatureAlgoLen,
      ECDSA_WITH_SHA512_OID, sizeof(ECDSA_WITH_SHA512_OID)))
   {
      //ECDSA with SHA-512 signature algorithm
      *certSignAlgo = TLS_SIGN_ALGO_ECDSA;
      *certHashAlgo = TLS_HASH_ALGO_SHA512;
   }
#endif
   else
   {
      //The signature algorithm is not supported...
      return ERROR_BAD_CERTIFICATE;
   }

   //X.509 certificate successfully parsed
   return NO_ERROR;
}


/**
 * @brief Find the specified extension
 * @param[in] data Pointer to the list of extensions
 * @param[in] length Length in bytes of the list
 * @param[in] type Expected extension type
 * @return If the specified extension was found, a pointer to the corresponding
 *   extension is returned. Otherwise NULL pointer is returned
 **/

const TlsExtension *tlsGetExtension(const uint8_t *data, size_t length, uint16_t type)
{
   size_t n;
   const TlsExtension *extension;

   //Sanity check
   if(length < 2)
      return NULL;

   //Retrieve the length of the list
   n = LOAD16BE(data);

   //Sanity check
   if(length < (n + 2))
      return NULL;

   //Point to the first extension of the list
   data += 2;

   //Parse the list of extensions offered by the peer
   while(n > 0)
   {
      //Point to the current extension
      extension = (TlsExtension *) data;

      //Check the length of the extension
      if(n < sizeof(TlsExtension))
         break;
      if(n < (sizeof(TlsExtension) + ntohs(extension->length)))
         break;

      //Check whether the extension type matches the specified one
      if(ntohs(extension->type) == type)
         return extension;

      //Jump to the next extension
      data += sizeof(TlsExtension) + ntohs(extension->length);
      //Remaining bytes to process
      n -= sizeof(TlsExtension) + ntohs(extension->length);
   }

   //The specified extension type was not found
   return NULL;
}


/**
 * @brief Convert TLS version to string representation
 * @param[in] version Version number
 * @return Cipher suite name
 **/

const char_t *tlsGetVersionName(uint16_t version)
{
   //TLS versions
   static const char_t *label[] = {"SSL 3.0", "TLS 1.0", "TLS 1.1", "TLS 1.2", "Unknown"};

   //Check current version
   if(version == SSL_VERSION_3_0)
      return label[0];
   else if(version == TLS_VERSION_1_0)
      return label[1];
   else if(version == TLS_VERSION_1_1)
      return label[2];
   else if(version == TLS_VERSION_1_2)
      return label[3];
   else
      return label[4];
}


/**
 * @brief Get the hash algorithm that matches the specified identifier
 * @param[in] hashAlgoId Hash algorithm identifier
 * @return Cipher suite name
 **/

const HashAlgo *tlsGetHashAlgo(uint8_t hashAlgoId)
{
   //MD5 hash identifier?
   if(hashAlgoId == TLS_HASH_ALGO_MD5)
      return MD5_HASH_ALGO;
   //SHA-1 hash identifier?
   else if(hashAlgoId == TLS_HASH_ALGO_SHA1)
      return SHA1_HASH_ALGO;
#if (TLS_SHA224_SUPPORT == ENABLED)
   //SHA-224 hash identifier?
   else if(hashAlgoId == TLS_HASH_ALGO_SHA224)
      return SHA224_HASH_ALGO;
#endif
   //SHA-256 hash identifier?
   else if(hashAlgoId == TLS_HASH_ALGO_SHA256)
      return SHA256_HASH_ALGO;
#if (TLS_SHA384_SUPPORT == ENABLED)
   //SHA-384 hash identifier?
   else if(hashAlgoId == TLS_HASH_ALGO_SHA384)
      return SHA384_HASH_ALGO;
#endif
#if (TLS_SHA512_SUPPORT == ENABLED)
   //SHA-512 hash identifier?
   else if(hashAlgoId == TLS_HASH_ALGO_SHA512)
      return SHA512_HASH_ALGO;
#endif
   //Unknown hash identifier?
   else
      return NULL;
}


/**
 * @brief Get the EC domain parameters that match the specified named curve
 * @param[in] namedCurve Elliptic curve identifier
 * @return Elliptic curve domain parameters
 **/

const EcCurveInfo *tlsGetCurveInfo(uint16_t namedCurve)
{
   //Explicit prime elliptic curves are not supported
   if(namedCurve == TLS_EC_CURVE_ARBITRARY_EXPLICIT_PRIME)
      return NULL;
   //Explicit characteristic-2 elliptic curves are not supported
   else if(namedCurve == TLS_EC_CURVE_ARBITRARY_EXPLICIT_CHAR2)
      return NULL;
#if (TLS_SECP160K1_SUPPORT == ENABLED)
   //secp160k1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP160K1)
      return SECP160K1_CURVE;
#endif
#if (TLS_SECP160R1_SUPPORT == ENABLED)
   //secp160r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP160R1)
      return SECP160R1_CURVE;
#endif
#if (TLS_SECP160R2_SUPPORT == ENABLED)
   //secp160r2 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP160R2)
      return SECP160R2_CURVE;
#endif
#if (TLS_SECP192K1_SUPPORT == ENABLED)
   //secp192k1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP192K1)
      return SECP192K1_CURVE;
#endif
#if (TLS_SECP192R1_SUPPORT == ENABLED)
   //secp192r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP192R1)
      return SECP192R1_CURVE;
#endif
#if (TLS_SECP224K1_SUPPORT == ENABLED)
   //secp224k1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP224K1)
      return SECP224K1_CURVE;
#endif
#if (TLS_SECP224R1_SUPPORT == ENABLED)
   //secp224r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP224R1)
      return SECP224R1_CURVE;
#endif
#if (TLS_SECP256K1_SUPPORT == ENABLED)
   //secp256k1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP256K1)
      return SECP256K1_CURVE;
#endif
#if (TLS_SECP256R1_SUPPORT == ENABLED)
   //secp256r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP256R1)
      return SECP256R1_CURVE;
#endif
#if (TLS_SECP384R1_SUPPORT == ENABLED)
   //secp384r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP384R1)
      return SECP384R1_CURVE;
#endif
#if (TLS_SECP521R1_SUPPORT == ENABLED)
   //secp521r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_SECP521R1)
      return SECP521R1_CURVE;
#endif
#if (TLS_BRAINPOOLP256R1_SUPPORT == ENABLED)
   //brainpoolP256r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_BRAINPOOLP256R1)
      return BRAINPOOLP256R1_CURVE;
#endif
#if (TLS_BRAINPOOLP384R1_SUPPORT == ENABLED)
   //brainpoolP384r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_BRAINPOOLP384R1)
      return BRAINPOOLP384R1_CURVE;
#endif
#if (TLS_BRAINPOOLP512R1_SUPPORT == ENABLED)
   //brainpoolP512r1 elliptic curve?
   else if(namedCurve == TLS_EC_CURVE_BRAINPOOLP512R1)
      return BRAINPOOLP512R1_CURVE;
#endif
   //Unknown identifier?
   else
      return NULL;
}


/**
 * @brief Get the named curve that matches the specified OID
 * @param[in] oid Object identifier
 * @param[in] length OID length
 * @return Named curve
 **/

TlsEcNamedCurve tlsGetNamedCurve(const uint8_t *oid, size_t length)
{
   //Make sure the object identifier is valid
   if(oid == NULL)
      return TLS_EC_CURVE_NONE;
#if (TLS_SECP160K1_SUPPORT == ENABLED)
   //secp160k1 elliptic curve?
   else if(oidComp(oid, length, SECP160K1_OID, sizeof(SECP160K1_OID)))
      return TLS_EC_CURVE_SECP160K1;
#endif
#if (TLS_SECP160R1_SUPPORT == ENABLED)
   //secp160r1 elliptic curve?
   else if(oidComp(oid, length, SECP160R1_OID, sizeof(SECP160R1_OID)))
      return TLS_EC_CURVE_SECP160R1;
#endif
#if (TLS_SECP160R2_SUPPORT == ENABLED)
   //secp160r2 elliptic curve?
   else if(oidComp(oid, length, SECP160R2_OID, sizeof(SECP160R2_OID)))
      return TLS_EC_CURVE_SECP160R2;
#endif
#if (TLS_SECP192K1_SUPPORT == ENABLED)
   //secp192k1 elliptic curve?
   else if(oidComp(oid, length, SECP192K1_OID, sizeof(SECP192K1_OID)))
      return TLS_EC_CURVE_SECP192K1;
#endif
#if (TLS_SECP192R1_SUPPORT == ENABLED)
   //secp192r1 elliptic curve?
   else if(oidComp(oid, length, SECP192R1_OID, sizeof(SECP192R1_OID)))
      return TLS_EC_CURVE_SECP192R1;
#endif
#if (TLS_SECP224K1_SUPPORT == ENABLED)
   //secp224k1 elliptic curve?
   else if(oidComp(oid, length, SECP224K1_OID, sizeof(SECP224K1_OID)))
      return TLS_EC_CURVE_SECP224K1;
#endif
#if (TLS_SECP224R1_SUPPORT == ENABLED)
   //secp224r1 elliptic curve?
   else if(oidComp(oid, length, SECP224R1_OID, sizeof(SECP224R1_OID)))
      return TLS_EC_CURVE_SECP224R1;
#endif
#if (TLS_SECP256K1_SUPPORT == ENABLED)
   //secp256k1 elliptic curve?
   else if(oidComp(oid, length, SECP256K1_OID, sizeof(SECP256K1_OID)))
      return TLS_EC_CURVE_SECP256K1;
#endif
#if (TLS_SECP256R1_SUPPORT == ENABLED)
   //secp256r1 elliptic curve?
   else if(oidComp(oid, length, SECP256R1_OID, sizeof(SECP256R1_OID)))
      return TLS_EC_CURVE_SECP256R1;
#endif
#if (TLS_SECP384R1_SUPPORT == ENABLED)
   //secp384r1 elliptic curve?
   else if(oidComp(oid, length, SECP384R1_OID, sizeof(SECP384R1_OID)))
      return TLS_EC_CURVE_SECP384R1;
#endif
#if (TLS_SECP521R1_SUPPORT == ENABLED)
   //secp521r1 elliptic curve?
   else if(oidComp(oid, length, SECP521R1_OID, sizeof(SECP521R1_OID)))
      return TLS_EC_CURVE_SECP521R1;
#endif
#if (TLS_BRAINPOOLP256R1_SUPPORT == ENABLED)
   //brainpoolP256r1 elliptic curve?
   else if(oidComp(oid, length, BRAINPOOLP256R1_OID, sizeof(BRAINPOOLP256R1_OID)))
      return TLS_EC_CURVE_BRAINPOOLP256R1;
#endif
#if (TLS_BRAINPOOLP384R1_SUPPORT == ENABLED)
   //brainpoolP384r1 elliptic curve?
   else if(oidComp(oid, length, BRAINPOOLP384R1_OID, sizeof(BRAINPOOLP384R1_OID)))
      return TLS_EC_CURVE_BRAINPOOLP384R1;
#endif
#if (TLS_BRAINPOOLP512R1_SUPPORT == ENABLED)
   //brainpoolP512r1 elliptic curve?
   else if(oidComp(oid, length, BRAINPOOLP512R1_OID, sizeof(BRAINPOOLP512R1_OID)))
      return TLS_EC_CURVE_BRAINPOOLP512R1;
#endif
   //Unknown identifier?
   else
      return TLS_EC_CURVE_NONE;
}

#endif
