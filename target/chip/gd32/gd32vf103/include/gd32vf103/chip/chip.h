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
#ifndef _CARIBOU_CHIP_H
#define _CARIBOU_CHIP_H

#include <gd32vf103.h>
#include <n200_func.h>
#include <riscv_encoding.h>
#include <caribou/kernel/types.h>
#include <chip/vectors.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define	HZ				1000				/* systick frequency */
#define JIFFIES			(1000/HZ)			/* number of milliseconds in a SysClock tick */

uint32_t		chip_clock_freq(void);
extern void		chip_init(int systick_hz);

#define chip_interrupts_enable()    cpu_int_enable()
#define chip_interrupts_disable()   cpu_int_disable()
#define chip_interrupts_enabled()   cpu_int_enabled()
#define chip_interrupts_set(e)      cpu_int_set((e))

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
extern void		chip_systick_enter(void);
extern void		chip_systick_exit(void);

#define			chip_systick_enter()	*( volatile uint8_t * )( TIMER_CTRL_ADDR + TIMER_MSIP ) = 0x00
#define			chip_systick_exit()

#define			chip_pendsv_enter()		(SCB->ICSR |= SCB_ICSR_PENDSVCLR_Msk)
#define			chip_pendsv_exit()

extern uint32_t	chip_delay(uint32_t count);

extern void		chip_reset_watchdog();
extern void		chip_idle();
extern void		chip_reset();

#ifdef __cplusplus
}
#endif

#endif
