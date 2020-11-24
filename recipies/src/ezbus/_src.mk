# ** EZBUS
SRC_EZBUS=${ENV_EZBUS_ROOT}
INC += 	-I $(SRC_EZBUS) \
		-I $(SRC_EZBUS)/mac \
		-I $(SRC_EZBUS)/common \
		-I $(SRC_EZBUS)/socket \
		-I $(SRC_EZBUS)/platform


SRCS_CC += $(SRC_EZBUS)/ezbus.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_arbiter.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_arbiter_receive.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_arbiter_transmit.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_token.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_coldboot_minor.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_coldboot_major.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_coldboot.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_warmboot.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_transmitter.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_receiver.c
SRCS_CC += $(SRC_EZBUS)/mac/ezbus_mac_peers.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_fault.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_hex.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_log.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_address.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_crc.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_crc32.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_packet.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_parcel.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_port.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_peer.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_flip.c
SRCS_CC += $(SRC_EZBUS)/common/ezbus_timer.c
SRCS_CC += $(SRC_EZBUS)/socket/ezbus_socket.c
SRCS_CC += $(SRC_EZBUS)/socket/ezbus_socket_common.c
SRCS_CC += $(SRC_EZBUS)/socket/ezbus_socket_callback.c
SRCS_CC += $(SRC_EZBUS)/platform/ezbus_platform.c

# ezbus BSP callbacks
INC += -I $(SRC_BSP)/ezbus
SRCS_CC += $(SRC_BSP)/ezbus/ezbus_callback.c

