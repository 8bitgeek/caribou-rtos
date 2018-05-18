#Initialize ARM GDB for OpenOCD debugging
#######################################

file obj/Debug/caribou_demo.elf
target remote localhost:3333

#mon reset_config srst_only srst_open_drain
#mon reset_config srst_only srst_pulls_trst srst_open_drain

#jtag arp_init-reset_config

mon reset halt
mon wait_halt 500

mon poll on

#set some debugging parameters
set print demangle on
set print pretty on

#setup the target
mon gdb_breakpoint_override hard
mon cortex_m3 vector_catch none
#mon cortex_m3 vector_catch bus_err
#mon cortex_m3 vector_catch hard_err
mon gdb_sync

set remote hardware-breakpoint-limit 6
set remote hardware-watchpoint-limit 4

#setup search directories
directory ../src

#mask interupts when we stop, re-enable when we turn back on.
define hook-step
mon cortex_m3 maskisr on
end

define hookpost-step
mon cortex_m3 maskisr off
end

define hook-next
mon cortex_m3 maskisr on
end

define hook-continue
mon cortex_m3 maskisr off
end

define hook-stop
mon cortex_m3 maskisr on
end

# run to main
tbreak main
jump _start
