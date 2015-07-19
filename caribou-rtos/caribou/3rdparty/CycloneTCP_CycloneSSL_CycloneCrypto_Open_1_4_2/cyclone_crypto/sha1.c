/**
 * @file sha1.c
 * @brief SHA-1 (Secure Hash Algorithm 1)
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneCrypto Open.
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
 * SHA-1 is a secure hash algorithm for computing a condensed representation
 * of an electronic message. Refer to FIPS 180-4 for more details
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL CRYPTO_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "crypto.h"
#include "sha1.h"

//Check crypto library configuration
#if (SHA1_SUPPORT == ENABLED)

//Macro to access the circular buffer
#define MASK(t) ((t) & 0x0F)

//SHA-1 auxiliary functions
#define CH(x, y, z) (((x) & (y)) | (~(x) & (z)))
#define PARITY(x, y, z) ((x) ^ (y) ^ (z))
#define MAJ(x, y, z) (((x) & (y)) | ((x) & (z)) | ((y) & (z)))

//SHA-1 padding
static const uint8_t padding[64] =
{
   0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

//SHA-1 constants
static const uint32_t k[4] =
{
   0x5A827999,
   0x6ED9EBA1,
   0x8F1BBCDC,
   0xCA62C1D6
};

//SHA-1 object identifier (1.3.14.3.2.26)
static const uint8_t sha1Oid[] = {0x2B, 0x0E, 0x03, 0x02, 0x1A};

//Common interface for hash algorithms
const HashAlgo sha1HashAlgo =
{
   "SHA-1",
   sha1Oid,
   sizeof(sha1Oid),
   sizeof(Sha1Context),
   SHA1_BLOCK_SIZE,
   SHA1_DIGEST_SIZE,
   (HashAlgoCompute) sha1Compute,
   (HashAlgoInit) sha1Init,
   (HashAlgoUpdate) sha1Update,
   (HashAlgoFinal) sha1Final
};


/**
 * @brief Digest a message using SHA-1
 * @param[in] data Pointer to the message being hashed
 * @param[in] length Length of the message
 * @param[out] digest Pointer to the calculated digest
 * @return Error code
 **/

error_t sha1Compute(const void *data, size_t length, uint8_t *digest)
{
   //Allocate a memory buffer to hold the SHA-1 context
   Sha1Context *context = osMemAlloc(sizeof(Sha1Context));
   //Failed to allocate memory?
   if(!context) return ERROR_OUT_OF_MEMORY;

   //Initialize the SHA-1 context
   sha1Init(context);
   //Digest the message
   sha1Update(context, data, length);
   //Finalize the SHA-1 message digest
   sha1Final(context, digest);

   //Free previously allocated memory
   osMemFree(context);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Initialize SHA-1 message digest context
 * @param[in] context Pointer to the SHA-1 context to initialize
 **/

void sha1Init(Sha1Context *context)
{
   //Set initial hash value
   context->h[0] = 0x67452301;
   context->h[1] = 0xEFCDAB89;
   context->h[2] = 0x98BADCFE;
   context->h[3] = 0x10325476;
   context->h[4] = 0xC3D2E1F0;

   //Number of bytes in the buffer
   context->size = 0;
   //Total length of the message
   context->totalSize = 0;
}


/**
 * @brief Update the SHA-1 context with a portion of the message being hashed
 * @param[in] context Pointer to the SHA-1 context
 * @param[in] data Pointer to the buffer being hashed
 * @param[in] length Length of the buffer
 **/

void sha1Update(Sha1Context *context, const void *data, size_t length)
{
   //Process the incoming data
   while(length > 0)
   {
      //The buffer can hold at most 64 bytes
      size_t n = min(length, 64 - context->size);

      //Copy the data to the buffer
      memcpy(context->buffer + context->size, data, n);

      //Update the SHA-1 context
      context->size += n;
      context->totalSize += n;
      //Advance the data pointer
      data = (uint8_t *) data + n;
      //Remaining bytes to process
      length -= n;

      //Process message in 16-word blocks
      if(context->size == 64)
      {
         //Transform the 16-word block
         sha1ProcessBlock(context);
         //Empty the buffer
         context->size = 0;
      }
   }
}


/**
 * @brief Finish the SHA-1 message digest
 * @param[in] context Pointer to the SHA-1 context
 * @param[out] digest Calculated digest (optional parameter)
 **/

void sha1Final(Sha1Context *context, uint8_t *digest)
{
   uint_t i;
   size_t paddingSize;
   uint64_t totalSize;

   //Length of the original message (before padding)
   totalSize = context->totalSize * 8;

   //Pad the message so that its length is congruent to 56 modulo 64
   paddingSize = (context->size < 56) ? (56 - context->size) : (64 + 56 - context->size);
   //Append padding
   sha1Update(context, padding, paddingSize);

   //Append the length of the original message
   context->w[14] = htobe32((uint32_t) (totalSize >> 32));
   context->w[15] = htobe32((uint32_t) totalSize);

   //Calculate the message digest
   sha1ProcessBlock(context);

   //Convert from host byte order to big-endian byte order
   for(i = 0; i < 5; i++)
      context->h[i] = htobe32(context->h[i]);

   //Copy the resulting digest
   if(digest != NULL)
      memcpy(digest, context->digest, SHA1_DIGEST_SIZE);
}


/**
 * @brief Process message in 16-word blocks
 * @param[in] context Pointer to the SHA-1 context
 **/

void sha1ProcessBlock(Sha1Context *context)
{
   uint_t s;
   uint_t t;
   uint32_t temp;

   //Initialize the 5 working registers
   uint32_t a = context->h[0];
   uint32_t b = context->h[1];
   uint32_t c = context->h[2];
   uint32_t d = context->h[3];
   uint32_t e = context->h[4];

   //Process message in 16-word blocks
   uint32_t *w = context->w;

   //Convert from big-endian byte order to host byte order
   for(t = 0; t < 16; t++)
      w[t] = betoh32(w[t]);

   //SHA-1 hash computation (alternate method)
   for(t = 0; t < 80; t++)
   {
      //Current index in the circular buffer
      s = MASK(t);

      //The alternate method requires preprocessing
      if(t >= 16)
         w[s] = ROL32(w[MASK(s + 13)] ^ w[MASK(s + 8)] ^ w[MASK(s + 2)] ^ w[s], 1);

      //Calculate T
      if(t < 20)
         temp = ROL32(a, 5) + CH(b, c, d) + e + w[s] + k[0];
      else if(t < 40)
         temp = ROL32(a, 5) + PARITY(b, c, d) + e + w[s] + k[1];
      else if(t < 60)
         temp = ROL32(a, 5) + MAJ(b, c, d) + e + w[s] + k[2];
      else
         temp = ROL32(a, 5) + PARITY(b, c, d) + e + w[s] + k[3];

      //Update the working registers
      e = d;
      d = c;
      c = ROL32(b, 30);
      b = a;
      a = temp;
   }

   //Update the hash value
   context->h[0] += a;
   context->h[1] += b;
   context->h[2] += c;
   context->h[3] += d;
   context->h[4] += e;
}

#endif
