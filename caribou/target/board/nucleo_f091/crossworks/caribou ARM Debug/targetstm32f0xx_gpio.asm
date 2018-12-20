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
	.file	"stm32f0xx_gpio.c"
	.text
.Ltext0:
	.section	.text.GPIO_DeInit,"ax",%progbits
	.align	2
	.global	GPIO_DeInit
	.code	16
	.thumb_func
	.type	GPIO_DeInit, %function
GPIO_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_gpio.c"
	.loc 1 118 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 122 0
	ldr	r2, [r7, #4]
	movs	r3, #144
	lsls	r3, r3, #23
	cmp	r2, r3
	bne	.L2
	.loc 1 124 0
	movs	r3, #128
	lsls	r3, r3, #10
	movs	r1, #1
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 125 0
	movs	r3, #128
	lsls	r3, r3, #10
	movs	r1, #0
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 150 0
	b	.L7
.L2:
	.loc 1 127 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8
	cmp	r3, r2
	bne	.L4
	.loc 1 129 0
	movs	r3, #128
	lsls	r3, r3, #11
	movs	r1, #1
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 130 0
	movs	r3, #128
	lsls	r3, r3, #11
	movs	r1, #0
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 150 0
	b	.L7
.L4:
	.loc 1 132 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+4
	cmp	r3, r2
	bne	.L5
	.loc 1 134 0
	movs	r3, #128
	lsls	r3, r3, #12
	movs	r1, #1
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 135 0
	movs	r3, #128
	lsls	r3, r3, #12
	movs	r1, #0
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 150 0
	b	.L7
.L5:
	.loc 1 137 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+8
	cmp	r3, r2
	bne	.L6
	.loc 1 139 0
	movs	r3, #128
	lsls	r3, r3, #13
	movs	r1, #1
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 140 0
	movs	r3, #128
	lsls	r3, r3, #13
	movs	r1, #0
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 150 0
	b	.L7
.L6:
	.loc 1 144 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+12
	cmp	r3, r2
	bne	.L7
	.loc 1 146 0
	movs	r3, #128
	lsls	r3, r3, #15
	movs	r1, #1
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
	.loc 1 147 0
	movs	r3, #128
	lsls	r3, r3, #15
	movs	r1, #0
	movs	r0, r3
	bl	RCC_AHBPeriphResetCmd
.L7:
	.loc 1 150 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	1207960576
	.word	1207961600
	.word	1207962624
	.word	1207964672
.LFE32:
	.size	GPIO_DeInit, .-GPIO_DeInit
	.section	.text.GPIO_Init,"ax",%progbits
	.align	2
	.global	GPIO_Init
	.code	16
	.thumb_func
	.type	GPIO_Init, %function
GPIO_Init:
.LFB33:
	.loc 1 163 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #24
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 164 0
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 174 0
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L11
.L15:
	.loc 1 176 0
	movs	r2, #1
	ldr	r3, [r7, #20]
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #16]
	.loc 1 179 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 181 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bne	.L12
	.loc 1 183 0
	ldr	r3, [r7]
	ldrb	r3, [r3, #4]
	cmp	r3, #1
	beq	.L13
	.loc 1 183 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldrb	r3, [r3, #4]
	cmp	r3, #2
	bne	.L14
.L13:
	.loc 1 189 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #20]
	lsls	r2, r2, #1
	movs	r1, #3
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 190 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	ldrb	r3, [r3, #5]
	movs	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	lsls	r1, r1, r3
	movs	r3, r1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 196 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	ldr	r2, [r7, #20]
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	movs	r1, #1
	lsls	r1, r1, r2
	movs	r2, r1
	uxth	r2, r2
	mvns	r2, r2
	uxth	r2, r2
	ands	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
	.loc 1 197 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, [r7]
	ldrb	r3, [r3, #6]
	movs	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	lsls	r1, r1, r3
	movs	r3, r1
	sxth	r3, r3
	orrs	r3, r2
	sxth	r3, r3
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #4]
.L14:
	.loc 1 200 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	lsls	r2, r2, #1
	movs	r1, #3
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 202 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3, #4]
	movs	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	lsls	r1, r1, r3
	movs	r3, r1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 205 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #20]
	lsls	r2, r2, #16
	lsrs	r2, r2, #16
	lsls	r2, r2, #1
	movs	r1, #3
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 206 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #12]
	ldr	r3, [r7]
	ldrb	r3, [r3, #7]
	movs	r1, r3
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	lsls	r1, r1, r3
	movs	r3, r1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L12:
	.loc 1 174 0 discriminator 2
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L11:
	.loc 1 174 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #20]
	cmp	r3, #15
	bhi	.LCB292
	b	.L15	@long jump
.LCB292:
	.loc 1 209 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	GPIO_Init, .-GPIO_Init
	.section	.text.GPIO_StructInit,"ax",%progbits
	.align	2
	.global	GPIO_StructInit
	.code	16
	.thumb_func
	.type	GPIO_StructInit, %function
GPIO_StructInit:
.LFB34:
	.loc 1 218 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 220 0
	ldr	r3, [r7, #4]
	ldr	r2, .L17
	str	r2, [r3]
	.loc 1 221 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 222 0
	ldr	r3, [r7, #4]
	movs	r2, #2
	strb	r2, [r3, #5]
	.loc 1 223 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #6]
	.loc 1 224 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strb	r2, [r3, #7]
	.loc 1 225 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
	.word	65535
.LFE34:
	.size	GPIO_StructInit, .-GPIO_StructInit
	.section	.text.GPIO_PinLockConfig,"ax",%progbits
	.align	2
	.global	GPIO_PinLockConfig
	.code	16
	.thumb_func
	.type	GPIO_PinLockConfig, %function
GPIO_PinLockConfig:
.LFB35:
	.loc 1 239 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 240 0
	movs	r3, #128
	lsls	r3, r3, #9
	str	r3, [r7, #12]
	.loc 1 246 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 248 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	.loc 1 250 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	.loc 1 252 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #28]
	.loc 1 254 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	.loc 1 256 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #12]
	.loc 1 257 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	GPIO_PinLockConfig, .-GPIO_PinLockConfig
	.section	.text.GPIO_ReadInputDataBit,"ax",%progbits
	.align	2
	.global	GPIO_ReadInputDataBit
	.code	16
	.thumb_func
	.type	GPIO_ReadInputDataBit, %function
GPIO_ReadInputDataBit:
.LFB36:
	.loc 1 284 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 285 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 291 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	ands	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L21
	.loc 1 293 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L22
.L21:
	.loc 1 297 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L22:
	.loc 1 299 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 300 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	GPIO_ReadInputDataBit, .-GPIO_ReadInputDataBit
	.section	.text.GPIO_ReadInputData,"ax",%progbits
	.align	2
	.global	GPIO_ReadInputData
	.code	16
	.thumb_func
	.type	GPIO_ReadInputData, %function
GPIO_ReadInputData:
.LFB37:
	.loc 1 308 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 312 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	.loc 1 313 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	GPIO_ReadInputData, .-GPIO_ReadInputData
	.section	.text.GPIO_ReadOutputDataBit,"ax",%progbits
	.align	2
	.global	GPIO_ReadOutputDataBit
	.code	16
	.thumb_func
	.type	GPIO_ReadOutputDataBit, %function
GPIO_ReadOutputDataBit:
.LFB38:
	.loc 1 324 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #16
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 325 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 331 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #20]
	uxth	r3, r3
	adds	r2, r7, #2
	ldrh	r2, [r2]
	ands	r3, r2
	uxth	r3, r3
	cmp	r3, #0
	beq	.L27
	.loc 1 333 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L28
.L27:
	.loc 1 337 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L28:
	.loc 1 339 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 340 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	GPIO_ReadOutputDataBit, .-GPIO_ReadOutputDataBit
	.section	.text.GPIO_ReadOutputData,"ax",%progbits
	.align	2
	.global	GPIO_ReadOutputData
	.code	16
	.thumb_func
	.type	GPIO_ReadOutputData, %function
GPIO_ReadOutputData:
.LFB39:
	.loc 1 348 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 352 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #20]
	uxth	r3, r3
	.loc 1 353 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	GPIO_ReadOutputData, .-GPIO_ReadOutputData
	.section	.text.GPIO_SetBits,"ax",%progbits
	.align	2
	.global	GPIO_SetBits
	.code	16
	.thumb_func
	.type	GPIO_SetBits, %function
GPIO_SetBits:
.LFB40:
	.loc 1 364 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 369 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	.loc 1 370 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE40:
	.size	GPIO_SetBits, .-GPIO_SetBits
	.section	.text.GPIO_ResetBits,"ax",%progbits
	.align	2
	.global	GPIO_ResetBits
	.code	16
	.thumb_func
	.type	GPIO_ResetBits, %function
GPIO_ResetBits:
.LFB41:
	.loc 1 381 0
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
	.loc 1 386 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #40]
	.loc 1 387 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	GPIO_ResetBits, .-GPIO_ResetBits
	.section	.text.GPIO_WriteBit,"ax",%progbits
	.align	2
	.global	GPIO_WriteBit
	.code	16
	.thumb_func
	.type	GPIO_WriteBit, %function
GPIO_WriteBit:
.LFB42:
	.loc 1 402 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #8
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #1
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 408 0
	adds	r3, r7, #1
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L35
	.loc 1 410 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #24]
	.loc 1 416 0
	b	.L37
.L35:
	.loc 1 414 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #40]
.L37:
	.loc 1 416 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE42:
	.size	GPIO_WriteBit, .-GPIO_WriteBit
	.section	.text.GPIO_Write,"ax",%progbits
	.align	2
	.global	GPIO_Write
	.code	16
	.thumb_func
	.type	GPIO_Write, %function
GPIO_Write:
.LFB43:
	.loc 1 426 0
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
	.loc 1 430 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #20]
	.loc 1 431 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE43:
	.size	GPIO_Write, .-GPIO_Write
	.section	.text.GPIO_PinAFConfig,"ax",%progbits
	.align	2
	.global	GPIO_PinAFConfig
	.code	16
	.thumb_func
	.type	GPIO_PinAFConfig, %function
GPIO_PinAFConfig:
.LFB44:
	.loc 1 473 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #16
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #2
	adds	r2, r0, #0
	strh	r2, [r3]
	adds	r3, r7, #1
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 474 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 475 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 482 0
	adds	r3, r7, #1
	ldrb	r2, [r3]
	adds	r3, r7, #2
	ldrh	r3, [r3]
	movs	r1, #7
	ands	r3, r1
	lsls	r3, r3, #2
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #12]
	.loc 1 483 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsrs	r3, r3, #3
	uxth	r3, r3
	movs	r0, r3
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsrs	r3, r3, #3
	uxth	r3, r3
	movs	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	lsls	r2, r2, #2
	ldr	r3, [r2, r3]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	movs	r1, #7
	ands	r2, r1
	lsls	r2, r2, #2
	movs	r1, #15
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	movs	r1, r2
	ldr	r3, [r7, #4]
	movs	r2, r0
	adds	r2, r2, #8
	lsls	r2, r2, #2
	str	r1, [r2, r3]
	.loc 1 484 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsrs	r3, r3, #3
	uxth	r3, r3
	movs	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	lsls	r2, r2, #2
	ldr	r2, [r2, r3]
	ldr	r3, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #8]
	.loc 1 485 0
	adds	r3, r7, #2
	ldrh	r3, [r3]
	lsrs	r3, r3, #3
	uxth	r3, r3
	movs	r2, r3
	ldr	r3, [r7, #4]
	adds	r2, r2, #8
	lsls	r2, r2, #2
	ldr	r1, [r7, #8]
	str	r1, [r2, r3]
	.loc 1 486 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE44:
	.size	GPIO_PinAFConfig, .-GPIO_PinAFConfig
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
	.uleb128 0x20
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_gpio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5b7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0xc
	.4byte	.LASF73
	.4byte	.LASF74
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
	.4byte	0x85
	.4byte	0x9a
	.uleb128 0x7
	.4byte	0x7e
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.byte	0x1
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xb3
	.uleb128 0x9
	.4byte	.LASF11
	.byte	0
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x45
	.uleb128 0xa
	.byte	0x2c
	.byte	0x3
	.2byte	0x18c
	.4byte	0x178
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x18e
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x18f
	.4byte	0xb3
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x190
	.4byte	0x45
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x191
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x192
	.4byte	0x85
	.byte	0xc
	.uleb128 0xc
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x193
	.4byte	0xb3
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x194
	.4byte	0x45
	.byte	0x12
	.uleb128 0xc
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x195
	.4byte	0xb3
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x196
	.4byte	0x45
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x197
	.4byte	0x85
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x198
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xc
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x199
	.4byte	0x178
	.byte	0x20
	.uleb128 0xc
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x19a
	.4byte	0xb3
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x19b
	.4byte	0x45
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0x8a
	.uleb128 0xd
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x19c
	.4byte	0xb8
	.uleb128 0x8
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x3e
	.4byte	0x1ae
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x4
	.byte	0x43
	.4byte	0x189
	.uleb128 0x8
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x4f
	.4byte	0x1d2
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x4
	.byte	0x52
	.4byte	0x1b9
	.uleb128 0x8
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x5e
	.4byte	0x1fc
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x2
	.uleb128 0x9
	.4byte	.LASF34
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.4byte	.LASF35
	.byte	0x4
	.byte	0x62
	.4byte	0x1dd
	.uleb128 0x8
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x6e
	.4byte	0x226
	.uleb128 0x9
	.4byte	.LASF36
	.byte	0
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x1
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF39
	.byte	0x4
	.byte	0x72
	.4byte	0x207
	.uleb128 0x8
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x7e
	.4byte	0x24a
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0
	.uleb128 0x9
	.4byte	.LASF41
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x4
	.byte	0x81
	.4byte	0x231
	.uleb128 0xe
	.byte	0x8
	.byte	0x4
	.byte	0x8b
	.4byte	0x29a
	.uleb128 0xf
	.4byte	.LASF43
	.byte	0x4
	.byte	0x8d
	.4byte	0x5e
	.byte	0
	.uleb128 0xf
	.4byte	.LASF44
	.byte	0x4
	.byte	0x90
	.4byte	0x1ae
	.byte	0x4
	.uleb128 0xf
	.4byte	.LASF45
	.byte	0x4
	.byte	0x93
	.4byte	0x1fc
	.byte	0x5
	.uleb128 0xf
	.4byte	.LASF46
	.byte	0x4
	.byte	0x96
	.4byte	0x1d2
	.byte	0x6
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x4
	.byte	0x99
	.4byte	0x226
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF48
	.byte	0x4
	.byte	0x9b
	.4byte	0x255
	.uleb128 0x10
	.4byte	.LASF49
	.byte	0x1
	.byte	0x75
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c9
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0x1
	.byte	0x75
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x17d
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0xa2
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x32b
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0x1
	.byte	0xa2
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.byte	0xa2
	.4byte	0x32b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0xa4
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"pos\000"
	.byte	0x1
	.byte	0xa4
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x1
	.byte	0xa4
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x29a
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0xd9
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x355
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.byte	0xd9
	.4byte	0x32b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x1
	.byte	0xee
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x395
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0x1
	.byte	0xee
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0xee
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x15
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xf0
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x11b
	.4byte	0x2c
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3dd
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x11b
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x11b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x18
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x11d
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x133
	.4byte	0x45
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x407
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x133
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x143
	.4byte	0x2c
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x44f
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x143
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x143
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x18
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x145
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x15b
	.4byte	0x45
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x479
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x15b
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x16b
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4ae
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x16b
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x16b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x19
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x17c
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e3
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x17c
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x17c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x19
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x191
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x527
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x191
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x191
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x191
	.4byte	0x24a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -15
	.byte	0
	.uleb128 0x19
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x1a9
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55c
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x1d8
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x2c9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x17
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x1d8
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -23
	.uleb128 0x18
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x1da
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x1db
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.4byte	0x22d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x5bb
	.4byte	0xa6
	.ascii	"DISABLE\000"
	.4byte	0xac
	.ascii	"ENABLE\000"
	.4byte	0x195
	.ascii	"GPIO_Mode_IN\000"
	.4byte	0x19b
	.ascii	"GPIO_Mode_OUT\000"
	.4byte	0x1a1
	.ascii	"GPIO_Mode_AF\000"
	.4byte	0x1a7
	.ascii	"GPIO_Mode_AN\000"
	.4byte	0x1c5
	.ascii	"GPIO_OType_PP\000"
	.4byte	0x1cb
	.ascii	"GPIO_OType_OD\000"
	.4byte	0x1e9
	.ascii	"GPIO_Speed_Level_1\000"
	.4byte	0x1ef
	.ascii	"GPIO_Speed_Level_2\000"
	.4byte	0x1f5
	.ascii	"GPIO_Speed_Level_3\000"
	.4byte	0x213
	.ascii	"GPIO_PuPd_NOPULL\000"
	.4byte	0x219
	.ascii	"GPIO_PuPd_UP\000"
	.4byte	0x21f
	.ascii	"GPIO_PuPd_DOWN\000"
	.4byte	0x23d
	.ascii	"Bit_RESET\000"
	.4byte	0x243
	.ascii	"Bit_SET\000"
	.4byte	0x2a5
	.ascii	"GPIO_DeInit\000"
	.4byte	0x2cf
	.ascii	"GPIO_Init\000"
	.4byte	0x331
	.ascii	"GPIO_StructInit\000"
	.4byte	0x355
	.ascii	"GPIO_PinLockConfig\000"
	.4byte	0x395
	.ascii	"GPIO_ReadInputDataBit\000"
	.4byte	0x3dd
	.ascii	"GPIO_ReadInputData\000"
	.4byte	0x407
	.ascii	"GPIO_ReadOutputDataBit\000"
	.4byte	0x44f
	.ascii	"GPIO_ReadOutputData\000"
	.4byte	0x479
	.ascii	"GPIO_SetBits\000"
	.4byte	0x4ae
	.ascii	"GPIO_ResetBits\000"
	.4byte	0x4e3
	.ascii	"GPIO_WriteBit\000"
	.4byte	0x527
	.ascii	"GPIO_Write\000"
	.4byte	0x55c
	.ascii	"GPIO_PinAFConfig\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x158
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x5bb
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
	.4byte	0x17d
	.ascii	"GPIO_TypeDef\000"
	.4byte	0x1ae
	.ascii	"GPIOMode_TypeDef\000"
	.4byte	0x1d2
	.ascii	"GPIOOType_TypeDef\000"
	.4byte	0x1fc
	.ascii	"GPIOSpeed_TypeDef\000"
	.4byte	0x226
	.ascii	"GPIOPuPd_TypeDef\000"
	.4byte	0x24a
	.ascii	"BitAction\000"
	.4byte	0x29a
	.ascii	"GPIO_InitTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x7c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF23:
	.ascii	"GPIO_TypeDef\000"
.LASF53:
	.ascii	"pinpos\000"
.LASF43:
	.ascii	"GPIO_Pin\000"
.LASF41:
	.ascii	"Bit_SET\000"
.LASF61:
	.ascii	"GPIO_ReadOutputData\000"
.LASF28:
	.ascii	"GPIOMode_TypeDef\000"
.LASF70:
	.ascii	"temp\000"
.LASF2:
	.ascii	"short int\000"
.LASF55:
	.ascii	"GPIO_StructInit\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF65:
	.ascii	"BitVal\000"
.LASF30:
	.ascii	"GPIO_OType_OD\000"
.LASF40:
	.ascii	"Bit_RESET\000"
.LASF64:
	.ascii	"GPIO_WriteBit\000"
.LASF31:
	.ascii	"GPIOOType_TypeDef\000"
.LASF46:
	.ascii	"GPIO_OType\000"
.LASF26:
	.ascii	"GPIO_Mode_AF\000"
.LASF62:
	.ascii	"GPIO_SetBits\000"
.LASF12:
	.ascii	"ENABLE\000"
.LASF45:
	.ascii	"GPIO_Speed\000"
.LASF50:
	.ascii	"GPIO_Init\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF27:
	.ascii	"GPIO_Mode_AN\000"
.LASF63:
	.ascii	"GPIO_ResetBits\000"
.LASF21:
	.ascii	"LCKR\000"
.LASF71:
	.ascii	"temp_2\000"
.LASF14:
	.ascii	"OTYPER\000"
.LASF0:
	.ascii	"signed char\000"
.LASF8:
	.ascii	"long long int\000"
.LASF25:
	.ascii	"GPIO_Mode_OUT\000"
.LASF17:
	.ascii	"PUPDR\000"
.LASF24:
	.ascii	"GPIO_Mode_IN\000"
.LASF49:
	.ascii	"GPIO_DeInit\000"
.LASF20:
	.ascii	"BSRR\000"
.LASF13:
	.ascii	"MODER\000"
.LASF58:
	.ascii	"GPIO_ReadInputDataBit\000"
.LASF29:
	.ascii	"GPIO_OType_PP\000"
.LASF57:
	.ascii	"bitstatus\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF69:
	.ascii	"GPIO_AF\000"
.LASF47:
	.ascii	"GPIO_PuPd\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF48:
	.ascii	"GPIO_InitTypeDef\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF67:
	.ascii	"PortVal\000"
.LASF68:
	.ascii	"GPIO_PinSource\000"
.LASF59:
	.ascii	"GPIO_ReadInputData\000"
.LASF36:
	.ascii	"GPIO_PuPd_NOPULL\000"
.LASF11:
	.ascii	"DISABLE\000"
.LASF56:
	.ascii	"GPIO_PinLockConfig\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF54:
	.ascii	"currentpin\000"
.LASF73:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_gpio.c\000"
.LASF66:
	.ascii	"GPIO_Write\000"
.LASF15:
	.ascii	"RESERVED0\000"
.LASF18:
	.ascii	"RESERVED1\000"
.LASF19:
	.ascii	"RESERVED2\000"
.LASF16:
	.ascii	"OSPEEDR\000"
.LASF44:
	.ascii	"GPIO_Mode\000"
.LASF42:
	.ascii	"BitAction\000"
.LASF35:
	.ascii	"GPIOSpeed_TypeDef\000"
.LASF38:
	.ascii	"GPIO_PuPd_DOWN\000"
.LASF74:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF51:
	.ascii	"GPIOx\000"
.LASF32:
	.ascii	"GPIO_Speed_Level_1\000"
.LASF33:
	.ascii	"GPIO_Speed_Level_2\000"
.LASF34:
	.ascii	"GPIO_Speed_Level_3\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF72:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF39:
	.ascii	"GPIOPuPd_TypeDef\000"
.LASF37:
	.ascii	"GPIO_PuPd_UP\000"
.LASF75:
	.ascii	"GPIO_PinAFConfig\000"
.LASF60:
	.ascii	"GPIO_ReadOutputDataBit\000"
.LASF52:
	.ascii	"GPIO_InitStruct\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
