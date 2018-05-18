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
#include <caribou/dev/spi.h>

chip_spi_word_t	caribou_spi_exchange(caribou_spi_t* spi, chip_spi_word_t word)
{
	return chip_spi_exchange(spi->port,word);
}

bool caribou_spi_rx_ready(caribou_spi_t* spi)
{
	return chip_spi_rx_ready(spi->port);
}

chip_spi_word_t caribou_spi_rx(caribou_spi_t* spi)
{
	return chip_spi_rx(spi->port);
}

bool caribou_spi_tx_ready(caribou_spi_t* spi)
{
	return chip_spi_tx_ready(spi->port);
}

void caribou_spi_tx(caribou_spi_t* spi, chip_spi_word_t word)
{
	caribou_spi_tx(spi->port,word);
}
