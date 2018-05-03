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
	.file	"stm32f0xx_misc.c"
	.text
.Ltext0:
	.section	.text.NVIC_Init,"ax",%progbits
	.align	1
	.global	NVIC_Init
	.code	16
	.thumb_func
	.type	NVIC_Init, %function
NVIC_Init:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_misc.c"
	.loc 1 80 0
.LVL0:
	.loc 1 87 0
	ldrb	r2, [r0, #2]
	.loc 1 80 0
	push	{r4, r5, r6, lr}
.LCFI0:
	ldrb	r3, [r0]
	.loc 1 87 0
	cmp	r2, #0
	beq	.L2
	lsr	r1, r3, #2
	ldr	r2, .L5
	.loc 1 91 0
	mov	r4, #3
	lsl	r1, r1, #2
	add	r1, r1, r2
	and	r3, r4
	.loc 1 90 0
	mov	r2, #192
	.loc 1 91 0
	lsl	r3, r3, r4
	.loc 1 90 0
	lsl	r2, r2, #2
	.loc 1 91 0
	mov	r4, #255
	.loc 1 90 0
	ldr	r5, [r1, r2]
.LVL1:
	.loc 1 91 0
	mov	r6, r4
	lsl	r6, r6, r3
	bic	r5, r6
.LVL2:
	.loc 1 92 0
	ldrb	r6, [r0, #1]
	lsl	r6, r6, #6
	and	r4, r6
	lsl	r4, r4, r3
	mov	r3, r5
	orr	r3, r4
.LVL3:
	.loc 1 94 0
	str	r3, [r1, r2]
	.loc 1 97 0
	ldrb	r2, [r0]
	mov	r3, #31
.LVL4:
	and	r2, r3
	mov	r3, #1
	lsl	r3, r3, r2
	mov	r2, r3
	ldr	r3, .L5
	str	r2, [r3]
.LVL5:
	b	.L1
.LVL6:
.L2:
	.loc 1 102 0
	mov	r2, #31
	and	r3, r2
	mov	r2, #1
	lsl	r2, r2, r3
	mov	r3, r2
	ldr	r2, .L5+4
	str	r3, [r2, #124]
.LVL7:
.L1:
	.loc 1 104 0
	@ sp needed
	pop	{r4, r5, r6, pc}
.L6:
	.align	2
.L5:
	.word	-536813312
	.word	-536813308
.LFE32:
	.size	NVIC_Init, .-NVIC_Init
	.section	.text.NVIC_SystemLPConfig,"ax",%progbits
	.align	1
	.global	NVIC_SystemLPConfig
	.code	16
	.thumb_func
	.type	NVIC_SystemLPConfig, %function
NVIC_SystemLPConfig:
.LFB33:
	.loc 1 118 0
.LVL8:
	ldr	r3, .L10
	.loc 1 126 0
	ldr	r2, [r3, #16]
	.loc 1 124 0
	cmp	r1, #0
	beq	.L8
	.loc 1 126 0
	orr	r0, r2
.LVL9:
	str	r0, [r3, #16]
	b	.L7
.LVL10:
.L8:
	.loc 1 130 0
	bic	r2, r0
	str	r2, [r3, #16]
.LVL11:
.L7:
	.loc 1 132 0
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	-536810240
.LFE33:
	.size	NVIC_SystemLPConfig, .-NVIC_SystemLPConfig
	.section	.text.SysTick_CLKSourceConfig,"ax",%progbits
	.align	1
	.global	SysTick_CLKSourceConfig
	.code	16
	.thumb_func
	.type	SysTick_CLKSourceConfig, %function
SysTick_CLKSourceConfig:
.LFB34:
	.loc 1 143 0
.LVL12:
	ldr	r3, .L15
	.loc 1 149 0
	ldr	r2, [r3]
	.loc 1 147 0
	cmp	r0, #4
	bne	.L13
	.loc 1 149 0
	orr	r0, r2
.LVL13:
	str	r0, [r3]
	b	.L12
.LVL14:
.L13:
	.loc 1 153 0
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3]
.LVL15:
.L12:
	.loc 1 155 0
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	-536813552
.LFE34:
	.size	SysTick_CLKSourceConfig, .-SysTick_CLKSourceConfig
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
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
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_misc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x345
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x1
	.4byte	.LASF44
	.4byte	.LASF45
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
	.uleb128 0x5
	.2byte	0x320
	.byte	0x3
	.2byte	0x10b
	.4byte	0x105
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x3
	.2byte	0x10d
	.4byte	0x11c
	.byte	0
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x3
	.2byte	0x10e
	.4byte	0x121
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x3
	.2byte	0x10f
	.4byte	0x131
	.byte	0x80
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x110
	.4byte	0x121
	.byte	0x84
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x111
	.4byte	0x136
	.2byte	0x100
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x112
	.4byte	0x121
	.2byte	0x104
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x113
	.4byte	0x13b
	.2byte	0x180
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x114
	.4byte	0x121
	.2byte	0x184
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x115
	.4byte	0x140
	.2byte	0x200
	.uleb128 0x8
	.ascii	"IP\000"
	.byte	0x3
	.2byte	0x116
	.4byte	0x160
	.2byte	0x300
	.byte	0
	.uleb128 0x9
	.4byte	0x53
	.4byte	0x115
	.uleb128 0xa
	.4byte	0x115
	.byte	0
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF18
	.uleb128 0xb
	.4byte	0x105
	.uleb128 0x9
	.4byte	0x53
	.4byte	0x131
	.uleb128 0xa
	.4byte	0x115
	.byte	0x1e
	.byte	0
	.uleb128 0xb
	.4byte	0x105
	.uleb128 0xb
	.4byte	0x105
	.uleb128 0xb
	.4byte	0x105
	.uleb128 0x9
	.4byte	0x53
	.4byte	0x150
	.uleb128 0xa
	.4byte	0x115
	.byte	0x3f
	.byte	0
	.uleb128 0x9
	.4byte	0x53
	.4byte	0x160
	.uleb128 0xa
	.4byte	0x115
	.byte	0x7
	.byte	0
	.uleb128 0xb
	.4byte	0x150
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x117
	.4byte	0x73
	.uleb128 0xd
	.byte	0x28
	.byte	0x3
	.2byte	0x124
	.4byte	0x1f0
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x126
	.4byte	0x1f0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x127
	.4byte	0x1f5
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x3
	.2byte	0x128
	.4byte	0x53
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x129
	.4byte	0x1f5
	.byte	0xc
	.uleb128 0xe
	.ascii	"SCR\000"
	.byte	0x3
	.2byte	0x12a
	.4byte	0x1f5
	.byte	0x10
	.uleb128 0xe
	.ascii	"CCR\000"
	.byte	0x3
	.2byte	0x12b
	.4byte	0x1f5
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x12c
	.4byte	0x53
	.byte	0x18
	.uleb128 0xe
	.ascii	"SHP\000"
	.byte	0x3
	.2byte	0x12d
	.4byte	0x20a
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x12e
	.4byte	0x1f5
	.byte	0x24
	.byte	0
	.uleb128 0xf
	.4byte	0x1f5
	.uleb128 0xb
	.4byte	0x53
	.uleb128 0x9
	.4byte	0x53
	.4byte	0x20a
	.uleb128 0xa
	.4byte	0x115
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	0x1fa
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x12f
	.4byte	0x171
	.uleb128 0xd
	.byte	0x10
	.byte	0x3
	.2byte	0x18d
	.4byte	0x259
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x18f
	.4byte	0x1f5
	.byte	0
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x190
	.4byte	0x1f5
	.byte	0x4
	.uleb128 0xe
	.ascii	"VAL\000"
	.byte	0x3
	.2byte	0x191
	.4byte	0x1f5
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x192
	.4byte	0x1f0
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x193
	.4byte	0x21b
	.uleb128 0x10
	.byte	0x1
	.byte	0x4
	.byte	0xe1
	.4byte	0x27a
	.uleb128 0x11
	.4byte	.LASF30
	.sleb128 0
	.uleb128 0x11
	.4byte	.LASF31
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0xe1
	.4byte	0x265
	.uleb128 0x12
	.byte	0x3
	.byte	0x5
	.byte	0x36
	.4byte	0x2b2
	.uleb128 0x13
	.4byte	.LASF33
	.byte	0x5
	.byte	0x38
	.4byte	0x2c
	.byte	0
	.uleb128 0x13
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3d
	.4byte	0x2c
	.byte	0x1
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x5
	.byte	0x41
	.4byte	0x27a
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x5
	.byte	0x44
	.4byte	0x285
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x1
	.byte	0x4f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ef
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.byte	0x4f
	.4byte	0x2ef
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.byte	0x51
	.4byte	0x53
	.4byte	.LLST0
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x2b2
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x1
	.byte	0x75
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x327
	.uleb128 0x18
	.4byte	.LASF40
	.byte	0x1
	.byte	0x75
	.4byte	0x2c
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LASF41
	.byte	0x1
	.byte	0x75
	.4byte	0x27a
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x19
	.4byte	.LASF47
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x1
	.byte	0x8e
	.4byte	0x53
	.4byte	.LLST2
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x3
	.byte	0x71
	.sleb128 768
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x6
	.byte	0x75
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
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
.LASF0:
	.ascii	"signed char\000"
.LASF15:
	.ascii	"ICPR\000"
.LASF24:
	.ascii	"SHCSR\000"
.LASF39:
	.ascii	"NVIC_InitStruct\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF32:
	.ascii	"FunctionalState\000"
.LASF10:
	.ascii	"RESERVED0\000"
.LASF23:
	.ascii	"RESERVED1\000"
.LASF16:
	.ascii	"RESERVED3\000"
.LASF17:
	.ascii	"RESERVED4\000"
.LASF33:
	.ascii	"NVIC_IRQChannel\000"
.LASF36:
	.ascii	"NVIC_InitTypeDef\000"
.LASF31:
	.ascii	"ENABLE\000"
.LASF34:
	.ascii	"NVIC_IRQChannelPriority\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"NVIC_Type\000"
.LASF41:
	.ascii	"NewState\000"
.LASF28:
	.ascii	"CALIB\000"
.LASF43:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF38:
	.ascii	"NVIC_SystemLPConfig\000"
.LASF37:
	.ascii	"NVIC_Init\000"
.LASF2:
	.ascii	"short int\000"
.LASF46:
	.ascii	"tmppriority\000"
.LASF11:
	.ascii	"ICER\000"
.LASF25:
	.ascii	"SCB_Type\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"ISPR\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF21:
	.ascii	"ICSR\000"
.LASF29:
	.ascii	"SysTick_Type\000"
.LASF22:
	.ascii	"AIRCR\000"
.LASF12:
	.ascii	"RSERVED1\000"
.LASF18:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"long long int\000"
.LASF20:
	.ascii	"CPUID\000"
.LASF47:
	.ascii	"SysTick_CLKSourceConfig\000"
.LASF9:
	.ascii	"ISER\000"
.LASF27:
	.ascii	"LOAD\000"
.LASF45:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF44:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../chip/stm32/stm32f030/lib/src/stm32f0"
	.ascii	"xx_misc.c\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF42:
	.ascii	"SysTick_CLKSource\000"
.LASF26:
	.ascii	"CTRL\000"
.LASF30:
	.ascii	"DISABLE\000"
.LASF35:
	.ascii	"NVIC_IRQChannelCmd\000"
.LASF14:
	.ascii	"RESERVED2\000"
.LASF40:
	.ascii	"LowPowerMode\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
