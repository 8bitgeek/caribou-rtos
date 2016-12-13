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
	.file	"stm32f0xx_rtc.c"
	.text
.Ltext0:
	.section	.text.RTC_DeInit,"ax",%progbits
	.align	2
	.global	RTC_DeInit
	.code	16
	.thumb_func
	.type	RTC_DeInit, %function
RTC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_rtc.c"
	.loc 1 310 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	.loc 1 311 0
	movs	r3, #0
	str	r3, [r7]
	.loc 1 312 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 315 0
	ldr	r3, .L6
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 316 0
	ldr	r3, .L6
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 319 0
	bl	RTC_EnterInitMode
	subs	r3, r0, #0
	bne	.L2
	.loc 1 321 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	b	.L3
.L2:
	.loc 1 326 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3]
	.loc 1 327 0
	ldr	r3, .L6
	ldr	r2, .L6+4
	str	r2, [r3, #4]
	.loc 1 328 0
	ldr	r3, .L6
	ldr	r3, [r3, #8]
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 329 0
	ldr	r3, .L6
	ldr	r2, .L6+8
	str	r2, [r3, #16]
	.loc 1 330 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #28]
	.loc 1 331 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #44]
	.loc 1 332 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #60]
	.loc 1 333 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #68]
	.loc 1 336 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 339 0
	ldr	r3, .L6
	movs	r2, #0
	str	r2, [r3, #64]
	.loc 1 342 0
	bl	RTC_WaitForSynchro
	subs	r3, r0, #0
	bne	.L4
	.loc 1 344 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	b	.L3
.L4:
	.loc 1 348 0
	adds	r3, r7, #7
	movs	r2, #1
	strb	r2, [r3]
.L3:
	.loc 1 354 0
	ldr	r3, .L6
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 356 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 357 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	1073752064
	.word	8449
	.word	8323327
.LFE32:
	.size	RTC_DeInit, .-RTC_DeInit
	.section	.text.RTC_Init,"ax",%progbits
	.align	2
	.global	RTC_Init
	.code	16
	.thumb_func
	.type	RTC_Init, %function
RTC_Init:
.LFB33:
	.loc 1 371 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 372 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 380 0
	ldr	r3, .L12
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 381 0
	ldr	r3, .L12
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 384 0
	bl	RTC_EnterInitMode
	subs	r3, r0, #0
	bne	.L9
	.loc 1 386 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L10
.L9:
	.loc 1 391 0
	ldr	r3, .L12
	ldr	r2, .L12
	ldr	r2, [r2, #8]
	movs	r1, #64
	bics	r2, r1
	str	r2, [r3, #8]
	.loc 1 393 0
	ldr	r2, .L12
	ldr	r3, .L12
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	orrs	r3, r1
	str	r3, [r2, #8]
	.loc 1 396 0
	ldr	r2, .L12
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r2, #16]
	.loc 1 397 0
	ldr	r2, .L12
	ldr	r3, .L12
	ldr	r1, [r3, #16]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #16
	orrs	r3, r1
	str	r3, [r2, #16]
	.loc 1 400 0
	bl	RTC_ExitInitMode
	.loc 1 402 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L10:
	.loc 1 405 0
	ldr	r3, .L12
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 407 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 408 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	1073752064
.LFE33:
	.size	RTC_Init, .-RTC_Init
	.section	.text.RTC_StructInit,"ax",%progbits
	.align	2
	.global	RTC_StructInit
	.code	16
	.thumb_func
	.type	RTC_StructInit, %function
RTC_StructInit:
.LFB34:
	.loc 1 417 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 419 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 422 0
	ldr	r3, [r7, #4]
	movs	r2, #127
	str	r2, [r3, #4]
	.loc 1 425 0
	ldr	r3, [r7, #4]
	movs	r2, #255
	str	r2, [r3, #8]
	.loc 1 426 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	RTC_StructInit, .-RTC_StructInit
	.section	.text.RTC_WriteProtectionCmd,"ax",%progbits
	.align	2
	.global	RTC_WriteProtectionCmd
	.code	16
	.thumb_func
	.type	RTC_WriteProtectionCmd, %function
RTC_WriteProtectionCmd:
.LFB35:
	.loc 1 439 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 443 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L16
	.loc 1 446 0
	ldr	r3, .L19
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 454 0
	b	.L18
.L16:
	.loc 1 451 0
	ldr	r3, .L19
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 452 0
	ldr	r3, .L19
	movs	r2, #83
	str	r2, [r3, #36]
.L18:
	.loc 1 454 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073752064
.LFE35:
	.size	RTC_WriteProtectionCmd, .-RTC_WriteProtectionCmd
	.section	.text.RTC_EnterInitMode,"ax",%progbits
	.align	2
	.global	RTC_EnterInitMode
	.code	16
	.thumb_func
	.type	RTC_EnterInitMode, %function
RTC_EnterInitMode:
.LFB36:
	.loc 1 466 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	.loc 1 467 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 468 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 469 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 472 0
	ldr	r3, .L29
	ldr	r3, [r3, #12]
	movs	r2, #64
	ands	r3, r2
	bne	.L22
	.loc 1 475 0
	ldr	r3, .L29
	movs	r2, #1
	rsbs	r2, r2, #0
	str	r2, [r3, #12]
.L24:
	.loc 1 480 0 discriminator 2
	ldr	r3, .L29
	ldr	r3, [r3, #12]
	movs	r2, #64
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 481 0 discriminator 2
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 482 0 discriminator 2
	ldr	r2, [r7, #4]
	movs	r3, #128
	lsls	r3, r3, #7
	cmp	r2, r3
	beq	.L23
	.loc 1 482 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L24
.L23:
	.loc 1 484 0 is_stmt 1
	ldr	r3, .L29
	ldr	r3, [r3, #12]
	movs	r2, #64
	ands	r3, r2
	beq	.L25
	.loc 1 486 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L27
.L25:
	.loc 1 490 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L27
.L22:
	.loc 1 495 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L27:
	.loc 1 498 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 499 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	1073752064
.LFE36:
	.size	RTC_EnterInitMode, .-RTC_EnterInitMode
	.section	.text.RTC_ExitInitMode,"ax",%progbits
	.align	2
	.global	RTC_ExitInitMode
	.code	16
	.thumb_func
	.type	RTC_ExitInitMode, %function
RTC_ExitInitMode:
.LFB37:
	.loc 1 511 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	.loc 1 513 0
	ldr	r3, .L32
	ldr	r2, .L32
	ldr	r2, [r2, #12]
	movs	r1, #128
	bics	r2, r1
	str	r2, [r3, #12]
	.loc 1 514 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	1073752064
.LFE37:
	.size	RTC_ExitInitMode, .-RTC_ExitInitMode
	.section	.text.RTC_WaitForSynchro,"ax",%progbits
	.align	2
	.global	RTC_WaitForSynchro
	.code	16
	.thumb_func
	.type	RTC_WaitForSynchro, %function
RTC_WaitForSynchro:
.LFB38:
	.loc 1 533 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	.loc 1 534 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 535 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 536 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 538 0
	ldr	r3, .L42
	ldr	r3, [r3, #8]
	movs	r2, #32
	ands	r3, r2
	beq	.L35
	.loc 1 541 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L36
.L35:
	.loc 1 546 0
	ldr	r3, .L42
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 547 0
	ldr	r3, .L42
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 550 0
	ldr	r3, .L42
	ldr	r2, .L42
	ldr	r2, [r2, #12]
	movs	r1, #160
	bics	r2, r1
	str	r2, [r3, #12]
.L38:
	.loc 1 555 0 discriminator 2
	ldr	r3, .L42
	ldr	r3, [r3, #12]
	movs	r2, #32
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 556 0 discriminator 2
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 557 0 discriminator 2
	ldr	r2, [r7, #4]
	movs	r3, #128
	lsls	r3, r3, #8
	cmp	r2, r3
	beq	.L37
	.loc 1 557 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L38
.L37:
	.loc 1 559 0 is_stmt 1
	ldr	r3, .L42
	ldr	r3, [r3, #12]
	movs	r2, #32
	ands	r3, r2
	beq	.L39
	.loc 1 561 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L40
.L39:
	.loc 1 565 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L40:
	.loc 1 569 0
	ldr	r3, .L42
	movs	r2, #255
	str	r2, [r3, #36]
.L36:
	.loc 1 572 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 573 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L43:
	.align	2
.L42:
	.word	1073752064
.LFE38:
	.size	RTC_WaitForSynchro, .-RTC_WaitForSynchro
	.section	.text.RTC_RefClockCmd,"ax",%progbits
	.align	2
	.global	RTC_RefClockCmd
	.code	16
	.thumb_func
	.type	RTC_RefClockCmd, %function
RTC_RefClockCmd:
.LFB39:
	.loc 1 584 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #16
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 585 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 591 0
	ldr	r3, .L50
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 592 0
	ldr	r3, .L50
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 595 0
	bl	RTC_EnterInitMode
	subs	r3, r0, #0
	bne	.L45
	.loc 1 597 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L46
.L45:
	.loc 1 601 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L47
	.loc 1 604 0
	ldr	r3, .L50
	ldr	r2, .L50
	ldr	r2, [r2, #8]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #8]
	b	.L48
.L47:
	.loc 1 609 0
	ldr	r3, .L50
	ldr	r2, .L50
	ldr	r2, [r2, #8]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #8]
.L48:
	.loc 1 612 0
	bl	RTC_ExitInitMode
	.loc 1 614 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L46:
	.loc 1 618 0
	ldr	r3, .L50
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 620 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 621 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1073752064
.LFE39:
	.size	RTC_RefClockCmd, .-RTC_RefClockCmd
	.section	.text.RTC_BypassShadowCmd,"ax",%progbits
	.align	2
	.global	RTC_BypassShadowCmd
	.code	16
	.thumb_func
	.type	RTC_BypassShadowCmd, %function
RTC_BypassShadowCmd:
.LFB40:
	.loc 1 632 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #8
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 637 0
	ldr	r3, .L55
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 638 0
	ldr	r3, .L55
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 640 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L53
	.loc 1 643 0
	ldr	r3, .L55
	ldr	r2, .L55
	ldr	r2, [r2, #8]
	movs	r1, #32
	orrs	r2, r1
	str	r2, [r3, #8]
	b	.L54
.L53:
	.loc 1 648 0
	ldr	r3, .L55
	ldr	r2, .L55
	ldr	r2, [r2, #8]
	movs	r1, #223
	ands	r2, r1
	str	r2, [r3, #8]
.L54:
	.loc 1 652 0
	ldr	r3, .L55
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 653 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L56:
	.align	2
.L55:
	.word	1073752064
.LFE40:
	.size	RTC_BypassShadowCmd, .-RTC_BypassShadowCmd
	.section	.text.RTC_SetTime,"ax",%progbits
	.align	2
	.global	RTC_SetTime
	.code	16
	.thumb_func
	.type	RTC_SetTime, %function
RTC_SetTime:
.LFB41:
	.loc 1 686 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI26:
	sub	sp, sp, #20
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 687 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 688 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 693 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L58
	.loc 1 695 0
	ldr	r3, .L70
	ldr	r3, [r3, #8]
	movs	r2, #64
	ands	r3, r2
	bne	.L60
	.loc 1 702 0
	ldr	r3, [r7]
	movs	r2, #0
	strb	r2, [r3, #3]
	b	.L60
.L58:
	.loc 1 710 0
	ldr	r3, .L70
	ldr	r3, [r3, #8]
	movs	r2, #64
	ands	r3, r2
	beq	.L61
	.loc 1 712 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	str	r3, [r7, #12]
	b	.L60
.L61:
	.loc 1 718 0
	ldr	r3, [r7]
	movs	r2, #0
	strb	r2, [r3, #3]
.L60:
	.loc 1 726 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L62
	.loc 1 728 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	lsls	r2, r3, #16
	.loc 1 729 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	lsls	r3, r3, #8
	.loc 1 728 0
	orrs	r3, r2
	.loc 1 730 0
	ldr	r2, [r7]
	ldrb	r2, [r2, #2]
	.loc 1 729 0
	orrs	r2, r3
	.loc 1 731 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #3]
	lsls	r3, r3, #16
	.loc 1 728 0
	orrs	r3, r2
	str	r3, [r7, #12]
	b	.L63
.L62:
	.loc 1 735 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r4, r3, #16
	.loc 1 736 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r3, r3, #8
	.loc 1 735 0
	orrs	r4, r3
	.loc 1 737 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	.loc 1 736 0
	movs	r2, r4
	orrs	r2, r3
	.loc 1 738 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #3]
	lsls	r3, r3, #16
	.loc 1 735 0
	orrs	r3, r2
	str	r3, [r7, #12]
.L63:
	.loc 1 742 0
	ldr	r3, .L70
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 743 0
	ldr	r3, .L70
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 746 0
	bl	RTC_EnterInitMode
	subs	r3, r0, #0
	bne	.L64
	.loc 1 748 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L65
.L64:
	.loc 1 753 0
	ldr	r3, .L70
	ldr	r2, [r7, #12]
	ldr	r1, .L70+4
	ands	r2, r1
	str	r2, [r3]
	.loc 1 756 0
	bl	RTC_ExitInitMode
	.loc 1 759 0
	ldr	r3, .L70
	ldr	r3, [r3, #8]
	movs	r2, #32
	ands	r3, r2
	bne	.L66
	.loc 1 761 0
	bl	RTC_WaitForSynchro
	subs	r3, r0, #0
	bne	.L67
	.loc 1 763 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L65
.L67:
	.loc 1 767 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L65
.L66:
	.loc 1 772 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L65:
	.loc 1 777 0
	ldr	r3, .L70
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 779 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 780 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L71:
	.align	2
.L70:
	.word	1073752064
	.word	8355711
.LFE41:
	.size	RTC_SetTime, .-RTC_SetTime
	.section	.text.RTC_TimeStructInit,"ax",%progbits
	.align	2
	.global	RTC_TimeStructInit
	.code	16
	.thumb_func
	.type	RTC_TimeStructInit, %function
RTC_TimeStructInit:
.LFB42:
	.loc 1 790 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	sub	sp, sp, #8
.LCFI30:
	add	r7, sp, #0
.LCFI31:
	str	r0, [r7, #4]
	.loc 1 792 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #3]
	.loc 1 793 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 794 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #1]
	.loc 1 795 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #2]
	.loc 1 796 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE42:
	.size	RTC_TimeStructInit, .-RTC_TimeStructInit
	.section	.text.RTC_GetTime,"ax",%progbits
	.align	2
	.global	RTC_GetTime
	.code	16
	.thumb_func
	.type	RTC_GetTime, %function
RTC_GetTime:
.LFB43:
	.loc 1 809 0
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
	.loc 1 810 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 816 0
	ldr	r3, .L76
	ldr	r3, [r3]
	ldr	r2, .L76+4
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 819 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #16
	uxtb	r3, r3
	movs	r2, #63
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3]
	.loc 1 820 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #8
	uxtb	r3, r3
	movs	r2, #127
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #1]
	.loc 1 821 0
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	movs	r2, #127
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #2]
	.loc 1 822 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #16
	uxtb	r3, r3
	movs	r2, #64
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #3]
	.loc 1 825 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L75
	.loc 1 828 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3]
	.loc 1 829 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #1]
	.loc 1 830 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #2]
.L75:
	.loc 1 832 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L77:
	.align	2
.L76:
	.word	1073752064
	.word	8355711
.LFE43:
	.size	RTC_GetTime, .-RTC_GetTime
	.section	.text.RTC_GetSubSecond,"ax",%progbits
	.align	2
	.global	RTC_GetSubSecond
	.code	16
	.thumb_func
	.type	RTC_GetSubSecond, %function
RTC_GetSubSecond:
.LFB44:
	.loc 1 842 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI35:
	sub	sp, sp, #8
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	.loc 1 843 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 846 0
	ldr	r3, .L80
	ldr	r3, [r3, #40]
	str	r3, [r7, #4]
	.loc 1 849 0
	ldr	r3, .L80
	ldr	r3, [r3, #4]
	.loc 1 851 0
	ldr	r3, [r7, #4]
	.loc 1 852 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L81:
	.align	2
.L80:
	.word	1073752064
.LFE44:
	.size	RTC_GetSubSecond, .-RTC_GetSubSecond
	.section	.text.RTC_SetDate,"ax",%progbits
	.align	2
	.global	RTC_SetDate
	.code	16
	.thumb_func
	.type	RTC_SetDate, %function
RTC_SetDate:
.LFB45:
	.loc 1 867 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI38:
	sub	sp, sp, #20
.LCFI39:
	add	r7, sp, #0
.LCFI40:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 868 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 869 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 874 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L83
	.loc 1 874 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r2, r3
	movs	r3, #16
	ands	r3, r2
	beq	.L83
	.loc 1 876 0 is_stmt 1
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r2, #16
	bics	r3, r2
	uxtb	r3, r3
	adds	r3, r3, #10
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #1]
.L83:
	.loc 1 878 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L84
	.loc 1 887 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 889 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	str	r3, [r7, #12]
.L84:
	.loc 1 895 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L85
	.loc 1 897 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #3]
	lsls	r2, r3, #16
	.loc 1 898 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	lsls	r3, r3, #8
	.loc 1 897 0
	orrs	r3, r2
	.loc 1 899 0
	ldr	r2, [r7]
	ldrb	r2, [r2, #2]
	.loc 1 898 0
	orrs	r2, r3
	.loc 1 900 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	lsls	r3, r3, #13
	.loc 1 897 0
	orrs	r3, r2
	str	r3, [r7, #12]
	b	.L86
.L85:
	.loc 1 904 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #3]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r4, r3, #16
	.loc 1 905 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r3, r3, #8
	.loc 1 904 0
	orrs	r4, r3
	.loc 1 906 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	.loc 1 905 0
	movs	r2, r4
	orrs	r2, r3
	.loc 1 907 0
	ldr	r3, [r7]
	ldrb	r3, [r3]
	lsls	r3, r3, #13
	.loc 1 904 0
	orrs	r3, r2
	str	r3, [r7, #12]
.L86:
	.loc 1 911 0
	ldr	r3, .L93
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 912 0
	ldr	r3, .L93
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 915 0
	bl	RTC_EnterInitMode
	subs	r3, r0, #0
	bne	.L87
	.loc 1 917 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L88
.L87:
	.loc 1 922 0
	ldr	r3, .L93
	ldr	r2, [r7, #12]
	ldr	r1, .L93+4
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 925 0
	bl	RTC_ExitInitMode
	.loc 1 928 0
	ldr	r3, .L93
	ldr	r3, [r3, #8]
	movs	r2, #32
	ands	r3, r2
	bne	.L89
	.loc 1 930 0
	bl	RTC_WaitForSynchro
	subs	r3, r0, #0
	bne	.L90
	.loc 1 932 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L88
.L90:
	.loc 1 936 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L88
.L89:
	.loc 1 941 0
	movs	r3, #11
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L88:
	.loc 1 945 0
	ldr	r3, .L93
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 947 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 948 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L94:
	.align	2
.L93:
	.word	1073752064
	.word	16777023
.LFE45:
	.size	RTC_SetDate, .-RTC_SetDate
	.section	.text.RTC_DateStructInit,"ax",%progbits
	.align	2
	.global	RTC_DateStructInit
	.code	16
	.thumb_func
	.type	RTC_DateStructInit, %function
RTC_DateStructInit:
.LFB46:
	.loc 1 958 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI41:
	sub	sp, sp, #8
.LCFI42:
	add	r7, sp, #0
.LCFI43:
	str	r0, [r7, #4]
	.loc 1 960 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 961 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #2]
	.loc 1 962 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #1]
	.loc 1 963 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #3]
	.loc 1 964 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE46:
	.size	RTC_DateStructInit, .-RTC_DateStructInit
	.section	.text.RTC_GetDate,"ax",%progbits
	.align	2
	.global	RTC_GetDate
	.code	16
	.thumb_func
	.type	RTC_GetDate, %function
RTC_GetDate:
.LFB47:
	.loc 1 977 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI44:
	sub	sp, sp, #16
.LCFI45:
	add	r7, sp, #0
.LCFI46:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 978 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 984 0
	ldr	r3, .L99
	ldr	r3, [r3, #4]
	ldr	r2, .L99+4
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 987 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #16
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #3]
	.loc 1 988 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #8
	uxtb	r3, r3
	movs	r2, #31
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #1]
	.loc 1 989 0
	ldr	r3, [r7, #12]
	uxtb	r3, r3
	movs	r2, #63
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #2]
	.loc 1 990 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #13
	uxtb	r3, r3
	movs	r2, #7
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3]
	.loc 1 993 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L98
	.loc 1 996 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #3]
	.loc 1 997 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #1]
	.loc 1 998 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7]
	strb	r2, [r3, #2]
	.loc 1 999 0
	ldr	r3, [r7]
	ldrb	r2, [r3]
	ldr	r3, [r7]
	strb	r2, [r3]
.L98:
	.loc 1 1001 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L100:
	.align	2
.L99:
	.word	1073752064
	.word	16777023
.LFE47:
	.size	RTC_GetDate, .-RTC_GetDate
	.section	.text.RTC_SetAlarm,"ax",%progbits
	.align	2
	.global	RTC_SetAlarm
	.code	16
	.thumb_func
	.type	RTC_SetAlarm, %function
RTC_SetAlarm:
.LFB48:
	.loc 1 1037 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI47:
	sub	sp, sp, #28
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 1038 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 1046 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L102
	.loc 1 1048 0
	ldr	r3, .L110
	ldr	r3, [r3, #8]
	movs	r2, #64
	ands	r3, r2
	bne	.L104
	.loc 1 1055 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #3]
	b	.L104
.L102:
	.loc 1 1072 0
	ldr	r3, .L110
	ldr	r3, [r3, #8]
	movs	r2, #64
	ands	r3, r2
	beq	.L105
	.loc 1 1074 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	str	r3, [r7, #20]
	b	.L106
.L105:
	.loc 1 1080 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #3]
.L106:
	.loc 1 1087 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L107
	.loc 1 1089 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	str	r3, [r7, #20]
	b	.L104
.L107:
	.loc 1 1094 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	str	r3, [r7, #20]
.L104:
	.loc 1 1100 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L108
	.loc 1 1102 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	lsls	r2, r3, #16
	.loc 1 1103 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]
	lsls	r3, r3, #8
	.loc 1 1102 0
	orrs	r3, r2
	.loc 1 1104 0
	ldr	r2, [r7, #4]
	ldrb	r2, [r2, #2]
	.loc 1 1103 0
	orrs	r2, r3
	.loc 1 1105 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #3]
	lsls	r3, r3, #16
	.loc 1 1104 0
	orrs	r2, r3
	.loc 1 1106 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]
	lsls	r3, r3, #24
	.loc 1 1105 0
	orrs	r2, r3
	.loc 1 1107 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	.loc 1 1106 0
	orrs	r2, r3
	.loc 1 1108 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	.loc 1 1102 0
	orrs	r3, r2
	str	r3, [r7, #20]
	b	.L109
.L108:
	.loc 1 1112 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r4, r3, #16
	.loc 1 1113 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r3, r3, #8
	.loc 1 1112 0
	orrs	r4, r3
	.loc 1 1114 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	.loc 1 1113 0
	movs	r2, r4
	orrs	r2, r3
	.loc 1 1115 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #3]
	lsls	r3, r3, #16
	.loc 1 1114 0
	orrs	r2, r3
	movs	r4, r2
	.loc 1 1116 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]
	movs	r0, r3
	bl	RTC_ByteToBcd2
	movs	r3, r0
	lsls	r3, r3, #24
	.loc 1 1115 0
	movs	r2, r4
	orrs	r2, r3
	.loc 1 1117 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	.loc 1 1116 0
	orrs	r2, r3
	.loc 1 1118 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	.loc 1 1112 0
	orrs	r3, r2
	str	r3, [r7, #20]
.L109:
	.loc 1 1122 0
	ldr	r3, .L110
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1123 0
	ldr	r3, .L110
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1126 0
	ldr	r3, .L110
	ldr	r2, [r7, #20]
	str	r2, [r3, #28]
	.loc 1 1129 0
	ldr	r3, .L110
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1130 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L111:
	.align	2
.L110:
	.word	1073752064
.LFE48:
	.size	RTC_SetAlarm, .-RTC_SetAlarm
	.section	.text.RTC_AlarmStructInit,"ax",%progbits
	.align	2
	.global	RTC_AlarmStructInit
	.code	16
	.thumb_func
	.type	RTC_AlarmStructInit, %function
RTC_AlarmStructInit:
.LFB49:
	.loc 1 1141 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI50:
	sub	sp, sp, #8
.LCFI51:
	add	r7, sp, #0
.LCFI52:
	str	r0, [r7, #4]
	.loc 1 1143 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #3]
	.loc 1 1144 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1145 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #1]
	.loc 1 1146 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #2]
	.loc 1 1149 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 1150 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strb	r2, [r3, #12]
	.loc 1 1153 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 1154 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE49:
	.size	RTC_AlarmStructInit, .-RTC_AlarmStructInit
	.section	.text.RTC_GetAlarm,"ax",%progbits
	.align	2
	.global	RTC_GetAlarm
	.code	16
	.thumb_func
	.type	RTC_GetAlarm, %function
RTC_GetAlarm:
.LFB50:
	.loc 1 1170 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI53:
	sub	sp, sp, #24
.LCFI54:
	add	r7, sp, #0
.LCFI55:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 1171 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 1178 0
	ldr	r3, .L116
	ldr	r3, [r3, #28]
	str	r3, [r7, #20]
	.loc 1 1182 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #16
	.loc 1 1181 0
	uxtb	r3, r3
	movs	r2, #63
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	.loc 1 1184 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #8
	.loc 1 1183 0
	uxtb	r3, r3
	movs	r2, #127
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #1]
	.loc 1 1185 0
	ldr	r3, [r7, #20]
	uxtb	r3, r3
	movs	r2, #127
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #2]
	.loc 1 1187 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #16
	uxtb	r3, r3
	movs	r2, #64
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #3]
	.loc 1 1188 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #24
	uxtb	r3, r3
	movs	r2, #63
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #12]
	.loc 1 1189 0
	ldr	r2, [r7, #20]
	movs	r3, #128
	lsls	r3, r3, #23
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 1190 0
	ldr	r3, [r7, #20]
	ldr	r2, .L116+4
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 1192 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L115
	.loc 1 1194 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	.loc 1 1196 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #1]
	.loc 1 1198 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #2]
	.loc 1 1200 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #12]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #12]
.L115:
	.loc 1 1202 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L117:
	.align	2
.L116:
	.word	1073752064
	.word	-2139062144
.LFE50:
	.size	RTC_GetAlarm, .-RTC_GetAlarm
	.section	.text.RTC_AlarmCmd,"ax",%progbits
	.align	2
	.global	RTC_AlarmCmd
	.code	16
	.thumb_func
	.type	RTC_AlarmCmd, %function
RTC_AlarmCmd:
.LFB51:
	.loc 1 1216 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI56:
	sub	sp, sp, #24
.LCFI57:
	add	r7, sp, #0
.LCFI58:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1217 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1218 0
	movs	r3, #0
	str	r3, [r7, #16]
	.loc 1 1219 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1226 0
	ldr	r3, .L125
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1227 0
	ldr	r3, .L125
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1230 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L119
	.loc 1 1232 0
	ldr	r3, .L125
	ldr	r2, .L125
	ldr	r1, [r2, #8]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 1234 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L120
.L119:
	.loc 1 1239 0
	ldr	r3, .L125
	ldr	r2, .L125
	ldr	r2, [r2, #8]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #8]
.L122:
	.loc 1 1244 0 discriminator 2
	ldr	r3, .L125
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #8
	ands	r3, r2
	str	r3, [r7, #16]
	.loc 1 1245 0 discriminator 2
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
	.loc 1 1246 0 discriminator 2
	ldr	r2, [r7, #12]
	movs	r3, #128
	lsls	r3, r3, #7
	cmp	r2, r3
	beq	.L121
	.loc 1 1246 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L122
.L121:
	.loc 1 1248 0 is_stmt 1
	ldr	r3, .L125
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #8
	ands	r3, r2
	bne	.L123
	.loc 1 1250 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L120
.L123:
	.loc 1 1254 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L120:
	.loc 1 1259 0
	ldr	r3, .L125
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1261 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1262 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L126:
	.align	2
.L125:
	.word	1073752064
.LFE51:
	.size	RTC_AlarmCmd, .-RTC_AlarmCmd
	.section	.text.RTC_AlarmSubSecondConfig,"ax",%progbits
	.align	2
	.global	RTC_AlarmSubSecondConfig
	.code	16
	.thumb_func
	.type	RTC_AlarmSubSecondConfig, %function
RTC_AlarmSubSecondConfig:
.LFB52:
	.loc 1 1309 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI59:
	sub	sp, sp, #24
.LCFI60:
	add	r7, sp, #0
.LCFI61:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1310 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 1318 0
	ldr	r3, .L128
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1319 0
	ldr	r3, .L128
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1322 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r2, r3, #24
	ldr	r3, [r7, #8]
	orrs	r3, r2
	str	r3, [r7, #20]
	.loc 1 1325 0
	ldr	r3, .L128
	ldr	r2, [r7, #20]
	str	r2, [r3, #68]
	.loc 1 1328 0
	ldr	r3, .L128
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1330 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L129:
	.align	2
.L128:
	.word	1073752064
.LFE52:
	.size	RTC_AlarmSubSecondConfig, .-RTC_AlarmSubSecondConfig
	.section	.text.RTC_GetAlarmSubSecond,"ax",%progbits
	.align	2
	.global	RTC_GetAlarmSubSecond
	.code	16
	.thumb_func
	.type	RTC_GetAlarmSubSecond, %function
RTC_GetAlarmSubSecond:
.LFB53:
	.loc 1 1341 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI62:
	sub	sp, sp, #16
.LCFI63:
	add	r7, sp, #0
.LCFI64:
	str	r0, [r7, #4]
	.loc 1 1342 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1345 0
	ldr	r3, .L132
	ldr	r3, [r3, #68]
	lsls	r3, r3, #17
	lsrs	r3, r3, #17
	str	r3, [r7, #12]
	.loc 1 1347 0
	ldr	r3, [r7, #12]
	.loc 1 1348 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L133:
	.align	2
.L132:
	.word	1073752064
.LFE53:
	.size	RTC_GetAlarmSubSecond, .-RTC_GetAlarmSubSecond
	.section	.text.RTC_DayLightSavingConfig,"ax",%progbits
	.align	2
	.global	RTC_DayLightSavingConfig
	.code	16
	.thumb_func
	.type	RTC_DayLightSavingConfig, %function
RTC_DayLightSavingConfig:
.LFB54:
	.loc 1 1383 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI65:
	sub	sp, sp, #8
.LCFI66:
	add	r7, sp, #0
.LCFI67:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1389 0
	ldr	r3, .L135
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1390 0
	ldr	r3, .L135
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1393 0
	ldr	r3, .L135
	ldr	r2, .L135
	ldr	r2, [r2, #8]
	ldr	r1, .L135+4
	ands	r2, r1
	str	r2, [r3, #8]
	.loc 1 1396 0
	ldr	r3, .L135
	ldr	r2, .L135
	ldr	r1, [r2, #8]
	ldr	r0, [r7, #4]
	ldr	r2, [r7]
	orrs	r2, r0
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 1399 0
	ldr	r3, .L135
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1400 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L136:
	.align	2
.L135:
	.word	1073752064
	.word	-262145
.LFE54:
	.size	RTC_DayLightSavingConfig, .-RTC_DayLightSavingConfig
	.section	.text.RTC_GetStoreOperation,"ax",%progbits
	.align	2
	.global	RTC_GetStoreOperation
	.code	16
	.thumb_func
	.type	RTC_GetStoreOperation, %function
RTC_GetStoreOperation:
.LFB55:
	.loc 1 1410 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI68:
	add	r7, sp, #0
.LCFI69:
	.loc 1 1411 0
	ldr	r3, .L139
	ldr	r2, [r3, #8]
	movs	r3, #128
	lsls	r3, r3, #11
	ands	r3, r2
	.loc 1 1412 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L140:
	.align	2
.L139:
	.word	1073752064
.LFE55:
	.size	RTC_GetStoreOperation, .-RTC_GetStoreOperation
	.section	.text.RTC_OutputConfig,"ax",%progbits
	.align	2
	.global	RTC_OutputConfig
	.code	16
	.thumb_func
	.type	RTC_OutputConfig, %function
RTC_OutputConfig:
.LFB56:
	.loc 1 1446 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI70:
	sub	sp, sp, #8
.LCFI71:
	add	r7, sp, #0
.LCFI72:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1452 0
	ldr	r3, .L142
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1453 0
	ldr	r3, .L142
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1456 0
	ldr	r3, .L142
	ldr	r2, .L142
	ldr	r2, [r2, #8]
	ldr	r1, .L142+4
	ands	r2, r1
	str	r2, [r3, #8]
	.loc 1 1459 0
	ldr	r3, .L142
	ldr	r2, .L142
	ldr	r1, [r2, #8]
	ldr	r0, [r7, #4]
	ldr	r2, [r7]
	orrs	r2, r0
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 1462 0
	ldr	r3, .L142
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1463 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L143:
	.align	2
.L142:
	.word	1073752064
	.word	-7340033
.LFE56:
	.size	RTC_OutputConfig, .-RTC_OutputConfig
	.section	.text.RTC_CalibOutputCmd,"ax",%progbits
	.align	2
	.global	RTC_CalibOutputCmd
	.code	16
	.thumb_func
	.type	RTC_CalibOutputCmd, %function
RTC_CalibOutputCmd:
.LFB57:
	.loc 1 1489 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI73:
	sub	sp, sp, #8
.LCFI74:
	add	r7, sp, #0
.LCFI75:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1494 0
	ldr	r3, .L147
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1495 0
	ldr	r3, .L147
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1497 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L145
	.loc 1 1500 0
	ldr	r3, .L147
	ldr	r2, .L147
	ldr	r2, [r2, #8]
	movs	r1, #128
	lsls	r1, r1, #16
	orrs	r2, r1
	str	r2, [r3, #8]
	b	.L146
.L145:
	.loc 1 1505 0
	ldr	r3, .L147
	ldr	r2, .L147
	ldr	r2, [r2, #8]
	ldr	r1, .L147+4
	ands	r2, r1
	str	r2, [r3, #8]
.L146:
	.loc 1 1509 0
	ldr	r3, .L147
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1510 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L148:
	.align	2
.L147:
	.word	1073752064
	.word	-8388609
.LFE57:
	.size	RTC_CalibOutputCmd, .-RTC_CalibOutputCmd
	.section	.text.RTC_CalibOutputConfig,"ax",%progbits
	.align	2
	.global	RTC_CalibOutputConfig
	.code	16
	.thumb_func
	.type	RTC_CalibOutputConfig, %function
RTC_CalibOutputConfig:
.LFB58:
	.loc 1 1521 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI76:
	sub	sp, sp, #8
.LCFI77:
	add	r7, sp, #0
.LCFI78:
	str	r0, [r7, #4]
	.loc 1 1526 0
	ldr	r3, .L150
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1527 0
	ldr	r3, .L150
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1530 0
	ldr	r3, .L150
	ldr	r2, .L150
	ldr	r2, [r2, #8]
	ldr	r1, .L150+4
	ands	r2, r1
	str	r2, [r3, #8]
	.loc 1 1533 0
	ldr	r3, .L150
	ldr	r2, .L150
	ldr	r1, [r2, #8]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 1536 0
	ldr	r3, .L150
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1537 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L151:
	.align	2
.L150:
	.word	1073752064
	.word	-524289
.LFE58:
	.size	RTC_CalibOutputConfig, .-RTC_CalibOutputConfig
	.section	.text.RTC_SmoothCalibConfig,"ax",%progbits
	.align	2
	.global	RTC_SmoothCalibConfig
	.code	16
	.thumb_func
	.type	RTC_SmoothCalibConfig, %function
RTC_SmoothCalibConfig:
.LFB59:
	.loc 1 1559 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI79:
	sub	sp, sp, #24
.LCFI80:
	add	r7, sp, #0
.LCFI81:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 1560 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1561 0
	movs	r3, #0
	str	r3, [r7, #16]
	.loc 1 1569 0
	ldr	r3, .L159
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1570 0
	ldr	r3, .L159
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1573 0
	ldr	r3, .L159
	ldr	r2, [r3, #12]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	beq	.L153
	.loc 1 1576 0
	b	.L154
.L155:
	.loc 1 1578 0
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L154:
	.loc 1 1576 0
	ldr	r3, .L159
	ldr	r2, [r3, #12]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	beq	.L153
	.loc 1 1576 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #16]
	movs	r3, #128
	lsls	r3, r3, #5
	cmp	r2, r3
	bne	.L155
.L153:
	.loc 1 1583 0 is_stmt 1
	ldr	r3, .L159
	ldr	r2, [r3, #12]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	bne	.L156
	.loc 1 1586 0
	ldr	r3, .L159
	ldr	r1, [r7, #12]
	ldr	r2, [r7, #8]
	orrs	r1, r2
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #60]
	.loc 1 1588 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L157
.L156:
	.loc 1 1592 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L157:
	.loc 1 1596 0
	ldr	r3, .L159
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1598 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1599 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L160:
	.align	2
.L159:
	.word	1073752064
.LFE59:
	.size	RTC_SmoothCalibConfig, .-RTC_SmoothCalibConfig
	.section	.text.RTC_TimeStampCmd,"ax",%progbits
	.align	2
	.global	RTC_TimeStampCmd
	.code	16
	.thumb_func
	.type	RTC_TimeStampCmd, %function
RTC_TimeStampCmd:
.LFB60:
	.loc 1 1633 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI82:
	sub	sp, sp, #16
.LCFI83:
	add	r7, sp, #0
.LCFI84:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1634 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1641 0
	ldr	r3, .L164
	ldr	r3, [r3, #8]
	ldr	r2, .L164+4
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 1644 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L162
	.loc 1 1646 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	orrs	r3, r2
	movs	r2, #128
	lsls	r2, r2, #4
	orrs	r3, r2
	str	r3, [r7, #12]
	b	.L163
.L162:
	.loc 1 1650 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
.L163:
	.loc 1 1654 0
	ldr	r3, .L164
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 1655 0
	ldr	r3, .L164
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 1658 0
	ldr	r3, .L164
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	.loc 1 1661 0
	ldr	r3, .L164
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 1662 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L165:
	.align	2
.L164:
	.word	1073752064
	.word	-2057
.LFE60:
	.size	RTC_TimeStampCmd, .-RTC_TimeStampCmd
	.section	.text.RTC_GetTimeStamp,"ax",%progbits
	.align	2
	.global	RTC_GetTimeStamp
	.code	16
	.thumb_func
	.type	RTC_GetTimeStamp, %function
RTC_GetTimeStamp:
.LFB61:
	.loc 1 1678 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI85:
	sub	sp, sp, #24
.LCFI86:
	add	r7, sp, #0
.LCFI87:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 1679 0
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	.loc 1 1685 0
	ldr	r3, .L169
	ldr	r3, [r3, #48]
	ldr	r2, .L169+4
	ands	r3, r2
	str	r3, [r7, #20]
	.loc 1 1686 0
	ldr	r3, .L169
	ldr	r3, [r3, #52]
	ldr	r2, .L169+8
	ands	r3, r2
	str	r3, [r7, #16]
	.loc 1 1689 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #16
	uxtb	r3, r3
	movs	r2, #63
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3]
	.loc 1 1690 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #8
	uxtb	r3, r3
	movs	r2, #127
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3, #1]
	.loc 1 1691 0
	ldr	r3, [r7, #20]
	uxtb	r3, r3
	movs	r2, #127
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3, #2]
	.loc 1 1692 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #16
	uxtb	r3, r3
	movs	r2, #64
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3, #3]
	.loc 1 1695 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #3]
	.loc 1 1696 0
	ldr	r3, [r7, #16]
	lsrs	r3, r3, #8
	uxtb	r3, r3
	movs	r2, #31
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #1]
	.loc 1 1697 0
	ldr	r3, [r7, #16]
	uxtb	r3, r3
	movs	r2, #63
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #2]
	.loc 1 1698 0
	ldr	r3, [r7, #16]
	lsrs	r3, r3, #13
	uxtb	r3, r3
	movs	r2, #7
	ands	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3]
	.loc 1 1701 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L168
	.loc 1 1704 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3]
	.loc 1 1705 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3, #1]
	.loc 1 1706 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #8]
	strb	r2, [r3, #2]
	.loc 1 1709 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #1]
	.loc 1 1710 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3, #2]
	.loc 1 1711 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r0, r3
	bl	RTC_Bcd2ToByte
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #4]
	strb	r2, [r3]
.L168:
	.loc 1 1713 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L170:
	.align	2
.L169:
	.word	1073752064
	.word	8355711
	.word	16777023
.LFE61:
	.size	RTC_GetTimeStamp, .-RTC_GetTimeStamp
	.section	.text.RTC_GetTimeStampSubSecond,"ax",%progbits
	.align	2
	.global	RTC_GetTimeStampSubSecond
	.code	16
	.thumb_func
	.type	RTC_GetTimeStampSubSecond, %function
RTC_GetTimeStampSubSecond:
.LFB62:
	.loc 1 1721 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI88:
	add	r7, sp, #0
.LCFI89:
	.loc 1 1723 0
	ldr	r3, .L173
	ldr	r3, [r3, #56]
	.loc 1 1724 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L174:
	.align	2
.L173:
	.word	1073752064
.LFE62:
	.size	RTC_GetTimeStampSubSecond, .-RTC_GetTimeStampSubSecond
	.section	.text.RTC_TamperTriggerConfig,"ax",%progbits
	.align	2
	.global	RTC_TamperTriggerConfig
	.code	16
	.thumb_func
	.type	RTC_TamperTriggerConfig, %function
RTC_TamperTriggerConfig:
.LFB63:
	.loc 1 1759 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI90:
	sub	sp, sp, #8
.LCFI91:
	add	r7, sp, #0
.LCFI92:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1764 0
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L176
	.loc 1 1767 0
	ldr	r3, .L179
	ldr	r2, .L179
	ldr	r2, [r2, #64]
	ldr	r1, [r7, #4]
	lsls	r1, r1, #1
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #64]
	.loc 1 1774 0
	b	.L178
.L176:
	.loc 1 1772 0
	ldr	r3, .L179
	ldr	r2, .L179
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	lsls	r2, r2, #1
	orrs	r2, r1
	str	r2, [r3, #64]
.L178:
	.loc 1 1774 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L180:
	.align	2
.L179:
	.word	1073752064
.LFE63:
	.size	RTC_TamperTriggerConfig, .-RTC_TamperTriggerConfig
	.section	.text.RTC_TamperCmd,"ax",%progbits
	.align	2
	.global	RTC_TamperCmd
	.code	16
	.thumb_func
	.type	RTC_TamperCmd, %function
RTC_TamperCmd:
.LFB64:
	.loc 1 1788 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI93:
	sub	sp, sp, #8
.LCFI94:
	add	r7, sp, #0
.LCFI95:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1793 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L182
	.loc 1 1796 0
	ldr	r3, .L185
	ldr	r2, .L185
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #64]
	.loc 1 1803 0
	b	.L184
.L182:
	.loc 1 1801 0
	ldr	r3, .L185
	ldr	r2, .L185
	ldr	r2, [r2, #64]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #64]
.L184:
	.loc 1 1803 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L186:
	.align	2
.L185:
	.word	1073752064
.LFE64:
	.size	RTC_TamperCmd, .-RTC_TamperCmd
	.section	.text.RTC_TamperFilterConfig,"ax",%progbits
	.align	2
	.global	RTC_TamperFilterConfig
	.code	16
	.thumb_func
	.type	RTC_TamperFilterConfig, %function
RTC_TamperFilterConfig:
.LFB65:
	.loc 1 1819 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI96:
	sub	sp, sp, #8
.LCFI97:
	add	r7, sp, #0
.LCFI98:
	str	r0, [r7, #4]
	.loc 1 1824 0
	ldr	r3, .L188
	ldr	r2, .L188
	ldr	r2, [r2, #64]
	ldr	r1, .L188+4
	ands	r2, r1
	str	r2, [r3, #64]
	.loc 1 1827 0
	ldr	r3, .L188
	ldr	r2, .L188
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #64]
	.loc 1 1828 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L189:
	.align	2
.L188:
	.word	1073752064
	.word	-6145
.LFE65:
	.size	RTC_TamperFilterConfig, .-RTC_TamperFilterConfig
	.section	.text.RTC_TamperSamplingFreqConfig,"ax",%progbits
	.align	2
	.global	RTC_TamperSamplingFreqConfig
	.code	16
	.thumb_func
	.type	RTC_TamperSamplingFreqConfig, %function
RTC_TamperSamplingFreqConfig:
.LFB66:
	.loc 1 1853 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI99:
	sub	sp, sp, #8
.LCFI100:
	add	r7, sp, #0
.LCFI101:
	str	r0, [r7, #4]
	.loc 1 1858 0
	ldr	r3, .L191
	ldr	r2, .L191
	ldr	r2, [r2, #64]
	ldr	r1, .L191+4
	ands	r2, r1
	str	r2, [r3, #64]
	.loc 1 1861 0
	ldr	r3, .L191
	ldr	r2, .L191
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #64]
	.loc 1 1862 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L192:
	.align	2
.L191:
	.word	1073752064
	.word	-1793
.LFE66:
	.size	RTC_TamperSamplingFreqConfig, .-RTC_TamperSamplingFreqConfig
	.section	.text.RTC_TamperPinsPrechargeDuration,"ax",%progbits
	.align	2
	.global	RTC_TamperPinsPrechargeDuration
	.code	16
	.thumb_func
	.type	RTC_TamperPinsPrechargeDuration, %function
RTC_TamperPinsPrechargeDuration:
.LFB67:
	.loc 1 1876 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI102:
	sub	sp, sp, #8
.LCFI103:
	add	r7, sp, #0
.LCFI104:
	str	r0, [r7, #4]
	.loc 1 1881 0
	ldr	r3, .L194
	ldr	r2, .L194
	ldr	r2, [r2, #64]
	ldr	r1, .L194+4
	ands	r2, r1
	str	r2, [r3, #64]
	.loc 1 1884 0
	ldr	r3, .L194
	ldr	r2, .L194
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #64]
	.loc 1 1885 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L195:
	.align	2
.L194:
	.word	1073752064
	.word	-24577
.LFE67:
	.size	RTC_TamperPinsPrechargeDuration, .-RTC_TamperPinsPrechargeDuration
	.section	.text.RTC_TimeStampOnTamperDetectionCmd,"ax",%progbits
	.align	2
	.global	RTC_TimeStampOnTamperDetectionCmd
	.code	16
	.thumb_func
	.type	RTC_TimeStampOnTamperDetectionCmd, %function
RTC_TimeStampOnTamperDetectionCmd:
.LFB68:
	.loc 1 1896 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI105:
	sub	sp, sp, #8
.LCFI106:
	add	r7, sp, #0
.LCFI107:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1900 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L197
	.loc 1 1903 0
	ldr	r3, .L200
	ldr	r2, .L200
	ldr	r2, [r2, #64]
	movs	r1, #128
	orrs	r2, r1
	str	r2, [r3, #64]
	.loc 1 1910 0
	b	.L199
.L197:
	.loc 1 1908 0
	ldr	r3, .L200
	ldr	r2, .L200
	ldr	r2, [r2, #64]
	movs	r1, #128
	bics	r2, r1
	str	r2, [r3, #64]
.L199:
	.loc 1 1910 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L201:
	.align	2
.L200:
	.word	1073752064
.LFE68:
	.size	RTC_TimeStampOnTamperDetectionCmd, .-RTC_TimeStampOnTamperDetectionCmd
	.section	.text.RTC_TamperPullUpCmd,"ax",%progbits
	.align	2
	.global	RTC_TamperPullUpCmd
	.code	16
	.thumb_func
	.type	RTC_TamperPullUpCmd, %function
RTC_TamperPullUpCmd:
.LFB69:
	.loc 1 1919 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI108:
	sub	sp, sp, #8
.LCFI109:
	add	r7, sp, #0
.LCFI110:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1923 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L203
	.loc 1 1926 0
	ldr	r3, .L206
	ldr	r2, .L206
	ldr	r2, [r2, #64]
	ldr	r1, .L206+4
	ands	r2, r1
	str	r2, [r3, #64]
	.loc 1 1933 0
	b	.L205
.L203:
	.loc 1 1931 0
	ldr	r3, .L206
	ldr	r2, .L206
	ldr	r2, [r2, #64]
	movs	r1, #128
	lsls	r1, r1, #8
	orrs	r2, r1
	str	r2, [r3, #64]
.L205:
	.loc 1 1933 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L207:
	.align	2
.L206:
	.word	1073752064
	.word	-32769
.LFE69:
	.size	RTC_TamperPullUpCmd, .-RTC_TamperPullUpCmd
	.section	.text.RTC_WriteBackupRegister,"ax",%progbits
	.align	2
	.global	RTC_WriteBackupRegister
	.code	16
	.thumb_func
	.type	RTC_WriteBackupRegister, %function
RTC_WriteBackupRegister:
.LFB70:
	.loc 1 1960 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI111:
	sub	sp, sp, #16
.LCFI112:
	add	r7, sp, #0
.LCFI113:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1961 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1966 0
	ldr	r3, .L209
	str	r3, [r7, #12]
	.loc 1 1967 0
	ldr	r3, [r7, #4]
	lsls	r2, r3, #2
	ldr	r3, [r7, #12]
	adds	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 1970 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 1971 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L210:
	.align	2
.L209:
	.word	1073752144
.LFE70:
	.size	RTC_WriteBackupRegister, .-RTC_WriteBackupRegister
	.section	.text.RTC_ReadBackupRegister,"ax",%progbits
	.align	2
	.global	RTC_ReadBackupRegister
	.code	16
	.thumb_func
	.type	RTC_ReadBackupRegister, %function
RTC_ReadBackupRegister:
.LFB71:
	.loc 1 1981 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI114:
	sub	sp, sp, #16
.LCFI115:
	add	r7, sp, #0
.LCFI116:
	str	r0, [r7, #4]
	.loc 1 1982 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1987 0
	ldr	r3, .L213
	str	r3, [r7, #12]
	.loc 1 1988 0
	ldr	r3, [r7, #4]
	lsls	r2, r3, #2
	ldr	r3, [r7, #12]
	adds	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 1991 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	.loc 1 1992 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L214:
	.align	2
.L213:
	.word	1073752144
.LFE71:
	.size	RTC_ReadBackupRegister, .-RTC_ReadBackupRegister
	.section	.text.RTC_OutputTypeConfig,"ax",%progbits
	.align	2
	.global	RTC_OutputTypeConfig
	.code	16
	.thumb_func
	.type	RTC_OutputTypeConfig, %function
RTC_OutputTypeConfig:
.LFB72:
	.loc 1 2021 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI117:
	sub	sp, sp, #8
.LCFI118:
	add	r7, sp, #0
.LCFI119:
	str	r0, [r7, #4]
	.loc 1 2025 0
	ldr	r3, .L216
	ldr	r2, .L216
	ldr	r2, [r2, #64]
	ldr	r1, .L216+4
	ands	r2, r1
	str	r2, [r3, #64]
	.loc 1 2026 0
	ldr	r3, .L216
	ldr	r2, .L216
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #64]
	.loc 1 2027 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L217:
	.align	2
.L216:
	.word	1073752064
	.word	-262145
.LFE72:
	.size	RTC_OutputTypeConfig, .-RTC_OutputTypeConfig
	.section	.text.RTC_SynchroShiftConfig,"ax",%progbits
	.align	2
	.global	RTC_SynchroShiftConfig
	.code	16
	.thumb_func
	.type	RTC_SynchroShiftConfig, %function
RTC_SynchroShiftConfig:
.LFB73:
	.loc 1 2059 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI120:
	sub	sp, sp, #16
.LCFI121:
	add	r7, sp, #0
.LCFI122:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 2060 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2061 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 2068 0
	ldr	r3, .L229
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 2069 0
	ldr	r3, .L229
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 2072 0
	ldr	r3, .L229
	ldr	r3, [r3, #12]
	movs	r2, #8
	ands	r3, r2
	beq	.L219
	.loc 1 2075 0
	b	.L220
.L221:
	.loc 1 2077 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L220:
	.loc 1 2075 0
	ldr	r3, .L229
	ldr	r3, [r3, #12]
	movs	r2, #8
	ands	r3, r2
	beq	.L219
	.loc 1 2075 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #8]
	movs	r3, #128
	lsls	r3, r3, #5
	cmp	r2, r3
	bne	.L221
.L219:
	.loc 1 2082 0 is_stmt 1
	ldr	r3, .L229
	ldr	r3, [r3, #12]
	movs	r2, #8
	ands	r3, r2
	bne	.L222
	.loc 1 2085 0
	ldr	r3, .L229
	ldr	r3, [r3, #8]
	movs	r2, #16
	ands	r3, r2
	bne	.L223
	.loc 1 2088 0
	ldr	r3, .L229
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #44]
	.loc 1 2090 0
	bl	RTC_WaitForSynchro
	subs	r3, r0, #0
	bne	.L224
	.loc 1 2092 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L227
.L224:
	.loc 1 2096 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L227
.L223:
	.loc 1 2101 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	b	.L227
.L222:
	.loc 1 2106 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L227:
	.loc 1 2110 0
	ldr	r3, .L229
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 2112 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 2113 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L230:
	.align	2
.L229:
	.word	1073752064
.LFE73:
	.size	RTC_SynchroShiftConfig, .-RTC_SynchroShiftConfig
	.section	.text.RTC_ITConfig,"ax",%progbits
	.align	2
	.global	RTC_ITConfig
	.code	16
	.thumb_func
	.type	RTC_ITConfig, %function
RTC_ITConfig:
.LFB74:
	.loc 1 2168 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI123:
	sub	sp, sp, #8
.LCFI124:
	add	r7, sp, #0
.LCFI125:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 2174 0
	ldr	r3, .L234
	movs	r2, #202
	str	r2, [r3, #36]
	.loc 1 2175 0
	ldr	r3, .L234
	movs	r2, #83
	str	r2, [r3, #36]
	.loc 1 2177 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L232
	.loc 1 2180 0
	ldr	r3, .L234
	ldr	r2, .L234
	ldr	r1, [r2, #8]
	ldr	r2, [r7, #4]
	movs	r0, #4
	bics	r2, r0
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 2182 0
	ldr	r3, .L234
	ldr	r2, .L234
	ldr	r1, [r2, #64]
	ldr	r2, [r7, #4]
	movs	r0, #4
	ands	r2, r0
	orrs	r2, r1
	str	r2, [r3, #64]
	b	.L233
.L232:
	.loc 1 2187 0
	ldr	r3, .L234
	ldr	r2, .L234
	ldr	r2, [r2, #8]
	ldr	r1, [r7, #4]
	movs	r0, #4
	bics	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #8]
	.loc 1 2189 0
	ldr	r3, .L234
	ldr	r2, .L234
	ldr	r2, [r2, #64]
	ldr	r1, [r7, #4]
	movs	r0, #4
	ands	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #64]
.L233:
	.loc 1 2192 0
	ldr	r3, .L234
	movs	r2, #255
	str	r2, [r3, #36]
	.loc 1 2193 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L235:
	.align	2
.L234:
	.word	1073752064
.LFE74:
	.size	RTC_ITConfig, .-RTC_ITConfig
	.section	.text.RTC_GetFlagStatus,"ax",%progbits
	.align	2
	.global	RTC_GetFlagStatus
	.code	16
	.thumb_func
	.type	RTC_GetFlagStatus, %function
RTC_GetFlagStatus:
.LFB75:
	.loc 1 2212 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI126:
	sub	sp, sp, #16
.LCFI127:
	add	r7, sp, #0
.LCFI128:
	str	r0, [r7, #4]
	.loc 1 2213 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2214 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 2220 0
	ldr	r3, .L240
	ldr	r3, [r3, #12]
	ldr	r2, .L240+4
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 2223 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L237
	.loc 1 2225 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L238
.L237:
	.loc 1 2229 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L238:
	.loc 1 2231 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 2232 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L241:
	.align	2
.L240:
	.word	1073752064
	.word	129400
.LFE75:
	.size	RTC_GetFlagStatus, .-RTC_GetFlagStatus
	.section	.text.RTC_ClearFlag,"ax",%progbits
	.align	2
	.global	RTC_ClearFlag
	.code	16
	.thumb_func
	.type	RTC_ClearFlag, %function
RTC_ClearFlag:
.LFB76:
	.loc 1 2248 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI129:
	sub	sp, sp, #8
.LCFI130:
	add	r7, sp, #0
.LCFI131:
	str	r0, [r7, #4]
	.loc 1 2253 0
	ldr	r3, .L243
	ldr	r2, [r7, #4]
	ldr	r1, .L243+4
	ands	r2, r1
	movs	r1, #128
	orrs	r2, r1
	mvns	r1, r2
	ldr	r2, .L243
	ldr	r2, [r2, #12]
	movs	r0, #128
	ands	r2, r0
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 2254 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L244:
	.align	2
.L243:
	.word	1073752064
	.word	130943
.LFE76:
	.size	RTC_ClearFlag, .-RTC_ClearFlag
	.section	.text.RTC_GetITStatus,"ax",%progbits
	.align	2
	.global	RTC_GetITStatus
	.code	16
	.thumb_func
	.type	RTC_GetITStatus, %function
RTC_GetITStatus:
.LFB77:
	.loc 1 2268 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI132:
	sub	sp, sp, #24
.LCFI133:
	add	r7, sp, #0
.LCFI134:
	str	r0, [r7, #4]
	.loc 1 2269 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2270 0
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 2276 0
	ldr	r3, .L249
	ldr	r3, [r3, #64]
	movs	r2, #4
	ands	r3, r2
	str	r3, [r7, #16]
	.loc 1 2279 0
	ldr	r3, .L249
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #4]
	ands	r2, r3
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #18
	ldr	r1, [r7, #4]
	lsrs	r1, r1, r3
	movs	r3, r1
	lsrs	r3, r3, #15
	ldr	r1, [r7, #16]
	ands	r3, r1
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 2282 0
	ldr	r3, .L249
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #4
	ands	r3, r2
	str	r3, [r7, #16]
	.loc 1 2285 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L246
	.loc 1 2285 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #16]
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	beq	.L246
	.loc 1 2287 0 is_stmt 1
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L247
.L246:
	.loc 1 2291 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L247:
	.loc 1 2293 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 2294 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L250:
	.align	2
.L249:
	.word	1073752064
.LFE77:
	.size	RTC_GetITStatus, .-RTC_GetITStatus
	.section	.text.RTC_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	RTC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	RTC_ClearITPendingBit, %function
RTC_ClearITPendingBit:
.LFB78:
	.loc 1 2308 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI135:
	sub	sp, sp, #16
.LCFI136:
	add	r7, sp, #0
.LCFI137:
	str	r0, [r7, #4]
	.loc 1 2309 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 2315 0
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #4
	str	r3, [r7, #12]
	.loc 1 2318 0
	ldr	r3, .L252
	ldr	r2, [r7, #12]
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	movs	r1, #128
	orrs	r2, r1
	mvns	r1, r2
	ldr	r2, .L252
	ldr	r2, [r2, #12]
	movs	r0, #128
	ands	r2, r0
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 2319 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L253:
	.align	2
.L252:
	.word	1073752064
.LFE78:
	.size	RTC_ClearITPendingBit, .-RTC_ClearITPendingBit
	.section	.text.RTC_ByteToBcd2,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	RTC_ByteToBcd2, %function
RTC_ByteToBcd2:
.LFB79:
	.loc 1 2331 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI138:
	sub	sp, sp, #16
.LCFI139:
	add	r7, sp, #0
.LCFI140:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 2332 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2334 0
	b	.L255
.L256:
	.loc 1 2336 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	adds	r2, r2, #1
	strb	r2, [r3]
	.loc 1 2337 0
	adds	r3, r7, #7
	adds	r2, r7, #7
	ldrb	r2, [r2]
	subs	r2, r2, #10
	strb	r2, [r3]
.L255:
	.loc 1 2334 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #9
	bhi	.L256
	.loc 1 2340 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	lsls	r3, r3, #4
	uxtb	r2, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	orrs	r3, r2
	uxtb	r3, r3
	.loc 1 2341 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE79:
	.size	RTC_ByteToBcd2, .-RTC_ByteToBcd2
	.section	.text.RTC_Bcd2ToByte,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	RTC_Bcd2ToByte, %function
RTC_Bcd2ToByte:
.LFB80:
	.loc 1 2349 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI141:
	sub	sp, sp, #16
.LCFI142:
	add	r7, sp, #0
.LCFI143:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 2350 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2351 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsrs	r3, r3, #4
	uxtb	r3, r3
	movs	r2, #15
	adds	r2, r7, r2
	adds	r1, r3, #0
	lsls	r1, r1, #2
	adds	r3, r1, r3
	adds	r3, r3, r3
	strb	r3, [r2]
	.loc 1 2352 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #15
	ands	r3, r2
	uxtb	r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	adds	r3, r2, r3
	uxtb	r3, r3
	.loc 1 2353 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE80:
	.size	RTC_Bcd2ToByte, .-RTC_Bcd2ToByte
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
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
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
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
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
	.4byte	.LCFI6-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
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
	.4byte	.LCFI9-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
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
	.4byte	.LCFI12-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
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
	.4byte	.LCFI15-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x20
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
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI38-.LFB45
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI41-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI44-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI47-.LFB48
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI50-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI53-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI56-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI59-.LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI62-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI65-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI68-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI70-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI71-.LCFI70
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI73-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI74-.LCFI73
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.byte	0x4
	.4byte	.LCFI76-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI77-.LCFI76
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.byte	0x4
	.4byte	.LCFI79-.LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI80-.LCFI79
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI81-.LCFI80
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.byte	0x4
	.4byte	.LCFI82-.LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI83-.LCFI82
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI84-.LCFI83
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI85-.LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI86-.LCFI85
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI87-.LCFI86
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.byte	0x4
	.4byte	.LCFI88-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI89-.LCFI88
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.byte	0x4
	.4byte	.LCFI90-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.byte	0x4
	.4byte	.LCFI93-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI96-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI97-.LCFI96
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI98-.LCFI97
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.byte	0x4
	.4byte	.LCFI99-.LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI101-.LCFI100
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.byte	0x4
	.4byte	.LCFI102-.LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI103-.LCFI102
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI104-.LCFI103
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.byte	0x4
	.4byte	.LCFI105-.LFB68
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI106-.LCFI105
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI107-.LCFI106
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.byte	0x4
	.4byte	.LCFI108-.LFB69
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI109-.LCFI108
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI110-.LCFI109
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI111-.LFB70
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI112-.LCFI111
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI113-.LCFI112
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI114-.LFB71
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI115-.LCFI114
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI116-.LCFI115
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.byte	0x4
	.4byte	.LCFI117-.LFB72
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI118-.LCFI117
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI119-.LCFI118
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI120-.LFB73
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI121-.LCFI120
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI122-.LCFI121
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI123-.LFB74
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI124-.LCFI123
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI125-.LCFI124
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI126-.LFB75
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI127-.LCFI126
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI128-.LCFI127
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.byte	0x4
	.4byte	.LCFI129-.LFB76
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI130-.LCFI129
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI131-.LCFI130
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.byte	0x4
	.4byte	.LCFI132-.LFB77
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI133-.LCFI132
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI134-.LCFI133
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.byte	0x4
	.4byte	.LCFI135-.LFB78
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI136-.LCFI135
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI137-.LCFI136
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.byte	0x4
	.4byte	.LCFI138-.LFB79
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI139-.LCFI138
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI140-.LCFI139
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.byte	0x4
	.4byte	.LCFI141-.LFB80
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI142-.LCFI141
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI143-.LCFI142
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE96:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_rtc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xe3d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF152
	.byte	0xc
	.4byte	.LASF153
	.4byte	.LASF154
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
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0xdf
	.4byte	0x7f
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
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0xe1
	.4byte	0xae
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe4
	.4byte	0xeb
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x3
	.byte	0xe4
	.4byte	0xd2
	.uleb128 0x9
	.byte	0x64
	.byte	0x3
	.2byte	0x1ee
	.4byte	0x242
	.uleb128 0xa
	.ascii	"TR\000"
	.byte	0x3
	.2byte	0x1f0
	.4byte	0x7a
	.byte	0
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x3
	.2byte	0x1f1
	.4byte	0x7a
	.byte	0x4
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x1f2
	.4byte	0x7a
	.byte	0x8
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x1f3
	.4byte	0x7a
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1f4
	.4byte	0x7a
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1f5
	.4byte	0x53
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1f6
	.4byte	0x53
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x1f7
	.4byte	0x7a
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1f8
	.4byte	0x53
	.byte	0x20
	.uleb128 0xa
	.ascii	"WPR\000"
	.byte	0x3
	.2byte	0x1f9
	.4byte	0x7a
	.byte	0x24
	.uleb128 0xa
	.ascii	"SSR\000"
	.byte	0x3
	.2byte	0x1fa
	.4byte	0x7a
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1fb
	.4byte	0x7a
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x1fc
	.4byte	0x7a
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x1fd
	.4byte	0x7a
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x1fe
	.4byte	0x7a
	.byte	0x38
	.uleb128 0xa
	.ascii	"CAL\000"
	.byte	0x3
	.2byte	0x1ff
	.4byte	0x7a
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x200
	.4byte	0x7a
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x201
	.4byte	0x7a
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x202
	.4byte	0x53
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x203
	.4byte	0x53
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x204
	.4byte	0x7a
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x205
	.4byte	0x7a
	.byte	0x54
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x206
	.4byte	0x7a
	.byte	0x58
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x207
	.4byte	0x7a
	.byte	0x5c
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x208
	.4byte	0x7a
	.byte	0x60
	.byte	0
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x209
	.4byte	0xf6
	.uleb128 0xd
	.byte	0xc
	.byte	0x4
	.byte	0x35
	.4byte	0x27b
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x4
	.byte	0x37
	.4byte	0x53
	.byte	0
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x4
	.byte	0x3a
	.4byte	0x53
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x4
	.byte	0x3d
	.4byte	0x53
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x4
	.byte	0x3f
	.4byte	0x24e
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.byte	0x44
	.4byte	0x2bf
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x4
	.byte	0x46
	.4byte	0x2c
	.byte	0
	.uleb128 0xe
	.4byte	.LASF43
	.byte	0x4
	.byte	0x4b
	.4byte	0x2c
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x4
	.byte	0x4e
	.4byte	0x2c
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0x4
	.byte	0x51
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF46
	.byte	0x4
	.byte	0x53
	.4byte	0x286
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.byte	0x58
	.4byte	0x303
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x4
	.byte	0x5a
	.4byte	0x2c
	.byte	0
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x4
	.byte	0x5d
	.4byte	0x2c
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x4
	.byte	0x60
	.4byte	0x2c
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x4
	.byte	0x63
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF51
	.byte	0x4
	.byte	0x65
	.4byte	0x2ca
	.uleb128 0xd
	.byte	0x10
	.byte	0x4
	.byte	0x6a
	.4byte	0x347
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x4
	.byte	0x6c
	.4byte	0x2bf
	.byte	0
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x4
	.byte	0x6e
	.4byte	0x53
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x4
	.byte	0x71
	.4byte	0x53
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x4
	.byte	0x74
	.4byte	0x2c
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF56
	.byte	0x4
	.byte	0x79
	.4byte	0x30e
	.uleb128 0xf
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x135
	.4byte	0xeb
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38b
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x137
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x138
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x172
	.4byte	0xeb
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c4
	.uleb128 0x11
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x172
	.4byte	0x3c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x174
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x27b
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x1a0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f0
	.uleb128 0x11
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x1a0
	.4byte	0x3c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x1b6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x416
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x1b6
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x1d1
	.4byte	0xeb
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45e
	.uleb128 0x10
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x1d3
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x1d4
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x1d5
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF155
	.byte	0x1
	.2byte	0x1fe
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x214
	.4byte	0xeb
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b8
	.uleb128 0x10
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x216
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x217
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x218
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x247
	.4byte	0xeb
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f1
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x247
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x249
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x277
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x517
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x277
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xf
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x2ad
	.4byte	0xeb
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56e
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x2ad
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x2ad
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x2af
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x2b0
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x2bf
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x315
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59a
	.uleb128 0x11
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x315
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x328
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5de
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x328
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x328
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x32a
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x349
	.4byte	0x53
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x608
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x34b
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x362
	.4byte	0xeb
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x65f
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x362
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x362
	.4byte	0x65f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x364
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x365
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x303
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x3bd
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x68b
	.uleb128 0x11
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x3bd
	.4byte	0x65f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6cf
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x65f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x3d2
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x40c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x722
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x40c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x40c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x11
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x40c
	.4byte	0x722
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x40e
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x347
	.uleb128 0x13
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x474
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x74e
	.uleb128 0x11
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x474
	.4byte	0x722
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x491
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a1
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x491
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x491
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x491
	.4byte	0x722
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x493
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x4bf
	.4byte	0xeb
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x807
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x4bf
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x4bf
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x10
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x4c1
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x4c2
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x4c3
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x51c
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x85a
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x51c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x51c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x51c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x51e
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x53c
	.4byte	0x53
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x893
	.uleb128 0x11
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x53c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x53e
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x566
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c8
	.uleb128 0x11
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x566
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x566
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x581
	.4byte	0x53
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x5a5
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x913
	.uleb128 0x11
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x5a5
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x5a5
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x5d0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x939
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x5d0
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x5f0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x95f
	.uleb128 0x11
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x5f0
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x614
	.4byte	0xeb
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9c5
	.uleb128 0x11
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x614
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x615
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x616
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x618
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x619
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x660
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa09
	.uleb128 0x11
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x660
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x660
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x662
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x68c
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa6b
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x68c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x68c
	.4byte	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x68d
	.4byte	0x65f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x68f
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x68f
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x6b8
	.4byte	0x53
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x6de
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xab6
	.uleb128 0x11
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x6de
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x6de
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x6fb
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaeb
	.uleb128 0x11
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x6fb
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x6fb
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x13
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x71a
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb11
	.uleb128 0x11
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x71a
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF125
	.byte	0x1
	.2byte	0x73c
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb37
	.uleb128 0x11
	.4byte	.LASF126
	.byte	0x1
	.2byte	0x73c
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x753
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb5d
	.uleb128 0x11
	.4byte	.LASF128
	.byte	0x1
	.2byte	0x753
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x767
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb83
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x767
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x77e
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xba9
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x77e
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x7a7
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbed
	.uleb128 0x11
	.4byte	.LASF132
	.byte	0x1
	.2byte	0x7a7
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x7a7
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x7a9
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF134
	.byte	0x1
	.2byte	0x7bc
	.4byte	0x53
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc26
	.uleb128 0x11
	.4byte	.LASF132
	.byte	0x1
	.2byte	0x7bc
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x7be
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x7e4
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc4c
	.uleb128 0x11
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x7e4
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF137
	.byte	0x1
	.2byte	0x80a
	.4byte	0xeb
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xca3
	.uleb128 0x11
	.4byte	.LASF138
	.byte	0x1
	.2byte	0x80a
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF139
	.byte	0x1
	.2byte	0x80a
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x80c
	.4byte	0xeb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.4byte	.LASF140
	.byte	0x1
	.2byte	0x80d
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x877
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcd8
	.uleb128 0x11
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x877
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x877
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF143
	.byte	0x1
	.2byte	0x8a3
	.4byte	0x98
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd20
	.uleb128 0x11
	.4byte	.LASF144
	.byte	0x1
	.2byte	0x8a3
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF145
	.byte	0x1
	.2byte	0x8a5
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x8a6
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x8c7
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd46
	.uleb128 0x11
	.4byte	.LASF144
	.byte	0x1
	.2byte	0x8c7
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF147
	.byte	0x1
	.2byte	0x8db
	.4byte	0xa3
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd9d
	.uleb128 0x11
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x8db
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF145
	.byte	0x1
	.2byte	0x8dd
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x8de
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x8de
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x13
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x903
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdd2
	.uleb128 0x11
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x903
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x905
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF156
	.byte	0x1
	.2byte	0x91a
	.4byte	0x2c
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe0b
	.uleb128 0x11
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x91a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x10
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x91c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x92c
	.4byte	0x2c
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x92c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x92e
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x4ad
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xe41
	.4byte	0x8b
	.ascii	"RESET\000"
	.4byte	0x91
	.ascii	"SET\000"
	.4byte	0xba
	.ascii	"DISABLE\000"
	.4byte	0xc0
	.ascii	"ENABLE\000"
	.4byte	0xde
	.ascii	"ERROR\000"
	.4byte	0xe4
	.ascii	"SUCCESS\000"
	.4byte	0x352
	.ascii	"RTC_DeInit\000"
	.4byte	0x38b
	.ascii	"RTC_Init\000"
	.4byte	0x3ca
	.ascii	"RTC_StructInit\000"
	.4byte	0x3f0
	.ascii	"RTC_WriteProtectionCmd\000"
	.4byte	0x416
	.ascii	"RTC_EnterInitMode\000"
	.4byte	0x45e
	.ascii	"RTC_ExitInitMode\000"
	.4byte	0x470
	.ascii	"RTC_WaitForSynchro\000"
	.4byte	0x4b8
	.ascii	"RTC_RefClockCmd\000"
	.4byte	0x4f1
	.ascii	"RTC_BypassShadowCmd\000"
	.4byte	0x517
	.ascii	"RTC_SetTime\000"
	.4byte	0x574
	.ascii	"RTC_TimeStructInit\000"
	.4byte	0x59a
	.ascii	"RTC_GetTime\000"
	.4byte	0x5de
	.ascii	"RTC_GetSubSecond\000"
	.4byte	0x608
	.ascii	"RTC_SetDate\000"
	.4byte	0x665
	.ascii	"RTC_DateStructInit\000"
	.4byte	0x68b
	.ascii	"RTC_GetDate\000"
	.4byte	0x6cf
	.ascii	"RTC_SetAlarm\000"
	.4byte	0x728
	.ascii	"RTC_AlarmStructInit\000"
	.4byte	0x74e
	.ascii	"RTC_GetAlarm\000"
	.4byte	0x7a1
	.ascii	"RTC_AlarmCmd\000"
	.4byte	0x807
	.ascii	"RTC_AlarmSubSecondConfig\000"
	.4byte	0x85a
	.ascii	"RTC_GetAlarmSubSecond\000"
	.4byte	0x893
	.ascii	"RTC_DayLightSavingConfig\000"
	.4byte	0x8c8
	.ascii	"RTC_GetStoreOperation\000"
	.4byte	0x8de
	.ascii	"RTC_OutputConfig\000"
	.4byte	0x913
	.ascii	"RTC_CalibOutputCmd\000"
	.4byte	0x939
	.ascii	"RTC_CalibOutputConfig\000"
	.4byte	0x95f
	.ascii	"RTC_SmoothCalibConfig\000"
	.4byte	0x9c5
	.ascii	"RTC_TimeStampCmd\000"
	.4byte	0xa09
	.ascii	"RTC_GetTimeStamp\000"
	.4byte	0xa6b
	.ascii	"RTC_GetTimeStampSubSecond\000"
	.4byte	0xa81
	.ascii	"RTC_TamperTriggerConfig\000"
	.4byte	0xab6
	.ascii	"RTC_TamperCmd\000"
	.4byte	0xaeb
	.ascii	"RTC_TamperFilterConfig\000"
	.4byte	0xb11
	.ascii	"RTC_TamperSamplingFreqConfig\000"
	.4byte	0xb37
	.ascii	"RTC_TamperPinsPrechargeDuration\000"
	.4byte	0xb5d
	.ascii	"RTC_TimeStampOnTamperDetectionCmd\000"
	.4byte	0xb83
	.ascii	"RTC_TamperPullUpCmd\000"
	.4byte	0xba9
	.ascii	"RTC_WriteBackupRegister\000"
	.4byte	0xbed
	.ascii	"RTC_ReadBackupRegister\000"
	.4byte	0xc26
	.ascii	"RTC_OutputTypeConfig\000"
	.4byte	0xc4c
	.ascii	"RTC_SynchroShiftConfig\000"
	.4byte	0xca3
	.ascii	"RTC_ITConfig\000"
	.4byte	0xcd8
	.ascii	"RTC_GetFlagStatus\000"
	.4byte	0xd20
	.ascii	"RTC_ClearFlag\000"
	.4byte	0xd46
	.ascii	"RTC_GetITStatus\000"
	.4byte	0xd9d
	.ascii	"RTC_ClearITPendingBit\000"
	.4byte	0xdd2
	.ascii	"RTC_ByteToBcd2\000"
	.4byte	0xe0b
	.ascii	"RTC_Bcd2ToByte\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x162
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xe41
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
	.4byte	0xa3
	.ascii	"ITStatus\000"
	.4byte	0xc7
	.ascii	"FunctionalState\000"
	.4byte	0xeb
	.ascii	"ErrorStatus\000"
	.4byte	0x242
	.ascii	"RTC_TypeDef\000"
	.4byte	0x27b
	.ascii	"RTC_InitTypeDef\000"
	.4byte	0x2bf
	.ascii	"RTC_TimeTypeDef\000"
	.4byte	0x303
	.ascii	"RTC_DateTypeDef\000"
	.4byte	0x347
	.ascii	"RTC_AlarmTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x19c
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
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
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
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	.LFB56
	.4byte	.LFE56
	.4byte	.LFB57
	.4byte	.LFE57
	.4byte	.LFB58
	.4byte	.LFE58
	.4byte	.LFB59
	.4byte	.LFE59
	.4byte	.LFB60
	.4byte	.LFE60
	.4byte	.LFB61
	.4byte	.LFE61
	.4byte	.LFB62
	.4byte	.LFE62
	.4byte	.LFB63
	.4byte	.LFE63
	.4byte	.LFB64
	.4byte	.LFE64
	.4byte	.LFB65
	.4byte	.LFE65
	.4byte	.LFB66
	.4byte	.LFE66
	.4byte	.LFB67
	.4byte	.LFE67
	.4byte	.LFB68
	.4byte	.LFE68
	.4byte	.LFB69
	.4byte	.LFE69
	.4byte	.LFB70
	.4byte	.LFE70
	.4byte	.LFB71
	.4byte	.LFE71
	.4byte	.LFB72
	.4byte	.LFE72
	.4byte	.LFB73
	.4byte	.LFE73
	.4byte	.LFB74
	.4byte	.LFE74
	.4byte	.LFB75
	.4byte	.LFE75
	.4byte	.LFB76
	.4byte	.LFE76
	.4byte	.LFB77
	.4byte	.LFE77
	.4byte	.LFB78
	.4byte	.LFE78
	.4byte	.LFB79
	.4byte	.LFE79
	.4byte	.LFB80
	.4byte	.LFE80
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF130:
	.ascii	"RTC_TamperPullUpCmd\000"
.LASF16:
	.ascii	"ERROR\000"
.LASF125:
	.ascii	"RTC_TamperSamplingFreqConfig\000"
.LASF27:
	.ascii	"TSSSR\000"
.LASF75:
	.ascii	"RTC_TimeStruct\000"
.LASF86:
	.ascii	"RTC_AlarmStruct\000"
.LASF116:
	.ascii	"tmpdate\000"
.LASF142:
	.ascii	"RTC_IT\000"
.LASF84:
	.ascii	"RTC_SetAlarm\000"
.LASF69:
	.ascii	"synchrocounter\000"
.LASF131:
	.ascii	"RTC_WriteBackupRegister\000"
.LASF92:
	.ascii	"RTC_AlarmSubSecondConfig\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF126:
	.ascii	"RTC_TamperSamplingFreq\000"
.LASF18:
	.ascii	"ErrorStatus\000"
.LASF89:
	.ascii	"RTC_AlarmCmd\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF24:
	.ascii	"SHIFTR\000"
.LASF148:
	.ascii	"enablestatus\000"
.LASF93:
	.ascii	"RTC_AlarmSubSecondValue\000"
.LASF70:
	.ascii	"synchrostatus\000"
.LASF111:
	.ascii	"RTC_TimeStampEdge\000"
.LASF32:
	.ascii	"BKP0R\000"
.LASF29:
	.ascii	"ALRMASSR\000"
.LASF149:
	.ascii	"RTC_ClearITPendingBit\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF152:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF123:
	.ascii	"RTC_TamperFilterConfig\000"
.LASF117:
	.ascii	"RTC_GetStoreOperation\000"
.LASF129:
	.ascii	"RTC_TimeStampOnTamperDetectionCmd\000"
.LASF110:
	.ascii	"RTC_TimeStampCmd\000"
.LASF138:
	.ascii	"RTC_ShiftAdd1S\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF95:
	.ascii	"RTC_GetAlarmSubSecond\000"
.LASF33:
	.ascii	"BKP1R\000"
.LASF140:
	.ascii	"shpfcount\000"
.LASF51:
	.ascii	"RTC_DateTypeDef\000"
.LASF154:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF87:
	.ascii	"RTC_AlarmStructInit\000"
.LASF120:
	.ascii	"RTC_Tamper\000"
.LASF122:
	.ascii	"RTC_TamperCmd\000"
.LASF68:
	.ascii	"RTC_WaitForSynchro\000"
.LASF114:
	.ascii	"RTC_StampDateStruct\000"
.LASF104:
	.ascii	"RTC_CalibOutput\000"
.LASF62:
	.ascii	"RTC_StructInit\000"
.LASF100:
	.ascii	"RTC_Output\000"
.LASF37:
	.ascii	"RTC_TypeDef\000"
.LASF74:
	.ascii	"RTC_Format\000"
.LASF107:
	.ascii	"RTC_SmoothCalibPlusPulses\000"
.LASF34:
	.ascii	"BKP2R\000"
.LASF97:
	.ascii	"RTC_DayLightSaving\000"
.LASF134:
	.ascii	"RTC_ReadBackupRegister\000"
.LASF121:
	.ascii	"RTC_TamperTrigger\000"
.LASF76:
	.ascii	"tmpreg\000"
.LASF60:
	.ascii	"RTC_Init\000"
.LASF12:
	.ascii	"ITStatus\000"
.LASF139:
	.ascii	"RTC_ShiftSubFS\000"
.LASF101:
	.ascii	"RTC_OutputPolarity\000"
.LASF118:
	.ascii	"RTC_GetTimeStampSubSecond\000"
.LASF35:
	.ascii	"BKP3R\000"
.LASF64:
	.ascii	"NewState\000"
.LASF156:
	.ascii	"RTC_ByteToBcd2\000"
.LASF153:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_rtc.c\000"
.LASF46:
	.ascii	"RTC_TimeTypeDef\000"
.LASF17:
	.ascii	"SUCCESS\000"
.LASF13:
	.ascii	"DISABLE\000"
.LASF28:
	.ascii	"TAFCR\000"
.LASF54:
	.ascii	"RTC_AlarmDateWeekDaySel\000"
.LASF36:
	.ascii	"BKP4R\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF58:
	.ascii	"status\000"
.LASF127:
	.ascii	"RTC_TamperPinsPrechargeDuration\000"
.LASF124:
	.ascii	"RTC_TamperFilter\000"
.LASF67:
	.ascii	"initstatus\000"
.LASF50:
	.ascii	"RTC_Year\000"
.LASF119:
	.ascii	"RTC_TamperTriggerConfig\000"
.LASF26:
	.ascii	"TSDR\000"
.LASF7:
	.ascii	"long long int\000"
.LASF81:
	.ascii	"RTC_DateStruct\000"
.LASF143:
	.ascii	"RTC_GetFlagStatus\000"
.LASF44:
	.ascii	"RTC_Seconds\000"
.LASF79:
	.ascii	"RTC_GetSubSecond\000"
.LASF25:
	.ascii	"TSTR\000"
.LASF96:
	.ascii	"RTC_DayLightSavingConfig\000"
.LASF135:
	.ascii	"RTC_OutputTypeConfig\000"
.LASF48:
	.ascii	"RTC_Month\000"
.LASF113:
	.ascii	"RTC_StampTimeStruct\000"
.LASF150:
	.ascii	"Value\000"
.LASF40:
	.ascii	"RTC_SynchPrediv\000"
.LASF128:
	.ascii	"RTC_TamperPrechargeDuration\000"
.LASF90:
	.ascii	"alarmcounter\000"
.LASF56:
	.ascii	"RTC_AlarmTypeDef\000"
.LASF105:
	.ascii	"RTC_SmoothCalibConfig\000"
.LASF22:
	.ascii	"ALRMAR\000"
.LASF38:
	.ascii	"RTC_HourFormat\000"
.LASF73:
	.ascii	"RTC_SetTime\000"
.LASF103:
	.ascii	"RTC_CalibOutputConfig\000"
.LASF45:
	.ascii	"RTC_H12\000"
.LASF136:
	.ascii	"RTC_OutputType\000"
.LASF91:
	.ascii	"alarmstatus\000"
.LASF109:
	.ascii	"recalpfcount\000"
.LASF43:
	.ascii	"RTC_Minutes\000"
.LASF88:
	.ascii	"RTC_GetAlarm\000"
.LASF157:
	.ascii	"RTC_Bcd2ToByte\000"
.LASF80:
	.ascii	"RTC_SetDate\000"
.LASF20:
	.ascii	"RESERVED0\000"
.LASF21:
	.ascii	"RESERVED1\000"
.LASF23:
	.ascii	"RESERVED2\000"
.LASF30:
	.ascii	"RESERVED3\000"
.LASF31:
	.ascii	"RESERVED4\000"
.LASF2:
	.ascii	"short int\000"
.LASF63:
	.ascii	"RTC_WriteProtectionCmd\000"
.LASF82:
	.ascii	"RTC_DateStructInit\000"
.LASF57:
	.ascii	"wutcounter\000"
.LASF141:
	.ascii	"RTC_ITConfig\000"
.LASF10:
	.ascii	"RESET\000"
.LASF132:
	.ascii	"RTC_BKP_DR\000"
.LASF85:
	.ascii	"RTC_Alarm\000"
.LASF52:
	.ascii	"RTC_AlarmTime\000"
.LASF151:
	.ascii	"bcdhigh\000"
.LASF99:
	.ascii	"RTC_OutputConfig\000"
.LASF41:
	.ascii	"RTC_InitTypeDef\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF98:
	.ascii	"RTC_StoreOperation\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF66:
	.ascii	"initcounter\000"
.LASF39:
	.ascii	"RTC_AsynchPrediv\000"
.LASF146:
	.ascii	"RTC_ClearFlag\000"
.LASF61:
	.ascii	"RTC_InitStruct\000"
.LASF144:
	.ascii	"RTC_FLAG\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF155:
	.ascii	"RTC_ExitInitMode\000"
.LASF72:
	.ascii	"RTC_BypassShadowCmd\000"
.LASF106:
	.ascii	"RTC_SmoothCalibPeriod\000"
.LASF19:
	.ascii	"PRER\000"
.LASF102:
	.ascii	"RTC_CalibOutputCmd\000"
.LASF65:
	.ascii	"RTC_EnterInitMode\000"
.LASF59:
	.ascii	"RTC_DeInit\000"
.LASF94:
	.ascii	"RTC_AlarmSubSecondMask\000"
.LASF0:
	.ascii	"signed char\000"
.LASF53:
	.ascii	"RTC_AlarmMask\000"
.LASF71:
	.ascii	"RTC_RefClockCmd\000"
.LASF47:
	.ascii	"RTC_WeekDay\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF77:
	.ascii	"RTC_TimeStructInit\000"
.LASF78:
	.ascii	"RTC_GetTime\000"
.LASF145:
	.ascii	"bitstatus\000"
.LASF42:
	.ascii	"RTC_Hours\000"
.LASF112:
	.ascii	"RTC_GetTimeStamp\000"
.LASF49:
	.ascii	"RTC_Date\000"
.LASF55:
	.ascii	"RTC_AlarmDateWeekDay\000"
.LASF137:
	.ascii	"RTC_SynchroShiftConfig\000"
.LASF147:
	.ascii	"RTC_GetITStatus\000"
.LASF133:
	.ascii	"Data\000"
.LASF115:
	.ascii	"tmptime\000"
.LASF83:
	.ascii	"RTC_GetDate\000"
.LASF108:
	.ascii	"RTC_SmouthCalibMinusPulsesValue\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
