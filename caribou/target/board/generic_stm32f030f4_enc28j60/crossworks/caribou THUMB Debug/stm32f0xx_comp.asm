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
	.file	"stm32f0xx_comp.c"
	.text
.Ltext0:
	.section	.text.COMP_DeInit,"ax",%progbits
	.align	1
	.global	COMP_DeInit
	.code	16
	.thumb_func
	.type	COMP_DeInit, %function
COMP_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_comp.c"
	.loc 1 143 0
	.loc 1 144 0
	ldr	r3, .L2
	mov	r2, #0
	str	r2, [r3]
	.loc 1 145 0
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073807388
.LFE32:
	.size	COMP_DeInit, .-COMP_DeInit
	.section	.text.COMP_Init,"ax",%progbits
	.align	1
	.global	COMP_Init
	.code	16
	.thumb_func
	.type	COMP_Init, %function
COMP_Init:
.LFB33:
	.loc 1 164 0
.LVL0:
	.loc 1 176 0
	ldr	r3, .L5
	.loc 1 164 0
	push	{r4, r5, lr}
.LCFI0:
	.loc 1 179 0
	ldr	r4, .L5+4
	.loc 1 176 0
	ldr	r2, [r3]
.LVL1:
	.loc 1 179 0
	lsl	r4, r4, r0
	.loc 1 187 0
	ldr	r5, [r1, #4]
	.loc 1 179 0
	bic	r2, r4
.LVL2:
	.loc 1 187 0
	ldr	r4, [r1]
	.loc 1 193 0
	@ sp needed
	.loc 1 187 0
	orr	r5, r4
	ldr	r4, [r1, #8]
	orr	r5, r4
	.loc 1 188 0
	ldr	r4, [r1, #12]
	orr	r5, r4
	ldr	r4, [r1, #16]
	mov	r1, r5
.LVL3:
	orr	r1, r4
	.loc 1 187 0
	lsl	r1, r1, r0
	mov	r0, r1
.LVL4:
	orr	r0, r2
.LVL5:
	.loc 1 192 0
	str	r0, [r3]
	.loc 1 193 0
	pop	{r4, r5, pc}
.L6:
	.align	2
.L5:
	.word	1073807388
	.word	16382
.LFE33:
	.size	COMP_Init, .-COMP_Init
	.section	.text.COMP_StructInit,"ax",%progbits
	.align	1
	.global	COMP_StructInit
	.code	16
	.thumb_func
	.type	COMP_StructInit, %function
COMP_StructInit:
.LFB34:
	.loc 1 202 0
.LVL6:
	.loc 1 203 0
	mov	r3, #0
	str	r3, [r0]
	.loc 1 204 0
	str	r3, [r0, #4]
	.loc 1 205 0
	str	r3, [r0, #8]
	.loc 1 206 0
	str	r3, [r0, #12]
	.loc 1 207 0
	mov	r3, #12
	str	r3, [r0, #16]
	.loc 1 208 0
	@ sp needed
	bx	lr
.LFE34:
	.size	COMP_StructInit, .-COMP_StructInit
	.section	.text.COMP_Cmd,"ax",%progbits
	.align	1
	.global	COMP_Cmd
	.code	16
	.thumb_func
	.type	COMP_Cmd, %function
COMP_Cmd:
.LFB35:
	.loc 1 228 0
.LVL7:
	ldr	r3, .L12
	mov	r2, #1
	.loc 1 233 0
	cmp	r1, #0
	beq	.L9
	.loc 1 236 0
	ldr	r1, [r3]
.LVL8:
	lsl	r2, r2, r0
	mov	r0, r2
.LVL9:
	orr	r0, r1
	str	r0, [r3]
	b	.L8
.LVL10:
.L9:
	.loc 1 241 0
	ldr	r1, [r3]
.LVL11:
	lsl	r2, r2, r0
	mov	r0, r2
.LVL12:
	mov	r2, r1
	bic	r2, r0
	str	r2, [r3]
.L8:
	.loc 1 243 0
	@ sp needed
	bx	lr
.L13:
	.align	2
.L12:
	.word	1073807388
.LFE35:
	.size	COMP_Cmd, .-COMP_Cmd
	.section	.text.COMP_SwitchCmd,"ax",%progbits
	.align	1
	.global	COMP_SwitchCmd
	.code	16
	.thumb_func
	.type	COMP_SwitchCmd, %function
COMP_SwitchCmd:
.LFB36:
	.loc 1 256 0
.LVL13:
	ldr	r3, .L18
	mov	r2, #2
	.loc 1 263 0
	ldr	r1, [r3]
	.loc 1 260 0
	cmp	r0, #0
	beq	.L15
	.loc 1 263 0
	orr	r2, r1
	b	.L17
.L15:
	.loc 1 268 0
	bic	r1, r2
	mov	r2, r1
.L17:
	str	r2, [r3]
	.loc 1 270 0
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073807388
.LFE36:
	.size	COMP_SwitchCmd, .-COMP_SwitchCmd
	.section	.text.COMP_GetOutputLevel,"ax",%progbits
	.align	1
	.global	COMP_GetOutputLevel
	.code	16
	.thumb_func
	.type	COMP_GetOutputLevel, %function
COMP_GetOutputLevel:
.LFB37:
	.loc 1 293 0
.LVL14:
	.loc 1 300 0
	ldr	r3, .L23
	mov	r2, #128
	lsl	r2, r2, #7
	ldr	r3, [r3]
	lsl	r2, r2, r0
	mov	r0, r2
.LVL15:
	and	r0, r3
	.loc 1 302 0
	sub	r3, r0, #1
	sbc	r0, r0, r3
	lsl	r0, r0, #14
.LVL16:
	.loc 1 311 0
	@ sp needed
	bx	lr
.L24:
	.align	2
.L23:
	.word	1073807388
.LFE37:
	.size	COMP_GetOutputLevel, .-COMP_GetOutputLevel
	.section	.text.COMP_WindowCmd,"ax",%progbits
	.align	1
	.global	COMP_WindowCmd
	.code	16
	.thumb_func
	.type	COMP_WindowCmd, %function
COMP_WindowCmd:
.LFB38:
	.loc 1 340 0
.LVL17:
	ldr	r3, .L29
	.loc 1 347 0
	ldr	r1, [r3]
	.loc 1 344 0
	cmp	r0, #0
	beq	.L26
	.loc 1 347 0
	mov	r2, #128
	lsl	r2, r2, #16
	orr	r2, r1
	b	.L28
.L26:
	.loc 1 352 0
	ldr	r2, .L29+4
	and	r2, r1
.L28:
	str	r2, [r3]
	.loc 1 354 0
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
	.word	1073807388
	.word	-8388609
.LFE38:
	.size	COMP_WindowCmd, .-COMP_WindowCmd
	.section	.text.COMP_LockConfig,"ax",%progbits
	.align	1
	.global	COMP_LockConfig
	.code	16
	.thumb_func
	.type	COMP_LockConfig, %function
COMP_LockConfig:
.LFB39:
	.loc 1 385 0
.LVL18:
	.loc 1 390 0
	ldr	r3, .L32
	mov	r1, #128
	lsl	r1, r1, #8
	ldr	r2, [r3]
	lsl	r1, r1, r0
	mov	r0, r1
.LVL19:
	orr	r0, r2
	str	r0, [r3]
	.loc 1 391 0
	@ sp needed
	bx	lr
.L33:
	.align	2
.L32:
	.word	1073807388
.LFE39:
	.size	COMP_LockConfig, .-COMP_LockConfig
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
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
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_comp.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x25b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.LASF31
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x17
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x5
	.4byte	0x48
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0x89
	.uleb128 0x7
	.4byte	.LASF8
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF9
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0xe1
	.4byte	0x74
	.uleb128 0x8
	.byte	0x4
	.byte	0x3
	.2byte	0x116
	.4byte	0xab
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x118
	.4byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x119
	.4byte	0x94
	.uleb128 0xb
	.byte	0x14
	.byte	0x4
	.byte	0x36
	.4byte	0xfc
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x4
	.byte	0x39
	.4byte	0x48
	.byte	0
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x4
	.byte	0x3c
	.4byte	0x48
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x4
	.byte	0x3f
	.4byte	0x48
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x4
	.byte	0x42
	.4byte	0x48
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x4
	.byte	0x45
	.4byte	0x48
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x4
	.byte	0x49
	.4byte	0xb7
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0xa3
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15b
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa3
	.4byte	0x48
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa3
	.4byte	0x15b
	.4byte	.LLST1
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0xa5
	.4byte	0x48
	.4byte	.LLST2
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0xfc
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x184
	.uleb128 0x12
	.4byte	.LASF20
	.byte	0x1
	.byte	0xc9
	.4byte	0x15b
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b8
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0xe3
	.4byte	0x48
	.4byte	.LLST3
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0xe3
	.4byte	0x89
	.4byte	.LLST4
	.byte	0
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x1
	.byte	0xff
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1db
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x1
	.byte	0xff
	.4byte	0x89
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x13
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x124
	.4byte	0x48
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x216
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x124
	.4byte	0x48
	.4byte	.LLST5
	.uleb128 0x15
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x126
	.4byte	0x48
	.4byte	.LLST6
	.byte	0
	.uleb128 0x16
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x153
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23b
	.uleb128 0x17
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x153
	.4byte	0x89
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x180
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x180
	.4byte	0x48
	.4byte	.LLST7
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
	.uleb128 0x4
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x34
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4
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
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL3
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL5
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7
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
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL11
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LFE37
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL19
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
.LASF15:
	.ascii	"COMP_OutputPol\000"
.LASF21:
	.ascii	"COMP_Init\000"
.LASF30:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../chip/stm32/stm32f030/lib/src/stm32f0"
	.ascii	"xx_comp.c\000"
.LASF13:
	.ascii	"COMP_InvertingInput\000"
.LASF33:
	.ascii	"COMP_GetOutputLevel\000"
.LASF16:
	.ascii	"COMP_Hysteresis\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF11:
	.ascii	"FunctionalState\000"
.LASF22:
	.ascii	"COMP_StructInit\000"
.LASF14:
	.ascii	"COMP_Output\000"
.LASF9:
	.ascii	"ENABLE\000"
.LASF0:
	.ascii	"signed char\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"NewState\000"
.LASF32:
	.ascii	"COMP_DeInit\000"
.LASF29:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF27:
	.ascii	"compout\000"
.LASF23:
	.ascii	"COMP_Cmd\000"
.LASF17:
	.ascii	"COMP_Mode\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF18:
	.ascii	"COMP_InitTypeDef\000"
.LASF28:
	.ascii	"COMP_WindowCmd\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF19:
	.ascii	"COMP_Selection\000"
.LASF20:
	.ascii	"COMP_InitStruct\000"
.LASF34:
	.ascii	"COMP_LockConfig\000"
.LASF2:
	.ascii	"short int\000"
.LASF26:
	.ascii	"tmpreg\000"
.LASF31:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"DISABLE\000"
.LASF25:
	.ascii	"COMP_SwitchCmd\000"
.LASF12:
	.ascii	"COMP_TypeDef\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
