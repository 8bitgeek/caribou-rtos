/*****************************************************************************
* Copyright (c) 2014 by Accutron Instruments                                 *
* All Rights Reserved                                                        *
*****************************************************************************/
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
/* #include <netif/ppp_oe.h> */
#include <netif/ethernetif.h>
#include <caribou/kernel/interrupt.h>

#define STATIC_ADDRESS(a1,a2,a3,a4) (uint32_t)(a1<<24)|(a2<<16)|(a3<<8)|(a4)

/**
 * Sanity Check:  This interface driver will NOT work if the following defines
 * are incorrect.
 *
 */
#if (PBUF_LINK_HLEN != 16)
#error "PBUF_LINK_HLEN must be 16 for this interface driver!"
#endif
#if (ETH_PAD_SIZE != 2)
#error "ETH_PAD_SIZE must be 2 for this interface driver!"
#endif
#if (!SYS_LIGHTWEIGHT_PROT)
#error "SYS_LIGHTWEIGHT_PROT must be enabled for this interface driver!"
#endif

/**
 * Number of pbufs supported in low-level tx/rx pbuf queue.
 *
 */
#ifndef STELLARIS_NUM_PBUF_QUEUE
#define STELLARIS_NUM_PBUF_QUEUE    24
#endif

/**
 * Setup processing for PTP (IEEE-1588).
 *
 */
#if LWIP_PTPD
extern void lwIPHostGetTime(u32_t *time_s, u32_t *time_ns);
#endif

/**
 * Luminary Micro DriverLib Header Files required for this interface driver.
 *
 */
#include "inc/hw_ethernet.h"
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/ethernet.h"
#include "driverlib/interrupt.h"
#include "driverlib/sysctl.h"

/* Define those to better describe your network interface. */
#define IFNAME0 'l'
#define IFNAME1 'm'

/* Helper struct to hold a queue of pbufs for transmit and receive. */
struct pbufq {
	struct pbuf *pbuf[STELLARIS_NUM_PBUF_QUEUE];
	unsigned long qwrite;
	unsigned long qread;
	unsigned long overflow;
};

/* Helper macros for accessing pbuf queues. */
#define PBUF_QUEUE_EMPTY(q) ((q)->qwrite == (q)->qread)
#define PBUF_QUEUE_FULL(q) (((((q)->qwrite + 1) % STELLARIS_NUM_PBUF_QUEUE)) == (q)->qread)

/**
 * Helper struct to hold private data used to operate your ethernet interface.
 * Keeping the ethernet address of the MAC in this struct is not necessary
 * as it is already kept in the struct netif.
 * But this is only an example, anyway...
 */
struct ethernetif 
{
	struct eth_addr *ethaddr;
	/* Add whatever per-interface state that is needed here. */
	struct pbufq txq;
	struct pbufq rxq;
};

static const uint8_t empty_mac[6] = {0,0,0,0,0,0};

static uint8_t stellarisif_input_stack[PRODUCT_ETHIF_THREAD_STACKSZ];

static void ethernet_isr(InterruptVector vector,void* arg);

/**
 * Global variable for this interface's private data.  Needed to allow
 * the interrupt handlers access to this information outside of the
 * context of the lwIP netif.
 */
static struct ethernetif ethernetif_data;

/**
 * Pop a pbuf packet from a pbuf packet queue
 * @param q is the packet queue from which to pop the pbuf.
 * @return pointer to pbuf packet if available, NULL otherswise.
 */
static struct pbuf* dequeue_packet(struct pbufq *q)
{
	struct pbuf *pBuf=NULL;
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);
	if(!PBUF_QUEUE_EMPTY(q)) 
	{
		pBuf = q->pbuf[q->qread];
		q->qread = ((q->qread + 1) % STELLARIS_NUM_PBUF_QUEUE);
	}
	SYS_ARCH_UNPROTECT(lev);
	return(pBuf);
}

/**
 * Push a pbuf packet onto a pbuf packet queue
 * @param p is the pbuf to push onto the packet queue.
 * @param q is the packet queue.
 * @return 1 if successful, 0 if q is full.
 */
static int enqueue_packet(struct pbuf *p, struct pbufq *q)
{
	int ret=1;
	SYS_ARCH_DECL_PROTECT(lev);
	SYS_ARCH_PROTECT(lev);
	if(!PBUF_QUEUE_FULL(q)) 
	{
		q->pbuf[q->qwrite] = p;
		q->qwrite = ((q->qwrite + 1) % STELLARIS_NUM_PBUF_QUEUE);
	}
	else 
	{
		q->overflow++;
		ret = 0;
	}
	SYS_ARCH_UNPROTECT(lev);
	return(ret);
}

/**
 * This function should do the actual transmission of the packet. The packet is
 * contained in the pbuf that is passed to the function. This pbuf might be
 * chained.
 *
 * @param netif the lwip network interface structure for this ethernetif
 * @param p the MAC packet to send (e.g. IP packet including MAC addresses and type)
 * @return ERR_OK if the packet could be sent
 *         an err_t value if the packet couldn't be sent
 * @note This function MUST be called with interrupts disabled or with the
 *       Stellaris Ethernet transmit fifo protected.
 */
static err_t low_level_transmit(struct netif *netif, struct pbuf *p)
{
	register int iBuf;
	register unsigned char *pucBuf;
	register uint32_t *pulBuf;
	struct pbuf *q;
	int iGather=0;
	uint32_t ulGather=0;
	unsigned char *pucGather=(unsigned char *)&ulGather;
	register uint32_t* macodata = (ETH_BASE + MAC_O_DATA);

	/**
	* Fill in the first two bytes of the payload data (configured as padding
	* with ETH_PAD_SIZE = 2) with the total length of the payload data
	* (minus the Ethernet MAC layer header).
	*
	*/
	*((unsigned short *)(p->payload)) = p->tot_len - 16;

	/* Copy data from the pbuf(s) into the TX Fifo. */
	for(q = p; q; q = q->next) 
	{
		register uint16_t qlen = q->len;
		/* Intialize a char pointer and index to the pbuf payload data. */
		pucBuf = (unsigned char *)q->payload;
		iBuf = 0;
		/**
		* If the gather buffer has leftover data from a previous pbuf
		* in the chain, fill it up and write it to the Tx FIFO.
		*/
		while((iBuf < qlen) && (iGather != 0)) 
		{
			pucGather[iGather] = pucBuf[iBuf++];	/* Copy a byte from the pbuf into the gather buffer. */
			iGather = ((iGather + 1) % 4);			/* Increment the gather buffer index modulo 4. */
		}
		/**
		* If the gather index is 0 and the pbuf index is non-zero,
		* we have a gather buffer to write into the Tx FIFO.
		*/
		if((iGather == 0) && (iBuf != 0)) 
		{
			*macodata = ulGather; // HWREG(ETH_BASE + MAC_O_DATA) = ulGather;
			ulGather = 0;
		}
		/* Initialze a long pointer into the pbuf for 32-bit access. */
		pulBuf = (unsigned long *)&pucBuf[iBuf];
		/**
		* Copy words of pbuf data into the Tx FIFO, but don't go past
		* the end of the pbuf.
		*/
		while((iBuf + 4) <= qlen)
		{
			*macodata = *pulBuf++; // HWREG(ETH_BASE + MAC_O_DATA) = *pulBuf++;
			iBuf += 4;
		}
		/**
		* Check if leftover data in the pbuf and save it in the gather
		* buffer for the next time.
		*/
		while(iBuf < qlen) 
		{
			pucGather[iGather] = pucBuf[iBuf++];	/* Copy a byte from the pbuf into the gather buffer. */
			iGather = ((iGather + 1) % 4);			/* Increment the gather buffer index modulo 4. */
		}
	}
	
	*macodata = ulGather; //HWREG(ETH_BASE + MAC_O_DATA) = ulGather;		/* Send any leftover data to the FIFO. */
	HWREG(ETH_BASE + MAC_O_TR) = MAC_TR_NEWTX;		/* Wakeup the transmitter. */
	pbuf_free(p);									/* Dereference the pbuf from the queue. */
	LINK_STATS_INC(link.xmit);
	return ERR_OK;
}

/**
 * This function with either place the packet into the Stellaris transmit fifo,
 * or will place the packet in the interface PBUF Queue for subsequent
 * transmission when the transmitter becomes idle.
 * @param netif the lwip network interface structure for this ethernetif
 * @param p the MAC packet to send (e.g. IP packet including MAC addresses and type)
 * @return ERR_OK if the packet could be sent
 *         an err_t value if the packet couldn't be sent
 *
 */
static err_t low_level_output(struct netif *netif, struct pbuf *p)
{
	struct ethernetif *ethernetif = netif->state;
	SYS_ARCH_DECL_PROTECT(lev);
	/**
	* This entire function must run within a "critical section" to preserve
	* the integrity of the transmit pbuf queue.
	*/
	SYS_ARCH_PROTECT(lev);
	/**
	* Bump the reference count on the pbuf to prevent it from being
	* freed till we are done with it.
	*/
	pbuf_ref(p);
	/**
	* If the transmitter is idle, and there is nothing on the queue,
	* send the pbuf now.
	*/
	if(PBUF_QUEUE_EMPTY(&ethernetif->txq) && ((HWREG(ETH_BASE + MAC_O_TR) & MAC_TR_NEWTX) == 0)) 
	{
		low_level_transmit(netif, p);
	}
	else /* Otherwise place the pbuf on the transmit queue. */
	{
		/* Add to transmit packet queue */
		if(!enqueue_packet(p, &(ethernetif->txq))) 
		{
			/* if no room on the queue, free the pbuf reference and return error. */
			pbuf_free(p);
			SYS_ARCH_UNPROTECT(lev);
			return ERR_MEM;
		}
	}

	/* Return to prior interrupt state and return. */
	SYS_ARCH_UNPROTECT(lev);
	return ERR_OK;
}

/**
 * This function will read a single packet from the Stellaris ethernet
 * interface, if available, and return a pointer to a pbuf.  The timestamp
 * of the packet will be placed into the pbuf structure.
 * @param netif the lwip network interface structure for this ethernetif
 * @return pointer to pbuf packet if available, NULL otherswise.
 */
static struct pbuf* low_level_receive(struct netif *netif)
{
	/* Check if a packet is available, if not, return NULL packet. */
	if((HWREG(ETH_BASE + MAC_O_NP) & MAC_NP_NPR_M)) 
	{
		struct pbuf *p, *q;
		u16_t len;
		uint32_t temp;
		register uint32_t *ptr;
		register uint32_t* macodata = (ETH_BASE + MAC_O_DATA);
		#if LWIP_PTPD
			u32_t time_s, time_ns;
			lwIPHostGetTime(&time_s, &time_ns);	/* Get the current timestamp if PTPD is enabled */
		#endif
		/**
		* Obtain the size of the packet and put it into the "len" variable.
		* Note:  The length returned in the FIFO length position includes the
		* two bytes for the length + the 4 bytes for the FCS.
		*/
		temp = HWREG(ETH_BASE + MAC_O_DATA);
		len = temp & 0xFFFF;

		/* We allocate a pbuf chain of pbufs from the pool. */
		/* If a pbuf was allocated, read the packet into the pbuf. */
		if((p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL)))
		{
			/* Place the first word into the first pbuf location. */
			*(unsigned long *)p->payload = temp;
			p->payload = (char *)(p->payload) + 4;
			p->len -= 4;
			/* Process all but the last buffer in the pbuf chain. */
			q = p;
			while(q) 
			{
				register uint16_t qlen = q->len;
				/* Setup a byte pointer into the payload section of the pbuf. */
				ptr = q->payload;
				/**
				* Read data from FIFO into the current pbuf
				* (assume pbuf length is modulo 4)
				*/
				for(register int i = 0; i < qlen; i += 4) 
					*ptr++ = *macodata;		/* *ptr++ = HWREG(ETH_BASE + MAC_O_DATA); */
				/* Link in the next pbuf in the chain. */
				q = q->next;
			}
			/* Restore the first pbuf parameters to their original values. */
			p->payload = (char *)(p->payload) - 4;
			p->len += 4;
			/* Adjust the link statistics */
			LINK_STATS_INC(link.recv);
			#if LWIP_PTPD
				p->time_s = time_s;				/* Place the timestamp in the PBUF */
				p->time_ns = time_ns;
			#endif
		}
		/* If no pbuf available, just drain the RX fifo. */
		else 
		{
			for(register int i = 4; i < len; i+=4) 
				temp = *macodata; /* HWREG(ETH_BASE + MAC_O_DATA); */
			/* Adjust the link statistics */
			LINK_STATS_INC(link.memerr);
			LINK_STATS_INC(link.drop);
		}
		return p;
	}
	return NULL;
}

/**
 * This function should be called when a packet is ready to be read
 * from the interface. It uses the function low_level_input() that
 * should handle the actual reception of bytes from the network
 * interface. Then the type of the received packet is determined and
 * the appropriate input function is called.
 *
 * @param netif the lwip network interface structure for this ethernetif
 */
void stellarisif_input(void* arg)
{
	struct netif *netif = (struct netif*)arg;
	struct ethernetif *ethernetif;
	struct pbuf *p;

	while(!network_ready) caribou_thread_yield();
	for(;;)
	{
		ethernetif = netif->state;
		/* move received packet into a new pbuf */
		if((p = dequeue_packet(&ethernetif->rxq)) != NULL) 
		{
			/* process the packet. */
			if (ethernet_input(p, netif)!=ERR_OK) 
			{
				LWIP_DEBUGF(NETIF_DEBUG, ("stellarisif_input: input error\n"));
				pbuf_free(p);
				p = NULL;
			}
		}
		else
		{
			caribou_thread_yield();
		}
	}
}

/**
 * Required by lwIP library to support any host-related timer functions.
 */
extern void lwip_host_timer_callback(void)
{
	sys_timeout(10, lwip_host_timer_callback, NULL);
}


void sys_init()
{
	/* Get here when LwIP interface is up */
    caribou_thread_create("eth_io",
							stellarisif_input,
							NULL,
							&netif,
							stellarisif_input_stack,		
							PRODUCT_ETHIF_THREAD_STACKSZ,
							PRODUCT_ETHIF_THREAD_PRIO);
}

/**
 * In this function, the hardware should be initialized.
 * Called from stellarisif_init().
 * @param netif the already initialized lwip network interface structure
 *        for this ethernetif
 */
static void low_level_init(struct netif *netif)
{
	u32_t temp;
	//struct ethernetif *ethernetif = netif->state;
	/* set MAC hardware address length */
	netif->hwaddr_len = ETHARP_HWADDR_LEN;
	/* set MAC hardware address */

	if ( memcmp(&netif->hwaddr,empty_mac,6) == 0 )
	{
		EthernetMACAddrGet(ETH_BASE, &(netif->hwaddr[0]));
	}
	else
	{
		EthernetMACAddrSet(ETH_BASE, &(netif->hwaddr[0]));
	}

	/** Enable Port F for Ethernet LEDs.
	 *	LED0        Bit 3   Output
	 *	LED1        Bit 2   Output
	 */
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
	GPIOPinTypeEthernetLED(GPIO_PORTF_BASE, GPIO_PIN_2 | GPIO_PIN_3);

	/* maximum transfer unit */
	netif->mtu = 1500;
	/* device capabilities */
	/* don't set NETIF_FLAG_ETHARP if this device is not an ethernet one */
	netif->flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_LINK_UP;
	/* Do whatever else is needed to initialize interface. */
	/* Disable all Ethernet Interrupts. */
	EthernetIntDisable(ETH_BASE, (ETH_INT_PHY | ETH_INT_MDIO | ETH_INT_RXER |
	ETH_INT_RXOF | ETH_INT_TX | ETH_INT_TXER | ETH_INT_RX));
	temp = EthernetIntStatus(ETH_BASE, false);
	EthernetIntClear(ETH_BASE, temp);
	/* Initialize the Ethernet Controller. */
	EthernetInitExpClk(ETH_BASE, SysCtlClockGet());
	/*
	* Configure the Ethernet Controller for normal operation.
	* - Enable TX Duplex Mode
	* - Enable TX Padding
	* - Enable TX CRC Generation
	* - Enable RX Multicast Reception
	*/
	EthernetConfigSet(ETH_BASE, (ETH_CFG_TX_DPLXEN |ETH_CFG_TX_CRCEN |
	ETH_CFG_TX_PADEN | ETH_CFG_RX_AMULEN));
	/* Enable the Ethernet Controller transmitter and receiver. */
	EthernetEnable(ETH_BASE);

	/* Install the interrupt handler */
	caribou_vector_install(INT_ETH,ethernet_isr,netif);

	/* Enable the Ethernet Interrupt handler. */
	//IntEnable(INT_ETH);
	/* Enable Ethernet TX and RX Packet Interrupts. */
	EthernetIntEnable(ETH_BASE, ETH_INT_RX | ETH_INT_TX);
}

/**
 * Should be called at the beginning of the program to set up the
 * network interface. It calls the function low_level_init() to do the
 * actual setup of the hardware.
 *
 * This function should be passed as a parameter to netif_add().
 *
 * @param netif the lwip network interface structure for this ethernetif
 * @return ERR_OK if the loopif is initialized
 *         ERR_MEM if private data couldn't be allocated
 *         any other err_t on error
 */
err_t stellarisif_init(struct netif *netif)
{
	LWIP_ASSERT("netif != NULL", (netif != NULL));

#if LWIP_NETIF_HOSTNAME
	/* Initialize interface hostname */
	netif->hostname = "ctx";
#endif /* LWIP_NETIF_HOSTNAME */

	/*
	* Initialize the snmp variables and counters inside the struct netif.
	* The last argument should be replaced with your link speed, in units
	* of bits per second.
	*/
	NETIF_INIT_SNMP(netif, snmp_ifType_ethernet_csmacd, 1000000);

	netif->state = &ethernetif_data;
	netif->name[0] = IFNAME0;
	netif->name[1] = IFNAME1;
	/* We directly use etharp_output() here to save a function call.
	* You can instead declare your own function an call etharp_output()
	* from it if you have to do some checks before sending (e.g. if link
	* is available...) */
	netif->output = etharp_output;
	netif->linkoutput = low_level_output;

	ethernetif_data.ethaddr = (struct eth_addr *)&(netif->hwaddr[0]);
	ethernetif_data.txq.qread = ethernetif_data.txq.qwrite = 0;
	ethernetif_data.txq.overflow = 0;
	ethernetif_data.rxq.qread = ethernetif_data.rxq.qwrite = 0;
	ethernetif_data.rxq.overflow = 0;

	/* initialize the hardware */
	low_level_init(netif);

	return ERR_OK;
}

/**
 * Join multicast group.
 */
static void multicast_init(struct netif *netif,uint8_t ip_addr[])
{
	#if LWIP_IGMP
		struct ip_addr addp_addr;
		addp_addr.addr = htonl(STATIC_ADDRESS(224,0,5,128));
		netif->flags |= NETIF_FLAG_IGMP;
		igmp_start( netif );
		if ( igmp_joingroup(&ip_addr,&addp_addr) != 0 )
		{
			perror("lgmp_joingroup");
		}
	#endif
	
	while ( netif->ip_addr.addr == (uint32_t)0 )	/* wait for the interface address to come up */
		caribou_thread_yield();
}

/**
 * Application level call to initialize network.
 */
void network_init(struct netif *netif, 
						uint8_t mac_addr[],
						uint8_t ip_addr[],
						uint8_t net_mask[],
						uint8_t gw_addr[],
                        bool dhcp_enabled,
						bool autoip_enabled)
{
	memset(netif,0,sizeof(struct netif));
	memcpy(netif->hwaddr,mac_addr,6);
	//lwip_init();
	//stellarisif_init(netif);		/* initialize the hardware */
	tcpip_init(NULL, NULL);			/* Start the TCP/IP thread & init stuff */
	netif_add(netif, ip_addr, net_mask, gw_addr, NULL, stellarisif_init, tcpip_input);
    netif_set_default(netif);		/* Make this the default interface */
    netif_set_up(netif);			/* Bring up this interface */
#if LWIP_SOCKET
    lwip_socket_init();				/* Initialize the socket interface */
#endif
	if ( dhcp_enabled )				/* Start DHCP? */
		dhcp_start(netif);		
	#if LWIP_AUTOIP
		if ( autoip_enabled )			/* Start AutoIP */
			autoip_start(netif);
	#endif
	multicast_init(netif,ip_addr);	/* Join the multicast group */
    IntEnable(INT_ETH);
}

static void ethernet_isr(InterruptVector vector,void* arg)
{
	struct netif *netif = (struct netif *)arg;
	struct ethernetif *ethernetif = netif->state;
	struct pbuf *p;
    uint32_t status = HWREG(ETH_BASE + MAC_O_RIS);	/* fetch the status bits */

	/**
	* Process the transmit and receive queues as long as there is receive
	* data available
	*/
	p = low_level_receive(netif);
	while(p != NULL) 
	{
		/* Add the rx packet to the rx queue */
		if(!enqueue_packet(p, &ethernetif->rxq)) 
		{
			/* Could not place the packet on the queue, bail out. */
			pbuf_free(p);
			break;
		}

		/* Check if TX fifo is empty and packet available */
		if( !(HWREG(ETH_BASE + MAC_O_TR) & MAC_TR_NEWTX) && (p = dequeue_packet(&ethernetif->txq)) )
			low_level_transmit(netif, p);

		/* Read another packet from the RX fifo */
		p = low_level_receive(netif);
	}

	/* One more check of the transmit queue/fifo */
	if( !(HWREG(ETH_BASE + MAC_O_TR) & MAC_TR_NEWTX) && (p = dequeue_packet(&ethernetif->txq)) )
			low_level_transmit(netif, p);

    HWREG(ETH_BASE + MAC_O_IACK) = status;			/* clear the status bits */
}

#if NETIF_DEBUG
/* Print an IP header by using LWIP_DEBUGF
 * @param p an IP packet, p->payload pointing to the IP header
 */
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
