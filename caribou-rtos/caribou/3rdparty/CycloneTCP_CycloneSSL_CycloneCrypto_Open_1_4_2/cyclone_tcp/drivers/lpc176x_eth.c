/**
 * @file lpc176x_eth.c
 * @brief LPC1760 Ethernet MAC controller
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
#include "lpc17xx.h"
#include "tcp_ip_stack.h"
#include "lpc176x_eth.h"
#include "debug.h"

//IAR EWARM compiler?
#if defined(__ICCARM__)

//Transmit buffer
#pragma data_alignment = 4
static uint8_t txBuffer[LPC176X_TX_BUFFER_COUNT][LPC176X_TX_BUFFER_SIZE];
//Receive buffer
#pragma data_alignment = 4
static uint8_t rxBuffer[LPC176X_RX_BUFFER_COUNT][LPC176X_RX_BUFFER_SIZE];
//Transmit descriptors
#pragma data_alignment = 4
static Lpc176xTxDesc txDesc[LPC176X_TX_BUFFER_COUNT];
//Transmit status array
#pragma data_alignment = 4
static Lpc176xTxStatus txStatus[LPC176X_TX_BUFFER_COUNT];
//Receive descriptors
#pragma data_alignment = 4
static Lpc176xRxDesc rxDesc[LPC176X_RX_BUFFER_COUNT];
//Receive status array
#pragma data_alignment = 8
static Lpc176xRxStatus rxStatus[LPC176X_TX_BUFFER_COUNT];

//Keil MDK-ARM or GCC compiler?
#else

//Transmit buffer
static uint8_t txBuffer[LPC176X_TX_BUFFER_COUNT][LPC176X_TX_BUFFER_SIZE] __attribute__((aligned(4)));
//Receive buffer
static uint8_t rxBuffer[LPC176X_RX_BUFFER_COUNT][LPC176X_RX_BUFFER_SIZE] __attribute__((aligned(4)));
//Transmit descriptors
static Lpc176xTxDesc txDesc[LPC176X_TX_BUFFER_COUNT] __attribute__((aligned(4)));
//Transmit status array
static Lpc176xTxStatus txStatus[LPC176X_TX_BUFFER_COUNT] __attribute__((aligned(4)));
//Receive descriptors
static Lpc176xRxDesc rxDesc[LPC176X_RX_BUFFER_COUNT] __attribute__((aligned(4)));
//Receive status array
static Lpc176xRxStatus rxStatus[LPC176X_TX_BUFFER_COUNT] __attribute__((aligned(8)));

#endif


/**
 * @brief LPC176x Ethernet MAC driver
 **/

const NicDriver lpc176xEthDriver =
{
   lpc176xEthInit,
   lpc176xEthTick,
   lpc176xEthEnableIrq,
   lpc176xEthDisableIrq,
   lpc176xEthRxEventHandler,
   lpc176xEthSetMacFilter,
   lpc176xEthSendPacket,
   lpc176xEthWritePhyReg,
   lpc176xEthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief LPC176x Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t lpc176xEthInit(NetInterface *interface)
{
   error_t error;

   //Debug message
   TRACE_INFO("Initializing LPC176x Ethernet MAC...\r\n");

   //Power up EMAC controller
   LPC_SC->PCONP |= PCONP_PCENET;

   //GPIO configuration
   lpc176xEthInitGpio(interface);

   //Reset host registers, transmit datapath and receive datapath
   LPC_EMAC->Command = COMMAND_RX_RESET | COMMAND_TX_RESET | COMMAND_REG_RESET;

   //Reset EMAC controller
   LPC_EMAC->MAC1 = MAC1_SOFT_RESET | MAC1_SIMULATION_RESET |
      MAC1_RESET_MCS_RX | MAC1_RESET_RX | MAC1_RESET_MCS_TX | MAC1_RESET_TX;

   //Initialize MAC related registers
   LPC_EMAC->MAC1 = 0;
   LPC_EMAC->MAC2 = MAC2_PAD_CRC_ENABLE | MAC2_CRC_ENABLE;
   LPC_EMAC->IPGR = IPGR_DEFAULT_VALUE;
   LPC_EMAC->CLRT = CLRT_DEFAULT_VALUE;

   //Select RMII mode
   LPC_EMAC->Command = COMMAND_RMII;

   //Configure MDC clock
   LPC_EMAC->MCFG = MCFG_CLOCK_SELECT_DIV44;
   //Reset MII management interface
   LPC_EMAC->MCFG |= MCFG_RESET_MII_MGMT;
   LPC_EMAC->MCFG &= ~MCFG_RESET_MII_MGMT;

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Initialize TX and RX descriptor arrays
   lpc176xEthInitDesc(interface);

   //Set the MAC address
   LPC_EMAC->SA0 = interface->macAddr.w[2];
   LPC_EMAC->SA1 = interface->macAddr.w[1];
   LPC_EMAC->SA2 = interface->macAddr.w[0];

   //Initialize hash table
   LPC_EMAC->HashFilterL = 0;
   LPC_EMAC->HashFilterH = 0;

   //Configure the receive filter
   LPC_EMAC->RxFilterCtrl = RFC_ACCEPT_PERFECT_EN |
      RFC_ACCEPT_MULTICAST_HASH_EN | RFC_ACCEPT_BROADCAST_EN;

   //Program the MAXF register with the maximum frame length to be accepted
   LPC_EMAC->MAXF = 1518;

   //Reset EMAC interrupt flags
   LPC_EMAC->IntClear  = 0xFFFF;
   //Enable desired EMAC interrupts
   LPC_EMAC->IntEnable = INT_TX_DONE | INT_RX_DONE;

   //Set priority grouping (2 bits for pre-emption priority, 3 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure Ethernet interrupt priority
   NVIC_SetPriority(ENET_IRQn, NVIC_EncodePriority(5, 2, 0));

   //Enable transmission and reception
   LPC_EMAC->Command |= COMMAND_TX_ENABLE | COMMAND_RX_ENABLE;
   //Allow frames to be received
   LPC_EMAC->MAC1 |= MAC1_RECEIVE_ENABLE;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //LPC176x Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//LPC-1766STK evaluation board?
#if defined(USE_LPC1766_STK)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void lpc176xEthInitGpio(NetInterface *interface)
{
   //Configure P1.0 (ENET_TXD0), P1.1 (ENET_TXD1), P1.4 (ENET_TX_EN), P1.8 (ENET_CRS),
   //P1.9 (ENET_RXD0), P1.10 (ENET_RXD1), P1.14 (RX_ER) and P1.15 (ENET_REF_CLK)
   LPC_PINCON->PINSEL2 &= ~(PINSEL2_P1_0_MASK | PINSEL2_P1_1_MASK |
      PINSEL2_P1_4_MASK | PINSEL2_P1_8_MASK | PINSEL2_P1_9_MASK |
      PINSEL2_P1_10_MASK | PINSEL2_P1_14_MASK | PINSEL2_P1_15_MASK);

   LPC_PINCON->PINSEL2 |= PINSEL2_P1_0_ENET_TXD0 | PINSEL2_P1_1_ENET_TXD1 |
      PINSEL2_P1_4_ENET_TX_EN | PINSEL2_P1_8_ENET_CRS | PINSEL2_P1_9_ENET_RXD0 |
      PINSEL2_P1_10_ENET_RXD1 | PINSEL2_P1_14_ENET_RX_ER | PINSEL2_P1_15_ENET_REF_CLK;

   //Configure P1.16 (ENET_MDC) and P1.17 (ENET_MDIO)
   LPC_PINCON->PINSEL3 &= ~(PINSEL3_P1_16_MASK | PINSEL3_P1_17_MASK);
   LPC_PINCON->PINSEL3 |= PINSEL3_P1_16_ENET_MDC | PINSEL3_P1_17_ENET_MDIO;
}

#endif


/**
 * @brief Initialize TX and RX descriptors
 * @param[in] interface Underlying network interface
 **/

void lpc176xEthInitDesc(NetInterface *interface)
{
   uint_t i;

   //Initialize TX descriptors
   for(i = 0; i < LPC176X_TX_BUFFER_COUNT; i++)
   {
      //Base address of the buffer containing transmit data
      txDesc[i].packet = (uint32_t) txBuffer[i];
      //Transmit descriptor control word
      txDesc[i].control = 0;
      //Transmit status information word
      txStatus[i].info = 0;
   }

   //Initialize RX descriptors
   for(i = 0; i < LPC176X_RX_BUFFER_COUNT; i++)
   {
      //Base address of the buffer for storing receive data
      rxDesc[i].packet = (uint32_t) rxBuffer[i];
      //Receive descriptor control word
      rxDesc[i].control = RX_CTRL_INTERRUPT | (LPC176X_RX_BUFFER_SIZE - 1);
      //Receive status information word
      rxStatus[i].info = 0;
      //Receive status HashCRC word
      rxStatus[i].hashCrc = 0;
   }

   //Initialize EMAC transmit descriptor registers
   LPC_EMAC->TxDescriptor = (uint32_t) txDesc;
   LPC_EMAC->TxStatus = (uint32_t) txStatus;
   LPC_EMAC->TxDescriptorNumber = LPC176X_TX_BUFFER_COUNT - 1;
   LPC_EMAC->TxProduceIndex = 0;

   //Initialize EMAC receive descriptor registers
   LPC_EMAC->RxDescriptor = (uint32_t) rxDesc;
   LPC_EMAC->RxStatus = (uint32_t) rxStatus;
   LPC_EMAC->RxDescriptorNumber = LPC176X_RX_BUFFER_COUNT - 1;
   LPC_EMAC->RxConsumeIndex = 0;
}


/**
 * @brief LPC176x Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void lpc176xEthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void lpc176xEthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   NVIC_EnableIRQ(ENET_IRQn);
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void lpc176xEthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   NVIC_DisableIRQ(ENET_IRQn);
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief LPC176x Ethernet MAC interrupt service routine
 **/

void ENET_IRQHandler(void)
{
   uint_t i;

   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //Read interrupt status register
   uint32_t status = LPC_EMAC->IntStatus;

   //A packet has been transmitted?
   if(status & INT_TX_DONE)
   {
      //Clear TxDone interrupt flag
      LPC_EMAC->IntClear = INT_TX_DONE;

      //Get the index of the next descriptor
      i = LPC_EMAC->TxProduceIndex + 1;
      //Wrap around if necessary
      if(i >= LPC176X_TX_BUFFER_COUNT) i = 0;

      //Check whether the TX buffer is available for writing
      if(i != LPC_EMAC->TxConsumeIndex)
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //A packet has been received?
   if(status & INT_RX_DONE)
   {
      //Disable RxDone interrupts
      LPC_EMAC->IntEnable &= ~INT_RX_DONE;

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
 * @brief LPC176x Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void lpc176xEthRxEventHandler(NetInterface *interface)
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
               LPC_EMAC->SUPP = SUPP_SPEED;
            else
               LPC_EMAC->SUPP = 0;

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
            {
               //The MAC operates in full-duplex mode
               LPC_EMAC->MAC2 |= MAC2_FULL_DUPLEX;
               LPC_EMAC->Command |= COMMAND_FULL_DUPLEX;
               //Configure Back-to-Back Inter-Packet Gap
               LPC_EMAC->IPGT = IPGT_FULL_DUPLEX;
            }
            else
            {
               //The MAC operates in half-duplex mode
               LPC_EMAC->MAC2 &= ~MAC2_FULL_DUPLEX;
               LPC_EMAC->Command &= ~COMMAND_FULL_DUPLEX;
               //Configure Back-to-Back Inter-Packet Gap
               LPC_EMAC->IPGT = IPGT_HALF_DUPLEX;
            }
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(LPC_EMAC->IntStatus & INT_RX_DONE)
   {
      //Clear RxDone interrupt flag
      LPC_EMAC->IntClear = INT_RX_DONE;

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = lpc176xEthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;

         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable TxDone and RxDone interrupts
   LPC_EMAC->IntEnable = INT_TX_DONE | INT_RX_DONE;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t lpc176xEthSetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint32_t hashTable[2];

   //Debug message
   TRACE_INFO("Updating LPC176x hash table...\r\n");

   //Clear hash table
   hashTable[0] = 0;
   hashTable[1] = 0;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = lpc176xEthCalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //Bits [28:23] are used to form the hash
      k = (crc >> 23) & 0x3F;
      //Update hash table contents
      hashTable[k / 32] |= (1 << (k % 32));
   }

   //Write the hash table
   LPC_EMAC->HashFilterL = hashTable[0];
   LPC_EMAC->HashFilterH = hashTable[1];

   //Debug message
   TRACE_INFO("  HashFilterL = %08" PRIX32 "\r\n", LPC_EMAC->HashFilterL);
   TRACE_INFO("  HashFilterH = %08" PRIX32 "\r\n", LPC_EMAC->HashFilterH);

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

error_t lpc176xEthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   uint_t i;
   uint_t j;

   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(!length)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //We are done since the buffer is empty
      return NO_ERROR;
   }
   else if(length > LPC176X_TX_BUFFER_SIZE)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Get the index of the current descriptor
   i = LPC_EMAC->TxProduceIndex;
   //Get the index of the next descriptor
   j = i + 1;
   //Wrap around if necessary
   if(j >= LPC176X_TX_BUFFER_COUNT) j = 0;

   //Check whether the transmit descriptor array is full
   if(j == LPC_EMAC->TxConsumeIndex)
      return ERROR_FAILURE;

   //Copy user data to the transmit buffer
   chunkedBufferRead((uint8_t *) txDesc[i].packet, buffer, offset, length);

   //Write the transmit control word
   txDesc[i].control = TX_CTRL_INTERRUPT | TX_CTRL_LAST |
      TX_CTRL_CRC | TX_CTRL_PAD | ((length - 1) & TX_CTRL_SIZE);

   //Increment index and wrap around if necessary
   if(++i >= LPC176X_TX_BUFFER_COUNT) i = 0;
   //Save the resulting value
   LPC_EMAC->TxProduceIndex = i;

   //Get the index of the next descriptor
   j = i + 1;
   //Wrap around if necessary
   if(j >= LPC176X_TX_BUFFER_COUNT) j = 0;

   //Check whether the next buffer is available for writing
   if(j != LPC_EMAC->TxConsumeIndex)
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

uint_t lpc176xEthReceivePacket(NetInterface *interface,
   uint8_t *buffer, uint_t size)
{
   uint_t i;
   uint_t length;

   //Point to the current descriptor
   i = LPC_EMAC->RxConsumeIndex;

   //Make sure the current buffer is available for reading
   if(i == LPC_EMAC->RxProduceIndex)
      return 0;

   //Retrieve the length of the frame
   length = (rxStatus[i].info & RX_STATUS_SIZE) + 1;
   //Limit the number of data to read
   length = min(length, size);

   //Copy data from receive buffer
   memcpy(buffer, (uint8_t *) rxDesc[i].packet, length);

   //Increment index and wrap around if necessary
   if(++i >= LPC176X_RX_BUFFER_COUNT) i = 0;
   //Save the resulting value
   LPC_EMAC->RxConsumeIndex = i;

   //Return the number of bytes that have been received
   return length;
}


/**
 * @brief Write PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @param[in] data Register value
 **/

void lpc176xEthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Clear MCMD register
   LPC_EMAC->MCMD = 0;

   //PHY address
   LPC_EMAC->MADR = (phyAddr << 8) & MADR_PHY_ADDRESS;
   //Register address
   LPC_EMAC->MADR |= regAddr & MADR_REGISTER_ADDRESS;
   //Data to be written in the PHY register
   LPC_EMAC->MWTD = data & MWTD_WRITE_DATA;

   //Wait for the write to complete
   while(LPC_EMAC->MIND & MIND_BUSY);
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t lpc176xEthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   //PHY address
   LPC_EMAC->MADR = (phyAddr << 8) & MADR_PHY_ADDRESS;
   //Register address
   LPC_EMAC->MADR |= regAddr & MADR_REGISTER_ADDRESS;

   //Start a read operation
   LPC_EMAC->MCMD = MCMD_READ;
   //Wait for the read to complete
   while(LPC_EMAC->MIND & MIND_BUSY);
   //Clear MCMD register
   LPC_EMAC->MCMD = 0;

   //Return PHY register contents
   return LPC_EMAC->MRDD & MRDD_READ_DATA;
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t lpc176xEthCalcCrc(const void *data, size_t length)
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
