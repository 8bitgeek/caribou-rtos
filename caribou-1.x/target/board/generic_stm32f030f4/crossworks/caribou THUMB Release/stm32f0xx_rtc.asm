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
	.file	"stm32f0xx_rtc.c"
	.text
.Ltext0:
	.section	.text.RTC_ByteToBcd2,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	RTC_ByteToBcd2, %function
RTC_ByteToBcd2:
.LFB79:
	cmp	r0, #9
	bls	.L4
	mov	r3, #0
.L3:
	add	r3, r3, #1
	uxtb	r3, r3
	sub	r0, r0, #10
	uxtb	r0, r0
	cmp	r0, #9
	bhi	.L3
	b	.L2
.L4:
	mov	r3, #0
.L2:
	lsl	r3, r3, #4
	orr	r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE79:
	.size	RTC_ByteToBcd2, .-RTC_ByteToBcd2
	.section	.text.RTC_Bcd2ToByte,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	RTC_Bcd2ToByte, %function
RTC_Bcd2ToByte:
.LFB80:
	lsr	r3, r0, #4
	lsl	r2, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, #15
	and	r0, r2
	add	r0, r3, r0
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE80:
	.size	RTC_Bcd2ToByte, .-RTC_Bcd2ToByte
	.section	.text.RTC_StructInit,"ax",%progbits
	.align	2
	.global	RTC_StructInit
	.code	16
	.thumb_func
	.type	RTC_StructInit, %function
RTC_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	mov	r3, #127
	str	r3, [r0, #4]
	mov	r3, #255
	str	r3, [r0, #8]
	@ sp needed
	bx	lr
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
	cmp	r0, #0
	beq	.L8
	mov	r2, #255
	ldr	r3, .L10
	str	r2, [r3, #36]
	b	.L7
.L8:
	ldr	r3, .L10
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
.L7:
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
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
	push	{r4, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L17
	ldr	r3, [r3, #12]
	mov	r0, #1
	lsl	r2, r3, #25
	bmi	.L13
	mov	r2, #1
	neg	r2, r2
	ldr	r3, .L17
	str	r2, [r3, #12]
	mov	r4, r3
	mov	r0, #64
	mov	r1, #128
	lsl	r1, r1, #7
.L15:
	ldr	r3, [r4, #12]
	mov	r2, r0
	and	r2, r3
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r1
	beq	.L14
	cmp	r2, #0
	beq	.L15
.L14:
	ldr	r3, .L17
	ldr	r0, [r3, #12]
	lsl	r0, r0, #25
	lsr	r0, r0, #31
.L13:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L18:
	.align	2
.L17:
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
	ldr	r3, .L20
	ldr	r2, [r3, #12]
	mov	r1, #128
	bic	r2, r1
	str	r2, [r3, #12]
	@ sp needed
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073752064
.LFE37:
	.size	RTC_ExitInitMode, .-RTC_ExitInitMode
	.section	.text.RTC_Init,"ax",%progbits
	.align	2
	.global	RTC_Init
	.code	16
	.thumb_func
	.type	RTC_Init, %function
RTC_Init:
.LFB33:
	push	{r4, lr}
.LCFI2:
	mov	r4, r0
	ldr	r3, .L25
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	bl	RTC_EnterInitMode
	mov	r3, #0
	cmp	r0, #0
	beq	.L23
	ldr	r3, .L25
	ldr	r2, [r3, #8]
	mov	r1, #64
	bic	r2, r1
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	ldr	r1, [r4]
	orr	r2, r1
	str	r2, [r3, #8]
	ldr	r2, [r4, #8]
	str	r2, [r3, #16]
	ldr	r1, [r3, #16]
	ldr	r2, [r4, #4]
	lsl	r2, r2, #16
	orr	r2, r1
	str	r2, [r3, #16]
	bl	RTC_ExitInitMode
	mov	r3, #1
.L23:
	mov	r1, #255
	ldr	r2, .L25
	str	r1, [r2, #36]
	mov	r0, r3
	@ sp needed
	pop	{r4, pc}
.L26:
	.align	2
.L25:
	.word	1073752064
.LFE33:
	.size	RTC_Init, .-RTC_Init
	.section	.text.RTC_WaitForSynchro,"ax",%progbits
	.align	2
	.global	RTC_WaitForSynchro
	.code	16
	.thumb_func
	.type	RTC_WaitForSynchro, %function
RTC_WaitForSynchro:
.LFB38:
	push	{r4, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L32
	ldr	r3, [r3, #8]
	mov	r0, #1
	lsl	r2, r3, #26
	bmi	.L28
	ldr	r3, .L32
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	ldr	r2, [r3, #12]
	mov	r1, #160
	bic	r2, r1
	str	r2, [r3, #12]
	mov	r4, r3
	mov	r0, #32
	mov	r1, #128
	lsl	r1, r1, #8
.L30:
	ldr	r3, [r4, #12]
	mov	r2, r0
	and	r2, r3
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r1
	beq	.L29
	cmp	r2, #0
	beq	.L30
.L29:
	ldr	r3, .L32
	ldr	r0, [r3, #12]
	lsl	r0, r0, #26
	lsr	r0, r0, #31
	mov	r2, #255
	str	r2, [r3, #36]
.L28:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L33:
	.align	2
.L32:
	.word	1073752064
.LFE38:
	.size	RTC_WaitForSynchro, .-RTC_WaitForSynchro
	.section	.text.RTC_DeInit,"ax",%progbits
	.align	2
	.global	RTC_DeInit
	.code	16
	.thumb_func
	.type	RTC_DeInit, %function
RTC_DeInit:
.LFB32:
	push	{lr}
.LCFI5:
	sub	sp, sp, #12
.LCFI6:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L37
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	bl	RTC_EnterInitMode
	mov	r3, r0
	mov	r0, #0
	cmp	r3, #0
	beq	.L35
	ldr	r3, .L37
	mov	r2, #0
	str	r2, [r3]
	ldr	r1, .L37+4
	str	r1, [r3, #4]
	ldr	r1, [r3, #8]
	str	r2, [r3, #8]
	ldr	r1, .L37+8
	str	r1, [r3, #16]
	str	r2, [r3, #28]
	str	r2, [r3, #44]
	str	r2, [r3, #60]
	str	r2, [r3, #68]
	str	r2, [r3, #12]
	str	r2, [r3, #64]
	bl	RTC_WaitForSynchro
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
.L35:
	mov	r2, #255
	ldr	r3, .L37
	str	r2, [r3, #36]
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.L38:
	.align	2
.L37:
	.word	1073752064
	.word	8449
	.word	8323327
.LFE32:
	.size	RTC_DeInit, .-RTC_DeInit
	.section	.text.RTC_RefClockCmd,"ax",%progbits
	.align	2
	.global	RTC_RefClockCmd
	.code	16
	.thumb_func
	.type	RTC_RefClockCmd, %function
RTC_RefClockCmd:
.LFB39:
	push	{r4, lr}
.LCFI7:
	mov	r4, r0
	ldr	r3, .L44
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	bl	RTC_EnterInitMode
	mov	r2, r0
	mov	r0, #0
	cmp	r2, #0
	beq	.L40
	cmp	r4, #0
	beq	.L41
	ldr	r3, .L44
	ldr	r1, [r3, #8]
	mov	r2, #16
	orr	r2, r1
	str	r2, [r3, #8]
	b	.L42
.L41:
	ldr	r3, .L44
	ldr	r2, [r3, #8]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #8]
.L42:
	bl	RTC_ExitInitMode
	mov	r0, #1
.L40:
	mov	r1, #255
	ldr	r2, .L44
	str	r1, [r2, #36]
	@ sp needed
	pop	{r4, pc}
.L45:
	.align	2
.L44:
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
	ldr	r3, .L49
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	cmp	r0, #0
	beq	.L47
	ldr	r1, [r3, #8]
	mov	r2, #32
	orr	r2, r1
	str	r2, [r3, #8]
	b	.L48
.L47:
	ldr	r3, .L49
	ldr	r2, [r3, #8]
	mov	r1, #223
	and	r2, r1
	str	r2, [r3, #8]
.L48:
	mov	r2, #255
	ldr	r3, .L49
	str	r2, [r3, #36]
	@ sp needed
	bx	lr
.L50:
	.align	2
.L49:
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
	push	{r4, r5, r6, lr}
.LCFI8:
	mov	r4, r1
	cmp	r0, #0
	bne	.L52
	ldr	r3, .L60
	ldr	r3, [r3, #8]
	lsl	r2, r3, #25
	bmi	.L53
	mov	r3, #0
	strb	r3, [r1, #3]
	b	.L53
.L52:
	ldr	r3, .L60
	ldr	r3, [r3, #8]
	lsl	r2, r3, #25
	bmi	.L54
	mov	r3, #0
	strb	r3, [r1, #3]
	b	.L54
.L56:
	ldr	r3, .L60
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	bl	RTC_EnterInitMode
	mov	r3, r0
	mov	r0, #0
	cmp	r3, #0
	beq	.L55
	ldr	r3, .L60+4
	and	r4, r3
	ldr	r5, .L60
	str	r4, [r5]
	bl	RTC_ExitInitMode
	ldr	r3, [r5, #8]
	mov	r0, #1
	lsl	r2, r3, #26
	bmi	.L55
	bl	RTC_WaitForSynchro
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
.L55:
	mov	r2, #255
	ldr	r3, .L60
	str	r2, [r3, #36]
	b	.L59
.L54:
	ldrb	r2, [r4]
	lsl	r2, r2, #16
	ldrb	r3, [r4, #1]
	lsl	r3, r3, #8
	orr	r2, r3
	ldrb	r3, [r4, #2]
	orr	r2, r3
	ldrb	r3, [r4, #3]
	lsl	r3, r3, #16
	mov	r4, r2
	orr	r4, r3
	b	.L56
.L53:
	ldrb	r0, [r4]
	bl	RTC_ByteToBcd2
	mov	r6, r0
	ldrb	r0, [r4, #1]
	bl	RTC_ByteToBcd2
	mov	r5, r0
	ldrb	r0, [r4, #2]
	bl	RTC_ByteToBcd2
	ldrb	r4, [r4, #3]
	lsl	r4, r4, #16
	orr	r4, r0
	lsl	r6, r6, #16
	orr	r4, r6
	lsl	r5, r5, #8
	orr	r4, r5
	b	.L56
.L59:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L61:
	.align	2
.L60:
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
	mov	r3, #0
	strb	r3, [r0, #3]
	strb	r3, [r0]
	strb	r3, [r0, #1]
	strb	r3, [r0, #2]
	@ sp needed
	bx	lr
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
	push	{r4, r5, r6, lr}
.LCFI9:
	mov	r4, r1
	ldr	r3, .L65
	ldr	r3, [r3]
	lsl	r2, r3, #10
	lsr	r2, r2, #26
	strb	r2, [r1]
	lsl	r6, r3, #17
	lsr	r6, r6, #25
	strb	r6, [r1, #1]
	mov	r5, #127
	and	r5, r3
	strb	r5, [r1, #2]
	mov	r1, #128
	lsl	r1, r1, #15
	and	r3, r1
	lsr	r3, r3, #16
	strb	r3, [r4, #3]
	cmp	r0, #0
	bne	.L63
	mov	r0, r2
	bl	RTC_Bcd2ToByte
	strb	r0, [r4]
	mov	r0, r6
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #1]
	mov	r0, r5
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #2]
.L63:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L66:
	.align	2
.L65:
	.word	1073752064
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
	ldr	r3, .L68
	ldr	r0, [r3, #40]
	ldr	r3, [r3, #4]
	@ sp needed
	bx	lr
.L69:
	.align	2
.L68:
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
	push	{r4, r5, r6, lr}
.LCFI10:
	mov	r4, r1
	cmp	r0, #0
	bne	.L71
	ldrb	r3, [r1, #1]
	lsl	r2, r3, #27
	bpl	.L72
	mov	r2, #16
	bic	r3, r2
	add	r3, r3, #10
	strb	r3, [r1, #1]
	b	.L72
.L74:
	ldr	r3, .L78
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	bl	RTC_EnterInitMode
	mov	r3, r0
	mov	r0, #0
	cmp	r3, #0
	beq	.L73
	ldr	r3, .L78+4
	and	r4, r3
	ldr	r5, .L78
	str	r4, [r5, #4]
	bl	RTC_ExitInitMode
	ldr	r3, [r5, #8]
	mov	r0, #1
	lsl	r2, r3, #26
	bmi	.L73
	bl	RTC_WaitForSynchro
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
.L73:
	mov	r2, #255
	ldr	r3, .L78
	str	r2, [r3, #36]
	b	.L77
.L72:
	ldrb	r0, [r4, #3]
	bl	RTC_ByteToBcd2
	mov	r6, r0
	ldrb	r0, [r4, #1]
	bl	RTC_ByteToBcd2
	mov	r5, r0
	ldrb	r0, [r4, #2]
	bl	RTC_ByteToBcd2
	ldrb	r4, [r4]
	lsl	r4, r4, #13
	orr	r4, r0
	lsl	r6, r6, #16
	orr	r4, r6
	lsl	r5, r5, #8
	orr	r4, r5
	b	.L74
.L71:
	ldrb	r2, [r1, #3]
	lsl	r2, r2, #16
	ldrb	r3, [r1, #1]
	lsl	r3, r3, #8
	orr	r2, r3
	ldrb	r3, [r1, #2]
	orr	r2, r3
	ldrb	r3, [r1]
	lsl	r3, r3, #13
	mov	r4, r2
	orr	r4, r3
	b	.L74
.L77:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L79:
	.align	2
.L78:
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
	mov	r3, #1
	strb	r3, [r0]
	strb	r3, [r0, #2]
	strb	r3, [r0, #1]
	mov	r3, #0
	strb	r3, [r0, #3]
	@ sp needed
	bx	lr
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
	push	{r4, r5, r6, lr}
.LCFI11:
	mov	r4, r1
	ldr	r3, .L83
	ldr	r3, [r3, #4]
	lsl	r2, r3, #8
	lsr	r2, r2, #24
	strb	r2, [r1, #3]
	lsl	r6, r3, #19
	lsr	r6, r6, #27
	strb	r6, [r1, #1]
	mov	r5, #63
	and	r5, r3
	strb	r5, [r1, #2]
	lsl	r3, r3, #16
	lsr	r3, r3, #29
	strb	r3, [r1]
	cmp	r0, #0
	bne	.L81
	mov	r0, r2
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #3]
	mov	r0, r6
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #1]
	mov	r0, r5
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #2]
.L81:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L84:
	.align	2
.L83:
	.word	1073752064
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
	push	{r3, r4, r5, r6, r7, lr}
.LCFI12:
	mov	r4, r2
	cmp	r0, #0
	bne	.L86
	ldr	r3, .L91
	ldr	r3, [r3, #8]
	lsl	r2, r3, #25
	bmi	.L87
	mov	r3, #0
	strb	r3, [r4, #3]
	b	.L87
.L86:
	ldr	r3, .L91
	ldr	r3, [r3, #8]
	lsl	r2, r3, #25
	bmi	.L88
	mov	r3, #0
	strb	r3, [r4, #3]
	b	.L88
.L89:
	ldr	r3, .L91
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	str	r0, [r3, #28]
	mov	r2, #255
	str	r2, [r3, #36]
	b	.L90
.L88:
	ldr	r0, [r4, #4]
	ldr	r3, [r4, #8]
	orr	r0, r3
	ldrb	r3, [r4, #2]
	orr	r0, r3
	ldrb	r3, [r4]
	lsl	r3, r3, #16
	orr	r0, r3
	ldrb	r3, [r4, #1]
	lsl	r3, r3, #8
	orr	r0, r3
	ldrb	r3, [r4, #3]
	lsl	r3, r3, #16
	orr	r0, r3
	ldrb	r3, [r4, #12]
	lsl	r3, r3, #24
	orr	r0, r3
	b	.L89
.L87:
	ldrb	r0, [r4]
	bl	RTC_ByteToBcd2
	mov	r6, r0
	ldrb	r0, [r4, #1]
	bl	RTC_ByteToBcd2
	mov	r5, r0
	ldrb	r0, [r4, #2]
	bl	RTC_ByteToBcd2
	mov	r7, r0
	ldrb	r0, [r4, #12]
	bl	RTC_ByteToBcd2
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #8]
	orr	r2, r3
	ldrb	r3, [r4, #3]
	lsl	r3, r3, #16
	orr	r3, r2
	orr	r7, r3
	lsl	r6, r6, #16
	orr	r7, r6
	lsl	r3, r5, #8
	mov	r5, r7
	orr	r5, r3
	lsl	r3, r0, #24
	mov	r0, r5
	orr	r0, r3
	b	.L89
.L90:
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L92:
	.align	2
.L91:
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
	mov	r3, #0
	strb	r3, [r0, #3]
	strb	r3, [r0]
	strb	r3, [r0, #1]
	strb	r3, [r0, #2]
	str	r3, [r0, #8]
	mov	r2, #1
	strb	r2, [r0, #12]
	str	r3, [r0, #4]
	@ sp needed
	bx	lr
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
	push	{r3, r4, r5, r6, r7, lr}
.LCFI13:
	mov	r4, r2
	ldr	r3, .L96
	ldr	r3, [r3, #28]
	lsl	r2, r3, #10
	lsr	r2, r2, #26
	strb	r2, [r4]
	lsl	r7, r3, #17
	lsr	r7, r7, #25
	strb	r7, [r4, #1]
	mov	r6, #127
	and	r6, r3
	strb	r6, [r4, #2]
	mov	r1, #128
	lsl	r1, r1, #15
	and	r1, r3
	lsr	r1, r1, #16
	strb	r1, [r4, #3]
	lsl	r5, r3, #2
	lsr	r5, r5, #26
	strb	r5, [r4, #12]
	mov	r1, #128
	lsl	r1, r1, #23
	and	r1, r3
	str	r1, [r4, #8]
	ldr	r1, .L96+4
	and	r3, r1
	str	r3, [r4, #4]
	cmp	r0, #0
	bne	.L94
	mov	r0, r2
	bl	RTC_Bcd2ToByte
	strb	r0, [r4]
	mov	r0, r7
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #1]
	mov	r0, r6
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #2]
	mov	r0, r5
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #12]
.L94:
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L97:
	.align	2
.L96:
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
	push	{r4, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L103
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	cmp	r1, #0
	beq	.L99
	ldr	r2, [r3, #8]
	orr	r0, r2
	str	r0, [r3, #8]
	mov	r0, #1
	b	.L100
.L99:
	ldr	r3, .L103
	ldr	r2, [r3, #8]
	bic	r2, r0
	str	r2, [r3, #8]
	lsr	r0, r0, #8
	mov	r4, r3
	mov	r1, #128
	lsl	r1, r1, #7
.L102:
	ldr	r3, [r4, #12]
	mov	r2, r3
	and	r2, r0
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r1
	beq	.L101
	cmp	r2, #0
	beq	.L102
.L101:
	ldr	r3, .L103
	ldr	r3, [r3, #12]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
.L100:
	mov	r2, #255
	ldr	r3, .L103
	str	r2, [r3, #36]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L104:
	.align	2
.L103:
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
	ldr	r3, .L106
	mov	r0, #202
	str	r0, [r3, #36]
	mov	r0, #83
	str	r0, [r3, #36]
	lsl	r2, r2, #24
	orr	r1, r2
	str	r1, [r3, #68]
	mov	r2, #255
	str	r2, [r3, #36]
	@ sp needed
	bx	lr
.L107:
	.align	2
.L106:
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
	ldr	r3, .L109
	ldr	r0, [r3, #68]
	lsl	r0, r0, #17
	lsr	r0, r0, #17
	@ sp needed
	bx	lr
.L110:
	.align	2
.L109:
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
	push	{r4, lr}
.LCFI16:
	ldr	r3, .L112
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	ldr	r4, [r3, #8]
	ldr	r2, .L112+4
	and	r2, r4
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r1, r2
	orr	r0, r1
	str	r0, [r3, #8]
	mov	r2, #255
	str	r2, [r3, #36]
	@ sp needed
	pop	{r4, pc}
.L113:
	.align	2
.L112:
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
	ldr	r3, .L115
	ldr	r3, [r3, #8]
	mov	r0, #128
	lsl	r0, r0, #11
	and	r0, r3
	@ sp needed
	bx	lr
.L116:
	.align	2
.L115:
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
	push	{r4, lr}
.LCFI17:
	ldr	r3, .L118
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	ldr	r4, [r3, #8]
	ldr	r2, .L118+4
	and	r2, r4
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r1, r2
	orr	r0, r1
	str	r0, [r3, #8]
	mov	r2, #255
	str	r2, [r3, #36]
	@ sp needed
	pop	{r4, pc}
.L119:
	.align	2
.L118:
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
	ldr	r3, .L123
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	cmp	r0, #0
	beq	.L121
	ldr	r1, [r3, #8]
	mov	r2, #128
	lsl	r2, r2, #16
	orr	r2, r1
	str	r2, [r3, #8]
	b	.L122
.L121:
	ldr	r3, .L123
	ldr	r1, [r3, #8]
	ldr	r2, .L123+4
	and	r2, r1
	str	r2, [r3, #8]
.L122:
	mov	r2, #255
	ldr	r3, .L123
	str	r2, [r3, #36]
	@ sp needed
	bx	lr
.L124:
	.align	2
.L123:
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
	ldr	r3, .L126
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	ldr	r1, [r3, #8]
	ldr	r2, .L126+4
	and	r2, r1
	str	r2, [r3, #8]
	ldr	r2, [r3, #8]
	orr	r0, r2
	str	r0, [r3, #8]
	mov	r2, #255
	str	r2, [r3, #36]
	@ sp needed
	bx	lr
.L127:
	.align	2
.L126:
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
	push	{r4, r5, r6, lr}
.LCFI18:
	ldr	r3, .L133
	mov	r4, #202
	str	r4, [r3, #36]
	mov	r4, #83
	str	r4, [r3, #36]
	ldr	r3, [r3, #12]
	lsl	r4, r3, #15
	bpl	.L129
	ldr	r3, .L133
	ldr	r3, [r3, #12]
	lsl	r5, r3, #15
	bpl	.L129
	mov	r3, #128
	lsl	r3, r3, #5
	ldr	r6, .L133
	mov	r5, #128
	lsl	r5, r5, #9
.L130:
	ldr	r4, [r6, #12]
	tst	r4, r5
	beq	.L129
	sub	r3, r3, #1
	cmp	r3, #0
	bne	.L130
.L129:
	ldr	r3, .L133
	ldr	r4, [r3, #12]
	mov	r3, #0
	lsl	r5, r4, #15
	bmi	.L131
	orr	r1, r2
	orr	r0, r1
	ldr	r3, .L133
	str	r0, [r3, #60]
	mov	r3, #1
.L131:
	mov	r1, #255
	ldr	r2, .L133
	str	r1, [r2, #36]
	mov	r0, r3
	@ sp needed
	pop	{r4, r5, r6, pc}
.L134:
	.align	2
.L133:
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
	ldr	r3, .L138
	ldr	r2, [r3, #8]
	ldr	r3, .L138+4
	and	r3, r2
	cmp	r1, #0
	beq	.L136
	mov	r2, #128
	lsl	r2, r2, #4
	orr	r3, r2
	orr	r0, r3
	b	.L137
.L136:
	orr	r0, r3
.L137:
	ldr	r3, .L138
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	str	r0, [r3, #8]
	mov	r2, #255
	str	r2, [r3, #36]
	@ sp needed
	bx	lr
.L139:
	.align	2
.L138:
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
	push	{r3, r4, r5, lr}
.LCFI19:
	mov	r5, r1
	mov	r4, r2
	ldr	r2, .L142
	ldr	r3, [r2, #48]
	ldr	r2, [r2, #52]
	lsl	r1, r3, #10
	lsr	r1, r1, #26
	strb	r1, [r5]
	lsl	r1, r3, #17
	lsr	r1, r1, #25
	strb	r1, [r5, #1]
	mov	r1, #127
	and	r1, r3
	strb	r1, [r5, #2]
	mov	r1, #128
	lsl	r1, r1, #15
	and	r3, r1
	lsr	r3, r3, #16
	strb	r3, [r5, #3]
	mov	r3, #0
	strb	r3, [r4, #3]
	lsl	r3, r2, #19
	lsr	r3, r3, #27
	strb	r3, [r4, #1]
	mov	r3, #63
	and	r3, r2
	strb	r3, [r4, #2]
	lsl	r2, r2, #16
	lsr	r2, r2, #29
	strb	r2, [r4]
	cmp	r0, #0
	bne	.L140
	ldrb	r0, [r5]
	bl	RTC_Bcd2ToByte
	strb	r0, [r5]
	ldrb	r0, [r5, #1]
	bl	RTC_Bcd2ToByte
	strb	r0, [r5, #1]
	ldrb	r0, [r5, #2]
	bl	RTC_Bcd2ToByte
	strb	r0, [r5, #2]
	ldrb	r0, [r4, #1]
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #1]
	ldrb	r0, [r4, #2]
	bl	RTC_Bcd2ToByte
	strb	r0, [r4, #2]
	ldrb	r0, [r4]
	bl	RTC_Bcd2ToByte
	strb	r0, [r4]
.L140:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L143:
	.align	2
.L142:
	.word	1073752064
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
	ldr	r3, .L145
	ldr	r0, [r3, #56]
	@ sp needed
	bx	lr
.L146:
	.align	2
.L145:
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
	cmp	r1, #0
	bne	.L148
	ldr	r3, .L150
	ldr	r2, [r3, #64]
	lsl	r0, r0, #1
	bic	r2, r0
	str	r2, [r3, #64]
	b	.L147
.L148:
	ldr	r3, .L150
	ldr	r2, [r3, #64]
	lsl	r0, r0, #1
	orr	r0, r2
	str	r0, [r3, #64]
.L147:
	@ sp needed
	bx	lr
.L151:
	.align	2
.L150:
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
	cmp	r1, #0
	beq	.L153
	ldr	r3, .L155
	ldr	r2, [r3, #64]
	orr	r0, r2
	str	r0, [r3, #64]
	b	.L152
.L153:
	ldr	r3, .L155
	ldr	r2, [r3, #64]
	bic	r2, r0
	str	r2, [r3, #64]
.L152:
	@ sp needed
	bx	lr
.L156:
	.align	2
.L155:
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
	ldr	r3, .L158
	ldr	r1, [r3, #64]
	ldr	r2, .L158+4
	and	r2, r1
	str	r2, [r3, #64]
	ldr	r2, [r3, #64]
	orr	r0, r2
	str	r0, [r3, #64]
	@ sp needed
	bx	lr
.L159:
	.align	2
.L158:
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
	ldr	r3, .L161
	ldr	r1, [r3, #64]
	ldr	r2, .L161+4
	and	r2, r1
	str	r2, [r3, #64]
	ldr	r2, [r3, #64]
	orr	r0, r2
	str	r0, [r3, #64]
	@ sp needed
	bx	lr
.L162:
	.align	2
.L161:
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
	ldr	r3, .L164
	ldr	r1, [r3, #64]
	ldr	r2, .L164+4
	and	r2, r1
	str	r2, [r3, #64]
	ldr	r2, [r3, #64]
	orr	r0, r2
	str	r0, [r3, #64]
	@ sp needed
	bx	lr
.L165:
	.align	2
.L164:
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
	cmp	r0, #0
	beq	.L167
	ldr	r3, .L169
	ldr	r1, [r3, #64]
	mov	r2, #128
	orr	r2, r1
	str	r2, [r3, #64]
	b	.L166
.L167:
	ldr	r3, .L169
	ldr	r2, [r3, #64]
	mov	r1, #128
	bic	r2, r1
	str	r2, [r3, #64]
.L166:
	@ sp needed
	bx	lr
.L170:
	.align	2
.L169:
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
	cmp	r0, #0
	beq	.L172
	ldr	r3, .L174
	ldr	r1, [r3, #64]
	ldr	r2, .L174+4
	and	r2, r1
	str	r2, [r3, #64]
	b	.L171
.L172:
	ldr	r3, .L174
	ldr	r1, [r3, #64]
	mov	r2, #128
	lsl	r2, r2, #8
	orr	r2, r1
	str	r2, [r3, #64]
.L171:
	@ sp needed
	bx	lr
.L175:
	.align	2
.L174:
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
	sub	sp, sp, #8
.LCFI20:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L177
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	lsl	r0, r0, #2
	add	r0, r0, r3
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	str	r1, [r3]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L178:
	.align	2
.L177:
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
	sub	sp, sp, #8
.LCFI21:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, .L180
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	lsl	r0, r0, #2
	add	r0, r0, r3
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L181:
	.align	2
.L180:
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
	ldr	r3, .L183
	ldr	r1, [r3, #64]
	ldr	r2, .L183+4
	and	r2, r1
	str	r2, [r3, #64]
	ldr	r2, [r3, #64]
	orr	r0, r2
	str	r0, [r3, #64]
	@ sp needed
	bx	lr
.L184:
	.align	2
.L183:
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
	push	{r3, r4, r5, lr}
.LCFI22:
	ldr	r3, .L191
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	ldr	r3, [r3, #12]
	lsl	r2, r3, #28
	bpl	.L186
	ldr	r3, .L191
	ldr	r3, [r3, #12]
	lsl	r4, r3, #28
	bpl	.L186
	mov	r3, #128
	lsl	r3, r3, #5
	ldr	r5, .L191
	mov	r4, #8
.L187:
	ldr	r2, [r5, #12]
	tst	r4, r2
	beq	.L186
	sub	r3, r3, #1
	cmp	r3, #0
	bne	.L187
.L186:
	ldr	r3, .L191
	ldr	r2, [r3, #12]
	mov	r3, #0
	lsl	r4, r2, #28
	bmi	.L188
	ldr	r3, .L191
	ldr	r2, [r3, #8]
	mov	r3, #0
	lsl	r4, r2, #27
	bmi	.L188
	orr	r0, r1
	ldr	r3, .L191
	str	r0, [r3, #44]
	bl	RTC_WaitForSynchro
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r3, r0
.L188:
	mov	r1, #255
	ldr	r2, .L191
	str	r1, [r2, #36]
	mov	r0, r3
	@ sp needed
	pop	{r3, r4, r5, pc}
.L192:
	.align	2
.L191:
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
	push	{r4, lr}
.LCFI23:
	ldr	r3, .L196
	mov	r2, #202
	str	r2, [r3, #36]
	mov	r2, #83
	str	r2, [r3, #36]
	cmp	r1, #0
	beq	.L194
	ldr	r1, [r3, #8]
	mov	r2, #4
	mov	r4, r0
	bic	r4, r2
	orr	r1, r4
	str	r1, [r3, #8]
	ldr	r1, [r3, #64]
	and	r0, r2
	orr	r0, r1
	str	r0, [r3, #64]
	b	.L195
.L194:
	ldr	r3, .L196
	ldr	r1, [r3, #8]
	mov	r2, #4
	mov	r4, r0
	bic	r4, r2
	bic	r1, r4
	str	r1, [r3, #8]
	ldr	r1, [r3, #64]
	and	r0, r2
	mov	r2, r1
	bic	r2, r0
	str	r2, [r3, #64]
.L195:
	mov	r2, #255
	ldr	r3, .L196
	str	r2, [r3, #36]
	@ sp needed
	pop	{r4, pc}
.L197:
	.align	2
.L196:
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
	ldr	r3, .L199
	ldr	r2, [r3, #12]
	ldr	r3, .L199+4
	and	r3, r2
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L200:
	.align	2
.L199:
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
	ldr	r3, .L202
	ldr	r1, [r3, #12]
	ldr	r2, .L202+4
	and	r0, r2
	mov	r2, #128
	orr	r0, r2
	mvn	r0, r0
	and	r2, r1
	orr	r2, r0
	str	r2, [r3, #12]
	@ sp needed
	bx	lr
.L203:
	.align	2
.L202:
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
	push	{r4, r5, lr}
.LCFI24:
	mov	r3, r0
	ldr	r2, .L207
	ldr	r0, [r2, #64]
	ldr	r1, [r2, #8]
	ldr	r4, [r2, #12]
	mov	r2, #4
	and	r2, r0
	lsr	r0, r3, #18
	mov	r5, r3
	lsr	r5, r5, r0
	lsr	r0, r5, #15
	and	r2, r0
	and	r1, r3
	orr	r2, r1
	mov	r0, #0
	cmp	r2, #0
	beq	.L205
	lsl	r4, r4, #16
	lsr	r4, r4, #16
	lsr	r0, r3, #4
	and	r0, r4
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
.L205:
	@ sp needed
	pop	{r4, r5, pc}
.L208:
	.align	2
.L207:
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
	push	{r4, lr}
.LCFI25:
	ldr	r3, .L210
	ldr	r4, [r3, #12]
	lsl	r1, r0, #12
	lsr	r1, r1, #16
	mov	r2, #128
	orr	r1, r2
	mvn	r1, r1
	and	r2, r4
	orr	r2, r1
	str	r2, [r3, #12]
	@ sp needed
	pop	{r4, pc}
.L211:
	.align	2
.L210:
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
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LCFI2-.LFB33
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
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI3-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI5-.LFB32
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI7-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
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
	.4byte	.LCFI8-.LFB41
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
	.4byte	.LCFI9-.LFB43
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
	.4byte	.LCFI10-.LFB45
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
	.4byte	.LCFI11-.LFB47
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
	.4byte	.LCFI12-.LFB48
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
	.4byte	.LCFI13-.LFB50
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
	.4byte	.LCFI14-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LCFI16-.LFB54
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
	.4byte	.LCFI17-.LFB56
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
	.4byte	.LCFI18-.LFB59
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
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI19-.LFB61
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
	.4byte	.LCFI20-.LFB70
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
	.4byte	.LCFI21-.LFB71
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
	.4byte	.LCFI22-.LFB73
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
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI23-.LFB74
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
	.4byte	.LCFI24-.LFB77
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
	.4byte	.LCFI25-.LFB78
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_rtc.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x38c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x1
	.4byte	.LASF50
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.2byte	0x91a
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.2byte	0x92c
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x1a0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x1b6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x1d1
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x1fe
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x172
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x214
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x135
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x247
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x277
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x2ad
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x315
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x328
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x349
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x362
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x3bd
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x40c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x474
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x491
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x4bf
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x51c
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x53c
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x566
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x581
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x5a5
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x5d0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x5f0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x614
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x660
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x68c
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x6b8
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x6de
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x6fb
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x71a
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x73c
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x753
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x767
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x77e
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x7a7
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x7bc
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x7e4
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x80a
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x877
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x8a3
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x8c7
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x8db
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x903
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
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
	.uleb128 0x5
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
	.byte	0
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
.LASF50:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_rtc.c\000"
.LASF0:
	.ascii	"RTC_ByteToBcd2\000"
.LASF28:
	.ascii	"RTC_CalibOutputConfig\000"
.LASF49:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF10:
	.ascii	"RTC_BypassShadowCmd\000"
.LASF4:
	.ascii	"RTC_EnterInitMode\000"
.LASF14:
	.ascii	"RTC_GetSubSecond\000"
.LASF42:
	.ascii	"RTC_OutputTypeConfig\000"
.LASF27:
	.ascii	"RTC_CalibOutputCmd\000"
.LASF7:
	.ascii	"RTC_WaitForSynchro\000"
.LASF39:
	.ascii	"RTC_TamperPullUpCmd\000"
.LASF19:
	.ascii	"RTC_AlarmStructInit\000"
.LASF36:
	.ascii	"RTC_TamperSamplingFreqConfig\000"
.LASF33:
	.ascii	"RTC_TamperTriggerConfig\000"
.LASF22:
	.ascii	"RTC_AlarmSubSecondConfig\000"
.LASF31:
	.ascii	"RTC_GetTimeStamp\000"
.LASF40:
	.ascii	"RTC_WriteBackupRegister\000"
.LASF24:
	.ascii	"RTC_DayLightSavingConfig\000"
.LASF45:
	.ascii	"RTC_GetFlagStatus\000"
.LASF13:
	.ascii	"RTC_GetTime\000"
.LASF11:
	.ascii	"RTC_SetTime\000"
.LASF37:
	.ascii	"RTC_TamperPinsPrechargeDuration\000"
.LASF35:
	.ascii	"RTC_TamperFilterConfig\000"
.LASF18:
	.ascii	"RTC_SetAlarm\000"
.LASF43:
	.ascii	"RTC_SynchroShiftConfig\000"
.LASF34:
	.ascii	"RTC_TamperCmd\000"
.LASF8:
	.ascii	"RTC_DeInit\000"
.LASF23:
	.ascii	"RTC_GetAlarmSubSecond\000"
.LASF26:
	.ascii	"RTC_OutputConfig\000"
.LASF5:
	.ascii	"RTC_ExitInitMode\000"
.LASF32:
	.ascii	"RTC_GetTimeStampSubSecond\000"
.LASF1:
	.ascii	"RTC_Bcd2ToByte\000"
.LASF47:
	.ascii	"RTC_GetITStatus\000"
.LASF20:
	.ascii	"RTC_GetAlarm\000"
.LASF38:
	.ascii	"RTC_TimeStampOnTamperDetectionCmd\000"
.LASF44:
	.ascii	"RTC_ITConfig\000"
.LASF21:
	.ascii	"RTC_AlarmCmd\000"
.LASF46:
	.ascii	"RTC_ClearFlag\000"
.LASF30:
	.ascii	"RTC_TimeStampCmd\000"
.LASF12:
	.ascii	"RTC_TimeStructInit\000"
.LASF9:
	.ascii	"RTC_RefClockCmd\000"
.LASF41:
	.ascii	"RTC_ReadBackupRegister\000"
.LASF25:
	.ascii	"RTC_GetStoreOperation\000"
.LASF6:
	.ascii	"RTC_Init\000"
.LASF16:
	.ascii	"RTC_DateStructInit\000"
.LASF2:
	.ascii	"RTC_StructInit\000"
.LASF17:
	.ascii	"RTC_GetDate\000"
.LASF15:
	.ascii	"RTC_SetDate\000"
.LASF3:
	.ascii	"RTC_WriteProtectionCmd\000"
.LASF48:
	.ascii	"RTC_ClearITPendingBit\000"
.LASF29:
	.ascii	"RTC_SmoothCalibConfig\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
