/**
 * @file ecdsa.h
 * @brief ECDSA (Elliptic Curve Digital Signature Algorithm)
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

#ifndef _ECDSA_H
#define _ECDSA_H

//Dependencies
#include "crypto.h"
#include "ec.h"


/**
 * @brief ECDSA signature
 **/

typedef struct
{
   Mpi r;
   Mpi s;
} EcdsaSignature;


//ECDSA related constants
extern const uint8_t ECDSA_WITH_SHA1_OID[7];
extern const uint8_t ECDSA_WITH_SHA224_OID[8];
extern const uint8_t ECDSA_WITH_SHA256_OID[8];
extern const uint8_t ECDSA_WITH_SHA384_OID[8];
extern const uint8_t ECDSA_WITH_SHA512_OID[8];

//ECDSA related functions
void ecdsaInitSignature(EcdsaSignature *signature);
void ecdsaFreeSignature(EcdsaSignature *signature);

error_t ecdsaWriteSignature(const EcdsaSignature *signature, uint8_t *data, size_t *length);
error_t ecdsaReadSignature(const uint8_t *data, size_t length, EcdsaSignature *signature);

error_t ecdsaGenerateSignature(const EcDomainParameters *params,
   const PrngAlgo *prngAlgo, void *prngContext, const Mpi *privateKey,
   const uint8_t *digest, size_t digestLength, EcdsaSignature *signature);

error_t ecdsaVerifySignature(const EcDomainParameters *params, const EcPoint *publicKey,
   const uint8_t *digest, size_t digestLength, const EcdsaSignature *signature);

#endif
