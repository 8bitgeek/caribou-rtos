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
#ifndef _CARIBOU_IPC_H_
#define _CARIBOU_IPC_H_

#include <caribou/kernel/types.h>
#include <caribou/kernel/timer.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/queue.h>
#include <caribou/lib/bytequeue.h>
#include <caribou/lib/errno.h>

#ifdef __cplusplus
extern "C"
{
#endif

void					caribou_ipc_init			(caribou_thread_t* thread);	

bool					caribou_ipc_signal_try_post	(caribou_thread_t* thread, uint8_t signal);
bool					caribou_ipc_signal_post		(caribou_thread_t* thread, uint8_t signal, caribou_tick_t timeout);
int						caribou_ipc_signal_try_take	();
int						caribou_ipc_signal_take		(caribou_tick_t timeout);

bool					caribou_ipc_message_try_post(caribou_thread_t* thread, const caribou_queue_msg_t* msg);
bool					caribou_ipc_message_post	(caribou_thread_t* thread, const caribou_queue_msg_t* msg, caribou_tick_t timeout);
caribou_queue_msg_t*	caribou_ipc_message_try_take();
caribou_queue_msg_t*	caribou_ipc_message_take	(caribou_tick_t timeout);

#ifdef __cplusplus
}
#endif

#endif
