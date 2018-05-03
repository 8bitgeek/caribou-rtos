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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_wwdg.c"
	.loc 1 133 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 134 0
	movs	r3, #128
	lsls	r3, r3, #4
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 135 0
	movs	r3, #128
	lsls	r3, r3, #4
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 136 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 149 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #16
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	str	r0, [r7, #4]
	.loc 1 150 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 154 0
	ldr	r3, .L3
	ldr	r3, [r3, #4]
	ldr	r2, .L3+4
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 156 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 158 0
	ldr	r3, .L3
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 159 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 168 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #16
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 169 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 175 0
	ldr	r3, .L6
	ldr	r3, [r3, #4]
	movs	r2, #127
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 178 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #127
	ands	r2, r3
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 181 0
	ldr	r3, .L6
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 182 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 191 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	add	r7, sp, #0
.LCFI9:
	.loc 1 192 0
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 193 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 203 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI10:
	sub	sp, sp, #8
.LCFI11:
	add	r7, sp, #0
.LCFI12:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 208 0
	ldr	r3, .L12
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r1, #127
	ands	r2, r1
	str	r2, [r3]
	.loc 1 209 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 235 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI13:
	sub	sp, sp, #8
.LCFI14:
	add	r7, sp, #0
.LCFI15:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 238 0
	ldr	r3, .L15
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r1, #128
	rsbs	r1, r1, #0
	orrs	r2, r1
	uxtb	r2, r2
	str	r2, [r3]
	.loc 1 239 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 263 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI16:
	sub	sp, sp, #8
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	.loc 1 264 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 266 0
	ldr	r3, .L21
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L18
	.loc 1 268 0
	adds	r3, r7, #7
	movs	r2, #1
	strb	r2, [r3]
	b	.L19
.L18:
	.loc 1 272 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
.L19:
	.loc 1 274 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 275 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
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
	.loc 1 283 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	.loc 1 284 0
	ldr	r3, .L24
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 285 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L25:
	.align	2
.L24:
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
	.4byte	.LCFI10-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
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
	.4byte	.LCFI13-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
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
	.4byte	.LCFI16-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
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
	.4byte	.LCFI19-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x209
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0xc
	.4byte	.LASF29
	.4byte	.LASF30
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
	.4byte	0x37
	.byte	0x3
	.byte	0xdf
	.4byte	0xa3
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0
	.uleb128 0x8
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0xdf
	.4byte	0x8a
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xc7
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0
	.uleb128 0x9
	.byte	0xc
	.byte	0x3
	.2byte	0x283
	.4byte	0xf6
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
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x288
	.4byte	0xc7
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x1
	.byte	0x84
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x94
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x145
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x94
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x96
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0xa7
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x177
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa9
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0xbe
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x1
	.byte	0xca
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ac
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0xca
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0xea
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d0
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0xea
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x106
	.4byte	0xa3
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fa
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x108
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF27
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
	.uleb128 0x10
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xd5
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x20d
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xba
	.ascii	"DISABLE\000"
	.4byte	0xc0
	.ascii	"ENABLE\000"
	.4byte	0x102
	.ascii	"WWDG_DeInit\000"
	.4byte	0x113
	.ascii	"WWDG_SetPrescaler\000"
	.4byte	0x145
	.ascii	"WWDG_SetWindowValue\000"
	.4byte	0x177
	.ascii	"WWDG_EnableIT\000"
	.4byte	0x188
	.ascii	"WWDG_SetCounter\000"
	.4byte	0x1ac
	.ascii	"WWDG_Enable\000"
	.4byte	0x1d0
	.ascii	"WWDG_GetFlagStatus\000"
	.4byte	0x1fa
	.ascii	"WWDG_ClearFlag\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xee
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x20d
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
	.4byte	0xa3
	.ascii	"FlagStatus\000"
	.4byte	0xf6
	.ascii	"WWDG_TypeDef\000"
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
.LASF5:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"WWDG_TypeDef\000"
.LASF26:
	.ascii	"bitstatus\000"
.LASF29:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_wwdg.c\000"
.LASF25:
	.ascii	"WWDG_Enable\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF0:
	.ascii	"signed char\000"
.LASF22:
	.ascii	"WWDG_EnableIT\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF31:
	.ascii	"WWDG_GetFlagStatus\000"
.LASF11:
	.ascii	"RESET\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF19:
	.ascii	"WindowValue\000"
.LASF24:
	.ascii	"Counter\000"
.LASF28:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF16:
	.ascii	"WWDG_SetPrescaler\000"
.LASF23:
	.ascii	"WWDG_SetCounter\000"
.LASF18:
	.ascii	"WWDG_Prescaler\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF2:
	.ascii	"short int\000"
.LASF20:
	.ascii	"tmpreg\000"
.LASF27:
	.ascii	"WWDG_ClearFlag\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF17:
	.ascii	"WWDG_SetWindowValue\000"
.LASF21:
	.ascii	"WWDG_DeInit\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF13:
	.ascii	"DISABLE\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
