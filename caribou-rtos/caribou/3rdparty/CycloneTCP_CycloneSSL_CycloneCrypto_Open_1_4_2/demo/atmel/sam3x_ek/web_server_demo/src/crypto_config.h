/**
 * @file crypto_config.h
 * @brief CycloneCrypto configuration file
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

#ifndef _CRYPTO_CONFIG_H
#define _CRYPTO_CONFIG_H

//Desired trace level (for debugging purposes)
#define CRYPTO_TRACE_LEVEL TRACE_LEVEL_INFO

//Assembly optimizations for time-critical routines
#define MPI_ASM_SUPPORT DISABLED

//Base64 encoding support
#define BASE64_SUPPORT ENABLED

//MD2 hash support
#define MD2_SUPPORT ENABLED
//MD4 hash support
#define MD4_SUPPORT ENABLED
//MD5 hash support
#define MD5_SUPPORT ENABLED
//RIPEMD-128 hash support
#define RIPEMD128_SUPPORT ENABLED
//RIPEMD-160 hash support
#define RIPEMD160_SUPPORT ENABLED
//SHA-1 hash support
#define SHA1_SUPPORT ENABLED
//SHA-224 hash support
#define SHA224_SUPPORT ENABLED
//SHA-256 hash support
#define SHA256_SUPPORT ENABLED
//SHA-384 hash support
#define SHA384_SUPPORT ENABLED
//SHA-512 hash support
#define SHA512_SUPPORT ENABLED
//SHA-512/224 hash support
#define SHA512_224_SUPPORT ENABLED
//SHA-512/256 hash support
#define SHA512_256_SUPPORT ENABLED
//Tiger hash support
#define TIGER_SUPPORT ENABLED
//Whirlpool hash support
#define WHIRLPOOL_SUPPORT ENABLED

//HMAC support
#define HMAC_SUPPORT ENABLED

//RC4 support
#define RC4_SUPPORT ENABLED
//RC6 support
#define RC6_SUPPORT ENABLED
//IDEA support
#define IDEA_SUPPORT ENABLED
//DES support
#define DES_SUPPORT ENABLED
//Triple DES support
#define DES3_SUPPORT ENABLED
//AES support
#define AES_SUPPORT ENABLED
//Camellia support
#define CAMELLIA_SUPPORT ENABLED
//SEED support
#define SEED_SUPPORT ENABLED
//ARIA support
#define ARIA_SUPPORT ENABLED

//ECB mode support
#define ECB_SUPPORT ENABLED
//CBC mode support
#define CBC_SUPPORT ENABLED
//CFB mode support
#define CFB_SUPPORT ENABLED
//OFB mode support
#define OFB_SUPPORT ENABLED
//CTR mode support
#define CTR_SUPPORT ENABLED
//CCM mode support
#define CCM_SUPPORT ENABLED
//GCM mode support
#define GCM_SUPPORT ENABLED

#endif
