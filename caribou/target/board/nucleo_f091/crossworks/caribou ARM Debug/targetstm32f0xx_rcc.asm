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
	.file	"stm32f0xx_rcc.c"
	.text
.Ltext0:
	.section	.data.APBAHBPrescTable,"aw",%progbits
	.align	2
	.type	APBAHBPrescTable, %object
	.size	APBAHBPrescTable, 16
APBAHBPrescTable:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.section	.text.RCC_DeInit,"ax",%progbits
	.align	2
	.global	RCC_DeInit
	.code	16
	.thumb_func
	.type	RCC_DeInit, %function
RCC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_rcc.c"
	.loc 1 147 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 149 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 152 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #4]
	ldr	r1, .L2+4
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 155 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	ldr	r1, .L2+8
	ands	r2, r1
	str	r2, [r3]
	.loc 1 158 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	ldr	r1, .L2+12
	ands	r2, r1
	str	r2, [r3]
	.loc 1 161 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #4]
	ldr	r1, .L2+16
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 164 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #44]
	movs	r1, #15
	bics	r2, r1
	str	r2, [r3, #44]
	.loc 1 167 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #48]
	ldr	r1, .L2+20
	ands	r2, r1
	str	r2, [r3, #48]
	.loc 1 170 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #52]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #52]
	.loc 1 173 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 174 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	-117458932
	.word	-17367041
	.word	-262145
	.word	-4128769
	.word	-340
.LFE32:
	.size	RCC_DeInit, .-RCC_DeInit
	.section	.text.RCC_HSEConfig,"ax",%progbits
	.align	2
	.global	RCC_HSEConfig
	.code	16
	.thumb_func
	.type	RCC_HSEConfig, %function
RCC_HSEConfig:
.LFB33:
	.loc 1 197 0
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
	.loc 1 202 0
	ldr	r3, .L5
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 205 0
	ldr	r2, .L5
	adds	r3, r7, #7
	ldrb	r3, [r3]
	strb	r3, [r2]
	.loc 1 207 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	1073876994
.LFE33:
	.size	RCC_HSEConfig, .-RCC_HSEConfig
	.section	.text.RCC_WaitForHSEStartUp,"ax",%progbits
	.align	2
	.global	RCC_WaitForHSEStartUp
	.code	16
	.thumb_func
	.type	RCC_WaitForHSEStartUp, %function
RCC_WaitForHSEStartUp:
.LFB34:
	.loc 1 223 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI5:
	sub	sp, sp, #12
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	.loc 1 224 0
	movs	r3, #0
	str	r3, [r7]
	.loc 1 225 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 226 0
	adds	r3, r7, #6
	movs	r2, #0
	strb	r2, [r3]
.L9:
	.loc 1 231 0 discriminator 2
	adds	r4, r7, #6
	movs	r0, #17
	bl	RCC_GetFlagStatus
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 232 0 discriminator 2
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
	.loc 1 233 0 discriminator 2
	ldr	r2, [r7]
	movs	r3, #160
	lsls	r3, r3, #3
	cmp	r2, r3
	beq	.L8
	.loc 1 233 0 is_stmt 0 discriminator 1
	adds	r3, r7, #6
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L9
.L8:
	.loc 1 235 0 is_stmt 1
	movs	r0, #17
	bl	RCC_GetFlagStatus
	subs	r3, r0, #0
	beq	.L10
	.loc 1 237 0
	adds	r3, r7, #7
	movs	r2, #1
	strb	r2, [r3]
	b	.L11
.L10:
	.loc 1 241 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
.L11:
	.loc 1 243 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 244 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
.LFE34:
	.size	RCC_WaitForHSEStartUp, .-RCC_WaitForHSEStartUp
	.section	.text.RCC_AdjustHSICalibrationValue,"ax",%progbits
	.align	2
	.global	RCC_AdjustHSICalibrationValue
	.code	16
	.thumb_func
	.type	RCC_AdjustHSICalibrationValue, %function
RCC_AdjustHSICalibrationValue:
.LFB35:
	.loc 1 257 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #16
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 258 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 263 0
	ldr	r3, .L14
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 266 0
	ldr	r3, [r7, #12]
	movs	r2, #248
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 269 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 272 0
	ldr	r3, .L14
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 273 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	1073876992
.LFE35:
	.size	RCC_AdjustHSICalibrationValue, .-RCC_AdjustHSICalibrationValue
	.section	.text.RCC_HSICmd,"ax",%progbits
	.align	2
	.global	RCC_HSICmd
	.code	16
	.thumb_func
	.type	RCC_HSICmd, %function
RCC_HSICmd:
.LFB36:
	.loc 1 291 0
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
	.loc 1 295 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L17
	.loc 1 297 0
	ldr	r3, .L20
	ldr	r2, .L20
	ldr	r2, [r2]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 303 0
	b	.L19
.L17:
	.loc 1 301 0
	ldr	r3, .L20
	ldr	r2, .L20
	ldr	r2, [r2]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3]
.L19:
	.loc 1 303 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	1073876992
.LFE36:
	.size	RCC_HSICmd, .-RCC_HSICmd
	.section	.text.RCC_AdjustHSI14CalibrationValue,"ax",%progbits
	.align	2
	.global	RCC_AdjustHSI14CalibrationValue
	.code	16
	.thumb_func
	.type	RCC_AdjustHSI14CalibrationValue, %function
RCC_AdjustHSI14CalibrationValue:
.LFB37:
	.loc 1 317 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #16
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 318 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 323 0
	ldr	r3, .L23
	ldr	r3, [r3, #52]
	str	r3, [r7, #12]
	.loc 1 326 0
	ldr	r3, [r7, #12]
	movs	r2, #248
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 329 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r3, r3, #3
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 332 0
	ldr	r3, .L23
	ldr	r2, [r7, #12]
	str	r2, [r3, #52]
	.loc 1 333 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	1073876992
.LFE37:
	.size	RCC_AdjustHSI14CalibrationValue, .-RCC_AdjustHSI14CalibrationValue
	.section	.text.RCC_HSI14Cmd,"ax",%progbits
	.align	2
	.global	RCC_HSI14Cmd
	.code	16
	.thumb_func
	.type	RCC_HSI14Cmd, %function
RCC_HSI14Cmd:
.LFB38:
	.loc 1 348 0
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
	.loc 1 352 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L26
	.loc 1 354 0
	ldr	r3, .L29
	ldr	r2, .L29
	ldr	r2, [r2, #52]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #52]
	.loc 1 360 0
	b	.L28
.L26:
	.loc 1 358 0
	ldr	r3, .L29
	ldr	r2, .L29
	ldr	r2, [r2, #52]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #52]
.L28:
	.loc 1 360 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	1073876992
.LFE38:
	.size	RCC_HSI14Cmd, .-RCC_HSI14Cmd
	.section	.text.RCC_HSI14ADCRequestCmd,"ax",%progbits
	.align	2
	.global	RCC_HSI14ADCRequestCmd
	.code	16
	.thumb_func
	.type	RCC_HSI14ADCRequestCmd, %function
RCC_HSI14ADCRequestCmd:
.LFB39:
	.loc 1 369 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 373 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L32
	.loc 1 375 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r2, [r2, #52]
	movs	r1, #4
	bics	r2, r1
	str	r2, [r3, #52]
	.loc 1 381 0
	b	.L34
.L32:
	.loc 1 379 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r2, [r2, #52]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #52]
.L34:
	.loc 1 381 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
	.word	1073876992
.LFE39:
	.size	RCC_HSI14ADCRequestCmd, .-RCC_HSI14ADCRequestCmd
	.section	.text.RCC_LSEConfig,"ax",%progbits
	.align	2
	.global	RCC_LSEConfig
	.code	16
	.thumb_func
	.type	RCC_LSEConfig, %function
RCC_LSEConfig:
.LFB40:
	.loc 1 401 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #8
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	str	r0, [r7, #4]
	.loc 1 407 0
	ldr	r3, .L38
	ldr	r2, .L38
	ldr	r2, [r2, #32]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #32]
	.loc 1 410 0
	ldr	r3, .L38
	ldr	r2, .L38
	ldr	r2, [r2, #32]
	movs	r1, #4
	bics	r2, r1
	str	r2, [r3, #32]
	.loc 1 413 0
	ldr	r3, .L38
	ldr	r2, .L38
	ldr	r1, [r2, #32]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #32]
	.loc 1 414 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L39:
	.align	2
.L38:
	.word	1073876992
.LFE40:
	.size	RCC_LSEConfig, .-RCC_LSEConfig
	.section	.text.RCC_LSEDriveConfig,"ax",%progbits
	.align	2
	.global	RCC_LSEDriveConfig
	.code	16
	.thumb_func
	.type	RCC_LSEDriveConfig, %function
RCC_LSEDriveConfig:
.LFB41:
	.loc 1 427 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI26:
	sub	sp, sp, #8
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	str	r0, [r7, #4]
	.loc 1 432 0
	ldr	r3, .L41
	ldr	r2, .L41
	ldr	r2, [r2, #32]
	movs	r1, #24
	bics	r2, r1
	str	r2, [r3, #32]
	.loc 1 435 0
	ldr	r3, .L41
	ldr	r2, .L41
	ldr	r1, [r2, #32]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #32]
	.loc 1 436 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
	.word	1073876992
.LFE41:
	.size	RCC_LSEDriveConfig, .-RCC_LSEDriveConfig
	.section	.text.RCC_LSICmd,"ax",%progbits
	.align	2
	.global	RCC_LSICmd
	.code	16
	.thumb_func
	.type	RCC_LSICmd, %function
RCC_LSICmd:
.LFB42:
	.loc 1 451 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	sub	sp, sp, #8
.LCFI30:
	add	r7, sp, #0
.LCFI31:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 455 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L44
	.loc 1 457 0
	ldr	r3, .L47
	ldr	r2, .L47
	ldr	r2, [r2, #36]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #36]
	.loc 1 463 0
	b	.L46
.L44:
	.loc 1 461 0
	ldr	r3, .L47
	ldr	r2, .L47
	ldr	r2, [r2, #36]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #36]
.L46:
	.loc 1 463 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L48:
	.align	2
.L47:
	.word	1073876992
.LFE42:
	.size	RCC_LSICmd, .-RCC_LSICmd
	.section	.text.RCC_PLLConfig,"ax",%progbits
	.align	2
	.global	RCC_PLLConfig
	.code	16
	.thumb_func
	.type	RCC_PLLConfig, %function
RCC_PLLConfig:
.LFB43:
	.loc 1 482 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI32:
	sub	sp, sp, #8
.LCFI33:
	add	r7, sp, #0
.LCFI34:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 488 0
	ldr	r3, .L50
	ldr	r2, .L50
	ldr	r2, [r2, #4]
	ldr	r1, .L50+4
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 491 0
	ldr	r3, .L50
	ldr	r2, .L50
	ldr	r1, [r2, #4]
	ldr	r0, [r7, #4]
	ldr	r2, [r7]
	orrs	r2, r0
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 492 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1073876992
	.word	-3997697
.LFE43:
	.size	RCC_PLLConfig, .-RCC_PLLConfig
	.section	.text.RCC_PLLCmd,"ax",%progbits
	.align	2
	.global	RCC_PLLCmd
	.code	16
	.thumb_func
	.type	RCC_PLLCmd, %function
RCC_PLLCmd:
.LFB44:
	.loc 1 506 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI35:
	sub	sp, sp, #8
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 510 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L53
	.loc 1 512 0
	ldr	r3, .L56
	ldr	r2, .L56
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 518 0
	b	.L55
.L53:
	.loc 1 516 0
	ldr	r3, .L56
	ldr	r2, .L56
	ldr	r2, [r2]
	ldr	r1, .L56+4
	ands	r2, r1
	str	r2, [r3]
.L55:
	.loc 1 518 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L57:
	.align	2
.L56:
	.word	1073876992
	.word	-16777217
.LFE44:
	.size	RCC_PLLCmd, .-RCC_PLLCmd
	.section	.text.RCC_PREDIV1Config,"ax",%progbits
	.align	2
	.global	RCC_PREDIV1Config
	.code	16
	.thumb_func
	.type	RCC_PREDIV1Config, %function
RCC_PREDIV1Config:
.LFB45:
	.loc 1 528 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI38:
	sub	sp, sp, #16
.LCFI39:
	add	r7, sp, #0
.LCFI40:
	str	r0, [r7, #4]
	.loc 1 529 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 534 0
	ldr	r3, .L59
	ldr	r3, [r3, #44]
	str	r3, [r7, #12]
	.loc 1 536 0
	ldr	r3, [r7, #12]
	movs	r2, #15
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 538 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 540 0
	ldr	r3, .L59
	ldr	r2, [r7, #12]
	str	r2, [r3, #44]
	.loc 1 541 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L60:
	.align	2
.L59:
	.word	1073876992
.LFE45:
	.size	RCC_PREDIV1Config, .-RCC_PREDIV1Config
	.section	.text.RCC_ClockSecuritySystemCmd,"ax",%progbits
	.align	2
	.global	RCC_ClockSecuritySystemCmd
	.code	16
	.thumb_func
	.type	RCC_ClockSecuritySystemCmd, %function
RCC_ClockSecuritySystemCmd:
.LFB46:
	.loc 1 555 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI41:
	sub	sp, sp, #8
.LCFI42:
	add	r7, sp, #0
.LCFI43:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 559 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L62
	.loc 1 561 0
	ldr	r3, .L65
	ldr	r2, .L65
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #12
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 567 0
	b	.L64
.L62:
	.loc 1 565 0
	ldr	r3, .L65
	ldr	r2, .L65
	ldr	r2, [r2]
	ldr	r1, .L65+4
	ands	r2, r1
	str	r2, [r3]
.L64:
	.loc 1 567 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L66:
	.align	2
.L65:
	.word	1073876992
	.word	-524289
.LFE46:
	.size	RCC_ClockSecuritySystemCmd, .-RCC_ClockSecuritySystemCmd
	.section	.text.RCC_MCOConfig,"ax",%progbits
	.align	2
	.global	RCC_MCOConfig
	.code	16
	.thumb_func
	.type	RCC_MCOConfig, %function
RCC_MCOConfig:
.LFB47:
	.loc 1 585 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI44:
	sub	sp, sp, #8
.LCFI45:
	add	r7, sp, #0
.LCFI46:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 590 0
	ldr	r2, .L68
	adds	r3, r7, #7
	ldrb	r3, [r3]
	strb	r3, [r2]
	.loc 1 591 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L69:
	.align	2
.L68:
	.word	1073876999
.LFE47:
	.size	RCC_MCOConfig, .-RCC_MCOConfig
	.section	.text.RCC_SYSCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_SYSCLKConfig
	.code	16
	.thumb_func
	.type	RCC_SYSCLKConfig, %function
RCC_SYSCLKConfig:
.LFB48:
	.loc 1 690 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI47:
	sub	sp, sp, #16
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	str	r0, [r7, #4]
	.loc 1 691 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 696 0
	ldr	r3, .L71
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 699 0
	ldr	r3, [r7, #12]
	movs	r2, #3
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 702 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 705 0
	ldr	r3, .L71
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 706 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L72:
	.align	2
.L71:
	.word	1073876992
.LFE48:
	.size	RCC_SYSCLKConfig, .-RCC_SYSCLKConfig
	.section	.text.RCC_GetSYSCLKSource,"ax",%progbits
	.align	2
	.global	RCC_GetSYSCLKSource
	.code	16
	.thumb_func
	.type	RCC_GetSYSCLKSource, %function
RCC_GetSYSCLKSource:
.LFB49:
	.loc 1 718 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI50:
	add	r7, sp, #0
.LCFI51:
	.loc 1 719 0
	ldr	r3, .L75
	ldr	r3, [r3, #4]
	uxtb	r3, r3
	movs	r2, #12
	ands	r3, r2
	uxtb	r3, r3
	.loc 1 720 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L76:
	.align	2
.L75:
	.word	1073876992
.LFE49:
	.size	RCC_GetSYSCLKSource, .-RCC_GetSYSCLKSource
	.section	.text.RCC_HCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_HCLKConfig
	.code	16
	.thumb_func
	.type	RCC_HCLKConfig, %function
RCC_HCLKConfig:
.LFB50:
	.loc 1 739 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI52:
	sub	sp, sp, #16
.LCFI53:
	add	r7, sp, #0
.LCFI54:
	str	r0, [r7, #4]
	.loc 1 740 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 745 0
	ldr	r3, .L78
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 748 0
	ldr	r3, [r7, #12]
	movs	r2, #240
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 751 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 754 0
	ldr	r3, .L78
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 755 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L79:
	.align	2
.L78:
	.word	1073876992
.LFE50:
	.size	RCC_HCLKConfig, .-RCC_HCLKConfig
	.section	.text.RCC_PCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_PCLKConfig
	.code	16
	.thumb_func
	.type	RCC_PCLKConfig, %function
RCC_PCLKConfig:
.LFB51:
	.loc 1 770 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI55:
	sub	sp, sp, #16
.LCFI56:
	add	r7, sp, #0
.LCFI57:
	str	r0, [r7, #4]
	.loc 1 771 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 776 0
	ldr	r3, .L81
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 779 0
	ldr	r3, [r7, #12]
	ldr	r2, .L81+4
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 782 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 785 0
	ldr	r3, .L81
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 786 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L82:
	.align	2
.L81:
	.word	1073876992
	.word	-1793
.LFE51:
	.size	RCC_PCLKConfig, .-RCC_PCLKConfig
	.section	.text.RCC_ADCCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_ADCCLKConfig
	.code	16
	.thumb_func
	.type	RCC_ADCCLKConfig, %function
RCC_ADCCLKConfig:
.LFB52:
	.loc 1 799 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI58:
	sub	sp, sp, #8
.LCFI59:
	add	r7, sp, #0
.LCFI60:
	str	r0, [r7, #4]
	.loc 1 804 0
	ldr	r3, .L84
	ldr	r2, .L84
	ldr	r2, [r2, #4]
	ldr	r1, .L84+4
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 806 0
	ldr	r3, .L84
	ldr	r2, .L84
	ldr	r1, [r2, #4]
	ldr	r2, [r7, #4]
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 809 0
	ldr	r3, .L84
	ldr	r2, .L84
	ldr	r2, [r2, #48]
	ldr	r1, .L84+8
	ands	r2, r1
	str	r2, [r3, #48]
	.loc 1 811 0
	ldr	r3, .L84
	ldr	r2, .L84
	ldr	r1, [r2, #48]
	ldr	r2, [r7, #4]
	lsrs	r2, r2, #16
	orrs	r2, r1
	str	r2, [r3, #48]
	.loc 1 812 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L85:
	.align	2
.L84:
	.word	1073876992
	.word	-16385
	.word	-257
.LFE52:
	.size	RCC_ADCCLKConfig, .-RCC_ADCCLKConfig
	.section	.text.RCC_CECCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_CECCLKConfig
	.code	16
	.thumb_func
	.type	RCC_CECCLKConfig, %function
RCC_CECCLKConfig:
.LFB53:
	.loc 1 824 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI61:
	sub	sp, sp, #8
.LCFI62:
	add	r7, sp, #0
.LCFI63:
	str	r0, [r7, #4]
	.loc 1 829 0
	ldr	r3, .L87
	ldr	r2, .L87
	ldr	r2, [r2, #48]
	movs	r1, #64
	bics	r2, r1
	str	r2, [r3, #48]
	.loc 1 831 0
	ldr	r3, .L87
	ldr	r2, .L87
	ldr	r1, [r2, #48]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #48]
	.loc 1 832 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L88:
	.align	2
.L87:
	.word	1073876992
.LFE53:
	.size	RCC_CECCLKConfig, .-RCC_CECCLKConfig
	.section	.text.RCC_I2CCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_I2CCLKConfig
	.code	16
	.thumb_func
	.type	RCC_I2CCLKConfig, %function
RCC_I2CCLKConfig:
.LFB54:
	.loc 1 844 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI64:
	sub	sp, sp, #8
.LCFI65:
	add	r7, sp, #0
.LCFI66:
	str	r0, [r7, #4]
	.loc 1 849 0
	ldr	r3, .L90
	ldr	r2, .L90
	ldr	r2, [r2, #48]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #48]
	.loc 1 851 0
	ldr	r3, .L90
	ldr	r2, .L90
	ldr	r1, [r2, #48]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #48]
	.loc 1 852 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L91:
	.align	2
.L90:
	.word	1073876992
.LFE54:
	.size	RCC_I2CCLKConfig, .-RCC_I2CCLKConfig
	.section	.text.RCC_USARTCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_USARTCLKConfig
	.code	16
	.thumb_func
	.type	RCC_USARTCLKConfig, %function
RCC_USARTCLKConfig:
.LFB55:
	.loc 1 866 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI67:
	sub	sp, sp, #8
.LCFI68:
	add	r7, sp, #0
.LCFI69:
	str	r0, [r7, #4]
	.loc 1 871 0
	ldr	r3, .L93
	ldr	r2, .L93
	ldr	r2, [r2, #48]
	movs	r1, #3
	bics	r2, r1
	str	r2, [r3, #48]
	.loc 1 873 0
	ldr	r3, .L93
	ldr	r2, .L93
	ldr	r1, [r2, #48]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #48]
	.loc 1 874 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L94:
	.align	2
.L93:
	.word	1073876992
.LFE55:
	.size	RCC_USARTCLKConfig, .-RCC_USARTCLKConfig
	.global	__aeabi_uidiv
	.section	.text.RCC_GetClocksFreq,"ax",%progbits
	.align	2
	.global	RCC_GetClocksFreq
	.code	16
	.thumb_func
	.type	RCC_GetClocksFreq, %function
RCC_GetClocksFreq:
.LFB56:
	.loc 1 913 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI70:
	sub	sp, sp, #32
.LCFI71:
	add	r7, sp, #0
.LCFI72:
	str	r0, [r7, #4]
	.loc 1 914 0
	movs	r3, #0
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 917 0
	ldr	r3, .L116
	ldr	r3, [r3, #4]
	movs	r2, #12
	ands	r3, r2
	str	r3, [r7, #28]
	.loc 1 919 0
	ldr	r3, [r7, #28]
	cmp	r3, #4
	beq	.L97
	cmp	r3, #8
	beq	.L98
	cmp	r3, #0
	bne	.L114
	.loc 1 922 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+4
	str	r2, [r3]
	.loc 1 923 0
	b	.L100
.L97:
	.loc 1 925 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+4
	str	r2, [r3]
	.loc 1 926 0
	b	.L100
.L98:
	.loc 1 929 0
	ldr	r3, .L116
	ldr	r2, [r3, #4]
	movs	r3, #240
	lsls	r3, r3, #14
	ands	r3, r2
	str	r3, [r7, #24]
	.loc 1 930 0
	ldr	r3, .L116
	ldr	r2, [r3, #4]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	str	r3, [r7, #20]
	.loc 1 931 0
	ldr	r3, [r7, #24]
	lsrs	r3, r3, #18
	adds	r3, r3, #2
	str	r3, [r7, #24]
	.loc 1 933 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L101
	.loc 1 936 0
	ldr	r3, [r7, #24]
	ldr	r2, .L116+8
	muls	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 944 0
	b	.L100
.L101:
	.loc 1 940 0
	ldr	r3, .L116
	ldr	r3, [r3, #44]
	movs	r2, #15
	ands	r3, r2
	adds	r3, r3, #1
	str	r3, [r7, #16]
	.loc 1 942 0
	ldr	r1, [r7, #16]
	ldr	r0, .L116+4
	bl	__aeabi_uidiv
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #24]
	muls	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 944 0
	b	.L100
.L114:
	.loc 1 946 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+4
	str	r2, [r3]
	.loc 1 947 0
	nop
.L100:
	.loc 1 951 0
	ldr	r3, .L116
	ldr	r3, [r3, #4]
	movs	r2, #240
	ands	r3, r2
	str	r3, [r7, #28]
	.loc 1 952 0
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #4
	str	r3, [r7, #28]
	.loc 1 953 0
	ldr	r2, .L116+12
	ldr	r3, [r7, #28]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	uxtb	r3, r3
	str	r3, [r7, #12]
	.loc 1 955 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	lsrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 958 0
	ldr	r3, .L116
	ldr	r2, [r3, #4]
	movs	r3, #224
	lsls	r3, r3, #3
	ands	r3, r2
	str	r3, [r7, #28]
	.loc 1 959 0
	ldr	r3, [r7, #28]
	lsrs	r3, r3, #8
	str	r3, [r7, #28]
	.loc 1 960 0
	ldr	r2, .L116+12
	ldr	r3, [r7, #28]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	uxtb	r3, r3
	str	r3, [r7, #12]
	.loc 1 962 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	lsrs	r2, r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 965 0
	ldr	r3, .L116
	ldr	r2, [r3, #48]
	movs	r3, #128
	lsls	r3, r3, #1
	ands	r3, r2
	bne	.L103
	.loc 1 968 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+16
	str	r2, [r3, #12]
	b	.L104
.L103:
	.loc 1 972 0
	ldr	r3, .L116
	ldr	r2, [r3, #4]
	movs	r3, #128
	lsls	r3, r3, #7
	ands	r3, r2
	bne	.L105
	.loc 1 975 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	lsrs	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	b	.L104
.L105:
	.loc 1 980 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	lsrs	r2, r3, #2
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L104:
	.loc 1 986 0
	ldr	r3, .L116
	ldr	r3, [r3, #48]
	movs	r2, #64
	ands	r3, r2
	bne	.L106
	.loc 1 989 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+20
	str	r2, [r3, #16]
	b	.L107
.L106:
	.loc 1 994 0
	ldr	r3, [r7, #4]
	movs	r2, #128
	lsls	r2, r2, #8
	str	r2, [r3, #16]
.L107:
	.loc 1 998 0
	ldr	r3, .L116
	ldr	r3, [r3, #48]
	movs	r2, #16
	ands	r3, r2
	bne	.L108
	.loc 1 1001 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+4
	str	r2, [r3, #20]
	b	.L109
.L108:
	.loc 1 1006 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
.L109:
	.loc 1 1010 0
	ldr	r3, .L116
	ldr	r3, [r3, #48]
	movs	r2, #3
	ands	r3, r2
	bne	.L110
	.loc 1 1013 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	.loc 1 1031 0
	b	.L115
.L110:
	.loc 1 1015 0
	ldr	r3, .L116
	ldr	r3, [r3, #48]
	movs	r2, #3
	ands	r3, r2
	cmp	r3, #1
	bne	.L112
	.loc 1 1018 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	.loc 1 1031 0
	b	.L115
.L112:
	.loc 1 1020 0
	ldr	r3, .L116
	ldr	r3, [r3, #48]
	movs	r2, #3
	ands	r3, r2
	cmp	r3, #2
	bne	.L113
	.loc 1 1023 0
	ldr	r3, [r7, #4]
	movs	r2, #128
	lsls	r2, r2, #8
	str	r2, [r3, #24]
	.loc 1 1031 0
	b	.L115
.L113:
	.loc 1 1025 0
	ldr	r3, .L116
	ldr	r3, [r3, #48]
	movs	r2, #3
	ands	r3, r2
	cmp	r3, #3
	bne	.L115
	.loc 1 1028 0
	ldr	r3, [r7, #4]
	ldr	r2, .L116+4
	str	r2, [r3, #24]
.L115:
	.loc 1 1031 0
	nop
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L117:
	.align	2
.L116:
	.word	1073876992
	.word	8000000
	.word	4000000
	.word	APBAHBPrescTable
	.word	14000000
	.word	32786
.LFE56:
	.size	RCC_GetClocksFreq, .-RCC_GetClocksFreq
	.section	.text.RCC_RTCCLKConfig,"ax",%progbits
	.align	2
	.global	RCC_RTCCLKConfig
	.code	16
	.thumb_func
	.type	RCC_RTCCLKConfig, %function
RCC_RTCCLKConfig:
.LFB57:
	.loc 1 1087 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI73:
	sub	sp, sp, #8
.LCFI74:
	add	r7, sp, #0
.LCFI75:
	str	r0, [r7, #4]
	.loc 1 1092 0
	ldr	r3, .L119
	ldr	r2, .L119
	ldr	r1, [r2, #32]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #32]
	.loc 1 1093 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L120:
	.align	2
.L119:
	.word	1073876992
.LFE57:
	.size	RCC_RTCCLKConfig, .-RCC_RTCCLKConfig
	.section	.text.RCC_RTCCLKCmd,"ax",%progbits
	.align	2
	.global	RCC_RTCCLKCmd
	.code	16
	.thumb_func
	.type	RCC_RTCCLKCmd, %function
RCC_RTCCLKCmd:
.LFB58:
	.loc 1 1104 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI76:
	sub	sp, sp, #8
.LCFI77:
	add	r7, sp, #0
.LCFI78:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1108 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L122
	.loc 1 1110 0
	ldr	r3, .L125
	ldr	r2, .L125
	ldr	r2, [r2, #32]
	movs	r1, #128
	lsls	r1, r1, #8
	orrs	r2, r1
	str	r2, [r3, #32]
	.loc 1 1116 0
	b	.L124
.L122:
	.loc 1 1114 0
	ldr	r3, .L125
	ldr	r2, .L125
	ldr	r2, [r2, #32]
	ldr	r1, .L125+4
	ands	r2, r1
	str	r2, [r3, #32]
.L124:
	.loc 1 1116 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L126:
	.align	2
.L125:
	.word	1073876992
	.word	-32769
.LFE58:
	.size	RCC_RTCCLKCmd, .-RCC_RTCCLKCmd
	.section	.text.RCC_BackupResetCmd,"ax",%progbits
	.align	2
	.global	RCC_BackupResetCmd
	.code	16
	.thumb_func
	.type	RCC_BackupResetCmd, %function
RCC_BackupResetCmd:
.LFB59:
	.loc 1 1127 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI79:
	sub	sp, sp, #8
.LCFI80:
	add	r7, sp, #0
.LCFI81:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1131 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L128
	.loc 1 1133 0
	ldr	r3, .L131
	ldr	r2, .L131
	ldr	r2, [r2, #32]
	movs	r1, #128
	lsls	r1, r1, #9
	orrs	r2, r1
	str	r2, [r3, #32]
	.loc 1 1139 0
	b	.L130
.L128:
	.loc 1 1137 0
	ldr	r3, .L131
	ldr	r2, .L131
	ldr	r2, [r2, #32]
	ldr	r1, .L131+4
	ands	r2, r1
	str	r2, [r3, #32]
.L130:
	.loc 1 1139 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L132:
	.align	2
.L131:
	.word	1073876992
	.word	-65537
.LFE59:
	.size	RCC_BackupResetCmd, .-RCC_BackupResetCmd
	.section	.text.RCC_AHBPeriphClockCmd,"ax",%progbits
	.align	2
	.global	RCC_AHBPeriphClockCmd
	.code	16
	.thumb_func
	.type	RCC_AHBPeriphClockCmd, %function
RCC_AHBPeriphClockCmd:
.LFB60:
	.loc 1 1163 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI82:
	sub	sp, sp, #8
.LCFI83:
	add	r7, sp, #0
.LCFI84:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1168 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L134
	.loc 1 1170 0
	ldr	r3, .L137
	ldr	r2, .L137
	ldr	r1, [r2, #20]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #20]
	.loc 1 1176 0
	b	.L136
.L134:
	.loc 1 1174 0
	ldr	r3, .L137
	ldr	r2, .L137
	ldr	r2, [r2, #20]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #20]
.L136:
	.loc 1 1176 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L138:
	.align	2
.L137:
	.word	1073876992
.LFE60:
	.size	RCC_AHBPeriphClockCmd, .-RCC_AHBPeriphClockCmd
	.section	.text.RCC_APB2PeriphClockCmd,"ax",%progbits
	.align	2
	.global	RCC_APB2PeriphClockCmd
	.code	16
	.thumb_func
	.type	RCC_APB2PeriphClockCmd, %function
RCC_APB2PeriphClockCmd:
.LFB61:
	.loc 1 1199 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI85:
	sub	sp, sp, #8
.LCFI86:
	add	r7, sp, #0
.LCFI87:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1204 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L140
	.loc 1 1206 0
	ldr	r3, .L143
	ldr	r2, .L143
	ldr	r1, [r2, #24]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 1212 0
	b	.L142
.L140:
	.loc 1 1210 0
	ldr	r3, .L143
	ldr	r2, .L143
	ldr	r2, [r2, #24]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #24]
.L142:
	.loc 1 1212 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L144:
	.align	2
.L143:
	.word	1073876992
.LFE61:
	.size	RCC_APB2PeriphClockCmd, .-RCC_APB2PeriphClockCmd
	.section	.text.RCC_APB1PeriphClockCmd,"ax",%progbits
	.align	2
	.global	RCC_APB1PeriphClockCmd
	.code	16
	.thumb_func
	.type	RCC_APB1PeriphClockCmd, %function
RCC_APB1PeriphClockCmd:
.LFB62:
	.loc 1 1238 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI88:
	sub	sp, sp, #8
.LCFI89:
	add	r7, sp, #0
.LCFI90:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1243 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L146
	.loc 1 1245 0
	ldr	r3, .L149
	ldr	r2, .L149
	ldr	r1, [r2, #28]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #28]
	.loc 1 1251 0
	b	.L148
.L146:
	.loc 1 1249 0
	ldr	r3, .L149
	ldr	r2, .L149
	ldr	r2, [r2, #28]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #28]
.L148:
	.loc 1 1251 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L150:
	.align	2
.L149:
	.word	1073876992
.LFE62:
	.size	RCC_APB1PeriphClockCmd, .-RCC_APB1PeriphClockCmd
	.section	.text.RCC_AHBPeriphResetCmd,"ax",%progbits
	.align	2
	.global	RCC_AHBPeriphResetCmd
	.code	16
	.thumb_func
	.type	RCC_AHBPeriphResetCmd, %function
RCC_AHBPeriphResetCmd:
.LFB63:
	.loc 1 1268 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI91:
	sub	sp, sp, #8
.LCFI92:
	add	r7, sp, #0
.LCFI93:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1273 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L152
	.loc 1 1275 0
	ldr	r3, .L155
	ldr	r2, .L155
	ldr	r1, [r2, #40]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #40]
	.loc 1 1281 0
	b	.L154
.L152:
	.loc 1 1279 0
	ldr	r3, .L155
	ldr	r2, .L155
	ldr	r2, [r2, #40]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #40]
.L154:
	.loc 1 1281 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L156:
	.align	2
.L155:
	.word	1073876992
.LFE63:
	.size	RCC_AHBPeriphResetCmd, .-RCC_AHBPeriphResetCmd
	.section	.text.RCC_APB2PeriphResetCmd,"ax",%progbits
	.align	2
	.global	RCC_APB2PeriphResetCmd
	.code	16
	.thumb_func
	.type	RCC_APB2PeriphResetCmd, %function
RCC_APB2PeriphResetCmd:
.LFB64:
	.loc 1 1301 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI94:
	sub	sp, sp, #8
.LCFI95:
	add	r7, sp, #0
.LCFI96:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1306 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L158
	.loc 1 1308 0
	ldr	r3, .L161
	ldr	r2, .L161
	ldr	r1, [r2, #12]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 1314 0
	b	.L160
.L158:
	.loc 1 1312 0
	ldr	r3, .L161
	ldr	r2, .L161
	ldr	r2, [r2, #12]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #12]
.L160:
	.loc 1 1314 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L162:
	.align	2
.L161:
	.word	1073876992
.LFE64:
	.size	RCC_APB2PeriphResetCmd, .-RCC_APB2PeriphResetCmd
	.section	.text.RCC_APB1PeriphResetCmd,"ax",%progbits
	.align	2
	.global	RCC_APB1PeriphResetCmd
	.code	16
	.thumb_func
	.type	RCC_APB1PeriphResetCmd, %function
RCC_APB1PeriphResetCmd:
.LFB65:
	.loc 1 1337 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI97:
	sub	sp, sp, #8
.LCFI98:
	add	r7, sp, #0
.LCFI99:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1342 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L164
	.loc 1 1344 0
	ldr	r3, .L167
	ldr	r2, .L167
	ldr	r1, [r2, #16]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 1350 0
	b	.L166
.L164:
	.loc 1 1348 0
	ldr	r3, .L167
	ldr	r2, .L167
	ldr	r2, [r2, #16]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #16]
.L166:
	.loc 1 1350 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L168:
	.align	2
.L167:
	.word	1073876992
.LFE65:
	.size	RCC_APB1PeriphResetCmd, .-RCC_APB1PeriphResetCmd
	.section	.text.RCC_ITConfig,"ax",%progbits
	.align	2
	.global	RCC_ITConfig
	.code	16
	.thumb_func
	.type	RCC_ITConfig, %function
RCC_ITConfig:
.LFB66:
	.loc 1 1388 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI100:
	sub	sp, sp, #8
.LCFI101:
	add	r7, sp, #0
.LCFI102:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 1393 0
	adds	r3, r7, #6
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L170
	.loc 1 1396 0
	ldr	r1, .L173
	ldr	r3, .L173
	ldrb	r3, [r3]
	uxtb	r2, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	orrs	r3, r2
	uxtb	r3, r3
	strb	r3, [r1]
	.loc 1 1403 0
	b	.L172
.L170:
	.loc 1 1401 0
	ldr	r1, .L173
	ldr	r3, .L173
	ldrb	r3, [r3]
	uxtb	r3, r3
	adds	r2, r7, #7
	ldrb	r2, [r2]
	mvns	r2, r2
	uxtb	r2, r2
	ands	r3, r2
	uxtb	r3, r3
	strb	r3, [r1]
.L172:
	.loc 1 1403 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L174:
	.align	2
.L173:
	.word	1073877001
.LFE66:
	.size	RCC_ITConfig, .-RCC_ITConfig
	.section	.text.RCC_GetFlagStatus,"ax",%progbits
	.align	2
	.global	RCC_GetFlagStatus
	.code	16
	.thumb_func
	.type	RCC_GetFlagStatus, %function
RCC_GetFlagStatus:
.LFB67:
	.loc 1 1426 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI103:
	sub	sp, sp, #24
.LCFI104:
	add	r7, sp, #0
.LCFI105:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1427 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1428 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 1429 0
	movs	r3, #19
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1435 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsrs	r3, r3, #5
	uxtb	r3, r3
	str	r3, [r7, #12]
	.loc 1 1437 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L176
	.loc 1 1439 0
	ldr	r3, .L183
	ldr	r3, [r3]
	str	r3, [r7, #20]
	b	.L177
.L176:
	.loc 1 1441 0
	ldr	r3, [r7, #12]
	cmp	r3, #1
	bne	.L178
	.loc 1 1443 0
	ldr	r3, .L183
	ldr	r3, [r3, #32]
	str	r3, [r7, #20]
	b	.L177
.L178:
	.loc 1 1445 0
	ldr	r3, [r7, #12]
	cmp	r3, #2
	bne	.L179
	.loc 1 1447 0
	ldr	r3, .L183
	ldr	r3, [r3, #36]
	str	r3, [r7, #20]
	b	.L177
.L179:
	.loc 1 1451 0
	ldr	r3, .L183
	ldr	r3, [r3, #52]
	str	r3, [r7, #20]
.L177:
	.loc 1 1455 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #31
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 1457 0
	movs	r2, #1
	ldr	r3, [r7, #12]
	lsls	r2, r2, r3
	movs	r3, r2
	ldr	r2, [r7, #20]
	ands	r3, r2
	beq	.L180
	.loc 1 1459 0
	movs	r3, #19
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L181
.L180:
	.loc 1 1463 0
	movs	r3, #19
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L181:
	.loc 1 1466 0
	movs	r3, #19
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1467 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L184:
	.align	2
.L183:
	.word	1073876992
.LFE67:
	.size	RCC_GetFlagStatus, .-RCC_GetFlagStatus
	.section	.text.RCC_ClearFlag,"ax",%progbits
	.align	2
	.global	RCC_ClearFlag
	.code	16
	.thumb_func
	.type	RCC_ClearFlag, %function
RCC_ClearFlag:
.LFB68:
	.loc 1 1478 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI106:
	add	r7, sp, #0
.LCFI107:
	.loc 1 1480 0
	ldr	r3, .L186
	ldr	r2, .L186
	ldr	r2, [r2, #36]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3, #36]
	.loc 1 1481 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L187:
	.align	2
.L186:
	.word	1073876992
.LFE68:
	.size	RCC_ClearFlag, .-RCC_ClearFlag
	.section	.text.RCC_GetITStatus,"ax",%progbits
	.align	2
	.global	RCC_GetITStatus
	.code	16
	.thumb_func
	.type	RCC_GetITStatus, %function
RCC_GetITStatus:
.LFB69:
	.loc 1 1497 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI108:
	sub	sp, sp, #16
.LCFI109:
	add	r7, sp, #0
.LCFI110:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1498 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1504 0
	ldr	r3, .L192
	ldr	r3, [r3, #8]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	ands	r3, r2
	beq	.L189
	.loc 1 1506 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L190
.L189:
	.loc 1 1510 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L190:
	.loc 1 1513 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1514 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L193:
	.align	2
.L192:
	.word	1073876992
.LFE69:
	.size	RCC_GetITStatus, .-RCC_GetITStatus
	.section	.text.RCC_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	RCC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	RCC_ClearITPendingBit, %function
RCC_ClearITPendingBit:
.LFB70:
	.loc 1 1530 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI111:
	sub	sp, sp, #8
.LCFI112:
	add	r7, sp, #0
.LCFI113:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1536 0
	ldr	r2, .L195
	adds	r3, r7, #7
	ldrb	r3, [r3]
	strb	r3, [r2]
	.loc 1 1537 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L196:
	.align	2
.L195:
	.word	1073877002
.LFE70:
	.size	RCC_ClearITPendingBit, .-RCC_ClearITPendingBit
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
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
	.uleb128 0x18
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x18
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
	.4byte	.LCFI52-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
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
	.4byte	.LCFI55-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
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
	.4byte	.LCFI58-.LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
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
	.4byte	.LCFI61-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
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
	.4byte	.LCFI64-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
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
	.4byte	.LCFI67-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0x10
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
	.uleb128 0x28
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI90-.LCFI89
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
	.4byte	.LCFI91-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI93-.LCFI92
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
	.4byte	.LCFI94-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI96-.LCFI95
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
	.4byte	.LCFI97-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI98-.LCFI97
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI99-.LCFI98
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
	.4byte	.LCFI100-.LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI101-.LCFI100
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI102-.LCFI101
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
	.4byte	.LCFI103-.LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI104-.LCFI103
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI105-.LCFI104
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
	.4byte	.LCFI106-.LFB68
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.uleb128 0x18
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
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI113-.LCFI112
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE76:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x97a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0xc
	.4byte	.LASF113
	.4byte	.LASF114
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
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe4
	.4byte	0xf6
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x3
	.byte	0xe4
	.4byte	0xdd
	.uleb128 0x5
	.4byte	0x2c
	.uleb128 0x9
	.byte	0x38
	.byte	0x3
	.2byte	0x1d8
	.4byte	0x1c5
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x1da
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1db
	.4byte	0x85
	.byte	0x4
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x3
	.2byte	0x1dc
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1dd
	.4byte	0x85
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x1de
	.4byte	0x85
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1df
	.4byte	0x85
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1e0
	.4byte	0x85
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x1e1
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x1e2
	.4byte	0x85
	.byte	0x20
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x1e3
	.4byte	0x85
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x1e4
	.4byte	0x85
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x1e5
	.4byte	0x85
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x1e6
	.4byte	0x85
	.byte	0x30
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x1e7
	.4byte	0x85
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1e8
	.4byte	0x106
	.uleb128 0xd
	.byte	0x1c
	.byte	0x4
	.byte	0x32
	.4byte	0x22e
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x4
	.byte	0x34
	.4byte	0x5e
	.byte	0
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x4
	.byte	0x35
	.4byte	0x5e
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x4
	.byte	0x36
	.4byte	0x5e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x4
	.byte	0x37
	.4byte	0x5e
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x4
	.byte	0x38
	.4byte	0x5e
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x4
	.byte	0x39
	.4byte	0x5e
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x4
	.byte	0x3a
	.4byte	0x5e
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x4
	.byte	0x3b
	.4byte	0x1d1
	.uleb128 0xf
	.4byte	.LASF107
	.byte	0x1
	.byte	0x92
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF42
	.byte	0x1
	.byte	0xc4
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26e
	.uleb128 0x11
	.4byte	.LASF44
	.byte	0x1
	.byte	0xc4
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x12
	.4byte	.LASF102
	.byte	0x1
	.byte	0xde
	.4byte	0xf6
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b2
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.byte	0xe0
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x1
	.byte	0xe1
	.4byte	0xf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x1
	.byte	0xe2
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x100
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e7
	.uleb128 0x15
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x100
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x102
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x122
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30d
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x122
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x13c
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x342
	.uleb128 0x15
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x13c
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x13e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x15b
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x368
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x15b
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x170
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38e
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x170
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x190
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b4
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x190
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x1aa
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3da
	.uleb128 0x15
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x1aa
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x1c2
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x400
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1c2
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x1e1
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x435
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x1f9
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45b
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1f9
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x20f
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x490
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x20f
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x211
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x22a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b6
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x22a
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x248
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4dc
	.uleb128 0x15
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x248
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x2b1
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x511
	.uleb128 0x15
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x2b1
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x2b3
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x2cd
	.4byte	0x2c
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x2e2
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55c
	.uleb128 0x15
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x2e2
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x2e4
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x301
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x591
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x301
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x303
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x31e
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b7
	.uleb128 0x15
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x31e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x337
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5dd
	.uleb128 0x15
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x337
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x34b
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x603
	.uleb128 0x15
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x34b
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x361
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x629
	.uleb128 0x15
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x361
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x390
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x69a
	.uleb128 0x15
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x390
	.4byte	0x69a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x19
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0x22e
	.uleb128 0x14
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x43e
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c6
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x43e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x44f
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ec
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x44f
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x466
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x712
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x466
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x48a
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x747
	.uleb128 0x15
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x48a
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x48a
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x4ae
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x77c
	.uleb128 0x15
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x4ae
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x4ae
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x4d5
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b1
	.uleb128 0x15
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x4d5
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x4f3
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7e6
	.uleb128 0x15
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x4f3
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x4f3
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x514
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x81b
	.uleb128 0x15
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x514
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x514
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x538
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x850
	.uleb128 0x15
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x538
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x538
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x56b
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x885
	.uleb128 0x15
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x56b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x56b
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x591
	.4byte	0xa3
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8dc
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x591
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x19
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x593
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x594
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x595
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x5c5
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x5d8
	.4byte	0xae
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x927
	.uleb128 0x15
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x5d8
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x5da
	.4byte	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x5f9
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94d
	.uleb128 0x15
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x5f9
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1d
	.4byte	0x95d
	.4byte	0x95d
	.uleb128 0x1e
	.4byte	0x7e
	.byte	0xf
	.byte	0
	.uleb128 0x1f
	.4byte	0x101
	.uleb128 0x13
	.4byte	.LASF111
	.byte	0x1
	.byte	0x5a
	.4byte	0x978
	.uleb128 0x5
	.byte	0x3
	.4byte	APBAHBPrescTable
	.uleb128 0x5
	.4byte	0x94d
	.uleb128 0x1f
	.4byte	0x973
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x16
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x3c2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x97e
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xc5
	.ascii	"DISABLE\000"
	.4byte	0xcb
	.ascii	"ENABLE\000"
	.4byte	0xe9
	.ascii	"ERROR\000"
	.4byte	0xef
	.ascii	"SUCCESS\000"
	.4byte	0x239
	.ascii	"RCC_DeInit\000"
	.4byte	0x24a
	.ascii	"RCC_HSEConfig\000"
	.4byte	0x26e
	.ascii	"RCC_WaitForHSEStartUp\000"
	.4byte	0x2b2
	.ascii	"RCC_AdjustHSICalibrationValue\000"
	.4byte	0x2e7
	.ascii	"RCC_HSICmd\000"
	.4byte	0x30d
	.ascii	"RCC_AdjustHSI14CalibrationValue\000"
	.4byte	0x342
	.ascii	"RCC_HSI14Cmd\000"
	.4byte	0x368
	.ascii	"RCC_HSI14ADCRequestCmd\000"
	.4byte	0x38e
	.ascii	"RCC_LSEConfig\000"
	.4byte	0x3b4
	.ascii	"RCC_LSEDriveConfig\000"
	.4byte	0x3da
	.ascii	"RCC_LSICmd\000"
	.4byte	0x400
	.ascii	"RCC_PLLConfig\000"
	.4byte	0x435
	.ascii	"RCC_PLLCmd\000"
	.4byte	0x45b
	.ascii	"RCC_PREDIV1Config\000"
	.4byte	0x490
	.ascii	"RCC_ClockSecuritySystemCmd\000"
	.4byte	0x4b6
	.ascii	"RCC_MCOConfig\000"
	.4byte	0x4dc
	.ascii	"RCC_SYSCLKConfig\000"
	.4byte	0x511
	.ascii	"RCC_GetSYSCLKSource\000"
	.4byte	0x527
	.ascii	"RCC_HCLKConfig\000"
	.4byte	0x55c
	.ascii	"RCC_PCLKConfig\000"
	.4byte	0x591
	.ascii	"RCC_ADCCLKConfig\000"
	.4byte	0x5b7
	.ascii	"RCC_CECCLKConfig\000"
	.4byte	0x5dd
	.ascii	"RCC_I2CCLKConfig\000"
	.4byte	0x603
	.ascii	"RCC_USARTCLKConfig\000"
	.4byte	0x629
	.ascii	"RCC_GetClocksFreq\000"
	.4byte	0x6a0
	.ascii	"RCC_RTCCLKConfig\000"
	.4byte	0x6c6
	.ascii	"RCC_RTCCLKCmd\000"
	.4byte	0x6ec
	.ascii	"RCC_BackupResetCmd\000"
	.4byte	0x712
	.ascii	"RCC_AHBPeriphClockCmd\000"
	.4byte	0x747
	.ascii	"RCC_APB2PeriphClockCmd\000"
	.4byte	0x77c
	.ascii	"RCC_APB1PeriphClockCmd\000"
	.4byte	0x7b1
	.ascii	"RCC_AHBPeriphResetCmd\000"
	.4byte	0x7e6
	.ascii	"RCC_APB2PeriphResetCmd\000"
	.4byte	0x81b
	.ascii	"RCC_APB1PeriphResetCmd\000"
	.4byte	0x850
	.ascii	"RCC_ITConfig\000"
	.4byte	0x885
	.ascii	"RCC_GetFlagStatus\000"
	.4byte	0x8dc
	.ascii	"RCC_ClearFlag\000"
	.4byte	0x8ee
	.ascii	"RCC_GetITStatus\000"
	.4byte	0x927
	.ascii	"RCC_ClearITPendingBit\000"
	.4byte	0x962
	.ascii	"APBAHBPrescTable\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x134
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x97e
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
	.4byte	0xf6
	.ascii	"ErrorStatus\000"
	.4byte	0x1c5
	.ascii	"RCC_TypeDef\000"
	.4byte	0x22e
	.ascii	"RCC_ClocksTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x14c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"CFGR2\000"
.LASF75:
	.ascii	"RCC_CECCLKConfig\000"
.LASF29:
	.ascii	"CFGR3\000"
.LASF79:
	.ascii	"RCC_USARTCLKConfig\000"
.LASF72:
	.ascii	"RCC_HCLK\000"
.LASF73:
	.ascii	"RCC_ADCCLKConfig\000"
.LASF63:
	.ascii	"RCC_PREDIV1_Div\000"
.LASF110:
	.ascii	"RCC_ClearITPendingBit\000"
.LASF37:
	.ascii	"USART1CLK_Frequency\000"
.LASF76:
	.ascii	"RCC_CECCLK\000"
.LASF54:
	.ascii	"RCC_LSE\000"
.LASF80:
	.ascii	"RCC_USARTCLK\000"
.LASF109:
	.ascii	"RCC_GetITStatus\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF26:
	.ascii	"BDCR\000"
.LASF94:
	.ascii	"RCC_APB2Periph\000"
.LASF51:
	.ascii	"RCC_HSI14Cmd\000"
.LASF113:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_rcc.c\000"
.LASF8:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"APB1RSTR\000"
.LASF61:
	.ascii	"RCC_PLLCmd\000"
.LASF38:
	.ascii	"RCC_ClocksTypeDef\000"
.LASF62:
	.ascii	"RCC_PREDIV1Config\000"
.LASF91:
	.ascii	"RCC_AHBPeriphClockCmd\000"
.LASF20:
	.ascii	"CFGR\000"
.LASF97:
	.ascii	"RCC_AHBPeriphResetCmd\000"
.LASF32:
	.ascii	"HCLK_Frequency\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF74:
	.ascii	"RCC_ADCCLK\000"
.LASF25:
	.ascii	"APB1ENR\000"
.LASF86:
	.ascii	"presc\000"
.LASF48:
	.ascii	"NewState\000"
.LASF65:
	.ascii	"RCC_MCOConfig\000"
.LASF107:
	.ascii	"RCC_DeInit\000"
.LASF102:
	.ascii	"RCC_WaitForHSEStartUp\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF2:
	.ascii	"short int\000"
.LASF88:
	.ascii	"RCC_RTCCLKSource\000"
.LASF114:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF27:
	.ascii	"AHBRSTR\000"
.LASF18:
	.ascii	"SUCCESS\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF99:
	.ascii	"RCC_APB1PeriphResetCmd\000"
.LASF58:
	.ascii	"RCC_PLLConfig\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF19:
	.ascii	"ErrorStatus\000"
.LASF78:
	.ascii	"RCC_I2CCLK\000"
.LASF83:
	.ascii	"pllmull\000"
.LASF57:
	.ascii	"RCC_LSICmd\000"
.LASF115:
	.ascii	"RCC_GetSYSCLKSource\000"
.LASF21:
	.ascii	"APB2RSTR\000"
.LASF17:
	.ascii	"ERROR\000"
.LASF84:
	.ascii	"pllsource\000"
.LASF23:
	.ascii	"AHBENR\000"
.LASF103:
	.ascii	"RCC_GetFlagStatus\000"
.LASF46:
	.ascii	"tmpreg\000"
.LASF106:
	.ascii	"bitstatus\000"
.LASF33:
	.ascii	"PCLK_Frequency\000"
.LASF105:
	.ascii	"statusreg\000"
.LASF35:
	.ascii	"CECCLK_Frequency\000"
.LASF95:
	.ascii	"RCC_APB1PeriphClockCmd\000"
.LASF66:
	.ascii	"RCC_MCOSource\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"APB2ENR\000"
.LASF39:
	.ascii	"StartUpCounter\000"
.LASF0:
	.ascii	"signed char\000"
.LASF90:
	.ascii	"RCC_BackupResetCmd\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF104:
	.ascii	"RCC_FLAG\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF59:
	.ascii	"RCC_PLLSource\000"
.LASF67:
	.ascii	"RCC_SYSCLKConfig\000"
.LASF77:
	.ascii	"RCC_I2CCLKConfig\000"
.LASF87:
	.ascii	"RCC_RTCCLKConfig\000"
.LASF98:
	.ascii	"RCC_APB2PeriphResetCmd\000"
.LASF108:
	.ascii	"RCC_ClearFlag\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF40:
	.ascii	"status\000"
.LASF70:
	.ascii	"RCC_SYSCLK\000"
.LASF41:
	.ascii	"HSEStatus\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF52:
	.ascii	"RCC_HSI14ADCRequestCmd\000"
.LASF60:
	.ascii	"RCC_PLLMul\000"
.LASF34:
	.ascii	"ADCCLK_Frequency\000"
.LASF42:
	.ascii	"RCC_HSEConfig\000"
.LASF30:
	.ascii	"RCC_TypeDef\000"
.LASF31:
	.ascii	"SYSCLK_Frequency\000"
.LASF82:
	.ascii	"RCC_Clocks\000"
.LASF49:
	.ascii	"RCC_AdjustHSI14CalibrationValue\000"
.LASF11:
	.ascii	"RESET\000"
.LASF89:
	.ascii	"RCC_RTCCLKCmd\000"
.LASF100:
	.ascii	"RCC_ITConfig\000"
.LASF93:
	.ascii	"RCC_APB2PeriphClockCmd\000"
.LASF44:
	.ascii	"RCC_HSE\000"
.LASF50:
	.ascii	"HSI14CalibrationValue\000"
.LASF68:
	.ascii	"RCC_SYSCLKSource\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF36:
	.ascii	"I2C1CLK_Frequency\000"
.LASF56:
	.ascii	"RCC_LSEDrive\000"
.LASF53:
	.ascii	"RCC_LSEConfig\000"
.LASF111:
	.ascii	"APBAHBPrescTable\000"
.LASF45:
	.ascii	"HSICalibrationValue\000"
.LASF81:
	.ascii	"RCC_GetClocksFreq\000"
.LASF85:
	.ascii	"prediv1factor\000"
.LASF112:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF64:
	.ascii	"RCC_ClockSecuritySystemCmd\000"
.LASF69:
	.ascii	"RCC_HCLKConfig\000"
.LASF47:
	.ascii	"RCC_HSICmd\000"
.LASF71:
	.ascii	"RCC_PCLKConfig\000"
.LASF101:
	.ascii	"RCC_IT\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF43:
	.ascii	"RCC_AdjustHSICalibrationValue\000"
.LASF92:
	.ascii	"RCC_AHBPeriph\000"
.LASF55:
	.ascii	"RCC_LSEDriveConfig\000"
.LASF96:
	.ascii	"RCC_APB1Periph\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
