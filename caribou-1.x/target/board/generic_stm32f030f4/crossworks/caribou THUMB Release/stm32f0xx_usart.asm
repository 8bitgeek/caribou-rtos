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
	.file	"stm32f0xx_usart.c"
	.text
.Ltext0:
	.section	.text.USART_DeInit,"ax",%progbits
	.align	2
	.global	USART_DeInit
	.code	16
	.thumb_func
	.type	USART_DeInit, %function
USART_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	ldr	r3, .L4
	cmp	r0, r3
	bne	.L2
	mov	r4, #128
	lsl	r4, r4, #7
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB2PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB2PeriphResetCmd
	b	.L1
.L2:
	ldr	r3, .L4+4
	cmp	r0, r3
	bne	.L1
	mov	r4, #128
	lsl	r4, r4, #10
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
.L1:
	@ sp needed
	pop	{r4, pc}
.L5:
	.align	2
.L4:
	.word	1073821696
	.word	1073759232
.LFE32:
	.size	USART_DeInit, .-USART_DeInit
	.global	__aeabi_uidiv
	.section	.text.USART_Init,"ax",%progbits
	.align	2
	.global	USART_Init
	.code	16
	.thumb_func
	.type	USART_Init, %function
USART_Init:
.LFB33:
	push	{r4, r5, r6, lr}
.LCFI1:
	sub	sp, sp, #32
.LCFI2:
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [r0]
	mov	r2, #1
	bic	r3, r2
	str	r3, [r0]
	ldr	r2, [r0, #4]
	ldr	r3, .L13
	and	r3, r2
	ldr	r1, [r1, #8]
	orr	r3, r1
	str	r3, [r0, #4]
	ldr	r2, [r0]
	ldr	r3, .L13+4
	and	r2, r3
	ldr	r3, [r5, #12]
	ldr	r1, [r5, #4]
	orr	r3, r1
	ldr	r1, [r5, #16]
	orr	r3, r1
	orr	r3, r2
	str	r3, [r0]
	ldr	r2, [r0, #8]
	ldr	r3, .L13+8
	and	r3, r2
	ldr	r2, [r5, #20]
	orr	r3, r2
	str	r3, [r0, #8]
	add	r0, sp, #4
	bl	RCC_GetClocksFreq
	ldr	r3, .L13+12
	cmp	r4, r3
	bne	.L7
	ldr	r3, [sp, #28]
	b	.L8
.L7:
	ldr	r3, [sp, #12]
.L8:
	ldr	r2, [r4]
	lsl	r1, r2, #16
	bpl	.L9
	lsl	r2, r3, #2
	add	r3, r2, r3
	lsl	r0, r3, #2
	add	r0, r3, r0
	ldr	r1, [r5]
	lsl	r1, r1, #1
	bl	__aeabi_uidiv
	mov	r6, r0
	b	.L10
.L9:
	lsl	r2, r3, #2
	add	r3, r2, r3
	lsl	r0, r3, #2
	add	r0, r3, r0
	ldr	r1, [r5]
	lsl	r1, r1, #2
	bl	__aeabi_uidiv
	mov	r6, r0
.L10:
	mov	r0, r6
	mov	r1, #100
	bl	__aeabi_uidiv
	lsl	r5, r0, #4
	lsr	r3, r5, #4
	mov	r2, #100
	mul	r3, r2
	sub	r6, r6, r3
	ldr	r3, [r4]
	lsl	r2, r3, #16
	bpl	.L11
	lsl	r6, r6, #3
	mov	r0, r6
	add	r0, r0, #50
	mov	r1, #100
	bl	__aeabi_uidiv
	mov	r3, #7
	and	r0, r3
	orr	r5, r0
	b	.L12
.L11:
	lsl	r6, r6, #4
	mov	r0, r6
	add	r0, r0, #50
	mov	r1, #100
	bl	__aeabi_uidiv
	mov	r3, #15
	and	r0, r3
	orr	r5, r0
.L12:
	uxth	r5, r5
	strh	r5, [r4, #12]
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L14:
	.align	2
.L13:
	.word	-12289
	.word	-5645
	.word	-769
	.word	1073821696
.LFE33:
	.size	USART_Init, .-USART_Init
	.section	.text.USART_StructInit,"ax",%progbits
	.align	2
	.global	USART_StructInit
	.code	16
	.thumb_func
	.type	USART_StructInit, %function
USART_StructInit:
.LFB34:
	mov	r3, #150
	lsl	r3, r3, #6
	str	r3, [r0]
	mov	r3, #0
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	mov	r2, #12
	str	r2, [r0, #16]
	str	r3, [r0, #20]
	@ sp needed
	bx	lr
.LFE34:
	.size	USART_StructInit, .-USART_StructInit
	.section	.text.USART_ClockInit,"ax",%progbits
	.align	2
	.global	USART_ClockInit
	.code	16
	.thumb_func
	.type	USART_ClockInit, %function
USART_ClockInit:
.LFB35:
	push	{r4, lr}
.LCFI3:
	ldr	r2, [r0, #4]
	ldr	r3, .L17
	and	r2, r3
	ldr	r3, [r1, #4]
	ldr	r4, [r1]
	orr	r3, r4
	ldr	r4, [r1, #8]
	orr	r3, r4
	ldr	r1, [r1, #12]
	orr	r3, r1
	orr	r3, r2
	str	r3, [r0, #4]
	@ sp needed
	pop	{r4, pc}
.L18:
	.align	2
.L17:
	.word	-3841
.LFE35:
	.size	USART_ClockInit, .-USART_ClockInit
	.section	.text.USART_ClockStructInit,"ax",%progbits
	.align	2
	.global	USART_ClockStructInit
	.code	16
	.thumb_func
	.type	USART_ClockStructInit, %function
USART_ClockStructInit:
.LFB36:
	mov	r3, #0
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	@ sp needed
	bx	lr
.LFE36:
	.size	USART_ClockStructInit, .-USART_ClockStructInit
	.section	.text.USART_Cmd,"ax",%progbits
	.align	2
	.global	USART_Cmd
	.code	16
	.thumb_func
	.type	USART_Cmd, %function
USART_Cmd:
.LFB37:
	cmp	r1, #0
	beq	.L21
	ldr	r2, [r0]
	mov	r3, #1
	orr	r3, r2
	str	r3, [r0]
	b	.L20
.L21:
	ldr	r3, [r0]
	mov	r2, #1
	bic	r3, r2
	str	r3, [r0]
.L20:
	@ sp needed
	bx	lr
.LFE37:
	.size	USART_Cmd, .-USART_Cmd
	.section	.text.USART_DirectionModeCmd,"ax",%progbits
	.align	2
	.global	USART_DirectionModeCmd
	.code	16
	.thumb_func
	.type	USART_DirectionModeCmd, %function
USART_DirectionModeCmd:
.LFB38:
	cmp	r2, #0
	beq	.L24
	ldr	r3, [r0]
	orr	r1, r3
	str	r1, [r0]
	b	.L23
.L24:
	ldr	r3, [r0]
	bic	r3, r1
	str	r3, [r0]
.L23:
	@ sp needed
	bx	lr
.LFE38:
	.size	USART_DirectionModeCmd, .-USART_DirectionModeCmd
	.section	.text.USART_OverSampling8Cmd,"ax",%progbits
	.align	2
	.global	USART_OverSampling8Cmd
	.code	16
	.thumb_func
	.type	USART_OverSampling8Cmd, %function
USART_OverSampling8Cmd:
.LFB39:
	cmp	r1, #0
	beq	.L27
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0]
	b	.L26
.L27:
	ldr	r2, [r0]
	ldr	r3, .L29
	and	r3, r2
	str	r3, [r0]
.L26:
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
	.word	-32769
.LFE39:
	.size	USART_OverSampling8Cmd, .-USART_OverSampling8Cmd
	.section	.text.USART_OneBitMethodCmd,"ax",%progbits
	.align	2
	.global	USART_OneBitMethodCmd
	.code	16
	.thumb_func
	.type	USART_OneBitMethodCmd, %function
USART_OneBitMethodCmd:
.LFB40:
	cmp	r1, #0
	beq	.L32
	ldr	r2, [r0, #8]
	mov	r3, #128
	lsl	r3, r3, #4
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L31
.L32:
	ldr	r2, [r0, #8]
	ldr	r3, .L34
	and	r3, r2
	str	r3, [r0, #8]
.L31:
	@ sp needed
	bx	lr
.L35:
	.align	2
.L34:
	.word	-2049
.LFE40:
	.size	USART_OneBitMethodCmd, .-USART_OneBitMethodCmd
	.section	.text.USART_MSBFirstCmd,"ax",%progbits
	.align	2
	.global	USART_MSBFirstCmd
	.code	16
	.thumb_func
	.type	USART_MSBFirstCmd, %function
USART_MSBFirstCmd:
.LFB41:
	cmp	r1, #0
	beq	.L37
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #12
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L36
.L37:
	ldr	r2, [r0, #4]
	ldr	r3, .L39
	and	r3, r2
	str	r3, [r0, #4]
.L36:
	@ sp needed
	bx	lr
.L40:
	.align	2
.L39:
	.word	-524289
.LFE41:
	.size	USART_MSBFirstCmd, .-USART_MSBFirstCmd
	.section	.text.USART_DataInvCmd,"ax",%progbits
	.align	2
	.global	USART_DataInvCmd
	.code	16
	.thumb_func
	.type	USART_DataInvCmd, %function
USART_DataInvCmd:
.LFB42:
	cmp	r1, #0
	beq	.L42
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #11
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L41
.L42:
	ldr	r2, [r0, #4]
	ldr	r3, .L44
	and	r3, r2
	str	r3, [r0, #4]
.L41:
	@ sp needed
	bx	lr
.L45:
	.align	2
.L44:
	.word	-262145
.LFE42:
	.size	USART_DataInvCmd, .-USART_DataInvCmd
	.section	.text.USART_InvPinCmd,"ax",%progbits
	.align	2
	.global	USART_InvPinCmd
	.code	16
	.thumb_func
	.type	USART_InvPinCmd, %function
USART_InvPinCmd:
.LFB43:
	cmp	r2, #0
	beq	.L47
	ldr	r3, [r0, #4]
	orr	r1, r3
	str	r1, [r0, #4]
	b	.L46
.L47:
	ldr	r3, [r0, #4]
	bic	r3, r1
	str	r3, [r0, #4]
.L46:
	@ sp needed
	bx	lr
.LFE43:
	.size	USART_InvPinCmd, .-USART_InvPinCmd
	.section	.text.USART_SWAPPinCmd,"ax",%progbits
	.align	2
	.global	USART_SWAPPinCmd
	.code	16
	.thumb_func
	.type	USART_SWAPPinCmd, %function
USART_SWAPPinCmd:
.LFB44:
	cmp	r1, #0
	beq	.L50
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L49
.L50:
	ldr	r2, [r0, #4]
	ldr	r3, .L52
	and	r3, r2
	str	r3, [r0, #4]
.L49:
	@ sp needed
	bx	lr
.L53:
	.align	2
.L52:
	.word	-32769
.LFE44:
	.size	USART_SWAPPinCmd, .-USART_SWAPPinCmd
	.section	.text.USART_ReceiverTimeOutCmd,"ax",%progbits
	.align	2
	.global	USART_ReceiverTimeOutCmd
	.code	16
	.thumb_func
	.type	USART_ReceiverTimeOutCmd, %function
USART_ReceiverTimeOutCmd:
.LFB45:
	cmp	r1, #0
	beq	.L55
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #16
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L54
.L55:
	ldr	r2, [r0, #4]
	ldr	r3, .L57
	and	r3, r2
	str	r3, [r0, #4]
.L54:
	@ sp needed
	bx	lr
.L58:
	.align	2
.L57:
	.word	-8388609
.LFE45:
	.size	USART_ReceiverTimeOutCmd, .-USART_ReceiverTimeOutCmd
	.section	.text.USART_SetReceiverTimeOut,"ax",%progbits
	.align	2
	.global	USART_SetReceiverTimeOut
	.code	16
	.thumb_func
	.type	USART_SetReceiverTimeOut, %function
USART_SetReceiverTimeOut:
.LFB46:
	ldr	r3, [r0, #20]
	lsr	r3, r3, #24
	lsl	r3, r3, #24
	str	r3, [r0, #20]
	ldr	r3, [r0, #20]
	orr	r1, r3
	str	r1, [r0, #20]
	@ sp needed
	bx	lr
.LFE46:
	.size	USART_SetReceiverTimeOut, .-USART_SetReceiverTimeOut
	.section	.text.USART_SetPrescaler,"ax",%progbits
	.align	2
	.global	USART_SetPrescaler
	.code	16
	.thumb_func
	.type	USART_SetPrescaler, %function
USART_SetPrescaler:
.LFB47:
	ldrh	r3, [r0, #16]
	mov	r2, #255
	bic	r3, r2
	strh	r3, [r0, #16]
	ldrh	r3, [r0, #16]
	orr	r1, r3
	strh	r1, [r0, #16]
	@ sp needed
	bx	lr
.LFE47:
	.size	USART_SetPrescaler, .-USART_SetPrescaler
	.section	.text.USART_STOPModeCmd,"ax",%progbits
	.align	2
	.global	USART_STOPModeCmd
	.code	16
	.thumb_func
	.type	USART_STOPModeCmd, %function
USART_STOPModeCmd:
.LFB48:
	cmp	r1, #0
	beq	.L62
	ldr	r2, [r0]
	mov	r3, #2
	orr	r3, r2
	str	r3, [r0]
	b	.L61
.L62:
	ldr	r3, [r0]
	mov	r2, #2
	bic	r3, r2
	str	r3, [r0]
.L61:
	@ sp needed
	bx	lr
.LFE48:
	.size	USART_STOPModeCmd, .-USART_STOPModeCmd
	.section	.text.USART_StopModeWakeUpSourceConfig,"ax",%progbits
	.align	2
	.global	USART_StopModeWakeUpSourceConfig
	.code	16
	.thumb_func
	.type	USART_StopModeWakeUpSourceConfig, %function
USART_StopModeWakeUpSourceConfig:
.LFB49:
	ldr	r2, [r0, #8]
	ldr	r3, .L65
	and	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	orr	r1, r3
	str	r1, [r0, #8]
	@ sp needed
	bx	lr
.L66:
	.align	2
.L65:
	.word	-3145729
.LFE49:
	.size	USART_StopModeWakeUpSourceConfig, .-USART_StopModeWakeUpSourceConfig
	.section	.text.USART_AutoBaudRateCmd,"ax",%progbits
	.align	2
	.global	USART_AutoBaudRateCmd
	.code	16
	.thumb_func
	.type	USART_AutoBaudRateCmd, %function
USART_AutoBaudRateCmd:
.LFB50:
	cmp	r1, #0
	beq	.L68
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #13
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L67
.L68:
	ldr	r2, [r0, #4]
	ldr	r3, .L70
	and	r3, r2
	str	r3, [r0, #4]
.L67:
	@ sp needed
	bx	lr
.L71:
	.align	2
.L70:
	.word	-1048577
.LFE50:
	.size	USART_AutoBaudRateCmd, .-USART_AutoBaudRateCmd
	.section	.text.USART_AutoBaudRateConfig,"ax",%progbits
	.align	2
	.global	USART_AutoBaudRateConfig
	.code	16
	.thumb_func
	.type	USART_AutoBaudRateConfig, %function
USART_AutoBaudRateConfig:
.LFB51:
	ldr	r2, [r0, #4]
	ldr	r3, .L73
	and	r3, r2
	str	r3, [r0, #4]
	ldr	r3, [r0, #4]
	orr	r1, r3
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.L74:
	.align	2
.L73:
	.word	-6291457
.LFE51:
	.size	USART_AutoBaudRateConfig, .-USART_AutoBaudRateConfig
	.section	.text.USART_AutoBaudRateNewRequest,"ax",%progbits
	.align	2
	.global	USART_AutoBaudRateNewRequest
	.code	16
	.thumb_func
	.type	USART_AutoBaudRateNewRequest, %function
USART_AutoBaudRateNewRequest:
.LFB52:
	ldr	r2, [r0, #28]
	ldr	r3, .L76
	and	r3, r2
	str	r3, [r0, #28]
	@ sp needed
	bx	lr
.L77:
	.align	2
.L76:
	.word	-32769
.LFE52:
	.size	USART_AutoBaudRateNewRequest, .-USART_AutoBaudRateNewRequest
	.section	.text.USART_SendData,"ax",%progbits
	.align	2
	.global	USART_SendData
	.code	16
	.thumb_func
	.type	USART_SendData, %function
USART_SendData:
.LFB53:
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	strh	r1, [r0, #40]
	@ sp needed
	bx	lr
.LFE53:
	.size	USART_SendData, .-USART_SendData
	.section	.text.USART_ReceiveData,"ax",%progbits
	.align	2
	.global	USART_ReceiveData
	.code	16
	.thumb_func
	.type	USART_ReceiveData, %function
USART_ReceiveData:
.LFB54:
	ldrh	r0, [r0, #36]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	@ sp needed
	bx	lr
.LFE54:
	.size	USART_ReceiveData, .-USART_ReceiveData
	.section	.text.USART_SetAddress,"ax",%progbits
	.align	2
	.global	USART_SetAddress
	.code	16
	.thumb_func
	.type	USART_SetAddress, %function
USART_SetAddress:
.LFB55:
	ldr	r3, [r0, #4]
	lsl	r3, r3, #8
	lsr	r3, r3, #8
	str	r3, [r0, #4]
	ldr	r3, [r0, #4]
	lsl	r1, r1, #24
	orr	r1, r3
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.LFE55:
	.size	USART_SetAddress, .-USART_SetAddress
	.section	.text.USART_MuteModeCmd,"ax",%progbits
	.align	2
	.global	USART_MuteModeCmd
	.code	16
	.thumb_func
	.type	USART_MuteModeCmd, %function
USART_MuteModeCmd:
.LFB56:
	cmp	r1, #0
	beq	.L82
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	str	r3, [r0]
	b	.L81
.L82:
	ldr	r2, [r0]
	ldr	r3, .L84
	and	r3, r2
	str	r3, [r0]
.L81:
	@ sp needed
	bx	lr
.L85:
	.align	2
.L84:
	.word	-8193
.LFE56:
	.size	USART_MuteModeCmd, .-USART_MuteModeCmd
	.section	.text.USART_MuteModeWakeUpConfig,"ax",%progbits
	.align	2
	.global	USART_MuteModeWakeUpConfig
	.code	16
	.thumb_func
	.type	USART_MuteModeWakeUpConfig, %function
USART_MuteModeWakeUpConfig:
.LFB57:
	ldr	r2, [r0]
	ldr	r3, .L87
	and	r3, r2
	str	r3, [r0]
	ldr	r3, [r0]
	orr	r1, r3
	str	r1, [r0]
	@ sp needed
	bx	lr
.L88:
	.align	2
.L87:
	.word	-2049
.LFE57:
	.size	USART_MuteModeWakeUpConfig, .-USART_MuteModeWakeUpConfig
	.section	.text.USART_AddressDetectionConfig,"ax",%progbits
	.align	2
	.global	USART_AddressDetectionConfig
	.code	16
	.thumb_func
	.type	USART_AddressDetectionConfig, %function
USART_AddressDetectionConfig:
.LFB58:
	ldr	r3, [r0, #4]
	mov	r2, #16
	bic	r3, r2
	str	r3, [r0, #4]
	ldr	r3, [r0, #4]
	orr	r1, r3
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.LFE58:
	.size	USART_AddressDetectionConfig, .-USART_AddressDetectionConfig
	.section	.text.USART_LINBreakDetectLengthConfig,"ax",%progbits
	.align	2
	.global	USART_LINBreakDetectLengthConfig
	.code	16
	.thumb_func
	.type	USART_LINBreakDetectLengthConfig, %function
USART_LINBreakDetectLengthConfig:
.LFB59:
	ldr	r3, [r0, #4]
	mov	r2, #32
	bic	r3, r2
	str	r3, [r0, #4]
	ldr	r3, [r0, #4]
	orr	r1, r3
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.LFE59:
	.size	USART_LINBreakDetectLengthConfig, .-USART_LINBreakDetectLengthConfig
	.section	.text.USART_LINCmd,"ax",%progbits
	.align	2
	.global	USART_LINCmd
	.code	16
	.thumb_func
	.type	USART_LINCmd, %function
USART_LINCmd:
.LFB60:
	cmp	r1, #0
	beq	.L92
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L91
.L92:
	ldr	r2, [r0, #4]
	ldr	r3, .L94
	and	r3, r2
	str	r3, [r0, #4]
.L91:
	@ sp needed
	bx	lr
.L95:
	.align	2
.L94:
	.word	-16385
.LFE60:
	.size	USART_LINCmd, .-USART_LINCmd
	.section	.text.USART_HalfDuplexCmd,"ax",%progbits
	.align	2
	.global	USART_HalfDuplexCmd
	.code	16
	.thumb_func
	.type	USART_HalfDuplexCmd, %function
USART_HalfDuplexCmd:
.LFB61:
	cmp	r1, #0
	beq	.L97
	ldr	r2, [r0, #8]
	mov	r3, #8
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L96
.L97:
	ldr	r3, [r0, #8]
	mov	r2, #8
	bic	r3, r2
	str	r3, [r0, #8]
.L96:
	@ sp needed
	bx	lr
.LFE61:
	.size	USART_HalfDuplexCmd, .-USART_HalfDuplexCmd
	.section	.text.USART_SetGuardTime,"ax",%progbits
	.align	2
	.global	USART_SetGuardTime
	.code	16
	.thumb_func
	.type	USART_SetGuardTime, %function
USART_SetGuardTime:
.LFB62:
	ldrh	r2, [r0, #16]
	mov	r3, #255
	and	r3, r2
	strh	r3, [r0, #16]
	ldrh	r3, [r0, #16]
	lsl	r1, r1, #8
	orr	r1, r3
	strh	r1, [r0, #16]
	@ sp needed
	bx	lr
.LFE62:
	.size	USART_SetGuardTime, .-USART_SetGuardTime
	.section	.text.USART_SmartCardCmd,"ax",%progbits
	.align	2
	.global	USART_SmartCardCmd
	.code	16
	.thumb_func
	.type	USART_SmartCardCmd, %function
USART_SmartCardCmd:
.LFB63:
	cmp	r1, #0
	beq	.L101
	ldr	r2, [r0, #8]
	mov	r3, #32
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L100
.L101:
	ldr	r3, [r0, #8]
	mov	r2, #32
	bic	r3, r2
	str	r3, [r0, #8]
.L100:
	@ sp needed
	bx	lr
.LFE63:
	.size	USART_SmartCardCmd, .-USART_SmartCardCmd
	.section	.text.USART_SmartCardNACKCmd,"ax",%progbits
	.align	2
	.global	USART_SmartCardNACKCmd
	.code	16
	.thumb_func
	.type	USART_SmartCardNACKCmd, %function
USART_SmartCardNACKCmd:
.LFB64:
	cmp	r1, #0
	beq	.L104
	ldr	r2, [r0, #8]
	mov	r3, #16
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L103
.L104:
	ldr	r3, [r0, #8]
	mov	r2, #16
	bic	r3, r2
	str	r3, [r0, #8]
.L103:
	@ sp needed
	bx	lr
.LFE64:
	.size	USART_SmartCardNACKCmd, .-USART_SmartCardNACKCmd
	.section	.text.USART_SetAutoRetryCount,"ax",%progbits
	.align	2
	.global	USART_SetAutoRetryCount
	.code	16
	.thumb_func
	.type	USART_SetAutoRetryCount, %function
USART_SetAutoRetryCount:
.LFB65:
	ldr	r2, [r0, #8]
	ldr	r3, .L107
	and	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	lsl	r1, r1, #17
	orr	r1, r3
	str	r1, [r0, #8]
	@ sp needed
	bx	lr
.L108:
	.align	2
.L107:
	.word	-917505
.LFE65:
	.size	USART_SetAutoRetryCount, .-USART_SetAutoRetryCount
	.section	.text.USART_SetBlockLength,"ax",%progbits
	.align	2
	.global	USART_SetBlockLength
	.code	16
	.thumb_func
	.type	USART_SetBlockLength, %function
USART_SetBlockLength:
.LFB66:
	ldr	r3, [r0, #20]
	lsl	r3, r3, #8
	lsr	r3, r3, #8
	str	r3, [r0, #20]
	ldr	r3, [r0, #20]
	lsl	r1, r1, #24
	orr	r1, r3
	str	r1, [r0, #20]
	@ sp needed
	bx	lr
.LFE66:
	.size	USART_SetBlockLength, .-USART_SetBlockLength
	.section	.text.USART_IrDAConfig,"ax",%progbits
	.align	2
	.global	USART_IrDAConfig
	.code	16
	.thumb_func
	.type	USART_IrDAConfig, %function
USART_IrDAConfig:
.LFB67:
	ldr	r3, [r0, #8]
	mov	r2, #4
	bic	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	orr	r1, r3
	str	r1, [r0, #8]
	@ sp needed
	bx	lr
.LFE67:
	.size	USART_IrDAConfig, .-USART_IrDAConfig
	.section	.text.USART_IrDACmd,"ax",%progbits
	.align	2
	.global	USART_IrDACmd
	.code	16
	.thumb_func
	.type	USART_IrDACmd, %function
USART_IrDACmd:
.LFB68:
	cmp	r1, #0
	beq	.L112
	ldr	r2, [r0, #8]
	mov	r3, #2
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L111
.L112:
	ldr	r3, [r0, #8]
	mov	r2, #2
	bic	r3, r2
	str	r3, [r0, #8]
.L111:
	@ sp needed
	bx	lr
.LFE68:
	.size	USART_IrDACmd, .-USART_IrDACmd
	.section	.text.USART_DECmd,"ax",%progbits
	.align	2
	.global	USART_DECmd
	.code	16
	.thumb_func
	.type	USART_DECmd, %function
USART_DECmd:
.LFB69:
	cmp	r1, #0
	beq	.L115
	ldr	r2, [r0, #8]
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	str	r3, [r0, #8]
	b	.L114
.L115:
	ldr	r2, [r0, #8]
	ldr	r3, .L117
	and	r3, r2
	str	r3, [r0, #8]
.L114:
	@ sp needed
	bx	lr
.L118:
	.align	2
.L117:
	.word	-16385
.LFE69:
	.size	USART_DECmd, .-USART_DECmd
	.section	.text.USART_DEPolarityConfig,"ax",%progbits
	.align	2
	.global	USART_DEPolarityConfig
	.code	16
	.thumb_func
	.type	USART_DEPolarityConfig, %function
USART_DEPolarityConfig:
.LFB70:
	ldr	r2, [r0, #8]
	ldr	r3, .L120
	and	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	orr	r1, r3
	str	r1, [r0, #8]
	@ sp needed
	bx	lr
.L121:
	.align	2
.L120:
	.word	-32769
.LFE70:
	.size	USART_DEPolarityConfig, .-USART_DEPolarityConfig
	.section	.text.USART_SetDEAssertionTime,"ax",%progbits
	.align	2
	.global	USART_SetDEAssertionTime
	.code	16
	.thumb_func
	.type	USART_SetDEAssertionTime, %function
USART_SetDEAssertionTime:
.LFB71:
	ldr	r2, [r0]
	ldr	r3, .L123
	and	r3, r2
	str	r3, [r0]
	ldr	r3, [r0]
	lsl	r1, r1, #21
	orr	r1, r3
	str	r1, [r0]
	@ sp needed
	bx	lr
.L124:
	.align	2
.L123:
	.word	-65011713
.LFE71:
	.size	USART_SetDEAssertionTime, .-USART_SetDEAssertionTime
	.section	.text.USART_SetDEDeassertionTime,"ax",%progbits
	.align	2
	.global	USART_SetDEDeassertionTime
	.code	16
	.thumb_func
	.type	USART_SetDEDeassertionTime, %function
USART_SetDEDeassertionTime:
.LFB72:
	ldr	r2, [r0]
	ldr	r3, .L126
	and	r3, r2
	str	r3, [r0]
	ldr	r3, [r0]
	lsl	r1, r1, #16
	orr	r1, r3
	str	r1, [r0]
	@ sp needed
	bx	lr
.L127:
	.align	2
.L126:
	.word	-2031617
.LFE72:
	.size	USART_SetDEDeassertionTime, .-USART_SetDEDeassertionTime
	.section	.text.USART_DMACmd,"ax",%progbits
	.align	2
	.global	USART_DMACmd
	.code	16
	.thumb_func
	.type	USART_DMACmd, %function
USART_DMACmd:
.LFB73:
	cmp	r2, #0
	beq	.L129
	ldr	r3, [r0, #8]
	orr	r1, r3
	str	r1, [r0, #8]
	b	.L128
.L129:
	ldr	r3, [r0, #8]
	bic	r3, r1
	str	r3, [r0, #8]
.L128:
	@ sp needed
	bx	lr
.LFE73:
	.size	USART_DMACmd, .-USART_DMACmd
	.section	.text.USART_DMAReceptionErrorConfig,"ax",%progbits
	.align	2
	.global	USART_DMAReceptionErrorConfig
	.code	16
	.thumb_func
	.type	USART_DMAReceptionErrorConfig, %function
USART_DMAReceptionErrorConfig:
.LFB74:
	ldr	r2, [r0, #8]
	ldr	r3, .L132
	and	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	orr	r1, r3
	str	r1, [r0, #8]
	@ sp needed
	bx	lr
.L133:
	.align	2
.L132:
	.word	-8193
.LFE74:
	.size	USART_DMAReceptionErrorConfig, .-USART_DMAReceptionErrorConfig
	.section	.text.USART_ITConfig,"ax",%progbits
	.align	2
	.global	USART_ITConfig
	.code	16
	.thumb_func
	.type	USART_ITConfig, %function
USART_ITConfig:
.LFB75:
	push	{r4, r5, lr}
.LCFI4:
	mov	r3, r0
	uxth	r4, r1
	lsr	r4, r4, #8
	mov	r5, #255
	and	r1, r5
	mov	r5, #1
	lsl	r5, r5, r1
	mov	r1, r5
	cmp	r4, #2
	bne	.L135
	add	r3, r0, #4
	b	.L136
.L135:
	cmp	r4, #3
	bne	.L136
	mov	r3, r0
	add	r3, r3, #8
.L136:
	cmp	r2, #0
	beq	.L137
	ldr	r2, [r3]
	orr	r1, r2
	str	r1, [r3]
	b	.L134
.L137:
	ldr	r2, [r3]
	bic	r2, r1
	str	r2, [r3]
.L134:
	@ sp needed
	pop	{r4, r5, pc}
.LFE75:
	.size	USART_ITConfig, .-USART_ITConfig
	.section	.text.USART_RequestCmd,"ax",%progbits
	.align	2
	.global	USART_RequestCmd
	.code	16
	.thumb_func
	.type	USART_RequestCmd, %function
USART_RequestCmd:
.LFB76:
	cmp	r2, #0
	beq	.L140
	ldrh	r3, [r0, #24]
	orr	r1, r3
	uxth	r1, r1
	strh	r1, [r0, #24]
	b	.L139
.L140:
	ldrh	r3, [r0, #24]
	bic	r3, r1
	strh	r3, [r0, #24]
.L139:
	@ sp needed
	bx	lr
.LFE76:
	.size	USART_RequestCmd, .-USART_RequestCmd
	.section	.text.USART_OverrunDetectionConfig,"ax",%progbits
	.align	2
	.global	USART_OverrunDetectionConfig
	.code	16
	.thumb_func
	.type	USART_OverrunDetectionConfig, %function
USART_OverrunDetectionConfig:
.LFB77:
	ldr	r2, [r0, #8]
	ldr	r3, .L143
	and	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0, #8]
	orr	r1, r3
	str	r1, [r0, #8]
	@ sp needed
	bx	lr
.L144:
	.align	2
.L143:
	.word	-4097
.LFE77:
	.size	USART_OverrunDetectionConfig, .-USART_OverrunDetectionConfig
	.section	.text.USART_GetFlagStatus,"ax",%progbits
	.align	2
	.global	USART_GetFlagStatus
	.code	16
	.thumb_func
	.type	USART_GetFlagStatus, %function
USART_GetFlagStatus:
.LFB78:
	ldr	r0, [r0, #28]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE78:
	.size	USART_GetFlagStatus, .-USART_GetFlagStatus
	.section	.text.USART_ClearFlag,"ax",%progbits
	.align	2
	.global	USART_ClearFlag
	.code	16
	.thumb_func
	.type	USART_ClearFlag, %function
USART_ClearFlag:
.LFB79:
	str	r1, [r0, #32]
	@ sp needed
	bx	lr
.LFE79:
	.size	USART_ClearFlag, .-USART_ClearFlag
	.section	.text.USART_GetITStatus,"ax",%progbits
	.align	2
	.global	USART_GetITStatus
	.code	16
	.thumb_func
	.type	USART_GetITStatus, %function
USART_GetITStatus:
.LFB80:
	push	{r4, lr}
.LCFI5:
	uxth	r3, r1
	lsr	r3, r3, #8
	mov	r2, #255
	and	r2, r1
	mov	r4, #1
	lsl	r4, r4, r2
	mov	r2, r4
	cmp	r3, #1
	bne	.L148
	ldr	r4, [r0]
	and	r2, r4
	b	.L149
.L148:
	cmp	r3, #2
	bne	.L150
	ldr	r4, [r0, #4]
	and	r2, r4
	b	.L149
.L150:
	ldr	r4, [r0, #8]
	and	r2, r4
.L149:
	ldr	r3, [r0, #28]
	mov	r0, #0
	cmp	r2, #0
	beq	.L151
	lsr	r1, r1, #16
	mov	r0, #1
	lsl	r0, r0, r1
	and	r3, r0
	sub	r0, r3, #1
	sbc	r3, r3, r0
	uxtb	r0, r3
.L151:
	@ sp needed
	pop	{r4, pc}
.LFE80:
	.size	USART_GetITStatus, .-USART_GetITStatus
	.section	.text.USART_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	USART_ClearITPendingBit
	.code	16
	.thumb_func
	.type	USART_ClearITPendingBit, %function
USART_ClearITPendingBit:
.LFB81:
	lsr	r1, r1, #16
	mov	r3, #1
	lsl	r3, r3, r1
	str	r3, [r0, #32]
	@ sp needed
	bx	lr
.LFE81:
	.size	USART_ClearITPendingBit, .-USART_ClearITPendingBit
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
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x30
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
	.byte	0x4
	.4byte	.LCFI3-.LFB35
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
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
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
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI4-.LFB75
	.byte	0xe
	.uleb128 0xc
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
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.align	2
.LEFDE92:
.LSFDE94:
	.4byte	.LEFDE94-.LASFDE94
.LASFDE94:
	.4byte	.Lframe0
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.align	2
.LEFDE94:
.LSFDE96:
	.4byte	.LEFDE96-.LASFDE96
.LASFDE96:
	.4byte	.Lframe0
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.byte	0x4
	.4byte	.LCFI5-.LFB80
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE96:
.LSFDE98:
	.4byte	.LEFDE98-.LASFDE98
.LASFDE98:
	.4byte	.Lframe0
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
	.align	2
.LEFDE98:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_usart.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x39c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x1
	.4byte	.LASF51
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0xac
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xc8
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x132
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x146
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x164
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x174
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x191
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1b0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x1cb
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1e8
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x209
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x22c
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x24c
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x265
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x27f
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x295
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2c5
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2e5
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x317
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x336
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x345
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x36d
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x37c
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x3ad
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x3bf
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x3da
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x3ed
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x42c
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x43d
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x475
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x4c5
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x4d7
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x4ef
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x506
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x517
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x555
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x566
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x59f
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x5b9
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x5ca
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x5dd
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x60b
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x62b
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x6af
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x6e4
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x704
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x72d
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x75d
	.4byte	.LFB79
	.4byte	.LFE79-.LFB79
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x77b
	.4byte	.LFB80
	.4byte	.LFE80-.LFB80
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x7c2
	.4byte	.LFB81
	.4byte	.LFE81-.LFB81
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
	.4byte	0x1a4
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF45:
	.ascii	"USART_OverrunDetectionConfig\000"
.LASF50:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF37:
	.ascii	"USART_DECmd\000"
.LASF18:
	.ascii	"USART_AutoBaudRateCmd\000"
.LASF22:
	.ascii	"USART_ReceiveData\000"
.LASF39:
	.ascii	"USART_SetDEAssertionTime\000"
.LASF4:
	.ascii	"USART_ClockStructInit\000"
.LASF20:
	.ascii	"USART_AutoBaudRateNewRequest\000"
.LASF14:
	.ascii	"USART_SetReceiverTimeOut\000"
.LASF41:
	.ascii	"USART_DMACmd\000"
.LASF51:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_usart."
	.ascii	"c\000"
.LASF31:
	.ascii	"USART_SmartCardCmd\000"
.LASF3:
	.ascii	"USART_ClockInit\000"
.LASF13:
	.ascii	"USART_ReceiverTimeOutCmd\000"
.LASF2:
	.ascii	"USART_StructInit\000"
.LASF17:
	.ascii	"USART_StopModeWakeUpSourceConfig\000"
.LASF19:
	.ascii	"USART_AutoBaudRateConfig\000"
.LASF24:
	.ascii	"USART_MuteModeCmd\000"
.LASF11:
	.ascii	"USART_InvPinCmd\000"
.LASF12:
	.ascii	"USART_SWAPPinCmd\000"
.LASF8:
	.ascii	"USART_OneBitMethodCmd\000"
.LASF28:
	.ascii	"USART_LINCmd\000"
.LASF7:
	.ascii	"USART_OverSampling8Cmd\000"
.LASF47:
	.ascii	"USART_ClearFlag\000"
.LASF46:
	.ascii	"USART_GetFlagStatus\000"
.LASF1:
	.ascii	"USART_Init\000"
.LASF36:
	.ascii	"USART_IrDACmd\000"
.LASF26:
	.ascii	"USART_AddressDetectionConfig\000"
.LASF43:
	.ascii	"USART_ITConfig\000"
.LASF40:
	.ascii	"USART_SetDEDeassertionTime\000"
.LASF25:
	.ascii	"USART_MuteModeWakeUpConfig\000"
.LASF30:
	.ascii	"USART_SetGuardTime\000"
.LASF6:
	.ascii	"USART_DirectionModeCmd\000"
.LASF0:
	.ascii	"USART_DeInit\000"
.LASF16:
	.ascii	"USART_STOPModeCmd\000"
.LASF9:
	.ascii	"USART_MSBFirstCmd\000"
.LASF29:
	.ascii	"USART_HalfDuplexCmd\000"
.LASF32:
	.ascii	"USART_SmartCardNACKCmd\000"
.LASF38:
	.ascii	"USART_DEPolarityConfig\000"
.LASF35:
	.ascii	"USART_IrDAConfig\000"
.LASF21:
	.ascii	"USART_SendData\000"
.LASF15:
	.ascii	"USART_SetPrescaler\000"
.LASF44:
	.ascii	"USART_RequestCmd\000"
.LASF42:
	.ascii	"USART_DMAReceptionErrorConfig\000"
.LASF48:
	.ascii	"USART_GetITStatus\000"
.LASF49:
	.ascii	"USART_ClearITPendingBit\000"
.LASF33:
	.ascii	"USART_SetAutoRetryCount\000"
.LASF27:
	.ascii	"USART_LINBreakDetectLengthConfig\000"
.LASF23:
	.ascii	"USART_SetAddress\000"
.LASF34:
	.ascii	"USART_SetBlockLength\000"
.LASF10:
	.ascii	"USART_DataInvCmd\000"
.LASF5:
	.ascii	"USART_Cmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
