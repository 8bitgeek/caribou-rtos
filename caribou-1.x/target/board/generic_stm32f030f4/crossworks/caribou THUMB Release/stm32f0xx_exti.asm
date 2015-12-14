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
	.file	"stm32f0xx_exti.c"
	.text
.Ltext0:
	.section	.text.EXTI_DeInit,"ax",%progbits
	.align	2
	.global	EXTI_DeInit
	.code	16
	.thumb_func
	.type	EXTI_DeInit, %function
EXTI_DeInit:
.LFB32:
	ldr	r3, .L2
	ldr	r2, .L2+4
	str	r2, [r3]
	mov	r2, #0
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	ldr	r2, .L2+8
	str	r2, [r3, #20]
	@ sp needed
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
	.align	2
	.global	EXTI_Init
	.code	16
	.thumb_func
	.type	EXTI_Init, %function
EXTI_Init:
.LFB33:
	push	{r4, lr}
.LCFI0:
	ldrb	r3, [r0, #6]
	cmp	r3, #0
	beq	.L5
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r1, [r0]
	bic	r2, r1
	str	r2, [r3]
	ldr	r2, [r3, #4]
	ldr	r4, [r0]
	bic	r2, r4
	str	r2, [r3, #4]
	ldrb	r2, [r0, #4]
	add	r2, r2, r3
	ldr	r1, [r2]
	ldr	r4, [r0]
	orr	r1, r4
	str	r1, [r2]
	ldr	r2, [r3, #8]
	ldr	r1, [r0]
	bic	r2, r1
	str	r2, [r3, #8]
	ldr	r2, [r3, #12]
	ldr	r4, [r0]
	bic	r2, r4
	str	r2, [r3, #12]
	ldrb	r3, [r0, #5]
	cmp	r3, #16
	bne	.L6
	ldr	r3, .L8
	ldr	r2, [r3, #8]
	ldr	r1, [r0]
	orr	r2, r1
	str	r2, [r3, #8]
	ldr	r1, [r3, #12]
	ldr	r2, [r0]
	orr	r2, r1
	str	r2, [r3, #12]
	b	.L4
.L6:
	ldr	r2, .L8
	add	r3, r3, r2
	ldr	r1, [r3]
	ldr	r2, [r0]
	orr	r2, r1
	str	r2, [r3]
	b	.L4
.L5:
	ldrb	r3, [r0, #4]
	ldr	r4, .L8
	add	r3, r3, r4
	ldr	r2, [r3]
	ldr	r1, [r0]
	bic	r2, r1
	str	r2, [r3]
.L4:
	@ sp needed
	pop	{r4, pc}
.L9:
	.align	2
.L8:
	.word	1073808384
.LFE33:
	.size	EXTI_Init, .-EXTI_Init
	.section	.text.EXTI_StructInit,"ax",%progbits
	.align	2
	.global	EXTI_StructInit
	.code	16
	.thumb_func
	.type	EXTI_StructInit, %function
EXTI_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	strb	r3, [r0, #4]
	mov	r2, #12
	strb	r2, [r0, #5]
	strb	r3, [r0, #6]
	@ sp needed
	bx	lr
.LFE34:
	.size	EXTI_StructInit, .-EXTI_StructInit
	.section	.text.EXTI_GenerateSWInterrupt,"ax",%progbits
	.align	2
	.global	EXTI_GenerateSWInterrupt
	.code	16
	.thumb_func
	.type	EXTI_GenerateSWInterrupt, %function
EXTI_GenerateSWInterrupt:
.LFB35:
	ldr	r3, .L12
	ldr	r2, [r3, #16]
	orr	r0, r2
	str	r0, [r3, #16]
	@ sp needed
	bx	lr
.L13:
	.align	2
.L12:
	.word	1073808384
.LFE35:
	.size	EXTI_GenerateSWInterrupt, .-EXTI_GenerateSWInterrupt
	.section	.text.EXTI_GetFlagStatus,"ax",%progbits
	.align	2
	.global	EXTI_GetFlagStatus
	.code	16
	.thumb_func
	.type	EXTI_GetFlagStatus, %function
EXTI_GetFlagStatus:
.LFB36:
	ldr	r3, .L15
	ldr	r3, [r3, #20]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073808384
.LFE36:
	.size	EXTI_GetFlagStatus, .-EXTI_GetFlagStatus
	.section	.text.EXTI_ClearFlag,"ax",%progbits
	.align	2
	.global	EXTI_ClearFlag
	.code	16
	.thumb_func
	.type	EXTI_ClearFlag, %function
EXTI_ClearFlag:
.LFB37:
	ldr	r3, .L18
	str	r0, [r3, #20]
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073808384
.LFE37:
	.size	EXTI_ClearFlag, .-EXTI_ClearFlag
	.section	.text.EXTI_GetITStatus,"ax",%progbits
	.align	2
	.global	EXTI_GetITStatus
	.code	16
	.thumb_func
	.type	EXTI_GetITStatus, %function
EXTI_GetITStatus:
.LFB38:
	ldr	r3, .L23
	ldr	r1, [r3]
	ldr	r2, [r3, #20]
	mov	r3, #0
	tst	r2, r0
	beq	.L21
	and	r0, r1
	sub	r1, r0, #1
	sbc	r0, r0, r1
	uxtb	r3, r0
.L21:
	mov	r0, r3
	@ sp needed
	bx	lr
.L24:
	.align	2
.L23:
	.word	1073808384
.LFE38:
	.size	EXTI_GetITStatus, .-EXTI_GetITStatus
	.section	.text.EXTI_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	EXTI_ClearITPendingBit
	.code	16
	.thumb_func
	.type	EXTI_ClearITPendingBit, %function
EXTI_ClearITPendingBit:
.LFB39:
	ldr	r3, .L26
	str	r0, [r3, #20]
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_exti.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa4
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
	.byte	0x6c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x81
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xc8
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xe7
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0xfe
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x10d
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x127
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
.LASF7:
	.ascii	"EXTI_ClearITPendingBit\000"
.LASF5:
	.ascii	"EXTI_ClearFlag\000"
.LASF3:
	.ascii	"EXTI_GenerateSWInterrupt\000"
.LASF8:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"EXTI_Init\000"
.LASF2:
	.ascii	"EXTI_StructInit\000"
.LASF4:
	.ascii	"EXTI_GetFlagStatus\000"
.LASF6:
	.ascii	"EXTI_GetITStatus\000"
.LASF0:
	.ascii	"EXTI_DeInit\000"
.LASF9:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_exti.c"
	.ascii	"\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
