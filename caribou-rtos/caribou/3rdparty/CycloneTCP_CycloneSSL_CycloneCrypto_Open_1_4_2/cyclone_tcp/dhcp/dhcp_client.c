/**
 * @file dhcp_client.c
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
 * @section Description
 *
 * The Dynamic Host Configuration Protocol is used to provide configuration
 * parameters to hosts. Refer to the following RFCs for complete details:
 * - RFC 2131: Dynamic Host Configuration Protocol
 * - RFC 2132: DHCP Options and BOOTP Vendor Extensions
 * - RFC 4039: Rapid Commit Option for the DHCP version 4
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL DHCP_TRACE_LEVEL

//Dependencies
#include "tcp_ip_stack.h"
#include "dhcp_client.h"
#include "dhcp_common.h"
#include "dhcp_debug.h"
#include "date_time.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV4_SUPPORT == ENABLED)


/**
 * @brief Initialize settings with default values
 * @param[out] settings Structure that contains DHCP client settings
 **/

void dhcpClientGetDefaultSettings(DhcpClientSettings *settings)
{
   //Use default interface
   settings->interface = NULL;
   //No rapid commit
   settings->rapidCommit = FALSE;
   //Use the DNS servers provided by the DHCP server
   settings->manualDnsConfig = FALSE;
}


/**
 * @brief DHCP client initialization
 * @param[in] context Pointer to the DHCP client context
 * @param[in] settings DHCP client specific settings
 * @return Error code
 **/

error_t dhcpClientInit(DhcpClientCtx *context, const DhcpClientSettings *settings)
{
   error_t error;
   OsTask *task;

   //Debug message
   TRACE_INFO("Initializing DHCP client...\r\n");

   //Ensure the parameters are valid
   if(!context || !settings)
      return ERROR_INVALID_PARAMETER;
   //A valid pointer to the interface being configured is required
   if(!settings->interface)
      return ERROR_INVALID_PARAMETER;

   //Clear the DHCP client context
   memset(context, 0, sizeof(DhcpClientCtx));

   //Save the network interface to configure
   context->interface = settings->interface;
   //Check whether rapid commit is allowed
   context->rapidCommit = settings->rapidCommit;
   //Force manual DNS configuration?
   context->manualDnsConfig = settings->manualDnsConfig;

   //Open a UDP socket
   context->socket = socketOpen(SOCKET_TYPE_DGRAM, SOCKET_PROTOCOL_UDP);
   //Failed to open socket?
   if(!context->socket)
      return ERROR_OPEN_FAILED;

   //Start of exception handling block
   do
   {
      //Explicitly associate the socket with the relevant interface
      error = socketBindToInterface(context->socket, context->interface);
      //Unable to bind the socket to the desired interface?
      if(error) break;

      //The client listens for DHCP messages on port 68
      error = socketBind(context->socket, &IP_ADDR_ANY, DHCP_CLIENT_PORT);
      //Unable to bind the socket to the desired port?
      if(error) break;

      //Only accept datagrams with source port number 67
      error = socketConnect(context->socket, &IP_ADDR_ANY, DHCP_SERVER_PORT);
      //Any error to report?
      if(error) break;

      //The socket operates in non-blocking mode
      error = socketSetTimeout(context->socket, 0);
      //Any error to report?
      if(error) break;

      //Initialize event object
      context->event = osEventCreate(FALSE);
      //Out of resources?
      if(context->event == OS_INVALID_HANDLE)
      {
         //Report an error
         error = ERROR_OUT_OF_RESOURCES;
         //Stop processing
         break;
      }

      //Initialize ACK event object
      context->ackEvent = osEventCreate(FALSE);
      //Out of resources?
      if(context->ackEvent == OS_INVALID_HANDLE)
      {
         //Report an error
         error = ERROR_OUT_OF_RESOURCES;
         //Stop processing
         break;
      }

      //Start the DHCP client service
      task = osTaskCreate("DHCP Client", dhcpClientTask,
         context, DHCP_CLIENT_STACK_SIZE, DHCP_CLIENT_PRIORITY);

      //Unable to create the task?
      if(task == OS_INVALID_HANDLE)
         error = ERROR_OUT_OF_RESOURCES;

      //End of exception handling block
   } while(0);

   //Any error to report?
   if(error)
   {
      //Close underlying socket
      socketClose(context->socket);
      //Close event objects
      osEventClose(context->event);
      osEventClose(context->ackEvent);
   }

   //Return status code
   return error;
}


/**
 * @brief Start DHCP client
 * @param[in] context Pointer to the DHCP client context
 * @return Error code
 **/

error_t dhcpClientStart(DhcpClientCtx *context)
{
   //Check parameters
   if(!context)
      return ERROR_INVALID_PARAMETER;

   //Debug message
   TRACE_INFO("Starting DHCP client...\r\n");

   //Ignore the request if the DHCP client is already started
   if(!context->startStop)
   {
      //Check whether the task is running
      if(context->running)
      {
         //Reset ACK event before sending the signal
         osEventReset(context->ackEvent);
         //Activate DHCP client
         context->startStop = TRUE;
         //Send a signal to the task in order to abort any blocking operation
         osEventSet(context->event);
         //Wait for the task to acknowledge our request
         osEventWait(context->ackEvent, INFINITE_DELAY);
      }
      else
      {
         //Activate DHCP client
         context->startStop = TRUE;
      }
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Stop DHCP client
 * @param[in] context Pointer to the DHCP client context
 * @return Error code
 **/

error_t dhcpClientStop(DhcpClientCtx *context)
{
   //Check parameters
   if(!context)
      return ERROR_INVALID_PARAMETER;

   //Debug message
   TRACE_INFO("Stopping DHCP client...\r\n");

   //Ignore the request if the DHCP client is already stopped
   if(context->startStop)
   {
      //Check whether the task is running
      if(context->running)
      {
         //Reset ACK event before sending the signal
         osEventReset(context->ackEvent);
         //Stop DHCP client
         context->startStop = FALSE;
         //Send a signal to the task in order to abort any blocking operation
         osEventSet(context->event);
         //Wait for the task to acknowledge our request
         osEventWait(context->ackEvent, INFINITE_DELAY);
      }
      else
      {
         //Stop DHCP client
         context->startStop = FALSE;
      }
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief DHCP finite state machine
 * @param[in] param Pointer to the DHCP client context
 **/

void dhcpClientTask(void *param)
{
   //Point to the DHCP client context
   DhcpClientCtx *context = (DhcpClientCtx *) param;

   //The DHCP client task is running
   context->running = TRUE;

   //Initialize DHCP client state
   if(context->startStop)
      context->state = DHCP_STATE_INIT;
   else
      context->state = DHCP_STATE_STOP;

   //DHCP client finite state machine
   while(1)
   {
      //Check current state
      switch(context->state)
      {
      //Process STOP state
      case DHCP_STATE_STOP:
         //The service is suspended and the client is waiting to be started again
         dhcpStateStop(context);
         break;
      //Process INIT state
      case DHCP_STATE_INIT:
         //This is the initialization state, where a client begins the process of
         //acquiring a lease. It also returns here when a lease ends, or when a
         //lease negotiation fails
         dhcpStateInit(context);
         break;
      //Process SELECTING state
      case DHCP_STATE_SELECTING:
         //The client is waiting to receive DHCPOFFER messages from one or more
         //DHCP servers, so it can choose one
         dhcpStateSelecting(context);
         break;
      //Process REQUESTING state
      case DHCP_STATE_REQUESTING:
         //The client is waiting to hear back from the server to which
         //it sent its request
         dhcpStateRequesting(context);
         break;
      //Process INIT REBOOT state
      case DHCP_STATE_INIT_REBOOT:
         //When a client that already has a valid lease starts up after a
         //power-down or reboot, it starts here instead of the INIT state
         dhcpStateInitReboot(context);
         break;
      //Process REBOOTING state
      case DHCP_STATE_REBOOTING:
         //A client that has rebooted with an assigned address is waiting for
         //a confirming reply from a server
         dhcpStateRebooting(context);
         break;
      //Process BOUND state
      case DHCP_STATE_BOUND:
         //Client has a valid lease and is in its normal operating state
         dhcpStateBound(context);
         break;
      //Process RENEWING state
      case DHCP_STATE_RENEWING:
         //Client is trying to renew its lease. It regularly sends DHCPREQUEST messages with
         //the server that gave it its current lease specified, and waits for a reply
         dhcpStateRenewing(context);
         break;
      //Process REBINDING state
      case DHCP_STATE_REBINDING:
         //The client has failed to renew its lease with the server that originally granted it,
         //and now seeks a lease extension with any server that can hear it. It periodically sends
         //DHCPREQUEST messages with no server specified until it gets a reply or the lease ends
         dhcpStateRebinding(context);
         break;
      //Invalid state...
      default:
         //Switch to the INIT state
         context->state = DHCP_STATE_INIT;
         break;
      }
   }
}


/**
 * @brief STOP state
 *
 * The service is suspended and the client is waiting to be started again
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateStop(DhcpClientCtx *context)
{
   //Debug message
   TRACE_INFO("\r\n%s: DHCP client STOP state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Wait for the service to be started again...
   osEventWait(context->event, INFINITE_DELAY);

   //Start request received?
   if(context->startStop)
   {
      //Acknowledge the reception of the start request
      osEventSet(context->ackEvent);

      //Check whether the host address is already configured
      if(context->interface->ipv4Config.addr == IPV4_UNSPECIFIED_ADDR)
      {
         //Switch to the INIT state
         context->state = DHCP_STATE_INIT;
      }
      else
      {
         //Switch to the INIT-REBOOT state
         context->state = DHCP_STATE_INIT_REBOOT;
      }
   }
}


/**
 * @brief INIT state
 *
 * This is the initialization state, where a client begins the process of
 * acquiring a lease. It also returns here when a lease ends, or when a
 * lease negotiation fails
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateInit(DhcpClientCtx *context)
{
   error_t error;
   SocketEventDesc eventDesc;

   //Specify the events the application is interested in
   eventDesc.socket = context->socket;
   eventDesc.eventMask = SOCKET_EVENT_LINK_UP;

   //Wait for the link to be up before starting DHCP configuration
   error = socketPoll(&eventDesc, 1, context->event, INFINITE_DELAY);

   //Stop request received?
   if(!context->startStop)
   {
      //Acknowledge the reception of the stop request
      osEventSet(context->ackEvent);
      //Switch to the STOP state
      context->state = DHCP_STATE_STOP;
   }
   //Link is up?
   else if(!error)
   {
      //Debug message
      TRACE_INFO("\r\n%s: DHCP client INIT state\r\n",
         formatSystemTime(osGetTickCount(), NULL));

      //The client should wait for a random time to
      //desynchronize the use of DHCP at startup
      osDelay(dhcpRandRange(0, DHCP_INIT_DELAY));

      //Switch to the SELECTING state
      context->state = DHCP_STATE_SELECTING;
   }
}


/**
 * @brief SELECTING state
 *
 * The client is waiting to receive DHCPOFFER messages from
 * one or more DHCP servers, so it can choose one
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateSelecting(DhcpClientCtx *context)
{
   error_t error;
   systime_t timeout;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP client SELECTING state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Record the time at which the client started the address acquisition process
   context->configStartTime = osGetTickCount();
   //A transaction identifier is used by the client to
   //match incoming DHCP messages with pending requests
   context->transactionId = tcpIpStackGetRand();
   //Initial timeout value
   timeout = DHCP_DISCOVER_INIT_TIMEOUT;

   //Retransmission loop
   while(1)
   {
      //Send a DHCPDISCOVER message
      dhcpSendDiscover(context);

      //Wait for a valid DHCPOFFER response
      error = dhcpWaitForResponse(context, dhcpParseOffer,
         timeout + dhcpRandRange(-DHCP_RAND_FACTOR, DHCP_RAND_FACTOR));

      //DHCPOFFER message received?
      if(!error)
      {
         //Switch to the REQUESTING state
         context->state = DHCP_STATE_REQUESTING;
         //Exit immediately
         return;
      }
      //Stop request received?
      else if(error == ERROR_SERVICE_CLOSING)
      {
         //Acknowledge the reception of the stop request
         osEventSet(context->ackEvent);
         //Switch to the STOP state
         context->state = DHCP_STATE_STOP;
         //Exit immediately
         return;
      }
      //Link is down?
      else if(error == ERROR_LINK_DOWN)
      {
         //Restart DHCP configuration
         context->state = DHCP_STATE_INIT;
         //Exit immediately
         return;
      }

      //The timeout value is doubled for each subsequent retransmission
      timeout = min(timeout * 2, DHCP_DISCOVER_MAX_TIMEOUT);
   }
}


/**
 * @brief REQUESTING state
 *
 * The client is waiting to hear back from the server
 * to which it sent its request
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateRequesting(DhcpClientCtx *context)
{
   error_t error;
   uint_t i;
   systime_t timeout;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP client REQUESTING state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //A transaction identifier is used by the client to
   //match incoming DHCP messages with pending requests
   context->transactionId = tcpIpStackGetRand();
   //Initial timeout value
   timeout = DHCP_REQUEST_INIT_TIMEOUT;

   //Retransmission loop
   for(i = 0; i < DHCP_REQUEST_MAX_RETRIES; i++)
   {
      //Send a DHCPREQUEST message
      dhcpSendRequest(context);

      //Wait for a valid  DHCPACK/DHCPNAK response
      error = dhcpWaitForResponse(context, dhcpParseAckNak,
         timeout + dhcpRandRange(-DHCP_RAND_FACTOR, DHCP_RAND_FACTOR));

      //DHCPACK message received?
      if(!error)
      {
         //Save the time a which the lease was obtained
         context->leaseStartTime = osGetTickCount();
         //Dump current DHCP configuration for debugging purpose
         dhcpDumpConfig(context);
         //The client transitions to the BOUND state
         context->state = DHCP_STATE_BOUND;
         //Exit immediately
         return;
      }
      //DHCPNAK message received?
      else if(error == ERROR_NAK_RECEIVED)
      {
         //The IPv4 address cannot be used on the link
         context->interface->ipv4Config.addr = IPV4_UNSPECIFIED_ADDR;
         context->interface->ipv4Config.subnetMask = IPV4_UNSPECIFIED_ADDR;
         //Restart DHCP configuration
         context->state = DHCP_STATE_INIT;
         //Exit immediately
         return;
      }
      //Stop request received?
      else if(error == ERROR_SERVICE_CLOSING)
      {
         //Acknowledge the reception of the stop request
         osEventSet(context->ackEvent);
         //Switch to the STOP state
         context->state = DHCP_STATE_STOP;
         //Exit immediately
         return;
      }
      //Link is down?
      else if(error == ERROR_LINK_DOWN)
      {
         //Restart DHCP configuration
         context->state = DHCP_STATE_INIT;
         //Exit immediately
         return;
      }

      //The timeout value is doubled for each subsequent retransmission
      timeout = min(timeout * 2, DHCP_REQUEST_MAX_TIMEOUT);
   }

   //If the client does not receive a response within a reasonable period
   //of time, then it restarts the initialization procedure
   context->state = DHCP_STATE_INIT;
}


/**
 * @brief INIT-REBOOT state
 *
 * When a client that already has a valid lease starts up after a
 * power-down or reboot, it starts here instead of the INIT state
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateInitReboot(DhcpClientCtx *context)
{
   error_t error;
   SocketEventDesc eventDesc;

   //Specify the events the application is interested in
   eventDesc.socket = context->socket;
   eventDesc.eventMask = SOCKET_EVENT_LINK_UP;

   //Wait for the link to be up before sending out the first request
   error = socketPoll(&eventDesc, 1, context->event, INFINITE_DELAY);

   //Stop request received?
   if(!context->startStop)
   {
      //Acknowledge the reception of the stop request
      osEventSet(context->ackEvent);
      //Switch to the STOP state
      context->state = DHCP_STATE_STOP;
   }
   //Link is up?
   else if(!error)
   {
      //Debug message
      TRACE_INFO("\r\n%s: DHCP client INIT-REBOOT state\r\n",
         formatSystemTime(osGetTickCount(), NULL));

      //The client should wait for a random time to
      //desynchronize the use of DHCP at startup
      osDelay(dhcpRandRange(0, DHCP_INIT_DELAY));

      //Switch to the REBOOTING state
      context->state = DHCP_STATE_REBOOTING;
   }
}


/**
 * @brief REBOOTING state
 *
 * A client that has rebooted with an assigned address is
 * waiting for a confirming reply from a server
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateRebooting(DhcpClientCtx *context)
{
   error_t error;
   uint_t i;
   systime_t timeout;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP client REBOOTING state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Record the time at which the client started the address acquisition process
   context->configStartTime = osGetTickCount();
   //A transaction identifier is used by the client to
   //match incoming DHCP messages with pending requests
   context->transactionId = tcpIpStackGetRand();
   //Initial timeout value
   timeout = DHCP_REQUEST_INIT_TIMEOUT;

   //Retransmission loop
   for(i = 0; i < DHCP_REQUEST_MAX_RETRIES; i++)
   {
      //Send a DHCPREQUEST message
      dhcpSendRequest(context);

      //Wait for a valid  DHCPACK/DHCPNAK response
      error = dhcpWaitForResponse(context, dhcpParseAckNak,
         timeout + dhcpRandRange(-DHCP_RAND_FACTOR, DHCP_RAND_FACTOR));

      //DHCPACK message received?
      if(!error)
      {
         //Save the time a which the lease was obtained
         context->leaseStartTime = osGetTickCount();
         //Dump current DHCP configuration for debugging purpose
         dhcpDumpConfig(context);
         //The client transitions to the BOUND state
         context->state = DHCP_STATE_BOUND;
         //Exit immediately
         return;
      }
      //DHCPNAK message received?
      else if(error == ERROR_NAK_RECEIVED)
      {
         //The address is no longer appropriate for the link
         //to which the client is connected
         context->interface->ipv4Config.addr = IPV4_UNSPECIFIED_ADDR;
         context->interface->ipv4Config.subnetMask = IPV4_UNSPECIFIED_ADDR;
         //Restart DHCP configuration
         context->state = DHCP_STATE_INIT;
         //Exit immediately
         return;
      }
      //Stop request received?
      else if(error == ERROR_SERVICE_CLOSING)
      {
         //Acknowledge the reception of the stop request
         osEventSet(context->ackEvent);
         //Switch to the STOP state
         context->state = DHCP_STATE_STOP;
         //Exit immediately
         return;
      }
      //Link is down?
      else if(error == ERROR_LINK_DOWN)
      {
         //Back to INIT-REBOOT state
         context->state = DHCP_STATE_INIT_REBOOT;
         //Exit immediately
         return;
      }

      //The timeout value is doubled for each subsequent retransmission
      timeout = min(timeout * 2, DHCP_REQUEST_MAX_TIMEOUT);
   }

   //If the client does not receive a response within a reasonable period
   //of time, then it restarts the initialization procedure
   context->state = DHCP_STATE_INIT;
}


/**
 * @brief BOUND state
 *
 * Client has a valid lease and is in its normal operating state
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateBound(DhcpClientCtx *context)
{
   error_t error;
   systime_t t1;
   systime_t time;
   SocketEventDesc eventDesc;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP client BOUND state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Specify the events the application is interested in
   eventDesc.socket = context->socket;
   eventDesc.eventMask = SOCKET_EVENT_LINK_DOWN;

   //A client will never attempt to extend the lifetime
   //of the address when T1 set to 0xFFFFFFFF
   if(context->t1 == DHCP_INFINITE_TIME)
   {
      //Monitor link changes
      error = socketPoll(&eventDesc, 1, context->event, INFINITE_DELAY);
   }
   else
   {
      //Convert T1 to milliseconds
      t1 = context->t1 * 1000;
      //Compute the time elapsed since the lease was obtained
      time = osGetTickCount() - context->leaseStartTime;
      //Remaining time until T1 expires
      time = (t1 > time) ? (t1 - time) : 0;

      //Wait for the specified amount of time while tracking link changes
      error = socketPoll(&eventDesc, 1, context->event, time);
   }

   //Stop request received?
   if(!context->startStop)
   {
      //Acknowledge the reception of the stop request
      osEventSet(context->ackEvent);
      //Switch to the STOP state
      context->state = DHCP_STATE_STOP;
   }
   //Timeout error?
   else if(error == ERROR_TIMEOUT)
   {
      //Enter the RENEWING state
      context->state = DHCP_STATE_RENEWING;
   }
   //Any other failure to report?
   else if(error)
   {
      //Stay in BOUND state
      context->state = DHCP_STATE_BOUND;
   }
   //Link is down?
   else if(eventDesc.eventFlags & SOCKET_EVENT_LINK_DOWN)
   {
      //Back to INIT-REBOOT state
      context->state = DHCP_STATE_INIT_REBOOT;
   }
}


/**
 * @brief RENEWING state
 *
 * Client is trying to renew its lease. It regularly sends
 * DHCPREQUEST messages with the server that gave it its current
 * lease specified, and waits for a reply
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateRenewing(DhcpClientCtx *context)
{
   error_t error;
   systime_t time;
   systime_t timeout;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP client RENEWING state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Record the time at which the client started the address renewal process
   context->configStartTime = osGetTickCount();
   //A transaction identifier is used by the client to
   //match incoming DHCP messages with pending requests
   context->transactionId = tcpIpStackGetRand();
   //Get current time
   time = osGetTickCount();

   //Retransmission loop
   while((time - context->leaseStartTime) < (context->t2 * 1000))
   {
      //Compute the remaining time until T2 expires
      timeout = context->leaseStartTime + (context->t2 * 1000) - time;
      //The client should wait one-half of the remaining time until T2, down to
      //a minimum of 60 seconds, before retransmitting the DHCPREQUEST message
      if(timeout > (2 * DHCP_REQUEST_MIN_INTERVAL)) timeout /= 2;

      //Send a DHCPREQUEST message
      dhcpSendRequest(context);
      //Wait for a valid  DHCPACK/DHCPNAK response
      error = dhcpWaitForResponse(context, dhcpParseAckNak, timeout);

      //DHCPACK message received?
      if(!error)
      {
         //Save the time a which the lease was obtained
         context->leaseStartTime = osGetTickCount();
         //Dump current DHCP configuration for debugging purpose
         dhcpDumpConfig(context);
         //The client transitions to the BOUND state
         context->state = DHCP_STATE_BOUND;
         //Exit immediately
         return;
      }
      //DHCPNAK message received?
      else if(error == ERROR_NAK_RECEIVED)
      {
         //The address is no longer valid
         context->interface->ipv4Config.addr = IPV4_UNSPECIFIED_ADDR;
         context->interface->ipv4Config.subnetMask = IPV4_UNSPECIFIED_ADDR;
         //Restart DHCP configuration
         context->state = DHCP_STATE_INIT;
         //Exit immediately
         return;
      }
      //Stop request received?
      else if(error == ERROR_SERVICE_CLOSING)
      {
         //Acknowledge the reception of the stop request
         osEventSet(context->ackEvent);
         //Switch to the STOP state
         context->state = DHCP_STATE_STOP;
         //Exit immediately
         return;
      }
      //Link is down?
      else if(error == ERROR_LINK_DOWN)
      {
         //Back to INIT-REBOOT state
         context->state = DHCP_STATE_INIT_REBOOT;
         //Exit immediately
         return;
      }

      //Get current time
      time = osGetTickCount();
   }

   //If no DHCPACK arrives before time T2, the client moves to REBINDING
   context->state = DHCP_STATE_REBINDING;
}


/**
 * @brief REBINDING state
 *
 * The client has failed to renew its lease with the server that originally
 * granted it, and now seeks a lease extension with any server that can
 * hear it. It periodically sends DHCPREQUEST messages with no server specified
 * until it gets a reply or the lease ends
 *
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpStateRebinding(DhcpClientCtx *context)
{
   error_t error;
   systime_t time;
   systime_t timeout;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP client REBINDING state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //A transaction identifier is used by the client to
   //match incoming DHCP messages with pending requests
   context->transactionId = tcpIpStackGetRand();
   //Get current time
   time = osGetTickCount();

   //Retransmission loop
   while((time - context->leaseStartTime) < (context->leaseTime * 1000))
   {
      //Compute the remaining time until the lease expires
      timeout = context->leaseStartTime + (context->leaseTime * 1000) - time;
      //The client should wait one-half of the remaining lease time, down to a
      //minimum of 60 seconds, before retransmitting the DHCPREQUEST message
      if(timeout > (2 * DHCP_REQUEST_MIN_INTERVAL)) timeout /= 2;

      //Send a DHCPREQUEST message
      dhcpSendRequest(context);
      //Wait for a valid  DHCPACK/DHCPNAK response
      error = dhcpWaitForResponse(context, dhcpParseAckNak, timeout);

      //DHCPACK message received?
      if(!error)
      {
         //Save the time a which the lease was obtained
         context->leaseStartTime = osGetTickCount();
         //Dump current DHCP configuration for debugging purpose
         dhcpDumpConfig(context);
         //The client transitions to the BOUND state
         context->state = DHCP_STATE_BOUND;
         //Exit immediately
         return;
      }
      //DHCPNAK message received?
      else if(error == ERROR_NAK_RECEIVED)
      {
         //The address is no longer valid
         context->interface->ipv4Config.addr = IPV4_UNSPECIFIED_ADDR;
         context->interface->ipv4Config.subnetMask = IPV4_UNSPECIFIED_ADDR;
         //Restart DHCP configuration
         context->state = DHCP_STATE_INIT;
         //Exit immediately
         return;
      }
      //Stop request received?
      else if(error == ERROR_SERVICE_CLOSING)
      {
         //Acknowledge the reception of the stop request
         osEventSet(context->ackEvent);
         //Switch to the STOP state
         context->state = DHCP_STATE_STOP;
         //Exit immediately
         return;
      }
      //Link is down?
      else if(error == ERROR_LINK_DOWN)
      {
         //Back to INIT-REBOOT state
         context->state = DHCP_STATE_INIT_REBOOT;
         //Exit immediately
         return;
      }

      //Get current time
      time = osGetTickCount();
   }

   //If the lease expires before the client receives
   //a DHCPACK, the client moves to INIT state
   context->state = DHCP_STATE_INIT;
}


/**
 * @brief Wait for a valid response from the DHCP server
 * @param[in] context Pointer to the DHCP client context
 * @param[in] parseResponse Callback function responsible for parsing server responses
 * @param[in] timeout Maximum time period to wait
 * @return Error code
 **/

error_t dhcpWaitForResponse(DhcpClientCtx *context,
   DhcpParseCallback parseResponse, systime_t timeout)
{
   error_t error;
   size_t length;
   systime_t startTime;
   systime_t elapsedTime;
   SocketEventDesc eventDesc;

   //Save the time at which the client request was sent
   startTime = osGetTickCount();
   //Time elapsed since the client request was sent
   elapsedTime = 0;

   //Keep listening as long as the retransmission timeout has not been reached
   while(elapsedTime < timeout)
   {
      //Specify the events the application is interested in
      eventDesc.socket = context->socket;
      eventDesc.eventMask = SOCKET_EVENT_RX_READY | SOCKET_EVENT_LINK_DOWN;

      //Wait for an event to be fired
      error = socketPoll(&eventDesc, 1, context->event, timeout - elapsedTime);
      //Timeout error or any other exception to report?
      if(error) return error;

      //Stop request received?
      if(!context->startStop)
      {
         //Notify the caller that the service should stop
         return ERROR_SERVICE_CLOSING;
      }
      //Message received on port 68?
      else if(eventDesc.eventFlags & SOCKET_EVENT_RX_READY)
      {
         //Read the pending message
         error = socketReceiveFrom(context->socket, NULL, NULL,
            context->buffer, DHCP_MSG_MAX_SIZE, &length, 0);
         //Sanity check
         if(error) return error;

         //Parse the received message
         error = parseResponse(context, length);
         //Check whether the received message is valid
         if(error != ERROR_INVALID_MESSAGE)
            return error;
      }
      //Link is down?
      else if(eventDesc.eventFlags & SOCKET_EVENT_LINK_DOWN)
      {
         //Notify the caller that the link is down
         return ERROR_LINK_DOWN;
      }

      //Compute the time elapsed since the client request was sent
      elapsedTime = osGetTickCount() - startTime;
   }

   //The timeout period elapsed
   return ERROR_TIMEOUT;
}


/**
 * @brief Send DHCPDISCOVER message
 * @param[in] context Pointer to the DHCP client context
 * @return Error code
 **/

error_t dhcpSendDiscover(DhcpClientCtx *context)
{
   DhcpMessage *message;
   IpAddr ipAddr;

   //DHCP message type
   const uint8_t messageType = DHCP_MESSAGE_TYPE_DISCOVER;

   //Point to buffer where the DHCP message will be formatted
   message = (DhcpMessage *) context->buffer;
   //Clear memory buffer contents
   memset(message, 0, DHCP_MSG_MAX_SIZE);

   //Format DHCPDISCOVER message
   message->op = DHCP_OPCODE_BOOTREQUEST;
   message->htype = DHCP_HARDWARE_TYPE_ETH;
   message->hlen = sizeof(MacAddr);
   message->xid = htonl(context->transactionId);
   message->secs = dhcpComputeElapsedTime(context);
   message->flags = HTONS(DHCP_FLAG_BROADCAST);
   message->ciaddr = IPV4_UNSPECIFIED_ADDR;
   message->chaddr = context->interface->macAddr;
   //Write magic cookie before setting any option
   message->magicCookie = HTONL(DHCP_MAGIC_COOKIE);
   //Properly terminate options field
   message->options[0] = DHCP_OPT_END;

   //DHCP Message Type option
   dhcpAddOption(message, DHCP_OPT_DHCP_MESSAGE_TYPE,
      &messageType, sizeof(messageType));

   //Check whether rapid commit is enabled
   if(context->rapidCommit)
   {
      //Include the Rapid Commit option if the client is prepared
      //to perform the DHCPDISCOVER-DHCPACK message exchange
      dhcpAddOption(message, DHCP_OPT_RAPID_COMMIT, NULL, 0);
   }

   //Set destination IP address
   ipAddr.length = sizeof(Ipv4Addr);
   ipAddr.ipv4Addr = IPV4_BROADCAST_ADDR;

   //Debug message
   TRACE_INFO("\r\n%s: Sending DHCP message (%" PRIuSIZE " bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), DHCP_MSG_MIN_SIZE);
   //Dump the contents of the message for debugging purpose
   dhcpDumpMessage(message, DHCP_MSG_MIN_SIZE);

   //Broadcast DHCPDISCOVER message
   return socketSendTo(context->socket, &ipAddr,
      DHCP_SERVER_PORT, message, DHCP_MSG_MIN_SIZE, NULL, 0);
}


/**
 * @brief Send DHCPREQUEST message
 * @param[in] context Pointer to the DHCP client context
 * @return Error code
 **/

error_t dhcpSendRequest(DhcpClientCtx *context)
{
   DhcpMessage *message;
   IpAddr ipAddr;

   //DHCP message type
   const uint8_t messageType = DHCP_MESSAGE_TYPE_REQUEST;

   //Requested DHCP options
   const uint8_t optionList[] =
   {
      DHCP_OPT_SUBNET_MASK,
      DHCP_OPT_ROUTER,
      DHCP_OPT_DNS_SERVER,
      DHCP_OPT_IP_ADDRESS_LEASE_TIME,
      DHCP_OPT_RENEWAL_TIME_VALUE,
      DHCP_OPT_REBINDING_TIME_VALUE
   };

   //Point to buffer where the DHCP message will be formatted
   message = (DhcpMessage *) context->buffer;
   //Clear memory buffer contents
   memset(message, 0, DHCP_MSG_MAX_SIZE);

   //Format DHCPREQUEST message
   message->op = DHCP_OPCODE_BOOTREQUEST;
   message->htype = DHCP_HARDWARE_TYPE_ETH;
   message->hlen = sizeof(MacAddr);
   message->xid = htonl(context->transactionId);
   message->secs = dhcpComputeElapsedTime(context);

   //The client IP address must be included if the client
   //is fully configured and can respond to ARP requests
   if(context->state == DHCP_STATE_RENEWING ||
      context->state == DHCP_STATE_REBINDING)
   {
      message->flags = 0;
      message->ciaddr = context->interface->ipv4Config.addr;
   }
   else
   {
      message->flags = HTONS(DHCP_FLAG_BROADCAST);
      message->ciaddr = IPV4_UNSPECIFIED_ADDR;
   }

   //Client hardware address
   message->chaddr = context->interface->macAddr;
   //Write magic cookie before setting any option
   message->magicCookie = HTONL(DHCP_MAGIC_COOKIE);
   //Properly terminate options field
   message->options[0] = DHCP_OPT_END;

   //DHCP Message Type option
   dhcpAddOption(message, DHCP_OPT_DHCP_MESSAGE_TYPE,
      &messageType, sizeof(messageType));

   //Server Identifier option
   if(context->state == DHCP_STATE_REQUESTING)
   {
      dhcpAddOption(message, DHCP_OPT_SERVER_IDENTIFIER,
         &context->serverIpAddr, sizeof(Ipv4Addr));
   }

   //Requested IP Address option
   if(context->state == DHCP_STATE_REQUESTING ||
      context->state == DHCP_STATE_REBOOTING)
   {
      dhcpAddOption(message, DHCP_OPT_REQUESTED_IP_ADDRESS,
         &context->requestedIpAddr, sizeof(Ipv4Addr));
   }

   //Parameter Request List option
   dhcpAddOption(message, DHCP_OPT_PARAM_REQUEST_LIST,
      optionList, sizeof(optionList));

   //IP address is being renewed?
   if(context->state == DHCP_STATE_RENEWING)
   {
      //The client transmits the message directly to the
      //server that initially granted the lease
      ipAddr.length = sizeof(Ipv4Addr);
      ipAddr.ipv4Addr = context->serverIpAddr;
   }
   else
   {
      //Broadcast the message
      ipAddr.length = sizeof(Ipv4Addr);
      ipAddr.ipv4Addr = IPV4_BROADCAST_ADDR;
   }

   //Debug message
   TRACE_INFO("\r\n%s: Sending DHCP message (%" PRIuSIZE " bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), DHCP_MSG_MIN_SIZE);
   //Dump the contents of the message for debugging purpose
   dhcpDumpMessage(message, DHCP_MSG_MIN_SIZE);

   //Send DHCPREQUEST message
   return socketSendTo(context->socket, &ipAddr,
      DHCP_SERVER_PORT, message, DHCP_MSG_MIN_SIZE, NULL, 0);
}


/**
 * @brief Send DHCPDECLINE message
 * @param[in] context Pointer to the DHCP client context
 * @return Error code
 **/

error_t dhcpSendDecline(DhcpClientCtx *context)
{
   DhcpMessage *message;
   IpAddr ipAddr;

   //DHCP message type
   const uint8_t messageType = DHCP_MESSAGE_TYPE_DECLINE;

   //Point to buffer where the DHCP message will be formatted
   message = (DhcpMessage *) context->buffer;
   //Clear memory buffer contents
   memset(message, 0, DHCP_MSG_MAX_SIZE);

   //Format DHCPDECLINE message
   message->op = DHCP_OPCODE_BOOTREQUEST;
   message->htype = DHCP_HARDWARE_TYPE_ETH;
   message->hlen = sizeof(MacAddr);
   message->xid = htonl(context->transactionId);
   message->secs = 0;
   message->flags = 0;
   message->ciaddr = IPV4_UNSPECIFIED_ADDR;
   message->chaddr = context->interface->macAddr;
   //Write magic cookie before setting any option
   message->magicCookie = HTONL(DHCP_MAGIC_COOKIE);
   //Properly terminate options field
   message->options[0] = DHCP_OPT_END;

   //DHCP Message Type option
   dhcpAddOption(message, DHCP_OPT_DHCP_MESSAGE_TYPE,
      &messageType, sizeof(messageType));
   //Server Identifier option
   dhcpAddOption(message, DHCP_OPT_SERVER_IDENTIFIER,
      &context->serverIpAddr, sizeof(Ipv4Addr));
   //Requested IP Address option
   dhcpAddOption(message, DHCP_OPT_REQUESTED_IP_ADDRESS,
      &context->requestedIpAddr, sizeof(Ipv4Addr));

   //Set destination IP address
   ipAddr.length = sizeof(Ipv4Addr);
   ipAddr.ipv4Addr = IPV4_BROADCAST_ADDR;

   //Debug message
   TRACE_INFO("\r\n%s: Sending DHCP message (%" PRIuSIZE " bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), DHCP_MSG_MIN_SIZE);
   //Dump the contents of the message for debugging purpose
   dhcpDumpMessage(message, DHCP_MSG_MIN_SIZE);

   //Broadcast DHCPDECLINE message
   return socketSendTo(context->socket, &ipAddr,
      DHCP_SERVER_PORT, message, DHCP_MSG_MIN_SIZE, NULL, 0);
}


/**
 * @brief Parse DHCPOFFER message
 * @param[in] context Pointer to the DHCP client context
 * @param[in] length Length of the incoming message to parse
 * @return Error code
 **/

error_t dhcpParseOffer(DhcpClientCtx *context, size_t length)
{
   DhcpMessage *message;
   DhcpOption *option;

   //Point to the DHCP message to parse
   message = (DhcpMessage *) context->buffer;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP message received (%" PRIuSIZE " bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), length);
   //Dump the contents of the message for debugging purpose
   dhcpDumpMessage(message, length);

   //Make sure the DHCP message is valid
   if(length < sizeof(DhcpMessage))
      return ERROR_INVALID_MESSAGE;
   //The DHCP server shall respond with a BOOTREPLY opcode
   if(message->op != DHCP_OPCODE_BOOTREPLY)
      return ERROR_INVALID_MESSAGE;
   //Enforce hardware type
   if(message->htype != DHCP_HARDWARE_TYPE_ETH)
      return ERROR_INVALID_MESSAGE;
   //Check the length of the hardware address
   if(message->hlen != sizeof(MacAddr))
      return ERROR_INVALID_MESSAGE;
   //Discard any received packet that does not match the transaction ID
   if(ntohl(message->xid) != context->transactionId)
      return ERROR_INVALID_MESSAGE;
   //Make sure the IP address offered to the client is valid
   if(message->yiaddr == IPV4_UNSPECIFIED_ADDR)
      return ERROR_INVALID_MESSAGE;
   //Check MAC address
   if(!macCompAddr(&message->chaddr, &context->interface->macAddr))
      return ERROR_INVALID_MESSAGE;
   //Check magic cookie
   if(message->magicCookie != HTONL(DHCP_MAGIC_COOKIE))
      return ERROR_INVALID_MESSAGE;

   //Retrieve DHCP Message Type option
   option = dhcpGetOption(message, length, DHCP_OPT_DHCP_MESSAGE_TYPE);
   //Failed to retrieve specified option?
   if(!option || option->length != 1)
      return ERROR_INVALID_MESSAGE;
   //Check message type
   if(option->value[0] != DHCP_MESSAGE_TYPE_OFFER)
      return ERROR_INVALID_MESSAGE;

   //Retrieve Server Identifier option
   option = dhcpGetOption(message, length, DHCP_OPT_SERVER_IDENTIFIER);
   //Failed to retrieve specified option?
   if(!option || option->length != 4)
      return ERROR_INVALID_MESSAGE;
   //Record the DHCP server IP address
   ipv4CopyAddr(&context->serverIpAddr, option->value);

   //Record the IP address offered to the client
   context->requestedIpAddr = message->yiaddr;

   //The DHCPOFFER message was successfully parsed
   return NO_ERROR;
}


/**
 * @brief Parse DHCPACK or DHCPNAK message
 * @param[in] context Pointer to the DHCP client context
 * @param[in] length Length of the incoming message to parse
 * @return Error code
 **/

error_t dhcpParseAckNak(DhcpClientCtx *context, size_t length)
{
   uint_t n;
   DhcpMessage *message;
   DhcpOption *option;

   //Point to the DHCP message to parse
   message = (DhcpMessage *) context->buffer;

   //Debug message
   TRACE_INFO("\r\n%s: DHCP message received (%" PRIuSIZE " bytes)...\r\n",
      formatSystemTime(osGetTickCount(), NULL), length);
   //Dump the contents of the message for debugging purpose
   dhcpDumpMessage(message, length);

   //Make sure the DHCP message is valid
   if(length < sizeof(DhcpMessage))
      return ERROR_INVALID_MESSAGE;
   //The DHCP server shall respond with a BOOTREPLY opcode
   if(message->op != DHCP_OPCODE_BOOTREPLY)
      return ERROR_INVALID_MESSAGE;
   //Enforce hardware type
   if(message->htype != DHCP_HARDWARE_TYPE_ETH)
      return ERROR_INVALID_MESSAGE;
   //Check the length of the hardware address
   if(message->hlen != sizeof(MacAddr))
      return ERROR_INVALID_MESSAGE;
   //Discard any received packet that does not match the transaction ID
   if(ntohl(message->xid) != context->transactionId)
      return ERROR_INVALID_MESSAGE;
   //Check MAC address
   if(!macCompAddr(&message->chaddr, &context->interface->macAddr))
      return ERROR_INVALID_MESSAGE;
   //Check magic cookie
   if(message->magicCookie != HTONL(DHCP_MAGIC_COOKIE))
      return ERROR_INVALID_MESSAGE;

   //Retrieve DHCP Message Type option
   option = dhcpGetOption(message, length, DHCP_OPT_DHCP_MESSAGE_TYPE);
   //Failed to retrieve specified option?
   if(!option || option->length != 1)
      return ERROR_INVALID_MESSAGE;
   //Check message type (DHCPACK or DHCPNAK)
   if(option->value[0] == DHCP_MESSAGE_TYPE_NAK)
      return ERROR_NAK_RECEIVED;
   else if(option->value[0] != DHCP_MESSAGE_TYPE_ACK)
      return ERROR_INVALID_MESSAGE;

   //Retrieve Server Identifier option
   option = dhcpGetOption(message, length, DHCP_OPT_SERVER_IDENTIFIER);
   //Failed to retrieve specified option?
   if(!option || option->length != 4)
      return ERROR_INVALID_MESSAGE;
   //Unexpected server identifier?
   if(!ipv4CompAddr(option->value, &context->serverIpAddr))
      return ERROR_INVALID_MESSAGE;

   //Retrieve IP Address Lease Time option
   option = dhcpGetOption(message, length, DHCP_OPT_IP_ADDRESS_LEASE_TIME);
   //Failed to retrieve specified option?
   if(!option  || option->length != 4)
      return ERROR_INVALID_MESSAGE;
   //Record the lease time
   memcpy(&context->leaseTime, option->value, 4);
   //Convert from network byte order to host byte order
   context->leaseTime = ntohl(context->leaseTime);

   //Retrieve Renewal Time Value option
   option = dhcpGetOption(message, length, DHCP_OPT_RENEWAL_TIME_VALUE);
   //Specified option found?
   if(option && option->length == 4)
   {
      //This option specifies the time interval from address assignment
      //until the client transitions to the RENEWING state
      memcpy(&context->t1, option->value, 4);
      //Convert from network byte order to host byte order
      context->t1 = ntohl(context->t1);
   }
   else if(context->leaseTime != DHCP_INFINITE_TIME)
   {
      //By default, T1 is set to 50% of the lease time
      context->t1 = context->leaseTime / 2;
   }
   else
   {
      //Infinite lease
      context->t1 = DHCP_INFINITE_TIME;
   }

   //Retrieve Rebinding Time value option
   option = dhcpGetOption(message, length, DHCP_OPT_REBINDING_TIME_VALUE);
   //Specified option found?
   if(option && option->length == 4)
   {
      //This option specifies the time interval from address assignment
      //until the client transitions to the REBINDING state
      memcpy(&context->t2, option->value, 4);
      //Convert from network byte order to host byte order
      context->t2 = ntohl(context->t2);
   }
   else if(context->leaseTime != DHCP_INFINITE_TIME)
   {
      //By default, T2 is set to 87.5% of the lease time
      context->t2 = context->leaseTime * 7 / 8;
   }
   else
   {
      //Infinite lease
      context->t2 = DHCP_INFINITE_TIME;
   }

   //Retrieve Subnet Mask option
   option = dhcpGetOption(message, length, DHCP_OPT_SUBNET_MASK);
   //The specified option has been found?
   if(option && option->length == sizeof(Ipv4Addr))
   {
      //Record subnet mask
      ipv4CopyAddr(&context->interface->ipv4Config.subnetMask, option->value);
   }

   //Retrieve Router option
   option = dhcpGetOption(message, length, DHCP_OPT_ROUTER);
   //The specified option has been found?
   if(option && !(option->length % sizeof(Ipv4Addr)))
   {
      //Save default gateway
      if(option->length >= sizeof(Ipv4Addr))
         ipv4CopyAddr(&context->interface->ipv4Config.defaultGateway, option->value);
   }

   //Use the DNS servers provided by the DHCP server?
   if(!context->manualDnsConfig)
   {
      //Retrieve DNS Server option
      option = dhcpGetOption(message, length, DHCP_OPT_DNS_SERVER);
       //The specified option has been found?
      if(option && !(option->length % sizeof(Ipv4Addr)))
      {
         //Get the number of addresses provided in the response
         n = option->length / sizeof(Ipv4Addr);
         //Only a limited set of DNS servers is supported
         n = min(n, IPV4_MAX_DNS_SERVERS);
         //Record DNS server addresses
         memcpy(context->interface->ipv4Config.dnsServer, option->value, n * sizeof(Ipv4Addr));
         //Save the number of DNS servers
         context->interface->ipv4Config.dnsServerCount = n;
      }
   }

   //Record the IP address assigned to the client
   context->interface->ipv4Config.addr = message->yiaddr;

   //The DHCPACK message was successfully parsed
   return NO_ERROR;
}


/**
 * @brief Compute the appropriate secs field
 *
 * Compute the number of seconds elapsed since the client began
 * address acquisition or renewal process
 *
 * @param[in] context Pointer to the DHCP client context
 * @return The elapsed time expressed in hundredths of a second
 **/

uint16_t dhcpComputeElapsedTime(DhcpClientCtx *context)
{
   systime_t time;

   //Compute the time elapsed since the DHCP configuration process started
   time = (osGetTickCount() - context->configStartTime) / 1000;

   //The value 0xFFFF is used to represent any elapsed time values
   //greater than the largest time value that can be represented
   if(time > 0xFFFF) time = 0xFFFF;

   //Convert the 16-bit value to network byte order
   return htons((uint16_t) time);
}


/**
 * @brief Get a random value in the specified range
 * @param[in] min Lower bound
 * @param[in] max Upper bound
 * @return Random value in the specified range
 **/

int32_t dhcpRandRange(int32_t min, int32_t max)
{
   //Return a random value in the given range
   return min + tcpIpStackGetRand() % (max - min + 1);
}


/**
 * @brief Dump DHCP configuration for debugging purpose
 * @param[in] context Pointer to the DHCP client context
 **/

void dhcpDumpConfig(DhcpClientCtx *context)
{
   uint_t i;
   Ipv4Addr ipAddr;

   //Dump current DHCP configuration
   TRACE_INFO("\r\nDHCP configuration:\r\n");
   TRACE_INFO("  IPv4 Address = %s\r\n", ipv4AddrToString(context->interface->ipv4Config.addr, NULL));
   TRACE_INFO("  Lease Start Time = %s\r\n", formatSystemTime(context->leaseStartTime, NULL));
   TRACE_INFO("  T1 = %" PRIu32 "s\r\n", context->t1);
   TRACE_INFO("  T2 = %" PRIu32 "s\r\n", context->t2);
   TRACE_INFO("  Lease Time = %" PRIu32 "s\r\n", context->leaseTime);
   TRACE_INFO("  Subnet Mask = %s\r\n", ipv4AddrToString(context->interface->ipv4Config.subnetMask, NULL));
   TRACE_INFO("  Default Gateway = %s\r\n", ipv4AddrToString(context->interface->ipv4Config.defaultGateway, NULL));

   //Loop through DNS servers
   for(i = 0; i < IPV4_MAX_DNS_SERVERS; i++)
   {
      //Get DNS server address
      ipv4GetDnsServer(context->interface, i, &ipAddr);
      //Make sure the IP address is valid
      if(ipAddr == IPV4_UNSPECIFIED_ADDR)
         break;

      //Display IP address
      TRACE_INFO("  DNS Server %u = %s\r\n", i + 1, ipv4AddrToString(ipAddr, NULL));
   }
}

#endif
