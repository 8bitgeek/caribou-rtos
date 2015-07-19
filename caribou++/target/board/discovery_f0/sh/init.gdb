#Initialize ARM GDB for OpenOCD debugging
#######################################
#setup search directories
directory ../src
file obj/Debug/caribou_demo.elf
set architecture auto
target remote localhost:3333
mon reset halt
mon wait_halt 500
mon poll on

#set some debugging parameters
set print demangle on
set print pretty on

tbreak main
cont
