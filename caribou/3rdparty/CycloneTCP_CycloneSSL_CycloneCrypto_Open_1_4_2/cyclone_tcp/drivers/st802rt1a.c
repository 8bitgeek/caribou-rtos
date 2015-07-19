/**
 * @file st802rt1a.c
 * @brief ST802RT1A Ethernet PHY transceiver
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

//Switch to the appropriate trace level
#define TRACE_LEVEL NIC_TRACE_LEVEL

//MCBSTM32F400 evaluation board?
#if defined(USE_MCBSTM32F400)
   #include "stm32f4xx.h"
   #include "stm32f4xx_gpio.h"
   #include "stm32f4xx_rcc.h"
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "st802rt1a.h"
#include "debug.h"


/**
 * @brief ST802RT1A Ethernet PHY driver
 **/

const PhyDriver st802rt1aPhyDriver =
{
   st802rt1aInit,
   st802rt1aTick,
   st802rt1aEnableIrq,
   st802rt1aDisableIrq,
   st802rt1aEventHandler,
};


/**
 * @brief ST802RT1A PHY transceiver initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t st802rt1aInit(NetInterface *interface)
{
   //Debug message
   TRACE_INFO("Initializing ST802RT1A...\r\n");

   //Reset PHY transceiver
   st802rt1aWritePhyReg(interface, ST802RT1A_PHY_REG_RN00, RN00_SOFT_RESET);
   //Wait for the reset to complete
   while(st802rt1aReadPhyReg(interface, ST802RT1A_PHY_REG_RN00) & RN00_SOFT_RESET);

   //Dump PHY registers for debugging purpose
   st802rt1aDumpPhyReg(interface);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief ST802RT1A timer handler
 * @param[in] interface Underlying network interface
 **/

void st802rt1aTick(NetInterface *interface)
{
//MCBSTM32F400 evaluation board?
#if defined(USE_MCBSTM32F400)
   uint16_t value;
   bool_t linkState;

   //Read status register
   value = st802rt1aReadPhyReg(interface, ST802RT1A_PHY_REG_RN01);
   //Retrieve current link state
   linkState = (value & RN01_LINK_STATUS) ? TRUE : FALSE;

   //Link up event?
   if(linkState && !interface->linkState)
   {
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSet(interface->nicRxEvent);
   }
   //Link down event?
   else if(!linkState && interface->linkState)
   {
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSet(interface->nicRxEvent);
   }
#endif
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void st802rt1aEnableIrq(NetInterface *interface)
{
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void st802rt1aDisableIrq(NetInterface *interface)
{
}


/**
 * @brief ST802RT1A interrupt service routine
 **/

void st802rt1aInterrupt(void)
{
}


/**
 * @brief ST802RT1A event handler
 * @param[in] interface Underlying network interface
 * @return TRUE if a link state change notification is received
 **/

bool_t st802rt1aEventHandler(NetInterface *interface)
{
//MCBSTM32F400 evaluation board?
#if defined(USE_MCBSTM32F400)
   uint16_t value;
   bool_t linkState;

   //Read status register
   value = st802rt1aReadPhyReg(interface, ST802RT1A_PHY_REG_RN01);
   //Retrieve current link state
   linkState = (value & RN01_LINK_STATUS) ? TRUE : FALSE;

   ///Link is up?
   if(linkState && !interface->linkState)
   {
      //Read RN13 register
      value = st802rt1aReadPhyReg(interface, ST802RT1A_PHY_REG_RN13);

      //Check current operation mode
      switch(value & RN13_CMODE_MASK)
      {
      //10BASE-T
      case RN13_CMODE_10BT:
         interface->speed100 = FALSE;
         interface->fullDuplex = FALSE;
         break;
      //10BASE-T full-duplex
      case RN13_CMODE_10BT_FD:
         interface->speed100 = FALSE;
         interface->fullDuplex = TRUE;
         break;
      //100BASE-TX
      case RN13_CMODE_100BTX:
         interface->speed100 = TRUE;
         interface->fullDuplex = FALSE;
         break;
      //100BASE-TX full-duplex
      case RN13_CMODE_100BTX_FD:
         interface->speed100 = TRUE;
         interface->fullDuplex = TRUE;
         break;
      //Unknown operation mode
      default:
         //Debug message
         TRACE_WARNING("Invalid Duplex mode\r\n");
         break;
      }

      //Update link state
      interface->linkState = TRUE;
      //Display link state
      TRACE_INFO("Link is up (%s)...\r\n", interface->name);

      //Display actual speed and duplex mode
      TRACE_INFO("%s %s\r\n",
         interface->speed100 ? "100BASE-TX" : "10BASE-T",
         interface->fullDuplex ? "Full-Duplex" : "Half-Duplex");

      //Notify the user that the link state has changed
      return TRUE;
   }
   //Link is down?
   else if(!linkState && interface->linkState)
   {
      //Update link state
      interface->linkState = FALSE;
      //Display link state
      TRACE_INFO("Link is down (%s)...\r\n", interface->name);

      //Notify the user that the link state has changed
      return TRUE;
   }
   else
   {
      //No link state change...
      return FALSE;
   }
#endif
}


/**
 * @brief Write PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address Register address
 * @param[in] data Register value
 **/

void st802rt1aWritePhyReg(NetInterface *interface, uint8_t address, uint16_t data)
{
   //Write the specified PHY register
   interface->nicDriver->writePhyReg(ST802RT1A_PHY_ADDR, address, data);
}


/**
 * @brief Read PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t st802rt1aReadPhyReg(NetInterface *interface, uint8_t address)
{
   //Read the specified PHY register
   return interface->nicDriver->readPhyReg(ST802RT1A_PHY_ADDR, address);
}


/**
 * @brief Dump PHY registers for debugging purpose
 * @param[in] interface Underlying network interface
 **/

void st802rt1aDumpPhyReg(NetInterface *interface)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, st802rt1aReadPhyReg(interface, i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
