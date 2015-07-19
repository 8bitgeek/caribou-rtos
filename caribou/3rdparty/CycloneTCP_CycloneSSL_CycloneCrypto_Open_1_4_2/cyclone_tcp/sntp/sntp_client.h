/**
 * @file sntp_client.h
 * @brief SNTP client (Simple Network Time Protocol)
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

//Dependencies
#include "tcp_ip_stack.h"
#include "socket.h"

//SNTP client support
#ifndef SNTP_CLIENT_SUPPORT
   #define SNTP_CLIENT_SUPPORT ENABLED
#elif (SNTP_CLIENT_SUPPORT != ENABLED && SNTP_CLIENT_SUPPORT != DISABLED)
   #error SNTP_CLIENT_SUPPORT parameter is not valid
#endif

//Maximum number of retransmissions of SNTP requests
#ifndef SNTP_CLIENT_MAX_RETRIES
   #define SNTP_CLIENT_MAX_RETRIES 3
#elif (SNTP_CLIENT_MAX_RETRIES < 1)
   #error SNTP_CLIENT_MAX_RETRIES parameter is not valid
#endif

//Initial retransmission timeout
#ifndef SNTP_CLIENT_INIT_TIMEOUT
   #define SNTP_CLIENT_INIT_TIMEOUT 1000
#elif (SNTP_CLIENT_INIT_TIMEOUT < 1000)
   #error SNTP_CLIENT_INIT_TIMEOUT parameter is not valid
#endif

//Maximum retransmission timeout
#ifndef SNTP_CLIENT_MAX_TIMEOUT
   #define SNTP_CLIENT_MAX_TIMEOUT 5000
#elif (SNTP_CLIENT_MAX_TIMEOUT < 1000)
   #error SNTP_CLIENT_MAX_TIMEOUT parameter is not valid
#endif

//NTP port number
#define NTP_PORT 123
//Maximum size of NTP packets
#define NTP_MESSAGE_MAX_SIZE 68

/**
 * @brief Leap indicator
 **/

typedef enum
{
   NTP_LI_NO_WARNING           = 0,
   NTP_LI_LAST_MIN_HAS_61_SECS = 1,
   NTP_LI_LAST_MIN_HAS_59_SECS = 2,
   NTP_LI_ALARM_CONDITION      = 3
} NtpLeapIndicator;


/**
 * @brief NTP version number
 **/

typedef enum
{
   NTP_VERSION_1 = 1,
   NTP_VERSION_2 = 2,
   NTP_VERSION_3 = 3,
   NTP_VERSION_4 = 4
} NtpVersion;


/**
 * @brief Protocol mode
 **/

typedef enum
{
   NTP_MODE_SYMMETRIC_ACTIVE  = 1,
   NTP_MODE_SYMMETRIC_PASSIVE = 2,
   NTP_MODE_CLIENT            = 3,
   NTP_MODE_SERVER            = 4,
   NTP_MODE_BROADCAST         = 5
} NtpMode;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief Time representation
 **/

typedef __packed struct
{
   uint32_t seconds;
   uint32_t fraction;
} NtpTimestamp;


/**
 * @brief NTP packet header
 **/

typedef __packed struct
{
   uint8_t mode : 3;                //0
   uint8_t vn : 3;
   uint8_t li : 2;
   uint8_t stratum;                 //1
   uint8_t poll;                    //2
   int8_t precision;                //3
   uint32_t rootDelay;              //4-7
   uint32_t rootDispersion;         //8-11
   uint32_t referenceIdentifier;    //12-15
   NtpTimestamp referenceTimestamp; //16-23
   NtpTimestamp originateTimestamp; //24-31
   NtpTimestamp receiveTimestamp;   //32-39
   NtpTimestamp transmitTimestamp;  //40-47
} NtpHeader;


/**
 * @brief Authentication data
 **/

typedef __packed struct
{
   uint32_t keyIdentifier;
   uint8_t messageDigest[16];
} NtpAuthData;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief SNTP client context
 **/

typedef struct
{
   Socket *socket;    ///<Underlying socket
   NtpHeader message; ///<Buffer where to format NTP messages
   systime_t t1;      ///<Time at which the NTP request was sent by the client
   systime_t t4;      ///<Time at which the NTP reply was received by the client
} SntpClientContext;


//SNTP client related functions
error_t sntpClientGetTimestamp(NetInterface *interface,
   const IpAddr *serverIpAddr, NtpTimestamp *timestamp);

error_t sntpSendRequest(SntpClientContext *context);
error_t sntpWaitForResponse(SntpClientContext *context, systime_t timeout);

error_t sntpParseResponse(SntpClientContext *context,
   const NtpHeader *message, size_t length);

void sntpDumpMessage(const NtpHeader *message, size_t length);
void sntpDumpTimestamp(const NtpTimestamp *timestamp);
