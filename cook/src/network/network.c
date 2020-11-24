#include <network.h>
#include <lwip/mem.h>
#include <lwip/memp.h>
#include <lwip/dhcp.h>
#include <lwip/tcpip.h>
#include <netif/ethernetif.h>
#include <network.h>
#include <caribou/lib/stdio.h>
#include <syslog_printf.h>

void network_init(network_settings_t* network_settings, const uint8_t mac[], const char ifname[], bool dhcp )
{
	memset(network_settings,0,sizeof(network_settings_t));
	memcpy(network_settings->mac,mac,6);
	memcpy(network_settings->ifname,ifname,2);
	network_settings->dhcp = dhcp;
}

void network_start(network_settings_t* network_settings)
{
	ip_addr_t 	ipaddr;
	ip_addr_t 	netmask;
	ip_addr_t 	gw;

	network_settings->network_if.hwaddr_len = 6;
	network_settings->network_if.hwaddr[0] =  network_settings->mac[0];	
	network_settings->network_if.hwaddr[1] =  network_settings->mac[1];	
	network_settings->network_if.hwaddr[2] =  network_settings->mac[2];	
	network_settings->network_if.hwaddr[3] =  network_settings->mac[3];
	network_settings->network_if.hwaddr[4] =  network_settings->mac[4];
	network_settings->network_if.hwaddr[5] =  network_settings->mac[5];

	network_settings->network_if.name[0] = network_settings->ifname[0];
	network_settings->network_if.name[1] = network_settings->ifname[1];

	/* Create tcp_ip stack thread */
	tcpip_init( NULL, NULL );	

	network_address_to_host( &ipaddr, 	network_get_ip(network_settings) );
	network_address_to_host( &netmask, 	network_get_netmask(network_settings) );
	network_address_to_host( &gw, 		network_get_gateway(network_settings) );

	SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "Static IP Address %d.%d.%d.%d",
										network_address_octet( network_get_ip(network_settings), 0),
										network_address_octet( network_get_ip(network_settings), 1),
										network_address_octet( network_get_ip(network_settings), 2),
										network_address_octet( network_get_ip(network_settings), 3)
	);

	network_settings->network_if.mtu = TCP_MSS;

	netif_add(&network_settings->network_if, &ipaddr, &netmask, &gw, NULL, &ethernetif_init, &tcpip_input);

	network_settings->network_if.mtu = TCP_MSS;

	/*  Registers the default network interface. */
	netif_set_default(&network_settings->network_if);

	/*  When the netif is fully configured this function must be called.*/
	netif_set_link_up(&network_settings->network_if);
	netif_set_up(&network_settings->network_if); 

	SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "network up" );
}


extern bool network_get_dhcp( network_settings_t* network_settings )
{
	return network_settings->dhcp;
}

extern uint8_t* network_get_mac( network_settings_t* network_settings )
{
	return network_settings->mac;
}

extern uint8_t* network_get_ifname( network_settings_t* network_settings )
{
	return (uint8_t*)network_settings->ifname;
}

extern struct netif* network_get_netif( network_settings_t* network_settings )
{
	return &network_settings->network_if;
}


extern void network_set_ip( network_settings_t* network_settings, network_address_t* network_address )
{
	network_address_copy(&network_settings->ip,network_address);
}

extern void network_set_netmask( network_settings_t* network_settings, network_address_t* network_address )
{
	network_address_copy(&network_settings->netmask,network_address);
}

extern void network_set_gateway( network_settings_t* network_settings, network_address_t* network_address )
{
	network_address_copy(&network_settings->gateway,network_address);
}

extern void network_set_multicast( network_settings_t* network_settings, network_address_t* network_address )
{
	network_address_copy(&network_settings->multicast,network_address);
}

extern network_address_t* network_get_ip( network_settings_t* network_settings )
{
	return &network_settings->ip;
}

extern network_address_t* network_get_netmask( network_settings_t* network_settings )
{
	return &network_settings->netmask;
}

extern network_address_t* network_get_gateway( network_settings_t* network_settings )
{
	return &network_settings->gateway;
}

extern network_address_t* network_get_multicast( network_settings_t* network_settings )
{
	return &network_settings->multicast;
}
