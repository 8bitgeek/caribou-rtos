/**
 * @file k60_eth.c
 * @brief Freescale Kinetis K60 Ethernet MAC controller
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

//MK60N512MD100 device?
#if defined(MK60N512MD100)
   #include "mk60n512md100.h"
//MK60D10 device?
#elif defined(MK60D10)
   #include "mk60d10.h"
#endif

//Dependencies
#include "tcp_ip_stack.h"
#include "k60_eth.h"
#include "debug.h"


//TX buffer
static uint8_t txBuffer[K60_TX_BUFFER_COUNT][K60_TX_BUFFER_SIZE] __attribute__((aligned(4)));
//RX buffer
static uint8_t rxBuffer[K60_RX_BUFFER_COUNT][K60_RX_BUFFER_SIZE] __attribute__((aligned(4)));
//TX buffer descriptors
static uint16_t txBufferDesc[K60_TX_BUFFER_COUNT][16] __attribute__((aligned(16)));
//RX buffer descriptors
static uint16_t rxBufferDesc[K60_RX_BUFFER_COUNT][16] __attribute__((aligned(16)));
//TX buffer index
static uint_t txBufferIndex;
//RX buffer index
static uint_t rxBufferIndex;


/**
 * @brief Kinetis K60 Ethernet MAC driver
 **/

const NicDriver k60EthDriver =
{
   k60EthInit,
   k60EthTick,
   k60EthEnableIrq,
   k60EthDisableIrq,
   k60EthRxEventHandler,
   k60EthSetMacFilter,
   k60EthSendPacket,
   k60EthWritePhyReg,
   k60EthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief Kinetis K60 Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t k60EthInit(NetInterface *interface)
{
   error_t error;
   uint32_t value;

   //Debug message
   TRACE_INFO("Initializing Kinetis K60 Ethernet MAC...\r\n");

   //Disable MPU
   MPU->CESR &= ~MPU_CESR_VLD_MASK;

   //Enable external reference clock
   OSC->CR |= OSC_CR_ERCLKEN_MASK;
   //Enable ENET peripheral clock
   SIM->SCGC2 |= SIM_SCGC2_ENET_MASK;

   //GPIO configuration
   k60EthInitGpio(interface);

   //Reset ENET module
   ENET->ECR = ENET_ECR_RESET_MASK;
   //Wait for the reset to complete
   while(ENET->ECR & ENET_ECR_RESET_MASK);

   //Reveive control register
   ENET->RCR = ENET_RCR_MAX_FL(1518) | ENET_RCR_RMII_MODE_MASK | ENET_RCR_MII_MODE_MASK;
   //Transmit control register
   ENET->TCR = 0;
   //Configure MDC clock frequency
   ENET->MSCR = ENET_MSCR_MII_SPEED(19);

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Set the MAC address (upper 16 bits)
   value = interface->macAddr.b[5];
   value |= (interface->macAddr.b[4] << 8);
   ENET->PAUR = ENET_PAUR_PADDR2(value) | ENET_PAUR_TYPE(0x8808);

   //Set the MAC address (lower 32 bits)
   value = interface->macAddr.b[3];
   value |= (interface->macAddr.b[2] << 8);
   value |= (interface->macAddr.b[1] << 16);
   value |= (interface->macAddr.b[0] << 24);
   ENET->PALR = ENET_PALR_PADDR1(value);

   //Hash table for unicast address filtering
   ENET->IALR = 0;
   ENET->IAUR = 0;
   //Hash table for multicast address filtering
   ENET->GALR = 0;
   ENET->GAUR = 0;

   //Disable transmit accelerator functions
   ENET->TACC = 0;
   //Disable receive accelerator functions
   ENET->RACC = 0;

   //Use enhanced buffer descriptors
   ENET->ECR = ENET_ECR_EN1588_MASK;
   //Clear MIC counters
   ENET->MIBC = ENET_MIBC_MIB_CLEAR_MASK;

   //Initialize buffer descriptors
   k60EthInitBufferDesc(interface);

   //Clear any pending interrupts
   ENET->EIR = 0xFFFFFFFF;
   //Enable desired interrupts
   ENET->EIMR = ENET_EIMR_TXF_MASK | ENET_EIMR_RXF_MASK | ENET_EIMR_EBERR_MASK;

   //Set priority grouping (2 bits for pre-emption priority, 2 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure MAC receive interrupt priority
   NVIC_SetPriority(ENET_Receive_IRQn, NVIC_EncodePriority(5, 2, 0));

   //Enable Ethernet MAC
   ENET->ECR |= ENET_ECR_ETHEREN_MASK;
   //Instruct the DMA to poll the receive descriptor list
   ENET->RDAR = ENET_RDAR_RDAR_MASK;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //Kinetis K60 Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//TWR-K60N512 evaluation board?
#if defined(USE_TWR_K60N512)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void k60EthInitGpio(NetInterface *interface)
{
   //Enable PORTA and PORTB peripheral clocks
   SIM->SCGC5 |= SIM_SCGC5_PORTA_MASK | SIM_SCGC5_PORTB_MASK;

   //Configure RMII0_RXER (PTA5)
   PORTA->PCR[5] = PORT_PCR_MUX(4) | PORT_PCR_PE_MASK;
   //Configure RMII0_RXD1 (PTA12)
   PORTA->PCR[12] = PORT_PCR_MUX(4);
   //Configure RMII0_RXD0 (PTA13)
   PORTA->PCR[13] = PORT_PCR_MUX(4);
   //Configure RMII0_CRS_DV (PTA14)
   PORTA->PCR[14] = PORT_PCR_MUX(4);
   //Configure RMII0_TXEN (PTA15)
   PORTA->PCR[15] = PORT_PCR_MUX(4);
   //Configure RMII0_TXD0 (PTA16)
   PORTA->PCR[16] = PORT_PCR_MUX(4);
   //Configure RMII0_TXD1 (PTA17)
   PORTA->PCR[17] = PORT_PCR_MUX(4);

   //Configure RMII0_MDIO (PTB0)
   PORTB->PCR[0] = PORT_PCR_MUX(4);
   //Configure RMII0_MDC (PTB1)
   PORTB->PCR[1] = PORT_PCR_MUX(4);
}

#endif


/**
 * @brief Initialize buffer descriptors
 * @param[in] interface Underlying network interface
 **/

void k60EthInitBufferDesc(NetInterface *interface)
{
   uint_t i;
   uint32_t address;

   //Clear TX and RX buffer descriptors
   memset(txBufferDesc, 0, sizeof(txBufferDesc));
   memset(rxBufferDesc, 0, sizeof(rxBufferDesc));

   //Initialize TX buffer descriptors
   for(i = 0; i < K60_TX_BUFFER_COUNT; i++)
   {
      //Calculate the address of the current TX buffer
      address = (uint32_t) txBuffer[i];
      //Transmit buffer address
      txBufferDesc[i][2] = htobe16(address >> 16);
      txBufferDesc[i][3] = htobe16(address & 0xFFFF);
      //Generate interrupts
      txBufferDesc[i][4] = HTOBE16(ENET_TBD4_INT);
   }

   //Mark the last descriptor entry with the wrap flag
   txBufferDesc[i - 1][0] |= HTOBE16(ENET_TBD0_W);
   //Initialize TX buffer index
   txBufferIndex = 0;

   //Initialize RX buffer descriptors
   for(i = 0; i < K60_RX_BUFFER_COUNT; i++)
   {
      //Calculate the address of the current RX buffer
      address = (uint32_t) rxBuffer[i];
      //The descriptor is initially owned by the DMA
      rxBufferDesc[i][0] = HTOBE16(ENET_RBD0_E);
      //Receive buffer address
      rxBufferDesc[i][2] = htobe16(address >> 16);
      rxBufferDesc[i][3] = htobe16(address & 0xFFFF);
      //Generate interrupts
      rxBufferDesc[i][4] = HTOBE16(ENET_RBD4_INT);
   }

   //Mark the last descriptor entry with the wrap flag
   rxBufferDesc[i - 1][0] |= HTOBE16(ENET_RBD0_W);
   //Initialize RX buffer index
   rxBufferIndex = 0;

   //Start location of the TX descriptor list
   ENET->TDSR = (uint32_t) txBufferDesc;
   //Start location of the RX descriptor list
   ENET->RDSR = (uint32_t) rxBufferDesc;
   //Maximum receive buffer size
   ENET->MRBR = K60_RX_BUFFER_SIZE;
}


/**
 * @brief Kinetis K60 Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void k60EthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void k60EthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   NVIC_EnableIRQ(ENET_Transmit_IRQn);
   NVIC_EnableIRQ(ENET_Receive_IRQn);
   NVIC_EnableIRQ(ENET_Error_IRQn);
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void k60EthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   NVIC_DisableIRQ(ENET_Transmit_IRQn);
   NVIC_DisableIRQ(ENET_Receive_IRQn);
   NVIC_DisableIRQ(ENET_Error_IRQn);
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief Ethernet MAC transmit interrupt
 **/

void ENET_Transmit_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //A packet has been transmitted?
   if(ENET->EIR & ENET_EIR_TXF_MASK)
   {
      //Clear TXB interrupt flag
      ENET->EIR = ENET_EIR_TXF_MASK;

      //Check whether the TX buffer is available for writing
      if(!(txBufferDesc[txBufferIndex][0] & HTOBE16(ENET_TBD0_R)))
      {
         //The transmitter can accept another packet
         flag = osEventSetFromIrq(interface->nicTxEvent);
      }

      //Instruct the DMA to poll the transmit descriptor list
      ENET->TDAR = ENET_TDAR_TDAR_MASK;
   }

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief Ethernet MAC receive interrupt
 **/

void ENET_Receive_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //A packet has been received?
   if(ENET->EIR & ENET_EIR_RXF_MASK)
   {
      //Disable RXF interrupt
      ENET->EIMR &= ~ENET_EIMR_RXF_MASK;

      //Notify the user that a packet has been received
      flag = osEventSetFromIrq(interface->nicRxEvent);
   }

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief Ethernet MAC error interrupt
 **/

void ENET_Error_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //System bus error?
   if(ENET->EIR & ENET_EIR_EBERR_MASK)
   {
      //Disable EBERR interrupt
      ENET->EIMR &= ~ENET_EIMR_EBERR_MASK;

      //Notify the user that an error occurred
      flag = osEventSetFromIrq(interface->nicRxEvent);
   }

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief Kinetis K60 Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void k60EthRxEventHandler(NetInterface *interface)
{
   uint32_t status;
   uint_t length;
   bool_t linkStateChange;

   //Read interrupt event register
   status = ENET->EIR;

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
            //Disable Ethernet MAC while modifying configuration registers
            ENET->ECR &= ~ENET_ECR_ETHEREN_MASK;

            //10BASE-T or 100BASE-TX operation mode?
            if(interface->speed100)
            {
               //100 Mbps operation
               ENET->RCR &= ~ENET_RCR_RMII_10T_MASK;
            }
            else
            {
               //10 Mbps operation
               ENET->RCR |= ENET_RCR_RMII_10T_MASK;
            }

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
            {
               //Full-duplex mode
               ENET->TCR |= ENET_TCR_FDEN_MASK;
               //Receive path operates independently of transmit
               ENET->RCR &= ~ENET_RCR_DRT_MASK;
            }
            else
            {
               //Half-duplex mode
               ENET->TCR &= ~ENET_TCR_FDEN_MASK;
               //Disable reception of frames while transmitting
               ENET->RCR |= ENET_RCR_DRT_MASK;
            }

            //Reset buffer descriptors
            k60EthInitBufferDesc(interface);
            //Re-enable Ethernet MAC
            ENET->ECR |= ENET_ECR_ETHEREN_MASK;
            //Instruct the DMA to poll the receive descriptor list
            ENET->RDAR = ENET_RDAR_RDAR_MASK;
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(status & ENET_EIR_RXF_MASK)
   {
      //Clear RXF interrupt flag
      ENET->EIR = ENET_EIR_RXF_MASK;

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = k60EthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;
         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //System bus error?
   if(status & ENET_EIR_EBERR_MASK)
   {
      //Clear EBERR interrupt flag
      ENET->EIR = ENET_EIR_EBERR_MASK;

      //Disable Ethernet MAC
      ENET->ECR &= ~ENET_ECR_ETHEREN_MASK;
      //Reset buffer descriptors
      k60EthInitBufferDesc(interface);
      //Resume normal operation
      ENET->ECR |= ENET_ECR_ETHEREN_MASK;
      //Instruct the DMA to poll the receive descriptor list
      ENET->RDAR = ENET_RDAR_RDAR_MASK;
   }

   //Re-enable Ethernet MAC interrupts
   ENET->EIMR = ENET_EIMR_TXF_MASK | ENET_EIMR_RXF_MASK | ENET_EIMR_EBERR_MASK;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t k60EthSetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint32_t hashTable[2];

   //Debug message
   TRACE_INFO("Updating Kinetis K60 hash table...\r\n");

   //Clear hash table
   hashTable[0] = 0;
   hashTable[1] = 0;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = k60EthCalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //The upper 6 bits in the CRC register are used to index the contents of the hash table
      k = (crc >> 26) & 0x3F;
      //Update hash table contents
      hashTable[k / 32] |= (1 << (k % 32));
   }

   //Write the hash table
   ENET->GALR = hashTable[0];
   ENET->GAUR = hashTable[1];

   //Debug message
   TRACE_INFO("  GALR = %08" PRIX32 "\r\n", ENET->GALR);
   TRACE_INFO("  GAUR = %08" PRIX32 "\r\n", ENET->GAUR);

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

error_t k60EthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > K60_TX_BUFFER_SIZE)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Make sure the current buffer is available for writing
   if(txBufferDesc[txBufferIndex][0] & HTOBE16(ENET_TBD0_R))
      return ERROR_FAILURE;

   //Copy user data to the transmit buffer
   chunkedBufferRead(txBuffer[txBufferIndex], buffer, offset, length);

   //Set frame length
   txBufferDesc[txBufferIndex][1] = HTOBE16(length);
   //Clear BDU flag
   txBufferDesc[txBufferIndex][8] = 0;

   //Check current index
   if(txBufferIndex < (K60_TX_BUFFER_COUNT - 1))
   {
      //Give the ownership of the descriptor to the DMA engine
      txBufferDesc[txBufferIndex][0] = HTOBE16(ENET_TBD0_R |
         ENET_TBD0_L | ENET_TBD0_TC);
      //Point to the next buffer
      txBufferIndex++;
   }
   else
   {
      //Give the ownership of the descriptor to the DMA engine
      txBufferDesc[txBufferIndex][0] = HTOBE16(ENET_TBD0_R |
         ENET_TBD0_W | ENET_TBD0_L | ENET_TBD0_TC);
      //Point to the next buffer
      txBufferIndex = 0;
   }

   //Instruct the DMA to poll the transmit descriptor list
   ENET->TDAR = ENET_TDAR_TDAR_MASK;

   //Check whether the next buffer is available for writing
   if(!(txBufferDesc[txBufferIndex][0] & HTOBE16(ENET_TBD0_R)))
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Receive a packet
 * @param[in] interface Underlying network interface
 * @param[out] buffer Buffer where to store the incoming data
 * @param[in] size Maximum number of bytes that can be received
 * @return Number of bytes that have been received
 **/

uint_t k60EthReceivePacket(NetInterface *interface,
   uint8_t *buffer, uint_t size)
{
   //Total number of bytes received
   uint_t length = 0;

   //Make sure the current buffer is available for reading
   if(!(rxBufferDesc[rxBufferIndex][0] & HTOBE16(ENET_RBD0_E)))
   {
      //The frame should not span multiple buffers
      if(rxBufferDesc[rxBufferIndex][0] & HTOBE16(ENET_RBD0_L))
      {
         //Check whether an error occurred
         if(!(rxBufferDesc[rxBufferIndex][0] & HTOBE16(ENET_RBD0_LG |
            ENET_RBD0_NO | ENET_RBD0_CR | ENET_RBD0_OV | ENET_RBD0_TR)))
         {
            //Retrieve the length of the frame
            length = betoh16(rxBufferDesc[rxBufferIndex][1]);
            //Limit the number of data to read
            length = min(length, size);
            //Copy data from receive buffer
            memcpy(buffer, rxBuffer[rxBufferIndex], length);
         }
      }

      //Clear BDU flag
      rxBufferDesc[rxBufferIndex][8] = 0;

      //Check current index
      if(rxBufferIndex < (K60_RX_BUFFER_COUNT - 1))
      {
         //Give the ownership of the descriptor back to the DMA engine
         rxBufferDesc[rxBufferIndex][0] = HTOBE16(ENET_RBD0_E);
         //Point to the next buffer
         rxBufferIndex++;
      }
      else
      {
         //Give the ownership of the descriptor back to the DMA engine
         rxBufferDesc[rxBufferIndex][0] = HTOBE16(ENET_RBD0_E | ENET_RBD0_W);
         //Point to the next buffer
         rxBufferIndex = 0;
      }

      //Instruct the DMA to poll the receive descriptor list
      ENET->RDAR = ENET_RDAR_RDAR_MASK;
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

void k60EthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Set up a write operation
   uint32_t value = ENET_MMFR_ST(1) | ENET_MMFR_OP(1) | ENET_MMFR_TA(2);
   //PHY address
   value |= ENET_MMFR_PA(phyAddr);
   //Register address
   value |= ENET_MMFR_RA(regAddr);
   //Register value
   value |= ENET_MMFR_DATA(data);

   //Clear MII interrupt flag
   ENET->EIR = ENET_EIR_MII_MASK;
   //Start a write operation
   ENET->MMFR = value;
   //Wait for the write to complete
   while(!(ENET->EIR & ENET_EIR_MII_MASK));
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t k60EthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   //Set up a read operation
   uint32_t value = ENET_MMFR_ST(1) | ENET_MMFR_OP(2) | ENET_MMFR_TA(2);
   //PHY address
   value |= ENET_MMFR_PA(phyAddr);
   //Register address
   value |= ENET_MMFR_RA(regAddr);

   //Clear MII interrupt flag
   ENET->EIR = ENET_EIR_MII_MASK;
   //Start a read operation
   ENET->MMFR = value;
   //Wait for the read to complete
   while(!(ENET->EIR & ENET_EIR_MII_MASK));

   //Return PHY register contents
   return ENET->MMFR & ENET_MMFR_DATA_MASK;
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t k60EthCalcCrc(const void *data, size_t length)
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
      //Update CRC value
      crc ^= p[i];
      //The message is processed bit by bit
      for(j = 0; j < 8; j++)
      {
         if(crc & 0x00000001)
            crc = (crc >> 1) ^ 0xEDB88320;
         else
            crc = crc >> 1;
      }
   }

   //Return CRC value
   return crc;
}
