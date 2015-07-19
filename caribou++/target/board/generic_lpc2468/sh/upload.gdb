#Upload FLASH - ARM GDB for OpenOCD
#######################################
target remote localhost:3333
set remotetimeout 60
mon jtag init
mon jtag_ntrst_delay 100
mon jtag_ntrst_assert_width 100
mon jtag_reset trst_active
mon trst_and_srst separate srst_nogate trst_open_drain srst_open_drain
mon arm7_9 dcc_downloads enable
mon reset init
mon wait_halt 2000
mon reset halt
mon wait_halt 2000
mon arm7_9 dcc_downloads enable
mon poll
#mon flash protect 0 0 27 off
# enable user FLASH in MEMMAP register
mon mww 0xe01FC040 1
mon flash write_image erase unlock obj/Debug/caribou_demo.s19 0x00000000 s19 calc_checksum
#mon flash protect 0 0 27 on
#mon reset halt
#mon wait_halt 1000
#mon arm7_9 dcc_downloads enable
mon exit
quit

