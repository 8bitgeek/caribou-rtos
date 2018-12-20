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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_adc.c"
	.loc 1 131 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 135 0
	ldr	r3, [r7, #4]
	ldr	r2, .L4
	cmp	r3, r2
	bne	.L3
	.loc 1 138 0
	movs	r3, #128
	lsls	r3, r3, #2
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 141 0
	movs	r3, #128
	lsls	r3, r3, #2
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
.L3:
	.loc 1 143 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L5:
	.align	2
.L4:
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
	.loc 1 157 0
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
	.loc 1 158 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 170 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	.loc 1 173 0
	ldr	r3, [r7, #12]
	ldr	r2, .L7
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 184 0
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3, #4]
	lsls	r3, r3, #13
	orrs	r2, r3
	.loc 1 185 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	.loc 1 184 0
	orrs	r2, r3
	.loc 1 185 0
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	orrs	r2, r3
	.loc 1 186 0
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	.loc 1 185 0
	orrs	r2, r3
	.loc 1 186 0
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	orrs	r3, r2
	.loc 1 184 0
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 189 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	.loc 1 190 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
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
	.loc 1 202 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 205 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 208 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 211 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 214 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 217 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 220 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 221 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 231 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 236 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L11
	.loc 1 239 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r2, #1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 246 0
	b	.L13
.L11:
	.loc 1 244 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r2, #2
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
.L13:
	.loc 1 246 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 260 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 266 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L15
	.loc 1 269 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #8]
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #16]
	.loc 1 276 0
	b	.L17
.L15:
	.loc 1 274 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	ldr	r2, [r7, #8]
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #16]
.L17:
	.loc 1 276 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 318 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 323 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L19
	.loc 1 326 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #8
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 333 0
	b	.L21
.L19:
	.loc 1 331 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L22
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L21:
	.loc 1 333 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L23:
	.align	2
.L22:
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
	.loc 1 353 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #8
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 358 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L25
	.loc 1 361 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #7
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 368 0
	b	.L27
.L25:
	.loc 1 366 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L28
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L27:
	.loc 1 368 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L29:
	.align	2
.L28:
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
	.loc 1 405 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 410 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L31
	.loc 1 413 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #16
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 420 0
	b	.L33
.L31:
	.loc 1 418 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L34
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L33:
	.loc 1 420 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L35:
	.align	2
.L34:
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
	.loc 1 433 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, r7
	adds	r2, r1, #0
	strh	r2, [r3]
	.loc 1 440 0
	movs	r3, r7
	ldrh	r2, [r3]
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #16
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #32]
	.loc 1 442 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 473 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 474 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 481 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	.loc 1 484 0
	ldr	r3, [r7, #12]
	ldr	r2, .L38
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 487 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 490 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	.loc 1 491 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L39:
	.align	2
.L38:
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
	.loc 1 501 0
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
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 506 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L41
	.loc 1 509 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #15
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 516 0
	b	.L43
.L41:
	.loc 1 514 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L44
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L43:
	.loc 1 516 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
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
	.loc 1 553 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #8
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 557 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L47
	.loc 1 560 0
	ldr	r3, .L50
	ldr	r2, .L50
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #16
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 567 0
	b	.L49
.L47:
	.loc 1 565 0
	ldr	r3, .L50
	ldr	r2, .L50
	ldr	r2, [r2]
	ldr	r1, .L50+4
	ands	r2, r1
	str	r2, [r3]
.L49:
	.loc 1 567 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
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
	.loc 1 576 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #8
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 580 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L53
	.loc 1 583 0
	ldr	r3, .L56
	ldr	r2, .L56
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #15
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 590 0
	b	.L55
.L53:
	.loc 1 588 0
	ldr	r3, .L56
	ldr	r2, .L56
	ldr	r2, [r2]
	ldr	r1, .L56+4
	ands	r2, r1
	str	r2, [r3]
.L55:
	.loc 1 590 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L57:
	.align	2
.L56:
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
	.loc 1 599 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #8
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 603 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L59
	.loc 1 606 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 613 0
	b	.L61
.L59:
	.loc 1 611 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2]
	ldr	r1, .L62+4
	ands	r2, r1
	str	r2, [r3]
.L61:
	.loc 1 613 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L63:
	.align	2
.L62:
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
	.loc 1 693 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #24
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 694 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 702 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #40]
	ldr	r3, [r7, #8]
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #40]
	.loc 1 705 0
	ldr	r3, [r7, #20]
	movs	r2, #7
	bics	r3, r2
	str	r3, [r7, #20]
	.loc 1 708 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #20]
	.loc 1 711 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #20]
	.loc 1 712 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 725 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI45:
	sub	sp, sp, #8
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 730 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L66
	.loc 1 733 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #6
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 740 0
	b	.L68
.L66:
	.loc 1 738 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L69
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L68:
	.loc 1 740 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L70:
	.align	2
.L69:
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
	.loc 1 753 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #8
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 758 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L72
	.loc 1 761 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #9
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 768 0
	b	.L74
.L72:
	.loc 1 766 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L75
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L74:
	.loc 1 768 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L76:
	.align	2
.L75:
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
	.loc 1 778 0
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
	.loc 1 783 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L78
	.loc 1 786 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #5
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 793 0
	b	.L80
.L78:
	.loc 1 791 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L81
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L80:
	.loc 1 793 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L82:
	.align	2
.L81:
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
	.loc 1 803 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #24
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	.loc 1 804 0
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 810 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r2, #128
	lsls	r2, r2, #24
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
.L85:
	.loc 1 815 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	lsrs	r3, r3, #31
	lsls	r3, r3, #31
	str	r3, [r7, #12]
	.loc 1 816 0 discriminator 2
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	.loc 1 817 0 discriminator 2
	ldr	r2, [r7, #16]
	movs	r3, #240
	lsls	r3, r3, #8
	cmp	r2, r3
	beq	.L84
	.loc 1 817 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L85
.L84:
	.loc 1 819 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	blt	.L86
	.loc 1 822 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	str	r3, [r7, #20]
	b	.L87
.L86:
	.loc 1 827 0
	movs	r3, #0
	str	r3, [r7, #20]
.L87:
	.loc 1 829 0
	ldr	r3, [r7, #20]
	.loc 1 830 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 840 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI57:
	sub	sp, sp, #8
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	str	r0, [r7, #4]
	.loc 1 844 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r2, #16
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 845 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 855 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	sub	sp, sp, #8
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	str	r0, [r7, #4]
	.loc 1 859 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r2, #4
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 860 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 868 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI63:
	sub	sp, sp, #8
.LCFI64:
	add	r7, sp, #0
.LCFI65:
	str	r0, [r7, #4]
	.loc 1 873 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #64]
	uxth	r3, r3
	.loc 1 874 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 912 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI66:
	sub	sp, sp, #8
.LCFI67:
	add	r7, sp, #0
.LCFI68:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 917 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L94
	.loc 1 920 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 927 0
	b	.L96
.L94:
	.loc 1 925 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #1
	bics	r3, r2
	movs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L96:
	.loc 1 927 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 939 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI69:
	sub	sp, sp, #8
.LCFI70:
	add	r7, sp, #0
.LCFI71:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 943 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #2
	bics	r3, r2
	movs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 944 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 945 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1047 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI72:
	sub	sp, sp, #16
.LCFI73:
	add	r7, sp, #0
.LCFI74:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1053 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L99
	.loc 1 1056 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 1063 0
	b	.L101
.L99:
	.loc 1 1061 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #8]
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #4]
.L101:
	.loc 1 1063 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1084 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI75:
	sub	sp, sp, #16
.LCFI76:
	add	r7, sp, #0
.LCFI77:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1085 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1086 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 1092 0
	ldr	r2, [r7]
	movs	r3, #128
	lsls	r3, r3, #17
	ands	r3, r2
	beq	.L103
	.loc 1 1094 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r2, .L108
	ands	r3, r2
	str	r3, [r7, #8]
	b	.L104
.L103:
	.loc 1 1098 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #8]
.L104:
	.loc 1 1102 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	ands	r3, r2
	beq	.L105
	.loc 1 1105 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L106
.L105:
	.loc 1 1110 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L106:
	.loc 1 1113 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1114 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L109:
	.align	2
.L108:
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
	.loc 1 1130 0
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
	.loc 1 1136 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 1137 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1153 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI81:
	sub	sp, sp, #16
.LCFI82:
	add	r7, sp, #0
.LCFI83:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1154 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1155 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 1162 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [r7]
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 1165 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7]
	ands	r3, r2
	beq	.L112
	.loc 1 1165 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L112
	.loc 1 1168 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L113
.L112:
	.loc 1 1173 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L113:
	.loc 1 1176 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1177 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1193 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI84:
	sub	sp, sp, #8
.LCFI85:
	add	r7, sp, #0
.LCFI86:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1199 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 1200 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.uleb128 0x18
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
	.uleb128 0x20
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
	.uleb128 0x20
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI86-.LCFI85
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE56:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_adc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x863
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0xc
	.4byte	.LASF79
	.4byte	.LASF80
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
	.4byte	0x2c
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
	.4byte	0x2c
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
	.uleb128 0x9
	.byte	0x44
	.byte	0x3
	.byte	0xee
	.4byte	0x174
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
	.4byte	0x174
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
	.4byte	0x184
	.uleb128 0xd
	.4byte	0x73
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x3
	.byte	0xfd
	.4byte	0xd2
	.uleb128 0x9
	.byte	0x4
	.byte	0x3
	.byte	0xff
	.4byte	0x1a5
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
	.4byte	0x18f
	.uleb128 0x9
	.byte	0x18
	.byte	0x4
	.byte	0x36
	.4byte	0x202
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
	.4byte	0xc7
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
	.4byte	0x1b1
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x1
	.byte	0x82
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x231
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0x82
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x184
	.uleb128 0x13
	.4byte	.LASF34
	.byte	0x1
	.byte	0x9c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x277
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0x9c
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF36
	.byte	0x1
	.byte	0x9c
	.4byte	0x277
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x1
	.byte	0x9e
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x202
	.uleb128 0x13
	.4byte	.LASF37
	.byte	0x1
	.byte	0xc9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a1
	.uleb128 0x11
	.4byte	.LASF36
	.byte	0x1
	.byte	0xc9
	.4byte	0x277
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x1
	.byte	0xe6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d3
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0xe6
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0xe6
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x103
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x317
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x103
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x103
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x103
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34c
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x13d
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x13d
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x160
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x381
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x160
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x160
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x194
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b6
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x194
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x194
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3fa
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1af
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1af
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x16
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1b0
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1d8
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43e
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1da
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1f4
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x473
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1f4
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x228
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x499
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x228
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x15
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x23f
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4bf
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x23f
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x256
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e5
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x256
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x2b4
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x538
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2b4
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x2b4
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x2b4
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x2b6
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x2d4
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56d
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2d4
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2d4
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2f0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a2
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2f0
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2f0
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x309
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d7
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x309
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x309
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x18
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x322
	.4byte	0x53
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x62e
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x322
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x324
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x324
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x324
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x347
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x654
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x347
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x356
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x67a
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x356
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x363
	.4byte	0x3a
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a4
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x363
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x38f
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d9
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x38f
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x38f
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x3aa
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x70e
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3aa
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x3aa
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x416
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x752
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x416
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x416
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x416
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x18
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x43b
	.4byte	0x98
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a9
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x43b
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x43b
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x43d
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x43e
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x469
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7de
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x469
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x469
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x480
	.4byte	0xa3
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x835
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x480
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x480
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x482
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x483
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x19
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x4a8
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4a8
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x16
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x4a8
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0x2116
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
	.uleb128 0x14
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
	.uleb128 0x17
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2d4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x867
	.4byte	0x8b
	.ascii	"RESET\000"
	.4byte	0x91
	.ascii	"SET\000"
	.4byte	0xba
	.ascii	"DISABLE\000"
	.4byte	0xc0
	.ascii	"ENABLE\000"
	.4byte	0x20d
	.ascii	"ADC_DeInit\000"
	.4byte	0x237
	.ascii	"ADC_Init\000"
	.4byte	0x27d
	.ascii	"ADC_StructInit\000"
	.4byte	0x2a1
	.ascii	"ADC_Cmd\000"
	.4byte	0x2d3
	.ascii	"ADC_JitterCmd\000"
	.4byte	0x317
	.ascii	"ADC_AutoPowerOffCmd\000"
	.4byte	0x34c
	.ascii	"ADC_WaitModeCmd\000"
	.4byte	0x381
	.ascii	"ADC_AnalogWatchdogCmd\000"
	.4byte	0x3b6
	.ascii	"ADC_AnalogWatchdogThresholdsConfig\000"
	.4byte	0x3fa
	.ascii	"ADC_AnalogWatchdogSingleChannelConfig\000"
	.4byte	0x43e
	.ascii	"ADC_AnalogWatchdogSingleChannelCmd\000"
	.4byte	0x473
	.ascii	"ADC_TempSensorCmd\000"
	.4byte	0x499
	.ascii	"ADC_VrefintCmd\000"
	.4byte	0x4bf
	.ascii	"ADC_VbatCmd\000"
	.4byte	0x4e5
	.ascii	"ADC_ChannelConfig\000"
	.4byte	0x538
	.ascii	"ADC_ContinuousModeCmd\000"
	.4byte	0x56d
	.ascii	"ADC_DiscModeCmd\000"
	.4byte	0x5a2
	.ascii	"ADC_OverrunModeCmd\000"
	.4byte	0x5d7
	.ascii	"ADC_GetCalibrationFactor\000"
	.4byte	0x62e
	.ascii	"ADC_StopOfConversion\000"
	.4byte	0x654
	.ascii	"ADC_StartOfConversion\000"
	.4byte	0x67a
	.ascii	"ADC_GetConversionValue\000"
	.4byte	0x6a4
	.ascii	"ADC_DMACmd\000"
	.4byte	0x6d9
	.ascii	"ADC_DMARequestModeConfig\000"
	.4byte	0x70e
	.ascii	"ADC_ITConfig\000"
	.4byte	0x752
	.ascii	"ADC_GetFlagStatus\000"
	.4byte	0x7a9
	.ascii	"ADC_ClearFlag\000"
	.4byte	0x7de
	.ascii	"ADC_GetITStatus\000"
	.4byte	0x835
	.ascii	"ADC_ClearITPendingBit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x12d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x867
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x45
	.ascii	"short unsigned int\000"
	.4byte	0x3a
	.ascii	"uint16_t\000"
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
	.4byte	0x184
	.ascii	"ADC_TypeDef\000"
	.4byte	0x1a5
	.ascii	"ADC_Common_TypeDef\000"
	.4byte	0x202
	.ascii	"ADC_InitTypeDef\000"
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
.LASF81:
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
.LASF80:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
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
.LASF40:
	.ascii	"ADC_JitterCmd\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF30:
	.ascii	"ADC_DataAlign\000"
.LASF27:
	.ascii	"ADC_ContinuousConvMode\000"
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
.LASF79:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_adc.c\000"
.LASF59:
	.ascii	"ADC_DiscModeCmd\000"
.LASF10:
	.ascii	"RESET\000"
.LASF78:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
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
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
