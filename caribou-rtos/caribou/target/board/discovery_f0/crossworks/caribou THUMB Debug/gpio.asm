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
	.file	"gpio.c"
	.text
.Ltext0:
	.section	.text.chip_gpio_toggle,"ax",%progbits
	.align	1
	.global	chip_gpio_toggle
	.code	16
	.thumb_func
	.type	chip_gpio_toggle, %function
chip_gpio_toggle:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/src/gpio.c"
	.loc 1 25 0
.LVL0:
	.loc 1 26 0
	ldrh	r3, [r0, #20]
.LVL1:
	.loc 1 27 0
	tst	r3, r1
	beq	.L2
	.loc 1 28 0
	lsl	r1, r1, #16
.LVL2:
.L2:
	.loc 1 30 0
	str	r1, [r0, #24]
	.loc 1 31 0
	@ sp needed
	bx	lr
.LFE32:
	.size	chip_gpio_toggle, .-chip_gpio_toggle
	.section	.text.chip_gpio_set,"ax",%progbits
	.align	1
	.global	chip_gpio_set
	.code	16
	.thumb_func
	.type	chip_gpio_set, %function
chip_gpio_set:
.LFB33:
	.loc 1 34 0
.LVL3:
	.loc 1 35 0
	str	r1, [r0, #24]
	.loc 1 36 0
	@ sp needed
	bx	lr
.LFE33:
	.size	chip_gpio_set, .-chip_gpio_set
	.section	.text.chip_gpio_reset,"ax",%progbits
	.align	1
	.global	chip_gpio_reset
	.code	16
	.thumb_func
	.type	chip_gpio_reset, %function
chip_gpio_reset:
.LFB34:
	.loc 1 39 0
.LVL4:
	.loc 1 40 0
	lsl	r1, r1, #16
.LVL5:
	str	r1, [r0, #24]
	.loc 1 41 0
	@ sp needed
	bx	lr
.LFE34:
	.size	chip_gpio_reset, .-chip_gpio_reset
	.section	.text.chip_gpio_pinstate,"ax",%progbits
	.align	1
	.global	chip_gpio_pinstate
	.code	16
	.thumb_func
	.type	chip_gpio_pinstate, %function
chip_gpio_pinstate:
.LFB35:
	.loc 1 44 0
.LVL6:
	.loc 1 47 0
	lsl	r2, r1, #1
.LVL7:
	.loc 1 44 0
	push	{r4, lr}
.LCFI0:
	.loc 1 47 0
	mov	r3, #3
	.loc 1 48 0
	ldr	r4, [r0]
.LVL8:
	.loc 1 47 0
	lsl	r3, r3, r2
.LVL9:
	.loc 1 48 0
	and	r3, r4
.LVL10:
	lsr	r3, r3, r2
	uxth	r3, r3
	.loc 1 49 0
	cmp	r3, #1
	beq	.L9
	cmp	r3, #2
	beq	.L10
	cmp	r3, #0
	bne	.L13
	b	.L10
.L9:
	.loc 1 55 0
	ldrh	r0, [r0, #20]
.LVL11:
	b	.L14
.LVL12:
.L10:
	.loc 1 58 0
	ldrh	r0, [r0, #16]
.LVL13:
.L14:
	and	r0, r1
.LVL14:
	.loc 1 59 0
	b	.L8
.LVL15:
.L13:
	.loc 1 45 0
	mov	r0, #0
.LVL16:
.L8:
	.loc 1 64 0
	@ sp needed
.LVL17:
	pop	{r4, pc}
.LFE35:
	.size	chip_gpio_pinstate, .-chip_gpio_pinstate
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
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI0-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x281
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x1
	.4byte	.LASF32
	.4byte	.LASF33
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x5
	.4byte	0x53
	.uleb128 0x6
	.4byte	0x53
	.4byte	0x9d
	.uleb128 0x7
	.4byte	0x81
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x3a
	.uleb128 0x8
	.byte	0x2c
	.byte	0x3
	.2byte	0x18c
	.4byte	0x162
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x18e
	.4byte	0x88
	.byte	0
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x18f
	.4byte	0x9d
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x190
	.4byte	0x3a
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x191
	.4byte	0x88
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x192
	.4byte	0x88
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x193
	.4byte	0x9d
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x194
	.4byte	0x3a
	.byte	0x12
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x195
	.4byte	0x9d
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x196
	.4byte	0x3a
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x197
	.4byte	0x88
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x198
	.4byte	0x88
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x199
	.4byte	0x162
	.byte	0x20
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x19a
	.4byte	0x9d
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x19b
	.4byte	0x3a
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0x8d
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x19c
	.4byte	0xa2
	.uleb128 0xc
	.byte	0x4
	.4byte	0x167
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0x18
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b8
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x18
	.4byte	0x173
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x18
	.4byte	0x3a
	.4byte	.LLST0
	.uleb128 0x10
	.ascii	"d\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x3a
	.4byte	.LLST1
	.byte	0
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x21
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e8
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x21
	.4byte	0x173
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x21
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x1
	.byte	0x26
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21a
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x26
	.4byte	0x173
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0x26
	.4byte	0x3a
	.4byte	.LLST2
	.byte	0
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x2b
	.4byte	0x3a
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x2b
	.4byte	0x173
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x2b
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x10
	.ascii	"d\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x3a
	.4byte	.LLST4
	.uleb128 0x12
	.ascii	"bit\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x1
	.byte	0x2f
	.4byte	0x53
	.4byte	.LLST5
	.uleb128 0x13
	.4byte	.LASF30
	.byte	0x1
	.byte	0x30
	.4byte	0x3a
	.4byte	.LLST6
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL5
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL16
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LFE35
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x5
	.byte	0x33
	.byte	0x72
	.sleb128 0
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL10
	.4byte	.LFE35
	.2byte	0x5
	.byte	0x33
	.byte	0x72
	.sleb128 0
	.byte	0x24
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL8
	.4byte	.LVL17
	.2byte	0xb
	.byte	0x33
	.byte	0x72
	.sleb128 0
	.byte	0x24
	.byte	0x74
	.sleb128 0
	.byte	0x1a
	.byte	0x72
	.sleb128 0
	.byte	0x25
	.byte	0x9f
	.4byte	0
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
.LASF15:
	.ascii	"OSPEEDR\000"
.LASF12:
	.ascii	"MODER\000"
.LASF32:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/src/gpio.c\000"
.LASF19:
	.ascii	"BSRR\000"
.LASF29:
	.ascii	"mode_mask\000"
.LASF14:
	.ascii	"RESERVED0\000"
.LASF17:
	.ascii	"RESERVED1\000"
.LASF18:
	.ascii	"RESERVED2\000"
.LASF21:
	.ascii	"RESERVED3\000"
.LASF22:
	.ascii	"GPIO_TypeDef\000"
.LASF13:
	.ascii	"OTYPER\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"pinmask\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF31:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"chip_gpio_toggle\000"
.LASF26:
	.ascii	"chip_gpio_set\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF27:
	.ascii	"chip_gpio_reset\000"
.LASF33:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF28:
	.ascii	"chip_gpio_pinstate\000"
.LASF30:
	.ascii	"mode\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"char\000"
.LASF16:
	.ascii	"PUPDR\000"
.LASF23:
	.ascii	"port\000"
.LASF2:
	.ascii	"short int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF9:
	.ascii	"long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF20:
	.ascii	"LCKR\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
