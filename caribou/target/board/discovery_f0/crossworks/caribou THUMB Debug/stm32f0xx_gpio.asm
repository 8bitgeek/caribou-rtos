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
	.file	"stm32f0xx_gpio.c"
	.text
.Ltext0:
	.section	.text.GPIO_DeInit,"ax",%progbits
	.align	1
	.global	GPIO_DeInit
	.code	16
	.thumb_func
	.type	GPIO_DeInit, %function
GPIO_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_gpio.c"
	.loc 1 118 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 122 0
	mov	r3, #144
	lsl	r3, r3, #23
	cmp	r0, r3
	bne	.L2
	.loc 1 124 0
	mov	r0, #128
.LVL1:
	lsl	r0, r0, #10
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
.LVL2:
	.loc 1 125 0
	mov	r0, #128
	lsl	r0, r0, #10
	b	.L7
.LVL3:
.L2:
	.loc 1 127 0
	ldr	r3, .L9
	cmp	r0, r3
	bne	.L4
	.loc 1 129 0
	mov	r0, #128
.LVL4:
	lsl	r0, r0, #11
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
.LVL5:
	.loc 1 130 0
	mov	r0, #128
	lsl	r0, r0, #11
	b	.L7
.LVL6:
.L4:
	.loc 1 132 0
	ldr	r3, .L9+4
	cmp	r0, r3
	bne	.L5
	.loc 1 134 0
	mov	r0, #128
.LVL7:
	lsl	r0, r0, #12
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
.LVL8:
	.loc 1 135 0
	mov	r0, #128
	lsl	r0, r0, #12
	b	.L7
.LVL9:
.L5:
	.loc 1 137 0
	ldr	r3, .L9+8
	cmp	r0, r3
	bne	.L6
	.loc 1 139 0
	mov	r0, #128
.LVL10:
	lsl	r0, r0, #13
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
.LVL11:
	.loc 1 140 0
	mov	r0, #128
	lsl	r0, r0, #13
	b	.L7
.LVL12:
.L6:
	.loc 1 144 0
	ldr	r3, .L9+12
	cmp	r0, r3
	bne	.L1
	.loc 1 146 0
	mov	r0, #128
.LVL13:
	lsl	r0, r0, #15
	mov	r1, #1
	bl	RCC_AHBPeriphResetCmd
.LVL14:
	.loc 1 147 0
	mov	r0, #128
	lsl	r0, r0, #15
.L7:
	mov	r1, #0
	bl	RCC_AHBPeriphResetCmd
.LVL15:
.L1:
	.loc 1 150 0
	@ sp needed
	pop	{r3, pc}
.L10:
	.align	2
.L9:
	.word	1207960576
	.word	1207961600
	.word	1207962624
	.word	1207964672
.LFE32:
	.size	GPIO_DeInit, .-GPIO_DeInit
	.section	.text.GPIO_Init,"ax",%progbits
	.align	1
	.global	GPIO_Init
	.code	16
	.thumb_func
	.type	GPIO_Init, %function
GPIO_Init:
.LFB33:
	.loc 1 163 0
.LVL16:
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
.LCFI1:
	.loc 1 179 0
	ldr	r3, [r1]
	str	r3, [sp, #4]
	.loc 1 174 0
	mov	r3, #0
.LVL17:
.L15:
	.loc 1 176 0
	mov	r4, #1
	.loc 1 179 0
	ldr	r2, [sp, #4]
	.loc 1 176 0
	lsl	r4, r4, r3
.LVL18:
	.loc 1 179 0
	and	r2, r4
.LVL19:
	.loc 1 181 0
	cmp	r2, r4
	bne	.L12
	.loc 1 183 0
	ldrb	r5, [r1, #4]
	sub	r4, r5, #1
.LVL20:
	cmp	r4, #1
	bhi	.L13
	.loc 1 189 0
	ldr	r7, [r0, #8]
	lsl	r4, r3, #1
	mov	r6, #3
	lsl	r6, r6, r4
	bic	r7, r6
	str	r7, [r0, #8]
	.loc 1 190 0
	ldrb	r6, [r1, #5]
	ldr	r7, [r0, #8]
	lsl	r6, r6, r4
	mov	r4, r6
	orr	r4, r7
	str	r4, [r0, #8]
	.loc 1 196 0
	ldrh	r4, [r0, #4]
	bic	r4, r2
	strh	r4, [r0, #4]
	.loc 1 197 0
	ldrb	r2, [r1, #6]
.LVL21:
	ldrh	r4, [r0, #4]
	lsl	r2, r2, r3
	orr	r2, r4
	uxth	r2, r2
	strh	r2, [r0, #4]
.L13:
	lsl	r2, r3, #1
	.loc 1 200 0
	mov	r4, #3
	ldr	r7, [r0]
	lsl	r4, r4, r2
	mvn	r4, r4
	and	r7, r4
	str	r7, [r0]
	.loc 1 202 0
	ldr	r7, [r0]
	lsl	r5, r5, r2
	orr	r5, r7
	str	r5, [r0]
	.loc 1 205 0
	ldr	r5, [r0, #12]
	and	r4, r5
	str	r4, [r0, #12]
	.loc 1 206 0
	ldrb	r5, [r1, #7]
	ldr	r4, [r0, #12]
	lsl	r5, r5, r2
	mov	r2, r5
	orr	r2, r4
	str	r2, [r0, #12]
.L12:
	.loc 1 174 0
	add	r3, r3, #1
.LVL22:
	cmp	r3, #16
	bne	.L15
	.loc 1 209 0
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
.LFE33:
	.size	GPIO_Init, .-GPIO_Init
	.section	.text.GPIO_StructInit,"ax",%progbits
	.align	1
	.global	GPIO_StructInit
	.code	16
	.thumb_func
	.type	GPIO_StructInit, %function
GPIO_StructInit:
.LFB34:
	.loc 1 218 0
.LVL23:
	.loc 1 220 0
	ldr	r3, .L17
	.loc 1 222 0
	mov	r2, #2
	.loc 1 220 0
	str	r3, [r0]
	.loc 1 221 0
	mov	r3, #0
	strb	r3, [r0, #4]
	.loc 1 222 0
	strb	r2, [r0, #5]
	.loc 1 223 0
	strb	r3, [r0, #6]
	.loc 1 224 0
	strb	r3, [r0, #7]
	.loc 1 225 0
	@ sp needed
	bx	lr
.L18:
	.align	2
.L17:
	.word	65535
.LFE34:
	.size	GPIO_StructInit, .-GPIO_StructInit
	.section	.text.GPIO_PinLockConfig,"ax",%progbits
	.align	1
	.global	GPIO_PinLockConfig
	.code	16
	.thumb_func
	.type	GPIO_PinLockConfig, %function
GPIO_PinLockConfig:
.LFB35:
	.loc 1 239 0
.LVL24:
	.loc 1 240 0
	mov	r3, #128
	.loc 1 239 0
	sub	sp, sp, #8
.LCFI2:
	.loc 1 240 0
	lsl	r3, r3, #9
	str	r3, [sp, #4]
	.loc 1 246 0
	ldr	r3, [sp, #4]
	orr	r3, r1
	str	r3, [sp, #4]
	.loc 1 248 0
	ldr	r3, [sp, #4]
	str	r3, [r0, #28]
	.loc 1 250 0
	str	r1, [r0, #28]
	.loc 1 252 0
	ldr	r3, [sp, #4]
	str	r3, [r0, #28]
	.loc 1 254 0
	ldr	r3, [r0, #28]
	str	r3, [sp, #4]
	.loc 1 256 0
	ldr	r3, [r0, #28]
	str	r3, [sp, #4]
	.loc 1 257 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.LFE35:
	.size	GPIO_PinLockConfig, .-GPIO_PinLockConfig
	.section	.text.GPIO_ReadInputDataBit,"ax",%progbits
	.align	1
	.global	GPIO_ReadInputDataBit
	.code	16
	.thumb_func
	.type	GPIO_ReadInputDataBit, %function
GPIO_ReadInputDataBit:
.LFB36:
	.loc 1 284 0
.LVL25:
	.loc 1 291 0
	ldrh	r0, [r0, #16]
.LVL26:
	.loc 1 300 0
	@ sp needed
	.loc 1 291 0
	and	r0, r1
.LVL27:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 299 0
	uxtb	r0, r0
	.loc 1 300 0
	bx	lr
.LFE36:
	.size	GPIO_ReadInputDataBit, .-GPIO_ReadInputDataBit
	.section	.text.GPIO_ReadInputData,"ax",%progbits
	.align	1
	.global	GPIO_ReadInputData
	.code	16
	.thumb_func
	.type	GPIO_ReadInputData, %function
GPIO_ReadInputData:
.LFB37:
	.loc 1 308 0
.LVL28:
	.loc 1 312 0
	ldrh	r0, [r0, #16]
.LVL29:
	.loc 1 313 0
	@ sp needed
	.loc 1 312 0
	uxth	r0, r0
	.loc 1 313 0
	bx	lr
.LFE37:
	.size	GPIO_ReadInputData, .-GPIO_ReadInputData
	.section	.text.GPIO_ReadOutputDataBit,"ax",%progbits
	.align	1
	.global	GPIO_ReadOutputDataBit
	.code	16
	.thumb_func
	.type	GPIO_ReadOutputDataBit, %function
GPIO_ReadOutputDataBit:
.LFB38:
	.loc 1 324 0
.LVL30:
	.loc 1 331 0
	ldrh	r0, [r0, #20]
.LVL31:
	.loc 1 340 0
	@ sp needed
	.loc 1 331 0
	and	r0, r1
.LVL32:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 339 0
	uxtb	r0, r0
	.loc 1 340 0
	bx	lr
.LFE38:
	.size	GPIO_ReadOutputDataBit, .-GPIO_ReadOutputDataBit
	.section	.text.GPIO_ReadOutputData,"ax",%progbits
	.align	1
	.global	GPIO_ReadOutputData
	.code	16
	.thumb_func
	.type	GPIO_ReadOutputData, %function
GPIO_ReadOutputData:
.LFB39:
	.loc 1 348 0
.LVL33:
	.loc 1 352 0
	ldrh	r0, [r0, #20]
.LVL34:
	.loc 1 353 0
	@ sp needed
	.loc 1 352 0
	uxth	r0, r0
	.loc 1 353 0
	bx	lr
.LFE39:
	.size	GPIO_ReadOutputData, .-GPIO_ReadOutputData
	.section	.text.GPIO_SetBits,"ax",%progbits
	.align	1
	.global	GPIO_SetBits
	.code	16
	.thumb_func
	.type	GPIO_SetBits, %function
GPIO_SetBits:
.LFB40:
	.loc 1 364 0
.LVL35:
	.loc 1 369 0
	str	r1, [r0, #24]
	.loc 1 370 0
	@ sp needed
	bx	lr
.LFE40:
	.size	GPIO_SetBits, .-GPIO_SetBits
	.section	.text.GPIO_ResetBits,"ax",%progbits
	.align	1
	.global	GPIO_ResetBits
	.code	16
	.thumb_func
	.type	GPIO_ResetBits, %function
GPIO_ResetBits:
.LFB41:
	.loc 1 381 0
.LVL36:
	.loc 1 386 0
	strh	r1, [r0, #40]
	.loc 1 387 0
	@ sp needed
	bx	lr
.LFE41:
	.size	GPIO_ResetBits, .-GPIO_ResetBits
	.section	.text.GPIO_WriteBit,"ax",%progbits
	.align	1
	.global	GPIO_WriteBit
	.code	16
	.thumb_func
	.type	GPIO_WriteBit, %function
GPIO_WriteBit:
.LFB42:
	.loc 1 402 0
.LVL37:
	.loc 1 408 0
	cmp	r2, #0
	beq	.L27
	.loc 1 410 0
	str	r1, [r0, #24]
	b	.L26
.L27:
	.loc 1 414 0
	strh	r1, [r0, #40]
.L26:
	.loc 1 416 0
	@ sp needed
	bx	lr
.LFE42:
	.size	GPIO_WriteBit, .-GPIO_WriteBit
	.section	.text.GPIO_Write,"ax",%progbits
	.align	1
	.global	GPIO_Write
	.code	16
	.thumb_func
	.type	GPIO_Write, %function
GPIO_Write:
.LFB43:
	.loc 1 426 0
.LVL38:
	.loc 1 430 0
	strh	r1, [r0, #20]
	.loc 1 431 0
	@ sp needed
	bx	lr
.LFE43:
	.size	GPIO_Write, .-GPIO_Write
	.section	.text.GPIO_PinAFConfig,"ax",%progbits
	.align	1
	.global	GPIO_PinAFConfig
	.code	16
	.thumb_func
	.type	GPIO_PinAFConfig, %function
GPIO_PinAFConfig:
.LFB44:
	.loc 1 473 0
.LVL39:
	.loc 1 482 0
	mov	r3, #7
	and	r3, r1
	lsr	r1, r1, #3
.LVL40:
	lsl	r1, r1, #2
	add	r0, r0, r1
.LVL41:
	.loc 1 473 0
	push	{r4, lr}
.LCFI3:
	.loc 1 483 0
	ldr	r1, [r0, #32]
	.loc 1 482 0
	lsl	r3, r3, #2
.LVL42:
	.loc 1 483 0
	mov	r4, #15
	lsl	r4, r4, r3
	bic	r1, r4
	str	r1, [r0, #32]
	.loc 1 484 0
	ldr	r1, [r0, #32]
	.loc 1 482 0
	lsl	r2, r2, r3
.LVL43:
	mov	r3, r2
	.loc 1 484 0
	orr	r3, r1
.LVL44:
	.loc 1 485 0
	str	r3, [r0, #32]
	.loc 1 486 0
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
	.uleb128 0x20
	.byte	0x80
	.uleb128 0x8
	.byte	0x81
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x6
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
	.4byte	.LCFI2-.LFB35
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
	.4byte	.LCFI3-.LFB44
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_gpio.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x651
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x1
	.4byte	.LASF75
	.4byte	.LASF76
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
	.4byte	0x5e
	.4byte	0x9a
	.uleb128 0x7
	.4byte	0x7e
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0xaf
	.uleb128 0x9
	.4byte	.LASF11
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF12
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0xe1
	.4byte	0x9a
	.uleb128 0x5
	.4byte	0x45
	.uleb128 0xa
	.byte	0x2c
	.byte	0x3
	.2byte	0x18c
	.4byte	0x17f
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x18e
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x18f
	.4byte	0xba
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x190
	.4byte	0x45
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x191
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x192
	.4byte	0x85
	.byte	0xc
	.uleb128 0xc
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x193
	.4byte	0xba
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x194
	.4byte	0x45
	.byte	0x12
	.uleb128 0xc
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x195
	.4byte	0xba
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x196
	.4byte	0x45
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x197
	.4byte	0x85
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x198
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xc
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x199
	.4byte	0x17f
	.byte	0x20
	.uleb128 0xc
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x19a
	.4byte	0xba
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x19b
	.4byte	0x45
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0x8a
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x19c
	.4byte	0xbf
	.uleb128 0x8
	.byte	0x1
	.byte	0x4
	.byte	0x3e
	.4byte	0x1b1
	.uleb128 0x9
	.4byte	.LASF25
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF26
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF27
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF28
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x4
	.byte	0x43
	.4byte	0x190
	.uleb128 0x8
	.byte	0x1
	.byte	0x4
	.byte	0x4f
	.4byte	0x1d1
	.uleb128 0x9
	.4byte	.LASF30
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF31
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0x52
	.4byte	0x1bc
	.uleb128 0x8
	.byte	0x1
	.byte	0x4
	.byte	0x5e
	.4byte	0x1f7
	.uleb128 0x9
	.4byte	.LASF33
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF34
	.sleb128 2
	.uleb128 0x9
	.4byte	.LASF35
	.sleb128 3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x4
	.byte	0x62
	.4byte	0x1dc
	.uleb128 0x8
	.byte	0x1
	.byte	0x4
	.byte	0x6e
	.4byte	0x21d
	.uleb128 0x9
	.4byte	.LASF37
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF38
	.sleb128 1
	.uleb128 0x9
	.4byte	.LASF39
	.sleb128 2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x4
	.byte	0x72
	.4byte	0x202
	.uleb128 0x8
	.byte	0x1
	.byte	0x4
	.byte	0x7e
	.4byte	0x23d
	.uleb128 0x9
	.4byte	.LASF41
	.sleb128 0
	.uleb128 0x9
	.4byte	.LASF42
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF43
	.byte	0x4
	.byte	0x81
	.4byte	0x228
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.byte	0x8b
	.4byte	0x28d
	.uleb128 0xf
	.4byte	.LASF44
	.byte	0x4
	.byte	0x8d
	.4byte	0x5e
	.byte	0
	.uleb128 0xf
	.4byte	.LASF45
	.byte	0x4
	.byte	0x90
	.4byte	0x1b1
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF46
	.byte	0x4
	.byte	0x93
	.4byte	0x1f7
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x4
	.byte	0x96
	.4byte	0x1d1
	.byte	0x6
	.uleb128 0xf
	.4byte	.LASF48
	.byte	0x4
	.byte	0x99
	.4byte	0x21d
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x4
	.byte	0x9b
	.4byte	0x248
	.uleb128 0x10
	.4byte	.LASF50
	.byte	0x1
	.byte	0x75
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34e
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.byte	0x75
	.4byte	0x34e
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LVL2
	.4byte	0x641
	.4byte	0x2d6
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x3d
	.byte	0x24
	.byte	0
	.uleb128 0x12
	.4byte	.LVL5
	.4byte	0x641
	.4byte	0x2f0
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x3e
	.byte	0x24
	.byte	0
	.uleb128 0x12
	.4byte	.LVL8
	.4byte	0x641
	.4byte	0x30a
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x3f
	.byte	0x24
	.byte	0
	.uleb128 0x12
	.4byte	.LVL11
	.4byte	0x641
	.4byte	0x324
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x40
	.byte	0x24
	.byte	0
	.uleb128 0x12
	.4byte	.LVL14
	.4byte	0x641
	.4byte	0x33e
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x42
	.byte	0x24
	.byte	0
	.uleb128 0x14
	.4byte	.LVL15
	.4byte	0x641
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x184
	.uleb128 0x10
	.4byte	.LASF51
	.byte	0x1
	.byte	0xa2
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b1
	.uleb128 0x16
	.4byte	.LASF52
	.byte	0x1
	.byte	0xa2
	.4byte	0x34e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF53
	.byte	0x1
	.byte	0xa2
	.4byte	0x3b1
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x17
	.4byte	.LASF54
	.byte	0x1
	.byte	0xa4
	.4byte	0x5e
	.4byte	.LLST1
	.uleb128 0x18
	.ascii	"pos\000"
	.byte	0x1
	.byte	0xa4
	.4byte	0x5e
	.4byte	.LLST2
	.uleb128 0x17
	.4byte	.LASF55
	.byte	0x1
	.byte	0xa4
	.4byte	0x5e
	.4byte	.LLST3
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x28d
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x1
	.byte	0xd9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3da
	.uleb128 0x16
	.4byte	.LASF53
	.byte	0x1
	.byte	0xd9
	.4byte	0x3b1
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x1
	.byte	0xee
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x418
	.uleb128 0x16
	.4byte	.LASF52
	.byte	0x1
	.byte	0xee
	.4byte	0x34e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x1
	.byte	0xee
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x19
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xf0
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x11b
	.4byte	0x2c
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x461
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x11b
	.4byte	0x34e
	.4byte	.LLST4
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x11b
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1d
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x11d
	.4byte	0x2c
	.4byte	.LLST5
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x133
	.4byte	0x45
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x48c
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x133
	.4byte	0x34e
	.4byte	.LLST6
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x143
	.4byte	0x2c
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d5
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x143
	.4byte	0x34e
	.4byte	.LLST7
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x143
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1d
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x145
	.4byte	0x2c
	.4byte	.LLST8
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x15b
	.4byte	0x45
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x500
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x15b
	.4byte	0x34e
	.4byte	.LLST9
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x16b
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x533
	.uleb128 0x1c
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x16b
	.4byte	0x34e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x16b
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x17c
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x566
	.uleb128 0x1c
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x17c
	.4byte	0x34e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x17c
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x191
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a7
	.uleb128 0x1c
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x191
	.4byte	0x34e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1c
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x191
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1c
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x191
	.4byte	0x23d
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x1a9
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5da
	.uleb128 0x1c
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x34e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1c
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x1d8
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x641
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x34e
	.4byte	.LLST10
	.uleb128 0x1b
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x45
	.4byte	.LLST11
	.uleb128 0x1b
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x2c
	.4byte	.LLST12
	.uleb128 0x1d
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x1da
	.4byte	0x5e
	.4byte	.LLST13
	.uleb128 0x1d
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x1db
	.4byte	0x5e
	.4byte	.LLST14
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x1f2
	.uleb128 0x20
	.4byte	0x5e
	.uleb128 0x20
	.4byte	0xaf
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x5
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xf
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4
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
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10
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
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0x5
	.byte	0x31
	.byte	0x73
	.sleb128 0
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LFE33
	.2byte	0x5
	.byte	0x31
	.byte	0x73
	.sleb128 -1
	.byte	0x24
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x9
	.byte	0x31
	.byte	0x73
	.sleb128 0
	.byte	0x24
	.byte	0x7d
	.sleb128 4
	.byte	0x6
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LFE33
	.2byte	0x9
	.byte	0x31
	.byte	0x73
	.sleb128 -1
	.byte	0x24
	.byte	0x7d
	.sleb128 4
	.byte	0x6
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0xa
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0x40
	.byte	0x24
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL31
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0xa
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0x40
	.byte	0x24
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL39
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL40
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL39
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL43
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL39
	.4byte	.LVL42
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LVL43
	.2byte	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x73
	.sleb128 0
	.byte	0x24
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL39
	.4byte	.LVL44
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL44
	.4byte	.LFE44
	.2byte	0x1
	.byte	0x53
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
.LASF24:
	.ascii	"GPIO_TypeDef\000"
.LASF54:
	.ascii	"pinpos\000"
.LASF44:
	.ascii	"GPIO_Pin\000"
.LASF42:
	.ascii	"Bit_SET\000"
.LASF62:
	.ascii	"GPIO_ReadOutputData\000"
.LASF29:
	.ascii	"GPIOMode_TypeDef\000"
.LASF75:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_gpio.c\000"
.LASF72:
	.ascii	"temp\000"
.LASF2:
	.ascii	"short int\000"
.LASF56:
	.ascii	"GPIO_StructInit\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF66:
	.ascii	"BitVal\000"
.LASF31:
	.ascii	"GPIO_OType_OD\000"
.LASF41:
	.ascii	"Bit_RESET\000"
.LASF65:
	.ascii	"GPIO_WriteBit\000"
.LASF32:
	.ascii	"GPIOOType_TypeDef\000"
.LASF76:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF47:
	.ascii	"GPIO_OType\000"
.LASF27:
	.ascii	"GPIO_Mode_AF\000"
.LASF63:
	.ascii	"GPIO_SetBits\000"
.LASF12:
	.ascii	"ENABLE\000"
.LASF46:
	.ascii	"GPIO_Speed\000"
.LASF51:
	.ascii	"GPIO_Init\000"
.LASF23:
	.ascii	"RESERVED3\000"
.LASF28:
	.ascii	"GPIO_Mode_AN\000"
.LASF64:
	.ascii	"GPIO_ResetBits\000"
.LASF22:
	.ascii	"LCKR\000"
.LASF73:
	.ascii	"temp_2\000"
.LASF15:
	.ascii	"OTYPER\000"
.LASF0:
	.ascii	"signed char\000"
.LASF39:
	.ascii	"GPIO_PuPd_DOWN\000"
.LASF8:
	.ascii	"long long int\000"
.LASF26:
	.ascii	"GPIO_Mode_OUT\000"
.LASF18:
	.ascii	"PUPDR\000"
.LASF25:
	.ascii	"GPIO_Mode_IN\000"
.LASF50:
	.ascii	"GPIO_DeInit\000"
.LASF21:
	.ascii	"BSRR\000"
.LASF14:
	.ascii	"MODER\000"
.LASF59:
	.ascii	"GPIO_ReadInputDataBit\000"
.LASF30:
	.ascii	"GPIO_OType_PP\000"
.LASF58:
	.ascii	"bitstatus\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF71:
	.ascii	"GPIO_AF\000"
.LASF48:
	.ascii	"GPIO_PuPd\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF49:
	.ascii	"GPIO_InitTypeDef\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF68:
	.ascii	"PortVal\000"
.LASF70:
	.ascii	"GPIO_PinSource\000"
.LASF60:
	.ascii	"GPIO_ReadInputData\000"
.LASF37:
	.ascii	"GPIO_PuPd_NOPULL\000"
.LASF77:
	.ascii	"RCC_AHBPeriphResetCmd\000"
.LASF11:
	.ascii	"DISABLE\000"
.LASF57:
	.ascii	"GPIO_PinLockConfig\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF55:
	.ascii	"currentpin\000"
.LASF67:
	.ascii	"GPIO_Write\000"
.LASF74:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF16:
	.ascii	"RESERVED0\000"
.LASF19:
	.ascii	"RESERVED1\000"
.LASF20:
	.ascii	"RESERVED2\000"
.LASF17:
	.ascii	"OSPEEDR\000"
.LASF45:
	.ascii	"GPIO_Mode\000"
.LASF43:
	.ascii	"BitAction\000"
.LASF36:
	.ascii	"GPIOSpeed_TypeDef\000"
.LASF13:
	.ascii	"FunctionalState\000"
.LASF52:
	.ascii	"GPIOx\000"
.LASF33:
	.ascii	"GPIO_Speed_Level_1\000"
.LASF34:
	.ascii	"GPIO_Speed_Level_2\000"
.LASF35:
	.ascii	"GPIO_Speed_Level_3\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF40:
	.ascii	"GPIOPuPd_TypeDef\000"
.LASF38:
	.ascii	"GPIO_PuPd_UP\000"
.LASF69:
	.ascii	"GPIO_PinAFConfig\000"
.LASF61:
	.ascii	"GPIO_ReadOutputDataBit\000"
.LASF53:
	.ascii	"GPIO_InitStruct\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
