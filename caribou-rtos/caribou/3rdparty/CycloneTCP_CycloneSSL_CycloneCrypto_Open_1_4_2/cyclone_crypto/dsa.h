/**
 * @file dsa.h
 * @brief DSA (Digital Signature Algorithm)
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

#ifndef _DSA_H
#define _DSA_H

//Dependencies
#include "crypto.h"
#include "mpi.h"


/**
 * @brief DSA public key
 **/

typedef struct
{
   Mpi p;
   Mpi q;
   Mpi g;
   Mpi y;
} DsaPublicKey;


/**
 * @brief DSA private key
 **/

typedef struct
{
   Mpi p;
   Mpi q;
   Mpi g;
   Mpi x;
} DsaPrivateKey;


/**
 * @brief DSA signature
 **/

typedef struct
{
   Mpi r;
   Mpi s;
} DsaSignature;


//DSA related constants
extern const uint8_t DSA_OID[7];
extern const uint8_t DSA_WITH_SHA1_OID[7];
extern const uint8_t DSA_WITH_SHA224_OID[9];
extern const uint8_t DSA_WITH_SHA256_OID[9];

//DSA related functions
void dsaInitPublicKey(DsaPublicKey *key);
void dsaFreePublicKey(DsaPublicKey *key);

void dsaInitPrivateKey(DsaPrivateKey *key);
void dsaFreePrivateKey(DsaPrivateKey *key);

void dsaInitSignature(DsaSignature *signature);
void dsaFreeSignature(DsaSignature *signature);

error_t dsaWriteSignature(const DsaSignature *signature, uint8_t *data, size_t *length);
error_t dsaReadSignature(const uint8_t *data, size_t length, DsaSignature *signature);

error_t dsaGenerateSignature(const PrngAlgo *prngAlgo, void *prngContext,
   const DsaPrivateKey *key, const uint8_t *digest, size_t digestLength,
   DsaSignature *signature);

error_t dsaVerifySignature(const DsaPublicKey *key,
   const uint8_t *digest, size_t digestLength, const DsaSignature *signature);

#endif
