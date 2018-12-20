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
	.file	"stm32f0xx_dac.c"
	.text
.Ltext0:
	.section	.text.DAC_DeInit,"ax",%progbits
	.align	2
	.global	DAC_DeInit
	.code	16
	.thumb_func
	.type	DAC_DeInit, %function
DAC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dac.c"
	.loc 1 150 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 152 0
	movs	r3, #128
	lsls	r3, r3, #22
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 154 0
	movs	r3, #128
	lsls	r3, r3, #22
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 155 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	DAC_DeInit, .-DAC_DeInit
	.section	.text.DAC_Init,"ax",%progbits
	.align	2
	.global	DAC_Init
	.code	16
	.thumb_func
	.type	DAC_Init, %function
DAC_Init:
.LFB33:
	.loc 1 169 0
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
	.loc 1 170 0
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 179 0
	ldr	r3, .L3
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 182 0
	movs	r2, #62
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
	orrs	r3, r2
	str	r3, [r7, #8]
	.loc 1 190 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	lsls	r2, r2, r3
	movs	r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 193 0
	ldr	r3, .L3
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 194 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	1073771520
.LFE33:
	.size	DAC_Init, .-DAC_Init
	.section	.text.DAC_StructInit,"ax",%progbits
	.align	2
	.global	DAC_StructInit
	.code	16
	.thumb_func
	.type	DAC_StructInit, %function
DAC_StructInit:
.LFB34:
	.loc 1 203 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	.loc 1 206 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 208 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 209 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	DAC_StructInit, .-DAC_StructInit
	.section	.text.DAC_Cmd,"ax",%progbits
	.align	2
	.global	DAC_Cmd
	.code	16
	.thumb_func
	.type	DAC_Cmd, %function
DAC_Cmd:
.LFB35:
	.loc 1 223 0
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
	.loc 1 228 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L7
	.loc 1 231 0
	ldr	r3, .L10
	ldr	r2, .L10
	ldr	r1, [r2]
	movs	r0, #1
	ldr	r2, [r7, #4]
	lsls	r0, r0, r2
	movs	r2, r0
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 238 0
	b	.L9
.L7:
	.loc 1 236 0
	ldr	r3, .L10
	ldr	r2, .L10
	ldr	r2, [r2]
	movs	r0, #1
	ldr	r1, [r7, #4]
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L9:
	.loc 1 238 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	1073771520
.LFE35:
	.size	DAC_Cmd, .-DAC_Cmd
	.section	.text.DAC_SoftwareTriggerCmd,"ax",%progbits
	.align	2
	.global	DAC_SoftwareTriggerCmd
	.code	16
	.thumb_func
	.type	DAC_SoftwareTriggerCmd, %function
DAC_SoftwareTriggerCmd:
.LFB36:
	.loc 1 250 0
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
	.loc 1 255 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L13
	.loc 1 258 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r1, [r2, #4]
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #4
	movs	r0, #1
	lsls	r0, r0, r2
	movs	r2, r0
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 265 0
	b	.L15
.L13:
	.loc 1 263 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #4]
	ldr	r1, [r7, #4]
	lsrs	r1, r1, #4
	movs	r0, #1
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #4]
.L15:
	.loc 1 265 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	1073771520
.LFE36:
	.size	DAC_SoftwareTriggerCmd, .-DAC_SoftwareTriggerCmd
	.section	.text.DAC_SetChannel1Data,"ax",%progbits
	.align	2
	.global	DAC_SetChannel1Data
	.code	16
	.thumb_func
	.type	DAC_SetChannel1Data, %function
DAC_SetChannel1Data:
.LFB37:
	.loc 1 278 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #16
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 279 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 285 0
	ldr	r3, .L19
	str	r3, [r7, #12]
	.loc 1 286 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	adds	r3, r2, r3
	adds	r3, r3, #8
	str	r3, [r7, #12]
	.loc 1 289 0
	ldr	r3, [r7, #12]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	str	r2, [r3]
	.loc 1 290 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073771520
.LFE37:
	.size	DAC_SetChannel1Data, .-DAC_SetChannel1Data
	.section	.text.DAC_GetDataOutputValue,"ax",%progbits
	.align	2
	.global	DAC_GetDataOutputValue
	.code	16
	.thumb_func
	.type	DAC_GetDataOutputValue, %function
DAC_GetDataOutputValue:
.LFB38:
	.loc 1 300 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	.loc 1 301 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 306 0
	ldr	r3, .L23
	str	r3, [r7, #12]
	.loc 1 307 0
	ldr	r3, [r7, #4]
	lsrs	r2, r3, #2
	ldr	r3, [r7, #12]
	adds	r3, r2, r3
	adds	r3, r3, #44
	str	r3, [r7, #12]
	.loc 1 310 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	uxth	r3, r3
	.loc 1 311 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	1073771520
.LFE38:
	.size	DAC_GetDataOutputValue, .-DAC_GetDataOutputValue
	.section	.text.DAC_DMACmd,"ax",%progbits
	.align	2
	.global	DAC_DMACmd
	.code	16
	.thumb_func
	.type	DAC_DMACmd, %function
DAC_DMACmd:
.LFB39:
	.loc 1 342 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 347 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L26
	.loc 1 350 0
	ldr	r3, .L29
	ldr	r2, .L29
	ldr	r1, [r2]
	movs	r2, #128
	lsls	r0, r2, #5
	ldr	r2, [r7, #4]
	lsls	r0, r0, r2
	movs	r2, r0
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 357 0
	b	.L28
.L26:
	.loc 1 355 0
	ldr	r3, .L29
	ldr	r2, .L29
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r0, r1, #5
	ldr	r1, [r7, #4]
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L28:
	.loc 1 357 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	1073771520
.LFE39:
	.size	DAC_DMACmd, .-DAC_DMACmd
	.section	.text.DAC_ITConfig,"ax",%progbits
	.align	2
	.global	DAC_ITConfig
	.code	16
	.thumb_func
	.type	DAC_ITConfig, %function
DAC_ITConfig:
.LFB40:
	.loc 1 390 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #16
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 396 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L32
	.loc 1 399 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r1, [r2]
	ldr	r0, [r7, #8]
	ldr	r2, [r7, #12]
	lsls	r0, r0, r2
	movs	r2, r0
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 406 0
	b	.L34
.L32:
	.loc 1 404 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r2, [r2]
	ldr	r0, [r7, #8]
	ldr	r1, [r7, #12]
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L34:
	.loc 1 406 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
	.word	1073771520
.LFE40:
	.size	DAC_ITConfig, .-DAC_ITConfig
	.section	.text.DAC_GetFlagStatus,"ax",%progbits
	.align	2
	.global	DAC_GetFlagStatus
	.code	16
	.thumb_func
	.type	DAC_GetFlagStatus, %function
DAC_GetFlagStatus:
.LFB41:
	.loc 1 421 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI26:
	sub	sp, sp, #16
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 422 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 429 0
	ldr	r3, .L41
	ldr	r3, [r3, #52]
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	ands	r3, r2
	beq	.L38
	.loc 1 432 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L39
.L38:
	.loc 1 437 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L39:
	.loc 1 440 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 441 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
	.word	1073771520
.LFE41:
	.size	DAC_GetFlagStatus, .-DAC_GetFlagStatus
	.section	.text.DAC_ClearFlag,"ax",%progbits
	.align	2
	.global	DAC_ClearFlag
	.code	16
	.thumb_func
	.type	DAC_ClearFlag, %function
DAC_ClearFlag:
.LFB42:
	.loc 1 454 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	sub	sp, sp, #8
.LCFI30:
	add	r7, sp, #0
.LCFI31:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 460 0
	ldr	r3, .L44
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	str	r2, [r3, #52]
	.loc 1 461 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
	.word	1073771520
.LFE42:
	.size	DAC_ClearFlag, .-DAC_ClearFlag
	.section	.text.DAC_GetITStatus,"ax",%progbits
	.align	2
	.global	DAC_GetITStatus
	.code	16
	.thumb_func
	.type	DAC_GetITStatus, %function
DAC_GetITStatus:
.LFB43:
	.loc 1 476 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI32:
	sub	sp, sp, #16
.LCFI33:
	add	r7, sp, #0
.LCFI34:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 477 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 478 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 485 0
	ldr	r3, .L50
	ldr	r3, [r3]
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 488 0
	ldr	r3, .L50
	ldr	r3, [r3, #52]
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	ands	r3, r2
	beq	.L47
	.loc 1 488 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L47
	.loc 1 491 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L48
.L47:
	.loc 1 496 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L48:
	.loc 1 499 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 500 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1073771520
.LFE43:
	.size	DAC_GetITStatus, .-DAC_GetITStatus
	.section	.text.DAC_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	DAC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	DAC_ClearITPendingBit, %function
DAC_ClearITPendingBit:
.LFB44:
	.loc 1 513 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI35:
	sub	sp, sp, #8
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 519 0
	ldr	r3, .L53
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	str	r2, [r3, #52]
	.loc 1 520 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L54:
	.align	2
.L53:
	.word	1073771520
.LFE44:
	.size	DAC_ClearITPendingBit, .-DAC_ClearITPendingBit
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
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI23-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
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
	.4byte	.LCFI26-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI29-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI32-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI35-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_dac.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x487
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0xc
	.4byte	.LASF51
	.4byte	.LASF52
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
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0xdf
	.4byte	0x8a
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xd2
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0xe1
	.4byte	0xb9
	.uleb128 0x9
	.byte	0x38
	.byte	0x3
	.2byte	0x130
	.4byte	0x15a
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x132
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x133
	.4byte	0x85
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x134
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x135
	.4byte	0x85
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x136
	.4byte	0x85
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x137
	.4byte	0x15a
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x138
	.4byte	0x85
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x139
	.4byte	0x5e
	.byte	0x30
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x13a
	.4byte	0x85
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.4byte	0x5e
	.4byte	0x16a
	.uleb128 0xd
	.4byte	0x7e
	.byte	0x5
	.byte	0
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x13b
	.4byte	0xdd
	.uleb128 0xf
	.byte	0x8
	.byte	0x4
	.byte	0x36
	.4byte	0x197
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x4
	.byte	0x38
	.4byte	0x5e
	.byte	0
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x4
	.byte	0x3b
	.4byte	0x5e
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3d
	.4byte	0x176
	.uleb128 0x11
	.4byte	.LASF53
	.byte	0x1
	.byte	0x95
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0xa8
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x201
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0xa8
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x1
	.byte	0xa8
	.4byte	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF30
	.byte	0x1
	.byte	0xaa
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0x1
	.byte	0xaa
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x197
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x1
	.byte	0xca
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x22b
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x1
	.byte	0xca
	.4byte	0x201
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.byte	0xde
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25d
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0xde
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0xde
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0xf9
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28f
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0xf9
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0xf9
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x16
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d3
	.uleb128 0x17
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x115
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x115
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x12b
	.4byte	0x45
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30c
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x12b
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x12d
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x155
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x341
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x155
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x155
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x16
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x185
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x385
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x185
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x185
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x185
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x19
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1a4
	.4byte	0xa3
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3cd
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1a6
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1c5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x402
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1db
	.4byte	0xae
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x459
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x1db
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x1db
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1dd
	.4byte	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1de
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x200
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x200
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x200
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x8
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
	.uleb128 0x1b
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
	.4byte	0x136
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x48b
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xc5
	.ascii	"DISABLE\000"
	.4byte	0xcb
	.ascii	"ENABLE\000"
	.4byte	0x1a2
	.ascii	"DAC_DeInit\000"
	.4byte	0x1b3
	.ascii	"DAC_Init\000"
	.4byte	0x207
	.ascii	"DAC_StructInit\000"
	.4byte	0x22b
	.ascii	"DAC_Cmd\000"
	.4byte	0x25d
	.ascii	"DAC_SoftwareTriggerCmd\000"
	.4byte	0x28f
	.ascii	"DAC_SetChannel1Data\000"
	.4byte	0x2d3
	.ascii	"DAC_GetDataOutputValue\000"
	.4byte	0x30c
	.ascii	"DAC_DMACmd\000"
	.4byte	0x341
	.ascii	"DAC_ITConfig\000"
	.4byte	0x385
	.ascii	"DAC_GetFlagStatus\000"
	.4byte	0x3cd
	.ascii	"DAC_ClearFlag\000"
	.4byte	0x402
	.ascii	"DAC_GetITStatus\000"
	.4byte	0x459
	.ascii	"DAC_ClearITPendingBit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x122
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x48b
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
	.4byte	0xae
	.ascii	"ITStatus\000"
	.4byte	0xd2
	.ascii	"FunctionalState\000"
	.4byte	0x16a
	.ascii	"DAC_TypeDef\000"
	.4byte	0x197
	.ascii	"DAC_InitTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x7c
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
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
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
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF51:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_dac.c\000"
.LASF53:
	.ascii	"DAC_DeInit\000"
.LASF54:
	.ascii	"DAC_ClearITPendingBit\000"
.LASF43:
	.ascii	"DAC_GetDataOutputValue\000"
.LASF29:
	.ascii	"DAC_InitStruct\000"
.LASF39:
	.ascii	"Data\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF49:
	.ascii	"enablestatus\000"
.LASF25:
	.ascii	"DAC_Trigger\000"
.LASF27:
	.ascii	"DAC_InitTypeDef\000"
.LASF30:
	.ascii	"tmpreg1\000"
.LASF31:
	.ascii	"tmpreg2\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF52:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF19:
	.ascii	"DHR12L1\000"
.LASF38:
	.ascii	"DAC_Align\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF0:
	.ascii	"signed char\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF35:
	.ascii	"NewState\000"
.LASF28:
	.ascii	"DAC_Channel\000"
.LASF24:
	.ascii	"DAC_TypeDef\000"
.LASF17:
	.ascii	"SWTRIGR\000"
.LASF33:
	.ascii	"DAC_StructInit\000"
.LASF21:
	.ascii	"RESERVED\000"
.LASF50:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF26:
	.ascii	"DAC_OutputBuffer\000"
.LASF41:
	.ascii	"DAC_ITConfig\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF44:
	.ascii	"DAC_GetFlagStatus\000"
.LASF40:
	.ascii	"DAC_DMACmd\000"
.LASF48:
	.ascii	"DAC_GetITStatus\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"long long int\000"
.LASF32:
	.ascii	"DAC_Init\000"
.LASF20:
	.ascii	"DHR8R1\000"
.LASF2:
	.ascii	"short int\000"
.LASF47:
	.ascii	"DAC_ClearFlag\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF18:
	.ascii	"DHR12R1\000"
.LASF45:
	.ascii	"DAC_FLAG\000"
.LASF37:
	.ascii	"DAC_SetChannel1Data\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF42:
	.ascii	"DAC_IT\000"
.LASF36:
	.ascii	"DAC_SoftwareTriggerCmd\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF22:
	.ascii	"DOR1\000"
.LASF34:
	.ascii	"DAC_Cmd\000"
.LASF23:
	.ascii	"RESERVED1\000"
.LASF46:
	.ascii	"bitstatus\000"
.LASF11:
	.ascii	"RESET\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
