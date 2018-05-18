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
#include "board.h"

/**
 ** @brief A hook to perform early board initialization. Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void early_init(void)
{
	/*
		PCLKSEL
		-------
		00	PCLK_xyz = CCLK/4
		01	PCLK_xyz = CCLK[1]
		10	PCLK_xyz = CCLK/2
		11  Peripheral’s clock is selected to PCLK_xyz = CCLK/8
        except for CAN1, CAN2, and CAN filtering when ’11’
        selects PCLK_xyz = CCLK/6.
	*/

	PCLKSEL0 |= (0x02 << 6);		/*	UART0	*/
	PCLKSEL0 |= (0x02 << 8);		/*	UART1	*/

	PINSEL0 |= 0x40000050; /* PINSEL UART1 */
	//PINSEL4 |= 0x0000000A; /* PINSEL UART2 */
	//PINSEL0 |= 0x00500000; /* PINSEL UART3 */
}


/**
 ** @brief A hook to perform late initialization. Static stacks, BSS, heap, and static contructors are all initialized at this stage.
 **/
extern void late_init(void)
{
	_stdout = fopen(CONSOLE_USART,"rw"); //  Which is stdio?
    _stdin = _stdout;
	_stderr = fopen(AUX_USART,"rw");
}


