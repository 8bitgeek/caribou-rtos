/**
 * @file a2fxxxm3_eth.h
 * @brief SmartFusion (A2FxxxM3) Ethernet MAC controller
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

#ifndef _A2FXXXM3_ETH_H
#define _A2FXXXM3_ETH_H

//Dependencies
#include "nic.h"

//Number of TX buffers
#ifndef A2FXXXM3_TX_BUFFER_COUNT
   #define A2FXXXM3_TX_BUFFER_COUNT 2
#elif (A2FXXXM3_TX_BUFFER_COUNT < 1)
   #error A2FXXXM3_TX_BUFFER_COUNT parameter is not valid
#endif

//TX buffer size
#ifndef A2FXXXM3_TX_BUFFER_SIZE
   #define A2FXXXM3_TX_BUFFER_SIZE 1536
#elif (A2FXXXM3_TX_BUFFER_SIZE != 1536)
   #error A2FXXXM3_TX_BUFFER_SIZE parameter is not valid
#endif

//Number of RX buffers
#ifndef A2FXXXM3_RX_BUFFER_COUNT
   #define A2FXXXM3_RX_BUFFER_COUNT 4
#elif (A2FXXXM3_RX_BUFFER_COUNT < 1)
   #error A2FXXXM3_RX_BUFFER_COUNT parameter is not valid
#endif

//RX buffer size
#ifndef A2FXXXM3_RX_BUFFER_SIZE
   #define A2FXXXM3_RX_BUFFER_SIZE 1536
#elif (A2FXXXM3_RX_BUFFER_SIZE != 1536)
   #error A2FXXXM3_RX_BUFFER_SIZE parameter is not valid
#endif

//MDEN bit definition
#ifndef CSR9_MDEN_MASK
   #define CSR9_MDEN_MASK CSR9_MII_MASK
#endif

//Serial Management Interface
#define SMI_SYNC  0xFFFFFFFF
#define SMI_START 0x00000001
#define SMI_WRITE 0x00000001
#define SMI_READ  0x00000002
#define SMI_TA    0x00000002


/**
 * @brief Transmit DMA descriptor
 **/

typedef struct
{
   uint32_t tdes0;
   uint32_t tdes1;
   uint32_t tdes2;
   uint32_t tdes3;
} A2fxxxm3TxDmaDesc;


/**
 * @brief Receive DMA descriptor
 **/

typedef struct
{
   uint32_t rdes0;
   uint32_t rdes1;
   uint32_t rdes2;
   uint32_t rdes3;
} A2fxxxm3RxDmaDesc;


#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief Hash table setup frame
 **/

typedef struct
{
   uint32_t hashFilter[32];  //0-127
   uint32_t reserved1[7];    //128-155
   uint32_t physicalAddr[3]; //156-167
   uint32_t reserved2[6];    //168-191
} A2fxxxm3HashTableSetupFrame;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


//A2FxxxM3 Ethernet MAC driver
extern const NicDriver a2fxxxm3EthDriver;

//A2FxxxM3 Ethernet MAC related functions
error_t a2fxxxm3EthInit(NetInterface *interface);
void a2fxxxm3EthInitDmaDesc(NetInterface *interface);

void a2fxxxm3EthTick(NetInterface *interface);

void a2fxxxm3EthEnableIrq(NetInterface *interface);
void a2fxxxm3EthDisableIrq(NetInterface *interface);
void a2fxxxm3EthRxEventHandler(NetInterface *interface);

error_t a2fxxxm3EthSetMacFilter(NetInterface *interface);

error_t a2fxxxm3EthSendSetup(NetInterface *interface);

error_t a2fxxxm3EthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset);

size_t a2fxxxm3EthReceivePacket(NetInterface *interface,
   uint8_t *buffer, size_t size);

void a2fxxxm3EthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data);
uint16_t a2fxxxm3EthReadPhyReg(uint8_t phyAddr, uint8_t regAddr);

void a2fxxxm3EthWriteSmi(uint32_t data, uint_t length);
uint32_t a2fxxxm3EthReadSmi(uint_t length);

uint32_t a2fxxxm3EthCalcCrc(const void *data, size_t length);

#endif
