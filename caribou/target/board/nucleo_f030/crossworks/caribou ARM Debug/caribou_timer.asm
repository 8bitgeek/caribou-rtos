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
	.file	"timer.c"
	.text
.Ltext0:
	.section	.text.rd_thread_stack_ptr,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	rd_thread_stack_ptr, %function
rd_thread_stack_ptr:
.LFB32:
	.file 1 "../../../cpu/arm/cortex-m0/cpu/cpu.h"
	.loc 1 111 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 112 0
	.syntax divided
@ 112 "../../../cpu/arm/cortex-m0/cpu/cpu.h" 1
	 mrs	r0, psp
 bx	lr

@ 0 "" 2
	.loc 1 114 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE32:
	.size	rd_thread_stack_ptr, .-rd_thread_stack_ptr
	.section	.text.rd_stack_ptr,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	rd_stack_ptr, %function
rd_stack_ptr:
.LFB33:
	.loc 1 118 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 119 0
	.syntax divided
@ 119 "../../../cpu/arm/cortex-m0/cpu/cpu.h" 1
	 mrs 	r0, msp
 bx	lr

@ 0 "" 2
	.loc 1 121 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE33:
	.size	rd_stack_ptr, .-rd_stack_ptr
	.global	timer_mutex
	.section	.data.timer_mutex,"aw",%progbits
	.align	2
	.type	timer_mutex, %object
	.size	timer_mutex, 8
timer_mutex:
	.word	0
	.short	0
	.byte	2
	.byte	0
	.section	.text.caribou_timer_ticks,"ax",%progbits
	.align	2
	.global	caribou_timer_ticks
	.code	16
	.thumb_func
	.type	caribou_timer_ticks, %function
caribou_timer_ticks:
.LFB34:
	.file 2 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/kernel/timer.c"
	.loc 2 33 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 2 34 0
	ldr	r3, .L5
	ldr	r4, [r3, #28]
	ldr	r3, [r3, #24]
	.loc 2 35 0
	movs	r0, r3
	movs	r1, r4
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L6:
	.align	2
.L5:
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
	.loc 2 46 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #8
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	str	r0, [r7, #4]
	.loc 2 47 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r3, r3
	.loc 2 48 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	caribou_timer_expired, .-caribou_timer_expired
	.section	.text.delete_timer_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	delete_timer_node, %function
delete_timer_node:
.LFB36:
	.loc 2 53 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	.loc 2 54 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3, #24]
	movs	r2, r3
	movs	r3, #1
	ands	r3, r2
	beq	.L11
	.loc 2 55 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
.L11:
	.loc 2 56 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	delete_timer_node, .-delete_timer_node
	.section	.text.find_timer_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	find_timer_node, %function
find_timer_node:
.LFB37:
	.loc 2 59 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #16
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 60 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 2 61 0
	ldr	r3, .L18
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
.LBB2:
	.loc 2 62 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #8]
	b	.L13
.L16:
	.loc 2 64 0
	ldr	r2, [r7]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.L14
	.loc 2 66 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L14:
	.loc 2 62 0 discriminator 2
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	str	r3, [r7, #8]
.L13:
	.loc 2 62 0 is_stmt 0 discriminator 1
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L15
	.loc 2 62 0 discriminator 3
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L16
.L15:
.LBE2:
	.loc 2 69 0 is_stmt 1
	ldr	r3, .L18
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 2 70 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 2 71 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	timer_mutex
.LFE37:
	.size	find_timer_node, .-find_timer_node
	.section	.text.append_timer_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	append_timer_node, %function
append_timer_node:
.LFB38:
	.loc 2 75 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #16
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 76 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	find_timer_node
	subs	r3, r0, #0
	bne	.L21
.LBB3:
	.loc 2 78 0
	ldr	r3, .L27
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 2 79 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #12]
	.loc 2 80 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L22
	.loc 2 82 0
	b	.L23
.L24:
	.loc 2 84 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	str	r3, [r7, #12]
.L23:
	.loc 2 82 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L24
	.loc 2 86 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3, #4]
	.loc 2 87 0
	ldr	r3, [r7]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	b	.L25
.L22:
	.loc 2 91 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #56]
	.loc 2 92 0
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3]
	.loc 2 93 0
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3, #4]
.L25:
	.loc 2 95 0
	ldr	r3, .L27
	movs	r0, r3
	bl	caribou_mutex_unlock
.L21:
.LBE3:
	.loc 2 97 0
	ldr	r3, [r7]
	.loc 2 98 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L28:
	.align	2
.L27:
	.word	timer_mutex
.LFE38:
	.size	append_timer_node, .-append_timer_node
	.section	.text.remove_timer_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	remove_timer_node, %function
remove_timer_node:
.LFB39:
	.loc 2 102 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 103 0
	ldr	r3, .L36
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 2 104 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #56]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L30
	.loc 2 106 0
	ldr	r3, [r7]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	str	r2, [r3, #56]
	.loc 2 107 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	cmp	r3, #0
	beq	.L32
	.loc 2 109 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	movs	r2, #0
	str	r2, [r3]
	b	.L32
.L30:
	.loc 2 114 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L33
	.loc 2 114 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldr	r3, [r3]
	ldr	r2, [r7]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
.L33:
	.loc 2 115 0 is_stmt 1
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L34
	.loc 2 115 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7]
	ldr	r2, [r2]
	str	r2, [r3]
.L34:
	.loc 2 116 0 is_stmt 1
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 2 117 0
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3]
.L32:
	.loc 2 119 0
	ldr	r3, .L36
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 2 120 0
	ldr	r3, [r7]
	.loc 2 121 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L37:
	.align	2
.L36:
	.word	timer_mutex
.LFE39:
	.size	remove_timer_node, .-remove_timer_node
	.section	.text.new_timer_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	new_timer_node, %function
new_timer_node:
.LFB40:
	.loc 2 128 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 129 0
	movs	r0, #28
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 130 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L39
.LBB4:
	.loc 2 132 0
	ldr	r3, [r7, #12]
	movs	r2, #28
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 2 133 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	.loc 2 134 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7]
	str	r2, [r3, #12]
.LBE4:
	b	.L40
.L39:
	.loc 2 138 0
	movs	r0, #8
	bl	_caribou_thread_fault_emit
.L40:
	.loc 2 140 0
	ldr	r3, [r7, #12]
	.loc 2 141 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE40:
	.size	new_timer_node, .-new_timer_node
	.section	.text.caribou_timer_create,"ax",%progbits
	.align	2
	.global	caribou_timer_create
	.code	16
	.thumb_func
	.type	caribou_timer_create, %function
caribou_timer_create:
.LFB41:
	.loc 2 153 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #24
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 2 154 0
	bl	caribou_thread_current
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 2 155 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	new_timer_node
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 2 156 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	beq	.L43
	.loc 2 158 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, #1
	orrs	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #16]
	strb	r2, [r3, #24]
	.loc 2 159 0
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	.loc 2 160 0
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #8]
	str	r2, [r3, #12]
	.loc 2 161 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	movs	r1, r2
	movs	r0, r3
	bl	append_timer_node
.L43:
	.loc 2 163 0
	ldr	r3, [r7, #16]
	.loc 2 164 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 175 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #24
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r2, r3
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 2 176 0
	bl	caribou_thread_current
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 2 177 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L46
.LBB5:
	.loc 2 179 0
	ldr	r3, [r7, #12]
	movs	r2, #28
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 2 180 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	movs	r2, #1
	bics	r3, r2
	uxtb	r2, r3
	ldr	r3, [r7, #12]
	strb	r2, [r3, #24]
	.loc 2 181 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3, #8]
	.loc 2 182 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
	.loc 2 183 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #20]
	movs	r1, r2
	movs	r0, r3
	bl	append_timer_node
.L46:
.LBE5:
	.loc 2 185 0
	ldr	r3, [r7, #12]
	.loc 2 186 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 195 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI26:
	sub	sp, sp, #20
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	str	r0, [r7, #8]
	str	r1, [r7, #12]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 2 196 0
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	orrs	r3, r2
	bne	.L49
	.loc 2 197 0
	movs	r3, #0
	b	.L50
.L49:
	.loc 2 198 0
	ldr	r3, [r7]
	adds	r3, r3, #1
	bne	.L51
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	bne	.L51
	.loc 2 199 0
	movs	r3, #1
	b	.L50
.L51:
	.loc 2 200 0
	ldr	r3, .L54
	ldr	r1, [r3, #24]
	ldr	r2, [r3, #28]
	ldr	r3, [r7, #8]
	ldr	r4, [r7, #12]
	subs	r1, r1, r3
	sbcs	r2, r2, r4
	movs	r3, r1
	movs	r4, r2
	movs	r2, #1
	adds	r1, r2, #0
	ldr	r2, [r7, #4]
	cmp	r2, r4
	bgt	.L53
	ldr	r2, [r7, #4]
	cmp	r2, r4
	bne	.L52
	ldr	r2, [r7]
	cmp	r2, r3
	bls	.L52
.L53:
	movs	r3, #0
	adds	r1, r3, #0
.L52:
	uxtb	r3, r1
.L50:
	.loc 2 201 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L55:
	.align	2
.L54:
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
	.loc 2 210 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	sub	sp, sp, #8
.LCFI30:
	add	r7, sp, #0
.LCFI31:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 211 0
	ldr	r3, .L58
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 2 212 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #16]
	.loc 2 213 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #20]
	.loc 2 214 0
	ldr	r3, .L58
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 2 215 0
	ldr	r3, [r7, #4]
	.loc 2 216 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L59:
	.align	2
.L58:
	.word	timer_mutex
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
	.loc 2 224 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI32:
	sub	sp, sp, #8
.LCFI33:
	add	r7, sp, #0
.LCFI34:
	str	r0, [r7, #4]
	.loc 2 225 0
	ldr	r3, .L62
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 2 226 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #4]
	str	r2, [r3, #16]
	.loc 2 227 0
	ldr	r3, .L62
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 2 228 0
	ldr	r3, [r7, #4]
	.loc 2 229 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L63:
	.align	2
.L62:
	.word	timer_mutex
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
	.loc 2 237 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI35:
	sub	sp, sp, #8
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 238 0
	ldr	r3, .L65
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 2 239 0
	ldr	r3, [r7]
	movs	r1, #0
	movs	r0, r3
	bl	caribou_timer_set
	.loc 2 240 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	remove_timer_node
	.loc 2 241 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	delete_timer_node
	.loc 2 242 0
	ldr	r3, .L65
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 2 243 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L66:
	.align	2
.L65:
	.word	timer_mutex
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
	.loc 2 249 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI38:
	sub	sp, sp, #8
.LCFI39:
	add	r7, sp, #0
.LCFI40:
	str	r0, [r7, #4]
	.loc 2 250 0
	b	.L68
.L69:
	.loc 2 251 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #56]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	caribou_timer_delete
.L68:
	.loc 2 250 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	cmp	r3, #0
	bne	.L69
	.loc 2 252 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE47:
	.size	caribou_timer_delete_all, .-caribou_timer_delete_all
	.section	.text.expire_timer,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	expire_timer, %function
expire_timer:
.LFB48:
	.loc 2 261 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI41:
	sub	sp, sp, #28
.LCFI42:
	add	r7, sp, #0
.LCFI43:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 2 262 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 2 263 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L71
	.loc 2 265 0
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L72
	.loc 2 265 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #4]
	subs	r2, r2, r3
	b	.L73
.L72:
	.loc 2 265 0 discriminator 2
	movs	r2, #0
.L73:
	.loc 2 265 0 discriminator 4
	ldr	r3, [r7, #8]
	str	r2, [r3, #16]
	.loc 2 266 0 is_stmt 1 discriminator 4
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L71
	.loc 2 268 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L74
	.loc 2 270 0
	ldr	r3, [r7, #8]
	ldr	r4, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #12]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	blx	r4
.L74:
	.loc 2 272 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3, #24]
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	bne	.L75
	.loc 2 274 0
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #20]
	ldr	r3, [r7, #8]
	str	r2, [r3, #16]
.L75:
	.loc 2 276 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L71:
	.loc 2 279 0
	ldr	r3, [r7, #20]
	.loc 2 280 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE48:
	.size	expire_timer, .-expire_timer
	.section	.text.caribou_timer_idle,"ax",%progbits
	.align	2
	.global	caribou_timer_idle
	.code	16
	.thumb_func
	.type	caribou_timer_idle, %function
caribou_timer_idle:
.LFB49:
	.loc 2 287 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI44:
	sub	sp, sp, #28
.LCFI45:
	add	r7, sp, #0
.LCFI46:
	str	r0, [r7, #4]
	.loc 2 290 0
	ldr	r3, .L84
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 2 291 0
	ldr	r3, .L84+4
	ldr	r4, [r3, #28]
	ldr	r3, [r3, #24]
	movs	r2, r3
	ldr	r3, .L84+4
	ldr	r4, [r3, #36]
	ldr	r3, [r3, #32]
	subs	r3, r2, r3
	str	r3, [r7, #12]
	.loc 2 292 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L78
	.loc 2 294 0
	ldr	r3, .L84+4
	ldr	r4, [r3, #28]
	ldr	r3, [r3, #24]
	ldr	r2, .L84+4
	str	r3, [r2, #32]
	str	r4, [r2, #36]
	.loc 2 295 0
	b	.L79
.L82:
.LBB6:
	.loc 2 298 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #56]
	str	r3, [r7, #16]
	b	.L80
.L81:
	.loc 2 300 0 discriminator 3
	ldr	r2, [r7, #12]
	ldr	r1, [r7, #16]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	expire_timer
	movs	r2, r0
	ldr	r3, [r7, #20]
	adds	r3, r3, r2
	str	r3, [r7, #20]
	.loc 2 298 0 discriminator 3
	ldr	r3, [r7, #16]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
.L80:
	.loc 2 298 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne	.L81
.LBE6:
	.loc 2 302 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #4]
.L79:
	.loc 2 295 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L82
.L78:
	.loc 2 305 0
	ldr	r3, .L84
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 2 306 0
	ldr	r3, [r7, #20]
	.loc 2 307 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L85:
	.align	2
.L84:
	.word	timer_mutex
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
	.loc 2 313 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI47:
	sub	sp, sp, #8
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	str	r0, [r7, #4]
	.loc 2 314 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	chip_usec_delay
	.loc 2 315 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI0-.LFB34
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
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
	.4byte	.LCFI2-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
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
	.4byte	.LCFI5-.LFB36
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI8-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
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
	.4byte	.LCFI11-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
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
	.4byte	.LCFI14-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
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
	.4byte	.LCFI17-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
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
	.4byte	.LCFI20-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
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
	.4byte	.LCFI23-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
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
	.4byte	.LCFI26-.LFB43
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
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
	.4byte	.LCFI29-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
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
	.4byte	.LCFI32-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
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
	.4byte	.LCFI35-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
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
	.4byte	.LCFI38-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
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
	.4byte	.LCFI41-.LFB48
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
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
	.4byte	.LCFI44-.LFB49
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
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
	.4byte	.LCFI47-.LFB50
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 4 "../../../../include/caribou/kernel/timer.h"
	.file 5 "../../../../include/caribou/lib/errno.h"
	.file 6 "../../../../include/caribou/kernel/thread.h"
	.file 7 "../../../../include/caribou/lib/mutex.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7ef
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0xc
	.4byte	.LASF84
	.4byte	.LASF85
	.4byte	.Ldebug_ranges0+0
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
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x17
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x23
	.4byte	0x86
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x24
	.4byte	0x98
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb5
	.uleb128 0x7
	.4byte	0xa8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x4
	.byte	0x2f
	.4byte	0xcc
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0xe5
	.uleb128 0x9
	.4byte	0x9f
	.uleb128 0x9
	.4byte	0xe5
	.uleb128 0x9
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xeb
	.uleb128 0xa
	.4byte	.LASF26
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1c
	.byte	0x4
	.byte	0x38
	.4byte	0x151
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x4
	.byte	0x3b
	.4byte	0x151
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x4
	.byte	0x3d
	.4byte	0x151
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x4
	.byte	0x3f
	.4byte	0x157
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x4
	.byte	0x41
	.4byte	0x9f
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x4
	.byte	0x43
	.4byte	0x69
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x4
	.byte	0x45
	.4byte	0x69
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x4
	.byte	0x47
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xf0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc1
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x4
	.byte	0x48
	.4byte	0xf0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x108
	.4byte	0x62
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x48
	.byte	0x6
	.byte	0x1f
	.4byte	0x24c
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x6
	.byte	0x22
	.4byte	0x24c
	.byte	0
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x6
	.byte	0x25
	.4byte	0x24c
	.byte	0x4
	.uleb128 0xe
	.ascii	"sp\000"
	.byte	0x6
	.byte	0x28
	.4byte	0x9f
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x6
	.byte	0x2b
	.4byte	0x9f
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x6
	.byte	0x2e
	.4byte	0x9f
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x6
	.byte	0x31
	.4byte	0x9f
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x6
	.byte	0x34
	.4byte	0x9f
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x6
	.byte	0x37
	.4byte	0x50
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x6
	.byte	0x3a
	.4byte	0x3e
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x6
	.byte	0x3d
	.4byte	0xaf
	.byte	0x20
	.uleb128 0xe
	.ascii	"arg\000"
	.byte	0x6
	.byte	0x40
	.4byte	0x9f
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x6
	.byte	0x43
	.4byte	0x8d
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x6
	.byte	0x46
	.4byte	0x3e
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x6
	.byte	0x49
	.4byte	0x25d
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x6
	.byte	0x4c
	.4byte	0x263
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x6
	.byte	0x4f
	.4byte	0x168
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x6
	.byte	0x52
	.4byte	0x3e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x174
	.uleb128 0xf
	.4byte	0x25d
	.uleb128 0x9
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x252
	.uleb128 0x6
	.byte	0x4
	.4byte	0x15d
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x6
	.byte	0x5f
	.4byte	0x174
	.uleb128 0x10
	.byte	0x28
	.byte	0x6
	.byte	0x62
	.4byte	0x2dd
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x6
	.byte	0x65
	.4byte	0x2dd
	.byte	0
	.uleb128 0xc
	.4byte	.LASF44
	.byte	0x6
	.byte	0x67
	.4byte	0x2dd
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x6
	.byte	0x69
	.4byte	0x3e
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x6
	.byte	0x6b
	.4byte	0x2f7
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF47
	.byte	0x6
	.byte	0x6d
	.4byte	0x9f
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x6
	.byte	0x6f
	.4byte	0x50
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF49
	.byte	0x6
	.byte	0x71
	.4byte	0x7b
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF50
	.byte	0x6
	.byte	0x73
	.4byte	0x7b
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x269
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0x2f7
	.uleb128 0x9
	.4byte	0x62
	.uleb128 0x9
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2e3
	.uleb128 0x3
	.4byte	.LASF51
	.byte	0x6
	.byte	0x74
	.4byte	0x274
	.uleb128 0x10
	.byte	0x8
	.byte	0x7
	.byte	0x1e
	.4byte	0x341
	.uleb128 0xc
	.4byte	.LASF52
	.byte	0x7
	.byte	0x20
	.4byte	0x9f
	.byte	0
	.uleb128 0xc
	.4byte	.LASF53
	.byte	0x7
	.byte	0x21
	.4byte	0x50
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x7
	.byte	0x22
	.4byte	0x2c
	.byte	0x6
	.uleb128 0xc
	.4byte	.LASF54
	.byte	0x7
	.byte	0x23
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF55
	.byte	0x7
	.byte	0x24
	.4byte	0x308
	.uleb128 0x11
	.4byte	.LASF56
	.byte	0x1
	.byte	0x6e
	.4byte	0x9f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF57
	.byte	0x1
	.byte	0x75
	.4byte	0x9f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF86
	.byte	0x2
	.byte	0x20
	.4byte	0x7b
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x2
	.byte	0x2d
	.4byte	0xa8
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3b3
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x2
	.byte	0x2d
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF87
	.byte	0x2
	.byte	0x34
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d7
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x2
	.byte	0x34
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0x2
	.byte	0x3a
	.4byte	0xa8
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x432
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x2
	.byte	0x3a
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x2
	.byte	0x3a
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x3c
	.4byte	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x19
	.4byte	.LASF18
	.byte	0x2
	.byte	0x3e
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF60
	.byte	0x2
	.byte	0x4a
	.4byte	0x263
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x480
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x2
	.byte	0x4a
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x2
	.byte	0x4a
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x19
	.4byte	.LASF61
	.byte	0x2
	.byte	0x4f
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF62
	.byte	0x2
	.byte	0x65
	.4byte	0x263
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4b6
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x2
	.byte	0x65
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0x2
	.byte	0x65
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x16
	.4byte	.LASF63
	.byte	0x2
	.byte	0x7f
	.4byte	0x263
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x511
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x2
	.byte	0x7f
	.4byte	0x525
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF20
	.byte	0x2
	.byte	0x7f
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF58
	.byte	0x2
	.byte	0x81
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x1a
	.4byte	.LASF67
	.byte	0x2
	.byte	0x84
	.4byte	0x62
	.uleb128 0x1b
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0x525
	.uleb128 0x9
	.4byte	0x9f
	.uleb128 0x9
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x511
	.uleb128 0x1c
	.4byte	.LASF65
	.byte	0x2
	.byte	0x98
	.4byte	0x263
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x58b
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x2
	.byte	0x98
	.4byte	0x157
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x98
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x2
	.byte	0x98
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x19
	.4byte	.LASF52
	.byte	0x2
	.byte	0x9a
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x2
	.byte	0x9b
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF66
	.byte	0x2
	.byte	0xae
	.4byte	0x263
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x602
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x2
	.byte	0xae
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF19
	.byte	0x2
	.byte	0xae
	.4byte	0x157
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.ascii	"arg\000"
	.byte	0x2
	.byte	0xae
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LASF23
	.byte	0x2
	.byte	0xae
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x19
	.4byte	.LASF52
	.byte	0x2
	.byte	0xb0
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x1a
	.4byte	.LASF67
	.byte	0x2
	.byte	0x84
	.4byte	0x62
	.uleb128 0x1b
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LASF68
	.byte	0x2
	.byte	0xc2
	.4byte	0xa8
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x638
	.uleb128 0x14
	.4byte	.LASF69
	.byte	0x2
	.byte	0xc2
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LASF70
	.byte	0x2
	.byte	0xc2
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF71
	.byte	0x2
	.byte	0xd1
	.4byte	0x263
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x66e
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x2
	.byte	0xd1
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF21
	.byte	0x2
	.byte	0xd1
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF72
	.byte	0x2
	.byte	0xdf
	.4byte	0x263
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x696
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x2
	.byte	0xdf
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF73
	.byte	0x2
	.byte	0xec
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c8
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x2
	.byte	0xec
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0x2
	.byte	0xec
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF74
	.byte	0x2
	.byte	0xf8
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ec
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x2
	.byte	0xf8
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF75
	.byte	0x2
	.2byte	0x104
	.4byte	0x62
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x742
	.uleb128 0x20
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x104
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x20
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x104
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x104
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x106
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x22
	.4byte	.LASF77
	.byte	0x2
	.2byte	0x11e
	.4byte	0x62
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a2
	.uleb128 0x20
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x11e
	.4byte	0x2dd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x120
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.4byte	.LASF76
	.byte	0x2
	.2byte	0x121
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x23
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x12a
	.4byte	0x263
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF78
	.byte	0x2
	.2byte	0x138
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d6
	.uleb128 0x20
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x138
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x25
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x13a
	.4byte	0x62
	.uleb128 0x1b
	.byte	0
	.byte	0
	.uleb128 0x26
	.4byte	.LASF81
	.byte	0x6
	.byte	0x77
	.4byte	0x2fd
	.uleb128 0x27
	.4byte	.LASF82
	.byte	0x2
	.byte	0x1a
	.4byte	0x341
	.uleb128 0x5
	.byte	0x3
	.4byte	timer_mutex
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
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x205
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7f3
	.4byte	0x34c
	.ascii	"rd_thread_stack_ptr\000"
	.4byte	0x361
	.ascii	"rd_stack_ptr\000"
	.4byte	0x376
	.ascii	"caribou_timer_ticks\000"
	.4byte	0x38b
	.ascii	"caribou_timer_expired\000"
	.4byte	0x3b3
	.ascii	"delete_timer_node\000"
	.4byte	0x3d7
	.ascii	"find_timer_node\000"
	.4byte	0x432
	.ascii	"append_timer_node\000"
	.4byte	0x480
	.ascii	"remove_timer_node\000"
	.4byte	0x4b6
	.ascii	"new_timer_node\000"
	.4byte	0x502
	.ascii	"memset\000"
	.4byte	0x52b
	.ascii	"caribou_timer_create\000"
	.4byte	0x58b
	.ascii	"caribou_timer_init\000"
	.4byte	0x5f3
	.ascii	"memset\000"
	.4byte	0x602
	.ascii	"caribou_timer_ticks_timeout\000"
	.4byte	0x638
	.ascii	"caribou_timer_set\000"
	.4byte	0x66e
	.ascii	"caribou_timer_reset\000"
	.4byte	0x696
	.ascii	"caribou_timer_delete\000"
	.4byte	0x6c8
	.ascii	"caribou_timer_delete_all\000"
	.4byte	0x6ec
	.ascii	"expire_timer\000"
	.4byte	0x742
	.ascii	"caribou_timer_idle\000"
	.4byte	0x7a2
	.ascii	"caribou_timer_usec_delay\000"
	.4byte	0x7c7
	.ascii	"chip_usec_delay\000"
	.4byte	0x7e1
	.ascii	"timer_mutex\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1af
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x7f3
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x49
	.ascii	"short int\000"
	.4byte	0x3e
	.ascii	"int16_t\000"
	.4byte	0x5b
	.ascii	"short unsigned int\000"
	.4byte	0x50
	.ascii	"uint16_t\000"
	.4byte	0x62
	.ascii	"int\000"
	.4byte	0x74
	.ascii	"unsigned int\000"
	.4byte	0x69
	.ascii	"uint32_t\000"
	.4byte	0x86
	.ascii	"long long int\000"
	.4byte	0x7b
	.ascii	"int64_t\000"
	.4byte	0x98
	.ascii	"long long unsigned int\000"
	.4byte	0x8d
	.ascii	"uint64_t\000"
	.4byte	0xa1
	.ascii	"long int\000"
	.4byte	0xa8
	.ascii	"char\000"
	.4byte	0xba
	.ascii	"sizetype\000"
	.4byte	0xc1
	.ascii	"caribou_timer_callback_fn\000"
	.4byte	0xf0
	.ascii	"_caribou_timer_t\000"
	.4byte	0x15d
	.ascii	"caribou_timer_t\000"
	.4byte	0x168
	.ascii	"errno_t\000"
	.4byte	0x174
	.ascii	"_caribou_thread_t\000"
	.4byte	0x269
	.ascii	"caribou_thread_t\000"
	.4byte	0x2fd
	.ascii	"caribou_state_t\000"
	.4byte	0x341
	.ascii	"caribou_mutex_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xac
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF82:
	.ascii	"timer_mutex\000"
.LASF21:
	.ascii	"ticks\000"
.LASF42:
	.ascii	"caribou_thread_t\000"
.LASF75:
	.ascii	"expire_timer\000"
.LASF62:
	.ascii	"remove_timer_node\000"
.LASF81:
	.ascii	"caribou_state\000"
.LASF45:
	.ascii	"priority\000"
.LASF64:
	.ascii	"caribou_timer_expired\000"
.LASF11:
	.ascii	"uint64_t\000"
.LASF80:
	.ascii	"chip_usec_delay\000"
.LASF87:
	.ascii	"delete_timer_node\000"
.LASF4:
	.ascii	"short int\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF22:
	.ascii	"reloadticks\000"
.LASF72:
	.ascii	"caribou_timer_reset\000"
.LASF85:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF84:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/k"
	.ascii	"ernel/timer.c\000"
.LASF10:
	.ascii	"long long int\000"
.LASF51:
	.ascii	"caribou_state_t\000"
.LASF48:
	.ascii	"faultflags\000"
.LASF9:
	.ascii	"int64_t\000"
.LASF71:
	.ascii	"caribou_timer_set\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF53:
	.ascii	"locks\000"
.LASF28:
	.ascii	"parent\000"
.LASF56:
	.ascii	"rd_thread_stack_ptr\000"
.LASF54:
	.ascii	"blocking\000"
.LASF73:
	.ascii	"caribou_timer_delete\000"
.LASF63:
	.ascii	"new_timer_node\000"
.LASF77:
	.ascii	"caribou_timer_idle\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF67:
	.ascii	"memset\000"
.LASF13:
	.ascii	"long int\000"
.LASF86:
	.ascii	"caribou_timer_ticks\000"
.LASF58:
	.ascii	"node\000"
.LASF39:
	.ascii	"timer\000"
.LASF66:
	.ascii	"caribou_timer_init\000"
.LASF43:
	.ascii	"queue\000"
.LASF35:
	.ascii	"name\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF47:
	.ascii	"faultarg\000"
.LASF25:
	.ascii	"errno_t\000"
.LASF32:
	.ascii	"stack_base\000"
.LASF59:
	.ascii	"find_timer_node\000"
.LASF68:
	.ascii	"caribou_timer_ticks_timeout\000"
.LASF0:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"flags\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF36:
	.ascii	"runtime\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF52:
	.ascii	"thread\000"
.LASF79:
	.ascii	"usecs\000"
.LASF44:
	.ascii	"current\000"
.LASF41:
	.ascii	"sleep\000"
.LASF61:
	.ascii	"last\000"
.LASF29:
	.ascii	"stack_usage\000"
.LASF19:
	.ascii	"timerfn\000"
.LASF69:
	.ascii	"start\000"
.LASF24:
	.ascii	"caribou_timer_t\000"
.LASF74:
	.ascii	"caribou_timer_delete_all\000"
.LASF14:
	.ascii	"char\000"
.LASF78:
	.ascii	"caribou_timer_usec_delay\000"
.LASF37:
	.ascii	"lock\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF3:
	.ascii	"int16_t\000"
.LASF38:
	.ascii	"finishfn\000"
.LASF76:
	.ascii	"delta_jiffies\000"
.LASF57:
	.ascii	"rd_stack_ptr\000"
.LASF20:
	.ascii	"fnarg\000"
.LASF27:
	.ascii	"_caribou_thread_t\000"
.LASF49:
	.ascii	"jiffies\000"
.LASF33:
	.ascii	"state\000"
.LASF30:
	.ascii	"stack_low\000"
.LASF50:
	.ascii	"tail_jiffies\000"
.LASF60:
	.ascii	"append_timer_node\000"
.LASF83:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF16:
	.ascii	"caribou_timer_callback_fn\000"
.LASF31:
	.ascii	"stack_top\000"
.LASF26:
	.ascii	"_caribou_timer_t\000"
.LASF17:
	.ascii	"prev\000"
.LASF46:
	.ascii	"faultfn\000"
.LASF34:
	.ascii	"prio\000"
.LASF70:
	.ascii	"timeout\000"
.LASF18:
	.ascii	"next\000"
.LASF40:
	.ascii	"__errno\000"
.LASF55:
	.ascii	"caribou_mutex_t\000"
.LASF65:
	.ascii	"caribou_timer_create\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
