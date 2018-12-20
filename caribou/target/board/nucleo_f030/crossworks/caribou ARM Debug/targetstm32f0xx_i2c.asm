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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_i2c.c"
	.loc 1 144 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 148 0
	ldr	r3, [r7, #4]
	ldr	r2, .L5
	cmp	r3, r2
	bne	.L2
	.loc 1 151 0
	movs	r3, #128
	lsls	r3, r3, #14
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 153 0
	movs	r3, #128
	lsls	r3, r3, #14
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 162 0
	b	.L4
.L2:
	.loc 1 158 0
	movs	r3, #128
	lsls	r3, r3, #15
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 160 0
	movs	r3, #128
	lsls	r3, r3, #15
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
.L4:
	.loc 1 162 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
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
	.loc 1 173 0
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
	.loc 1 174 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 186 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	bics	r3, r2
	movs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 190 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 192 0
	ldr	r3, [r7, #12]
	ldr	r2, .L8
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 196 0
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	lsls	r3, r3, #8
	orrs	r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 199 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 205 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, .L8+4
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	.loc 1 208 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 212 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 214 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	.loc 1 216 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	.loc 1 220 0
	ldr	r3, [r7]
	ldr	r2, [r3, #24]
	.loc 1 221 0
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	.loc 1 220 0
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 223 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	.loc 1 225 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r2, #128
	lsls	r2, r2, #8
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 230 0
	ldr	r3, [r7]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	.loc 1 232 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 236 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 238 0
	ldr	r3, [r7, #12]
	ldr	r2, .L8+8
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 241 0
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 243 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 244 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
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
	.loc 1 252 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 255 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 257 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 259 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 261 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 263 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 265 0
	ldr	r3, [r7, #4]
	movs	r2, #128
	lsls	r2, r2, #8
	str	r2, [r3, #20]
	.loc 1 267 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #24]
	.loc 1 268 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 278 0
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
	.loc 1 282 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L12
	.loc 1 285 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 292 0
	b	.L14
.L12:
	.loc 1 290 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	bics	r3, r2
	movs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L14:
	.loc 1 292 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 302 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #8
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 306 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L16
	.loc 1 309 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #6
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 316 0
	b	.L18
.L16:
	.loc 1 314 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L19
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L18:
	.loc 1 316 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
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
	.loc 1 335 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 341 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L22
	.loc 1 344 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 1 351 0
	b	.L24
.L22:
	.loc 1 349 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
.L24:
	.loc 1 351 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 361 0
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
	.loc 1 366 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L26
	.loc 1 369 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L29
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 376 0
	b	.L28
.L26:
	.loc 1 374 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #10
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L28:
	.loc 1 376 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
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
	.loc 1 386 0
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
	.loc 1 391 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L32
	.loc 1 394 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #11
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 401 0
	b	.L34
.L32:
	.loc 1 399 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L35
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L34:
	.loc 1 401 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
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
	.loc 1 411 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 416 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L38
	.loc 1 419 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	movs	r2, #128
	lsls	r2, r2, #8
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 426 0
	b	.L40
.L38:
	.loc 1 424 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, .L41
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L40:
	.loc 1 426 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
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
	.loc 1 445 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #1
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 446 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 454 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	str	r3, [r7, #12]
	.loc 1 457 0
	ldr	r3, [r7, #12]
	ldr	r2, .L44
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 460 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	movs	r2, #254
	ands	r2, r3
	.loc 1 461 0
	adds	r3, r7, #1
	ldrb	r3, [r3]
	lsls	r1, r3, #8
	movs	r3, #224
	lsls	r3, r3, #3
	ands	r3, r1
	.loc 1 460 0
	orrs	r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 464 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #12]
	.loc 1 465 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
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
	.loc 1 475 0
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
	.loc 1 480 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L47
	.loc 1 483 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #12
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 490 0
	b	.L49
.L47:
	.loc 1 488 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L50
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L49:
	.loc 1 490 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
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
	.loc 1 500 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #8
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 505 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L53
	.loc 1 508 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #9
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 515 0
	b	.L55
.L53:
	.loc 1 513 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L56
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L55:
	.loc 1 515 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L57:
	.align	2
.L56:
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
	.loc 1 525 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #16
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 526 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 533 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 536 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #10
	lsls	r3, r3, #10
	str	r3, [r7, #12]
	.loc 1 539 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #22
	lsrs	r3, r3, #22
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 542 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 543 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 554 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #8
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 559 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L60
	.loc 1 562 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #4
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 569 0
	b	.L62
.L60:
	.loc 1 567 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L63
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L62:
	.loc 1 569 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L64:
	.align	2
.L63:
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
	.loc 1 619 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #8
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 624 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L66
	.loc 1 627 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #18
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 634 0
	b	.L68
.L66:
	.loc 1 632 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L69
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L68:
	.loc 1 634 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L70:
	.align	2
.L69:
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
	.loc 1 644 0
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
	.loc 1 649 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L72
	.loc 1 652 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #17
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 659 0
	b	.L74
.L72:
	.loc 1 657 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L75
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L74:
	.loc 1 659 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L76:
	.align	2
.L75:
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
	.loc 1 668 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #16
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 669 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 675 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 678 0
	ldr	r3, [r7, #12]
	ldr	r2, .L78
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 681 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	lsls	r2, r3, #16
	movs	r3, #255
	lsls	r3, r3, #16
	ands	r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 684 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 685 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L79:
	.align	2
.L78:
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
	.loc 1 697 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 703 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L81
	.loc 1 706 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L84
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 713 0
	b	.L83
.L81:
	.loc 1 711 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #3
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L83:
	.loc 1 713 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L85:
	.align	2
.L84:
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
	.loc 1 723 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #8
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 728 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L87
	.loc 1 731 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #6
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 738 0
	b	.L89
.L87:
	.loc 1 736 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L90
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L89:
	.loc 1 738 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L91:
	.align	2
.L90:
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
	.loc 1 748 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI57:
	sub	sp, sp, #8
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 753 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L93
	.loc 1 756 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #7
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 763 0
	b	.L95
.L93:
	.loc 1 761 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L96
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L95:
	.loc 1 763 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L97:
	.align	2
.L96:
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
	.loc 1 775 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	sub	sp, sp, #8
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 780 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L99
	.loc 1 783 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #5
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 790 0
	b	.L101
.L99:
	.loc 1 788 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L102
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L101:
	.loc 1 790 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L103:
	.align	2
.L102:
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
	.loc 1 800 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI63:
	sub	sp, sp, #8
.LCFI64:
	add	r7, sp, #0
.LCFI65:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 805 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L105
	.loc 1 808 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r2, .L108
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 815 0
	b	.L107
.L105:
	.loc 1 813 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #128
	lsls	r2, r2, #8
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
.L107:
	.loc 1 815 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L109:
	.align	2
.L108:
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
	.loc 1 823 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI66:
	sub	sp, sp, #8
.LCFI67:
	add	r7, sp, #0
.LCFI68:
	str	r0, [r7, #4]
	.loc 1 828 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #24]
	movs	r3, #254
	lsls	r3, r3, #16
	ands	r3, r2
	lsrs	r3, r3, #16
	uxtb	r3, r3
	.loc 1 829 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 837 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI69:
	sub	sp, sp, #16
.LCFI70:
	add	r7, sp, #0
.LCFI71:
	str	r0, [r7, #4]
	.loc 1 838 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 839 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 845 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #24]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 848 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L113
	.loc 1 851 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	b	.L114
.L113:
	.loc 1 856 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #128
	lsls	r2, r2, #3
	strh	r2, [r3]
.L114:
	.loc 1 858 0
	movs	r3, #14
	adds	r3, r7, r3
	ldrh	r3, [r3]
	.loc 1 859 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 881 0
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI72:
	sub	sp, sp, #24
.LCFI73:
	add	r7, sp, #0
.LCFI74:
	str	r0, [r7, #12]
	movs	r0, r1
	movs	r1, r2
	str	r3, [r7, #4]
	movs	r3, #10
	adds	r3, r7, r3
	adds	r2, r0, #0
	strh	r2, [r3]
	movs	r3, #9
	adds	r3, r7, r3
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 882 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 891 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	str	r3, [r7, #20]
	.loc 1 894 0
	ldr	r3, [r7, #20]
	ldr	r2, .L117
	ands	r3, r2
	str	r3, [r7, #20]
	.loc 1 897 0
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	lsls	r3, r3, #22
	lsrs	r2, r3, #22
	movs	r3, #9
	adds	r3, r7, r3
	ldrb	r3, [r3]
	lsls	r1, r3, #16
	movs	r3, #255
	lsls	r3, r3, #16
	ands	r3, r1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	orrs	r2, r3
	ldr	r3, [r7, #32]
	orrs	r3, r2
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	.loc 1 901 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	str	r2, [r3, #4]
	.loc 1 902 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L118:
	.align	2
.L117:
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
	.loc 1 952 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI75:
	sub	sp, sp, #8
.LCFI76:
	add	r7, sp, #0
.LCFI77:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 957 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L120
	.loc 1 960 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #15
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 967 0
	b	.L122
.L120:
	.loc 1 965 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L123
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L122:
	.loc 1 967 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L124:
	.align	2
.L123:
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
	.loc 1 977 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI78:
	sub	sp, sp, #8
.LCFI79:
	add	r7, sp, #0
.LCFI80:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 982 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L126
	.loc 1 985 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	movs	r2, #128
	lsls	r2, r2, #8
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 992 0
	b	.L128
.L126:
	.loc 1 990 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	ldr	r2, .L129
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
.L128:
	.loc 1 992 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L130:
	.align	2
.L129:
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
	.loc 1 1002 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI81:
	sub	sp, sp, #8
.LCFI82:
	add	r7, sp, #0
.LCFI83:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1007 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L132
	.loc 1 1010 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	movs	r2, #128
	lsls	r2, r2, #24
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 1017 0
	b	.L134
.L132:
	.loc 1 1015 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	lsls	r3, r3, #1
	lsrs	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
.L134:
	.loc 1 1017 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1028 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI84:
	sub	sp, sp, #8
.LCFI85:
	add	r7, sp, #0
.LCFI86:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1033 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L136
	.loc 1 1036 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	movs	r2, #128
	lsls	r2, r2, #5
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 1043 0
	b	.L138
.L136:
	.loc 1 1041 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	ldr	r2, .L139
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
.L138:
	.loc 1 1043 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L140:
	.align	2
.L139:
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
	.loc 1 1053 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI87:
	sub	sp, sp, #16
.LCFI88:
	add	r7, sp, #0
.LCFI89:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1054 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1061 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	str	r3, [r7, #12]
	.loc 1 1064 0
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #12
	lsls	r3, r3, #12
	str	r3, [r7, #12]
	.loc 1 1067 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #20
	lsrs	r3, r3, #20
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 1070 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #20]
	.loc 1 1071 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1080 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI90:
	sub	sp, sp, #16
.LCFI91:
	add	r7, sp, #0
.LCFI92:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1081 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1088 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	str	r3, [r7, #12]
	.loc 1 1091 0
	ldr	r3, [r7, #12]
	ldr	r2, .L143
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 1094 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsls	r3, r3, #16
	ldr	r2, .L143+4
	ands	r3, r2
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 1097 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3, #20]
	.loc 1 1098 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L144:
	.align	2
.L143:
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
	.loc 1 1108 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI93:
	sub	sp, sp, #8
.LCFI94:
	add	r7, sp, #0
.LCFI95:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1113 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L146
	.loc 1 1116 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #16
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 1123 0
	b	.L148
.L146:
	.loc 1 1121 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L149
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L148:
	.loc 1 1123 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L150:
	.align	2
.L149:
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
	.loc 1 1133 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI96:
	sub	sp, sp, #8
.LCFI97:
	add	r7, sp, #0
.LCFI98:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1138 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L152
	.loc 1 1141 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #128
	lsls	r2, r2, #19
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 1148 0
	b	.L154
.L152:
	.loc 1 1146 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L155
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L154:
	.loc 1 1148 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L156:
	.align	2
.L155:
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
	.loc 1 1156 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI99:
	sub	sp, sp, #8
.LCFI100:
	add	r7, sp, #0
.LCFI101:
	str	r0, [r7, #4]
	.loc 1 1161 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	uxtb	r3, r3
	.loc 1 1162 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1202 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI102:
	sub	sp, sp, #16
.LCFI103:
	add	r7, sp, #0
.LCFI104:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1203 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 1209 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 1210 0
	adds	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, [r7, #12]
	adds	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 1213 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	.loc 1 1214 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1245 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI105:
	sub	sp, sp, #8
.LCFI106:
	add	r7, sp, #0
.LCFI107:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1250 0
	adds	r3, r7, #3
	ldrb	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #40]
	.loc 1 1251 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1259 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI108:
	sub	sp, sp, #8
.LCFI109:
	add	r7, sp, #0
.LCFI110:
	str	r0, [r7, #4]
	.loc 1 1264 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	uxtb	r3, r3
	.loc 1 1265 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1302 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI111:
	sub	sp, sp, #16
.LCFI112:
	add	r7, sp, #0
.LCFI113:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 1308 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L165
	.loc 1 1311 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 1 1318 0
	b	.L167
.L165:
	.loc 1 1316 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
.L167:
	.loc 1 1318 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1422 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI114:
	sub	sp, sp, #16
.LCFI115:
	add	r7, sp, #0
.LCFI116:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1423 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 1424 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1431 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #8]
	.loc 1 1434 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 1436 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L169
	.loc 1 1439 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L170
.L169:
	.loc 1 1444 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L170:
	.loc 1 1446 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1447 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1466 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI117:
	sub	sp, sp, #8
.LCFI118:
	add	r7, sp, #0
.LCFI119:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1472 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #28]
	.loc 1 1473 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1496 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI120:
	sub	sp, sp, #16
.LCFI121:
	add	r7, sp, #0
.LCFI122:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1497 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 1498 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1505 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #8]
	.loc 1 1508 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 1510 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L174
	.loc 1 1513 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L175
.L174:
	.loc 1 1518 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L175:
	.loc 1 1520 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1521 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1540 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI123:
	sub	sp, sp, #8
.LCFI124:
	add	r7, sp, #0
.LCFI125:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 1546 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #28]
	.loc 1 1547 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x20
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
	.uleb128 0x10
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
	.uleb128 0x10
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
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI87-.LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI89-.LCFI88
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.byte	0x4
	.4byte	.LCFI90-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.byte	0x4
	.4byte	.LCFI93-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.byte	0x4
	.4byte	.LCFI96-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI97-.LCFI96
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI98-.LCFI97
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI99-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI100-.LCFI99
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI101-.LCFI100
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.byte	0x4
	.4byte	.LCFI102-.LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI103-.LCFI102
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI104-.LCFI103
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.byte	0x4
	.4byte	.LCFI105-.LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI106-.LCFI105
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI107-.LCFI106
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.byte	0x4
	.4byte	.LCFI108-.LFB68
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI109-.LCFI108
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI110-.LCFI109
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.byte	0x4
	.4byte	.LCFI111-.LFB69
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI112-.LCFI111
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI113-.LCFI112
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI114-.LFB70
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI115-.LCFI114
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI116-.LCFI115
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI117-.LFB71
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI118-.LCFI117
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI119-.LCFI118
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.byte	0x4
	.4byte	.LCFI120-.LFB72
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI121-.LCFI120
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI122-.LCFI121
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI123-.LFB73
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI124-.LCFI123
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI125-.LCFI124
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE82:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_i2c.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xb87
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0xc
	.4byte	.LASF93
	.4byte	.LASF94
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
	.4byte	0x37
	.byte	0x3
	.byte	0xdf
	.4byte	0xa3
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0
	.uleb128 0x8
	.ascii	"SET\000"
	.byte	0x1
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
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xd2
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0xe1
	.4byte	0xb9
	.uleb128 0x9
	.byte	0x2c
	.byte	0x3
	.2byte	0x1ae
	.4byte	0x176
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
	.4byte	0xdd
	.uleb128 0xd
	.byte	0x1c
	.byte	0x4
	.byte	0x36
	.4byte	0x1df
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
	.4byte	0x182
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0x8f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x20e
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x8f
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x176
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.byte	0xac
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x254
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0xac
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0xac
	.4byte	0x254
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF49
	.byte	0x1
	.byte	0xae
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x1df
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.byte	0xfb
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27e
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0xfb
	.4byte	0x254
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b3
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x115
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x115
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x12d
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e8
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x12d
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x12d
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x14e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x32c
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x14e
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x14e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x14e
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x168
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x361
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x168
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x168
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x181
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x396
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x181
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x181
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x19a
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3cb
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x19a
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x19a
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1bc
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x41e
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1bc
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1be
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1da
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x453
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1da
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1da
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1f3
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x488
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x1f3
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x1f3
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x20c
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4cc
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x20c
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x20c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x20e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x229
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x501
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x229
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x229
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x26a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x536
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x26a
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x26a
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x283
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56b
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x283
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x283
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x29b
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5af
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x29b
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x29b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x29d
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x2b8
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e4
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2b8
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2b8
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x2d2
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x619
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2d2
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2d2
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x2eb
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x64e
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x2eb
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x2eb
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x306
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x683
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x306
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x306
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x31f
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b8
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x31f
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x31f
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x17
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x336
	.4byte	0x2c
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6e2
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x336
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x344
	.4byte	0x45
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x72a
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x344
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x346
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x347
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x370
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x79b
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x370
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x370
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x370
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x15
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x370
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x370
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x372
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x3b7
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d0
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3b7
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x3b7
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x3d0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x805
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3d0
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x3d0
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x3e9
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x83a
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x3e9
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x3e9
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x403
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x86f
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x403
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x403
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x41c
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8b3
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x41c
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x41c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x41e
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x437
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8f7
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x437
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x437
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x439
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x453
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x92c
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x453
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x453
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x46c
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x961
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x46c
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x46c
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x17
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x483
	.4byte	0x2c
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x98b
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x483
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x4b1
	.4byte	0x5e
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9d3
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4b1
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x4b1
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x4b3
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x4dc
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa08
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4dc
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x4dc
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x17
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x4ea
	.4byte	0x2c
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa32
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x4ea
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x515
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa76
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x515
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x515
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x515
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x17
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x58d
	.4byte	0xa3
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xacd
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x58d
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x58d
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x58f
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x590
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x5b9
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb02
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x5b9
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x5b9
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x5d7
	.4byte	0xae
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb59
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x5d7
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x5d7
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x5d9
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x5da
	.4byte	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x603
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x603
	.4byte	0x20e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x603
	.4byte	0x5e
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
	.uleb128 0x2116
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x18
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
	.4byte	0x3e7
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb8b
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xc5
	.ascii	"DISABLE\000"
	.4byte	0xcb
	.ascii	"ENABLE\000"
	.4byte	0x1ea
	.ascii	"I2C_DeInit\000"
	.4byte	0x214
	.ascii	"I2C_Init\000"
	.4byte	0x25a
	.ascii	"I2C_StructInit\000"
	.4byte	0x27e
	.ascii	"I2C_Cmd\000"
	.4byte	0x2b3
	.ascii	"I2C_SoftwareResetCmd\000"
	.4byte	0x2e8
	.ascii	"I2C_ITConfig\000"
	.4byte	0x32c
	.ascii	"I2C_StretchClockCmd\000"
	.4byte	0x361
	.ascii	"I2C_StopModeCmd\000"
	.4byte	0x396
	.ascii	"I2C_DualAddressCmd\000"
	.4byte	0x3cb
	.ascii	"I2C_OwnAddress2Config\000"
	.4byte	0x41e
	.ascii	"I2C_GeneralCallCmd\000"
	.4byte	0x453
	.ascii	"I2C_SlaveByteControlCmd\000"
	.4byte	0x488
	.ascii	"I2C_SlaveAddressConfig\000"
	.4byte	0x4cc
	.ascii	"I2C_10BitAddressingModeCmd\000"
	.4byte	0x501
	.ascii	"I2C_AutoEndCmd\000"
	.4byte	0x536
	.ascii	"I2C_ReloadCmd\000"
	.4byte	0x56b
	.ascii	"I2C_NumberOfBytesConfig\000"
	.4byte	0x5af
	.ascii	"I2C_MasterRequestConfig\000"
	.4byte	0x5e4
	.ascii	"I2C_GenerateSTART\000"
	.4byte	0x619
	.ascii	"I2C_GenerateSTOP\000"
	.4byte	0x64e
	.ascii	"I2C_10BitAddressHeaderCmd\000"
	.4byte	0x683
	.ascii	"I2C_AcknowledgeConfig\000"
	.4byte	0x6b8
	.ascii	"I2C_GetAddressMatched\000"
	.4byte	0x6e2
	.ascii	"I2C_GetTransferDirection\000"
	.4byte	0x72a
	.ascii	"I2C_TransferHandling\000"
	.4byte	0x79b
	.ascii	"I2C_SMBusAlertCmd\000"
	.4byte	0x7d0
	.ascii	"I2C_ClockTimeoutCmd\000"
	.4byte	0x805
	.ascii	"I2C_ExtendedClockTimeoutCmd\000"
	.4byte	0x83a
	.ascii	"I2C_IdleClockTimeoutCmd\000"
	.4byte	0x86f
	.ascii	"I2C_TimeoutAConfig\000"
	.4byte	0x8b3
	.ascii	"I2C_TimeoutBConfig\000"
	.4byte	0x8f7
	.ascii	"I2C_CalculatePEC\000"
	.4byte	0x92c
	.ascii	"I2C_PECRequestCmd\000"
	.4byte	0x961
	.ascii	"I2C_GetPEC\000"
	.4byte	0x98b
	.ascii	"I2C_ReadRegister\000"
	.4byte	0x9d3
	.ascii	"I2C_SendData\000"
	.4byte	0xa08
	.ascii	"I2C_ReceiveData\000"
	.4byte	0xa32
	.ascii	"I2C_DMACmd\000"
	.4byte	0xa76
	.ascii	"I2C_GetFlagStatus\000"
	.4byte	0xacd
	.ascii	"I2C_ClearFlag\000"
	.4byte	0xb02
	.ascii	"I2C_GetITStatus\000"
	.4byte	0xb59
	.ascii	"I2C_ClearITPendingBit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x122
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xb8b
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x50
	.ascii	"short unsigned int\000"
	.4byte	0x45
	.ascii	"uint16_t\000"
	.4byte	0x57
	.ascii	"int\000"
	.4byte	0x69
	.ascii	"unsigned int\000"
	.4byte	0x5e
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x7e
	.ascii	"sizetype\000"
	.4byte	0xa3
	.ascii	"FlagStatus\000"
	.4byte	0xae
	.ascii	"ITStatus\000"
	.4byte	0xd2
	.ascii	"FunctionalState\000"
	.4byte	0x176
	.ascii	"I2C_TypeDef\000"
	.4byte	0x1df
	.ascii	"I2C_InitTypeDef\000"
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
.LASF94:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF66:
	.ascii	"direction\000"
.LASF63:
	.ascii	"I2C_AcknowledgeConfig\000"
.LASF35:
	.ascii	"I2Cx\000"
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
.LASF95:
	.ascii	"I2C_ClearITPendingBit\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF36:
	.ascii	"I2C_InitStruct\000"
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
.LASF76:
	.ascii	"I2C_TimeoutBConfig\000"
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
.LASF15:
	.ascii	"ENABLE\000"
.LASF58:
	.ascii	"I2C_MasterRequestConfig\000"
.LASF71:
	.ascii	"I2C_ClockTimeoutCmd\000"
.LASF54:
	.ascii	"I2C_AutoEndCmd\000"
.LASF5:
	.ascii	"short unsigned int\000"
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
.LASF17:
	.ascii	"OAR1\000"
.LASF18:
	.ascii	"OAR2\000"
.LASF20:
	.ascii	"TIMEOUTR\000"
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
.LASF37:
	.ascii	"I2C_StructInit\000"
.LASF62:
	.ascii	"I2C_10BitAddressHeaderCmd\000"
.LASF33:
	.ascii	"I2C_DeInit\000"
.LASF64:
	.ascii	"I2C_GetAddressMatched\000"
.LASF11:
	.ascii	"RESET\000"
.LASF46:
	.ascii	"I2C_OwnAddress2Config\000"
.LASF92:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
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
.LASF93:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_i2c.c\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
