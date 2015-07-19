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
	.file	"stm32f0xx_adc.c"
	.text
.Ltext0:
	.section	.text.ADC_DeInit,"ax",%progbits
	.align	2
	.global	ADC_DeInit
	.code	16
	.thumb_func
	.type	ADC_DeInit, %function
ADC_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	ldr	r3, .L3
	cmp	r0, r3
	bne	.L1
	mov	r4, #128
	lsl	r4, r4, #2
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
.L1:
	@ sp needed
	pop	{r4, pc}
.L4:
	.align	2
.L3:
	.word	1073816576
.LFE32:
	.size	ADC_DeInit, .-ADC_DeInit
	.section	.text.ADC_Init,"ax",%progbits
	.align	2
	.global	ADC_Init
	.code	16
	.thumb_func
	.type	ADC_Init, %function
ADC_Init:
.LFB33:
	push	{r4, lr}
.LCFI1:
	ldr	r4, [r0, #12]
	ldr	r2, [r1, #8]
	ldr	r3, [r1]
	orr	r2, r3
	ldr	r3, [r1, #12]
	orr	r2, r3
	ldr	r3, [r1, #16]
	orr	r2, r3
	ldr	r3, [r1, #20]
	orr	r2, r3
	ldr	r3, .L6
	and	r3, r4
	orr	r3, r2
	ldrb	r2, [r1, #4]
	lsl	r2, r2, #13
	orr	r3, r2
	str	r3, [r0, #12]
	@ sp needed
	pop	{r4, pc}
.L7:
	.align	2
.L6:
	.word	-11773
.LFE33:
	.size	ADC_Init, .-ADC_Init
	.section	.text.ADC_StructInit,"ax",%progbits
	.align	2
	.global	ADC_StructInit
	.code	16
	.thumb_func
	.type	ADC_StructInit, %function
ADC_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	strb	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	@ sp needed
	bx	lr
.LFE34:
	.size	ADC_StructInit, .-ADC_StructInit
	.section	.text.ADC_Cmd,"ax",%progbits
	.align	2
	.global	ADC_Cmd
	.code	16
	.thumb_func
	.type	ADC_Cmd, %function
ADC_Cmd:
.LFB35:
	cmp	r1, #0
	beq	.L10
	ldr	r2, [r0, #8]
	mov	r3, #1
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L9
.L10:
	ldr	r2, [r0, #8]
	mov	r3, #2
	orr	r3, r2
	str	r3, [r0, #8]
.L9:
	@ sp needed
	bx	lr
.LFE35:
	.size	ADC_Cmd, .-ADC_Cmd
	.section	.text.ADC_JitterCmd,"ax",%progbits
	.align	2
	.global	ADC_JitterCmd
	.code	16
	.thumb_func
	.type	ADC_JitterCmd, %function
ADC_JitterCmd:
.LFB36:
	cmp	r2, #0
	beq	.L13
	ldr	r3, [r0, #16]
	orr	r1, r3
	str	r1, [r0, #16]
	b	.L12
.L13:
	ldr	r3, [r0, #16]
	bic	r3, r1
	str	r3, [r0, #16]
.L12:
	@ sp needed
	bx	lr
.LFE36:
	.size	ADC_JitterCmd, .-ADC_JitterCmd
	.section	.text.ADC_AutoPowerOffCmd,"ax",%progbits
	.align	2
	.global	ADC_AutoPowerOffCmd
	.code	16
	.thumb_func
	.type	ADC_AutoPowerOffCmd, %function
ADC_AutoPowerOffCmd:
.LFB37:
	cmp	r1, #0
	beq	.L16
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L15
.L16:
	ldr	r2, [r0, #12]
	ldr	r3, .L18
	and	r3, r2
	str	r3, [r0, #12]
.L15:
	@ sp needed
	bx	lr
.L19:
	.align	2
.L18:
	.word	-32769
.LFE37:
	.size	ADC_AutoPowerOffCmd, .-ADC_AutoPowerOffCmd
	.section	.text.ADC_WaitModeCmd,"ax",%progbits
	.align	2
	.global	ADC_WaitModeCmd
	.code	16
	.thumb_func
	.type	ADC_WaitModeCmd, %function
ADC_WaitModeCmd:
.LFB38:
	cmp	r1, #0
	beq	.L21
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L20
.L21:
	ldr	r2, [r0, #12]
	ldr	r3, .L23
	and	r3, r2
	str	r3, [r0, #12]
.L20:
	@ sp needed
	bx	lr
.L24:
	.align	2
.L23:
	.word	-16385
.LFE38:
	.size	ADC_WaitModeCmd, .-ADC_WaitModeCmd
	.section	.text.ADC_AnalogWatchdogCmd,"ax",%progbits
	.align	2
	.global	ADC_AnalogWatchdogCmd
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogCmd, %function
ADC_AnalogWatchdogCmd:
.LFB39:
	cmp	r1, #0
	beq	.L26
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #16
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L25
.L26:
	ldr	r2, [r0, #12]
	ldr	r3, .L28
	and	r3, r2
	str	r3, [r0, #12]
.L25:
	@ sp needed
	bx	lr
.L29:
	.align	2
.L28:
	.word	-8388609
.LFE39:
	.size	ADC_AnalogWatchdogCmd, .-ADC_AnalogWatchdogCmd
	.section	.text.ADC_AnalogWatchdogThresholdsConfig,"ax",%progbits
	.align	2
	.global	ADC_AnalogWatchdogThresholdsConfig
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogThresholdsConfig, %function
ADC_AnalogWatchdogThresholdsConfig:
.LFB40:
	lsl	r1, r1, #16
	orr	r1, r2
	str	r1, [r0, #32]
	@ sp needed
	bx	lr
.LFE40:
	.size	ADC_AnalogWatchdogThresholdsConfig, .-ADC_AnalogWatchdogThresholdsConfig
	.section	.text.ADC_AnalogWatchdogSingleChannelConfig,"ax",%progbits
	.align	2
	.global	ADC_AnalogWatchdogSingleChannelConfig
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogSingleChannelConfig, %function
ADC_AnalogWatchdogSingleChannelConfig:
.LFB41:
	ldr	r2, [r0, #12]
	ldr	r3, .L32
	and	r3, r2
	orr	r1, r3
	str	r1, [r0, #12]
	@ sp needed
	bx	lr
.L33:
	.align	2
.L32:
	.word	-2080374785
.LFE41:
	.size	ADC_AnalogWatchdogSingleChannelConfig, .-ADC_AnalogWatchdogSingleChannelConfig
	.section	.text.ADC_AnalogWatchdogSingleChannelCmd,"ax",%progbits
	.align	2
	.global	ADC_AnalogWatchdogSingleChannelCmd
	.code	16
	.thumb_func
	.type	ADC_AnalogWatchdogSingleChannelCmd, %function
ADC_AnalogWatchdogSingleChannelCmd:
.LFB42:
	cmp	r1, #0
	beq	.L35
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #15
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L34
.L35:
	ldr	r2, [r0, #12]
	ldr	r3, .L37
	and	r3, r2
	str	r3, [r0, #12]
.L34:
	@ sp needed
	bx	lr
.L38:
	.align	2
.L37:
	.word	-4194305
.LFE42:
	.size	ADC_AnalogWatchdogSingleChannelCmd, .-ADC_AnalogWatchdogSingleChannelCmd
	.section	.text.ADC_TempSensorCmd,"ax",%progbits
	.align	2
	.global	ADC_TempSensorCmd
	.code	16
	.thumb_func
	.type	ADC_TempSensorCmd, %function
ADC_TempSensorCmd:
.LFB43:
	cmp	r0, #0
	beq	.L40
	ldr	r3, .L42
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #16
	orr	r2, r1
	str	r2, [r3]
	b	.L39
.L40:
	ldr	r3, .L42
	ldr	r1, [r3]
	ldr	r2, .L42+4
	and	r2, r1
	str	r2, [r3]
.L39:
	@ sp needed
	bx	lr
.L43:
	.align	2
.L42:
	.word	1073817352
	.word	-8388609
.LFE43:
	.size	ADC_TempSensorCmd, .-ADC_TempSensorCmd
	.section	.text.ADC_VrefintCmd,"ax",%progbits
	.align	2
	.global	ADC_VrefintCmd
	.code	16
	.thumb_func
	.type	ADC_VrefintCmd, %function
ADC_VrefintCmd:
.LFB44:
	cmp	r0, #0
	beq	.L45
	ldr	r3, .L47
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #15
	orr	r2, r1
	str	r2, [r3]
	b	.L44
.L45:
	ldr	r3, .L47
	ldr	r1, [r3]
	ldr	r2, .L47+4
	and	r2, r1
	str	r2, [r3]
.L44:
	@ sp needed
	bx	lr
.L48:
	.align	2
.L47:
	.word	1073817352
	.word	-4194305
.LFE44:
	.size	ADC_VrefintCmd, .-ADC_VrefintCmd
	.section	.text.ADC_VbatCmd,"ax",%progbits
	.align	2
	.global	ADC_VbatCmd
	.code	16
	.thumb_func
	.type	ADC_VbatCmd, %function
ADC_VbatCmd:
.LFB45:
	cmp	r0, #0
	beq	.L50
	ldr	r3, .L52
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #17
	orr	r2, r1
	str	r2, [r3]
	b	.L49
.L50:
	ldr	r3, .L52
	ldr	r1, [r3]
	ldr	r2, .L52+4
	and	r2, r1
	str	r2, [r3]
.L49:
	@ sp needed
	bx	lr
.L53:
	.align	2
.L52:
	.word	1073817352
	.word	-16777217
.LFE45:
	.size	ADC_VbatCmd, .-ADC_VbatCmd
	.section	.text.ADC_ChannelConfig,"ax",%progbits
	.align	2
	.global	ADC_ChannelConfig
	.code	16
	.thumb_func
	.type	ADC_ChannelConfig, %function
ADC_ChannelConfig:
.LFB46:
	ldr	r3, [r0, #40]
	orr	r1, r3
	str	r1, [r0, #40]
	str	r2, [r0, #20]
	@ sp needed
	bx	lr
.LFE46:
	.size	ADC_ChannelConfig, .-ADC_ChannelConfig
	.section	.text.ADC_ContinuousModeCmd,"ax",%progbits
	.align	2
	.global	ADC_ContinuousModeCmd
	.code	16
	.thumb_func
	.type	ADC_ContinuousModeCmd, %function
ADC_ContinuousModeCmd:
.LFB47:
	cmp	r1, #0
	beq	.L56
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L55
.L56:
	ldr	r2, [r0, #12]
	ldr	r3, .L58
	and	r3, r2
	str	r3, [r0, #12]
.L55:
	@ sp needed
	bx	lr
.L59:
	.align	2
.L58:
	.word	-8193
.LFE47:
	.size	ADC_ContinuousModeCmd, .-ADC_ContinuousModeCmd
	.section	.text.ADC_DiscModeCmd,"ax",%progbits
	.align	2
	.global	ADC_DiscModeCmd
	.code	16
	.thumb_func
	.type	ADC_DiscModeCmd, %function
ADC_DiscModeCmd:
.LFB48:
	cmp	r1, #0
	beq	.L61
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #9
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L60
.L61:
	ldr	r2, [r0, #12]
	ldr	r3, .L63
	and	r3, r2
	str	r3, [r0, #12]
.L60:
	@ sp needed
	bx	lr
.L64:
	.align	2
.L63:
	.word	-65537
.LFE48:
	.size	ADC_DiscModeCmd, .-ADC_DiscModeCmd
	.section	.text.ADC_OverrunModeCmd,"ax",%progbits
	.align	2
	.global	ADC_OverrunModeCmd
	.code	16
	.thumb_func
	.type	ADC_OverrunModeCmd, %function
ADC_OverrunModeCmd:
.LFB49:
	cmp	r1, #0
	beq	.L66
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L65
.L66:
	ldr	r2, [r0, #12]
	ldr	r3, .L68
	and	r3, r2
	str	r3, [r0, #12]
.L65:
	@ sp needed
	bx	lr
.L69:
	.align	2
.L68:
	.word	-4097
.LFE49:
	.size	ADC_OverrunModeCmd, .-ADC_OverrunModeCmd
	.section	.text.ADC_GetCalibrationFactor,"ax",%progbits
	.align	2
	.global	ADC_GetCalibrationFactor
	.code	16
	.thumb_func
	.type	ADC_GetCalibrationFactor, %function
ADC_GetCalibrationFactor:
.LFB50:
	ldr	r2, [r0, #8]
	mov	r3, #128
	lsl	r3, r3, #24
	orr	r3, r2
	str	r3, [r0, #8]
	ldr	r2, [r0, #8]
	lsr	r2, r2, #31
	lsl	r2, r2, #31
	ldr	r3, .L76
	b	.L71
.L73:
	ldr	r2, [r0, #8]
	lsr	r2, r2, #31
	lsl	r2, r2, #31
	sub	r3, r3, #1
	cmp	r3, #0
	beq	.L72
.L71:
	cmp	r2, #0
	bne	.L73
.L72:
	ldr	r3, [r0, #8]
	cmp	r3, #0
	blt	.L75
	ldr	r0, [r0, #64]
	b	.L74
.L75:
	mov	r0, #0
.L74:
	@ sp needed
	bx	lr
.L77:
	.align	2
.L76:
	.word	61439
.LFE50:
	.size	ADC_GetCalibrationFactor, .-ADC_GetCalibrationFactor
	.section	.text.ADC_StopOfConversion,"ax",%progbits
	.align	2
	.global	ADC_StopOfConversion
	.code	16
	.thumb_func
	.type	ADC_StopOfConversion, %function
ADC_StopOfConversion:
.LFB51:
	ldr	r2, [r0, #8]
	mov	r3, #16
	orr	r3, r2
	str	r3, [r0, #8]
	@ sp needed
	bx	lr
.LFE51:
	.size	ADC_StopOfConversion, .-ADC_StopOfConversion
	.section	.text.ADC_StartOfConversion,"ax",%progbits
	.align	2
	.global	ADC_StartOfConversion
	.code	16
	.thumb_func
	.type	ADC_StartOfConversion, %function
ADC_StartOfConversion:
.LFB52:
	ldr	r2, [r0, #8]
	mov	r3, #4
	orr	r3, r2
	str	r3, [r0, #8]
	@ sp needed
	bx	lr
.LFE52:
	.size	ADC_StartOfConversion, .-ADC_StartOfConversion
	.section	.text.ADC_GetConversionValue,"ax",%progbits
	.align	2
	.global	ADC_GetConversionValue
	.code	16
	.thumb_func
	.type	ADC_GetConversionValue, %function
ADC_GetConversionValue:
.LFB53:
	ldr	r0, [r0, #64]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE53:
	.size	ADC_GetConversionValue, .-ADC_GetConversionValue
	.section	.text.ADC_DMACmd,"ax",%progbits
	.align	2
	.global	ADC_DMACmd
	.code	16
	.thumb_func
	.type	ADC_DMACmd, %function
ADC_DMACmd:
.LFB54:
	cmp	r1, #0
	beq	.L82
	ldr	r2, [r0, #12]
	mov	r3, #1
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L81
.L82:
	ldr	r3, [r0, #12]
	mov	r2, #1
	bic	r3, r2
	str	r3, [r0, #12]
.L81:
	@ sp needed
	bx	lr
.LFE54:
	.size	ADC_DMACmd, .-ADC_DMACmd
	.section	.text.ADC_DMARequestModeConfig,"ax",%progbits
	.align	2
	.global	ADC_DMARequestModeConfig
	.code	16
	.thumb_func
	.type	ADC_DMARequestModeConfig, %function
ADC_DMARequestModeConfig:
.LFB55:
	ldr	r3, [r0, #12]
	mov	r2, #2
	bic	r3, r2
	str	r3, [r0, #12]
	ldr	r3, [r0, #12]
	orr	r1, r3
	str	r1, [r0, #12]
	@ sp needed
	bx	lr
.LFE55:
	.size	ADC_DMARequestModeConfig, .-ADC_DMARequestModeConfig
	.section	.text.ADC_ITConfig,"ax",%progbits
	.align	2
	.global	ADC_ITConfig
	.code	16
	.thumb_func
	.type	ADC_ITConfig, %function
ADC_ITConfig:
.LFB56:
	cmp	r2, #0
	beq	.L86
	ldr	r3, [r0, #4]
	orr	r1, r3
	str	r1, [r0, #4]
	b	.L85
.L86:
	ldr	r3, [r0, #4]
	bic	r3, r1
	str	r3, [r0, #4]
.L85:
	@ sp needed
	bx	lr
.LFE56:
	.size	ADC_ITConfig, .-ADC_ITConfig
	.section	.text.ADC_GetFlagStatus,"ax",%progbits
	.align	2
	.global	ADC_GetFlagStatus
	.code	16
	.thumb_func
	.type	ADC_GetFlagStatus, %function
ADC_GetFlagStatus:
.LFB57:
	lsl	r3, r1, #7
	bpl	.L89
	ldr	r0, [r0, #8]
	ldr	r3, .L91
	and	r0, r3
	b	.L90
.L89:
	ldr	r0, [r0]
.L90:
	and	r1, r0
	sub	r0, r1, #1
	sbc	r1, r1, r0
	uxtb	r0, r1
	@ sp needed
	bx	lr
.L92:
	.align	2
.L91:
	.word	-16777217
.LFE57:
	.size	ADC_GetFlagStatus, .-ADC_GetFlagStatus
	.section	.text.ADC_ClearFlag,"ax",%progbits
	.align	2
	.global	ADC_ClearFlag
	.code	16
	.thumb_func
	.type	ADC_ClearFlag, %function
ADC_ClearFlag:
.LFB58:
	str	r1, [r0]
	@ sp needed
	bx	lr
.LFE58:
	.size	ADC_ClearFlag, .-ADC_ClearFlag
	.section	.text.ADC_GetITStatus,"ax",%progbits
	.align	2
	.global	ADC_GetITStatus
	.code	16
	.thumb_func
	.type	ADC_GetITStatus, %function
ADC_GetITStatus:
.LFB59:
	ldr	r2, [r0, #4]
	ldr	r3, [r0]
	mov	r0, #0
	tst	r3, r1
	beq	.L95
	and	r1, r2
	sub	r2, r1, #1
	sbc	r1, r1, r2
	uxtb	r0, r1
.L95:
	@ sp needed
	bx	lr
.LFE59:
	.size	ADC_GetITStatus, .-ADC_GetITStatus
	.section	.text.ADC_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	ADC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	ADC_ClearITPendingBit, %function
ADC_ClearITPendingBit:
.LFB60:
	str	r1, [r0]
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
	.byte	0x84
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_adc.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x220
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x82
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x9c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0xe6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x103
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x160
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x194
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1d8
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x1f4
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x228
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x23f
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x256
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x2b4
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x2d4
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2f0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x309
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x322
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x347
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x356
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x363
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x38f
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x3aa
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x416
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x43b
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x469
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x480
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x4a8
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
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
	.uleb128 0x2116
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
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
.LASF21:
	.ascii	"ADC_GetConversionValue\000"
.LASF19:
	.ascii	"ADC_StopOfConversion\000"
.LASF15:
	.ascii	"ADC_ContinuousModeCmd\000"
.LASF10:
	.ascii	"ADC_AnalogWatchdogSingleChannelCmd\000"
.LASF24:
	.ascii	"ADC_ITConfig\000"
.LASF20:
	.ascii	"ADC_StartOfConversion\000"
.LASF8:
	.ascii	"ADC_AnalogWatchdogThresholdsConfig\000"
.LASF22:
	.ascii	"ADC_DMACmd\000"
.LASF14:
	.ascii	"ADC_ChannelConfig\000"
.LASF17:
	.ascii	"ADC_OverrunModeCmd\000"
.LASF9:
	.ascii	"ADC_AnalogWatchdogSingleChannelConfig\000"
.LASF6:
	.ascii	"ADC_WaitModeCmd\000"
.LASF23:
	.ascii	"ADC_DMARequestModeConfig\000"
.LASF2:
	.ascii	"ADC_StructInit\000"
.LASF13:
	.ascii	"ADC_VbatCmd\000"
.LASF26:
	.ascii	"ADC_ClearFlag\000"
.LASF29:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF3:
	.ascii	"ADC_Cmd\000"
.LASF7:
	.ascii	"ADC_AnalogWatchdogCmd\000"
.LASF5:
	.ascii	"ADC_AutoPowerOffCmd\000"
.LASF4:
	.ascii	"ADC_JitterCmd\000"
.LASF16:
	.ascii	"ADC_DiscModeCmd\000"
.LASF28:
	.ascii	"ADC_ClearITPendingBit\000"
.LASF11:
	.ascii	"ADC_TempSensorCmd\000"
.LASF0:
	.ascii	"ADC_DeInit\000"
.LASF18:
	.ascii	"ADC_GetCalibrationFactor\000"
.LASF12:
	.ascii	"ADC_VrefintCmd\000"
.LASF25:
	.ascii	"ADC_GetFlagStatus\000"
.LASF27:
	.ascii	"ADC_GetITStatus\000"
.LASF30:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_adc.c\000"
.LASF1:
	.ascii	"ADC_Init\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
