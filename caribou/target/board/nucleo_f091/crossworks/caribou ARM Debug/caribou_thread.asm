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
	.global	caribou_state
	.section	.bss.caribou_state,"aw",%nobits
	.align	3
	.type	caribou_state, %object
	.size	caribou_state, 40
caribou_state:
	.space	40
	.section	.text.fault_clear,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	fault_clear, %function
fault_clear:
.LFB34:
	.file 2 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c"
	.loc 2 83 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	.loc 2 84 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 2 85 0
	ldr	r3, .L5
	movs	r2, #0
	strh	r2, [r3, #20]
	.loc 2 86 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 87 0
	movs	r3, #0
	.loc 2 88 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	caribou_state
.LFE34:
	.size	fault_clear, .-fault_clear
	.section	.text.fault_set,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	fault_set, %function
fault_set:
.LFB35:
	.loc 2 95 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 2 96 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 97 0
	ldr	r3, .L9
	ldrh	r2, [r3, #20]
	adds	r3, r7, #6
	ldrh	r3, [r3]
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, .L9
	strh	r2, [r3, #20]
	.loc 2 98 0
	adds	r3, r7, #6
	ldr	r2, .L9
	ldrh	r2, [r2, #20]
	strh	r2, [r3]
	.loc 2 99 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 100 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	.loc 2 101 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	caribou_state
.LFE35:
	.size	fault_set, .-fault_set
	.section	.text._caribou_thread_fault_emit,"ax",%progbits
	.align	2
	.global	_caribou_thread_fault_emit
	.code	16
	.thumb_func
	.type	_caribou_thread_fault_emit, %function
_caribou_thread_fault_emit:
.LFB36:
	.loc 2 107 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 2 108 0
	ldr	r3, .L14
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L12
	.loc 2 110 0
	ldr	r3, .L14
	ldr	r2, [r3, #12]
	adds	r3, r7, #6
	ldrh	r0, [r3]
	ldr	r3, .L14
	ldr	r3, [r3, #16]
	movs	r1, r3
	blx	r2
.L12:
	.loc 2 112 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	.loc 2 113 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	caribou_state
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
	.loc 2 136 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	.loc 2 145 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	caribou_thread_dump, .-caribou_thread_dump
	.section	.text.new_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	new_thread_node, %function
new_thread_node:
.LFB38:
	.loc 2 156 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #16
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	str	r0, [r7, #4]
	.loc 2 157 0
	movs	r0, #72
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 158 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L18
	.loc 2 160 0
	ldr	r3, [r7, #12]
	movs	r2, #72
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 2 161 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #4]
	b	.L19
.L18:
	.loc 2 165 0
	movs	r0, #8
	bl	_caribou_thread_fault_emit
.L19:
	.loc 2 167 0
	ldr	r3, [r7, #12]
	.loc 2 168 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	new_thread_node, .-new_thread_node
	.section	.text.delete_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	delete_thread_node, %function
delete_thread_node:
.LFB39:
	.loc 2 174 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	.loc 2 175 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
	.loc 2 176 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	delete_thread_node, .-delete_thread_node
	.section	.text.append_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	append_thread_node, %function
append_thread_node:
.LFB40:
	.loc 2 182 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #16
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	.loc 2 183 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 2 184 0
	ldr	r3, .L28
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 2 185 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L23
	.loc 2 187 0
	b	.L24
.L25:
	.loc 2 189 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L24:
	.loc 2 187 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L25
	.loc 2 191 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3]
	b	.L26
.L23:
	.loc 2 195 0
	ldr	r3, .L28
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 2 196 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
.L26:
	.loc 2 198 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 199 0
	ldr	r3, [r7, #4]
	.loc 2 200 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	caribou_state
.LFE40:
	.size	append_thread_node, .-append_thread_node
	.section	.text.insert_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	insert_thread_node, %function
insert_thread_node:
.LFB41:
	.loc 2 206 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #16
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 207 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 208 0
	ldr	r3, [r7]
	ldr	r3, [r3]
	str	r3, [r7, #8]
	.loc 2 209 0
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 2 210 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	.loc 2 211 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 212 0
	ldr	r3, [r7, #4]
	.loc 2 213 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	insert_thread_node, .-insert_thread_node
	.section	.text.remove_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	remove_thread_node, %function
remove_thread_node:
.LFB42:
	.loc 2 219 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #16
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	str	r0, [r7, #4]
	.loc 2 220 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 2 221 0
	ldr	r3, .L40
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L33
	.loc 2 223 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, .L40
	str	r2, [r3]
	b	.L34
.L33:
.LBB2:
	.loc 2 227 0
	ldr	r3, .L40
	ldr	r3, [r3]
	str	r3, [r7, #12]
	b	.L35
.L38:
	.loc 2 229 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L36
	.loc 2 231 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 2 232 0
	b	.L37
.L36:
	.loc 2 227 0 discriminator 2
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L35:
	.loc 2 227 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L38
.L37:
.LBE2:
	.loc 2 235 0 is_stmt 1
	ldr	r3, [r7, #4]
	movs	r2, #0
	str	r2, [r3]
.L34:
	.loc 2 237 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 238 0
	ldr	r3, [r7, #4]
	.loc 2 239 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L41:
	.align	2
.L40:
	.word	caribou_state
.LFE42:
	.size	remove_thread_node, .-remove_thread_node
	.section	.text.find_child_thread_node,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	find_child_thread_node, %function
find_child_thread_node:
.LFB43:
	.loc 2 243 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI26:
	sub	sp, sp, #20
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	str	r0, [r7, #4]
	.loc 2 244 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 245 0
	ldr	r3, .L47
	ldr	r4, [r3]
	.loc 2 246 0
	b	.L43
.L46:
	.loc 2 248 0
	ldr	r2, [r4, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L44
	.loc 2 250 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 251 0
	movs	r3, r4
	b	.L45
.L44:
	.loc 2 253 0
	ldr	r4, [r4]
.L43:
	.loc 2 246 0
	cmp	r4, #0
	bne	.L46
	.loc 2 255 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 256 0
	movs	r3, r4
.L45:
	.loc 2 257 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r7, pc}
.L48:
	.align	2
.L47:
	.word	caribou_state
.LFE43:
	.size	find_child_thread_node, .-find_child_thread_node
	.section	.text.caribou_thread_lock,"ax",%progbits
	.align	2
	.global	caribou_thread_lock
	.code	16
	.thumb_func
	.type	caribou_thread_lock, %function
caribou_thread_lock:
.LFB44:
	.loc 2 266 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	sub	sp, sp, #8
.LCFI30:
	add	r7, sp, #0
.LCFI31:
	.loc 2 267 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 2 268 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7]
	.loc 2 269 0
	ldr	r3, .L52
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L50
	.loc 2 271 0
	ldr	r3, .L52
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	str	r3, [r7, #4]
	.loc 2 272 0
	ldr	r3, .L52
	ldr	r3, [r3, #4]
	movs	r1, #48
	ldrsh	r2, [r3, r1]
	uxth	r2, r2
	adds	r2, r2, #1
	uxth	r2, r2
	sxth	r2, r2
	strh	r2, [r3, #48]
.L50:
	.loc 2 274 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 275 0
	ldr	r3, [r7, #4]
	.loc 2 276 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L53:
	.align	2
.L52:
	.word	caribou_state
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
	.loc 2 283 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI32:
	sub	sp, sp, #8
.LCFI33:
	add	r7, sp, #0
.LCFI34:
	.loc 2 284 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 2 285 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7]
	.loc 2 286 0
	ldr	r3, .L60
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L55
	.loc 2 288 0
	ldr	r3, .L60
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	ble	.L56
	.loc 2 290 0
	ldr	r3, .L60
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	str	r3, [r7, #4]
	.loc 2 291 0
	ldr	r3, .L60
	ldr	r3, [r3, #4]
	movs	r1, #48
	ldrsh	r2, [r3, r1]
	uxth	r2, r2
	subs	r2, r2, #1
	uxth	r2, r2
	sxth	r2, r2
	strh	r2, [r3, #48]
.L56:
	.loc 2 293 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 294 0
	ldr	r3, .L60
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L58
	.loc 2 295 0
	bl	caribou_thread_yield
	b	.L58
.L55:
	.loc 2 299 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	chip_interrupts_set
.L58:
	.loc 2 301 0
	ldr	r3, [r7, #4]
	.loc 2 302 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L61:
	.align	2
.L60:
	.word	caribou_state
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
	.loc 2 309 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI35:
	sub	sp, sp, #16
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	str	r0, [r7, #4]
	.loc 2 310 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 2 311 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L63
.LBB3:
	.loc 2 313 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 2 314 0
	ldr	r3, [r7, #4]
	movs	r2, #48
	ldrsh	r2, [r3, r2]
	movs	r3, #15
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 2 315 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
.L63:
.LBE3:
	.loc 2 317 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 2 318 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE46:
	.size	caribou_thread_locked, .-caribou_thread_locked
	.section	.text.caribou_thread_sleep,"ax",%progbits
	.align	2
	.global	caribou_thread_sleep
	.code	16
	.thumb_func
	.type	caribou_thread_sleep, %function
caribou_thread_sleep:
.LFB47:
	.loc 2 327 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI38:
	sub	sp, sp, #28
.LCFI39:
	add	r7, sp, #0
.LCFI40:
	str	r0, [r7, #12]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 2 328 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #16]
	str	r4, [r7, #20]
	.loc 2 329 0
	bl	caribou_thread_lock
	.loc 2 330 0
	ldr	r3, [r7, #12]
	movs	r2, #64
	ldrsh	r3, [r3, r2]
	uxth	r3, r3
	adds	r3, r3, #1
	uxth	r3, r3
	sxth	r1, r3
	ldr	r3, [r7, #12]
	movs	r2, #64
	strh	r1, [r3, r2]
	.loc 2 331 0
	bl	caribou_thread_unlock
	.loc 2 332 0
	b	.L66
.L69:
	.loc 2 334 0
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	ldr	r0, [r7, #16]
	ldr	r1, [r7, #20]
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L67
	.loc 2 336 0
	bl	caribou_thread_lock
	.loc 2 337 0
	ldr	r3, [r7, #12]
	movs	r2, #64
	ldrsh	r3, [r3, r2]
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r3, r3
	sxth	r1, r3
	ldr	r3, [r7, #12]
	movs	r2, #64
	strh	r1, [r3, r2]
	.loc 2 338 0
	bl	caribou_thread_unlock
	.loc 2 339 0
	b	.L68
.L67:
	.loc 2 341 0
	bl	caribou_thread_yield
.L66:
	.loc 2 332 0
	ldr	r3, [r7, #12]
	movs	r2, #64
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bgt	.L69
.L68:
	.loc 2 343 0
	nop
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
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
	.loc 2 352 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI41:
	sub	sp, sp, #12
.LCFI42:
	add	r7, sp, #0
.LCFI43:
	str	r0, [r7]
	str	r1, [r7, #4]
	.loc 2 353 0
	bl	caribou_thread_current
	movs	r1, r0
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	movs	r2, r3
	movs	r3, r4
	movs	r0, r1
	bl	caribou_thread_sleep
	.loc 2 354 0
	nop
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
.LFE48:
	.size	caribou_thread_sleep_current, .-caribou_thread_sleep_current
	.section	.text.caribou_thread_wakeup,"ax",%progbits
	.align	2
	.global	caribou_thread_wakeup
	.code	16
	.thumb_func
	.type	caribou_thread_wakeup, %function
caribou_thread_wakeup:
.LFB49:
	.loc 2 359 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI44:
	sub	sp, sp, #8
.LCFI45:
	add	r7, sp, #0
.LCFI46:
	str	r0, [r7, #4]
	.loc 2 360 0
	bl	caribou_thread_lock
	.loc 2 361 0
	ldr	r3, [r7, #4]
	movs	r2, #64
	ldrsh	r3, [r3, r2]
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r3, r3
	sxth	r1, r3
	ldr	r3, [r7, #4]
	movs	r2, #64
	strh	r1, [r3, r2]
	.loc 2 362 0
	bl	caribou_thread_unlock
	.loc 2 363 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 367 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI47:
	sub	sp, sp, #8
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 368 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3, #32]
	.loc 2 369 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	.loc 2 370 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE50:
	.size	caribou_thread_set_name, .-caribou_thread_set_name
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC8:
	.ascii	"\000"
	.section	.text.caribou_thread_name,"ax",%progbits
	.align	2
	.global	caribou_thread_name
	.code	16
	.thumb_func
	.type	caribou_thread_name, %function
caribou_thread_name:
.LFB51:
	.loc 2 374 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI50:
	sub	sp, sp, #8
.LCFI51:
	add	r7, sp, #0
.LCFI52:
	str	r0, [r7, #4]
	.loc 2 375 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L75
	.loc 2 375 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #32]
	b	.L77
.L75:
	.loc 2 375 0 discriminator 2
	ldr	r3, .L78
.L77:
	.loc 2 376 0 is_stmt 1 discriminator 5
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L79:
	.align	2
.L78:
	.word	.LC8
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
	.loc 2 380 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI53:
	sub	sp, sp, #12
.LCFI54:
	add	r7, sp, #0
.LCFI55:
	str	r0, [r7, #4]
	.loc 2 381 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L81
	.loc 2 381 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r4, [r3, #44]
	ldr	r3, [r3, #40]
	b	.L83
.L81:
	.loc 2 381 0 discriminator 2
	movs	r3, #0
	movs	r4, #0
.L83:
	.loc 2 382 0 is_stmt 1 discriminator 5
	movs	r0, r3
	movs	r1, r4
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
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
	.loc 2 386 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI56:
	sub	sp, sp, #8
.LCFI57:
	add	r7, sp, #0
.LCFI58:
	str	r0, [r7, #4]
	.loc 2 387 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L85
	.loc 2 387 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	subs	r3, r2, r3
	b	.L87
.L85:
	.loc 2 387 0 discriminator 2
	movs	r3, #0
.L87:
	.loc 2 388 0 is_stmt 1 discriminator 5
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 392 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI59:
	sub	sp, sp, #8
.LCFI60:
	add	r7, sp, #0
.LCFI61:
	str	r0, [r7, #4]
	.loc 2 393 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	subs	r3, r2, r3
	.loc 2 394 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 398 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI62:
	sub	sp, sp, #8
.LCFI63:
	add	r7, sp, #0
.LCFI64:
	str	r0, [r7, #4]
	.loc 2 399 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L91
	.loc 2 399 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	b	.L92
.L91:
	.loc 2 399 0 discriminator 2
	movs	r3, #0
.L92:
	.loc 2 400 0 is_stmt 1 discriminator 4
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 404 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI65:
	sub	sp, sp, #8
.LCFI66:
	add	r7, sp, #0
.LCFI67:
	str	r0, [r7, #4]
	.loc 2 405 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L95
	.loc 2 405 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	b	.L97
.L95:
	.loc 2 405 0 discriminator 2
	movs	r3, #0
.L97:
	.loc 2 406 0 is_stmt 1 discriminator 5
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 412 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI68:
	add	r7, sp, #0
.LCFI69:
	.loc 2 413 0
	bl	chip_wfi
	.loc 2 414 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 421 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI70:
	add	r7, sp, #0
.LCFI71:
	.loc 2 422 0
	ldr	r3, .L102
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L101
	.loc 2 422 0 is_stmt 0 discriminator 1
	ldr	r3, .L102
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L101
.LBB4:
	.loc 2 423 0 is_stmt 1
	bl	caribou_preempt
.L101:
.LBE4:
	.loc 2 424 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L103:
	.align	2
.L102:
	.word	caribou_state
.LFE58:
	.size	caribou_thread_yield, .-caribou_thread_yield
	.section	.text.caribou_thread_terminate,"ax",%progbits
	.align	2
	.global	caribou_thread_terminate
	.code	16
	.thumb_func
	.type	caribou_thread_terminate, %function
caribou_thread_terminate:
.LFB59:
	.loc 2 433 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI72:
	sub	sp, sp, #8
.LCFI73:
	add	r7, sp, #0
.LCFI74:
	str	r0, [r7, #4]
	.loc 2 435 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	movs	r2, #4
	orrs	r3, r2
	uxth	r2, r3
	ldr	r3, [r7, #4]
	strh	r2, [r3, #28]
	.loc 2 436 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L105
	.loc 2 438 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #52]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #36]
	movs	r0, r3
	blx	r2
.L105:
	.loc 2 441 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_timer_delete_all
	.loc 2 443 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	remove_thread_node
	.loc 2 444 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	delete_thread_node
	.loc 2 445 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE59:
	.size	caribou_thread_terminate, .-caribou_thread_terminate
	.section	.text.thread_finish,"ax",%progbits
	.align	2
	.global	thread_finish
	.code	16
	.thumb_func
	.type	thread_finish, %function
thread_finish:
.LFB60:
	.loc 2 451 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI75:
	add	r7, sp, #0
.LCFI76:
	.loc 2 452 0
	ldr	r3, .L108
	ldr	r2, [r3, #4]
	ldr	r3, .L108
	ldr	r3, [r3, #4]
	ldrh	r3, [r3, #28]
	movs	r1, #4
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #28]
.L107:
	.loc 2 456 0 discriminator 1
	bl	caribou_thread_yield
	.loc 2 457 0 discriminator 1
	b	.L107
.L109:
	.align	2
.L108:
	.word	caribou_state
.LFE60:
	.size	thread_finish, .-thread_finish
	.section	.text.caribou_thread_create,"ax",%progbits
	.align	2
	.global	caribou_thread_create
	.code	16
	.thumb_func
	.type	caribou_thread_create, %function
caribou_thread_create:
.LFB61:
	.loc 2 474 0
	@ args = 12, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI77:
	sub	sp, sp, #32
.LCFI78:
	add	r7, sp, #0
.LCFI79:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 2 475 0
	movs	r3, #0
	str	r3, [r7, #28]
	.loc 2 488 0
	ldr	r3, .L117
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L111
	.loc 2 488 0 is_stmt 0 discriminator 1
	ldr	r3, .L117
	ldr	r3, [r3]
	b	.L112
.L111:
	.loc 2 488 0 discriminator 2
	ldr	r3, .L117
	ldr	r3, [r3, #4]
.L112:
	.loc 2 488 0 discriminator 4
	movs	r0, r3
	bl	new_thread_node
	movs	r3, r0
	str	r3, [r7, #28]
	.loc 2 489 0 is_stmt 1 discriminator 4
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L113
	.loc 2 494 0
	ldr	r3, [r7, #40]
	cmp	r3, #0
	beq	.L114
.LBB5:
	.loc 2 499 0
	ldr	r2, [r7, #44]
	ldr	r3, [r7, #40]
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 2 500 0
	ldr	r3, [r7, #44]
	subs	r3, r3, #64
	ldr	r2, [r7, #40]
	adds	r3, r2, r3
	str	r3, [r7, #24]
	.loc 2 501 0
	ldr	r3, [r7, #24]
	movs	r2, #64
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 2 502 0
	ldr	r2, [r7]
	ldr	r3, [r7, #24]
	str	r2, [r3, #32]
	.loc 2 503 0
	ldr	r2, .L117+4
	ldr	r3, [r7, #24]
	str	r2, [r3, #52]
	.loc 2 504 0
	ldr	r3, [r7, #8]
	movs	r2, #1
	bics	r3, r2
	movs	r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #56]
	.loc 2 505 0
	ldr	r3, [r7, #24]
	movs	r2, #132
	lsls	r2, r2, #22
	str	r2, [r3, #60]
	.loc 2 509 0
	ldr	r3, [r7, #44]
	ldr	r2, [r7, #40]
	adds	r3, r2, r3
	str	r3, [r7, #20]
	.loc 2 510 0
	ldr	r3, [r7, #20]
	subs	r3, r3, #64
	movs	r2, r3
	ldr	r3, [r7, #28]
	str	r2, [r3, #8]
	.loc 2 511 0
	ldr	r3, [r7, #44]
	ldr	r2, [r7, #40]
	adds	r2, r2, r3
	ldr	r3, [r7, #28]
	str	r2, [r3, #20]
	.loc 2 512 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #40]
	str	r2, [r3, #16]
	.loc 2 513 0
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #16]
	adds	r3, r3, #64
	movs	r2, r3
	ldr	r3, [r7, #28]
	str	r2, [r3, #16]
	.loc 2 514 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #40]
	str	r2, [r3, #24]
.LBE5:
	b	.L115
.L114:
	.loc 2 518 0
	ldr	r3, [r7, #28]
	ldr	r2, .L117+8
	str	r2, [r3, #8]
	.loc 2 519 0
	ldr	r3, [r7, #28]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #28]
	str	r2, [r3, #20]
	.loc 2 520 0
	ldr	r3, [r7, #28]
	ldr	r2, .L117+12
	str	r2, [r3, #16]
	.loc 2 521 0
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #16]
	adds	r3, r3, #64
	movs	r2, r3
	ldr	r3, [r7, #28]
	str	r2, [r3, #16]
	.loc 2 522 0
	ldr	r3, [r7, #28]
	ldr	r2, .L117+12
	str	r2, [r3, #24]
.L115:
	.loc 2 524 0
	ldr	r3, [r7, #28]
	movs	r2, #0
	strh	r2, [r3, #28]
	.loc 2 525 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #12]
	str	r2, [r3, #32]
	.loc 2 526 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7]
	str	r2, [r3, #36]
	.loc 2 527 0
	ldr	r3, [r7, #28]
	movs	r2, #48
	adds	r2, r7, r2
	ldrh	r2, [r2]
	strh	r2, [r3, #30]
	.loc 2 528 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #4]
	str	r2, [r3, #52]
	.loc 2 529 0
	ldr	r3, [r7, #28]
	movs	r0, r3
	bl	append_thread_node
.L113:
	.loc 2 531 0
	ldr	r3, [r7, #28]
	.loc 2 532 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L118:
	.align	2
.L117:
	.word	caribou_state
	.word	thread_finish
	.word	__process_stack_end__
	.word	__process_stack_base__
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
	.loc 2 536 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI80:
	sub	sp, sp, #8
.LCFI81:
	add	r7, sp, #0
.LCFI82:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 537 0
	ldr	r3, .L120
	ldr	r2, [r7, #4]
	str	r2, [r3, #12]
	.loc 2 538 0
	ldr	r3, .L120
	ldr	r2, [r7]
	str	r2, [r3, #16]
	.loc 2 539 0
	ldr	r3, .L120
	movs	r2, #0
	strh	r2, [r3, #20]
	.loc 2 540 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L121:
	.align	2
.L120:
	.word	caribou_state
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
	.loc 2 546 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI83:
	add	r7, sp, #0
.LCFI84:
	.loc 2 547 0
	ldr	r3, .L124
	ldr	r3, [r3]
	.loc 2 548 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L125:
	.align	2
.L124:
	.word	caribou_state
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
	.loc 2 554 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI85:
	add	r7, sp, #0
.LCFI86:
	.loc 2 555 0
	ldr	r3, .L128
	ldr	r3, [r3, #4]
	.loc 2 556 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L129:
	.align	2
.L128:
	.word	caribou_state
.LFE64:
	.size	caribou_thread_current, .-caribou_thread_current
	.section	.text.caribou_thread_first,"ax",%progbits
	.align	2
	.global	caribou_thread_first
	.code	16
	.thumb_func
	.type	caribou_thread_first, %function
caribou_thread_first:
.LFB65:
	.loc 2 562 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI87:
	add	r7, sp, #0
.LCFI88:
	.loc 2 563 0
	ldr	r3, .L132
	ldr	r3, [r3]
	.loc 2 564 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L133:
	.align	2
.L132:
	.word	caribou_state
.LFE65:
	.size	caribou_thread_first, .-caribou_thread_first
	.section	.text.caribou_thread_current_arg,"ax",%progbits
	.align	2
	.global	caribou_thread_current_arg
	.code	16
	.thumb_func
	.type	caribou_thread_current_arg, %function
caribou_thread_current_arg:
.LFB66:
	.loc 2 568 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI89:
	add	r7, sp, #0
.LCFI90:
	.loc 2 569 0
	ldr	r3, .L136
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #36]
	.loc 2 570 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L137:
	.align	2
.L136:
	.word	caribou_state
.LFE66:
	.size	caribou_thread_current_arg, .-caribou_thread_current_arg
	.section	.text.caribou_thread_set_priority,"ax",%progbits
	.align	2
	.global	caribou_thread_set_priority
	.code	16
	.thumb_func
	.type	caribou_thread_set_priority, %function
caribou_thread_set_priority:
.LFB67:
	.loc 2 581 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI91:
	sub	sp, sp, #16
.LCFI92:
	add	r7, sp, #0
.LCFI93:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 2 582 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 583 0
	ldr	r3, [r7, #4]
	adds	r2, r7, #2
	ldrh	r2, [r2]
	strh	r2, [r3, #30]
	.loc 2 584 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 2 585 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE67:
	.size	caribou_thread_set_priority, .-caribou_thread_set_priority
	.section	.text.caribou_thread_priority,"ax",%progbits
	.align	2
	.global	caribou_thread_priority
	.code	16
	.thumb_func
	.type	caribou_thread_priority, %function
caribou_thread_priority:
.LFB68:
	.loc 2 591 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI94:
	sub	sp, sp, #8
.LCFI95:
	add	r7, sp, #0
.LCFI96:
	str	r0, [r7, #4]
	.loc 2 592 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L140
	.loc 2 592 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	movs	r2, #30
	ldrsh	r3, [r3, r2]
	b	.L141
.L140:
	.loc 2 592 0 discriminator 2
	movs	r3, #0
.L141:
	.loc 2 593 0 is_stmt 1 discriminator 4
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE68:
	.size	caribou_thread_priority, .-caribou_thread_priority
	.section	.rodata.str1.4
	.align	2
.LC22:
	.ascii	"CARIBOU\000"
	.section	.text.caribou_thread_init,"ax",%progbits
	.align	2
	.global	caribou_thread_init
	.code	16
	.thumb_func
	.type	caribou_thread_init, %function
caribou_thread_init:
.LFB69:
	.loc 2 600 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI97:
	sub	sp, sp, #24
.LCFI98:
	add	r7, sp, #16
.LCFI99:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 2 602 0
	ldr	r3, .L145
	movs	r2, #40
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 2 603 0
	ldr	r0, .L145+4
	adds	r3, r7, #6
	movs	r2, #0
	ldrsh	r3, [r3, r2]
	str	r3, [sp, #8]
	movs	r3, #0
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #0
	movs	r2, #0
	movs	r1, #0
	bl	caribou_thread_create
	movs	r2, r0
	ldr	r3, .L145
	str	r2, [r3, #4]
	.loc 2 604 0
	ldr	r3, .L145
	ldr	r3, [r3, #4]
	.loc 2 605 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L146:
	.align	2
.L145:
	.word	caribou_state
	.word	.LC22
.LFE69:
	.size	caribou_thread_init, .-caribou_thread_init
	.section	.text.caribou_thread_schedule,"ax",%progbits
	.align	2
	.global	caribou_thread_schedule
	.code	16
	.thumb_func
	.type	caribou_thread_schedule, %function
caribou_thread_schedule:
.LFB70:
	.loc 2 617 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI100:
	sub	sp, sp, #16
.LCFI101:
	add	r7, sp, #0
.LCFI102:
	str	r0, [r7, #4]
	.loc 2 618 0
	ldr	r3, .L151
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L150
.LBB6:
	.loc 2 620 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 2 621 0
	ldr	r3, .L151
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	str	r3, [r7, #8]
	.loc 2 622 0
	ldr	r3, .L151
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L149
	.loc 2 622 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	beq	.L149
	.loc 2 624 0 is_stmt 1
	ldr	r3, .L151
	movs	r2, #0
	strh	r2, [r3, #8]
	.loc 2 625 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	remove_thread_node
	.loc 2 626 0
	ldr	r3, .L151
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	insert_thread_node
	.loc 2 629 0
	ldr	r3, .L151+4
	ldr	r2, .L151+4
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #19
	orrs	r2, r1
	str	r2, [r3, #4]
.L149:
	.loc 2 632 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
.L150:
.LBE6:
	.loc 2 634 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L152:
	.align	2
.L151:
	.word	caribou_state
	.word	-536810240
.LFE70:
	.size	caribou_thread_schedule, .-caribou_thread_schedule
	.section	.text.main_idle,"ax",%progbits
	.align	2
	.weak	main_idle
	.code	16
	.thumb_func
	.type	main_idle, %function
main_idle:
.LFB71:
	.loc 2 643 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI103:
	add	r7, sp, #0
.LCFI104:
	.loc 2 644 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 2 653 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI105:
	add	r7, sp, #0
.LCFI106:
	.loc 2 654 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE72:
	.size	board_idle, .-board_idle
	.section	.text.check_sp,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	check_sp, %function
check_sp:
.LFB73:
	.loc 2 657 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI107:
	sub	sp, sp, #8
.LCFI108:
	add	r7, sp, #0
.LCFI109:
	str	r0, [r7, #4]
	.loc 2 675 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bcc	.L156
	.loc 2 675 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L158
.L156:
	.loc 2 677 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	str	r2, [r3, #12]
.L158:
	.loc 2 679 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE73:
	.size	check_sp, .-check_sp
	.section	.text.caribou_thread_once,"ax",%progbits
	.align	2
	.global	caribou_thread_once
	.code	16
	.thumb_func
	.type	caribou_thread_once, %function
caribou_thread_once:
.LFB74:
	.loc 2 682 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI110:
	sub	sp, sp, #8
.LCFI111:
	add	r7, sp, #0
.LCFI112:
	.loc 2 683 0
	ldr	r3, .L163
	ldr	r3, [r3]
	str	r3, [r7, #4]
	.loc 2 687 0
	bl	board_idle
	.loc 2 689 0
	ldr	r3, .L163
	ldr	r3, [r3]
	movs	r0, r3
	bl	caribou_timer_idle
	.loc 2 691 0
	ldr	r3, .L163
	ldr	r3, [r3]
	str	r3, [r7, #4]
	b	.L160
.L162:
	.loc 2 693 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7]
	.loc 2 694 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	check_sp
	.loc 2 695 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #28]
	movs	r2, r3
	movs	r3, #4
	ands	r3, r2
	beq	.L161
	.loc 2 695 0 is_stmt 0 discriminator 1
	ldr	r3, .L163
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L161
	.loc 2 697 0 is_stmt 1
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_thread_terminate
.L161:
	.loc 2 691 0 discriminator 2
	ldr	r3, [r7]
	str	r3, [r7, #4]
.L160:
	.loc 2 691 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L162
	.loc 2 700 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L164:
	.align	2
.L163:
	.word	caribou_state
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
	.loc 2 708 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI113:
	add	r7, sp, #0
.LCFI114:
.L166:
	.loc 2 711 0 discriminator 1
	bl	caribou_thread_once
	.loc 2 712 0 discriminator 1
	bl	caribou_thread_yield
	.loc 2 713 0 discriminator 1
	b	.L166
.LFE75:
	.size	caribou_thread_exec, .-caribou_thread_exec
	.section	.text._swap_thread,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_swap_thread, %function
_swap_thread:
.LFB76:
	.loc 2 721 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI115:
	add	r7, sp, #0
.LCFI116:
	.loc 2 723 0
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	ldr	r2, .L174+4
	ldr	r2, [r2]
	str	r2, [r3, #60]
	.loc 2 724 0
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	movs	r2, #48
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L173
	.loc 2 724 0 is_stmt 0 discriminator 1
	ldr	r3, .L174
	movs	r2, #8
	ldrsh	r3, [r3, r2]
	uxth	r3, r3
	subs	r3, r3, #1
	uxth	r3, r3
	sxth	r2, r3
	ldr	r3, .L174
	strh	r2, [r3, #8]
	ldr	r3, .L174
	movs	r2, #8
	ldrsh	r3, [r3, r2]
	cmp	r3, #0
	bge	.L173
	.loc 2 726 0 is_stmt 1
	b	.L169
.L172:
	.loc 2 728 0
	ldr	r3, .L174
	ldr	r2, [r3, #4]
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	ldrh	r3, [r3, #28]
	movs	r1, #2
	bics	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #28]
.L169:
	.loc 2 726 0
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L170
	.loc 2 726 0 is_stmt 0 discriminator 1
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	b	.L171
.L170:
	.loc 2 726 0 discriminator 2
	ldr	r3, .L174
	ldr	r2, [r3]
.L171:
	.loc 2 726 0 discriminator 4
	ldr	r3, .L174
	str	r2, [r3, #4]
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	ldrh	r3, [r3, #28]
	movs	r2, r3
	movs	r3, #6
	ands	r3, r2
	bne	.L172
	.loc 2 730 0 is_stmt 1
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	movs	r2, #30
	ldrsh	r2, [r3, r2]
	ldr	r3, .L174
	strh	r2, [r3, #8]
	.loc 2 732 0
	ldr	r3, .L174
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #60]
	ldr	r3, .L174+4
	str	r2, [r3]
.L173:
	.loc 2 734 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L175:
	.align	2
.L174:
	.word	caribou_state
	.word	__errno
.LFE76:
	.size	_swap_thread, .-_swap_thread
	.section	.text._pendsv,"ax",%progbits
	.align	2
	.global	_pendsv
	.code	16
	.thumb_func
	.type	_pendsv, %function
_pendsv:
.LFB77:
	.loc 2 778 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 779 0
	.syntax divided
@ 779 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
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
	.thumb
	.syntax unified
	ldr	r3, .L178
	ldr	r2, .L178
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #18
	orrs	r2, r1
	str	r2, [r3, #4]
	ldr	r3, .L178
	ldr	r2, .L178
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #20
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 2 780 0
	ldr	r3, .L178+4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L177
	.loc 2 782 0
	ldr	r3, .L178+4
	ldr	r4, [r3, #4]
	bl	rd_thread_stack_ptr
	movs	r3, r0
	str	r3, [r4, #8]
	.loc 2 783 0
	ldr	r3, .L178+4
	ldr	r3, [r3, #4]
	movs	r0, r3
	bl	check_sp
	.loc 2 784 0
	ldr	r3, .L178+4
	ldr	r2, [r3, #4]
	ldr	r3, .L178+4
	ldr	r3, [r3, #4]
	ldrh	r3, [r3, #28]
	movs	r1, #2
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #28]
	.loc 2 786 0
	ldr	r3, .L178+4
	movs	r2, #1
	rsbs	r2, r2, #0
	strh	r2, [r3, #8]
	.loc 2 790 0
	bl	_swap_thread
	.loc 2 794 0
	ldr	r3, .L178+4
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #8]
	.syntax divided
@ 794 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
	 msr psp, r3
	
@ 0 "" 2
	.thumb
	.syntax unified
.L177:
	.loc 2 796 0
	.syntax divided
@ 796 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
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
	.loc 2 797 0
	.thumb
	.syntax unified
	nop
.L179:
	.align	2
.L178:
	.word	-536810240
	.word	caribou_state
.LFE77:
	.size	_pendsv, .-_pendsv
	.section	.text._systick,"ax",%progbits
	.align	2
	.global	_systick
	.code	16
	.thumb_func
	.type	_systick, %function
_systick:
.LFB78:
	.loc 2 807 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 808 0
	.syntax divided
@ 808 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
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
	.thumb
	.syntax unified
	ldr	r3, .L184
	ldr	r2, .L184
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #18
	orrs	r2, r1
	str	r2, [r3, #4]
	ldr	r3, .L184
	ldr	r2, .L184
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #18
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 2 809 0
	ldr	r3, .L184+4
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L181
	.loc 2 811 0
	ldr	r3, .L184+4
	ldr	r4, [r3, #4]
	bl	rd_thread_stack_ptr
	movs	r3, r0
	str	r3, [r4, #8]
	.loc 2 812 0
	ldr	r3, .L184+4
	ldr	r3, [r3, #4]
	movs	r0, r3
	bl	check_sp
	.loc 2 813 0
	ldr	r3, .L184+4
	ldr	r4, [r3, #28]
	ldr	r3, [r3, #24]
	movs	r1, #1
	movs	r2, #0
	adds	r3, r3, r1
	adcs	r4, r4, r2
	ldr	r2, .L184+4
	str	r3, [r2, #24]
	str	r4, [r2, #28]
	.loc 2 814 0
	ldr	r3, .L184+4
	ldr	r0, [r3, #4]
	ldr	r3, [r0, #40]
	ldr	r4, [r0, #44]
	movs	r1, #1
	movs	r2, #0
	adds	r3, r3, r1
	adcs	r4, r4, r2
	str	r3, [r0, #40]
	str	r4, [r0, #44]
	.loc 2 818 0
	bl	_swap_thread
	.loc 2 822 0
	ldr	r3, .L184+4
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #8]
	.syntax divided
@ 822 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
	 msr psp, r3
	
@ 0 "" 2
	.loc 2 823 0
@ 823 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
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
	.loc 2 830 0
	.thumb
	.syntax unified
	b	.L183
.L181:
	.loc 2 827 0
	ldr	r3, .L184+4
	ldr	r4, [r3, #28]
	ldr	r3, [r3, #24]
	movs	r1, #1
	movs	r2, #0
	adds	r3, r3, r1
	adcs	r4, r4, r2
	ldr	r2, .L184+4
	str	r3, [r2, #24]
	str	r4, [r2, #28]
	.loc 2 828 0
	.syntax divided
@ 828 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/thread.c" 1
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
	.thumb
	.syntax unified
.L183:
	.loc 2 830 0
	nop
.L185:
	.align	2
.L184:
	.word	-536810240
	.word	caribou_state
.LFE78:
	.size	_systick, .-_systick
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI6-.LFB36
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI9-.LFB37
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x28
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
	.uleb128 0x18
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x10
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
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI50-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
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
	.4byte	.LCFI53-.LFB52
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
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
	.4byte	.LCFI56-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
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
	.4byte	.LCFI59-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LCFI70-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI71-.LCFI70
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
	.4byte	.LCFI72-.LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI74-.LCFI73
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
	.4byte	.LCFI75-.LFB60
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI77-.LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.byte	0x4
	.4byte	.LCFI80-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI81-.LCFI80
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.byte	0x4
	.4byte	.LCFI83-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI84-.LCFI83
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.byte	0x4
	.4byte	.LCFI85-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI86-.LCFI85
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE64:
.LSFDE66:
	.4byte	.LEFDE66-.LASFDE66
.LASFDE66:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI87-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE66:
.LSFDE68:
	.4byte	.LEFDE68-.LASFDE68
.LASFDE68:
	.4byte	.Lframe0
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.byte	0x4
	.4byte	.LCFI89-.LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI90-.LCFI89
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE68:
.LSFDE70:
	.4byte	.LEFDE70-.LASFDE70
.LASFDE70:
	.4byte	.Lframe0
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.byte	0x4
	.4byte	.LCFI91-.LFB67
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI93-.LCFI92
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE70:
.LSFDE72:
	.4byte	.LEFDE72-.LASFDE72
.LASFDE72:
	.4byte	.Lframe0
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.byte	0x4
	.4byte	.LCFI94-.LFB68
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI96-.LCFI95
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE72:
.LSFDE74:
	.4byte	.LEFDE74-.LASFDE74
.LASFDE74:
	.4byte	.Lframe0
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.byte	0x4
	.4byte	.LCFI97-.LFB69
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI98-.LCFI97
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI99-.LCFI98
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x10
	.align	2
.LEFDE74:
.LSFDE76:
	.4byte	.LEFDE76-.LASFDE76
.LASFDE76:
	.4byte	.Lframe0
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.byte	0x4
	.4byte	.LCFI100-.LFB70
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI101-.LCFI100
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI102-.LCFI101
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE76:
.LSFDE78:
	.4byte	.LEFDE78-.LASFDE78
.LASFDE78:
	.4byte	.Lframe0
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.byte	0x4
	.4byte	.LCFI103-.LFB71
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI104-.LCFI103
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE78:
.LSFDE80:
	.4byte	.LEFDE80-.LASFDE80
.LASFDE80:
	.4byte	.Lframe0
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.byte	0x4
	.4byte	.LCFI105-.LFB72
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI106-.LCFI105
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE80:
.LSFDE82:
	.4byte	.LEFDE82-.LASFDE82
.LASFDE82:
	.4byte	.Lframe0
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.byte	0x4
	.4byte	.LCFI107-.LFB73
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI108-.LCFI107
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI109-.LCFI108
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE82:
.LSFDE84:
	.4byte	.LEFDE84-.LASFDE84
.LASFDE84:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.byte	0x4
	.4byte	.LCFI110-.LFB74
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI111-.LCFI110
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI112-.LCFI111
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE84:
.LSFDE86:
	.4byte	.LEFDE86-.LASFDE86
.LASFDE86:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.byte	0x4
	.4byte	.LCFI113-.LFB75
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI114-.LCFI113
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE86:
.LSFDE88:
	.4byte	.LEFDE88-.LASFDE88
.LASFDE88:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.byte	0x4
	.4byte	.LCFI115-.LFB76
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI116-.LCFI115
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE88:
.LSFDE90:
	.4byte	.LEFDE90-.LASFDE90
.LASFDE90:
	.4byte	.Lframe0
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.align	2
.LEFDE90:
.LSFDE92:
	.4byte	.LEFDE92-.LASFDE92
.LASFDE92:
	.4byte	.Lframe0
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.align	2
.LEFDE92:
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 4 "../../../chip/stm32/stm32f091/lib/CMSIS/Include/core_cm0.h"
	.file 5 "../../../../include/caribou/kernel/timer.h"
	.file 6 "../../../../include/caribou/lib/errno.h"
	.file 7 "../../../../include/caribou/kernel/thread.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xd31
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0xc
	.4byte	.LASF124
	.4byte	.LASF125
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
	.uleb128 0x8
	.4byte	0x69
	.uleb128 0x9
	.byte	0x28
	.byte	0x4
	.2byte	0x124
	.4byte	0x145
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x126
	.4byte	0x145
	.byte	0
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x127
	.4byte	0xc1
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x128
	.4byte	0x69
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x129
	.4byte	0xc1
	.byte	0xc
	.uleb128 0xb
	.ascii	"SCR\000"
	.byte	0x4
	.2byte	0x12a
	.4byte	0xc1
	.byte	0x10
	.uleb128 0xb
	.ascii	"CCR\000"
	.byte	0x4
	.2byte	0x12b
	.4byte	0xc1
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x12c
	.4byte	0x69
	.byte	0x18
	.uleb128 0xb
	.ascii	"SHP\000"
	.byte	0x4
	.2byte	0x12d
	.4byte	0x15a
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x12e
	.4byte	0xc1
	.byte	0x24
	.byte	0
	.uleb128 0x7
	.4byte	0xc1
	.uleb128 0xc
	.4byte	0xc1
	.4byte	0x15a
	.uleb128 0xd
	.4byte	0xba
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.4byte	0x14a
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x12f
	.4byte	0xc6
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x5
	.byte	0x2f
	.4byte	0x176
	.uleb128 0xf
	.4byte	0x9f
	.4byte	0x18f
	.uleb128 0x10
	.4byte	0x9f
	.uleb128 0x10
	.4byte	0x18f
	.uleb128 0x10
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x195
	.uleb128 0x11
	.4byte	.LASF33
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x1c
	.byte	0x5
	.byte	0x38
	.4byte	0x1fb
	.uleb128 0x13
	.4byte	.LASF24
	.byte	0x5
	.byte	0x3b
	.4byte	0x1fb
	.byte	0
	.uleb128 0x13
	.4byte	.LASF25
	.byte	0x5
	.byte	0x3d
	.4byte	0x1fb
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF26
	.byte	0x5
	.byte	0x3f
	.4byte	0x201
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF27
	.byte	0x5
	.byte	0x41
	.4byte	0x9f
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x5
	.byte	0x43
	.4byte	0x69
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF29
	.byte	0x5
	.byte	0x45
	.4byte	0x69
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF30
	.byte	0x5
	.byte	0x47
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x19a
	.uleb128 0x6
	.byte	0x4
	.4byte	0x16b
	.uleb128 0x3
	.4byte	.LASF31
	.byte	0x5
	.byte	0x48
	.4byte	0x19a
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x108
	.4byte	0x62
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x48
	.byte	0x7
	.byte	0x1f
	.4byte	0x2f6
	.uleb128 0x13
	.4byte	.LASF25
	.byte	0x7
	.byte	0x22
	.4byte	0x2f6
	.byte	0
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x7
	.byte	0x25
	.4byte	0x2f6
	.byte	0x4
	.uleb128 0x14
	.ascii	"sp\000"
	.byte	0x7
	.byte	0x28
	.4byte	0x9f
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF36
	.byte	0x7
	.byte	0x2b
	.4byte	0x9f
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF37
	.byte	0x7
	.byte	0x2e
	.4byte	0x9f
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x7
	.byte	0x31
	.4byte	0x9f
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x7
	.byte	0x34
	.4byte	0x9f
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x7
	.byte	0x37
	.4byte	0x50
	.byte	0x1c
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x7
	.byte	0x3a
	.4byte	0x3e
	.byte	0x1e
	.uleb128 0x13
	.4byte	.LASF42
	.byte	0x7
	.byte	0x3d
	.4byte	0xaf
	.byte	0x20
	.uleb128 0x14
	.ascii	"arg\000"
	.byte	0x7
	.byte	0x40
	.4byte	0x9f
	.byte	0x24
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x7
	.byte	0x43
	.4byte	0x8d
	.byte	0x28
	.uleb128 0x13
	.4byte	.LASF44
	.byte	0x7
	.byte	0x46
	.4byte	0x3e
	.byte	0x30
	.uleb128 0x13
	.4byte	.LASF45
	.byte	0x7
	.byte	0x49
	.4byte	0x307
	.byte	0x34
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x7
	.byte	0x4c
	.4byte	0x30d
	.byte	0x38
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x7
	.byte	0x4f
	.4byte	0x212
	.byte	0x3c
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x7
	.byte	0x52
	.4byte	0x3e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x21e
	.uleb128 0x15
	.4byte	0x307
	.uleb128 0x10
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2fc
	.uleb128 0x6
	.byte	0x4
	.4byte	0x207
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x7
	.byte	0x5f
	.4byte	0x21e
	.uleb128 0x16
	.byte	0x28
	.byte	0x7
	.byte	0x62
	.4byte	0x387
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x7
	.byte	0x65
	.4byte	0x387
	.byte	0
	.uleb128 0x13
	.4byte	.LASF51
	.byte	0x7
	.byte	0x67
	.4byte	0x387
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF52
	.byte	0x7
	.byte	0x69
	.4byte	0x3e
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF53
	.byte	0x7
	.byte	0x6b
	.4byte	0x3a1
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF54
	.byte	0x7
	.byte	0x6d
	.4byte	0x9f
	.byte	0x10
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x7
	.byte	0x6f
	.4byte	0x50
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF56
	.byte	0x7
	.byte	0x71
	.4byte	0x7b
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF57
	.byte	0x7
	.byte	0x73
	.4byte	0x7b
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x313
	.uleb128 0xf
	.4byte	0x9f
	.4byte	0x3a1
	.uleb128 0x10
	.4byte	0x62
	.uleb128 0x10
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x38d
	.uleb128 0x3
	.4byte	.LASF58
	.byte	0x7
	.byte	0x74
	.4byte	0x31e
	.uleb128 0x16
	.byte	0x20
	.byte	0x1
	.byte	0x18
	.4byte	0x415
	.uleb128 0x14
	.ascii	"r0\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x69
	.byte	0
	.uleb128 0x14
	.ascii	"r1\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x69
	.byte	0x4
	.uleb128 0x14
	.ascii	"r2\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x69
	.byte	0x8
	.uleb128 0x14
	.ascii	"r3\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x69
	.byte	0xc
	.uleb128 0x14
	.ascii	"r12\000"
	.byte	0x1
	.byte	0x1e
	.4byte	0x69
	.byte	0x10
	.uleb128 0x14
	.ascii	"lr\000"
	.byte	0x1
	.byte	0x1f
	.4byte	0x69
	.byte	0x14
	.uleb128 0x14
	.ascii	"pc\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x69
	.byte	0x18
	.uleb128 0x14
	.ascii	"psr\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x69
	.byte	0x1c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF59
	.byte	0x1
	.byte	0x22
	.4byte	0x3b2
	.uleb128 0x16
	.byte	0x20
	.byte	0x1
	.byte	0x25
	.4byte	0x483
	.uleb128 0x14
	.ascii	"r4\000"
	.byte	0x1
	.byte	0x27
	.4byte	0x69
	.byte	0
	.uleb128 0x14
	.ascii	"r5\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x69
	.byte	0x4
	.uleb128 0x14
	.ascii	"r6\000"
	.byte	0x1
	.byte	0x29
	.4byte	0x69
	.byte	0x8
	.uleb128 0x14
	.ascii	"r7\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x69
	.byte	0xc
	.uleb128 0x14
	.ascii	"r8\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x69
	.byte	0x10
	.uleb128 0x14
	.ascii	"r9\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x69
	.byte	0x14
	.uleb128 0x14
	.ascii	"r10\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x69
	.byte	0x18
	.uleb128 0x14
	.ascii	"r11\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x69
	.byte	0x1c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF60
	.byte	0x1
	.byte	0x2f
	.4byte	0x420
	.uleb128 0x16
	.byte	0x40
	.byte	0x1
	.byte	0x35
	.4byte	0x4af
	.uleb128 0x13
	.4byte	.LASF61
	.byte	0x1
	.byte	0x37
	.4byte	0x483
	.byte	0
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0x1
	.byte	0x38
	.4byte	0x415
	.byte	0x20
	.byte	0
	.uleb128 0x3
	.4byte	.LASF63
	.byte	0x1
	.byte	0x39
	.4byte	0x48e
	.uleb128 0x17
	.4byte	.LASF64
	.byte	0x1
	.byte	0x6e
	.4byte	0x9f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.byte	0x75
	.4byte	0x9f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x2
	.byte	0x52
	.4byte	0x50
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x50c
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0x54
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF67
	.byte	0x2
	.byte	0x5e
	.4byte	0x50
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x542
	.uleb128 0x1a
	.4byte	.LASF30
	.byte	0x2
	.byte	0x5e
	.4byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0x60
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF78
	.byte	0x2
	.byte	0x6a
	.4byte	0x50
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x56a
	.uleb128 0x1a
	.4byte	.LASF30
	.byte	0x2
	.byte	0x6a
	.4byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF94
	.byte	0x2
	.byte	0x87
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.4byte	.LASF68
	.byte	0x2
	.byte	0x9b
	.4byte	0x387
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b1
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x2
	.byte	0x9b
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF69
	.byte	0x2
	.byte	0x9d
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF114
	.byte	0x2
	.byte	0xad
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d5
	.uleb128 0x1a
	.4byte	.LASF69
	.byte	0x2
	.byte	0xad
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF70
	.byte	0x2
	.byte	0xb5
	.4byte	0x387
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x619
	.uleb128 0x1a
	.4byte	.LASF69
	.byte	0x2
	.byte	0xb5
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0xb7
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF71
	.byte	0x2
	.byte	0xb8
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF72
	.byte	0x2
	.byte	0xcd
	.4byte	0x387
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x66b
	.uleb128 0x1a
	.4byte	.LASF69
	.byte	0x2
	.byte	0xcd
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.4byte	.LASF73
	.byte	0x2
	.byte	0xcd
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0xcf
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.4byte	.LASF25
	.byte	0x2
	.byte	0xd0
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.4byte	.LASF74
	.byte	0x2
	.byte	0xda
	.4byte	0x387
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b9
	.uleb128 0x1a
	.4byte	.LASF69
	.byte	0x2
	.byte	0xda
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0xdc
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x19
	.4byte	.LASF75
	.byte	0x2
	.byte	0xe3
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF76
	.byte	0x2
	.byte	0xf2
	.4byte	0x387
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fc
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x2
	.byte	0xf2
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LASF40
	.byte	0x2
	.byte	0xf4
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.4byte	.LASF77
	.byte	0x2
	.byte	0xf5
	.4byte	0x387
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x109
	.4byte	0x62
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x734
	.uleb128 0x20
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x10b
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x10c
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x11a
	.4byte	0x62
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x76c
	.uleb128 0x20
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x11c
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x11d
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x134
	.4byte	0x62
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7bd
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x134
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x20
	.ascii	"rc\000"
	.byte	0x2
	.2byte	0x136
	.4byte	0xa8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x1e
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x21
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x139
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x146
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x801
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x146
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x22
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x146
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x21
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x148
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x15f
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x827
	.uleb128 0x22
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x15f
	.4byte	0x7b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x166
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x84d
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x166
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF87
	.byte	0x2
	.2byte	0x16e
	.4byte	0xaf
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x886
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x16e
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x22
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x16e
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x24
	.4byte	.LASF88
	.byte	0x2
	.2byte	0x175
	.4byte	0xaf
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8b0
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x175
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF89
	.byte	0x2
	.2byte	0x17b
	.4byte	0x8d
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8da
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x17b
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x24
	.4byte	.LASF90
	.byte	0x2
	.2byte	0x181
	.4byte	0x69
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x904
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x181
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x187
	.4byte	0x69
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x92e
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x187
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x18d
	.4byte	0x50
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x958
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x18d
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x193
	.4byte	0x387
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x982
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x193
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x25
	.4byte	.LASF95
	.byte	0x2
	.2byte	0x19b
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x1a4
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9c3
	.uleb128 0x1e
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x26
	.4byte	.LASF126
	.byte	0x2
	.2byte	0x1a7
	.4byte	0x62
	.uleb128 0x27
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	.LASF97
	.byte	0x2
	.2byte	0x1b0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9f5
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x1b0
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x28
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x1b2
	.4byte	0x30d
	.byte	0
	.uleb128 0x29
	.4byte	.LASF117
	.byte	0x2
	.2byte	0x1c2
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF98
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x387
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac2
	.uleb128 0x22
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x1d9
	.4byte	0xaf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2a
	.ascii	"run\000"
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x307
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.4byte	.LASF99
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x307
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x2a
	.ascii	"arg\000"
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x22
	.4byte	.LASF100
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x22
	.4byte	.LASF101
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x22
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x1d9
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x21
	.4byte	.LASF69
	.byte	0x2
	.2byte	0x1db
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.4byte	.LASF102
	.byte	0x2
	.2byte	0x1dc
	.4byte	0xac2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1e
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x21
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x1f0
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x4af
	.uleb128 0x2b
	.4byte	.LASF103
	.byte	0x2
	.2byte	0x217
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xafc
	.uleb128 0x2a
	.ascii	"fn\000"
	.byte	0x2
	.2byte	0x217
	.4byte	0x3a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2a
	.ascii	"arg\000"
	.byte	0x2
	.2byte	0x217
	.4byte	0x9f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF104
	.byte	0x2
	.2byte	0x221
	.4byte	0x387
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF105
	.byte	0x2
	.2byte	0x229
	.4byte	0x387
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF106
	.byte	0x2
	.2byte	0x231
	.4byte	0x387
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF107
	.byte	0x2
	.2byte	0x237
	.4byte	0x9f
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF108
	.byte	0x2
	.2byte	0x244
	.4byte	.LFB67
	.4byte	.LFE67-.LFB67
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb98
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x244
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x22
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x244
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.uleb128 0x21
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x246
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF109
	.byte	0x2
	.2byte	0x24e
	.4byte	0x3e
	.4byte	.LFB68
	.4byte	.LFE68-.LFB68
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbc2
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x24e
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF110
	.byte	0x2
	.2byte	0x257
	.4byte	0x387
	.4byte	.LFB69
	.4byte	.LFE69-.LFB69
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbec
	.uleb128 0x22
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x257
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x23
	.4byte	.LASF111
	.byte	0x2
	.2byte	0x268
	.4byte	.LFB70
	.4byte	.LFE70-.LFB70
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc3a
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x268
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x21
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x26c
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x26d
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF112
	.byte	0x2
	.2byte	0x282
	.4byte	.LFB71
	.4byte	.LFE71-.LFB71
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2d
	.4byte	.LASF113
	.byte	0x2
	.2byte	0x28c
	.4byte	.LFB72
	.4byte	.LFE72-.LFB72
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2e
	.4byte	.LASF115
	.byte	0x2
	.2byte	0x290
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc84
	.uleb128 0x22
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x290
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF127
	.byte	0x2
	.2byte	0x2a9
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcb9
	.uleb128 0x21
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x2ab
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x2ac
	.4byte	0x387
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x25
	.4byte	.LASF116
	.byte	0x2
	.2byte	0x2c3
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x30
	.4byte	.LASF128
	.byte	0x2
	.2byte	0x2d0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x29
	.4byte	.LASF118
	.byte	0x2
	.2byte	0x309
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x29
	.4byte	.LASF119
	.byte	0x2
	.2byte	0x326
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x31
	.4byte	.LASF47
	.byte	0x6
	.2byte	0x109
	.4byte	0x212
	.uleb128 0x32
	.4byte	.LASF120
	.byte	0x2
	.byte	0x1d
	.4byte	0x3a7
	.uleb128 0x5
	.byte	0x3
	.4byte	caribou_state
	.uleb128 0x33
	.4byte	.LASF121
	.byte	0x2
	.byte	0x3c
	.4byte	0x69
	.uleb128 0x33
	.4byte	.LASF122
	.byte	0x2
	.byte	0x3e
	.4byte	0x69
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
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
	.uleb128 0x18
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x48f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xd35
	.4byte	0x4ba
	.ascii	"rd_thread_stack_ptr\000"
	.4byte	0x4cf
	.ascii	"rd_stack_ptr\000"
	.4byte	0x4e4
	.ascii	"fault_clear\000"
	.4byte	0x50c
	.ascii	"fault_set\000"
	.4byte	0x542
	.ascii	"_caribou_thread_fault_emit\000"
	.4byte	0x56a
	.ascii	"caribou_thread_dump\000"
	.4byte	0x57b
	.ascii	"new_thread_node\000"
	.4byte	0x5b1
	.ascii	"delete_thread_node\000"
	.4byte	0x5d5
	.ascii	"append_thread_node\000"
	.4byte	0x619
	.ascii	"insert_thread_node\000"
	.4byte	0x66b
	.ascii	"remove_thread_node\000"
	.4byte	0x6b9
	.ascii	"find_child_thread_node\000"
	.4byte	0x6fc
	.ascii	"caribou_thread_lock\000"
	.4byte	0x734
	.ascii	"caribou_thread_unlock\000"
	.4byte	0x76c
	.ascii	"caribou_thread_locked\000"
	.4byte	0x7bd
	.ascii	"caribou_thread_sleep\000"
	.4byte	0x801
	.ascii	"caribou_thread_sleep_current\000"
	.4byte	0x827
	.ascii	"caribou_thread_wakeup\000"
	.4byte	0x84d
	.ascii	"caribou_thread_set_name\000"
	.4byte	0x886
	.ascii	"caribou_thread_name\000"
	.4byte	0x8b0
	.ascii	"caribou_thread_runtime\000"
	.4byte	0x8da
	.ascii	"caribou_thread_stacksize\000"
	.4byte	0x904
	.ascii	"caribou_thread_stackusage\000"
	.4byte	0x92e
	.ascii	"caribou_thread_state\000"
	.4byte	0x958
	.ascii	"caribou_thread_parent\000"
	.4byte	0x982
	.ascii	"caribou_thread_wfi\000"
	.4byte	0x994
	.ascii	"caribou_thread_yield\000"
	.4byte	0x9b3
	.ascii	"caribou_preempt\000"
	.4byte	0x9c3
	.ascii	"caribou_thread_terminate\000"
	.4byte	0x9f5
	.ascii	"thread_finish\000"
	.4byte	0xa07
	.ascii	"caribou_thread_create\000"
	.4byte	0xac8
	.ascii	"caribou_thread_fault_set\000"
	.4byte	0xafc
	.ascii	"caribou_thread_root\000"
	.4byte	0xb12
	.ascii	"caribou_thread_current\000"
	.4byte	0xb28
	.ascii	"caribou_thread_first\000"
	.4byte	0xb3e
	.ascii	"caribou_thread_current_arg\000"
	.4byte	0xb54
	.ascii	"caribou_thread_set_priority\000"
	.4byte	0xb98
	.ascii	"caribou_thread_priority\000"
	.4byte	0xbc2
	.ascii	"caribou_thread_init\000"
	.4byte	0xbec
	.ascii	"caribou_thread_schedule\000"
	.4byte	0xc3a
	.ascii	"main_idle\000"
	.4byte	0xc4c
	.ascii	"board_idle\000"
	.4byte	0xc5e
	.ascii	"check_sp\000"
	.4byte	0xc84
	.ascii	"caribou_thread_once\000"
	.4byte	0xcb9
	.ascii	"caribou_thread_exec\000"
	.4byte	0xccb
	.ascii	"_swap_thread\000"
	.4byte	0xcdd
	.ascii	"_pendsv\000"
	.4byte	0xcef
	.ascii	"_systick\000"
	.4byte	0xd0d
	.ascii	"caribou_state\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1e6
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xd35
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
	.4byte	0x15f
	.ascii	"SCB_Type\000"
	.4byte	0x16b
	.ascii	"caribou_timer_callback_fn\000"
	.4byte	0x19a
	.ascii	"_caribou_timer_t\000"
	.4byte	0x207
	.ascii	"caribou_timer_t\000"
	.4byte	0x212
	.ascii	"errno_t\000"
	.4byte	0x21e
	.ascii	"_caribou_thread_t\000"
	.4byte	0x313
	.ascii	"caribou_thread_t\000"
	.4byte	0x3a7
	.ascii	"caribou_state_t\000"
	.4byte	0x415
	.ascii	"hw_stack_frame_t\000"
	.4byte	0x483
	.ascii	"sw_stack_frame_t\000"
	.4byte	0x4af
	.ascii	"process_frame_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x18c
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
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.4byte	.LFB77
	.4byte	.LFE77-.LFB77
	.4byte	.LFB78
	.4byte	.LFE78-.LFB78
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
	.4byte	.LFB73
	.4byte	.LFE73
	.4byte	.LFB74
	.4byte	.LFE74
	.4byte	.LFB75
	.4byte	.LFE75
	.4byte	.LFB76
	.4byte	.LFE76
	.4byte	.LFB77
	.4byte	.LFE77
	.4byte	.LFB78
	.4byte	.LFE78
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF62:
	.ascii	"hw_stack\000"
.LASF61:
	.ascii	"sw_stack\000"
.LASF108:
	.ascii	"caribou_thread_set_priority\000"
.LASF103:
	.ascii	"caribou_thread_fault_set\000"
.LASF26:
	.ascii	"timerfn\000"
.LASF47:
	.ascii	"__errno\000"
.LASF30:
	.ascii	"flags\000"
.LASF31:
	.ascii	"caribou_timer_t\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF25:
	.ascii	"next\000"
.LASF84:
	.ascii	"caribou_thread_sleep\000"
.LASF92:
	.ascii	"caribou_thread_state\000"
.LASF70:
	.ascii	"append_thread_node\000"
.LASF93:
	.ascii	"caribou_thread_parent\000"
.LASF74:
	.ascii	"remove_thread_node\000"
.LASF38:
	.ascii	"stack_top\000"
.LASF24:
	.ascii	"prev\000"
.LASF126:
	.ascii	"caribou_preempt\000"
.LASF90:
	.ascii	"caribou_thread_stacksize\000"
.LASF115:
	.ascii	"check_sp\000"
.LASF65:
	.ascii	"rd_stack_ptr\000"
.LASF107:
	.ascii	"caribou_thread_current_arg\000"
.LASF75:
	.ascii	"other\000"
.LASF114:
	.ascii	"delete_thread_node\000"
.LASF79:
	.ascii	"caribou_thread_lock\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF34:
	.ascii	"_caribou_thread_t\000"
.LASF123:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF109:
	.ascii	"caribou_thread_priority\000"
.LASF100:
	.ascii	"stackaddr\000"
.LASF95:
	.ascii	"caribou_thread_wfi\000"
.LASF3:
	.ascii	"int16_t\000"
.LASF55:
	.ascii	"faultflags\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF125:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF102:
	.ascii	"process_frame\000"
.LASF36:
	.ascii	"stack_usage\000"
.LASF112:
	.ascii	"main_idle\000"
.LASF77:
	.ascii	"child\000"
.LASF76:
	.ascii	"find_child_thread_node\000"
.LASF9:
	.ascii	"int64_t\000"
.LASF16:
	.ascii	"CPUID\000"
.LASF78:
	.ascii	"_caribou_thread_fault_emit\000"
.LASF43:
	.ascii	"runtime\000"
.LASF71:
	.ascii	"last\000"
.LASF28:
	.ascii	"ticks\000"
.LASF53:
	.ascii	"faultfn\000"
.LASF41:
	.ascii	"prio\000"
.LASF68:
	.ascii	"new_thread_node\000"
.LASF99:
	.ascii	"finish\000"
.LASF117:
	.ascii	"thread_finish\000"
.LASF14:
	.ascii	"char\000"
.LASF119:
	.ascii	"_systick\000"
.LASF19:
	.ascii	"AIRCR\000"
.LASF87:
	.ascii	"caribou_thread_set_name\000"
.LASF45:
	.ascii	"finishfn\000"
.LASF80:
	.ascii	"caribou_thread_unlock\000"
.LASF29:
	.ascii	"reloadticks\000"
.LASF88:
	.ascii	"caribou_thread_name\000"
.LASF104:
	.ascii	"caribou_thread_root\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF110:
	.ascii	"caribou_thread_init\000"
.LASF64:
	.ascii	"rd_thread_stack_ptr\000"
.LASF10:
	.ascii	"long long int\000"
.LASF105:
	.ascii	"caribou_thread_current\000"
.LASF44:
	.ascii	"lock\000"
.LASF39:
	.ascii	"stack_base\000"
.LASF127:
	.ascii	"caribou_thread_once\000"
.LASF66:
	.ascii	"fault_clear\000"
.LASF128:
	.ascii	"_swap_thread\000"
.LASF122:
	.ascii	"__process_stack_end__\000"
.LASF63:
	.ascii	"process_frame_t\000"
.LASF72:
	.ascii	"insert_thread_node\000"
.LASF60:
	.ascii	"sw_stack_frame_t\000"
.LASF98:
	.ascii	"caribou_thread_create\000"
.LASF94:
	.ascii	"caribou_thread_dump\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF18:
	.ascii	"RESERVED0\000"
.LASF20:
	.ascii	"RESERVED1\000"
.LASF21:
	.ascii	"SHCSR\000"
.LASF35:
	.ascii	"parent\000"
.LASF33:
	.ascii	"_caribou_timer_t\000"
.LASF4:
	.ascii	"short int\000"
.LASF120:
	.ascii	"caribou_state\000"
.LASF13:
	.ascii	"long int\000"
.LASF52:
	.ascii	"priority\000"
.LASF96:
	.ascii	"caribou_thread_yield\000"
.LASF69:
	.ascii	"node\000"
.LASF11:
	.ascii	"uint64_t\000"
.LASF97:
	.ascii	"caribou_thread_terminate\000"
.LASF49:
	.ascii	"caribou_thread_t\000"
.LASF91:
	.ascii	"caribou_thread_stackusage\000"
.LASF73:
	.ascii	"after\000"
.LASF22:
	.ascii	"SCB_Type\000"
.LASF42:
	.ascii	"name\000"
.LASF83:
	.ascii	"start\000"
.LASF86:
	.ascii	"caribou_thread_wakeup\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF17:
	.ascii	"ICSR\000"
.LASF56:
	.ascii	"jiffies\000"
.LASF54:
	.ascii	"faultarg\000"
.LASF50:
	.ascii	"queue\000"
.LASF85:
	.ascii	"caribou_thread_sleep_current\000"
.LASF82:
	.ascii	"thread\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF121:
	.ascii	"__process_stack_base__\000"
.LASF116:
	.ascii	"caribou_thread_exec\000"
.LASF118:
	.ascii	"_pendsv\000"
.LASF23:
	.ascii	"caribou_timer_callback_fn\000"
.LASF48:
	.ascii	"sleep\000"
.LASF124:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/k"
	.ascii	"ernel/thread.c\000"
.LASF40:
	.ascii	"state\000"
.LASF57:
	.ascii	"tail_jiffies\000"
.LASF58:
	.ascii	"caribou_state_t\000"
.LASF81:
	.ascii	"caribou_thread_locked\000"
.LASF67:
	.ascii	"fault_set\000"
.LASF0:
	.ascii	"signed char\000"
.LASF89:
	.ascii	"caribou_thread_runtime\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF59:
	.ascii	"hw_stack_frame_t\000"
.LASF27:
	.ascii	"fnarg\000"
.LASF32:
	.ascii	"errno_t\000"
.LASF51:
	.ascii	"current\000"
.LASF101:
	.ascii	"stack_size\000"
.LASF111:
	.ascii	"caribou_thread_schedule\000"
.LASF46:
	.ascii	"timer\000"
.LASF37:
	.ascii	"stack_low\000"
.LASF106:
	.ascii	"caribou_thread_first\000"
.LASF113:
	.ascii	"board_idle\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
