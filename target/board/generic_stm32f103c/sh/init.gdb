#Initialize ARM GDB for OpenOCD debugging
#######################################
#setup search directories
file obj/Debug/caribou_demo.elf
target remote localhost:3333
set architecture auto
mon reset halt
mon wait_halt 500
mon poll on

#set some debugging parameters
set print demangle on
set print pretty on

tbreak main
jump _start
