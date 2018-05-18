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
#include <caribou/stdio.h>
#include <caribou/errno.h>
#include <caribou/heap.h>
#include <caribou/string.h>
#include <chip/chip.h>
#include <chip/gpio.h>

void caribou_gpio_toggle(caribou_gpio_t* port,uint16_t pin)
{
	uint16_t d = port->ODR;
	uint32_t bit = (1<<pin);
	if( d & bit )
	{
		port->BSRR = (bit<<16);
	}
	else
	{
		port->BSRR = bit;
	}
}

void caribou_gpio_set(caribou_gpio_t* port,uint16_t pin)
{
	uint16_t d = port->ODR;
	uint32_t bit = (1<<pin);
	port->BSRR = bit;
}

void caribou_gpio_reset(caribou_gpio_t* port,uint16_t pin)
{
	uint16_t d = port->ODR;
	uint32_t bit = (1<<pin);
	port->BSRR = (bit<<16);
}

uint16_t caribou_gpio_pinstate(caribou_gpio_t* port,uint16_t pin)
{
	uint16_t d=0;
	uint16_t bit = (1<<pin);
	uint32_t mode_mask = (3<<(pin*2));
	uint16_t mode = ((port->MODER & mode_mask) >> (pin*2));
	switch (mode)
	{
		case 0x00:		/* Input (reset state) */
			d=(port->IDR & bit);
			break;
		case 0x01:		/* General purpose output */
			d=(port->ODR & bit);
			break;
		case 0x02:		/* Alternate function mode */
			d=(port->IDR & bit);
			break;
		case 0x03:		/* Analog mode */
			break;
	}
	return d;
}

