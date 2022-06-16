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
#include <chip/spi.h>


chip_spi_word_t	chip_spi_exchange(chip_spi_port_t port, chip_spi_word_t word)
{
	while( !(port->SR & SPI_I2S_FLAG_TXE) );	// wait for tx holding register empty */
	port->DR = word;
	while( !(port->SR & SPI_I2S_FLAG_RXNE) );	// wait for rx holding register ready */
	word = port->DR;
	return word;
}

bool chip_spi_rx_ready(chip_spi_port_t port)
{
	bool rc = (port->SR & SPI_I2S_FLAG_RXNE) ? true : false;
}

chip_spi_word_t chip_spi_rx(chip_spi_port_t port)
{
	chip_spi_word_t word;
	word = port->DR;
	return word;
}

bool chip_spi_tx_ready(chip_spi_port_t port)
{
	bool rc = (port->SR & SPI_I2S_FLAG_TXE) ? true : false;
}

chip_spi_word_t chip_spi_tx(chip_spi_port_t port, chip_spi_word_t word)
{
	port->DR = word;
	return word;
}
