/**
 * @file pic32_eth.c
 * @brief PIC32 Ethernet MAC controller
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
#include <p32xxxx.h>
#include <plib.h>
#include "tcp_ip_stack.h"
#include "pic32_eth.h"
#include "debug.h"

//Transmit buffer
static uint8_t txBuffer[PIC32_TX_BUFFER_COUNT][PIC32_TX_BUFFER_SIZE] __attribute__((aligned(4)));
//Receive buffer
static uint8_t rxBuffer[PIC32_RX_BUFFER_COUNT][PIC32_RX_BUFFER_SIZE] __attribute__((aligned(4)));
//Transmit buffer descriptors
static Pic32TxBufferDesc txBufferDesc[PIC32_TX_BUFFER_COUNT] __attribute__((aligned(4)));
//Receive buffer descriptors
static Pic32RxBufferDesc rxBufferDesc[PIC32_RX_BUFFER_COUNT] __attribute__((aligned(4)));
//TX buffer index
static uint_t txBufferIndex;
//RX buffer index
static uint_t rxBufferIndex;


/**
 * @brief PIC32 Ethernet MAC driver
 **/

const NicDriver pic32EthDriver =
{
   pic32EthInit,
   pic32EthTick,
   pic32EthEnableIrq,
   pic32EthDisableIrq,
   pic32EthRxEventHandler,
   pic32EthSetMacFilter,
   pic32EthSendPacket,
   pic32EthWritePhyReg,
   pic32EthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief PIC32 Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t pic32EthInit(NetInterface *interface)
{
   error_t error;

   //Debug message
   TRACE_INFO("Initializing PIC32 Ethernet MAC...\r\n");

   //Disable Ethernet interrupts
   IEC1CLR = _IEC1_ETHIE_MASK;
   //Turn the Ethernet controller off
   ETHCON1CLR = _ETHCON1_ON_MASK | _ETHCON1_TXRTS_POSITION | _ETHCON1_RXEN_MASK;

   //Wait activity abort by polling the ETHBUSY bit
   while(ETHSTAT & _ETHSTAT_ETHBUSY_MASK);

   //Enable the Ethernet controller by setting the ON bit
   ETHCON1SET = _ETHCON1_ON_MASK;

   //Clear Ethernet interrupt flag
   IFS1CLR = _IFS1_ETHIF_MASK;
   //Disable any Ethernet controller interrupt generation
   ETHIEN = 0;
   ETHIRQ = 0;
   //Clear the TX and RX start addresses
   ETHTXST = 0;
   ETHRXST = 0;

   //Reset the MAC using SOFTRESET
   EMAC1CFG1SET = _EMAC1CFG1_SOFTRESET_MASK;
   EMAC1CFG1CLR = _EMAC1CFG1_SOFTRESET_MASK;

   //Reset the RMII module
   EMAC1SUPPSET = _EMAC1SUPP_RESETRMII_MASK;
   EMAC1SUPPCLR = _EMAC1SUPP_RESETRMII_MASK;

   //Issue an MIIM block reset by setting the RESETMGMT bit
   EMAC1MCFGSET = _EMAC1MCFG_RESETMGMT_MASK;
   EMAC1MCFGCLR = _EMAC1MCFG_RESETMGMT_MASK;

   //Select the proper divider for the MDC clock
   EMAC1MCFG = _EMAC1MCFG_CLKSEL_DIV40;

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Optionally set the station MAC address
   if(macCompAddr(&interface->macAddr, &MAC_UNSPECIFIED_ADDR))
   {
      //Use the factory preprogrammed station address
      interface->macAddr.w[0] = EMAC1SA2;
      interface->macAddr.w[1] = EMAC1SA1;
      interface->macAddr.w[2] = EMAC1SA0;
   }
   else
   {
      //Override the factory preprogrammed address
      EMAC1SA0 = interface->macAddr.w[2];
      EMAC1SA1 = interface->macAddr.w[1];
      EMAC1SA2 = interface->macAddr.w[0];
   }

   //Initialize hash table
   ETHHT0 = 0;
   ETHHT1 = 0;

   //Configure the receive filter
   ETHRXFC = _ETHRXFC_HTEN_MASK | _ETHRXFC_CRCOKEN_MASK |
      _ETHRXFC_RUNTEN_MASK | _ETHRXFC_UCEN_MASK | _ETHRXFC_BCEN_MASK;

   //Disable flow control
   EMAC1CFG1 = _EMAC1CFG1_RXENABLE_MASK;
   //Automatic padding and CRC generation
   EMAC1CFG2 = _EMAC1CFG2_PADENABLE_MASK | _EMAC1CFG2_CRCENABLE_MASK;
   //Set the maximum frame length
   EMAC1MAXF = 1518;

   //Initialize DMA descriptor lists
   pic32EthInitBufferDesc(interface);

   //Enable desired interrupts
   ETHIENSET = _ETHIEN_PKTPENDIE_MASK | _ETHIEN_TXDONEIE_MASK;

   //Set interrupt priority
   IPC12CLR = _IPC12_ETHIP_MASK;
   IPC12SET = (2 << _IPC12_ETHIP_POSITION);
   //Set interrupt sub-priority
   IPC12CLR = _IPC12_ETHIS_MASK;
   IPC12SET = (0 << _IPC12_ETHIS_POSITION);

   //Enable the reception by setting the RXEN bit
   ETHCON1SET = _ETHCON1_RXEN_MASK;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //PIC32 Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


/**
 * @brief Initialize DMA descriptor lists
 * @param[in] interface Underlying network interface
 **/

void pic32EthInitBufferDesc(NetInterface *interface)
{
   uint_t i;

   //Initialize TX descriptor list
   for(i = 0; i < PIC32_TX_BUFFER_COUNT; i++)
   {
      //Use linked list rather than linear list
      txBufferDesc[i].control = ETH_TX_CTRL_NPV;
      //Transmit buffer address
      txBufferDesc[i].address = (uint32_t) KVA_TO_PA(txBuffer[i]);
      //Transmit status vector
      txBufferDesc[i].status1 = 0;
      txBufferDesc[i].status2 = 0;
      //Next descriptor address
      txBufferDesc[i].next = (uint32_t) KVA_TO_PA(&txBufferDesc[i + 1]);
   }

   //The last descriptor is chained to the first entry
   txBufferDesc[i - 1].next = (uint32_t) KVA_TO_PA(&txBufferDesc[0]);
   //Initialize TX buffer index
   txBufferIndex = 0;

   //Initialize RX descriptor list
   for(i = 0; i < PIC32_RX_BUFFER_COUNT; i++)
   {
      //The descriptor is initially owned by the DMA
      rxBufferDesc[i].control = ETH_RX_CTRL_NPV | ETH_RX_CTRL_EOWN;
      //Receive buffer address
      rxBufferDesc[i].address = (uint32_t) KVA_TO_PA(rxBuffer[i]);
      //Receive status vector
      rxBufferDesc[i].status1 = 0;
      rxBufferDesc[i].status2 = 0;
      //Next descriptor address
      rxBufferDesc[i].next = (uint32_t) KVA_TO_PA(&rxBufferDesc[i + 1]);
   }

   //The last descriptor is chained to the first entry
   rxBufferDesc[i - 1].next = (uint32_t) KVA_TO_PA(&rxBufferDesc[0]);
   //Initialize RX buffer index
   rxBufferIndex = 0;

   //Starting address of TX descriptor table
   ETHTXST = (uint32_t) KVA_TO_PA(&txBufferDesc[0]);
   //Starting address of RX descriptor table
   ETHRXST = (uint32_t) KVA_TO_PA(&rxBufferDesc[0]);
   //Set receive buffer size
   ETHCON2 = PIC32_RX_BUFFER_SIZE;
}


/**
 * @brief PIC32 Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void pic32EthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void pic32EthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   IEC1SET = _IEC1_ETHIE_MASK;
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void pic32EthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   IEC1CLR = _IEC1_ETHIE_MASK;
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief PIC32 Ethernet MAC interrupt service routine
 **/

void pic32EthInterrupt(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //Read interrupt status register
   uint32_t status = ETHIRQ;

   //A packet has been transmitted?
   if(status & _ETHIRQ_TXDONE_MASK)
   {
      //Clear TXDONE interrupt flag
      ETHIRQCLR = _ETHIRQ_TXDONE_MASK;

      //Check whether the TX buffer is available for writing
      if(!(txBufferDesc[txBufferIndex].control & ETH_TX_CTRL_EOWN))
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //A packet has been received?
   if(status & _ETHIRQ_PKTPEND_MASK)
   {
      //Disable PKTPEND interrupt
      ETHIENCLR = _ETHIEN_PKTPENDIE_MASK;

      //Notify the user that a packet has been received
      flag |= osEventSetFromIrq(interface->nicRxEvent);
   }

   //Clear ETHIF interrupt flag before exiting the service routine
   IFS1CLR = _IFS1_ETHIF_MASK;

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief PIC32 Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void pic32EthRxEventHandler(NetInterface *interface)
{
   size_t length;
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
            //Check current operating speed
            if(interface->speed100)
            {
               //100BASE-TX operation mode
               EMAC1SUPPSET = _EMAC1SUPP_SPEEDRMII_MASK;
            }
            else
            {
               //10BASE-T operation mode
               EMAC1SUPPCLR = _EMAC1SUPP_SPEEDRMII_MASK;
            }

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
            {
               //Configure FULLDPLX bit to match the current duplex mode
               EMAC1CFG2SET = _EMAC1CFG2_FULLDPLX_MASK;
               //Configure the Back-to-Back Inter-Packet Gap register
               EMAC1IPGT = 0x15;
            }
            else
            {
               //Configure FULLDPLX bit to match the current duplex mode
               EMAC1CFG2CLR = _EMAC1CFG2_FULLDPLX_MASK;
               //Configure the Back-to-Back Inter-Packet Gap register
               EMAC1IPGT = 0x12;
            }
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(ETHIRQ & _ETHIRQ_PKTPEND_MASK)
   {
      //Process all the pending packets
      while(ETHIRQ & _ETHIRQ_PKTPEND_MASK)
      {
         //Check whether a packet has been received
         length = pic32EthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;

         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable PKTPEND interrupt
   ETHIENSET = _ETHIEN_PKTPENDIE_MASK;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t pic32EthSetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint32_t hashTable[2];

   //Debug message
   TRACE_INFO("Updating PIC32 hash table...\r\n");

   //Clear hash table
   hashTable[0] = 0;
   hashTable[1] = 0;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = pic32EthCalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //Calculate the corresponding index in the table
      k = (crc >> 23) & 0x3F;
      //Update hash table contents
      hashTable[k / 32] |= (1 << (k % 32));
   }

   //Write the hash table
   ETHHT0 = hashTable[0];
   ETHHT1 = hashTable[1];

   //Debug message
   TRACE_INFO("  ETHHT0 = %08" PRIX32 "\r\n", ETHHT0);
   TRACE_INFO("  ETHHT1 = %08" PRIX32 "\r\n", ETHHT1);

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

error_t pic32EthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   size_t length;
   uint32_t value;

   //Retrieve the length of the packet
   length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > PIC32_TX_BUFFER_SIZE)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Make sure the current buffer is available for writing
   if(txBufferDesc[txBufferIndex].control & ETH_TX_CTRL_EOWN)
      return ERROR_FAILURE;

   //Copy user data to the transmit buffer
   chunkedBufferRead(txBuffer[txBufferIndex], buffer, offset, length);

   //Write the number of bytes to send
   value = (length << 16) & ETH_TX_CTRL_BYTE_COUNT;
   //Set SOP and EOP flags since the data fits in a single buffer
   value |= ETH_TX_CTRL_SOP | ETH_TX_CTRL_EOP | ETH_TX_CTRL_NPV;
   //Give the ownership of the descriptor to the DMA
   txBufferDesc[txBufferIndex].control = value | ETH_TX_CTRL_EOWN;

   //Set TXRTS bit to start the transmission
   ETHCON1SET = _ETHCON1_TXRTS_MASK;

   //Increment index and wrap around if necessary
   if(++txBufferIndex >= PIC32_TX_BUFFER_COUNT)
      txBufferIndex = 0;

   //Check whether the next buffer is available for writing
   if(!(txBufferDesc[txBufferIndex].control & ETH_TX_CTRL_EOWN))
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
   }

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

size_t pic32EthReceivePacket(NetInterface *interface,
   uint8_t *buffer, size_t size)
{
   //Total number of bytes received
   uint_t length = 0;

   //The current buffer is available for reading?
   if(!(rxBufferDesc[rxBufferIndex].control & ETH_RX_CTRL_EOWN))
   {
      //SOP and EOP flags should be set
      if((rxBufferDesc[rxBufferIndex].control & ETH_RX_CTRL_SOP) &&
         (rxBufferDesc[rxBufferIndex].control & ETH_RX_CTRL_EOP))
      {
         //Make sure no error occurred
         if(rxBufferDesc[rxBufferIndex].status2 & ETH_RX_STATUS2_OK)
         {
            //Retrieve the length of the frame
            length = (rxBufferDesc[rxBufferIndex].control & ETH_RX_CTRL_BYTE_COUNT) >> 16;
            //Limit the number of data to read
            length = min(length, size);
            //Copy data from the receive buffer
            memcpy(buffer, rxBuffer[rxBufferIndex], length);
         }
      }

      //Give the ownership of the descriptor back to the DMA
      rxBufferDesc[rxBufferIndex].control = ETH_RX_CTRL_NPV | ETH_RX_CTRL_EOWN;

      //Increment index and wrap around if necessary
      if(++rxBufferIndex >= PIC32_RX_BUFFER_COUNT)
         rxBufferIndex = 0;

      //Decrement BUFCNT counter
      ETHCON1SET = _ETHCON1_BUFCDEC_MASK;
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

void pic32EthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Set PHY address and register address
   EMAC1MADR = (phyAddr << _EMAC1MADR_PHYADDR_POSITION) | regAddr;
   //Start a write operation
   EMAC1MWTD = data & _EMAC1MWTD_MWTD_MASK;

   //Wait for busy bit to be set
   __asm__ __volatile__ ("nop;");
   __asm__ __volatile__ ("nop;");
   __asm__ __volatile__ ("nop;");

   //Wait for the write to complete
   while(EMAC1MIND & _EMAC1MIND_MIIMBUSY_MASK);
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t pic32EthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   //Set PHY address and register address
   EMAC1MADR = (phyAddr << _EMAC1MADR_PHYADDR_POSITION) | regAddr;
   //Start a read operation
   EMAC1MCMD = _EMAC1MCMD_READ_MASK;

   //Wait for busy bit to be set
   __asm__ __volatile__ ("nop;");
   __asm__ __volatile__ ("nop;");
   __asm__ __volatile__ ("nop;");

   //Wait for the read to complete
   while(EMAC1MIND & _EMAC1MIND_MIIMBUSY_MASK);

   //Clear command register
   EMAC1MCMD = 0;
   //Return PHY register contents
   return EMAC1MRDD & _EMAC1MRDD_MRDD_MASK;
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t pic32EthCalcCrc(const void *data, size_t length)
{
   uint_t i;
   uint_t j;

   //Point to the data over which to calculate the CRC
   const uint8_t *p = (uint8_t *) data;
   //CRC preset value
   uint32_t crc = 0xFFFFFFFF;

   //Loop through data
   for(i = 0; i < length; i++)
   {
      //The message is processed bit by bit
      for(j = 0; j < 8; j++)
      {
         //Update CRC value
         if(((crc >> 31) ^ (p[i] >> j)) & 0x01)
            crc = (crc << 1) ^ 0x04C11DB7;
         else
            crc = crc << 1;
      }
   }

   //Return CRC value
   return crc;
}
