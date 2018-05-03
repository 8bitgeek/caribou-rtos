/******************************************************************************
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
#include <board.h>
#include <netif/ethernetif.h>
#include <caribou/kernel/types.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <caribou/lib/semaphore.h>
#include <caribou/lib/queue.h>
#include <lwip/opt.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/sys.h>
#include <netif/etharp.h>
#include <inc/hw_memmap.h>
#include <inc/hw_ethernet.h>
#include <driverlib/ethernet.h>
#include <lwip/timers.h>

extern "C" uint32_t eth_interrupts_enable()
{
	uint32_t rc = eth_interrupts_state();
    HWREG(ETH_BASE + MAC_O_IM) |= ETH_IRQS;
	return rc;
}

extern "C" uint32_t eth_interrupts_disable()
{
	uint32_t rc = eth_interrupts_state();
    HWREG(ETH_BASE + MAC_O_IM) &= ~ETH_IRQS;
	return rc;
}

extern "C" uint32_t eth_interrupts_set(uint32_t state)
{
	uint32_t rc;
	if ( state )
		rc = eth_interrupts_enable();
	else
		rc = eth_interrupts_disable();
	return rc;
}

extern "C" uint32_t eth_interrupts_state()
{
	return (HWREG(ETH_BASE + MAC_O_IM) & ETH_IRQS);
}

extern void eth_queue_clear(queue_t* q)
{
	q->head=q->tail=0;
}

extern uint32_t eth_queue_free(queue_t* q)
{
	uint32_t rc=0;
	int state = caribou_interrupts_disable();
	if ( eth_queue_empty(q) )
		rc = MAX_QUEUE_SZ;
	else if ( eth_queue_full(q) )
		rc = 0;
	else
	{
		if ( q->head > q->tail )
			rc = ( q->tail - q->head );
		else
			rc = ( MAX_QUEUE_SZ-q->tail ) + q->head;
	}
	caribou_interrupts_set(state);
	return rc;
}

extern bool eth_queue_empty(queue_t* q) 
{
	int state = caribou_interrupts_disable();
	bool rc = ((q)->head==(q)->tail);
	caribou_interrupts_set(state);
	return rc;
}

extern bool eth_queue_full(queue_t* q) 
{
	int state = caribou_interrupts_disable();
	bool rc = ((q)->head==((q)->tail-1) || ((q)->head==(MAX_QUEUE_SZ-1)&&(q)->tail==0));
	caribou_interrupts_set(state);
	return rc;
}

/**
 * @brief ** Does not test for overflow **
 */
extern void eth_enqueue(queue_t* q, uint32_t w) 
{
	int state = caribou_interrupts_disable();
	q->queue[q->head++]=w; 
	if (q->head>=MAX_QUEUE_SZ) 
		q->head=0; 
	caribou_interrupts_set(state);
}

/**
 * @brief ** Does not test for underflow **
 */
extern uint32_t eth_dequeue(queue_t* q)
{
	int state = caribou_interrupts_disable();
	uint32_t rc = q->queue[q->tail++];
	if (q->tail>=MAX_QUEUE_SZ)
		q->tail=0;
	caribou_interrupts_set(state);
	return rc;
}
