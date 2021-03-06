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
		.extern _start
		.extern _systick
		.extern _fault
		.extern	_swi
		.extern _nmi

		.global _vectors
		.section vectors, "ax"
		.code 16
		.align 4
		.thumb_func

_vectors:
		.word __main_stack_end__	/* Reserved */
		.word _start    			/* Reset Vector */
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
		.word _systick				/* 14 PendSV  */
		.word _systick				/* 15 SysTick */
		/* ---- */
		.word _isr_0
		.word _isr_1
		.word _isr_2
		.word _isr_3
		.word _isr_4
		.word _isr_5
		.word _isr_6
		.word _isr_7
		/* 7 */
		.word _isr_8
		.word _isr_9
		.word _isr_10
		.word _isr_11
		.word _isr_12
		.word _isr_13
		.word _isr_14
		.word _isr_15
		/* 15 */
		.word _isr_16
		.word _isr_17
		.word _isr_18
		.word _isr_19
		.word _isr_20
		.word _isr_21
		.word _isr_22
		.word _isr_23
		/* 23 */
		.word _isr_24
		.word _isr_25
		.word _isr_26
		.word _isr_27
		.word _isr_28
		.word _isr_29
		.word _isr_30
		.word _isr_31
		/* 31 */
_vectors_end:


		.end
