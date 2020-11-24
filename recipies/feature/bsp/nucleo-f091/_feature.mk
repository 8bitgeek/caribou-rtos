MCU_CHIP	 	= stm32f0xx
MCU_CORE     	= cortex-m0
MCU_FLOAT    	= softfp
CORTEX_VER   	= $(ENV_CORTEX_VER)
OPENOCD_TARGET 	= stm32f0x

CFLAGS_COMMON += -fshort-enums -fsigned-char -mlittle-endian -mthumb -mthumb-interwork -mcpu=$(MCU_CORE) -mfloat-abi=$(MCU_FLOAT)
CFLAGS_COMMON += -DUSART_QUEUE_SZ=64 -DHSE_VALUE=8000000U -DCARIBOU_FLOAT=1 -DSTM32F030xx=1
CFLAGS_COMMON += -DEZBUS_SPEED_DEF=1500000 -DEZBUS_USART_NO=0 -DEZBUS_USE_RX_DMA=1
CFLAGS_COMMON += -DEZBUS_LOG_SOCKET=1 -DEZBUS_LOG_PEERS=1 -DEZBUS_LOG_PORT=1 -DEZBUS_LOG_RECEIVER_ERR=1 
CFLAGS_COMMON += -DENC28J60_USE_DMA=1

# sources
include ${SRC_ROOT}/bsp/${TARGET}/_src.mk
