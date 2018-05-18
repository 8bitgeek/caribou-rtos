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
	.file	"timer.c"
	.text
.Ltext0:
	.section	.text.append_timer_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	append_timer_node, %function
append_timer_node:
.LFB38:
	push	{r3, r4, r5, lr}
.LCFI0:
	mov	r5, r0
	mov	r4, r1
.LBB6:
.LBB7:
	bl	caribou_lock
.LBB8:
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L2
.L4:
	cmp	r4, r3
	beq	.L3
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L4
	b	.L2
.L5:
.LBE8:
.LBE7:
.LBE6:
.LBB10:
	mov	r2, r3
.L9:
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L5
	str	r4, [r2, #4]
	str	r2, [r4]
	b	.L6
.L8:
	str	r4, [r5, #56]
	mov	r3, #0
	str	r3, [r4]
	str	r3, [r4, #4]
.L6:
	bl	caribou_lock_set
	b	.L10
.L3:
.LBE10:
.LBB11:
.LBB9:
	bl	caribou_lock_set
	b	.L10
.L2:
	bl	caribou_lock_set
.LBE9:
.LBE11:
.LBB12:
	bl	caribou_lock
	ldr	r2, [r5, #56]
	cmp	r2, #0
	bne	.L9
	b	.L8
.L10:
.LBE12:
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE38:
	.size	append_timer_node, .-append_timer_node
	.section	.text.caribou_timer_ticks,"ax",%progbits
	.align	2
	.global	caribou_timer_ticks
	.code	16
	.thumb_func
	.type	caribou_timer_ticks, %function
caribou_timer_ticks:
.LFB34:
	ldr	r3, .L12
	ldr	r0, [r3, #24]
	ldr	r1, [r3, #28]
	@ sp needed
	bx	lr
.L13:
	.align	2
.L12:
	.word	caribou_state
.LFE34:
	.size	caribou_timer_ticks, .-caribou_timer_ticks
	.section	.text.caribou_timer_expired,"ax",%progbits
	.align	2
	.global	caribou_timer_expired
	.code	16
	.thumb_func
	.type	caribou_timer_expired, %function
caribou_timer_expired:
.LFB35:
	ldr	r0, [r0, #16]
	neg	r3, r0
	adc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.LFE35:
	.size	caribou_timer_expired, .-caribou_timer_expired
	.section	.text.caribou_timer_create,"ax",%progbits
	.align	2
	.global	caribou_timer_create
	.code	16
	.thumb_func
	.type	caribou_timer_create, %function
caribou_timer_create:
.LFB41:
	push	{r4, r5, r6, r7, lr}
.LCFI1:
	mov	r7, r8
	push	{r7}
.LCFI2:
	mov	r7, r0
	mov	r6, r1
	mov	r8, r2
	bl	caribou_thread_current
	mov	r5, r0
.LBB16:
.LBB17:
	mov	r0, #28
	bl	malloc
	sub	r4, r0, #0
	beq	.L16
.LBB18:
	mov	r1, #0
	mov	r2, #28
	bl	memset
.LBE18:
.LBE17:
.LBE16:
	mov	r3, #1
	mov	r2, r8
	orr	r3, r2
	strb	r3, [r4, #24]
	str	r7, [r4, #8]
	str	r6, [r4, #12]
	mov	r0, r5
	mov	r1, r4
	bl	append_timer_node
	b	.L17
.L16:
.LBB20:
.LBB19:
	mov	r0, #8
	bl	_caribou_thread_fault_emit
.L17:
.LBE19:
.LBE20:
	mov	r0, r4
	@ sp needed
	pop	{r2}
	mov	r8, r2
	pop	{r4, r5, r6, r7, pc}
.LFE41:
	.size	caribou_timer_create, .-caribou_timer_create
	.section	.text.caribou_timer_init,"ax",%progbits
	.align	2
	.global	caribou_timer_init
	.code	16
	.thumb_func
	.type	caribou_timer_init, %function
caribou_timer_init:
.LFB42:
	push	{r4, r5, r6, r7, lr}
.LCFI3:
	mov	r7, r8
	push	{r7}
.LCFI4:
	mov	r4, r0
	mov	r7, r1
	mov	r6, r2
	mov	r8, r3
	bl	caribou_thread_current
	mov	r5, r0
	cmp	r4, #0
	beq	.L19
.LBB21:
	mov	r0, r4
	mov	r1, #0
	mov	r2, #28
	bl	memset
	mov	r3, #1
	mov	r2, r8
	bic	r2, r3
	strb	r2, [r4, #24]
	str	r7, [r4, #8]
	str	r6, [r4, #12]
	mov	r0, r5
	mov	r1, r4
	bl	append_timer_node
.L19:
.LBE21:
	mov	r0, r4
	@ sp needed
	pop	{r2}
	mov	r8, r2
	pop	{r4, r5, r6, r7, pc}
.LFE42:
	.size	caribou_timer_init, .-caribou_timer_init
	.section	.text.caribou_timer_ticks_timeout,"ax",%progbits
	.align	2
	.global	caribou_timer_ticks_timeout
	.code	16
	.thumb_func
	.type	caribou_timer_ticks_timeout, %function
caribou_timer_ticks_timeout:
.LFB43:
	push	{r4, r5, lr}
.LCFI5:
	mov	r4, #1
	mov	r5, #0
	add	r4, r4, r2
	adc	r5, r5, r3
	cmp	r5, #0
	bne	.L26
	bne	.L25
	cmp	r4, #1
	bls	.L25
.L26:
	ldr	r4, .L27
	ldr	r5, [r4, #28]
	ldr	r4, [r4, #24]
	sub	r4, r4, r0
	sbc	r5, r5, r1
	mov	r0, #1
	cmp	r3, r5
	bgt	.L24
	bne	.L23
	cmp	r2, r4
	bls	.L23
.L24:
	mov	r0, #0
.L23:
	uxtb	r0, r0
	b	.L21
.L25:
	mov	r0, #0
.L21:
	@ sp needed
	pop	{r4, r5, pc}
.L28:
	.align	2
.L27:
	.word	caribou_state
.LFE43:
	.size	caribou_timer_ticks_timeout, .-caribou_timer_ticks_timeout
	.section	.text.caribou_timer_set,"ax",%progbits
	.align	2
	.global	caribou_timer_set
	.code	16
	.thumb_func
	.type	caribou_timer_set, %function
caribou_timer_set:
.LFB44:
	push	{r3, r4, r5, lr}
.LCFI6:
	mov	r4, r0
	mov	r5, r1
	bl	caribou_lock
	str	r5, [r4, #16]
	str	r5, [r4, #20]
	bl	caribou_lock_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE44:
	.size	caribou_timer_set, .-caribou_timer_set
	.section	.text.caribou_timer_reset,"ax",%progbits
	.align	2
	.global	caribou_timer_reset
	.code	16
	.thumb_func
	.type	caribou_timer_reset, %function
caribou_timer_reset:
.LFB45:
	push	{r4, lr}
.LCFI7:
	mov	r4, r0
	bl	caribou_lock
	ldr	r3, [r4, #20]
	str	r3, [r4, #16]
	bl	caribou_lock_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE45:
	.size	caribou_timer_reset, .-caribou_timer_reset
	.section	.text.caribou_timer_delete,"ax",%progbits
	.align	2
	.global	caribou_timer_delete
	.code	16
	.thumb_func
	.type	caribou_timer_delete, %function
caribou_timer_delete:
.LFB46:
	push	{r4, r5, r6, lr}
.LCFI8:
	mov	r5, r0
	mov	r4, r1
	bl	caribou_lock
	mov	r6, r0
	mov	r0, r4
	mov	r1, #0
	bl	caribou_timer_set
.LBB26:
.LBB27:
	bl	caribou_lock
	ldr	r2, [r5, #56]
	cmp	r4, r2
	bne	.L32
	ldr	r3, [r4, #4]
	str	r3, [r5, #56]
	cmp	r3, #0
	beq	.L33
	mov	r2, #0
	str	r2, [r3]
	b	.L33
.L32:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L34
	ldr	r2, [r4, #4]
	str	r2, [r3, #4]
.L34:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L35
	ldr	r2, [r4]
	str	r2, [r3]
.L35:
	mov	r3, #0
	str	r3, [r4, #4]
	str	r3, [r4]
.L33:
	bl	caribou_lock_set
.LBE27:
.LBE26:
.LBB28:
.LBB29:
	ldrb	r3, [r4, #24]
	lsl	r2, r3, #31
	bpl	.L36
	mov	r0, r4
	bl	free
.L36:
.LBE29:
.LBE28:
	mov	r0, r6
	bl	caribou_lock_set
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE46:
	.size	caribou_timer_delete, .-caribou_timer_delete
	.section	.text.caribou_timer_delete_all,"ax",%progbits
	.align	2
	.global	caribou_timer_delete_all
	.code	16
	.thumb_func
	.type	caribou_timer_delete_all, %function
caribou_timer_delete_all:
.LFB47:
	push	{r4, lr}
.LCFI9:
	mov	r4, r0
	ldr	r1, [r0, #56]
	cmp	r1, #0
	beq	.L37
.L39:
	mov	r0, r4
	bl	caribou_timer_delete
	ldr	r1, [r4, #56]
	cmp	r1, #0
	bne	.L39
.L37:
	@ sp needed
	pop	{r4, pc}
.LFE47:
	.size	caribou_timer_delete_all, .-caribou_timer_delete_all
	.section	.text.caribou_timer_idle,"ax",%progbits
	.align	2
	.global	caribou_timer_idle
	.code	16
	.thumb_func
	.type	caribou_timer_idle, %function
caribou_timer_idle:
.LFB49:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI10:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI11:
	mov	r8, r0
	bl	chip_systick_irq_disable
	mov	fp, r0
	ldr	r3, .L53
	ldr	r2, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r7, [r3, #32]
	sub	r7, r2, r7
	beq	.L41
	str	r2, [r3, #32]
	str	r1, [r3, #36]
	mov	r1, r8
	cmp	r1, #0
	beq	.L41
.LBB33:
.LBB34:
.LBB35:
	mov	r6, #0
	mov	r2, #2
	mov	r10, r2
	mov	r3, #1
	mov	r9, r3
.L47:
.LBE35:
.LBE34:
	mov	r1, r8
	ldr	r4, [r1, #56]
	cmp	r4, #0
	beq	.L42
.L46:
.LBB38:
.LBB36:
	ldr	r3, [r4, #16]
	mov	r2, r6
	cmp	r3, #0
	beq	.L43
	cmp	r7, r3
	bhi	.L44
	sub	r3, r3, r7
	str	r3, [r4, #16]
	bne	.L43
.L48:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L45
	mov	r0, r8
	mov	r1, r4
	ldr	r2, [r4, #12]
	blx	r3
.L45:
	ldrb	r3, [r4, #24]
	mov	r2, r9
	mov	r1, r10
	tst	r1, r3
	bne	.L43
	ldr	r2, [r4, #20]
	str	r2, [r4, #16]
	mov	r2, r9
.L43:
.LBE36:
.LBE38:
	add	r5, r5, r2
	ldr	r4, [r4, #4]
	cmp	r4, #0
	bne	.L46
.L42:
.LBE33:
	mov	r1, r8
	ldr	r3, [r1]
	mov	r8, r3
	cmp	r3, #0
	bne	.L47
	b	.L41
.L44:
.LBB40:
.LBB39:
.LBB37:
	str	r6, [r4, #16]
	b	.L48
.L41:
.LBE37:
.LBE39:
.LBE40:
	mov	r0, fp
	bl	chip_systick_irq_set
	mov	r0, r5
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L54:
	.align	2
.L53:
	.word	caribou_state
.LFE49:
	.size	caribou_timer_idle, .-caribou_timer_idle
	.section	.text.caribou_timer_usec_delay,"ax",%progbits
	.align	2
	.global	caribou_timer_usec_delay
	.code	16
	.thumb_func
	.type	caribou_timer_usec_delay, %function
caribou_timer_usec_delay:
.LFB50:
	push	{r3, lr}
.LCFI12:
	bl	chip_usec_delay
	@ sp needed
	pop	{r3, pc}
.LFE50:
	.size	caribou_timer_usec_delay, .-caribou_timer_usec_delay
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
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI0-.LFB38
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI1-.LFB41
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
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x18
	.byte	0x88
	.uleb128 0x6
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI3-.LFB42
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
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.byte	0x88
	.uleb128 0x6
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI5-.LFB43
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI6-.LFB44
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
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI7-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI8-.LFB46
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
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI9-.LFB47
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
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI10-.LFB49
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
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x28
	.byte	0x88
	.uleb128 0xa
	.byte	0x89
	.uleb128 0x9
	.byte	0x8a
	.uleb128 0x8
	.byte	0x8b
	.uleb128 0x7
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI12-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/timer.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x179
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x1
	.4byte	.LASF19
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.4byte	0x38
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3a
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x42
	.byte	0
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.byte	0x47
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2a
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x7c
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF4
	.byte	0x1
	.byte	0x95
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF5
	.byte	0x1
	.byte	0xab
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0xbf
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0xd6
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xca
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3a
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x42
	.byte	0
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0xe4
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xee
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3a
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x42
	.byte	0
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x62
	.byte	0x1
	.4byte	0x109
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3a
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x42
	.byte	0
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0xf1
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x135
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x3a
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x42
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0xfd
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x109
	.byte	0x1
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x123
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x13f
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x74
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
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
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF8:
	.ascii	"caribou_timer_reset\000"
.LASF16:
	.ascii	"caribou_timer_idle\000"
.LASF5:
	.ascii	"caribou_timer_init\000"
.LASF21:
	.ascii	"caribou_timer_usec_delay\000"
.LASF15:
	.ascii	"expire_timer\000"
.LASF7:
	.ascii	"caribou_timer_set\000"
.LASF17:
	.ascii	"chip_usec_delay\000"
.LASF0:
	.ascii	"caribou_lock\000"
.LASF11:
	.ascii	"new_timer_node\000"
.LASF2:
	.ascii	"caribou_timer_ticks\000"
.LASF18:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF4:
	.ascii	"caribou_timer_create\000"
.LASF19:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/kernel/timer.c\000"
.LASF12:
	.ascii	"delete_timer_node\000"
.LASF6:
	.ascii	"caribou_timer_ticks_timeout\000"
.LASF1:
	.ascii	"caribou_lock_set\000"
.LASF13:
	.ascii	"caribou_timer_delete\000"
.LASF14:
	.ascii	"caribou_timer_delete_all\000"
.LASF10:
	.ascii	"remove_timer_node\000"
.LASF20:
	.ascii	"append_timer_node\000"
.LASF9:
	.ascii	"find_timer_node\000"
.LASF3:
	.ascii	"caribou_timer_expired\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
