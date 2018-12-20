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
	.file	"qsort.c"
	.text
.Ltext0:
	.section	.text.swap,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	swap, %function
swap:
.LFB0:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/lib/qsort.c"
	.loc 1 21 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #32
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 22 0
	ldr	r3, [r7, #12]
	movs	r2, #255
	ands	r3, r2
	str	r3, [r7, #24]
	.loc 1 23 0
	ldr	r3, [r7, #8]
	movs	r2, #255
	ands	r3, r2
	str	r3, [r7, #20]
.LBB2:
	.loc 1 24 0
	movs	r3, #0
	str	r3, [r7, #28]
	b	.L2
.L3:
.LBB3:
	.loc 1 26 0 discriminator 3
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #24]
	adds	r2, r2, r3
	movs	r3, #19
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 27 0 discriminator 3
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #24]
	adds	r3, r2, r3
	ldr	r2, [r7, #28]
	ldr	r1, [r7, #20]
	adds	r2, r1, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 28 0 discriminator 3
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #20]
	adds	r3, r2, r3
	movs	r2, #19
	adds	r2, r7, r2
	ldrb	r2, [r2]
	strb	r2, [r3]
.LBE3:
	.loc 1 24 0 discriminator 3
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L2:
	.loc 1 24 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L3
.LBE2:
	.loc 1 30 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.LFE0:
	.size	swap, .-swap
	.section	.text.qsort,"ax",%progbits
	.align	2
	.global	qsort
	.code	16
	.thumb_func
	.type	qsort, %function
qsort:
.LFB1:
	.loc 1 41 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #32
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 42 0
	ldr	r3, [r7, #8]
	cmp	r3, #1
	bls	.L11
.LBB4:
	.loc 1 46 0
	movs	r3, #0
	str	r3, [r7, #28]
	b	.L6
.L10:
	.loc 1 48 0
	ldr	r3, [r7, #28]
	str	r3, [r7, #20]
	.loc 1 49 0
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #24]
	b	.L7
.L9:
.LBB5:
	.loc 1 51 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	movs	r1, r3
	bl	compare
	subs	r3, r0, #0
	ble	.L8
	.loc 1 53 0
	ldr	r3, [r7, #24]
	str	r3, [r7, #20]
.L8:
.LBE5:
	.loc 1 49 0 discriminator 2
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	str	r3, [r7, #24]
.L7:
	.loc 1 49 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcc	.L9
	.loc 1 56 0 is_stmt 1 discriminator 2
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #4]
	movs	r1, r3
	bl	swap
	.loc 1 46 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L6:
	.loc 1 46 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	subs	r2, r3, #1
	ldr	r3, [r7, #28]
	cmp	r2, r3
	bhi	.L10
.L11:
.LBE4:
	.loc 1 59 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.LFE1:
	.size	qsort, .-qsort
	.section	.text.qsort_r,"ax",%progbits
	.align	2
	.global	qsort_r
	.code	16
	.thumb_func
	.type	qsort_r, %function
qsort_r:
.LFB2:
	.loc 1 69 0
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #32
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 70 0
	ldr	r3, [r7, #8]
	cmp	r3, #1
	bls	.L19
.LBB6:
	.loc 1 74 0
	movs	r3, #0
	str	r3, [r7, #28]
	b	.L14
.L18:
	.loc 1 76 0
	ldr	r3, [r7, #28]
	str	r3, [r7, #20]
	.loc 1 77 0
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #24]
	b	.L15
.L17:
.LBB7:
	.loc 1 79 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #40]
	movs	r1, r3
	bl	compare
	subs	r3, r0, #0
	ble	.L16
	.loc 1 81 0
	ldr	r3, [r7, #24]
	str	r3, [r7, #20]
.L16:
.LBE7:
	.loc 1 77 0 discriminator 2
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	str	r3, [r7, #24]
.L15:
	.loc 1 77 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bcc	.L17
	.loc 1 84 0 is_stmt 1 discriminator 2
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r0, r2, r3
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	muls	r3, r2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #4]
	movs	r1, r3
	bl	swap
	.loc 1 74 0 discriminator 2
	ldr	r3, [r7, #28]
	adds	r3, r3, #1
	str	r3, [r7, #28]
.L14:
	.loc 1 74 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #8]
	subs	r2, r3, #1
	ldr	r3, [r7, #28]
	cmp	r2, r3
	bhi	.L18
.L19:
.LBE6:
	.loc 1 87 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.LFE2:
	.size	qsort_r, .-qsort_r
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
	.uleb128 0x28
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
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x28
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
	.uleb128 0x8
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x289
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0xc
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF10
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
	.uleb128 0x4
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
	.uleb128 0x5
	.byte	0x4
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
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x16
	.4byte	0x53
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x1
	.byte	0x14
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x10e
	.uleb128 0x7
	.ascii	"m1\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x7
	.ascii	"m2\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x14
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x9
	.ascii	"p1\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.ascii	"p2\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x10e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x9
	.ascii	"t\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x2c
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x28
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a9
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x28
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x28
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x28
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x1
	.byte	0x28
	.4byte	0x1c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x2d
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x33
	.4byte	0x4c
	.uleb128 0xf
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	0x4c
	.4byte	0x1bd
	.uleb128 0x11
	.4byte	0x1bd
	.uleb128 0x11
	.4byte	0x1bd
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1c3
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1a9
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x44
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26d
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x44
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x44
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x44
	.4byte	0x7f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x1
	.byte	0x44
	.4byte	0x286
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x7
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x68
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xa
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x9
	.ascii	"a\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"b\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x49
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x33
	.4byte	0x4c
	.uleb128 0xf
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.4byte	0x4c
	.4byte	0x286
	.uleb128 0x11
	.4byte	0x1bd
	.uleb128 0x11
	.4byte	0x1bd
	.uleb128 0x11
	.4byte	0x68
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x26d
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xf
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x45
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x28d
	.4byte	0x8a
	.ascii	"swap\000"
	.4byte	0x114
	.ascii	"qsort\000"
	.4byte	0x199
	.ascii	"compare\000"
	.4byte	0x1ca
	.ascii	"qsort_r\000"
	.4byte	0x25d
	.ascii	"compare\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xd5
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x28d
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
	.4byte	0x4c
	.ascii	"int\000"
	.4byte	0x53
	.ascii	"unsigned int\000"
	.4byte	0x5a
	.ascii	"long long int\000"
	.4byte	0x61
	.ascii	"long long unsigned int\000"
	.4byte	0x6a
	.ascii	"long int\000"
	.4byte	0x71
	.ascii	"char\000"
	.4byte	0x78
	.ascii	"sizetype\000"
	.4byte	0x7f
	.ascii	"size_t\000"
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
.LASF17:
	.ascii	"qsort\000"
.LASF21:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/l"
	.ascii	"ib/qsort.c\000"
.LASF2:
	.ascii	"short int\000"
.LASF11:
	.ascii	"size_t\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF23:
	.ascii	"swap\000"
.LASF10:
	.ascii	"uint8_t\000"
.LASF5:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"long int\000"
.LASF18:
	.ascii	"qsort_r\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"char\000"
.LASF14:
	.ascii	"nmemb\000"
.LASF15:
	.ascii	"compar\000"
.LASF16:
	.ascii	"deltaA\000"
.LASF22:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF12:
	.ascii	"size\000"
.LASF19:
	.ascii	"compare\000"
.LASF20:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF13:
	.ascii	"base\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
