/**
 * @file smtp_client.h
 * @brief SMTP client (Simple Mail Transfer Protocol)
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

#ifndef _SMTP_CLIENT_H
#define _SMTP_CLIENT_H

//Dependencies
#include "crypto.h"
#include "socket.h"

//Default timeout
#ifndef SMTP_DEFAULT_TIMEOUT
   #define SMTP_DEFAULT_TIMEOUT 10000
#elif (SMTP_DEFAULT_TIMEOUT < 1000)
   #error SMTP_DEFAULT_TIMEOUT parameter is not valid
#endif

//Maximum line length
#ifndef SMTP_MAX_LINE_LENGTH
   #define SMTP_MAX_LINE_LENGTH 512
#elif (SMTP_MAX_LINE_LENGTH < 64)
   #error SMTP_MAX_LINE_LENGTH parameter is not valid
#endif

//LOGIN authentication support
#ifndef SMTP_LOGIN_AUTH_SUPPORT
   #define SMTP_LOGIN_AUTH_SUPPORT ENABLED
#elif (SMTP_LOGIN_AUTH_SUPPORT != ENABLED && SMTP_LOGIN_AUTH_SUPPORT != DISABLED)
   #error SMTP_LOGIN_AUTH_SUPPORT parameter is not valid
#endif

//PLAIN authentication support
#ifndef SMTP_PLAIN_AUTH_SUPPORT
   #define SMTP_PLAIN_AUTH_SUPPORT ENABLED
#elif (SMTP_PLAIN_AUTH_SUPPORT != ENABLED && SMTP_PLAIN_AUTH_SUPPORT != DISABLED)
   #error SMTP_PLAIN_AUTH_SUPPORT parameter is not valid
#endif

//CRAM-MD5 authentication support
#ifndef SMTP_CRAM_MD5_AUTH_SUPPORT
   #define SMTP_CRAM_MD5_AUTH_SUPPORT DISABLED
#elif (SMTP_CRAM_MD5_AUTH_SUPPORT != ENABLED && SMTP_CRAM_MD5_AUTH_SUPPORT != DISABLED)
   #error SMTP_CRAM_MD5_AUTH_SUPPORT parameter is not valid
#endif

//Secure SMTP over SSL/TLS when available
#ifndef SMTP_TLS_SUPPORT
   #define SMTP_TLS_SUPPORT DISABLED
#elif (SMTP_TLS_SUPPORT != ENABLED && SMTP_TLS_SUPPORT != DISABLED)
   #error SMTP_TLS_SUPPORT parameter is not valid
#endif

//SMTP port number
#define SMTP_PORT 25
//SMTPS port number (SMTP over SSL/TLS)
#define SMTPS_PORT 465
//SMTP message submission port number
#define SMTP_SUBMISSION_PORT 587

//Test macros for SMTP response codes
#define SMTP_REPLY_CODE_2YZ(code) ((code) >= 200 && (code) < 300)
#define SMTP_REPLY_CODE_3YZ(code) ((code) >= 300 && (code) < 400)
#define SMTP_REPLY_CODE_4YZ(code) ((code) >= 400 && (code) < 500)
#define SMTP_REPLY_CODE_5YZ(code) ((code) >= 500 && (code) < 600)

//Check whether SSL/TLS support is enabled
#if (SMTP_TLS_SUPPORT == ENABLED)
   #include "tls.h"
#endif

//PLAIN or CRAM-MD5 authentication supported?
#if (SMTP_PLAIN_AUTH_SUPPORT == ENABLED || SMTP_CRAM_MD5_AUTH_SUPPORT == ENABLED)
   #include "base64.h"
#endif

//CRAM-MD5 authentication supported?
#if (SMTP_CRAM_MD5_AUTH_SUPPORT == ENABLED)
   #include "hmac.h"
#endif


/**
 * @brief Recipient type
 **/

typedef enum
{
   SMTP_RCPT_TYPE_TO  = 1,
   SMTP_RCPT_TYPE_CC  = 2,
   SMTP_RCPT_TYPE_BCC = 4,
} SmtpRecipientType;


/**
 * @brief Authentication information
 **/

typedef struct
{
   NetInterface *interface;
   const char_t *serverName;
   uint16_t serverPort;
   const char_t *userName;
   const char_t *password;
   bool_t useTls;
   const PrngAlgo *prngAlgo;
   void *prngContext;
} SmtpAuthInfo;


/**
 * @brief Mail address
 **/

typedef struct
{
   char_t *name;
   char_t *addr;
   uint_t type;
} SmtpMailAddr;


/**
 * @brief Mail contents
 **/

typedef struct
{
   SmtpMailAddr from;
   const SmtpMailAddr *recipients;
   uint_t recipientCount;
   char_t *dateTime;
   const char_t *subject;
   const char_t *body;
} SmtpMail;


/**
 * @brief SMTP client context
 **/

typedef struct
{
   Socket *socket;                           ///<Underlying socket
   bool_t authLoginSupported;                ///<LOGIN authentication mechanism supported
   bool_t authPlainSupported;                ///<PLAIN authentication mechanism supported
   bool_t authCramMd5Supported;              ///<CRAM-MD5 authentication mechanism supported
   bool_t startTlsSupported;                 ///<STARTTLS command supported
   char_t buffer[SMTP_MAX_LINE_LENGTH / 2];  ///<Memory buffer for input/output operations
   char_t buffer2[SMTP_MAX_LINE_LENGTH / 2];
#if (SMTP_TLS_SUPPORT == ENABLED)
   TlsContext *tlsContext;                   ///<TLS context
#endif
} SmtpClientContext;


//Callback function to parse a response line
typedef error_t (*SmtpReplyCallback)(SmtpClientContext *context, char_t *replyLine, uint_t replyCode);

//SMTP related functions
error_t smtpSendMail(const SmtpAuthInfo *authInfo, const SmtpMail *mail);

error_t smtpEhloReplyCallback(SmtpClientContext *context,
   char_t *replyLine, uint_t replyCode);

error_t smtpSendAuthLogin(SmtpClientContext *context, const SmtpAuthInfo *authInfo);
error_t smtpSendAuthPlain(SmtpClientContext *context, const SmtpAuthInfo *authInfo);
error_t smtpSendAuthCramMd5(SmtpClientContext *context, const SmtpAuthInfo *authInfo);

error_t smtpSendData(SmtpClientContext *context, const SmtpMail *mail);

error_t smtpSendCommand(SmtpClientContext *context, const char_t *command,
   uint_t *replyCode, SmtpReplyCallback callback);

error_t smtpWrite(SmtpClientContext *context, const void *data, size_t length, uint_t flags);
error_t smtpRead(SmtpClientContext *context, void *data, size_t size, size_t *received, uint_t flags);

#endif
