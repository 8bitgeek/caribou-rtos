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
	.file	"stm32f0xx_exti.c"
	.text
.Ltext0:
	.section	.text.EXTI_DeInit,"ax",%progbits
	.align	1
	.global	EXTI_DeInit
	.code	16
	.thumb_func
	.type	EXTI_DeInit, %function
EXTI_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_exti.c"
	.loc 1 109 0
	.loc 1 110 0
	ldr	r3, .L2
	ldr	r2, .L2+4
	.loc 1 115 0
	@ sp needed
	.loc 1 110 0
	str	r2, [r3]
	.loc 1 111 0
	mov	r2, #0
	str	r2, [r3, #4]
	.loc 1 112 0
	str	r2, [r3, #8]
	.loc 1 113 0
	str	r2, [r3, #12]
	.loc 1 114 0
	ldr	r2, .L2+8
	str	r2, [r3, #20]
	.loc 1 115 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073808384
	.word	261357568
	.word	7077887
.LFE32:
	.size	EXTI_DeInit, .-EXTI_DeInit
	.section	.text.EXTI_Init,"ax",%progbits
	.align	1
	.global	EXTI_Init
	.code	16
	.thumb_func
	.type	EXTI_Init, %function
EXTI_Init:
.LFB33:
	.loc 1 130 0
.LVL0:
	push	{r4, lr}
.LCFI0:
	.loc 1 141 0
	ldrb	r3, [r0, #6]
	ldr	r2, [r0]
	cmp	r3, #0
	beq	.L5
	.loc 1 144 0
	ldr	r3, .L10
	mvn	r1, r2
	ldr	r4, [r3]
	and	r4, r1
	str	r4, [r3]
	.loc 1 145 0
	ldr	r4, [r3, #4]
	and	r1, r4
	str	r1, [r3, #4]
.LVL1:
	.loc 1 147 0
	ldrb	r1, [r0, #4]
	add	r1, r1, r3
.LVL2:
	.loc 1 149 0
	ldr	r4, [r1]
	orr	r2, r4
	str	r2, [r1]
	.loc 1 152 0
	ldr	r2, [r0]
	ldr	r4, [r3, #8]
	mvn	r1, r2
.LVL3:
	and	r4, r1
	str	r4, [r3, #8]
	.loc 1 153 0
	ldr	r4, [r3, #12]
	and	r1, r4
	str	r1, [r3, #12]
	.loc 1 156 0
	ldrb	r1, [r0, #5]
	cmp	r1, #16
	bne	.L6
	.loc 1 159 0
	ldr	r1, [r3, #8]
	orr	r1, r2
	str	r1, [r3, #8]
	.loc 1 160 0
	ldr	r1, [r3, #12]
	orr	r2, r1
	str	r2, [r3, #12]
	b	.L4
.L6:
.LVL4:
	.loc 1 165 0
	ldr	r0, .L10
.LVL5:
	add	r3, r1, r0
	.loc 1 167 0
	ldr	r1, [r3]
.LVL6:
	orr	r2, r1
	b	.L8
.LVL7:
.L5:
	.loc 1 172 0
	ldr	r1, .L10
	ldrb	r3, [r0, #4]
	add	r3, r3, r1
.LVL8:
	.loc 1 175 0
	ldr	r1, [r3]
	bic	r1, r2
	mov	r2, r1
.LVL9:
.L8:
	str	r2, [r3]
.L4:
	.loc 1 177 0
	@ sp needed
	pop	{r4, pc}
.L11:
	.align	2
.L10:
	.word	1073808384
.LFE33:
	.size	EXTI_Init, .-EXTI_Init
	.section	.text.EXTI_StructInit,"ax",%progbits
	.align	1
	.global	EXTI_StructInit
	.code	16
	.thumb_func
	.type	EXTI_StructInit, %function
EXTI_StructInit:
.LFB34:
	.loc 1 186 0
.LVL10:
	.loc 1 187 0
	mov	r3, #0
	.loc 1 189 0
	mov	r2, #12
	.loc 1 187 0
	str	r3, [r0]
	.loc 1 188 0
	strb	r3, [r0, #4]
	.loc 1 189 0
	strb	r2, [r0, #5]
	.loc 1 190 0
	strb	r3, [r0, #6]
	.loc 1 191 0
	@ sp needed
	bx	lr
.LFE34:
	.size	EXTI_StructInit, .-EXTI_StructInit
	.section	.text.EXTI_GenerateSWInterrupt,"ax",%progbits
	.align	1
	.global	EXTI_GenerateSWInterrupt
	.code	16
	.thumb_func
	.type	EXTI_GenerateSWInterrupt, %function
EXTI_GenerateSWInterrupt:
.LFB35:
	.loc 1 201 0
.LVL11:
	.loc 1 205 0
	ldr	r3, .L14
	.loc 1 206 0
	@ sp needed
	.loc 1 205 0
	ldr	r2, [r3, #16]
	orr	r0, r2
.LVL12:
	str	r0, [r3, #16]
	.loc 1 206 0
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073808384
.LFE35:
	.size	EXTI_GenerateSWInterrupt, .-EXTI_GenerateSWInterrupt
	.section	.text.EXTI_GetFlagStatus,"ax",%progbits
	.align	1
	.global	EXTI_GetFlagStatus
	.code	16
	.thumb_func
	.type	EXTI_GetFlagStatus, %function
EXTI_GetFlagStatus:
.LFB36:
	.loc 1 232 0
.LVL13:
	.loc 1 237 0
	ldr	r3, .L17
	.loc 1 246 0
	@ sp needed
	.loc 1 237 0
	ldr	r3, [r3, #20]
.LVL14:
	and	r0, r3
.LVL15:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL16:
	.loc 1 245 0
	uxtb	r0, r0
	.loc 1 246 0
	bx	lr
.L18:
	.align	2
.L17:
	.word	1073808384
.LFE36:
	.size	EXTI_GetFlagStatus, .-EXTI_GetFlagStatus
	.section	.text.EXTI_ClearFlag,"ax",%progbits
	.align	1
	.global	EXTI_ClearFlag
	.code	16
	.thumb_func
	.type	EXTI_ClearFlag, %function
EXTI_ClearFlag:
.LFB37:
	.loc 1 255 0
.LVL17:
	.loc 1 259 0
	ldr	r3, .L20
	.loc 1 260 0
	@ sp needed
	.loc 1 259 0
	str	r0, [r3, #20]
	.loc 1 260 0
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073808384
.LFE37:
	.size	EXTI_ClearFlag, .-EXTI_ClearFlag
	.section	.text.EXTI_GetITStatus,"ax",%progbits
	.align	1
	.global	EXTI_GetITStatus
	.code	16
	.thumb_func
	.type	EXTI_GetITStatus, %function
EXTI_GetITStatus:
.LFB38:
	.loc 1 270 0
.LVL18:
	.loc 1 276 0
	ldr	r2, .L26
	.loc 1 283 0
	mov	r3, #0
	.loc 1 276 0
	ldr	r1, [r2]
.LVL19:
	.loc 1 277 0
	ldr	r2, [r2, #20]
	tst	r2, r0
	beq	.L23
	.loc 1 276 0 discriminator 1
	and	r0, r1
.LVL20:
	.loc 1 277 0 discriminator 1
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL21:
	.loc 1 279 0 discriminator 1
	uxtb	r3, r0
.L23:
.LVL22:
	.loc 1 287 0
	mov	r0, r3
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073808384
.LFE38:
	.size	EXTI_GetITStatus, .-EXTI_GetITStatus
	.section	.text.EXTI_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	EXTI_ClearITPendingBit
	.code	16
	.thumb_func
	.type	EXTI_ClearITPendingBit, %function
EXTI_ClearITPendingBit:
.LFB39:
	.loc 1 296 0
.LVL23:
	.loc 1 300 0
	ldr	r3, .L29
	.loc 1 301 0
	@ sp needed
	.loc 1 300 0
	str	r0, [r3, #20]
	.loc 1 301 0
	bx	lr
.L30:
	.align	2
.L29:
	.word	1073808384
.LFE39:
	.size	EXTI_ClearITPendingBit, .-EXTI_ClearITPendingBit
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
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_exti.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x303
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x1
	.4byte	.LASF41
	.4byte	.LASF42
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
	.4byte	.LASF9
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
	.byte	0xdf
	.4byte	0x89
	.uleb128 0x7
	.4byte	.LASF8
	.sleb128 0
	.uleb128 0x8
	.ascii	"SET\000"
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0xdf
	.4byte	0x74
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0xdf
	.4byte	0x74
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
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0xe1
	.4byte	0x9f
	.uleb128 0x9
	.byte	0x18
	.byte	0x3
	.2byte	0x15f
	.4byte	0x116
	.uleb128 0xa
	.ascii	"IMR\000"
	.byte	0x3
	.2byte	0x161
	.4byte	0x6f
	.byte	0
	.uleb128 0xa
	.ascii	"EMR\000"
	.byte	0x3
	.2byte	0x162
	.4byte	0x6f
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x163
	.4byte	0x6f
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x164
	.4byte	0x6f
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x165
	.4byte	0x6f
	.byte	0x10
	.uleb128 0xa
	.ascii	"PR\000"
	.byte	0x3
	.2byte	0x166
	.4byte	0x6f
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x167
	.4byte	0xbf
	.uleb128 0x6
	.byte	0x1
	.byte	0x4
	.byte	0x36
	.4byte	0x137
	.uleb128 0x7
	.4byte	.LASF19
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF20
	.sleb128 4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x4
	.byte	0x39
	.4byte	0x122
	.uleb128 0x6
	.byte	0x1
	.byte	0x4
	.byte	0x42
	.4byte	0x15d
	.uleb128 0x7
	.4byte	.LASF22
	.sleb128 8
	.uleb128 0x7
	.4byte	.LASF23
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF24
	.sleb128 16
	.byte	0
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x4
	.byte	0x46
	.4byte	0x142
	.uleb128 0xd
	.byte	0x8
	.byte	0x4
	.byte	0x4f
	.4byte	0x1a1
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x4
	.byte	0x51
	.4byte	0x48
	.byte	0
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x54
	.4byte	0x137
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x4
	.byte	0x57
	.4byte	0x15d
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x4
	.byte	0x5a
	.4byte	0xb4
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x4
	.byte	0x5c
	.4byte	0x168
	.uleb128 0xf
	.4byte	.LASF43
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF31
	.byte	0x1
	.byte	0x81
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f1
	.uleb128 0x11
	.4byte	.LASF33
	.byte	0x1
	.byte	0x81
	.4byte	0x1f1
	.4byte	.LLST0
	.uleb128 0x12
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x83
	.4byte	0x48
	.4byte	.LLST1
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x1a1
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21a
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x1
	.byte	0xb9
	.4byte	0x1f1
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0xc8
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23f
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0xc8
	.4byte	0x48
	.4byte	.LLST2
	.byte	0
	.uleb128 0x15
	.4byte	.LASF37
	.byte	0x1
	.byte	0xe7
	.4byte	0x89
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x277
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0xe7
	.4byte	0x48
	.4byte	.LLST3
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.byte	0xe9
	.4byte	0x89
	.4byte	.LLST4
	.byte	0
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0xfe
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29a
	.uleb128 0x14
	.4byte	.LASF26
	.byte	0x1
	.byte	0xfe
	.4byte	0x48
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x17
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x10d
	.4byte	0x94
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e5
	.uleb128 0x18
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x10d
	.4byte	0x48
	.4byte	.LLST5
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x10f
	.4byte	0x94
	.4byte	.LLST6
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x110
	.4byte	0x48
	.4byte	.LLST7
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x127
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x127
	.4byte	0x48
	.uleb128 0x1
	.byte	0x50
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1b
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
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
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
	.2byte	0x6
	.byte	0xc
	.4byte	0x40010400
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0xe
	.byte	0x70
	.sleb128 4
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x23
	.uleb128 0x40010400
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0xc
	.byte	0x71
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x23
	.uleb128 0x40010400
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x10
	.byte	0x73
	.sleb128 -1073808384
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x23
	.uleb128 0x40010400
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0xe
	.byte	0x70
	.sleb128 4
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x23
	.uleb128 0x40010400
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL11
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
.LLST3:
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL18
	.4byte	.LVL22
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x6
	.byte	0x70
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21
	.4byte	.LFE38
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x71
	.sleb128 0
	.byte	0x1a
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
.LASF26:
	.ascii	"EXTI_Line\000"
.LASF42:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF11:
	.ascii	"ITStatus\000"
.LASF39:
	.ascii	"enablestatus\000"
.LASF29:
	.ascii	"EXTI_LineCmd\000"
.LASF28:
	.ascii	"EXTI_Trigger\000"
.LASF32:
	.ascii	"EXTI_StructInit\000"
.LASF20:
	.ascii	"EXTI_Mode_Event\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF19:
	.ascii	"EXTI_Mode_Interrupt\000"
.LASF14:
	.ascii	"FunctionalState\000"
.LASF35:
	.ascii	"bitstatus\000"
.LASF34:
	.ascii	"EXTI_GenerateSWInterrupt\000"
.LASF30:
	.ascii	"EXTI_InitTypeDef\000"
.LASF33:
	.ascii	"EXTI_InitStruct\000"
.LASF13:
	.ascii	"ENABLE\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF10:
	.ascii	"FlagStatus\000"
.LASF36:
	.ascii	"EXTI_ClearFlag\000"
.LASF8:
	.ascii	"RESET\000"
.LASF21:
	.ascii	"EXTIMode_TypeDef\000"
.LASF18:
	.ascii	"EXTI_TypeDef\000"
.LASF40:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF15:
	.ascii	"RTSR\000"
.LASF41:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_exti.c"
	.ascii	"\000"
.LASF22:
	.ascii	"EXTI_Trigger_Rising\000"
.LASF24:
	.ascii	"EXTI_Trigger_Rising_Falling\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF31:
	.ascii	"EXTI_Init\000"
.LASF37:
	.ascii	"EXTI_GetFlagStatus\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"EXTI_Trigger_Falling\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF38:
	.ascii	"EXTI_GetITStatus\000"
.LASF44:
	.ascii	"EXTI_ClearITPendingBit\000"
.LASF2:
	.ascii	"short int\000"
.LASF27:
	.ascii	"EXTI_Mode\000"
.LASF9:
	.ascii	"uint32_t\000"
.LASF12:
	.ascii	"DISABLE\000"
.LASF25:
	.ascii	"EXTITrigger_TypeDef\000"
.LASF17:
	.ascii	"SWIER\000"
.LASF43:
	.ascii	"EXTI_DeInit\000"
.LASF16:
	.ascii	"FTSR\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
