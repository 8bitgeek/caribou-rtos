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
	.file	"stm32f0xx_syscfg.c"
	.text
.Ltext0:
	.section	.text.SYSCFG_DeInit,"ax",%progbits
	.align	2
	.global	SYSCFG_DeInit
	.code	16
	.thumb_func
	.type	SYSCFG_DeInit, %function
SYSCFG_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_syscfg.c"
	.loc 1 93 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 95 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	movs	r1, #3
	ands	r2, r1
	str	r2, [r3]
	.loc 1 97 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 98 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 99 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 100 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 102 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #1
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 103 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073807360
.LFE32:
	.size	SYSCFG_DeInit, .-SYSCFG_DeInit
	.section	.text.SYSCFG_MemoryRemapConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_MemoryRemapConfig
	.code	16
	.thumb_func
	.type	SYSCFG_MemoryRemapConfig, %function
SYSCFG_MemoryRemapConfig:
.LFB33:
	.loc 1 115 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #16
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	str	r0, [r7, #4]
	.loc 1 116 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 122 0
	ldr	r3, .L5
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 125 0
	ldr	r3, [r7, #12]
	movs	r2, #3
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 128 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 131 0
	ldr	r3, .L5
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 132 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	1073807360
.LFE33:
	.size	SYSCFG_MemoryRemapConfig, .-SYSCFG_MemoryRemapConfig
	.section	.text.SYSCFG_DMAChannelRemapConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_DMAChannelRemapConfig
	.code	16
	.thumb_func
	.type	SYSCFG_DMAChannelRemapConfig, %function
SYSCFG_DMAChannelRemapConfig:
.LFB34:
	.loc 1 156 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 161 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L8
	.loc 1 164 0
	ldr	r3, .L11
	ldr	r2, .L11
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 171 0
	b	.L10
.L8:
	.loc 1 169 0
	ldr	r3, .L11
	ldr	r2, .L11
	ldr	r2, [r2]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L10:
	.loc 1 171 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1073807360
.LFE34:
	.size	SYSCFG_DMAChannelRemapConfig, .-SYSCFG_DMAChannelRemapConfig
	.section	.text.SYSCFG_I2CFastModePlusConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_I2CFastModePlusConfig
	.code	16
	.thumb_func
	.type	SYSCFG_I2CFastModePlusConfig, %function
SYSCFG_I2CFastModePlusConfig:
.LFB35:
	.loc 1 188 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #8
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 193 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L14
	.loc 1 196 0
	ldr	r3, .L17
	ldr	r2, .L17
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 203 0
	b	.L16
.L14:
	.loc 1 201 0
	ldr	r3, .L17
	ldr	r2, .L17
	ldr	r2, [r2]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L16:
	.loc 1 203 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
	.word	1073807360
.LFE35:
	.size	SYSCFG_I2CFastModePlusConfig, .-SYSCFG_I2CFastModePlusConfig
	.section	.text.SYSCFG_EXTILineConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_EXTILineConfig
	.code	16
	.thumb_func
	.type	SYSCFG_EXTILineConfig, %function
SYSCFG_EXTILineConfig:
.LFB36:
	.loc 1 214 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI11:
	sub	sp, sp, #16
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 215 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 221 0
	adds	r3, r7, #6
	ldrb	r3, [r3]
	movs	r2, #3
	ands	r3, r2
	lsls	r3, r3, #2
	movs	r2, #15
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #12]
	.loc 1 222 0
	ldr	r1, .L20
	adds	r3, r7, #6
	ldrb	r3, [r3]
	lsrs	r3, r3, #2
	uxtb	r3, r3
	movs	r0, r3
	ldr	r2, .L20
	adds	r3, r7, #6
	ldrb	r3, [r3]
	lsrs	r3, r3, #2
	uxtb	r3, r3
	adds	r3, r3, #2
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	ldr	r2, [r7, #12]
	mvns	r2, r2
	ands	r2, r3
	adds	r3, r0, #2
	lsls	r3, r3, #2
	str	r2, [r3, r1]
	.loc 1 223 0
	ldr	r0, .L20
	adds	r3, r7, #6
	ldrb	r3, [r3]
	lsrs	r3, r3, #2
	uxtb	r3, r3
	movs	r5, r3
	ldr	r2, .L20
	adds	r3, r7, #6
	ldrb	r3, [r3]
	lsrs	r3, r3, #2
	uxtb	r3, r3
	adds	r3, r3, #2
	lsls	r3, r3, #2
	ldr	r2, [r3, r2]
	adds	r3, r7, #7
	ldrb	r1, [r3]
	adds	r3, r7, #6
	ldrb	r3, [r3]
	movs	r4, #3
	ands	r3, r4
	lsls	r3, r3, #2
	lsls	r1, r1, r3
	movs	r3, r1
	orrs	r2, r3
	adds	r3, r5, #2
	lsls	r3, r3, #2
	str	r2, [r3, r0]
	.loc 1 224 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.L21:
	.align	2
.L20:
	.word	1073807360
.LFE36:
	.size	SYSCFG_EXTILineConfig, .-SYSCFG_EXTILineConfig
	.section	.text.SYSCFG_BreakConfig,"ax",%progbits
	.align	2
	.global	SYSCFG_BreakConfig
	.code	16
	.thumb_func
	.type	SYSCFG_BreakConfig, %function
SYSCFG_BreakConfig:
.LFB37:
	.loc 1 238 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	.loc 1 242 0
	ldr	r3, .L23
	ldr	r2, .L23
	ldr	r1, [r2, #24]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 243 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	1073807360
.LFE37:
	.size	SYSCFG_BreakConfig, .-SYSCFG_BreakConfig
	.section	.text.SYSCFG_GetFlagStatus,"ax",%progbits
	.align	2
	.global	SYSCFG_GetFlagStatus
	.code	16
	.thumb_func
	.type	SYSCFG_GetFlagStatus, %function
SYSCFG_GetFlagStatus:
.LFB38:
	.loc 1 253 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	.loc 1 254 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 260 0
	ldr	r3, .L29
	ldr	r2, [r3, #24]
	movs	r3, #128
	lsls	r3, r3, #1
	ands	r3, r2
	beq	.L26
	.loc 1 263 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L27
.L26:
	.loc 1 268 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L27:
	.loc 1 271 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 272 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	1073807360
.LFE38:
	.size	SYSCFG_GetFlagStatus, .-SYSCFG_GetFlagStatus
	.section	.text.SYSCFG_ClearFlag,"ax",%progbits
	.align	2
	.global	SYSCFG_ClearFlag
	.code	16
	.thumb_func
	.type	SYSCFG_ClearFlag, %function
SYSCFG_ClearFlag:
.LFB39:
	.loc 1 282 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #4]
	.loc 1 286 0
	ldr	r3, .L32
	ldr	r2, .L32
	ldr	r1, [r2, #24]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 287 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	1073807360
.LFE39:
	.size	SYSCFG_ClearFlag, .-SYSCFG_ClearFlag
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x20
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
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x286
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0xc
	.4byte	.LASF36
	.4byte	.LASF37
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF4
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	0x53
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xdf
	.4byte	0x98
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0
	.uleb128 0x8
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0xdf
	.4byte	0x7f
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xbc
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0xe1
	.4byte	0xa3
	.uleb128 0x9
	.byte	0x1c
	.byte	0x3
	.2byte	0x1a2
	.4byte	0x105
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x1a4
	.4byte	0x7a
	.byte	0
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x1a5
	.4byte	0x53
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x1a6
	.4byte	0x115
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x1a7
	.4byte	0x7a
	.byte	0x18
	.byte	0
	.uleb128 0xb
	.4byte	0x7a
	.4byte	0x115
	.uleb128 0xc
	.4byte	0x73
	.byte	0x3
	.byte	0
	.uleb128 0x5
	.4byte	0x105
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1a8
	.4byte	0xc7
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0x5c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x72
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x169
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x72
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x1
	.byte	0x74
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF21
	.byte	0x1
	.byte	0x9b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19b
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x1
	.byte	0x9b
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0x9b
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0xbb
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cd
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0xbb
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0xbb
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x1
	.byte	0xd5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20d
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x1
	.byte	0xd5
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x10
	.4byte	.LASF29
	.byte	0x1
	.byte	0xd5
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x12
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xf
	.4byte	.LASF31
	.byte	0x1
	.byte	0xed
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x231
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0xed
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0xfc
	.4byte	0x98
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x267
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x1
	.byte	0xfc
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0x1
	.byte	0xfe
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x119
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x119
	.4byte	0x53
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
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
	.uleb128 0xf
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
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x107
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x28a
	.4byte	0x8b
	.ascii	"RESET\000"
	.4byte	0x91
	.ascii	"SET\000"
	.4byte	0xaf
	.ascii	"DISABLE\000"
	.4byte	0xb5
	.ascii	"ENABLE\000"
	.4byte	0x126
	.ascii	"SYSCFG_DeInit\000"
	.4byte	0x137
	.ascii	"SYSCFG_MemoryRemapConfig\000"
	.4byte	0x169
	.ascii	"SYSCFG_DMAChannelRemapConfig\000"
	.4byte	0x19b
	.ascii	"SYSCFG_I2CFastModePlusConfig\000"
	.4byte	0x1cd
	.ascii	"SYSCFG_EXTILineConfig\000"
	.4byte	0x20d
	.ascii	"SYSCFG_BreakConfig\000"
	.4byte	0x231
	.ascii	"SYSCFG_GetFlagStatus\000"
	.4byte	0x267
	.ascii	"SYSCFG_ClearFlag\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xf7
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x28a
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x45
	.ascii	"short unsigned int\000"
	.4byte	0x4c
	.ascii	"int\000"
	.4byte	0x5e
	.ascii	"unsigned int\000"
	.4byte	0x53
	.ascii	"uint32_t\000"
	.4byte	0x65
	.ascii	"long long int\000"
	.4byte	0x6c
	.ascii	"long long unsigned int\000"
	.4byte	0x73
	.ascii	"sizetype\000"
	.4byte	0x98
	.ascii	"FlagStatus\000"
	.4byte	0xbc
	.ascii	"FunctionalState\000"
	.4byte	0x11a
	.ascii	"SYSCFG_TypeDef\000"
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
.LASF28:
	.ascii	"EXTI_PortSourceGPIOx\000"
.LASF31:
	.ascii	"SYSCFG_BreakConfig\000"
.LASF34:
	.ascii	"bitstatus\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"FunctionalState\000"
.LASF38:
	.ascii	"SYSCFG_DeInit\000"
.LASF39:
	.ascii	"SYSCFG_GetFlagStatus\000"
.LASF13:
	.ascii	"ENABLE\000"
.LASF27:
	.ascii	"SYSCFG_EXTILineConfig\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF15:
	.ascii	"CFGR1\000"
.LASF18:
	.ascii	"CFGR2\000"
.LASF10:
	.ascii	"RESET\000"
.LASF26:
	.ascii	"SYSCFG_I2CFastModePlus\000"
.LASF30:
	.ascii	"tmpctrl\000"
.LASF29:
	.ascii	"EXTI_PinSourcex\000"
.LASF25:
	.ascii	"SYSCFG_I2CFastModePlusConfig\000"
.LASF16:
	.ascii	"RESERVED\000"
.LASF32:
	.ascii	"SYSCFG_Break\000"
.LASF17:
	.ascii	"EXTICR\000"
.LASF35:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF36:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_syscfg.c\000"
.LASF21:
	.ascii	"SYSCFG_DMAChannelRemapConfig\000"
.LASF0:
	.ascii	"signed char\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF23:
	.ascii	"SYSCFG_DMARemap\000"
.LASF7:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"SYSCFG_MemoryRemap\000"
.LASF2:
	.ascii	"short int\000"
.LASF24:
	.ascii	"NewState\000"
.LASF19:
	.ascii	"SYSCFG_TypeDef\000"
.LASF40:
	.ascii	"SYSCFG_ClearFlag\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF37:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF12:
	.ascii	"DISABLE\000"
.LASF33:
	.ascii	"SYSCFG_Flag\000"
.LASF20:
	.ascii	"SYSCFG_MemoryRemapConfig\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
