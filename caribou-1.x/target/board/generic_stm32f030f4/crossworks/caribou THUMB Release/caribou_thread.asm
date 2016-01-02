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
	.file	"thread.c"
	.text
.Ltext0:
	.section	.text.rd_thread_stack_ptr,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	rd_thread_stack_ptr, %function
rd_thread_stack_ptr:
.LFB32:
@ 112 "../../../cpu/arm/cortex-m0/cpu/cpu.h" 1
	 mrs	r0, psp
 bx	lr

@ 0 "" 2
	.code	16
.LFE32:
	.size	rd_thread_stack_ptr, .-rd_thread_stack_ptr
	.section	.text.remove_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	remove_thread_node, %function
remove_thread_node:
.LFB42:
	ldr	r3, .L10
	ldr	r2, [r3]
	cmp	r2, r0
	bne	.L3
	ldr	r2, [r2]
	str	r2, [r3]
	b	.L4
.L6:
.LBB2:
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L5
	mov	r3, r2
.L8:
	cmp	r3, #0
	bne	.L6
	b	.L7
.L9:
	mov	r3, r2
.L5:
	ldr	r2, [r0]
	str	r2, [r3]
	b	.L7
.L3:
	cmp	r2, #0
	beq	.L7
	ldr	r3, [r2]
	cmp	r3, r0
	bne	.L8
	b	.L9
.L7:
.LBE2:
	mov	r3, #0
	str	r3, [r0]
.L4:
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
.LFE42:
	.size	remove_thread_node, .-remove_thread_node
	.section	.text._caribou_thread_fault_emit,"ax",%progbits
	.align	2
	.global	_caribou_thread_fault_emit
	.code	16
	.thumb_func
	.type	_caribou_thread_fault_emit, %function
_caribou_thread_fault_emit:
.LFB36:
	push	{r4, lr}
.LCFI0:
	mov	r4, r0
	ldr	r3, .L14
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L13
	ldr	r2, .L14
	ldr	r1, [r2, #16]
	blx	r3
.L13:
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
.LFE36:
	.size	_caribou_thread_fault_emit, .-_caribou_thread_fault_emit
	.section	.text.caribou_thread_dump,"ax",%progbits
	.align	2
	.global	caribou_thread_dump
	.code	16
	.thumb_func
	.type	caribou_thread_dump, %function
caribou_thread_dump:
.LFB37:
	@ sp needed
	bx	lr
.LFE37:
	.size	caribou_thread_dump, .-caribou_thread_dump
	.section	.text.caribou_thread_lock,"ax",%progbits
	.align	2
	.global	caribou_thread_lock
	.code	16
	.thumb_func
	.type	caribou_thread_lock, %function
caribou_thread_lock:
.LFB44:
	push	{r4, lr}
.LCFI1:
	bl	chip_systick_irq_disable
	ldr	r3, .L20
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L19
	ldrh	r2, [r3, #48]
	sxth	r4, r2
	add	r2, r2, #1
	strh	r2, [r3, #48]
	b	.L18
.L19:
	mov	r4, #0
.L18:
	bl	chip_systick_irq_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
.LFE44:
	.size	caribou_thread_lock, .-caribou_thread_lock
	.section	.text.caribou_thread_unlock,"ax",%progbits
	.align	2
	.global	caribou_thread_unlock
	.code	16
	.thumb_func
	.type	caribou_thread_unlock, %function
caribou_thread_unlock:
.LFB45:
	push	{r4, lr}
.LCFI2:
	bl	chip_systick_irq_disable
	ldr	r3, .L26
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L24
	ldrh	r2, [r3, #48]
	sxth	r1, r2
	cmp	r1, #0
	ble	.L25
	mov	r4, r1
	sub	r2, r2, #1
	strh	r2, [r3, #48]
	b	.L23
.L24:
	mov	r4, #0
	b	.L23
.L25:
	mov	r4, #0
.L23:
	bl	chip_systick_irq_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
.LFE45:
	.size	caribou_thread_unlock, .-caribou_thread_unlock
	.section	.text.caribou_thread_locked,"ax",%progbits
	.align	2
	.global	caribou_thread_locked
	.code	16
	.thumb_func
	.type	caribou_thread_locked, %function
caribou_thread_locked:
.LFB46:
	push	{r4, lr}
.LCFI3:
	sub	r4, r0, #0
	beq	.L30
.LBB3:
	bl	chip_systick_irq_disable
	ldrh	r4, [r4, #48]
	uxtb	r4, r4
	bl	chip_systick_irq_set
	b	.L29
.L30:
.LBE3:
	mov	r4, #0
.L29:
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE46:
	.size	caribou_thread_locked, .-caribou_thread_locked
	.section	.text.caribou_thread_wakeup,"ax",%progbits
	.align	2
	.global	caribou_thread_wakeup
	.code	16
	.thumb_func
	.type	caribou_thread_wakeup, %function
caribou_thread_wakeup:
.LFB49:
	push	{r4, lr}
.LCFI4:
	mov	r4, r0
	bl	chip_interrupts_disable
	mov	r3, #64
	ldrh	r2, [r4, r3]
	sub	r2, r2, #1
	strh	r2, [r4, r3]
	bl	chip_interrupts_set
	@ sp needed
	pop	{r4, pc}
.LFE49:
	.size	caribou_thread_wakeup, .-caribou_thread_wakeup
	.section	.text.caribou_thread_set_name,"ax",%progbits
	.align	2
	.global	caribou_thread_set_name
	.code	16
	.thumb_func
	.type	caribou_thread_set_name, %function
caribou_thread_set_name:
.LFB50:
	str	r1, [r0, #32]
	mov	r0, r1
	@ sp needed
	bx	lr
.LFE50:
	.size	caribou_thread_set_name, .-caribou_thread_set_name
	.section	.text.caribou_thread_name,"ax",%progbits
	.align	2
	.global	caribou_thread_name
	.code	16
	.thumb_func
	.type	caribou_thread_name, %function
caribou_thread_name:
.LFB51:
	cmp	r0, #0
	beq	.L35
	ldr	r0, [r0, #32]
	b	.L34
.L35:
	ldr	r0, .L36
.L34:
	@ sp needed
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LC4
.LFE51:
	.size	caribou_thread_name, .-caribou_thread_name
	.section	.text.caribou_thread_runtime,"ax",%progbits
	.align	2
	.global	caribou_thread_runtime
	.code	16
	.thumb_func
	.type	caribou_thread_runtime, %function
caribou_thread_runtime:
.LFB52:
	cmp	r0, #0
	beq	.L40
	ldr	r1, [r0, #44]
	ldr	r0, [r0, #40]
	b	.L39
.L40:
	mov	r0, #0
	mov	r1, #0
.L39:
	@ sp needed
	bx	lr
.LFE52:
	.size	caribou_thread_runtime, .-caribou_thread_runtime
	.section	.text.caribou_thread_stacksize,"ax",%progbits
	.align	2
	.global	caribou_thread_stacksize
	.code	16
	.thumb_func
	.type	caribou_thread_stacksize, %function
caribou_thread_stacksize:
.LFB53:
	cmp	r0, #0
	beq	.L43
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #24]
	sub	r0, r2, r3
	b	.L42
.L43:
	mov	r0, #0
.L42:
	@ sp needed
	bx	lr
.LFE53:
	.size	caribou_thread_stacksize, .-caribou_thread_stacksize
	.section	.text.caribou_thread_stackusage,"ax",%progbits
	.align	2
	.global	caribou_thread_stackusage
	.code	16
	.thumb_func
	.type	caribou_thread_stackusage, %function
caribou_thread_stackusage:
.LFB54:
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #12]
	sub	r0, r2, r3
	@ sp needed
	bx	lr
.LFE54:
	.size	caribou_thread_stackusage, .-caribou_thread_stackusage
	.section	.text.caribou_thread_state,"ax",%progbits
	.align	2
	.global	caribou_thread_state
	.code	16
	.thumb_func
	.type	caribou_thread_state, %function
caribou_thread_state:
.LFB55:
	cmp	r0, #0
	beq	.L47
	ldrh	r0, [r0, #28]
	b	.L46
.L47:
	mov	r0, #0
.L46:
	@ sp needed
	bx	lr
.LFE55:
	.size	caribou_thread_state, .-caribou_thread_state
	.section	.text.caribou_thread_parent,"ax",%progbits
	.align	2
	.global	caribou_thread_parent
	.code	16
	.thumb_func
	.type	caribou_thread_parent, %function
caribou_thread_parent:
.LFB56:
	cmp	r0, #0
	beq	.L50
	ldr	r0, [r0, #4]
	b	.L49
.L50:
	mov	r0, #0
.L49:
	@ sp needed
	bx	lr
.LFE56:
	.size	caribou_thread_parent, .-caribou_thread_parent
	.section	.text.caribou_thread_wfi,"ax",%progbits
	.align	2
	.global	caribou_thread_wfi
	.code	16
	.thumb_func
	.type	caribou_thread_wfi, %function
caribou_thread_wfi:
.LFB57:
	push	{r3, lr}
.LCFI5:
	bl	chip_wfi
	@ sp needed
	pop	{r3, pc}
.LFE57:
	.size	caribou_thread_wfi, .-caribou_thread_wfi
	.section	.text.caribou_thread_yield,"ax",%progbits
	.align	2
	.global	caribou_thread_yield
	.code	16
	.thumb_func
	.type	caribou_thread_yield, %function
caribou_thread_yield:
.LFB58:
	push	{r3, lr}
.LCFI6:
	ldr	r3, .L54
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L52
	mov	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L52
	bl	chip_interrupts_enabled
	cmp	r0, #0
	beq	.L52
.LBB4:
	ldr	r2, .L54
	ldr	r3, [r2, #4]
	ldrh	r0, [r3, #28]
	mov	r1, #2
	orr	r1, r0
	strh	r1, [r3, #28]
	mov	r3, #1
	neg	r3, r3
	strh	r3, [r2, #8]
	bl	caribou_preempt
.L52:
.LBE4:
	@ sp needed
	pop	{r3, pc}
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
.LFE58:
	.size	caribou_thread_yield, .-caribou_thread_yield
	.section	.text.caribou_thread_sleep,"ax",%progbits
	.align	2
	.global	caribou_thread_sleep
	.code	16
	.thumb_func
	.type	caribou_thread_sleep, %function
caribou_thread_sleep:
.LFB47:
	push	{r4, r5, r6, r7, lr}
.LCFI7:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI8:
	mov	r7, r0
	mov	r8, r1
	bl	caribou_timer_ticks
	mov	r4, r0
	mov	r5, r1
	bl	chip_interrupts_disable
	mov	r6, #64
	ldrh	r3, [r7, r6]
	add	r3, r3, #1
	strh	r3, [r7, r6]
	bl	chip_interrupts_set
	ldrsh	r3, [r7, r6]
	cmp	r3, #0
	ble	.L56
	mov	r3, r8
	asr	r3, r3, #31
	mov	r9, r3
	mov	r10, r6
.L59:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	bl	caribou_timer_ticks_timeout
	cmp	r0, #0
	beq	.L58
	bl	chip_interrupts_disable
	mov	r3, #64
	ldrh	r2, [r7, r3]
	sub	r2, r2, #1
	strh	r2, [r7, r3]
	bl	chip_interrupts_set
	b	.L56
.L58:
	bl	caribou_thread_yield
	mov	r3, r10
	ldrsh	r6, [r7, r3]
	cmp	r6, #0
	bgt	.L59
.L56:
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.LFE47:
	.size	caribou_thread_sleep, .-caribou_thread_sleep
	.section	.text.caribou_thread_sleep_current,"ax",%progbits
	.align	2
	.global	caribou_thread_sleep_current
	.code	16
	.thumb_func
	.type	caribou_thread_sleep_current, %function
caribou_thread_sleep_current:
.LFB48:
	push	{r3, lr}
.LCFI9:
	mov	r1, r0
.LBB7:
.LBB8:
	ldr	r3, .L61
.LBE8:
.LBE7:
	ldr	r0, [r3, #4]
	bl	caribou_thread_sleep
	@ sp needed
	pop	{r3, pc}
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
.LFE48:
	.size	caribou_thread_sleep_current, .-caribou_thread_sleep_current
	.section	.text.thread_finish,"ax",%progbits
	.align	2
	.global	thread_finish
	.code	16
	.thumb_func
	.type	thread_finish, %function
thread_finish:
.LFB60:
	push	{r3, lr}
.LCFI10:
	ldr	r3, .L65
	ldr	r3, [r3, #4]
	ldrh	r1, [r3, #28]
	mov	r2, #4
	orr	r2, r1
	strh	r2, [r3, #28]
.L64:
	bl	caribou_thread_yield
	b	.L64
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
.LFE60:
	.size	thread_finish, .-thread_finish
	.section	.text.caribou_thread_terminate,"ax",%progbits
	.align	2
	.global	caribou_thread_terminate
	.code	16
	.thumb_func
	.type	caribou_thread_terminate, %function
caribou_thread_terminate:
.LFB59:
	push	{r3, r4, r5, lr}
.LCFI11:
	mov	r4, r0
	bl	chip_interrupts_disable
	mov	r5, r0
	ldrh	r2, [r4, #28]
	mov	r3, #4
	orr	r3, r2
	strh	r3, [r4, #28]
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L68
	ldr	r0, [r4, #36]
	blx	r3
.L68:
	mov	r0, r4
	bl	remove_thread_node
.LBB11:
.LBB12:
	mov	r0, r4
	bl	free
.LBE12:
.LBE11:
	mov	r0, r4
	bl	caribou_timer_delete_all
	mov	r0, r5
	bl	chip_interrupts_set
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE59:
	.size	caribou_thread_terminate, .-caribou_thread_terminate
	.section	.text.caribou_thread_create,"ax",%progbits
	.align	2
	.global	caribou_thread_create
	.code	16
	.thumb_func
	.type	caribou_thread_create, %function
caribou_thread_create:
.LFB61:
	push	{r4, r5, r6, r7, lr}
.LCFI12:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI13:
	sub	sp, sp, #8
.LCFI14:
	mov	r10, r0
	mov	r6, r1
	mov	r9, r2
	mov	r7, r3
	ldr	r5, [sp, #40]
	add	r3, sp, #48
	mov	r2, #0
	ldrsh	r1, [r3, r2]
	str	r1, [sp, #4]
	bl	chip_interrupts_disable
	mov	r8, r0
	cmp	r5, #0
	beq	.L70
	mov	r0, r5
	mov	r1, #250
	ldr	r2, [sp, #44]
	bl	memset
	ldr	r4, [sp, #44]
	sub	r4, r4, #64
	add	r4, r5, r4
	mov	r0, r4
	mov	r1, #0
	mov	r2, #64
	bl	memset
	str	r7, [r4, #32]
	ldr	r3, .L82
	str	r3, [r4, #52]
	mov	r3, #1
	bic	r6, r3
	str	r6, [r4, #56]
	mov	r3, #132
	lsl	r3, r3, #22
	str	r3, [r4, #60]
.L70:
	ldr	r3, .L82+4
	ldr	r3, [r3, #4]
	sub	r6, r3, #0
	bne	.L71
	ldr	r3, .L82+4
	ldr	r6, [r3]
.L71:
.LBB18:
.LBB19:
	mov	r0, #72
	bl	malloc
	sub	r4, r0, #0
	beq	.L72
	mov	r1, #0
	mov	r2, #72
	bl	memset
	str	r6, [r4, #4]
.LBE19:
.LBE18:
	mov	r3, #0
	strh	r3, [r4, #28]
	cmp	r5, #0
	bne	.L73
	b	.L81
.L72:
.LBB21:
.LBB20:
	mov	r0, #8
	bl	_caribou_thread_fault_emit
	b	.L75
.L73:
.LBE20:
.LBE21:
.LBB22:
	ldr	r3, [sp, #44]
	add	r6, r5, r3
	mov	r3, r6
	sub	r3, r3, #64
	str	r3, [r4, #8]
	str	r6, [r4, #20]
	mov	r3, r5
	add	r3, r3, #64
	str	r3, [r4, #16]
	str	r5, [r4, #24]
.LBE22:
	b	.L76
.L81:
	ldr	r3, .L82+8
	str	r3, [r4, #8]
	str	r3, [r4, #20]
	ldr	r3, .L82+12
	str	r3, [r4, #16]
	sub	r3, r3, #64
	str	r3, [r4, #24]
.L76:
	mov	r1, r10
	str	r1, [r4, #32]
	str	r7, [r4, #36]
	ldr	r2, [sp, #4]
	strh	r2, [r4, #30]
	mov	r3, r9
	str	r3, [r4, #52]
.LBB23:
.LBB24:
	ldr	r3, .L82+4
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L77
.L79:
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L78
	mov	r2, r3
	b	.L79
.L78:
	str	r4, [r2]
	b	.L75
.L77:
	ldr	r3, .L82+4
	str	r4, [r3]
	mov	r3, #0
	str	r3, [r4]
.L75:
.LBE24:
.LBE23:
	mov	r0, r8
	bl	chip_interrupts_set
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L83:
	.align	2
.L82:
	.word	thread_finish
	.word	.LANCHOR0
	.word	__process_stack_end__
	.word	__process_stack_base__+64
.LFE61:
	.size	caribou_thread_create, .-caribou_thread_create
	.section	.text.caribou_thread_fault_set,"ax",%progbits
	.align	2
	.global	caribou_thread_fault_set
	.code	16
	.thumb_func
	.type	caribou_thread_fault_set, %function
caribou_thread_fault_set:
.LFB62:
	ldr	r3, .L85
	str	r0, [r3, #12]
	str	r1, [r3, #16]
	mov	r2, #0
	strh	r2, [r3, #20]
	@ sp needed
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
.LFE62:
	.size	caribou_thread_fault_set, .-caribou_thread_fault_set
	.section	.text.caribou_thread_root,"ax",%progbits
	.align	2
	.global	caribou_thread_root
	.code	16
	.thumb_func
	.type	caribou_thread_root, %function
caribou_thread_root:
.LFB63:
	ldr	r3, .L88
	ldr	r0, [r3]
	@ sp needed
	bx	lr
.L89:
	.align	2
.L88:
	.word	.LANCHOR0
.LFE63:
	.size	caribou_thread_root, .-caribou_thread_root
	.section	.text.caribou_thread_current,"ax",%progbits
	.align	2
	.global	caribou_thread_current
	.code	16
	.thumb_func
	.type	caribou_thread_current, %function
caribou_thread_current:
.LFB64:
	ldr	r3, .L91
	ldr	r0, [r3, #4]
	@ sp needed
	bx	lr
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
.LFE64:
	.size	caribou_thread_current, .-caribou_thread_current
	.section	.text.caribou_thread_schedule,"ax",%progbits
	.align	2
	.global	caribou_thread_schedule
	.code	16
	.thumb_func
	.type	caribou_thread_schedule, %function
caribou_thread_schedule:
.LFB65:
	push	{r3, r4, r5, lr}
.LCFI15:
	mov	r4, r0
	bl	chip_interrupts_disable
	mov	r5, r0
	ldr	r3, .L95
	ldr	r3, [r3, #4]
	ldr	r1, [r3]
	mov	r0, #48
	ldrsh	r2, [r3, r0]
	cmp	r2, #0
	bne	.L94
	cmp	r3, r4
	beq	.L94
	cmp	r4, r1
	beq	.L94
	mov	r0, r4
	bl	remove_thread_node
	ldr	r3, .L95
	ldr	r3, [r3, #4]
.LBB27:
.LBB28:
	ldr	r2, [r3]
	str	r4, [r3]
	str	r2, [r4]
.L94:
.LBE28:
.LBE27:
	mov	r0, r5
	bl	chip_interrupts_set
	@ sp needed
	pop	{r3, r4, r5, pc}
.L96:
	.align	2
.L95:
	.word	.LANCHOR0
.LFE65:
	.size	caribou_thread_schedule, .-caribou_thread_schedule
	.section	.text.caribou_thread_first,"ax",%progbits
	.align	2
	.global	caribou_thread_first
	.code	16
	.thumb_func
	.type	caribou_thread_first, %function
caribou_thread_first:
.LFB66:
	ldr	r3, .L98
	ldr	r0, [r3]
	@ sp needed
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
.LFE66:
	.size	caribou_thread_first, .-caribou_thread_first
	.section	.text.caribou_thread_current_arg,"ax",%progbits
	.align	2
	.global	caribou_thread_current_arg
	.code	16
	.thumb_func
	.type	caribou_thread_current_arg, %function
caribou_thread_current_arg:
.LFB67:
	ldr	r3, .L101
	ldr	r3, [r3, #4]
	ldr	r0, [r3, #36]
	@ sp needed
	bx	lr
.L102:
	.align	2
.L101:
	.word	.LANCHOR0
.LFE67:
	.size	caribou_thread_current_arg, .-caribou_thread_current_arg
	.section	.text.caribou_thread_set_priority,"ax",%progbits
	.align	2
	.global	caribou_thread_set_priority
	.code	16
	.thumb_func
	.type	caribou_thread_set_priority, %function
caribou_thread_set_priority:
.LFB68:
	push	{r3, r4, r5, lr}
.LCFI16:
	mov	r4, r0
	mov	r5, r1
	bl	caribou_lock
	strh	r5, [r4, #30]
	bl	caribou_lock_set
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE68:
	.size	caribou_thread_set_priority, .-caribou_thread_set_priority
	.section	.text.caribou_thread_priority,"ax",%progbits
	.align	2
	.global	caribou_thread_priority
	.code	16
	.thumb_func
	.type	caribou_thread_priority, %function
caribou_thread_priority:
.LFB69:
	cmp	r0, #0
	beq	.L106
	ldrh	r0, [r0, #30]
	b	.L105
.L106:
	mov	r0, #0
.L105:
	sxth	r0, r0
	@ sp needed
	bx	lr
.LFE69:
	.size	caribou_thread_priority, .-caribou_thread_priority
	.section	.text.caribou_thread_init,"ax",%progbits
	.align	2
	.global	caribou_thread_init
	.code	16
	.thumb_func
	.type	caribou_thread_init, %function
caribou_thread_init:
.LFB70:
	push	{r4, r5, lr}
.LCFI17:
	sub	sp, sp, #20
.LCFI18:
	mov	r5, r0
	ldr	r4, .L108
	mov	r0, r4
	mov	r1, #0
	mov	r2, #40
	bl	memset
	mov	r3, #0
	str	r3, [sp]
	str	r3, [sp, #4]
	str	r5, [sp, #8]
	ldr	r0, .L108+4
	mov	r1, #0
	mov	r2, #0
	bl	caribou_thread_create
	str	r0, [r4, #4]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L109:
	.align	2
.L108:
	.word	.LANCHOR0
	.word	.LC21
.LFE70:
	.size	caribou_thread_init, .-caribou_thread_init
	.section	.text.main_idle,"ax",%progbits
	.align	2
	.weak	main_idle
	.code	16
	.thumb_func
	.type	main_idle, %function
main_idle:
.LFB71:
	@ sp needed
	bx	lr
.LFE71:
	.size	main_idle, .-main_idle
	.section	.text.board_idle,"ax",%progbits
	.align	2
	.weak	board_idle
	.code	16
	.thumb_func
	.type	board_idle, %function
board_idle:
.LFB72:
	@ sp needed
	bx	lr
.LFE72:
	.size	board_idle, .-board_idle
	.section	.text.caribou_thread_once,"ax",%progbits
	.align	2
	.global	caribou_thread_once
	.code	16
	.thumb_func
	.type	caribou_thread_once, %function
caribou_thread_once:
.LFB74:
	push	{r4, r5, r6, lr}
.LCFI19:
	bl	board_idle
	ldr	r4, .L122
	ldr	r0, [r4]
	bl	caribou_timer_idle
	ldr	r4, [r4]
	cmp	r4, #0
	beq	.L112
	ldr	r6, .L122
.L121:
	ldr	r5, [r4]
.LBB31:
.LBB32:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	bls	.L114
	ldr	r2, [r4, #20]
	cmp	r3, r2
	bhi	.L115
	b	.L116
.L114:
	mov	r0, #1
	bl	_caribou_thread_fault_emit
	b	.L116
.L115:
	ldr	r2, [r4, #24]
	cmp	r3, r2
	bhi	.L117
	mov	r0, #4
	bl	_caribou_thread_fault_emit
	b	.L116
.L117:
	mov	r0, #2
	bl	_caribou_thread_fault_emit
.L116:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	cmp	r3, r2
	bcc	.L118
	cmp	r2, #0
	bne	.L119
.L118:
	str	r3, [r4, #12]
.L119:
.LBE32:
.LBE31:
	ldrh	r3, [r4, #28]
	lsl	r2, r3, #29
	bpl	.L120
	ldr	r3, [r6, #4]
	cmp	r3, r4
	beq	.L120
	mov	r0, r4
	bl	caribou_thread_terminate
.L120:
	cmp	r5, #0
	beq	.L112
	mov	r4, r5
	b	.L121
.L112:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L123:
	.align	2
.L122:
	.word	.LANCHOR0
.LFE74:
	.size	caribou_thread_once, .-caribou_thread_once
	.section	.text.caribou_thread_exec,"ax",%progbits
	.align	2
	.global	caribou_thread_exec
	.code	16
	.thumb_func
	.type	caribou_thread_exec, %function
caribou_thread_exec:
.LFB75:
	push	{r3, lr}
.LCFI20:
.L125:
	bl	caribou_thread_once
	bl	caribou_thread_yield
	b	.L125
.LFE75:
	.size	caribou_thread_exec, .-caribou_thread_exec
	.section	.text._pendsv,"ax",%progbits
	.align	2
	.global	_pendsv
	.code	16
	.thumb_func
	.type	_pendsv, %function
_pendsv:
.LFB76:
@ 707 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
		push	{lr}			
	mrs		r0, psp			
	sub		r0,r0,#16		
	stm		r0!, {r4-r7}	
	mov		r4,r8			
	mov		r5,r9			
	mov		r6,r10			
	mov		r7,r11			
	sub		r0,r0,#32		
	stm		r0!, {r4-r7}	
	sub		r0,r0,#16		
	msr		psp, r0			

@ 0 "" 2
	.code	16
	ldr	r3, .L132
	ldr	r1, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #18
	orr	r2, r1
	str	r2, [r3, #4]
	ldr	r1, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #20
	orr	r2, r1
	str	r2, [r3, #4]
	ldr	r4, .L132+4
	ldr	r5, [r4, #4]
	bl	rd_thread_stack_ptr
	str	r0, [r5, #8]
	ldr	r3, [r4, #4]
	ldr	r2, .L132+8
	ldr	r2, [r2]
	str	r2, [r3, #60]
	mov	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L127
	ldr	r2, .L132+4
	ldrh	r3, [r2, #8]
	sub	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r2, #8]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L127
	ldr	r6, [r2]
	mov	r4, r2
	mov	r0, r2
	mov	r1, #6
	mov	r5, #2
	b	.L128
.L130:
	bic	r2, r5
	strh	r2, [r3, #28]
.L128:
	ldr	r3, [r4, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L129
	mov	r3, r6
.L129:
	str	r3, [r0, #4]
	ldrh	r2, [r3, #28]
	tst	r1, r2
	bne	.L130
	ldrh	r1, [r3, #30]
	ldr	r2, .L132+4
	strh	r1, [r2, #8]
	ldr	r2, [r3, #60]
	ldr	r3, .L132+8
	str	r2, [r3]
.L127:
	ldr	r3, .L132+4
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #8]
@ 713 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
	 msr psp, r3
	
@ 0 "" 2
@ 714 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
		mrs		r0, psp			
	ldmfd	r0!, {r4-r7}	
	mov		r11,r7			
	mov		r10,r6			
	mov		r9,r5			
	mov		r8,r4			
	ldmfd	r0!, {r4-r7}	
	msr		psp, r0			
	pop		{pc}			

@ 0 "" 2
	.code	16
.L133:
	.align	2
.L132:
	.word	-536810240
	.word	.LANCHOR0
	.word	__errno
.LFE76:
	.size	_pendsv, .-_pendsv
	.section	.text._systick,"ax",%progbits
	.align	2
	.global	_systick
	.code	16
	.thumb_func
	.type	_systick, %function
_systick:
.LFB77:
@ 726 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
		push	{lr}			
	mrs		r0, psp			
	sub		r0,r0,#16		
	stm		r0!, {r4-r7}	
	mov		r4,r8			
	mov		r5,r9			
	mov		r6,r10			
	mov		r7,r11			
	sub		r0,r0,#32		
	stm		r0!, {r4-r7}	
	sub		r0,r0,#16		
	msr		psp, r0			

@ 0 "" 2
	.code	16
	ldr	r3, .L140
	ldr	r1, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #18
	orr	r1, r2
	str	r1, [r3, #4]
	ldr	r1, [r3, #4]
	orr	r2, r1
	str	r2, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #3
	mov	r3, #144
	lsl	r3, r3, #23
	str	r2, [r3, #24]
	ldr	r4, .L140+4
	ldr	r5, [r4, #4]
	bl	rd_thread_stack_ptr
	str	r0, [r5, #8]
	mov	r2, #1
	mov	r3, #0
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	add	r0, r0, r2
	adc	r1, r1, r3
	str	r0, [r4, #24]
	str	r1, [r4, #28]
	ldr	r1, [r4, #4]
	ldr	r4, [r1, #40]
	ldr	r5, [r1, #44]
	add	r2, r2, r4
	adc	r3, r3, r5
	str	r2, [r1, #40]
	str	r3, [r1, #44]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [r1, #60]
	mov	r5, #48
	ldrsh	r3, [r1, r5]
	cmp	r3, #0
	bne	.L135
	ldr	r2, .L140+4
	ldrh	r3, [r2, #8]
	sub	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r2, #8]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L135
	ldr	r6, [r2]
	mov	r4, r2
	mov	r0, r2
	mov	r1, #6
	mov	r5, #2
	b	.L136
.L138:
	bic	r2, r5
	strh	r2, [r3, #28]
.L136:
	ldr	r3, [r4, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L137
	mov	r3, r6
.L137:
	str	r3, [r0, #4]
	ldrh	r2, [r3, #28]
	tst	r1, r2
	bne	.L138
	ldrh	r1, [r3, #30]
	ldr	r2, .L140+4
	strh	r1, [r2, #8]
	ldr	r2, [r3, #60]
	ldr	r3, .L140+8
	str	r2, [r3]
.L135:
	ldr	r3, .L140+4
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #8]
@ 735 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
	 msr psp, r3
	
@ 0 "" 2
	.code	16
	mov	r2, #128
	lsl	r2, r2, #3
	mov	r3, #144
	lsl	r3, r3, #23
	strh	r2, [r3, #40]
@ 737 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
		mrs		r0, psp			
	ldmfd	r0!, {r4-r7}	
	mov		r11,r7			
	mov		r10,r6			
	mov		r9,r5			
	mov		r8,r4			
	ldmfd	r0!, {r4-r7}	
	msr		psp, r0			
	pop		{pc}			

@ 0 "" 2
	.code	16
.L141:
	.align	2
.L140:
	.word	-536810240
	.word	.LANCHOR0
	.word	__errno
.LFE77:
	.size	_systick, .-_systick
	.global	caribou_state
	.section	.bss.caribou_state,"aw",%nobits
	.align	3
	.set	.LANCHOR0,. + 0
	.type	caribou_state, %object
	.size	caribou_state, 40
caribou_state:
	.space	40
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC4:
	.ascii	"\000"
	.space	3
.LC21:
	.ascii	"CARIBOU\000"
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI0-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI1-.LFB44
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
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI2-.LFB45
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
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI3-.LFB46
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
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI4-.LFB49
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
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI5-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.byte	0x4
	.4byte	.LCFI6-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI7-.LFB47
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
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI9-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.byte	0x4
	.4byte	.LCFI10-.LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.byte	0x4
	.4byte	.LCFI11-.LFB59
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
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI12-.LFB61
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
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x28
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI15-.LFB65
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
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.byte	0x4
	.4byte	.LCFI16-.LFB68
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
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI17-.LFB70
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x20
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI19-.LFB74
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
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI20-.LFB75
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.align	2
.LEFDE72:
	.text
.Letext0:
	.file 1 "../../../cpu/arm/cortex-m0/cpu/cpu.h"
	.file 2 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2f5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x1
	.4byte	.LASF44
	.4byte	.LASF45
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x6e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0xd3
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x67
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x84
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0xfd
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF5
	.byte	0x2
	.2byte	0x10e
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x2
	.2byte	0x11f
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x151
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x2
	.2byte	0x159
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x2
	.2byte	0x160
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x166
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x16c
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.2byte	0x172
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x2
	.2byte	0x178
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x17e
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x186
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x18f
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x131
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x211
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x14a
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x1b3
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x2
	.byte	0xaa
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x19f
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x2
	.byte	0x98
	.byte	0x1
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x2
	.byte	0xb2
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x1ca
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x1ff
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x209
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	0x160
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x2
	.byte	0xc8
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x21c
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x22b
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x231
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x23e
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25f
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x2
	.byte	0x51
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x2
	.byte	0x53
	.byte	0
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x248
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x251
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x262
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x26c
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x270
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x287
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x2a1
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x2c1
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x2d4
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
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
	.uleb128 0x1b
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
	.uleb128 0x2116
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
	.uleb128 0x6
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
	.uleb128 0x2117
	.uleb128 0x19
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
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x13c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
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
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
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
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
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
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB60
	.4byte	.LFE60
	.4byte	.LFB59
	.4byte	.LFE59
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
	.4byte	.LFB74
	.4byte	.LFE74
	.4byte	.LFB75
	.4byte	.LFE75
	.4byte	.LFB76
	.4byte	.LFE76
	.4byte	.LFB77
	.4byte	.LFE77
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF25:
	.ascii	"caribou_thread_fault_set\000"
.LASF5:
	.ascii	"caribou_thread_unlock\000"
.LASF6:
	.ascii	"caribou_thread_locked\000"
.LASF43:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF37:
	.ascii	"board_idle\000"
.LASF26:
	.ascii	"caribou_thread_root\000"
.LASF3:
	.ascii	"caribou_thread_dump\000"
.LASF12:
	.ascii	"caribou_thread_stackusage\000"
.LASF27:
	.ascii	"insert_thread_node\000"
.LASF29:
	.ascii	"caribou_thread_first\000"
.LASF13:
	.ascii	"caribou_thread_state\000"
.LASF33:
	.ascii	"caribou_lock_set\000"
.LASF9:
	.ascii	"caribou_thread_name\000"
.LASF31:
	.ascii	"caribou_thread_current\000"
.LASF41:
	.ascii	"_pendsv\000"
.LASF8:
	.ascii	"caribou_thread_set_name\000"
.LASF7:
	.ascii	"caribou_thread_wakeup\000"
.LASF45:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF19:
	.ascii	"thread_finish\000"
.LASF38:
	.ascii	"check_sp\000"
.LASF17:
	.ascii	"caribou_thread_sleep\000"
.LASF4:
	.ascii	"caribou_thread_lock\000"
.LASF16:
	.ascii	"caribou_thread_yield\000"
.LASF0:
	.ascii	"rd_thread_stack_ptr\000"
.LASF11:
	.ascii	"caribou_thread_stacksize\000"
.LASF22:
	.ascii	"new_thread_node\000"
.LASF10:
	.ascii	"caribou_thread_runtime\000"
.LASF42:
	.ascii	"_systick\000"
.LASF21:
	.ascii	"delete_thread_node\000"
.LASF36:
	.ascii	"main_idle\000"
.LASF39:
	.ascii	"caribou_thread_once\000"
.LASF35:
	.ascii	"caribou_thread_init\000"
.LASF15:
	.ascii	"caribou_thread_wfi\000"
.LASF34:
	.ascii	"caribou_thread_priority\000"
.LASF20:
	.ascii	"caribou_thread_terminate\000"
.LASF23:
	.ascii	"append_thread_node\000"
.LASF18:
	.ascii	"caribou_thread_sleep_current\000"
.LASF24:
	.ascii	"caribou_thread_create\000"
.LASF32:
	.ascii	"caribou_lock\000"
.LASF44:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/kernel/thread.c\000"
.LASF14:
	.ascii	"caribou_thread_parent\000"
.LASF30:
	.ascii	"caribou_thread_current_arg\000"
.LASF28:
	.ascii	"caribou_thread_schedule\000"
.LASF46:
	.ascii	"caribou_thread_set_priority\000"
.LASF2:
	.ascii	"_caribou_thread_fault_emit\000"
.LASF1:
	.ascii	"remove_thread_node\000"
.LASF40:
	.ascii	"caribou_thread_exec\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
