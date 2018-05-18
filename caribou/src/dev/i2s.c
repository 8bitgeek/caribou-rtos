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
#include <caribou/dev/i2s.h>

bool caribou_i2s_rx_ready(caribou_i2s_t* i2s)
{
	return chip_i2s_rx_ready(i2s->port);
}

chip_i2s_word_t caribou_i2s_rx(caribou_i2s_t* i2s)
{
	return chip_i2s_rx(i2s->port);
}

bool caribou_i2s_tx_ready(caribou_i2s_t* i2s)
{
	return chip_i2s_tx_ready(i2s->port);
}

void caribou_i2s_tx(caribou_i2s_t* i2s, chip_i2s_word_t word)
{
	caribou_i2s_tx(i2s->port,word);
}
