# src-bsp-afx-102

SRC_BSP=${SRC_ROOT}/_bsp/${TARGET}
INC += -I $(SRC_BSP)

# ** CARIBOU
SRC_CARIBOU  = ${ENV_CARIBOU_ROOT}
INC          += -I $(SRC_CARIBOU)/caribou/include
CHIP 		 = $(SRC_CARIBOU)/target/chip/stm32/stm32f746
STM32_LIB	 = $(CHIP)/lib


CHIP_LIB         		= $(STM32_LIB)
CHIP_LIB_SRC     		= $(CHIP_LIB)/STM32F7xx_HAL_Driver/Src
CHIP_LIB_INCLUDE 		= $(CHIP_LIB)/STM32F7xx_HAL_Driver/Inc

LIB_CMSIS 				= $(CHIP_LIB)/CMSIS
LIB_CMSIS_INCLUDE 		= $(LIB_CMSIS)/Include

CHIP_LIB_CMSIS	 		= $(LIB_CMSIS)/Device/ST/STM32F7xx
CHIP_LIB_CMSIS_INCLUDE	= $(CHIP_LIB_CMSIS)/Include

INC += -I $(LIB_CMSIS_INCLUDE)
INC += -I $(CHIP_LIB_INCLUDE) 
INC += -I $(CHIP_LIB_CMSIS_INCLUDE)
INC += -I $(SRC_CARIBOU)/target/chip/stm32/stm32f746/include/stm32f746bgt6
INC += -I $(SRC_CARIBOU)/target/cpu/arm/cortex-m7

SRCS_CC += $(SRC_CARIBOU)/target/cpu/arm/$(MCU_CORE)/cpu/cpu.c

SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_ll_fmc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_hal_sdram.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_hal_adc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_hal_tim.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_hal_rcc.c
SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_hal_usart.c 	
SRCS_CC += $(CHIP_LIB_SRC)/stm32f7xx_hal_uart.c 	

SRCS_CC += $(CHIP)/src/chip.c
# SRCS_CC += $(CHIP)/src/fault.c
SRCS_CC += $(CHIP)/src/gpio.c
SRCS_CC += $(CHIP)/src/uart.c

SRCS_CC += $(SRC_BSP)/system_stm32f7xx.c

SRCS_CC += $(SRC_BSP)/board.c
SRCS_CC += $(SRC_BSP)/hw_clocks.c
SRCS_CC += $(SRC_BSP)/hw_dma.c
SRCS_CC += $(SRC_BSP)/hw_exti.c
SRCS_CC += $(SRC_BSP)/hw_fault.c
SRCS_CC += $(SRC_BSP)/hw_gpio.c
SRCS_CC += $(SRC_BSP)/hw_pin.c
SRCS_CC += $(SRC_BSP)/hw_spi.c
SRCS_CC += $(SRC_BSP)/hw_tim.c
SRCS_CC += $(SRC_BSP)/hw_usart.c
SRCS_CC += $(SRC_BSP)/hw_dac.c
SRCS_CC += $(SRC_BSP)/hw_pwm.c
SRCS_CC += $(SRC_BSP)/hw_adc.c
SRCS_CC += $(SRC_BSP)/hw_sdram.c

SRCS_AS += $(SRC_BSP)/crt0.S
SRCS_AS += $(SRC_BSP)/vectors.S
