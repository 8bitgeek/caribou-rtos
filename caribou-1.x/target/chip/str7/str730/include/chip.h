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
#ifndef CARIBOUDRIVER_STR730_H
#define CARIBOUDRIVER_STR730_H

#include <types.h>
#include "vectors.h"

#ifdef __cplusplus
extern "C"
{
#endif

#define PART_STR730

#define	HZ				488					/* systick frequency */
#define JIFFIES			(1000/HZ)			/* number of milliseconds in a SysClock tick */

uint32_t 		driver_clock_freq(void);
extern void		driver_init(int systick_hz);

extern void		driver_interrupts_enable(void);
extern void		driver_interrupts_disable(void);
extern int		driver_interrupts_enabled(void);
extern void		driver_interrupts_set(int enable);
extern uint32_t	driver_interrupt_level(void);

extern void		driver_wfi(void);

extern void		driver_vector_enable(uint32_t vector);
extern void		driver_vector_disable(uint32_t vector);

extern int		driver_systick_irq_state(void);
extern void		driver_systick_irq_enable(void);
extern void		driver_systick_irq_disable(void);
extern void		driver_systick_irq_set(int enable);
extern void 	driver_systick_irq_force(void);
extern bool		driver_systick_count_bit(void);
extern void 	driver_systick_enter();
extern void		driver_systick_exit();

extern uint32_t	driver_delay(uint32_t count);

extern void		driver_hw_peripheral_enable(uint32_t periph);
extern void		driver_hw_peripheral_disable(uint32_t periph);
extern void		driver_hw_set_pintype_uart(uint32_t ulPort, uint8_t ucPins);
extern void		driver_hw_set_gpio_dirmode(uint32_t ulPort, uint8_t ucPins, uint32_t ulPinIO);
extern void		driver_hw_set_gpio_padconfig(uint32_t ulPort, uint8_t ucPins, uint32_t ulStrength, uint32_t ulPinType);
extern void		driver_hw_config_gpio_pin(uint32_t ulPinConfig);

extern uint32_t	driver_hw_gpio_pin_read(uint32_t ulPort, uint8_t ucPins);
extern void		driver_hw_gpio_pin_write(uint32_t ulPort, uint8_t ucPins, uint8_t ucVal);

extern void		driver_gpio_pin_type_input(uint32_t ulPort, uint8_t ucPins);
extern void		driver_gpio_pin_type_output(uint32_t ulPort, uint8_t ucPins);

extern void		driver_hw_set_pin_type_i2c(uint32_t ulPort, uint8_t ucPins);
extern void		driver_hw_set_pin_type_ssi(uint32_t ulPort, uint8_t ucPins);

extern void		driver_reset_watchdog();
extern void		driver_idle();

#ifdef __cplusplus
}
#endif

#endif
