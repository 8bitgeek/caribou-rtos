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
		.extern reset_handler
		.extern caribou_systick
		.extern	caribou_pendsv
		.extern _fault
		.extern	_swi
		.extern _nmi
		.extern caribou_isr

		.global _vectors
		.section .vectors, "ax"
		.code 16
		.align 4
		.thumb_func

_vectors:
		.word __main_stack_end__	/* Reserved */
		.word reset_handler			/* Reset Vector */
		.word _nmi					/* Nmi_ISR */
		.word _fault				/* Hard Fault_ISR */
		.word _fault				/* Mem Manage Fault_ISR */
		.word _fault				/* Bus Fault_ISR */
		.word _fault				/* Usage Fault_ISR */
		.word _fault
		.word _fault
		.word _fault
		.word _fault
		.word _swi					/* Software Interrupt */
		.word _fault
		.word _fault
		.word caribou_pendsv				/* 14 PendSV  */
		.word caribou_systick				/* 15 SysTick */
		/* ---- */
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		/* 7 */
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		/* 15 */
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		/* 23 */
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		.word caribou_isr
		/* 31 */
_vectors_end:


		.end
