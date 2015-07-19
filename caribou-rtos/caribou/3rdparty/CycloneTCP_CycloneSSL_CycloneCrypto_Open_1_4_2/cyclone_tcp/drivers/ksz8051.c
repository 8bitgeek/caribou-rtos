/**
 * @file ksz8051.c
 * @brief KSZ8051 Ethernet PHY transceiver
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

//SAM4E-EK evaluation board?
#if defined(USE_SAM4E_EK)
   #include "sam4e.h"
//SF2-STARTER-KIT-ES-2 evaluation board?
#elif defined(USE_SF2_STARTER_KIT_ES_2)
   #include "m2sxxx.h"
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "ksz8051.h"
#include "debug.h"


/**
 * @brief KSZ8051 Ethernet PHY driver
 **/

const PhyDriver ksz8051PhyDriver =
{
   ksz8051Init,
   ksz8051Tick,
   ksz8051EnableIrq,
   ksz8051DisableIrq,
   ksz8051EventHandler,
};


/**
 * @brief KSZ8051 PHY transceiver initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t ksz8051Init(NetInterface *interface)
{
//SAM4E-EK evaluation board?
#if defined(USE_SAM4E_EK)
   volatile uint32_t status;

   //Debug message
   TRACE_INFO("Initializing KSZ8051...\r\n");

   //Enable PIO peripheral clock
   PMC->PMC_PCER0 = (1 << ID_PIOD);

   //Enable pull-up resistor on PHY IRQ pin
   PIOD->PIO_PUER = PIO_PD28;
   //Configure the corresponding pin as an input
   PIOD->PIO_ODR = PIO_PD28;
   PIOD->PIO_PER = PIO_PD28;
   //Enable interrupts-on-change
   PIOD->PIO_IDR = 0xFFFFFFFF;
   PIOD->PIO_IER = PIO_PD28;

   //Reset PHY transceiver by asserting NRST pin
   //RSTC->RSTC_MR = RSTC_MR_KEY(0xA5) | RSTC_MR_ERSTL(4);
   //RSTC->RSTC_CR = RSTC_CR_KEY(0xA5) | RSTC_CR_EXTRST;
   //Wait for the reset to complete
   //while(!(RSTC->RSTC_SR & RSTC_SR_NRSTL));

   //Delay before accessing PHY transceiver
   sleep(10);

   //Read PIO ISR register to clear any pending interrupt
   status = PIOD->PIO_ISR;

   //Set priority grouping (2 bits for pre-emption priority, 2 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure PIOD interrupt priority
   NVIC_SetPriority(PIOD_IRQn, NVIC_EncodePriority(5, 2, 0));

//SF2-STARTER-KIT-ES-2 evaluation board?
#elif defined(USE_SF2_STARTER_KIT_ES_2)
   //Debug message
   TRACE_INFO("Initializing KSZ8051...\r\n");
#endif

   //Reset PHY transceiver
   ksz8051WritePhyReg(interface, KSZ8051_PHY_REG_BMCR, BMCR_RESET);
   //Wait for the reset to complete
   while(ksz8051ReadPhyReg(interface, KSZ8051_PHY_REG_BMCR) & BMCR_RESET);

   //Dump PHY registers for debugging purpose
   ksz8051DumpPhyReg(interface);

   //The PHY will generate interrupts when link status changes are detected
   ksz8051WritePhyReg(interface, KSZ8051_PHY_REG_ICSR, ICSR_LINK_DOWN_IE | ICSR_LINK_UP_IE);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief KSZ8051 timer handler
 * @param[in] interface Underlying network interface
 **/

void ksz8051Tick(NetInterface *interface)
{
//SF2-STARTER-KIT-ES-2 evaluation board?
#if defined(USE_SF2_STARTER_KIT_ES_2)
   uint16_t value;
   bool_t linkState;

   //Read basic status register
   value = ksz8051ReadPhyReg(interface, KSZ8051_PHY_REG_BMSR);
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

void ksz8051EnableIrq(NetInterface *interface)
{
//SAM4E-EK evaluation board?
#if defined(USE_SAM4E_EK)
   //Enable PHY transceiver interrupts
   NVIC_EnableIRQ(PIOD_IRQn);
#endif
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void ksz8051DisableIrq(NetInterface *interface)
{
//SAM4E-EK evaluation board?
#if defined(USE_SAM4E_EK)
   //Disable PHY transceiver interrupts
   NVIC_DisableIRQ(PIOD_IRQn);
#endif
}


/**
 * @brief KSZ8051 interrupt service routine
 **/

//SAM4E-EK evaluation board?
#if defined(USE_SAM4E_EK)

void PIOD_Handler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Read status register to clear interrupt
   volatile uint32_t status = PIOD->PIO_ISR;

   //Ensure the PHY IRQ pin is asserted
   if(!(PIOD->PIO_PDSR & PIO_PD28))
   {
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSetFromIrq(interface->nicRxEvent);
   }
}

#endif


/**
 * @brief KSZ8051 event handler
 * @param[in] interface Underlying network interface
 * @return TRUE if a link state change notification is received
 **/

bool_t ksz8051EventHandler(NetInterface *interface)
{
   uint16_t value;

   //Read status register to acknowledge the interrupt
   value = ksz8051ReadPhyReg(interface, KSZ8051_PHY_REG_ICSR);

   //Link status change?
   if(value & (ICSR_LINK_DOWN_IF | ICSR_LINK_UP_IF))
   {
      //Read basic status register
      value = ksz8051ReadPhyReg(interface, KSZ8051_PHY_REG_BMSR);

      //Link is up?
      if(value & BMSR_LINK_STATUS)
      {
         //Read PHY control register
         value = ksz8051ReadPhyReg(interface, KSZ8051_PHY_REG_PHYCON1);

         //Check current operation mode
         switch(value & PHYCON1_OP_MODE_MASK)
         {
         //10BASE-T
         case PHYCON1_OP_MODE_10BT:
            interface->speed100 = FALSE;
            interface->fullDuplex = FALSE;
            break;
         //10BASE-T full-duplex
         case PHYCON1_OP_MODE_10BT_FD:
            interface->speed100 = FALSE;
            interface->fullDuplex = TRUE;
            break;
         //100BASE-TX
         case PHYCON1_OP_MODE_100BTX:
            interface->speed100 = TRUE;
            interface->fullDuplex = FALSE;
            break;
         //100BASE-TX full-duplex
         case PHYCON1_OP_MODE_100BTX_FD:
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
}


/**
 * @brief Write PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address Register address
 * @param[in] data Register value
 **/

void ksz8051WritePhyReg(NetInterface *interface, uint8_t address, uint16_t data)
{
   //Write the specified PHY register
   interface->nicDriver->writePhyReg(KSZ8051_PHY_ADDR, address, data);
}


/**
 * @brief Read PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t ksz8051ReadPhyReg(NetInterface *interface, uint8_t address)
{
   //Read the specified PHY register
   return interface->nicDriver->readPhyReg(KSZ8051_PHY_ADDR, address);
}


/**
 * @brief Dump PHY registers for debugging purpose
 * @param[in] interface Underlying network interface
 **/

void ksz8051DumpPhyReg(NetInterface *interface)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, ksz8051ReadPhyReg(interface, i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
