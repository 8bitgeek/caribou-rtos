/**
 * @file lpc43xx_eth.c
 * @brief LPC4300 Ethernet MAC controller
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
#include "lpc43xx.h"
#include "tcp_ip_stack.h"
#include "lpc43xx_eth.h"
#include "debug.h"

//Transmit buffer
static uint8_t txBuffer[LPC43XX_TX_BUFFER_COUNT][LPC43XX_TX_BUFFER_SIZE] __attribute__((aligned(4)));
//Receive buffer
static uint8_t rxBuffer[LPC43XX_RX_BUFFER_COUNT][LPC43XX_RX_BUFFER_SIZE] __attribute__((aligned(4)));
//Transmit DMA descriptors
static Lpc43xxTxDmaDesc txDmaDesc[LPC43XX_TX_BUFFER_COUNT] __attribute__((aligned(4)));
//Receive DMA descriptors
static Lpc43xxRxDmaDesc rxDmaDesc[LPC43XX_RX_BUFFER_COUNT] __attribute__((aligned(4)));
//Pointer to the current TX DMA descriptor
static Lpc43xxTxDmaDesc *txCurDmaDesc;
//Pointer to the current RX DMA descriptor
static Lpc43xxRxDmaDesc *rxCurDmaDesc;


/**
 * @brief LPC43xx Ethernet MAC driver
 **/

const NicDriver lpc43xxEthDriver =
{
   lpc43xxEthInit,
   lpc43xxEthTick,
   lpc43xxEthEnableIrq,
   lpc43xxEthDisableIrq,
   lpc43xxEthRxEventHandler,
   lpc43xxEthSetMacFilter,
   lpc43xxEthSendPacket,
   lpc43xxEthWritePhyReg,
   lpc43xxEthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief LPC43xx Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t lpc43xxEthInit(NetInterface *interface)
{
   error_t error;

   //Debug message
   TRACE_INFO("Initializing LPC43xx Ethernet MAC...\r\n");

   //Enable Ethernet peripheral clock
   LPC_CCU1->CLK_M4_ETHERNET_CFG |= CCU1_CLK_M4_ETHERNET_CFG_RUN_Msk;
   while(!(LPC_CCU1->CLK_M4_ETHERNET_STAT & CCU1_CLK_M4_ETHERNET_STAT_RUN_Msk));

   //Reset DMA
   LPC_RGU->RESET_EXT_STAT19 |= RGU_RESET_EXT_STAT19_MASTER_RESET_Msk;
   LPC_RGU->RESET_EXT_STAT19 &= ~RGU_RESET_EXT_STAT19_MASTER_RESET_Msk;

   //Reset Ethernet peripheral
   LPC_RGU->RESET_EXT_STAT22 |= RGU_RESET_EXT_STAT22_MASTER_RESET_Msk;
   LPC_RGU->RESET_EXT_STAT22 &= ~RGU_RESET_EXT_STAT22_MASTER_RESET_Msk;

   //GPIO configuration
   lpc43xxEthInitGpio(interface);

   //Reset Ethernet peripheral
   LPC_RGU->RESET_CTRL0 = RGU_RESET_CTRL0_ETHERNET_RST_Msk;
   while(!(LPC_RGU->RESET_ACTIVE_STATUS0 & RGU_RESET_ACTIVE_STATUS0_ETHERNET_RST_Msk));

   //Perform a software reset
   LPC_ETHERNET->DMA_BUS_MODE |= ETHERNET_DMA_BUS_MODE_SWR_Msk;
   //Wait for the reset to complete
   while(LPC_ETHERNET->DMA_BUS_MODE & ETHERNET_DMA_BUS_MODE_SWR_Msk);

   //Adjust MDC clock range
   LPC_ETHERNET->MAC_MII_ADDR = ETHERNET_MAC_MII_ADDR_CR_DIV62;

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Use default MAC configuration
   LPC_ETHERNET->MAC_CONFIG = ETHERNET_MAC_CONFIG_DO_Msk;

   //Set the MAC address
   LPC_ETHERNET->MAC_ADDR0_LOW = interface->macAddr.w[0] | (interface->macAddr.w[1] << 16);
   LPC_ETHERNET->MAC_ADDR0_HIGH = interface->macAddr.w[2];

   //Initialize hash table
   LPC_ETHERNET->MAC_HASHTABLE_LOW = 0;
   LPC_ETHERNET->MAC_HASHTABLE_HIGH = 0;

   //Configure the receive filter
   LPC_ETHERNET->MAC_FRAME_FILTER = ETHERNET_MAC_FRAME_FILTER_HPF_Msk | ETHERNET_MAC_FRAME_FILTER_HMC_Msk;
   //Disable flow control
   LPC_ETHERNET->MAC_FLOW_CTRL = 0;
   //Set the threshold level of the transmit and receive FIFOs
   LPC_ETHERNET->DMA_OP_MODE = ETHERNET_DMA_OP_MODE_TTC_64 | ETHERNET_DMA_OP_MODE_RTC_32;

   //Configure DMA bus mode
   LPC_ETHERNET->DMA_BUS_MODE = ETHERNET_DMA_BUS_MODE_AAL_Msk | ETHERNET_DMA_BUS_MODE_USP_Msk |
      ETHERNET_DMA_BUS_MODE_RPBL_1 | ETHERNET_DMA_BUS_MODE_PR_1_1 |
      ETHERNET_DMA_BUS_MODE_PBL_1 | ETHERNET_DMA_BUS_MODE_ATDS_Msk;

   //Initialize DMA descriptor lists
   lpc43xxEthInitDmaDesc(interface);

   //Disable MAC interrupts
   LPC_ETHERNET->MAC_INTR_MASK = 0;
   //Configure DMA interrupts as desired
   LPC_ETHERNET->DMA_INT_EN |= ETHERNET_DMA_INT_EN_NIE_Msk |
      ETHERNET_DMA_INT_EN_RIE_Msk | ETHERNET_DMA_INT_EN_TIE_Msk;

   //Set priority grouping (2 bits for pre-emption priority, 2 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure Ethernet interrupt priority
   NVIC_SetPriority(ETHERNET_IRQn, NVIC_EncodePriority(5, 2, 0));

   //Enable MAC transmission and reception
   LPC_ETHERNET->MAC_CONFIG |= ETHERNET_MAC_CONFIG_TE_Msk | ETHERNET_MAC_CONFIG_RE_Msk;
   //Enable DMA transmission and reception
   LPC_ETHERNET->DMA_OP_MODE |= ETHERNET_DMA_OP_MODE_ST_Msk | ETHERNET_DMA_OP_MODE_SR_Msk;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //LPC43xx Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//LPC4330-Xplorer evaluation board?
#if defined(USE_LPC4330_XPLORER)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void lpc43xxEthInitGpio(NetInterface *interface)
{
   //Enable GPIO peripheral clock
   LPC_CCU1->CLK_M4_GPIO_CFG |= CCU1_CLK_M4_GPIO_CFG_RUN_Msk;
   while(!(LPC_CCU1->CLK_M4_GPIO_STAT & CCU1_CLK_M4_GPIO_STAT_RUN_Msk));

   //Select RMII operation mode
   LPC_CREG->CREG6 &= ~CREG_CREG6_ETHMODE_Msk;
   LPC_CREG->CREG6 |= CREG6_ETHMODE_RMII;

   //Configure P0.0 (ENET_RXD1)
   LPC_SCU->SFSP0_0 = SCU_SFSP0_0_EZI_Msk | SCU_SFSP0_0_EHS_Msk | (2 & SCU_SFSP0_0_MODE_Msk);
   //Configure P0.1 (ENET_TX_EN)
   LPC_SCU->SFSP0_1 = SCU_SFSP0_1_EHS_Msk | (6 & SCU_SFSP0_1_MODE_Msk);

   //Configure P1.15 (ENET_RXD0)
   LPC_SCU->SFSP1_15 = SCU_SFSP1_15_EZI_Msk | SCU_SFSP1_15_EHS_Msk | (3 & SCU_SFSP1_15_MODE_Msk);
   //Configure P1.16 (ENET_RX_DV)
   LPC_SCU->SFSP1_16 = SCU_SFSP1_16_EZI_Msk | SCU_SFSP1_16_EHS_Msk | (7 & SCU_SFSP1_16_MODE_Msk);
   //Configure P1.17 (ENET_MDIO)
   LPC_SCU->SFSP1_17 = SCU_SFSP1_17_EZI_Msk | (3 & SCU_SFSP1_17_MODE_Msk);
   //Configure P1.18 (ENET_TXD0)
   LPC_SCU->SFSP1_18 = SCU_SFSP1_18_EHS_Msk | (3 & SCU_SFSP1_18_MODE_Msk);
   //Configure P1.19 (ENET_REF_CLK)
   LPC_SCU->SFSP1_19 = SCU_SFSP1_19_EZI_Msk | SCU_SFSP1_19_EHS_Msk | (0 & SCU_SFSP1_19_MODE_Msk);
   //Configure P1.20 (ENET_TXD1)
   LPC_SCU->SFSP1_20 = SCU_SFSP1_20_EHS_Msk | (3 & SCU_SFSP1_20_MODE_Msk);

   //Configure P2.0 (ENET_MDC)
   LPC_SCU->SFSP2_0 = (7 & SCU_SFSP2_0_MODE_Msk);
}

#endif


/**
 * @brief Initialize DMA descriptor lists
 * @param[in] interface Underlying network interface
 **/

void lpc43xxEthInitDmaDesc(NetInterface *interface)
{
   uint_t i;

   //Initialize TX DMA descriptor list
   for(i = 0; i < LPC43XX_TX_BUFFER_COUNT; i++)
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
   for(i = 0; i < LPC43XX_RX_BUFFER_COUNT; i++)
   {
      //The descriptor is initially owned by the DMA
      rxDmaDesc[i].rdes0 = ETH_RDES0_OWN;
      //Use chain structure rather than ring structure
      rxDmaDesc[i].rdes1 = ETH_RDES1_RCH | (LPC43XX_RX_BUFFER_SIZE & ETH_RDES1_RBS1);
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
   LPC_ETHERNET->DMA_TRANS_DES_ADDR = (uint32_t) txDmaDesc;
   //Start location of the RX descriptor list
   LPC_ETHERNET->DMA_REC_DES_ADDR = (uint32_t) rxDmaDesc;
}


/**
 * @brief LPC43xx Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void lpc43xxEthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void lpc43xxEthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   NVIC_EnableIRQ(ETHERNET_IRQn);
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void lpc43xxEthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   NVIC_DisableIRQ(ETHERNET_IRQn);
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief LPC43xx Ethernet MAC interrupt service routine
 **/

void ETH_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //Read DMA status register
   uint32_t status = LPC_ETHERNET->DMA_STAT;

   //A packet has been transmitted?
   if(status & ETHERNET_DMA_STAT_TI_Msk)
   {
      //Clear TI interrupt flag
      LPC_ETHERNET->DMA_STAT = ETHERNET_DMA_STAT_TI_Msk;

      //Check whether the TX buffer is available for writing
      if(!(txCurDmaDesc->tdes0 & ETH_TDES0_OWN))
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //A packet has been received?
   if(status & ETHERNET_DMA_STAT_RI_Msk)
   {
      //Disable RIE interrupt
      LPC_ETHERNET->DMA_INT_EN &= ~ETHERNET_DMA_INT_EN_RIE_Msk;

      //Notify the user that a packet has been received
      flag |= osEventSetFromIrq(interface->nicRxEvent);
   }

   //Clear NIS interrupt flag
   LPC_ETHERNET->DMA_STAT = ETHERNET_DMA_STAT_NIS_Msk;

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief LPC43xx Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void lpc43xxEthRxEventHandler(NetInterface *interface)
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
            uint32_t config = LPC_ETHERNET->MAC_CONFIG;

            //10BASE-T or 100BASE-TX operation mode?
            if(interface->speed100)
               config |= ETHERNET_MAC_CONFIG_FES_Msk;
            else
               config &= ~ETHERNET_MAC_CONFIG_FES_Msk;

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
               config |= ETHERNET_MAC_CONFIG_DM_Msk;
            else
               config &= ~ETHERNET_MAC_CONFIG_DM_Msk;

            //Update MAC configuration register
            LPC_ETHERNET->MAC_CONFIG = config;
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(LPC_ETHERNET->DMA_STAT & ETHERNET_DMA_STAT_RI_Msk)
   {
      //Clear interrupt flag
      LPC_ETHERNET->DMA_STAT = ETHERNET_DMA_STAT_RI_Msk;

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = lpc43xxEthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;

         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable DMA interrupts
   LPC_ETHERNET->DMA_INT_EN |= ETHERNET_DMA_INT_EN_NIE_Msk |
      ETHERNET_DMA_INT_EN_RIE_Msk | ETHERNET_DMA_INT_EN_TIE_Msk;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t lpc43xxEthSetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint32_t hashTable[2];

   //Debug message
   TRACE_INFO("Updating LPC43xx hash table...\r\n");

   //Clear hash table
   hashTable[0] = 0;
   hashTable[1] = 0;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = lpc43xxEthCalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //The upper 6 bits in the CRC register are used to index the contents of the hash table
      k = (crc >> 26) & 0x3F;
      //Update hash table contents
      hashTable[k / 32] |= (1 << (k % 32));
   }

   //Write the hash table
   LPC_ETHERNET->MAC_HASHTABLE_LOW = hashTable[0];
   LPC_ETHERNET->MAC_HASHTABLE_HIGH = hashTable[1];

   //Debug message
   TRACE_INFO("  MAC_HASHTABLE_LOW = %08" PRIX32 "\r\n", LPC_ETHERNET->MAC_HASHTABLE_LOW);
   TRACE_INFO("  MAC_HASHTABLE_HIGH = %08" PRIX32 "\r\n", LPC_ETHERNET->MAC_HASHTABLE_HIGH);

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

error_t lpc43xxEthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > LPC43XX_TX_BUFFER_SIZE)
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
   if(LPC_ETHERNET->DMA_STAT & ETHERNET_DMA_STAT_TU_Msk)
   {
      //Clear TU flag to resume processing
      LPC_ETHERNET->DMA_STAT = ETHERNET_DMA_STAT_TU_Msk;
      //Instruct the DMA to poll the transmit descriptor list
      LPC_ETHERNET->DMA_TRANS_POLL_DEMAND = 0;
   }

   //Point to the next descriptor in the list
   txCurDmaDesc = (Lpc43xxTxDmaDesc *) txCurDmaDesc->tdes3;

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

size_t lpc43xxEthReceivePacket(NetInterface *interface,
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
      rxCurDmaDesc = (Lpc43xxRxDmaDesc *) rxCurDmaDesc->rdes3;
   }

   //Reception process is suspended?
   if(LPC_ETHERNET->DMA_STAT & ETHERNET_DMA_STAT_RU_Msk)
   {
      //Clear RU flag to resume processing
      LPC_ETHERNET->DMA_STAT = ETHERNET_DMA_STAT_RU_Msk;
      //Instruct the DMA to poll the receive descriptor list
      LPC_ETHERNET->DMA_REC_POLL_DEMAND = 0;
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

void lpc43xxEthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Take care not to alter MDC clock configuration
   uint32_t value = LPC_ETHERNET->MAC_MII_ADDR & ETHERNET_MAC_MII_ADDR_CR_Msk;
   //Set up a write operation
   value |= ETHERNET_MAC_MII_ADDR_W_Msk | ETHERNET_MAC_MII_ADDR_GB_Msk;
   //PHY address
   value |= (phyAddr << ETHERNET_MAC_MII_ADDR_PA_Pos) & ETHERNET_MAC_MII_ADDR_PA_Msk;
   //Register address
   value |= (regAddr << ETHERNET_MAC_MII_ADDR_GR_Pos) & ETHERNET_MAC_MII_ADDR_GR_Msk;

   //Data to be written in the PHY register
   LPC_ETHERNET->MAC_MII_DATA = data & ETHERNET_MAC_MII_DATA_GD_Msk;

   //Start a write operation
   LPC_ETHERNET->MAC_MII_ADDR = value;
   //Wait for the write to complete
   while(LPC_ETHERNET->MAC_MII_ADDR & ETHERNET_MAC_MII_ADDR_GB_Msk);
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t lpc43xxEthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   //Take care not to alter MDC clock configuration
   uint32_t value = LPC_ETHERNET->MAC_MII_ADDR & ETHERNET_MAC_MII_ADDR_CR_Msk;
   //Set up a read operation
   value |= ETHERNET_MAC_MII_ADDR_GB_Msk;
   //PHY address
   value |= (phyAddr << ETHERNET_MAC_MII_ADDR_PA_Pos) & ETHERNET_MAC_MII_ADDR_PA_Msk;
   //Register address
   value |= (regAddr << ETHERNET_MAC_MII_ADDR_GR_Pos) & ETHERNET_MAC_MII_ADDR_GR_Msk;

   //Start a read operation
   LPC_ETHERNET->MAC_MII_ADDR = value;
   //Wait for the read to complete
   while(LPC_ETHERNET->MAC_MII_ADDR & ETHERNET_MAC_MII_ADDR_GB_Msk);

   //Return PHY register contents
   return LPC_ETHERNET->MAC_MII_DATA & ETHERNET_MAC_MII_DATA_GD_Msk;
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t lpc43xxEthCalcCrc(const void *data, size_t length)
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
