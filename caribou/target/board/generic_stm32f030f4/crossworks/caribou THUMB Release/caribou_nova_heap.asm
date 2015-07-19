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
	.file	"nova_heap.c"
	.text
.Ltext0:
	.section	.text.nova_heap_init,"ax",%progbits
	.align	2
	.global	nova_heap_init
	.code	16
	.thumb_func
	.type	nova_heap_init, %function
nova_heap_init:
.LFB0:
	ldr	r3, .L2
	str	r0, [r3]
	mov	r3, #0
	str	r3, [r0]
	sub	r1, r1, r0
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
.LFE0:
	.size	nova_heap_init, .-nova_heap_init
	.section	.text.nova_heap_calloc,"ax",%progbits
	.align	2
	.global	nova_heap_calloc
	.code	16
	.thumb_func
	.type	nova_heap_calloc, %function
nova_heap_calloc:
.LFB1:
	push	{r3, lr}
.LCFI0:
	mul	r0, r1
	bl	malloc
	@ sp needed
	pop	{r3, pc}
.LFE1:
	.size	nova_heap_calloc, .-nova_heap_calloc
	.section	.text.nova_heap_malloc,"ax",%progbits
	.align	2
	.global	nova_heap_malloc
	.code	16
	.thumb_func
	.type	nova_heap_malloc, %function
nova_heap_malloc:
.LFB2:
	push	{r4, r5, r6, lr}
.LCFI1:
	mov	r4, r0
	bl	chip_interrupts_disable
	add	r4, r4, #19
	mov	r3, #15
	bic	r4, r3
	ldr	r3, .L18
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L6
	ldr	r2, [r1, #4]
	cmp	r2, r4
	bne	.L17
	b	.L7
.L14:
	ldr	r2, [r3, #4]
	cmp	r2, r4
	beq	.L9
	mov	r1, r3
	b	.L10
.L9:
.LBB2:
	cmp	r1, #0
	beq	.L15
	ldr	r2, [r3]
	str	r2, [r1]
	b	.L11
.L15:
.LBE2:
	mov	r1, r3
.L7:
.LBB3:
	ldr	r3, .L18
	ldr	r2, [r1]
	str	r2, [r3]
	mov	r3, r1
.L11:
	mov	r6, r3
	stmia	r6!, {r4}
	bl	chip_interrupts_set
	b	.L12
.L17:
.LBE3:
	mov	r5, #1
	neg	r5, r5
	mov	r6, #0
.L10:
	cmp	r4, r2
	bcs	.L13
	cmp	r5, r2
	bls	.L13
	mov	r5, r2
	mov	r6, r1
.L13:
	ldr	r3, [r1]
	cmp	r3, #0
	bne	.L14
	cmp	r6, #0
	beq	.L6
.LBB4:
	ldr	r2, [r6, #4]
	sub	r3, r2, r4
	str	r3, [r6, #4]
	sub	r5, r5, r4
	add	r6, r6, r5
	stmia	r6!, {r4}
	bl	chip_interrupts_set
	b	.L12
.L6:
.LBE4:
.LBB5:
	bl	chip_interrupts_set
	mov	r6, #0
.L12:
.LBE5:
	mov	r0, r6
	@ sp needed
	pop	{r4, r5, r6, pc}
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
.LFE2:
	.size	nova_heap_malloc, .-nova_heap_malloc
	.section	.text.nova_heap_free,"ax",%progbits
	.align	2
	.global	nova_heap_free
	.code	16
	.thumb_func
	.type	nova_heap_free, %function
nova_heap_free:
.LFB3:
	push	{r4, r5, r6, r7, lr}
.LCFI2:
	mov	r7, r8
	push	{r7}
.LCFI3:
	sub	r4, r0, #0
	beq	.L20
.LBB6:
	bl	chip_interrupts_disable
	sub	r1, r4, #4
	ldr	r3, [r1]
	mov	r8, r3
	cmp	r1, #0
	beq	.L22
	ldr	r3, .L35
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L23
	cmp	r1, r2
	bhi	.L33
	b	.L34
.L23:
	ldr	r3, .L35
	str	r1, [r3]
	sub	r4, r4, #4
	mov	r3, #0
	str	r3, [r4]
	mov	r5, r8
	str	r5, [r4, #4]
	b	.L22
.L33:
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L31
	cmp	r1, r3
	bls	.L32
	mov	r2, r3
	b	.L33
.L31:
	mov	r7, r2
	mov	ip, r3
	b	.L26
.L32:
	mov	r7, r2
	mov	ip, r3
.L26:
	sub	r6, r4, #4
	mov	r5, ip
	str	r5, [r6]
	mov	r5, r8
	str	r5, [r4]
	cmp	r7, #0
	beq	.L28
	str	r1, [r7]
	b	.L29
.L28:
	ldr	r6, .L35
	str	r1, [r6]
.L29:
	cmp	r3, #0
	beq	.L30
	mov	r6, r8
	add	r5, r1, r6
	cmp	r5, r3
	bne	.L30
	sub	r3, r4, #4
	ldr	r7, [r5, #4]
	mov	ip, r7
	ldr	r7, [r4]
	add	ip, ip, r7
	mov	r6, ip
	str	r6, [r4]
	ldr	r5, [r5]
	str	r5, [r3]
.L30:
	cmp	r2, #0
	beq	.L22
	ldr	r3, [r2, #4]
	add	r5, r2, r3
	cmp	r1, r5
	bne	.L22
	ldr	r7, [r4]
	sub	r4, r4, #4
	add	r3, r7, r3
	str	r3, [r2, #4]
	ldr	r4, [r4]
	str	r4, [r2]
.L22:
	bl	chip_interrupts_set
	b	.L20
.L34:
	sub	r3, r4, #4
	str	r2, [r3]
	mov	r5, r8
	str	r5, [r4]
	mov	r3, r2
	mov	r2, #0
	b	.L28
.L20:
.LBE6:
	@ sp needed
	pop	{r2}
	mov	r8, r2
	pop	{r4, r5, r6, r7, pc}
.L36:
	.align	2
.L35:
	.word	.LANCHOR0
.LFE3:
	.size	nova_heap_free, .-nova_heap_free
	.section	.text.nova_heap_realloc,"ax",%progbits
	.align	2
	.global	nova_heap_realloc
	.code	16
	.thumb_func
	.type	nova_heap_realloc, %function
nova_heap_realloc:
.LFB4:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI4:
	mov	r4, r0
	mov	r5, r1
	cmp	r0, #0
	beq	.L41
	sub	r3, r0, #4
	ldr	r7, [r3]
	b	.L38
.L41:
	mov	r7, #0
.L38:
	cmp	r7, r5
	beq	.L42
	mov	r0, r5
	bl	malloc
	sub	r6, r0, #0
	beq	.L39
	cmp	r4, #0
	beq	.L39
.LBB7:
	sub	r2, r7, #0
	cmp	r2, r5
	bls	.L40
	mov	r2, r5
.L40:
	mov	r0, r6
	mov	r1, r4
	bl	memcpy
	mov	r0, r4
	bl	free
	b	.L39
.L42:
.LBE7:
	mov	r6, #0
.L39:
	mov	r0, r6
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE4:
	.size	nova_heap_realloc, .-nova_heap_realloc
	.section	.bss.heap,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	heap, %object
	.size	heap, 4
heap:
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
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
	.byte	0x4
	.4byte	.LCFI1-.LFB2
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
	.uleb128 0x18
	.byte	0x88
	.uleb128 0x6
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI4-.LFB4
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
	.align	2
.LEFDE8:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/nova_heap.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF4
	.byte	0x1
	.4byte	.LASF5
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x2b
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.byte	0x35
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c
	.uleb128 0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x72
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0xb8
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF2:
	.ascii	"nova_heap_free\000"
.LASF4:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF3:
	.ascii	"nova_heap_realloc\000"
.LASF0:
	.ascii	"nova_heap_init\000"
.LASF5:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/nova_heap.c\000"
.LASF6:
	.ascii	"nova_heap_malloc\000"
.LASF7:
	.ascii	"chip_interrupts_disable\000"
.LASF1:
	.ascii	"nova_heap_calloc\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
