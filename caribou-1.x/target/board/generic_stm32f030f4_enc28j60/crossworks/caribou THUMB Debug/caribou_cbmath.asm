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
	.align	1
	.global	dtoa
	.code	16
	.thumb_func
	.type	dtoa, %function
dtoa:
.LFB0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../../src/lib/cbmath.c"
	.loc 1 60 0
.LVL0:
	push	{r4, r5, r6, r7, lr}
.LCFI0:
	sub	sp, sp, #28
.LCFI1:
	.loc 1 60 0
	mov	r4, r0
	str	r1, [sp]
	str	r2, [sp, #12]
	mov	r7, r3
	ldr	r6, [sp, #48]
	.loc 1 70 0
	bpl	.L2
	.loc 1 71 0
	mov	r7, #6
.L2:
.LVL1:
	.loc 1 74 0
	add	r0, r6, #0
.LVL2:
	mov	r1, #0
.LVL3:
	bl	__aeabi_fcmplt
.LVL4:
	cmp	r0, #0
	beq	.L3
	.loc 1 76 0
	mov	r2, #128
	lsl	r2, r2, #24
	.loc 1 77 0
	mov	r3, #45
	strb	r3, [r4]
	.loc 1 76 0
	add	r6, r6, r2
.LVL5:
	.loc 1 77 0
	add	r4, r4, #1
.LVL6:
.L3:
	.loc 1 81 0
	add	r0, r6, #0
	mov	r1, #0
	bl	__aeabi_fcmpeq
.LVL7:
	.loc 1 82 0
	mov	r5, #38
	.loc 1 81 0
	cmp	r0, #0
	bne	.L5
	mov	r5, #76
.L6:
.LVL8:
	.loc 1 85 0 discriminator 1
	ldr	r2, .L45
	lsl	r3, r5, #2
	add	r0, r6, #0
	ldr	r1, [r2, r3]
	bl	__aeabi_fcmplt
.LVL9:
	cmp	r0, #0
	beq	.L5
	.loc 1 85 0 is_stmt 0 discriminator 2
	cmp	r5, #0
	beq	.L5
	.loc 1 87 0 is_stmt 1
	ldr	r3, [sp]
	cmp	r3, #102
	bne	.L7
	.loc 1 87 0 is_stmt 0 discriminator 1
	cmp	r5, #38
	ble	.L5
.L7:
	.loc 1 85 0 is_stmt 1
	sub	r5, r5, #1
.LVL10:
	b	.L6
.LVL11:
.L5:
	.loc 1 91 0
	mov	r3, r5
	sub	r3, r3, #38
	str	r3, [sp, #4]
.LVL12:
	.loc 1 92 0
	mov	r2, r5
	.loc 1 95 0
	ldr	r3, [sp]
.LVL13:
	.loc 1 92 0
	sub	r2, r2, #37
	str	r2, [sp, #8]
.LVL14:
	.loc 1 95 0
	cmp	r3, #103
	bne	.L10
	.loc 1 97 0
	cmp	r2, #6
	bgt	.L27
	b	.L12
.L10:
.LVL15:
	.loc 1 105 0
	ldr	r2, [sp]
	cmp	r2, #102
	bne	.L11
.LVL16:
.L12:
	.loc 1 107 0
	ldr	r3, [sp, #8]
	.loc 1 108 0
	ldr	r2, [sp, #12]
	.loc 1 107 0
	add	r7, r7, r3
.LVL17:
	.loc 1 108 0
	add	r3, r7, #2
	cmp	r3, r2
	bge	.L28
	mov	r3, #102
	str	r3, [sp]
	b	.L13
.LVL18:
.L27:
	.loc 1 98 0
	mov	r2, #101
.LVL19:
	str	r2, [sp]
.LVL20:
.L11:
	.loc 1 117 0
	add	r7, r7, #1
	cmp	r7, #18
	bgt	.L39
.LVL21:
.L23:
	.loc 1 123 0
	ldr	r2, [sp]
	cmp	r2, #101
	bne	.L42
.LVL22:
	mov	r2, #1
	str	r2, [sp, #8]
	.loc 1 123 0 is_stmt 0 discriminator 1
	cmp	r5, #0
	beq	.L43
.LVL23:
.L13:
	.loc 1 128 0 is_stmt 1
	ldr	r3, .L45
	lsl	r5, r5, #2
.LVL24:
	ldr	r1, [r3, r5]
	add	r0, r6, #0
	bl	__aeabi_fdiv
.LVL25:
	mov	r3, #39
	ldr	r2, .L45
	sub	r3, r3, r7
	lsl	r3, r3, #2
	mov	r1, #252
	add	r5, r0, #0
	lsl	r1, r1, #22
	ldr	r0, [r2, r3]
	bl	__aeabi_fmul
.LVL26:
	add	r1, r0, #0
	add	r0, r5, #0
	bl	__aeabi_fadd
.LVL27:
	.loc 1 129 0
	add	r1, sp, #20
	bl	modf
.LVL28:
	.loc 1 130 0
	ldr	r5, [sp, #20]
	.loc 1 129 0
	add	r6, r0, #0
.LVL29:
	.loc 1 130 0
	ldr	r1, .L45+4
	add	r0, r5, #0
.LVL30:
	bl	__aeabi_fcmpge
.LVL31:
	cmp	r0, #0
	beq	.L15
	.loc 1 132 0
	add	r3, r4, #1
	str	r3, [sp, #12]
.LVL32:
	mov	r3, #49
.LVL33:
	strb	r3, [r4]
	.loc 1 133 0
	add	r0, r5, #0
	ldr	r1, .L45+4
	bl	__aeabi_fsub
.LVL34:
	.loc 1 132 0
	ldr	r4, [sp, #12]
	.loc 1 133 0
	str	r0, [sp, #20]
.LVL35:
.L15:
	.loc 1 140 0 discriminator 1
	mov	r5, #0
.LVL36:
.L17:
	.loc 1 137 0 discriminator 1
	cmp	r5, r7
	bge	.L44
	.loc 1 139 0
	ldr	r2, [sp, #8]
	cmp	r5, r2
	bne	.L18
.LVL37:
	.loc 1 140 0
	mov	r3, #46
	strb	r3, [r4]
	add	r4, r4, #1
.LVL38:
.L18:
	.loc 1 141 0
	add	r3, r4, #1
	ldr	r0, [sp, #20]
	str	r3, [sp, #12]
.LVL39:
	bl	__aeabi_f2iz
.LVL40:
	add	r0, r0, #48
	strb	r0, [r4]
	.loc 1 142 0
	ldr	r1, .L45+4
	add	r0, r6, #0
	bl	__aeabi_fmul
.LVL41:
	add	r1, sp, #20
	bl	modf
.LVL42:
	.loc 1 137 0
	add	r5, r5, #1
.LVL43:
	.loc 1 142 0
	add	r6, r0, #0
.LVL44:
	.loc 1 141 0
	ldr	r4, [sp, #12]
	b	.L17
.LVL45:
.L44:
	.loc 1 147 0
	ldr	r2, [sp]
	cmp	r2, #102
	beq	.L20
.LVL46:
	.loc 1 149 0
	mov	r3, #101
	strb	r3, [r4]
	.loc 1 150 0
	ldr	r3, [sp, #4]
	add	r5, r4, #2
.LVL47:
	cmp	r3, #0
	bge	.L21
	.loc 1 152 0
	neg	r3, r3
	str	r3, [sp, #4]
.LVL48:
	.loc 1 153 0
	mov	r3, #45
.LVL49:
	b	.L40
.LVL50:
.L21:
	.loc 1 156 0
	mov	r3, #43
.L40:
	strb	r3, [r4, #1]
	.loc 1 157 0
	ldr	r0, [sp, #4]
	mov	r1, #10
	bl	__aeabi_idiv
.LVL51:
	.loc 1 159 0
	mov	r2, #10
	.loc 1 158 0
	mov	r3, r0
	.loc 1 159 0
	neg	r2, r2
	.loc 1 158 0
	add	r3, r3, #48
	.loc 1 159 0
	mul	r0, r2
.LVL52:
	.loc 1 158 0
	strb	r3, [r5]
	.loc 1 159 0
	ldr	r3, [sp, #4]
.LVL53:
	add	r4, r5, #2
.LVL54:
	add	r3, r3, #48
	add	r0, r3, r0
	strb	r0, [r5, #1]
	b	.L20
.LVL55:
.L28:
	.loc 1 110 0
	mov	r3, #101
	str	r3, [sp]
.LVL56:
.L39:
	mov	r7, #18
	b	.L23
.LVL57:
.L43:
	.loc 1 123 0 discriminator 1
	add	r0, r6, #0
	ldr	r1, .L45+8
	bl	__aeabi_fcmplt
.LVL58:
	cmp	r0, #0
	beq	.L13
	.loc 1 125 0
	add	r0, r6, #0
	ldr	r1, .L45+4
	bl	__aeabi_fmul
.LVL59:
	.loc 1 126 0
	mov	r3, #39
	neg	r3, r3
	.loc 1 125 0
	add	r6, r0, #0
.LVL60:
	.loc 1 126 0
	str	r3, [sp, #4]
	b	.L13
.LVL61:
.L42:
	mov	r3, #1
	str	r3, [sp, #8]
	b	.L13
.LVL62:
.L20:
	.loc 1 162 0
	mov	r3, #0
	.loc 1 165 0
	add	r0, r6, #0
	.loc 1 162 0
	strb	r3, [r4]
	.loc 1 165 0
	add	sp, sp, #28
	@ sp needed
.LVL63:
.LVL64:
.LVL65:
	pop	{r4, r5, r6, r7, pc}
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.word	1092616192
	.word	7136238
.LFE0:
	.size	dtoa, .-dtoa
	.global	__aeabi_i2f
	.section	.text.atof,"ax",%progbits
	.align	1
	.global	atof
	.code	16
	.thumb_func
	.type	atof, %function
atof:
.LFB1:
	.loc 1 172 0
.LVL66:
	push	{r4, r5, r6, r7, lr}
.LCFI2:
	.loc 1 177 0
	mov	r2, r0
	.loc 1 172 0
	sub	sp, sp, #20
.LCFI3:
	.loc 1 172 0
	mov	r6, r0
.LVL67:
.L48:
	.loc 1 177 0 discriminator 1
	ldrb	r3, [r2]
	sub	r4, r2, r6
.LVL68:
	cmp	r3, #32
	bne	.L84
.L49:
.LVL69:
	add	r2, r2, #1
.LVL70:
	b	.L48
.LVL71:
.L84:
	mov	r1, r3
	sub	r1, r1, #9
	cmp	r1, #1
	bls	.L49
.LVL72:
	.loc 1 180 0
	cmp	r3, #43
	beq	.L50
	.loc 1 179 0 discriminator 1
	mov	r2, #1
	str	r2, [sp, #4]
	.loc 1 180 0 discriminator 1
	cmp	r3, #45
	bne	.L51
.L50:
	.loc 1 181 0
	sub	r3, r3, #43
	sub	r2, r3, #1
	sbc	r3, r3, r2
	neg	r3, r3
	mov	r2, #1
	orr	r2, r3
	add	r4, r4, #1
.LVL73:
	str	r2, [sp, #4]
.L51:
.LVL74:
	.loc 1 184 0
	mov	r7, #38
	mov	r5, #0
.LVL75:
.L52:
	mov	r3, #75
	sub	r3, r3, r7
	str	r3, [sp]
.LVL76:
	.loc 1 184 0 is_stmt 0 discriminator 1
	ldrb	r3, [r6, r4]
.LVL77:
	mov	r0, r3
	sub	r0, r0, #48
	uxtb	r2, r0
	cmp	r2, #9
	bhi	.L85
	.loc 1 186 0 is_stmt 1
	cmp	r7, #0
	blt	.L53
	lsl	r3, r7, #2
	str	r3, [sp]
.LVL78:
	.loc 1 187 0
	bl	__aeabi_i2f
.LVL79:
	ldr	r3, .L88
	ldr	r2, [sp]
	ldr	r1, [r2, r3]
	bl	__aeabi_fmul
.LVL80:
	add	r1, r0, #0
	add	r0, r5, #0
	bl	__aeabi_fadd
.LVL81:
	add	r5, r0, #0
.LVL82:
.L53:
	.loc 1 188 0
	sub	r7, r7, #1
.LVL83:
	.loc 1 184 0
	add	r4, r4, #1
.LVL84:
	b	.L52
.LVL85:
.L85:
	.loc 1 194 0
	sub	r3, r3, #46
	neg	r2, r3
	adc	r3, r3, r2
	add	r4, r4, r3
.LVL86:
	add	r7, r4, r7
	ldr	r2, .L88
	lsl	r3, r7, #2
	add	r3, r2, r3
	str	r7, [sp, #8]
	str	r3, [sp, #12]
.L56:
.LVL87:
	.loc 1 196 0 discriminator 1
	ldrb	r3, [r6, r4]
	mov	r0, r3
	sub	r0, r0, #48
	uxtb	r2, r0
	cmp	r2, #9
	bhi	.L86
	ldr	r2, [sp, #8]
	sub	r3, r2, r4
	.loc 1 198 0
	bmi	.L57
	.loc 1 199 0
	bl	__aeabi_i2f
.LVL88:
	lsl	r7, r4, #2
	ldr	r3, [sp, #12]
	neg	r7, r7
	ldr	r1, [r3, r7]
	bl	__aeabi_fmul
.LVL89:
	add	r1, r0, #0
	add	r0, r5, #0
	bl	__aeabi_fadd
.LVL90:
	add	r5, r0, #0
.LVL91:
.L57:
	.loc 1 196 0
	add	r4, r4, #1
.LVL92:
	b	.L56
.L86:
	.loc 1 203 0 discriminator 1
	mov	r2, #32
	bic	r3, r2
	sub	r3, r3, #68
	cmp	r3, #1
	bhi	.L59
	.loc 1 205 0
	add	r2, r4, #1
.LVL93:
	.loc 1 208 0
	ldrb	r1, [r6, r2]
	cmp	r1, #43
	beq	.L60
	.loc 1 206 0 discriminator 1
	mov	r0, #1
	.loc 1 208 0 discriminator 1
	cmp	r1, #45
	bne	.L61
.L60:
	.loc 1 209 0
	sub	r1, r1, #43
	sub	r0, r1, #1
	sbc	r1, r1, r0
	neg	r1, r1
	mov	r0, #1
	add	r2, r4, #2
.LVL94:
	orr	r0, r1
.L61:
.LVL95:
	add	r6, r6, r2
.LVL96:
	.loc 1 210 0
	mov	r3, #0
.LVL97:
.L62:
	.loc 1 210 0 is_stmt 0 discriminator 1
	ldrb	r2, [r6]
	add	r6, r6, #1
.LVL98:
	mov	r1, r2
	sub	r1, r1, #48
	cmp	r1, #9
	bhi	.L87
	.loc 1 211 0 is_stmt 1 discriminator 2
	mov	r1, #10
	mul	r3, r1
.LVL99:
	add	r3, r3, r2
	sub	r3, r3, #48
.LVL100:
	b	.L62
.LVL101:
.L87:
	.loc 1 212 0
	mul	r3, r0
.LVL102:
	.loc 1 215 0
	ldr	r2, [sp]
	add	r2, r2, r3
	str	r2, [sp]
	bmi	.L71
.LVL103:
.L59:
	.loc 1 217 0
	ldr	r3, [sp]
	cmp	r3, #75
	ble	.L65
	.loc 1 217 0 is_stmt 0 discriminator 1
	cmp	r3, #76
	bne	.L83
	add	r0, r5, #0
	ldr	r1, .L88+4
	bl	__aeabi_fcmplt
.LVL104:
	cmp	r0, #0
	beq	.L83
.L65:
	.loc 1 218 0 is_stmt 1
	ldr	r3, [sp]
	add	r0, r5, #0
	lsl	r2, r3, #2
	ldr	r3, .L88
	ldr	r1, [r2, r3]
	bl	__aeabi_fmul
.LVL105:
	add	r4, r0, #0
.LVL106:
	b	.L64
.LVL107:
.L71:
	.loc 1 216 0
	mov	r4, #0
	b	.L64
.LVL108:
.L83:
	.loc 1 222 0
	mov	r4, #254
	lsl	r4, r4, #23
.LVL109:
.L64:
	.loc 1 230 0
	ldr	r0, [sp, #4]
	bl	__aeabi_i2f
.LVL110:
	add	r1, r4, #0
	bl	__aeabi_fmul
.LVL111:
	.loc 1 231 0
	add	sp, sp, #20
.LVL112:
	@ sp needed
.LVL113:
	pop	{r4, r5, r6, r7, pc}
.L89:
	.align	2
.L88:
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
	.uleb128 0x30
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI2-.LFB1
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
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x28
	.align	2
.LEFDE2:
	.text
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x32d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x1
	.4byte	.LASF32
	.4byte	.LASF33
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
	.uleb128 0x4
	.byte	0x4
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x4
	.byte	0x4
	.4byte	0x77
	.uleb128 0x5
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x3b
	.4byte	0x83
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18d
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x3b
	.4byte	0x64
	.4byte	.LLST0
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3b
	.4byte	0x6a
	.4byte	.LLST1
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x3b
	.4byte	0x41
	.4byte	.LLST2
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x3b
	.4byte	0x41
	.4byte	.LLST3
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x1
	.byte	0x3b
	.4byte	0x83
	.4byte	.LLST4
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x1
	.byte	0x3d
	.4byte	0x83
	.4byte	0x106
	.uleb128 0x9
	.byte	0
	.uleb128 0xa
	.ascii	"v\000"
	.byte	0x1
	.byte	0x3d
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0x41
	.4byte	.LLST5
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3f
	.4byte	0x41
	.4byte	.LLST6
	.uleb128 0xb
	.ascii	"j\000"
	.byte	0x1
	.byte	0x40
	.4byte	0x41
	.4byte	.LLST7
	.uleb128 0xb
	.ascii	"exp\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x41
	.4byte	.LLST8
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x42
	.4byte	0x41
	.4byte	.LLST9
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x43
	.4byte	0x41
	.4byte	.LLST10
	.uleb128 0xd
	.4byte	.LVL28
	.4byte	0x323
	.4byte	0x17c
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0xf
	.4byte	.LVL42
	.4byte	0x323
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0xab
	.4byte	0x83
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x218
	.uleb128 0x10
	.ascii	"s\000"
	.byte	0x1
	.byte	0xab
	.4byte	0x71
	.4byte	.LLST11
	.uleb128 0xb
	.ascii	"val\000"
	.byte	0x1
	.byte	0xad
	.4byte	0x83
	.4byte	.LLST12
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x41
	.4byte	.LLST13
	.uleb128 0xb
	.ascii	"j\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x41
	.4byte	.LLST14
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x1
	.byte	0xae
	.4byte	0x41
	.4byte	.LLST15
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x1
	.byte	0xae
	.4byte	0x41
	.4byte	.LLST16
	.uleb128 0xb
	.ascii	"ex\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x41
	.4byte	.LLST17
	.uleb128 0xb
	.ascii	"ex1\000"
	.byte	0x1
	.byte	0xae
	.4byte	0x41
	.4byte	.LLST18
	.byte	0
	.uleb128 0x11
	.4byte	.LASF24
	.byte	0x1
	.byte	0x24
	.4byte	0x228
	.byte	0x4
	.4byte	0x5a800000
	.uleb128 0x5
	.4byte	0x83
	.uleb128 0x11
	.4byte	.LASF25
	.byte	0x1
	.byte	0x25
	.4byte	0x228
	.byte	0x4
	.4byte	0x3ede5bd9
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0x26
	.4byte	0x228
	.byte	0x4
	.4byte	0x3e9a209b
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x27
	.4byte	0x228
	.byte	0x4
	.4byte	0x2acff799
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.4byte	0x228
	.byte	0x4
	.4byte	0x3f317218
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x1
	.byte	0x29
	.4byte	0x228
	.byte	0x4
	.4byte	0x2f51cf7a
	.uleb128 0x12
	.ascii	"Lg1\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x228
	.byte	0x4
	.4byte	0x3f2aaaab
	.uleb128 0x12
	.ascii	"Lg2\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x228
	.byte	0x4
	.4byte	0x3ecccccd
	.uleb128 0x12
	.ascii	"Lg3\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x228
	.byte	0x4
	.4byte	0x3e924925
	.uleb128 0x12
	.ascii	"Lg4\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x228
	.byte	0x4
	.4byte	0x3e638e29
	.uleb128 0x12
	.ascii	"Lg5\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x228
	.byte	0x4
	.4byte	0x3e3a3325
	.uleb128 0x12
	.ascii	"Lg6\000"
	.byte	0x1
	.byte	0x2f
	.4byte	0x228
	.byte	0x4
	.4byte	0x3e1cd04f
	.uleb128 0x12
	.ascii	"Lg7\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x228
	.byte	0x4
	.4byte	0x3e178897
	.uleb128 0x11
	.4byte	.LASF30
	.byte	0x1
	.byte	0x31
	.4byte	0x228
	.byte	0x4
	.4byte	0
	.uleb128 0x13
	.4byte	0x83
	.4byte	0x30d
	.uleb128 0x14
	.4byte	0x7c
	.byte	0x4c
	.byte	0
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.byte	0x19
	.4byte	0x31e
	.uleb128 0x5
	.byte	0x3
	.4byte	powten
	.uleb128 0x5
	.4byte	0x2fd
	.uleb128 0x16
	.4byte	.LASF34
	.byte	0x1
	.byte	0x3d
	.4byte	0x83
	.uleb128 0x9
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0x17
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x17
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
	.uleb128 0x1c
	.uleb128 0xa
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
	.uleb128 0x1c
	.uleb128 0xa
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
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x3
	.byte	0x74
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	.LVL35
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x3
	.byte	0x74
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL39
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL40-1
	.4byte	.LVL45
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL46
	.4byte	.LVL48
	.2byte	0x3
	.byte	0x74
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL48
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL51
	.4byte	.LVL54
	.2byte	0x3
	.byte	0x75
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL54
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x3
	.byte	0x74
	.sleb128 1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL3
	.4byte	.LVL15
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x3
	.byte	0x8
	.byte	0x65
	.byte	0x9f
	.4byte	.LVL57
	.4byte	.LVL61
	.2byte	0x3
	.byte	0x8
	.byte	0x65
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4-1
	.4byte	.LVL32
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	.LVL32
	.4byte	.LVL55
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL62
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	.LVL62
	.4byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x2
	.byte	0x42
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL0
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	.LVL5
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL27
	.4byte	.LVL28-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL30
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL61
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL64
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL36
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x3
	.byte	0x75
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL44
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL8
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL55
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x3
	.byte	0x73
	.sleb128 -48
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL13
	.4byte	.LVL48
	.2byte	0x2
	.byte	0x91
	.sleb128 -44
	.4byte	.LVL48
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL49
	.4byte	.LVL60
	.2byte	0x2
	.byte	0x91
	.sleb128 -44
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x3
	.byte	0x9
	.byte	0xd9
	.byte	0x9f
	.4byte	.LVL61
	.4byte	.LFE0
	.2byte	0x2
	.byte	0x91
	.sleb128 -44
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL21
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL57
	.4byte	.LVL65
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL15
	.4byte	.LVL18
	.2byte	0x2
	.byte	0x91
	.sleb128 -40
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x2
	.byte	0x91
	.sleb128 -40
	.4byte	.LVL20
	.4byte	.LVL23
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x2
	.byte	0x91
	.sleb128 -40
	.4byte	.LVL57
	.4byte	.LVL62
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL66
	.4byte	.LVL75
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL75
	.4byte	.LVL96
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL96
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL74
	.4byte	.LVL75
	.2byte	0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0
	.4byte	.LVL76
	.4byte	.LVL106
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL106
	.4byte	.LVL107
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL107
	.4byte	.LVL109
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL109
	.4byte	.LVL113
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL69
	.4byte	.LVL70
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL70
	.4byte	.LVL71
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL71
	.4byte	.LVL86
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL87
	.4byte	.LVL93
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL93
	.4byte	.LVL97
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL97
	.4byte	.LVL98
	.2byte	0x7
	.byte	0x76
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL98
	.4byte	.LVL100
	.2byte	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x20
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL100
	.4byte	.LVL101
	.2byte	0x7
	.byte	0x76
	.sleb128 0
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL101
	.4byte	.LVL102
	.2byte	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x20
	.byte	0x76
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL74
	.4byte	.LVL75
	.2byte	0x3
	.byte	0x8
	.byte	0x26
	.byte	0x9f
	.4byte	.LVL82
	.4byte	.LVL83
	.2byte	0x3
	.byte	0x77
	.sleb128 -1
	.byte	0x9f
	.4byte	.LVL83
	.4byte	.LVL85
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL72
	.4byte	.LVL74
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL74
	.4byte	.LFE1
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL93
	.4byte	.LVL95
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL95
	.4byte	.LVL103
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL107
	.4byte	.LVL108
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL74
	.4byte	.LVL75
	.2byte	0x3
	.byte	0x8
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL76
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL78
	.4byte	.LVL83
	.2byte	0x6
	.byte	0x8
	.byte	0x4b
	.byte	0x77
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL83
	.4byte	.LVL85
	.2byte	0x3
	.byte	0x8
	.byte	0x26
	.byte	0x9f
	.4byte	.LVL85
	.4byte	.LVL102
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL102
	.4byte	.LVL103
	.2byte	0x7
	.byte	0x7d
	.sleb128 0
	.byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL103
	.4byte	.LVL112
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL112
	.4byte	.LFE1
	.2byte	0x2
	.byte	0x91
	.sleb128 -40
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL95
	.4byte	.LVL97
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL97
	.4byte	.LVL99
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL100
	.4byte	.LVL102
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
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
.LASF25:
	.ascii	"ivln10\000"
.LASF14:
	.ascii	"bsize\000"
.LASF23:
	.ascii	"esign\000"
.LASF2:
	.ascii	"short int\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF32:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../../src/lib/cbmath.c\000"
.LASF19:
	.ascii	"nlead\000"
.LASF12:
	.ascii	"buff\000"
.LASF34:
	.ascii	"modf\000"
.LASF20:
	.ascii	"dtoa\000"
.LASF16:
	.ascii	"value\000"
.LASF35:
	.ascii	"powten\000"
.LASF33:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF11:
	.ascii	"float\000"
.LASF13:
	.ascii	"conv\000"
.LASF5:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"long int\000"
.LASF21:
	.ascii	"atof\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF15:
	.ascii	"dplace\000"
.LASF0:
	.ascii	"signed char\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF24:
	.ascii	"two54\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF27:
	.ascii	"log10_2lo\000"
.LASF8:
	.ascii	"char\000"
.LASF26:
	.ascii	"log10_2hi\000"
.LASF31:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF22:
	.ascii	"sign\000"
.LASF10:
	.ascii	"double\000"
.LASF18:
	.ascii	"ndigits\000"
.LASF28:
	.ascii	"ln2_hi\000"
.LASF17:
	.ascii	"imax\000"
.LASF29:
	.ascii	"ln2_lo\000"
.LASF30:
	.ascii	"zero\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
