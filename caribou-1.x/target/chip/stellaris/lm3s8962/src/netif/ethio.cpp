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

caribou_thread_t* eth_io_thread=NULL;
static uint8_t eth_io_stack[PRODUCT_ETHIF_THREAD_STACKSZ];

/* called from LwIP or other TCPIP stack */
extern "C" void sys_init(void)
{
	eth_io_thread = caribou_thread_create("eth_io",eth_io,NULL,&interface,eth_io_stack,PRODUCT_ETHIF_THREAD_STACKSZ,PRODUCT_ETHIF_THREAD_PRIO);
}

/**
 * @param interface_t* the lwip network interface structure
 */
extern "C" void eth_io(void *arg)
{
	for( ;; )
	{
		#if LWIP_PTPD
			u32_t time_s, time_ns;
			lwIPHostGetTime(&time_s, &time_ns);					/* get the current timestamp if PTPD is enabled */
		#endif
		/* receive data from interface to pbuf ... */
		if ( !eth_queue_empty(&interface.rx_queue) )
		{
            uint32_t rx_frame_length_word = eth_dequeue(&interface.rx_queue);
			uint16_t length_in_bytes = (rx_frame_length_word & 0xFFFF);
            struct pbuf *p = pbuf_alloc(PBUF_RAW, length_in_bytes, PBUF_POOL);
            struct pbuf *q;

			if ( p )
			{
				*(uint32_t *)p->payload = rx_frame_length_word;
                p->payload = (char *)(p->payload) + 4;
				p->len -= 4;
                
				for(struct pbuf *q = p ; q ; )					/* process all but the last buffer in the pbuf chain. */
				{
					uint32_t* ptr = (uint32_t*)q->payload;		/* setup a byte pointer into the payload section of the pbuf. */
					for(register int i = 0; i < q->len; i += 4)	/* read data from FIFO into the current pbuf (assume pbuf length is modulo 4) */
					{
						while(eth_queue_empty(&interface.rx_queue))
							caribou_thread_yield();
						*ptr++ = eth_dequeue(&interface.rx_queue);
					}
					q = q->next;								/* Link in the next pbuf in the chain. */
				}
				p->payload = (char *)(p->payload) - 4;			/* Restore the first pbuf parameters to their original values. */
				p->len += 4;
				LINK_STATS_INC(link.recv);						/* Adjust the link statistics */
				#if LWIP_PTPD
					p->time_s = time_s;							/* Place the timestamp in the PBUF */
					p->time_ns = time_ns;
				#endif
				if ( interface.netif.input(p,&interface.netif) != ERR_OK )
				{
					pbuf_free(p);
					LWIP_DEBUGF(NETIF_DEBUG, ("eth_io: err\n"));
					LINK_STATS_INC(link.memerr);				/* Adjust the link statistics */
					LINK_STATS_INC(link.drop);
				}
			}
			else												/* If no pbuf available, just drain the RX fifo. */
			{
				for(register int i = 4; i < length_in_bytes; i+=4)
				{
					while(eth_queue_empty(&interface.rx_queue))
						caribou_thread_yield();
					volatile uint32_t trash = eth_dequeue(&interface.rx_queue);
				}
				LINK_STATS_INC(link.memerr);					/* Adjust the link statistics */
				LINK_STATS_INC(link.drop);
			}
		}
		caribou_thread_yield();
	}
}  
