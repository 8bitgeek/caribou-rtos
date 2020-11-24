#ifndef _NETWORK_ADDRESS_H
#define _NETWORK_ADDRESS_H

#include <board.h>
#include <lwip/tcpip.h>

#ifdef __cplusplus
 extern "C" {
#endif

typedef struct
{
    uint8_t     octet[4];
} network_address_t;

#define     NETWORK_ADDRESS_DECL(n,a,b,c,d) network_address_t n = {{a,b,c,d}}

void                network_address_init        (network_address_t* network_address, uint8_t octet0, uint8_t octet1, uint8_t octet2, uint8_t octet3);
uint8_t             network_address_octet       (network_address_t* network_address, uint8_t at);
uint32_t            network_address_word        (network_address_t* network_address);
void                network_address_copy        (network_address_t* dst, network_address_t* src);
ip_addr_t*          network_address_to_host     (ip_addr_t* ip_addr, network_address_t* network_address);
network_address_t*  network_address_from_host   (network_address_t* network_address, ip_addr_t* ip_addr);

#ifdef __cplusplus
}
#endif

#endif

