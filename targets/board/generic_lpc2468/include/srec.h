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
#ifndef _CARIBOU_SREC_H_
#define _CARIBOU_SREC_H_

#include <caribou.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef enum
{
	S0,
	S1,
	S2,
	S3,
	S5,
	S7,
	S8,
	S9,
	Invalid,
} srecord_t;

typedef struct
{
	srecord_t			record;		/* S record (S0-S9) */
	uint16_t			length;		/* length of data in binary bytes */
	uint32_t			address;	/* address position (In native byte order) */
	uint8_t				data[256];	/* record data in binary bytes */
} srec_result_t;

extern srecord_t srec_parse(char* input, srec_result_t* output);

#ifdef __cplusplus
}
#endif

#endif

