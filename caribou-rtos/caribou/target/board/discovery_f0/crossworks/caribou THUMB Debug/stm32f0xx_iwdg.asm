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
	.file	"stm32f0xx_iwdg.c"
	.text
.Ltext0:
	.section	.text.IWDG_WriteAccessCmd,"ax",%progbits
	.align	1
	.global	IWDG_WriteAccessCmd
	.code	16
	.thumb_func
	.type	IWDG_WriteAccessCmd, %function
IWDG_WriteAccessCmd:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_iwdg.c"
	.loc 1 146 0
.LVL0:
	.loc 1 149 0
	ldr	r3, .L2
	.loc 1 150 0
	@ sp needed
	.loc 1 149 0
	str	r0, [r3]
	.loc 1 150 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073754112
.LFE32:
	.size	IWDG_WriteAccessCmd, .-IWDG_WriteAccessCmd
	.section	.text.IWDG_SetPrescaler,"ax",%progbits
	.align	1
	.global	IWDG_SetPrescaler
	.code	16
	.thumb_func
	.type	IWDG_SetPrescaler, %function
IWDG_SetPrescaler:
.LFB33:
	.loc 1 166 0
.LVL1:
	.loc 1 169 0
	ldr	r3, .L5
	.loc 1 170 0
	@ sp needed
	.loc 1 169 0
	str	r0, [r3, #4]
	.loc 1 170 0
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073754112
.LFE33:
	.size	IWDG_SetPrescaler, .-IWDG_SetPrescaler
	.section	.text.IWDG_SetReload,"ax",%progbits
	.align	1
	.global	IWDG_SetReload
	.code	16
	.thumb_func
	.type	IWDG_SetReload, %function
IWDG_SetReload:
.LFB34:
	.loc 1 179 0
.LVL2:
	.loc 1 182 0
	ldr	r3, .L8
	.loc 1 183 0
	@ sp needed
	.loc 1 182 0
	str	r0, [r3, #8]
	.loc 1 183 0
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073754112
.LFE34:
	.size	IWDG_SetReload, .-IWDG_SetReload
	.section	.text.IWDG_ReloadCounter,"ax",%progbits
	.align	1
	.global	IWDG_ReloadCounter
	.code	16
	.thumb_func
	.type	IWDG_ReloadCounter, %function
IWDG_ReloadCounter:
.LFB35:
	.loc 1 192 0
	.loc 1 193 0
	ldr	r2, .L11
	ldr	r3, .L11+4
	.loc 1 194 0
	@ sp needed
	.loc 1 193 0
	str	r2, [r3]
	.loc 1 194 0
	bx	lr
.L12:
	.align	2
.L11:
	.word	43690
	.word	1073754112
.LFE35:
	.size	IWDG_ReloadCounter, .-IWDG_ReloadCounter
	.section	.text.IWDG_SetWindowValue,"ax",%progbits
	.align	1
	.global	IWDG_SetWindowValue
	.code	16
	.thumb_func
	.type	IWDG_SetWindowValue, %function
IWDG_SetWindowValue:
.LFB36:
	.loc 1 203 0
.LVL3:
	.loc 1 206 0
	ldr	r3, .L14
	.loc 1 207 0
	@ sp needed
	.loc 1 206 0
	str	r0, [r3, #16]
	.loc 1 207 0
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073754112
.LFE36:
	.size	IWDG_SetWindowValue, .-IWDG_SetWindowValue
	.section	.text.IWDG_Enable,"ax",%progbits
	.align	1
	.global	IWDG_Enable
	.code	16
	.thumb_func
	.type	IWDG_Enable, %function
IWDG_Enable:
.LFB37:
	.loc 1 231 0
	.loc 1 232 0
	ldr	r2, .L17
	ldr	r3, .L17+4
	.loc 1 233 0
	@ sp needed
	.loc 1 232 0
	str	r2, [r3]
	.loc 1 233 0
	bx	lr
.L18:
	.align	2
.L17:
	.word	52428
	.word	1073754112
.LFE37:
	.size	IWDG_Enable, .-IWDG_Enable
	.section	.text.IWDG_GetFlagStatus,"ax",%progbits
	.align	1
	.global	IWDG_GetFlagStatus
	.code	16
	.thumb_func
	.type	IWDG_GetFlagStatus, %function
IWDG_GetFlagStatus:
.LFB38:
	.loc 1 261 0
.LVL4:
	.loc 1 265 0
	ldr	r3, .L20
	.loc 1 275 0
	@ sp needed
	.loc 1 265 0
	ldr	r3, [r3, #12]
.LVL5:
	and	r0, r3
.LVL6:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 274 0
	uxtb	r0, r0
	.loc 1 275 0
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1e0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x1
	.4byte	.LASF28
	.4byte	.LASF29
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
	.uleb128 0x9
	.byte	0x14
	.byte	0x3
	.2byte	0x1c1
	.4byte	0xf2
	.uleb128 0xa
	.ascii	"KR\000"
	.byte	0x3
	.2byte	0x1c3
	.4byte	0x85
	.byte	0
	.uleb128 0xa
	.ascii	"PR\000"
	.byte	0x3
	.2byte	0x1c4
	.4byte	0x85
	.byte	0x4
	.uleb128 0xa
	.ascii	"RLR\000"
	.byte	0x3
	.2byte	0x1c5
	.4byte	0x85
	.byte	0x8
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x1c6
	.4byte	0x85
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x1c7
	.4byte	0x85
	.byte	0x10
	.byte	0
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x1c8
	.4byte	0xaa
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x91
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x121
	.uleb128 0xe
	.4byte	.LASF17
	.byte	0x1
	.byte	0x91
	.4byte	0x45
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0xa5
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x144
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0xa5
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb2
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x167
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0x1
	.byte	0xb2
	.4byte	0x45
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0xbf
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0xca
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19b
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0xca
	.4byte	0x45
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0xe6
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x104
	.4byte	0x9f
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x104
	.4byte	0x45
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x106
	.4byte	0x9f
	.4byte	.LLST1
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
	.uleb128 0xe
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
	.uleb128 0x5
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
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0xc
	.byte	0x70
	.sleb128 0
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
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
.LASF21:
	.ascii	"IWDG_SetWindowValue\000"
.LASF13:
	.ascii	"WINR\000"
.LASF20:
	.ascii	"Reload\000"
.LASF24:
	.ascii	"IWDG_Enable\000"
.LASF18:
	.ascii	"IWDG_Prescaler\000"
.LASF30:
	.ascii	"bitstatus\000"
.LASF16:
	.ascii	"IWDG_SetPrescaler\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"IWDG_SetReload\000"
.LASF23:
	.ascii	"IWDG_ReloadCounter\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF15:
	.ascii	"IWDG_WriteAccessCmd\000"
.LASF11:
	.ascii	"RESET\000"
.LASF28:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_iwdg.c\000"
.LASF27:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF26:
	.ascii	"IWDG_FLAG\000"
.LASF17:
	.ascii	"IWDG_WriteAccess\000"
.LASF22:
	.ascii	"WindowValue\000"
.LASF25:
	.ascii	"IWDG_GetFlagStatus\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF29:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF2:
	.ascii	"short int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF0:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"IWDG_TypeDef\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
