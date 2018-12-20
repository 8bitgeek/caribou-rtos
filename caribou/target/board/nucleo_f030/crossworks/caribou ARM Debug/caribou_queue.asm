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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/queue.c"
	.loc 1 28 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 29 0
	movs	r0, #12
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 30 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L2
	.loc 1 32 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	bne	.L3
	.loc 1 34 0
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 35 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 36 0
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #4]
	b	.L2
.L3:
	.loc 1 40 0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	movs	r0, r3
	bl	malloc
	movs	r2, r0
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
	.loc 1 41 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L4
	.loc 1 43 0
	ldr	r3, [r7, #12]
	ldr	r0, [r3, #8]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	movs	r2, r3
	movs	r1, #0
	bl	memset
	.loc 1 44 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 45 0
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #4]
	b	.L2
.L4:
	.loc 1 49 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	free
	.loc 1 50 0
	movs	r3, #0
	str	r3, [r7, #12]
.L2:
	.loc 1 54 0
	ldr	r3, [r7, #12]
	.loc 1 55 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 63 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 64 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L9
	.loc 1 66 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L8
	.loc 1 67 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	movs	r0, r3
	bl	free
.L8:
	.loc 1 68 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
.L9:
	.loc 1 70 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 78 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 79 0
	ldr	r3, [r7, #12]
	movs	r2, #0
	str	r2, [r3, #4]
	.loc 1 80 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	.loc 1 81 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 82 0
	ldr	r3, [r7, #12]
	.loc 1 83 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 92 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 93 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 94 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #1
	beq	.L13
	.loc 1 94 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L14
.L13:
	.loc 1 94 0 discriminator 3
	movs	r3, #1
	b	.L15
.L14:
	.loc 1 94 0 discriminator 4
	movs	r3, #0
.L15:
	.loc 1 94 0 discriminator 6
	str	r3, [r7, #8]
	.loc 1 95 0 is_stmt 1 discriminator 6
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 96 0 discriminator 6
	ldr	r3, [r7, #8]
	uxtb	r3, r3
	.loc 1 97 0 discriminator 6
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 105 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 1 106 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 107 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 108 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 109 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 110 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 117 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 118 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 119 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #1
	bne	.L20
	.loc 1 119 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	b	.L21
.L20:
	.loc 1 119 0 discriminator 2
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
.L21:
	.loc 1 119 0 discriminator 4
	str	r3, [r7, #8]
	.loc 1 120 0 is_stmt 1 discriminator 4
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 121 0 discriminator 4
	ldr	r3, [r7, #8]
	.loc 1 122 0 discriminator 4
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 128 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #16
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	.loc 1 129 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 130 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #8]
	.loc 1 131 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 132 0
	ldr	r3, [r7, #8]
	.loc 1 133 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	caribou_queue_count, .-caribou_queue_count
	.section	.text.caribou_queue_post,"ax",%progbits
	.align	2
	.global	caribou_queue_post
	.code	16
	.thumb_func
	.type	caribou_queue_post, %function
caribou_queue_post:
.LFB39:
	.loc 1 143 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI21:
	sub	sp, sp, #28
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 1 144 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #16]
	str	r4, [r7, #20]
	.loc 1 145 0
	b	.L26
.L29:
	.loc 1 147 0
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	ldr	r0, [r7, #16]
	ldr	r1, [r7, #20]
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L27
	.loc 1 148 0
	movs	r3, #0
	b	.L28
.L27:
	.loc 1 149 0
	bl	caribou_thread_yield
.L26:
	.loc 1 145 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	caribou_queue_try_post
	subs	r3, r0, #0
	beq	.L29
	.loc 1 151 0
	movs	r3, #1
.L28:
	.loc 1 152 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE39:
	.size	caribou_queue_post, .-caribou_queue_post
	.section	.text.caribou_queue_last,"ax",%progbits
	.align	2
	.global	caribou_queue_last
	.code	16
	.thumb_func
	.type	caribou_queue_last, %function
caribou_queue_last:
.LFB40:
	.loc 1 160 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #16
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	.loc 1 161 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 162 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 163 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L31
	.loc 1 165 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r1, .L33
	mov	ip, r1
	add	r3, r3, ip
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L31:
	.loc 1 167 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 168 0
	ldr	r3, [r7, #12]
	.loc 1 169 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L34:
	.align	2
.L33:
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
	.loc 1 177 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	.loc 1 178 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 179 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 180 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L36
	.loc 1 182 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L36:
	.loc 1 184 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 185 0
	ldr	r3, [r7, #12]
	.loc 1 186 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	caribou_queue_first, .-caribou_queue_first
	.section	.text.caribou_queue_take_last,"ax",%progbits
	.align	2
	.global	caribou_queue_take_last
	.code	16
	.thumb_func
	.type	caribou_queue_take_last, %function
caribou_queue_take_last:
.LFB42:
	.loc 1 194 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI30:
	sub	sp, sp, #36
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #12]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 1 196 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #24]
	str	r4, [r7, #28]
	.loc 1 197 0
	b	.L39
.L41:
	.loc 1 198 0
	bl	caribou_thread_yield
.L39:
	.loc 1 197 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	caribou_queue_try_take_last
	movs	r3, r0
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L40
	.loc 1 197 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	ldr	r0, [r7, #24]
	ldr	r1, [r7, #28]
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L41
.L40:
	.loc 1 199 0 is_stmt 1
	ldr	r3, [r7, #20]
	.loc 1 200 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r7, pc}
.LFE42:
	.size	caribou_queue_take_last, .-caribou_queue_take_last
	.section	.text.caribou_queue_take_first,"ax",%progbits
	.align	2
	.global	caribou_queue_take_first
	.code	16
	.thumb_func
	.type	caribou_queue_take_first, %function
caribou_queue_take_first:
.LFB43:
	.loc 1 208 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI33:
	sub	sp, sp, #28
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 1 209 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #16]
	str	r4, [r7, #20]
	.loc 1 210 0
	ldr	r3, [r7, #8]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 211 0
	b	.L44
.L47:
	.loc 1 213 0
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	ldr	r0, [r7, #16]
	ldr	r1, [r7, #20]
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L45
	.loc 1 214 0
	movs	r3, #0
	b	.L46
.L45:
	.loc 1 215 0
	bl	caribou_thread_yield
.L44:
	.loc 1 211 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	caribou_queue_try_take_first
	subs	r3, r0, #0
	beq	.L47
	.loc 1 217 0
	movs	r3, #1
.L46:
	.loc 1 218 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE43:
	.size	caribou_queue_take_first, .-caribou_queue_take_first
	.section	.text.caribou_queue_try_post,"ax",%progbits
	.align	2
	.global	caribou_queue_try_post
	.code	16
	.thumb_func
	.type	caribou_queue_try_post, %function
caribou_queue_try_post:
.LFB44:
	.loc 1 228 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #16
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 229 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 230 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 231 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r3, r3, #1
	bne	.L49
	.loc 1 233 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	adds	r3, r3, #1
	lsls	r3, r3, #2
	movs	r1, r3
	movs	r0, r2
	bl	realloc
	movs	r2, r0
	ldr	r3, [r7, #4]
	str	r2, [r3, #8]
	.loc 1 234 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L51
	.loc 1 236 0
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	adds	r0, r2, #1
	ldr	r3, [r7, #4]
	str	r0, [r3, #4]
	movs	r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 237 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L51
.L49:
	.loc 1 240 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L51
	.loc 1 242 0
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	adds	r0, r2, #1
	ldr	r3, [r7, #4]
	str	r0, [r3, #4]
	movs	r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 243 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L51:
	.loc 1 245 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 246 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 248 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE44:
	.size	caribou_queue_try_post, .-caribou_queue_try_post
	.section	.text.caribou_queue_try_take_last,"ax",%progbits
	.align	2
	.global	caribou_queue_try_take_last
	.code	16
	.thumb_func
	.type	caribou_queue_try_take_last, %function
caribou_queue_try_take_last:
.LFB45:
	.loc 1 256 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #16
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	.loc 1 257 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 258 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 259 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L54
	.loc 1 261 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	subs	r1, r3, #1
	ldr	r3, [r7, #4]
	str	r1, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L54:
	.loc 1 263 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 264 0
	ldr	r3, [r7, #12]
	.loc 1 265 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE45:
	.size	caribou_queue_try_take_last, .-caribou_queue_try_take_last
	.section	.text.caribou_queue_try_take_first,"ax",%progbits
	.align	2
	.global	caribou_queue_try_take_first
	.code	16
	.thumb_func
	.type	caribou_queue_try_take_first, %function
caribou_queue_try_take_first:
.LFB46:
	.loc 1 273 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #24
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 274 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 275 0
	ldr	r3, [r7]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 276 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 277 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L57
.LBB2:
	.loc 1 279 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	subs	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #4]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	lsls	r3, r3, #2
	str	r3, [r7, #12]
	.loc 1 280 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r2, [r3]
	ldr	r3, [r7]
	str	r2, [r3]
	.loc 1 281 0
	ldr	r3, [r7, #4]
	ldr	r0, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	adds	r3, r3, #4
	ldr	r2, [r7, #12]
	movs	r1, r3
	bl	memmove
	.loc 1 282 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L57:
.LBE2:
	.loc 1 284 0
	ldr	r3, [r7, #16]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 285 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 286 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE46:
	.size	caribou_queue_try_take_first, .-caribou_queue_try_take_first
	.section	.text.caribou_queue_index_of,"ax",%progbits
	.align	2
	.global	caribou_queue_index_of
	.code	16
	.thumb_func
	.type	caribou_queue_index_of, %function
caribou_queue_index_of:
.LFB47:
	.loc 1 295 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI45:
	sub	sp, sp, #24
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 296 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #20]
	.loc 1 297 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
.LBB3:
	.loc 1 298 0
	movs	r3, #0
	str	r3, [r7, #16]
	b	.L60
.L63:
	.loc 1 300 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #16]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L61
	.loc 1 302 0
	ldr	r3, [r7, #16]
	str	r3, [r7, #20]
	.loc 1 303 0
	b	.L62
.L61:
	.loc 1 298 0 discriminator 2
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L60:
	.loc 1 298 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bgt	.L63
.L62:
.LBE3:
	.loc 1 306 0 is_stmt 1
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 307 0
	ldr	r3, [r7, #20]
	.loc 1 308 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 318 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #32
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 319 0
	movs	r3, #0
	str	r3, [r7, #28]
	.loc 1 320 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #24]
	.loc 1 321 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	ble	.L66
	.loc 1 321 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	ble	.L66
	.loc 1 321 0 discriminator 2
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	beq	.L66
	.loc 1 321 0 discriminator 3
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	.L66
	.loc 1 321 0 discriminator 4
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	.L66
.LBB4:
	.loc 1 323 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 324 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #12]
	ldr	r1, [r2, #8]
	ldr	r2, [r7, #4]
	lsls	r2, r2, #2
	adds	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 325 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #20]
	str	r2, [r3]
	.loc 1 326 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	ldr	r3, [r3]
	str	r3, [r7, #28]
.L66:
.LBE4:
	.loc 1 328 0
	ldr	r3, [r7, #24]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 329 0
	ldr	r3, [r7, #28]
	.loc 1 330 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 338 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI51:
	sub	sp, sp, #28
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #4]
	.loc 1 339 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 340 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 341 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L69
	.loc 1 343 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #1
	ble	.L70
.LBB5:
	.loc 1 345 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r3, [r3]
	str	r3, [r7, #12]
.LBB6:
	.loc 1 346 0
	movs	r4, #0
	b	.L71
.L72:
	.loc 1 347 0 discriminator 3
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	movs	r3, r4
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #4]
	ldr	r1, [r2, #8]
	movs	r2, r4
	adds	r2, r2, #1
	lsls	r2, r2, #2
	adds	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 346 0 discriminator 3
	adds	r4, r4, #1
.L71:
	.loc 1 346 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	subs	r3, r3, #1
	cmp	r3, r4
	bgt	.L72
.LBE6:
	.loc 1 348 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	ldr	r1, .L74
	mov	ip, r1
	add	r3, r3, ip
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #12]
	str	r2, [r3]
.L70:
.LBE5:
	.loc 1 350 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	ldr	r3, [r3]
	str	r3, [r7, #20]
.L69:
	.loc 1 352 0
	ldr	r3, [r7, #16]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 353 0
	ldr	r3, [r7, #20]
	.loc 1 354 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.L75:
	.align	2
.L74:
	.word	1073741823
.LFE49:
	.size	caribou_queue_rotate, .-caribou_queue_rotate
	.section	.text.caribou_queue_take_at,"ax",%progbits
	.align	2
	.global	caribou_queue_take_at
	.code	16
	.thumb_func
	.type	caribou_queue_take_at, %function
caribou_queue_take_at:
.LFB50:
	.loc 1 364 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI54:
	sub	sp, sp, #36
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 1 366 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #24]
	str	r4, [r7, #28]
	.loc 1 367 0
	b	.L77
.L79:
	.loc 1 368 0
	bl	caribou_thread_yield
.L77:
	.loc 1 367 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	caribou_queue_try_take_at
	movs	r3, r0
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L78
	.loc 1 367 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	ldr	r0, [r7, #24]
	ldr	r1, [r7, #28]
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L79
.L78:
	.loc 1 369 0 is_stmt 1
	ldr	r3, [r7, #20]
	.loc 1 371 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r7, pc}
.LFE50:
	.size	caribou_queue_take_at, .-caribou_queue_take_at
	.section	.text.caribou_queue_try_take_at,"ax",%progbits
	.align	2
	.global	caribou_queue_try_take_at
	.code	16
	.thumb_func
	.type	caribou_queue_try_take_at, %function
caribou_queue_try_take_at:
.LFB51:
	.loc 1 381 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI57:
	sub	sp, sp, #24
.LCFI58:
	add	r7, sp, #0
.LCFI59:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 382 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 383 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 384 0
	ldr	r3, [r7]
	cmp	r3, #0
	blt	.L82
	.loc 1 384 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	ble	.L82
.LBB7:
	.loc 1 386 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	subs	r3, r2, r3
	lsls	r3, r3, #2
	str	r3, [r7, #12]
	.loc 1 387 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 388 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	lsls	r3, r3, #2
	adds	r0, r2, r3
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldr	r1, [r3, #4]
	ldr	r3, [r7]
	subs	r3, r1, r3
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #12]
	movs	r1, r3
	bl	memmove
.L82:
.LBE7:
	.loc 1 390 0
	ldr	r3, [r7, #16]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 391 0
	ldr	r3, [r7, #20]
	.loc 1 392 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE51:
	.size	caribou_queue_try_take_at, .-caribou_queue_try_take_at
	.section	.text.caribou_queue_at,"ax",%progbits
	.align	2
	.global	caribou_queue_at
	.code	16
	.thumb_func
	.type	caribou_queue_at, %function
caribou_queue_at:
.LFB52:
	.loc 1 402 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI60:
	sub	sp, sp, #16
.LCFI61:
	add	r7, sp, #0
.LCFI62:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 403 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 404 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 405 0
	ldr	r3, [r7]
	cmp	r3, #0
	blt	.L85
	.loc 1 405 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	ble	.L85
	.loc 1 407 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #8]
	ldr	r3, [r7]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #12]
.L85:
	.loc 1 409 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 410 0
	ldr	r3, [r7, #12]
	.loc 1 411 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x28
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
	.uleb128 0x18
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI32-.LCFI31
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
	.4byte	.LCFI33-.LFB43
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI35-.LCFI34
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
	.4byte	.LCFI36-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
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
	.4byte	.LCFI39-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI41-.LCFI40
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
	.4byte	.LCFI42-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
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
	.4byte	.LCFI45-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
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
	.4byte	.LCFI48-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI50-.LCFI49
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
	.4byte	.LCFI51-.LFB49
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI53-.LCFI52
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
	.4byte	.LCFI54-.LFB50
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
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
	.4byte	.LCFI57-.LFB51
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
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
	.4byte	.LCFI60-.LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE40:
	.text
.Letext0:
	.file 2 "../../../../include/caribou/lib/queue.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x778
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0xc
	.4byte	.LASF42
	.4byte	.LASF43
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x23
	.4byte	0x5a
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	.LASF44
	.byte	0x2
	.byte	0x1e
	.uleb128 0x6
	.4byte	.LASF45
	.byte	0xc
	.byte	0x2
	.byte	0x20
	.4byte	0xb5
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x22
	.4byte	0x41
	.byte	0
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x23
	.4byte	0x41
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x2
	.byte	0x24
	.4byte	0xb5
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xbb
	.uleb128 0x8
	.byte	0x4
	.4byte	0x7d
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x2
	.byte	0x25
	.4byte	0x84
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1b
	.4byte	0x102
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x102
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1d
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xc1
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x1
	.byte	0x3e
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12c
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3e
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4d
	.4byte	0x102
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x170
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4d
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF10
	.byte	0x1
	.byte	0x4d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x4d
	.4byte	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x5b
	.4byte	0x6f
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1b3
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x5b
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x5d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x1
	.byte	0x68
	.4byte	0x6f
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f6
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x68
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x6a
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x6b
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0x74
	.4byte	0x41
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x239
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x74
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x76
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x1
	.byte	0x7f
	.4byte	0x41
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x27c
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x7f
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x81
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x1
	.byte	0x8e
	.4byte	0x6f
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ce
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x8e
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.ascii	"msg\000"
	.byte	0x1
	.byte	0x8e
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x8e
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x90
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0x9f
	.4byte	0xbb
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x311
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x9f
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xa1
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0xa2
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x1
	.byte	0xb0
	.4byte	0xbb
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x354
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xb0
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xb2
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0xb3
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0xc1
	.4byte	0xbb
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a5
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xc1
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xc1
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xc3
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0xc4
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x1
	.byte	0xcf
	.4byte	0x6f
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f7
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xcf
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xcf
	.4byte	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0xcf
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0xd1
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x1
	.byte	0xe3
	.4byte	0x6f
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x448
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xe3
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.ascii	"msg\000"
	.byte	0x1
	.byte	0xe3
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xe5
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xe
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0xe6
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0xff
	.4byte	0xbb
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x48d
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0xff
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x101
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x102
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x110
	.4byte	0x6f
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4fb
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x110
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.2byte	0x110
	.4byte	0xb5
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x112
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x114
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x10
	.ascii	"sz\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x126
	.4byte	0x41
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x568
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x126
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"msg\000"
	.byte	0x1
	.2byte	0x126
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x128
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x129
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x10
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x12a
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x13d
	.4byte	0xbb
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e0
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x13d
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x13d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.ascii	"b\000"
	.byte	0x1
	.2byte	0x13d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x13f
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x140
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x10
	.ascii	"t\000"
	.byte	0x1
	.2byte	0x143
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x151
	.4byte	0xbb
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x656
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x151
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x153
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x154
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x14
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x159
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x14
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x10
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x15a
	.4byte	0x41
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x16b
	.4byte	0xbb
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6bb
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x16b
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x16b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x16b
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x16d
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x16e
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x17c
	.4byte	0xbb
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x729
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x17c
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x17c
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x17e
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x17f
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x10
	.ascii	"sz\000"
	.byte	0x1
	.2byte	0x182
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x191
	.4byte	0xbb
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x191
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x191
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x193
	.4byte	0xbb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.2byte	0x194
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.4byte	0x226
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x77c
	.4byte	0xcc
	.ascii	"caribou_queue_new\000"
	.4byte	0x108
	.ascii	"caribou_queue_delete\000"
	.4byte	0x12c
	.ascii	"caribou_queue_init\000"
	.4byte	0x170
	.ascii	"caribou_queue_full\000"
	.4byte	0x1b3
	.ascii	"caribou_queue_empty\000"
	.4byte	0x1f6
	.ascii	"caribou_queue_depth\000"
	.4byte	0x239
	.ascii	"caribou_queue_count\000"
	.4byte	0x27c
	.ascii	"caribou_queue_post\000"
	.4byte	0x2ce
	.ascii	"caribou_queue_last\000"
	.4byte	0x311
	.ascii	"caribou_queue_first\000"
	.4byte	0x354
	.ascii	"caribou_queue_take_last\000"
	.4byte	0x3a5
	.ascii	"caribou_queue_take_first\000"
	.4byte	0x3f7
	.ascii	"caribou_queue_try_post\000"
	.4byte	0x448
	.ascii	"caribou_queue_try_take_last\000"
	.4byte	0x48d
	.ascii	"caribou_queue_try_take_first\000"
	.4byte	0x4fb
	.ascii	"caribou_queue_index_of\000"
	.4byte	0x568
	.ascii	"caribou_queue_swap\000"
	.4byte	0x5e0
	.ascii	"caribou_queue_rotate\000"
	.4byte	0x656
	.ascii	"caribou_queue_take_at\000"
	.4byte	0x6bb
	.ascii	"caribou_queue_try_take_at\000"
	.4byte	0x729
	.ascii	"caribou_queue_at\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x10b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x77c
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x3a
	.ascii	"short unsigned int\000"
	.4byte	0x41
	.ascii	"int\000"
	.4byte	0x48
	.ascii	"unsigned int\000"
	.4byte	0x5a
	.ascii	"long long int\000"
	.4byte	0x4f
	.ascii	"int64_t\000"
	.4byte	0x61
	.ascii	"long long unsigned int\000"
	.4byte	0x68
	.ascii	"long int\000"
	.4byte	0x6f
	.ascii	"char\000"
	.4byte	0x76
	.ascii	"sizetype\000"
	.4byte	0x7d
	.ascii	"caribou_queue_msg_t\000"
	.4byte	0x84
	.ascii	"_caribou_queue_t\000"
	.4byte	0xc1
	.ascii	"caribou_queue_t\000"
	.4byte	0
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF13:
	.ascii	"int64_t\000"
.LASF42:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/queue.c\000"
.LASF25:
	.ascii	"caribou_queue_last\000"
.LASF23:
	.ascii	"timeout\000"
.LASF11:
	.ascii	"count\000"
.LASF24:
	.ascii	"start\000"
.LASF12:
	.ascii	"msgs\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF32:
	.ascii	"caribou_queue_index_of\000"
.LASF44:
	.ascii	"caribou_queue_msg_t\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF20:
	.ascii	"caribou_queue_depth\000"
.LASF28:
	.ascii	"caribou_queue_take_first\000"
.LASF38:
	.ascii	"caribou_queue_try_take_at\000"
.LASF16:
	.ascii	"caribou_queue_new\000"
.LASF19:
	.ascii	"caribou_queue_empty\000"
.LASF43:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF39:
	.ascii	"caribou_queue_delete\000"
.LASF0:
	.ascii	"signed char\000"
.LASF41:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF34:
	.ascii	"caribou_queue_rotate\000"
.LASF35:
	.ascii	"last\000"
.LASF33:
	.ascii	"caribou_queue_swap\000"
.LASF17:
	.ascii	"caribou_queue_init\000"
.LASF40:
	.ascii	"caribou_queue_at\000"
.LASF36:
	.ascii	"caribou_queue_take_at\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF15:
	.ascii	"queue\000"
.LASF31:
	.ascii	"caribou_queue_try_take_first\000"
.LASF22:
	.ascii	"caribou_queue_post\000"
.LASF10:
	.ascii	"depth\000"
.LASF8:
	.ascii	"char\000"
.LASF45:
	.ascii	"_caribou_queue_t\000"
.LASF29:
	.ascii	"caribou_queue_try_post\000"
.LASF2:
	.ascii	"short int\000"
.LASF27:
	.ascii	"caribou_queue_take_last\000"
.LASF37:
	.ascii	"index\000"
.LASF5:
	.ascii	"long long int\000"
.LASF21:
	.ascii	"caribou_queue_count\000"
.LASF14:
	.ascii	"caribou_queue_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF26:
	.ascii	"caribou_queue_first\000"
.LASF18:
	.ascii	"caribou_queue_full\000"
.LASF30:
	.ascii	"caribou_queue_try_take_last\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
