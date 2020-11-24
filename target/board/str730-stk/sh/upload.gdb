#Upload FLASH - ARM GDB for OpenOCD
#######################################
target remote localhost:3333
set remotetimeout 60
mon reset init
mon reset halt
mon soft_reset_halt
mon reset halt
mon wait_halt 1000
mon poll
mon flash protect 0 0 7 off
mon flash write_image erase obj/Debug/caribou_demo.s19 0x00000000 s19
mon flash protect 0 0 7 on
mon soft_reset_halt
mon wait_halt 1000
mon exit
quit
