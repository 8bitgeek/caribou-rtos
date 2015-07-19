#Upload FLASH - ARM GDB for OpenOCD
#######################################
set architecture auto
target remote localhost:3333
set remotetimeout 60
mon reset halt
mon wait_halt 500

#set some debugging parameters
set print demangle on
set print pretty on

#setup the target
mon gdb_breakpoint_override hard
mon cortex_m0 vector_catch none
mon gdb_sync

#mask interupts when we stop, re-enable when we turn back on.
define hook-continue
mon cortex_m0 maskisr off
end
define hook-stop
mon cortex_m0 maskisr on
end

mon flash write_image erase obj/Debug/caribou_demo.hex 0x00000000 ihex
mon reset halt
mon wait_halt 500
mon exit
quit
