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
#include <chip/i2s.h>

bool chip_i2s_rx_ready(chip_i2s_port_t port)
{
	bool rc = false;
	return rc;
}

chip_i2s_word_t chip_i2s_rx(chip_i2s_port_t port)
{
	return 0;
}

bool chip_i2s_tx_ready(chip_i2s_port_t port)
{
	bool rc = false;
	return rc;
}

chip_i2s_word_t chip_i2s_tx(chip_i2s_port_t port, chip_i2s_word_t word)
{;
	return word;
}
