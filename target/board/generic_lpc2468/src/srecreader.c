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
#include "srecreader.h"

#define MAX_INPUT		640

typedef void (*entry_pt_t)(void);

static int srec_exec(srec_result_t* result)
{
	int rc=0;
	int state = caribou_interrupts_disable();
	entry_pt_t entryPt = (entry_pt_t)result->address;
	entryPt();
	caribou_interrupts_set(state);
	return rc;
}

static int srec_store(srec_result_t* result)
{
	int rc;
	if ( (rc=result->length) )
	{
		memcpy((uint8_t*)result->address,result->data,result->length);
	}
	return rc;
}

static void srec_ack(FILE* io)
{
	fprintf(io,"*ACK*%c%c",0x0d,0x0a);
}

static void srec_nack(FILE* io)
{
	fprintf(io,"!NACK!%c%c",0x0d,0x0a);
}

static void srec_ready(FILE* io,const char* ident)
{
	fprintf(io,"@IDENT@%s@%c%c",ident,0x0d,0x0a);
	fprintf(io,"@READY@%c%c",0x0d,0x0a);
}

static int srec_readline(FILE* io,char *input,int len,int timeout)
{
	int rc=0;
	int ch;
	bool done=false;
    caribou_tick_t	start=caribou_timer_ticks();
	while(!done && !caribou_timer_ticks_timeout(start,timeout) && rc < len)
	{
		if ( ( ch=fgetc(io) ) > 0 )
		{
			switch (ch)
			{
				case '\r':
					break;
				case '\n':
					input[rc++]='\0';
					done=true;
					break;
				default:
					if ( ch == 'S' || (ch >= '0' && ch <= '9') || (ch >= 'A' && ch <= 'F') )
					{
						input[rc++] = ch;
					}
					break;
			}
			start=caribou_timer_ticks();
		}
		else
		{
			caribou_thread_yield();
		}
	}
	if ( !done )
	{
		rc=0;
	}
	return rc;
}

extern void srec_reader(void* arg)
{
	srec_result_t	result;
	char			input[MAX_INPUT];
	int				input_len=0;
	srec_reader_t*	reader_data = (srec_reader_t*)arg;
	
	for(;;)
	{
		srec_ready(reader_data->io,reader_data->ident);
		if ( (input_len = srec_readline(reader_data->io,input,MAX_INPUT,reader_data->timeout)) > 0 )
		{
			switch(srec_parse(input,&result))
			{
				case S0:
					srec_ack(reader_data->io);
					break;
				case S1:
				case S2:
				case S3:
					if ( srec_store(&result) )
						srec_ack(reader_data->io);
					else
						srec_nack(reader_data->io);
					break;
				case S5:
					srec_ack(reader_data->io);
					break;
				case S7:
				case S8:
				case S9:
					/* unlikely to return */
					srec_ack(reader_data->io);
					srec_exec(&result); 
					break;
				default:
					srec_nack(reader_data->io);
					break;
			}
		}
	}
}
