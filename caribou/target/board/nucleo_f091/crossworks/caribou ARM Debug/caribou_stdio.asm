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
	.file	"stdio.c"
	.text
.Ltext0:
	.global	_stdin
	.section	.bss._stdin,"aw",%nobits
	.align	2
	.type	_stdin, %object
	.size	_stdin, 4
_stdin:
	.space	4
	.global	_stdout
	.section	.bss._stdout,"aw",%nobits
	.align	2
	.type	_stdout, %object
	.size	_stdout, 4
_stdout:
	.space	4
	.global	_stderr
	.section	.bss._stderr,"aw",%nobits
	.align	2
	.type	_stderr, %object
	.size	_stderr, 4
_stderr:
	.space	4
	.section	.text._getbase,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_getbase, %function
_getbase:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/lib/stdio.c"
	.loc 1 43 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 44 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #48
	bne	.L2
	.loc 1 45 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #111
	beq	.L4
	bgt	.L5
	cmp	r3, #110
	beq	.L6
	b	.L3
.L5:
	cmp	r3, #116
	beq	.L6
	cmp	r3, #120
	bne	.L3
	.loc 1 47 0
	ldr	r3, [r7]
	movs	r2, #16
	str	r2, [r3]
	.loc 1 48 0
	b	.L8
.L6:
	.loc 1 50 0
	ldr	r3, [r7]
	movs	r2, #10
	str	r2, [r3]
	.loc 1 51 0
	b	.L8
.L4:
	.loc 1 53 0
	ldr	r3, [r7]
	movs	r2, #8
	str	r2, [r3]
	.loc 1 54 0
	b	.L8
.L3:
	.loc 1 56 0
	ldr	r3, [r7]
	movs	r2, #10
	str	r2, [r3]
	.loc 1 57 0
	ldr	r3, [r7, #4]
	b	.L9
.L8:
	.loc 1 59 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #2
	b	.L9
.L2:
	.loc 1 61 0
	ldr	r3, [r7]
	movs	r2, #10
	str	r2, [r3]
	.loc 1 62 0
	ldr	r3, [r7, #4]
.L9:
	.loc 1 63 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	_getbase, .-_getbase
	.global	__aeabi_lmul
	.section	.text._atob,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_atob, %function
_atob:
.LFB33:
	.loc 1 70 0
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI3:
	sub	sp, sp, #88
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #28]
	str	r1, [r7, #24]
	str	r2, [r7, #20]
	.loc 1 75 0
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #48
	bne	.L11
	.loc 1 75 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #120
	beq	.L12
	.loc 1 75 0 discriminator 2
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #88
	bne	.L11
.L12:
	.loc 1 76 0 is_stmt 1
	movs	r3, #16
	str	r3, [r7, #20]
	.loc 1 77 0
	ldr	r3, [r7, #24]
	adds	r3, r3, #2
	str	r3, [r7, #24]
.L11:
	.loc 1 80 0
	ldr	r3, [r7, #20]
	cmp	r3, #16
	bne	.L13
	.loc 1 80 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	movs	r1, #46
	movs	r0, r3
	bl	strchr
	movs	r3, r0
	str	r3, [r7, #72]
	ldr	r3, [r7, #72]
	cmp	r3, #0
	beq	.L13
	.loc 1 81 0 is_stmt 1
	ldr	r2, [r7, #72]
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	cmp	r3, #19
	bls	.L14
	.loc 1 82 0
	movs	r3, #0
	b	.L26
.L14:
	.loc 1 84 0
	ldr	r2, [r7, #72]
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	movs	r2, r3
	ldr	r1, [r7, #24]
	movs	r3, #20
	movs	r0, #16
	mov	ip, r0
	add	ip, ip, r7
	add	r3, r3, ip
	movs	r0, r3
	bl	strncpy
	.loc 1 85 0
	ldr	r2, [r7, #72]
	ldr	r3, [r7, #24]
	subs	r3, r2, r3
	movs	r2, #20
	movs	r1, #16
	mov	ip, r1
	add	ip, ip, r7
	add	r2, r2, ip
	movs	r1, #0
	strb	r1, [r2, r3]
	.loc 1 86 0
	movs	r3, #20
	movs	r2, #16
	adds	r2, r7, r2
	adds	r1, r2, r3
	movs	r3, #48
	movs	r2, #16
	mov	ip, r2
	add	ip, ip, r7
	add	r3, r3, ip
	movs	r2, #16
	movs	r0, r3
	bl	_atob
	subs	r3, r0, #0
	bne	.L16
	.loc 1 87 0
	movs	r3, #0
	b	.L26
.L16:
	.loc 1 89 0
	ldr	r3, [r7, #72]
	adds	r3, r3, #1
	str	r3, [r7, #72]
	.loc 1 90 0
	ldr	r3, [r7, #72]
	movs	r1, #46
	movs	r0, r3
	bl	strchr
	subs	r3, r0, #0
	beq	.L17
	.loc 1 91 0
	movs	r3, #0
	b	.L26
.L17:
	.loc 1 93 0
	ldr	r1, [r7, #72]
	movs	r3, #40
	movs	r2, #16
	mov	ip, r2
	add	ip, ip, r7
	add	r3, r3, ip
	movs	r2, #16
	movs	r0, r3
	bl	_atob
	subs	r3, r0, #0
	bne	.L18
	.loc 1 94 0
	movs	r3, #0
	b	.L26
.L18:
	.loc 1 95 0
	ldr	r2, [r7, #64]
	ldr	r3, [r7, #68]
	lsrs	r1, r2, #16
	lsls	r5, r3, #16
	orrs	r5, r1
	lsls	r4, r2, #16
	ldr	r2, [r7, #56]
	ldr	r3, [r7, #60]
	adds	r4, r4, r2
	adcs	r5, r5, r3
	movs	r3, r4
	movs	r4, r5
	ldr	r2, [r7, #28]
	str	r3, [r2]
	str	r4, [r2, #4]
	.loc 1 96 0
	movs	r3, #1
	b	.L26
.L13:
	.loc 1 99 0
	ldr	r2, [r7, #28]
	movs	r3, #0
	movs	r4, #0
	str	r3, [r2]
	str	r4, [r2, #4]
	ldr	r3, [r7, #28]
	ldr	r4, [r3, #4]
	ldr	r3, [r3]
	str	r3, [r7, #80]
	str	r4, [r7, #84]
	.loc 1 100 0
	b	.L19
.L25:
	.loc 1 101 0
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L20
	.loc 1 101 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #57
	bhi	.L20
	.loc 1 102 0 is_stmt 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	subs	r3, r3, #48
	str	r3, [r7, #76]
	b	.L21
.L20:
	.loc 1 103 0
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #96
	bls	.L22
	.loc 1 103 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #102
	bhi	.L22
	.loc 1 104 0 is_stmt 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	subs	r3, r3, #87
	str	r3, [r7, #76]
	b	.L21
.L22:
	.loc 1 105 0
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #64
	bls	.L23
	.loc 1 105 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #70
	bhi	.L23
	.loc 1 106 0 is_stmt 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	subs	r3, r3, #55
	str	r3, [r7, #76]
	b	.L21
.L23:
	.loc 1 108 0
	movs	r3, #0
	b	.L26
.L21:
	.loc 1 110 0
	ldr	r2, [r7, #76]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	blt	.L24
	.loc 1 111 0
	movs	r3, #0
	b	.L26
.L24:
	.loc 1 112 0
	ldr	r3, [r7, #20]
	str	r3, [r7, #8]
	asrs	r3, r3, #31
	str	r3, [r7, #12]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	ldr	r0, [r7, #80]
	ldr	r1, [r7, #84]
	bl	__aeabi_lmul
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #80]
	str	r4, [r7, #84]
	.loc 1 113 0
	ldr	r3, [r7, #76]
	str	r3, [r7]
	asrs	r3, r3, #31
	str	r3, [r7, #4]
	ldr	r3, [r7, #80]
	ldr	r4, [r7, #84]
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	adds	r3, r3, r1
	adcs	r4, r4, r2
	str	r3, [r7, #80]
	str	r4, [r7, #84]
	.loc 1 100 0
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	str	r3, [r7, #24]
.L19:
	.loc 1 100 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L25
	.loc 1 115 0 is_stmt 1
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #80]
	ldr	r4, [r7, #84]
	str	r3, [r2]
	str	r4, [r2, #4]
	.loc 1 116 0
	movs	r3, #1
.L26:
	.loc 1 117 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #88
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE33:
	.size	_atob, .-_atob
	.section	.text.atob,"ax",%progbits
	.align	2
	.global	atob
	.code	16
	.thumb_func
	.type	atob, %function
atob:
.LFB34:
	.loc 1 124 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI6:
	sub	sp, sp, #28
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 127 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L28
	.loc 1 128 0
	adds	r2, r7, #4
	ldr	r3, [r7, #8]
	movs	r1, r2
	movs	r0, r3
	bl	_getbase
	movs	r3, r0
	str	r3, [r7, #8]
.L28:
	.loc 1 129 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	movs	r3, #16
	adds	r3, r7, r3
	movs	r0, r3
	bl	_atob
	subs	r3, r0, #0
	beq	.L29
	.loc 1 130 0
	ldr	r3, [r7, #16]
	ldr	r4, [r7, #20]
	movs	r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 1 131 0
	movs	r3, #1
	b	.L31
.L29:
	.loc 1 133 0
	movs	r3, #0
.L31:
	.loc 1 134 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE34:
	.size	atob, .-atob
	.section	.text.llatob,"ax",%progbits
	.align	2
	.global	llatob
	.code	16
	.thumb_func
	.type	llatob, %function
llatob:
.LFB35:
	.loc 1 142 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 143 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L33
	.loc 1 144 0
	adds	r2, r7, #4
	ldr	r3, [r7, #8]
	movs	r1, r2
	movs	r0, r3
	bl	_getbase
	movs	r3, r0
	str	r3, [r7, #8]
.L33:
	.loc 1 145 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	_atob
	movs	r3, r0
	.loc 1 146 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	llatob, .-llatob
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"-\000"
	.section	.text.btoa,"ax",%progbits
	.align	2
	.global	btoa
	.code	16
	.thumb_func
	.type	btoa, %function
btoa:
.LFB36:
	.loc 1 154 0
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #72
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 158 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L36
	.loc 1 159 0
	ldr	r3, [r7, #12]
	movs	r2, #48
	strb	r2, [r3]
	.loc 1 160 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 161 0
	ldr	r3, [r7, #12]
	b	.L46
.L36:
	.loc 1 164 0
	movs	r3, #0
	str	r3, [r7, #56]
	.loc 1 165 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #10
	bne	.L38
	.loc 1 166 0
	movs	r3, #10
	str	r3, [r7, #4]
	.loc 1 167 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bge	.L38
	.loc 1 168 0
	ldr	r3, [r7, #8]
	rsbs	r3, r3, #0
	str	r3, [r7, #8]
	.loc 1 169 0
	movs	r3, #1
	str	r3, [r7, #56]
.L38:
	.loc 1 173 0
	movs	r3, #0
	str	r3, [r7, #64]
	b	.L39
.L42:
	.loc 1 174 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	movs	r1, r2
	movs	r0, r3
	bl	__aeabi_uidivmod
	movs	r3, r1
	str	r3, [r7, #52]
	.loc 1 175 0
	ldr	r3, [r7, #4]
	movs	r1, r3
	ldr	r0, [r7, #8]
	bl	__aeabi_uidiv
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 176 0
	ldr	r3, [r7, #52]
	cmp	r3, #0
	blt	.L40
	.loc 1 176 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #52]
	cmp	r3, #9
	bgt	.L40
	.loc 1 177 0 is_stmt 1
	ldr	r3, [r7, #52]
	uxtb	r2, r3
	movs	r3, #71
	adds	r3, r7, r3
	adds	r2, r2, #48
	strb	r2, [r3]
	b	.L41
.L40:
	.loc 1 178 0
	ldr	r3, [r7, #52]
	cmp	r3, #9
	ble	.L41
	.loc 1 178 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #52]
	cmp	r3, #36
	bgt	.L41
	.loc 1 179 0 is_stmt 1
	ldr	r3, [r7, #52]
	uxtb	r2, r3
	movs	r3, #71
	adds	r3, r7, r3
	adds	r2, r2, #87
	strb	r2, [r3]
.L41:
	.loc 1 180 0 discriminator 2
	movs	r3, #16
	adds	r2, r7, r3
	ldr	r3, [r7, #64]
	adds	r3, r2, r3
	movs	r2, #71
	adds	r2, r7, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 173 0 discriminator 2
	ldr	r3, [r7, #64]
	adds	r3, r3, #1
	str	r3, [r7, #64]
.L39:
	.loc 1 173 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L42
	.loc 1 183 0 is_stmt 1
	movs	r3, #16
	adds	r2, r7, r3
	ldr	r3, [r7, #64]
	adds	r3, r2, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 184 0
	ldr	r3, [r7, #56]
	cmp	r3, #0
	beq	.L43
	.loc 1 185 0
	ldr	r2, .L47
	movs	r3, #16
	adds	r3, r7, r3
	movs	r1, r2
	movs	r0, r3
	bl	strcat
.L43:
	.loc 1 188 0
	movs	r3, #0
	str	r3, [r7, #64]
	movs	r3, #16
	adds	r3, r7, r3
	movs	r0, r3
	bl	strlen
	movs	r3, r0
	subs	r3, r3, #1
	str	r3, [r7, #60]
	b	.L44
.L45:
	.loc 1 189 0 discriminator 3
	ldr	r3, [r7, #64]
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	movs	r2, #16
	adds	r1, r7, r2
	ldr	r2, [r7, #60]
	adds	r2, r1, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 188 0 discriminator 3
	ldr	r3, [r7, #64]
	adds	r3, r3, #1
	str	r3, [r7, #64]
	ldr	r3, [r7, #60]
	subs	r3, r3, #1
	str	r3, [r7, #60]
.L44:
	.loc 1 188 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #60]
	cmp	r3, #0
	bge	.L45
	.loc 1 190 0 is_stmt 1
	ldr	r3, [r7, #64]
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 191 0
	ldr	r3, [r7, #12]
.L46:
	.loc 1 192 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #72
	@ sp needed
	pop	{r7, pc}
.L48:
	.align	2
.L47:
	.word	.LC0
.LFE36:
	.size	btoa, .-btoa
	.global	__aeabi_uldivmod
	.section	.text.llbtoa,"ax",%progbits
	.align	2
	.global	llbtoa
	.code	16
	.thumb_func
	.type	llbtoa, %function
llbtoa:
.LFB37:
	.loc 1 199 0
	@ args = 4, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI15:
	sub	sp, sp, #116
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #20]
	str	r2, [r7, #8]
	str	r3, [r7, #12]
	.loc 1 203 0
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	bne	.L50
	.loc 1 204 0
	ldr	r3, [r7, #20]
	movs	r2, #48
	strb	r2, [r3]
	.loc 1 205 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 206 0
	ldr	r3, [r7, #20]
	b	.L61
.L50:
	.loc 1 209 0
	movs	r3, #0
	str	r3, [r7, #96]
	.loc 1 210 0
	movs	r3, #128
	movs	r2, #8
	mov	ip, r2
	add	ip, ip, r7
	add	r3, r3, ip
	ldr	r3, [r3]
	adds	r3, r3, #10
	bne	.L52
	.loc 1 211 0
	movs	r3, #10
	movs	r2, #128
	movs	r1, #8
	mov	ip, r1
	add	ip, ip, r7
	add	r2, r2, ip
	str	r3, [r2]
	.loc 1 212 0
	ldr	r3, [r7, #8]
	ldr	r4, [r7, #12]
	cmp	r4, #0
	bge	.L52
	.loc 1 213 0
	ldr	r1, [r7, #8]
	ldr	r2, [r7, #12]
	movs	r4, #0
	rsbs	r3, r1, #0
	sbcs	r4, r2
	str	r3, [r7, #8]
	str	r4, [r7, #12]
	.loc 1 214 0
	movs	r3, #1
	str	r3, [r7, #96]
.L52:
	.loc 1 218 0
	movs	r3, #0
	str	r3, [r7, #104]
	b	.L54
.L57:
	.loc 1 219 0
	movs	r3, #128
	movs	r2, #8
	mov	ip, r2
	add	ip, ip, r7
	add	r3, r3, ip
	ldr	r3, [r3]
	movs	r5, r3
	asrs	r3, r3, #31
	movs	r6, r3
	ldr	r0, [r7, #8]
	ldr	r1, [r7, #12]
	movs	r2, r5
	movs	r3, r6
	bl	__aeabi_uldivmod
	movs	r4, r3
	movs	r3, r2
	str	r3, [r7, #92]
	.loc 1 220 0
	movs	r3, #128
	movs	r2, #8
	mov	ip, r2
	add	ip, ip, r7
	add	r3, r3, ip
	ldr	r3, [r3]
	str	r3, [r7]
	asrs	r3, r3, #31
	str	r3, [r7, #4]
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	ldr	r0, [r7, #8]
	ldr	r1, [r7, #12]
	bl	__aeabi_uldivmod
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #8]
	str	r4, [r7, #12]
	.loc 1 221 0
	ldr	r3, [r7, #92]
	cmp	r3, #0
	blt	.L55
	.loc 1 221 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #92]
	cmp	r3, #9
	bgt	.L55
	.loc 1 222 0 is_stmt 1
	ldr	r3, [r7, #92]
	uxtb	r2, r3
	movs	r3, #103
	movs	r1, #8
	mov	ip, r1
	add	ip, ip, r7
	add	r3, r3, ip
	adds	r2, r2, #48
	strb	r2, [r3]
	b	.L56
.L55:
	.loc 1 223 0
	ldr	r3, [r7, #92]
	cmp	r3, #9
	ble	.L56
	.loc 1 223 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #92]
	cmp	r3, #36
	bgt	.L56
	.loc 1 224 0 is_stmt 1
	ldr	r3, [r7, #92]
	uxtb	r2, r3
	movs	r3, #103
	movs	r1, #8
	mov	ip, r1
	add	ip, ip, r7
	add	r3, r3, ip
	adds	r2, r2, #87
	strb	r2, [r3]
.L56:
	.loc 1 225 0 discriminator 2
	movs	r3, #16
	movs	r2, #8
	adds	r2, r7, r2
	adds	r2, r2, r3
	ldr	r3, [r7, #104]
	adds	r3, r2, r3
	movs	r2, #103
	movs	r1, #8
	mov	ip, r1
	add	ip, ip, r7
	add	r2, r2, ip
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 218 0 discriminator 2
	ldr	r3, [r7, #104]
	adds	r3, r3, #1
	str	r3, [r7, #104]
.L54:
	.loc 1 218 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldr	r2, [r7, #12]
	orrs	r3, r2
	bne	.L57
	.loc 1 228 0 is_stmt 1
	movs	r3, #16
	movs	r2, #8
	adds	r2, r7, r2
	adds	r2, r2, r3
	ldr	r3, [r7, #104]
	adds	r3, r2, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 229 0
	ldr	r3, [r7, #96]
	cmp	r3, #0
	beq	.L58
	.loc 1 230 0
	ldr	r2, .L62
	movs	r3, #16
	movs	r1, #8
	mov	ip, r1
	add	ip, ip, r7
	add	r3, r3, ip
	movs	r1, r2
	movs	r0, r3
	bl	strcat
.L58:
	.loc 1 233 0
	movs	r3, #0
	str	r3, [r7, #104]
	movs	r3, #16
	movs	r2, #8
	mov	ip, r2
	add	ip, ip, r7
	add	r3, r3, ip
	movs	r0, r3
	bl	strlen
	movs	r3, r0
	subs	r3, r3, #1
	str	r3, [r7, #100]
	b	.L59
.L60:
	.loc 1 234 0 discriminator 3
	ldr	r3, [r7, #104]
	ldr	r2, [r7, #20]
	adds	r3, r2, r3
	movs	r2, #16
	movs	r1, #8
	adds	r1, r7, r1
	adds	r1, r1, r2
	ldr	r2, [r7, #100]
	adds	r2, r1, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 233 0 discriminator 3
	ldr	r3, [r7, #104]
	adds	r3, r3, #1
	str	r3, [r7, #104]
	ldr	r3, [r7, #100]
	subs	r3, r3, #1
	str	r3, [r7, #100]
.L59:
	.loc 1 233 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #100]
	cmp	r3, #0
	bge	.L60
	.loc 1 235 0 is_stmt 1
	ldr	r3, [r7, #104]
	ldr	r2, [r7, #20]
	adds	r3, r2, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 236 0
	ldr	r3, [r7, #20]
.L61:
	.loc 1 237 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #116
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L63:
	.align	2
.L62:
	.word	.LC0
.LFE37:
	.size	llbtoa, .-llbtoa
	.section	.text.gethex,"ax",%progbits
	.align	2
	.global	gethex
	.code	16
	.thumb_func
	.type	gethex, %function
gethex:
.LFB38:
	.loc 1 245 0
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
	.loc 1 249 0
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L65
.L72:
	.loc 1 250 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L66
	.loc 1 251 0
	movs	r3, #0
	b	.L67
.L66:
	.loc 1 252 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L68
	.loc 1 252 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #57
	bhi	.L68
	.loc 1 253 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	subs	r3, r3, #48
	str	r3, [r7, #16]
	b	.L69
.L68:
	.loc 1 254 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #96
	bls	.L70
	.loc 1 254 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #102
	bhi	.L70
	.loc 1 255 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	subs	r3, r3, #87
	str	r3, [r7, #16]
	b	.L69
.L70:
	.loc 1 256 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #64
	bls	.L71
	.loc 1 256 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #70
	bhi	.L71
	.loc 1 257 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	subs	r3, r3, #55
	str	r3, [r7, #16]
	b	.L69
.L71:
	.loc 1 259 0
	movs	r3, #0
	b	.L67
.L69:
	.loc 1 261 0 discriminator 2
	ldr	r3, [r7, #20]
	lsls	r3, r3, #4
	str	r3, [r7, #20]
	.loc 1 262 0 discriminator 2
	ldr	r3, [r7, #16]
	ldr	r2, [r7, #20]
	orrs	r3, r2
	str	r3, [r7, #20]
	.loc 1 263 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 249 0 discriminator 2
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L65:
	.loc 1 249 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bgt	.L72
	.loc 1 265 0 is_stmt 1
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #12]
	str	r2, [r3]
	.loc 1 266 0
	movs	r3, #1
.L67:
	.loc 1 267 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	gethex, .-gethex
	.section	.text._fd,"ax",%progbits
	.align	2
	.global	_fd
	.code	16
	.thumb_func
	.type	_fd, %function
_fd:
.LFB39:
	.loc 1 270 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #16
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	str	r0, [r7, #4]
	.loc 1 272 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L74
	.loc 1 274 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L75
.L78:
	.loc 1 276 0
	ldr	r2, [r7, #12]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L79
	adds	r2, r3, r2
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L76
	.loc 1 277 0
	ldr	r3, [r7, #12]
	b	.L77
.L76:
	.loc 1 274 0 discriminator 2
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L75:
	.loc 1 274 0 is_stmt 0 discriminator 1
	ldr	r1, .L79
	ldr	r2, [r7, #12]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r3, [r3, r1]
	cmp	r3, #0
	bne	.L78
.L74:
	.loc 1 280 0 is_stmt 1
	ldr	r3, .L79+4
	movs	r2, #9
	str	r2, [r3]
	.loc 1 281 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L77:
	.loc 1 282 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L80:
	.align	2
.L79:
	.word	_stdio_
	.word	__errno
.LFE39:
	.size	_fd, .-_fd
	.section	.text.fopen,"ax",%progbits
	.align	2
	.global	fopen
	.code	16
	.thumb_func
	.type	fopen, %function
fopen:
.LFB40:
	.loc 1 285 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	sub	sp, sp, #16
.LCFI25:
	add	r7, sp, #0
.LCFI26:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 286 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 287 0
	ldr	r3, [r7, #4]
	movs	r1, #0
	movs	r0, r3
	bl	caribou_uart_open
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 288 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L82
	.loc 1 290 0
	ldr	r2, [r7, #8]
	movs	r3, r2
	lsls	r3, r3, #1
	adds	r3, r3, r2
	lsls	r3, r3, #3
	ldr	r2, .L84
	adds	r3, r3, r2
	str	r3, [r7, #12]
.L82:
	.loc 1 292 0
	ldr	r3, [r7, #12]
	.loc 1 293 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L85:
	.align	2
.L84:
	.word	_stdio_
.LFE40:
	.size	fopen, .-fopen
	.section	.text.fclose,"ax",%progbits
	.align	2
	.global	fclose
	.code	16
	.thumb_func
	.type	fclose, %function
fclose:
.LFB41:
	.loc 1 296 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI27:
	sub	sp, sp, #16
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	str	r0, [r7, #4]
	.loc 1 297 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	_fd
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 298 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	blt	.L87
	.loc 1 300 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	caribou_uart_close
.L87:
	.loc 1 302 0
	ldr	r3, [r7, #12]
	.loc 1 303 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	fclose, .-fclose
	.section	.text.fflush,"ax",%progbits
	.align	2
	.global	fflush
	.code	16
	.thumb_func
	.type	fflush, %function
fflush:
.LFB42:
	.loc 1 309 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	sub	sp, sp, #8
.LCFI31:
	add	r7, sp, #0
.LCFI32:
	str	r0, [r7, #4]
	.loc 1 311 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_uart_private_flush
	movs	r3, r0
	.loc 1 312 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE42:
	.size	fflush, .-fflush
	.section	.text.fputc,"ax",%progbits
	.align	2
	.global	fputc
	.code	16
	.thumb_func
	.type	fputc, %function
fputc:
.LFB43:
	.loc 1 319 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI33:
	sub	sp, sp, #8
.LCFI34:
	add	r7, sp, #0
.LCFI35:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 320 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	adds	r1, r7, #4
	ldr	r0, [r7]
	movs	r2, #1
	blx	r3
	movs	r3, r0
	cmp	r3, #1
	bne	.L92
	.loc 1 322 0
	ldr	r3, [r7, #4]
	b	.L93
.L92:
	.loc 1 324 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L93:
	.loc 1 325 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE43:
	.size	fputc, .-fputc
	.section	.text.putc,"ax",%progbits
	.align	2
	.global	putc
	.code	16
	.thumb_func
	.type	putc, %function
putc:
.LFB44:
	.loc 1 332 0
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
	.loc 1 333 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	adds	r1, r7, #4
	ldr	r0, [r7]
	movs	r2, #1
	blx	r3
	movs	r3, r0
	cmp	r3, #1
	bne	.L95
	.loc 1 335 0
	ldr	r3, [r7, #4]
	b	.L96
.L95:
	.loc 1 337 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L96:
	.loc 1 338 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE44:
	.size	putc, .-putc
	.section	.text._fputc,"ax",%progbits
	.align	2
	.weak	_fputc
	.code	16
	.thumb_func
	.type	_fputc, %function
_fputc:
.LFB45:
	.loc 1 341 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI39:
	sub	sp, sp, #8
.LCFI40:
	add	r7, sp, #0
.LCFI41:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 342 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	fputc
	movs	r3, r0
	.loc 1 343 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE45:
	.size	_fputc, .-_fputc
	.section	.text.fputs,"ax",%progbits
	.align	2
	.global	fputs
	.code	16
	.thumb_func
	.type	fputs, %function
fputs:
.LFB46:
	.loc 1 348 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI42:
	sub	sp, sp, #16
.LCFI43:
	add	r7, sp, #0
.LCFI44:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 349 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	strlen
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 350 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #12]
	ldr	r1, [r7, #4]
	ldr	r0, [r7]
	blx	r3
	movs	r2, r0
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bne	.L100
	.loc 1 352 0
	ldr	r3, [r7, #12]
	b	.L101
.L100:
	.loc 1 354 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L101:
	.loc 1 355 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE46:
	.size	fputs, .-fputs
	.section	.text.fgetc,"ax",%progbits
	.align	2
	.global	fgetc
	.code	16
	.thumb_func
	.type	fgetc, %function
fgetc:
.LFB47:
	.loc 1 362 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI45:
	sub	sp, sp, #16
.LCFI46:
	add	r7, sp, #0
.LCFI47:
	str	r0, [r7, #4]
	.loc 1 363 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	subs	r3, r0, #0
	ble	.L103
.LBB2:
	.loc 1 365 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 366 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	movs	r2, #12
	adds	r1, r7, r2
	ldr	r0, [r7, #4]
	movs	r2, #1
	blx	r3
	movs	r3, r0
	cmp	r3, #1
	bne	.L103
	.loc 1 368 0
	ldr	r3, [r7, #12]
	b	.L105
.L103:
.LBE2:
	.loc 1 371 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L105:
	.loc 1 372 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE47:
	.size	fgetc, .-fgetc
	.section	.text.fgets,"ax",%progbits
	.align	2
	.global	fgets
	.code	16
	.thumb_func
	.type	fgets, %function
fgets:
.LFB48:
	.loc 1 382 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI48:
	sub	sp, sp, #24
.LCFI49:
	add	r7, sp, #0
.LCFI50:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 383 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	ble	.L107
.LBB3:
	.loc 1 385 0
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L108
.L112:
.LBB4:
	.loc 1 387 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	fgetc
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 388 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	blt	.L109
	.loc 1 390 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #16]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 391 0
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 392 0
	ldr	r3, [r7, #16]
	cmp	r3, #13
	beq	.L110
	.loc 1 392 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #16]
	cmp	r3, #10
	bne	.L109
.L110:
	.loc 1 394 0 is_stmt 1
	ldr	r3, [r7, #12]
	b	.L111
.L109:
	.loc 1 397 0 discriminator 2
	bl	caribou_thread_yield
.LBE4:
	.loc 1 385 0 discriminator 2
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L108:
	.loc 1 385 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	subs	r2, r3, #1
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bgt	.L112
.L107:
.LBE3:
	.loc 1 400 0 is_stmt 1
	movs	r3, #0
.L111:
	.loc 1 401 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.LFE48:
	.size	fgets, .-fgets
	.section	.text.printchar,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	printchar, %function
printchar:
.LFB49:
	.loc 1 404 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI51:
	sub	sp, sp, #16
.LCFI52:
	add	r7, sp, #0
.LCFI53:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 405 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L114
	.loc 1 407 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 408 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, [r7, #8]
	str	r2, [r3]
	.loc 1 416 0
	b	.L117
.L114:
	.loc 1 412 0
	ldr	r3, [r7, #4]
	cmp	r3, #10
	bne	.L116
	.loc 1 413 0
	ldr	r3, [r7, #12]
	movs	r1, r3
	movs	r0, #13
	bl	_fputc
.L116:
	.loc 1 414 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	_fputc
.L117:
	.loc 1 416 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE49:
	.size	printchar, .-printchar
	.section	.text.prints,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	prints, %function
prints:
.LFB50:
	.loc 1 419 0
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI54:
	sub	sp, sp, #32
.LCFI55:
	add	r7, sp, #0
.LCFI56:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 420 0
	movs	r3, #0
	str	r3, [r7, #28]
	movs	r3, #32
	str	r3, [r7, #24]
	.loc 1 422 0
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L119
.LBB5:
	.loc 1 424 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 426 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #16]
	b	.L120
.L121:
	.loc 1 426 0 is_stmt 0 discriminator 3
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
.L120:
	.loc 1 426 0 discriminator 1
	ldr	r3, [r7, #16]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L121
	.loc 1 427 0 is_stmt 1
	ldr	r2, [r7, #20]
	ldr	r3, [r7]
	cmp	r2, r3
	blt	.L122
	.loc 1 427 0 is_stmt 0 discriminator 1
	movs	r3, #0
	str	r3, [r7]
	b	.L123
.L122:
	.loc 1 428 0 is_stmt 1
	ldr	r2, [r7]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	str	r3, [r7]
.L123:
	.loc 1 429 0
	ldr	r3, [r7, #40]
	movs	r2, #2
	ands	r3, r2
	beq	.L119
	.loc 1 429 0 is_stmt 0 discriminator 1
	movs	r3, #48
	str	r3, [r7, #24]
.L119:
.LBE5:
	.loc 1 431 0 is_stmt 1
	ldr	r3, [r7, #40]
	movs	r2, #1
	ands	r3, r2
	bne	.L127
	.loc 1 433 0
	b	.L125
.L126:
	.loc 1 435 0 discriminator 2
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	printchar
	.loc 1 436 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
	.loc 1 433 0 discriminator 2
	ldr	r3, [r7]
	subs	r3, r3, #1
	str	r3, [r7]
.L125:
	.loc 1 433 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	bgt	.L126
	.loc 1 439 0 is_stmt 1
	b	.L127
.L128:
	.loc 1 441 0 discriminator 2
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	printchar
	.loc 1 442 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
	.loc 1 439 0 discriminator 2
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L127:
	.loc 1 439 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L128
	.loc 1 444 0 is_stmt 1
	b	.L129
.L130:
	.loc 1 446 0 discriminator 2
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	printchar
	.loc 1 447 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
	.loc 1 444 0 discriminator 2
	ldr	r3, [r7]
	subs	r3, r3, #1
	str	r3, [r7]
.L129:
	.loc 1 444 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	bgt	.L130
	.loc 1 450 0 is_stmt 1
	ldr	r3, [r7, #28]
	.loc 1 451 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.LFE50:
	.size	prints, .-prints
	.section	.text.printi,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	printi, %function
printi:
.LFB51:
	.loc 1 454 0
	@ args = 16, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI57:
	sub	sp, sp, #60
.LCFI58:
	add	r7, sp, #8
.LCFI59:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 457 0
	movs	r3, #0
	str	r3, [r7, #36]
	movs	r3, #0
	str	r3, [r7, #32]
	.loc 1 458 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #28]
	.loc 1 460 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L133
	.loc 1 462 0
	movs	r3, #16
	adds	r3, r7, r3
	movs	r2, #48
	strb	r2, [r3]
	.loc 1 463 0
	movs	r3, #16
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3, #1]
	.loc 1 464 0
	ldr	r4, [r7, #68]
	movs	r3, #16
	adds	r2, r7, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #72]
	str	r3, [sp]
	movs	r3, r4
	bl	prints
	movs	r3, r0
	b	.L141
.L133:
	.loc 1 467 0
	ldr	r3, [r7, #64]
	cmp	r3, #0
	beq	.L135
	.loc 1 467 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #10
	bne	.L135
	.loc 1 467 0 discriminator 2
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bge	.L135
	.loc 1 469 0 is_stmt 1
	movs	r3, #1
	str	r3, [r7, #36]
	.loc 1 470 0
	ldr	r3, [r7, #4]
	rsbs	r3, r3, #0
	str	r3, [r7, #28]
.L135:
	.loc 1 473 0
	movs	r3, #16
	adds	r3, r7, r3
	adds	r3, r3, #11
	str	r3, [r7, #44]
	.loc 1 474 0
	ldr	r3, [r7, #44]
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 476 0
	b	.L136
.L138:
	.loc 1 478 0
	ldr	r2, [r7]
	ldr	r3, [r7, #28]
	movs	r1, r2
	movs	r0, r3
	bl	__aeabi_uidivmod
	movs	r3, r1
	str	r3, [r7, #40]
	.loc 1 479 0
	ldr	r3, [r7, #40]
	cmp	r3, #9
	ble	.L137
	.loc 1 480 0
	ldr	r3, [r7, #76]
	subs	r3, r3, #58
	ldr	r2, [r7, #40]
	adds	r3, r2, r3
	str	r3, [r7, #40]
.L137:
	.loc 1 481 0
	ldr	r3, [r7, #44]
	subs	r3, r3, #1
	str	r3, [r7, #44]
	ldr	r3, [r7, #40]
	uxtb	r3, r3
	adds	r3, r3, #48
	uxtb	r2, r3
	ldr	r3, [r7, #44]
	strb	r2, [r3]
	.loc 1 482 0
	ldr	r3, [r7]
	movs	r1, r3
	ldr	r0, [r7, #28]
	bl	__aeabi_uidiv
	movs	r3, r0
	str	r3, [r7, #28]
.L136:
	.loc 1 476 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bne	.L138
	.loc 1 485 0
	ldr	r3, [r7, #36]
	cmp	r3, #0
	beq	.L139
	.loc 1 487 0
	ldr	r3, [r7, #68]
	cmp	r3, #0
	beq	.L140
	.loc 1 487 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #72]
	movs	r2, #2
	ands	r3, r2
	beq	.L140
	.loc 1 488 0 is_stmt 1
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r2, #45
	movs	r0, r3
	bl	printchar
	.loc 1 489 0
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
	.loc 1 490 0
	ldr	r3, [r7, #68]
	subs	r3, r3, #1
	str	r3, [r7, #68]
	b	.L139
.L140:
	.loc 1 493 0
	ldr	r3, [r7, #44]
	subs	r3, r3, #1
	str	r3, [r7, #44]
	ldr	r3, [r7, #44]
	movs	r2, #45
	strb	r2, [r3]
.L139:
	.loc 1 497 0
	ldr	r4, [r7, #68]
	ldr	r2, [r7, #44]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #72]
	str	r3, [sp]
	movs	r3, r4
	bl	prints
	movs	r2, r0
	ldr	r3, [r7, #32]
	adds	r3, r2, r3
.L141:
	.loc 1 498 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r7, pc}
.LFE51:
	.size	printi, .-printi
	.section	.rodata.str1.4
	.align	2
.LC6:
	.ascii	"(null)\000"
	.section	.text.print,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	print, %function
print:
.LFB52:
	.loc 1 501 0
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI60:
	sub	sp, sp, #60
.LCFI61:
	add	r7, sp, #16
.LCFI62:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 503 0
	movs	r3, #0
	str	r3, [r7, #28]
	.loc 1 506 0
	b	.L143
.L164:
	.loc 1 508 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #37
	beq	.LCB1986
	b	.L144	@long jump
.LCB1986:
	.loc 1 510 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 511 0
	movs	r3, #0
	str	r3, [r7, #32]
	ldr	r3, [r7, #32]
	str	r3, [r7, #36]
	.loc 1 512 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.LCB1997
	b	.L167	@long jump
.LCB1997:
	.loc 1 513 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #37
	bne	.LCB2001
	b	.L168	@long jump
.LCB2001:
	.loc 1 514 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #45
	bne	.L149
	.loc 1 515 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 516 0
	movs	r3, #1
	str	r3, [r7, #32]
	.loc 1 518 0
	b	.L149
.L150:
	.loc 1 520 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 521 0
	ldr	r3, [r7, #32]
	movs	r2, #2
	orrs	r3, r2
	str	r3, [r7, #32]
.L149:
	.loc 1 518 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #48
	beq	.L150
	.loc 1 523 0
	b	.L151
.L153:
	.loc 1 525 0 discriminator 3
	ldr	r2, [r7, #36]
	movs	r3, r2
	lsls	r3, r3, #2
	adds	r3, r3, r2
	lsls	r3, r3, #1
	str	r3, [r7, #36]
	.loc 1 526 0 discriminator 3
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	subs	r3, r3, #48
	ldr	r2, [r7, #36]
	adds	r3, r2, r3
	str	r3, [r7, #36]
	.loc 1 523 0 discriminator 3
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L151:
	.loc 1 523 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L152
	.loc 1 523 0 discriminator 2
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L153
.L152:
	.loc 1 528 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #115
	bne	.L154
.LBB6:
	.loc 1 530 0
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r3, [r3]
	str	r3, [r7, #24]
	.loc 1 531 0
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L155
	.loc 1 531 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #24]
	b	.L156
.L155:
	.loc 1 531 0 discriminator 2
	ldr	r2, .L169
.L156:
	.loc 1 531 0 discriminator 4
	ldr	r4, [r7, #36]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp]
	movs	r3, r4
	bl	prints
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 532 0 is_stmt 1 discriminator 4
	b	.L157
.L154:
.LBE6:
	.loc 1 534 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #100
	bne	.L158
	.loc 1 536 0
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r2, [r3]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	movs	r3, #97
	str	r3, [sp, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp, #8]
	ldr	r3, [r7, #36]
	str	r3, [sp, #4]
	movs	r3, #1
	str	r3, [sp]
	movs	r3, #10
	bl	printi
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 537 0
	b	.L157
.L158:
	.loc 1 539 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #108
	bne	.L159
	.loc 1 541 0
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r2, [r3]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	movs	r3, #97
	str	r3, [sp, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp, #8]
	ldr	r3, [r7, #36]
	str	r3, [sp, #4]
	movs	r3, #1
	str	r3, [sp]
	movs	r3, #10
	bl	printi
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 542 0
	b	.L157
.L159:
	.loc 1 544 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #120
	bne	.L160
	.loc 1 546 0
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r2, [r3]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	movs	r3, #97
	str	r3, [sp, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp, #8]
	ldr	r3, [r7, #36]
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #16
	bl	printi
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 547 0
	b	.L157
.L160:
	.loc 1 549 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #88
	beq	.L161
	.loc 1 549 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #112
	bne	.L162
.L161:
	.loc 1 551 0 is_stmt 1
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r2, [r3]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	movs	r3, #65
	str	r3, [sp, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp, #8]
	ldr	r3, [r7, #36]
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #16
	bl	printi
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 552 0
	b	.L157
.L162:
	.loc 1 554 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #117
	bne	.L163
	.loc 1 556 0
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r2, [r3]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	movs	r3, #97
	str	r3, [sp, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp, #8]
	ldr	r3, [r7, #36]
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #10
	bl	printi
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 557 0
	b	.L157
.L163:
	.loc 1 559 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #99
	bne	.L157
	.loc 1 562 0
	ldr	r3, [r7]
	adds	r3, r3, #4
	str	r3, [r7]
	ldr	r3, [r7]
	subs	r3, r3, #4
	ldr	r3, [r3]
	uxtb	r2, r3
	movs	r3, #20
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 563 0
	movs	r3, #20
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3, #1]
	.loc 1 564 0
	ldr	r4, [r7, #36]
	movs	r3, #20
	adds	r2, r7, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	ldr	r3, [r7, #32]
	str	r3, [sp]
	movs	r3, r4
	bl	prints
	movs	r2, r0
	ldr	r3, [r7, #28]
	adds	r3, r3, r2
	str	r3, [r7, #28]
	.loc 1 565 0
	b	.L157
.L168:
	.loc 1 513 0
	nop
.L144:
	.loc 1 589 0
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	printchar
	.loc 1 590 0
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L157:
	.loc 1 506 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L143:
	.loc 1 506 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.LCB2310
	b	.L164	@long jump
.LCB2310:
	b	.L146
.L167:
	.loc 1 512 0 is_stmt 1
	nop
.L146:
	.loc 1 593 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L165
	.loc 1 595 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3]
	movs	r2, #0
	strb	r2, [r3]
.L165:
	.loc 1 597 0
	ldr	r3, [r7, #28]
	.loc 1 598 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r7, pc}
.L170:
	.align	2
.L169:
	.word	.LC6
.LFE52:
	.size	print, .-print
	.section	.text.scanf,"ax",%progbits
	.align	2
	.global	scanf
	.code	16
	.thumb_func
	.type	scanf, %function
scanf:
.LFB53:
	.loc 1 604 0
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
.LCFI63:
	push	{r7, lr}
.LCFI64:
	sub	sp, sp, #8
.LCFI65:
	add	r7, sp, #0
.LCFI66:
	.loc 1 608 0
	movs	r3, #20
	adds	r3, r7, r3
	str	r3, [r7, #4]
	.loc 1 609 0
	ldr	r3, .L173
	ldr	r3, [r3]
	ldr	r1, [r7, #16]
	ldr	r2, [r7, #4]
	movs	r0, r3
	bl	vfscanf
	movs	r3, r0
	str	r3, [r7]
	.loc 1 610 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 611 0
	ldr	r3, [r7]
	.loc 1 612 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #16
	bx	r3
.L174:
	.align	2
.L173:
	.word	_stdin
.LFE53:
	.size	scanf, .-scanf
	.section	.text.fscanf,"ax",%progbits
	.align	2
	.global	fscanf
	.code	16
	.thumb_func
	.type	fscanf, %function
fscanf:
.LFB54:
	.loc 1 618 0
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI67:
	push	{r7, lr}
.LCFI68:
	sub	sp, sp, #20
.LCFI69:
	add	r7, sp, #0
.LCFI70:
	str	r0, [r7, #4]
	.loc 1 622 0
	movs	r3, #32
	adds	r3, r7, r3
	str	r3, [r7, #12]
	.loc 1 623 0
	ldr	r1, [r7, #28]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	vfscanf
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 624 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 625 0
	ldr	r3, [r7, #8]
	.loc 1 626 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE54:
	.size	fscanf, .-fscanf
	.section	.text.sscanf,"ax",%progbits
	.align	2
	.global	sscanf
	.code	16
	.thumb_func
	.type	sscanf, %function
sscanf:
.LFB55:
	.loc 1 632 0
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI71:
	push	{r7, lr}
.LCFI72:
	sub	sp, sp, #20
.LCFI73:
	add	r7, sp, #0
.LCFI74:
	str	r0, [r7, #4]
	.loc 1 636 0
	movs	r3, #32
	adds	r3, r7, r3
	str	r3, [r7, #12]
	.loc 1 637 0
	ldr	r1, [r7, #28]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	vsscanf
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 638 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 639 0
	ldr	r3, [r7, #8]
	.loc 1 640 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE55:
	.size	sscanf, .-sscanf
	.section	.text.vfscanf,"ax",%progbits
	.align	2
	.global	vfscanf
	.code	16
	.thumb_func
	.type	vfscanf, %function
vfscanf:
.LFB56:
	.loc 1 646 0
	@ args = 0, pretend = 0, frame = 280
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI75:
	sub	sp, sp, #280
.LCFI76:
	add	r7, sp, #0
.LCFI77:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
.LBB7:
	.loc 1 650 0
	ldr	r2, [r7, #12]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r1, #255
	movs	r0, r3
	bl	f_gets
	subs	r3, r0, #0
	bne	.L180
	.loc 1 651 0
	movs	r3, #1
	rsbs	r3, r3, #0
	b	.L182
.L180:
.LBE7:
	.loc 1 652 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r0, r3
	bl	vsscanf
	movs	r3, r0
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	.loc 1 653 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
.L182:
	.loc 1 654 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #280
	@ sp needed
	pop	{r7, pc}
.LFE56:
	.size	vfscanf, .-vfscanf
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"dibouxcsefg%\000"
	.align	2
.LC11:
	.ascii	" \011\012\015\014\013\000"
	.align	2
.LC13:
	.ascii	"dobxu\000"
	.section	.text.vsscanf,"ax",%progbits
	.align	2
	.global	vsscanf
	.code	16
	.thumb_func
	.type	vsscanf, %function
vsscanf:
.LFB57:
	.loc 1 660 0
	@ args = 0, pretend = 0, frame = 304
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI78:
	sub	sp, sp, #304
.LCFI79:
	add	r7, sp, #0
.LCFI80:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 665 0
	movs	r3, #10
	movs	r2, #146
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	.loc 1 666 0
	movs	r3, #0
	movs	r2, #144
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #144
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, #148
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #148
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, #150
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	.loc 1 667 0
	b	.L184
.L186:
	.loc 1 669 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L185:
	.loc 1 668 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L186
	.loc 1 668 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #12
	beq	.L186
	.loc 1 668 0 discriminator 2
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #10
	beq	.L186
	.loc 1 668 0 discriminator 3
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #13
	beq	.L186
	.loc 1 668 0 discriminator 4
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L186
	.loc 1 668 0 discriminator 5
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #11
	beq	.L186
	.loc 1 670 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #37
	beq	.LCB2632
	b	.L219	@long jump
.LCB2632:
	.loc 1 671 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	.loc 1 672 0
	b	.L188
.L198:
	.loc 1 673 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, .L227
	movs	r1, r2
	movs	r0, r3
	bl	strchr
	subs	r3, r0, #0
	bne	.L225
	.loc 1 675 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #42
	bne	.L191
	.loc 1 676 0
	movs	r3, #1
	movs	r2, #148
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L192
.L191:
	.loc 1 677 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #108
	beq	.L193
	.loc 1 677 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #76
	bne	.L194
.L193:
	.loc 1 678 0 is_stmt 1
	movs	r3, #1
	movs	r2, #144
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L192
.L194:
	.loc 1 679 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #48
	bls	.L192
	.loc 1 679 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #57
	bhi	.L192
	.loc 1 680 0 is_stmt 1
	ldr	r3, [r7, #8]
	movs	r2, #142
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L195
.L197:
	.loc 1 680 0 is_stmt 0 discriminator 4
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L195:
	.loc 1 680 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L196
	.loc 1 680 0 discriminator 3
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L197
.L196:
	.loc 1 681 0 is_stmt 1
	ldr	r2, [r7, #8]
	movs	r3, #142
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	subs	r3, r2, r3
	movs	r2, r3
	movs	r3, #142
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r1, [r3]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r0, r3
	bl	strncpy
	.loc 1 682 0
	ldr	r2, [r7, #8]
	movs	r3, #142
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	subs	r3, r2, r3
	ldr	r2, .L227+4
	movs	r1, #152
	lsls	r1, r1, #1
	mov	ip, r1
	add	ip, ip, r7
	add	r2, r2, ip
	movs	r1, #0
	strb	r1, [r2, r3]
	.loc 1 683 0
	movs	r3, #20
	adds	r1, r7, r3
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	movs	r2, #10
	movs	r0, r3
	bl	atob
	.loc 1 684 0
	ldr	r3, [r7, #8]
	subs	r3, r3, #1
	str	r3, [r7, #8]
.L192:
	.loc 1 672 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L188:
	.loc 1 672 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L198
	b	.L190
.L225:
	.loc 1 674 0 is_stmt 1
	nop
.L190:
	.loc 1 687 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #115
	bne	.L199
	.loc 1 688 0
	b	.L200
.L201:
	.loc 1 689 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L200:
	.loc 1 688 0
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L201
	.loc 1 688 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #12
	beq	.L201
	.loc 1 688 0 discriminator 2
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #10
	beq	.L201
	.loc 1 688 0 discriminator 3
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #13
	beq	.L201
	.loc 1 688 0 discriminator 4
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L201
	.loc 1 688 0 discriminator 5
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #11
	beq	.L201
	.loc 1 690 0 is_stmt 1
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L202
	.loc 1 691 0
	ldr	r2, .L227+8
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	strcspn
	movs	r3, r0
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
.L202:
	.loc 1 692 0
	movs	r3, #148
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L203
	.loc 1 693 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	ldr	r3, [r3]
	movs	r2, #140
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	ldr	r1, [r7, #12]
	movs	r3, #140
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r0, r3
	bl	strncpy
	.loc 1 694 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	movs	r3, #140
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	adds	r3, r3, r2
	movs	r2, #0
	strb	r2, [r3]
.L203:
	.loc 1 696 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	b	.L204
.L199:
	.loc 1 697 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #99
	bne	.L205
	.loc 1 698 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L206
	.loc 1 699 0
	movs	r3, #1
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
.L206:
	.loc 1 700 0
	movs	r3, #148
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L207
	.loc 1 701 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	ldr	r3, [r3]
	movs	r2, #140
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	ldr	r1, [r7, #12]
	movs	r3, #140
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r0, r3
	bl	strncpy
	.loc 1 702 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	movs	r3, #140
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	adds	r3, r3, r2
	movs	r2, #0
	strb	r2, [r3]
.L207:
	.loc 1 704 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	b	.L204
.L205:
	.loc 1 705 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, .L227+12
	movs	r1, r2
	movs	r0, r3
	bl	strchr
	subs	r3, r0, #0
	bne	.LCB2959
	b	.L204	@long jump
.LCB2959:
	.loc 1 706 0
	b	.L208
.L209:
	.loc 1 707 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L208:
	.loc 1 706 0
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L209
	.loc 1 706 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #12
	beq	.L209
	.loc 1 706 0 discriminator 2
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #10
	beq	.L209
	.loc 1 706 0 discriminator 3
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #13
	beq	.L209
	.loc 1 706 0 discriminator 4
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L209
	.loc 1 706 0 discriminator 5
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #11
	beq	.L209
	.loc 1 708 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #100
	beq	.L210
	.loc 1 708 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #117
	bne	.L211
.L210:
	.loc 1 709 0 is_stmt 1
	movs	r3, #10
	movs	r2, #146
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L212
.L211:
	.loc 1 710 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #120
	bne	.L213
	.loc 1 711 0
	movs	r3, #16
	movs	r2, #146
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L212
.L213:
	.loc 1 712 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #111
	bne	.L214
	.loc 1 713 0
	movs	r3, #8
	movs	r2, #146
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L212
.L214:
	.loc 1 714 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #98
	bne	.L212
	.loc 1 715 0
	movs	r3, #2
	movs	r2, #146
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
.L212:
	.loc 1 716 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L215
	.loc 1 717 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L216
	.loc 1 717 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #12
	beq	.L216
	.loc 1 717 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #10
	beq	.L216
	.loc 1 717 0 discriminator 3
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #13
	beq	.L216
	.loc 1 717 0 discriminator 4
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L216
	.loc 1 717 0 discriminator 5
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #11
	beq	.L216
	.loc 1 717 0 discriminator 6
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L217
.L216:
	.loc 1 718 0 is_stmt 1
	ldr	r2, .L227+8
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	strcspn
	movs	r3, r0
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	b	.L215
.L228:
	.align	2
.L227:
	.word	.LC9
	.word	-284
	.word	.LC11
	.word	.LC13
.L217:
	.loc 1 720 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	strchr
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #12]
	subs	r3, r2, r3
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
.L215:
	.loc 1 722 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	ldr	r1, [r7, #12]
	movs	r3, #20
	adds	r3, r7, r3
	movs	r0, r3
	bl	strncpy
	.loc 1 723 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	ldr	r2, .L229
	movs	r1, #152
	lsls	r1, r1, #1
	mov	ip, r1
	add	ip, ip, r7
	add	r2, r2, ip
	movs	r1, #0
	strb	r1, [r2, r3]
	.loc 1 724 0
	movs	r3, #138
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, r3
	ldr	r3, [r7, #12]
	adds	r3, r3, r2
	str	r3, [r7, #12]
	.loc 1 725 0
	movs	r3, #148
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L204
	.loc 1 726 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #4
	str	r3, [r7, #4]
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	ldr	r3, [r3]
	movs	r2, #146
	lsls	r2, r2, #1
	adds	r2, r7, r2
	ldr	r2, [r2]
	movs	r1, #20
	adds	r1, r7, r1
	movs	r0, r3
	bl	atob
.L204:
	.loc 1 728 0
	movs	r3, #148
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L218
	.loc 1 729 0
	movs	r3, #150
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	adds	r3, r3, #1
	movs	r2, #150
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
.L218:
	.loc 1 730 0
	movs	r3, #0
	movs	r2, #144
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #144
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, #148
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	movs	r3, #148
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	movs	r2, #138
	lsls	r2, r2, #1
	adds	r2, r7, r2
	str	r3, [r2]
	.loc 1 731 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	b	.L184
.L220:
	.loc 1 734 0
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L219:
	.loc 1 733 0
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L220
	.loc 1 733 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #12
	beq	.L220
	.loc 1 733 0 discriminator 2
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #10
	beq	.L220
	.loc 1 733 0 discriminator 3
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #13
	beq	.L220
	.loc 1 733 0 discriminator 4
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L220
	.loc 1 733 0 discriminator 5
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #11
	beq	.L220
	.loc 1 735 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldrb	r2, [r3]
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r2, r3
	bne	.L226
	.loc 1 738 0
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L184:
	.loc 1 667 0
	ldr	r3, [r7, #8]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L222
	.loc 1 667 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.LCB3278
	b	.L185	@long jump
.LCB3278:
	b	.L222
.L226:
	.loc 1 736 0 is_stmt 1
	nop
.L222:
	.loc 1 741 0
	movs	r3, #150
	lsls	r3, r3, #1
	adds	r3, r7, r3
	ldr	r3, [r3]
	.loc 1 742 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #304
	@ sp needed
	pop	{r7, pc}
.L230:
	.align	2
.L229:
	.word	-284
.LFE57:
	.size	vsscanf, .-vsscanf
	.section	.text.sprintf,"ax",%progbits
	.align	2
	.global	sprintf
	.code	16
	.thumb_func
	.type	sprintf, %function
sprintf:
.LFB58:
	.loc 1 760 0
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI81:
	push	{r7, lr}
.LCFI82:
	sub	sp, sp, #20
.LCFI83:
	add	r7, sp, #0
.LCFI84:
	str	r0, [r7, #4]
	.loc 1 761 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 763 0
	movs	r3, #32
	adds	r3, r7, r3
	str	r3, [r7, #8]
	.loc 1 764 0
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #8]
	adds	r1, r7, #4
	movs	r0, #0
	bl	print
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 765 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 766 0
	ldr	r3, [r7, #12]
	.loc 1 767 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE58:
	.size	sprintf, .-sprintf
	.section	.text.snprintf,"ax",%progbits
	.align	2
	.global	snprintf
	.code	16
	.thumb_func
	.type	snprintf, %function
snprintf:
.LFB59:
	.loc 1 773 0
	@ args = 4, pretend = 8, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r2, r3}
.LCFI85:
	push	{r7, lr}
.LCFI86:
	sub	sp, sp, #16
.LCFI87:
	add	r7, sp, #0
.LCFI88:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 774 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 776 0
	movs	r3, #28
	adds	r3, r7, r3
	str	r3, [r7, #8]
	.loc 1 777 0
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #8]
	adds	r1, r7, #4
	movs	r0, #0
	bl	print
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 778 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 779 0
	ldr	r3, [r7, #12]
	.loc 1 780 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #8
	bx	r3
.LFE59:
	.size	snprintf, .-snprintf
	.section	.text.fprintf,"ax",%progbits
	.align	2
	.global	fprintf
	.code	16
	.thumb_func
	.type	fprintf, %function
fprintf:
.LFB60:
	.loc 1 786 0
	@ args = 4, pretend = 12, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r1, r2, r3}
.LCFI89:
	push	{r7, lr}
.LCFI90:
	sub	sp, sp, #20
.LCFI91:
	add	r7, sp, #0
.LCFI92:
	str	r0, [r7, #4]
	.loc 1 787 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 789 0
	movs	r3, #32
	adds	r3, r7, r3
	str	r3, [r7, #8]
	.loc 1 790 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L236
	.loc 1 791 0
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #8]
	ldr	r0, [r7, #4]
	movs	r1, #0
	bl	print
	movs	r3, r0
	str	r3, [r7, #12]
.L236:
	.loc 1 792 0
	movs	r3, #0
	str	r3, [r7, #8]
	.loc 1 793 0
	ldr	r3, [r7, #12]
	.loc 1 794 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE60:
	.size	fprintf, .-fprintf
	.section	.text.printf,"ax",%progbits
	.align	2
	.global	printf
	.code	16
	.thumb_func
	.type	printf, %function
printf:
.LFB61:
	.loc 1 800 0
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
.LCFI93:
	push	{r7, lr}
.LCFI94:
	sub	sp, sp, #8
.LCFI95:
	add	r7, sp, #0
.LCFI96:
	.loc 1 801 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 803 0
	movs	r3, #20
	adds	r3, r7, r3
	str	r3, [r7]
	.loc 1 804 0
	ldr	r3, .L241
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L239
	.loc 1 805 0
	ldr	r3, .L241
	ldr	r0, [r3]
	ldr	r2, [r7, #16]
	ldr	r3, [r7]
	movs	r1, #0
	bl	print
	movs	r3, r0
	str	r3, [r7, #4]
.L239:
	.loc 1 806 0
	movs	r3, #0
	str	r3, [r7]
	.loc 1 807 0
	ldr	r3, [r7, #4]
	.loc 1 808 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7}
	pop	{r3}
	add	sp, sp, #16
	bx	r3
.L242:
	.align	2
.L241:
	.word	_stdout
.LFE61:
	.size	printf, .-printf
	.section	.text.fwrite,"ax",%progbits
	.align	2
	.global	fwrite
	.code	16
	.thumb_func
	.type	fwrite, %function
fwrite:
.LFB62:
	.loc 1 829 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI97:
	sub	sp, sp, #16
.LCFI98:
	add	r7, sp, #0
.LCFI99:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 830 0
	ldr	r3, [r7]
	ldr	r3, [r3, #8]
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	muls	r2, r1
	ldr	r1, [r7, #12]
	ldr	r0, [r7]
	blx	r3
	movs	r3, r0
	.loc 1 831 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE62:
	.size	fwrite, .-fwrite
	.section	.text.fread,"ax",%progbits
	.align	2
	.global	fread
	.code	16
	.thumb_func
	.type	fread, %function
fread:
.LFB63:
	.loc 1 834 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI100:
	sub	sp, sp, #16
.LCFI101:
	add	r7, sp, #0
.LCFI102:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 835 0
	ldr	r3, [r7]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	muls	r2, r1
	ldr	r1, [r7, #12]
	ldr	r0, [r7]
	blx	r3
	movs	r3, r0
	.loc 1 836 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE63:
	.size	fread, .-fread
	.section	.text.fioctl,"ax",%progbits
	.align	2
	.global	fioctl
	.code	16
	.thumb_func
	.type	fioctl, %function
fioctl:
.LFB64:
	.loc 1 839 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI103:
	sub	sp, sp, #8
.LCFI104:
	add	r7, sp, #0
.LCFI105:
	str	r0, [r7, #4]
	.loc 1 840 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	ldr	r2, [r7, #4]
	movs	r0, r2
	blx	r3
	movs	r3, r0
	.loc 1 841 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE64:
	.size	fioctl, .-fioctl
	.section	.text.getchar,"ax",%progbits
	.align	2
	.global	getchar
	.code	16
	.thumb_func
	.type	getchar, %function
getchar:
.LFB65:
	.loc 1 844 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI106:
	add	r7, sp, #0
.LCFI107:
	.loc 1 845 0
	ldr	r3, .L251
	ldr	r3, [r3]
	movs	r0, r3
	bl	fgetc
	movs	r3, r0
	.loc 1 846 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L252:
	.align	2
.L251:
	.word	_stdin
.LFE65:
	.size	getchar, .-getchar
	.section	.text.putchar,"ax",%progbits
	.align	2
	.global	putchar
	.code	16
	.thumb_func
	.type	putchar, %function
putchar:
.LFB66:
	.loc 1 849 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI108:
	sub	sp, sp, #8
.LCFI109:
	add	r7, sp, #0
.LCFI110:
	str	r0, [r7, #4]
	.loc 1 850 0
	ldr	r3, .L255
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	fputc
	movs	r3, r0
	.loc 1 851 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L256:
	.align	2
.L255:
	.word	_stdout
.LFE66:
	.size	putchar, .-putchar
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
	.uleb128 0x10
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
	.uleb128 0x68
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
	.uleb128 0xc
	.byte	0x84
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
	.uleb128 0x50
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
	.uleb128 0x88
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
	.uleb128 0x18
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x20
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
	.uleb128 0x18
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
	.uleb128 0x28
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	.LCFI59-.LCFI58
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x40
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	.LCFI62-.LCFI61
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x38
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI63-.LFB53
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xe
	.uleb128 0x18
	.byte	0x87
	.uleb128 0x6
	.byte	0x8e
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI65-.LCFI64
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
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
	.4byte	.LCFI67-.LFB54
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI68-.LCFI67
	.byte	0xe
	.uleb128 0x14
	.byte	0x87
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
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
	.4byte	.LCFI71-.LFB55
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x14
	.byte	0x87
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI74-.LCFI73
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
	.4byte	.LCFI75-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xe
	.uleb128 0x120
	.byte	0x4
	.4byte	.LCFI77-.LCFI76
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
	.4byte	.LCFI78-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xe
	.uleb128 0x138
	.byte	0x4
	.4byte	.LCFI80-.LCFI79
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
	.4byte	.LCFI81-.LFB58
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI82-.LCFI81
	.byte	0xe
	.uleb128 0x14
	.byte	0x87
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI83-.LCFI82
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI84-.LCFI83
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
	.4byte	.LCFI85-.LFB59
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI86-.LCFI85
	.byte	0xe
	.uleb128 0x10
	.byte	0x87
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI87-.LCFI86
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI88-.LCFI87
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
	.4byte	.LCFI89-.LFB60
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI90-.LCFI89
	.byte	0xe
	.uleb128 0x14
	.byte	0x87
	.uleb128 0x5
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI91-.LCFI90
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI92-.LCFI91
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
	.4byte	.LCFI93-.LFB61
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI94-.LCFI93
	.byte	0xe
	.uleb128 0x18
	.byte	0x87
	.uleb128 0x6
	.byte	0x8e
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI95-.LCFI94
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI96-.LCFI95
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
	.4byte	.LCFI97-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI98-.LCFI97
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI99-.LCFI98
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
	.4byte	.LCFI100-.LFB63
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
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.byte	0x4
	.4byte	.LCFI103-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI104-.LCFI103
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI105-.LCFI104
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
	.4byte	.LCFI106-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI107-.LCFI106
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
	.4byte	.LCFI108-.LFB66
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI109-.LCFI108
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI110-.LCFI109
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE68:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.file 4 "../../../../include/caribou/lib/errno.h"
	.file 5 "../../../../include/caribou/lib/stdarg.h"
	.file 6 "../../../../include/caribou/lib/stdio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xedc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0xc
	.4byte	.LASF80
	.4byte	.LASF81
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF4
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x16
	.4byte	0x57
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x17
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x6
	.byte	0x4
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x6
	.byte	0x4
	.4byte	0x9a
	.uleb128 0x7
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x16
	.4byte	0x69
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x108
	.4byte	0x57
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x5
	.byte	0x1d
	.4byte	0x87
	.uleb128 0x9
	.4byte	.LASF82
	.byte	0x18
	.byte	0x6
	.byte	0x1f
	.4byte	0x11d
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x6
	.byte	0x21
	.4byte	0x7e
	.byte	0
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x6
	.byte	0x22
	.4byte	0x13c
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x6
	.byte	0x23
	.4byte	0x13c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x6
	.byte	0x24
	.4byte	0x151
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF20
	.byte	0x6
	.byte	0x25
	.4byte	0x151
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x6
	.byte	0x26
	.4byte	0x151
	.byte	0x14
	.byte	0
	.uleb128 0xb
	.4byte	0x57
	.4byte	0x136
	.uleb128 0xc
	.4byte	0x136
	.uleb128 0xc
	.4byte	0x7e
	.uleb128 0xc
	.4byte	0x57
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc8
	.uleb128 0x6
	.byte	0x4
	.4byte	0x11d
	.uleb128 0xb
	.4byte	0x57
	.4byte	0x151
	.uleb128 0xc
	.4byte	0x136
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x142
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0x27
	.4byte	0xc8
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x1
	.byte	0x2a
	.4byte	0x87
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x196
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x1
	.byte	0x2a
	.4byte	0x196
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x57
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x45
	.4byte	0x57
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x231
	.uleb128 0xe
	.ascii	"vp\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x231
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.byte	0x45
	.4byte	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x47
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.ascii	"v1\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.ascii	"v2\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x12
	.ascii	"q\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x237
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x49
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x77
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0x247
	.uleb128 0x14
	.4byte	0x9f
	.byte	0x13
	.byte	0
	.uleb128 0x15
	.4byte	.LASF29
	.byte	0x1
	.byte	0x7b
	.4byte	0x57
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x294
	.uleb128 0xe
	.ascii	"vp\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x294
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.byte	0x7b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.ascii	"v\000"
	.byte	0x1
	.byte	0x7d
	.4byte	0x77
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x5e
	.uleb128 0x15
	.4byte	.LASF30
	.byte	0x1
	.byte	0x8d
	.4byte	0x57
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2db
	.uleb128 0xe
	.ascii	"vp\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x231
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0x8d
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.byte	0x8d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x15
	.4byte	.LASF31
	.byte	0x1
	.byte	0x99
	.4byte	0x87
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x372
	.uleb128 0xe
	.ascii	"dst\000"
	.byte	0x1
	.byte	0x99
	.4byte	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x1
	.byte	0x99
	.4byte	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.byte	0x99
	.4byte	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x12
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x9b
	.4byte	0x372
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x9b
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x12
	.ascii	"j\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.ascii	"neg\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0x382
	.uleb128 0x14
	.4byte	0x9f
	.byte	0x21
	.byte	0
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0xc6
	.4byte	0x87
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x419
	.uleb128 0xe
	.ascii	"dst\000"
	.byte	0x1
	.byte	0xc6
	.4byte	0x87
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0xf
	.4byte	.LASF27
	.byte	0x1
	.byte	0xc6
	.4byte	0x77
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x1
	.byte	0xc6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.ascii	"buf\000"
	.byte	0x1
	.byte	0xc8
	.4byte	0x419
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0xc8
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0x1
	.byte	0xc9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.ascii	"j\000"
	.byte	0x1
	.byte	0xc9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.ascii	"rem\000"
	.byte	0x1
	.byte	0xc9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x12
	.ascii	"neg\000"
	.byte	0x1
	.byte	0xc9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0x429
	.uleb128 0x14
	.4byte	0x9f
	.byte	0x41
	.byte	0
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0xf4
	.4byte	0x57
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x482
	.uleb128 0xe
	.ascii	"vp\000"
	.byte	0x1
	.byte	0xf4
	.4byte	0x482
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.ascii	"p\000"
	.byte	0x1
	.byte	0xf4
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.ascii	"n\000"
	.byte	0x1
	.byte	0xf4
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.ascii	"v\000"
	.byte	0x1
	.byte	0xf6
	.4byte	0x488
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0xf7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF34
	.uleb128 0x17
	.ascii	"_fd\000"
	.byte	0x1
	.2byte	0x10d
	.4byte	0x57
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c6
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x10d
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"fd\000"
	.byte	0x1
	.2byte	0x10f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x157
	.uleb128 0x1a
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x11c
	.4byte	0x4c6
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x521
	.uleb128 0x1b
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x11c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x11c
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x11e
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.ascii	"fd\000"
	.byte	0x1
	.2byte	0x11f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF38
	.byte	0x1
	.2byte	0x127
	.4byte	0x57
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x558
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x127
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"fd\000"
	.byte	0x1
	.2byte	0x129
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x134
	.4byte	0x57
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x581
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x134
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x13e
	.4byte	0x57
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5b7
	.uleb128 0x18
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x13e
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x13e
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x14b
	.4byte	0x57
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ed
	.uleb128 0x18
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x14b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x14b
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x154
	.4byte	0x57
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x623
	.uleb128 0x18
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x154
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x154
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x15b
	.4byte	0x57
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x668
	.uleb128 0x18
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x15b
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x15b
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x15d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x169
	.4byte	0x57
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6a9
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x169
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x19
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x16d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x17d
	.4byte	0x87
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x71d
	.uleb128 0x18
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x17d
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1b
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x17d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x17d
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x19
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x181
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1c
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x19
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x183
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x193
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x75e
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x193
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.ascii	"str\000"
	.byte	0x1
	.2byte	0x193
	.4byte	0x75e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x18
	.ascii	"c\000"
	.byte	0x1
	.2byte	0x193
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x87
	.uleb128 0x1e
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1a2
	.4byte	0x57
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x80e
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x1a2
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x18
	.ascii	"out\000"
	.byte	0x1
	.2byte	0x1a2
	.4byte	0x75e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1a2
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1a2
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.ascii	"pad\000"
	.byte	0x1
	.2byte	0x1a2
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.ascii	"pc\000"
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1a4
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1c
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x19
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x1a8
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"ptr\000"
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x57
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8ee
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x18
	.ascii	"out\000"
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x75e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x18
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x18
	.ascii	"b\000"
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.ascii	"sg\000"
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.ascii	"pad\000"
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x1c5
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x1f
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x1c7
	.4byte	0x8ee
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x19
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x1c8
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"t\000"
	.byte	0x1
	.2byte	0x1c9
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"neg\000"
	.byte	0x1
	.2byte	0x1c9
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.ascii	"pc\000"
	.byte	0x1
	.2byte	0x1c9
	.4byte	0x80
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.ascii	"u\000"
	.byte	0x1
	.2byte	0x1ca
	.4byte	0x488
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0x8fe
	.uleb128 0x14
	.4byte	0x9f
	.byte	0xb
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x57
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9b2
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x18
	.ascii	"out\000"
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x75e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x1f4
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1b
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x1f4
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1f6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"pad\000"
	.byte	0x1
	.2byte	0x1f6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"pc\000"
	.byte	0x1
	.2byte	0x1f7
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.ascii	"scr\000"
	.byte	0x1
	.2byte	0x1f8
	.4byte	0x9b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x20
	.ascii	"out\000"
	.byte	0x1
	.2byte	0x24c
	.4byte	.L144
	.uleb128 0x1c
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x19
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x212
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0x9c2
	.uleb128 0x14
	.4byte	0x9f
	.byte	0x1
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x25b
	.4byte	0x57
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa0a
	.uleb128 0x18
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x25b
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x21
	.uleb128 0x1f
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x25d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.ascii	"ap\000"
	.byte	0x1
	.2byte	0x25e
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x269
	.4byte	0x57
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa60
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x269
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x269
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.uleb128 0x1f
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x26b
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.ascii	"ap\000"
	.byte	0x1
	.2byte	0x26c
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x277
	.4byte	0x57
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xab7
	.uleb128 0x18
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0x277
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x277
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.uleb128 0x1f
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x279
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.ascii	"ap\000"
	.byte	0x1
	.2byte	0x27a
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x285
	.4byte	0x57
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb37
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x285
	.4byte	0x4c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -276
	.uleb128 0x18
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x285
	.4byte	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x18
	.ascii	"ap\000"
	.byte	0x1
	.2byte	0x285
	.4byte	0xbd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x1f
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x287
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0x288
	.4byte	0xb37
	.uleb128 0x3
	.byte	0x91
	.sleb128 -268
	.uleb128 0x1c
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x22
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x28a
	.4byte	0x57
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0xb47
	.uleb128 0x14
	.4byte	0x9f
	.byte	0xff
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x293
	.4byte	0x57
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc05
	.uleb128 0x18
	.ascii	"buf\000"
	.byte	0x1
	.2byte	0x293
	.4byte	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -300
	.uleb128 0x18
	.ascii	"s\000"
	.byte	0x1
	.2byte	0x293
	.4byte	0x94
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x18
	.ascii	"ap\000"
	.byte	0x1
	.2byte	0x293
	.4byte	0xbd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -308
	.uleb128 0x1f
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x295
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x295
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1f
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x295
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1f
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x295
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x295
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"tc\000"
	.byte	0x1
	.2byte	0x296
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.ascii	"t\000"
	.byte	0x1
	.2byte	0x297
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x19
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x297
	.4byte	0xc05
	.uleb128 0x3
	.byte	0x91
	.sleb128 -292
	.byte	0
	.uleb128 0x13
	.4byte	0x8d
	.4byte	0xc15
	.uleb128 0x14
	.4byte	0x9f
	.byte	0xfe
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x2f7
	.4byte	0x57
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc6c
	.uleb128 0x18
	.ascii	"str\000"
	.byte	0x1
	.2byte	0x2f7
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x2f7
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.uleb128 0x19
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x2f9
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x2fa
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x304
	.4byte	0x57
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xcd2
	.uleb128 0x18
	.ascii	"str\000"
	.byte	0x1
	.2byte	0x304
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1b
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x304
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1b
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x304
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x21
	.uleb128 0x19
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x306
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x307
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x311
	.4byte	0x57
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd28
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x311
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1b
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x311
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x21
	.uleb128 0x19
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x313
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x314
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x31f
	.4byte	0x57
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd70
	.uleb128 0x1b
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x31f
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x21
	.uleb128 0x19
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x321
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x322
	.4byte	0xbd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x33c
	.4byte	0x57
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdc4
	.uleb128 0x18
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x33c
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x33c
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x33c
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x33c
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x341
	.4byte	0x57
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe18
	.uleb128 0x18
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x341
	.4byte	0x87
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x18
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x341
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x1b
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x341
	.4byte	0xa6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x341
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x346
	.4byte	0x57
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe41
	.uleb128 0x18
	.ascii	"fp\000"
	.byte	0x1
	.2byte	0x346
	.4byte	0x4c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x23
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x34b
	.4byte	0x57
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1a
	.4byte	.LASF73
	.byte	0x1
	.2byte	0x350
	.4byte	0x57
	.4byte	.LFB66
	.4byte	.LFE66-.LFB66
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe80
	.uleb128 0x18
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x350
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x24
	.4byte	.LASF74
	.byte	0x4
	.2byte	0x109
	.4byte	0xb1
	.uleb128 0x13
	.4byte	0xe97
	.4byte	0xe97
	.uleb128 0x25
	.byte	0
	.uleb128 0x7
	.4byte	0x157
	.uleb128 0x26
	.4byte	.LASF75
	.byte	0x6
	.byte	0x29
	.4byte	0xea7
	.uleb128 0x7
	.4byte	0xe8c
	.uleb128 0x27
	.4byte	.LASF76
	.byte	0x1
	.byte	0x18
	.4byte	0x4c6
	.uleb128 0x5
	.byte	0x3
	.4byte	_stdin
	.uleb128 0x27
	.4byte	.LASF77
	.byte	0x1
	.byte	0x19
	.4byte	0x4c6
	.uleb128 0x5
	.byte	0x3
	.4byte	_stdout
	.uleb128 0x27
	.4byte	.LASF78
	.byte	0x1
	.byte	0x1a
	.4byte	0x4c6
	.uleb128 0x5
	.byte	0x3
	.4byte	_stderr
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x21
	.byte	0
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
	.4byte	0x1b8
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xee0
	.4byte	0x162
	.ascii	"_getbase\000"
	.4byte	0x19c
	.ascii	"_atob\000"
	.4byte	0x247
	.ascii	"atob\000"
	.4byte	0x29a
	.ascii	"llatob\000"
	.4byte	0x2db
	.ascii	"btoa\000"
	.4byte	0x382
	.ascii	"llbtoa\000"
	.4byte	0x429
	.ascii	"gethex\000"
	.4byte	0x48f
	.ascii	"_fd\000"
	.4byte	0x4cc
	.ascii	"fopen\000"
	.4byte	0x521
	.ascii	"fclose\000"
	.4byte	0x558
	.ascii	"fflush\000"
	.4byte	0x581
	.ascii	"fputc\000"
	.4byte	0x5b7
	.ascii	"putc\000"
	.4byte	0x5ed
	.ascii	"_fputc\000"
	.4byte	0x623
	.ascii	"fputs\000"
	.4byte	0x668
	.ascii	"fgetc\000"
	.4byte	0x6a9
	.ascii	"fgets\000"
	.4byte	0x71d
	.ascii	"printchar\000"
	.4byte	0x764
	.ascii	"prints\000"
	.4byte	0x80e
	.ascii	"printi\000"
	.4byte	0x8fe
	.ascii	"print\000"
	.4byte	0x9c2
	.ascii	"scanf\000"
	.4byte	0xa0a
	.ascii	"fscanf\000"
	.4byte	0xa60
	.ascii	"sscanf\000"
	.4byte	0xab7
	.ascii	"vfscanf\000"
	.4byte	0xb27
	.ascii	"f_gets\000"
	.4byte	0xb47
	.ascii	"vsscanf\000"
	.4byte	0xc15
	.ascii	"sprintf\000"
	.4byte	0xc6c
	.ascii	"snprintf\000"
	.4byte	0xcd2
	.ascii	"fprintf\000"
	.4byte	0xd28
	.ascii	"printf\000"
	.4byte	0xd70
	.ascii	"fwrite\000"
	.4byte	0xdc4
	.ascii	"fread\000"
	.4byte	0xe18
	.ascii	"fioctl\000"
	.4byte	0xe41
	.ascii	"getchar\000"
	.4byte	0xe57
	.ascii	"putchar\000"
	.4byte	0xeac
	.ascii	"_stdin\000"
	.4byte	0xebd
	.ascii	"_stdout\000"
	.4byte	0xece
	.ascii	"_stderr\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x135
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xee0
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x45
	.ascii	"short unsigned int\000"
	.4byte	0x57
	.ascii	"int\000"
	.4byte	0x4c
	.ascii	"int32_t\000"
	.4byte	0x69
	.ascii	"unsigned int\000"
	.4byte	0x5e
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x80
	.ascii	"long int\000"
	.4byte	0x8d
	.ascii	"char\000"
	.4byte	0x9f
	.ascii	"sizetype\000"
	.4byte	0xa6
	.ascii	"size_t\000"
	.4byte	0xb1
	.ascii	"errno_t\000"
	.4byte	0xbd
	.ascii	"va_list\000"
	.4byte	0xc8
	.ascii	"_stdio_t\000"
	.4byte	0x157
	.ascii	"stdio_t\000"
	.4byte	0x488
	.ascii	"long unsigned int\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x12c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"uint32_t\000"
.LASF23:
	.ascii	"basep\000"
.LASF36:
	.ascii	"ndev\000"
.LASF80:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/l"
	.ascii	"ib/stdio.c\000"
.LASF60:
	.ascii	"sscanf\000"
.LASF2:
	.ascii	"short int\000"
.LASF13:
	.ascii	"size_t\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF40:
	.ascii	"fputc\000"
.LASF73:
	.ascii	"putchar\000"
.LASF50:
	.ascii	"padchar\000"
.LASF18:
	.ascii	"writefn\000"
.LASF64:
	.ascii	"lflag\000"
.LASF21:
	.ascii	"statefn\000"
.LASF16:
	.ascii	"device_private\000"
.LASF44:
	.ascii	"fgetc\000"
.LASF15:
	.ascii	"va_list\000"
.LASF27:
	.ascii	"value\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF45:
	.ascii	"fgets\000"
.LASF43:
	.ascii	"fputs\000"
.LASF19:
	.ascii	"readqueuefn\000"
.LASF42:
	.ascii	"_fputc\000"
.LASF49:
	.ascii	"width\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF85:
	.ascii	"getchar\000"
.LASF61:
	.ascii	"vfscanf\000"
.LASF52:
	.ascii	"letbase\000"
.LASF10:
	.ascii	"long int\000"
.LASF48:
	.ascii	"string\000"
.LASF68:
	.ascii	"printf\000"
.LASF51:
	.ascii	"printi\000"
.LASF29:
	.ascii	"atob\000"
.LASF30:
	.ascii	"llatob\000"
.LASF67:
	.ascii	"fprintf\000"
.LASF47:
	.ascii	"prints\000"
.LASF66:
	.ascii	"snprintf\000"
.LASF63:
	.ascii	"noassign\000"
.LASF39:
	.ascii	"fflush\000"
.LASF24:
	.ascii	"_getbase\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF14:
	.ascii	"errno_t\000"
.LASF41:
	.ascii	"putc\000"
.LASF0:
	.ascii	"signed char\000"
.LASF31:
	.ascii	"btoa\000"
.LASF54:
	.ascii	"print\000"
.LASF25:
	.ascii	"_atob\000"
.LASF56:
	.ascii	"args\000"
.LASF55:
	.ascii	"format\000"
.LASF20:
	.ascii	"writequeuefn\000"
.LASF53:
	.ascii	"print_buf\000"
.LASF11:
	.ascii	"char\000"
.LASF72:
	.ascii	"fioctl\000"
.LASF59:
	.ascii	"fscanf\000"
.LASF5:
	.ascii	"int32_t\000"
.LASF70:
	.ascii	"nmemb\000"
.LASF78:
	.ascii	"_stderr\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF37:
	.ascii	"mode\000"
.LASF65:
	.ascii	"sprintf\000"
.LASF17:
	.ascii	"readfn\000"
.LASF77:
	.ascii	"_stdout\000"
.LASF75:
	.ascii	"_stdio_\000"
.LASF33:
	.ascii	"gethex\000"
.LASF69:
	.ascii	"fwrite\000"
.LASF34:
	.ascii	"long unsigned int\000"
.LASF62:
	.ascii	"vsscanf\000"
.LASF81:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF46:
	.ascii	"size\000"
.LASF57:
	.ascii	"scanf\000"
.LASF83:
	.ascii	"printchar\000"
.LASF58:
	.ascii	"count\000"
.LASF79:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF84:
	.ascii	"f_gets\000"
.LASF22:
	.ascii	"stdio_t\000"
.LASF38:
	.ascii	"fclose\000"
.LASF28:
	.ascii	"digit\000"
.LASF35:
	.ascii	"fopen\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF26:
	.ascii	"base\000"
.LASF32:
	.ascii	"llbtoa\000"
.LASF76:
	.ascii	"_stdin\000"
.LASF71:
	.ascii	"fread\000"
.LASF8:
	.ascii	"long long int\000"
.LASF74:
	.ascii	"__errno\000"
.LASF82:
	.ascii	"_stdio_t\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
