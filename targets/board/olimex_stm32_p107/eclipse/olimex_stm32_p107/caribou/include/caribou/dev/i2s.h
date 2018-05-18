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
#ifndef _CARIBOU_I2S_H_
#define _CARIBOU_I2S_H_

#include <caribou/kernel/types.h>
#include <chip/i2s.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	chip_i2s_port_t			port;
} caribou_i2s_t;

bool caribou_i2s_rx_ready(caribou_i2s_t* i2s);
chip_i2s_word_t caribou_i2s_rx(caribou_i2s_t* i2s);

bool caribou_i2s_tx_ready(caribou_i2s_t* i2s);
void caribou_i2s_tx(caribou_i2s_t* i2s, chip_i2s_word_t word);

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_I2S_H_ */
