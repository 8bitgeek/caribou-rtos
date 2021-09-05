# src-bsp-pa2500

SRC_BSP=${SRC_ROOT}/_bsp/${TARGET}
INC += -I $(SRC_BSP)

# ** CARIBOU
SRC_CARIBOU  = ${ENV_CARIBOU_ROOT}
INC          += -I $(SRC_CARIBOU)/caribou/include
CHIP 		 = $(SRC_CARIBOU)/target/chip/gd32/gd32vf103
GD32_LIB	 = $(CHIP)/lib


CHIP_LIB         		= $(GD32_LIB)
CHIP_LIB_SRC     		= $(CHIP_LIB)/src
CHIP_LIB_INCLUDE 		= $(CHIP_LIB)/include

LIB_CMSIS 				= $(CHIP_LIB)/CMSIS
LIB_CMSIS_INCLUDE 		= $(LIB_CMSIS)/Include

CHIP_LIB_CMSIS	 		= $(LIB_CMSIS)/ST/STM32F0xx
CHIP_LIB_CMSIS_INCLUDE	= $(CHIP_LIB_CMSIS)/Include

INC += -I $(LIB_CMSIS_INCLUDE)
INC += -I $(CHIP_LIB_INCLUDE) 
INC += -I $(CHIP_LIB_CMSIS_INCLUDE)
INC += -I $(SRC_CARIBOU)/target/chip/stm32/stm32f091/include/stm32f091rc
INC += -I $(SRC_CARIBOU)/target/cpu/arm/cortex-m0

# SRCS_CC += $(SRC_CARIBOU)/target/cpu/arm/$(MCU_CORE)/cpu/cpu.c

SRCS_CC += $(CHIP_LIB_SRC)/stm32f0xx_adc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f0xx_tim.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f0xx_rcc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f0xx_usart.c 	


SRCS_CC += $(CHIP)/src/chip.c
# SRCS_CC += $(CHIP)/src/fault.c
SRCS_CC += $(CHIP)/src/gpio.c
SRCS_CC += $(CHIP)/src/uart.c


SRCS_CC += $(SRC_BSP)/system_stm32f0xx.c

SRCS_CC += $(SRC_BSP)/board.c
SRCS_CC += $(SRC_BSP)/hw_clocks.c
SRCS_CC += $(SRC_BSP)/hw_fault.c
SRCS_CC += $(SRC_BSP)/hw_gpio.c
SRCS_CC += $(SRC_BSP)/hw_pin.c
SRCS_CC += $(SRC_BSP)/hw_usart.c

SRCS_AS += $(SRC_BSP)/crt0.S
SRCS_AS += $(SRC_BSP)/vectors.S
