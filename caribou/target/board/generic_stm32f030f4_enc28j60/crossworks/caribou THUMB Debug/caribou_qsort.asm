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
	.file	"qsort.c"
	.text
.Ltext0:
	.section	.text.qsort,"ax",%progbits
	.align	1
	.global	qsort
	.code	16
	.thumb_func
	.type	qsort, %function
qsort:
.LFB1:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../../src/lib/qsort.c"
	.loc 1 41 0
.LVL0:
	push	{r4, r5, r6, r7, lr}
.LCFI0:
	sub	sp, sp, #28
.LCFI1:
	.loc 1 41 0
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	mov	r7, r2
	.loc 1 42 0
	cmp	r1, #1
	bls	.L1
	mov	r6, r0
	mov	r4, #0
.LVL1:
.L3:
.LBB8:
	.loc 1 46 0 discriminator 1
	ldr	r3, [sp, #12]
	sub	r3, r3, #1
	cmp	r4, r3
	bcs	.L1
.LVL2:
	.loc 1 49 0
	add	r3, r4, #1
	str	r3, [sp, #16]
.LVL3:
	ldr	r5, [sp, #16]
	add	r3, r6, r7
.LVL4:
	str	r3, [sp, #20]
	str	r3, [sp, #4]
.L4:
	.loc 1 49 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #12]
	mov	r0, r7
	mul	r0, r4
	cmp	r5, r3
	bcs	.L13
.LBB9:
	.loc 1 51 0 is_stmt 1
	ldr	r3, [sp, #8]
	ldr	r1, [sp, #4]
	add	r0, r3, r0
	bl	compare
.LVL5:
	cmp	r0, #0
	ble	.L5
.LVL6:
	.loc 1 53 0
	mov	r4, r5
.LVL7:
.L5:
	ldr	r3, [sp, #4]
.LBE9:
	.loc 1 49 0
	add	r5, r5, #1
.LVL8:
	add	r3, r3, r7
	str	r3, [sp, #4]
	b	.L4
.L13:
.LVL9:
	.loc 1 56 0
	ldr	r3, [sp, #8]
	add	r0, r3, r0
.LBB10:
.LBB11:
	.loc 1 23 0
	mov	r3, #255
	.loc 1 22 0
	and	r6, r3
.LVL10:
	.loc 1 23 0
	and	r0, r3
.LVL11:
	add	r1, r6, r7
	mov	r3, r6
.LVL12:
.L7:
.LBB12:
	.loc 1 24 0
	cmp	r3, r1
	beq	.L14
	sub	r2, r0, r6
.LBB13:
	.loc 1 26 0
	ldrb	r4, [r3]
.LVL13:
	.loc 1 27 0
	ldrb	r5, [r2, r3]
	strb	r5, [r3]
.LVL14:
	.loc 1 28 0
	strb	r4, [r2, r3]
	add	r3, r3, #1
	b	.L7
.LVL15:
.L14:
	ldr	r6, [sp, #20]
.LVL16:
.LBE13:
.LBE12:
.LBE11:
.LBE10:
	.loc 1 46 0
	ldr	r4, [sp, #16]
	b	.L3
.LVL17:
.L1:
.LBE8:
	.loc 1 59 0
	add	sp, sp, #28
	@ sp needed
.LVL18:
	pop	{r4, r5, r6, r7, pc}
.LFE1:
	.size	qsort, .-qsort
	.section	.text.qsort_r,"ax",%progbits
	.align	1
	.global	qsort_r
	.code	16
	.thumb_func
	.type	qsort_r, %function
qsort_r:
.LFB2:
	.loc 1 69 0
.LVL19:
	push	{r4, r5, r6, r7, lr}
.LCFI2:
	sub	sp, sp, #28
.LCFI3:
	.loc 1 69 0
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	mov	r5, r2
	.loc 1 70 0
	cmp	r1, #1
	bls	.L15
	str	r0, [sp, #4]
	mov	r4, #0
.LVL20:
.L17:
.LBB20:
	.loc 1 74 0 discriminator 1
	ldr	r3, [sp, #12]
	sub	r3, r3, #1
	cmp	r4, r3
	bcs	.L15
.LVL21:
	.loc 1 77 0
	add	r3, r4, #1
	str	r3, [sp, #16]
.LVL22:
	ldr	r3, [sp, #4]
.LVL23:
	ldr	r6, [sp, #16]
	add	r3, r3, r5
	str	r3, [sp, #20]
	mov	r7, r3
.LVL24:
.L18:
	.loc 1 77 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #12]
	mov	r0, r5
	mul	r0, r4
	cmp	r6, r3
	bcs	.L26
.LBB21:
	.loc 1 79 0 is_stmt 1
	ldr	r3, [sp, #8]
	mov	r1, r7
	add	r0, r3, r0
	ldr	r2, [sp, #48]
	bl	compare
.LVL25:
	cmp	r0, #0
	ble	.L19
.LVL26:
	.loc 1 81 0
	mov	r4, r6
.LVL27:
.L19:
.LBE21:
	.loc 1 77 0
	add	r6, r6, #1
.LVL28:
	add	r7, r7, r5
	b	.L18
.L26:
.LVL29:
	.loc 1 84 0
	ldr	r3, [sp, #8]
.LBB22:
.LBB23:
	.loc 1 23 0
	mov	r2, #255
.LBE23:
.LBE22:
	.loc 1 84 0
	add	r0, r3, r0
.LBB27:
.LBB26:
	.loc 1 22 0
	ldr	r3, [sp, #4]
	.loc 1 23 0
	and	r0, r2
.LVL30:
	.loc 1 22 0
	and	r2, r3
.LVL31:
	add	r4, r2, r5
	.loc 1 23 0
	mov	r3, r2
.LVL32:
.L21:
.LBB24:
	.loc 1 24 0
	cmp	r3, r4
	beq	.L27
	sub	r1, r0, r2
.LBB25:
	.loc 1 26 0
	ldrb	r6, [r3]
.LVL33:
	.loc 1 27 0
	ldrb	r7, [r1, r3]
	strb	r7, [r3]
.LVL34:
	.loc 1 28 0
	strb	r6, [r1, r3]
.LVL35:
	add	r3, r3, #1
.LVL36:
	b	.L21
.LVL37:
.L27:
	ldr	r3, [sp, #20]
.LVL38:
.LBE25:
.LBE24:
.LBE26:
.LBE27:
	.loc 1 74 0
	ldr	r4, [sp, #16]
	str	r3, [sp, #4]
.LVL39:
	b	.L17
.LVL40:
.L15:
.LBE20:
	.loc 1 87 0
	add	sp, sp, #28
	@ sp needed
.LVL41:
	pop	{r4, r5, r6, r7, pc}
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI2-.LFB2
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
	.uleb128 0x30
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x397
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x1
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.Ldebug_ranges0+0x18
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
	.byte	0x1
	.4byte	0xe0
	.uleb128 0x7
	.ascii	"m1\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x68
	.uleb128 0x7
	.ascii	"m2\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x68
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x14
	.4byte	0x7f
	.uleb128 0x9
	.ascii	"p1\000"
	.byte	0x1
	.byte	0x16
	.4byte	0xe0
	.uleb128 0x9
	.ascii	"p2\000"
	.byte	0x1
	.byte	0x17
	.4byte	0xe0
	.uleb128 0xa
	.uleb128 0x9
	.ascii	"n\000"
	.byte	0x1
	.byte	0x18
	.4byte	0x4c
	.uleb128 0xa
	.uleb128 0x9
	.ascii	"t\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x2c
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
	.4byte	0x211
	.uleb128 0xd
	.4byte	.LASF13
	.byte	0x1
	.byte	0x28
	.4byte	0x68
	.4byte	.LLST0
	.uleb128 0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x28
	.4byte	0x7f
	.4byte	.LLST1
	.uleb128 0xd
	.4byte	.LASF12
	.byte	0x1
	.byte	0x28
	.4byte	0x7f
	.4byte	.LLST2
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x28
	.4byte	0x22c
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0xf
	.ascii	"a\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x4c
	.4byte	.LLST4
	.uleb128 0xf
	.ascii	"b\000"
	.byte	0x1
	.byte	0x2c
	.4byte	0x4c
	.4byte	.LLST5
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.byte	0x2d
	.4byte	0x4c
	.4byte	.LLST4
	.uleb128 0x11
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x1a6
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x33
	.4byte	0x4c
	.4byte	0x187
	.uleb128 0x13
	.byte	0
	.uleb128 0x14
	.4byte	.LVL5
	.4byte	0x38d
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.byte	0x77
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x1e
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	0x8a
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x1
	.byte	0x38
	.uleb128 0x17
	.4byte	0xaa
	.4byte	.LLST7
	.uleb128 0x18
	.4byte	0xa0
	.uleb128 0x17
	.4byte	0x96
	.4byte	.LLST8
	.uleb128 0xe
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x19
	.4byte	0xb5
	.4byte	.LLST9
	.uleb128 0x19
	.4byte	0xbf
	.4byte	.LLST10
	.uleb128 0xe
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.uleb128 0x19
	.4byte	0xca
	.4byte	.LLST11
	.uleb128 0xe
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.uleb128 0x19
	.4byte	0xd4
	.4byte	.LLST12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0x4c
	.4byte	0x225
	.uleb128 0x1b
	.4byte	0x225
	.uleb128 0x1b
	.4byte	0x225
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x22b
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x4
	.4byte	0x211
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x44
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36e
	.uleb128 0xd
	.4byte	.LASF13
	.byte	0x1
	.byte	0x44
	.4byte	0x68
	.4byte	.LLST13
	.uleb128 0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x44
	.4byte	0x7f
	.4byte	.LLST14
	.uleb128 0xd
	.4byte	.LASF12
	.byte	0x1
	.byte	0x44
	.4byte	0x7f
	.4byte	.LLST15
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x44
	.4byte	0x387
	.4byte	.LLST16
	.uleb128 0x1d
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x68
	.4byte	.LLST17
	.uleb128 0xe
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.uleb128 0xf
	.ascii	"a\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x4c
	.4byte	.LLST18
	.uleb128 0xf
	.ascii	"b\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x4c
	.4byte	.LLST19
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x1
	.byte	0x49
	.4byte	0x4c
	.4byte	.LLST18
	.uleb128 0x11
	.4byte	.LBB21
	.4byte	.LBE21-.LBB21
	.4byte	0x307
	.uleb128 0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x33
	.4byte	0x4c
	.4byte	0x2e2
	.uleb128 0x13
	.byte	0
	.uleb128 0x14
	.4byte	.LVL25
	.4byte	0x38d
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x9
	.byte	0x75
	.sleb128 0
	.byte	0x74
	.sleb128 0
	.byte	0x1e
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	0x8a
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x54
	.uleb128 0x17
	.4byte	0xaa
	.4byte	.LLST21
	.uleb128 0x18
	.4byte	0xa0
	.uleb128 0x17
	.4byte	0x96
	.4byte	.LLST22
	.uleb128 0x1f
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x19
	.4byte	0xb5
	.4byte	.LLST23
	.uleb128 0x19
	.4byte	0xbf
	.4byte	.LLST24
	.uleb128 0xe
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.uleb128 0x19
	.4byte	0xca
	.4byte	.LLST25
	.uleb128 0xe
	.4byte	.LBB25
	.4byte	.LBE25-.LBB25
	.uleb128 0x19
	.4byte	0xd4
	.4byte	.LLST26
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	0x4c
	.4byte	0x387
	.uleb128 0x1b
	.4byte	0x225
	.uleb128 0x1b
	.4byte	0x225
	.uleb128 0x1b
	.4byte	0x68
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x36e
	.uleb128 0x20
	.4byte	.LASF19
	.byte	0x1
	.byte	0x33
	.4byte	0x4c
	.uleb128 0x13
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
	.uleb128 0x20
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xb
	.byte	0x1
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL18
	.4byte	.LFE1
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
	.4byte	.LVL1
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x91
	.sleb128 -32
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL4
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL9
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x6
	.byte	0x76
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL11
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL20
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL20
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL41
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL20
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x53
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x2
	.byte	0x91
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x91
	.sleb128 -32
	.4byte	.LVL24
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL29
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL29
	.4byte	.LVL32
	.2byte	0x2
	.byte	0x91
	.sleb128 -44
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL29
	.4byte	.LVL31
	.2byte	0x7
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL31
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL30
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL35
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x6
	.byte	0x73
	.sleb128 0
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	.LVL34
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x56
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	0
	.4byte	0
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
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../../src/lib/qsort.c\000"
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
.LASF22:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
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
.LASF20:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF16:
	.ascii	"deltaA\000"
.LASF12:
	.ascii	"size\000"
.LASF19:
	.ascii	"compare\000"
.LASF13:
	.ascii	"base\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
