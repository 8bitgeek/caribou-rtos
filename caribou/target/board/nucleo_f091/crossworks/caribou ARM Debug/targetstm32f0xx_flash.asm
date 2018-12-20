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
	.file	"stm32f0xx_flash.c"
	.text
.Ltext0:
	.section	.text.FLASH_SetLatency,"ax",%progbits
	.align	2
	.global	FLASH_SetLatency
	.code	16
	.thumb_func
	.type	FLASH_SetLatency, %function
FLASH_SetLatency:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_flash.c"
	.loc 1 136 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 137 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 143 0
	ldr	r3, .L2
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 146 0
	ldr	r3, [r7, #12]
	movs	r2, #1
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 147 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 150 0
	ldr	r3, .L2
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 151 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073881088
.LFE32:
	.size	FLASH_SetLatency, .-FLASH_SetLatency
	.section	.text.FLASH_PrefetchBufferCmd,"ax",%progbits
	.align	2
	.global	FLASH_PrefetchBufferCmd
	.code	16
	.thumb_func
	.type	FLASH_PrefetchBufferCmd, %function
FLASH_PrefetchBufferCmd:
.LFB33:
	.loc 1 160 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 164 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L5
	.loc 1 166 0
	ldr	r3, .L8
	ldr	r2, .L8
	ldr	r2, [r2]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 172 0
	b	.L7
.L5:
	.loc 1 170 0
	ldr	r3, .L8
	ldr	r2, .L8
	ldr	r2, [r2]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3]
.L7:
	.loc 1 172 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	1073881088
.LFE33:
	.size	FLASH_PrefetchBufferCmd, .-FLASH_PrefetchBufferCmd
	.section	.text.FLASH_GetPrefetchBufferStatus,"ax",%progbits
	.align	2
	.global	FLASH_GetPrefetchBufferStatus
	.code	16
	.thumb_func
	.type	FLASH_GetPrefetchBufferStatus, %function
FLASH_GetPrefetchBufferStatus:
.LFB34:
	.loc 1 180 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	.loc 1 181 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 183 0
	ldr	r3, .L14
	ldr	r3, [r3]
	movs	r2, #32
	ands	r3, r2
	beq	.L11
	.loc 1 185 0
	adds	r3, r7, #7
	movs	r2, #1
	strb	r2, [r3]
	b	.L12
.L11:
	.loc 1 189 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
.L12:
	.loc 1 192 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 193 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	1073881088
.LFE34:
	.size	FLASH_GetPrefetchBufferStatus, .-FLASH_GetPrefetchBufferStatus
	.section	.text.FLASH_Unlock,"ax",%progbits
	.align	2
	.global	FLASH_Unlock
	.code	16
	.thumb_func
	.type	FLASH_Unlock, %function
FLASH_Unlock:
.LFB35:
	.loc 1 233 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	.loc 1 234 0
	ldr	r3, .L19
	ldr	r3, [r3, #16]
	movs	r2, #128
	ands	r3, r2
	beq	.L18
	.loc 1 237 0
	ldr	r3, .L19
	ldr	r2, .L19+4
	str	r2, [r3, #4]
	.loc 1 238 0
	ldr	r3, .L19
	ldr	r2, .L19+8
	str	r2, [r3, #4]
.L18:
	.loc 1 240 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073881088
	.word	1164378403
	.word	-839939669
.LFE35:
	.size	FLASH_Unlock, .-FLASH_Unlock
	.section	.text.FLASH_Lock,"ax",%progbits
	.align	2
	.global	FLASH_Lock
	.code	16
	.thumb_func
	.type	FLASH_Lock, %function
FLASH_Lock:
.LFB36:
	.loc 1 248 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	add	r7, sp, #0
.LCFI12:
	.loc 1 250 0
	ldr	r3, .L22
	ldr	r2, .L22
	ldr	r2, [r2, #16]
	movs	r1, #128
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 251 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L23:
	.align	2
.L22:
	.word	1073881088
.LFE36:
	.size	FLASH_Lock, .-FLASH_Lock
	.section	.text.FLASH_ErasePage,"ax",%progbits
	.align	2
	.global	FLASH_ErasePage
	.code	16
	.thumb_func
	.type	FLASH_ErasePage, %function
FLASH_ErasePage:
.LFB37:
	.loc 1 266 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI13:
	sub	sp, sp, #20
.LCFI14:
	add	r7, sp, #0
.LCFI15:
	str	r0, [r7, #4]
	.loc 1 267 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 273 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 275 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L25
	.loc 1 278 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #16]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 279 0
	ldr	r3, .L27
	ldr	r2, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 280 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #16]
	movs	r1, #64
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 283 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 286 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #16]
	movs	r1, #2
	bics	r2, r1
	str	r2, [r3, #16]
.L25:
	.loc 1 290 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 291 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L28:
	.align	2
.L27:
	.word	1073881088
.LFE37:
	.size	FLASH_ErasePage, .-FLASH_ErasePage
	.section	.text.FLASH_EraseAllPages,"ax",%progbits
	.align	2
	.global	FLASH_EraseAllPages
	.code	16
	.thumb_func
	.type	FLASH_EraseAllPages, %function
FLASH_EraseAllPages:
.LFB38:
	.loc 1 304 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI16:
	sub	sp, sp, #12
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	.loc 1 305 0
	adds	r3, r7, #7
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 308 0
	adds	r4, r7, #7
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 310 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L30
	.loc 1 313 0
	ldr	r3, .L32
	ldr	r2, .L32
	ldr	r2, [r2, #16]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 314 0
	ldr	r3, .L32
	ldr	r2, .L32
	ldr	r2, [r2, #16]
	movs	r1, #64
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 317 0
	adds	r4, r7, #7
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 320 0
	ldr	r3, .L32
	ldr	r2, .L32
	ldr	r2, [r2, #16]
	movs	r1, #4
	bics	r2, r1
	str	r2, [r3, #16]
.L30:
	.loc 1 324 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 325 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
.L33:
	.align	2
.L32:
	.word	1073881088
.LFE38:
	.size	FLASH_EraseAllPages, .-FLASH_EraseAllPages
	.section	.text.FLASH_ProgramWord,"ax",%progbits
	.align	2
	.global	FLASH_ProgramWord
	.code	16
	.thumb_func
	.type	FLASH_ProgramWord, %function
FLASH_ProgramWord:
.LFB39:
	.loc 1 339 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI19:
	sub	sp, sp, #20
.LCFI20:
	add	r7, sp, #0
.LCFI21:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 340 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 341 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 347 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 349 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L35
	.loc 1 353 0
	ldr	r3, .L38
	ldr	r2, .L38
	ldr	r2, [r2, #16]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 355 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	uxth	r2, r2
	strh	r2, [r3]
	.loc 1 358 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 360 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L36
	.loc 1 364 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #2
	str	r3, [r7, #8]
	.loc 1 366 0
	ldr	r3, [r7, #8]
	movs	r2, r3
	ldr	r3, [r7]
	lsrs	r3, r3, #16
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 369 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 372 0
	ldr	r3, .L38
	ldr	r2, .L38
	ldr	r2, [r2, #16]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #16]
	b	.L35
.L36:
	.loc 1 377 0
	ldr	r3, .L38
	ldr	r2, .L38
	ldr	r2, [r2, #16]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #16]
.L35:
	.loc 1 382 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 383 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L39:
	.align	2
.L38:
	.word	1073881088
.LFE39:
	.size	FLASH_ProgramWord, .-FLASH_ProgramWord
	.section	.text.FLASH_ProgramHalfWord,"ax",%progbits
	.align	2
	.global	FLASH_ProgramHalfWord
	.code	16
	.thumb_func
	.type	FLASH_ProgramHalfWord, %function
FLASH_ProgramHalfWord:
.LFB40:
	.loc 1 397 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI22:
	sub	sp, sp, #20
.LCFI23:
	add	r7, sp, #0
.LCFI24:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 398 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 404 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 406 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L41
	.loc 1 409 0
	ldr	r3, .L43
	ldr	r2, .L43
	ldr	r2, [r2, #16]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 411 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3]
	.loc 1 414 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 417 0
	ldr	r3, .L43
	ldr	r2, .L43
	ldr	r2, [r2, #16]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #16]
.L41:
	.loc 1 421 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 422 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L44:
	.align	2
.L43:
	.word	1073881088
.LFE40:
	.size	FLASH_ProgramHalfWord, .-FLASH_ProgramHalfWord
	.section	.text.FLASH_OB_Unlock,"ax",%progbits
	.align	2
	.global	FLASH_OB_Unlock
	.code	16
	.thumb_func
	.type	FLASH_OB_Unlock, %function
FLASH_OB_Unlock:
.LFB41:
	.loc 1 487 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	.loc 1 488 0
	ldr	r3, .L48
	ldr	r2, [r3, #16]
	movs	r3, #128
	lsls	r3, r3, #2
	ands	r3, r2
	bne	.L47
	.loc 1 491 0
	ldr	r3, .L48
	ldr	r2, .L48+4
	str	r2, [r3, #8]
	.loc 1 492 0
	ldr	r3, .L48
	ldr	r2, .L48+8
	str	r2, [r3, #8]
.L47:
	.loc 1 494 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L49:
	.align	2
.L48:
	.word	1073881088
	.word	1164378403
	.word	-839939669
.LFE41:
	.size	FLASH_OB_Unlock, .-FLASH_OB_Unlock
	.section	.text.FLASH_OB_Lock,"ax",%progbits
	.align	2
	.global	FLASH_OB_Lock
	.code	16
	.thumb_func
	.type	FLASH_OB_Lock, %function
FLASH_OB_Lock:
.LFB42:
	.loc 1 502 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	.loc 1 504 0
	ldr	r3, .L51
	ldr	r2, .L51
	ldr	r2, [r2, #16]
	ldr	r1, .L51+4
	ands	r2, r1
	str	r2, [r3, #16]
	.loc 1 505 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L52:
	.align	2
.L51:
	.word	1073881088
	.word	-513
.LFE42:
	.size	FLASH_OB_Lock, .-FLASH_OB_Lock
	.section	.text.FLASH_OB_Launch,"ax",%progbits
	.align	2
	.global	FLASH_OB_Launch
	.code	16
	.thumb_func
	.type	FLASH_OB_Launch, %function
FLASH_OB_Launch:
.LFB43:
	.loc 1 513 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	add	r7, sp, #0
.LCFI30:
	.loc 1 515 0
	ldr	r3, .L54
	ldr	r2, .L54
	ldr	r2, [r2, #16]
	movs	r1, #128
	lsls	r1, r1, #6
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 516 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L55:
	.align	2
.L54:
	.word	1073881088
.LFE43:
	.size	FLASH_OB_Launch, .-FLASH_OB_Launch
	.section	.text.FLASH_OB_Erase,"ax",%progbits
	.align	2
	.global	FLASH_OB_Erase
	.code	16
	.thumb_func
	.type	FLASH_OB_Erase, %function
FLASH_OB_Erase:
.LFB44:
	.loc 1 530 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI31:
	sub	sp, sp, #12
.LCFI32:
	add	r7, sp, #0
.LCFI33:
	.loc 1 531 0
	adds	r3, r7, #6
	movs	r2, #170
	strh	r2, [r3]
	.loc 1 533 0
	adds	r3, r7, #5
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 536 0
	bl	FLASH_OB_GetRDP
	subs	r3, r0, #0
	beq	.L57
	.loc 1 538 0
	adds	r3, r7, #6
	movs	r2, #0
	strh	r2, [r3]
.L57:
	.loc 1 542 0
	adds	r4, r7, #5
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 544 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L58
	.loc 1 547 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2, #16]
	movs	r1, #32
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 548 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2, #16]
	movs	r1, #64
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 551 0
	adds	r4, r7, #5
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 553 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L59
	.loc 1 556 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2, #16]
	movs	r1, #32
	bics	r2, r1
	str	r2, [r3, #16]
	.loc 1 559 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 562 0
	ldr	r2, .L62+4
	adds	r3, r7, #6
	ldrh	r3, [r3]
	strh	r3, [r2]
	.loc 1 565 0
	adds	r4, r7, #5
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 567 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L58
	.loc 1 570 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
	b	.L58
.L59:
	.loc 1 575 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L58
	.loc 1 578 0
	ldr	r3, .L62
	ldr	r2, .L62
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L58:
	.loc 1 583 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	.loc 1 584 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
.L63:
	.align	2
.L62:
	.word	1073881088
	.word	536868864
.LFE44:
	.size	FLASH_OB_Erase, .-FLASH_OB_Erase
	.section	.text.FLASH_OB_EnableWRP,"ax",%progbits
	.align	2
	.global	FLASH_OB_EnableWRP
	.code	16
	.thumb_func
	.type	FLASH_OB_EnableWRP, %function
FLASH_OB_EnableWRP:
.LFB45:
	.loc 1 600 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI34:
	sub	sp, sp, #20
.LCFI35:
	add	r7, sp, #0
.LCFI36:
	str	r0, [r7, #4]
	.loc 1 601 0
	movs	r3, #12
	adds	r3, r7, r3
	movs	r2, #1
	rsbs	r2, r2, #0
	strh	r2, [r3]
	movs	r3, #10
	adds	r3, r7, r3
	movs	r2, #1
	rsbs	r2, r2, #0
	strh	r2, [r3]
	.loc 1 603 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 608 0
	ldr	r3, [r7, #4]
	mvns	r3, r3
	str	r3, [r7, #4]
	.loc 1 609 0
	ldr	r3, [r7, #4]
	uxth	r2, r3
	movs	r3, #12
	adds	r3, r7, r3
	movs	r1, #255
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 610 0
	ldr	r3, [r7, #4]
	lsrs	r3, r3, #8
	uxth	r2, r3
	movs	r3, #10
	adds	r3, r7, r3
	movs	r1, #255
	ands	r2, r1
	strh	r2, [r3]
	.loc 1 613 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 615 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L65
	.loc 1 617 0
	ldr	r3, .L69
	ldr	r2, .L69
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 619 0
	movs	r3, #12
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #255
	beq	.L66
	.loc 1 621 0
	ldr	r2, .L69+4
	movs	r3, #12
	adds	r3, r7, r3
	ldrh	r3, [r3]
	strh	r3, [r2, #8]
	.loc 1 624 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
.L66:
	.loc 1 626 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L67
	.loc 1 626 0 is_stmt 0 discriminator 1
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	cmp	r3, #255
	beq	.L67
	.loc 1 628 0 is_stmt 1
	ldr	r2, .L69+4
	movs	r3, #10
	adds	r3, r7, r3
	ldrh	r3, [r3]
	strh	r3, [r2, #10]
	.loc 1 631 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
.L67:
	.loc 1 634 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L65
	.loc 1 637 0
	ldr	r3, .L69
	ldr	r2, .L69
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L65:
	.loc 1 641 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 642 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L70:
	.align	2
.L69:
	.word	1073881088
	.word	536868864
.LFE45:
	.size	FLASH_OB_EnableWRP, .-FLASH_OB_EnableWRP
	.section	.text.FLASH_OB_RDPConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_RDPConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_RDPConfig, %function
FLASH_OB_RDPConfig:
.LFB46:
	.loc 1 659 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI37:
	sub	sp, sp, #20
.LCFI38:
	add	r7, sp, #0
.LCFI39:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 660 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 664 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 666 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L72
	.loc 1 668 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #16]
	movs	r1, #32
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 669 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #16]
	movs	r1, #64
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 672 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 674 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L73
	.loc 1 677 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #16]
	movs	r1, #32
	bics	r2, r1
	str	r2, [r3, #16]
	.loc 1 680 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 682 0
	ldr	r2, .L76+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 685 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 687 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L72
	.loc 1 690 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
	b	.L72
.L73:
	.loc 1 695 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L72
	.loc 1 698 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #16]
	movs	r1, #32
	bics	r2, r1
	str	r2, [r3, #16]
.L72:
	.loc 1 703 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 704 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L77:
	.align	2
.L76:
	.word	1073881088
	.word	536868864
.LFE46:
	.size	FLASH_OB_RDPConfig, .-FLASH_OB_RDPConfig
	.section	.text.FLASH_OB_UserConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_UserConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_UserConfig, %function
FLASH_OB_UserConfig:
.LFB47:
	.loc 1 728 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI40:
	sub	sp, sp, #20
.LCFI41:
	add	r7, sp, #0
.LCFI42:
	movs	r4, r0
	movs	r0, r1
	movs	r1, r2
	adds	r3, r7, #7
	adds	r2, r4, #0
	strb	r2, [r3]
	adds	r3, r7, #6
	adds	r2, r0, #0
	strb	r2, [r3]
	adds	r3, r7, #5
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 729 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 737 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 739 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L79
	.loc 1 742 0
	ldr	r3, .L81
	ldr	r2, .L81
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 744 0
	ldr	r1, .L81+4
	adds	r2, r7, #7
	adds	r3, r7, #6
	ldrb	r2, [r2]
	ldrb	r3, [r3]
	orrs	r3, r2
	uxtb	r2, r3
	adds	r3, r7, #5
	ldrb	r3, [r3]
	orrs	r3, r2
	uxtb	r3, r3
	movs	r2, #8
	rsbs	r2, r2, #0
	orrs	r3, r2
	uxtb	r3, r3
	uxth	r3, r3
	strh	r3, [r1, #2]
	.loc 1 747 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 749 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L79
	.loc 1 752 0
	ldr	r3, .L81
	ldr	r2, .L81
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L79:
	.loc 1 756 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 757 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L82:
	.align	2
.L81:
	.word	1073881088
	.word	536868864
.LFE47:
	.size	FLASH_OB_UserConfig, .-FLASH_OB_UserConfig
	.section	.text.FLASH_OB_BOOTConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_BOOTConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_BOOTConfig, %function
FLASH_OB_BOOTConfig:
.LFB48:
	.loc 1 768 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI43:
	sub	sp, sp, #20
.LCFI44:
	add	r7, sp, #0
.LCFI45:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 769 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 775 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 777 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L84
	.loc 1 780 0
	ldr	r3, .L86
	ldr	r2, .L86
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 782 0
	ldr	r1, .L86+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #17
	rsbs	r2, r2, #0
	orrs	r3, r2
	uxtb	r3, r3
	uxth	r3, r3
	strh	r3, [r1, #2]
	.loc 1 785 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 787 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L84
	.loc 1 790 0
	ldr	r3, .L86
	ldr	r2, .L86
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L84:
	.loc 1 794 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 795 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L87:
	.align	2
.L86:
	.word	1073881088
	.word	536868864
.LFE48:
	.size	FLASH_OB_BOOTConfig, .-FLASH_OB_BOOTConfig
	.section	.text.FLASH_OB_VDDAConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_VDDAConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_VDDAConfig, %function
FLASH_OB_VDDAConfig:
.LFB49:
	.loc 1 806 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI46:
	sub	sp, sp, #20
.LCFI47:
	add	r7, sp, #0
.LCFI48:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 807 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 813 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 815 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L89
	.loc 1 818 0
	ldr	r3, .L91
	ldr	r2, .L91
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 820 0
	ldr	r1, .L91+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #33
	rsbs	r2, r2, #0
	orrs	r3, r2
	uxtb	r3, r3
	uxth	r3, r3
	strh	r3, [r1, #2]
	.loc 1 823 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 825 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L89
	.loc 1 828 0
	ldr	r3, .L91
	ldr	r2, .L91
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L89:
	.loc 1 832 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 833 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L92:
	.align	2
.L91:
	.word	1073881088
	.word	536868864
.LFE49:
	.size	FLASH_OB_VDDAConfig, .-FLASH_OB_VDDAConfig
	.section	.text.FLASH_OB_SRAMParityConfig,"ax",%progbits
	.align	2
	.global	FLASH_OB_SRAMParityConfig
	.code	16
	.thumb_func
	.type	FLASH_OB_SRAMParityConfig, %function
FLASH_OB_SRAMParityConfig:
.LFB50:
	.loc 1 844 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI49:
	sub	sp, sp, #20
.LCFI50:
	add	r7, sp, #0
.LCFI51:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 845 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 851 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 853 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L94
	.loc 1 856 0
	ldr	r3, .L96
	ldr	r2, .L96
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 858 0
	ldr	r1, .L96+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #65
	rsbs	r2, r2, #0
	orrs	r3, r2
	uxtb	r3, r3
	uxth	r3, r3
	strh	r3, [r1, #2]
	.loc 1 861 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 863 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L94
	.loc 1 866 0
	ldr	r3, .L96
	ldr	r2, .L96
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L94:
	.loc 1 870 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 871 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L97:
	.align	2
.L96:
	.word	1073881088
	.word	536868864
.LFE50:
	.size	FLASH_OB_SRAMParityConfig, .-FLASH_OB_SRAMParityConfig
	.section	.text.FLASH_OB_WriteUser,"ax",%progbits
	.align	2
	.global	FLASH_OB_WriteUser
	.code	16
	.thumb_func
	.type	FLASH_OB_WriteUser, %function
FLASH_OB_WriteUser:
.LFB51:
	.loc 1 892 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI52:
	sub	sp, sp, #20
.LCFI53:
	add	r7, sp, #0
.LCFI54:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 893 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 896 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 898 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L99
	.loc 1 901 0
	ldr	r3, .L101
	ldr	r2, .L101
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 903 0
	ldr	r1, .L101+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #120
	rsbs	r2, r2, #0
	orrs	r3, r2
	uxtb	r3, r3
	uxth	r3, r3
	strh	r3, [r1, #2]
	.loc 1 906 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 908 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L99
	.loc 1 911 0
	ldr	r3, .L101
	ldr	r2, .L101
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L99:
	.loc 1 915 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 917 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L102:
	.align	2
.L101:
	.word	1073881088
	.word	536868864
.LFE51:
	.size	FLASH_OB_WriteUser, .-FLASH_OB_WriteUser
	.section	.text.FLASH_ProgramOptionByteData,"ax",%progbits
	.align	2
	.global	FLASH_ProgramOptionByteData
	.code	16
	.thumb_func
	.type	FLASH_ProgramOptionByteData, %function
FLASH_ProgramOptionByteData:
.LFB52:
	.loc 1 932 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI55:
	sub	sp, sp, #20
.LCFI56:
	add	r7, sp, #0
.LCFI57:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 933 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 936 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 938 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #4
	bne	.L104
	.loc 1 941 0
	ldr	r3, .L106
	ldr	r2, .L106
	ldr	r2, [r2, #16]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 942 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #3
	ldrb	r2, [r2]
	uxth	r2, r2
	strh	r2, [r3]
	.loc 1 945 0
	movs	r3, #15
	adds	r4, r7, r3
	movs	r3, #176
	lsls	r3, r3, #12
	movs	r0, r3
	bl	FLASH_WaitForLastOperation
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 947 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #5
	beq	.L104
	.loc 1 950 0
	ldr	r3, .L106
	ldr	r2, .L106
	ldr	r2, [r2, #16]
	movs	r1, #16
	bics	r2, r1
	str	r2, [r3, #16]
.L104:
	.loc 1 954 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 955 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L107:
	.align	2
.L106:
	.word	1073881088
.LFE52:
	.size	FLASH_ProgramOptionByteData, .-FLASH_ProgramOptionByteData
	.section	.text.FLASH_OB_GetUser,"ax",%progbits
	.align	2
	.global	FLASH_OB_GetUser
	.code	16
	.thumb_func
	.type	FLASH_OB_GetUser, %function
FLASH_OB_GetUser:
.LFB53:
	.loc 1 963 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	.loc 1 965 0
	ldr	r3, .L110
	ldr	r3, [r3, #28]
	lsrs	r3, r3, #8
	uxtb	r3, r3
	.loc 1 966 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L111:
	.align	2
.L110:
	.word	1073881088
.LFE53:
	.size	FLASH_OB_GetUser, .-FLASH_OB_GetUser
	.section	.text.FLASH_OB_GetWRP,"ax",%progbits
	.align	2
	.global	FLASH_OB_GetWRP
	.code	16
	.thumb_func
	.type	FLASH_OB_GetWRP, %function
FLASH_OB_GetWRP:
.LFB54:
	.loc 1 974 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	add	r7, sp, #0
.LCFI61:
	.loc 1 976 0
	ldr	r3, .L114
	ldr	r3, [r3, #32]
	.loc 1 977 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L115:
	.align	2
.L114:
	.word	1073881088
.LFE54:
	.size	FLASH_OB_GetWRP, .-FLASH_OB_GetWRP
	.section	.text.FLASH_OB_GetRDP,"ax",%progbits
	.align	2
	.global	FLASH_OB_GetRDP
	.code	16
	.thumb_func
	.type	FLASH_OB_GetRDP, %function
FLASH_OB_GetRDP:
.LFB55:
	.loc 1 985 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI62:
	sub	sp, sp, #8
.LCFI63:
	add	r7, sp, #0
.LCFI64:
	.loc 1 986 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 988 0
	ldr	r3, .L120
	ldr	r3, [r3, #28]
	movs	r2, r3
	movs	r3, #6
	ands	r3, r2
	beq	.L117
	.loc 1 990 0
	adds	r3, r7, #7
	movs	r2, #1
	strb	r2, [r3]
	b	.L118
.L117:
	.loc 1 994 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
.L118:
	.loc 1 996 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 997 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L121:
	.align	2
.L120:
	.word	1073881088
.LFE55:
	.size	FLASH_OB_GetRDP, .-FLASH_OB_GetRDP
	.section	.text.FLASH_ITConfig,"ax",%progbits
	.align	2
	.global	FLASH_ITConfig
	.code	16
	.thumb_func
	.type	FLASH_ITConfig, %function
FLASH_ITConfig:
.LFB56:
	.loc 1 1025 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI65:
	sub	sp, sp, #8
.LCFI66:
	add	r7, sp, #0
.LCFI67:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 1030 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L123
	.loc 1 1033 0
	ldr	r3, .L126
	ldr	r2, .L126
	ldr	r1, [r2, #16]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #16]
	.loc 1 1040 0
	b	.L125
.L123:
	.loc 1 1038 0
	ldr	r3, .L126
	ldr	r2, .L126
	ldr	r2, [r2, #16]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #16]
.L125:
	.loc 1 1040 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L127:
	.align	2
.L126:
	.word	1073881088
.LFE56:
	.size	FLASH_ITConfig, .-FLASH_ITConfig
	.section	.text.FLASH_GetFlagStatus,"ax",%progbits
	.align	2
	.global	FLASH_GetFlagStatus
	.code	16
	.thumb_func
	.type	FLASH_GetFlagStatus, %function
FLASH_GetFlagStatus:
.LFB57:
	.loc 1 1053 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI68:
	sub	sp, sp, #16
.LCFI69:
	add	r7, sp, #0
.LCFI70:
	str	r0, [r7, #4]
	.loc 1 1054 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 1059 0
	ldr	r3, .L132
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L129
	.loc 1 1061 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L130
.L129:
	.loc 1 1065 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L130:
	.loc 1 1068 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1069 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L133:
	.align	2
.L132:
	.word	1073881088
.LFE57:
	.size	FLASH_GetFlagStatus, .-FLASH_GetFlagStatus
	.section	.text.FLASH_ClearFlag,"ax",%progbits
	.align	2
	.global	FLASH_ClearFlag
	.code	16
	.thumb_func
	.type	FLASH_ClearFlag, %function
FLASH_ClearFlag:
.LFB58:
	.loc 1 1081 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI71:
	sub	sp, sp, #8
.LCFI72:
	add	r7, sp, #0
.LCFI73:
	str	r0, [r7, #4]
	.loc 1 1086 0
	ldr	r3, .L135
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 1087 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L136:
	.align	2
.L135:
	.word	1073881088
.LFE58:
	.size	FLASH_ClearFlag, .-FLASH_ClearFlag
	.section	.text.FLASH_GetStatus,"ax",%progbits
	.align	2
	.global	FLASH_GetStatus
	.code	16
	.thumb_func
	.type	FLASH_GetStatus, %function
FLASH_GetStatus:
.LFB59:
	.loc 1 1096 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI74:
	sub	sp, sp, #8
.LCFI75:
	add	r7, sp, #0
.LCFI76:
	.loc 1 1097 0
	adds	r3, r7, #7
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 1099 0
	ldr	r3, .L143
	ldr	r3, [r3, #12]
	movs	r2, #1
	ands	r3, r2
	beq	.L138
	.loc 1 1101 0
	adds	r3, r7, #7
	movs	r2, #1
	strb	r2, [r3]
	b	.L139
.L138:
	.loc 1 1105 0
	ldr	r3, .L143
	ldr	r3, [r3, #12]
	movs	r2, #16
	ands	r3, r2
	beq	.L140
	.loc 1 1107 0
	adds	r3, r7, #7
	movs	r2, #2
	strb	r2, [r3]
	b	.L139
.L140:
	.loc 1 1111 0
	ldr	r3, .L143
	ldr	r3, [r3, #12]
	movs	r2, #4
	ands	r3, r2
	beq	.L141
	.loc 1 1113 0
	adds	r3, r7, #7
	movs	r2, #3
	strb	r2, [r3]
	b	.L139
.L141:
	.loc 1 1117 0
	adds	r3, r7, #7
	movs	r2, #4
	strb	r2, [r3]
.L139:
	.loc 1 1122 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 1123 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L144:
	.align	2
.L143:
	.word	1073881088
.LFE59:
	.size	FLASH_GetStatus, .-FLASH_GetStatus
	.section	.text.FLASH_WaitForLastOperation,"ax",%progbits
	.align	2
	.global	FLASH_WaitForLastOperation
	.code	16
	.thumb_func
	.type	FLASH_WaitForLastOperation, %function
FLASH_WaitForLastOperation:
.LFB60:
	.loc 1 1133 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI77:
	sub	sp, sp, #20
.LCFI78:
	add	r7, sp, #0
.LCFI79:
	str	r0, [r7, #4]
	.loc 1 1134 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #4
	strb	r2, [r3]
	.loc 1 1137 0
	movs	r3, #15
	adds	r4, r7, r3
	bl	FLASH_GetStatus
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 1140 0
	b	.L146
.L148:
	.loc 1 1142 0
	movs	r3, #15
	adds	r4, r7, r3
	bl	FLASH_GetStatus
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 1143 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L146:
	.loc 1 1140 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #1
	bne	.L147
	.loc 1 1140 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L148
.L147:
	.loc 1 1146 0 is_stmt 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L149
	.loc 1 1148 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #5
	strb	r2, [r3]
.L149:
	.loc 1 1151 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 1152 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.LFE60:
	.size	FLASH_WaitForLastOperation, .-FLASH_WaitForLastOperation
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
	.uleb128 0x18
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
	.4byte	.LCFI13-.LFB37
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
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
	.4byte	.LCFI16-.LFB38
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x18
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
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
	.4byte	.LCFI25-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
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
	.4byte	.LCFI27-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
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
	.4byte	.LCFI29-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
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
	.4byte	.LCFI43-.LFB48
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
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
	.4byte	.LCFI46-.LFB49
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
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
	.4byte	.LCFI49-.LFB50
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
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
	.4byte	.LCFI52-.LFB51
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
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
	.4byte	.LCFI55-.LFB52
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
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
	.4byte	.LCFI58-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
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
	.4byte	.LCFI60-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
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
	.4byte	.LCFI62-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
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
	.4byte	.LCFI65-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
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
	.4byte	.LCFI68-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
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
	.4byte	.LCFI71-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
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
	.4byte	.LCFI74-.LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
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
	.4byte	.LCFI77-.LFB60
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE56:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_flash.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x763
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0xc
	.4byte	.LASF88
	.4byte	.LASF89
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
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
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
	.byte	0x24
	.byte	0x3
	.2byte	0x16c
	.4byte	0x14e
	.uleb128 0xa
	.ascii	"ACR\000"
	.byte	0x3
	.2byte	0x16e
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x16f
	.4byte	0x85
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x170
	.4byte	0x85
	.byte	0x8
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x171
	.4byte	0x85
	.byte	0xc
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x172
	.4byte	0x85
	.byte	0x10
	.uleb128 0xa
	.ascii	"AR\000"
	.byte	0x3
	.2byte	0x173
	.4byte	0x85
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x174
	.4byte	0x85
	.byte	0x18
	.uleb128 0xa
	.ascii	"OBR\000"
	.byte	0x3
	.2byte	0x175
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x176
	.4byte	0x85
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x177
	.4byte	0xd2
	.uleb128 0x9
	.byte	0xc
	.byte	0x3
	.2byte	0x17d
	.4byte	0x1b2
	.uleb128 0xa
	.ascii	"RDP\000"
	.byte	0x3
	.2byte	0x17f
	.4byte	0x1b2
	.byte	0
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x180
	.4byte	0x1b2
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x181
	.4byte	0x45
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x182
	.4byte	0x45
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x183
	.4byte	0x1b2
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x184
	.4byte	0x1b2
	.byte	0xa
	.byte	0
	.uleb128 0x5
	.4byte	0x45
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x185
	.4byte	0x15a
	.uleb128 0x6
	.byte	0x1
	.4byte	0x37
	.byte	0x4
	.byte	0x36
	.4byte	0x1ee
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x5
	.byte	0
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0x3c
	.4byte	0x1c3
	.uleb128 0xd
	.4byte	.LASF33
	.byte	0x1
	.byte	0x87
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x22b
	.uleb128 0xe
	.4byte	.LASF35
	.byte	0x1
	.byte	0x87
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF37
	.byte	0x1
	.byte	0x89
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x1
	.byte	0x9f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24f
	.uleb128 0xe
	.4byte	.LASF36
	.byte	0x1
	.byte	0x9f
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF41
	.byte	0x1
	.byte	0xb3
	.4byte	0xa3
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x277
	.uleb128 0xf
	.4byte	.LASF38
	.byte	0x1
	.byte	0xb5
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0xe8
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF40
	.byte	0x1
	.byte	0xf7
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x109
	.4byte	0x1ee
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d2
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x109
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x10b
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x12f
	.4byte	0x1ee
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2fc
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x131
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x152
	.4byte	0x1ee
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x353
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x152
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x152
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x154
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x15
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x155
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x18c
	.4byte	0x1ee
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x39b
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x18c
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x18c
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x18e
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x16
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1e6
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1f5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x16
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x200
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x211
	.4byte	0x1ee
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x40a
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x213
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x215
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.byte	0
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x257
	.4byte	0x1ee
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x461
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x257
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x259
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x259
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x25b
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x292
	.4byte	0x1ee
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x49a
	.uleb128 0x13
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x292
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x294
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x1ee
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4f1
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x2d7
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x2d9
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x2ff
	.4byte	0x1ee
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x52a
	.uleb128 0x13
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x2ff
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x301
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x325
	.4byte	0x1ee
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x563
	.uleb128 0x13
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x325
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x327
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x34b
	.4byte	0x1ee
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59c
	.uleb128 0x13
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x34b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x34d
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x37b
	.4byte	0x1ee
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d5
	.uleb128 0x13
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x37b
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x37d
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x12
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x1ee
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61d
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x3a3
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x3a5
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x17
	.4byte	.LASF74
	.byte	0x1
	.2byte	0x3c2
	.4byte	0x2c
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF75
	.byte	0x1
	.2byte	0x3cd
	.4byte	0x5e
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x3d8
	.4byte	0xa3
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x673
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0x1
	.2byte	0x3da
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF78
	.byte	0x1
	.2byte	0x400
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a8
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x400
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x400
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x18
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x41c
	.4byte	0xa3
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6e1
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x41c
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x41e
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x19
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x438
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x707
	.uleb128 0x13
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x438
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x447
	.4byte	0x1ee
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x731
	.uleb128 0x14
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x449
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x46c
	.4byte	0x1ee
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x46c
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x46e
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x11
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
	.uleb128 0x2117
	.uleb128 0x19
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x32d
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x767
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0xba
	.ascii	"DISABLE\000"
	.4byte	0xc0
	.ascii	"ENABLE\000"
	.4byte	0x1cf
	.ascii	"FLASH_BUSY\000"
	.4byte	0x1d5
	.ascii	"FLASH_ERROR_WRP\000"
	.4byte	0x1db
	.ascii	"FLASH_ERROR_PROGRAM\000"
	.4byte	0x1e1
	.ascii	"FLASH_COMPLETE\000"
	.4byte	0x1e7
	.ascii	"FLASH_TIMEOUT\000"
	.4byte	0x1f9
	.ascii	"FLASH_SetLatency\000"
	.4byte	0x22b
	.ascii	"FLASH_PrefetchBufferCmd\000"
	.4byte	0x24f
	.ascii	"FLASH_GetPrefetchBufferStatus\000"
	.4byte	0x277
	.ascii	"FLASH_Unlock\000"
	.4byte	0x288
	.ascii	"FLASH_Lock\000"
	.4byte	0x299
	.ascii	"FLASH_ErasePage\000"
	.4byte	0x2d2
	.ascii	"FLASH_EraseAllPages\000"
	.4byte	0x2fc
	.ascii	"FLASH_ProgramWord\000"
	.4byte	0x353
	.ascii	"FLASH_ProgramHalfWord\000"
	.4byte	0x39b
	.ascii	"FLASH_OB_Unlock\000"
	.4byte	0x3ad
	.ascii	"FLASH_OB_Lock\000"
	.4byte	0x3bf
	.ascii	"FLASH_OB_Launch\000"
	.4byte	0x3d1
	.ascii	"FLASH_OB_Erase\000"
	.4byte	0x40a
	.ascii	"FLASH_OB_EnableWRP\000"
	.4byte	0x461
	.ascii	"FLASH_OB_RDPConfig\000"
	.4byte	0x49a
	.ascii	"FLASH_OB_UserConfig\000"
	.4byte	0x4f1
	.ascii	"FLASH_OB_BOOTConfig\000"
	.4byte	0x52a
	.ascii	"FLASH_OB_VDDAConfig\000"
	.4byte	0x563
	.ascii	"FLASH_OB_SRAMParityConfig\000"
	.4byte	0x59c
	.ascii	"FLASH_OB_WriteUser\000"
	.4byte	0x5d5
	.ascii	"FLASH_ProgramOptionByteData\000"
	.4byte	0x61d
	.ascii	"FLASH_OB_GetUser\000"
	.4byte	0x633
	.ascii	"FLASH_OB_GetWRP\000"
	.4byte	0x649
	.ascii	"FLASH_OB_GetRDP\000"
	.4byte	0x673
	.ascii	"FLASH_ITConfig\000"
	.4byte	0x6a8
	.ascii	"FLASH_GetFlagStatus\000"
	.4byte	0x6e1
	.ascii	"FLASH_ClearFlag\000"
	.4byte	0x707
	.ascii	"FLASH_GetStatus\000"
	.4byte	0x731
	.ascii	"FLASH_WaitForLastOperation\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x123
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x767
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
	.4byte	0xc7
	.ascii	"FunctionalState\000"
	.4byte	0x14e
	.ascii	"FLASH_TypeDef\000"
	.4byte	0x1b7
	.ascii	"OB_TypeDef\000"
	.4byte	0x1ee
	.ascii	"FLASH_Status\000"
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
.LASF78:
	.ascii	"FLASH_ITConfig\000"
.LASF70:
	.ascii	"OB_SRAM_Parity\000"
.LASF60:
	.ascii	"OB_RDP\000"
.LASF62:
	.ascii	"OB_IWDG\000"
.LASF71:
	.ascii	"FLASH_OB_WriteUser\000"
.LASF28:
	.ascii	"FLASH_ERROR_WRP\000"
.LASF66:
	.ascii	"OB_BOOT1\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF35:
	.ascii	"FLASH_Latency\000"
.LASF59:
	.ascii	"FLASH_OB_RDPConfig\000"
.LASF75:
	.ascii	"FLASH_OB_GetWRP\000"
.LASF74:
	.ascii	"FLASH_OB_GetUser\000"
.LASF51:
	.ascii	"FLASH_OB_Lock\000"
.LASF47:
	.ascii	"Address\000"
.LASF56:
	.ascii	"OB_WRP\000"
.LASF2:
	.ascii	"short int\000"
.LASF61:
	.ascii	"FLASH_OB_UserConfig\000"
.LASF39:
	.ascii	"FLASH_Unlock\000"
.LASF45:
	.ascii	"FLASH_EraseAllPages\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF32:
	.ascii	"FLASH_Status\000"
.LASF54:
	.ascii	"rdptmp\000"
.LASF36:
	.ascii	"NewState\000"
.LASF24:
	.ascii	"WRP0\000"
.LASF25:
	.ascii	"WRP1\000"
.LASF42:
	.ascii	"FLASH_ErasePage\000"
.LASF13:
	.ascii	"DISABLE\000"
.LASF17:
	.ascii	"OPTKEYR\000"
.LASF8:
	.ascii	"long long int\000"
.LASF19:
	.ascii	"WRPR\000"
.LASF48:
	.ascii	"Data\000"
.LASF55:
	.ascii	"FLASH_OB_EnableWRP\000"
.LASF52:
	.ascii	"FLASH_OB_Launch\000"
.LASF37:
	.ascii	"tmpreg\000"
.LASF16:
	.ascii	"KEYR\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF43:
	.ascii	"Page_Address\000"
.LASF41:
	.ascii	"FLASH_GetPrefetchBufferStatus\000"
.LASF40:
	.ascii	"FLASH_Lock\000"
.LASF67:
	.ascii	"FLASH_OB_VDDAConfig\000"
.LASF88:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_flash.c\000"
.LASF50:
	.ascii	"FLASH_OB_Unlock\000"
.LASF34:
	.ascii	"FLASH_PrefetchBufferCmd\000"
.LASF0:
	.ascii	"signed char\000"
.LASF80:
	.ascii	"FLASH_GetFlagStatus\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF77:
	.ascii	"readstatus\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF82:
	.ascii	"FLASH_ClearFlag\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF30:
	.ascii	"FLASH_COMPLETE\000"
.LASF27:
	.ascii	"FLASH_BUSY\000"
.LASF58:
	.ascii	"WRP1_Data\000"
.LASF31:
	.ascii	"FLASH_TIMEOUT\000"
.LASF69:
	.ascii	"FLASH_OB_SRAMParityConfig\000"
.LASF44:
	.ascii	"status\000"
.LASF87:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF86:
	.ascii	"Timeout\000"
.LASF68:
	.ascii	"OB_VDDA_ANALOG\000"
.LASF64:
	.ascii	"OB_STDBY\000"
.LASF84:
	.ascii	"FLASHstatus\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF57:
	.ascii	"WRP0_Data\000"
.LASF53:
	.ascii	"FLASH_OB_Erase\000"
.LASF83:
	.ascii	"FLASH_GetStatus\000"
.LASF26:
	.ascii	"OB_TypeDef\000"
.LASF33:
	.ascii	"FLASH_SetLatency\000"
.LASF73:
	.ascii	"FLASH_ProgramOptionByteData\000"
.LASF22:
	.ascii	"RESERVED0\000"
.LASF23:
	.ascii	"RESERVED1\000"
.LASF49:
	.ascii	"FLASH_ProgramHalfWord\000"
.LASF81:
	.ascii	"FLASH_FLAG\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF89:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF11:
	.ascii	"RESET\000"
.LASF21:
	.ascii	"USER\000"
.LASF29:
	.ascii	"FLASH_ERROR_PROGRAM\000"
.LASF79:
	.ascii	"FLASH_IT\000"
.LASF46:
	.ascii	"FLASH_ProgramWord\000"
.LASF18:
	.ascii	"RESERVED\000"
.LASF72:
	.ascii	"OB_USER\000"
.LASF20:
	.ascii	"FLASH_TypeDef\000"
.LASF85:
	.ascii	"FLASH_WaitForLastOperation\000"
.LASF38:
	.ascii	"bitstatus\000"
.LASF63:
	.ascii	"OB_STOP\000"
.LASF65:
	.ascii	"FLASH_OB_BOOTConfig\000"
.LASF12:
	.ascii	"FlagStatus\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF76:
	.ascii	"FLASH_OB_GetRDP\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
