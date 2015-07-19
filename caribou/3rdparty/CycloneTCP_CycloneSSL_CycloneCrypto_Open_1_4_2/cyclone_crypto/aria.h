/**
 * @file aria.h
 * @brief ARIA encryption algorithm
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

#ifndef _ARIA_H
#define _ARIA_H

//Dependencies
#include "crypto.h"

//ARIA block size
#define ARIA_BLOCK_SIZE 16
//Common interface for encryption algorithms
#define ARIA_CIPHER_ALGO (&ariaCipherAlgo)


/**
 * @brief ARIA algorithm context
 **/

typedef struct
{
   uint_t nr;
   uint32_t k[16];
   uint32_t ek[68];
   uint32_t dk[68];
} AriaContext;


//ARIA related constants
extern const CipherAlgo ariaCipherAlgo;

//ARIA related functions
error_t ariaInit(AriaContext *context, const uint8_t *key, size_t keyLength);
void ariaEncryptBlock(AriaContext *context, const uint8_t *input, uint8_t *output);
void ariaDecryptBlock(AriaContext *context, const uint8_t *input, uint8_t *output);

#endif
