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

struct netif xnetif; /* network interface structure */

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
	#endif

	/* - netif_add(struct netif *netif, struct ip_addr *ipaddr,
			struct ip_addr *netmask, struct ip_addr *gw,
			void *state, err_t (* init)(struct netif *netif),
			err_t (* input)(struct pbuf *p, struct netif *netif))

	Adds your network interface to the netif_list. Allocate a struct
	netif and pass a pointer to this structure as the first argument.
	Give pointers to cleared ip_addr structures when using DHCP,
	or fill them with sane numbers otherwise. The state pointer may be NULL.

	The init function pointer must point to a initialization function for
	your ethernet netif interface. The following code illustrates it's use.*/

	netif_add(&xnetif, &ipaddr, &netmask, &gw, NULL, &ethernetif_init, &tcpip_input);

	/*  Registers the default network interface. */
	netif_set_default(&xnetif);

	/*  When the netif is fully configured this function must be called.*/
	netif_set_up(&xnetif); 
}

#ifdef USE_DHCP
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

  for (;;)
  {
    switch (DHCP_state)
    {
      case DHCP_START:
      {
        dhcp_start(&xnetif);
        IPaddress = 0;
        DHCP_state = DHCP_WAIT_ADDRESS;
      }
      break;

      case DHCP_WAIT_ADDRESS:
      {
        /* Read the new IP address */
        IPaddress = xnetif.ip_addr.addr;
		
		/* Toggle LED1 */ 
		caribou_gpio_toggle(&LED1);

        if (IPaddress!=0) 
        {
          DHCP_state = DHCP_ADDRESS_ASSIGNED;	
          
          /* Stop DHCP */
          dhcp_stop(&xnetif);

          /* end of DHCP process */
        }
		#if LWIP_DHCP
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

            /* end of DHCP process */
          }
        }
		#endif
      }
      break;

      case DHCP_ADDRESS_ASSIGNED:
        caribou_gpio_set(&LED1);
		break;

      default: 
		break;
    }
    /* wait 250 ms */
    caribou_thread_sleep_current(250);
  }   
}
#endif  /* USE_DHCP */
