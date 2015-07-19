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
	.file	"stm32f0xx_dac.c"
	.text
.Ltext0:
	.section	.text.DAC_DeInit,"ax",%progbits
	.align	2
	.global	DAC_DeInit
	.code	16
	.thumb_func
	.type	DAC_DeInit, %function
DAC_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	mov	r4, #128
	lsl	r4, r4, #22
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	@ sp needed
	pop	{r4, pc}
.LFE32:
	.size	DAC_DeInit, .-DAC_DeInit
	.section	.text.DAC_Init,"ax",%progbits
	.align	2
	.global	DAC_Init
	.code	16
	.thumb_func
	.type	DAC_Init, %function
DAC_Init:
.LFB33:
	push	{r4, lr}
.LCFI1:
	ldr	r3, .L3
	ldr	r2, [r3]
	mov	r4, #62
	lsl	r4, r4, r0
	bic	r2, r4
	ldr	r4, [r1, #4]
	ldr	r1, [r1]
	orr	r1, r4
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	pop	{r4, pc}
.L4:
	.align	2
.L3:
	.word	1073771520
.LFE33:
	.size	DAC_Init, .-DAC_Init
	.section	.text.DAC_StructInit,"ax",%progbits
	.align	2
	.global	DAC_StructInit
	.code	16
	.thumb_func
	.type	DAC_StructInit, %function
DAC_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	str	r3, [r0, #4]
	@ sp needed
	bx	lr
.LFE34:
	.size	DAC_StructInit, .-DAC_StructInit
	.section	.text.DAC_Cmd,"ax",%progbits
	.align	2
	.global	DAC_Cmd
	.code	16
	.thumb_func
	.type	DAC_Cmd, %function
DAC_Cmd:
.LFB35:
	cmp	r1, #0
	beq	.L7
	ldr	r3, .L9
	ldr	r2, [r3]
	mov	r1, #1
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	b	.L6
.L7:
	ldr	r3, .L9
	ldr	r2, [r3]
	mov	r1, #1
	lsl	r1, r1, r0
	bic	r2, r1
	str	r2, [r3]
.L6:
	@ sp needed
	bx	lr
.L10:
	.align	2
.L9:
	.word	1073771520
.LFE35:
	.size	DAC_Cmd, .-DAC_Cmd
	.section	.text.DAC_SoftwareTriggerCmd,"ax",%progbits
	.align	2
	.global	DAC_SoftwareTriggerCmd
	.code	16
	.thumb_func
	.type	DAC_SoftwareTriggerCmd, %function
DAC_SoftwareTriggerCmd:
.LFB36:
	cmp	r1, #0
	beq	.L12
	ldr	r3, .L14
	ldr	r2, [r3, #4]
	lsr	r0, r0, #4
	mov	r1, #1
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3, #4]
	b	.L11
.L12:
	ldr	r3, .L14
	ldr	r2, [r3, #4]
	lsr	r0, r0, #4
	mov	r1, #1
	lsl	r1, r1, r0
	bic	r2, r1
	str	r2, [r3, #4]
.L11:
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073771520
.LFE36:
	.size	DAC_SoftwareTriggerCmd, .-DAC_SoftwareTriggerCmd
	.section	.text.DAC_SetChannel1Data,"ax",%progbits
	.align	2
	.global	DAC_SetChannel1Data
	.code	16
	.thumb_func
	.type	DAC_SetChannel1Data, %function
DAC_SetChannel1Data:
.LFB37:
	sub	sp, sp, #8
.LCFI2:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L17
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	add	r3, r3, #8
	add	r0, r3, r0
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	str	r1, [r3]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L18:
	.align	2
.L17:
	.word	1073771520
.LFE37:
	.size	DAC_SetChannel1Data, .-DAC_SetChannel1Data
	.section	.text.DAC_GetDataOutputValue,"ax",%progbits
	.align	2
	.global	DAC_GetDataOutputValue
	.code	16
	.thumb_func
	.type	DAC_GetDataOutputValue, %function
DAC_GetDataOutputValue:
.LFB38:
	sub	sp, sp, #8
.LCFI3:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L20
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	add	r3, r3, #44
	lsr	r0, r0, #2
	add	r0, r3, r0
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	uxth	r0, r0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073771520
.LFE38:
	.size	DAC_GetDataOutputValue, .-DAC_GetDataOutputValue
	.section	.text.DAC_DMACmd,"ax",%progbits
	.align	2
	.global	DAC_DMACmd
	.code	16
	.thumb_func
	.type	DAC_DMACmd, %function
DAC_DMACmd:
.LFB39:
	cmp	r1, #0
	beq	.L23
	ldr	r3, .L25
	ldr	r2, [r3]
	mov	r1, #128
	lsl	r1, r1, #5
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	b	.L22
.L23:
	ldr	r3, .L25
	ldr	r2, [r3]
	mov	r1, #128
	lsl	r1, r1, #5
	lsl	r1, r1, r0
	bic	r2, r1
	str	r2, [r3]
.L22:
	@ sp needed
	bx	lr
.L26:
	.align	2
.L25:
	.word	1073771520
.LFE39:
	.size	DAC_DMACmd, .-DAC_DMACmd
	.section	.text.DAC_ITConfig,"ax",%progbits
	.align	2
	.global	DAC_ITConfig
	.code	16
	.thumb_func
	.type	DAC_ITConfig, %function
DAC_ITConfig:
.LFB40:
	cmp	r2, #0
	beq	.L28
	ldr	r3, .L30
	ldr	r2, [r3]
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	b	.L27
.L28:
	ldr	r3, .L30
	ldr	r2, [r3]
	lsl	r1, r1, r0
	bic	r2, r1
	str	r2, [r3]
.L27:
	@ sp needed
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073771520
.LFE40:
	.size	DAC_ITConfig, .-DAC_ITConfig
	.section	.text.DAC_GetFlagStatus,"ax",%progbits
	.align	2
	.global	DAC_GetFlagStatus
	.code	16
	.thumb_func
	.type	DAC_GetFlagStatus, %function
DAC_GetFlagStatus:
.LFB41:
	ldr	r3, .L33
	ldr	r3, [r3, #52]
	lsl	r1, r1, r0
	mov	r0, r1
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073771520
.LFE41:
	.size	DAC_GetFlagStatus, .-DAC_GetFlagStatus
	.section	.text.DAC_ClearFlag,"ax",%progbits
	.align	2
	.global	DAC_ClearFlag
	.code	16
	.thumb_func
	.type	DAC_ClearFlag, %function
DAC_ClearFlag:
.LFB42:
	lsl	r1, r1, r0
	ldr	r3, .L36
	str	r1, [r3, #52]
	@ sp needed
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073771520
.LFE42:
	.size	DAC_ClearFlag, .-DAC_ClearFlag
	.section	.text.DAC_GetITStatus,"ax",%progbits
	.align	2
	.global	DAC_GetITStatus
	.code	16
	.thumb_func
	.type	DAC_GetITStatus, %function
DAC_GetITStatus:
.LFB43:
	ldr	r3, .L41
	ldr	r2, [r3]
	lsl	r1, r1, r0
	ldr	r3, [r3, #52]
	mov	r0, #0
	tst	r3, r1
	beq	.L39
	and	r1, r2
	sub	r2, r1, #1
	sbc	r1, r1, r2
	uxtb	r0, r1
.L39:
	@ sp needed
	bx	lr
.L42:
	.align	2
.L41:
	.word	1073771520
.LFE43:
	.size	DAC_GetITStatus, .-DAC_GetITStatus
	.section	.text.DAC_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	DAC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	DAC_ClearITPendingBit, %function
DAC_ClearITPendingBit:
.LFB44:
	lsl	r1, r1, r0
	ldr	r3, .L44
	str	r1, [r3, #52]
	@ sp needed
	bx	lr
.L45:
	.align	2
.L44:
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dac.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xff
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x1
	.4byte	.LASF14
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x95
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa8
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xca
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0xde
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0xf9
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x12b
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x155
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x185
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1a4
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x1c5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1db
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x200
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
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
	.uleb128 0x2116
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
	.uleb128 0x4
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
.LASF5:
	.ascii	"DAC_SetChannel1Data\000"
.LASF3:
	.ascii	"DAC_Cmd\000"
.LASF9:
	.ascii	"DAC_GetFlagStatus\000"
.LASF1:
	.ascii	"DAC_Init\000"
.LASF2:
	.ascii	"DAC_StructInit\000"
.LASF4:
	.ascii	"DAC_SoftwareTriggerCmd\000"
.LASF8:
	.ascii	"DAC_ITConfig\000"
.LASF0:
	.ascii	"DAC_DeInit\000"
.LASF13:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF6:
	.ascii	"DAC_GetDataOutputValue\000"
.LASF11:
	.ascii	"DAC_GetITStatus\000"
.LASF14:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_dac.c\000"
.LASF12:
	.ascii	"DAC_ClearITPendingBit\000"
.LASF10:
	.ascii	"DAC_ClearFlag\000"
.LASF7:
	.ascii	"DAC_DMACmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
