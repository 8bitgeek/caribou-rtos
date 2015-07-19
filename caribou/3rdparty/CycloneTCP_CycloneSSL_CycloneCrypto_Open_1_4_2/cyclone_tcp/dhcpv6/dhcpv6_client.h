/**
 * @file dhcpv6_client.h
 * @brief DHCPv6 client (Dynamic Host Configuration Protocol for IPv6)
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

#ifndef _DHCPV6_CLIENT_H
#define _DHCPV6_CLIENT_H

//Dependencies
#include "dhcpv6_common.h"
#include "socket.h"

//Stack size required to run the DHCPv6 client
#ifndef DHCPV6_CLIENT_STACK_SIZE
   #define DHCPV6_CLIENT_STACK_SIZE 500
#elif (DHCPV6_CLIENT_STACK_SIZE < 1)
   #error DHCPV6_CLIENT_STACK_SIZE parameter is not valid
#endif

//Priority at which the DHCPv6 client should run
#ifndef DHCPV6_CLIENT_PRIORITY
   #define DHCPV6_CLIENT_PRIORITY 1
#elif (DHCPV6_CLIENT_PRIORITY < 0)
   #error DHCPV6_CLIENT_PRIORITY parameter is not valid
#endif

//Retransmission parameters
#define DHCPV6_SOL_MAX_DELAY 1000
#define DHCPV6_SOL_TIMEOUT   1000
#define DHCPV6_SOL_MAX_RT    10000 //120000 in RFC 3315
#define DHCPV6_REQ_TIMEOUT   1000
#define DHCPV6_REQ_MAX_RT    10000 //30000 in RFC 3315
#define DHCPV6_REQ_MAX_RC    10
#define DHCPV6_CNF_MAX_DELAY 1000
#define DHCPV6_CNF_TIMEOUT   1000
#define DHCPV6_CNF_MAX_RT    4000
#define DHCPV6_CNF_MAX_RD    10000
#define DHCPV6_REN_TIMEOUT   1000  //10000 in RFC 3315
#define DHCPV6_REN_MAX_RT    10000 //600000 in RFC 3315
#define DHCPV6_REB_TIMEOUT   1000  //10000 in RFC 3315
#define DHCPV6_REB_MAX_RT    10000 //600000 in RFC 3315
#define DHCPV6_INF_MAX_DELAY 1000
#define DHCPV6_INF_TIMEOUT   1000
#define DHCPV6_INF_MAX_RT    120000
#define DHCPV6_REL_TIMEOUT   1000
#define DHCPV6_REL_MAX_RC    5
#define DHCPV6_DEC_TIMEOUT   1000
#define DHCPV6_DEC_MAX_RC    5
#define DHCPV6_REC_TIMEOUT   2000
#define DHCPV6_REC_MAX_RC    8


/**
 * @brief DHCPv6 client FSM states
 **/

typedef enum
{
   DHCPV6_STATE_SOLICIT = 0,
   DHCPV6_STATE_REQUEST = 1,
   DHCPV6_STATE_CONFIRM = 2,
   DHCPV6_STATE_BOUND   = 3,
   DHCPV6_STATE_RENEW   = 4,
   DHCPV6_STATE_REBIND  = 5,
   DHCPV6_STATE_DECLINE = 6
} Dhcpv6State;


/**
 * @brief DHCPv6 client settings
 **/

typedef struct
{
   NetInterface *interface; ///<Network interface to configure
   bool_t rapidCommit;      ///<Quick configuration using rapid commit
} Dhcpv6ClientSettings;


/**
 * @brief DHCPv6 client context
 **/

typedef struct
{
   NetInterface *interface;                ///<Underlying network interface
   bool_t rapidCommit;                     ///<Quick configuration using rapid commit
   bool_t rapidCommitDone;                 ///<Rapid commit procedure done
   Socket *socket;                         ///<Underlying socket
   Dhcpv6State state;                      ///<Current state
   int_t serverPreference;                 ///<Preference value for the server
   uint32_t transactionId;                 ///<Value to match requests with replies
   systime_t exchangeStartTime;            ///<Time at which the client sent the first message
   uint32_t rc;                            ///<Retransmission count
   uint32_t mrc;                           ///<Maximum retransmission count
   systime_t rt;                           ///<Retransmission timeout
   systime_t irt;                          ///<Initial retransmission timeout
   systime_t mrt;                          ///<Maximum retransmission timeout
   systime_t mrd;                          ///<Maximum retransmission duration
   systime_t leaseStartTime;               ///<Lease start time
   uint32_t t1;                            ///<T1 parameter
   uint32_t t2;                            ///<T2 parameter
   uint32_t preferredLifetime;             ///<Preferred lifetime
   uint32_t validLifetime;                 ///<Valid lifetime
   uint8_t clientId[DHCPV6_MAX_DUID_SIZE]; ///<Client DUID
   size_t clientIdLength;                  ///<Length of the client DUID
   uint8_t serverId[DHCPV6_MAX_DUID_SIZE]; ///<Server DUID
   size_t serverIdLength;                  ///<Length of the server DUID
   bool_t running;                         ///<DHCPv6 client is currently running or not?
   bool_t stopRequest;                     ///<Stop request
   OsEvent *ackEvent;                      ///<Event object use to acknowledge user requests
   OsEvent *event;                         ///<Event object used to poll the socket
   uint8_t buffer[DHCPV6_MAX_MSG_SIZE];    ///<Scratch buffer to store DHCPv6 messages
} Dhcpv6ClientCtx;


//Callback functions for client-initiated message exchanges
typedef error_t (*Dhcpv6FormatCallback)(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);
typedef error_t (*Dhcpv6ParseCallback)(Dhcpv6ClientCtx *context, const Dhcpv6Message *message, size_t length);

//DHCPv6 client specific functions
void dhcpv6ClientGetDefaultSettings(Dhcpv6ClientSettings *settings);
error_t dhcpv6ClientInit(Dhcpv6ClientCtx *context, const Dhcpv6ClientSettings *settings);
error_t dhcpv6ClientStart(Dhcpv6ClientCtx *context);
error_t dhcpv6ClientStop(Dhcpv6ClientCtx *context);

void dhcpv6ClientTask(void *param);

void dhcpv6StateSolicit(Dhcpv6ClientCtx *context);
void dhcpv6StateRequest(Dhcpv6ClientCtx *context);
void dhcpv6StateConfirm(Dhcpv6ClientCtx *context);
void dhcpv6StateBound(Dhcpv6ClientCtx *context);
void dhcpv6StateRenew(Dhcpv6ClientCtx *context);
void dhcpv6StateRebind(Dhcpv6ClientCtx *context);
void dhcpv6StateDecline(Dhcpv6ClientCtx *context);

error_t dhcpv6MessageExchange(Dhcpv6ClientCtx *context,
   Dhcpv6FormatCallback formatRequest, Dhcpv6ParseCallback parseResponse);

error_t dhcpv6WaitForResponse(Dhcpv6ClientCtx *context,
   Dhcpv6ParseCallback parseResponse, systime_t timeout);

error_t dhcpv6FormatSolicit(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);
error_t dhcpv6FormatRequest(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);
error_t dhcpv6FormatConfirm(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);
error_t dhcpv6FormatRenew(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);
error_t dhcpv6FormatRebind(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);
error_t dhcpv6FormatDecline(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length);

error_t dhcpv6ParseAdvertise(Dhcpv6ClientCtx *context, const Dhcpv6Message *message, size_t length);
error_t dhcpv6ParseReply(Dhcpv6ClientCtx *context, const Dhcpv6Message *message, size_t length);

error_t dhcpv6ParseIaNaOption(Dhcpv6ClientCtx *context, const Dhcpv6Option *option);

uint16_t dhcpv6ComputeElapsedTime(Dhcpv6ClientCtx *context);

int32_t dhcpv6Rand(int32_t value);
int32_t dhcpv6RandRange(int32_t min, int32_t max);

void dhcpv6DumpConfig(Dhcpv6ClientCtx *context);

#endif
