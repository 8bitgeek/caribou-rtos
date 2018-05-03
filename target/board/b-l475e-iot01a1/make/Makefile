# Binaries will be generated with this name (.elf, .bin, .hex, etc)
PROJ_NAME=discovery_f4_demo

# Put your stlink folder here so make burn will work.
STLINK=~/stlink

# Put your CARIBOU folders here
CARIBOU_CHIP=stm32f407vgt6
CARIBOU=~/Documents/caribou-rtos/branches/0.9
CARIBOU_TARGET=$(CARIBOU)/caribou/target
CARIBOU_TARGET_CHIP=$(CARIBOU_TARGET)/chip/stm32/stm32f407
CARIBOU_TARGET_CPU=$(CARIBOU_TARGET)/cpu/arm/cortex-m4
CARIBOU_TARGET_BOARD=../

# Include files from CARIBOU libraries
CFLAGS += -isystem $(CARIBOU)/caribou/include
CFLAGS += -isystem $(CARIBOU_TARGET_CHIP)/include/$(CARIBOU_CHIP)
CFLAGS += -isystem $(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/inc
CFLAGS += -isystem $(CARIBOU_TARGET_CHIP)/lib/STM32F4x7_ETH_Driver/inc
CFLAGS += -isystem $(CARIBOU_TARGET_CHIP)/lib/CMSIS/Include
CFLAGS += -isystem $(CARIBOU_TARGET_CHIP)/lib/CMSIS/Device/ST/STM32F4xx/Include
CFLAGS += -isystem $(CARIBOU_TARGET_BOARD)/include
CFLAGS += -isystem $(CARIBOU_TARGET_CPU)

# Build Constants
CFLAGS += -std=c99
CFLAGS += -D STM32F40XX
CFLAGS += -D ARM_FVP_LAZY_STACKING
CFLAGS += -D USE_STDPERIPH_DRIVER
CFLAGS += -D CARIBOU_BITMAP_HEAP

# Put your source files here (or *.c, etc)
SRCS=	$(CARIBOU_TARGET)/cpu/arm/cortex-m4/cpu/cpu.c	\
	$(CARIBOU)/caribou/src/dev/adc.c		\
	$(CARIBOU)/caribou/src/dev/gpio.c		\
	$(CARIBOU)/caribou/src/dev/i2c.c		\
	$(CARIBOU)/caribou/src/dev/i2s.c		\
	$(CARIBOU)/caribou/src/dev/spi.c		\
	$(CARIBOU)/caribou/src/dev/uart.c		\
	$(CARIBOU)/caribou/src/kernel/caribou.c		\
	$(CARIBOU)/caribou/src/kernel/interrupt.c	\
	$(CARIBOU)/caribou/src/kernel/swi.c		\
	$(CARIBOU)/caribou/src/kernel/thread.c		\
	$(CARIBOU)/caribou/src/kernel/timer.c		\
	$(CARIBOU)/caribou/src/lib/bitmap_heap.c	\
	$(CARIBOU)/caribou/src/lib/bytequeue.c		\
	$(CARIBOU)/caribou/src/lib/cbmath.c		\
	$(CARIBOU)/caribou/src/lib/errno.c		\
	$(CARIBOU)/caribou/src/lib/heap.c		\
	$(CARIBOU)/caribou/src/lib/mutex.c		\
	$(CARIBOU)/caribou/src/lib/nova_heap.c		\
	$(CARIBOU)/caribou/src/lib/qsort.c		\
	$(CARIBOU)/caribou/src/lib/queue.c		\
	$(CARIBOU)/caribou/src/lib/rand.c		\
	$(CARIBOU)/caribou/src/lib/semaphore.c		\
	$(CARIBOU)/caribou/src/lib/spinlock.c		\
	$(CARIBOU)/caribou/src/lib/stdio.c		\
	$(CARIBOU)/caribou/src/lib/string.c		\
	$(CARIBOU_TARGET_CHIP)/src/adc.c	\
	$(CARIBOU_TARGET_CHIP)/src/chip.c	\
	$(CARIBOU_TARGET_CHIP)/src/crt0.S	\
	$(CARIBOU_TARGET_CHIP)/src/fault.c	\
	$(CARIBOU_TARGET_CHIP)/src/gpio.c	\
	$(CARIBOU_TARGET_CHIP)/src/i2c.c	\
	$(CARIBOU_TARGET_CHIP)/src/i2s.c	\
	$(CARIBOU_TARGET_CHIP)/src/spi.c	\
	$(CARIBOU_TARGET_CHIP)/src/uart.c	\
	$(CARIBOU_TARGET_CHIP)/src/vectors.S	\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/misc.c			\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_adc.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_can.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_crc.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_cryp_aes.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_cryp.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_cryp_des.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_cryp_tdes.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dac.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dbgmcu.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dcmi.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_dma.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_exti.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_flash.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_fsmc.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_gpio.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_hash.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_hash_md5.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_hash_sha1.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_i2c.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_iwdg.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_pwr.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rcc.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rng.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_rtc.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_sdio.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_spi.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_syscfg.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_tim.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_usart.c		\
	$(CARIBOU_TARGET_CHIP)/lib/STM32F4xx_StdPeriph_Driver/src/stm32f4xx_wwdg.c
	

# Normally you shouldn't need to change anything below this line!
#######################################################################################

CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS += -g -O2 -Wall -T../ld/caribou-rom.ld 
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork
CFLAGS += -mfloat-abi=soft -mfpu=fpv4-sp-d16
CFLAGS += -I.

OBJS = $(SRCS:.c=.o)

.PHONY: proj

all: proj

proj: $(PROJ_NAME).elf

$(PROJ_NAME).elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o $@ 
	$(OBJCOPY) -O ihex $(PROJ_NAME).elf $(PROJ_NAME).hex
	$(OBJCOPY) -O binary $(PROJ_NAME).elf $(PROJ_NAME).bin

clean:
	rm -f *.o $(PROJ_NAME).elf $(PROJ_NAME).hex $(PROJ_NAME).bin

# Flash the STM32F4
burn: proj
	$(STLINK)/st-flash write $(PROJ_NAME).bin 0x8000000
