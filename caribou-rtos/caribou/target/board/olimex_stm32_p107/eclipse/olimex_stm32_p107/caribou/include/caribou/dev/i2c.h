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
#ifndef _CARIBOU_I2C_H_
#define _CARIBOU_I2C_H_

#include <caribou/kernel/types.h>
#include <chip/i2c.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	chip_i2c_port_t			port;
	uint8_t					device_address;
} caribou_i2c_t;

#define CARIBOU_I2C_INIT(port,device_address) {port,device_address}

int caribou_i2c_reset(caribou_i2c_t* i2c);
int caribou_i2c_tx(caribou_i2c_t* i2c, uint8_t* data, uint8_t length);
int caribou_i2c_rx(caribou_i2c_t* i2c, uint8_t* data, uint8_t length);

#ifdef __cplusplus
}
#endif

#endif
