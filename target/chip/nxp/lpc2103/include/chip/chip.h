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
#ifndef _CARIBOU_CHIP_H_
#define _CARIBOU_CHIP_H_

#include <chip/lpc2103.h>
#include <caribou/kernel/types.h>
#include <chip/target.h>
#include <chip/vectors.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define PART_LPC2468

#define	HZ				1000				/* systick frequency */
#define JIFFIES			(1000/HZ)			/* number of milliseconds in a SysClock tick */

uint32_t 		chip_clock_freq(void);
uint32_t		chip_peripheral_clock_freq();
extern void		chip_init(int systick_hz);

extern void		chip_interrupts_enable(void);
extern int		chip_interrupts_disable(void);
extern int		chip_interrupts_enabled(void);
extern void		chip_interrupts_set(int enable);
extern uint32_t	chip_interrupt_level(void);

extern void		chip_wfi(void);

extern int		chip_vector_enable(uint32_t vector);
extern int		chip_vector_disable(uint32_t vector);
extern int		chip_vector_enabled(uint32_t vector);
extern int		chip_vector_set(uint32_t vector,int state);

extern int		chip_systick_irq_state(void);
extern int		chip_systick_irq_enable(void);
extern int		chip_systick_irq_disable(void);
extern void		chip_systick_irq_set(int enable);
extern void 	chip_systick_irq_force(void);
extern bool		chip_systick_count_bit(void);
extern void 	chip_systick_enter();
extern void		chip_systick_exit();

extern uint32_t	chip_delay(uint32_t count);

extern void		chip_hw_peripheral_enable(uint32_t periph);
extern void		chip_hw_peripheral_disable(uint32_t periph);
extern void		chip_hw_set_pintype_uart(uint32_t ulPort, uint8_t ucPins);
extern void		chip_hw_set_gpio_dirmode(uint32_t ulPort, uint8_t ucPins, uint32_t ulPinIO);
extern void		chip_hw_set_gpio_padconfig(uint32_t ulPort, uint8_t ucPins, uint32_t ulStrength, uint32_t ulPinType);
extern void		chip_hw_config_gpio_pin(uint32_t ulPinConfig);

extern uint32_t	chip_hw_gpio_pin_read(uint32_t ulPort, uint8_t ucPins);
extern void		chip_hw_gpio_pin_write(uint32_t ulPort, uint8_t ucPins, uint8_t ucVal);

extern void		chip_gpio_pin_type_input(uint32_t ulPort, uint8_t ucPins);
extern void		chip_gpio_pin_type_output(uint32_t ulPort, uint8_t ucPins);

extern void		chip_hw_set_pin_type_i2c(uint32_t ulPort, uint8_t ucPins);
extern void		chip_hw_set_pin_type_ssi(uint32_t ulPort, uint8_t ucPins);

extern void		chip_reset_watchdog();
extern void		chip_idle();
extern void		chip_reset();

#ifdef __cplusplus
}
#endif

#endif
