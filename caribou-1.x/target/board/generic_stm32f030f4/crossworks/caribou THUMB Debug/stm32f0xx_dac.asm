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
	.file	"stm32f0xx_dac.c"
	.text
.Ltext0:
	.section	.text.DAC_DeInit,"ax",%progbits
	.align	1
	.global	DAC_DeInit
	.code	16
	.thumb_func
	.type	DAC_DeInit, %function
DAC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dac.c"
	.loc 1 150 0
	push	{r4, lr}
.LCFI0:
	.loc 1 152 0
	mov	r4, #128
	lsl	r4, r4, #22
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
.LVL0:
	.loc 1 154 0
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
.LVL1:
	.loc 1 155 0
	@ sp needed
	pop	{r4, pc}
.LFE32:
	.size	DAC_DeInit, .-DAC_DeInit
	.section	.text.DAC_Init,"ax",%progbits
	.align	1
	.global	DAC_Init
	.code	16
	.thumb_func
	.type	DAC_Init, %function
DAC_Init:
.LFB33:
	.loc 1 169 0
.LVL2:
	.loc 1 179 0
	ldr	r3, .L3
	.loc 1 169 0
	push	{r4, lr}
.LCFI1:
	.loc 1 179 0
	ldr	r2, [r3]
.LVL3:
	.loc 1 182 0
	mov	r4, #62
	lsl	r4, r4, r0
	bic	r2, r4
.LVL4:
	.loc 1 187 0
	ldr	r4, [r1, #4]
	ldr	r1, [r1]
.LVL5:
	.loc 1 194 0
	@ sp needed
	.loc 1 187 0
	orr	r1, r4
.LVL6:
	.loc 1 190 0
	lsl	r1, r1, r0
.LVL7:
	mov	r0, r1
.LVL8:
	orr	r0, r2
.LVL9:
	.loc 1 193 0
	str	r0, [r3]
.LVL10:
	.loc 1 194 0
	pop	{r4, pc}
.L4:
	.align	2
.L3:
	.word	1073771520
.LFE33:
	.size	DAC_Init, .-DAC_Init
	.section	.text.DAC_StructInit,"ax",%progbits
	.align	1
	.global	DAC_StructInit
	.code	16
	.thumb_func
	.type	DAC_StructInit, %function
DAC_StructInit:
.LFB34:
	.loc 1 203 0
.LVL11:
	.loc 1 206 0
	mov	r3, #0
	str	r3, [r0]
	.loc 1 208 0
	str	r3, [r0, #4]
	.loc 1 209 0
	@ sp needed
	bx	lr
.LFE34:
	.size	DAC_StructInit, .-DAC_StructInit
	.section	.text.DAC_Cmd,"ax",%progbits
	.align	1
	.global	DAC_Cmd
	.code	16
	.thumb_func
	.type	DAC_Cmd, %function
DAC_Cmd:
.LFB35:
	.loc 1 223 0
.LVL12:
	ldr	r3, .L10
	mov	r2, #1
	.loc 1 228 0
	cmp	r1, #0
	beq	.L7
	.loc 1 231 0
	ldr	r1, [r3]
.LVL13:
	lsl	r2, r2, r0
	mov	r0, r2
.LVL14:
	orr	r0, r1
	str	r0, [r3]
	b	.L6
.LVL15:
.L7:
	.loc 1 236 0
	ldr	r1, [r3]
.LVL16:
	lsl	r2, r2, r0
	mov	r0, r2
.LVL17:
	mov	r2, r1
	bic	r2, r0
	str	r2, [r3]
.L6:
	.loc 1 238 0
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073771520
.LFE35:
	.size	DAC_Cmd, .-DAC_Cmd
	.section	.text.DAC_SoftwareTriggerCmd,"ax",%progbits
	.align	1
	.global	DAC_SoftwareTriggerCmd
	.code	16
	.thumb_func
	.type	DAC_SoftwareTriggerCmd, %function
DAC_SoftwareTriggerCmd:
.LFB36:
	.loc 1 250 0
.LVL18:
	ldr	r3, .L15
	lsr	r0, r0, #4
.LVL19:
	mov	r2, #1
	.loc 1 255 0
	cmp	r1, #0
	beq	.L13
	.loc 1 258 0
	ldr	r1, [r3, #4]
.LVL20:
	lsl	r2, r2, r0
	mov	r0, r2
	orr	r0, r1
	str	r0, [r3, #4]
	b	.L12
.LVL21:
.L13:
	.loc 1 263 0
	ldr	r1, [r3, #4]
.LVL22:
	lsl	r2, r2, r0
	mov	r0, r2
	mov	r2, r1
	bic	r2, r0
	str	r2, [r3, #4]
.L12:
	.loc 1 265 0
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073771520
.LFE36:
	.size	DAC_SoftwareTriggerCmd, .-DAC_SoftwareTriggerCmd
	.section	.text.DAC_SetChannel1Data,"ax",%progbits
	.align	1
	.global	DAC_SetChannel1Data
	.code	16
	.thumb_func
	.type	DAC_SetChannel1Data, %function
DAC_SetChannel1Data:
.LFB37:
	.loc 1 278 0
.LVL23:
	sub	sp, sp, #8
.LCFI2:
	.loc 1 279 0
	mov	r3, #0
	str	r3, [sp, #4]
	.loc 1 285 0
	ldr	r3, .L18
	str	r3, [sp, #4]
	.loc 1 286 0
	ldr	r3, [sp, #4]
	add	r3, r3, #8
	add	r0, r3, r0
.LVL24:
	str	r0, [sp, #4]
	.loc 1 289 0
	ldr	r3, [sp, #4]
	str	r1, [r3]
	.loc 1 290 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073771520
.LFE37:
	.size	DAC_SetChannel1Data, .-DAC_SetChannel1Data
	.section	.text.DAC_GetDataOutputValue,"ax",%progbits
	.align	1
	.global	DAC_GetDataOutputValue
	.code	16
	.thumb_func
	.type	DAC_GetDataOutputValue, %function
DAC_GetDataOutputValue:
.LFB38:
	.loc 1 300 0
.LVL25:
	sub	sp, sp, #8
.LCFI3:
	.loc 1 301 0
	mov	r3, #0
	str	r3, [sp, #4]
	.loc 1 306 0
	ldr	r3, .L21
	.loc 1 307 0
	lsr	r0, r0, #2
.LVL26:
	.loc 1 306 0
	str	r3, [sp, #4]
	.loc 1 307 0
	ldr	r3, [sp, #4]
	add	r3, r3, #44
	add	r0, r3, r0
	str	r0, [sp, #4]
	.loc 1 310 0
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	uxth	r0, r0
	.loc 1 311 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073771520
.LFE38:
	.size	DAC_GetDataOutputValue, .-DAC_GetDataOutputValue
	.section	.text.DAC_DMACmd,"ax",%progbits
	.align	1
	.global	DAC_DMACmd
	.code	16
	.thumb_func
	.type	DAC_DMACmd, %function
DAC_DMACmd:
.LFB39:
	.loc 1 342 0
.LVL27:
	mov	r2, #128
	ldr	r3, .L26
	lsl	r2, r2, #5
	.loc 1 347 0
	cmp	r1, #0
	beq	.L24
	.loc 1 350 0
	ldr	r1, [r3]
.LVL28:
	lsl	r2, r2, r0
	mov	r0, r2
.LVL29:
	orr	r0, r1
	str	r0, [r3]
	b	.L23
.LVL30:
.L24:
	.loc 1 355 0
	ldr	r1, [r3]
.LVL31:
	lsl	r2, r2, r0
	mov	r0, r2
.LVL32:
	mov	r2, r1
	bic	r2, r0
	str	r2, [r3]
.L23:
	.loc 1 357 0
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073771520
.LFE39:
	.size	DAC_DMACmd, .-DAC_DMACmd
	.section	.text.DAC_ITConfig,"ax",%progbits
	.align	1
	.global	DAC_ITConfig
	.code	16
	.thumb_func
	.type	DAC_ITConfig, %function
DAC_ITConfig:
.LFB40:
	.loc 1 390 0
.LVL33:
	ldr	r3, .L31
	lsl	r1, r1, r0
.LVL34:
	.loc 1 396 0
	cmp	r2, #0
	beq	.L29
	.loc 1 399 0
	ldr	r2, [r3]
.LVL35:
	orr	r1, r2
	str	r1, [r3]
	b	.L28
.LVL36:
.L29:
	.loc 1 404 0
	ldr	r2, [r3]
.LVL37:
	bic	r2, r1
	str	r2, [r3]
.L28:
	.loc 1 406 0
	@ sp needed
	bx	lr
.L32:
	.align	2
.L31:
	.word	1073771520
.LFE40:
	.size	DAC_ITConfig, .-DAC_ITConfig
	.section	.text.DAC_GetFlagStatus,"ax",%progbits
	.align	1
	.global	DAC_GetFlagStatus
	.code	16
	.thumb_func
	.type	DAC_GetFlagStatus, %function
DAC_GetFlagStatus:
.LFB41:
	.loc 1 421 0
.LVL38:
	.loc 1 429 0
	ldr	r3, .L34
	lsl	r1, r1, r0
.LVL39:
	ldr	r3, [r3, #52]
.LVL40:
	mov	r0, r1
.LVL41:
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 440 0
	uxtb	r0, r0
	.loc 1 441 0
	@ sp needed
	bx	lr
.L35:
	.align	2
.L34:
	.word	1073771520
.LFE41:
	.size	DAC_GetFlagStatus, .-DAC_GetFlagStatus
	.section	.text.DAC_ClearFlag,"ax",%progbits
	.align	1
	.global	DAC_ClearFlag
	.code	16
	.thumb_func
	.type	DAC_ClearFlag, %function
DAC_ClearFlag:
.LFB42:
	.loc 1 454 0
.LVL42:
	.loc 1 460 0
	ldr	r3, .L37
	lsl	r1, r1, r0
.LVL43:
	str	r1, [r3, #52]
	.loc 1 461 0
	@ sp needed
	bx	lr
.L38:
	.align	2
.L37:
	.word	1073771520
.LFE42:
	.size	DAC_ClearFlag, .-DAC_ClearFlag
	.section	.text.DAC_GetITStatus,"ax",%progbits
	.align	1
	.global	DAC_GetITStatus
	.code	16
	.thumb_func
	.type	DAC_GetITStatus, %function
DAC_GetITStatus:
.LFB43:
	.loc 1 476 0
.LVL44:
	.loc 1 485 0
	ldr	r3, .L43
	lsl	r1, r1, r0
.LVL45:
	ldr	r2, [r3]
.LVL46:
	.loc 1 488 0
	ldr	r3, [r3, #52]
	.loc 1 496 0
	mov	r0, #0
.LVL47:
	.loc 1 488 0
	tst	r3, r1
	beq	.L40
	.loc 1 485 0 discriminator 1
	and	r1, r2
.LVL48:
	.loc 1 488 0 discriminator 1
	sub	r0, r1, #1
	sbc	r1, r1, r0
.LVL49:
	.loc 1 491 0 discriminator 1
	uxtb	r0, r1
.L40:
.LVL50:
	.loc 1 500 0
	@ sp needed
	bx	lr
.L44:
	.align	2
.L43:
	.word	1073771520
.LFE43:
	.size	DAC_GetITStatus, .-DAC_GetITStatus
	.section	.text.DAC_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	DAC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	DAC_ClearITPendingBit, %function
DAC_ClearITPendingBit:
.LFB44:
	.loc 1 513 0
.LVL51:
	.loc 1 519 0
	ldr	r3, .L46
	lsl	r1, r1, r0
.LVL52:
	str	r1, [r3, #52]
	.loc 1 520 0
	@ sp needed
	bx	lr
.L47:
	.align	2
.L46:
	.word	1073771520
.LFE44:
	.size	DAC_ClearITPendingBit, .-DAC_ClearITPendingBit
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
	.byte	0x84
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
	.byte	0x4
	.4byte	.LCFI2-.LFB37
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI3-.LFB38
	.byte	0xe
	.uleb128 0x8
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
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_dac.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4db
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x1
	.4byte	.LASF53
	.4byte	.LASF54
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	0x5e
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xdf
	.4byte	0x9f
	.uleb128 0x7
	.4byte	.LASF11
	.sleb128 0
	.uleb128 0x8
	.ascii	"SET\000"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0xdf
	.4byte	0x8a
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0xdf
	.4byte	0x8a
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0xca
	.uleb128 0x7
	.4byte	.LASF14
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF15
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0xe1
	.4byte	0xb5
	.uleb128 0x9
	.byte	0x38
	.byte	0x3
	.2byte	0x130
	.4byte	0x152
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x132
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x133
	.4byte	0x85
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x134
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x135
	.4byte	0x85
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x136
	.4byte	0x85
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x137
	.4byte	0x152
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x138
	.4byte	0x85
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x139
	.4byte	0x5e
	.byte	0x30
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x13a
	.4byte	0x85
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.4byte	0x5e
	.4byte	0x162
	.uleb128 0xd
	.4byte	0x7e
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x13b
	.4byte	0xd5
	.uleb128 0xf
	.byte	0x8
	.byte	0x4
	.byte	0x36
	.4byte	0x18f
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x4
	.byte	0x38
	.4byte	0x5e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x4
	.byte	0x3b
	.4byte	0x5e
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3d
	.4byte	0x16e
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x95
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1de
	.uleb128 0x12
	.4byte	.LVL0
	.4byte	0x4cb
	.4byte	0x1c8
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL1
	.4byte	0x4cb
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x1
	.byte	0xa8
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x230
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x1
	.byte	0xa8
	.4byte	0x5e
	.4byte	.LLST0
	.uleb128 0x15
	.4byte	.LASF31
	.byte	0x1
	.byte	0xa8
	.4byte	0x230
	.4byte	.LLST1
	.uleb128 0x16
	.4byte	.LASF32
	.byte	0x1
	.byte	0xaa
	.4byte	0x5e
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0xaa
	.4byte	0x5e
	.4byte	.LLST3
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.4byte	0x18f
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0x1
	.byte	0xca
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x259
	.uleb128 0x18
	.4byte	.LASF31
	.byte	0x1
	.byte	0xca
	.4byte	0x230
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0xde
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28d
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x1
	.byte	0xde
	.4byte	0x5e
	.4byte	.LLST4
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xde
	.4byte	0xca
	.4byte	.LLST5
	.byte	0
	.uleb128 0x11
	.4byte	.LASF37
	.byte	0x1
	.byte	0xf9
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c1
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x1
	.byte	0xf9
	.4byte	0x5e
	.4byte	.LLST6
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xf9
	.4byte	0xca
	.4byte	.LLST7
	.byte	0
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x305
	.uleb128 0x1a
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x115
	.4byte	0x5e
	.4byte	.LLST8
	.uleb128 0x1b
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x115
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1c
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x12b
	.4byte	0x45
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x33f
	.uleb128 0x1a
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x12b
	.4byte	0x5e
	.4byte	.LLST9
	.uleb128 0x1c
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x12d
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x19
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x155
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x376
	.uleb128 0x1a
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x155
	.4byte	0x5e
	.4byte	.LLST10
	.uleb128 0x1a
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x155
	.4byte	0xca
	.4byte	.LLST11
	.byte	0
	.uleb128 0x19
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x185
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3bb
	.uleb128 0x1b
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x185
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x185
	.4byte	0x5e
	.4byte	.LLST12
	.uleb128 0x1a
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x185
	.4byte	0xca
	.4byte	.LLST13
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x9f
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x406
	.uleb128 0x1a
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x5e
	.4byte	.LLST14
	.uleb128 0x1a
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x5e
	.4byte	.LLST15
	.uleb128 0x1e
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1a6
	.4byte	0x9f
	.4byte	.LLST16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1c5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43b
	.uleb128 0x1b
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x5e
	.4byte	.LLST17
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1db
	.4byte	0xaa
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x496
	.uleb128 0x1a
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x1db
	.4byte	0x5e
	.4byte	.LLST18
	.uleb128 0x1a
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x1db
	.4byte	0x5e
	.4byte	.LLST19
	.uleb128 0x1e
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1dd
	.4byte	0xaa
	.4byte	.LLST20
	.uleb128 0x1e
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1de
	.4byte	0x5e
	.4byte	.LLST21
	.byte	0
	.uleb128 0x19
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x200
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4cb
	.uleb128 0x1b
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x200
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x200
	.4byte	0x5e
	.4byte	.LLST22
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x1f4
	.uleb128 0x20
	.4byte	0x5e
	.uleb128 0x20
	.4byte	0xca
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x12
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x1a
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
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL2
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL8
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL5
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL9
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x8
	.byte	0x71
	.sleb128 4
	.byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x6
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL7
	.4byte	.LVL10
	.2byte	0x8
	.byte	0x74
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x6
	.byte	0x21
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17
	.4byte	.LFE35
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
	.4byte	.LVL15
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL16
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL19
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL22
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL27
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL32
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL28
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL31
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL34
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL37
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL38
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL39
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL38
	.4byte	.LVL40
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL42
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL43
	.4byte	.LFE42
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL44
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL47
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL45
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL44
	.4byte	.LVL50
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL50
	.4byte	.LFE43
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL44
	.4byte	.LVL46
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL46
	.4byte	.LVL48
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL48
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL49
	.4byte	.LFE43
	.2byte	0xb
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x24
	.byte	0x72
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL52
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x7c
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
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
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
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"DAC_DeInit\000"
.LASF54:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF51:
	.ascii	"DAC_ClearITPendingBit\000"
.LASF44:
	.ascii	"DAC_GetDataOutputValue\000"
.LASF31:
	.ascii	"DAC_InitStruct\000"
.LASF40:
	.ascii	"Data\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF50:
	.ascii	"enablestatus\000"
.LASF25:
	.ascii	"DAC_Trigger\000"
.LASF27:
	.ascii	"DAC_InitTypeDef\000"
.LASF32:
	.ascii	"tmpreg1\000"
.LASF33:
	.ascii	"tmpreg2\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF19:
	.ascii	"DHR12L1\000"
.LASF39:
	.ascii	"DAC_Align\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF0:
	.ascii	"signed char\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF36:
	.ascii	"NewState\000"
.LASF30:
	.ascii	"DAC_Channel\000"
.LASF24:
	.ascii	"DAC_TypeDef\000"
.LASF52:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF34:
	.ascii	"DAC_StructInit\000"
.LASF21:
	.ascii	"RESERVED\000"
.LASF55:
	.ascii	"RCC_APB1PeriphResetCmd\000"
.LASF53:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_dac.c\000"
.LASF26:
	.ascii	"DAC_OutputBuffer\000"
.LASF42:
	.ascii	"DAC_ITConfig\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF45:
	.ascii	"DAC_GetFlagStatus\000"
.LASF41:
	.ascii	"DAC_DMACmd\000"
.LASF49:
	.ascii	"DAC_GetITStatus\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"long long int\000"
.LASF29:
	.ascii	"DAC_Init\000"
.LASF20:
	.ascii	"DHR8R1\000"
.LASF2:
	.ascii	"short int\000"
.LASF48:
	.ascii	"DAC_ClearFlag\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF18:
	.ascii	"DHR12R1\000"
.LASF46:
	.ascii	"DAC_FLAG\000"
.LASF38:
	.ascii	"DAC_SetChannel1Data\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF43:
	.ascii	"DAC_IT\000"
.LASF37:
	.ascii	"DAC_SoftwareTriggerCmd\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF22:
	.ascii	"DOR1\000"
.LASF35:
	.ascii	"DAC_Cmd\000"
.LASF17:
	.ascii	"SWTRIGR\000"
.LASF23:
	.ascii	"RESERVED1\000"
.LASF47:
	.ascii	"bitstatus\000"
.LASF11:
	.ascii	"RESET\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
