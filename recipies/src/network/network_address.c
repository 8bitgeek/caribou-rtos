#include <network_address.h>

void  network_address_init (network_address_t* network_address, uint8_t octet0, uint8_t octet1, uint8_t octet2, uint8_t octet3)
{
    network_address->octet[0] = octet0;
    network_address->octet[1] = octet1;
    network_address->octet[2] = octet2;
    network_address->octet[3] = octet3;
}

uint8_t network_address_octet(network_address_t* network_address, uint8_t at)
{
    uint8_t octet = 0;
    if ( at < 4 )
        octet = network_address->octet[at];
    return octet;
}

uint32_t network_address_word(network_address_t* network_address)
{
    uint32_t word = 0;
    word |= network_address->octet[0]<<24;
    word |= network_address->octet[1]<<16;
    word |= network_address->octet[2]<<8;
    word |= network_address->octet[3];
    return word;
}

void network_address_copy (network_address_t* dst, network_address_t* src)
{
    memcpy(dst,src,sizeof(network_address_t));
}

ip_addr_t*  network_address_to_host (ip_addr_t* ip_addr, network_address_t* network_address)
{
    IP4_ADDR( ip_addr, network_address->octet[0], network_address->octet[1], network_address->octet[2], network_address->octet[3] );
    return ip_addr;
}

network_address_t* network_address_from_host(network_address_t* network_address, ip_addr_t* ip_addr)
{
    network_address->octet[0]=(uint8_t)(ip_addr->addr);
	network_address->octet[1]=(uint8_t)(ip_addr->addr >> 8);
	network_address->octet[2]=(uint8_t)(ip_addr->addr >> 16);
	network_address->octet[3]=(uint8_t)(ip_addr->addr >> 24);
    return network_address;
}
