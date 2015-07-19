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
	.file	"nova_heap.c"
	.text
.Ltext0:
	.section	.text.nova_heap_init,"ax",%progbits
	.align	1
	.global	nova_heap_init
	.code	16
	.thumb_func
	.type	nova_heap_init, %function
nova_heap_init:
.LFB0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../../src/lib/nova_heap.c"
	.loc 1 32 0
.LVL0:
	.loc 1 33 0
	ldr	r3, .L2
	.loc 1 35 0
	sub	r1, r1, r0
.LVL1:
	.loc 1 33 0
	str	r0, [r3]
	.loc 1 34 0
	mov	r3, #0
	str	r3, [r0]
	.loc 1 35 0
	str	r1, [r0, #4]
	.loc 1 36 0
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
.LFE0:
	.size	nova_heap_init, .-nova_heap_init
	.section	.text.nova_heap_calloc,"ax",%progbits
	.align	1
	.global	nova_heap_calloc
	.code	16
	.thumb_func
	.type	nova_heap_calloc, %function
nova_heap_calloc:
.LFB1:
	.loc 1 44 0
.LVL2:
	push	{r3, lr}
.LCFI0:
	.loc 1 45 0
	mul	r0, r1
.LVL3:
	bl	malloc
.LVL4:
	.loc 1 47 0
	@ sp needed
	pop	{r3, pc}
.LFE1:
	.size	nova_heap_calloc, .-nova_heap_calloc
	.section	.text.nova_heap_malloc,"ax",%progbits
	.align	1
	.global	nova_heap_malloc
	.code	16
	.thumb_func
	.type	nova_heap_malloc, %function
nova_heap_malloc:
.LFB2:
	.loc 1 54 0
.LVL5:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI1:
	.loc 1 54 0
	mov	r4, r0
	.loc 1 60 0
	bl	chip_interrupts_disable
.LVL6:
	.loc 1 62 0
	mov	r2, r4
	.loc 1 63 0
	ldr	r1, .L18
	.loc 1 62 0
	mov	r3, #15
	add	r2, r2, #19
	bic	r2, r3
.LVL7:
	.loc 1 65 0
	mov	r5, #1
	.loc 1 66 0
	mov	r4, #0
	.loc 1 63 0
	ldr	r3, [r1]
.LVL8:
	.loc 1 65 0
	neg	r5, r5
	.loc 1 64 0
	mov	r6, r4
	mov	r7, r1
.LVL9:
.L6:
	.loc 1 68 0 discriminator 1
	cmp	r3, #0
	beq	.L17
	.loc 1 70 0
	ldr	r1, [r3, #4]
	cmp	r1, r2
	bne	.L7
	ldr	r1, [r3]
.LBB2:
	.loc 1 72 0
	cmp	r6, #0
	beq	.L8
	.loc 1 74 0
	str	r1, [r6]
	b	.L9
.L8:
	.loc 1 78 0
	str	r1, [r7]
.L9:
	.loc 1 80 0
	mov	r4, r3
.LVL10:
	b	.L15
.LVL11:
.L7:
.LBE2:
	.loc 1 85 0
	cmp	r1, r2
	bls	.L11
	.loc 1 85 0 is_stmt 0 discriminator 1
	cmp	r1, r5
	bcs	.L11
	mov	r5, r1
.LVL12:
	mov	r4, r3
.LVL13:
.L11:
	.loc 1 92 0 is_stmt 1
	mov	r6, r3
	ldr	r3, [r3]
.LVL14:
	b	.L6
.L17:
	.loc 1 94 0
	cmp	r4, #0
	beq	.L13
.LBB3:
	.loc 1 96 0
	ldr	r1, [r4, #4]
	.loc 1 97 0
	sub	r5, r5, r2
.LVL15:
	.loc 1 96 0
	sub	r3, r1, r2
	str	r3, [r4, #4]
	.loc 1 98 0
	add	r4, r4, r5
.LVL16:
.L15:
	stmia	r4!, {r2}
.LVL17:
.L13:
.LBE3:
.LBB4:
	.loc 1 104 0
	bl	chip_interrupts_set
.LVL18:
.LBE4:
	.loc 1 107 0
	@ sp needed
	mov	r0, r4
.LVL19:
	pop	{r3, r4, r5, r6, r7, pc}
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
.LFE2:
	.size	nova_heap_malloc, .-nova_heap_malloc
	.section	.text.nova_heap_free,"ax",%progbits
	.align	1
	.global	nova_heap_free
	.code	16
	.thumb_func
	.type	nova_heap_free, %function
nova_heap_free:
.LFB3:
	.loc 1 115 0
.LVL20:
	push	{r4, r5, r6, lr}
.LCFI2:
	.loc 1 115 0
	sub	r4, r0, #0
	.loc 1 119 0
	beq	.L20
.LBB5:
	.loc 1 121 0
	bl	chip_interrupts_disable
.LVL21:
	.loc 1 123 0
	sub	r3, r4, #4
.LVL22:
	.loc 1 125 0
	ldr	r5, [r3]
.LVL23:
	.loc 1 126 0
	cmp	r3, #0
	beq	.L23
	.loc 1 129 0
	ldr	r2, .L42
	ldr	r4, [r2]
	mov	r6, r2
	cmp	r4, #0
	beq	.L24
	mov	r2, #0
	b	.L25
.L24:
	.loc 1 132 0
	str	r3, [r2]
	.loc 1 134 0
	stmia	r3!, {r4, r5}
.LVL24:
	b	.L23
.LVL25:
.L27:
	.loc 1 142 0
	ldr	r1, [r4]
.LVL26:
	.loc 1 140 0
	mov	r2, r4
	cmp	r1, #0
	beq	.L26
.LVL27:
	.loc 1 142 0
	mov	r4, r1
.LVL28:
.L25:
	.loc 1 140 0 discriminator 2
	cmp	r4, r3
	bcc	.L27
	mov	r1, r4
.LVL29:
.L26:
	.loc 1 153 0
	str	r1, [r3]
	.loc 1 154 0
	str	r5, [r3, #4]
	.loc 1 155 0
	cmp	r2, #0
	beq	.L28
	.loc 1 156 0
	str	r3, [r2]
	b	.L29
.L28:
	.loc 1 158 0
	str	r3, [r6]
.L29:
	.loc 1 160 0
	cmp	r1, #0
	beq	.L30
	.loc 1 160 0 is_stmt 0 discriminator 1
	add	r4, r3, r5
	cmp	r4, r1
	bne	.L30
	.loc 1 162 0 is_stmt 1
	ldr	r4, [r1, #4]
	.loc 1 163 0
	ldr	r1, [r1]
.LVL30:
	.loc 1 162 0
	add	r5, r5, r4
.LVL31:
	str	r5, [r3, #4]
.LVL32:
	.loc 1 163 0
	str	r1, [r3]
.L30:
	.loc 1 166 0
	cmp	r2, #0
	beq	.L23
	.loc 1 166 0 is_stmt 0 discriminator 1
	ldr	r1, [r2, #4]
	add	r4, r2, r1
	cmp	r3, r4
	bne	.L23
	.loc 1 168 0 is_stmt 1
	ldr	r4, [r3, #4]
	.loc 1 169 0
	ldr	r3, [r3]
.LVL33:
	.loc 1 168 0
	add	r1, r4, r1
	str	r1, [r2, #4]
	.loc 1 169 0
	str	r3, [r2]
.LVL34:
.L23:
	.loc 1 173 0
	bl	chip_interrupts_set
.LVL35:
.L20:
.LBE5:
	.loc 1 175 0
	@ sp needed
	pop	{r4, r5, r6, pc}
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
.LFE3:
	.size	nova_heap_free, .-nova_heap_free
	.section	.text.nova_heap_realloc,"ax",%progbits
	.align	1
	.global	nova_heap_realloc
	.code	16
	.thumb_func
	.type	nova_heap_realloc, %function
nova_heap_realloc:
.LFB4:
	.loc 1 185 0
.LVL36:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI3:
	.loc 1 185 0
	mov	r4, r0
	mov	r6, r1
	.loc 1 187 0
	cmp	r0, #0
	beq	.L50
	.loc 1 187 0 is_stmt 0 discriminator 1
	sub	r3, r0, #4
	ldr	r7, [r3]
	b	.L45
.L50:
	.loc 1 187 0
	mov	r7, r0
.L45:
.LVL37:
	.loc 1 188 0 is_stmt 1 discriminator 3
	cmp	r7, r6
	bne	.L46
.LVL38:
.L48:
	.loc 1 186 0
	mov	r5, #0
	b	.L47
.LVL39:
.L46:
	.loc 1 192 0
	mov	r0, r6
.LVL40:
	bl	malloc
.LVL41:
	sub	r5, r0, #0
.LVL42:
	.loc 1 193 0
	beq	.L48
	.loc 1 193 0 is_stmt 0 discriminator 1
	cmp	r4, #0
	beq	.L47
.LBB6:
	.loc 1 195 0 is_stmt 1
	sub	r2, r7, #0
	cmp	r2, r6
	bls	.L49
.LVL43:
	mov	r2, r6
.LVL44:
.L49:
	mov	r0, r5
.LVL45:
	mov	r1, r4
	bl	memcpy
.LVL46:
	.loc 1 196 0
	mov	r0, r4
	bl	free
.LVL47:
.L47:
.LBE6:
	.loc 1 200 0
	mov	r0, r5
	@ sp needed
.LVL48:
.LVL49:
.LVL50:
.LVL51:
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI3-.LFB4
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 4 "../../../../include/caribou/lib/heap.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3fb
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x1
	.4byte	.LASF36
	.4byte	.LASF37
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF4
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
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x16
	.4byte	0x5e
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x8
	.byte	0x1
	.byte	0x11
	.4byte	0xba
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x13
	.4byte	0xba
	.byte	0
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x14
	.4byte	0x8a
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x95
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x1
	.byte	0x15
	.4byte	0x95
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfd
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1f
	.4byte	0x73
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1f
	.4byte	0x73
	.4byte	.LLST0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2b
	.4byte	0x73
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x156
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x2b
	.4byte	0x8a
	.4byte	.LLST1
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2b
	.4byte	0x8a
	.4byte	.LLST2
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x73
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xe
	.4byte	.LVL4
	.4byte	0x3a9
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x7
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x1e
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x35
	.4byte	0x73
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x23e
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0x35
	.4byte	0x8a
	.4byte	.LLST3
	.uleb128 0x10
	.ascii	"p\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x23e
	.4byte	.LLST4
	.uleb128 0x10
	.ascii	"q\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x23e
	.4byte	.LLST5
	.uleb128 0x11
	.4byte	.LASF21
	.byte	0x1
	.byte	0x39
	.4byte	0x23e
	.4byte	.LLST6
	.uleb128 0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3a
	.4byte	0x53
	.4byte	.LLST7
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x4c
	.4byte	.LLST8
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x1
	.byte	0x3c
	.4byte	0x4c
	.4byte	0x1d6
	.uleb128 0x13
	.byte	0
	.uleb128 0x14
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x1f1
	.uleb128 0x15
	.4byte	.LASF23
	.byte	0x1
	.byte	0x51
	.4byte	0x4c
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.4byte	0x20c
	.uleb128 0x15
	.4byte	.LASF23
	.byte	0x1
	.byte	0x51
	.4byte	0x4c
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x234
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x51
	.4byte	0x4c
	.4byte	0x22a
	.uleb128 0x13
	.byte	0
	.uleb128 0x16
	.4byte	.LVL18
	.4byte	0x3be
	.byte	0
	.uleb128 0x16
	.4byte	.LVL6
	.4byte	0x3cf
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xc0
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x1
	.byte	0x72
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2ec
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0x72
	.4byte	0x73
	.4byte	.LLST9
	.uleb128 0x17
	.ascii	"p\000"
	.byte	0x1
	.byte	0x74
	.4byte	0x23e
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x74
	.4byte	0x23e
	.4byte	.LLST10
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x1
	.byte	0x74
	.4byte	0x23e
	.4byte	.LLST11
	.uleb128 0x11
	.4byte	.LASF14
	.byte	0x1
	.byte	0x75
	.4byte	0x5e
	.4byte	.LLST12
	.uleb128 0x18
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x10
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x79
	.4byte	0x4c
	.4byte	.LLST13
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x1
	.byte	0x3c
	.4byte	0x4c
	.4byte	0x2c7
	.uleb128 0x13
	.byte	0
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x51
	.4byte	0x4c
	.4byte	0x2d8
	.uleb128 0x13
	.byte	0
	.uleb128 0x16
	.4byte	.LVL21
	.4byte	0x3cf
	.uleb128 0x16
	.4byte	.LVL35
	.4byte	0x3be
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x1
	.byte	0xb8
	.4byte	0x73
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x398
	.uleb128 0x19
	.ascii	"p\000"
	.byte	0x1
	.byte	0xb8
	.4byte	0x73
	.4byte	.LLST14
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x1
	.byte	0xb8
	.4byte	0x8a
	.4byte	.LLST15
	.uleb128 0x10
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xba
	.4byte	0x73
	.4byte	.LLST16
	.uleb128 0x11
	.4byte	.LASF31
	.byte	0x1
	.byte	0xbb
	.4byte	0x8a
	.4byte	.LLST17
	.uleb128 0x14
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x387
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0xc3
	.4byte	0x4c
	.4byte	0x35c
	.uleb128 0x13
	.byte	0
	.uleb128 0x1a
	.4byte	.LVL46
	.4byte	0x3e0
	.4byte	0x376
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.4byte	.LVL47
	.4byte	0x3f1
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LVL41
	.4byte	0x3a9
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF33
	.byte	0x1
	.byte	0x17
	.4byte	0x23e
	.uleb128 0x5
	.byte	0x3
	.4byte	heap
	.uleb128 0x1c
	.4byte	.LASF39
	.byte	0x4
	.byte	0x1d
	.4byte	0x73
	.4byte	0x3be
	.uleb128 0x1d
	.4byte	0x8a
	.byte	0
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x51
	.4byte	0x4c
	.4byte	0x3cf
	.uleb128 0x13
	.byte	0
	.uleb128 0x12
	.4byte	.LASF24
	.byte	0x1
	.byte	0x3c
	.4byte	0x4c
	.4byte	0x3e0
	.uleb128 0x13
	.byte	0
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0xc3
	.4byte	0x4c
	.4byte	0x3f1
	.uleb128 0x13
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF34
	.byte	0x4
	.byte	0x20
	.uleb128 0x1d
	.4byte	0x73
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.byte	0x51
	.4byte	.LVL1
	.4byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL4-1
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL5
	.4byte	.LVL6-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-1
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL7
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL18-1
	.4byte	.LFE2
	.2byte	0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x23
	.uleb128 0x13
	.byte	0x9
	.byte	0xf0
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL8
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x6
	.byte	0x74
	.sleb128 0
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL14
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL11
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL6
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL20
	.4byte	.LVL21-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL21-1
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL22
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x5
	.byte	0x3
	.4byte	heap
	.4byte	.LVL25
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x34
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL26
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x51
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL25
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL27
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL23
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x2
	.byte	0x73
	.sleb128 4
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL21
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL48
	.4byte	.LFE4
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL39
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL41-1
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL50
	.4byte	.LFE4
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL39
	.4byte	.LVL42
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL49
	.4byte	.LFE4
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL37
	.4byte	.LVL43
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL44
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
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
.LASF16:
	.ascii	"heap_base\000"
.LASF27:
	.ascii	"addr\000"
.LASF15:
	.ascii	"heap_t\000"
.LASF28:
	.ascii	"rover\000"
.LASF2:
	.ascii	"short int\000"
.LASF12:
	.ascii	"size_t\000"
.LASF39:
	.ascii	"malloc\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF21:
	.ascii	"best\000"
.LASF32:
	.ascii	"memcpy\000"
.LASF37:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF33:
	.ascii	"heap\000"
.LASF34:
	.ascii	"free\000"
.LASF24:
	.ascii	"chip_interrupts_disable\000"
.LASF7:
	.ascii	"long long int\000"
.LASF38:
	.ascii	"heap_tag\000"
.LASF9:
	.ascii	"long int\000"
.LASF19:
	.ascii	"nova_heap_calloc\000"
.LASF31:
	.ascii	"curr_size\000"
.LASF30:
	.ascii	"nova_heap_realloc\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"heap_end\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF20:
	.ascii	"nova_heap_malloc\000"
.LASF25:
	.ascii	"nova_heap_init\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF10:
	.ascii	"char\000"
.LASF18:
	.ascii	"nmemb\000"
.LASF35:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF26:
	.ascii	"nova_heap_free\000"
.LASF14:
	.ascii	"size\000"
.LASF23:
	.ascii	"chip_interrupts_set\000"
.LASF36:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../."
	.ascii	"./src/lib/nova_heap.c\000"
.LASF22:
	.ascii	"best_size\000"
.LASF29:
	.ascii	"prev\000"
.LASF13:
	.ascii	"next\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
