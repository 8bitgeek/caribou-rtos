/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of DaddyBASIC.
*
*   DaddyBASIC is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <chip/target.h>

	.global		_configure

	.section	.init, "ax"
	.code		32
	.align		0

/*****************************************************************************
 * Function    : _configure                                                  *
 * Description : Configure clocks and memory.
 * Input       : r2 = The number of pclk cycles to delay.
 *****************************************************************************/
_configure:
	ldr		r0, =SCB_BASE

	mov		r5, lr

	/* Configure PLL Multiplier/Divider */
	ldr		r1, [r0, #PLLSTAT_OFFSET]
	tst		r1, #PLLSTAT_PLLC
	beq		1f

	/* Disconnect PLL */
	ldr		r1, =PLLCON_PLLE
	str		r1, [r0, #PLLCON_OFFSET]
	mov		r1, #0xAA
	str		r1, [r0, #PLLFEED_OFFSET]
	mov		r1, #0x55
	str		r1, [r0, #PLLFEED_OFFSET]
1:
	/* Disable PLL */
	ldr		r1, =0
	str		r1, [r0, #PLLCON_OFFSET]
	mov		r1, #0xAA
	str		r1, [r0, #PLLFEED_OFFSET]
	mov		r1, #0x55
	str		r1, [r0, #PLLFEED_OFFSET]

	/* Enable main oscillator */
	ldr		r1, [r0, #SCS_OFFSET]
	orr		r1, r1, #SCS_OSCEN
	str		r1, [r0, #SCS_OFFSET]
1:
	ldr		r1, [r0, #SCS_OFFSET]
	tst		r1, #SCS_OSCSTAT
	beq		1b

	/* Select main oscillator as the PLL clock source */
	ldr		r1, =1
	str		r1, [r0, #CLKSRCSEL_OFFSET]

	/* Set PLLCFG */
	ldr		r1, =PLLCFG_VAL
	str		r1, [r0, #PLLCFG_OFFSET]
	mov		r1, #0xAA
	str		r1, [r0, #PLLFEED_OFFSET]
	mov		r1, #0x55
	str		r1, [r0, #PLLFEED_OFFSET]

	/* Enable PLL */
	ldr		r1, =PLLCON_PLLE
	str		r1, [r0, #PLLCON_OFFSET]
	mov		r1, #0xAA
	str		r1, [r0, #PLLFEED_OFFSET]
	mov		r1, #0x55
	str		r1, [r0, #PLLFEED_OFFSET]

	/* Set the CPU clock divider */
	ldr		r1, =CCLKCFG_VAL
	str		r1, [r0, #CCLKCFG_OFFSET]

	/* Set the CPU clock divider */
	ldr		r1, =USBCLKCFG_VAL
	str		r1, [r0, #USBCLKCFG_OFFSET]

  /* Wait for PLL to lock */
1:
	ldr		r1, [r0, #PLLSTAT_OFFSET]
	tst		r1, #PLLSTAT_PLOCK
	beq		1b
	/* PLL Locked, connect PLL as clock source */
	mov		r1, #(PLLCON_PLLE | PLLCON_PLLC)
	str		r1, [r0, #PLLCON_OFFSET]
	mov		r1, #0xAA
	str		r1, [r0, #PLLFEED_OFFSET]
	mov		r1, #0x55
	str		r1, [r0, #PLLFEED_OFFSET]
	/* Wait for PLL to connect */
1:
	ldr		r1, [r0, #PLLSTAT_OFFSET]
	tst		r1, #PLLSTAT_PLLC
	beq		1b

	/* Initialise memory accelerator module */
	mov		r1, #0
	str		r1, [r0, #MAMCR_OFFSET]
	ldr		r1, =MAMTIM_VAL
	str		r1, [r0, #MAMTIM_OFFSET]
	ldr		r1, =MAMCR_VAL
	str		r1, [r0, #MAMCR_OFFSET]

	bx		r5
