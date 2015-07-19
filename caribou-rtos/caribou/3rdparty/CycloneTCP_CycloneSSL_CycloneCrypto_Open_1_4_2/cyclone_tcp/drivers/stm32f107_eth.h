/**
 * @file stm32f107_eth.h
 * @brief STM32F107 Ethernet MAC controller
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

#ifndef _STM32F107_ETH_H
#define _STM32F107_ETH_H

//Dependencies
#include "nic.h"

//Number of TX buffers
#ifndef STM32F107_TX_BUFFER_COUNT
   #define STM32F107_TX_BUFFER_COUNT 2
#elif (STM32F107_TX_BUFFER_COUNT < 1)
   #error STM32F107_TX_BUFFER_COUNT parameter is not valid
#endif

//TX buffer size
#ifndef STM32F107_TX_BUFFER_SIZE
   #define STM32F107_TX_BUFFER_SIZE 1536
#elif (STM32F107_TX_BUFFER_SIZE != 1536)
   #error STM32F107_TX_BUFFER_SIZE parameter is not valid
#endif

//Number of RX buffers
#ifndef STM32F107_RX_BUFFER_COUNT
   #define STM32F107_RX_BUFFER_COUNT 4
#elif (STM32F107_RX_BUFFER_COUNT < 1)
   #error STM32F107_RX_BUFFER_COUNT parameter is not valid
#endif

//RX buffer size
#ifndef STM32F107_RX_BUFFER_SIZE
   #define STM32F107_RX_BUFFER_SIZE 1536
#elif (STM32F107_RX_BUFFER_SIZE != 1536)
   #error STM32F107_RX_BUFFER_SIZE parameter is not valid
#endif

//Transmit DMA descriptor flags
#define ETH_TDES0_OWN   0x80000000
#define ETH_TDES0_IC    0x40000000
#define ETH_TDES0_LS    0x20000000
#define ETH_TDES0_FS    0x10000000
#define ETH_TDES0_DC    0x08000000
#define ETH_TDES0_DP    0x04000000
#define ETH_TDES0_TTSE  0x02000000
#define ETH_TDES0_CIC   0x00C00000
#define ETH_TDES0_TER   0x00200000
#define ETH_TDES0_TCH   0x00100000
#define ETH_TDES0_TTSS  0x00020000
#define ETH_TDES0_IHE   0x00010000
#define ETH_TDES0_ES    0x00008000
#define ETH_TDES0_JT    0x00004000
#define ETH_TDES0_FF    0x00002000
#define ETH_TDES0_IPE   0x00001000
#define ETH_TDES0_LCA   0x00000800
#define ETH_TDES0_NC    0x00000400
#define ETH_TDES0_LCO   0x00000200
#define ETH_TDES0_EC    0x00000100
#define ETH_TDES0_VF    0x00000080
#define ETH_TDES0_CC    0x00000078
#define ETH_TDES0_ED    0x00000004
#define ETH_TDES0_UF    0x00000002
#define ETH_TDES0_DB    0x00000001
#define ETH_TDES1_TBS2  0x1FFF0000
#define ETH_TDES1_TBS1  0x00001FFF
#define ETH_TDES2_TBAP1 0xFFFFFFFF
#define ETH_TDES3_TBAP2 0xFFFFFFFF

//Receive DMA descriptor flags
#define ETH_RDES0_OWN   0x80000000
#define ETH_RDES0_AFM   0x40000000
#define ETH_RDES0_FL    0x3FFF0000
#define ETH_RDES0_ES    0x00008000
#define ETH_RDES0_DE    0x00004000
#define ETH_RDES0_SAF   0x00002000
#define ETH_RDES0_LE    0x00001000
#define ETH_RDES0_OE    0x00000800
#define ETH_RDES0_VLAN  0x00000400
#define ETH_RDES0_FS    0x00000200
#define ETH_RDES0_LS    0x00000100
#define ETH_RDES0_IPHCE 0x00000080
#define ETH_RDES0_LCO   0x00000040
#define ETH_RDES0_FT    0x00000020
#define ETH_RDES0_RWT   0x00000010
#define ETH_RDES0_RE    0x00000008
#define ETH_RDES0_DBE   0x00000004
#define ETH_RDES0_CE    0x00000002
#define ETH_RDES0_PCE   0x00000001
#define ETH_RDES1_DIC   0x80000000
#define ETH_RDES1_RBS2  0x1FFF0000
#define ETH_RDES1_RER   0x00008000
#define ETH_RDES1_RCH   0x00004000
#define ETH_RDES1_RBS1  0x00001FFF
#define ETH_RDES2_RBAP1 0xFFFFFFFF
#define ETH_RDES3_RBAP2 0xFFFFFFFF


/**
 * @brief Transmit DMA descriptor
 **/

typedef struct
{
   uint32_t tdes0;
   uint32_t tdes1;
   uint32_t tdes2;
   uint32_t tdes3;
} Stm32f107TxDmaDesc;


/**
 * @brief Receive DMA descriptor
 **/

typedef struct
{
   uint32_t rdes0;
   uint32_t rdes1;
   uint32_t rdes2;
   uint32_t rdes3;
} Stm32f107RxDmaDesc;


//STM32F107 Ethernet MAC driver
extern const NicDriver stm32f107EthDriver;

//STM32F107 Ethernet MAC related functions
error_t stm32f107EthInit(NetInterface *interface);
void stm32f107EthInitGpio(NetInterface *interface);
void stm32f107EthInitDmaDesc(NetInterface *interface);

void stm32f107EthTick(NetInterface *interface);

void stm32f107EthEnableIrq(NetInterface *interface);
void stm32f107EthDisableIrq(NetInterface *interface);
void stm32f107EthRxEventHandler(NetInterface *interface);

error_t stm32f107EthSetMacFilter(NetInterface *interface);

error_t stm32f107EthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset);

size_t stm32f107EthReceivePacket(NetInterface *interface,
   uint8_t *buffer, size_t size);

void stm32f107EthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data);
uint16_t stm32f107EthReadPhyReg(uint8_t phyAddr, uint8_t regAddr);

uint32_t stm32f107EthCalcCrc(const void *data, size_t length);

#endif
