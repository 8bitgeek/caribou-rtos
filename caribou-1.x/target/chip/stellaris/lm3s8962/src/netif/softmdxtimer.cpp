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
#include <driverlib/ethernet.h>
#include <lwip/timers.h>

///****************************************************************************
/// The local time when the soft MDI/MDIX switch was last switched.
///****************************************************************************
static unsigned long g_ulMDIXTimer = 0;

/// Handles the timeout for the soft-MDIX timer when using a RTOS.
void soft_mdx_timer(void *pvArg)
{
    // Service the MDIX timer.
    if((EthernetPHYRead(ETH_BASE, PHY_MR1) & PHY_MR1_LINK) == 0)
    {
        g_ulMDIXTimer += SOFT_MDIX_INTERVAL;
        // See if there has not been a link for 2 seconds.
        if(g_ulMDIXTimer >= 2000)
        {
            // There has not been a link for 2 seconds, so flip the MDI/MDIX switch.
            // This is handled automatically by Fury rev A2, but is harmless.
            HWREG(ETH_BASE + MAC_O_MDIX) ^= MAC_MDIX_EN;
            // Reset the MDIX timer.
            g_ulMDIXTimer = 0;
        }
    }
    else
    {
        // There is a link, so reset the MDIX timer.
        g_ulMDIXTimer = 0;
    }
    // Re-schedule the soft-MDIX timer callback function timeout.
    sys_timeout(SOFT_MDIX_INTERVAL, soft_mdx_timer, NULL);
}

