/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2018 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/kernel/ipc.h>
#include <caribou/kernel/thread.h>

/*******************************************************************************
*							 SIGNAL
*******************************************************************************/

/**
 * @brief Try to post an IPC signal to a thread.
 * @param thread The destination thread.
 * @param signal The signal to send.
 */
bool caribou_ipc_signal_try_post(caribou_thread_t* thread, uint8_t signal)
{
	bool rc=false;
	caribou_thread_lock();
	if ( caribou_thread_is_valid(thread) )
	{
		if ( !caribou_bytequeue_full(&thread->ipc_signal_queue) )
		{
			rc = caribou_bytequeue_put(&thread->ipc_signal_queue,signal);
		}
	}
	caribou_thread_unlock();
	return rc;
}

/**
 * @brief Post an IPC signal to a thread.
 * @param thread The destination thread.
 * @param signal The signal to send.
 */
bool caribou_ipc_signal_post(caribou_thread_t* thread, uint8_t signal, caribou_tick_t timeout)
{
	bool rc=false;
	caribou_tick_t start = caribou_timer_ticks();
	while ( caribou_thread_is_valid(thread) && !(rc=caribou_ipc_signal_try_post(thread,signal)) )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
			return false;
		caribou_thread_yield();
	}
	return rc;
}

int caribou_ipc_signal_try_take()
{
	int rc=(-1);
	if ( !caribou_bytequeue_empty(&caribou_state.current->ipc_signal_queue ) )
	{
		rc = caribou_bytequeue_get(&caribou_state.current->ipc_signal_queue);
	}
	return rc;
}

int caribou_ipc_signal_take(caribou_tick_t timeout)
{
	int rc=(-1);
	caribou_tick_t start = caribou_timer_ticks();
	while ( (rc=caribou_ipc_signal_try_take()) < 0 )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
			return false;
		caribou_thread_yield();
	}		
	return rc;
}

/*******************************************************************************
*							 MESSAGE
*******************************************************************************/

bool caribou_ipc_message_try_post(caribou_thread_t* thread, const caribou_queue_msg_t* msg)
{
	bool rc=false;
	caribou_thread_lock();
	if ( caribou_thread_is_valid(thread) )
	{
		rc = caribou_queue_try_post(&thread->ipc_message_queue,msg);
	}
	caribou_thread_unlock();
	return rc;
}

bool caribou_ipc_message_post(caribou_thread_t* thread, const caribou_queue_msg_t* msg, caribou_tick_t timeout)
{
	bool rc=false;
	caribou_tick_t start = caribou_timer_ticks();
	while ( caribou_thread_is_valid(thread) && !(rc=caribou_ipc_message_try_post(thread,msg)) )
	{
		if ( caribou_timer_ticks_timeout(start,timeout) )
			return false;
		caribou_thread_yield();
	}
	return rc;
}

caribou_queue_msg_t* caribou_ipc_message_try_take()
{
	return caribou_queue_try_take_first(&caribou_state.current->ipc_message_queue);
}

caribou_queue_msg_t* caribou_ipc_message_take(caribou_tick_t timeout)
{
	return caribou_queue_take_first(&caribou_state.current->ipc_message_queue,timeout);
}

/*******************************************************************************
*							 INITS
*******************************************************************************/

void caribou_ipc_init(caribou_thread_t* thread)
{
	caribou_queue_init(&thread->ipc_message_queue,CARIBOU_IPC_MESSAGE_DEPTH,thread->ipc_messages);
	caribou_bytequeue_init(&thread->ipc_signal_queue,thread->ipc_signals,CARIBOU_IPC_SIGNAL_DEPTH);
}
