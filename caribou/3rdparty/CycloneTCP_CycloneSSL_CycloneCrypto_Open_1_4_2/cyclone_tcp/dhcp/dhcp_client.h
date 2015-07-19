/**
 * @file dhcp_client.h
 * @brief DHCP client (Dynamic Host Configuration Protocol)
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

#ifndef _DHCP_CLIENT_H
#define _DHCP_CLIENT_H

//Dependencies
#include "dhcp_common.h"
#include "socket.h"

//Stack size required to run the DHCP client
#ifndef DHCP_CLIENT_STACK_SIZE
   #define DHCP_CLIENT_STACK_SIZE 500
#elif (DHCP_CLIENT_STACK_SIZE < 1)
   #error DHCP_CLIENT_STACK_SIZE parameter is not valid
#endif

//Priority at which the DHCP client should run
#ifndef DHCP_CLIENT_PRIORITY
   #define DHCP_CLIENT_PRIORITY 1
#elif (DHCP_CLIENT_PRIORITY < 0)
   #error DHCP_CLIENT_PRIORITY parameter is not valid
#endif

//Random delay before sending the first message
#define DHCP_INIT_DELAY 2000
//Initial retransmission timeout (DHCPDISCOVER)
#define DHCP_DISCOVER_INIT_TIMEOUT 4000
//Maximum retransmission timeout (DHCPDISCOVER)
#define DHCP_DISCOVER_MAX_TIMEOUT 16000
//Maximum retransmission count (DHCPREQUEST)
#define DHCP_REQUEST_MAX_RETRIES 4
//Initial retransmission timeout (DHCPREQUEST)
#define DHCP_REQUEST_INIT_TIMEOUT 4000
//Maximum retransmission timeout (DHCPREQUEST)
#define DHCP_REQUEST_MAX_TIMEOUT 64000
//Minimum delay between DHCPREQUEST messages in RENEWING and REBINDING states
#define DHCP_REQUEST_MIN_INTERVAL 60000
//Random factor used to determine the delay between retransmissions
#define DHCP_RAND_FACTOR 1000


/**
 * @brief DHCP client FSM states
 **/

typedef enum
{
   DHCP_STATE_STOP,
   DHCP_STATE_INIT,
   DHCP_STATE_SELECTING,
   DHCP_STATE_REQUESTING,
   DHCP_STATE_INIT_REBOOT,
   DHCP_STATE_REBOOTING,
   DHCP_STATE_BOUND,
   DHCP_STATE_RENEWING,
   DHCP_STATE_REBINDING
} DhcpState;


/**
 * @brief DHCP client settings
 **/

typedef struct
{
   NetInterface *interface; ///<Network interface to configure
   bool_t rapidCommit;      ///<Quick configuration using rapid commit
   bool_t manualDnsConfig;  ///<Force manual DNS configuration
} DhcpClientSettings;


/**
 * @brief DHCP client context
 **/

typedef struct
{
   NetInterface *interface;           ///<Underlying network interface
   bool_t rapidCommit;                ///<Quick configuration using rapid commit
   bool_t manualDnsConfig;            ///<Force manual DNS configuration
   Socket *socket;                    ///<Underlying socket
   OsEvent *event;                    ///<Event object used to poll the socket
   OsEvent *ackEvent;                 ///<Event object use to acknowledge user requests
   bool_t running;                    ///<This flag tells whether the task is running
   bool_t startStop;                  ///<This flag tells whether the DHCP client is started or stopped
   DhcpState state;                   ///<Current state of the FSM
   Ipv4Addr serverIpAddr;             ///<DHCP server IPv4 address
   Ipv4Addr requestedIpAddr;          ///<Requested IPv4 address
   uint32_t transactionId;            ///<Value to match requests with replies
   systime_t configStartTime;         ///<Address acquisition or renewal process start time
   systime_t leaseStartTime;          ///<Lease start time
   uint32_t leaseTime;                ///<Lease time
   uint32_t t1;                       ///<Time at which the client enters the RENEWING state
   uint32_t t2;                       ///<Time at which the client enters the REBINDING state
   uint8_t buffer[DHCP_MSG_MAX_SIZE]; ///<Scratch buffer to store DHCP messages
} DhcpClientCtx;


//Callback function to parse DHCP server responses
typedef error_t (*DhcpParseCallback)(DhcpClientCtx *context, size_t length);

//DHCP related functions
void dhcpClientGetDefaultSettings(DhcpClientSettings *settings);
error_t dhcpClientInit(DhcpClientCtx *context, const DhcpClientSettings *settings);
error_t dhcpClientStart(DhcpClientCtx *context);
error_t dhcpClientStop(DhcpClientCtx *context);

void dhcpClientTask(void *param);

void dhcpStateStop(DhcpClientCtx *context);
void dhcpStateInit(DhcpClientCtx *context);
void dhcpStateSelecting(DhcpClientCtx *context);
void dhcpStateRequesting(DhcpClientCtx *context);
void dhcpStateInitReboot(DhcpClientCtx *context);
void dhcpStateRebooting(DhcpClientCtx *context);
void dhcpStateBound(DhcpClientCtx *context);
void dhcpStateRenewing(DhcpClientCtx *context);
void dhcpStateRebinding(DhcpClientCtx *context);

error_t dhcpWaitForResponse(DhcpClientCtx *context,
   DhcpParseCallback parseResponse, systime_t timeout);

error_t dhcpSendDiscover(DhcpClientCtx *context);
error_t dhcpSendRequest(DhcpClientCtx *context);
error_t dhcpSendDecline(DhcpClientCtx *context);

error_t dhcpParseOffer(DhcpClientCtx *context, size_t length);
error_t dhcpParseAckNak(DhcpClientCtx *context, size_t length);

uint16_t dhcpComputeElapsedTime(DhcpClientCtx *context);

int32_t dhcpRandRange(int32_t min, int32_t max);

void dhcpDumpConfig(DhcpClientCtx *context);

#endif
