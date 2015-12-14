/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS.
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef __TARGET_H__
#define __TARGET_H__

#include "lpc2468.h"

/* Fosc = 16Mhz, Fcco = 288Mhz, cclk = 72Mhz, usbclk=48Mhz, pclk =  */
#define PLLCFG_VAL ((11 << PLLCFG_MSEL_BIT) | (0 << PLLCFG_NSEL_BIT))  /* 12Mhz OSC */
//#define PLLCFG_VAL ((9 << PLLCFG_MSEL_BIT) | (0 << PLLCFG_NSEL_BIT))  /* 16Mhz OSC */
//#define PLLCFG_VAL ((18 << PLLCFG_MSEL_BIT) | (0 << PLLCFG_NSEL_BIT))  /* 8Mhz OSC */
#define CCLKCFG_VAL 3
#define USBCLKCFG_VAL 5
#define fCCLK (72000000)
#define fPCLK (fCCLK / 4)

#ifndef MAMCR_VAL
#define MAMCR_VAL 1
#endif

#ifndef MAMTIM_VAL
#define MAMTIM_VAL 7
#endif

#endif /* __TARGET_H__ */
