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
	.file	"stm32f0xx_rcc.c"
	.text
.Ltext0:
	.section	.text.RCC_DeInit,"ax",%progbits
	.align	2
	.global	RCC_DeInit
	.code	16
	.thumb_func
	.type	RCC_DeInit, %function
RCC_DeInit:
.LFB32:
	ldr	r3, .L2
	ldr	r1, [r3]
	mov	r2, #1
	orr	r1, r2
	str	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r1, .L2+4
	and	r1, r0
	str	r1, [r3, #4]
	ldr	r0, [r3]
	ldr	r1, .L2+8
	and	r1, r0
	str	r1, [r3]
	ldr	r0, [r3]
	ldr	r1, .L2+12
	and	r1, r0
	str	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r1, .L2+16
	and	r1, r0
	str	r1, [r3, #4]
	ldr	r1, [r3, #44]
	mov	r0, #15
	bic	r1, r0
	str	r1, [r3, #44]
	ldr	r0, [r3, #48]
	ldr	r1, .L2+20
	and	r1, r0
	str	r1, [r3, #48]
	ldr	r1, [r3, #52]
	bic	r1, r2
	str	r1, [r3, #52]
	mov	r2, #0
	str	r2, [r3, #8]
	@ sp needed
	bx	lr
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
	ldr	r3, .L5
	mov	r2, #0
	strb	r2, [r3]
	strb	r0, [r3]
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073876994
.LFE33:
	.size	RCC_HSEConfig, .-RCC_HSEConfig
	.section	.text.RCC_AdjustHSICalibrationValue,"ax",%progbits
	.align	2
	.global	RCC_AdjustHSICalibrationValue
	.code	16
	.thumb_func
	.type	RCC_AdjustHSICalibrationValue, %function
RCC_AdjustHSICalibrationValue:
.LFB35:
	ldr	r3, .L8
	ldr	r2, [r3]
	mov	r1, #248
	bic	r2, r1
	lsl	r0, r0, #3
	orr	r0, r2
	str	r0, [r3]
	@ sp needed
	bx	lr
.L9:
	.align	2
.L8:
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
	cmp	r0, #0
	beq	.L11
	ldr	r3, .L13
	ldr	r1, [r3]
	mov	r2, #1
	orr	r2, r1
	str	r2, [r3]
	b	.L10
.L11:
	ldr	r3, .L13
	ldr	r2, [r3]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3]
.L10:
	@ sp needed
	bx	lr
.L14:
	.align	2
.L13:
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
	ldr	r3, .L16
	ldr	r2, [r3, #52]
	mov	r1, #248
	bic	r2, r1
	lsl	r0, r0, #3
	orr	r0, r2
	str	r0, [r3, #52]
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
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
	cmp	r0, #0
	beq	.L19
	ldr	r3, .L21
	ldr	r1, [r3, #52]
	mov	r2, #1
	orr	r2, r1
	str	r2, [r3, #52]
	b	.L18
.L19:
	ldr	r3, .L21
	ldr	r2, [r3, #52]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3, #52]
.L18:
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
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
	cmp	r0, #0
	beq	.L24
	ldr	r3, .L26
	ldr	r2, [r3, #52]
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3, #52]
	b	.L23
.L24:
	ldr	r3, .L26
	ldr	r1, [r3, #52]
	mov	r2, #4
	orr	r2, r1
	str	r2, [r3, #52]
.L23:
	@ sp needed
	bx	lr
.L27:
	.align	2
.L26:
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
	ldr	r3, .L29
	ldr	r2, [r3, #32]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3, #32]
	ldr	r2, [r3, #32]
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3, #32]
	ldr	r2, [r3, #32]
	orr	r0, r2
	str	r0, [r3, #32]
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
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
	ldr	r3, .L32
	ldr	r2, [r3, #32]
	mov	r1, #24
	bic	r2, r1
	str	r2, [r3, #32]
	ldr	r2, [r3, #32]
	orr	r0, r2
	str	r0, [r3, #32]
	@ sp needed
	bx	lr
.L33:
	.align	2
.L32:
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
	cmp	r0, #0
	beq	.L35
	ldr	r3, .L37
	ldr	r1, [r3, #36]
	mov	r2, #1
	orr	r2, r1
	str	r2, [r3, #36]
	b	.L34
.L35:
	ldr	r3, .L37
	ldr	r2, [r3, #36]
	mov	r1, #1
	bic	r2, r1
	str	r2, [r3, #36]
.L34:
	@ sp needed
	bx	lr
.L38:
	.align	2
.L37:
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
	push	{r4, lr}
.LCFI0:
	ldr	r3, .L40
	ldr	r4, [r3, #4]
	ldr	r2, .L40+4
	and	r2, r4
	str	r2, [r3, #4]
	ldr	r2, [r3, #4]
	orr	r1, r2
	orr	r0, r1
	str	r0, [r3, #4]
	@ sp needed
	pop	{r4, pc}
.L41:
	.align	2
.L40:
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
	cmp	r0, #0
	beq	.L43
	ldr	r3, .L45
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #17
	orr	r2, r1
	str	r2, [r3]
	b	.L42
.L43:
	ldr	r3, .L45
	ldr	r1, [r3]
	ldr	r2, .L45+4
	and	r2, r1
	str	r2, [r3]
.L42:
	@ sp needed
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r3, .L48
	ldr	r2, [r3, #44]
	mov	r1, #15
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3, #44]
	@ sp needed
	bx	lr
.L49:
	.align	2
.L48:
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
	cmp	r0, #0
	beq	.L51
	ldr	r3, .L53
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #12
	orr	r2, r1
	str	r2, [r3]
	b	.L50
.L51:
	ldr	r3, .L53
	ldr	r1, [r3]
	ldr	r2, .L53+4
	and	r2, r1
	str	r2, [r3]
.L50:
	@ sp needed
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L56
	strb	r0, [r3]
	@ sp needed
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r3, .L59
	ldr	r2, [r3, #4]
	mov	r1, #3
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L60:
	.align	2
.L59:
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
	ldr	r3, .L62
	ldr	r3, [r3, #4]
	mov	r0, #12
	and	r0, r3
	@ sp needed
	bx	lr
.L63:
	.align	2
.L62:
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
	ldr	r3, .L65
	ldr	r2, [r3, #4]
	mov	r1, #240
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L66:
	.align	2
.L65:
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
	ldr	r3, .L68
	ldr	r1, [r3, #4]
	ldr	r2, .L68+4
	and	r2, r1
	orr	r0, r2
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L69:
	.align	2
.L68:
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
	ldr	r3, .L71
	ldr	r1, [r3, #4]
	ldr	r2, .L71+4
	and	r2, r1
	str	r2, [r3, #4]
	ldr	r1, [r3, #4]
	lsl	r2, r0, #16
	lsr	r2, r2, #16
	orr	r2, r1
	str	r2, [r3, #4]
	ldr	r1, [r3, #48]
	ldr	r2, .L71+8
	and	r2, r1
	str	r2, [r3, #48]
	ldr	r2, [r3, #48]
	lsr	r0, r0, #16
	orr	r0, r2
	str	r0, [r3, #48]
	@ sp needed
	bx	lr
.L72:
	.align	2
.L71:
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
	ldr	r3, .L74
	ldr	r2, [r3, #48]
	mov	r1, #64
	bic	r2, r1
	str	r2, [r3, #48]
	ldr	r2, [r3, #48]
	orr	r0, r2
	str	r0, [r3, #48]
	@ sp needed
	bx	lr
.L75:
	.align	2
.L74:
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
	ldr	r3, .L77
	ldr	r2, [r3, #48]
	mov	r1, #16
	bic	r2, r1
	str	r2, [r3, #48]
	ldr	r2, [r3, #48]
	orr	r0, r2
	str	r0, [r3, #48]
	@ sp needed
	bx	lr
.L78:
	.align	2
.L77:
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
	ldr	r3, .L80
	ldr	r2, [r3, #48]
	mov	r1, #3
	bic	r2, r1
	str	r2, [r3, #48]
	ldr	r2, [r3, #48]
	orr	r0, r2
	str	r0, [r3, #48]
	@ sp needed
	bx	lr
.L81:
	.align	2
.L80:
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
	push	{r3, r4, r5, lr}
.LCFI1:
	mov	r4, r0
	ldr	r3, .L101
	ldr	r3, [r3, #4]
	mov	r2, #12
	and	r3, r2
	cmp	r3, #4
	beq	.L84
	cmp	r3, #8
	beq	.L85
	cmp	r3, #0
	bne	.L100
	ldr	r3, .L101+4
	str	r3, [r0]
	b	.L87
.L84:
	ldr	r3, .L101+4
	str	r3, [r0]
	b	.L87
.L85:
	ldr	r3, .L101
	ldr	r5, [r3, #4]
	ldr	r3, [r3, #4]
	lsl	r5, r5, #10
	lsr	r5, r5, #28
	add	r5, r5, #2
	lsl	r1, r3, #15
	bmi	.L88
	ldr	r3, .L101+8
	mul	r5, r3
	str	r5, [r0]
	b	.L87
.L88:
	ldr	r3, .L101
	ldr	r3, [r3, #44]
	mov	r1, #15
	and	r1, r3
	add	r1, r1, #1
	ldr	r0, .L101+4
	bl	__aeabi_uidiv
	mul	r5, r0
	str	r5, [r4]
	b	.L87
.L100:
	ldr	r3, .L101+4
	str	r3, [r0]
.L87:
	ldr	r3, .L101
	ldr	r2, [r3, #4]
	lsl	r2, r2, #24
	lsr	r2, r2, #28
	ldr	r1, .L101+12
	ldrb	r2, [r1, r2]
	uxtb	r2, r2
	ldr	r0, [r4]
	mov	r5, r0
	lsr	r5, r5, r2
	mov	r2, r5
	str	r5, [r4, #4]
	ldr	r5, [r3, #4]
	lsl	r5, r5, #21
	lsr	r5, r5, #29
	ldrb	r1, [r1, r5]
	uxtb	r1, r1
	lsr	r2, r2, r1
	str	r2, [r4, #8]
	ldr	r3, [r3, #48]
	lsl	r1, r3, #23
	bmi	.L89
	ldr	r3, .L101+16
	str	r3, [r4, #12]
	b	.L90
.L89:
	ldr	r3, .L101
	ldr	r3, [r3, #4]
	lsl	r5, r3, #17
	bmi	.L91
	lsr	r3, r2, #1
	str	r3, [r4, #12]
	b	.L90
.L91:
	lsr	r3, r2, #2
	str	r3, [r4, #12]
.L90:
	ldr	r3, .L101
	ldr	r3, [r3, #48]
	lsl	r1, r3, #25
	bmi	.L92
	ldr	r3, .L101+20
	str	r3, [r4, #16]
	b	.L93
.L92:
	mov	r3, #128
	lsl	r3, r3, #8
	str	r3, [r4, #16]
.L93:
	ldr	r3, .L101
	ldr	r3, [r3, #48]
	lsl	r5, r3, #27
	bmi	.L94
	ldr	r3, .L101+4
	str	r3, [r4, #20]
	b	.L95
.L94:
	str	r0, [r4, #20]
.L95:
	ldr	r3, .L101
	ldr	r3, [r3, #48]
	lsl	r1, r3, #30
	bne	.L96
	str	r2, [r4, #24]
	b	.L82
.L96:
	ldr	r3, .L101
	ldr	r3, [r3, #48]
	mov	r2, #3
	and	r3, r2
	cmp	r3, #1
	bne	.L98
	str	r0, [r4, #24]
	b	.L82
.L98:
	ldr	r3, .L101
	ldr	r3, [r3, #48]
	mov	r2, #3
	and	r3, r2
	cmp	r3, #2
	bne	.L99
	mov	r3, #128
	lsl	r3, r3, #8
	str	r3, [r4, #24]
	b	.L82
.L99:
	ldr	r3, .L101
	ldr	r3, [r3, #48]
	mov	r2, #3
	and	r3, r2
	cmp	r3, #3
	bne	.L82
	ldr	r3, .L101+4
	str	r3, [r4, #24]
.L82:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L102:
	.align	2
.L101:
	.word	1073876992
	.word	8000000
	.word	4000000
	.word	.LANCHOR0
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
	ldr	r3, .L104
	ldr	r2, [r3, #32]
	orr	r0, r2
	str	r0, [r3, #32]
	@ sp needed
	bx	lr
.L105:
	.align	2
.L104:
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
	cmp	r0, #0
	beq	.L107
	ldr	r3, .L109
	ldr	r1, [r3, #32]
	mov	r2, #128
	lsl	r2, r2, #8
	orr	r2, r1
	str	r2, [r3, #32]
	b	.L106
.L107:
	ldr	r3, .L109
	ldr	r1, [r3, #32]
	ldr	r2, .L109+4
	and	r2, r1
	str	r2, [r3, #32]
.L106:
	@ sp needed
	bx	lr
.L110:
	.align	2
.L109:
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
	cmp	r0, #0
	beq	.L112
	ldr	r3, .L114
	ldr	r1, [r3, #32]
	mov	r2, #128
	lsl	r2, r2, #9
	orr	r2, r1
	str	r2, [r3, #32]
	b	.L111
.L112:
	ldr	r3, .L114
	ldr	r1, [r3, #32]
	ldr	r2, .L114+4
	and	r2, r1
	str	r2, [r3, #32]
.L111:
	@ sp needed
	bx	lr
.L115:
	.align	2
.L114:
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
	cmp	r1, #0
	beq	.L117
	ldr	r3, .L119
	ldr	r2, [r3, #20]
	orr	r0, r2
	str	r0, [r3, #20]
	b	.L116
.L117:
	ldr	r3, .L119
	ldr	r2, [r3, #20]
	bic	r2, r0
	str	r2, [r3, #20]
.L116:
	@ sp needed
	bx	lr
.L120:
	.align	2
.L119:
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
	cmp	r1, #0
	beq	.L122
	ldr	r3, .L124
	ldr	r2, [r3, #24]
	orr	r0, r2
	str	r0, [r3, #24]
	b	.L121
.L122:
	ldr	r3, .L124
	ldr	r2, [r3, #24]
	bic	r2, r0
	str	r2, [r3, #24]
.L121:
	@ sp needed
	bx	lr
.L125:
	.align	2
.L124:
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
	cmp	r1, #0
	beq	.L127
	ldr	r3, .L129
	ldr	r2, [r3, #28]
	orr	r0, r2
	str	r0, [r3, #28]
	b	.L126
.L127:
	ldr	r3, .L129
	ldr	r2, [r3, #28]
	bic	r2, r0
	str	r2, [r3, #28]
.L126:
	@ sp needed
	bx	lr
.L130:
	.align	2
.L129:
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
	cmp	r1, #0
	beq	.L132
	ldr	r3, .L134
	ldr	r2, [r3, #40]
	orr	r0, r2
	str	r0, [r3, #40]
	b	.L131
.L132:
	ldr	r3, .L134
	ldr	r2, [r3, #40]
	bic	r2, r0
	str	r2, [r3, #40]
.L131:
	@ sp needed
	bx	lr
.L135:
	.align	2
.L134:
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
	cmp	r1, #0
	beq	.L137
	ldr	r3, .L139
	ldr	r2, [r3, #12]
	orr	r0, r2
	str	r0, [r3, #12]
	b	.L136
.L137:
	ldr	r3, .L139
	ldr	r2, [r3, #12]
	bic	r2, r0
	str	r2, [r3, #12]
.L136:
	@ sp needed
	bx	lr
.L140:
	.align	2
.L139:
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
	cmp	r1, #0
	beq	.L142
	ldr	r3, .L144
	ldr	r2, [r3, #16]
	orr	r0, r2
	str	r0, [r3, #16]
	b	.L141
.L142:
	ldr	r3, .L144
	ldr	r2, [r3, #16]
	bic	r2, r0
	str	r2, [r3, #16]
.L141:
	@ sp needed
	bx	lr
.L145:
	.align	2
.L144:
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
	cmp	r1, #0
	beq	.L147
	ldr	r3, .L149
	ldrb	r2, [r3]
	orr	r0, r2
	strb	r0, [r3]
	b	.L146
.L147:
	ldr	r3, .L149
	ldrb	r2, [r3]
	bic	r2, r0
	strb	r2, [r3]
.L146:
	@ sp needed
	bx	lr
.L150:
	.align	2
.L149:
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
	lsr	r3, r0, #5
	bne	.L152
	ldr	r3, .L156
	ldr	r1, [r3]
	b	.L153
.L152:
	cmp	r3, #1
	bne	.L154
	ldr	r3, .L156
	ldr	r1, [r3, #32]
	b	.L153
.L154:
	cmp	r3, #2
	bne	.L155
	ldr	r3, .L156
	ldr	r1, [r3, #36]
	b	.L153
.L155:
	ldr	r3, .L156
	ldr	r1, [r3, #52]
.L153:
	mov	r3, #31
	and	r3, r0
	mov	r2, #1
	mov	r0, r2
	lsl	r0, r0, r3
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L157:
	.align	2
.L156:
	.word	1073876992
.LFE67:
	.size	RCC_GetFlagStatus, .-RCC_GetFlagStatus
	.section	.text.RCC_WaitForHSEStartUp,"ax",%progbits
	.align	2
	.global	RCC_WaitForHSEStartUp
	.code	16
	.thumb_func
	.type	RCC_WaitForHSEStartUp, %function
RCC_WaitForHSEStartUp:
.LFB34:
	push	{r4, lr}
.LCFI2:
	sub	sp, sp, #8
.LCFI3:
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r4, #160
	lsl	r4, r4, #3
.L160:
	mov	r0, #17
	bl	RCC_GetFlagStatus
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	cmp	r3, r4
	beq	.L159
	cmp	r0, #0
	beq	.L160
.L159:
	mov	r0, #17
	bl	RCC_GetFlagStatus
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.LFE34:
	.size	RCC_WaitForHSEStartUp, .-RCC_WaitForHSEStartUp
	.section	.text.RCC_ClearFlag,"ax",%progbits
	.align	2
	.global	RCC_ClearFlag
	.code	16
	.thumb_func
	.type	RCC_ClearFlag, %function
RCC_ClearFlag:
.LFB68:
	ldr	r3, .L162
	ldr	r1, [r3, #36]
	mov	r2, #128
	lsl	r2, r2, #17
	orr	r2, r1
	str	r2, [r3, #36]
	@ sp needed
	bx	lr
.L163:
	.align	2
.L162:
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
	ldr	r3, .L165
	ldr	r3, [r3, #8]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L166:
	.align	2
.L165:
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
	ldr	r3, .L168
	strb	r0, [r3]
	@ sp needed
	bx	lr
.L169:
	.align	2
.L168:
	.word	1073877002
.LFE70:
	.size	RCC_ClearITPendingBit, .-RCC_ClearITPendingBit
	.section	.data.APBAHBPrescTable,"aw",%progbits
	.align	2
	.set	.LANCHOR0,. + 0
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI0-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI1-.LFB56
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
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI2-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.align	2
.LEFDE76:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_rcc.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2d5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x1
	.4byte	.LASF40
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x92
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xc4
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x100
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x122
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x13c
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x15b
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x170
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x190
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x1aa
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1c2
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x1e1
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1f9
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x20f
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x22a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x248
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x2b1
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2cd
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2e2
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x301
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x31e
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x337
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x34b
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x361
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x390
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x43e
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x44f
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x466
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x48a
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x4ae
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x4d5
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x4f3
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x514
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x538
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x56b
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x591
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF35
	.byte	0x1
	.byte	0xde
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x5c5
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x5d8
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x5f9
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
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
	.byte	0
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
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
	.4byte	.LFB34
	.4byte	.LFE34
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
.LASF18:
	.ascii	"RCC_PCLKConfig\000"
.LASF38:
	.ascii	"RCC_ClearITPendingBit\000"
.LASF24:
	.ascii	"RCC_RTCCLKConfig\000"
.LASF0:
	.ascii	"RCC_DeInit\000"
.LASF37:
	.ascii	"RCC_GetITStatus\000"
.LASF15:
	.ascii	"RCC_SYSCLKConfig\000"
.LASF13:
	.ascii	"RCC_ClockSecuritySystemCmd\000"
.LASF28:
	.ascii	"RCC_APB2PeriphClockCmd\000"
.LASF36:
	.ascii	"RCC_ClearFlag\000"
.LASF5:
	.ascii	"RCC_HSI14Cmd\000"
.LASF26:
	.ascii	"RCC_BackupResetCmd\000"
.LASF32:
	.ascii	"RCC_APB1PeriphResetCmd\000"
.LASF25:
	.ascii	"RCC_RTCCLKCmd\000"
.LASF11:
	.ascii	"RCC_PLLCmd\000"
.LASF30:
	.ascii	"RCC_AHBPeriphResetCmd\000"
.LASF33:
	.ascii	"RCC_ITConfig\000"
.LASF12:
	.ascii	"RCC_PREDIV1Config\000"
.LASF9:
	.ascii	"RCC_LSICmd\000"
.LASF21:
	.ascii	"RCC_I2CCLKConfig\000"
.LASF3:
	.ascii	"RCC_HSICmd\000"
.LASF35:
	.ascii	"RCC_WaitForHSEStartUp\000"
.LASF10:
	.ascii	"RCC_PLLConfig\000"
.LASF27:
	.ascii	"RCC_AHBPeriphClockCmd\000"
.LASF19:
	.ascii	"RCC_ADCCLKConfig\000"
.LASF1:
	.ascii	"RCC_HSEConfig\000"
.LASF39:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF22:
	.ascii	"RCC_USARTCLKConfig\000"
.LASF40:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_rcc.c\000"
.LASF23:
	.ascii	"RCC_GetClocksFreq\000"
.LASF4:
	.ascii	"RCC_AdjustHSI14CalibrationValue\000"
.LASF16:
	.ascii	"RCC_GetSYSCLKSource\000"
.LASF8:
	.ascii	"RCC_LSEDriveConfig\000"
.LASF14:
	.ascii	"RCC_MCOConfig\000"
.LASF29:
	.ascii	"RCC_APB1PeriphClockCmd\000"
.LASF2:
	.ascii	"RCC_AdjustHSICalibrationValue\000"
.LASF6:
	.ascii	"RCC_HSI14ADCRequestCmd\000"
.LASF34:
	.ascii	"RCC_GetFlagStatus\000"
.LASF17:
	.ascii	"RCC_HCLKConfig\000"
.LASF20:
	.ascii	"RCC_CECCLKConfig\000"
.LASF7:
	.ascii	"RCC_LSEConfig\000"
.LASF31:
	.ascii	"RCC_APB2PeriphResetCmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
