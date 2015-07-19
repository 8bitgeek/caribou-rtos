/**
 * @file rc6.h
 * @brief RC6-32/20 block cipher
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

#ifndef _RC6_H
#define _RC6_H

//Dependencies
#include "crypto.h"

//RC6 block size
#define RC6_BLOCK_SIZE 16
//Maximum length of the encryption key in bytes
#define RC6_MAX_KEY_SIZE 32
//Number of rounds
#define RC6_NB_ROUNDS 20

//Common interface for encryption algorithms
#define RC6_CIPHER_ALGO (&rc6CipherAlgo)


/**
 * @brief RC6 algorithm context
 **/

typedef struct
{
   uint32_t l[RC6_MAX_KEY_SIZE / 4];
   uint32_t s[2 * RC6_NB_ROUNDS + 4];
} Rc6Context;


//RC6 related constants
extern const CipherAlgo rc6CipherAlgo;

//RC6 related functions
error_t rc6Init(Rc6Context *context, const uint8_t *key, size_t keyLength);
void rc6EncryptBlock(Rc6Context *context, const uint8_t *input, uint8_t *output);
void rc6DecryptBlock(Rc6Context *context, const uint8_t *input, uint8_t *output);

#endif
