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
	.file	"qsort.c"
	.text
.Ltext0:
	.section	.text.qsort,"ax",%progbits
	.align	2
	.global	qsort
	.code	16
	.thumb_func
	.type	qsort, %function
qsort:
.LFB1:
	push	{r4, r5, r6, r7, lr}
.LCFI0:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI1:
	sub	sp, sp, #12
.LCFI2:
	mov	r6, r0
	mov	r7, r1
	mov	r5, r2
	cmp	r1, #1
	bls	.L1
	mov	r10, r0
	sub	r2, r1, #1
	str	r2, [sp, #4]
	mov	r3, #0
	mov	fp, r3
	mov	r8, r5
	b	.L3
.L9:
.LBB8:
	mov	r2, #1
	mov	r9, r2
	add	r9, r9, fp
	mov	r1, r9
	cmp	r7, r9
	bls	.L4
	mov	r4, r9
	mov	r3, r7
	mov	r7, fp
	mov	fp, r3
.L6:
.LBB9:
	mov	r0, r5
	mul	r0, r7
	add	r0, r6, r0
	mul	r1, r5
	add	r1, r6, r1
	bl	compare
	cmp	r0, #0
	ble	.L5
	mov	r7, r4
.L5:
.LBE9:
	add	r4, r4, #1
	mov	r1, r4
	cmp	fp, r4
	bhi	.L6
	mov	r3, fp
	mov	fp, r7
	mov	r7, r3
.L4:
.LBB10:
	mov	r3, #255
	mov	r2, r10
	and	r3, r2
	mov	ip, r3
.LBE10:
	mov	r3, fp
	mul	r3, r5
	add	r3, r6, r3
.LBB13:
	mov	r2, #255
	and	r2, r3
	mov	fp, r2
.LBB11:
	cmp	r5, #0
	beq	.L7
	mov	r3, #0
	mov	r2, #0
	mov	r4, ip
	mov	ip, r6
	mov	r6, r8
	mov	r8, r5
	mov	r5, fp
	mov	fp, r7
.L8:
.LBB12:
	add	r1, r4, r2
	ldrb	r0, [r1]
	add	r2, r5, r2
	ldrb	r7, [r2]
	strb	r7, [r1]
	strb	r0, [r2]
.LBE12:
	add	r3, r3, #1
	sub	r2, r3, #0
	cmp	r2, r6
	bne	.L8
	mov	r7, fp
	mov	r5, r8
	mov	r8, r6
	mov	r6, ip
.L7:
	add	r10, r10, r5
.LBE11:
.LBE13:
	mov	fp, r9
.L3:
	ldr	r3, [sp, #4]
	cmp	fp, r3
	bne	.L9
.L1:
.LBE8:
	add	sp, sp, #12
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
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
	mov	r7, r1
	mov	r5, r2
	ldr	r2, [sp, #48]
	mov	r8, r2
	cmp	r1, #1
	bls	.L11
	str	r0, [sp]
	sub	r3, r1, #1
	str	r3, [sp, #4]
	mov	r2, #0
	mov	fp, r2
	mov	r9, r5
	b	.L13
.L19:
.LBB20:
	mov	r3, #1
	mov	r10, r3
	add	r10, r10, fp
	mov	r1, r10
	cmp	r7, r10
	bls	.L14
	mov	r4, r10
	mov	r3, r7
	mov	r7, fp
	mov	fp, r3
.L16:
.LBB21:
	mov	r0, r5
	mul	r0, r7
	add	r0, r6, r0
	mul	r1, r5
	add	r1, r6, r1
	mov	r2, r8
	bl	compare
	cmp	r0, #0
	ble	.L15
	mov	r7, r4
.L15:
.LBE21:
	add	r4, r4, #1
	mov	r1, r4
	cmp	fp, r4
	bhi	.L16
	mov	r3, fp
	mov	fp, r7
	mov	r7, r3
.L14:
.LBB22:
	mov	r2, #255
	ldr	r3, [sp]
	and	r2, r3
	mov	ip, r2
.LBE22:
	mov	r3, fp
	mul	r3, r5
	add	r3, r6, r3
.LBB25:
	mov	r2, #255
	and	r2, r3
	mov	fp, r2
.LBB23:
	cmp	r5, #0
	beq	.L17
	mov	r3, #0
	mov	r2, #0
	mov	r4, ip
	mov	ip, r6
	mov	r6, r9
	mov	r9, r5
	mov	r5, fp
	mov	fp, r7
.L18:
.LBB24:
	add	r1, r4, r2
	ldrb	r0, [r1]
	add	r2, r5, r2
	ldrb	r7, [r2]
	strb	r7, [r1]
	strb	r0, [r2]
.LBE24:
	add	r3, r3, #1
	sub	r2, r3, #0
	cmp	r2, r6
	bne	.L18
	mov	r7, fp
	mov	r5, r9
	mov	r9, r6
	mov	r6, ip
.L17:
	ldr	r3, [sp]
	add	r3, r3, r5
	str	r3, [sp]
.LBE23:
.LBE25:
	mov	fp, r10
.L13:
	ldr	r2, [sp, #4]
	cmp	fp, r2
	bne	.L19
.L11:
.LBE20:
	add	sp, sp, #12
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
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
	.4byte	.LCFI3-.LFB2
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/qsort.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x44
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF2
	.byte	0x1
	.4byte	.LASF3
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x28
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x44
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
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
	.uleb128 0x20
	.uleb128 0xb
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
	.byte	0
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
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF0:
	.ascii	"qsort\000"
.LASF2:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"qsort_r\000"
.LASF4:
	.ascii	"swap\000"
.LASF3:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/qsort.c\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
