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
#ifndef _CARIBOU_SPI_H_
#define _CARIBOU_SPI_H_

#include <caribou/kernel/types.h>
#include <chip/spi.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	chip_spi_port_t			port;
} caribou_spi_t;

chip_spi_word_t	caribou_spi_exchange(caribou_spi_t* spi, chip_spi_word_t word);

bool caribou_spi_rx_ready(caribou_spi_t* spi);
chip_spi_word_t caribou_spi_rx(caribou_spi_t* spi);

bool caribou_spi_tx_ready(caribou_spi_t* spi);
void caribou_spi_tx(caribou_spi_t* spi, chip_spi_word_t word);



#ifdef __cplusplus
}
#endif

#endif
