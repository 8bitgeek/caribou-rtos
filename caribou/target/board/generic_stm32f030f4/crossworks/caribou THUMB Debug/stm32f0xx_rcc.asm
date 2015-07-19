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
	.file	"stm32f0xx_rcc.c"
	.text
.Ltext0:
	.section	.text.RCC_DeInit,"ax",%progbits
	.align	1
	.global	RCC_DeInit
	.code	16
	.thumb_func
	.type	RCC_DeInit, %function
RCC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_rcc.c"
	.loc 1 147 0
	.loc 1 149 0
	ldr	r3, .L2
	mov	r2, #1
	ldr	r1, [r3]
	.loc 1 174 0
	@ sp needed
	.loc 1 149 0
	orr	r1, r2
	str	r1, [r3]
	.loc 1 152 0
	ldr	r0, [r3, #4]
	ldr	r1, .L2+4
	and	r1, r0
	str	r1, [r3, #4]
	.loc 1 155 0
	ldr	r0, [r3]
	ldr	r1, .L2+8
	and	r1, r0
	str	r1, [r3]
	.loc 1 158 0
	ldr	r0, [r3]
	ldr	r1, .L2+12
	and	r1, r0
	str	r1, [r3]
	.loc 1 161 0
	ldr	r0, [r3, #4]
	ldr	r1, .L2+16
	and	r1, r0
	str	r1, [r3, #4]
	.loc 1 164 0
	ldr	r1, [r3, #44]
	mov	r0, #15
	bic	r1, r0
	str	r1, [r3, #44]
	.loc 1 167 0
	ldr	r0, [r3, #48]
	ldr	r1, .L2+20
	and	r1, r0
	str	r1, [r3, #48]
	.loc 1 170 0
	ldr	r1, [r3, #52]
	bic	r1, r2
	.loc 1 173 0
	mov	r2, #0
	.loc 1 170 0
	str	r1, [r3, #52]
	.loc 1 173 0
	str	r2, [r3, #8]
	.loc 1 174 0
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
	.align	1
	.global	RCC_HSEConfig
	.code	16
	.thumb_func
	.type	RCC_HSEConfig, %function
RCC_HSEConfig:
.LFB33:
	.loc 1 197 0
.LVL0:
	.loc 1 202 0
	ldr	r3, .L5
	mov	r2, #0
	strb	r2, [r3]
	.loc 1 207 0
	@ sp needed
	.loc 1 205 0
	strb	r0, [r3]
	.loc 1 207 0
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073876994
.LFE33:
	.size	RCC_HSEConfig, .-RCC_HSEConfig
	.section	.text.RCC_AdjustHSICalibrationValue,"ax",%progbits
	.align	1
	.global	RCC_AdjustHSICalibrationValue
	.code	16
	.thumb_func
	.type	RCC_AdjustHSICalibrationValue, %function
RCC_AdjustHSICalibrationValue:
.LFB35:
	.loc 1 257 0
.LVL1:
	.loc 1 263 0
	ldr	r3, .L8
	.loc 1 266 0
	mov	r1, #248
	.loc 1 263 0
	ldr	r2, [r3]
.LVL2:
	.loc 1 269 0
	lsl	r0, r0, #3
.LVL3:
	.loc 1 266 0
	bic	r2, r1
.LVL4:
	.loc 1 269 0
	orr	r0, r2
.LVL5:
	.loc 1 272 0
	str	r0, [r3]
	.loc 1 273 0
	@ sp needed
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073876992
.LFE35:
	.size	RCC_AdjustHSICalibrationValue, .-RCC_AdjustHSICalibrationValue
	.section	.text.RCC_HSICmd,"ax",%progbits
	.align	1
	.global	RCC_HSICmd
	.code	16
	.thumb_func
	.type	RCC_HSICmd, %function
RCC_HSICmd:
.LFB36:
	.loc 1 291 0
.LVL6:
	ldr	r3, .L15
	mov	r2, #1
	.loc 1 297 0
	ldr	r1, [r3]
	.loc 1 295 0
	cmp	r0, #0
	beq	.L11
	.loc 1 297 0
	orr	r2, r1
	b	.L13
.L11:
	.loc 1 301 0
	bic	r1, r2
	mov	r2, r1
.L13:
	str	r2, [r3]
	.loc 1 303 0
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073876992
.LFE36:
	.size	RCC_HSICmd, .-RCC_HSICmd
	.section	.text.RCC_AdjustHSI14CalibrationValue,"ax",%progbits
	.align	1
	.global	RCC_AdjustHSI14CalibrationValue
	.code	16
	.thumb_func
	.type	RCC_AdjustHSI14CalibrationValue, %function
RCC_AdjustHSI14CalibrationValue:
.LFB37:
	.loc 1 317 0
.LVL7:
	.loc 1 323 0
	ldr	r3, .L18
	.loc 1 326 0
	mov	r1, #248
	.loc 1 323 0
	ldr	r2, [r3, #52]
.LVL8:
	.loc 1 329 0
	lsl	r0, r0, #3
.LVL9:
	.loc 1 326 0
	bic	r2, r1
.LVL10:
	.loc 1 329 0
	orr	r0, r2
.LVL11:
	.loc 1 332 0
	str	r0, [r3, #52]
	.loc 1 333 0
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073876992
.LFE37:
	.size	RCC_AdjustHSI14CalibrationValue, .-RCC_AdjustHSI14CalibrationValue
	.section	.text.RCC_HSI14Cmd,"ax",%progbits
	.align	1
	.global	RCC_HSI14Cmd
	.code	16
	.thumb_func
	.type	RCC_HSI14Cmd, %function
RCC_HSI14Cmd:
.LFB38:
	.loc 1 348 0
.LVL12:
	ldr	r3, .L24
	mov	r2, #1
	.loc 1 354 0
	ldr	r1, [r3, #52]
	.loc 1 352 0
	cmp	r0, #0
	beq	.L21
	.loc 1 354 0
	orr	r2, r1
	b	.L23
.L21:
	.loc 1 358 0
	bic	r1, r2
	mov	r2, r1
.L23:
	str	r2, [r3, #52]
	.loc 1 360 0
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	1073876992
.LFE38:
	.size	RCC_HSI14Cmd, .-RCC_HSI14Cmd
	.section	.text.RCC_HSI14ADCRequestCmd,"ax",%progbits
	.align	1
	.global	RCC_HSI14ADCRequestCmd
	.code	16
	.thumb_func
	.type	RCC_HSI14ADCRequestCmd, %function
RCC_HSI14ADCRequestCmd:
.LFB39:
	.loc 1 369 0
.LVL13:
	ldr	r3, .L30
	mov	r2, #4
	.loc 1 375 0
	ldr	r1, [r3, #52]
	.loc 1 373 0
	cmp	r0, #0
	beq	.L27
	.loc 1 375 0
	bic	r1, r2
	mov	r2, r1
	b	.L29
.L27:
	.loc 1 379 0
	orr	r2, r1
.L29:
	str	r2, [r3, #52]
	.loc 1 381 0
	@ sp needed
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073876992
.LFE39:
	.size	RCC_HSI14ADCRequestCmd, .-RCC_HSI14ADCRequestCmd
	.section	.text.RCC_LSEConfig,"ax",%progbits
	.align	1
	.global	RCC_LSEConfig
	.code	16
	.thumb_func
	.type	RCC_LSEConfig, %function
RCC_LSEConfig:
.LFB40:
	.loc 1 401 0
.LVL14:
	.loc 1 407 0
	ldr	r3, .L33
	mov	r1, #1
	ldr	r2, [r3, #32]
	.loc 1 414 0
	@ sp needed
	.loc 1 407 0
	bic	r2, r1
	str	r2, [r3, #32]
	.loc 1 410 0
	ldr	r2, [r3, #32]
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3, #32]
	.loc 1 413 0
	ldr	r2, [r3, #32]
	orr	r0, r2
.LVL15:
	str	r0, [r3, #32]
	.loc 1 414 0
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073876992
.LFE40:
	.size	RCC_LSEConfig, .-RCC_LSEConfig
	.section	.text.RCC_LSEDriveConfig,"ax",%progbits
	.align	1
	.global	RCC_LSEDriveConfig
	.code	16
	.thumb_func
	.type	RCC_LSEDriveConfig, %function
RCC_LSEDriveConfig:
.LFB41:
	.loc 1 427 0
.LVL16:
	.loc 1 432 0
	ldr	r3, .L36
	mov	r1, #24
	ldr	r2, [r3, #32]
	.loc 1 436 0
	@ sp needed
	.loc 1 432 0
	bic	r2, r1
	str	r2, [r3, #32]
	.loc 1 435 0
	ldr	r2, [r3, #32]
	orr	r0, r2
.LVL17:
	str	r0, [r3, #32]
	.loc 1 436 0
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073876992
.LFE41:
	.size	RCC_LSEDriveConfig, .-RCC_LSEDriveConfig
	.section	.text.RCC_LSICmd,"ax",%progbits
	.align	1
	.global	RCC_LSICmd
	.code	16
	.thumb_func
	.type	RCC_LSICmd, %function
RCC_LSICmd:
.LFB42:
	.loc 1 451 0
.LVL18:
	ldr	r3, .L42
	mov	r2, #1
	.loc 1 457 0
	ldr	r1, [r3, #36]
	.loc 1 455 0
	cmp	r0, #0
	beq	.L39
	.loc 1 457 0
	orr	r2, r1
	b	.L41
.L39:
	.loc 1 461 0
	bic	r1, r2
	mov	r2, r1
.L41:
	str	r2, [r3, #36]
	.loc 1 463 0
	@ sp needed
	bx	lr
.L43:
	.align	2
.L42:
	.word	1073876992
.LFE42:
	.size	RCC_LSICmd, .-RCC_LSICmd
	.section	.text.RCC_PLLConfig,"ax",%progbits
	.align	1
	.global	RCC_PLLConfig
	.code	16
	.thumb_func
	.type	RCC_PLLConfig, %function
RCC_PLLConfig:
.LFB43:
	.loc 1 482 0
.LVL19:
	.loc 1 488 0
	ldr	r3, .L45
	.loc 1 482 0
	push	{r4, lr}
.LCFI0:
	.loc 1 488 0
	ldr	r2, .L45+4
	ldr	r4, [r3, #4]
	.loc 1 492 0
	@ sp needed
	.loc 1 488 0
	and	r2, r4
	str	r2, [r3, #4]
	.loc 1 491 0
	ldr	r2, [r3, #4]
	orr	r1, r2
.LVL20:
	orr	r0, r1
.LVL21:
	str	r0, [r3, #4]
	.loc 1 492 0
	pop	{r4, pc}
.L46:
	.align	2
.L45:
	.word	1073876992
	.word	-3997697
.LFE43:
	.size	RCC_PLLConfig, .-RCC_PLLConfig
	.section	.text.RCC_PLLCmd,"ax",%progbits
	.align	1
	.global	RCC_PLLCmd
	.code	16
	.thumb_func
	.type	RCC_PLLCmd, %function
RCC_PLLCmd:
.LFB44:
	.loc 1 506 0
.LVL22:
	ldr	r3, .L51
	.loc 1 512 0
	ldr	r1, [r3]
	.loc 1 510 0
	cmp	r0, #0
	beq	.L48
	.loc 1 512 0
	mov	r2, #128
	lsl	r2, r2, #17
	orr	r2, r1
	b	.L50
.L48:
	.loc 1 516 0
	ldr	r2, .L51+4
	and	r2, r1
.L50:
	str	r2, [r3]
	.loc 1 518 0
	@ sp needed
	bx	lr
.L52:
	.align	2
.L51:
	.word	1073876992
	.word	-16777217
.LFE44:
	.size	RCC_PLLCmd, .-RCC_PLLCmd
	.section	.text.RCC_PREDIV1Config,"ax",%progbits
	.align	1
	.global	RCC_PREDIV1Config
	.code	16
	.thumb_func
	.type	RCC_PREDIV1Config, %function
RCC_PREDIV1Config:
.LFB45:
	.loc 1 528 0
.LVL23:
	.loc 1 534 0
	ldr	r3, .L54
	.loc 1 536 0
	mov	r1, #15
	.loc 1 534 0
	ldr	r2, [r3, #44]
.LVL24:
	.loc 1 541 0
	@ sp needed
	.loc 1 536 0
	bic	r2, r1
.LVL25:
	.loc 1 538 0
	orr	r0, r2
.LVL26:
	.loc 1 540 0
	str	r0, [r3, #44]
	.loc 1 541 0
	bx	lr
.L55:
	.align	2
.L54:
	.word	1073876992
.LFE45:
	.size	RCC_PREDIV1Config, .-RCC_PREDIV1Config
	.section	.text.RCC_ClockSecuritySystemCmd,"ax",%progbits
	.align	1
	.global	RCC_ClockSecuritySystemCmd
	.code	16
	.thumb_func
	.type	RCC_ClockSecuritySystemCmd, %function
RCC_ClockSecuritySystemCmd:
.LFB46:
	.loc 1 555 0
.LVL27:
	ldr	r3, .L60
	.loc 1 561 0
	ldr	r1, [r3]
	.loc 1 559 0
	cmp	r0, #0
	beq	.L57
	.loc 1 561 0
	mov	r2, #128
	lsl	r2, r2, #12
	orr	r2, r1
	b	.L59
.L57:
	.loc 1 565 0
	ldr	r2, .L60+4
	and	r2, r1
.L59:
	str	r2, [r3]
	.loc 1 567 0
	@ sp needed
	bx	lr
.L61:
	.align	2
.L60:
	.word	1073876992
	.word	-524289
.LFE46:
	.size	RCC_ClockSecuritySystemCmd, .-RCC_ClockSecuritySystemCmd
	.section	.text.RCC_MCOConfig,"ax",%progbits
	.align	1
	.global	RCC_MCOConfig
	.code	16
	.thumb_func
	.type	RCC_MCOConfig, %function
RCC_MCOConfig:
.LFB47:
	.loc 1 585 0
.LVL28:
	.loc 1 590 0
	ldr	r3, .L63
	.loc 1 591 0
	@ sp needed
	.loc 1 590 0
	strb	r0, [r3]
	.loc 1 591 0
	bx	lr
.L64:
	.align	2
.L63:
	.word	1073876999
.LFE47:
	.size	RCC_MCOConfig, .-RCC_MCOConfig
	.section	.text.RCC_SYSCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_SYSCLKConfig
	.code	16
	.thumb_func
	.type	RCC_SYSCLKConfig, %function
RCC_SYSCLKConfig:
.LFB48:
	.loc 1 690 0
.LVL29:
	.loc 1 696 0
	ldr	r3, .L66
	.loc 1 699 0
	mov	r1, #3
	.loc 1 696 0
	ldr	r2, [r3, #4]
.LVL30:
	.loc 1 706 0
	@ sp needed
	.loc 1 699 0
	bic	r2, r1
.LVL31:
	.loc 1 702 0
	orr	r0, r2
.LVL32:
	.loc 1 705 0
	str	r0, [r3, #4]
	.loc 1 706 0
	bx	lr
.L67:
	.align	2
.L66:
	.word	1073876992
.LFE48:
	.size	RCC_SYSCLKConfig, .-RCC_SYSCLKConfig
	.section	.text.RCC_GetSYSCLKSource,"ax",%progbits
	.align	1
	.global	RCC_GetSYSCLKSource
	.code	16
	.thumb_func
	.type	RCC_GetSYSCLKSource, %function
RCC_GetSYSCLKSource:
.LFB49:
	.loc 1 718 0
	.loc 1 719 0
	ldr	r3, .L69
	.loc 1 720 0
	@ sp needed
	.loc 1 719 0
	ldr	r0, [r3, #4]
	mov	r3, #12
	and	r0, r3
	.loc 1 720 0
	bx	lr
.L70:
	.align	2
.L69:
	.word	1073876992
.LFE49:
	.size	RCC_GetSYSCLKSource, .-RCC_GetSYSCLKSource
	.section	.text.RCC_HCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_HCLKConfig
	.code	16
	.thumb_func
	.type	RCC_HCLKConfig, %function
RCC_HCLKConfig:
.LFB50:
	.loc 1 739 0
.LVL33:
	.loc 1 745 0
	ldr	r3, .L72
	.loc 1 748 0
	mov	r1, #240
	.loc 1 745 0
	ldr	r2, [r3, #4]
.LVL34:
	.loc 1 755 0
	@ sp needed
	.loc 1 748 0
	bic	r2, r1
.LVL35:
	.loc 1 751 0
	orr	r0, r2
.LVL36:
	.loc 1 754 0
	str	r0, [r3, #4]
	.loc 1 755 0
	bx	lr
.L73:
	.align	2
.L72:
	.word	1073876992
.LFE50:
	.size	RCC_HCLKConfig, .-RCC_HCLKConfig
	.section	.text.RCC_PCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_PCLKConfig
	.code	16
	.thumb_func
	.type	RCC_PCLKConfig, %function
RCC_PCLKConfig:
.LFB51:
	.loc 1 770 0
.LVL37:
	.loc 1 776 0
	ldr	r3, .L75
	.loc 1 779 0
	ldr	r2, .L75+4
	.loc 1 776 0
	ldr	r1, [r3, #4]
.LVL38:
	.loc 1 786 0
	@ sp needed
	.loc 1 779 0
	and	r2, r1
.LVL39:
	.loc 1 782 0
	orr	r0, r2
.LVL40:
	.loc 1 785 0
	str	r0, [r3, #4]
	.loc 1 786 0
	bx	lr
.L76:
	.align	2
.L75:
	.word	1073876992
	.word	-1793
.LFE51:
	.size	RCC_PCLKConfig, .-RCC_PCLKConfig
	.section	.text.RCC_ADCCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_ADCCLKConfig
	.code	16
	.thumb_func
	.type	RCC_ADCCLKConfig, %function
RCC_ADCCLKConfig:
.LFB52:
	.loc 1 799 0
.LVL41:
	.loc 1 804 0
	ldr	r3, .L78
	ldr	r2, .L78+4
	ldr	r1, [r3, #4]
	.loc 1 812 0
	@ sp needed
	.loc 1 804 0
	and	r2, r1
	str	r2, [r3, #4]
	.loc 1 806 0
	ldr	r2, [r3, #4]
	uxth	r1, r0
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 809 0
	ldr	r1, [r3, #48]
	ldr	r2, .L78+8
	.loc 1 811 0
	lsr	r0, r0, #16
.LVL42:
	.loc 1 809 0
	and	r2, r1
	str	r2, [r3, #48]
	.loc 1 811 0
	ldr	r2, [r3, #48]
	orr	r0, r2
	str	r0, [r3, #48]
	.loc 1 812 0
	bx	lr
.L79:
	.align	2
.L78:
	.word	1073876992
	.word	-16385
	.word	-257
.LFE52:
	.size	RCC_ADCCLKConfig, .-RCC_ADCCLKConfig
	.section	.text.RCC_CECCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_CECCLKConfig
	.code	16
	.thumb_func
	.type	RCC_CECCLKConfig, %function
RCC_CECCLKConfig:
.LFB53:
	.loc 1 824 0
.LVL43:
	.loc 1 829 0
	ldr	r3, .L81
	mov	r1, #64
	ldr	r2, [r3, #48]
	.loc 1 832 0
	@ sp needed
	.loc 1 829 0
	bic	r2, r1
	str	r2, [r3, #48]
	.loc 1 831 0
	ldr	r2, [r3, #48]
	orr	r0, r2
.LVL44:
	str	r0, [r3, #48]
	.loc 1 832 0
	bx	lr
.L82:
	.align	2
.L81:
	.word	1073876992
.LFE53:
	.size	RCC_CECCLKConfig, .-RCC_CECCLKConfig
	.section	.text.RCC_I2CCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_I2CCLKConfig
	.code	16
	.thumb_func
	.type	RCC_I2CCLKConfig, %function
RCC_I2CCLKConfig:
.LFB54:
	.loc 1 844 0
.LVL45:
	.loc 1 849 0
	ldr	r3, .L84
	mov	r1, #16
	ldr	r2, [r3, #48]
	.loc 1 852 0
	@ sp needed
	.loc 1 849 0
	bic	r2, r1
	str	r2, [r3, #48]
	.loc 1 851 0
	ldr	r2, [r3, #48]
	orr	r0, r2
.LVL46:
	str	r0, [r3, #48]
	.loc 1 852 0
	bx	lr
.L85:
	.align	2
.L84:
	.word	1073876992
.LFE54:
	.size	RCC_I2CCLKConfig, .-RCC_I2CCLKConfig
	.section	.text.RCC_USARTCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_USARTCLKConfig
	.code	16
	.thumb_func
	.type	RCC_USARTCLKConfig, %function
RCC_USARTCLKConfig:
.LFB55:
	.loc 1 866 0
.LVL47:
	.loc 1 871 0
	ldr	r3, .L87
	mov	r1, #3
	ldr	r2, [r3, #48]
	.loc 1 874 0
	@ sp needed
	.loc 1 871 0
	bic	r2, r1
	str	r2, [r3, #48]
	.loc 1 873 0
	ldr	r2, [r3, #48]
	orr	r0, r2
.LVL48:
	str	r0, [r3, #48]
	.loc 1 874 0
	bx	lr
.L88:
	.align	2
.L87:
	.word	1073876992
.LFE55:
	.size	RCC_USARTCLKConfig, .-RCC_USARTCLKConfig
	.global	__aeabi_uidiv
	.section	.text.RCC_GetClocksFreq,"ax",%progbits
	.align	1
	.global	RCC_GetClocksFreq
	.code	16
	.thumb_func
	.type	RCC_GetClocksFreq, %function
RCC_GetClocksFreq:
.LFB56:
	.loc 1 913 0
.LVL49:
	push	{r4, r5, r6, lr}
.LCFI1:
	.loc 1 917 0
	ldr	r5, .L111
	mov	r3, #12
	ldr	r2, [r5, #4]
.LVL50:
	.loc 1 913 0
	mov	r4, r0
	.loc 1 917 0
	and	r3, r2
.LVL51:
	.loc 1 919 0
	cmp	r3, #4
	beq	.L91
	cmp	r3, #8
	beq	.L92
.L91:
	.loc 1 925 0
	ldr	r3, .L111+4
.LVL52:
	str	r3, [r4]
	.loc 1 926 0
	b	.L94
.LVL53:
.L92:
	.loc 1 929 0
	ldr	r6, [r5, #4]
.LVL54:
	.loc 1 930 0
	ldr	r3, [r5, #4]
.LVL55:
	.loc 1 929 0
	lsl	r6, r6, #10
.LVL56:
	.loc 1 931 0
	lsr	r6, r6, #28
	add	r6, r6, #2
.LVL57:
	.loc 1 933 0
	lsl	r1, r3, #15
	bmi	.L95
	.loc 1 936 0
	ldr	r3, .L111+8
.LVL58:
	mul	r6, r3
.LVL59:
	b	.L107
.LVL60:
.L95:
	.loc 1 940 0
	ldr	r1, [r5, #44]
.LVL61:
	mov	r3, #15
.LVL62:
	and	r1, r3
.LVL63:
	add	r1, r1, #1
.LVL64:
	.loc 1 942 0
	ldr	r0, .L111+4
.LVL65:
	bl	__aeabi_uidiv
.LVL66:
	mul	r6, r0
.LVL67:
.L107:
	str	r6, [r4]
.L94:
	.loc 1 951 0
	ldr	r2, [r5, #4]
	.loc 1 953 0
	ldr	r3, .L111+12
	.loc 1 951 0
	lsl	r2, r2, #24
	.loc 1 952 0
	lsr	r2, r2, #28
.LVL68:
	.loc 1 955 0
	ldr	r0, [r4]
	.loc 1 953 0
	ldrb	r2, [r3, r2]
.LVL69:
	.loc 1 955 0
	mov	r1, r0
	lsr	r1, r1, r2
	str	r1, [r4, #4]
	mov	r2, r1
.LVL70:
	.loc 1 958 0
	ldr	r1, [r5, #4]
	lsl	r1, r1, #21
	.loc 1 959 0
	lsr	r1, r1, #29
.LVL71:
	.loc 1 960 0
	ldrb	r3, [r3, r1]
.LVL72:
	.loc 1 962 0
	lsr	r2, r2, r3
	str	r2, [r4, #8]
	.loc 1 965 0
	ldr	r3, [r5, #48]
.LVL73:
	lsl	r1, r3, #23
	bmi	.L96
.LVL74:
	.loc 1 968 0
	ldr	r3, .L111+16
	b	.L108
.L96:
	.loc 1 972 0
	ldr	r3, .L111
	ldr	r3, [r3, #4]
	lsl	r1, r3, #17
	bmi	.L98
	.loc 1 975 0
	lsr	r3, r2, #1
	b	.L108
.L98:
	.loc 1 980 0
	lsr	r3, r2, #2
.L108:
	str	r3, [r4, #12]
	.loc 1 986 0
	ldr	r3, [r5, #48]
	lsl	r1, r3, #25
	bmi	.L99
	.loc 1 989 0
	ldr	r3, .L111+20
	b	.L109
.L99:
	.loc 1 994 0
	mov	r3, #128
	lsl	r3, r3, #8
.L109:
	str	r3, [r4, #16]
	.loc 1 998 0
	ldr	r3, [r5, #48]
	lsl	r1, r3, #27
	bmi	.L101
	.loc 1 1001 0
	ldr	r3, .L111+4
	str	r3, [r4, #20]
	b	.L102
.L101:
	.loc 1 1006 0
	str	r0, [r4, #20]
.L102:
	.loc 1 1010 0
	ldr	r5, [r5, #48]
	mov	r3, #3
	ldr	r1, .L111
	tst	r5, r3
	bne	.L103
	.loc 1 1013 0
	str	r2, [r4, #24]
	b	.L89
.L103:
	.loc 1 1015 0
	ldr	r2, [r1, #48]
	and	r2, r3
	cmp	r2, #1
	bne	.L105
	.loc 1 1018 0
	str	r0, [r4, #24]
	b	.L89
.L105:
	.loc 1 1020 0
	ldr	r2, [r1, #48]
	and	r2, r3
	cmp	r2, #2
	bne	.L106
	.loc 1 1023 0
	mov	r3, #128
	lsl	r3, r3, #8
	b	.L110
.L106:
	.loc 1 1025 0
	ldr	r2, [r1, #48]
	and	r3, r2
	cmp	r3, #3
	bne	.L89
	.loc 1 1028 0
	ldr	r3, .L111+4
.L110:
	str	r3, [r4, #24]
.L89:
	.loc 1 1031 0
	@ sp needed
.LVL75:
	pop	{r4, r5, r6, pc}
.L112:
	.align	2
.L111:
	.word	1073876992
	.word	8000000
	.word	4000000
	.word	.LANCHOR0
	.word	14000000
	.word	32786
.LFE56:
	.size	RCC_GetClocksFreq, .-RCC_GetClocksFreq
	.section	.text.RCC_RTCCLKConfig,"ax",%progbits
	.align	1
	.global	RCC_RTCCLKConfig
	.code	16
	.thumb_func
	.type	RCC_RTCCLKConfig, %function
RCC_RTCCLKConfig:
.LFB57:
	.loc 1 1087 0
.LVL76:
	.loc 1 1092 0
	ldr	r3, .L114
	.loc 1 1093 0
	@ sp needed
	.loc 1 1092 0
	ldr	r2, [r3, #32]
	orr	r0, r2
.LVL77:
	str	r0, [r3, #32]
	.loc 1 1093 0
	bx	lr
.L115:
	.align	2
.L114:
	.word	1073876992
.LFE57:
	.size	RCC_RTCCLKConfig, .-RCC_RTCCLKConfig
	.section	.text.RCC_RTCCLKCmd,"ax",%progbits
	.align	1
	.global	RCC_RTCCLKCmd
	.code	16
	.thumb_func
	.type	RCC_RTCCLKCmd, %function
RCC_RTCCLKCmd:
.LFB58:
	.loc 1 1104 0
.LVL78:
	ldr	r3, .L120
	.loc 1 1110 0
	ldr	r1, [r3, #32]
	.loc 1 1108 0
	cmp	r0, #0
	beq	.L117
	.loc 1 1110 0
	mov	r2, #128
	lsl	r2, r2, #8
	orr	r2, r1
	b	.L119
.L117:
	.loc 1 1114 0
	ldr	r2, .L120+4
	and	r2, r1
.L119:
	str	r2, [r3, #32]
	.loc 1 1116 0
	@ sp needed
	bx	lr
.L121:
	.align	2
.L120:
	.word	1073876992
	.word	-32769
.LFE58:
	.size	RCC_RTCCLKCmd, .-RCC_RTCCLKCmd
	.section	.text.RCC_BackupResetCmd,"ax",%progbits
	.align	1
	.global	RCC_BackupResetCmd
	.code	16
	.thumb_func
	.type	RCC_BackupResetCmd, %function
RCC_BackupResetCmd:
.LFB59:
	.loc 1 1127 0
.LVL79:
	ldr	r3, .L126
	.loc 1 1133 0
	ldr	r1, [r3, #32]
	.loc 1 1131 0
	cmp	r0, #0
	beq	.L123
	.loc 1 1133 0
	mov	r2, #128
	lsl	r2, r2, #9
	orr	r2, r1
	b	.L125
.L123:
	.loc 1 1137 0
	ldr	r2, .L126+4
	and	r2, r1
.L125:
	str	r2, [r3, #32]
	.loc 1 1139 0
	@ sp needed
	bx	lr
.L127:
	.align	2
.L126:
	.word	1073876992
	.word	-65537
.LFE59:
	.size	RCC_BackupResetCmd, .-RCC_BackupResetCmd
	.section	.text.RCC_AHBPeriphClockCmd,"ax",%progbits
	.align	1
	.global	RCC_AHBPeriphClockCmd
	.code	16
	.thumb_func
	.type	RCC_AHBPeriphClockCmd, %function
RCC_AHBPeriphClockCmd:
.LFB60:
	.loc 1 1163 0
.LVL80:
	ldr	r3, .L131
	.loc 1 1170 0
	ldr	r2, [r3, #20]
	.loc 1 1168 0
	cmp	r1, #0
	beq	.L129
	.loc 1 1170 0
	orr	r0, r2
.LVL81:
	str	r0, [r3, #20]
	b	.L128
.LVL82:
.L129:
	.loc 1 1174 0
	bic	r2, r0
	str	r2, [r3, #20]
.LVL83:
.L128:
	.loc 1 1176 0
	@ sp needed
	bx	lr
.L132:
	.align	2
.L131:
	.word	1073876992
.LFE60:
	.size	RCC_AHBPeriphClockCmd, .-RCC_AHBPeriphClockCmd
	.section	.text.RCC_APB2PeriphClockCmd,"ax",%progbits
	.align	1
	.global	RCC_APB2PeriphClockCmd
	.code	16
	.thumb_func
	.type	RCC_APB2PeriphClockCmd, %function
RCC_APB2PeriphClockCmd:
.LFB61:
	.loc 1 1199 0
.LVL84:
	ldr	r3, .L136
	.loc 1 1206 0
	ldr	r2, [r3, #24]
	.loc 1 1204 0
	cmp	r1, #0
	beq	.L134
	.loc 1 1206 0
	orr	r0, r2
.LVL85:
	str	r0, [r3, #24]
	b	.L133
.LVL86:
.L134:
	.loc 1 1210 0
	bic	r2, r0
	str	r2, [r3, #24]
.LVL87:
.L133:
	.loc 1 1212 0
	@ sp needed
	bx	lr
.L137:
	.align	2
.L136:
	.word	1073876992
.LFE61:
	.size	RCC_APB2PeriphClockCmd, .-RCC_APB2PeriphClockCmd
	.section	.text.RCC_APB1PeriphClockCmd,"ax",%progbits
	.align	1
	.global	RCC_APB1PeriphClockCmd
	.code	16
	.thumb_func
	.type	RCC_APB1PeriphClockCmd, %function
RCC_APB1PeriphClockCmd:
.LFB62:
	.loc 1 1238 0
.LVL88:
	ldr	r3, .L141
	.loc 1 1245 0
	ldr	r2, [r3, #28]
	.loc 1 1243 0
	cmp	r1, #0
	beq	.L139
	.loc 1 1245 0
	orr	r0, r2
.LVL89:
	str	r0, [r3, #28]
	b	.L138
.LVL90:
.L139:
	.loc 1 1249 0
	bic	r2, r0
	str	r2, [r3, #28]
.LVL91:
.L138:
	.loc 1 1251 0
	@ sp needed
	bx	lr
.L142:
	.align	2
.L141:
	.word	1073876992
.LFE62:
	.size	RCC_APB1PeriphClockCmd, .-RCC_APB1PeriphClockCmd
	.section	.text.RCC_AHBPeriphResetCmd,"ax",%progbits
	.align	1
	.global	RCC_AHBPeriphResetCmd
	.code	16
	.thumb_func
	.type	RCC_AHBPeriphResetCmd, %function
RCC_AHBPeriphResetCmd:
.LFB63:
	.loc 1 1268 0
.LVL92:
	ldr	r3, .L146
	.loc 1 1275 0
	ldr	r2, [r3, #40]
	.loc 1 1273 0
	cmp	r1, #0
	beq	.L144
	.loc 1 1275 0
	orr	r0, r2
.LVL93:
	str	r0, [r3, #40]
	b	.L143
.LVL94:
.L144:
	.loc 1 1279 0
	bic	r2, r0
	str	r2, [r3, #40]
.LVL95:
.L143:
	.loc 1 1281 0
	@ sp needed
	bx	lr
.L147:
	.align	2
.L146:
	.word	1073876992
.LFE63:
	.size	RCC_AHBPeriphResetCmd, .-RCC_AHBPeriphResetCmd
	.section	.text.RCC_APB2PeriphResetCmd,"ax",%progbits
	.align	1
	.global	RCC_APB2PeriphResetCmd
	.code	16
	.thumb_func
	.type	RCC_APB2PeriphResetCmd, %function
RCC_APB2PeriphResetCmd:
.LFB64:
	.loc 1 1301 0
.LVL96:
	ldr	r3, .L151
	.loc 1 1308 0
	ldr	r2, [r3, #12]
	.loc 1 1306 0
	cmp	r1, #0
	beq	.L149
	.loc 1 1308 0
	orr	r0, r2
.LVL97:
	str	r0, [r3, #12]
	b	.L148
.LVL98:
.L149:
	.loc 1 1312 0
	bic	r2, r0
	str	r2, [r3, #12]
.LVL99:
.L148:
	.loc 1 1314 0
	@ sp needed
	bx	lr
.L152:
	.align	2
.L151:
	.word	1073876992
.LFE64:
	.size	RCC_APB2PeriphResetCmd, .-RCC_APB2PeriphResetCmd
	.section	.text.RCC_APB1PeriphResetCmd,"ax",%progbits
	.align	1
	.global	RCC_APB1PeriphResetCmd
	.code	16
	.thumb_func
	.type	RCC_APB1PeriphResetCmd, %function
RCC_APB1PeriphResetCmd:
.LFB65:
	.loc 1 1337 0
.LVL100:
	ldr	r3, .L156
	.loc 1 1344 0
	ldr	r2, [r3, #16]
	.loc 1 1342 0
	cmp	r1, #0
	beq	.L154
	.loc 1 1344 0
	orr	r0, r2
.LVL101:
	str	r0, [r3, #16]
	b	.L153
.LVL102:
.L154:
	.loc 1 1348 0
	bic	r2, r0
	str	r2, [r3, #16]
.LVL103:
.L153:
	.loc 1 1350 0
	@ sp needed
	bx	lr
.L157:
	.align	2
.L156:
	.word	1073876992
.LFE65:
	.size	RCC_APB1PeriphResetCmd, .-RCC_APB1PeriphResetCmd
	.section	.text.RCC_ITConfig,"ax",%progbits
	.align	1
	.global	RCC_ITConfig
	.code	16
	.thumb_func
	.type	RCC_ITConfig, %function
RCC_ITConfig:
.LFB66:
	.loc 1 1388 0
.LVL104:
	ldr	r3, .L161
	.loc 1 1396 0
	ldrb	r2, [r3]
	.loc 1 1393 0
	cmp	r1, #0
	beq	.L159
	.loc 1 1396 0
	orr	r0, r2
.LVL105:
	strb	r0, [r3]
	b	.L158
.LVL106:
.L159:
	.loc 1 1401 0
	bic	r2, r0
	strb	r2, [r3]
.LVL107:
.L158:
	.loc 1 1403 0
	@ sp needed
	bx	lr
.L162:
	.align	2
.L161:
	.word	1073877001
.LFE66:
	.size	RCC_ITConfig, .-RCC_ITConfig
	.section	.text.RCC_GetFlagStatus,"ax",%progbits
	.align	1
	.global	RCC_GetFlagStatus
	.code	16
	.thumb_func
	.type	RCC_GetFlagStatus, %function
RCC_GetFlagStatus:
.LFB67:
	.loc 1 1426 0
.LVL108:
	.loc 1 1435 0
	lsr	r1, r0, #5
.LVL109:
	ldr	r2, .L168
	.loc 1 1437 0
	bne	.L164
	.loc 1 1439 0
	ldr	r3, [r2]
.LVL110:
	b	.L165
.LVL111:
.L164:
	.loc 1 1441 0
	cmp	r1, #1
	bne	.L166
	.loc 1 1443 0
	ldr	r3, [r2, #32]
.LVL112:
	b	.L165
.LVL113:
.L166:
	.loc 1 1445 0
	cmp	r1, #2
	bne	.L167
	.loc 1 1447 0
	ldr	r3, [r2, #36]
.LVL114:
	b	.L165
.LVL115:
.L167:
	.loc 1 1451 0
	ldr	r3, [r2, #52]
.LVL116:
.L165:
	.loc 1 1457 0
	mov	r2, #31
	and	r0, r2
.LVL117:
	mov	r2, #1
	lsl	r2, r2, r0
	and	r3, r2
.LVL118:
	sub	r0, r3, #1
	sbc	r3, r3, r0
	.loc 1 1466 0
	uxtb	r0, r3
	.loc 1 1467 0
	@ sp needed
	bx	lr
.L169:
	.align	2
.L168:
	.word	1073876992
.LFE67:
	.size	RCC_GetFlagStatus, .-RCC_GetFlagStatus
	.section	.text.RCC_WaitForHSEStartUp,"ax",%progbits
	.align	1
	.global	RCC_WaitForHSEStartUp
	.code	16
	.thumb_func
	.type	RCC_WaitForHSEStartUp, %function
RCC_WaitForHSEStartUp:
.LFB34:
	.loc 1 223 0
	push	{r0, r1, r2, lr}
.LCFI2:
	.loc 1 224 0
	mov	r3, #0
	str	r3, [sp, #4]
.LVL119:
.L172:
	.loc 1 231 0 discriminator 1
	mov	r0, #17
	bl	RCC_GetFlagStatus
.LVL120:
	.loc 1 232 0 discriminator 1
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	.loc 1 233 0 discriminator 1
	ldr	r2, [sp, #4]
	mov	r3, #160
	lsl	r3, r3, #3
	cmp	r2, r3
	beq	.L171
	cmp	r0, #0
	beq	.L172
.L171:
	.loc 1 235 0
	mov	r0, #17
.LVL121:
	bl	RCC_GetFlagStatus
.LVL122:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL123:
	.loc 1 243 0
	uxtb	r0, r0
	.loc 1 244 0
	@ sp needed
	pop	{r1, r2, r3, pc}
.LFE34:
	.size	RCC_WaitForHSEStartUp, .-RCC_WaitForHSEStartUp
	.section	.text.RCC_ClearFlag,"ax",%progbits
	.align	1
	.global	RCC_ClearFlag
	.code	16
	.thumb_func
	.type	RCC_ClearFlag, %function
RCC_ClearFlag:
.LFB68:
	.loc 1 1478 0
	.loc 1 1480 0
	ldr	r3, .L174
	mov	r2, #128
	ldr	r1, [r3, #36]
	lsl	r2, r2, #17
	orr	r2, r1
	str	r2, [r3, #36]
	.loc 1 1481 0
	@ sp needed
	bx	lr
.L175:
	.align	2
.L174:
	.word	1073876992
.LFE68:
	.size	RCC_ClearFlag, .-RCC_ClearFlag
	.section	.text.RCC_GetITStatus,"ax",%progbits
	.align	1
	.global	RCC_GetITStatus
	.code	16
	.thumb_func
	.type	RCC_GetITStatus, %function
RCC_GetITStatus:
.LFB69:
	.loc 1 1497 0
.LVL124:
	.loc 1 1504 0
	ldr	r3, .L177
	.loc 1 1514 0
	@ sp needed
	.loc 1 1504 0
	ldr	r3, [r3, #8]
.LVL125:
	and	r0, r3
.LVL126:
	sub	r3, r0, #1
	sbc	r0, r0, r3
	.loc 1 1513 0
	uxtb	r0, r0
	.loc 1 1514 0
	bx	lr
.L178:
	.align	2
.L177:
	.word	1073876992
.LFE69:
	.size	RCC_GetITStatus, .-RCC_GetITStatus
	.section	.text.RCC_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	RCC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	RCC_ClearITPendingBit, %function
RCC_ClearITPendingBit:
.LFB70:
	.loc 1 1530 0
.LVL127:
	.loc 1 1536 0
	ldr	r3, .L180
	.loc 1 1537 0
	@ sp needed
	.loc 1 1536 0
	strb	r0, [r3]
	.loc 1 1537 0
	bx	lr
.L181:
	.align	2
.L180:
	.word	1073877002
.LFE70:
	.size	RCC_ClearITPendingBit, .-RCC_ClearITPendingBit
	.section	.data.APBAHBPrescTable,"aw",%progbits
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
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
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
	.uleb128 0x10
	.byte	0x80
	.uleb128 0x4
	.byte	0x81
	.uleb128 0x3
	.byte	0x82
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x99e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x1
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
	.byte	0x3
	.byte	0xdf
	.4byte	0x9f
	.uleb128 0x7
	.4byte	.LASF11
	.sleb128 0
	.uleb128 0x8
	.ascii	"SET\000"
	.sleb128 1
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
	.byte	0x3
	.byte	0xe1
	.4byte	0xca
	.uleb128 0x7
	.4byte	.LASF14
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF15
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0xe1
	.4byte	0xb5
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe4
	.4byte	0xea
	.uleb128 0x7
	.4byte	.LASF17
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF18
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x3
	.byte	0xe4
	.4byte	0xd5
	.uleb128 0x9
	.byte	0x38
	.byte	0x3
	.2byte	0x1d8
	.4byte	0x1b4
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
	.4byte	0xf5
	.uleb128 0xd
	.byte	0x1c
	.byte	0x4
	.byte	0x32
	.4byte	0x21d
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
	.4byte	0x1c0
	.uleb128 0xf
	.4byte	.LASF107
	.byte	0x1
	.byte	0x92
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF39
	.byte	0x1
	.byte	0xc4
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25c
	.uleb128 0x11
	.4byte	.LASF41
	.byte	0x1
	.byte	0xc4
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x100
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x293
	.uleb128 0x13
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x100
	.4byte	0x2c
	.4byte	.LLST0
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x102
	.4byte	0x5e
	.4byte	.LLST1
	.byte	0
	.uleb128 0x12
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x122
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b8
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x122
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x13c
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ef
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x13c
	.4byte	0x2c
	.4byte	.LLST2
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x13e
	.4byte	0x5e
	.4byte	.LLST3
	.byte	0
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x15b
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x314
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x15b
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x170
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x339
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x170
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x190
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x360
	.uleb128 0x13
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x190
	.4byte	0x5e
	.4byte	.LLST4
	.byte	0
	.uleb128 0x12
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x1aa
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x387
	.uleb128 0x13
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x1aa
	.4byte	0x5e
	.4byte	.LLST5
	.byte	0
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x1c2
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ac
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1c2
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x1e1
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e3
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x5e
	.4byte	.LLST6
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x1e1
	.4byte	0x5e
	.4byte	.LLST7
	.byte	0
	.uleb128 0x12
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x1f9
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x408
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1f9
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x20f
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43f
	.uleb128 0x13
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x20f
	.4byte	0x5e
	.4byte	.LLST8
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x211
	.4byte	0x5e
	.4byte	.LLST9
	.byte	0
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x22a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x464
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x22a
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x248
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x489
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x248
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x2b1
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c0
	.uleb128 0x13
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x2b1
	.4byte	0x5e
	.4byte	.LLST10
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x2b3
	.4byte	0x5e
	.4byte	.LLST11
	.byte	0
	.uleb128 0x16
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x2cd
	.4byte	0x2c
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x2e2
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x50d
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x2e2
	.4byte	0x5e
	.4byte	.LLST12
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x2e4
	.4byte	0x5e
	.4byte	.LLST13
	.byte	0
	.uleb128 0x12
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x301
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x544
	.uleb128 0x13
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x301
	.4byte	0x5e
	.4byte	.LLST14
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x303
	.4byte	0x5e
	.4byte	.LLST15
	.byte	0
	.uleb128 0x12
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x31e
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56b
	.uleb128 0x13
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x31e
	.4byte	0x5e
	.4byte	.LLST16
	.byte	0
	.uleb128 0x12
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x337
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x592
	.uleb128 0x13
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x337
	.4byte	0x5e
	.4byte	.LLST17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x34b
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b9
	.uleb128 0x13
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x34b
	.4byte	0x5e
	.4byte	.LLST18
	.byte	0
	.uleb128 0x12
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x361
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e0
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x361
	.4byte	0x5e
	.4byte	.LLST19
	.byte	0
	.uleb128 0x17
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x390
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x657
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x390
	.4byte	0x657
	.4byte	.LLST20
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.4byte	.LLST21
	.uleb128 0x14
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.4byte	.LLST22
	.uleb128 0x14
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.4byte	.LLST23
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.4byte	.LLST24
	.uleb128 0x14
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x392
	.4byte	0x5e
	.4byte	.LLST25
	.byte	0
	.uleb128 0x19
	.byte	0x4
	.4byte	0x21d
	.uleb128 0x12
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x43e
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x684
	.uleb128 0x13
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x43e
	.4byte	0x5e
	.4byte	.LLST26
	.byte	0
	.uleb128 0x12
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x44f
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a9
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x44f
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x466
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ce
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x466
	.4byte	0xca
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x12
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x48a
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x703
	.uleb128 0x13
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x48a
	.4byte	0x5e
	.4byte	.LLST27
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x48a
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x4ae
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x738
	.uleb128 0x13
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x4ae
	.4byte	0x5e
	.4byte	.LLST28
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x4ae
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x4d5
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x76d
	.uleb128 0x13
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x4d5
	.4byte	0x5e
	.4byte	.LLST29
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x4d5
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x4f3
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a2
	.uleb128 0x13
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x4f3
	.4byte	0x5e
	.4byte	.LLST30
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x4f3
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x514
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d7
	.uleb128 0x13
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x514
	.4byte	0x5e
	.4byte	.LLST31
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x514
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x538
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x80c
	.uleb128 0x13
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x538
	.4byte	0x5e
	.4byte	.LLST32
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x538
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x12
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x56b
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x841
	.uleb128 0x13
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x56b
	.4byte	0x2c
	.4byte	.LLST33
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x56b
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x591
	.4byte	0x9f
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x89c
	.uleb128 0x13
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x591
	.4byte	0x2c
	.4byte	.LLST34
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x593
	.4byte	0x5e
	.4byte	.LLST35
	.uleb128 0x14
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x594
	.4byte	0x5e
	.4byte	.LLST36
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x595
	.4byte	0x9f
	.4byte	.LLST37
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF103
	.byte	0x1
	.byte	0xde
	.4byte	0xea
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x904
	.uleb128 0x1c
	.4byte	.LASF104
	.byte	0x1
	.byte	0xe0
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1d
	.4byte	.LASF105
	.byte	0x1
	.byte	0xe1
	.4byte	0xea
	.4byte	.LLST38
	.uleb128 0x1d
	.4byte	.LASF106
	.byte	0x1
	.byte	0xe2
	.4byte	0x9f
	.4byte	.LLST39
	.uleb128 0x1e
	.4byte	.LVL120
	.4byte	0x841
	.4byte	0x8f4
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x41
	.byte	0
	.uleb128 0x20
	.4byte	.LVL122
	.4byte	0x841
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x41
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x5c5
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x5d8
	.4byte	0xaa
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x951
	.uleb128 0x13
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x5d8
	.4byte	0x2c
	.4byte	.LLST40
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x5da
	.4byte	0xaa
	.4byte	.LLST41
	.byte	0
	.uleb128 0x12
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x5f9
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x976
	.uleb128 0x15
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x5f9
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x22
	.4byte	0x2c
	.4byte	0x986
	.uleb128 0x23
	.4byte	0x7e
	.byte	0xf
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF111
	.byte	0x1
	.byte	0x5a
	.4byte	0x997
	.uleb128 0x5
	.byte	0x3
	.4byte	APBAHBPrescTable
	.uleb128 0x24
	.4byte	0x99c
	.uleb128 0x5
	.4byte	0x976
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
	.uleb128 0x17
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
	.uleb128 0x17
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL5
	.4byte	.LFE35
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL11
	.4byte	.LFE37
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL20
	.4byte	.LFE43
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL23
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LFE45
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL26
	.4byte	.LFE45
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL29
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL32
	.4byte	.LFE48
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL32
	.4byte	.LFE48
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL33
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36
	.4byte	.LFE50
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL34
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL36
	.4byte	.LFE50
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL37
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LFE51
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL40
	.4byte	.LFE51
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL44
	.4byte	.LFE53
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL46
	.4byte	.LFE54
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL47
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL48
	.4byte	.LFE55
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL49
	.4byte	.LVL65
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL65
	.4byte	.LVL75
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL75
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL49
	.4byte	.LVL50
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL50
	.4byte	.LVL51
	.2byte	0x5
	.byte	0x72
	.sleb128 0
	.byte	0x3c
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x5
	.byte	0x72
	.sleb128 0
	.byte	0x3c
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL53
	.4byte	.LVL55
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL55
	.4byte	.LVL66-1
	.2byte	0x5
	.byte	0x72
	.sleb128 0
	.byte	0x3c
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL71
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL49
	.4byte	.LVL54
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL54
	.4byte	.LVL56
	.2byte	0x7
	.byte	0x76
	.sleb128 0
	.byte	0x4e
	.byte	0x41
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL57
	.4byte	.LVL59
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL60
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL49
	.4byte	.LVL55
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL58
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL60
	.4byte	.LVL62
	.2byte	0x7
	.byte	0x73
	.sleb128 0
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL49
	.4byte	.LVL61
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL61
	.4byte	.LVL63
	.2byte	0x7
	.byte	0x71
	.sleb128 0
	.byte	0x3f
	.byte	0x1a
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL64
	.4byte	.LVL66-1
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL49
	.4byte	.LVL69
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL69
	.4byte	.LVL70
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL72
	.4byte	.LVL73
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL76
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL77
	.4byte	.LFE57
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL80
	.4byte	.LVL81
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL81
	.4byte	.LVL82
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL82
	.4byte	.LVL83
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL83
	.4byte	.LFE60
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL84
	.4byte	.LVL85
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL85
	.4byte	.LVL86
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL86
	.4byte	.LVL87
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL87
	.4byte	.LFE61
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL88
	.4byte	.LVL89
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL89
	.4byte	.LVL90
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL90
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL91
	.4byte	.LFE62
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL92
	.4byte	.LVL93
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL93
	.4byte	.LVL94
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL94
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL95
	.4byte	.LFE63
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL96
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL97
	.4byte	.LVL98
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL98
	.4byte	.LVL99
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL99
	.4byte	.LFE64
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL100
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL101
	.4byte	.LVL102
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL102
	.4byte	.LVL103
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL103
	.4byte	.LFE65
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL104
	.4byte	.LVL105
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL105
	.4byte	.LVL106
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL106
	.4byte	.LVL107
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL107
	.4byte	.LFE66
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL108
	.4byte	.LVL117
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL117
	.4byte	.LFE67
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL108
	.4byte	.LVL109
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL109
	.4byte	.LVL116
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL116
	.4byte	.LVL117
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x4f
	.byte	0x1a
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL108
	.4byte	.LVL110
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL110
	.4byte	.LVL111
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL111
	.4byte	.LVL112
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL112
	.4byte	.LVL113
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL113
	.4byte	.LVL114
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL114
	.4byte	.LVL115
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL115
	.4byte	.LVL116
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL116
	.4byte	.LVL118
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL108
	.4byte	.LVL116
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL116
	.4byte	.LVL117
	.2byte	0xf
	.byte	0x31
	.byte	0x70
	.sleb128 0
	.byte	0x4f
	.byte	0x1a
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x24
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST38:
	.4byte	.LVL119
	.4byte	.LVL122
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL122
	.4byte	.LVL123
	.2byte	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x48
	.byte	0x24
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL120
	.4byte	.LVL121
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST40:
	.4byte	.LVL124
	.4byte	.LVL126
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL126
	.4byte	.LFE69
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST41:
	.4byte	.LVL124
	.4byte	.LVL125
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL125
	.4byte	.LVL126
	.2byte	0xb
	.byte	0x70
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
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
.LASF28:
	.ascii	"CFGR2\000"
.LASF72:
	.ascii	"RCC_CECCLKConfig\000"
.LASF29:
	.ascii	"CFGR3\000"
.LASF76:
	.ascii	"RCC_USARTCLKConfig\000"
.LASF69:
	.ascii	"RCC_HCLK\000"
.LASF70:
	.ascii	"RCC_ADCCLKConfig\000"
.LASF60:
	.ascii	"RCC_PREDIV1_Div\000"
.LASF110:
	.ascii	"RCC_ClearITPendingBit\000"
.LASF37:
	.ascii	"USART1CLK_Frequency\000"
.LASF73:
	.ascii	"RCC_CECCLK\000"
.LASF51:
	.ascii	"RCC_LSE\000"
.LASF77:
	.ascii	"RCC_USARTCLK\000"
.LASF109:
	.ascii	"RCC_GetITStatus\000"
.LASF114:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF26:
	.ascii	"BDCR\000"
.LASF91:
	.ascii	"RCC_APB2Periph\000"
.LASF48:
	.ascii	"RCC_HSI14Cmd\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"APB1RSTR\000"
.LASF58:
	.ascii	"RCC_PLLCmd\000"
.LASF38:
	.ascii	"RCC_ClocksTypeDef\000"
.LASF59:
	.ascii	"RCC_PREDIV1Config\000"
.LASF88:
	.ascii	"RCC_AHBPeriphClockCmd\000"
.LASF20:
	.ascii	"CFGR\000"
.LASF94:
	.ascii	"RCC_AHBPeriphResetCmd\000"
.LASF32:
	.ascii	"HCLK_Frequency\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF71:
	.ascii	"RCC_ADCCLK\000"
.LASF25:
	.ascii	"APB1ENR\000"
.LASF83:
	.ascii	"presc\000"
.LASF44:
	.ascii	"NewState\000"
.LASF62:
	.ascii	"RCC_MCOConfig\000"
.LASF107:
	.ascii	"RCC_DeInit\000"
.LASF103:
	.ascii	"RCC_WaitForHSEStartUp\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF2:
	.ascii	"short int\000"
.LASF85:
	.ascii	"RCC_RTCCLKSource\000"
.LASF27:
	.ascii	"AHBRSTR\000"
.LASF18:
	.ascii	"SUCCESS\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF96:
	.ascii	"RCC_APB1PeriphResetCmd\000"
.LASF55:
	.ascii	"RCC_PLLConfig\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF19:
	.ascii	"ErrorStatus\000"
.LASF75:
	.ascii	"RCC_I2CCLK\000"
.LASF80:
	.ascii	"pllmull\000"
.LASF54:
	.ascii	"RCC_LSICmd\000"
.LASF115:
	.ascii	"RCC_GetSYSCLKSource\000"
.LASF21:
	.ascii	"APB2RSTR\000"
.LASF17:
	.ascii	"ERROR\000"
.LASF81:
	.ascii	"pllsource\000"
.LASF23:
	.ascii	"AHBENR\000"
.LASF102:
	.ascii	"RCC_GetFlagStatus\000"
.LASF47:
	.ascii	"tmpreg\000"
.LASF113:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_rcc.c\000"
.LASF33:
	.ascii	"PCLK_Frequency\000"
.LASF100:
	.ascii	"statusreg\000"
.LASF35:
	.ascii	"CECCLK_Frequency\000"
.LASF92:
	.ascii	"RCC_APB1PeriphClockCmd\000"
.LASF63:
	.ascii	"RCC_MCOSource\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF24:
	.ascii	"APB2ENR\000"
.LASF104:
	.ascii	"StartUpCounter\000"
.LASF0:
	.ascii	"signed char\000"
.LASF87:
	.ascii	"RCC_BackupResetCmd\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF99:
	.ascii	"RCC_FLAG\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF56:
	.ascii	"RCC_PLLSource\000"
.LASF64:
	.ascii	"RCC_SYSCLKConfig\000"
.LASF74:
	.ascii	"RCC_I2CCLKConfig\000"
.LASF84:
	.ascii	"RCC_RTCCLKConfig\000"
.LASF95:
	.ascii	"RCC_APB2PeriphResetCmd\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF105:
	.ascii	"status\000"
.LASF68:
	.ascii	"RCC_PCLKConfig\000"
.LASF106:
	.ascii	"HSEStatus\000"
.LASF67:
	.ascii	"RCC_SYSCLK\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF49:
	.ascii	"RCC_HSI14ADCRequestCmd\000"
.LASF57:
	.ascii	"RCC_PLLMul\000"
.LASF34:
	.ascii	"ADCCLK_Frequency\000"
.LASF39:
	.ascii	"RCC_HSEConfig\000"
.LASF30:
	.ascii	"RCC_TypeDef\000"
.LASF31:
	.ascii	"SYSCLK_Frequency\000"
.LASF79:
	.ascii	"RCC_Clocks\000"
.LASF45:
	.ascii	"RCC_AdjustHSI14CalibrationValue\000"
.LASF11:
	.ascii	"RESET\000"
.LASF86:
	.ascii	"RCC_RTCCLKCmd\000"
.LASF112:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF97:
	.ascii	"RCC_ITConfig\000"
.LASF90:
	.ascii	"RCC_APB2PeriphClockCmd\000"
.LASF41:
	.ascii	"RCC_HSE\000"
.LASF46:
	.ascii	"HSI14CalibrationValue\000"
.LASF65:
	.ascii	"RCC_SYSCLKSource\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF36:
	.ascii	"I2C1CLK_Frequency\000"
.LASF53:
	.ascii	"RCC_LSEDrive\000"
.LASF50:
	.ascii	"RCC_LSEConfig\000"
.LASF111:
	.ascii	"APBAHBPrescTable\000"
.LASF42:
	.ascii	"HSICalibrationValue\000"
.LASF78:
	.ascii	"RCC_GetClocksFreq\000"
.LASF82:
	.ascii	"prediv1factor\000"
.LASF108:
	.ascii	"RCC_ClearFlag\000"
.LASF61:
	.ascii	"RCC_ClockSecuritySystemCmd\000"
.LASF66:
	.ascii	"RCC_HCLKConfig\000"
.LASF43:
	.ascii	"RCC_HSICmd\000"
.LASF101:
	.ascii	"bitstatus\000"
.LASF98:
	.ascii	"RCC_IT\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF40:
	.ascii	"RCC_AdjustHSICalibrationValue\000"
.LASF89:
	.ascii	"RCC_AHBPeriph\000"
.LASF52:
	.ascii	"RCC_LSEDriveConfig\000"
.LASF93:
	.ascii	"RCC_APB1Periph\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
