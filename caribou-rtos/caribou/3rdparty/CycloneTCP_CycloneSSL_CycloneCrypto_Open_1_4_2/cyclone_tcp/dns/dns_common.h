/**
 * @file dns_common.h
 * @brief Common DNS routines
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneTCP Open.
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

#ifndef _DNS_COMMON_H
#define _DNS_COMMON_H

//Dependencies
#include "tcp_ip_stack.h"

//DNS port number
#define DNS_PORT 53
//Maximum size of DNS messages
#define DNS_MESSAGE_MAX_SIZE 512
//Maximum size of names
#define DNS_NAME_MAX_SIZE 255
//Maximum size of labels
#define DNS_LABEL_MAX_SIZE 63
//Label compression tag
#define DNS_COMPRESSION_TAG 0xC0

//Macro definition
#define DNS_GET_QUESTION(message, offset) (DnsQuestion *) ((uint8_t *) message + offset)
#define DNS_GET_RESOURCE_RECORD(message, offset) (DnsResourceRecord *) ((uint8_t *) message + offset)


/**
 * @brief DNS opcodes
 **/

typedef enum
{
   DNS_OPCODE_QUERY         = 0,
   DNS_OPCODE_INVERSE_QUERY = 1,
   DNS_OPCODE_STATUS        = 2,
   DNS_OPCODE_NOTIFY        = 4,
   DNS_OPCODE_UPDATE        = 5
} DnsOpcode;


/**
 * @brief DNS return codes
 **/

typedef enum
{
   DNS_RCODE_NO_ERROR        = 0,
   DNS_RCODE_FORMAT_ERROR    = 1,
   DNS_RCODE_SERVER_FAILURE  = 2,
   DNS_RCODE_NAME_ERROR      = 3,
   DNS_RCODE_NOT_IMPLEMENTED = 4,
   DNS_RCODE_QUERY_REFUSED   = 5
}DnsReturnCode;


/**
 * @brief DNS resource record types
 **/

typedef enum
{
   DNS_RR_TYPE_A     = 1,
   DNS_RR_TYPE_NS    = 2,
   DNS_RR_TYPE_CNAME = 5,
   DNS_RR_TYPE_PTR   = 12,
   DNS_RR_TYPE_HINFO = 13,
   DNS_RR_TYPE_MX    = 15,
   DNS_RR_TYPE_AAAA  = 28,
   DNS_RR_TYPE_AXFR  = 252,
   DNS_RR_TYPE_ANY   = 255
} DnsResourceRecordType;


/**
 * @brief DNS resource record classes
 **/

typedef enum
{
   DNS_RR_CLASS_IN = 1,
   DNS_RR_CLASS_CH = 3,
   DNS_RR_CLASS_HS = 4
} DnsResourceRecordClass;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief DNS message header
 **/

typedef __packed struct
{
   uint16_t id;         //0-1
   uint8_t rd : 1;      //2
   uint8_t tc : 1;
   uint8_t aa : 1;
   uint8_t opcode : 4;
   uint8_t qr : 1;
   uint8_t rcode : 4;   //3
   uint8_t z : 3;
   uint8_t ra : 1;
   uint16_t qdcount;    //4-5
   uint16_t ancount;    //6-7
   uint16_t nscount;    //8-9
   uint16_t arcount;    //10-11
   uint8_t questions[]; //12
} DnsHeader;


/**
 * @brief Question format
 **/

typedef __packed struct
{
   uint16_t qtype;
   uint16_t qclass;
} DnsQuestion;


/**
 * @brief Resource record format
 **/

typedef __packed struct
{
   uint16_t rtype;    //0-1
   uint16_t rclass;   //2-3
   uint32_t ttl;      //4-7
   uint16_t rdlength; //8-9
   uint8_t rdata[];   //10
} DnsResourceRecord;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


//DNS related functions
size_t dnsEncodeName(const char_t *src, uint8_t *dest);
size_t dnsParseName(const DnsHeader *message, size_t length, size_t pos, char_t *dest);
bool_t dnsCompareName(const DnsHeader *message, size_t length, size_t pos, const char_t *name);

#endif
