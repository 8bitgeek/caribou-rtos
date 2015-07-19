/**
 * @file stm32f2x7_eth.c
 * @brief STM32F207/217 Ethernet MAC controller
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
#include "stm32f2xx.h"
#include "stm32f2xx_gpio.h"
#include "stm32f2xx_rcc.h"
#include "tcp_ip_stack.h"
#include "stm32f2x7_eth.h"
#include "debug.h"

//IAR EWARM compiler?
#if defined(__ICCARM__)

//Transmit buffer
#pragma data_alignment = 4
static uint8_t txBuffer[STM32F2X7_TX_BUFFER_COUNT][STM32F2X7_TX_BUFFER_SIZE];
//Receive buffer
#pragma data_alignment = 4
static uint8_t rxBuffer[STM32F2X7_RX_BUFFER_COUNT][STM32F2X7_RX_BUFFER_SIZE];
//Transmit DMA descriptors
#pragma data_alignment = 4
static Stm32f2x7TxDmaDesc txDmaDesc[STM32F2X7_TX_BUFFER_COUNT];
//Receive DMA descriptors
#pragma data_alignment = 4
static Stm32f2x7RxDmaDesc rxDmaDesc[STM32F2X7_RX_BUFFER_COUNT];

//Keil MDK-ARM or GCC compiler?
#else

//Transmit buffer
static uint8_t txBuffer[STM32F2X7_TX_BUFFER_COUNT][STM32F2X7_TX_BUFFER_SIZE] __attribute__((aligned(4)));
//Receive buffer
static uint8_t rxBuffer[STM32F2X7_RX_BUFFER_COUNT][STM32F2X7_RX_BUFFER_SIZE] __attribute__((aligned(4)));
//Transmit DMA descriptors
static Stm32f2x7TxDmaDesc txDmaDesc[STM32F2X7_TX_BUFFER_COUNT] __attribute__((aligned(4)));
//Receive DMA descriptors
static Stm32f2x7RxDmaDesc rxDmaDesc[STM32F2X7_RX_BUFFER_COUNT] __attribute__((aligned(4)));

#endif

//Pointer to the current TX DMA descriptor
static Stm32f2x7TxDmaDesc *txCurDmaDesc;
//Pointer to the current RX DMA descriptor
static Stm32f2x7RxDmaDesc *rxCurDmaDesc;


/**
 * @brief STM32F207/217 Ethernet MAC driver
 **/

const NicDriver stm32f2x7EthDriver =
{
   stm32f2x7EthInit,
   stm32f2x7EthTick,
   stm32f2x7EthEnableIrq,
   stm32f2x7EthDisableIrq,
   stm32f2x7EthRxEventHandler,
   stm32f2x7EthSetMacFilter,
   stm32f2x7EthSendPacket,
   stm32f2x7EthWritePhyReg,
   stm32f2x7EthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief STM32F207/217 Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t stm32f2x7EthInit(NetInterface *interface)
{
   error_t error;

   //Debug message
   TRACE_INFO("Initializing STM32F2x7 Ethernet MAC...\r\n");

   //GPIO configuration
   stm32f2x7EthInitGpio(interface);

   //Enable Ethernet MAC clock
   RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_ETH_MAC |
      RCC_AHB1Periph_ETH_MAC_Tx | RCC_AHB1Periph_ETH_MAC_Rx, ENABLE);

   //Reset Ethernet MAC peripheral
   RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_ETH_MAC, ENABLE);
   RCC_AHB1PeriphResetCmd(RCC_AHB1Periph_ETH_MAC, DISABLE);

   //Perform a software reset
   ETH->DMABMR |= ETH_DMABMR_SR;
   //Wait for the reset to complete
   while(ETH->DMABMR & ETH_DMABMR_SR);

   //Adjust MDC clock range depending on HCLK frequency
   ETH->MACMIIAR = ETH_MACMIIAR_CR_Div62;

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Use default MAC configuration
   ETH->MACCR = ETH_MACCR_ROD;

   //Set the MAC address
   ETH->MACA0LR = interface->macAddr.w[0] | (interface->macAddr.w[1] << 16);
   ETH->MACA0HR = interface->macAddr.w[2];

   //Initialize hash table
   ETH->MACHTLR = 0;
   ETH->MACHTHR = 0;

   //Configure the receive filter
   ETH->MACFFR = ETH_MACFFR_HPF | ETH_MACFFR_HM;
   //Disable flow control
   ETH->MACFCR = 0;
   //Enable store and forward mode
   ETH->DMAOMR = ETH_DMAOMR_RSF | ETH_DMAOMR_TSF;

   //Configure DMA bus mode
   ETH->DMABMR = ETH_DMABMR_AAB | ETH_DMABMR_USP | ETH_DMABMR_RDP_1Beat |
      ETH_DMABMR_RTPR_1_1 | ETH_DMABMR_PBL_1Beat | ETH_DMABMR_EDE;

   //Initialize DMA descriptor lists
   stm32f2x7EthInitDmaDesc(interface);

   //Disable MAC interrupts
   ETH->MACIMR = 0;
   //Configure DMA interrupts as desired
   ETH->DMAIER |= ETH_DMAIER_NISE | ETH_DMAIER_RIE | ETH_DMAIER_TIE;

   //Set priority grouping (2 bits for pre-emption priority, 2 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure Ethernet interrupt priority
   NVIC_SetPriority(ETH_IRQn, NVIC_EncodePriority(5, 2, 0));

   //Enable MAC transmission and reception
   ETH->MACCR |= ETH_MACCR_TE | ETH_MACCR_RE;
   //Enable DMA transmission and reception
   ETH->DMAOMR |= ETH_DMAOMR_ST | ETH_DMAOMR_SR;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //STM32F207/217 Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//STM3220G-EVAL evaluation board?
#if defined(USE_STM322xG_EVAL)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void stm32f2x7EthInitGpio(NetInterface *interface)
{
   GPIO_InitTypeDef GPIO_InitStructure;

   //Enable SYSCFG clock
   RCC_APB2PeriphClockCmd(RCC_APB2Periph_SYSCFG, ENABLE);

   //Enable GPIO clocks
   RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA | RCC_AHB1Periph_GPIOB |
      RCC_AHB1Periph_GPIOC | RCC_AHB1Periph_GPIOG |
      RCC_AHB1Periph_GPIOH | RCC_AHB1Periph_GPIOI, ENABLE);

   //Configure MCO1 (PA8) as an output
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_8;
   GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
   GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
   GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
   GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
   GPIO_Init(GPIOA, &GPIO_InitStructure);

   //Configure MCO1 pin to output the HSE clock (25MHz)
   RCC_MCO1Config(RCC_MCO1Source_HSE, RCC_MCO1Div_1);

   //Select MII interface mode
   SYSCFG_ETH_MediaInterfaceConfig(SYSCFG_ETH_MediaInterface_MII);

   //Configure ETH_MII_RX_CLK (PA1), ETH_MDIO (PA2) and ETH_MII_RX_DV (PA7)
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_7;
   GPIO_Init(GPIOA, &GPIO_InitStructure);
   GPIO_PinAFConfig(GPIOA, GPIO_PinSource1, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOA, GPIO_PinSource2, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOA, GPIO_PinSource7, GPIO_AF_ETH);

   //Configure ETH_PPS_OUT (PB5) and ETH_MII_TXD3 (PB8)
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5 | GPIO_Pin_8;
   GPIO_Init(GPIOB, &GPIO_InitStructure);
   GPIO_PinAFConfig(GPIOB, GPIO_PinSource5, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOB, GPIO_PinSource8, GPIO_AF_ETH);

   //Configure ETH_MDC (PC1), ETH_MII_TXD2 (PC2), ETH_MII_TX_CLK (PC3),
   //ETH_MII_RXD0 (PC4) and ETH_MII_RXD1 (PC5)
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1 | GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4 | GPIO_Pin_5;
   GPIO_Init(GPIOC, &GPIO_InitStructure);
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource1, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource2, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource3, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource4, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOC, GPIO_PinSource5, GPIO_AF_ETH);

   //Configure ETH_MII_TX_EN (PG11), ETH_MII_TXD0 (PG13) and ETH_MII_TXD1 (PG14)
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_11 | GPIO_Pin_13 | GPIO_Pin_14;
   GPIO_Init(GPIOG, &GPIO_InitStructure);
   GPIO_PinAFConfig(GPIOG, GPIO_PinSource11, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOG, GPIO_PinSource13, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOG, GPIO_PinSource14, GPIO_AF_ETH);

   //Configure ETH_MII_CRS (PH2), ETH_MII_COL (PH3), ETH_MII_RXD2 (PH6) and ETH_MII_RXD3 (PH7)
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_6 | GPIO_Pin_7;
   GPIO_Init(GPIOH, &GPIO_InitStructure);
   GPIO_PinAFConfig(GPIOH, GPIO_PinSource2, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOH, GPIO_PinSource3, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOH, GPIO_PinSource6, GPIO_AF_ETH);
   GPIO_PinAFConfig(GPIOH, GPIO_PinSource7, GPIO_AF_ETH);

   //Configure ETH_MII_RX_ER (PI10)
   GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
   GPIO_Init(GPIOI, &GPIO_InitStructure);
   GPIO_PinAFConfig(GPIOI, GPIO_PinSource10, GPIO_AF_ETH);
}

#endif


/**
 * @brief Initialize DMA descriptor lists
 * @param[in] interface Underlying network interface
 **/

void stm32f2x7EthInitDmaDesc(NetInterface *interface)
{
   uint_t i;

   //Initialize TX DMA descriptor list
   for(i = 0; i < STM32F2X7_TX_BUFFER_COUNT; i++)
   {
      //Use chain structure rather than ring structure
      txDmaDesc[i].tdes0 = ETH_TDES0_IC | ETH_TDES0_TCH;
      //Initialize transmit buffer size
      txDmaDesc[i].tdes1 = 0;
      //Transmit buffer address
      txDmaDesc[i].tdes2 = (uint32_t) txBuffer[i];
      //Next descriptor address
      txDmaDesc[i].tdes3 = (uint32_t) &txDmaDesc[i + 1];
      //Reserved fields
      txDmaDesc[i].tdes4 = 0;
      txDmaDesc[i].tdes5 = 0;
      //Transmit frame time stamp
      txDmaDesc[i].tdes6 = 0;
      txDmaDesc[i].tdes7 = 0;
   }

   //The last descriptor is chained to the first entry
   txDmaDesc[i - 1].tdes3 = (uint32_t) &txDmaDesc[0];
   //Point to the very first descriptor
   txCurDmaDesc = &txDmaDesc[0];

   //Initialize RX DMA descriptor list
   for(i = 0; i < STM32F2X7_RX_BUFFER_COUNT; i++)
   {
      //The descriptor is initially owned by the DMA
      rxDmaDesc[i].rdes0 = ETH_RDES0_OWN;
      //Use chain structure rather than ring structure
      rxDmaDesc[i].rdes1 = ETH_RDES1_RCH | (STM32F2X7_RX_BUFFER_SIZE & ETH_RDES1_RBS1);
      //Receive buffer address
      rxDmaDesc[i].rdes2 = (uint32_t) rxBuffer[i];
      //Next descriptor address
      rxDmaDesc[i].rdes3 = (uint32_t) &rxDmaDesc[i + 1];
      //Extended status
      rxDmaDesc[i].rdes4 = 0;
      //Reserved field
      rxDmaDesc[i].rdes5 = 0;
      //Receive frame time stamp
      rxDmaDesc[i].rdes6 = 0;
      rxDmaDesc[i].rdes7 = 0;
   }

   //The last descriptor is chained to the first entry
   rxDmaDesc[i - 1].rdes3 = (uint32_t) &rxDmaDesc[0];
   //Point to the very first descriptor
   rxCurDmaDesc = &rxDmaDesc[0];

   //Start location of the TX descriptor list
   ETH->DMATDLAR = (uint32_t) txDmaDesc;
   //Start location of the RX descriptor list
   ETH->DMARDLAR = (uint32_t) rxDmaDesc;
}


/**
 * @brief STM32F207/217 Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void stm32f2x7EthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void stm32f2x7EthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   NVIC_EnableIRQ(ETH_IRQn);
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void stm32f2x7EthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   NVIC_DisableIRQ(ETH_IRQn);
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief STM32F207/217 Ethernet MAC interrupt service routine
 **/

void ETH_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //Read DMA status register
   uint32_t status = ETH->DMASR;

   //A packet has been transmitted?
   if(status & ETH_DMASR_TS)
   {
      //Clear TS interrupt flag
      ETH->DMASR = ETH_DMASR_TS;

      //Check whether the TX buffer is available for writing
      if(!(txCurDmaDesc->tdes0 & ETH_TDES0_OWN))
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //A packet has been received?
   if(status & ETH_DMASR_RS)
   {
      //Disable RIE interrupt
      ETH->DMAIER &= ~ETH_DMAIER_RIE;

      //Notify the user that a packet has been received
      flag |= osEventSetFromIrq(interface->nicRxEvent);
   }

   //Clear NIS interrupt flag
   ETH->DMASR = ETH_DMASR_NIS;

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief STM32F207/217 Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void stm32f2x7EthRxEventHandler(NetInterface *interface)
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
            //Read current MAC configuration
            uint32_t config = ETH->MACCR;

            //10BASE-T or 100BASE-TX operation mode?
            if(interface->speed100)
               config |= ETH_MACCR_FES;
            else
               config &= ~ETH_MACCR_FES;

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
               config |= ETH_MACCR_DM;
            else
               config &= ~ETH_MACCR_DM;

            //Update MAC configuration register
            ETH->MACCR = config;
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(ETH->DMASR & ETH_DMASR_RS)
   {
      //Clear interrupt flag
      ETH->DMASR = ETH_DMASR_RS;

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = stm32f2x7EthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;

         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable DMA interrupts
   ETH->DMAIER |= ETH_DMAIER_NISE | ETH_DMAIER_RIE | ETH_DMAIER_TIE;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t stm32f2x7EthSetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint32_t hashTable[2];

   //Debug message
   TRACE_INFO("Updating STM32F2x7 hash table...\r\n");

   //Clear hash table
   hashTable[0] = 0;
   hashTable[1] = 0;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = stm32f2x7EthCalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //The upper 6 bits in the CRC register are used to index the contents of the hash table
      k = (crc >> 26) & 0x3F;
      //Update hash table contents
      hashTable[k / 32] |= (1 << (k % 32));
   }

   //Write the hash table
   ETH->MACHTLR = hashTable[0];
   ETH->MACHTHR = hashTable[1];

   //Debug message
   TRACE_INFO("  MACHTLR = %08" PRIX32 "\r\n", ETH->MACHTLR);
   TRACE_INFO("  MACHTHR = %08" PRIX32 "\r\n", ETH->MACHTHR);

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

error_t stm32f2x7EthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > STM32F2X7_TX_BUFFER_SIZE)
   {
      //The transmitter can accept another packet
      osEventSet(interface->nicTxEvent);
      //Report an error
      return ERROR_INVALID_LENGTH;
   }

   //Make sure the current buffer is available for writing
   if(txCurDmaDesc->tdes0 & ETH_TDES0_OWN)
      return ERROR_FAILURE;

   //Copy user data to the transmit buffer
   chunkedBufferRead((uint8_t *) txCurDmaDesc->tdes2, buffer, offset, length);

   //Write the number of bytes to send
   txCurDmaDesc->tdes1 = length & ETH_TDES1_TBS1;
   //Set LS and FS flags as the data fits in a single buffer
   txCurDmaDesc->tdes0 |= ETH_TDES0_LS | ETH_TDES0_FS;
   //Give the ownership of the descriptor to the DMA
   txCurDmaDesc->tdes0 |= ETH_TDES0_OWN;

   //Transmission is currently suspended?
   if(ETH->DMASR & ETH_DMASR_TBUS)
   {
      //Clear TBUS flag to resume processing
      ETH->DMASR = ETH_DMASR_TBUS;
      //Instruct the DMA to poll the transmit descriptor list
      ETH->DMATPDR = 0;
   }

   //Point to the next descriptor in the list
   txCurDmaDesc = (Stm32f2x7TxDmaDesc *) txCurDmaDesc->tdes3;

   //Check whether the next buffer is available for writing
   if(!(txCurDmaDesc->tdes0 & ETH_TDES0_OWN))
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

size_t stm32f2x7EthReceivePacket(NetInterface *interface,
   uint8_t *buffer, size_t size)
{
   //Total number of bytes received
   uint_t length = 0;

   //The current buffer is available for reading?
   if(!(rxCurDmaDesc->rdes0 & ETH_RDES0_OWN))
   {
      //FS and LS flags should be set
      if((rxCurDmaDesc->rdes0 & ETH_RDES0_FS) && (rxCurDmaDesc->rdes0 & ETH_RDES0_LS))
      {
         //Make sure no error occurred
         if(!(rxCurDmaDesc->rdes0 & ETH_RDES0_ES))
         {
            //Retrieve the length of the frame
            length = (rxCurDmaDesc->rdes0 & ETH_RDES0_FL) >> 16;
            //Limit the number of data to read
            length = min(length, size);
            //Copy data from the receive buffer
            memcpy(buffer, (uint8_t *) rxCurDmaDesc->rdes2, length);
         }
      }

      //Give the ownership of the descriptor back to the DMA
      rxCurDmaDesc->rdes0 = ETH_RDES0_OWN;
      //Point to the next descriptor in the list
      rxCurDmaDesc = (Stm32f2x7RxDmaDesc *) rxCurDmaDesc->rdes3;
   }

   //Reception process is suspended?
   if(ETH->DMASR & ETH_DMASR_RBUS)
   {
      //Clear RBUS flag to resume processing
      ETH->DMASR = ETH_DMASR_RBUS;
      //Instruct the DMA to poll the receive descriptor list
      ETH->DMARPDR = 0;
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

void stm32f2x7EthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Take care not to alter MDC clock configuration
   uint32_t value = ETH->MACMIIAR & ETH_MACMIIAR_CR;
   //Set up a write operation
   value |= ETH_MACMIIAR_MW | ETH_MACMIIAR_MB;
   //PHY address
   value |= (phyAddr << 11) & ETH_MACMIIAR_PA;
   //Register address
   value |= (regAddr << 6) & ETH_MACMIIAR_MR;

   //Data to be written in the PHY register
   ETH->MACMIIDR = data & ETH_MACMIIDR_MD;

   //Start a write operation
   ETH->MACMIIAR = value;
   //Wait for the write to complete
   while(ETH->MACMIIAR & ETH_MACMIIAR_MB);
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t stm32f2x7EthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   //Take care not to alter MDC clock configuration
   uint32_t value = ETH->MACMIIAR & ETH_MACMIIAR_CR;
   //Set up a read operation
   value |= ETH_MACMIIAR_MB;
   //PHY address
   value |= (phyAddr << 11) & ETH_MACMIIAR_PA;
   //Register address
   value |= (regAddr << 6) & ETH_MACMIIAR_MR;

   //Start a read operation
   ETH->MACMIIAR = value;
   //Wait for the read to complete
   while(ETH->MACMIIAR & ETH_MACMIIAR_MB);

   //Return PHY register contents
   return ETH->MACMIIDR & ETH_MACMIIDR_MD;
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t stm32f2x7EthCalcCrc(const void *data, size_t length)
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
   return ~crc;
}
