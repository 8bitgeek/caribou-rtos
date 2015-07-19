/**
 * @file rsa.h
 * @brief RSA public-key cryptography standard
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

#ifndef _RSA_H
#define _RSA_H

//Dependencies
#include "crypto.h"
#include "mpi.h"


/**
 * @brief RSA public key
 **/

typedef struct
{
   Mpi n; ///<Modulus
   Mpi e; ///<Public exponent
} RsaPublicKey;


/**
 * @brief RSA private key
 **/

typedef struct
{
   Mpi n;    ///<Modulus
   Mpi e;    ///<Public exponent
   Mpi d;    ///<Private exponent
   Mpi p;    ///<First factor
   Mpi q;    ///<Second factor
   Mpi dp;   ///<First factor's CRT exponent
   Mpi dq;   ///<second factor's CRT exponent
   Mpi qinv; ///<CRT coefficient
} RsaPrivateKey;


//RSA related constants
extern const uint8_t PKCS1_OID[8];
extern const uint8_t RSA_ENCRYPTION_OID[9];
extern const uint8_t MD5_WITH_RSA_ENCRYPTION_OID[9];
extern const uint8_t SHA1_WITH_RSA_ENCRYPTION_OID[9];
extern const uint8_t SHA256_WITH_RSA_ENCRYPTION_OID[9];
extern const uint8_t SHA384_WITH_RSA_ENCRYPTION_OID[9];
extern const uint8_t SHA512_WITH_RSA_ENCRYPTION_OID[9];

//RSA related functions
void rsaInitPublicKey(RsaPublicKey *key);
void rsaFreePublicKey(RsaPublicKey *key);
void rsaInitPrivateKey(RsaPrivateKey *key);
void rsaFreePrivateKey(RsaPrivateKey *key);

error_t rsaep(const RsaPublicKey *key, const Mpi *m, Mpi *c);
error_t rsadp(const RsaPrivateKey *key, const Mpi *c, Mpi *m);

error_t rsasp1(const RsaPrivateKey *key, const Mpi *m, Mpi *s);
error_t rsavp1(const RsaPublicKey *key, const Mpi *s, Mpi *m);

error_t rsaesPkcs1v15Encrypt(const PrngAlgo *prngAlgo, void *prngContext, const RsaPublicKey *key,
   const uint8_t *message, size_t messageLength, uint8_t *ciphertext, size_t *ciphertextLength);

error_t rsaesPkcs1v15Decrypt(const RsaPrivateKey *key, const uint8_t *ciphertext,
   size_t ciphertextLength, uint8_t *message, size_t messageSize, size_t *messageLength);

error_t rsassaPkcs1v15Sign(const RsaPrivateKey *key, const HashAlgo *hash,
   const uint8_t *digest, uint8_t *signature, size_t *signatureLength);

error_t rsassaPkcs1v15Verify(const RsaPublicKey *key, const HashAlgo *hash,
   const uint8_t *digest, const uint8_t *signature, size_t signatureLength);

error_t emsaPkcs1v15Encode(const HashAlgo *hash,
   const uint8_t *digest, uint8_t *em, size_t emLength);

error_t emsaPkcs1v15Decode(const uint8_t *em, size_t emLength, const uint8_t **oid,
   size_t *oidLength, const uint8_t **digest, size_t *digestLength);

#endif
