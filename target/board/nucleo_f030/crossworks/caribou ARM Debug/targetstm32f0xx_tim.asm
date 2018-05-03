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
	.file	"stm32f0xx_tim.c"
	.text
.Ltext0:
	.section	.text.TIM_DeInit,"ax",%progbits
	.align	2
	.global	TIM_DeInit
	.code	16
	.thumb_func
	.type	TIM_DeInit, %function
TIM_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_tim.c"
	.loc 1 192 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 196 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11
	cmp	r3, r2
	bne	.L2
	.loc 1 198 0
	movs	r3, #128
	lsls	r3, r3, #4
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 199 0
	movs	r3, #128
	lsls	r3, r3, #4
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L2:
	.loc 1 201 0
	ldr	r2, [r7, #4]
	movs	r3, #128
	lsls	r3, r3, #23
	cmp	r2, r3
	bne	.L4
	.loc 1 203 0
	movs	r1, #1
	movs	r0, #1
	bl	RCC_APB1PeriphResetCmd
	.loc 1 204 0
	movs	r1, #0
	movs	r0, #1
	bl	RCC_APB1PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L4:
	.loc 1 206 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11+4
	cmp	r3, r2
	bne	.L5
	.loc 1 208 0
	movs	r1, #1
	movs	r0, #2
	bl	RCC_APB1PeriphResetCmd
	.loc 1 209 0
	movs	r1, #0
	movs	r0, #2
	bl	RCC_APB1PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L5:
	.loc 1 211 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11+8
	cmp	r3, r2
	bne	.L6
	.loc 1 213 0
	movs	r1, #1
	movs	r0, #16
	bl	RCC_APB1PeriphResetCmd
	.loc 1 214 0
	movs	r1, #0
	movs	r0, #16
	bl	RCC_APB1PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L6:
	.loc 1 216 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11+12
	cmp	r3, r2
	bne	.L7
	.loc 1 218 0
	movs	r3, #128
	lsls	r3, r3, #1
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 219 0
	movs	r3, #128
	lsls	r3, r3, #1
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L7:
	.loc 1 221 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11+16
	cmp	r3, r2
	bne	.L8
	.loc 1 223 0
	movs	r3, #128
	lsls	r3, r3, #9
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 224 0
	movs	r3, #128
	lsls	r3, r3, #9
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L8:
	.loc 1 226 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11+20
	cmp	r3, r2
	bne	.L9
	.loc 1 228 0
	movs	r3, #128
	lsls	r3, r3, #10
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 229 0
	movs	r3, #128
	lsls	r3, r3, #10
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 240 0
	b	.L10
.L9:
	.loc 1 233 0
	ldr	r3, [r7, #4]
	ldr	r2, .L11+24
	cmp	r3, r2
	bne	.L10
	.loc 1 235 0
	movs	r3, #128
	lsls	r3, r3, #11
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 236 0
	movs	r3, #128
	lsls	r3, r3, #11
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
.L10:
	.loc 1 240 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	1073818624
	.word	1073742848
	.word	1073745920
	.word	1073750016
	.word	1073823744
	.word	1073824768
	.word	1073825792
.LFE32:
	.size	TIM_DeInit, .-TIM_DeInit
	.section	.text.TIM_TimeBaseInit,"ax",%progbits
	.align	2
	.global	TIM_TimeBaseInit
	.code	16
	.thumb_func
	.type	TIM_TimeBaseInit, %function
TIM_TimeBaseInit:
.LFB33:
	.loc 1 253 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 254 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 261 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 263 0
	ldr	r3, [r7, #4]
	ldr	r2, .L19
	cmp	r3, r2
	beq	.L14
	.loc 1 263 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #4]
	movs	r3, #128
	lsls	r3, r3, #23
	cmp	r2, r3
	beq	.L14
	.loc 1 263 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r2, .L19+4
	cmp	r3, r2
	bne	.L15
.L14:
	.loc 1 266 0 is_stmt 1
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 267 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
.L15:
	.loc 1 270 0
	ldr	r3, [r7, #4]
	ldr	r2, .L19+8
	cmp	r3, r2
	beq	.L16
	.loc 1 273 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L19+12
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 274 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #8]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
.L16:
	.loc 1 277 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 280 0
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #44]
	.loc 1 283 0
	ldr	r3, [r7]
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	strh	r2, [r3, #40]
	.loc 1 285 0
	ldr	r3, [r7, #4]
	ldr	r2, .L19
	cmp	r3, r2
	beq	.L17
	.loc 1 285 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, .L19+16
	cmp	r3, r2
	beq	.L17
	.loc 1 285 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r2, .L19+20
	cmp	r3, r2
	beq	.L17
	.loc 1 285 0 discriminator 3
	ldr	r3, [r7, #4]
	ldr	r2, .L19+24
	cmp	r3, r2
	bne	.L18
.L17:
	.loc 1 288 0 is_stmt 1
	ldr	r3, [r7]
	ldrb	r3, [r3, #10]
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #48]
.L18:
	.loc 1 293 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strh	r2, [r3, #20]
	.loc 1 294 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073818624
	.word	1073742848
	.word	1073745920
	.word	-769
	.word	1073823744
	.word	1073824768
	.word	1073825792
.LFE33:
	.size	TIM_TimeBaseInit, .-TIM_TimeBaseInit
	.section	.text.TIM_TimeBaseStructInit,"ax",%progbits
	.align	2
	.global	TIM_TimeBaseStructInit
	.code	16
	.thumb_func
	.type	TIM_TimeBaseStructInit, %function
TIM_TimeBaseStructInit:
.LFB34:
	.loc 1 303 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 305 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	rsbs	r2, r2, #0
	str	r2, [r3, #4]
	.loc 1 306 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 307 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #8]
	.loc 1 308 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #2]
	.loc 1 309 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #10]
	.loc 1 310 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	TIM_TimeBaseStructInit, .-TIM_TimeBaseStructInit
	.section	.text.TIM_PrescalerConfig,"ax",%progbits
	.align	2
	.global	TIM_PrescalerConfig
	.code	16
	.thumb_func
	.type	TIM_PrescalerConfig, %function
TIM_PrescalerConfig:
.LFB35:
	.loc 1 323 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, r7
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 329 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #40]
	.loc 1 331 0
	ldr	r3, [r7, #4]
	movs	r2, r7
	ldrh	r2, [r2]
	strh	r2, [r3, #20]
	.loc 1 332 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	TIM_PrescalerConfig, .-TIM_PrescalerConfig
	.section	.text.TIM_CounterModeConfig,"ax",%progbits
	.align	2
	.global	TIM_CounterModeConfig
	.code	16
	.thumb_func
	.type	TIM_CounterModeConfig, %function
TIM_CounterModeConfig:
.LFB36:
	.loc 1 347 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 348 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 354 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 356 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 358 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 360 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 361 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	TIM_CounterModeConfig, .-TIM_CounterModeConfig
	.section	.text.TIM_SetCounter,"ax",%progbits
	.align	2
	.global	TIM_SetCounter
	.code	16
	.thumb_func
	.type	TIM_SetCounter, %function
TIM_SetCounter:
.LFB37:
	.loc 1 371 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 376 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #36]
	.loc 1 377 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	TIM_SetCounter, .-TIM_SetCounter
	.section	.text.TIM_SetAutoreload,"ax",%progbits
	.align	2
	.global	TIM_SetAutoreload
	.code	16
	.thumb_func
	.type	TIM_SetAutoreload, %function
TIM_SetAutoreload:
.LFB38:
	.loc 1 386 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #8
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 391 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #44]
	.loc 1 392 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	TIM_SetAutoreload, .-TIM_SetAutoreload
	.section	.text.TIM_GetCounter,"ax",%progbits
	.align	2
	.global	TIM_GetCounter
	.code	16
	.thumb_func
	.type	TIM_GetCounter, %function
TIM_GetCounter:
.LFB39:
	.loc 1 401 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 406 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	.loc 1 407 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	TIM_GetCounter, .-TIM_GetCounter
	.section	.text.TIM_GetPrescaler,"ax",%progbits
	.align	2
	.global	TIM_GetPrescaler
	.code	16
	.thumb_func
	.type	TIM_GetPrescaler, %function
TIM_GetPrescaler:
.LFB40:
	.loc 1 416 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	.loc 1 421 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #40]
	uxth	r3, r3
	.loc 1 422 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE40:
	.size	TIM_GetPrescaler, .-TIM_GetPrescaler
	.section	.text.TIM_UpdateDisableConfig,"ax",%progbits
	.align	2
	.global	TIM_UpdateDisableConfig
	.code	16
	.thumb_func
	.type	TIM_UpdateDisableConfig, %function
TIM_UpdateDisableConfig:
.LFB41:
	.loc 1 433 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #8
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 438 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L31
	.loc 1 441 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #2
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 448 0
	b	.L33
.L31:
	.loc 1 446 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #2
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L33:
	.loc 1 448 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	TIM_UpdateDisableConfig, .-TIM_UpdateDisableConfig
	.section	.text.TIM_UpdateRequestConfig,"ax",%progbits
	.align	2
	.global	TIM_UpdateRequestConfig
	.code	16
	.thumb_func
	.type	TIM_UpdateRequestConfig, %function
TIM_UpdateRequestConfig:
.LFB42:
	.loc 1 463 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #8
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 468 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L35
	.loc 1 471 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #4
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 478 0
	b	.L37
.L35:
	.loc 1 476 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #4
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L37:
	.loc 1 478 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE42:
	.size	TIM_UpdateRequestConfig, .-TIM_UpdateRequestConfig
	.section	.text.TIM_ARRPreloadConfig,"ax",%progbits
	.align	2
	.global	TIM_ARRPreloadConfig
	.code	16
	.thumb_func
	.type	TIM_ARRPreloadConfig, %function
TIM_ARRPreloadConfig:
.LFB43:
	.loc 1 489 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #8
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 494 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L39
	.loc 1 497 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #128
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 504 0
	b	.L41
.L39:
	.loc 1 502 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #128
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L41:
	.loc 1 504 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE43:
	.size	TIM_ARRPreloadConfig, .-TIM_ARRPreloadConfig
	.section	.text.TIM_SelectOnePulseMode,"ax",%progbits
	.align	2
	.global	TIM_SelectOnePulseMode
	.code	16
	.thumb_func
	.type	TIM_SelectOnePulseMode, %function
TIM_SelectOnePulseMode:
.LFB44:
	.loc 1 517 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #8
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 523 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #8
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 525 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 526 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE44:
	.size	TIM_SelectOnePulseMode, .-TIM_SelectOnePulseMode
	.section	.text.TIM_SetClockDivision,"ax",%progbits
	.align	2
	.global	TIM_SetClockDivision
	.code	16
	.thumb_func
	.type	TIM_SetClockDivision, %function
TIM_SetClockDivision:
.LFB45:
	.loc 1 539 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #8
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 545 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	ldr	r2, .L44
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 547 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 548 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
	.word	-769
.LFE45:
	.size	TIM_SetClockDivision, .-TIM_SetClockDivision
	.section	.text.TIM_Cmd,"ax",%progbits
	.align	2
	.global	TIM_Cmd
	.code	16
	.thumb_func
	.type	TIM_Cmd, %function
TIM_Cmd:
.LFB46:
	.loc 1 559 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #8
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 564 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L47
	.loc 1 567 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #1
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 574 0
	b	.L49
.L47:
	.loc 1 572 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #1
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L49:
	.loc 1 574 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE46:
	.size	TIM_Cmd, .-TIM_Cmd
	.section	.text.TIM_BDTRConfig,"ax",%progbits
	.align	2
	.global	TIM_BDTRConfig
	.code	16
	.thumb_func
	.type	TIM_BDTRConfig, %function
TIM_BDTRConfig:
.LFB47:
	.loc 1 617 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI45:
	sub	sp, sp, #8
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 628 0
	ldr	r3, [r7]
	ldrh	r2, [r3]
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 629 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	.loc 1 628 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 629 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #6]
	.loc 1 628 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 630 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	.loc 1 628 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 630 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #10]
	.loc 1 628 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 631 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #12]
	.loc 1 628 0
	orrs	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #4]
	movs	r2, #68
	strh	r1, [r3, r2]
	.loc 1 632 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE47:
	.size	TIM_BDTRConfig, .-TIM_BDTRConfig
	.section	.text.TIM_BDTRStructInit,"ax",%progbits
	.align	2
	.global	TIM_BDTRStructInit
	.code	16
	.thumb_func
	.type	TIM_BDTRStructInit, %function
TIM_BDTRStructInit:
.LFB48:
	.loc 1 641 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #8
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	.loc 1 643 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 644 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #2]
	.loc 1 645 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 646 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #6]
	.loc 1 647 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #8]
	.loc 1 648 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #10]
	.loc 1 649 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #12]
	.loc 1 650 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE48:
	.size	TIM_BDTRStructInit, .-TIM_BDTRStructInit
	.section	.text.TIM_CtrlPWMOutputs,"ax",%progbits
	.align	2
	.global	TIM_CtrlPWMOutputs
	.code	16
	.thumb_func
	.type	TIM_CtrlPWMOutputs, %function
TIM_CtrlPWMOutputs:
.LFB49:
	.loc 1 660 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #8
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 664 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L53
	.loc 1 667 0
	ldr	r3, [r7, #4]
	movs	r2, #68
	ldrh	r3, [r3, r2]
	uxth	r3, r3
	ldr	r2, .L56
	orrs	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #4]
	movs	r2, #68
	strh	r1, [r3, r2]
	.loc 1 674 0
	b	.L55
.L53:
	.loc 1 672 0
	ldr	r3, [r7, #4]
	movs	r2, #68
	ldrh	r3, [r3, r2]
	uxth	r3, r3
	lsls	r3, r3, #17
	lsrs	r3, r3, #17
	uxth	r1, r3
	ldr	r3, [r7, #4]
	movs	r2, #68
	strh	r1, [r3, r2]
.L55:
	.loc 1 674 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L57:
	.align	2
.L56:
	.word	-32768
.LFE49:
	.size	TIM_CtrlPWMOutputs, .-TIM_CtrlPWMOutputs
	.section	.text.TIM_OC1Init,"ax",%progbits
	.align	2
	.global	TIM_OC1Init
	.code	16
	.thumb_func
	.type	TIM_OC1Init, %function
TIM_OC1Init:
.LFB50:
	.loc 1 732 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #16
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 733 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 741 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #1
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 743 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 745 0
	movs	r3, #12
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 748 0
	movs	r3, #10
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 751 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 752 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #3
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 755 0
	ldr	r3, [r7]
	ldrh	r1, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 758 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #2
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 760 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #12]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 763 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 765 0
	ldr	r3, [r7, #4]
	ldr	r2, .L61
	cmp	r3, r2
	beq	.L59
	.loc 1 765 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, .L61+4
	cmp	r3, r2
	beq	.L59
	.loc 1 765 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r2, .L61+8
	cmp	r3, r2
	beq	.L59
	.loc 1 765 0 discriminator 3
	ldr	r3, [r7, #4]
	ldr	r2, .L61+12
	cmp	r3, r2
	bne	.L60
.L59:
	.loc 1 773 0 is_stmt 1
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #8
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 775 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #14]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 778 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #4
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 780 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #4]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 783 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L61+16
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 784 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L61+20
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 787 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #16]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 789 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #18]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
.L60:
	.loc 1 792 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 795 0
	ldr	r3, [r7, #4]
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 798 0
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #52]
	.loc 1 801 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 802 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L62:
	.align	2
.L61:
	.word	1073818624
	.word	1073823744
	.word	1073824768
	.word	1073825792
	.word	-257
	.word	-513
.LFE50:
	.size	TIM_OC1Init, .-TIM_OC1Init
	.section	.text.TIM_OC2Init,"ax",%progbits
	.align	2
	.global	TIM_OC2Init
	.code	16
	.thumb_func
	.type	TIM_OC2Init, %function
TIM_OC2Init:
.LFB51:
	.loc 1 814 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI57:
	sub	sp, sp, #16
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 815 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 823 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #16
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 826 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 828 0
	movs	r3, #12
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 831 0
	movs	r3, #10
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 834 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L65
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 835 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L65+4
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 838 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 841 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #32
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 843 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 846 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 848 0
	ldr	r3, [r7, #4]
	ldr	r2, .L65+8
	cmp	r3, r2
	bne	.L64
	.loc 1 856 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #128
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 858 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #14]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 861 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #64
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 863 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 866 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L65+12
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 867 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L65+16
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 870 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #16]
	lsls	r3, r3, #2
	uxth	r1, r3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 872 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #18]
	lsls	r3, r3, #2
	uxth	r1, r3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
.L64:
	.loc 1 875 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 878 0
	ldr	r3, [r7, #4]
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 881 0
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #56]
	.loc 1 884 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 885 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L66:
	.align	2
.L65:
	.word	-28673
	.word	-769
	.word	1073818624
	.word	-1025
	.word	-2049
.LFE51:
	.size	TIM_OC2Init, .-TIM_OC2Init
	.section	.text.TIM_OC3Init,"ax",%progbits
	.align	2
	.global	TIM_OC3Init
	.code	16
	.thumb_func
	.type	TIM_OC3Init, %function
TIM_OC3Init:
.LFB52:
	.loc 1 897 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	sub	sp, sp, #16
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 898 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 906 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	ldr	r2, .L69
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 909 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 911 0
	movs	r3, #12
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 914 0
	movs	r3, #10
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 917 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 918 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #3
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 920 0
	ldr	r3, [r7]
	ldrh	r1, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 923 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L69+4
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 925 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 928 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 930 0
	ldr	r3, [r7, #4]
	ldr	r2, .L69+8
	cmp	r3, r2
	bne	.L68
	.loc 1 938 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L69+12
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 940 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #14]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 942 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L69+16
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 945 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 947 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L69+20
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 948 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L69+24
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 950 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #16]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 952 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #18]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
.L68:
	.loc 1 955 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 958 0
	ldr	r3, [r7, #4]
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 961 0
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #60]
	.loc 1 964 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 965 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L70:
	.align	2
.L69:
	.word	-257
	.word	-513
	.word	1073818624
	.word	-2049
	.word	-1025
	.word	-4097
	.word	-8193
.LFE52:
	.size	TIM_OC3Init, .-TIM_OC3Init
	.section	.text.TIM_OC4Init,"ax",%progbits
	.align	2
	.global	TIM_OC4Init
	.code	16
	.thumb_func
	.type	TIM_OC4Init, %function
TIM_OC4Init:
.LFB53:
	.loc 1 977 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI63:
	sub	sp, sp, #16
.LCFI64:
	add	r7, sp, #0
.LCFI65:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 978 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 986 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	ldr	r2, .L73
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 989 0
	movs	r3, #10
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 991 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 994 0
	movs	r3, #12
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 997 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L73+4
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 998 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L73+8
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1001 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1004 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L73+12
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1006 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #12]
	lsls	r3, r3, #12
	uxth	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1009 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	lsls	r3, r3, #12
	uxth	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1011 0
	ldr	r3, [r7, #4]
	ldr	r2, .L73+16
	cmp	r3, r2
	bne	.L72
	.loc 1 1015 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L73+20
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1017 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #16]
	lsls	r3, r3, #6
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
.L72:
	.loc 1 1020 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 1023 0
	ldr	r3, [r7, #4]
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1026 0
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #64]
	.loc 1 1029 0
	ldr	r3, [r7, #4]
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1030 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L74:
	.align	2
.L73:
	.word	-4097
	.word	-28673
	.word	-769
	.word	-8193
	.word	1073818624
	.word	-16385
.LFE53:
	.size	TIM_OC4Init, .-TIM_OC4Init
	.section	.text.TIM_OCStructInit,"ax",%progbits
	.align	2
	.global	TIM_OCStructInit
	.code	16
	.thumb_func
	.type	TIM_OCStructInit, %function
TIM_OCStructInit:
.LFB54:
	.loc 1 1039 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI66:
	sub	sp, sp, #8
.LCFI67:
	add	r7, sp, #0
.LCFI68:
	str	r0, [r7, #4]
	.loc 1 1041 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1042 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #2]
	.loc 1 1043 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 1044 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 1045 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #12]
	.loc 1 1046 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #14]
	.loc 1 1047 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #16]
	.loc 1 1048 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #18]
	.loc 1 1049 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE54:
	.size	TIM_OCStructInit, .-TIM_OCStructInit
	.section	.text.TIM_SelectOCxM,"ax",%progbits
	.align	2
	.global	TIM_SelectOCxM
	.code	16
	.thumb_func
	.type	TIM_SelectOCxM, %function
TIM_SelectOCxM:
.LFB55:
	.loc 1 1075 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI69:
	sub	sp, sp, #16
.LCFI70:
	add	r7, sp, #0
.LCFI71:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, r7
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 1076 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1077 0
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1083 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 1084 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #24
	str	r3, [r7, #12]
	.loc 1 1086 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, #10
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1089 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 1091 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L77
	.loc 1 1091 0 is_stmt 0 discriminator 1
	adds	r3, r7, #2
	ldrh	r3, [r3]
	cmp	r3, #8
	bne	.L78
.L77:
	.loc 1 1093 0 is_stmt 1
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsrs	r3, r3, #1
	uxth	r3, r3
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 1096 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	str	r2, [r3]
	.loc 1 1099 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r1, [r2]
	movs	r2, r7
	ldrh	r2, [r2]
	orrs	r2, r1
	str	r2, [r3]
	b	.L79
.L78:
	.loc 1 1103 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	subs	r3, r3, #4
	uxth	r3, r3
	lsrs	r3, r3, #1
	uxth	r3, r3
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 1106 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r2, [r2]
	ldr	r1, .L80
	ands	r2, r1
	str	r2, [r3]
	.loc 1 1109 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r2, [r2]
	movs	r1, r7
	ldrh	r1, [r1]
	lsls	r1, r1, #8
	uxth	r1, r1
	orrs	r2, r1
	str	r2, [r3]
.L79:
	.loc 1 1111 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L81:
	.align	2
.L80:
	.word	-28673
.LFE55:
	.size	TIM_SelectOCxM, .-TIM_SelectOCxM
	.section	.text.TIM_SetCompare1,"ax",%progbits
	.align	2
	.global	TIM_SetCompare1
	.code	16
	.thumb_func
	.type	TIM_SetCompare1, %function
TIM_SetCompare1:
.LFB56:
	.loc 1 1120 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI72:
	sub	sp, sp, #8
.LCFI73:
	add	r7, sp, #0
.LCFI74:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1125 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #52]
	.loc 1 1126 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE56:
	.size	TIM_SetCompare1, .-TIM_SetCompare1
	.section	.text.TIM_SetCompare2,"ax",%progbits
	.align	2
	.global	TIM_SetCompare2
	.code	16
	.thumb_func
	.type	TIM_SetCompare2, %function
TIM_SetCompare2:
.LFB57:
	.loc 1 1135 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI75:
	sub	sp, sp, #8
.LCFI76:
	add	r7, sp, #0
.LCFI77:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1140 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #56]
	.loc 1 1141 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE57:
	.size	TIM_SetCompare2, .-TIM_SetCompare2
	.section	.text.TIM_SetCompare3,"ax",%progbits
	.align	2
	.global	TIM_SetCompare3
	.code	16
	.thumb_func
	.type	TIM_SetCompare3, %function
TIM_SetCompare3:
.LFB58:
	.loc 1 1150 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI78:
	sub	sp, sp, #8
.LCFI79:
	add	r7, sp, #0
.LCFI80:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1155 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #60]
	.loc 1 1156 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE58:
	.size	TIM_SetCompare3, .-TIM_SetCompare3
	.section	.text.TIM_SetCompare4,"ax",%progbits
	.align	2
	.global	TIM_SetCompare4
	.code	16
	.thumb_func
	.type	TIM_SetCompare4, %function
TIM_SetCompare4:
.LFB59:
	.loc 1 1165 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI81:
	sub	sp, sp, #8
.LCFI82:
	add	r7, sp, #0
.LCFI83:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1170 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #64]
	.loc 1 1171 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE59:
	.size	TIM_SetCompare4, .-TIM_SetCompare4
	.section	.text.TIM_ForcedOC1Config,"ax",%progbits
	.align	2
	.global	TIM_ForcedOC1Config
	.code	16
	.thumb_func
	.type	TIM_ForcedOC1Config, %function
TIM_ForcedOC1Config:
.LFB60:
	.loc 1 1183 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI84:
	sub	sp, sp, #16
.LCFI85:
	add	r7, sp, #0
.LCFI86:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1184 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1188 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1190 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1192 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1194 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1195 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE60:
	.size	TIM_ForcedOC1Config, .-TIM_ForcedOC1Config
	.section	.text.TIM_ForcedOC2Config,"ax",%progbits
	.align	2
	.global	TIM_ForcedOC2Config
	.code	16
	.thumb_func
	.type	TIM_ForcedOC2Config, %function
TIM_ForcedOC2Config:
.LFB61:
	.loc 1 1208 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI87:
	sub	sp, sp, #16
.LCFI88:
	add	r7, sp, #0
.LCFI89:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1209 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1215 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1217 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L88
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1219 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1221 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1222 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L89:
	.align	2
.L88:
	.word	-28673
.LFE61:
	.size	TIM_ForcedOC2Config, .-TIM_ForcedOC2Config
	.section	.text.TIM_ForcedOC3Config,"ax",%progbits
	.align	2
	.global	TIM_ForcedOC3Config
	.code	16
	.thumb_func
	.type	TIM_ForcedOC3Config, %function
TIM_ForcedOC3Config:
.LFB62:
	.loc 1 1234 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI90:
	sub	sp, sp, #16
.LCFI91:
	add	r7, sp, #0
.LCFI92:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1235 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1241 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1243 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1245 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1247 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1248 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE62:
	.size	TIM_ForcedOC3Config, .-TIM_ForcedOC3Config
	.section	.text.TIM_ForcedOC4Config,"ax",%progbits
	.align	2
	.global	TIM_ForcedOC4Config
	.code	16
	.thumb_func
	.type	TIM_ForcedOC4Config, %function
TIM_ForcedOC4Config:
.LFB63:
	.loc 1 1260 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI93:
	sub	sp, sp, #16
.LCFI94:
	add	r7, sp, #0
.LCFI95:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1261 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1266 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1268 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L92
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1270 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1272 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1273 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L93:
	.align	2
.L92:
	.word	-28673
.LFE63:
	.size	TIM_ForcedOC4Config, .-TIM_ForcedOC4Config
	.section	.text.TIM_CCPreloadControl,"ax",%progbits
	.align	2
	.global	TIM_CCPreloadControl
	.code	16
	.thumb_func
	.type	TIM_CCPreloadControl, %function
TIM_CCPreloadControl:
.LFB64:
	.loc 1 1284 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI96:
	sub	sp, sp, #8
.LCFI97:
	add	r7, sp, #0
.LCFI98:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1288 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L95
	.loc 1 1291 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #1
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 1298 0
	b	.L97
.L95:
	.loc 1 1296 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #1
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L97:
	.loc 1 1298 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE64:
	.size	TIM_CCPreloadControl, .-TIM_CCPreloadControl
	.section	.text.TIM_OC1PreloadConfig,"ax",%progbits
	.align	2
	.global	TIM_OC1PreloadConfig
	.code	16
	.thumb_func
	.type	TIM_OC1PreloadConfig, %function
TIM_OC1PreloadConfig:
.LFB65:
	.loc 1 1311 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI99:
	sub	sp, sp, #16
.LCFI100:
	add	r7, sp, #0
.LCFI101:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1312 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1317 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1319 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #8
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1321 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1323 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1324 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE65:
	.size	TIM_OC1PreloadConfig, .-TIM_OC1PreloadConfig
	.section	.text.TIM_OC2PreloadConfig,"ax",%progbits
	.align	2
	.global	TIM_OC2PreloadConfig
	.code	16
	.thumb_func
	.type	TIM_OC2PreloadConfig, %function
TIM_OC2PreloadConfig:
.LFB66:
	.loc 1 1336 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI102:
	sub	sp, sp, #16
.LCFI103:
	add	r7, sp, #0
.LCFI104:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1337 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1342 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1344 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L100
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1346 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1348 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1349 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L101:
	.align	2
.L100:
	.word	-2049
.LFE66:
	.size	TIM_OC2PreloadConfig, .-TIM_OC2PreloadConfig
	.section	.text.TIM_OC3PreloadConfig,"ax",%progbits
	.align	2
	.global	TIM_OC3PreloadConfig
	.code	16
	.thumb_func
	.type	TIM_OC3PreloadConfig, %function
TIM_OC3PreloadConfig:
.LFB67:
	.loc 1 1361 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI105:
	sub	sp, sp, #16
.LCFI106:
	add	r7, sp, #0
.LCFI107:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1362 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1368 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1370 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #8
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1372 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1374 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1375 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE67:
	.size	TIM_OC3PreloadConfig, .-TIM_OC3PreloadConfig
	.section	.text.TIM_OC4PreloadConfig,"ax",%progbits
	.align	2
	.global	TIM_OC4PreloadConfig
	.code	16
	.thumb_func
	.type	TIM_OC4PreloadConfig, %function
TIM_OC4PreloadConfig:
.LFB68:
	.loc 1 1387 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI108:
	sub	sp, sp, #16
.LCFI109:
	add	r7, sp, #0
.LCFI110:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1388 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1394 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1396 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L104
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1398 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1400 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1401 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L105:
	.align	2
.L104:
	.word	-2049
.LFE68:
	.size	TIM_OC4PreloadConfig, .-TIM_OC4PreloadConfig
	.section	.text.TIM_OC1FastConfig,"ax",%progbits
	.align	2
	.global	TIM_OC1FastConfig
	.code	16
	.thumb_func
	.type	TIM_OC1FastConfig, %function
TIM_OC1FastConfig:
.LFB69:
	.loc 1 1413 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI111:
	sub	sp, sp, #16
.LCFI112:
	add	r7, sp, #0
.LCFI113:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1414 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1421 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1423 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #4
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1425 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1427 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1428 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE69:
	.size	TIM_OC1FastConfig, .-TIM_OC1FastConfig
	.section	.text.TIM_OC2FastConfig,"ax",%progbits
	.align	2
	.global	TIM_OC2FastConfig
	.code	16
	.thumb_func
	.type	TIM_OC2FastConfig, %function
TIM_OC2FastConfig:
.LFB70:
	.loc 1 1440 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI114:
	sub	sp, sp, #16
.LCFI115:
	add	r7, sp, #0
.LCFI116:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1441 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1448 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1450 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L108
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1452 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1454 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1455 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L109:
	.align	2
.L108:
	.word	-1025
.LFE70:
	.size	TIM_OC2FastConfig, .-TIM_OC2FastConfig
	.section	.text.TIM_OC3FastConfig,"ax",%progbits
	.align	2
	.global	TIM_OC3FastConfig
	.code	16
	.thumb_func
	.type	TIM_OC3FastConfig, %function
TIM_OC3FastConfig:
.LFB71:
	.loc 1 1467 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI117:
	sub	sp, sp, #16
.LCFI118:
	add	r7, sp, #0
.LCFI119:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1468 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1475 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1477 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #4
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1479 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1481 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1482 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE71:
	.size	TIM_OC3FastConfig, .-TIM_OC3FastConfig
	.section	.text.TIM_OC4FastConfig,"ax",%progbits
	.align	2
	.global	TIM_OC4FastConfig
	.code	16
	.thumb_func
	.type	TIM_OC4FastConfig, %function
TIM_OC4FastConfig:
.LFB72:
	.loc 1 1494 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI120:
	sub	sp, sp, #16
.LCFI121:
	add	r7, sp, #0
.LCFI122:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1495 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1502 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1504 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L112
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1506 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1508 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1509 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L113:
	.align	2
.L112:
	.word	-1025
.LFE72:
	.size	TIM_OC4FastConfig, .-TIM_OC4FastConfig
	.section	.text.TIM_ClearOC1Ref,"ax",%progbits
	.align	2
	.global	TIM_ClearOC1Ref
	.code	16
	.thumb_func
	.type	TIM_ClearOC1Ref, %function
TIM_ClearOC1Ref:
.LFB73:
	.loc 1 1521 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI123:
	sub	sp, sp, #16
.LCFI124:
	add	r7, sp, #0
.LCFI125:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1522 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1528 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1530 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #128
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1532 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1534 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1535 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE73:
	.size	TIM_ClearOC1Ref, .-TIM_ClearOC1Ref
	.section	.text.TIM_ClearOC2Ref,"ax",%progbits
	.align	2
	.global	TIM_ClearOC2Ref
	.code	16
	.thumb_func
	.type	TIM_ClearOC2Ref, %function
TIM_ClearOC2Ref:
.LFB74:
	.loc 1 1548 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI126:
	sub	sp, sp, #16
.LCFI127:
	add	r7, sp, #0
.LCFI128:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1549 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1555 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 1557 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	lsls	r2, r2, #17
	lsrs	r2, r2, #17
	strh	r2, [r3]
	.loc 1 1559 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1561 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 1562 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE74:
	.size	TIM_ClearOC2Ref, .-TIM_ClearOC2Ref
	.section	.text.TIM_ClearOC3Ref,"ax",%progbits
	.align	2
	.global	TIM_ClearOC3Ref
	.code	16
	.thumb_func
	.type	TIM_ClearOC3Ref, %function
TIM_ClearOC3Ref:
.LFB75:
	.loc 1 1574 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI129:
	sub	sp, sp, #16
.LCFI130:
	add	r7, sp, #0
.LCFI131:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1575 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1581 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1583 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #128
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1585 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1587 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1588 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE75:
	.size	TIM_ClearOC3Ref, .-TIM_ClearOC3Ref
	.section	.text.TIM_ClearOC4Ref,"ax",%progbits
	.align	2
	.global	TIM_ClearOC4Ref
	.code	16
	.thumb_func
	.type	TIM_ClearOC4Ref, %function
TIM_ClearOC4Ref:
.LFB76:
	.loc 1 1600 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI132:
	sub	sp, sp, #16
.LCFI133:
	add	r7, sp, #0
.LCFI134:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1601 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1607 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 1609 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	lsls	r2, r2, #17
	lsrs	r2, r2, #17
	strh	r2, [r3]
	.loc 1 1611 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1613 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 1614 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE76:
	.size	TIM_ClearOC4Ref, .-TIM_ClearOC4Ref
	.section	.text.TIM_OC1PolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC1PolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC1PolarityConfig, %function
TIM_OC1PolarityConfig:
.LFB77:
	.loc 1 1626 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI135:
	sub	sp, sp, #16
.LCFI136:
	add	r7, sp, #0
.LCFI137:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1627 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1633 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1635 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #2
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1636 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1638 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1639 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE77:
	.size	TIM_OC1PolarityConfig, .-TIM_OC1PolarityConfig
	.section	.text.TIM_OC1NPolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC1NPolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC1NPolarityConfig, %function
TIM_OC1NPolarityConfig:
.LFB78:
	.loc 1 1651 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI138:
	sub	sp, sp, #16
.LCFI139:
	add	r7, sp, #0
.LCFI140:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1652 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1657 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1659 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #8
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1660 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1662 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1663 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE78:
	.size	TIM_OC1NPolarityConfig, .-TIM_OC1NPolarityConfig
	.section	.text.TIM_OC2PolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC2PolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC2PolarityConfig, %function
TIM_OC2PolarityConfig:
.LFB79:
	.loc 1 1675 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI141:
	sub	sp, sp, #16
.LCFI142:
	add	r7, sp, #0
.LCFI143:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1676 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1682 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1684 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #32
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1685 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1687 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1688 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE79:
	.size	TIM_OC2PolarityConfig, .-TIM_OC2PolarityConfig
	.section	.text.TIM_OC2NPolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC2NPolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC2NPolarityConfig, %function
TIM_OC2NPolarityConfig:
.LFB80:
	.loc 1 1700 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI144:
	sub	sp, sp, #16
.LCFI145:
	add	r7, sp, #0
.LCFI146:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1701 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1706 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1708 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #128
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 1709 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #4
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1711 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1712 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE80:
	.size	TIM_OC2NPolarityConfig, .-TIM_OC2NPolarityConfig
	.section	.text.TIM_OC3PolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC3PolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC3PolarityConfig, %function
TIM_OC3PolarityConfig:
.LFB81:
	.loc 1 1724 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI147:
	sub	sp, sp, #16
.LCFI148:
	add	r7, sp, #0
.LCFI149:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1725 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1731 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1733 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L123
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1734 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1736 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1737 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L124:
	.align	2
.L123:
	.word	-513
.LFE81:
	.size	TIM_OC3PolarityConfig, .-TIM_OC3PolarityConfig
	.section	.text.TIM_OC3NPolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC3NPolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC3NPolarityConfig, %function
TIM_OC3NPolarityConfig:
.LFB82:
	.loc 1 1749 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI150:
	sub	sp, sp, #16
.LCFI151:
	add	r7, sp, #0
.LCFI152:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1750 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1756 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1758 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L126
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1759 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1761 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1762 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L127:
	.align	2
.L126:
	.word	-2049
.LFE82:
	.size	TIM_OC3NPolarityConfig, .-TIM_OC3NPolarityConfig
	.section	.text.TIM_OC4PolarityConfig,"ax",%progbits
	.align	2
	.global	TIM_OC4PolarityConfig
	.code	16
	.thumb_func
	.type	TIM_OC4PolarityConfig, %function
TIM_OC4PolarityConfig:
.LFB83:
	.loc 1 1775 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI153:
	sub	sp, sp, #16
.LCFI154:
	add	r7, sp, #0
.LCFI155:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1776 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1782 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 1784 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L129
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1785 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #12
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 1787 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 1788 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L130:
	.align	2
.L129:
	.word	-8193
.LFE83:
	.size	TIM_OC4PolarityConfig, .-TIM_OC4PolarityConfig
	.section	.text.TIM_SelectOCREFClear,"ax",%progbits
	.align	2
	.global	TIM_SelectOCREFClear
	.code	16
	.thumb_func
	.type	TIM_SelectOCREFClear, %function
TIM_SelectOCREFClear:
.LFB84:
	.loc 1 1800 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI156:
	sub	sp, sp, #8
.LCFI157:
	add	r7, sp, #0
.LCFI158:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1806 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #8
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 1807 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 1808 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE84:
	.size	TIM_SelectOCREFClear, .-TIM_SelectOCREFClear
	.section	.text.TIM_CCxCmd,"ax",%progbits
	.align	2
	.global	TIM_CCxCmd
	.code	16
	.thumb_func
	.type	TIM_CCxCmd, %function
TIM_CCxCmd:
.LFB85:
	.loc 1 1824 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI159:
	sub	sp, sp, #16
.LCFI160:
	add	r7, sp, #0
.LCFI161:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, r7
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 1825 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1831 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, #14
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1834 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 1837 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	sxth	r2, r3
	movs	r3, r7
	ldrh	r1, [r3]
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r1, r1, r3
	movs	r3, r1
	sxth	r3, r3
	orrs	r3, r2
	sxth	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 1838 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE85:
	.size	TIM_CCxCmd, .-TIM_CCxCmd
	.section	.text.TIM_CCxNCmd,"ax",%progbits
	.align	2
	.global	TIM_CCxNCmd
	.code	16
	.thumb_func
	.type	TIM_CCxNCmd, %function
TIM_CCxNCmd:
.LFB86:
	.loc 1 1853 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI162:
	sub	sp, sp, #16
.LCFI163:
	add	r7, sp, #0
.LCFI164:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, r7
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 1854 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1861 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	movs	r2, #4
	lsls	r2, r2, r3
	movs	r3, #14
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1864 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 1867 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	sxth	r2, r3
	movs	r3, r7
	ldrh	r1, [r3]
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r1, r1, r3
	movs	r3, r1
	sxth	r3, r3
	orrs	r3, r2
	sxth	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 1868 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE86:
	.size	TIM_CCxNCmd, .-TIM_CCxNCmd
	.section	.text.TIM_SelectCOM,"ax",%progbits
	.align	2
	.global	TIM_SelectCOM
	.code	16
	.thumb_func
	.type	TIM_SelectCOM, %function
TIM_SelectCOM:
.LFB87:
	.loc 1 1878 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI165:
	sub	sp, sp, #8
.LCFI166:
	add	r7, sp, #0
.LCFI167:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1882 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L135
	.loc 1 1885 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #4
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 1892 0
	b	.L137
.L135:
	.loc 1 1890 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #4
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L137:
	.loc 1 1892 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE87:
	.size	TIM_SelectCOM, .-TIM_SelectCOM
	.section	.text.TIM_ICInit,"ax",%progbits
	.align	2
	.global	TIM_ICInit
	.code	16
	.thumb_func
	.type	TIM_ICInit, %function
TIM_ICInit:
.LFB88:
	.loc 1 1954 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI168:
	sub	sp, sp, #8
.LCFI169:
	add	r7, sp, #0
.LCFI170:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1963 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L139
	.loc 1 1967 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	ldr	r0, [r7, #4]
	bl	TI1_Config
	.loc 1 1971 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC1Prescaler
	.loc 1 2003 0
	b	.L143
.L139:
	.loc 1 1973 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	cmp	r3, #4
	bne	.L141
	.loc 1 1977 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	ldr	r0, [r7, #4]
	bl	TI2_Config
	.loc 1 1981 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC2Prescaler
	.loc 1 2003 0
	b	.L143
.L141:
	.loc 1 1983 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	cmp	r3, #8
	bne	.L142
	.loc 1 1987 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	ldr	r0, [r7, #4]
	bl	TI3_Config
	.loc 1 1991 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC3Prescaler
	.loc 1 2003 0
	b	.L143
.L142:
	.loc 1 1997 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	ldr	r0, [r7, #4]
	bl	TI4_Config
	.loc 1 2001 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC4Prescaler
.L143:
	.loc 1 2003 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE88:
	.size	TIM_ICInit, .-TIM_ICInit
	.section	.text.TIM_ICStructInit,"ax",%progbits
	.align	2
	.global	TIM_ICStructInit
	.code	16
	.thumb_func
	.type	TIM_ICStructInit, %function
TIM_ICStructInit:
.LFB89:
	.loc 1 2012 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI171:
	sub	sp, sp, #8
.LCFI172:
	add	r7, sp, #0
.LCFI173:
	str	r0, [r7, #4]
	.loc 1 2014 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2015 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #2]
	.loc 1 2016 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	strh	r2, [r3, #4]
	.loc 1 2017 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #6]
	.loc 1 2018 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #8]
	.loc 1 2019 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE89:
	.size	TIM_ICStructInit, .-TIM_ICStructInit
	.section	.text.TIM_PWMIConfig,"ax",%progbits
	.align	2
	.global	TIM_PWMIConfig
	.code	16
	.thumb_func
	.type	TIM_PWMIConfig, %function
TIM_PWMIConfig:
.LFB90:
	.loc 1 2031 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI174:
	sub	sp, sp, #20
.LCFI175:
	add	r7, sp, #0
.LCFI176:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 2032 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2033 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #1
	strh	r2, [r3]
	.loc 1 2037 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #2]
	cmp	r3, #0
	bne	.L146
	.loc 1 2039 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #2
	strh	r2, [r3]
	b	.L147
.L146:
	.loc 1 2043 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
.L147:
	.loc 1 2046 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	cmp	r3, #1
	bne	.L148
	.loc 1 2048 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #2
	strh	r2, [r3]
	b	.L149
.L148:
	.loc 1 2052 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #1
	strh	r2, [r3]
.L149:
	.loc 1 2054 0
	ldr	r3, [r7]
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L150
	.loc 1 2057 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	ldr	r0, [r7, #4]
	bl	TI1_Config
	.loc 1 2060 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC1Prescaler
	.loc 1 2062 0
	ldr	r3, [r7]
	ldrh	r4, [r3, #8]
	movs	r3, #12
	adds	r3, r7, r3
	ldrh	r2, [r3]
	movs	r3, #14
	adds	r3, r7, r3
	ldrh	r1, [r3]
	ldr	r0, [r7, #4]
	movs	r3, r4
	bl	TI2_Config
	.loc 1 2064 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC2Prescaler
	.loc 1 2078 0
	b	.L152
.L150:
	.loc 1 2069 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r2, [r3, #4]
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	ldr	r0, [r7, #4]
	bl	TI2_Config
	.loc 1 2072 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC2Prescaler
	.loc 1 2074 0
	ldr	r3, [r7]
	ldrh	r4, [r3, #8]
	movs	r3, #12
	adds	r3, r7, r3
	ldrh	r2, [r3]
	movs	r3, #14
	adds	r3, r7, r3
	ldrh	r1, [r3]
	ldr	r0, [r7, #4]
	movs	r3, r4
	bl	TI1_Config
	.loc 1 2076 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SetIC1Prescaler
.L152:
	.loc 1 2078 0
	nop
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE90:
	.size	TIM_PWMIConfig, .-TIM_PWMIConfig
	.section	.text.TIM_GetCapture1,"ax",%progbits
	.align	2
	.global	TIM_GetCapture1
	.code	16
	.thumb_func
	.type	TIM_GetCapture1, %function
TIM_GetCapture1:
.LFB91:
	.loc 1 2086 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI177:
	sub	sp, sp, #8
.LCFI178:
	add	r7, sp, #0
.LCFI179:
	str	r0, [r7, #4]
	.loc 1 2091 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	.loc 1 2092 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE91:
	.size	TIM_GetCapture1, .-TIM_GetCapture1
	.section	.text.TIM_GetCapture2,"ax",%progbits
	.align	2
	.global	TIM_GetCapture2
	.code	16
	.thumb_func
	.type	TIM_GetCapture2, %function
TIM_GetCapture2:
.LFB92:
	.loc 1 2100 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI180:
	sub	sp, sp, #8
.LCFI181:
	add	r7, sp, #0
.LCFI182:
	str	r0, [r7, #4]
	.loc 1 2105 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	.loc 1 2106 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE92:
	.size	TIM_GetCapture2, .-TIM_GetCapture2
	.section	.text.TIM_GetCapture3,"ax",%progbits
	.align	2
	.global	TIM_GetCapture3
	.code	16
	.thumb_func
	.type	TIM_GetCapture3, %function
TIM_GetCapture3:
.LFB93:
	.loc 1 2114 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI183:
	sub	sp, sp, #8
.LCFI184:
	add	r7, sp, #0
.LCFI185:
	str	r0, [r7, #4]
	.loc 1 2119 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #60]
	.loc 1 2120 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE93:
	.size	TIM_GetCapture3, .-TIM_GetCapture3
	.section	.text.TIM_GetCapture4,"ax",%progbits
	.align	2
	.global	TIM_GetCapture4
	.code	16
	.thumb_func
	.type	TIM_GetCapture4, %function
TIM_GetCapture4:
.LFB94:
	.loc 1 2128 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI186:
	sub	sp, sp, #8
.LCFI187:
	add	r7, sp, #0
.LCFI188:
	str	r0, [r7, #4]
	.loc 1 2133 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	.loc 1 2134 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE94:
	.size	TIM_GetCapture4, .-TIM_GetCapture4
	.section	.text.TIM_SetIC1Prescaler,"ax",%progbits
	.align	2
	.global	TIM_SetIC1Prescaler
	.code	16
	.thumb_func
	.type	TIM_SetIC1Prescaler, %function
TIM_SetIC1Prescaler:
.LFB95:
	.loc 1 2148 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI189:
	sub	sp, sp, #8
.LCFI190:
	add	r7, sp, #0
.LCFI191:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2154 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #24]
	uxth	r3, r3
	movs	r2, #12
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #24]
	.loc 1 2156 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #24]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #24]
	.loc 1 2157 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE95:
	.size	TIM_SetIC1Prescaler, .-TIM_SetIC1Prescaler
	.section	.text.TIM_SetIC2Prescaler,"ax",%progbits
	.align	2
	.global	TIM_SetIC2Prescaler
	.code	16
	.thumb_func
	.type	TIM_SetIC2Prescaler, %function
TIM_SetIC2Prescaler:
.LFB96:
	.loc 1 2171 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI192:
	sub	sp, sp, #8
.LCFI193:
	add	r7, sp, #0
.LCFI194:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2177 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #24]
	uxth	r3, r3
	ldr	r2, .L163
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #24]
	.loc 1 2179 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #24]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r3, r3
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #24]
	.loc 1 2180 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L164:
	.align	2
.L163:
	.word	-3073
.LFE96:
	.size	TIM_SetIC2Prescaler, .-TIM_SetIC2Prescaler
	.section	.text.TIM_SetIC3Prescaler,"ax",%progbits
	.align	2
	.global	TIM_SetIC3Prescaler
	.code	16
	.thumb_func
	.type	TIM_SetIC3Prescaler, %function
TIM_SetIC3Prescaler:
.LFB97:
	.loc 1 2194 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI195:
	sub	sp, sp, #8
.LCFI196:
	add	r7, sp, #0
.LCFI197:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2200 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r3, r3
	movs	r2, #12
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 2202 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 2203 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE97:
	.size	TIM_SetIC3Prescaler, .-TIM_SetIC3Prescaler
	.section	.text.TIM_SetIC4Prescaler,"ax",%progbits
	.align	2
	.global	TIM_SetIC4Prescaler
	.code	16
	.thumb_func
	.type	TIM_SetIC4Prescaler, %function
TIM_SetIC4Prescaler:
.LFB98:
	.loc 1 2217 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI198:
	sub	sp, sp, #8
.LCFI199:
	add	r7, sp, #0
.LCFI200:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2223 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r3, r3
	ldr	r2, .L167
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 2225 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r3, r3
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 2226 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L168:
	.align	2
.L167:
	.word	-3073
.LFE98:
	.size	TIM_SetIC4Prescaler, .-TIM_SetIC4Prescaler
	.section	.text.TIM_ITConfig,"ax",%progbits
	.align	2
	.global	TIM_ITConfig
	.code	16
	.thumb_func
	.type	TIM_ITConfig, %function
TIM_ITConfig:
.LFB99:
	.loc 1 2269 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI201:
	sub	sp, sp, #8
.LCFI202:
	add	r7, sp, #0
.LCFI203:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #1
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 2275 0
	adds	r3, r7, #1
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L170
	.loc 1 2278 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #12]
	.loc 1 2285 0
	b	.L172
.L170:
	.loc 1 2283 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #12]
.L172:
	.loc 1 2285 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE99:
	.size	TIM_ITConfig, .-TIM_ITConfig
	.section	.text.TIM_GenerateEvent,"ax",%progbits
	.align	2
	.global	TIM_GenerateEvent
	.code	16
	.thumb_func
	.type	TIM_GenerateEvent, %function
TIM_GenerateEvent:
.LFB100:
	.loc 1 2309 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI204:
	sub	sp, sp, #8
.LCFI205:
	add	r7, sp, #0
.LCFI206:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2314 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #20]
	.loc 1 2315 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE100:
	.size	TIM_GenerateEvent, .-TIM_GenerateEvent
	.section	.text.TIM_GetFlagStatus,"ax",%progbits
	.align	2
	.global	TIM_GetFlagStatus
	.code	16
	.thumb_func
	.type	TIM_GetFlagStatus, %function
TIM_GetFlagStatus:
.LFB101:
	.loc 1 2344 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI207:
	sub	sp, sp, #16
.LCFI208:
	add	r7, sp, #0
.LCFI209:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2345 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2351 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	ands	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L175
	.loc 1 2353 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L176
.L175:
	.loc 1 2357 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L176:
	.loc 1 2359 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 2360 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE101:
	.size	TIM_GetFlagStatus, .-TIM_GetFlagStatus
	.section	.text.TIM_ClearFlag,"ax",%progbits
	.align	2
	.global	TIM_ClearFlag
	.code	16
	.thumb_func
	.type	TIM_ClearFlag, %function
TIM_ClearFlag:
.LFB102:
	.loc 1 2389 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI210:
	sub	sp, sp, #8
.LCFI211:
	add	r7, sp, #0
.LCFI212:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2395 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	mvns	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #16]
	.loc 1 2396 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE102:
	.size	TIM_ClearFlag, .-TIM_ClearFlag
	.section	.text.TIM_GetITStatus,"ax",%progbits
	.align	2
	.global	TIM_GetITStatus
	.code	16
	.thumb_func
	.type	TIM_GetITStatus, %function
TIM_GetITStatus:
.LFB103:
	.loc 1 2420 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI213:
	sub	sp, sp, #16
.LCFI214:
	add	r7, sp, #0
.LCFI215:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2421 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 2422 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2428 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #16]
	uxth	r2, r3
	movs	r3, #12
	adds	r3, r7, r3
	adds	r1, r7, #2
	ldrh	r1, [r1]
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 2430 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	uxth	r2, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r1, r7, #2
	ldrh	r1, [r1]
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 2431 0
	movs	r3, #12
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L180
	.loc 1 2431 0 is_stmt 0 discriminator 1
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L180
	.loc 1 2433 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L181
.L180:
	.loc 1 2437 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L181:
	.loc 1 2439 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 2440 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE103:
	.size	TIM_GetITStatus, .-TIM_GetITStatus
	.section	.text.TIM_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	TIM_ClearITPendingBit
	.code	16
	.thumb_func
	.type	TIM_ClearITPendingBit, %function
TIM_ClearITPendingBit:
.LFB104:
	.loc 1 2464 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI216:
	sub	sp, sp, #8
.LCFI217:
	add	r7, sp, #0
.LCFI218:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2470 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	mvns	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #16]
	.loc 1 2471 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE104:
	.size	TIM_ClearITPendingBit, .-TIM_ClearITPendingBit
	.section	.text.TIM_DMAConfig,"ax",%progbits
	.align	2
	.global	TIM_DMAConfig
	.code	16
	.thumb_func
	.type	TIM_DMAConfig, %function
TIM_DMAConfig:
.LFB105:
	.loc 1 2490 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI219:
	sub	sp, sp, #8
.LCFI220:
	add	r7, sp, #0
.LCFI221:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, r7
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 2496 0
	adds	r2, r7, #2
	movs	r3, r7
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r1, r3
	ldr	r3, [r7, #4]
	movs	r2, #72
	strh	r1, [r3, r2]
	.loc 1 2497 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE105:
	.size	TIM_DMAConfig, .-TIM_DMAConfig
	.section	.text.TIM_DMACmd,"ax",%progbits
	.align	2
	.global	TIM_DMACmd
	.code	16
	.thumb_func
	.type	TIM_DMACmd, %function
TIM_DMACmd:
.LFB106:
	.loc 1 2516 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI222:
	sub	sp, sp, #8
.LCFI223:
	add	r7, sp, #0
.LCFI224:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #1
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 2522 0
	adds	r3, r7, #1
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L186
	.loc 1 2525 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #12]
	.loc 1 2532 0
	b	.L188
.L186:
	.loc 1 2530 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #12]
.L188:
	.loc 1 2532 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE106:
	.size	TIM_DMACmd, .-TIM_DMACmd
	.section	.text.TIM_SelectCCDMA,"ax",%progbits
	.align	2
	.global	TIM_SelectCCDMA
	.code	16
	.thumb_func
	.type	TIM_SelectCCDMA, %function
TIM_SelectCCDMA:
.LFB107:
	.loc 1 2542 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI225:
	sub	sp, sp, #8
.LCFI226:
	add	r7, sp, #0
.LCFI227:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 2547 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L190
	.loc 1 2550 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #8
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 2557 0
	b	.L192
.L190:
	.loc 1 2555 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #8
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L192:
	.loc 1 2557 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE107:
	.size	TIM_SelectCCDMA, .-TIM_SelectCCDMA
	.section	.text.TIM_InternalClockConfig,"ax",%progbits
	.align	2
	.global	TIM_InternalClockConfig
	.code	16
	.thumb_func
	.type	TIM_InternalClockConfig, %function
TIM_InternalClockConfig:
.LFB108:
	.loc 1 2581 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI228:
	sub	sp, sp, #8
.LCFI229:
	add	r7, sp, #0
.LCFI230:
	str	r0, [r7, #4]
	.loc 1 2585 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #7
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 2586 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE108:
	.size	TIM_InternalClockConfig, .-TIM_InternalClockConfig
	.section	.text.TIM_ITRxExternalClockConfig,"ax",%progbits
	.align	2
	.global	TIM_ITRxExternalClockConfig
	.code	16
	.thumb_func
	.type	TIM_ITRxExternalClockConfig, %function
TIM_ITRxExternalClockConfig:
.LFB109:
	.loc 1 2600 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI231:
	sub	sp, sp, #8
.LCFI232:
	add	r7, sp, #0
.LCFI233:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2605 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SelectInputTrigger
	.loc 1 2607 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #7
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 2608 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE109:
	.size	TIM_ITRxExternalClockConfig, .-TIM_ITRxExternalClockConfig
	.section	.text.TIM_TIxExternalClockConfig,"ax",%progbits
	.align	2
	.global	TIM_TIxExternalClockConfig
	.code	16
	.thumb_func
	.type	TIM_TIxExternalClockConfig, %function
TIM_TIxExternalClockConfig:
.LFB110:
	.loc 1 2628 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI234:
	sub	sp, sp, #20
.LCFI235:
	add	r7, sp, #0
.LCFI236:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 2635 0
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #96
	bne	.L196
	.loc 1 2637 0
	adds	r3, r7, #6
	ldrh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r1, [r3]
	ldr	r0, [r7, #12]
	movs	r3, r2
	movs	r2, #1
	bl	TI2_Config
	b	.L197
.L196:
	.loc 1 2641 0
	adds	r3, r7, #6
	ldrh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r1, [r3]
	ldr	r0, [r7, #12]
	movs	r3, r2
	movs	r2, #1
	bl	TI1_Config
.L197:
	.loc 1 2644 0
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r2, [r3]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	TIM_SelectInputTrigger
	.loc 1 2646 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #7
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #8]
	.loc 1 2647 0
	nop
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE110:
	.size	TIM_TIxExternalClockConfig, .-TIM_TIxExternalClockConfig
	.section	.text.TIM_ETRClockMode1Config,"ax",%progbits
	.align	2
	.global	TIM_ETRClockMode1Config
	.code	16
	.thumb_func
	.type	TIM_ETRClockMode1Config, %function
TIM_ETRClockMode1Config:
.LFB111:
	.loc 1 2668 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI237:
	sub	sp, sp, #28
.LCFI238:
	add	r7, sp, #0
.LCFI239:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 2669 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2678 0
	adds	r3, r7, #6
	ldrh	r4, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r1, [r3]
	ldr	r0, [r7, #12]
	movs	r3, r4
	bl	TIM_ETRConfig
	.loc 1 2681 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #8]
	strh	r2, [r3]
	.loc 1 2683 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #7
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 2685 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #7
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2687 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 2688 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2690 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #8]
	.loc 1 2691 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE111:
	.size	TIM_ETRClockMode1Config, .-TIM_ETRClockMode1Config
	.section	.text.TIM_ETRClockMode2Config,"ax",%progbits
	.align	2
	.global	TIM_ETRClockMode2Config
	.code	16
	.thumb_func
	.type	TIM_ETRClockMode2Config, %function
TIM_ETRClockMode2Config:
.LFB112:
	.loc 1 2712 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI240:
	sub	sp, sp, #20
.LCFI241:
	add	r7, sp, #0
.LCFI242:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 2720 0
	adds	r3, r7, #6
	ldrh	r4, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r1, [r3]
	ldr	r0, [r7, #12]
	movs	r3, r4
	bl	TIM_ETRConfig
	.loc 1 2722 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #128
	lsls	r2, r2, #7
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #8]
	.loc 1 2723 0
	nop
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE112:
	.size	TIM_ETRClockMode2Config, .-TIM_ETRClockMode2Config
	.section	.text.TIM_SelectInputTrigger,"ax",%progbits
	.align	2
	.global	TIM_SelectInputTrigger
	.code	16
	.thumb_func
	.type	TIM_SelectInputTrigger, %function
TIM_SelectInputTrigger:
.LFB113:
	.loc 1 2776 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI243:
	sub	sp, sp, #16
.LCFI244:
	add	r7, sp, #0
.LCFI245:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2777 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2784 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #8]
	strh	r2, [r3]
	.loc 1 2786 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #112
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 2788 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2790 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #8]
	.loc 1 2791 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE113:
	.size	TIM_SelectInputTrigger, .-TIM_SelectInputTrigger
	.section	.text.TIM_SelectOutputTrigger,"ax",%progbits
	.align	2
	.global	TIM_SelectOutputTrigger
	.code	16
	.thumb_func
	.type	TIM_SelectOutputTrigger, %function
TIM_SelectOutputTrigger:
.LFB114:
	.loc 1 2815 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI246:
	sub	sp, sp, #8
.LCFI247:
	add	r7, sp, #0
.LCFI248:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2821 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #112
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 2823 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 2824 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE114:
	.size	TIM_SelectOutputTrigger, .-TIM_SelectOutputTrigger
	.section	.text.TIM_SelectSlaveMode,"ax",%progbits
	.align	2
	.global	TIM_SelectSlaveMode
	.code	16
	.thumb_func
	.type	TIM_SelectSlaveMode, %function
TIM_SelectSlaveMode:
.LFB115:
	.loc 1 2839 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI249:
	sub	sp, sp, #8
.LCFI250:
	add	r7, sp, #0
.LCFI251:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2845 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #7
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 2847 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 2848 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE115:
	.size	TIM_SelectSlaveMode, .-TIM_SelectSlaveMode
	.section	.text.TIM_SelectMasterSlaveMode,"ax",%progbits
	.align	2
	.global	TIM_SelectMasterSlaveMode
	.code	16
	.thumb_func
	.type	TIM_SelectMasterSlaveMode, %function
TIM_SelectMasterSlaveMode:
.LFB116:
	.loc 1 2861 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI252:
	sub	sp, sp, #8
.LCFI253:
	add	r7, sp, #0
.LCFI254:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 2867 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #128
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 2870 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 2871 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE116:
	.size	TIM_SelectMasterSlaveMode, .-TIM_SelectMasterSlaveMode
	.section	.text.TIM_ETRConfig,"ax",%progbits
	.align	2
	.global	TIM_ETRConfig
	.code	16
	.thumb_func
	.type	TIM_ETRConfig, %function
TIM_ETRConfig:
.LFB117:
	.loc 1 2892 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI255:
	sub	sp, sp, #28
.LCFI256:
	add	r7, sp, #0
.LCFI257:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 2893 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2901 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #8]
	strh	r2, [r3]
	.loc 1 2903 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #255
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 2905 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2907 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #8]
	.loc 1 2908 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE117:
	.size	TIM_ETRConfig, .-TIM_ETRConfig
	.section	.text.TIM_EncoderInterfaceConfig,"ax",%progbits
	.align	2
	.global	TIM_EncoderInterfaceConfig
	.code	16
	.thumb_func
	.type	TIM_EncoderInterfaceConfig, %function
TIM_EncoderInterfaceConfig:
.LFB118:
	.loc 1 2947 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI258:
	sub	sp, sp, #28
.LCFI259:
	add	r7, sp, #0
.LCFI260:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 2948 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2949 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2950 0
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 2959 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #8]
	strh	r2, [r3]
	.loc 1 2961 0
	movs	r3, #20
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 2963 0
	movs	r3, #18
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 2965 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #7
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 2966 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r1, r7, r2
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2968 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L206
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 2969 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #2
	adds	r1, r1, #255
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2972 0
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #18
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #170
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 2973 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	lsls	r3, r3, #4
	uxth	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r1, r3
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #18
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 2975 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #8]
	.loc 1 2977 0
	ldr	r3, [r7, #12]
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 2979 0
	ldr	r3, [r7, #12]
	movs	r2, #18
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 2980 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L207:
	.align	2
.L206:
	.word	-772
.LFE118:
	.size	TIM_EncoderInterfaceConfig, .-TIM_EncoderInterfaceConfig
	.section	.text.TIM_SelectHallSensor,"ax",%progbits
	.align	2
	.global	TIM_SelectHallSensor
	.code	16
	.thumb_func
	.type	TIM_SelectHallSensor, %function
TIM_SelectHallSensor:
.LFB119:
	.loc 1 2990 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI261:
	sub	sp, sp, #8
.LCFI262:
	add	r7, sp, #0
.LCFI263:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 2995 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L209
	.loc 1 2998 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #128
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 3005 0
	b	.L211
.L209:
	.loc 1 3003 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #128
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L211:
	.loc 1 3005 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE119:
	.size	TIM_SelectHallSensor, .-TIM_SelectHallSensor
	.section	.text.TIM_RemapConfig,"ax",%progbits
	.align	2
	.global	TIM_RemapConfig
	.code	16
	.thumb_func
	.type	TIM_RemapConfig, %function
TIM_RemapConfig:
.LFB120:
	.loc 1 3036 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI264:
	sub	sp, sp, #8
.LCFI265:
	add	r7, sp, #0
.LCFI266:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 3042 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	movs	r1, #80
	ldrh	r2, [r2]
	strh	r2, [r3, r1]
	.loc 1 3043 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE120:
	.size	TIM_RemapConfig, .-TIM_RemapConfig
	.section	.text.TI1_Config,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	TI1_Config, %function
TI1_Config:
.LFB121:
	.loc 1 3067 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI267:
	sub	sp, sp, #28
.LCFI268:
	add	r7, sp, #0
.LCFI269:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 3068 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 3070 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #1
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #32]
	.loc 1 3071 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 3072 0
	movs	r3, #20
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 3074 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #243
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 3075 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	lsls	r3, r3, #4
	uxth	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3078 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #10
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 3079 0
	movs	r3, #10
	adds	r2, r7, r3
	movs	r3, #20
	adds	r3, r7, r3
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #20
	adds	r3, r7, r3
	movs	r1, #1
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3081 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 3082 0
	ldr	r3, [r7, #12]
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 3083 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE121:
	.size	TI1_Config, .-TI1_Config
	.section	.text.TI2_Config,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	TI2_Config, %function
TI2_Config:
.LFB122:
	.loc 1 3103 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI270:
	sub	sp, sp, #28
.LCFI271:
	add	r7, sp, #0
.LCFI272:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 3104 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 3106 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	movs	r2, #16
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #32]
	.loc 1 3107 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	.loc 1 3108 0
	movs	r3, #20
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 3109 0
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	lsls	r2, r2, #4
	strh	r2, [r3]
	.loc 1 3111 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L215
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 3112 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	lsls	r3, r3, #12
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3113 0
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3115 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #160
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 3116 0
	movs	r3, #18
	adds	r2, r7, r3
	movs	r3, #20
	adds	r3, r7, r3
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #20
	adds	r3, r7, r3
	movs	r1, #16
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3118 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #24]
	.loc 1 3119 0
	ldr	r3, [r7, #12]
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 3120 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L216:
	.align	2
.L215:
	.word	3327
.LFE122:
	.size	TI2_Config, .-TI2_Config
	.section	.text.TI3_Config,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	TI3_Config, %function
TI3_Config:
.LFB123:
	.loc 1 3140 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI273:
	sub	sp, sp, #28
.LCFI274:
	add	r7, sp, #0
.LCFI275:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 3141 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 3143 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	ldr	r2, .L218
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #32]
	.loc 1 3144 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 3145 0
	movs	r3, #20
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 3146 0
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	lsls	r2, r2, #8
	strh	r2, [r3]
	.loc 1 3148 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #243
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 3149 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	lsls	r3, r3, #4
	uxth	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3151 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L218+4
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 3152 0
	movs	r3, #18
	adds	r2, r7, r3
	movs	r3, #20
	adds	r3, r7, r3
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #20
	adds	r3, r7, r3
	movs	r1, #128
	lsls	r1, r1, #1
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3154 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 3155 0
	ldr	r3, [r7, #12]
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 3156 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L219:
	.align	2
.L218:
	.word	-257
	.word	-2561
.LFE123:
	.size	TI3_Config, .-TI3_Config
	.section	.text.TI4_Config,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	TI4_Config, %function
TI4_Config:
.LFB124:
	.loc 1 3176 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI276:
	sub	sp, sp, #28
.LCFI277:
	add	r7, sp, #0
.LCFI278:
	str	r0, [r7, #12]
	movs	r4, r1
	movs	r0, r2
	movs	r1, r3
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r4, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 3177 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 3180 0
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #32]
	uxth	r3, r3
	ldr	r2, .L221
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #12]
	strh	r2, [r3, #32]
	.loc 1 3181 0
	movs	r3, #22
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 3182 0
	movs	r3, #20
	adds	r3, r7, r3
	ldr	r2, [r7, #12]
	ldrh	r2, [r2, #32]
	strh	r2, [r3]
	.loc 1 3183 0
	movs	r3, #18
	adds	r3, r7, r3
	movs	r2, #10
	adds	r2, r7, r2
	ldrh	r2, [r2]
	lsls	r2, r2, #12
	strh	r2, [r3]
	.loc 1 3185 0
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L221+4
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 3186 0
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	lsls	r3, r3, #8
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3187 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	lsls	r3, r3, #12
	uxth	r1, r3
	movs	r3, #22
	adds	r3, r7, r3
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3189 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L221+8
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 3190 0
	movs	r3, #18
	adds	r2, r7, r3
	movs	r3, #20
	adds	r3, r7, r3
	ldrh	r2, [r2]
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #20
	adds	r3, r7, r3
	movs	r1, #128
	lsls	r1, r1, #5
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 3192 0
	ldr	r3, [r7, #12]
	movs	r2, #22
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 3193 0
	ldr	r3, [r7, #12]
	movs	r2, #20
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #32]
	.loc 1 3194 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L222:
	.align	2
.L221:
	.word	-4097
	.word	3327
	.word	24575
.LFE124:
	.size	TI4_Config, .-TI4_Config
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
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
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
	.4byte	.LCFI18-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
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
	.4byte	.LCFI21-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
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
	.4byte	.LCFI24-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
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
	.4byte	.LCFI27-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
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
	.4byte	.LCFI30-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
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
	.4byte	.LCFI33-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
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
	.4byte	.LCFI36-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
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
	.4byte	.LCFI39-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
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
	.4byte	.LCFI42-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
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
	.4byte	.LCFI45-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
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
	.4byte	.LCFI48-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
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
	.4byte	.LCFI51-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
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
	.4byte	.LCFI54-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
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
	.4byte	.LCFI57-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
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
	.4byte	.LCFI60-.LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
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
	.4byte	.LCFI63-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
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
	.4byte	.LCFI66-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
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
	.4byte	.LCFI69-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI71-.LCFI70
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
	.4byte	.LCFI72-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI74-.LCFI73
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
	.4byte	.LCFI75-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI77-.LCFI76
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
	.4byte	.LCFI78-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI80-.LCFI79
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
	.4byte	.LCFI81-.LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI83-.LCFI82
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
	.4byte	.LCFI84-.LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI85-.LCFI84
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI86-.LCFI85
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
	.4byte	.LCFI87-.LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI89-.LCFI88
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
	.4byte	.LCFI90-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
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
	.4byte	.LCFI93-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
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
	.4byte	.LCFI96-.LFB64
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
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI99-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI101-.LCFI100
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
	.4byte	.LCFI102-.LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI103-.LCFI102
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI104-.LCFI103
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
	.4byte	.LCFI105-.LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI106-.LCFI105
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI107-.LCFI106
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
	.4byte	.LCFI108-.LFB68
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
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.byte	0x4
	.4byte	.LCFI111-.LFB69
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
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI114-.LFB70
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
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI117-.LFB71
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI118-.LCFI117
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI119-.LCFI118
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
	.4byte	.LCFI120-.LFB72
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
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI123-.LFB73
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI124-.LCFI123
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI125-.LCFI124
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
	.4byte	.LCFI126-.LFB74
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
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI129-.LFB75
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI130-.LCFI129
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI131-.LCFI130
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
	.4byte	.LCFI132-.LFB76
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI133-.LCFI132
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI134-.LCFI133
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
	.4byte	.LCFI135-.LFB77
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
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.byte	0x4
	.4byte	.LCFI138-.LFB78
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
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.byte	0x4
	.4byte	.LCFI141-.LFB79
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
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.byte	0x4
	.4byte	.LCFI144-.LFB80
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI145-.LCFI144
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI146-.LCFI145
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE96:
.LSFDE98:
	.4byte	.LEFDE98-.LASFDE98
.LASFDE98:
	.4byte	.Lframe0
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.byte	0x4
	.4byte	.LCFI147-.LFB81
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI148-.LCFI147
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI149-.LCFI148
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE98:
.LSFDE100:
	.4byte	.LEFDE100-.LASFDE100
.LASFDE100:
	.4byte	.Lframe0
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.byte	0x4
	.4byte	.LCFI150-.LFB82
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI151-.LCFI150
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI152-.LCFI151
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE100:
.LSFDE102:
	.4byte	.LEFDE102-.LASFDE102
.LASFDE102:
	.4byte	.Lframe0
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.byte	0x4
	.4byte	.LCFI153-.LFB83
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI154-.LCFI153
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI155-.LCFI154
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE102:
.LSFDE104:
	.4byte	.LEFDE104-.LASFDE104
.LASFDE104:
	.4byte	.Lframe0
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.byte	0x4
	.4byte	.LCFI156-.LFB84
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI157-.LCFI156
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI158-.LCFI157
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE104:
.LSFDE106:
	.4byte	.LEFDE106-.LASFDE106
.LASFDE106:
	.4byte	.Lframe0
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.byte	0x4
	.4byte	.LCFI159-.LFB85
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI160-.LCFI159
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI161-.LCFI160
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE106:
.LSFDE108:
	.4byte	.LEFDE108-.LASFDE108
.LASFDE108:
	.4byte	.Lframe0
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.byte	0x4
	.4byte	.LCFI162-.LFB86
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI163-.LCFI162
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI164-.LCFI163
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE108:
.LSFDE110:
	.4byte	.LEFDE110-.LASFDE110
.LASFDE110:
	.4byte	.Lframe0
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.byte	0x4
	.4byte	.LCFI165-.LFB87
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI166-.LCFI165
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI167-.LCFI166
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE110:
.LSFDE112:
	.4byte	.LEFDE112-.LASFDE112
.LASFDE112:
	.4byte	.Lframe0
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.byte	0x4
	.4byte	.LCFI168-.LFB88
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI169-.LCFI168
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI170-.LCFI169
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE112:
.LSFDE114:
	.4byte	.LEFDE114-.LASFDE114
.LASFDE114:
	.4byte	.Lframe0
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.byte	0x4
	.4byte	.LCFI171-.LFB89
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI172-.LCFI171
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI173-.LCFI172
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE114:
.LSFDE116:
	.4byte	.LEFDE116-.LASFDE116
.LASFDE116:
	.4byte	.Lframe0
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.byte	0x4
	.4byte	.LCFI174-.LFB90
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI175-.LCFI174
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI176-.LCFI175
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE116:
.LSFDE118:
	.4byte	.LEFDE118-.LASFDE118
.LASFDE118:
	.4byte	.Lframe0
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.byte	0x4
	.4byte	.LCFI177-.LFB91
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI178-.LCFI177
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI179-.LCFI178
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE118:
.LSFDE120:
	.4byte	.LEFDE120-.LASFDE120
.LASFDE120:
	.4byte	.Lframe0
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.byte	0x4
	.4byte	.LCFI180-.LFB92
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI181-.LCFI180
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI182-.LCFI181
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE120:
.LSFDE122:
	.4byte	.LEFDE122-.LASFDE122
.LASFDE122:
	.4byte	.Lframe0
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.byte	0x4
	.4byte	.LCFI183-.LFB93
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI184-.LCFI183
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI185-.LCFI184
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE122:
.LSFDE124:
	.4byte	.LEFDE124-.LASFDE124
.LASFDE124:
	.4byte	.Lframe0
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.byte	0x4
	.4byte	.LCFI186-.LFB94
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI187-.LCFI186
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI188-.LCFI187
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE124:
.LSFDE126:
	.4byte	.LEFDE126-.LASFDE126
.LASFDE126:
	.4byte	.Lframe0
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.byte	0x4
	.4byte	.LCFI189-.LFB95
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI190-.LCFI189
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI191-.LCFI190
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE126:
.LSFDE128:
	.4byte	.LEFDE128-.LASFDE128
.LASFDE128:
	.4byte	.Lframe0
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.byte	0x4
	.4byte	.LCFI192-.LFB96
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI193-.LCFI192
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI194-.LCFI193
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE128:
.LSFDE130:
	.4byte	.LEFDE130-.LASFDE130
.LASFDE130:
	.4byte	.Lframe0
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.byte	0x4
	.4byte	.LCFI195-.LFB97
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI196-.LCFI195
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI197-.LCFI196
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE130:
.LSFDE132:
	.4byte	.LEFDE132-.LASFDE132
.LASFDE132:
	.4byte	.Lframe0
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.byte	0x4
	.4byte	.LCFI198-.LFB98
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI199-.LCFI198
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI200-.LCFI199
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE132:
.LSFDE134:
	.4byte	.LEFDE134-.LASFDE134
.LASFDE134:
	.4byte	.Lframe0
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.byte	0x4
	.4byte	.LCFI201-.LFB99
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI202-.LCFI201
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI203-.LCFI202
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE134:
.LSFDE136:
	.4byte	.LEFDE136-.LASFDE136
.LASFDE136:
	.4byte	.Lframe0
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.byte	0x4
	.4byte	.LCFI204-.LFB100
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI205-.LCFI204
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI206-.LCFI205
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE136:
.LSFDE138:
	.4byte	.LEFDE138-.LASFDE138
.LASFDE138:
	.4byte	.Lframe0
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.byte	0x4
	.4byte	.LCFI207-.LFB101
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI208-.LCFI207
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI209-.LCFI208
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE138:
.LSFDE140:
	.4byte	.LEFDE140-.LASFDE140
.LASFDE140:
	.4byte	.Lframe0
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.byte	0x4
	.4byte	.LCFI210-.LFB102
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI211-.LCFI210
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI212-.LCFI211
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE140:
.LSFDE142:
	.4byte	.LEFDE142-.LASFDE142
.LASFDE142:
	.4byte	.Lframe0
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.byte	0x4
	.4byte	.LCFI213-.LFB103
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI214-.LCFI213
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI215-.LCFI214
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE142:
.LSFDE144:
	.4byte	.LEFDE144-.LASFDE144
.LASFDE144:
	.4byte	.Lframe0
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.byte	0x4
	.4byte	.LCFI216-.LFB104
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI217-.LCFI216
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI218-.LCFI217
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE144:
.LSFDE146:
	.4byte	.LEFDE146-.LASFDE146
.LASFDE146:
	.4byte	.Lframe0
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.byte	0x4
	.4byte	.LCFI219-.LFB105
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI220-.LCFI219
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI221-.LCFI220
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE146:
.LSFDE148:
	.4byte	.LEFDE148-.LASFDE148
.LASFDE148:
	.4byte	.Lframe0
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.byte	0x4
	.4byte	.LCFI222-.LFB106
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI223-.LCFI222
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI224-.LCFI223
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE148:
.LSFDE150:
	.4byte	.LEFDE150-.LASFDE150
.LASFDE150:
	.4byte	.Lframe0
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.byte	0x4
	.4byte	.LCFI225-.LFB107
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI226-.LCFI225
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI227-.LCFI226
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE150:
.LSFDE152:
	.4byte	.LEFDE152-.LASFDE152
.LASFDE152:
	.4byte	.Lframe0
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.byte	0x4
	.4byte	.LCFI228-.LFB108
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI229-.LCFI228
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI230-.LCFI229
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE152:
.LSFDE154:
	.4byte	.LEFDE154-.LASFDE154
.LASFDE154:
	.4byte	.Lframe0
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.byte	0x4
	.4byte	.LCFI231-.LFB109
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI232-.LCFI231
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI233-.LCFI232
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE154:
.LSFDE156:
	.4byte	.LEFDE156-.LASFDE156
.LASFDE156:
	.4byte	.Lframe0
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.byte	0x4
	.4byte	.LCFI234-.LFB110
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI235-.LCFI234
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI236-.LCFI235
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE156:
.LSFDE158:
	.4byte	.LEFDE158-.LASFDE158
.LASFDE158:
	.4byte	.Lframe0
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.byte	0x4
	.4byte	.LCFI237-.LFB111
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI238-.LCFI237
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI239-.LCFI238
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE158:
.LSFDE160:
	.4byte	.LEFDE160-.LASFDE160
.LASFDE160:
	.4byte	.Lframe0
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.byte	0x4
	.4byte	.LCFI240-.LFB112
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI241-.LCFI240
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI242-.LCFI241
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE160:
.LSFDE162:
	.4byte	.LEFDE162-.LASFDE162
.LASFDE162:
	.4byte	.Lframe0
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.byte	0x4
	.4byte	.LCFI243-.LFB113
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI244-.LCFI243
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI245-.LCFI244
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE162:
.LSFDE164:
	.4byte	.LEFDE164-.LASFDE164
.LASFDE164:
	.4byte	.Lframe0
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.byte	0x4
	.4byte	.LCFI246-.LFB114
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI247-.LCFI246
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI248-.LCFI247
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE164:
.LSFDE166:
	.4byte	.LEFDE166-.LASFDE166
.LASFDE166:
	.4byte	.Lframe0
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.byte	0x4
	.4byte	.LCFI249-.LFB115
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI250-.LCFI249
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI251-.LCFI250
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE166:
.LSFDE168:
	.4byte	.LEFDE168-.LASFDE168
.LASFDE168:
	.4byte	.Lframe0
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.byte	0x4
	.4byte	.LCFI252-.LFB116
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI253-.LCFI252
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI254-.LCFI253
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE168:
.LSFDE170:
	.4byte	.LEFDE170-.LASFDE170
.LASFDE170:
	.4byte	.Lframe0
	.4byte	.LFB117
	.4byte	.LFE117-.LFB117
	.byte	0x4
	.4byte	.LCFI255-.LFB117
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI256-.LCFI255
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI257-.LCFI256
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE170:
.LSFDE172:
	.4byte	.LEFDE172-.LASFDE172
.LASFDE172:
	.4byte	.Lframe0
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.byte	0x4
	.4byte	.LCFI258-.LFB118
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI259-.LCFI258
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI260-.LCFI259
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE172:
.LSFDE174:
	.4byte	.LEFDE174-.LASFDE174
.LASFDE174:
	.4byte	.Lframe0
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.byte	0x4
	.4byte	.LCFI261-.LFB119
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI262-.LCFI261
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI263-.LCFI262
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE174:
.LSFDE176:
	.4byte	.LEFDE176-.LASFDE176
.LASFDE176:
	.4byte	.Lframe0
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.byte	0x4
	.4byte	.LCFI264-.LFB120
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI265-.LCFI264
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI266-.LCFI265
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE176:
.LSFDE178:
	.4byte	.LEFDE178-.LASFDE178
.LASFDE178:
	.4byte	.Lframe0
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.byte	0x4
	.4byte	.LCFI267-.LFB121
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI268-.LCFI267
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI269-.LCFI268
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE178:
.LSFDE180:
	.4byte	.LEFDE180-.LASFDE180
.LASFDE180:
	.4byte	.Lframe0
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
	.byte	0x4
	.4byte	.LCFI270-.LFB122
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI271-.LCFI270
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI272-.LCFI271
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE180:
.LSFDE182:
	.4byte	.LEFDE182-.LASFDE182
.LASFDE182:
	.4byte	.Lframe0
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.byte	0x4
	.4byte	.LCFI273-.LFB123
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI274-.LCFI273
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI275-.LCFI274
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE182:
.LSFDE184:
	.4byte	.LEFDE184-.LASFDE184
.LASFDE184:
	.4byte	.Lframe0
	.4byte	.LFB124
	.4byte	.LFE124-.LFB124
	.byte	0x4
	.4byte	.LCFI276-.LFB124
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI277-.LCFI276
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI278-.LCFI277
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE184:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_tim.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1c3b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF222
	.byte	0xc
	.4byte	.LASF223
	.4byte	.LASF224
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
	.uleb128 0x5
	.4byte	0x45
	.uleb128 0x9
	.byte	0x54
	.byte	0x3
	.2byte	0x22a
	.4byte	0x2be
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x22c
	.4byte	0xdd
	.byte	0
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x22d
	.4byte	0x45
	.byte	0x2
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x22e
	.4byte	0xdd
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x22f
	.4byte	0x45
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x230
	.4byte	0xdd
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x231
	.4byte	0x45
	.byte	0xa
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x232
	.4byte	0xdd
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x233
	.4byte	0x45
	.byte	0xe
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x234
	.4byte	0xdd
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x235
	.4byte	0x45
	.byte	0x12
	.uleb128 0xa
	.ascii	"EGR\000"
	.byte	0x3
	.2byte	0x236
	.4byte	0xdd
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x237
	.4byte	0x45
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x238
	.4byte	0xdd
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x239
	.4byte	0x45
	.byte	0x1a
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x23a
	.4byte	0xdd
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x23b
	.4byte	0x45
	.byte	0x1e
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x23c
	.4byte	0xdd
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x23d
	.4byte	0x45
	.byte	0x22
	.uleb128 0xa
	.ascii	"CNT\000"
	.byte	0x3
	.2byte	0x23e
	.4byte	0x85
	.byte	0x24
	.uleb128 0xa
	.ascii	"PSC\000"
	.byte	0x3
	.2byte	0x23f
	.4byte	0xdd
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x240
	.4byte	0x45
	.byte	0x2a
	.uleb128 0xa
	.ascii	"ARR\000"
	.byte	0x3
	.2byte	0x241
	.4byte	0x85
	.byte	0x2c
	.uleb128 0xa
	.ascii	"RCR\000"
	.byte	0x3
	.2byte	0x242
	.4byte	0xdd
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x243
	.4byte	0x45
	.byte	0x32
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x244
	.4byte	0x85
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x245
	.4byte	0x85
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x246
	.4byte	0x85
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x247
	.4byte	0x85
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x248
	.4byte	0xdd
	.byte	0x44
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x249
	.4byte	0x45
	.byte	0x46
	.uleb128 0xa
	.ascii	"DCR\000"
	.byte	0x3
	.2byte	0x24a
	.4byte	0xdd
	.byte	0x48
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x24b
	.4byte	0x45
	.byte	0x4a
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x24c
	.4byte	0xdd
	.byte	0x4c
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x24d
	.4byte	0x45
	.byte	0x4e
	.uleb128 0xa
	.ascii	"OR\000"
	.byte	0x3
	.2byte	0x24e
	.4byte	0xdd
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x3
	.2byte	0x24f
	.4byte	0x45
	.byte	0x52
	.byte	0
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x3
	.2byte	0x250
	.4byte	0xe2
	.uleb128 0xd
	.byte	0xc
	.byte	0x4
	.byte	0x37
	.4byte	0x30f
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x4
	.byte	0x39
	.4byte	0x45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0x4
	.byte	0x3c
	.4byte	0x45
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x4
	.byte	0x3f
	.4byte	0x5e
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x4
	.byte	0x43
	.4byte	0x45
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x4
	.byte	0x46
	.4byte	0x2c
	.byte	0xa
	.byte	0
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x4
	.byte	0x4e
	.4byte	0x2ca
	.uleb128 0xd
	.byte	0x14
	.byte	0x4
	.byte	0x54
	.4byte	0x383
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x4
	.byte	0x56
	.4byte	0x45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x4
	.byte	0x59
	.4byte	0x45
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x4
	.byte	0x5c
	.4byte	0x45
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x4
	.byte	0x60
	.4byte	0x5e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x4
	.byte	0x64
	.4byte	0x45
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x4
	.byte	0x67
	.4byte	0x45
	.byte	0xe
	.uleb128 0xe
	.4byte	.LASF56
	.byte	0x4
	.byte	0x6b
	.4byte	0x45
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x4
	.byte	0x6f
	.4byte	0x45
	.byte	0x12
	.byte	0
	.uleb128 0x3
	.4byte	.LASF58
	.byte	0x4
	.byte	0x72
	.4byte	0x31a
	.uleb128 0xd
	.byte	0xa
	.byte	0x4
	.byte	0x78
	.4byte	0x3d3
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x4
	.byte	0x7b
	.4byte	0x45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF60
	.byte	0x4
	.byte	0x7e
	.4byte	0x45
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x4
	.byte	0x81
	.4byte	0x45
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF62
	.byte	0x4
	.byte	0x84
	.4byte	0x45
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF63
	.byte	0x4
	.byte	0x87
	.4byte	0x45
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.4byte	.LASF64
	.byte	0x4
	.byte	0x89
	.4byte	0x38e
	.uleb128 0xd
	.byte	0xe
	.byte	0x4
	.byte	0x90
	.4byte	0x43b
	.uleb128 0xe
	.4byte	.LASF65
	.byte	0x4
	.byte	0x93
	.4byte	0x45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF66
	.byte	0x4
	.byte	0x96
	.4byte	0x45
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF67
	.byte	0x4
	.byte	0x99
	.4byte	0x45
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF68
	.byte	0x4
	.byte	0x9c
	.4byte	0x45
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF69
	.byte	0x4
	.byte	0xa0
	.4byte	0x45
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF70
	.byte	0x4
	.byte	0xa3
	.4byte	0x45
	.byte	0xa
	.uleb128 0xe
	.4byte	.LASF71
	.byte	0x4
	.byte	0xa6
	.4byte	0x45
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF72
	.byte	0x4
	.byte	0xa8
	.4byte	0x3de
	.uleb128 0xf
	.4byte	.LASF73
	.byte	0x1
	.byte	0xbf
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46a
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x1
	.byte	0xbf
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x2be
	.uleb128 0x12
	.4byte	.LASF74
	.byte	0x1
	.byte	0xfc
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b0
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x1
	.byte	0xfc
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0xfc
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF82
	.byte	0x1
	.byte	0xfe
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x30f
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x12e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4dc
	.uleb128 0x15
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x12e
	.4byte	0x4b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x142
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x520
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x142
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x142
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x142
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x15a
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x564
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x15a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x15a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x15c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x172
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x599
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x172
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x172
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x181
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ce
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x181
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x181
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x190
	.4byte	0x5e
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f8
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x190
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x19f
	.4byte	0x45
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x622
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x19f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x1b0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x657
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x1b0
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x1ce
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x68c
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x1e8
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c1
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x1e8
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x1e8
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x204
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f6
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x204
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x204
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x21a
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x72b
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x21a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x21a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x22e
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x760
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x22e
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x22e
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x268
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x795
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x268
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x268
	.4byte	0x795
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x43b
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x280
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c1
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x280
	.4byte	0x795
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x293
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7f6
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x293
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x293
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x2db
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x858
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x2db
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x2db
	.4byte	0x858
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x2dd
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x2dd
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x2dd
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x383
	.uleb128 0x14
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x32d
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c0
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x32d
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x32d
	.4byte	0x858
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x32f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x32f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x32f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x380
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x922
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x380
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x380
	.4byte	0x858
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x382
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x382
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x382
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x984
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x858
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x3d2
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x3d2
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x3d2
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x40e
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9aa
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x40e
	.4byte	0x858
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x432
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa0c
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x432
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x432
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x432
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x434
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x435
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x45f
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa41
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x45f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x45f
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x46e
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa76
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x46e
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x46e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF118
	.byte	0x1
	.2byte	0x47d
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaab
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x47d
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF119
	.byte	0x1
	.2byte	0x47d
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF120
	.byte	0x1
	.2byte	0x48c
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xae0
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x48c
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF121
	.byte	0x1
	.2byte	0x48c
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF122
	.byte	0x1
	.2byte	0x49e
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb24
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x49e
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x49e
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x4a0
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF125
	.byte	0x1
	.2byte	0x4b7
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb68
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x4b7
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x4b7
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x4b9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF126
	.byte	0x1
	.2byte	0x4d1
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbac
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x4d1
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x4d1
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x4d3
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF128
	.byte	0x1
	.2byte	0x4eb
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbf0
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x4eb
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF123
	.byte	0x1
	.2byte	0x4eb
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x4ed
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF129
	.byte	0x1
	.2byte	0x503
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc25
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x503
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x503
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF130
	.byte	0x1
	.2byte	0x51e
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc69
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x51e
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x51e
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x520
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF132
	.byte	0x1
	.2byte	0x537
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcad
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x537
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x537
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x539
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF133
	.byte	0x1
	.2byte	0x550
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcf1
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x550
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x550
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x552
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF134
	.byte	0x1
	.2byte	0x56a
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd35
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x56a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF131
	.byte	0x1
	.2byte	0x56a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x56c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x584
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd79
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x584
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x584
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x586
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF137
	.byte	0x1
	.2byte	0x59f
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdbd
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x59f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x59f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x5a1
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF138
	.byte	0x1
	.2byte	0x5ba
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe01
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x5ba
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x5ba
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x5bc
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF139
	.byte	0x1
	.2byte	0x5d5
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe45
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x5d5
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x5d5
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x5d7
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF140
	.byte	0x1
	.2byte	0x5f0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe89
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x5f0
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x5f0
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x5f2
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF142
	.byte	0x1
	.2byte	0x60b
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xecd
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x60b
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x60b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0x60d
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF143
	.byte	0x1
	.2byte	0x625
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf11
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x625
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x625
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x627
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF144
	.byte	0x1
	.2byte	0x63f
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf55
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x63f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF141
	.byte	0x1
	.2byte	0x63f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0x641
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF145
	.byte	0x1
	.2byte	0x659
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf99
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x659
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x659
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x65b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF146
	.byte	0x1
	.2byte	0x672
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfdd
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x672
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x672
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x674
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF147
	.byte	0x1
	.2byte	0x68a
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1021
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x68a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x68a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x68c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x6a3
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1065
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x6a3
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x6a3
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x6a5
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x6bb
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10a9
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x6bb
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x6bb
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x6bd
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x6d4
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10ed
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x6d4
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x6d4
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x6d6
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x6ee
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1131
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x6ee
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x6ee
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x6f0
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF152
	.byte	0x1
	.2byte	0x707
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1166
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x707
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF153
	.byte	0x1
	.2byte	0x707
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x71f
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x11b9
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x71f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x71f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF155
	.byte	0x1
	.2byte	0x71f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x721
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF156
	.byte	0x1
	.2byte	0x73c
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x120c
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x73c
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x73c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x73c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x73e
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF158
	.byte	0x1
	.2byte	0x755
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1241
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x755
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x755
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x19
	.4byte	.LASF159
	.byte	0x1
	.2byte	0x7a1
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1276
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x7a1
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x7a1
	.4byte	0x1276
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x3d3
	.uleb128 0x14
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x7db
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12a2
	.uleb128 0x15
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x7db
	.4byte	0x1276
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x7ee
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12f5
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x7ee
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x7ee
	.4byte	0x1276
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x7f0
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x16
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x7f1
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x825
	.4byte	0x5e
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x131f
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x825
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x833
	.4byte	0x5e
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1349
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x833
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF167
	.byte	0x1
	.2byte	0x841
	.4byte	0x5e
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1373
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x841
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF168
	.byte	0x1
	.2byte	0x84f
	.4byte	0x5e
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x139d
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x84f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF169
	.byte	0x1
	.2byte	0x863
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13d2
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x863
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x863
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF171
	.byte	0x1
	.2byte	0x87a
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1407
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x87a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x87a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF172
	.byte	0x1
	.2byte	0x891
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x143c
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x891
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x891
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF173
	.byte	0x1
	.2byte	0x8a8
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1471
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x8a8
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x8a8
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF174
	.byte	0x1
	.2byte	0x8dc
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14b5
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x8dc
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x8dc
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x8dc
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0x14
	.4byte	.LASF176
	.byte	0x1
	.2byte	0x904
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14ea
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x904
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF177
	.byte	0x1
	.2byte	0x904
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x17
	.4byte	.LASF178
	.byte	0x1
	.2byte	0x927
	.4byte	0xa3
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1532
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x927
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF179
	.byte	0x1
	.2byte	0x927
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF180
	.byte	0x1
	.2byte	0x929
	.4byte	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF181
	.byte	0x1
	.2byte	0x954
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1567
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x954
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF179
	.byte	0x1
	.2byte	0x954
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x17
	.4byte	.LASF182
	.byte	0x1
	.2byte	0x973
	.4byte	0xae
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15cd
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x973
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x973
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF180
	.byte	0x1
	.2byte	0x975
	.4byte	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x16
	.4byte	.LASF183
	.byte	0x1
	.2byte	0x976
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF184
	.byte	0x1
	.2byte	0x976
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF185
	.byte	0x1
	.2byte	0x99f
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1602
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x99f
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF175
	.byte	0x1
	.2byte	0x99f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF186
	.byte	0x1
	.2byte	0x9b9
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1646
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x9b9
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF187
	.byte	0x1
	.2byte	0x9b9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x9b9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x14
	.4byte	.LASF189
	.byte	0x1
	.2byte	0x9d3
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x168a
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x9d3
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF190
	.byte	0x1
	.2byte	0x9d3
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x9d3
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0x14
	.4byte	.LASF191
	.byte	0x1
	.2byte	0x9ed
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16bf
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x9ed
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x9ed
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF192
	.byte	0x1
	.2byte	0xa14
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16e5
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xa14
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF193
	.byte	0x1
	.2byte	0xa27
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x171a
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xa27
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF194
	.byte	0x1
	.2byte	0xa27
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x19
	.4byte	.LASF195
	.byte	0x1
	.2byte	0xa42
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x176d
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xa42
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF196
	.byte	0x1
	.2byte	0xa42
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0xa43
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.4byte	.LASF197
	.byte	0x1
	.2byte	0xa43
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.byte	0
	.uleb128 0x19
	.4byte	.LASF198
	.byte	0x1
	.2byte	0xa6a
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17cf
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xa6a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF199
	.byte	0x1
	.2byte	0xa6a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF200
	.byte	0x1
	.2byte	0xa6a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF201
	.byte	0x1
	.2byte	0xa6b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF202
	.byte	0x1
	.2byte	0xa6d
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x19
	.4byte	.LASF203
	.byte	0x1
	.2byte	0xa96
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1822
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xa96
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF199
	.byte	0x1
	.2byte	0xa96
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF200
	.byte	0x1
	.2byte	0xa97
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.4byte	.LASF201
	.byte	0x1
	.2byte	0xa97
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.byte	0
	.uleb128 0x14
	.4byte	.LASF204
	.byte	0x1
	.2byte	0xad7
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1866
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xad7
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF194
	.byte	0x1
	.2byte	0xad7
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF202
	.byte	0x1
	.2byte	0xad9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF205
	.byte	0x1
	.2byte	0xafe
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x189b
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xafe
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF206
	.byte	0x1
	.2byte	0xafe
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF207
	.byte	0x1
	.2byte	0xb16
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18d0
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xb16
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF208
	.byte	0x1
	.2byte	0xb16
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF209
	.byte	0x1
	.2byte	0xb2c
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1905
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xb2c
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF210
	.byte	0x1
	.2byte	0xb2c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF211
	.byte	0x1
	.2byte	0xb4a
	.4byte	.LFB117
	.4byte	.LFE117-.LFB117
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1967
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xb4a
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF199
	.byte	0x1
	.2byte	0xb4a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF200
	.byte	0x1
	.2byte	0xb4a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF201
	.byte	0x1
	.2byte	0xb4b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF202
	.byte	0x1
	.2byte	0xb4d
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0x14
	.4byte	.LASF212
	.byte	0x1
	.2byte	0xb81
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19e7
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xb81
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF213
	.byte	0x1
	.2byte	0xb81
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF214
	.byte	0x1
	.2byte	0xb82
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF215
	.byte	0x1
	.2byte	0xb82
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF202
	.byte	0x1
	.2byte	0xb84
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0xb85
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0xb86
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x14
	.4byte	.LASF216
	.byte	0x1
	.2byte	0xbad
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a1c
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xbad
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0xbad
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF217
	.byte	0x1
	.2byte	0xbdb
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a51
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xbdb
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF218
	.byte	0x1
	.2byte	0xbdb
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF219
	.byte	0x1
	.2byte	0xbf9
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ac2
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xbf9
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0xbf9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF61
	.byte	0x1
	.2byte	0xbf9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0xbfa
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0xbfc
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0xbfc
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF220
	.byte	0x1
	.2byte	0xc1d
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b42
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xc1d
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0xc1d
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF61
	.byte	0x1
	.2byte	0xc1d
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0xc1e
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF124
	.byte	0x1
	.2byte	0xc20
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0xc20
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0xc20
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF221
	.byte	0x1
	.2byte	0xc42
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1bc2
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xc42
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0xc42
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF61
	.byte	0x1
	.2byte	0xc42
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0xc43
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0xc45
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0xc45
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0xc45
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF225
	.byte	0x1
	.2byte	0xc66
	.4byte	.LFB124
	.4byte	.LFE124-.LFB124
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0xc66
	.4byte	0x46a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0xc66
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x15
	.4byte	.LASF61
	.byte	0x1
	.2byte	0xc66
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0xc67
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x16
	.4byte	.LASF127
	.byte	0x1
	.2byte	0xc69
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0xc69
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0xc69
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
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
	.uleb128 0x1b
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
	.4byte	0x83e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1c3f
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xc5
	.ascii	"DISABLE\000"
	.4byte	0xcb
	.ascii	"ENABLE\000"
	.4byte	0x446
	.ascii	"TIM_DeInit\000"
	.4byte	0x470
	.ascii	"TIM_TimeBaseInit\000"
	.4byte	0x4b6
	.ascii	"TIM_TimeBaseStructInit\000"
	.4byte	0x4dc
	.ascii	"TIM_PrescalerConfig\000"
	.4byte	0x520
	.ascii	"TIM_CounterModeConfig\000"
	.4byte	0x564
	.ascii	"TIM_SetCounter\000"
	.4byte	0x599
	.ascii	"TIM_SetAutoreload\000"
	.4byte	0x5ce
	.ascii	"TIM_GetCounter\000"
	.4byte	0x5f8
	.ascii	"TIM_GetPrescaler\000"
	.4byte	0x622
	.ascii	"TIM_UpdateDisableConfig\000"
	.4byte	0x657
	.ascii	"TIM_UpdateRequestConfig\000"
	.4byte	0x68c
	.ascii	"TIM_ARRPreloadConfig\000"
	.4byte	0x6c1
	.ascii	"TIM_SelectOnePulseMode\000"
	.4byte	0x6f6
	.ascii	"TIM_SetClockDivision\000"
	.4byte	0x72b
	.ascii	"TIM_Cmd\000"
	.4byte	0x760
	.ascii	"TIM_BDTRConfig\000"
	.4byte	0x79b
	.ascii	"TIM_BDTRStructInit\000"
	.4byte	0x7c1
	.ascii	"TIM_CtrlPWMOutputs\000"
	.4byte	0x7f6
	.ascii	"TIM_OC1Init\000"
	.4byte	0x85e
	.ascii	"TIM_OC2Init\000"
	.4byte	0x8c0
	.ascii	"TIM_OC3Init\000"
	.4byte	0x922
	.ascii	"TIM_OC4Init\000"
	.4byte	0x984
	.ascii	"TIM_OCStructInit\000"
	.4byte	0x9aa
	.ascii	"TIM_SelectOCxM\000"
	.4byte	0xa0c
	.ascii	"TIM_SetCompare1\000"
	.4byte	0xa41
	.ascii	"TIM_SetCompare2\000"
	.4byte	0xa76
	.ascii	"TIM_SetCompare3\000"
	.4byte	0xaab
	.ascii	"TIM_SetCompare4\000"
	.4byte	0xae0
	.ascii	"TIM_ForcedOC1Config\000"
	.4byte	0xb24
	.ascii	"TIM_ForcedOC2Config\000"
	.4byte	0xb68
	.ascii	"TIM_ForcedOC3Config\000"
	.4byte	0xbac
	.ascii	"TIM_ForcedOC4Config\000"
	.4byte	0xbf0
	.ascii	"TIM_CCPreloadControl\000"
	.4byte	0xc25
	.ascii	"TIM_OC1PreloadConfig\000"
	.4byte	0xc69
	.ascii	"TIM_OC2PreloadConfig\000"
	.4byte	0xcad
	.ascii	"TIM_OC3PreloadConfig\000"
	.4byte	0xcf1
	.ascii	"TIM_OC4PreloadConfig\000"
	.4byte	0xd35
	.ascii	"TIM_OC1FastConfig\000"
	.4byte	0xd79
	.ascii	"TIM_OC2FastConfig\000"
	.4byte	0xdbd
	.ascii	"TIM_OC3FastConfig\000"
	.4byte	0xe01
	.ascii	"TIM_OC4FastConfig\000"
	.4byte	0xe45
	.ascii	"TIM_ClearOC1Ref\000"
	.4byte	0xe89
	.ascii	"TIM_ClearOC2Ref\000"
	.4byte	0xecd
	.ascii	"TIM_ClearOC3Ref\000"
	.4byte	0xf11
	.ascii	"TIM_ClearOC4Ref\000"
	.4byte	0xf55
	.ascii	"TIM_OC1PolarityConfig\000"
	.4byte	0xf99
	.ascii	"TIM_OC1NPolarityConfig\000"
	.4byte	0xfdd
	.ascii	"TIM_OC2PolarityConfig\000"
	.4byte	0x1021
	.ascii	"TIM_OC2NPolarityConfig\000"
	.4byte	0x1065
	.ascii	"TIM_OC3PolarityConfig\000"
	.4byte	0x10a9
	.ascii	"TIM_OC3NPolarityConfig\000"
	.4byte	0x10ed
	.ascii	"TIM_OC4PolarityConfig\000"
	.4byte	0x1131
	.ascii	"TIM_SelectOCREFClear\000"
	.4byte	0x1166
	.ascii	"TIM_CCxCmd\000"
	.4byte	0x11b9
	.ascii	"TIM_CCxNCmd\000"
	.4byte	0x120c
	.ascii	"TIM_SelectCOM\000"
	.4byte	0x1241
	.ascii	"TIM_ICInit\000"
	.4byte	0x127c
	.ascii	"TIM_ICStructInit\000"
	.4byte	0x12a2
	.ascii	"TIM_PWMIConfig\000"
	.4byte	0x12f5
	.ascii	"TIM_GetCapture1\000"
	.4byte	0x131f
	.ascii	"TIM_GetCapture2\000"
	.4byte	0x1349
	.ascii	"TIM_GetCapture3\000"
	.4byte	0x1373
	.ascii	"TIM_GetCapture4\000"
	.4byte	0x139d
	.ascii	"TIM_SetIC1Prescaler\000"
	.4byte	0x13d2
	.ascii	"TIM_SetIC2Prescaler\000"
	.4byte	0x1407
	.ascii	"TIM_SetIC3Prescaler\000"
	.4byte	0x143c
	.ascii	"TIM_SetIC4Prescaler\000"
	.4byte	0x1471
	.ascii	"TIM_ITConfig\000"
	.4byte	0x14b5
	.ascii	"TIM_GenerateEvent\000"
	.4byte	0x14ea
	.ascii	"TIM_GetFlagStatus\000"
	.4byte	0x1532
	.ascii	"TIM_ClearFlag\000"
	.4byte	0x1567
	.ascii	"TIM_GetITStatus\000"
	.4byte	0x15cd
	.ascii	"TIM_ClearITPendingBit\000"
	.4byte	0x1602
	.ascii	"TIM_DMAConfig\000"
	.4byte	0x1646
	.ascii	"TIM_DMACmd\000"
	.4byte	0x168a
	.ascii	"TIM_SelectCCDMA\000"
	.4byte	0x16bf
	.ascii	"TIM_InternalClockConfig\000"
	.4byte	0x16e5
	.ascii	"TIM_ITRxExternalClockConfig\000"
	.4byte	0x171a
	.ascii	"TIM_TIxExternalClockConfig\000"
	.4byte	0x176d
	.ascii	"TIM_ETRClockMode1Config\000"
	.4byte	0x17cf
	.ascii	"TIM_ETRClockMode2Config\000"
	.4byte	0x1822
	.ascii	"TIM_SelectInputTrigger\000"
	.4byte	0x1866
	.ascii	"TIM_SelectOutputTrigger\000"
	.4byte	0x189b
	.ascii	"TIM_SelectSlaveMode\000"
	.4byte	0x18d0
	.ascii	"TIM_SelectMasterSlaveMode\000"
	.4byte	0x1905
	.ascii	"TIM_ETRConfig\000"
	.4byte	0x1967
	.ascii	"TIM_EncoderInterfaceConfig\000"
	.4byte	0x19e7
	.ascii	"TIM_SelectHallSensor\000"
	.4byte	0x1a1c
	.ascii	"TIM_RemapConfig\000"
	.4byte	0x1a51
	.ascii	"TI1_Config\000"
	.4byte	0x1ac2
	.ascii	"TI2_Config\000"
	.4byte	0x1b42
	.ascii	"TI3_Config\000"
	.4byte	0x1bc2
	.ascii	"TI4_Config\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x16e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x1c3f
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
	.4byte	0x2be
	.ascii	"TIM_TypeDef\000"
	.4byte	0x30f
	.ascii	"TIM_TimeBaseInitTypeDef\000"
	.4byte	0x383
	.ascii	"TIM_OCInitTypeDef\000"
	.4byte	0x3d3
	.ascii	"TIM_ICInitTypeDef\000"
	.4byte	0x43b
	.ascii	"TIM_BDTRInitTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2fc
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
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.4byte	.LFB117
	.4byte	.LFE117-.LFB117
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
	.4byte	.LFB123
	.4byte	.LFE123-.LFB123
	.4byte	.LFB124
	.4byte	.LFE124-.LFB124
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
	.4byte	.LFB81
	.4byte	.LFE81
	.4byte	.LFB82
	.4byte	.LFE82
	.4byte	.LFB83
	.4byte	.LFE83
	.4byte	.LFB84
	.4byte	.LFE84
	.4byte	.LFB85
	.4byte	.LFE85
	.4byte	.LFB86
	.4byte	.LFE86
	.4byte	.LFB87
	.4byte	.LFE87
	.4byte	.LFB88
	.4byte	.LFE88
	.4byte	.LFB89
	.4byte	.LFE89
	.4byte	.LFB90
	.4byte	.LFE90
	.4byte	.LFB91
	.4byte	.LFE91
	.4byte	.LFB92
	.4byte	.LFE92
	.4byte	.LFB93
	.4byte	.LFE93
	.4byte	.LFB94
	.4byte	.LFE94
	.4byte	.LFB95
	.4byte	.LFE95
	.4byte	.LFB96
	.4byte	.LFE96
	.4byte	.LFB97
	.4byte	.LFE97
	.4byte	.LFB98
	.4byte	.LFE98
	.4byte	.LFB99
	.4byte	.LFE99
	.4byte	.LFB100
	.4byte	.LFE100
	.4byte	.LFB101
	.4byte	.LFE101
	.4byte	.LFB102
	.4byte	.LFE102
	.4byte	.LFB103
	.4byte	.LFE103
	.4byte	.LFB104
	.4byte	.LFE104
	.4byte	.LFB105
	.4byte	.LFE105
	.4byte	.LFB106
	.4byte	.LFE106
	.4byte	.LFB107
	.4byte	.LFE107
	.4byte	.LFB108
	.4byte	.LFE108
	.4byte	.LFB109
	.4byte	.LFE109
	.4byte	.LFB110
	.4byte	.LFE110
	.4byte	.LFB111
	.4byte	.LFE111
	.4byte	.LFB112
	.4byte	.LFE112
	.4byte	.LFB113
	.4byte	.LFE113
	.4byte	.LFB114
	.4byte	.LFE114
	.4byte	.LFB115
	.4byte	.LFE115
	.4byte	.LFB116
	.4byte	.LFE116
	.4byte	.LFB117
	.4byte	.LFE117
	.4byte	.LFB118
	.4byte	.LFE118
	.4byte	.LFB119
	.4byte	.LFE119
	.4byte	.LFB120
	.4byte	.LFE120
	.4byte	.LFB121
	.4byte	.LFE121
	.4byte	.LFB122
	.4byte	.LFE122
	.4byte	.LFB123
	.4byte	.LFE123
	.4byte	.LFB124
	.4byte	.LFE124
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF139:
	.ascii	"TIM_OC4FastConfig\000"
.LASF145:
	.ascii	"TIM_OC1PolarityConfig\000"
.LASF113:
	.ascii	"tmp1\000"
.LASF134:
	.ascii	"TIM_OC4PreloadConfig\000"
.LASF114:
	.ascii	"TIM_SetCompare1\000"
.LASF116:
	.ascii	"TIM_SetCompare2\000"
.LASF44:
	.ascii	"TIM_Prescaler\000"
.LASF120:
	.ascii	"TIM_SetCompare4\000"
.LASF150:
	.ascii	"TIM_OC3NPolarityConfig\000"
.LASF131:
	.ascii	"TIM_OCPreload\000"
.LASF58:
	.ascii	"TIM_OCInitTypeDef\000"
.LASF54:
	.ascii	"TIM_OCPolarity\000"
.LASF133:
	.ascii	"TIM_OC3PreloadConfig\000"
.LASF178:
	.ascii	"TIM_GetFlagStatus\000"
.LASF220:
	.ascii	"TI2_Config\000"
.LASF136:
	.ascii	"TIM_OCFast\000"
.LASF97:
	.ascii	"TIM_CKD\000"
.LASF64:
	.ascii	"TIM_ICInitTypeDef\000"
.LASF179:
	.ascii	"TIM_FLAG\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF199:
	.ascii	"TIM_ExtTRGPrescaler\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF156:
	.ascii	"TIM_CCxNCmd\000"
.LASF184:
	.ascii	"itenable\000"
.LASF132:
	.ascii	"TIM_OC2PreloadConfig\000"
.LASF125:
	.ascii	"TIM_ForcedOC2Config\000"
.LASF111:
	.ascii	"TIM_OCStructInit\000"
.LASF91:
	.ascii	"TIM_UpdateRequestConfig\000"
.LASF191:
	.ascii	"TIM_SelectCCDMA\000"
.LASF95:
	.ascii	"TIM_OPMode\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF103:
	.ascii	"TIM_OC1Init\000"
.LASF130:
	.ascii	"TIM_OC1PreloadConfig\000"
.LASF214:
	.ascii	"TIM_IC1Polarity\000"
.LASF56:
	.ascii	"TIM_OCIdleState\000"
.LASF202:
	.ascii	"tmpsmcr\000"
.LASF138:
	.ascii	"TIM_OC3FastConfig\000"
.LASF75:
	.ascii	"TIMx\000"
.LASF123:
	.ascii	"TIM_ForcedAction\000"
.LASF161:
	.ascii	"TIM_ICStructInit\000"
.LASF173:
	.ascii	"TIM_SetIC4Prescaler\000"
.LASF188:
	.ascii	"TIM_DMABurstLength\000"
.LASF208:
	.ascii	"TIM_SlaveMode\000"
.LASF66:
	.ascii	"TIM_OSSIState\000"
.LASF82:
	.ascii	"tmpcr1\000"
.LASF43:
	.ascii	"TIM_TypeDef\000"
.LASF108:
	.ascii	"TIM_OC2Init\000"
.LASF203:
	.ascii	"TIM_ETRClockMode2Config\000"
.LASF165:
	.ascii	"TIM_GetCapture1\000"
.LASF166:
	.ascii	"TIM_GetCapture2\000"
.LASF167:
	.ascii	"TIM_GetCapture3\000"
.LASF168:
	.ascii	"TIM_GetCapture4\000"
.LASF53:
	.ascii	"TIM_Pulse\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF47:
	.ascii	"TIM_ClockDivision\000"
.LASF222:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF181:
	.ascii	"TIM_ClearFlag\000"
.LASF109:
	.ascii	"TIM_OC3Init\000"
.LASF37:
	.ascii	"BDTR\000"
.LASF193:
	.ascii	"TIM_ITRxExternalClockConfig\000"
.LASF197:
	.ascii	"ICFilter\000"
.LASF185:
	.ascii	"TIM_ClearITPendingBit\000"
.LASF33:
	.ascii	"CCR1\000"
.LASF34:
	.ascii	"CCR2\000"
.LASF35:
	.ascii	"CCR3\000"
.LASF36:
	.ascii	"CCR4\000"
.LASF25:
	.ascii	"CCMR1\000"
.LASF27:
	.ascii	"CCMR2\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF186:
	.ascii	"TIM_DMAConfig\000"
.LASF183:
	.ascii	"itstatus\000"
.LASF93:
	.ascii	"TIM_ARRPreloadConfig\000"
.LASF100:
	.ascii	"TIM_BDTRInitStruct\000"
.LASF106:
	.ascii	"tmpccer\000"
.LASF96:
	.ascii	"TIM_SetClockDivision\000"
.LASF137:
	.ascii	"TIM_OC2FastConfig\000"
.LASF70:
	.ascii	"TIM_BreakPolarity\000"
.LASF205:
	.ascii	"TIM_SelectOutputTrigger\000"
.LASF76:
	.ascii	"TIM_TimeBaseInitStruct\000"
.LASF112:
	.ascii	"TIM_SelectOCxM\000"
.LASF67:
	.ascii	"TIM_LOCKLevel\000"
.LASF98:
	.ascii	"TIM_Cmd\000"
.LASF83:
	.ascii	"TIM_SetCounter\000"
.LASF190:
	.ascii	"TIM_DMASource\000"
.LASF213:
	.ascii	"TIM_EncoderMode\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF62:
	.ascii	"TIM_ICPrescaler\000"
.LASF141:
	.ascii	"TIM_OCClear\000"
.LASF80:
	.ascii	"TIM_PSCReloadMode\000"
.LASF154:
	.ascii	"TIM_CCxCmd\000"
.LASF21:
	.ascii	"DIER\000"
.LASF88:
	.ascii	"TIM_GetPrescaler\000"
.LASF187:
	.ascii	"TIM_DMABase\000"
.LASF72:
	.ascii	"TIM_BDTRInitTypeDef\000"
.LASF216:
	.ascii	"TIM_SelectHallSensor\000"
.LASF176:
	.ascii	"TIM_GenerateEvent\000"
.LASF171:
	.ascii	"TIM_SetIC2Prescaler\000"
.LASF48:
	.ascii	"TIM_RepetitionCounter\000"
.LASF90:
	.ascii	"NewState\000"
.LASF157:
	.ascii	"TIM_CCxN\000"
.LASF69:
	.ascii	"TIM_Break\000"
.LASF55:
	.ascii	"TIM_OCNPolarity\000"
.LASF196:
	.ascii	"TIM_TIxExternalCLKSource\000"
.LASF79:
	.ascii	"Prescaler\000"
.LASF74:
	.ascii	"TIM_TimeBaseInit\000"
.LASF29:
	.ascii	"CCER\000"
.LASF89:
	.ascii	"TIM_UpdateDisableConfig\000"
.LASF92:
	.ascii	"TIM_UpdateSource\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF160:
	.ascii	"TIM_ICInitStruct\000"
.LASF221:
	.ascii	"TI3_Config\000"
.LASF45:
	.ascii	"TIM_CounterMode\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF212:
	.ascii	"TIM_EncoderInterfaceConfig\000"
.LASF81:
	.ascii	"TIM_CounterModeConfig\000"
.LASF115:
	.ascii	"Compare1\000"
.LASF117:
	.ascii	"Compare2\000"
.LASF119:
	.ascii	"Compare3\000"
.LASF19:
	.ascii	"SMCR\000"
.LASF84:
	.ascii	"Counter\000"
.LASF118:
	.ascii	"TIM_SetCompare3\000"
.LASF143:
	.ascii	"TIM_ClearOC3Ref\000"
.LASF121:
	.ascii	"Compare4\000"
.LASF110:
	.ascii	"TIM_OC4Init\000"
.LASF128:
	.ascii	"TIM_ForcedOC4Config\000"
.LASF218:
	.ascii	"TIM_Remap\000"
.LASF8:
	.ascii	"long long int\000"
.LASF217:
	.ascii	"TIM_RemapConfig\000"
.LASF87:
	.ascii	"TIM_GetCounter\000"
.LASF104:
	.ascii	"TIM_OCInitStruct\000"
.LASF201:
	.ascii	"ExtTRGFilter\000"
.LASF207:
	.ascii	"TIM_SelectSlaveMode\000"
.LASF215:
	.ascii	"TIM_IC2Polarity\000"
.LASF135:
	.ascii	"TIM_OC1FastConfig\000"
.LASF57:
	.ascii	"TIM_OCNIdleState\000"
.LASF211:
	.ascii	"TIM_ETRConfig\000"
.LASF146:
	.ascii	"TIM_OC1NPolarityConfig\000"
.LASF170:
	.ascii	"TIM_ICPSC\000"
.LASF177:
	.ascii	"TIM_EventSource\000"
.LASF124:
	.ascii	"tmpccmr1\000"
.LASF127:
	.ascii	"tmpccmr2\000"
.LASF59:
	.ascii	"TIM_Channel\000"
.LASF158:
	.ascii	"TIM_SelectCOM\000"
.LASF129:
	.ascii	"TIM_CCPreloadControl\000"
.LASF164:
	.ascii	"icoppositeselection\000"
.LASF192:
	.ascii	"TIM_InternalClockConfig\000"
.LASF46:
	.ascii	"TIM_Period\000"
.LASF169:
	.ascii	"TIM_SetIC1Prescaler\000"
.LASF152:
	.ascii	"TIM_SelectOCREFClear\000"
.LASF155:
	.ascii	"TIM_CCx\000"
.LASF144:
	.ascii	"TIM_ClearOC4Ref\000"
.LASF172:
	.ascii	"TIM_SetIC3Prescaler\000"
.LASF163:
	.ascii	"icoppositepolarity\000"
.LASF61:
	.ascii	"TIM_ICSelection\000"
.LASF198:
	.ascii	"TIM_ETRClockMode1Config\000"
.LASF105:
	.ascii	"tmpccmrx\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF94:
	.ascii	"TIM_SelectOnePulseMode\000"
.LASF194:
	.ascii	"TIM_InputTriggerSource\000"
.LASF50:
	.ascii	"TIM_OCMode\000"
.LASF17:
	.ascii	"RESERVED0\000"
.LASF18:
	.ascii	"RESERVED1\000"
.LASF20:
	.ascii	"RESERVED2\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF23:
	.ascii	"RESERVED4\000"
.LASF24:
	.ascii	"RESERVED5\000"
.LASF26:
	.ascii	"RESERVED6\000"
.LASF2:
	.ascii	"short int\000"
.LASF30:
	.ascii	"RESERVED8\000"
.LASF51:
	.ascii	"TIM_OutputState\000"
.LASF40:
	.ascii	"DMAR\000"
.LASF206:
	.ascii	"TIM_TRGOSource\000"
.LASF219:
	.ascii	"TI1_Config\000"
.LASF11:
	.ascii	"RESET\000"
.LASF65:
	.ascii	"TIM_OSSRState\000"
.LASF60:
	.ascii	"TIM_ICPolarity\000"
.LASF102:
	.ascii	"TIM_CtrlPWMOutputs\000"
.LASF99:
	.ascii	"TIM_BDTRConfig\000"
.LASF142:
	.ascii	"TIM_ClearOC2Ref\000"
.LASF195:
	.ascii	"TIM_TIxExternalClockConfig\000"
.LASF153:
	.ascii	"TIM_OCReferenceClear\000"
.LASF210:
	.ascii	"TIM_MasterSlaveMode\000"
.LASF71:
	.ascii	"TIM_AutomaticOutput\000"
.LASF85:
	.ascii	"TIM_SetAutoreload\000"
.LASF52:
	.ascii	"TIM_OutputNState\000"
.LASF189:
	.ascii	"TIM_DMACmd\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF77:
	.ascii	"TIM_TimeBaseStructInit\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF174:
	.ascii	"TIM_ITConfig\000"
.LASF122:
	.ascii	"TIM_ForcedOC1Config\000"
.LASF225:
	.ascii	"TI4_Config\000"
.LASF68:
	.ascii	"TIM_DeadTime\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF73:
	.ascii	"TIM_DeInit\000"
.LASF148:
	.ascii	"TIM_OC2NPolarityConfig\000"
.LASF31:
	.ascii	"RESERVED10\000"
.LASF32:
	.ascii	"RESERVED12\000"
.LASF38:
	.ascii	"RESERVED17\000"
.LASF39:
	.ascii	"RESERVED18\000"
.LASF41:
	.ascii	"RESERVED19\000"
.LASF151:
	.ascii	"TIM_OC4PolarityConfig\000"
.LASF101:
	.ascii	"TIM_BDTRStructInit\000"
.LASF140:
	.ascii	"TIM_ClearOC1Ref\000"
.LASF149:
	.ascii	"TIM_OC3PolarityConfig\000"
.LASF200:
	.ascii	"TIM_ExtTRGPolarity\000"
.LASF162:
	.ascii	"TIM_PWMIConfig\000"
.LASF49:
	.ascii	"TIM_TimeBaseInitTypeDef\000"
.LASF86:
	.ascii	"Autoreload\000"
.LASF182:
	.ascii	"TIM_GetITStatus\000"
.LASF0:
	.ascii	"signed char\000"
.LASF107:
	.ascii	"tmpcr2\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF42:
	.ascii	"RESERVED20\000"
.LASF175:
	.ascii	"TIM_IT\000"
.LASF126:
	.ascii	"TIM_ForcedOC3Config\000"
.LASF159:
	.ascii	"TIM_ICInit\000"
.LASF63:
	.ascii	"TIM_ICFilter\000"
.LASF223:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_tim.c\000"
.LASF180:
	.ascii	"bitstatus\000"
.LASF204:
	.ascii	"TIM_SelectInputTrigger\000"
.LASF28:
	.ascii	"RESERVED7\000"
.LASF78:
	.ascii	"TIM_PrescalerConfig\000"
.LASF224:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF209:
	.ascii	"TIM_SelectMasterSlaveMode\000"
.LASF147:
	.ascii	"TIM_OC2PolarityConfig\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
