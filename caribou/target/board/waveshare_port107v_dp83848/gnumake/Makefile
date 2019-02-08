#/******************************************************************************
#* Copyright © 2014 by Pike Aerospace Research Corporation
#* All Rights Reserved
#*
#*   This file is part of CARIBOU RTOS
#*
#*   CARIBOU RTOS is free software: you can redistribute it and/or modify
#*   it under the terms of the Beerware License Version 43.
#*
#* ----------------------------------------------------------------------------
#* "THE BEER-WARE LICENSE" (Revision 43):
#* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
#* can do whatever you want with this stuff. If we meet some day, and you think
#* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
#* ----------------------------------------------------------------------------
#******************************************************************************/
TARGET=caribou_rtos_demo.elf
CARIBOU_RTOS=/home/mike/Documents/caribou-rtos/branches/0.9/caribou
BOARD=lc_studio_stm32f103r
CHIP_FAMILY=stm32/stm32f103/
CHIP=stm32f103rbt6
CPU_FAMILY=arm
CPU=cortex-m3
CHIP_DEF=-D STM32F10X_MD

GCC_PATH=/opt/MentorGraphics/Sourcery_CodeBench_Lite_for_ARM_EABI

CC=$(GCC_PATH)/bin/arm-none-eabi-gcc
CXX=$(GCC_PATH)/bin/arm-none-eabi-g++
AS=$(GCC_PATH)/bin/arm-none-eabi-as

CFLAGS=	-mthumb				\
	-msoft-float			\
	-mlittle-endian			\
	-mapcs-frame			\
	-w				\
	-g				\
	-mcpu=$(CPU)			\
	-pipe				\
	-ggdb				\
	-std=gnu99			\
	-fno-builtin			\
	-fno-unwind-tables		\
	-fno-use-cxa-atexit		\
	-fno-math-errno			\
	-fmerge-all-constants		\
	-fno-rtti			\
	-fno-exceptions			\
	-DUSE_STDPERIPH_DRIVER		\
	-DPLL_SOURCE_HSI
	
AFLAGS=	-mthumb				\
	-mlittle-endian			\
	-mapcs-frame			\
	-w				\
	-g				\
	-mcpu=$(CPU)			\
	-ggdb
	
	
CARIBOU_OPTS = -D CARIBOU_BITMAP_HEAP

CARIBOU_INC = \
	-I $(CARIBOU_RTOS)/include

TARGET_INC = \
	-I $(CARIBOU_RTOS)/target/board/$(BOARD)/include		\
	-I $(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/include/$(CHIP)	\
	-I $(CARIBOU_RTOS)/target/cpu/$(CPU_FAMILY)/$(CPU)

LIB_INC=-I $(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/lib/STM32F10x_StdPeriph_Driver/inc	\
	-I $(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/lib/CMSIS/CM3/DeviceSupport/ST/STM32F10x	\
	-I $(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/lib/CMSIS/CM3/CoreSupport

LIB_SRC=$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/lib/STM32F10x_StdPeriph_Driver/src

TARGET_OBJ = \
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/adc.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/chip.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/crt0.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/fault.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/gpio.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/i2c.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/i2s.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/spi.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/uart.o		\
	$(CARIBOU_RTOS)/target/chip/$(CHIP_FAMILY)/src/vectors.o	\
	$(CARIBOU_RTOS)/target/board/$(BOARD)/src/board.o

CARIBOU_OBJ = \
	$(CARIBOU_RTOS)/src/dev/adc.o		\
	$(CARIBOU_RTOS)/src/dev/gpio.o		\
	$(CARIBOU_RTOS)/src/dev/i2c.o		\
	$(CARIBOU_RTOS)/src/dev/i2s.o		\
	$(CARIBOU_RTOS)/src/dev/spi.o		\
	$(CARIBOU_RTOS)/src/dev/uart.o		\
	$(CARIBOU_RTOS)/src/kernel/caribou.o	\
	$(CARIBOU_RTOS)/src/kernel/interrupt.o	\
	$(CARIBOU_RTOS)/src/kernel/thread.o	\
	$(CARIBOU_RTOS)/src/kernel/timer.o	\
	$(CARIBOU_RTOS)/src/lib/bitmap_heap.o	\
	$(CARIBOU_RTOS)/src/lib/bytequeue.o	\
	$(CARIBOU_RTOS)/src/lib/cbmath.o	\
	$(CARIBOU_RTOS)/src/lib/errno.o		\
	$(CARIBOU_RTOS)/src/lib/heap.o		\
	$(CARIBOU_RTOS)/src/lib/mutex.o		\
	$(CARIBOU_RTOS)/src/lib/nova_heap.o	\
	$(CARIBOU_RTOS)/src/lib/qsort.o		\
	$(CARIBOU_RTOS)/src/lib/queue.o		\
	$(CARIBOU_RTOS)/src/lib/rand.o		\
	$(CARIBOU_RTOS)/src/lib/semaphore.o	\
	$(CARIBOU_RTOS)/src/lib/spinlock.o	\
	$(CARIBOU_RTOS)/src/lib/stdio.o		\
	$(CARIBOU_RTOS)/src/lib/string.o
	
LIB_OBJ = $(LIB_SRC)/misc.o			\
	$(LIB_SRC)/stm32f10x_adc.o		\
	$(LIB_SRC)/stm32f10x_bkp.o		\
	$(LIB_SRC)/stm32f10x_can.o		\
	$(LIB_SRC)/stm32f10x_cec.o		\
	$(LIB_SRC)/stm32f10x_crc.o		\
	$(LIB_SRC)/stm32f10x_dac.o		\
	$(LIB_SRC)/stm32f10x_dbgmcu.o		\
	$(LIB_SRC)/stm32f10x_dma.o		\
	$(LIB_SRC)/stm32f10x_exti.o		\
	$(LIB_SRC)/stm32f10x_flash.o		\
	$(LIB_SRC)/stm32f10x_fsmc.o		\
	$(LIB_SRC)/stm32f10x_gpio.o		\
	$(LIB_SRC)/stm32f10x_i2c.o		\
	$(LIB_SRC)/stm32f10x_iwdg.o		\
	$(LIB_SRC)/stm32f10x_pwr.o		\
	$(LIB_SRC)/stm32f10x_rcc.o		\
	$(LIB_SRC)/stm32f10x_rtc.o		\
	$(LIB_SRC)/stm32f10x_sdio.o		\
	$(LIB_SRC)/stm32f10x_spi.o		\
	$(LIB_SRC)/stm32f10x_tim.o		\
	$(LIB_SRC)/stm32f10x_usart.o		\
	$(LIB_SRC)/stm32f10x_wwdg.o

INC = $(CARIBOU_INC) $(TARGET_INC) $(LIB_INC)
OBJ = $(CARIBOU_OBJ) $(TARGET_OBJ) $(LIB_OBJ)


$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(LIBS)

%.o: %.cxx
	$(CXX) $(INC) $(CHIP_DEF) $(CARIBOU_OPTS) $(CXXFLAGS) -c $(input) -o $(output)
	
%.o: %.c $(DEPS)
	$(CC) $(INC) $(CHIP_DEF) $(CARIBOU_OPTS) -c -o $@ $< $(CFLAGS)

%.o: %.S $(DEPS)
	$(AS) $(INC) -c -o $@ $< $(AFLAGS)


clean:
	rm -f $(OBJ)
	