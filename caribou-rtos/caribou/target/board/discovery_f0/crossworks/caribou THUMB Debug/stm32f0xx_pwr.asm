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
	.file	"stm32f0xx_pwr.c"
	.text
.Ltext0:
	.section	.text.PWR_DeInit,"ax",%progbits
	.align	1
	.global	PWR_DeInit
	.code	16
	.thumb_func
	.type	PWR_DeInit, %function
PWR_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_pwr.c"
	.loc 1 88 0
	push	{r4, lr}
.LCFI0:
	.loc 1 89 0
	mov	r4, #128
	lsl	r4, r4, #21
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
.LVL0:
	.loc 1 90 0
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
.LVL1:
	.loc 1 91 0
	@ sp needed
	pop	{r4, pc}
.LFE32:
	.size	PWR_DeInit, .-PWR_DeInit
	.section	.text.PWR_BackupAccessCmd,"ax",%progbits
	.align	1
	.global	PWR_BackupAccessCmd
	.code	16
	.thumb_func
	.type	PWR_BackupAccessCmd, %function
PWR_BackupAccessCmd:
.LFB33:
	.loc 1 102 0
.LVL2:
	ldr	r3, .L7
	.loc 1 109 0
	ldr	r1, [r3]
	.loc 1 106 0
	cmp	r0, #0
	beq	.L3
	.loc 1 109 0
	mov	r2, #128
	lsl	r2, r2, #1
	orr	r2, r1
	b	.L5
.L3:
	.loc 1 114 0
	ldr	r2, .L7+4
	and	r2, r1
.L5:
	str	r2, [r3]
	.loc 1 116 0
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	1073770496
	.word	-257
.LFE33:
	.size	PWR_BackupAccessCmd, .-PWR_BackupAccessCmd
	.section	.text.PWR_PVDLevelConfig,"ax",%progbits
	.align	1
	.global	PWR_PVDLevelConfig
	.code	16
	.thumb_func
	.type	PWR_PVDLevelConfig, %function
PWR_PVDLevelConfig:
.LFB34:
	.loc 1 156 0
.LVL3:
	.loc 1 162 0
	ldr	r3, .L10
	.loc 1 165 0
	mov	r1, #224
	.loc 1 162 0
	ldr	r2, [r3]
.LVL4:
	.loc 1 172 0
	@ sp needed
	.loc 1 165 0
	bic	r2, r1
.LVL5:
	.loc 1 168 0
	orr	r0, r2
.LVL6:
	.loc 1 171 0
	str	r0, [r3]
	.loc 1 172 0
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073770496
.LFE34:
	.size	PWR_PVDLevelConfig, .-PWR_PVDLevelConfig
	.section	.text.PWR_PVDCmd,"ax",%progbits
	.align	1
	.global	PWR_PVDCmd
	.code	16
	.thumb_func
	.type	PWR_PVDCmd, %function
PWR_PVDCmd:
.LFB35:
	.loc 1 181 0
.LVL7:
	ldr	r3, .L16
	mov	r2, #16
	.loc 1 188 0
	ldr	r1, [r3]
	.loc 1 185 0
	cmp	r0, #0
	beq	.L13
	.loc 1 188 0
	orr	r2, r1
	b	.L15
.L13:
	.loc 1 193 0
	bic	r1, r2
	mov	r2, r1
.L15:
	str	r2, [r3]
	.loc 1 195 0
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073770496
.LFE35:
	.size	PWR_PVDCmd, .-PWR_PVDCmd
	.section	.text.PWR_WakeUpPinCmd,"ax",%progbits
	.align	1
	.global	PWR_WakeUpPinCmd
	.code	16
	.thumb_func
	.type	PWR_WakeUpPinCmd, %function
PWR_WakeUpPinCmd:
.LFB36:
	.loc 1 226 0
.LVL8:
	ldr	r3, .L21
	.loc 1 234 0
	ldr	r2, [r3, #4]
	.loc 1 231 0
	cmp	r1, #0
	beq	.L19
	.loc 1 234 0
	orr	r0, r2
.LVL9:
	str	r0, [r3, #4]
	b	.L18
.LVL10:
.L19:
	.loc 1 239 0
	bic	r2, r0
	str	r2, [r3, #4]
.LVL11:
.L18:
	.loc 1 241 0
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073770496
.LFE36:
	.size	PWR_WakeUpPinCmd, .-PWR_WakeUpPinCmd
	.section	.text.PWR_EnterSleepMode,"ax",%progbits
	.align	1
	.global	PWR_EnterSleepMode
	.code	16
	.thumb_func
	.type	PWR_EnterSleepMode, %function
PWR_EnterSleepMode:
.LFB37:
	.loc 1 359 0
.LVL12:
	.loc 1 364 0
	ldr	r3, .L26
	mov	r1, #4
	ldr	r2, [r3, #16]
	bic	r2, r1
	str	r2, [r3, #16]
	.loc 1 367 0
	cmp	r0, #1
	bne	.L24
.LBB12:
.LBB13:
	.file 2 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h"
	.loc 2 282 0
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.code	16
	b	.L23
.L24:
.LBE13:
.LBE12:
.LBB14:
.LBB15:
	.loc 2 293 0
@ 293 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfe
@ 0 "" 2
	.code	16
.L23:
.LBE15:
.LBE14:
	.loc 1 377 0
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
	.word	-536810240
.LFE37:
	.size	PWR_EnterSleepMode, .-PWR_EnterSleepMode
	.section	.text.PWR_EnterSTOPMode,"ax",%progbits
	.align	1
	.global	PWR_EnterSTOPMode
	.code	16
	.thumb_func
	.type	PWR_EnterSTOPMode, %function
PWR_EnterSTOPMode:
.LFB38:
	.loc 1 399 0
.LVL13:
	.loc 1 407 0
	ldr	r3, .L31
	.loc 1 399 0
	push	{r4, lr}
.LCFI1:
	.loc 1 407 0
	ldr	r2, [r3]
.LVL14:
	.loc 1 409 0
	mov	r4, #3
	bic	r2, r4
.LVL15:
	.loc 1 412 0
	orr	r0, r2
.LVL16:
	.loc 1 415 0
	str	r0, [r3]
	.loc 1 418 0
	ldr	r3, .L31+4
	mov	r2, #4
	ldr	r0, [r3, #16]
.LVL17:
	orr	r0, r2
	str	r0, [r3, #16]
.LVL18:
	mov	r0, r2
	.loc 1 421 0
	cmp	r1, #1
	bne	.L29
.LBB16:
.LBB17:
	.loc 2 282 0
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.code	16
	b	.L30
.L29:
.LBE17:
.LBE16:
.LBB18:
.LBB19:
	.loc 2 293 0
@ 293 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfe
@ 0 "" 2
	.code	16
.L30:
.LBE19:
.LBE18:
	.loc 1 432 0
	ldr	r2, [r3, #16]
	.loc 1 433 0
	@ sp needed
	.loc 1 432 0
	bic	r2, r0
	str	r2, [r3, #16]
	.loc 1 433 0
	pop	{r4, pc}
.L32:
	.align	2
.L31:
	.word	1073770496
	.word	-536810240
.LFE38:
	.size	PWR_EnterSTOPMode, .-PWR_EnterSTOPMode
	.section	.text.PWR_EnterSTANDBYMode,"ax",%progbits
	.align	1
	.global	PWR_EnterSTANDBYMode
	.code	16
	.thumb_func
	.type	PWR_EnterSTANDBYMode, %function
PWR_EnterSTANDBYMode:
.LFB39:
	.loc 1 446 0
	.loc 1 448 0
	ldr	r3, .L34
	mov	r2, #4
	ldr	r1, [r3]
	.loc 1 451 0
	mov	r0, #2
	.loc 1 448 0
	orr	r1, r2
	str	r1, [r3]
	.loc 1 451 0
	ldr	r1, [r3]
	orr	r1, r0
	str	r1, [r3]
	.loc 1 454 0
	ldr	r3, .L34+4
	ldr	r1, [r3, #16]
	orr	r2, r1
	str	r2, [r3, #16]
.LBB20:
.LBB21:
	.loc 2 282 0
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.code	16
.LBE21:
.LBE20:
	.loc 1 458 0
	@ sp needed
	bx	lr
.L35:
	.align	2
.L34:
	.word	1073770496
	.word	-536810240
.LFE39:
	.size	PWR_EnterSTANDBYMode, .-PWR_EnterSTANDBYMode
	.section	.text.PWR_GetFlagStatus,"ax",%progbits
	.align	1
	.global	PWR_GetFlagStatus
	.code	16
	.thumb_func
	.type	PWR_GetFlagStatus, %function
PWR_GetFlagStatus:
.LFB40:
	.loc 1 493 0
.LVL19:
	.loc 1 498 0
	ldr	r3, .L37
	.loc 1 508 0
	@ sp needed
	.loc 1 498 0
	ldr	r3, [r3, #4]
.LVL20:
	and	r0, r3
.LVL21:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL22:
	.loc 1 507 0
	uxtb	r0, r0
	.loc 1 508 0
	bx	lr
.L38:
	.align	2
.L37:
	.word	1073770496
.LFE40:
	.size	PWR_GetFlagStatus, .-PWR_GetFlagStatus
	.section	.text.PWR_ClearFlag,"ax",%progbits
	.align	1
	.global	PWR_ClearFlag
	.code	16
	.thumb_func
	.type	PWR_ClearFlag, %function
PWR_ClearFlag:
.LFB41:
	.loc 1 519 0
.LVL23:
	.loc 1 523 0
	ldr	r3, .L40
	lsl	r0, r0, #2
.LVL24:
	ldr	r2, [r3]
	.loc 1 524 0
	@ sp needed
	.loc 1 523 0
	orr	r0, r2
	str	r0, [r3]
	.loc 1 524 0
	bx	lr
.L41:
	.align	2
.L40:
	.word	1073770496
.LFE41:
	.size	PWR_ClearFlag, .-PWR_ClearFlag
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
	.byte	0x4
	.4byte	.LCFI1-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 6 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3e3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x1
	.4byte	.LASF45
	.4byte	.LASF46
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x28
	.byte	0x4
	.2byte	0x124
	.4byte	0x104
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x126
	.4byte	0x104
	.byte	0
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x127
	.4byte	0x109
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x4
	.2byte	0x128
	.4byte	0x5e
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x129
	.4byte	0x109
	.byte	0xc
	.uleb128 0x7
	.ascii	"SCR\000"
	.byte	0x4
	.2byte	0x12a
	.4byte	0x109
	.byte	0x10
	.uleb128 0x7
	.ascii	"CCR\000"
	.byte	0x4
	.2byte	0x12b
	.4byte	0x109
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x12c
	.4byte	0x5e
	.byte	0x18
	.uleb128 0x7
	.ascii	"SHP\000"
	.byte	0x4
	.2byte	0x12d
	.4byte	0x11e
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x12e
	.4byte	0x109
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	0x109
	.uleb128 0x9
	.4byte	0x5e
	.uleb128 0xa
	.4byte	0x5e
	.4byte	0x11e
	.uleb128 0xb
	.4byte	0x7e
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.4byte	0x10e
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x12f
	.4byte	0x85
	.uleb128 0xd
	.byte	0x1
	.byte	0x5
	.byte	0xdf
	.4byte	0x144
	.uleb128 0xe
	.4byte	.LASF18
	.sleb128 0
	.uleb128 0xf
	.ascii	"SET\000"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0xdf
	.4byte	0x12f
	.uleb128 0xd
	.byte	0x1
	.byte	0x5
	.byte	0xe1
	.4byte	0x164
	.uleb128 0xe
	.4byte	.LASF20
	.sleb128 0
	.uleb128 0xe
	.4byte	.LASF21
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x5
	.byte	0xe1
	.4byte	0x14f
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.2byte	0x1ce
	.4byte	0x192
	.uleb128 0x7
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x1d0
	.4byte	0x109
	.byte	0
	.uleb128 0x7
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x1d1
	.4byte	0x109
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x1d2
	.4byte	0x16f
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x118
	.byte	0x3
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x123
	.byte	0x3
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0x57
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f4
	.uleb128 0x12
	.4byte	.LVL0
	.4byte	0x3d3
	.4byte	0x1de
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
	.4byte	0x3d3
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
	.4byte	.LASF27
	.byte	0x1
	.byte	0x65
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x217
	.uleb128 0x15
	.4byte	.LASF29
	.byte	0x1
	.byte	0x65
	.4byte	0x164
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24b
	.uleb128 0x16
	.4byte	.LASF30
	.byte	0x1
	.byte	0x9b
	.4byte	0x5e
	.4byte	.LLST0
	.uleb128 0x17
	.4byte	.LASF39
	.byte	0x1
	.byte	0x9d
	.4byte	0x5e
	.4byte	.LLST1
	.byte	0
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0xb4
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26e
	.uleb128 0x15
	.4byte	.LASF29
	.byte	0x1
	.byte	0xb4
	.4byte	0x164
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.4byte	.LASF32
	.byte	0x1
	.byte	0xe1
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a0
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0xe1
	.4byte	0x5e
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.LASF29
	.byte	0x1
	.byte	0xe1
	.4byte	0x164
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x166
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e5
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x166
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	0x19e
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.2byte	0x172
	.uleb128 0x1a
	.4byte	0x1a7
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0x1
	.2byte	0x177
	.byte	0
	.uleb128 0x18
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x18e
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34a
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x18e
	.4byte	0x5e
	.4byte	.LLST3
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x18e
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1c
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x190
	.4byte	0x5e
	.4byte	.LLST4
	.uleb128 0x1a
	.4byte	0x19e
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x1
	.2byte	0x1a8
	.uleb128 0x1a
	.4byte	0x1a7
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x1
	.2byte	0x1ad
	.byte	0
	.uleb128 0x18
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x1bd
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x371
	.uleb128 0x1a
	.4byte	0x19e
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.byte	0x1
	.2byte	0x1c9
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1ec
	.4byte	0x144
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ac
	.uleb128 0x1b
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x1ec
	.4byte	0x5e
	.4byte	.LLST5
	.uleb128 0x1c
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x1ee
	.4byte	0x144
	.4byte	.LLST6
	.byte	0
	.uleb128 0x18
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x206
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d3
	.uleb128 0x1b
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x206
	.4byte	0x5e
	.4byte	.LLST7
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF48
	.byte	0x6
	.2byte	0x1f4
	.uleb128 0x1f
	.4byte	0x5e
	.uleb128 0x1f
	.4byte	0x164
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0xe
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
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
	.uleb128 0x18
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
	.uleb128 0x17
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
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
	.uleb128 0x1f
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
	.4byte	.LVL3
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL6
	.4byte	.LFE34
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL13
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL16
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x5
	.byte	0xc
	.4byte	0x40007000
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x64
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF34:
	.ascii	"PWR_EnterSleepMode\000"
.LASF40:
	.ascii	"PWR_EnterSTANDBYMode\000"
.LASF43:
	.ascii	"PWR_ClearFlag\000"
.LASF33:
	.ascii	"PWR_WakeUpPin\000"
.LASF45:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_pwr.c\000"
.LASF26:
	.ascii	"PWR_DeInit\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF22:
	.ascii	"FunctionalState\000"
.LASF13:
	.ascii	"RESERVED0\000"
.LASF37:
	.ascii	"PWR_Regulator\000"
.LASF30:
	.ascii	"PWR_PVDLevel\000"
.LASF41:
	.ascii	"PWR_FLAG\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"FlagStatus\000"
.LASF18:
	.ascii	"RESET\000"
.LASF0:
	.ascii	"signed char\000"
.LASF44:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF23:
	.ascii	"PWR_TypeDef\000"
.LASF31:
	.ascii	"PWR_PVDCmd\000"
.LASF12:
	.ascii	"ICSR\000"
.LASF17:
	.ascii	"SCB_Type\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF14:
	.ascii	"AIRCR\000"
.LASF35:
	.ascii	"PWR_SLEEPEntry\000"
.LASF46:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF11:
	.ascii	"CPUID\000"
.LASF28:
	.ascii	"PWR_PVDLevelConfig\000"
.LASF25:
	.ascii	"__WFE\000"
.LASF2:
	.ascii	"short int\000"
.LASF39:
	.ascii	"tmpreg\000"
.LASF29:
	.ascii	"NewState\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF47:
	.ascii	"PWR_GetFlagStatus\000"
.LASF16:
	.ascii	"SHCSR\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF24:
	.ascii	"__WFI\000"
.LASF36:
	.ascii	"PWR_EnterSTOPMode\000"
.LASF20:
	.ascii	"DISABLE\000"
.LASF48:
	.ascii	"RCC_APB1PeriphResetCmd\000"
.LASF38:
	.ascii	"PWR_STOPEntry\000"
.LASF15:
	.ascii	"RESERVED1\000"
.LASF42:
	.ascii	"bitstatus\000"
.LASF27:
	.ascii	"PWR_BackupAccessCmd\000"
.LASF21:
	.ascii	"ENABLE\000"
.LASF32:
	.ascii	"PWR_WakeUpPinCmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
