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

#define THREAD_STACK_SIZE	(256)
#define THREAD_PRIORITY     (1)

char stack1[THREAD_STACK_SIZE];
char stack2[THREAD_STACK_SIZE];

/**
 * @brief This thread will emit messages based on the state of the button. The button state
 * will be enqueued in a CARIBOU queue instance. The queue messages are allocated from the heap
 * and the receiver is responsible for free'ing the memory used by the message.
 */
void thread1(void* arg)
{
	for(;;) // forever...
	{
    }
}

/**
 * @brief This waits on a queue for a message which will indicate the state of the button.
 * When a button down "D" is received, the LEDs are toggled. Then the message memory is given
 * back to the heap by the free() function call.
 */
void thread2(void* arg)
{
	for(;;) // forever...
	{
	}
}

int main(int argc,char* argv[])
{
    int rc;

    /** caribou_init() must first be called before any other CARIBOU function calls */
	caribou_init(0);

    /** Allocate and start up the enqueue and dequeue threads... */
	caribou_thread_create("thread1",thread1,NULL,NULL,stack1,THREAD_STACK_SIZE,THREAD_PRIORITY);
	caribou_thread_create("thread2",thread2,NULL,NULL,stack2,THREAD_STACK_SIZE,THREAD_PRIORITY);

    /** 
     * House keep chores are managed from the main thread, and must be called via caribou_exec()
     * Never to return 
	 * No sleeping in the main thread! 
     */
	caribou_exec();
}
