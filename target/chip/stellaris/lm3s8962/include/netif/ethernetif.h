/*****************************************************************************
* Copyright (c) 2014 by Accutron Instruments                                 *
* All Rights Reserved                                                        *
*****************************************************************************/
#ifndef ACCUTRON_ETHERNETIF_H_
#define ACCUTRON_ETHERNETIF_H_

#include <lwip/err.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern void stellarisif_input(void* arg);
extern err_t stellarisif_init(struct netif *netif);
extern void stellarisif_interrupt(struct netif *netif);

extern void lwip_host_timer_callback(void);
extern void ethernetif_timers(void);
extern void soft_mdx_timer(void *arg);
extern void network_init(struct netif *netif, 
						uint8_t mac_addr[],
						uint8_t ip_addr[],
						uint8_t net_mask[],
						uint8_t gw_addr[],
						bool dhcp_start,
						bool autoip_start);

#if NETIF_DEBUG
void stellarisif_debug_print(struct pbuf *p);
#else
#define stellarisif_debug_print(p)
#endif /* NETIF_DEBUG */

#ifdef __cplusplus
}
#endif

#endif /* ACCUTRON_ETHERNETIF_H_ */

