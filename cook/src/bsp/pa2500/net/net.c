#include <network.h>
#include <network_address.h>
#include <network_multicast.h>
#include <syslog_printf.h>

static	network_settings_t network_settings;

static const bool 	 default_dhcp 			= true;
static const char    default_ifname[2] 		= {'e','i'};
static const uint8_t default_mac[6] 		= {0x00,0x00,0xCF,0xFF,0xFF,0xFE};

static const NETWORK_ADDRESS_DECL(default_ip,192,168,1,10);
static const NETWORK_ADDRESS_DECL(default_netmask,255,255,255,0);
static const NETWORK_ADDRESS_DECL(default_gateway,192,168,1,1);
static const NETWORK_ADDRESS_DECL(default_multicast,239,255,255,128);

void net_init()
{

	network_init( &network_settings, default_mac, default_ifname, default_dhcp );

	network_set_ip			( &network_settings, (network_address_t*)&default_ip );
	network_set_netmask		( &network_settings, (network_address_t*)&default_netmask );
	network_set_gateway 	( &network_settings, (network_address_t*)&default_gateway );
	network_set_multicast	( &network_settings, (network_address_t*)&default_multicast );

	network_start( &network_settings );

	if ( network_get_dhcp( &network_settings ) )
	{
		network_dhcp_start(&network_settings);
	}

	network_multicast_init( &network_settings );

	SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "IP %d.%d.%d.%d",
                                (network_get_netif( &network_settings)->ip_addr.addr & 0x000000FF),
                                (network_get_netif( &network_settings)->ip_addr.addr & 0x0000FF00) >> 8,
								(network_get_netif( &network_settings)->ip_addr.addr & 0x00FF0000) >> 16,
								(network_get_netif( &network_settings)->ip_addr.addr & 0xFF000000) >> 24
								);
}