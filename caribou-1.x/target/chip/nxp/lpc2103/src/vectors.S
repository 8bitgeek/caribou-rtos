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
#include <chip/target.h>

	.section .vectors, "ax"
	.code 32
	.align 0
   	.extern 	irq_handler
	.extern		_irq
	.extern		reset_handler
	.extern		_systick
	.extern		_fiq_systick

/*****************************************************************************
 * Exception Vectors                                                         *
 *****************************************************************************/
	.global		_vectors
_vectors:
	ldr		pc, addr_reset_handler 		/* reset */
	ldr		pc, addr_undef_handler		/* undefined instruction */
	ldr		pc, addr_swi_handler		/* swi handler */
	ldr		pc, addr_pabort_handler		/* abort prefetch */
	ldr		pc, addr_dabort_handler		/* abort data */
	.word	0xb8a06f60					/* boot loader checksum */
	ldr		pc, addr_irq_handler		/* irq handler */
	ldr		pc, addr_fiq_handler		/* fiq handler */

addr_reset_handler:
	.word	reset_handler

addr_undef_handler:
	.word	undef_handler

addr_swi_handler:
	.word	swi_handler

addr_pabort_handler:
	.word	pabort_handler

addr_dabort_handler:
	.word	dabort_handler

addr_irq_handler:
	.word	irq_handler

addr_fiq_handler:
	.word	_fiq_systick

	.section .init, "ax"
	.code 32
	.align 0


/******************************************************************************
 *                                                                            *
 * Default exception handlers                                                 *
 * These are declared weak symbols so they can be redefined in user code.     *
 *                                                                            *
 ******************************************************************************/
undef_handler:
	b		undef_handler

swi_handler:
	b		swi_handler

pabort_handler:
	b		pabort_handler

dabort_handler:
	nop
	b		dabort_handler

	.weak	undef_handler
	.weak	swi_handler
	.weak	pabort_handler
	.weak	dabort_handler

