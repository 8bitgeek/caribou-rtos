/**
 * @file sam4e_ek.h
 * @brief SAM4E-EK evaluation kit
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

#ifndef _SAM4E_EK_H
#define _SAM4E_EK_H

//Dependencies
#include "sam4e.h"

//LED1
#define LED1            PIO_PA0
#define PIO_LED1        PIOA
#define ID_PIO_LED1     ID_PIOA

//LED2
#define LED2            PIO_PD20
#define PIO_LED2        PIOD
#define ID_PIO_LED2     ID_PIOD

//LED3
#define LED3            PIO_PD21
#define PIO_LED3        PIOD
#define ID_PIO_LED3     ID_PIOD

//LED4
#define LED4            PIO_PD22
#define PIO_LED4        PIOD
#define ID_PIO_LED4     ID_PIOD

//Up button
#define BT_UP          PIO_PA1
#define PIO_BT_UP      PIOA
#define ID_PIO_BT_UP   ID_PIOA

//Down button
#define BT_DOWN        PIO_PA2
#define PIO_BT_DOWN    PIOA
#define ID_PIO_BT_DOWN ID_PIOA

//WAKU button
#define BT_WAKU        PIO_PA19
#define PIO_BT_WAKU    PIOA
#define ID_PIO_BT_WAKU ID_PIOA

//TAMP button
#define BT_TAMP        PIO_PA20
#define PIO_BT_TAMP    PIOA
#define ID_PIO_BT_TAMP ID_PIOA

#endif
