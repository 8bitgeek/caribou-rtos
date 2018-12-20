	.syntax unified
	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_pwr.c"
	.loc 1 88 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 89 0
	movs	r3, #128
	lsls	r3, r3, #21
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 90 0
	movs	r3, #128
	lsls	r3, r3, #21
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 91 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 102 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #8
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 106 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L3
	.loc 1 109 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 116 0
	b	.L5
.L3:
	.loc 1 114 0
	ldr	r3, .L6
	ldr	r2, .L6
	ldr	r2, [r2]
	ldr	r1, .L6+4
	ands	r2, r1
	str	r2, [r3]
.L5:
	.loc 1 116 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
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
	.loc 1 156 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #16
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	.loc 1 157 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 162 0
	ldr	r3, .L9
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 165 0
	ldr	r3, [r7, #12]
	movs	r2, #224
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 168 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 171 0
	ldr	r3, .L9
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 172 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
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
	.loc 1 181 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #8
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 185 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L12
	.loc 1 188 0
	ldr	r3, .L15
	ldr	r2, .L15
	ldr	r2, [r2]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 195 0
	b	.L14
.L12:
	.loc 1 193 0
	ldr	r3, .L15
	ldr	r2, .L15
	ldr	r2, [r2]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3]
.L14:
	.loc 1 195 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L16:
	.align	2
.L15:
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
	.loc 1 226 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #8
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 231 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L18
	.loc 1 234 0
	ldr	r3, .L21
	ldr	r2, .L21
	ldr	r1, [r2, #4]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 241 0
	b	.L20
.L18:
	.loc 1 239 0
	ldr	r3, .L21
	ldr	r2, .L21
	ldr	r2, [r2, #4]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #4]
.L20:
	.loc 1 241 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
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
	.loc 1 359 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 364 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #16]
	movs	r1, #4
	bics	r2, r1
	str	r2, [r3, #16]
	.loc 1 367 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #1
	bne	.L24
.LBB12:
.LBB13:
	.file 2 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h"
	.loc 2 282 0
	.syntax divided
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
.LBE13:
.LBE12:
	.loc 1 377 0
	b	.L26
.L24:
.LBB14:
.LBB15:
	.loc 2 293 0
	.syntax divided
@ 293 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L26:
.LBE15:
.LBE14:
	.loc 1 377 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L28:
	.align	2
.L27:
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
	.loc 1 399 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 400 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 407 0
	ldr	r3, .L32
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 409 0
	ldr	r3, [r7, #12]
	movs	r2, #3
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 412 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 415 0
	ldr	r3, .L32
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 418 0
	ldr	r3, .L32+4
	ldr	r2, .L32+4
	ldr	r2, [r2, #16]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 421 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #1
	bne	.L30
.LBB16:
.LBB17:
	.loc 2 282 0
	.syntax divided
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
.LBE17:
.LBE16:
	b	.L31
.L30:
.LBB18:
.LBB19:
	.loc 2 293 0
	.syntax divided
@ 293 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfe
@ 0 "" 2
	.thumb
	.syntax unified
.L31:
.LBE19:
.LBE18:
	.loc 1 432 0
	ldr	r3, .L32+4
	ldr	r2, .L32+4
	ldr	r2, [r2, #16]
	movs	r1, #4
	bics	r2, r1
	str	r2, [r3, #16]
	.loc 1 433 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
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
	.loc 1 446 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	add	r7, sp, #0
.LCFI21:
	.loc 1 448 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r2, [r2]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 451 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r2, [r2]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 454 0
	ldr	r3, .L35+4
	ldr	r2, .L35+4
	ldr	r2, [r2, #16]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #16]
.LBB20:
.LBB21:
	.loc 2 282 0
	.syntax divided
@ 282 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h" 1
	wfi
@ 0 "" 2
	.thumb
	.syntax unified
.LBE21:
.LBE20:
	.loc 1 458 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
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
	.loc 1 493 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI22:
	sub	sp, sp, #16
.LCFI23:
	add	r7, sp, #0
.LCFI24:
	str	r0, [r7, #4]
	.loc 1 494 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 498 0
	ldr	r3, .L41
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L38
	.loc 1 500 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L39
.L38:
	.loc 1 504 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L39:
	.loc 1 507 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 508 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
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
	.loc 1 519 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI25:
	sub	sp, sp, #8
.LCFI26:
	add	r7, sp, #0
.LCFI27:
	str	r0, [r7, #4]
	.loc 1 523 0
	ldr	r3, .L44
	ldr	r2, .L44
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	lsls	r2, r2, #2
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 524 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
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
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI2-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI5-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI8-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI11-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI14-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI17-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI20-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI22-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI25-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x39e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0xc
	.4byte	.LASF43
	.4byte	.LASF44
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
	.4byte	0x5e
	.uleb128 0x6
	.byte	0x28
	.byte	0x4
	.2byte	0x124
	.4byte	0x109
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x4
	.2byte	0x126
	.4byte	0x109
	.byte	0
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x127
	.4byte	0x85
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x4
	.2byte	0x128
	.4byte	0x5e
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x129
	.4byte	0x85
	.byte	0xc
	.uleb128 0x8
	.ascii	"SCR\000"
	.byte	0x4
	.2byte	0x12a
	.4byte	0x85
	.byte	0x10
	.uleb128 0x8
	.ascii	"CCR\000"
	.byte	0x4
	.2byte	0x12b
	.4byte	0x85
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x12c
	.4byte	0x5e
	.byte	0x18
	.uleb128 0x8
	.ascii	"SHP\000"
	.byte	0x4
	.2byte	0x12d
	.4byte	0x11e
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x12e
	.4byte	0x85
	.byte	0x24
	.byte	0
	.uleb128 0x9
	.4byte	0x85
	.uleb128 0xa
	.4byte	0x85
	.4byte	0x11e
	.uleb128 0xb
	.4byte	0x7e
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x10e
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x12f
	.4byte	0x8a
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0xdf
	.4byte	0x148
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0
	.uleb128 0xf
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x5
	.byte	0xdf
	.4byte	0x12f
	.uleb128 0xd
	.byte	0x1
	.4byte	0x37
	.byte	0x5
	.byte	0xe1
	.4byte	0x16c
	.uleb128 0xe
	.4byte	.LASF20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x5
	.byte	0xe1
	.4byte	0x153
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.2byte	0x1ce
	.4byte	0x19a
	.uleb128 0x8
	.ascii	"CR\000"
	.byte	0x5
	.2byte	0x1d0
	.4byte	0x85
	.byte	0
	.uleb128 0x8
	.ascii	"CSR\000"
	.byte	0x5
	.2byte	0x1d1
	.4byte	0x85
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x1d2
	.4byte	0x177
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
	.4byte	.LASF45
	.byte	0x1
	.byte	0x57
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x1
	.byte	0x65
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ed
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0x65
	.4byte	0x16c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21f
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x1
	.byte	0x9b
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x1
	.byte	0x9d
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.byte	0xb4
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x243
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0xb4
	.4byte	0x16c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x1
	.byte	0xe1
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x275
	.uleb128 0x13
	.4byte	.LASF32
	.byte	0x1
	.byte	0xe1
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0xe1
	.4byte	0x16c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x166
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2bb
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x166
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.4byte	0x1a6
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.2byte	0x172
	.uleb128 0x17
	.4byte	0x1af
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0x1
	.2byte	0x177
	.byte	0
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x18e
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31f
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x18e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x18e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x18
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x190
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	0x1a6
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x1
	.2byte	0x1a8
	.uleb128 0x17
	.4byte	0x1af
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x1
	.2byte	0x1ad
	.byte	0
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1bd
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x346
	.uleb128 0x17
	.4byte	0x1a6
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.byte	0x1
	.2byte	0x1c9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1ec
	.4byte	0x148
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x37f
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x1ec
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x1ee
	.4byte	0x148
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x206
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x206
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x2134
	.uleb128 0x19
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x26
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.section	.debug_pubnames,"",%progbits
	.4byte	0x11b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3a2
	.4byte	0x13b
	.ascii	"RESET\000"
	.4byte	0x141
	.ascii	"SET\000"
	.4byte	0x15f
	.ascii	"DISABLE\000"
	.4byte	0x165
	.ascii	"ENABLE\000"
	.4byte	0x1a6
	.ascii	"__WFI\000"
	.4byte	0x1af
	.ascii	"__WFE\000"
	.4byte	0x1b8
	.ascii	"PWR_DeInit\000"
	.4byte	0x1c9
	.ascii	"PWR_BackupAccessCmd\000"
	.4byte	0x1ed
	.ascii	"PWR_PVDLevelConfig\000"
	.4byte	0x21f
	.ascii	"PWR_PVDCmd\000"
	.4byte	0x243
	.ascii	"PWR_WakeUpPinCmd\000"
	.4byte	0x275
	.ascii	"PWR_EnterSleepMode\000"
	.4byte	0x2bb
	.ascii	"PWR_EnterSTOPMode\000"
	.4byte	0x31f
	.ascii	"PWR_EnterSTANDBYMode\000"
	.4byte	0x346
	.ascii	"PWR_GetFlagStatus\000"
	.4byte	0x37f
	.ascii	"PWR_ClearFlag\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x10e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x3a2
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x50
	.ascii	"short unsigned int\000"
	.4byte	0x45
	.ascii	"uint16_t\000"
	.4byte	0x57
	.ascii	"int\000"
	.4byte	0x69
	.ascii	"unsigned int\000"
	.4byte	0x5e
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x7e
	.ascii	"sizetype\000"
	.4byte	0x123
	.ascii	"SCB_Type\000"
	.4byte	0x148
	.ascii	"FlagStatus\000"
	.4byte	0x16c
	.ascii	"FunctionalState\000"
	.4byte	0x19a
	.ascii	"PWR_TypeDef\000"
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
.LASF33:
	.ascii	"PWR_EnterSleepMode\000"
.LASF39:
	.ascii	"PWR_EnterSTANDBYMode\000"
.LASF43:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_pwr.c\000"
.LASF47:
	.ascii	"PWR_ClearFlag\000"
.LASF32:
	.ascii	"PWR_WakeUpPin\000"
.LASF41:
	.ascii	"bitstatus\000"
.LASF45:
	.ascii	"PWR_DeInit\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF22:
	.ascii	"FunctionalState\000"
.LASF13:
	.ascii	"RESERVED0\000"
.LASF36:
	.ascii	"PWR_Regulator\000"
.LASF29:
	.ascii	"PWR_PVDLevel\000"
.LASF40:
	.ascii	"PWR_FLAG\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"FlagStatus\000"
.LASF18:
	.ascii	"RESET\000"
.LASF0:
	.ascii	"signed char\000"
.LASF21:
	.ascii	"ENABLE\000"
.LASF23:
	.ascii	"PWR_TypeDef\000"
.LASF44:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF30:
	.ascii	"PWR_PVDCmd\000"
.LASF12:
	.ascii	"ICSR\000"
.LASF42:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
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
.LASF34:
	.ascii	"PWR_SLEEPEntry\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF11:
	.ascii	"CPUID\000"
.LASF27:
	.ascii	"PWR_PVDLevelConfig\000"
.LASF25:
	.ascii	"__WFE\000"
.LASF2:
	.ascii	"short int\000"
.LASF38:
	.ascii	"tmpreg\000"
.LASF28:
	.ascii	"NewState\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF46:
	.ascii	"PWR_GetFlagStatus\000"
.LASF16:
	.ascii	"SHCSR\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF24:
	.ascii	"__WFI\000"
.LASF35:
	.ascii	"PWR_EnterSTOPMode\000"
.LASF20:
	.ascii	"DISABLE\000"
.LASF37:
	.ascii	"PWR_STOPEntry\000"
.LASF15:
	.ascii	"RESERVED1\000"
.LASF26:
	.ascii	"PWR_BackupAccessCmd\000"
.LASF31:
	.ascii	"PWR_WakeUpPinCmd\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
