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
#include <chip/gpio.h>


void chip_gpio_set(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
    GPIO_BOP((port)) = (uint32_t)(pinmask);
}

void chip_gpio_reset(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
    GPIO_BOP((port)) = (uint32_t)((pinmask)<<16);
}

void chip_gpio_toggle(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	if ( chip_gpio_pinstate(port,pinmask) )
		chip_gpio_reset(port,pinmask);
	else										
		 chip_gpio_set(port,pinmask);			
}

chip_gpio_pinmask_t chip_gpio_pinstate(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
    return GPIO_ISTAT((port)) & (pinmask);
}
