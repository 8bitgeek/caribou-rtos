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
#ifndef _CARIBOU_STELLARIS_CHIP_H
#define _CARIBOU_STELLARIS_CHIP_H

#include <caribou/kernel/types.h>
#include <chip/vectors.h>
#include <inc/lm3s8962.h>
#include <inc/hw_types.h>
#include <inc/hw_sysctl.h>
#include <inc/hw_nvic.h>
#include <inc/hw_memmap.h>
#include <inc/hw_uart.h>
#include <inc/hw_gpio.h>
#include <inc/hw_watchdog.h>
#include <driverlib/sysctl.h>
#include <driverlib/gpio.h>
#include <driverlib/uart.h>
#include <driverlib/pin_map.h>
#include <driverlib/watchdog.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define	HZ				1000
#define JIFFIES			(1000/HZ)			// number of milliseconds in a SysClock tick

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

extern int		chip_vector_pending(uint32_t vector);
extern int		chip_vector_pend(uint32_t vector);
extern int		chip_vector_unpend(uint32_t vector);

extern int		chip_systick_irq_state(void);
extern int		chip_systick_irq_enable(void);
extern int		chip_systick_irq_disable(void);
extern void		chip_systick_irq_set(int enable);
extern void		chip_pend_svc_req(void);

#define			chip_systick_enter() (HWREG(NVIC_INT_CTRL) |=  NVIC_INT_CTRL_PENDSTCLR)
#define			chip_systick_exit()

#define			chip_pendsv_enter() (HWREG(NVIC_INT_CTRL) |=  NVIC_INT_CTRL_UNPEND_SV)
#define			chip_pendsv_exit()

extern uint32_t	chip_delay(uint32_t count);

extern void		chip_init_watchdog();
extern void		chip_reset_watchdog();
extern void		chip_idle();
extern void		chip_reset();

#ifdef __cplusplus
}
#endif

#endif
