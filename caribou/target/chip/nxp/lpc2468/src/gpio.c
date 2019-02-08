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

#define port_gpio_dir(port) *(volatile uint32_t*)((port)-0x00000014)
#define port_gpio_clr(port) *(volatile uint32_t*)((port)+0x00000008)
#define port_gpio_set(port) *(volatile uint32_t*)((port)+0x00000004)

/**
 * @brief Set the direction of the pin(s) in to output.
 * @param port The chip's notion of a GPIO port.
 * @param pinmask A bit mask containing the bit (pins) within the port to be affected.
 */
void chip_gpio_set_output(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	port_gpio_dir(port) |= pinmask;
}

/**
 * @brief Set the direction of the pin(s) in to input.
 * @param port The chip's notion of a GPIO port.
 * @param pinmask A bit mask containing the bit (pins) within the port to be affected.
 */
void chip_gpio_set_input(chip_gpio_port_t port, chip_gpio_pinmask_t pinmask)
{
	port_gpio_dir(port) &= ~pinmask;
}

/**
 * @brief Toggle the state of the GPIO output.
 * @param port The chip's notion of a GPIO port.
 * @param pinmask A bit mask containing the bit (pins) within the port to be affected.
 */
void chip_gpio_toggle(chip_gpio_port_t port,chip_gpio_pinmask_t pinmask)
{
	*port ^= pinmask;
}

void chip_gpio_set(chip_gpio_port_t port,chip_gpio_pinmask_t pinmask)
{
	*port |= pinmask;
}

void chip_gpio_reset(chip_gpio_port_t port,chip_gpio_pinmask_t pinmask)
{
	*port &= ~pinmask;  
}

chip_gpio_pinmask_t chip_gpio_pinstate(chip_gpio_port_t port,chip_gpio_pinmask_t pinmask)
{
	return *port & pinmask;
}


