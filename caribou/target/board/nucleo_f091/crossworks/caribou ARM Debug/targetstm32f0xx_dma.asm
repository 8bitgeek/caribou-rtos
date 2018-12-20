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
	.file	"stm32f0xx_dma.c"
	.text
.Ltext0:
	.section	.text.DMA_DeInit,"ax",%progbits
	.align	2
	.global	DMA_DeInit
	.code	16
	.thumb_func
	.type	DMA_DeInit, %function
DMA_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dma.c"
	.loc 1 127 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 132 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L8
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 135 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 138 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 141 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 144 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 146 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+4
	cmp	r3, r2
	bne	.L2
	.loc 1 149 0
	ldr	r3, .L8+8
	ldr	r2, .L8+8
	ldr	r2, [r2, #4]
	movs	r1, #15
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 174 0
	b	.L7
.L2:
	.loc 1 151 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+12
	cmp	r3, r2
	bne	.L4
	.loc 1 154 0
	ldr	r3, .L8+8
	ldr	r2, .L8+8
	ldr	r2, [r2, #4]
	movs	r1, #240
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 174 0
	b	.L7
.L4:
	.loc 1 156 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+16
	cmp	r3, r2
	bne	.L5
	.loc 1 159 0
	ldr	r3, .L8+8
	ldr	r2, .L8+8
	ldr	r2, [r2, #4]
	movs	r1, #240
	lsls	r1, r1, #4
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 174 0
	b	.L7
.L5:
	.loc 1 161 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+20
	cmp	r3, r2
	bne	.L6
	.loc 1 164 0
	ldr	r3, .L8+8
	ldr	r2, .L8+8
	ldr	r2, [r2, #4]
	movs	r1, #240
	lsls	r1, r1, #8
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 174 0
	b	.L7
.L6:
	.loc 1 168 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8+24
	cmp	r3, r2
	bne	.L7
	.loc 1 171 0
	ldr	r3, .L8+8
	ldr	r2, .L8+8
	ldr	r2, [r2, #4]
	movs	r1, #240
	lsls	r1, r1, #12
	orrs	r2, r1
	str	r2, [r3, #4]
.L7:
	.loc 1 174 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	65534
	.word	1073872904
	.word	1073872896
	.word	1073872924
	.word	1073872944
	.word	1073872964
	.word	1073872984
.LFE32:
	.size	DMA_DeInit, .-DMA_DeInit
	.section	.text.DMA_Init,"ax",%progbits
	.align	2
	.global	DMA_Init
	.code	16
	.thumb_func
	.type	DMA_Init, %function
DMA_Init:
.LFB33:
	.loc 1 186 0
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
	.loc 1 187 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 203 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 206 0
	ldr	r3, [r7, #12]
	ldr	r2, .L11
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 217 0
	ldr	r3, [r7]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	ldr	r3, [r3, #32]
	orrs	r2, r3
	.loc 1 218 0
	ldr	r3, [r7]
	ldr	r3, [r3, #16]
	.loc 1 217 0
	orrs	r2, r3
	.loc 1 218 0
	ldr	r3, [r7]
	ldr	r3, [r3, #20]
	orrs	r2, r3
	.loc 1 219 0
	ldr	r3, [r7]
	ldr	r3, [r3, #24]
	.loc 1 218 0
	orrs	r2, r3
	.loc 1 219 0
	ldr	r3, [r7]
	ldr	r3, [r3, #28]
	orrs	r2, r3
	.loc 1 220 0
	ldr	r3, [r7]
	ldr	r3, [r3, #36]
	.loc 1 219 0
	orrs	r2, r3
	.loc 1 220 0
	ldr	r3, [r7]
	ldr	r3, [r3, #40]
	orrs	r3, r2
	.loc 1 217 0
	ldr	r2, [r7, #12]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 223 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	.loc 1 227 0
	ldr	r3, [r7]
	ldr	r2, [r3, #12]
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 231 0
	ldr	r3, [r7]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 235 0
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
	.loc 1 236 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	-32753
.LFE33:
	.size	DMA_Init, .-DMA_Init
	.section	.text.DMA_StructInit,"ax",%progbits
	.align	2
	.global	DMA_StructInit
	.code	16
	.thumb_func
	.type	DMA_StructInit, %function
DMA_StructInit:
.LFB34:
	.loc 1 245 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 248 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 250 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 252 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 254 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #12]
	.loc 1 256 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #16]
	.loc 1 258 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #20]
	.loc 1 260 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #24]
	.loc 1 262 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #28]
	.loc 1 264 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #32]
	.loc 1 266 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #36]
	.loc 1 268 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3, #40]
	.loc 1 269 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	DMA_StructInit, .-DMA_StructInit
	.section	.text.DMA_Cmd,"ax",%progbits
	.align	2
	.global	DMA_Cmd
	.code	16
	.thumb_func
	.type	DMA_Cmd, %function
DMA_Cmd:
.LFB35:
	.loc 1 280 0
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
	.loc 1 285 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L15
	.loc 1 288 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r2, #1
	orrs	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 295 0
	b	.L17
.L15:
	.loc 1 293 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	ldr	r2, .L18
	ands	r2, r3
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L17:
	.loc 1 295 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	65534
.LFE35:
	.size	DMA_Cmd, .-DMA_Cmd
	.section	.text.DMA_SetCurrDataCounter,"ax",%progbits
	.align	2
	.global	DMA_SetCurrDataCounter
	.code	16
	.thumb_func
	.type	DMA_SetCurrDataCounter, %function
DMA_SetCurrDataCounter:
.LFB36:
	.loc 1 339 0
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
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 345 0
	adds	r3, r7, #2
	ldrh	r2, [r3]
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 346 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	DMA_SetCurrDataCounter, .-DMA_SetCurrDataCounter
	.section	.text.DMA_GetCurrDataCounter,"ax",%progbits
	.align	2
	.global	DMA_GetCurrDataCounter
	.code	16
	.thumb_func
	.type	DMA_GetCurrDataCounter, %function
DMA_GetCurrDataCounter:
.LFB37:
	.loc 1 357 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 361 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	uxth	r3, r3
	.loc 1 362 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	DMA_GetCurrDataCounter, .-DMA_GetCurrDataCounter
	.section	.text.DMA_ITConfig,"ax",%progbits
	.align	2
	.global	DMA_ITConfig
	.code	16
	.thumb_func
	.type	DMA_ITConfig, %function
DMA_ITConfig:
.LFB38:
	.loc 1 432 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #16
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 438 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L24
	.loc 1 441 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	orrs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 1 448 0
	b	.L26
.L24:
	.loc 1 446 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	ldr	r2, [r7, #8]
	mvns	r2, r2
	ands	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
.L26:
	.loc 1 448 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	DMA_ITConfig, .-DMA_ITConfig
	.section	.text.DMA_GetFlagStatus,"ax",%progbits
	.align	2
	.global	DMA_GetFlagStatus
	.code	16
	.thumb_func
	.type	DMA_GetFlagStatus, %function
DMA_GetFlagStatus:
.LFB39:
	.loc 1 484 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #16
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 485 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 491 0
	ldr	r3, .L31
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L28
	.loc 1 494 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L29
.L28:
	.loc 1 499 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L29:
	.loc 1 503 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 504 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L32:
	.align	2
.L31:
	.word	1073872896
.LFE39:
	.size	DMA_GetFlagStatus, .-DMA_GetFlagStatus
	.section	.text.DMA_ClearFlag,"ax",%progbits
	.align	2
	.global	DMA_ClearFlag
	.code	16
	.thumb_func
	.type	DMA_ClearFlag, %function
DMA_ClearFlag:
.LFB40:
	.loc 1 539 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	.loc 1 544 0
	ldr	r3, .L34
	ldr	r2, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 545 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L35:
	.align	2
.L34:
	.word	1073872896
.LFE40:
	.size	DMA_ClearFlag, .-DMA_ClearFlag
	.section	.text.DMA_GetITStatus,"ax",%progbits
	.align	2
	.global	DMA_GetITStatus
	.code	16
	.thumb_func
	.type	DMA_GetITStatus, %function
DMA_GetITStatus:
.LFB41:
	.loc 1 581 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	.loc 1 582 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 588 0
	ldr	r3, .L40
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	ands	r3, r2
	beq	.L37
	.loc 1 591 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L38
.L37:
	.loc 1 596 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L38:
	.loc 1 599 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 600 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L41:
	.align	2
.L40:
	.word	1073872896
.LFE41:
	.size	DMA_GetITStatus, .-DMA_GetITStatus
	.section	.text.DMA_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	DMA_ClearITPendingBit
	.code	16
	.thumb_func
	.type	DMA_ClearITPendingBit, %function
DMA_ClearITPendingBit:
.LFB42:
	.loc 1 636 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #8
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	.loc 1 641 0
	ldr	r3, .L43
	ldr	r2, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 642 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L44:
	.align	2
.L43:
	.word	1073872896
.LFE42:
	.size	DMA_ClearITPendingBit, .-DMA_ClearITPendingBit
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
	.uleb128 0x18
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/include/stm32f0xx_dma.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x407
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
	.byte	0x10
	.byte	0x3
	.2byte	0x14d
	.4byte	0x110
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x3
	.2byte	0x14f
	.4byte	0x7a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x150
	.4byte	0x7a
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x151
	.4byte	0x7a
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x152
	.4byte	0x7a
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x153
	.4byte	0xd2
	.uleb128 0x9
	.byte	0x8
	.byte	0x3
	.2byte	0x155
	.4byte	0x140
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x157
	.4byte	0x7a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x158
	.4byte	0x7a
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x159
	.4byte	0x11c
	.uleb128 0xd
	.byte	0x2c
	.byte	0x4
	.byte	0x34
	.4byte	0x1d9
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x4
	.byte	0x36
	.4byte	0x53
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x4
	.byte	0x38
	.4byte	0x53
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x4
	.byte	0x3a
	.4byte	0x53
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x4
	.byte	0x3d
	.4byte	0x53
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x4
	.byte	0x41
	.4byte	0x53
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x44
	.4byte	0x53
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x4
	.byte	0x47
	.4byte	0x53
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x4
	.byte	0x4a
	.4byte	0x53
	.byte	0x1c
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x4
	.byte	0x4d
	.4byte	0x53
	.byte	0x20
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x4
	.byte	0x52
	.4byte	0x53
	.byte	0x24
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x4
	.byte	0x55
	.4byte	0x53
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x4
	.byte	0x57
	.4byte	0x14c
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0x7e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x208
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0x7e
	.4byte	0x208
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x110
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x24e
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0xb9
	.4byte	0x208
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0xb9
	.4byte	0x24e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.byte	0xbb
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x1d9
	.uleb128 0xf
	.4byte	.LASF38
	.byte	0x1
	.byte	0xf4
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x278
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0xf4
	.4byte	0x24e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x117
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ad
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x117
	.4byte	0x208
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x117
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x152
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e2
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x152
	.4byte	0x208
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x152
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x15
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x164
	.4byte	0x3a
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30c
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x164
	.4byte	0x208
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x350
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x1af
	.4byte	0x208
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1af
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x1af
	.4byte	0xc7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x15
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1e3
	.4byte	0x98
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x389
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1e3
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1e5
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x21a
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3af
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x21a
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x244
	.4byte	0xa3
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e8
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x244
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x246
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x17
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x27b
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x27b
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x14
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
	.4byte	0x10f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x40b
	.4byte	0x8b
	.ascii	"RESET\000"
	.4byte	0x91
	.ascii	"SET\000"
	.4byte	0xba
	.ascii	"DISABLE\000"
	.4byte	0xc0
	.ascii	"ENABLE\000"
	.4byte	0x1e4
	.ascii	"DMA_DeInit\000"
	.4byte	0x20e
	.ascii	"DMA_Init\000"
	.4byte	0x254
	.ascii	"DMA_StructInit\000"
	.4byte	0x278
	.ascii	"DMA_Cmd\000"
	.4byte	0x2ad
	.ascii	"DMA_SetCurrDataCounter\000"
	.4byte	0x2e2
	.ascii	"DMA_GetCurrDataCounter\000"
	.4byte	0x30c
	.ascii	"DMA_ITConfig\000"
	.4byte	0x350
	.ascii	"DMA_GetFlagStatus\000"
	.4byte	0x389
	.ascii	"DMA_ClearFlag\000"
	.4byte	0x3af
	.ascii	"DMA_GetITStatus\000"
	.4byte	0x3e8
	.ascii	"DMA_ClearITPendingBit\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x12e
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x40b
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
	.4byte	0x110
	.ascii	"DMA_Channel_TypeDef\000"
	.4byte	0x140
	.ascii	"DMA_TypeDef\000"
	.4byte	0x1d9
	.ascii	"DMA_InitTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x6c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF51:
	.ascii	"DMA_GetITStatus\000"
.LASF12:
	.ascii	"ITStatus\000"
.LASF18:
	.ascii	"CMAR\000"
.LASF49:
	.ascii	"bitstatus\000"
.LASF34:
	.ascii	"DMA_DeInit\000"
.LASF43:
	.ascii	"DMA_ITConfig\000"
.LASF35:
	.ascii	"DMA_Init\000"
.LASF53:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_dma.c\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF26:
	.ascii	"DMA_PeripheralInc\000"
.LASF39:
	.ascii	"DMA_Cmd\000"
.LASF20:
	.ascii	"IFCR\000"
.LASF55:
	.ascii	"DMA_ClearITPendingBit\000"
.LASF47:
	.ascii	"DMA_FLAG\000"
.LASF0:
	.ascii	"signed char\000"
.LASF31:
	.ascii	"DMA_Priority\000"
.LASF45:
	.ascii	"DMA_GetCurrDataCounter\000"
.LASF16:
	.ascii	"CNDTR\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF32:
	.ascii	"DMA_M2M\000"
.LASF10:
	.ascii	"RESET\000"
.LASF44:
	.ascii	"DMA_IT\000"
.LASF37:
	.ascii	"DMA_InitStruct\000"
.LASF24:
	.ascii	"DMA_DIR\000"
.LASF33:
	.ascii	"DMA_InitTypeDef\000"
.LASF21:
	.ascii	"DMA_TypeDef\000"
.LASF46:
	.ascii	"DMA_GetFlagStatus\000"
.LASF52:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF27:
	.ascii	"DMA_MemoryInc\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF50:
	.ascii	"DMA_ClearFlag\000"
.LASF30:
	.ascii	"DMA_Mode\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF23:
	.ascii	"DMA_MemoryBaseAddr\000"
.LASF41:
	.ascii	"DMA_SetCurrDataCounter\000"
.LASF38:
	.ascii	"DMA_StructInit\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF29:
	.ascii	"DMA_MemoryDataSize\000"
.LASF7:
	.ascii	"long long int\000"
.LASF42:
	.ascii	"DataNumber\000"
.LASF25:
	.ascii	"DMA_BufferSize\000"
.LASF2:
	.ascii	"short int\000"
.LASF48:
	.ascii	"tmpreg\000"
.LASF40:
	.ascii	"NewState\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF17:
	.ascii	"CPAR\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF54:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF28:
	.ascii	"DMA_PeripheralDataSize\000"
.LASF13:
	.ascii	"DISABLE\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF22:
	.ascii	"DMA_PeripheralBaseAddr\000"
.LASF36:
	.ascii	"DMAy_Channelx\000"
.LASF19:
	.ascii	"DMA_Channel_TypeDef\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
