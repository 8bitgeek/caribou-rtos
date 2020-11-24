#    _________    ____  ________  ____  __  __   ____  __________  _____
#   / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
#  / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
# / /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
# \____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
#                                                                      
#
# Copyright © 2014-2015 by Mike Sharkey
# Copyleft © 2018 by Mike Sharkey 
# mike@pikeaero.com        
#
# This file is part of CARIBOU RTOS
#
# CARIBOU RTOS is free software: you can redistribute it and/or modify
# it under the terms of the Beerware License Version 43.
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 43):
# <mike@pikeaero.com> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
# ---------------------------------------------------------------------------- 

/*****************************************************************************
 * Standard definitions of Mode bits and Interrupt (I & F) flags in PSRs     *
 *       --Mike                                                              *
 *****************************************************************************/
		.set	MODE_USR,			0x10			/* User Mode */
		.set	MODE_FIQ,			0x11			/* FIQ Mode */
		.set	MODE_IRQ,			0x12			/* IRQ Mode */
		.set	MODE_SVC,			0x13			/* Supervisor Mode */
		.set	MODE_ABT,			0x17			/* Abort Mode */
		.set	MODE_UND,			0x1B			/* Undefined Mode */
		.set	MODE_SYS,			0x1F			/* System Mode */

		.equ	I_BIT,				0x80			/* when I bit is set, IRQ is disabled */
		.equ	F_BIT,				0x40			/* when F bit is set, FIQ is disabled */

		.text
		.code	32

/*****************************************************************************
 * void wr_thread_stack_ptr()                                                *
 ****************************************************************************/
		.global	wr_thread_stack_ptr
		.func	wr_thread_stack_ptr
wr_thread_stack_ptr:
		msr			CPSR_c,#MODE_SYS|I_BIT|F_BIT
		mov			sp, r0
		msr			CPSR_c,#MODE_FIQ|I_BIT|F_BIT
		bx			lr
		.size	wr_thread_stack_ptr, . - wr_thread_stack_ptr
		.endfunc

/*****************************************************************************
 * void rd_thread_stack_ptr()                                                *
 ****************************************************************************/
		.global	rd_thread_stack_ptr
		.func	rd_thread_stack_ptr
rd_thread_stack_ptr:
		msr			CPSR_c,#MODE_SYS|I_BIT|F_BIT
		mov			r0, sp
		msr			CPSR_c,#MODE_FIQ|I_BIT|F_BIT
		bx			lr
		.size	rd_thread_stack_ptr, . - rd_thread_stack_ptr
		.endfunc

		.end
