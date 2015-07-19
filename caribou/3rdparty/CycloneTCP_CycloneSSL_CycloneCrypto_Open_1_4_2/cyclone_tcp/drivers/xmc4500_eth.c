/**
 * @file xmc4500_eth.c
 * @brief Infineon XMC4500 Ethernet MAC controller
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
#include "xmc4500.h"
#include "tcp_ip_stack.h"
#include "xmc4500_eth.h"
#include "debug.h"

//Transmit buffer
static uint8_t txBuffer[XMC4500_TX_BUFFER_COUNT][XMC4500_TX_BUFFER_SIZE] __attribute__((aligned(4)));
//Receive buffer
static uint8_t rxBuffer[XMC4500_RX_BUFFER_COUNT][XMC4500_RX_BUFFER_SIZE] __attribute__((aligned(4)));
//Transmit DMA descriptors
static Xmc4500TxDmaDesc txDmaDesc[XMC4500_TX_BUFFER_COUNT] __attribute__((aligned(4)));
//Receive DMA descriptors
static Xmc4500RxDmaDesc rxDmaDesc[XMC4500_RX_BUFFER_COUNT] __attribute__((aligned(4)));
//Pointer to the current TX DMA descriptor
static Xmc4500TxDmaDesc *txCurDmaDesc;
//Pointer to the current RX DMA descriptor
static Xmc4500RxDmaDesc *rxCurDmaDesc;


/**
 * @brief XMC4500 Ethernet MAC driver
 **/

const NicDriver xmc4500EthDriver =
{
   xmc4500EthInit,
   xmc4500EthTick,
   xmc4500EthEnableIrq,
   xmc4500EthDisableIrq,
   xmc4500EthRxEventHandler,
   xmc4500EthSetMacFilter,
   xmc4500EthSendPacket,
   xmc4500EthWritePhyReg,
   xmc4500EthReadPhyReg,
   TRUE,
   TRUE,
   TRUE
};


/**
 * @brief XMC4500 Ethernet MAC initialization
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t xmc4500EthInit(NetInterface *interface)
{
   error_t error;

   //Debug message
   TRACE_INFO("Initializing XMC4500 Ethernet MAC...\r\n");

   //Disable parity error trap
   SCU_PARITY->PETE = 0;
   //Disable unaligned access trap
   PPB->CCR &= ~PPB_CCR_UNALIGN_TRP_Msk;

   //Enable ETH0 peripheral clock
   SCU_CLK->CLKSET = SCU_CLK_CLKSET_ETH0CEN_Msk;

   //GPIO configuration
   xmc4500EthInitGpio(interface);

   //Reset ETH0 peripheral
   SCU_RESET->PRSET2 = SCU_RESET_PRSET2_ETH0RS_Msk;
   SCU_RESET->PRCLR2 = SCU_RESET_PRCLR2_ETH0RS_Msk;

   //Reset DMA controller
   ETH0->BUS_MODE |= ETH_BUS_MODE_SWR_Msk;
   //Wait for the reset to complete
   while(ETH0->BUS_MODE & ETH_BUS_MODE_SWR_Msk);

   //Adjust MDC clock range depending on ETH clock frequency
   ETH0->GMII_ADDRESS = ETH_GMII_ADDRESS_CR_DIV62;

   //PHY transceiver initialization
   error = interface->phyDriver->init(interface);
   //Failed to initialize PHY transceiver?
   if(error) return error;

   //Use default MAC configuration
   ETH0->MAC_CONFIGURATION = ETH_MAC_CONFIGURATION_DO_Msk;

   //Set the MAC address
   ETH0->MAC_ADDRESS0_LOW = interface->macAddr.w[0] | (interface->macAddr.w[1] << 16);
   ETH0->MAC_ADDRESS0_HIGH = interface->macAddr.w[2];

   //Initialize hash table
   ETH0->HASH_TABLE_LOW = 0;
   ETH0->HASH_TABLE_HIGH = 0;

   //Configure the receive filter
   ETH0->MAC_FRAME_FILTER = ETH_MAC_FRAME_FILTER_HPF_Msk | ETH_MAC_FRAME_FILTER_HMC_Msk;
   //Disable flow control
   ETH0->FLOW_CONTROL = 0;
   //Enable store and forward mode
   ETH0->OPERATION_MODE = ETH_OPERATION_MODE_RSF_Msk | ETH_OPERATION_MODE_TSF_Msk;

   //Configure DMA bus mode
   ETH0->BUS_MODE = ETH_BUS_MODE_AAL_Msk | ETH_BUS_MODE_USP_Msk |
      ETH_BUS_MODE_RPBL_1 | ETH_BUS_MODE_PR_1_1 | ETH_BUS_MODE_PBL_1;

   //Initialize DMA descriptor lists
   xmc4500EthInitDmaDesc(interface);

   //Disable MAC interrupts
   ETH0->INTERRUPT_MASK = 0;
   //Configure DMA interrupts as desired
   ETH0->INTERRUPT_ENABLE |= ETH_INTERRUPT_ENABLE_NIE_Msk |
      ETH_INTERRUPT_ENABLE_RIE_Msk | ETH_INTERRUPT_ENABLE_TIE_Msk;

   //Set priority grouping (2 bits for pre-emption priority, 4 bits for subpriority)
   NVIC_SetPriorityGrouping(5);
   //Configure Ethernet interrupt priority
   NVIC_SetPriority(ETH0_0_IRQn, NVIC_EncodePriority(5, 2, 0));

   //Enable MAC transmission and reception
   ETH0->MAC_CONFIGURATION |= ETH_MAC_CONFIGURATION_TE_Msk | ETH_MAC_CONFIGURATION_RE_Msk;
   //Enable DMA transmission and reception
   ETH0->OPERATION_MODE |= ETH_OPERATION_MODE_ST_Msk | ETH_OPERATION_MODE_SR_Msk;

   //Force the TCP/IP stack to check the link state
   osEventSet(interface->nicRxEvent);
   //XMC4500 Ethernet MAC is now ready to send
   osEventSet(interface->nicTxEvent);

   //Successful initialization
   return NO_ERROR;
}


//XMC4500 Relax Kit?
#if defined(USE_XMC4500_RELAX_KIT)

/**
 * @brief GPIO configuration
 * @param[in] interface Underlying network interface
 **/

void xmc4500EthInitGpio(NetInterface *interface)
{
   uint32_t temp;

   //Configure ETH0.MDIO (P2.0), ETH0.RXD0A (P2.2) and ETH0.RXD1A (P2.3)
   temp = PORT2->IOCR0;
   temp &= ~(PORT2_IOCR0_PC0_Msk | PORT2_IOCR0_PC2_Msk | PORT2_IOCR0_PC3_Msk);
   temp |= (0UL << PORT2_IOCR0_PC0_Pos) | (0UL << PORT2_IOCR0_PC2_Pos) | (0UL << PORT2_IOCR0_PC3_Pos);
   PORT2->IOCR0 = temp;

   //Configure ETH0.RXERA (P2.4), ETH0.TX_EN (P2.5) and ETH0.MDC (P2.7)
   temp = PORT2->IOCR4;
   temp &= ~(PORT2_IOCR4_PC4_Msk | PORT2_IOCR4_PC5_Msk | PORT2_IOCR4_PC7_Msk);
   temp |= (0UL << PORT2_IOCR4_PC4_Pos) | (17UL << PORT2_IOCR4_PC5_Pos) | (17UL << PORT2_IOCR4_PC7_Pos);
   PORT2->IOCR4 = temp;

   //Configure ETH0.TXD0 (P2.8) and ETH0.TXD1 (P2.9)
   temp = PORT2->IOCR8;
   temp &= ~(PORT2_IOCR8_PC8_Msk | PORT2_IOCR8_PC9_Msk);
   temp |= (17UL << PORT2_IOCR8_PC8_Pos) | (17UL << PORT2_IOCR8_PC9_Pos);
   PORT2->IOCR8 = temp;

   //Configure ETH0.CLK_RMIIC (P15.8) and ETH0.CRS_DVC (P15.9)
   temp = PORT15->IOCR8;
   temp &= ~(PORT15_IOCR8_PC8_Msk | PORT15_IOCR8_PC9_Msk);
   temp |= (0UL << PORT15_IOCR8_PC8_Pos) | (0UL << PORT15_IOCR8_PC9_Pos);
   PORT15->IOCR8 = temp;

   //Assign ETH_MDIO (P2.0) to HW0
   temp = PORT2->HWSEL & ~PORT2_HWSEL_HW0_Msk;
   PORT2->HWSEL = temp | (1UL << PORT2_HWSEL_HW0_Pos);

   //Select output driver strength for ETH0.TX_EN (P2.5)
   temp = PORT2->PDR0;
   temp &= ~PORT2_PDR0_PD5_Msk;
   temp |= (0UL << PORT2_PDR0_PD5_Pos);
   PORT2->PDR0 = temp;

   //Select output driver strength for ETH0.TXD0 (P2.8) and ETH0.TXD1 (P2.9)
   temp = PORT2->PDR1;
   temp &= ~(PORT2_PDR1_PD8_Msk | PORT2_PDR1_PD9_Msk);
   temp |= (0UL << PORT2_PDR1_PD8_Pos) | (0UL << PORT2_PDR1_PD9_Pos);
   PORT2->PDR1 = temp;

   //Use ETH0.CLK_RMIIC (P15.8) and ETH0.CRS_DVC (P15.9) as digital inputs
   PORT15->PDISC &= ~(PORT15_PDISC_PDIS8_Msk | PORT15_PDISC_PDIS9_Msk);

   //Select RMII operation mode
   ETH0_CON->CON = ETH_CON_INFSEL_Msk | ETH_CON_MDIO_B | ETH_CON_RXER_A |
      ETH_CON_CRS_DV_C | ETH_CON_CLK_RMII_C | ETH_CON_RXD1_A | ETH_CON_RXD0_A;
}

#endif


/**
 * @brief Initialize DMA descriptor lists
 * @param[in] interface Underlying network interface
 **/

void xmc4500EthInitDmaDesc(NetInterface *interface)
{
   uint_t i;

   //Initialize TX DMA descriptor list
   for(i = 0; i < XMC4500_TX_BUFFER_COUNT; i++)
   {
      //Use chain structure rather than ring structure
      txDmaDesc[i].tdes0 = ETH_TDES0_IC | ETH_TDES0_TCH;
      //Initialize transmit buffer size
      txDmaDesc[i].tdes1 = 0;
      //Transmit buffer address
      txDmaDesc[i].tdes2 = (uint32_t) txBuffer[i];
      //Next descriptor address
      txDmaDesc[i].tdes3 = (uint32_t) &txDmaDesc[i + 1];
   }

   //The last descriptor is chained to the first entry
   txDmaDesc[i - 1].tdes3 = (uint32_t) &txDmaDesc[0];
   //Point to the very first descriptor
   txCurDmaDesc = &txDmaDesc[0];

   //Initialize RX DMA descriptor list
   for(i = 0; i < XMC4500_RX_BUFFER_COUNT; i++)
   {
      //The descriptor is initially owned by the DMA
      rxDmaDesc[i].rdes0 = ETH_RDES0_OWN;
      //Use chain structure rather than ring structure
      rxDmaDesc[i].rdes1 = ETH_RDES1_RCH | (XMC4500_RX_BUFFER_SIZE & ETH_RDES1_RBS1);
      //Receive buffer address
      rxDmaDesc[i].rdes2 = (uint32_t) rxBuffer[i];
      //Next descriptor address
      rxDmaDesc[i].rdes3 = (uint32_t) &rxDmaDesc[i + 1];
   }

   //The last descriptor is chained to the first entry
   rxDmaDesc[i - 1].rdes3 = (uint32_t) &rxDmaDesc[0];
   //Point to the very first descriptor
   rxCurDmaDesc = &rxDmaDesc[0];

   //Start location of the TX descriptor list
   ETH0->TRANSMIT_DESCRIPTOR_LIST_ADDRESS = (uint32_t) txDmaDesc;
   //Start location of the RX descriptor list
   ETH0->RECEIVE_DESCRIPTOR_LIST_ADDRESS = (uint32_t) rxDmaDesc;
}


/**
 * @brief XMC4500 Ethernet MAC timer handler
 *
 * This routine is periodically called by the TCP/IP stack to
 * handle periodic operations such as polling the link state
 *
 * @param[in] interface Underlying network interface
 **/

void xmc4500EthTick(NetInterface *interface)
{
   //Handle periodic operations
   interface->phyDriver->tick(interface);
}


/**
 * @brief Enable interrupts
 * @param[in] interface Underlying network interface
 **/

void xmc4500EthEnableIrq(NetInterface *interface)
{
   //Enable Ethernet MAC interrupts
   NVIC_EnableIRQ(ETH0_0_IRQn);
   //Enable Ethernet PHY interrupts
   interface->phyDriver->enableIrq(interface);
}


/**
 * @brief Disable interrupts
 * @param[in] interface Underlying network interface
 **/

void xmc4500EthDisableIrq(NetInterface *interface)
{
   //Disable Ethernet MAC interrupts
   NVIC_DisableIRQ(ETH0_0_IRQn);
   //Disable Ethernet PHY interrupts
   interface->phyDriver->disableIrq(interface);
}


/**
 * @brief XMC4500 Ethernet MAC interrupt service routine
 **/

void ETH0_0_IRQHandler(void)
{
   //Point to the structure describing the network interface
   NetInterface *interface = &netInterface[0];

   //This flag will be set if a higher priority task must be woken
   bool_t flag = FALSE;

   //Read DMA status register
   uint32_t status = ETH0->STATUS;

   //A packet has been transmitted?
   if(status & ETH_STATUS_TI_Msk)
   {
      //Clear TI interrupt flag
      ETH0->STATUS = ETH_STATUS_TI_Msk;

      //Check whether the TX buffer is available for writing
      if(!(txCurDmaDesc->tdes0 & ETH_TDES0_OWN))
      {
         //Notify the user that the transmitter is ready to send
         flag |= osEventSetFromIrq(interface->nicTxEvent);
      }
   }
   //A packet has been received?
   if(status & ETH_STATUS_RI_Msk)
   {
      //Disable RIE interrupt
      ETH0->INTERRUPT_ENABLE &= ~ETH_INTERRUPT_ENABLE_RIE_Msk;

      //Notify the user that a packet has been received
      flag |= osEventSetFromIrq(interface->nicRxEvent);
   }

   //Clear NIS interrupt flag
   ETH0->STATUS = ETH_STATUS_NIS_Msk;

   //The unblocked task has a priority higher than the currently running task?
   if(flag)
   {
      //Force a context switch
      osTaskSwitchFromIrq();
   }
}


/**
 * @brief XMC4500 Ethernet MAC event handler
 * @param[in] interface Underlying network interface
 **/

void xmc4500EthRxEventHandler(NetInterface *interface)
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
            uint32_t config = ETH0->MAC_CONFIGURATION;

            //10BASE-T or 100BASE-TX operation mode?
            if(interface->speed100)
               config |= ETH_MAC_CONFIGURATION_FES_Msk;
            else
               config &= ~ETH_MAC_CONFIGURATION_FES_Msk;

            //Half-duplex or full-duplex mode?
            if(interface->fullDuplex)
               config |= ETH_MAC_CONFIGURATION_DM_Msk;
            else
               config &= ~ETH_MAC_CONFIGURATION_DM_Msk;

            //Update MAC configuration register
            ETH0->MAC_CONFIGURATION = config;
         }

         //Process link state change event
         nicNotifyLinkChange(interface);
      }
   }

   //Packet received?
   if(ETH0->STATUS & ETH_STATUS_RI_Msk)
   {
      //Clear interrupt flag
      ETH0->STATUS = ETH_STATUS_RI_Msk;

      //Process all the pending packets
      while(1)
      {
         //Check whether a packet has been received
         length = xmc4500EthReceivePacket(interface, interface->ethFrame, ETH_MAX_FRAME_SIZE);
         //No packet is pending in the receive buffer?
         if(!length) break;

         //Pass the packet to the upper layer
         nicProcessPacket(interface, interface->ethFrame, length);
      }
   }

   //Re-enable DMA interrupts
   ETH0->INTERRUPT_ENABLE |= ETH_INTERRUPT_ENABLE_NIE_Msk |
      ETH_INTERRUPT_ENABLE_RIE_Msk | ETH_INTERRUPT_ENABLE_TIE_Msk;
}


/**
 * @brief Configure multicast MAC address filtering
 * @param[in] interface Underlying network interface
 * @return Error code
 **/

error_t xmc4500EthSetMacFilter(NetInterface *interface)
{
   uint_t i;
   uint_t k;
   uint32_t crc;
   uint32_t hashTable[2];

   //Debug message
   TRACE_INFO("Updating XMC4500 hash table...\r\n");

   //Clear hash table
   hashTable[0] = 0;
   hashTable[1] = 0;

   //The MAC filter table contains the multicast MAC addresses
   //to accept when receiving an Ethernet frame
   for(i = 0; i < interface->macFilterSize; i++)
   {
      //Compute CRC over the current MAC address
      crc = xmc4500EthCalcCrc(&interface->macFilter[i].addr, sizeof(MacAddr));
      //The upper 6 bits in the CRC register are used to index the contents of the hash table
      k = (crc >> 26) & 0x3F;
      //Update hash table contents
      hashTable[k / 32] |= (1 << (k % 32));
   }

   //Write the hash table
   ETH0->HASH_TABLE_LOW = hashTable[0];
   ETH0->HASH_TABLE_HIGH = hashTable[1];

   //Debug message
   TRACE_INFO("  HTL = %08" PRIX32 "\r\n", ETH0->HASH_TABLE_LOW);
   TRACE_INFO("  HTH = %08" PRIX32 "\r\n", ETH0->HASH_TABLE_HIGH);

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

error_t xmc4500EthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset)
{
   //Retrieve the length of the packet
   size_t length = chunkedBufferGetLength(buffer) - offset;

   //Check the frame length
   if(length > XMC4500_TX_BUFFER_SIZE)
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
   if(ETH0->STATUS & ETH_STATUS_TU_Msk)
   {
      //Clear TU flag to resume processing
      ETH0->STATUS = ETH_STATUS_TU_Msk;
      //Instruct the DMA to poll the transmit descriptor list
      ETH0->TRANSMIT_POLL_DEMAND = 0;
   }

   //Point to the next descriptor in the list
   txCurDmaDesc = (Xmc4500TxDmaDesc *) txCurDmaDesc->tdes3;

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

size_t xmc4500EthReceivePacket(NetInterface *interface,
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
      rxCurDmaDesc = (Xmc4500RxDmaDesc *) rxCurDmaDesc->rdes3;
   }

   //Reception process is suspended?
   if(ETH0->STATUS & ETH_STATUS_RU_Msk)
   {
      //Clear RU flag to resume processing
      ETH0->STATUS = ETH_STATUS_RU_Msk;
      //Instruct the DMA to poll the receive descriptor list
      ETH0->RECEIVE_POLL_DEMAND = 0;
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

void xmc4500EthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data)
{
   //Take care not to alter MDC clock configuration
   uint32_t value = ETH0->GMII_ADDRESS & ETH_GMII_ADDRESS_CR_Msk;
   //Set up a write operation
   value |= ETH_GMII_ADDRESS_MW_Msk | ETH_GMII_ADDRESS_MB_Msk;
   //PHY address
   value |= (phyAddr << ETH_GMII_ADDRESS_PA_Pos) & ETH_GMII_ADDRESS_PA_Msk;
   //Register address
   value |= (regAddr << ETH_GMII_ADDRESS_MR_Pos) & ETH_GMII_ADDRESS_MR_Msk;

   //Data to be written in the PHY register
   ETH0->GMII_DATA = data & ETH_GMII_DATA_MD_Msk;

   //Start a write operation
   ETH0->GMII_ADDRESS = value;
   //Wait for the write to complete
   while(ETH0->GMII_ADDRESS & ETH_GMII_ADDRESS_MB_Msk);
}


/**
 * @brief Read PHY register
 * @param[in] phyAddr PHY address
 * @param[in] regAddr Register address
 * @return Register value
 **/

uint16_t xmc4500EthReadPhyReg(uint8_t phyAddr, uint8_t regAddr)
{
   //Take care not to alter MDC clock configuration
   uint32_t value = ETH0->GMII_ADDRESS & ETH_GMII_ADDRESS_CR_Msk;
   //Set up a read operation
   value |= ETH_GMII_ADDRESS_MB_Msk;
   //PHY address
   value |= (phyAddr << ETH_GMII_ADDRESS_PA_Pos) & ETH_GMII_ADDRESS_PA_Msk;
   //Register address
   value |= (regAddr << ETH_GMII_ADDRESS_MR_Pos) & ETH_GMII_ADDRESS_MR_Msk;

   //Start a read operation
   ETH0->GMII_ADDRESS = value;
   //Wait for the read to complete
   while(ETH0->GMII_ADDRESS & ETH_GMII_ADDRESS_MB_Msk);

   //Return PHY register contents
   return ETH0->GMII_DATA & ETH_GMII_DATA_MD_Msk;
}


/**
 * @brief CRC calculation
 * @param[in] data Pointer to the data over which to calculate the CRC
 * @param[in] length Number of bytes to process
 * @return Resulting CRC value
 **/

uint32_t xmc4500EthCalcCrc(const void *data, size_t length)
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
