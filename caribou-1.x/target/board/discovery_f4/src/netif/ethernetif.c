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
#include <lwip/ip_frag.h>
#include <lwip/dhcp.h>
#include <netif/etharp.h>
#include <stm32f4x7_eth.h>
#include <stm32f4xx_exti.h>

#define	netifTHREAD_QUEUE_DEPTH				(20)
#define	netifSEM_INITIAL_COUNT				(0)
#define netifMTU                            (1500)
#define netifINTERFACE_TASK_STACK_SIZE		(1024)
#define netifGUARD_BLOCK_TIME				(100)
#define emacBLOCK_TIME_WAITING_FOR_INPUT	(100)

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

	/* Initialize MAC address in Ethernet MAC */ 
	ETH_MACAddressConfig(ETH_MAC_Address0, netif->hwaddr); 

	/* Initialize Tx Descriptors list: Chain Mode */
	ETH_DMATxDescChainInit(DMATxDscrTab, &Tx_Buff[0][0], ETH_TXBUFNB);
	/* Initialize Rx Descriptors list: Chain Mode  */
	ETH_DMARxDescChainInit(DMARxDscrTab, &Rx_Buff[0][0], ETH_RXBUFNB);

	/* Enable Ethernet Rx interrupt */
	for(i=0; i<ETH_RXBUFNB; i++)
	{
		ETH_DMARxDescReceiveITConfig(&DMARxDscrTab[i], ENABLE);
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
								0);
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
	u8 *buffer ;
	__IO ETH_DMADESCTypeDef *DmaTxDesc;
	uint16_t framelength = 0;
	uint32_t bufferoffset = 0;
	uint32_t byteslefttocopy = 0;
	uint32_t payloadoffset = 0;

	if( caribou_semaphore_wait(&ethOutputSemaphore,netifGUARD_BLOCK_TIME) )
	{
		DmaTxDesc = DMATxDescToSet;
		buffer = (u8 *)(DmaTxDesc->Buffer1Addr);
		bufferoffset = 0;
		for(q = p; q != NULL; q = q->next) 
		{
			if((DmaTxDesc->Status & ETH_DMATxDesc_OWN) != (u32)RESET)
			{
				/* Give semaphore and exit */
				caribou_semaphore_signal( &ethOutputSemaphore );
				return ERR_OK;			
			}
			/* Get bytes in current lwIP buffer  */
			byteslefttocopy = q->len;
			payloadoffset = 0;
			/* Check if the length of data to copy is bigger than Tx buffer size*/
			while( (byteslefttocopy + bufferoffset) > ETH_TX_BUF_SIZE )
			{
				/* Copy data to Tx buffer*/
				memcpy( (u8_t*)((u8_t*)buffer + bufferoffset), (u8_t*)((u8_t*)q->payload + payloadoffset), (ETH_TX_BUF_SIZE - bufferoffset) );
				/* Point to next descriptor */
				DmaTxDesc = (ETH_DMADESCTypeDef *)(DmaTxDesc->Buffer2NextDescAddr);
				/* Check if the buffer is available */
				if((DmaTxDesc->Status & ETH_DMATxDesc_OWN) != (u32)RESET)
				{
					/* Give semaphore and exit */
					caribou_semaphore_signal( &ethOutputSemaphore );
					return ERR_OK;			
				}
				buffer = (u8 *)(DmaTxDesc->Buffer1Addr);
				byteslefttocopy = byteslefttocopy - (ETH_TX_BUF_SIZE - bufferoffset);
				payloadoffset = payloadoffset + (ETH_TX_BUF_SIZE - bufferoffset);
				framelength = framelength + (ETH_TX_BUF_SIZE - bufferoffset);
				bufferoffset = 0;
			}
			/* Copy the remaining bytes */
			memcpy( (u8_t*)((u8_t*)buffer + bufferoffset), (u8_t*)((u8_t*)q->payload + payloadoffset), byteslefttocopy );
			bufferoffset = bufferoffset + byteslefttocopy;
			framelength = framelength + byteslefttocopy;
		}
		/* Prepare transmit descriptors to give to DMA*/
		ETH_Prepare_Transmit_Descriptors(framelength);
		/* Give semaphore and exit */
		caribou_semaphore_signal( &ethOutputSemaphore );
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
	struct pbuf *p= NULL, *q;
	u32_t len;
	FrameTypeDef frame;
	u8 *buffer;
	__IO ETH_DMADESCTypeDef *DMARxDesc;
	uint32_t bufferoffset = 0;
	uint32_t payloadoffset = 0;
	uint32_t byteslefttocopy = 0;
	uint32_t i=0;  

	/* get received frame */
	frame = ETH_Get_Received_Frame_interrupt();

	/* Obtain the size of the packet and put it into the "len" variable. */
	len = frame.length;
	buffer = (u8 *)frame.buffer;

	if (len > 0)
	{
		/* We allocate a pbuf chain of pbufs from the Lwip buffer pool */
		p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);
	}

	if (p != NULL)
	{
		DMARxDesc = frame.descriptor;
		bufferoffset = 0;
		for(q = p; q != NULL; q = q->next)
		{
			byteslefttocopy = q->len;
			payloadoffset = 0;

			/* Check if the length of bytes to copy in current pbuf is bigger than Rx buffer size*/
			while( (byteslefttocopy + bufferoffset) > ETH_RX_BUF_SIZE )
			{
				/* Copy data to pbuf*/
				memcpy( (u8_t*)((u8_t*)q->payload + payloadoffset), (u8_t*)((u8_t*)buffer + bufferoffset), (ETH_RX_BUF_SIZE - bufferoffset));

				/* Point to next descriptor */
				DMARxDesc = (ETH_DMADESCTypeDef *)(DMARxDesc->Buffer2NextDescAddr);
				buffer = (unsigned char *)(DMARxDesc->Buffer1Addr);

				byteslefttocopy = byteslefttocopy - (ETH_RX_BUF_SIZE - bufferoffset);
				payloadoffset = payloadoffset + (ETH_RX_BUF_SIZE - bufferoffset);
				bufferoffset = 0;
			}

			/* Copy remaining data in pbuf */
			memcpy( (u8_t*)((u8_t*)q->payload + payloadoffset), (u8_t*)((u8_t*)buffer + bufferoffset), byteslefttocopy);
			bufferoffset = bufferoffset + byteslefttocopy;
		}

		/* Release descriptors to DMA */
		DMARxDesc =frame.descriptor;

		/* Set Own bit in Rx descriptors: gives the buffers back to DMA */
		for (i=0; i<DMA_RX_FRAME_infos->Seg_Count; i++)
		{  
			DMARxDesc->Status = ETH_DMARxDesc_OWN;
			DMARxDesc = (ETH_DMADESCTypeDef *)(DMARxDesc->Buffer2NextDescAddr);
		}

		/* Clear Segment_Count */
		DMA_RX_FRAME_infos->Seg_Count =0;
		/* added for test*/
	}

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
		if (caribou_semaphore_wait(&ethInputSemaphore,emacBLOCK_TIME_WAITING_FOR_INPUT) )
		{
			do
			{
				p = low_level_input( s_pxNetIf );
				if (p != NULL)
				{
					if (ERR_OK != s_pxNetIf->input( p, s_pxNetIf))
					{
						pbuf_free(p);
						break;
					}
				}
			} while(p);
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

	//memcpy(&netif->name,CARIBOU_IF_NAME,2);

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
	}
}

extern void isr_eth0(InterruptVector vector, void* arg)
{
	/* Frame received */
	if ( ETH->DMASR & ETH_DMA_FLAG_R ) 
	{
		/* Give the semaphore to wakeup LwIP task */
		caribou_semaphore_signal( &ethInputSemaphore );
	}
	/* Clear the interrupt flags. */	
	ETH->DMASR = (ETH_DMA_IT_NIS | ETH_DMA_IT_R);	
}

