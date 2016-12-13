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
	.file	"stm32f0xx_exti.c"
	.text
.Ltext0:
	.section	.text.EXTI_DeInit,"ax",%progbits
	.align	2
	.global	EXTI_DeInit
	.code	16
	.thumb_func
	.type	EXTI_DeInit, %function
EXTI_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_exti.c"
	.loc 1 109 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 110 0
	ldr	r3, .L2
	ldr	r2, .L2+4
	str	r2, [r3]
	.loc 1 111 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 112 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 113 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 114 0
	ldr	r3, .L2
	ldr	r2, .L2+8
	str	r2, [r3, #20]
	.loc 1 115 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073808384
	.word	261357568
	.word	7077887
.LFE32:
	.size	EXTI_DeInit, .-EXTI_DeInit
	.section	.text.EXTI_Init,"ax",%progbits
	.align	2
	.global	EXTI_Init
	.code	16
	.thumb_func
	.type	EXTI_Init, %function
EXTI_Init:
.LFB33:
	.loc 1 130 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #16
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	str	r0, [r7, #4]
	.loc 1 131 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 139 0
	ldr	r3, .L10
	str	r3, [r7, #12]
	.loc 1 141 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #6]
	cmp	r3, #0
	beq	.L5
	.loc 1 144 0
	ldr	r2, .L10
	ldr	r3, .L10
	ldr	r1, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ands	r3, r1
	str	r3, [r2]
	.loc 1 145 0
	ldr	r2, .L10
	ldr	r3, .L10
	ldr	r1, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ands	r3, r1
	str	r3, [r2, #4]
	.loc 1 147 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #4]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 149 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	ldr	r2, [r2]
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 152 0
	ldr	r2, .L10
	ldr	r3, .L10
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ands	r3, r1
	str	r3, [r2, #8]
	.loc 1 153 0
	ldr	r2, .L10
	ldr	r3, .L10
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	mvns	r3, r3
	ands	r3, r1
	str	r3, [r2, #12]
	.loc 1 156 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #5]
	cmp	r3, #16
	bne	.L6
	.loc 1 159 0
	ldr	r2, .L10
	ldr	r3, .L10
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orrs	r3, r1
	str	r3, [r2, #8]
	.loc 1 160 0
	ldr	r2, .L10
	ldr	r3, .L10
	ldr	r1, [r3, #12]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orrs	r3, r1
	str	r3, [r2, #12]
	.loc 1 177 0
	b	.L9
.L6:
	.loc 1 164 0
	ldr	r3, .L10
	str	r3, [r7, #12]
	.loc 1 165 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #5]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 167 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	ldr	r2, [r2]
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 177 0
	b	.L9
.L5:
	.loc 1 172 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #4]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 175 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r1, [r2]
	ldr	r2, [r7, #4]
	ldr	r2, [r2]
	mvns	r2, r2
	ands	r2, r1
	str	r2, [r3]
.L9:
	.loc 1 177 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	1073808384
.LFE33:
	.size	EXTI_Init, .-EXTI_Init
	.section	.text.EXTI_StructInit,"ax",%progbits
	.align	2
	.global	EXTI_StructInit
	.code	16
	.thumb_func
	.type	EXTI_StructInit, %function
EXTI_StructInit:
.LFB34:
	.loc 1 186 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	.loc 1 187 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 188 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 189 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	strb	r2, [r3, #5]
	.loc 1 190 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #6]
	.loc 1 191 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	EXTI_StructInit, .-EXTI_StructInit
	.section	.text.EXTI_GenerateSWInterrupt,"ax",%progbits
	.align	2
	.global	EXTI_GenerateSWInterrupt
	.code	16
	.thumb_func
	.type	EXTI_GenerateSWInterrupt, %function
EXTI_GenerateSWInterrupt:
.LFB35:
	.loc 1 201 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #8
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	str	r0, [r7, #4]
	.loc 1 205 0
	ldr	r3, .L14
	ldr	r2, .L14
	ldr	r1, [r2, #16]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 206 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	1073808384
.LFE35:
	.size	EXTI_GenerateSWInterrupt, .-EXTI_GenerateSWInterrupt
	.section	.text.EXTI_GetFlagStatus,"ax",%progbits
	.align	2
	.global	EXTI_GetFlagStatus
	.code	16
	.thumb_func
	.type	EXTI_GetFlagStatus, %function
EXTI_GetFlagStatus:
.LFB36:
	.loc 1 232 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #16
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	str	r0, [r7, #4]
	.loc 1 233 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 237 0
	ldr	r3, .L20
	ldr	r3, [r3, #20]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L17
	.loc 1 239 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L18
.L17:
	.loc 1 243 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L18:
	.loc 1 245 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 246 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	1073808384
.LFE36:
	.size	EXTI_GetFlagStatus, .-EXTI_GetFlagStatus
	.section	.text.EXTI_ClearFlag,"ax",%progbits
	.align	2
	.global	EXTI_ClearFlag
	.code	16
	.thumb_func
	.type	EXTI_ClearFlag, %function
EXTI_ClearFlag:
.LFB37:
	.loc 1 255 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	.loc 1 259 0
	ldr	r3, .L23
	ldr	r2, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 260 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	1073808384
.LFE37:
	.size	EXTI_ClearFlag, .-EXTI_ClearFlag
	.section	.text.EXTI_GetITStatus,"ax",%progbits
	.align	2
	.global	EXTI_GetITStatus
	.code	16
	.thumb_func
	.type	EXTI_GetITStatus, %function
EXTI_GetITStatus:
.LFB38:
	.loc 1 270 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	.loc 1 271 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 272 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 276 0
	ldr	r3, .L29
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 277 0
	ldr	r3, .L29
	ldr	r3, [r3, #20]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L26
	.loc 1 277 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L26
	.loc 1 279 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L27
.L26:
	.loc 1 283 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L27:
	.loc 1 285 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 287 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	1073808384
.LFE38:
	.size	EXTI_GetITStatus, .-EXTI_GetITStatus
	.section	.text.EXTI_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	EXTI_ClearITPendingBit
	.code	16
	.thumb_func
	.type	EXTI_ClearITPendingBit, %function
EXTI_ClearITPendingBit:
.LFB39:
	.loc 1 296 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #4]
	.loc 1 300 0
	ldr	r3, .L32
	ldr	r2, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 301 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	1073808384
.LFE39:
	.size	EXTI_ClearITPendingBit, .-EXTI_ClearITPendingBit
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
	.uleb128 0x18
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
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_exti.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x30e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0xc
	.4byte	.LASF41
	.4byte	.LASF42
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
	.4byte	.LASF9
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
	.byte	0xdf
	.4byte	0x8d
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0
	.uleb128 0x8
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0xdf
	.4byte	0x74
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0xdf
	.4byte	0x74
	.uleb128 0x6
	.byte	0x1
	.4byte	0x2c
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
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0xe1
	.4byte	0xa3
	.uleb128 0x9
	.byte	0x18
	.byte	0x3
	.2byte	0x15f
	.4byte	0x11e
	.uleb128 0xa
	.ascii	"IMR\000"
	.byte	0x3
	.2byte	0x161
	.4byte	0x6f
	.byte	0
	.uleb128 0xa
	.ascii	"EMR\000"
	.byte	0x3
	.2byte	0x162
	.4byte	0x6f
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x163
	.4byte	0x6f
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x164
	.4byte	0x6f
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x165
	.4byte	0x6f
	.byte	0x10
	.uleb128 0xa
	.ascii	"PR\000"
	.byte	0x3
	.2byte	0x166
	.4byte	0x6f
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x167
	.4byte	0xc7
	.uleb128 0x6
	.byte	0x1
	.4byte	0x2c
	.byte	0x4
	.byte	0x36
	.4byte	0x143
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x4
	.byte	0x39
	.4byte	0x12a
	.uleb128 0x6
	.byte	0x1
	.4byte	0x2c
	.byte	0x4
	.byte	0x42
	.4byte	0x16d
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x10
	.byte	0
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x4
	.byte	0x46
	.4byte	0x14e
	.uleb128 0xd
	.byte	0x8
	.byte	0x4
	.byte	0x4f
	.4byte	0x1b1
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x4
	.byte	0x51
	.4byte	0x48
	.byte	0
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x54
	.4byte	0x143
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x4
	.byte	0x57
	.4byte	0x16d
	.byte	0x5
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x4
	.byte	0x5a
	.4byte	0xbc
	.byte	0x6
	.byte	0
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x4
	.byte	0x5c
	.4byte	0x178
	.uleb128 0xf
	.4byte	.LASF43
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF31
	.byte	0x1
	.byte	0x81
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ff
	.uleb128 0x11
	.4byte	.LASF33
	.byte	0x1
	.byte	0x81
	.4byte	0x1ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x83
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x1b1
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x229
	.uleb128 0x11
	.4byte	.LASF33
	.byte	0x1
	.byte	0xb9
	.4byte	0x1ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0xc8
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24d
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0xc8
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0x1
	.byte	0xe7
	.4byte	0x8d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x283
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0xe7
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0xe9
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0xfe
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a7
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0xfe
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x10d
	.4byte	0x98
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ef
	.uleb128 0x17
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x10d
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x10f
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x110
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x127
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x127
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
	.uleb128 0xe
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
	.uleb128 0x11
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x15
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
	.uleb128 0x17
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
	.4byte	0x15d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x312
	.4byte	0x80
	.ascii	"RESET\000"
	.4byte	0x86
	.ascii	"SET\000"
	.4byte	0xaf
	.ascii	"DISABLE\000"
	.4byte	0xb5
	.ascii	"ENABLE\000"
	.4byte	0x136
	.ascii	"EXTI_Mode_Interrupt\000"
	.4byte	0x13c
	.ascii	"EXTI_Mode_Event\000"
	.4byte	0x15a
	.ascii	"EXTI_Trigger_Rising\000"
	.4byte	0x160
	.ascii	"EXTI_Trigger_Falling\000"
	.4byte	0x166
	.ascii	"EXTI_Trigger_Rising_Falling\000"
	.4byte	0x1bc
	.ascii	"EXTI_DeInit\000"
	.4byte	0x1cd
	.ascii	"EXTI_Init\000"
	.4byte	0x205
	.ascii	"EXTI_StructInit\000"
	.4byte	0x229
	.ascii	"EXTI_GenerateSWInterrupt\000"
	.4byte	0x24d
	.ascii	"EXTI_GetFlagStatus\000"
	.4byte	0x283
	.ascii	"EXTI_ClearFlag\000"
	.4byte	0x2a7
	.ascii	"EXTI_GetITStatus\000"
	.4byte	0x2ef
	.ascii	"EXTI_ClearITPendingBit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x138
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x312
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
	.ascii	"FlagStatus\000"
	.4byte	0x98
	.ascii	"ITStatus\000"
	.4byte	0xbc
	.ascii	"FunctionalState\000"
	.4byte	0x11e
	.ascii	"EXTI_TypeDef\000"
	.4byte	0x143
	.ascii	"EXTIMode_TypeDef\000"
	.4byte	0x16d
	.ascii	"EXTITrigger_TypeDef\000"
	.4byte	0x1b1
	.ascii	"EXTI_InitTypeDef\000"
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
.LASF26:
	.ascii	"EXTI_Line\000"
.LASF27:
	.ascii	"EXTI_Mode\000"
.LASF11:
	.ascii	"ITStatus\000"
.LASF39:
	.ascii	"enablestatus\000"
.LASF29:
	.ascii	"EXTI_LineCmd\000"
.LASF28:
	.ascii	"EXTI_Trigger\000"
.LASF32:
	.ascii	"EXTI_StructInit\000"
.LASF20:
	.ascii	"EXTI_Mode_Event\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF19:
	.ascii	"EXTI_Mode_Interrupt\000"
.LASF14:
	.ascii	"FunctionalState\000"
.LASF35:
	.ascii	"bitstatus\000"
.LASF34:
	.ascii	"EXTI_GenerateSWInterrupt\000"
.LASF30:
	.ascii	"EXTI_InitTypeDef\000"
.LASF33:
	.ascii	"EXTI_InitStruct\000"
.LASF13:
	.ascii	"ENABLE\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF10:
	.ascii	"FlagStatus\000"
.LASF36:
	.ascii	"EXTI_ClearFlag\000"
.LASF8:
	.ascii	"RESET\000"
.LASF21:
	.ascii	"EXTIMode_TypeDef\000"
.LASF18:
	.ascii	"EXTI_TypeDef\000"
.LASF15:
	.ascii	"RTSR\000"
.LASF41:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_exti.c\000"
.LASF22:
	.ascii	"EXTI_Trigger_Rising\000"
.LASF24:
	.ascii	"EXTI_Trigger_Rising_Falling\000"
.LASF40:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF31:
	.ascii	"EXTI_Init\000"
.LASF37:
	.ascii	"EXTI_GetFlagStatus\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"EXTI_Trigger_Falling\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF38:
	.ascii	"EXTI_GetITStatus\000"
.LASF44:
	.ascii	"EXTI_ClearITPendingBit\000"
.LASF2:
	.ascii	"short int\000"
.LASF9:
	.ascii	"uint32_t\000"
.LASF42:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF12:
	.ascii	"DISABLE\000"
.LASF25:
	.ascii	"EXTITrigger_TypeDef\000"
.LASF17:
	.ascii	"SWIER\000"
.LASF43:
	.ascii	"EXTI_DeInit\000"
.LASF16:
	.ascii	"FTSR\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
