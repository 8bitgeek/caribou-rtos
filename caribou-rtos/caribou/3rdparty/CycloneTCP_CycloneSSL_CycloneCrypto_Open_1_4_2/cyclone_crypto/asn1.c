/**
 * @file asn1.c
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

//Switch to the appropriate trace level
#define TRACE_LEVEL CRYPTO_TRACE_LEVEL

//Dependencies
#include <string.h>
#include "crypto.h"
#include "asn1.h"
#include "debug.h"


/**
 * @brief Read an ASN.1 tag from an input stream
 * @param[in] data Input stream where to read the tag
 * @param[in] length Number of bytes available in the input stream
 * @param[out] tag Structure describing the ASN.1 tag
 * @return Error code
 **/

error_t asn1ReadTag(const uint8_t *data, size_t length, Asn1Tag *tag)
{
   uint_t i;
   uint_t n;

   //Make sure the identifier octet is present
   if(!length)
      return ERROR_INVALID_TAG;

   //Save the class of the ASN.1 tag
   tag->class = data[0] & ASN1_CLASS_MASK;
   //Primitive or constructed encoding?
   tag->constructed = (data[0] & ASN1_ENCODING_CONSTRUCTED) ? TRUE : FALSE;

   //Check the tag number
   if((data[0] & ASN1_TAG_NUMBER_MASK) < 31)
   {
      //Tag number is in the range 0 to 30
      tag->type = data[0] & ASN1_TAG_NUMBER_MASK;
      //Point to the tag length field
      i = 1;
   }
   else
   {
      //If the tag number is greater than or equal to 31,
      //the subsequent octets will encode the tag number
      tag->type = 0;

      //Decode the tag number
      for(i = 1; ; i++)
      {
         //The field cannot exceed 4 bytes
         if(i > sizeof(tag->type))
            return ERROR_INVALID_TAG;
         //Insufficient number of bytes to decode the tag number?
         if(!(length - i))
            return ERROR_INVALID_TAG;

         //Update the tag number with bits 7 to 1
         tag->type = (tag->type << 7) | (data[i] & 0x7F);

         //Bit 8 shall be set unless it is the last octet
         if(data[i] & 0x80)
            break;
      }
      //Point to the tag length field
      i++;
   }

   //Insufficient number of bytes to decode the tag length?
   if(!(length - i))
      return ERROR_INVALID_TAG;

   //Short form is used?
   if(data[i] < 128)
   {
      //Bits 7 to 1 encode the number of bytes in the contents
      tag->length = data[i];
      //Point to the contents of the tag
      i++;
   }
   //Long form is used?
   else if(data[i] > 128 && data[i] < 255)
   {
      //Bits 7 to 1 encode the number of octets in the length field
      n = data[i] & 0x7F;

      //The field cannot exceed 4 bytes
      if(n > sizeof(tag->length))
         return ERROR_INVALID_TAG;
      //Insufficient number of bytes to decode the tag length?
      if((length - i) < n)
         return ERROR_INVALID_TAG;

      //Clear the tag length
      tag->length = 0;
      //Read the subsequent octets
      for(i++; n > 0; n--)
         tag->length = (tag->length << 8) | data[i++];
   }
   //Indefinite form is used?
   else
   {
      //Indefinite form is not supported
      return ERROR_INVALID_TAG;
   }

   //Save the pointer to the tag contents
   tag->value = data + i;
   //Check the length of tag
   if((length - i) < tag->length)
      return ERROR_INVALID_TAG;

   //Total length occupied by the ASN.1 tag in the input stream
   tag->totalLength = i + tag->length;
   //ASN.1 tag successfully decoded
   return NO_ERROR;
}


/**
 * @brief Enforce the type of a specified tag
 * @param[in] tag Pointer to an ASN.1 tag
 * @param[in] constructed Expected encoding (TRUE for constructed, FALSE for primitive)
 * @param[in] class Expected tag class
 * @param[in] type Expected tag type
 * @return Error code
 **/

error_t asn1CheckTag(const Asn1Tag *tag, bool_t constructed, uint_t class, uint_t type)
{
   //Check encoding
   if(tag->constructed != constructed)
      return ERROR_WRONG_ENCODING;
   //Enforce the type
   if(tag->class != class)
      return ERROR_INVALID_CLASS;
   //Enforce the class
   if(tag->type != type)
      return ERROR_INVALID_TYPE;

   //The tag matches all the criteria
   return NO_ERROR;
}


/**
 * @brief Check ASN.1 tag against a specified OID
 * @param[in] tag Pointer to an ASN.1 tag
 * @param[in] oid Expected object identifier (OID)
 * @param[in] length Length of the OID
 * @return Error code
 **/

error_t asn1CheckOid(const Asn1Tag *tag, const uint8_t *oid, size_t length)
{
   error_t error;

   //Enforce encoding, type and class
   error = asn1CheckTag(tag, FALSE, ASN1_CLASS_UNIVERSAL, ASN1_TYPE_OBJECT_IDENTIFIER);
   //Any error to report?
   if(error) return error;

   //Compare OID against the specified value
   if(!oidComp(tag->value, tag->length, oid, length))
      return ERROR_WRONG_IDENTIFIER;

   //The tag matches all the criteria
   return NO_ERROR;
}


/**
 * @brief Display an ASN.1 data object
 * @param[in] data Pointer to the ASN.1 object to dump
 * @param[in] length Length of the ASN.1 object
 * @param[in] level Current level of recursion (this parameter shall be set to 0)
 * @return Error code
 **/

error_t asn1DumpObject(const uint8_t *data, size_t length, uint_t level)
{
//Check debugging level
#if (TRACE_LEVEL >= TRACE_LEVEL_DEBUG)
   error_t error;
   uint_t i;
   Asn1Tag tag;

   //ASN.1 universal types
   static const char_t *label[32] =
   {
      "[0]",
      "BOOLEAN",
      "INTEGER",
      "BIT STRING",
      "OCTET STRING",
      "NULL",
      "OBJECT IDENTIFIER",
      "OBJECT DESCRIPTOR",
      "EXTERNAL",
      "REAL",
      "ENUMERATED",
      "[11]",
      "UTF8 STRING",
      "[13]",
      "[14]",
      "[15]",
      "SEQUENCE",
      "SET",
      "NUMERIC STRING",
      "PRINTABLE STRING",
      "TELETEX STRING",
      "VIDEOTEX STRING",
      "IA5 STRING",
      "UTC TIME",
      "GENERALIZED TIME",
      "GRAPHIC STRING",
      "VISIBLE STRING",
      "GENERAL STRING",
      "UNIVERSAL STRING",
      "[29]",
      "BMP STRING",
      "[31]"
   };

   //Prefix used to format the structure
   static const char_t *prefix[8] =
   {
      "",
      "  ",
      "    ",
      "      ",
      "        ",
      "          ",
      "            ",
      "              "
   };

   //Parse ASN.1 object
   while(length > 0)
   {
      //Decode current ASN.1 tag
      error = asn1ReadTag(data, length, &tag);
      //Decoding failed?
      if(error) return error;

      //Point to the next field
      data += tag.totalLength;
      length -= tag.totalLength;

      //Dump tag number, tag class, and contents length fields
      if(tag.type < 32 && (tag.class & ASN1_CLASS_MASK) == ASN1_CLASS_UNIVERSAL)
         TRACE_DEBUG("%s%s (%" PRIuSIZE " bytes)\r\n", prefix[level], label[tag.type], tag.length);
      else
         TRACE_DEBUG("%s[%u] (%" PRIuSIZE " bytes)\r\n", prefix[level], tag.type, tag.length);

      //Constructed type?
      if(tag.constructed)
      {
         //Check whether the maximum level of recursion is reached
         if(level < 7)
         {
            //Recursive decoding of the ASN.1 tag
            error = asn1DumpObject(tag.value, tag.length, level + 1);
            //Decoding failed?
            if(error) return error;
         }
         else
         {
            //If the maximum level of recursion is reached, then dump contents
            TRACE_DEBUG_ARRAY(prefix[level + 1], tag.value, tag.length);
         }
      }
      //Primitive type?
      else
      {
         //Check the type of the current tag
         switch(tag.type)
         {
         //OID?
         case ASN1_TYPE_OBJECT_IDENTIFIER:
            //Append prefix
            TRACE_DEBUG(prefix[level + 1]);
            //Print OID
            asn1DumpOid(tag.value, tag.length);
            //Add a line feed
            TRACE_DEBUG("\r\n");
            break;
         //String?
         case ASN1_TYPE_UTF8_STRING:
         case ASN1_TYPE_NUMERIC_STRING:
         case ASN1_TYPE_PRINTABLE_STRING:
         case ASN1_TYPE_TELETEX_STRING:
         case ASN1_TYPE_VIDEOTEX_STRING:
         case ASN1_TYPE_IA5_STRING:
         case ASN1_TYPE_GRAPHIC_STRING:
         case ASN1_TYPE_VISIBLE_STRING:
         case ASN1_TYPE_GENERAL_STRING:
         case ASN1_TYPE_UNIVERSAL_STRING:
         case ASN1_TYPE_BMP_STRING:
            //Append prefix
            TRACE_DEBUG("%s", prefix[level + 1]);
            //Dump the entire string
            for(i = 0; i < tag.length; i++)
               TRACE_DEBUG("%c", tag.value[i]);
            //Add a line feed
            TRACE_DEBUG("\r\n");
            break;
         //UTC time?
         case ASN1_TYPE_UTC_TIME:
            //Check length
            if(tag.length < 13)
               return ERROR_WRONG_ENCODING;
            //The encoding shall terminate with a "Z"
            if(tag.value[tag.length - 1] != 'Z')
               return ERROR_WRONG_ENCODING;

            //Append prefix
            TRACE_DEBUG("%s", prefix[level + 1]);
            //Display date
            TRACE_DEBUG("%c%c/%c%c/%c%c ", tag.value[0], tag.value[1],
               tag.value[2], tag.value[3], tag.value[4], tag.value[5]);
            //Display time
            TRACE_DEBUG("%c%c:%c%c:%c%c", tag.value[6], tag.value[7],
               tag.value[8], tag.value[9], tag.value[10], tag.value[11]);
            //Add a line feed
            TRACE_DEBUG("\r\n");
            break;
         //Generalized time?
         case ASN1_TYPE_GENERALIZED_TIME:
            //Check length
            if(tag.length < 13)
               return ERROR_WRONG_ENCODING;
            //The encoding shall terminate with a "Z"
            if(tag.value[tag.length - 1] != 'Z')
               return ERROR_WRONG_ENCODING;

            //Append prefix
            TRACE_DEBUG("%s", prefix[level + 1]);
            //Display date
            TRACE_DEBUG("%c%c%c%c/%c%c/%c%c ", tag.value[0], tag.value[1], tag.value[2],
               tag.value[3], tag.value[4], tag.value[5], tag.value[6], tag.value[7]);
            //Display time
            TRACE_DEBUG("%c%c:%c%c:%c%c", tag.value[8], tag.value[9],
               tag.value[10], tag.value[11], tag.value[12], tag.value[13]);
            //Add a line feed
            TRACE_DEBUG("\r\n");
            break;
         //Any other type?
         default:
            //Dump the contents of the tag
            TRACE_DEBUG_ARRAY(prefix[level + 1], tag.value, tag.length);
            break;
         }
      }
   }
#endif

   //ASN.1 object successfully decoded
   return NO_ERROR;
}


/**
 * @brief Display an object identifier
 * @param[in] data Pointer to the raw data encoding the OID
 * @param[in] length Length of the raw data
 **/

void asn1DumpOid(const uint8_t *data, size_t length)
{
   size_t i;
   uint32_t n;

   //Display the first 2 bytes
   TRACE_DEBUG("%" PRIu8 ".%" PRIu8 "", data[0] / 40, data[0] % 40);

   //Display the rest of the OID
   for(i = 1, n = 0; i < length; i++)
   {
      //Update the current value
      n = (n << 7) | (data[i] & 0x7F);

      //Bit b8 is set to zero to indicate the last byte
      if(!(data[i] & 0x80))
      {
         //Dump current value
         TRACE_DEBUG(".%" PRIu32, n);
         //Prepare to decode the next value
         n = 0;
      }
   }
}
