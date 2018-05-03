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
	.file	"stm32f0xx_wwdg.c"
	.text
.Ltext0:
	.section	.text.WWDG_DeInit,"ax",%progbits
	.align	1
	.global	WWDG_DeInit
	.code	16
	.thumb_func
	.type	WWDG_DeInit, %function
WWDG_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_wwdg.c"
	.loc 1 133 0
	push	{r4, lr}
.LCFI0:
	.loc 1 134 0
	mov	r4, #128
	lsl	r4, r4, #4
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
.LVL0:
	.loc 1 135 0
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
.LVL1:
	.loc 1 136 0
	@ sp needed
	pop	{r4, pc}
.LFE32:
	.size	WWDG_DeInit, .-WWDG_DeInit
	.section	.text.WWDG_SetPrescaler,"ax",%progbits
	.align	1
	.global	WWDG_SetPrescaler
	.code	16
	.thumb_func
	.type	WWDG_SetPrescaler, %function
WWDG_SetPrescaler:
.LFB33:
	.loc 1 149 0
.LVL2:
	.loc 1 154 0
	ldr	r3, .L3
	ldr	r2, .L3+4
	ldr	r1, [r3, #4]
	.loc 1 159 0
	@ sp needed
	.loc 1 154 0
	and	r2, r1
.LVL3:
	.loc 1 156 0
	orr	r0, r2
.LVL4:
	.loc 1 158 0
	str	r0, [r3, #4]
	.loc 1 159 0
	bx	lr
.L4:
	.align	2
.L3:
	.word	1073753088
	.word	-385
.LFE33:
	.size	WWDG_SetPrescaler, .-WWDG_SetPrescaler
	.section	.text.WWDG_SetWindowValue,"ax",%progbits
	.align	1
	.global	WWDG_SetWindowValue
	.code	16
	.thumb_func
	.type	WWDG_SetWindowValue, %function
WWDG_SetWindowValue:
.LFB34:
	.loc 1 168 0
.LVL5:
	sub	sp, sp, #8
.LCFI1:
	.loc 1 169 0
	mov	r3, #0
	str	r3, [sp, #4]
	.loc 1 175 0
	ldr	r3, .L6
	mov	r2, #127
	ldr	r1, [r3, #4]
	bic	r1, r2
	str	r1, [sp, #4]
	.loc 1 178 0
	ldr	r1, [sp, #4]
	and	r2, r0
	orr	r2, r1
	str	r2, [sp, #4]
	.loc 1 181 0
	ldr	r2, [sp, #4]
	str	r2, [r3, #4]
	.loc 1 182 0
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
	.align	1
	.global	WWDG_EnableIT
	.code	16
	.thumb_func
	.type	WWDG_EnableIT, %function
WWDG_EnableIT:
.LFB35:
	.loc 1 191 0
	.loc 1 192 0
	ldr	r3, .L9
	mov	r2, #128
	ldr	r1, [r3, #4]
	lsl	r2, r2, #2
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 193 0
	@ sp needed
	bx	lr
.L10:
	.align	2
.L9:
	.word	1073753088
.LFE35:
	.size	WWDG_EnableIT, .-WWDG_EnableIT
	.section	.text.WWDG_SetCounter,"ax",%progbits
	.align	1
	.global	WWDG_SetCounter
	.code	16
	.thumb_func
	.type	WWDG_SetCounter, %function
WWDG_SetCounter:
.LFB36:
	.loc 1 203 0
.LVL6:
	.loc 1 208 0
	mov	r3, #127
	and	r0, r3
.LVL7:
	ldr	r3, .L12
	.loc 1 209 0
	@ sp needed
	.loc 1 208 0
	str	r0, [r3]
	.loc 1 209 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	1073753088
.LFE36:
	.size	WWDG_SetCounter, .-WWDG_SetCounter
	.section	.text.WWDG_Enable,"ax",%progbits
	.align	1
	.global	WWDG_Enable
	.code	16
	.thumb_func
	.type	WWDG_Enable, %function
WWDG_Enable:
.LFB37:
	.loc 1 235 0
.LVL8:
	.loc 1 238 0
	mov	r3, #128
	orr	r0, r3
.LVL9:
	ldr	r3, .L15
	.loc 1 239 0
	@ sp needed
	.loc 1 238 0
	str	r0, [r3]
	.loc 1 239 0
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073753088
.LFE37:
	.size	WWDG_Enable, .-WWDG_Enable
	.section	.text.WWDG_GetFlagStatus,"ax",%progbits
	.align	1
	.global	WWDG_GetFlagStatus
	.code	16
	.thumb_func
	.type	WWDG_GetFlagStatus, %function
WWDG_GetFlagStatus:
.LFB38:
	.loc 1 263 0
.LVL10:
	.loc 1 266 0
	ldr	r3, .L18
	.loc 1 275 0
	@ sp needed
	.loc 1 266 0
	ldr	r0, [r3, #8]
.LVL11:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL12:
	.loc 1 274 0
	uxtb	r0, r0
	.loc 1 275 0
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073753088
.LFE38:
	.size	WWDG_GetFlagStatus, .-WWDG_GetFlagStatus
	.section	.text.WWDG_ClearFlag,"ax",%progbits
	.align	1
	.global	WWDG_ClearFlag
	.code	16
	.thumb_func
	.type	WWDG_ClearFlag, %function
WWDG_ClearFlag:
.LFB39:
	.loc 1 283 0
	.loc 1 284 0
	ldr	r3, .L21
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 285 0
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x256
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.LASF31
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
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0xbf
	.uleb128 0x7
	.4byte	.LASF13
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF14
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0xe1
	.4byte	0xaa
	.uleb128 0x9
	.byte	0xc
	.byte	0x3
	.2byte	0x283
	.4byte	0xf9
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x285
	.4byte	0x85
	.byte	0
	.uleb128 0xa
	.ascii	"CFR\000"
	.byte	0x3
	.2byte	0x286
	.4byte	0x85
	.byte	0x4
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x287
	.4byte	0x85
	.byte	0x8
	.byte	0
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x288
	.4byte	0xca
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x84
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x149
	.uleb128 0xd
	.4byte	.LVL0
	.4byte	0x246
	.4byte	0x133
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0xf
	.4byte	.LVL1
	.4byte	0x246
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x94
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17d
	.uleb128 0x10
	.4byte	.LASF20
	.byte	0x1
	.byte	0x94
	.4byte	0x5e
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x96
	.4byte	0x5e
	.4byte	.LLST1
	.byte	0
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa7
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ae
	.uleb128 0x12
	.4byte	.LASF21
	.byte	0x1
	.byte	0xa7
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x13
	.4byte	.LASF22
	.byte	0x1
	.byte	0xa9
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x14
	.4byte	.LASF27
	.byte	0x1
	.byte	0xbe
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x1
	.byte	0xca
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e4
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0xca
	.4byte	0x2c
	.4byte	.LLST2
	.byte	0
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x1
	.byte	0xea
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x209
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0xea
	.4byte	0x2c
	.4byte	.LLST3
	.byte	0
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x106
	.4byte	0x9f
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x234
	.uleb128 0x16
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x108
	.4byte	0x9f
	.4byte	.LLST4
	.byte	0
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x11a
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x1f4
	.uleb128 0x19
	.4byte	0x5e
	.uleb128 0x19
	.4byte	0xbf
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4
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
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x30
	.byte	0x2e
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
.LASF30:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../chip/stm32/stm32f030/lib/src/stm32f0"
	.ascii	"xx_wwdg.c\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF26:
	.ascii	"bitstatus\000"
.LASF25:
	.ascii	"WWDG_Enable\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF0:
	.ascii	"signed char\000"
.LASF27:
	.ascii	"WWDG_EnableIT\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF32:
	.ascii	"WWDG_GetFlagStatus\000"
.LASF11:
	.ascii	"RESET\000"
.LASF29:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF21:
	.ascii	"WindowValue\000"
.LASF24:
	.ascii	"Counter\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF18:
	.ascii	"WWDG_SetPrescaler\000"
.LASF23:
	.ascii	"WWDG_SetCounter\000"
.LASF20:
	.ascii	"WWDG_Prescaler\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF16:
	.ascii	"WWDG_TypeDef\000"
.LASF2:
	.ascii	"short int\000"
.LASF22:
	.ascii	"tmpreg\000"
.LASF31:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF19:
	.ascii	"WWDG_SetWindowValue\000"
.LASF17:
	.ascii	"WWDG_DeInit\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF28:
	.ascii	"WWDG_ClearFlag\000"
.LASF13:
	.ascii	"DISABLE\000"
.LASF33:
	.ascii	"RCC_APB1PeriphResetCmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
