#    _________    ____  ________  ____  __  __   ____  __________  _____
#   / ____/   |  / __ \/  _/ __ )/ __ \/ / / /  / __ \/_  __/ __ \/ ___/
#  / /   / /| | / /_/ // // __  / / / / / / /  / /_/ / / / / / / /\__ \ 
# / /___/ ___ |/ _, _// // /_/ / /_/ / /_/ /  / _, _/ / / / /_/ /___/ / 
# \____/_/  |_/_/ |_/___/_____/\____/\____/  /_/ |_| /_/  \____//____/  
3                                                                      
#
# Copyleft © 2018 by Mike Sharkey 
# mike@pikeaero.com        
#
# This file is part of CARIBOU RTOS
#
# CARIBOU RTOS is free software: you can redistribute it and/or modify
# it under the terms of the Beerware License Version 43.
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 43):
# <mike@pikeaero.com> wrote this file. As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
# ---------------------------------------------------------------------------- 

CC      = arm-none-eabi-gcc
LD      = arm-none-eabi-ld -v
AR      = arm-none-eabi-ar
AS      = arm-none-eabi-as
CP      = arm-none-eabi-objcopy
OD		= arm-none-eabi-objdump
  
CFLAGS  =  -I./ -I./stdlib/inc -DSTM32F10X_MD -fno-common -O0 -g -mcpu=cortex-m4 -mthumb 
AFLAGS  = -ahls -mapcs-32
LFLAGS  = 
CPFLAGS = 
ODFLAGS	= 

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	$(AS) $(AFLAGS) -o $@ $<

BASENAME	=	main
OUTFILE		=	$(BASENAME).out
BINFILE		=	$(BASENAME).bin
DUMPFILE	=	$(BASENAME).list

LAYOUT		=	layout.cmd

OBJS		=	main.o

build: $(BINFILE)

obj: $(OBJS)

clean:
	find . -name '*.o'		-delete
	find . -name '*.list'	-delete
	find . -name '*.out'	-delete
	find . -name '*.bin'	-delete

$(OUTFILE): $(OBJS)
	$(LD) $(LFLAGS) -nostartfiles -T $(LAYOUT) -o $(OUTFILE) $(OBJS)

$(BINFILE): $(OUTFILE)
	$(CP) $(CPFLAGS) -Obinary -j .text $(OUTFILE) $(BINFILE)
	$(OD) $(ODFLAGS) -D $(OUTFILE) > $(DUMPFILE)

flash: $(BINFILE)
	./flasher $(BINFILE)
