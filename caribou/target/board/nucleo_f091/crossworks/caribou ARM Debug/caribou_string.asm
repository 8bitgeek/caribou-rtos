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
	.file	"string.c"
	.text
.Ltext0:
	.section	.text.memcpy,"ax",%progbits
	.align	2
	.global	memcpy
	.code	16
	.thumb_func
	.type	memcpy, %function
memcpy:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/lib/string.c"
	.loc 1 22 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 23 0
	ldr	r3, [r7, #4]
	cmp	r3, #8
	bls	.L2
.LBB2:
	.loc 1 26 0
	ldr	r4, [r7, #12]
	.loc 1 27 0
	ldr	r5, [r7, #8]
	.loc 1 28 0
	b	.L3
.L5:
	.loc 1 30 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, r5
	adds	r5, r2, #1
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 31 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L3:
	.loc 1 28 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L6
	.loc 1 28 0 is_stmt 0 discriminator 1
	movs	r2, r4
	movs	r3, #3
	ands	r3, r2
	bne	.L5
	.loc 1 28 0 discriminator 2
	movs	r2, r5
	movs	r3, #3
	ands	r3, r2
	bne	.L5
	.loc 1 37 0 is_stmt 1
	b	.L6
.L7:
	.loc 1 39 0
	movs	r3, r4
	adds	r4, r3, #4
	movs	r2, r5
	adds	r5, r2, #4
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 40 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	str	r3, [r7, #4]
.L6:
	.loc 1 37 0
	ldr	r3, [r7, #4]
	cmp	r3, #3
	bhi	.L7
	.loc 1 46 0
	b	.L8
.L9:
	.loc 1 48 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, r5
	adds	r5, r2, #1
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 49 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L8:
	.loc 1 46 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L9
	b	.L10
.L2:
.LBE2:
.LBB3:
	.loc 1 54 0
	ldr	r4, [r7, #12]
	.loc 1 55 0
	ldr	r5, [r7, #8]
	.loc 1 56 0
	b	.L11
.L12:
	.loc 1 58 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, r5
	adds	r5, r2, #1
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 59 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L11:
	.loc 1 56 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L12
.L10:
.LBE3:
	.loc 1 62 0
	ldr	r3, [r7, #12]
	.loc 1 63 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE32:
	.size	memcpy, .-memcpy
	.section	.text.memcpy_r,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	memcpy_r, %function
memcpy_r:
.LFB33:
	.loc 1 69 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 70 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	adds	r3, r2, r3
	str	r3, [r7, #8]
	.loc 1 71 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	adds	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 72 0
	ldr	r3, [r7, #4]
	cmp	r3, #8
	bls	.L15
.LBB4:
	.loc 1 75 0
	ldr	r4, [r7, #12]
	.loc 1 76 0
	ldr	r5, [r7, #8]
	.loc 1 77 0
	b	.L16
.L18:
	.loc 1 79 0
	subs	r4, r4, #1
	subs	r5, r5, #1
	ldrb	r3, [r5]
	strb	r3, [r4]
	.loc 1 80 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L16:
	.loc 1 77 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L19
	.loc 1 77 0 is_stmt 0 discriminator 1
	movs	r2, r4
	movs	r3, #3
	ands	r3, r2
	bne	.L18
	.loc 1 77 0 discriminator 2
	movs	r2, r5
	movs	r3, #3
	ands	r3, r2
	bne	.L18
	.loc 1 86 0 is_stmt 1
	b	.L19
.L20:
	.loc 1 88 0
	subs	r4, r4, #4
	subs	r5, r5, #4
	ldr	r3, [r5]
	str	r3, [r4]
	.loc 1 89 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	str	r3, [r7, #4]
.L19:
	.loc 1 86 0
	ldr	r3, [r7, #4]
	cmp	r3, #3
	bhi	.L20
	.loc 1 95 0
	b	.L21
.L22:
	.loc 1 97 0
	subs	r4, r4, #1
	subs	r5, r5, #1
	ldrb	r3, [r5]
	strb	r3, [r4]
	.loc 1 98 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L21:
	.loc 1 95 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L22
	b	.L23
.L15:
.LBE4:
.LBB5:
	.loc 1 103 0
	ldr	r4, [r7, #12]
	.loc 1 104 0
	ldr	r5, [r7, #8]
	.loc 1 105 0
	b	.L24
.L25:
	.loc 1 107 0
	subs	r4, r4, #1
	subs	r5, r5, #1
	ldrb	r3, [r5]
	strb	r3, [r4]
	.loc 1 108 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L24:
	.loc 1 105 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L25
.L23:
.LBE5:
	.loc 1 111 0
	ldr	r3, [r7, #12]
	.loc 1 112 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE33:
	.size	memcpy_r, .-memcpy_r
	.section	.text.memmove,"ax",%progbits
	.align	2
	.global	memmove
	.code	16
	.thumb_func
	.type	memmove, %function
memmove:
.LFB34:
	.loc 1 118 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI6:
	sub	sp, sp, #20
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 119 0
	ldr	r5, [r7, #12]
	.loc 1 120 0
	ldr	r4, [r7, #8]
	.loc 1 123 0
	cmp	r5, r4
	bls	.L28
	.loc 1 123 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	adds	r3, r4, r3
	cmp	r3, r5
	bls	.L28
	.loc 1 125 0 is_stmt 1
	ldr	r3, [r7, #4]
	adds	r4, r4, r3
	.loc 1 126 0
	ldr	r3, [r7, #4]
	adds	r6, r5, r3
	b	.L29
.L30:
	.loc 1 127 0
	subs	r6, r6, #1
	subs	r4, r4, #1
	ldrb	r3, [r4]
	strb	r3, [r6]
.L29:
	.loc 1 126 0 discriminator 1
	ldr	r3, [r7, #4]
	subs	r2, r3, #1
	str	r2, [r7, #4]
	cmp	r3, #0
	bne	.L30
	.loc 1 123 0
	b	.L31
.L28:
	.loc 1 131 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	memcpy
.L31:
	.loc 1 133 0
	movs	r3, r5
	.loc 1 134 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE34:
	.size	memmove, .-memmove
	.section	.text.memset,"ax",%progbits
	.align	2
	.global	memset
	.code	16
	.thumb_func
	.type	memset, %function
memset:
.LFB35:
	.loc 1 140 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 141 0
	ldr	r5, [r7, #12]
	.loc 1 142 0
	cmp	r5, #0
	beq	.L34
.LBB6:
	.loc 1 144 0
	movs	r4, #0
	b	.L35
.L36:
	.loc 1 146 0 discriminator 3
	adds	r3, r5, r4
	ldr	r2, [r7, #8]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 144 0 discriminator 3
	adds	r4, r4, #1
.L35:
	.loc 1 144 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r4, r3
	bcc	.L36
.L34:
.LBE6:
	.loc 1 149 0 is_stmt 1
	ldr	r3, [r7, #12]
	.loc 1 150 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE35:
	.size	memset, .-memset
	.section	.text.memcmp,"ax",%progbits
	.align	2
	.global	memcmp
	.code	16
	.thumb_func
	.type	memcmp, %function
memcmp:
.LFB36:
	.loc 1 156 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI12:
	sub	sp, sp, #20
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 157 0
	ldr	r4, [r7, #12]
	.loc 1 158 0
	ldr	r5, [r7, #8]
.LBB7:
	.loc 1 159 0
	movs	r6, #0
	b	.L39
.L42:
	.loc 1 161 0
	ldrb	r2, [r4]
	ldrb	r3, [r5]
	cmp	r2, r3
	beq	.L40
	.loc 1 163 0
	ldrb	r3, [r4]
	movs	r2, r3
	ldrb	r3, [r5]
	subs	r3, r2, r3
	b	.L41
.L40:
	.loc 1 159 0 discriminator 2
	adds	r6, r6, #1
	adds	r4, r4, #1
	adds	r5, r5, #1
.L39:
	.loc 1 159 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r6, r3
	bcc	.L42
.LBE7:
	.loc 1 166 0 is_stmt 1
	movs	r3, #0
.L41:
	.loc 1 167 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE36:
	.size	memcmp, .-memcmp
	.section	.text.strcpy,"ax",%progbits
	.align	2
	.global	strcpy
	.code	16
	.thumb_func
	.type	strcpy, %function
strcpy:
.LFB37:
	.loc 1 173 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 174 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 175 0
	nop
.L44:
	.loc 1 175 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	adds	r2, r3, #1
	str	r2, [r7, #4]
	ldr	r2, [r7]
	adds	r1, r2, #1
	str	r1, [r7]
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L44
	.loc 1 176 0 is_stmt 1
	ldr	r3, [r7, #12]
	.loc 1 177 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	strcpy, .-strcpy
	.section	.text.strncpy,"ax",%progbits
	.align	2
	.global	strncpy
	.code	16
	.thumb_func
	.type	strncpy, %function
strncpy:
.LFB38:
	.loc 1 183 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #24
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 184 0
	ldr	r3, [r7, #12]
	str	r3, [r7, #20]
	.loc 1 185 0
	nop
.L48:
	.loc 1 185 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	subs	r2, r3, #1
	str	r2, [r7, #4]
	cmp	r3, #0
	beq	.L47
	.loc 1 185 0 discriminator 1
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldr	r2, [r7, #8]
	adds	r1, r2, #1
	str	r1, [r7, #8]
	ldrb	r2, [r2]
	strb	r2, [r3]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L48
.L47:
	.loc 1 186 0 is_stmt 1
	ldr	r3, [r7, #20]
	.loc 1 187 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	strncpy, .-strncpy
	.section	.text.strcmp,"ax",%progbits
	.align	2
	.global	strcmp
	.code	16
	.thumb_func
	.type	strcmp, %function
strcmp:
.LFB39:
	.loc 1 194 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 195 0
	b	.L51
.L53:
	.loc 1 195 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L51:
	.loc 1 195 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L52
	.loc 1 195 0 discriminator 2
	ldr	r3, [r7, #4]
	ldrb	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r2, r3
	beq	.L53
.L52:
	.loc 1 196 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L54
	.loc 1 196 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L54
	.loc 1 197 0 is_stmt 1
	movs	r3, #0
	b	.L55
.L54:
	.loc 1 198 0
	ldr	r3, [r7, #4]
	ldrb	r2, [r3]
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r2, r3
	bcs	.L56
	.loc 1 198 0 is_stmt 0 discriminator 1
	movs	r3, #1
	rsbs	r3, r3, #0
	b	.L58
.L56:
	.loc 1 198 0 discriminator 2
	movs	r3, #1
.L58:
	.loc 1 198 0
	nop
.L55:
	.loc 1 199 0 is_stmt 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	strcmp, .-strcmp
	.section	.text.strcasecmp,"ax",%progbits
	.align	2
	.global	strcasecmp
	.code	16
	.thumb_func
	.type	strcasecmp, %function
strcasecmp:
.LFB40:
	.loc 1 205 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #8
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 206 0
	b	.L60
.L66:
	.loc 1 206 0 is_stmt 0 discriminator 15
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L60:
	.loc 1 206 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L61
	.loc 1 206 0 discriminator 2
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #96
	bls	.L62
	.loc 1 206 0 discriminator 3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #122
	bhi	.L62
	.loc 1 206 0 discriminator 5
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	subs	r3, r3, #32
	movs	r2, r3
	b	.L63
.L62:
	.loc 1 206 0 discriminator 6
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r2, r3
.L63:
	.loc 1 206 0 discriminator 8
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r3, #96
	bls	.L64
	.loc 1 206 0 discriminator 9
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r3, #122
	bhi	.L64
	.loc 1 206 0 discriminator 11
	ldr	r3, [r7]
	ldrb	r3, [r3]
	subs	r3, r3, #32
	b	.L65
.L64:
	.loc 1 206 0 discriminator 12
	ldr	r3, [r7]
	ldrb	r3, [r3]
.L65:
	.loc 1 206 0 discriminator 14
	cmp	r2, r3
	beq	.L66
.L61:
	.loc 1 207 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L67
	.loc 1 207 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L67
	.loc 1 208 0 is_stmt 1
	movs	r3, #0
	b	.L68
.L67:
	.loc 1 209 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #96
	bls	.L69
	.loc 1 209 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #122
	bhi	.L69
	.loc 1 209 0 discriminator 3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	subs	r3, r3, #32
	movs	r2, r3
	b	.L70
.L69:
	.loc 1 209 0 discriminator 4
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r2, r3
.L70:
	.loc 1 209 0 discriminator 6
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r3, #96
	bls	.L71
	.loc 1 209 0 discriminator 7
	ldr	r3, [r7]
	ldrb	r3, [r3]
	cmp	r3, #122
	bhi	.L71
	.loc 1 209 0 discriminator 9
	ldr	r3, [r7]
	ldrb	r3, [r3]
	subs	r3, r3, #32
	b	.L72
.L71:
	.loc 1 209 0 discriminator 10
	ldr	r3, [r7]
	ldrb	r3, [r3]
.L72:
	.loc 1 209 0 discriminator 12
	cmp	r2, r3
	bge	.L73
	.loc 1 209 0 discriminator 13
	movs	r3, #1
	rsbs	r3, r3, #0
	b	.L75
.L73:
	.loc 1 209 0 discriminator 14
	movs	r3, #1
.L75:
	.loc 1 209 0
	nop
.L68:
	.loc 1 210 0 is_stmt 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE40:
	.size	strcasecmp, .-strcasecmp
	.section	.text.strncmp,"ax",%progbits
	.align	2
	.global	strncmp
	.code	16
	.thumb_func
	.type	strncmp, %function
strncmp:
.LFB41:
	.loc 1 216 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 217 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L77
	.loc 1 219 0
	b	.L78
.L80:
	.loc 1 221 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
	.loc 1 222 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L78:
	.loc 1 219 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L79
	.loc 1 219 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L79
	.loc 1 219 0 discriminator 2
	ldr	r3, [r7, #12]
	ldrb	r2, [r3]
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r2, r3
	beq	.L80
.L79:
	.loc 1 224 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	subs	r3, r2, r3
	b	.L81
.L77:
	.loc 1 226 0
	movs	r3, #0
.L81:
	.loc 1 227 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	strncmp, .-strncmp
	.section	.text.strncasecmp,"ax",%progbits
	.align	2
	.global	strncasecmp
	.code	16
	.thumb_func
	.type	strncasecmp, %function
strncasecmp:
.LFB42:
	.loc 1 233 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI30:
	sub	sp, sp, #16
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
.L86:
	.loc 1 237 0
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldrb	r3, [r3]
	movs	r4, r3
	cmp	r4, #64
	ble	.L83
	.loc 1 237 0 is_stmt 0 discriminator 1
	cmp	r4, #90
	bgt	.L83
	.loc 1 237 0 discriminator 2
	adds	r4, r4, #32
.L83:
	.loc 1 238 0 is_stmt 1
	ldr	r3, [r7, #8]
	adds	r2, r3, #1
	str	r2, [r7, #8]
	ldrb	r3, [r3]
	movs	r5, r3
	cmp	r5, #64
	ble	.L84
	.loc 1 238 0 is_stmt 0 discriminator 1
	cmp	r5, #90
	bgt	.L84
	.loc 1 238 0 discriminator 2
	adds	r5, r5, #32
.L84:
	.loc 1 239 0 is_stmt 1
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L85
	.loc 1 239 0 is_stmt 0 discriminator 1
	cmp	r4, #0
	beq	.L85
	.loc 1 239 0 discriminator 2
	cmp	r4, r5
	beq	.L86
.L85:
	.loc 1 240 0 is_stmt 1
	subs	r3, r4, r5
	.loc 1 241 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE42:
	.size	strncasecmp, .-strncasecmp
	.section	.text.strlen,"ax",%progbits
	.align	2
	.global	strlen
	.code	16
	.thumb_func
	.type	strlen, %function
strlen:
.LFB43:
	.loc 1 247 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI33:
	sub	sp, sp, #8
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	.loc 1 248 0
	movs	r4, #0
	.loc 1 249 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L89
.LBB8:
	.loc 1 251 0
	ldr	r5, [r7, #4]
	b	.L90
.L91:
	.loc 1 251 0 is_stmt 0 discriminator 3
	adds	r4, r4, #1
.L90:
	.loc 1 251 0 discriminator 1
	movs	r3, r5
	adds	r5, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L91
.L89:
.LBE8:
	.loc 1 253 0 is_stmt 1
	movs	r3, r4
	.loc 1 254 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE43:
	.size	strlen, .-strlen
	.section	.text.strchr,"ax",%progbits
	.align	2
	.global	strchr
	.code	16
	.thumb_func
	.type	strchr, %function
strchr:
.LFB44:
	.loc 1 260 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI36:
	sub	sp, sp, #8
.LCFI37:
	add	r7, sp, #0
.LCFI38:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 261 0
	b	.L94
.L97:
	.loc 1 263 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L95
	.loc 1 264 0
	ldr	r3, [r7, #4]
	b	.L96
.L95:
	.loc 1 265 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L94:
	.loc 1 261 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L97
	.loc 1 267 0
	movs	r3, #0
.L96:
	.loc 1 268 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE44:
	.size	strchr, .-strchr
	.section	.text.strcat,"ax",%progbits
	.align	2
	.global	strcat
	.code	16
	.thumb_func
	.type	strcat, %function
strcat:
.LFB45:
	.loc 1 274 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #16
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 275 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	.loc 1 276 0
	b	.L99
.L100:
	.loc 1 276 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L99:
	.loc 1 276 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L100
.L101:
	.loc 1 279 0 is_stmt 1 discriminator 1
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldr	r2, [r7]
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 280 0 discriminator 1
	ldr	r3, [r7]
	adds	r2, r3, #1
	str	r2, [r7]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L101
	.loc 1 281 0
	ldr	r3, [r7, #4]
	.loc 1 282 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE45:
	.size	strcat, .-strcat
	.section	.text.atoi,"ax",%progbits
	.align	2
	.global	atoi
	.code	16
	.thumb_func
	.type	atoi, %function
atoi:
.LFB46:
	.loc 1 288 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI42:
	sub	sp, sp, #16
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	.loc 1 289 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 290 0
	b	.L104
.L106:
	.loc 1 290 0 is_stmt 0 discriminator 6
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L104:
	.loc 1 290 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L105
	.loc 1 290 0 discriminator 2
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L106
.L105:
	.loc 1 290 0 discriminator 5
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L106
	.loc 1 291 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L107
.LBB9:
	.loc 1 293 0
	movs	r4, #1
	.loc 1 294 0
	movs	r5, #1
	.loc 1 295 0
	b	.L108
.L110:
	.loc 1 296 0
	adds	r4, r4, #1
.L108:
	.loc 1 295 0
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L109
	.loc 1 295 0 is_stmt 0 discriminator 1
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L110
.L109:
	.loc 1 295 0 discriminator 3
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #45
	beq	.L110
	.loc 1 295 0 discriminator 4
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #46
	beq	.L110
	.loc 1 297 0 is_stmt 1
	subs	r4, r4, #1
	b	.L111
.L116:
	.loc 1 299 0
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #45
	bne	.L112
	.loc 1 301 0
	ldr	r3, [r7, #12]
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
	.loc 1 302 0
	b	.L107
.L112:
	.loc 1 304 0
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #46
	bne	.L113
	.loc 1 306 0
	movs	r5, #1
	.loc 1 307 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L114
.L113:
	.loc 1 311 0
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	subs	r3, r3, #48
	muls	r3, r5
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 312 0
	movs	r3, r5
	lsls	r3, r3, #2
	adds	r3, r3, r5
	lsls	r3, r3, #1
	movs	r5, r3
.L114:
	.loc 1 297 0 discriminator 2
	subs	r4, r4, #1
.L111:
	.loc 1 297 0 is_stmt 0 discriminator 1
	cmp	r4, #0
	blt	.L107
	.loc 1 297 0 discriminator 3
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L115
	.loc 1 297 0 discriminator 4
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L116
.L115:
	.loc 1 297 0 discriminator 6
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #46
	beq	.L116
	.loc 1 297 0 discriminator 7
	movs	r2, r4
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #45
	beq	.L116
.L107:
.LBE9:
	.loc 1 316 0 is_stmt 1
	ldr	r3, [r7, #12]
	.loc 1 317 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE46:
	.size	atoi, .-atoi
	.global	__aeabi_lmul
	.section	.text.atoll,"ax",%progbits
	.align	2
	.global	atoll
	.code	16
	.thumb_func
	.type	atoll, %function
atoll:
.LFB47:
	.loc 1 324 0
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI45:
	sub	sp, sp, #40
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #28]
	.loc 1 325 0
	movs	r3, #0
	movs	r4, #0
	str	r3, [r7, #32]
	str	r4, [r7, #36]
	.loc 1 326 0
	b	.L119
.L121:
	.loc 1 326 0 is_stmt 0 discriminator 6
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L119:
	.loc 1 326 0 discriminator 1
	ldr	r3, [r7, #28]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L120
	.loc 1 326 0 discriminator 2
	ldr	r3, [r7, #28]
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L121
.L120:
	.loc 1 326 0 discriminator 5
	ldr	r3, [r7, #28]
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L121
	.loc 1 327 0 is_stmt 1
	ldr	r3, [r7, #28]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.LCB1336
	b	.L122	@long jump
.LCB1336:
.LBB10:
	.loc 1 329 0
	movs	r4, #1
	movs	r5, #0
	.loc 1 330 0
	movs	r2, #1
	movs	r3, #0
	str	r2, [r7, #16]
	str	r3, [r7, #20]
	.loc 1 331 0
	b	.L123
.L125:
	.loc 1 332 0
	movs	r2, #1
	movs	r3, #0
	adds	r4, r4, r2
	adcs	r5, r5, r3
.L123:
	.loc 1 331 0
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L124
	.loc 1 331 0 is_stmt 0 discriminator 1
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L125
.L124:
	.loc 1 331 0 discriminator 3
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #45
	beq	.L125
	.loc 1 331 0 discriminator 4
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #46
	beq	.L125
	.loc 1 333 0 is_stmt 1
	movs	r2, #1
	rsbs	r2, r2, #0
	asrs	r3, r2, #31
	adds	r4, r4, r2
	adcs	r5, r5, r3
	b	.L126
.L132:
	.loc 1 335 0
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #45
	bne	.L127
	.loc 1 337 0
	ldr	r1, [r7, #32]
	ldr	r2, [r7, #36]
	movs	r4, #0
	rsbs	r3, r1, #0
	sbcs	r4, r2
	str	r3, [r7, #32]
	str	r4, [r7, #36]
	.loc 1 338 0
	b	.L122
.L127:
	.loc 1 340 0
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #46
	bne	.L128
	.loc 1 342 0
	movs	r2, #1
	movs	r3, #0
	str	r2, [r7, #16]
	str	r3, [r7, #20]
	.loc 1 343 0
	movs	r2, #0
	movs	r3, #0
	str	r2, [r7, #32]
	str	r3, [r7, #36]
	b	.L129
.L128:
	.loc 1 347 0
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	subs	r3, r3, #48
	str	r3, [r7]
	asrs	r3, r3, #31
	str	r3, [r7, #4]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	ldr	r0, [r7]
	ldr	r1, [r7, #4]
	bl	__aeabi_lmul
	movs	r2, r0
	movs	r3, r1
	movs	r0, r2
	movs	r1, r3
	ldr	r2, [r7, #32]
	ldr	r3, [r7, #36]
	adds	r2, r2, r0
	adcs	r3, r3, r1
	str	r2, [r7, #32]
	str	r3, [r7, #36]
	.loc 1 348 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	lsrs	r1, r2, #30
	lsls	r0, r3, #2
	str	r0, [r7, #12]
	ldr	r0, [r7, #12]
	orrs	r0, r1
	str	r0, [r7, #12]
	lsls	r3, r2, #2
	str	r3, [r7, #8]
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #20]
	ldr	r0, [r7, #8]
	ldr	r1, [r7, #12]
	adds	r2, r2, r0
	adcs	r3, r3, r1
	adds	r2, r2, r2
	adcs	r3, r3, r3
	str	r2, [r7, #16]
	str	r3, [r7, #20]
.L129:
	.loc 1 333 0 discriminator 2
	movs	r2, #1
	rsbs	r2, r2, #0
	asrs	r3, r2, #31
	adds	r4, r4, r2
	adcs	r5, r5, r3
.L126:
	.loc 1 333 0 is_stmt 0 discriminator 1
	cmp	r5, #0
	blt	.L122
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L131
	.loc 1 333 0 discriminator 4
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L132
.L131:
	.loc 1 333 0 discriminator 6
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #46
	beq	.L132
	.loc 1 333 0 discriminator 7
	movs	r2, r4
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #45
	beq	.L132
.L122:
.LBE10:
	.loc 1 352 0 is_stmt 1
	ldr	r3, [r7, #32]
	ldr	r4, [r7, #36]
	.loc 1 353 0
	movs	r0, r3
	movs	r1, r4
	mov	sp, r7
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE47:
	.size	atoll, .-atoll
	.section	.text.strdup,"ax",%progbits
	.align	2
	.global	strdup
	.code	16
	.thumb_func
	.type	strdup, %function
strdup:
.LFB48:
	.loc 1 357 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #16
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #4]
	.loc 1 358 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	strlen
	movs	r3, r0
	adds	r3, r3, #1
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 359 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L135
	.loc 1 361 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	strcpy
.L135:
	.loc 1 363 0
	nop
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE48:
	.size	strdup, .-strdup
	.section	.text.strncat,"ax",%progbits
	.align	2
	.global	strncat
	.code	16
	.thumb_func
	.type	strncat, %function
strncat:
.LFB49:
	.loc 1 370 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #24
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 371 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L137
.LBB11:
	.loc 1 373 0
	ldr	r3, [r7, #12]
	str	r3, [r7, #20]
	.loc 1 374 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #16]
	.loc 1 375 0
	b	.L138
.L139:
	.loc 1 376 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L138:
	.loc 1 375 0
	ldr	r3, [r7, #20]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L139
.L142:
	.loc 1 378 0
	ldr	r3, [r7, #16]
	adds	r2, r3, #1
	str	r2, [r7, #16]
	ldrb	r2, [r3]
	ldr	r3, [r7, #20]
	strb	r2, [r3]
	ldr	r3, [r7, #20]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L144
	.loc 1 380 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	.loc 1 381 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L142
	b	.L141
.L144:
	.loc 1 379 0
	nop
.L141:
	.loc 1 382 0
	ldr	r3, [r7, #20]
	movs	r2, #0
	strb	r2, [r3]
.L137:
.LBE11:
	.loc 1 384 0
	ldr	r3, [r7, #12]
	.loc 1 385 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE49:
	.size	strncat, .-strncat
	.section	.text.strcspn,"ax",%progbits
	.align	2
	.global	strcspn
	.code	16
	.thumb_func
	.type	strcspn, %function
strcspn:
.LFB50:
	.loc 1 388 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #16
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 391 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L146
.L153:
	.loc 1 392 0
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L147
.L150:
	.loc 1 393 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	adds	r3, r2, r3
	ldrb	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r1, [r7, #4]
	adds	r3, r1, r3
	ldrb	r3, [r3]
	cmp	r2, r3
	beq	.L155
	.loc 1 392 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L147:
	.loc 1 392 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L150
	b	.L149
.L155:
	.loc 1 394 0 is_stmt 1
	nop
.L149:
	.loc 1 396 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L156
	.loc 1 391 0 discriminator 2
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L146:
	.loc 1 391 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L153
	b	.L152
.L156:
	.loc 1 397 0 is_stmt 1
	nop
.L152:
	.loc 1 399 0
	ldr	r3, [r7, #12]
	.loc 1 400 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE50:
	.size	strcspn, .-strcspn
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
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x20
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
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x28
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0x28
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
	.uleb128 0x20
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xe
	.uleb128 0x10
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x38
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
	.uleb128 0x18
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xe
	.uleb128 0x20
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI56-.LCFI55
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x738
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0xc
	.4byte	.LASF45
	.4byte	.LASF46
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
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x23
	.4byte	0x65
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
	.uleb128 0x6
	.byte	0x4
	.4byte	0x82
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8f
	.uleb128 0x7
	.4byte	0x82
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x16
	.4byte	0x53
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0x15
	.4byte	0x73
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x150
	.uleb128 0x9
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x150
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x15
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x12b
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1a
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1b
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x23
	.4byte	0x157
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x24
	.4byte	0x157
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0xd
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x36
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x37
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x156
	.uleb128 0xe
	.uleb128 0x6
	.byte	0x4
	.4byte	0x48
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x44
	.4byte	0x73
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x207
	.uleb128 0x9
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x150
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.4byte	.LASF13
	.byte	0x1
	.byte	0x44
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x1e2
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4b
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4c
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x54
	.4byte	0x157
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x55
	.4byte	0x157
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0xd
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x67
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x68
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x1
	.byte	0x75
	.4byte	0x73
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x270
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x75
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x75
	.4byte	0x150
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0x75
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x11
	.ascii	"src\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x1
	.byte	0x79
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x56
	.byte	0
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x1
	.byte	0x8b
	.4byte	0x73
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ce
	.uleb128 0x9
	.ascii	"s\000"
	.byte	0x1
	.byte	0x8b
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x8b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0x8b
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii	"p\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x2ce
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x11
	.ascii	"j\000"
	.byte	0x1
	.byte	0x90
	.4byte	0x9b
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x9b
	.4byte	0x41
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x341
	.uleb128 0x9
	.ascii	"s1\000"
	.byte	0x1
	.byte	0x9b
	.4byte	0x150
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x9
	.ascii	"s2\000"
	.byte	0x1
	.byte	0x9b
	.4byte	0x150
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0x9b
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"cs\000"
	.byte	0x1
	.byte	0x9d
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x11
	.ascii	"ct\000"
	.byte	0x1
	.byte	0x9e
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9f
	.4byte	0x9b
	.uleb128 0x1
	.byte	0x56
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x1
	.byte	0xac
	.4byte	0x7c
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x383
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x1
	.byte	0xac
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x1
	.byte	0xac
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.ascii	"p\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x1
	.byte	0xb6
	.4byte	0x7c
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d3
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x1
	.byte	0xb6
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"src\000"
	.byte	0x1
	.byte	0xb6
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"len\000"
	.byte	0x1
	.byte	0xb6
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii	"p\000"
	.byte	0x1
	.byte	0xb8
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x1
	.byte	0xc1
	.4byte	0x41
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x407
	.uleb128 0x9
	.ascii	"s1\000"
	.byte	0x1
	.byte	0xc1
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"s2\000"
	.byte	0x1
	.byte	0xc1
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x1
	.byte	0xcc
	.4byte	0x41
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x43b
	.uleb128 0x9
	.ascii	"s1\000"
	.byte	0x1
	.byte	0xcc
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"s2\000"
	.byte	0x1
	.byte	0xcc
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x1
	.byte	0xd7
	.4byte	0x41
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x47b
	.uleb128 0x9
	.ascii	"s1\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"s2\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0xd7
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x1
	.byte	0xe8
	.4byte	0x41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4d1
	.uleb128 0x9
	.ascii	"s1\000"
	.byte	0x1
	.byte	0xe8
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"s2\000"
	.byte	0x1
	.byte	0xe8
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0xe8
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x11
	.ascii	"f\000"
	.byte	0x1
	.byte	0xea
	.4byte	0x41
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x11
	.ascii	"l\000"
	.byte	0x1
	.byte	0xea
	.4byte	0x41
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x1
	.byte	0xf6
	.4byte	0x9b
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x519
	.uleb128 0x9
	.ascii	"str\000"
	.byte	0x1
	.byte	0xf6
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0xf8
	.4byte	0x9b
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xd
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x11
	.ascii	"p\000"
	.byte	0x1
	.byte	0xfb
	.4byte	0x7c
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x103
	.4byte	0x7c
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x54e
	.uleb128 0x13
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x103
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x103
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x111
	.4byte	0x7c
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x594
	.uleb128 0x14
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x111
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x111
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x113
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x11f
	.4byte	0x41
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f0
	.uleb128 0x13
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x11f
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x121
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x125
	.4byte	0x41
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x126
	.4byte	0x41
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x143
	.4byte	0x5a
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x64f
	.uleb128 0x13
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x143
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x15
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x145
	.4byte	0x5a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x149
	.4byte	0x5a
	.uleb128 0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x18
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x14a
	.4byte	0x5a
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x164
	.4byte	0x7c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x686
	.uleb128 0x13
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x164
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x166
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x171
	.4byte	0x7c
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6f0
	.uleb128 0x13
	.ascii	"dst\000"
	.byte	0x1
	.2byte	0x171
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"src\000"
	.byte	0x1
	.2byte	0x171
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x171
	.4byte	0x9b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x15
	.ascii	"d\000"
	.byte	0x1
	.2byte	0x175
	.4byte	0x7c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x176
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x183
	.4byte	0x9b
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x183
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x183
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x185
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x15
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x185
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
	.uleb128 0x9
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xec
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x73c
	.4byte	0xa6
	.ascii	"memcpy\000"
	.4byte	0x15d
	.ascii	"memcpy_r\000"
	.4byte	0x207
	.ascii	"memmove\000"
	.4byte	0x270
	.ascii	"memset\000"
	.4byte	0x2d4
	.ascii	"memcmp\000"
	.4byte	0x341
	.ascii	"strcpy\000"
	.4byte	0x383
	.ascii	"strncpy\000"
	.4byte	0x3d3
	.ascii	"strcmp\000"
	.4byte	0x407
	.ascii	"strcasecmp\000"
	.4byte	0x43b
	.ascii	"strncmp\000"
	.4byte	0x47b
	.ascii	"strncasecmp\000"
	.4byte	0x4d1
	.ascii	"strlen\000"
	.4byte	0x519
	.ascii	"strchr\000"
	.4byte	0x54e
	.ascii	"strcat\000"
	.4byte	0x594
	.ascii	"atoi\000"
	.4byte	0x5f0
	.ascii	"atoll\000"
	.4byte	0x64f
	.ascii	"strdup\000"
	.4byte	0x686
	.ascii	"strncat\000"
	.4byte	0x6f0
	.ascii	"strcspn\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xe2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x73c
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
	.4byte	0x53
	.ascii	"unsigned int\000"
	.4byte	0x48
	.ascii	"uint32_t\000"
	.4byte	0x65
	.ascii	"long long int\000"
	.4byte	0x5a
	.ascii	"int64_t\000"
	.4byte	0x6c
	.ascii	"long long unsigned int\000"
	.4byte	0x75
	.ascii	"long int\000"
	.4byte	0x82
	.ascii	"char\000"
	.4byte	0x94
	.ascii	"sizetype\000"
	.4byte	0x9b
	.ascii	"size_t\000"
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
.LASF29:
	.ascii	"strncpy\000"
.LASF24:
	.ascii	"svdst\000"
.LASF28:
	.ascii	"dest\000"
.LASF39:
	.ascii	"multiplier\000"
.LASF2:
	.ascii	"short int\000"
.LASF12:
	.ascii	"size_t\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"long long int\000"
.LASF20:
	.ascii	"memcpy\000"
.LASF32:
	.ascii	"strncmp\000"
.LASF45:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/l"
	.ascii	"ib/string.c\000"
.LASF6:
	.ascii	"int64_t\000"
.LASF19:
	.ascii	"p_src\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF23:
	.ascii	"vsrc\000"
.LASF15:
	.ascii	"p_src_c\000"
.LASF26:
	.ascii	"memcmp\000"
.LASF14:
	.ascii	"p_dst_c\000"
.LASF22:
	.ascii	"vdst\000"
.LASF25:
	.ascii	"memset\000"
.LASF9:
	.ascii	"long int\000"
.LASF17:
	.ascii	"p_src_w\000"
.LASF42:
	.ascii	"other\000"
.LASF16:
	.ascii	"p_dst_w\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF21:
	.ascii	"memmove\000"
.LASF37:
	.ascii	"atoi\000"
.LASF35:
	.ascii	"strchr\000"
.LASF0:
	.ascii	"signed char\000"
.LASF18:
	.ascii	"p_dst\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF40:
	.ascii	"atoll\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF48:
	.ascii	"strcspn\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF10:
	.ascii	"char\000"
.LASF36:
	.ascii	"strcat\000"
.LASF34:
	.ascii	"strlen\000"
.LASF33:
	.ascii	"strncasecmp\000"
.LASF27:
	.ascii	"strcpy\000"
.LASF47:
	.ascii	"memcpy_r\000"
.LASF46:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF13:
	.ascii	"size\000"
.LASF30:
	.ascii	"strcmp\000"
.LASF44:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF41:
	.ascii	"strdup\000"
.LASF38:
	.ascii	"digit\000"
.LASF31:
	.ascii	"strcasecmp\000"
.LASF43:
	.ascii	"strncat\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
