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
	.file	"bitmap_heap.c"
	.text
.Ltext0:
	.section	.text.get_bitmap_bit,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	get_bitmap_bit, %function
get_bitmap_bit:
.LFB10:
	push	{r4, lr}
.LCFI0:
	cmp	r1, #0
	blt	.L3
	mov	r4, #16
	ldrsh	r3, [r0, r4]
	mov	r0, #0
	cmp	r3, r1
	ble	.L2
	asr	r3, r1, #31
	lsr	r3, r3, #27
	add	r1, r3, r1
	asr	r4, r1, #5
	lsl	r4, r4, #2
	mov	r0, #31
	and	r1, r0
	sub	r3, r1, r3
	sxth	r3, r3
	mov	r0, #1
	lsl	r0, r0, r3
	ldr	r3, [r4, r2]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	b	.L2
.L3:
	mov	r0, #0
.L2:
	@ sp needed
	pop	{r4, pc}
.LFE10:
	.size	get_bitmap_bit, .-get_bitmap_bit
	.section	.text.set_bitmap_bit,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	set_bitmap_bit, %function
set_bitmap_bit:
.LFB11:
	push	{r4, lr}
.LCFI1:
	cmp	r1, #0
	blt	.L5
	mov	r4, #16
	ldrsh	r0, [r0, r4]
	cmp	r0, r1
	ble	.L5
.LBB2:
	asr	r0, r1, #31
	lsr	r0, r0, #27
	add	r1, r1, r0
	mov	r4, #31
	and	r4, r1
	sub	r0, r4, r0
	uxth	r0, r0
	asr	r1, r1, #5
	uxth	r1, r1
	cmp	r3, #0
	beq	.L7
	sxth	r1, r1
	lsl	r1, r1, #2
	add	r2, r2, r1
	sxth	r0, r0
	mov	r3, #1
	lsl	r3, r3, r0
	mov	r0, r3
	ldr	r3, [r2]
	orr	r0, r3
	str	r0, [r2]
	b	.L5
.L7:
	sxth	r1, r1
	lsl	r1, r1, #2
	add	r2, r2, r1
	sxth	r0, r0
	mov	r3, #1
	lsl	r3, r3, r0
	mov	r0, r3
	ldr	r3, [r2]
	bic	r3, r0
	str	r3, [r2]
.L5:
.LBE2:
	@ sp needed
	pop	{r4, pc}
.LFE11:
	.size	set_bitmap_bit, .-set_bitmap_bit
	.section	.text.locate_free,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	locate_free, %function
locate_free:
.LFB13:
	push	{r4, r5, r6, r7, lr}
.LCFI2:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI3:
	sub	sp, sp, #20
.LCFI4:
	mov	r7, r0
	ldrh	r3, [r0, #16]
	sxth	r2, r3
	cmp	r2, #0
	ble	.L15
	ldr	r6, [r0]
	mov	r2, #0
	str	r2, [sp, #8]
	uxth	r1, r1
	mov	fp, r1
	add	r1, r1, #32
	str	r1, [sp, #12]
.LBB5:
.LBB6:
	sxth	r1, r3
	mov	r10, r1
.L13:
.LBE6:
.LBE5:
	ldr	r2, [sp, #8]
	sxth	r3, r2
	asr	r2, r3, #31
	lsr	r2, r2, #27
	add	r3, r2, r3
	asr	r3, r3, #5
	lsl	r3, r3, #2
	ldr	r3, [r3, r6]
	add	r3, r3, #1
	beq	.L10
	ldr	r1, [sp, #8]
	uxth	r3, r1
	mov	r1, fp
	add	r2, r1, r3
	ldr	r1, [sp, #12]
	add	r3, r3, r1
	uxth	r3, r3
	str	r3, [sp, #4]
	uxth	r2, r2
	mov	r8, r2
.L14:
.LBB9:
.LBB7:
	mov	r2, r8
	uxth	r5, r2
	sxth	r3, r5
	cmp	r3, r10
	bge	.L11
	mov	r1, r8
	mov	r2, fp
	sub	r3, r1, r2
	uxth	r3, r3
	mov	r9, r3
	sxth	r3, r5
	mov	r1, r9
	sxth	r2, r1
	cmp	r3, r2
	ble	.L16
.LBE7:
.LBE9:
	mov	r4, r9
.LBB10:
.LBB8:
	mov	r5, r3
.L12:
	sxth	r1, r4
	mov	r0, r7
	mov	r2, r6
	bl	get_bitmap_bit
	cmp	r0, #0
	bne	.L11
	add	r4, r4, #1
	uxth	r4, r4
	sxth	r3, r4
	cmp	r5, r3
	bgt	.L12
	b	.L17
.L10:
	ldr	r3, [sp, #8]
	add	r3, r3, #32
	uxth	r3, r3
	str	r3, [sp, #8]
.LBE8:
.LBE10:
	sxth	r3, r3
	cmp	r10, r3
	bgt	.L13
	b	.L18
.L15:
	ldr	r0, .L21
	b	.L9
.L16:
	mov	r0, r9
	b	.L9
.L17:
	mov	r0, r9
	b	.L9
.L18:
	ldr	r0, .L21
.L9:
	sxth	r0, r0
	b	.L19
.L11:
	mov	r3, r8
	add	r3, r3, #1
	uxth	r3, r3
	mov	r8, r3
	ldr	r2, [sp, #4]
	cmp	r2, r3
	bne	.L14
	b	.L10
.L19:
	add	sp, sp, #20
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L22:
	.align	2
.L21:
	.word	65535
.LFE13:
	.size	locate_free, .-locate_free
	.section	.text.blocks_used,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	blocks_used, %function
blocks_used:
.LFB14:
	push	{r4, r5, r6, r7, lr}
.LCFI5:
	mov	r7, r8
	push	{r7}
.LCFI6:
	mov	r5, r0
	sub	r6, r1, #0
	blt	.L26
	ldrh	r7, [r0, #16]
	sxth	r3, r7
	mov	r4, #0
	cmp	r1, r3
	bge	.L24
	mov	r7, r3
	sub	r3, r1, #1
	mov	r8, r3
.L25:
	sxth	r3, r4
	add	r3, r6, r3
	cmp	r3, r7
	bge	.L24
	add	r4, r4, #1
	uxth	r4, r4
	mov	r3, r8
	add	r1, r3, r4
	sxth	r1, r1
	mov	r0, r5
	ldr	r2, [r5, #4]
	bl	get_bitmap_bit
	cmp	r0, #0
	beq	.L25
	b	.L24
.L26:
	mov	r4, #0
.L24:
	sxth	r0, r4
	@ sp needed
	pop	{r2}
	mov	r8, r2
	pop	{r4, r5, r6, r7, pc}
.LFE14:
	.size	blocks_used, .-blocks_used
	.section	.text.from_pointer,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	from_pointer, %function
from_pointer:
.LFB15:
	cmp	r1, #0
	beq	.L30
.LBB11:
	ldr	r2, [r0, #12]
	sub	r1, r1, r2
	lsr	r1, r1, #4
	uxth	r3, r1
	lsl	r2, r1, #16
	bmi	.L31
	mov	r2, #16
	ldrsh	r1, [r0, r2]
	sxth	r2, r3
	cmp	r1, r2
	bgt	.L29
.LBE11:
	ldr	r3, .L33
	b	.L29
.L30:
	ldr	r3, .L33
	b	.L29
.L31:
	ldr	r3, .L33
.L29:
	sxth	r0, r3
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
	.word	65535
.LFE15:
	.size	from_pointer, .-from_pointer
	.section	.text.notify_heap_alloc,"ax",%progbits
	.align	2
	.weak	notify_heap_alloc
	.code	16
	.thumb_func
	.type	notify_heap_alloc, %function
notify_heap_alloc:
.LFB0:
	@ sp needed
	bx	lr
.LFE0:
	.size	notify_heap_alloc, .-notify_heap_alloc
	.section	.text.allocate,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	allocate, %function
allocate:
.LFB17:
	push	{r4, r5, r6, r7, lr}
.LCFI7:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI8:
	mov	r5, r0
	mov	r9, r1
	mov	r10, r2
	cmp	r1, #0
	blt	.L44
	mov	r2, #16
	ldrsh	r3, [r0, r2]
	cmp	r3, r9
	ble	.L45
	mov	r3, r10
	cmp	r3, #0
	ble	.L38
	mov	r2, r9
	uxth	r4, r2
	add	r3, r4, r3
	uxth	r3, r3
	mov	r8, r3
	mov	r6, #0
	mov	r7, r10
	sub	r7, r7, #1
.L42:
	cmp	r6, r7
	bne	.L39
	sxth	r1, r4
	mov	r0, r5
	ldr	r2, [r5, #4]
	mov	r3, #1
	bl	set_bitmap_bit
	b	.L40
.L39:
	sxth	r1, r4
	mov	r0, r5
	ldr	r2, [r5, #4]
	mov	r3, #0
	bl	set_bitmap_bit
.L40:
	sxth	r1, r4
	mov	r0, r5
	ldr	r2, [r5]
	mov	r3, #1
	bl	set_bitmap_bit
	add	r6, r6, #1
	add	r4, r4, #1
	uxth	r4, r4
	cmp	r4, r8
	bne	.L42
	b	.L41
.L38:
.LBB14:
.LBB15:
	mov	r2, r9
	lsl	r3, r2, #4
	ldr	r4, [r5, #12]
	add	r4, r4, r3
.L43:
.LBE15:
.LBE14:
	mov	r0, r10
	bl	notify_heap_alloc
	b	.L46
.L44:
	mov	r4, #0
	b	.L46
.L45:
	mov	r4, #0
	b	.L46
.L41:
.LBB17:
.LBB16:
	mov	r2, #16
	ldrsh	r3, [r5, r2]
	mov	r4, #0
	cmp	r3, r9
	ble	.L43
	b	.L38
.L46:
.LBE16:
.LBE17:
	mov	r0, r4
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.LFE17:
	.size	allocate, .-allocate
	.section	.text.notify_heap_dealloc,"ax",%progbits
	.align	2
	.weak	notify_heap_dealloc
	.code	16
	.thumb_func
	.type	notify_heap_dealloc, %function
notify_heap_dealloc:
.LFB1:
	@ sp needed
	bx	lr
.LFE1:
	.size	notify_heap_dealloc, .-notify_heap_dealloc
	.section	.text.deallocate,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	deallocate, %function
deallocate:
.LFB18:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI9:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI10:
	mov	r4, r0
	mov	r7, r1
	mov	r9, r2
	bmi	.L52
	mov	r2, #16
	ldrsh	r3, [r0, r2]
	mov	r0, #0
	cmp	r3, r1
	ble	.L49
	mov	r8, r9
	mov	r3, r9
	cmp	r3, #0
	ble	.L50
	mov	r5, #0
.L51:
	add	r6, r5, r7
	sxth	r6, r6
	mov	r0, r4
	mov	r1, r6
	ldr	r2, [r4]
	mov	r3, #0
	bl	set_bitmap_bit
	mov	r0, r4
	mov	r1, r6
	ldr	r2, [r4, #4]
	mov	r3, #0
	bl	set_bitmap_bit
	add	r5, r5, #1
	uxth	r5, r5
	cmp	r5, r8
	blt	.L51
.L50:
	mov	r0, r9
	bl	notify_heap_dealloc
	mov	r0, #1
	b	.L49
.L52:
	mov	r0, #0
.L49:
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r3, r4, r5, r6, r7, pc}
.LFE18:
	.size	deallocate, .-deallocate
	.section	.text.notify_heap_invalid_dealloc,"ax",%progbits
	.align	2
	.weak	notify_heap_invalid_dealloc
	.code	16
	.thumb_func
	.type	notify_heap_invalid_dealloc, %function
notify_heap_invalid_dealloc:
.LFB2:
.L55:
	b	.L55
.LFE2:
	.size	notify_heap_invalid_dealloc, .-notify_heap_invalid_dealloc
	.section	.text.notify_heap_invalid_realloc,"ax",%progbits
	.align	2
	.weak	notify_heap_invalid_realloc
	.code	16
	.thumb_func
	.type	notify_heap_invalid_realloc, %function
notify_heap_invalid_realloc:
.LFB3:
.L57:
	b	.L57
.LFE3:
	.size	notify_heap_invalid_realloc, .-notify_heap_invalid_realloc
	.section	.text.notify_heap_alloc_failed,"ax",%progbits
	.align	2
	.weak	notify_heap_alloc_failed
	.code	16
	.thumb_func
	.type	notify_heap_alloc_failed, %function
notify_heap_alloc_failed:
.LFB4:
.L59:
	b	.L59
.LFE4:
	.size	notify_heap_alloc_failed, .-notify_heap_alloc_failed
	.section	.text.bitmap_heap_init,"ax",%progbits
	.align	2
	.global	bitmap_heap_init
	.code	16
	.thumb_func
	.type	bitmap_heap_init, %function
bitmap_heap_init:
.LFB5:
	push	{r4, r5, r6, lr}
.LCFI11:
	mov	r5, r0
	mov	r6, r1
	ldr	r4, .L61
	ldr	r0, [r4]
	mov	r1, #0
	mov	r2, #20
	bl	memset
	sub	r1, r6, r5
	lsr	r2, r1, #9
	ldr	r3, [r4]
	lsl	r0, r2, #3
	sub	r1, r1, r0
	lsr	r1, r1, #4
	uxth	r1, r1
	strh	r1, [r3, #16]
	sxth	r1, r1
	asr	r0, r1, #31
	lsr	r0, r0, #27
	add	r1, r0, r1
	asr	r1, r1, #5
	lsl	r1, r1, #2
	strh	r1, [r3, #8]
	str	r5, [r3]
	ldr	r3, [r4]
	lsl	r2, r2, #2
	add	r5, r2, r5
	str	r5, [r3, #4]
	add	r5, r5, r2
	str	r5, [r3, #12]
	ldr	r0, [r3]
	ldrh	r2, [r3, #8]
	mov	r1, #0
	bl	memset
	ldr	r3, [r4]
	ldr	r0, [r3, #4]
	ldrh	r2, [r3, #8]
	mov	r1, #0
	bl	memset
	@ sp needed
	pop	{r4, r5, r6, pc}
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
.LFE5:
	.size	bitmap_heap_init, .-bitmap_heap_init
	.section	.text.bitmap_heap_block_size,"ax",%progbits
	.align	2
	.global	bitmap_heap_block_size
	.code	16
	.thumb_func
	.type	bitmap_heap_block_size, %function
bitmap_heap_block_size:
.LFB6:
	mov	r0, #16
	@ sp needed
	bx	lr
.LFE6:
	.size	bitmap_heap_block_size, .-bitmap_heap_block_size
	.section	.text.bitmap_heap_blocks_allocated,"ax",%progbits
	.align	2
	.global	bitmap_heap_blocks_allocated
	.code	16
	.thumb_func
	.type	bitmap_heap_blocks_allocated, %function
bitmap_heap_blocks_allocated:
.LFB7:
	push	{r4, r5, r6, r7, lr}
.LCFI12:
	ldr	r3, .L72
	ldr	r3, [r3]
	ldrh	r6, [r3, #16]
	sxth	r2, r6
	cmp	r2, #0
	ble	.L70
.LBB18:
	ldr	r2, [r3]
	mov	ip, r2
.LBE18:
	mov	r5, #0
	mov	r0, #0
.LBB19:
	mov	r7, #0
	mov	r4, #1
.LBE19:
	sxth	r6, r6
.L69:
.LBB20:
	sxth	r3, r5
	asr	r2, r3, #31
	lsr	r2, r2, #27
	add	r3, r2, r3
	asr	r3, r3, #5
	lsl	r3, r3, #2
	mov	r2, ip
	ldr	r1, [r3, r2]
	mov	r3, r7
	add	r2, r1, #1
	bne	.L71
	add	r0, r0, #32
	uxth	r0, r0
	b	.L67
.L71:
	mov	r2, r1
	lsr	r2, r2, r3
	and	r2, r4
	add	r0, r2, r0
	uxth	r0, r0
	add	r3, r3, #1
	cmp	r3, #32
	bne	.L71
.L67:
	add	r5, r5, #32
	uxth	r5, r5
.LBE20:
	sxth	r3, r5
	cmp	r3, r6
	blt	.L69
	b	.L65
.L70:
	mov	r0, #0
.L65:
	sxth	r0, r0
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
.LFE7:
	.size	bitmap_heap_blocks_allocated, .-bitmap_heap_blocks_allocated
	.section	.text.bitmap_heap_bytes_used,"ax",%progbits
	.align	2
	.global	bitmap_heap_bytes_used
	.code	16
	.thumb_func
	.type	bitmap_heap_bytes_used, %function
bitmap_heap_bytes_used:
.LFB8:
	push	{r3, lr}
.LCFI13:
	bl	heap_blocks_allocated
	lsl	r0, r0, #4
	@ sp needed
	pop	{r3, pc}
.LFE8:
	.size	bitmap_heap_bytes_used, .-bitmap_heap_bytes_used
	.section	.text.bitmap_heap_bytes_free,"ax",%progbits
	.align	2
	.global	bitmap_heap_bytes_free
	.code	16
	.thumb_func
	.type	bitmap_heap_bytes_free, %function
bitmap_heap_bytes_free:
.LFB9:
	push	{r4, lr}
.LCFI14:
	ldr	r3, .L76
	ldr	r3, [r3]
	mov	r2, #16
	ldrsh	r4, [r3, r2]
	bl	heap_blocks_allocated
	sub	r0, r4, r0
	lsl	r0, r0, #4
	@ sp needed
	pop	{r4, pc}
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
.LFE9:
	.size	bitmap_heap_bytes_free, .-bitmap_heap_bytes_free
	.section	.text.bitmap_heap_sizeof,"ax",%progbits
	.align	2
	.global	bitmap_heap_sizeof
	.code	16
	.thumb_func
	.type	bitmap_heap_sizeof, %function
bitmap_heap_sizeof:
.LFB21:
	push	{r3, r4, r5, lr}
.LCFI15:
	sub	r4, r0, #0
	beq	.L80
.LBB21:
	bl	chip_interrupts_disable
	ldr	r3, .L82
	ldr	r5, [r3]
	mov	r0, r5
	mov	r1, r4
	bl	from_pointer
	sub	r1, r0, #0
	blt	.L81
	mov	r0, r5
	bl	blocks_used
	lsl	r0, r0, #4
	b	.L79
.L80:
.LBE21:
	mov	r0, #0
	b	.L79
.L81:
	mov	r0, #0
.L79:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L83:
	.align	2
.L82:
	.word	.LANCHOR0
.LFE21:
	.size	bitmap_heap_sizeof, .-bitmap_heap_sizeof
	.section	.text.bitmap_heap_malloc,"ax",%progbits
	.align	2
	.global	bitmap_heap_malloc
	.code	16
	.thumb_func
	.type	bitmap_heap_malloc, %function
bitmap_heap_malloc:
.LFB22:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI16:
	sub	r4, r0, #0
	beq	.L88
.LBB22:
	mov	r6, #15
	and	r6, r0
	sub	r3, r6, #1
	sbc	r6, r6, r3
	lsr	r3, r0, #4
	add	r6, r6, r3
	uxth	r6, r6
	bl	chip_interrupts_disable
	mov	r7, r0
	ldr	r3, .L89
	ldr	r5, [r3]
	sxth	r1, r6
	mov	r0, r5
	bl	locate_free
	sub	r1, r0, #0
	blt	.L86
	sxth	r2, r6
	mov	r0, r5
	bl	allocate
	mov	r4, r0
	b	.L87
.L86:
	mov	r0, r4
	bl	notify_heap_alloc_failed
	mov	r4, #0
.L87:
	mov	r0, r7
	bl	chip_interrupts_set
	b	.L85
.L88:
.LBE22:
	mov	r4, #0
.L85:
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
.LFE22:
	.size	bitmap_heap_malloc, .-bitmap_heap_malloc
	.section	.text.bitmap_heap_calloc,"ax",%progbits
	.align	2
	.global	bitmap_heap_calloc
	.code	16
	.thumb_func
	.type	bitmap_heap_calloc, %function
bitmap_heap_calloc:
.LFB24:
	push	{r3, r4, r5, lr}
.LCFI17:
	mov	r5, r1
	mul	r5, r0
	mov	r0, r5
	bl	bitmap_heap_malloc
	sub	r4, r0, #0
	beq	.L92
	mov	r1, #0
	mov	r2, r5
	bl	memset
.L92:
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE24:
	.size	bitmap_heap_calloc, .-bitmap_heap_calloc
	.section	.text.bitmap_heap_free,"ax",%progbits
	.align	2
	.global	bitmap_heap_free
	.code	16
	.thumb_func
	.type	bitmap_heap_free, %function
bitmap_heap_free:
.LFB25:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI18:
	mov	r6, r0
	bl	chip_interrupts_disable
	mov	r7, r0
	ldr	r3, .L96
	ldr	r5, [r3]
	mov	r0, r5
	mov	r1, r6
	bl	from_pointer
	sub	r4, r0, #0
	beq	.L94
	mov	r0, r5
	mov	r1, r4
	bl	blocks_used
	mov	r2, r0
	mov	r0, r5
	mov	r1, r4
	bl	deallocate
	b	.L95
.L94:
	mov	r0, r6
	bl	notify_heap_invalid_dealloc
.L95:
	mov	r0, r7
	bl	chip_interrupts_set
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L97:
	.align	2
.L96:
	.word	.LANCHOR0
.LFE25:
	.size	bitmap_heap_free, .-bitmap_heap_free
	.section	.text.bitmap_heap_realloc,"ax",%progbits
	.align	2
	.global	bitmap_heap_realloc
	.code	16
	.thumb_func
	.type	bitmap_heap_realloc, %function
bitmap_heap_realloc:
.LFB23:
	push	{r4, r5, r6, r7, lr}
.LCFI19:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI20:
	sub	sp, sp, #28
.LCFI21:
	mov	r4, r0
	mov	r6, r1
	cmp	r0, #0
	bne	.LCB1114
	b	.L99	@long jump
.LCB1114:
	cmp	r1, #0
	bne	.LCB1116
	b	.L100	@long jump
.LCB1116:
.LBB31:
	bl	chip_interrupts_disable
	mov	r10, r0
	ldr	r3, .L118
	ldr	r5, [r3]
	mov	r0, r5
	mov	r1, r4
	bl	from_pointer
	sub	r7, r0, #0
	blt	.L101
	mov	r3, #15
	and	r3, r6
	sub	r2, r3, #1
	sbc	r3, r3, r2
	lsr	r2, r6, #4
	add	r3, r3, r2
	uxth	r3, r3
	str	r3, [sp, #4]
	uxth	r3, r3
	mov	r9, r3
	mov	r0, r5
	mov	r1, r7
	bl	blocks_used
	mov	fp, r0
	mov	r1, r9
	sxth	r2, r1
	cmp	r2, r0
	ble	.L102
.LBB32:
.LBB33:
.LBB34:
	mov	r2, #16
	ldrsh	r3, [r5, r2]
	cmp	r3, r7
	bgt	.LCB1150
	b	.L103	@long jump
.LCB1150:
.LBE34:
.LBE33:
.LBE32:
	uxth	r2, r0
	ldr	r1, [sp, #4]
	sub	r3, r1, r2
	uxth	r3, r3
.LBB39:
.LBB36:
.LBB35:
	sxth	r1, r3
	cmp	r1, #0
	ble	.L104
	ldr	r1, [r5]
	str	r1, [sp, #12]
	add	r2, r2, r7
	uxth	r2, r2
	mov	r8, r2
	add	r3, r3, r8
	uxth	r3, r3
	str	r3, [sp, #8]
	mov	r3, r9
	str	r3, [sp, #16]
	str	r6, [sp, #20]
	mov	r6, r8
	mov	r8, r4
	mov	r4, r1
	mov	r9, r7
	ldr	r7, [sp, #8]
.L105:
	sxth	r1, r6
	mov	r0, r5
	mov	r2, r4
	bl	get_bitmap_bit
	cmp	r0, #0
	bne	.L117
	add	r6, r6, #1
	uxth	r6, r6
	cmp	r6, r7
	bne	.L105
	mov	r4, r8
	mov	r7, r9
	b	.L104
.L112:
.LBE35:
.LBE36:
.LBB37:
	cmp	r4, r3
	bne	.L106
	sxth	r1, r6
	mov	r0, r5
	ldr	r2, [r5, #4]
	mov	r3, #1
	bl	set_bitmap_bit
	b	.L107
.L106:
	sxth	r1, r6
	mov	r0, r5
	ldr	r2, [r5, #4]
	mov	r3, #0
	bl	set_bitmap_bit
.L107:
	sxth	r1, r6
	mov	r0, r5
	ldr	r2, [r5]
	mov	r3, #1
	bl	set_bitmap_bit
	mov	r1, r8
	add	r3, r6, r1
	sxth	r3, r3
	add	r6, r6, #1
	uxth	r6, r6
	cmp	r3, r7
	blt	.L112
	mov	r4, r9
	b	.L110
.L113:
.LBE37:
.LBE39:
.LBB40:
.LBB41:
	mov	r3, r9
	sxth	r2, r3
	mov	r0, r5
	bl	allocate
	mov	r5, r0
	mov	r1, fp
	lsl	r2, r1, #4
	mov	r1, r4
	bl	memmove
	mov	r4, r5
.LBE41:
	b	.L110
.L116:
	mov	r0, r4
	mov	r1, r6
	bl	notify_heap_invalid_realloc
	mov	r4, #0
	b	.L110
.L102:
.LBE40:
	mov	r1, r9
	sxth	r2, r1
	cmp	r2, r0
	bge	.L110
	mov	r0, r5
	mov	r1, r7
	mov	r2, fp
	bl	deallocate
	ldr	r3, .L118
	ldr	r0, [r3]
	mov	r3, r9
	sxth	r2, r3
	mov	r1, r7
	bl	allocate
	b	.L110
.L101:
	mov	r0, r4
	mov	r1, r6
	bl	notify_heap_invalid_realloc
	mov	r4, #0
.L110:
	mov	r0, r10
	bl	chip_interrupts_set
.LBE31:
	b	.L115
.L100:
	bl	bitmap_heap_free
	mov	r4, #0
	b	.L115
.L99:
	mov	r0, r1
	bl	bitmap_heap_malloc
	mov	r4, r0
	b	.L115
.L104:
.LBB44:
.LBB42:
.LBB38:
	ldr	r1, [sp, #4]
	mov	r8, r1
	cmp	r1, #0
	ble	.L110
	uxth	r7, r7
	mov	r6, r7
	mov	r3, #0
	mov	r1, #1
	neg	r1, r1
	mov	r9, r1
	add	r9, r9, r8
	mov	r2, #1
	sub	r7, r2, r7
	mov	r2, r9
	mov	r9, r4
	mov	r1, r7
	mov	r7, r8
	mov	r8, r1
	mov	r4, r2
	b	.L112
.L117:
	mov	r4, r8
	ldr	r6, [sp, #20]
	mov	r7, r9
	ldr	r2, [sp, #16]
	mov	r9, r2
.L103:
.LBE38:
.LBE42:
.LBB43:
	mov	r0, r5
	mov	r1, r7
	mov	r2, fp
	bl	deallocate
	ldr	r3, .L118
	ldr	r5, [r3]
	mov	r3, r9
	sxth	r1, r3
	mov	r0, r5
	bl	locate_free
	sub	r1, r0, #0
	bge	.L113
	b	.L116
.L115:
.LBE43:
.LBE44:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L119:
	.align	2
.L118:
	.word	.LANCHOR0
.LFE23:
	.size	bitmap_heap_realloc, .-bitmap_heap_realloc
	.global	heap_state
	.global	static_heap_state
	.section	.bss.static_heap_state,"aw",%nobits
	.align	2
	.type	static_heap_state, %object
	.size	static_heap_state, 20
static_heap_state:
	.space	20
	.section	.data.heap_state,"aw",%progbits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	heap_state, %object
	.size	heap_state, 4
heap_state:
	.word	static_heap_state
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
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI0-.LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI1-.LFB11
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI2-.LFB13
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
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x38
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI5-.LFB14
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
	.4byte	.LCFI6-.LCFI5
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
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x4
	.4byte	.LCFI7-.LFB17
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
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI9-.LFB18
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
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI11-.LFB5
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
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI12-.LFB7
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
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI13-.LFB8
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI14-.LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x4
	.4byte	.LCFI15-.LFB21
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x4
	.4byte	.LCFI16-.LFB22
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
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x4
	.4byte	.LCFI17-.LFB24
	.byte	0xe
	.uleb128 0x10
	.byte	0x83
	.uleb128 0x4
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x4
	.4byte	.LCFI18-.LFB25
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
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x4
	.4byte	.LCFI19-.LFB23
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
	.4byte	.LCFI20-.LCFI19
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
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x40
	.align	2
.LEFDE42:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/bitmap_heap.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1ea
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0xcb
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xdb
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.byte	0xee
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x105
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x124
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x134
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF8
	.byte	0x1
	.byte	0x2d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x14a
	.byte	0x1
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x15b
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF9
	.byte	0x1
	.byte	0x37
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x17d
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x41
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x4c
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x1
	.byte	0x57
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x72
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x1
	.byte	0x94
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0x9c
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0xb7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14f
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb9
	.byte	0
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0xbf
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16c
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb9
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x1
	.2byte	0x1c6
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.2byte	0x1db
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x23b
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x249
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c9
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x1cd
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x1ef
	.byte	0
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x1af
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x195
	.byte	0x1
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x1fb
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
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
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x5
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x5
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
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xc4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	.LFB8
	.4byte	.LFE8
	.4byte	.LFB9
	.4byte	.LFE9
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF16:
	.ascii	"bitmap_heap_blocks_allocated\000"
.LASF27:
	.ascii	"can_extend\000"
.LASF17:
	.ascii	"bitmap_heap_bytes_used\000"
.LASF10:
	.ascii	"deallocate\000"
.LASF21:
	.ascii	"bitmap_heap_malloc\000"
.LASF11:
	.ascii	"notify_heap_invalid_dealloc\000"
.LASF22:
	.ascii	"bitmap_heap_calloc\000"
.LASF30:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/bitmap_heap.c\000"
.LASF18:
	.ascii	"bitmap_heap_bytes_free\000"
.LASF3:
	.ascii	"blocks_used\000"
.LASF24:
	.ascii	"chip_interrupts_disable\000"
.LASF5:
	.ascii	"is_free_sequence\000"
.LASF6:
	.ascii	"to_pointer\000"
.LASF0:
	.ascii	"get_bitmap_bit\000"
.LASF29:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF7:
	.ascii	"allocate\000"
.LASF9:
	.ascii	"notify_heap_dealloc\000"
.LASF12:
	.ascii	"notify_heap_invalid_realloc\000"
.LASF14:
	.ascii	"bitmap_heap_init\000"
.LASF19:
	.ascii	"heap_blocks_allocated\000"
.LASF20:
	.ascii	"bitmap_heap_sizeof\000"
.LASF28:
	.ascii	"bitmap_heap_realloc\000"
.LASF23:
	.ascii	"bitmap_heap_free\000"
.LASF1:
	.ascii	"set_bitmap_bit\000"
.LASF26:
	.ascii	"extend\000"
.LASF2:
	.ascii	"locate_free\000"
.LASF25:
	.ascii	"chip_interrupts_set\000"
.LASF8:
	.ascii	"notify_heap_alloc\000"
.LASF15:
	.ascii	"bitmap_heap_block_size\000"
.LASF13:
	.ascii	"notify_heap_alloc_failed\000"
.LASF4:
	.ascii	"from_pointer\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
