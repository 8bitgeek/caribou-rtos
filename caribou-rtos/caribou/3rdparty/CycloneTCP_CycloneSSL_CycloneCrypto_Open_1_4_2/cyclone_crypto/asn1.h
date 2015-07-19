/**
 * @file asn1.h
 * @brief ASN.1 (Abstract Syntax Notation One)
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

#ifndef _ASN1_H
#define _ASN1_H

//Dependencies
#include "crypto.h"

//Tag number mask
#define ASN1_TAG_NUMBER_MASK 0x1F


/**
 * @brief ASN.1 class
 **/

typedef enum
{
   ASN1_CLASS_MASK             = 0xC0,
   ASN1_CLASS_UNIVERSAL        = 0x00,
   ASN1_CLASS_APPLICATION      = 0x40,
   ASN1_CLASS_CONTEXT_SPECIFIC = 0x80,
   ASN1_CLASS_PRIVATE          = 0xC0
} Asn1Class;


/**
 * @brief ASN.1 encoding
 **/

typedef enum
{
   ASN1_ENCODING_PRIMITIVE   = 0x00,
   ASN1_ENCODING_CONSTRUCTED = 0x20
} Asn1Encoding;


/**
 * @brief ASN.1 data types
 **/

typedef enum
{
   ASN1_TYPE_BOOLEAN           = 1,
   ASN1_TYPE_INTEGER           = 2,
   ASN1_TYPE_BIT_STRING        = 3,
   ASN1_TYPE_OCTET_STRING      = 4,
   ASN1_TYPE_NULL              = 5,
   ASN1_TYPE_OBJECT_IDENTIFIER = 6,
   ASN1_TYPE_OBJECT_DESCRIPTOR = 7,
   ASN1_TYPE_EXTERNAL          = 8,
   ASN1_TYPE_REAL              = 9,
   ASN1_TYPE_ENUMERATED        = 10,
   ASN1_TYPE_UTF8_STRING       = 12,
   ASN1_TYPE_SEQUENCE          = 16,
   ASN1_TYPE_SET               = 17,
   ASN1_TYPE_NUMERIC_STRING    = 18,
   ASN1_TYPE_PRINTABLE_STRING  = 19,
   ASN1_TYPE_TELETEX_STRING    = 20,
   ASN1_TYPE_VIDEOTEX_STRING   = 21,
   ASN1_TYPE_IA5_STRING        = 22,
   ASN1_TYPE_UTC_TIME          = 23,
   ASN1_TYPE_GENERALIZED_TIME  = 24,
   ASN1_TYPE_GRAPHIC_STRING    = 25,
   ASN1_TYPE_VISIBLE_STRING    = 26,
   ASN1_TYPE_GENERAL_STRING    = 27,
   ASN1_TYPE_UNIVERSAL_STRING  = 28,
   ASN1_TYPE_BMP_STRING        = 30,
} Asn1Type;


/**
 * @brief ASN.1 tag
 **/

typedef struct
{
   bool_t constructed;
   uint_t class;
   uint_t type;
   size_t length;
   const uint8_t *value;
   size_t totalLength;
} Asn1Tag;


//ASN.1 related functions
error_t asn1ReadTag(const uint8_t *data, size_t size, Asn1Tag *tag);
error_t asn1CheckTag(const Asn1Tag *tag, bool_t constructed, uint_t class, uint_t type);
error_t asn1CheckOid(const Asn1Tag *tag, const uint8_t *oid, size_t length);
error_t asn1DumpObject(const uint8_t *data, size_t length, uint_t level);
void asn1DumpOid(const uint8_t *data, size_t length);

#endif
