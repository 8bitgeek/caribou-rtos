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
	.file	"cbmath.c"
	.text
.Ltext0:
	.global	powten
	.section	.rodata.powten,"a",%progbits
	.align	2
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
	.section	.rodata.two54,"a",%progbits
	.align	2
	.type	two54, %object
	.size	two54, 4
two54:
	.word	1518338048
	.section	.rodata.ivln10,"a",%progbits
	.align	2
	.type	ivln10, %object
	.size	ivln10, 4
ivln10:
	.word	1054759897
	.section	.rodata.log10_2hi,"a",%progbits
	.align	2
	.type	log10_2hi, %object
	.size	log10_2hi, 4
log10_2hi:
	.word	1050288283
	.section	.rodata.log10_2lo,"a",%progbits
	.align	2
	.type	log10_2lo, %object
	.size	log10_2lo, 4
log10_2lo:
	.word	718272409
	.section	.rodata.ln2_hi,"a",%progbits
	.align	2
	.type	ln2_hi, %object
	.size	ln2_hi, 4
ln2_hi:
	.word	1060205080
	.section	.rodata.ln2_lo,"a",%progbits
	.align	2
	.type	ln2_lo, %object
	.size	ln2_lo, 4
ln2_lo:
	.word	793890682
	.section	.rodata.Lg1,"a",%progbits
	.align	2
	.type	Lg1, %object
	.size	Lg1, 4
Lg1:
	.word	1059760811
	.section	.rodata.Lg2,"a",%progbits
	.align	2
	.type	Lg2, %object
	.size	Lg2, 4
Lg2:
	.word	1053609165
	.section	.rodata.Lg3,"a",%progbits
	.align	2
	.type	Lg3, %object
	.size	Lg3, 4
Lg3:
	.word	1049774373
	.section	.rodata.Lg4,"a",%progbits
	.align	2
	.type	Lg4, %object
	.size	Lg4, 4
Lg4:
	.word	1046711849
	.section	.rodata.Lg5,"a",%progbits
	.align	2
	.type	Lg5, %object
	.size	Lg5, 4
Lg5:
	.word	1044001573
	.section	.rodata.Lg6,"a",%progbits
	.align	2
	.type	Lg6, %object
	.size	Lg6, 4
Lg6:
	.word	1042075727
	.section	.rodata.Lg7,"a",%progbits
	.align	2
	.type	Lg7, %object
	.size	Lg7, 4
Lg7:
	.word	1041729687
	.section	.rodata.zero,"a",%progbits
	.align	2
	.type	zero, %object
	.size	zero, 4
zero:
	.space	4
	.section	.text.ipow,"ax",%progbits
	.align	2
	.global	ipow
	.code	16
	.thumb_func
	.type	ipow, %function
ipow:
.LFB0:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/cbmath.c"
	.loc 1 55 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 56 0
	movs	r3, #1
	str	r3, [r7, #12]
	.loc 1 57 0
	b	.L2
.L4:
	.loc 1 59 0
	ldr	r3, [r7]
	movs	r2, #1
	ands	r3, r2
	beq	.L3
	.loc 1 60 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	muls	r3, r2
	str	r3, [r7, #12]
.L3:
	.loc 1 61 0
	ldr	r3, [r7]
	asrs	r3, r3, #1
	str	r3, [r7]
	.loc 1 62 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7, #4]
	muls	r3, r2
	str	r3, [r7, #4]
.L2:
	.loc 1 57 0
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L4
	.loc 1 65 0
	ldr	r3, [r7, #12]
	.loc 1 66 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE0:
	.size	ipow, .-ipow
	.global	__aeabi_fcmplt
	.global	__aeabi_fcmpeq
	.global	__aeabi_fcmpgt
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
.LFB1:
	.loc 1 77 0
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI3:
	sub	sp, sp, #44
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	movs	r4, r0
	str	r2, [r7, #8]
	str	r3, [r7, #4]
	movs	r3, #15
	adds	r3, r7, r3
	adds	r2, r1, #0
	strb	r2, [r3]
	.loc 1 87 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bge	.L7
	.loc 1 88 0
	movs	r3, #6
	str	r3, [r7, #4]
.L7:
	.loc 1 91 0
	movs	r1, #0
	ldr	r0, [r7, #64]
	bl	__aeabi_fcmplt
	subs	r3, r0, #0
	beq	.L8
	.loc 1 93 0
	ldr	r3, [r7, #64]
	movs	r2, #128
	lsls	r2, r2, #24
	eors	r3, r2
	str	r3, [r7, #64]
	.loc 1 94 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #45
	strb	r2, [r3]
.L8:
	.loc 1 98 0
	movs	r1, #0
	ldr	r0, [r7, #64]
	bl	__aeabi_fcmpeq
	subs	r3, r0, #0
	beq	.L37
	.loc 1 99 0
	movs	r3, #38
	str	r3, [r7, #36]
	b	.L12
.L37:
	.loc 1 102 0
	movs	r3, #76
	str	r3, [r7, #36]
	b	.L13
.L16:
	.loc 1 104 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #102
	bne	.L14
	.loc 1 104 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #36]
	cmp	r3, #38
	ble	.L38
.L14:
	.loc 1 102 0 is_stmt 1 discriminator 2
	ldr	r3, [r7, #36]
	subs	r3, r3, #1
	str	r3, [r7, #36]
.L13:
	.loc 1 102 0 is_stmt 0 discriminator 1
	ldr	r3, .L39
	ldr	r2, [r7, #36]
	lsls	r2, r2, #2
	ldr	r3, [r2, r3]
	ldr	r1, [r7, #64]
	adds	r0, r3, #0
	bl	__aeabi_fcmpgt
	subs	r3, r0, #0
	beq	.L12
	.loc 1 102 0 discriminator 3
	ldr	r3, [r7, #36]
	cmp	r3, #0
	bgt	.L16
	b	.L12
.L38:
	.loc 1 105 0 is_stmt 1
	nop
.L12:
	.loc 1 108 0
	ldr	r3, [r7, #36]
	subs	r3, r3, #38
	str	r3, [r7, #32]
	.loc 1 109 0
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #24]
	.loc 1 112 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #103
	bne	.L17
	.loc 1 114 0
	ldr	r3, [r7, #24]
	cmp	r3, #6
	ble	.L18
	.loc 1 115 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #101
	strb	r2, [r3]
	b	.L17
.L18:
	.loc 1 117 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #102
	strb	r2, [r3]
.L17:
	.loc 1 122 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #102
	bne	.L19
	.loc 1 124 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #24]
	adds	r3, r2, r3
	str	r3, [r7, #28]
	.loc 1 125 0
	ldr	r3, [r7, #28]
	adds	r2, r3, #3
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	.L19
	.loc 1 127 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #101
	strb	r2, [r3]
	.loc 1 128 0
	movs	r3, #18
	str	r3, [r7, #4]
.L19:
	.loc 1 131 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #102
	beq	.L20
	.loc 1 133 0
	movs	r3, #1
	str	r3, [r7, #24]
	.loc 1 134 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #24]
	adds	r3, r2, r3
	str	r3, [r7, #28]
	.loc 1 135 0
	ldr	r3, [r7, #28]
	cmp	r3, #18
	ble	.L20
	.loc 1 136 0
	movs	r3, #18
	str	r3, [r7, #28]
.L20:
	.loc 1 140 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #101
	bne	.L21
	.loc 1 140 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #36]
	cmp	r3, #0
	bne	.L21
	.loc 1 140 0 discriminator 2
	ldr	r3, .L39+4
	ldr	r1, [r7, #64]
	adds	r0, r3, #0
	bl	__aeabi_fcmpgt
	subs	r3, r0, #0
	beq	.L21
	.loc 1 142 0 is_stmt 1
	ldr	r1, .L39+8
	ldr	r0, [r7, #64]
	bl	__aeabi_fmul
	adds	r3, r0, #0
	str	r3, [r7, #64]
	.loc 1 143 0
	ldr	r3, [r7, #32]
	subs	r3, r3, #1
	str	r3, [r7, #32]
.L21:
	.loc 1 145 0
	ldr	r3, .L39
	ldr	r2, [r7, #36]
	lsls	r2, r2, #2
	ldr	r3, [r2, r3]
	adds	r1, r3, #0
	ldr	r0, [r7, #64]
	bl	__aeabi_fdiv
	adds	r3, r0, #0
	adds	r5, r3, #0
	ldr	r3, [r7, #28]
	movs	r2, #39
	subs	r2, r2, r3
	ldr	r3, .L39
	lsls	r2, r2, #2
	ldr	r3, [r2, r3]
	movs	r1, #252
	lsls	r1, r1, #22
	adds	r0, r3, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r1, r3, #0
	adds	r0, r5, #0
	bl	__aeabi_fadd
	adds	r3, r0, #0
	str	r3, [r7, #64]
	.loc 1 146 0
	movs	r3, #16
	adds	r2, r7, r3
	ldr	r3, [r7, #64]
	movs	r1, r2
	adds	r0, r3, #0
	bl	modf
	adds	r3, r0, #0
	str	r3, [r7, #64]
	.loc 1 147 0
	ldr	r3, [r7, #16]
	ldr	r1, .L39+8
	adds	r0, r3, #0
	bl	__aeabi_fcmpge
	subs	r3, r0, #0
	beq	.L23
	.loc 1 149 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #49
	strb	r2, [r3]
	.loc 1 150 0
	ldr	r3, [r7, #16]
	ldr	r1, .L39+8
	adds	r0, r3, #0
	bl	__aeabi_fsub
	adds	r3, r0, #0
	str	r3, [r7, #16]
.L23:
	.loc 1 154 0
	movs	r5, #0
	b	.L25
.L27:
	.loc 1 156 0
	ldr	r3, [r7, #24]
	cmp	r5, r3
	bne	.L26
	.loc 1 157 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #46
	strb	r2, [r3]
.L26:
	.loc 1 158 0 discriminator 2
	movs	r6, r4
	adds	r4, r6, #1
	ldr	r3, [r7, #16]
	adds	r0, r3, #0
	bl	__aeabi_f2iz
	movs	r3, r0
	uxtb	r3, r3
	adds	r3, r3, #48
	uxtb	r3, r3
	strb	r3, [r6]
	.loc 1 159 0 discriminator 2
	ldr	r1, .L39+8
	ldr	r0, [r7, #64]
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r2, r3, #0
	movs	r3, #16
	adds	r3, r7, r3
	movs	r1, r3
	adds	r0, r2, #0
	bl	modf
	adds	r3, r0, #0
	str	r3, [r7, #64]
	.loc 1 154 0 discriminator 2
	adds	r5, r5, #1
.L25:
	.loc 1 154 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #28]
	cmp	r5, r3
	blt	.L27
	.loc 1 164 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #102
	beq	.L28
	.loc 1 166 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #101
	strb	r2, [r3]
	.loc 1 167 0
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bge	.L29
	.loc 1 169 0
	ldr	r3, [r7, #32]
	rsbs	r3, r3, #0
	str	r3, [r7, #32]
	.loc 1 170 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #45
	strb	r2, [r3]
	b	.L30
.L29:
	.loc 1 173 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #43
	strb	r2, [r3]
.L30:
	.loc 1 174 0
	ldr	r3, [r7, #32]
	movs	r1, #10
	movs	r0, r3
	bl	__aeabi_idiv
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 175 0
	movs	r3, r4
	adds	r4, r3, #1
	ldr	r2, [r7, #20]
	uxtb	r2, r2
	adds	r2, r2, #48
	uxtb	r2, r2
	strb	r2, [r3]
	.loc 1 176 0
	movs	r3, r4
	adds	r4, r3, #1
	ldr	r2, [r7, #32]
	uxtb	r1, r2
	ldr	r2, [r7, #20]
	uxtb	r2, r2
	movs	r0, #10
	rsbs	r0, r0, #0
	muls	r2, r0
	uxtb	r2, r2
	adds	r2, r1, r2
	uxtb	r2, r2
	adds	r2, r2, #48
	uxtb	r2, r2
	strb	r2, [r3]
.L28:
	.loc 1 179 0
	movs	r3, r4
	adds	r4, r3, #1
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 181 0
	ldr	r3, [r7, #64]
	.loc 1 182 0
	adds	r0, r3, #0
	mov	sp, r7
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L40:
	.align	2
.L39:
	.word	powten
	.word	7136238
	.word	1092616192
.LFE1:
	.size	dtoa, .-dtoa
	.global	__aeabi_i2f
	.section	.text.atof,"ax",%progbits
	.align	2
	.global	atof
	.code	16
	.thumb_func
	.type	atof, %function
atof:
.LFB2:
	.loc 1 189 0
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI6:
	sub	sp, sp, #44
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 194 0
	movs	r3, #0
	str	r3, [r7, #32]
	b	.L42
.L43:
	.loc 1 194 0 is_stmt 0 discriminator 7
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L42:
	.loc 1 194 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L43
	.loc 1 194 0 discriminator 4
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #10
	beq	.L43
	.loc 1 194 0 discriminator 6
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #9
	beq	.L43
	.loc 1 196 0 is_stmt 1
	movs	r3, #1
	str	r3, [r7, #24]
	.loc 1 197 0
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #43
	beq	.L44
	.loc 1 197 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #45
	bne	.L45
.L44:
	.loc 1 198 0 is_stmt 1
	ldr	r3, [r7, #32]
	adds	r2, r3, #1
	str	r2, [r7, #32]
	movs	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #43
	bne	.L46
	.loc 1 198 0 is_stmt 0 discriminator 1
	movs	r3, #1
	b	.L47
.L46:
	.loc 1 198 0 discriminator 2
	movs	r3, #1
	rsbs	r3, r3, #0
.L47:
	.loc 1 198 0 discriminator 4
	str	r3, [r7, #24]
.L45:
	.loc 1 200 0 is_stmt 1
	movs	r3, #37
	str	r3, [r7, #16]
	.loc 1 201 0
	movs	r3, #0
	str	r3, [r7, #36]
	movs	r3, #38
	str	r3, [r7, #28]
	b	.L48
.L51:
	.loc 1 203 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	blt	.L49
	.loc 1 204 0
	ldr	r3, .L73
	ldr	r2, [r7, #28]
	lsls	r2, r2, #2
	ldr	r4, [r2, r3]
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	subs	r3, r3, #48
	movs	r0, r3
	bl	__aeabi_i2f
	adds	r3, r0, #0
	adds	r1, r3, #0
	adds	r0, r4, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r1, r3, #0
	ldr	r0, [r7, #36]
	bl	__aeabi_fadd
	adds	r3, r0, #0
	str	r3, [r7, #36]
.L49:
	.loc 1 205 0 discriminator 2
	ldr	r3, [r7, #28]
	subs	r3, r3, #1
	str	r3, [r7, #28]
	.loc 1 206 0 discriminator 2
	ldr	r3, [r7, #16]
	adds	r3, r3, #1
	str	r3, [r7, #16]
	.loc 1 201 0 discriminator 2
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L48:
	.loc 1 201 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L50
	.loc 1 201 0 discriminator 3
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L51
.L50:
	.loc 1 210 0 is_stmt 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #46
	bne	.L53
	.loc 1 211 0
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
	.loc 1 213 0
	b	.L53
.L56:
	.loc 1 215 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	blt	.L54
	.loc 1 216 0
	ldr	r3, .L73
	ldr	r2, [r7, #28]
	lsls	r2, r2, #2
	ldr	r4, [r2, r3]
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	subs	r3, r3, #48
	movs	r0, r3
	bl	__aeabi_i2f
	adds	r3, r0, #0
	adds	r1, r3, #0
	adds	r0, r4, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	adds	r1, r3, #0
	ldr	r0, [r7, #36]
	bl	__aeabi_fadd
	adds	r3, r0, #0
	str	r3, [r7, #36]
.L54:
	.loc 1 217 0
	ldr	r3, [r7, #28]
	subs	r3, r3, #1
	str	r3, [r7, #28]
	.loc 1 213 0
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L53:
	.loc 1 213 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L55
	.loc 1 213 0 discriminator 2
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L56
.L55:
	.loc 1 220 0 is_stmt 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #101
	beq	.L57
	.loc 1 220 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #69
	beq	.L57
	.loc 1 220 0 discriminator 2
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #100
	beq	.L57
	.loc 1 220 0 discriminator 3
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #68
	bne	.L58
.L57:
	.loc 1 222 0 is_stmt 1
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
	.loc 1 223 0
	movs	r3, #1
	str	r3, [r7, #20]
	.loc 1 225 0
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #43
	beq	.L59
	.loc 1 225 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #45
	bne	.L60
.L59:
	.loc 1 226 0 is_stmt 1
	ldr	r3, [r7, #32]
	adds	r2, r3, #1
	str	r2, [r7, #32]
	movs	r2, r3
	ldr	r3, [r7, #4]
	adds	r3, r3, r2
	ldrb	r3, [r3]
	cmp	r3, #43
	bne	.L61
	.loc 1 226 0 is_stmt 0 discriminator 1
	movs	r3, #1
	b	.L62
.L61:
	.loc 1 226 0 discriminator 2
	movs	r3, #1
	rsbs	r3, r3, #0
.L62:
	.loc 1 226 0 discriminator 4
	str	r3, [r7, #20]
.L60:
	.loc 1 227 0 is_stmt 1
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L63
.L65:
	.loc 1 228 0 discriminator 4
	ldr	r2, [r7, #12]
	movs	r3, r2
	lsls	r3, r3, #2
	adds	r3, r3, r2
	lsls	r3, r3, #1
	movs	r1, r3
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	adds	r3, r1, r3
	subs	r3, r3, #48
	str	r3, [r7, #12]
	.loc 1 227 0 discriminator 4
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L63:
	.loc 1 227 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L64
	.loc 1 227 0 discriminator 3
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #57
	bls	.L65
.L64:
	.loc 1 229 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	muls	r3, r2
	ldr	r2, [r7, #16]
	adds	r3, r2, r3
	str	r3, [r7, #16]
.L58:
	.loc 1 232 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bge	.L66
	.loc 1 233 0
	movs	r3, #0
	str	r3, [r7, #36]
	b	.L67
.L66:
	.loc 1 234 0
	ldr	r3, [r7, #16]
	cmp	r3, #75
	ble	.L68
	.loc 1 234 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #16]
	cmp	r3, #76
	bne	.L69
	.loc 1 234 0 discriminator 2
	ldr	r1, .L73+4
	ldr	r0, [r7, #36]
	bl	__aeabi_fcmplt
	subs	r3, r0, #0
	beq	.L69
.L68:
	.loc 1 235 0 is_stmt 1
	ldr	r3, .L73
	ldr	r2, [r7, #16]
	lsls	r2, r2, #2
	ldr	r3, [r2, r3]
	adds	r1, r3, #0
	ldr	r0, [r7, #36]
	bl	__aeabi_fmul
	adds	r3, r0, #0
	str	r3, [r7, #36]
	b	.L67
.L69:
	.loc 1 239 0
	movs	r3, #254
	lsls	r3, r3, #23
	str	r3, [r7, #36]
.L67:
	.loc 1 243 0
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	cmp	r3, #32
	beq	.L71
	.loc 1 243 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #32]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldrb	r3, [r3]
.L71:
	.loc 1 247 0 is_stmt 1
	ldr	r0, [r7, #24]
	bl	__aeabi_i2f
	adds	r3, r0, #0
	ldr	r1, [r7, #36]
	adds	r0, r3, #0
	bl	__aeabi_fmul
	adds	r3, r0, #0
	.loc 1 248 0
	adds	r0, r3, #0
	mov	sp, r7
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r7, pc}
.L74:
	.align	2
.L73:
	.word	powten
	.word	1071237085
.LFE2:
	.size	atof, .-atof
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
	.uleb128 0x40
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI6-.LFB2
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
	.uleb128 0x38
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
	.text
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x339
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0xc
	.4byte	.LASF35
	.4byte	.LASF36
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
	.4byte	.LASF13
	.byte	0x1
	.byte	0x36
	.4byte	0x41
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd5
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x36
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.ascii	"exp\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0x38
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4c
	.4byte	0x83
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4c
	.4byte	0x64
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4c
	.4byte	0x6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -49
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x4c
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x4c
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4c
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x1
	.byte	0x4e
	.4byte	0x83
	.4byte	0x144
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.ascii	"v\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4f
	.4byte	0x41
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x1
	.byte	0x50
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.ascii	"j\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xd
	.ascii	"exp\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x1
	.byte	0x53
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x1
	.byte	0x54
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x1
	.byte	0xbc
	.4byte	0x83
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x223
	.uleb128 0x8
	.ascii	"s\000"
	.byte	0x1
	.byte	0xbc
	.4byte	0x71
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xd
	.ascii	"val\000"
	.byte	0x1
	.byte	0xbe
	.4byte	0x83
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"i\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"j\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0xbf
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x1
	.byte	0xbf
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xd
	.ascii	"ex\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.ascii	"ex1\000"
	.byte	0x1
	.byte	0xbf
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0x24
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	two54
	.uleb128 0x5
	.4byte	0x83
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x1
	.byte	0x25
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	ivln10
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x1
	.byte	0x26
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	log10_2hi
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x1
	.byte	0x27
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	log10_2lo
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x1
	.byte	0x28
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	ln2_hi
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x1
	.byte	0x29
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	ln2_lo
	.uleb128 0xd
	.ascii	"Lg1\000"
	.byte	0x1
	.byte	0x2a
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg1
	.uleb128 0xd
	.ascii	"Lg2\000"
	.byte	0x1
	.byte	0x2b
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg2
	.uleb128 0xd
	.ascii	"Lg3\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg3
	.uleb128 0xd
	.ascii	"Lg4\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg4
	.uleb128 0xd
	.ascii	"Lg5\000"
	.byte	0x1
	.byte	0x2e
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg5
	.uleb128 0xd
	.ascii	"Lg6\000"
	.byte	0x1
	.byte	0x2f
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg6
	.uleb128 0xd
	.ascii	"Lg7\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	Lg7
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x1
	.byte	0x31
	.4byte	0x234
	.uleb128 0x5
	.byte	0x3
	.4byte	zero
	.uleb128 0xe
	.4byte	0x234
	.4byte	0x326
	.uleb128 0xf
	.4byte	0x7c
	.byte	0x4c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF38
	.byte	0x1
	.byte	0x19
	.4byte	0x337
	.uleb128 0x5
	.byte	0x3
	.4byte	powten
	.uleb128 0x5
	.4byte	0x316
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
	.uleb128 0x2117
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.4byte	0xc5
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x33d
	.4byte	0x91
	.ascii	"ipow\000"
	.4byte	0xd5
	.ascii	"dtoa\000"
	.4byte	0x133
	.ascii	"modf\000"
	.4byte	0x1a0
	.ascii	"atof\000"
	.4byte	0x223
	.ascii	"two54\000"
	.4byte	0x239
	.ascii	"ivln10\000"
	.4byte	0x24a
	.ascii	"log10_2hi\000"
	.4byte	0x25b
	.ascii	"log10_2lo\000"
	.4byte	0x26c
	.ascii	"ln2_hi\000"
	.4byte	0x27d
	.ascii	"ln2_lo\000"
	.4byte	0x28e
	.ascii	"Lg1\000"
	.4byte	0x29f
	.ascii	"Lg2\000"
	.4byte	0x2b0
	.ascii	"Lg3\000"
	.4byte	0x2c1
	.ascii	"Lg4\000"
	.4byte	0x2d2
	.ascii	"Lg5\000"
	.4byte	0x2e3
	.ascii	"Lg6\000"
	.4byte	0x2f4
	.ascii	"Lg7\000"
	.4byte	0x305
	.ascii	"zero\000"
	.4byte	0x326
	.ascii	"powten\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xd3
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x33d
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
	.4byte	0x4f
	.ascii	"long long int\000"
	.4byte	0x56
	.ascii	"long long unsigned int\000"
	.4byte	0x5d
	.ascii	"long int\000"
	.4byte	0x6a
	.ascii	"char\000"
	.4byte	0x7c
	.ascii	"sizetype\000"
	.4byte	0x83
	.ascii	"double\000"
	.4byte	0x8a
	.ascii	"float\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"ivln10\000"
.LASF20:
	.ascii	"result\000"
.LASF13:
	.ascii	"ipow\000"
.LASF17:
	.ascii	"bsize\000"
.LASF26:
	.ascii	"esign\000"
.LASF2:
	.ascii	"short int\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF35:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/cbmath.c\000"
.LASF23:
	.ascii	"nlead\000"
.LASF36:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF15:
	.ascii	"buff\000"
.LASF37:
	.ascii	"modf\000"
.LASF14:
	.ascii	"dtoa\000"
.LASF19:
	.ascii	"value\000"
.LASF38:
	.ascii	"powten\000"
.LASF11:
	.ascii	"float\000"
.LASF16:
	.ascii	"conv\000"
.LASF5:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"long int\000"
.LASF24:
	.ascii	"atof\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"dplace\000"
.LASF0:
	.ascii	"signed char\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"two54\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF30:
	.ascii	"log10_2lo\000"
.LASF8:
	.ascii	"char\000"
.LASF29:
	.ascii	"log10_2hi\000"
.LASF25:
	.ascii	"sign\000"
.LASF10:
	.ascii	"double\000"
.LASF22:
	.ascii	"ndigits\000"
.LASF31:
	.ascii	"ln2_hi\000"
.LASF21:
	.ascii	"imax\000"
.LASF34:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF32:
	.ascii	"ln2_lo\000"
.LASF12:
	.ascii	"base\000"
.LASF33:
	.ascii	"zero\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
