/******************************************************************************
* Copyright © 2005-2014 by Pike Aerospace Research Corporation
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
#ifndef _CARIBOU_STM32F03x_CHIP_H
#define _CARIBOU_STM32F03x_CHIP_H

#include <caribou/kernel/types.h>
#include <chip/vectors.h>
#include <stm32f0xx_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define	HZ				1000				/* systick frequency */
#define JIFFIES			(1000/HZ)			/* number of milliseconds in a SysClock tick */

// The Cortex-M0 does not have a store-multiple-descending instruction, so we have to manually
// add the offsets to r0 when pushing onto the stack. In addition, the M0 does not operate on
// multiple registers above r7, so we have to stack all the registers in two steps. Popping is
// pretty normal since the multiple registers are in ascending direction, with the only exception
// that reglist is limited to r0-r7, so it's also a two step process to pop all the registers.
#define isr_enter() 					\
	__asm (								\
		"	push	{lr}			\n" \
		"	push	{r4-r7}			\n"	\
		"	mov		r4,r8			\n"	\
		"	mov		r5,r9			\n" \
		"	mov		r6,r10			\n" \
		"	mov		r7,r11			\n"	\
		"	push	{r4-r7}			\n"	)

//This loads the context from the PSP, the Cortex-M0 loads the other registers using hardware
#define isr_exit()					\
	__asm (								\
		"	pop		{r4-r7}			\n"	\
		"	mov		r11,r7			\n"	\
		"	mov		r10,r6			\n" \
		"	mov		r9,r5			\n" \
		"	mov		r8,r4			\n" \
		"	pop		{r4-r7}			\n"	\
		"	pop		{pc}			\n"	)


#define chip_systick_enter() (SCB->ICSR |= SCB_ICSR_PENDSTCLR_Msk)
#define chip_systick_exit()

#define chip_pendsv_enter() (SCB->ICSR |= SCB_ICSR_PENDSVCLR_Msk)
#define chip_pendsv_exit()

uint32_t		chip_clock_freq(void);
extern void		chip_init(int systick_hz);

extern void		chip_interrupts_enable(void);
extern int		chip_interrupts_disable(void);
extern int		chip_interrupts_enabled(void);
extern void		chip_interrupts_set(int enable);

extern void		chip_wfi(void);

extern int		chip_vector_enabled(uint32_t vector);
extern int		chip_vector_set(uint32_t vector,int state);
extern int		chip_vector_enable(uint32_t vector);
extern int		chip_vector_disable(uint32_t vector);

extern int		chip_systick_irq_state(void);
extern int		chip_systick_irq_enable(void);
extern int		chip_systick_irq_disable(void);
extern void		chip_systick_irq_set(int enable);
extern void		chip_pend_svc_req(void);

extern uint32_t	chip_delay(uint32_t count);

extern void		chip_reset_watchdog();
extern void		chip_idle();
extern void		chip_reset();

#ifdef __cplusplus
}
#endif

#endif
