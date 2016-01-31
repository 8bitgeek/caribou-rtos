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
#ifndef __CARIBOU_STM32F407_H__
#define __CARIBOU_STM32F407_H__

#include <netif/etharp.h>
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

extern void isr_phy_eth0(InterruptVector vector, void* arg);
extern void isr_eth0(InterruptVector vector, void* arg);
extern err_t ethernetif_init(struct netif *netif);

#ifdef __cplusplus
}
#endif

#endif // __CARIBOU_STM32F407_H__
