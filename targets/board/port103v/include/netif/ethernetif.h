 /******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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

#ifndef __CARIBOU_STM32_ENCJ60_H__
#define __CARIBOU_STM32_ENCJ60_H__

#ifdef __cplusplus
extern "C"
{
#endif

extern void caribou_network_init();

#if 0

extern int stellarisif_input(struct netif *netif);
extern err_t stellarisif_init(struct netif *netif);
extern void stellarisif_interrupt(struct netif *netif);
extern int lwip_errno(int err);
extern void isr_ethernet(InterruptVector vector);

#if NETIF_DEBUG
void stellarisif_debug_print(struct pbuf *p);
#else
#define stellarisif_debug_print(p)
#endif /* NETIF_DEBUG */

#endif // 0

#ifdef __cplusplus
}
#endif

#endif // __STELLARISIF_H__
