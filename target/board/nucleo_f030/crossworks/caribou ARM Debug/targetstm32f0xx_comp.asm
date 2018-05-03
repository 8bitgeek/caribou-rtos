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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_comp.c"
	.loc 1 143 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 144 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3]
	.loc 1 145 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 164 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #16
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 165 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 176 0
	ldr	r3, .L5
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 179 0
	ldr	r2, .L5+4
	ldr	r3, [r7, #4]
	lsls	r2, r2, r3
	movs	r3, r2
	mvns	r2, r3
	ldr	r3, [r7, #12]
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 187 0
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	orrs	r2, r3
	.loc 1 188 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	.loc 1 187 0
	orrs	r2, r3
	.loc 1 188 0
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	orrs	r2, r3
	.loc 1 189 0
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	.loc 1 188 0
	orrs	r2, r3
	.loc 1 189 0
	ldr	r3, [r7, #4]
	lsls	r2, r2, r3
	movs	r3, r2
	.loc 1 187 0
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 192 0
	ldr	r3, .L5
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 193 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 202 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	.loc 1 203 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 204 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 205 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 206 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 207 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	str	r2, [r3, #16]
	.loc 1 208 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 228 0
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
	.loc 1 233 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L9
	.loc 1 236 0
	ldr	r3, .L12
	ldr	r2, .L12
	ldr	r2, [r2]
	movs	r0, #1
	ldr	r1, [r7, #4]
	lsls	r0, r0, r1
	movs	r1, r0
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 243 0
	b	.L11
.L9:
	.loc 1 241 0
	ldr	r3, .L12
	ldr	r2, .L12
	ldr	r2, [r2]
	movs	r0, #1
	ldr	r1, [r7, #4]
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L11:
	.loc 1 243 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
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
	.loc 1 256 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #8
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 260 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L15
	.loc 1 263 0
	ldr	r3, .L18
	ldr	r2, .L18
	ldr	r2, [r2]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 270 0
	b	.L17
.L15:
	.loc 1 268 0
	ldr	r3, .L18
	ldr	r2, .L18
	ldr	r2, [r2]
	movs	r1, #2
	bics	r2, r1
	str	r2, [r3]
.L17:
	.loc 1 270 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
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
	.loc 1 293 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #16
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	.loc 1 294 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 300 0
	ldr	r3, .L24
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r1, r2, #7
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	ands	r3, r2
	beq	.L21
	.loc 1 302 0
	movs	r3, #128
	lsls	r3, r3, #7
	str	r3, [r7, #12]
	b	.L22
.L21:
	.loc 1 306 0
	movs	r3, #0
	str	r3, [r7, #12]
.L22:
	.loc 1 310 0
	ldr	r3, [r7, #12]
	.loc 1 311 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L25:
	.align	2
.L24:
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
	.loc 1 340 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #8
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 344 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L27
	.loc 1 347 0
	ldr	r3, .L30
	ldr	r2, .L30
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #16
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 354 0
	b	.L29
.L27:
	.loc 1 352 0
	ldr	r3, .L30
	ldr	r2, .L30
	ldr	r2, [r2]
	ldr	r1, .L30+4
	ands	r2, r1
	str	r2, [r3]
.L29:
	.loc 1 354 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L31:
	.align	2
.L30:
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
	.loc 1 385 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #4]
	.loc 1 390 0
	ldr	r3, .L33
	ldr	r2, .L33
	ldr	r1, [r2]
	movs	r2, #128
	lsls	r0, r2, #8
	ldr	r2, [r7, #4]
	lsls	r0, r0, r2
	movs	r2, r0
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 391 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L34:
	.align	2
.L33:
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_comp.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x25a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0xc
	.4byte	.LASF30
	.4byte	.LASF31
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x17
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x5
	.4byte	0x48
	.uleb128 0x6
	.byte	0x1
	.4byte	0x2c
	.byte	0x3
	.byte	0xe1
	.4byte	0x8d
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0xe1
	.4byte	0x74
	.uleb128 0x8
	.byte	0x4
	.byte	0x3
	.2byte	0x116
	.4byte	0xaf
	.uleb128 0x9
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x118
	.4byte	0x6f
	.byte	0
	.byte	0
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x119
	.4byte	0x98
	.uleb128 0xb
	.byte	0x14
	.byte	0x4
	.byte	0x36
	.4byte	0x100
	.uleb128 0xc
	.4byte	.LASF13
	.byte	0x4
	.byte	0x39
	.4byte	0x48
	.byte	0
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x4
	.byte	0x3c
	.4byte	0x48
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x4
	.byte	0x3f
	.4byte	0x48
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x4
	.byte	0x42
	.4byte	0x48
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x4
	.byte	0x45
	.4byte	0x48
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x4
	.byte	0x49
	.4byte	0xbb
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x1
	.byte	0xa3
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15c
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa3
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa3
	.4byte	0x15c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0xa5
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x100
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x186
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0xc9
	.4byte	0x15c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b8
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0xe3
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0xe3
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x1
	.byte	0xff
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1dc
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x1
	.byte	0xff
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x124
	.4byte	0x48
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x215
	.uleb128 0x13
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x124
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x126
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x153
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23b
	.uleb128 0x13
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x153
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x180
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x180
	.4byte	0x48
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
	.uleb128 0x4
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x13
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
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.4byte	0xb6
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x25e
	.4byte	0x80
	.ascii	"DISABLE\000"
	.4byte	0x86
	.ascii	"ENABLE\000"
	.4byte	0x10b
	.ascii	"COMP_DeInit\000"
	.4byte	0x11c
	.ascii	"COMP_Init\000"
	.4byte	0x162
	.ascii	"COMP_StructInit\000"
	.4byte	0x186
	.ascii	"COMP_Cmd\000"
	.4byte	0x1b8
	.ascii	"COMP_SwitchCmd\000"
	.4byte	0x1dc
	.ascii	"COMP_GetOutputLevel\000"
	.4byte	0x215
	.ascii	"COMP_WindowCmd\000"
	.4byte	0x23b
	.ascii	"COMP_LockConfig\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xef
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x25e
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x3a
	.ascii	"short unsigned int\000"
	.4byte	0x41
	.ascii	"int\000"
	.4byte	0x53
	.ascii	"unsigned int\000"
	.4byte	0x48
	.ascii	"uint32_t\000"
	.4byte	0x5a
	.ascii	"long long int\000"
	.4byte	0x61
	.ascii	"long long unsigned int\000"
	.4byte	0x68
	.ascii	"sizetype\000"
	.4byte	0x8d
	.ascii	"FunctionalState\000"
	.4byte	0xaf
	.ascii	"COMP_TypeDef\000"
	.4byte	0x100
	.ascii	"COMP_InitTypeDef\000"
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
.LASF15:
	.ascii	"COMP_OutputPol\000"
.LASF21:
	.ascii	"COMP_Init\000"
.LASF13:
	.ascii	"COMP_InvertingInput\000"
.LASF33:
	.ascii	"COMP_GetOutputLevel\000"
.LASF30:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_comp.c\000"
.LASF16:
	.ascii	"COMP_Hysteresis\000"
.LASF11:
	.ascii	"FunctionalState\000"
.LASF22:
	.ascii	"COMP_StructInit\000"
.LASF9:
	.ascii	"ENABLE\000"
.LASF0:
	.ascii	"signed char\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF32:
	.ascii	"COMP_DeInit\000"
.LASF14:
	.ascii	"COMP_Output\000"
.LASF31:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF27:
	.ascii	"compout\000"
.LASF23:
	.ascii	"COMP_Cmd\000"
.LASF17:
	.ascii	"COMP_Mode\000"
.LASF29:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF18:
	.ascii	"COMP_InitTypeDef\000"
.LASF28:
	.ascii	"COMP_WindowCmd\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF19:
	.ascii	"COMP_Selection\000"
.LASF20:
	.ascii	"COMP_InitStruct\000"
.LASF34:
	.ascii	"COMP_LockConfig\000"
.LASF2:
	.ascii	"short int\000"
.LASF26:
	.ascii	"tmpreg\000"
.LASF24:
	.ascii	"NewState\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"DISABLE\000"
.LASF25:
	.ascii	"COMP_SwitchCmd\000"
.LASF12:
	.ascii	"COMP_TypeDef\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
