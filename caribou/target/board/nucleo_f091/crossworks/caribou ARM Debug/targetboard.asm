	.syntax unified
	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"board.c"
	.text
.Ltext0:
	.global	led1
	.section	.data.led1,"aw",%progbits
	.align	2
	.type	led1, %object
	.size	led1, 8
led1:
	.word	1207959552
	.short	32
	.space	2
	.global	pb1
	.section	.data.pb1,"aw",%progbits
	.align	2
	.type	pb1, %object
	.size	pb1, 8
pb1:
	.word	1207961600
	.short	8192
	.space	2
	.global	outA
	.section	.data.outA,"aw",%progbits
	.align	2
	.type	outA, %object
	.size	outA, 8
outA:
	.word	1207960576
	.short	8
	.space	2
	.global	outB
	.section	.data.outB,"aw",%progbits
	.align	2
	.type	outB, %object
	.size	outB, 8
outB:
	.word	1207960576
	.short	16
	.space	2
	.global	outC
	.section	.data.outC,"aw",%progbits
	.align	2
	.type	outC, %object
	.size	outC, 8
outC:
	.word	1207960576
	.short	1024
	.space	2
	.global	outD
	.section	.data.outD,"aw",%progbits
	.align	2
	.type	outD, %object
	.size	outD, 8
outD:
	.word	1207961600
	.short	128
	.space	2
	.section	.text.CLOCK_Configuration,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	CLOCK_Configuration, %function
CLOCK_Configuration:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../src/board.c"
	.loc 1 27 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #32
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	.loc 1 29 0
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #7
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 34 0
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	movs	r1, #160
	lsls	r1, r1, #14
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 35 0
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 36 0
	nop
	ldr	r3, .L3
	ldr	r3, [r3]
	.loc 1 37 0
	ldr	r3, .L3+4
	ldr	r2, .L3+4
	ldr	r2, [r2]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 38 0
	ldr	r3, .L3
	ldr	r2, .L3
	ldr	r2, [r2, #4]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 39 0
	nop
.L2:
	.loc 1 39 0 is_stmt 0 discriminator 1
	ldr	r3, .L3
	ldr	r3, [r3, #4]
	movs	r2, #12
	ands	r3, r2
	cmp	r3, #8
	bne	.L2
	.loc 1 40 0 is_stmt 1
	bl	SystemCoreClockUpdate
	.loc 1 41 0
	adds	r3, r7, #4
	movs	r0, r3
	bl	RCC_GetClocksFreq
	.loc 1 42 0
	nop
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	1073876992
	.word	1073881088
.LFE32:
	.size	CLOCK_Configuration, .-CLOCK_Configuration
	.section	.text.early_init,"ax",%progbits
	.align	2
	.global	early_init
	.code	16
	.thumb_func
	.type	early_init, %function
early_init:
.LFB33:
	.loc 1 45 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	.loc 1 46 0
	bl	CLOCK_Configuration
	.loc 1 48 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2, #20]
	ldr	r1, .L6+4
	orrs	r2, r1
	str	r2, [r3, #20]
	.loc 1 55 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2, #28]
	ldr	r1, .L6+8
	orrs	r2, r1
	str	r2, [r3, #28]
	.loc 1 60 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2, #24]
	movs	r1, #148
	lsls	r1, r1, #7
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 65 0
	movs	r3, #144
	lsls	r3, r3, #23
	ldr	r2, .L6+12
	str	r2, [r3]
	.loc 1 66 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 67 0
	movs	r3, #144
	lsls	r3, r3, #23
	ldr	r2, .L6+16
	str	r2, [r3, #8]
	.loc 1 68 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #22
	str	r2, [r3, #12]
	.loc 1 69 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #0
	str	r2, [r3, #32]
	.loc 1 70 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 72 0
	ldr	r3, .L6+20
	ldr	r2, .L6+24
	str	r2, [r3]
	.loc 1 73 0
	ldr	r3, .L6+20
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 74 0
	ldr	r3, .L6+20
	ldr	r2, .L6+28
	str	r2, [r3, #8]
	.loc 1 75 0
	ldr	r3, .L6+20
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 76 0
	ldr	r3, .L6+20
	movs	r2, #0
	str	r2, [r3, #32]
	.loc 1 77 0
	ldr	r3, .L6+20
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 79 0
	ldr	r3, .L6+32
	movs	r2, #128
	lsls	r2, r2, #7
	str	r2, [r3]
	.loc 1 80 0
	ldr	r3, .L6+32
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 81 0
	ldr	r3, .L6+32
	ldr	r2, .L6+28
	str	r2, [r3, #8]
	.loc 1 82 0
	ldr	r3, .L6+32
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 83 0
	ldr	r3, .L6+32
	movs	r2, #0
	str	r2, [r3, #32]
	.loc 1 84 0
	ldr	r3, .L6+32
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 86 0
	ldr	r3, .L6+36
	movs	r2, #0
	str	r2, [r3]
	.loc 1 87 0
	ldr	r3, .L6+36
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 88 0
	ldr	r3, .L6+36
	ldr	r2, .L6+28
	str	r2, [r3, #8]
	.loc 1 89 0
	ldr	r3, .L6+36
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 90 0
	ldr	r3, .L6+36
	movs	r2, #0
	str	r2, [r3, #32]
	.loc 1 91 0
	ldr	r3, .L6+36
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 93 0
	ldr	r3, .L6+40
	movs	r2, #0
	str	r2, [r3]
	.loc 1 94 0
	ldr	r3, .L6+40
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 95 0
	ldr	r3, .L6+40
	ldr	r2, .L6+28
	str	r2, [r3, #8]
	.loc 1 96 0
	ldr	r3, .L6+40
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 97 0
	ldr	r3, .L6+40
	movs	r2, #0
	str	r2, [r3, #32]
	.loc 1 98 0
	ldr	r3, .L6+40
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 100 0
	ldr	r3, .L6+44
	ldr	r2, [r3]
	ldr	r3, .L6+44
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 101 0
	ldr	r3, .L6+48
	ldr	r2, [r3]
	ldr	r3, .L6+48
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 102 0
	ldr	r3, .L6+52
	ldr	r2, [r3]
	ldr	r3, .L6+52
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 103 0
	ldr	r3, .L6+56
	ldr	r2, [r3]
	ldr	r3, .L6+56
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 104 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	1073876992
	.word	6160385
	.word	270534658
	.word	671089664
	.word	-1767200086
	.word	1207960576
	.word	1048896
	.word	-1431655766
	.word	1207961600
	.word	1207962624
	.word	1207964672
	.word	outA
	.word	outB
	.word	outC
	.word	outD
.LFE33:
	.size	early_init, .-early_init
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"rw\000"
	.section	.text.late_init,"ax",%progbits
	.align	2
	.global	late_init
	.code	16
	.thumb_func
	.type	late_init, %function
late_init:
.LFB34:
	.loc 1 107 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #16
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	.loc 1 109 0
	ldr	r3, .L9
	movs	r1, r3
	movs	r0, #0
	bl	fopen
	movs	r2, r0
	ldr	r3, .L9+4
	str	r2, [r3]
	ldr	r3, .L9+4
	ldr	r2, [r3]
	ldr	r3, .L9+8
	str	r2, [r3]
	ldr	r3, .L9+8
	ldr	r2, [r3]
	ldr	r3, .L9+12
	str	r2, [r3]
	.loc 1 110 0
	adds	r3, r7, #4
	movs	r0, r3
	bl	caribou_uart_init_config
	.loc 1 111 0
	adds	r3, r7, #4
	movs	r2, #225
	lsls	r2, r2, #9
	str	r2, [r3]
	.loc 1 112 0
	adds	r3, r7, #4
	movs	r2, #3
	strb	r2, [r3, #7]
	.loc 1 113 0
	adds	r3, r7, #4
	movs	r1, r3
	movs	r0, #0
	bl	caribou_uart_set_config
	.loc 1 114 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	.LC4
	.word	_stderr
	.word	_stdin
	.word	_stdout
.LFE34:
	.size	late_init, .-late_init
	.section	.text.notify_heap_alloc_failed,"ax",%progbits
	.align	2
	.global	notify_heap_alloc_failed
	.code	16
	.thumb_func
	.type	notify_heap_alloc_failed, %function
notify_heap_alloc_failed:
.LFB35:
	.loc 1 121 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #8
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	str	r0, [r7, #4]
.L12:
	.loc 1 122 0 discriminator 1
	b	.L12
.LFE35:
	.size	notify_heap_alloc_failed, .-notify_heap_alloc_failed
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
	.byte	0x4
	.4byte	.LCFI0-.LFB32
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI5-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI8-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 5 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_gpio.h"
	.file 6 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_rcc.h"
	.file 7 "../../../../include/caribou/lib/stdio.h"
	.file 8 "../../../../include/caribou/dev/gpio.h"
	.file 9 "../../../../include/caribou/dev/uart.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7d3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF143
	.byte	0xc
	.4byte	.LASF144
	.4byte	.LASF145
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x16
	.4byte	0x69
	.uleb128 0x6
	.4byte	0x5e
	.uleb128 0x7
	.4byte	0xa0
	.4byte	0xb5
	.uleb128 0x8
	.4byte	0x8e
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.byte	0x24
	.byte	0x4
	.2byte	0x16c
	.4byte	0x131
	.uleb128 0xa
	.ascii	"ACR\000"
	.byte	0x4
	.2byte	0x16e
	.4byte	0xa0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x16f
	.4byte	0xa0
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x170
	.4byte	0xa0
	.byte	0x8
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x171
	.4byte	0xa0
	.byte	0xc
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x172
	.4byte	0xa0
	.byte	0x10
	.uleb128 0xa
	.ascii	"AR\000"
	.byte	0x4
	.2byte	0x173
	.4byte	0xa0
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x174
	.4byte	0xa0
	.byte	0x18
	.uleb128 0xa
	.ascii	"OBR\000"
	.byte	0x4
	.2byte	0x175
	.4byte	0xa0
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x176
	.4byte	0xa0
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x177
	.4byte	0xb5
	.uleb128 0x6
	.4byte	0x45
	.uleb128 0x9
	.byte	0x2c
	.byte	0x4
	.2byte	0x18c
	.4byte	0x202
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x18e
	.4byte	0xa0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x18f
	.4byte	0x13d
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x190
	.4byte	0x45
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x191
	.4byte	0xa0
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x192
	.4byte	0xa0
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x193
	.4byte	0x13d
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x194
	.4byte	0x45
	.byte	0x12
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x195
	.4byte	0x13d
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x196
	.4byte	0x45
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x197
	.4byte	0xa0
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x198
	.4byte	0xa0
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x199
	.4byte	0x202
	.byte	0x20
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x19a
	.4byte	0x13d
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x19b
	.4byte	0x45
	.byte	0x2a
	.byte	0
	.uleb128 0x6
	.4byte	0xa5
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x19c
	.4byte	0x142
	.uleb128 0x9
	.byte	0x38
	.byte	0x4
	.2byte	0x1d8
	.4byte	0x2d2
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x1da
	.4byte	0xa0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x1db
	.4byte	0xa0
	.byte	0x4
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x1dc
	.4byte	0xa0
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x1dd
	.4byte	0xa0
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x1de
	.4byte	0xa0
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x1df
	.4byte	0xa0
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x1e0
	.4byte	0xa0
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x1e1
	.4byte	0xa0
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x1e2
	.4byte	0xa0
	.byte	0x20
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x1e3
	.4byte	0xa0
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x1e4
	.4byte	0xa0
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x1e5
	.4byte	0xa0
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x1e6
	.4byte	0xa0
	.byte	0x30
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x1e7
	.4byte	0xa0
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x1e8
	.4byte	0x213
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0x3e
	.4byte	0x303
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF43
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0x4f
	.4byte	0x31c
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x1
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0x5e
	.4byte	0x33b
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x3
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0x6e
	.4byte	0x35a
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.byte	0x1c
	.byte	0x6
	.byte	0x32
	.4byte	0x3b7
	.uleb128 0x10
	.4byte	.LASF53
	.byte	0x6
	.byte	0x34
	.4byte	0x5e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x6
	.byte	0x35
	.4byte	0x5e
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF55
	.byte	0x6
	.byte	0x36
	.4byte	0x5e
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x6
	.byte	0x37
	.4byte	0x5e
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x6
	.byte	0x38
	.4byte	0x5e
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x6
	.byte	0x39
	.4byte	0x5e
	.byte	0x14
	.uleb128 0x10
	.4byte	.LASF59
	.byte	0x6
	.byte	0x3a
	.4byte	0x5e
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x6
	.byte	0x3b
	.4byte	0x35a
	.uleb128 0x11
	.4byte	.LASF146
	.byte	0x18
	.byte	0x7
	.byte	0x1f
	.4byte	0x417
	.uleb128 0x10
	.4byte	.LASF61
	.byte	0x7
	.byte	0x21
	.4byte	0x7e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF62
	.byte	0x7
	.byte	0x22
	.4byte	0x436
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x7
	.byte	0x23
	.4byte	0x436
	.byte	0x8
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x7
	.byte	0x24
	.4byte	0x44b
	.byte	0xc
	.uleb128 0x10
	.4byte	.LASF65
	.byte	0x7
	.byte	0x25
	.4byte	0x44b
	.byte	0x10
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0x7
	.byte	0x26
	.4byte	0x44b
	.byte	0x14
	.byte	0
	.uleb128 0x12
	.4byte	0x57
	.4byte	0x430
	.uleb128 0x13
	.4byte	0x430
	.uleb128 0x13
	.4byte	0x7e
	.uleb128 0x13
	.4byte	0x57
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x3c2
	.uleb128 0x14
	.byte	0x4
	.4byte	0x417
	.uleb128 0x12
	.4byte	0x57
	.4byte	0x44b
	.uleb128 0x13
	.4byte	0x430
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x43c
	.uleb128 0x3
	.4byte	.LASF67
	.byte	0x7
	.byte	0x27
	.4byte	0x3c2
	.uleb128 0xf
	.byte	0x8
	.byte	0x8
	.byte	0x1a
	.4byte	0x47d
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x8
	.byte	0x1c
	.4byte	0x47d
	.byte	0
	.uleb128 0x10
	.4byte	.LASF69
	.byte	0x8
	.byte	0x1d
	.4byte	0x45
	.byte	0x4
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x207
	.uleb128 0x3
	.4byte	.LASF70
	.byte	0x8
	.byte	0x1e
	.4byte	0x45c
	.uleb128 0xd
	.byte	0x4
	.4byte	0x69
	.byte	0x9
	.byte	0x34
	.4byte	0x575
	.uleb128 0xe
	.4byte	.LASF71
	.byte	0x6e
	.uleb128 0x15
	.4byte	.LASF72
	.2byte	0x12c
	.uleb128 0x15
	.4byte	.LASF73
	.2byte	0x258
	.uleb128 0x15
	.4byte	.LASF74
	.2byte	0x4b0
	.uleb128 0x15
	.4byte	.LASF75
	.2byte	0x960
	.uleb128 0x15
	.4byte	.LASF76
	.2byte	0x12c0
	.uleb128 0x15
	.4byte	.LASF77
	.2byte	0x2580
	.uleb128 0x15
	.4byte	.LASF78
	.2byte	0x4b00
	.uleb128 0x15
	.4byte	.LASF79
	.2byte	0x7080
	.uleb128 0x15
	.4byte	.LASF80
	.2byte	0x9600
	.uleb128 0x15
	.4byte	.LASF81
	.2byte	0xdac0
	.uleb128 0x15
	.4byte	.LASF82
	.2byte	0xe100
	.uleb128 0x16
	.4byte	.LASF83
	.4byte	0x1c200
	.uleb128 0x16
	.4byte	.LASF84
	.4byte	0x1f400
	.uleb128 0x16
	.4byte	.LASF85
	.4byte	0x25800
	.uleb128 0x16
	.4byte	.LASF86
	.4byte	0x38400
	.uleb128 0x16
	.4byte	.LASF87
	.4byte	0x3e800
	.uleb128 0x16
	.4byte	.LASF88
	.4byte	0x70800
	.uleb128 0x16
	.4byte	.LASF89
	.4byte	0xe1000
	.uleb128 0x16
	.4byte	.LASF90
	.4byte	0x1b5800
	.uleb128 0x16
	.4byte	.LASF91
	.4byte	0x1c2000
	.uleb128 0x16
	.4byte	.LASF92
	.4byte	0x36b000
	.uleb128 0x16
	.4byte	.LASF93
	.4byte	0x384000
	.uleb128 0x16
	.4byte	.LASF94
	.4byte	0x6d6000
	.uleb128 0x16
	.4byte	.LASF95
	.4byte	0x708000
	.uleb128 0x16
	.4byte	.LASF96
	.4byte	0x895440
	.uleb128 0x16
	.4byte	.LASF97
	.4byte	0xa037a0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF98
	.byte	0x9
	.byte	0x50
	.4byte	0x48e
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x9
	.byte	0x54
	.4byte	0x5ab
	.uleb128 0xe
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF100
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF101
	.byte	0x7
	.uleb128 0xe
	.4byte	.LASF102
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF103
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.4byte	.LASF104
	.byte	0x9
	.byte	0x5a
	.4byte	0x580
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x9
	.byte	0x5e
	.4byte	0x5db
	.uleb128 0xe
	.4byte	.LASF105
	.byte	0
	.uleb128 0xe
	.4byte	.LASF106
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF107
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF108
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF109
	.byte	0x9
	.byte	0x63
	.4byte	0x5b6
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x9
	.byte	0x67
	.4byte	0x605
	.uleb128 0xe
	.4byte	.LASF110
	.byte	0
	.uleb128 0xe
	.4byte	.LASF111
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF112
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF113
	.byte	0x9
	.byte	0x6b
	.4byte	0x5e6
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x9
	.byte	0x6f
	.4byte	0x635
	.uleb128 0xe
	.4byte	.LASF114
	.byte	0
	.uleb128 0xe
	.4byte	.LASF115
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF116
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF117
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF118
	.byte	0x9
	.byte	0x74
	.4byte	0x610
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x9
	.byte	0x78
	.4byte	0x665
	.uleb128 0xe
	.4byte	.LASF119
	.byte	0
	.uleb128 0xe
	.4byte	.LASF120
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF121
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF122
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF123
	.byte	0x9
	.byte	0x7d
	.4byte	0x640
	.uleb128 0xf
	.byte	0xc
	.byte	0x9
	.byte	0x7f
	.4byte	0x6c1
	.uleb128 0x10
	.4byte	.LASF124
	.byte	0x9
	.byte	0x81
	.4byte	0x575
	.byte	0
	.uleb128 0x10
	.4byte	.LASF125
	.byte	0x9
	.byte	0x82
	.4byte	0x5ab
	.byte	0x4
	.uleb128 0x10
	.4byte	.LASF126
	.byte	0x9
	.byte	0x83
	.4byte	0x5db
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF127
	.byte	0x9
	.byte	0x84
	.4byte	0x605
	.byte	0x6
	.uleb128 0x10
	.4byte	.LASF128
	.byte	0x9
	.byte	0x85
	.4byte	0x635
	.byte	0x7
	.uleb128 0x10
	.4byte	.LASF129
	.byte	0x9
	.byte	0x86
	.4byte	0x665
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF130
	.byte	0x9
	.byte	0x87
	.4byte	0x670
	.uleb128 0x17
	.4byte	.LASF147
	.byte	0x1
	.byte	0x1a
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f0
	.uleb128 0x18
	.4byte	.LASF131
	.byte	0x1
	.byte	0x1c
	.4byte	0x3b7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x19
	.4byte	.LASF148
	.byte	0x1
	.byte	0x2c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.4byte	.LASF133
	.byte	0x1
	.byte	0x6a
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x725
	.uleb128 0x18
	.4byte	.LASF132
	.byte	0x1
	.byte	0x6c
	.4byte	0x6c1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF134
	.byte	0x1
	.byte	0x78
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x749
	.uleb128 0x1c
	.4byte	.LASF149
	.byte	0x1
	.byte	0x78
	.4byte	0x95
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF135
	.byte	0x7
	.byte	0x2a
	.4byte	0x754
	.uleb128 0x14
	.byte	0x4
	.4byte	0x451
	.uleb128 0x1d
	.4byte	.LASF136
	.byte	0x7
	.byte	0x2b
	.4byte	0x754
	.uleb128 0x1d
	.4byte	.LASF137
	.byte	0x7
	.byte	0x2c
	.4byte	0x754
	.uleb128 0x1e
	.4byte	.LASF138
	.byte	0x1
	.byte	0x11
	.4byte	0x483
	.uleb128 0x5
	.byte	0x3
	.4byte	led1
	.uleb128 0x1f
	.ascii	"pb1\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x483
	.uleb128 0x5
	.byte	0x3
	.4byte	pb1
	.uleb128 0x1e
	.4byte	.LASF139
	.byte	0x1
	.byte	0x14
	.4byte	0x483
	.uleb128 0x5
	.byte	0x3
	.4byte	outA
	.uleb128 0x1e
	.4byte	.LASF140
	.byte	0x1
	.byte	0x15
	.4byte	0x483
	.uleb128 0x5
	.byte	0x3
	.4byte	outB
	.uleb128 0x1e
	.4byte	.LASF141
	.byte	0x1
	.byte	0x17
	.4byte	0x483
	.uleb128 0x5
	.byte	0x3
	.4byte	outC
	.uleb128 0x1e
	.4byte	.LASF142
	.byte	0x1
	.byte	0x18
	.4byte	0x483
	.uleb128 0x5
	.byte	0x3
	.4byte	outD
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
	.uleb128 0x2134
	.uleb128 0x19
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
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
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x572
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7d7
	.4byte	0x2ea
	.ascii	"GPIO_Mode_IN\000"
	.4byte	0x2f0
	.ascii	"GPIO_Mode_OUT\000"
	.4byte	0x2f6
	.ascii	"GPIO_Mode_AF\000"
	.4byte	0x2fc
	.ascii	"GPIO_Mode_AN\000"
	.4byte	0x30f
	.ascii	"GPIO_OType_PP\000"
	.4byte	0x315
	.ascii	"GPIO_OType_OD\000"
	.4byte	0x328
	.ascii	"GPIO_Speed_Level_1\000"
	.4byte	0x32e
	.ascii	"GPIO_Speed_Level_2\000"
	.4byte	0x334
	.ascii	"GPIO_Speed_Level_3\000"
	.4byte	0x347
	.ascii	"GPIO_PuPd_NOPULL\000"
	.4byte	0x34d
	.ascii	"GPIO_PuPd_UP\000"
	.4byte	0x353
	.ascii	"GPIO_PuPd_DOWN\000"
	.4byte	0x49a
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
	.4byte	0x4a0
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
	.4byte	0x4a7
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
	.4byte	0x4ae
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
	.4byte	0x4b5
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
	.4byte	0x4bc
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
	.4byte	0x4c3
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
	.4byte	0x4ca
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
	.4byte	0x4d1
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
	.4byte	0x4d8
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
	.4byte	0x4df
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
	.4byte	0x4e6
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
	.4byte	0x4ed
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
	.4byte	0x4f6
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
	.4byte	0x4ff
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
	.4byte	0x508
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
	.4byte	0x511
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
	.4byte	0x51a
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
	.4byte	0x523
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
	.4byte	0x52c
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
	.4byte	0x535
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
	.4byte	0x53e
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
	.4byte	0x547
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
	.4byte	0x550
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
	.4byte	0x559
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
	.4byte	0x562
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
	.4byte	0x56b
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
	.4byte	0x61c
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
	.4byte	0x622
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
	.4byte	0x628
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
	.4byte	0x62e
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
	.4byte	0x6cc
	.ascii	"CLOCK_Configuration\000"
	.4byte	0x6f0
	.ascii	"early_init\000"
	.4byte	0x701
	.ascii	"late_init\000"
	.4byte	0x725
	.ascii	"notify_heap_alloc_failed\000"
	.4byte	0x770
	.ascii	"led1\000"
	.4byte	0x781
	.ascii	"pb1\000"
	.4byte	0x792
	.ascii	"outA\000"
	.4byte	0x7a3
	.ascii	"outB\000"
	.4byte	0x7b4
	.ascii	"outC\000"
	.4byte	0x7c5
	.ascii	"outD\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x20f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7d7
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x50
	.ascii	"short unsigned int\000"
	.4byte	0x45
	.ascii	"uint16_t\000"
	.4byte	0x57
	.ascii	"int\000"
	.4byte	0x69
	.ascii	"unsigned int\000"
	.4byte	0x5e
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x80
	.ascii	"long int\000"
	.4byte	0x87
	.ascii	"char\000"
	.4byte	0x8e
	.ascii	"sizetype\000"
	.4byte	0x95
	.ascii	"size_t\000"
	.4byte	0x131
	.ascii	"FLASH_TypeDef\000"
	.4byte	0x207
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x2d2
	.ascii	"RCC_TypeDef\000"
	.4byte	0x3b7
	.ascii	"RCC_ClocksTypeDef\000"
	.4byte	0x3c2
	.ascii	"_stdio_t\000"
	.4byte	0x451
	.ascii	"stdio_t\000"
	.4byte	0x483
	.ascii	"caribou_gpio_t\000"
	.4byte	0x575
	.ascii	"caribou_uart_baud_t\000"
	.4byte	0x5ab
	.ascii	"caribou_uart_word_t\000"
	.4byte	0x5db
	.ascii	"caribou_uart_stop_t\000"
	.4byte	0x605
	.ascii	"caribou_uart_parity_t\000"
	.4byte	0x635
	.ascii	"caribou_uart_flow_t\000"
	.4byte	0x665
	.ascii	"caribou_uart_dma_t\000"
	.4byte	0x6c1
	.ascii	"caribou_uart_config_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x34
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
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF42:
	.ascii	"GPIO_Mode_OUT\000"
.LASF16:
	.ascii	"RESERVED\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF58:
	.ascii	"I2C1CLK_Frequency\000"
.LASF82:
	.ascii	"CARIBOU_UART_BAUD_RATE_57600\000"
.LASF26:
	.ascii	"BSRR\000"
.LASF127:
	.ascii	"parity_bits\000"
.LASF118:
	.ascii	"caribou_uart_flow_t\000"
.LASF72:
	.ascii	"CARIBOU_UART_BAUD_RATE_300\000"
.LASF65:
	.ascii	"writequeuefn\000"
.LASF45:
	.ascii	"GPIO_OType_PP\000"
.LASF31:
	.ascii	"APB2RSTR\000"
.LASF63:
	.ascii	"writefn\000"
.LASF81:
	.ascii	"CARIBOU_UART_BAUD_RATE_56000\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF110:
	.ascii	"CARIBOU_UART_PARITY_NONE\000"
.LASF111:
	.ascii	"CARIBOU_UART_PARITY_EVEN\000"
.LASF36:
	.ascii	"BDCR\000"
.LASF60:
	.ascii	"RCC_ClocksTypeDef\000"
.LASF48:
	.ascii	"GPIO_Speed_Level_2\000"
.LASF74:
	.ascii	"CARIBOU_UART_BAUD_RATE_1200\000"
.LASF14:
	.ascii	"KEYR\000"
.LASF75:
	.ascii	"CARIBOU_UART_BAUD_RATE_2400\000"
.LASF90:
	.ascii	"CARIBOU_UART_BAUD_RATE_1792000\000"
.LASF87:
	.ascii	"CARIBOU_UART_BAUD_RATE_256000\000"
.LASF136:
	.ascii	"_stdout\000"
.LASF107:
	.ascii	"CARIBOU_UART_STOPBITS_15\000"
.LASF99:
	.ascii	"CARIBOU_UART_WORDSIZE_5\000"
.LASF100:
	.ascii	"CARIBOU_UART_WORDSIZE_6\000"
.LASF69:
	.ascii	"pinmask\000"
.LASF102:
	.ascii	"CARIBOU_UART_WORDSIZE_8\000"
.LASF85:
	.ascii	"CARIBOU_UART_BAUD_RATE_153600\000"
.LASF55:
	.ascii	"PCLK_Frequency\000"
.LASF113:
	.ascii	"caribou_uart_parity_t\000"
.LASF133:
	.ascii	"late_init\000"
.LASF0:
	.ascii	"signed char\000"
.LASF70:
	.ascii	"caribou_gpio_t\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF143:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF37:
	.ascii	"AHBRSTR\000"
.LASF64:
	.ascii	"readqueuefn\000"
.LASF73:
	.ascii	"CARIBOU_UART_BAUD_RATE_600\000"
.LASF120:
	.ascii	"CARIBOU_UART_DMA_RX\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF15:
	.ascii	"OPTKEYR\000"
.LASF145:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF96:
	.ascii	"CARIBOU_UART_BAUD_RATE_9000000\000"
.LASF19:
	.ascii	"MODER\000"
.LASF53:
	.ascii	"SYSCLK_Frequency\000"
.LASF56:
	.ascii	"ADCCLK_Frequency\000"
.LASF94:
	.ascii	"CARIBOU_UART_BAUD_RATE_7168000\000"
.LASF130:
	.ascii	"caribou_uart_config_t\000"
.LASF71:
	.ascii	"CARIBOU_UART_BAUD_RATE_110\000"
.LASF112:
	.ascii	"CARIBOU_UART_PARITY_ODD\000"
.LASF13:
	.ascii	"size_t\000"
.LASF18:
	.ascii	"FLASH_TypeDef\000"
.LASF40:
	.ascii	"RCC_TypeDef\000"
.LASF98:
	.ascii	"caribou_uart_baud_t\000"
.LASF109:
	.ascii	"caribou_uart_stop_t\000"
.LASF43:
	.ascii	"GPIO_Mode_AF\000"
.LASF44:
	.ascii	"GPIO_Mode_AN\000"
.LASF54:
	.ascii	"HCLK_Frequency\000"
.LASF121:
	.ascii	"CARIBOU_UART_DMA_TX\000"
.LASF51:
	.ascii	"GPIO_PuPd_UP\000"
.LASF23:
	.ascii	"PUPDR\000"
.LASF32:
	.ascii	"APB1RSTR\000"
.LASF122:
	.ascii	"CARIBOU_UART_DMA_BOTH\000"
.LASF11:
	.ascii	"char\000"
.LASF123:
	.ascii	"caribou_uart_dma_t\000"
.LASF105:
	.ascii	"CARIBOU_UART_STOPBITS_05\000"
.LASF33:
	.ascii	"AHBENR\000"
.LASF79:
	.ascii	"CARIBOU_UART_BAUD_RATE_28800\000"
.LASF146:
	.ascii	"_stdio_t\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF93:
	.ascii	"CARIBOU_UART_BAUD_RATE_3686400\000"
.LASF135:
	.ascii	"_stdin\000"
.LASF92:
	.ascii	"CARIBOU_UART_BAUD_RATE_3584000\000"
.LASF8:
	.ascii	"long long int\000"
.LASF80:
	.ascii	"CARIBOU_UART_BAUD_RATE_38400\000"
.LASF134:
	.ascii	"notify_heap_alloc_failed\000"
.LASF114:
	.ascii	"CARIBOU_UART_FLOW_NONE\000"
.LASF138:
	.ascii	"led1\000"
.LASF149:
	.ascii	"size\000"
.LASF38:
	.ascii	"CFGR2\000"
.LASF39:
	.ascii	"CFGR3\000"
.LASF34:
	.ascii	"APB2ENR\000"
.LASF125:
	.ascii	"word_size\000"
.LASF17:
	.ascii	"WRPR\000"
.LASF47:
	.ascii	"GPIO_Speed_Level_1\000"
.LASF22:
	.ascii	"OSPEEDR\000"
.LASF49:
	.ascii	"GPIO_Speed_Level_3\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF101:
	.ascii	"CARIBOU_UART_WORDSIZE_7\000"
.LASF103:
	.ascii	"CARIBOU_UART_WORDSIZE_9\000"
.LASF142:
	.ascii	"outD\000"
.LASF104:
	.ascii	"caribou_uart_word_t\000"
.LASF132:
	.ascii	"config\000"
.LASF21:
	.ascii	"RESERVED0\000"
.LASF24:
	.ascii	"RESERVED1\000"
.LASF25:
	.ascii	"RESERVED2\000"
.LASF28:
	.ascii	"RESERVED3\000"
.LASF2:
	.ascii	"short int\000"
.LASF116:
	.ascii	"CARIBOU_UART_FLOW_CTS\000"
.LASF10:
	.ascii	"long int\000"
.LASF126:
	.ascii	"stop_bits\000"
.LASF88:
	.ascii	"CARIBOU_UART_BAUD_RATE_460800\000"
.LASF139:
	.ascii	"outA\000"
.LASF140:
	.ascii	"outB\000"
.LASF141:
	.ascii	"outC\000"
.LASF59:
	.ascii	"USART1CLK_Frequency\000"
.LASF147:
	.ascii	"CLOCK_Configuration\000"
.LASF129:
	.ascii	"dma_mode\000"
.LASF20:
	.ascii	"OTYPER\000"
.LASF62:
	.ascii	"readfn\000"
.LASF84:
	.ascii	"CARIBOU_UART_BAUD_RATE_128000\000"
.LASF30:
	.ascii	"CFGR\000"
.LASF83:
	.ascii	"CARIBOU_UART_BAUD_RATE_115200\000"
.LASF61:
	.ascii	"device_private\000"
.LASF57:
	.ascii	"CECCLK_Frequency\000"
.LASF29:
	.ascii	"GPIO_TypeDef\000"
.LASF117:
	.ascii	"CARIBOU_UART_FLOW_RTS_CTS\000"
.LASF128:
	.ascii	"flow_control\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF91:
	.ascii	"CARIBOU_UART_BAUD_RATE_1843200\000"
.LASF68:
	.ascii	"port\000"
.LASF115:
	.ascii	"CARIBOU_UART_FLOW_RTS\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF95:
	.ascii	"CARIBOU_UART_BAUD_RATE_7372800\000"
.LASF50:
	.ascii	"GPIO_PuPd_NOPULL\000"
.LASF66:
	.ascii	"statefn\000"
.LASF76:
	.ascii	"CARIBOU_UART_BAUD_RATE_4800\000"
.LASF52:
	.ascii	"GPIO_PuPd_DOWN\000"
.LASF41:
	.ascii	"GPIO_Mode_IN\000"
.LASF67:
	.ascii	"stdio_t\000"
.LASF144:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../src/board.c\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF119:
	.ascii	"CARIBOU_UART_DMA_NONE\000"
.LASF97:
	.ascii	"CARIBOU_UART_BAUD_RATE_10500000\000"
.LASF89:
	.ascii	"CARIBOU_UART_BAUD_RATE_921600\000"
.LASF131:
	.ascii	"SYS_Clocks\000"
.LASF77:
	.ascii	"CARIBOU_UART_BAUD_RATE_9600\000"
.LASF46:
	.ascii	"GPIO_OType_OD\000"
.LASF124:
	.ascii	"baud_rate\000"
.LASF86:
	.ascii	"CARIBOU_UART_BAUD_RATE_230400\000"
.LASF148:
	.ascii	"early_init\000"
.LASF106:
	.ascii	"CARIBOU_UART_STOPBITS_1\000"
.LASF108:
	.ascii	"CARIBOU_UART_STOPBITS_2\000"
.LASF78:
	.ascii	"CARIBOU_UART_BAUD_RATE_19200\000"
.LASF137:
	.ascii	"_stderr\000"
.LASF27:
	.ascii	"LCKR\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
