#include <network_dhcp.h>
#include <lwip/mem.h>
#include <lwip/memp.h>
#include <lwip/dhcp.h>
#include <lwip/tcpip.h>
#include <netif/ethernetif.h>
#include <network.h>
#include <caribou/lib/stdio.h>
#include <syslog_printf.h>

static const NETWORK_ADDRESS_DECL(zero_ip,0,0,0,0);

uint8_t* dhcp_thread_stack=NULL;

typedef enum 
{ 
	DHCP_START=0,
	DHCP_WAIT_ADDRESS,
	DHCP_ADDRESS_ASSIGNED,
	DHCP_TIMEOUT
} 
dhcp_State_TypeDef;

#define MAX_DHCP_TRIES 60

static void network_dhcp_thread		( void *arg );
static void network_dhcp_finish 	( void *arg );

extern void network_dhcp_start(network_settings_t *network_settings)
{
	dhcp_thread_stack = (uint8_t*)malloc(PRODUCT_DHCP_THREAD_STACK_SZ);
    network_settings->dhcp_busy = false;
	if ( dhcp_thread_stack )
	{
		network_settings->dhcp_busy = true;
		network_set_ip( network_settings, (network_address_t*)&zero_ip );
		caribou_thread_create(	"dhcp",
								network_dhcp_thread,
								network_dhcp_finish,
								network_settings,
								dhcp_thread_stack,
								PRODUCT_DHCP_THREAD_STACK_SZ,
								PRODUCT_DHCP_THREAD_PRIORITY,
								0);

		while( !network_dhcp_finished(network_settings)) 
				caribou_thread_yield();
	}
}

static void network_dhcp_finish(void* arg)
{
    network_settings_t* network_settings = (network_settings_t*)arg;
	if ( dhcp_thread_stack != NULL )
	{
		free(dhcp_thread_stack);
	}
	network_settings->dhcp_busy=false;
}

extern bool network_dhcp_finished(network_settings_t* network_settings)
{
	return !network_settings->dhcp_busy;
}

static void network_dhcp_thread(void * arg)
{
    network_settings_t* network_settings = (network_settings_t*)arg;
	ip_addr_t ipaddr;
	ip_addr_t netmask;
	ip_addr_t gw;
	uint32_t ip_address;
	uint8_t dhcp_state;  
	dhcp_state = DHCP_START;
	int tries=0;

	network_address_to_host(&network_settings->network_if.ip_addr,network_get_ip(network_settings));

	for (;;)
	{
		switch (dhcp_state)
		{
			case DHCP_START:
				{
					dhcp_start(&network_settings->network_if);
					ip_address = 0;
					dhcp_state = DHCP_WAIT_ADDRESS;
					SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "Looking up DHCP..." );
				}
				break;
			case DHCP_WAIT_ADDRESS:
				{
					ip_address = network_settings->network_if.ip_addr.addr;	/* Read the new IP address */

					if (ip_address!=0) 
					{
						network_address_from_host(network_get_ip(network_settings),&network_settings->network_if.ip_addr);
						dhcp_state = DHCP_ADDRESS_ASSIGNED;	
						//dhcp_stop(&network_settings->network_if);				/* Stop DHCP */
						SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "DHCP IP Address %d.%d.%d.%d",
															(uint8_t)(ip_address),
															(uint8_t)(ip_address >> 8),
															(uint8_t)(ip_address >> 16),
															(uint8_t)(ip_address >> 24)
									);				
					}
					else
					{
						/* DHCP timeout */
						if (tries++ > MAX_DHCP_TRIES)
						{
							dhcp_state = DHCP_TIMEOUT;

							/* Stop DHCP */
							dhcp_stop(&network_settings->network_if);

							/* Static address used */
                            network_address_to_host( &ipaddr, network_get_ip( network_settings ) );
							network_address_to_host( &netmask, network_get_netmask( network_settings ) );
                            network_address_to_host( &gw, network_get_gateway( network_settings ) );
                            
							netif_set_addr(network_get_netif(network_settings), &ipaddr , &netmask, &gw);

					        SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "DHCP timeout" );
							SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "Static IP Address %d.%d.%d.%d",
															network_address_octet( network_get_ip( network_settings ), 0 ),
															network_address_octet( network_get_ip( network_settings ), 1 ),
															network_address_octet( network_get_ip( network_settings ), 2 ),
															network_address_octet( network_get_ip( network_settings ), 3 )
										);
						}
						else
						{
							caribou_thread_sleep_current(100);
						}
					}
				}
				break;
			case DHCP_ADDRESS_ASSIGNED:
					return;
				break;
			case DHCP_TIMEOUT:
					return;
			default: 
				break;
		}
	}   


}

