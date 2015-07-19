/**
 * @file tcp.h
 * @brief TCP (Transmission Control Protocol)
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

#ifndef _TCP_H
#define _TCP_H

//Dependencies
#include "tcp_ip_stack_config.h"
#include "ip.h"

//TCP support
#ifndef TCP_SUPPORT
   #define TCP_SUPPORT ENABLED
#elif (TCP_SUPPORT != ENABLED && TCP_SUPPORT != DISABLED)
   #error TCP_SUPPORT parameter is not valid
#endif

//TCP tick interval
#ifndef TCP_TICK_INTERVAL
   #define TCP_TICK_INTERVAL 100
#elif (TCP_TICK_INTERVAL < 100)
   #error TCP_TICK_INTERVAL parameter is not valid
#endif

//Maximum segment size
#ifndef TCP_MAX_MSS
   #define TCP_MAX_MSS 1430
#elif (TCP_MAX_MSS < 536)
   #error TCP_MAX_MSS parameter is not valid
#endif

//Mimimum acceptable segment size
#ifndef TCP_MIN_MSS
   #define TCP_MIN_MSS 128
#elif (TCP_MIN_MSS < 1)
   #error TCP_MIN_MSS parameter is not valid
#endif

//Default buffer size for transmission
#ifndef TCP_DEFAULT_TX_BUFFER_SIZE
   #define TCP_DEFAULT_TX_BUFFER_SIZE 2860
#elif (TCP_DEFAULT_TX_BUFFER_SIZE < 1)
   #error TCP_DEFAULT_TX_BUFFER_SIZE parameter is not valid
#endif

//Maximum acceptable size for the send buffer
#ifndef TCP_MAX_TX_BUFFER_SIZE
   #define TCP_MAX_TX_BUFFER_SIZE 11440
#elif (TCP_MAX_TX_BUFFER_SIZE < 1)
   #error TCP_MAX_TX_BUFFER_SIZE parameter is not valid
#endif

//Default buffer size for reception
#ifndef TCP_DEFAULT_RX_BUFFER_SIZE
   #define TCP_DEFAULT_RX_BUFFER_SIZE 2860
#elif (TCP_DEFAULT_RX_BUFFER_SIZE < 1)
   #error TCP_DEFAULT_RX_BUFFER_SIZE parameter is not valid
#endif

//Maximum acceptable size for the receive buffer
#ifndef TCP_MAX_RX_BUFFER_SIZE
   #define TCP_MAX_RX_BUFFER_SIZE 11440
#elif (TCP_MAX_RX_BUFFER_SIZE < 1)
   #error TCP_MAX_RX_BUFFER_SIZE parameter is not valid
#endif

//SYN queue size for listening sockets
#ifndef TCP_SYN_QUEUE_SIZE
   #define TCP_SYN_QUEUE_SIZE 4
#elif (TCP_SYN_QUEUE_SIZE < 1)
   #error TCP_SYN_QUEUE_SIZE parameter is not valid
#endif

//Maximum number of retransmissions
#ifndef TCP_MAX_RETRIES
   #define TCP_MAX_RETRIES 5
#elif (TCP_MAX_RETRIES < 1)
   #error TCP_MAX_RETRIES parameter is not valid
#endif

//Initial retransmission timeout
#ifndef TCP_INITIAL_RTO
   #define TCP_INITIAL_RTO 1000
#elif (TCP_INITIAL_RTO < 100)
   #error TCP_INITIAL_RTO parameter is not valid
#endif

//Minimum retransmission timeout
#ifndef TCP_MIN_RTO
   #define TCP_MIN_RTO 1000
#elif (TCP_MIN_RTO < 100)
   #error TCP_MIN_RTO parameter is not valid
#endif

//Maximum retransmission timeout
#ifndef TCP_MAX_RTO
   #define TCP_MAX_RTO 60000
#elif (TCP_MAX_RTO < 1000)
   #error TCP_MAX_RTO parameter is not valid
#endif

//Number of duplicate ACKs that triggers fast retransmit algorithm
#ifndef TCP_FAST_RETRANSMIT_THRES
   #define TCP_FAST_RETRANSMIT_THRES 3
#elif (TCP_FAST_RETRANSMIT_THRES < 1)
   #error TCP_FAST_RETRANSMIT_THRES parameter is not valid
#endif

//Size of the congestion window after the three-way handshake is completed
#ifndef TCP_INITIAL_WINDOW
   #define TCP_INITIAL_WINDOW 3
#elif (TCP_INITIAL_WINDOW < 1)
   #error TCP_INITIAL_WINDOW parameter is not valid
#endif

//Size of the congestion window after TCP detects loss using its retransmission timer
#ifndef TCP_LOSS_WINDOW
   #define TCP_LOSS_WINDOW 1
#elif (TCP_LOSS_WINDOW < 1)
   #error TCP_LOSS_WINDOW parameter is not valid
#endif

//Default interval between successive window probes
#ifndef TCP_DEFAULT_PROBE_INTERVAL
   #define TCP_DEFAULT_PROBE_INTERVAL 1000
#elif (TCP_DEFAULT_PROBE_INTERVAL < 100)
   #error TCP_DEFAULT_PROBE_INTERVAL parameter is not valid
#endif

//Maximum interval between successive window probes
#ifndef TCP_MAX_PROBE_INTERVAL
   #define TCP_MAX_PROBE_INTERVAL 60000
#elif (TCP_MAX_PROBE_INTERVAL < 1000)
   #error TCP_MAX_PROBE_INTERVAL parameter is not valid
#endif

//Override timeout (should be in the range 0.1 to 1 seconds)
#ifndef TCP_OVERRIDE_TIMEOUT
   #define TCP_OVERRIDE_TIMEOUT 500
#elif (TCP_OVERRIDE_TIMEOUT < 100)
   #error TCP_OVERRIDE_TIMEOUT parameter is not valid
#endif

//FIN-WAIT-2 timer
#ifndef TCP_FIN_WAIT_2_TIMER
   #define TCP_FIN_WAIT_2_TIMER 4000
#elif (TCP_FIN_WAIT_2_TIMER < 1000)
   #error TCP_FIN_WAIT_2_TIMER parameter is not valid
#endif

//TIME-WAIT timer
#ifndef TCP_2MSL_TIMER
   #define TCP_2MSL_TIMER 4000
#elif (TCP_2MSL_TIMER < 1000)
   #error TCP_2MSL_TIMER parameter is not valid
#endif

//Selective acknowledgment support
#ifndef TCP_SACK_SUPPORT
   #define TCP_SACK_SUPPORT DISABLED
#elif (TCP_SACK_SUPPORT != ENABLED && TCP_SACK_SUPPORT != DISABLED)
   #error TCP_SACK_SUPPORT parameter is not valid
#endif

//Number of SACK blocks
#ifndef TCP_MAX_SACK_BLOCKS
   #define TCP_MAX_SACK_BLOCKS 4
#elif (TCP_MAX_SACK_BLOCKS < 1)
   #error TCP_MAX_SACK_BLOCKS parameter is not valid
#endif

//Maximum TCP header length
#define TCP_MAX_HEADER_LENGTH 60
//Default maximum segment size
#define TCP_DEFAULT_MSS 536

//Sequence number comparison macro
#define TCP_CMP_SEQ(a, b) ((int32_t) ((a) - (b)))


/**
 * @brief TCP FSM states
 **/

typedef enum
{
   TCP_STATE_CLOSED       = 0,
   TCP_STATE_LISTEN       = 1,
   TCP_STATE_SYN_SENT     = 2,
   TCP_STATE_SYN_RECEIVED = 3,
   TCP_STATE_ESTABLISHED  = 4,
   TCP_STATE_CLOSE_WAIT   = 5,
   TCP_STATE_LAST_ACK     = 6,
   TCP_STATE_FIN_WAIT_1   = 7,
   TCP_STATE_FIN_WAIT_2   = 8,
   TCP_STATE_CLOSING      = 9,
   TCP_STATE_TIME_WAIT    = 10
} TcpState;


/**
 * @brief TCP control flags
 **/

typedef enum
{
   TCP_FLAG_FIN = 0x01,
   TCP_FLAG_SYN = 0x02,
   TCP_FLAG_RST = 0x04,
   TCP_FLAG_PSH = 0x08,
   TCP_FLAG_ACK = 0x10,
   TCP_FLAG_URG = 0x20
} TcpFlags;


/**
 * @brief TCP option types
 **/

typedef enum
{
   TCP_OPTION_END                 = 0,
   TCP_OPTION_NOP                 = 1,
   TCP_OPTION_MAX_SEGMENT_SIZE    = 2,
   TCP_OPTION_WINDOW_SCALE_FACTOR = 3,
   TCP_OPTION_SACK_PERMITTED      = 4,
   TCP_OPTION_SACK                = 5,
   TCP_OPTION_TIMESTAMP           = 8
} TcpOptionKind;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief TCP header
 **/

typedef __packed struct
{
   uint16_t srcPort;       //0-1
   uint16_t destPort;      //2-3
   uint32_t seqNum;        //4-7
   uint32_t ackNum;        //8-11
   uint8_t reserved1 : 4;  //12
   uint8_t dataOffset : 4;
   uint8_t flags : 6;      //13
   uint8_t reserved2 : 2;
   uint16_t window;        //14-15
   uint16_t checksum;      //16-17
   uint16_t urgentPointer; //18-19
   uint8_t options[];      //20
} TcpHeader;


/**
 * @brief TCP option
 **/

typedef __packed struct
{
   uint8_t kind;
   uint8_t length;
   uint8_t value[];
} TcpOption;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


/**
 * @brief Retransmission queue item
 **/

typedef struct _TcpQueueItem
{
   struct _TcpQueueItem *next;
   uint_t length;
   uint_t sacked;
   uint8_t timeToLive;
   IpPseudoHeader pseudoHeader;
   uint8_t header[TCP_MAX_HEADER_LENGTH];
} TcpQueueItem;


/**
 * @brief SYN queue item
 **/

typedef struct _TcpSynQueueItem
{
   struct _TcpSynQueueItem *next;
   NetInterface *interface;
   IpAddr srcAddr;
   uint16_t srcPort;
   IpAddr destAddr;
   uint32_t isn;
   uint16_t mss;
} TcpSynQueueItem;


/**
 * @brief SACK block
 **/

typedef struct
{
   uint32_t leftEdge;
   uint32_t rightEdge;
} TcpSackBlock;


/**
 * @brief Transmit buffer
 **/

typedef struct
{
   uint_t chunkCount;
   uint_t maxChunkCount;
   ChunkDesc chunk[N(TCP_MAX_TX_BUFFER_SIZE)];
} TcpTxBuffer;


/**
 * @brief Receive buffer
 **/

typedef struct
{
   uint_t chunkCount;
   uint_t maxChunkCount;
   ChunkDesc chunk[N(TCP_MAX_RX_BUFFER_SIZE)];
} TcpRxBuffer;


//TCP related functions
error_t tcpConnect(Socket *socket);
error_t tcpListen(Socket *socket);
Socket *tcpAccept(Socket *socket, IpAddr *clientIpAddr, uint16_t *clientPort);

error_t tcpSend(Socket *socket, const uint8_t *data,
   size_t length, size_t *written, uint_t flags);

error_t tcpReceive(Socket *socket, uint8_t *data,
   size_t size, size_t *received, uint_t flags);

error_t tcpShutdown(Socket *socket, uint_t how);
error_t tcpAbort(Socket *socket);
TcpState tcpGetState(Socket *socket);

#endif
