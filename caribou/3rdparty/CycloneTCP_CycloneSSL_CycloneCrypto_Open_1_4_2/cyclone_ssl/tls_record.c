/**
 * @file tls_record.c
 * @brief TLS record protocol
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
#include "tls_common.h"
#include "tls_record.h"
#include "tls_misc.h"
#include "tls_io.h"
#include "ssl_common.h"
#include "cipher_mode_cbc.h"
#include "cipher_mode_ccm.h"
#include "cipher_mode_gcm.h"
#include "debug.h"

//Check SSL library configuration
#if (TLS_SUPPORT == ENABLED)


/**
 * @brief Write protocol data
 * @param[in] context Pointer to the TLS context
 * @param[in] length Number of data bytes to be written
 * @param[in] contentType Higher level protocol
 * @return Error code
 **/

error_t tlsWriteProtocolData(TlsContext *context,
      size_t length, TlsContentType contentType)
{
   error_t error;
   size_t n;
   uint8_t *p;

   //Check the length of the data block
   if(length > TLS_MAX_PROTOCOL_DATA_LENGTH)
      return ERROR_MESSAGE_TOO_LONG;

   //The hash value is updated for each handshake message,
   //except for HelloRequest messages
   if(contentType == TLS_TYPE_HANDSHAKE)
      tlsUpdateHandshakeHash(context, context->txBuffer + sizeof(TlsRecord), length);

   //All the data fits into a TLS single record?
   if(length <= TLS_MAX_RECORD_LENGTH)
   {
      //Send TLS record
      error = tlsWriteRecord(context, length, contentType);
      //Any error to report?
      if(error) return error;
   }
   else
   {
      //The data must be fragmented into smaller chunks...
      p = context->txBuffer + sizeof(TlsRecord) + TLS_MAX_RECORD_OVERHEAD;
      //Make room for the encryption overhead
      memmove(p, p - TLS_MAX_RECORD_OVERHEAD, length);

      //Fragmentation process
      while(length > 0)
      {
         //The record length cannot exceed 16384 bytes
         n = min(length, TLS_MAX_RECORD_LENGTH);
         //Move current chunk of data to the beginning of the buffer
         memmove(context->txBuffer + sizeof(TlsRecord), p, n);

         //Send fragment
         error = tlsWriteRecord(context, n, contentType);
         //Any error to report?
         if(error) return error;

         //Advance data pointer
         p += n;
         //Data left to be written
         length -= n;
      }
   }

   //Successful write operation
   return NO_ERROR;
}


/**
 * @brief Read protocol data
 * @param[in] context Pointer to the TLS context
 * @param[out] data Pointer to the received data
 * @param[out] length Number of data bytes that were received
 * @param[out] contentType Higher level protocol
 * @return Error code
 **/

error_t tlsReadProtocolData(TlsContext *context,
   void **data, size_t *length, TlsContentType *contentType)
{
   error_t error;
   size_t n;
   TlsContentType type;
   TlsHandshake *message;

   //Clear status code
   error = NO_ERROR;

   //Fragment reassembly process
   do
   {
      //Empty receive buffer?
      if(context->rxBufferLength == 0)
      {
         //Read a TLS record
         error = tlsReadRecord(context, context->rxBuffer, TLS_RX_BUFFER_SIZE, &n, &type);
         //Any error to report?
         if(error) return error;

         //Save record type
         context->rxBufferType = type;
         //Number of bytes available for reading
         context->rxBufferLength = n;
         //Rewind to the beginning of the buffer
         context->rxBufferReadIndex = 0;
         //Set write index
         context->rxBufferWriteIndex = context->rxBufferLength;
      }
      //Imcomplete message received?
      else if(error == ERROR_MORE_DATA_REQUIRED)
      {
         //Make room at the end of the buffer
         if(context->rxBufferReadIndex > 0)
         {
            //Move unread data to the beginning of the buffer
            memmove(context->rxBuffer, context->rxBuffer +
               context->rxBufferReadIndex, context->rxBufferLength);

            //Rewind to the beginning of the buffer
            context->rxBufferReadIndex = 0;
            //Set write index
            context->rxBufferWriteIndex = context->rxBufferLength;
         }

         //Read a TLS record
         error = tlsReadRecord(context, context->rxBuffer + context->rxBufferWriteIndex,
            TLS_RX_BUFFER_SIZE - context->rxBufferLength, &n, &type);
         //Any error to report?
         if(error) return error;

         //Fragmented records with mixed types cannot be interleaved
         if(type != context->rxBufferType)
            return ERROR_UNEXPECTED_MESSAGE;

         //Number of bytes available for reading
         context->rxBufferLength += n;
         //Update write index
         context->rxBufferWriteIndex += n;
      }

      //Handshake message received?
      if(context->rxBufferType == TLS_TYPE_HANDSHAKE)
      {
         //A message may be fragmented across several records
         if(context->rxBufferLength < sizeof(TlsHandshake))
         {
            //Read an additional record
            error = ERROR_MORE_DATA_REQUIRED;
         }
         else
         {
            //Point to the handshake message
            message = (TlsHandshake *) (context->rxBuffer + context->rxBufferReadIndex);
            //Retrieve the length of the handshake message
            n = sizeof(TlsHandshake) + LOAD24BE(message->length);

            //A message may be fragmented across several records
            if(context->rxBufferLength < n)
            {
               //Read an additional record
               error = ERROR_MORE_DATA_REQUIRED;
            }
            else
            {
               //Pass the handshake message to the higher layer
               error = NO_ERROR;
            }
         }
      }
      //ChangeCipherSpec message received?
      else if(context->rxBufferType == TLS_TYPE_CHANGE_CIPHER_SPEC)
      {
         //A message may be fragmented across several records
         if(context->rxBufferLength < sizeof(TlsChangeCipherSpec))
         {
            //Read an additional record
            error = ERROR_MORE_DATA_REQUIRED;
         }
         else
         {
            //Length of the ChangeCipherSpec message
            n = sizeof(TlsChangeCipherSpec);
            //Pass the ChangeCipherSpec message to the higher layer
            error = NO_ERROR;
         }
      }
      //Alert message received?
      else if(context->rxBufferType == TLS_TYPE_ALERT)
      {
         //A message may be fragmented across several records
         if(context->rxBufferLength < sizeof(TlsAlert))
         {
            //Read an additional record
            error = ERROR_MORE_DATA_REQUIRED;
         }
         else
         {
            //Length of the Alert message
            n = sizeof(TlsAlert);
            //Pass the Alert message to the higher layer
            error = NO_ERROR;
         }
      }
      //Application data received?
      else if(context->rxBufferType == TLS_TYPE_APPLICATION_DATA)
      {
         //Length of the application data
         n = context->rxBufferLength;
         //Pass the application data to the higher layer
         error = NO_ERROR;
      }
      //Unknown content type?
      else
      {
         //Report an error
         error = ERROR_UNEXPECTED_MESSAGE;
      }

      //Read as many records as necessary to reassemble the data
   } while(error == ERROR_MORE_DATA_REQUIRED);

   //Successful processing?
   if(!error)
   {
      //Pointer to the received data
      *data = context->rxBuffer + context->rxBufferReadIndex;
      //Length, in byte, of the data
      *length = n;
      //Protocol type
      *contentType = context->rxBufferType;
   }

   //Return status code
   return error;
}


/**
 * @brief Send a TLS record to the underlying socket
 * @param[in] context Pointer to the TLS context
 * @param[in] length Actual length of the record data
 * @param[in] contentType Record type
 * @return Error code
 **/

error_t tlsWriteRecord(TlsContext *context,
   size_t length, TlsContentType contentType)
{
   error_t error;
   uint_t i;
   size_t paddingLength;

   //Point to the TLS record
   TlsRecord *record = (TlsRecord *) context->txBuffer;
   //Format TLS record
   record->type = contentType;
   record->version = htons(context->version);
   record->length = htons(length);

   //Debug message
   TRACE_DEBUG("Sending TLS record...\r\n");
   TRACE_DEBUG_ARRAY("  ", record, length + sizeof(TlsRecord));

   //Protect record payload?
   if(context->changeCipherSpecSent)
   {
      //Message authentication is required?
      if(context->hashAlgo)
      {
#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= SSL_VERSION_3_0)
         //Check whether SSL 3.0 is currently used
         if(context->version == SSL_VERSION_3_0)
         {
            //SSL 3.0 uses an older obsolete version of the HMAC construction
            error = sslComputeMac(context, context->writeMacKey,
               context->writeSeqNum, record, record->data, length, record->data + length);
            //Any error to report?
            if(error) return error;
         }
         else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_0 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
         //Check whether TLS 1.0, TLS 1.1 or TLS 1.2 is currently used
         if(context->version >= TLS_VERSION_1_0)
         {
            //TLS uses a HMAC construction
            hmacInit(&context->hmacContext, context->hashAlgo,
               context->writeMacKey, context->macKeyLength);
            //Compute MAC over the sequence number and the record contents
            hmacUpdate(&context->hmacContext, context->writeSeqNum, sizeof(TlsSequenceNumber));
            hmacUpdate(&context->hmacContext, record, length + sizeof(TlsRecord));
            //Append the resulting MAC to the message
            hmacFinal(&context->hmacContext, record->data + length);
         }
         else
#endif
         //The negotiated TLS version is not valid...
         {
            //Report an error
            return ERROR_INVALID_VERSION;
         }

         //Debug message
         TRACE_DEBUG("Write sequence number:\r\n");
         TRACE_DEBUG_ARRAY("  ", context->writeSeqNum, sizeof(TlsSequenceNumber));
         TRACE_DEBUG("Computed MAC:\r\n");
         TRACE_DEBUG_ARRAY("  ", record->data + length, context->hashAlgo->digestSize);

         //Adjust the length of the message
         length += context->hashAlgo->digestSize;
         //Fix length field
         record->length = htons(length);

         //Increment sequence number
         tlsIncSequenceNumber(context->writeSeqNum);
      }

      //Encryption is required?
      if(context->cipherAlgo)
      {
#if (TLS_STREAM_CIPHER_SUPPORT == ENABLED)
         //Stream cipher?
         if(context->cipherMode == CIPHER_MODE_STREAM)
         {
            //Debug message
            TRACE_DEBUG("Record before encryption:\r\n");
            TRACE_DEBUG_ARRAY("  ", record, length + sizeof(TlsRecord));
            //Encrypt record contents
            context->cipherAlgo->encryptStream(context->writeCipherContext,
               record->data, record->data, length);
         }
         else
#endif
#if (TLS_CBC_CIPHER_SUPPORT == ENABLED)
         //CBC block cipher?
         if(context->cipherMode == CIPHER_MODE_CBC)
         {
#if (TLS_MAX_VERSION >= TLS_VERSION_1_1 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
            //TLS 1.1 and 1.2 use an explicit IV
            if(context->version >= TLS_VERSION_1_1)
            {
               //Make room for the IV at the beginning of the data
               memmove(record->data + context->recordIvLength, record->data, length);

               //The initialization vector should be chosen at random
               error = context->prngAlgo->read(context->prngContext,
                  record->data, context->recordIvLength);
               //Any error to report?
               if(error) return error;

               //Adjust the length of the message
               length += context->recordIvLength;
            }
#endif
            //Get the actual amount of bytes in the last block
            paddingLength = (length + 1) % context->cipherAlgo->blockSize;
            //Padding is added to force the length of the plaintext to be
            //an integral multiple of the cipher's block length
            if(paddingLength > 0)
               paddingLength = context->cipherAlgo->blockSize - paddingLength;

            //Write padding bytes
            for(i = 0; i <= paddingLength; i++)
               record->data[length + i] = paddingLength;

            //Compute the length of the resulting message
            length += paddingLength + 1;
            //Fix length field
            record->length = htons(length);

            //Debug message
            TRACE_DEBUG("Record before encryption:\r\n");
            TRACE_DEBUG_ARRAY("  ", record, length + sizeof(TlsRecord));

            //CBC encryption
            error = cbcEncrypt(context->cipherAlgo, context->writeCipherContext,
               context->writeIv, record->data, record->data, length);
            //Any error to report?
            if(error) return error;
         }
         else
#endif
#if (TLS_CCM_CIPHER_SUPPORT == ENABLED || TLS_GCM_CIPHER_SUPPORT == ENABLED)
         //AEAD cipher?
         if(context->cipherMode == CIPHER_MODE_CCM ||
            context->cipherMode == CIPHER_MODE_GCM)
         {
            uint8_t *data;
            uint8_t *tag;
            size_t nonceLength;
            uint8_t nonce[12];
            uint8_t a[13];

            //Determine the total length of the nonce
            nonceLength = context->fixedIvLength + context->recordIvLength;
            //The salt is the implicit part of the nonce and is not sent in the packet
            memcpy(nonce, context->writeIv, context->fixedIvLength);

            //The explicit part of the nonce is chosen by the sender
            error = context->prngAlgo->read(context->prngContext,
               nonce + context->fixedIvLength, context->recordIvLength);
            //Any error to report?
            if(error) return error;

            //Make room for the explicit nonce at the beginning of the record
            memmove(record->data + context->recordIvLength, record->data, length);
            //The explicit part of the nonce is carried in each TLS record
            memcpy(record->data, nonce + context->fixedIvLength, context->recordIvLength);

            //Additional data to be authenticated
            memcpy(a, context->writeSeqNum, sizeof(TlsSequenceNumber));
            memcpy(a + sizeof(TlsSequenceNumber), record, sizeof(TlsRecord));

            //Plaintext data
            data = record->data + context->recordIvLength;
            //Buffer where to store the authentication tag
            tag = data + length;

#if (TLS_CCM_CIPHER_SUPPORT == ENABLED)
            //CCM cipher mode?
            if(context->cipherMode == CIPHER_MODE_CCM)
            {
               //Authenticated encryption using CCM
               error = ccmEncrypt(context->cipherAlgo, context->writeCipherContext,
                  nonce, nonceLength, a, 13, data, data, length, tag, context->authTagLength);
            }
            else
#endif
#if (TLS_GCM_CIPHER_SUPPORT == ENABLED)
            //GCM cipher mode?
            if(context->cipherMode == CIPHER_MODE_GCM)
            {
               //Authenticated encryption using GCM
               error = gcmEncrypt(context->cipherAlgo, context->writeCipherContext,
                  nonce, nonceLength, a, 13, data, data, length, tag, context->authTagLength);
            }
            else
#endif
            //Invalid cipher mode?
            {
               //The specified cipher mode is not supported
               error = ERROR_UNSUPPORTED_CIPHER_MODE;
            }

            //Failed to encrypt data?
            if(error) return error;

            //Compute the length of the resulting message
            length += context->recordIvLength + context->authTagLength;
            //Fix length field
            record->length = htons(length);

            //Increment sequence number
            tlsIncSequenceNumber(context->writeSeqNum);
         }
         else
#endif
         //Invalid cipher mode?
         {
            //The specified cipher mode is not supported
            return ERROR_UNSUPPORTED_CIPHER_MODE;
         }

         //Debug message
         TRACE_DEBUG("Encrypted record:\r\n");
         TRACE_DEBUG_ARRAY("  ", record, length + sizeof(TlsRecord));
      }
   }

   //Compute the length of the complete TLS record
   length += sizeof(TlsRecord);
   //Send TLS record
   return tlsIoWrite(context, record, length);
}


/**
 * @brief Read a TLS record from the underlying socket
 * @param[in] context Pointer to the TLS context
 * @param[out] data Buffer where to store the record data
 * @param[in] size Maximum acceptable size for the incoming record
 * @param[out] length Actual length of the record data
 * @param[out] contentType Record type
 * @return Error code
 **/

error_t tlsReadRecord(TlsContext *context, uint8_t *data,
   size_t size, size_t *length, TlsContentType *contentType)
{
   error_t error;
   size_t i;
   size_t n;
   size_t paddingLength;
   TlsRecord record;

   //Read TLS record header
   error = tlsIoRead(context, &record, sizeof(TlsRecord));
   //Any error to report?
   if(error) return error;

   //Debug message
   TRACE_DEBUG("Record header:\r\n");
   TRACE_DEBUG_ARRAY("  ", &record, sizeof(record));

   //Check current state
   if(context->state > TLS_STATE_SERVER_HELLO)
   {
      //Once the server has sent the ServerHello message, enforce
      //incoming record versions
      if(ntohs(record.version) != context->version)
         return ERROR_VERSION_NOT_SUPPORTED;
   }

   //Convert the length field to host byte order
   n = ntohs(record.length);

   //Make sure that the buffer is large enough to hold the entire record
   if(n > size)
      return ERROR_RECORD_OVERFLOW;

   //Read record contents
   error = tlsIoRead(context, data, n);
   //Any error to report?
   if(error) return error;

   //Record payload is protected?
   if(context->changeCipherSpecReceived)
   {
      //Decrypt record if necessary
      if(context->cipherAlgo)
      {
         //Debug message
         TRACE_DEBUG("Encrypted record (%" PRIuSIZE " bytes):\r\n", n);
         TRACE_DEBUG_ARRAY("  ", data, n);

#if (TLS_STREAM_CIPHER_SUPPORT == ENABLED)
         //Stream cipher?
         if(context->cipherMode == CIPHER_MODE_STREAM)
         {
            //Decrypt record contents
            context->cipherAlgo->decryptStream(context->readCipherContext, data, data, n);
            //Debug message
            TRACE_DEBUG("Decrypted record (%" PRIuSIZE " bytes):\r\n", n);
            TRACE_DEBUG_ARRAY("  ", data, n);
         }
         else
#endif
#if (TLS_CBC_CIPHER_SUPPORT == ENABLED)
         //CBC block cipher?
         if(context->cipherMode == CIPHER_MODE_CBC)
         {
            //The length of the data must be a multiple of the block size
            if((n % context->cipherAlgo->blockSize) != 0)
               return ERROR_DECODING_FAILED;

            //CBC decryption
            error = cbcDecrypt(context->cipherAlgo,
               context->readCipherContext, context->readIv, data, data, n);
            //Any error to report?
            if(error) return error;

            //Debug message
            TRACE_DEBUG("Decrypted record (%" PRIuSIZE " bytes):\r\n", n);
            TRACE_DEBUG_ARRAY("  ", data, n);

#if (TLS_MAX_VERSION >= TLS_VERSION_1_1 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
            //TLS 1.1 and 1.2 use an explicit IV
            if(context->version >= TLS_VERSION_1_1)
            {
               //Make sure the message length is acceptable
               if(n < context->recordIvLength)
                  return ERROR_DECODING_FAILED;

               //Adjust the length of the message
               n -= context->recordIvLength;
               //Discard the first cipher block (corresponding to the explicit IV)
               memmove(data, data + context->recordIvLength, n);
            }
#endif
            //Make sure the message length is acceptable
            if(n < context->cipherAlgo->blockSize)
               return ERROR_DECODING_FAILED;

            //Compute the length of the padding string
            paddingLength = data[n - 1];
            //Erroneous padding length?
            if(paddingLength >= n)
               return ERROR_BAD_RECORD_MAC;

            //The receiver must check the padding
            for(i = 0; i <= paddingLength; i++)
            {
               //Each byte in the padding data must be filled
               //with the padding length value
               if(data[n - 1 - i] != paddingLength)
                  return ERROR_BAD_RECORD_MAC;
            }

            //Remove padding bytes
            n -= paddingLength + 1;

            //Debug message
            TRACE_DEBUG("Padding removed (%" PRIuSIZE " bytes):\r\n", n);
            TRACE_DEBUG_ARRAY("  ", data, n);
         }
         else
#endif
#if (TLS_CCM_CIPHER_SUPPORT == ENABLED || TLS_GCM_CIPHER_SUPPORT == ENABLED)
         //AEAD cipher?
         if(context->cipherMode == CIPHER_MODE_CCM ||
            context->cipherMode == CIPHER_MODE_GCM)
         {
            uint8_t *ciphertext;
            uint8_t *tag;
            size_t nonceLength;
            uint8_t nonce[12];
            uint8_t a[13];

            //Make sure the message length is acceptable
            if(n < (context->recordIvLength + context->authTagLength))
               return ERROR_DECODING_FAILED;

            //Determine the total length of the nonce
            nonceLength = context->fixedIvLength + context->recordIvLength;
            //The salt is the implicit part of the nonce and is not sent in the packet
            memcpy(nonce, context->readIv, context->fixedIvLength);
            //The explicit part of the nonce is chosen by the sender
            memcpy(nonce + context->fixedIvLength, data, context->recordIvLength);

            //Calculate the length of the ciphertext
            n -= context->recordIvLength + context->authTagLength;
            //Fix the length field of the TLS record
            record.length = htons(n);

            //Additional data to be authenticated
            memcpy(a, context->readSeqNum, sizeof(TlsSequenceNumber));
            memcpy(a + sizeof(TlsSequenceNumber), &record, sizeof(TlsRecord));

            //Ciphertext data
            ciphertext = data + context->recordIvLength;
            //Authentication tag
            tag = ciphertext + n;

#if (TLS_CCM_CIPHER_SUPPORT == ENABLED)
            //CCM cipher mode?
            if(context->cipherMode == CIPHER_MODE_CCM)
            {
               //Decryption and verification (using CCM)
               error = ccmDecrypt(context->cipherAlgo, context->readCipherContext, nonce,
                  nonceLength, a, 13, ciphertext, ciphertext, n, tag, context->authTagLength);
            }
            else
#endif
#if (TLS_GCM_CIPHER_SUPPORT == ENABLED)
            //GCM cipher mode?
            if(context->cipherMode == CIPHER_MODE_GCM)
            {
               //Decryption and verification (using GCM)
               error = gcmDecrypt(context->cipherAlgo, context->readCipherContext, nonce,
                  nonceLength, a, 13, ciphertext, ciphertext, n, tag, context->authTagLength);
            }
            else
#endif
            //Invalid cipher mode?
            {
               //The specified cipher mode is not supported
               error = ERROR_UNSUPPORTED_CIPHER_MODE;
            }

            //Wrong authentication tag?
            if(error) return ERROR_BAD_RECORD_MAC;

            //Discard the explicit part of the nonce
            memmove(data, data + context->recordIvLength, n);

            //Debug message
            TRACE_DEBUG("Decrypted record (%" PRIuSIZE " bytes):\r\n", n);
            TRACE_DEBUG_ARRAY("  ", data, n);

            //Increment sequence number
            tlsIncSequenceNumber(context->readSeqNum);
         }
         else
#endif
         //Invalid cipher mode?
         {
            //The specified cipher mode is not supported
            return ERROR_UNSUPPORTED_CIPHER_MODE;
         }
      }

      //Check message authentication code if necessary
      if(context->hashAlgo)
      {
         //Make sure the message length is acceptable
         if(n < context->hashAlgo->digestSize)
            return ERROR_DECODING_FAILED;

         //Adjust the length of the message
         n -= context->hashAlgo->digestSize;
         //Fix the length field of the TLS record
         record.length = htons(n);

#if (TLS_MAX_VERSION >= SSL_VERSION_3_0 && TLS_MIN_VERSION <= SSL_VERSION_3_0)
         //Check whether SSL 3.0 is currently used
         if(context->version == SSL_VERSION_3_0)
         {
            //SSL 3.0 uses an older obsolete version of the HMAC construction
            error = sslComputeMac(context, context->readMacKey,
               context->readSeqNum, &record, data, n, context->hmacContext.digest);
            //Any error to report?
            if(error) return error;
         }
         else
#endif
#if (TLS_MAX_VERSION >= TLS_VERSION_1_0 && TLS_MIN_VERSION <= TLS_VERSION_1_2)
         //Check whether TLS 1.0, TLS 1.1 or TLS 1.2 is currently used
         if(context->version >= TLS_VERSION_1_0)
         {
            //TLS uses a HMAC construction
            hmacInit(&context->hmacContext, context->hashAlgo, context->readMacKey, context->macKeyLength);
            //Compute MAC over the sequence number and the record contents
            hmacUpdate(&context->hmacContext, context->readSeqNum, sizeof(TlsSequenceNumber));
            hmacUpdate(&context->hmacContext, &record, sizeof(TlsRecord));
            hmacUpdate(&context->hmacContext, data, n);
            hmacFinal(&context->hmacContext, NULL);
         }
         else
#endif
         //The negotiated TLS version is not valid...
         {
            //Report an error
            return ERROR_INVALID_VERSION;
         }

         //Debug message
         TRACE_DEBUG("Read sequence number:\r\n");
         TRACE_DEBUG_ARRAY("  ", context->readSeqNum, sizeof(TlsSequenceNumber));
         TRACE_DEBUG("Computed MAC:\r\n");
         TRACE_DEBUG_ARRAY("  ", context->hmacContext.digest, context->hashAlgo->digestSize);

         //Check the message authentication code
         if(memcmp(data + n, context->hmacContext.digest, context->hashAlgo->digestSize))
            return ERROR_BAD_RECORD_MAC;

         //Increment sequence number
         tlsIncSequenceNumber(context->readSeqNum);
      }
   }

   //Actual length of the record data
   *length = n;
   //Record type
   *contentType = (TlsContentType) record.type;

   //The TLS record has been successfully read
   return NO_ERROR;
}


/**
 * @brief Increment sequence number
 * @param[in] seqNum Sequence number to increment
 **/

void tlsIncSequenceNumber(TlsSequenceNumber seqNum)
{
   int_t i;

   //Sequence numbers are stored MSB first
   for(i = 7; i >= 0; i--)
   {
      //Increment the current byte
      seqNum[i]++;
      //Propagate the carry if necessary
      if(seqNum[i] != 0)
         break;
   }
}

#endif
