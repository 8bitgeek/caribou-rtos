/**
 * @file dsa.c
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
 * @section Description
 *
 * The Digital Signature Algorithm (DSA) is a an algorithm developed by the
 * NSA to generate a digital signature for the authentication of electronic
 * documents. Refer to FIPS 186-3 for more details
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL CRYPTO_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include "crypto.h"
#include "dsa.h"
#include "mpi.h"
#include "asn1.h"
#include "debug.h"

//DSA OID (1.2.840.10040.4.1)
const uint8_t DSA_OID[7] = {0x2A, 0x86, 0x48, 0xCE, 0x38, 0x04, 0x01};
//DSA with SHA-1 OID (1.2.840.10040.4.3)
const uint8_t DSA_WITH_SHA1_OID[7] = {0x2A, 0x86, 0x48, 0xCE, 0x38, 0x04, 0x03};
//DSA with SHA-224 OID (2.16.840.1.101.3.4.3.1)
const uint8_t DSA_WITH_SHA224_OID[9] = {0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x03, 0x01};
//DSA with SHA-256 OID (2.16.840.1.101.3.4.3.2)
const uint8_t DSA_WITH_SHA256_OID[9] = {0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x03, 0x02};


/**
 * @brief Initialize a DSA public key
 * @param[in] key Pointer to the DSA public key to initialize
 **/

void dsaInitPublicKey(DsaPublicKey *key)
{
   //Initialize multiple precision integers
   mpiInit(&key->p);
   mpiInit(&key->q);
   mpiInit(&key->g);
   mpiInit(&key->y);
}


/**
 * @brief Release a DSA public key
 * @param[in] key Pointer to the DSA public key to free
 **/

void dsaFreePublicKey(DsaPublicKey *key)
{
   //Free multiple precision integers
   mpiFree(&key->p);
   mpiFree(&key->q);
   mpiFree(&key->g);
   mpiFree(&key->y);
}


/**
 * @brief Initialize a DSA private key
 * @param[in] key Pointer to the DSA private key to initialize
 **/

void dsaInitPrivateKey(DsaPrivateKey *key)
{
   //Initialize multiple precision integers
   mpiInit(&key->p);
   mpiInit(&key->q);
   mpiInit(&key->g);
   mpiInit(&key->x);
}


/**
 * @brief Release a DSA private key
 * @param[in] key Pointer to the DSA public key to free
 **/

void dsaFreePrivateKey(DsaPrivateKey *key)
{
   //Free multiple precision integers
   mpiFree(&key->p);
   mpiFree(&key->q);
   mpiFree(&key->g);
   mpiFree(&key->x);
}


/**
 * @brief Initialize a DSA signature
 * @param[in] signature Pointer to the DSA signature to initialize
 **/

void dsaInitSignature(DsaSignature *signature)
{
   //Initialize multiple precision integers
   mpiInit(&signature->r);
   mpiInit(&signature->s);
}


/**
 * @brief Release a DSA signature
 * @param[in] signature Pointer to the DSA signature to free
 **/

void dsaFreeSignature(DsaSignature *signature)
{
   //Release multiple precision integers
   mpiFree(&signature->r);
   mpiFree(&signature->s);
}


/**
 * @brief Encode DSA signature using ASN.1
 * @param[in] signature (R, S) integer pair
 * @param[out] data Pointer to the buffer where to store the resulting ASN.1 structure
 * @param[out] length Length of the ASN.1 structure
 * @return Error code
 **/

error_t dsaWriteSignature(const DsaSignature *signature, uint8_t *data, size_t *length)
{
   error_t error;
   size_t rLen;
   size_t sLen;

   //Debug message
   TRACE_DEBUG("Writing DSA signature...\r\n");

   //Get the length of R
   rLen = mpiGetByteLength(&signature->r) + 1;
   //Get the length of S
   sLen = mpiGetByteLength(&signature->s) + 1;

   data[0] = ASN1_ENCODING_CONSTRUCTED | ASN1_TYPE_SEQUENCE;
   data[1] = rLen + sLen + 4;
   data[2] = ASN1_TYPE_INTEGER;
   data[3] = rLen;

   //Convert R to an octet string
   error = mpiWriteRaw(&signature->r, data + 4, rLen);
   //Any error to report?
   if(error) return error;

   data[rLen + 4] = ASN1_TYPE_INTEGER;
   data[rLen + 5] = sLen;

   //Convert S to an octet string
   error = mpiWriteRaw(&signature->s, data + rLen + 6, sLen);
   //Any error to report?
   if(error) return error;

   //Total length of the ASN.1 structure
   *length = rLen + sLen + 6;
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Read an ASN.1 encoded DSA signature
 * @param[in] data Pointer to the ASN.1 structure to decode
 * @param[in] length Length of the ASN.1 structure
 * @param[out] signature (R, S) integer pair
 * @return Error code
 **/

error_t dsaReadSignature(const uint8_t *data, size_t length, DsaSignature *signature)
{
   error_t error;
   Asn1Tag tag;

   //Debug message
   TRACE_DEBUG("Reading DSA signature...\r\n");

   //Start of exception handling block
   do
   {
      //Display ASN.1 structure
      error = asn1DumpObject(data, length, 0);
      //Any error to report?
      if(error) break;

      //Read the contents of the ASN.1 structure
      error = asn1ReadTag(data, length, &tag);
      //Failed to decode ASN.1 tag?
      if(error) break;

      //Enforce encoding, type and class
      error = asn1CheckTag(&tag, TRUE, ASN1_CLASS_UNIVERSAL, ASN1_TYPE_SEQUENCE);
      //The tag does not match the criteria?
      if(error) break;

      //Point to the first field
      data = tag.value;
      length = tag.length;

      //Read the parameter r
      error = asn1ReadTag(data, length, &tag);
      //Failed to decode ASN.1 tag?
      if(error) break;

      //Enforce encoding, type and class
      error = asn1CheckTag(&tag, FALSE, ASN1_CLASS_UNIVERSAL, ASN1_TYPE_INTEGER);
      //The tag does not match the criteria?
      if(error) break;

      //Convert the octet string to a multiple precision integer
      error = mpiReadRaw(&signature->r, tag.value, tag.length);
      //Any error to report?
      if(error) break;

      //Point to the next field
      data += tag.totalLength;
      length -= tag.totalLength;

      //Read the parameter s
      error = asn1ReadTag(data, length, &tag);
      //Failed to decode ASN.1 tag?
      if(error) break;

      //Enforce encoding, type and class
      error = asn1CheckTag(&tag, FALSE, ASN1_CLASS_UNIVERSAL, ASN1_TYPE_INTEGER);
      //The tag does not match the criteria?
      if(error) break;

      //Convert the octet string to a multiple precision integer
      error = mpiReadRaw(&signature->s, tag.value, tag.length);
      //Any error to report?
      if(error) break;

      //Dump DSA signature
      TRACE_DEBUG("  r:\r\n");
      TRACE_DEBUG_MPI("    ", &signature->r);
      TRACE_DEBUG("  s:\r\n");
      TRACE_DEBUG_MPI("    ", &signature->s);

      //End of exception handling block
   } while(0);

   //Clean up side effects if necessary
   if(error)
      dsaFreeSignature(signature);

   //Return status code
   return error;
}


/**
 * @brief DSA signature generation
 * @param[in] prngAlgo PRNG algorithm
 * @param[in] prngContext Pointer to the PRNG context
 * @param[in] key Signer's DSA private key
 * @param[in] digest Digest of the message to be signed
 * @param[in] digestLength Length in octets of the digest
 * @param[out] signature (R, S) integer pair
 * @return Error code
 **/

error_t dsaGenerateSignature(const PrngAlgo *prngAlgo, void *prngContext,
   const DsaPrivateKey *key, const uint8_t *digest, size_t digestLength,
   DsaSignature *signature)
{
   error_t error;
   uint_t n;
   Mpi k;
   Mpi z;

   //Check parameters
   if(key == NULL || digest == NULL || signature == NULL)
      return ERROR_INVALID_PARAMETER;

   //Debug message
   TRACE_DEBUG("DSA signature generation...\r\n");
   TRACE_DEBUG("  p:\r\n");
   TRACE_DEBUG_MPI("    ", &key->p);
   TRACE_DEBUG("  q:\r\n");
   TRACE_DEBUG_MPI("    ", &key->q);
   TRACE_DEBUG("  g:\r\n");
   TRACE_DEBUG_MPI("    ", &key->g);
   TRACE_DEBUG("  x:\r\n");
   TRACE_DEBUG_MPI("    ", &key->x);
   TRACE_DEBUG("  digest:\r\n");
   TRACE_DEBUG_ARRAY("    ", digest, digestLength);

   //Initialize multiple precision integers
   mpiInit(&k);
   mpiInit(&z);

   //Let N be the bit length of q
   n = mpiGetBitLength(&key->q);

   //Generated a pseudorandom number
   MPI_CHECK(mpiRand(&k, n, prngAlgo, prngContext));

   //Make sure that 0 < k < q
   if(mpiComp(&k, &key->q) >= 0)
      mpiShiftRight(&k, 1);

   //Debug message
   TRACE_DEBUG("  k:\r\n");
   TRACE_DEBUG_MPI("    ", &k);

   //Compute N = min(N, outlen)
   n = min(n, digestLength * 8);

   //Convert the digest to a multiple precision integer
   MPI_CHECK(mpiReadRaw(&z, digest, (n + 7) / 8));

   //Keep the leftmost N bits of the hash value
   if(n % 8)
   {
      MPI_CHECK(mpiShiftRight(&z, 8 - (n % 8)));
   }

   //Debug message
   TRACE_DEBUG("  z:\r\n");
   TRACE_DEBUG_MPI("    ", &z);

   //Compute r = (g ^ k mod p) mod q
   MPI_CHECK(mpiExpMod(&signature->r, &key->g, &k, &key->p));
   MPI_CHECK(mpiMod(&signature->r, &signature->r, &key->q));

   //Compute k ^ -1 mod q
   MPI_CHECK(mpiInvMod(&k, &k, &key->q));

   //Compute s = k ^ -1 * (z + x * r) mod q
   MPI_CHECK(mpiMul(&signature->s, &key->x, &signature->r));
   MPI_CHECK(mpiAdd(&signature->s, &signature->s, &z));
   MPI_CHECK(mpiMod(&signature->s, &signature->s, &key->q));
   MPI_CHECK(mpiMulMod(&signature->s, &signature->s, &k, &key->q));

   //Dump DSA signature
   TRACE_DEBUG("  r:\r\n");
   TRACE_DEBUG_MPI("    ", &signature->r);
   TRACE_DEBUG("  s:\r\n");
   TRACE_DEBUG_MPI("    ", &signature->s);

end:
   //Release multiple precision integers
   mpiFree(&k);
   mpiFree(&z);

   //Clean up side effects if necessary
   if(error)
   {
      //Release (R, S) integer pair
      mpiFree(&signature->r);
      mpiFree(&signature->r);
   }

   //Return status code
   return error;
}


/**
 * @brief DSA signature verification
 * @param[in] key Signer's DSA public key
 * @param[in] digest Digest of the message whose signature is to be verified
 * @param[in] digestLength Length in octets of the digest
 * @param[in] signature (R, S) integer pair
 * @return Error code
 **/

error_t dsaVerifySignature(const DsaPublicKey *key,
   const uint8_t *digest, size_t digestLength, const DsaSignature *signature)
{
   error_t error;
   uint_t n;
   Mpi w;
   Mpi z;
   Mpi u1;
   Mpi u2;
   Mpi v;

   //Check parameters
   if(key == NULL || digest == NULL || signature == NULL)
      return ERROR_INVALID_PARAMETER;

   //Debug message
   TRACE_DEBUG("DSA signature verification...\r\n");
   TRACE_DEBUG("  p:\r\n");
   TRACE_DEBUG_MPI("    ", &key->p);
   TRACE_DEBUG("  q:\r\n");
   TRACE_DEBUG_MPI("    ", &key->q);
   TRACE_DEBUG("  g:\r\n");
   TRACE_DEBUG_MPI("    ", &key->g);
   TRACE_DEBUG("  y:\r\n");
   TRACE_DEBUG_MPI("    ", &key->y);
   TRACE_DEBUG("  digest:\r\n");
   TRACE_DEBUG_ARRAY("    ", digest, digestLength);
   TRACE_DEBUG("  r:\r\n");
   TRACE_DEBUG_MPI("    ", &signature->r);
   TRACE_DEBUG("  s:\r\n");
   TRACE_DEBUG_MPI("    ", &signature->s);

   //The verifier shall check that 0 < r < q and 0 < s < q. If either
   //condition is violated, the signature shall be rejected as invalid
   if(mpiCompInt(&signature->r, 0) <= 0 || mpiComp(&signature->r, &key->q) >= 0)
      return ERROR_INVALID_SIGNATURE;
   if(mpiCompInt(&signature->s, 0) <= 0 || mpiComp(&signature->s, &key->q) >= 0)
      return ERROR_INVALID_SIGNATURE;

   //Initialize multiple precision integers
   mpiInit(&w);
   mpiInit(&z);
   mpiInit(&u1);
   mpiInit(&u2);
   mpiInit(&v);

   //Let N be the bit length of q
   n = mpiGetBitLength(&key->q);
   //Compute N = min(N, outlen)
   n = min(n, digestLength * 8);

   //Convert the digest to a multiple precision integer
   MPI_CHECK(mpiReadRaw(&z, digest, (n + 7) / 8));

   //Keep the leftmost N bits of the hash value
   if(n % 8)
   {
      MPI_CHECK(mpiShiftRight(&z, 8 - (n % 8)));
   }

   //Compute w = s ^ �1 mod q
   MPI_CHECK(mpiInvMod(&w, &signature->s, &key->q));
   //Compute u1 = z * w mod q
   MPI_CHECK(mpiMulMod(&u1, &z, &w, &key->q));
   //Compute u2 = r * w mod q
   MPI_CHECK(mpiMulMod(&u2, &signature->r, &w, &key->q));

   //Compute v = ((g ^ u1) * (y ^ u2) mod p) mod q
   MPI_CHECK(mpiExpMod(&v, &key->g, &u1, &key->p));
   MPI_CHECK(mpiExpMod(&w, &key->y, &u2, &key->p));
   MPI_CHECK(mpiMulMod(&v, &v, &w, &key->p));
   MPI_CHECK(mpiMod(&v, &v, &key->q));

   //Debug message
   TRACE_DEBUG("  v:\r\n");
   TRACE_DEBUG_MPI("    ", &v);

   //If v = r, then the signature is verified. If v does not equal r,
   //then the message or the signature may have been modified
   error = mpiComp(&v, &signature->r) ? ERROR_INVALID_SIGNATURE : NO_ERROR;

end:
   //Release multiple precision integers
   mpiFree(&w);
   mpiFree(&z);
   mpiFree(&u1);
   mpiFree(&u2);
   mpiFree(&v);

   //Return status code
   return error;
}
