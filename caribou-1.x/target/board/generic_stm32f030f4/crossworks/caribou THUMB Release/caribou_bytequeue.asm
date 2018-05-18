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
	.file	"bytequeue.c"
	.text
.Ltext0:
	.section	.text.caribou_bytequeue_new,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_new
	.code	16
	.thumb_func
	.type	caribou_bytequeue_new, %function
caribou_bytequeue_new:
.LFB32:
	push	{r3, r4, r5, lr}
.LCFI0:
	mov	r5, r0
	mov	r0, #12
	bl	malloc
	sub	r4, r0, #0
	beq	.L2
	mov	r1, #0
	mov	r2, #12
	bl	memset
	mov	r0, r5
	bl	malloc
	str	r0, [r4]
	cmp	r0, #0
	beq	.L3
	strh	r5, [r4, #4]
	b	.L2
.L3:
	mov	r0, r4
	bl	free
	mov	r4, #0
.L2:
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE32:
	.size	caribou_bytequeue_new, .-caribou_bytequeue_new
	.section	.text.caribou_bytequeue_free,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_free
	.code	16
	.thumb_func
	.type	caribou_bytequeue_free, %function
caribou_bytequeue_free:
.LFB33:
	push	{r3, r4, r5, lr}
.LCFI1:
	sub	r4, r0, #0
	beq	.L7
.LBB2:
	bl	chip_interrupts_disable
	mov	r5, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L6
	bl	free
.L6:
	mov	r0, r4
	bl	free
	mov	r0, r5
	bl	chip_interrupts_set
	mov	r0, #1
	b	.L5
.L7:
.LBE2:
	mov	r0, #0
.L5:
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE33:
	.size	caribou_bytequeue_free, .-caribou_bytequeue_free
	.section	.text.caribou_bytequeue_init,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_init
	.code	16
	.thumb_func
	.type	caribou_bytequeue_init, %function
caribou_bytequeue_init:
.LFB34:
	push	{r4, r5, r6, lr}
.LCFI2:
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	mov	r1, #0
	mov	r2, #12
	bl	memset
	cmp	r4, #0
	beq	.L10
	cmp	r5, #0
	beq	.L11
	mov	r0, #0
	cmp	r6, #0
	beq	.L9
	str	r5, [r4]
	strh	r6, [r4, #4]
	mov	r0, #1
	b	.L9
.L10:
	mov	r0, #0
	b	.L9
.L11:
	mov	r0, #0
.L9:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE34:
	.size	caribou_bytequeue_init, .-caribou_bytequeue_init
	.section	.text.caribou_bytequeue_full,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_full
	.code	16
	.thumb_func
	.type	caribou_bytequeue_full, %function
caribou_bytequeue_full:
.LFB35:
	push	{r4, lr}
.LCFI3:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	sub	r1, r2, #1
	cmp	r3, r1
	beq	.L15
	ldrh	r1, [r4, #4]
	sub	r1, r1, #1
	mov	r4, #0
	cmp	r3, r1
	bne	.L14
	neg	r4, r2
	adc	r4, r4, r2
	b	.L14
.L15:
	mov	r4, #1
.L14:
	bl	chip_interrupts_set
	uxtb	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE35:
	.size	caribou_bytequeue_full, .-caribou_bytequeue_full
	.section	.text.caribou_bytequeue_empty,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_empty
	.code	16
	.thumb_func
	.type	caribou_bytequeue_empty, %function
caribou_bytequeue_empty:
.LFB36:
	push	{r4, lr}
.LCFI4:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #8]
	sub	r4, r2, r3
	neg	r3, r4
	adc	r4, r4, r3
	uxtb	r4, r4
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE36:
	.size	caribou_bytequeue_empty, .-caribou_bytequeue_empty
	.section	.text.caribou_bytequeue_clear,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_clear
	.code	16
	.thumb_func
	.type	caribou_bytequeue_clear, %function
caribou_bytequeue_clear:
.LFB37:
	push	{r4, lr}
.LCFI5:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldrh	r3, [r4, #8]
	strh	r3, [r4, #6]
	bl	chip_interrupts_set
	@ sp needed
	pop	{r4, pc}
.LFE37:
	.size	caribou_bytequeue_clear, .-caribou_bytequeue_clear
	.section	.text.caribou_bytequeue_level,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_level
	.code	16
	.thumb_func
	.type	caribou_bytequeue_level, %function
caribou_bytequeue_level:
.LFB38:
	push	{r3, r4, r5, lr}
.LCFI6:
	mov	r5, r0
	bl	chip_interrupts_disable
	ldrh	r3, [r5, #6]
	ldrh	r2, [r5, #8]
	sub	r4, r3, r2
	bpl	.L20
	ldrh	r4, [r5, #4]
	sub	r4, r4, r2
	add	r4, r3, r4
.L20:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE38:
	.size	caribou_bytequeue_level, .-caribou_bytequeue_level
	.section	.text.caribou_bytequeue_size,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_size
	.code	16
	.thumb_func
	.type	caribou_bytequeue_size, %function
caribou_bytequeue_size:
.LFB39:
	ldrh	r0, [r0, #4]
	@ sp needed
	bx	lr
.LFE39:
	.size	caribou_bytequeue_size, .-caribou_bytequeue_size
	.section	.text.caribou_bytequeue_half_full,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_half_full
	.code	16
	.thumb_func
	.type	caribou_bytequeue_half_full, %function
caribou_bytequeue_half_full:
.LFB40:
	push	{r4, lr}
.LCFI7:
	mov	r4, r0
	bl	caribou_bytequeue_level
	ldrh	r3, [r4, #4]
	asr	r3, r3, #1
	asr	r1, r0, #31
	lsr	r2, r3, #31
	cmp	r0, r3
	adc	r1, r1, r2
	uxtb	r0, r1
	@ sp needed
	pop	{r4, pc}
.LFE40:
	.size	caribou_bytequeue_half_full, .-caribou_bytequeue_half_full
	.section	.text.caribou_bytequeue_put,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_put
	.code	16
	.thumb_func
	.type	caribou_bytequeue_put, %function
caribou_bytequeue_put:
.LFB41:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI8:
	mov	r4, r0
	mov	r7, r1
	bl	chip_interrupts_disable
	ldrh	r3, [r4, #6]
	ldrh	r2, [r4, #8]
	sub	r5, r2, #1
	cmp	r3, r5
	beq	.L27
	ldrh	r1, [r4, #4]
	sub	r1, r1, #1
	cmp	r3, r1
	bne	.L25
	cmp	r2, #0
	bne	.L25
	mov	r4, #0
	b	.L24
.L26:
	mov	r3, #0
	strh	r3, [r4, #6]
	mov	r4, #1
	b	.L24
.L27:
	mov	r4, #0
	b	.L24
.L25:
	add	r2, r3, #1
	strh	r2, [r4, #6]
	ldr	r2, [r4]
	strb	r7, [r2, r3]
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	cmp	r2, r3
	bcs	.L26
	mov	r4, #1
.L24:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE41:
	.size	caribou_bytequeue_put, .-caribou_bytequeue_put
	.section	.text.caribou_bytequeue_puts,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_puts
	.code	16
	.thumb_func
	.type	caribou_bytequeue_puts, %function
caribou_bytequeue_puts:
.LFB42:
	push	{r4, r5, r6, r7, lr}
.LCFI9:
	mov	r7, r8
	push	{r7}
.LCFI10:
	mov	r4, r0
	mov	r5, r1
	mov	r8, r2
	bl	chip_interrupts_disable
	mov	ip, r0
	mov	r2, r8
	cmp	r2, #0
	ble	.L34
	ldrh	r3, [r4, #6]
	mov	r7, r3
	ldrh	r6, [r4, #8]
	sub	r2, r6, #1
	cmp	r3, r2
	beq	.L35
	mov	r1, r5
	mov	r5, #0
	mov	r0, #0
	b	.L31
.L33:
	add	r2, r3, #1
	strh	r2, [r4, #6]
	add	r5, r5, #1
	ldrb	r2, [r1]
	ldr	r6, [r4]
	strb	r2, [r6, r3]
	ldrh	r2, [r4, #6]
	ldrh	r3, [r4, #4]
	cmp	r2, r3
	bcc	.L32
	strh	r0, [r4, #6]
.L32:
	cmp	r5, r8
	beq	.L30
	ldrh	r3, [r4, #6]
	mov	r7, r3
	ldrh	r6, [r4, #8]
	add	r1, r1, #1
	sub	r2, r6, #1
	cmp	r3, r2
	beq	.L30
.L31:
	ldrh	r2, [r4, #4]
	sub	r2, r2, #1
	cmp	r7, r2
	bne	.L33
	cmp	r6, #0
	bne	.L33
	b	.L30
.L34:
	mov	r5, #0
	b	.L30
.L35:
	mov	r5, #0
.L30:
	mov	r0, ip
	bl	chip_interrupts_set
	mov	r0, r5
	@ sp needed
	pop	{r2}
	mov	r8, r2
	pop	{r4, r5, r6, r7, pc}
.LFE42:
	.size	caribou_bytequeue_puts, .-caribou_bytequeue_puts
	.section	.text.caribou_bytequeue_get,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_get
	.code	16
	.thumb_func
	.type	caribou_bytequeue_get, %function
caribou_bytequeue_get:
.LFB43:
	push	{r3, r4, r5, lr}
.LCFI11:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldrh	r3, [r4, #8]
	ldrh	r2, [r4, #6]
	cmp	r2, r3
	beq	.L38
	add	r2, r3, #1
	uxth	r2, r2
	strh	r2, [r4, #8]
	ldr	r1, [r4]
	ldrb	r5, [r1, r3]
	ldrh	r3, [r4, #4]
	cmp	r3, r2
	bhi	.L37
	mov	r3, #0
	strh	r3, [r4, #8]
	b	.L37
.L38:
	mov	r5, #1
	neg	r5, r5
.L37:
	bl	chip_interrupts_set
	mov	r0, r5
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE43:
	.size	caribou_bytequeue_get, .-caribou_bytequeue_get
	.section	.text.caribou_bytequeue_gets,"ax",%progbits
	.align	2
	.global	caribou_bytequeue_gets
	.code	16
	.thumb_func
	.type	caribou_bytequeue_gets, %function
caribou_bytequeue_gets:
.LFB44:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI12:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI13:
	mov	r4, r0
	mov	r9, r1
	mov	r8, r2
	bl	chip_interrupts_disable
	mov	r3, #0
	mov	r1, #0
	b	.L40
.L43:
	add	r2, r5, #1
	strh	r2, [r4, #8]
	ldr	r6, [r4]
	ldrb	r2, [r6, r5]
	mov	r5, r9
	strb	r2, [r5, r3]
	ldrh	r2, [r4, #8]
	ldrh	r5, [r4, #4]
	cmp	r2, r5
	bcc	.L41
	strh	r1, [r4, #8]
.L41:
	add	r3, r3, #1
.L40:
	mov	r6, r3
	ldrh	r5, [r4, #8]
	ldrh	r7, [r4, #6]
	cmp	r7, r5
	beq	.L42
	cmp	r3, r8
	blt	.L43
.L42:
	bl	chip_interrupts_set
	mov	r0, r6
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r3, r4, r5, r6, r7, pc}
.LFE44:
	.size	caribou_bytequeue_gets, .-caribou_bytequeue_gets
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
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
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
	.byte	0x83
	.uleb128 0x4
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
	.byte	0x4
	.4byte	.LCFI2-.LFB34
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
	.byte	0x4
	.4byte	.LCFI4-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI5-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI6-.LFB38
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.byte	0x4
	.4byte	.LCFI7-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI8-.LFB41
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
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
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI9-.LFB42
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
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x88
	.uleb128 0x6
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI11-.LFB43
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI12-.LFB44
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
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
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/bytequeue.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xfd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0x1
	.4byte	.LASF13
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x22
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x3b
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x51
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x63
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x70
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x7d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x8b
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x4
	.4byte	0x94
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0xa6
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0xb1
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0xc6
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0xd9
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0xee
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0
	.uleb128 0x31
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
.LASF6:
	.ascii	"caribou_bytequeue_level\000"
.LASF14:
	.ascii	"caribou_bytequeue_size\000"
.LASF4:
	.ascii	"caribou_bytequeue_empty\000"
.LASF11:
	.ascii	"caribou_bytequeue_gets\000"
.LASF13:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/bytequeue.c\000"
.LASF10:
	.ascii	"caribou_bytequeue_get\000"
.LASF9:
	.ascii	"caribou_bytequeue_puts\000"
.LASF2:
	.ascii	"caribou_bytequeue_init\000"
.LASF7:
	.ascii	"caribou_bytequeue_half_full\000"
.LASF12:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF5:
	.ascii	"caribou_bytequeue_clear\000"
.LASF1:
	.ascii	"caribou_bytequeue_free\000"
.LASF0:
	.ascii	"caribou_bytequeue_new\000"
.LASF3:
	.ascii	"caribou_bytequeue_full\000"
.LASF8:
	.ascii	"caribou_bytequeue_put\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
