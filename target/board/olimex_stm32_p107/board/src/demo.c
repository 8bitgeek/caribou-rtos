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
#include <caribou/kernel/timer.h>
#include <caribou/kernel/swi.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/mutex.h>
#include <caribou/dev/gpio.h>

#define THREAD_STACK_SIZE	(1024)
#define THREAD_PRIORITY     (0)

uint8_t stack_dhcp_thread[THREAD_STACK_SIZE];

/**
 * @brief Implement this callback if you which to trap heap allocation failures.
 * @param size The size of the allocation which triggered the failure.
 */
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}


void network_init()
{
	LwIP_Init();
	#if defined(USE_DHCP)
		caribou_thread_create("dhcp",LwIP_DHCP_task,NULL,NULL,stack_dhcp_thread,THREAD_STACK_SIZE,THREAD_PRIORITY);
	#endif
}

int main(int argc,char* argv[])
{
    int rc;

    /** caribou_init() must first be called before any other CARIBOU function calls */
	caribou_init(0);
	printf("** CARIBOU 0.9 OLIMEX STM32F107 DEMO **\n");
	//network_init();
	caribou_exec();
}
