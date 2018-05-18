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
#include "lwip/mem.h"
#include "lwip/memp.h"
#include "lwip/dhcp.h"
#include "lwip/tcpip.h"
#include "lwip/ip_addr.h"
#include "lwip/err.h"
#include "lwip/inet.h"
#include "netif/ethernetif.h"
#include "netconf.h"
#include <caribou/lib/stdio.h>

typedef enum 
{ 
  DHCP_START=0,
  DHCP_WAIT_ADDRESS,
  DHCP_ADDRESS_ASSIGNED,
  DHCP_TIMEOUT
} 
DHCP_State_TypeDef;

#define MAX_DHCP_TRIES 5

bool network_started=false;
struct netif xnetif; /* network interface structure */

void netif_status_callback(struct netif* netif)
{
 	syslog(DEBUG_LVL,true,"netif_status_callback");
	network_started=true;
}

/**
  * @brief  Initializes the lwIP stack
  * @param  None
  * @retval None
  */
void LwIP_Init(void)
{
	struct ip_addr ipaddr;
	struct ip_addr netmask;
	struct ip_addr gw;
	#ifndef USE_DHCP 
		uint8_t iptab[4];
		uint8_t iptxt[20];
	#endif
	/* Create tcp_ip stack thread */
	tcpip_init( NULL, NULL );	

	/* IP address setting & display on STM32_evalboard LCD*/
	#ifdef USE_DHCP
		ipaddr.addr = 0;
		netmask.addr = 0;
		gw.addr = 0;
	#else
		IP4_ADDR(&ipaddr, IP_ADDR0, IP_ADDR1, IP_ADDR2, IP_ADDR3);
		IP4_ADDR(&netmask, NETMASK_ADDR0, NETMASK_ADDR1 , NETMASK_ADDR2, NETMASK_ADDR3);
		IP4_ADDR(&gw, GW_ADDR0, GW_ADDR1, GW_ADDR2, GW_ADDR3);

		iptab[0] = IP_ADDR3;
		iptab[1] = IP_ADDR2;
		iptab[2] = IP_ADDR1;
		iptab[3] = IP_ADDR0;

		sprintf((char*)iptxt, "  %d.%d.%d.%d", iptab[3], iptab[2], iptab[1], iptab[0]); 

		syslog(SYSTEM_LVL,true, "Static IP address %s", iptxt);
	#endif

	/*
	    - netif_add(struct netif *netif, ip_addr_t *ipaddr,
			ip_addr_t *netmask, ip_addr_t *gw,
			void *state, err_t (* init)(struct netif *netif),
			err_t (* input)(struct pbuf *p, struct netif *netif))

		Adds your network interface to the netif_list. Allocate a struct
		netif and pass a pointer to this structure as the first argument.
		Give pointers to cleared ip_addr structures when using DHCP,
		or fill them with sane numbers otherwise. The state pointer may be NULL.
	
		The init function pointer must point to a initialization function for
		your ethernet netif interface. The following code illustrates it's use.
	*/

	netif_add(&xnetif, &ipaddr, &netmask, &gw, NULL, &ethernetif_init, &tcpip_input);

	/*  Registers the default network interface. */
	netif_set_default(&xnetif);

	/*  When the netif is fully configured this function must be called.*/
	netif_set_up(&xnetif); 

    #if !defined(USE_DHCP)
		netif_status_callback(&xnetif);
	#endif
}

/**
  * @brief  LwIP_DHCP_Process_Handle
  * @param  None
  * @retval None
  */
void LwIP_DHCP_task(void * pvParameters)
{
	struct ip_addr ipaddr;
	struct ip_addr netmask;
	struct ip_addr gw;
	uint32_t IPaddress;
	uint8_t iptab[4];
	uint8_t iptxt[20];
	uint8_t DHCP_state;  
	DHCP_state = DHCP_START;
	bool terminate=false;

	netif_set_status_callback(&xnetif, netif_status_callback);

	LwIP_Init();

	while (!terminate)
	{
		switch (DHCP_state)
		{
			case DHCP_START:
				{
					dhcp_start(&xnetif);
					IPaddress = 0;
					DHCP_state = DHCP_WAIT_ADDRESS;
					syslog(SYSTEM_LVL,true,"DHCP_START");
				}
				break;
			case DHCP_WAIT_ADDRESS:
				{
					IPaddress = xnetif.ip_addr.addr;	/* Read the new IP address */

					if (IPaddress!=0) 
					{
						DHCP_state = DHCP_ADDRESS_ASSIGNED;	
                        
						/* Stop DHCP */
						dhcp_stop(&xnetif);
										
						iptab[0] = (uint8_t)(IPaddress >> 24);
						iptab[1] = (uint8_t)(IPaddress >> 16);
						iptab[2] = (uint8_t)(IPaddress >> 8);
						iptab[3] = (uint8_t)(IPaddress);

						sprintf((char*)iptxt, "  %d.%d.%d.%d", iptab[3], iptab[2], iptab[1], iptab[0]);  
						syslog(SYSTEM_LVL,true,"DHCP_WAIT_ADDRESS reply %s",iptxt);
					}
					else
					{
						/* DHCP timeout */
						if (xnetif.dhcp->tries > MAX_DHCP_TRIES)
						{
							DHCP_state = DHCP_TIMEOUT;

							/* Stop DHCP */
							dhcp_stop(&xnetif);

							/* Static address used */
							IP4_ADDR(&ipaddr, IP_ADDR0 ,IP_ADDR1 , IP_ADDR2 , IP_ADDR3 );
							IP4_ADDR(&netmask, NETMASK_ADDR0, NETMASK_ADDR1, NETMASK_ADDR2, NETMASK_ADDR3);
							IP4_ADDR(&gw, GW_ADDR0, GW_ADDR1, GW_ADDR2, GW_ADDR3);
							netif_set_addr(&xnetif, &ipaddr , &netmask, &gw);

							syslog(SYSTEM_LVL,true,"DHCP_TIMEOUT");

							iptab[0] = IP_ADDR3;
							iptab[1] = IP_ADDR2;
							iptab[2] = IP_ADDR1;
							iptab[3] = IP_ADDR0;

							sprintf((char*)iptxt, "  %d.%d.%d.%d", iptab[3], iptab[2], iptab[1], iptab[0]); 
							syslog(SYSTEM_LVL,true,"DHCP_TIMEOUT activating static ip %s",iptxt);
							netif_status_callback(&xnetif);
						}
					}
				}
				break;
			case DHCP_ADDRESS_ASSIGNED:
				syslog(SYSTEM_LVL,true,"DHCP_ADDRESS_ASSIGNED");
                netif_status_callback(&xnetif);
				terminate=true;
				break;
			default: 
				break;
		}
	}   
}

