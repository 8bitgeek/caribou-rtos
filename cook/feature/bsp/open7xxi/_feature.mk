MCU_CHIP	 	= stm32f7xx
MCU_CORE     	= cortex-m7
MCU_FLOAT    	= soft
CORTEX_VER   	= $(ENV_CORTEX_VER)
OPENOCD_TARGET 	= stm32f7x

CFLAGS_COMMON += -fshort-enums -fsigned-char -mlittle-endian -mthumb -mthumb-interwork -mcpu=$(MCU_CORE) -mfloat-abi=$(MCU_FLOAT)
CFLAGS_COMMON += -DHSE_VALUE=8000000U 
CFLAGS_COMMON += -DEZBUS_USE_FLOW_CALLBACK=1
CFLAGS_COMMON += -DPIEZO_MAX_DAC_PWR=0x0CFF
CFLAGS_COMMON += -DCARIBOU_FLOAT=1 -DSTM32F746xx=1 -DUSART_QUEUE_SZ=512
CFLAGS_COMMON += -DAFX_MAX_PACKET_SZ=1024
CFLAGS_COMMON += -DEZBUS_USART_NO=5 -DEZBUS_SPEED_DEF=1500000
CFLAGS_COMMON += -DEZBUS_USE_RX_DMA=1 
CFLAGS_COMMON += -DCARIBOU_TEST_VECTOR_BOUNDS=1
#CFLAGS_COMMON += -DEZBUS_LOG_SOCKET=1 
#CFLAGS_COMMON += -DEZBUS_LOG_PEERS=1 -DEZBUS_LOG_PORT=1 -DEZBUS_LOG_RECEIVER_ERR=1

# sources
include ${SRC_ROOT}/bsp/${TARGET}/_src.mk
