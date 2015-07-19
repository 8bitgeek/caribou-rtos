/**
 * @file sam4e_eth.h
 * @brief SAM4E Ethernet MAC controller
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

#ifndef _SAM4E_ETH_H
#define _SAM4E_ETH_H

//Number of TX buffers
#ifndef SAM4E_TX_BUFFER_COUNT
   #define SAM4E_TX_BUFFER_COUNT 2
#elif (SAM4E_TX_BUFFER_COUNT < 1)
   #error SAM4E_TX_BUFFER_COUNT parameter is not valid
#endif

//TX buffer size
#ifndef SAM4E_TX_BUFFER_SIZE
   #define SAM4E_TX_BUFFER_SIZE 1536
#elif (SAM4E_TX_BUFFER_SIZE != 1536)
   #error SAM4E_TX_BUFFER_SIZE parameter is not valid
#endif

//Number of RX buffers
#ifndef SAM4E_RX_BUFFER_COUNT
   #define SAM4E_RX_BUFFER_COUNT 48
#elif (SAM4E_RX_BUFFER_COUNT < 12)
   #error SAM4E_RX_BUFFER_COUNT parameter is not valid
#endif

//RX buffer size
#ifndef SAM4E_RX_BUFFER_SIZE
   #define SAM4E_RX_BUFFER_SIZE 128
#elif (SAM4E_RX_BUFFER_SIZE != 128)
   #error SAM4E_RX_BUFFER_SIZE parameter is not valid
#endif

//Legacy definitions
#ifndef PIO_PD6A_GRX1
   #define PIO_PD6A_GRX1 PIO_PD6A_GRX0
#endif

//MII signals
#define GMAC_MII_MASK (PIO_PD16A_GTX3 | \
   PIO_PD15A_GTX2 | PIO_PD14A_GRXCK | PIO_PD13A_GCOL | PIO_PD12A_GRX3 | \
   PIO_PD11A_GRX2 | PIO_PD10A_GCRS | PIO_PD9A_GMDIO | PIO_PD8A_GMDC | \
   PIO_PD7A_GRXER | PIO_PD6A_GRX1 | PIO_PD5A_GRX0 | PIO_PD4A_GRXDV | \
   PIO_PD3A_GTX1 | PIO_PD2A_GTX0 | PIO_PD1A_GTXEN | PIO_PD0A_GTXCK)

//TX buffer descriptor flags
#define GMAC_TX_USED           0x80000000
#define GMAC_TX_WRAP           0x40000000
#define GMAC_TX_RLE_ERROR      0x20000000
#define GMAC_TX_UNDERRUN_ERROR 0x10000000
#define GMAC_TX_AHB_ERROR      0x08000000
#define GMAC_TX_LATE_COL_ERROR 0x04000000
#define GMAC_TX_CHECKSUM_ERROR 0x00700000
#define GMAC_TX_NO_CRC         0x00010000
#define GMAC_TX_LAST           0x00008000
#define GMAC_TX_LENGTH         0x00003FFF

//RX buffer descriptor flags
#define GMAC_RX_ADDRESS        0xFFFFFFFC
#define GMAC_RX_WRAP           0x00000002
#define GMAC_RX_OWNERSHIP      0x00000001
#define GMAC_RX_BROADCAST      0x80000000
#define GMAC_RX_MULTICAST_HASH 0x40000000
#define GMAC_RX_UNICAST_HASH   0x20000000
#define GMAC_RX_SAR            0x08000000
#define GMAC_RX_SAR_MASK       0x06000000
#define GMAC_RX_TYPE_ID        0x01000000
#define GMAC_RX_SNAP           0x01000000
#define GMAC_RX_TYPE_ID_MASK   0x00C00000
#define GMAC_RX_CHECKSUM_VALID 0x00C00000
#define GMAC_RX_VLAN_TAG       0x00200000
#define GMAC_RX_PRIORITY_TAG   0x00100000
#define GMAC_RX_VLAN_PRIORITY  0x000E0000
#define GMAC_RX_CFI            0x00010000
#define GMAC_RX_EOF            0x00008000
#define GMAC_RX_SOF            0x00004000
#define GMAC_RX_LENGTH_MSB     0x00002000
#define GMAC_RX_BAD_FCS        0x00002000
#define GMAC_RX_LENGTH         0x00001FFF


/**
 * @brief Transmit buffer descriptor
 **/

typedef struct
{
   uint32_t address;
   uint32_t status;
} Sam4eTxBufferDesc;


/**
 * @brief Receive buffer descriptor
 **/

typedef struct
{
   uint32_t address;
   uint32_t status;
} Sam4eRxBufferDesc;


//SAM4E Ethernet MAC driver
extern const NicDriver sam4eEthDriver;

//SAM4E Ethernet MAC related functions
error_t sam4eEthInit(NetInterface *interface);
void sam4eEthInitGpio(NetInterface *interface);
void sam4eEthInitBufferDesc(NetInterface *interface);

void sam4eEthTick(NetInterface *interface);

void sam4eEthEnableIrq(NetInterface *interface);
void sam4eEthDisableIrq(NetInterface *interface);
void sam4eEthRxEventHandler(NetInterface *interface);

error_t sam4eEthSetMacFilter(NetInterface *interface);

error_t sam4eEthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset);

uint_t sam4eEthReceivePacket(NetInterface *interface,
   uint8_t *buffer, uint_t size);

void sam4eEthWritePhyReg(uint8_t phyAddr, uint8_t regAddr, uint16_t data);
uint16_t sam4eEthReadPhyReg(uint8_t phyAddr, uint8_t regAddr);

#endif
