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
	.file	"stm32f0xx_pwr.c"
	.text
.Ltext0:
	.section	.text.PWR_DeInit,"ax",%progbits
	.align	2
	.global	PWR_DeInit
	.code	16
	.thumb_func
	.type	PWR_DeInit, %function
PWR_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	mov	r4, #128
	lsl	r4, r4, #21
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	@ sp needed
	pop	{r4, pc}
.LFE32:
	.size	PWR_DeInit, .-PWR_DeInit
	.section	.text.PWR_BackupAccessCmd,"ax",%progbits
	.align	2
	.global	PWR_BackupAccessCmd
	.code	16
	.thumb_func
	.type	PWR_BackupAccessCmd, %function
PWR_BackupAccessCmd:
.LFB33:
	cmp	r0, #0
	beq	.L3
	ldr	r3, .L5
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #1
	orr	r2, r1
	str	r2, [r3]
	b	.L2
.L3:
	ldr	r3, .L5
	ldr	r1, [r3]
	ldr	r2, .L5+4
	and	r2, r1
	str	r2, [r3]
.L2:
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073770496
	.word	-257
.LFE33:
	.size	PWR_BackupAccessCmd, .-PWR_BackupAccessCmd
	.section	.text.PWR_PVDLevelConfig,"ax",%progbits
	.align	2
	.global	PWR_PVDLevelConfig
	.code	16
	.thumb_func
	.type	PWR_PVDLevelConfig, %function
PWR_PVDLevelConfig:
.LFB34:
	ldr	r3, .L8
	ldr	r2, [r3]
	mov	r1, #224
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073770496
.LFE34:
	.size	PWR_PVDLevelConfig, .-PWR_PVDLevelConfig
	.section	.text.PWR_PVDCmd,"ax",%progbits
	.align	2
	.global	PWR_PVDCmd
	.code	16
	.thumb_func
	.type	PWR_PVDCmd, %function
PWR_PVDCmd:
.LFB35:
	cmp	r0, #0
	beq	.L11
	ldr	r3, .L13
	ldr	r1, [r3]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3]
	b	.L10
.L11:
	ldr	r3, .L13
	ldr	r2, [r3]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3]
.L10:
	@ sp needed
	bx	lr
.L14:
	.align	2
.L13:
	.word	1073770496
.LFE35:
	.size	PWR_PVDCmd, .-PWR_PVDCmd
	.section	.text.PWR_WakeUpPinCmd,"ax",%progbits
	.align	2
	.global	PWR_WakeUpPinCmd
	.code	16
	.thumb_func
	.type	PWR_WakeUpPinCmd, %function
PWR_WakeUpPinCmd:
.LFB36:
	cmp	r1, #0
	beq	.L16
	ldr	r3, .L18
	ldr	r2, [r3, #4]
	orr	r0, r2
	str	r0, [r3, #4]
	b	.L15
.L16:
	ldr	r3, .L18
	ldr	r2, [r3, #4]
	bic	r2, r0
	str	r2, [r3, #4]
.L15:
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073770496
.LFE36:
	.size	PWR_WakeUpPinCmd, .-PWR_WakeUpPinCmd
	.section	.text.PWR_EnterSleepMode,"ax",%progbits
	.align	2
	.global	PWR_EnterSleepMode
	.code	16
	.thumb_func
	.type	PWR_EnterSleepMode, %function
PWR_EnterSleepMode:
.LFB37:
	ldr	r3, .L23
	ldr	r2, [r3, #16]
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3, #16]
	cmp	r0, #1
	bne	.L21
.LBB12:
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.code	16
	b	.L20
.L21:
.LBE12:
.LBB13:
@ 293 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfe
@ 0 "" 2
	.code	16
.L20:
.LBE13:
	@ sp needed
	bx	lr
.L24:
	.align	2
.L23:
	.word	-536810240
.LFE37:
	.size	PWR_EnterSleepMode, .-PWR_EnterSleepMode
	.section	.text.PWR_EnterSTOPMode,"ax",%progbits
	.align	2
	.global	PWR_EnterSTOPMode
	.code	16
	.thumb_func
	.type	PWR_EnterSTOPMode, %function
PWR_EnterSTOPMode:
.LFB38:
	push	{r4, lr}
.LCFI1:
	ldr	r3, .L28
	ldr	r2, [r3]
	mov	r4, #3
	bic	r2, r4
	orr	r0, r2
	str	r0, [r3]
	ldr	r3, .L28+4
	ldr	r0, [r3, #16]
	mov	r2, #4
	orr	r2, r0
	str	r2, [r3, #16]
	cmp	r1, #1
	bne	.L26
.LBB14:
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.code	16
	b	.L27
.L26:
.LBE14:
.LBB15:
@ 293 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfe
@ 0 "" 2
	.code	16
.L27:
.LBE15:
	ldr	r3, .L28+4
	ldr	r2, [r3, #16]
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3, #16]
	@ sp needed
	pop	{r4, pc}
.L29:
	.align	2
.L28:
	.word	1073770496
	.word	-536810240
.LFE38:
	.size	PWR_EnterSTOPMode, .-PWR_EnterSTOPMode
	.section	.text.PWR_EnterSTANDBYMode,"ax",%progbits
	.align	2
	.global	PWR_EnterSTANDBYMode
	.code	16
	.thumb_func
	.type	PWR_EnterSTANDBYMode, %function
PWR_EnterSTANDBYMode:
.LFB39:
	ldr	r3, .L31
	ldr	r1, [r3]
	mov	r2, #4
	orr	r1, r2
	str	r1, [r3]
	ldr	r0, [r3]
	mov	r1, #2
	orr	r1, r0
	str	r1, [r3]
	ldr	r3, .L31+4
	ldr	r1, [r3, #16]
	orr	r2, r1
	str	r2, [r3, #16]
.LBB16:
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.code	16
.LBE16:
	@ sp needed
	bx	lr
.L32:
	.align	2
.L31:
	.word	1073770496
	.word	-536810240
.LFE39:
	.size	PWR_EnterSTANDBYMode, .-PWR_EnterSTANDBYMode
	.section	.text.PWR_GetFlagStatus,"ax",%progbits
	.align	2
	.global	PWR_GetFlagStatus
	.code	16
	.thumb_func
	.type	PWR_GetFlagStatus, %function
PWR_GetFlagStatus:
.LFB40:
	ldr	r3, .L34
	ldr	r3, [r3, #4]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L35:
	.align	2
.L34:
	.word	1073770496
.LFE40:
	.size	PWR_GetFlagStatus, .-PWR_GetFlagStatus
	.section	.text.PWR_ClearFlag,"ax",%progbits
	.align	2
	.global	PWR_ClearFlag
	.code	16
	.thumb_func
	.type	PWR_ClearFlag, %function
PWR_ClearFlag:
.LFB41:
	ldr	r3, .L37
	ldr	r2, [r3]
	lsl	r0, r0, #2
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L38:
	.align	2
.L37:
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
	.file 1 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h"
	.file 2 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_pwr.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xdf
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.LASF14
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.2byte	0x118
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.2byte	0x123
	.byte	0x3
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x57
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x65
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x9b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0xb4
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0xe1
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x166
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x2
	.2byte	0x18e
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x2
	.2byte	0x1bd
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x1ec
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x206
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
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
	.uleb128 0x1b
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
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x2116
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
	.uleb128 0x5
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
.LASF2:
	.ascii	"PWR_DeInit\000"
.LASF5:
	.ascii	"PWR_PVDCmd\000"
.LASF10:
	.ascii	"PWR_GetFlagStatus\000"
.LASF11:
	.ascii	"PWR_ClearFlag\000"
.LASF9:
	.ascii	"PWR_EnterSTANDBYMode\000"
.LASF1:
	.ascii	"__WFE\000"
.LASF4:
	.ascii	"PWR_PVDLevelConfig\000"
.LASF14:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF8:
	.ascii	"PWR_EnterSTOPMode\000"
.LASF12:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF13:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_pwr.c\000"
.LASF6:
	.ascii	"PWR_WakeUpPinCmd\000"
.LASF0:
	.ascii	"__WFI\000"
.LASF7:
	.ascii	"PWR_EnterSleepMode\000"
.LASF3:
	.ascii	"PWR_BackupAccessCmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
