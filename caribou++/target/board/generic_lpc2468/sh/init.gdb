#Initialize ARM GDB for OpenOCD debugging
#########################################
file obj/Debug/caribou_demo.elf
target remote localhost:3333

mon reset init
mon wait_halt 1000
mon mww 0xe01FC040 1
mon arm7_9 dcc_downloads enable
mon arm7_9 fast_memory_access enable

mon poll on

set print demangle on
set print pretty on

mon gdb_sync

directory ./
directory ../
directory ../src
directory ../driver_lpc2468/src

mon reset halt
mon wait_halt 1000
mon soft_reset_halt
mon wait_halt 1000
tb main
jump _start
