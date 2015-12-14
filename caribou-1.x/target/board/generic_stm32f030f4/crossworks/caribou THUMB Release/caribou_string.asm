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
.LFB0:
	push	{r4, lr}
.LCFI0:
	cmp	r0, #0
	beq	.L2
.LBB2:
	cmp	r2, #0
	beq	.L2
	mov	r3, #0
.L3:
	ldrb	r4, [r1, r3]
	strb	r4, [r0, r3]
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L3
.L2:
.LBE2:
	@ sp needed
	pop	{r4, pc}
.LFE0:
	.size	memcpy, .-memcpy
	.section	.text.memmove,"ax",%progbits
	.align	2
	.global	memmove
	.code	16
	.thumb_func
	.type	memmove, %function
memmove:
.LFB1:
	push	{r4, r5, r6, lr}
.LCFI1:
	cmp	r0, #0
	beq	.L5
	cmp	r0, r1
	bhi	.L6
.L8:
	mov	r3, #0
	cmp	r2, #0
	bne	.L11
	b	.L5
.L6:
	add	r5, r1, r2
	cmp	r0, r5
	bcs	.L8
	add	r6, r0, r2
	sub	r3, r2, #1
	cmp	r2, #0
	beq	.L5
	neg	r2, r2
.L9:
	add	r1, r5, r2
	ldrb	r4, [r1, r3]
	add	r1, r6, r2
	strb	r4, [r1, r3]
	sub	r3, r3, #1
	bcs	.L9
	b	.L5
.L11:
	ldrb	r4, [r1, r3]
	strb	r4, [r0, r3]
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L11
.L5:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE1:
	.size	memmove, .-memmove
	.section	.text.memset,"ax",%progbits
	.align	2
	.global	memset
	.code	16
	.thumb_func
	.type	memset, %function
memset:
.LFB2:
	cmp	r0, #0
	beq	.L13
.LBB3:
	cmp	r2, #0
	beq	.L13
	mov	r3, r0
	add	r2, r2, r0
.L14:
	strb	r1, [r3]
	add	r3, r3, #1
	cmp	r3, r2
	bne	.L14
.L13:
.LBE3:
	@ sp needed
	bx	lr
.LFE2:
	.size	memset, .-memset
	.section	.text.memcmp,"ax",%progbits
	.align	2
	.global	memcmp
	.code	16
	.thumb_func
	.type	memcmp, %function
memcmp:
.LFB3:
	push	{r4, lr}
.LCFI2:
.LBB4:
	cmp	r2, #0
	beq	.L21
	ldrb	r4, [r0]
	ldrb	r3, [r1]
	add	r2, r0, r2
	cmp	r4, r3
	beq	.L19
	b	.L17
.L20:
	ldrb	r4, [r0]
	ldrb	r3, [r1]
	cmp	r4, r3
	beq	.L19
.L17:
	sub	r0, r4, r3
	b	.L16
.L19:
	add	r0, r0, #1
	add	r1, r1, #1
	cmp	r0, r2
	bne	.L20
.LBE4:
	mov	r0, #0
.LBB5:
	b	.L16
.L21:
.LBE5:
	mov	r0, #0
.L16:
	@ sp needed
	pop	{r4, pc}
.LFE3:
	.size	memcmp, .-memcmp
	.section	.text.strcpy,"ax",%progbits
	.align	2
	.global	strcpy
	.code	16
	.thumb_func
	.type	strcpy, %function
strcpy:
.LFB4:
	mov	r3, #0
.L25:
	ldrb	r2, [r1, r3]
	strb	r2, [r0, r3]
	add	r3, r3, #1
	cmp	r2, #0
	bne	.L25
	@ sp needed
	bx	lr
.LFE4:
	.size	strcpy, .-strcpy
	.section	.text.strncpy,"ax",%progbits
	.align	2
	.global	strncpy
	.code	16
	.thumb_func
	.type	strncpy, %function
strncpy:
.LFB5:
	push	{r4, lr}
.LCFI3:
	mov	r3, #0
.L28:
	cmp	r3, r2
	beq	.L27
	ldrb	r4, [r1, r3]
	strb	r4, [r0, r3]
	add	r3, r3, #1
	cmp	r4, #0
	bne	.L28
.L27:
	@ sp needed
	pop	{r4, pc}
.LFE5:
	.size	strncpy, .-strncpy
	.section	.text.strcmp,"ax",%progbits
	.align	2
	.global	strcmp
	.code	16
	.thumb_func
	.type	strcmp, %function
strcmp:
.LFB6:
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L30
	ldrb	r2, [r1]
	cmp	r2, r3
	bne	.L34
.L32:
	add	r0, r0, #1
	add	r1, r1, #1
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L30
	ldrb	r2, [r1]
	cmp	r2, r3
	beq	.L32
.L34:
	ldrb	r0, [r1]
	cmp	r3, r0
	sbc	r0, r0, r0
	mov	r2, #1
	orr	r0, r2
	b	.L37
.L30:
	ldrb	r2, [r1]
	mov	r0, #0
	cmp	r2, #0
	bne	.L34
.L37:
	@ sp needed
	bx	lr
.LFE6:
	.size	strcmp, .-strcmp
	.section	.text.strcasecmp,"ax",%progbits
	.align	2
	.global	strcasecmp
	.code	16
	.thumb_func
	.type	strcasecmp, %function
strcasecmp:
.LFB7:
	push	{r4, r5, r6, lr}
.LCFI4:
	ldrb	r3, [r0]
	cmp	r3, #0
	bne	.L40
	b	.L52
.L45:
	add	r0, r0, #1
	add	r1, r1, #1
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L52
.L40:
	mov	r5, r3
	mov	r2, r3
	sub	r2, r2, #97
	cmp	r2, #25
	bhi	.L42
	sub	r5, r5, #32
.L42:
	ldrb	r2, [r1]
	mov	r6, r2
	sub	r6, r6, #97
	mov	r4, r2
	cmp	r6, #25
	bhi	.L44
	sub	r4, r4, #32
.L44:
	cmp	r5, r4
	beq	.L45
	cmp	r3, #0
	bne	.L46
.L52:
	ldrb	r2, [r1]
	mov	r0, #0
	cmp	r2, #0
	bne	.L49
	b	.L47
.L46:
	mov	r2, r3
	sub	r2, r2, #97
	cmp	r2, #25
	bhi	.L49
	sub	r3, r3, #32
.L49:
	ldrb	r2, [r1]
	mov	r0, r2
	sub	r0, r0, #97
	mov	r1, r2
	cmp	r0, #25
	bhi	.L51
	sub	r1, r1, #32
.L51:
	mov	r0, #1
	cmp	r3, r1
	bge	.L47
	neg	r0, r0
.L47:
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE7:
	.size	strcasecmp, .-strcasecmp
	.section	.text.strncmp,"ax",%progbits
	.align	2
	.global	strncmp
	.code	16
	.thumb_func
	.type	strncmp, %function
strncmp:
.LFB8:
	push	{r4, lr}
.LCFI5:
	mov	r3, r0
	mov	r0, #0
	cmp	r2, #0
	beq	.L56
	sub	r2, r2, #1
	cmp	r2, #0
	beq	.L57
	ldrb	r0, [r3]
	cmp	r0, #0
	beq	.L57
	ldrb	r4, [r1]
	cmp	r4, r0
	bne	.L57
.L58:
	add	r3, r3, #1
	add	r1, r1, #1
	sub	r2, r2, #1
	cmp	r2, #0
	beq	.L57
	ldrb	r0, [r3]
	cmp	r0, #0
	beq	.L57
	ldrb	r4, [r1]
	cmp	r4, r0
	beq	.L58
.L57:
	ldrb	r0, [r3]
	ldrb	r3, [r1]
	sub	r0, r0, r3
.L56:
	@ sp needed
	pop	{r4, pc}
.LFE8:
	.size	strncmp, .-strncmp
	.section	.text.strncasecmp,"ax",%progbits
	.align	2
	.global	strncasecmp
	.code	16
	.thumb_func
	.type	strncasecmp, %function
strncasecmp:
.LFB9:
	push	{r4, r5, r6, lr}
.LCFI6:
	sub	r2, r2, #1
	mov	r3, #0
.L64:
	ldrb	r4, [r0, r3]
	mov	r5, r4
	sub	r5, r5, #65
	cmp	r5, #25
	bhi	.L61
	add	r4, r4, #32
.L61:
	ldrb	r5, [r1, r3]
	mov	r6, r5
	sub	r6, r6, #65
	cmp	r6, #25
	bhi	.L62
	add	r5, r5, #32
.L62:
	cmp	r3, r2
	beq	.L63
	cmp	r4, #0
	beq	.L63
	add	r3, r3, #1
	cmp	r4, r5
	beq	.L64
.L63:
	sub	r0, r4, r5
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE9:
	.size	strncasecmp, .-strncasecmp
	.section	.text.strlen,"ax",%progbits
	.align	2
	.global	strlen
	.code	16
	.thumb_func
	.type	strlen, %function
strlen:
.LFB10:
	cmp	r0, #0
	beq	.L68
.LBB6:
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L69
	mov	r3, #0
.L67:
	add	r3, r3, #1
	ldrb	r2, [r0, r3]
	cmp	r2, #0
	bne	.L67
	b	.L66
.L68:
.LBE6:
	mov	r3, #0
	b	.L66
.L69:
.LBB7:
	mov	r3, #0
.L66:
.LBE7:
	mov	r0, r3
	@ sp needed
	bx	lr
.LFE10:
	.size	strlen, .-strlen
	.section	.text.strchr,"ax",%progbits
	.align	2
	.global	strchr
	.code	16
	.thumb_func
	.type	strchr, %function
strchr:
.LFB11:
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L74
	cmp	r3, r1
	bne	.L72
	b	.L71
.L73:
	cmp	r3, r1
	beq	.L71
.L72:
	add	r0, r0, #1
	ldrb	r3, [r0]
	cmp	r3, #0
	bne	.L73
	mov	r0, #0
	b	.L71
.L74:
	mov	r0, #0
.L71:
	@ sp needed
	bx	lr
.LFE11:
	.size	strchr, .-strchr
	.section	.text.strcat,"ax",%progbits
	.align	2
	.global	strcat
	.code	16
	.thumb_func
	.type	strcat, %function
strcat:
.LFB12:
	push	{r4, lr}
.LCFI7:
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L82
	mov	r3, r0
.L79:
	add	r3, r3, #1
	ldrb	r2, [r3]
	cmp	r2, #0
	bne	.L79
	b	.L81
.L82:
	mov	r3, r0
.L81:
	ldrb	r4, [r1]
	strb	r4, [r3]
	add	r3, r3, #1
	ldrb	r2, [r1]
	add	r1, r1, #1
	cmp	r2, #0
	bne	.L81
	@ sp needed
	pop	{r4, pc}
.LFE12:
	.size	strcat, .-strcat
	.section	.text.atoi,"ax",%progbits
	.align	2
	.global	atoi
	.code	16
	.thumb_func
	.type	atoi, %function
atoi:
.LFB13:
	push	{r4, r5, r6, r7, lr}
.LCFI8:
	mov	r3, r0
	b	.L84
.L85:
	add	r3, r3, #1
.L84:
	ldrb	r2, [r3]
	cmp	r2, #32
	beq	.L85
	cmp	r2, #9
	beq	.L85
	mov	r0, #0
	cmp	r2, #0
	beq	.L86
	mov	r2, #1
	b	.L87
.L88:
.LBB8:
	add	r2, r2, #1
.L87:
	ldrb	r1, [r3, r2]
	mov	r0, r1
	sub	r0, r0, #48
	cmp	r0, #9
	bls	.L88
	sub	r1, r1, #45
	cmp	r1, #1
	bls	.L88
	sub	r2, r2, #1
	bmi	.L95
	mov	r4, #1
.LBE8:
	mov	r0, #0
.LBB9:
	mov	r7, #1
	mov	r6, #0
	b	.L89
.L92:
	cmp	r1, #45
	bne	.L90
.L93:
	neg	r0, r0
	b	.L86
.L90:
	cmp	r1, #46
	beq	.L96
	sub	r1, r1, #48
	mul	r1, r4
	add	r0, r0, r1
	lsl	r1, r4, #2
	add	r4, r1, r4
	lsl	r4, r4, #1
	b	.L91
.L96:
	mov	r4, r7
	mov	r0, r6
	b	.L91
.L97:
	mov	r4, r7
	mov	r0, r6
.L91:
	sub	r2, r2, #1
	bcc	.L86
.L89:
	ldrb	r1, [r3, r2]
	mov	r5, r1
	sub	r5, r5, #48
	cmp	r5, #9
	bls	.L92
	cmp	r1, #46
	beq	.L97
	cmp	r1, #45
	beq	.L93
	b	.L86
.L95:
.LBE9:
	mov	r0, #0
.L86:
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE13:
	.size	atoi, .-atoi
	.section	.text.strdup,"ax",%progbits
	.align	2
	.global	strdup
	.code	16
	.thumb_func
	.type	strdup, %function
strdup:
.LFB14:
	push	{r4, lr}
.LCFI9:
	mov	r4, r0
	bl	strlen
	add	r0, r0, #1
	bl	malloc
	cmp	r0, #0
	beq	.L100
	mov	r1, r4
	bl	strcpy
.L100:
	@ sp needed
	pop	{r4, pc}
.LFE14:
	.size	strdup, .-strdup
	.section	.text.strncat,"ax",%progbits
	.align	2
	.global	strncat
	.code	16
	.thumb_func
	.type	strncat, %function
strncat:
.LFB15:
	push	{r4, lr}
.LCFI10:
	cmp	r2, #0
	beq	.L102
.LBB10:
	ldrb	r3, [r0]
	cmp	r3, #0
	beq	.L107
	mov	r3, r0
.L104:
	add	r3, r3, #1
	ldrb	r4, [r3]
	cmp	r4, #0
	bne	.L104
	b	.L106
.L107:
	mov	r3, r0
.L106:
	ldrb	r4, [r1]
	strb	r4, [r3]
	cmp	r4, #0
	beq	.L105
	add	r3, r3, #1
	sub	r2, r2, #1
	add	r1, r1, #1
	cmp	r2, #0
	bne	.L106
.L105:
	mov	r2, #0
	strb	r2, [r3]
.L102:
.LBE10:
	@ sp needed
	pop	{r4, pc}
.LFE15:
	.size	strncat, .-strncat
	.section	.text.strcspn,"ax",%progbits
	.align	2
	.global	strcspn
	.code	16
	.thumb_func
	.type	strcspn, %function
strcspn:
.LFB16:
	push	{r4, r5, r6, r7, lr}
.LCFI11:
	mov	r7, r0
	ldrb	r4, [r0]
	mov	r0, #0
	cmp	r4, #0
	beq	.L115
	b	.L109
.L111:
	add	r3, r3, #1
	cmp	r4, r2
	beq	.L115
.L113:
	ldrb	r2, [r3]
	cmp	r2, #0
	bne	.L111
	b	.L112
.L109:
	ldrb	r6, [r1]
	mov	r0, #0
	mov	r5, #0
	add	r1, r1, #1
.L114:
	cmp	r6, #0
	beq	.L112
	cmp	r4, r6
	beq	.L115
	mov	r3, r1
	b	.L113
.L112:
	add	r5, r5, #1
	mov	r0, r5
	ldrb	r4, [r7, r5]
	cmp	r4, #0
	bne	.L114
.L115:
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE16:
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI1-.LFB1
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI2-.LFB3
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
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI3-.LFB5
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
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI4-.LFB7
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
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI5-.LFB8
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
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI6-.LFB9
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
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI7-.LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI8-.LFB13
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
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI9-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x4
	.4byte	.LCFI10-.LFB15
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x4
	.4byte	.LCFI11-.LFB16
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
	.align	2
.LEFDE32:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/string.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x13d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x1
	.4byte	.LASF18
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x15
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x27
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x41
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x51
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x62
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x77
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0x82
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8d
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x1
	.byte	0x9e
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0xac
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x1
	.byte	0xc7
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x1
	.byte	0xd5
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x1
	.byte	0xf6
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.2byte	0x103
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.2byte	0x115
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
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
	.4byte	0x9c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF3:
	.ascii	"memcmp\000"
.LASF8:
	.ascii	"strncmp\000"
.LASF10:
	.ascii	"strlen\000"
.LASF16:
	.ascii	"strcspn\000"
.LASF6:
	.ascii	"strcmp\000"
.LASF15:
	.ascii	"strncat\000"
.LASF14:
	.ascii	"strdup\000"
.LASF7:
	.ascii	"strcasecmp\000"
.LASF18:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/string.c\000"
.LASF12:
	.ascii	"strcat\000"
.LASF9:
	.ascii	"strncasecmp\000"
.LASF11:
	.ascii	"strchr\000"
.LASF13:
	.ascii	"atoi\000"
.LASF17:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"memmove\000"
.LASF2:
	.ascii	"memset\000"
.LASF0:
	.ascii	"memcpy\000"
.LASF5:
	.ascii	"strncpy\000"
.LASF4:
	.ascii	"strcpy\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
