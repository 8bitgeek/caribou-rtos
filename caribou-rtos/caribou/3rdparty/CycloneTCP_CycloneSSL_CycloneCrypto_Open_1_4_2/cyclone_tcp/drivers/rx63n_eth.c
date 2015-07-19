/**
 * @file rx63n_eth.c
 * @brief Renesas RX63N Ethernet MAC controller
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

//Dependencies
#include <iorx63n.h>
#include <intrinsics.h>
#include "tcp_ip_stack.h"
#include "rx63n_eth.h"
#include "debug.h"

//Transmit buffer
#pragma data_alignment = 32
static uint8_t txBuffer[RX63N_TX_BUFFER_COUNT][RX63N_TX_BUFFER_SIZE];
//Receive buffer
#pragma data_alignment = 32
static uint8_t rxBuffer[RX63N_RX_BUFFER_COUNT][RX63N_RX_BUFFER_SIZE];
//Transmit DMA descriptors
#pragma data_alignment = 32
static Rx63nTxDmaDesc txDmaDesc[RX63N_TX_BUFFER_COUNT];
//Receive DMA descriptors
#pragma data_alignment = 32
static Rx63nRxDmaDesc rxDmaDesc[RX63N_RX_BUFFER_COUNT];
//Current transmit descriptor
static uint_t txIndex;
//Current receive descriptor
static uint_t rxIndex;


/**
 * @brief RX63N Ethernet MAC driver
 **/

const NicDriver rx63nEthDriver =
{
   rx63nEthInit,
   rx63nEthTick,
   rx63nEthEnableIrq,
   rx63nEthDisableIrq,
   rx63nEthRxEventHandler,
   rx63nEthSetMacFilter,
   rx63nEthSendPacket,
   rx63nEthWritePhyReg,
   rx63nEthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief RX63N Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t rx63nEthInit(NetInterface *interface)
{
   error_t error;

   //Debug message
   TRACE_INFO("Initializing RX63N Ethernet MAC...\r\n");

   //Disable protection
   SYSTEM.PRCR.WORD = 0xA50B;
   //Cancel EDMAC module stop state
   MSTP(EDMAC) = 0;
   //Enable protection
   SYSTEM.PRCR.WORD = 0xA500;

   //GPIO configuration
   rx63nEthInitGpio(interface);

   //Reset EMAC module
   EDMAC.EDMR.BIT.SWR = 1;
   sleep(10);

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Initialize DMA descriptor lists
   rx63nEthInitDmaDesc(interface);

   //Maximum frame length that can be accepted
   ETHERC.RFLR.LONG = 1518;
   //Set default inter packet gap (96-bit time)
   ETHERC.IPGR.LONG = 0x14;

   //Set the upper 32 bits of the MAC address
   ETHERC.MAHR = (interface->macAddr.b[0] << 24) | (interface->macAddr.b[1] << 16) |
      (interface->macAddr.b[2] << 8) | interface->macAddr.b[3];

   //Set the lower 16 bits of the MAC address
   ETHERC.MALR.BIT.MA = (interface->macAddr.b[4] << 8) | interface->macAddr.b[5];

   //Set descriptor length (16 bytes)
   EDMAC.EDMR.BIT.DL = 0;
   //Select little endian mode
   EDMAC.EDMR.BIT.DE = 1;
   //Use store and forward mode
   EDMAC.TFTR.BIT.TFT = 0;

   //Set transmit FIFO size (2048 bytes)
   EDMAC.FDR.BIT.TFD = 7;
   //Set receive FIFO size (2048 bytes)
   EDMAC.FDR.BIT.RFD = 7;

   //Enable continuous reception of multiple frames
   EDMAC.RMCR.BIT.RNR = 1;

   //Accept transmit interrupt notifications
   EDMAC.TRIMD.BIT.TIM = 0;
   EDMAC.TRIMD.BIT.TIS = 1;

   //Disable all EDMAC interrupts
   EDMAC.EESIPR.LONG = 0;
   //Enable only the desired EDMAC interrupts
   EDMAC.EESIPR.BIT.TWBIP = 1;
   EDMAC.EESIPR.BIT.FRIP = 1;

   //Configure EDMAC interrupt priority
   IPR(ETHER, EINT) = 2;

   //Enable transmission and reception
   ETHERC.ECMR.BIT.TE = 1;
   ETHERC.ECMR.BIT.RE = 1;

   //Instruct the DMA to poll the receive descriptor list
   EDMAC.EDRRR.BIT.RR = 1;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //RX63N Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//RX63N Demonstration Kit?
#if defined(USE_RDK_RX63N)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void rx63nEthInitGpio(NetInterface *interface)
{
   //Unlock MPC registers
   MPC.PWPR.BIT.B0WI = 0;
   MPC.PWPR.BIT.PFSWE = 1;

   //Select RMII interface mode
   MPC.PFENET.BIT.PHYMODE = 0;

   //Configure ET_MDIO (PA3)
   PORTA.PMR.BIT.B3 = 1;
   MPC.PA3PFS.BYTE = 0x11;

   //Configure ET_MDC (PA4)
   PORTA.PMR.BIT.B4 = 1;
   MPC.PA4PFS.BYTE = 0x11;

   //Configure ET_LINKSTA (PA5)
   PORTA.PMR.BIT.B5 = 1;
   MPC.PA5PFS.BYTE = 0x11;

   //Configure RMII_RXD1 (PB0)
   PORTB.PMR.BIT.B0 = 1;
   MPC.PB0PFS.BYTE = 0x12;

   //Configure RMII_RXD0 (PB1)
   PORTB.PMR.BIT.B1 = 1;
   MPC.PB1PFS.BYTE = 0x12;

   //Configure REF50CK (PB2)
   PORTB.PMR.BIT.B2 = 1;
   MPC.PB2PFS.BYTE = 0x12;

   //Configure RMII_RX_ER (PB3)
   PORTB.PMR.BIT.B3 = 1;
   MPC.PB3PFS.BYTE = 0x12;

   //Configure RMII_TXD_EN (PB4)
   PORTB.PMR.BIT.B4 = 1;
   MPC.PB4PFS.BYTE = 0x12;

   //Configure RMII_TXD0 (PB5)
   PORTB.PMR.BIT.B5 = 1;
   MPC.PB5PFS.BYTE = 0x12;

   //Configure RMII_TXD1 (PB6)
   PORTB.PMR.BIT.B6 = 1;
   MPC.PB6PFS.BYTE = 0x12;

   //Configure RMII_CRS_DV (PB7)
   PORTB.PMR.BIT.B7 = 1;
   MPC.PB7PFS.BYTE = 0x12;

   //Lock MPC registers
   MPC.PWPR.BIT.PFSWE = 0;
   MPC.PWPR.BIT.B0WI = 0;
}

#endif


/**
 * @brief Initialize DMA descriptor lists
 * @param[in] interface Underlying network interface
 **/

void rx63nEthInitDmaDesc(NetInterface *interface)
{
   uint_t i;

   //Initialize TX descriptors
   for(i = 0; i < RX63N_TX_BUFFER_COUNT; i++)
   {
      //The descriptor is initially owned by the application
      txDmaDesc[i].td0 = EDMAC_TD0_TFP_SOF | EDMAC_TD0_TFP_EOF | EDMAC_TD0_TWBI;
      //Transmit buffer length
      txDmaDesc[i].td1 = 0;
      //Transmit buffer address
      txDmaDesc[i].td2 = (uint32_t) txBuffer[i];
      //Clear padding field
      txDmaDesc[i].padding = 0;
   }

   //Mark the last descriptor entry with the TDLE flag
   txDmaDesc[i - 1].td0 |= EDMAC_TD0_TDLE;
   //Initialize TX descriptor index
   txIndex = 0;

   //Initialize RX descriptors
   for(i = 0; i < RX63N_RX_BUFFER_COUNT; i++)
   {
      //The descriptor is initially owned by the DMA
      rxDmaDesc[i].rd0 = EDMAC_RD0_RACT;
      //Receive buffer length
      rxDmaDesc[i].rd1 = (RX63N_RX_BUFFER_SIZE << 16) & EDMAC_RD1_RBL;
      //Receive buffer address
      rxDmaDesc[i].rd2 = (uint32_t) rxBuffer[i];
      //Clear padding field
      rxDmaDesc[i].padding = 0;
   }

   //Mark the last descriptor entry with the RDLE flag
   rxDmaDesc[i - 1].rd0 |= EDMAC_RD0_RDLE;
   //Initialize RX descriptor index
   rxIndex = 0;

   //Start address of the TX descriptor list
   EDMAC.TDLAR = txDmaDesc;
   //Start address of the RX descriptor list
   EDMAC.RDLAR = rxDmaDesc;
}


/**
 * @brief RX63N Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void rx63nEthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void rx63nEthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   IEN(ETHER, EINT) = 1;
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void rx63nEthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   IEN(ETHER, EINT) = 0;
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief RX63N Ethernet MAC interrupt service routine
 **/

#pragma vector = VECT_ETHER_EINT
__interrupt void rx63nEthInterrupt(void)
{
   bool_t flag;
   NetInterface *interface;

   //Allow nested interrupts
   __enable_interrupt();

   //Point to the structure describing the network interface
   interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   flag = FALSE;

   //A packet has been transmitted?
   if(EDMAC.EESR.BIT.TWB)
   {
      //Clear TWB interrupt flag
      EDMAC.EESR.BIT.TWB = 1;

      //Check whether the TX buffer is available for writing
      if(!(txDmaDesc[txIndex].td0 & EDMAC_TD0_TACT))
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //A packet has been received?
   if(EDMAC.EESR.BIT.FR)
   {
      //Disable FR interrupts
      EDMAC.EESIPR.BIT.FRIP = 0;

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
 * @brief RX63N Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void rx63nEthRxEventHandler(NetInterface *interface)
{
   uint_t length;
   bool_t linkStateChange;

   //PHY event is pending?
   if(interface->phyEvent)
   {
      //Acknowledge the event by clearing the flag
      interface->phyEvent = FALSE;
      //Handle PHY specific events
      linkStateChange = interface->phyDriver->eventHandler(interface);

      //Check whether the link state has changed?
      if(linkStateChange)
      {
         //Set speed and duplex mode for proper operation
         if(interface->linkState)
         {
            //10BASE-T or 100BASE-TX operation mode?
            if(interface->speed100)
               ETHERC.ECMR.BIT.RTM = 1;
            else
               ETHERC.ECMR.BIT.RTM = 0;

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
               ETHERC.ECMR.BIT.DM = 1;
            else
               ETHERC.ECMR.BIT.DM = 0;
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(EDMAC.EESR.BIT.FR)
   {
      //Clear FR interrupt flag
      EDMAC.EESR.BIT.FR = 1;

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = rx63nEthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;

         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable EDMAC interrupts
   EDMAC.EESIPR.BIT.TWBIP = 1;
   EDMAC.EESIPR.BIT.FRIP = 1;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t rx63nEthSetMacFilter(NetInterface *interface)
{
   //Enable the reception of multicast frames if necessary
   if(interface->macFilterSize > 0)
      EDMAC.EESR.BIT.RMAF = 1;
   else
      EDMAC.EESR.BIT.RMAF = 0;

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

error_t rx63nEthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > RX63N_TX_BUFFER_SIZE)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Make sure the current buffer is available for writing
   if(txDmaDesc[txIndex].td0 & EDMAC_TD0_TACT)
      return ERROR_FAILURE;

   //Copy user data to the transmit buffer
   chunkedBufferRead(txBuffer[txIndex], buffer, offset, length);

   //Write the number of bytes to send
   txDmaDesc[txIndex].td1 = (length << 16) & EDMAC_TD1_TBL;
   //Give the ownership of the descriptor to the DMA engine
   txDmaDesc[txIndex].td0 |= EDMAC_TD0_TACT;

   //Increment index and wrap around if necessary
   if(++txIndex >= RX63N_TX_BUFFER_COUNT)
      txIndex = 0;

   //Instruct the DMA to poll the transmit descriptor list
   EDMAC.EDTRR.BIT.TR = 1;

   //Check whether the next buffer is available for writing
   if(!(txDmaDesc[txIndex].td0 & EDMAC_TD0_TACT))
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
   }

   //Successful write operation
   return NO_ERROR;
}


/**
 * @brief Receive a packet
 * @param[in] interface Underlying network interface
 * @param[out] buffer Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @return Number of bytes that have been received
 **/

uint_t rx63nEthReceivePacket(NetInterface *interface,
   uint8_t *buffer, uint_t size)
{
   //Total number of bytes received
   uint_t length = 0;

   //The current buffer is available for reading?
   if(!(rxDmaDesc[rxIndex].rd0 & EDMAC_RD0_RACT))
   {
      //SOF and EOF flags should be set
      if((rxDmaDesc[rxIndex].rd0 & EDMAC_RD0_RFP_SOF) &&
         (rxDmaDesc[rxIndex].rd0 & EDMAC_RD0_RFP_EOF))
      {
         //Make sure no error occurred
         if(!(rxDmaDesc[rxIndex].rd0 & (EDMAC_RD0_RFS_MASK & ~EDMAC_RD0_RFS_RMAF)))
         {
            //Retrieve the length of the frame
            length = rxDmaDesc[rxIndex].rd1 & EDMAC_RD1_RFL;
            //Limit the number of data to read
            length = min(length, size - 4);

            //Copy data from the receive buffer
            memcpy(buffer, rxBuffer[rxIndex], length);

            //CRC is not included in the transfer...
            buffer[length++] = 0xCC;
            buffer[length++] = 0xCC;
            buffer[length++] = 0xCC;
            buffer[length++] = 0xCC;
         }
      }

      //Give the ownership of the descriptor back to the DMA
      rxDmaDesc[rxIndex].rd0 |= EDMAC_RD0_RACT;

      //Increment index and wrap around if necessary
      if(++rxIndex >= RX63N_RX_BUFFER_COUNT)
         rxIndex = 0;

      //Instruct the DMA to poll the receive descriptor list
      EDMAC.EDRRR.BIT.RR = 1;
   }

   //Return the number of bytes that have been received
   return length;
}


/**
 * @brief Write PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @param[in] data Register value
 **/

void rx63nEthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Synchronization pattern
   rx63nEthWriteSmi(SMI_SYNC, 32);
   //Start of frame
   rx63nEthWriteSmi(SMI_START, 2);
   //Set up a write operation
   rx63nEthWriteSmi(SMI_WRITE, 2);
   //Write PHY address
   rx63nEthWriteSmi(phyAddr, 5);
   //Write register address
   rx63nEthWriteSmi(regAddr, 5);
   //Turnaround
   rx63nEthWriteSmi(SMI_TA, 2);
   //Write register value
   rx63nEthWriteSmi(data, 16);
   //Release MDIO
   rx63nEthReadSmi(1);
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t rx63nEthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   uint16_t data;

   //Synchronization pattern
   rx63nEthWriteSmi(SMI_SYNC, 32);
   //Start of frame
   rx63nEthWriteSmi(SMI_START, 2);
   //Set up a read operation
   rx63nEthWriteSmi(SMI_READ, 2);
   //Write PHY address
   rx63nEthWriteSmi(phyAddr, 5);
   //Write register address
   rx63nEthWriteSmi(regAddr, 5);
   //Turnaround to avoid contention
   rx63nEthReadSmi(1);
   //Read register value
   data = rx63nEthReadSmi(16);
   //Force the PHY to release the MDIO pin
   rx63nEthReadSmi(1);

   //Return PHY register contents
   return data;
}


/**
 * @brief SMI write operation
 * @param[in] data Raw data to be written
 * @param[in] length Number of bits to be written
 **/

void rx63nEthWriteSmi(uint32_t data, uint_t length)
{
   //Skip the most significant bits since they are meaningless
   data <<= 32 - length;

   //Configure MDIO as an output
   ETHERC.PIR.BIT.MMD = 1;

   //Write the specified number of bits
   while(length--)
   {
      //Write MDIO
      if(data & 0x80000000)
         ETHERC.PIR.BIT.MDO = 1;
      else
         ETHERC.PIR.BIT.MDO = 0;

      //Assert MDC
      usleep(1);
      ETHERC.PIR.BIT.MDC = 1;
      //Deassert MDC
      usleep(1);
      ETHERC.PIR.BIT.MDC = 0;

      //Rotate data
      data <<= 1;
   }
}


/**
 * @brief SMI read operation
 * @param[in] length Number of bits to be read
 * @return Data resulting from the MDIO read operation
 **/

uint32_t rx63nEthReadSmi(uint_t length)
{
   uint32_t data = 0;

   //Configure MDIO as an input
   ETHERC.PIR.BIT.MMD = 0;

   //Read the specified number of bits
   while(length--)
   {
      //Rotate data
      data <<= 1;

      //Assert MDC
      ETHERC.PIR.BIT.MDC = 1;
      usleep(1);
      //Deassert MDC
      ETHERC.PIR.BIT.MDC = 0;
      usleep(1);

      //Check MDIO state
      if(ETHERC.PIR.BIT.MDI)
         data |= 0x00000001;
   }

   //Return the received data
   return data;
}
