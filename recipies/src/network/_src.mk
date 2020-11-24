# network

SRC_NETWORK=${SRC_ROOT}/network
INC += -I $(SRC_NETWORK)

SRCS_CC += $(SRC_NETWORK)/network.c
SRCS_CC += $(SRC_NETWORK)/network_multicast.c
SRCS_CC += $(SRC_NETWORK)/network_dhcp.c
SRCS_CC += $(SRC_NETWORK)/network_address.c

