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
	.file	"stm32f0xx_i2c.c"
	.text
.Ltext0:
	.section	.text.I2C_DeInit,"ax",%progbits
	.align	2
	.global	I2C_DeInit
	.code	16
	.thumb_func
	.type	I2C_DeInit, %function
I2C_DeInit:
.LFB32:
	push	{r4, lr}
.LCFI0:
	ldr	r3, .L4
	cmp	r0, r3
	bne	.L2
	mov	r4, #128
	lsl	r4, r4, #14
	mov	r0, r4
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
	mov	r0, r4
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
	b	.L1
.L2:
	mov	r4, #128
	lsl	r4, r4, #15
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
	.word	1073763328
.LFE32:
	.size	I2C_DeInit, .-I2C_DeInit
	.section	.text.I2C_Init,"ax",%progbits
	.align	2
	.global	I2C_Init
	.code	16
	.thumb_func
	.type	I2C_Init, %function
I2C_Init:
.LFB33:
	push	{r4, r5, lr}
.LCFI1:
	ldr	r2, [r0]
	mov	r3, #1
	bic	r2, r3
	str	r2, [r0]
	ldr	r4, [r0]
	ldr	r2, .L7
	and	r2, r4
	ldr	r5, [r1, #8]
	lsl	r4, r5, #8
	orr	r2, r4
	ldr	r4, [r1, #4]
	orr	r2, r4
	str	r2, [r0]
	ldr	r2, .L7+4
	ldr	r5, [r1]
	and	r2, r5
	str	r2, [r0, #16]
	ldr	r2, [r0]
	orr	r3, r2
	str	r3, [r0]
	mov	r3, #0
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	ldr	r3, [r1, #16]
	ldr	r2, [r1, #24]
	orr	r3, r2
	str	r3, [r0, #8]
	ldr	r2, [r0, #8]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #8]
	ldr	r3, [r0]
	ldr	r4, [r1, #12]
	orr	r3, r4
	str	r3, [r0]
	ldr	r2, [r0, #4]
	ldr	r3, .L7+8
	and	r3, r2
	ldr	r2, [r1, #20]
	orr	r3, r2
	str	r3, [r0, #4]
	@ sp needed
	pop	{r4, r5, pc}
.L8:
	.align	2
.L7:
	.word	13623551
	.word	-251658241
	.word	134184959
.LFE33:
	.size	I2C_Init, .-I2C_Init
	.section	.text.I2C_StructInit,"ax",%progbits
	.align	2
	.global	I2C_StructInit
	.code	16
	.thumb_func
	.type	I2C_StructInit, %function
I2C_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	mov	r2, #128
	lsl	r2, r2, #8
	str	r2, [r0, #20]
	str	r3, [r0, #24]
	@ sp needed
	bx	lr
.LFE34:
	.size	I2C_StructInit, .-I2C_StructInit
	.section	.text.I2C_Cmd,"ax",%progbits
	.align	2
	.global	I2C_Cmd
	.code	16
	.thumb_func
	.type	I2C_Cmd, %function
I2C_Cmd:
.LFB35:
	cmp	r1, #0
	beq	.L11
	ldr	r2, [r0]
	mov	r3, #1
	orr	r3, r2
	str	r3, [r0]
	b	.L10
.L11:
	ldr	r3, [r0]
	mov	r2, #1
	bic	r3, r2
	str	r3, [r0]
.L10:
	@ sp needed
	bx	lr
.LFE35:
	.size	I2C_Cmd, .-I2C_Cmd
	.section	.text.I2C_SoftwareResetCmd,"ax",%progbits
	.align	2
	.global	I2C_SoftwareResetCmd
	.code	16
	.thumb_func
	.type	I2C_SoftwareResetCmd, %function
I2C_SoftwareResetCmd:
.LFB36:
	cmp	r1, #0
	beq	.L14
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	str	r3, [r0]
	b	.L13
.L14:
	ldr	r2, [r0]
	ldr	r3, .L16
	and	r3, r2
	str	r3, [r0]
.L13:
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	-8193
.LFE36:
	.size	I2C_SoftwareResetCmd, .-I2C_SoftwareResetCmd
	.section	.text.I2C_ITConfig,"ax",%progbits
	.align	2
	.global	I2C_ITConfig
	.code	16
	.thumb_func
	.type	I2C_ITConfig, %function
I2C_ITConfig:
.LFB37:
	cmp	r2, #0
	beq	.L19
	ldr	r3, [r0]
	orr	r1, r3
	str	r1, [r0]
	b	.L18
.L19:
	ldr	r3, [r0]
	bic	r3, r1
	str	r3, [r0]
.L18:
	@ sp needed
	bx	lr
.LFE37:
	.size	I2C_ITConfig, .-I2C_ITConfig
	.section	.text.I2C_StretchClockCmd,"ax",%progbits
	.align	2
	.global	I2C_StretchClockCmd
	.code	16
	.thumb_func
	.type	I2C_StretchClockCmd, %function
I2C_StretchClockCmd:
.LFB38:
	cmp	r1, #0
	beq	.L22
	ldr	r2, [r0]
	ldr	r3, .L24
	and	r3, r2
	str	r3, [r0]
	b	.L21
.L22:
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #10
	orr	r3, r2
	str	r3, [r0]
.L21:
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	-131073
.LFE38:
	.size	I2C_StretchClockCmd, .-I2C_StretchClockCmd
	.section	.text.I2C_StopModeCmd,"ax",%progbits
	.align	2
	.global	I2C_StopModeCmd
	.code	16
	.thumb_func
	.type	I2C_StopModeCmd, %function
I2C_StopModeCmd:
.LFB39:
	cmp	r1, #0
	beq	.L27
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #11
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
	.word	-262145
.LFE39:
	.size	I2C_StopModeCmd, .-I2C_StopModeCmd
	.section	.text.I2C_DualAddressCmd,"ax",%progbits
	.align	2
	.global	I2C_DualAddressCmd
	.code	16
	.thumb_func
	.type	I2C_DualAddressCmd, %function
I2C_DualAddressCmd:
.LFB40:
	cmp	r1, #0
	beq	.L32
	ldr	r2, [r0, #12]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #12]
	b	.L31
.L32:
	ldr	r2, [r0, #12]
	ldr	r3, .L34
	and	r3, r2
	str	r3, [r0, #12]
.L31:
	@ sp needed
	bx	lr
.L35:
	.align	2
.L34:
	.word	-32769
.LFE40:
	.size	I2C_DualAddressCmd, .-I2C_DualAddressCmd
	.section	.text.I2C_OwnAddress2Config,"ax",%progbits
	.align	2
	.global	I2C_OwnAddress2Config
	.code	16
	.thumb_func
	.type	I2C_OwnAddress2Config, %function
I2C_OwnAddress2Config:
.LFB41:
	push	{r4, lr}
.LCFI2:
	ldr	r4, [r0, #12]
	ldr	r3, .L37
	and	r3, r4
	mov	r4, #254
	and	r1, r4
	lsl	r2, r2, #8
	mov	r4, #224
	lsl	r4, r4, #3
	and	r2, r4
	orr	r1, r2
	orr	r1, r3
	str	r1, [r0, #12]
	@ sp needed
	pop	{r4, pc}
.L38:
	.align	2
.L37:
	.word	-2047
.LFE41:
	.size	I2C_OwnAddress2Config, .-I2C_OwnAddress2Config
	.section	.text.I2C_GeneralCallCmd,"ax",%progbits
	.align	2
	.global	I2C_GeneralCallCmd
	.code	16
	.thumb_func
	.type	I2C_GeneralCallCmd, %function
I2C_GeneralCallCmd:
.LFB42:
	cmp	r1, #0
	beq	.L40
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #12
	orr	r3, r2
	str	r3, [r0]
	b	.L39
.L40:
	ldr	r2, [r0]
	ldr	r3, .L42
	and	r3, r2
	str	r3, [r0]
.L39:
	@ sp needed
	bx	lr
.L43:
	.align	2
.L42:
	.word	-524289
.LFE42:
	.size	I2C_GeneralCallCmd, .-I2C_GeneralCallCmd
	.section	.text.I2C_SlaveByteControlCmd,"ax",%progbits
	.align	2
	.global	I2C_SlaveByteControlCmd
	.code	16
	.thumb_func
	.type	I2C_SlaveByteControlCmd, %function
I2C_SlaveByteControlCmd:
.LFB43:
	cmp	r1, #0
	beq	.L45
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #9
	orr	r3, r2
	str	r3, [r0]
	b	.L44
.L45:
	ldr	r2, [r0]
	ldr	r3, .L47
	and	r3, r2
	str	r3, [r0]
.L44:
	@ sp needed
	bx	lr
.L48:
	.align	2
.L47:
	.word	-65537
.LFE43:
	.size	I2C_SlaveByteControlCmd, .-I2C_SlaveByteControlCmd
	.section	.text.I2C_SlaveAddressConfig,"ax",%progbits
	.align	2
	.global	I2C_SlaveAddressConfig
	.code	16
	.thumb_func
	.type	I2C_SlaveAddressConfig, %function
I2C_SlaveAddressConfig:
.LFB44:
	ldr	r3, [r0, #4]
	lsr	r3, r3, #10
	lsl	r3, r3, #10
	lsl	r1, r1, #22
	lsr	r1, r1, #22
	orr	r1, r3
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.LFE44:
	.size	I2C_SlaveAddressConfig, .-I2C_SlaveAddressConfig
	.section	.text.I2C_10BitAddressingModeCmd,"ax",%progbits
	.align	2
	.global	I2C_10BitAddressingModeCmd
	.code	16
	.thumb_func
	.type	I2C_10BitAddressingModeCmd, %function
I2C_10BitAddressingModeCmd:
.LFB45:
	cmp	r1, #0
	beq	.L51
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #4
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L50
.L51:
	ldr	r2, [r0, #4]
	ldr	r3, .L53
	and	r3, r2
	str	r3, [r0, #4]
.L50:
	@ sp needed
	bx	lr
.L54:
	.align	2
.L53:
	.word	-2049
.LFE45:
	.size	I2C_10BitAddressingModeCmd, .-I2C_10BitAddressingModeCmd
	.section	.text.I2C_AutoEndCmd,"ax",%progbits
	.align	2
	.global	I2C_AutoEndCmd
	.code	16
	.thumb_func
	.type	I2C_AutoEndCmd, %function
I2C_AutoEndCmd:
.LFB46:
	cmp	r1, #0
	beq	.L56
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #18
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L55
.L56:
	ldr	r2, [r0, #4]
	ldr	r3, .L58
	and	r3, r2
	str	r3, [r0, #4]
.L55:
	@ sp needed
	bx	lr
.L59:
	.align	2
.L58:
	.word	-33554433
.LFE46:
	.size	I2C_AutoEndCmd, .-I2C_AutoEndCmd
	.section	.text.I2C_ReloadCmd,"ax",%progbits
	.align	2
	.global	I2C_ReloadCmd
	.code	16
	.thumb_func
	.type	I2C_ReloadCmd, %function
I2C_ReloadCmd:
.LFB47:
	cmp	r1, #0
	beq	.L61
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #17
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L60
.L61:
	ldr	r2, [r0, #4]
	ldr	r3, .L63
	and	r3, r2
	str	r3, [r0, #4]
.L60:
	@ sp needed
	bx	lr
.L64:
	.align	2
.L63:
	.word	-16777217
.LFE47:
	.size	I2C_ReloadCmd, .-I2C_ReloadCmd
	.section	.text.I2C_NumberOfBytesConfig,"ax",%progbits
	.align	2
	.global	I2C_NumberOfBytesConfig
	.code	16
	.thumb_func
	.type	I2C_NumberOfBytesConfig, %function
I2C_NumberOfBytesConfig:
.LFB48:
	ldr	r2, [r0, #4]
	ldr	r3, .L66
	and	r3, r2
	lsl	r1, r1, #16
	orr	r1, r3
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.L67:
	.align	2
.L66:
	.word	-16711681
.LFE48:
	.size	I2C_NumberOfBytesConfig, .-I2C_NumberOfBytesConfig
	.section	.text.I2C_MasterRequestConfig,"ax",%progbits
	.align	2
	.global	I2C_MasterRequestConfig
	.code	16
	.thumb_func
	.type	I2C_MasterRequestConfig, %function
I2C_MasterRequestConfig:
.LFB49:
	cmp	r1, #0
	bne	.L69
	ldr	r2, [r0, #4]
	ldr	r3, .L71
	and	r3, r2
	str	r3, [r0, #4]
	b	.L68
.L69:
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #3
	orr	r3, r2
	str	r3, [r0, #4]
.L68:
	@ sp needed
	bx	lr
.L72:
	.align	2
.L71:
	.word	-1025
.LFE49:
	.size	I2C_MasterRequestConfig, .-I2C_MasterRequestConfig
	.section	.text.I2C_GenerateSTART,"ax",%progbits
	.align	2
	.global	I2C_GenerateSTART
	.code	16
	.thumb_func
	.type	I2C_GenerateSTART, %function
I2C_GenerateSTART:
.LFB50:
	cmp	r1, #0
	beq	.L74
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L73
.L74:
	ldr	r2, [r0, #4]
	ldr	r3, .L76
	and	r3, r2
	str	r3, [r0, #4]
.L73:
	@ sp needed
	bx	lr
.L77:
	.align	2
.L76:
	.word	-8193
.LFE50:
	.size	I2C_GenerateSTART, .-I2C_GenerateSTART
	.section	.text.I2C_GenerateSTOP,"ax",%progbits
	.align	2
	.global	I2C_GenerateSTOP
	.code	16
	.thumb_func
	.type	I2C_GenerateSTOP, %function
I2C_GenerateSTOP:
.LFB51:
	cmp	r1, #0
	beq	.L79
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L78
.L79:
	ldr	r2, [r0, #4]
	ldr	r3, .L81
	and	r3, r2
	str	r3, [r0, #4]
.L78:
	@ sp needed
	bx	lr
.L82:
	.align	2
.L81:
	.word	-16385
.LFE51:
	.size	I2C_GenerateSTOP, .-I2C_GenerateSTOP
	.section	.text.I2C_10BitAddressHeaderCmd,"ax",%progbits
	.align	2
	.global	I2C_10BitAddressHeaderCmd
	.code	16
	.thumb_func
	.type	I2C_10BitAddressHeaderCmd, %function
I2C_10BitAddressHeaderCmd:
.LFB52:
	cmp	r1, #0
	beq	.L84
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	str	r3, [r0, #4]
	b	.L83
.L84:
	ldr	r2, [r0, #4]
	ldr	r3, .L86
	and	r3, r2
	str	r3, [r0, #4]
.L83:
	@ sp needed
	bx	lr
.L87:
	.align	2
.L86:
	.word	-4097
.LFE52:
	.size	I2C_10BitAddressHeaderCmd, .-I2C_10BitAddressHeaderCmd
	.section	.text.I2C_AcknowledgeConfig,"ax",%progbits
	.align	2
	.global	I2C_AcknowledgeConfig
	.code	16
	.thumb_func
	.type	I2C_AcknowledgeConfig, %function
I2C_AcknowledgeConfig:
.LFB53:
	cmp	r1, #0
	beq	.L89
	ldr	r2, [r0, #4]
	ldr	r3, .L91
	and	r3, r2
	str	r3, [r0, #4]
	b	.L88
.L89:
	ldr	r2, [r0, #4]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #4]
.L88:
	@ sp needed
	bx	lr
.L92:
	.align	2
.L91:
	.word	-32769
.LFE53:
	.size	I2C_AcknowledgeConfig, .-I2C_AcknowledgeConfig
	.section	.text.I2C_GetAddressMatched,"ax",%progbits
	.align	2
	.global	I2C_GetAddressMatched
	.code	16
	.thumb_func
	.type	I2C_GetAddressMatched, %function
I2C_GetAddressMatched:
.LFB54:
	ldr	r3, [r0, #24]
	mov	r0, #254
	lsl	r0, r0, #16
	and	r0, r3
	lsr	r0, r0, #16
	@ sp needed
	bx	lr
.LFE54:
	.size	I2C_GetAddressMatched, .-I2C_GetAddressMatched
	.section	.text.I2C_GetTransferDirection,"ax",%progbits
	.align	2
	.global	I2C_GetTransferDirection
	.code	16
	.thumb_func
	.type	I2C_GetTransferDirection, %function
I2C_GetTransferDirection:
.LFB55:
	ldr	r0, [r0, #24]
	lsl	r0, r0, #15
	lsr	r0, r0, #31
	lsl	r0, r0, #10
	@ sp needed
	bx	lr
.LFE55:
	.size	I2C_GetTransferDirection, .-I2C_GetTransferDirection
	.section	.text.I2C_TransferHandling,"ax",%progbits
	.align	2
	.global	I2C_TransferHandling
	.code	16
	.thumb_func
	.type	I2C_TransferHandling, %function
I2C_TransferHandling:
.LFB56:
	push	{r4, r5, lr}
.LCFI3:
	ldr	r5, [r0, #4]
	ldr	r4, .L98
	and	r4, r5
	ldr	r5, [sp, #12]
	orr	r4, r5
	orr	r3, r4
	lsl	r1, r1, #22
	lsr	r4, r1, #22
	mov	r1, r3
	orr	r1, r4
	lsl	r4, r2, #16
	mov	r2, r1
	orr	r2, r4
	str	r2, [r0, #4]
	@ sp needed
	pop	{r4, r5, pc}
.L99:
	.align	2
.L98:
	.word	-67069952
.LFE56:
	.size	I2C_TransferHandling, .-I2C_TransferHandling
	.section	.text.I2C_SMBusAlertCmd,"ax",%progbits
	.align	2
	.global	I2C_SMBusAlertCmd
	.code	16
	.thumb_func
	.type	I2C_SMBusAlertCmd, %function
I2C_SMBusAlertCmd:
.LFB57:
	cmp	r1, #0
	beq	.L101
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #15
	orr	r3, r2
	str	r3, [r0]
	b	.L100
.L101:
	ldr	r2, [r0]
	ldr	r3, .L103
	and	r3, r2
	str	r3, [r0]
.L100:
	@ sp needed
	bx	lr
.L104:
	.align	2
.L103:
	.word	-4194305
.LFE57:
	.size	I2C_SMBusAlertCmd, .-I2C_SMBusAlertCmd
	.section	.text.I2C_ClockTimeoutCmd,"ax",%progbits
	.align	2
	.global	I2C_ClockTimeoutCmd
	.code	16
	.thumb_func
	.type	I2C_ClockTimeoutCmd, %function
I2C_ClockTimeoutCmd:
.LFB58:
	cmp	r1, #0
	beq	.L106
	ldr	r2, [r0, #20]
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #20]
	b	.L105
.L106:
	ldr	r2, [r0, #20]
	ldr	r3, .L108
	and	r3, r2
	str	r3, [r0, #20]
.L105:
	@ sp needed
	bx	lr
.L109:
	.align	2
.L108:
	.word	-32769
.LFE58:
	.size	I2C_ClockTimeoutCmd, .-I2C_ClockTimeoutCmd
	.section	.text.I2C_ExtendedClockTimeoutCmd,"ax",%progbits
	.align	2
	.global	I2C_ExtendedClockTimeoutCmd
	.code	16
	.thumb_func
	.type	I2C_ExtendedClockTimeoutCmd, %function
I2C_ExtendedClockTimeoutCmd:
.LFB59:
	cmp	r1, #0
	beq	.L111
	ldr	r2, [r0, #20]
	mov	r3, #128
	lsl	r3, r3, #24
	orr	r3, r2
	str	r3, [r0, #20]
	b	.L110
.L111:
	ldr	r3, [r0, #20]
	lsl	r3, r3, #1
	lsr	r3, r3, #1
	str	r3, [r0, #20]
.L110:
	@ sp needed
	bx	lr
.LFE59:
	.size	I2C_ExtendedClockTimeoutCmd, .-I2C_ExtendedClockTimeoutCmd
	.section	.text.I2C_IdleClockTimeoutCmd,"ax",%progbits
	.align	2
	.global	I2C_IdleClockTimeoutCmd
	.code	16
	.thumb_func
	.type	I2C_IdleClockTimeoutCmd, %function
I2C_IdleClockTimeoutCmd:
.LFB60:
	cmp	r1, #0
	beq	.L114
	ldr	r2, [r0, #20]
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	str	r3, [r0, #20]
	b	.L113
.L114:
	ldr	r2, [r0, #20]
	ldr	r3, .L116
	and	r3, r2
	str	r3, [r0, #20]
.L113:
	@ sp needed
	bx	lr
.L117:
	.align	2
.L116:
	.word	-4097
.LFE60:
	.size	I2C_IdleClockTimeoutCmd, .-I2C_IdleClockTimeoutCmd
	.section	.text.I2C_TimeoutAConfig,"ax",%progbits
	.align	2
	.global	I2C_TimeoutAConfig
	.code	16
	.thumb_func
	.type	I2C_TimeoutAConfig, %function
I2C_TimeoutAConfig:
.LFB61:
	ldr	r3, [r0, #20]
	lsr	r3, r3, #12
	lsl	r3, r3, #12
	lsl	r1, r1, #20
	lsr	r1, r1, #20
	orr	r1, r3
	str	r1, [r0, #20]
	@ sp needed
	bx	lr
.LFE61:
	.size	I2C_TimeoutAConfig, .-I2C_TimeoutAConfig
	.section	.text.I2C_TimeoutBConfig,"ax",%progbits
	.align	2
	.global	I2C_TimeoutBConfig
	.code	16
	.thumb_func
	.type	I2C_TimeoutBConfig, %function
I2C_TimeoutBConfig:
.LFB62:
	ldr	r2, [r0, #20]
	ldr	r3, .L120
	and	r3, r2
	lsl	r1, r1, #16
	ldr	r2, .L120+4
	and	r1, r2
	orr	r1, r3
	str	r1, [r0, #20]
	@ sp needed
	bx	lr
.L121:
	.align	2
.L120:
	.word	-268369921
	.word	268369920
.LFE62:
	.size	I2C_TimeoutBConfig, .-I2C_TimeoutBConfig
	.section	.text.I2C_CalculatePEC,"ax",%progbits
	.align	2
	.global	I2C_CalculatePEC
	.code	16
	.thumb_func
	.type	I2C_CalculatePEC, %function
I2C_CalculatePEC:
.LFB63:
	cmp	r1, #0
	beq	.L123
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #16
	orr	r3, r2
	str	r3, [r0]
	b	.L122
.L123:
	ldr	r2, [r0]
	ldr	r3, .L125
	and	r3, r2
	str	r3, [r0]
.L122:
	@ sp needed
	bx	lr
.L126:
	.align	2
.L125:
	.word	-8388609
.LFE63:
	.size	I2C_CalculatePEC, .-I2C_CalculatePEC
	.section	.text.I2C_PECRequestCmd,"ax",%progbits
	.align	2
	.global	I2C_PECRequestCmd
	.code	16
	.thumb_func
	.type	I2C_PECRequestCmd, %function
I2C_PECRequestCmd:
.LFB64:
	cmp	r1, #0
	beq	.L128
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #19
	orr	r3, r2
	str	r3, [r0]
	b	.L127
.L128:
	ldr	r2, [r0]
	ldr	r3, .L130
	and	r3, r2
	str	r3, [r0]
.L127:
	@ sp needed
	bx	lr
.L131:
	.align	2
.L130:
	.word	-67108865
.LFE64:
	.size	I2C_PECRequestCmd, .-I2C_PECRequestCmd
	.section	.text.I2C_GetPEC,"ax",%progbits
	.align	2
	.global	I2C_GetPEC
	.code	16
	.thumb_func
	.type	I2C_GetPEC, %function
I2C_GetPEC:
.LFB65:
	ldr	r0, [r0, #32]
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE65:
	.size	I2C_GetPEC, .-I2C_GetPEC
	.section	.text.I2C_ReadRegister,"ax",%progbits
	.align	2
	.global	I2C_ReadRegister
	.code	16
	.thumb_func
	.type	I2C_ReadRegister, %function
I2C_ReadRegister:
.LFB66:
	sub	sp, sp, #8
.LCFI4:
	mov	r3, #0
	str	r3, [sp, #4]
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	add	r1, r1, r3
	str	r1, [sp, #4]
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.LFE66:
	.size	I2C_ReadRegister, .-I2C_ReadRegister
	.section	.text.I2C_SendData,"ax",%progbits
	.align	2
	.global	I2C_SendData
	.code	16
	.thumb_func
	.type	I2C_SendData, %function
I2C_SendData:
.LFB67:
	str	r1, [r0, #40]
	@ sp needed
	bx	lr
.LFE67:
	.size	I2C_SendData, .-I2C_SendData
	.section	.text.I2C_ReceiveData,"ax",%progbits
	.align	2
	.global	I2C_ReceiveData
	.code	16
	.thumb_func
	.type	I2C_ReceiveData, %function
I2C_ReceiveData:
.LFB68:
	ldr	r0, [r0, #36]
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE68:
	.size	I2C_ReceiveData, .-I2C_ReceiveData
	.section	.text.I2C_DMACmd,"ax",%progbits
	.align	2
	.global	I2C_DMACmd
	.code	16
	.thumb_func
	.type	I2C_DMACmd, %function
I2C_DMACmd:
.LFB69:
	cmp	r2, #0
	beq	.L137
	ldr	r3, [r0]
	orr	r1, r3
	str	r1, [r0]
	b	.L136
.L137:
	ldr	r3, [r0]
	bic	r3, r1
	str	r3, [r0]
.L136:
	@ sp needed
	bx	lr
.LFE69:
	.size	I2C_DMACmd, .-I2C_DMACmd
	.section	.text.I2C_GetFlagStatus,"ax",%progbits
	.align	2
	.global	I2C_GetFlagStatus
	.code	16
	.thumb_func
	.type	I2C_GetFlagStatus, %function
I2C_GetFlagStatus:
.LFB70:
	ldr	r0, [r0, #24]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE70:
	.size	I2C_GetFlagStatus, .-I2C_GetFlagStatus
	.section	.text.I2C_ClearFlag,"ax",%progbits
	.align	2
	.global	I2C_ClearFlag
	.code	16
	.thumb_func
	.type	I2C_ClearFlag, %function
I2C_ClearFlag:
.LFB71:
	str	r1, [r0, #28]
	@ sp needed
	bx	lr
.LFE71:
	.size	I2C_ClearFlag, .-I2C_ClearFlag
	.section	.text.I2C_GetITStatus,"ax",%progbits
	.align	2
	.global	I2C_GetITStatus
	.code	16
	.thumb_func
	.type	I2C_GetITStatus, %function
I2C_GetITStatus:
.LFB72:
	ldr	r0, [r0, #24]
	and	r0, r1
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE72:
	.size	I2C_GetITStatus, .-I2C_GetITStatus
	.section	.text.I2C_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	I2C_ClearITPendingBit
	.code	16
	.thumb_func
	.type	I2C_ClearITPendingBit, %function
I2C_ClearITPendingBit:
.LFB73:
	str	r1, [r0, #28]
	@ sp needed
	bx	lr
.LFE73:
	.size	I2C_ClearITPendingBit, .-I2C_ClearITPendingBit
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
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
	.byte	0x4
	.4byte	.LCFI2-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.byte	0x4
	.4byte	.LCFI3-.LFB56
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.byte	0x4
	.4byte	.LCFI4-.LFB66
	.byte	0xe
	.uleb128 0x8
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
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_i2c.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x30b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x1
	.4byte	.LASF43
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x8f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0xac
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0xfb
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x12d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x14e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x168
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x181
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x19a
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x1bc
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x1da
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x1f3
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x20c
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x229
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x26a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x283
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x29b
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x2b8
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x2d2
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x2eb
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x306
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x31f
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x336
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x344
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x370
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x3b7
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x3e9
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x403
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x41c
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x437
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x453
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x46c
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x483
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x4b1
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4dc
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x4ea
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x515
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x58d
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x5b9
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x5d7
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x603
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
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
	.4byte	0x164
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF26:
	.ascii	"I2C_ClockTimeoutCmd\000"
.LASF32:
	.ascii	"I2C_PECRequestCmd\000"
.LASF6:
	.ascii	"I2C_StretchClockCmd\000"
.LASF8:
	.ascii	"I2C_DualAddressCmd\000"
.LASF25:
	.ascii	"I2C_SMBusAlertCmd\000"
.LASF38:
	.ascii	"I2C_GetFlagStatus\000"
.LASF24:
	.ascii	"I2C_TransferHandling\000"
.LASF7:
	.ascii	"I2C_StopModeCmd\000"
.LASF23:
	.ascii	"I2C_GetTransferDirection\000"
.LASF36:
	.ascii	"I2C_ReceiveData\000"
.LASF14:
	.ascii	"I2C_AutoEndCmd\000"
.LASF33:
	.ascii	"I2C_GetPEC\000"
.LASF39:
	.ascii	"I2C_ClearFlag\000"
.LASF2:
	.ascii	"I2C_StructInit\000"
.LASF30:
	.ascii	"I2C_TimeoutBConfig\000"
.LASF9:
	.ascii	"I2C_OwnAddress2Config\000"
.LASF20:
	.ascii	"I2C_10BitAddressHeaderCmd\000"
.LASF4:
	.ascii	"I2C_SoftwareResetCmd\000"
.LASF37:
	.ascii	"I2C_DMACmd\000"
.LASF29:
	.ascii	"I2C_TimeoutAConfig\000"
.LASF5:
	.ascii	"I2C_ITConfig\000"
.LASF34:
	.ascii	"I2C_ReadRegister\000"
.LASF31:
	.ascii	"I2C_CalculatePEC\000"
.LASF40:
	.ascii	"I2C_GetITStatus\000"
.LASF10:
	.ascii	"I2C_GeneralCallCmd\000"
.LASF35:
	.ascii	"I2C_SendData\000"
.LASF16:
	.ascii	"I2C_NumberOfBytesConfig\000"
.LASF0:
	.ascii	"I2C_DeInit\000"
.LASF42:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF3:
	.ascii	"I2C_Cmd\000"
.LASF12:
	.ascii	"I2C_SlaveAddressConfig\000"
.LASF18:
	.ascii	"I2C_GenerateSTART\000"
.LASF15:
	.ascii	"I2C_ReloadCmd\000"
.LASF22:
	.ascii	"I2C_GetAddressMatched\000"
.LASF27:
	.ascii	"I2C_ExtendedClockTimeoutCmd\000"
.LASF11:
	.ascii	"I2C_SlaveByteControlCmd\000"
.LASF13:
	.ascii	"I2C_10BitAddressingModeCmd\000"
.LASF21:
	.ascii	"I2C_AcknowledgeConfig\000"
.LASF28:
	.ascii	"I2C_IdleClockTimeoutCmd\000"
.LASF43:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_i2c.c\000"
.LASF17:
	.ascii	"I2C_MasterRequestConfig\000"
.LASF41:
	.ascii	"I2C_ClearITPendingBit\000"
.LASF1:
	.ascii	"I2C_Init\000"
.LASF19:
	.ascii	"I2C_GenerateSTOP\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
