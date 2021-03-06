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
#ifndef _CARIBOU_CHIP_GPIO_H_
#define _CARIBOU_CHIP_GPIO_H_

#include <caribou/kernel/types.h>

#include <stm32f10x.h>
#include <stm32f10x_gpio.h>
#include <stm32f10x_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define chip_gpio_port_t	GPIO_TypeDef*
#define chip_gpio_pinmask_t	uint16_t


#define chip_gpio_toggle(port,pinmask) {		\
	if ( chip_gpio_pinstate(port,pinmask) )		\
		chip_gpio_reset(port,pinmask);			\
	else										\
		 chip_gpio_set(port,pinmask);			\
	}
#define chip_gpio_set(port,pinmask)			(port)->BSRR = (pinmask)
#define chip_gpio_reset(port,pinmask)		(port)->BSRR = ((pinmask)<<16)
#define	chip_gpio_pinstate(port,pinmask)	(((port)->IDR & (pinmask)))

#ifdef __cplusplus
}
#endif

#endif
