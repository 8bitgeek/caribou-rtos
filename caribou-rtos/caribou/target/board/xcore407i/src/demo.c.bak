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

uint8_t stack_thread1[THREAD_STACK_SIZE];
uint8_t stack_thread2[THREAD_STACK_SIZE];

/**
 * @brief Implement this callback if you which to trap heap allocation failures.
 * @param size The size of the allocation which triggered the failure.
 */
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}

/**
 * @brief The second thread to participate in the test regime.
 * @param arg Optional data pointer passed at the creation of the thread.
 */
void test1_thread(void* arg)
{
    bool passed = true;
	for(;;)
	{
		caribou_thread_sleep_current(10);
    }
}

/**
 * @brief The second thread to participate in the test regime.
 * @param arg Optional data pointer passed at the creation of the thread.
 */
void test2_thread(void* arg)
{
    bool passed = true;
	for(;;)
	{
		caribou_thread_yield();
	}
}

void network_init()
{
}

int main(int argc,char* argv[])
{
    int rc;

    /** caribou_init() must first be called before any other CARIBOU function calls */
	caribou_init(0);

	printf("** CARIBOU 0.9 STM32F407IGT6 DEMO **\n");
	LwIP_Init();

    /** Allocate and start up the enqueue and dequeue threads... */
	caribou_thread_create("test1_thread",test1_thread,NULL,NULL,stack_thread1,THREAD_STACK_SIZE,THREAD_PRIORITY);
	caribou_thread_create("test2_thread",test2_thread,NULL,NULL,stack_thread2,THREAD_STACK_SIZE,THREAD_PRIORITY);

    /** 
     * House keep chores are managed from the main thread, and must be called via caribou_exec()
     * Never to return 
     */
	caribou_exec();
}
