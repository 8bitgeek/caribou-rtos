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
#ifndef _CARIBOU_GPIO_LPC2468_H_
#define _CARIBOU_GPIO_LPC2468_H_

#include <caribou/kernel/types.h>
#include <chip/vectors.h>
#include <chip/lpc2468.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define GPIOA	((volatile unsigned long *)0x3FFFC014)	/* FIO0PIN */
#define GPIOB	((volatile unsigned long *)0x3FFFC034)	/* FIO1PIN */
#define GPIOC	((volatile unsigned long *)0x3FFFC054)	/* FIO2PIN */
#define GPIOD	((volatile unsigned long *)0x3FFFC074)	/* FIO3PIN */
#define GPIOE	((volatile unsigned long *)0x3FFFC094)	/* FIO4PIN */

#define chip_gpio_port_t	volatile uint32_t*
#define chip_gpio_pinmask_t	uint32_t

extern void					chip_gpio_set_output(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask);
extern void					chip_gpio_set_input	(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask);
extern void					chip_gpio_set		(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask);
extern void					chip_gpio_reset		(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask);
extern void					chip_gpio_toggle	(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask);
extern chip_gpio_pinmask_t	chip_gpio_pinstate	(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask);

#ifdef __cplusplus
}
#endif

#endif
