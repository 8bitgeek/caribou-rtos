MCU_CHIP	 	= stm32f0xx
MCU_CORE     	= cortex-m0
MCU_FLOAT    	= softfp
CORTEX_VER   	= $(ENV_CORTEX_VER)
OPENOCD_TARGET 	= stm32f0x

LIBS += $(GCC_ROOT)$(GCC_LIB)/thumb/$(CORTEX_VER)/nofp/libgcc.a
LIBS += $(GCC_ROOT)$(GCC_LIB)/../../../../arm-none-eabi/lib/thumb/$(CORTEX_VER)/nofp/libm.a
LIBS += $(GCC_ROOT)$(GCC_LIB)/../../../../arm-none-eabi/lib/thumb/$(CORTEX_VER)/nofp/libstdc++_nano.a

CFLAGS += -DUSART_QUEUE_SZ=64 -DHSE_VALUE=8000000U -DCARIBOU_FLOAT=1 -DEZBUS_USART_NO=0 -DSTM32L431xx=1
CFLAGS += -fshort-enums -fsigned-char -mlittle-endian -mthumb -mthumb-interwork -mcpu=$(MCU_CORE) -mfloat-abi=$(MCU_FLOAT)
CFLAGS += -DEZBUS_SPEED_DEF=1500000

# sources
include ${SRC_ROOT}/bsp/${TARGET}/_src.mk
