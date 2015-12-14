	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"stm32f0xx_syscfg.c"
	.text
.Ltext0:
	.section	.text.SYSCFG_DeInit,"ax",%progbits
	.align	2
	.global	SYSCFG_DeInit
	.code	16
	.thumb_func
	.type	SYSCFG_DeInit, %function
SYSCFG_DeInit:
.LFB32:
	ldr	r3, .L2
	ldr	r2, [r3]
	mov	r1, #3
	and	r2, r1
	str	r2, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r1, [r3, #24]
	mov	r2, #128
	lsl	r2, r2, #1
	orr	r2, r1
	str	r2, [r3, #24]
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073807360
.LFE32:
	.size	SYSCFG_DeInit, .-SYSCFG_DeInit
	.section	.text.SYSCFG_MemoryRemapConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_MemoryRemapConfig
	.code	16
	.thumb_func
	.type	SYSCFG_MemoryRemapConfig, %function
SYSCFG_MemoryRemapConfig:
.LFB33:
	ldr	r3, .L5
	ldr	r2, [r3]
	mov	r1, #3
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073807360
.LFE33:
	.size	SYSCFG_MemoryRemapConfig, .-SYSCFG_MemoryRemapConfig
	.section	.text.SYSCFG_DMAChannelRemapConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_DMAChannelRemapConfig
	.code	16
	.thumb_func
	.type	SYSCFG_DMAChannelRemapConfig, %function
SYSCFG_DMAChannelRemapConfig:
.LFB34:
	cmp	r1, #0
	beq	.L8
	ldr	r3, .L10
	ldr	r2, [r3]
	orr	r0, r2
	str	r0, [r3]
	b	.L7
.L8:
	ldr	r3, .L10
	ldr	r2, [r3]
	bic	r2, r0
	str	r2, [r3]
.L7:
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073807360
.LFE34:
	.size	SYSCFG_DMAChannelRemapConfig, .-SYSCFG_DMAChannelRemapConfig
	.section	.text.SYSCFG_I2CFastModePlusConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_I2CFastModePlusConfig
	.code	16
	.thumb_func
	.type	SYSCFG_I2CFastModePlusConfig, %function
SYSCFG_I2CFastModePlusConfig:
.LFB35:
	cmp	r1, #0
	beq	.L13
	ldr	r3, .L15
	ldr	r2, [r3]
	orr	r0, r2
	str	r0, [r3]
	b	.L12
.L13:
	ldr	r3, .L15
	ldr	r2, [r3]
	bic	r2, r0
	str	r2, [r3]
.L12:
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073807360
.LFE35:
	.size	SYSCFG_I2CFastModePlusConfig, .-SYSCFG_I2CFastModePlusConfig
	.section	.text.SYSCFG_EXTILineConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_EXTILineConfig
	.code	16
	.thumb_func
	.type	SYSCFG_EXTILineConfig, %function
SYSCFG_EXTILineConfig:
.LFB36:
	push	{r4, lr}
.LCFI0:
	mov	r3, #3
	and	r3, r1
	lsl	r3, r3, #2
	lsr	r1, r1, #2
	lsl	r1, r1, #2
	ldr	r2, .L18
	add	r1, r1, r2
	ldr	r2, [r1, #8]
	mov	r4, #15
	lsl	r4, r4, r3
	bic	r2, r4
	str	r2, [r1, #8]
	ldr	r2, [r1, #8]
	lsl	r0, r0, r3
	mov	r3, r0
	orr	r3, r2
	str	r3, [r1, #8]
	@ sp needed
	pop	{r4, pc}
.L19:
	.align	2
.L18:
	.word	1073807360
.LFE36:
	.size	SYSCFG_EXTILineConfig, .-SYSCFG_EXTILineConfig
	.section	.text.SYSCFG_BreakConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_BreakConfig
	.code	16
	.thumb_func
	.type	SYSCFG_BreakConfig, %function
SYSCFG_BreakConfig:
.LFB37:
	ldr	r3, .L21
	ldr	r2, [r3, #24]
	orr	r0, r2
	str	r0, [r3, #24]
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073807360
.LFE37:
	.size	SYSCFG_BreakConfig, .-SYSCFG_BreakConfig
	.section	.text.SYSCFG_GetFlagStatus,"ax",%progbits
	.align	2
	.global	SYSCFG_GetFlagStatus
	.code	16
	.thumb_func
	.type	SYSCFG_GetFlagStatus, %function
SYSCFG_GetFlagStatus:
.LFB38:
	ldr	r3, .L24
	ldr	r0, [r3, #24]
	lsl	r0, r0, #23
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	1073807360
.LFE38:
	.size	SYSCFG_GetFlagStatus, .-SYSCFG_GetFlagStatus
	.section	.text.SYSCFG_ClearFlag,"ax",%progbits
	.align	2
	.global	SYSCFG_ClearFlag
	.code	16
	.thumb_func
	.type	SYSCFG_ClearFlag, %function
SYSCFG_ClearFlag:
.LFB39:
	ldr	r3, .L27
	ldr	r2, [r3, #24]
	orr	r0, r2
	str	r0, [r3, #24]
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_syscfg.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x1
	.4byte	.LASF9
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x5c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x72
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xbb
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xd5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0xed
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0xfc
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x119
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
.LASF6:
	.ascii	"SYSCFG_GetFlagStatus\000"
.LASF3:
	.ascii	"SYSCFG_I2CFastModePlusConfig\000"
.LASF0:
	.ascii	"SYSCFG_DeInit\000"
.LASF1:
	.ascii	"SYSCFG_MemoryRemapConfig\000"
.LASF4:
	.ascii	"SYSCFG_EXTILineConfig\000"
.LASF7:
	.ascii	"SYSCFG_ClearFlag\000"
.LASF8:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF2:
	.ascii	"SYSCFG_DMAChannelRemapConfig\000"
.LASF9:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_syscfg"
	.ascii	".c\000"
.LASF5:
	.ascii	"SYSCFG_BreakConfig\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
