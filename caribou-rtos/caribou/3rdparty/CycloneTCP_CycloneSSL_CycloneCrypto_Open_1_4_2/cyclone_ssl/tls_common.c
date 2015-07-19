/**
 * @file tls_common.c
 * @brief Handshake message processing (TLS client and server)
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
#include <ctype.h>
#include "tls.h"
#include "tls_cipher_suites.h"
#include "tls_common.h"
#include "tls_record.h"
#include "tls_cache.h"
#include "tls_misc.h"
#include "asn1.h"
#include "x509.h"
#include "pem.h"
#include "debug.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED)


/**
 * @brief Send client Certificate message
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendCertificate(TlsContext *context)
{
   error_t error;
   bool_t sendCert;
   uint8_t *p;
   size_t length;
   const char_t *pemCert;
   size_t pemCertLength;
   uint8_t *derCert;
   size_t derCertSize;
   size_t derCertLength;
   TlsCertificate *message;

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //The client must send a Certificate message if the server requests it
      sendCert = context->clientCertRequested ? TRUE : FALSE;

#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= SSL_VERSION_3_0)
      //SSL 3.0 currently selected?
      if(context->version == SSL_VERSION_3_0)
      {
         //The server requests a certificate but no suitable certificate is available?
         if(sendCert && context->cert == NULL)
         {
            //The client should send a no_certificate alert instead
            error = tlsSendAlert(context, TLS_ALERT_LEVEL_WARNING, TLS_ALERT_NO_CERTIFICATE);
            //Any error to report?
            if(error) return error;

            //Skip Certificate message...
            sendCert = FALSE;
         }
      }
#endif
   }
   else
   {
      //The server must send a Certificate message whenever the agreed-upon
      //key exchange method uses certificates for authentication
      sendCert = (context->cert != NULL) ? TRUE : FALSE;
   }

   //Check whether a Certificate message must be sent
   if(sendCert)
   {
      //Buffer where to format the message
      p = context->txBuffer + sizeof(TlsRecord);

      //Point to the Certificate message
      message = (TlsCertificate *) p;
      //Format message header
      message->msgType = TLS_TYPE_CERTIFICATE;

      //Point to the first certificate of the list
      p = message->certificateList;
      //Length of the certificate list in bytes
      length = 0;

      //Check whether a certificate is available
      if(context->cert != NULL)
      {
         //Point to the certificate chain
         pemCert = context->cert->certChain;
         //Get the total length, in bytes, of the certificate chain
         pemCertLength = context->cert->certChainLength;
      }
      else
      {
         //If no suitable certificate is available, the message
         //contains an empty certificate list
         pemCert = NULL;
         pemCertLength = 0;
      }

      //DER encoded certificate
      derCert = NULL;
      derCertSize = 0;
      derCertLength = 0;

      //Parse the certificate chain
      while(pemCertLength > 0)
      {
         //Decode PEM certificate
         error = pemReadCertificate(&pemCert, &pemCertLength,
            &derCert, &derCertSize, &derCertLength);
         //Any error to report?
         if(error) break;

         //Total length of the certificate list
         length += derCertLength + 3;

         //Prevent the buffer from overflowing
         if((length + sizeof(TlsCertificate)) > TLS_MAX_PROTOCOL_DATA_LENGTH)
            return ERROR_MESSAGE_TOO_LONG;

         //Each certificate is preceded by a 3-byte length field
         STORE24BE(derCertLength, p);
         //Copy the current certificate
         memcpy(p + 3, derCert, derCertLength);

         //Advance data pointer
         p += derCertLength + 3;
      }

      //Free previously allocated memory
      osMemFree(derCert);

      //A 3-byte length field shall precede the certificate list
      STORE24BE(length, message->certificateListLength);
      //Consider the 3-byte length field
      length += 3;

      //Fix message header
      STORE24BE(length, message->length);
      //Length of the complete handshake message
      length += sizeof(TlsHandshake);

      //Debug message
      TRACE_INFO("Sending Certificate message (%" PRIuSIZE " bytes)...\r\n", length);
      TRACE_DEBUG_ARRAY("  ", message, length);

      //Send handshake message
      error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
      //Failed to send TLS record?
      if(error) return error;
   }

   //Update FSM state
   context->state = (context->entity == TLS_CONNECTION_END_CLIENT) ?
      TLS_STATE_CLIENT_KEY_EXCHANGE : TLS_STATE_SERVER_KEY_EXCHANGE;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send ChangeCipherSpec message
 *
 * The change cipher spec message is sent by both the client and the
 * server to notify the receiving party that subsequent records will be
 * protected under the newly negotiated CipherSpec and keys
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendChangeCipherSpec(TlsContext *context)
{
   error_t error;
   size_t length;
   TlsChangeCipherSpec *message;

   //Point to the ChangeCipherSpec message
   message = (TlsChangeCipherSpec *) (context->txBuffer + sizeof(TlsRecord));
   //Write the type field
   message->type = 1;

   //The message consists of a single byte
   length = sizeof(TlsChangeCipherSpec);

   //Debug message
   TRACE_INFO("Sending ChangeCipherSpec message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send ChangeCipherSpec message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_CHANGE_CIPHER_SPEC);
   //Failed to send TLS record?
   if(error) return error;

   //Allocate a memory buffer to hold the encryption context
   context->writeCipherContext = osMemAlloc(context->cipherAlgo->contextSize);
   //Failed to allocate memory?
   if(!context->writeCipherContext) return ERROR_OUT_OF_MEMORY;

   //Configure the encryption engine with the write key
   error = context->cipherAlgo->init(context->writeCipherContext,
      context->writeEncKey, context->encKeyLength);
   //Initialization failed?
   if(error) return error;

   //Inform the record layer that subsequent records will be protected
   //under the newly negotiated encryption algorithm
   context->changeCipherSpecSent = TRUE;

   //Prepare to send a Finished message to the peer...
   context->state = (context->entity == TLS_CONNECTION_END_CLIENT) ?
      TLS_STATE_CLIENT_FINISHED : TLS_STATE_SERVER_FINISHED;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send Finished message
 *
 * A Finished message is always sent immediately after a change
 * cipher spec message to verify that the key exchange and
 * authentication processes were successful. It is essential that a
 * change cipher spec message be received between the other handshake
 * messages and the Finished message
 *
 * @param[in] context Pointer to the TLS context
 * @return Error code
 **/

error_t tlsSendFinished(TlsContext *context)
{
   error_t error;
   size_t length;
   TlsFinished *message;

   //The verify data is generated from all messages in this
   //handshake up to but not including the Finished message
   error = tlsComputeVerifyData(context, context->entity);
   //Unable to generate the verify data?
   if(error) return error;

   //Point to the ChangeCipherSpec message
   message = (TlsFinished *) (context->txBuffer + sizeof(TlsRecord));
   //Set message type
   message->msgType = TLS_TYPE_FINISHED;
   //Set message length
   STORE24BE(context->verifyDataLength, message->length);

   //Copy the resulting verify data
   memcpy(message->verifyData, context->verifyData, context->verifyDataLength);
   //Length of the complete handshake message
   length = context->verifyDataLength + sizeof(TlsHandshake);

   //Debug message
   TRACE_INFO("Sending Finished message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Send handshake message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_HANDSHAKE);
   //Failed to send TLS record?
   if(error) return error;

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Use abbreviated or full handshake?
      if(context->resume)
         context->state = TLS_STATE_APPLICATION_DATA;
      else
         context->state = TLS_STATE_SERVER_CHANGE_CIPHER_SPEC;
   }
   else
   {
      //Use abbreviated or full handshake?
      if(context->resume)
         context->state = TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC;
      else
         context->state = TLS_STATE_APPLICATION_DATA;
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send Alert message
 * @param[in] context Pointer to the TLS context
 * @param[in] level Severity of the message (warning or fatal)
 * @param[in] description Description of the alert
 * @return Error code
 **/

error_t tlsSendAlert(TlsContext *context, uint8_t level, uint8_t description)
{
   error_t error;
   size_t length;
   TlsAlert *message;

   //Point to the Alert message
   message = (TlsAlert *) (context->txBuffer + sizeof(TlsRecord));
   //Severity of the message
   message->level = level;
   //Description of the alert
   message->description = description;

   //The message of the Alert message
   length = sizeof(TlsAlert);

   //Debug message
   TRACE_INFO("Sending Alert message (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_INFO_ARRAY("  ", message, length);

   //Send Alert message
   error = tlsWriteProtocolData(context, length, TLS_TYPE_ALERT);

   //Alert messages with a level of fatal result in the immediate
   //termination of the connection
   if(level == TLS_ALERT_LEVEL_FATAL)
   {
      //Any connection terminated with a fatal alert must not be resumed
      if(context->entity == TLS_CONNECTION_END_SERVER)
         tlsRemoveFromCache(context);

      //Servers and clients must forget any session identifiers
      memset(context->sessionId, 0, 32);
      context->sessionIdLength = 0;

      //Update FSM state
      context->state = TLS_STATE_FATAL_ERROR;
   }

   //Return status code
   return error;
}


/**
 * @brief Parse Certificate message
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming Certificate message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseCertificate(TlsContext *context, const TlsCertificate *message, size_t length)
{
   error_t error;
   const uint8_t *p;
   size_t n;
   const char_t *pemCert;
   size_t pemCertLength;
   uint8_t *derCert;
   size_t derCertSize;
   size_t derCertLength;

   //X.509 certificates
   X509CertificateInfo *certInfo = NULL;
   X509CertificateInfo *issuerCertInfo = NULL;

   //Debug message
   TRACE_INFO("Certificate message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the Certificate message
   if(length < sizeof(TlsCertificate))
      return ERROR_DECODING_FAILED;

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Check current state
      if(context->state != TLS_STATE_SERVER_CERTIFICATE)
         return ERROR_UNEXPECTED_MESSAGE;
   }
   else
   {
      //Check current state
      if(context->state != TLS_STATE_CLIENT_CERTIFICATE)
         return ERROR_UNEXPECTED_MESSAGE;
   }

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //Get the size occupied by the certificate list
   n = LOAD24BE(message->certificateListLength);
   //Remaining bytes to process
   length -= sizeof(TlsCertificate);

   //Ensure that the chain of certificates is valid
   if(n > length)
      return ERROR_DECODING_FAILED;

   //Compute the length of the certificate list
   length = n;

   //The sender's certificate must come first in the list
   p = message->certificateList;

   //Start of exception handling block
   do
   {
      //Assume an error...
      error = ERROR_OUT_OF_MEMORY;

      //Allocate a memory buffer to store X.509 certificate info
      certInfo = osMemAlloc(sizeof(X509CertificateInfo));
      //Failed to allocate memory?
      if(!certInfo) break;

      //Allocate a memory buffer to store the parent certificate
      issuerCertInfo = osMemAlloc(sizeof(X509CertificateInfo));
      //Failed to allocate memory?
      if(!issuerCertInfo) break;

      //TLS operates as a server?
      if(context->entity == TLS_CONNECTION_END_SERVER)
      {
         //Empty certificate list?
         if(!length)
         {
            //Check whether mutual authentication is required
            if(context->clientAuthMode == TLS_CLIENT_AUTH_REQUIRED)
            {
               //If client authentication is required by the server for the handshake
               //to continue, it may respond with a fatal handshake failure alert
               error = ERROR_HANDSHAKE_FAILED;
               break;
            }
            else
            {
               //Client authentication is optional
               context->peerCertType = TLS_CERT_NONE;
               //Exit immediately
               error = NO_ERROR;
               break;
            }
         }
      }

      //Each certificate is preceded by a 3-byte length field
      if(length < 3)
      {
         //Report an error
         error = ERROR_DECODING_FAILED;
         break;
      }

      //Get the size occupied by the certificate
      n = LOAD24BE(p);
      //Jump to the beginning of the DER encoded certificate
      p += 3;
      length -= 3;

      //Make sure that the certificate is valid
      if(n > length)
      {
         //Report an error
         error = ERROR_DECODING_FAILED;
         break;
      }

      //Display ASN.1 structure
      error = asn1DumpObject(p, n, 0);
      //Any error to report?
      if(error) break;

      //Parse X.509 certificate
      error = x509ParseCertificate(p, n, certInfo);
      //Failed to parse the X.509 certificate?
      if(error) break;

#if (TLS_CLIENT_SUPPORT == ENABLED)
      //TLS operates as a client?
      if(context->entity == TLS_CONNECTION_END_CLIENT)
      {
         //Check if the hostname must be verified
         if(context->serverName != NULL)
         {
            //Point to the last character of the common name
            int_t i = certInfo->subject.commonNameLen - 1;
            //Point to the last character of the hostname
            int_t j = strlen(context->serverName) - 1;

            //Check the common name in the server certificate against
            //the actual hostname that is being requested
            while(i >= 0 && j >= 0)
            {
               //Wildcard certificate found?
               if(certInfo->subject.commonName[i] == '*' && i == 0)
               {
                  //The CN is acceptable
                  j = 0;
               }
               //Perform case insensitive character comparison
               else if(tolower((uint8_t) certInfo->subject.commonName[i]) != context->serverName[j])
               {
                  break;
               }

               //Compare previous characters
               i--;
               j--;
            }

            //If the host names do not match, reject the certificate
            if(i >= 0 || j >= 0)
            {
               //Debug message
               TRACE_WARNING("Server name mismatch!\r\n");
               //Report an error
               error = ERROR_BAD_CERTIFICATE;
               break;
            }
         }
      }
#endif

      //The certificate contains a valid RSA public key?
      if(oidComp(certInfo->subjectPublicKeyInfo.oid, certInfo->subjectPublicKeyInfo.oidLen,
         RSA_ENCRYPTION_OID, sizeof(RSA_ENCRYPTION_OID)))
      {
         //Retrieve the RSA public key
         error = x509ReadRsaPublicKey(certInfo, &context->peerRsaPublicKey);
         //Any error to report
         if(error) break;

         //Save the certificate type
         context->peerCertType = TLS_CERT_RSA_SIGN;
      }
      //The certificate contains a valid DSA public key?
      else if(oidComp(certInfo->subjectPublicKeyInfo.oid, certInfo->subjectPublicKeyInfo.oidLen,
         DSA_OID, sizeof(DSA_OID)))
      {
         //Retrieve the DSA public key
         error = x509ReadDsaPublicKey(certInfo, &context->peerDsaPublicKey);
         //Any error to report
         if(error) break;

         //Save the certificate type
         context->peerCertType = TLS_CERT_DSS_SIGN;
      }
      //The certificate contains a valid EC public key?
      else if(oidComp(certInfo->subjectPublicKeyInfo.oid, certInfo->subjectPublicKeyInfo.oidLen,
         EC_PUBLIC_KEY_OID, sizeof(EC_PUBLIC_KEY_OID)))
      {
         const EcCurveInfo *curveInfo;

         //Retrieve EC domain parameters
         curveInfo = ecGetCurveInfo(certInfo->subjectPublicKeyInfo.ecParams.namedCurve,
            certInfo->subjectPublicKeyInfo.ecParams.namedCurveLen);

         //Make sure the specified elliptic curve is supported
         if(curveInfo == NULL)
         {
            //Report an error
            error = ERROR_BAD_CERTIFICATE;
            //Exit immediately
            break;
         }

         //Load EC domain parameters
         error = ecLoadDomainParameters(&context->peerEcParams, curveInfo);
         //Any error to report?
         if(error) break;

         //Retrieve the EC public key
         error = ecImport(&context->peerEcParams, &context->peerEcPublicKey,
            certInfo->subjectPublicKeyInfo.ecPublicKey.q, certInfo->subjectPublicKeyInfo.ecPublicKey.qLen);
         //Any error to report
         if(error) break;

         //Save the certificate type
         context->peerCertType = TLS_CERT_ECDSA_SIGN;
      }
      //The certificate does not contain any valid public key?
      else
      {
         //Report an error
         error = ERROR_BAD_CERTIFICATE;
         break;
      }

      //Next certificate
      p += n;
      length -= n;

      //PKIX path validation
      while(length > 0)
      {
         //Each certificate is preceded by a 3-byte length field
         if(length < 3)
         {
            //Report an error
            error = ERROR_DECODING_FAILED;
            break;
         }

         //Get the size occupied by the certificate
         n = LOAD24BE(p);
         //Jump to the beginning of the DER encoded certificate
         p += 3;
         length -= 3;

         //Ensure that the certificate is valid
         if(n > length)
         {
            //Report an error
            error = ERROR_DECODING_FAILED;
            break;
         }

         //Display ASN.1 structure
         error = asn1DumpObject(p, n, 0);
         //Any error to report?
         if(error) break;

         //Parse X.509 certificate
         error = x509ParseCertificate(p, n, issuerCertInfo);
         //Failed to parse the X.509 certificate?
         if(error) break;

         //Validate current certificate
         error = x509ValidateCertificate(certInfo, issuerCertInfo);
         //Certificate validation failed?
         if(error) break;

         //Keep track of the issuer certificate
         memcpy(certInfo, issuerCertInfo, sizeof(X509CertificateInfo));

         //Next certificate
         p += n;
         length -= n;
      }

      //Propagate exception if necessary...
      if(error) break;

      //Point to the first trusted CA certificate
      pemCert = context->trustedCaList;
      //Get the total length, in bytes, of the trusted CA list
      pemCertLength = context->trustedCaListLength;

      //DER encoded certificate
      derCert = NULL;
      derCertSize = 0;
      derCertLength = 0;

      //Loop through the list
      while(pemCertLength > 0)
      {
         //Decode PEM certificate
         error = pemReadCertificate(&pemCert, &pemCertLength,
            &derCert, &derCertSize, &derCertLength);
         //Any error to report?
         if(error) break;

         //Parse X.509 certificate
         error = x509ParseCertificate(derCert, derCertLength, issuerCertInfo);
         //Failed to parse the X.509 certificate?
         if(error) break;

         //Validate the certificate with the current trusted CA
         error = x509ValidateCertificate(certInfo, issuerCertInfo);
         //Certificate validation succeeded?
         if(!error) break;
      }

      //The certificate could not be matched with a known, trusted CA?
      if(error == ERROR_END_OF_FILE)
         error = ERROR_UNKNOWN_CA;

      //Free previously allocated memory
      osMemFree(derCert);

      //End of exception handling block
   } while(0);

   //Free previously allocated memory
   osMemFree(certInfo);
   osMemFree(issuerCertInfo);

   //Clean up side effects
   if(error)
   {
      //Release previously allocated memory
      rsaFreePublicKey(&context->peerRsaPublicKey);
      dsaFreePublicKey(&context->peerDsaPublicKey);
      ecFreeDomainParameters(&context->peerEcParams);
      ecFree(&context->peerEcPublicKey);
   }

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Update FSM state
      if(context->keyExchMethod != TLS_KEY_EXCH_RSA)
         context->state = TLS_STATE_SERVER_KEY_EXCHANGE;
      else
         context->state = TLS_STATE_CERTIFICATE_REQUEST;
   }
   else
   {
      //Prepare to receive ClientKeyExchange message...
      context->state = TLS_STATE_CLIENT_KEY_EXCHANGE;
   }

   //Return status code
   return error;
}


/**
 * @brief Parse ChangeCipherSpec message
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming ChangeCipherSpec message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseChangeCipherSpec(TlsContext *context, const TlsChangeCipherSpec *message, size_t length)
{
   error_t error;

   //Debug message
   TRACE_INFO("ChangeCipherSpec message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the ChangeCipherSpec message
   if(length < sizeof(TlsChangeCipherSpec))
      return ERROR_DECODING_FAILED;

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Check current state
      if(context->state != TLS_STATE_SERVER_CHANGE_CIPHER_SPEC)
         return ERROR_UNEXPECTED_MESSAGE;
   }
   else
   {
      //Check current state
      if(context->state != TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC)
         return ERROR_UNEXPECTED_MESSAGE;
   }

   //Allocate a memory buffer to hold the decryption context
   context->readCipherContext = osMemAlloc(context->cipherAlgo->contextSize);
   //Failed to allocate memory?
   if(!context->readCipherContext) return ERROR_OUT_OF_MEMORY;

   //Configure the decryption engine with the read key
   error = context->cipherAlgo->init(context->readCipherContext,
      context->readEncKey, context->encKeyLength);
   //Any error to report?
   if(error) return error;

   //Inform the record layer that subsequent records will be protected
   //under the newly negotiated encryption algorithm
   context->changeCipherSpecReceived = TRUE;

   //Prepare to receive a Finished message from the peer...
   context->state = (context->entity == TLS_CONNECTION_END_CLIENT) ?
      TLS_STATE_SERVER_FINISHED : TLS_STATE_CLIENT_FINISHED;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse Finished message
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming Finished message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseFinished(TlsContext *context, const TlsFinished *message, size_t length)
{
   error_t error;

   //Debug message
   TRACE_INFO("Finished message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_DEBUG_ARRAY("  ", message, length);

   //Check the length of the Finished message
   if(length < sizeof(TlsFinished))
      return ERROR_DECODING_FAILED;

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Check current state
      if(context->state != TLS_STATE_SERVER_FINISHED)
         return ERROR_UNEXPECTED_MESSAGE;

      //The verify data is generated from all messages in this
      //handshake up to but not including the Finished message
      error = tlsComputeVerifyData(context, TLS_CONNECTION_END_SERVER);
   }
   else
   {
      //Check current state
      if(context->state != TLS_STATE_CLIENT_FINISHED)
         return ERROR_UNEXPECTED_MESSAGE;

      //The verify data is generated from all messages in this
      //handshake up to but not including the Finished message
      error = tlsComputeVerifyData(context, TLS_CONNECTION_END_CLIENT);
   }

   //Unable to generate the verify data?
   if(error) return error;

   //Check message length
   if(LOAD24BE(message->length) != context->verifyDataLength)
      return ERROR_DECODING_FAILED;

   //Check the resulting verify data
   if(memcmp(message->verifyData, context->verifyData, context->verifyDataLength))
      return ERROR_INVALID_SIGNATURE;

   //Update the hash value with the incoming handshake message
   tlsUpdateHandshakeHash(context, message, length);

   //TLS operates as a client or a server?
   if(context->entity == TLS_CONNECTION_END_CLIENT)
   {
      //Use abbreviated or full handshake?
      if(context->resume)
         context->state = TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC;
      else
         context->state = TLS_STATE_APPLICATION_DATA;
   }
   else
   {
      //Use abbreviated or full handshake?
      if(context->resume)
         context->state = TLS_STATE_APPLICATION_DATA;
      else
         context->state = TLS_STATE_SERVER_CHANGE_CIPHER_SPEC;
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse Alert message
 * @param[in] context Pointer to the TLS context
 * @param[in] message Incoming Alert message to parse
 * @param[in] length Message length
 * @return Error code
 **/

error_t tlsParseAlert(TlsContext *context, const TlsAlert *message, size_t length)
{
   //Debug message
   TRACE_INFO("Alert message received (%" PRIuSIZE " bytes)...\r\n", length);
   TRACE_INFO_ARRAY("  ", message, length);

   //Check message length
   if(length != sizeof(TlsAlert))
      return ERROR_INVALID_LENGTH;

   //Debug message
   TRACE_DEBUG("  Level = %" PRIu8 "\r\n", message->level);
   TRACE_DEBUG("  Description = %" PRIu8 "\r\n", message->description);

   //Alert messages convey the severity of the message
   if(message->level == TLS_ALERT_LEVEL_WARNING)
   {
      //Closure alert received?
      if(message->description == TLS_ALERT_CLOSE_NOTIFY)
      {
         //Close down the connection immediately
         if(context->state == TLS_STATE_APPLICATION_DATA)
            context->state = TLS_STATE_CLOSED;
      }
   }
   else if(message->level == TLS_ALERT_LEVEL_FATAL)
   {
      //Any connection terminated with a fatal alert must not be resumed
      if(context->entity == TLS_CONNECTION_END_SERVER)
         tlsRemoveFromCache(context);

      //Servers and clients must forget any session identifiers
      memset(context->sessionId, 0, 32);
      context->sessionIdLength = 0;

      //Alert messages with a level of fatal result in the immediate
      //termination of the connection
      context->state = TLS_STATE_FATAL_ERROR;
   }
   else
   {
      //Report an error
      return ERROR_ILLEGAL_PARAMETER;
   }

   //Successful processing
   return NO_ERROR;
}

#endif
