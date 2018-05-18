/******************************************************************************
* Copyright © 2014 by Pike Aerospace Research Corporation
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
#include <caribou.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/swi.h>
#include <caribou/lib/queue.h>
#include <caribou/dev/gpio.h>

#define THREAD_STACK_SIZE	256

char thread1_stack[THREAD_STACK_SIZE];

/* get here on heap allocation failure */
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}

void thread1(void* arg)
{
	uint16_t count=0;
	for(;;)
	{
		printf("abcdefghijklmnopqrstuvwxyz 1234567890 [%d]\n", count);
	}
}

int main(int argc,char* argv[])
{
	caribou_init(0);
	caribou_thread_create("thread1",thread1,NULL,NULL,thread1_stack,THREAD_STACK_SIZE,1);
	caribou_exec();
}
