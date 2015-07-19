/**
 * @file sha512_256.h
 * @brief SHA-512/256 (Secure Hash Algorithm)
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

#ifndef _SHA512_256_H
#define _SHA512_256_H

//Dependencies
#include "crypto.h"
#include "sha512.h"

//SHA-512/256 block size
#define SHA512_256_BLOCK_SIZE 128
//SHA-512/256 digest size
#define SHA512_256_DIGEST_SIZE 32
//Common interface for hash algorithms
#define SHA512_256_HASH_ALGO (&sha512_256HashAlgo)


/**
 * @brief SHA-512/256 algorithm context
 **/

typedef Sha512Context Sha512_256Context;

//SHA-512/256 related constants
extern const HashAlgo sha512_256HashAlgo;

//SHA-512/256 related functions
error_t sha512_256Compute(const void *data, size_t length, uint8_t *digest);
void sha512_256Init(Sha512_256Context *context);
void sha512_256Update(Sha512_256Context *context, const void *data, size_t length);
void sha512_256Final(Sha512_256Context *context, uint8_t *digest);

#endif
