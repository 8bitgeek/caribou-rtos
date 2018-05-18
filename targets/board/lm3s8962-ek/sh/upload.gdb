#Upload FLASH - ARM GDB for OpenOCD
#######################################
target remote localhost:3333
set remotetimeout 60
mon reset halt
mon wait_halt 500
mon flash write_image erase obj/Debug/caribou_demo.hex 0x00000000 ihex
mon reset halt
mon wait_halt 500
mon exit
quit
