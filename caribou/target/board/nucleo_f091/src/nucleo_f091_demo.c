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
#include <caribou/lib/queue.h>
#include <caribou/dev/gpio.h>
#include <lps22hb.h>

#define THREAD_STACK_SIZE	(1024)
#define THREAD_PRIORITY     (1)
#define QUEUE_DEPTH			(4)
#define QUEUE_TIMEOUT_MS    (1000)
#define	MESSAGE_SZ			(32)

/**
 * @brief The variables we'll be using in this demo.
 */
char button_thread_stack[THREAD_STACK_SIZE];		// Stack space for the button-press thread.
char led_thread_stack[THREAD_STACK_SIZE];			// Stack space for the led-display thread.
caribou_queue_t     queue;							// In instance of a CARIBOU queue.
void*               queue_msgs[QUEUE_DEPTH];		// Storage space for queue messages.
   
hi2c_t hi2c_lps25hb;

/**
 * @brief This thread will emit messages based on the state of the button. The button state
 * will be enqueued in a CARIBOU queue instance. The queue messages are allocated from the heap
 * and the receiver is responsible for free'ing the memory used by the message.
 */
void button_thread(void* arg)
{
	for(;;) // forever...
	{
		char* msg = (char*)malloc(2);						// get a 2 byte message buffer from the heap.
		caribou_thread_sleep_current(from_ms(10));			// check the button every 10 ms
		if( !caribou_gpio_pinstate(&pb1) )
			strcpy(msg,"D");								// make a message to indicate button down.
		else
			strcpy(msg,"U");								// make a message to indicate button up.
		caribou_queue_post(&queue,msg,TIMEOUT_INFINITE);	// post the message.
    }
}

/**
 * @brief This waits on a queue for a message which will indicate the state of the button.
 * When a button down "D" is received, the LEDs are toggled. Then the message memory is given
 * back to the heap by the free() function call.
 */
void led_thread(void* arg)
{
	for(;;) // forever...
	{
		char* msg=NULL;
        if ( (msg=caribou_queue_take_first(&queue,TIMEOUT_INFINITE)) )
		{
			if ( strcmp(msg,"D") == 0 )						// Button Pressed message?
			{
				//printf("ON\n");
				caribou_gpio_set(&led1);				// LED Off
			}
			else
			{
				//printf("OFF\n");
				caribou_gpio_reset(&led1);				// LED On
			}
			free(msg);									// Free the message buffer
		}
	}
}

void board_idle()
{
	static caribou_tick_t start=0L;

	lps22hb_service();

	if ( caribou_timer_ticks_timeout(start,250) )
	{
		lps22hb_service();

#if 0
		printf("%02X %d %d %d %02X %02X %02X %02X\n",
				lps22hb_device_id(),
				lps22hb_raw_pressure(),
				lps22hb_pressure(),
                lps22hb_pressure_offset(),
                lps22hb_status(),
                lps22hb_ctrl_reg1(),
                lps22hb_ctrl_reg2(),
                lps22hb_ctrl_reg3()
				);
#else
		printf("%d\n",
				lps22hb_pressure()
				);

#endif

		start = caribou_timer_ticks();
	}
}

int main(int argc,char* argv[])
 {
    int rc;

    /** caribou_init() must first be called before any other CARIBOU function calls */
	caribou_init(0);

	printf("boot...\n");

    lps22hb_setup(
					&hi2c_lps25hb,
					GPIOB,
					CARIBOU_GPIO_PIN_8,
					GPIOB,
					CARIBOU_GPIO_PIN_9,
					2,
					0xB8
				);

    /** Initialize a queue of the specified depth */
	caribou_queue_init(&queue,QUEUE_DEPTH,&queue_msgs);

    /** Allocate and start up the enqueue and dequeue threads... */
	caribou_thread_create("button_thread",button_thread,NULL,NULL,button_thread_stack,THREAD_STACK_SIZE,THREAD_PRIORITY,0);
	caribou_thread_create("led_thread",led_thread,NULL,NULL,led_thread_stack,THREAD_STACK_SIZE,THREAD_PRIORITY,0);


    /** 
     * House keep chores are managed from the main thread, and must be called via caribou_exec()
     * Never to return 
	 * No sleeping in the main thread! 
     */
	caribou_exec();
}
