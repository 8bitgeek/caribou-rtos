/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
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
#include <board.h>
#include <netif/ethernetif.h>
#include <caribou/kernel/types.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/string.h>
#include <caribou/lib/semaphore.h>
#include <lwip/opt.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/sys.h>
#include <netif/etharp.h>
#include <stm32f4x7_eth.h>
#include <stm32f4xx_exti.h>

#define	netifTHREAD_QUEUE_DEPTH				(20)
#define	netifSEM_INITIAL_COUNT				(0)
#define netifMTU                            (1500)
#define netifINTERFACE_TASK_STACK_SIZE		(1024)
#define netifGUARD_BLOCK_TIME				(250)
/* The time to block waiting for input. */
#define emacBLOCK_TIME_WAITING_FOR_INPUT	((portTickType)100)

/* Define those to better describe your network interface. */
#define IFNAME0 's'
#define IFNAME1 't'

static struct netif *s_pxNetIf = NULL;
DECL_CARIBOU_SEMAPHORE( ethInputSemaphore, netifTHREAD_QUEUE_DEPTH, netifSEM_INITIAL_COUNT );
DECL_CARIBOU_BINARY_SEMAPHORE(ethOutputSemaphore);

/* Ethernet Rx & Tx DMA Descriptors */
extern ETH_DMADESCTypeDef  DMARxDscrTab[ETH_RXBUFNB], DMATxDscrTab[ETH_TXBUFNB];

/* Ethernet Receive buffers  */
extern uint8_t Rx_Buff[ETH_RXBUFNB][ETH_RX_BUF_SIZE]; 

/* Ethernet Transmit buffers */
extern uint8_t Tx_Buff[ETH_TXBUFNB][ETH_TX_BUF_SIZE]; 

/* Global pointers to track current transmit and receive descriptors */
extern ETH_DMADESCTypeDef  *DMATxDescToSet;
extern ETH_DMADESCTypeDef  *DMARxDescToGet;

/* Global pointer for last received frame infos */
extern ETH_DMA_Rx_Frame_infos *DMA_RX_FRAME_infos;

static void ethernetif_input( void * pvParameters );
static void arp_timer(void *arg);

/**
 * In this function, the hardware should be initialized.
 * Called from ethernetif_init().
 *
 * @param netif the already initialized lwip network interface structure
 *        for this ethernetif
 */
static void low_level_init(struct netif *netif)
{
	uint32_t i;

	/* set netif MAC hardware address length */
	netif->hwaddr_len = ETHARP_HWADDR_LEN;

	/* set netif MAC hardware address */
	netif->hwaddr[0] =  MAC_ADDR0;
	netif->hwaddr[1] =  MAC_ADDR1;
	netif->hwaddr[2] =  MAC_ADDR2;
	netif->hwaddr[3] =  MAC_ADDR3;
	netif->hwaddr[4] =  MAC_ADDR4;
	netif->hwaddr[5] =  MAC_ADDR5;

	/* set netif maximum transfer unit */
	netif->mtu = 1500;

	/* Accept broadcast address and ARP traffic */
	netif->flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP;

	s_pxNetIf =netif;

	/* initialize MAC address in ethernet MAC */ 
	ETH_MACAddressConfig(ETH_MAC_Address0, netif->hwaddr); 

	/* Initialize Tx Descriptors list: Chain Mode */
	ETH_DMATxDescChainInit(DMATxDscrTab, &Tx_Buff[0][0], ETH_TXBUFNB);
	/* Initialize Rx Descriptors list: Chain Mode  */
	ETH_DMARxDescChainInit(DMARxDscrTab, &Rx_Buff[0][0], ETH_RXBUFNB);

	/* Enable Ethernet Rx interrrupt */
	{ 
		for(i=0; i<ETH_RXBUFNB; i++)
		{
			ETH_DMARxDescReceiveITConfig(&DMARxDscrTab[i], ENABLE);
		}
	}

	#ifdef CHECKSUM_BY_HARDWARE
	/* Enable the checksum insertion for the Tx frames */
	{
		for(i=0; i<ETH_TXBUFNB; i++)
		{
			ETH_DMATxDescChecksumInsertionConfig(&DMATxDscrTab[i], ETH_DMATxDesc_ChecksumTCPUDPICMPFull);
		}
	} 
	#endif
  
	/* create the task that handles the ETH_MAC */
	caribou_thread_t* thread = caribou_thread_create("ethif",
								ethernetif_input,
								NULL,
								NULL,
								malloc(netifINTERFACE_TASK_STACK_SIZE),
								netifINTERFACE_TASK_STACK_SIZE,
								1);
	if ( thread )
	{
		/* Enable MAC and DMA transmission and reception */
		ETH_Start();
	}
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
	uint32_t l = 0;
	u8 *buffer ;

	if (caribou_semaphore_wait(&ethOutputSemaphore, netifGUARD_BLOCK_TIME))
	{
		buffer =  (u8 *)(DMATxDescToSet->Buffer1Addr);
		for(q = p; q != NULL; q = q->next) 
		{
			memcpy((u8_t*)&buffer[l], q->payload, q->len);
			l = l + q->len;
		}
		ETH_Prepare_Transmit_Descriptors(l);
		caribou_semaphore_signal(&ethOutputSemaphore);
	}

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
static struct pbuf * low_level_input(struct netif *netif)
{
	struct pbuf *p, *q;
	u16_t len;
	uint32_t l=0,i =0;
	FrameTypeDef frame;
	u8 *buffer;
	__IO ETH_DMADESCTypeDef *DMARxNextDesc;

	p = NULL;

	/* Get received frame */
	frame = ETH_Get_Received_Frame_interrupt();

	/* check that frame has no error */
	if ((frame.descriptor->Status & ETH_DMARxDesc_ES) == (uint32_t)RESET)
	{
		/* Obtain the size of the packet and put it into the "len" variable. */
		len = frame.length;
		buffer = (u8 *)frame.buffer;
		/* We allocate a pbuf chain of pbufs from the pool. */
		p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);
		/* Copy received frame from ethernet driver buffer to stack buffer */
		if (p != NULL)
		{ 
			for (q = p; q != NULL; q = q->next)
			{
				memcpy((u8_t*)q->payload, (u8_t*)&buffer[l], q->len);
				l = l + q->len;
			} 
		}
	}
  
	/* Release descriptors to DMA */
	/* Check if received frame with multiple DMA buffer segments */
	if (DMA_RX_FRAME_infos->Seg_Count > 1)
	{
		DMARxNextDesc = DMA_RX_FRAME_infos->FS_Rx_Desc;
	}
	else
	{
		DMARxNextDesc = frame.descriptor;
	}

	/* Set Own bit in Rx descriptors: gives the buffers back to DMA */
	for (i=0; i<DMA_RX_FRAME_infos->Seg_Count; i++)
	{  
		DMARxNextDesc->Status = ETH_DMARxDesc_OWN;
		DMARxNextDesc = (ETH_DMADESCTypeDef *)(DMARxNextDesc->Buffer2NextDescAddr);
	}

	/* Clear Segment_Count */
	DMA_RX_FRAME_infos->Seg_Count =0;
	/* When Rx Buffer unavailable flag is set: clear it and resume reception */
	if ((ETH->DMASR & ETH_DMASR_RBUS) != (u32)RESET)  
	{
		/* Clear RBUS ETHERNET DMA flag */
		ETH->DMASR = ETH_DMASR_RBUS;
		/* Resume DMA reception */
		ETH->DMARPDR = 0;
	}
	return p;
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
void ethernetif_input( void * pvParameters )
{
  struct pbuf *p;
  
	for( ;; )
	{
		if (caribou_semaphore_wait(&ethInputSemaphore, netifGUARD_BLOCK_TIME))
		{
			do
			{
				p = low_level_input( s_pxNetIf );
				if (ERR_OK != s_pxNetIf->input( p, s_pxNetIf))
				{
					pbuf_free(p);
					p=NULL;
				}
				caribou_thread_yield();
			} while (p);
		}
	}
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
	LWIP_ASSERT("netif != NULL", (netif != NULL));

	#if LWIP_NETIF_HOSTNAME
	/* Initialize interface hostname */
	netif->hostname = "lwip";
	#endif /* LWIP_NETIF_HOSTNAME */

	netif->name[0] = IFNAME0;
	netif->name[1] = IFNAME1;

	netif->output = etharp_output;
	netif->linkoutput = low_level_output;

	/* initialize the hardware */
	low_level_init(netif);

	etharp_init();
	sys_timeout(ARP_TMR_INTERVAL, arp_timer, NULL);

	return ERR_OK;
}

static void arp_timer(void *arg)
{
	etharp_tmr();
	sys_timeout(ARP_TMR_INTERVAL, arp_timer, NULL);
}

extern void isr_phy_eth0(InterruptVector vector, void* arg)
{
	uint16_t phyAddress = *(uint16_t*)arg;
    EXTI->PR = ETH_LINK_EXTI_LINE;
	/* Check whether the link interrupt has occurred or not */
	if(((ETH_ReadPHYRegister(phyAddress, PHY_MISR)) & PHY_LINK_STATUS) != 0)
	{
		network_interface.ethLinkStatus = ~network_interface.ethLinkStatus;
		if(network_interface.ethLinkStatus != 0)
		{
			printf("Network Cable is unplugged\n");
		}
		else
		{
			printf("Network Cable is now connected\n");
		}
	}
}

extern void isr_eth0(InterruptVector vector, void* arg)
{
	/* Frame received */
	if ( ETH->DMASR & ETH_DMA_FLAG_R ) 
	{
		caribou_gpio_toggle(&LED1);
		/* Give the semaphore to wakeup LwIP task */
		caribou_semaphore_signal( &ethInputSemaphore );   
	}

	/* Clear the interrupt flags. */	
	ETH->DMASR = (ETH_DMA_IT_R | ETH_DMA_IT_NIS);	/* Clear the Eth DMA Rx IT pending bits */
}

