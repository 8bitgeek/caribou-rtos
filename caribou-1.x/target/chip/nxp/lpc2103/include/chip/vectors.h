/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
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
#ifndef _CARIBOU_VECTORS_H_
#define _CARIBOU_VECTORS_H_
/**
** Interrupt vectors enumerated...
*/

#define	SYS_IRQ			32					/* number of IRQs */

typedef	enum
{
	Vector_WDT=0,
	Vector_Reserved1,
	Vector_ARMCoreDbgCommRX,
	Vector_ARMCoreDBGCommTX,
	Vector_TIMER0,
	Vector_TIMER1,
	Vector_UART0,
	Vector_UART1,

	Vector_RESERVED0,
	Vector_I2C0,
	Vector_SPI_SSP0,
	Vector_SSP1,
	Vector_PLL,
	Vector_RTC,
	Vector_EINT0,
	Vector_EINT1,

	Vector_EINT2,
	Vector_RESERVED1,
	Vector_ADC0,
	Vector_I2C1,									/** DMA Error */
	Vector_RESERVED2,
	Vector_RESERVED3,
	Vector_RESERVED4,
	Vector_RESERVED5,

	Vector_RESERVED6,										/** 21 Time Base #0 */
	Vector_RESERVED7,
	Vector_TIMER2,
	Vector_TIMER3,
} InterruptVector;

#endif
