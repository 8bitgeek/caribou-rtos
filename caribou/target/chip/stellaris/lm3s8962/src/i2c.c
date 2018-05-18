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
#include <caribou/lib/stdio.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>
#include <chip/i2c.h>

#ifndef I2C_TIMEOUT_MAX
#define I2C_TIMEOUT_MAX 10000;
#endif

int chip_i2c_reset(chip_i2c_port_t port)
{
}

int chip_i2c_tx(chip_i2c_port_t port, uint8_t device_address, uint8_t* data, uint8_t length)
{
	return 0;
}

int chip_i2c_rx(chip_i2c_port_t port, uint8_t device_address, uint8_t* data, uint8_t length)
{
	return 0;
}

