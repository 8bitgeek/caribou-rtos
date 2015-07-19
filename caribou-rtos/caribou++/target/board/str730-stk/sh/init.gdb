#Initialize ARM GDB for OpenOCD debugging
#######################################
file obj/Debug/caribou_demo.elf
target remote localhost:3333
mon reset halt
mon wait_halt 1000
mon arm7_9 dcc_downloads enable
mon soft_reset_halt
mon wait_halt 1000
mon poll on

set print demangle on
set print pretty on

#mon gdb_breakpoint_override hard
#mon cortex_m3 vector_catch none
mon gdb_sync

set remote hardware-breakpoint-limit 2

#setup search directories
directory ./
directory ../
directory ../src
directory ../driver_str730/src

#run to main
mon reset halt
mon wait_halt 1000
mon soft_reset_halt
mon wait_halt 1000
tb main
#break main
#break _start
jump _start
