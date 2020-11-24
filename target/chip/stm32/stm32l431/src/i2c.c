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
#include <chip/i2c.h>

#ifndef I2C_TIMEOUT_MAX
#define I2C_TIMEOUT_MAX 10000;
#endif

int chip_i2c_tx(chip_i2c_port_t port, uint8_t device_address, uint8_t* data, uint8_t length)
{
  	uint32_t timeout = I2C_TIMEOUT_MAX;
  	uint8_t i=0;

  	I2C_GenerateSTART(port, ENABLE);
	timeout = I2C_TIMEOUT_MAX; /* Initialize timeout value */
	while(!I2C_CheckEvent(port, I2C_EVENT_MASTER_MODE_SELECT))
	{
		if((timeout--) == 0) return 0xf2;
	}

	I2C_Send7bitAddress(port, device_address, I2C_Direction_Transmitter);
	timeout = I2C_TIMEOUT_MAX; /* Initialize timeout value */
 	while(!I2C_CheckEvent(port, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
	{
    	if((timeout--) == 0) return 0xf3;
  	}

	for(i=0;i<length;i++)
	{
		timeout = I2C_TIMEOUT_MAX; /* Initialize timeout value */
		if(i<length-1)
		{
		  	I2C_SendData(port,*data);
			data++; 
		  	while(!I2C_CheckEvent(port, I2C_EVENT_MASTER_BYTE_TRANSMITTING))
			{
		    	if((timeout--) == 0) return 0xf4;
		  	}
		}
		else
		{
			I2C_SendData(port,*data);
			while(!I2C_GetFlagStatus(port, I2C_FLAG_BTF))
			{
		    	if((timeout--) == 0) return 0xf4;
		  	}	
		} 
	}
  	I2C_GenerateSTOP(port, ENABLE);
	return 0;
}

