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

extern "C" err_t eth_output(struct netif *netif, struct pbuf *p)
{
	volatile uint8_t *pucBuf;
	volatile uint32_t *pulBuf;
	volatile uint32_t ulGather;
	volatile uint8_t *pucGather;
	struct pbuf *q;
	int iBuf;
	int iGather;
	/** 
	* Fill in the first two bytes of the payload data (configured as padding
	* with ETH_PAD_SIZE = 2) with the total length of the payload data
	* (minus the Ethernet MAC layer header). 
	*/
	*((uint16_t *)(p->payload)) = p->tot_len - 16;

	/* Initialize the gather register. */
	iGather = 0;
	pucGather = (uint8_t *)&ulGather;
	ulGather = 0;

	/* Copy data from the pbuf(s) into the TX Fifo. */
	for(q = p; q != NULL; q = q->next)
	{
		/* Intialize a char pointer and index to the pbuf payload data. */
		pucBuf = (uint8_t *)q->payload;
		iBuf = 0;

		/** If the gather buffer has leftover data from a previous pbuf in the chain, fill it up and write it to the Tx FIFO. */
		while((iBuf < q->len) && (iGather != 0))
		{
			pucGather[iGather] = pucBuf[iBuf++];		/* Copy a byte from the pbuf into the gather buffer. */
			iGather = ((iGather + 1) % 4);				/* Increment the gather buffer index modulo 4. */
		}

		if((iGather == 0) && (iBuf != 0))				/** If the gather index is 0 and the pbuf index is non-zero, we have a gather buffer to write into the Tx FIFO. */
		{
			while(eth_queue_full(&interface.tx_queue))
				caribou_thread_yield();
			eth_enqueue(&interface.tx_queue,ulGather);
			ulGather = 0;
		}

		pulBuf = (uint32_t *)&pucBuf[iBuf];				/* Initialze a long pointer into the pbuf for 32-bit access. */
		while((iBuf + 4) <= q->len)						/** Copy words of pbuf data into the Tx FIFO, but don't go past the end of the pbuf. */
		{
			while(eth_queue_full(&interface.tx_queue))
				caribou_thread_yield();
			eth_enqueue(&interface.tx_queue,*pulBuf++);
			iBuf += 4;
		}

		
		while(iBuf < q->len)							/** Check if leftover data in the pbuf and save it in the gather buffer for the next time. */
		{
			pucGather[iGather] = pucBuf[iBuf++];		/* Copy a byte from the pbuf into the gather buffer. */
			iGather = ((iGather + 1) % 4);				/* Increment the gather buffer index modulo 4. */
		}
	}

	while(eth_queue_full(&interface.tx_queue))
		caribou_thread_yield();
	eth_enqueue(&interface.tx_queue,ulGather);			/* Send any leftover data to the FIFO. */

	pbuf_free(p);										/* Dereference the pbuf from the queue. */
	LINK_STATS_INC(link.xmit);
	return(ERR_OK);
}


