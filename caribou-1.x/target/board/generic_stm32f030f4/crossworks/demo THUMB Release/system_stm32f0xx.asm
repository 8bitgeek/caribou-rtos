	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
	.file	"system_stm32f0xx.c"
	.text
.Ltext0:
	.section	.text.SystemInit,"ax",%progbits
	.align	2
	.global	SystemInit
	.code	16
	.thumb_func
	.type	SystemInit, %function
SystemInit:
.LFB32:
	ldr	r3, .L21
	mov	r2, #1
	ldr	r1, [r3]
	sub	sp, sp, #8
.LCFI0:
	orr	r1, r2
	str	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r1, .L21+4
	and	r1, r0
	str	r1, [r3, #4]
	ldr	r0, [r3]
	ldr	r1, .L21+8
	and	r1, r0
	str	r1, [r3]
	ldr	r0, [r3]
	ldr	r1, .L21+12
	and	r1, r0
	str	r1, [r3]
	ldr	r0, [r3, #4]
	ldr	r1, .L21+16
	and	r1, r0
	str	r1, [r3, #4]
	ldr	r1, [r3, #44]
	mov	r0, #15
	bic	r1, r0
	str	r1, [r3, #44]
	ldr	r0, [r3, #48]
	ldr	r1, .L21+20
	and	r1, r0
	str	r1, [r3, #48]
	ldr	r1, [r3, #52]
.LBB4:
.LBB5:
	mov	r0, #160
.LBE5:
.LBE4:
	bic	r1, r2
	mov	r2, #0
	str	r1, [r3, #52]
	str	r2, [r3, #8]
.LBB8:
.LBB6:
	str	r2, [sp]
	str	r2, [sp, #4]
	ldr	r1, [r3]
	mov	r2, #128
	lsl	r2, r2, #9
	orr	r2, r1
	str	r2, [r3]
	mov	r2, #128
	mov	r1, r3
	lsl	r2, r2, #10
	lsl	r0, r0, #3
	b	.L3
.L19:
	ldr	r3, [sp]
	cmp	r3, r0
	beq	.L2
.L3:
	ldr	r3, [r1]
	and	r3, r2
	str	r3, [sp, #4]
	ldr	r3, [sp]
	add	r3, r3, #1
	str	r3, [sp]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L19
.L2:
	ldr	r3, .L21
	ldr	r2, [r3]
	mov	r3, #128
	lsl	r3, r3, #10
	and	r3, r2
	beq	.L4
	mov	r3, #1
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	mov	r2, #17
	cmp	r3, #1
	beq	.L20
.L6:
	ldr	r3, .L21+24
	ldr	r0, .L21
	str	r2, [r3]
	ldr	r3, [r0, #4]
	mov	r1, #128
	str	r3, [r0, #4]
	ldr	r3, [r0, #4]
	lsl	r1, r1, #18
	str	r3, [r0, #4]
	ldr	r2, [r0, #4]
	ldr	r3, .L21+16
	and	r3, r2
	str	r3, [r0, #4]
	ldr	r2, [r0, #4]
	mov	r3, #160
	lsl	r3, r3, #14
	orr	r3, r2
	str	r3, [r0, #4]
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #17
	orr	r3, r2
	str	r3, [r0]
.L12:
	ldr	r3, [r0]
	ldr	r2, .L21
	tst	r3, r1
	beq	.L12
	ldr	r3, [r2, #4]
	mov	r1, #3
	bic	r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r2, #4]
	mov	r3, #2
	orr	r3, r1
	str	r3, [r2, #4]
	mov	r1, #12
.L14:
	ldr	r3, [r2, #4]
	and	r3, r1
	cmp	r3, #8
	bne	.L14
.L1:
.LBE6:
.LBE8:
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L4:
.LBB9:
.LBB7:
	str	r3, [sp, #4]
	ldr	r3, [sp, #4]
	mov	r2, #17
	cmp	r3, #1
	bne	.L6
.L20:
	ldr	r3, .L21+24
	ldr	r0, .L21
	str	r2, [r3]
	ldr	r3, [r0, #4]
	mov	r1, #128
	str	r3, [r0, #4]
	ldr	r3, [r0, #4]
	lsl	r1, r1, #18
	str	r3, [r0, #4]
	ldr	r2, [r0, #4]
	ldr	r3, .L21+16
	and	r3, r2
	str	r3, [r0, #4]
	ldr	r2, [r0, #4]
	mov	r3, #136
	lsl	r3, r3, #13
	orr	r3, r2
	str	r3, [r0, #4]
	ldr	r2, [r0]
	mov	r3, #128
	lsl	r3, r3, #17
	orr	r3, r2
	str	r3, [r0]
.L8:
	ldr	r3, [r0]
	ldr	r2, .L21
	tst	r3, r1
	beq	.L8
	ldr	r3, [r2, #4]
	mov	r1, #3
	bic	r3, r1
	str	r3, [r2, #4]
	ldr	r1, [r2, #4]
	mov	r3, #2
	orr	r3, r1
	str	r3, [r2, #4]
	mov	r1, #12
.L10:
	ldr	r3, [r2, #4]
	and	r3, r1
	cmp	r3, #8
	bne	.L10
	b	.L1
.L22:
	.align	2
.L21:
	.word	1073876992
	.word	-117458932
	.word	-17367041
	.word	-262145
	.word	-4128769
	.word	-340
	.word	1073881088
.LBE7:
.LBE9:
.LFE32:
	.size	SystemInit, .-SystemInit
	.global	__aeabi_uidiv
	.section	.text.SystemCoreClockUpdate,"ax",%progbits
	.align	2
	.global	SystemCoreClockUpdate
	.code	16
	.thumb_func
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
.LFB33:
	ldr	r3, .L29
	mov	r1, #12
	ldr	r2, [r3, #4]
	push	{r4, lr}
.LCFI1:
	and	r2, r1
	cmp	r2, #8
	bne	.L28
	ldr	r4, [r3, #4]
	ldr	r2, [r3, #4]
	lsl	r4, r4, #10
	lsr	r4, r4, #28
	add	r4, r4, #2
	lsl	r1, r2, #15
	bmi	.L26
	ldr	r0, .L29+4
	mul	r0, r4
	b	.L24
.L28:
	ldr	r0, .L29+8
.L24:
	ldr	r3, .L29
	ldr	r2, .L29+12
	ldr	r3, [r3, #4]
	@ sp needed
	lsl	r3, r3, #24
	lsr	r3, r3, #28
	ldrb	r3, [r2, r3]
	lsr	r0, r0, r3
	ldr	r3, .L29+16
	str	r0, [r3]
	pop	{r4, pc}
.L26:
	ldr	r3, [r3, #44]
	mov	r1, #15
	and	r1, r3
	add	r1, r1, #1
	ldr	r0, .L29+8
	bl	__aeabi_uidiv
	mul	r0, r4
	b	.L24
.L30:
	.align	2
.L29:
	.word	1073876992
	.word	4000000
	.word	8000000
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE33:
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.global	AHBPrescTable
	.global	SystemCoreClock
	.section	.data.AHBPrescTable,"aw",%progbits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	AHBPrescTable, %object
	.size	AHBPrescTable, 16
AHBPrescTable:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.section	.data.SystemCoreClock,"aw",%progbits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	48000000
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../src/system_stm32f0xx.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x45
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
	.2byte	0x117
	.byte	0x1
	.uleb128 0x3
	.4byte	.LASF0
	.byte	0x1
	.byte	0x9f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
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
	.uleb128 0x5
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
	.uleb128 0x2117
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
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF4:
	.ascii	"SetSysClock\000"
.LASF3:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"src/system_stm32f0xx.c\000"
.LASF1:
	.ascii	"SystemCoreClockUpdate\000"
.LASF2:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O3 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF0:
	.ascii	"SystemInit\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
