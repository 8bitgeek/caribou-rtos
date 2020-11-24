#ifndef _NETWORK_DHCP_H
#define _NETWORK_DHCP_H

#include <network.h>

#ifdef __cplusplus
 extern "C" {
#endif

extern void network_dhcp_start      (network_settings_t* network_settings);
extern bool network_dhcp_finished   (network_settings_t* network_settings);

#ifdef __cplusplus
}
#endif

#endif

