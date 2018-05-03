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
	.file	"nova_heap.c"
	.text
.Ltext0:
	.section	.bss.heap,"aw",%nobits
	.align	2
	.type	heap, %object
	.size	heap, 4
heap:
	.space	4
	.section	.text.nova_heap_init,"ax",%progbits
	.align	2
	.global	nova_heap_init
	.code	16
	.thumb_func
	.type	nova_heap_init, %function
nova_heap_init:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/nova_heap.c"
	.loc 1 32 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 33 0
	ldr	r3, .L2
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 34 0
	ldr	r3, .L2
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 35 0
	ldr	r3, .L2
	ldr	r3, [r3]
	ldr	r1, [r7]
	ldr	r2, [r7, #4]
	subs	r2, r1, r2
	str	r2, [r3, #4]
	.loc 1 36 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	heap
.LFE32:
	.size	nova_heap_init, .-nova_heap_init
	.section	.text.nova_heap_calloc,"ax",%progbits
	.align	2
	.global	nova_heap_calloc
	.code	16
	.thumb_func
	.type	nova_heap_calloc, %function
nova_heap_calloc:
.LFB33:
	.loc 1 44 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 45 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	muls	r3, r2
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 46 0
	ldr	r3, [r7, #12]
	.loc 1 47 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	nova_heap_calloc, .-nova_heap_calloc
	.section	.text.nova_heap_malloc,"ax",%progbits
	.align	2
	.global	nova_heap_malloc
	.code	16
	.thumb_func
	.type	nova_heap_malloc, %function
nova_heap_malloc:
.LFB34:
	.loc 1 54 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #32
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 60 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 62 0
	ldr	r3, [r7, #4]
	adds	r3, r3, #19
	movs	r2, #15
	bics	r3, r2
	str	r3, [r7, #4]
	.loc 1 63 0
	ldr	r3, .L15
	ldr	r3, [r3]
	str	r3, [r7, #28]
	.loc 1 64 0
	movs	r3, #0
	str	r3, [r7, #24]
	.loc 1 65 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #16]
	.loc 1 66 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 68 0
	b	.L7
.L13:
	.loc 1 70 0
	ldr	r3, [r7, #28]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L8
	.loc 1 72 0
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L9
	.loc 1 74 0
	ldr	r3, [r7, #28]
	ldr	r2, [r3]
	ldr	r3, [r7, #24]
	str	r2, [r3]
	b	.L10
.L9:
	.loc 1 78 0
	ldr	r3, [r7, #28]
	ldr	r2, [r3]
	ldr	r3, .L15
	str	r2, [r3]
.L10:
	.loc 1 80 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 81 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 82 0
	ldr	r3, [r7, #28]
	adds	r3, r3, #4
	b	.L11
.L8:
	.loc 1 85 0
	ldr	r3, [r7, #28]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bls	.L12
	.loc 1 85 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #28]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bcs	.L12
	.loc 1 87 0 is_stmt 1
	ldr	r3, [r7, #28]
	str	r3, [r7, #20]
	.loc 1 88 0
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #4]
	str	r3, [r7, #16]
.L12:
	.loc 1 91 0
	ldr	r3, [r7, #28]
	str	r3, [r7, #24]
	.loc 1 92 0
	ldr	r3, [r7, #28]
	ldr	r3, [r3]
	str	r3, [r7, #28]
.L7:
	.loc 1 68 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bne	.L13
	.loc 1 94 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	beq	.L14
	.loc 1 96 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	subs	r2, r2, r3
	ldr	r3, [r7, #20]
	str	r2, [r3, #4]
	.loc 1 97 0
	ldr	r2, [r7, #16]
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	ldr	r2, [r7, #20]
	adds	r3, r2, r3
	str	r3, [r7, #28]
	.loc 1 98 0
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 99 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 100 0
	ldr	r3, [r7, #28]
	adds	r3, r3, #4
	b	.L11
.L14:
	.loc 1 104 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 105 0
	movs	r3, #0
.L11:
	.loc 1 107 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L16:
	.align	2
.L15:
	.word	heap
.LFE34:
	.size	nova_heap_malloc, .-nova_heap_malloc
	.section	.text.nova_heap_free,"ax",%progbits
	.align	2
	.global	nova_heap_free
	.code	16
	.thumb_func
	.type	nova_heap_free, %function
nova_heap_free:
.LFB35:
	.loc 1 115 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #32
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 119 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.LCB250
	b	.L27	@long jump
.LCB250:
.LBB2:
	.loc 1 121 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 123 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	str	r3, [r7, #4]
	.loc 1 125 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #16]
	.loc 1 126 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L19
	.loc 1 129 0
	ldr	r3, .L28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L20
	.loc 1 132 0
	ldr	r3, .L28
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 133 0
	ldr	r3, .L28
	ldr	r3, [r3]
	movs	r2, #0
	str	r2, [r3]
	.loc 1 134 0
	ldr	r3, .L28
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	b	.L19
.L20:
	.loc 1 139 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #12]
	ldr	r3, .L28
	ldr	r3, [r3]
	str	r3, [r7, #28]
	movs	r3, #0
	str	r3, [r7, #24]
	.loc 1 140 0
	b	.L21
.L23:
	.loc 1 142 0
	ldr	r3, [r7, #28]
	str	r3, [r7, #24]
	ldr	r3, [r7, #28]
	ldr	r3, [r3]
	str	r3, [r7, #28]
.L21:
	.loc 1 140 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L22
	.loc 1 140 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #28]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L23
.L22:
	.loc 1 153 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #28]
	str	r2, [r3]
	.loc 1 154 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #16]
	str	r2, [r3, #4]
	.loc 1 155 0
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L24
	.loc 1 156 0
	ldr	r3, [r7, #24]
	ldr	r2, [r7, #12]
	str	r2, [r3]
	b	.L25
.L24:
	.loc 1 158 0
	ldr	r3, .L28
	ldr	r2, [r7, #12]
	str	r2, [r3]
.L25:
	.loc 1 160 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L26
	.loc 1 160 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #16]
	adds	r2, r2, r3
	ldr	r3, [r7, #28]
	cmp	r2, r3
	bne	.L26
	.loc 1 162 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #4]
	adds	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #4]
	.loc 1 163 0
	ldr	r3, [r7, #28]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	str	r2, [r3]
.L26:
	.loc 1 166 0
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L19
	.loc 1 166 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #24]
	adds	r2, r2, r3
	ldr	r3, [r7, #12]
	cmp	r2, r3
	bne	.L19
	.loc 1 168 0 is_stmt 1
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #4]
	adds	r2, r2, r3
	ldr	r3, [r7, #24]
	str	r2, [r3, #4]
	.loc 1 169 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #24]
	str	r2, [r3]
.L19:
	.loc 1 173 0
	ldr	r3, [r7, #20]
	movs	r0, r3
	bl	chip_interrupts_set
.L27:
.LBE2:
	.loc 1 175 0
	nop
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L29:
	.align	2
.L28:
	.word	heap
.LFE35:
	.size	nova_heap_free, .-nova_heap_free
	.section	.text.nova_heap_realloc,"ax",%progbits
	.align	2
	.global	nova_heap_realloc
	.code	16
	.thumb_func
	.type	nova_heap_realloc, %function
nova_heap_realloc:
.LFB36:
	.loc 1 185 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 186 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 187 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L31
	.loc 1 187 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	subs	r3, r3, #4
	ldr	r3, [r3]
	b	.L32
.L31:
	.loc 1 187 0 discriminator 2
	movs	r3, #0
.L32:
	.loc 1 187 0 discriminator 4
	str	r3, [r7, #8]
	.loc 1 188 0 is_stmt 1 discriminator 4
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	beq	.L33
	.loc 1 192 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 193 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L33
	.loc 1 193 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L33
.LBB3:
	.loc 1 195 0 is_stmt 1
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r3, r2
	bls	.L34
	movs	r3, r2
.L34:
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #12]
	movs	r2, r3
	bl	memcpy
	.loc 1 196 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
.L33:
.LBE3:
	.loc 1 199 0
	ldr	r3, [r7, #12]
	.loc 1 200 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	nova_heap_realloc, .-nova_heap_realloc
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
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x18
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI6-.LFB34
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
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI9-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI12-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x296
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0xc
	.4byte	.LASF32
	.4byte	.LASF33
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
	.4byte	.LASF34
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
	.4byte	.LASF23
	.byte	0x1
	.byte	0x1f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfd
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x1f
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1f
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2b
	.4byte	0x73
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x140
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x2b
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2b
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x2d
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x35
	.4byte	0x73
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1aa
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0x35
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.ascii	"p\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.ascii	"q\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x39
	.4byte	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x3a
	.4byte	0x53
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xc0
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x72
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x222
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0x72
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xc
	.ascii	"p\000"
	.byte	0x1
	.byte	0x74
	.4byte	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0x74
	.4byte	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x1
	.byte	0x74
	.4byte	0x1aa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x75
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0xc
	.ascii	"lvl\000"
	.byte	0x1
	.byte	0x79
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x1
	.byte	0xb8
	.4byte	0x73
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x288
	.uleb128 0x10
	.ascii	"p\000"
	.byte	0x1
	.byte	0xb8
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x1
	.byte	0xb8
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xba
	.4byte	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x1
	.byte	0xbb
	.4byte	0x8a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xf
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x1
	.byte	0xc3
	.4byte	0x4c
	.uleb128 0x12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x1
	.byte	0x17
	.4byte	0x1aa
	.uleb128 0x5
	.byte	0x3
	.4byte	heap
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
	.uleb128 0xc
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x88
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x29a
	.4byte	0xcb
	.ascii	"nova_heap_init\000"
	.4byte	0xfd
	.ascii	"nova_heap_calloc\000"
	.4byte	0x140
	.ascii	"nova_heap_malloc\000"
	.4byte	0x1b0
	.ascii	"nova_heap_free\000"
	.4byte	0x222
	.ascii	"nova_heap_realloc\000"
	.4byte	0x279
	.ascii	"memcpy\000"
	.4byte	0x288
	.ascii	"heap\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xfa
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x29a
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
	.4byte	0x5e
	.ascii	"unsigned int\000"
	.4byte	0x53
	.ascii	"uint32_t\000"
	.4byte	0x65
	.ascii	"long long int\000"
	.4byte	0x6c
	.ascii	"long long unsigned int\000"
	.4byte	0x75
	.ascii	"long int\000"
	.4byte	0x7c
	.ascii	"char\000"
	.4byte	0x83
	.ascii	"sizetype\000"
	.4byte	0x8a
	.ascii	"size_t\000"
	.4byte	0x95
	.ascii	"heap_tag\000"
	.4byte	0xc0
	.ascii	"heap_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF24:
	.ascii	"nova_heap_free\000"
.LASF12:
	.ascii	"size_t\000"
.LASF13:
	.ascii	"next\000"
.LASF34:
	.ascii	"heap_tag\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF4:
	.ascii	"uint8_t\000"
.LASF28:
	.ascii	"nova_heap_realloc\000"
.LASF26:
	.ascii	"rover\000"
.LASF29:
	.ascii	"curr_size\000"
.LASF14:
	.ascii	"size\000"
.LASF25:
	.ascii	"addr\000"
.LASF32:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/nova_heap.c\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF33:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF19:
	.ascii	"nova_heap_calloc\000"
.LASF16:
	.ascii	"heap_base\000"
.LASF23:
	.ascii	"nova_heap_init\000"
.LASF31:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"best_size\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF30:
	.ascii	"heap\000"
.LASF15:
	.ascii	"heap_t\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"long long int\000"
.LASF17:
	.ascii	"heap_end\000"
.LASF10:
	.ascii	"char\000"
.LASF35:
	.ascii	"memcpy\000"
.LASF2:
	.ascii	"short int\000"
.LASF18:
	.ascii	"nmemb\000"
.LASF21:
	.ascii	"best\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF9:
	.ascii	"long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF20:
	.ascii	"nova_heap_malloc\000"
.LASF27:
	.ascii	"prev\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
