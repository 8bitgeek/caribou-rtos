/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2017 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/kernel/thread.h>
#include <caribou/lib/watchdog.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <caribou/lib/mutex.h>
#include <chip/chip.h>

typedef struct _watchdog_node_t_
{
	caribou_thread_t*			thread;
	int							checkin;
	struct _watchdog_node_t_*	next;
} watchdog_node_t;

static int watchdog_active=0;
static watchdog_node_t* list=NULL;
static caribou_mutex_t	watchdog_mutex;

#pragma GCC push_options
#pragma GCC optimize ("Os")

static watchdog_node_t* watchdog_node_create()
{
	watchdog_node_t* node = (watchdog_node_t*)malloc(sizeof(watchdog_node_t));
	memset(node,0,sizeof(watchdog_node_t));
	return node;
}

static void watchdog_node_delete(watchdog_node_t* node)
{
	free(node);
}

static void watchdog_node_append(watchdog_node_t* node)
{	
	caribou_mutex_lock(&watchdog_mutex,0);
	if ( list == NULL )
	{
		list = node;
	}
	else
	{
		watchdog_node_t* next;
		for(next=list; next->next != NULL; next = next->next);
		next->next = node;
	}
	node->next=NULL;
	caribou_mutex_unlock(&watchdog_mutex);
}

static void watchdog_node_remove(watchdog_node_t* node)
{
	caribou_mutex_lock(&watchdog_mutex,0);
	if ( list == node )
	{
		list = node->next;
	}
	else
	{
		watchdog_node_t* next;
		for(next=list; next->next != node; next = next->next);
		next->next = node->next;
	}
	caribou_mutex_unlock(&watchdog_mutex);
}

static watchdog_node_t* watchdog_node_locate(caribou_thread_t* thread)
{
	watchdog_node_t* node=NULL;
	caribou_mutex_lock(&watchdog_mutex,0);
	for(watchdog_node_t* next=list; node == NULL && next != NULL; next = next->next)
	{
		if ( next->thread == thread )
		{
			node = next;
		}
	}
	caribou_mutex_unlock(&watchdog_mutex);
	return node;
}

static void watchdog_nodes_reset()
{
	caribou_mutex_lock(&watchdog_mutex,0);
	for(watchdog_node_t* next=list; next != NULL; next = next->next)
	{
		next->checkin = false;
	}
	caribou_mutex_unlock(&watchdog_mutex);
}

static int watchdog_nodes_checkedin()
{
	int checkin=1;
	caribou_mutex_lock(&watchdog_mutex,0);
	for(watchdog_node_t* next=list; checkin && next != NULL; next = next->next)
	{
		checkin = next->checkin;
	}
	caribou_mutex_unlock(&watchdog_mutex);
	return checkin;
}

#pragma GCC pop_options

/* ---------------- PUBLIC --------------------- */

/**
 * Initialize the watchdog system. This function must be called before
 * any of the watchdog functions may be used.
 */
void caribou_watchdog_init()
{
	caribou_mutex_init(&watchdog_mutex,0);
	chip_watchdog_init();
	watchdog_active=1;
}

/**
 * @brief Add a new per-thread watchdog node.
 */
bool caribou_watchdog_new(caribou_thread_t* thread)
{
	bool rc = false;
	watchdog_node_t* node = watchdog_node_create();
	if ( node != NULL && watchdog_node_locate(thread) == NULL )
	{
		node->thread = thread;
		watchdog_node_append(node);
		caribou_watchdog_feed(thread);
		rc = true;
	}
	return rc;
}

/**
 * @brief Delete a watchdog/thread association.
 */
void caribou_watchdog_delete(caribou_thread_t* thread)
{
	watchdog_node_t* node = watchdog_node_locate(thread);
	if ( node != NULL )
	{
		watchdog_node_remove(node);
		watchdog_node_delete(node);
	}
}

void caribou_watchdog_feed(caribou_thread_t* thread)
{
	if ( watchdog_active )
	{
		watchdog_node_t* node = watchdog_node_locate(thread);
		if ( node != NULL )
		{
			node->checkin = 1;
		}
		if ( watchdog_nodes_checkedin() )
		{
			chip_watchdog_feed();
			watchdog_nodes_reset();
		}
	}
}

void caribou_watchdog_feed_self()
{
	caribou_watchdog_feed(caribou_state.current);
}
