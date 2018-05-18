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
	.file	"stm32f0xx_gpio.c"
	.text
.Ltext0:
	.section	.text.GPIO_DeInit,"ax",%progbits
	.align	2
	.global	GPIO_DeInit
	.code	16
	.thumb_func
	.type	GPIO_DeInit, %function
GPIO_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	mov	r3, #144
	lsl	r3, r3, #23
	cmp	r0, r3
	bne	.L2
	mov	r4, #128
	lsl	r4, r4, #10
	mov	r0, r4
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_AHBPeriphResetCmd
	b	.L1
.L2:
	ldr	r3, .L7
	cmp	r0, r3
	bne	.L4
	mov	r4, #128
	lsl	r4, r4, #11
	mov	r0, r4
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_AHBPeriphResetCmd
	b	.L1
.L4:
	ldr	r3, .L7+4
	cmp	r0, r3
	bne	.L5
	mov	r4, #128
	lsl	r4, r4, #12
	mov	r0, r4
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_AHBPeriphResetCmd
	b	.L1
.L5:
	ldr	r3, .L7+8
	cmp	r0, r3
	bne	.L6
	mov	r4, #128
	lsl	r4, r4, #13
	mov	r0, r4
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_AHBPeriphResetCmd
	b	.L1
.L6:
	ldr	r3, .L7+12
	cmp	r0, r3
	bne	.L1
	mov	r4, #128
	lsl	r4, r4, #15
	mov	r0, r4
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_AHBPeriphResetCmd
.L1:
	@ sp needed
	pop	{r4, pc}
.L8:
	.align	2
.L7:
	.word	1207960576
	.word	1207961600
	.word	1207962624
	.word	1207964672
.LFE32:
	.size	GPIO_DeInit, .-GPIO_DeInit
	.section	.text.GPIO_Init,"ax",%progbits
	.align	2
	.global	GPIO_Init
	.code	16
	.thumb_func
	.type	GPIO_Init, %function
GPIO_Init:
.LFB33:
	push	{r4, r5, r6, r7, lr}
.LCFI1:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI2:
	mov	r2, #0
	mov	r3, #0
	mov	r6, #1
	mov	r7, #3
.L13:
	mov	r4, r6
	lsl	r4, r4, r3
	ldr	r5, [r1]
	and	r5, r4
	cmp	r5, r4
	bne	.L10
	ldrb	r4, [r1, #4]
	sub	r4, r4, #1
	cmp	r4, #1
	bhi	.L11
	ldr	r4, [r0, #8]
	mov	r5, r7
	lsl	r5, r5, r2
	bic	r4, r5
	str	r4, [r0, #8]
	ldr	r5, [r0, #8]
	ldrb	r4, [r1, #5]
	lsl	r4, r4, r2
	orr	r4, r5
	str	r4, [r0, #8]
	ldrh	r4, [r0, #4]
	mov	r8, r4
	lsl	r4, r3, #16
	lsr	r4, r4, #16
	mov	r9, r4
	mov	r5, r6
	lsl	r5, r5, r4
	mov	r4, r8
	bic	r4, r5
	strh	r4, [r0, #4]
	ldrh	r4, [r0, #4]
	mov	r8, r4
	ldrb	r5, [r1, #6]
	mov	r4, r5
	mov	r5, r9
	lsl	r4, r4, r5
	mov	r5, r8
	orr	r4, r5
	uxth	r4, r4
	strh	r4, [r0, #4]
.L11:
	ldr	r4, [r0]
	mov	r5, r7
	lsl	r5, r5, r2
	bic	r4, r5
	str	r4, [r0]
	ldr	r5, [r0]
	ldrb	r4, [r1, #4]
	lsl	r4, r4, r2
	orr	r4, r5
	str	r4, [r0]
	ldr	r4, [r0, #12]
	mov	r8, r4
	lsl	r5, r3, #16
	lsr	r5, r5, #15
	mov	r4, r7
	lsl	r4, r4, r5
	mov	ip, r4
	mov	r4, r8
	mov	r5, ip
	bic	r4, r5
	str	r4, [r0, #12]
	ldr	r5, [r0, #12]
	ldrb	r4, [r1, #7]
	lsl	r4, r4, r2
	orr	r4, r5
	str	r4, [r0, #12]
.L10:
	add	r3, r3, #1
	add	r2, r2, #2
	cmp	r3, #16
	bne	.L13
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r4, r5, r6, r7, pc}
.LFE33:
	.size	GPIO_Init, .-GPIO_Init
	.section	.text.GPIO_StructInit,"ax",%progbits
	.align	2
	.global	GPIO_StructInit
	.code	16
	.thumb_func
	.type	GPIO_StructInit, %function
GPIO_StructInit:
.LFB34:
	ldr	r3, .L15
	str	r3, [r0]
	mov	r3, #0
	strb	r3, [r0, #4]
	mov	r2, #2
	strb	r2, [r0, #5]
	strb	r3, [r0, #6]
	strb	r3, [r0, #7]
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	65535
.LFE34:
	.size	GPIO_StructInit, .-GPIO_StructInit
	.section	.text.GPIO_PinLockConfig,"ax",%progbits
	.align	2
	.global	GPIO_PinLockConfig
	.code	16
	.thumb_func
	.type	GPIO_PinLockConfig, %function
GPIO_PinLockConfig:
.LFB35:
	sub	sp, sp, #8
.LCFI3:
	mov	r3, #128
	lsl	r3, r3, #9
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	orr	r3, r1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	str	r3, [r0, #28]
	str	r1, [r0, #28]
	ldr	r3, [sp, #4]
	str	r3, [r0, #28]
	ldr	r3, [r0, #28]
	str	r3, [sp, #4]
	ldr	r3, [r0, #28]
	str	r3, [sp, #4]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.LFE35:
	.size	GPIO_PinLockConfig, .-GPIO_PinLockConfig
	.section	.text.GPIO_ReadInputDataBit,"ax",%progbits
	.align	2
	.global	GPIO_ReadInputDataBit
	.code	16
	.thumb_func
	.type	GPIO_ReadInputDataBit, %function
GPIO_ReadInputDataBit:
.LFB36:
	ldrh	r0, [r0, #16]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE36:
	.size	GPIO_ReadInputDataBit, .-GPIO_ReadInputDataBit
	.section	.text.GPIO_ReadInputData,"ax",%progbits
	.align	2
	.global	GPIO_ReadInputData
	.code	16
	.thumb_func
	.type	GPIO_ReadInputData, %function
GPIO_ReadInputData:
.LFB37:
	ldrh	r0, [r0, #16]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE37:
	.size	GPIO_ReadInputData, .-GPIO_ReadInputData
	.section	.text.GPIO_ReadOutputDataBit,"ax",%progbits
	.align	2
	.global	GPIO_ReadOutputDataBit
	.code	16
	.thumb_func
	.type	GPIO_ReadOutputDataBit, %function
GPIO_ReadOutputDataBit:
.LFB38:
	ldrh	r0, [r0, #20]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE38:
	.size	GPIO_ReadOutputDataBit, .-GPIO_ReadOutputDataBit
	.section	.text.GPIO_ReadOutputData,"ax",%progbits
	.align	2
	.global	GPIO_ReadOutputData
	.code	16
	.thumb_func
	.type	GPIO_ReadOutputData, %function
GPIO_ReadOutputData:
.LFB39:
	ldrh	r0, [r0, #20]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE39:
	.size	GPIO_ReadOutputData, .-GPIO_ReadOutputData
	.section	.text.GPIO_SetBits,"ax",%progbits
	.align	2
	.global	GPIO_SetBits
	.code	16
	.thumb_func
	.type	GPIO_SetBits, %function
GPIO_SetBits:
.LFB40:
	str	r1, [r0, #24]
	@ sp needed
	bx	lr
.LFE40:
	.size	GPIO_SetBits, .-GPIO_SetBits
	.section	.text.GPIO_ResetBits,"ax",%progbits
	.align	2
	.global	GPIO_ResetBits
	.code	16
	.thumb_func
	.type	GPIO_ResetBits, %function
GPIO_ResetBits:
.LFB41:
	strh	r1, [r0, #40]
	@ sp needed
	bx	lr
.LFE41:
	.size	GPIO_ResetBits, .-GPIO_ResetBits
	.section	.text.GPIO_WriteBit,"ax",%progbits
	.align	2
	.global	GPIO_WriteBit
	.code	16
	.thumb_func
	.type	GPIO_WriteBit, %function
GPIO_WriteBit:
.LFB42:
	cmp	r2, #0
	beq	.L25
	str	r1, [r0, #24]
	b	.L24
.L25:
	strh	r1, [r0, #40]
.L24:
	@ sp needed
	bx	lr
.LFE42:
	.size	GPIO_WriteBit, .-GPIO_WriteBit
	.section	.text.GPIO_Write,"ax",%progbits
	.align	2
	.global	GPIO_Write
	.code	16
	.thumb_func
	.type	GPIO_Write, %function
GPIO_Write:
.LFB43:
	strh	r1, [r0, #20]
	@ sp needed
	bx	lr
.LFE43:
	.size	GPIO_Write, .-GPIO_Write
	.section	.text.GPIO_PinAFConfig,"ax",%progbits
	.align	2
	.global	GPIO_PinAFConfig
	.code	16
	.thumb_func
	.type	GPIO_PinAFConfig, %function
GPIO_PinAFConfig:
.LFB44:
	push	{r4, lr}
.LCFI4:
	mov	r3, #7
	and	r3, r1
	lsl	r3, r3, #2
	lsr	r1, r1, #3
	lsl	r1, r1, #2
	add	r0, r0, r1
	ldr	r1, [r0, #32]
	mov	r4, #15
	lsl	r4, r4, r3
	bic	r1, r4
	str	r1, [r0, #32]
	ldr	r1, [r0, #32]
	lsl	r2, r2, r3
	mov	r3, r2
	orr	r3, r1
	str	r3, [r0, #32]
	@ sp needed
	pop	{r4, pc}
.LFE44:
	.size	GPIO_PinAFConfig, .-GPIO_PinAFConfig
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
	.uleb128 0x14
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x1c
	.byte	0x88
	.uleb128 0x7
	.byte	0x89
	.uleb128 0x6
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
	.4byte	.LCFI3-.LFB35
	.byte	0xe
	.uleb128 0x8
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
	.byte	0x4
	.4byte	.LCFI4-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_gpio.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x100
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
	.byte	0x75
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa2
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xd9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0xee
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x11b
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x133
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x143
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x15b
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x16b
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x17c
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x191
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1a9
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1d8
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
.LASF1:
	.ascii	"GPIO_Init\000"
.LASF2:
	.ascii	"GPIO_StructInit\000"
.LASF7:
	.ascii	"GPIO_ReadOutputData\000"
.LASF10:
	.ascii	"GPIO_WriteBit\000"
.LASF9:
	.ascii	"GPIO_ResetBits\000"
.LASF12:
	.ascii	"GPIO_PinAFConfig\000"
.LASF8:
	.ascii	"GPIO_SetBits\000"
.LASF0:
	.ascii	"GPIO_DeInit\000"
.LASF6:
	.ascii	"GPIO_ReadOutputDataBit\000"
.LASF5:
	.ascii	"GPIO_ReadInputData\000"
.LASF13:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF11:
	.ascii	"GPIO_Write\000"
.LASF3:
	.ascii	"GPIO_PinLockConfig\000"
.LASF4:
	.ascii	"GPIO_ReadInputDataBit\000"
.LASF14:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_gpio.c"
	.ascii	"\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
