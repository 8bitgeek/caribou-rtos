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
	.file	"stm32f0xx_wwdg.c"
	.text
.Ltext0:
	.section	.text.WWDG_DeInit,"ax",%progbits
	.align	2
	.global	WWDG_DeInit
	.code	16
	.thumb_func
	.type	WWDG_DeInit, %function
WWDG_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	mov	r4, #128
	lsl	r4, r4, #4
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	@ sp needed
	pop	{r4, pc}
.LFE32:
	.size	WWDG_DeInit, .-WWDG_DeInit
	.section	.text.WWDG_SetPrescaler,"ax",%progbits
	.align	2
	.global	WWDG_SetPrescaler
	.code	16
	.thumb_func
	.type	WWDG_SetPrescaler, %function
WWDG_SetPrescaler:
.LFB33:
	ldr	r3, .L3
	ldr	r1, [r3, #4]
	ldr	r2, .L3+4
	and	r2, r1
	orr	r0, r2
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L4:
	.align	2
.L3:
	.word	1073753088
	.word	-385
.LFE33:
	.size	WWDG_SetPrescaler, .-WWDG_SetPrescaler
	.section	.text.WWDG_SetWindowValue,"ax",%progbits
	.align	2
	.global	WWDG_SetWindowValue
	.code	16
	.thumb_func
	.type	WWDG_SetWindowValue, %function
WWDG_SetWindowValue:
.LFB34:
	sub	sp, sp, #8
.LCFI1:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L6
	ldr	r2, [r3, #4]
	mov	r1, #127
	bic	r2, r1
	str	r2, [sp, #4]
	ldr	r2, [sp, #4]
	and	r0, r1
	orr	r0, r2
	str	r0, [sp, #4]
	ldr	r2, [sp, #4]
	str	r2, [r3, #4]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L7:
	.align	2
.L6:
	.word	1073753088
.LFE34:
	.size	WWDG_SetWindowValue, .-WWDG_SetWindowValue
	.section	.text.WWDG_EnableIT,"ax",%progbits
	.align	2
	.global	WWDG_EnableIT
	.code	16
	.thumb_func
	.type	WWDG_EnableIT, %function
WWDG_EnableIT:
.LFB35:
	ldr	r3, .L9
	ldr	r1, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #2
	orr	r2, r1
	str	r2, [r3, #4]
	@ sp needed
	bx	lr
.L10:
	.align	2
.L9:
	.word	1073753088
.LFE35:
	.size	WWDG_EnableIT, .-WWDG_EnableIT
	.section	.text.WWDG_SetCounter,"ax",%progbits
	.align	2
	.global	WWDG_SetCounter
	.code	16
	.thumb_func
	.type	WWDG_SetCounter, %function
WWDG_SetCounter:
.LFB36:
	mov	r3, #127
	and	r0, r3
	ldr	r3, .L12
	str	r0, [r3]
	@ sp needed
	bx	lr
.L13:
	.align	2
.L12:
	.word	1073753088
.LFE36:
	.size	WWDG_SetCounter, .-WWDG_SetCounter
	.section	.text.WWDG_Enable,"ax",%progbits
	.align	2
	.global	WWDG_Enable
	.code	16
	.thumb_func
	.type	WWDG_Enable, %function
WWDG_Enable:
.LFB37:
	mov	r3, #128
	orr	r0, r3
	ldr	r3, .L15
	str	r0, [r3]
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073753088
.LFE37:
	.size	WWDG_Enable, .-WWDG_Enable
	.section	.text.WWDG_GetFlagStatus,"ax",%progbits
	.align	2
	.global	WWDG_GetFlagStatus
	.code	16
	.thumb_func
	.type	WWDG_GetFlagStatus, %function
WWDG_GetFlagStatus:
.LFB38:
	ldr	r3, .L18
	ldr	r0, [r3, #8]
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073753088
.LFE38:
	.size	WWDG_GetFlagStatus, .-WWDG_GetFlagStatus
	.section	.text.WWDG_ClearFlag,"ax",%progbits
	.align	2
	.global	WWDG_ClearFlag
	.code	16
	.thumb_func
	.type	WWDG_ClearFlag, %function
WWDG_ClearFlag:
.LFB39:
	mov	r2, #0
	ldr	r3, .L21
	str	r2, [r3, #8]
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073753088
.LFE39:
	.size	WWDG_ClearFlag, .-WWDG_ClearFlag
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
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI1-.LFB34
	.byte	0xe
	.uleb128 0x8
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_wwdg.c"
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
	.byte	0x84
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x94
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xa7
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0xbe
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0xca
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0xea
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x106
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x11a
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
	.ascii	"WWDG_EnableIT\000"
.LASF2:
	.ascii	"WWDG_SetWindowValue\000"
.LASF1:
	.ascii	"WWDG_SetPrescaler\000"
.LASF7:
	.ascii	"WWDG_ClearFlag\000"
.LASF8:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF9:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_wwdg.c"
	.ascii	"\000"
.LASF5:
	.ascii	"WWDG_Enable\000"
.LASF0:
	.ascii	"WWDG_DeInit\000"
.LASF4:
	.ascii	"WWDG_SetCounter\000"
.LASF6:
	.ascii	"WWDG_GetFlagStatus\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
