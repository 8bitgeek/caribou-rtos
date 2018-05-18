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
#ifndef _CARIBOU_SRECREADER_H_
#define _CARIBOU_SRECREADER_H_

#include <caribou.h>
#include "srec.h"

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	FILE*		io;			/* The I/O device from which to read the S records */
	const char* ident;		/* Platform Identifier */
	int			timeout;	/* receiver wait timeout in milliseconds */
} srec_reader_t;

extern void srec_reader(void* arg);


#ifdef __cplusplus
}
#endif

#endif

