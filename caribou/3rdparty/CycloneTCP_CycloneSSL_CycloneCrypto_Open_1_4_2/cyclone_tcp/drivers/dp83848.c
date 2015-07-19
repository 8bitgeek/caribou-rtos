/**
 * @file dp83848.c
 * @brief DP83848 Ethernet PHY transceiver
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

//PIC32 Ethernet Starter Kit?
#if defined(USE_PIC32_ETH_STARTER_KIT)
   #include <p32xxxx.h>
//A2F-EVAL-KIT-2 evaluation board?
#elif defined(USE_A2F_EVAL_KIT_2)
   #include "a2fxxxm3.h"
//STM3210C-EVAL evaluation board?
#elif defined(USE_STM3210C_EVAL)
   #include "stm32f10x.h"
   #include "stm32f10x_gpio.h"
   #include "stm32f10x_rcc.h"
   #include "stm32_eval.h"
   #include "stm3210c_eval_ioe.h"
//STM3220G-EVAL evaluation board?
#elif defined(USE_STM322xG_EVAL)
   #include "stm32f2xx.h"
   #include "stm32f2xx_gpio.h"
   #include "stm32f2xx_rcc.h"
//STM3240G-EVAL evaluation board?
#elif defined(USE_STM324xG_EVAL)
   #include "stm32f4xx.h"
   #include "stm32f4xx_gpio.h"
   #include "stm32f4xx_rcc.h"
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "dp83848.h"
#include "debug.h"


/**
 * @brief DP83848 Ethernet PHY driver
 **/

const PhyDriver dp83848PhyDriver =
{
   dp83848Init,
   dp83848Tick,
   dp83848EnableIrq,
   dp83848DisableIrq,
   dp83848EventHandler,
};


/**
 * @brief DP83848 PHY transceiver initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t dp83848Init(NetInterface *interface)
{
//PIC32 Ethernet Starter Kit?
#if defined(USE_PIC32_ETH_STARTER_KIT)
   //Debug message
   TRACE_INFO("Initializing DP83848...\r\n");

   //Configure edge polarity for INT3 interrupt (falling edge)
   INTCONCLR = _INTCON_INT3EP_MASK;
   //Set interrupt priority
   IPC3CLR = _IPC3_INT3IP_MASK;
   IPC3SET = (2 << _IPC3_INT3IP_POSITION);
   //Set interrupt sub-priority
   IPC3CLR = _IPC3_INT3IS_MASK;
   IPC3SET = (0 << _IPC3_INT3IS_POSITION);

//A2F-EVAL-KIT-2 evaluation board?
#elif defined(USE_A2F_EVAL_KIT_2)
   //Debug message
   TRACE_INFO("Initializing DP83848...\r\n");

//STM3210C-EVAL evaluation board?
#elif defined(USE_STM3210C_EVAL)
   //Debug message
   TRACE_INFO("Initializing DP83848...\r\n");

   //Configure IO expander
   IOE_Config();
   //Configure PHY transceiver IRQ
   IOE_ITConfig(IOE_ITSRC_MII_IRQ);

//STM3220G-EVAL or STM3240G-EVAL evaluation board?
#elif defined(USE_STM322xG_EVAL) || defined(USE_STM324xG_EVAL)
   GPIO_InitTypeDef GPIO_InitStructure;
   EXTI_InitTypeDef EXTI_InitStructure;

   //Debug message
   TRACE_INFO("Initializing DP83848...\r\n");

   //Enable GPIOB clock
   RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
   //Enable SYSCFG clock
   RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

   //Configure PB14 pin as an input
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
   GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;
   GPIO_Init(GPIOB, &GPIO_InitStructure);

   //Connect EXTI Line14 to PB14 pin
   SYSCFG_EXTILineConfig(EXTI_PortSourceGPIOB, EXTI_PinSource14);

   //Configure EXTI Line14
   EXTI_InitStructure.EXTI_Line = EXTI_Line14;
   EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
   EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Falling;
   EXTI_InitStructure.EXTI_LineCmd = ENABLE;
   EXTI_Init(&EXTI_InitStructure);

   //Set priority grouping (2 bits for pre-emption priority, 2 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure EXTI15_10 interrupt priority
   NVIC_SetPriority(EXTI15_10_IRQn, NVIC_EncodePriority(5, 2, 0));
#endif

   //Reset PHY transceiver
   dp83848WritePhyReg(interface, DP83848_PHY_REG_BMCR, BMCR_RESET);
   //Wait for the reset to complete
   while(dp83848ReadPhyReg(interface, DP83848_PHY_REG_BMCR) & BMCR_RESET);

   //Dump PHY registers for debugging purpose
   dp83848DumpPhyReg(interface);

   //Configure PWR_DOWN/INT pin as an interrupt output
   dp83848WritePhyReg(interface, DP83848_PHY_REG_MICR, MICR_INTEN | MICR_INT_OE);
   //The PHY will generate interrupts when link status changes are detected
   dp83848WritePhyReg(interface, DP83848_PHY_REG_MISR, MISR_LINK_INT_EN);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief DP83848 timer handler
 * @param[in] interface Underlying network interface
 **/

void dp83848Tick(NetInterface *interface)
{
//A2F-EVAL-KIT-2 evaluation board?
#if defined(USE_A2F_EVAL_KIT_2)
   uint16_t value;
   bool_t linkState;

   //Read basic status register
   value = dp83848ReadPhyReg(interface, DP83848_PHY_REG_BMSR);
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

void dp83848EnableIrq(NetInterface *interface)
{
//PIC32 Ethernet Starter Kit?
#if defined(USE_PIC32_ETH_STARTER_KIT)
   //Enable PHY transceiver interrupts
   IEC0SET = _IEC0_INT3IE_MASK;
//STM3210C-EVAL, STM3220G-EVAL or STM3240G-EVAL evaluation board?
#elif defined(USE_STM3210C_EVAL) || defined(USE_STM322xG_EVAL) || defined(USE_STM324xG_EVAL)
   //Enable PHY transceiver interrupts
   NVIC_EnableIRQ(EXTI15_10_IRQn);
#endif
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void dp83848DisableIrq(NetInterface *interface)
{
//PIC32 Ethernet Starter Kit?
#if defined(USE_PIC32_ETH_STARTER_KIT)
   //Disable PHY transceiver interrupts
   IEC0CLR = _IEC0_INT3IE_MASK;
//STM3210C-EVAL, STM3220G-EVAL or STM3240G-EVAL evaluation board?
#elif defined(USE_STM3210C_EVAL) || defined(USE_STM322xG_EVAL) || defined(USE_STM324xG_EVAL)
   //Disable PHY transceiver interrupts
   NVIC_DisableIRQ(EXTI15_10_IRQn);
#endif
}


/**
 * @brief DP83848 interrupt service routine
 **/

//PIC32 Ethernet Starter Kit?
#if defined(USE_PIC32_ETH_STARTER_KIT)

void dp83848Interrupt(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Check interrupt status
   if(IFS0 & _IFS0_INT3IF_MASK)
   {
      //Clear interrupt flag
      IFS0CLR = _IFS0_INT3IF_MASK;
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSetFromIrq(interface->nicRxEvent);
   }
}

//STM3210C-EVAL evaluation board?
#elif defined(USE_STM3210C_EVAL)

void EXTI15_10_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Check IO expander interrupt status
   if(EXTI_GetITStatus(EXTI_LINE_IOE_ITLINE) != RESET)
   {
      //Clear interrupt flag
      EXTI_ClearITPendingBit(EXTI_LINE_IOE_ITLINE);

      bool_t status = IOE_GetGITStatus(IOE_2_ADDR, IOE_GIT_GPIO);

      if(status)
      {
         IOE_ClearGITPending(IOE_2_ADDR, IOE_GIT_GPIO);

         status = IOE_GetIOITStatus(IOE_2_ADDR, IOE_MII_IRQ_IT);

         if(status)
         {
            //Clear interrupt flag
            IOE_ClearIOITPending(IOE_2_ADDR, IOE_MII_IRQ_IT);
            //A PHY event is pending...
            interface->phyEvent = TRUE;
            //Notify the user that the link state has changed
            osEventSetFromIrq(interface->nicRxEvent);
         }
      }
   }
}

//STM3220G-EVAL or STM3240G-EVAL evaluation board?
#elif defined(USE_STM322xG_EVAL) || defined(USE_STM324xG_EVAL)

void EXTI15_10_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //Check interrupt status
   if(EXTI_GetITStatus(EXTI_Line14) != RESET)
   {
      //Clear interrupt flag
      EXTI_ClearITPendingBit(EXTI_Line14);
      //A PHY event is pending...
      interface->phyEvent = TRUE;
      //Notify the user that the link state has changed
      osEventSetFromIrq(interface->nicRxEvent);
   }
}

#endif


/**
 * @brief DP83848 event handler
 * @param[in] interface Underlying network interface
 * @return TRUE if a link state change notification is received
 **/

bool_t dp83848EventHandler(NetInterface *interface)
{
   uint16_t status;

   //Read status register to acknowledge the interrupt
   status = dp83848ReadPhyReg(interface, DP83848_PHY_REG_MISR);

   //Link status change?
   if(status & MISR_LINK_INT)
   {
      //Read PHY status register
      status = dp83848ReadPhyReg(interface, DP83848_PHY_REG_PHYSTS);

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

void dp83848WritePhyReg(NetInterface *interface, uint8_t address, uint16_t data)
{
   //Write the specified PHY register
   interface->nicDriver->writePhyReg(DP83848_PHY_ADDR, address, data);
}


/**
 * @brief Read PHY register
 * @param[in] interface Underlying network interface
 * @param[in] address PHY register address
 * @return Register value
 **/

uint16_t dp83848ReadPhyReg(NetInterface *interface, uint8_t address)
{
   //Read the specified PHY register
   return interface->nicDriver->readPhyReg(DP83848_PHY_ADDR, address);
}


/**
 * @brief Dump PHY registers for debugging purpose
 * @param[in] interface Underlying network interface
 **/

void dp83848DumpPhyReg(NetInterface *interface)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, dp83848ReadPhyReg(interface, i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
