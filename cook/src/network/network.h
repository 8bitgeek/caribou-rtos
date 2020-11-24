#ifndef _SRC_NETWORK_H
#define _SRC_NETWORK_H

#include <board.h>

#include <lwip/mem.h>
#include <lwip/memp.h>
#include <lwip/dhcp.h>
#include <lwip/tcpip.h>
#include <netif/ethernetif.h>
#include <network_address.h>

#ifdef __cplusplus
 extern "C" {
#endif

typedef struct 
{
    bool    dhcp;
    bool    dhcp_busy;
    uint8_t mac[6];
    char    ifname[2];
    network_address_t   ip;
    network_address_t   netmask;
    network_address_t   gateway;
    network_address_t   multicast;
    struct netif        network_if; 
} network_settings_t;

extern struct netif network_if; 

extern  void                network_init            ( network_settings_t* network_settings, const uint8_t mac[], const char ifname[], bool dhcp );
extern  void                network_start           ( network_settings_t* network_settings );

extern  bool                network_get_dhcp        ( network_settings_t* network_settings );
extern  uint8_t*            network_get_mac         ( network_settings_t* network_settings );
extern  uint8_t*            network_get_ifname      ( network_settings_t* network_settings );
extern  struct netif*       network_get_netif       ( network_settings_t* network_settings );

extern  void                network_set_ip          ( network_settings_t* network_settings, network_address_t* network_address );
extern  void                network_set_netmask     ( network_settings_t* network_settings, network_address_t* network_address );
extern  void                network_set_gateway     ( network_settings_t* network_settings, network_address_t* network_address );
extern  void                network_set_multicast   ( network_settings_t* network_settings, network_address_t* network_address );

extern network_address_t*   network_get_ip          ( network_settings_t* network_settings );
extern network_address_t*   network_get_netmask     ( network_settings_t* network_settings );
extern network_address_t*   network_get_gateway     ( network_settings_t* network_settings );
extern network_address_t*   network_get_multicast   ( network_settings_t* network_settings );

#ifdef __cplusplus
}
#endif

#endif
