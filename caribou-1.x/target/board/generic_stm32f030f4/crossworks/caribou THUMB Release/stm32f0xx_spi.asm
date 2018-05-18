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
	.file	"stm32f0xx_spi.c"
	.text
.Ltext0:
	.section	.text.SPI_I2S_DeInit,"ax",%progbits
	.align	2
	.global	SPI_I2S_DeInit
	.code	16
	.thumb_func
	.type	SPI_I2S_DeInit, %function
SPI_I2S_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	ldr	r3, .L4
	cmp	r0, r3
	bne	.L2
	mov	r4, #128
	lsl	r4, r4, #5
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
	lsl	r4, r4, #7
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
	.word	1073819648
	.word	1073756160
.LFE32:
	.size	SPI_I2S_DeInit, .-SPI_I2S_DeInit
	.section	.text.SPI_StructInit,"ax",%progbits
	.align	2
	.global	SPI_StructInit
	.code	16
	.thumb_func
	.type	SPI_StructInit, %function
SPI_StructInit:
.LFB33:
	mov	r3, #0
	strh	r3, [r0]
	strh	r3, [r0, #2]
	mov	r2, #224
	lsl	r2, r2, #3
	strh	r2, [r0, #4]
	strh	r3, [r0, #6]
	strh	r3, [r0, #8]
	strh	r3, [r0, #10]
	strh	r3, [r0, #12]
	strh	r3, [r0, #14]
	mov	r3, #7
	strh	r3, [r0, #16]
	@ sp needed
	bx	lr
.LFE33:
	.size	SPI_StructInit, .-SPI_StructInit
	.section	.text.SPI_Init,"ax",%progbits
	.align	2
	.global	SPI_Init
	.code	16
	.thumb_func
	.type	SPI_Init, %function
SPI_Init:
.LFB34:
	push	{r4, lr}
.LCFI1:
	ldrh	r3, [r0]
	mov	r2, #193
	lsl	r2, r2, #6
	and	r2, r3
	ldrh	r4, [r1, #14]
	ldrh	r3, [r1]
	orr	r3, r4
	ldrh	r4, [r1, #6]
	orr	r3, r4
	ldrh	r4, [r1, #8]
	orr	r3, r4
	ldrh	r4, [r1, #10]
	orr	r3, r4
	ldrh	r4, [r1, #12]
	orr	r3, r4
	orr	r3, r2
	strh	r3, [r0]
	ldrh	r2, [r0, #4]
	ldr	r3, .L8
	and	r3, r2
	ldrh	r2, [r1, #4]
	orr	r3, r2
	strh	r3, [r0, #4]
	ldrh	r3, [r1, #16]
	strh	r3, [r0, #16]
	ldrh	r3, [r0]
	mov	r2, #4
	bic	r3, r2
	ldrh	r2, [r1, #2]
	orr	r3, r2
	strh	r3, [r0]
	ldrh	r2, [r0, #28]
	ldr	r3, .L8+4
	and	r3, r2
	strh	r3, [r0, #28]
	@ sp needed
	pop	{r4, pc}
.L9:
	.align	2
.L8:
	.word	-3841
	.word	-2049
.LFE34:
	.size	SPI_Init, .-SPI_Init
	.section	.text.I2S_StructInit,"ax",%progbits
	.align	2
	.global	I2S_StructInit
	.code	16
	.thumb_func
	.type	I2S_StructInit, %function
I2S_StructInit:
.LFB35:
	mov	r3, #0
	strh	r3, [r0]
	strh	r3, [r0, #2]
	strh	r3, [r0, #4]
	strh	r3, [r0, #6]
	mov	r2, #2
	str	r2, [r0, #8]
	strh	r3, [r0, #12]
	@ sp needed
	bx	lr
.LFE35:
	.size	I2S_StructInit, .-I2S_StructInit
	.global	__aeabi_uidiv
	.section	.text.I2S_Init,"ax",%progbits
	.align	2
	.global	I2S_Init
	.code	16
	.thumb_func
	.type	I2S_Init, %function
I2S_Init:
.LFB36:
	push	{r4, r5, r6, r7, lr}
.LCFI2:
	sub	sp, sp, #36
.LCFI3:
	mov	r5, r0
	mov	r4, r1
	ldrh	r2, [r0, #28]
	ldr	r3, .L19
	and	r3, r2
	strh	r3, [r0, #28]
	mov	r3, #2
	strh	r3, [r0, #32]
	ldrh	r6, [r0, #28]
	uxth	r6, r6
	ldr	r3, [r1, #8]
	cmp	r3, #2
	beq	.L16
	ldrh	r1, [r1, #4]
	sub	r3, r1, #1
	sbc	r1, r1, r3
	add	r7, r1, #1
	add	r0, sp, #4
	bl	RCC_GetClocksFreq
	ldr	r0, [sp, #4]
	ldrh	r2, [r4, #6]
	mov	r3, #128
	lsl	r3, r3, #2
	cmp	r2, r3
	bne	.L14
	lsr	r0, r0, #8
	lsl	r3, r0, #2
	add	r0, r3, r0
	lsl	r0, r0, #1
	ldr	r1, [r4, #8]
	bl	__aeabi_uidiv
	add	r0, r0, #5
	uxth	r0, r0
	b	.L15
.L14:
	lsl	r1, r7, #5
	bl	__aeabi_uidiv
	lsl	r3, r0, #2
	add	r0, r3, r0
	lsl	r0, r0, #1
	ldr	r1, [r4, #8]
	bl	__aeabi_uidiv
	add	r0, r0, #5
	uxth	r0, r0
.L15:
	mov	r1, #10
	bl	__aeabi_uidiv
	mov	r3, #1
	and	r3, r0
	sub	r0, r0, r3
	lsr	r0, r0, #1
	uxth	r0, r0
	sub	r2, r0, #2
	uxth	r2, r2
	cmp	r2, #253
	bhi	.L18
	lsl	r3, r3, #8
	uxth	r3, r3
	b	.L12
.L16:
	mov	r3, #0
	mov	r0, #2
	b	.L12
.L18:
	mov	r3, #0
	mov	r0, #2
.L12:
	orr	r0, r3
	ldrh	r3, [r4, #6]
	orr	r0, r3
	strh	r0, [r5, #32]
	ldrh	r3, [r4]
	orr	r6, r3
	mov	r3, #128
	lsl	r3, r3, #4
	orr	r6, r3
	ldrh	r3, [r4, #2]
	orr	r6, r3
	ldrh	r3, [r4, #4]
	orr	r6, r3
	ldrh	r3, [r4, #12]
	orr	r6, r3
	strh	r6, [r5, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L20:
	.align	2
.L19:
	.word	-4032
.LFE36:
	.size	I2S_Init, .-I2S_Init
	.section	.text.SPI_Cmd,"ax",%progbits
	.align	2
	.global	SPI_Cmd
	.code	16
	.thumb_func
	.type	SPI_Cmd, %function
SPI_Cmd:
.LFB37:
	cmp	r1, #0
	beq	.L22
	ldrh	r2, [r0]
	mov	r3, #64
	orr	r3, r2
	strh	r3, [r0]
	b	.L21
.L22:
	ldrh	r3, [r0]
	mov	r2, #64
	bic	r3, r2
	strh	r3, [r0]
.L21:
	@ sp needed
	bx	lr
.LFE37:
	.size	SPI_Cmd, .-SPI_Cmd
	.section	.text.SPI_TIModeCmd,"ax",%progbits
	.align	2
	.global	SPI_TIModeCmd
	.code	16
	.thumb_func
	.type	SPI_TIModeCmd, %function
SPI_TIModeCmd:
.LFB38:
	cmp	r1, #0
	beq	.L25
	ldrh	r2, [r0, #4]
	mov	r3, #16
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L24
.L25:
	ldrh	r3, [r0, #4]
	mov	r2, #16
	bic	r3, r2
	strh	r3, [r0, #4]
.L24:
	@ sp needed
	bx	lr
.LFE38:
	.size	SPI_TIModeCmd, .-SPI_TIModeCmd
	.section	.text.I2S_Cmd,"ax",%progbits
	.align	2
	.global	I2S_Cmd
	.code	16
	.thumb_func
	.type	I2S_Cmd, %function
I2S_Cmd:
.LFB39:
	cmp	r1, #0
	beq	.L28
	ldrh	r2, [r0, #28]
	mov	r3, #128
	lsl	r3, r3, #3
	orr	r3, r2
	strh	r3, [r0, #28]
	b	.L27
.L28:
	ldrh	r2, [r0, #28]
	ldr	r3, .L30
	and	r3, r2
	strh	r3, [r0, #28]
.L27:
	@ sp needed
	bx	lr
.L31:
	.align	2
.L30:
	.word	-1025
.LFE39:
	.size	I2S_Cmd, .-I2S_Cmd
	.section	.text.SPI_DataSizeConfig,"ax",%progbits
	.align	2
	.global	SPI_DataSizeConfig
	.code	16
	.thumb_func
	.type	SPI_DataSizeConfig, %function
SPI_DataSizeConfig:
.LFB40:
	ldrh	r2, [r0, #4]
	ldr	r3, .L33
	and	r3, r2
	orr	r1, r3
	strh	r1, [r0, #4]
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
	.word	-3841
.LFE40:
	.size	SPI_DataSizeConfig, .-SPI_DataSizeConfig
	.section	.text.SPI_RxFIFOThresholdConfig,"ax",%progbits
	.align	2
	.global	SPI_RxFIFOThresholdConfig
	.code	16
	.thumb_func
	.type	SPI_RxFIFOThresholdConfig, %function
SPI_RxFIFOThresholdConfig:
.LFB41:
	ldrh	r2, [r0, #4]
	ldr	r3, .L36
	and	r3, r2
	strh	r3, [r0, #4]
	ldrh	r3, [r0, #4]
	orr	r1, r3
	strh	r1, [r0, #4]
	@ sp needed
	bx	lr
.L37:
	.align	2
.L36:
	.word	-4097
.LFE41:
	.size	SPI_RxFIFOThresholdConfig, .-SPI_RxFIFOThresholdConfig
	.section	.text.SPI_BiDirectionalLineConfig,"ax",%progbits
	.align	2
	.global	SPI_BiDirectionalLineConfig
	.code	16
	.thumb_func
	.type	SPI_BiDirectionalLineConfig, %function
SPI_BiDirectionalLineConfig:
.LFB42:
	mov	r3, #128
	lsl	r3, r3, #7
	cmp	r1, r3
	bne	.L39
	ldrh	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	strh	r3, [r0]
	b	.L38
.L39:
	ldrh	r2, [r0]
	ldr	r3, .L41
	and	r3, r2
	strh	r3, [r0]
.L38:
	@ sp needed
	bx	lr
.L42:
	.align	2
.L41:
	.word	-16385
.LFE42:
	.size	SPI_BiDirectionalLineConfig, .-SPI_BiDirectionalLineConfig
	.section	.text.SPI_NSSInternalSoftwareConfig,"ax",%progbits
	.align	2
	.global	SPI_NSSInternalSoftwareConfig
	.code	16
	.thumb_func
	.type	SPI_NSSInternalSoftwareConfig, %function
SPI_NSSInternalSoftwareConfig:
.LFB43:
	ldr	r3, .L46
	cmp	r1, r3
	beq	.L44
	ldrh	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #1
	orr	r3, r2
	strh	r3, [r0]
	b	.L43
.L44:
	ldrh	r2, [r0]
	ldr	r3, .L46+4
	and	r3, r2
	strh	r3, [r0]
.L43:
	@ sp needed
	bx	lr
.L47:
	.align	2
.L46:
	.word	65279
	.word	-257
.LFE43:
	.size	SPI_NSSInternalSoftwareConfig, .-SPI_NSSInternalSoftwareConfig
	.section	.text.SPI_SSOutputCmd,"ax",%progbits
	.align	2
	.global	SPI_SSOutputCmd
	.code	16
	.thumb_func
	.type	SPI_SSOutputCmd, %function
SPI_SSOutputCmd:
.LFB44:
	cmp	r1, #0
	beq	.L49
	ldrh	r2, [r0, #4]
	mov	r3, #4
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L48
.L49:
	ldrh	r3, [r0, #4]
	mov	r2, #4
	bic	r3, r2
	strh	r3, [r0, #4]
.L48:
	@ sp needed
	bx	lr
.LFE44:
	.size	SPI_SSOutputCmd, .-SPI_SSOutputCmd
	.section	.text.SPI_NSSPulseModeCmd,"ax",%progbits
	.align	2
	.global	SPI_NSSPulseModeCmd
	.code	16
	.thumb_func
	.type	SPI_NSSPulseModeCmd, %function
SPI_NSSPulseModeCmd:
.LFB45:
	cmp	r1, #0
	beq	.L52
	ldrh	r2, [r0, #4]
	mov	r3, #8
	orr	r3, r2
	strh	r3, [r0, #4]
	b	.L51
.L52:
	ldrh	r3, [r0, #4]
	mov	r2, #8
	bic	r3, r2
	strh	r3, [r0, #4]
.L51:
	@ sp needed
	bx	lr
.LFE45:
	.size	SPI_NSSPulseModeCmd, .-SPI_NSSPulseModeCmd
	.section	.text.SPI_SendData8,"ax",%progbits
	.align	2
	.global	SPI_SendData8
	.code	16
	.thumb_func
	.type	SPI_SendData8, %function
SPI_SendData8:
.LFB46:
	strb	r1, [r0, #12]
	@ sp needed
	bx	lr
.LFE46:
	.size	SPI_SendData8, .-SPI_SendData8
	.section	.text.SPI_I2S_SendData16,"ax",%progbits
	.align	2
	.global	SPI_I2S_SendData16
	.code	16
	.thumb_func
	.type	SPI_I2S_SendData16, %function
SPI_I2S_SendData16:
.LFB47:
	strh	r1, [r0, #12]
	@ sp needed
	bx	lr
.LFE47:
	.size	SPI_I2S_SendData16, .-SPI_I2S_SendData16
	.section	.text.SPI_ReceiveData8,"ax",%progbits
	.align	2
	.global	SPI_ReceiveData8
	.code	16
	.thumb_func
	.type	SPI_ReceiveData8, %function
SPI_ReceiveData8:
.LFB48:
	ldrb	r0, [r0, #12]
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE48:
	.size	SPI_ReceiveData8, .-SPI_ReceiveData8
	.section	.text.SPI_I2S_ReceiveData16,"ax",%progbits
	.align	2
	.global	SPI_I2S_ReceiveData16
	.code	16
	.thumb_func
	.type	SPI_I2S_ReceiveData16, %function
SPI_I2S_ReceiveData16:
.LFB49:
	ldrh	r0, [r0, #12]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE49:
	.size	SPI_I2S_ReceiveData16, .-SPI_I2S_ReceiveData16
	.section	.text.SPI_CRCLengthConfig,"ax",%progbits
	.align	2
	.global	SPI_CRCLengthConfig
	.code	16
	.thumb_func
	.type	SPI_CRCLengthConfig, %function
SPI_CRCLengthConfig:
.LFB50:
	ldrh	r2, [r0]
	ldr	r3, .L59
	and	r3, r2
	strh	r3, [r0]
	ldrh	r3, [r0]
	orr	r1, r3
	strh	r1, [r0]
	@ sp needed
	bx	lr
.L60:
	.align	2
.L59:
	.word	-2049
.LFE50:
	.size	SPI_CRCLengthConfig, .-SPI_CRCLengthConfig
	.section	.text.SPI_CalculateCRC,"ax",%progbits
	.align	2
	.global	SPI_CalculateCRC
	.code	16
	.thumb_func
	.type	SPI_CalculateCRC, %function
SPI_CalculateCRC:
.LFB51:
	cmp	r1, #0
	beq	.L62
	ldrh	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	strh	r3, [r0]
	b	.L61
.L62:
	ldrh	r2, [r0]
	ldr	r3, .L64
	and	r3, r2
	strh	r3, [r0]
.L61:
	@ sp needed
	bx	lr
.L65:
	.align	2
.L64:
	.word	-8193
.LFE51:
	.size	SPI_CalculateCRC, .-SPI_CalculateCRC
	.section	.text.SPI_TransmitCRC,"ax",%progbits
	.align	2
	.global	SPI_TransmitCRC
	.code	16
	.thumb_func
	.type	SPI_TransmitCRC, %function
SPI_TransmitCRC:
.LFB52:
	ldrh	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	strh	r3, [r0]
	@ sp needed
	bx	lr
.LFE52:
	.size	SPI_TransmitCRC, .-SPI_TransmitCRC
	.section	.text.SPI_GetCRC,"ax",%progbits
	.align	2
	.global	SPI_GetCRC
	.code	16
	.thumb_func
	.type	SPI_GetCRC, %function
SPI_GetCRC:
.LFB53:
	cmp	r1, #1
	beq	.L68
	ldrh	r0, [r0, #24]
	uxth	r0, r0
	b	.L69
.L68:
	ldrh	r0, [r0, #20]
	uxth	r0, r0
.L69:
	@ sp needed
	bx	lr
.LFE53:
	.size	SPI_GetCRC, .-SPI_GetCRC
	.section	.text.SPI_GetCRCPolynomial,"ax",%progbits
	.align	2
	.global	SPI_GetCRCPolynomial
	.code	16
	.thumb_func
	.type	SPI_GetCRCPolynomial, %function
SPI_GetCRCPolynomial:
.LFB54:
	ldrh	r0, [r0, #16]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE54:
	.size	SPI_GetCRCPolynomial, .-SPI_GetCRCPolynomial
	.section	.text.SPI_I2S_DMACmd,"ax",%progbits
	.align	2
	.global	SPI_I2S_DMACmd
	.code	16
	.thumb_func
	.type	SPI_I2S_DMACmd, %function
SPI_I2S_DMACmd:
.LFB55:
	cmp	r2, #0
	beq	.L72
	ldrh	r3, [r0, #4]
	orr	r1, r3
	strh	r1, [r0, #4]
	b	.L71
.L72:
	ldrh	r3, [r0, #4]
	bic	r3, r1
	strh	r3, [r0, #4]
.L71:
	@ sp needed
	bx	lr
.LFE55:
	.size	SPI_I2S_DMACmd, .-SPI_I2S_DMACmd
	.section	.text.SPI_LastDMATransferCmd,"ax",%progbits
	.align	2
	.global	SPI_LastDMATransferCmd
	.code	16
	.thumb_func
	.type	SPI_LastDMATransferCmd, %function
SPI_LastDMATransferCmd:
.LFB56:
	ldrh	r2, [r0, #4]
	ldr	r3, .L75
	and	r3, r2
	strh	r3, [r0, #4]
	ldrh	r3, [r0, #4]
	orr	r1, r3
	strh	r1, [r0, #4]
	@ sp needed
	bx	lr
.L76:
	.align	2
.L75:
	.word	-24577
.LFE56:
	.size	SPI_LastDMATransferCmd, .-SPI_LastDMATransferCmd
	.section	.text.SPI_I2S_ITConfig,"ax",%progbits
	.align	2
	.global	SPI_I2S_ITConfig
	.code	16
	.thumb_func
	.type	SPI_I2S_ITConfig, %function
SPI_I2S_ITConfig:
.LFB57:
	lsr	r1, r1, #4
	mov	r3, #1
	lsl	r3, r3, r1
	uxth	r1, r3
	cmp	r2, #0
	beq	.L78
	ldrh	r3, [r0, #4]
	orr	r1, r3
	strh	r1, [r0, #4]
	b	.L77
.L78:
	ldrh	r3, [r0, #4]
	bic	r3, r1
	strh	r3, [r0, #4]
.L77:
	@ sp needed
	bx	lr
.LFE57:
	.size	SPI_I2S_ITConfig, .-SPI_I2S_ITConfig
	.section	.text.SPI_GetTransmissionFIFOStatus,"ax",%progbits
	.align	2
	.global	SPI_GetTransmissionFIFOStatus
	.code	16
	.thumb_func
	.type	SPI_GetTransmissionFIFOStatus, %function
SPI_GetTransmissionFIFOStatus:
.LFB58:
	ldrh	r3, [r0, #8]
	mov	r0, #192
	lsl	r0, r0, #5
	and	r0, r3
	@ sp needed
	bx	lr
.LFE58:
	.size	SPI_GetTransmissionFIFOStatus, .-SPI_GetTransmissionFIFOStatus
	.section	.text.SPI_GetReceptionFIFOStatus,"ax",%progbits
	.align	2
	.global	SPI_GetReceptionFIFOStatus
	.code	16
	.thumb_func
	.type	SPI_GetReceptionFIFOStatus, %function
SPI_GetReceptionFIFOStatus:
.LFB59:
	ldrh	r3, [r0, #8]
	mov	r0, #192
	lsl	r0, r0, #3
	and	r0, r3
	@ sp needed
	bx	lr
.LFE59:
	.size	SPI_GetReceptionFIFOStatus, .-SPI_GetReceptionFIFOStatus
	.section	.text.SPI_I2S_GetFlagStatus,"ax",%progbits
	.align	2
	.global	SPI_I2S_GetFlagStatus
	.code	16
	.thumb_func
	.type	SPI_I2S_GetFlagStatus, %function
SPI_I2S_GetFlagStatus:
.LFB60:
	ldrh	r0, [r0, #8]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE60:
	.size	SPI_I2S_GetFlagStatus, .-SPI_I2S_GetFlagStatus
	.section	.text.SPI_I2S_ClearFlag,"ax",%progbits
	.align	2
	.global	SPI_I2S_ClearFlag
	.code	16
	.thumb_func
	.type	SPI_I2S_ClearFlag, %function
SPI_I2S_ClearFlag:
.LFB61:
	mvn	r1, r1
	uxth	r1, r1
	strh	r1, [r0, #8]
	@ sp needed
	bx	lr
.LFE61:
	.size	SPI_I2S_ClearFlag, .-SPI_I2S_ClearFlag
	.section	.text.SPI_I2S_GetITStatus,"ax",%progbits
	.align	2
	.global	SPI_I2S_GetITStatus
	.code	16
	.thumb_func
	.type	SPI_I2S_GetITStatus, %function
SPI_I2S_GetITStatus:
.LFB62:
	push	{r4, r5, lr}
.LCFI4:
	ldrh	r3, [r0, #4]
	uxth	r5, r3
	ldrh	r2, [r0, #8]
	mov	r3, #15
	and	r3, r1
	mov	r4, #1
	lsl	r4, r4, r3
	mov	r0, #0
	tst	r2, r4
	beq	.L85
	lsr	r1, r1, #4
	mov	r3, #1
	lsl	r3, r3, r1
	and	r5, r3
	sub	r3, r5, #1
	sbc	r5, r5, r3
	uxtb	r0, r5
.L85:
	@ sp needed
	pop	{r4, r5, pc}
.LFE62:
	.size	SPI_I2S_GetITStatus, .-SPI_I2S_GetITStatus
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
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI1-.LFB34
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
	.4byte	.LCFI2-.LFB36
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
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x38
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
	.byte	0x4
	.4byte	.LCFI4-.LFB62
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE60:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_spi.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x245
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x1
	.4byte	.LASF32
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0xa4
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0xc1
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x126
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x14a
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x1b1
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x1cf
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1e8
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x20d
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x228
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x23e
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x25a
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x275
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x292
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x2c8
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x2dc
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x2e9
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2f9
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x34a
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x360
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x377
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x389
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x3a3
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x3c9
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x3ee
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x457
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x47b
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x48a
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x4a1
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x4c4
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x4dc
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x10c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF19:
	.ascii	"SPI_CalculateCRC\000"
.LASF1:
	.ascii	"SPI_StructInit\000"
.LASF21:
	.ascii	"SPI_GetCRC\000"
.LASF27:
	.ascii	"SPI_GetReceptionFIFOStatus\000"
.LASF2:
	.ascii	"SPI_Init\000"
.LASF12:
	.ascii	"SPI_SSOutputCmd\000"
.LASF9:
	.ascii	"SPI_RxFIFOThresholdConfig\000"
.LASF5:
	.ascii	"SPI_Cmd\000"
.LASF6:
	.ascii	"SPI_TIModeCmd\000"
.LASF24:
	.ascii	"SPI_LastDMATransferCmd\000"
.LASF32:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_spi.c\000"
.LASF0:
	.ascii	"SPI_I2S_DeInit\000"
.LASF8:
	.ascii	"SPI_DataSizeConfig\000"
.LASF7:
	.ascii	"I2S_Cmd\000"
.LASF22:
	.ascii	"SPI_GetCRCPolynomial\000"
.LASF28:
	.ascii	"SPI_I2S_GetFlagStatus\000"
.LASF31:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF15:
	.ascii	"SPI_I2S_SendData16\000"
.LASF11:
	.ascii	"SPI_NSSInternalSoftwareConfig\000"
.LASF18:
	.ascii	"SPI_CRCLengthConfig\000"
.LASF3:
	.ascii	"I2S_StructInit\000"
.LASF14:
	.ascii	"SPI_SendData8\000"
.LASF10:
	.ascii	"SPI_BiDirectionalLineConfig\000"
.LASF17:
	.ascii	"SPI_I2S_ReceiveData16\000"
.LASF16:
	.ascii	"SPI_ReceiveData8\000"
.LASF30:
	.ascii	"SPI_I2S_GetITStatus\000"
.LASF20:
	.ascii	"SPI_TransmitCRC\000"
.LASF26:
	.ascii	"SPI_GetTransmissionFIFOStatus\000"
.LASF29:
	.ascii	"SPI_I2S_ClearFlag\000"
.LASF4:
	.ascii	"I2S_Init\000"
.LASF25:
	.ascii	"SPI_I2S_ITConfig\000"
.LASF23:
	.ascii	"SPI_I2S_DMACmd\000"
.LASF13:
	.ascii	"SPI_NSSPulseModeCmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
