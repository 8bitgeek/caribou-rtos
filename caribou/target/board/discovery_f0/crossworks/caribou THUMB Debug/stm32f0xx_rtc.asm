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
	.file	"stm32f0xx_rtc.c"
	.text
.Ltext0:
	.section	.text.RTC_ByteToBcd2,"ax",%progbits
	.align	1
	.code	16
	.thumb_func
	.type	RTC_ByteToBcd2, %function
RTC_ByteToBcd2:
.LFB79:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_rtc.c"
	.loc 1 2331 0
.LVL0:
	.loc 1 2332 0
	mov	r3, #0
.LVL1:
.L2:
	.loc 1 2334 0 discriminator 1
	cmp	r0, #9
	bls	.L5
	.loc 1 2336 0
	add	r3, r3, #1
.LVL2:
	.loc 1 2337 0
	sub	r0, r0, #10
.LVL3:
	.loc 1 2336 0
	uxtb	r3, r3
.LVL4:
	.loc 1 2337 0
	uxtb	r0, r0
.LVL5:
	b	.L2
.L5:
	.loc 1 2340 0
	lsl	r3, r3, #4
.LVL6:
	orr	r0, r3
.LVL7:
	uxtb	r0, r0
	.loc 1 2341 0
	@ sp needed
	bx	lr
.LFE79:
	.size	RTC_ByteToBcd2, .-RTC_ByteToBcd2
	.section	.text.RTC_Bcd2ToByte,"ax",%progbits
	.align	1
	.code	16
	.thumb_func
	.type	RTC_Bcd2ToByte, %function
RTC_Bcd2ToByte:
.LFB80:
	.loc 1 2349 0
.LVL8:
	.loc 1 2351 0
	lsr	r3, r0, #4
	mov	r2, #10
	mul	r3, r2
	.loc 1 2352 0
	mov	r2, #15
	and	r0, r2
.LVL9:
	add	r0, r3, r0
	uxtb	r0, r0
	.loc 1 2353 0
	@ sp needed
	bx	lr
.LFE80:
	.size	RTC_Bcd2ToByte, .-RTC_Bcd2ToByte
	.section	.text.RTC_StructInit,"ax",%progbits
	.align	1
	.global	RTC_StructInit
	.code	16
	.thumb_func
	.type	RTC_StructInit, %function
RTC_StructInit:
.LFB34:
	.loc 1 417 0
.LVL10:
	.loc 1 425 0
	mov	r1, #0
	mov	r2, #127
	mov	r3, #255
	stmia	r0!, {r1, r2, r3}
.LVL11:
	.loc 1 426 0
	@ sp needed
	bx	lr
.LFE34:
	.size	RTC_StructInit, .-RTC_StructInit
	.section	.text.RTC_WriteProtectionCmd,"ax",%progbits
	.align	1
	.global	RTC_WriteProtectionCmd
	.code	16
	.thumb_func
	.type	RTC_WriteProtectionCmd, %function
RTC_WriteProtectionCmd:
.LFB35:
	.loc 1 439 0
.LVL12:
	ldr	r3, .L12
	.loc 1 446 0
	mov	r2, #255
	.loc 1 443 0
	cmp	r0, #0
	bne	.L11
	.loc 1 451 0
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 452 0
	mov	r2, #83
.L11:
	str	r2, [r3, #36]
	.loc 1 454 0
	@ sp needed
	bx	lr
.L13:
	.align	2
.L12:
	.word	1073752064
.LFE35:
	.size	RTC_WriteProtectionCmd, .-RTC_WriteProtectionCmd
	.section	.text.RTC_EnterInitMode,"ax",%progbits
	.align	1
	.global	RTC_EnterInitMode
	.code	16
	.thumb_func
	.type	RTC_EnterInitMode, %function
RTC_EnterInitMode:
.LFB36:
	.loc 1 466 0
	.loc 1 467 0
	mov	r3, #0
	.loc 1 466 0
	sub	sp, sp, #8
.LCFI0:
	.loc 1 467 0
	str	r3, [sp, #4]
.LVL13:
	.loc 1 472 0
	ldr	r3, .L19
	.loc 1 495 0
	mov	r0, #1
	.loc 1 472 0
	ldr	r2, [r3, #12]
	lsl	r1, r2, #25
	bmi	.L15
	.loc 1 475 0
	neg	r2, r0
	str	r2, [r3, #12]
.LVL14:
.L17:
	.loc 1 480 0 discriminator 1
	ldr	r1, [r3, #12]
	mov	r2, #64
	and	r2, r1
.LVL15:
	.loc 1 481 0 discriminator 1
	ldr	r1, [sp, #4]
	add	r1, r1, #1
	str	r1, [sp, #4]
	.loc 1 482 0 discriminator 1
	ldr	r0, [sp, #4]
	mov	r1, #128
	lsl	r1, r1, #7
	cmp	r0, r1
	beq	.L16
	cmp	r2, #0
	beq	.L17
.L16:
.LBB4:
.LBB5:
	.loc 1 484 0
	ldr	r0, [r3, #12]
	lsl	r0, r0, #25
	.loc 1 486 0
	lsr	r0, r0, #31
.LVL16:
.L15:
.LBE5:
.LBE4:
	.loc 1 499 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L20:
	.align	2
.L19:
	.word	1073752064
.LFE36:
	.size	RTC_EnterInitMode, .-RTC_EnterInitMode
	.section	.text.RTC_ExitInitMode,"ax",%progbits
	.align	1
	.global	RTC_ExitInitMode
	.code	16
	.thumb_func
	.type	RTC_ExitInitMode, %function
RTC_ExitInitMode:
.LFB37:
	.loc 1 511 0
	.loc 1 513 0
	ldr	r3, .L22
	mov	r1, #128
	ldr	r2, [r3, #12]
	.loc 1 514 0
	@ sp needed
	.loc 1 513 0
	bic	r2, r1
	str	r2, [r3, #12]
	.loc 1 514 0
	bx	lr
.L23:
	.align	2
.L22:
	.word	1073752064
.LFE37:
	.size	RTC_ExitInitMode, .-RTC_ExitInitMode
	.section	.text.RTC_Init,"ax",%progbits
	.align	1
	.global	RTC_Init
	.code	16
	.thumb_func
	.type	RTC_Init, %function
RTC_Init:
.LFB33:
	.loc 1 371 0
.LVL17:
	push	{r3, r4, r5, lr}
.LCFI1:
	.loc 1 380 0
	ldr	r4, .L28
	mov	r3, #202
	str	r3, [r4, #36]
	.loc 1 381 0
	mov	r3, #83
	str	r3, [r4, #36]
	.loc 1 371 0
	mov	r5, r0
	.loc 1 384 0
	bl	RTC_EnterInitMode
.LVL18:
	.loc 1 386 0
	mov	r3, #0
	.loc 1 384 0
	cmp	r0, r3
	beq	.L25
	.loc 1 391 0
	ldr	r3, [r4, #8]
	mov	r2, #64
	bic	r3, r2
	str	r3, [r4, #8]
	.loc 1 393 0
	ldr	r3, [r4, #8]
	ldr	r2, [r5]
	orr	r3, r2
	str	r3, [r4, #8]
	.loc 1 396 0
	ldr	r3, [r5, #8]
	str	r3, [r4, #16]
	.loc 1 397 0
	ldr	r3, [r5, #4]
	ldr	r2, [r4, #16]
	lsl	r3, r3, #16
	orr	r3, r2
	str	r3, [r4, #16]
	.loc 1 400 0
	bl	RTC_ExitInitMode
.LVL19:
	.loc 1 402 0
	mov	r3, #1
.LVL20:
.L25:
	.loc 1 405 0
	mov	r2, #255
	.loc 1 408 0
	mov	r0, r3
	.loc 1 405 0
	str	r2, [r4, #36]
	.loc 1 408 0
	@ sp needed
.LVL21:
	pop	{r3, r4, r5, pc}
.L29:
	.align	2
.L28:
	.word	1073752064
.LFE33:
	.size	RTC_Init, .-RTC_Init
	.section	.text.RTC_WaitForSynchro,"ax",%progbits
	.align	1
	.global	RTC_WaitForSynchro
	.code	16
	.thumb_func
	.type	RTC_WaitForSynchro, %function
RTC_WaitForSynchro:
.LFB38:
	.loc 1 533 0
	.loc 1 534 0
	mov	r3, #0
	.loc 1 533 0
	sub	sp, sp, #8
.LCFI2:
	.loc 1 534 0
	str	r3, [sp, #4]
.LVL22:
	.loc 1 538 0
	ldr	r3, .L35
	.loc 1 541 0
	mov	r0, #1
	.loc 1 538 0
	ldr	r2, [r3, #8]
	lsl	r1, r2, #26
	bmi	.L31
	.loc 1 546 0
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 547 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 550 0
	ldr	r2, [r3, #12]
	mov	r1, #160
	bic	r2, r1
	str	r2, [r3, #12]
.LVL23:
.L33:
	.loc 1 555 0 discriminator 1
	ldr	r1, [r3, #12]
	mov	r2, #32
	and	r2, r1
.LVL24:
	.loc 1 556 0 discriminator 1
	ldr	r1, [sp, #4]
	add	r1, r1, #1
	str	r1, [sp, #4]
	.loc 1 557 0 discriminator 1
	ldr	r0, [sp, #4]
	mov	r1, #128
	lsl	r1, r1, #8
	cmp	r0, r1
	beq	.L32
	cmp	r2, #0
	beq	.L33
.L32:
.LBB8:
.LBB9:
	.loc 1 559 0
	ldr	r0, [r3, #12]
	.loc 1 569 0
	mov	r2, #255
.LVL25:
	.loc 1 559 0
	lsl	r0, r0, #26
	.loc 1 561 0
	lsr	r0, r0, #31
.LVL26:
	.loc 1 569 0
	str	r2, [r3, #36]
.LVL27:
.L31:
.LBE9:
.LBE8:
	.loc 1 573 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L36:
	.align	2
.L35:
	.word	1073752064
.LFE38:
	.size	RTC_WaitForSynchro, .-RTC_WaitForSynchro
	.section	.text.RTC_DeInit,"ax",%progbits
	.align	1
	.global	RTC_DeInit
	.code	16
	.thumb_func
	.type	RTC_DeInit, %function
RTC_DeInit:
.LFB32:
	.loc 1 310 0
	push	{r0, r1, r2, r4, r5, lr}
.LCFI3:
	.loc 1 315 0
	ldr	r4, .L41
	.loc 1 311 0
	mov	r5, #0
	.loc 1 315 0
	mov	r3, #202
	.loc 1 311 0
	str	r5, [sp, #4]
.LVL28:
	.loc 1 315 0
	str	r3, [r4, #36]
	.loc 1 316 0
	mov	r3, #83
	str	r3, [r4, #36]
	.loc 1 319 0
	bl	RTC_EnterInitMode
.LVL29:
	mov	r3, r0
	.loc 1 321 0
	mov	r0, r5
	.loc 1 319 0
	cmp	r3, r5
	beq	.L38
	.loc 1 327 0
	ldr	r3, .L41+4
	.loc 1 326 0
	str	r5, [r4]
	.loc 1 327 0
	str	r3, [r4, #4]
	.loc 1 328 0
	ldr	r3, [r4, #8]
	.loc 1 329 0
	ldr	r3, .L41+8
	.loc 1 328 0
	str	r5, [r4, #8]
	.loc 1 329 0
	str	r3, [r4, #16]
	.loc 1 330 0
	str	r5, [r4, #28]
	.loc 1 331 0
	str	r5, [r4, #44]
	.loc 1 332 0
	str	r5, [r4, #60]
	.loc 1 333 0
	str	r5, [r4, #68]
	.loc 1 336 0
	str	r5, [r4, #12]
	.loc 1 339 0
	str	r5, [r4, #64]
	.loc 1 342 0
	bl	RTC_WaitForSynchro
.LVL30:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 321 0
	uxtb	r0, r0
.L38:
.LVL31:
	.loc 1 354 0
	mov	r3, #255
	str	r3, [r4, #36]
	.loc 1 357 0
	@ sp needed
	pop	{r1, r2, r3, r4, r5, pc}
.L42:
	.align	2
.L41:
	.word	1073752064
	.word	8449
	.word	8323327
.LFE32:
	.size	RTC_DeInit, .-RTC_DeInit
	.section	.text.RTC_RefClockCmd,"ax",%progbits
	.align	1
	.global	RTC_RefClockCmd
	.code	16
	.thumb_func
	.type	RTC_RefClockCmd, %function
RTC_RefClockCmd:
.LFB39:
	.loc 1 584 0
.LVL32:
	push	{r3, r4, r5, lr}
.LCFI4:
	.loc 1 591 0
	ldr	r4, .L50
	mov	r3, #202
	str	r3, [r4, #36]
	.loc 1 592 0
	mov	r3, #83
	str	r3, [r4, #36]
	.loc 1 584 0
	mov	r5, r0
	.loc 1 595 0
	bl	RTC_EnterInitMode
.LVL33:
	.loc 1 597 0
	mov	r3, #0
	.loc 1 595 0
	cmp	r0, r3
	beq	.L44
	mov	r3, #16
	.loc 1 604 0
	ldr	r2, [r4, #8]
	.loc 1 601 0
	cmp	r5, #0
	beq	.L45
	.loc 1 604 0
	orr	r3, r2
	b	.L49
.L45:
	.loc 1 609 0
	bic	r2, r3
	mov	r3, r2
.L49:
	str	r3, [r4, #8]
	.loc 1 612 0
	bl	RTC_ExitInitMode
.LVL34:
	.loc 1 614 0
	mov	r3, #1
.LVL35:
.L44:
	.loc 1 618 0
	mov	r2, #255
	.loc 1 621 0
	mov	r0, r3
	.loc 1 618 0
	str	r2, [r4, #36]
	.loc 1 621 0
	@ sp needed
	pop	{r3, r4, r5, pc}
.L51:
	.align	2
.L50:
	.word	1073752064
.LFE39:
	.size	RTC_RefClockCmd, .-RTC_RefClockCmd
	.section	.text.RTC_BypassShadowCmd,"ax",%progbits
	.align	1
	.global	RTC_BypassShadowCmd
	.code	16
	.thumb_func
	.type	RTC_BypassShadowCmd, %function
RTC_BypassShadowCmd:
.LFB40:
	.loc 1 632 0
.LVL36:
	.loc 1 637 0
	ldr	r3, .L56
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 638 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 640 0
	cmp	r0, #0
	beq	.L53
	.loc 1 643 0
	ldr	r2, [r3, #8]
	mov	r1, #32
	orr	r2, r1
	b	.L55
.L53:
	.loc 1 648 0
	ldr	r1, [r3, #8]
	mov	r2, #223
	and	r2, r1
.L55:
	str	r2, [r3, #8]
	.loc 1 652 0
	mov	r2, #255
	str	r2, [r3, #36]
	.loc 1 653 0
	@ sp needed
	bx	lr
.L57:
	.align	2
.L56:
	.word	1073752064
.LFE40:
	.size	RTC_BypassShadowCmd, .-RTC_BypassShadowCmd
	.section	.text.RTC_SetTime,"ax",%progbits
	.align	1
	.global	RTC_SetTime
	.code	16
	.thumb_func
	.type	RTC_SetTime, %function
RTC_SetTime:
.LFB41:
	.loc 1 686 0
.LVL37:
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
.LCFI5:
	mov	r3, #64
	.loc 1 686 0
	mov	r2, r0
	mov	r4, r1
	ldr	r5, .L68
	ldrb	r0, [r1]
.LVL38:
	ldrb	r7, [r1, #1]
	ldrb	r6, [r1, #2]
	.loc 1 693 0
	cmp	r2, #0
	bne	.L59
	.loc 1 695 0
	ldr	r2, [r5, #8]
.LVL39:
	and	r3, r2
	bne	.L60
	.loc 1 702 0
	strb	r3, [r1, #3]
	b	.L60
.LVL40:
.L59:
	.loc 1 710 0
	ldr	r2, [r5, #8]
.LVL41:
	and	r3, r2
	bne	.L61
	.loc 1 718 0
	strb	r3, [r1, #3]
.L61:
	.loc 1 728 0
	lsl	r0, r0, #16
	.loc 1 729 0
	lsl	r7, r7, #8
	.loc 1 731 0
	ldrb	r3, [r4, #3]
	.loc 1 728 0
	orr	r7, r0
	.loc 1 729 0
	orr	r6, r7
	.loc 1 731 0
	lsl	r3, r3, #16
	.loc 1 728 0
	orr	r6, r3
.LVL42:
.L63:
	.loc 1 742 0
	mov	r3, #202
	str	r3, [r5, #36]
	.loc 1 743 0
	mov	r3, #83
	str	r3, [r5, #36]
	.loc 1 746 0
	bl	RTC_EnterInitMode
.LVL43:
	mov	r3, r0
	.loc 1 748 0
	mov	r0, #0
	.loc 1 742 0
	ldr	r4, .L68
.LVL44:
	.loc 1 746 0
	cmp	r3, r0
	beq	.L62
	.loc 1 753 0
	ldr	r7, .L68+4
	and	r6, r7
.LVL45:
	str	r6, [r4]
	.loc 1 756 0
	bl	RTC_ExitInitMode
.LVL46:
	.loc 1 759 0
	ldr	r3, [r4, #8]
	.loc 1 772 0
	mov	r0, #1
	.loc 1 759 0
	lsl	r2, r3, #26
	bmi	.L62
	.loc 1 761 0
	bl	RTC_WaitForSynchro
.LVL47:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 748 0
	uxtb	r0, r0
.L62:
.LVL48:
	.loc 1 777 0
	mov	r3, #255
	str	r3, [r5, #36]
	.loc 1 780 0
	@ sp needed
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.LVL49:
.L60:
	.loc 1 735 0
	bl	RTC_ByteToBcd2
.LVL50:
	str	r0, [sp, #4]
	.loc 1 736 0
	mov	r0, r7
	bl	RTC_ByteToBcd2
.LVL51:
	mov	r7, r0
	.loc 1 737 0
	mov	r0, r6
	bl	RTC_ByteToBcd2
.LVL52:
	.loc 1 738 0
	ldrb	r6, [r4, #3]
	.loc 1 735 0
	ldr	r2, [sp, #4]
	.loc 1 738 0
	lsl	r6, r6, #16
	.loc 1 735 0
	orr	r6, r0
	lsl	r3, r2, #16
	.loc 1 736 0
	orr	r6, r3
	lsl	r7, r7, #8
	.loc 1 735 0
	orr	r6, r7
.LVL53:
	b	.L63
.L69:
	.align	2
.L68:
	.word	1073752064
	.word	8355711
.LFE41:
	.size	RTC_SetTime, .-RTC_SetTime
	.section	.text.RTC_TimeStructInit,"ax",%progbits
	.align	1
	.global	RTC_TimeStructInit
	.code	16
	.thumb_func
	.type	RTC_TimeStructInit, %function
RTC_TimeStructInit:
.LFB42:
	.loc 1 790 0
.LVL54:
	.loc 1 792 0
	mov	r3, #0
	strb	r3, [r0, #3]
	.loc 1 793 0
	strb	r3, [r0]
	.loc 1 794 0
	strb	r3, [r0, #1]
	.loc 1 795 0
	strb	r3, [r0, #2]
	.loc 1 796 0
	@ sp needed
	bx	lr
.LFE42:
	.size	RTC_TimeStructInit, .-RTC_TimeStructInit
	.section	.text.RTC_GetTime,"ax",%progbits
	.align	1
	.global	RTC_GetTime
	.code	16
	.thumb_func
	.type	RTC_GetTime, %function
RTC_GetTime:
.LFB43:
	.loc 1 809 0
.LVL55:
	.loc 1 816 0
	ldr	r3, .L73
	.loc 1 809 0
	push	{r4, r5, r6, lr}
.LCFI6:
	.loc 1 816 0
	ldr	r3, [r3]
.LVL56:
	.loc 1 809 0
	mov	r2, r0
	.loc 1 820 0
	lsl	r6, r3, #17
	.loc 1 819 0
	lsl	r0, r3, #10
.LVL57:
	.loc 1 821 0
	mov	r5, #127
	and	r5, r3
	.loc 1 819 0
	lsr	r0, r0, #26
	.loc 1 820 0
	lsr	r6, r6, #25
	.loc 1 809 0
	mov	r4, r1
	.loc 1 819 0
	strb	r0, [r1]
	.loc 1 820 0
	strb	r6, [r1, #1]
	.loc 1 821 0
	strb	r5, [r1, #2]
	.loc 1 822 0
	mov	r1, #128
.LVL58:
	lsl	r1, r1, #15
	and	r3, r1
.LVL59:
	lsr	r3, r3, #16
	strb	r3, [r4, #3]
	.loc 1 825 0
	cmp	r2, #0
	bne	.L71
	.loc 1 828 0
	bl	RTC_Bcd2ToByte
.LVL60:
	strb	r0, [r4]
	.loc 1 829 0
	mov	r0, r6
	bl	RTC_Bcd2ToByte
.LVL61:
	strb	r0, [r4, #1]
	.loc 1 830 0
	mov	r0, r5
	bl	RTC_Bcd2ToByte
.LVL62:
	strb	r0, [r4, #2]
.L71:
	.loc 1 832 0
	@ sp needed
.LVL63:
	pop	{r4, r5, r6, pc}
.L74:
	.align	2
.L73:
	.word	1073752064
.LFE43:
	.size	RTC_GetTime, .-RTC_GetTime
	.section	.text.RTC_GetSubSecond,"ax",%progbits
	.align	1
	.global	RTC_GetSubSecond
	.code	16
	.thumb_func
	.type	RTC_GetSubSecond, %function
RTC_GetSubSecond:
.LFB44:
	.loc 1 842 0
.LVL64:
	.loc 1 846 0
	ldr	r3, .L76
	.loc 1 852 0
	@ sp needed
	.loc 1 846 0
	ldr	r0, [r3, #40]
.LVL65:
	.loc 1 849 0
	ldr	r3, [r3, #4]
	.loc 1 852 0
	bx	lr
.L77:
	.align	2
.L76:
	.word	1073752064
.LFE44:
	.size	RTC_GetSubSecond, .-RTC_GetSubSecond
	.section	.text.RTC_SetDate,"ax",%progbits
	.align	1
	.global	RTC_SetDate
	.code	16
	.thumb_func
	.type	RTC_SetDate, %function
RTC_SetDate:
.LFB45:
	.loc 1 867 0
.LVL66:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI7:
	.loc 1 867 0
	mov	r4, r1
	ldrb	r3, [r1, #1]
	ldrb	r5, [r1, #3]
	ldrb	r7, [r1, #2]
	ldrb	r6, [r1]
	.loc 1 874 0
	cmp	r0, #0
	bne	.L79
	.loc 1 874 0 is_stmt 0 discriminator 1
	mov	r2, #16
	tst	r3, r2
	beq	.L80
	.loc 1 876 0 is_stmt 1
	bic	r3, r2
	add	r3, r3, #10
	strb	r3, [r1, #1]
.L80:
	.loc 1 904 0
	mov	r0, r5
.LVL67:
	bl	RTC_ByteToBcd2
.LVL68:
	mov	r5, r0
	.loc 1 905 0
	ldrb	r0, [r4, #1]
	bl	RTC_ByteToBcd2
.LVL69:
	mov	r4, r0
.LVL70:
	.loc 1 906 0
	mov	r0, r7
	bl	RTC_ByteToBcd2
.LVL71:
	.loc 1 907 0
	lsl	r6, r6, #13
	.loc 1 904 0
	orr	r6, r0
	lsl	r3, r5, #16
	.loc 1 905 0
	mov	r5, r6
	orr	r5, r3
	lsl	r4, r4, #8
	.loc 1 904 0
	orr	r5, r4
.LVL72:
.L82:
	.loc 1 911 0
	ldr	r4, .L90
	mov	r3, #202
	str	r3, [r4, #36]
	.loc 1 912 0
	mov	r3, #83
	str	r3, [r4, #36]
	.loc 1 915 0
	bl	RTC_EnterInitMode
.LVL73:
	.loc 1 917 0
	mov	r3, #0
	.loc 1 915 0
	cmp	r0, r3
	beq	.L81
	.loc 1 922 0
	ldr	r3, .L90+4
	and	r5, r3
.LVL74:
	str	r5, [r4, #4]
	.loc 1 925 0
	bl	RTC_ExitInitMode
.LVL75:
	.loc 1 928 0
	ldr	r2, [r4, #8]
	.loc 1 941 0
	mov	r3, #1
	.loc 1 928 0
	lsl	r1, r2, #26
	bmi	.L81
	.loc 1 930 0
	bl	RTC_WaitForSynchro
.LVL76:
	mov	r3, r0
	sub	r0, r3, #1
	sbc	r3, r3, r0
	.loc 1 917 0
	uxtb	r3, r3
	b	.L81
.LVL77:
.L79:
	.loc 1 897 0
	lsl	r5, r5, #16
	.loc 1 898 0
	lsl	r3, r3, #8
	.loc 1 897 0
	orr	r5, r3
	.loc 1 898 0
	orr	r5, r7
	.loc 1 900 0
	lsl	r6, r6, #13
	.loc 1 897 0
	orr	r5, r6
.LVL78:
	b	.L82
.LVL79:
.L81:
	.loc 1 945 0
	mov	r2, #255
	.loc 1 948 0
	mov	r0, r3
	.loc 1 945 0
	str	r2, [r4, #36]
	.loc 1 948 0
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L91:
	.align	2
.L90:
	.word	1073752064
	.word	16777023
.LFE45:
	.size	RTC_SetDate, .-RTC_SetDate
	.section	.text.RTC_DateStructInit,"ax",%progbits
	.align	1
	.global	RTC_DateStructInit
	.code	16
	.thumb_func
	.type	RTC_DateStructInit, %function
RTC_DateStructInit:
.LFB46:
	.loc 1 958 0
.LVL80:
	.loc 1 960 0
	mov	r3, #1
	strb	r3, [r0]
	.loc 1 961 0
	strb	r3, [r0, #2]
	.loc 1 962 0
	strb	r3, [r0, #1]
	.loc 1 963 0
	mov	r3, #0
	strb	r3, [r0, #3]
	.loc 1 964 0
	@ sp needed
	bx	lr
.LFE46:
	.size	RTC_DateStructInit, .-RTC_DateStructInit
	.section	.text.RTC_GetDate,"ax",%progbits
	.align	1
	.global	RTC_GetDate
	.code	16
	.thumb_func
	.type	RTC_GetDate, %function
RTC_GetDate:
.LFB47:
	.loc 1 977 0
.LVL81:
	.loc 1 984 0
	ldr	r3, .L95
	.loc 1 977 0
	push	{r4, r5, r6, lr}
.LCFI8:
	.loc 1 984 0
	ldr	r3, [r3, #4]
.LVL82:
	.loc 1 989 0
	mov	r5, #63
	.loc 1 988 0
	lsl	r6, r3, #19
	.loc 1 989 0
	and	r5, r3
	.loc 1 977 0
	mov	r2, r0
	.loc 1 987 0
	lsl	r0, r3, #8
.LVL83:
	.loc 1 990 0
	lsl	r3, r3, #16
.LVL84:
	.loc 1 987 0
	lsr	r0, r0, #24
	.loc 1 988 0
	lsr	r6, r6, #27
	.loc 1 990 0
	lsr	r3, r3, #29
	.loc 1 977 0
	mov	r4, r1
	.loc 1 987 0
	strb	r0, [r1, #3]
	.loc 1 988 0
	strb	r6, [r1, #1]
	.loc 1 989 0
	strb	r5, [r1, #2]
	.loc 1 990 0
	strb	r3, [r1]
	.loc 1 993 0
	cmp	r2, #0
	bne	.L93
	.loc 1 996 0
	bl	RTC_Bcd2ToByte
.LVL85:
	strb	r0, [r4, #3]
	.loc 1 997 0
	mov	r0, r6
	bl	RTC_Bcd2ToByte
.LVL86:
	strb	r0, [r4, #1]
	.loc 1 998 0
	mov	r0, r5
	bl	RTC_Bcd2ToByte
.LVL87:
	strb	r0, [r4, #2]
.L93:
	.loc 1 1001 0
	@ sp needed
.LVL88:
	pop	{r4, r5, r6, pc}
.L96:
	.align	2
.L95:
	.word	1073752064
.LFE47:
	.size	RTC_GetDate, .-RTC_GetDate
	.section	.text.RTC_SetAlarm,"ax",%progbits
	.align	1
	.global	RTC_SetAlarm
	.code	16
	.thumb_func
	.type	RTC_SetAlarm, %function
RTC_SetAlarm:
.LFB48:
	.loc 1 1037 0
.LVL89:
	push	{r4, r5, r6, r7, lr}
.LCFI9:
	mov	r4, r2
	ldr	r2, [r2, #4]
.LVL90:
	sub	sp, sp, #20
.LCFI10:
	ldr	r5, .L103
	str	r2, [sp]
	ldr	r2, [r4, #8]
	mov	r3, #64
	str	r2, [sp, #4]
	.loc 1 1048 0
	ldr	r2, [r5, #8]
	.loc 1 1037 0
	mov	r1, r0
.LVL91:
	ldrb	r6, [r4, #2]
	ldrb	r0, [r4]
.LVL92:
	ldrb	r7, [r4, #1]
	.loc 1 1048 0
	and	r3, r2
	.loc 1 1046 0
	cmp	r1, #0
	bne	.L98
	.loc 1 1048 0
	cmp	r3, #0
	bne	.L99
	.loc 1 1055 0
	strb	r3, [r4, #3]
	b	.L99
.L98:
	.loc 1 1072 0
	cmp	r3, #0
	bne	.L100
	.loc 1 1080 0
	strb	r3, [r4, #3]
.L100:
	.loc 1 1102 0
	ldr	r3, [sp]
	ldr	r2, [sp, #4]
	lsl	r0, r0, #16
	orr	r3, r2
	.loc 1 1103 0
	orr	r6, r3
	.loc 1 1104 0
	orr	r6, r0
	.loc 1 1103 0
	lsl	r3, r7, #8
	.loc 1 1105 0
	mov	r7, r6
	orr	r7, r3
	ldrb	r3, [r4, #3]
	lsl	r3, r3, #16
	.loc 1 1106 0
	orr	r7, r3
	ldrb	r3, [r4, #12]
	lsl	r3, r3, #24
	.loc 1 1102 0
	orr	r7, r3
.LVL93:
.L101:
	.loc 1 1122 0
	mov	r3, #202
	str	r3, [r5, #36]
	.loc 1 1123 0
	mov	r3, #83
	str	r3, [r5, #36]
	.loc 1 1129 0
	mov	r3, #255
	.loc 1 1126 0
	str	r7, [r5, #28]
	.loc 1 1129 0
	str	r3, [r5, #36]
	.loc 1 1130 0
	add	sp, sp, #20
	@ sp needed
.LVL94:
.LVL95:
	pop	{r4, r5, r6, r7, pc}
.LVL96:
.L99:
	.loc 1 1112 0
	bl	RTC_ByteToBcd2
.LVL97:
	str	r0, [sp, #8]
	.loc 1 1113 0
	mov	r0, r7
	bl	RTC_ByteToBcd2
.LVL98:
	str	r0, [sp, #12]
	.loc 1 1114 0
	mov	r0, r6
	bl	RTC_ByteToBcd2
.LVL99:
	mov	r7, r0
	.loc 1 1116 0
	ldrb	r0, [r4, #12]
	bl	RTC_ByteToBcd2
.LVL100:
	.loc 1 1112 0
	ldr	r3, [sp, #4]
	ldr	r6, [sp]
	ldr	r2, [sp, #8]
	orr	r6, r3
	.loc 1 1115 0
	ldrb	r3, [r4, #3]
	.loc 1 1116 0
	lsl	r0, r0, #24
	.loc 1 1115 0
	lsl	r3, r3, #16
	.loc 1 1113 0
	orr	r6, r3
	.loc 1 1112 0
	lsl	r3, r2, #16
	.loc 1 1113 0
	ldr	r2, [sp, #12]
	.loc 1 1114 0
	orr	r7, r6
	.loc 1 1115 0
	orr	r7, r3
	.loc 1 1113 0
	lsl	r3, r2, #8
	.loc 1 1116 0
	orr	r7, r3
	.loc 1 1112 0
	orr	r7, r0
.LVL101:
	b	.L101
.L104:
	.align	2
.L103:
	.word	1073752064
.LFE48:
	.size	RTC_SetAlarm, .-RTC_SetAlarm
	.section	.text.RTC_AlarmStructInit,"ax",%progbits
	.align	1
	.global	RTC_AlarmStructInit
	.code	16
	.thumb_func
	.type	RTC_AlarmStructInit, %function
RTC_AlarmStructInit:
.LFB49:
	.loc 1 1141 0
.LVL102:
	.loc 1 1143 0
	mov	r3, #0
	.loc 1 1150 0
	mov	r2, #1
	.loc 1 1143 0
	strb	r3, [r0, #3]
	.loc 1 1144 0
	strb	r3, [r0]
	.loc 1 1145 0
	strb	r3, [r0, #1]
	.loc 1 1146 0
	strb	r3, [r0, #2]
	.loc 1 1149 0
	str	r3, [r0, #8]
	.loc 1 1150 0
	strb	r2, [r0, #12]
	.loc 1 1153 0
	str	r3, [r0, #4]
	.loc 1 1154 0
	@ sp needed
	bx	lr
.LFE49:
	.size	RTC_AlarmStructInit, .-RTC_AlarmStructInit
	.section	.text.RTC_GetAlarm,"ax",%progbits
	.align	1
	.global	RTC_GetAlarm
	.code	16
	.thumb_func
	.type	RTC_GetAlarm, %function
RTC_GetAlarm:
.LFB50:
	.loc 1 1170 0
.LVL103:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI11:
	.loc 1 1178 0
	ldr	r3, .L108
	.loc 1 1170 0
	mov	r1, r0
.LVL104:
	.loc 1 1178 0
	ldr	r3, [r3, #28]
.LVL105:
	.loc 1 1185 0
	mov	r6, #127
	.loc 1 1181 0
	lsl	r0, r3, #10
.LVL106:
	.loc 1 1183 0
	lsl	r7, r3, #17
	.loc 1 1185 0
	and	r6, r3
	.loc 1 1181 0
	lsr	r0, r0, #26
	.loc 1 1183 0
	lsr	r7, r7, #25
	.loc 1 1170 0
	mov	r4, r2
	.loc 1 1181 0
	strb	r0, [r2]
	.loc 1 1183 0
	strb	r7, [r2, #1]
	.loc 1 1185 0
	strb	r6, [r2, #2]
	.loc 1 1187 0
	mov	r2, #128
.LVL107:
	lsl	r2, r2, #15
	and	r2, r3
	lsr	r2, r2, #16
	strb	r2, [r4, #3]
	.loc 1 1189 0
	mov	r2, #128
	lsl	r2, r2, #23
	and	r2, r3
	str	r2, [r4, #8]
	.loc 1 1190 0
	ldr	r2, .L108+4
	.loc 1 1188 0
	lsl	r5, r3, #2
	lsr	r5, r5, #26
	.loc 1 1190 0
	and	r3, r2
.LVL108:
	.loc 1 1188 0
	strb	r5, [r4, #12]
	.loc 1 1190 0
	str	r3, [r4, #4]
	.loc 1 1192 0
	cmp	r1, #0
	bne	.L106
	.loc 1 1194 0
	bl	RTC_Bcd2ToByte
.LVL109:
	strb	r0, [r4]
	.loc 1 1196 0
	mov	r0, r7
	bl	RTC_Bcd2ToByte
.LVL110:
	strb	r0, [r4, #1]
	.loc 1 1198 0
	mov	r0, r6
	bl	RTC_Bcd2ToByte
.LVL111:
	strb	r0, [r4, #2]
	.loc 1 1200 0
	mov	r0, r5
	bl	RTC_Bcd2ToByte
.LVL112:
	strb	r0, [r4, #12]
.L106:
	.loc 1 1202 0
	@ sp needed
.LVL113:
	pop	{r3, r4, r5, r6, r7, pc}
.L109:
	.align	2
.L108:
	.word	1073752064
	.word	-2139062144
.LFE50:
	.size	RTC_GetAlarm, .-RTC_GetAlarm
	.section	.text.RTC_AlarmCmd,"ax",%progbits
	.align	1
	.global	RTC_AlarmCmd
	.code	16
	.thumb_func
	.type	RTC_AlarmCmd, %function
RTC_AlarmCmd:
.LFB51:
	.loc 1 1216 0
.LVL114:
	push	{r0, r1, r4, lr}
.LCFI12:
	.loc 1 1217 0
	mov	r3, #0
	str	r3, [sp, #4]
.LVL115:
	.loc 1 1226 0
	ldr	r3, .L116
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 1227 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 1232 0
	ldr	r2, [r3, #8]
	.loc 1 1230 0
	cmp	r1, #0
	beq	.L111
	.loc 1 1232 0
	orr	r0, r2
.LVL116:
	str	r0, [r3, #8]
.LVL117:
	.loc 1 1234 0
	mov	r0, #1
	b	.L112
.LVL118:
.L111:
	.loc 1 1239 0
	bic	r2, r0
	str	r2, [r3, #8]
	.loc 1 1244 0
	lsr	r0, r0, #8
.LVL119:
.L115:
	.loc 1 1244 0 is_stmt 0 discriminator 1
	ldr	r2, [r3, #12]
	.loc 1 1245 0 is_stmt 1 discriminator 1
	ldr	r1, [sp, #4]
	.loc 1 1244 0 discriminator 1
	and	r2, r0
.LVL120:
	.loc 1 1245 0 discriminator 1
	add	r1, r1, #1
	str	r1, [sp, #4]
	.loc 1 1246 0 discriminator 1
	ldr	r4, [sp, #4]
	mov	r1, #128
	lsl	r1, r1, #7
	cmp	r4, r1
	bne	.L113
.L114:
	.loc 1 1248 0
	ldr	r2, [r3, #12]
.LVL121:
	and	r0, r2
	sub	r2, r0, #1
	sbc	r0, r0, r2
	.loc 1 1234 0
	uxtb	r0, r0
	b	.L112
.LVL122:
.L113:
	.loc 1 1246 0 discriminator 1
	cmp	r2, #0
	beq	.L115
	b	.L114
.LVL123:
.L112:
	.loc 1 1259 0
	mov	r2, #255
	str	r2, [r3, #36]
	.loc 1 1262 0
	@ sp needed
	pop	{r1, r2, r4, pc}
.L117:
	.align	2
.L116:
	.word	1073752064
.LFE51:
	.size	RTC_AlarmCmd, .-RTC_AlarmCmd
	.section	.text.RTC_AlarmSubSecondConfig,"ax",%progbits
	.align	1
	.global	RTC_AlarmSubSecondConfig
	.code	16
	.thumb_func
	.type	RTC_AlarmSubSecondConfig, %function
RTC_AlarmSubSecondConfig:
.LFB52:
	.loc 1 1309 0
.LVL124:
	.loc 1 1318 0
	ldr	r3, .L119
	mov	r0, #202
.LVL125:
	.loc 1 1322 0
	lsl	r2, r2, #24
.LVL126:
	.loc 1 1318 0
	str	r0, [r3, #36]
	.loc 1 1322 0
	orr	r1, r2
.LVL127:
	.loc 1 1319 0
	mov	r0, #83
	.loc 1 1328 0
	mov	r2, #255
	.loc 1 1319 0
	str	r0, [r3, #36]
	.loc 1 1330 0
	@ sp needed
	.loc 1 1325 0
	str	r1, [r3, #68]
	.loc 1 1328 0
	str	r2, [r3, #36]
	.loc 1 1330 0
	bx	lr
.L120:
	.align	2
.L119:
	.word	1073752064
.LFE52:
	.size	RTC_AlarmSubSecondConfig, .-RTC_AlarmSubSecondConfig
	.section	.text.RTC_GetAlarmSubSecond,"ax",%progbits
	.align	1
	.global	RTC_GetAlarmSubSecond
	.code	16
	.thumb_func
	.type	RTC_GetAlarmSubSecond, %function
RTC_GetAlarmSubSecond:
.LFB53:
	.loc 1 1341 0
.LVL128:
	.loc 1 1345 0
	ldr	r3, .L122
	.loc 1 1348 0
	@ sp needed
	.loc 1 1345 0
	ldr	r0, [r3, #68]
.LVL129:
	lsl	r0, r0, #17
.LVL130:
	lsr	r0, r0, #17
	.loc 1 1348 0
	bx	lr
.L123:
	.align	2
.L122:
	.word	1073752064
.LFE53:
	.size	RTC_GetAlarmSubSecond, .-RTC_GetAlarmSubSecond
	.section	.text.RTC_DayLightSavingConfig,"ax",%progbits
	.align	1
	.global	RTC_DayLightSavingConfig
	.code	16
	.thumb_func
	.type	RTC_DayLightSavingConfig, %function
RTC_DayLightSavingConfig:
.LFB54:
	.loc 1 1383 0
.LVL131:
	.loc 1 1389 0
	ldr	r3, .L125
	mov	r2, #202
	.loc 1 1383 0
	push	{r4, lr}
.LCFI13:
	.loc 1 1389 0
	str	r2, [r3, #36]
	.loc 1 1390 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 1393 0
	ldr	r4, [r3, #8]
	ldr	r2, .L125+4
	.loc 1 1400 0
	@ sp needed
	.loc 1 1393 0
	and	r2, r4
	str	r2, [r3, #8]
	.loc 1 1396 0
	ldr	r2, [r3, #8]
	orr	r1, r2
.LVL132:
	orr	r0, r1
.LVL133:
	.loc 1 1399 0
	mov	r2, #255
	.loc 1 1396 0
	str	r0, [r3, #8]
	.loc 1 1399 0
	str	r2, [r3, #36]
	.loc 1 1400 0
	pop	{r4, pc}
.L126:
	.align	2
.L125:
	.word	1073752064
	.word	-262145
.LFE54:
	.size	RTC_DayLightSavingConfig, .-RTC_DayLightSavingConfig
	.section	.text.RTC_GetStoreOperation,"ax",%progbits
	.align	1
	.global	RTC_GetStoreOperation
	.code	16
	.thumb_func
	.type	RTC_GetStoreOperation, %function
RTC_GetStoreOperation:
.LFB55:
	.loc 1 1410 0
	.loc 1 1411 0
	ldr	r3, .L128
	mov	r0, #128
	ldr	r3, [r3, #8]
	lsl	r0, r0, #11
	and	r0, r3
	.loc 1 1412 0
	@ sp needed
	bx	lr
.L129:
	.align	2
.L128:
	.word	1073752064
.LFE55:
	.size	RTC_GetStoreOperation, .-RTC_GetStoreOperation
	.section	.text.RTC_OutputConfig,"ax",%progbits
	.align	1
	.global	RTC_OutputConfig
	.code	16
	.thumb_func
	.type	RTC_OutputConfig, %function
RTC_OutputConfig:
.LFB56:
	.loc 1 1446 0
.LVL134:
	.loc 1 1452 0
	ldr	r3, .L131
	mov	r2, #202
	.loc 1 1446 0
	push	{r4, lr}
.LCFI14:
	.loc 1 1452 0
	str	r2, [r3, #36]
	.loc 1 1453 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 1456 0
	ldr	r4, [r3, #8]
	ldr	r2, .L131+4
	.loc 1 1463 0
	@ sp needed
	.loc 1 1456 0
	and	r2, r4
	str	r2, [r3, #8]
	.loc 1 1459 0
	ldr	r2, [r3, #8]
	orr	r1, r2
.LVL135:
	orr	r0, r1
.LVL136:
	.loc 1 1462 0
	mov	r2, #255
	.loc 1 1459 0
	str	r0, [r3, #8]
	.loc 1 1462 0
	str	r2, [r3, #36]
	.loc 1 1463 0
	pop	{r4, pc}
.L132:
	.align	2
.L131:
	.word	1073752064
	.word	-7340033
.LFE56:
	.size	RTC_OutputConfig, .-RTC_OutputConfig
	.section	.text.RTC_CalibOutputCmd,"ax",%progbits
	.align	1
	.global	RTC_CalibOutputCmd
	.code	16
	.thumb_func
	.type	RTC_CalibOutputCmd, %function
RTC_CalibOutputCmd:
.LFB57:
	.loc 1 1489 0
.LVL137:
	.loc 1 1494 0
	ldr	r3, .L137
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 1495 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 1500 0
	ldr	r1, [r3, #8]
	.loc 1 1497 0
	cmp	r0, #0
	beq	.L134
	.loc 1 1500 0
	mov	r2, #128
	lsl	r2, r2, #16
	orr	r2, r1
	b	.L136
.L134:
	.loc 1 1505 0
	ldr	r2, .L137+4
	and	r2, r1
.L136:
	str	r2, [r3, #8]
	.loc 1 1509 0
	mov	r2, #255
	str	r2, [r3, #36]
	.loc 1 1510 0
	@ sp needed
	bx	lr
.L138:
	.align	2
.L137:
	.word	1073752064
	.word	-8388609
.LFE57:
	.size	RTC_CalibOutputCmd, .-RTC_CalibOutputCmd
	.section	.text.RTC_CalibOutputConfig,"ax",%progbits
	.align	1
	.global	RTC_CalibOutputConfig
	.code	16
	.thumb_func
	.type	RTC_CalibOutputConfig, %function
RTC_CalibOutputConfig:
.LFB58:
	.loc 1 1521 0
.LVL138:
	.loc 1 1526 0
	ldr	r3, .L140
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 1527 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 1530 0
	ldr	r1, [r3, #8]
	ldr	r2, .L140+4
	.loc 1 1537 0
	@ sp needed
	.loc 1 1530 0
	and	r2, r1
	str	r2, [r3, #8]
	.loc 1 1533 0
	ldr	r2, [r3, #8]
	orr	r0, r2
.LVL139:
	.loc 1 1536 0
	mov	r2, #255
	.loc 1 1533 0
	str	r0, [r3, #8]
	.loc 1 1536 0
	str	r2, [r3, #36]
	.loc 1 1537 0
	bx	lr
.L141:
	.align	2
.L140:
	.word	1073752064
	.word	-524289
.LFE58:
	.size	RTC_CalibOutputConfig, .-RTC_CalibOutputConfig
	.section	.text.RTC_SmoothCalibConfig,"ax",%progbits
	.align	1
	.global	RTC_SmoothCalibConfig
	.code	16
	.thumb_func
	.type	RTC_SmoothCalibConfig, %function
RTC_SmoothCalibConfig:
.LFB59:
	.loc 1 1559 0
.LVL140:
	.loc 1 1569 0
	ldr	r3, .L154
	.loc 1 1559 0
	push	{r4, r5, r6, lr}
.LCFI15:
	.loc 1 1569 0
	mov	r4, #202
	str	r4, [r3, #36]
	.loc 1 1570 0
	mov	r4, #83
	str	r4, [r3, #36]
	.loc 1 1573 0
	ldr	r4, [r3, #12]
	lsl	r5, r4, #15
	bpl	.L143
	ldr	r4, .L154+4
.LVL141:
.L144:
	.loc 1 1576 0 discriminator 1
	ldr	r5, [r3, #12]
	lsl	r6, r5, #15
	bpl	.L143
	sub	r4, r4, #1
.LVL142:
	.loc 1 1576 0 is_stmt 0 discriminator 2
	cmp	r4, #0
	bne	.L144
.LVL143:
.L143:
	.loc 1 1583 0 is_stmt 1
	ldr	r5, [r3, #12]
	.loc 1 1592 0
	mov	r4, #0
	.loc 1 1583 0
	lsl	r6, r5, #15
	bmi	.L146
	.loc 1 1586 0
	ldr	r4, .L154
	orr	r1, r2
.LVL144:
	orr	r0, r1
.LVL145:
	str	r0, [r4, #60]
.LVL146:
	.loc 1 1588 0
	mov	r4, #1
.LVL147:
.L146:
	.loc 1 1596 0
	mov	r2, #255
.LVL148:
	.loc 1 1599 0
	mov	r0, r4
	.loc 1 1596 0
	str	r2, [r3, #36]
	.loc 1 1599 0
	@ sp needed
.LVL149:
	pop	{r4, r5, r6, pc}
.L155:
	.align	2
.L154:
	.word	1073752064
	.word	4097
.LFE59:
	.size	RTC_SmoothCalibConfig, .-RTC_SmoothCalibConfig
	.section	.text.RTC_TimeStampCmd,"ax",%progbits
	.align	1
	.global	RTC_TimeStampCmd
	.code	16
	.thumb_func
	.type	RTC_TimeStampCmd, %function
RTC_TimeStampCmd:
.LFB60:
	.loc 1 1633 0
.LVL150:
	.loc 1 1641 0
	ldr	r3, .L159
	.loc 1 1633 0
	push	{r4, lr}
.LCFI16:
	.loc 1 1641 0
	ldr	r2, .L159+4
	ldr	r4, [r3, #8]
	and	r2, r4
.LVL151:
	.loc 1 1644 0
	cmp	r1, #0
	beq	.L157
	.loc 1 1646 0
	mov	r1, #128
.LVL152:
	lsl	r1, r1, #4
	orr	r2, r1
.LVL153:
.L157:
	.loc 1 1650 0
	orr	r0, r2
.LVL154:
	.loc 1 1654 0
	mov	r2, #202
	str	r2, [r3, #36]
	.loc 1 1655 0
	mov	r2, #83
	str	r2, [r3, #36]
	.loc 1 1661 0
	mov	r2, #255
	.loc 1 1658 0
	str	r0, [r3, #8]
	.loc 1 1662 0
	@ sp needed
	.loc 1 1661 0
	str	r2, [r3, #36]
	.loc 1 1662 0
	pop	{r4, pc}
.L160:
	.align	2
.L159:
	.word	1073752064
	.word	-2057
.LFE60:
	.size	RTC_TimeStampCmd, .-RTC_TimeStampCmd
	.section	.text.RTC_GetTimeStamp,"ax",%progbits
	.align	1
	.global	RTC_GetTimeStamp
	.code	16
	.thumb_func
	.type	RTC_GetTimeStamp, %function
RTC_GetTimeStamp:
.LFB61:
	.loc 1 1678 0
.LVL155:
	push	{r3, r4, r5, lr}
.LCFI17:
	.loc 1 1678 0
	mov	r4, r2
	.loc 1 1685 0
	ldr	r2, .L163
.LVL156:
	.loc 1 1678 0
	mov	r5, r1
	.loc 1 1685 0
	ldr	r3, [r2, #48]
.LVL157:
	.loc 1 1686 0
	ldr	r2, [r2, #52]
.LVL158:
	.loc 1 1689 0
	lsl	r1, r3, #10
.LVL159:
	lsr	r1, r1, #26
	strb	r1, [r5]
	.loc 1 1690 0
	lsl	r1, r3, #17
	lsr	r1, r1, #25
	strb	r1, [r5, #1]
	.loc 1 1691 0
	mov	r1, #127
	and	r1, r3
	strb	r1, [r5, #2]
	.loc 1 1692 0
	mov	r1, #128
	lsl	r1, r1, #15
	and	r3, r1
.LVL160:
	lsr	r3, r3, #16
	strb	r3, [r5, #3]
	.loc 1 1695 0
	mov	r3, #0
	strb	r3, [r4, #3]
	.loc 1 1696 0
	lsl	r3, r2, #19
	lsr	r3, r3, #27
	strb	r3, [r4, #1]
	.loc 1 1697 0
	mov	r3, #63
	and	r3, r2
	.loc 1 1698 0
	lsl	r2, r2, #16
.LVL161:
	lsr	r2, r2, #29
	.loc 1 1697 0
	strb	r3, [r4, #2]
	.loc 1 1698 0
	strb	r2, [r4]
	.loc 1 1701 0
	cmp	r0, #0
	bne	.L161
	.loc 1 1704 0
	ldrb	r0, [r5]
.LVL162:
	bl	RTC_Bcd2ToByte
.LVL163:
	strb	r0, [r5]
	.loc 1 1705 0
	ldrb	r0, [r5, #1]
	bl	RTC_Bcd2ToByte
.LVL164:
	strb	r0, [r5, #1]
	.loc 1 1706 0
	ldrb	r0, [r5, #2]
	bl	RTC_Bcd2ToByte
.LVL165:
	strb	r0, [r5, #2]
	.loc 1 1709 0
	ldrb	r0, [r4, #1]
	bl	RTC_Bcd2ToByte
.LVL166:
	strb	r0, [r4, #1]
	.loc 1 1710 0
	ldrb	r0, [r4, #2]
	bl	RTC_Bcd2ToByte
.LVL167:
	strb	r0, [r4, #2]
	.loc 1 1711 0
	ldrb	r0, [r4]
	bl	RTC_Bcd2ToByte
.LVL168:
	strb	r0, [r4]
.L161:
	.loc 1 1713 0
	@ sp needed
.LVL169:
.LVL170:
	pop	{r3, r4, r5, pc}
.L164:
	.align	2
.L163:
	.word	1073752064
.LFE61:
	.size	RTC_GetTimeStamp, .-RTC_GetTimeStamp
	.section	.text.RTC_GetTimeStampSubSecond,"ax",%progbits
	.align	1
	.global	RTC_GetTimeStampSubSecond
	.code	16
	.thumb_func
	.type	RTC_GetTimeStampSubSecond, %function
RTC_GetTimeStampSubSecond:
.LFB62:
	.loc 1 1721 0
	.loc 1 1723 0
	ldr	r3, .L166
	.loc 1 1724 0
	@ sp needed
	.loc 1 1723 0
	ldr	r0, [r3, #56]
	.loc 1 1724 0
	bx	lr
.L167:
	.align	2
.L166:
	.word	1073752064
.LFE62:
	.size	RTC_GetTimeStampSubSecond, .-RTC_GetTimeStampSubSecond
	.section	.text.RTC_TamperTriggerConfig,"ax",%progbits
	.align	1
	.global	RTC_TamperTriggerConfig
	.code	16
	.thumb_func
	.type	RTC_TamperTriggerConfig, %function
RTC_TamperTriggerConfig:
.LFB63:
	.loc 1 1759 0
.LVL171:
	ldr	r3, .L171
	lsl	r0, r0, #1
.LVL172:
	.loc 1 1767 0
	ldr	r2, [r3, #64]
	.loc 1 1764 0
	cmp	r1, #0
	bne	.L169
	.loc 1 1767 0
	bic	r2, r0
	str	r2, [r3, #64]
	b	.L168
.L169:
	.loc 1 1772 0
	orr	r0, r2
	str	r0, [r3, #64]
.L168:
	.loc 1 1774 0
	@ sp needed
	bx	lr
.L172:
	.align	2
.L171:
	.word	1073752064
.LFE63:
	.size	RTC_TamperTriggerConfig, .-RTC_TamperTriggerConfig
	.section	.text.RTC_TamperCmd,"ax",%progbits
	.align	1
	.global	RTC_TamperCmd
	.code	16
	.thumb_func
	.type	RTC_TamperCmd, %function
RTC_TamperCmd:
.LFB64:
	.loc 1 1788 0
.LVL173:
	ldr	r3, .L176
	.loc 1 1796 0
	ldr	r2, [r3, #64]
	.loc 1 1793 0
	cmp	r1, #0
	beq	.L174
	.loc 1 1796 0
	orr	r0, r2
.LVL174:
	str	r0, [r3, #64]
	b	.L173
.LVL175:
.L174:
	.loc 1 1801 0
	bic	r2, r0
	str	r2, [r3, #64]
.LVL176:
.L173:
	.loc 1 1803 0
	@ sp needed
	bx	lr
.L177:
	.align	2
.L176:
	.word	1073752064
.LFE64:
	.size	RTC_TamperCmd, .-RTC_TamperCmd
	.section	.text.RTC_TamperFilterConfig,"ax",%progbits
	.align	1
	.global	RTC_TamperFilterConfig
	.code	16
	.thumb_func
	.type	RTC_TamperFilterConfig, %function
RTC_TamperFilterConfig:
.LFB65:
	.loc 1 1819 0
.LVL177:
	.loc 1 1824 0
	ldr	r3, .L179
	ldr	r2, .L179+4
	ldr	r1, [r3, #64]
	.loc 1 1828 0
	@ sp needed
	.loc 1 1824 0
	and	r2, r1
	str	r2, [r3, #64]
	.loc 1 1827 0
	ldr	r2, [r3, #64]
	orr	r0, r2
.LVL178:
	str	r0, [r3, #64]
	.loc 1 1828 0
	bx	lr
.L180:
	.align	2
.L179:
	.word	1073752064
	.word	-6145
.LFE65:
	.size	RTC_TamperFilterConfig, .-RTC_TamperFilterConfig
	.section	.text.RTC_TamperSamplingFreqConfig,"ax",%progbits
	.align	1
	.global	RTC_TamperSamplingFreqConfig
	.code	16
	.thumb_func
	.type	RTC_TamperSamplingFreqConfig, %function
RTC_TamperSamplingFreqConfig:
.LFB66:
	.loc 1 1853 0
.LVL179:
	.loc 1 1858 0
	ldr	r3, .L182
	ldr	r2, .L182+4
	ldr	r1, [r3, #64]
	.loc 1 1862 0
	@ sp needed
	.loc 1 1858 0
	and	r2, r1
	str	r2, [r3, #64]
	.loc 1 1861 0
	ldr	r2, [r3, #64]
	orr	r0, r2
.LVL180:
	str	r0, [r3, #64]
	.loc 1 1862 0
	bx	lr
.L183:
	.align	2
.L182:
	.word	1073752064
	.word	-1793
.LFE66:
	.size	RTC_TamperSamplingFreqConfig, .-RTC_TamperSamplingFreqConfig
	.section	.text.RTC_TamperPinsPrechargeDuration,"ax",%progbits
	.align	1
	.global	RTC_TamperPinsPrechargeDuration
	.code	16
	.thumb_func
	.type	RTC_TamperPinsPrechargeDuration, %function
RTC_TamperPinsPrechargeDuration:
.LFB67:
	.loc 1 1876 0
.LVL181:
	.loc 1 1881 0
	ldr	r3, .L185
	ldr	r2, .L185+4
	ldr	r1, [r3, #64]
	.loc 1 1885 0
	@ sp needed
	.loc 1 1881 0
	and	r2, r1
	str	r2, [r3, #64]
	.loc 1 1884 0
	ldr	r2, [r3, #64]
	orr	r0, r2
.LVL182:
	str	r0, [r3, #64]
	.loc 1 1885 0
	bx	lr
.L186:
	.align	2
.L185:
	.word	1073752064
	.word	-24577
.LFE67:
	.size	RTC_TamperPinsPrechargeDuration, .-RTC_TamperPinsPrechargeDuration
	.section	.text.RTC_TimeStampOnTamperDetectionCmd,"ax",%progbits
	.align	1
	.global	RTC_TimeStampOnTamperDetectionCmd
	.code	16
	.thumb_func
	.type	RTC_TimeStampOnTamperDetectionCmd, %function
RTC_TimeStampOnTamperDetectionCmd:
.LFB68:
	.loc 1 1896 0
.LVL183:
	ldr	r3, .L191
	mov	r2, #128
	.loc 1 1903 0
	ldr	r1, [r3, #64]
	.loc 1 1900 0
	cmp	r0, #0
	beq	.L188
	.loc 1 1903 0
	orr	r2, r1
	b	.L190
.L188:
	.loc 1 1908 0
	bic	r1, r2
	mov	r2, r1
.L190:
	str	r2, [r3, #64]
	.loc 1 1910 0
	@ sp needed
	bx	lr
.L192:
	.align	2
.L191:
	.word	1073752064
.LFE68:
	.size	RTC_TimeStampOnTamperDetectionCmd, .-RTC_TimeStampOnTamperDetectionCmd
	.section	.text.RTC_TamperPullUpCmd,"ax",%progbits
	.align	1
	.global	RTC_TamperPullUpCmd
	.code	16
	.thumb_func
	.type	RTC_TamperPullUpCmd, %function
RTC_TamperPullUpCmd:
.LFB69:
	.loc 1 1919 0
.LVL184:
	ldr	r3, .L197
	.loc 1 1926 0
	ldr	r1, [r3, #64]
	.loc 1 1923 0
	cmp	r0, #0
	beq	.L194
	.loc 1 1926 0
	ldr	r2, .L197+4
	and	r2, r1
	b	.L196
.L194:
	.loc 1 1931 0
	mov	r2, #128
	lsl	r2, r2, #8
	orr	r2, r1
.L196:
	str	r2, [r3, #64]
	.loc 1 1933 0
	@ sp needed
	bx	lr
.L198:
	.align	2
.L197:
	.word	1073752064
	.word	-32769
.LFE69:
	.size	RTC_TamperPullUpCmd, .-RTC_TamperPullUpCmd
	.section	.text.RTC_WriteBackupRegister,"ax",%progbits
	.align	1
	.global	RTC_WriteBackupRegister
	.code	16
	.thumb_func
	.type	RTC_WriteBackupRegister, %function
RTC_WriteBackupRegister:
.LFB70:
	.loc 1 1960 0
.LVL185:
	sub	sp, sp, #8
.LCFI18:
	.loc 1 1961 0
	mov	r3, #0
	str	r3, [sp, #4]
	.loc 1 1966 0
	ldr	r3, .L200
	.loc 1 1967 0
	lsl	r0, r0, #2
.LVL186:
	.loc 1 1966 0
	str	r3, [sp, #4]
	.loc 1 1967 0
	ldr	r3, [sp, #4]
	add	r0, r0, r3
	str	r0, [sp, #4]
	.loc 1 1970 0
	ldr	r3, [sp, #4]
	str	r1, [r3]
	.loc 1 1971 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L201:
	.align	2
.L200:
	.word	1073752144
.LFE70:
	.size	RTC_WriteBackupRegister, .-RTC_WriteBackupRegister
	.section	.text.RTC_ReadBackupRegister,"ax",%progbits
	.align	1
	.global	RTC_ReadBackupRegister
	.code	16
	.thumb_func
	.type	RTC_ReadBackupRegister, %function
RTC_ReadBackupRegister:
.LFB71:
	.loc 1 1981 0
.LVL187:
	sub	sp, sp, #8
.LCFI19:
	.loc 1 1982 0
	mov	r3, #0
	str	r3, [sp, #4]
	.loc 1 1987 0
	ldr	r3, .L203
	.loc 1 1988 0
	lsl	r0, r0, #2
.LVL188:
	.loc 1 1987 0
	str	r3, [sp, #4]
	.loc 1 1988 0
	ldr	r3, [sp, #4]
	add	r0, r0, r3
	str	r0, [sp, #4]
	.loc 1 1991 0
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	.loc 1 1992 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L204:
	.align	2
.L203:
	.word	1073752144
.LFE71:
	.size	RTC_ReadBackupRegister, .-RTC_ReadBackupRegister
	.section	.text.RTC_OutputTypeConfig,"ax",%progbits
	.align	1
	.global	RTC_OutputTypeConfig
	.code	16
	.thumb_func
	.type	RTC_OutputTypeConfig, %function
RTC_OutputTypeConfig:
.LFB72:
	.loc 1 2021 0
.LVL189:
	.loc 1 2025 0
	ldr	r3, .L206
	ldr	r2, .L206+4
	ldr	r1, [r3, #64]
	.loc 1 2027 0
	@ sp needed
	.loc 1 2025 0
	and	r2, r1
	str	r2, [r3, #64]
	.loc 1 2026 0
	ldr	r2, [r3, #64]
	orr	r0, r2
.LVL190:
	str	r0, [r3, #64]
	.loc 1 2027 0
	bx	lr
.L207:
	.align	2
.L206:
	.word	1073752064
	.word	-262145
.LFE72:
	.size	RTC_OutputTypeConfig, .-RTC_OutputTypeConfig
	.section	.text.RTC_SynchroShiftConfig,"ax",%progbits
	.align	1
	.global	RTC_SynchroShiftConfig
	.code	16
	.thumb_func
	.type	RTC_SynchroShiftConfig, %function
RTC_SynchroShiftConfig:
.LFB73:
	.loc 1 2059 0
.LVL191:
	.loc 1 2068 0
	ldr	r3, .L221
	.loc 1 2059 0
	mov	r2, r0
	.loc 1 2068 0
	mov	r0, #202
.LVL192:
	.loc 1 2059 0
	push	{r4, r5, r6, lr}
.LCFI20:
	.loc 1 2068 0
	str	r0, [r3, #36]
	.loc 1 2069 0
	mov	r0, #83
	str	r0, [r3, #36]
	.loc 1 2072 0
	ldr	r0, [r3, #12]
	mov	r4, r3
	lsl	r3, r0, #28
	bpl	.L209
	ldr	r3, .L221+4
.LVL193:
.L210:
	.loc 1 2075 0 discriminator 1
	ldr	r0, [r4, #12]
	lsl	r5, r0, #28
	bpl	.L209
	sub	r3, r3, #1
.LVL194:
	.loc 1 2075 0 is_stmt 0 discriminator 2
	cmp	r3, #0
	bne	.L210
.LVL195:
.L209:
	.loc 1 2082 0 is_stmt 1
	ldr	r5, [r4, #12]
	ldr	r3, .L221
	.loc 1 2106 0
	mov	r0, #0
	.loc 1 2082 0
	lsl	r6, r5, #28
	bmi	.L212
	.loc 1 2085 0
	ldr	r5, [r3, #8]
	lsl	r6, r5, #27
	bmi	.L212
	.loc 1 2088 0
	orr	r2, r1
.LVL196:
	str	r2, [r3, #44]
	.loc 1 2090 0
	bl	RTC_WaitForSynchro
.LVL197:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 2101 0
	uxtb	r0, r0
.L212:
.LVL198:
	.loc 1 2110 0
	mov	r3, #255
	str	r3, [r4, #36]
	.loc 1 2113 0
	@ sp needed
	pop	{r4, r5, r6, pc}
.L222:
	.align	2
.L221:
	.word	1073752064
	.word	4097
.LFE73:
	.size	RTC_SynchroShiftConfig, .-RTC_SynchroShiftConfig
	.section	.text.RTC_ITConfig,"ax",%progbits
	.align	1
	.global	RTC_ITConfig
	.code	16
	.thumb_func
	.type	RTC_ITConfig, %function
RTC_ITConfig:
.LFB74:
	.loc 1 2168 0
.LVL199:
	.loc 1 2174 0
	ldr	r3, .L226
	mov	r2, #202
	.loc 1 2168 0
	push	{r4, lr}
.LCFI21:
	.loc 1 2174 0
	str	r2, [r3, #36]
	.loc 1 2175 0
	mov	r2, #83
	str	r2, [r3, #36]
	mov	r2, #4
	.loc 1 2177 0
	cmp	r1, #0
	beq	.L224
	.loc 1 2180 0
	ldr	r1, [r3, #8]
.LVL200:
	mov	r4, r0
	bic	r4, r2
	orr	r1, r4
	str	r1, [r3, #8]
	.loc 1 2182 0
	ldr	r1, [r3, #64]
	and	r0, r2
.LVL201:
	orr	r0, r1
	str	r0, [r3, #64]
	b	.L225
.LVL202:
.L224:
	.loc 1 2187 0
	ldr	r1, [r3, #8]
.LVL203:
	mov	r4, r0
	bic	r4, r2
	bic	r1, r4
	str	r1, [r3, #8]
	.loc 1 2189 0
	ldr	r1, [r3, #64]
	and	r0, r2
.LVL204:
	mov	r2, r1
	bic	r2, r0
	str	r2, [r3, #64]
.L225:
	.loc 1 2192 0
	mov	r2, #255
	str	r2, [r3, #36]
	.loc 1 2193 0
	@ sp needed
	pop	{r4, pc}
.L227:
	.align	2
.L226:
	.word	1073752064
.LFE74:
	.size	RTC_ITConfig, .-RTC_ITConfig
	.section	.text.RTC_GetFlagStatus,"ax",%progbits
	.align	1
	.global	RTC_GetFlagStatus
	.code	16
	.thumb_func
	.type	RTC_GetFlagStatus, %function
RTC_GetFlagStatus:
.LFB75:
	.loc 1 2212 0
.LVL205:
	.loc 1 2220 0
	ldr	r3, .L229
	.loc 1 2232 0
	@ sp needed
	.loc 1 2220 0
	ldr	r2, [r3, #12]
.LVL206:
	ldr	r3, .L229+4
	and	r3, r2
.LVL207:
	.loc 1 2223 0
	and	r0, r3
.LVL208:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL209:
	.loc 1 2231 0
	uxtb	r0, r0
	.loc 1 2232 0
	bx	lr
.L230:
	.align	2
.L229:
	.word	1073752064
	.word	129400
.LFE75:
	.size	RTC_GetFlagStatus, .-RTC_GetFlagStatus
	.section	.text.RTC_ClearFlag,"ax",%progbits
	.align	1
	.global	RTC_ClearFlag
	.code	16
	.thumb_func
	.type	RTC_ClearFlag, %function
RTC_ClearFlag:
.LFB76:
	.loc 1 2248 0
.LVL210:
	.loc 1 2253 0
	ldr	r3, .L232
	ldr	r2, .L232+4
	ldr	r1, [r3, #12]
	and	r0, r2
.LVL211:
	mov	r2, #128
	orr	r0, r2
	mvn	r0, r0
	and	r2, r1
	orr	r2, r0
	str	r2, [r3, #12]
	.loc 1 2254 0
	@ sp needed
	bx	lr
.L233:
	.align	2
.L232:
	.word	1073752064
	.word	130943
.LFE76:
	.size	RTC_ClearFlag, .-RTC_ClearFlag
	.section	.text.RTC_GetITStatus,"ax",%progbits
	.align	1
	.global	RTC_GetITStatus
	.code	16
	.thumb_func
	.type	RTC_GetITStatus, %function
RTC_GetITStatus:
.LFB77:
	.loc 1 2268 0
.LVL212:
	.loc 1 2276 0
	ldr	r2, .L238
	.loc 1 2268 0
	push	{r4, r5, lr}
.LCFI22:
	.loc 1 2276 0
	ldr	r4, [r2, #64]
.LVL213:
	.loc 1 2268 0
	mov	r3, r0
	.loc 1 2276 0
	mov	r1, #4
	and	r1, r4
.LVL214:
	.loc 1 2279 0
	mov	r5, r3
	lsr	r4, r3, #18
	ldr	r0, [r2, #8]
.LVL215:
	lsr	r5, r5, r4
	lsr	r4, r5, #15
	and	r0, r3
	and	r1, r4
.LVL216:
	orr	r1, r0
	.loc 1 2291 0
	mov	r0, #0
	.loc 1 2282 0
	ldr	r2, [r2, #12]
.LVL217:
	.loc 1 2285 0
	cmp	r1, r0
	beq	.L235
	.loc 1 2282 0 discriminator 1
	lsr	r3, r3, #4
.LVL218:
	uxth	r0, r2
	.loc 1 2285 0 discriminator 1
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL219:
	.loc 1 2287 0 discriminator 1
	uxtb	r0, r0
.L235:
.LVL220:
	.loc 1 2294 0
	@ sp needed
	pop	{r4, r5, pc}
.L239:
	.align	2
.L238:
	.word	1073752064
.LFE77:
	.size	RTC_GetITStatus, .-RTC_GetITStatus
	.section	.text.RTC_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	RTC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	RTC_ClearITPendingBit, %function
RTC_ClearITPendingBit:
.LFB78:
	.loc 1 2308 0
.LVL221:
	.loc 1 2318 0
	ldr	r3, .L241
	.loc 1 2308 0
	push	{r4, lr}
.LCFI23:
	.loc 1 2315 0
	lsr	r1, r0, #4
.LVL222:
	.loc 1 2318 0
	ldr	r4, [r3, #12]
	mov	r2, #128
	uxth	r1, r1
.LVL223:
	orr	r1, r2
	mvn	r1, r1
	and	r2, r4
	orr	r2, r1
	str	r2, [r3, #12]
	.loc 1 2319 0
	@ sp needed
	pop	{r4, pc}
.L242:
	.align	2
.L241:
	.word	1073752064
.LFE78:
	.size	RTC_ClearITPendingBit, .-RTC_ClearITPendingBit
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
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
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
	.byte	0x4
	.4byte	.LCFI0-.LFB36
	.byte	0xe
	.uleb128 0x8
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI2-.LFB38
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI3-.LFB32
	.byte	0xe
	.uleb128 0x18
	.byte	0x80
	.uleb128 0x6
	.byte	0x81
	.uleb128 0x5
	.byte	0x82
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI4-.LFB39
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI5-.LFB41
	.byte	0xe
	.uleb128 0x20
	.byte	0x80
	.uleb128 0x8
	.byte	0x81
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x6
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI6-.LFB43
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI7-.LFB45
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI8-.LFB47
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI9-.LFB48
	.byte	0xe
	.uleb128 0x14
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x28
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI11-.LFB50
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
	.byte	0x84
	.uleb128 0x5
	.byte	0x85
	.uleb128 0x4
	.byte	0x86
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI12-.LFB51
	.byte	0xe
	.uleb128 0x10
	.byte	0x80
	.uleb128 0x4
	.byte	0x81
	.uleb128 0x3
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI13-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI14-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.byte	0x4
	.4byte	.LCFI15-.LFB59
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.byte	0x4
	.4byte	.LCFI16-.LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI17-.LFB61
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI18-.LFB70
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI19-.LFB71
	.byte	0xe
	.uleb128 0x8
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI20-.LFB73
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI21-.LFB74
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.align	2
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.byte	0x4
	.4byte	.LCFI22-.LFB77
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.byte	0x4
	.4byte	.LCFI23-.LFB78
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE96:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rtc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x10c5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF153
	.byte	0x1
	.4byte	.LASF154
	.4byte	.LASF155
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
	.byte	0x3
	.byte	0xdf
	.4byte	0x94
	.uleb128 0x7
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0x8
	.ascii	"SET\000"
	.sleb128 1
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
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe4
	.4byte	0xdf
	.uleb128 0x7
	.4byte	.LASF16
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF17
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x3
	.byte	0xe4
	.4byte	0xca
	.uleb128 0x9
	.byte	0x64
	.byte	0x3
	.2byte	0x1ee
	.4byte	0x236
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
	.4byte	0xea
	.uleb128 0xd
	.byte	0xc
	.byte	0x4
	.byte	0x35
	.4byte	0x26f
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
	.4byte	0x242
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.byte	0x44
	.4byte	0x2b3
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
	.4byte	0x27a
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.byte	0x58
	.4byte	0x2f7
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
	.4byte	0x2be
	.uleb128 0xd
	.byte	0x10
	.byte	0x4
	.byte	0x6a
	.4byte	0x33b
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x4
	.byte	0x6c
	.4byte	0x2b3
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
	.4byte	0x302
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x1d1
	.4byte	0xdf
	.byte	0x1
	.4byte	0x37c
	.uleb128 0x10
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x1d3
	.4byte	0x7a
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x1d4
	.4byte	0xdf
	.uleb128 0x10
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1d5
	.4byte	0x53
	.byte	0
	.uleb128 0xf
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x214
	.4byte	0xdf
	.byte	0x1
	.4byte	0x3b2
	.uleb128 0x10
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x216
	.4byte	0x7a
	.uleb128 0x10
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x217
	.4byte	0xdf
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x218
	.4byte	0x53
	.byte	0
	.uleb128 0x11
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x91a
	.4byte	0x2c
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ed
	.uleb128 0x12
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x91a
	.4byte	0x2c
	.4byte	.LLST0
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x91c
	.4byte	0x2c
	.4byte	.LLST1
	.byte	0
	.uleb128 0x11
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x92c
	.4byte	0x2c
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x428
	.uleb128 0x12
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x92c
	.4byte	0x2c
	.4byte	.LLST2
	.uleb128 0x14
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x92e
	.4byte	0x2c
	.4byte	.LLST3
	.byte	0
	.uleb128 0x15
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x1a0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x44f
	.uleb128 0x12
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x1a0
	.4byte	0x44f
	.4byte	.LLST4
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x26f
	.uleb128 0x15
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x1b6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47a
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x1b6
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	0x346
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c1
	.uleb128 0x19
	.4byte	0x357
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1a
	.4byte	0x363
	.4byte	.LLST5
	.uleb128 0x1a
	.4byte	0x36f
	.4byte	.LLST6
	.uleb128 0x1b
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x1c
	.4byte	0x357
	.uleb128 0x1c
	.4byte	0x363
	.uleb128 0x1c
	.4byte	0x36f
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF156
	.byte	0x1
	.2byte	0x1fe
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1e
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x172
	.4byte	0xdf
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x520
	.uleb128 0x12
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x172
	.4byte	0x44f
	.4byte	.LLST7
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x174
	.4byte	0xdf
	.4byte	.LLST8
	.uleb128 0x1f
	.4byte	.LVL18
	.4byte	0x346
	.uleb128 0x1f
	.4byte	.LVL19
	.4byte	0x4c1
	.byte	0
	.uleb128 0x18
	.4byte	0x37c
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56b
	.uleb128 0x19
	.4byte	0x38d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1a
	.4byte	0x399
	.4byte	.LLST9
	.uleb128 0x1a
	.4byte	0x3a5
	.4byte	.LLST10
	.uleb128 0x1b
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x1c
	.4byte	0x38d
	.uleb128 0x1a
	.4byte	0x399
	.4byte	.LLST11
	.uleb128 0x1c
	.4byte	0x3a5
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x135
	.4byte	0xdf
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b7
	.uleb128 0x20
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x137
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x138
	.4byte	0xdf
	.4byte	.LLST12
	.uleb128 0x1f
	.4byte	.LVL29
	.4byte	0x346
	.uleb128 0x1f
	.4byte	.LVL30
	.4byte	0x37c
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x247
	.4byte	0xdf
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x604
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x247
	.4byte	0xbf
	.4byte	.LLST13
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x249
	.4byte	0xdf
	.4byte	.LLST14
	.uleb128 0x1f
	.4byte	.LVL33
	.4byte	0x346
	.uleb128 0x1f
	.4byte	.LVL34
	.4byte	0x4c1
	.byte	0
	.uleb128 0x15
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x277
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x629
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x277
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x2ad
	.4byte	0xdf
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6cc
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x2ad
	.4byte	0x53
	.4byte	.LLST15
	.uleb128 0x12
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x2ad
	.4byte	0x6cc
	.4byte	.LLST16
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x2af
	.4byte	0x53
	.4byte	.LLST17
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x2b0
	.4byte	0xdf
	.4byte	.LLST18
	.uleb128 0x1f
	.4byte	.LVL43
	.4byte	0x346
	.uleb128 0x1f
	.4byte	.LVL46
	.4byte	0x4c1
	.uleb128 0x1f
	.4byte	.LVL47
	.4byte	0x37c
	.uleb128 0x1f
	.4byte	.LVL50
	.4byte	0x3b2
	.uleb128 0x21
	.4byte	.LVL51
	.4byte	0x3b2
	.4byte	0x6bb
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.4byte	.LVL52
	.4byte	0x3b2
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x2b3
	.uleb128 0x15
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x315
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f7
	.uleb128 0x17
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x315
	.4byte	0x6cc
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x328
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x76b
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x328
	.4byte	0x53
	.4byte	.LLST19
	.uleb128 0x12
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x328
	.4byte	0x6cc
	.4byte	.LLST20
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x32a
	.4byte	0x53
	.4byte	.LLST21
	.uleb128 0x1f
	.4byte	.LVL60
	.4byte	0x3ed
	.uleb128 0x21
	.4byte	.LVL61
	.4byte	0x3ed
	.4byte	0x75a
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.4byte	.LVL62
	.4byte	0x3ed
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x349
	.4byte	0x53
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x796
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x34b
	.4byte	0x53
	.4byte	.LLST22
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x362
	.4byte	0xdf
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x83d
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x362
	.4byte	0x53
	.4byte	.LLST23
	.uleb128 0x12
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x362
	.4byte	0x83d
	.4byte	.LLST24
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x364
	.4byte	0x53
	.4byte	.LLST25
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x365
	.4byte	0xdf
	.4byte	.LLST26
	.uleb128 0x21
	.4byte	.LVL68
	.4byte	0x3b2
	.4byte	0x804
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL69
	.4byte	0x3b2
	.uleb128 0x21
	.4byte	.LVL71
	.4byte	0x3b2
	.4byte	0x821
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL73
	.4byte	0x346
	.uleb128 0x1f
	.4byte	.LVL75
	.4byte	0x4c1
	.uleb128 0x1f
	.4byte	.LVL76
	.4byte	0x37c
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x2f7
	.uleb128 0x15
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x3bd
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x868
	.uleb128 0x17
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x3bd
	.4byte	0x83d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8dc
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x53
	.4byte	.LLST27
	.uleb128 0x12
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x83d
	.4byte	.LLST28
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x3d2
	.4byte	0x53
	.4byte	.LLST29
	.uleb128 0x1f
	.4byte	.LVL85
	.4byte	0x3ed
	.uleb128 0x21
	.4byte	.LVL86
	.4byte	0x3ed
	.4byte	0x8cb
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.4byte	.LVL87
	.4byte	0x3ed
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x40c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x96d
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x40c
	.4byte	0x53
	.4byte	.LLST30
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x40c
	.4byte	0x53
	.4byte	.LLST31
	.uleb128 0x12
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x40c
	.4byte	0x96d
	.4byte	.LLST32
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x40e
	.4byte	0x53
	.4byte	.LLST33
	.uleb128 0x1f
	.4byte	.LVL97
	.4byte	0x3b2
	.uleb128 0x21
	.4byte	.LVL98
	.4byte	0x3b2
	.4byte	0x94f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.4byte	.LVL99
	.4byte	0x3b2
	.4byte	0x963
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL100
	.4byte	0x3b2
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x33b
	.uleb128 0x15
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x474
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x998
	.uleb128 0x17
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x474
	.4byte	0x96d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x491
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa30
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x491
	.4byte	0x53
	.4byte	.LLST34
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x491
	.4byte	0x53
	.4byte	.LLST35
	.uleb128 0x12
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x491
	.4byte	0x96d
	.4byte	.LLST36
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x493
	.4byte	0x53
	.4byte	.LLST37
	.uleb128 0x1f
	.4byte	.LVL109
	.4byte	0x3ed
	.uleb128 0x21
	.4byte	.LVL110
	.4byte	0x3ed
	.4byte	0xa0b
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x21
	.4byte	.LVL111
	.4byte	0x3ed
	.4byte	0xa1f
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.4byte	.LVL112
	.4byte	0x3ed
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x4bf
	.4byte	0xdf
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa9a
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x4bf
	.4byte	0x53
	.4byte	.LLST38
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x4bf
	.4byte	0xbf
	.4byte	.LLST39
	.uleb128 0x20
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x4c1
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x4c2
	.4byte	0x53
	.4byte	.LLST40
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x4c3
	.4byte	0xdf
	.4byte	.LLST41
	.byte	0
	.uleb128 0x15
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x51c
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaf1
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x51c
	.4byte	0x53
	.4byte	.LLST42
	.uleb128 0x12
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x51c
	.4byte	0x53
	.4byte	.LLST43
	.uleb128 0x12
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x51c
	.4byte	0x2c
	.4byte	.LLST44
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x51e
	.4byte	0x53
	.4byte	.LLST45
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x53c
	.4byte	0x53
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb2c
	.uleb128 0x12
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x53c
	.4byte	0x53
	.4byte	.LLST46
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x53e
	.4byte	0x53
	.4byte	.LLST47
	.byte	0
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x566
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb63
	.uleb128 0x12
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x566
	.4byte	0x53
	.4byte	.LLST48
	.uleb128 0x12
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x566
	.4byte	0x53
	.4byte	.LLST49
	.byte	0
	.uleb128 0x24
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x581
	.4byte	0x53
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x5a5
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbb0
	.uleb128 0x12
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x5a5
	.4byte	0x53
	.4byte	.LLST50
	.uleb128 0x12
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x5a5
	.4byte	0x53
	.4byte	.LLST51
	.byte	0
	.uleb128 0x15
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x5d0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbd5
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x5d0
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x5f0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbfc
	.uleb128 0x12
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x5f0
	.4byte	0x53
	.4byte	.LLST52
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x614
	.4byte	0xdf
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc67
	.uleb128 0x12
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x614
	.4byte	0x53
	.4byte	.LLST53
	.uleb128 0x12
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x615
	.4byte	0x53
	.4byte	.LLST54
	.uleb128 0x12
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x616
	.4byte	0x53
	.4byte	.LLST55
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x618
	.4byte	0xdf
	.4byte	.LLST56
	.uleb128 0x13
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x619
	.4byte	0x53
	.4byte	.LLST57
	.byte	0
	.uleb128 0x15
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x660
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcae
	.uleb128 0x12
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x660
	.4byte	0x53
	.4byte	.LLST58
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x660
	.4byte	0xbf
	.4byte	.LLST59
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x662
	.4byte	0x53
	.4byte	.LLST60
	.byte	0
	.uleb128 0x15
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x68c
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd4b
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x68c
	.4byte	0x53
	.4byte	.LLST61
	.uleb128 0x12
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x68c
	.4byte	0x6cc
	.4byte	.LLST62
	.uleb128 0x12
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x68d
	.4byte	0x83d
	.4byte	.LLST63
	.uleb128 0x13
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x68f
	.4byte	0x53
	.4byte	.LLST64
	.uleb128 0x13
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x68f
	.4byte	0x53
	.4byte	.LLST65
	.uleb128 0x1f
	.4byte	.LVL163
	.4byte	0x3ed
	.uleb128 0x1f
	.4byte	.LVL164
	.4byte	0x3ed
	.uleb128 0x1f
	.4byte	.LVL165
	.4byte	0x3ed
	.uleb128 0x1f
	.4byte	.LVL166
	.4byte	0x3ed
	.uleb128 0x1f
	.4byte	.LVL167
	.4byte	0x3ed
	.uleb128 0x1f
	.4byte	.LVL168
	.4byte	0x3ed
	.byte	0
	.uleb128 0x24
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x6b8
	.4byte	0x53
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x6de
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd96
	.uleb128 0x12
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x6de
	.4byte	0x53
	.4byte	.LLST66
	.uleb128 0x17
	.4byte	.LASF125
	.byte	0x1
	.2byte	0x6de
	.4byte	0x53
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x15
	.4byte	.LASF126
	.byte	0x1
	.2byte	0x6fb
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdcb
	.uleb128 0x12
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x6fb
	.4byte	0x53
	.4byte	.LLST67
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x6fb
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x15
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x71a
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdf2
	.uleb128 0x12
	.4byte	.LASF128
	.byte	0x1
	.2byte	0x71a
	.4byte	0x53
	.4byte	.LLST68
	.byte	0
	.uleb128 0x15
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x73c
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe19
	.uleb128 0x12
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x73c
	.4byte	0x53
	.4byte	.LLST69
	.byte	0
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x753
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe40
	.uleb128 0x12
	.4byte	.LASF132
	.byte	0x1
	.2byte	0x753
	.4byte	0x53
	.4byte	.LLST70
	.byte	0
	.uleb128 0x15
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x767
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe65
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x767
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF134
	.byte	0x1
	.2byte	0x77e
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe8a
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x77e
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x7a7
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xece
	.uleb128 0x12
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x7a7
	.4byte	0x53
	.4byte	.LLST71
	.uleb128 0x17
	.4byte	.LASF137
	.byte	0x1
	.2byte	0x7a7
	.4byte	0x53
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x25
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x7a9
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF138
	.byte	0x1
	.2byte	0x7bc
	.4byte	0x53
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf08
	.uleb128 0x12
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x7bc
	.4byte	0x53
	.4byte	.LLST72
	.uleb128 0x25
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x7be
	.4byte	0x7a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x15
	.4byte	.LASF139
	.byte	0x1
	.2byte	0x7e4
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf2f
	.uleb128 0x12
	.4byte	.LASF140
	.byte	0x1
	.2byte	0x7e4
	.4byte	0x53
	.4byte	.LLST73
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x80a
	.4byte	0xdf
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf93
	.uleb128 0x12
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x80a
	.4byte	0x53
	.4byte	.LLST74
	.uleb128 0x12
	.4byte	.LASF143
	.byte	0x1
	.2byte	0x80a
	.4byte	0x53
	.4byte	.LLST75
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x80c
	.4byte	0xdf
	.4byte	.LLST76
	.uleb128 0x13
	.4byte	.LASF144
	.byte	0x1
	.2byte	0x80d
	.4byte	0x53
	.4byte	.LLST77
	.uleb128 0x1f
	.4byte	.LVL197
	.4byte	0x37c
	.byte	0
	.uleb128 0x15
	.4byte	.LASF145
	.byte	0x1
	.2byte	0x877
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfca
	.uleb128 0x12
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x877
	.4byte	0x53
	.4byte	.LLST78
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x877
	.4byte	0xbf
	.4byte	.LLST79
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF147
	.byte	0x1
	.2byte	0x8a3
	.4byte	0x94
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1015
	.uleb128 0x12
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x8a3
	.4byte	0x53
	.4byte	.LLST80
	.uleb128 0x13
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x8a5
	.4byte	0x94
	.4byte	.LLST81
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x8a6
	.4byte	0x53
	.4byte	.LLST82
	.byte	0
	.uleb128 0x15
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x8c7
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x103c
	.uleb128 0x12
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x8c7
	.4byte	0x53
	.4byte	.LLST83
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x8db
	.4byte	0x9f
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1097
	.uleb128 0x12
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x8db
	.4byte	0x53
	.4byte	.LLST84
	.uleb128 0x13
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x8dd
	.4byte	0x9f
	.4byte	.LLST85
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x8de
	.4byte	0x53
	.4byte	.LLST86
	.uleb128 0x13
	.4byte	.LASF152
	.byte	0x1
	.2byte	0x8de
	.4byte	0x53
	.4byte	.LLST87
	.byte	0
	.uleb128 0x26
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x903
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x903
	.4byte	0x53
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x905
	.4byte	0x53
	.4byte	.LLST88
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
	.uleb128 0x20
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x3
	.byte	0x70
	.sleb128 10
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x3
	.byte	0x73
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LFE80
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
	.2byte	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x3a
	.byte	0x1e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE34
	.2byte	0x3
	.byte	0x70
	.sleb128 -12
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL13
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LFE36
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18-1
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL21
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17
	.4byte	.LVL19
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL22
	.4byte	.LVL27
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL27
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL28
	.4byte	.LVL31
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL31
	.4byte	.LFE32
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL32
	.4byte	.LVL33-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL33-1
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL32
	.4byte	.LVL34
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LFE39
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL40
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL41
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL37
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL42
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL44
	.4byte	.LVL49
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL49
	.4byte	.LVL50-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL50-1
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL37
	.4byte	.LVL42
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL49
	.4byte	.LVL53
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL53
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL37
	.4byte	.LVL48
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL48
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL49
	.4byte	.LFE41
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL55
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL57
	.4byte	.LVL60-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL60-1
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL55
	.4byte	.LVL58
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL58
	.4byte	.LVL63
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL63
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL56
	.4byte	.LVL59
	.2byte	0x9
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.4byte	0x7f7f7f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL64
	.4byte	.LVL65
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL65
	.4byte	.LFE44
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL67
	.4byte	.LVL77
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL77
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL79
	.4byte	.LFE45
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL66
	.4byte	.LVL68-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL68-1
	.4byte	.LVL70
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL70
	.4byte	.LVL77
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL77
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL79
	.4byte	.LFE45
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL66
	.4byte	.LVL72
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL72
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL66
	.4byte	.LVL79
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL79
	.4byte	.LFE45
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL81
	.4byte	.LVL83
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL83
	.4byte	.LVL85-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL85-1
	.4byte	.LFE47
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL81
	.4byte	.LVL85-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL85-1
	.4byte	.LVL88
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL88
	.4byte	.LFE47
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL81
	.4byte	.LVL82
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL82
	.4byte	.LVL84
	.2byte	0x9
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.4byte	0xffff3f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL89
	.4byte	.LVL92
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL92
	.4byte	.LVL93
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL93
	.4byte	.LVL96
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL96
	.4byte	.LVL97-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL97-1
	.4byte	.LFE48
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL89
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL91
	.4byte	.LFE48
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL89
	.4byte	.LVL90
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL90
	.4byte	.LVL94
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL94
	.4byte	.LVL96
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	.LVL96
	.4byte	.LFE48
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL89
	.4byte	.LVL93
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL93
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL96
	.4byte	.LVL101
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL101
	.4byte	.LFE48
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL103
	.4byte	.LVL106
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL106
	.4byte	.LVL109-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL109-1
	.4byte	.LFE50
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL103
	.4byte	.LVL104
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL104
	.4byte	.LFE50
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL103
	.4byte	.LVL107
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL107
	.4byte	.LVL113
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL113
	.4byte	.LFE50
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL103
	.4byte	.LVL105
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL105
	.4byte	.LVL108
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST38:
	.4byte	.LVL114
	.4byte	.LVL116
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL116
	.4byte	.LVL118
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL118
	.4byte	.LVL119
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL119
	.4byte	.LFE51
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL114
	.4byte	.LVL119
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL119
	.4byte	.LFE51
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST40:
	.4byte	.LVL115
	.4byte	.LVL119
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL120
	.4byte	.LVL121
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL122
	.4byte	.LVL123
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST41:
	.4byte	.LVL115
	.4byte	.LVL117
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL117
	.4byte	.LVL118
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL118
	.4byte	.LVL123
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL123
	.4byte	.LFE51
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST42:
	.4byte	.LVL124
	.4byte	.LVL125
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL125
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST43:
	.4byte	.LVL124
	.4byte	.LVL127
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL127
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST44:
	.4byte	.LVL124
	.4byte	.LVL126
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL126
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST45:
	.4byte	.LVL124
	.4byte	.LVL127
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL127
	.4byte	.LFE52
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST46:
	.4byte	.LVL128
	.4byte	.LVL129
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL129
	.4byte	.LFE53
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST47:
	.4byte	.LVL128
	.4byte	.LVL129
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL129
	.4byte	.LVL130
	.2byte	0x7
	.byte	0x70
	.sleb128 0
	.byte	0xa
	.2byte	0x7fff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST48:
	.4byte	.LVL131
	.4byte	.LVL133
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL133
	.4byte	.LFE54
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST49:
	.4byte	.LVL131
	.4byte	.LVL132
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL132
	.4byte	.LFE54
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST50:
	.4byte	.LVL134
	.4byte	.LVL136
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL136
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST51:
	.4byte	.LVL134
	.4byte	.LVL135
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL135
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST52:
	.4byte	.LVL138
	.4byte	.LVL139
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL139
	.4byte	.LFE58
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST53:
	.4byte	.LVL140
	.4byte	.LVL145
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL145
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST54:
	.4byte	.LVL140
	.4byte	.LVL144
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL144
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST55:
	.4byte	.LVL140
	.4byte	.LVL148
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL148
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST56:
	.4byte	.LVL140
	.4byte	.LVL146
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL146
	.4byte	.LVL147
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL147
	.4byte	.LVL149
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL149
	.4byte	.LFE59
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST57:
	.4byte	.LVL140
	.4byte	.LVL141
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL141
	.4byte	.LVL142
	.2byte	0x7
	.byte	0xa
	.2byte	0x1001
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL142
	.4byte	.LVL143
	.2byte	0x7
	.byte	0xa
	.2byte	0x1000
	.byte	0x74
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST58:
	.4byte	.LVL150
	.4byte	.LVL154
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL154
	.4byte	.LFE60
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST59:
	.4byte	.LVL150
	.4byte	.LVL152
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL152
	.4byte	.LFE60
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST60:
	.4byte	.LVL150
	.4byte	.LVL151
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL151
	.4byte	.LVL153
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL153
	.4byte	.LVL154
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xf7f7
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL154
	.4byte	.LFE60
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST61:
	.4byte	.LVL155
	.4byte	.LVL162
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL162
	.4byte	.LFE61
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST62:
	.4byte	.LVL155
	.4byte	.LVL159
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL159
	.4byte	.LVL170
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL170
	.4byte	.LFE61
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST63:
	.4byte	.LVL155
	.4byte	.LVL156
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL156
	.4byte	.LVL169
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL169
	.4byte	.LFE61
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST64:
	.4byte	.LVL155
	.4byte	.LVL157
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL157
	.4byte	.LVL160
	.2byte	0x9
	.byte	0x73
	.sleb128 0
	.byte	0xc
	.4byte	0x7f7f7f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST65:
	.4byte	.LVL155
	.4byte	.LVL158
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL158
	.4byte	.LVL161
	.2byte	0x9
	.byte	0x72
	.sleb128 0
	.byte	0xc
	.4byte	0xffff3f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST66:
	.4byte	.LVL171
	.4byte	.LVL172
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL172
	.4byte	.LFE63
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST67:
	.4byte	.LVL173
	.4byte	.LVL174
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL174
	.4byte	.LVL175
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL175
	.4byte	.LVL176
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL176
	.4byte	.LFE64
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST68:
	.4byte	.LVL177
	.4byte	.LVL178
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL178
	.4byte	.LFE65
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST69:
	.4byte	.LVL179
	.4byte	.LVL180
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL180
	.4byte	.LFE66
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST70:
	.4byte	.LVL181
	.4byte	.LVL182
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL182
	.4byte	.LFE67
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST71:
	.4byte	.LVL185
	.4byte	.LVL186
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL186
	.4byte	.LFE70
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST72:
	.4byte	.LVL187
	.4byte	.LVL188
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL188
	.4byte	.LFE71
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST73:
	.4byte	.LVL189
	.4byte	.LVL190
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL190
	.4byte	.LFE72
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST74:
	.4byte	.LVL191
	.4byte	.LVL192
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL192
	.4byte	.LVL196
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL196
	.4byte	.LFE73
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST75:
	.4byte	.LVL191
	.4byte	.LVL197-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL197-1
	.4byte	.LFE73
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST76:
	.4byte	.LVL191
	.4byte	.LVL198
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL198
	.4byte	.LFE73
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST77:
	.4byte	.LVL191
	.4byte	.LVL193
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL193
	.4byte	.LVL194
	.2byte	0x7
	.byte	0xa
	.2byte	0x1001
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL194
	.4byte	.LVL195
	.2byte	0x7
	.byte	0xa
	.2byte	0x1000
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST78:
	.4byte	.LVL199
	.4byte	.LVL201
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL201
	.4byte	.LVL202
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL202
	.4byte	.LVL204
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL204
	.4byte	.LFE74
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST79:
	.4byte	.LVL199
	.4byte	.LVL200
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL200
	.4byte	.LVL202
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL202
	.4byte	.LVL203
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL203
	.4byte	.LFE74
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST80:
	.4byte	.LVL205
	.4byte	.LVL208
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL208
	.4byte	.LFE75
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST81:
	.4byte	.LVL205
	.4byte	.LVL206
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL206
	.4byte	.LVL208
	.2byte	0xe
	.byte	0x72
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0xc
	.4byte	0x1f978
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	.LVL208
	.4byte	.LFE75
	.2byte	0xf
	.byte	0x72
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x1a
	.byte	0xc
	.4byte	0x1f978
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST82:
	.4byte	.LVL205
	.4byte	.LVL206
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL206
	.4byte	.LVL207
	.2byte	0x9
	.byte	0x72
	.sleb128 0
	.byte	0xc
	.4byte	0x1f978
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL207
	.4byte	.LVL209
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL209
	.4byte	.LFE75
	.2byte	0x9
	.byte	0x72
	.sleb128 0
	.byte	0xc
	.4byte	0x1f978
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST83:
	.4byte	.LVL210
	.4byte	.LVL211
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL211
	.4byte	.LFE76
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST84:
	.4byte	.LVL212
	.4byte	.LVL215
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL215
	.4byte	.LVL218
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL218
	.4byte	.LFE77
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST85:
	.4byte	.LVL212
	.4byte	.LVL220
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL220
	.4byte	.LFE77
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST86:
	.4byte	.LVL212
	.4byte	.LVL213
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL213
	.4byte	.LVL214
	.2byte	0x5
	.byte	0x74
	.sleb128 0
	.byte	0x34
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL214
	.4byte	.LVL216
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL217
	.4byte	.LVL218
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x72
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL218
	.4byte	.LVL219
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL219
	.4byte	.LFE77
	.2byte	0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x34
	.byte	0x25
	.byte	0x72
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST87:
	.4byte	.LVL212
	.4byte	.LVL215
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST88:
	.4byte	.LVL221
	.4byte	.LVL222
	.2byte	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL222
	.4byte	.LVL223
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL223
	.4byte	.LFE78
	.2byte	0x5
	.byte	0x70
	.sleb128 0
	.byte	0x34
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x19c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
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
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB79
	.4byte	.LFE79
	.4byte	.LFB80
	.4byte	.LFE80
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB32
	.4byte	.LFE32
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF134:
	.ascii	"RTC_TamperPullUpCmd\000"
.LASF16:
	.ascii	"ERROR\000"
.LASF129:
	.ascii	"RTC_TamperSamplingFreqConfig\000"
.LASF27:
	.ascii	"TSSSR\000"
.LASF153:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF79:
	.ascii	"RTC_TimeStruct\000"
.LASF90:
	.ascii	"RTC_AlarmStruct\000"
.LASF120:
	.ascii	"tmpdate\000"
.LASF146:
	.ascii	"RTC_IT\000"
.LASF88:
	.ascii	"RTC_SetAlarm\000"
.LASF62:
	.ascii	"synchrocounter\000"
.LASF135:
	.ascii	"RTC_WriteBackupRegister\000"
.LASF96:
	.ascii	"RTC_AlarmSubSecondConfig\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF130:
	.ascii	"RTC_TamperSamplingFreq\000"
.LASF18:
	.ascii	"ErrorStatus\000"
.LASF93:
	.ascii	"RTC_AlarmCmd\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF24:
	.ascii	"SHIFTR\000"
.LASF152:
	.ascii	"enablestatus\000"
.LASF97:
	.ascii	"RTC_AlarmSubSecondValue\000"
.LASF63:
	.ascii	"synchrostatus\000"
.LASF115:
	.ascii	"RTC_TimeStampEdge\000"
.LASF32:
	.ascii	"BKP0R\000"
.LASF29:
	.ascii	"ALRMASSR\000"
.LASF157:
	.ascii	"RTC_ClearITPendingBit\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF127:
	.ascii	"RTC_TamperFilterConfig\000"
.LASF121:
	.ascii	"RTC_GetStoreOperation\000"
.LASF133:
	.ascii	"RTC_TimeStampOnTamperDetectionCmd\000"
.LASF114:
	.ascii	"RTC_TimeStampCmd\000"
.LASF142:
	.ascii	"RTC_ShiftAdd1S\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF99:
	.ascii	"RTC_GetAlarmSubSecond\000"
.LASF33:
	.ascii	"BKP1R\000"
.LASF144:
	.ascii	"shpfcount\000"
.LASF51:
	.ascii	"RTC_DateTypeDef\000"
.LASF91:
	.ascii	"RTC_AlarmStructInit\000"
.LASF124:
	.ascii	"RTC_Tamper\000"
.LASF126:
	.ascii	"RTC_TamperCmd\000"
.LASF61:
	.ascii	"RTC_WaitForSynchro\000"
.LASF118:
	.ascii	"RTC_StampDateStruct\000"
.LASF108:
	.ascii	"RTC_CalibOutput\000"
.LASF69:
	.ascii	"RTC_StructInit\000"
.LASF104:
	.ascii	"RTC_Output\000"
.LASF37:
	.ascii	"RTC_TypeDef\000"
.LASF78:
	.ascii	"RTC_Format\000"
.LASF111:
	.ascii	"RTC_SmoothCalibPlusPulses\000"
.LASF34:
	.ascii	"BKP2R\000"
.LASF101:
	.ascii	"RTC_DayLightSaving\000"
.LASF138:
	.ascii	"RTC_ReadBackupRegister\000"
.LASF125:
	.ascii	"RTC_TamperTrigger\000"
.LASF80:
	.ascii	"tmpreg\000"
.LASF72:
	.ascii	"RTC_Init\000"
.LASF12:
	.ascii	"ITStatus\000"
.LASF143:
	.ascii	"RTC_ShiftSubFS\000"
.LASF105:
	.ascii	"RTC_OutputPolarity\000"
.LASF122:
	.ascii	"RTC_GetTimeStampSubSecond\000"
.LASF35:
	.ascii	"BKP3R\000"
.LASF71:
	.ascii	"NewState\000"
.LASF155:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF64:
	.ascii	"RTC_ByteToBcd2\000"
.LASF45:
	.ascii	"RTC_H12\000"
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
.LASF131:
	.ascii	"RTC_TamperPinsPrechargeDuration\000"
.LASF128:
	.ascii	"RTC_TamperFilter\000"
.LASF59:
	.ascii	"initstatus\000"
.LASF50:
	.ascii	"RTC_Year\000"
.LASF123:
	.ascii	"RTC_TamperTriggerConfig\000"
.LASF26:
	.ascii	"TSDR\000"
.LASF7:
	.ascii	"long long int\000"
.LASF85:
	.ascii	"RTC_DateStruct\000"
.LASF147:
	.ascii	"RTC_GetFlagStatus\000"
.LASF44:
	.ascii	"RTC_Seconds\000"
.LASF83:
	.ascii	"RTC_GetSubSecond\000"
.LASF25:
	.ascii	"TSTR\000"
.LASF100:
	.ascii	"RTC_DayLightSavingConfig\000"
.LASF139:
	.ascii	"RTC_OutputTypeConfig\000"
.LASF48:
	.ascii	"RTC_Month\000"
.LASF117:
	.ascii	"RTC_StampTimeStruct\000"
.LASF66:
	.ascii	"Value\000"
.LASF40:
	.ascii	"RTC_SynchPrediv\000"
.LASF132:
	.ascii	"RTC_TamperPrechargeDuration\000"
.LASF94:
	.ascii	"alarmcounter\000"
.LASF56:
	.ascii	"RTC_AlarmTypeDef\000"
.LASF109:
	.ascii	"RTC_SmoothCalibConfig\000"
.LASF22:
	.ascii	"ALRMAR\000"
.LASF38:
	.ascii	"RTC_HourFormat\000"
.LASF77:
	.ascii	"RTC_SetTime\000"
.LASF107:
	.ascii	"RTC_CalibOutputConfig\000"
.LASF140:
	.ascii	"RTC_OutputType\000"
.LASF95:
	.ascii	"alarmstatus\000"
.LASF113:
	.ascii	"recalpfcount\000"
.LASF43:
	.ascii	"RTC_Minutes\000"
.LASF92:
	.ascii	"RTC_GetAlarm\000"
.LASF65:
	.ascii	"RTC_Bcd2ToByte\000"
.LASF84:
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
.LASF70:
	.ascii	"RTC_WriteProtectionCmd\000"
.LASF86:
	.ascii	"RTC_DateStructInit\000"
.LASF74:
	.ascii	"wutcounter\000"
.LASF145:
	.ascii	"RTC_ITConfig\000"
.LASF10:
	.ascii	"RESET\000"
.LASF136:
	.ascii	"RTC_BKP_DR\000"
.LASF89:
	.ascii	"RTC_Alarm\000"
.LASF52:
	.ascii	"RTC_AlarmTime\000"
.LASF67:
	.ascii	"bcdhigh\000"
.LASF103:
	.ascii	"RTC_OutputConfig\000"
.LASF41:
	.ascii	"RTC_InitTypeDef\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF102:
	.ascii	"RTC_StoreOperation\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF57:
	.ascii	"initcounter\000"
.LASF39:
	.ascii	"RTC_AsynchPrediv\000"
.LASF150:
	.ascii	"RTC_ClearFlag\000"
.LASF68:
	.ascii	"RTC_InitStruct\000"
.LASF148:
	.ascii	"RTC_FLAG\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF156:
	.ascii	"RTC_ExitInitMode\000"
.LASF76:
	.ascii	"RTC_BypassShadowCmd\000"
.LASF110:
	.ascii	"RTC_SmoothCalibPeriod\000"
.LASF19:
	.ascii	"PRER\000"
.LASF106:
	.ascii	"RTC_CalibOutputCmd\000"
.LASF60:
	.ascii	"RTC_EnterInitMode\000"
.LASF73:
	.ascii	"RTC_DeInit\000"
.LASF98:
	.ascii	"RTC_AlarmSubSecondMask\000"
.LASF154:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_rtc.c\000"
.LASF0:
	.ascii	"signed char\000"
.LASF53:
	.ascii	"RTC_AlarmMask\000"
.LASF75:
	.ascii	"RTC_RefClockCmd\000"
.LASF47:
	.ascii	"RTC_WeekDay\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF81:
	.ascii	"RTC_TimeStructInit\000"
.LASF82:
	.ascii	"RTC_GetTime\000"
.LASF149:
	.ascii	"bitstatus\000"
.LASF42:
	.ascii	"RTC_Hours\000"
.LASF116:
	.ascii	"RTC_GetTimeStamp\000"
.LASF49:
	.ascii	"RTC_Date\000"
.LASF55:
	.ascii	"RTC_AlarmDateWeekDay\000"
.LASF141:
	.ascii	"RTC_SynchroShiftConfig\000"
.LASF151:
	.ascii	"RTC_GetITStatus\000"
.LASF137:
	.ascii	"Data\000"
.LASF119:
	.ascii	"tmptime\000"
.LASF87:
	.ascii	"RTC_GetDate\000"
.LASF112:
	.ascii	"RTC_SmouthCalibMinusPulsesValue\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
