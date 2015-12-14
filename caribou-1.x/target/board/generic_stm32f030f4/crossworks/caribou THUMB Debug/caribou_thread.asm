	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"thread.c"
	.text
.Ltext0:
	.section	.text.rd_thread_stack_ptr,"ax",%progbits
	.align	1
	.code	16
	.thumb_func
	.type	rd_thread_stack_ptr, %function
rd_thread_stack_ptr:
.LFB32:
	.file 1 "../../../cpu/arm/cortex-m0/cpu/cpu.h"
	.loc 1 111 0
	.loc 1 112 0
@ 112 "../../../cpu/arm/cortex-m0/cpu/cpu.h" 1
	 mrs	r0, psp
 bx	lr

@ 0 "" 2
	.loc 1 114 0
	.code	16
.LFE32:
	.size	rd_thread_stack_ptr, .-rd_thread_stack_ptr
	.section	.text.remove_thread_node,"ax",%progbits
	.align	1
	.code	16
	.thumb_func
	.type	remove_thread_node, %function
remove_thread_node:
.LFB42:
	.file 2 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c"
	.loc 2 212 0
.LVL0:
	.loc 2 213 0
	ldr	r2, .L10
	ldr	r3, [r2]
	cmp	r0, r3
	bne	.L6
	.loc 2 215 0
	ldr	r3, [r0]
	str	r3, [r2]
	b	.L4
.LVL1:
.L8:
.LBB9:
	.loc 2 221 0
	ldr	r2, [r3]
	cmp	r2, r0
	beq	.L5
	.loc 2 219 0
	mov	r3, r2
.LVL2:
.L6:
	.loc 2 219 0 is_stmt 0 discriminator 1
	cmp	r3, #0
	bne	.L8
	b	.L7
.L5:
	.loc 2 223 0 is_stmt 1
	ldr	r2, [r0]
	str	r2, [r3]
.L7:
.LBE9:
	.loc 2 227 0
	mov	r3, #0
.LVL3:
	str	r3, [r0]
.L4:
	.loc 2 230 0
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
.LFE42:
	.size	remove_thread_node, .-remove_thread_node
	.section	.text._caribou_thread_fault_emit,"ax",%progbits
	.align	1
	.global	_caribou_thread_fault_emit
	.code	16
	.thumb_func
	.type	_caribou_thread_fault_emit, %function
_caribou_thread_fault_emit:
.LFB36:
	.loc 2 104 0
.LVL4:
	.loc 2 105 0
	ldr	r2, .L17
	.loc 2 104 0
	push	{r4, lr}
.LCFI0:
	.loc 2 105 0
	ldr	r3, [r2, #12]
	.loc 2 104 0
	mov	r4, r0
	.loc 2 105 0
	cmp	r3, #0
	beq	.L13
	.loc 2 107 0
	ldr	r1, [r2, #16]
	blx	r3
.LVL5:
.L13:
	.loc 2 110 0
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
.LFE36:
	.size	_caribou_thread_fault_emit, .-_caribou_thread_fault_emit
	.section	.text.caribou_thread_dump,"ax",%progbits
	.align	1
	.global	caribou_thread_dump
	.code	16
	.thumb_func
	.type	caribou_thread_dump, %function
caribou_thread_dump:
.LFB37:
	.loc 2 133 0
	.loc 2 142 0
	@ sp needed
	bx	lr
.LFE37:
	.size	caribou_thread_dump, .-caribou_thread_dump
	.section	.text.caribou_thread_lock,"ax",%progbits
	.align	1
	.global	caribou_thread_lock
	.code	16
	.thumb_func
	.type	caribou_thread_lock, %function
caribou_thread_lock:
.LFB44:
	.loc 2 254 0
.LVL6:
	push	{r4, lr}
.LCFI1:
	.loc 2 256 0
	bl	chip_systick_irq_disable
.LVL7:
	.loc 2 257 0
	ldr	r3, .L23
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L22
	.loc 2 259 0
	ldrh	r2, [r3, #48]
	sxth	r4, r2
.LVL8:
	.loc 2 260 0
	add	r2, r2, #1
	strh	r2, [r3, #48]
	b	.L21
.LVL9:
.L22:
	.loc 2 255 0
	mov	r4, r3
.LVL10:
.L21:
	.loc 2 262 0
	bl	chip_systick_irq_set
.LVL11:
	.loc 2 264 0
	@ sp needed
	mov	r0, r4
.LVL12:
	pop	{r4, pc}
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
.LFE44:
	.size	caribou_thread_lock, .-caribou_thread_lock
	.section	.text.caribou_thread_unlock,"ax",%progbits
	.align	1
	.global	caribou_thread_unlock
	.code	16
	.thumb_func
	.type	caribou_thread_unlock, %function
caribou_thread_unlock:
.LFB45:
	.loc 2 271 0
.LVL13:
	push	{r4, lr}
.LCFI2:
	.loc 2 273 0
	bl	chip_systick_irq_disable
.LVL14:
	.loc 2 274 0
	ldr	r3, .L29
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L27
	.loc 2 274 0 is_stmt 0 discriminator 1
	ldrh	r2, [r3, #48]
	sxth	r4, r2
	cmp	r4, #0
	ble	.L28
.LVL15:
	.loc 2 277 0 is_stmt 1
	sub	r2, r2, #1
.LVL16:
	strh	r2, [r3, #48]
	b	.L26
.LVL17:
.L27:
	.loc 2 272 0
	mov	r4, r3
	b	.L26
.L28:
	mov	r4, #0
.LVL18:
.L26:
	.loc 2 279 0
	bl	chip_systick_irq_set
.LVL19:
	.loc 2 281 0
	@ sp needed
	mov	r0, r4
.LVL20:
	pop	{r4, pc}
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
.LFE45:
	.size	caribou_thread_unlock, .-caribou_thread_unlock
	.section	.text.caribou_thread_locked,"ax",%progbits
	.align	1
	.global	caribou_thread_locked
	.code	16
	.thumb_func
	.type	caribou_thread_locked, %function
caribou_thread_locked:
.LFB46:
	.loc 2 288 0
.LVL21:
	push	{r4, lr}
.LCFI3:
	.loc 2 288 0
	sub	r4, r0, #0
	.loc 2 290 0
	beq	.L32
.LBB10:
	.loc 2 292 0
	bl	chip_systick_irq_disable
.LVL22:
	.loc 2 293 0
	ldrh	r4, [r4, #48]
.LVL23:
	uxtb	r4, r4
.LVL24:
	.loc 2 294 0
	bl	chip_systick_irq_set
.LVL25:
.L32:
.LBE10:
	.loc 2 297 0
	mov	r0, r4
	@ sp needed
.LVL26:
	pop	{r4, pc}
.LFE46:
	.size	caribou_thread_locked, .-caribou_thread_locked
	.section	.text.caribou_thread_wakeup,"ax",%progbits
	.align	1
	.global	caribou_thread_wakeup
	.code	16
	.thumb_func
	.type	caribou_thread_wakeup, %function
caribou_thread_wakeup:
.LFB49:
	.loc 2 338 0
.LVL27:
	push	{r4, lr}
.LCFI4:
	.loc 2 338 0
	mov	r4, r0
	.loc 2 339 0
	bl	chip_interrupts_disable
.LVL28:
	.loc 2 340 0
	add	r3, r4, #2
	ldrh	r2, [r3, #62]
	.loc 2 342 0
	@ sp needed
	.loc 2 340 0
	sub	r2, r2, #1
	strh	r2, [r3, #62]
	.loc 2 341 0
	bl	chip_interrupts_set
.LVL29:
.LVL30:
	.loc 2 342 0
	pop	{r4, pc}
.LFE49:
	.size	caribou_thread_wakeup, .-caribou_thread_wakeup
	.section	.text.caribou_thread_set_name,"ax",%progbits
	.align	1
	.global	caribou_thread_set_name
	.code	16
	.thumb_func
	.type	caribou_thread_set_name, %function
caribou_thread_set_name:
.LFB50:
	.loc 2 346 0
.LVL31:
	.loc 2 347 0
	str	r1, [r0, #32]
	.loc 2 349 0
	@ sp needed
	mov	r0, r1
.LVL32:
	bx	lr
.LFE50:
	.size	caribou_thread_set_name, .-caribou_thread_set_name
	.section	.text.caribou_thread_name,"ax",%progbits
	.align	1
	.global	caribou_thread_name
	.code	16
	.thumb_func
	.type	caribou_thread_name, %function
caribou_thread_name:
.LFB51:
	.loc 2 353 0
.LVL33:
	.loc 2 354 0
	cmp	r0, #0
	beq	.L38
	.loc 2 354 0 is_stmt 0 discriminator 1
	ldr	r0, [r0, #32]
.LVL34:
	b	.L37
.LVL35:
.L38:
	.loc 2 354 0
	ldr	r0, .L39
.LVL36:
.L37:
	.loc 2 355 0 is_stmt 1 discriminator 3
	@ sp needed
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LC4
.LFE51:
	.size	caribou_thread_name, .-caribou_thread_name
	.section	.text.caribou_thread_runtime,"ax",%progbits
	.align	1
	.global	caribou_thread_runtime
	.code	16
	.thumb_func
	.type	caribou_thread_runtime, %function
caribou_thread_runtime:
.LFB52:
	.loc 2 359 0
.LVL37:
	.loc 2 360 0
	cmp	r0, #0
	beq	.L43
	.loc 2 360 0 is_stmt 0 discriminator 1
	ldr	r1, [r0, #44]
	ldr	r0, [r0, #40]
.LVL38:
	b	.L42
.LVL39:
.L43:
	.loc 2 360 0
	mov	r0, #0
	mov	r1, #0
.LVL40:
.L42:
	.loc 2 361 0 is_stmt 1 discriminator 3
	@ sp needed
	bx	lr
.LFE52:
	.size	caribou_thread_runtime, .-caribou_thread_runtime
	.section	.text.caribou_thread_stacksize,"ax",%progbits
	.align	1
	.global	caribou_thread_stacksize
	.code	16
	.thumb_func
	.type	caribou_thread_stacksize, %function
caribou_thread_stacksize:
.LFB53:
	.loc 2 365 0
.LVL41:
	.loc 2 366 0
	cmp	r0, #0
	beq	.L45
	.loc 2 366 0 is_stmt 0 discriminator 1
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #24]
	sub	r0, r2, r3
.LVL42:
.L45:
	.loc 2 367 0 is_stmt 1 discriminator 3
	@ sp needed
	bx	lr
.LFE53:
	.size	caribou_thread_stacksize, .-caribou_thread_stacksize
	.section	.text.caribou_thread_stackusage,"ax",%progbits
	.align	1
	.global	caribou_thread_stackusage
	.code	16
	.thumb_func
	.type	caribou_thread_stackusage, %function
caribou_thread_stackusage:
.LFB54:
	.loc 2 371 0
.LVL43:
	.loc 2 372 0
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #12]
	.loc 2 373 0
	@ sp needed
	.loc 2 372 0
	sub	r0, r2, r3
.LVL44:
	.loc 2 373 0
	bx	lr
.LFE54:
	.size	caribou_thread_stackusage, .-caribou_thread_stackusage
	.section	.text.caribou_thread_state,"ax",%progbits
	.align	1
	.global	caribou_thread_state
	.code	16
	.thumb_func
	.type	caribou_thread_state, %function
caribou_thread_state:
.LFB55:
	.loc 2 377 0
.LVL45:
	.loc 2 378 0
	cmp	r0, #0
	beq	.L49
	.loc 2 378 0 is_stmt 0 discriminator 1
	ldrh	r0, [r0, #28]
.LVL46:
.L49:
	.loc 2 379 0 is_stmt 1 discriminator 3
	@ sp needed
	bx	lr
.LFE55:
	.size	caribou_thread_state, .-caribou_thread_state
	.section	.text.caribou_thread_parent,"ax",%progbits
	.align	1
	.global	caribou_thread_parent
	.code	16
	.thumb_func
	.type	caribou_thread_parent, %function
caribou_thread_parent:
.LFB56:
	.loc 2 383 0
.LVL47:
	.loc 2 384 0
	cmp	r0, #0
	beq	.L52
	.loc 2 384 0 is_stmt 0 discriminator 1
	ldr	r0, [r0, #4]
.LVL48:
.L52:
	.loc 2 385 0 is_stmt 1 discriminator 3
	@ sp needed
	bx	lr
.LFE56:
	.size	caribou_thread_parent, .-caribou_thread_parent
	.section	.text.caribou_thread_wfi,"ax",%progbits
	.align	1
	.global	caribou_thread_wfi
	.code	16
	.thumb_func
	.type	caribou_thread_wfi, %function
caribou_thread_wfi:
.LFB57:
	.loc 2 391 0
	push	{r3, lr}
.LCFI5:
	.loc 2 392 0
	bl	chip_wfi
.LVL49:
	.loc 2 393 0
	@ sp needed
	pop	{r3, pc}
.LFE57:
	.size	caribou_thread_wfi, .-caribou_thread_wfi
	.section	.text.caribou_thread_yield,"ax",%progbits
	.align	1
	.global	caribou_thread_yield
	.code	16
	.thumb_func
	.type	caribou_thread_yield, %function
caribou_thread_yield:
.LFB58:
	.loc 2 400 0
	push	{r4, lr}
.LCFI6:
	.loc 2 401 0
	ldr	r4, .L62
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L55
	.loc 2 401 0 is_stmt 0 discriminator 1
	mov	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L55
	bl	chip_interrupts_enabled
.LVL50:
	cmp	r0, #0
	beq	.L55
.LBB15:
.LBB16:
	.loc 2 403 0 is_stmt 1
	ldr	r3, [r4, #4]
	mov	r1, #2
	ldrh	r2, [r3, #28]
	orr	r2, r1
	strh	r2, [r3, #28]
	.loc 2 404 0
	mov	r3, #1
	neg	r3, r3
	strh	r3, [r4, #8]
	.loc 2 405 0
	bl	caribou_preempt
.LVL51:
.L55:
.LBE16:
.LBE15:
	.loc 2 407 0
	@ sp needed
	pop	{r4, pc}
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
.LFE58:
	.size	caribou_thread_yield, .-caribou_thread_yield
	.section	.text.caribou_thread_sleep,"ax",%progbits
	.align	1
	.global	caribou_thread_sleep
	.code	16
	.thumb_func
	.type	caribou_thread_sleep, %function
caribou_thread_sleep:
.LFB47:
	.loc 2 306 0
.LVL52:
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
.LCFI7:
	.loc 2 306 0
	mov	r7, r1
	str	r0, [sp, #4]
	.loc 2 307 0
	bl	caribou_timer_ticks
.LVL53:
	mov	r4, r0
	mov	r5, r1
.LVL54:
	.loc 2 308 0
	bl	chip_interrupts_disable
.LVL55:
	.loc 2 309 0
	ldr	r3, [sp, #4]
	add	r3, r3, #2
	ldrh	r2, [r3, #62]
	add	r2, r2, #1
	strh	r2, [r3, #62]
	.loc 2 310 0
	bl	chip_interrupts_set
.LVL56:
.L65:
	.loc 2 311 0 discriminator 1
	ldr	r6, [sp, #4]
	add	r6, r6, #2
	mov	r2, #62
	ldrsh	r3, [r6, r2]
	cmp	r3, #0
	ble	.L64
	.loc 2 313 0
	asr	r3, r7, #31
	mov	r0, r4
	mov	r1, r5
	mov	r2, r7
	bl	caribou_timer_ticks_timeout
.LVL57:
	cmp	r0, #0
	beq	.L66
	.loc 2 315 0
	bl	chip_interrupts_disable
.LVL58:
	.loc 2 316 0
	ldrh	r3, [r6, #62]
	sub	r3, r3, #1
	strh	r3, [r6, #62]
	.loc 2 317 0
	bl	chip_interrupts_set
.LVL59:
	.loc 2 318 0
	b	.L64
.L66:
	.loc 2 320 0
	bl	caribou_thread_yield
.LVL60:
	b	.L65
.L64:
	.loc 2 322 0
	@ sp needed
.LVL61:
.LVL62:
	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
.LFE47:
	.size	caribou_thread_sleep, .-caribou_thread_sleep
	.section	.text.caribou_thread_sleep_current,"ax",%progbits
	.align	1
	.global	caribou_thread_sleep_current
	.code	16
	.thumb_func
	.type	caribou_thread_sleep_current, %function
caribou_thread_sleep_current:
.LFB48:
	.loc 2 331 0
.LVL63:
	push	{r3, lr}
.LCFI8:
.LBB17:
.LBB18:
	.loc 2 531 0
	ldr	r3, .L70
.LBE18:
.LBE17:
	.loc 2 331 0
	mov	r1, r0
	.loc 2 332 0
	ldr	r0, [r3, #4]
.LVL64:
	bl	caribou_thread_sleep
.LVL65:
	.loc 2 333 0
	@ sp needed
	pop	{r3, pc}
.L71:
	.align	2
.L70:
	.word	.LANCHOR0
.LFE48:
	.size	caribou_thread_sleep_current, .-caribou_thread_sleep_current
	.section	.text.thread_finish,"ax",%progbits
	.align	1
	.global	thread_finish
	.code	16
	.thumb_func
	.type	thread_finish, %function
thread_finish:
.LFB60:
	.loc 2 436 0
	push	{r3, lr}
.LCFI9:
	.loc 2 437 0
	ldr	r3, .L74
	mov	r1, #4
	ldr	r3, [r3, #4]
	ldrh	r2, [r3, #28]
	orr	r2, r1
	strh	r2, [r3, #28]
.L73:
	.loc 2 441 0 discriminator 1
	bl	caribou_thread_yield
.LVL66:
	b	.L73
.L75:
	.align	2
.L74:
	.word	.LANCHOR0
.LFE60:
	.size	thread_finish, .-thread_finish
	.section	.text.caribou_thread_terminate,"ax",%progbits
	.align	1
	.global	caribou_thread_terminate
	.code	16
	.thumb_func
	.type	caribou_thread_terminate, %function
caribou_thread_terminate:
.LFB59:
	.loc 2 416 0
.LVL67:
	push	{r3, r4, r5, lr}
.LCFI10:
	.loc 2 416 0
	mov	r4, r0
	.loc 2 417 0
	bl	chip_interrupts_disable
.LVL68:
	.loc 2 419 0
	ldrh	r3, [r4, #28]
	mov	r2, #4
	orr	r3, r2
	strh	r3, [r4, #28]
	.loc 2 420 0
	ldr	r3, [r4, #52]
	.loc 2 417 0
	mov	r5, r0
.LVL69:
	.loc 2 420 0
	cmp	r3, #0
	beq	.L77
	.loc 2 422 0
	ldr	r0, [r4, #36]
.LVL70:
	blx	r3
.LVL71:
.L77:
	.loc 2 425 0
	mov	r0, r4
	bl	remove_thread_node
.LVL72:
.LBB19:
.LBB20:
	.loc 2 172 0
	mov	r0, r4
	bl	free
.LVL73:
.LBE20:
.LBE19:
	.loc 2 428 0
	mov	r0, r4
	bl	caribou_timer_delete_all
.LVL74:
	.loc 2 429 0
	mov	r0, r5
	bl	chip_interrupts_set
.LVL75:
	.loc 2 430 0
	@ sp needed
.LVL76:
.LVL77:
	pop	{r3, r4, r5, pc}
.LFE59:
	.size	caribou_thread_terminate, .-caribou_thread_terminate
	.section	.text.caribou_thread_create,"ax",%progbits
	.align	1
	.global	caribou_thread_create
	.code	16
	.thumb_func
	.type	caribou_thread_create, %function
caribou_thread_create:
.LFB61:
	.loc 2 459 0
.LVL78:
	push	{r4, r5, r6, r7, lr}
.LCFI11:
	sub	sp, sp, #28
.LCFI12:
	.loc 2 459 0
	str	r3, [sp, #4]
	add	r3, sp, #56
.LVL79:
	str	r2, [sp, #16]
	mov	r7, r1
	mov	r2, #0
	ldrsh	r1, [r3, r2]
.LVL80:
	str	r0, [sp, #12]
	ldr	r5, [sp, #48]
	ldr	r6, [sp, #52]
	str	r1, [sp, #20]
	.loc 2 462 0
	bl	chip_interrupts_disable
.LVL81:
	str	r0, [sp, #8]
.LVL82:
	.loc 2 464 0
	cmp	r5, #0
	beq	.L82
	.loc 2 468 0
	mov	r4, r6
	sub	r4, r4, #64
	add	r4, r5, r4
	.loc 2 467 0
	mov	r1, #250
	mov	r2, r6
	mov	r0, r5
.LVL83:
	bl	memset
.LVL84:
	.loc 2 469 0
	mov	r0, r4
	mov	r1, #0
	mov	r2, #64
	bl	memset
.LVL85:
	.loc 2 470 0
	ldr	r3, [sp, #4]
	str	r3, [r4, #32]
	.loc 2 471 0
	ldr	r3, .L98
	str	r3, [r4, #52]
	.loc 2 472 0
	mov	r3, #1
	bic	r7, r3
.LVL86:
	.loc 2 473 0
	mov	r3, #132
	lsl	r3, r3, #22
	.loc 2 472 0
	str	r7, [r4, #56]
	.loc 2 473 0
	str	r3, [r4, #60]
.LVL87:
.L82:
	.loc 2 479 0
	ldr	r3, .L98+4
	ldr	r7, [r3, #4]
	cmp	r7, #0
	bne	.L83
	.loc 2 479 0 is_stmt 0 discriminator 1
	ldr	r7, [r3]
.L83:
.LVL88:
.LBB26:
.LBB27:
	.loc 2 154 0 is_stmt 1 discriminator 3
	mov	r0, #72
	bl	malloc
.LVL89:
	sub	r4, r0, #0
.LVL90:
	.loc 2 155 0 discriminator 3
	beq	.L84
	.loc 2 157 0
	mov	r1, #0
	mov	r2, #72
	bl	memset
.LVL91:
.LBE27:
.LBE26:
	.loc 2 482 0
	mov	r3, #0
.LBB30:
.LBB28:
	.loc 2 158 0
	str	r7, [r4, #4]
.LVL92:
.LBE28:
.LBE30:
	.loc 2 482 0
	strh	r3, [r4, #28]
	.loc 2 483 0
	cmp	r5, r3
	beq	.L97
.LBB31:
	.loc 2 485 0
	add	r6, r5, r6
.LVL93:
	.loc 2 486 0
	mov	r3, r6
	sub	r3, r3, #64
	str	r3, [r4, #8]
	.loc 2 489 0
	mov	r3, r5
	add	r3, r3, #64
	.loc 2 487 0
	str	r6, [r4, #20]
	.loc 2 489 0
	str	r3, [r4, #16]
	.loc 2 490 0
	str	r5, [r4, #24]
.LBE31:
	b	.L88
.LVL94:
.L84:
.LBB32:
.LBB29:
	.loc 2 162 0
	mov	r0, #8
.LVL95:
	bl	_caribou_thread_fault_emit
.LVL96:
	b	.L87
.L97:
.LBE29:
.LBE32:
	.loc 2 494 0
	ldr	r3, .L98+8
	str	r3, [r4, #8]
	.loc 2 495 0
	str	r3, [r4, #20]
	.loc 2 497 0
	ldr	r3, .L98+12
	str	r3, [r4, #16]
	.loc 2 498 0
	sub	r3, r3, #64
	str	r3, [r4, #24]
.L88:
	.loc 2 501 0
	ldr	r2, [sp, #4]
	.loc 2 500 0
	ldr	r1, [sp, #12]
	.loc 2 502 0
	ldr	r3, [sp, #20]
	.loc 2 501 0
	str	r2, [r4, #36]
.LBB33:
.LBB34:
	.loc 2 180 0
	ldr	r2, .L98+4
.LBE34:
.LBE33:
	.loc 2 500 0
	str	r1, [r4, #32]
	.loc 2 502 0
	strh	r3, [r4, #30]
	.loc 2 503 0
	ldr	r1, [sp, #16]
.LBB37:
.LBB35:
	.loc 2 180 0
	ldr	r3, [r2]
.LBE35:
.LBE37:
	.loc 2 503 0
	str	r1, [r4, #52]
.LVL97:
.LBB38:
.LBB36:
	.loc 2 181 0
	cmp	r3, #0
	beq	.L89
.LVL98:
.L91:
	.loc 2 183 0
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L90
	.loc 2 185 0
	mov	r3, r2
.LVL99:
	b	.L91
.LVL100:
.L90:
	.loc 2 187 0
	str	r4, [r3]
	b	.L87
.L89:
	.loc 2 191 0
	str	r4, [r2]
	.loc 2 192 0
	str	r3, [r4]
.LVL101:
.L87:
.LBE36:
.LBE38:
	.loc 2 506 0
	ldr	r0, [sp, #8]
	bl	chip_interrupts_set
.LVL102:
	.loc 2 508 0
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
.LVL103:
.LVL104:
	pop	{r4, r5, r6, r7, pc}
.L99:
	.align	2
.L98:
	.word	thread_finish
	.word	.LANCHOR0
	.word	__process_stack_end__
	.word	__process_stack_base__+64
.LFE61:
	.size	caribou_thread_create, .-caribou_thread_create
	.section	.text.caribou_thread_fault_set,"ax",%progbits
	.align	1
	.global	caribou_thread_fault_set
	.code	16
	.thumb_func
	.type	caribou_thread_fault_set, %function
caribou_thread_fault_set:
.LFB62:
	.loc 2 512 0
.LVL105:
	.loc 2 513 0
	ldr	r3, .L101
	.loc 2 515 0
	mov	r2, #0
	.loc 2 513 0
	str	r0, [r3, #12]
	.loc 2 514 0
	str	r1, [r3, #16]
	.loc 2 515 0
	strh	r2, [r3, #20]
	.loc 2 516 0
	@ sp needed
	bx	lr
.L102:
	.align	2
.L101:
	.word	.LANCHOR0
.LFE62:
	.size	caribou_thread_fault_set, .-caribou_thread_fault_set
	.section	.text.caribou_thread_root,"ax",%progbits
	.align	1
	.global	caribou_thread_root
	.code	16
	.thumb_func
	.type	caribou_thread_root, %function
caribou_thread_root:
.LFB63:
	.loc 2 522 0
	.loc 2 523 0
	ldr	r3, .L104
	.loc 2 524 0
	@ sp needed
	.loc 2 523 0
	ldr	r0, [r3]
	.loc 2 524 0
	bx	lr
.L105:
	.align	2
.L104:
	.word	.LANCHOR0
.LFE63:
	.size	caribou_thread_root, .-caribou_thread_root
	.section	.text.caribou_thread_current,"ax",%progbits
	.align	1
	.global	caribou_thread_current
	.code	16
	.thumb_func
	.type	caribou_thread_current, %function
caribou_thread_current:
.LFB64:
	.loc 2 530 0
	.loc 2 531 0
	ldr	r3, .L107
	.loc 2 532 0
	@ sp needed
	.loc 2 531 0
	ldr	r0, [r3, #4]
	.loc 2 532 0
	bx	lr
.L108:
	.align	2
.L107:
	.word	.LANCHOR0
.LFE64:
	.size	caribou_thread_current, .-caribou_thread_current
	.section	.text.caribou_thread_schedule,"ax",%progbits
	.align	1
	.global	caribou_thread_schedule
	.code	16
	.thumb_func
	.type	caribou_thread_schedule, %function
caribou_thread_schedule:
.LFB65:
	.loc 2 541 0
.LVL106:
	push	{r4, r5, r6, lr}
.LCFI13:
	.loc 2 541 0
	mov	r4, r0
	.loc 2 542 0
	bl	chip_interrupts_disable
.LVL107:
	.loc 2 543 0
	ldr	r5, .L111
	.loc 2 542 0
	mov	r6, r0
.LVL108:
	.loc 2 543 0
	ldr	r3, [r5, #4]
	.loc 2 544 0
	mov	r0, #48
	ldrsh	r1, [r3, r0]
.LVL109:
	.loc 2 543 0
	ldr	r2, [r3]
.LVL110:
	.loc 2 544 0
	cmp	r1, #0
	bne	.L110
	.loc 2 544 0 is_stmt 0 discriminator 1
	cmp	r4, r3
	beq	.L110
	cmp	r4, r2
	beq	.L110
	.loc 2 546 0 is_stmt 1
	mov	r0, r4
	bl	remove_thread_node
.LVL111:
	.loc 2 547 0
	ldr	r3, [r5, #4]
.LVL112:
.LBB39:
.LBB40:
	.loc 2 202 0
	ldr	r2, [r3]
.LVL113:
	.loc 2 203 0
	str	r4, [r3]
	.loc 2 204 0
	str	r2, [r4]
.LVL114:
.L110:
.LBE40:
.LBE39:
	.loc 2 549 0
	mov	r0, r6
	bl	chip_interrupts_set
.LVL115:
	.loc 2 550 0
	@ sp needed
.LVL116:
.LVL117:
	pop	{r4, r5, r6, pc}
.L112:
	.align	2
.L111:
	.word	.LANCHOR0
.LFE65:
	.size	caribou_thread_schedule, .-caribou_thread_schedule
	.section	.text.caribou_thread_first,"ax",%progbits
	.align	1
	.global	caribou_thread_first
	.code	16
	.thumb_func
	.type	caribou_thread_first, %function
caribou_thread_first:
.LFB66:
	.loc 2 556 0
	.loc 2 557 0
	ldr	r3, .L114
	.loc 2 558 0
	@ sp needed
	.loc 2 557 0
	ldr	r0, [r3]
	.loc 2 558 0
	bx	lr
.L115:
	.align	2
.L114:
	.word	.LANCHOR0
.LFE66:
	.size	caribou_thread_first, .-caribou_thread_first
	.section	.text.caribou_thread_current_arg,"ax",%progbits
	.align	1
	.global	caribou_thread_current_arg
	.code	16
	.thumb_func
	.type	caribou_thread_current_arg, %function
caribou_thread_current_arg:
.LFB67:
	.loc 2 562 0
	.loc 2 563 0
	ldr	r3, .L117
	.loc 2 564 0
	@ sp needed
	.loc 2 563 0
	ldr	r3, [r3, #4]
	ldr	r0, [r3, #36]
	.loc 2 564 0
	bx	lr
.L118:
	.align	2
.L117:
	.word	.LANCHOR0
.LFE67:
	.size	caribou_thread_current_arg, .-caribou_thread_current_arg
	.section	.text.caribou_thread_set_priority,"ax",%progbits
	.align	1
	.global	caribou_thread_set_priority
	.code	16
	.thumb_func
	.type	caribou_thread_set_priority, %function
caribou_thread_set_priority:
.LFB68:
	.loc 2 575 0
.LVL118:
	push	{r3, r4, r5, lr}
.LCFI14:
	.loc 2 575 0
	mov	r5, r1
	mov	r4, r0
	.loc 2 576 0
	bl	caribou_lock
.LVL119:
	.loc 2 577 0
	strh	r5, [r4, #30]
	.loc 2 578 0
	bl	caribou_lock_set
.LVL120:
	.loc 2 579 0
	@ sp needed
.LVL121:
	pop	{r3, r4, r5, pc}
.LFE68:
	.size	caribou_thread_set_priority, .-caribou_thread_set_priority
	.section	.text.caribou_thread_priority,"ax",%progbits
	.align	1
	.global	caribou_thread_priority
	.code	16
	.thumb_func
	.type	caribou_thread_priority, %function
caribou_thread_priority:
.LFB69:
	.loc 2 585 0
.LVL122:
	.loc 2 586 0
	cmp	r0, #0
	beq	.L121
	.loc 2 586 0 is_stmt 0 discriminator 1
	ldrh	r0, [r0, #30]
.LVL123:
.L121:
	.loc 2 586 0 discriminator 3
	sxth	r0, r0
	.loc 2 587 0 is_stmt 1 discriminator 3
	@ sp needed
	bx	lr
.LFE69:
	.size	caribou_thread_priority, .-caribou_thread_priority
	.section	.text.caribou_thread_init,"ax",%progbits
	.align	1
	.global	caribou_thread_init
	.code	16
	.thumb_func
	.type	caribou_thread_init, %function
caribou_thread_init:
.LFB70:
	.loc 2 594 0
.LVL124:
	push	{r4, r5, lr}
.LCFI15:
	.loc 2 596 0
	ldr	r4, .L124
	.loc 2 594 0
	sub	sp, sp, #20
.LCFI16:
	.loc 2 594 0
	mov	r5, r0
	.loc 2 596 0
	mov	r1, #0
	mov	r0, r4
.LVL125:
	mov	r2, #40
	bl	memset
.LVL126:
	.loc 2 597 0
	mov	r3, #0
	str	r3, [sp]
	str	r3, [sp, #4]
	str	r5, [sp, #8]
	mov	r1, r3
	mov	r2, r3
	ldr	r0, .L124+4
	bl	caribou_thread_create
.LVL127:
	str	r0, [r4, #4]
	.loc 2 599 0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L125:
	.align	2
.L124:
	.word	.LANCHOR0
	.word	.LC21
.LFE70:
	.size	caribou_thread_init, .-caribou_thread_init
	.section	.text.main_idle,"ax",%progbits
	.align	1
	.weak	main_idle
	.code	16
	.thumb_func
	.type	main_idle, %function
main_idle:
.LFB71:
	.loc 2 611 0
	.loc 2 612 0
	@ sp needed
	bx	lr
.LFE71:
	.size	main_idle, .-main_idle
	.section	.text.board_idle,"ax",%progbits
	.align	1
	.weak	board_idle
	.code	16
	.thumb_func
	.type	board_idle, %function
board_idle:
.LFB72:
	.loc 2 621 0
	.loc 2 622 0
	@ sp needed
	bx	lr
.LFE72:
	.size	board_idle, .-board_idle
	.section	.text.caribou_thread_once,"ax",%progbits
	.align	1
	.global	caribou_thread_once
	.code	16
	.thumb_func
	.type	caribou_thread_once, %function
caribou_thread_once:
.LFB74:
	.loc 2 648 0
.LVL128:
	push	{r4, r5, r6, lr}
.LCFI17:
	.loc 2 653 0
	bl	board_idle
.LVL129:
	.loc 2 655 0
	ldr	r5, .L143
	ldr	r0, [r5]
	bl	caribou_timer_idle
.LVL130:
	.loc 2 657 0
	ldr	r4, [r5]
.LVL131:
.L129:
	.loc 2 657 0 is_stmt 0 discriminator 1
	cmp	r4, #0
	beq	.L142
.LBB43:
.LBB44:
	.loc 2 626 0 is_stmt 1
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #16]
.LBE44:
.LBE43:
	.loc 2 659 0
	ldr	r6, [r4]
.LVL132:
.LBB46:
.LBB45:
	.loc 2 626 0
	cmp	r3, r2
	bls	.L130
	ldr	r2, [r4, #20]
	cmp	r3, r2
	bhi	.L131
	b	.L132
.L130:
	.loc 2 630 0
	mov	r0, #1
	b	.L141
.L131:
	.loc 2 632 0
	ldr	r2, [r4, #24]
	.loc 2 634 0
	mov	r0, #4
	.loc 2 632 0
	cmp	r3, r2
	bls	.L141
	.loc 2 638 0
	mov	r0, #2
.L141:
	bl	_caribou_thread_fault_emit
.LVL133:
.L132:
	.loc 2 641 0
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #12]
	cmp	r3, r2
	bcc	.L134
	cmp	r2, #0
	bne	.L135
.L134:
	.loc 2 643 0
	str	r3, [r4, #12]
.L135:
.LBE45:
.LBE46:
	.loc 2 661 0
	ldrh	r3, [r4, #28]
	lsl	r2, r3, #29
	bpl	.L136
	.loc 2 661 0 is_stmt 0 discriminator 1
	ldr	r3, [r5, #4]
	cmp	r4, r3
	beq	.L136
	.loc 2 663 0 is_stmt 1
	mov	r0, r4
	bl	caribou_thread_terminate
.LVL134:
.L136:
	.loc 2 648 0 discriminator 1
	mov	r4, r6
.LVL135:
	b	.L129
.LVL136:
.L142:
	.loc 2 666 0
	@ sp needed
.LVL137:
	pop	{r4, r5, r6, pc}
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
.LFE74:
	.size	caribou_thread_once, .-caribou_thread_once
	.section	.text.caribou_thread_exec,"ax",%progbits
	.align	1
	.global	caribou_thread_exec
	.code	16
	.thumb_func
	.type	caribou_thread_exec, %function
caribou_thread_exec:
.LFB75:
	.loc 2 674 0
	push	{r3, lr}
.LCFI18:
.L146:
	.loc 2 677 0 discriminator 1
	bl	caribou_thread_once
.LVL138:
	.loc 2 678 0 discriminator 1
	bl	caribou_thread_yield
.LVL139:
	b	.L146
.LFE75:
	.size	caribou_thread_exec, .-caribou_thread_exec
	.section	.text._pendsv,"ax",%progbits
	.align	1
	.global	_pendsv
	.code	16
	.thumb_func
	.type	_pendsv, %function
_pendsv:
.LFB76:
	.loc 2 706 0
	.loc 2 707 0
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
	ldr	r3, .L156
	mov	r2, #128
	ldr	r1, [r3, #4]
	lsl	r2, r2, #18
	orr	r2, r1
	str	r2, [r3, #4]
	ldr	r1, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #20
	orr	r2, r1
	.loc 2 708 0
	ldr	r4, .L156+4
	.loc 2 707 0
	str	r2, [r3, #4]
	.loc 2 708 0
	ldr	r5, [r4, #4]
	bl	rd_thread_stack_ptr
.LVL140:
	.loc 2 712 0
	ldr	r1, .L156+8
	ldr	r3, [r4, #4]
	ldr	r2, [r1]
	.loc 2 708 0
	str	r0, [r5, #8]
	.loc 2 712 0
	str	r2, [r3, #60]
	mov	r2, #48
	ldrsh	r5, [r3, r2]
	mov	r0, r1
	mov	r2, r4
	cmp	r5, #0
	bne	.L149
	.loc 2 712 0 is_stmt 0 discriminator 1
	ldrh	r1, [r4, #8]
	sub	r1, r1, #1
	uxth	r1, r1
	strh	r1, [r4, #8]
	sxth	r1, r1
	cmp	r1, #0
	bge	.L149
	.loc 2 712 0
	ldr	r5, [r4]
.L151:
	.loc 2 712 0 discriminator 1
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L152
	.loc 2 712 0
	mov	r3, r5
.L152:
	.loc 2 712 0 discriminator 3
	ldrh	r1, [r3, #28]
	mov	r4, #6
	tst	r1, r4
	beq	.L155
	.loc 2 712 0 discriminator 2
	mov	r4, #2
	bic	r1, r4
	strh	r1, [r3, #28]
	b	.L151
.L155:
	str	r3, [r2, #4]
	.loc 2 712 0
	ldrh	r1, [r3, #30]
	ldr	r3, [r3, #60]
	strh	r1, [r2, #8]
	str	r3, [r0]
.L149:
	.loc 2 713 0 is_stmt 1
	ldr	r3, [r2, #4]
	ldr	r3, [r3, #8]
@ 713 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
	 msr psp, r3
	
@ 0 "" 2
	.loc 2 714 0
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
	.loc 2 715 0
	.code	16
.L157:
	.align	2
.L156:
	.word	-536810240
	.word	.LANCHOR0
	.word	__errno
.LFE76:
	.size	_pendsv, .-_pendsv
	.section	.text._systick,"ax",%progbits
	.align	1
	.global	_systick
	.code	16
	.thumb_func
	.type	_systick, %function
_systick:
.LFB77:
	.loc 2 725 0
	.loc 2 726 0
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
	ldr	r3, .L167
	mov	r2, #128
	ldr	r1, [r3, #4]
	lsl	r2, r2, #18
	orr	r1, r2
	str	r1, [r3, #4]
	ldr	r1, [r3, #4]
	.loc 2 727 0
	ldr	r4, .L167+4
	.loc 2 726 0
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 2 727 0
	ldr	r5, [r4, #4]
	bl	rd_thread_stack_ptr
.LVL141:
	.loc 2 731 0
	mov	r2, #1
	mov	r3, #0
	.loc 2 727 0
	str	r0, [r5, #8]
	.loc 2 731 0
	ldr	r0, [r4, #24]
	ldr	r1, [r4, #28]
	add	r0, r0, r2
	adc	r1, r1, r3
	str	r0, [r4, #24]
	str	r1, [r4, #28]
	.loc 2 732 0
	ldr	r1, [r4, #4]
	ldr	r5, [r1, #40]
	ldr	r6, [r1, #44]
	add	r2, r2, r5
	adc	r3, r3, r6
	str	r2, [r1, #40]
	str	r3, [r1, #44]
	.loc 2 733 0
	ldr	r3, .L167+8
	mov	r0, #48
	ldrsh	r2, [r1, r0]
	ldr	r6, [r3]
	mov	r0, r3
	str	r6, [r1, #60]
	cmp	r2, #0
	bne	.L160
	.loc 2 733 0 is_stmt 0 discriminator 1
	ldrh	r3, [r4, #8]
	sub	r3, r3, #1
	uxth	r3, r3
	strh	r3, [r4, #8]
	sxth	r3, r3
	cmp	r3, #0
	bge	.L160
	.loc 2 733 0
	ldr	r5, [r4]
	mov	r3, r1
.L162:
	.loc 2 733 0 discriminator 1
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L163
	.loc 2 733 0
	mov	r3, r5
.L163:
	.loc 2 733 0 discriminator 3
	ldrh	r2, [r3, #28]
	mov	r1, #6
	tst	r2, r1
	beq	.L166
	.loc 2 733 0 discriminator 2
	mov	r1, #2
	bic	r2, r1
	strh	r2, [r3, #28]
	b	.L162
.L166:
	str	r3, [r4, #4]
	.loc 2 733 0
	ldrh	r2, [r3, #30]
	ldr	r3, [r3, #60]
	strh	r2, [r4, #8]
	str	r3, [r0]
.L160:
	.loc 2 734 0 is_stmt 1
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #8]
@ 734 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
	 msr psp, r3
	
@ 0 "" 2
	.loc 2 735 0
@ 735 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/thread.c" 1
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
	.loc 2 736 0
	.code	16
.L168:
	.align	2
.L167:
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
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC4:
	.ascii	"\000"
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
	.byte	0x84
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
	.uleb128 0x20
	.byte	0x80
	.uleb128 0x8
	.byte	0x81
	.uleb128 0x7
	.byte	0x82
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
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI8-.LFB48
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
	.4byte	.LCFI9-.LFB60
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
	.4byte	.LCFI10-.LFB59
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
	.4byte	.LCFI11-.LFB61
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
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x30
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
	.4byte	.LCFI13-.LFB65
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
	.4byte	.LCFI14-.LFB68
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
	.4byte	.LCFI15-.LFB70
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
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
	.4byte	.LCFI17-.LFB74
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
	.4byte	.LCFI18-.LFB75
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
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 4 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.file 6 "../../../../include/caribou/kernel/timer.h"
	.file 7 "../../../../include/caribou/lib/errno.h"
	.file 8 "../../../../include/caribou/kernel/thread.h"
	.file 9 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/chip.h"
	.file 10 "../../../../include/caribou/lib/heap.h"
	.file 11 "../../../../include/caribou/lib/string.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1143
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF134
	.byte	0x1
	.4byte	.LASF135
	.4byte	.LASF136
	.4byte	.Ldebug_ranges0+0x58
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x3
	.byte	0xf
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x3
	.byte	0x14
	.4byte	0x49
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x3
	.byte	0x15
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x16
	.4byte	0x6d
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x3
	.byte	0x17
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x23
	.4byte	0x91
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x24
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc0
	.uleb128 0x7
	.4byte	0xb3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x4
	.byte	0x16
	.4byte	0x7f
	.uleb128 0x8
	.byte	0x28
	.byte	0x5
	.2byte	0x124
	.4byte	0x156
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x126
	.4byte	0x156
	.byte	0
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x5
	.2byte	0x127
	.4byte	0x15b
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x5
	.2byte	0x128
	.4byte	0x74
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x129
	.4byte	0x15b
	.byte	0xc
	.uleb128 0xa
	.ascii	"SCR\000"
	.byte	0x5
	.2byte	0x12a
	.4byte	0x15b
	.byte	0x10
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x5
	.2byte	0x12b
	.4byte	0x15b
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x5
	.2byte	0x12c
	.4byte	0x74
	.byte	0x18
	.uleb128 0xa
	.ascii	"SHP\000"
	.byte	0x5
	.2byte	0x12d
	.4byte	0x170
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x5
	.2byte	0x12e
	.4byte	0x15b
	.byte	0x24
	.byte	0
	.uleb128 0x7
	.4byte	0x15b
	.uleb128 0xb
	.4byte	0x74
	.uleb128 0xc
	.4byte	0x74
	.4byte	0x170
	.uleb128 0xd
	.4byte	0xc5
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	0x160
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x5
	.2byte	0x12f
	.4byte	0xd7
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x6
	.byte	0x2f
	.4byte	0x18c
	.uleb128 0xf
	.4byte	0xaa
	.4byte	0x1a5
	.uleb128 0x10
	.4byte	0xaa
	.uleb128 0x10
	.4byte	0x1a5
	.uleb128 0x10
	.4byte	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1ab
	.uleb128 0x11
	.4byte	.LASF35
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x1c
	.byte	0x6
	.byte	0x38
	.4byte	0x211
	.uleb128 0x13
	.4byte	.LASF26
	.byte	0x6
	.byte	0x3b
	.4byte	0x211
	.byte	0
	.uleb128 0x13
	.4byte	.LASF27
	.byte	0x6
	.byte	0x3d
	.4byte	0x211
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x6
	.byte	0x3f
	.4byte	0x217
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x6
	.byte	0x41
	.4byte	0xaa
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF30
	.byte	0x6
	.byte	0x43
	.4byte	0x74
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF31
	.byte	0x6
	.byte	0x45
	.4byte	0x74
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF32
	.byte	0x6
	.byte	0x47
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x1b0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x181
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x6
	.byte	0x48
	.4byte	0x1b0
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x7
	.2byte	0x108
	.4byte	0x6d
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x48
	.byte	0x8
	.byte	0x1f
	.4byte	0x30c
	.uleb128 0x13
	.4byte	.LASF27
	.byte	0x8
	.byte	0x22
	.4byte	0x30c
	.byte	0
	.uleb128 0x13
	.4byte	.LASF37
	.byte	0x8
	.byte	0x25
	.4byte	0x30c
	.byte	0x4
	.uleb128 0x14
	.ascii	"sp\000"
	.byte	0x8
	.byte	0x28
	.4byte	0xaa
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x8
	.byte	0x2b
	.4byte	0xaa
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x8
	.byte	0x2e
	.4byte	0xaa
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x8
	.byte	0x31
	.4byte	0xaa
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x8
	.byte	0x34
	.4byte	0xaa
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF42
	.byte	0x8
	.byte	0x37
	.4byte	0x50
	.byte	0x1c
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x8
	.byte	0x3a
	.4byte	0x3e
	.byte	0x1e
	.uleb128 0x13
	.4byte	.LASF44
	.byte	0x8
	.byte	0x3d
	.4byte	0xba
	.byte	0x20
	.uleb128 0x14
	.ascii	"arg\000"
	.byte	0x8
	.byte	0x40
	.4byte	0xaa
	.byte	0x24
	.uleb128 0x13
	.4byte	.LASF45
	.byte	0x8
	.byte	0x43
	.4byte	0x98
	.byte	0x28
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x8
	.byte	0x46
	.4byte	0x3e
	.byte	0x30
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x8
	.byte	0x49
	.4byte	0x31d
	.byte	0x34
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x8
	.byte	0x4c
	.4byte	0x323
	.byte	0x38
	.uleb128 0x13
	.4byte	.LASF49
	.byte	0x8
	.byte	0x4f
	.4byte	0x228
	.byte	0x3c
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x8
	.byte	0x52
	.4byte	0x3e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x234
	.uleb128 0x15
	.4byte	0x31d
	.uleb128 0x10
	.4byte	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x312
	.uleb128 0x6
	.byte	0x4
	.4byte	0x21d
	.uleb128 0x3
	.4byte	.LASF51
	.byte	0x8
	.byte	0x55
	.4byte	0x234
	.uleb128 0x16
	.byte	0x28
	.byte	0x8
	.byte	0x58
	.4byte	0x39d
	.uleb128 0x13
	.4byte	.LASF52
	.byte	0x8
	.byte	0x5b
	.4byte	0x39d
	.byte	0
	.uleb128 0x13
	.4byte	.LASF53
	.byte	0x8
	.byte	0x5d
	.4byte	0x39d
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF54
	.byte	0x8
	.byte	0x5f
	.4byte	0x3e
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x8
	.byte	0x61
	.4byte	0x3b7
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x8
	.byte	0x63
	.4byte	0xaa
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x8
	.byte	0x65
	.4byte	0x50
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF58
	.byte	0x8
	.byte	0x67
	.4byte	0x86
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF59
	.byte	0x8
	.byte	0x69
	.4byte	0x86
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x329
	.uleb128 0xf
	.4byte	0xaa
	.4byte	0x3b7
	.uleb128 0x10
	.4byte	0x6d
	.uleb128 0x10
	.4byte	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x3a3
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x8
	.byte	0x6a
	.4byte	0x334
	.uleb128 0x16
	.byte	0x20
	.byte	0x1
	.byte	0x18
	.4byte	0x42b
	.uleb128 0x14
	.ascii	"r0\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x74
	.byte	0
	.uleb128 0x14
	.ascii	"r1\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x74
	.byte	0x4
	.uleb128 0x14
	.ascii	"r2\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x74
	.byte	0x8
	.uleb128 0x14
	.ascii	"r3\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x74
	.byte	0xc
	.uleb128 0x14
	.ascii	"r12\000"
	.byte	0x1
	.byte	0x1e
	.4byte	0x74
	.byte	0x10
	.uleb128 0x14
	.ascii	"lr\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x74
	.byte	0x14
	.uleb128 0x14
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x74
	.byte	0x18
	.uleb128 0x14
	.ascii	"psr\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x74
	.byte	0x1c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF61
	.byte	0x1
	.byte	0x22
	.4byte	0x3c8
	.uleb128 0x16
	.byte	0x20
	.byte	0x1
	.byte	0x25
	.4byte	0x499
	.uleb128 0x14
	.ascii	"r4\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x74
	.byte	0
	.uleb128 0x14
	.ascii	"r5\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x74
	.byte	0x4
	.uleb128 0x14
	.ascii	"r6\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x74
	.byte	0x8
	.uleb128 0x14
	.ascii	"r7\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x74
	.byte	0xc
	.uleb128 0x14
	.ascii	"r8\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x74
	.byte	0x10
	.uleb128 0x14
	.ascii	"r9\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x74
	.byte	0x14
	.uleb128 0x14
	.ascii	"r10\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x74
	.byte	0x18
	.uleb128 0x14
	.ascii	"r11\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x74
	.byte	0x1c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF62
	.byte	0x1
	.byte	0x2f
	.4byte	0x436
	.uleb128 0x16
	.byte	0x40
	.byte	0x1
	.byte	0x35
	.4byte	0x4c5
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x1
	.byte	0x37
	.4byte	0x499
	.byte	0
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x1
	.byte	0x38
	.4byte	0x42b
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.4byte	.LASF65
	.byte	0x1
	.byte	0x39
	.4byte	0x4a4
	.uleb128 0x17
	.4byte	.LASF87
	.byte	0x2
	.byte	0xc8
	.4byte	0x39d
	.byte	0x1
	.4byte	0x502
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x2
	.byte	0xc8
	.4byte	0x39d
	.uleb128 0x18
	.4byte	.LASF67
	.byte	0x2
	.byte	0xc8
	.4byte	0x39d
	.uleb128 0x19
	.4byte	.LASF27
	.byte	0x2
	.byte	0xca
	.4byte	0x39d
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF102
	.byte	0x2
	.2byte	0x18f
	.byte	0x1
	.4byte	0x522
	.uleb128 0x1b
	.uleb128 0x1c
	.4byte	.LASF125
	.byte	0x2
	.2byte	0x195
	.4byte	0x6d
	.byte	0
	.uleb128 0x1d
	.uleb128 0x1d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF110
	.byte	0x2
	.byte	0xaa
	.byte	0x1
	.4byte	0x53a
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x2
	.byte	0xaa
	.4byte	0x39d
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF120
	.byte	0x2
	.2byte	0x211
	.4byte	0x39d
	.byte	0x1
	.uleb128 0x20
	.4byte	.LASF137
	.byte	0x1
	.byte	0x6e
	.4byte	0xaa
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.4byte	.LASF138
	.byte	0x2
	.byte	0xd3
	.4byte	0x39d
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59c
	.uleb128 0x22
	.4byte	.LASF66
	.byte	0x2
	.byte	0xd3
	.4byte	0x39d
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x23
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x24
	.4byte	.LASF70
	.byte	0x2
	.byte	0xdb
	.4byte	0x39d
	.4byte	.LLST0
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	.LASF68
	.byte	0x2
	.byte	0x67
	.4byte	0x50
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d1
	.uleb128 0x26
	.4byte	.LASF32
	.byte	0x2
	.byte	0x67
	.4byte	0x50
	.4byte	.LLST1
	.uleb128 0x27
	.4byte	.LVL5
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	.LASF107
	.byte	0x2
	.byte	0x84
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.4byte	.LASF69
	.byte	0x2
	.byte	0xfd
	.4byte	0x6d
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x62c
	.uleb128 0x2a
	.ascii	"rc\000"
	.byte	0x2
	.byte	0xff
	.4byte	0x6d
	.4byte	.LLST2
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x100
	.4byte	0x6d
	.4byte	.LLST3
	.uleb128 0x2c
	.4byte	.LVL7
	.4byte	0x1036
	.uleb128 0x2c
	.4byte	.LVL11
	.4byte	0x1041
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF71
	.byte	0x2
	.2byte	0x10e
	.4byte	0x6d
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x678
	.uleb128 0x2e
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x110
	.4byte	0x6d
	.4byte	.LLST4
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x111
	.4byte	0x6d
	.4byte	.LLST5
	.uleb128 0x2c
	.4byte	.LVL14
	.4byte	0x1036
	.uleb128 0x2c
	.4byte	.LVL19
	.4byte	0x1041
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF72
	.byte	0x2
	.2byte	0x11f
	.4byte	0x6d
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6de
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x11f
	.4byte	0x39d
	.4byte	.LLST6
	.uleb128 0x2e
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x121
	.4byte	0xb3
	.4byte	.LLST7
	.uleb128 0x23
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x124
	.4byte	0x6d
	.4byte	.LLST8
	.uleb128 0x2c
	.4byte	.LVL22
	.4byte	0x1036
	.uleb128 0x2c
	.4byte	.LVL25
	.4byte	0x1041
	.byte	0
	.byte	0
	.uleb128 0x30
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x151
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x727
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x151
	.4byte	0x39d
	.4byte	.LLST9
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x153
	.4byte	0x6d
	.4byte	.LLST10
	.uleb128 0x2c
	.4byte	.LVL28
	.4byte	0x1052
	.uleb128 0x2c
	.4byte	.LVL29
	.4byte	0x105d
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF74
	.byte	0x2
	.2byte	0x159
	.4byte	0xba
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x760
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x159
	.4byte	0x39d
	.4byte	.LLST11
	.uleb128 0x31
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x159
	.4byte	0xba
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x160
	.4byte	0xba
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x78b
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x160
	.4byte	0x39d
	.4byte	.LLST12
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x166
	.4byte	0x98
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b6
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x166
	.4byte	0x39d
	.4byte	.LLST13
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x16c
	.4byte	0x74
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7e1
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x16c
	.4byte	0x39d
	.4byte	.LLST14
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x172
	.4byte	0x74
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x80c
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x172
	.4byte	0x39d
	.4byte	.LLST15
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x178
	.4byte	0x50
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x837
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x178
	.4byte	0x39d
	.4byte	.LLST16
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x17e
	.4byte	0x39d
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x862
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x17e
	.4byte	0x39d
	.4byte	.LLST17
	.byte	0
	.uleb128 0x32
	.4byte	.LASF112
	.byte	0x2
	.2byte	0x186
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x882
	.uleb128 0x2c
	.4byte	.LVL49
	.4byte	0x106e
	.byte	0
	.uleb128 0x33
	.4byte	0x502
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8b6
	.uleb128 0x34
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.4byte	0x8ac
	.uleb128 0x2c
	.4byte	.LVL51
	.4byte	0x1075
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL50
	.4byte	0x1087
	.byte	0
	.uleb128 0x30
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x131
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94c
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x131
	.4byte	0x39d
	.4byte	.LLST18
	.uleb128 0x2f
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x131
	.4byte	0x62
	.4byte	.LLST19
	.uleb128 0x2b
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x133
	.4byte	0x86
	.4byte	.LLST20
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x134
	.4byte	0x6d
	.4byte	.LLST21
	.uleb128 0x2c
	.4byte	.LVL53
	.4byte	0x1092
	.uleb128 0x2c
	.4byte	.LVL55
	.4byte	0x1052
	.uleb128 0x2c
	.4byte	.LVL56
	.4byte	0x105d
	.uleb128 0x2c
	.4byte	.LVL57
	.4byte	0x10a3
	.uleb128 0x2c
	.4byte	.LVL58
	.4byte	0x1052
	.uleb128 0x2c
	.4byte	.LVL59
	.4byte	0x105d
	.uleb128 0x2c
	.4byte	.LVL60
	.4byte	0x502
	.byte	0
	.uleb128 0x30
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x14a
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x994
	.uleb128 0x2f
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x14a
	.4byte	0x62
	.4byte	.LLST22
	.uleb128 0x35
	.4byte	0x53a
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x2
	.2byte	0x14c
	.uleb128 0x36
	.4byte	.LVL65
	.4byte	0x8b6
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x30
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x1b3
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9b4
	.uleb128 0x2c
	.4byte	.LVL66
	.4byte	0x502
	.byte	0
	.uleb128 0x37
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x19f
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa66
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x19f
	.4byte	0x39d
	.4byte	.LLST23
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x1a1
	.4byte	0x6d
	.4byte	.LLST24
	.uleb128 0x38
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x1a2
	.4byte	0x323
	.uleb128 0x39
	.4byte	0x522
	.4byte	.LBB19
	.4byte	.LBE19-.LBB19
	.byte	0x2
	.2byte	0x1aa
	.4byte	0xa24
	.uleb128 0x3a
	.4byte	0x52e
	.4byte	.LLST25
	.uleb128 0x36
	.4byte	.LVL73
	.4byte	0x10bd
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL68
	.4byte	0x1052
	.uleb128 0x3b
	.4byte	.LVL72
	.4byte	0x55c
	.4byte	0xa41
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x3b
	.4byte	.LVL74
	.4byte	0x10ce
	.4byte	0xa55
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x36
	.4byte	.LVL75
	.4byte	0x105d
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF88
	.byte	0x2
	.byte	0x98
	.4byte	0x39d
	.byte	0x1
	.4byte	0xa8d
	.uleb128 0x18
	.4byte	.LASF37
	.byte	0x2
	.byte	0x98
	.4byte	0x39d
	.uleb128 0x19
	.4byte	.LASF66
	.byte	0x2
	.byte	0x9a
	.4byte	0x39d
	.byte	0
	.uleb128 0x17
	.4byte	.LASF89
	.byte	0x2
	.byte	0xb2
	.4byte	0x39d
	.byte	0x1
	.4byte	0xab4
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x2
	.byte	0xb2
	.4byte	0x39d
	.uleb128 0x19
	.4byte	.LASF90
	.byte	0x2
	.byte	0xb4
	.4byte	0x39d
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x1ca
	.4byte	0x39d
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc80
	.uleb128 0x2f
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x1ca
	.4byte	0xba
	.4byte	.LLST26
	.uleb128 0x3c
	.ascii	"run\000"
	.byte	0x2
	.2byte	0x1ca
	.4byte	0x31d
	.4byte	.LLST27
	.uleb128 0x2f
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x1ca
	.4byte	0x31d
	.4byte	.LLST28
	.uleb128 0x3c
	.ascii	"arg\000"
	.byte	0x2
	.2byte	0x1ca
	.4byte	0xaa
	.4byte	.LLST29
	.uleb128 0x31
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x1ca
	.4byte	0xaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x31
	.4byte	.LASF94
	.byte	0x2
	.2byte	0x1ca
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x2f
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x1ca
	.4byte	0x3e
	.4byte	.LLST30
	.uleb128 0x2b
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x1cc
	.4byte	0x39d
	.4byte	.LLST31
	.uleb128 0x2b
	.4byte	.LASF95
	.byte	0x2
	.2byte	0x1cd
	.4byte	0xc80
	.4byte	.LLST32
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x1ce
	.4byte	0x6d
	.4byte	.LLST33
	.uleb128 0x3d
	.4byte	0xa66
	.4byte	.LBB26
	.4byte	.Ldebug_ranges0+0
	.byte	0x2
	.2byte	0x1df
	.4byte	0xbdb
	.uleb128 0x3a
	.4byte	0xa76
	.4byte	.LLST34
	.uleb128 0x3e
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x3f
	.4byte	0xa81
	.4byte	.LLST35
	.uleb128 0x3b
	.4byte	.LVL89
	.4byte	0x10df
	.4byte	0xbab
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x48
	.byte	0
	.uleb128 0x3b
	.4byte	.LVL91
	.4byte	0x10f4
	.4byte	0xbca
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x48
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x36
	.4byte	.LVL96
	.4byte	0x59c
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x34
	.4byte	.LBB31
	.4byte	.LBE31-.LBB31
	.4byte	0xbf9
	.uleb128 0x2b
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x1e5
	.4byte	0x74
	.4byte	.LLST36
	.byte	0
	.uleb128 0x3d
	.4byte	0xa8d
	.4byte	.LBB33
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x2
	.2byte	0x1f8
	.4byte	0xc26
	.uleb128 0x3a
	.4byte	0xa9d
	.4byte	.LLST37
	.uleb128 0x3e
	.4byte	.Ldebug_ranges0+0x20
	.uleb128 0x3f
	.4byte	0xaa8
	.4byte	.LLST38
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL81
	.4byte	0x1052
	.uleb128 0x3b
	.4byte	.LVL84
	.4byte	0x10f4
	.4byte	0xc4f
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0xfa
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x3b
	.4byte	.LVL85
	.4byte	0x10f4
	.4byte	0xc6e
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x36
	.4byte	.LVL102
	.4byte	0x105d
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x4c5
	.uleb128 0x30
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x1ff
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb8
	.uleb128 0x40
	.ascii	"fn\000"
	.byte	0x2
	.2byte	0x1ff
	.4byte	0x3b7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x40
	.ascii	"arg\000"
	.byte	0x2
	.2byte	0x1ff
	.4byte	0xaa
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x41
	.4byte	.LASF98
	.byte	0x2
	.2byte	0x209
	.4byte	0x39d
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x42
	.4byte	0x53a
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x30
	.4byte	.LASF97
	.byte	0x2
	.2byte	0x21c
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd8b
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x21c
	.4byte	0x39d
	.4byte	.LLST39
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x21e
	.4byte	0x6d
	.4byte	.LLST40
	.uleb128 0x2b
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x21f
	.4byte	0x39d
	.4byte	.LLST41
	.uleb128 0x39
	.4byte	0x4d0
	.4byte	.LBB39
	.4byte	.LBE39-.LBB39
	.byte	0x2
	.2byte	0x223
	.4byte	0xd5d
	.uleb128 0x3a
	.4byte	0x4eb
	.4byte	.LLST42
	.uleb128 0x3a
	.4byte	0x4e0
	.4byte	.LLST43
	.uleb128 0x23
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.uleb128 0x3f
	.4byte	0x4f6
	.4byte	.LLST44
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL107
	.4byte	0x1052
	.uleb128 0x3b
	.4byte	.LVL111
	.4byte	0x55c
	.4byte	0xd7a
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x36
	.4byte	.LVL115
	.4byte	0x105d
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x41
	.4byte	.LASF99
	.byte	0x2
	.2byte	0x22b
	.4byte	0x39d
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x41
	.4byte	.LASF100
	.byte	0x2
	.2byte	0x231
	.4byte	0xaa
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x30
	.4byte	.LASF101
	.byte	0x2
	.2byte	0x23e
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe32
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x23e
	.4byte	0x39d
	.4byte	.LLST45
	.uleb128 0x2f
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x23e
	.4byte	0x3e
	.4byte	.LLST46
	.uleb128 0x2b
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x240
	.4byte	0x6d
	.4byte	.LLST47
	.uleb128 0x43
	.4byte	.LASF103
	.byte	0x2
	.byte	0x51
	.4byte	0x6d
	.4byte	0xe0e
	.uleb128 0x1d
	.byte	0
	.uleb128 0x43
	.4byte	.LASF104
	.byte	0x2
	.byte	0x53
	.4byte	0x6d
	.4byte	0xe1f
	.uleb128 0x1d
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL119
	.4byte	0x1113
	.uleb128 0x2c
	.4byte	.LVL120
	.4byte	0x1124
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF105
	.byte	0x2
	.2byte	0x248
	.4byte	0x3e
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe5d
	.uleb128 0x2f
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x248
	.4byte	0x39d
	.4byte	.LLST48
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF106
	.byte	0x2
	.2byte	0x251
	.4byte	0x39d
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xedc
	.uleb128 0x2f
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x251
	.4byte	0x3e
	.4byte	.LLST49
	.uleb128 0x3b
	.4byte	.LVL126
	.4byte	0x10f4
	.4byte	0xea6
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x8
	.byte	0x28
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x36
	.4byte	.LVL127
	.4byte	0xab4
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC21
	.uleb128 0x28
	.uleb128 0x2
	.byte	0x7d
	.sleb128 8
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x28
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x28
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x44
	.4byte	.LASF108
	.byte	0x2
	.2byte	0x262
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x44
	.4byte	.LASF109
	.byte	0x2
	.2byte	0x26c
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x45
	.4byte	.LASF111
	.byte	0x2
	.2byte	0x270
	.byte	0x1
	.4byte	0xf1a
	.uleb128 0x46
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x270
	.4byte	0x39d
	.byte	0
	.uleb128 0x32
	.4byte	.LASF113
	.byte	0x2
	.2byte	0x287
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xf9a
	.uleb128 0x2b
	.4byte	.LASF73
	.byte	0x2
	.2byte	0x289
	.4byte	0x39d
	.4byte	.LLST50
	.uleb128 0x2b
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x28a
	.4byte	0x39d
	.4byte	.LLST51
	.uleb128 0x3d
	.4byte	0xf00
	.4byte	.LBB43
	.4byte	.Ldebug_ranges0+0x40
	.byte	0x2
	.2byte	0x294
	.4byte	0xf77
	.uleb128 0x3a
	.4byte	0xf0d
	.4byte	.LLST52
	.uleb128 0x2c
	.4byte	.LVL133
	.4byte	0x59c
	.byte	0
	.uleb128 0x2c
	.4byte	.LVL129
	.4byte	0xeee
	.uleb128 0x2c
	.4byte	.LVL130
	.4byte	0x1135
	.uleb128 0x36
	.4byte	.LVL134
	.4byte	0x9b4
	.uleb128 0x28
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x32
	.4byte	.LASF114
	.byte	0x2
	.2byte	0x2a1
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfc3
	.uleb128 0x2c
	.4byte	.LVL138
	.4byte	0xf1a
	.uleb128 0x2c
	.4byte	.LVL139
	.4byte	0x502
	.byte	0
	.uleb128 0x30
	.4byte	.LASF115
	.byte	0x2
	.2byte	0x2c1
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfe3
	.uleb128 0x2c
	.4byte	.LVL140
	.4byte	0x547
	.byte	0
	.uleb128 0x30
	.4byte	.LASF116
	.byte	0x2
	.2byte	0x2d4
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1003
	.uleb128 0x2c
	.4byte	.LVL141
	.4byte	0x547
	.byte	0
	.uleb128 0x47
	.4byte	.LASF49
	.byte	0x7
	.2byte	0x109
	.4byte	0x228
	.uleb128 0x48
	.4byte	.LASF117
	.byte	0x2
	.byte	0x1a
	.4byte	0x3bd
	.uleb128 0x5
	.byte	0x3
	.4byte	caribou_state
	.uleb128 0x49
	.4byte	.LASF118
	.byte	0x2
	.byte	0x39
	.4byte	0x74
	.uleb128 0x49
	.4byte	.LASF119
	.byte	0x2
	.byte	0x3b
	.4byte	0x74
	.uleb128 0x4a
	.4byte	.LASF121
	.byte	0x9
	.byte	0x53
	.4byte	0x6d
	.uleb128 0x4b
	.4byte	.LASF122
	.byte	0x9
	.byte	0x54
	.4byte	0x1052
	.uleb128 0x10
	.4byte	0x6d
	.byte	0
	.uleb128 0x4a
	.4byte	.LASF123
	.byte	0x9
	.byte	0x45
	.4byte	0x6d
	.uleb128 0x4b
	.4byte	.LASF124
	.byte	0x9
	.byte	0x47
	.4byte	0x106e
	.uleb128 0x10
	.4byte	0x6d
	.byte	0
	.uleb128 0x4c
	.4byte	.LASF139
	.byte	0x9
	.byte	0x4a
	.uleb128 0x4d
	.4byte	.LASF125
	.byte	0x2
	.2byte	0x195
	.4byte	0x6d
	.4byte	0x1087
	.uleb128 0x1d
	.byte	0
	.uleb128 0x4a
	.4byte	.LASF126
	.byte	0x9
	.byte	0x46
	.4byte	0x6d
	.uleb128 0x43
	.4byte	.LASF127
	.byte	0x6
	.byte	0x6e
	.4byte	0x86
	.4byte	0x10a3
	.uleb128 0x1d
	.byte	0
	.uleb128 0x4e
	.4byte	.LASF130
	.byte	0x6
	.byte	0x6c
	.4byte	0xb3
	.4byte	0x10bd
	.uleb128 0x10
	.4byte	0x86
	.uleb128 0x10
	.4byte	0x86
	.byte	0
	.uleb128 0x4b
	.4byte	.LASF128
	.byte	0xa
	.byte	0x20
	.4byte	0x10ce
	.uleb128 0x10
	.4byte	0xaa
	.byte	0
	.uleb128 0x4b
	.4byte	.LASF129
	.byte	0x6
	.byte	0x74
	.4byte	0x10df
	.uleb128 0x10
	.4byte	0xaa
	.byte	0
	.uleb128 0x4e
	.4byte	.LASF131
	.byte	0xa
	.byte	0x1d
	.4byte	0xaa
	.4byte	0x10f4
	.uleb128 0x10
	.4byte	0xcc
	.byte	0
	.uleb128 0x4e
	.4byte	.LASF132
	.byte	0xb
	.byte	0x29
	.4byte	0xaa
	.4byte	0x1113
	.uleb128 0x10
	.4byte	0xaa
	.uleb128 0x10
	.4byte	0x6d
	.uleb128 0x10
	.4byte	0xcc
	.byte	0
	.uleb128 0x43
	.4byte	.LASF103
	.byte	0x2
	.byte	0x51
	.4byte	0x6d
	.4byte	0x1124
	.uleb128 0x1d
	.byte	0
	.uleb128 0x43
	.4byte	.LASF104
	.byte	0x2
	.byte	0x53
	.4byte	0x6d
	.4byte	0x1135
	.uleb128 0x1d
	.byte	0
	.uleb128 0x4f
	.4byte	.LASF133
	.byte	0x8
	.byte	0xd5
	.4byte	0x6d
	.uleb128 0x10
	.4byte	0x39d
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x34
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x1d
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0x38
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
	.byte	0
	.byte	0
	.uleb128 0x39
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3c
	.uleb128 0x5
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3d
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x3f
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x40
	.uleb128 0x5
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
	.uleb128 0x41
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
	.uleb128 0x42
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
	.uleb128 0x43
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x44
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
	.uleb128 0x45
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x46
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
	.byte	0
	.byte	0
	.uleb128 0x47
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x48
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4a
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4b
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4c
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4d
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4e
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4f
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5-1
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL12
	.4byte	.LFE44
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x7
	.byte	0x72
	.sleb128 1
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL20
	.4byte	.LFE45
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL14
	.4byte	.LVL19-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL21
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22-1
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL23
	.4byte	.LFE46
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL21
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL26
	.4byte	.LFE46
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL22
	.4byte	.LVL25-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL27
	.4byte	.LVL28-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL28-1
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL30
	.4byte	.LFE49
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL28
	.4byte	.LVL29-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL32
	.4byte	.LFE50
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36
	.4byte	.LFE51
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42
	.4byte	.LFE53
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL44
	.4byte	.LFE54
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL46
	.4byte	.LFE55
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL47
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL48
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL52
	.4byte	.LVL53-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL53-1
	.4byte	.LFE47
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL52
	.4byte	.LVL53-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL53-1
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL62
	.4byte	.LFE47
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL54
	.4byte	.LVL61
	.2byte	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL55
	.4byte	.LVL56-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL58
	.4byte	.LVL59-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL63
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL64
	.4byte	.LVL65-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL65-1
	.4byte	.LFE48
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL67
	.4byte	.LVL68-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL68-1
	.4byte	.LVL76
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL76
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL69
	.4byte	.LVL70
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL70
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL72
	.4byte	.LVL76
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL76
	.4byte	.LFE59
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL78
	.4byte	.LVL81-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL81-1
	.4byte	.LFE61
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL78
	.4byte	.LVL80
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL80
	.4byte	.LVL86
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL86
	.4byte	.LFE61
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL78
	.4byte	.LVL80
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL80
	.4byte	.LFE61
	.2byte	0x2
	.byte	0x91
	.sleb128 -32
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL79
	.4byte	.LFE61
	.2byte	0x2
	.byte	0x91
	.sleb128 -44
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x2
	.byte	0x91
	.sleb128 8
	.4byte	.LVL79
	.4byte	.LVL81-1
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	.LVL81-1
	.4byte	.LFE61
	.2byte	0x2
	.byte	0x91
	.sleb128 8
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL78
	.4byte	.LVL92
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL94
	.4byte	.LVL96
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL84
	.4byte	.LVL87
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL82
	.4byte	.LVL83
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL83
	.4byte	.LFE61
	.2byte	0x2
	.byte	0x91
	.sleb128 -40
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL88
	.4byte	.LVL104
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL90
	.4byte	.LVL91-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL91-1
	.4byte	.LVL94
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL94
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL95
	.4byte	.LVL103
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL103
	.4byte	.LFE61
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL93
	.4byte	.LVL94
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL97
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST38:
	.4byte	.LVL97
	.4byte	.LVL99
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL100
	.4byte	.LVL101
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL106
	.4byte	.LVL107-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL107-1
	.4byte	.LVL116
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL116
	.4byte	.LFE65
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST40:
	.4byte	.LVL108
	.4byte	.LVL109
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL109
	.4byte	.LVL117
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST41:
	.4byte	.LVL110
	.4byte	.LVL111-1
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST42:
	.4byte	.LVL112
	.4byte	.LVL114
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST43:
	.4byte	.LVL112
	.4byte	.LVL114
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST44:
	.4byte	.LVL113
	.4byte	.LVL114
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST45:
	.4byte	.LVL118
	.4byte	.LVL119-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL119-1
	.4byte	.LVL121
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL121
	.4byte	.LFE68
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST46:
	.4byte	.LVL118
	.4byte	.LVL119-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL119-1
	.4byte	.LFE68
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST47:
	.4byte	.LVL119
	.4byte	.LVL120-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST48:
	.4byte	.LVL122
	.4byte	.LVL123
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL123
	.4byte	.LFE69
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST49:
	.4byte	.LVL124
	.4byte	.LVL125
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL125
	.4byte	.LFE70
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST50:
	.4byte	.LVL128
	.4byte	.LVL129-1
	.2byte	0x5
	.byte	0x3
	.4byte	caribou_state
	.4byte	.LVL131
	.4byte	.LVL135
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL136
	.4byte	.LVL137
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST51:
	.4byte	.LVL132
	.4byte	.LVL136
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST52:
	.4byte	.LVL132
	.4byte	.LVL135
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
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
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB30
	.4byte	.LBE30
	.4byte	.LBB32
	.4byte	.LBE32
	.4byte	0
	.4byte	0
	.4byte	.LBB33
	.4byte	.LBE33
	.4byte	.LBB37
	.4byte	.LBE37
	.4byte	.LBB38
	.4byte	.LBE38
	.4byte	0
	.4byte	0
	.4byte	.LBB43
	.4byte	.LBE43
	.4byte	.LBB46
	.4byte	.LBE46
	.4byte	0
	.4byte	0
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
.LASF130:
	.ascii	"caribou_timer_ticks_timeout\000"
.LASF123:
	.ascii	"chip_interrupts_disable\000"
.LASF64:
	.ascii	"hw_stack\000"
.LASF134:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF63:
	.ascii	"sw_stack\000"
.LASF101:
	.ascii	"caribou_thread_set_priority\000"
.LASF96:
	.ascii	"caribou_thread_fault_set\000"
.LASF28:
	.ascii	"timerfn\000"
.LASF49:
	.ascii	"__errno\000"
.LASF32:
	.ascii	"flags\000"
.LASF33:
	.ascii	"caribou_timer_t\000"
.LASF9:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"next\000"
.LASF135:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/kernel/thread.c\000"
.LASF82:
	.ascii	"caribou_thread_sleep\000"
.LASF79:
	.ascii	"caribou_thread_state\000"
.LASF89:
	.ascii	"append_thread_node\000"
.LASF126:
	.ascii	"chip_interrupts_enabled\000"
.LASF80:
	.ascii	"caribou_thread_parent\000"
.LASF138:
	.ascii	"remove_thread_node\000"
.LASF40:
	.ascii	"stack_top\000"
.LASF26:
	.ascii	"prev\000"
.LASF125:
	.ascii	"caribou_preempt\000"
.LASF77:
	.ascii	"caribou_thread_stacksize\000"
.LASF111:
	.ascii	"check_sp\000"
.LASF100:
	.ascii	"caribou_thread_current_arg\000"
.LASF70:
	.ascii	"other\000"
.LASF110:
	.ascii	"delete_thread_node\000"
.LASF69:
	.ascii	"caribou_thread_lock\000"
.LASF8:
	.ascii	"uint32_t\000"
.LASF36:
	.ascii	"_caribou_thread_t\000"
.LASF127:
	.ascii	"caribou_timer_ticks\000"
.LASF105:
	.ascii	"caribou_thread_priority\000"
.LASF93:
	.ascii	"stackaddr\000"
.LASF129:
	.ascii	"caribou_timer_delete_all\000"
.LASF131:
	.ascii	"malloc\000"
.LASF112:
	.ascii	"caribou_thread_wfi\000"
.LASF3:
	.ascii	"int16_t\000"
.LASF57:
	.ascii	"faultflags\000"
.LASF13:
	.ascii	"long long unsigned int\000"
.LASF95:
	.ascii	"process_frame\000"
.LASF38:
	.ascii	"stack_usage\000"
.LASF108:
	.ascii	"main_idle\000"
.LASF17:
	.ascii	"size_t\000"
.LASF10:
	.ascii	"int64_t\000"
.LASF133:
	.ascii	"caribou_timer_idle\000"
.LASF18:
	.ascii	"CPUID\000"
.LASF68:
	.ascii	"_caribou_thread_fault_emit\000"
.LASF45:
	.ascii	"runtime\000"
.LASF128:
	.ascii	"free\000"
.LASF121:
	.ascii	"chip_systick_irq_disable\000"
.LASF103:
	.ascii	"caribou_lock\000"
.LASF90:
	.ascii	"last\000"
.LASF30:
	.ascii	"ticks\000"
.LASF55:
	.ascii	"faultfn\000"
.LASF43:
	.ascii	"prio\000"
.LASF88:
	.ascii	"new_thread_node\000"
.LASF92:
	.ascii	"finish\000"
.LASF85:
	.ascii	"thread_finish\000"
.LASF15:
	.ascii	"char\000"
.LASF116:
	.ascii	"_systick\000"
.LASF21:
	.ascii	"AIRCR\000"
.LASF74:
	.ascii	"caribou_thread_set_name\000"
.LASF47:
	.ascii	"finishfn\000"
.LASF71:
	.ascii	"caribou_thread_unlock\000"
.LASF31:
	.ascii	"reloadticks\000"
.LASF75:
	.ascii	"caribou_thread_name\000"
.LASF98:
	.ascii	"caribou_thread_root\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF106:
	.ascii	"caribou_thread_init\000"
.LASF137:
	.ascii	"rd_thread_stack_ptr\000"
.LASF124:
	.ascii	"chip_interrupts_set\000"
.LASF11:
	.ascii	"long long int\000"
.LASF120:
	.ascii	"caribou_thread_current\000"
.LASF46:
	.ascii	"lock\000"
.LASF41:
	.ascii	"stack_base\000"
.LASF113:
	.ascii	"caribou_thread_once\000"
.LASF132:
	.ascii	"memset\000"
.LASF119:
	.ascii	"__process_stack_end__\000"
.LASF65:
	.ascii	"process_frame_t\000"
.LASF87:
	.ascii	"insert_thread_node\000"
.LASF62:
	.ascii	"sw_stack_frame_t\000"
.LASF91:
	.ascii	"caribou_thread_create\000"
.LASF107:
	.ascii	"caribou_thread_dump\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF20:
	.ascii	"RESERVED0\000"
.LASF22:
	.ascii	"RESERVED1\000"
.LASF23:
	.ascii	"SHCSR\000"
.LASF37:
	.ascii	"parent\000"
.LASF35:
	.ascii	"_caribou_timer_t\000"
.LASF4:
	.ascii	"short int\000"
.LASF117:
	.ascii	"caribou_state\000"
.LASF14:
	.ascii	"long int\000"
.LASF136:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF54:
	.ascii	"priority\000"
.LASF139:
	.ascii	"chip_wfi\000"
.LASF102:
	.ascii	"caribou_thread_yield\000"
.LASF66:
	.ascii	"node\000"
.LASF12:
	.ascii	"uint64_t\000"
.LASF86:
	.ascii	"caribou_thread_terminate\000"
.LASF51:
	.ascii	"caribou_thread_t\000"
.LASF78:
	.ascii	"caribou_thread_stackusage\000"
.LASF67:
	.ascii	"after\000"
.LASF24:
	.ascii	"SCB_Type\000"
.LASF44:
	.ascii	"name\000"
.LASF83:
	.ascii	"start\000"
.LASF81:
	.ascii	"caribou_thread_wakeup\000"
.LASF16:
	.ascii	"sizetype\000"
.LASF19:
	.ascii	"ICSR\000"
.LASF122:
	.ascii	"chip_systick_irq_set\000"
.LASF58:
	.ascii	"jiffies\000"
.LASF56:
	.ascii	"faultarg\000"
.LASF52:
	.ascii	"queue\000"
.LASF84:
	.ascii	"caribou_thread_sleep_current\000"
.LASF7:
	.ascii	"int32_t\000"
.LASF73:
	.ascii	"thread\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF104:
	.ascii	"caribou_lock_set\000"
.LASF118:
	.ascii	"__process_stack_base__\000"
.LASF114:
	.ascii	"caribou_thread_exec\000"
.LASF115:
	.ascii	"_pendsv\000"
.LASF25:
	.ascii	"caribou_timer_callback_fn\000"
.LASF50:
	.ascii	"sleep\000"
.LASF42:
	.ascii	"state\000"
.LASF59:
	.ascii	"tail_jiffies\000"
.LASF60:
	.ascii	"caribou_state_t\000"
.LASF72:
	.ascii	"caribou_thread_locked\000"
.LASF0:
	.ascii	"signed char\000"
.LASF76:
	.ascii	"caribou_thread_runtime\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF61:
	.ascii	"hw_stack_frame_t\000"
.LASF29:
	.ascii	"fnarg\000"
.LASF34:
	.ascii	"errno_t\000"
.LASF53:
	.ascii	"current\000"
.LASF94:
	.ascii	"stack_size\000"
.LASF97:
	.ascii	"caribou_thread_schedule\000"
.LASF48:
	.ascii	"timer\000"
.LASF39:
	.ascii	"stack_low\000"
.LASF99:
	.ascii	"caribou_thread_first\000"
.LASF109:
	.ascii	"board_idle\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
