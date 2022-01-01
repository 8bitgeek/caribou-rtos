/*****************************************************************************
* Copyright (c) 2017 by Pike Aerospace Research Corp.                        *
* All Rights Reserved                                                        *
*****************************************************************************/
#include <board.h>
#include <netif/ethernetif.h>
#include <caribou/kernel/thread.h>
#include <caribou/kernel/types.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <caribou/lib/mutex.h>
#include <lwip/opt.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/sys.h>
#include <netif/etharp.h>
#include <netif/enc28j60.h>

static void     _isr_rx			(struct netif *netif);
static void     _isr_txerr		(struct netif *netif);
static void     _isr_rxerr		(struct netif *netif);
static void     _isr_tx			(struct netif *netif);
static void     _isr_link		(struct netif *netif);
static void     _isr_dma		(struct netif *netif);

static uint32_t _ethernet_isr		(struct netif* netif);
static void     ethernetif_input	(void* arg);
static err_t    low_level_output	(struct netif *netif, struct pbuf *p);

CARIBOU_MUTEX_DECL_F(enc28j60_mutex,CARIBOU_MUTEX_F_RECURSIVE);

static caribou_thread_t* 	ethif_thread=NULL;
static uint32_t 			ethif_stack[PRODUCT_ETHIF_THREAD_STK_SZ/sizeof(uint32_t)];
static uint8_t 			xferbuffer[ENC28J60_MAX_PACKET];

// #pragma GCC push_options
// #pragma GCC optimize ("Os")

/** 
 * @brief Reverse bytes order 
 * @param x Out of order bytes.
 * @return Ordered bytes.
 */
uint16_t __attribute__((naked)) LWIP_PLATFORM_HTONS(uint16_t x)
{
 __asm(" rev16  r0,r0\n"
       " bx     lr\n");
}

/** 
 * @brief Reverse byte order 
 * @param x Out of order bytes.
 * @return Ordered bytes.
 */
uint32_t __attribute__((naked)) LWIP_PLATFORM_HTONL(uint32_t x)
{
 __asm(" rev   r0,r0\n"
       " bx    lr\n");
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
err_t ethernetif_init(struct netif *netif)
{
	#if LWIP_NETIF_HOSTNAME
		/* Initialize interface hostname */
		netif->hostname = board_get_hostname();
	#endif /* LWIP_NETIF_HOSTNAME */

	enc28j60_reset();					// hardware reset.

	/*
	* Initialize the snmp variables and counters inside the struct netif.
	* The last argument should be replaced with your link speed, in units
	* of bits per second.
	*/
	// NETIF_INIT_SNMP(netif, snmp_ifType_ethernet_csmacd, 10000000);

	netif->flags |= NETIF_FLAG_ETHARP | 
					NETIF_FLAG_BROADCAST | 
					NETIF_FLAG_LINK_UP |
					NETIF_FLAG_IGMP;
	netif->output = etharp_output;
	netif->linkoutput = low_level_output;

	/* initialize the hardware */
    
	caribou_mutex_lock(&enc28j60_mutex,0);
	enc28j60_init(&netif->hwaddr[0]);
	enc28j60_interrupt_enable(EIE_INTIE|EIE_PKTIE|EIE_TXIE|EIE_LINKIE|EIE_TXERIE||EIE_RXERIE);
	caribou_mutex_unlock(&enc28j60_mutex);

	etharp_init();

	ethif_thread = caribou_thread_create("ethinput",
								ethernetif_input,
								NULL,
								netif,
								ethif_stack,
								PRODUCT_ETHIF_THREAD_STK_SZ,
								PRODUCT_ETHIF_THREAD_PRIO,PRODUCT_ETHIN_WD_COUNT);

	return ERR_OK;
}

/**
 * This function should do the actual transmission of the packet. The packet is
 * contained in the pbuf that is passed to the function. This pbuf
 * might be chained.
 *
 * @param netif the lwip network interface structure for this ethernetif
 * @param p the MAC packet to send (e.g. IP packet including MAC addresses and type)
 * @return ERR_OK if the packet could be sent
 *         an err_t value if the packet couldn't be sent
 *
 * @note Returning ERR_MEM here if a DMA queue of your MAC is full can lead to
 *       strange results. You might consider waiting for space in the DMA queue
 *       to become availale since the stack doesn't retry to send a packet
 *       dropped because of memory failure (except for the TCP timers).
 */
static err_t low_level_output(struct netif *netif, struct pbuf *p)
{
	struct pbuf *q;
	size_t len=0;
	caribou_mutex_lock(&enc28j60_mutex,0);
	#if ETH_PAD_SIZE
		pbuf_header(p, -ETH_PAD_SIZE); /* drop the padding word */
	#endif

	/* Calculate the total length to send... */
	for(q = p; q != NULL; q = q->next) 
	{
		len += q->len;
	}

	/* If length <= xfer buffer size, then consolodate into a single xfer buffer... */
	if ( len <= ENC28J60_MAX_PACKET )
	{
		int n=0;
		for(q = p; q != NULL; q = q->next) 
		{
			memcpy(&xferbuffer[n],q->payload,q->len);
			n+=q->len;
		}
		enc28j60_send_packet(xferbuffer, len);
	}
	/* ...else send each pbuf in sequence... */
	else
	{
		for(q = p; q != NULL; q = q->next) 
		{
			enc28j60_send_packet(q->payload, q->len);
		}
	}

	#if ETH_PAD_SIZE
		pbuf_header(p, ETH_PAD_SIZE); /* reclaim the padding word */
	#endif
	caribou_mutex_unlock(&enc28j60_mutex);
    LINK_STATS_INC(link.xmit);
	return ERR_OK;
}

/**
 * Should allocate a pbuf and transfer the bytes of the incoming
 * packet from the interface into the pbuf.
 *
 * @param netif the lwip network interface structure for this ethernetif
 * @return a pbuf filled with the received packet (including MAC header)
 *         NULL on memory error
 */
static struct pbuf* low_level_input(struct netif *netif)
{
	struct pbuf* p = NULL;
	struct pbuf* q;
	uint32_t l=0;
	uint16_t len;
	if ( (len = enc28j60_recv_packet(xferbuffer,ENC28J60_MAX_PACKET)) > 0 )
	{
		p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);
		/* Copy received frame from ethernet driver buffer to stack buffer */
		if (p != NULL)
		{ 
			#if ETH_PAD_SIZE
				pbuf_header(p, -ETH_PAD_SIZE); /* drop the padding word */
			#endif
			for (q = p; q != NULL; q = q->next)
			{
				memcpy((uint8_t*)q->payload, (uint8_t*)&xferbuffer[l], q->len);
				l += q->len;
			} 
			#if ETH_PAD_SIZE
				pbuf_header(p, ETH_PAD_SIZE); /* reclaim the padding word */
			#endif
			LINK_STATS_INC(link.recv);
		}
		else
		{
			LINK_STATS_INC(link.memerr);
			LINK_STATS_INC(link.drop);		
		}
	}
	return p;
}

/**
 * @brief Interrupt service - Receive Data
 */
static void _isr_rx(struct netif *netif)
{
	struct pbuf *p;  
	if ( (p = low_level_input( netif )) != NULL )
	{
		/* points to packet payload, which starts with an Ethernet header */
        struct eth_hdr *ethhdr = (struct eth_hdr *)p->payload;
		switch(lwip_htons(ethhdr->type))
		{
			#if PPPOE_SUPPORT 
				case ETHTYPE_PPPOEDISC: 
				case ETHTYPE_PPPOE: 
			#endif /* PPPOE_SUPPORT */
			case ETHTYPE_IP: 
			case ETHTYPE_ARP: 
				/* full packet send to tcpip_thread to process */ 
				if (ERR_OK != netif->input( p, netif))
				{
					LWIP_DEBUGF(NETIF_DEBUG,("ethernetif: IP input error\n")); 
					pbuf_free(p);
					p=NULL;
				}
				break;
			default:
				/* Return buffer */ 
                pbuf_free(p); 
                p=NULL; 
                break; 
		}
	}
}

/**
 * @brief Interrupt Service - DMA Copy or Checksum has completed
 */
static void _isr_dma(struct netif *netif)
{
	enc28j60_set_bank(EIR);
	enc28j60_write_op(ENC28J60_SPI_BFC, EIR, EIR_DMAIF);
}

/**
 * @brief Interrupt Service - Handle the link state change condition
 */
static void _isr_link(struct netif *netif)
{
	#if 0
		board_reset();
	#else
		enc28j60_check_link_status();
		/* read PHIR to clear the flag */
		enc28j60_read_phy(PHIR);
		enc28j60_set_bank(EIR);
		enc28j60_write_op(ENC28J60_SPI_BFC, EIR, EIR_LINKIF);
	#endif
}

/**
 * @brief Interrupt Service - Handle frame has been transmitted.
 */
static void _isr_tx(struct netif *netif)
{
	/* A frame has been transmitted. */
	enc28j60_set_bank(EIR);
	enc28j60_write_op(ENC28J60_SPI_BFC, EIR, EIR_TXIF);
}

/**
 * @brief Interrupt Service - Handle receiver error condition.
 */
static void _isr_rxerr(struct netif *netif)
{
	_isr_rx(netif); /* Empty the receive buffer */
	enc28j60_set_bank(EIR);
	enc28j60_write_op(ENC28J60_SPI_BFC, EIR, EIR_RXERIF);
    LINK_STATS_INC(link.err);
}

/**
 * @brief Interrupt Service - Handle transmitter error condition.
 */
static void _isr_txerr(struct netif *netif)
{
	enc28j60_set_bank(ECON1);
	enc28j60_write_op(ENC28J60_SPI_BFS, ECON1, ECON1_TXRST);
	enc28j60_write_op(ENC28J60_SPI_BFC, ECON1, ECON1_TXRST);
	enc28j60_set_bank(EIR);
	enc28j60_write_op(ENC28J60_SPI_BFC, EIR, EIR_TXERIF);
    LINK_STATS_INC(link.err);
}

/**
 * @brief Handle ENC28J60 Interrupt conditions.
 */
static uint32_t _ethernet_isr(struct netif *netif)
{
	uint32_t eir = enc28j60_rcr(EIR);
	
	/**
	 * ENC28J60 Silicon bug work around
     * The Receive Packet Pending Interrupt Flag
	 * (EIR.PKTIF) does not reliably/accurately report
	 * the status of pending packets. 
	 */
	if ( !caribou_gpio_pinstate(&gpio_enc28j60_int) )
	{
		eir |= EIR_PKTIF;
	}

	if ( eir != 0 )
	{
		// caribou_gpio_write( &gpio_status, 1 );
		if ( (eir & EIR_PKTIF)	!= 0 )  _isr_rx   (netif);	/* Handle RX data packet */
		if ( (eir & EIR_DMAIF)	!= 0 )  _isr_dma  (netif);	/* Clear the DMAIF flag */
		if ( (eir & EIR_LINKIF) != 0 )	_isr_link (netif);	/* LINK changed handler */
		if ( (eir & EIR_TXIF)	!= 0 )	_isr_tx   (netif);	/* A frame has been transmitted */
		if ( (eir & EIR_RXERIF)	!= 0 )	_isr_rxerr(netif);	/* RX Error handler */
		if ( (eir & EIR_TXERIF)	!= 0 )	_isr_txerr(netif);	/* TX Error handler */			
		// caribou_gpio_write( &gpio_status, 0 );
	}
	return eir;
} 

/**
 * This function is the ethernetif_input task, it is processed when a packet 
 * is ready to be read from the interface. It uses the function low_level_input() 
 * that should handle the actual reception of bytes from the network
 * interface. Then the type of the received packet is determined and
 * the appropriate input function is called.
 *
 * @param netif the lwip network interface structure for this ethernetif
 */
void ethernetif_input( void * arg )
{
	struct netif *netif = (struct netif *)arg;
	for( ;; )
	{
		caribou_mutex_lock(&enc28j60_mutex,0);
		_ethernet_isr(netif);
		caribou_mutex_unlock(&enc28j60_mutex);
		caribou_thread_yield();
		caribou_thread_watchdog_feed_self();
	}
}  

// #pragma GCC pop_options
