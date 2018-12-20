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
	.file	"nucleo_f030_demo.c"
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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../src/nucleo_f030_demo.c"
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
	beq	.L9
	.loc 1 67 0
	ldr	r3, .L12+8
	ldr	r2, [r3]
	ldr	r3, .L12+8
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_reset
	b	.L10
.L9:
	.loc 1 71 0
	ldr	r3, .L12+8
	ldr	r2, [r3]
	ldr	r3, .L12+8
	ldrh	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	chip_gpio_set
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
	.section	.rodata.str1.4
	.align	2
.LC12:
	.ascii	"button_thread\000"
	.align	2
.LC16:
	.ascii	"led_thread\000"
	.section	.text.main,"ax",%progbits
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB34:
	.loc 1 79 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #24
.LCFI7:
	add	r7, sp, #16
.LCFI8:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 83 0
	movs	r0, #0
	bl	caribou_init
	.loc 1 86 0
	ldr	r2, .L16
	ldr	r3, .L16+4
	movs	r1, #4
	movs	r0, r3
	bl	caribou_queue_init
	.loc 1 89 0
	ldr	r1, .L16+8
	ldr	r0, .L16+12
	movs	r3, #1
	str	r3, [sp, #8]
	movs	r3, #128
	lsls	r3, r3, #3
	str	r3, [sp, #4]
	ldr	r3, .L16+16
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #0
	bl	caribou_thread_create
	.loc 1 90 0
	ldr	r1, .L16+20
	ldr	r0, .L16+24
	movs	r3, #1
	str	r3, [sp, #8]
	movs	r3, #128
	lsls	r3, r3, #3
	str	r3, [sp, #4]
	ldr	r3, .L16+28
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #0
	bl	caribou_thread_create
	.loc 1 97 0
	bl	caribou_exec
	movs	r3, #0
	.loc 1 98 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	queue_msgs
	.word	queue
	.word	button_thread
	.word	.LC12
	.word	button_thread_stack
	.word	led_thread
	.word	.LC16
	.word	led_thread_stack
.LFE34:
	.size	main, .-main
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x10
	.align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../../include/caribou/dev/gpio.h"
	.file 5 "../../../../include/caribou/lib/queue.h"
	.file 6 "../include/board.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x332
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0xc
	.4byte	.LASF40
	.4byte	.LASF41
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
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x6
	.byte	0x4
	.4byte	0x82
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x7
	.4byte	0x53
	.uleb128 0x8
	.4byte	0x90
	.4byte	0xa5
	.uleb128 0x9
	.4byte	0x89
	.byte	0x1
	.byte	0
	.uleb128 0x7
	.4byte	0x3a
	.uleb128 0xa
	.byte	0x2c
	.byte	0x3
	.2byte	0x18c
	.4byte	0x16a
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x18e
	.4byte	0x90
	.byte	0
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x18f
	.4byte	0xa5
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x190
	.4byte	0x3a
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x191
	.4byte	0x90
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x192
	.4byte	0x90
	.byte	0xc
	.uleb128 0xc
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x193
	.4byte	0xa5
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x194
	.4byte	0x3a
	.byte	0x12
	.uleb128 0xc
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x195
	.4byte	0xa5
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x196
	.4byte	0x3a
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x197
	.4byte	0x90
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x198
	.4byte	0x90
	.byte	0x1c
	.uleb128 0xc
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x199
	.4byte	0x16a
	.byte	0x20
	.uleb128 0xc
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x19a
	.4byte	0xa5
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x19b
	.4byte	0x3a
	.byte	0x2a
	.byte	0
	.uleb128 0x7
	.4byte	0x95
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x19c
	.4byte	0xaa
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.byte	0x1a
	.4byte	0x19c
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x4
	.byte	0x1c
	.4byte	0x19c
	.byte	0
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x4
	.byte	0x1d
	.4byte	0x3a
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x16f
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x4
	.byte	0x1e
	.4byte	0x17b
	.uleb128 0x10
	.4byte	.LASF42
	.byte	0x5
	.byte	0x1e
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0xc
	.byte	0x5
	.byte	0x20
	.4byte	0x1e5
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x5
	.byte	0x22
	.4byte	0x4c
	.byte	0
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x5
	.byte	0x23
	.4byte	0x4c
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF28
	.byte	0x5
	.byte	0x24
	.4byte	0x1e5
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1eb
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1ad
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x5
	.byte	0x25
	.4byte	0x1b4
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.byte	0x27
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x238
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x73
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
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x1
	.byte	0x3a
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x274
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x73
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
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x1
	.byte	0x4e
	.4byte	0x4c
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b4
	.uleb128 0x17
	.4byte	.LASF32
	.byte	0x1
	.byte	0x4e
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF33
	.byte	0x1
	.byte	0x4e
	.4byte	0x2b4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x4c
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x7c
	.uleb128 0x19
	.4byte	.LASF34
	.byte	0x6
	.byte	0x1d
	.4byte	0x1a2
	.uleb128 0x1a
	.ascii	"pb1\000"
	.byte	0x6
	.byte	0x1e
	.4byte	0x1a2
	.uleb128 0x8
	.4byte	0x82
	.4byte	0x2e1
	.uleb128 0x1b
	.4byte	0x89
	.2byte	0x3ff
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF35
	.byte	0x1
	.byte	0x1d
	.4byte	0x2d0
	.uleb128 0x5
	.byte	0x3
	.4byte	button_thread_stack
	.uleb128 0x1c
	.4byte	.LASF36
	.byte	0x1
	.byte	0x1e
	.4byte	0x2d0
	.uleb128 0x5
	.byte	0x3
	.4byte	led_thread_stack
	.uleb128 0x1c
	.4byte	.LASF37
	.byte	0x1
	.byte	0x1f
	.4byte	0x1f1
	.uleb128 0x5
	.byte	0x3
	.4byte	queue
	.uleb128 0x8
	.4byte	0x73
	.4byte	0x324
	.uleb128 0x9
	.4byte	0x89
	.byte	0x3
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF38
	.byte	0x1
	.byte	0x20
	.4byte	0x314
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.4byte	0x7e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x336
	.4byte	0x1fc
	.ascii	"button_thread\000"
	.4byte	0x238
	.ascii	"led_thread\000"
	.4byte	0x274
	.ascii	"main\000"
	.4byte	0x2e1
	.ascii	"button_thread_stack\000"
	.4byte	0x2f2
	.ascii	"led_thread_stack\000"
	.4byte	0x303
	.ascii	"queue\000"
	.4byte	0x324
	.ascii	"queue_msgs\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x13d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x336
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
	.4byte	0x65
	.ascii	"long long int\000"
	.4byte	0x6c
	.ascii	"long long unsigned int\000"
	.4byte	0x75
	.ascii	"long int\000"
	.4byte	0x82
	.ascii	"char\000"
	.4byte	0x89
	.ascii	"sizetype\000"
	.4byte	0x16f
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x1a2
	.ascii	"caribou_gpio_t\000"
	.4byte	0x1ad
	.ascii	"caribou_queue_msg_t\000"
	.4byte	0x1b4
	.ascii	"_caribou_queue_t\000"
	.4byte	0x1f1
	.ascii	"caribou_queue_t\000"
	.4byte	0
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
.LASF38:
	.ascii	"queue_msgs\000"
.LASF15:
	.ascii	"OSPEEDR\000"
.LASF29:
	.ascii	"caribou_queue_t\000"
.LASF12:
	.ascii	"MODER\000"
.LASF27:
	.ascii	"count\000"
.LASF19:
	.ascii	"BSRR\000"
.LASF14:
	.ascii	"RESERVED0\000"
.LASF17:
	.ascii	"RESERVED1\000"
.LASF18:
	.ascii	"RESERVED2\000"
.LASF21:
	.ascii	"RESERVED3\000"
.LASF13:
	.ascii	"OTYPER\000"
.LASF36:
	.ascii	"led_thread_stack\000"
.LASF31:
	.ascii	"led_thread\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"pinmask\000"
.LASF25:
	.ascii	"caribou_gpio_t\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF42:
	.ascii	"caribou_queue_msg_t\000"
.LASF41:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF2:
	.ascii	"short int\000"
.LASF40:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../src/nucleo_f03"
	.ascii	"0_demo.c\000"
.LASF39:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF28:
	.ascii	"msgs\000"
.LASF22:
	.ascii	"GPIO_TypeDef\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF44:
	.ascii	"main\000"
.LASF32:
	.ascii	"argc\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF16:
	.ascii	"PUPDR\000"
.LASF37:
	.ascii	"queue\000"
.LASF7:
	.ascii	"long long int\000"
.LASF26:
	.ascii	"depth\000"
.LASF10:
	.ascii	"char\000"
.LASF43:
	.ascii	"_caribou_queue_t\000"
.LASF35:
	.ascii	"button_thread_stack\000"
.LASF23:
	.ascii	"port\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF33:
	.ascii	"argv\000"
.LASF30:
	.ascii	"button_thread\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF9:
	.ascii	"long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF34:
	.ascii	"led1\000"
.LASF20:
	.ascii	"LCKR\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
