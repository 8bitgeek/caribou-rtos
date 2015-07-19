/**
 * @file dm9161.c
 * @brief DM9161 Ethernet PHY transceiver
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

//SAM3X-EK evaluation board?
#if defined(USE_SAM3X_EK)
   #include "sam3xa.h"
//SAM9263-EK evaluation board?
#elif defined(USE_SAM9263_EK)
   #include "at91sam9263.h"
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "dm9161.h"
#include "debug.h"


/**
 * @brief DM9161 Ethernet PHY driver
 **/

const PhyDriver dm9161PhyDriver =
{
   dm9161Init,
   dm9161Tick,
   dm9161EnableIrq,
   dm9161DisableIrq,
   dm9161EventHandler,
};


/**
 * @brief DM9161 PHY transceiver initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t dm9161Init(NetInterface *interface)
{
   volatile uint32_t status;

   //Debug message
   TRACE_INFO("Initializing DM9161...\r\n");

//SAM3X-EK evaluation board?
#if defined(USE_SAM3X_EK)
   //Enable PIO peripheral clock
   PMC->PMC_PCER0 = (1 << ID_PIOA);

   //Enable pull-up resistor on PHY IRQ pin
   PIOA->PIO_PUER = PIO_PA5;
   //Configure the corresponding pin as an input
   PIOA->PIO_ODR = PIO_PA5;
   PIOA->PIO_PER = PIO_PA5;
   //Enable interrupts-on-change
   PIOA->PIO_IDR = 0xFFFFFFFF;
   PIOA->PIO_IER = PIO_PA5;

   //Reset PHY transceiver by asserting NRST pin
   //RSTC->RSTC_MR = RSTC_MR_KEY(0xA5) | RSTC_MR_ERSTL(4);
   //RSTC->RSTC_CR = RSTC_CR_KEY(0xA5) | RSTC_CR_EXTRST;
   //Wait for the reset to complete
   //while(!(RSTC->RSTC_SR & RSTC_SR_NRSTL));

   //Delay before accessing PHY transceiver
   sleep(10);

   //Read PIO ISR register to clear any pending interrupt
   status = PIOA->PIO_ISR;

   //Set priority grouping (2 bits for pre-emption priority, 2 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure PIOA interrupt priority
   NVIC_SetPriority(PIOA_IRQn, NVIC_EncodePriority(5, 2, 0));

//SAM9263-EK evaluation board?
#elif defined(USE_SAM9263_EK)
   //Enable PIO peripheral clock
   AT91C_BASE_PMC->PMC_PCER = (1 << AT91C_ID_PIOCDE);

   //Enable pull-up resistor on PHY IRQ pin
   AT91C_BASE_PIOE->PIO_PPUER = AT91C_PIO_PE31;
   //Configure the corresponding pin as an input
   AT91C_BASE_PIOE->PIO_ODR = AT91C_PIO_PE31;
   AT91C_BASE_PIOE->PIO_PER = AT91C_PIO_PE31;
   //Enable interrupts-on-change
   AT91C_BASE_PIOE->PIO_IDR = 0xFFFFFFFF;
   AT91C_BASE_PIOE->PIO_IER = AT91C_PIO_PE31;

   //Reset PHY transceiver by asserting NRST pin
   AT91C_BASE_RSTC->RSTC_RMR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_ERSTL_1MS;
   AT91C_BASE_RSTC->RSTC_RCR = AT91C_RSTC_KEY_A5 | AT91C_RSTC_EXTRST;
   //Wait for the reset to complete
   while(!(AT91C_BASE_RSTC->RSTC_RSR & AT91C_RSTC_NRSTL));

   //Delay before accessing PHY transceiver
   sleep(10);

   //Read PIO ISR register to clear any pending interrupt
   status = AT91C_BASE_PIOE->PIO_ISR;

   //Configure interrupt controller
   AT91C_BASE_AIC->AIC_SMR[AT91C_ID_PIOCDE] = AT91C_AIC_SRCTYPE_INT_HIGH_LEVEL | AT91C_AIC_PRIOR_LOWEST;
   AT91C_BASE_AIC->AIC_SVR[AT91C_ID_PIOCDE] = (uint32_t) dm9161Interrupt;

   //Clear PHY IRQ interrupt flag
   AT91C_BASE_AIC->AIC_ICCR = (1 << AT91C_ID_PIOCDE);
#endif

   //Reset PHY transceiver
   dm9161WritePhyReg(interface, DM9161_PHY_REG_BMCR, BMCR_RESET);
   //Wait for the reset to complete
   while(dm9161ReadPhyReg(interface, DM9161_PHY_REG_BMCR) & BMCR_RESET);

   //Dump PHY registers for debugging purpose
   dm9161DumpPhyReg(interface);

   //The PHY will generate interrupts when link status changes are detected
   dm9161WritePhyReg(interface, DM9161_PHY_REG_MDINTR, ~(MDINTR_LINK_MASK | MDINTR_INTR_MASK));

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief DM9161 timer handler
 * @param[in] interface Underlying network interface
 **/

void dm9161Tick(NetInterface *interface)
{
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void dm9161EnableIrq(NetInterface *interface)
{
//SAM3X-EK evaluation board?
#if defined(USE_SAM3X_EK)
   //Enable PHY transceiver interrupts
   NVIC_EnableIRQ(PIOA_IRQn);
//SAM9263-EK evaluation board?
#elif defined(USE_SAM9263_EK)
   //Enable PHY transceiver interrupts
   AT91C_BASE_AIC->AIC_IECR = (1 << AT91C_ID_PIOCDE);
#endif
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void dm9161DisableIrq(NetInterface *interface)
{
//SAM3X-EK evaluation board?
#if defined(USE_SAM3X_EK)
   //Enable PHY transceiver interrupts
   NVIC_DisableIRQ(PIOA_IRQn);
//SAM9263-EK evaluation board?
#elif defined(USE_SAM9263_EK)
   //Disable PHY transceiver interrupts
   AT91C_BASE_AIC->AIC_IDCR = (1 << AT91C_ID_PIOCDE);
#endif
}


/**
 * @brief DM9161 interrupt service routine
 **/

//SAM3X-EK evaluation board?
#if defined(USE_SAM3X_EK)

void PIOA_Handler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Read status register to clear interrupt
   volatile uint32_t status = PIOA->PIO_ISR;

   //Ensure the PHY IRQ pin is asserted
   if(!(PIOA->PIO_PDSR & PIO_PA5))
   {
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSetFromIrq(interface->nicRxEvent);
   }
}

//SAM9263-EK evaluation board?
#elif defined(USE_SAM9263_EK)

void __irq dm9161Interrupt(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Read status register to clear interrupt
   volatile uint32_t status = AT91C_BASE_PIOE->PIO_ISR;

   //Ensure the PHY IRQ pin is asserted
   if(!(AT91C_BASE_PIOE->PIO_PDSR & AT91C_PIO_PE31))
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
 * @brief DM9161 event handler
 * @param[in] interface Underlying network interface
 * @return TRUE if a link state change notification is received
 **/

bool_t dm9161EventHandler(NetInterface *interface)
{
//SAM3X-EK or SAM9263-EK evaluation board?
#if defined(USE_SAM3X_EK) || defined(USE_SAM9263_EK)
   uint16_t value;
   bool_t end;

   //Read status register to acknowledge the interrupt
   value = dm9161ReadPhyReg(interface, DM9161_PHY_REG_MDINTR);

   //Link status change?
   if(value & MDINTR_LINK_CHANGE)
   {
      //Any link failure condition is latched in the BMSR register...
      //Reading the register twice always return the actual link status
      value = dm9161ReadPhyReg(interface, DM9161_PHY_REG_BMSR);
      value = dm9161ReadPhyReg(interface, DM9161_PHY_REG_BMSR);

      //Link is up?
      if(value & BMSR_LINK_STATUS)
      {
         //Wait for the auto-negotiation to complete
         do
         {
            //Read DSCSR register
            value = dm9161ReadPhyReg(interface, DM9161_PHY_REG_DSCSR);

            //Check current state
            switch(value & DSCSR_ANMB_MASK)
            {
            //Auto-negotiation is still in progress?
            case DSCSR_ANMB_ABILITY_MATCH:
            case DSCSR_ANMB_ACK_MATCH:
            case DSCSR_ANMB_CONSIST_MATCH:
            case DSCSR_ANMB_SIGNAL_LINK_READY:
               end = FALSE;
               break;
            //Auto-negotiation is complete?
            default:
               end = TRUE;
               break;
            }

            //Check loop condition variable
         } while(!end);

         //Read DSCSR register
         value = dm9161ReadPhyReg(interface, DM9161_PHY_REG_DSCSR);

         //Check current operation mode
         if(value & DSCSR_10HDX)
         {
            //10BASE-T half-duplex
            interface->speed100 = FALSE;
            interface->fullDuplex = FALSE;
         }
         else if(value & DSCSR_10FDX)
         {
            //10BASE-T full-duplex
            interface->speed100 = FALSE;
            interface->fullDuplex = TRUE;
         }
         else if(value & DSCSR_100HDX)
         {
            //100BASE-TX half-duplex
            interface->speed100 = TRUE;
            interface->fullDuplex = FALSE;
         }
         else if(value & DSCSR_100FDX)
         {
            //100BASE-TX full-duplex
            interface->speed100 = TRUE;
            interface->fullDuplex = TRUE;
         }
         else
         {
            //Debug message
            TRACE_WARNING("Invalid Duplex mode\r\n");
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
#endif
}


/**
 * @brief Write PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address Register address
 * @param[in] data Register value
 **/

void dm9161WritePhyReg(NetInterface *interface, uint8_t address, uint16_t data)
{
   //Write the specified PHY register
   interface->nicDriver->writePhyReg(DM9161_PHY_ADDR, address, data);
}


/**
 * @brief Read PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t dm9161ReadPhyReg(NetInterface *interface, uint8_t address)
{
   //Read the specified PHY register
   return interface->nicDriver->readPhyReg(DM9161_PHY_ADDR, address);
}


/**
 * @brief Dump PHY registers for debugging purpose
 * @param[in] interface Underlying network interface
 **/

void dm9161DumpPhyReg(NetInterface *interface)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, dm9161ReadPhyReg(interface, i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
