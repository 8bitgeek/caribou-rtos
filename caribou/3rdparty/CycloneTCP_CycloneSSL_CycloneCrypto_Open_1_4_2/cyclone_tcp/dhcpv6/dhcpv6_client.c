/**
 * @file dhcpv6_client.c
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
 * @section Description
 *
 * The Dynamic Host Configuration Protocol for IPv6 enables DHCP servers to
 * pass configuration parameters such as IPv6 network addresses to IPv6
 * nodes. This protocol is a stateful counterpart to IPv6 Stateless Address
 * Autoconfiguration (RFC 2462), and can be used separately or concurrently
 * with the latter to obtain configuration parameters. Refer to RFC 3315
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

//Switch to the appropriate trace level
#define TRACE_LEVEL DHCPV6_TRACE_LEVEL

//Dependencies
#include <stdlib.h>
#include "tcp_ip_stack.h"
#include "dhcpv6_client.h"
#include "dhcpv6_common.h"
#include "dhcpv6_debug.h"
#include "slaac.h"
#include "date_time.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED)

//Requested DHCPv6 options
static const uint16_t dhcpv6OptionList[] =
{
   HTONS(DHCPV6_OPTION_DNS_SERVERS),
   HTONS(DHCPV6_OPTION_DOMAIN_LIST)
};


/**
 * @brief Initialize settings with default values
 * @param[out] settings Structure that contains DHCPv6 client settings
 **/

void dhcpv6ClientGetDefaultSettings(Dhcpv6ClientSettings *settings)
{
   //Use default interface
   settings->interface = NULL;
   //No rapid commit
   settings->rapidCommit = FALSE;
}


/**
 * @brief DHCPv6 client initialization
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[in] settings DHCPv6 client specific settings
 * @return Error code
 **/

error_t dhcpv6ClientInit(Dhcpv6ClientCtx *context, const Dhcpv6ClientSettings *settings)
{
   error_t error;
   Dhcpv6DuidLl *duid;
   OsTask *task;

   //Debug message
   TRACE_INFO("Initializing DHCPv6 client...\r\n");

   //Ensure the parameters are valid
   if(!context || !settings)
      return ERROR_INVALID_PARAMETER;
   //A valid pointer to the interface being configured is required
   if(!settings->interface)
      return ERROR_INVALID_PARAMETER;

   //Clear the DHCPv6 client context
   memset(context, 0, sizeof(Dhcpv6ClientCtx));

   //Save the network interface to configure
   context->interface = settings->interface;
   //Check whether rapid commit is allowed
   context->rapidCommit = settings->rapidCommit;

   //Point to the client DUID
   duid = (Dhcpv6DuidLl *) context->clientId;
   //Generate a DUID-LL
   duid->type = HTONS(DHCPV6_DUID_LL);
   duid->hardwareType = HTONS(DHCPV6_HARDWARE_TYPE_ETH);
   duid->linkLayerAddr = context->interface->macAddr;
   //Length of the newly generated DUID
   context->clientIdLength = sizeof(Dhcpv6DuidLl);

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

      //The client listens for DHCPv6 messages on port 546
      error = socketBind(context->socket, &IP_ADDR_ANY, DHCPV6_CLIENT_PORT);
      //Unable to bind the socket to the desired port?
      if(error) break;

      //Only accept datagrams with source port number 547
      error = socketConnect(context->socket, &IP_ADDR_ANY, DHCPV6_SERVER_PORT);
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

      //Start the DHCPv6 client service
      task = osTaskCreate("DHCPv6 Client", dhcpv6ClientTask,
         context, DHCPV6_CLIENT_STACK_SIZE, DHCPV6_CLIENT_PRIORITY);

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
      //Close event object
      osEventClose(context->event);
   }

   //Return status code
   return error;
}


/**
 * @brief Start DHCPv6 client
 * @param[in] context Pointer to the DHCPv6 client context
 * @return Error code
 **/

error_t dhcpv6ClientStart(Dhcpv6ClientCtx *context)
{
   //Debug message
   TRACE_INFO("Starting DHCPv6 client...\r\n");
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Stop DHCPv6 client
 * @param[in] context Pointer to the DHCPv6 client context
 * @return Error code
 **/

error_t dhcpv6ClientStop(Dhcpv6ClientCtx *context)
{
   //Debug message
   TRACE_INFO("Stopping DHCPv6 client...\r\n");
   //Not implemented
   return ERROR_NOT_IMPLEMENTED;
}


/**
 * @brief DHCPv6 client task
 * @param[in] param Pointer to the DHCPv6 client context
 **/

void dhcpv6ClientTask(void *param)
{
   //Point to the DHCPv6 client context
   Dhcpv6ClientCtx *context = (Dhcpv6ClientCtx *) param;

   //At this point the global address is not yet valid
   context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
   context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
   //Initialize DHCPv6 client state
   context->state = DHCPV6_STATE_SOLICIT;

   //DHCPv6 client finite state machine
   while(1)
   {
      //Check current state
      switch(context->state)
      {
      //Process SOLICIT state
      case DHCPV6_STATE_SOLICIT:
         //The client sends a Solicit message to locate servers
         dhcpv6StateSolicit(context);
         break;
      //Process REQUEST state
      case DHCPV6_STATE_REQUEST:
         //The client sends a Request message to request configuration
         //parameters, including IP addresses, from a specific server
         dhcpv6StateRequest(context);
         break;
      //Process CONFIRM state
      case DHCPV6_STATE_CONFIRM:
         //The client sends a Confirm message to any available server
         //to determine whether the addresses it was assigned are still
         //appropriate to the link to which the client is connected
         dhcpv6StateConfirm(context);
         break;
      //Process BOUND state
      case DHCPV6_STATE_BOUND:
         //The client has a valid lease and is in its normal operating state
         dhcpv6StateBound(context);
         break;
      //Process RENEW state
      case DHCPV6_STATE_RENEW:
         //The client sends a Renew message to the server that originally
         //provided the client's addresses and configuration parameters to
         //extend the lifetimes on the addresses assigned to the client
         //and to update other configuration parameters
         dhcpv6StateRenew(context);
         break;
      //Process REBIND state
      case DHCPV6_STATE_REBIND:
         //The client sends a Rebind message to any available server to extend
         //the lifetimes on the addresses assigned to the client and to update
         //other configuration parameters. This message is sent after a client
         //receives no response to a Renew message
         dhcpv6StateRebind(context);
         break;
      //Invalid state...
      default:
         //Switch to the default state
         context->state = DHCPV6_STATE_SOLICIT;
         break;
      }
   }
}


/**
 * @brief SOLICIT state
 *
 * A client uses the Solicit message to discover DHCPv6 servers
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateSolicit(Dhcpv6ClientCtx *context)
{
   error_t error;
   SocketEventDesc eventDesc;

   //At this point the global address is not yet valid
   context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
   context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;

   //Reset server preference value
   context->serverPreference = -1;
   //The rapid commit procedure is not yet completed
   context->rapidCommitDone = FALSE;

   //Specify the events the application is interested in
   eventDesc.socket = context->socket;
   eventDesc.eventMask = SOCKET_EVENT_LINK_UP;

   //Wait for the link to be up before starting DHCPv6 configuration
   error = socketPoll(&eventDesc, 1, context->event, INFINITE_DELAY);

   //Any error to report?
   if(error)
   {
      //Restart configuration procedure
      context->state = DHCPV6_STATE_SOLICIT;
      //Exit immediately
      return;
   }

   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client SOLICIT state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //The first Solicit message from the client on the interface must be
   //delayed by a random amount of time between 0 and SOL_MAX_DELAY
   osDelay(dhcpv6RandRange(0, DHCPV6_SOL_MAX_DELAY));

   //Adjust retransmission parameters
   context->irt = DHCPV6_SOL_TIMEOUT;
   context->mrt = DHCPV6_SOL_MAX_RT;
   context->mrc = 0;
   context->mrd = 0;

   //Initiate a Solicit/Advertise message exchange
   error = dhcpv6MessageExchange(context, dhcpv6FormatSolicit, dhcpv6ParseAdvertise);

   //Message exchange failed?
   if(error)
   {
      //Restart configuration procedure
      context->state = DHCPV6_STATE_SOLICIT;
   }
   //Rapid commit has not been used?
   else if(!context->rapidCommitDone)
   {
      //Continue configuration procedure
      context->state = DHCPV6_STATE_REQUEST;
   }
   //Rapid commit procedure is complete?
   else
   {
      //Address uniqueness on the link is being verified...
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_TENTATIVE;
{
Ipv6Addr solicitedNodeAddr;
ipv6ComputeSolicitedNodeAddr(&context->interface->ipv6Config.globalAddr, &solicitedNodeAddr);
ipv6JoinMulticastGroup(context->interface, &solicitedNodeAddr);
}
      //The client should perform duplicate address detection on the address it
      //receives in the Reply message before using that address for traffic
      error = slaacDetectDuplicateAddr(&context->interface->ipv6Config.globalAddr);

      //Check if the address is found to be in use on the link
      if(error)
      {
         //The global address cannot be used on the link
         context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
         context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
         //Switch to the DECLINE state
         context->state = DHCPV6_STATE_DECLINE;
      }
      else
      {
         //The use of the global address is now unrestricted
         context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_PREFERRED;
         //Dump current DHCPv6 configuration for debugging purpose
         dhcpv6DumpConfig(context);
         //Enter the BOUND state
         context->state = DHCPV6_STATE_BOUND;
      }
   }
}


/**
 * @brief REQUEST state
 *
 * The client uses a Request message to populate IAs with addresses and obtain
 * other configuration information. The client includes one or more more IA
 * options in the Request message. The server then returns addresses and other
 * information about the IAs to the client in IA options in a Reply message
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateRequest(Dhcpv6ClientCtx *context)
{
   error_t error;

   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client REQUEST state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Adjust retransmission parameters
   context->irt = DHCPV6_REQ_TIMEOUT;
   context->mrt = DHCPV6_REQ_MAX_RT;
   context->mrc = DHCPV6_REQ_MAX_RC;
   context->mrd = 0;

   //Perform a Request/Reply message exchange
   error = dhcpv6MessageExchange(context, dhcpv6FormatRequest, dhcpv6ParseReply);

   //Check whether an error occurred during the message exchange
   if(error || !context->validLifetime)
   {
      //No global address has been assigned yet
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
      context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
      //Back to SOLICIT state
      context->state = DHCPV6_STATE_SOLICIT;
      //Exit immediately
      return;
   }

   //Address uniqueness on the link is being verified...
   context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_TENTATIVE;
{
Ipv6Addr solicitedNodeAddr;
ipv6ComputeSolicitedNodeAddr(&context->interface->ipv6Config.globalAddr, &solicitedNodeAddr);
ipv6JoinMulticastGroup(context->interface, &solicitedNodeAddr);
}
   //The client should perform duplicate address detection on the address it
   //receives in the Reply message before using that address for traffic
   error = slaacDetectDuplicateAddr(&context->interface->ipv6Config.globalAddr);

   //Check if the address is found to be in use on the link
   if(error)
   {
      //The global address cannot be used on the link
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
      context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
      //Switch to the DECLINE state
      context->state = DHCPV6_STATE_DECLINE;
   }
   else
   {
      //The use of the global address is now unrestricted
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_PREFERRED;
      //Dump current DHCPv6 configuration for debugging purpose
      dhcpv6DumpConfig(context);
      //Enter the BOUND state
      context->state = DHCPV6_STATE_BOUND;
   }
}


/**
 * @brief CONFIRM state
 *
 * Whenever a client may have moved to a new link, the prefixes from
 * the addresses assigned to the interfaces on that link may no longer
 * be appropriate for the link to which the client is attached. In such
 * the client must initiate a Confirm/Reply message exchange
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateConfirm(Dhcpv6ClientCtx *context)
{
   error_t error;
   SocketEventDesc eventDesc;

   //Specify the events the application is interested in
   eventDesc.socket = context->socket;
   eventDesc.eventMask = SOCKET_EVENT_LINK_UP;

   //Wait for the link to be up before sending out the first Confirm message
   error = socketPoll(&eventDesc, 1, context->event, INFINITE_DELAY);

   //Any error to report?
   if(error)
   {
      //Restart configuration procedure
      context->state = DHCPV6_STATE_CONFIRM;
      //Exit immediately
      return;
   }

   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client CONFIRM state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //The first Confirm message from the client on the interface must be
   //delayed by a random amount of time between 0 and CNF_MAX_DELAY
   osDelay(dhcpv6RandRange(0, DHCPV6_CNF_MAX_DELAY));

   //Adjust retransmission parameters
   context->irt = DHCPV6_CNF_TIMEOUT;
   context->mrt = DHCPV6_CNF_MAX_RT;
   context->mrc = 0;
   context->mrd = DHCPV6_CNF_MAX_RD;

   //Initiate a Confirm/Reply message exchange
   error = dhcpv6MessageExchange(context, dhcpv6FormatConfirm, dhcpv6ParseReply);

   //If the client receives no responses before the message transmission
   //process terminates, the client should continue to use its IPv6 address,
   //using the last known lifetimes for that address, and should continue
   //to use any other previously obtained configuration parameters
   if(error == NO_ERROR || error == ERROR_TIMEOUT)
   {
      //Dump current DHCPv6 configuration for debugging purpose
      dhcpv6DumpConfig(context);
      //Switch to the BOUND state
      context->state = DHCPV6_STATE_BOUND;
   }
   //Link is down?
   else if(error == ERROR_LINK_DOWN)
   {
      //Back to CONFIRM state
      context->state = DHCPV6_STATE_CONFIRM;
   }
   //Any other error?
   else
   {
      //The address is no longer appropriate for the link
      //to which the client is connected
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
      context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
      //Perform DHCPv6 server solicitation
      context->state = DHCPV6_STATE_SOLICIT;
   }
}


/**
 * @brief BOUND state
 *
 * Client has a valid lease and is in its normal operating state
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateBound(Dhcpv6ClientCtx *context)
{
   error_t error;
   systime_t t1;
   systime_t time;
   SocketEventDesc eventDesc;

   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client BOUND state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Specify the events the application is interested in
   eventDesc.socket = context->socket;
   eventDesc.eventMask = SOCKET_EVENT_LINK_DOWN;

   //A client will never attempt to extend the lifetime of any
   //address in an IA with T1 set to 0xFFFFFFFF
   if(context->t1 == DHCPV6_INFINITE_TIME)
   {
      //Monitor link changes
      error = socketPoll(&eventDesc, 1, context->event, INFINITE_DELAY);

      //Link is down?
      if(!error)
      {
         //Back to CONFIRM state
         context->state = DHCPV6_STATE_CONFIRM;
      }
      //Any failure to report?
      else
      {
         //Stay in BOUND state
         context->state = DHCPV6_STATE_BOUND;
      }
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

      //Link is down?
      if(!error)
      {
         //Back to CONFIRM state
         context->state = DHCPV6_STATE_CONFIRM;
      }
      //Timeout error?
      else if(error == ERROR_TIMEOUT)
      {
         //Enter the RENEW state
         context->state = DHCPV6_STATE_RENEW;
      }
      //Any other failure to report?
      else
      {
         //Stay in BOUND state
         context->state = DHCPV6_STATE_BOUND;
      }
   }
}


/**
 * @brief RENEW state
 *
 * The client sends a Renew message to the server that originally
 * provided the client's addresses and configuration parameters to
 * extend the lifetimes on the addresses assigned to the client
 * and to update other configuration parameters
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateRenew(Dhcpv6ClientCtx *context)
{
   error_t error;
   systime_t t2;
   systime_t time;

   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client RENEW state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //A client will never attempt to use a Rebind message to locate a different server
   //to extend the lifetime of any address in an IA with T2 set to 0xFFFFFFFF
   if(context->t2 == DHCPV6_INFINITE_TIME)
   {
      //By setting MRD to zero, the client will continue to transmit
      //the Renew message indefinitely until it receives a response
      time = 0;
   }
   else
   {
      //Convert T2 to milliseconds
      t2 = context->t2 * 1000;
      //Compute the time elapsed since the lease was obtained
      time = osGetTickCount() - context->leaseStartTime;
      //Remaining time until T2 expires
      time = (t2 > time) ? (t2 - time) : 1;
   }

   //Adjust retransmission parameters
   context->irt = DHCPV6_REN_TIMEOUT;
   context->mrt = DHCPV6_REN_MAX_RT;
   context->mrc = 0;
   context->mrd = time;

   //Perform a Renew/Reply message exchange
   error = dhcpv6MessageExchange(context, dhcpv6FormatRenew, dhcpv6ParseReply);

   //Link is down?
   if(error == ERROR_LINK_DOWN)
   {
      //Back to CONFIRM state
      context->state = DHCPV6_STATE_CONFIRM;
   }
   //Unable to renew the address?
   else if(error)
   {
      //Switch to the REBIND state
      context->state = DHCPV6_STATE_REBIND;
   }
   //The server may remove addresses from the IA by setting the
   //preferred and valid lifetimes of those addresses to zero
   else if(!context->validLifetime)
   {
      //The address is no longer valid
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
      context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
      //Initiate a new server solicitation
      context->state = DHCPV6_STATE_SOLICIT;
   }
   //The address was successfully renewed
   else
   {
      //Dump current DHCPv6 configuration for debugging purpose
      dhcpv6DumpConfig(context);
      //Switch to the BOUND state
      context->state = DHCPV6_STATE_BOUND;
   }
}


/**
 * @brief REBIND state
 *
 * The client sends a Rebind message to any available server to extend
 * the lifetimes on the addresses assigned to the client and to update
 * other configuration parameters. This message is sent after a client
 * receives no response to a Renew message
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateRebind(Dhcpv6ClientCtx *context)
{
   error_t error;
   systime_t time;
   systime_t validLifetime;

   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client REBIND state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Setting the valid lifetime of an address to 0xFFFFFFFF amounts
   //to a permanent assignment of an address to the client
   if(context->validLifetime == DHCPV6_INFINITE_TIME)
   {
      //By setting MRD to zero, the client will continue to transmit
      //the Rebind message indefinitely until it receives a response
      time = 0;
   }
   else
   {
      //Convert the valid lifetime to milliseconds
      validLifetime = context->validLifetime * 1000;
      //Compute the time elapsed since the lease was obtained
      time = osGetTickCount() - context->leaseStartTime;
      //Remaining time until the valid lifetime expires
      time = (validLifetime > time) ? (validLifetime - time) : 1;
   }

   //Adjust retransmission parameters
   context->irt = DHCPV6_REB_TIMEOUT;
   context->mrt = DHCPV6_REB_MAX_RT;
   context->mrc = 0;
   context->mrd = time;

   //Perform a Rebind/Reply message exchange
   error = dhcpv6MessageExchange(context, dhcpv6FormatRebind, dhcpv6ParseReply);

   //Link is down?
   if(error == ERROR_LINK_DOWN)
   {
      //Back to CONFIRM state
      context->state = DHCPV6_STATE_CONFIRM;
   }
   //Unable to renew the address?
   else if(error)
   {
      //The address is no longer valid
      context->interface->ipv6Config.globalAddrState = IPV6_ADDR_STATE_INVALID;
      context->interface->ipv6Config.globalAddr = IPV6_UNSPECIFIED_ADDR;
      //Initiate a new server solicitation
      context->state = DHCPV6_STATE_SOLICIT;
   }
   //The address was successfully renewed
   else
   {
      //Dump current DHCPv6 configuration for debugging purpose
      dhcpv6DumpConfig(context);
      //Switch to the BOUND state
      context->state = DHCPV6_STATE_BOUND;
   }
}


/**
 * @brief DECLINE state
 *
 * If a client detects that one or more addresses assigned to it by a
 * server are already in use by another node, the client sends a Decline
 * message to the server to inform it that the address is suspect
 *
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6StateDecline(Dhcpv6ClientCtx *context)
{
   //Debug message
   TRACE_INFO("\r\n%s: DHCPv6 client DECLINE state\r\n",
      formatSystemTime(osGetTickCount(), NULL));

   //Adjust retransmission parameters
   context->irt = DHCPV6_DEC_TIMEOUT;
   context->mrt = 0;
   context->mrc = DHCPV6_DEC_MAX_RC;
   context->mrd = 0;

   //Perform a Decline/Reply message exchange
   dhcpv6MessageExchange(context, dhcpv6FormatDecline, dhcpv6ParseReply);

   //Update DHCPv6 client state
   context->state = DHCPV6_STATE_SOLICIT;
}


/**
 * @brief Client-initiated message exchange
 *
 * The DHCPv6 client is responsible for reliable delivery of messages in the
 * client-initiated message exchanges. The client begins the message exchange
 * by transmitting a message to the server.  The message exchange terminates
 * when either the client successfully receives the appropriate response from
 * a server, or when the message exchange is considered to have failed according
 * to the retransmission mechanism (refer to RFC 3315 section 14)
 *
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[in] formatRequest Callback function responsible for formatting client requests
 * @param[in] parseResponse Callback function responsible for parsing server responses
 * @return Error code
 **/

error_t dhcpv6MessageExchange(Dhcpv6ClientCtx *context,
   Dhcpv6FormatCallback formatRequest, Dhcpv6ParseCallback parseResponse)
{
   error_t error;
   size_t length;
   systime_t timeout;
   systime_t elapsedTime;
   IpAddr ipAddr;

   //The context structure contains a buffer where messages will be formatted
   Dhcpv6Message *message = (Dhcpv6Message *) context->buffer;

   //Generate a 24-bit transaction ID
   context->transactionId = tcpIpStackGetRand() & 0x00FFFFFF;

   //If the client is waiting for an Advertise message, the first RT
   //must be selected to be strictly greater than IRT
   if(context->state == DHCPV6_STATE_SOLICIT)
      context->rt = context->irt + abs(dhcpv6Rand(context->irt));
   else
      context->rt = context->irt + dhcpv6Rand(context->irt);

   //Save the time at which the client sent the first message
   context->exchangeStartTime = osGetTickCount();
   //Total duration of the message exchange
   elapsedTime = 0;

   //Unless MRC is zero, the message exchange fails once
   //the client has transmitted the message MRC times
   for(context->rc = 0; !context->mrc || context->rc < context->mrc; context->rc++)
   {
      //Unless MRD is zero, the message exchange fails once MRD seconds
      //have elapsed since the client first transmitted the message
      if(context->mrd && elapsedTime > context->mrd)
         return ERROR_TIMEOUT;

      //Format client message
      error = formatRequest(context, message, &length);
      //Any error to report?
      if(error) return error;

      //Debug message
      TRACE_INFO("\r\n%s: Sending DHCPv6 message (%" PRIuSIZE " bytes)...\r\n",
         formatSystemTime(osGetTickCount(), NULL), length);
      //Dump the contents of the message for debugging purpose
      dhcpv6DumpMessage(message, length);

      //Destination address
      ipAddr.length = sizeof(Ipv6Addr);
      ipAddr.ipv6Addr = DHCPV6_ALL_RELAY_AGENTS_AND_SERVERS_ADDR;

      //Multicast the message to all DHCPv6 servers and relay agents
      error = socketSendTo(context->socket, &ipAddr,
         DHCPV6_SERVER_PORT, message, length, NULL, 0);
      //Transmission failed?
      if(error) return error;

      //Calculate the maximum time to wait
      timeout = context->rt;
      //Make sure the maximum retransmission duration is not exceeded
      if(context->mrd && (elapsedTime + timeout) > context->mrd)
         timeout = context->mrd - elapsedTime;

      //Wait for a valid message to be received on port 546
      error = dhcpv6WaitForResponse(context, parseResponse, timeout);
      //Check whether a message has been received
      if(error != ERROR_TIMEOUT) return error;

      //If the client has sent a Solicit message, the message exchange
      //is not terminated before the first RT has elapsed
      if(context->state == DHCPV6_STATE_SOLICIT && !context->rc)
      {
         //If any Advertise message has been received, the client
         //immediately completes the message exchange
         if(context->serverPreference >= 0)
            return NO_ERROR;
      }

      //RT is doubled for each subsequent message retransmission
      context->rt = 2 * context->rt + dhcpv6Rand(context->rt);
      //MRT specifies an upper bound on the value of RT. If MRT has
      //a value of 0, there is no upper limit on the value of RT
      if(context->mrt && context->rt > context->mrt)
         context->rt = context->mrt + dhcpv6Rand(context->mrt);

      //Compute the total duration of the message exchange
      elapsedTime = osGetTickCount() - context->exchangeStartTime;
   }

   //The maximum retransmission count has been reached
   return ERROR_TIMEOUT;
}


/**
 * @brief Wait for a valid response from the DHCPv6 server
 * @param[in] context Pointer to the DHCP client context
 * @param[in] parseResponse Callback function responsible for parsing server responses
 * @param[in] timeout Maximum time period to wait
 * @return Error code
 **/

error_t dhcpv6WaitForResponse(Dhcpv6ClientCtx *context,
   Dhcpv6ParseCallback parseResponse, systime_t timeout)
{
   error_t error;
   size_t length;
   systime_t startTime;
   systime_t elapsedTime;
   SocketEventDesc eventDesc;

   //The context contains a buffer where incoming messages can be stored
   Dhcpv6Message *message = (Dhcpv6Message *) context->buffer;

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

      //Message received on port 546?
      if(eventDesc.eventFlags & SOCKET_EVENT_RX_READY)
      {
         //Read the pending message
         error = socketReceiveFrom(context->socket, NULL, NULL,
            message, DHCPV6_MAX_MSG_SIZE, &length, 0);
         //Sanity check
         if(error) return error;

         //Debug message
         TRACE_INFO("\r\n%s: DHCPv6 message received (%" PRIuSIZE " bytes)...\r\n",
            formatSystemTime(osGetTickCount(), NULL), length);
         //Dump the contents of the message for debugging purpose
         dhcpv6DumpMessage(message, length);

         //Parse the received message
         error = parseResponse(context, message, length);

         //Check whether the received message is valid
         if(error != ERROR_INVALID_MESSAGE)
         {
            //If the client has sent a Solicit message, all the Advertise
            //messages must be collected until the first RT has elapsed
            if(context->state == DHCPV6_STATE_SOLICIT && !context->rc)
            {
               //If the client receives an Advertise message that includes a
               //Preference option with a preference value of 255, the client
               //immediately completes the message exchange
               if(context->serverPreference >= DHCPV6_MAX_SERVER_PREFERENCE)
                  return NO_ERROR;
            }
            //Else the message exchange is complete
            else
            {
               //Return status code
               return error;
            }
         }
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
 * @brief Format Solicit message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[out] message Buffer where to format the Solicit message
 * @param[out] length Length of the resulting Solicit message
 * @return Error code
 **/

error_t dhcpv6FormatSolicit(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length)
{
   Dhcpv6IaNaOption iaNaOption;
   Dhcpv6ElapsedTimeOption elapsedTimeOption;

   //Format the Solicit message
   message->msgType = DHCPV6_MSG_TYPE_SOLICIT;
   //The transaction ID is chosen by the client
   STORE24BE(context->transactionId, message->transactionId);
   //Size of the Solicit message
   *length = sizeof(Dhcpv6Message);

   //The client must include a Client Identifier option
   //to identify itself to the server
   dhcpv6AddOption(message, length, DHCPV6_OPTION_CLIENTID,
      context->clientId, context->clientIdLength);

   //Prepare an IA_NA option for a the current interface
   iaNaOption.iaId = htonl(context->interface->id);
   iaNaOption.t1 = 0;
   iaNaOption.t2 = 0;
   //The client includes IA options for any IAs to which
   //it wants the server to assign addresses
   dhcpv6AddOption(message, length, DHCPV6_OPTION_IA_NA,
      &iaNaOption, sizeof(Dhcpv6IaNaOption));

   //The client should include an Option Request option to indicate
   //the options the client is interested in receiving
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ORO,
      &dhcpv6OptionList, sizeof(dhcpv6OptionList));

   //Compute the time elapsed since the client sent the first message
   elapsedTimeOption.value = dhcpv6ComputeElapsedTime(context);
   //The client must include an Elapsed Time option in messages to indicate
   //how long the client has been trying to complete a DHCP message exchange
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ELAPSED_TIME,
      &elapsedTimeOption, sizeof(Dhcpv6ElapsedTimeOption));

   //Check whether rapid commit is enabled
   if(context->rapidCommit)
   {
      //Include the Rapid Commit option if the client is prepared
      //to perform the Solicit/Reply message exchange
      dhcpv6AddOption(message, length, DHCPV6_OPTION_RAPID_COMMIT, NULL, 0);
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Format Request message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[out] message Buffer where to format the Request message
 * @param[out] length Length of the resulting Request message
 * @return Error code
 **/

error_t dhcpv6FormatRequest(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length)
{
   Dhcpv6IaNaOption iaNaOption;
   Dhcpv6ElapsedTimeOption elapsedTimeOption;

   //Format the Request message
   message->msgType = DHCPV6_MSG_TYPE_REQUEST;
   //The transaction ID is chosen by the client
   STORE24BE(context->transactionId, message->transactionId);
   //Size of the Request message
   *length = sizeof(Dhcpv6Message);

   //The client must include a Client Identifier option
   //to identify itself to the server
   dhcpv6AddOption(message, length, DHCPV6_OPTION_CLIENTID,
      context->clientId, context->clientIdLength);

   //The client places the identifier of the destination
   //server in a Server Identifier option
   dhcpv6AddOption(message, length, DHCPV6_OPTION_SERVERID,
      context->serverId, context->serverIdLength);

   //Prepare an IA_NA option
   iaNaOption.iaId = htonl(context->interface->id);
   iaNaOption.t1 = 0;
   iaNaOption.t2 = 0;
   //The client includes IA options for any IAs to which
   //it wants the server to assign addresses
   dhcpv6AddOption(message, length, DHCPV6_OPTION_IA_NA,
      &iaNaOption, sizeof(Dhcpv6IaNaOption));

   //The client must include an Option Request option to indicate
   //the options the client is interested in receiving
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ORO,
      &dhcpv6OptionList, sizeof(dhcpv6OptionList));

   //Compute the time elapsed since the client sent the first message
   elapsedTimeOption.value = dhcpv6ComputeElapsedTime(context);
   //The client must include an Elapsed Time option in messages to indicate
   //how long the client has been trying to complete a DHCP message exchange
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ELAPSED_TIME,
      &elapsedTimeOption, sizeof(Dhcpv6ElapsedTimeOption));

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Format Confirm message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[out] message Buffer where to format the Confirm message
 * @param[out] length Length of the resulting Confirm message
 * @return Error code
 **/

error_t dhcpv6FormatConfirm(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length)
{
   Dhcpv6Option *option;
   Dhcpv6IaNaOption iaNaOption;
   Dhcpv6IaAddrOption iaAddrOption;
   Dhcpv6ElapsedTimeOption elapsedTimeOption;

   //Format the Confirm message
   message->msgType = DHCPV6_MSG_TYPE_CONFIRM;
   //The transaction ID is chosen by the client
   STORE24BE(context->transactionId, message->transactionId);
   //Size of the Confirm message
   *length = sizeof(Dhcpv6Message);

   //The client must include a Client Identifier option
   //to identify itself to the server
   dhcpv6AddOption(message, length, DHCPV6_OPTION_CLIENTID,
      context->clientId, context->clientIdLength);

   //Prepare an IA_NA option
   iaNaOption.iaId = htonl(context->interface->id);
   iaNaOption.t1 = 0;
   iaNaOption.t2 = 0;
   //The client includes any IAs assigned to the interface
   //that may have moved to a new link
   option = dhcpv6AddOption(message, length, DHCPV6_OPTION_IA_NA,
      &iaNaOption, sizeof(Dhcpv6IaNaOption));

   //Prepare an IA Address option
   iaAddrOption.address = context->interface->ipv6Config.globalAddr;
   iaAddrOption.preferredLifetime = 0;
   iaAddrOption.validLifetime = 0;
   //Include the address currently assigned to the IA
   dhcpv6AddSubOption(option, length, DHCPV6_OPTION_IAADDR,
      &iaAddrOption, sizeof(iaAddrOption));

   //The client must include an Option Request option to indicate
   //the options the client is interested in receiving
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ORO,
      &dhcpv6OptionList, sizeof(dhcpv6OptionList));

   //Compute the time elapsed since the client sent the first message
   elapsedTimeOption.value = dhcpv6ComputeElapsedTime(context);
   //The client must include an Elapsed Time option in messages to indicate
   //how long the client has been trying to complete a DHCP message exchange
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ELAPSED_TIME,
      &elapsedTimeOption, sizeof(Dhcpv6ElapsedTimeOption));

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Format Renew message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[out] message Buffer where to format the Renew message
 * @param[out] length Length of the resulting Renew message
 * @return Error code
 **/

error_t dhcpv6FormatRenew(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length)
{
   Dhcpv6Option *option;
   Dhcpv6IaNaOption iaNaOption;
   Dhcpv6IaAddrOption iaAddrOption;
   Dhcpv6ElapsedTimeOption elapsedTimeOption;

   //Format the Renew message
   message->msgType = DHCPV6_MSG_TYPE_RENEW;
   //The transaction ID is chosen by the client
   STORE24BE(context->transactionId, message->transactionId);
   //Size of the Renew message
   *length = sizeof(Dhcpv6Message);

   //The client must include a Client Identifier option
   //to identify itself to the server
   dhcpv6AddOption(message, length, DHCPV6_OPTION_CLIENTID,
      context->clientId, context->clientIdLength);

   //The client places the identifier of the destination
   //server in a Server Identifier option
   dhcpv6AddOption(message, length, DHCPV6_OPTION_SERVERID,
      context->serverId, context->serverIdLength);

   //Prepare an IA_NA option
   iaNaOption.iaId = htonl(context->interface->id);
   iaNaOption.t1 = 0;
   iaNaOption.t2 = 0;
   //The client includes an IA option with all addresses
   //currently assigned to the IA in its Renew message
   option = dhcpv6AddOption(message, length, DHCPV6_OPTION_IA_NA,
      &iaNaOption, sizeof(Dhcpv6IaNaOption));

   //Prepare an IA Address option
   iaAddrOption.address = context->interface->ipv6Config.globalAddr;
   iaAddrOption.preferredLifetime = 0;
   iaAddrOption.validLifetime = 0;
   //Include the address currently assigned to the IA
   dhcpv6AddSubOption(option, length, DHCPV6_OPTION_IAADDR,
      &iaAddrOption, sizeof(iaAddrOption));

   //The client must include an Option Request option to indicate
   //the options the client is interested in receiving
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ORO,
      &dhcpv6OptionList, sizeof(dhcpv6OptionList));

   //Compute the time elapsed since the client sent the first message
   elapsedTimeOption.value = dhcpv6ComputeElapsedTime(context);
   //The client must include an Elapsed Time option in messages to indicate
   //how long the client has been trying to complete a DHCP message exchange
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ELAPSED_TIME,
      &elapsedTimeOption, sizeof(Dhcpv6ElapsedTimeOption));

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Format Rebind message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[out] message Buffer where to format the Rebind message
 * @param[out] length Length of the resulting Rebind message
 * @return Error code
 **/

error_t dhcpv6FormatRebind(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length)
{
   Dhcpv6Option *option;
   Dhcpv6IaNaOption iaNaOption;
   Dhcpv6IaAddrOption iaAddrOption;
   Dhcpv6ElapsedTimeOption elapsedTimeOption;

   //Format the Rebind message
   message->msgType = DHCPV6_MSG_TYPE_REBIND;
   //The transaction ID is chosen by the client
   STORE24BE(context->transactionId, message->transactionId);
   //Size of the Rebind message
   *length = sizeof(Dhcpv6Message);

   //The client must include a Client Identifier option
   //to identify itself to the server
   dhcpv6AddOption(message, length, DHCPV6_OPTION_CLIENTID,
      context->clientId, context->clientIdLength);

   //Prepare an IA_NA option
   iaNaOption.iaId = htonl(context->interface->id);
   iaNaOption.t1 = 0;
   iaNaOption.t2 = 0;
   //The client includes an IA option with all addresses
   //currently assigned to the IA in its Rebind message
   option = dhcpv6AddOption(message, length, DHCPV6_OPTION_IA_NA,
      &iaNaOption, sizeof(Dhcpv6IaNaOption));

   //Prepare an IA Address option
   iaAddrOption.address = context->interface->ipv6Config.globalAddr;
   iaAddrOption.preferredLifetime = 0;
   iaAddrOption.validLifetime = 0;
   //Include the address currently assigned to the IA
   dhcpv6AddSubOption(option, length, DHCPV6_OPTION_IAADDR,
      &iaAddrOption, sizeof(iaAddrOption));

   //The client must include an Option Request option to indicate
   //the options the client is interested in receiving
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ORO,
      &dhcpv6OptionList, sizeof(dhcpv6OptionList));

   //Compute the time elapsed since the client sent the first message
   elapsedTimeOption.value = dhcpv6ComputeElapsedTime(context);
   //The client must include an Elapsed Time option in messages to indicate
   //how long the client has been trying to complete a DHCP message exchange
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ELAPSED_TIME,
      &elapsedTimeOption, sizeof(Dhcpv6ElapsedTimeOption));

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Format Decline message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[out] message Buffer where to format the Decline message
 * @param[out] length Length of the resulting Decline message
 * @return Error code
 **/

error_t dhcpv6FormatDecline(Dhcpv6ClientCtx *context, Dhcpv6Message *message, size_t *length)
{
   Dhcpv6Option *option;
   Dhcpv6IaNaOption iaNaOption;
   Dhcpv6IaAddrOption iaAddrOption;
   Dhcpv6ElapsedTimeOption elapsedTimeOption;

   //Format the Decline message
   message->msgType = DHCPV6_MSG_TYPE_DECLINE;
   //The transaction ID is chosen by the client
   STORE24BE(context->transactionId, message->transactionId);
   //Size of the Decline message
   *length = sizeof(Dhcpv6Message);

   //The client must include a Client Identifier option
   //to identify itself to the server
   dhcpv6AddOption(message, length, DHCPV6_OPTION_CLIENTID,
      context->clientId, context->clientIdLength);

   //The client places the identifier of the server that
   //allocated the address in a Server Identifier option
   dhcpv6AddOption(message, length, DHCPV6_OPTION_SERVERID,
      context->serverId, context->serverIdLength);

   //Prepare an IA_NA option
   iaNaOption.iaId = htonl(context->interface->id);
   iaNaOption.t1 = 0;
   iaNaOption.t2 = 0;
   //The client includes an IA option with the address it is declining
   option = dhcpv6AddOption(message, length, DHCPV6_OPTION_IA_NA,
      &iaNaOption, sizeof(Dhcpv6IaNaOption));

   //Prepare an IA Address option
   iaAddrOption.address = context->interface->ipv6Config.globalAddr;
   iaAddrOption.preferredLifetime = 0;
   iaAddrOption.validLifetime = 0;
   //Include the address the client is declining
   dhcpv6AddSubOption(option, length, DHCPV6_OPTION_IAADDR,
      &iaAddrOption, sizeof(iaAddrOption));

   //Compute the time elapsed since the client sent the first message
   elapsedTimeOption.value = dhcpv6ComputeElapsedTime(context);
   //The client must include an Elapsed Time option in messages to indicate
   //how long the client has been trying to complete a DHCP message exchange
   dhcpv6AddOption(message, length, DHCPV6_OPTION_ELAPSED_TIME,
      &elapsedTimeOption, sizeof(Dhcpv6ElapsedTimeOption));

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Parse Advertise message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[in] message Pointer to the incoming message to parse
 * @param[in] length Length of the incoming message
 * @return Error code
 **/

error_t dhcpv6ParseAdvertise(Dhcpv6ClientCtx *context, const Dhcpv6Message *message, size_t length)
{
   error_t error;
   int_t serverPreference;
   Dhcpv6Option *option;
   Dhcpv6Option *serverIdOption;

   //Check whether rapid commit is enabled
   if(context->rapidCommit)
   {
      //Accept a Reply message with committed address assignments
      //and other resources in response to the Solicit message
      error = dhcpv6ParseReply(context, message, length);

      //The client terminates the waiting process as soon as a Reply
      //message with a Rapid Commit option is received
      if(!error) return NO_ERROR;
   }

   //Check the length of the DHCPv6 message
   if(length < sizeof(Dhcpv6Message))
      return ERROR_INVALID_MESSAGE;
   //Check the message type
   if(message->msgType != DHCPV6_MSG_TYPE_ADVERTISE)
      return ERROR_INVALID_MESSAGE;
   //Discard any received packet that does not match the transaction ID
   if(LOAD24BE(message->transactionId) != context->transactionId)
      return ERROR_INVALID_MESSAGE;

   //Get the length of the Options field
   length -= sizeof(Dhcpv6Message);

   //Search for the Client Identifier option
   option = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_CLIENTID);
   //Discard any received packet that does not include a Client Identifier option
   if(!option || ntohs(option->length) != context->clientIdLength)
      return ERROR_INVALID_MESSAGE;
   //Check whether the Client Identifier matches our identifier
   if(memcmp(option->value, context->clientId, context->clientIdLength))
      return ERROR_INVALID_MESSAGE;

   //Search for the Server Identifier option
   serverIdOption = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_SERVERID);
   //Discard any received packet that does not include a Server Identifier option
   if(!serverIdOption || !serverIdOption->length)
      return ERROR_INVALID_MESSAGE;
   //Check the length of the server DUID
   if(ntohs(serverIdOption->length) >= DHCPV6_MAX_DUID_SIZE)
      return ERROR_INVALID_MESSAGE;

   //Get the status code returned by the server
   error = dhcpv6ParseStatusCodeOption(message->options, length);
   //The client must ignore any Advertise message that includes
   //a Status Code option containing the value NoAddrsAvail
   if(error) return ERROR_INVALID_MESSAGE;

   //Search for the Preference option
   option = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_PREFERENCE);
   //Check whether the option has been found
   if(option && ntohs(option->length) == sizeof(Dhcpv6PreferenceOption))
   {
      //Server server preference value
      serverPreference = option->value[0];
   }
   else
   {
      //Any Advertise that does not include a Preference option
      //is considered to have a preference value of 0
      serverPreference = 0;
   }

   //Select the Advertise message that offers the highest server preference value
   if(serverPreference > context->serverPreference)
   {
      //Record the server preference value
      context->serverPreference = serverPreference;
      //Save the length of the DUID
      context->serverIdLength = ntohs(serverIdOption->length);
      //Save the server DUID
      memcpy(context->serverId, serverIdOption->value, context->serverIdLength);
   }

   //The Advertise message was successfully parsed
   return NO_ERROR;
}


/**
 * @brief Parse Reply message
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[in] message Pointer to the incoming message to parse
 * @param[in] length Length of the incoming message
 * @return Error code
 **/

error_t dhcpv6ParseReply(Dhcpv6ClientCtx *context, const Dhcpv6Message *message, size_t length)
{
   error_t error;
   uint_t i;
   uint_t n;
   Dhcpv6Option *option;
   Dhcpv6Option *serverIdOption;

   //Check the length of the DHCPv6 message
   if(length < sizeof(Dhcpv6Message))
      return ERROR_INVALID_MESSAGE;
   //Check the message type
   if(message->msgType != DHCPV6_MSG_TYPE_REPLY)
      return ERROR_INVALID_MESSAGE;
   //Discard any received packet that does not match the transaction ID
   if(LOAD24BE(message->transactionId) != context->transactionId)
      return ERROR_INVALID_MESSAGE;

   //Get the length of the Options field
   length -= sizeof(Dhcpv6Message);

   //Search for the Client Identifier option
   option = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_CLIENTID);
   //Discard any received packet that does not include a Client Identifier option
   if(!option || ntohs(option->length) != context->clientIdLength)
      return ERROR_INVALID_MESSAGE;
   //Check whether the Client Identifier matches our identifier
   if(memcmp(option->value, context->clientId, context->clientIdLength))
      return ERROR_INVALID_MESSAGE;

   //Search for the Server Identifier option
   serverIdOption = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_SERVERID);
   //Discard any received packet that does not include a Server Identifier option
   if(!serverIdOption || !serverIdOption->length)
      return ERROR_INVALID_MESSAGE;
   //Check the length of the server DUID
   if(ntohs(serverIdOption->length) >= DHCPV6_MAX_DUID_SIZE)
      return ERROR_INVALID_MESSAGE;

   //The Reply message is received in response to a Solicit message?
   if(context->state == DHCPV6_STATE_SOLICIT)
   {
      //A Reply message is not acceptable when rapid commit is disallowed
      if(!context->rapidCommit)
         return ERROR_INVALID_MESSAGE;

      //Search for the Rapid Commit option
      option = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_RAPID_COMMIT);
      //The client discards any message that does not include a Rapid Commit option
      if(!option || ntohs(option->length) != 0)
         return ERROR_INVALID_MESSAGE;

      //Save the length of the DUID
      context->serverIdLength = ntohs(serverIdOption->length);
      //Save the server DUID
      memcpy(context->serverId, serverIdOption->value, context->serverIdLength);
   }
   //The Reply message is received in response to a Request or a Renew message?
   else if(context->state == DHCPV6_STATE_REQUEST || context->state == DHCPV6_STATE_RENEW)
   {
      //Compare DUID lengths
      if(ntohs(serverIdOption->length) != context->serverIdLength)
         return ERROR_INVALID_MESSAGE;
      //Unexpected server DUID?
      if(memcmp(serverIdOption->value, context->serverId, context->serverIdLength))
         return ERROR_INVALID_MESSAGE;
   }
   //The Reply message is received in response to a Confirm or a Rebind message?
   else
   {
      //Do not check the server DUID when the Reply message is
      //received in response to a Confirm or a Rebind message
   }

   //Search for the Status Code option
   error = dhcpv6ParseStatusCodeOption(message->options, length);
   //Check the status code returned by the server
   if(error) return error;

   //Loop through DHCPv6 options
   for(i = 0; i < length; i += sizeof(Dhcpv6Option) + ntohs(option->length))
   {
      //Search for an IA_NA option
      option = dhcpv6GetOption(message->options + i, length - i, DHCPV6_OPTION_IA_NA);
      //Unable to find the specified option?
      if(!option) break;

      //Parse the contents of the IA_NA option
      error = dhcpv6ParseIaNaOption(context, option);
      //If an invalid option is received, the client discards
      //the option and process the rest of the message...
      if(!error)
      {
         //Save the time a which the lease was obtained
         context->leaseStartTime = osGetTickCount();

         //Save the length of the DUID
         context->serverIdLength = ntohs(serverIdOption->length);
         //Save the server DUID
         memcpy(context->serverId, serverIdOption->value, context->serverIdLength);

         //Search for DNS Servers option
         option = dhcpv6GetOption(message->options, length, DHCPV6_OPTION_DNS_SERVERS);
         //Check whether the message includes a DNS Servers option
         if(option && !(ntohs(option->length) % sizeof(Ipv6Addr)))
         {
            //Get the number of addresses provided in the response
            n = ntohs(option->length) / sizeof(Ipv6Addr);
            //Only a limited set of DNS servers is supported
            n = min(n, IPV6_MAX_DNS_SERVERS);
            //Record DNS server addresses
            memcpy(context->interface->ipv6Config.dnsServer, option->value, n * sizeof(Ipv6Addr));
            //Save the number of DNS servers
            context->interface->ipv6Config.dnsServerCount = n;
         }

         //The Reply message is received in response to a Solicit message?
         if(context->state == DHCPV6_STATE_SOLICIT)
         {
            //The client terminates the waiting process as soon as a Reply
            //message with a Rapid Commit option is received
            context->serverPreference = DHCPV6_MAX_SERVER_PREFERENCE;
            //The rapid commit procedure is done
            context->rapidCommitDone = TRUE;
         }

         //The Reply message was successfully parsed
         return NO_ERROR;
      }
   }

   //The Reply message contains no valid IA_NA option
   return ERROR_INVALID_MESSAGE;
}


/**
 * @brief Parse IA_NA option
 * @param[in] context Pointer to the DHCPv6 client context
 * @param[in] option Pointer to the IA_NA option to parse
 * @return Error code
 **/

error_t dhcpv6ParseIaNaOption(Dhcpv6ClientCtx *context, const Dhcpv6Option *option)
{
   error_t error;
   size_t length;
   Dhcpv6Option *subOption;
   Dhcpv6IaNaOption *iaNaOption;
   Dhcpv6IaAddrOption *iaAddrOption;

   //Make sure the IA_NA option is valid
   if(ntohs(option->length) < sizeof(Dhcpv6IaNaOption))
      return ERROR_INVALID_OPTION;

   //Get the parameters associated with the IA_NA
   iaNaOption = (Dhcpv6IaNaOption *) option->value;
   //Compute the length of IA_NA Options field
   length = ntohs(option->length) - sizeof(Dhcpv6IaNaOption);

   //Check the IA identifier
   if(ntohl(iaNaOption->iaId) != context->interface->id)
      return ERROR_INVALID_OPTION;

   //If a client receives an IA_NA with T1 greater than T2, and both T1
   //and T2 are greater than 0, the client discards the IA_NA option and
   //processes the remainder of the message as though the server had not
   //included the invalid IA_NA option
   if(ntohl(iaNaOption->t1) > ntohl(iaNaOption->t2) && ntohl(iaNaOption->t2) > 0)
      return ERROR_INVALID_OPTION;

   //The client examines the status code in each IA individually
   error = dhcpv6ParseStatusCodeOption(iaNaOption->options, length);
   //If the status code is NoAddrsAvail, the client has received
   //no usable address in the IA
   if(error) return ERROR_INVALID_OPTION;

   //Get the address assigned to the IA
   subOption = dhcpv6GetOption(iaNaOption->options, length, DHCPV6_OPTION_IAADDR);
   //Failed to retrieve the IA Address option?
   if(!subOption || ntohs(subOption->length) < sizeof(Dhcpv6IaAddrOption))
      return ERROR_INVALID_OPTION;

   //Point to the contents of the IA Address option
   iaAddrOption = (Dhcpv6IaAddrOption *) subOption->value;
   //Compute the length of IA Address Options field
   length = ntohs(subOption->length) - sizeof(Dhcpv6IaAddrOption);

   //A client discards any addresses for which the preferred lifetime
   //is greater than the valid lifetime
   if(ntohl(iaAddrOption->preferredLifetime) > ntohl(iaAddrOption->validLifetime))
      return ERROR_INVALID_OPTION;

   //Record T1 and T2 times
   context->t1 = ntohl(iaNaOption->t1);
   context->t2 = ntohl(iaNaOption->t2);
   //Update preferred and valid lifetimes
   context->preferredLifetime = ntohl(iaAddrOption->preferredLifetime);
   context->validLifetime = ntohl(iaAddrOption->validLifetime);
   //Configure the global IPv6 address
   context->interface->ipv6Config.globalAddr = iaAddrOption->address;

   //If T1 or T2 is set to 0 by the server, the client may send a Renew
   //or Rebind message at the client's discretion
   if(!context->t1)
      context->t1 = context->preferredLifetime / 2;
   if(!context->t2)
      context->t2 = context->t1 + context->t1 / 2;

   //The IA_NA option was successfully parsed
   return NO_ERROR;
}


/**
 * @brief Compute the time elapsed since the client sent the first message
 * @param[in] context Pointer to the DHCPv6 client context
 * @return The elapsed time expressed in hundredths of a second
 **/

uint16_t dhcpv6ComputeElapsedTime(Dhcpv6ClientCtx *context)
{
   systime_t time = 0;

   //The elapsed time must be 0 for the first message
   if(context->rc > 0)
   {
      //Compute the time elapsed since the client sent the
      //first message (in hundredths of a second)
      time = (osGetTickCount() - context->exchangeStartTime) / 10;

      //The value 0xFFFF is used to represent any elapsed time values
      //greater than the largest time value that can be represented
      if(time > 0xFFFF) time = 0xFFFF;
   }

   //Convert the 16-bit value to network byte order
   return htons((uint16_t) time);
}


/**
 * @brief Multiplication by a randomization factor
 *
 * Each of the computations of a new RT include a randomization factor
 * RAND, which is a random number chosen with a uniform distribution
 * between -0.1 and +0.1. The randomization factor is included to
 * minimize synchronization of messages transmitted by DHCPv6 clients
 *
 * @param[in] value Input value
 * @return Value resulting from the randomization process
 **/

int32_t dhcpv6Rand(int32_t value)
{
   //Use a randomization factor chosen with a uniform
   //distribution between -0.1 and +0.1
   return value * dhcpv6RandRange(-100, 100) / 1000;
}


/**
 * @brief Get a random value in the specified range
 * @param[in] min Lower bound
 * @param[in] max Upper bound
 * @return Random value in the specified range
 **/

int32_t dhcpv6RandRange(int32_t min, int32_t max)
{
   //Return a random value in the given range
   return min + tcpIpStackGetRand() % (max - min + 1);
}


/**
 * @brief Dump DHCPv6 configuration for debugging purpose
 * @param[in] context Pointer to the DHCPv6 client context
 **/

void dhcpv6DumpConfig(Dhcpv6ClientCtx *context)
{
   //Dump current DHCPv6 configuration
   TRACE_INFO("\r\nDHCPv6 configuration:\r\n");
   TRACE_INFO("  IPv6 Global Address = %s\r\n", ipv6AddrToString(&context->interface->ipv6Config.globalAddr, NULL));
   TRACE_INFO("  Lease Start Time = %s\r\n", formatSystemTime(context->leaseStartTime, NULL));
   TRACE_INFO("  T1 = %" PRIu32 "s\r\n", context->t1);
   TRACE_INFO("  T2 = %" PRIu32 "s\r\n", context->t2);
   TRACE_INFO("  Preferred Lifetime = %" PRIu32 "s\r\n", context->preferredLifetime);
   TRACE_INFO("  Valid Lifetime = %" PRIu32 "s\r\n", context->validLifetime);

   //Display DNS servers
   if(context->interface->ipv6Config.dnsServerCount >= 1)
      TRACE_INFO("  Primary DNS = %s\r\n", ipv6AddrToString(&context->interface->ipv6Config.dnsServer[0], NULL));
   if(context->interface->ipv6Config.dnsServerCount >= 2)
      TRACE_INFO("  Secondary DNS = %s\r\n", ipv6AddrToString(&context->interface->ipv6Config.dnsServer[1], NULL));
}

#endif
