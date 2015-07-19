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
	.file	"stm32f0xx_adc.c"
	.text
.Ltext0:
	.section	.text.ADC_DeInit,"ax",%progbits
	.align	1
	.global	ADC_DeInit
	.code	16
	.thumb_func
	.type	ADC_DeInit, %function
ADC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_adc.c"
	.loc 1 131 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 135 0
	ldr	r3, .L4
	cmp	r0, r3
	bne	.L1
	.loc 1 138 0
	mov	r0, #128
.LVL1:
	lsl	r0, r0, #2
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
.LVL2:
	.loc 1 141 0
	mov	r0, #128
	lsl	r0, r0, #2
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
.LVL3:
.L1:
	.loc 1 143 0
	@ sp needed
	pop	{r3, pc}
.L5:
	.align	2
.L4:
	.word	1073816576
.LFE32:
	.size	ADC_DeInit, .-ADC_DeInit
	.section	.text.ADC_Init,"ax",%progbits
	.align	1
	.global	ADC_Init
	.code	16
	.thumb_func
	.type	ADC_Init, %function
ADC_Init:
.LFB33:
	.loc 1 157 0
.LVL4:
	.loc 1 184 0
	ldr	r3, [r1]
	ldr	r2, [r1, #8]
	.loc 1 157 0
	push	{r4, lr}
.LCFI1:
	.loc 1 184 0
	orr	r2, r3
	ldr	r3, [r1, #12]
	.loc 1 170 0
	ldr	r4, [r0, #12]
.LVL5:
	.loc 1 184 0
	orr	r2, r3
	.loc 1 185 0
	ldr	r3, [r1, #16]
	.loc 1 190 0
	@ sp needed
	.loc 1 185 0
	orr	r2, r3
	ldr	r3, [r1, #20]
	orr	r2, r3
	.loc 1 173 0
	ldr	r3, .L7
	and	r3, r4
.LVL6:
	.loc 1 184 0
	orr	r3, r2
.LVL7:
	ldrb	r2, [r1, #4]
	lsl	r2, r2, #13
	orr	r3, r2
.LVL8:
	.loc 1 189 0
	str	r3, [r0, #12]
	.loc 1 190 0
	pop	{r4, pc}
.L8:
	.align	2
.L7:
	.word	-11773
.LFE33:
	.size	ADC_Init, .-ADC_Init
	.section	.text.ADC_StructInit,"ax",%progbits
	.align	1
	.global	ADC_StructInit
	.code	16
	.thumb_func
	.type	ADC_StructInit, %function
ADC_StructInit:
.LFB34:
	.loc 1 202 0
.LVL9:
	.loc 1 205 0
	mov	r3, #0
	str	r3, [r0]
	.loc 1 208 0
	strb	r3, [r0, #4]
	.loc 1 211 0
	str	r3, [r0, #8]
	.loc 1 214 0
	str	r3, [r0, #12]
	.loc 1 217 0
	str	r3, [r0, #16]
	.loc 1 220 0
	str	r3, [r0, #20]
	.loc 1 221 0
	@ sp needed
	bx	lr
.LFE34:
	.size	ADC_StructInit, .-ADC_StructInit
	.section	.text.ADC_Cmd,"ax",%progbits
	.align	1
	.global	ADC_Cmd
	.code	16
	.thumb_func
	.type	ADC_Cmd, %function
ADC_Cmd:
.LFB35:
	.loc 1 231 0
.LVL10:
	.loc 1 239 0
	ldr	r3, [r0, #8]
	mov	r2, #1
	.loc 1 236 0
	cmp	r1, #0
	bne	.L13
	.loc 1 244 0
	mov	r2, #2
.L13:
	orr	r3, r2
	str	r3, [r0, #8]
	.loc 1 246 0
	@ sp needed
	bx	lr
.LFE35:
	.size	ADC_Cmd, .-ADC_Cmd
	.section	.text.ADC_JitterCmd,"ax",%progbits
	.align	1
	.global	ADC_JitterCmd
	.code	16
	.thumb_func
	.type	ADC_JitterCmd, %function
ADC_JitterCmd:
.LFB36:
	.loc 1 260 0
.LVL11:
	.loc 1 269 0
	ldr	r3, [r0, #16]
	.loc 1 266 0
	cmp	r2, #0
	beq	.L15
	.loc 1 269 0
	orr	r1, r3
.LVL12:
	str	r1, [r0, #16]
	b	.L14
.LVL13:
.L15:
	.loc 1 274 0
	bic	r3, r1
	str	r3, [r0, #16]
.LVL14:
.L14:
	.loc 1 276 0
	@ sp needed
	bx	lr
.LFE36:
	.size	ADC_JitterCmd, .-ADC_JitterCmd
	.section	.text.ADC_AutoPowerOffCmd,"ax",%progbits
	.align	1
	.global	ADC_AutoPowerOffCmd
	.code	16
	.thumb_func
	.type	ADC_AutoPowerOffCmd, %function
ADC_AutoPowerOffCmd:
.LFB37:
	.loc 1 318 0
.LVL15:
	.loc 1 326 0
	ldr	r2, [r0, #12]
	.loc 1 323 0
	cmp	r1, #0
	beq	.L18
	.loc 1 326 0
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	b	.L20
.L18:
	.loc 1 331 0
	ldr	r3, .L21
	and	r3, r2
.L20:
	str	r3, [r0, #12]
	.loc 1 333 0
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	-32769
.LFE37:
	.size	ADC_AutoPowerOffCmd, .-ADC_AutoPowerOffCmd
	.section	.text.ADC_WaitModeCmd,"ax",%progbits
	.align	1
	.global	ADC_WaitModeCmd
	.code	16
	.thumb_func
	.type	ADC_WaitModeCmd, %function
ADC_WaitModeCmd:
.LFB38:
	.loc 1 353 0
.LVL16:
	.loc 1 361 0
	ldr	r2, [r0, #12]
	.loc 1 358 0
	cmp	r1, #0
	beq	.L24
	.loc 1 361 0
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	b	.L26
.L24:
	.loc 1 366 0
	ldr	r3, .L27
	and	r3, r2
.L26:
	str	r3, [r0, #12]
	.loc 1 368 0
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
	.word	-16385
.LFE38:
	.size	ADC_WaitModeCmd, .-ADC_WaitModeCmd
	.section	.text.ADC_AnalogWatchdogCmd,"ax",%progbits
	.align	1
	.global	ADC_AnalogWatchdogCmd
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogCmd, %function
ADC_AnalogWatchdogCmd:
.LFB39:
	.loc 1 405 0
.LVL17:
	.loc 1 413 0
	ldr	r2, [r0, #12]
	.loc 1 410 0
	cmp	r1, #0
	beq	.L30
	.loc 1 413 0
	mov	r3, #128
	lsl	r3, r3, #16
	orr	r3, r2
	b	.L32
.L30:
	.loc 1 418 0
	ldr	r3, .L33
	and	r3, r2
.L32:
	str	r3, [r0, #12]
	.loc 1 420 0
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
	.word	-8388609
.LFE39:
	.size	ADC_AnalogWatchdogCmd, .-ADC_AnalogWatchdogCmd
	.section	.text.ADC_AnalogWatchdogThresholdsConfig,"ax",%progbits
	.align	1
	.global	ADC_AnalogWatchdogThresholdsConfig
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogThresholdsConfig, %function
ADC_AnalogWatchdogThresholdsConfig:
.LFB40:
	.loc 1 433 0
.LVL18:
	.loc 1 440 0
	lsl	r1, r1, #16
.LVL19:
	orr	r1, r2
	str	r1, [r0, #32]
	.loc 1 442 0
	@ sp needed
	bx	lr
.LFE40:
	.size	ADC_AnalogWatchdogThresholdsConfig, .-ADC_AnalogWatchdogThresholdsConfig
	.section	.text.ADC_AnalogWatchdogSingleChannelConfig,"ax",%progbits
	.align	1
	.global	ADC_AnalogWatchdogSingleChannelConfig
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogSingleChannelConfig, %function
ADC_AnalogWatchdogSingleChannelConfig:
.LFB41:
	.loc 1 473 0
.LVL20:
	.loc 1 481 0
	ldr	r2, [r0, #12]
.LVL21:
	.loc 1 484 0
	ldr	r3, .L37
	.loc 1 491 0
	@ sp needed
	.loc 1 484 0
	and	r3, r2
.LVL22:
	.loc 1 487 0
	orr	r1, r3
.LVL23:
	.loc 1 490 0
	str	r1, [r0, #12]
	.loc 1 491 0
	bx	lr
.L38:
	.align	2
.L37:
	.word	-2080374785
.LFE41:
	.size	ADC_AnalogWatchdogSingleChannelConfig, .-ADC_AnalogWatchdogSingleChannelConfig
	.section	.text.ADC_AnalogWatchdogSingleChannelCmd,"ax",%progbits
	.align	1
	.global	ADC_AnalogWatchdogSingleChannelCmd
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogSingleChannelCmd, %function
ADC_AnalogWatchdogSingleChannelCmd:
.LFB42:
	.loc 1 501 0
.LVL24:
	.loc 1 509 0
	ldr	r2, [r0, #12]
	.loc 1 506 0
	cmp	r1, #0
	beq	.L40
	.loc 1 509 0
	mov	r3, #128
	lsl	r3, r3, #15
	orr	r3, r2
	b	.L42
.L40:
	.loc 1 514 0
	ldr	r3, .L43
	and	r3, r2
.L42:
	str	r3, [r0, #12]
	.loc 1 516 0
	@ sp needed
	bx	lr
.L44:
	.align	2
.L43:
	.word	-4194305
.LFE42:
	.size	ADC_AnalogWatchdogSingleChannelCmd, .-ADC_AnalogWatchdogSingleChannelCmd
	.section	.text.ADC_TempSensorCmd,"ax",%progbits
	.align	1
	.global	ADC_TempSensorCmd
	.code	16
	.thumb_func
	.type	ADC_TempSensorCmd, %function
ADC_TempSensorCmd:
.LFB43:
	.loc 1 553 0
.LVL25:
	ldr	r3, .L49
	.loc 1 560 0
	ldr	r1, [r3]
	.loc 1 557 0
	cmp	r0, #0
	beq	.L46
	.loc 1 560 0
	mov	r2, #128
	lsl	r2, r2, #16
	orr	r2, r1
	b	.L48
.L46:
	.loc 1 565 0
	ldr	r2, .L49+4
	and	r2, r1
.L48:
	str	r2, [r3]
	.loc 1 567 0
	@ sp needed
	bx	lr
.L50:
	.align	2
.L49:
	.word	1073817352
	.word	-8388609
.LFE43:
	.size	ADC_TempSensorCmd, .-ADC_TempSensorCmd
	.section	.text.ADC_VrefintCmd,"ax",%progbits
	.align	1
	.global	ADC_VrefintCmd
	.code	16
	.thumb_func
	.type	ADC_VrefintCmd, %function
ADC_VrefintCmd:
.LFB44:
	.loc 1 576 0
.LVL26:
	ldr	r3, .L55
	.loc 1 583 0
	ldr	r1, [r3]
	.loc 1 580 0
	cmp	r0, #0
	beq	.L52
	.loc 1 583 0
	mov	r2, #128
	lsl	r2, r2, #15
	orr	r2, r1
	b	.L54
.L52:
	.loc 1 588 0
	ldr	r2, .L55+4
	and	r2, r1
.L54:
	str	r2, [r3]
	.loc 1 590 0
	@ sp needed
	bx	lr
.L56:
	.align	2
.L55:
	.word	1073817352
	.word	-4194305
.LFE44:
	.size	ADC_VrefintCmd, .-ADC_VrefintCmd
	.section	.text.ADC_VbatCmd,"ax",%progbits
	.align	1
	.global	ADC_VbatCmd
	.code	16
	.thumb_func
	.type	ADC_VbatCmd, %function
ADC_VbatCmd:
.LFB45:
	.loc 1 599 0
.LVL27:
	ldr	r3, .L61
	.loc 1 606 0
	ldr	r1, [r3]
	.loc 1 603 0
	cmp	r0, #0
	beq	.L58
	.loc 1 606 0
	mov	r2, #128
	lsl	r2, r2, #17
	orr	r2, r1
	b	.L60
.L58:
	.loc 1 611 0
	ldr	r2, .L61+4
	and	r2, r1
.L60:
	str	r2, [r3]
	.loc 1 613 0
	@ sp needed
	bx	lr
.L62:
	.align	2
.L61:
	.word	1073817352
	.word	-16777217
.LFE45:
	.size	ADC_VbatCmd, .-ADC_VbatCmd
	.section	.text.ADC_ChannelConfig,"ax",%progbits
	.align	1
	.global	ADC_ChannelConfig
	.code	16
	.thumb_func
	.type	ADC_ChannelConfig, %function
ADC_ChannelConfig:
.LFB46:
	.loc 1 693 0
.LVL28:
	.loc 1 702 0
	ldr	r3, [r0, #40]
	.loc 1 712 0
	@ sp needed
	.loc 1 702 0
	orr	r1, r3
.LVL29:
	str	r1, [r0, #40]
.LVL30:
	.loc 1 711 0
	str	r2, [r0, #20]
	.loc 1 712 0
	bx	lr
.LFE46:
	.size	ADC_ChannelConfig, .-ADC_ChannelConfig
	.section	.text.ADC_ContinuousModeCmd,"ax",%progbits
	.align	1
	.global	ADC_ContinuousModeCmd
	.code	16
	.thumb_func
	.type	ADC_ContinuousModeCmd, %function
ADC_ContinuousModeCmd:
.LFB47:
	.loc 1 725 0
.LVL31:
	.loc 1 733 0
	ldr	r2, [r0, #12]
	.loc 1 730 0
	cmp	r1, #0
	beq	.L65
	.loc 1 733 0
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	b	.L67
.L65:
	.loc 1 738 0
	ldr	r3, .L68
	and	r3, r2
.L67:
	str	r3, [r0, #12]
	.loc 1 740 0
	@ sp needed
	bx	lr
.L69:
	.align	2
.L68:
	.word	-8193
.LFE47:
	.size	ADC_ContinuousModeCmd, .-ADC_ContinuousModeCmd
	.section	.text.ADC_DiscModeCmd,"ax",%progbits
	.align	1
	.global	ADC_DiscModeCmd
	.code	16
	.thumb_func
	.type	ADC_DiscModeCmd, %function
ADC_DiscModeCmd:
.LFB48:
	.loc 1 753 0
.LVL32:
	.loc 1 761 0
	ldr	r2, [r0, #12]
	.loc 1 758 0
	cmp	r1, #0
	beq	.L71
	.loc 1 761 0
	mov	r3, #128
	lsl	r3, r3, #9
	orr	r3, r2
	b	.L73
.L71:
	.loc 1 766 0
	ldr	r3, .L74
	and	r3, r2
.L73:
	str	r3, [r0, #12]
	.loc 1 768 0
	@ sp needed
	bx	lr
.L75:
	.align	2
.L74:
	.word	-65537
.LFE48:
	.size	ADC_DiscModeCmd, .-ADC_DiscModeCmd
	.section	.text.ADC_OverrunModeCmd,"ax",%progbits
	.align	1
	.global	ADC_OverrunModeCmd
	.code	16
	.thumb_func
	.type	ADC_OverrunModeCmd, %function
ADC_OverrunModeCmd:
.LFB49:
	.loc 1 778 0
.LVL33:
	.loc 1 786 0
	ldr	r2, [r0, #12]
	.loc 1 783 0
	cmp	r1, #0
	beq	.L77
	.loc 1 786 0
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	b	.L79
.L77:
	.loc 1 791 0
	ldr	r3, .L80
	and	r3, r2
.L79:
	str	r3, [r0, #12]
	.loc 1 793 0
	@ sp needed
	bx	lr
.L81:
	.align	2
.L80:
	.word	-4097
.LFE49:
	.size	ADC_OverrunModeCmd, .-ADC_OverrunModeCmd
	.section	.text.ADC_GetCalibrationFactor,"ax",%progbits
	.align	1
	.global	ADC_GetCalibrationFactor
	.code	16
	.thumb_func
	.type	ADC_GetCalibrationFactor, %function
ADC_GetCalibrationFactor:
.LFB50:
	.loc 1 803 0
.LVL34:
	.loc 1 810 0
	ldr	r2, [r0, #8]
	mov	r3, #128
	lsl	r3, r3, #24
	orr	r3, r2
	str	r3, [r0, #8]
	mov	r3, #240
	lsl	r3, r3, #8
.LVL35:
.L84:
	.loc 1 815 0 discriminator 1
	ldr	r2, [r0, #8]
	sub	r3, r3, #1
.LVL36:
	lsr	r2, r2, #31
	lsl	r2, r2, #31
.LVL37:
	.loc 1 817 0 discriminator 1
	cmp	r3, #0
	beq	.L83
.LVL38:
	cmp	r2, #0
	bne	.L84
.LVL39:
.L83:
	.loc 1 819 0
	ldr	r3, [r0, #8]
	cmp	r3, #0
	blt	.L86
	.loc 1 822 0
	ldr	r0, [r0, #64]
.LVL40:
	b	.L85
.LVL41:
.L86:
	.loc 1 827 0
	mov	r0, #0
.LVL42:
.L85:
	.loc 1 830 0
	@ sp needed
	bx	lr
.LFE50:
	.size	ADC_GetCalibrationFactor, .-ADC_GetCalibrationFactor
	.section	.text.ADC_StopOfConversion,"ax",%progbits
	.align	1
	.global	ADC_StopOfConversion
	.code	16
	.thumb_func
	.type	ADC_StopOfConversion, %function
ADC_StopOfConversion:
.LFB51:
	.loc 1 840 0
.LVL43:
	.loc 1 844 0
	ldr	r3, [r0, #8]
	mov	r2, #16
	orr	r3, r2
	str	r3, [r0, #8]
	.loc 1 845 0
	@ sp needed
	bx	lr
.LFE51:
	.size	ADC_StopOfConversion, .-ADC_StopOfConversion
	.section	.text.ADC_StartOfConversion,"ax",%progbits
	.align	1
	.global	ADC_StartOfConversion
	.code	16
	.thumb_func
	.type	ADC_StartOfConversion, %function
ADC_StartOfConversion:
.LFB52:
	.loc 1 855 0
.LVL44:
	.loc 1 859 0
	ldr	r3, [r0, #8]
	mov	r2, #4
	orr	r3, r2
	str	r3, [r0, #8]
	.loc 1 860 0
	@ sp needed
	bx	lr
.LFE52:
	.size	ADC_StartOfConversion, .-ADC_StartOfConversion
	.section	.text.ADC_GetConversionValue,"ax",%progbits
	.align	1
	.global	ADC_GetConversionValue
	.code	16
	.thumb_func
	.type	ADC_GetConversionValue, %function
ADC_GetConversionValue:
.LFB53:
	.loc 1 868 0
.LVL45:
	.loc 1 873 0
	ldr	r0, [r0, #64]
.LVL46:
	.loc 1 874 0
	@ sp needed
	.loc 1 873 0
	uxth	r0, r0
	.loc 1 874 0
	bx	lr
.LFE53:
	.size	ADC_GetConversionValue, .-ADC_GetConversionValue
	.section	.text.ADC_DMACmd,"ax",%progbits
	.align	1
	.global	ADC_DMACmd
	.code	16
	.thumb_func
	.type	ADC_DMACmd, %function
ADC_DMACmd:
.LFB54:
	.loc 1 912 0
.LVL47:
	mov	r3, #1
	.loc 1 920 0
	ldr	r2, [r0, #12]
	.loc 1 917 0
	cmp	r1, #0
	beq	.L97
	.loc 1 920 0
	orr	r3, r2
	b	.L99
.L97:
	.loc 1 925 0
	bic	r2, r3
	mov	r3, r2
.L99:
	str	r3, [r0, #12]
	.loc 1 927 0
	@ sp needed
	bx	lr
.LFE54:
	.size	ADC_DMACmd, .-ADC_DMACmd
	.section	.text.ADC_DMARequestModeConfig,"ax",%progbits
	.align	1
	.global	ADC_DMARequestModeConfig
	.code	16
	.thumb_func
	.type	ADC_DMARequestModeConfig, %function
ADC_DMARequestModeConfig:
.LFB55:
	.loc 1 939 0
.LVL48:
	.loc 1 943 0
	ldr	r3, [r0, #12]
	mov	r2, #2
	bic	r3, r2
	str	r3, [r0, #12]
	.loc 1 944 0
	ldr	r3, [r0, #12]
	.loc 1 945 0
	@ sp needed
	.loc 1 944 0
	orr	r1, r3
.LVL49:
	str	r1, [r0, #12]
	.loc 1 945 0
	bx	lr
.LFE55:
	.size	ADC_DMARequestModeConfig, .-ADC_DMARequestModeConfig
	.section	.text.ADC_ITConfig,"ax",%progbits
	.align	1
	.global	ADC_ITConfig
	.code	16
	.thumb_func
	.type	ADC_ITConfig, %function
ADC_ITConfig:
.LFB56:
	.loc 1 1047 0
.LVL50:
	.loc 1 1056 0
	ldr	r3, [r0, #4]
	.loc 1 1053 0
	cmp	r2, #0
	beq	.L102
	.loc 1 1056 0
	orr	r1, r3
.LVL51:
	str	r1, [r0, #4]
	b	.L101
.LVL52:
.L102:
	.loc 1 1061 0
	bic	r3, r1
	str	r3, [r0, #4]
.LVL53:
.L101:
	.loc 1 1063 0
	@ sp needed
	bx	lr
.LFE56:
	.size	ADC_ITConfig, .-ADC_ITConfig
	.section	.text.ADC_GetFlagStatus,"ax",%progbits
	.align	1
	.global	ADC_GetFlagStatus
	.code	16
	.thumb_func
	.type	ADC_GetFlagStatus, %function
ADC_GetFlagStatus:
.LFB57:
	.loc 1 1084 0
.LVL54:
	.loc 1 1092 0
	lsl	r3, r1, #7
	bpl	.L105
	.loc 1 1094 0
	ldr	r2, [r0, #8]
	ldr	r3, .L107
	and	r3, r2
.LVL55:
	b	.L106
.LVL56:
.L105:
	.loc 1 1098 0
	ldr	r3, [r0]
.LVL57:
.L106:
	.loc 1 1102 0
	and	r3, r1
.LVL58:
	sub	r1, r3, #1
	sbc	r3, r3, r1
.LVL59:
	.loc 1 1113 0
	uxtb	r0, r3
.LVL60:
	.loc 1 1114 0
	@ sp needed
	bx	lr
.L108:
	.align	2
.L107:
	.word	-16777217
.LFE57:
	.size	ADC_GetFlagStatus, .-ADC_GetFlagStatus
	.section	.text.ADC_ClearFlag,"ax",%progbits
	.align	1
	.global	ADC_ClearFlag
	.code	16
	.thumb_func
	.type	ADC_ClearFlag, %function
ADC_ClearFlag:
.LFB58:
	.loc 1 1130 0
.LVL61:
	.loc 1 1136 0
	str	r1, [r0]
	.loc 1 1137 0
	@ sp needed
	bx	lr
.LFE58:
	.size	ADC_ClearFlag, .-ADC_ClearFlag
	.section	.text.ADC_GetITStatus,"ax",%progbits
	.align	1
	.global	ADC_GetITStatus
	.code	16
	.thumb_func
	.type	ADC_GetITStatus, %function
ADC_GetITStatus:
.LFB59:
	.loc 1 1153 0
.LVL62:
	.loc 1 1162 0
	ldr	r3, [r0, #4]
.LVL63:
	.loc 1 1165 0
	ldr	r2, [r0]
	.loc 1 1173 0
	mov	r0, #0
.LVL64:
	.loc 1 1165 0
	tst	r2, r1
	beq	.L111
	.loc 1 1162 0 discriminator 1
	and	r1, r3
.LVL65:
	.loc 1 1165 0 discriminator 1
	sub	r0, r1, #1
	sbc	r1, r1, r0
.LVL66:
	.loc 1 1168 0 discriminator 1
	uxtb	r0, r1
.L111:
.LVL67:
	.loc 1 1177 0
	@ sp needed
	bx	lr
.LFE59:
	.size	ADC_GetITStatus, .-ADC_GetITStatus
	.section	.text.ADC_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	ADC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	ADC_ClearITPendingBit, %function
ADC_ClearITPendingBit:
.LFB60:
	.loc 1 1193 0
.LVL68:
	.loc 1 1199 0
	str	r1, [r0]
	.loc 1 1200 0
	@ sp needed
	bx	lr
.LFE60:
	.size	ADC_ClearITPendingBit, .-ADC_ClearITPendingBit
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
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.align	2
.LEFDE56:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_adc.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x891
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x1
	.4byte	.LASF80
	.4byte	.LASF81
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
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.4byte	0x45
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
	.uleb128 0x9
	.byte	0x44
	.byte	0x3
	.byte	0xee
	.4byte	0x16c
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.byte	0xf0
	.4byte	0x7a
	.byte	0
	.uleb128 0xa
	.ascii	"IER\000"
	.byte	0x3
	.byte	0xf1
	.4byte	0x7a
	.byte	0x4
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.byte	0xf2
	.4byte	0x7a
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.byte	0xf3
	.4byte	0x7a
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.byte	0xf4
	.4byte	0x7a
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.byte	0xf5
	.4byte	0x7a
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.byte	0xf6
	.4byte	0x53
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.byte	0xf7
	.4byte	0x53
	.byte	0x1c
	.uleb128 0xa
	.ascii	"TR\000"
	.byte	0x3
	.byte	0xf8
	.4byte	0x7a
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.byte	0xf9
	.4byte	0x53
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.byte	0xfa
	.4byte	0x7a
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.byte	0xfb
	.4byte	0x16c
	.byte	0x2c
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x3
	.byte	0xfc
	.4byte	0x7a
	.byte	0x40
	.byte	0
	.uleb128 0xc
	.4byte	0x53
	.4byte	0x17c
	.uleb128 0xd
	.4byte	0x73
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x3
	.byte	0xfd
	.4byte	0xca
	.uleb128 0x9
	.byte	0x4
	.byte	0x3
	.byte	0xff
	.4byte	0x19d
	.uleb128 0xe
	.ascii	"CCR\000"
	.byte	0x3
	.2byte	0x101
	.4byte	0x7a
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x102
	.4byte	0x187
	.uleb128 0x9
	.byte	0x18
	.byte	0x4
	.byte	0x36
	.4byte	0x1fa
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x4
	.byte	0x38
	.4byte	0x53
	.byte	0
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3b
	.4byte	0xbf
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x4
	.byte	0x3f
	.4byte	0x53
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x4
	.byte	0x43
	.4byte	0x53
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x4
	.byte	0x47
	.4byte	0x53
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x4
	.byte	0x4a
	.4byte	0x53
	.byte	0x14
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0x4d
	.4byte	0x1a9
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x1
	.byte	0x82
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25a
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0x82
	.4byte	0x25a
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LVL2
	.4byte	0x881
	.4byte	0x243
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x200
	.byte	0
	.uleb128 0x14
	.4byte	.LVL3
	.4byte	0x881
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xa
	.2byte	0x200
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x17c
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0x9c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29f
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.byte	0x9c
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x1
	.byte	0x9c
	.4byte	0x29f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.byte	0x9e
	.4byte	0x53
	.4byte	.LLST1
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.4byte	0x1fa
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c8
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x1
	.byte	0xc9
	.4byte	0x29f
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0x1
	.byte	0xe6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f8
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.byte	0xe6
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.byte	0xe6
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x103
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x33b
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x103
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x103
	.4byte	0x53
	.4byte	.LLST2
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x103
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36e
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x13d
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x13d
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x160
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a1
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x160
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x160
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x194
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d4
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x194
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x194
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x417
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1af
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1af
	.4byte	0x3a
	.4byte	.LLST3
	.uleb128 0x19
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x18
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1d8
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x45c
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x53
	.4byte	.LLST4
	.uleb128 0x1b
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1da
	.4byte	0x53
	.4byte	.LLST5
	.byte	0
	.uleb128 0x18
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1f4
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x48f
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1f4
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x228
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b4
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x228
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x23f
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d9
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x23f
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x256
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4fe
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x256
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x2b4
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x551
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2b4
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x2b4
	.4byte	0x53
	.4byte	.LLST6
	.uleb128 0x19
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x2b4
	.4byte	0x53
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1b
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x2b6
	.4byte	0x53
	.4byte	.LLST7
	.byte	0
	.uleb128 0x18
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x2d4
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x584
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2d4
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2d4
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2f0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b7
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2f0
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2f0
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x309
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ea
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x309
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x309
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x322
	.4byte	0x53
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x645
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x322
	.4byte	0x25a
	.4byte	.LLST8
	.uleb128 0x1b
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x324
	.4byte	0x53
	.4byte	.LLST9
	.uleb128 0x1b
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x324
	.4byte	0x53
	.4byte	.LLST10
	.uleb128 0x1b
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x324
	.4byte	0x53
	.4byte	.LLST11
	.byte	0
	.uleb128 0x18
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x347
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x66a
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x347
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x356
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x68f
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x356
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x363
	.4byte	0x3a
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ba
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x363
	.4byte	0x25a
	.4byte	.LLST12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x38f
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ed
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x38f
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x38f
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x18
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x3aa
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x722
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3aa
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x3aa
	.4byte	0x53
	.4byte	.LLST13
	.byte	0
	.uleb128 0x18
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x416
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x765
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x416
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1a
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x416
	.4byte	0x53
	.4byte	.LLST14
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x416
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x43b
	.4byte	0x94
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c0
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x43b
	.4byte	0x25a
	.4byte	.LLST15
	.uleb128 0x1a
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x43b
	.4byte	0x53
	.4byte	.LLST16
	.uleb128 0x1b
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x43d
	.4byte	0x94
	.4byte	.LLST17
	.uleb128 0x1b
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x43e
	.4byte	0x53
	.4byte	.LLST18
	.byte	0
	.uleb128 0x18
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x469
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7f3
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x469
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x469
	.4byte	0x53
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x480
	.4byte	0x9f
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x84e
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x480
	.4byte	0x25a
	.4byte	.LLST19
	.uleb128 0x1a
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x480
	.4byte	0x53
	.4byte	.LLST20
	.uleb128 0x1b
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x482
	.4byte	0x9f
	.4byte	.LLST21
	.uleb128 0x1b
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x483
	.4byte	0x53
	.4byte	.LLST22
	.byte	0
	.uleb128 0x18
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x4a8
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x881
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4a8
	.4byte	0x25a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x4a8
	.4byte	0x53
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x1f3
	.uleb128 0x1e
	.4byte	0x53
	.uleb128 0x1e
	.4byte	0xbf
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
	.uleb128 0xb
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
	.uleb128 0xb
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
	.uleb128 0xb
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
	.uleb128 0xf
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x17
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xd203
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xd203
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL14
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL19
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL20
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL23
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL23
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL29
	.4byte	.LFE46
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL28
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LFE46
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL34
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LVL41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42
	.4byte	.LFE50
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL34
	.4byte	.LVL40
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL40
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LFE50
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x7
	.byte	0xa
	.2byte	0xf000
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x7
	.byte	0xa
	.2byte	0xefff
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x7
	.byte	0xa
	.2byte	0xf001
	.byte	0x73
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL37
	.4byte	.LFE50
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL46
	.4byte	.LFE53
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL48
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL49
	.4byte	.LFE55
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL50
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL53
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL54
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL60
	.4byte	.LFE57
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL54
	.4byte	.LVL59
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL59
	.4byte	.LFE57
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL54
	.4byte	.LVL57
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL57
	.4byte	.LVL58
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x71
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL54
	.4byte	.LVL55
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL56
	.4byte	.LVL57
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL57
	.4byte	.LVL58
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL62
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL64
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL62
	.4byte	.LVL65
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL65
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL62
	.4byte	.LVL67
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL67
	.4byte	.LFE59
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL63
	.4byte	.LVL65
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL65
	.4byte	.LVL66
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL66
	.4byte	.LFE59
	.2byte	0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xfc
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF22:
	.ascii	"CHSELR\000"
.LASF35:
	.ascii	"ADCx\000"
.LASF32:
	.ascii	"ADC_InitTypeDef\000"
.LASF54:
	.ascii	"ADC_VbatCmd\000"
.LASF70:
	.ascii	"ADC_ITConfig\000"
.LASF26:
	.ascii	"ADC_Resolution\000"
.LASF47:
	.ascii	"LowThreshold\000"
.LASF75:
	.ascii	"ADC_ClearFlag\000"
.LASF63:
	.ascii	"ADC_StopOfConversion\000"
.LASF76:
	.ascii	"ADC_GetITStatus\000"
.LASF62:
	.ascii	"calibrationstatus\000"
.LASF42:
	.ascii	"ADC_AutoPowerOffCmd\000"
.LASF44:
	.ascii	"ADC_AnalogWatchdogCmd\000"
.LASF81:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF38:
	.ascii	"ADC_Cmd\000"
.LASF64:
	.ascii	"ADC_StartOfConversion\000"
.LASF2:
	.ascii	"short int\000"
.LASF36:
	.ascii	"ADC_InitStruct\000"
.LASF45:
	.ascii	"ADC_AnalogWatchdogThresholdsConfig\000"
.LASF19:
	.ascii	"RESERVED1\000"
.LASF78:
	.ascii	"ADC_ClearITPendingBit\000"
.LASF23:
	.ascii	"RESERVED4\000"
.LASF73:
	.ascii	"ADC_FLAG\000"
.LASF39:
	.ascii	"NewState\000"
.LASF48:
	.ascii	"ADC_AnalogWatchdogSingleChannelConfig\000"
.LASF13:
	.ascii	"DISABLE\000"
.LASF61:
	.ascii	"calibrationcounter\000"
.LASF68:
	.ascii	"ADC_DMARequestModeConfig\000"
.LASF77:
	.ascii	"enablestatus\000"
.LASF31:
	.ascii	"ADC_ScanDirection\000"
.LASF7:
	.ascii	"long long int\000"
.LASF41:
	.ascii	"ADC_JitterOff\000"
.LASF12:
	.ascii	"ITStatus\000"
.LASF65:
	.ascii	"ADC_GetCalibrationFactor\000"
.LASF16:
	.ascii	"CFGR1\000"
.LASF17:
	.ascii	"CFGR2\000"
.LASF66:
	.ascii	"ADC_GetConversionValue\000"
.LASF50:
	.ascii	"tmpreg\000"
.LASF74:
	.ascii	"bitstatus\000"
.LASF29:
	.ascii	"ADC_ExternalTrigConv\000"
.LASF55:
	.ascii	"ADC_ChannelConfig\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF33:
	.ascii	"ADC_DeInit\000"
.LASF60:
	.ascii	"ADC_OverrunModeCmd\000"
.LASF0:
	.ascii	"signed char\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF46:
	.ascii	"HighThreshold\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF56:
	.ascii	"ADC_Channel\000"
.LASF82:
	.ascii	"RCC_APB2PeriphResetCmd\000"
.LASF40:
	.ascii	"ADC_JitterCmd\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF30:
	.ascii	"ADC_DataAlign\000"
.LASF27:
	.ascii	"ADC_ContinuousConvMode\000"
.LASF79:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF25:
	.ascii	"ADC_Common_TypeDef\000"
.LASF28:
	.ascii	"ADC_ExternalTrigConvEdge\000"
.LASF20:
	.ascii	"RESERVED2\000"
.LASF21:
	.ascii	"RESERVED3\000"
.LASF53:
	.ascii	"ADC_VrefintCmd\000"
.LASF57:
	.ascii	"ADC_SampleTime\000"
.LASF80:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_adc.c\000"
.LASF37:
	.ascii	"ADC_StructInit\000"
.LASF49:
	.ascii	"ADC_AnalogWatchdog_Channel\000"
.LASF51:
	.ascii	"ADC_AnalogWatchdogSingleChannelCmd\000"
.LASF43:
	.ascii	"ADC_WaitModeCmd\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF58:
	.ascii	"ADC_ContinuousModeCmd\000"
.LASF72:
	.ascii	"ADC_GetFlagStatus\000"
.LASF59:
	.ascii	"ADC_DiscModeCmd\000"
.LASF10:
	.ascii	"RESET\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF67:
	.ascii	"ADC_DMACmd\000"
.LASF71:
	.ascii	"ADC_IT\000"
.LASF24:
	.ascii	"ADC_TypeDef\000"
.LASF34:
	.ascii	"ADC_Init\000"
.LASF18:
	.ascii	"SMPR\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF52:
	.ascii	"ADC_TempSensorCmd\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF69:
	.ascii	"ADC_DMARequestMode\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
