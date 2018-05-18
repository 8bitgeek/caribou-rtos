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
	static dir=0;
	static caribou_tick_t start=0;
	for(;;)
	{
		if ( caribou_timer_ticks_timeout( start, 50 ) )
		{
			caribou_gpio_toggle(&led1);
			caribou_gpio_toggle(&led2);
			start = caribou_timer_ticks();
			if ( dir==0 )
			{
				TIM3->ARR -= 2;
				//TIM3->CCR1 -= 1;
				if ( TIM3->ARR <= 30 )
					dir = 1;
			}
			else
			{
				TIM3->ARR += 2;
				//TIM3->CCR1 += 1;
				if ( TIM3->ARR >= 500 )
				{
					dir=0;
				}
			}
		}
	}
}

int main(int argc,char* argv[])
{
	caribou_init(0);
	caribou_thread_create("thread1",thread1,NULL,NULL,thread1_stack,THREAD_STACK_SIZE,1);
	caribou_exec();
}
