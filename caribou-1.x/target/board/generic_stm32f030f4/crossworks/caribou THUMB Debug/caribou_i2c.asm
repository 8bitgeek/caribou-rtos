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
	.file	"i2c.c"
	.text
.Ltext0:
	.section	.text.caribou_i2c_reset,"ax",%progbits
	.align	1
	.global	caribou_i2c_reset
	.code	16
	.thumb_func
	.type	caribou_i2c_reset, %function
caribou_i2c_reset:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/dev/i2c.c"
	.loc 1 19 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 20 0
	ldr	r0, [r0]
.LVL1:
	bl	chip_i2c_reset
.LVL2:
	.loc 1 21 0
	@ sp needed
	pop	{r3, pc}
.LFE32:
	.size	caribou_i2c_reset, .-caribou_i2c_reset
	.section	.text.caribou_i2c_tx,"ax",%progbits
	.align	1
	.global	caribou_i2c_tx
	.code	16
	.thumb_func
	.type	caribou_i2c_tx, %function
caribou_i2c_tx:
.LFB33:
	.loc 1 32 0
.LVL3:
	push	{r4, lr}
.LCFI1:
	.loc 1 32 0
	mov	r3, r2
	.loc 1 33 0
	ldr	r2, [r0]
.LVL4:
	.loc 1 32 0
	mov	r4, r1
	.loc 1 33 0
	ldrb	r1, [r0, #4]
.LVL5:
	mov	r0, r2
.LVL6:
	mov	r2, r4
	bl	chip_i2c_tx
.LVL7:
	.loc 1 34 0
	@ sp needed
.LVL8:
	pop	{r4, pc}
.LFE33:
	.size	caribou_i2c_tx, .-caribou_i2c_tx
	.section	.text.caribou_i2c_rx,"ax",%progbits
	.align	1
	.global	caribou_i2c_rx
	.code	16
	.thumb_func
	.type	caribou_i2c_rx, %function
caribou_i2c_rx:
.LFB34:
	.loc 1 45 0
.LVL9:
	push	{r4, lr}
.LCFI2:
	.loc 1 45 0
	mov	r3, r2
	.loc 1 46 0
	ldr	r2, [r0]
.LVL10:
	.loc 1 45 0
	mov	r4, r1
	.loc 1 46 0
	ldrb	r1, [r0, #4]
.LVL11:
	mov	r0, r2
.LVL12:
	mov	r2, r4
	bl	chip_i2c_rx
.LVL13:
	.loc 1 47 0
	@ sp needed
.LVL14:
	pop	{r4, pc}
.LFE34:
	.size	caribou_i2c_rx, .-caribou_i2c_rx
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
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
	.byte	0xe
	.uleb128 0x8
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
	.byte	0x4
	.4byte	.LCFI2-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../../include/caribou/dev/i2c.h"
	.file 5 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/i2c.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2a6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x1
	.4byte	.LASF31
	.4byte	.LASF32
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF4
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
	.byte	0x2c
	.byte	0x3
	.2byte	0x1ae
	.4byte	0x126
	.uleb128 0x7
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x1b0
	.4byte	0x88
	.byte	0
	.uleb128 0x7
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x1b1
	.4byte	0x88
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x1b2
	.4byte	0x88
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x1b3
	.4byte	0x88
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x1b4
	.4byte	0x88
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x1b5
	.4byte	0x88
	.byte	0x14
	.uleb128 0x7
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x1b6
	.4byte	0x88
	.byte	0x18
	.uleb128 0x7
	.ascii	"ICR\000"
	.byte	0x3
	.2byte	0x1b7
	.4byte	0x88
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x1b8
	.4byte	0x88
	.byte	0x20
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x1b9
	.4byte	0x88
	.byte	0x24
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x1ba
	.4byte	0x88
	.byte	0x28
	.byte	0
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1bb
	.4byte	0x8d
	.uleb128 0xa
	.byte	0x8
	.byte	0x4
	.byte	0x1a
	.4byte	0x153
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x4
	.byte	0x1c
	.4byte	0x153
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x4
	.byte	0x1d
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x126
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x4
	.byte	0x1e
	.4byte	0x132
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x1
	.byte	0x12
	.4byte	0x4c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x196
	.uleb128 0xe
	.ascii	"i2c\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x196
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LVL2
	.4byte	0x250
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x159
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x1
	.byte	0x1f
	.4byte	0x4c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f3
	.uleb128 0xe
	.ascii	"i2c\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x196
	.4byte	.LLST1
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x1f
	.4byte	0x1f3
	.4byte	.LLST2
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x1f
	.4byte	0x2c
	.4byte	.LLST3
	.uleb128 0x11
	.4byte	.LVL7
	.4byte	0x265
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x2c
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x1
	.byte	0x2c
	.4byte	0x4c
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x250
	.uleb128 0xe
	.ascii	"i2c\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x196
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x2c
	.4byte	0x1f3
	.4byte	.LLST5
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0x2c
	.4byte	0x2c
	.4byte	.LLST6
	.uleb128 0x11
	.4byte	.LVL13
	.4byte	0x289
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x5
	.byte	0x22
	.4byte	0x4c
	.4byte	0x265
	.uleb128 0x14
	.4byte	0x153
	.byte	0
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x5
	.byte	0x23
	.4byte	0x4c
	.4byte	0x289
	.uleb128 0x14
	.4byte	0x153
	.uleb128 0x14
	.4byte	0x2c
	.uleb128 0x14
	.4byte	0x1f3
	.uleb128 0x14
	.4byte	0x2c
	.byte	0
	.uleb128 0x15
	.4byte	.LASF33
	.byte	0x5
	.byte	0x24
	.4byte	0x4c
	.uleb128 0x14
	.4byte	0x153
	.uleb128 0x14
	.4byte	0x2c
	.uleb128 0x14
	.4byte	0x1f3
	.uleb128 0x14
	.4byte	0x2c
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL5
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL8
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL9
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL11
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL14
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL10
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
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
.LASF27:
	.ascii	"caribou_i2c_rx\000"
.LASF24:
	.ascii	"caribou_i2c_tx\000"
.LASF14:
	.ascii	"TIMINGR\000"
.LASF25:
	.ascii	"data\000"
.LASF32:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"TXDR\000"
.LASF12:
	.ascii	"OAR1\000"
.LASF16:
	.ascii	"PECR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF30:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF13:
	.ascii	"OAR2\000"
.LASF15:
	.ascii	"TIMEOUTR\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF31:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/dev/i2c.c\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF33:
	.ascii	"chip_i2c_rx\000"
.LASF28:
	.ascii	"chip_i2c_reset\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF29:
	.ascii	"chip_i2c_tx\000"
.LASF7:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"char\000"
.LASF20:
	.ascii	"port\000"
.LASF2:
	.ascii	"short int\000"
.LASF21:
	.ascii	"device_address\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF9:
	.ascii	"long int\000"
.LASF22:
	.ascii	"caribou_i2c_t\000"
.LASF17:
	.ascii	"RXDR\000"
.LASF0:
	.ascii	"signed char\000"
.LASF19:
	.ascii	"I2C_TypeDef\000"
.LASF26:
	.ascii	"length\000"
.LASF23:
	.ascii	"caribou_i2c_reset\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
