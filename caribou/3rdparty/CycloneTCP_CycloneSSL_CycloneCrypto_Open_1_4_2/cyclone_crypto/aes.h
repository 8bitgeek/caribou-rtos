/**
 * @file aes.h
 * @brief AES (Advanced Encryption Standard)
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
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

#ifndef _AES_H
#define _AES_H

//Dependencies
#include "crypto.h"

//AES block size
#define AES_BLOCK_SIZE 16
//Common interface for encryption algorithms
#define AES_CIPHER_ALGO (&aesCipherAlgo)


/**
 * @brief AES algorithm context
 **/

typedef struct
{
   uint_t nr;
   uint32_t w[60];
} AesContext;


/**
 * @brief AES state array
 **/

typedef struct
{
   union
   {
      uint32_t w[4];
      uint8_t b[16];
   };
} AesState;


//AES related constants
extern const CipherAlgo aesCipherAlgo;

//AES related functions
error_t aesInit(AesContext *context, const uint8_t *key, size_t keyLength);
void aesEncryptBlock(AesContext *context, const uint8_t *input, uint8_t *output);
void aesDecryptBlock(AesContext *context, const uint8_t *input, uint8_t *output);

#endif
