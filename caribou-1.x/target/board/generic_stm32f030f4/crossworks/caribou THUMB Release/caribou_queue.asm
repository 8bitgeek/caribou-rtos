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
	.file	"queue.c"
	.text
.Ltext0:
	.section	.text.caribou_queue_new,"ax",%progbits
	.align	2
	.global	caribou_queue_new
	.code	16
	.thumb_func
	.type	caribou_queue_new, %function
caribou_queue_new:
.LFB32:
	push	{r4, r5, r6, lr}
.LCFI0:
	mov	r5, r0
	mov	r0, #12
	bl	malloc
	sub	r4, r0, #0
	beq	.L2
	add	r3, r5, #1
	bne	.L3
	mov	r3, #0
	str	r3, [r0, #8]
	mov	r2, #1
	neg	r2, r2
	str	r2, [r0]
	str	r3, [r0, #4]
	b	.L2
.L3:
	lsl	r6, r5, #2
	mov	r0, r6
	bl	malloc
	str	r0, [r4, #8]
	cmp	r0, #0
	beq	.L4
	mov	r1, #0
	mov	r2, r6
	bl	memset
	str	r5, [r4]
	mov	r3, #0
	str	r3, [r4, #4]
	b	.L2
.L4:
	mov	r0, r4
	bl	free
	mov	r4, #0
.L2:
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE32:
	.size	caribou_queue_new, .-caribou_queue_new
	.section	.text.caribou_queue_delete,"ax",%progbits
	.align	2
	.global	caribou_queue_delete
	.code	16
	.thumb_func
	.type	caribou_queue_delete, %function
caribou_queue_delete:
.LFB33:
	push	{r4, lr}
.LCFI1:
	sub	r4, r0, #0
	beq	.L5
	ldr	r0, [r0, #8]
	cmp	r0, #0
	beq	.L7
	bl	free
.L7:
	mov	r0, r4
	bl	free
.L5:
	@ sp needed
	pop	{r4, pc}
.LFE33:
	.size	caribou_queue_delete, .-caribou_queue_delete
	.section	.text.caribou_queue_init,"ax",%progbits
	.align	2
	.global	caribou_queue_init
	.code	16
	.thumb_func
	.type	caribou_queue_init, %function
caribou_queue_init:
.LFB34:
	mov	r3, #0
	str	r3, [r0, #4]
	str	r1, [r0]
	str	r2, [r0, #8]
	@ sp needed
	bx	lr
.LFE34:
	.size	caribou_queue_init, .-caribou_queue_init
	.section	.text.caribou_queue_full,"ax",%progbits
	.align	2
	.global	caribou_queue_full
	.code	16
	.thumb_func
	.type	caribou_queue_full, %function
caribou_queue_full:
.LFB35:
	push	{r4, lr}
.LCFI2:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r3, [r4]
	add	r2, r3, #1
	beq	.L11
	ldr	r2, [r4, #4]
	lsr	r4, r3, #31
	asr	r1, r2, #31
	cmp	r2, r3
	adc	r4, r4, r1
	b	.L10
.L11:
	mov	r4, #1
.L10:
	bl	chip_interrupts_set
	uxtb	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE35:
	.size	caribou_queue_full, .-caribou_queue_full
	.section	.text.caribou_queue_empty,"ax",%progbits
	.align	2
	.global	caribou_queue_empty
	.code	16
	.thumb_func
	.type	caribou_queue_empty, %function
caribou_queue_empty:
.LFB36:
	push	{r4, lr}
.LCFI3:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r4, [r4, #4]
	neg	r3, r4
	adc	r4, r4, r3
	uxtb	r4, r4
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE36:
	.size	caribou_queue_empty, .-caribou_queue_empty
	.section	.text.caribou_queue_depth,"ax",%progbits
	.align	2
	.global	caribou_queue_depth
	.code	16
	.thumb_func
	.type	caribou_queue_depth, %function
caribou_queue_depth:
.LFB37:
	push	{r3, r4, r5, lr}
.LCFI4:
	mov	r5, r0
	bl	chip_interrupts_disable
	ldr	r4, [r5]
	add	r3, r4, #1
	bne	.L14
	ldr	r4, [r5, #4]
.L14:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE37:
	.size	caribou_queue_depth, .-caribou_queue_depth
	.section	.text.caribou_queue_count,"ax",%progbits
	.align	2
	.global	caribou_queue_count
	.code	16
	.thumb_func
	.type	caribou_queue_count, %function
caribou_queue_count:
.LFB38:
	push	{r4, lr}
.LCFI5:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r4, [r4, #4]
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE38:
	.size	caribou_queue_count, .-caribou_queue_count
	.section	.text.caribou_queue_last,"ax",%progbits
	.align	2
	.global	caribou_queue_last
	.code	16
	.thumb_func
	.type	caribou_queue_last, %function
caribou_queue_last:
.LFB40:
	push	{r4, lr}
.LCFI6:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L18
	ldr	r2, .L19
	add	r3, r3, r2
	ldr	r2, [r4, #8]
	lsl	r3, r3, #2
	ldr	r4, [r3, r2]
	b	.L17
.L18:
	mov	r4, #0
.L17:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.L20:
	.align	2
.L19:
	.word	1073741823
.LFE40:
	.size	caribou_queue_last, .-caribou_queue_last
	.section	.text.caribou_queue_first,"ax",%progbits
	.align	2
	.global	caribou_queue_first
	.code	16
	.thumb_func
	.type	caribou_queue_first, %function
caribou_queue_first:
.LFB41:
	push	{r4, lr}
.LCFI7:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L23
	ldr	r3, [r4, #8]
	ldr	r4, [r3]
	b	.L22
.L23:
	mov	r4, #0
.L22:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE41:
	.size	caribou_queue_first, .-caribou_queue_first
	.section	.text.caribou_queue_try_post,"ax",%progbits
	.align	2
	.global	caribou_queue_try_post
	.code	16
	.thumb_func
	.type	caribou_queue_try_post, %function
caribou_queue_try_post:
.LFB44:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI8:
	mov	r4, r0
	mov	r7, r1
	bl	chip_interrupts_disable
	mov	r6, r0
	ldr	r3, [r4]
	add	r2, r3, #1
	bne	.L25
	ldr	r1, [r4, #4]
	add	r1, r1, #1
	lsl	r1, r1, #2
	ldr	r0, [r4, #8]
	bl	realloc
	str	r0, [r4, #8]
	cmp	r0, #0
	beq	.L27
	ldr	r3, [r4, #4]
	add	r2, r3, #1
	str	r2, [r4, #4]
	lsl	r3, r3, #2
	str	r7, [r3, r0]
	mov	r5, #1
	b	.L26
.L25:
	ldr	r2, [r4, #4]
	mov	r5, #0
	cmp	r3, r2
	ble	.L26
	ldr	r3, [r4, #8]
	add	r1, r2, #1
	str	r1, [r4, #4]
	lsl	r2, r2, #2
	str	r7, [r2, r3]
	mov	r5, #1
	b	.L26
.L27:
	mov	r5, #0
.L26:
	mov	r0, r6
	bl	chip_interrupts_set
	mov	r0, r5
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE44:
	.size	caribou_queue_try_post, .-caribou_queue_try_post
	.section	.text.caribou_queue_post,"ax",%progbits
	.align	2
	.global	caribou_queue_post
	.code	16
	.thumb_func
	.type	caribou_queue_post, %function
caribou_queue_post:
.LFB39:
	push	{r4, r5, r6, r7, lr}
.LCFI9:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI10:
	mov	r10, r0
	mov	r9, r1
	mov	r4, r2
	mov	r5, r3
	bl	caribou_timer_ticks
	mov	r6, r0
	mov	r7, r1
	b	.L30
.L32:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	bl	caribou_timer_ticks_timeout
	cmp	r0, #0
	bne	.L31
	bl	caribou_thread_yield
.L30:
	mov	r0, r10
	mov	r1, r9
	bl	caribou_queue_try_post
	mov	r8, r0
	cmp	r0, #0
	beq	.L32
	mov	r3, #1
	mov	r8, r3
.L31:
	mov	r0, r8
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.LFE39:
	.size	caribou_queue_post, .-caribou_queue_post
	.section	.text.caribou_queue_try_take_last,"ax",%progbits
	.align	2
	.global	caribou_queue_try_take_last
	.code	16
	.thumb_func
	.type	caribou_queue_try_take_last, %function
caribou_queue_try_take_last:
.LFB45:
	push	{r4, lr}
.LCFI11:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L35
	ldr	r2, [r4, #8]
	sub	r3, r3, #1
	str	r3, [r4, #4]
	lsl	r3, r3, #2
	ldr	r4, [r3, r2]
	b	.L34
.L35:
	mov	r4, #0
.L34:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE45:
	.size	caribou_queue_try_take_last, .-caribou_queue_try_take_last
	.section	.text.caribou_queue_take_last,"ax",%progbits
	.align	2
	.global	caribou_queue_take_last
	.code	16
	.thumb_func
	.type	caribou_queue_take_last, %function
caribou_queue_take_last:
.LFB42:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI12:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI13:
	mov	r9, r0
	mov	r4, r2
	mov	r5, r3
	bl	caribou_timer_ticks
	mov	r6, r0
	mov	r7, r1
	b	.L37
.L39:
	bl	caribou_thread_yield
.L37:
	mov	r0, r9
	bl	caribou_queue_try_take_last
	mov	r8, r0
	cmp	r0, #0
	bne	.L38
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	bl	caribou_timer_ticks_timeout
	cmp	r0, #0
	beq	.L39
.L38:
	mov	r0, r8
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r3, r4, r5, r6, r7, pc}
.LFE42:
	.size	caribou_queue_take_last, .-caribou_queue_take_last
	.section	.text.caribou_queue_try_take_first,"ax",%progbits
	.align	2
	.global	caribou_queue_try_take_first
	.code	16
	.thumb_func
	.type	caribou_queue_try_take_first, %function
caribou_queue_try_take_first:
.LFB46:
	push	{r4, r5, r6, lr}
.LCFI14:
	mov	r4, r0
	mov	r5, r1
	mov	r3, #0
	str	r3, [r1]
	bl	chip_interrupts_disable
	mov	r6, r0
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ble	.L42
.LBB2:
	sub	r3, r2, #1
	str	r3, [r4, #4]
	ldr	r3, [r4, #8]
	ldr	r3, [r3]
	str	r3, [r5]
	ldr	r0, [r4, #8]
	add	r1, r0, #4
	lsl	r2, r2, #2
	bl	memmove
	mov	r4, #1
	b	.L41
.L42:
.LBE2:
	mov	r4, #0
.L41:
	mov	r0, r6
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE46:
	.size	caribou_queue_try_take_first, .-caribou_queue_try_take_first
	.section	.text.caribou_queue_take_first,"ax",%progbits
	.align	2
	.global	caribou_queue_take_first
	.code	16
	.thumb_func
	.type	caribou_queue_take_first, %function
caribou_queue_take_first:
.LFB43:
	push	{r4, r5, r6, r7, lr}
.LCFI15:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI16:
	mov	r10, r0
	mov	r9, r1
	mov	r4, r2
	mov	r5, r3
	bl	caribou_timer_ticks
	mov	r6, r0
	mov	r7, r1
	mov	r3, #0
	mov	r2, r9
	str	r3, [r2]
	b	.L44
.L46:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	bl	caribou_timer_ticks_timeout
	cmp	r0, #0
	bne	.L45
	bl	caribou_thread_yield
.L44:
	mov	r0, r10
	mov	r1, r9
	bl	caribou_queue_try_take_first
	mov	r8, r0
	cmp	r0, #0
	beq	.L46
	mov	r3, #1
	mov	r8, r3
.L45:
	mov	r0, r8
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.LFE43:
	.size	caribou_queue_take_first, .-caribou_queue_take_first
	.section	.text.caribou_queue_index_of,"ax",%progbits
	.align	2
	.global	caribou_queue_index_of
	.code	16
	.thumb_func
	.type	caribou_queue_index_of, %function
caribou_queue_index_of:
.LFB47:
	push	{r4, r5, r6, lr}
.LCFI17:
	mov	r4, r0
	mov	r6, r1
	bl	chip_interrupts_disable
.LBB3:
	ldr	r5, [r4, #4]
	cmp	r5, #0
	ble	.L51
	ldr	r3, [r4, #8]
	ldr	r2, [r3]
	cmp	r2, r6
	beq	.L52
	add	r3, r3, #4
	mov	r4, #0
	b	.L49
.L50:
	add	r3, r3, #4
	sub	r2, r3, #4
	ldr	r2, [r2]
	cmp	r2, r6
	beq	.L48
.L49:
	add	r4, r4, #1
	cmp	r4, r5
	bne	.L50
.LBE3:
	mov	r4, #1
	neg	r4, r4
.LBB4:
	b	.L48
.L51:
.LBE4:
	mov	r4, #1
	neg	r4, r4
	b	.L48
.L52:
.LBB5:
	mov	r4, #0
.L48:
.LBE5:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE47:
	.size	caribou_queue_index_of, .-caribou_queue_index_of
	.section	.text.caribou_queue_swap,"ax",%progbits
	.align	2
	.global	caribou_queue_swap
	.code	16
	.thumb_func
	.type	caribou_queue_swap, %function
caribou_queue_swap:
.LFB48:
	push	{r4, r5, r6, lr}
.LCFI18:
	mov	r6, r0
	mov	r4, r1
	mov	r5, r2
	bl	chip_interrupts_disable
	cmp	r4, #0
	ble	.L55
	cmp	r5, #0
	ble	.L56
	cmp	r4, r5
	beq	.L57
	ldr	r3, [r6, #4]
	cmp	r4, r3
	bge	.L58
	cmp	r5, r3
	bge	.L59
.LBB6:
	ldr	r3, [r6, #8]
	lsl	r4, r4, #2
	add	r4, r3, r4
	ldr	r2, [r4]
	lsl	r5, r5, #2
	ldr	r3, [r3, r5]
	str	r3, [r4]
	ldr	r3, [r6, #8]
	str	r2, [r3, r5]
	ldr	r3, [r6, #8]
	ldr	r4, [r3]
	b	.L54
.L55:
.LBE6:
	mov	r4, #0
	b	.L54
.L56:
	mov	r4, #0
	b	.L54
.L57:
	mov	r4, #0
	b	.L54
.L58:
	mov	r4, #0
	b	.L54
.L59:
	mov	r4, #0
.L54:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE48:
	.size	caribou_queue_swap, .-caribou_queue_swap
	.section	.text.caribou_queue_rotate,"ax",%progbits
	.align	2
	.global	caribou_queue_rotate
	.code	16
	.thumb_func
	.type	caribou_queue_rotate, %function
caribou_queue_rotate:
.LFB49:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI19:
	mov	r4, r0
	bl	chip_interrupts_disable
	ldr	r1, [r4, #4]
	cmp	r1, #0
	ble	.L65
	cmp	r1, #1
	ble	.L62
.LBB7:
	ldr	r3, [r4, #8]
	ldr	r6, [r3]
.LBB8:
	sub	r3, r1, #1
	cmp	r3, #0
	ble	.L63
	mov	r2, #4
	mov	r3, #0
.L64:
	ldr	r1, [r4, #8]
	lsl	r5, r3, #2
	ldr	r7, [r1, r2]
	str	r7, [r5, r1]
	add	r3, r3, #1
	ldr	r1, [r4, #4]
	add	r2, r2, #4
	sub	r5, r1, #1
	cmp	r5, r3
	bgt	.L64
.L63:
.LBE8:
	ldr	r3, .L66
	add	r1, r1, r3
	lsl	r1, r1, #2
	ldr	r5, [r4, #8]
	str	r6, [r1, r5]
.L62:
.LBE7:
	ldr	r3, [r4, #8]
	ldr	r4, [r3]
	b	.L61
.L65:
	mov	r4, #0
.L61:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L67:
	.align	2
.L66:
	.word	1073741823
.LFE49:
	.size	caribou_queue_rotate, .-caribou_queue_rotate
	.section	.text.caribou_queue_try_take_at,"ax",%progbits
	.align	2
	.global	caribou_queue_try_take_at
	.code	16
	.thumb_func
	.type	caribou_queue_try_take_at, %function
caribou_queue_try_take_at:
.LFB51:
	push	{r4, r5, r6, lr}
.LCFI20:
	mov	r5, r0
	mov	r4, r1
	bl	chip_interrupts_disable
	mov	r6, r0
	cmp	r4, #0
	blt	.L70
	ldr	r2, [r5, #4]
	cmp	r4, r2
	bge	.L71
.LBB9:
	sub	r2, r2, r4
	lsl	r2, r2, #2
	ldr	r1, [r5, #8]
	lsl	r4, r4, #2
	add	r0, r1, r4
	ldr	r5, [r0]
	add	r1, r1, r2
	bl	memmove
	b	.L69
.L70:
.LBE9:
	mov	r5, #0
	b	.L69
.L71:
	mov	r5, #0
.L69:
	mov	r0, r6
	bl	chip_interrupts_set
	mov	r0, r5
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE51:
	.size	caribou_queue_try_take_at, .-caribou_queue_try_take_at
	.section	.text.caribou_queue_take_at,"ax",%progbits
	.align	2
	.global	caribou_queue_take_at
	.code	16
	.thumb_func
	.type	caribou_queue_take_at, %function
caribou_queue_take_at:
.LFB50:
	push	{r4, r5, r6, r7, lr}
.LCFI21:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI22:
	mov	r10, r0
	mov	r9, r1
	mov	r4, r2
	mov	r5, r3
	bl	caribou_timer_ticks
	mov	r6, r0
	mov	r7, r1
	b	.L73
.L75:
	bl	caribou_thread_yield
.L73:
	mov	r0, r10
	mov	r1, r9
	bl	caribou_queue_try_take_at
	mov	r8, r0
	cmp	r0, #0
	bne	.L74
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	bl	caribou_timer_ticks_timeout
	cmp	r0, #0
	beq	.L75
.L74:
	mov	r0, r8
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.LFE50:
	.size	caribou_queue_take_at, .-caribou_queue_take_at
	.section	.text.caribou_queue_at,"ax",%progbits
	.align	2
	.global	caribou_queue_at
	.code	16
	.thumb_func
	.type	caribou_queue_at, %function
caribou_queue_at:
.LFB52:
	push	{r3, r4, r5, lr}
.LCFI23:
	mov	r5, r0
	mov	r4, r1
	bl	chip_interrupts_disable
	cmp	r4, #0
	blt	.L78
	ldr	r3, [r5, #4]
	cmp	r4, r3
	bge	.L79
	ldr	r3, [r5, #8]
	lsl	r4, r4, #2
	ldr	r4, [r4, r3]
	b	.L77
.L78:
	mov	r4, #0
	b	.L77
.L79:
	mov	r4, #0
.L77:
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE52:
	.size	caribou_queue_at, .-caribou_queue_at
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
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
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
	.uleb128 0x8
	.byte	0x84
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
	.byte	0x4
	.4byte	.LCFI2-.LFB35
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
	.4byte	.LCFI3-.LFB36
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
	.4byte	.LCFI4-.LFB37
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI5-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI6-.LFB40
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
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI7-.LFB41
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
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI8-.LFB44
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
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI9-.LFB39
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
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI11-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI12-.LFB42
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
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI14-.LFB46
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
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI15-.LFB43
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
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI17-.LFB47
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
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI18-.LFB48
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
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI19-.LFB49
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
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI20-.LFB51
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
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI21-.LFB50
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
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI23-.LFB52
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
.LEFDE40:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/queue.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x186
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x1
	.4byte	.LASF22
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1b
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x3e
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x4d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x5b
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x68
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x74
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x7f
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x9f
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0xb0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0xff
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1
	.byte	0xc1
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x110
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x1
	.byte	0xcf
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x126
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x151
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x17c
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x16b
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x191
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xbc
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
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
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
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF3:
	.ascii	"caribou_queue_full\000"
.LASF19:
	.ascii	"caribou_queue_take_at\000"
.LASF10:
	.ascii	"caribou_queue_post\000"
.LASF9:
	.ascii	"caribou_queue_try_post\000"
.LASF4:
	.ascii	"caribou_queue_empty\000"
.LASF5:
	.ascii	"caribou_queue_depth\000"
.LASF1:
	.ascii	"caribou_queue_delete\000"
.LASF2:
	.ascii	"caribou_queue_init\000"
.LASF13:
	.ascii	"caribou_queue_try_take_first\000"
.LASF12:
	.ascii	"caribou_queue_take_last\000"
.LASF16:
	.ascii	"caribou_queue_swap\000"
.LASF20:
	.ascii	"caribou_queue_at\000"
.LASF7:
	.ascii	"caribou_queue_last\000"
.LASF11:
	.ascii	"caribou_queue_try_take_last\000"
.LASF15:
	.ascii	"caribou_queue_index_of\000"
.LASF21:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF18:
	.ascii	"caribou_queue_try_take_at\000"
.LASF0:
	.ascii	"caribou_queue_new\000"
.LASF6:
	.ascii	"caribou_queue_count\000"
.LASF14:
	.ascii	"caribou_queue_take_first\000"
.LASF17:
	.ascii	"caribou_queue_rotate\000"
.LASF8:
	.ascii	"caribou_queue_first\000"
.LASF22:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/queue.c\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
