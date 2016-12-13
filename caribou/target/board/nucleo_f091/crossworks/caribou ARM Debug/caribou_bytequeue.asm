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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/lib/bytequeue.c"
	.loc 1 35 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	movs	r2, r0
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 36 0
	movs	r0, #12
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 37 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L2
	.loc 1 39 0
	ldr	r3, [r7, #12]
	movs	r2, #12
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 1 40 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	movs	r0, r3
	bl	malloc
	movs	r2, r0
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 1 41 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L3
	.loc 1 43 0
	ldr	r3, [r7, #12]
	adds	r2, r7, #6
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	b	.L2
.L3:
	.loc 1 47 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	free
	.loc 1 48 0
	movs	r3, #0
	str	r3, [r7, #12]
.L2:
	.loc 1 51 0
	ldr	r3, [r7, #12]
	.loc 1 52 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 60 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 61 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 62 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L6
.LBB2:
	.loc 1 64 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 65 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L7
	.loc 1 66 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	free
.L7:
	.loc 1 67 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
	.loc 1 68 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 69 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
.L6:
.LBE2:
	.loc 1 71 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 72 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 82 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #24
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 83 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 84 0
	ldr	r3, [r7, #12]
	movs	r2, #12
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 1 85 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L10
	.loc 1 85 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L10
	.loc 1 85 0 discriminator 2
	adds	r3, r7, #6
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L10
	.loc 1 87 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	.loc 1 88 0
	ldr	r3, [r7, #12]
	adds	r2, r7, #6
	ldrh	r2, [r2]
	strh	r2, [r3, #4]
	.loc 1 89 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L10:
	.loc 1 91 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 92 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 100 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 101 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 102 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	subs	r3, r3, #1
	cmp	r2, r3
	beq	.L13
	.loc 1 102 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	subs	r3, r3, #1
	cmp	r2, r3
	bne	.L14
	.loc 1 102 0 discriminator 3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	bne	.L14
.L13:
	.loc 1 102 0 discriminator 5
	movs	r2, #1
	b	.L15
.L14:
	.loc 1 102 0 discriminator 6
	movs	r2, #0
.L15:
	.loc 1 102 0 discriminator 8
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 103 0 is_stmt 1 discriminator 8
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 104 0 discriminator 8
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 105 0 discriminator 8
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 113 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 1 114 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 115 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	subs	r3, r2, r3
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 116 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 117 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 118 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 126 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 127 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 128 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #8]
	ldr	r3, [r7, #4]
	strh	r2, [r3, #6]
	.loc 1 129 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 130 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 140 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #16
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	.loc 1 141 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 142 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	subs	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 143 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bge	.L21
	.loc 1 145 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	subs	r3, r2, r3
	ldr	r2, [r7, #4]
	ldrh	r2, [r2, #6]
	adds	r3, r3, r2
	str	r3, [r7, #12]
.L21:
	.loc 1 147 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 148 0
	ldr	r3, [r7, #12]
	.loc 1 149 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 157 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 158 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	.loc 1 159 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 167 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI24:
	sub	sp, sp, #12
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	.loc 1 168 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_bytequeue_level
	movs	r4, r0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_bytequeue_size
	subs	r3, r0, #0
	bge	.L26
	adds	r3, r3, #1
.L26:
	asrs	r3, r3, #1
	asrs	r1, r4, #31
	lsrs	r2, r3, #31
	cmp	r4, r3
	adcs	r1, r1, r2
	movs	r3, r1
	uxtb	r3, r3
	.loc 1 169 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r7, pc}
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
	.loc 1 178 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 179 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 180 0
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	subs	r3, r3, #1
	cmp	r2, r3
	beq	.L29
	.loc 1 180 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	subs	r3, r3, #1
	cmp	r2, r3
	bne	.L30
	.loc 1 180 0 discriminator 4
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	beq	.L29
.L30:
	.loc 1 180 0 discriminator 5
	movs	r2, #1
	b	.L31
.L29:
	.loc 1 180 0 discriminator 6
	movs	r2, #0
.L31:
	.loc 1 180 0 discriminator 8
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 181 0 is_stmt 1 discriminator 8
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L32
	.loc 1 183 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #6]
	adds	r1, r3, #1
	uxth	r0, r1
	ldr	r1, [r7, #4]
	strh	r0, [r1, #6]
	adds	r3, r2, r3
	adds	r2, r7, #3
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 184 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r2, r3
	bcc	.L32
	.loc 1 185 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #6]
.L32:
	.loc 1 187 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 188 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 189 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 199 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #24
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 200 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 201 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 202 0
	b	.L35
.L37:
	.loc 1 204 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #6]
	adds	r1, r3, #1
	uxth	r0, r1
	ldr	r1, [r7, #12]
	strh	r0, [r1, #6]
	adds	r2, r2, r3
	ldr	r3, [r7, #20]
	adds	r1, r3, #1
	str	r1, [r7, #20]
	movs	r1, r3
	ldr	r3, [r7, #8]
	adds	r3, r3, r1
	ldrb	r3, [r3]
	strb	r3, [r2]
	.loc 1 205 0
	ldr	r3, [r7, #12]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #4]
	cmp	r2, r3
	bcc	.L35
	.loc 1 206 0
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #6]
.L35:
	.loc 1 202 0
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bge	.L36
	.loc 1 202 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	subs	r3, r3, #1
	cmp	r2, r3
	beq	.L36
	.loc 1 202 0 discriminator 2
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #6]
	movs	r2, r3
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #4]
	subs	r3, r3, #1
	cmp	r2, r3
	bne	.L37
	.loc 1 202 0 discriminator 3
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	bne	.L37
.L36:
	.loc 1 208 0 is_stmt 1
	ldr	r3, [r7, #16]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 209 0
	ldr	r3, [r7, #20]
	.loc 1 210 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 218 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #16
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	.loc 1 219 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 220 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
	.loc 1 221 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	cmp	r2, r3
	beq	.L40
	.loc 1 223 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #8]
	adds	r1, r3, #1
	uxth	r0, r1
	ldr	r1, [r7, #4]
	strh	r0, [r1, #8]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 224 0
	ldr	r3, [r7, #4]
	ldrh	r2, [r3, #8]
	ldr	r3, [r7, #4]
	ldrh	r3, [r3, #4]
	cmp	r2, r3
	bcc	.L40
	.loc 1 225 0
	ldr	r3, [r7, #4]
	movs	r2, #0
	strh	r2, [r3, #8]
.L40:
	.loc 1 227 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 228 0
	ldr	r3, [r7, #12]
	.loc 1 229 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 239 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI36:
	sub	sp, sp, #28
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 240 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 241 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 242 0
	b	.L43
.L45:
	.loc 1 244 0
	ldr	r3, [r7, #20]
	adds	r2, r3, #1
	str	r2, [r7, #20]
	movs	r2, r3
	ldr	r3, [r7, #8]
	adds	r2, r3, r2
	ldr	r3, [r7, #12]
	ldr	r1, [r3]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	adds	r0, r3, #1
	uxth	r4, r0
	ldr	r0, [r7, #12]
	strh	r4, [r0, #8]
	adds	r3, r1, r3
	ldrb	r3, [r3]
	strb	r3, [r2]
	.loc 1 245 0
	ldr	r3, [r7, #12]
	ldrh	r2, [r3, #8]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #4]
	cmp	r2, r3
	bcc	.L43
	.loc 1 246 0
	ldr	r3, [r7, #12]
	movs	r2, #0
	strh	r2, [r3, #8]
.L43:
	.loc 1 242 0
	ldr	r3, [r7, #12]
	ldrh	r2, [r3, #6]
	ldr	r3, [r7, #12]
	ldrh	r3, [r3, #8]
	cmp	r2, r3
	beq	.L44
	.loc 1 242 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L45
.L44:
	.loc 1 248 0 is_stmt 1
	ldr	r3, [r7, #16]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 249 0
	ldr	r3, [r7, #20]
	.loc 1 250 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
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
	.uleb128 0x20
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x10
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x18
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../../include/caribou/lib/bytequeue.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x43d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0xc
	.4byte	.LASF32
	.4byte	.LASF33
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
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x6
	.byte	0xc
	.byte	0x3
	.byte	0x1d
	.4byte	0xc3
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x3
	.byte	0x1f
	.4byte	0xc3
	.byte	0
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0x20
	.4byte	0x45
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0x21
	.4byte	0x45
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x3
	.byte	0x22
	.4byte	0x45
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x23
	.4byte	0x8a
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0x22
	.4byte	0x109
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x109
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x22
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x24
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xc9
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3b
	.4byte	0x7c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15c
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x3b
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xc
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x40
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0x51
	.4byte	0x7c
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ad
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x51
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x51
	.4byte	0x45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x1
	.byte	0x63
	.4byte	0x7c
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f0
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x63
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x65
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x66
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x1
	.byte	0x70
	.4byte	0x7c
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x233
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x70
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x72
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xf
	.4byte	.LASF29
	.byte	0x1
	.byte	0x7d
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x265
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x7d
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x7f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x1
	.byte	0x8b
	.4byte	0x57
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a8
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8b
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x8d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x8e
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0x9c
	.4byte	0x57
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d0
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0x9c
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0xa6
	.4byte	0x7c
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f8
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0xa6
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x1
	.byte	0xb1
	.4byte	0x7c
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x347
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0xb1
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"c\000"
	.byte	0x1
	.byte	0xb1
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb3
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xb4
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0xc6
	.4byte	0x57
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a3
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0xc6
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"c\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0xc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.ascii	"sz\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xc8
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0xc9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x1
	.byte	0xd9
	.4byte	0x57
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e6
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0xd9
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0xdb
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xdc
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x1
	.byte	0xee
	.4byte	0x57
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF12
	.byte	0x1
	.byte	0xee
	.4byte	0x109
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.ascii	"buf\000"
	.byte	0x1
	.byte	0xee
	.4byte	0xc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xe
	.ascii	"sz\000"
	.byte	0x1
	.byte	0xee
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0xf0
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xf1
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0xc
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x172
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x441
	.4byte	0xd4
	.ascii	"caribou_bytequeue_new\000"
	.4byte	0x10f
	.ascii	"caribou_bytequeue_free\000"
	.4byte	0x15c
	.ascii	"caribou_bytequeue_init\000"
	.4byte	0x1ad
	.ascii	"caribou_bytequeue_full\000"
	.4byte	0x1f0
	.ascii	"caribou_bytequeue_empty\000"
	.4byte	0x233
	.ascii	"caribou_bytequeue_clear\000"
	.4byte	0x265
	.ascii	"caribou_bytequeue_level\000"
	.4byte	0x2a8
	.ascii	"caribou_bytequeue_size\000"
	.4byte	0x2d0
	.ascii	"caribou_bytequeue_half_full\000"
	.4byte	0x2f8
	.ascii	"caribou_bytequeue_put\000"
	.4byte	0x347
	.ascii	"caribou_bytequeue_puts\000"
	.4byte	0x3a3
	.ascii	"caribou_bytequeue_get\000"
	.4byte	0x3e6
	.ascii	"caribou_bytequeue_gets\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xef
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x441
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
	.4byte	0x5e
	.ascii	"unsigned int\000"
	.4byte	0x65
	.ascii	"long long int\000"
	.4byte	0x6c
	.ascii	"long long unsigned int\000"
	.4byte	0x75
	.ascii	"long int\000"
	.4byte	0x7c
	.ascii	"char\000"
	.4byte	0x83
	.ascii	"sizetype\000"
	.4byte	0xc9
	.ascii	"caribou_bytequeue_t\000"
	.4byte	0
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
.LASF18:
	.ascii	"caribou_bytequeue_free\000"
.LASF17:
	.ascii	"caribou_bytequeue_new\000"
.LASF25:
	.ascii	"caribou_bytequeue_half_full\000"
.LASF19:
	.ascii	"state\000"
.LASF26:
	.ascii	"caribou_bytequeue_put\000"
.LASF30:
	.ascii	"caribou_bytequeue_gets\000"
.LASF27:
	.ascii	"caribou_bytequeue_puts\000"
.LASF29:
	.ascii	"caribou_bytequeue_clear\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF20:
	.ascii	"caribou_bytequeue_init\000"
.LASF14:
	.ascii	"head\000"
.LASF31:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"size\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF32:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/l"
	.ascii	"ib/bytequeue.c\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF12:
	.ascii	"queue\000"
.LASF7:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"char\000"
.LASF28:
	.ascii	"caribou_bytequeue_get\000"
.LASF24:
	.ascii	"caribou_bytequeue_size\000"
.LASF2:
	.ascii	"short int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF15:
	.ascii	"tail\000"
.LASF21:
	.ascii	"caribou_bytequeue_full\000"
.LASF9:
	.ascii	"long int\000"
.LASF33:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF22:
	.ascii	"caribou_bytequeue_empty\000"
.LASF0:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"caribou_bytequeue_t\000"
.LASF23:
	.ascii	"caribou_bytequeue_level\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
