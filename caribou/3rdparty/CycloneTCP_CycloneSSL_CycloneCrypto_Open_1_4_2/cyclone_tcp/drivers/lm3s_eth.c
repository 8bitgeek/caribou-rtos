/**
 * @file lm3s_eth.c
 * @brief Luminary Stellaris LM3S Ethernet controller
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

//LM3S6965 device?
#if defined(LM3S6965)
   #include "lm3s6965.h"
//LM3S9B92 device?
#elif defined(LM3S9B92)
   #include "lm3s9b92.h"
#endif

//Dependencies
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/sysctl.h"
#include "tcp_ip_stack.h"
#include "lm3s_eth.h"
#include "debug.h"

//Transmit buffer
static uint8_t txBuffer[1538] __attribute__((aligned(4)));


/**
 * @brief Stellaris LM3S Ethernet driver
 **/

const NicDriver lm3sEthDriver =
{
   lm3sEthInit,
   lm3sEthTick,
   lm3sEthEnableIrq,
   lm3sEthDisableIrq,
   lm3sEthRxEventHandler,
   lm3sEthSetMacFilter,
   lm3sEthSendPacket,
   NULL,
   NULL,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief Stellaris LM3S Ethernet controller initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t lm3sEthInit(NetInterface *interface)
{
   uint_t div;

   //Debug message
   TRACE_INFO("Initializing Stellaris LM3S Ethernet controller...\r\n");

   //Enable Ethernet controller clock
   SysCtlPeripheralEnable(SYSCTL_PERIPH_ETH);
   //Reset Ethernet controller
   SysCtlPeripheralReset(SYSCTL_PERIPH_ETH);

   //GPIO configuration
   lm3sEthInitGpio(interface);

   //The MDC clock frequency cannot exceed 2.5MHz
   div = SysCtlClockGet() / (2 * 2500000) - 1;
   //Adjust MDC clock frequency
   MAC_MDV_R = div & MAC_MDV_DIV_M;

   //Reset PHY transceiver
   lm3sEthWritePhyReg(PHY_MR0, PHY_MR0_RESET);
   //Wait for the reset to complete
   while(lm3sEthReadPhyReg(PHY_MR0) & PHY_MR0_RESET);

   //Configure LED0 and LED1
   lm3sEthWritePhyReg(PHY_MR23, PHY_MR23_LED0_RXTX | PHY_MR23_LED1_LINK);

   //Dump PHY registers for debugging purpose
   lm3sEthDumpPhyReg();

   //Set the MAC address
   MAC_IA0_R = interface->macAddr.w[0] | (interface->macAddr.w[1] << 16);
   MAC_IA1_R = interface->macAddr.w[2];

   //Enable automatic CRC generation and packet padding
   MAC_TCTL_R = MAC_TCTL_DUPLEX | MAC_TCTL_CRC | MAC_TCTL_PADEN;
   //Flush the receive FIFO and enable CRC verification
   MAC_RCTL_R = MAC_RCTL_RSTFIFO | MAC_RCTL_BADCRC;

   //Configure Ethernet interrupts
   MAC_IM_R = MAC_IM_PHYINTM | MAC_IM_TXEMPM | MAC_IM_RXINTM;
   //Configure PHY interrupts
   lm3sEthWritePhyReg(PHY_MR17, PHY_MR17_LSCHG_IE);

   //Set priority grouping (2 bits for pre-emption priority, 1 bit for subpriority)
   IntPriorityGroupingSet(2);
   //Configure Ethernet interrupt priority
   IntPrioritySet(INT_ETH, 0xC0);

   //Enable transmitter
   MAC_TCTL_R |= MAC_TCTL_TXEN;
   //Enable receiver
   MAC_RCTL_R |= MAC_RCTL_RXEN;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //Stellaris LM3S Ethernet controller is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//EK-LM3S6965 evaluation board?
#if defined(USE_EK_LM3S6965)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void lm3sEthInitGpio(NetInterface *interface)
{
   //Enable GPIO clock
   SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);

   //Configure status LEDs
   GPIOPinTypeEthernetLED(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3);
}

#endif


/**
 * @brief Stellaris LM3S Ethernet timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void lm3sEthTick(NetInterface *interface)
{
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void lm3sEthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet interrupts
   IntEnable(INT_ETH);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void lm3sEthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet interrupts
   IntDisable(INT_ETH);
}


/**
 * @brief Stellaris LM3S Ethernet interrupt service routine
 **/

void ETH_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //Read interrupt status register
   uint32_t status = MAC_RIS_R;

   //PHY interrupt?
   if(status & MAC_RIS_PHYINT)
   {
      //Disable PHYINT interrupt
      MAC_IM_R &= ~MAC_IM_PHYINTM;
      //Notify the user that the link state has changed
      flag |= osEventSetFromIrq(interface->nicRxEvent);
   }
   //Transmit FIFO empty?
   if(status & MAC_RIS_TXEMP)
   {
      //Acknowledge TXEMP interrupt
      MAC_IACK_R = MAC_IACK_TXEMP;

      //Check whether the transmit FIFO is available for writing
      if(!(MAC_TR_R & MAC_TR_NEWTX))
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //Packet received?
   if(status & MAC_RIS_RXINT)
   {
      //Disable RXINT interrupt
      MAC_IM_R &= ~MAC_IM_RXINTM;
      //Notify the user that a packet has been received
      flag |= osEventSetFromIrq(interface->nicRxEvent);
   }

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief Stellaris LM3S Ethernet event handler
 * @param[in] interface Underlying network interface
 **/

void lm3sEthRxEventHandler(NetInterface *interface)
{
   size_t length;
   uint32_t status;
   uint16_t value;

   //Read interrupt status register
   status = MAC_RIS_R;

   //PHY interrupt?
   if(status & MAC_RIS_PHYINT)
   {
      //Acknowledge PHYINT interrupt
      MAC_IACK_R = MAC_IACK_PHYINT;
      //Read PHY interrupt status register
      value = lm3sEthReadPhyReg(PHY_MR17);

      //Check whether the link state has changed
      if(value & PHY_MR17_LSCHG_IE)
      {
         //Read PHY status register
         value = lm3sEthReadPhyReg(PHY_MR1);

         //Check link state
         if(value & PHY_MR1_LINK)
         {
            //Read PHY diagnostic register
            value = lm3sEthReadPhyReg(PHY_MR18);

            //Get current speed
            if(value & PHY_MR18_RATE)
            {
               //100BASE-TX operation
               interface->speed100 = TRUE;
            }
            else
            {
               //10BASE-T operation
               interface->speed100 = FALSE;
            }

            //Get current duplex mode
            if(value & PHY_MR18_DPLX)
            {
               //Full-Duplex mode
               interface->fullDuplex = TRUE;
               //Update MAC configuration
               MAC_TCTL_R |= MAC_TCTL_DUPLEX;
            }
            else
            {
               //Half-Duplex mode
               interface->fullDuplex = FALSE;
               //Update MAC configuration
               MAC_TCTL_R &= ~MAC_TCTL_DUPLEX;
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

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(status & MAC_RIS_RXINT)
   {
      //Acknowledge RXINT interrupt
      MAC_IACK_R = MAC_IACK_RXINT;

      //Process all the pending packets
      while(MAC_NP_R & MAC_NP_NPR_M)
      {
         //Read the incoming frame
         length = lm3sEthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);

         //Pass the packet to the upper layer if necessary
         if(length > 0)
            nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable Ethernet interrupts
   MAC_IM_R = MAC_IM_PHYINTM | MAC_IM_TXEMPM | MAC_IM_RXINTM;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t lm3sEthSetMacFilter(NetInterface *interface)
{
   //Enable the reception of multicast frames if necessary
   if(interface->macFilterSize > 0)
      MAC_RCTL_R |= MAC_RCTL_AMUL;
   else
      MAC_RCTL_R &= ~MAC_RCTL_AMUL;

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Send a packet
 * @param[in] interface Underlying network interface
 * @param[in] buffer Multi-part buffer containing the data to send
 * @param[in] offset Offset to the first data byte
 * @return Error code
 **/

error_t lm3sEthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   size_t i;
   size_t length;
   uint32_t *p;

   //Retrieve the length of the packet
   length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length < 14 || length > 1536)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Make sure the transmit FIFO is available for writing
   if(MAC_TR_R & MAC_TR_NEWTX)
      return ERROR_FAILURE;

   //Copy user data
   chunkedBufferRead(txBuffer + 2, buffer, offset, length);

   //The packet is preceded by a 16-bit length field
   txBuffer[0] = LSB(length - 14);
   txBuffer[1] = MSB(length - 14);

   //Point to the beginning of the packet
   p = (uint32_t *) txBuffer;
   //Compute the length of the packet in 32-bit words
   length = (length + 5) / 4;

   //Copy packet to transmit FIFO
   for(i = 0; i < length; i++)
      MAC_DATA_R = p[i];

   //Start transmitting
   MAC_TR_R = MAC_TR_NEWTX;

   //Data successfully written
   return NO_ERROR;
}


/**
 * @brief Receive a packet
 * @param[in] interface Underlying network interface
 * @param[out] buffer Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @return Number of bytes that have been received
 **/

size_t lm3sEthReceivePacket(NetInterface *interface,
   uint8_t *buffer, size_t size)
{
   size_t i;
   size_t length;
   uint32_t data;
   uint16_t *p;

   //Total number of bytes received
   length = 0;

   //Make sure the FIFO is not empty
   if(MAC_NP_R & MAC_NP_NPR_M)
   {
      //Read the first word
      data = MAC_DATA_R;
      //Retrieve the total length of the packet
      length = data & 0xFFFF;

      //Make sure the length field is valid
      if(length > 2)
      {
         //Point to the beginning of the buffer
         p = (uint16_t *) buffer;
         //Retrieve the length of the frame
         length -= 2;
         //Limit the number of data to be read
         size = min(size, length);

         //Copy the first half word
         if(size > 0)
            *(p++) = (uint16_t) (data >> 16);

         //Copy data from receive FIFO
         for(i = 2; i < size; i += 4)
         {
            //Read a 32-bit word from the FIFO
            data = MAC_DATA_R;
            //Write the 32-bit to the receive buffer
            *(p++) = (uint16_t) data;
            *(p++) = (uint16_t) (data >> 16);
         }

         //Skip the remaining bytes
         while(i < length)
         {
            //Read a 32-bit word from the FIFO
            data = MAC_DATA_R;
            //Increment byte counter
            i += 4;
         }

         //Number of bytes received
         length = size;
      }
      else
      {
         //Disable receiver
         MAC_RCTL_R &= ~MAC_RCTL_RXEN;
         //Flush the receive FIFO
         MAC_RCTL_R |= MAC_RCTL_RSTFIFO;
         //Re-enable receiver
         MAC_RCTL_R |= MAC_RCTL_RXEN;

         //Bad packet received
         length = 0;
      }
   }

   //Return the number of bytes that have been received
   return length;
}


/**
 * @brief Write PHY register
 * @param[in] address Register address
 * @param[in] data Register value
 **/

void lm3sEthWritePhyReg(uint8_t address, uint16_t data)
{
   //Data to be written in the PHY register
   MAC_MTXD_R = data & MAC_MTXD_MDTX_M;
   //Start a write operation
   MAC_MCTL_R = (address << 3) | MAC_MCTL_WRITE | MAC_MCTL_START;
   //Wait for the write to complete
   while(MAC_MCTL_R & MAC_MCTL_START);
}


/**
 * @brief Read PHY register
 * @param[in] address Register address
 * @return Register value
 **/

uint16_t lm3sEthReadPhyReg(uint8_t address)
{
   //Start a read operation
   MAC_MCTL_R = (address << 3) | MAC_MCTL_START;
   //Wait for the read to complete
   while(MAC_MCTL_R & MAC_MCTL_START);
   //Return PHY register contents
   return MAC_MRXD_R & MAC_MRXD_MDRX_M;
}


/**
 * @brief Dump PHY registers for debugging purpose
 **/

void lm3sEthDumpPhyReg(void)
{
   uint8_t i;

   //Loop through PHY registers
   for(i = 0; i < 32; i++)
   {
      //Display current PHY register
      TRACE_DEBUG("%02" PRIu8 ": 0x%04" PRIX16 "\r\n", i, lm3sEthReadPhyReg(i));
   }

   //Terminate with a line feed
   TRACE_DEBUG("\r\n");
}
