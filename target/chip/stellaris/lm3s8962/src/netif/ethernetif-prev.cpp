/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
/**
 * Copyright (c) 2001-2004 Swedish Institute of Computer Science.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 *
 * Author: Adam Dunkels <adam@sics.se>
 *
 */

/**
 * Copyright (c) 2008 Texas Instruments Incorporated
 *
 * This file is dervied from the ``ethernetif.c'' skeleton Ethernet network
 * interface driver for lwIP.
 *
 */
#include <lwip/opt.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/sys.h>
#include <lwip/stats.h>
#include <lwip/tcp_impl.h>
#include <lwip/snmp.h>
#include <lwip/dhcp.h>
#include <lwip/ip_frag.h>
#include <lwip/autoip.h>
#include <lwip/igmp.h>
#include <lwip/tcpip.h>
#include <lwip/sockets.h>
#include <netif/etharp.h>
#include <netif/ppp_oe.h>
#include <netif/ethernetif.h>

#include <caribou/lib/queue.h>
#include <caribou/lib/string.h>
#include <caribou/kernel/timer.h>
#if defined(ACCUTRON_ACCTRX)
	#include <csettings.h>
	#include <cwatchdog.h>
	#include <caribou++/cbytearray.h>
#endif
/// Sanity Check:  This interface driver will NOT work if the following defines are incorrect.

#if (PBUF_LINK_HLEN != 16)
#error "PBUF_LINK_HLEN must be 16 for this interface driver!"
#endif
#if (ETH_PAD_SIZE != 2)
#error "ETH_PAD_SIZE must be 2 for this interface driver!"
#endif
#if (!SYS_LIGHTWEIGHT_PROT)
#error "SYS_LIGHTWEIGHT_PROT must be enabled for this interface driver!"
#endif

/// Stack size of stellarisif thread
#define ethernetif_input_STACKSZ	820

/// Number of pbufs supported in low-level tx/rx pbuf queue.
#ifndef STELLARIS_NUM_PBUF_QUEUE
#define STELLARIS_NUM_PBUF_QUEUE    24
#endif

/// Setup processing for PTP (IEEE-1588).
#if LWIP_PTPD
extern void lwIPHostGetTime(u32_t *time_s, u32_t *time_ns);
#endif

/// Stellaris DriverLib Header Files required for this interface driver.
#include <inc/hw_ethernet.h>
#include <inc/hw_ints.h>
#include <inc/hw_memmap.h>
#include <inc/hw_types.h>
#include <inc/hw_sysctl.h>
#include <driverlib/ethernet.h>
#include <driverlib/interrupt.h>
#include <driverlib/sysctl.h>
#include <driverlib/gpio.h>

#include <chip/chip.h>
#include <caribou/kernel/interrupt.h>

/* Helper struct to hold a queue of pbufs for transmit and receive. */
struct pbufq {
	struct pbuf *pbuf[STELLARIS_NUM_PBUF_QUEUE];
	unsigned long qwrite;
	unsigned long qread;
	unsigned long overflow;
};

/* Helper macros for accessing pbuf queues. */
#define PBUF_QUEUE_EMPTY(q) \
    (((q)->qwrite == (q)->qread) ? true : false)

#define PBUF_QUEUE_FULL(q) \
    ((((((q)->qwrite + 1) % STELLARIS_NUM_PBUF_QUEUE)) == (q)->qread) ? \
    true : false )

/// Helper struct to hold private data used to operate your ethernet interface.
/// Keeping the ethernet address of the MAC in this struct is not necessary
/// as it is already kept in the struct netif.
/// But this is only an example, anyway...
struct stellarisif
{
	struct eth_addr *ethaddr;
	struct pbufq txq;
};

/// Global variable for this interface's private data.  Needed to allow
/// the interrupt handlers access to this information outside of the
/// context of the lwIP netif.
static struct stellarisif stellarisif_data;

/// Pop a pbuf packet from a pbuf packet queue
/// @param q is the packet queue from which to pop the pbuf.
/// @return pointer to pbuf packet if available, NULL otherswise.
static struct pbuf* dequeue_packet(struct pbufq *q)
{
	struct pbuf* pBuf;
	int lvl = chip_interrupts_disable();
	// This entire function must run within a "critical section" to preserve
	// the integrity of the transmit pbuf queue.
	if(PBUF_QUEUE_EMPTY(q)) 
	{
		// Return a NULL pointer if the queue is empty. 
		pBuf = (struct pbuf *)NULL;
	}
	else 
	{
		// The queue is not empty so return the next frame from it
		// and adjust the read pointer accordingly.
		pBuf = q->pbuf[q->qread];
		q->qread = ((q->qread + 1) % STELLARIS_NUM_PBUF_QUEUE);
	}
	// Return to prior interrupt state and return the pbuf pointer.
	chip_interrupts_set(lvl);
	return(pBuf);
}

/// Push a pbuf packet onto a pbuf packet queue
/// @param p is the pbuf to push onto the packet queue.
/// @param q is the packet queue.
/// @return 1 if successful, 0 if q is full.
static int enqueue_packet(struct pbuf *p, struct pbufq *q)
{
	int rc=0;
	int lvl = chip_interrupts_disable();
	// This entire function must run within a "critical section" to preserve
	// the integrity of the transmit pbuf queue.
	if(!PBUF_QUEUE_FULL(q)) 
	{
		// The queue isn't full so we add the new frame at the current
		// write position and move the write pointer.
		q->pbuf[q->qwrite] = p;
		q->qwrite = ((q->qwrite + 1) % STELLARIS_NUM_PBUF_QUEUE);
		rc = 1;
	}
	else 
	{
		// The stack is full so we are throwing away this value.  Keep track
		// of the number of times this happens.
		q->overflow++;
	}
	// Return to prior interrupt state and return the pbuf pointer. */
	chip_interrupts_set(lvl);
	return rc;
}

caribou_thread_t* ethernetif_input_p=NULL;
#define STELLARIS_QUEUE_SZ STELLARIS_NUM_PBUF_QUEUE
#define STELLARIS_IRQS	(ETH_INT_RX | ETH_INT_TX)
//#define STELLARIS_IRQS	ETH_INT_RX

/// translate a lwip err to an errno
int lwip_errno(int err)
{
	int rc=0;
	switch(err)
	{
		case ERR_MEM:			rc=ENOMEM;			break;	/* Out of memory error.     */
		case ERR_BUF:			rc=ENOSR;			break;	/* Buffer error.            */
		case ERR_TIMEOUT:		rc=ETIME;			break;	/* Timeout.                 */
		case ERR_RTE:			rc=EHOSTUNREACH;	break;	/* Routing problem.         */
		case ERR_INPROGRESS:	rc=EINPROGRESS;		break;	/* Operation in progress    */
		case ERR_VAL:			rc=EINVAL;			break;	/* Illegal value.           */
		case ERR_WOULDBLOCK:	rc=EAGAIN;			break;	/* Operation would block.   */
		case ERR_USE:			rc=EADDRINUSE;		break;	/* Address in use.          */
		case ERR_ISCONN:		rc=EISCONN;			break;	/* Already connected.       */
		case ERR_ABRT:			rc=ECONNABORTED;	break;	/* Connection aborted.      */
		case ERR_RST:			rc=ENETRESET;		break;	/* Connection reset.        */
		case ERR_CLSD:			rc=ENOTCONN;		break;	/* Connection closed.       */
		case ERR_CONN:			rc=ENOTCONN;		break;	/* Not connected.           */
		case ERR_ARG:			rc=EINVAL;			break;	/* Illegal argument.        */
		case ERR_IF:			rc=EIO;				break;	/* Low-level netif error    */
		default:				rc=err;				break;
	}
	errno = rc;
	return rc;
}

/// The number of milliseconds between calls to the soft-MDIX function when
/// using a RTOS.
#define SOFT_MDIX_INTERVAL      10

/// The default IP address aquisition mode.
#define STATIC_ADDRESS(a1,a2,a3,a4) (uint32_t)(a1<<24)|(a2<<16)|(a3<<8)|(a4)

/// The lwIP network interface structure for the Stellaris Ethernet MAC.
struct netif gNetIf;

///****************************************************************************
/// The local time when the TCP timer was last serviced.
///****************************************************************************
static unsigned long g_ulTCPTimer = 0;

///****************************************************************************
/// The local time for the lwIP Library Abstraction layer, used to support the
/// Host and lwIP periodic callback functions.
///****************************************************************************
static unsigned long g_ulLocalTimer = 0;
static unsigned long g_ulIGMPTimer = 0;

///****************************************************************************
/// The local time when the soft MDI/MDIX switch was last switched.
///****************************************************************************
static unsigned long g_ulMDIXTimer = 0;

///****************************************************************************
/// The local time when the ARP timer was last serviced.
///****************************************************************************
#if LWIP_ARP
static unsigned long g_ulARPTimer = 0;
#endif

///****************************************************************************
/// The local time when the AutoIP timer was last serviced.
///****************************************************************************
#if LWIP_AUTOIP
static unsigned long g_ulAutoIPTimer = 0;
#endif

///****************************************************************************
/// The local time when the DHCP Coarse timer was last serviced.
///****************************************************************************
#if LWIP_DHCP
static unsigned long g_ulDHCPCoarseTimer = 0;
#endif

///****************************************************************************
/// The local time when the DHCP Fine timer was last serviced.
///****************************************************************************
#if LWIP_DHCP
static unsigned long g_ulDHCPFineTimer = 0;
#endif

///****************************************************************************
/// The local time when the IP Reassembly timer was last serviced.
///****************************************************************************
#if IP_REASSEMBLY
static unsigned long g_ulIPReassemblyTimer = 0;
#endif

///****************************************************************************
/// The local time when the DNS timer was last serviced.
///****************************************************************************
#if LWIP_DNS
static unsigned long g_ulDNSTimer = 0;
#endif

/// This function services all of the lwIP periodic timers, including TCP and
/// Host timers.  This should be called from the lwIP context, which may be
/// the Ethernet interrupt (in the case of a non-RTOS system) or the lwIP
/// thread, in the event that an RTOS is used.
static void stellarisif_service_timers(void)
{
	uint32_t delta;
	// Increment the local timer according to elapsed time in ms.
	if ( (delta = (uint32_t)to_ms(caribou_timer_ticks()) - g_ulLocalTimer) )
	{
		g_ulLocalTimer += delta;
    }

	caribou_thread_lock();
    if((EthernetPHYRead(ETH_BASE, PHY_MR1) & PHY_MR1_LINK) == 0)
    // Service the MDIX timer.
    {
        // See if there has not been a link for 2 seconds.
        if((g_ulLocalTimer - g_ulMDIXTimer) >= 2000)
        {
            // There has not been a link for 2 seconds, so flip the MDI/MDIX
            // switch.  This is handled automatically by Fury rev A2, but is
            // harmless.
            HWREG(ETH_BASE + MAC_O_MDIX) ^= MAC_MDIX_EN;
            // Reset the MDIX timer.
            g_ulMDIXTimer = g_ulLocalTimer;
        }
    }
    else
    {
        // There is a link, so reset the MDIX timer.
        g_ulMDIXTimer = g_ulLocalTimer;
    }

    // Service the host timer.
	#if HOST_TMR_INTERVAL
		if((g_ulLocalTimer - g_ulHostTimer) >= HOST_TMR_INTERVAL)
		{
			g_ulHostTimer = g_ulLocalTimer;
			lwIPHostTimerHandler();
		}
	#endif
		// Service the ARP timer.
	#if LWIP_ARP
		if((g_ulLocalTimer - g_ulARPTimer) >= ARP_TMR_INTERVAL)
		{
			g_ulARPTimer = g_ulLocalTimer;
			etharp_tmr();
		}
	#endif
		// Service the TCP timer.
	#if LWIP_TCP
		if((g_ulLocalTimer - g_ulTCPTimer) >= TCP_TMR_INTERVAL)
		{
			g_ulTCPTimer = g_ulLocalTimer;
			tcp_tmr();
		}
	#endif
		// Service the AutoIP timer.
	#if LWIP_AUTOIP
		if((g_ulLocalTimer - g_ulAutoIPTimer) >= AUTOIP_TMR_INTERVAL)
		{
			g_ulAutoIPTimer = g_ulLocalTimer;
			autoip_tmr();
		}
	#endif
		// Service the DCHP Coarse Timer.
	#if LWIP_DHCP
		if((g_ulLocalTimer - g_ulDHCPCoarseTimer) >= DHCP_COARSE_TIMER_MSECS)
		{
			g_ulDHCPCoarseTimer = g_ulLocalTimer;
			dhcp_coarse_tmr();
		}
	#endif
		// Service the DCHP Fine Timer.
	#if LWIP_DHCP
		if((g_ulLocalTimer - g_ulDHCPFineTimer) >= DHCP_FINE_TIMER_MSECS)
		{
			g_ulDHCPFineTimer = g_ulLocalTimer;
			dhcp_fine_tmr();
		}
	#endif
		// Service the IP Reassembly Timer
	#if IP_REASSEMBLY
		if((g_ulLocalTimer - g_ulIPReassemblyTimer) >= IP_TMR_INTERVAL)
		{
			g_ulIPReassemblyTimer = g_ulLocalTimer;
			ip_reass_tmr();
		}
	#endif
		// Service the IGMP Timer
	#if LWIP_IGMP
		if((g_ulLocalTimer - g_ulIGMPTimer) >= IGMP_TMR_INTERVAL)
		{
			g_ulIGMPTimer = g_ulLocalTimer;
			igmp_tmr();
		}
	#endif
		// Service the DNS Timer
	#if LWIP_DNS
		if((g_ulLocalTimer - g_ulDNSTimer) >= DNS_TMR_INTERVAL)
		{
			g_ulDNSTimer = g_ulLocalTimer;
			dns_tmr();
		}
	#endif

	caribou_thread_unlock();
}

#if NETIF_DEBUG
/// Print an IP header by using LWIP_DEBUGF
/// @param p an IP packet, p->payload pointing to the IP header
void stellarisif_debug_print(struct pbuf *p)
{
	struct eth_hdr *ethhdr = (struct eth_hdr *)p->payload;
	u16_t *plen = (u16_t *)p->payload;

	LWIP_DEBUGF(NETIF_DEBUG, ("ETH header:\n"));
	LWIP_DEBUGF(NETIF_DEBUG, ("Packet Length:%5"U16_F" \n",*plen));
	LWIP_DEBUGF(NETIF_DEBUG, ("Destination: %02"X8_F"-%02"X8_F"-%02"X8_F"-%02"X8_F"-%02"X8_F"-%02"X8_F"\n",
		ethhdr->dest.addr[0],
		ethhdr->dest.addr[1],
		ethhdr->dest.addr[2],
		ethhdr->dest.addr[3],
		ethhdr->dest.addr[4],
		ethhdr->dest.addr[5]));
	LWIP_DEBUGF(NETIF_DEBUG, ("Source: %02"X8_F"-%02"X8_F"-%02"X8_F"-%02"X8_F"-%02"X8_F"-%02"X8_F"\n",
		ethhdr->src.addr[0],
		ethhdr->src.addr[1],
		ethhdr->src.addr[2],
		ethhdr->src.addr[3],
		ethhdr->src.addr[4],
		ethhdr->src.addr[5]));
	LWIP_DEBUGF(NETIF_DEBUG, ("Packet Type:0x%04"U16_F" \n", ethhdr->type));
}
#endif /* NETIF_DEBUG */

/// Handles the timeout for the soft-MDIX timer when using a RTOS.
static void soft_mdx_timer(void *pvArg)
{
    // Service the MDIX timer.
    if((EthernetPHYRead(ETH_BASE, PHY_MR1) & PHY_MR1_LINK) == 0)
    {
        g_ulMDIXTimer += SOFT_MDIX_INTERVAL;
        // See if there has not been a link for 2 seconds.
        if(g_ulMDIXTimer >= 2000)
        {
            // There has not been a link for 2 seconds, so flip the MDI/MDIX switch.
            // This is handled automatically by Fury rev A2, but is harmless.
            HWREG(ETH_BASE + MAC_O_MDIX) ^= MAC_MDIX_EN;
            // Reset the MDIX timer.
            g_ulMDIXTimer = 0;
        }
    }
    else
    {
        // There is a link, so reset the MDIX timer.
        g_ulMDIXTimer = 0;
    }
    // Re-schedule the soft-MDIX timer callback function timeout.
    sys_timeout(SOFT_MDIX_INTERVAL, soft_mdx_timer, NULL);
}

/// This function should do the actual transmission of the packet. The packet is
/// contained in the pbuf that is passed to the function. This pbuf might be
/// chained.
/// @param netif the lwip network interface structure for this ethernetif
/// @param p the MAC packet to send (e.g. IP packet including MAC addresses and type)
/// @return ERR_OK if the packet could be sent
///         an err_t value if the packet couldn't be sent
/// @note This function MUST be called with interrupts disabled or with the
///       Stellaris Ethernet transmit fifo protected.
static err_t stellarisif_transmit(struct netif *netif, struct pbuf *p)
{
	int iBuf;
	register unsigned char *pucBuf;
	register unsigned long *pulBuf;
	struct pbuf *q;
	int iGather;
	unsigned long ulGather;
	unsigned char *pucGather;
	volatile register uint32_t* mac_o_data = (uint32_t*)(ETH_BASE + MAC_O_DATA);
	/**
	* Fill in the first two bytes of the payload data (configured as padding
	* with ETH_PAD_SIZE = 2) with the total length of the payload data
	* (minus the Ethernet MAC layer header).
	*
	*/
	*((unsigned short *)(p->payload)) = p->tot_len - 16;

	/* Initialize the gather register. */
	iGather = 0;
	pucGather = (unsigned char *)&ulGather;
	ulGather = 0;

	/* Copy data from the pbuf(s) into the TX Fifo. */
	for(q = p; q != NULL; q = q->next)
	{
		/* Intialize a char pointer and index to the pbuf payload data. */
		pucBuf = (unsigned char *)q->payload;
		iBuf = 0;

		/**
		 * If the gather buffer has leftover data from a previous pbuf
		 * in the chain, fill it up and write it to the Tx FIFO.
		 *
		 */
		while((iBuf < q->len) && (iGather != 0))
		{
			/* Copy a byte from the pbuf into the gather buffer. */
			pucGather[iGather] = pucBuf[iBuf++];

			/* Increment the gather buffer index modulo 4. */
			iGather = ((iGather + 1) % 4);
		}

		/**
		 * If the gather index is 0 and the pbuf index is non-zero,
		 * we have a gather buffer to write into the Tx FIFO.
		 *
		 */
		if((iGather == 0) && (iBuf != 0))
		{
			*mac_o_data = ulGather;
			ulGather = 0;
		}

		/* Initialze a long pointer into the pbuf for 32-bit access. */
		pulBuf = (unsigned long *)&pucBuf[iBuf];

		/**
		 * Copy words of pbuf data into the Tx FIFO, but don't go past
		 * the end of the pbuf.
		 *
		 */
		while((iBuf + 4) <= q->len)
		{
			*mac_o_data = *pulBuf++;
			iBuf += 4;
		}

		/**
		 * Check if leftover data in the pbuf and save it in the gather
		 * buffer for the next time.
		 *
		 */
		while(iBuf < q->len)
		{
			/* Copy a byte from the pbuf into the gather buffer. */
			pucGather[iGather] = pucBuf[iBuf++];

			/* Increment the gather buffer index modulo 4. */
			iGather = ((iGather + 1) % 4);
		}
	}

	/* Send any leftover data to the FIFO. */
	*mac_o_data = ulGather;

	/* Wakeup the transmitter. */
	HWREG(ETH_BASE + MAC_O_TR) = MAC_TR_NEWTX;

	/* Dereference the pbuf from the queue. */
	pbuf_free(p);

	LINK_STATS_INC(link.xmit);

	return(ERR_OK);
}


/// This function with either place the packet into the Stellaris transmit fifo,
/// or will place the packet in the interface PBUF Queue for subsequent
/// transmission when the transmitter becomes idle.
/// @param netif the lwip network interface structure for this ethernetif
/// @param p the MAC packet to send (e.g. IP packet including MAC addresses and type)
/// @return ERR_OK if the packet could be sent
///         an err_t value if the packet couldn't be sent
static err_t stellarisif_output(struct netif *netif, struct pbuf *p)
{
	err_t rc = ERR_OK;

	struct stellarisif* stellarisif = (struct stellarisif*)netif->state;
	
	int lvl = chip_interrupts_disable();

	/**
	* Bump the reference count on the pbuf to prevent it from being
	* freed till we are done with it.
	*
	*/
	pbuf_ref(p);

	/**
	* If the transmitter is idle, and there is nothing on the queue,
	* send the pbuf now.
	*
	*/
	if(PBUF_QUEUE_EMPTY(&stellarisif->txq) && ((HWREG(ETH_BASE + MAC_O_TR) & MAC_TR_NEWTX) == 0))
	{
		stellarisif_transmit(netif, p);
	}
	else /* Otherwise place the pbuf on the transmit queue. */
	{
		/* Add to transmit packet queue */
		if(!enqueue_packet(p, &(stellarisif->txq)))
		{
			/* if no room on the queue, free the pbuf reference and return error. */
			pbuf_free(p);
			rc =  ERR_MEM;
		}
	}

	/* Return to prior interrupt state and return. */
	chip_interrupts_set(lvl);
	return rc;
}

/// This function will read a single packet from the Stellaris ethernet
/// interface, if available, and return a pointer to a pbuf.  The timestamp
/// of the packet will be placed into the pbuf structure.
/// @param netif the lwip network interface structure for this ethernetif
/// @return pointer to pbuf packet if available, NULL otherswise.
static struct pbuf *stellarisif_receive(struct netif *netif)
{
	volatile register uint32_t* mac_o_data = (uint32_t*)(ETH_BASE + MAC_O_DATA);
	register uint32_t *ptr;
	register struct pbuf *p; 
	struct pbuf *q;
	u16_t len;
	u32_t temp;

	#if LWIP_PTPD
		u32_t time_s, time_ns;

		/* Get the current timestamp if PTPD is enabled */
		lwIPHostGetTime(&time_s, &time_ns);
	#endif


	/* Check if a packet is available, if not, return NULL packet. */
	if( (HWREG(ETH_BASE + MAC_O_NP) & MAC_NP_NPR_M) != 0)
	{
		/**
		* Obtain the size of the packet and put it into the "len" variable.
		* Note:  The length returned in the FIFO length position includes the
		* two bytes for the length + the 4 bytes for the FCS.
		*
		*/
		temp = *mac_o_data;
		len = temp & 0xFFFF;

		/* We allocate a pbuf chain of pbufs from the pool. */
		p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);

		/* If a pbuf was allocated, read the packet into the pbuf. */
		if(p != NULL) {
			/* Place the first word into the first pbuf location. */
			*(unsigned long *)p->payload = temp;
			p->payload = (char *)(p->payload) + 4;
			p->len -= 4;

			/* Process all but the last buffer in the pbuf chain. */
			q = p;
			while(q != NULL)
			{
				/* Setup a byte pointer into the payload section of the pbuf. */
				ptr = (uint32_t*)q->payload;

				/**
				* Read data from FIFO into the current pbuf
				* (assume pbuf length is modulo 4)
				*
				*/
				for(register int i = 0; i < q->len; i += 4)
				{
					*ptr++ = *mac_o_data;
				}

				/* Link in the next pbuf in the chain. */
				q = q->next;
			}

			/* Restore the first pbuf parameters to their original values. */
			p->payload = (char *)(p->payload) - 4;
			p->len += 4;

			/* Adjust the link statistics */
			LINK_STATS_INC(link.recv);

			#if LWIP_PTPD
				/* Place the timestamp in the PBUF */
				p->time_s = time_s;
				p->time_ns = time_ns;
			#endif
		}
		else /* If no pbuf available, just drain the RX fifo. */
		{
			for(register int i = 4; i < len; i+=4)
			{
				temp = *mac_o_data;
			}
			/* Adjust the link statistics */
			LINK_STATS_INC(link.memerr);
			LINK_STATS_INC(link.drop);
		}

		return p;
	}
	return NULL;
}

/// This task runs the lwip timers
static void ethernetif_input(void* arg)
{
	//int watchdogHandle = Accutron::CWatchdog::append();
	uint32_t start = to_ms(caribou_timer_ticks());
	for(;;)
    {
		if ( to_ms(caribou_timer_ticks()) > start )
		{
			stellarisif_service_timers();		// Service the lwIP timers.
			start = to_ms(caribou_timer_ticks());
		}
		//Accutron::CWatchdog::checkin(watchdogHandle);
		caribou_thread_yield();
	}
}

/**
 * Process tx and rx packets at the low-level interrupt.
 *
 * Should be called from the Stellaris Ethernet Interrupt Handler.  This
 * function will read packets from the Stellaris Ethernet fifo and place them
 * into a pbuf queue.  If the transmitter is idle and there is at least one packet
 * on the transmit queue, it will place it in the transmit fifo and start the
 * transmitter.
 *
 */
void stellarisif_interrupt(struct netif *netif)
{
	volatile register uint32_t* mac_o_tr = (uint32_t*)(ETH_BASE + MAC_O_TR);
	struct stellarisif* stellarisif;
	struct pbuf *p;

	/* setup pointer to the if state data */
	stellarisif = (struct stellarisif*)netif->state;

	/**
	* Process the transmit and receive queues as long as there is receive
	* data available
	*
	*/
	p = stellarisif_receive(netif);
	while(p != NULL)
	{
		/* process the packet */
		if ( netif->input(p,netif) != ERR_OK )
		{
			/* drop the packet */
			LWIP_DEBUGF(NETIF_DEBUG, ("stellarisif_input: input error\n"));
			pbuf_free(p);

			/* Adjust the link statistics */
			LINK_STATS_INC(link.memerr);
			LINK_STATS_INC(link.drop);
		}

		/* Check if TX fifo is empty and packet available */
		if((*mac_o_tr & MAC_TR_NEWTX) == 0)
		{
			p = dequeue_packet(&stellarisif->txq);
			if(p != NULL)
			{
				stellarisif_transmit(netif, p);
			}
		}

		/* Read another packet from the RX fifo */
		p = stellarisif_receive(netif);
	}

	/* One more check of the transmit queue/fifo */
	if((*mac_o_tr & MAC_TR_NEWTX) == 0)
	{
		p = dequeue_packet(&stellarisif->txq);
		if(p != NULL)
		{
		  stellarisif_transmit(netif, p);
		}
	}
}

/// Handles Ethernet interrupts for the lwIP TCP/IP stack.
/// This function handles Ethernet interrupts for the lwIP TCP/IP stack.  At
/// the lowest level, all receive packets are placed into a packet queue for
/// processing at a higher level.  Also, the transmit packet queue is checked
/// and packets are drained and transmitted through the Ethernet MAC as needed.
/// If the system is configured without an RTOS, additional processing is
/// performed at the interrupt level.  The packet queues are processed by the
/// lwIP TCP/IP code, and lwIP periodic timers are serviced (as needed).
/// @return None.
void isr_ethernet(InterruptVector vector,void* arg)
{
	if ( vector == INT_ETH )
	{
		uint32_t ulStatus = HWREG(ETH_BASE + MAC_O_RIS);
		HWREG(ETH_BASE + MAC_O_IACK) = ulStatus;			// clear status
		stellarisif_interrupt(&gNetIf);
	}
}

/// lwip system init
void sys_init(void)
{
	void* ethernetif_input_stack;
 	ethernetif_input_stack = malloc(ethernetif_input_STACKSZ);
	if ( ethernetif_input_stack )
	{
		ethernetif_input_p = caribou_thread_create("ifthread",ethernetif_input,NULL,NULL,ethernetif_input_stack,ethernetif_input_STACKSZ,CARIBOU_THREAD_HIGHPRIO);
	}
}

/// In this function, the hardware should be initialized.
/// Called from stellarisif_init().
/// @param netif the already initialized lwip network interface structure
///        for this ethernetif
static void stellarisif_hwinit(struct netif *netif)
{
	u32_t temp;
	// struct stellarisif *stellarisif = netif->state;
	// set MAC hardware address length
	netif->hwaddr_len = ETHARP_HWADDR_LEN;
	// set MAC hardware address
	#if !defined(ACCUTRON_ACCTRX)
		EthernetMACAddrGet(ETH_BASE, &(netif->hwaddr[0]));
	#else
		{
			CARIBOU::CByteArray mac = Accutron::CSettings::macAddr();
			memcpy(netif->hwaddr,mac.data(),6);
		}
	#endif
	// maximum transfer unit
	netif->mtu = 1500;
	// device capabilities
	// don't set NETIF_FLAG_ETHARP if this device is not an ethernet one
	netif->flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_LINK_UP;
	// Do whatever else is needed to initialize interface.
	// Disable all Ethernet Interrupts.
	caribou_vector_install(INT_ETH,isr_ethernet,NULL);
	EthernetIntDisable(ETH_BASE, (ETH_INT_PHY | ETH_INT_MDIO | ETH_INT_RXER | ETH_INT_RXOF | ETH_INT_TX | ETH_INT_TXER | ETH_INT_RX));
	temp = EthernetIntStatus(ETH_BASE, false);
	EthernetIntClear(ETH_BASE, temp);
	// Initialize the Ethernet Controller.
	EthernetInitExpClk(ETH_BASE, SysCtlClockGet());
	// Configure the Ethernet Controller for normal operation.
	// - Enable TX Duplex Mode
	// - Enable TX Padding
	// - Enable TX CRC Generation
	// - Enable RX Multicast Reception
	EthernetConfigSet(ETH_BASE, (ETH_CFG_RX_BADCRCDIS | ETH_CFG_TX_DPLXEN |ETH_CFG_TX_CRCEN | ETH_CFG_TX_PADEN | ETH_CFG_RX_AMULEN));
	// Enable the Ethernet Controller transmitter and receiver.
	EthernetEnable(ETH_BASE);
	// Enable the Ethernet Interrupt handler.
	IntEnable(INT_ETH);
	// Enable Ethernet TX and RX Packet Interrupts.
	EthernetIntEnable(ETH_BASE, STELLARIS_IRQS);
}

/// Should be called at the beginning of the program to set up the
/// network interface. It calls the function stellarisif_hwinit() to do the
/// actual setup of the hardware.
/// This function should be passed as a parameter to netif_add().
/// @param netif the lwip network interface structure for this ethernetif
/// @return ERR_OK if the loopif is initialized
///         ERR_MEM if private data couldn't be allocated
///         any other err_t on error
err_t stellarisif_init(struct netif *netif)
{
	LWIP_ASSERT("netif != NULL", (netif != NULL));
	#if LWIP_NETIF_HOSTNAME
		netif->hostname = "lwip";	// Initialize interface hostname
	#endif
	// Initialize the snmp variables and counters inside the struct netif.
	// The last argument should be replaced with your link speed, in units of bits per second.
	NETIF_INIT_SNMP(netif, snmp_ifType_ethernet_csmacd, 10000000);
	netif->state = &stellarisif_data;
	#if defined(ACCUTRON_ACCTRX)
		netif->name[0] = PRODUCT_IF_NAME[0];
		netif->name[1] = PRODUCT_IF_NAME[1];
	#else
		netif->name[0] = 'e';
        netif->name[1] = '0';
	#endif
	// We directly use etharp_output() here to save a function call.
	// You can instead declare your own function an call etharp_output()
	// from it if you have to do some checks before sending (e.g. if link is available...)
	netif->output = etharp_output;
	netif->linkoutput = stellarisif_output;
	stellarisif_data.ethaddr = (struct eth_addr *)&(netif->hwaddr[0]);
	// initialize the hardware
	stellarisif_hwinit(netif);
	return ERR_OK;
}

/// Get's called during the late init of CARIBOU.
extern "C" void network_init()
{
	struct ip_addr ip_addr;
    struct ip_addr net_mask;
    struct ip_addr gw_addr;
	// Enable Port F for Ethernet LEDs.
    //  LED0        Bit 3   Output
    //  LED1        Bit 2   Output
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    GPIOPinTypeEthernetLED(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3);
    // Enable and Reset the Ethernet Controller.
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ETH);
    SysCtlPeripheralReset(SYSCTL_PERIPH_ETH);
	// If using a RTOS, create the Ethernet interrupt task
	// Setup the network address values.
	#if defined(ACCUTRON_ACCTRX)
		#if LWIP_DHCP
			if ( Accutron::CSettings::dhcpEnabled() )
			{
				IP4_ADDR( &ip_addr,0,0,0,0 );
				IP4_ADDR( &net_mask,0,0,0,0 );
				IP4_ADDR( &gw_addr,0,0,0,0 );
			}
			else
		#endif
		{
			CARIBOU::CByteArray ipAddr	= Accutron::CSettings::ipAddr();
			CARIBOU::CByteArray ipMask		= Accutron::CSettings::ipMask();
			CARIBOU::CByteArray ipGateway	= Accutron::CSettings::ipGateway();
			ip_addr.addr	= htonl(STATIC_ADDRESS(ipAddr.at(0), ipAddr.at(1), ipAddr.at(2), ipAddr.at(3)));
			net_mask.addr	= htonl(STATIC_ADDRESS(ipMask.at(0),   ipMask.at(1),   ipMask.at(2),   ipMask.at(3)));
			gw_addr.addr	= htonl(STATIC_ADDRESS(ipGateway.at(0), ipGateway.at(1), ipGateway.at(2), ipGateway.at(3)));
		}
	#else
		IP4_ADDR( &ip_addr,0,0,0,0 );
		IP4_ADDR( &net_mask,0,0,0,0 );
		IP4_ADDR( &gw_addr,0,0,0,0 );
	#endif

	// Start the TCP/IP thread & init stuff
    tcpip_init(NULL, NULL);
	// Create, configure and add the Ethernet controller interface with
	// default settings.  ip_input should be used to send packets directly to
	// the stack when not using a RTOS and tcpip_input should be used to send
	// packets to the TCP/IP thread's queue when using a RTOS.
	memset(&gNetIf,0,sizeof(struct netif));
	netif_add(&gNetIf, &ip_addr, &net_mask, &gw_addr, NULL, stellarisif_init, tcpip_input);
	netif_set_default(&gNetIf);
	netif_set_up(&gNetIf);
	lwip_socket_init();
	#if defined(ACCUTRON_ACCTRX)
		// Start DHCP, if enabled.
		#if LWIP_DHCP
			if ( Accutron::CSettings::dhcpEnabled() )
			{
				dhcp_start(&gNetIf);
			}
		#endif
		// Start AutoIP, if enabled and DHCP is not.
		#if LWIP_AUTOIP
			if ( Accutron::CSettings::autoIpEnabled() )
			{
				autoip_start(&gNetIf);
			}
		#endif
	#else
		dhcp_start(&gNetIf);		
        autoip_start(&gNetIf);
	#endif
	// Bring the interface up.
	netif_set_up(&gNetIf);
	// Setup a timeout for the host timer callback function if using a RTOS.
	#if !NO_SYS && HOST_TMR_INTERVAL
		sys_timeout(HOST_TMR_INTERVAL, lwIPPrivateHostTimer, NULL);
	#endif
	// If not running on a Fury-class device, then MDIX is handled in software.
	// In this case, when using a RTOS, setup a timeout for the soft-MDIX
	// handler.
	if(!CLASS_IS_FURY)
	{
		sys_timeout(SOFT_MDIX_INTERVAL, soft_mdx_timer, NULL);
	}
	chip_vector_enable(INT_ETH);
	// join multicast group.
	#if LWIP_IGMP
		// The ip-address is NULL at this point until auto-ip exstablishes an IP addr???
		struct ip_addr addp_addr;
		addp_addr.addr = htonl(STATIC_ADDRESS(224,0,5,128));
        gNetIf.flags |= NETIF_FLAG_IGMP;
		igmp_start( &gNetIf );
		if ( igmp_joingroup(&ip_addr,&addp_addr) != 0 )
		{
			perror("lgmp_joingroup");
		}
	#endif
	// wait for the interface address to come up
	while ( gNetIf.ip_addr.addr == (uint32_t)0 )
	{
		caribou_thread_yield();
	}
}



