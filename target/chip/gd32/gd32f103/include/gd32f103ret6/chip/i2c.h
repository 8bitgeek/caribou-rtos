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
#ifndef _CARIBOU_I2C_GD32F1xx_H_
#define _CARIBOU_I2C_GD32F1xx_H_

#include <caribou/kernel/types.h>
#include <chip/vectors.h>

#include <gd32f10x.h>
#include <gd32f10x_i2c.h>
#include <gd32f10x_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define chip_i2c_port_t	I2C_TypeDef*

int chip_i2c_reset(chip_i2c_port_t port);
int chip_i2c_tx(chip_i2c_port_t port, uint8_t device_address, uint8_t* data, uint8_t length);
int chip_i2c_rx(chip_i2c_port_t port, uint8_t device_address, uint8_t* data, uint8_t length);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_I2C_GD32F103V_H_ */
