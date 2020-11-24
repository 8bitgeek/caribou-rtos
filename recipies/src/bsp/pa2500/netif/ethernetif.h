/*****************************************************************************
* Copyright (c) 2017 by Pike Aerospace Research Corp.                        *
* All Rights Reserved                                                        *
*****************************************************************************/
#ifndef __CARIBOU_ETHERNETIF_H__
#define __CARIBOU_ETHERNETIF_H__

#include <netif/etharp.h>
#include <netif/enc28j60.h>
#include <lwip/opt.h>
#include <lwip/netif.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/stats.h>
#include <lwip/snmp.h>

#ifdef __cplusplus
extern "C"
{
#endif

extern err_t ethernetif_init(struct netif *netif);

#ifdef __cplusplus
}
#endif

#endif /* __CARIBOU_ETHERNETIF_H__ */
