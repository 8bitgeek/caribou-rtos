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
#include <lwip/tcpip.h>
#include <netif/etharp.h>
#include <stm32f7xx_hal_conf.h>
#include <stm32f7xx_hal_eth.h>
#include <stm32f7xx_hal_gpio.h>

//#define RBUS_FIX	1

#define TIME_WAITING_FOR_INPUT                 ( 100 )
/* Stack size of the interface thread */
#define INTERFACE_THREAD_STACK_SIZE            ( 350 )

/* Define those to better describe your network interface. */
#define IFNAME0 's'
#define IFNAME1 't'

static struct netif *s_pxNetIf = NULL;
static int ethInputCount=0;
DECL_CARIBOU_BINARY_SEMAPHORE(ethOutputSemaphore);
//DECL_CARIBOU_SEMAPHORE( ethInputSemaphore, netifTHREAD_QUEUE_DEPTH, netifSEM_INITIAL_COUNT );


ETH_DMADescTypeDef  DMARxDscrTab[ETH_RXBUFNB] __attribute__((section(".RxDecripSection")));/* Ethernet Rx MA Descriptor */

ETH_DMADescTypeDef  DMATxDscrTab[ETH_TXBUFNB] __attribute__((section(".TxDescripSection")));/* Ethernet Tx DMA Descriptor */

uint8_t Rx_Buff[ETH_RXBUFNB][ETH_RX_BUF_SIZE] __attribute__((section(".RxarraySection"))); /* Ethernet Receive Buffer */

uint8_t Tx_Buff[ETH_TXBUFNB][ETH_TX_BUF_SIZE] __attribute__((section(".TxarraySection"))); /* Ethernet Transmit Buffer */

/* Global Ethernet handle*/
static ETH_HandleTypeDef EthHandle;

bool link_active=false;
extern int __lwip_core_lock__=false;

extern "C" void ethernetif_input( void * pvParameters );
extern "C" void arp_timer(void *arg);

/**
 * In this function, the hardware should be initialized.
 * Called from ethernetif_init().
 *
 * @param netif the already initialized lwip network interface structure
 *        for this ethernetif
 */
extern "C" void low_level_init(struct netif *netif)
{
	uint32_t regvalue = 0;
	uint8_t macaddress[6]= { MAC_ADDR0, MAC_ADDR1, MAC_ADDR2, MAC_ADDR3, MAC_ADDR4, MAC_ADDR5 };

	/* Reset the PHY */
	caribou_gpio_reset(&gpio_eth_phy_nrst);
	caribou_thread_sleep_current(2);
	caribou_gpio_set(&gpio_eth_phy_nrst);

	EthHandle.Instance = ETH;  
	EthHandle.Init.MACAddr = macaddress;
	EthHandle.Init.AutoNegotiation = ETH_AUTONEGOTIATION_ENABLE;
	EthHandle.Init.Speed = ETH_SPEED_100M;
	EthHandle.Init.DuplexMode = ETH_MODE_FULLDUPLEX;
	EthHandle.Init.RxMode = ETH_RXINTERRUPT_MODE;
	EthHandle.Init.ChecksumMode = ETH_CHECKSUM_BY_HARDWARE;
	EthHandle.Init.PhyAddress = DP83848_PHY_ADDRESS;
	EthHandle.Init.MediaInterface = ETH_MEDIA_INTERFACE_RMII;

	/* configure ethernet peripheral (GPIOs, clocks, MAC, DMA) */
	if (HAL_ETH_Init(&EthHandle) == HAL_OK)
	{
		/* Set netif link flag */
		netif->flags |= NETIF_FLAG_LINK_UP;
	}

	/* Initialize Tx Descriptors list: Chain Mode */
	HAL_ETH_DMATxDescListInit(&EthHandle, DMATxDscrTab, &Tx_Buff[0][0], ETH_TXBUFNB);
 
	/* Initialize Rx Descriptors list: Chain Mode  */
	HAL_ETH_DMARxDescListInit(&EthHandle, DMARxDscrTab, &Rx_Buff[0][0], ETH_RXBUFNB);

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
	netif->flags |= NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP;

	s_pxNetIf =netif;

	/* create the task that handles the ETH_MAC */
	uint8_t* ethifStack = (uint8_t*)malloc(PRODUCT_ETHIF_THREAD_STACKSZ);
	if (ethifStack )
	{
		caribou_thread_t* thread = caribou_thread_create("ethif",
									ethernetif_input,
									NULL,
									NULL,
									ethifStack,
									PRODUCT_ETHIF_THREAD_STACKSZ,
									1);
		if ( thread )
		{
			/* Enable MAC and DMA transmission and reception */
			HAL_ETH_Start(&EthHandle); 

			/**** Configure PHY to generate an interrupt when Eth Link state changes ****/
			caribou_vector_install(ETH_LINK_EXTI_IRQn,isr_phy_eth0,(void*)&network_interface.phyAddress);
			caribou_vector_install(ETH_IRQn,isr_eth0,&EthHandle);

			/* Read Register Configuration */
			HAL_ETH_ReadPHYRegister(&EthHandle, PHY_MICR, &regvalue);

			regvalue |= (PHY_MICR_INT_EN | PHY_MICR_INT_OE);

			/* Enable Interrupts */
			HAL_ETH_WritePHYRegister(&EthHandle, PHY_MICR, regvalue );

			/* Read Register Configuration */
			HAL_ETH_ReadPHYRegister(&EthHandle, PHY_MISR, &regvalue);

			regvalue |= PHY_MISR_LINK_INT_EN;

			/* Enable Interrupt on change of link status */
			HAL_ETH_WritePHYRegister(&EthHandle, PHY_MISR, regvalue);  

			/* Enable the interrupt vectors... */
			caribou_vector_enable(ETH_LINK_EXTI_IRQn);
			caribou_vector_enable(ETH_IRQn);
		}
		else
		{
			free(ethifStack);
		}
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

extern "C" err_t low_level_output(struct netif *netif, struct pbuf *p)
{
	err_t errval;
	struct pbuf *q;
	uint8_t *buffer = (uint8_t *)(EthHandle.TxDesc->Buffer1Addr);
	__IO ETH_DMADescTypeDef *DmaTxDesc;
	uint32_t framelength = 0;
	uint32_t bufferoffset = 0;
	uint32_t byteslefttocopy = 0;
	uint32_t payloadoffset = 0;

	DmaTxDesc = EthHandle.TxDesc;
	bufferoffset = 0;

	//Accutron::CStatus::statusOn();

	for(q = p; q != NULL; q = q->next)	/* copy frame from pbufs to driver buffers */
	{
		/* Is this buffer available? If not, goto error */
		if((DmaTxDesc->Status & ETH_DMATXDESC_OWN) != (uint32_t)RESET)
		{
			errval = ERR_USE;
			goto error;
		}
		byteslefttocopy = q->len;	/* Get bytes in current lwIP buffer */
		payloadoffset = 0;
		/* Check if the length of data to copy is bigger than Tx buffer size*/
		while( (byteslefttocopy + bufferoffset) > ETH_TX_BUF_SIZE )
		{
			/* Copy data to Tx buffer*/
			memcpy( (uint8_t*)((uint8_t*)buffer + bufferoffset), (uint8_t*)((uint8_t*)q->payload + payloadoffset), (ETH_TX_BUF_SIZE - bufferoffset) );
			DmaTxDesc = (ETH_DMADescTypeDef *)(DmaTxDesc->Buffer2NextDescAddr);	/* Point to next descriptor */
			if((DmaTxDesc->Status & ETH_DMATXDESC_OWN) != (uint32_t)RESET)		/* Check if the buffer is available */
			{
				errval = ERR_USE;
				goto error;
			}
			buffer = (uint8_t *)(DmaTxDesc->Buffer1Addr);
			byteslefttocopy = byteslefttocopy - (ETH_TX_BUF_SIZE - bufferoffset);
			payloadoffset = payloadoffset + (ETH_TX_BUF_SIZE - bufferoffset);
			framelength = framelength + (ETH_TX_BUF_SIZE - bufferoffset);
			bufferoffset = 0;
		}
		/* Copy the remaining bytes */
		memcpy( (uint8_t*)((uint8_t*)buffer + bufferoffset), (uint8_t*)((uint8_t*)q->payload + payloadoffset), byteslefttocopy );
		bufferoffset = bufferoffset + byteslefttocopy;
		framelength = framelength + byteslefttocopy;
	}
	HAL_ETH_TransmitFrame(&EthHandle, framelength);		/* Prepare transmit descriptors to give to DMA */ 
	errval = ERR_OK;

error:
	/* When Transmit Underflow flag is set, clear it and issue a Transmit Poll Demand to resume transmission */
	if ((EthHandle.Instance->DMASR & ETH_DMASR_TUS) != (uint32_t)RESET)
	{
		EthHandle.Instance->DMASR = ETH_DMASR_TUS;		/* Clear TUS ETHERNET DMA flag */
		EthHandle.Instance->DMATPDR = 0;				/* Resume DMA transmission*/
	}

	//Accutron::CStatus::statusOff();

	return errval;
}

/**
 * Should allocate a pbuf and transfer the bytes of the incoming
 * packet from the interface into the pbuf.
 *
 * @param netif the lwip network interface structure for this ethernetif
 * @return a pbuf filled with the received packet (including MAC header)
 *         NULL on memory error
 */
extern "C" struct pbuf * low_level_input(struct netif *netif)
{
	struct pbuf *p = NULL, *q = NULL;
	uint16_t len = 0;
	uint8_t *buffer;
	__IO ETH_DMADescTypeDef *dmarxdesc;
	uint32_t bufferoffset = 0;
	uint32_t payloadoffset = 0;
	uint32_t byteslefttocopy = 0;
	uint32_t i=0;

	if(HAL_ETH_GetReceivedFrame_IT(&EthHandle) == HAL_OK)			/* get received frame */
	{
		len = EthHandle.RxFrameInfos.length;						/* Obtain the size of the packet and put it into the "len" variable. */
		buffer = (uint8_t *)EthHandle.RxFrameInfos.buffer;

		//Accutron::CStatus::statusOn();

		if (len > 0)
		{
			p = pbuf_alloc(PBUF_RAW, len, PBUF_POOL);				/* We allocate a pbuf chain of pbufs from the Lwip buffer pool */
		}

		if (p != NULL)
		{
			dmarxdesc = EthHandle.RxFrameInfos.FSRxDesc;
			bufferoffset = 0;

			for(q = p; q != NULL; q = q->next)
			{
				byteslefttocopy = q->len;
				payloadoffset = 0;

				/* Check if the length of bytes to copy in current pbuf is bigger than Rx buffer size */
				while( (byteslefttocopy + bufferoffset) > ETH_RX_BUF_SIZE )
				{
					/* Copy data to pbuf */
					memcpy( (uint8_t*)((uint8_t*)q->payload + payloadoffset), (uint8_t*)((uint8_t*)buffer + bufferoffset), (ETH_RX_BUF_SIZE - bufferoffset));

					/* Point to next descriptor */
					dmarxdesc = (ETH_DMADescTypeDef *)(dmarxdesc->Buffer2NextDescAddr);
					buffer = (uint8_t *)(dmarxdesc->Buffer1Addr);

					byteslefttocopy = byteslefttocopy - (ETH_RX_BUF_SIZE - bufferoffset);
					payloadoffset = payloadoffset + (ETH_RX_BUF_SIZE - bufferoffset);
					bufferoffset = 0;
				}

				/* Copy remaining data in pbuf */
				memcpy( (uint8_t*)((uint8_t*)q->payload + payloadoffset), (uint8_t*)((uint8_t*)buffer + bufferoffset), byteslefttocopy);
				bufferoffset = bufferoffset + byteslefttocopy;
			}
		}

		/* Release descriptors to DMA */
		/* Point to first descriptor */
		dmarxdesc = EthHandle.RxFrameInfos.FSRxDesc;
		/* Set Own bit in Rx descriptors: gives the buffers back to DMA */
		for (i=0; i< EthHandle.RxFrameInfos.SegCount; i++)
		{  
			dmarxdesc->Status |= ETH_DMARXDESC_OWN;
			dmarxdesc = (ETH_DMADescTypeDef *)(dmarxdesc->Buffer2NextDescAddr);
		}

		/* Clear Segment_Count */
		EthHandle.RxFrameInfos.SegCount =0;

		/* When Rx Buffer unavailable flag is set: clear it and resume reception */
		#if !defined(RBUS_FIX)
			if ((EthHandle.Instance->DMASR & ETH_DMASR_RBUS) != (uint32_t)RESET)  
			{
				/* Clear RBUS ETHERNET DMA flag */
				EthHandle.Instance->DMASR = ETH_DMASR_RBUS;
				/* Resume DMA reception */
				EthHandle.Instance->DMARPDR = 0;
			}
		#endif

        //Accutron::CStatus::statusOff();

		return p;
	}
	return NULL;
}

#if defined(RBUS_FIX)
	static void ethernet_watchdog(void) 
	{
		// u32 temp;
		/* When Rx Buffer unavailable flag is set: clear it and resume reception */
		if ((ETH->DMASR & ETH_DMASR_RBUS) != (uint32_t)RESET)
		{
			/* Clear RBUS ETHERNET DMA flag */
			//ETH_DMAClearITPendingBit(ETH_DMA_IT_RBU | ETH_DMA_IT_AIS);
			//temp = ETH->DMASR;

			ETH->DMASR = ETH_DMASR_RBUS;

			/* Resume DMA reception. The register doesn't care what you write to it. */
			ETH->DMARPDR = 0;
		}
	}
#endif

/**
 * This function is the ethernetif_input task, it is processed when a packet 
 * is ready to be read from the interface. It uses the function low_level_input() 
 * that should handle the actual reception of bytes from the network
 * interface. Then the type of the received packet is determined and
 * the appropriate input function is called.
 *
 * @param netif the lwip network interface structure for this ethernetif
 */
extern "C" void ethernetif_input( void * pvParameters )
{
  struct pbuf *p;
  
	for( ;; )
	{
		//int state = caribou_interrupts_disable();
        int state = caribou_vector_disable(ETH_IRQn);
		//if (caribou_semaphore_try_wait(&ethInputSemaphore, netifGUARD_BLOCK_TIME))
		while ( ethInputCount > 0 )
		{
			--ethInputCount;
			//caribou_interrupts_set(state);
			caribou_vector_set(ETH_IRQn,state);
			//if ( (p = low_level_input( s_pxNetIf )) )
			while ( (p = low_level_input( s_pxNetIf )) )
			{
				if (ERR_OK != s_pxNetIf->input( p, s_pxNetIf))
				{
					SYS_ARCH_DECL_PROTECT(old_level);
					SYS_ARCH_PROTECT(old_level);
					#if USE_PBUF_FREE_CALLBACK
						pbuf_free_callback(p);
					#else
						pbuf_free(p);
					#endif
					SYS_ARCH_UNPROTECT(old_level);
					p=NULL;
				}
			}
			//state = caribou_interrupts_disable();
            state = caribou_vector_disable(ETH_IRQn);
		}
		//caribou_interrupts_set(state);
		caribou_vector_set(ETH_IRQn,state);
		#if defined(RBUS_FIX)
			ethernet_watchdog();
		#endif
		caribou_thread_yield();
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
extern "C" err_t ethernetif_init(struct netif *netif)
{
	LWIP_ASSERT("netif != NULL", (netif != NULL));

	#if LWIP_NETIF_HOSTNAME
	/* Initialize interface hostname */
	netif->hostname = "caribou";
	#endif /* LWIP_NETIF_HOSTNAME */

	/*
	* Initialize the snmp variables and counters inside the struct netif.
	* The last argument should be replaced with your link speed, in units
	* of bits per second.
	*/
	NETIF_INIT_SNMP(netif, snmp_ifType_ethernet_csmacd, 100000000);

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

extern "C" void arp_timer(void *arg)
{
	etharp_tmr();
	sys_timeout(ARP_TMR_INTERVAL, arp_timer, NULL);
}

/* FIXME - enable this EXTI interrupt */
extern "C" void isr_phy_eth0(InterruptVector vector, void* arg)
{
	uint32_t RegValue;
	uint16_t phyAddress = *(uint16_t*)arg;
    //EXTI->PR = ETH_LINK_EXTI_LINE;
	/* Check whether the link interrupt has occurred or not */
	if(HAL_ETH_ReadPHYRegister(&EthHandle, PHY_MISR, &RegValue)==HAL_OK)
	{
		if ( (RegValue & PHY_LINK_STATUS) != 0)
		{
			network_interface.ethLinkStatus = ~network_interface.ethLinkStatus;
			if(network_interface.ethLinkStatus != 0)
			{
				link_active=false;					/* Network Cable is unplugged */
			}
			else
			{
				link_active=true;					/* Network Cable is now connected */
			}
		}
	}
}

extern "C" void isr_eth0(InterruptVector vector, void* arg)
{
	ETH_HandleTypeDef* ethHandle = (ETH_HandleTypeDef*)arg;
	HAL_ETH_IRQHandler(ethHandle);
}

/* Callback in non blocking modes (Interrupt) */
extern "C" void HAL_ETH_TxCpltCallback(ETH_HandleTypeDef *heth)
{
}

extern "C" void HAL_ETH_RxCpltCallback(ETH_HandleTypeDef *heth)
{
	/* Give the semaphore to wakeup LwIP task */
	//caribou_semaphore_signal( &ethInputSemaphore ); 
	++ethInputCount;
}

extern "C" void HAL_ETH_ErrorCallback(ETH_HandleTypeDef *heth)
{
}


