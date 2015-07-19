/**
 * @file lm3s_eth.h
 * @brief Luminary Stellaris LM3S Ethernet controller
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

#ifndef _LM3S_ETH_H
#define _LM3S_ETH_H

//Dependencies
#include "nic.h"

//Stellaris LM3S Ethernet driver
extern const NicDriver lm3sEthDriver;

//Stellaris LM3S Ethernet related functions
error_t lm3sEthInit(NetInterface *interface);
void lm3sEthInitGpio(NetInterface *interface);

void lm3sEthTick(NetInterface *interface);

void lm3sEthEnableIrq(NetInterface *interface);
void lm3sEthDisableIrq(NetInterface *interface);
void lm3sEthRxEventHandler(NetInterface *interface);

error_t lm3sEthSetMacFilter(NetInterface *interface);

error_t lm3sEthSendPacket(NetInterface *interface,
   const ChunkedBuffer *buffer, size_t offset);

size_t lm3sEthReceivePacket(NetInterface *interface,
   uint8_t *buffer, size_t size);

void lm3sEthWritePhyReg(uint8_t address, uint16_t data);
uint16_t lm3sEthReadPhyReg(uint8_t address);

void lm3sEthDumpPhyReg(void);

#endif
