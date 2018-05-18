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
#include <caribou/kernel/thread.h>
#include <chip/chip.h>
#include <cpu/cpu.h>

/*******************************************************************************
*							 RAND
*******************************************************************************/

static uint32_t rand_next=0xA0A0A0A0;

void srand(uint32_t seed)
{
	rand_next=seed;
}

int rand()
{
	rand_next = (rand_next * 1103515245) + 12345;
	return((unsigned)(rand_next/65536) % 32768);
}
