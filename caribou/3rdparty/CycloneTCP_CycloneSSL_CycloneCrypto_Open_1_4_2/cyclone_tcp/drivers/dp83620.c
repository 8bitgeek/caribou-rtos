/**
 * @file dp83620.c
 * @brief DP83620 Ethernet PHY transceiver
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

//RX63N Demonstration Kit?
#if defined(USE_RDK_RX63N)
   #include <iorx63n.h>
   #include <intrinsics.h>
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "dp83620.h"
#include "debug.h"


/**
 * @brief DP83620 Ethernet PHY driver
 **/

const PhyDriver dp83620PhyDriver =
{
   dp83620Init,
   dp83620Tick,
   dp83620EnableIrq,
   dp83620DisableIrq,
   dp83620EventHandler,
};


/**
 * @brief DP83620 PHY transceiver initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t dp83620Init(NetInterface *interface)
{
   //Debug message
   TRACE_INFO("Initializing DP83620...\r\n");

//RX63N Demonstration Kit?
#if defined(USE_RDK_RX63N)
   //Configure reset pin as an output
   //PORTC.PDR.BIT.B3 = 1;
   //Reset the PHY transceiver by asserting RST pin
   //PORTC.PODR.BIT.B3 = 1;
   //sleep(10);
   //Take the PHY transceiver out of reset
   //PORTC.PODR.BIT.B3 = 0;

   //Make sure IQR15 interrupt is disabled
   IEN(ICU, IRQ15) = 0;
   //Disable digital filter
   ICU.IRQFLTE1.BIT.FLTEN15 = 0;

   //Unlock MPC registers
   MPC.PWPR.BIT.B0WI = 0;
   MPC.PWPR.BIT.PFSWE = 1;

   //Configure IRQ15 (P07) as an input
   PORT0.PDR.BIT.B7 = 0;
   PORT0.PMR.BIT.B7 = 0;
   MPC.P07PFS.BYTE  = 0x40;

   //Lock MPC registers
   MPC.PWPR.BIT.PFSWE = 0;
   MPC.PWPR.BIT.B0WI = 0;

   //Set digital filter sampling clock (PCLK)
   ICU.IRQFLTC1.BIT.FCLKSEL15 = 0;
   //Enable digital filter
   ICU.IRQFLTE1.BIT.FLTEN15 = 1;
   //Configure IRQ15 polarity (falling edge)
   ICU.IRQCR[15].BIT.IRQMD = 1;

   //Configure IRQ15 interrupt priority
   IPR(ICU, IRQ15) = 1;
   //Clear interrupt flag
   IR(ICU, IRQ15) = 0;
#endif

   //A software reset is accomplished by setting the RESET bit of the BMCR register
   dp83620WritePhyReg(interface, DP83620_PHY_REG_BMCR, BMCR_RESET);
   //Wait for the reset to complete
   while(dp83620ReadPhyReg(interface, DP83620_PHY_REG_BMCR) & BMCR_RESET);

   //Dump PHY registers for debugging purpose
   dp83620DumpPhyReg(interface);

   //Configure PWR_DOWN/INT pin as an interrupt output
   dp83620WritePhyReg(interface, DP83620_PHY_REG_MICR, MICR_INTEN | MICR_INT_OE);
   //The PHY will generate interrupts when link status changes are detected
   dp83620WritePhyReg(interface, DP83620_PHY_REG_MISR, MISR_LINK_INT_EN);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief DP83620 timer handler
 * @param[in] interface Underlying network interface
 **/

void dp83620Tick(NetInterface *interface)
{
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void dp83620EnableIrq(NetInterface *interface)
{
//RX63N Demonstration Kit?
#if defined(USE_RDK_RX63N)
   //Enable PHY transceiver interrupts
   IEN(ICU, IRQ15) = 1;
#endif
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void dp83620DisableIrq(NetInterface *interface)
{
//RX63N Demonstration Kit?
#if defined(USE_RDK_RX63N)
   //Disable PHY transceiver interrupts
   IEN(ICU, IRQ15) = 0;
#endif
}


/**
 * @brief DP83620 interrupt service routine
 **/

//RX63N Demonstration Kit?
#if defined(USE_RDK_RX63N)

#pragma vector = VECT_ICU_IRQ15
__interrupt void dp83620Interrupt(void)
{
   NetInterface *interface;

   //Allow nested interrupts
   __enable_interrupt();

   //Point to the structure describing the network interface
   interface = &netInterface[0];
   //A PHY event is pending...
   interface->phyEvent = TRUE;
   //Notify the user that the link state has changed
   osEventSetFromIrq(interface->nicRxEvent);
}

#endif


/**
 * @brief DP83620 event handler
 * @param[in] interface Underlying network interface
 * @return TRUE if a link state change notification is received
 **/

bool_t dp83620EventHandler(NetInterface *interface)
{
   uint16_t status;

   //Read status register to acknowledge the interrupt
   status = dp83620ReadPhyReg(interface, DP83620_PHY_REG_MISR);

   //Link status change?
   if(status & MISR_LINK_INT)
   {
      //Read PHY status register
      status = dp83620ReadPhyReg(interface, DP83620_PHY_REG_PHYSTS);

      //Link is up?
      if(status & PHYSTS_LINK_STATUS)
      {
         //Check current speed
         interface->speed100 = (status & PHYSTS_SPEED_STATUS) ? FALSE : TRUE;
         //Check duplex mode
         interface->fullDuplex = (status & PHYSTS_DUPLEX_STATUS) ? TRUE : FALSE;
         //Update link state
         interface->linkState = TRUE;

         //Display link state
         TRACE_INFO("Link is up (%s)...\r\n", interface->name);

         //Display actual speed and duplex mode
         TRACE_INFO("%s %s\r\n",
            interface->speed100 ? "100BASE-TX" : "10BASE-T",
            interface->fullDuplex ? "Full-Duplex" : "Half-Duplex");
      }
      else
      {
         //Update link state
         interface->linkState = FALSE;

         //Display link state
         TRACE_INFO("Link is down (%s)...\r\n", interface->name);
      }

      //Notify the user that the link state has changed
      return TRUE;
   }
   else
   {
      //No link state change...
      return FALSE;
   }
}


/**
 * @brief Write PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address Register address
 * @param[in] data Register value
 **/

void dp83620WritePhyReg(NetInterface *interface, uint8_t address, uint16_t data)
{
   //Write the specified PHY register
   interface->nicDriver->writePhyReg(DP83620_PHY_ADDR, address, data);
}


/**
 * @brief Read PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t dp83620ReadPhyReg(NetInterface *interface, uint8_t address)
{
   //Read the specified PHY register
   return interface->nicDriver->readPhyReg(DP83620_PHY_ADDR, address);
}


/**
 * @brief Dump PHY registers for debugging purpose
 * @param[in] interface Underlying network interface
 **/

void dp83620DumpPhyReg(NetInterface *interface)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, dp83620ReadPhyReg(interface, i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
