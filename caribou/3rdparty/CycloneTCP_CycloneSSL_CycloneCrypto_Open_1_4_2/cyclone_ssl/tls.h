/**
 * @file tls.h
 * @brief TLS (Transport Layer Security)
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This file is part of CycloneSSL Open.
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

#ifndef _TLS_H
#define _TLS_H

//Dependencies
#include "crypto.h"
#include "tls_config.h"
#include "hmac.h"
#include "rsa.h"
#include "dsa.h"
#include "ecdsa.h"
#include "dh.h"
#include "ecdh.h"

//TLS version numbers
#define SSL_VERSION_3_0 0x0300
#define TLS_VERSION_1_0 0x0301
#define TLS_VERSION_1_1 0x0302
#define TLS_VERSION_1_2 0x0303

//Enable SSL/TLS support
#ifndef TLS_SUPPORT
   #define TLS_SUPPORT ENABLED
#elif (TLS_SUPPORT != ENABLED && TLS_SUPPORT != DISABLED)
   #error TLS_SUPPORT parameter is not valid
#endif

//Client mode of operation
#ifndef TLS_CLIENT_SUPPORT
   #define TLS_CLIENT_SUPPORT ENABLED
#elif (TLS_CLIENT_SUPPORT != ENABLED && TLS_CLIENT_SUPPORT != DISABLED)
   #error TLS_CLIENT_SUPPORT parameter is not valid
#endif

//Server mode of operation
#ifndef TLS_SERVER_SUPPORT
   #define TLS_SERVER_SUPPORT ENABLED
#elif (TLS_SERVER_SUPPORT != ENABLED && TLS_SERVER_SUPPORT != DISABLED)
   #error TLS_SERVER_SUPPORT parameter is not valid
#endif

//Minimum version that can be negotiated
#ifndef TLS_MIN_VERSION
   #define TLS_MIN_VERSION SSL_VERSION_3_0
#elif (TLS_MIN_VERSION < SSL_VERSION_3_0)
   #error TLS_MIN_VERSION parameter is not valid
#endif

//Maximum version that can be negotiated
#ifndef TLS_MAX_VERSION
   #define TLS_MAX_VERSION TLS_VERSION_1_2
#elif (TLS_MAX_VERSION > TLS_VERSION_1_2 || TLS_MAX_VERSION < TLS_MIN_VERSION)
   #error TLS_MAX_VERSION parameter is not valid
#endif

//Use BSD socket API
#ifndef TLS_BSD_SOCKET_SUPPORT
   #define TLS_BSD_SOCKET_SUPPORT DISABLED
#elif (TLS_BSD_SOCKET_SUPPORT != ENABLED && TLS_BSD_SOCKET_SUPPORT != DISABLED)
   #error TLS_BSD_SOCKET_SUPPORT parameter is not valid
#endif

//Session resumption mechanism
#ifndef TLS_SESSION_RESUME_SUPPORT
   #define TLS_SESSION_RESUME_SUPPORT ENABLED
#elif (TLS_SESSION_RESUME_SUPPORT != ENABLED && TLS_SESSION_RESUME_SUPPORT != DISABLED)
   #error TLS_SESSION_RESUME_SUPPORT parameter is not valid
#endif

//Lifetime of session cache entries
#ifndef TLS_SESSION_CACHE_LIFETIME
   #define TLS_SESSION_CACHE_LIFETIME 3600000
#elif (TLS_SESSION_CACHE_LIFETIME < 1000)
   #error TLS_SESSION_CACHE_LIFETIME parameter is not valid
#endif

//SNI (Server Name Indication) extension
#ifndef TLS_SNI_SUPPORT
   #define TLS_SNI_SUPPORT ENABLED
#elif (TLS_SNI_SUPPORT != ENABLED && TLS_SNI_SUPPORT != DISABLED)
   #error TLS_SNI_SUPPORT parameter is not valid
#endif

//Maximum number of certificates the end entity can load
#ifndef TLS_MAX_CERTIFICATES
   #define TLS_MAX_CERTIFICATES 3
#elif (TLS_MAX_CERTIFICATES < 1)
   #error TLS_MAX_CERTIFICATES parameter is not valid
#endif

//Maximum message length that can be handled by the higher-level protocol
#ifndef TLS_MAX_PROTOCOL_DATA_LENGTH
   #define TLS_MAX_PROTOCOL_DATA_LENGTH 16384
#elif (TLS_MAX_PROTOCOL_DATA_LENGTH < 4096)
   #error TLS_MAX_PROTOCOL_DATA_LENGTH parameter is not valid
#endif

//RSA key exchange support
#ifndef TLS_RSA_SUPPORT
   #define TLS_RSA_SUPPORT ENABLED
#elif (TLS_RSA_SUPPORT != ENABLED && TLS_RSA_SUPPORT != DISABLED)
   #error TLS_RSA_SUPPORT parameter is not valid
#endif

//DHE_RSA key exchange support
#ifndef TLS_DHE_RSA_SUPPORT
   #define TLS_DHE_RSA_SUPPORT ENABLED
#elif (TLS_DHE_RSA_SUPPORT != ENABLED && TLS_DHE_RSA_SUPPORT != DISABLED)
   #error TLS_DHE_RSA_SUPPORT parameter is not valid
#endif

//DHE_DSS key exchange support
#ifndef TLS_DHE_DSS_SUPPORT
   #define TLS_DHE_DSS_SUPPORT ENABLED
#elif (TLS_DHE_DSS_SUPPORT != ENABLED && TLS_DHE_DSS_SUPPORT != DISABLED)
   #error TLS_DHE_DSS_SUPPORT parameter is not valid
#endif

//DH_anon key exchange support
#ifndef TLS_DH_ANON_SUPPORT
   #define TLS_DH_ANON_SUPPORT DISABLED
#elif (TLS_DH_ANON_SUPPORT != ENABLED && TLS_DH_ANON_SUPPORT != DISABLED)
   #error TLS_DH_ANON_SUPPORT parameter is not valid
#endif

//ECDHE_RSA key exchange support
#ifndef TLS_ECDHE_RSA_SUPPORT
   #define TLS_ECDHE_RSA_SUPPORT ENABLED
#elif (TLS_ECDHE_RSA_SUPPORT != ENABLED && TLS_ECDHE_RSA_SUPPORT != DISABLED)
   #error TLS_ECDHE_RSA_SUPPORT parameter is not valid
#endif

//ECDHE_ECDSA key exchange support
#ifndef TLS_ECDHE_ECDSA_SUPPORT
   #define TLS_ECDHE_ECDSA_SUPPORT ENABLED
#elif (TLS_ECDHE_ECDSA_SUPPORT != ENABLED && TLS_ECDHE_ECDSA_SUPPORT != DISABLED)
   #error TLS_ECDHE_ECDSA_SUPPORT parameter is not valid
#endif

//ECDH_anon key exchange support
#ifndef TLS_ECDH_ANON_SUPPORT
   #define TLS_ECDH_ANON_SUPPORT DISABLED
#elif (TLS_ECDH_ANON_SUPPORT != ENABLED && TLS_ECDH_ANON_SUPPORT != DISABLED)
   #error TLS_ECDH_ANON_SUPPORT parameter is not valid
#endif

//RSA signature capability
#ifndef TLS_RSA_SIGN_SUPPORT
   #define TLS_RSA_SIGN_SUPPORT ENABLED
#elif (TLS_RSA_SIGN_SUPPORT != ENABLED && TLS_RSA_SIGN_SUPPORT != DISABLED)
   #error TLS_RSA_SIGN_SUPPORT parameter is not valid
#endif

//DSA signature capability
#ifndef TLS_DSA_SIGN_SUPPORT
   #define TLS_DSA_SIGN_SUPPORT ENABLED
#elif (TLS_DSA_SIGN_SUPPORT != ENABLED && TLS_DSA_SIGN_SUPPORT != DISABLED)
   #error TLS_DSA_SIGN_SUPPORT parameter is not valid
#endif

//ECDSA signature capability
#ifndef TLS_ECDSA_SIGN_SUPPORT
   #define TLS_ECDSA_SIGN_SUPPORT ENABLED
#elif (TLS_ECDSA_SIGN_SUPPORT != ENABLED && TLS_ECDSA_SIGN_SUPPORT != DISABLED)
   #error TLS_ECDSA_SIGN_SUPPORT parameter is not valid
#endif

//Stream cipher support
#ifndef TLS_STREAM_CIPHER_SUPPORT
   #define TLS_STREAM_CIPHER_SUPPORT ENABLED
#elif (TLS_STREAM_CIPHER_SUPPORT != ENABLED && TLS_STREAM_CIPHER_SUPPORT != DISABLED)
   #error TLS_STREAM_CIPHER_SUPPORT parameter is not valid
#endif

//CBC block cipher support
#ifndef TLS_CBC_CIPHER_SUPPORT
   #define TLS_CBC_CIPHER_SUPPORT ENABLED
#elif (TLS_CBC_CIPHER_SUPPORT != ENABLED && TLS_CBC_CIPHER_SUPPORT != DISABLED)
   #error TLS_CBC_CIPHER_SUPPORT parameter is not valid
#endif

//CCM mode support
#ifndef TLS_CCM_CIPHER_SUPPORT
   #define TLS_CCM_CIPHER_SUPPORT ENABLED
#elif (TLS_CCM_CIPHER_SUPPORT != ENABLED && TLS_CCM_CIPHER_SUPPORT != DISABLED)
   #error TLS_CCM_CIPHER_SUPPORT parameter is not valid
#endif

//GCM mode support
#ifndef TLS_GCM_CIPHER_SUPPORT
   #define TLS_GCM_CIPHER_SUPPORT ENABLED
#elif (TLS_GCM_CIPHER_SUPPORT != ENABLED && TLS_GCM_CIPHER_SUPPORT != DISABLED)
   #error TLS_GCM_CIPHER_SUPPORT parameter is not valid
#endif

//RC4 cipher support
#ifndef TLS_RC4_SUPPORT
   #define TLS_RC4_SUPPORT ENABLED
#elif (TLS_RC4_SUPPORT != ENABLED && TLS_RC4_SUPPORT != DISABLED)
   #error TLS_RC4_SUPPORT parameter is not valid
#endif

//IDEA cipher support
#ifndef TLS_IDEA_SUPPORT
   #define TLS_IDEA_SUPPORT DISABLED
#elif (TLS_IDEA_SUPPORT != ENABLED && TLS_IDEA_SUPPORT != DISABLED)
   #error TLS_IDEA_SUPPORT parameter is not valid
#endif

//DES cipher support
#ifndef TLS_DES_SUPPORT
   #define TLS_DES_SUPPORT DISABLED
#elif (TLS_DES_SUPPORT != ENABLED && TLS_DES_SUPPORT != DISABLED)
   #error TLS_DES_SUPPORT parameter is not valid
#endif

//Triple DES cipher support
#ifndef TLS_3DES_SUPPORT
   #define TLS_3DES_SUPPORT ENABLED
#elif (TLS_3DES_SUPPORT != ENABLED && TLS_3DES_SUPPORT != DISABLED)
   #error TLS_3DES_SUPPORT parameter is not valid
#endif

//AES cipher support
#ifndef TLS_AES_SUPPORT
   #define TLS_AES_SUPPORT ENABLED
#elif (TLS_AES_SUPPORT != ENABLED && TLS_AES_SUPPORT != DISABLED)
   #error TLS_AES_SUPPORT parameter is not valid
#endif

//Camellia cipher support
#ifndef TLS_CAMELLIA_SUPPORT
   #define TLS_CAMELLIA_SUPPORT ENABLED
#elif (TLS_CAMELLIA_SUPPORT != ENABLED && TLS_CAMELLIA_SUPPORT != DISABLED)
   #error TLS_CAMELLIA_SUPPORT parameter is not valid
#endif

//SEED cipher support
#ifndef TLS_SEED_SUPPORT
   #define TLS_SEED_SUPPORT ENABLED
#elif (TLS_SEED_SUPPORT != ENABLED && TLS_SEED_SUPPORT != DISABLED)
   #error TLS_SEED_SUPPORT parameter is not valid
#endif

//ARIA cipher support
#ifndef TLS_ARIA_SUPPORT
   #define TLS_ARIA_SUPPORT ENABLED
#elif (TLS_ARIA_SUPPORT != ENABLED && TLS_ARIA_SUPPORT != DISABLED)
   #error TLS_ARIA_SUPPORT parameter is not valid
#endif

//MD5 hash support
#ifndef TLS_MD5_SUPPORT
   #define TLS_MD5_SUPPORT ENABLED
#elif (TLS_MD5_SUPPORT != ENABLED && TLS_MD5_SUPPORT != DISABLED)
   #error TLS_MD5_SUPPORT parameter is not valid
#endif

//SHA-1 hash support
#ifndef TLS_SHA1_SUPPORT
   #define TLS_SHA1_SUPPORT ENABLED
#elif (TLS_SHA1_SUPPORT != ENABLED && TLS_SHA1_SUPPORT != DISABLED)
   #error TLS_SHA1_SUPPORT parameter is not valid
#endif

//SHA-224 hash support
#ifndef TLS_SHA224_SUPPORT
   #define TLS_SHA224_SUPPORT ENABLED
#elif (TLS_SHA224_SUPPORT != ENABLED && TLS_SHA224_SUPPORT != DISABLED)
   #error TLS_SHA224_SUPPORT parameter is not valid
#endif

//SHA-256 hash support
#ifndef TLS_SHA256_SUPPORT
   #define TLS_SHA256_SUPPORT ENABLED
#elif (TLS_SHA256_SUPPORT != ENABLED && TLS_SHA256_SUPPORT != DISABLED)
   #error TLS_SHA256_SUPPORT parameter is not valid
#endif

//SHA-384 hash support
#ifndef TLS_SHA384_SUPPORT
   #define TLS_SHA384_SUPPORT ENABLED
#elif (TLS_SHA384_SUPPORT != ENABLED && TLS_SHA384_SUPPORT != DISABLED)
   #error TLS_SHA384_SUPPORT parameter is not valid
#endif

//SHA-512 hash support
#ifndef TLS_SHA512_SUPPORT
   #define TLS_SHA512_SUPPORT ENABLED
#elif (TLS_SHA512_SUPPORT != ENABLED && TLS_SHA512_SUPPORT != DISABLED)
   #error TLS_SHA512_SUPPORT parameter is not valid
#endif

//secp160k1 elliptic curve support
#ifndef TLS_SECP160K1_SUPPORT
   #define TLS_SECP160K1_SUPPORT DISABLED
#elif (TLS_SECP160K1_SUPPORT != ENABLED && TLS_SECP160K1_SUPPORT != DISABLED)
   #error TLS_SECP160K1_SUPPORT parameter is not valid
#endif

//secp160r1 elliptic curve support
#ifndef TLS_SECP160R1_SUPPORT
   #define TLS_SECP160R1_SUPPORT DISABLED
#elif (TLS_SECP160R1_SUPPORT != ENABLED && TLS_SECP160R1_SUPPORT != DISABLED)
   #error TLS_SECP160R1_SUPPORT parameter is not valid
#endif

//secp160r2 elliptic curve support
#ifndef TLS_SECP160R2_SUPPORT
   #define TLS_SECP160R2_SUPPORT DISABLED
#elif (TLS_SECP160R2_SUPPORT != ENABLED && TLS_SECP160R2_SUPPORT != DISABLED)
   #error TLS_SECP160R2_SUPPORT parameter is not valid
#endif

//secp192k1 elliptic curve support
#ifndef TLS_SECP192K1_SUPPORT
   #define TLS_SECP192K1_SUPPORT DISABLED
#elif (TLS_SECP192K1_SUPPORT != ENABLED && TLS_SECP192K1_SUPPORT != DISABLED)
   #error TLS_SECP192K1_SUPPORT parameter is not valid
#endif

//secp192r1 elliptic curve support
#ifndef TLS_SECP192R1_SUPPORT
   #define TLS_SECP192R1_SUPPORT ENABLED
#elif (TLS_SECP192R1_SUPPORT != ENABLED && TLS_SECP192R1_SUPPORT != DISABLED)
   #error TLS_SECP192R1_SUPPORT parameter is not valid
#endif

//secp224k1 elliptic curve support
#ifndef TLS_SECP224K1_SUPPORT
   #define TLS_SECP224K1_SUPPORT DISABLED
#elif (TLS_SECP224K1_SUPPORT != ENABLED && TLS_SECP224K1_SUPPORT != DISABLED)
   #error TLS_SECP224K1_SUPPORT parameter is not valid
#endif

//secp224r1 elliptic curve support
#ifndef TLS_SECP224R1_SUPPORT
   #define TLS_SECP224R1_SUPPORT ENABLED
#elif (TLS_SECP224R1_SUPPORT != ENABLED && TLS_SECP224R1_SUPPORT != DISABLED)
   #error TLS_SECP224R1_SUPPORT parameter is not valid
#endif

//secp256k1 elliptic curve support
#ifndef TLS_SECP256K1_SUPPORT
   #define TLS_SECP256K1_SUPPORT DISABLED
#elif (TLS_SECP256K1_SUPPORT != ENABLED && TLS_SECP256K1_SUPPORT != DISABLED)
   #error TLS_SECP256K1_SUPPORT parameter is not valid
#endif

//secp256r1 elliptic curve support
#ifndef TLS_SECP256R1_SUPPORT
   #define TLS_SECP256R1_SUPPORT ENABLED
#elif (TLS_SECP256R1_SUPPORT != ENABLED && TLS_SECP256R1_SUPPORT != DISABLED)
   #error TLS_SECP256R1_SUPPORT parameter is not valid
#endif

//secp384r1 elliptic curve support
#ifndef TLS_SECP384R1_SUPPORT
   #define TLS_SECP384R1_SUPPORT ENABLED
#elif (TLS_SECP384R1_SUPPORT != ENABLED && TLS_SECP384R1_SUPPORT != DISABLED)
   #error TLS_SECP384R1_SUPPORT parameter is not valid
#endif

//secp521r1 elliptic curve support
#ifndef TLS_SECP521R1_SUPPORT
   #define TLS_SECP521R1_SUPPORT ENABLED
#elif (TLS_SECP521R1_SUPPORT != ENABLED && TLS_SECP521R1_SUPPORT != DISABLED)
   #error TLS_SECP521R1_SUPPORT parameter is not valid
#endif

//brainpoolP256r1 elliptic curve support
#ifndef TLS_BRAINPOOLP256R1_SUPPORT
   #define TLS_BRAINPOOLP256R1_SUPPORT DISABLED
#elif (TLS_BRAINPOOLP256R1_SUPPORT != ENABLED && TLS_BRAINPOOLP256R1_SUPPORT != DISABLED)
   #error TLS_BRAINPOOLP256R1_SUPPORT parameter is not valid
#endif

//brainpoolP384r1 elliptic curve support
#ifndef TLS_BRAINPOOLP384R1_SUPPORT
   #define TLS_BRAINPOOLP384R1_SUPPORT DISABLED
#elif (TLS_BRAINPOOLP384R1_SUPPORT != ENABLED && TLS_BRAINPOOLP384R1_SUPPORT != DISABLED)
   #error TLS_BRAINPOOLP384R1_SUPPORT parameter is not valid
#endif

//brainpoolP512r1 elliptic curve support
#ifndef TLS_BRAINPOOLP512R1_SUPPORT
   #define TLS_BRAINPOOLP512R1_SUPPORT DISABLED
#elif (TLS_BRAINPOOLP512R1_SUPPORT != ENABLED && TLS_BRAINPOOLP512R1_SUPPORT != DISABLED)
   #error TLS_BRAINPOOLP512R1_SUPPORT parameter is not valid
#endif

//Maximum record length
#define TLS_MAX_RECORD_LENGTH 16384
//Data overhead caused by record encryption
#define TLS_MAX_RECORD_OVERHEAD 512

//TX buffer size
#define TLS_TX_BUFFER_SIZE (sizeof(TlsRecord) + TLS_MAX_PROTOCOL_DATA_LENGTH + TLS_MAX_RECORD_OVERHEAD)
//RX buffer size
#define TLS_RX_BUFFER_SIZE (TLS_MAX_PROTOCOL_DATA_LENGTH + TLS_MAX_RECORD_OVERHEAD)

//Additional dependencies
#if (TLS_BSD_SOCKET_SUPPORT == DISABLED)
   #include "tcp_ip_stack.h"
   #include "socket.h"
#endif


/**
 * @brief Socket descriptor
 **/

#if (TLS_BSD_SOCKET_SUPPORT == ENABLED)
   typedef int_t TlsSocket;
#else
   typedef Socket *TlsSocket;
#endif


/**
 * @brief TLS connection end
 **/

typedef enum
{
   TLS_CONNECTION_END_CLIENT = 0,
   TLS_CONNECTION_END_SERVER = 1
} TlsConnectionEnd;


/**
 * @brief Client authentication mode
 **/

typedef enum
{
   TLS_CLIENT_AUTH_NONE     = 0,
   TLS_CLIENT_AUTH_OPTIONAL = 1,
   TLS_CLIENT_AUTH_REQUIRED = 2
} TlsClientAuthMode;


/**
 * @brief Flags used by read and write functions
 **/

typedef enum
{
   TLS_FLAG_WAIT_ALL   = 0x0800,
   TLS_FLAG_BREAK_CHAR = 0x1000,
   TLS_FLAG_BREAK_CRLF = 0x100A,
   TLS_FLAG_WAIT_ACK   = 0x2000
} TlsFlags;


//The TLS_FLAG_BREAK macro causes the read function to stop reading
//data whenever the specified break character is encountered
#define TLS_FLAG_BREAK(c) (TLS_FLAG_BREAK_CHAR | LSB(c))


/**
 * @brief Content type
 **/

typedef enum
{
   TLS_TYPE_CHANGE_CIPHER_SPEC = 20,
   TLS_TYPE_ALERT              = 21,
   TLS_TYPE_HANDSHAKE          = 22,
   TLS_TYPE_APPLICATION_DATA   = 23,
   TLS_TYPE_HEARTBEAT          = 24
} TlsContentType;


/**
 * @brief Handshake message type
 **/

typedef enum
{
   TLS_TYPE_HELLO_REQUEST        = 0,
   TLS_TYPE_CLIENT_HELLO         = 1,
   TLS_TYPE_SERVER_HELLO         = 2,
   TLS_TYPE_HELLO_VERIFY_REQUEST = 3,
   TLS_TYPE_NEW_SESSION_TICKET   = 4,
   TLS_TYPE_CERTIFICATE          = 11,
   TLS_TYPE_SERVER_KEY_EXCHANGE  = 12,
   TLS_TYPE_CERTIFICATE_REQUEST  = 13,
   TLS_TYPE_SERVER_HELLO_DONE    = 14,
   TLS_TYPE_CERTIFICATE_VERIFY   = 15,
   TLS_TYPE_CLIENT_KEY_EXCHANGE  = 16,
   TLS_TYPE_FINISHED             = 20,
   TLS_TYPE_CERTIFICATE_URL      = 21,
   TLS_TYPE_CERTIFICATE_STATUS   = 22,
   TLS_TYPE_SUPPLEMENTAL_DATA    = 23
} TlsMessageType;


/**
 * @brief Alert level
 **/

typedef enum
{
   TLS_ALERT_LEVEL_WARNING = 1,
   TLS_ALERT_LEVEL_FATAL   = 2,
} TlsAlertLevel;


/**
 * @brief Alert description
 **/

typedef enum
{
   TLS_ALERT_CLOSE_NOTIFY                    = 0,
   TLS_ALERT_UNEXPECTED_MESSAGE              = 10,
   TLS_ALERT_BAD_RECORD_MAC                  = 20,
   TLS_ALERT_DECRYPTION_FAILED               = 21,
   TLS_ALERT_RECORD_OVERFLOW                 = 22,
   TLS_ALERT_DECOMPRESSION_FAILURE           = 30,
   TLS_ALERT_HANDSHAKE_FAILURE               = 40,
   TLS_ALERT_NO_CERTIFICATE                  = 41,
   TLS_ALERT_BAD_CERTIFICATE                 = 42,
   TLS_ALERT_UNSUPPORTED_CERTIFICATE         = 43,
   TLS_ALERT_CERTIFICATE_REVOKED             = 44,
   TLS_ALERT_CERTIFICATE_EXPIRED             = 45,
   TLS_ALERT_CERTIFICATE_UNKNOWN             = 46,
   TLS_ALERT_ILLEGAL_PARAMETER               = 47,
   TLS_ALERT_UNKNOWN_CA                      = 48,
   TLS_ALERT_ACCESS_DENIED                   = 49,
   TLS_ALERT_DECODE_ERROR                    = 50,
   TLS_ALERT_DECRYPT_ERROR                   = 51,
   TLS_ALERT_EXPORT_RESTRICTION              = 60,
   TLS_ALERT_PROTOCOL_VERSION                = 70,
   TLS_ALERT_INSUFFICIENT_SECURITY           = 71,
   TLS_ALERT_INTERNAL_ERROR                  = 80,
   TLS_ALERT_USER_CANCELED                   = 90,
   TLS_ALERT_NO_RENEGOTIATION                = 100,
   TLS_ALERT_UNSUPPORTED_EXTENSION           = 110,
   TLS_ALERT_CERTIFICATE_UNOBTAINABLE        = 111,
   TLS_ALERT_UNRECOGNIZED_NAME               = 112,
   TLS_ALERT_BAD_CERTIFICATE_STATUS_RESPONSE = 113,
   TLS_ALERT_BAD_CERTIFICATE_HASH_VALUE      = 114,
   TLS_ALERT_UNKNOWN_PSK_IDENTITY            = 115
} TlsAlertDescription;


/**
 * @brief Compression methods
 **/

typedef enum
{
   TLS_COMPRESSION_METHOD_NULL    = 0,
   TLS_COMPRESSION_METHOD_DEFLATE = 1
} TlsCompressionMethodList;


/**
 * @brief Key exchange methods
 **/

typedef enum
{
   TLS_KEY_EXCH_NONE        = 0,
   TLS_KEY_EXCH_RSA         = 1,
   TLS_KEY_EXCH_DH_RSA      = 2,
   TLS_KEY_EXCH_DHE_RSA     = 3,
   TLS_KEY_EXCH_DH_DSS      = 4,
   TLS_KEY_EXCH_DHE_DSS     = 5,
   TLS_KEY_EXCH_DH_ANON     = 6,
   TLS_KEY_EXCH_ECDH_RSA    = 7,
   TLS_KEY_EXCH_ECDHE_RSA   = 8,
   TLS_KEY_EXCH_ECDH_ECDSA  = 9,
   TLS_KEY_EXCH_ECDHE_ECDSA = 10,
   TLS_KEY_EXCH_ECDH_ANON   = 11,
   TLS_KEY_EXCH_PSK         = 12,
   TLS_KEY_EXCH_RSA_PSK     = 13,
   TLS_KEY_EXCH_DHE_PSK     = 14,
   TLS_KEY_EXCH_ECDHE_PSK   = 15
} TlsKeyExchMethod;


/**
 * @brief Certificate types
 **/

typedef enum
{
   TLS_CERT_NONE             = 0,
   TLS_CERT_RSA_SIGN         = 1,
   TLS_CERT_DSS_SIGN         = 2,
   TLS_CERT_RSA_FIXED_DH     = 3,
   TLS_CERT_DSS_FIXED_DH     = 4,
   TLS_CERT_RSA_EPHEMERAL_DH = 5,
   TLS_CERT_DSS_EPHEMERAL_DH = 6,
   TLS_CERT_FORTEZZA_DMS     = 20,
   TLS_CERT_ECDSA_SIGN       = 64,
   TLS_CERT_RSA_FIXED_ECDH   = 65,
   TLS_CERT_ECDSA_FIXED_ECDH = 66
} TlsCertificateType;


/**
 * @brief Hash algorithms
 **/

typedef enum
{
   TLS_HASH_ALGO_NONE   = 0,
   TLS_HASH_ALGO_MD5    = 1,
   TLS_HASH_ALGO_SHA1   = 2,
   TLS_HASH_ALGO_SHA224 = 3,
   TLS_HASH_ALGO_SHA256 = 4,
   TLS_HASH_ALGO_SHA384 = 5,
   TLS_HASH_ALGO_SHA512 = 6
} TlsHashAlgo;


/**
 * @brief Signature algorithms
 **/

typedef enum
{
   TLS_SIGN_ALGO_ANONYMOUS = 0,
   TLS_SIGN_ALGO_RSA       = 1,
   TLS_SIGN_ALGO_DSA       = 2,
   TLS_SIGN_ALGO_ECDSA     = 3
} TlsSignatureAlgo;


/**
 * @brief TLS extension types
 **/

typedef enum
{
   TLS_EXT_SERVER_NAME            = 0,
   TLS_EXT_MAX_FRAGMENT_LENGTH    = 1,
   TLS_EXT_CLIENT_CERTIFICATE_URL = 2,
   TLS_EXT_TRUSTED_CA_KEYS        = 3,
   TLS_EXT_TRUNCATED_HMAC         = 4,
   TLS_EXT_STATUS_REQUEST         = 5,
   TLS_EXT_USER_MAPPING           = 6,
   TLS_EXT_CLIENT_AUTHZ           = 7,
   TLS_EXT_SERVER_AUTHZ           = 8,
   TLS_EXT_CERT_TYPE              = 9,
   TLS_EXT_ELLIPTIC_CURVES        = 10,
   TLS_EXT_EC_POINT_FORMATS       = 11,
   TLS_EXT_SRP                    = 12,
   TLS_EXT_SIGNATURE_ALGORITHMS   = 13,
   TLS_EXT_USE_SRTP               = 14,
   TLS_EXT_HEARTBEAT              = 15,
   TLS_EXT_SESSION_TICKET         = 35,
   TLS_EXT_RENEGOTIATION_INFO     = 65281
} TlsExtensionType;


/**
 * @brief Name type
 **/

typedef enum
{
   TLS_NAME_TYPE_HOSTNAME = 0
} TlsNameType;


/**
 * @brief EC named curves
 **/

typedef enum
{
   TLS_EC_CURVE_NONE                     = 0,
   TLS_EC_CURVE_SECT163K1                = 1,     //RFC 4492
   TLS_EC_CURVE_SECT163R1                = 2,     //RFC 4492
   TLS_EC_CURVE_SECT163R2                = 3,     //RFC 4492
   TLS_EC_CURVE_SECT193R1                = 4,     //RFC 4492
   TLS_EC_CURVE_SECT193R2                = 5,     //RFC 4492
   TLS_EC_CURVE_SECT233K1                = 6,     //RFC 4492
   TLS_EC_CURVE_SECT233R1                = 7,     //RFC 4492
   TLS_EC_CURVE_SECT239K1                = 8,     //RFC 4492
   TLS_EC_CURVE_SECT283K1                = 9,     //RFC 4492
   TLS_EC_CURVE_SECT283R1                = 10,    //RFC 4492
   TLS_EC_CURVE_SECT409K1                = 11,    //RFC 4492
   TLS_EC_CURVE_SECT409R1                = 12,    //RFC 4492
   TLS_EC_CURVE_SECT571K1                = 13,    //RFC 4492
   TLS_EC_CURVE_SECT571R1                = 14,    //RFC 4492
   TLS_EC_CURVE_SECP160K1                = 15,    //RFC 4492
   TLS_EC_CURVE_SECP160R1                = 16,    //RFC 4492
   TLS_EC_CURVE_SECP160R2                = 17,    //RFC 4492
   TLS_EC_CURVE_SECP192K1                = 18,    //RFC 4492
   TLS_EC_CURVE_SECP192R1                = 19,    //RFC 4492
   TLS_EC_CURVE_SECP224K1                = 20,    //RFC 4492
   TLS_EC_CURVE_SECP224R1                = 21,    //RFC 4492
   TLS_EC_CURVE_SECP256K1                = 22,    //RFC 4492
   TLS_EC_CURVE_SECP256R1                = 23,    //RFC 4492
   TLS_EC_CURVE_SECP384R1                = 24,    //RFC 4492
   TLS_EC_CURVE_SECP521R1                = 25,    //RFC 4492
   TLS_EC_CURVE_BRAINPOOLP256R1          = 26,    //RFC 7027
   TLS_EC_CURVE_BRAINPOOLP384R1          = 27,    //RFC 7027
   TLS_EC_CURVE_BRAINPOOLP512R1          = 28,    //RFC 7027
   TLS_EC_CURVE_ARBITRARY_EXPLICIT_PRIME = 65281, //RFC 4492
   TLS_EC_CURVE_ARBITRARY_EXPLICIT_CHAR2 = 65282  //RFC 4492
} TlsEcNamedCurve;


/**
 * @brief EC point formats
 **/

typedef enum
{
   TLS_EC_POINT_FORMAT_UNCOMPRESSED              = 0,
   TLS_EC_POINT_FORMAT_ANSIX962_COMPRESSED_PRIME = 1,
   TLS_EC_POINT_FORMAT_ANSIX962_COMPRESSED_CHAR2 = 2
} TlsEcPointFormat;


/**
 * @brief EC curve types
 **/

typedef enum
{
   TLS_EC_CURVE_TYPE_EXPLICIT_PRIME = 1,
   TLS_EC_CURVE_TYPE_EXPLICIT_CHAR2 = 2,
   TLS_EC_CURVE_TYPE_NAMED_CURVE    = 3
} TlsEcCurveType;


/**
 * @brief TLS FSM states
 **/

typedef enum
{
   TLS_STATE_INIT                      = 0,
   TLS_STATE_CLIENT_HELLO              = 1,
   TLS_STATE_SERVER_HELLO              = 2,
   TLS_STATE_SERVER_CERTIFICATE        = 3,
   TLS_STATE_SERVER_KEY_EXCHANGE       = 4,
   TLS_STATE_CERTIFICATE_REQUEST       = 5,
   TLS_STATE_SERVER_HELLO_DONE         = 6,
   TLS_STATE_CLIENT_CERTIFICATE        = 7,
   TLS_STATE_CLIENT_KEY_EXCHANGE       = 8,
   TLS_STATE_CERTIFICATE_VERIFY        = 9,
   TLS_STATE_CLIENT_CHANGE_CIPHER_SPEC = 10,
   TLS_STATE_CLIENT_FINISHED           = 11,
   TLS_STATE_SERVER_CHANGE_CIPHER_SPEC = 12,
   TLS_STATE_SERVER_FINISHED           = 13,
   TLS_STATE_APPLICATION_DATA          = 14,
   TLS_STATE_CLOSED                    = 15,
   TLS_STATE_FATAL_ERROR               = 16
} TlsState;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief Random structure
 **/

typedef __packed struct
{
   uint32_t gmtUnixTime;    //0-3
   uint8_t randomBytes[28]; //4-31
} TlsRandom;


/**
 * @brief Session identifier
 **/

typedef __packed struct
{
   uint8_t length;  //0
   uint8_t value[]; //1
} TlsSessionId;


/**
 * @brief Cipher suite
 **/

typedef uint16_t TlsCipherSuite;


/**
 * @brief Cipher suites
 **/

typedef __packed struct
{
   uint16_t length;  //0-1
   uint16_t value[]; //2
} TlsCipherSuites;


/**
 * @brief Compression method
 **/

typedef uint8_t TlsCompressionMethod;


/**
 * @brief Compression methods
 **/

typedef __packed struct
{
   uint8_t length;  //0
   uint8_t value[]; //1
} TlsCompressionMethods;


/**
 * @brief List of certificate types
 **/

typedef __packed struct
{
   uint8_t length;  //0
   uint8_t value[]; //1
} TlsCertificateTypes;


/**
 * @brief Signature algorithm
 **/

typedef __packed struct
{
   uint8_t hash;      //0
   uint8_t signature; //1
} TlsSignHashAlgo;


/**
 * @brief List of signature algorithms
 **/

typedef __packed struct
{
   uint16_t length;         //0-1
   TlsSignHashAlgo value[]; //2
} TlsSignHashAlgos;


/**
 * @brief List of certificate authorities
 **/

typedef __packed struct
{
   uint16_t length; //0-1
   uint8_t value[]; //2
} TlsCertAuthorities;


/**
 * @brief TLS extension
 **/

typedef __packed struct
{
   uint16_t type;   //0-1
   uint16_t length; //2-3
   uint8_t value[]; //4
} TlsExtension;


/**
 * @brief List of TLS extensions
 **/

typedef __packed struct
{
   uint16_t length; //0-1
   uint8_t value[]; //2
} TlsExtensions;


/**
 * @brief Server name
 **/

typedef __packed struct
{
   uint8_t type;      //0
   uint16_t length;   //1-2
   char_t hostname[]; //2
} TlsServerName;


/**
 * @brief List of server names
 **/

typedef __packed struct
{
   uint16_t length; //0-1
   uint8_t value[]; //2
} TlsServerNameList;


/**
 * @brief List of supported elliptic curves
 **/

typedef __packed struct
{
   uint16_t length;  //0-1
   uint16_t value[]; //2
} TlsEllipticCurveList;


/**
 * @brief List of supported EC point formats
 **/

typedef __packed struct
{
   uint8_t length;  //0
   uint8_t value[]; //1
} TlsEcPointFormatList;


/**
 * @brief Digitally-signed element (SSL 3.0, TLS 1.0 and TLS 1.1)
 **/

typedef __packed struct
{
   uint16_t length; //0-1
   uint8_t value[]; //2
} TlsDigitalSignature;


/**
 * @brief Digitally-signed element (TLS 1.2)
 **/

typedef __packed struct
{
   TlsSignHashAlgo algorithm; //0-1
   uint16_t length;           //2-3
   uint8_t value[];           //4
} TlsDigitalSignature2;


/**
 * @brief General format of TLS records
 **/

typedef __packed struct
{
   uint8_t type;     //0
   uint16_t version; //1-2
   uint16_t length;  //3-4
   uint8_t data[];   //5
} TlsRecord;


/**
 * @brief Handshake message
 **/

typedef __packed struct
{
   uint8_t msgType;   //0
   uint8_t length[3]; //1-3
   uint8_t data[];    //4
} TlsHandshake;


/**
 * @brief ClientHello message
 **/

typedef __packed struct
{
   uint8_t msgType;        //0
   uint8_t length[3];      //1-3
   uint16_t clientVersion; //4-5
   TlsRandom random;       //6-37
   TlsSessionId sessionId; //38
} TlsClientHello;


/**
 * @brief ServerHello message
 **/

typedef __packed struct
{
   uint8_t msgType;        //0
   uint8_t length[3];      //1-3
   uint16_t serverVersion; //4-5
   TlsRandom random;       //6-37
   TlsSessionId sessionId; //38
} TlsServerHello;


/**
 * @brief Certificate message
 **/

typedef __packed struct
{
   uint8_t msgType;                  //0
   uint8_t length[3];                //1-3
   uint8_t certificateListLength[3]; //4-6
   uint8_t certificateList[];        //7
} TlsCertificate;


/**
 * @brief ServerKeyExchange message
 **/

typedef __packed struct
{
   uint8_t msgType;      //0
   uint8_t length[3];    //1-3
   uint8_t params[];     //4
} TlsServerKeyExchange;


/**
 * @brief CertificateRequest message
 **/

typedef __packed struct
{
   uint8_t msgType;                      //0
   uint8_t length[3];                    //1-3
   TlsCertificateTypes certificateTypes; //4
} TlsCertificateRequest;


/**
 * @brief ServerHelloDone message
 **/

typedef __packed struct
{
   uint8_t msgType;   //0
   uint8_t length[3]; //1-3
} TlsServerHelloDone;


/**
 * @brief ClientKeyExchange message
 **/

typedef __packed struct
{
   uint8_t msgType;        //0
   uint8_t length[3];      //1-3
   uint8_t exchangeKeys[]; //4
} TlsClientKeyExchange;


/**
 * @brief CertificateVerify message
 **/

typedef __packed struct
{
   uint8_t msgType;     //0
   uint8_t length[3];   //1-3
   uint8_t signature[]; //4
} TlsCertificateVerify;


/**
 * @brief Finished message
 **/

typedef __packed struct
{
   uint8_t msgType;      //0
   uint8_t length[3];    //1-3
   uint8_t verifyData[]; //4
} TlsFinished;


/**
 * @brief ChangeCipherSpec message
 **/

typedef __packed struct
{
   uint8_t type; //0
} TlsChangeCipherSpec;


/**
 * @brief Alert message
 **/

typedef __packed struct
{
   uint8_t level;       //0
   uint8_t description; //1
} TlsAlert;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief Sequence number
 **/

typedef uint8_t TlsSequenceNumber[8];


/**
 * @brief Structure describing a cipher suite
 **/

typedef struct
{
   uint16_t identifier;
   const char_t *name;
   TlsKeyExchMethod keyExchMethod;
   const CipherAlgo *cipherAlgo;
   CipherMode cipherMode;
   const HashAlgo *hashAlgo;
   const HashAlgo *prfHashAlgo;
   uint8_t macKeyLength;
   uint8_t encKeyLength;
   uint8_t fixedIvLength;
   uint8_t recordIvLength;
   uint8_t authTagLength;
   uint8_t verifyDataLength;
} TlsCipherSuiteInfo;


/**
 * @brief TLS session
 **/

typedef struct
{
   uint8_t id[32];            ///<Session identifier
   size_t idLength;           ///<Length of the session identifier
   systime_t timestamp;       ///<Time stamp to manage entry lifetime
   uint16_t cipherSuite;      ///<Cipher suite identifier
   uint8_t compressionMethod; ///<Compression method
   uint8_t masterSecret[48];  ///<Master secret
} TlsSession;


/**
 * @brief Session cache
 **/

typedef struct
{
   OsMutex *mutex;        ///<Mutex preventing simultaneous access to the cache
   uint_t size;           ///<Maximum number of entries
   TlsSession sessions[]; ///<Cache entries
} TlsCache;


/**
 * @brief Certificate descriptor
 **/

typedef struct
{
   const char_t *certChain;    ///<End entity certificate chain (PEM format)
   size_t certChainLength;     ///<Length of the certificate chain
   const char_t *privateKey;   ///<Private key (PEM format)
   size_t privateKeyLength;    ///<Length of the private key
   TlsCertificateType type;    ///<End entity certificate type
   TlsSignatureAlgo signAlgo;  ///<Signature algorithm used to sign the end entity certificate
   TlsHashAlgo hashAlgo;       ///<Hash algorithm used to sign the end entity certificate
   TlsEcNamedCurve namedCurve; ///<Named curve used to generate the EC public key
} TlsCertDesc;


/**
 * @brief TLS context
 *
 * An opaque data structure that represents a TLS connection
 *
 **/

typedef struct
{
   TlsState state;                          ///<TLS handshake finite state machine
   TlsSocket socket;                        ///<Underlying socket
   TlsConnectionEnd entity;                 ///<This flag tells whether this entity is considered a client or a server

   const PrngAlgo *prngAlgo;                ///<Pseudo-random number generator to be used
   void *prngContext;                       ///<Pseudo-random number generator context

   const uint16_t *cipherSuites;            ///<List of supported cipher suites
   uint_t numCipherSuites;                  ///<Number of cipher suites in the list

   char_t *serverName;                      ///<Fully qualified DNS hostname of the server

   DhContext dhContext;                     ///<Diffie-Hellman context
   EcdhContext ecdhContext;                 ///<ECDH context

   TlsCertDesc certs[TLS_MAX_CERTIFICATES]; //End entity certificates
   uint_t numCerts;                         //Number of certificates available
   TlsCertDesc *cert;                       //Pointer to the currently selected certificate

   const char_t *trustedCaList;             ///<List of trusted CA (PEM format)
   size_t trustedCaListLength;              ///<Number of trusted CA in the list

   TlsCertificateType peerCertType;         ///<Peer's certificate type
   RsaPublicKey peerRsaPublicKey;           ///<Peer's RSA public key
   DsaPublicKey peerDsaPublicKey;           ///<Peer's DSA public key
   EcDomainParameters peerEcParams;         ///<Peer's EC domain parameters
   EcPoint peerEcPublicKey;                 ///<Peer's EC public key

   TlsCache *cache;                         ///<TLS session cache

   uint8_t sessionId[32];                   ///<Session identifier
   size_t sessionIdLength;                  ///<Length of the session identifier

   bool_t resume;                           ///<This flag tells whether the connection is established by resuming a session
   uint16_t clientVersion;                  ///<Latest version supported by the client
   uint16_t version;                        ///<Negotiated TLS version
   uint16_t cipherSuite;                    ///<Negotiated cipher suite
   uint8_t compressionMethod;               ///<Negotiated compression algorithm
   uint16_t namedCurve;                     ///<Named curve

   TlsHashAlgo signHashAlgo;                ///<Hash algorithm used for signing
   TlsKeyExchMethod keyExchMethod;          ///<Key exchange method
   const CipherAlgo *cipherAlgo;            ///<Bulk cipher algorithm
   CipherMode cipherMode;                   ///<Cipher mode of operation
   const HashAlgo *hashAlgo;                ///<Hash algorithm for MAC operations
   const HashAlgo *prfHashAlgo;             ///<Hash algorithm for PRF operations
   size_t macKeyLength;                     ///<Number of bytes that are used for generating MAC keys
   size_t encKeyLength;                     ///<Number of bytes that are used for generating encryption keys
   size_t fixedIvLength;                    ///<Amount of data needed to be generated for the IV
   size_t recordIvLength;                   ///<Length of the IV
   size_t authTagLength;                    ///<Length of the authentication tag
   size_t verifyDataLength;                 ///<Length of the verify data

   Md5Context *handshakeMd5Context;         ///<MD5 context used to compute verify data
   Sha1Context *handshakeSha1Context;       ///<SHA-1 context used to compute verify data
   HashContext *handshakeHashContext;       ///<Hash context used to compute verify data (TLS 1.2)
   uint8_t verifyData[64];                  ///<Verify data

   bool_t ecPointFormatExtFound;            ///<The EcPointFormats extension has been received

   TlsClientAuthMode clientAuthMode;        ///<Client authentication mode
   bool_t clientCertRequested;              ///<This flag tells whether the client certificate is requested

   bool_t changeCipherSpecSent;             ///<A ChangeCipherSpec message has been sent
   bool_t changeCipherSpecReceived;         ///<A ChangeCipherSpec message has been received from the peer

   void *writeCipherContext;                ///<Bulk cipher context for write operations
   void *readCipherContext;                 ///<Bulk cipher context for read operations
   HmacContext hmacContext;                 ///<HMAC context

   uint8_t *txBuffer;                       ///<TX buffer
   TlsContentType txBufferType;             ///<Type of data that resides in the TX buffer
   size_t txBufferLength;                   ///<Number of bytes that are pending to be sent

   uint8_t *rxBuffer;                       ///<RX buffer
   TlsContentType rxBufferType;             ///<Type of data that resides in the RX buffer
   size_t rxBufferLength;                   ///<Number of bytes available for reading
   size_t rxBufferWriteIndex;               ///<Current write index
   size_t rxBufferReadIndex;                ///<Current read index

   union
   {
      struct
      {
         TlsRandom clientRandom;            ///<Client random value
         TlsRandom serverRandom;            ///<Server random value
      };
      uint8_t random[64];
   };

   uint8_t premasterSecret[256];            ///<Premaster secret
   size_t premasterSecretLength;            ///<Length of the premaster secret
   uint8_t masterSecret[48];                ///<Master secret
   uint8_t keyBlock[192];                   ///<Key material
   uint8_t *writeMacKey;                    ///<Write MAC key
   uint8_t *readMacKey;                     ///<Read MAC key
   uint8_t *writeEncKey;                    ///<Encryption key that serves for write operations
   uint8_t *readEncKey;                     ///<Encryption key that serves for read operations
   uint8_t *writeIv;                        ///<Write IV
   uint8_t *readIv;                         ///<Read IV

   TlsSequenceNumber writeSeqNum;           ///<Write sequence number
   TlsSequenceNumber readSeqNum;            ///<Read sequence number
} TlsContext;


//TLS application programming interface (API)
TlsContext *tlsInit(void);

error_t tlsSetSocket(TlsContext *context, TlsSocket socket);
error_t tlsSetConnectionEnd(TlsContext *context, TlsConnectionEnd entity);
error_t tlsSetPrng(TlsContext *context, const PrngAlgo *prngAlgo, void *prngContext);
error_t tlsSetServerName(TlsContext *context, const char_t *serverName);
error_t tlsSetCache(TlsContext *context, TlsCache *cache);
error_t tlsSetClientAuthMode(TlsContext *context, TlsClientAuthMode mode);
error_t tlsSetCipherSuites(TlsContext *context, const uint16_t *cipherSuites, uint_t length);
error_t tlsSetDhParameters(TlsContext *context, const char_t *params, size_t length);
error_t tlsSetTrustedCaList(TlsContext *context, const char_t *trustedCaList, size_t length);

error_t tlsAddCertificate(TlsContext *context, const char_t *certChain,
   size_t certChainLength, const char_t *privateKey, size_t privateKeyLength);

error_t tlsConnect(TlsContext *context);
error_t tlsWrite(TlsContext *context, const void *data, size_t length, uint_t flags);
error_t tlsRead(TlsContext *context, void *data, size_t size, size_t *received, uint_t flags);
error_t tlsShutdown(TlsContext *context);
void tlsFree(TlsContext *context);

error_t tlsSaveSession(const TlsContext *context, TlsSession *session);
error_t tlsRestoreSession(TlsContext *context, const TlsSession *session);

TlsCache *tlsInitCache(uint_t size);
void tlsFreeCache(TlsCache *cache);

#endif
