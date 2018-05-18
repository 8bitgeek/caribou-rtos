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
	.file	"cbmath.c"
	.text
.Ltext0:
	.global	__aeabi_fcmplt
	.global	__aeabi_fcmpeq
	.global	__aeabi_fmul
	.global	__aeabi_fdiv
	.global	__aeabi_fadd
	.global	__aeabi_fcmpge
	.global	__aeabi_fsub
	.global	__aeabi_f2iz
	.global	__aeabi_idiv
	.section	.text.dtoa,"ax",%progbits
	.align	2
	.global	dtoa
	.code	16
	.thumb_func
	.type	dtoa, %function
dtoa:
.LFB0:
	push	{r4, r5, r6, r7, lr}
.LCFI0:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI1:
	sub	sp, sp, #20
.LCFI2:
	mov	r5, r0
	mov	r9, r1
	mov	fp, r2
	mov	r8, r3
	ldr	r6, [sp, #56]
	cmp	r3, #0
	bge	.L2
	mov	r2, #6
	mov	r8, r2
.L2:
	add	r0, r6, #0
	mov	r1, #0
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.L3
	mov	r3, #128
	lsl	r3, r3, #24
	add	r6, r6, r3
	mov	r3, #45
	strb	r3, [r5]
	add	r5, r5, #1
.L3:
	add	r0, r6, #0
	mov	r1, #0
	bl	__aeabi_fcmpeq
	cmp	r0, #0
	beq	.LCB55
	b	.L5	@long jump
.LCB55:
	add	r0, r6, #0
	ldr	r1, .L48
	bl	__aeabi_fcmplt
	cmp	r0, #0
	bne	.LCB60
	b	.L44	@long jump
.LCB60:
	ldr	r3, .L48+4
	mov	r2, #150
	lsl	r2, r2, #1
	add	r7, r3, r2
	mov	r4, #76
.L13:
	mov	r3, r9
	cmp	r3, #102
	bne	.L8
	cmp	r4, #38
	bgt	.LCB72
	b	.L9	@long jump
.LCB72:
.L8:
	sub	r4, r4, #1
	add	r0, r6, #0
	ldr	r1, [r7]
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.L45
	sub	r7, r7, #4
	cmp	r4, #0
	bne	.L13
	b	.L12
.L45:
	mov	r2, r4
	sub	r2, r2, #38
	str	r2, [sp, #4]
	mov	r3, #37
	neg	r3, r3
	add	r3, r3, r4
	mov	r10, r3
	mov	r2, r9
	cmp	r2, #103
	bne	.L14
	cmp	r3, #6
	ble	.LCB98
	b	.L15	@long jump
.LCB98:
	b	.L28
.L14:
	mov	r3, r9
	cmp	r3, #102
	beq	.LCB105
	b	.L17	@long jump
.LCB105:
.L28:
	add	r8, r8, r10
	mov	r3, r8
	add	r3, r3, #3
	cmp	r3, fp
	ble	.LCB111
	b	.L33	@long jump
.LCB111:
	mov	r2, #102
	mov	r9, r2
	b	.L18
.L30:
	cmp	r4, #0
	bne	.L34
	add	r0, r6, #0
	ldr	r1, .L48+8
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.L46
	add	r0, r6, #0
	ldr	r1, .L48+12
	bl	__aeabi_fmul
	add	r6, r0, #0
	mov	r3, #1
	mov	r10, r3
	mov	r2, #101
	mov	r9, r2
	mov	r3, #39
	neg	r3, r3
	str	r3, [sp, #4]
	b	.L18
.L34:
	mov	r3, #1
	mov	r10, r3
	mov	r2, #101
	mov	r9, r2
	b	.L18
.L46:
	mov	r3, #1
	mov	r10, r3
	mov	r2, #101
	mov	r9, r2
.L18:
	ldr	r7, .L48+4
	lsl	r4, r4, #2
	add	r0, r6, #0
	ldr	r1, [r4, r7]
	bl	__aeabi_fdiv
	add	r4, r0, #0
	mov	r3, #39
	mov	r2, r8
	sub	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r0, [r3, r7]
	mov	r1, #252
	lsl	r1, r1, #22
	bl	__aeabi_fmul
	add	r1, r0, #0
	add	r0, r4, #0
	bl	__aeabi_fadd
	add	r1, sp, #12
	bl	modf
	add	r7, r0, #0
	ldr	r4, [sp, #12]
	add	r0, r4, #0
	ldr	r1, .L48+12
	bl	__aeabi_fcmpge
	cmp	r0, #0
	beq	.L20
	add	r6, r5, #1
	mov	r3, #49
	strb	r3, [r5]
	add	r0, r4, #0
	ldr	r1, .L48+12
	bl	__aeabi_fsub
	str	r0, [sp, #12]
	mov	r5, r6
.L20:
	mov	r3, r8
	cmp	r3, #0
	ble	.L36
	mov	r4, #0
	ldr	r2, .L48+12
	mov	fp, r2
.L24:
	cmp	r4, r10
	bne	.L23
	mov	r3, #46
	strb	r3, [r5]
	add	r5, r5, #1
.L23:
	add	r6, r5, #1
	ldr	r0, [sp, #12]
	bl	__aeabi_f2iz
	add	r0, r0, #48
	strb	r0, [r5]
	add	r0, r7, #0
	mov	r1, fp
	bl	__aeabi_fmul
	add	r1, sp, #12
	bl	modf
	add	r7, r0, #0
	add	r4, r4, #1
	cmp	r4, r8
	beq	.L22
	mov	r5, r6
	b	.L24
.L36:
	mov	r6, r5
.L22:
	mov	r2, r9
	cmp	r2, #102
	beq	.L25
	mov	r3, #101
	strb	r3, [r6]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bge	.L26
	neg	r3, r3
	str	r3, [sp, #4]
	add	r4, r6, #2
	mov	r3, #45
	strb	r3, [r6, #1]
	b	.L27
.L26:
	add	r4, r6, #2
	mov	r3, #43
	strb	r3, [r6, #1]
.L27:
	ldr	r0, [sp, #4]
	mov	r1, #10
	bl	__aeabi_idiv
	mov	r3, r0
	add	r3, r3, #48
	strb	r3, [r4]
	add	r6, r4, #2
	ldr	r3, [sp, #4]
	add	r3, r3, #48
	mov	r2, #10
	neg	r2, r2
	mul	r0, r2
	add	r0, r3, r0
	strb	r0, [r4, #1]
	b	.L25
.L5:
	mov	r2, r9
	cmp	r2, #103
	beq	.L37
	mov	r3, #1
	mov	r10, r3
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r4, #38
	b	.L14
.L9:
	mov	r3, r4
	sub	r3, r3, #38
	str	r3, [sp, #4]
	mov	r2, #37
	neg	r2, r2
	add	r2, r2, r4
	mov	r10, r2
	b	.L28
.L37:
	mov	r3, #1
	mov	r10, r3
	mov	r2, #0
	str	r2, [sp, #4]
	mov	r4, #38
	b	.L28
.L38:
	mov	r3, #38
	str	r3, [sp, #4]
	mov	r4, #76
	mov	r2, #101
	mov	r9, r2
.L17:
	mov	r3, #1
	add	r8, r8, r3
	mov	r2, r8
	cmp	r2, #18
	ble	.L29
	mov	r3, #18
	mov	r8, r3
.L29:
	mov	r2, r9
	cmp	r2, #101
	bne	.LCB320
	b	.L30	@long jump
.LCB320:
	mov	r3, #1
	mov	r10, r3
	b	.L18
.L12:
	mov	r2, r4
	sub	r2, r2, #38
	str	r2, [sp, #4]
	mov	r3, #37
	neg	r3, r3
	add	r3, r3, r4
	mov	r10, r3
	mov	r2, r9
	cmp	r2, #103
	beq	.LCB336
	b	.L14	@long jump
.LCB336:
	b	.L28
.L44:
	mov	r3, r9
	cmp	r3, #103
	beq	.L38
	mov	r2, #39
	mov	r10, r2
	mov	r3, #38
	str	r3, [sp, #4]
	mov	r4, #76
	b	.L14
.L33:
	mov	r2, #18
	mov	r8, r2
.L15:
	mov	r3, #1
	add	r8, r8, r3
	mov	r2, r8
	cmp	r2, #18
	bgt	.LCB361
	b	.L30	@long jump
.LCB361:
	mov	r3, #18
	mov	r8, r3
	b	.L30
.L25:
	mov	r3, #0
	strb	r3, [r6]
	add	r0, r7, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L49:
	.align	2
.L48:
	.word	2123789977
	.word	.LANCHOR0
	.word	7136238
	.word	1092616192
.LFE0:
	.size	dtoa, .-dtoa
	.global	__aeabi_i2f
	.section	.text.atof,"ax",%progbits
	.align	2
	.global	atof
	.code	16
	.thumb_func
	.type	atof, %function
atof:
.LFB1:
	push	{r4, r5, r6, r7, lr}
.LCFI3:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI4:
	sub	sp, sp, #12
.LCFI5:
	mov	r6, r0
	mov	r4, #0
	b	.L51
.L52:
	add	r4, r4, #1
.L51:
	ldrb	r3, [r6, r4]
	cmp	r3, #32
	beq	.L52
	mov	r2, r3
	sub	r2, r2, #9
	cmp	r2, #1
	bls	.L52
	cmp	r3, #43
	bne	.LCB440
	b	.L53	@long jump
.LCB440:
	cmp	r3, #45
	bne	.LCB442
	b	.L54	@long jump
.LCB442:
	mov	r3, #1
	str	r3, [sp, #4]
.L70:
	ldrb	r0, [r6, r4]
	mov	r3, r0
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L72
	add	r7, r4, #1
	mov	r5, #38
	mov	r3, #0
	mov	r8, r3
	ldr	r3, .L79
	mov	r10, r3
	mov	r3, #75
	mov	r9, r3
.L57:
	cmp	r5, #0
	blt	.L56
	lsl	r4, r5, #2
	sub	r0, r0, #48
	bl	__aeabi_i2f
	mov	r3, r10
	ldr	r1, [r4, r3]
	bl	__aeabi_fmul
	add	r1, r0, #0
	mov	r0, r8
	bl	__aeabi_fadd
	mov	r8, r0
.L56:
	sub	r5, r5, #1
	mov	r3, r9
	sub	r3, r3, r5
	mov	fp, r3
	mov	r4, r7
	ldrb	r0, [r6, r7]
	add	r7, r7, #1
	mov	r3, r0
	sub	r3, r3, #48
	cmp	r3, #9
	bls	.L57
	b	.L55
.L72:
	mov	r3, #37
	mov	fp, r3
	mov	r5, #38
	mov	r3, #0
	mov	r8, r3
.L55:
	sub	r0, r0, #46
	neg	r3, r0
	adc	r3, r3, r0
	add	r4, r4, r3
	ldrb	r0, [r6, r4]
	mov	r3, r0
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L59
	lsl	r7, r5, #2
	ldr	r3, .L79
	add	r7, r3, r7
.L61:
	cmp	r5, #0
	blt	.L60
	sub	r0, r0, #48
	bl	__aeabi_i2f
	ldr	r1, [r7]
	bl	__aeabi_fmul
	add	r1, r0, #0
	mov	r0, r8
	bl	__aeabi_fadd
	mov	r8, r0
.L60:
	sub	r5, r5, #1
	add	r4, r4, #1
	ldrb	r0, [r6, r4]
	sub	r7, r7, #4
	mov	r3, r0
	sub	r3, r3, #48
	cmp	r3, #9
	bls	.L61
.L59:
	mov	r3, #32
	bic	r0, r3
	sub	r0, r0, #68
	cmp	r0, #1
	bhi	.L62
	add	r3, r4, #1
	ldrb	r2, [r6, r3]
	cmp	r2, #43
	beq	.L63
	cmp	r2, #45
	beq	.L64
	mov	r0, #1
.L71:
	add	r6, r6, r3
	ldrb	r2, [r6]
	mov	r3, r2
	sub	r3, r3, #48
	cmp	r3, #9
	bhi	.L73
	mov	r3, #0
.L66:
	lsl	r1, r3, #2
	add	r3, r1, r3
	lsl	r3, r3, #1
	add	r3, r3, r2
	sub	r3, r3, #48
	ldrb	r2, [r6, #1]
	add	r6, r6, #1
	mov	r1, r2
	sub	r1, r1, #48
	cmp	r1, #9
	bls	.L66
	b	.L65
.L73:
	mov	r3, #0
.L65:
	mul	r3, r0
	add	fp, fp, r3
.L62:
	mov	r3, fp
	cmp	r3, #0
	blt	.L74
	cmp	r3, #75
	ble	.L68
	cmp	r3, #76
	bne	.L75
	mov	r0, r8
	ldr	r1, .L79+4
	bl	__aeabi_fcmplt
	cmp	r0, #0
	beq	.L77
.L68:
	mov	r3, fp
	lsl	r2, r3, #2
	mov	r0, r8
	ldr	r3, .L79
	ldr	r1, [r2, r3]
	bl	__aeabi_fmul
	add	r4, r0, #0
	b	.L67
.L74:
	mov	r4, #0
	b	.L67
.L75:
	mov	r4, #254
	lsl	r4, r4, #23
	b	.L67
.L77:
	mov	r4, #254
	lsl	r4, r4, #23
.L67:
	ldr	r0, [sp, #4]
	bl	__aeabi_i2f
	add	r1, r4, #0
	bl	__aeabi_fmul
	b	.L78
.L54:
	add	r4, r4, #1
	mov	r3, #1
	neg	r3, r3
	str	r3, [sp, #4]
	b	.L70
.L53:
	add	r4, r4, #1
	mov	r3, #1
	str	r3, [sp, #4]
	b	.L70
.L64:
	add	r3, r4, #2
	mov	r0, #1
	neg	r0, r0
	b	.L71
.L63:
	add	r3, r4, #2
	mov	r0, #1
	b	.L71
.L78:
	add	sp, sp, #12
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L80:
	.align	2
.L79:
	.word	.LANCHOR0
	.word	1071237085
.LFE1:
	.size	atof, .-atof
	.global	powten
	.section	.rodata.powten,"a",%progbits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	powten, %object
	.size	powten, 308
powten:
	.word	7136238
	.word	34086122
	.word	61482021
	.word	89435438
	.word	117763133
	.word	145106764
	.word	172994847
	.word	201445043
	.word	228737632
	.word	256561912
	.word	285050806
	.word	312374482
	.word	340136454
	.word	368547464
	.word	396017173
	.word	423718298
	.word	452053249
	.word	479665568
	.word	507307272
	.word	535567946
	.word	563319535
	.word	590903210
	.word	619091349
	.word	646978941
	.word	674505948
	.word	702623251
	.word	730643660
	.word	758115327
	.word	786163455
	.word	814313567
	.word	841731191
	.word	869711765
	.word	897988541
	.word	925353388
	.word	953267991
	.word	981668463
	.word	1008981770
	.word	1036831949
	.word	1065353216
	.word	1092616192
	.word	1120403456
	.word	1148846080
	.word	1176256512
	.word	1203982336
	.word	1232348160
	.word	1259902592
	.word	1287568416
	.word	1315859240
	.word	1343554297
	.word	1371161527
	.word	1399379109
	.word	1427211495
	.word	1454761505
	.word	1482907561
	.word	1510874058
	.word	1538368188
	.word	1566444395
	.word	1594541859
	.word	1621981420
	.word	1649989415
	.word	1678214776
	.word	1705601046
	.word	1733542428
	.word	1761892689
	.word	1789226918
	.word	1817103247
	.word	1845575481
	.word	1872858888
	.word	1900671690
	.word	1929146236
	.word	1956496814
	.word	1984247577
	.word	2012644575
	.word	2040140556
	.word	2067830734
	.word	2096152002
	.word	2123789977
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
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x38
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI3-.LFB1
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
	.4byte	.LCFI4-.LCFI3
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
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x30
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/cbmath.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x48
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0x1
	.4byte	.LASF1
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x3b
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x3d
	.byte	0
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0xab
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
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
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x3c
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
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
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
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF0:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/cbmath.c\000"
.LASF4:
	.ascii	"atof\000"
.LASF3:
	.ascii	"modf\000"
.LASF2:
	.ascii	"dtoa\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
