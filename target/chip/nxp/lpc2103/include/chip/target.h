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

#include <chip/lpc2103.h>
/* Fosc = 16Mhz, Fcco = 288Mhz, cclk = 72Mhz, usbclk=48Mhz, pclk =  */
//#define PLLCFG_VAL ((11 << PLLCFG_MSEL_BIT) | (0 << PLLCFG_NSEL_BIT))  /* 12Mhz OSC */
//#define PLLCFG_VAL ((9 << PLLCFG_MSEL_BIT) | (0 << PLLCFG_NSEL_BIT))  /* 16Mhz OSC */
//#define PLLCFG_VAL ((18 << PLLCFG_MSEL_BIT) | (0 << PLLCFG_NSEL_BIT))  /* 8Mhz OSC */
#define fCCLK (60000000)
#define fPCLK (fCCLK / 4)

#endif /* __TARGET_H__ */
