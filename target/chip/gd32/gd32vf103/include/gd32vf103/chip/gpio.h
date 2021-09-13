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

#include <gd32vf103.h>
#include <gd32vf103_gpio.h>
#include <gd32vf103_rcu.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define chip_gpio_port_t	uint32_t
#define chip_gpio_pinmask_t	uint16_t

#define chip_gpio_set(port,pinmask)			GPIO_BOP((port)) = (pinmask)
#define chip_gpio_reset(port,pinmask)		GPIO_BOP((port)) = ((pinmask)<<16)
#define	chip_gpio_pinstate(port,pinmask)	GPIO_ISTAT((port)) & (pinmask)

#define chip_gpio_toggle(port,pinmask) {		\
	if ( chip_gpio_pinstate(port,pinmask) )		\
		chip_gpio_reset(port,pinmask);			\
	else										\
		 chip_gpio_set(port,pinmask);			\
	}

#ifdef __cplusplus
}
#endif

#endif
