/**
 * @file ksz8721.c
 * @brief KSZ8721 Ethernet PHY transceiver
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

//SAM7-EX256 evaluation board?
#if defined(USE_SAM7_EX256)
   #include "sam7_ex256.h"
//LPC-1766STK evaluation board?
#elif defined(USE_LPC1766_STK)
   #include "lpc1766_stk.h"
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "ksz8721.h"
#include "debug.h"


/**
 * @brief KSZ8721 Ethernet PHY driver
 **/

const PhyDriver ksz8721PhyDriver =
{
   ksz8721Init,
   ksz8721Tick,
   ksz8721EnableIrq,
   ksz8721DisableIrq,
   ksz8721EventHandler,
};


/**
 * @brief KSZ8721 PHY transceiver initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t ksz8721Init(NetInterface *interface)
{
   volatile uint32_t status;

   //Debug message
   TRACE_INFO("Initializing KSZ8721...\r\n");

//SAM7-EX256 evaluation board?
#if defined(USE_SAM7_EX256)
   //Enable PIO peripheral clock
   AT91C_BASE_PMC->PMC_PCER = (1 << AT91D_ID_PIO_PHY_IRQ);

   //Enable pull-up resistor on PHY IRQ pin
   AT91D_BASE_PIO_PHY_IRQ->PIO_PPUER = AT91B_PHY_IRQ;
   //Configure the corresponding pin as an input
   AT91D_BASE_PIO_PHY_IRQ->PIO_ODR = AT91B_PHY_IRQ;
   AT91D_BASE_PIO_PHY_IRQ->PIO_PER = AT91B_PHY_IRQ;
   //Enable interrupts-on-change
   AT91D_BASE_PIO_PHY_IRQ->PIO_IDR = 0xFFFFFFFF;
   AT91D_BASE_PIO_PHY_IRQ->PIO_IER = AT91B_PHY_IRQ;

   //Reset PHY transceiver by asserting NRST pin
   AT91C_BASE_RSTC->RSTC_RMR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_ERSTL_1MS;
   AT91C_BASE_RSTC->RSTC_RCR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_EXTRST;
   //Wait for the reset to complete
   while(!(AT91C_BASE_RSTC->RSTC_RSR & AT91C_RSTC_NRSTL));

   //Delay before accessing PHY transceiver
   sleep(10);

   //Read PIO ISR register to clear any pending interrupt
   status = AT91D_BASE_PIO_PHY_IRQ->PIO_ISR;
   //Configure interrupt controller
   AT91C_BASE_AIC->AIC_SMR[AT91D_ID_PIO_PHY_IRQ] = AT91C_AIC_SRCTYPE_INT_HIGH_LEVEL | AT91C_AIC_PRIOR_LOWEST;
   AT91C_BASE_AIC->AIC_SVR[AT91D_ID_PIO_PHY_IRQ] = (uint32_t) ksz8721Interrupt;

   //Clear PHY IRQ interrupt flag
   AT91C_BASE_AIC->AIC_ICCR = (1 << AT91D_ID_PIO_PHY_IRQ);
#endif

   //Reset PHY transceiver
   ksz8721WritePhyReg(interface, KSZ8721_PHY_REG_BMCR, BMCR_RESET);
   //Wait for the reset to complete
   while(ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_BMCR) & BMCR_RESET);

   //Dump PHY registers for debugging purpose
   ksz8721DumpPhyReg(interface);

   //The PHY will generate interrupts when link status changes are detected
   ksz8721WritePhyReg(interface, KSZ8721_PHY_REG_ICSR, ICSR_LINK_DOWN_IE | ICSR_LINK_UP_IE);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief KSZ8721 timer handler
 * @param[in] interface Underlying network interface
 **/

void ksz8721Tick(NetInterface *interface)
{
//LPC-1766STK evaluation board?
#if defined(USE_LPC1766_STK)
   uint16_t value;
   bool_t linkState;

   //Read basic status register
   value = ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_BMSR);
   //Retrieve current link state
   linkState = (value & BMSR_LINK_STATUS) ? TRUE : FALSE;

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

void ksz8721EnableIrq(NetInterface *interface)
{
//SAM7-EX256 evaluation board?
#if defined(USE_SAM7_EX256)
   //Enable PHY transceiver interrupts
   AT91C_BASE_AIC->AIC_IECR = (1 << AT91D_ID_PIO_PHY_IRQ);
#endif
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void ksz8721DisableIrq(NetInterface *interface)
{
//SAM7-EX256 evaluation board?
#if defined(USE_SAM7_EX256)
   //Disable PHY transceiver interrupts
   AT91C_BASE_AIC->AIC_IDCR = (1 << AT91D_ID_PIO_PHY_IRQ);
#endif
}


/**
 * @brief KSZ8721 interrupt service routine
 **/

//SAM7-EX256 evaluation board?
#if defined(USE_SAM7_EX256)

void __irq ksz8721Interrupt(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Read status register to clear interrupt
   volatile uint_t status = AT91D_BASE_PIO_PHY_IRQ->PIO_ISR;

   //Ensure the PHY IRQ pin is asserted
   if(!(AT91D_BASE_PIO_PHY_IRQ->PIO_PDSR & AT91B_PHY_IRQ))
   {
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSetFromIrq(interface->nicRxEvent);
   }

   //Write AIC_EOICR register before exiting
   AT91C_BASE_AIC->AIC_EOICR = 0;
}

#endif


/**
 * @brief KSZ8721 event handler
 * @param[in] interface Underlying network interface
 * @return TRUE if a link state change notification is received
 **/

bool_t ksz8721EventHandler(NetInterface *interface)
{
//SAM7-EX256 evaluation board?
#if defined(USE_SAM7_EX256)
   uint16_t value;

   //Read status register to acknowledge the interrupt
   value = ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_ICSR);

   //Link status change?
   if(value & (ICSR_LINK_DOWN_IF | ICSR_LINK_UP_IF))
   {
      //Read basic status register
      value = ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_BMSR);

      //Link is up?
      if(value & BMSR_LINK_STATUS)
      {
         //Read PHY control register
         value = ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_PHYCON);

         //Check current operation mode
         switch(value & PHYCON_OP_MODE_MASK)
         {
         //10BASE-T
         case PHYCON_OP_MODE_10BT:
            interface->speed100 = FALSE;
            interface->fullDuplex = FALSE;
            break;
         //10BASE-T full-duplex
         case PHYCON_OP_MODE_10BT_FD:
            interface->speed100 = FALSE;
            interface->fullDuplex = TRUE;
            break;
         //100BASE-TX
         case PHYCON_OP_MODE_100BTX:
            interface->speed100 = TRUE;
            interface->fullDuplex = FALSE;
            break;
         //100BASE-TX full-duplex
         case PHYCON_OP_MODE_100BTX_FD:
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

//LPC-1766STK evaluation board?
#elif defined(USE_LPC1766_STK)
   uint16_t value;
   bool_t linkState;

   //Read basic status register
   value = ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_BMSR);
   //Retrieve current link state
   linkState = (value & BMSR_LINK_STATUS) ? TRUE : FALSE;

   ///Link is up?
   if(linkState && !interface->linkState)
   {
      //Read PHY control register
      value = ksz8721ReadPhyReg(interface, KSZ8721_PHY_REG_PHYCON);

      //Check current operation mode
      switch(value & PHYCON_OP_MODE_MASK)
      {
      //10BASE-T
      case PHYCON_OP_MODE_10BT:
         interface->speed100 = FALSE;
         interface->fullDuplex = FALSE;
         break;
      //10BASE-T full-duplex
      case PHYCON_OP_MODE_10BT_FD:
         interface->speed100 = FALSE;
         interface->fullDuplex = TRUE;
         break;
      //100BASE-TX
      case PHYCON_OP_MODE_100BTX:
         interface->speed100 = TRUE;
         interface->fullDuplex = FALSE;
         break;
      //100BASE-TX full-duplex
      case PHYCON_OP_MODE_100BTX_FD:
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

void ksz8721WritePhyReg(NetInterface *interface, uint8_t address, uint16_t data)
{
   //Write the specified PHY register
   interface->nicDriver->writePhyReg(KSZ8721_PHY_ADDR, address, data);
}


/**
 * @brief Read PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t ksz8721ReadPhyReg(NetInterface *interface, uint8_t address)
{
   //Read the specified PHY register
   return interface->nicDriver->readPhyReg(KSZ8721_PHY_ADDR, address);
}


/**
 * @brief Dump PHY registers for debugging purpose
 * @param[in] interface Underlying network interface
 **/

void ksz8721DumpPhyReg(NetInterface *interface)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, ksz8721ReadPhyReg(interface, i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
