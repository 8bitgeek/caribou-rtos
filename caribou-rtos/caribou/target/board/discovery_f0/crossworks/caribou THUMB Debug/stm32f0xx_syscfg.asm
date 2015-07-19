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
	.file	"stm32f0xx_syscfg.c"
	.text
.Ltext0:
	.section	.text.SYSCFG_DeInit,"ax",%progbits
	.align	1
	.global	SYSCFG_DeInit
	.code	16
	.thumb_func
	.type	SYSCFG_DeInit, %function
SYSCFG_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_syscfg.c"
	.loc 1 93 0
	.loc 1 95 0
	ldr	r3, .L2
	mov	r2, #3
	ldr	r1, [r3]
	.loc 1 103 0
	@ sp needed
	.loc 1 95 0
	and	r2, r1
	str	r2, [r3]
	.loc 1 97 0
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 98 0
	str	r2, [r3, #12]
	.loc 1 99 0
	str	r2, [r3, #16]
	.loc 1 100 0
	str	r2, [r3, #20]
	.loc 1 102 0
	ldr	r1, [r3, #24]
	mov	r2, #128
	lsl	r2, r2, #1
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 103 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073807360
.LFE32:
	.size	SYSCFG_DeInit, .-SYSCFG_DeInit
	.section	.text.SYSCFG_MemoryRemapConfig,"ax",%progbits
	.align	1
	.global	SYSCFG_MemoryRemapConfig
	.code	16
	.thumb_func
	.type	SYSCFG_MemoryRemapConfig, %function
SYSCFG_MemoryRemapConfig:
.LFB33:
	.loc 1 115 0
.LVL0:
	.loc 1 122 0
	ldr	r3, .L5
	.loc 1 125 0
	mov	r1, #3
	.loc 1 122 0
	ldr	r2, [r3]
.LVL1:
	.loc 1 132 0
	@ sp needed
	.loc 1 125 0
	bic	r2, r1
.LVL2:
	.loc 1 128 0
	orr	r0, r2
.LVL3:
	.loc 1 131 0
	str	r0, [r3]
	.loc 1 132 0
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073807360
.LFE33:
	.size	SYSCFG_MemoryRemapConfig, .-SYSCFG_MemoryRemapConfig
	.section	.text.SYSCFG_DMAChannelRemapConfig,"ax",%progbits
	.align	1
	.global	SYSCFG_DMAChannelRemapConfig
	.code	16
	.thumb_func
	.type	SYSCFG_DMAChannelRemapConfig, %function
SYSCFG_DMAChannelRemapConfig:
.LFB34:
	.loc 1 156 0
.LVL4:
	ldr	r3, .L11
	.loc 1 164 0
	ldr	r2, [r3]
	.loc 1 161 0
	cmp	r1, #0
	beq	.L8
	.loc 1 164 0
	orr	r0, r2
.LVL5:
	str	r0, [r3]
	b	.L7
.LVL6:
.L8:
	.loc 1 169 0
	bic	r2, r0
	str	r2, [r3]
.LVL7:
.L7:
	.loc 1 171 0
	@ sp needed
	bx	lr
.L12:
	.align	2
.L11:
	.word	1073807360
.LFE34:
	.size	SYSCFG_DMAChannelRemapConfig, .-SYSCFG_DMAChannelRemapConfig
	.section	.text.SYSCFG_I2CFastModePlusConfig,"ax",%progbits
	.align	1
	.global	SYSCFG_I2CFastModePlusConfig
	.code	16
	.thumb_func
	.type	SYSCFG_I2CFastModePlusConfig, %function
SYSCFG_I2CFastModePlusConfig:
.LFB35:
	.loc 1 188 0
.LVL8:
	ldr	r3, .L16
	.loc 1 196 0
	ldr	r2, [r3]
	.loc 1 193 0
	cmp	r1, #0
	beq	.L14
	.loc 1 196 0
	orr	r0, r2
.LVL9:
	str	r0, [r3]
	b	.L13
.LVL10:
.L14:
	.loc 1 201 0
	bic	r2, r0
	str	r2, [r3]
.LVL11:
.L13:
	.loc 1 203 0
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073807360
.LFE35:
	.size	SYSCFG_I2CFastModePlusConfig, .-SYSCFG_I2CFastModePlusConfig
	.section	.text.SYSCFG_EXTILineConfig,"ax",%progbits
	.align	1
	.global	SYSCFG_EXTILineConfig
	.code	16
	.thumb_func
	.type	SYSCFG_EXTILineConfig, %function
SYSCFG_EXTILineConfig:
.LFB36:
	.loc 1 214 0
.LVL12:
	.loc 1 221 0
	mov	r3, #3
	and	r3, r1
	ldr	r2, .L19
	lsr	r1, r1, #2
.LVL13:
	lsl	r1, r1, #2
	add	r1, r1, r2
	.loc 1 214 0
	push	{r4, lr}
.LCFI0:
	.loc 1 222 0
	ldr	r2, [r1, #8]
	.loc 1 221 0
	lsl	r3, r3, #2
.LVL14:
	mov	r4, #15
	lsl	r4, r4, r3
.LVL15:
	.loc 1 222 0
	bic	r2, r4
	str	r2, [r1, #8]
	.loc 1 223 0
	ldr	r2, [r1, #8]
	lsl	r0, r0, r3
.LVL16:
	mov	r3, r0
	orr	r3, r2
	str	r3, [r1, #8]
	.loc 1 224 0
	@ sp needed
.LVL17:
	pop	{r4, pc}
.L20:
	.align	2
.L19:
	.word	1073807360
.LFE36:
	.size	SYSCFG_EXTILineConfig, .-SYSCFG_EXTILineConfig
	.section	.text.SYSCFG_BreakConfig,"ax",%progbits
	.align	1
	.global	SYSCFG_BreakConfig
	.code	16
	.thumb_func
	.type	SYSCFG_BreakConfig, %function
SYSCFG_BreakConfig:
.LFB37:
	.loc 1 238 0
.LVL18:
	.loc 1 242 0
	ldr	r3, .L22
	.loc 1 243 0
	@ sp needed
	.loc 1 242 0
	ldr	r2, [r3, #24]
	orr	r0, r2
.LVL19:
	str	r0, [r3, #24]
	.loc 1 243 0
	bx	lr
.L23:
	.align	2
.L22:
	.word	1073807360
.LFE37:
	.size	SYSCFG_BreakConfig, .-SYSCFG_BreakConfig
	.section	.text.SYSCFG_GetFlagStatus,"ax",%progbits
	.align	1
	.global	SYSCFG_GetFlagStatus
	.code	16
	.thumb_func
	.type	SYSCFG_GetFlagStatus, %function
SYSCFG_GetFlagStatus:
.LFB38:
	.loc 1 253 0
.LVL20:
	.loc 1 260 0
	ldr	r3, .L25
	.loc 1 272 0
	@ sp needed
	.loc 1 260 0
	ldr	r0, [r3, #24]
.LVL21:
	lsl	r0, r0, #23
.LVL22:
	.loc 1 271 0
	lsr	r0, r0, #31
	.loc 1 272 0
	bx	lr
.L26:
	.align	2
.L25:
	.word	1073807360
.LFE38:
	.size	SYSCFG_GetFlagStatus, .-SYSCFG_GetFlagStatus
	.section	.text.SYSCFG_ClearFlag,"ax",%progbits
	.align	1
	.global	SYSCFG_ClearFlag
	.code	16
	.thumb_func
	.type	SYSCFG_ClearFlag, %function
SYSCFG_ClearFlag:
.LFB39:
	.loc 1 282 0
.LVL23:
	.loc 1 286 0
	ldr	r3, .L28
	.loc 1 287 0
	@ sp needed
	.loc 1 286 0
	ldr	r2, [r3, #24]
	orr	r0, r2
.LVL24:
	str	r0, [r3, #24]
	.loc 1 287 0
	bx	lr
.L29:
	.align	2
.L28:
	.word	1073807360
.LFE39:
	.size	SYSCFG_ClearFlag, .-SYSCFG_ClearFlag
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
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI0-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.align	2
.LEFDE14:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x287
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x1
	.4byte	.LASF36
	.4byte	.LASF37
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
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	0x53
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xdf
	.4byte	0x94
	.uleb128 0x7
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0x8
	.ascii	"SET\000"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0xdf
	.4byte	0x7f
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0xb4
	.uleb128 0x7
	.4byte	.LASF12
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF13
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0xe1
	.4byte	0x9f
	.uleb128 0x9
	.byte	0x1c
	.byte	0x3
	.2byte	0x1a2
	.4byte	0xfd
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x1a4
	.4byte	0x7a
	.byte	0
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x1a5
	.4byte	0x53
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x1a6
	.4byte	0x10d
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x1a7
	.4byte	0x7a
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.4byte	0x53
	.4byte	0x10d
	.uleb128 0xc
	.4byte	0x73
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	0xfd
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1a8
	.4byte	0xbf
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0x5c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x72
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x163
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x72
	.4byte	0x53
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x1
	.byte	0x74
	.4byte	0x53
	.4byte	.LLST1
	.byte	0
	.uleb128 0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x195
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x1
	.byte	0x9b
	.4byte	0x53
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x1
	.byte	0x9b
	.4byte	0xb4
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0xbb
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c7
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0xbb
	.4byte	0x53
	.4byte	.LLST3
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x1
	.byte	0xbb
	.4byte	0xb4
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x1
	.byte	0xd5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20a
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x1
	.byte	0xd5
	.4byte	0x2c
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LASF29
	.byte	0x1
	.byte	0xd5
	.4byte	0x2c
	.4byte	.LLST5
	.uleb128 0x13
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x53
	.4byte	.LLST6
	.byte	0
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x1
	.byte	0xed
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x22f
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0xed
	.4byte	0x53
	.4byte	.LLST7
	.byte	0
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x1
	.byte	0xfc
	.4byte	0x94
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x267
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x1
	.byte	0xfc
	.4byte	0x53
	.4byte	.LLST8
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0x1
	.byte	0xfe
	.4byte	0x94
	.4byte	.LLST9
	.byte	0
	.uleb128 0x15
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x119
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x119
	.4byte	0x53
	.4byte	.LLST10
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0xf
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x5
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
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
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL16
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL13
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x5
	.byte	0x3f
	.byte	0x73
	.sleb128 0
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL19
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x9
	.byte	0x70
	.sleb128 0
	.byte	0xa
	.2byte	0x100
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x54
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
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
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
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"EXTI_PortSourceGPIOx\000"
.LASF31:
	.ascii	"SYSCFG_BreakConfig\000"
.LASF34:
	.ascii	"bitstatus\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"FunctionalState\000"
.LASF38:
	.ascii	"SYSCFG_DeInit\000"
.LASF39:
	.ascii	"SYSCFG_GetFlagStatus\000"
.LASF13:
	.ascii	"ENABLE\000"
.LASF27:
	.ascii	"SYSCFG_EXTILineConfig\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF15:
	.ascii	"CFGR1\000"
.LASF18:
	.ascii	"CFGR2\000"
.LASF10:
	.ascii	"RESET\000"
.LASF26:
	.ascii	"SYSCFG_I2CFastModePlus\000"
.LASF35:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF17:
	.ascii	"EXTICR\000"
.LASF30:
	.ascii	"tmpctrl\000"
.LASF29:
	.ascii	"EXTI_PinSourcex\000"
.LASF25:
	.ascii	"SYSCFG_I2CFastModePlusConfig\000"
.LASF16:
	.ascii	"RESERVED\000"
.LASF32:
	.ascii	"SYSCFG_Break\000"
.LASF36:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_syscfg.c\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF21:
	.ascii	"SYSCFG_DMAChannelRemapConfig\000"
.LASF0:
	.ascii	"signed char\000"
.LASF37:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF23:
	.ascii	"SYSCFG_DMARemap\000"
.LASF7:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"SYSCFG_MemoryRemap\000"
.LASF2:
	.ascii	"short int\000"
.LASF24:
	.ascii	"NewState\000"
.LASF19:
	.ascii	"SYSCFG_TypeDef\000"
.LASF40:
	.ascii	"SYSCFG_ClearFlag\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF12:
	.ascii	"DISABLE\000"
.LASF33:
	.ascii	"SYSCFG_Flag\000"
.LASF20:
	.ascii	"SYSCFG_MemoryRemapConfig\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
