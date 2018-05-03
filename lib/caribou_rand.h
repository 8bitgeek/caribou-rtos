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
#ifndef CARIBOU_RAND_H
#define CARIBOU_RAND_H

#include <caribou/kernel/types.h>
#include <caribou/kernel/thread.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define RAND_MAX 32767

extern void srand(uint32_t seed);
extern int rand();

#ifdef __cplusplus
}
#endif


#endif
