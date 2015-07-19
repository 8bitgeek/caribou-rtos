/**
 * @file nic.h
 * @brief Network interface controller abstraction layer
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

#ifndef _NIC_H
#define _NIC_H

//Dependencies
#include "tcp_ip_stack.h"

//Tick interval to handle NIC periodic operations
#ifndef NIC_TICK_INTERVAL
   #define NIC_TICK_INTERVAL 1000
#elif (NIC_TICK_INTERVAL < 100)
   #error NIC_TICK_INTERVAL parameter is not valid
#endif

//Size of the NIC driver context
#ifndef NIC_CONTEXT_SIZE
   #define NIC_CONTEXT_SIZE 8
#elif (NIC_CONTEXT_SIZE < 1)
   #error NIC_CONTEXT_SIZE parameter is not valid
#endif

//NIC abstraction layer
typedef error_t (*NicInit)(NetInterface *interface);
typedef void (*NicTick)(NetInterface *interface);
typedef void (*NicEnableIrq)(NetInterface *interface);
typedef void (*NicDisableIrq)(NetInterface *interface);
typedef void (*NicRxEventHandler)(NetInterface *interface);
typedef error_t (*NicSetMacFilter)(NetInterface *interface);
typedef error_t (*NicSendPacket)(NetInterface *interface, const ChunkedBuffer *buffer, size_t offset);
typedef void (*NicWritePhyReg)(uint8_t phyAddr, uint8_t regAddr, uint16_t data);
typedef uint16_t (*NicReadPhyReg)(uint8_t phyAddr, uint8_t regAddr);

//PHY abstraction layer
typedef error_t (*PhyInit)(NetInterface *interface);
typedef void (*PhyTick)(NetInterface *interface);
typedef void (*PhyEnableIrq)(NetInterface *interface);
typedef void (*PhyDisableIrq)(NetInterface *interface);
typedef bool_t (*PhyEventHandler)(NetInterface *interface);


/**
 * @brief NIC driver
 **/

typedef struct
{
   NicInit init;
   NicTick tick;
   NicEnableIrq enableIrq;
   NicDisableIrq disableIrq;
   NicRxEventHandler rxEventHandler;
   NicSetMacFilter setMacFilter;
   NicSendPacket sendPacket;
   NicWritePhyReg writePhyReg;
   NicReadPhyReg readPhyReg;
   bool_t autoPadding;
   bool_t autoCrcGen;
   bool_t autoCrcCheck;
} NicDriver;


/**
 * @brief PHY driver
 **/

typedef struct
{
   PhyInit init;
   PhyTick tick;
   PhyEnableIrq enableIrq;
   PhyDisableIrq disableIrq;
   PhyEventHandler eventHandler;
} PhyDriver;


//NIC abstraction layer
void nicTick(NetInterface *interface);
error_t nicSetMacFilter(NetInterface *interface);
error_t nicSendPacket(NetInterface *interface, const ChunkedBuffer *buffer, size_t offset);
void nicProcessPacket(NetInterface *interface, void *packet, size_t length);
void nicNotifyLinkChange(NetInterface *interface);

#endif
