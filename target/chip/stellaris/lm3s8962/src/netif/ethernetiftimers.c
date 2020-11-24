/*****************************************************************************
* Copyright (c) 2014 by Accutron Instruments                                 *
* All Rights Reserved                                                        *
*****************************************************************************/
#include <board.h>
#include <lwip/opt.h>
#include <lwip/def.h>
#include <lwip/mem.h>
#include <lwip/pbuf.h>
#include <lwip/sys.h>
#include <lwip/stats.h>
#include <lwip/snmp.h>
#include <lwip/timers.h>
#include <lwip/tcpip.h>
#include <lwip/dhcp.h>
#include <lwip/autoip.h>
#include <lwip/ip_frag.h>
#include <netif/etharp.h>
/* #include <netif/ppp_oe.h> */
#include <netif/ethernetif.h>

#include <inc/hw_ethernet.h>

///****************************************************************************
/// The local time when the TCP timer was last serviced.
///****************************************************************************
static unsigned long g_ulTCPTimer = 0;

///****************************************************************************
/// The local time for the lwIP Library Abstraction layer, used to support the
/// Host and lwIP periodic callback functions.
///****************************************************************************
static unsigned long g_ulLocalTimer = 0;
static unsigned long g_ulIGMPTimer = 0;

///****************************************************************************
/// The local time when the soft MDI/MDIX switch was last switched.
///****************************************************************************
static unsigned long g_ulMDIXTimer = 0;

///****************************************************************************
/// The local time when the ARP timer was last serviced.
///****************************************************************************
#if LWIP_ARP
static unsigned long g_ulARPTimer = 0;
#endif

///****************************************************************************
/// The local time when the AutoIP timer was last serviced.
///****************************************************************************
#if LWIP_AUTOIP
static unsigned long g_ulAutoIPTimer = 0;
#endif

///****************************************************************************
/// The local time when the DHCP Coarse timer was last serviced.
///****************************************************************************
#if LWIP_DHCP
static unsigned long g_ulDHCPCoarseTimer = 0;
#endif

///****************************************************************************
/// The local time when the DHCP Fine timer was last serviced.
///****************************************************************************
#if LWIP_DHCP
static unsigned long g_ulDHCPFineTimer = 0;
#endif

///****************************************************************************
/// The local time when the IP Reassembly timer was last serviced.
///****************************************************************************
#if IP_REASSEMBLY
static unsigned long g_ulIPReassemblyTimer = 0;
#endif

///****************************************************************************
/// The local time when the DNS timer was last serviced.
///****************************************************************************
#if LWIP_DNS
static unsigned long g_ulDNSTimer = 0;
#endif

/// This function services all of the lwIP periodic timers, including TCP and
/// Host timers.  This should be called from the lwIP context, which may be
/// the Ethernet interrupt (in the case of a non-RTOS system) or the lwIP
/// thread, in the event that an RTOS is used.
void ethernetif_timers(void)
{
	uint32_t delta;
	// Increment the local timer according to elapsed time in ms.
	if ( (delta = (uint32_t)to_ms(caribou_timer_ticks()) - g_ulLocalTimer) )
	{
		g_ulLocalTimer += delta;
    }

	caribou_thread_lock();

    if((EthernetPHYRead(ETH_BASE, PHY_MR1) & PHY_MR1_LINK) == 0)
    // Service the MDIX timer.
    {
        // See if there has not been a link for 2 seconds.
        if((g_ulLocalTimer - g_ulMDIXTimer) >= 2000)
        {
            // There has not been a link for 2 seconds, so flip the MDI/MDIX
            // switch.  This is handled automatically by Fury rev A2, but is
            // harmless.
            HWREG(ETH_BASE + MAC_O_MDIX) ^= MAC_MDIX_EN;
            // Reset the MDIX timer.
            g_ulMDIXTimer = g_ulLocalTimer;
        }
    }
    else
    {
        // There is a link, so reset the MDIX timer.
        g_ulMDIXTimer = g_ulLocalTimer;
    }

    // Service the host timer.
	#if HOST_TMR_INTERVAL
		if((g_ulLocalTimer - caribou_timer_ticks()) >= HOST_TMR_INTERVAL)
		{
			g_ulLocalTimer = caribou_timer_ticks();
			lwip_host_timer_callback();
		}
	#endif
		// Service the ARP timer.
	#if LWIP_ARP
		if((g_ulLocalTimer - g_ulARPTimer) >= ARP_TMR_INTERVAL)
		{
			g_ulARPTimer = g_ulLocalTimer;
			etharp_tmr();
		}
	#endif
		// Service the TCP timer.
	#if LWIP_TCP
		if((g_ulLocalTimer - g_ulTCPTimer) >= TCP_TMR_INTERVAL)
		{
			g_ulTCPTimer = g_ulLocalTimer;
			tcp_tmr();
		}
	#endif
		// Service the AutoIP timer.
	#if LWIP_AUTOIP
		if((g_ulLocalTimer - g_ulAutoIPTimer) >= AUTOIP_TMR_INTERVAL)
		{
			g_ulAutoIPTimer = g_ulLocalTimer;
			autoip_tmr();
		}
	#endif
		// Service the DCHP Coarse Timer.
	#if LWIP_DHCP
		if((g_ulLocalTimer - g_ulDHCPCoarseTimer) >= DHCP_COARSE_TIMER_MSECS)
		{
			g_ulDHCPCoarseTimer = g_ulLocalTimer;
			dhcp_coarse_tmr();
		}
	#endif
		// Service the DCHP Fine Timer.
	#if LWIP_DHCP
		if((g_ulLocalTimer - g_ulDHCPFineTimer) >= DHCP_FINE_TIMER_MSECS)
		{
			g_ulDHCPFineTimer = g_ulLocalTimer;
			dhcp_fine_tmr();
		}
	#endif
		// Service the IP Reassembly Timer
	#if IP_REASSEMBLY
		if((g_ulLocalTimer - g_ulIPReassemblyTimer) >= IP_TMR_INTERVAL)
		{
			g_ulIPReassemblyTimer = g_ulLocalTimer;
			ip_reass_tmr();
		}
	#endif
		// Service the IGMP Timer
	#if LWIP_IGMP
		if((g_ulLocalTimer - g_ulIGMPTimer) >= IGMP_TMR_INTERVAL)
		{
			g_ulIGMPTimer = g_ulLocalTimer;
			igmp_tmr();
		}
	#endif
		// Service the DNS Timer
	#if LWIP_DNS
		if((g_ulLocalTimer - g_ulDNSTimer) >= DNS_TMR_INTERVAL)
		{
			g_ulDNSTimer = g_ulLocalTimer;
			dns_tmr();
		}
	#endif

	sys_timeout(HOST_TMR_INTERVAL, ethernetif_timers, NULL);	/* Re-schedule the soft-MDIX timer callback function timeout. */

	caribou_thread_unlock();
}

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

