#include <network_multicast.h>
#include <lwip/mem.h>
#include <lwip/memp.h>
#include <lwip/dhcp.h>
#include <lwip/tcpip.h>
#include <netif/ethernetif.h>
#include <caribou/lib/stdio.h>

/**
 * Join multicast group.
 * err_t  igmp_joingroup(ip_addr_t *ifaddr, ip_addr_t *groupaddr);
 */
void network_multicast_init(network_settings_t* network_settings)
{
	ip_addr_t addp_addr;
	struct netif* netif = network_get_netif( network_settings );
	
	addp_addr.addr = lwip_htonl( network_address_word( network_get_multicast( network_settings ) ) );
	netif->flags |= NETIF_FLAG_IGMP;
	igmp_start(netif);
	if ( igmp_joingroup(&netif->ip_addr,(ip_addr_t*)&addp_addr) != 0 )
	{
		perror("lgmp_joingroup");
	}
}

