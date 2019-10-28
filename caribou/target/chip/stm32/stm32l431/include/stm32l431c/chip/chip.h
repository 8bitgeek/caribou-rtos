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
#ifndef _CARIBOU_CHIP_STM32F405_H_
#define _CARIBOU_CHIP_STM32F405_H_

#include <caribou/kernel/types.h>
#include <chip/vectors.h>
#include <stm32l4xx_hal_rcc.h>
#include <stm32l4xx_hal_gpio.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define	HZ				1000				/* systick frequency */
#define JIFFIES			(1000/HZ)			/* number of milliseconds in a SysClock tick */

#define isr_enter()					\
	__asm (	"	push	{lr}			\n" \
			"	push	{r4-r7}			\n"	\
			"	push	{r8-r11}		\n"	)

#define isr_exit()					\
	__asm (	"	pop		{r8-r11}		\n"	\
			"	pop		{r4-r7}			\n"	\
			"	pop		{pc}			\n"	)

uint32_t		chip_clock_freq(void);
extern void		chip_init(int systick_hz);

extern void		chip_interrupts_enable(void);
extern int		chip_interrupts_disable(void);
extern int		chip_interrupts_enabled(void);
extern void		chip_interrupts_set(int enable);
extern uint32_t	chip_interrupt_level(void);

//extern void		chip_wfi(void);
#define chip_wfi()	__asm(" wfi\n")

extern int		chip_vector_enabled(uint32_t vector);
extern int		chip_vector_set(uint32_t vector,int state);
extern int		chip_vector_enable(uint32_t vector);
extern int		chip_vector_disable(uint32_t vector);

extern int		chip_systick_irq_state(void);
extern int		chip_systick_irq_enable(void);
extern int		chip_systick_irq_disable(void);
extern void		chip_systick_irq_set(int enable);
extern void		chip_systick_irq_force(void);
extern bool		chip_systick_count_bit(void);

#define			chip_systick_enter()	(SCB->ICSR |= SCB_ICSR_PENDSTCLR_Msk)
#define			chip_systick_exit();

#define			chip_pendsv_enter()		(SCB->ICSR |= SCB_ICSR_PENDSVCLR_Msk)
#define			chip_pendsv_exit();

extern uint32_t	chip_delay(uint32_t count);

extern void		chip_watchdog_init(uint32_t period);
extern void		chip_watchdog_feed();

extern void		chip_idle();
extern void		chip_reset();

extern void     chip_get_uuid(uint32_t* uuid);

#ifdef __cplusplus
}
#endif

#endif
