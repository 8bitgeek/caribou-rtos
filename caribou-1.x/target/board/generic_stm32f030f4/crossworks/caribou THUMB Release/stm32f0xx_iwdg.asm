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
	.file	"stm32f0xx_iwdg.c"
	.text
.Ltext0:
	.section	.text.IWDG_WriteAccessCmd,"ax",%progbits
	.align	2
	.global	IWDG_WriteAccessCmd
	.code	16
	.thumb_func
	.type	IWDG_WriteAccessCmd, %function
IWDG_WriteAccessCmd:
.LFB32:
	ldr	r3, .L2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073754112
.LFE32:
	.size	IWDG_WriteAccessCmd, .-IWDG_WriteAccessCmd
	.section	.text.IWDG_SetPrescaler,"ax",%progbits
	.align	2
	.global	IWDG_SetPrescaler
	.code	16
	.thumb_func
	.type	IWDG_SetPrescaler, %function
IWDG_SetPrescaler:
.LFB33:
	ldr	r3, .L5
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073754112
.LFE33:
	.size	IWDG_SetPrescaler, .-IWDG_SetPrescaler
	.section	.text.IWDG_SetReload,"ax",%progbits
	.align	2
	.global	IWDG_SetReload
	.code	16
	.thumb_func
	.type	IWDG_SetReload, %function
IWDG_SetReload:
.LFB34:
	ldr	r3, .L8
	str	r0, [r3, #8]
	@ sp needed
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073754112
.LFE34:
	.size	IWDG_SetReload, .-IWDG_SetReload
	.section	.text.IWDG_ReloadCounter,"ax",%progbits
	.align	2
	.global	IWDG_ReloadCounter
	.code	16
	.thumb_func
	.type	IWDG_ReloadCounter, %function
IWDG_ReloadCounter:
.LFB35:
	ldr	r2, .L11
	ldr	r3, .L11+4
	str	r2, [r3]
	@ sp needed
	bx	lr
.L12:
	.align	2
.L11:
	.word	43690
	.word	1073754112
.LFE35:
	.size	IWDG_ReloadCounter, .-IWDG_ReloadCounter
	.section	.text.IWDG_SetWindowValue,"ax",%progbits
	.align	2
	.global	IWDG_SetWindowValue
	.code	16
	.thumb_func
	.type	IWDG_SetWindowValue, %function
IWDG_SetWindowValue:
.LFB36:
	ldr	r3, .L14
	str	r0, [r3, #16]
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073754112
.LFE36:
	.size	IWDG_SetWindowValue, .-IWDG_SetWindowValue
	.section	.text.IWDG_Enable,"ax",%progbits
	.align	2
	.global	IWDG_Enable
	.code	16
	.thumb_func
	.type	IWDG_Enable, %function
IWDG_Enable:
.LFB37:
	ldr	r2, .L17
	ldr	r3, .L17+4
	str	r2, [r3]
	@ sp needed
	bx	lr
.L18:
	.align	2
.L17:
	.word	52428
	.word	1073754112
.LFE37:
	.size	IWDG_Enable, .-IWDG_Enable
	.section	.text.IWDG_GetFlagStatus,"ax",%progbits
	.align	2
	.global	IWDG_GetFlagStatus
	.code	16
	.thumb_func
	.type	IWDG_GetFlagStatus, %function
IWDG_GetFlagStatus:
.LFB38:
	ldr	r3, .L20
	ldr	r3, [r3, #12]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073754112
.LFE38:
	.size	IWDG_GetFlagStatus, .-IWDG_GetFlagStatus
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
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_iwdg.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x92
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF7
	.byte	0x1
	.4byte	.LASF8
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x91
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xa5
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xb2
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0xbf
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xca
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0xe6
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x104
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
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
	.4byte	0x4c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"IWDG_GetFlagStatus\000"
.LASF7:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF4:
	.ascii	"IWDG_SetWindowValue\000"
.LASF8:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_iwdg.c"
	.ascii	"\000"
.LASF2:
	.ascii	"IWDG_SetReload\000"
.LASF3:
	.ascii	"IWDG_ReloadCounter\000"
.LASF5:
	.ascii	"IWDG_Enable\000"
.LASF0:
	.ascii	"IWDG_WriteAccessCmd\000"
.LASF1:
	.ascii	"IWDG_SetPrescaler\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
