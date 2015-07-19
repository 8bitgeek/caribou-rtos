/**
 * @file dhcpv6_common.c
 * @brief Functions common to DHCPv6 client, server and relay agent
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
#include "tcp_ip_stack.h"
#include "dhcpv6_common.h"
#include "debug.h"

//Check TCP/IP stack configuration
#if (IPV6_SUPPORT == ENABLED)

//All DHCPv6 relay agents and servers (FF02::1:2)
const Ipv6Addr DHCPV6_ALL_RELAY_AGENTS_AND_SERVERS_ADDR =
   IPV6_ADDR(0xFF02, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001, 0x0002);

//All DHCPv6 servers (FF05::1:3)
const Ipv6Addr DHCPV6_ALL_SERVERS_ADDR =
   IPV6_ADDR(0xFF05, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001, 0x0003);


/**
 * @brief Parse Status Code option
 *
 * This function returns a status indication related to the DHCPv6
 * message or option in which it appears
 *
 * @param[in] options Pointer to the Options field
 * @param[in] length Length of the Options field
 **/

error_t dhcpv6ParseStatusCodeOption(const uint8_t *options, size_t length)
{
   error_t error;
   uint16_t statusCode;
   Dhcpv6Option *option;
   Dhcpv6StatusCodeOption *statusCodeOption;

   //Search for the Status Code option
   option = dhcpv6GetOption(options, length, DHCPV6_OPTION_STATUS_CODE);

   //If the Status Code option does not appear in a message in which the option
   //could appear, the status of the message is assumed to be Success
   if(!option || ntohs(option->length) < sizeof(Dhcpv6StatusCodeOption))
      return NO_ERROR;

   //The option contains a status code and a status message
   statusCodeOption = (Dhcpv6StatusCodeOption *) option->value;
   //Convert status code from network byte order
   statusCode = ntohs(statusCodeOption->statusCode);

   //Check the status code returned by the peer
   switch(statusCode)
   {
   //Success
   case DHCPV6_STATUS_SUCCESS:
      error = NO_ERROR;
      break;
   //Unspecified failure
   case DHCPV6_STATUS_UNSPEC_FAILURE:
      error = ERROR_FAILURE;
      break;
   //Server has no address available to assign to the IA
   case DHCPV6_STATUS_NO_ADDRS_AVAILABLE:
      error = ERROR_NO_ADDRESS;
      break;
   //Client record (binding) unavailable
   case DHCPV6_STATUS_NO_BINDING:
      error = ERROR_NO_BINDING;
      break;
   //The prefix for the address is not appropriate for
   //the link to which the client is attached
   case DHCPV6_STATUS_NOT_ON_LINK:
      error = ERROR_NOT_ON_LINK;
      break;
   //Sent by a server to a client to force the client to send
   //messages to the server using the multicast address
   case DHCPV6_STATUS_USE_MULTICAST:
      error = ERROR_USE_MULTICAST;
      break;
   //Any other failure...
   default:
      error = ERROR_FAILURE;
      break;
   }

   //Return the corresponding error
   return error;
}


/**
 * @brief Add an option to a DHCPv6 message
 * @param[in] message Pointer to the DHCPv6 message
 * @param[in,out] messageLength Length of the overall DHCPv6 message
 * @param[in] optionCode Option code
 * @param[in] optionValue Option value
 * @param[in] optionLength Length of the option value
 * @return If the option was successfully added, a pointer to the freshly
          created option is returned. Otherwise NULL pointer is returned
 **/

Dhcpv6Option *dhcpv6AddOption(void *message, size_t *messageLength,
   uint16_t optionCode, const void *optionValue, uint16_t optionLength)
{
   Dhcpv6Option *option;

   //Make sure there is enough room to add the option
   if((*messageLength + sizeof(Dhcpv6Option) + optionLength) > DHCPV6_MAX_MSG_SIZE)
      return NULL;

   //Point to the end of the DHCPv6 message
   option = (Dhcpv6Option *) ((uint8_t *) message + *messageLength);
   //Write specified option at current location
   option->code = htons(optionCode);
   option->length = htons(optionLength);
   //Copy option data
   memcpy(option->value, optionValue, optionLength);

   //Update the length of the DHCPv6 message
   *messageLength += sizeof(Dhcpv6Option) + optionLength;
   //Return a pointer to the freshly created option
   return option;
}


/**
 * @brief Add a suboption under an existing base option
 * @param[in] baseOption Pointer to the base option
 * @param[in,out] messageLength Length of the overall DHCPv6 message
 * @param[in] optionCode Option code
 * @param[in] optionValue Option value
 * @param[in] optionLength Length of the option value
 * @return If the option was successfully added, a pointer to the freshly
          created option is returned. Otherwise NULL pointer is returned
 **/

Dhcpv6Option *dhcpv6AddSubOption(Dhcpv6Option *baseOption, size_t *messageLength,
   uint16_t optionCode, const void *optionValue, uint16_t optionLength)
{
   uint_t n;
   Dhcpv6Option *option;

   //The pointer to the base option must be valid
   if(!baseOption)
      return NULL;
   //Ensure the length of the DHCPv6 message is acceptable
   if(*messageLength < sizeof(Dhcpv6Message))
      return NULL;
   //Make sure there is enough room to add the option
   if((*messageLength + sizeof(Dhcpv6Option) + optionLength) > DHCPV6_MAX_MSG_SIZE)
      return NULL;

   //Get the actual length of the base option
   n = ntohs(baseOption->length);
   //Point to the location that follows the base option
   option = (Dhcpv6Option *) (baseOption->value + n);

   //Write specified option at current location
   option->code = htons(optionCode);
   option->length = htons(optionLength);
   //Copy option data
   memcpy(option->value, optionValue, optionLength);

   //Update the length of the base option
   n += sizeof(Dhcpv6Option) + optionLength;
   //Convert the 16-bit value to network byte order
   baseOption->length = htons(n);

   //Update the length of the DHCPv6 message
   *messageLength += sizeof(Dhcpv6Option) + optionLength;
   //Return a pointer to the freshly created option
   return option;
}


/**
 * @brief Find the specified option in a DHCPv6 message
 * @param[in] options Pointer to the Options field
 * @param[in] optionsLength Length of the Options field
 * @param[in] optionCode Code of the option to find
 * @return If the specified option was found, a pointer to the corresponding
 *   option is returned. Otherwise NULL pointer is returned
 **/

Dhcpv6Option *dhcpv6GetOption(const uint8_t *options,
   size_t optionsLength, uint16_t optionCode)
{
   uint_t i;
   Dhcpv6Option *option;

   //Parse DHCPv6 options
   for(i = 0; i < optionsLength; )
   {
      //Point to the current option
      option = (Dhcpv6Option *) (options + i);

      //Make sure the option is valid
      if((i + sizeof(Dhcpv6Option)) > optionsLength)
         break;
      //Check the length of the option data
      if((i + sizeof(Dhcpv6Option) + ntohs(option->length)) > optionsLength)
         break;

      //Option code matches the specified one?
      if(ntohs(option->code) == optionCode)
         return option;

      //Jump to the next option
      i += sizeof(Dhcpv6Option) + ntohs(option->length);
   }

   //The specified option code was not found
   return NULL;
}

#endif
