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
	.file	"stm32f0xx_cec.c"
	.text
.Ltext0:
	.section	.text.CEC_DeInit,"ax",%progbits
	.align	2
	.global	CEC_DeInit
	.code	16
	.thumb_func
	.type	CEC_DeInit, %function
CEC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_cec.c"
	.loc 1 145 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 146 0
	movs	r3, #128
	lsls	r3, r3, #23
	movs	r1, #1
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 147 0
	movs	r3, #128
	lsls	r3, r3, #23
	movs	r1, #0
	movs	r0, r3
	bl	RCC_APB1PeriphResetCmd
	.loc 1 148 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	CEC_DeInit, .-CEC_DeInit
	.section	.text.CEC_Init,"ax",%progbits
	.align	2
	.global	CEC_Init
	.code	16
	.thumb_func
	.type	CEC_Init, %function
CEC_Init:
.LFB33:
	.loc 1 159 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #16
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	str	r0, [r7, #4]
	.loc 1 160 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 172 0
	ldr	r3, .L3
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
	.loc 1 175 0
	ldr	r3, [r7, #12]
	ldr	r2, .L3+4
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 178 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	orrs	r2, r3
	.loc 1 179 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	.loc 1 178 0
	orrs	r2, r3
	.loc 1 179 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	orrs	r2, r3
	.loc 1 180 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	.loc 1 179 0
	orrs	r2, r3
	.loc 1 180 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	orrs	r2, r3
	.loc 1 181 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	.loc 1 180 0
	orrs	r3, r2
	.loc 1 178 0
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 184 0
	ldr	r3, .L3
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 185 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	1073772544
	.word	1879113216
.LFE33:
	.size	CEC_Init, .-CEC_Init
	.section	.text.CEC_StructInit,"ax",%progbits
	.align	2
	.global	CEC_StructInit
	.code	16
	.thumb_func
	.type	CEC_StructInit, %function
CEC_StructInit:
.LFB34:
	.loc 1 194 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	.loc 1 195 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 196 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 197 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 198 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 199 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 200 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 201 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #24]
	.loc 1 202 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	CEC_StructInit, .-CEC_StructInit
	.section	.text.CEC_Cmd,"ax",%progbits
	.align	2
	.global	CEC_Cmd
	.code	16
	.thumb_func
	.type	CEC_Cmd, %function
CEC_Cmd:
.LFB35:
	.loc 1 211 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #8
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 214 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L7
	.loc 1 217 0
	ldr	r3, .L10
	ldr	r2, .L10
	ldr	r2, [r2]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 224 0
	b	.L9
.L7:
	.loc 1 222 0
	ldr	r3, .L10
	ldr	r2, .L10
	ldr	r2, [r2]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3]
.L9:
	.loc 1 224 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L11:
	.align	2
.L10:
	.word	1073772544
.LFE35:
	.size	CEC_Cmd, .-CEC_Cmd
	.section	.text.CEC_ListenModeCmd,"ax",%progbits
	.align	2
	.global	CEC_ListenModeCmd
	.code	16
	.thumb_func
	.type	CEC_ListenModeCmd, %function
CEC_ListenModeCmd:
.LFB36:
	.loc 1 233 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #8
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 236 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L13
	.loc 1 239 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #24
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 246 0
	b	.L15
.L13:
	.loc 1 244 0
	ldr	r3, .L16
	ldr	r2, .L16
	ldr	r2, [r2, #4]
	lsls	r2, r2, #1
	lsrs	r2, r2, #1
	str	r2, [r3, #4]
.L15:
	.loc 1 246 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	1073772544
.LFE36:
	.size	CEC_ListenModeCmd, .-CEC_ListenModeCmd
	.section	.text.CEC_OwnAddressConfig,"ax",%progbits
	.align	2
	.global	CEC_OwnAddressConfig
	.code	16
	.thumb_func
	.type	CEC_OwnAddressConfig, %function
CEC_OwnAddressConfig:
.LFB37:
	.loc 1 254 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #16
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 255 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 258 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	adds	r3, r3, #16
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #12]
	.loc 1 260 0
	ldr	r3, .L19
	ldr	r2, .L19
	ldr	r1, [r2, #4]
	ldr	r2, [r7, #12]
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 261 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073772544
.LFE37:
	.size	CEC_OwnAddressConfig, .-CEC_OwnAddressConfig
	.section	.text.CEC_OwnAddressClear,"ax",%progbits
	.align	2
	.global	CEC_OwnAddressClear
	.code	16
	.thumb_func
	.type	CEC_OwnAddressClear, %function
CEC_OwnAddressClear:
.LFB38:
	.loc 1 269 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	.loc 1 271 0
	ldr	r3, .L22
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 272 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L23:
	.align	2
.L22:
	.word	1073772544
.LFE38:
	.size	CEC_OwnAddressClear, .-CEC_OwnAddressClear
	.section	.text.CEC_SendData,"ax",%progbits
	.align	2
	.global	CEC_SendData
	.code	16
	.thumb_func
	.type	CEC_SendData, %function
CEC_SendData:
.LFB39:
	.loc 1 299 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI19:
	sub	sp, sp, #8
.LCFI20:
	add	r7, sp, #0
.LCFI21:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 301 0
	ldr	r3, .L25
	adds	r2, r7, #7
	ldrb	r2, [r2]
	str	r2, [r3, #8]
	.loc 1 302 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L26:
	.align	2
.L25:
	.word	1073772544
.LFE39:
	.size	CEC_SendData, .-CEC_SendData
	.section	.text.CEC_ReceiveData,"ax",%progbits
	.align	2
	.global	CEC_ReceiveData
	.code	16
	.thumb_func
	.type	CEC_ReceiveData, %function
CEC_ReceiveData:
.LFB40:
	.loc 1 310 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	.loc 1 312 0
	ldr	r3, .L29
	ldr	r3, [r3, #12]
	uxtb	r3, r3
	.loc 1 313 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	1073772544
.LFE40:
	.size	CEC_ReceiveData, .-CEC_ReceiveData
	.section	.text.CEC_StartOfMessage,"ax",%progbits
	.align	2
	.global	CEC_StartOfMessage
	.code	16
	.thumb_func
	.type	CEC_StartOfMessage, %function
CEC_StartOfMessage:
.LFB41:
	.loc 1 321 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	.loc 1 323 0
	ldr	r3, .L32
	ldr	r2, .L32
	ldr	r2, [r2]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 324 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	1073772544
.LFE41:
	.size	CEC_StartOfMessage, .-CEC_StartOfMessage
	.section	.text.CEC_EndOfMessage,"ax",%progbits
	.align	2
	.global	CEC_EndOfMessage
	.code	16
	.thumb_func
	.type	CEC_EndOfMessage, %function
CEC_EndOfMessage:
.LFB42:
	.loc 1 332 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI26:
	add	r7, sp, #0
.LCFI27:
	.loc 1 334 0
	ldr	r3, .L35
	ldr	r2, .L35
	ldr	r2, [r2]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 335 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
	.word	1073772544
.LFE42:
	.size	CEC_EndOfMessage, .-CEC_EndOfMessage
	.section	.text.CEC_ITConfig,"ax",%progbits
	.align	2
	.global	CEC_ITConfig
	.code	16
	.thumb_func
	.type	CEC_ITConfig, %function
CEC_ITConfig:
.LFB43:
	.loc 1 432 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI28:
	sub	sp, sp, #8
.LCFI29:
	add	r7, sp, #0
.LCFI30:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	adds	r3, r7, #5
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 436 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L38
	.loc 1 439 0
	ldr	r3, .L41
	ldr	r2, .L41
	ldr	r1, [r2, #20]
	adds	r2, r7, #6
	ldrh	r2, [r2]
	orrs	r2, r1
	str	r2, [r3, #20]
	.loc 1 447 0
	b	.L40
.L38:
	.loc 1 443 0
	adds	r3, r7, #6
	adds	r2, r7, #6
	ldrh	r2, [r2]
	mvns	r2, r2
	strh	r2, [r3]
	.loc 1 445 0
	ldr	r3, .L41
	ldr	r2, .L41
	ldr	r2, [r2, #20]
	adds	r1, r7, #6
	ldrh	r1, [r1]
	ands	r2, r1
	str	r2, [r3, #20]
.L40:
	.loc 1 447 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L42:
	.align	2
.L41:
	.word	1073772544
.LFE43:
	.size	CEC_ITConfig, .-CEC_ITConfig
	.section	.text.CEC_GetFlagStatus,"ax",%progbits
	.align	2
	.global	CEC_GetFlagStatus
	.code	16
	.thumb_func
	.type	CEC_GetFlagStatus, %function
CEC_GetFlagStatus:
.LFB44:
	.loc 1 469 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI31:
	sub	sp, sp, #16
.LCFI32:
	add	r7, sp, #0
.LCFI33:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 470 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 475 0
	ldr	r3, .L47
	ldr	r3, [r3, #16]
	adds	r2, r7, #6
	ldrh	r2, [r2]
	ands	r3, r2
	beq	.L44
	.loc 1 478 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L45
.L44:
	.loc 1 483 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L45:
	.loc 1 487 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 488 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L48:
	.align	2
.L47:
	.word	1073772544
.LFE44:
	.size	CEC_GetFlagStatus, .-CEC_GetFlagStatus
	.section	.text.CEC_ClearFlag,"ax",%progbits
	.align	2
	.global	CEC_ClearFlag
	.code	16
	.thumb_func
	.type	CEC_ClearFlag, %function
CEC_ClearFlag:
.LFB45:
	.loc 1 510 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI34:
	sub	sp, sp, #8
.LCFI35:
	add	r7, sp, #0
.LCFI36:
	str	r0, [r7, #4]
	.loc 1 514 0
	ldr	r3, .L50
	ldr	r2, [r7, #4]
	str	r2, [r3, #16]
	.loc 1 515 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L51:
	.align	2
.L50:
	.word	1073772544
.LFE45:
	.size	CEC_ClearFlag, .-CEC_ClearFlag
	.section	.text.CEC_GetITStatus,"ax",%progbits
	.align	2
	.global	CEC_GetITStatus
	.code	16
	.thumb_func
	.type	CEC_GetITStatus, %function
CEC_GetITStatus:
.LFB46:
	.loc 1 537 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI37:
	sub	sp, sp, #16
.LCFI38:
	add	r7, sp, #0
.LCFI39:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 538 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 539 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 545 0
	ldr	r3, .L56
	ldr	r3, [r3, #20]
	adds	r2, r7, #6
	ldrh	r2, [r2]
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 548 0
	ldr	r3, .L56
	ldr	r3, [r3, #16]
	adds	r2, r7, #6
	ldrh	r2, [r2]
	ands	r3, r2
	beq	.L53
	.loc 1 548 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L53
	.loc 1 551 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L54
.L53:
	.loc 1 556 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L54:
	.loc 1 560 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 561 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L57:
	.align	2
.L56:
	.word	1073772544
.LFE46:
	.size	CEC_GetITStatus, .-CEC_GetITStatus
	.section	.text.CEC_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	CEC_ClearITPendingBit
	.code	16
	.thumb_func
	.type	CEC_ClearITPendingBit, %function
CEC_ClearITPendingBit:
.LFB47:
	.loc 1 583 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI40:
	sub	sp, sp, #8
.LCFI41:
	add	r7, sp, #0
.LCFI42:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 587 0
	ldr	r3, .L59
	adds	r2, r7, #6
	ldrh	r2, [r2]
	str	r2, [r3, #16]
	.loc 1 588 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L60:
	.align	2
.L59:
	.word	1073772544
.LFE47:
	.size	CEC_ClearITPendingBit, .-CEC_ClearITPendingBit
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
	.4byte	.LCFI2-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
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
	.4byte	.LCFI5-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
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
	.4byte	.LCFI8-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
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
	.4byte	.LCFI11-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
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
	.4byte	.LCFI14-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
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
	.4byte	.LCFI17-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
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
	.4byte	.LCFI19-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
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
	.4byte	.LCFI22-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
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
	.4byte	.LCFI24-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
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
	.4byte	.LCFI26-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
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
	.4byte	.LCFI28-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
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
	.4byte	.LCFI31-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
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
	.4byte	.LCFI34-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
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
	.4byte	.LCFI37-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
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
	.4byte	.LCFI40-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_cec.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3fc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0xc
	.4byte	.LASF53
	.4byte	.LASF54
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
	.byte	0x18
	.byte	0x3
	.2byte	0x108
	.4byte	0x134
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x10a
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x10b
	.4byte	0x85
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x10c
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x10d
	.4byte	0x85
	.byte	0xc
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x10e
	.4byte	0x85
	.byte	0x10
	.uleb128 0xa
	.ascii	"IER\000"
	.byte	0x3
	.2byte	0x10f
	.4byte	0x85
	.byte	0x14
	.byte	0
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x110
	.4byte	0xdd
	.uleb128 0xd
	.byte	0x1c
	.byte	0x4
	.byte	0x34
	.4byte	0x19d
	.uleb128 0xe
	.4byte	.LASF21
	.byte	0x4
	.byte	0x36
	.4byte	0x5e
	.byte	0
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x4
	.byte	0x38
	.4byte	0x5e
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x4
	.byte	0x3a
	.4byte	0x5e
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x4
	.byte	0x3c
	.4byte	0x5e
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x4
	.byte	0x3e
	.4byte	0x5e
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x4
	.byte	0x40
	.4byte	0x5e
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x42
	.4byte	0x5e
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.4byte	.LASF28
	.byte	0x4
	.byte	0x45
	.4byte	0x140
	.uleb128 0xf
	.4byte	.LASF38
	.byte	0x1
	.byte	0x90
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x10
	.4byte	.LASF29
	.byte	0x1
	.byte	0x9e
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1eb
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0x9e
	.4byte	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.byte	0xa0
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.4byte	0x19d
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x1
	.byte	0xc1
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x215
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0xc1
	.4byte	0x1eb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0xd2
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x239
	.uleb128 0x11
	.4byte	.LASF33
	.byte	0x1
	.byte	0xd2
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0xe8
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25d
	.uleb128 0x11
	.4byte	.LASF33
	.byte	0x1
	.byte	0xe8
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0xfd
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28f
	.uleb128 0x11
	.4byte	.LASF36
	.byte	0x1
	.byte	0xfd
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x14
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xff
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x10c
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x12a
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c7
	.uleb128 0x17
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x12a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x18
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x135
	.4byte	0x2c
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x140
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x14b
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x336
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1af
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x17
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x1af
	.4byte	0xd2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -11
	.byte	0
	.uleb128 0x19
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1d4
	.4byte	0xa3
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36f
	.uleb128 0x17
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1d4
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1a
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1d6
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x16
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1fd
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x395
	.uleb128 0x17
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1fd
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x19
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x218
	.4byte	0xae
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3dd
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x218
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1a
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x21a
	.4byte	0xae
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1a
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x21b
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x246
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x246
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
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
	.byte	0
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.4byte	0x171
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x400
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xc5
	.ascii	"DISABLE\000"
	.4byte	0xcb
	.ascii	"ENABLE\000"
	.4byte	0x1a8
	.ascii	"CEC_DeInit\000"
	.4byte	0x1b9
	.ascii	"CEC_Init\000"
	.4byte	0x1f1
	.ascii	"CEC_StructInit\000"
	.4byte	0x215
	.ascii	"CEC_Cmd\000"
	.4byte	0x239
	.ascii	"CEC_ListenModeCmd\000"
	.4byte	0x25d
	.ascii	"CEC_OwnAddressConfig\000"
	.4byte	0x28f
	.ascii	"CEC_OwnAddressClear\000"
	.4byte	0x2a1
	.ascii	"CEC_SendData\000"
	.4byte	0x2c7
	.ascii	"CEC_ReceiveData\000"
	.4byte	0x2dd
	.ascii	"CEC_StartOfMessage\000"
	.4byte	0x2ef
	.ascii	"CEC_EndOfMessage\000"
	.4byte	0x301
	.ascii	"CEC_ITConfig\000"
	.4byte	0x336
	.ascii	"CEC_GetFlagStatus\000"
	.4byte	0x36f
	.ascii	"CEC_ClearFlag\000"
	.4byte	0x395
	.ascii	"CEC_GetITStatus\000"
	.4byte	0x3dd
	.ascii	"CEC_ClearITPendingBit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x122
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x400
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
	.4byte	0x134
	.ascii	"CEC_TypeDef\000"
	.4byte	0x19d
	.ascii	"CEC_InitTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x94
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF32:
	.ascii	"CEC_Cmd\000"
.LASF23:
	.ascii	"CEC_StopReception\000"
.LASF0:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"CFGR\000"
.LASF20:
	.ascii	"CEC_TypeDef\000"
.LASF51:
	.ascii	"enablestatus\000"
.LASF21:
	.ascii	"CEC_SignalFreeTime\000"
.LASF34:
	.ascii	"CEC_ListenModeCmd\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF16:
	.ascii	"FunctionalState\000"
.LASF54:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF47:
	.ascii	"bitstatus\000"
.LASF27:
	.ascii	"CEC_SFTOption\000"
.LASF53:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_cec.c\000"
.LASF29:
	.ascii	"CEC_Init\000"
.LASF31:
	.ascii	"CEC_InitStruct\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"TXDR\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF55:
	.ascii	"CEC_ReceiveData\000"
.LASF11:
	.ascii	"RESET\000"
.LASF46:
	.ascii	"CEC_FLAG\000"
.LASF24:
	.ascii	"CEC_BitRisingError\000"
.LASF40:
	.ascii	"CEC_SendData\000"
.LASF41:
	.ascii	"Data\000"
.LASF26:
	.ascii	"CEC_BRDNoGen\000"
.LASF45:
	.ascii	"CEC_IT\000"
.LASF43:
	.ascii	"CEC_EndOfMessage\000"
.LASF52:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF30:
	.ascii	"CEC_StructInit\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF25:
	.ascii	"CEC_LongBitPeriodError\000"
.LASF35:
	.ascii	"CEC_OwnAddressConfig\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF38:
	.ascii	"CEC_DeInit\000"
.LASF8:
	.ascii	"long long int\000"
.LASF42:
	.ascii	"CEC_StartOfMessage\000"
.LASF50:
	.ascii	"CEC_GetITStatus\000"
.LASF37:
	.ascii	"tmpreg\000"
.LASF2:
	.ascii	"short int\000"
.LASF33:
	.ascii	"NewState\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF15:
	.ascii	"ENABLE\000"
.LASF19:
	.ascii	"RXDR\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF13:
	.ascii	"ITStatus\000"
.LASF56:
	.ascii	"CEC_ClearITPendingBit\000"
.LASF48:
	.ascii	"CEC_ClearFlag\000"
.LASF36:
	.ascii	"CEC_OwnAddress\000"
.LASF14:
	.ascii	"DISABLE\000"
.LASF49:
	.ascii	"CEC_GetFlagStatus\000"
.LASF22:
	.ascii	"CEC_RxTolerance\000"
.LASF44:
	.ascii	"CEC_ITConfig\000"
.LASF28:
	.ascii	"CEC_InitTypeDef\000"
.LASF39:
	.ascii	"CEC_OwnAddressClear\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
