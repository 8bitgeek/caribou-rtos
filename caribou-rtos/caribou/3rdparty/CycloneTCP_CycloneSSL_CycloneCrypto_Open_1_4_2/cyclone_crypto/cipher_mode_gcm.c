/**
 * @file cipher_mode_gcm.c
 * @brief Galois/Counter Mode (GCM)
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
 * The Galois/Counter Mode (GCM) is an authenticated encryption algorithm
 * designed to provide both data authenticity (integrity) and confidentiality.
 * Refer to SP 800-38D for more details
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL CRYPTO_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "crypto.h"
#include "cipher_mode_gcm.h"
#include "debug.h"

//Check crypto library configuration
#if (GCM_SUPPORT == ENABLED)


/**
 * @brief Authenticated encryption using GCM
 * @param[in] cipher Cipher algorithm
 * @param[in] context Cipher algorithm context
 * @param[in] iv Initialization vector
 * @param[in] ivLen Length of the initialization vector
 * @param[in] a Additional authenticated data
 * @param[in] aLen Length of the additional data
 * @param[in] p Plaintext to be encrypted
 * @param[out] c Ciphertext resulting from the encryption
 * @param[in] length Total number of data bytes to be encrypted
 * @param[out] t Authentication tag
 * @param[in] tLen Length of the authentication tag
 * @return Error code
 **/

error_t gcmEncrypt(const CipherAlgo *cipher, void *context, const uint8_t *iv, size_t ivLen,
   const uint8_t *a, size_t aLen, const uint8_t *p, uint8_t *c, size_t length, uint8_t *t, size_t tLen)
{
   size_t k;
   size_t n;
   uint8_t b[16];
   uint8_t h[16];
   uint8_t j[16];
   uint8_t s[16];

   //Check parameters
   if(cipher == NULL || context == NULL)
      return ERROR_INVALID_PARAMETER;

   //GCM supports only symmetric block ciphers whose block size is 128 bits
   if(cipher->type != CIPHER_ALGO_TYPE_BLOCK || cipher->blockSize != 16)
      return ERROR_INVALID_PARAMETER;

   //The length of the IV shall meet SP 800-38D requirements
   if(ivLen < 1)
      return ERROR_INVALID_PARAMETER;
   //Check the length of the authentication tag
   if(tLen < 4 || tLen > 16)
      return ERROR_INVALID_PARAMETER;

   //Generate the hash subkey H
   memset(h, 0, 16 );
   cipher->encryptBlock(context, h, h);

   //Check whether the length of the IV is 96 bits
   if(ivLen == 12)
   {
      //When the length of the IV is 96 bits, the padding string is
      //appended to the IV to form the pre-counter block
      memcpy(j, iv, 12);
      STORE32BE(1, j + 12);
   }
   else
   {
      //Initialize GHASH calculation
      memset(j, 0, 16);

      //Length of the IV
      n = ivLen;

      //Process the initialization vector
      while(n > 0)
      {
         //The IV processed in a block-by-block fashion
         k = min(n, 16);

         //Apply GHASH function
         gcmXorBlock(j, j, iv, k);
         gcmMul(j, h);

         //Next block
         iv += k;
         n -= k;
      }

      //The string is appended with 64 additional 0 bits, followed by the
      //64-bit representation of the length of the IV
      memset(b, 0, 16);
      STORE32BE(ivLen * 8, b + 12);

      //The GHASH function is applied to the resulting string to form the
      //pre-counter block
      gcmXorBlock(j, j, b, 16);
      gcmMul(j, h);
   }

   //Compute MSB(CIPH(J(0)))
   cipher->encryptBlock(context, j, b);
   memcpy(t, b, tLen);

   //Initialize GHASH calculation
   memset(s, 0, 16);
   //Length of the AAD
   n = aLen;

   //Process AAD
   while(n > 0)
   {
      //Additional data are processed in a block-by-block fashion
      k = min(n, 16);

      //Apply GHASH function
      gcmXorBlock(s, s, a, k);
      gcmMul(s, h);

      //Next block
      a += k;
      n -= k;
   }

   //Length of the plaintext
   n = length;

   //Process plaintext
   while(n > 0)
   {
      //The encryption operates in a block-by-block fashion
      k = min(n, 16);

      //Increment counter
      gcmIncCounter(j);

      //Encrypt plaintext
      cipher->encryptBlock(context, j, b);
      gcmXorBlock(c, p, b, k);

      //Apply GHASH function
      gcmXorBlock(s, s, c, k);
      gcmMul(s, h);

      //Next block
      p += k;
      c += k;
      n -= k;
   }

   //Append the 64-bit representation of the length of the AAD and the ciphertext
   memset(b, 0, 16);
   STORE32BE(aLen * 8, b + 4);
   STORE32BE(length * 8, b + 12);

   //The GHASH function is applied to the result to produce a single output block S
   gcmXorBlock(s, s, b, 16);
   gcmMul(s, h);

   //Let T = MSB(GCTR(J(0), S)
   gcmXorBlock(t, t, s, tLen);

   //Successful encryption
   return NO_ERROR;
}


/**
 * @brief Authenticated decryption using GCM
 * @param[in] cipher Cipher algorithm
 * @param[in] context Cipher algorithm context
 * @param[in] iv Initialization vector
 * @param[in] ivLen Length of the initialization vector
 * @param[in] a Additional authenticated data
 * @param[in] aLen Length of the additional data
 * @param[in] c Ciphertext to be decrypted
 * @param[out] p Plaintext resulting from the decryption
 * @param[in] length Total number of data bytes to be decrypted
 * @param[in] t Authentication tag
 * @param[in] tLen Length of the authentication tag
 * @return Error code
 **/

error_t gcmDecrypt(const CipherAlgo *cipher, void *context, const uint8_t *iv, size_t ivLen,
   const uint8_t *a, size_t aLen, const uint8_t *c, uint8_t *p, size_t length, const uint8_t *t, size_t tLen)
{
   size_t k;
   size_t n;
   uint8_t b[16];
   uint8_t h[16];
   uint8_t j[16];
   uint8_t r[16];
   uint8_t s[16];

   //Check parameters
   if(cipher == NULL || context == NULL)
      return ERROR_INVALID_PARAMETER;

   //GCM supports only symmetric block ciphers whose block size is 128 bits
   if(cipher->type != CIPHER_ALGO_TYPE_BLOCK || cipher->blockSize != 16)
      return ERROR_INVALID_PARAMETER;

   //The length of the IV shall meet SP 800-38D requirements
   if(ivLen < 1)
      return ERROR_INVALID_PARAMETER;
   //Check the length of the authentication tag
   if(tLen < 4 || tLen > 16)
      return ERROR_INVALID_PARAMETER;

   //Generate the hash subkey H
   memset(h, 0, 16 );
   cipher->encryptBlock(context, h, h);

   //Check whether the length of the IV is 96 bits
   if(ivLen == 12)
   {
      //When the length of the IV is 96 bits, the padding string is
      //appended to the IV to form the pre-counter block
      memcpy(j, iv, 12);
      STORE32BE(1, j + 12);
   }
   else
   {
      //Initialize GHASH calculation
      memset(j, 0, 16);

      //Length of the IV
      n = ivLen;

      //Process the initialization vector
      while(n > 0)
      {
         //The IV processed in a block-by-block fashion
         k = min(n, 16);

         //Apply GHASH function
         gcmXorBlock(j, j, iv, k);
         gcmMul(j, h);

         //Next block
         iv += k;
         n -= k;
      }

      //The string is appended with 64 additional 0 bits, followed by the
      //64-bit representation of the length of the IV
      memset(b, 0, 16);
      STORE32BE(ivLen * 8, b + 12);

      //The GHASH function is applied to the resulting string to form the
      //pre-counter block
      gcmXorBlock(j, j, b, 16);
      gcmMul(j, h);
   }

   //Compute MSB(CIPH(J(0)))
   cipher->encryptBlock(context, j, b);
   memcpy(r, b, tLen);

   //Initialize GHASH calculation
   memset(s, 0, 16);
   //Length of the AAD
   n = aLen;

   //Process AAD
   while(n > 0)
   {
      //Additional data are processed in a block-by-block fashion
      k = min(n, 16);

      //Apply GHASH function
      gcmXorBlock(s, s, a, k);
      gcmMul(s, h);

      //Next block
      a += k;
      n -= k;
   }

   //Length of the ciphertext
   n = length;

   //Process ciphertext
   while(n > 0)
   {
      //The decryption operates in a block-by-block fashion
      k = min(n, 16);

      //Apply GHASH function
      gcmXorBlock(s, s, c, k);
      gcmMul(s, h);

      //Increment counter
      gcmIncCounter(j);

      //Decrypt ciphertext
      cipher->encryptBlock(context, j, b);
      gcmXorBlock(p, c, b, k);

      //Next block
      c += k;
      p += k;
      n -= k;
   }

   //Append the 64-bit representation of the length of the AAD and the ciphertext
   memset(b, 0, 16);
   STORE32BE(aLen * 8, b + 4);
   STORE32BE(length * 8, b + 12);

   //The GHASH function is applied to the result to produce a single output block S
   gcmXorBlock(s, s, b, 16);
   gcmMul(s, h);

   //Let R = MSB(GCTR(J(0), S)
   gcmXorBlock(r, r, s, tLen);

   //Verify the authentication tag
   if(memcmp(r, t, tLen))
      return ERROR_FAILURE;

   //Successful decryption
   return NO_ERROR;
}


/**
 * @brief Multiplication operation
 * @param[in, out] x First block
 * @param[in] y Second block
 **/

void gcmMul(uint8_t *x, const uint8_t *y)
{
   size_t i;
   uint8_t z[16];
   uint8_t v[16];

   //Let Z(0) = 0
   memset(z, 0, 16);
   //Let V(0) = Y
   memcpy(v, y, 16);

   //Iterate 128 times
   for(i = 0; i < 128; i++)
   {
      if(x[i / 8] & (0x80 >> (i % 8)))
      {
         gcmXorBlock(z, z, v, 16);
      }

      if(v[15] & 0x01)
      {
         gcmShiftBlock(v);
         v[0] ^= 0xE1;
      }
      else
      {
         gcmShiftBlock(v);
      }
   }

   //Copy the resulting block
   memcpy(x, z, 16);
}


/**
 * @brief XOR operation
 * @param[out] a Block resulting from the XOR operation
 * @param[in] b First block
 * @param[in] c Second block
 * @param[in] n Size of the block
 **/

void gcmXorBlock(uint8_t *a, const uint8_t *b, const uint8_t *c, size_t n)
{
   size_t i;

   //Perform XOR operation
   for(i = 0; i < n; i++)
      a[i] = b[i] ^ c[i];
}


/**
 * @brief Shift operation
 * @param[in,out] a Block to be shifted
 **/

void gcmShiftBlock(uint8_t *a)
{
   size_t i;

   //Shift the block to the right
   for(i = 0; i < 15; i++)
      a[15 - i] = (a[15 - i] >> 1) | (a[14 - i] << 7);

   a[0] = (a[0] >> 1);
}


/**
 * @brief Increment counter block
 * @param[in,out] a Pointer to the counter block
 **/

void gcmIncCounter(uint8_t *a)
{
   size_t i;

   //The function increments the right-most 32 bits of the block. The remaining
   //left-most 96 bits remain unchanged
   for(i = 0; i < 4; i++)
   {
      //Increment the current byte and propagate the carry if necessary
      if(++(a[15 - i]) != 0)
         break;
   }
}

#endif
