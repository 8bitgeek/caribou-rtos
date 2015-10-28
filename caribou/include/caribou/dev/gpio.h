/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#ifndef _CARIBOU_GPIO_H_
#define _CARIBOU_GPIO_H_

#include <caribou/kernel/types.h>
#include <chip/gpio.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	chip_gpio_port_t		port;
	chip_gpio_pinmask_t		pinmask;
} caribou_gpio_t;

/**
 * @brief Macro used for static initializing a GPIO port instance.
 * @example caribou_gpio_t gpio_led1 = CARIBOU_GPIO_INIT(GPIOB,CARIBOU_GPIO_PIN_8);
 */
#define CARIBOU_GPIO_INIT(port,pinmask) {port,pinmask}

#define	CARIBOU_GPIO_PIN_0		(1<<0)
#define	CARIBOU_GPIO_PIN_1		(1<<1)
#define	CARIBOU_GPIO_PIN_2		(1<<2)
#define	CARIBOU_GPIO_PIN_3		(1<<3)
#define	CARIBOU_GPIO_PIN_4		(1<<4)
#define	CARIBOU_GPIO_PIN_5		(1<<5)
#define	CARIBOU_GPIO_PIN_6		(1<<6)
#define	CARIBOU_GPIO_PIN_7		(1<<7)
#define	CARIBOU_GPIO_PIN_8		(1<<8)
#define	CARIBOU_GPIO_PIN_9		(1<<9)
#define	CARIBOU_GPIO_PIN_10		(1<<10)
#define	CARIBOU_GPIO_PIN_11		(1<<11)
#define	CARIBOU_GPIO_PIN_12		(1<<12)
#define	CARIBOU_GPIO_PIN_13		(1<<13)
#define	CARIBOU_GPIO_PIN_14		(1<<14)
#define	CARIBOU_GPIO_PIN_15		(1<<15)
#define	CARIBOU_GPIO_PIN_16		(1<<16)
#define	CARIBOU_GPIO_PIN_17		(1<<17)
#define	CARIBOU_GPIO_PIN_18		(1<<18)
#define	CARIBOU_GPIO_PIN_19		(1<<19)
#define	CARIBOU_GPIO_PIN_20		(1<<20)
#define	CARIBOU_GPIO_PIN_21		(1<<21)
#define	CARIBOU_GPIO_PIN_22		(1<<22)
#define	CARIBOU_GPIO_PIN_23		(1<<23)
#define	CARIBOU_GPIO_PIN_24		(1<<24)
#define	CARIBOU_GPIO_PIN_25		(1<<25)
#define	CARIBOU_GPIO_PIN_26		(1<<26)
#define	CARIBOU_GPIO_PIN_27		(1<<27)
#define	CARIBOU_GPIO_PIN_28		(1<<28)
#define	CARIBOU_GPIO_PIN_29		(1<<29)
#define	CARIBOU_GPIO_PIN_30		(1<<30)
#define	CARIBOU_GPIO_PIN_31		(1<<31)

#define caribou_gpio_set_output(gpio)   chip_gpio_set_output((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_set_input(gpio)	chip_gpio_set_input((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_set_pullup(gpio)	chip_gpio_set_pullup((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_set_pulldown(gpio)	chip_gpio_set_pulldown((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_toggle(gpio)       chip_gpio_toggle((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_set(gpio)          chip_gpio_set((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_reset(gpio)        chip_gpio_reset((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_pinstate(gpio)     chip_gpio_pinstate((gpio)->port,(gpio)->pinmask)
#define caribou_gpio_pinmask(gpio)      ((gpio)->pinmask)
#define caribou_gpio_write(gpio,state)	{if((state)) caribou_gpio_set(gpio); else caribou_gpio_reset(gpio);}

#ifdef __cplusplus
}
#endif

#endif
