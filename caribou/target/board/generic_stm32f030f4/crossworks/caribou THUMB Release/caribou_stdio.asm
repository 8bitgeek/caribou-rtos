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
	.file	"stdio.c"
	.text
.Ltext0:
	.section	.text._getbase,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_getbase, %function
_getbase:
.LFB32:
	ldrb	r3, [r0]
	cmp	r3, #48
	bne	.L2
	ldrb	r3, [r0, #1]
	cmp	r3, #111
	beq	.L4
	uxtb	r2, r3
	cmp	r2, #111
	bhi	.L5
	cmp	r3, #110
	beq	.L6
	b	.L3
.L5:
	cmp	r3, #116
	beq	.L6
	cmp	r3, #120
	bne	.L3
	mov	r3, #16
	str	r3, [r1]
	b	.L8
.L6:
	mov	r3, #10
	str	r3, [r1]
	b	.L8
.L4:
	mov	r3, #8
	str	r3, [r1]
	b	.L8
.L3:
	mov	r3, #10
	str	r3, [r1]
	b	.L9
.L8:
	add	r0, r0, #2
	b	.L9
.L2:
	mov	r3, #10
	str	r3, [r1]
.L9:
	@ sp needed
	bx	lr
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
	push	{r4, r5, r6, r7, lr}
.LCFI0:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI1:
	sub	sp, sp, #40
.LCFI2:
	mov	r10, r0
	mov	r7, r1
	mov	r8, r2
	ldrb	r3, [r1]
	cmp	r3, #48
	bne	.L11
	ldrb	r3, [r1, #1]
	mov	r2, #32
	bic	r3, r2
	cmp	r3, #88
	bne	.L11
	add	r7, r7, #2
	mov	r0, #16
	mov	r8, r0
	b	.L12
.L11:
	mov	r1, r8
	cmp	r1, #16
	bne	.L13
.L12:
	mov	r0, r7
	mov	r1, #46
	bl	strchr
	sub	r6, r0, #0
	beq	.L13
	sub	r4, r0, r7
	mov	r0, #0
	cmp	r4, #19
	bhi	.L14
	add	r5, sp, #4
	mov	r0, r5
	mov	r1, r7
	mov	r2, r4
	bl	strncpy
	mov	r3, #0
	strb	r3, [r5, r4]
	add	r0, sp, #32
	mov	r1, r5
	mov	r2, #16
	bl	_atob
	cmp	r0, #0
	beq	.L14
	add	r6, r6, #1
	mov	r0, r6
	mov	r1, #46
	bl	strchr
	mov	r3, r0
	mov	r0, #0
	cmp	r3, #0
	bne	.L14
	add	r0, sp, #24
	mov	r1, r6
	mov	r2, #16
	bl	_atob
	cmp	r0, #0
	beq	.L14
	ldr	r1, [sp, #32]
	lsr	r0, r1, #16
	ldr	r4, [sp, #36]
	lsl	r3, r4, #16
	orr	r3, r0
	lsl	r2, r1, #16
	ldr	r0, [sp, #24]
	ldr	r1, [sp, #28]
	add	r2, r2, r0
	adc	r3, r3, r1
	mov	r1, r10
	str	r2, [r1]
	str	r3, [r1, #4]
	mov	r0, #1
	b	.L14
.L13:
	mov	r2, #0
	mov	r3, #0
	mov	r0, r10
	str	r2, [r0]
	str	r3, [r0, #4]
	ldrb	r6, [r7]
	cmp	r6, #0
	beq	.L22
	mov	r0, #0
	mov	r1, #0
	mov	r3, r8
	asr	r3, r3, #31
	mov	r9, r3
.L19:
	mov	r3, r6
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L16
	mov	r6, r3
	b	.L17
.L16:
	mov	r3, r6
	sub	r3, r3, #97
	cmp	r3, #5
	bhi	.L18
	sub	r6, r6, #87
	b	.L17
.L18:
	mov	r3, r6
	sub	r3, r3, #65
	cmp	r3, #5
	bhi	.L23
	sub	r6, r6, #55
.L17:
	cmp	r6, r8
	bge	.L24
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_lmul
	mov	r4, r6
	asr	r5, r6, #31
	add	r0, r0, r4
	adc	r1, r1, r5
	add	r7, r7, #1
	ldrb	r6, [r7]
	cmp	r6, #0
	bne	.L19
	b	.L15
.L22:
	mov	r0, #0
	mov	r1, #0
.L15:
	mov	r4, r10
	str	r0, [r4]
	str	r1, [r4, #4]
	mov	r0, #1
	b	.L14
.L23:
	mov	r0, #0
	b	.L14
.L24:
	mov	r0, #0
.L14:
	add	sp, sp, #40
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
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
	push	{r4, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	mov	r4, r0
	str	r2, [sp, #4]
	cmp	r2, #0
	bne	.L26
	mov	r0, r1
	add	r1, sp, #4
	bl	_getbase
	mov	r1, r0
.L26:
	add	r0, sp, #8
	ldr	r2, [sp, #4]
	bl	_atob
	cmp	r0, #0
	beq	.L27
	ldr	r3, [sp, #8]
	str	r3, [r4]
	mov	r0, #1
.L27:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
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
	push	{r4, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	mov	r4, r0
	str	r2, [sp, #4]
	cmp	r2, #0
	bne	.L29
	mov	r0, r1
	add	r1, sp, #4
	bl	_getbase
	mov	r1, r0
.L29:
	mov	r0, r4
	ldr	r2, [sp, #4]
	bl	_atob
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.LFE35:
	.size	llatob, .-llatob
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.section	.text.btoa,"ax",%progbits
	.align	2
	.global	btoa
	.code	16
	.thumb_func
	.type	btoa, %function
btoa:
.LFB36:
	push	{r4, r5, r6, r7, lr}
.LCFI7:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI8:
	sub	sp, sp, #40
.LCFI9:
	mov	r8, r0
	mov	r4, r1
	mov	r7, r2
	cmp	r1, #0
	bne	.L31
	mov	r3, #48
	strb	r3, [r0]
	mov	r3, #0
	strb	r3, [r0, #1]
	b	.L47
.L31:
	mov	r0, r2
	add	r0, r0, #10
	bne	.L33
	mov	r7, #10
	cmp	r1, #0
	bge	.L33
	neg	r4, r1
	cmp	r4, #0
	bne	.L45
	b	.L48
.L39:
	mov	r0, r4
	mov	r1, r7
	bl	__aeabi_uidivmod
	mov	r5, r1
	mov	r0, r4
	mov	r1, r7
	bl	__aeabi_uidiv
	mov	r4, r0
	cmp	r5, #9
	bhi	.L36
	add	r5, r5, #48
	uxtb	r5, r5
	mov	r9, r5
	b	.L37
.L36:
	mov	r3, r5
	sub	r3, r3, #10
	cmp	r3, #26
	bhi	.L37
	add	r5, r5, #87
	uxtb	r5, r5
	mov	r9, r5
.L37:
	add	r3, sp, #4
	mov	r1, r9
	strb	r1, [r6, r3]
	add	r6, r6, #1
	cmp	r4, #0
	bne	.L39
	mov	r2, #0
	strb	r2, [r3, r6]
	mov	r2, r10
	cmp	r2, #0
	beq	.L40
.L43:
	add	r0, sp, #4
	ldr	r1, .L49
	bl	strcat
.L40:
	add	r0, sp, #4
	bl	strlen
	sub	r3, r0, #1
	bmi	.L46
	mov	r2, #0
.L42:
	add	r1, sp, #4
	ldrb	r1, [r3, r1]
	mov	r0, r8
	strb	r1, [r0, r2]
	add	r2, r2, #1
	sub	r3, r3, #1
	bpl	.L42
	b	.L41
.L46:
	mov	r2, #0
.L41:
	mov	r3, #0
	mov	r1, r8
	strb	r3, [r1, r2]
	b	.L47
.L33:
	mov	r2, #0
	mov	r10, r2
	b	.L34
.L45:
	mov	r3, #1
	mov	r10, r3
	mov	r7, #10
.L34:
	mov	r6, #0
	b	.L39
.L48:
	mov	r2, #0
	add	r3, sp, #4
	strb	r2, [r3]
	b	.L43
.L47:
	mov	r0, r8
	add	sp, sp, #40
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L50:
	.align	2
.L49:
	.word	.LC2
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
	push	{r4, r5, r6, r7, lr}
.LCFI10:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI11:
	sub	sp, sp, #84
.LCFI12:
	str	r0, [sp]
	mov	r4, r2
	mov	r5, r3
	ldr	r0, [sp, #120]
	mov	r8, r0
	mov	r3, r2
	orr	r3, r5
	bne	.L52
	mov	r3, #48
	ldr	r1, [sp]
	strb	r3, [r1]
	mov	r3, #0
	strb	r3, [r1, #1]
	b	.L70
.L52:
	mov	r2, r0
	add	r2, r2, #10
	bne	.L54
	cmp	r5, #0
	bge	.L67
	mov	r0, r4
	mov	r1, r5
	mov	r5, #0
	neg	r4, r0
	sbc	r5, r1
	mov	r3, r4
	orr	r3, r5
	bne	.L68
	b	.L71
.L62:
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_uldivmod
	mov	r6, r2
	mov	r0, r4
	mov	r1, r5
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_uldivmod
	mov	r4, r0
	mov	r5, r1
	cmp	r6, #9
	bhi	.L58
	add	r6, r6, #48
	uxtb	r6, r6
	mov	fp, r6
	b	.L59
.L58:
	mov	r3, r6
	sub	r3, r3, #10
	cmp	r3, #26
	bhi	.L59
	add	r6, r6, #87
	uxtb	r6, r6
	mov	fp, r6
.L59:
	add	r3, sp, #12
	mov	r1, fp
	strb	r1, [r7, r3]
	add	r7, r7, #1
	mov	r3, r4
	orr	r3, r5
	bne	.L62
	mov	r2, #0
	add	r3, sp, #12
	strb	r2, [r3, r7]
	ldr	r2, [sp, #4]
	cmp	r2, #0
	beq	.L63
.L66:
	add	r0, sp, #12
	ldr	r1, .L72
	bl	strcat
.L63:
	add	r0, sp, #12
	bl	strlen
	sub	r3, r0, #1
	bmi	.L69
	mov	r2, #0
.L65:
	add	r1, sp, #12
	ldrb	r1, [r3, r1]
	ldr	r0, [sp]
	strb	r1, [r0, r2]
	add	r2, r2, #1
	sub	r3, r3, #1
	bpl	.L65
	b	.L64
.L69:
	mov	r2, #0
.L64:
	mov	r3, #0
	ldr	r1, [sp]
	strb	r3, [r1, r2]
	b	.L70
.L67:
	mov	r2, #10
	mov	r8, r2
.L54:
	mov	r3, #0
	str	r3, [sp, #4]
	b	.L56
.L68:
	mov	r0, #1
	str	r0, [sp, #4]
	mov	r1, #10
	mov	r8, r1
.L56:
	mov	r7, #0
	mov	r2, r8
	asr	r2, r2, #31
	mov	r9, r2
	b	.L62
.L71:
	mov	r2, #0
	add	r3, sp, #12
	strb	r2, [r3]
	b	.L66
.L70:
	ldr	r0, [sp]
	add	sp, sp, #84
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L73:
	.align	2
.L72:
	.word	.LC2
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
	push	{r4, r5, lr}
.LCFI13:
	cmp	r2, #0
	ble	.L82
	ldrb	r3, [r1]
	cmp	r3, #0
	beq	.L83
	add	r2, r1, r2
	mov	r4, #0
	b	.L77
.L81:
	ldrb	r3, [r1]
	cmp	r3, #0
	beq	.L84
.L77:
	mov	r5, r3
	sub	r5, r5, #48
	cmp	r5, #9
	bhi	.L78
	mov	r3, r5
	b	.L79
.L78:
	mov	r5, r3
	sub	r5, r5, #97
	cmp	r5, #5
	bhi	.L80
	sub	r3, r3, #87
	b	.L79
.L80:
	mov	r5, r3
	sub	r5, r5, #65
	cmp	r5, #5
	bhi	.L85
	sub	r3, r3, #55
.L79:
	lsl	r4, r4, #4
	orr	r4, r3
	add	r1, r1, #1
	cmp	r1, r2
	bne	.L81
	b	.L75
.L82:
	mov	r4, #0
.L75:
	str	r4, [r0]
	mov	r0, #1
	b	.L76
.L83:
	mov	r0, #0
	b	.L76
.L84:
	mov	r0, #0
	b	.L76
.L85:
	mov	r0, #0
.L76:
	@ sp needed
	pop	{r4, r5, pc}
.LFE38:
	.size	gethex, .-gethex
	.section	.text.fopen,"ax",%progbits
	.align	2
	.global	fopen
	.code	16
	.thumb_func
	.type	fopen, %function
fopen:
.LFB40:
	push	{r3, lr}
.LCFI14:
	mov	r1, #0
	bl	caribou_uart_open
	cmp	r0, #0
	blt	.L88
	lsl	r3, r0, #1
	add	r0, r3, r0
	lsl	r0, r0, #3
	ldr	r3, .L89
	add	r0, r0, r3
	b	.L87
.L88:
	mov	r0, #0
.L87:
	@ sp needed
	pop	{r3, pc}
.L90:
	.align	2
.L89:
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
	push	{r4, lr}
.LCFI15:
.LBB4:
.LBB5:
	cmp	r0, #0
	beq	.L92
	ldr	r3, .L100
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L92
	ldr	r3, .L100
	cmp	r0, r3
	beq	.L98
	ldr	r3, .L100+4
	mov	r2, #0
	b	.L94
.L96:
	mov	r1, r3
	add	r1, r1, #24
	cmp	r0, r3
	beq	.L95
	mov	r3, r1
.L94:
	add	r2, r2, #1
	ldr	r1, [r3]
	cmp	r1, #0
	bne	.L96
.L92:
	mov	r2, #9
	ldr	r3, .L100+8
	str	r2, [r3]
	mov	r4, #1
	neg	r4, r4
	b	.L97
.L95:
	sub	r4, r2, #0
.LBE5:
.LBE4:
	blt	.L97
	b	.L93
.L98:
.LBB7:
.LBB6:
	mov	r4, #0
.L93:
.LBE6:
.LBE7:
	mov	r0, r4
	bl	caribou_uart_close
.L97:
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.L101:
	.align	2
.L100:
	.word	_stdio_
	.word	_stdio_+24
	.word	__errno
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
	push	{r4, lr}
.LCFI16:
.LBB10:
.LBB11:
	cmp	r0, #0
	beq	.L103
	ldr	r3, .L111
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L103
	ldr	r3, .L111
	cmp	r0, r3
	beq	.L109
	ldr	r3, .L111+4
	mov	r4, #0
	b	.L105
.L106:
	mov	r2, r3
	add	r2, r2, #24
	cmp	r0, r3
	beq	.L107
	mov	r3, r2
.L105:
	add	r4, r4, #1
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L106
.L103:
	mov	r2, #9
	ldr	r3, .L111+8
	str	r2, [r3]
	mov	r4, #1
	neg	r4, r4
	b	.L107
.L109:
	mov	r4, #0
	b	.L107
.L108:
.LBE11:
.LBE10:
	bl	caribou_thread_yield
.L107:
	mov	r0, r4
	bl	caribou_uart_tx_busy
	cmp	r0, #0
	bne	.L108
	mov	r0, r4
	bl	caribou_uart_tx_queue
	bl	caribou_queue_empty
	cmp	r0, #0
	bne	.L108
	@ sp needed
	pop	{r4, pc}
.L112:
	.align	2
.L111:
	.word	_stdio_
	.word	_stdio_+24
	.word	__errno
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
	push	{lr}
.LCFI17:
	sub	sp, sp, #12
.LCFI18:
	str	r0, [sp, #4]
	ldr	r3, [r1, #8]
	mov	r0, r1
	add	r1, sp, #4
	mov	r2, #1
	blx	r3
	cmp	r0, #1
	bne	.L115
	ldr	r0, [sp, #4]
	b	.L114
.L115:
	mov	r0, #1
	neg	r0, r0
.L114:
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.LFE43:
	.size	fputc, .-fputc
	.section	.text._fputc,"ax",%progbits
	.align	2
	.weak	_fputc
	.code	16
	.thumb_func
	.type	_fputc, %function
_fputc:
.LFB44:
	push	{r3, lr}
.LCFI19:
	bl	fputc
	@ sp needed
	pop	{r3, pc}
.LFE44:
	.size	_fputc, .-_fputc
	.section	.text.printchar,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	printchar, %function
printchar:
.LFB47:
	push	{r3, r4, r5, lr}
.LCFI20:
	mov	r5, r0
	mov	r4, r2
	cmp	r1, #0
	beq	.L118
	ldr	r3, [r1]
	strb	r2, [r3]
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	b	.L117
.L118:
	cmp	r2, #10
	bne	.L120
	mov	r0, #13
	mov	r1, r5
	bl	_fputc
.L120:
	mov	r0, r4
	mov	r1, r5
	bl	_fputc
.L117:
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE47:
	.size	printchar, .-printchar
	.section	.text.prints,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	prints, %function
prints:
.LFB48:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI21:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI22:
	mov	r6, r0
	mov	r7, r1
	mov	r5, r2
	mov	r9, r3
	cmp	r3, #0
	ble	.L134
.LBB12:
	ldrb	r3, [r2]
	cmp	r3, #0
	beq	.L135
	mov	r1, #0
.L125:
	add	r1, r1, #1
	ldrb	r3, [r5, r1]
	cmp	r3, #0
	bne	.L125
	cmp	r9, r1
	ble	.L136
	b	.L123
.L135:
	mov	r1, #0
.L123:
	mov	r2, r9
	sub	r2, r2, r1
	mov	r9, r2
	b	.L126
.L136:
	mov	r3, #0
	mov	r9, r3
.L126:
	mov	r2, #48
	mov	r8, r2
	ldr	r3, [sp, #32]
	lsl	r3, r3, #30
	bmi	.L127
.LBE12:
	mov	r2, #32
	mov	r8, r2
.L127:
	mov	r3, #0
	ldr	r2, [sp, #32]
	lsl	r2, r2, #31
	bmi	.L122
	mov	r3, r9
	cmp	r3, #0
	ble	.L139
	mov	r4, r9
.L128:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	bl	printchar
	sub	r4, r4, #1
	cmp	r4, #0
	bne	.L128
	b	.L140
.L134:
	mov	r2, #32
	mov	r8, r2
	mov	r3, #0
	b	.L122
.L139:
	mov	r3, #0
	b	.L122
.L140:
	mov	r3, r9
	mov	r9, r4
.L122:
	ldrb	r2, [r5]
	cmp	r2, #0
	beq	.L141
	mov	r4, r3
	sub	r5, r5, r3
.L130:
	mov	r0, r6
	mov	r1, r7
	bl	printchar
	add	r4, r4, #1
	ldrb	r2, [r5, r4]
	cmp	r2, #0
	bne	.L130
	b	.L129
.L141:
	mov	r4, r3
.L129:
	mov	r3, r9
	cmp	r3, #0
	ble	.L131
	mov	r5, r9
.L133:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r8
	bl	printchar
	sub	r5, r5, #1
	cmp	r5, #0
	bne	.L133
	add	r4, r4, r9
.L131:
	mov	r0, r4
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r3, r4, r5, r6, r7, pc}
.LFE48:
	.size	prints, .-prints
	.section	.text.printi,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	printi, %function
printi:
.LFB49:
	push	{r4, r5, r6, r7, lr}
.LCFI23:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI24:
	sub	sp, sp, #28
.LCFI25:
	mov	fp, r0
	mov	r10, r1
	mov	r6, r3
	sub	r4, r2, #0
	bne	.L143
	add	r2, sp, #12
	mov	r3, #48
	strb	r3, [r2]
	mov	r3, #0
	strb	r3, [r2, #1]
	ldr	r3, [sp, #72]
	str	r3, [sp]
	ldr	r3, [sp, #68]
	bl	prints
	b	.L144
.L143:
	mov	r3, #0
	mov	r9, r3
	ldr	r3, [sp, #64]
	cmp	r3, #0
	beq	.L145
	cmp	r6, #10
	bne	.L145
	cmp	r2, #0
	bge	.L145
	neg	r4, r2
	mov	r3, #1
	mov	r9, r3
.L145:
	mov	r2, #0
	mov	r3, sp
	strb	r2, [r3, #23]
	cmp	r4, #0
	beq	.L154
	mov	r5, sp
	add	r5, r5, #22
	ldr	r3, [sp, #76]
	mov	r8, r3
	mov	r3, #58
	neg	r3, r3
	add	r8, r8, r3
.L148:
	mov	r0, r4
	mov	r1, r6
	bl	__aeabi_uidivmod
	cmp	r1, #9
	ble	.L147
	add	r1, r1, r8
.L147:
	mov	r7, r5
	add	r1, r1, #48
	strb	r1, [r5]
	mov	r0, r4
	mov	r1, r6
	bl	__aeabi_uidiv
	mov	r4, r0
	sub	r5, r5, #1
	cmp	r0, #0
	bne	.L148
	b	.L146
.L154:
	mov	r7, sp
	add	r7, r7, #23
.L146:
	mov	r4, #0
	mov	r3, r9
	cmp	r3, #0
	beq	.L149
	ldr	r3, [sp, #68]
	cmp	r3, #0
	beq	.L150
	ldr	r3, [sp, #72]
	lsl	r3, r3, #30
	bpl	.L150
	mov	r0, fp
	mov	r1, r10
	mov	r2, #45
	bl	printchar
	ldr	r3, [sp, #68]
	sub	r3, r3, #1
	str	r3, [sp, #68]
	mov	r4, #1
	b	.L149
.L150:
	sub	r7, r7, #1
	mov	r3, #45
	strb	r3, [r7]
	mov	r4, #0
.L149:
	ldr	r3, [sp, #72]
	str	r3, [sp]
	mov	r0, fp
	mov	r1, r10
	mov	r2, r7
	ldr	r3, [sp, #68]
	bl	prints
	add	r0, r0, r4
.L144:
	add	sp, sp, #28
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.LFE49:
	.size	printi, .-printi
	.section	.text.print,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	print, %function
print:
.LFB50:
	push	{r4, r5, r6, r7, lr}
.LCFI26:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI27:
	sub	sp, sp, #36
.LCFI28:
	mov	fp, r0
	mov	r6, r1
	mov	r7, r2
	mov	r9, r3
	ldrb	r3, [r2]
	cmp	r3, #0
	bne	.LCB1443
	b	.L175	@long jump
.LCB1443:
	mov	r5, #0
	mov	r8, r5
	mov	r2, #65
	mov	r10, r2
.L173:
	cmp	r3, #37
	beq	.LCB1452
	b	.L158	@long jump
.LCB1452:
	add	r4, r7, #1
	ldrb	r3, [r7, #1]
	cmp	r3, #0
	bne	.LCB1456
	b	.L157	@long jump
.LCB1456:
	cmp	r3, #37
	bne	.LCB1458
	b	.L176	@long jump
.LCB1458:
	mov	r1, r8
	cmp	r3, #45
	bne	.L159
	add	r4, r7, #2
	mov	r1, #1
.L159:
	ldrb	r3, [r4]
	cmp	r3, #48
	bne	.L160
	mov	r2, #2
.L161:
	add	r4, r4, #1
	orr	r1, r2
	ldrb	r3, [r4]
	cmp	r3, #48
	beq	.L161
.L160:
	ldrb	r2, [r4]
	mov	r3, r2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L178
	mov	r3, r8
.L163:
	lsl	r0, r3, #2
	add	r3, r0, r3
	lsl	r3, r3, #1
	sub	r2, r2, #48
	add	r3, r2, r3
	add	r4, r4, #1
	ldrb	r2, [r4]
	mov	r0, r2
	sub	r0, r0, #48
	cmp	r0, #9
	bls	.L163
	b	.L162
.L178:
	mov	r3, r8
.L162:
	cmp	r2, #115
	bne	.L164
.LBB13:
	mov	r7, r9
	add	r7, r7, #4
	mov	r2, r9
	ldr	r0, [r2]
	sub	r2, r0, #0
	bne	.L165
	ldr	r2, .L180
.L165:
	str	r1, [sp]
	mov	r0, fp
	mov	r1, r6
	bl	prints
	add	r5, r5, r0
	mov	r9, r7
	b	.L166
.L164:
.LBE13:
	cmp	r2, #100
	bne	.L167
	mov	r7, r9
	add	r7, r7, #4
	mov	r0, r9
	ldr	r2, [r0]
	mov	r0, #1
	str	r0, [sp]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	mov	r3, #97
	str	r3, [sp, #12]
	mov	r0, fp
	mov	r1, r6
	mov	r3, #10
	bl	printi
	add	r5, r5, r0
	mov	r9, r7
	b	.L166
.L167:
	cmp	r2, #108
	bne	.L168
	mov	r7, r9
	add	r7, r7, #4
	mov	r0, r9
	ldr	r2, [r0]
	mov	r0, #1
	str	r0, [sp]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	mov	r3, #97
	str	r3, [sp, #12]
	mov	r0, fp
	mov	r1, r6
	mov	r3, #10
	bl	printi
	add	r5, r5, r0
	mov	r9, r7
	b	.L166
.L168:
	cmp	r2, #120
	bne	.L169
	mov	r7, r9
	add	r7, r7, #4
	mov	r0, r9
	ldr	r2, [r0]
	mov	r0, r8
	str	r0, [sp]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	mov	r3, #97
	str	r3, [sp, #12]
	mov	r0, fp
	mov	r1, r6
	mov	r3, #16
	bl	printi
	add	r5, r5, r0
	mov	r9, r7
	b	.L166
.L169:
	cmp	r2, #88
	beq	.L170
	cmp	r2, #112
	bne	.L171
.L170:
	mov	r7, r9
	add	r7, r7, #4
	mov	r0, r9
	ldr	r2, [r0]
	mov	r0, r8
	str	r0, [sp]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	mov	r3, r10
	str	r3, [sp, #12]
	mov	r0, fp
	mov	r1, r6
	mov	r3, #16
	bl	printi
	add	r5, r5, r0
	mov	r9, r7
	b	.L166
.L171:
	cmp	r2, #117
	bne	.L172
	mov	r7, r9
	add	r7, r7, #4
	mov	r0, r9
	ldr	r2, [r0]
	mov	r0, r8
	str	r0, [sp]
	str	r3, [sp, #4]
	str	r1, [sp, #8]
	mov	r3, #97
	str	r3, [sp, #12]
	mov	r0, fp
	mov	r1, r6
	mov	r3, #10
	bl	printi
	add	r5, r5, r0
	mov	r9, r7
	b	.L166
.L172:
	cmp	r2, #99
	bne	.L166
	mov	r7, r9
	add	r7, r7, #4
	str	r7, [sp, #20]
	add	r2, sp, #28
	mov	r7, r9
	ldr	r0, [r7]
	strb	r0, [r2]
	mov	r7, r8
	strb	r7, [r2, #1]
	str	r1, [sp]
	mov	r0, fp
	mov	r1, r6
	bl	prints
	add	r5, r5, r0
	ldr	r0, [sp, #20]
	mov	r9, r0
	b	.L166
.L176:
	mov	r7, r4
.L158:
	ldrb	r2, [r7]
	mov	r0, fp
	mov	r1, r6
	bl	printchar
	add	r5, r5, #1
	mov	r4, r7
.L166:
	add	r7, r4, #1
	ldrb	r3, [r4, #1]
	cmp	r3, #0
	beq	.LCB1679
	b	.L173	@long jump
.LCB1679:
	b	.L157
.L175:
	mov	r5, #0
.L157:
	cmp	r6, #0
	beq	.L174
	ldr	r3, [r6]
	mov	r2, #0
	strb	r2, [r3]
.L174:
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L181:
	.align	2
.L180:
	.word	.LC14
.LFE50:
	.size	print, .-print
	.section	.text.fputs,"ax",%progbits
	.align	2
	.global	fputs
	.code	16
	.thumb_func
	.type	fputs, %function
fputs:
.LFB45:
	push	{r4, r5, r6, lr}
.LCFI29:
	mov	r5, r0
	mov	r6, r1
	bl	strlen
	mov	r4, r0
	ldr	r3, [r6, #8]
	mov	r0, r6
	mov	r1, r5
	mov	r2, r4
	blx	r3
	cmp	r0, r4
	beq	.L183
	mov	r0, #1
	neg	r0, r0
.L183:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE45:
	.size	fputs, .-fputs
	.section	.text.fgetc,"ax",%progbits
	.align	2
	.global	fgetc
	.code	16
	.thumb_func
	.type	fgetc, %function
fgetc:
.LFB46:
	push	{r4, lr}
.LCFI30:
	sub	sp, sp, #8
.LCFI31:
	mov	r4, r0
	ldr	r3, [r4, #12]
	blx	r3
	cmp	r0, #0
	ble	.L187
.LBB14:
	mov	r3, #0
	str	r3, [sp, #4]
	ldr	r3, [r4, #4]
	mov	r0, r4
	add	r1, sp, #4
	mov	r2, #1
	blx	r3
	cmp	r0, #1
	bne	.L186
	ldr	r0, [sp, #4]
	b	.L185
.L186:
.LBE14:
	mov	r0, #1
	neg	r0, r0
.LBB15:
	b	.L185
.L187:
.LBE15:
	mov	r0, #1
	neg	r0, r0
.L185:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.LFE46:
	.size	fgetc, .-fgetc
	.section	.text.vsscanf,"ax",%progbits
	.align	2
	.global	vsscanf
	.code	16
	.thumb_func
	.type	vsscanf, %function
vsscanf:
.LFB55:
	push	{r4, r5, r6, r7, lr}
.LCFI32:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI33:
	sub	sp, sp, #284
.LCFI34:
	mov	r4, r0
	str	r2, [sp, #4]
	mov	r3, #0
	str	r3, [sp, #276]
	mov	r2, #10
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, .L230
	mov	r8, r2
	b	.L189
.L190:
	add	r1, r1, #1
.L219:
	ldrb	r3, [r1]
	cmp	r3, #32
	beq	.L190
	mov	r2, r3
	sub	r2, r2, #9
	cmp	r2, #4
	bls	.L190
	cmp	r3, #37
	beq	.LCB1860
	b	.L192	@long jump
.LCB1860:
	add	r6, r1, #1
	ldrb	r1, [r1, #1]
	cmp	r1, #0
	bne	.LCB1864
	b	.L220	@long jump
.LCB1864:
	mov	r3, #0
	mov	r9, r3
	mov	r2, #1
	mov	fp, r2
	add	r7, sp, #20
.L198:
	mov	r0, r8
	bl	strchr
	cmp	r0, #0
	bne	.L194
	ldrb	r3, [r6]
	cmp	r3, #42
	beq	.L221
	mov	r5, r6
	mov	r2, r3
	sub	r2, r2, #49
	cmp	r2, #8
	bhi	.L195
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L223
.L197:
	add	r5, r5, #1
	ldrb	r3, [r5]
	sub	r3, r3, #48
	cmp	r3, #9
	bls	.L197
	b	.L196
.L223:
	mov	r5, r6
.L196:
	sub	r3, r5, r6
	mov	r10, r3
	mov	r0, r7
	mov	r1, r6
	mov	r2, r3
	bl	strncpy
	mov	r3, #0
	mov	r2, r10
	strb	r3, [r7, r2]
	add	r0, sp, #276
	mov	r1, r7
	mov	r2, #10
	bl	atob
	sub	r5, r5, #1
	b	.L195
.L221:
	mov	r5, r6
	mov	r9, fp
.L195:
	add	r6, r5, #1
	ldrb	r1, [r5, #1]
	cmp	r1, #0
	bne	.L198
	b	.L193
.L194:
	mov	r5, r9
	ldrb	r1, [r6]
	cmp	r1, #115
	bne	.L199
	b	.L200
.L201:
	add	r4, r4, #1
.L200:
	ldrb	r3, [r4]
	cmp	r3, #32
	beq	.L201
	sub	r3, r3, #9
	cmp	r3, #4
	bls	.L201
	ldr	r3, [sp, #276]
	cmp	r3, #0
	bne	.L202
	mov	r0, r4
	ldr	r1, .L230+4
	bl	strcspn
	str	r0, [sp, #276]
.L202:
	cmp	r5, #0
	bne	.L203
	ldr	r5, [sp, #4]
	add	r5, r5, #4
	ldr	r2, [sp, #4]
	ldr	r7, [r2]
	mov	r0, r7
	mov	r1, r4
	ldr	r2, [sp, #276]
	bl	strncpy
	mov	r3, #0
	ldr	r2, [sp, #276]
	strb	r3, [r7, r2]
	str	r5, [sp, #4]
.L203:
	ldr	r3, [sp, #276]
	add	r4, r4, r3
	b	.L204
.L199:
	cmp	r1, #99
	bne	.L205
	ldr	r2, [sp, #276]
	cmp	r2, #0
	bne	.L206
	mov	r3, #1
	str	r3, [sp, #276]
.L206:
	cmp	r5, #0
	bne	.L207
	ldr	r5, [sp, #4]
	add	r5, r5, #4
	ldr	r3, [sp, #4]
	ldr	r7, [r3]
	mov	r0, r7
	mov	r1, r4
	ldr	r2, [sp, #276]
	bl	strncpy
	mov	r3, #0
	ldr	r2, [sp, #276]
	strb	r3, [r7, r2]
	str	r5, [sp, #4]
.L207:
	ldr	r3, [sp, #276]
	add	r4, r4, r3
	b	.L204
.L205:
	ldr	r0, .L230+8
	bl	strchr
	cmp	r0, #0
	bne	.L208
	b	.L204
.L209:
	add	r4, r4, #1
.L208:
	ldrb	r3, [r4]
	cmp	r3, #32
	beq	.L209
	sub	r3, r3, #9
	cmp	r3, #4
	bls	.L209
	ldrb	r3, [r6]
	cmp	r3, #100
	beq	.L224
	cmp	r3, #117
	beq	.L225
	cmp	r3, #120
	beq	.L226
	cmp	r3, #111
	beq	.L227
	cmp	r3, #98
	bne	.L210
	b	.L228
.L224:
	mov	r2, #10
	str	r2, [sp, #12]
	b	.L210
.L225:
	mov	r3, #10
	str	r3, [sp, #12]
	b	.L210
.L226:
	mov	r2, #16
	str	r2, [sp, #12]
	b	.L210
.L227:
	mov	r3, #8
	str	r3, [sp, #12]
	b	.L210
.L228:
	mov	r2, #2
	str	r2, [sp, #12]
.L210:
	ldr	r3, [sp, #276]
	cmp	r3, #0
	bne	.L211
	ldrb	r1, [r6, #1]
	mov	r3, r1
	sub	r3, r3, #9
	cmp	r3, #4
	bls	.L212
	mov	r3, #32
	mov	r2, r1
	bic	r2, r3
	bne	.L213
.L212:
	mov	r0, r4
	ldr	r1, .L230+4
	bl	strcspn
	str	r0, [sp, #276]
	b	.L211
.L213:
	mov	r0, r4
	bl	strchr
	sub	r0, r0, r4
	str	r0, [sp, #276]
.L211:
	add	r0, sp, #20
	mov	r1, r4
	ldr	r2, [sp, #276]
	bl	strncpy
	ldr	r3, [sp, #276]
	mov	r1, #0
	add	r2, sp, #20
	strb	r1, [r2, r3]
	add	r4, r4, r3
	mov	r3, r9
	cmp	r3, #0
	bne	.L214
	ldr	r5, [sp, #4]
	add	r5, r5, #4
	ldr	r2, [sp, #4]
	ldr	r0, [r2]
	add	r1, sp, #20
	ldr	r2, [sp, #12]
	bl	atob
	str	r5, [sp, #4]
	b	.L215
.L204:
	mov	r3, r9
	cmp	r3, #0
	bne	.L214
.L215:
	ldr	r2, [sp, #8]
	add	r2, r2, #1
	str	r2, [sp, #8]
.L214:
	mov	r3, #0
	str	r3, [sp, #276]
	add	r1, r6, #1
	b	.L189
.L217:
	add	r4, r4, #1
.L192:
	ldrb	r2, [r4]
	cmp	r2, #32
	beq	.L217
	mov	r0, r2
	sub	r0, r0, #9
	cmp	r0, #4
	bls	.L217
	cmp	r3, r2
	bne	.L229
	add	r1, r1, #1
	add	r4, r4, #1
.L189:
	ldrb	r3, [r1]
	cmp	r3, #0
	beq	.L229
	ldrb	r3, [r4]
	cmp	r3, #0
	beq	.LCB2173
	b	.L219	@long jump
.LCB2173:
	b	.L229
.L220:
	mov	r3, #0
	mov	r9, r3
.L193:
	ldrb	r1, [r6]
	b	.L205
.L229:
	ldr	r0, [sp, #8]
	add	sp, sp, #284
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L231:
	.align	2
.L230:
	.word	.LC16
	.word	.LC18
	.word	.LC20
.LFE55:
	.size	vsscanf, .-vsscanf
	.section	.text.sscanf,"ax",%progbits
	.align	2
	.global	sscanf
	.code	16
	.thumb_func
	.type	sscanf, %function
sscanf:
.LFB53:
	push	{r1, r2, r3}
.LCFI35:
	push	{lr}
.LCFI36:
	add	r2, sp, #4
	ldmia	r2!, {r1}
	bl	vsscanf
	@ sp needed
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE53:
	.size	sscanf, .-sscanf
	.section	.text.vfscanf,"ax",%progbits
	.align	2
	.global	vfscanf
	.code	16
	.thumb_func
	.type	vfscanf, %function
vfscanf:
.LFB54:
	push	{r4, r5, lr}
.LCFI37:
	sub	sp, sp, #260
.LCFI38:
	mov	r3, r0
	mov	r5, r1
	mov	r4, r2
.LBB16:
	mov	r0, sp
	mov	r1, #255
	mov	r2, r3
	bl	fgets
	cmp	r0, #0
	beq	.L235
.LBE16:
	mov	r0, sp
	mov	r1, r5
	mov	r2, r4
	bl	vsscanf
	b	.L234
.L235:
.LBB17:
	mov	r0, #1
	neg	r0, r0
.L234:
.LBE17:
	add	sp, sp, #260
	@ sp needed
	pop	{r4, r5, pc}
.LFE54:
	.size	vfscanf, .-vfscanf
	.section	.text.scanf,"ax",%progbits
	.align	2
	.global	scanf
	.code	16
	.thumb_func
	.type	scanf, %function
scanf:
.LFB51:
	push	{r0, r1, r2, r3}
.LCFI39:
	push	{r3, lr}
.LCFI40:
	ldr	r3, .L237
	ldr	r0, [r3]
	add	r2, sp, #8
	ldmia	r2!, {r1}
	bl	vfscanf
	@ sp needed
	pop	{r3}
	pop	{r3}
	add	sp, sp, #16
	bx	r3
.L238:
	.align	2
.L237:
	.word	.LANCHOR0
.LFE51:
	.size	scanf, .-scanf
	.section	.text.fscanf,"ax",%progbits
	.align	2
	.global	fscanf
	.code	16
	.thumb_func
	.type	fscanf, %function
fscanf:
.LFB52:
	push	{r1, r2, r3}
.LCFI41:
	push	{lr}
.LCFI42:
	add	r2, sp, #4
	ldmia	r2!, {r1}
	bl	vfscanf
	@ sp needed
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE52:
	.size	fscanf, .-fscanf
	.section	.text.vsprintf,"ax",%progbits
	.align	2
	.global	vsprintf
	.code	16
	.thumb_func
	.type	vsprintf, %function
vsprintf:
.LFB56:
	push	{lr}
.LCFI43:
	sub	sp, sp, #12
.LCFI44:
	str	r0, [sp, #4]
	mov	r2, r1
	str	r1, [sp]
	mov	r0, #0
	add	r1, sp, #4
	mov	r3, r1
	bl	print
	add	sp, sp, #12
	@ sp needed
	pop	{pc}
.LFE56:
	.size	vsprintf, .-vsprintf
	.section	.text.sprintf,"ax",%progbits
	.align	2
	.global	sprintf
	.code	16
	.thumb_func
	.type	sprintf, %function
sprintf:
.LFB57:
	push	{r1, r2, r3}
.LCFI45:
	push	{lr}
.LCFI46:
	sub	sp, sp, #8
.LCFI47:
	str	r0, [sp, #4]
	add	r3, sp, #12
	ldmia	r3!, {r2}
	mov	r0, #0
	add	r1, sp, #4
	bl	print
	add	sp, sp, #8
	@ sp needed
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE57:
	.size	sprintf, .-sprintf
	.section	.text.fprintf,"ax",%progbits
	.align	2
	.global	fprintf
	.code	16
	.thumb_func
	.type	fprintf, %function
fprintf:
.LFB58:
	push	{r1, r2, r3}
.LCFI48:
	push	{lr}
.LCFI49:
	cmp	r0, #0
	beq	.L244
	add	r3, sp, #4
	ldmia	r3!, {r2}
	mov	r1, #0
	bl	print
	b	.L243
.L244:
	mov	r0, #0
.L243:
	@ sp needed
	pop	{r3}
	add	sp, sp, #12
	bx	r3
.LFE58:
	.size	fprintf, .-fprintf
	.section	.text.printf,"ax",%progbits
	.align	2
	.global	printf
	.code	16
	.thumb_func
	.type	printf, %function
printf:
.LFB59:
	push	{r0, r1, r2, r3}
.LCFI50:
	push	{r3, lr}
.LCFI51:
	ldr	r3, .L248
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L247
	add	r3, sp, #8
	ldmia	r3!, {r2}
	mov	r1, #0
	bl	print
	b	.L246
.L247:
	mov	r0, #0
.L246:
	@ sp needed
	pop	{r3}
	pop	{r3}
	add	sp, sp, #16
	bx	r3
.L249:
	.align	2
.L248:
	.word	.LANCHOR1
.LFE59:
	.size	printf, .-printf
	.section	.text.debug_printf,"ax",%progbits
	.align	2
	.weak	debug_printf
	.code	16
	.thumb_func
	.type	debug_printf, %function
debug_printf:
.LFB60:
	push	{r0, r1, r2, r3}
.LCFI52:
	mov	r0, #0
	@ sp needed
	add	sp, sp, #16
	bx	lr
.LFE60:
	.size	debug_printf, .-debug_printf
	.section	.text.fwrite,"ax",%progbits
	.align	2
	.global	fwrite
	.code	16
	.thumb_func
	.type	fwrite, %function
fwrite:
.LFB61:
	push	{r3, lr}
.LCFI53:
	ldr	r3, [r0, #8]
	blx	r3
	@ sp needed
	pop	{r3, pc}
.LFE61:
	.size	fwrite, .-fwrite
	.section	.text.fread,"ax",%progbits
	.align	2
	.global	fread
	.code	16
	.thumb_func
	.type	fread, %function
fread:
.LFB62:
	push	{r3, lr}
.LCFI54:
	ldr	r3, [r0, #4]
	blx	r3
	@ sp needed
	pop	{r3, pc}
.LFE62:
	.size	fread, .-fread
	.section	.text.fioctl,"ax",%progbits
	.align	2
	.global	fioctl
	.code	16
	.thumb_func
	.type	fioctl, %function
fioctl:
.LFB63:
	push	{r3, lr}
.LCFI55:
	ldr	r3, [r0, #20]
	blx	r3
	@ sp needed
	pop	{r3, pc}
.LFE63:
	.size	fioctl, .-fioctl
	.section	.text.getchar,"ax",%progbits
	.align	2
	.global	getchar
	.code	16
	.thumb_func
	.type	getchar, %function
getchar:
.LFB64:
	push	{r3, lr}
.LCFI56:
	ldr	r3, .L255
	ldr	r0, [r3]
	bl	fgetc
	@ sp needed
	pop	{r3, pc}
.L256:
	.align	2
.L255:
	.word	.LANCHOR0
.LFE64:
	.size	getchar, .-getchar
	.section	.text.putchar,"ax",%progbits
	.align	2
	.global	putchar
	.code	16
	.thumb_func
	.type	putchar, %function
putchar:
.LFB65:
	push	{r3, lr}
.LCFI57:
	ldr	r3, .L258
	ldr	r1, [r3]
	bl	fputc
	@ sp needed
	pop	{r3, pc}
.L259:
	.align	2
.L258:
	.word	.LANCHOR1
.LFE65:
	.size	putchar, .-putchar
	.global	_stderr
	.global	_stdout
	.global	_stdin
	.section	.bss._stdin,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	_stdin, %object
	.size	_stdin, 4
_stdin:
	.space	4
	.section	.bss._stderr,"aw",%nobits
	.align	2
	.type	_stderr, %object
	.size	_stderr, 4
_stderr:
	.space	4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC2:
	.ascii	"-\000"
	.space	2
.LC14:
	.ascii	"(null)\000"
	.space	1
.LC16:
	.ascii	"dibouxcsefg%\000"
	.space	3
.LC18:
	.ascii	" \011\012\015\014\013\000"
	.space	1
.LC20:
	.ascii	"dobxu\000"
	.section	.bss._stdout,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	_stdout, %object
	.size	_stdout, 4
_stdout:
	.space	4
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
	.byte	0x4
	.4byte	.LCFI0-.LFB33
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
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x48
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI3-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI5-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI7-.LFB36
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
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x48
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI10-.LFB37
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
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x24
	.byte	0x88
	.uleb128 0x9
	.byte	0x89
	.uleb128 0x8
	.byte	0x8a
	.uleb128 0x7
	.byte	0x8b
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x78
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI13-.LFB38
	.byte	0xe
	.uleb128 0xc
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
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI14-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
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
	.4byte	.LCFI15-.LFB41
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
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI16-.LFB42
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
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI17-.LFB43
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI19-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI20-.LFB47
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
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI21-.LFB48
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
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI23-.LFB49
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
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x24
	.byte	0x88
	.uleb128 0x9
	.byte	0x89
	.uleb128 0x8
	.byte	0x8a
	.uleb128 0x7
	.byte	0x8b
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI26-.LFB50
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
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x24
	.byte	0x88
	.uleb128 0x9
	.byte	0x89
	.uleb128 0x8
	.byte	0x8a
	.uleb128 0x7
	.byte	0x8b
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xe
	.uleb128 0x48
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI29-.LFB45
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
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI30-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI32-.LFB55
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
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x24
	.byte	0x88
	.uleb128 0x9
	.byte	0x89
	.uleb128 0x8
	.byte	0x8a
	.uleb128 0x7
	.byte	0x8b
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xe
	.uleb128 0x140
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI35-.LFB53
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x4
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI37-.LFB54
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI38-.LCFI37
	.byte	0xe
	.uleb128 0x110
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI39-.LFB51
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
	.byte	0x8e
	.uleb128 0x5
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI41-.LFB52
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x4
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI43-.LFB56
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI44-.LCFI43
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI45-.LFB57
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI47-.LCFI46
	.byte	0xe
	.uleb128 0x18
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.byte	0x4
	.4byte	.LCFI48-.LFB58
	.byte	0xe
	.uleb128 0xc
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xe
	.uleb128 0x10
	.byte	0x8e
	.uleb128 0x4
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.byte	0x4
	.4byte	.LCFI50-.LFB59
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
	.byte	0x8e
	.uleb128 0x5
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.byte	0x4
	.4byte	.LCFI52-.LFB60
	.byte	0xe
	.uleb128 0x10
	.align	2
.LEFDE54:
.LSFDE56:
	.4byte	.LEFDE56-.LASFDE56
.LASFDE56:
	.4byte	.Lframe0
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.byte	0x4
	.4byte	.LCFI53-.LFB61
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE56:
.LSFDE58:
	.4byte	.LEFDE58-.LASFDE58
.LASFDE58:
	.4byte	.Lframe0
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.byte	0x4
	.4byte	.LCFI54-.LFB62
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE58:
.LSFDE60:
	.4byte	.LEFDE60-.LASFDE60
.LASFDE60:
	.4byte	.Lframe0
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.byte	0x4
	.4byte	.LCFI55-.LFB63
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE60:
.LSFDE62:
	.4byte	.LEFDE62-.LASFDE62
.LASFDE62:
	.4byte	.Lframe0
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.byte	0x4
	.4byte	.LCFI56-.LFB64
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE62:
.LSFDE64:
	.4byte	.LEFDE64-.LASFDE64
.LASFDE64:
	.4byte	.Lframe0
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
	.byte	0x4
	.4byte	.LCFI57-.LFB65
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE64:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/stdio.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x26e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x1
	.4byte	.LASF34
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x2b
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x47
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x1
	.byte	0x7e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.byte	0x91
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0x9e
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.byte	0xcc
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF6
	.byte	0x1
	.byte	0xfb
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x123
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.ascii	"_fd\000"
	.byte	0x1
	.2byte	0x114
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x12e
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x139
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x145
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.2byte	0x14e
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.2byte	0x16d
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.2byte	0x17c
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.2byte	0x19f
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x1ce
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x155
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x160
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x264
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x248
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x256
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x22c
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x23a
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x2bb
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x2c5
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x2d0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x2dc
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x2e8
	.4byte	.LFB60
	.4byte	.LFE60-.LFB60
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x2f8
	.4byte	.LFB61
	.4byte	.LFE61-.LFB61
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x2fd
	.4byte	.LFB62
	.4byte	.LFE62-.LFB62
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x302
	.4byte	.LFB63
	.4byte	.LFE63-.LFB63
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x307
	.4byte	.LFB64
	.4byte	.LFE64-.LFB64
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x30c
	.4byte	.LFB65
	.4byte	.LFE65-.LFB65
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
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x9
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
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x11c
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
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
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
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF21:
	.ascii	"scanf\000"
.LASF27:
	.ascii	"debug_printf\000"
.LASF22:
	.ascii	"fscanf\000"
.LASF18:
	.ascii	"vsscanf\000"
.LASF10:
	.ascii	"fputc\000"
.LASF4:
	.ascii	"btoa\000"
.LASF1:
	.ascii	"_atob\000"
.LASF25:
	.ascii	"fprintf\000"
.LASF0:
	.ascii	"_getbase\000"
.LASF11:
	.ascii	"_fputc\000"
.LASF13:
	.ascii	"prints\000"
.LASF15:
	.ascii	"print\000"
.LASF6:
	.ascii	"gethex\000"
.LASF7:
	.ascii	"fopen\000"
.LASF16:
	.ascii	"fputs\000"
.LASF30:
	.ascii	"fioctl\000"
.LASF23:
	.ascii	"vsprintf\000"
.LASF5:
	.ascii	"llbtoa\000"
.LASF9:
	.ascii	"fflush\000"
.LASF33:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF24:
	.ascii	"sprintf\000"
.LASF34:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/stdio.c\000"
.LASF2:
	.ascii	"atob\000"
.LASF32:
	.ascii	"putchar\000"
.LASF20:
	.ascii	"vfscanf\000"
.LASF26:
	.ascii	"printf\000"
.LASF14:
	.ascii	"printi\000"
.LASF17:
	.ascii	"fgetc\000"
.LASF29:
	.ascii	"fread\000"
.LASF12:
	.ascii	"printchar\000"
.LASF28:
	.ascii	"fwrite\000"
.LASF8:
	.ascii	"fclose\000"
.LASF3:
	.ascii	"llatob\000"
.LASF19:
	.ascii	"sscanf\000"
.LASF31:
	.ascii	"getchar\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
