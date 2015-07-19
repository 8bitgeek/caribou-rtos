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
	.file	"stm32f0xx_i2c.c"
	.text
.Ltext0:
	.section	.text.I2C_DeInit,"ax",%progbits
	.align	1
	.global	I2C_DeInit
	.code	16
	.thumb_func
	.type	I2C_DeInit, %function
I2C_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_i2c.c"
	.loc 1 144 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 148 0
	ldr	r3, .L6
	cmp	r0, r3
	bne	.L2
	.loc 1 151 0
	mov	r0, #128
.LVL1:
	lsl	r0, r0, #14
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
.LVL2:
	.loc 1 153 0
	mov	r0, #128
	lsl	r0, r0, #14
	b	.L4
.LVL3:
.L2:
	.loc 1 158 0
	mov	r0, #128
.LVL4:
	lsl	r0, r0, #15
	mov	r1, #1
	bl	RCC_APB1PeriphResetCmd
.LVL5:
	.loc 1 160 0
	mov	r0, #128
	lsl	r0, r0, #15
.L4:
	mov	r1, #0
	bl	RCC_APB1PeriphResetCmd
.LVL6:
	.loc 1 162 0
	@ sp needed
	pop	{r3, pc}
.L7:
	.align	2
.L6:
	.word	1073763328
.LFE32:
	.size	I2C_DeInit, .-I2C_DeInit
	.section	.text.I2C_Init,"ax",%progbits
	.align	1
	.global	I2C_Init
	.code	16
	.thumb_func
	.type	I2C_Init, %function
I2C_Init:
.LFB33:
	.loc 1 173 0
.LVL7:
	.loc 1 186 0
	ldr	r2, [r0]
	mov	r3, #1
	bic	r2, r3
	str	r2, [r0]
	.loc 1 173 0
	push	{r4, r5, lr}
.LCFI1:
	.loc 1 192 0
	ldr	r2, .L9
	.loc 1 190 0
	ldr	r4, [r0]
.LVL8:
	.loc 1 196 0
	ldr	r5, [r1, #8]
	.loc 1 192 0
	and	r2, r4
.LVL9:
	.loc 1 196 0
	lsl	r4, r5, #8
	orr	r2, r4
.LVL10:
	ldr	r4, [r1, #4]
	.loc 1 205 0
	ldr	r5, [r1]
	.loc 1 196 0
	orr	r2, r4
.LVL11:
	.loc 1 199 0
	str	r2, [r0]
	.loc 1 205 0
	ldr	r2, .L9+4
.LVL12:
	.loc 1 232 0
	ldr	r4, [r1, #12]
	.loc 1 205 0
	and	r2, r5
	str	r2, [r0, #16]
.LVL13:
	.loc 1 208 0
	ldr	r2, [r0]
	.loc 1 244 0
	@ sp needed
	.loc 1 208 0
	orr	r3, r2
	str	r3, [r0]
.LVL14:
	.loc 1 214 0
	mov	r3, #0
	str	r3, [r0, #8]
	.loc 1 220 0
	ldr	r2, [r1, #24]
	.loc 1 216 0
	str	r3, [r0, #12]
	.loc 1 220 0
	ldr	r3, [r1, #16]
	orr	r3, r2
.LVL15:
	.loc 1 223 0
	str	r3, [r0, #8]
	.loc 1 225 0
	ldr	r2, [r0, #8]
	mov	r3, #128
.LVL16:
	lsl	r3, r3, #8
	orr	r3, r2
	str	r3, [r0, #8]
.LVL17:
	.loc 1 232 0
	ldr	r3, [r0]
	orr	r3, r4
	str	r3, [r0]
.LVL18:
	.loc 1 236 0
	ldr	r2, [r0, #4]
.LVL19:
	.loc 1 238 0
	ldr	r3, .L9+8
	and	r3, r2
.LVL20:
	.loc 1 241 0
	ldr	r2, [r1, #20]
	orr	r3, r2
.LVL21:
	.loc 1 243 0
	str	r3, [r0, #4]
	.loc 1 244 0
	pop	{r4, r5, pc}
.L10:
	.align	2
.L9:
	.word	13623551
	.word	-251658241
	.word	134184959
.LFE33:
	.size	I2C_Init, .-I2C_Init
	.section	.text.I2C_StructInit,"ax",%progbits
	.align	1
	.global	I2C_StructInit
	.code	16
	.thumb_func
	.type	I2C_StructInit, %function
I2C_StructInit:
.LFB34:
	.loc 1 252 0
.LVL22:
	.loc 1 265 0
	mov	r2, #128
	.loc 1 255 0
	mov	r3, #0
	.loc 1 265 0
	lsl	r2, r2, #8
	.loc 1 255 0
	str	r3, [r0]
	.loc 1 257 0
	str	r3, [r0, #4]
	.loc 1 259 0
	str	r3, [r0, #8]
	.loc 1 261 0
	str	r3, [r0, #12]
	.loc 1 263 0
	str	r3, [r0, #16]
	.loc 1 265 0
	str	r2, [r0, #20]
	.loc 1 267 0
	str	r3, [r0, #24]
	.loc 1 268 0
	@ sp needed
	bx	lr
.LFE34:
	.size	I2C_StructInit, .-I2C_StructInit
	.section	.text.I2C_Cmd,"ax",%progbits
	.align	1
	.global	I2C_Cmd
	.code	16
	.thumb_func
	.type	I2C_Cmd, %function
I2C_Cmd:
.LFB35:
	.loc 1 278 0
.LVL23:
	mov	r3, #1
	.loc 1 285 0
	ldr	r2, [r0]
	.loc 1 282 0
	cmp	r1, #0
	beq	.L13
	.loc 1 285 0
	orr	r3, r2
	b	.L15
.L13:
	.loc 1 290 0
	bic	r2, r3
	mov	r3, r2
.L15:
	str	r3, [r0]
	.loc 1 292 0
	@ sp needed
	bx	lr
.LFE35:
	.size	I2C_Cmd, .-I2C_Cmd
	.section	.text.I2C_SoftwareResetCmd,"ax",%progbits
	.align	1
	.global	I2C_SoftwareResetCmd
	.code	16
	.thumb_func
	.type	I2C_SoftwareResetCmd, %function
I2C_SoftwareResetCmd:
.LFB36:
	.loc 1 302 0
.LVL24:
	.loc 1 309 0
	ldr	r2, [r0]
	.loc 1 306 0
	cmp	r1, #0
	beq	.L17
	.loc 1 309 0
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	b	.L19
.L17:
	.loc 1 314 0
	ldr	r3, .L20
	and	r3, r2
.L19:
	str	r3, [r0]
	.loc 1 316 0
	@ sp needed
	bx	lr
.L21:
	.align	2
.L20:
	.word	-8193
.LFE36:
	.size	I2C_SoftwareResetCmd, .-I2C_SoftwareResetCmd
	.section	.text.I2C_ITConfig,"ax",%progbits
	.align	1
	.global	I2C_ITConfig
	.code	16
	.thumb_func
	.type	I2C_ITConfig, %function
I2C_ITConfig:
.LFB37:
	.loc 1 335 0
.LVL25:
	.loc 1 344 0
	ldr	r3, [r0]
	.loc 1 341 0
	cmp	r2, #0
	beq	.L23
	.loc 1 344 0
	orr	r1, r3
.LVL26:
	str	r1, [r0]
	b	.L22
.LVL27:
.L23:
	.loc 1 349 0
	bic	r3, r1
	str	r3, [r0]
.LVL28:
.L22:
	.loc 1 351 0
	@ sp needed
	bx	lr
.LFE37:
	.size	I2C_ITConfig, .-I2C_ITConfig
	.section	.text.I2C_StretchClockCmd,"ax",%progbits
	.align	1
	.global	I2C_StretchClockCmd
	.code	16
	.thumb_func
	.type	I2C_StretchClockCmd, %function
I2C_StretchClockCmd:
.LFB38:
	.loc 1 361 0
.LVL29:
	.loc 1 369 0
	ldr	r2, [r0]
	.loc 1 366 0
	cmp	r1, #0
	beq	.L26
	.loc 1 369 0
	ldr	r3, .L29
	and	r3, r2
	b	.L28
.L26:
	.loc 1 374 0
	mov	r3, #128
	lsl	r3, r3, #10
	orr	r3, r2
.L28:
	str	r3, [r0]
	.loc 1 376 0
	@ sp needed
	bx	lr
.L30:
	.align	2
.L29:
	.word	-131073
.LFE38:
	.size	I2C_StretchClockCmd, .-I2C_StretchClockCmd
	.section	.text.I2C_StopModeCmd,"ax",%progbits
	.align	1
	.global	I2C_StopModeCmd
	.code	16
	.thumb_func
	.type	I2C_StopModeCmd, %function
I2C_StopModeCmd:
.LFB39:
	.loc 1 386 0
.LVL30:
	.loc 1 394 0
	ldr	r2, [r0]
	.loc 1 391 0
	cmp	r1, #0
	beq	.L32
	.loc 1 394 0
	mov	r3, #128
	lsl	r3, r3, #11
	orr	r3, r2
	b	.L34
.L32:
	.loc 1 399 0
	ldr	r3, .L35
	and	r3, r2
.L34:
	str	r3, [r0]
	.loc 1 401 0
	@ sp needed
	bx	lr
.L36:
	.align	2
.L35:
	.word	-262145
.LFE39:
	.size	I2C_StopModeCmd, .-I2C_StopModeCmd
	.section	.text.I2C_DualAddressCmd,"ax",%progbits
	.align	1
	.global	I2C_DualAddressCmd
	.code	16
	.thumb_func
	.type	I2C_DualAddressCmd, %function
I2C_DualAddressCmd:
.LFB40:
	.loc 1 411 0
.LVL31:
	.loc 1 419 0
	ldr	r2, [r0, #12]
	.loc 1 416 0
	cmp	r1, #0
	beq	.L38
	.loc 1 419 0
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	b	.L40
.L38:
	.loc 1 424 0
	ldr	r3, .L41
	and	r3, r2
.L40:
	str	r3, [r0, #12]
	.loc 1 426 0
	@ sp needed
	bx	lr
.L42:
	.align	2
.L41:
	.word	-32769
.LFE40:
	.size	I2C_DualAddressCmd, .-I2C_DualAddressCmd
	.section	.text.I2C_OwnAddress2Config,"ax",%progbits
	.align	1
	.global	I2C_OwnAddress2Config
	.code	16
	.thumb_func
	.type	I2C_OwnAddress2Config, %function
I2C_OwnAddress2Config:
.LFB41:
	.loc 1 445 0
.LVL32:
	push	{r4, lr}
.LCFI2:
	.loc 1 457 0
	ldr	r3, .L44
	.loc 1 454 0
	ldr	r4, [r0, #12]
.LVL33:
	.loc 1 461 0
	lsl	r2, r2, #8
.LVL34:
	.loc 1 457 0
	and	r3, r4
.LVL35:
	.loc 1 460 0
	mov	r4, #254
	and	r1, r4
.LVL36:
	.loc 1 461 0
	mov	r4, #224
	lsl	r4, r4, #3
	and	r2, r4
	.loc 1 460 0
	orr	r1, r2
	orr	r1, r3
.LVL37:
	.loc 1 464 0
	str	r1, [r0, #12]
	.loc 1 465 0
	@ sp needed
	pop	{r4, pc}
.L45:
	.align	2
.L44:
	.word	-2047
.LFE41:
	.size	I2C_OwnAddress2Config, .-I2C_OwnAddress2Config
	.section	.text.I2C_GeneralCallCmd,"ax",%progbits
	.align	1
	.global	I2C_GeneralCallCmd
	.code	16
	.thumb_func
	.type	I2C_GeneralCallCmd, %function
I2C_GeneralCallCmd:
.LFB42:
	.loc 1 475 0
.LVL38:
	.loc 1 483 0
	ldr	r2, [r0]
	.loc 1 480 0
	cmp	r1, #0
	beq	.L47
	.loc 1 483 0
	mov	r3, #128
	lsl	r3, r3, #12
	orr	r3, r2
	b	.L49
.L47:
	.loc 1 488 0
	ldr	r3, .L50
	and	r3, r2
.L49:
	str	r3, [r0]
	.loc 1 490 0
	@ sp needed
	bx	lr
.L51:
	.align	2
.L50:
	.word	-524289
.LFE42:
	.size	I2C_GeneralCallCmd, .-I2C_GeneralCallCmd
	.section	.text.I2C_SlaveByteControlCmd,"ax",%progbits
	.align	1
	.global	I2C_SlaveByteControlCmd
	.code	16
	.thumb_func
	.type	I2C_SlaveByteControlCmd, %function
I2C_SlaveByteControlCmd:
.LFB43:
	.loc 1 500 0
.LVL39:
	.loc 1 508 0
	ldr	r2, [r0]
	.loc 1 505 0
	cmp	r1, #0
	beq	.L53
	.loc 1 508 0
	mov	r3, #128
	lsl	r3, r3, #9
	orr	r3, r2
	b	.L55
.L53:
	.loc 1 513 0
	ldr	r3, .L56
	and	r3, r2
.L55:
	str	r3, [r0]
	.loc 1 515 0
	@ sp needed
	bx	lr
.L57:
	.align	2
.L56:
	.word	-65537
.LFE43:
	.size	I2C_SlaveByteControlCmd, .-I2C_SlaveByteControlCmd
	.section	.text.I2C_SlaveAddressConfig,"ax",%progbits
	.align	1
	.global	I2C_SlaveAddressConfig
	.code	16
	.thumb_func
	.type	I2C_SlaveAddressConfig, %function
I2C_SlaveAddressConfig:
.LFB44:
	.loc 1 525 0
.LVL40:
	.loc 1 533 0
	ldr	r3, [r0, #4]
.LVL41:
	.loc 1 539 0
	lsl	r1, r1, #22
.LVL42:
	.loc 1 536 0
	lsr	r3, r3, #10
.LVL43:
	lsl	r3, r3, #10
.LVL44:
	.loc 1 539 0
	lsr	r1, r1, #22
	orr	r1, r3
.LVL45:
	.loc 1 542 0
	str	r1, [r0, #4]
	.loc 1 543 0
	@ sp needed
	bx	lr
.LFE44:
	.size	I2C_SlaveAddressConfig, .-I2C_SlaveAddressConfig
	.section	.text.I2C_10BitAddressingModeCmd,"ax",%progbits
	.align	1
	.global	I2C_10BitAddressingModeCmd
	.code	16
	.thumb_func
	.type	I2C_10BitAddressingModeCmd, %function
I2C_10BitAddressingModeCmd:
.LFB45:
	.loc 1 554 0
.LVL46:
	.loc 1 562 0
	ldr	r2, [r0, #4]
	.loc 1 559 0
	cmp	r1, #0
	beq	.L60
	.loc 1 562 0
	mov	r3, #128
	lsl	r3, r3, #4
	orr	r3, r2
	b	.L62
.L60:
	.loc 1 567 0
	ldr	r3, .L63
	and	r3, r2
.L62:
	str	r3, [r0, #4]
	.loc 1 569 0
	@ sp needed
	bx	lr
.L64:
	.align	2
.L63:
	.word	-2049
.LFE45:
	.size	I2C_10BitAddressingModeCmd, .-I2C_10BitAddressingModeCmd
	.section	.text.I2C_AutoEndCmd,"ax",%progbits
	.align	1
	.global	I2C_AutoEndCmd
	.code	16
	.thumb_func
	.type	I2C_AutoEndCmd, %function
I2C_AutoEndCmd:
.LFB46:
	.loc 1 619 0
.LVL47:
	.loc 1 627 0
	ldr	r2, [r0, #4]
	.loc 1 624 0
	cmp	r1, #0
	beq	.L66
	.loc 1 627 0
	mov	r3, #128
	lsl	r3, r3, #18
	orr	r3, r2
	b	.L68
.L66:
	.loc 1 632 0
	ldr	r3, .L69
	and	r3, r2
.L68:
	str	r3, [r0, #4]
	.loc 1 634 0
	@ sp needed
	bx	lr
.L70:
	.align	2
.L69:
	.word	-33554433
.LFE46:
	.size	I2C_AutoEndCmd, .-I2C_AutoEndCmd
	.section	.text.I2C_ReloadCmd,"ax",%progbits
	.align	1
	.global	I2C_ReloadCmd
	.code	16
	.thumb_func
	.type	I2C_ReloadCmd, %function
I2C_ReloadCmd:
.LFB47:
	.loc 1 644 0
.LVL48:
	.loc 1 652 0
	ldr	r2, [r0, #4]
	.loc 1 649 0
	cmp	r1, #0
	beq	.L72
	.loc 1 652 0
	mov	r3, #128
	lsl	r3, r3, #17
	orr	r3, r2
	b	.L74
.L72:
	.loc 1 657 0
	ldr	r3, .L75
	and	r3, r2
.L74:
	str	r3, [r0, #4]
	.loc 1 659 0
	@ sp needed
	bx	lr
.L76:
	.align	2
.L75:
	.word	-16777217
.LFE47:
	.size	I2C_ReloadCmd, .-I2C_ReloadCmd
	.section	.text.I2C_NumberOfBytesConfig,"ax",%progbits
	.align	1
	.global	I2C_NumberOfBytesConfig
	.code	16
	.thumb_func
	.type	I2C_NumberOfBytesConfig, %function
I2C_NumberOfBytesConfig:
.LFB48:
	.loc 1 668 0
.LVL49:
	.loc 1 675 0
	ldr	r2, [r0, #4]
.LVL50:
	.loc 1 678 0
	ldr	r3, .L78
	.loc 1 681 0
	lsl	r1, r1, #16
.LVL51:
	.loc 1 678 0
	and	r3, r2
.LVL52:
	.loc 1 681 0
	orr	r1, r3
.LVL53:
	.loc 1 684 0
	str	r1, [r0, #4]
	.loc 1 685 0
	@ sp needed
	bx	lr
.L79:
	.align	2
.L78:
	.word	-16711681
.LFE48:
	.size	I2C_NumberOfBytesConfig, .-I2C_NumberOfBytesConfig
	.section	.text.I2C_MasterRequestConfig,"ax",%progbits
	.align	1
	.global	I2C_MasterRequestConfig
	.code	16
	.thumb_func
	.type	I2C_MasterRequestConfig, %function
I2C_MasterRequestConfig:
.LFB49:
	.loc 1 697 0
.LVL54:
	.loc 1 706 0
	ldr	r2, [r0, #4]
	.loc 1 703 0
	cmp	r1, #0
	bne	.L81
	.loc 1 706 0
	ldr	r3, .L84
	and	r3, r2
	b	.L83
.L81:
	.loc 1 711 0
	mov	r3, #128
	lsl	r3, r3, #3
	orr	r3, r2
.L83:
	str	r3, [r0, #4]
	.loc 1 713 0
	@ sp needed
	bx	lr
.L85:
	.align	2
.L84:
	.word	-1025
.LFE49:
	.size	I2C_MasterRequestConfig, .-I2C_MasterRequestConfig
	.section	.text.I2C_GenerateSTART,"ax",%progbits
	.align	1
	.global	I2C_GenerateSTART
	.code	16
	.thumb_func
	.type	I2C_GenerateSTART, %function
I2C_GenerateSTART:
.LFB50:
	.loc 1 723 0
.LVL55:
	.loc 1 731 0
	ldr	r2, [r0, #4]
	.loc 1 728 0
	cmp	r1, #0
	beq	.L87
	.loc 1 731 0
	mov	r3, #128
	lsl	r3, r3, #6
	orr	r3, r2
	b	.L89
.L87:
	.loc 1 736 0
	ldr	r3, .L90
	and	r3, r2
.L89:
	str	r3, [r0, #4]
	.loc 1 738 0
	@ sp needed
	bx	lr
.L91:
	.align	2
.L90:
	.word	-8193
.LFE50:
	.size	I2C_GenerateSTART, .-I2C_GenerateSTART
	.section	.text.I2C_GenerateSTOP,"ax",%progbits
	.align	1
	.global	I2C_GenerateSTOP
	.code	16
	.thumb_func
	.type	I2C_GenerateSTOP, %function
I2C_GenerateSTOP:
.LFB51:
	.loc 1 748 0
.LVL56:
	.loc 1 756 0
	ldr	r2, [r0, #4]
	.loc 1 753 0
	cmp	r1, #0
	beq	.L93
	.loc 1 756 0
	mov	r3, #128
	lsl	r3, r3, #7
	orr	r3, r2
	b	.L95
.L93:
	.loc 1 761 0
	ldr	r3, .L96
	and	r3, r2
.L95:
	str	r3, [r0, #4]
	.loc 1 763 0
	@ sp needed
	bx	lr
.L97:
	.align	2
.L96:
	.word	-16385
.LFE51:
	.size	I2C_GenerateSTOP, .-I2C_GenerateSTOP
	.section	.text.I2C_10BitAddressHeaderCmd,"ax",%progbits
	.align	1
	.global	I2C_10BitAddressHeaderCmd
	.code	16
	.thumb_func
	.type	I2C_10BitAddressHeaderCmd, %function
I2C_10BitAddressHeaderCmd:
.LFB52:
	.loc 1 775 0
.LVL57:
	.loc 1 783 0
	ldr	r2, [r0, #4]
	.loc 1 780 0
	cmp	r1, #0
	beq	.L99
	.loc 1 783 0
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	b	.L101
.L99:
	.loc 1 788 0
	ldr	r3, .L102
	and	r3, r2
.L101:
	str	r3, [r0, #4]
	.loc 1 790 0
	@ sp needed
	bx	lr
.L103:
	.align	2
.L102:
	.word	-4097
.LFE52:
	.size	I2C_10BitAddressHeaderCmd, .-I2C_10BitAddressHeaderCmd
	.section	.text.I2C_AcknowledgeConfig,"ax",%progbits
	.align	1
	.global	I2C_AcknowledgeConfig
	.code	16
	.thumb_func
	.type	I2C_AcknowledgeConfig, %function
I2C_AcknowledgeConfig:
.LFB53:
	.loc 1 800 0
.LVL58:
	.loc 1 808 0
	ldr	r2, [r0, #4]
	.loc 1 805 0
	cmp	r1, #0
	beq	.L105
	.loc 1 808 0
	ldr	r3, .L108
	and	r3, r2
	b	.L107
.L105:
	.loc 1 813 0
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
.L107:
	str	r3, [r0, #4]
	.loc 1 815 0
	@ sp needed
	bx	lr
.L109:
	.align	2
.L108:
	.word	-32769
.LFE53:
	.size	I2C_AcknowledgeConfig, .-I2C_AcknowledgeConfig
	.section	.text.I2C_GetAddressMatched,"ax",%progbits
	.align	1
	.global	I2C_GetAddressMatched
	.code	16
	.thumb_func
	.type	I2C_GetAddressMatched, %function
I2C_GetAddressMatched:
.LFB54:
	.loc 1 823 0
.LVL59:
	.loc 1 828 0
	ldr	r3, [r0, #24]
	mov	r0, #254
.LVL60:
	lsl	r0, r0, #16
	and	r0, r3
	lsr	r0, r0, #16
	.loc 1 829 0
	@ sp needed
	bx	lr
.LFE54:
	.size	I2C_GetAddressMatched, .-I2C_GetAddressMatched
	.section	.text.I2C_GetTransferDirection,"ax",%progbits
	.align	1
	.global	I2C_GetTransferDirection
	.code	16
	.thumb_func
	.type	I2C_GetTransferDirection, %function
I2C_GetTransferDirection:
.LFB55:
	.loc 1 837 0
.LVL61:
	.loc 1 845 0
	ldr	r0, [r0, #24]
.LVL62:
	.loc 1 859 0
	@ sp needed
	.loc 1 845 0
	lsl	r0, r0, #15
.LVL63:
	.loc 1 851 0
	lsr	r0, r0, #31
	lsl	r0, r0, #10
.LVL64:
	.loc 1 859 0
	bx	lr
.LFE55:
	.size	I2C_GetTransferDirection, .-I2C_GetTransferDirection
	.section	.text.I2C_TransferHandling,"ax",%progbits
	.align	1
	.global	I2C_TransferHandling
	.code	16
	.thumb_func
	.type	I2C_TransferHandling, %function
I2C_TransferHandling:
.LFB56:
	.loc 1 881 0
.LVL65:
	push	{r4, r5, lr}
.LCFI3:
	.loc 1 891 0
	ldr	r5, [r0, #4]
.LVL66:
	.loc 1 894 0
	ldr	r4, .L115
	.loc 1 897 0
	lsl	r1, r1, #22
.LVL67:
	.loc 1 894 0
	and	r4, r5
.LVL68:
	.loc 1 897 0
	ldr	r5, [sp, #12]
	.loc 1 902 0
	@ sp needed
	.loc 1 897 0
	orr	r4, r5
.LVL69:
	orr	r3, r4
.LVL70:
	lsr	r4, r1, #22
	mov	r1, r3
	orr	r1, r4
	lsl	r4, r2, #16
	mov	r2, r1
.LVL71:
	orr	r2, r4
.LVL72:
	.loc 1 901 0
	str	r2, [r0, #4]
	.loc 1 902 0
	pop	{r4, r5, pc}
.L116:
	.align	2
.L115:
	.word	-67069952
.LFE56:
	.size	I2C_TransferHandling, .-I2C_TransferHandling
	.section	.text.I2C_SMBusAlertCmd,"ax",%progbits
	.align	1
	.global	I2C_SMBusAlertCmd
	.code	16
	.thumb_func
	.type	I2C_SMBusAlertCmd, %function
I2C_SMBusAlertCmd:
.LFB57:
	.loc 1 952 0
.LVL73:
	.loc 1 960 0
	ldr	r2, [r0]
	.loc 1 957 0
	cmp	r1, #0
	beq	.L118
	.loc 1 960 0
	mov	r3, #128
	lsl	r3, r3, #15
	orr	r3, r2
	b	.L120
.L118:
	.loc 1 965 0
	ldr	r3, .L121
	and	r3, r2
.L120:
	str	r3, [r0]
	.loc 1 967 0
	@ sp needed
	bx	lr
.L122:
	.align	2
.L121:
	.word	-4194305
.LFE57:
	.size	I2C_SMBusAlertCmd, .-I2C_SMBusAlertCmd
	.section	.text.I2C_ClockTimeoutCmd,"ax",%progbits
	.align	1
	.global	I2C_ClockTimeoutCmd
	.code	16
	.thumb_func
	.type	I2C_ClockTimeoutCmd, %function
I2C_ClockTimeoutCmd:
.LFB58:
	.loc 1 977 0
.LVL74:
	.loc 1 985 0
	ldr	r2, [r0, #20]
	.loc 1 982 0
	cmp	r1, #0
	beq	.L124
	.loc 1 985 0
	mov	r3, #128
	lsl	r3, r3, #8
	orr	r3, r2
	b	.L126
.L124:
	.loc 1 990 0
	ldr	r3, .L127
	and	r3, r2
.L126:
	str	r3, [r0, #20]
	.loc 1 992 0
	@ sp needed
	bx	lr
.L128:
	.align	2
.L127:
	.word	-32769
.LFE58:
	.size	I2C_ClockTimeoutCmd, .-I2C_ClockTimeoutCmd
	.section	.text.I2C_ExtendedClockTimeoutCmd,"ax",%progbits
	.align	1
	.global	I2C_ExtendedClockTimeoutCmd
	.code	16
	.thumb_func
	.type	I2C_ExtendedClockTimeoutCmd, %function
I2C_ExtendedClockTimeoutCmd:
.LFB59:
	.loc 1 1002 0
.LVL75:
	.loc 1 1007 0
	cmp	r1, #0
	beq	.L130
	.loc 1 1010 0
	ldr	r2, [r0, #20]
	mov	r3, #128
	lsl	r3, r3, #24
	orr	r3, r2
	b	.L132
.L130:
	.loc 1 1015 0
	ldr	r3, [r0, #20]
	lsl	r3, r3, #1
	lsr	r3, r3, #1
.L132:
	str	r3, [r0, #20]
	.loc 1 1017 0
	@ sp needed
	bx	lr
.LFE59:
	.size	I2C_ExtendedClockTimeoutCmd, .-I2C_ExtendedClockTimeoutCmd
	.section	.text.I2C_IdleClockTimeoutCmd,"ax",%progbits
	.align	1
	.global	I2C_IdleClockTimeoutCmd
	.code	16
	.thumb_func
	.type	I2C_IdleClockTimeoutCmd, %function
I2C_IdleClockTimeoutCmd:
.LFB60:
	.loc 1 1028 0
.LVL76:
	.loc 1 1036 0
	ldr	r2, [r0, #20]
	.loc 1 1033 0
	cmp	r1, #0
	beq	.L134
	.loc 1 1036 0
	mov	r3, #128
	lsl	r3, r3, #5
	orr	r3, r2
	b	.L136
.L134:
	.loc 1 1041 0
	ldr	r3, .L137
	and	r3, r2
.L136:
	str	r3, [r0, #20]
	.loc 1 1043 0
	@ sp needed
	bx	lr
.L138:
	.align	2
.L137:
	.word	-4097
.LFE60:
	.size	I2C_IdleClockTimeoutCmd, .-I2C_IdleClockTimeoutCmd
	.section	.text.I2C_TimeoutAConfig,"ax",%progbits
	.align	1
	.global	I2C_TimeoutAConfig
	.code	16
	.thumb_func
	.type	I2C_TimeoutAConfig, %function
I2C_TimeoutAConfig:
.LFB61:
	.loc 1 1053 0
.LVL77:
	.loc 1 1061 0
	ldr	r3, [r0, #20]
.LVL78:
	.loc 1 1067 0
	lsl	r1, r1, #20
.LVL79:
	.loc 1 1064 0
	lsr	r3, r3, #12
.LVL80:
	lsl	r3, r3, #12
.LVL81:
	.loc 1 1067 0
	lsr	r1, r1, #20
	orr	r1, r3
.LVL82:
	.loc 1 1070 0
	str	r1, [r0, #20]
	.loc 1 1071 0
	@ sp needed
	bx	lr
.LFE61:
	.size	I2C_TimeoutAConfig, .-I2C_TimeoutAConfig
	.section	.text.I2C_TimeoutBConfig,"ax",%progbits
	.align	1
	.global	I2C_TimeoutBConfig
	.code	16
	.thumb_func
	.type	I2C_TimeoutBConfig, %function
I2C_TimeoutBConfig:
.LFB62:
	.loc 1 1080 0
.LVL83:
	.loc 1 1088 0
	ldr	r2, [r0, #20]
.LVL84:
	.loc 1 1091 0
	ldr	r3, .L141
	.loc 1 1094 0
	lsl	r1, r1, #16
.LVL85:
	.loc 1 1091 0
	and	r3, r2
.LVL86:
	.loc 1 1094 0
	ldr	r2, .L141+4
	.loc 1 1098 0
	@ sp needed
	.loc 1 1094 0
	and	r1, r2
	orr	r1, r3
.LVL87:
	.loc 1 1097 0
	str	r1, [r0, #20]
	.loc 1 1098 0
	bx	lr
.L142:
	.align	2
.L141:
	.word	-268369921
	.word	268369920
.LFE62:
	.size	I2C_TimeoutBConfig, .-I2C_TimeoutBConfig
	.section	.text.I2C_CalculatePEC,"ax",%progbits
	.align	1
	.global	I2C_CalculatePEC
	.code	16
	.thumb_func
	.type	I2C_CalculatePEC, %function
I2C_CalculatePEC:
.LFB63:
	.loc 1 1108 0
.LVL88:
	.loc 1 1116 0
	ldr	r2, [r0]
	.loc 1 1113 0
	cmp	r1, #0
	beq	.L144
	.loc 1 1116 0
	mov	r3, #128
	lsl	r3, r3, #16
	orr	r3, r2
	b	.L146
.L144:
	.loc 1 1121 0
	ldr	r3, .L147
	and	r3, r2
.L146:
	str	r3, [r0]
	.loc 1 1123 0
	@ sp needed
	bx	lr
.L148:
	.align	2
.L147:
	.word	-8388609
.LFE63:
	.size	I2C_CalculatePEC, .-I2C_CalculatePEC
	.section	.text.I2C_PECRequestCmd,"ax",%progbits
	.align	1
	.global	I2C_PECRequestCmd
	.code	16
	.thumb_func
	.type	I2C_PECRequestCmd, %function
I2C_PECRequestCmd:
.LFB64:
	.loc 1 1133 0
.LVL89:
	.loc 1 1141 0
	ldr	r2, [r0]
	.loc 1 1138 0
	cmp	r1, #0
	beq	.L150
	.loc 1 1141 0
	mov	r3, #128
	lsl	r3, r3, #19
	orr	r3, r2
	b	.L152
.L150:
	.loc 1 1146 0
	ldr	r3, .L153
	and	r3, r2
.L152:
	str	r3, [r0]
	.loc 1 1148 0
	@ sp needed
	bx	lr
.L154:
	.align	2
.L153:
	.word	-67108865
.LFE64:
	.size	I2C_PECRequestCmd, .-I2C_PECRequestCmd
	.section	.text.I2C_GetPEC,"ax",%progbits
	.align	1
	.global	I2C_GetPEC
	.code	16
	.thumb_func
	.type	I2C_GetPEC, %function
I2C_GetPEC:
.LFB65:
	.loc 1 1156 0
.LVL90:
	.loc 1 1161 0
	ldr	r0, [r0, #32]
.LVL91:
	.loc 1 1162 0
	@ sp needed
	.loc 1 1161 0
	uxtb	r0, r0
	.loc 1 1162 0
	bx	lr
.LFE65:
	.size	I2C_GetPEC, .-I2C_GetPEC
	.section	.text.I2C_ReadRegister,"ax",%progbits
	.align	1
	.global	I2C_ReadRegister
	.code	16
	.thumb_func
	.type	I2C_ReadRegister, %function
I2C_ReadRegister:
.LFB66:
	.loc 1 1202 0
.LVL92:
	sub	sp, sp, #8
.LCFI4:
	.loc 1 1203 0
	mov	r3, #0
	str	r3, [sp, #4]
	.loc 1 1209 0
	str	r0, [sp, #4]
	.loc 1 1210 0
	ldr	r3, [sp, #4]
	add	r1, r1, r3
.LVL93:
	str	r1, [sp, #4]
	.loc 1 1213 0
	ldr	r3, [sp, #4]
	ldr	r0, [r3]
.LVL94:
	.loc 1 1214 0
	add	sp, sp, #8
	@ sp needed
	bx	lr
.LFE66:
	.size	I2C_ReadRegister, .-I2C_ReadRegister
	.section	.text.I2C_SendData,"ax",%progbits
	.align	1
	.global	I2C_SendData
	.code	16
	.thumb_func
	.type	I2C_SendData, %function
I2C_SendData:
.LFB67:
	.loc 1 1245 0
.LVL95:
	.loc 1 1250 0
	str	r1, [r0, #40]
	.loc 1 1251 0
	@ sp needed
	bx	lr
.LFE67:
	.size	I2C_SendData, .-I2C_SendData
	.section	.text.I2C_ReceiveData,"ax",%progbits
	.align	1
	.global	I2C_ReceiveData
	.code	16
	.thumb_func
	.type	I2C_ReceiveData, %function
I2C_ReceiveData:
.LFB68:
	.loc 1 1259 0
.LVL96:
	.loc 1 1264 0
	ldr	r0, [r0, #36]
.LVL97:
	.loc 1 1265 0
	@ sp needed
	.loc 1 1264 0
	uxtb	r0, r0
	.loc 1 1265 0
	bx	lr
.LFE68:
	.size	I2C_ReceiveData, .-I2C_ReceiveData
	.section	.text.I2C_DMACmd,"ax",%progbits
	.align	1
	.global	I2C_DMACmd
	.code	16
	.thumb_func
	.type	I2C_DMACmd, %function
I2C_DMACmd:
.LFB69:
	.loc 1 1302 0
.LVL98:
	.loc 1 1311 0
	ldr	r3, [r0]
	.loc 1 1308 0
	cmp	r2, #0
	beq	.L160
	.loc 1 1311 0
	orr	r1, r3
.LVL99:
	str	r1, [r0]
	b	.L159
.LVL100:
.L160:
	.loc 1 1316 0
	bic	r3, r1
	str	r3, [r0]
.LVL101:
.L159:
	.loc 1 1318 0
	@ sp needed
	bx	lr
.LFE69:
	.size	I2C_DMACmd, .-I2C_DMACmd
	.section	.text.I2C_GetFlagStatus,"ax",%progbits
	.align	1
	.global	I2C_GetFlagStatus
	.code	16
	.thumb_func
	.type	I2C_GetFlagStatus, %function
I2C_GetFlagStatus:
.LFB70:
	.loc 1 1422 0
.LVL102:
	.loc 1 1431 0
	ldr	r0, [r0, #24]
.LVL103:
	.loc 1 1447 0
	@ sp needed
	.loc 1 1434 0
	and	r0, r1
.LVL104:
	.loc 1 1436 0
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL105:
	.loc 1 1446 0
	uxtb	r0, r0
	.loc 1 1447 0
	bx	lr
.LFE70:
	.size	I2C_GetFlagStatus, .-I2C_GetFlagStatus
	.section	.text.I2C_ClearFlag,"ax",%progbits
	.align	1
	.global	I2C_ClearFlag
	.code	16
	.thumb_func
	.type	I2C_ClearFlag, %function
I2C_ClearFlag:
.LFB71:
	.loc 1 1466 0
.LVL106:
	.loc 1 1472 0
	str	r1, [r0, #28]
	.loc 1 1473 0
	@ sp needed
	bx	lr
.LFE71:
	.size	I2C_ClearFlag, .-I2C_ClearFlag
	.section	.text.I2C_GetITStatus,"ax",%progbits
	.align	1
	.global	I2C_GetITStatus
	.code	16
	.thumb_func
	.type	I2C_GetITStatus, %function
I2C_GetITStatus:
.LFB72:
	.loc 1 1496 0
.LVL107:
	.loc 1 1505 0
	ldr	r0, [r0, #24]
.LVL108:
	.loc 1 1521 0
	@ sp needed
	.loc 1 1508 0
	and	r0, r1
.LVL109:
	.loc 1 1510 0
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL110:
	.loc 1 1520 0
	uxtb	r0, r0
	.loc 1 1521 0
	bx	lr
.LFE72:
	.size	I2C_GetITStatus, .-I2C_GetITStatus
	.section	.text.I2C_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	I2C_ClearITPendingBit
	.code	16
	.thumb_func
	.type	I2C_ClearITPendingBit, %function
I2C_ClearITPendingBit:
.LFB73:
	.loc 1 1540 0
.LVL111:
	.loc 1 1546 0
	str	r1, [r0, #28]
	.loc 1 1547 0
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_i2c.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xbbb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x1
	.4byte	.LASF94
	.4byte	.LASF95
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
	.uleb128 0x9
	.byte	0x2c
	.byte	0x3
	.2byte	0x1ae
	.4byte	0x16e
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x1b0
	.4byte	0x85
	.byte	0
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x1b1
	.4byte	0x85
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x1b2
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x1b3
	.4byte	0x85
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1b4
	.4byte	0x85
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1b5
	.4byte	0x85
	.byte	0x14
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x1b6
	.4byte	0x85
	.byte	0x18
	.uleb128 0xa
	.ascii	"ICR\000"
	.byte	0x3
	.2byte	0x1b7
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1b8
	.4byte	0x85
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x1b9
	.4byte	0x85
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1ba
	.4byte	0x85
	.byte	0x28
	.byte	0
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1bb
	.4byte	0xd5
	.uleb128 0xd
	.byte	0x1c
	.byte	0x4
	.byte	0x36
	.4byte	0x1d7
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x4
	.byte	0x38
	.4byte	0x5e
	.byte	0
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x4
	.byte	0x3b
	.4byte	0x5e
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3e
	.4byte	0x5e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x4
	.byte	0x41
	.4byte	0x5e
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x4
	.byte	0x44
	.4byte	0x5e
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x4
	.byte	0x47
	.4byte	0x5e
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x4
	.byte	0x4a
	.4byte	0x5e
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0x4c
	.4byte	0x17a
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0x8f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24a
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x8f
	.4byte	0x24a
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LVL2
	.4byte	0xbab
	.4byte	0x220
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x41
	.byte	0x24
	.byte	0
	.uleb128 0x11
	.4byte	.LVL5
	.4byte	0xbab
	.4byte	0x23a
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x40
	.byte	0x42
	.byte	0x24
	.byte	0
	.uleb128 0x13
	.4byte	.LVL6
	.4byte	0xbab
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x16e
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0xac
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28f
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0xac
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xac
	.4byte	0x28f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.byte	0xae
	.4byte	0x5e
	.4byte	.LLST1
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.4byte	0x1d7
	.uleb128 0xf
	.4byte	.LASF37
	.byte	0x1
	.byte	0xfb
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b8
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xfb
	.4byte	0x28f
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x17
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2eb
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x115
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x115
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x12d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31e
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x12d
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x12d
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x14e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x361
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x14e
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x14e
	.4byte	0x5e
	.4byte	.LLST2
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x14e
	.4byte	0xca
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x168
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x394
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x168
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x168
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x181
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3c7
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x181
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x181
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x19a
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3fa
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x19a
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x19a
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1bc
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x44f
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x45
	.4byte	.LLST3
	.uleb128 0x19
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x2c
	.4byte	.LLST4
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1be
	.4byte	0x5e
	.4byte	.LLST5
	.byte	0
	.uleb128 0x17
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1da
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x482
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1da
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1da
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1f3
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b5
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1f3
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1f3
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x20c
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4fa
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x20c
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x20c
	.4byte	0x45
	.4byte	.LLST6
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x20e
	.4byte	0x5e
	.4byte	.LLST7
	.byte	0
	.uleb128 0x17
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x229
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x52d
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x229
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x229
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x26a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x560
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x26a
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x26a
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x283
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x593
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x283
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x283
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x29b
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d8
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x29b
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x29b
	.4byte	0x2c
	.4byte	.LLST8
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x29d
	.4byte	0x5e
	.4byte	.LLST9
	.byte	0
	.uleb128 0x17
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x2b8
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x60b
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2b8
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2b8
	.4byte	0x45
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x2d2
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x63e
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2d2
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2d2
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x2eb
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x671
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2eb
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2eb
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x306
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a4
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x306
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x306
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x31f
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d7
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x31f
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x31f
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x336
	.4byte	0x2c
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x702
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x336
	.4byte	0x24a
	.4byte	.LLST10
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x344
	.4byte	0x45
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x74d
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x344
	.4byte	0x24a
	.4byte	.LLST11
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x346
	.4byte	0x5e
	.4byte	.LLST12
	.uleb128 0x1a
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x347
	.4byte	0x45
	.4byte	.LLST13
	.byte	0
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x370
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c1
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x370
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x370
	.4byte	0x45
	.4byte	.LLST14
	.uleb128 0x19
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x370
	.4byte	0x2c
	.4byte	.LLST15
	.uleb128 0x19
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x370
	.4byte	0x5e
	.4byte	.LLST16
	.uleb128 0x18
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x370
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x372
	.4byte	0x5e
	.4byte	.LLST17
	.byte	0
	.uleb128 0x17
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x3b7
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7f4
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3b7
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x3b7
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x827
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x3d0
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x3e9
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x85a
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3e9
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x3e9
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x403
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x88d
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x403
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x403
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x41c
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8d2
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x41c
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x41c
	.4byte	0x45
	.4byte	.LLST18
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x41e
	.4byte	0x5e
	.4byte	.LLST19
	.byte	0
	.uleb128 0x17
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x437
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x917
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x437
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x437
	.4byte	0x45
	.4byte	.LLST20
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x439
	.4byte	0x5e
	.4byte	.LLST21
	.byte	0
	.uleb128 0x17
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x453
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94a
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x453
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x453
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x17
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x46c
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x97d
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x46c
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x46c
	.4byte	0xca
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x483
	.4byte	0x2c
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9a8
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x483
	.4byte	0x24a
	.4byte	.LLST22
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x4b1
	.4byte	0x5e
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9f2
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4b1
	.4byte	0x24a
	.4byte	.LLST23
	.uleb128 0x19
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x4b1
	.4byte	0x2c
	.4byte	.LLST24
	.uleb128 0x1c
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x4b3
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x17
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x4dc
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa25
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4dc
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x4dc
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x4ea
	.4byte	0x2c
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa50
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4ea
	.4byte	0x24a
	.4byte	.LLST25
	.byte	0
	.uleb128 0x17
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x515
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa93
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x515
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x19
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x515
	.4byte	0x5e
	.4byte	.LLST26
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x515
	.4byte	0xca
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x58d
	.4byte	0x9f
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaec
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x58d
	.4byte	0x24a
	.4byte	.LLST27
	.uleb128 0x18
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x58d
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x58f
	.4byte	0x5e
	.4byte	.LLST28
	.uleb128 0x1a
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x590
	.4byte	0x9f
	.4byte	.LLST29
	.byte	0
	.uleb128 0x17
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x5b9
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb1f
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x5b9
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x5b9
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x5d7
	.4byte	0xaa
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb78
	.uleb128 0x19
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x5d7
	.4byte	0x24a
	.4byte	.LLST30
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x5d7
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1a
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x5d9
	.4byte	0x5e
	.4byte	.LLST31
	.uleb128 0x1a
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x5da
	.4byte	0xaa
	.4byte	.LLST32
	.byte	0
	.uleb128 0x17
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x603
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbab
	.uleb128 0x18
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x603
	.4byte	0x24a
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x18
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x603
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x1f4
	.uleb128 0x1e
	.4byte	0x5e
	.uleb128 0x1e
	.4byte	0xca
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
	.uleb128 0x2117
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
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
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1c
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
	.4byte	.LVL3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x9
	.byte	0x74
	.sleb128 0
	.byte	0xc
	.4byte	0xcfe0ff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x2
	.byte	0x70
	.sleb128 0
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x70
	.sleb128 8
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x2
	.byte	0x71
	.sleb128 12
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL20
	.4byte	.LFE33
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL28
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL32
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL36
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL32
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL34
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL35
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL37
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL42
	.4byte	.LFE44
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL40
	.4byte	.LVL41
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL41
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL45
	.4byte	.LFE44
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL49
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL51
	.4byte	.LFE48
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL49
	.4byte	.LVL50
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL50
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL53
	.4byte	.LFE48
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL59
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL60
	.4byte	.LFE54
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL61
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL62
	.4byte	.LFE55
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL61
	.4byte	.LVL62
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x7
	.byte	0x70
	.sleb128 0
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL61
	.4byte	.LVL64
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL64
	.4byte	.LFE55
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL65
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL67
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL65
	.4byte	.LVL71
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL71
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL65
	.4byte	.LVL70
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL70
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL65
	.4byte	.LVL66
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL66
	.4byte	.LVL68
	.2byte	0x9
	.byte	0x75
	.sleb128 0
	.byte	0x11
	.sleb128 -67069952
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL72
	.4byte	.LFE56
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL77
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL79
	.4byte	.LFE61
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL78
	.4byte	.LVL80
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL81
	.4byte	.LVL82
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL82
	.4byte	.LFE61
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL83
	.4byte	.LVL85
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL85
	.4byte	.LFE62
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL83
	.4byte	.LVL84
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL84
	.4byte	.LVL86
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL86
	.4byte	.LVL87
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL87
	.4byte	.LFE62
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL90
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL91
	.4byte	.LFE65
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL92
	.4byte	.LVL94
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL94
	.4byte	.LFE66
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL92
	.4byte	.LVL93
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL93
	.4byte	.LFE66
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL96
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL97
	.4byte	.LFE68
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL98
	.4byte	.LVL99
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL99
	.4byte	.LVL100
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL100
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL101
	.4byte	.LFE69
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL102
	.4byte	.LVL103
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL103
	.4byte	.LFE70
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL102
	.4byte	.LVL103
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL103
	.4byte	.LVL104
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL104
	.4byte	.LVL105
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL102
	.4byte	.LVL103
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL103
	.4byte	.LVL104
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL107
	.4byte	.LVL108
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL108
	.4byte	.LFE72
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL107
	.4byte	.LVL108
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL108
	.4byte	.LVL109
	.2byte	0x6
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL109
	.4byte	.LVL110
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL107
	.4byte	.LVL108
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL108
	.4byte	.LVL109
	.2byte	0x8
	.byte	0x71
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
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
.LASF80:
	.ascii	"I2C_ReadRegister\000"
.LASF52:
	.ascii	"I2C_SlaveAddressConfig\000"
.LASF87:
	.ascii	"I2C_GetFlagStatus\000"
.LASF77:
	.ascii	"I2C_CalculatePEC\000"
.LASF53:
	.ascii	"I2C_10BitAddressingModeCmd\000"
.LASF40:
	.ascii	"I2C_SoftwareResetCmd\000"
.LASF67:
	.ascii	"I2C_TransferHandling\000"
.LASF42:
	.ascii	"I2C_IT\000"
.LASF31:
	.ascii	"I2C_AcknowledgedAddress\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF61:
	.ascii	"I2C_GenerateSTOP\000"
.LASF38:
	.ascii	"I2C_Cmd\000"
.LASF66:
	.ascii	"direction\000"
.LASF63:
	.ascii	"I2C_AcknowledgeConfig\000"
.LASF35:
	.ascii	"I2Cx\000"
.LASF95:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF47:
	.ascii	"Address\000"
.LASF82:
	.ascii	"I2C_SendData\000"
.LASF2:
	.ascii	"short int\000"
.LASF55:
	.ascii	"I2C_ReloadCmd\000"
.LASF22:
	.ascii	"RXDR\000"
.LASF86:
	.ascii	"I2C_DMAReq\000"
.LASF92:
	.ascii	"I2C_ClearITPendingBit\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF36:
	.ascii	"I2C_InitStruct\000"
.LASF76:
	.ascii	"I2C_TimeoutBConfig\000"
.LASF39:
	.ascii	"NewState\000"
.LASF91:
	.ascii	"I2C_GetITStatus\000"
.LASF44:
	.ascii	"I2C_StopModeCmd\000"
.LASF26:
	.ascii	"I2C_AnalogFilter\000"
.LASF85:
	.ascii	"I2C_DMACmd\000"
.LASF8:
	.ascii	"long long int\000"
.LASF79:
	.ascii	"I2C_GetPEC\000"
.LASF96:
	.ascii	"RCC_APB1PeriphResetCmd\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF57:
	.ascii	"Number_Bytes\000"
.LASF74:
	.ascii	"I2C_TimeoutAConfig\000"
.LASF45:
	.ascii	"I2C_DualAddressCmd\000"
.LASF50:
	.ascii	"I2C_GeneralCallCmd\000"
.LASF83:
	.ascii	"Data\000"
.LASF59:
	.ascii	"I2C_Direction\000"
.LASF69:
	.ascii	"StartStopMode\000"
.LASF68:
	.ascii	"ReloadEndMode\000"
.LASF49:
	.ascii	"tmpreg\000"
.LASF89:
	.ascii	"bitstatus\000"
.LASF28:
	.ascii	"I2C_Mode\000"
.LASF27:
	.ascii	"I2C_DigitalFilter\000"
.LASF84:
	.ascii	"I2C_ReceiveData\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF48:
	.ascii	"Mask\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF25:
	.ascii	"I2C_Timing\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF41:
	.ascii	"I2C_ITConfig\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF62:
	.ascii	"I2C_10BitAddressHeaderCmd\000"
.LASF58:
	.ascii	"I2C_MasterRequestConfig\000"
.LASF71:
	.ascii	"I2C_ClockTimeoutCmd\000"
.LASF54:
	.ascii	"I2C_AutoEndCmd\000"
.LASF94:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_i2c.c\000"
.LASF75:
	.ascii	"Timeout\000"
.LASF21:
	.ascii	"PECR\000"
.LASF70:
	.ascii	"I2C_SMBusAlertCmd\000"
.LASF78:
	.ascii	"I2C_PECRequestCmd\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF65:
	.ascii	"I2C_GetTransferDirection\000"
.LASF81:
	.ascii	"I2C_Register\000"
.LASF60:
	.ascii	"I2C_GenerateSTART\000"
.LASF29:
	.ascii	"I2C_OwnAddress1\000"
.LASF20:
	.ascii	"TIMEOUTR\000"
.LASF17:
	.ascii	"OAR1\000"
.LASF18:
	.ascii	"OAR2\000"
.LASF93:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF30:
	.ascii	"I2C_Ack\000"
.LASF23:
	.ascii	"TXDR\000"
.LASF90:
	.ascii	"I2C_ClearFlag\000"
.LASF19:
	.ascii	"TIMINGR\000"
.LASF88:
	.ascii	"I2C_FLAG\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF32:
	.ascii	"I2C_InitTypeDef\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF37:
	.ascii	"I2C_StructInit\000"
.LASF33:
	.ascii	"I2C_DeInit\000"
.LASF64:
	.ascii	"I2C_GetAddressMatched\000"
.LASF11:
	.ascii	"RESET\000"
.LASF46:
	.ascii	"I2C_OwnAddress2Config\000"
.LASF43:
	.ascii	"I2C_StretchClockCmd\000"
.LASF56:
	.ascii	"I2C_NumberOfBytesConfig\000"
.LASF72:
	.ascii	"I2C_ExtendedClockTimeoutCmd\000"
.LASF73:
	.ascii	"I2C_IdleClockTimeoutCmd\000"
.LASF24:
	.ascii	"I2C_TypeDef\000"
.LASF34:
	.ascii	"I2C_Init\000"
.LASF51:
	.ascii	"I2C_SlaveByteControlCmd\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF15:
	.ascii	"ENABLE\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
