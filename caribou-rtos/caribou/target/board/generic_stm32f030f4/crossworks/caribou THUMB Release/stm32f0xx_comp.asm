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
	.file	"stm32f0xx_comp.c"
	.text
.Ltext0:
	.section	.text.COMP_DeInit,"ax",%progbits
	.align	2
	.global	COMP_DeInit
	.code	16
	.thumb_func
	.type	COMP_DeInit, %function
COMP_DeInit:
.LFB32:
	mov	r2, #0
	ldr	r3, .L2
	str	r2, [r3]
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073807388
.LFE32:
	.size	COMP_DeInit, .-COMP_DeInit
	.section	.text.COMP_Init,"ax",%progbits
	.align	2
	.global	COMP_Init
	.code	16
	.thumb_func
	.type	COMP_Init, %function
COMP_Init:
.LFB33:
	push	{r4, r5, lr}
.LCFI0:
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r4, .L5+4
	lsl	r4, r4, r0
	bic	r2, r4
	ldr	r5, [r1, #4]
	ldr	r4, [r1]
	orr	r5, r4
	ldr	r4, [r1, #8]
	orr	r5, r4
	ldr	r4, [r1, #12]
	orr	r5, r4
	ldr	r4, [r1, #16]
	mov	r1, r5
	orr	r1, r4
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	pop	{r4, r5, pc}
.L6:
	.align	2
.L5:
	.word	1073807388
	.word	16382
.LFE33:
	.size	COMP_Init, .-COMP_Init
	.section	.text.COMP_StructInit,"ax",%progbits
	.align	2
	.global	COMP_StructInit
	.code	16
	.thumb_func
	.type	COMP_StructInit, %function
COMP_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	mov	r3, #12
	str	r3, [r0, #16]
	@ sp needed
	bx	lr
.LFE34:
	.size	COMP_StructInit, .-COMP_StructInit
	.section	.text.COMP_Cmd,"ax",%progbits
	.align	2
	.global	COMP_Cmd
	.code	16
	.thumb_func
	.type	COMP_Cmd, %function
COMP_Cmd:
.LFB35:
	cmp	r1, #0
	beq	.L9
	ldr	r3, .L11
	ldr	r2, [r3]
	mov	r1, #1
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	b	.L8
.L9:
	ldr	r3, .L11
	ldr	r2, [r3]
	mov	r1, #1
	lsl	r1, r1, r0
	bic	r2, r1
	str	r2, [r3]
.L8:
	@ sp needed
	bx	lr
.L12:
	.align	2
.L11:
	.word	1073807388
.LFE35:
	.size	COMP_Cmd, .-COMP_Cmd
	.section	.text.COMP_SwitchCmd,"ax",%progbits
	.align	2
	.global	COMP_SwitchCmd
	.code	16
	.thumb_func
	.type	COMP_SwitchCmd, %function
COMP_SwitchCmd:
.LFB36:
	cmp	r0, #0
	beq	.L14
	ldr	r3, .L16
	ldr	r1, [r3]
	mov	r2, #2
	orr	r2, r1
	str	r2, [r3]
	b	.L13
.L14:
	ldr	r3, .L16
	ldr	r2, [r3]
	mov	r1, #2
	bic	r2, r1
	str	r2, [r3]
.L13:
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073807388
.LFE36:
	.size	COMP_SwitchCmd, .-COMP_SwitchCmd
	.section	.text.COMP_GetOutputLevel,"ax",%progbits
	.align	2
	.global	COMP_GetOutputLevel
	.code	16
	.thumb_func
	.type	COMP_GetOutputLevel, %function
COMP_GetOutputLevel:
.LFB37:
	ldr	r3, .L21
	ldr	r3, [r3]
	mov	r2, #128
	lsl	r2, r2, #7
	lsl	r2, r2, r0
	mov	r0, r2
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	lsl	r0, r0, #14
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073807388
.LFE37:
	.size	COMP_GetOutputLevel, .-COMP_GetOutputLevel
	.section	.text.COMP_WindowCmd,"ax",%progbits
	.align	2
	.global	COMP_WindowCmd
	.code	16
	.thumb_func
	.type	COMP_WindowCmd, %function
COMP_WindowCmd:
.LFB38:
	cmp	r0, #0
	beq	.L24
	ldr	r3, .L26
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #16
	orr	r2, r1
	str	r2, [r3]
	b	.L23
.L24:
	ldr	r3, .L26
	ldr	r1, [r3]
	ldr	r2, .L26+4
	and	r2, r1
	str	r2, [r3]
.L23:
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073807388
	.word	-8388609
.LFE38:
	.size	COMP_WindowCmd, .-COMP_WindowCmd
	.section	.text.COMP_LockConfig,"ax",%progbits
	.align	2
	.global	COMP_LockConfig
	.code	16
	.thumb_func
	.type	COMP_LockConfig, %function
COMP_LockConfig:
.LFB39:
	ldr	r3, .L29
	ldr	r2, [r3]
	mov	r1, #128
	lsl	r1, r1, #8
	lsl	r1, r1, r0
	mov	r0, r1
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_comp.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa5
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
	.byte	0x8e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa3
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xff
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x124
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x153
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x180
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
.LASF3:
	.ascii	"COMP_Cmd\000"
.LASF1:
	.ascii	"COMP_Init\000"
.LASF5:
	.ascii	"COMP_GetOutputLevel\000"
.LASF4:
	.ascii	"COMP_SwitchCmd\000"
.LASF9:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_comp.c"
	.ascii	"\000"
.LASF7:
	.ascii	"COMP_LockConfig\000"
.LASF8:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF2:
	.ascii	"COMP_StructInit\000"
.LASF6:
	.ascii	"COMP_WindowCmd\000"
.LASF0:
	.ascii	"COMP_DeInit\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
