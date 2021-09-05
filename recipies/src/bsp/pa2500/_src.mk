# src-bsp-pa2500

SRC_BSP=${SRC_ROOT}/_bsp/${TARGET}
INC += -I $(SRC_BSP)

# ** CARIBOU
SRC_CARIBOU  = ${ENV_CARIBOU_ROOT}
INC          += -I $(SRC_CARIBOU)/caribou/include
CHIP 		 = $(SRC_CARIBOU)/target/chip/stm32/stm32l431
STM32_LIB	 = $(CHIP)/lib


CHIP_LIB         		= $(STM32_LIB)
CHIP_LIB_SRC     		= $(CHIP_LIB)/STM32L4xx_HAL_Driver/Src
CHIP_LIB_INCLUDE 		= $(CHIP_LIB)/STM32L4xx_HAL_Driver/Inc

LIB_CMSIS 				= $(CHIP_LIB)/CMSIS
LIB_CMSIS_INCLUDE 		= $(LIB_CMSIS)/Include

CHIP_LIB_CMSIS	 		= $(LIB_CMSIS)/Device/ST/STM32L4xx
CHIP_LIB_CMSIS_INCLUDE	= $(CHIP_LIB_CMSIS)/Include

INC += -I $(LIB_CMSIS_INCLUDE)
INC += -I $(CHIP_LIB_INCLUDE) 
INC += -I $(CHIP_LIB_CMSIS_INCLUDE)
INC += -I $(SRC_CARIBOU)/target/chip/stm32/stm32l431/include/stm32l431c
INC += -I $(SRC_CARIBOU)/target/cpu/arm/cortex-m4

SRCS_CC += $(SRC_CARIBOU)/target/cpu/arm/$(MCU_CORE)/cpu/cpu.c

SRCS_CC += $(CHIP_LIB_SRC)/stm32l4xx_hal_adc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32l4xx_hal_tim.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32l4xx_hal_rcc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32l4xx_hal_usart.c 	


SRCS_CC += $(CHIP)/src/chip.c
# SRCS_CC += $(CHIP)/src/fault.c
SRCS_CC += $(CHIP)/src/gpio.c
SRCS_CC += $(CHIP)/src/uart.c

# network
include ${SRC_ROOT}/network/_src.mk
INC += -I $(SRC_BSP)/net 
SRCS_CC += $(SRC_BSP)/net/net.c

# CARIBOU++
include ${SRC_ROOT}/cariboupp/_src.mk
include ${SRC_ROOT}/cariboupp/net/_src.mk

# lwip
include ${SRC_ROOT}/lwip/_src.mk
INC += -I $(SRC_BSP)/arch
INC += -I $(SRC_BSP)/netif
SRCS_CC += $(SRC_BSP)/arch/sys_arch.c
SRCS_CC += $(SRC_BSP)/netif/enc28j60.c
SRCS_CC += $(SRC_BSP)/netif/ethernetif.c

# modbus port
include ${SRC_ROOT}/freemodbus/_src.mk
INC += -I $(SRC_BSP)/modbus/port
SRCS_CC += $(SRC_BSP)/modbus/port/portevent.c
SRCS_CC += $(SRC_BSP)/modbus/port/portother.c
SRCS_CC += $(SRC_BSP)/modbus/port/porttcp.c

SRCS_CC += $(SRC_BSP)/system_stm32l4xx.c

SRCS_CC += $(SRC_BSP)/board.c
SRCS_CC += $(SRC_BSP)/hw_clocks.c
SRCS_CC += $(SRC_BSP)/hw_dma.c
SRCS_CC += $(SRC_BSP)/hw_exti.c
SRCS_CC += $(SRC_BSP)/hw_fault.c
SRCS_CC += $(SRC_BSP)/hw_gpio.c
SRCS_CC += $(SRC_BSP)/hw_pin.c
SRCS_CC += $(SRC_BSP)/hw_spi.c
SRCS_CC += $(SRC_BSP)/hw_tim.c
SRCS_CC += $(SRC_BSP)/hw_lptim.c
SRCS_CC += $(SRC_BSP)/hw_usart.c
SRCS_CC += $(SRC_BSP)/hw_dac.c
SRCS_CC += $(SRC_BSP)/hw_pwm.c
SRCS_CC += $(SRC_BSP)/hw_opamp.c
SRCS_CC += $(SRC_BSP)/hw_adc.c

SRCS_AS += $(SRC_BSP)/crt0.S
SRCS_AS += $(SRC_BSP)/vectors.S
