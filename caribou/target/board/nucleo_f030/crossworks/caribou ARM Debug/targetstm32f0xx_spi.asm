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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_spi.c"
	.loc 1 165 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 169 0
	ldr	r3, [r7, #4]
	ldr	r2, .L5
	cmp	r3, r2
	bne	.L2
	.loc 1 172 0
	movs	r3, #128
	lsls	r3, r3, #5
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 174 0
	movs	r3, #128
	lsls	r3, r3, #5
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB2PeriphResetCmd
	.loc 1 186 0
	b	.L4
.L2:
	.loc 1 178 0
	ldr	r3, [r7, #4]
	ldr	r2, .L5+4
	cmp	r3, r2
	bne	.L4
	.loc 1 181 0
	movs	r3, #128
	lsls	r3, r3, #7
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 183 0
	movs	r3, #128
	lsls	r3, r3, #7
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
.L4:
	.loc 1 186 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
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
	.loc 1 194 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 197 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 199 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #2]
	.loc 1 201 0
	ldr	r3, [r7, #4]
	movs	r2, #224
	lsls	r2, r2, #3
	strh	r2, [r3, #4]
	.loc 1 203 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #6]
	.loc 1 205 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #8]
	.loc 1 207 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #10]
	.loc 1 209 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #12]
	.loc 1 211 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #14]
	.loc 1 213 0
	ldr	r3, [r7, #4]
	movs	r2, #7
	strh	r2, [r3, #16]
	.loc 1 214 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 225 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 226 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 244 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 246 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r1, [r2]
	movs	r2, #193
	lsls	r2, r2, #6
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 255 0
	ldr	r3, [r7]
	ldrh	r2, [r3]
	ldr	r3, [r7]
	ldrh	r3, [r3, #14]
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 256 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #6]
	.loc 1 255 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 256 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #8]
	.loc 1 255 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 257 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #10]
	.loc 1 255 0
	orrs	r3, r2
	uxth	r2, r3
	.loc 1 257 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #12]
	.loc 1 255 0
	orrs	r3, r2
	uxth	r1, r3
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 259 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 262 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 264 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L9
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 266 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #4]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 268 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 272 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #16]
	ldr	r3, [r7, #4]
	strh	r2, [r3, #16]
	.loc 1 276 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 278 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	movs	r1, #4
	bics	r2, r1
	strh	r2, [r3]
	.loc 1 281 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 283 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 286 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r3, r3
	ldr	r2, .L9+4
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 287 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
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
	.loc 1 295 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 298 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 301 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #2]
	.loc 1 304 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #4]
	.loc 1 307 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #6]
	.loc 1 310 0
	ldr	r3, [r7, #4]
	movs	r2, #2
	str	r2, [r3, #8]
	.loc 1 313 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #12]
	.loc 1 314 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 331 0
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #56
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 332 0
	movs	r3, #42
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #54
	adds	r3, r7, r3
	movs	r2, #2
	strh	r2, [r3]
	movs	r3, #52
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #50
	adds	r3, r7, r3
	movs	r2, #1
	strh	r2, [r3]
	.loc 1 333 0
	movs	r3, #0
	str	r3, [r7, #44]
	.loc 1 335 0
	movs	r3, #0
	str	r3, [r7, #36]
	.loc 1 348 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r3, r3
	ldr	r2, .L21
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 349 0
	ldr	r3, [r7, #4]
	movs	r2, #2
	strh	r2, [r3, #32]
	.loc 1 352 0
	movs	r3, #42
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #28]
	strh	r2, [r3]
	.loc 1 355 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	cmp	r3, #2
	bne	.L13
	.loc 1 357 0
	movs	r3, #52
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 358 0
	movs	r3, #54
	adds	r3, r7, r3
	movs	r2, #2
	strh	r2, [r3]
	b	.L14
.L13:
	.loc 1 364 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #4]
	cmp	r3, #0
	bne	.L15
	.loc 1 367 0
	movs	r3, #50
	adds	r3, r7, r3
	movs	r2, #1
	strh	r2, [r3]
	b	.L16
.L15:
	.loc 1 372 0
	movs	r3, #50
	adds	r3, r7, r3
	movs	r2, #2
	strh	r2, [r3]
.L16:
	.loc 1 376 0
	movs	r3, #8
	adds	r3, r7, r3
	movs	r0, r3
	bl	RCC_GetClocksFreq
	.loc 1 379 0
	movs	r3, #8
	adds	r3, r7, r3
	ldr	r3, [r3]
	str	r3, [r7, #36]
	.loc 1 382 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	movs	r3, #128
	lsls	r3, r3, #2
	cmp	r2, r3
	bne	.L17
	.loc 1 385 0
	ldr	r3, [r7, #36]
	lsrs	r2, r3, #8
	movs	r3, r2
	lsls	r3, r3, #2
	adds	r3, r3, r2
	lsls	r3, r3, #1
	movs	r2, r3
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	movs	r1, r3
	movs	r0, r2
	bl	__aeabi_uidiv
	movs	r3, r0
	uxth	r3, r3
	adds	r3, r3, #5
	uxth	r3, r3
	str	r3, [r7, #44]
	b	.L18
.L17:
	.loc 1 390 0
	movs	r3, #50
	adds	r3, r7, r3
	ldrh	r3, [r3]
	lsls	r3, r3, #5
	movs	r1, r3
	ldr	r0, [r7, #36]
	bl	__aeabi_uidiv
	movs	r3, r0
	movs	r2, r3
	movs	r3, r2
	lsls	r3, r3, #2
	adds	r3, r3, r2
	lsls	r3, r3, #1
	movs	r2, r3
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	movs	r1, r3
	movs	r0, r2
	bl	__aeabi_uidiv
	movs	r3, r0
	uxth	r3, r3
	adds	r3, r3, #5
	uxth	r3, r3
	str	r3, [r7, #44]
.L18:
	.loc 1 394 0
	ldr	r3, [r7, #44]
	movs	r1, #10
	movs	r0, r3
	bl	__aeabi_uidiv
	movs	r3, r0
	str	r3, [r7, #44]
	.loc 1 397 0
	ldr	r3, [r7, #44]
	uxth	r2, r3
	movs	r3, #52
	adds	r3, r7, r3
	movs	r1, #1
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 400 0
	movs	r3, #52
	adds	r3, r7, r3
	ldrh	r3, [r3]
	ldr	r2, [r7, #44]
	subs	r3, r2, r3
	lsrs	r2, r3, #1
	movs	r3, #54
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 403 0
	movs	r3, #52
	adds	r3, r7, r3
	movs	r2, #52
	adds	r2, r7, r2
	ldrh	r2, [r2]
	lsls	r2, r2, #8
	strh	r2, [r3]
.L14:
	.loc 1 407 0
	movs	r3, #54
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #1
	bls	.L19
	.loc 1 407 0 is_stmt 0 discriminator 1
	movs	r3, #54
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #255
	bls	.L20
.L19:
	.loc 1 410 0 is_stmt 1
	movs	r3, #54
	adds	r3, r7, r3
	movs	r2, #2
	strh	r2, [r3]
	.loc 1 411 0
	movs	r3, #52
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
.L20:
	.loc 1 415 0
	ldr	r3, [r7]
	ldrh	r2, [r3, #6]
	movs	r3, #52
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #54
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #32]
	.loc 1 418 0
	ldr	r3, [r7]
	ldrh	r2, [r3]
	.loc 1 419 0
	ldr	r3, [r7]
	ldrh	r1, [r3, #2]
	ldr	r3, [r7]
	ldrh	r0, [r3, #4]
	.loc 1 420 0
	ldr	r3, [r7]
	ldrh	r3, [r3, #12]
	.loc 1 419 0
	orrs	r3, r0
	uxth	r3, r3
	orrs	r3, r1
	uxth	r3, r3
	.loc 1 418 0
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #42
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	movs	r3, #42
	adds	r3, r7, r3
	movs	r1, #128
	lsls	r1, r1, #4
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 423 0
	ldr	r3, [r7, #4]
	movs	r2, #42
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #28]
	.loc 1 424 0
	nop
	mov	sp, r7
	add	sp, sp, #56
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
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
	.loc 1 434 0
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
	.loc 1 439 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L24
	.loc 1 442 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #64
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 449 0
	b	.L26
.L24:
	.loc 1 447 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #64
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L26:
	.loc 1 449 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 464 0
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
	.loc 1 469 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L28
	.loc 1 472 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #16
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 479 0
	b	.L30
.L28:
	.loc 1 477 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #16
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L30:
	.loc 1 479 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 489 0
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
	.loc 1 493 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L32
	.loc 1 496 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r3, r3
	movs	r2, #128
	lsls	r2, r2, #3
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 1 503 0
	b	.L34
.L32:
	.loc 1 501 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	uxth	r3, r3
	ldr	r2, .L35
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
.L34:
	.loc 1 503 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
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
	.loc 1 526 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #16
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 527 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 533 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #4]
	strh	r2, [r3]
	.loc 1 535 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ldr	r1, .L38
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 537 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #14
	adds	r1, r7, r2
	adds	r2, r7, #2
	ldrh	r1, [r1]
	ldrh	r2, [r2]
	orrs	r2, r1
	strh	r2, [r3]
	.loc 1 538 0
	ldr	r3, [r7, #4]
	movs	r2, #14
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 539 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L39:
	.align	2
.L38:
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
	.loc 1 553 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #8
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 559 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	ldr	r2, .L41
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 562 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 563 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
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
	.loc 1 575 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 579 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #7
	cmp	r2, r3
	bne	.L44
	.loc 1 582 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #128
	lsls	r2, r2, #7
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 589 0
	b	.L46
.L44:
	.loc 1 587 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	ldr	r2, .L47
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L46:
	.loc 1 589 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L48:
	.align	2
.L47:
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
	.loc 1 603 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 608 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	ldr	r2, .L53
	cmp	r3, r2
	beq	.L50
	.loc 1 611 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #128
	lsls	r2, r2, #1
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 618 0
	b	.L52
.L50:
	.loc 1 616 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	ldr	r2, .L53+4
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L52:
	.loc 1 618 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L54:
	.align	2
.L53:
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
	.loc 1 630 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #8
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 634 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L56
	.loc 1 637 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #4
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 644 0
	b	.L58
.L56:
	.loc 1 642 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #4
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L58:
	.loc 1 644 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 659 0
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
	.loc 1 664 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L60
	.loc 1 667 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #8
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 674 0
	b	.L62
.L60:
	.loc 1 672 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #8
	bics	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L62:
	.loc 1 674 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 713 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #16
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 714 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 719 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 720 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #12
	str	r3, [r7, #12]
	.loc 1 722 0
	ldr	r3, [r7, #12]
	adds	r2, r7, #3
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 723 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 733 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 737 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #12]
	.loc 1 738 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 746 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #16
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	.loc 1 747 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 749 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 750 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #12
	str	r3, [r7, #12]
	.loc 1 752 0
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	uxtb	r3, r3
	.loc 1 753 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 762 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #8
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #4]
	.loc 1 763 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	.loc 1 764 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 843 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 849 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	ldr	r2, .L70
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 852 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 853 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L71:
	.align	2
.L70:
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
	.loc 1 865 0
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
	.loc 1 870 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L73
	.loc 1 873 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #128
	lsls	r2, r2, #6
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 880 0
	b	.L75
.L73:
	.loc 1 878 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	ldr	r2, .L76
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
.L75:
	.loc 1 880 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L77:
	.align	2
.L76:
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
	.loc 1 888 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	sub	sp, sp, #8
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	str	r0, [r7, #4]
	.loc 1 893 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r2, #128
	lsls	r2, r2, #5
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3]
	.loc 1 894 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 906 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI63:
	sub	sp, sp, #16
.LCFI64:
	add	r7, sp, #0
.LCFI65:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 907 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 912 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #1
	beq	.L80
	.loc 1 915 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #24]
	strh	r2, [r3]
	b	.L81
.L80:
	.loc 1 920 0
	movs	r3, #14
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #20]
	strh	r2, [r3]
.L81:
	.loc 1 923 0
	movs	r3, #14
	adds	r3, r7, r3
	ldrh	r3, [r3]
	.loc 1 924 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 932 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI66:
	sub	sp, sp, #8
.LCFI67:
	add	r7, sp, #0
.LCFI68:
	str	r0, [r7, #4]
	.loc 1 937 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	.loc 1 938 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 970 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI69:
	sub	sp, sp, #8
.LCFI70:
	add	r7, sp, #0
.LCFI71:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #1
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 976 0
	adds	r3, r7, #1
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L86
	.loc 1 979 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 986 0
	b	.L88
.L86:
	.loc 1 984 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L88:
	.loc 1 986 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1007 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI72:
	sub	sp, sp, #8
.LCFI73:
	add	r7, sp, #0
.LCFI74:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1013 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	ldr	r2, .L90
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 1016 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r2, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 1017 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L91:
	.align	2
.L90:
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
	.loc 1 1112 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI75:
	sub	sp, sp, #16
.LCFI76:
	add	r7, sp, #0
.LCFI77:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #3
	adds	r2, r0, #0
	strb	r2, [r3]
	adds	r3, r7, #2
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 1113 0
	movs	r3, #14
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1121 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	lsrs	r3, r3, #4
	uxtb	r2, r3
	movs	r3, #14
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1124 0
	movs	r3, #14
	adds	r3, r7, r3
	ldrh	r3, [r3]
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, #12
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1126 0
	adds	r3, r7, #2
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L93
	.loc 1 1129 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r2, r3
	movs	r3, #12
	adds	r3, r7, r3
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 1136 0
	b	.L95
.L93:
	.loc 1 1134 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L95:
	.loc 1 1136 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1148 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI78:
	sub	sp, sp, #8
.LCFI79:
	add	r7, sp, #0
.LCFI80:
	str	r0, [r7, #4]
	.loc 1 1150 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r2, r3
	movs	r3, #192
	lsls	r3, r3, #5
	ands	r3, r2
	uxth	r3, r3
	.loc 1 1151 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1163 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI81:
	sub	sp, sp, #8
.LCFI82:
	add	r7, sp, #0
.LCFI83:
	str	r0, [r7, #4]
	.loc 1 1165 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r2, r3
	movs	r3, #192
	lsls	r3, r3, #3
	ands	r3, r2
	uxth	r3, r3
	.loc 1 1166 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1186 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI84:
	sub	sp, sp, #16
.LCFI85:
	add	r7, sp, #0
.LCFI86:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1187 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1193 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	ands	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L101
	.loc 1 1196 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L102
.L101:
	.loc 1 1201 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L102:
	.loc 1 1204 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1205 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1221 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI87:
	sub	sp, sp, #8
.LCFI88:
	add	r7, sp, #0
.LCFI89:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 1227 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	mvns	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #8]
	.loc 1 1228 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 1245 0
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
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1246 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1247 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	movs	r3, #8
	adds	r3, r7, r3
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 1254 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	movs	r2, #15
	ands	r3, r2
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, #12
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1257 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	lsrs	r3, r3, #4
	uxtb	r2, r3
	movs	r3, #10
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1260 0
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, #10
	adds	r3, r7, r3
	strh	r2, [r3]
	.loc 1 1263 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r2, r3
	movs	r3, #8
	adds	r3, r7, r3
	movs	r1, #10
	adds	r1, r7, r1
	ldrh	r1, [r1]
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 1266 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	uxth	r3, r3
	movs	r2, #12
	adds	r2, r7, r2
	ldrh	r2, [r2]
	ands	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L106
	.loc 1 1266 0 is_stmt 0 discriminator 1
	movs	r3, #8
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L106
	.loc 1 1269 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L107
.L106:
	.loc 1 1274 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L107:
	.loc 1 1277 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1278 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x40
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x10
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_spi.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa61
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF113
	.byte	0xc
	.4byte	.LASF114
	.4byte	.LASF115
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
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xdf
	.4byte	0x9e
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0
	.uleb128 0x7
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0xdf
	.4byte	0x85
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0xdf
	.4byte	0x85
	.uleb128 0x5
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xcd
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0xe1
	.4byte	0xb4
	.uleb128 0x8
	.4byte	0x45
	.uleb128 0x9
	.byte	0x24
	.byte	0x3
	.2byte	0x210
	.4byte	0x1cf
	.uleb128 0xa
	.ascii	"CR1\000"
	.byte	0x3
	.2byte	0x212
	.4byte	0xd8
	.byte	0
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x213
	.4byte	0x45
	.byte	0x2
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x214
	.4byte	0xd8
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x215
	.4byte	0x45
	.byte	0x6
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x216
	.4byte	0xd8
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x217
	.4byte	0x45
	.byte	0xa
	.uleb128 0xa
	.ascii	"DR\000"
	.byte	0x3
	.2byte	0x218
	.4byte	0xd8
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x219
	.4byte	0x45
	.byte	0xe
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x21a
	.4byte	0xd8
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x21b
	.4byte	0x45
	.byte	0x12
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x21c
	.4byte	0xd8
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x21d
	.4byte	0x45
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x21e
	.4byte	0xd8
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x21f
	.4byte	0x45
	.byte	0x1a
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x220
	.4byte	0xd8
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x221
	.4byte	0x45
	.byte	0x1e
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x222
	.4byte	0xd8
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x223
	.4byte	0x45
	.byte	0x22
	.byte	0
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x224
	.4byte	0xdd
	.uleb128 0xd
	.byte	0x1c
	.byte	0x4
	.byte	0x32
	.4byte	0x238
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x4
	.byte	0x34
	.4byte	0x5e
	.byte	0
	.uleb128 0xe
	.4byte	.LASF33
	.byte	0x4
	.byte	0x35
	.4byte	0x5e
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x4
	.byte	0x36
	.4byte	0x5e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x4
	.byte	0x37
	.4byte	0x5e
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x4
	.byte	0x38
	.4byte	0x5e
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF37
	.byte	0x4
	.byte	0x39
	.4byte	0x5e
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF38
	.byte	0x4
	.byte	0x3a
	.4byte	0x5e
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x4
	.byte	0x3b
	.4byte	0x1db
	.uleb128 0xd
	.byte	0x12
	.byte	0x5
	.byte	0x36
	.4byte	0x2b8
	.uleb128 0xe
	.4byte	.LASF40
	.byte	0x5
	.byte	0x38
	.4byte	0x45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF41
	.byte	0x5
	.byte	0x3b
	.4byte	0x45
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x5
	.byte	0x3e
	.4byte	0x45
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF43
	.byte	0x5
	.byte	0x41
	.4byte	0x45
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x5
	.byte	0x44
	.4byte	0x45
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF45
	.byte	0x5
	.byte	0x47
	.4byte	0x45
	.byte	0xa
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x5
	.byte	0x4b
	.4byte	0x45
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x5
	.byte	0x51
	.4byte	0x45
	.byte	0xe
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x5
	.byte	0x54
	.4byte	0x45
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x5
	.byte	0x55
	.4byte	0x243
	.uleb128 0xd
	.byte	0x10
	.byte	0x5
	.byte	0x5c
	.4byte	0x314
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x5
	.byte	0x5e
	.4byte	0x45
	.byte	0
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x5
	.byte	0x61
	.4byte	0x45
	.byte	0x2
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x5
	.byte	0x64
	.4byte	0x45
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x5
	.byte	0x67
	.4byte	0x45
	.byte	0x6
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x5
	.byte	0x6a
	.4byte	0x5e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x5
	.byte	0x6d
	.4byte	0x45
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.4byte	.LASF56
	.byte	0x5
	.byte	0x6f
	.4byte	0x2c3
	.uleb128 0xf
	.4byte	.LASF57
	.byte	0x1
	.byte	0xa4
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x343
	.uleb128 0x10
	.4byte	.LASF59
	.byte	0x1
	.byte	0xa4
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x1cf
	.uleb128 0x12
	.4byte	.LASF58
	.byte	0x1
	.byte	0xc1
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36d
	.uleb128 0x10
	.4byte	.LASF60
	.byte	0x1
	.byte	0xc1
	.4byte	0x36d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x2b8
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x1
	.byte	0xe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b3
	.uleb128 0x10
	.4byte	.LASF59
	.byte	0x1
	.byte	0xe0
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF60
	.byte	0x1
	.byte	0xe0
	.4byte	0x36d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.4byte	.LASF65
	.byte	0x1
	.byte	0xe2
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x126
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d9
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x126
	.4byte	0x3d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x314
	.uleb128 0x16
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x14a
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47d
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x14a
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x15
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x14a
	.4byte	0x3d9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x14c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x17
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x14c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x14c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x14c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x18
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x14d
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x14e
	.4byte	0x238
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x17
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x14f
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x1b1
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b2
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1b1
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x1b1
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x1cf
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e7
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1cf
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x1cf
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x1e8
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x51c
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1e8
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x1e8
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x20d
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x560
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x20d
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x20d
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x20f
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x228
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x595
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x228
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x228
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x23e
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ca
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x23e
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x23e
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x25a
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ff
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x25a
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x25a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x275
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x634
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x275
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x275
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x292
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x669
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x292
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x292
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x2c8
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ad
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2c8
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x2c8
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x17
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x2ca
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x2dc
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6e2
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2dc
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x2dc
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x19
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x2e9
	.4byte	0x2c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x71b
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2e9
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x2eb
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x2f9
	.4byte	0x45
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x745
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x2f9
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x34a
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x77a
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x34a
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x34a
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x360
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7af
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x360
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x360
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x14
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x377
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d5
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x377
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x389
	.4byte	0x45
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x81d
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x389
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x389
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x17
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x38b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x19
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x45
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x847
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x3c9
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x88b
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x3c9
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x3c9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x3c9
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x3ee
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c0
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x3ee
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x3ee
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x457
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x922
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x457
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x457
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x15
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x457
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x17
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x459
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x459
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x47b
	.4byte	0x45
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94c
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x47b
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x48a
	.4byte	0x45
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x976
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x48a
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x4a1
	.4byte	0x9e
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9be
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x4a1
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x4a1
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x17
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x4a3
	.4byte	0x9e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x4c4
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9f3
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x4c4
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x4c4
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x4dc
	.4byte	0xa9
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x4dc
	.4byte	0x343
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x15
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x4dc
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x17
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x4de
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x4df
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x4df
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x17
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x4df
	.4byte	0x45
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
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2e4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xa65
	.4byte	0x91
	.ascii	"RESET\000"
	.4byte	0x97
	.ascii	"SET\000"
	.4byte	0xc0
	.ascii	"DISABLE\000"
	.4byte	0xc6
	.ascii	"ENABLE\000"
	.4byte	0x31f
	.ascii	"SPI_I2S_DeInit\000"
	.4byte	0x349
	.ascii	"SPI_StructInit\000"
	.4byte	0x373
	.ascii	"SPI_Init\000"
	.4byte	0x3b3
	.ascii	"I2S_StructInit\000"
	.4byte	0x3df
	.ascii	"I2S_Init\000"
	.4byte	0x47d
	.ascii	"SPI_Cmd\000"
	.4byte	0x4b2
	.ascii	"SPI_TIModeCmd\000"
	.4byte	0x4e7
	.ascii	"I2S_Cmd\000"
	.4byte	0x51c
	.ascii	"SPI_DataSizeConfig\000"
	.4byte	0x560
	.ascii	"SPI_RxFIFOThresholdConfig\000"
	.4byte	0x595
	.ascii	"SPI_BiDirectionalLineConfig\000"
	.4byte	0x5ca
	.ascii	"SPI_NSSInternalSoftwareConfig\000"
	.4byte	0x5ff
	.ascii	"SPI_SSOutputCmd\000"
	.4byte	0x634
	.ascii	"SPI_NSSPulseModeCmd\000"
	.4byte	0x669
	.ascii	"SPI_SendData8\000"
	.4byte	0x6ad
	.ascii	"SPI_I2S_SendData16\000"
	.4byte	0x6e2
	.ascii	"SPI_ReceiveData8\000"
	.4byte	0x71b
	.ascii	"SPI_I2S_ReceiveData16\000"
	.4byte	0x745
	.ascii	"SPI_CRCLengthConfig\000"
	.4byte	0x77a
	.ascii	"SPI_CalculateCRC\000"
	.4byte	0x7af
	.ascii	"SPI_TransmitCRC\000"
	.4byte	0x7d5
	.ascii	"SPI_GetCRC\000"
	.4byte	0x81d
	.ascii	"SPI_GetCRCPolynomial\000"
	.4byte	0x847
	.ascii	"SPI_I2S_DMACmd\000"
	.4byte	0x88b
	.ascii	"SPI_LastDMATransferCmd\000"
	.4byte	0x8c0
	.ascii	"SPI_I2S_ITConfig\000"
	.4byte	0x922
	.ascii	"SPI_GetTransmissionFIFOStatus\000"
	.4byte	0x94c
	.ascii	"SPI_GetReceptionFIFOStatus\000"
	.4byte	0x976
	.ascii	"SPI_I2S_GetFlagStatus\000"
	.4byte	0x9be
	.ascii	"SPI_I2S_ClearFlag\000"
	.4byte	0x9f3
	.ascii	"SPI_I2S_GetITStatus\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x14c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xa65
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
	.4byte	0x9e
	.ascii	"FlagStatus\000"
	.4byte	0xa9
	.ascii	"ITStatus\000"
	.4byte	0xcd
	.ascii	"FunctionalState\000"
	.4byte	0x1cf
	.ascii	"SPI_TypeDef\000"
	.4byte	0x238
	.ascii	"RCC_ClocksTypeDef\000"
	.4byte	0x2b8
	.ascii	"SPI_InitTypeDef\000"
	.4byte	0x314
	.ascii	"I2S_InitTypeDef\000"
	.4byte	0
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
.LASF97:
	.ascii	"SPI_I2S_DMACmd\000"
.LASF44:
	.ascii	"SPI_CPHA\000"
.LASF83:
	.ascii	"SPI_SendData8\000"
.LASF40:
	.ascii	"SPI_Direction\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF96:
	.ascii	"SPI_GetCRCPolynomial\000"
.LASF103:
	.ascii	"itpos\000"
.LASF88:
	.ascii	"SPI_I2S_ReceiveData16\000"
.LASF42:
	.ascii	"SPI_DataSize\000"
.LASF38:
	.ascii	"USART1CLK_Frequency\000"
.LASF32:
	.ascii	"SYSCLK_Frequency\000"
.LASF108:
	.ascii	"SPI_I2S_FLAG\000"
.LASF51:
	.ascii	"I2S_Standard\000"
.LASF61:
	.ascii	"SPI_Init\000"
.LASF47:
	.ascii	"SPI_FirstBit\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF33:
	.ascii	"HCLK_Frequency\000"
.LASF55:
	.ascii	"I2S_CPOL\000"
.LASF68:
	.ascii	"packetlength\000"
.LASF115:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF8:
	.ascii	"long long int\000"
.LASF45:
	.ascii	"SPI_NSS\000"
.LASF98:
	.ascii	"SPI_I2S_DMAReq\000"
.LASF39:
	.ascii	"RCC_ClocksTypeDef\000"
.LASF25:
	.ascii	"TXCRCR\000"
.LASF2:
	.ascii	"short int\000"
.LASF46:
	.ascii	"SPI_BaudRatePrescaler\000"
.LASF23:
	.ascii	"RXCRCR\000"
.LASF22:
	.ascii	"RESERVED4\000"
.LASF20:
	.ascii	"RESERVED3\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF73:
	.ascii	"SPI_TIModeCmd\000"
.LASF70:
	.ascii	"sourceclock\000"
.LASF100:
	.ascii	"SPI_LastDMATransfer\000"
.LASF72:
	.ascii	"NewState\000"
.LASF63:
	.ascii	"I2S_InitStruct\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF106:
	.ascii	"SPI_GetReceptionFIFOStatus\000"
.LASF56:
	.ascii	"I2S_InitTypeDef\000"
.LASF112:
	.ascii	"enablestatus\000"
.LASF64:
	.ascii	"I2S_Init\000"
.LASF62:
	.ascii	"I2S_StructInit\000"
.LASF78:
	.ascii	"SPI_BiDirectionalLineConfig\000"
.LASF82:
	.ascii	"SPI_NSSPulseModeCmd\000"
.LASF66:
	.ascii	"i2sdiv\000"
.LASF101:
	.ascii	"SPI_I2S_ITConfig\000"
.LASF54:
	.ascii	"I2S_AudioFreq\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF53:
	.ascii	"I2S_MCLKOutput\000"
.LASF84:
	.ascii	"Data\000"
.LASF94:
	.ascii	"SPI_CRC\000"
.LASF102:
	.ascii	"SPI_I2S_IT\000"
.LASF65:
	.ascii	"tmpreg\000"
.LASF71:
	.ascii	"SPI_Cmd\000"
.LASF34:
	.ascii	"PCLK_Frequency\000"
.LASF93:
	.ascii	"SPI_GetCRC\000"
.LASF75:
	.ascii	"SPI_DataSizeConfig\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF52:
	.ascii	"I2S_DataFormat\000"
.LASF57:
	.ascii	"SPI_I2S_DeInit\000"
.LASF0:
	.ascii	"signed char\000"
.LASF79:
	.ascii	"SPI_NSSInternalSoftwareConfig\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF86:
	.ascii	"SPI_I2S_SendData16\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF111:
	.ascii	"SPI_I2S_GetITStatus\000"
.LASF85:
	.ascii	"spixbase\000"
.LASF113:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF21:
	.ascii	"CRCPR\000"
.LASF41:
	.ascii	"SPI_Mode\000"
.LASF35:
	.ascii	"ADCCLK_Frequency\000"
.LASF31:
	.ascii	"SPI_TypeDef\000"
.LASF109:
	.ascii	"bitstatus\000"
.LASF48:
	.ascii	"SPI_CRCPolynomial\000"
.LASF69:
	.ascii	"RCC_Clocks\000"
.LASF99:
	.ascii	"SPI_LastDMATransferCmd\000"
.LASF90:
	.ascii	"SPI_CRCLength\000"
.LASF80:
	.ascii	"SPI_NSSInternalSoft\000"
.LASF110:
	.ascii	"SPI_I2S_ClearFlag\000"
.LASF87:
	.ascii	"SPI_ReceiveData8\000"
.LASF17:
	.ascii	"RESERVED0\000"
.LASF18:
	.ascii	"RESERVED1\000"
.LASF19:
	.ascii	"RESERVED2\000"
.LASF74:
	.ascii	"I2S_Cmd\000"
.LASF105:
	.ascii	"SPI_GetTransmissionFIFOStatus\000"
.LASF24:
	.ascii	"RESERVED5\000"
.LASF26:
	.ascii	"RESERVED6\000"
.LASF58:
	.ascii	"SPI_StructInit\000"
.LASF30:
	.ascii	"RESERVED8\000"
.LASF36:
	.ascii	"CECCLK_Frequency\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF37:
	.ascii	"I2C1CLK_Frequency\000"
.LASF28:
	.ascii	"RESERVED7\000"
.LASF11:
	.ascii	"RESET\000"
.LASF114:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_spi.c\000"
.LASF50:
	.ascii	"I2S_Mode\000"
.LASF107:
	.ascii	"SPI_I2S_GetFlagStatus\000"
.LASF59:
	.ascii	"SPIx\000"
.LASF81:
	.ascii	"SPI_SSOutputCmd\000"
.LASF89:
	.ascii	"SPI_CRCLengthConfig\000"
.LASF67:
	.ascii	"i2sodd\000"
.LASF92:
	.ascii	"SPI_TransmitCRC\000"
.LASF43:
	.ascii	"SPI_CPOL\000"
.LASF77:
	.ascii	"SPI_RxFIFOThreshold\000"
.LASF104:
	.ascii	"itmask\000"
.LASF27:
	.ascii	"I2SCFGR\000"
.LASF91:
	.ascii	"SPI_CalculateCRC\000"
.LASF29:
	.ascii	"I2SPR\000"
.LASF95:
	.ascii	"crcreg\000"
.LASF76:
	.ascii	"SPI_RxFIFOThresholdConfig\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF49:
	.ascii	"SPI_InitTypeDef\000"
.LASF60:
	.ascii	"SPI_InitStruct\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
