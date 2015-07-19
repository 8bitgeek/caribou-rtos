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
#ifndef _CARIBOU_BOARD_H_
#define _CARIBOU_BOARD_H_

#include <chip/chip.h>

/**
 ** @brief A hook to perform early board initialization. Static stacks are initialized, BSS is *NOT* initialized at this stage.
 **/
extern void early_init(void);

/**
 ** @brief A hook to perform late initialization. Static stacks, BSS, heap, and static contructors are all initialized at this stage.
 **/
extern void late_init(void);

#endif

