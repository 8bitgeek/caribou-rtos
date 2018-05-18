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
#include <csettings.h>
#include <inc/hw_memmap.h>
#include <inc/hw_ethernet.h>
#include <inc/hw_types.h>
#include <inc/hw_sysctl.h>
#include <driverlib/ethernet.h>
#include <lwip/timers.h>
#include <lwip/tcpip.h>
#include <lwip/sockets.h>
#include <lwip/dhcp.h>

static void arp_timer(void *arg)
{
	etharp_tmr();
	sys_timeout(ARP_TMR_INTERVAL, arp_timer, NULL);
}

/**
 * In this function, the hardware should be initialized.
 * Called from ethernetif_init().
 *
 * @param netif the already initialized lwip network interface structure
 *        for this ethernetif
 */
extern "C" void low_level_init(struct netif *netif)
{
	u32_t temp;
	// struct stellarisif *stellarisif = netif->state;
	// set MAC hardware address length
	netif->hwaddr_len = ETHARP_HWADDR_LEN;
	// Initialize the Ethernet Controller.
	EthernetInitExpClk(ETH_BASE, SysCtlClockGet());
	// maximum transfer unit
	netif->mtu = 1500;
	// device capabilities
	// don't set NETIF_FLAG_ETHARP if this device is not an ethernet one
	netif->flags = NETIF_FLAG_BROADCAST | NETIF_FLAG_ETHARP | NETIF_FLAG_LINK_UP;
	// Do whatever else is needed to initialize interface.
	// Disable all Ethernet Interrupts.
	caribou_vector_install(INT_ETH,isr_eth0,NULL);
	//EthernetIntDisable(ETH_BASE, (ETH_INT_PHY | ETH_INT_MDIO | ETH_INT_RXER | ETH_INT_RXOF | ETH_INT_TX | ETH_INT_TXER | ETH_INT_RX));
	temp = EthernetIntStatus(ETH_BASE, false);
	EthernetIntClear(ETH_BASE, temp);
	// Initialize the Ethernet Controller.
	//EthernetInitExpClk(ETH_BASE, SysCtlClockGet());
	// Configure the Ethernet Controller for normal operation.
	// - Enable TX Duplex Mode
	// - Enable TX Padding
	// - Enable TX CRC Generation
	// - Enable RX Multicast Reception
	EthernetConfigSet(ETH_BASE, (ETH_CFG_RX_BADCRCDIS | ETH_CFG_TX_DPLXEN |ETH_CFG_TX_CRCEN | ETH_CFG_TX_PADEN | ETH_CFG_RX_AMULEN));
	// Enable the Ethernet Controller transmitter and receiver.
	// set MAC hardware address
	#if !defined(ACCUTRON_ACCTRX)
		EthernetMACAddrGet(ETH_BASE, &(netif->hwaddr[0]));
	#else
		{
			CARIBOU::CByteArray mac = Accutron::CSettings::macAddr();
			memcpy(netif->hwaddr,mac.data(),6);
            EthernetMACAddrSet(ETH_BASE, &(netif->hwaddr[0]));
		}
	#endif
	EthernetEnable(ETH_BASE);
	// Enable the Ethernet Interrupt handler.
	caribou_vector_enable(INT_ETH);
	// Enable Ethernet TX and RX Packet Interrupts.
	EthernetIntEnable(ETH_BASE, ETH_IRQS);
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

	eth_queue_clear(&interface.tx_queue);
	eth_queue_clear(&interface.rx_queue);

	#if LWIP_NETIF_HOSTNAME
	/* Initialize interface hostname */
	netif->hostname = "lwip";
	#endif /* LWIP_NETIF_HOSTNAME */

	// Initialize the snmp variables and counters inside the struct netif.
	// The last argument should be replaced with your link speed, in units of bits per second.
	//NETIF_INIT_SNMP(netif, snmp_ifType_ethernet_csmacd, 10000000);

	netif->name[0] = PRODUCT_IF_NAME[0];
	netif->name[1] = PRODUCT_IF_NAME[1];

	netif->output = etharp_output;
	netif->linkoutput = eth_output;

	/* etharp_init(); */ /* No longer needed lwip 1.3.0 */
	sys_timeout(ARP_TMR_INTERVAL, arp_timer, NULL);

	return ERR_OK;
}


/// Get's called during the late init of CARIBOU.
extern "C" void network_init()
{
	struct ip_addr ip_addr;
    struct ip_addr net_mask;
    struct ip_addr gw_addr;
	// If using a RTOS, create the Ethernet interrupt task
	// Setup the network address values.

	/* initialize the hardware */
	low_level_init(&interface.netif);

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
	// Start the TCP/IP thread & init stuff
    tcpip_init(NULL, NULL);
	// Create, configure and add the Ethernet controller interface with
	// default settings.  ip_input should be used to send packets directly to
	// the stack when not using a RTOS and tcpip_input should be used to send
	// packets to the TCP/IP thread's queue when using a RTOS.
	memset(&interface.netif,0,sizeof(struct netif));
	netif_add(&interface.netif, &ip_addr, &net_mask, &gw_addr, NULL, ethernetif_init, tcpip_input);
	netif_set_default(&interface.netif);
	netif_set_up(&interface.netif);
	//lwip_socket_init();
	// Start DHCP, if enabled.
	#if LWIP_DHCP
		if ( Accutron::CSettings::dhcpEnabled() )
		{
			dhcp_start(&interface.netif);
		}
	#endif
	// Start AutoIP, if enabled and DHCP is not.
	#if LWIP_AUTOIP
		#if 0
			// With DHCP/AUTOIP COOPERATION enabled, DHCP should
			// automatically fall back to AUtoIP if no DHCP offers
			// are received.
			if ( Accutron::CSettings::autoIpEnabled() )
			{
				autoip_start(&interface.netif);
			}
		#endif
	#endif
	// Bring the interface up.
	//netif_set_up(&s_pxNetIf);
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
	// Enable the Ethernet Interrupt handler.
	caribou_vector_enable(INT_ETH);
	// join multicast group.
	#if LWIP_IGMP
		// The ip-address is NULL at this point until auto-ip exstablishes an IP addr???
		struct ip_addr addp_addr;
		addp_addr.addr = htonl(STATIC_ADDRESS(224,0,5,128));
        interface.netif.flags |= NETIF_FLAG_IGMP;
		igmp_start( &interface.netif );
		if ( igmp_joingroup(&ip_addr,&addp_addr) != 0 )
		{
			perror("lgmp_joingroup");
		}
	#endif
	// wait for the interface address to come up
	//while ( s_pxNetIf.ip_addr.addr == (uint32_t)0 )
	//{
	//	caribou_thread_yield();
	//}
}

