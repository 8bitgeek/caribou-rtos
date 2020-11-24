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
#include <pa110x.h>

static uint8_t	is_initialized=false;
pa110x_t		pa_handles[PA_MAX_HANDLES];

static pa110x_t*	find_unused_handle	( void );
static int 			pa_getc 			( pa110x_t* handle );
static int			pa_read_packet		( pa110x_t* handle );
static void			pa_write_register	( pa110x_t* handle, uint8_t reg );
static int 			pa_parse_packet 	( pa_packet_t* handle );

extern pa110x_t* pa_start( pa_io_type io_handle )
{
	if ( !is_initialized )
	{
		for(int n=0; n < PA_MAX_HANDLES; n++)
			pa_handles[n].is_used=false;
		is_initialized=true;
	}
	return find_unused_handle();
}

extern void pa_stop( pa110x_t* handle )
{
	handle->is_used=false;
}

extern int pa_read_register( pa110x_t* handle, uint8_t reg )
{
	pa_write_register( handle, reg );
	return pa_read_packet( handle );
}

static pa110x_t* find_unused_handle(void)
{
	pa110x_t* rc=NULL;
	for(int n=0; n < PA_MAX_HANDLES; n++)
	{
		if ( !pa_handles[n].is_used )
		{
			pa_handles[n].is_used = true;
			rc = &pa_handles[n];
		}
	}
	return rc;
}

static int pa_parse_packet ( pa_packet_t* handle )
{
	int cnt;
	int field=0;
	for( cnt=0; cnt < handle->packet_buf_idx; cnt++ )
	{
		char ch = handle->packet_buf[cnt];
		if ( ch == ':' || cnt == handle->packet_buf_idx-1 )
		{
			/* FIXME */
			switch(field)
			{
				case 0:
					
					break;
				case 1:	
					break;
				case 2:	
					break;
				case 3:	
					break;
				case 4:	
					break;
				case 5:	
					break;
				case 6:	
					break;
				default:
					pa_fault(PA_FAULT_DATA);
					break;
			}
			++field;
		}
	} 
	return cnt;
}

static int pa_getc( pa110x_t* handle )
{
	int ch;

	handle->start_wait_reply = pa_timer_ms();

	while ( (ch = fgetc( handle->io_handle )) < 0 && pa_timer_ms()-handle->start_wait_reply <= PA_MAX_TIMEOUT_MS )
		pa_yield_cpu();

	return ch;
}

static int pa_read_packet ( pa110x_t* handle )
{
	int ch=(-1);
	handle->packet.packet_buf_idx = 0;
	do
	{
		ch = pa_getc( handle );
		if ( ch > 0 && ch != '\r' )
		{
			handle->packet.packet_buf[handle->packet.packet_buf_idx++] = ch;
			handle->packet.packet_buf[handle->packet.packet_buf_idx] = '\0';
		}
	} while (ch > 0 && ch != '\r');
	return pa_parse_packet(handle);
}

static void pa_write_register ( pa110x_t* handle, uint8_t reg )
{
	fprintf(handle->io_handle,"R%d\r",reg+'0');
}
