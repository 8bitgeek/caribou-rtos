	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"board.c"
	.text
.Ltext0:
	.section	.text.early_init,"ax",%progbits
	.align	1
	.global	early_init
	.code	16
	.thumb_func
	.type	early_init, %function
early_init:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../src/board.c"
	.loc 1 22 0
	.loc 1 23 0
	ldr	r3, .L2
	ldr	r1, .L2+4
	ldr	r2, [r3, #20]
	.loc 1 54 0
	mov	r0, #160
	.loc 1 23 0
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 30 0
	ldr	r2, [r3, #28]
	ldr	r1, .L2+8
	.loc 1 54 0
	lsl	r0, r0, #11
	.loc 1 30 0
	orr	r2, r1
	str	r2, [r3, #28]
	.loc 1 35 0
	ldr	r1, [r3, #24]
	mov	r2, #148
	lsl	r2, r2, #7
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 40 0
	mov	r2, #144
	mov	r3, #160
	lsl	r2, r2, #23
	lsl	r3, r3, #22
	str	r3, [r2]
	.loc 1 41 0
	mov	r3, #192
	lsl	r3, r3, #3
	strh	r3, [r2, #4]
	.loc 1 42 0
	ldr	r3, .L2+12
	.loc 1 49 0
	ldr	r1, .L2+16
	.loc 1 42 0
	str	r3, [r2, #8]
	.loc 1 43 0
	mov	r3, #144
	lsl	r3, r3, #22
	str	r3, [r2, #12]
	.loc 1 44 0
	mov	r3, #0
	str	r3, [r2, #32]
	.loc 1 45 0
	str	r3, [r2, #36]
	.loc 1 47 0
	ldr	r2, .L2+20
	.loc 1 74 0
	@ sp needed
	.loc 1 47 0
	str	r3, [r2]
	.loc 1 48 0
	strh	r3, [r2, #4]
	.loc 1 49 0
	str	r1, [r2, #8]
	.loc 1 50 0
	str	r3, [r2, #12]
	.loc 1 51 0
	str	r3, [r2, #32]
	.loc 1 52 0
	str	r3, [r2, #36]
	.loc 1 54 0
	ldr	r2, .L2+24
	str	r0, [r2]
	.loc 1 55 0
	strh	r3, [r2, #4]
	.loc 1 56 0
	str	r1, [r2, #8]
	.loc 1 57 0
	str	r3, [r2, #12]
	.loc 1 58 0
	str	r3, [r2, #32]
	.loc 1 59 0
	str	r3, [r2, #36]
	.loc 1 61 0
	ldr	r2, .L2+28
	str	r3, [r2]
	.loc 1 62 0
	strh	r3, [r2, #4]
	.loc 1 63 0
	str	r1, [r2, #8]
	.loc 1 64 0
	str	r3, [r2, #12]
	.loc 1 65 0
	str	r3, [r2, #32]
	.loc 1 66 0
	str	r3, [r2, #36]
	.loc 1 68 0
	ldr	r2, .L2+32
	str	r3, [r2]
	.loc 1 69 0
	strh	r3, [r2, #4]
	.loc 1 70 0
	str	r1, [r2, #8]
	.loc 1 71 0
	str	r3, [r2, #12]
	.loc 1 72 0
	str	r3, [r2, #32]
	.loc 1 73 0
	str	r3, [r2, #36]
	.loc 1 74 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	6160385
	.word	270534658
	.word	-1767200086
	.word	-1431655766
	.word	1207960576
	.word	1207961600
	.word	1207962624
	.word	1207964672
.LFE32:
	.size	early_init, .-early_init
	.section	.text.late_init,"ax",%progbits
	.align	1
	.global	late_init
	.code	16
	.thumb_func
	.type	late_init, %function
late_init:
.LFB33:
	.loc 1 77 0
	push	{r0, r1, r2, r3, r4, lr}
.LCFI0:
	.loc 1 79 0
	ldr	r1, .L5
	mov	r0, #0
	bl	fopen
.LVL0:
	ldr	r3, .L5+4
	str	r0, [r3]
	ldr	r3, .L5+8
	str	r0, [r3]
	ldr	r3, .L5+12
	str	r0, [r3]
	.loc 1 80 0
	add	r0, sp, #4
	bl	caribou_uart_init_config
.LVL1:
	.loc 1 81 0
	mov	r3, #150
	lsl	r3, r3, #6
	.loc 1 82 0
	add	r1, sp, #4
	mov	r0, #0
	.loc 1 81 0
	str	r3, [sp, #4]
	.loc 1 82 0
	bl	caribou_uart_set_config
.LVL2:
	.loc 1 83 0
	add	sp, sp, #20
	@ sp needed
	pop	{pc}
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	_stderr
	.word	_stdin
	.word	_stdout
.LFE33:
	.size	late_init, .-late_init
	.section	.text.notify_heap_alloc_failed,"ax",%progbits
	.align	1
	.global	notify_heap_alloc_failed
	.code	16
	.thumb_func
	.type	notify_heap_alloc_failed, %function
notify_heap_alloc_failed:
.LFB34:
	.loc 1 90 0
.LVL3:
.L8:
	b	.L8
.LFE34:
	.size	notify_heap_alloc_failed, .-notify_heap_alloc_failed
	.global	pb1
	.global	led2
	.global	led1
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"rw\000"
	.section	.data.led1,"aw",%progbits
	.align	2
	.type	led1, %object
	.size	led1, 8
led1:
	.word	1207961600
	.short	256
	.space	2
	.section	.data.led2,"aw",%progbits
	.align	2
	.type	led2, %object
	.size	led2, 8
led2:
	.word	1207961600
	.short	512
	.space	2
	.section	.data.pb1,"aw",%progbits
	.align	2
	.type	pb1, %object
	.size	pb1, 8
pb1:
	.word	1207959552
	.short	1
	.space	2
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI0-.LFB33
	.byte	0xe
	.uleb128 0x18
	.byte	0x80
	.uleb128 0x6
	.byte	0x81
	.uleb128 0x5
	.byte	0x82
	.uleb128 0x4
	.byte	0x83
	.uleb128 0x3
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 4 "../../../../include/caribou/lib/stdio.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 6 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_gpio.h"
	.file 7 "../../../../include/caribou/dev/gpio.h"
	.file 8 "../../../../include/caribou/dev/uart.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6fa
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF127
	.byte	0x1
	.4byte	.LASF128
	.4byte	.LASF129
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0xf
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x17
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x6
	.byte	0x4
	.4byte	0x94
	.uleb128 0x7
	.4byte	0x87
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x16
	.4byte	0x69
	.uleb128 0x8
	.4byte	.LASF130
	.byte	0x18
	.byte	0x4
	.byte	0x1f
	.4byte	0x100
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x4
	.byte	0x21
	.4byte	0x7e
	.byte	0
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x4
	.byte	0x22
	.4byte	0x11f
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x4
	.byte	0x23
	.4byte	0x11f
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.byte	0x24
	.4byte	0x134
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.byte	0x25
	.4byte	0x134
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.byte	0x26
	.4byte	0x134
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.4byte	0x57
	.4byte	0x119
	.uleb128 0xb
	.4byte	0x119
	.uleb128 0xb
	.4byte	0x7e
	.uleb128 0xb
	.4byte	0x57
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xab
	.uleb128 0x6
	.byte	0x4
	.4byte	0x100
	.uleb128 0xa
	.4byte	0x57
	.4byte	0x134
	.uleb128 0xb
	.4byte	0x119
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x125
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x4
	.byte	0x27
	.4byte	0xab
	.uleb128 0xc
	.4byte	0x5e
	.uleb128 0xd
	.4byte	0x5e
	.4byte	0x15a
	.uleb128 0xe
	.4byte	0x99
	.byte	0x1
	.byte	0
	.uleb128 0xc
	.4byte	0x45
	.uleb128 0xf
	.byte	0x2c
	.byte	0x5
	.2byte	0x18c
	.4byte	0x21f
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x18e
	.4byte	0x145
	.byte	0
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x18f
	.4byte	0x15a
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x190
	.4byte	0x45
	.byte	0x6
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x191
	.4byte	0x145
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x192
	.4byte	0x145
	.byte	0xc
	.uleb128 0x11
	.ascii	"IDR\000"
	.byte	0x5
	.2byte	0x193
	.4byte	0x15a
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x194
	.4byte	0x45
	.byte	0x12
	.uleb128 0x11
	.ascii	"ODR\000"
	.byte	0x5
	.2byte	0x195
	.4byte	0x15a
	.byte	0x14
	.uleb128 0x10
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x196
	.4byte	0x45
	.byte	0x16
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x5
	.2byte	0x197
	.4byte	0x145
	.byte	0x18
	.uleb128 0x10
	.4byte	.LASF29
	.byte	0x5
	.2byte	0x198
	.4byte	0x145
	.byte	0x1c
	.uleb128 0x11
	.ascii	"AFR\000"
	.byte	0x5
	.2byte	0x199
	.4byte	0x21f
	.byte	0x20
	.uleb128 0x11
	.ascii	"BRR\000"
	.byte	0x5
	.2byte	0x19a
	.4byte	0x15a
	.byte	0x28
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x5
	.2byte	0x19b
	.4byte	0x45
	.byte	0x2a
	.byte	0
	.uleb128 0xc
	.4byte	0x14a
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x5
	.2byte	0x19c
	.4byte	0x15f
	.uleb128 0xf
	.byte	0x38
	.byte	0x5
	.2byte	0x1d8
	.4byte	0x2ef
	.uleb128 0x11
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x1da
	.4byte	0x145
	.byte	0
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x5
	.2byte	0x1db
	.4byte	0x145
	.byte	0x4
	.uleb128 0x11
	.ascii	"CIR\000"
	.byte	0x5
	.2byte	0x1dc
	.4byte	0x145
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x5
	.2byte	0x1dd
	.4byte	0x145
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x5
	.2byte	0x1de
	.4byte	0x145
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x5
	.2byte	0x1df
	.4byte	0x145
	.byte	0x14
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x5
	.2byte	0x1e0
	.4byte	0x145
	.byte	0x18
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x5
	.2byte	0x1e1
	.4byte	0x145
	.byte	0x1c
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0x5
	.2byte	0x1e2
	.4byte	0x145
	.byte	0x20
	.uleb128 0x11
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x1e3
	.4byte	0x145
	.byte	0x24
	.uleb128 0x10
	.4byte	.LASF39
	.byte	0x5
	.2byte	0x1e4
	.4byte	0x145
	.byte	0x28
	.uleb128 0x10
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x1e5
	.4byte	0x145
	.byte	0x2c
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x1e6
	.4byte	0x145
	.byte	0x30
	.uleb128 0x11
	.ascii	"CR2\000"
	.byte	0x5
	.2byte	0x1e7
	.4byte	0x145
	.byte	0x34
	.byte	0
	.uleb128 0x12
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x1e8
	.4byte	0x230
	.uleb128 0x13
	.byte	0x1
	.byte	0x6
	.byte	0x3e
	.4byte	0x31c
	.uleb128 0x14
	.4byte	.LASF43
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF44
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF45
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF46
	.sleb128 3
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.byte	0x6
	.byte	0x4f
	.4byte	0x331
	.uleb128 0x14
	.4byte	.LASF47
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF48
	.sleb128 1
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.byte	0x6
	.byte	0x5e
	.4byte	0x34c
	.uleb128 0x14
	.4byte	.LASF49
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF50
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF51
	.sleb128 3
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.byte	0x6
	.byte	0x6e
	.4byte	0x367
	.uleb128 0x14
	.4byte	.LASF52
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF53
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF54
	.sleb128 2
	.byte	0
	.uleb128 0x15
	.byte	0x8
	.byte	0x7
	.byte	0x1a
	.4byte	0x388
	.uleb128 0x9
	.4byte	.LASF55
	.byte	0x7
	.byte	0x1c
	.4byte	0x388
	.byte	0
	.uleb128 0x9
	.4byte	.LASF56
	.byte	0x7
	.byte	0x1d
	.4byte	0x45
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x224
	.uleb128 0x3
	.4byte	.LASF57
	.byte	0x7
	.byte	0x1e
	.4byte	0x367
	.uleb128 0x13
	.byte	0x4
	.byte	0x8
	.byte	0x34
	.4byte	0x47c
	.uleb128 0x14
	.4byte	.LASF58
	.sleb128 110
	.uleb128 0x14
	.4byte	.LASF59
	.sleb128 300
	.uleb128 0x14
	.4byte	.LASF60
	.sleb128 600
	.uleb128 0x14
	.4byte	.LASF61
	.sleb128 1200
	.uleb128 0x14
	.4byte	.LASF62
	.sleb128 2400
	.uleb128 0x14
	.4byte	.LASF63
	.sleb128 4800
	.uleb128 0x14
	.4byte	.LASF64
	.sleb128 9600
	.uleb128 0x14
	.4byte	.LASF65
	.sleb128 19200
	.uleb128 0x14
	.4byte	.LASF66
	.sleb128 28800
	.uleb128 0x14
	.4byte	.LASF67
	.sleb128 38400
	.uleb128 0x14
	.4byte	.LASF68
	.sleb128 56000
	.uleb128 0x14
	.4byte	.LASF69
	.sleb128 57600
	.uleb128 0x14
	.4byte	.LASF70
	.sleb128 115200
	.uleb128 0x14
	.4byte	.LASF71
	.sleb128 128000
	.uleb128 0x14
	.4byte	.LASF72
	.sleb128 153600
	.uleb128 0x14
	.4byte	.LASF73
	.sleb128 230400
	.uleb128 0x14
	.4byte	.LASF74
	.sleb128 256000
	.uleb128 0x14
	.4byte	.LASF75
	.sleb128 460800
	.uleb128 0x14
	.4byte	.LASF76
	.sleb128 921600
	.uleb128 0x14
	.4byte	.LASF77
	.sleb128 1792000
	.uleb128 0x14
	.4byte	.LASF78
	.sleb128 1843200
	.uleb128 0x14
	.4byte	.LASF79
	.sleb128 3584000
	.uleb128 0x14
	.4byte	.LASF80
	.sleb128 3686400
	.uleb128 0x14
	.4byte	.LASF81
	.sleb128 7168000
	.uleb128 0x14
	.4byte	.LASF82
	.sleb128 7372800
	.uleb128 0x14
	.4byte	.LASF83
	.sleb128 9000000
	.uleb128 0x14
	.4byte	.LASF84
	.sleb128 10500000
	.byte	0
	.uleb128 0x3
	.4byte	.LASF85
	.byte	0x8
	.byte	0x50
	.4byte	0x399
	.uleb128 0x13
	.byte	0x1
	.byte	0x8
	.byte	0x54
	.4byte	0x4ae
	.uleb128 0x14
	.4byte	.LASF86
	.sleb128 5
	.uleb128 0x14
	.4byte	.LASF87
	.sleb128 6
	.uleb128 0x14
	.4byte	.LASF88
	.sleb128 7
	.uleb128 0x14
	.4byte	.LASF89
	.sleb128 8
	.uleb128 0x14
	.4byte	.LASF90
	.sleb128 9
	.byte	0
	.uleb128 0x3
	.4byte	.LASF91
	.byte	0x8
	.byte	0x5a
	.4byte	0x487
	.uleb128 0x13
	.byte	0x1
	.byte	0x8
	.byte	0x5e
	.4byte	0x4da
	.uleb128 0x14
	.4byte	.LASF92
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF93
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF94
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF95
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF96
	.byte	0x8
	.byte	0x63
	.4byte	0x4b9
	.uleb128 0x13
	.byte	0x1
	.byte	0x8
	.byte	0x67
	.4byte	0x500
	.uleb128 0x14
	.4byte	.LASF97
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF98
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF99
	.sleb128 2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF100
	.byte	0x8
	.byte	0x6b
	.4byte	0x4e5
	.uleb128 0x13
	.byte	0x1
	.byte	0x8
	.byte	0x6f
	.4byte	0x52c
	.uleb128 0x14
	.4byte	.LASF101
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF102
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF103
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF104
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF105
	.byte	0x8
	.byte	0x74
	.4byte	0x50b
	.uleb128 0x13
	.byte	0x1
	.byte	0x8
	.byte	0x78
	.4byte	0x558
	.uleb128 0x14
	.4byte	.LASF106
	.sleb128 0
	.uleb128 0x14
	.4byte	.LASF107
	.sleb128 1
	.uleb128 0x14
	.4byte	.LASF108
	.sleb128 2
	.uleb128 0x14
	.4byte	.LASF109
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF110
	.byte	0x8
	.byte	0x7d
	.4byte	0x537
	.uleb128 0x15
	.byte	0xc
	.byte	0x8
	.byte	0x7f
	.4byte	0x5b4
	.uleb128 0x9
	.4byte	.LASF111
	.byte	0x8
	.byte	0x81
	.4byte	0x47c
	.byte	0
	.uleb128 0x9
	.4byte	.LASF112
	.byte	0x8
	.byte	0x82
	.4byte	0x4ae
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF113
	.byte	0x8
	.byte	0x83
	.4byte	0x4da
	.byte	0x5
	.uleb128 0x9
	.4byte	.LASF114
	.byte	0x8
	.byte	0x84
	.4byte	0x500
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF115
	.byte	0x8
	.byte	0x85
	.4byte	0x52c
	.byte	0x7
	.uleb128 0x9
	.4byte	.LASF116
	.byte	0x8
	.byte	0x86
	.4byte	0x558
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF117
	.byte	0x8
	.byte	0x87
	.4byte	0x563
	.uleb128 0x16
	.4byte	.LASF131
	.byte	0x1
	.byte	0x15
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF118
	.byte	0x1
	.byte	0x4c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x639
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x1
	.byte	0x4e
	.4byte	0x5b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LVL0
	.4byte	0x6b6
	.4byte	0x60f
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x19
	.4byte	.LVL1
	.4byte	0x6d0
	.4byte	0x623
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL2
	.4byte	0x6e7
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF119
	.byte	0x1
	.byte	0x59
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x65c
	.uleb128 0x1c
	.4byte	.LASF133
	.byte	0x1
	.byte	0x59
	.4byte	0xa0
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF120
	.byte	0x4
	.byte	0x2a
	.4byte	0x667
	.uleb128 0x6
	.byte	0x4
	.4byte	0x13a
	.uleb128 0x1d
	.4byte	.LASF121
	.byte	0x4
	.byte	0x2b
	.4byte	0x667
	.uleb128 0x1d
	.4byte	.LASF122
	.byte	0x4
	.byte	0x2c
	.4byte	0x667
	.uleb128 0x1e
	.4byte	.LASF123
	.byte	0x1
	.byte	0x11
	.4byte	0x38e
	.uleb128 0x5
	.byte	0x3
	.4byte	led1
	.uleb128 0x1e
	.4byte	.LASF124
	.byte	0x1
	.byte	0x12
	.4byte	0x38e
	.uleb128 0x5
	.byte	0x3
	.4byte	led2
	.uleb128 0x1f
	.ascii	"pb1\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x38e
	.uleb128 0x5
	.byte	0x3
	.4byte	pb1
	.uleb128 0x20
	.4byte	.LASF134
	.byte	0x4
	.byte	0x32
	.4byte	0x667
	.4byte	0x6d0
	.uleb128 0xb
	.4byte	0x57
	.uleb128 0xb
	.4byte	0x8e
	.byte	0
	.uleb128 0x21
	.4byte	.LASF125
	.byte	0x8
	.byte	0x93
	.4byte	0x6e1
	.uleb128 0xb
	.4byte	0x6e1
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5b4
	.uleb128 0x22
	.4byte	.LASF126
	.byte	0x8
	.byte	0x94
	.4byte	0x57
	.uleb128 0xb
	.4byte	0x57
	.uleb128 0xb
	.4byte	0x6e1
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF44:
	.ascii	"GPIO_Mode_OUT\000"
.LASF37:
	.ascii	"APB1ENR\000"
.LASF127:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF69:
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
.LASF28:
	.ascii	"BSRR\000"
.LASF114:
	.ascii	"parity_bits\000"
.LASF105:
	.ascii	"caribou_uart_flow_t\000"
.LASF59:
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
.LASF18:
	.ascii	"writequeuefn\000"
.LASF47:
	.ascii	"GPIO_OType_PP\000"
.LASF33:
	.ascii	"APB2RSTR\000"
.LASF16:
	.ascii	"writefn\000"
.LASF68:
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF97:
	.ascii	"CARIBOU_UART_PARITY_NONE\000"
.LASF98:
	.ascii	"CARIBOU_UART_PARITY_EVEN\000"
.LASF38:
	.ascii	"BDCR\000"
.LASF50:
	.ascii	"GPIO_Speed_Level_2\000"
.LASF61:
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
.LASF70:
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
.LASF62:
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
.LASF77:
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
.LASF126:
	.ascii	"caribou_uart_set_config\000"
.LASF74:
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
.LASF121:
	.ascii	"_stdout\000"
.LASF94:
	.ascii	"CARIBOU_UART_STOPBITS_15\000"
.LASF86:
	.ascii	"CARIBOU_UART_WORDSIZE_5\000"
.LASF87:
	.ascii	"CARIBOU_UART_WORDSIZE_6\000"
.LASF56:
	.ascii	"pinmask\000"
.LASF89:
	.ascii	"CARIBOU_UART_WORDSIZE_8\000"
.LASF72:
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
.LASF100:
	.ascii	"caribou_uart_parity_t\000"
.LASF118:
	.ascii	"late_init\000"
.LASF57:
	.ascii	"caribou_gpio_t\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF39:
	.ascii	"AHBRSTR\000"
.LASF17:
	.ascii	"readqueuefn\000"
.LASF60:
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
.LASF107:
	.ascii	"CARIBOU_UART_DMA_RX\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF83:
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
.LASF21:
	.ascii	"MODER\000"
.LASF81:
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
.LASF117:
	.ascii	"caribou_uart_config_t\000"
.LASF58:
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
.LASF99:
	.ascii	"CARIBOU_UART_PARITY_ODD\000"
.LASF13:
	.ascii	"size_t\000"
.LASF42:
	.ascii	"RCC_TypeDef\000"
.LASF85:
	.ascii	"caribou_uart_baud_t\000"
.LASF96:
	.ascii	"caribou_uart_stop_t\000"
.LASF45:
	.ascii	"GPIO_Mode_AF\000"
.LASF46:
	.ascii	"GPIO_Mode_AN\000"
.LASF108:
	.ascii	"CARIBOU_UART_DMA_TX\000"
.LASF53:
	.ascii	"GPIO_PuPd_UP\000"
.LASF25:
	.ascii	"PUPDR\000"
.LASF129:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF34:
	.ascii	"APB1RSTR\000"
.LASF109:
	.ascii	"CARIBOU_UART_DMA_BOTH\000"
.LASF11:
	.ascii	"char\000"
.LASF128:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../src/boa"
	.ascii	"rd.c\000"
.LASF110:
	.ascii	"caribou_uart_dma_t\000"
.LASF92:
	.ascii	"CARIBOU_UART_STOPBITS_05\000"
.LASF35:
	.ascii	"AHBENR\000"
.LASF66:
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
.LASF130:
	.ascii	"_stdio_t\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF80:
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
.LASF120:
	.ascii	"_stdin\000"
.LASF79:
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
.LASF8:
	.ascii	"long long int\000"
.LASF67:
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
.LASF125:
	.ascii	"caribou_uart_init_config\000"
.LASF119:
	.ascii	"notify_heap_alloc_failed\000"
.LASF101:
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
.LASF123:
	.ascii	"led1\000"
.LASF124:
	.ascii	"led2\000"
.LASF133:
	.ascii	"size\000"
.LASF40:
	.ascii	"CFGR2\000"
.LASF41:
	.ascii	"CFGR3\000"
.LASF36:
	.ascii	"APB2ENR\000"
.LASF112:
	.ascii	"word_size\000"
.LASF134:
	.ascii	"fopen\000"
.LASF49:
	.ascii	"GPIO_Speed_Level_1\000"
.LASF24:
	.ascii	"OSPEEDR\000"
.LASF51:
	.ascii	"GPIO_Speed_Level_3\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF88:
	.ascii	"CARIBOU_UART_WORDSIZE_7\000"
.LASF90:
	.ascii	"CARIBOU_UART_WORDSIZE_9\000"
.LASF91:
	.ascii	"caribou_uart_word_t\000"
.LASF132:
	.ascii	"config\000"
.LASF23:
	.ascii	"RESERVED0\000"
.LASF26:
	.ascii	"RESERVED1\000"
.LASF27:
	.ascii	"RESERVED2\000"
.LASF30:
	.ascii	"RESERVED3\000"
.LASF2:
	.ascii	"short int\000"
.LASF103:
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
.LASF10:
	.ascii	"long int\000"
.LASF113:
	.ascii	"stop_bits\000"
.LASF75:
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
.LASF116:
	.ascii	"dma_mode\000"
.LASF22:
	.ascii	"OTYPER\000"
.LASF15:
	.ascii	"readfn\000"
.LASF71:
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
.LASF32:
	.ascii	"CFGR\000"
.LASF14:
	.ascii	"device_private\000"
.LASF31:
	.ascii	"GPIO_TypeDef\000"
.LASF104:
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
.LASF115:
	.ascii	"flow_control\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF78:
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
.LASF55:
	.ascii	"port\000"
.LASF102:
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF82:
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
.LASF52:
	.ascii	"GPIO_PuPd_NOPULL\000"
.LASF19:
	.ascii	"statefn\000"
.LASF63:
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
.LASF54:
	.ascii	"GPIO_PuPd_DOWN\000"
.LASF43:
	.ascii	"GPIO_Mode_IN\000"
.LASF20:
	.ascii	"stdio_t\000"
.LASF0:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF106:
	.ascii	"CARIBOU_UART_DMA_NONE\000"
.LASF84:
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
.LASF76:
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
.LASF64:
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
.LASF48:
	.ascii	"GPIO_OType_OD\000"
.LASF111:
	.ascii	"baud_rate\000"
.LASF73:
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
.LASF131:
	.ascii	"early_init\000"
.LASF93:
	.ascii	"CARIBOU_UART_STOPBITS_1\000"
.LASF95:
	.ascii	"CARIBOU_UART_STOPBITS_2\000"
.LASF65:
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
.LASF122:
	.ascii	"_stderr\000"
.LASF29:
	.ascii	"LCKR\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
