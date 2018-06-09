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
#include <caribou/dev/i2c.h>
#include <chip/i2c.h>

int caribou_i2c_reset(caribou_i2c_t* i2c)
{
	return chip_i2c_reset(i2c->port,i2c->device_address);
}

/**
  * @brief	Writes a buffer of byte to a specific I2C register
  * @param	i2c I2C device and address.
  * @param	data data to be written to the specific register 
  * @param	length data to be written to the specific register 
  * @retval 0x00 if write operation is OK. 
  *		   0xFF if timeout condition occured (device not connected or bus error).
  */
int caribou_i2c_tx(caribou_i2c_t* i2c, uint8_t* data, uint8_t length)
{
	return chip_i2c_tx(i2c->port,i2c->device_address,data,length);
}

/**
  * @brief	Receive a buffer of byte to a specific I2C register
  * @param	i2c I2C device and address.
  * @param	data data to be written to the specific register 
  * @param	length data to be written to the specific register 
  * @retval 0x00 if write operation is OK. 
  *		   0xFF if timeout condition occured (device not connected or bus error).
  */
int caribou_i2c_rx(caribou_i2c_t* i2c, uint8_t* data, uint8_t length)
{
	return chip_i2c_rx(i2c->port,i2c->device_address,data,length);
}