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
	.file	"stm32f0xx_tim.c"
	.text
.Ltext0:
	.section	.text.TI1_Config,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	TI1_Config, %function
TI1_Config:
.LFB121:
	push	{r4, r5, r6, lr}
.LCFI0:
	ldrh	r4, [r0, #32]
	mov	r5, #1
	bic	r4, r5
	strh	r4, [r0, #32]
	ldrh	r5, [r0, #24]
	ldrh	r4, [r0, #32]
	mov	r6, #243
	bic	r5, r6
	orr	r2, r5
	lsl	r3, r3, #4
	orr	r2, r3
	uxth	r2, r2
	mov	r3, #10
	bic	r4, r3
	mov	r3, r4
	mov	r4, #1
	orr	r3, r4
	orr	r1, r3
	strh	r2, [r0, #24]
	strh	r1, [r0, #32]
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE121:
	.size	TI1_Config, .-TI1_Config
	.section	.text.TI2_Config,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	TI2_Config, %function
TI2_Config:
.LFB122:
	push	{r4, r5, r6, lr}
.LCFI1:
	ldrh	r4, [r0, #32]
	mov	r5, #16
	bic	r4, r5
	strh	r4, [r0, #32]
	ldrh	r6, [r0, #24]
	ldrh	r4, [r0, #32]
	ldr	r5, .L3
	and	r6, r5
	lsl	r5, r2, #8
	mov	r2, r6
	orr	r2, r5
	uxth	r2, r2
	lsl	r3, r3, #12
	orr	r2, r3
	uxth	r2, r2
	mov	r3, #160
	bic	r4, r3
	mov	r3, #16
	orr	r4, r3
	lsl	r3, r1, #4
	mov	r1, r4
	orr	r1, r3
	uxth	r1, r1
	strh	r2, [r0, #24]
	strh	r1, [r0, #32]
	@ sp needed
	pop	{r4, r5, r6, pc}
.L4:
	.align	2
.L3:
	.word	3327
.LFE122:
	.size	TI2_Config, .-TI2_Config
	.section	.text.TIM_DeInit,"ax",%progbits
	.align	2
	.global	TIM_DeInit
	.code	16
	.thumb_func
	.type	TIM_DeInit, %function
TIM_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI2:
	ldr	r3, .L14
	cmp	r0, r3
	bne	.L6
	mov	r4, #128
	lsl	r4, r4, #4
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
	b	.L5
.L6:
	mov	r3, #128
	lsl	r3, r3, #23
	cmp	r0, r3
	bne	.L8
	mov	r0, #1
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, #1
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	b	.L5
.L8:
	ldr	r3, .L14+4
	cmp	r0, r3
	bne	.L9
	mov	r0, #2
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, #2
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	b	.L5
.L9:
	ldr	r3, .L14+8
	cmp	r0, r3
	bne	.L10
	mov	r0, #16
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, #16
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	b	.L5
.L10:
	ldr	r3, .L14+12
	cmp	r0, r3
	bne	.L11
	mov	r4, #128
	lsl	r4, r4, #1
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	b	.L5
.L11:
	ldr	r3, .L14+16
	cmp	r0, r3
	bne	.L12
	mov	r4, #128
	lsl	r4, r4, #9
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
	b	.L5
.L12:
	ldr	r3, .L14+20
	cmp	r0, r3
	bne	.L13
	mov	r4, #128
	lsl	r4, r4, #10
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
	b	.L5
.L13:
	ldr	r3, .L14+24
	cmp	r0, r3
	bne	.L5
	mov	r4, #128
	lsl	r4, r4, #11
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
.L5:
	@ sp needed
	pop	{r4, pc}
.L15:
	.align	2
.L14:
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
	push	{r4, lr}
.LCFI3:
	ldrh	r3, [r0]
	uxth	r3, r3
	ldr	r2, .L23
	cmp	r0, r2
	beq	.L17
	mov	r2, #128
	lsl	r2, r2, #23
	cmp	r0, r2
	beq	.L17
	ldr	r2, .L23+4
	cmp	r0, r2
	bne	.L18
.L17:
	mov	r2, #112
	bic	r3, r2
	ldrh	r2, [r1, #2]
	orr	r3, r2
.L18:
	ldr	r2, .L23+8
	cmp	r0, r2
	beq	.L19
	ldrh	r2, [r1, #8]
	ldr	r4, .L23+12
	and	r3, r4
	orr	r3, r2
	strh	r3, [r0]
	ldr	r3, [r1, #4]
	str	r3, [r0, #44]
	ldrh	r3, [r1]
	strh	r3, [r0, #40]
	ldr	r3, .L23
	cmp	r0, r3
	beq	.L20
	ldr	r3, .L23+16
	cmp	r0, r3
	beq	.L20
	ldr	r3, .L23+20
	cmp	r0, r3
	beq	.L20
	ldr	r3, .L23+24
	cmp	r0, r3
	bne	.L21
.L20:
	ldrb	r3, [r1, #10]
	strh	r3, [r0, #48]
.L21:
	mov	r3, #1
	strh	r3, [r0, #20]
	b	.L22
.L19:
	ldr	r2, .L23+8
	strh	r3, [r2]
	ldr	r3, [r1, #4]
	str	r3, [r2, #44]
	ldrh	r3, [r1]
	strh	r3, [r2, #40]
	b	.L21
.L22:
	@ sp needed
	pop	{r4, pc}
.L24:
	.align	2
.L23:
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
	mov	r3, #1
	neg	r3, r3
	str	r3, [r0, #4]
	mov	r3, #0
	strh	r3, [r0]
	strh	r3, [r0, #8]
	strh	r3, [r0, #2]
	strb	r3, [r0, #10]
	@ sp needed
	bx	lr
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
	strh	r1, [r0, #40]
	strh	r2, [r0, #20]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0]
	mov	r2, #112
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0]
	@ sp needed
	bx	lr
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
	str	r1, [r0, #36]
	@ sp needed
	bx	lr
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
	str	r1, [r0, #44]
	@ sp needed
	bx	lr
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
	ldr	r0, [r0, #36]
	@ sp needed
	bx	lr
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
	ldrh	r0, [r0, #40]
	uxth	r0, r0
	@ sp needed
	bx	lr
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
	cmp	r1, #0
	beq	.L33
	ldrh	r2, [r0]
	mov	r3, #2
	orr	r3, r2
	strh	r3, [r0]
	b	.L32
.L33:
	ldrh	r3, [r0]
	mov	r2, #2
	bic	r3, r2
	strh	r3, [r0]
.L32:
	@ sp needed
	bx	lr
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
	cmp	r1, #0
	beq	.L36
	ldrh	r2, [r0]
	mov	r3, #4
	orr	r3, r2
	strh	r3, [r0]
	b	.L35
.L36:
	ldrh	r3, [r0]
	mov	r2, #4
	bic	r3, r2
	strh	r3, [r0]
.L35:
	@ sp needed
	bx	lr
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
	cmp	r1, #0
	beq	.L39
	ldrh	r2, [r0]
	mov	r3, #128
	orr	r3, r2
	strh	r3, [r0]
	b	.L38
.L39:
	ldrh	r3, [r0]
	mov	r2, #128
	bic	r3, r2
	strh	r3, [r0]
.L38:
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0]
	mov	r2, #8
	bic	r3, r2
	strh	r3, [r0]
	ldrh	r3, [r0]
	orr	r1, r3
	strh	r1, [r0]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0]
	ldr	r3, .L43
	and	r3, r2
	strh	r3, [r0]
	ldrh	r3, [r0]
	orr	r1, r3
	strh	r1, [r0]
	@ sp needed
	bx	lr
.L44:
	.align	2
.L43:
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
	cmp	r1, #0
	beq	.L46
	ldrh	r2, [r0]
	mov	r3, #1
	orr	r3, r2
	strh	r3, [r0]
	b	.L45
.L46:
	ldrh	r3, [r0]
	mov	r2, #1
	bic	r3, r2
	strh	r3, [r0]
.L45:
	@ sp needed
	bx	lr
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
	ldrh	r2, [r1, #2]
	ldrh	r3, [r1]
	orr	r2, r3
	ldrh	r3, [r1, #4]
	orr	r2, r3
	ldrh	r3, [r1, #6]
	orr	r2, r3
	ldrh	r3, [r1, #8]
	orr	r2, r3
	ldrh	r3, [r1, #10]
	orr	r2, r3
	ldrh	r3, [r1, #12]
	orr	r2, r3
	mov	r3, #68
	strh	r2, [r0, r3]
	@ sp needed
	bx	lr
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
	mov	r3, #0
	strh	r3, [r0]
	strh	r3, [r0, #2]
	strh	r3, [r0, #4]
	strh	r3, [r0, #6]
	strh	r3, [r0, #8]
	strh	r3, [r0, #10]
	strh	r3, [r0, #12]
	@ sp needed
	bx	lr
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
	cmp	r1, #0
	beq	.L51
	mov	r3, #68
	ldrh	r1, [r0, r3]
	mov	r2, #128
	lsl	r2, r2, #8
	orr	r2, r1
	strh	r2, [r0, r3]
	b	.L50
.L51:
	mov	r3, #68
	ldrh	r2, [r0, r3]
	lsl	r2, r2, #17
	lsr	r2, r2, #17
	strh	r2, [r0, r3]
.L50:
	@ sp needed
	bx	lr
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
	push	{r4, r5, r6, lr}
.LCFI4:
	ldrh	r3, [r0, #32]
	mov	r2, #1
	bic	r3, r2
	strh	r3, [r0, #32]
	ldrh	r5, [r0, #32]
	ldrh	r2, [r0, #4]
	uxth	r2, r2
	ldrh	r4, [r0, #24]
	mov	r3, #115
	bic	r4, r3
	ldrh	r3, [r1]
	orr	r4, r3
	mov	r3, #2
	bic	r5, r3
	ldrh	r6, [r1, #2]
	ldrh	r3, [r1, #12]
	orr	r3, r6
	orr	r3, r5
	ldr	r5, .L56
	cmp	r0, r5
	beq	.L54
	ldr	r5, .L56+4
	cmp	r0, r5
	beq	.L54
	ldr	r5, .L56+8
	cmp	r0, r5
	beq	.L54
	ldr	r5, .L56+12
	cmp	r0, r5
	bne	.L55
.L54:
	mov	r5, #8
	bic	r3, r5
	ldrh	r5, [r1, #14]
	orr	r3, r5
	mov	r5, #4
	bic	r3, r5
	ldrh	r5, [r1, #4]
	orr	r3, r5
	ldr	r5, .L56+16
	and	r2, r5
	ldrh	r6, [r1, #18]
	ldrh	r5, [r1, #16]
	orr	r5, r6
	orr	r2, r5
.L55:
	strh	r2, [r0, #4]
	strh	r4, [r0, #24]
	ldr	r2, [r1, #8]
	str	r2, [r0, #52]
	strh	r3, [r0, #32]
	@ sp needed
	pop	{r4, r5, r6, pc}
.L57:
	.align	2
.L56:
	.word	1073818624
	.word	1073823744
	.word	1073824768
	.word	1073825792
	.word	-769
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
	push	{r4, r5, lr}
.LCFI5:
	ldrh	r3, [r0, #32]
	mov	r2, #16
	bic	r3, r2
	strh	r3, [r0, #32]
	ldrh	r3, [r0, #32]
	ldrh	r2, [r0, #4]
	uxth	r2, r2
	ldrh	r5, [r0, #24]
	ldr	r4, .L60
	and	r4, r5
	ldrh	r5, [r1]
	lsl	r5, r5, #8
	orr	r4, r5
	uxth	r4, r4
	mov	r5, #32
	bic	r3, r5
	ldrh	r5, [r1, #12]
	lsl	r5, r5, #4
	orr	r3, r5
	uxth	r3, r3
	ldrh	r5, [r1, #2]
	lsl	r5, r5, #4
	orr	r3, r5
	uxth	r3, r3
	ldr	r5, .L60+4
	cmp	r0, r5
	bne	.L59
	mov	r5, #128
	bic	r3, r5
	ldrh	r5, [r1, #14]
	lsl	r5, r5, #4
	orr	r3, r5
	ldr	r5, .L60+8
	and	r3, r5
	ldrh	r5, [r1, #4]
	lsl	r5, r5, #4
	orr	r3, r5
	uxth	r3, r3
	ldr	r5, .L60+12
	and	r2, r5
	ldrh	r5, [r1, #16]
	lsl	r5, r5, #2
	orr	r2, r5
	uxth	r2, r2
	ldrh	r5, [r1, #18]
	lsl	r5, r5, #2
	orr	r2, r5
	uxth	r2, r2
.L59:
	strh	r2, [r0, #4]
	strh	r4, [r0, #24]
	ldr	r2, [r1, #8]
	str	r2, [r0, #56]
	strh	r3, [r0, #32]
	@ sp needed
	pop	{r4, r5, pc}
.L61:
	.align	2
.L60:
	.word	-29441
	.word	1073818624
	.word	65471
	.word	-3073
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
	push	{r4, r5, lr}
.LCFI6:
	ldrh	r2, [r0, #32]
	ldr	r3, .L64
	and	r3, r2
	strh	r3, [r0, #32]
	ldrh	r5, [r0, #32]
	ldrh	r2, [r0, #4]
	uxth	r2, r2
	ldrh	r4, [r0, #28]
	mov	r3, #115
	bic	r4, r3
	ldrh	r3, [r1]
	orr	r4, r3
	ldr	r3, .L64+4
	and	r3, r5
	ldrh	r5, [r1, #12]
	lsl	r5, r5, #8
	orr	r3, r5
	uxth	r3, r3
	ldrh	r5, [r1, #2]
	lsl	r5, r5, #8
	orr	r3, r5
	uxth	r3, r3
	ldr	r5, .L64+8
	cmp	r0, r5
	bne	.L63
	ldr	r5, .L64+12
	and	r3, r5
	ldrh	r5, [r1, #14]
	lsl	r5, r5, #8
	orr	r3, r5
	ldr	r5, .L64+16
	and	r3, r5
	ldrh	r5, [r1, #4]
	lsl	r5, r5, #8
	orr	r3, r5
	uxth	r3, r3
	ldr	r5, .L64+20
	and	r2, r5
	ldrh	r5, [r1, #16]
	lsl	r5, r5, #4
	orr	r2, r5
	uxth	r2, r2
	ldrh	r5, [r1, #18]
	lsl	r5, r5, #4
	orr	r2, r5
	uxth	r2, r2
.L63:
	strh	r2, [r0, #4]
	strh	r4, [r0, #28]
	ldr	r2, [r1, #8]
	str	r2, [r0, #60]
	strh	r3, [r0, #32]
	@ sp needed
	pop	{r4, r5, pc}
.L65:
	.align	2
.L64:
	.word	-257
	.word	-513
	.word	1073818624
	.word	-2049
	.word	64511
	.word	-12289
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
	push	{r4, r5, lr}
.LCFI7:
	ldrh	r2, [r0, #32]
	ldr	r3, .L68
	and	r3, r2
	strh	r3, [r0, #32]
	ldrh	r5, [r0, #32]
	ldrh	r3, [r0, #4]
	uxth	r3, r3
	ldrh	r4, [r0, #28]
	ldr	r2, .L68+4
	and	r4, r2
	ldrh	r2, [r1]
	lsl	r2, r2, #8
	orr	r4, r2
	uxth	r4, r4
	ldr	r2, .L68+8
	and	r2, r5
	ldrh	r5, [r1, #12]
	lsl	r5, r5, #12
	orr	r2, r5
	uxth	r2, r2
	ldrh	r5, [r1, #2]
	lsl	r5, r5, #12
	orr	r2, r5
	uxth	r2, r2
	ldr	r5, .L68+12
	cmp	r0, r5
	bne	.L67
	ldr	r5, .L68+16
	and	r3, r5
	ldrh	r5, [r1, #16]
	lsl	r5, r5, #6
	orr	r3, r5
	uxth	r3, r3
.L67:
	strh	r3, [r0, #4]
	strh	r4, [r0, #28]
	ldr	r3, [r1, #8]
	str	r3, [r0, #64]
	strh	r2, [r0, #32]
	@ sp needed
	pop	{r4, r5, pc}
.L69:
	.align	2
.L68:
	.word	-4097
	.word	-29441
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
	mov	r3, #0
	strh	r3, [r0]
	strh	r3, [r0, #2]
	strh	r3, [r0, #4]
	str	r3, [r0, #8]
	strh	r3, [r0, #12]
	strh	r3, [r0, #14]
	strh	r3, [r0, #16]
	strh	r3, [r0, #18]
	@ sp needed
	bx	lr
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
	push	{r4, r5, lr}
.LCFI8:
	mov	r5, r0
	add	r5, r5, #24
	ldrh	r3, [r0, #32]
	mov	r4, #1
	lsl	r4, r4, r1
	bic	r3, r4
	strh	r3, [r0, #32]
	mov	r3, #8
	mov	r0, r1
	bic	r0, r3
	bne	.L72
	lsr	r1, r1, #1
	add	r1, r5, r1
	ldr	r3, [r1]
	mov	r0, #112
	bic	r3, r0
	str	r3, [r1]
	ldr	r3, [r1]
	orr	r2, r3
	str	r2, [r1]
	b	.L71
.L72:
	sub	r1, r1, #4
	uxth	r1, r1
	lsr	r1, r1, #1
	add	r1, r1, r5
	ldr	r0, [r1]
	ldr	r3, .L74
	and	r3, r0
	str	r3, [r1]
	ldr	r3, [r1]
	lsl	r2, r2, #8
	uxth	r2, r2
	orr	r2, r3
	str	r2, [r1]
.L71:
	@ sp needed
	pop	{r4, r5, pc}
.L75:
	.align	2
.L74:
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
	str	r1, [r0, #52]
	@ sp needed
	bx	lr
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
	str	r1, [r0, #56]
	@ sp needed
	bx	lr
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
	str	r1, [r0, #60]
	@ sp needed
	bx	lr
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
	str	r1, [r0, #64]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #24]
	mov	r2, #112
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #24]
	ldr	r3, .L82
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
.L83:
	.align	2
.L82:
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
	ldrh	r3, [r0, #28]
	mov	r2, #112
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #28]
	ldr	r3, .L86
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
.L87:
	.align	2
.L86:
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
	cmp	r1, #0
	beq	.L89
	ldrh	r2, [r0, #4]
	mov	r3, #1
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L88
.L89:
	ldrh	r3, [r0, #4]
	mov	r2, #1
	bic	r3, r2
	strh	r3, [r0, #4]
.L88:
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #24]
	mov	r2, #8
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #24]
	ldr	r3, .L93
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
.L94:
	.align	2
.L93:
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
	ldrh	r3, [r0, #28]
	mov	r2, #8
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #28]
	ldr	r3, .L97
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
.L98:
	.align	2
.L97:
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
	ldrh	r3, [r0, #24]
	mov	r2, #4
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #24]
	ldr	r3, .L101
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
.L102:
	.align	2
.L101:
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
	ldrh	r3, [r0, #28]
	mov	r2, #4
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #28]
	ldr	r3, .L105
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
.L106:
	.align	2
.L105:
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
	ldrh	r3, [r0, #24]
	mov	r2, #128
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #24]
	lsl	r3, r3, #17
	lsr	r3, r3, #17
	lsl	r1, r1, #8
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #28]
	mov	r2, #128
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #28]
	lsl	r3, r3, #17
	lsr	r3, r3, #17
	lsl	r1, r1, #8
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #32]
	mov	r2, #2
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #32]
	mov	r2, #8
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #32]
	mov	r3, #32
	bic	r2, r3
	lsl	r3, r1, #4
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #32]
	mov	r3, #128
	bic	r2, r3
	lsl	r3, r1, #4
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #32]
	ldr	r3, .L116
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
.L117:
	.align	2
.L116:
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
	ldrh	r2, [r0, #32]
	ldr	r3, .L119
	and	r2, r3
	lsl	r3, r1, #8
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
.L120:
	.align	2
.L119:
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
	ldrh	r2, [r0, #32]
	ldr	r3, .L122
	and	r2, r3
	lsl	r3, r1, #12
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	bx	lr
.L123:
	.align	2
.L122:
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
	ldrh	r3, [r0, #8]
	mov	r2, #8
	bic	r3, r2
	strh	r3, [r0, #8]
	ldrh	r3, [r0, #8]
	orr	r1, r3
	strh	r1, [r0, #8]
	@ sp needed
	bx	lr
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
	push	{r4, lr}
.LCFI9:
	ldrh	r3, [r0, #32]
	mov	r4, #1
	lsl	r4, r4, r1
	bic	r3, r4
	strh	r3, [r0, #32]
	ldrh	r3, [r0, #32]
	lsl	r2, r2, r1
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	pop	{r4, pc}
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
	push	{r4, lr}
.LCFI10:
	ldrh	r3, [r0, #32]
	mov	r4, #4
	lsl	r4, r4, r1
	bic	r3, r4
	strh	r3, [r0, #32]
	ldrh	r3, [r0, #32]
	lsl	r2, r2, r1
	mov	r1, r2
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #32]
	@ sp needed
	pop	{r4, pc}
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
	cmp	r1, #0
	beq	.L128
	ldrh	r2, [r0, #4]
	mov	r3, #4
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L127
.L128:
	ldrh	r3, [r0, #4]
	mov	r2, #4
	bic	r3, r2
	strh	r3, [r0, #4]
.L127:
	@ sp needed
	bx	lr
.LFE87:
	.size	TIM_SelectCOM, .-TIM_SelectCOM
	.section	.text.TIM_ICStructInit,"ax",%progbits
	.align	2
	.global	TIM_ICStructInit
	.code	16
	.thumb_func
	.type	TIM_ICStructInit, %function
TIM_ICStructInit:
.LFB89:
	mov	r3, #0
	strh	r3, [r0]
	strh	r3, [r0, #2]
	mov	r2, #1
	strh	r2, [r0, #4]
	strh	r3, [r0, #6]
	strh	r3, [r0, #8]
	@ sp needed
	bx	lr
.LFE89:
	.size	TIM_ICStructInit, .-TIM_ICStructInit
	.section	.text.TIM_GetCapture1,"ax",%progbits
	.align	2
	.global	TIM_GetCapture1
	.code	16
	.thumb_func
	.type	TIM_GetCapture1, %function
TIM_GetCapture1:
.LFB91:
	ldr	r0, [r0, #52]
	@ sp needed
	bx	lr
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
	ldr	r0, [r0, #56]
	@ sp needed
	bx	lr
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
	ldr	r0, [r0, #60]
	@ sp needed
	bx	lr
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
	ldr	r0, [r0, #64]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #24]
	mov	r2, #12
	bic	r3, r2
	strh	r3, [r0, #24]
	ldrh	r3, [r0, #24]
	orr	r1, r3
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #24]
	ldr	r3, .L137
	and	r3, r2
	strh	r3, [r0, #24]
	ldrh	r3, [r0, #24]
	lsl	r1, r1, #8
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #24]
	@ sp needed
	bx	lr
.L138:
	.align	2
.L137:
	.word	-3073
.LFE96:
	.size	TIM_SetIC2Prescaler, .-TIM_SetIC2Prescaler
	.section	.text.TIM_PWMIConfig,"ax",%progbits
	.align	2
	.global	TIM_PWMIConfig
	.code	16
	.thumb_func
	.type	TIM_PWMIConfig, %function
TIM_PWMIConfig:
.LFB90:
	push	{r4, r5, r6, lr}
.LCFI11:
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6}
.LCFI12:
	mov	r5, r0
	mov	r4, r1
	ldrh	r1, [r1, #2]
	neg	r3, r1
	adc	r3, r3, r1
	lsl	r3, r3, #1
	mov	r9, r3
	ldrh	r6, [r4, #4]
	sub	r3, r6, #1
	sub	r2, r3, #1
	sbc	r3, r3, r2
	mov	r2, #2
	sub	r2, r2, r3
	mov	r8, r2
	ldrh	r3, [r4]
	cmp	r3, #0
	bne	.L142
	ldrh	r3, [r4, #8]
	mov	r2, r6
	bl	TI1_Config
	ldrh	r1, [r4, #6]
	mov	r0, r5
	bl	TIM_SetIC1Prescaler
	ldrh	r3, [r4, #8]
	mov	r0, r5
	mov	r1, r9
	mov	r2, r8
	bl	TI2_Config
	ldrh	r1, [r4, #6]
	mov	r0, r5
	bl	TIM_SetIC2Prescaler
	b	.L139
.L142:
	ldrh	r3, [r4, #8]
	mov	r2, r6
	bl	TI2_Config
	ldrh	r1, [r4, #6]
	mov	r0, r5
	bl	TIM_SetIC2Prescaler
	ldrh	r3, [r4, #8]
	mov	r0, r5
	mov	r1, r9
	mov	r2, r8
	bl	TI1_Config
	ldrh	r1, [r4, #6]
	mov	r0, r5
	bl	TIM_SetIC1Prescaler
.L139:
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r4, r5, r6, pc}
.LFE90:
	.size	TIM_PWMIConfig, .-TIM_PWMIConfig
	.section	.text.TIM_SetIC3Prescaler,"ax",%progbits
	.align	2
	.global	TIM_SetIC3Prescaler
	.code	16
	.thumb_func
	.type	TIM_SetIC3Prescaler, %function
TIM_SetIC3Prescaler:
.LFB97:
	ldrh	r3, [r0, #28]
	mov	r2, #12
	bic	r3, r2
	strh	r3, [r0, #28]
	ldrh	r3, [r0, #28]
	orr	r1, r3
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
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
	ldrh	r2, [r0, #28]
	ldr	r3, .L148
	and	r3, r2
	strh	r3, [r0, #28]
	ldrh	r3, [r0, #28]
	lsl	r1, r1, #8
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #28]
	@ sp needed
	bx	lr
.L149:
	.align	2
.L148:
	.word	-3073
.LFE98:
	.size	TIM_SetIC4Prescaler, .-TIM_SetIC4Prescaler
	.section	.text.TIM_ICInit,"ax",%progbits
	.align	2
	.global	TIM_ICInit
	.code	16
	.thumb_func
	.type	TIM_ICInit, %function
TIM_ICInit:
.LFB88:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI13:
	mov	r4, r0
	mov	r5, r1
	ldrh	r3, [r1]
	cmp	r3, #0
	bne	.L151
	ldrh	r1, [r1, #2]
	ldrh	r2, [r5, #4]
	ldrh	r3, [r5, #8]
	bl	TI1_Config
	ldrh	r1, [r5, #6]
	mov	r0, r4
	bl	TIM_SetIC1Prescaler
	b	.L150
.L151:
	cmp	r3, #4
	bne	.L153
	ldrh	r1, [r1, #2]
	ldrh	r2, [r5, #4]
	ldrh	r3, [r5, #8]
	bl	TI2_Config
	ldrh	r1, [r5, #6]
	mov	r0, r4
	bl	TIM_SetIC2Prescaler
	b	.L150
.L153:
	cmp	r3, #8
	bne	.L154
	ldrh	r3, [r1, #2]
	ldrh	r1, [r1, #4]
	ldrh	r6, [r5, #8]
.LBB6:
.LBB7:
	ldrh	r0, [r0, #32]
	ldr	r2, .L155
	and	r2, r0
	strh	r2, [r4, #32]
	ldrh	r2, [r4, #28]
	ldrh	r0, [r4, #32]
	mov	r7, #243
	bic	r2, r7
	lsl	r6, r6, #4
	orr	r2, r6
	uxth	r2, r2
	orr	r2, r1
	lsl	r3, r3, #8
	ldr	r1, .L155+4
	and	r1, r0
	orr	r1, r3
	uxth	r1, r1
	mov	r3, #128
	lsl	r3, r3, #1
	orr	r3, r1
	strh	r2, [r4, #28]
	strh	r3, [r4, #32]
.LBE7:
.LBE6:
	ldrh	r1, [r5, #6]
	mov	r0, r4
	bl	TIM_SetIC3Prescaler
	b	.L150
.L154:
	ldrh	r3, [r1, #2]
	ldrh	r6, [r1, #4]
	ldrh	r1, [r1, #8]
.LBB8:
.LBB9:
	ldrh	r0, [r0, #32]
	ldr	r2, .L155+8
	and	r2, r0
	strh	r2, [r4, #32]
	ldrh	r7, [r4, #28]
	ldrh	r0, [r4, #32]
	ldr	r2, .L155+12
	and	r2, r7
	lsl	r6, r6, #8
	orr	r2, r6
	uxth	r2, r2
	lsl	r1, r1, #12
	orr	r2, r1
	uxth	r2, r2
	lsl	r3, r3, #12
	ldr	r1, .L155+16
	and	r1, r0
	orr	r1, r3
	uxth	r1, r1
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r1
	strh	r2, [r4, #28]
	strh	r3, [r4, #32]
.LBE9:
.LBE8:
	ldrh	r1, [r5, #6]
	mov	r0, r4
	bl	TIM_SetIC4Prescaler
.L150:
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L156:
	.align	2
.L155:
	.word	-257
	.word	-2561
	.word	-4097
	.word	3327
	.word	24575
.LFE88:
	.size	TIM_ICInit, .-TIM_ICInit
	.section	.text.TIM_ITConfig,"ax",%progbits
	.align	2
	.global	TIM_ITConfig
	.code	16
	.thumb_func
	.type	TIM_ITConfig, %function
TIM_ITConfig:
.LFB99:
	cmp	r2, #0
	beq	.L158
	ldrh	r3, [r0, #12]
	orr	r1, r3
	strh	r1, [r0, #12]
	b	.L157
.L158:
	ldrh	r3, [r0, #12]
	bic	r3, r1
	strh	r3, [r0, #12]
.L157:
	@ sp needed
	bx	lr
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
	strh	r1, [r0, #20]
	@ sp needed
	bx	lr
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
	ldrh	r0, [r0, #16]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
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
	mvn	r1, r1
	uxth	r1, r1
	strh	r1, [r0, #16]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #16]
	ldrh	r0, [r0, #12]
	uxth	r2, r0
	mov	r0, #0
	tst	r3, r1
	beq	.L164
	and	r1, r2
	sub	r2, r1, #1
	sbc	r1, r1, r2
	uxtb	r0, r1
.L164:
	@ sp needed
	bx	lr
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
	mvn	r1, r1
	uxth	r1, r1
	strh	r1, [r0, #16]
	@ sp needed
	bx	lr
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
	orr	r1, r2
	mov	r3, #72
	strh	r1, [r0, r3]
	@ sp needed
	bx	lr
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
	cmp	r2, #0
	beq	.L169
	ldrh	r3, [r0, #12]
	orr	r1, r3
	strh	r1, [r0, #12]
	b	.L168
.L169:
	ldrh	r3, [r0, #12]
	bic	r3, r1
	strh	r3, [r0, #12]
.L168:
	@ sp needed
	bx	lr
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
	cmp	r1, #0
	beq	.L172
	ldrh	r2, [r0, #4]
	mov	r3, #8
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L171
.L172:
	ldrh	r3, [r0, #4]
	mov	r2, #8
	bic	r3, r2
	strh	r3, [r0, #4]
.L171:
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #8]
	mov	r2, #7
	bic	r3, r2
	strh	r3, [r0, #8]
	@ sp needed
	bx	lr
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
.LBB12:
.LBB13:
	ldrh	r3, [r0, #8]
	mov	r2, #112
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #8]
.LBE13:
.LBE12:
	ldrh	r2, [r0, #8]
	mov	r3, #7
	orr	r3, r2
	strh	r3, [r0, #8]
	@ sp needed
	bx	lr
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
	push	{r3, r4, r5, lr}
.LCFI14:
	mov	r4, r0
	sub	r5, r1, #0
	cmp	r5, #96
	bne	.L177
	mov	r1, r2
	mov	r2, #1
	bl	TI2_Config
	b	.L178
.L177:
	mov	r1, r2
	mov	r2, #1
	bl	TI1_Config
.L178:
.LBB16:
.LBB17:
	ldrh	r3, [r4, #8]
	mov	r2, #112
	bic	r3, r2
	orr	r5, r3
	strh	r5, [r4, #8]
.LBE17:
.LBE16:
	ldrh	r2, [r4, #8]
	mov	r3, #7
	orr	r3, r2
	strh	r3, [r4, #8]
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE110:
	.size	TIM_TIxExternalClockConfig, .-TIM_TIxExternalClockConfig
	.section	.text.TIM_SelectInputTrigger,"ax",%progbits
	.align	2
	.global	TIM_SelectInputTrigger
	.code	16
	.thumb_func
	.type	TIM_SelectInputTrigger, %function
TIM_SelectInputTrigger:
.LFB113:
	ldrh	r3, [r0, #8]
	mov	r2, #112
	bic	r3, r2
	orr	r1, r3
	strh	r1, [r0, #8]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #4]
	mov	r2, #112
	bic	r3, r2
	strh	r3, [r0, #4]
	ldrh	r3, [r0, #4]
	orr	r1, r3
	strh	r1, [r0, #4]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #8]
	mov	r2, #7
	bic	r3, r2
	strh	r3, [r0, #8]
	ldrh	r3, [r0, #8]
	orr	r1, r3
	strh	r1, [r0, #8]
	@ sp needed
	bx	lr
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
	ldrh	r3, [r0, #8]
	mov	r2, #128
	bic	r3, r2
	strh	r3, [r0, #8]
	ldrh	r3, [r0, #8]
	orr	r1, r3
	strh	r1, [r0, #8]
	@ sp needed
	bx	lr
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
	push	{r4, r5, lr}
.LCFI15:
	ldrh	r5, [r0, #8]
	mov	r4, #255
	and	r4, r5
	orr	r1, r4
	orr	r2, r1
	lsl	r3, r3, #8
	orr	r2, r3
	uxth	r2, r2
	strh	r2, [r0, #8]
	@ sp needed
	pop	{r4, r5, pc}
.LFE117:
	.size	TIM_ETRConfig, .-TIM_ETRConfig
	.section	.text.TIM_ETRClockMode1Config,"ax",%progbits
	.align	2
	.global	TIM_ETRClockMode1Config
	.code	16
	.thumb_func
	.type	TIM_ETRClockMode1Config, %function
TIM_ETRClockMode1Config:
.LFB111:
	push	{r4, lr}
.LCFI16:
	mov	r4, r0
	bl	TIM_ETRConfig
	ldrh	r3, [r4, #8]
	mov	r2, #119
	bic	r3, r2
	orr	r3, r2
	strh	r3, [r4, #8]
	@ sp needed
	pop	{r4, pc}
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
	push	{r4, lr}
.LCFI17:
	mov	r4, r0
	bl	TIM_ETRConfig
	ldrh	r2, [r4, #8]
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	strh	r3, [r4, #8]
	@ sp needed
	pop	{r4, pc}
.LFE112:
	.size	TIM_ETRClockMode2Config, .-TIM_ETRClockMode2Config
	.section	.text.TIM_EncoderInterfaceConfig,"ax",%progbits
	.align	2
	.global	TIM_EncoderInterfaceConfig
	.code	16
	.thumb_func
	.type	TIM_EncoderInterfaceConfig, %function
TIM_EncoderInterfaceConfig:
.LFB118:
	push	{r4, r5, r6, r7, lr}
.LCFI18:
	ldrh	r4, [r0, #8]
	ldrh	r6, [r0, #24]
	ldrh	r5, [r0, #32]
	mov	r7, #7
	bic	r4, r7
	orr	r1, r4
	ldr	r4, .L187
	and	r4, r6
	mov	r6, #2
	add	r6, r6, #255
	orr	r4, r6
	mov	r6, #170
	bic	r5, r6
	orr	r2, r5
	lsl	r3, r3, #4
	orr	r2, r3
	uxth	r2, r2
	strh	r1, [r0, #8]
	strh	r4, [r0, #24]
	strh	r2, [r0, #32]
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L188:
	.align	2
.L187:
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
	cmp	r1, #0
	beq	.L190
	ldrh	r2, [r0, #4]
	mov	r3, #128
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L189
.L190:
	ldrh	r3, [r0, #4]
	mov	r2, #128
	bic	r3, r2
	strh	r3, [r0, #4]
.L189:
	@ sp needed
	bx	lr
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
	mov	r3, #80
	strh	r1, [r0, r3]
	@ sp needed
	bx	lr
.LFE120:
	.size	TIM_RemapConfig, .-TIM_RemapConfig
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
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.byte	0x4
	.4byte	.LCFI0-.LFB121
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
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
	.byte	0x4
	.4byte	.LCFI1-.LFB122
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI2-.LFB32
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
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
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
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
	.4byte	.LCFI4-.LFB50
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
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI5-.LFB51
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
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
	.byte	0x4
	.4byte	.LCFI6-.LFB52
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI7-.LFB53
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI8-.LFB55
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
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
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
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
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
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
	.align	2
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.align	2
.LEFDE96:
.LSFDE98:
	.4byte	.LEFDE98-.LASFDE98
.LASFDE98:
	.4byte	.Lframe0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.align	2
.LEFDE98:
.LSFDE100:
	.4byte	.LEFDE100-.LASFDE100
.LASFDE100:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.align	2
.LEFDE100:
.LSFDE102:
	.4byte	.LEFDE102-.LASFDE102
.LASFDE102:
	.4byte	.Lframe0
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.align	2
.LEFDE102:
.LSFDE104:
	.4byte	.LEFDE104-.LASFDE104
.LASFDE104:
	.4byte	.Lframe0
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.align	2
.LEFDE104:
.LSFDE106:
	.4byte	.LEFDE106-.LASFDE106
.LASFDE106:
	.4byte	.Lframe0
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.align	2
.LEFDE106:
.LSFDE108:
	.4byte	.LEFDE108-.LASFDE108
.LASFDE108:
	.4byte	.Lframe0
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.align	2
.LEFDE108:
.LSFDE110:
	.4byte	.LEFDE110-.LASFDE110
.LASFDE110:
	.4byte	.Lframe0
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.byte	0x4
	.4byte	.LCFI9-.LFB85
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE110:
.LSFDE112:
	.4byte	.LEFDE112-.LASFDE112
.LASFDE112:
	.4byte	.Lframe0
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.byte	0x4
	.4byte	.LCFI10-.LFB86
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE112:
.LSFDE114:
	.4byte	.LEFDE114-.LASFDE114
.LASFDE114:
	.4byte	.Lframe0
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.align	2
.LEFDE114:
.LSFDE116:
	.4byte	.LEFDE116-.LASFDE116
.LASFDE116:
	.4byte	.Lframe0
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.align	2
.LEFDE116:
.LSFDE118:
	.4byte	.LEFDE118-.LASFDE118
.LASFDE118:
	.4byte	.Lframe0
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.align	2
.LEFDE118:
.LSFDE120:
	.4byte	.LEFDE120-.LASFDE120
.LASFDE120:
	.4byte	.Lframe0
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.align	2
.LEFDE120:
.LSFDE122:
	.4byte	.LEFDE122-.LASFDE122
.LASFDE122:
	.4byte	.Lframe0
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.align	2
.LEFDE122:
.LSFDE124:
	.4byte	.LEFDE124-.LASFDE124
.LASFDE124:
	.4byte	.Lframe0
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.align	2
.LEFDE124:
.LSFDE126:
	.4byte	.LEFDE126-.LASFDE126
.LASFDE126:
	.4byte	.Lframe0
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.align	2
.LEFDE126:
.LSFDE128:
	.4byte	.LEFDE128-.LASFDE128
.LASFDE128:
	.4byte	.Lframe0
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.align	2
.LEFDE128:
.LSFDE130:
	.4byte	.LEFDE130-.LASFDE130
.LASFDE130:
	.4byte	.Lframe0
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.byte	0x4
	.4byte	.LCFI11-.LFB90
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
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x18
	.byte	0x88
	.uleb128 0x6
	.byte	0x89
	.uleb128 0x5
	.align	2
.LEFDE130:
.LSFDE132:
	.4byte	.LEFDE132-.LASFDE132
.LASFDE132:
	.4byte	.Lframe0
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.align	2
.LEFDE132:
.LSFDE134:
	.4byte	.LEFDE134-.LASFDE134
.LASFDE134:
	.4byte	.Lframe0
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.align	2
.LEFDE134:
.LSFDE136:
	.4byte	.LEFDE136-.LASFDE136
.LASFDE136:
	.4byte	.Lframe0
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.byte	0x4
	.4byte	.LCFI13-.LFB88
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
.LEFDE136:
.LSFDE138:
	.4byte	.LEFDE138-.LASFDE138
.LASFDE138:
	.4byte	.Lframe0
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.align	2
.LEFDE138:
.LSFDE140:
	.4byte	.LEFDE140-.LASFDE140
.LASFDE140:
	.4byte	.Lframe0
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.align	2
.LEFDE140:
.LSFDE142:
	.4byte	.LEFDE142-.LASFDE142
.LASFDE142:
	.4byte	.Lframe0
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.align	2
.LEFDE142:
.LSFDE144:
	.4byte	.LEFDE144-.LASFDE144
.LASFDE144:
	.4byte	.Lframe0
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.align	2
.LEFDE144:
.LSFDE146:
	.4byte	.LEFDE146-.LASFDE146
.LASFDE146:
	.4byte	.Lframe0
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.align	2
.LEFDE146:
.LSFDE148:
	.4byte	.LEFDE148-.LASFDE148
.LASFDE148:
	.4byte	.Lframe0
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.align	2
.LEFDE148:
.LSFDE150:
	.4byte	.LEFDE150-.LASFDE150
.LASFDE150:
	.4byte	.Lframe0
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.align	2
.LEFDE150:
.LSFDE152:
	.4byte	.LEFDE152-.LASFDE152
.LASFDE152:
	.4byte	.Lframe0
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.align	2
.LEFDE152:
.LSFDE154:
	.4byte	.LEFDE154-.LASFDE154
.LASFDE154:
	.4byte	.Lframe0
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.align	2
.LEFDE154:
.LSFDE156:
	.4byte	.LEFDE156-.LASFDE156
.LASFDE156:
	.4byte	.Lframe0
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.align	2
.LEFDE156:
.LSFDE158:
	.4byte	.LEFDE158-.LASFDE158
.LASFDE158:
	.4byte	.Lframe0
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.align	2
.LEFDE158:
.LSFDE160:
	.4byte	.LEFDE160-.LASFDE160
.LASFDE160:
	.4byte	.Lframe0
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.byte	0x4
	.4byte	.LCFI14-.LFB110
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
.LEFDE160:
.LSFDE162:
	.4byte	.LEFDE162-.LASFDE162
.LASFDE162:
	.4byte	.Lframe0
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.align	2
.LEFDE162:
.LSFDE164:
	.4byte	.LEFDE164-.LASFDE164
.LASFDE164:
	.4byte	.Lframe0
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.align	2
.LEFDE164:
.LSFDE166:
	.4byte	.LEFDE166-.LASFDE166
.LASFDE166:
	.4byte	.Lframe0
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.align	2
.LEFDE166:
.LSFDE168:
	.4byte	.LEFDE168-.LASFDE168
.LASFDE168:
	.4byte	.Lframe0
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.align	2
.LEFDE168:
.LSFDE170:
	.4byte	.LEFDE170-.LASFDE170
.LASFDE170:
	.4byte	.Lframe0
	.4byte	.LFB117
	.4byte	.LFE117-.LFB117
	.byte	0x4
	.4byte	.LCFI15-.LFB117
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE170:
.LSFDE172:
	.4byte	.LEFDE172-.LASFDE172
.LASFDE172:
	.4byte	.Lframe0
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.byte	0x4
	.4byte	.LCFI16-.LFB111
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE172:
.LSFDE174:
	.4byte	.LEFDE174-.LASFDE174
.LASFDE174:
	.4byte	.Lframe0
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.byte	0x4
	.4byte	.LCFI17-.LFB112
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE174:
.LSFDE176:
	.4byte	.LEFDE176-.LASFDE176
.LASFDE176:
	.4byte	.Lframe0
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.byte	0x4
	.4byte	.LCFI18-.LFB118
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
	.align	2
.LEFDE176:
.LSFDE178:
	.4byte	.LEFDE178-.LASFDE178
.LASFDE178:
	.4byte	.Lframe0
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.align	2
.LEFDE178:
.LSFDE180:
	.4byte	.LEFDE180-.LASFDE180
.LASFDE180:
	.4byte	.Lframe0
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.align	2
.LEFDE180:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_tim.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x696
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x1
	.4byte	.LASF93
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.2byte	0xbf9
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.2byte	0xc1d
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xbf
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.byte	0xfc
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x12e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x142
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x15a
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x172
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x181
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x190
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x19f
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1b0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x1ce
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x1e8
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x204
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x21a
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x22e
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x268
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x280
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x293
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x2db
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x32d
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x380
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x40e
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x432
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x45f
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x46e
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x47d
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x48c
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x49e
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x4b7
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x4d1
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x4eb
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x503
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x51e
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x537
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x550
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x56a
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x584
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x59f
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x5ba
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x5d5
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x5f0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x60b
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x625
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x63f
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x659
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x672
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x68a
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x6a3
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x6bb
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x6d4
	.4byte	.LFB82
	.4byte	.LFE82-.LFB82
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x6ee
	.4byte	.LFB83
	.4byte	.LFE83-.LFB83
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x707
	.4byte	.LFB84
	.4byte	.LFE84-.LFB84
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x71f
	.4byte	.LFB85
	.4byte	.LFE85-.LFB85
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x73c
	.4byte	.LFB86
	.4byte	.LFE86-.LFB86
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x755
	.4byte	.LFB87
	.4byte	.LFE87-.LFB87
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x7db
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x825
	.4byte	.LFB91
	.4byte	.LFE91-.LFB91
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x833
	.4byte	.LFB92
	.4byte	.LFE92-.LFB92
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x841
	.4byte	.LFB93
	.4byte	.LFE93-.LFB93
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x84f
	.4byte	.LFB94
	.4byte	.LFE94-.LFB94
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x863
	.4byte	.LFB95
	.4byte	.LFE95-.LFB95
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x87a
	.4byte	.LFB96
	.4byte	.LFE96-.LFB96
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x7ee
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x891
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x8a8
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF68
	.byte	0x1
	.2byte	0xc42
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF69
	.byte	0x1
	.2byte	0xc66
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x7a1
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x8dc
	.4byte	.LFB99
	.4byte	.LFE99-.LFB99
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x904
	.4byte	.LFB100
	.4byte	.LFE100-.LFB100
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x927
	.4byte	.LFB101
	.4byte	.LFE101-.LFB101
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x954
	.4byte	.LFB102
	.4byte	.LFE102-.LFB102
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x973
	.4byte	.LFB103
	.4byte	.LFE103-.LFB103
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x99f
	.4byte	.LFB104
	.4byte	.LFE104-.LFB104
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x9b9
	.4byte	.LFB105
	.4byte	.LFE105-.LFB105
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x9d3
	.4byte	.LFB106
	.4byte	.LFE106-.LFB106
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x9ed
	.4byte	.LFB107
	.4byte	.LFE107-.LFB107
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF80
	.byte	0x1
	.2byte	0xa14
	.4byte	.LFB108
	.4byte	.LFE108-.LFB108
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF94
	.byte	0x1
	.2byte	0xad7
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF81
	.byte	0x1
	.2byte	0xa27
	.4byte	.LFB109
	.4byte	.LFE109-.LFB109
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF82
	.byte	0x1
	.2byte	0xa42
	.4byte	.LFB110
	.4byte	.LFE110-.LFB110
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	0x5bb
	.4byte	.LFB113
	.4byte	.LFE113-.LFB113
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF83
	.byte	0x1
	.2byte	0xafe
	.4byte	.LFB114
	.4byte	.LFE114-.LFB114
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF84
	.byte	0x1
	.2byte	0xb16
	.4byte	.LFB115
	.4byte	.LFE115-.LFB115
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF85
	.byte	0x1
	.2byte	0xb2c
	.4byte	.LFB116
	.4byte	.LFE116-.LFB116
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF86
	.byte	0x1
	.2byte	0xb4a
	.4byte	.LFB117
	.4byte	.LFE117-.LFB117
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF87
	.byte	0x1
	.2byte	0xa6a
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF88
	.byte	0x1
	.2byte	0xa96
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF89
	.byte	0x1
	.2byte	0xb81
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF90
	.byte	0x1
	.2byte	0xbad
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF91
	.byte	0x1
	.2byte	0xbdb
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
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
	.uleb128 0xb
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
	.uleb128 0xb
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2ec
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB121
	.4byte	.LFE121-.LFB121
	.4byte	.LFB122
	.4byte	.LFE122-.LFB122
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
	.4byte	.LFB89
	.4byte	.LFE89-.LFB89
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
	.4byte	.LFB90
	.4byte	.LFE90-.LFB90
	.4byte	.LFB97
	.4byte	.LFE97-.LFB97
	.4byte	.LFB98
	.4byte	.LFE98-.LFB98
	.4byte	.LFB88
	.4byte	.LFE88-.LFB88
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
	.4byte	.LFB111
	.4byte	.LFE111-.LFB111
	.4byte	.LFB112
	.4byte	.LFE112-.LFB112
	.4byte	.LFB118
	.4byte	.LFE118-.LFB118
	.4byte	.LFB119
	.4byte	.LFE119-.LFB119
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB121
	.4byte	.LFE121
	.4byte	.LFB122
	.4byte	.LFE122
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
	.4byte	.LFB89
	.4byte	.LFE89
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
	.4byte	.LFB90
	.4byte	.LFE90
	.4byte	.LFB97
	.4byte	.LFE97
	.4byte	.LFB98
	.4byte	.LFE98
	.4byte	.LFB88
	.4byte	.LFE88
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
	.4byte	.LFB111
	.4byte	.LFE111
	.4byte	.LFB112
	.4byte	.LFE112
	.4byte	.LFB118
	.4byte	.LFE118
	.4byte	.LFB119
	.4byte	.LFE119
	.4byte	.LFB120
	.4byte	.LFE120
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF79:
	.ascii	"TIM_SelectCCDMA\000"
.LASF78:
	.ascii	"TIM_DMACmd\000"
.LASF92:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF58:
	.ascii	"TIM_ICStructInit\000"
.LASF13:
	.ascii	"TIM_ARRPreloadConfig\000"
.LASF10:
	.ascii	"TIM_GetPrescaler\000"
.LASF30:
	.ascii	"TIM_ForcedOC1Config\000"
.LASF84:
	.ascii	"TIM_SelectSlaveMode\000"
.LASF59:
	.ascii	"TIM_GetCapture1\000"
.LASF2:
	.ascii	"TIM_DeInit\000"
.LASF17:
	.ascii	"TIM_BDTRConfig\000"
.LASF75:
	.ascii	"TIM_GetITStatus\000"
.LASF61:
	.ascii	"TIM_GetCapture3\000"
.LASF19:
	.ascii	"TIM_CtrlPWMOutputs\000"
.LASF62:
	.ascii	"TIM_GetCapture4\000"
.LASF54:
	.ascii	"TIM_SelectOCREFClear\000"
.LASF27:
	.ascii	"TIM_SetCompare2\000"
.LASF31:
	.ascii	"TIM_ForcedOC2Config\000"
.LASF74:
	.ascii	"TIM_ClearFlag\000"
.LASF29:
	.ascii	"TIM_SetCompare4\000"
.LASF26:
	.ascii	"TIM_SetCompare1\000"
.LASF16:
	.ascii	"TIM_Cmd\000"
.LASF28:
	.ascii	"TIM_SetCompare3\000"
.LASF1:
	.ascii	"TI2_Config\000"
.LASF94:
	.ascii	"TIM_SelectInputTrigger\000"
.LASF86:
	.ascii	"TIM_ETRConfig\000"
.LASF20:
	.ascii	"TIM_OC1Init\000"
.LASF32:
	.ascii	"TIM_ForcedOC3Config\000"
.LASF90:
	.ascii	"TIM_SelectHallSensor\000"
.LASF46:
	.ascii	"TIM_ClearOC4Ref\000"
.LASF6:
	.ascii	"TIM_CounterModeConfig\000"
.LASF67:
	.ascii	"TIM_SetIC4Prescaler\000"
.LASF70:
	.ascii	"TIM_ICInit\000"
.LASF7:
	.ascii	"TIM_SetCounter\000"
.LASF71:
	.ascii	"TIM_ITConfig\000"
.LASF89:
	.ascii	"TIM_EncoderInterfaceConfig\000"
.LASF33:
	.ascii	"TIM_ForcedOC4Config\000"
.LASF38:
	.ascii	"TIM_OC4PreloadConfig\000"
.LASF48:
	.ascii	"TIM_OC1NPolarityConfig\000"
.LASF0:
	.ascii	"TI1_Config\000"
.LASF12:
	.ascii	"TIM_UpdateRequestConfig\000"
.LASF60:
	.ascii	"TIM_GetCapture2\000"
.LASF36:
	.ascii	"TIM_OC2PreloadConfig\000"
.LASF3:
	.ascii	"TIM_TimeBaseInit\000"
.LASF64:
	.ascii	"TIM_SetIC2Prescaler\000"
.LASF42:
	.ascii	"TIM_OC4FastConfig\000"
.LASF52:
	.ascii	"TIM_OC3NPolarityConfig\000"
.LASF21:
	.ascii	"TIM_OC2Init\000"
.LASF50:
	.ascii	"TIM_OC2NPolarityConfig\000"
.LASF55:
	.ascii	"TIM_CCxCmd\000"
.LASF91:
	.ascii	"TIM_RemapConfig\000"
.LASF68:
	.ascii	"TI3_Config\000"
.LASF77:
	.ascii	"TIM_DMAConfig\000"
.LASF65:
	.ascii	"TIM_PWMIConfig\000"
.LASF18:
	.ascii	"TIM_BDTRStructInit\000"
.LASF56:
	.ascii	"TIM_CCxNCmd\000"
.LASF85:
	.ascii	"TIM_SelectMasterSlaveMode\000"
.LASF93:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_tim.c\000"
.LASF63:
	.ascii	"TIM_SetIC1Prescaler\000"
.LASF43:
	.ascii	"TIM_ClearOC1Ref\000"
.LASF53:
	.ascii	"TIM_OC4PolarityConfig\000"
.LASF11:
	.ascii	"TIM_UpdateDisableConfig\000"
.LASF24:
	.ascii	"TIM_OCStructInit\000"
.LASF83:
	.ascii	"TIM_SelectOutputTrigger\000"
.LASF73:
	.ascii	"TIM_GetFlagStatus\000"
.LASF8:
	.ascii	"TIM_SetAutoreload\000"
.LASF66:
	.ascii	"TIM_SetIC3Prescaler\000"
.LASF40:
	.ascii	"TIM_OC2FastConfig\000"
.LASF80:
	.ascii	"TIM_InternalClockConfig\000"
.LASF22:
	.ascii	"TIM_OC3Init\000"
.LASF14:
	.ascii	"TIM_SelectOnePulseMode\000"
.LASF51:
	.ascii	"TIM_OC3PolarityConfig\000"
.LASF45:
	.ascii	"TIM_ClearOC3Ref\000"
.LASF47:
	.ascii	"TIM_OC1PolarityConfig\000"
.LASF41:
	.ascii	"TIM_OC3FastConfig\000"
.LASF5:
	.ascii	"TIM_PrescalerConfig\000"
.LASF57:
	.ascii	"TIM_SelectCOM\000"
.LASF49:
	.ascii	"TIM_OC2PolarityConfig\000"
.LASF25:
	.ascii	"TIM_SelectOCxM\000"
.LASF44:
	.ascii	"TIM_ClearOC2Ref\000"
.LASF34:
	.ascii	"TIM_CCPreloadControl\000"
.LASF82:
	.ascii	"TIM_TIxExternalClockConfig\000"
.LASF15:
	.ascii	"TIM_SetClockDivision\000"
.LASF69:
	.ascii	"TI4_Config\000"
.LASF76:
	.ascii	"TIM_ClearITPendingBit\000"
.LASF39:
	.ascii	"TIM_OC1FastConfig\000"
.LASF88:
	.ascii	"TIM_ETRClockMode2Config\000"
.LASF35:
	.ascii	"TIM_OC1PreloadConfig\000"
.LASF81:
	.ascii	"TIM_ITRxExternalClockConfig\000"
.LASF37:
	.ascii	"TIM_OC3PreloadConfig\000"
.LASF72:
	.ascii	"TIM_GenerateEvent\000"
.LASF87:
	.ascii	"TIM_ETRClockMode1Config\000"
.LASF4:
	.ascii	"TIM_TimeBaseStructInit\000"
.LASF23:
	.ascii	"TIM_OC4Init\000"
.LASF9:
	.ascii	"TIM_GetCounter\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
