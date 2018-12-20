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
	.file	"nucleo_f091_demo.c"
	.text
.Ltext0:
	.global	button_thread_stack
	.section	.bss.button_thread_stack,"aw",%nobits
	.align	2
	.type	button_thread_stack, %object
	.size	button_thread_stack, 1024
button_thread_stack:
	.space	1024
	.global	led_thread_stack
	.section	.bss.led_thread_stack,"aw",%nobits
	.align	2
	.type	led_thread_stack, %object
	.size	led_thread_stack, 1024
led_thread_stack:
	.space	1024
	.global	queue
	.section	.bss.queue,"aw",%nobits
	.align	2
	.type	queue, %object
	.size	queue, 12
queue:
	.space	12
	.global	queue_msgs
	.section	.bss.queue_msgs,"aw",%nobits
	.align	2
	.type	queue_msgs, %object
	.size	queue_msgs, 16
queue_msgs:
	.space	16
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"D\000"
	.align	2
.LC3:
	.ascii	"U\000"
	.section	.text.button_thread,"ax",%progbits
	.align	2
	.global	button_thread
	.code	16
	.thumb_func
	.type	button_thread, %function
button_thread:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../src/nucleo_f091_demo.c"
	.loc 1 40 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
.L4:
.LBB2:
	.loc 1 43 0
	movs	r0, #2
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 44 0
	movs	r0, #10
	movs	r1, #0
	bl	caribou_thread_sleep_current
	.loc 1 45 0
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r3, .L5
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_pinstate
	subs	r3, r0, #0
	bne	.L2
	.loc 1 46 0
	ldr	r2, .L5+4
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	strcpy
	b	.L3
.L2:
	.loc 1 48 0
	ldr	r2, .L5+8
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	strcpy
.L3:
	.loc 1 49 0
	ldr	r1, [r7, #12]
	ldr	r0, .L5+12
	movs	r2, #0
	movs	r3, #0
	bl	caribou_queue_post
.LBE2:
	.loc 1 50 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	pb1
	.word	.LC1
	.word	.LC3
	.word	queue
.LFE32:
	.size	button_thread, .-button_thread
	.section	.text.led_thread,"ax",%progbits
	.align	2
	.global	led_thread
	.code	16
	.thumb_func
	.type	led_thread, %function
led_thread:
.LFB33:
	.loc 1 59 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
.L11:
.LBB3:
	.loc 1 62 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 63 0
	movs	r3, #12
	adds	r1, r7, r3
	ldr	r0, .L12
	movs	r2, #0
	movs	r3, #0
	bl	caribou_queue_take_first
	subs	r3, r0, #0
	beq	.L11
	.loc 1 65 0
	ldr	r3, [r7, #12]
	ldr	r2, .L12+4
	movs	r1, r2
	movs	r0, r3
	bl	strcmp
	subs	r3, r0, #0
	bne	.L9
	.loc 1 67 0
	ldr	r3, .L12+8
	ldr	r2, [r3]
	ldr	r3, .L12+8
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_set
	b	.L10
.L9:
	.loc 1 71 0
	ldr	r3, .L12+8
	ldr	r2, [r3]
	ldr	r3, .L12+8
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
.L10:
	.loc 1 73 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	free
.LBE3:
	.loc 1 75 0
	b	.L11
.L13:
	.align	2
.L12:
	.word	queue
	.word	.LC1
	.word	led1
.LFE33:
	.size	led_thread, .-led_thread
	.section	.text.board_idle,"ax",%progbits
	.align	2
	.global	board_idle
	.code	16
	.thumb_func
	.type	board_idle, %function
board_idle:
.LFB34:
	.loc 1 79 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	.loc 1 83 0
	ldr	r3, .L19
	ldr	r0, [r3]
	ldr	r1, [r3, #4]
	movs	r3, #250
	lsls	r3, r3, #2
	movs	r4, #0
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L18
	.loc 1 85 0
	ldr	r3, .L19+4
	ldrb	r3, [r3]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	movs	r2, r3
	ldr	r3, .L19+4
	strb	r2, [r3]
	.loc 1 86 0
	ldr	r3, .L19+4
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L16
	.loc 1 88 0
	ldr	r3, .L19+8
	ldr	r2, [r3]
	ldr	r3, .L19+8
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_set
	.loc 1 89 0
	ldr	r3, .L19+12
	ldr	r2, [r3]
	ldr	r3, .L19+12
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 90 0
	ldr	r3, .L19+16
	ldr	r2, [r3]
	ldr	r3, .L19+16
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_set
	.loc 1 91 0
	ldr	r3, .L19+20
	ldr	r2, [r3]
	ldr	r3, .L19+20
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	b	.L17
.L16:
	.loc 1 96 0
	ldr	r3, .L19+8
	ldr	r2, [r3]
	ldr	r3, .L19+8
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 97 0
	ldr	r3, .L19+12
	ldr	r2, [r3]
	ldr	r3, .L19+12
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_set
	.loc 1 98 0
	ldr	r3, .L19+16
	ldr	r2, [r3]
	ldr	r3, .L19+16
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	.loc 1 99 0
	ldr	r3, .L19+20
	ldr	r2, [r3]
	ldr	r3, .L19+20
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_set
.L17:
	.loc 1 107 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	ldr	r2, .L19
	str	r3, [r2]
	str	r4, [r2, #4]
.L18:
	.loc 1 109 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r4, r5, r7, pc}
.L20:
	.align	2
.L19:
	.word	start.6817
	.word	state.6816
	.word	outA
	.word	outB
	.word	outC
	.word	outD
.LFE34:
	.size	board_idle, .-board_idle
	.section	.rodata.str1.4
	.align	2
.LC18:
	.ascii	"button_thread\000"
	.align	2
.LC22:
	.ascii	"led_thread\000"
	.section	.text.main,"ax",%progbits
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB35:
	.loc 1 112 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #24
.LCFI9:
	add	r7, sp, #16
.LCFI10:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 116 0
	movs	r0, #0
	bl	caribou_init
	.loc 1 119 0
	ldr	r2, .L23
	ldr	r3, .L23+4
	movs	r1, #4
	movs	r0, r3
	bl	caribou_queue_init
	.loc 1 122 0
	ldr	r1, .L23+8
	ldr	r0, .L23+12
	movs	r3, #1
	str	r3, [sp, #8]
	movs	r3, #128
	lsls	r3, r3, #3
	str	r3, [sp, #4]
	ldr	r3, .L23+16
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #0
	bl	caribou_thread_create
	.loc 1 123 0
	ldr	r1, .L23+20
	ldr	r0, .L23+24
	movs	r3, #1
	str	r3, [sp, #8]
	movs	r3, #128
	lsls	r3, r3, #3
	str	r3, [sp, #4]
	ldr	r3, .L23+28
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #0
	bl	caribou_thread_create
	.loc 1 130 0
	bl	caribou_exec
	movs	r3, #0
	.loc 1 131 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	queue_msgs
	.word	queue
	.word	button_thread
	.word	.LC18
	.word	button_thread_stack
	.word	led_thread
	.word	.LC22
	.word	led_thread_stack
.LFE35:
	.size	main, .-main
	.section	.bss.start.6817,"aw",%nobits
	.align	3
	.type	start.6817, %object
	.size	start.6817, 8
start.6817:
	.space	8
	.section	.bss.state.6816,"aw",%nobits
	.type	state.6816, %object
	.size	state.6816, 1
state.6816:
	.space	1
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
	.uleb128 0x18
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
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
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
	.4byte	.LCFI6-.LFB34
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x10
	.align	2
.LEFDE6:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../../include/caribou/dev/gpio.h"
	.file 5 "../../../../include/caribou/lib/queue.h"
	.file 6 "../include/board.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3a1
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0xc
	.4byte	.LASF48
	.4byte	.LASF49
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
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
	.4byte	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x23
	.4byte	0x70
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
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x7
	.4byte	0x53
	.uleb128 0x8
	.4byte	0x9b
	.4byte	0xb0
	.uleb128 0x9
	.4byte	0x94
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.uleb128 0xa
	.byte	0x2c
	.byte	0x3
	.2byte	0x18c
	.4byte	0x175
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x18e
	.4byte	0x9b
	.byte	0
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x18f
	.4byte	0xb0
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x190
	.4byte	0x3a
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x191
	.4byte	0x9b
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x192
	.4byte	0x9b
	.byte	0xc
	.uleb128 0xc
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x193
	.4byte	0xb0
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x194
	.4byte	0x3a
	.byte	0x12
	.uleb128 0xc
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x195
	.4byte	0xb0
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x196
	.4byte	0x3a
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x197
	.4byte	0x9b
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x198
	.4byte	0x9b
	.byte	0x1c
	.uleb128 0xc
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x199
	.4byte	0x175
	.byte	0x20
	.uleb128 0xc
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x19a
	.4byte	0xb0
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x19b
	.4byte	0x3a
	.byte	0x2a
	.byte	0
	.uleb128 0x7
	.4byte	0xa0
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x19c
	.4byte	0xb5
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.byte	0x1a
	.4byte	0x1a7
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x4
	.byte	0x1c
	.4byte	0x1a7
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x4
	.byte	0x1d
	.4byte	0x3a
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x17a
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x4
	.byte	0x1e
	.4byte	0x186
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x5
	.byte	0x1e
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0xc
	.byte	0x5
	.byte	0x20
	.4byte	0x1f0
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x5
	.byte	0x22
	.4byte	0x4c
	.byte	0
	.uleb128 0xf
	.4byte	.LASF28
	.byte	0x5
	.byte	0x23
	.4byte	0x4c
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF29
	.byte	0x5
	.byte	0x24
	.4byte	0x1f0
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1f6
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1b8
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x5
	.byte	0x25
	.4byte	0x1bf
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x1
	.byte	0x27
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x243
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x15
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0x3a
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27f
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x7e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x15
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x1
	.byte	0x4e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b7
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x1
	.byte	0x50
	.4byte	0x8d
	.uleb128 0x5
	.byte	0x3
	.4byte	state.6816
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.byte	0x51
	.4byte	0x65
	.uleb128 0x5
	.byte	0x3
	.4byte	start.6817
	.byte	0
	.uleb128 0x17
	.4byte	.LASF52
	.byte	0x1
	.byte	0x6f
	.4byte	0x4c
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f7
	.uleb128 0x18
	.4byte	.LASF36
	.byte	0x1
	.byte	0x6f
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LASF37
	.byte	0x1
	.byte	0x6f
	.4byte	0x2f7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x71
	.4byte	0x4c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x87
	.uleb128 0x1a
	.4byte	.LASF38
	.byte	0x6
	.byte	0x1d
	.4byte	0x1ad
	.uleb128 0x1b
	.ascii	"pb1\000"
	.byte	0x6
	.byte	0x1e
	.4byte	0x1ad
	.uleb128 0x1a
	.4byte	.LASF39
	.byte	0x6
	.byte	0x20
	.4byte	0x1ad
	.uleb128 0x1a
	.4byte	.LASF40
	.byte	0x6
	.byte	0x21
	.4byte	0x1ad
	.uleb128 0x1a
	.4byte	.LASF41
	.byte	0x6
	.byte	0x23
	.4byte	0x1ad
	.uleb128 0x1a
	.4byte	.LASF42
	.byte	0x6
	.byte	0x24
	.4byte	0x1ad
	.uleb128 0x8
	.4byte	0x8d
	.4byte	0x350
	.uleb128 0x1c
	.4byte	0x94
	.2byte	0x3ff
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF43
	.byte	0x1
	.byte	0x1d
	.4byte	0x33f
	.uleb128 0x5
	.byte	0x3
	.4byte	button_thread_stack
	.uleb128 0x1d
	.4byte	.LASF44
	.byte	0x1
	.byte	0x1e
	.4byte	0x33f
	.uleb128 0x5
	.byte	0x3
	.4byte	led_thread_stack
	.uleb128 0x1d
	.4byte	.LASF45
	.byte	0x1
	.byte	0x1f
	.4byte	0x1fc
	.uleb128 0x5
	.byte	0x3
	.4byte	queue
	.uleb128 0x8
	.4byte	0x7e
	.4byte	0x393
	.uleb128 0x9
	.4byte	0x94
	.byte	0x3
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF46
	.byte	0x1
	.byte	0x20
	.4byte	0x383
	.uleb128 0x5
	.byte	0x3
	.4byte	queue_msgs
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x8d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3a5
	.4byte	0x207
	.ascii	"button_thread\000"
	.4byte	0x243
	.ascii	"led_thread\000"
	.4byte	0x27f
	.ascii	"board_idle\000"
	.4byte	0x2b7
	.ascii	"main\000"
	.4byte	0x350
	.ascii	"button_thread_stack\000"
	.4byte	0x361
	.ascii	"led_thread_stack\000"
	.4byte	0x372
	.ascii	"queue\000"
	.4byte	0x393
	.ascii	"queue_msgs\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x149
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3a5
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x45
	.ascii	"short unsigned int\000"
	.4byte	0x3a
	.ascii	"uint16_t\000"
	.4byte	0x4c
	.ascii	"int\000"
	.4byte	0x5e
	.ascii	"unsigned int\000"
	.4byte	0x53
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x65
	.ascii	"int64_t\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x80
	.ascii	"long int\000"
	.4byte	0x8d
	.ascii	"char\000"
	.4byte	0x94
	.ascii	"sizetype\000"
	.4byte	0x17a
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x1ad
	.ascii	"caribou_gpio_t\000"
	.4byte	0x1b8
	.ascii	"caribou_queue_msg_t\000"
	.4byte	0x1bf
	.ascii	"_caribou_queue_t\000"
	.4byte	0x1fc
	.ascii	"caribou_queue_t\000"
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
.LASF46:
	.ascii	"queue_msgs\000"
.LASF7:
	.ascii	"int64_t\000"
.LASF16:
	.ascii	"OSPEEDR\000"
.LASF30:
	.ascii	"caribou_queue_t\000"
.LASF13:
	.ascii	"MODER\000"
.LASF34:
	.ascii	"state\000"
.LASF28:
	.ascii	"count\000"
.LASF35:
	.ascii	"start\000"
.LASF20:
	.ascii	"BSRR\000"
.LASF15:
	.ascii	"RESERVED0\000"
.LASF18:
	.ascii	"RESERVED1\000"
.LASF19:
	.ascii	"RESERVED2\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF48:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../src/nucleo_f09"
	.ascii	"1_demo.c\000"
.LASF14:
	.ascii	"OTYPER\000"
.LASF44:
	.ascii	"led_thread_stack\000"
.LASF39:
	.ascii	"outA\000"
.LASF32:
	.ascii	"led_thread\000"
.LASF41:
	.ascii	"outC\000"
.LASF42:
	.ascii	"outD\000"
.LASF25:
	.ascii	"pinmask\000"
.LASF33:
	.ascii	"board_idle\000"
.LASF26:
	.ascii	"caribou_gpio_t\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF50:
	.ascii	"caribou_queue_msg_t\000"
.LASF40:
	.ascii	"outB\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF2:
	.ascii	"short int\000"
.LASF47:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF29:
	.ascii	"msgs\000"
.LASF23:
	.ascii	"GPIO_TypeDef\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF52:
	.ascii	"main\000"
.LASF36:
	.ascii	"argc\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF17:
	.ascii	"PUPDR\000"
.LASF45:
	.ascii	"queue\000"
.LASF8:
	.ascii	"long long int\000"
.LASF27:
	.ascii	"depth\000"
.LASF11:
	.ascii	"char\000"
.LASF51:
	.ascii	"_caribou_queue_t\000"
.LASF43:
	.ascii	"button_thread_stack\000"
.LASF24:
	.ascii	"port\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF37:
	.ascii	"argv\000"
.LASF31:
	.ascii	"button_thread\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF10:
	.ascii	"long int\000"
.LASF49:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF0:
	.ascii	"signed char\000"
.LASF38:
	.ascii	"led1\000"
.LASF21:
	.ascii	"LCKR\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
