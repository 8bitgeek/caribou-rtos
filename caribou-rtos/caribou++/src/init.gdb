#Initialize ARM GDB for OpenOCD debugging
#######################################
file caribou++demo.elf
target remote localhost:3333
mon reset halt
mon wait_halt 500
mon poll on

#set some debugging parameters
set print demangle on
set print pretty on

#setup the target
mon gdb_breakpoint_override hard
mon cortex_m3 vector_catch none
mon gdb_sync

#setup search directories
directory ./

#mask interupts when we stop, re-enable when we turn back on.
define hook-continue
mon cortex_m3 maskisr off
end
define hook-stop
mon cortex_m3 maskisr on
end

#run to main
break main
#break _start
jump _start
