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
#include <caribou.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/timer.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/mutex.h>
#include <caribou/dev/gpio.h>

#define THREAD_STACK_SIZE	(1024)
#define THREAD_PRIORITY     (1)

uint32_t stack_dhcp_thread	[THREAD_STACK_SIZE/sizeof(uint32_t)];

uint32_t test1_stack		[THREAD_STACK_SIZE/sizeof(uint32_t)];
uint32_t test2_stack		[THREAD_STACK_SIZE/sizeof(uint32_t)];

caribou_thread_t* thread1_handle=NULL;
caribou_thread_t* thread2_handle=NULL;

/**
 * @brief Implement this callback if you which to trap heap allocation failures.
 * @param size The size of the allocation which triggered the failure.
 */
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}

void test1(void* arg)
{
	for(;;)
	{
    	putchar('*');
		caribou_thread_sleep_current(from_ms(100));
		caribou_thread_yield();
	}
}

void test2(void* arg)
{
	for(;;)
	{
		int ch;
		if ( (ch=getchar()) > 0 )
			printf("0x%02X ",ch);
		caribou_thread_yield();
	}
}


int main(int argc,char* argv[])
{
    int rc;

    /** caribou_init() must first be called before any other CARIBOU function calls */
	caribou_init(0);
    
	printf("\nSTM32L431 @ %d MHz\n",SystemCoreClock/1000000);

	thread1_handle = caribou_thread_create("test1",test1,NULL,NULL,test1_stack,THREAD_STACK_SIZE,THREAD_PRIORITY,0);
	thread2_handle = caribou_thread_create("test2",test2,NULL,NULL,test2_stack,THREAD_STACK_SIZE,THREAD_PRIORITY,0);

	caribou_exec();
}
