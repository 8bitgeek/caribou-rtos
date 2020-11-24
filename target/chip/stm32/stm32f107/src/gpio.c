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
#include <caribou/lib/stdio.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <caribou/dev/gpio.h>
#include <chip/chip.h>

void chip_gpio_toggle(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	uint16_t d = (port->ODR & pinmask);
	if( d )
		port->BSRR = (pinmask<<16);
	else
		port->BSRR = pinmask;
}

void chip_gpio_set(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	port->BSRR = pinmask;
}

void chip_gpio_reset(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	port->BSRR = (pinmask<<16);
}

chip_gpio_pinmask_t chip_gpio_pinstate(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	uint16_t d=0;
	uint16_t bit = (pinmask);
	d=(port->IDR & bit);
	return d;
}

