/*
   _________    ____  ________  ____  __  __   ____  __________  _____
  / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
 / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
/ /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
\____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
                                                                      

Copyright © 2014-2015 by Mike Sharkey
Copyleft © 2018 by Mike Sharkey 
mike@pikeaero.com        

This file is part of CARIBOU RTOS

CARIBOU RTOS is free software: you can redistribute it and/or modify
it under the terms of the Beerware License Version 43.

----------------------------------------------------------------------------
"THE BEER-WARE LICENSE" (Revision 43):
<mike@pikeaero.com> wrote this file. As long as you retain this notice you
can do whatever you want with this stuff. If we meet some day, and you think
this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
---------------------------------------------------------------------------- 

*/
#ifndef _PIKEAERO_PA2400_H_
#define _PIKEAERO_PA2400_H_

#include <caribou.h>

#ifdef __cplusplus
extern "C"
{
#endif

#if !defined(PA_MAX_TIMEOUT_MS)
	#define PA_MAX_TIMEOUT_MS			3000
#endif

#if !defined(pa_io_type)
	#define			pa_io_type			FILE*
#endif

#if !defined(pa_tick_t)
	#define			pa_tick_t			uint64_t
#endif

#if !defined(PA_MAX_HANDLES)
	#define			PA_MAX_HANDLES		2
#endif

#define PA_MAX_PACKET_BUF				64
#define PA_MAX_DATA_STR					48
#define PA_MAX_SHORT_UNITS_STR			6
#define PA_MAX_LONG_UNITS_STR			6

typedef struct
{
	uint8_t		packet_buf_idx;
	char 		packet_buf 	[PA_MAX_PACKET_BUF];
	uint8_t		reg_no;
	char		data_type;
	char		access;
	char		data		[PA_MAX_DATA_STR];
	char		short_units	[PA_MAX_SHORT_UNITS_STR];
	char		long_units	[PA_MAX_LONG_UNITS_STR];
} pa_packet_t;

typedef struct
{
	bool		is_used;
	pa_io_type	io_handle;			/* Application I/O Handle */
	pa_tick_t	start_wait_reply;	/* Start time for wating for reply */
    pa_packet_t	packet;
} pa110x_t;

#define PA_FAULT_OK			0
#define PA_FAULT_TIMEOUT	1
#define PA_FAULT_CHECKSUM	2
#define PA_FAULT_DATA		3

/* Host application must provide these callbacks */
extern int			pa_getchar(void);			/* callback to fetch a character from PA110x sensor */
extern void			pa_putchar(char ch);		/* callback to send a character to PA110x sensor */
extern pa_tick_t	pa_timer_ms(void);			/* return millisecond tick count */
extern void			pa_yield_cpu(void);			/* yield run time callback */
extern void			pa_fault(uint8_t fault);	/* fault with type */


/* PA110X API Provides these function calls */

/**
 * @brief Start a pa110x sensor session.
 * @param io_handle An I/O handle provided by the application representing a serial connection.
 * @return A poiunter to a device struct.
 */
extern pa110x_t* 	pa_start( pa_io_type io_handle );
extern void 	 	pa_stop( pa110x_t* handle );

/** 
 * @brief Read Register Value
 * @param reg The register number to read (0-255)
 * @param buf The output buffer, must be able to contain max chars + 1.
 * @param max The maximum number of chars to store in buf.
 * @return Number of bytes stored, or < 0 number of bytes not stored. 
 */
extern int 			pa_read_register( pa110x_t* handle, uint8_t reg );


#ifdef __cplusplus
}
#endif

#endif

