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
	.file	"bitmap_heap.c"
	.text
.Ltext0:
	.global	malloc_mutex
	.section	.bss.malloc_mutex,"aw",%nobits
	.align	2
	.type	malloc_mutex, %object
	.size	malloc_mutex, 8
malloc_mutex:
	.space	8
	.section	.text.notify_heap_alloc,"ax",%progbits
	.align	2
	.weak	notify_heap_alloc
	.code	16
	.thumb_func
	.type	notify_heap_alloc, %function
notify_heap_alloc:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/bitmap_heap.c"
	.loc 1 74 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 75 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	notify_heap_alloc, .-notify_heap_alloc
	.section	.text.notify_heap_dealloc,"ax",%progbits
	.align	2
	.weak	notify_heap_dealloc
	.code	16
	.thumb_func
	.type	notify_heap_dealloc, %function
notify_heap_dealloc:
.LFB33:
	.loc 1 84 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 85 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	notify_heap_dealloc, .-notify_heap_dealloc
	.section	.text.notify_heap_invalid_dealloc,"ax",%progbits
	.align	2
	.weak	notify_heap_invalid_dealloc
	.code	16
	.thumb_func
	.type	notify_heap_invalid_dealloc, %function
notify_heap_invalid_dealloc:
.LFB34:
	.loc 1 94 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 95 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L6
.L5:
	.loc 1 97 0 discriminator 1
	b	.L5
.L6:
	.loc 1 99 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	notify_heap_invalid_dealloc, .-notify_heap_invalid_dealloc
	.section	.text.notify_heap_invalid_realloc,"ax",%progbits
	.align	2
	.weak	notify_heap_invalid_realloc
	.code	16
	.thumb_func
	.type	notify_heap_invalid_realloc, %function
notify_heap_invalid_realloc:
.LFB35:
	.loc 1 108 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	str	r1, [r7]
.L8:
	.loc 1 109 0 discriminator 1
	b	.L8
.LFE35:
	.size	notify_heap_invalid_realloc, .-notify_heap_invalid_realloc
	.section	.text.notify_heap_alloc_failed,"ax",%progbits
	.align	2
	.weak	notify_heap_alloc_failed
	.code	16
	.thumb_func
	.type	notify_heap_alloc_failed, %function
notify_heap_alloc_failed:
.LFB36:
	.loc 1 119 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #8
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
.L10:
	.loc 1 120 0 discriminator 1
	b	.L10
.LFE36:
	.size	notify_heap_alloc_failed, .-notify_heap_alloc_failed
	.global	caribou_heap_state
	.section	.bss.caribou_heap_state,"aw",%nobits
	.align	2
	.type	caribou_heap_state, %object
	.size	caribou_heap_state, 28
caribou_heap_state:
	.space	28
	.section	.bss.heap_count,"aw",%nobits
	.align	2
	.type	heap_count, %object
	.size	heap_count, 4
heap_count:
	.space	4
	.section	.bss.heap_num,"aw",%nobits
	.align	2
	.type	heap_num, %object
	.size	heap_num, 4
heap_num:
	.space	4
	.section	.text.bitmap_heap_init,"ax",%progbits
	.align	2
	.global	bitmap_heap_init
	.code	16
	.thumb_func
	.type	bitmap_heap_init, %function
bitmap_heap_init:
.LFB37:
	.loc 1 155 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #24
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 161 0
	ldr	r3, .L14
	movs	r1, #2
	movs	r0, r3
	bl	caribou_mutex_set_flags
	.loc 1 162 0
	ldr	r3, .L14
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 164 0
	ldr	r3, .L14+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L14+4
	str	r2, [r3]
	ldr	r3, .L14+4
	ldr	r3, [r3]
	subs	r2, r3, #1
	ldr	r3, .L14+8
	str	r2, [r3]
	.loc 1 165 0
	nop
.L12:
	.loc 1 165 0 is_stmt 0 discriminator 1
	ldr	r3, .L14+4
	ldr	r3, [r3]
	cmp	r3, #1
	bgt	.L12
	.loc 1 168 0 is_stmt 1
	ldr	r3, .L14+8
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L14+12
	adds	r3, r3, r2
	movs	r2, #28
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 1 171 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	str	r3, [r7, #20]
	.loc 1 172 0
	ldr	r3, [r7, #20]
	lsrs	r3, r3, #10
	str	r3, [r7, #16]
	.loc 1 175 0
	ldr	r3, [r7, #16]
	lsls	r3, r3, #3
	ldr	r2, [r7, #20]
	subs	r3, r2, r3
	str	r3, [r7, #12]
	.loc 1 176 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	lsrs	r3, r3, #5
	movs	r0, r3
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #16
	str	r0, [r3]
	.loc 1 179 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r3, .L14+8
	ldr	r1, [r3]
	ldr	r0, .L14+12
	movs	r3, r1
	lsls	r3, r3, #3
	subs	r3, r3, r1
	lsls	r3, r3, #2
	adds	r3, r0, r3
	adds	r3, r3, #16
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L13
	adds	r3, r3, #31
.L13:
	asrs	r3, r3, #5
	lsls	r3, r3, #2
	movs	r0, r3
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #8
	str	r0, [r3]
	.loc 1 180 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	str	r2, [r3, r1]
	.loc 1 181 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r3, [r7, #16]
	lsls	r1, r3, #2
	ldr	r3, [r7, #4]
	adds	r3, r1, r3
	movs	r0, r3
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #4
	str	r0, [r3]
	.loc 1 182 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r3, [r7, #16]
	lsls	r1, r3, #3
	ldr	r3, [r7, #4]
	adds	r3, r1, r3
	movs	r0, r3
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #12
	str	r0, [r3]
	.loc 1 188 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r0, [r3, r1]
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #8
	ldr	r3, [r3]
	movs	r2, r3
	movs	r1, #0
	bl	memset
	.loc 1 189 0
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #4
	ldr	r0, [r3]
	ldr	r3, .L14+8
	ldr	r2, [r3]
	ldr	r1, .L14+12
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #8
	ldr	r3, [r3]
	movs	r2, r3
	movs	r1, #0
	bl	memset
	.loc 1 191 0
	ldr	r3, .L14
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 1 192 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	malloc_mutex
	.word	heap_count
	.word	heap_num
	.word	caribou_heap_state
.LFE37:
	.size	bitmap_heap_init, .-bitmap_heap_init
	.section	.text.bitmap_heap_block_size,"ax",%progbits
	.align	2
	.global	bitmap_heap_block_size
	.code	16
	.thumb_func
	.type	bitmap_heap_block_size, %function
bitmap_heap_block_size:
.LFB38:
	.loc 1 372 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	.loc 1 373 0
	movs	r3, #32
	.loc 1 374 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	bitmap_heap_block_size, .-bitmap_heap_block_size
	.section	.text.bitmap_heap_blocks_allocated,"ax",%progbits
	.align	2
	.global	bitmap_heap_blocks_allocated
	.code	16
	.thumb_func
	.type	bitmap_heap_blocks_allocated, %function
bitmap_heap_blocks_allocated:
.LFB39:
	.loc 1 380 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	.loc 1 381 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 382 0
	ldr	r3, .L22
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 384 0
	ldr	r3, .L22+4
	movs	r2, #0
	str	r2, [r3]
	b	.L19
.L20:
	.loc 1 386 0 discriminator 3
	ldr	r3, .L22+4
	ldr	r2, [r3]
	ldr	r1, .L22+8
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #20
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	str	r3, [r7, #4]
	.loc 1 384 0 discriminator 3
	ldr	r3, .L22+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L22+4
	str	r2, [r3]
.L19:
	.loc 1 384 0 is_stmt 0 discriminator 1
	ldr	r3, .L22+4
	ldr	r2, [r3]
	ldr	r3, .L22+12
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L20
	.loc 1 388 0 is_stmt 1
	ldr	r3, .L22
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 1 389 0
	ldr	r3, [r7, #4]
	.loc 1 390 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L23:
	.align	2
.L22:
	.word	malloc_mutex
	.word	heap_num
	.word	caribou_heap_state
	.word	heap_count
.LFE39:
	.size	bitmap_heap_blocks_allocated, .-bitmap_heap_blocks_allocated
	.section	.text.bitmap_heap_bytes_used,"ax",%progbits
	.align	2
	.global	bitmap_heap_bytes_used
	.code	16
	.thumb_func
	.type	bitmap_heap_bytes_used, %function
bitmap_heap_bytes_used:
.LFB40:
	.loc 1 396 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #8
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	.loc 1 397 0
	bl	bitmap_heap_blocks_allocated
	movs	r3, r0
	lsls	r3, r3, #5
	str	r3, [r7, #4]
	.loc 1 398 0
	ldr	r3, [r7, #4]
	.loc 1 399 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE40:
	.size	bitmap_heap_bytes_used, .-bitmap_heap_bytes_used
	.section	.text.bitmap_heap_bytes_free,"ax",%progbits
	.align	2
	.global	bitmap_heap_bytes_free
	.code	16
	.thumb_func
	.type	bitmap_heap_bytes_free, %function
bitmap_heap_bytes_free:
.LFB41:
	.loc 1 405 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI26:
	sub	sp, sp, #8
.LCFI27:
	add	r7, sp, #0
.LCFI28:
	.loc 1 406 0
	movs	r3, #0
	str	r3, [r7]
	.loc 1 407 0
	movs	r3, #0
	str	r3, [r7, #4]
	.loc 1 410 0
	ldr	r3, .L30
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 411 0
	ldr	r3, .L30+4
	movs	r2, #0
	str	r2, [r3]
	b	.L27
.L28:
	.loc 1 413 0 discriminator 3
	ldr	r3, .L30+4
	ldr	r2, [r3]
	ldr	r1, .L30+8
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	adds	r3, r1, r3
	adds	r3, r3, #16
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	str	r3, [r7, #4]
	.loc 1 411 0 discriminator 3
	ldr	r3, .L30+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L30+4
	str	r2, [r3]
.L27:
	.loc 1 411 0 is_stmt 0 discriminator 1
	ldr	r3, .L30+4
	ldr	r2, [r3]
	ldr	r3, .L30+12
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L28
	.loc 1 415 0 is_stmt 1
	bl	bitmap_heap_blocks_allocated
	movs	r2, r0
	ldr	r3, [r7, #4]
	subs	r3, r3, r2
	lsls	r3, r3, #5
	ldr	r2, [r7]
	adds	r3, r2, r3
	str	r3, [r7]
	.loc 1 416 0
	ldr	r3, .L30
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 1 417 0
	ldr	r3, [r7]
	.loc 1 418 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L31:
	.align	2
.L30:
	.word	malloc_mutex
	.word	heap_num
	.word	caribou_heap_state
	.word	heap_count
.LFE41:
	.size	bitmap_heap_bytes_free, .-bitmap_heap_bytes_free
	.section	.text.get_bitmap_bit,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	get_bitmap_bit, %function
get_bitmap_bit:
.LFB42:
	.loc 1 428 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI29:
	sub	sp, sp, #16
.LCFI30:
	add	r7, sp, #0
.LCFI31:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 429 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L33
	.loc 1 429 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	.L33
	.loc 1 431 0 is_stmt 1
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bge	.L34
	adds	r3, r3, #31
.L34:
	asrs	r3, r3, #5
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	ldr	r1, .L37
	ands	r3, r1
	bpl	.L35
	subs	r3, r3, #1
	movs	r1, #32
	rsbs	r1, r1, #0
	orrs	r3, r1
	adds	r3, r3, #1
.L35:
	movs	r1, r3
	movs	r3, #1
	lsls	r3, r3, r1
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	b	.L36
.L33:
	.loc 1 433 0
	movs	r3, #0
.L36:
	.loc 1 434 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L38:
	.align	2
.L37:
	.word	-2147483617
.LFE42:
	.size	get_bitmap_bit, .-get_bitmap_bit
	.section	.text.set_bitmap_bit,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	set_bitmap_bit, %function
set_bitmap_bit:
.LFB43:
	.loc 1 444 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI32:
	sub	sp, sp, #24
.LCFI33:
	add	r7, sp, #0
.LCFI34:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r2, r3
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 445 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L44
	.loc 1 445 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	.L44
.LBB2:
	.loc 1 447 0 is_stmt 1
	ldr	r3, [r7, #8]
	ldr	r2, .L45
	ands	r3, r2
	bpl	.L41
	subs	r3, r3, #1
	movs	r2, #32
	rsbs	r2, r2, #0
	orrs	r3, r2
	adds	r3, r3, #1
.L41:
	str	r3, [r7, #20]
	.loc 1 448 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bge	.L42
	adds	r3, r3, #31
.L42:
	asrs	r3, r3, #5
	str	r3, [r7, #16]
	.loc 1 449 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L43
	.loc 1 450 0
	ldr	r3, [r7, #16]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldr	r2, [r7, #16]
	lsls	r2, r2, #2
	ldr	r1, [r7, #4]
	adds	r2, r1, r2
	ldr	r2, [r2]
	movs	r0, #1
	ldr	r1, [r7, #20]
	lsls	r0, r0, r1
	movs	r1, r0
	orrs	r2, r1
	str	r2, [r3]
.LBE2:
	.loc 1 454 0
	b	.L44
.L43:
.LBB3:
	.loc 1 452 0
	ldr	r3, [r7, #16]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	adds	r3, r2, r3
	ldr	r2, [r7, #16]
	lsls	r2, r2, #2
	ldr	r1, [r7, #4]
	adds	r2, r1, r2
	ldr	r2, [r2]
	movs	r0, #1
	ldr	r1, [r7, #20]
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3]
.L44:
.LBE3:
	.loc 1 454 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L46:
	.align	2
.L45:
	.word	-2147483617
.LFE43:
	.size	set_bitmap_bit, .-set_bitmap_bit
	.section	.text.is_free_sequence,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	is_free_sequence, %function
is_free_sequence:
.LFB44:
	.loc 1 463 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI35:
	sub	sp, sp, #16
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 465 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	adds	r5, r2, r3
	.loc 1 466 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #16]
	cmp	r3, r5
	ble	.L48
	.loc 1 468 0
	ldr	r4, [r7, #8]
	b	.L49
.L52:
	.loc 1 470 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	movs	r1, r4
	movs	r0, r3
	bl	get_bitmap_bit
	subs	r3, r0, #0
	beq	.L50
	.loc 1 472 0
	movs	r3, #0
	b	.L51
.L50:
	.loc 1 468 0 discriminator 2
	adds	r4, r4, #1
.L49:
	.loc 1 468 0 is_stmt 0 discriminator 1
	cmp	r4, r5
	blt	.L52
	.loc 1 475 0 is_stmt 1
	movs	r3, #1
	b	.L51
.L48:
	.loc 1 477 0
	movs	r3, #0
.L51:
	.loc 1 478 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE44:
	.size	is_free_sequence, .-is_free_sequence
	.section	.text.block_range,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	block_range, %function
block_range:
.LFB45:
	.loc 1 487 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI38:
	sub	sp, sp, #16
.LCFI39:
	add	r7, sp, #0
.LCFI40:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 488 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 489 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldr	r3, [r7]
	str	r2, [r3]
	.loc 1 505 0
	ldr	r3, [r7, #12]
	.loc 1 506 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE45:
	.size	block_range, .-block_range
	.section	.text.locate_free,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	locate_free, %function
locate_free:
.LFB46:
	.loc 1 514 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI41:
	sub	sp, sp, #16
.LCFI42:
	add	r7, sp, #0
.LCFI43:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 517 0
	movs	r3, #12
	adds	r2, r7, r3
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	block_range
	movs	r5, r0
	.loc 1 518 0
	movs	r4, #0
	.loc 1 519 0
	b	.L56
.L63:
	.loc 1 521 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	subs	r3, r5, #0
	bge	.L57
	adds	r3, r3, #31
.L57:
	asrs	r3, r3, #5
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r4, [r3]
	.loc 1 522 0
	adds	r3, r4, #1
	beq	.L58
	.loc 1 525 0
	movs	r4, #0
	b	.L59
.L62:
	.loc 1 528 0
	adds	r1, r5, r4
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	is_free_sequence
	subs	r3, r0, #0
	beq	.L60
	.loc 1 530 0
	adds	r3, r5, r4
	b	.L64
.L60:
	.loc 1 525 0 discriminator 2
	adds	r4, r4, #1
.L59:
	.loc 1 525 0 is_stmt 0 discriminator 1
	cmp	r4, #31
	ble	.L62
.L58:
	.loc 1 534 0 is_stmt 1
	adds	r5, r5, #32
.L56:
	.loc 1 519 0
	ldr	r3, [r7, #12]
	cmp	r5, r3
	blt	.L63
	.loc 1 536 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L64:
	.loc 1 537 0 discriminator 1
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE46:
	.size	locate_free, .-locate_free
	.section	.text.blocks_used,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	blocks_used, %function
blocks_used:
.LFB47:
	.loc 1 546 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI44:
	sub	sp, sp, #16
.LCFI45:
	add	r7, sp, #0
.LCFI46:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 547 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 548 0
	ldr	r3, [r7]
	cmp	r3, #0
	blt	.L66
	.loc 1 548 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldr	r3, [r7]
	cmp	r2, r3
	ble	.L66
	.loc 1 550 0 is_stmt 1
	nop
.L67:
	.loc 1 550 0 is_stmt 0 discriminator 2
	ldr	r2, [r7]
	ldr	r3, [r7, #12]
	adds	r2, r2, r3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bge	.L66
	.loc 1 550 0 discriminator 1
	ldr	r3, [r7, #12]
	adds	r2, r3, #1
	str	r2, [r7, #12]
	ldr	r2, [r7]
	adds	r1, r3, r2
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	get_bitmap_bit
	subs	r3, r0, #0
	beq	.L67
.L66:
	.loc 1 554 0 is_stmt 1
	ldr	r3, [r7, #12]
	.loc 1 555 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE47:
	.size	blocks_used, .-blocks_used
	.section	.text.from_pointer,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	from_pointer, %function
from_pointer:
.LFB48:
	.loc 1 564 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI47:
	sub	sp, sp, #16
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 565 0
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L70
.LBB4:
	.loc 1 567 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	subs	r3, r2, r3
	lsrs	r3, r3, #5
	str	r3, [r7, #12]
	.loc 1 568 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	blt	.L70
	.loc 1 568 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	ble	.L70
	.loc 1 570 0 is_stmt 1
	ldr	r3, [r7, #12]
	b	.L71
.L70:
.LBE4:
	.loc 1 573 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L71:
	.loc 1 574 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE48:
	.size	from_pointer, .-from_pointer
	.section	.text.to_pointer,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	to_pointer, %function
to_pointer:
.LFB49:
	.loc 1 586 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI50:
	sub	sp, sp, #16
.LCFI51:
	add	r7, sp, #0
.LCFI52:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 587 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 588 0
	ldr	r3, [r7]
	cmp	r3, #0
	blt	.L73
	.loc 1 588 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #16]
	ldr	r3, [r7]
	cmp	r2, r3
	ble	.L73
	.loc 1 590 0 is_stmt 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	ldr	r2, [r7]
	lsls	r2, r2, #5
	adds	r3, r3, r2
	str	r3, [r7, #12]
.L73:
	.loc 1 592 0
	ldr	r3, [r7, #12]
	.loc 1 593 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE49:
	.size	to_pointer, .-to_pointer
	.section	.text.allocate,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	allocate, %function
allocate:
.LFB50:
	.loc 1 603 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI53:
	sub	sp, sp, #20
.LCFI54:
	add	r7, sp, #0
.LCFI55:
	str	r0, [r7, #4]
	movs	r5, r1
	movs	r6, r2
	.loc 1 604 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 605 0
	cmp	r5, #0
	blt	.L76
	.loc 1 605 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, r5
	ble	.L76
.LBB5:
	.loc 1 607 0 is_stmt 1
	movs	r4, #0
	b	.L77
.L78:
	.loc 1 609 0 discriminator 3
	adds	r1, r5, r4
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r0, [r7, #4]
	movs	r3, #1
	bl	set_bitmap_bit
	.loc 1 610 0 discriminator 3
	adds	r1, r5, r4
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r0, [r7, #4]
	movs	r3, #0
	bl	set_bitmap_bit
	.loc 1 611 0 discriminator 3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 607 0 discriminator 3
	adds	r4, r4, #1
.L77:
	.loc 1 607 0 is_stmt 0 discriminator 1
	cmp	r4, r6
	blt	.L78
.LBE5:
	.loc 1 613 0 is_stmt 1
	adds	r3, r5, r6
	subs	r1, r3, #1
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r0, [r7, #4]
	movs	r3, #1
	bl	set_bitmap_bit
	.loc 1 614 0
	ldr	r3, [r7, #4]
	movs	r1, r5
	movs	r0, r3
	bl	to_pointer
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 615 0
	movs	r0, r6
	bl	notify_heap_alloc
.L76:
	.loc 1 617 0
	ldr	r3, [r7, #12]
	.loc 1 618 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE50:
	.size	allocate, .-allocate
	.section	.text.deallocate,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	deallocate, %function
deallocate:
.LFB51:
	.loc 1 629 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
.LCFI56:
	sub	sp, sp, #12
.LCFI57:
	add	r7, sp, #0
.LCFI58:
	str	r0, [r7, #4]
	movs	r5, r1
	movs	r6, r2
	.loc 1 630 0
	cmp	r5, #0
	blt	.L81
	.loc 1 630 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	cmp	r3, r5
	ble	.L81
.LBB6:
	.loc 1 632 0 is_stmt 1
	movs	r4, #0
	b	.L82
.L83:
	.loc 1 634 0 discriminator 3
	movs	r3, r5
	adds	r3, r3, r4
	movs	r1, r3
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	ldr	r0, [r7, #4]
	movs	r3, #0
	bl	set_bitmap_bit
	.loc 1 635 0 discriminator 3
	movs	r3, r5
	adds	r3, r3, r4
	movs	r1, r3
	ldr	r3, [r7, #4]
	ldr	r2, [r3, #4]
	ldr	r0, [r7, #4]
	movs	r3, #0
	bl	set_bitmap_bit
	.loc 1 636 0 discriminator 3
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	subs	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3, #20]
	.loc 1 632 0 discriminator 3
	adds	r4, r4, #1
.L82:
	.loc 1 632 0 is_stmt 0 discriminator 1
	movs	r3, r6
	cmp	r4, r3
	bcc	.L83
.LBE6:
	.loc 1 638 0 is_stmt 1
	movs	r0, r6
	bl	notify_heap_dealloc
	.loc 1 639 0
	movs	r3, #1
	b	.L84
.L81:
	.loc 1 641 0
	movs	r3, #0
.L84:
	.loc 1 642 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.LFE51:
	.size	deallocate, .-deallocate
	.section	.text.can_extend,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	can_extend, %function
can_extend:
.LFB52:
	.loc 1 653 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI59:
	sub	sp, sp, #28
.LCFI60:
	add	r7, sp, #0
.LCFI61:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 655 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 656 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L86
	.loc 1 656 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #16]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	ble	.L86
	.loc 1 658 0 is_stmt 1
	movs	r4, #0
	b	.L87
.L90:
	.loc 1 660 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	adds	r3, r2, r3
	adds	r1, r3, r4
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	get_bitmap_bit
	subs	r3, r0, #0
	beq	.L88
	.loc 1 662 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	b	.L89
.L88:
	.loc 1 658 0 discriminator 2
	adds	r4, r4, #1
.L87:
	.loc 1 658 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r4, r3
	blt	.L90
	.loc 1 665 0 is_stmt 1
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L86:
	.loc 1 667 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
.L89:
	.loc 1 668 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE52:
	.size	can_extend, .-can_extend
	.section	.text.extend,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	extend, %function
extend:
.LFB53:
	.loc 1 679 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI62:
	sub	sp, sp, #28
.LCFI63:
	add	r7, sp, #0
.LCFI64:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	str	r3, [r7]
	.loc 1 681 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 682 0
	ldr	r3, [r7]
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #12]
	bl	can_extend
	subs	r3, r0, #0
	beq	.L92
.LBB7:
	.loc 1 684 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r2, r3
	str	r3, [r7, #16]
	.loc 1 685 0
	movs	r4, #0
	b	.L93
.L96:
	.loc 1 687 0
	ldr	r3, [r7, #16]
	subs	r3, r3, #1
	movs	r2, r4
	cmp	r3, r2
	bne	.L94
	.loc 1 688 0
	ldr	r3, [r7, #8]
	adds	r1, r4, r3
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #4]
	ldr	r0, [r7, #12]
	movs	r3, #1
	bl	set_bitmap_bit
	b	.L95
.L94:
	.loc 1 690 0
	ldr	r3, [r7, #8]
	adds	r1, r4, r3
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #4]
	ldr	r0, [r7, #12]
	movs	r3, #0
	bl	set_bitmap_bit
.L95:
	.loc 1 691 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r1, r4, r3
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r0, [r7, #12]
	movs	r3, #1
	bl	set_bitmap_bit
	.loc 1 685 0 discriminator 2
	adds	r4, r4, #1
.L93:
	.loc 1 685 0 is_stmt 0 discriminator 1
	movs	r2, r4
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bcc	.L96
	.loc 1 693 0 is_stmt 1
	ldr	r3, [r7, #12]
	ldr	r2, [r3, #20]
	ldr	r3, [r7]
	adds	r2, r2, r3
	ldr	r3, [r7, #12]
	str	r2, [r3, #20]
	.loc 1 694 0
	movs	r3, #23
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L92:
.LBE7:
	.loc 1 696 0
	movs	r3, #23
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 697 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r7, pc}
.LFE53:
	.size	extend, .-extend
	.section	.text.bitmap_heap_sizeof,"ax",%progbits
	.align	2
	.global	bitmap_heap_sizeof
	.code	16
	.thumb_func
	.type	bitmap_heap_sizeof, %function
bitmap_heap_sizeof:
.LFB54:
	.loc 1 703 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI65:
	sub	sp, sp, #16
.LCFI66:
	add	r7, sp, #0
.LCFI67:
	str	r0, [r7, #4]
	.loc 1 704 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 705 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L99
	.loc 1 707 0
	ldr	r3, .L105
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 708 0
	ldr	r3, .L105+4
	movs	r2, #0
	str	r2, [r3]
	b	.L100
.L103:
.LBB8:
	.loc 1 712 0
	ldr	r3, .L105+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L105+8
	adds	r3, r3, r2
	ldr	r2, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	from_pointer
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 713 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	blt	.L101
	.loc 1 715 0
	ldr	r3, .L105+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L105+8
	adds	r3, r3, r2
	ldr	r2, [r7, #8]
	movs	r1, r2
	movs	r0, r3
	bl	blocks_used
	movs	r3, r0
	lsls	r3, r3, #5
	str	r3, [r7, #12]
	.loc 1 716 0
	b	.L102
.L101:
.LBE8:
	.loc 1 708 0 discriminator 2
	ldr	r3, .L105+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L105+4
	str	r2, [r3]
.L100:
	.loc 1 708 0 is_stmt 0 discriminator 1
	ldr	r3, .L105+4
	ldr	r2, [r3]
	ldr	r3, .L105+12
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L103
.L102:
	.loc 1 719 0 is_stmt 1
	ldr	r3, .L105
	movs	r0, r3
	bl	caribou_mutex_unlock
.L99:
	.loc 1 721 0
	ldr	r3, [r7, #12]
	.loc 1 722 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L106:
	.align	2
.L105:
	.word	malloc_mutex
	.word	heap_num
	.word	caribou_heap_state
	.word	heap_count
.LFE54:
	.size	bitmap_heap_sizeof, .-bitmap_heap_sizeof
	.section	.text.bitmap_heap_malloc,"ax",%progbits
	.align	2
	.global	bitmap_heap_malloc
	.code	16
	.thumb_func
	.type	bitmap_heap_malloc, %function
bitmap_heap_malloc:
.LFB55:
	.loc 1 729 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI68:
	sub	sp, sp, #24
.LCFI69:
	add	r7, sp, #0
.LCFI70:
	str	r0, [r7, #4]
	.loc 1 730 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 1 731 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L108
.LBB9:
	.loc 1 733 0
	ldr	r3, [r7, #4]
	lsrs	r2, r3, #5
	ldr	r3, [r7, #4]
	movs	r1, #31
	ands	r3, r1
	beq	.L109
	.loc 1 733 0 is_stmt 0 discriminator 1
	movs	r3, #1
	b	.L110
.L109:
	.loc 1 733 0 discriminator 2
	movs	r3, #0
.L110:
	.loc 1 733 0 discriminator 4
	adds	r3, r2, r3
	str	r3, [r7, #16]
	.loc 1 736 0 is_stmt 1 discriminator 4
	ldr	r3, .L117
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 737 0 discriminator 4
	ldr	r3, .L117+4
	movs	r2, #0
	str	r2, [r3]
	b	.L111
.L114:
	.loc 1 742 0
	ldr	r3, .L117+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L117+8
	adds	r3, r3, r2
	ldr	r2, [r7, #16]
	movs	r1, r2
	movs	r0, r3
	bl	locate_free
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 743 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	blt	.L112
	.loc 1 745 0
	ldr	r3, .L117+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L117+8
	adds	r3, r3, r2
	ldr	r2, [r7, #16]
	ldr	r1, [r7, #12]
	movs	r0, r3
	bl	allocate
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 746 0
	b	.L113
.L112:
	.loc 1 737 0 discriminator 2
	ldr	r3, .L117+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L117+4
	str	r2, [r3]
.L111:
	.loc 1 737 0 is_stmt 0 discriminator 1
	ldr	r3, .L117+4
	ldr	r2, [r3]
	ldr	r3, .L117+12
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L114
.L113:
	.loc 1 749 0 is_stmt 1
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L115
	.loc 1 751 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	notify_heap_alloc_failed
.L115:
	.loc 1 761 0
	ldr	r3, .L117
	movs	r0, r3
	bl	caribou_mutex_unlock
.L108:
.LBE9:
	.loc 1 767 0
	ldr	r3, [r7, #20]
	.loc 1 768 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L118:
	.align	2
.L117:
	.word	malloc_mutex
	.word	heap_num
	.word	caribou_heap_state
	.word	heap_count
.LFE55:
	.size	bitmap_heap_malloc, .-bitmap_heap_malloc
	.section	.text.bitmap_heap_realloc,"ax",%progbits
	.align	2
	.global	bitmap_heap_realloc
	.code	16
	.thumb_func
	.type	bitmap_heap_realloc, %function
bitmap_heap_realloc:
.LFB56:
	.loc 1 778 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI71:
	sub	sp, sp, #32
.LCFI72:
	add	r7, sp, #0
.LCFI73:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 782 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.LCB1756
	b	.L120	@long jump
.LCB1756:
	.loc 1 782 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.LCB1759
	b	.L120	@long jump
.LCB1759:
.LBB10:
	.loc 1 784 0 is_stmt 1
	ldr	r3, [r7]
	lsrs	r2, r3, #5
	ldr	r3, [r7]
	movs	r1, #31
	ands	r3, r1
	beq	.L121
	.loc 1 784 0 is_stmt 0 discriminator 1
	movs	r3, #1
	b	.L122
.L121:
	.loc 1 784 0 discriminator 2
	movs	r3, #0
.L122:
	.loc 1 784 0 discriminator 4
	adds	r3, r2, r3
	str	r3, [r7, #24]
	.loc 1 785 0 is_stmt 1 discriminator 4
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #28]
	.loc 1 787 0 discriminator 4
	ldr	r3, .L138
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 789 0 discriminator 4
	ldr	r3, .L138+4
	movs	r2, #0
	str	r2, [r3]
	b	.L123
.L126:
	.loc 1 791 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	from_pointer
	movs	r3, r0
	str	r3, [r7, #28]
	.loc 1 792 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bge	.L137
	.loc 1 789 0 discriminator 2
	ldr	r3, .L138+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L138+4
	str	r2, [r3]
.L123:
	.loc 1 789 0 is_stmt 0 discriminator 1
	ldr	r3, .L138+4
	ldr	r2, [r3]
	ldr	r3, .L138+12
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L126
	b	.L125
.L137:
	.loc 1 793 0 is_stmt 1
	nop
.L125:
	.loc 1 795 0
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bge	.LCB1831
	b	.L127	@long jump
.LCB1831:
	.loc 1 797 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #28]
	movs	r1, r2
	movs	r0, r3
	bl	blocks_used
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 798 0
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	ble	.L128
	.loc 1 800 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r0, r3, r2
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #20]
	subs	r3, r2, r3
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #28]
	bl	extend
	subs	r3, r0, #0
	beq	.LCB1866
	b	.L133	@long jump
.LCB1866:
.LBB11:
	.loc 1 803 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #28]
	movs	r0, r3
	bl	deallocate
	.loc 1 807 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #24]
	movs	r1, r2
	movs	r0, r3
	bl	locate_free
	movs	r3, r0
	str	r3, [r7, #16]
	.loc 1 808 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	blt	.L130
.LBB12:
	.loc 1 810 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #16]
	movs	r0, r3
	bl	allocate
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 811 0
	ldr	r3, [r7, #20]
	lsls	r3, r3, #5
	movs	r2, r3
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	memcpy
	.loc 1 813 0
	ldr	r3, [r7, #12]
	str	r3, [r7, #4]
.LBE12:
	b	.L133
.L130:
.LBB13:
	.loc 1 822 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	bitmap_heap_malloc
	movs	r3, r0
	str	r3, [r7, #8]
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L131
	.loc 1 824 0
	ldr	r3, [r7, #20]
	lsls	r3, r3, #5
	movs	r2, r3
	ldr	r1, [r7, #4]
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	memcpy
	.loc 1 826 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #4]
	b	.L133
.L131:
	.loc 1 830 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	notify_heap_invalid_realloc
	.loc 1 831 0
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L133
.L128:
.LBE13:
.LBE11:
	.loc 1 836 0
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bge	.L133
	.loc 1 839 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #28]
	movs	r0, r3
	bl	deallocate
	.loc 1 840 0
	ldr	r3, .L138+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L138+8
	adds	r3, r3, r2
	ldr	r2, [r7, #24]
	ldr	r1, [r7, #28]
	movs	r0, r3
	bl	allocate
	b	.L133
.L127:
	.loc 1 845 0
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	notify_heap_invalid_realloc
	.loc 1 846 0
	movs	r3, #0
	str	r3, [r7, #4]
.L133:
	.loc 1 848 0
	ldr	r3, .L138
	movs	r0, r3
	bl	caribou_mutex_unlock
.LBE10:
	.loc 1 783 0
	b	.L134
.L120:
	.loc 1 850 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L135
	.loc 1 850 0 is_stmt 0 discriminator 1
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L135
	.loc 1 852 0 is_stmt 1
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	bitmap_heap_free
	.loc 1 853 0
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L134
.L135:
	.loc 1 855 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L134
	.loc 1 857 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	bitmap_heap_malloc
	movs	r3, r0
	str	r3, [r7, #4]
.L134:
	.loc 1 870 0
	ldr	r3, [r7, #4]
	.loc 1 871 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L139:
	.align	2
.L138:
	.word	malloc_mutex
	.word	heap_num
	.word	caribou_heap_state
	.word	heap_count
.LFE56:
	.size	bitmap_heap_realloc, .-bitmap_heap_realloc
	.section	.text.bitmap_heap_calloc,"ax",%progbits
	.align	2
	.global	bitmap_heap_calloc
	.code	16
	.thumb_func
	.type	bitmap_heap_calloc, %function
bitmap_heap_calloc:
.LFB57:
	.loc 1 879 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI74:
	sub	sp, sp, #16
.LCFI75:
	add	r7, sp, #0
.LCFI76:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 880 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	muls	r3, r2
	str	r3, [r7, #12]
	.loc 1 881 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	bitmap_heap_malloc
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 882 0
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L141
	.loc 1 883 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	movs	r1, #0
	movs	r0, r3
	bl	memset
.L141:
	.loc 1 884 0
	ldr	r3, [r7, #8]
	.loc 1 885 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE57:
	.size	bitmap_heap_calloc, .-bitmap_heap_calloc
	.section	.text.bitmap_heap_free,"ax",%progbits
	.align	2
	.global	bitmap_heap_free
	.code	16
	.thumb_func
	.type	bitmap_heap_free, %function
bitmap_heap_free:
.LFB58:
	.loc 1 893 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI77:
	sub	sp, sp, #16
.LCFI78:
	add	r7, sp, #0
.LCFI79:
	str	r0, [r7, #4]
	.loc 1 894 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
	.loc 1 896 0
	ldr	r3, .L149
	movs	r1, #0
	movs	r0, r3
	bl	caribou_mutex_lock
	.loc 1 906 0
	ldr	r3, .L149+4
	movs	r2, #0
	str	r2, [r3]
	b	.L144
.L147:
	.loc 1 908 0
	ldr	r3, .L149+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L149+8
	adds	r3, r3, r2
	ldr	r2, [r7, #4]
	movs	r1, r2
	movs	r0, r3
	bl	from_pointer
	movs	r3, r0
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	blt	.L145
	.loc 1 910 0
	ldr	r3, .L149+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L149+8
	adds	r3, r3, r2
	ldr	r2, [r7, #12]
	movs	r1, r2
	movs	r0, r3
	bl	blocks_used
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 911 0
	ldr	r3, .L149+4
	ldr	r2, [r3]
	movs	r3, r2
	lsls	r3, r3, #3
	subs	r3, r3, r2
	lsls	r3, r3, #2
	ldr	r2, .L149+8
	adds	r3, r3, r2
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #12]
	movs	r0, r3
	bl	deallocate
	.loc 1 912 0
	b	.L146
.L145:
	.loc 1 906 0 discriminator 2
	ldr	r3, .L149+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L149+4
	str	r2, [r3]
.L144:
	.loc 1 906 0 is_stmt 0 discriminator 1
	ldr	r3, .L149+4
	ldr	r2, [r3]
	ldr	r3, .L149+12
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L147
.L146:
	.loc 1 915 0 is_stmt 1
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bge	.L148
	.loc 1 917 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	notify_heap_invalid_dealloc
.L148:
	.loc 1 919 0
	ldr	r3, .L149
	movs	r0, r3
	bl	caribou_mutex_unlock
	.loc 1 920 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L150:
	.align	2
.L149:
	.word	malloc_mutex
	.word	heap_num
	.word	caribou_heap_state
	.word	heap_count
.LFE58:
	.size	bitmap_heap_free, .-bitmap_heap_free
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI15-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI18-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI20-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI23-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI24-.LCFI23
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI26-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI28-.LCFI27
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI29-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI30-.LCFI29
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI32-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI35-.LFB44
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI38-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI41-.LFB46
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI44-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x4
	.4byte	.LCFI47-.LFB48
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.byte	0x4
	.4byte	.LCFI50-.LFB49
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.byte	0x4
	.4byte	.LCFI53-.LFB50
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
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x4
	.4byte	.LCFI56-.LFB51
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
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI59-.LFB52
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI60-.LCFI59
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI61-.LCFI60
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI62-.LFB53
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI63-.LCFI62
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI64-.LCFI63
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI65-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI66-.LCFI65
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI67-.LCFI66
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI68-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI69-.LCFI68
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI70-.LCFI69
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI71-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI72-.LCFI71
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI73-.LCFI72
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI74-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI75-.LCFI74
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI76-.LCFI75
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.byte	0x4
	.4byte	.LCFI77-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI78-.LCFI77
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI79-.LCFI78
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE52:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.file 4 "../../../../include/caribou/lib/bitmap_heap.h"
	.file 5 "../../../../include/caribou/lib/mutex.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa12
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0xc
	.4byte	.LASF78
	.4byte	.LASF79
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
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
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x16
	.4byte	0x62
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x17
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x16
	.4byte	0x74
	.uleb128 0x6
	.byte	0x1c
	.byte	0x4
	.byte	0x2f
	.4byte	0x108
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x4
	.byte	0x32
	.4byte	0x108
	.byte	0
	.uleb128 0x7
	.4byte	.LASF16
	.byte	0x4
	.byte	0x35
	.4byte	0x108
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x4
	.byte	0x38
	.4byte	0x57
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.byte	0x3b
	.4byte	0x10e
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.byte	0x3e
	.4byte	0x57
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.byte	0x41
	.4byte	0x57
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.byte	0x44
	.4byte	0x69
	.byte	0x18
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x69
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF22
	.byte	0x4
	.byte	0x4c
	.4byte	0xab
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.byte	0x1e
	.4byte	0x158
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x5
	.byte	0x20
	.4byte	0x89
	.byte	0
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x5
	.byte	0x21
	.4byte	0x45
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x5
	.byte	0x22
	.4byte	0x2c
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x5
	.byte	0x23
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x5
	.byte	0x24
	.4byte	0x11f
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x1
	.byte	0x49
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x187
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x1
	.byte	0x49
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x1
	.byte	0x53
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ab
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x1
	.byte	0x53
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x1
	.byte	0x5d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cf
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x1
	.byte	0x5d
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x1
	.byte	0x6b
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x201
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x1
	.byte	0x6b
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x1
	.byte	0x6b
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x9
	.4byte	.LASF35
	.byte	0x1
	.byte	0x76
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x225
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x1
	.byte	0x76
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x1
	.byte	0x9a
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x281
	.uleb128 0xa
	.4byte	.LASF37
	.byte	0x1
	.byte	0x9a
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x1
	.byte	0x9a
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x1
	.byte	0x9c
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x1
	.byte	0x9d
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x1
	.byte	0x9e
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x173
	.4byte	0x57
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x17b
	.4byte	0x57
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2c0
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x17d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x18b
	.4byte	0x57
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e9
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x18d
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xe
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x194
	.4byte	0x57
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x321
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x196
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x197
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x1ab
	.4byte	0x92
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x369
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1ab
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1ab
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x13
	.ascii	"map\000"
	.byte	0x1
	.2byte	0x1ab
	.4byte	0x108
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x114
	.uleb128 0x14
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x1bb
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e6
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1bb
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1bb
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.ascii	"map\000"
	.byte	0x1
	.2byte	0x1bb
	.4byte	0x108
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1bb
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -29
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x10
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x1bf
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1c0
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x92
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x448
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x1d0
	.4byte	0x57
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x10
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x1d1
	.4byte	0x57
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x1e6
	.4byte	0x57
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x48f
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x1e6
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x1e6
	.4byte	0x48f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x1e8
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x57
	.uleb128 0x16
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x201
	.4byte	0x57
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x505
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x201
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x201
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x203
	.4byte	0x57
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x10
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x204
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x205
	.4byte	0x57
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x10
	.4byte	.LASF54
	.byte	0x1
	.2byte	0x206
	.4byte	0x69
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x16
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x221
	.4byte	0x57
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x54d
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x221
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x221
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x223
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x233
	.4byte	0x57
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59f
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x233
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x233
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x237
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x249
	.4byte	0x89
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5e7
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x249
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x249
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x24b
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x25a
	.4byte	0x89
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x652
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x25a
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x25a
	.4byte	0x57
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x25a
	.4byte	0x57
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x25c
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x25f
	.4byte	0x57
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x274
	.4byte	0x92
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ae
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x274
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x274
	.4byte	0x57
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x274
	.4byte	0x57
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x17
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x278
	.4byte	0x69
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x28c
	.4byte	0x92
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x71f
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x28c
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x28c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x28c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x28c
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x28e
	.4byte	0x57
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x28f
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x16
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x2a6
	.4byte	0x92
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7a9
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x2a6
	.4byte	0x369
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x2a6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x12
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x2a6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x2a6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.ascii	"n\000"
	.byte	0x1
	.2byte	0x2a8
	.4byte	0x57
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x2a9
	.4byte	0x92
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x17
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x10
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x2ac
	.4byte	0x69
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x2be
	.4byte	0xa0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x806
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x2be
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.ascii	"rc\000"
	.byte	0x1
	.2byte	0x2c0
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x2c6
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x2c7
	.4byte	0x57
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x2d8
	.4byte	0x89
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x867
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x2d8
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x2da
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x2dd
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x2de
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x309
	.4byte	0x89
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x926
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x309
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x309
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x310
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x311
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x312
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.uleb128 0x10
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x322
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.4byte	0x90a
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x32a
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x17
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.uleb128 0x10
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x335
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LASF69
	.byte	0x1
	.2byte	0x36e
	.4byte	0x89
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x97d
	.uleb128 0x12
	.4byte	.LASF70
	.byte	0x1
	.2byte	0x36e
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x36e
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.4byte	.LASF71
	.byte	0x1
	.2byte	0x370
	.4byte	0xa0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x371
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x37c
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9c1
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x37c
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x37e
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x37f
	.4byte	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xc
	.4byte	.LASF73
	.byte	0x1
	.byte	0x8c
	.4byte	0x62
	.uleb128 0x5
	.byte	0x3
	.4byte	heap_count
	.uleb128 0xc
	.4byte	.LASF74
	.byte	0x1
	.byte	0x8d
	.4byte	0x62
	.uleb128 0x5
	.byte	0x3
	.4byte	heap_num
	.uleb128 0x1c
	.4byte	0x114
	.4byte	0x9f3
	.uleb128 0x1d
	.4byte	0x99
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF75
	.byte	0x1
	.byte	0x8b
	.4byte	0x9e3
	.uleb128 0x5
	.byte	0x3
	.4byte	caribou_heap_state
	.uleb128 0x1e
	.4byte	.LASF76
	.byte	0x1
	.byte	0x33
	.4byte	0x158
	.uleb128 0x5
	.byte	0x3
	.4byte	malloc_mutex
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
	.uleb128 0x5
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
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.4byte	0x297
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xa16
	.4byte	0x163
	.ascii	"notify_heap_alloc\000"
	.4byte	0x187
	.ascii	"notify_heap_dealloc\000"
	.4byte	0x1ab
	.ascii	"notify_heap_invalid_dealloc\000"
	.4byte	0x1cf
	.ascii	"notify_heap_invalid_realloc\000"
	.4byte	0x201
	.ascii	"notify_heap_alloc_failed\000"
	.4byte	0x225
	.ascii	"bitmap_heap_init\000"
	.4byte	0x281
	.ascii	"bitmap_heap_block_size\000"
	.4byte	0x297
	.ascii	"bitmap_heap_blocks_allocated\000"
	.4byte	0x2c0
	.ascii	"bitmap_heap_bytes_used\000"
	.4byte	0x2e9
	.ascii	"bitmap_heap_bytes_free\000"
	.4byte	0x321
	.ascii	"get_bitmap_bit\000"
	.4byte	0x36f
	.ascii	"set_bitmap_bit\000"
	.4byte	0x3e6
	.ascii	"is_free_sequence\000"
	.4byte	0x448
	.ascii	"block_range\000"
	.4byte	0x495
	.ascii	"locate_free\000"
	.4byte	0x505
	.ascii	"blocks_used\000"
	.4byte	0x54d
	.ascii	"from_pointer\000"
	.4byte	0x59f
	.ascii	"to_pointer\000"
	.4byte	0x5e7
	.ascii	"allocate\000"
	.4byte	0x652
	.ascii	"deallocate\000"
	.4byte	0x6ae
	.ascii	"can_extend\000"
	.4byte	0x71f
	.ascii	"extend\000"
	.4byte	0x7a9
	.ascii	"bitmap_heap_sizeof\000"
	.4byte	0x806
	.ascii	"bitmap_heap_malloc\000"
	.4byte	0x867
	.ascii	"bitmap_heap_realloc\000"
	.4byte	0x926
	.ascii	"bitmap_heap_calloc\000"
	.4byte	0x97d
	.ascii	"bitmap_heap_free\000"
	.4byte	0x9c1
	.ascii	"heap_count\000"
	.4byte	0x9d2
	.ascii	"heap_num\000"
	.4byte	0x9f3
	.ascii	"caribou_heap_state\000"
	.4byte	0xa04
	.ascii	"malloc_mutex\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x120
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0xa16
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x50
	.ascii	"short unsigned int\000"
	.4byte	0x45
	.ascii	"uint16_t\000"
	.4byte	0x62
	.ascii	"int\000"
	.4byte	0x57
	.ascii	"int32_t\000"
	.4byte	0x74
	.ascii	"unsigned int\000"
	.4byte	0x69
	.ascii	"uint32_t\000"
	.4byte	0x7b
	.ascii	"long long int\000"
	.4byte	0x82
	.ascii	"long long unsigned int\000"
	.4byte	0x8b
	.ascii	"long int\000"
	.4byte	0x92
	.ascii	"char\000"
	.4byte	0x99
	.ascii	"sizetype\000"
	.4byte	0xa0
	.ascii	"size_t\000"
	.4byte	0x114
	.ascii	"heap_state_t\000"
	.4byte	0x158
	.ascii	"caribou_mutex_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xec
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
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB2
	.4byte	.LBE2
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	0
	.4byte	0
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
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	.LFB56
	.4byte	.LFE56
	.4byte	.LFB57
	.4byte	.LFE57
	.4byte	.LFB58
	.4byte	.LFE58
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"heap_base\000"
.LASF18:
	.ascii	"heap_area\000"
.LASF40:
	.ascii	"heapSegmentSize\000"
.LASF47:
	.ascii	"state\000"
.LASF67:
	.ascii	"target\000"
.LASF58:
	.ascii	"to_pointer\000"
.LASF2:
	.ascii	"short int\000"
.LASF14:
	.ascii	"size_t\000"
.LASF81:
	.ascii	"set_bitmap_bit\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF43:
	.ascii	"bitmap_heap_bytes_used\000"
.LASF31:
	.ascii	"notify_heap_invalid_dealloc\000"
.LASF79:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF69:
	.ascii	"bitmap_heap_calloc\000"
.LASF73:
	.ascii	"heap_count\000"
.LASF57:
	.ascii	"from_pointer\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF33:
	.ascii	"notify_heap_invalid_realloc\000"
.LASF24:
	.ascii	"locks\000"
.LASF52:
	.ascii	"block_range\000"
.LASF26:
	.ascii	"blocking\000"
.LASF72:
	.ascii	"bitmap_heap_free\000"
.LASF78:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/bitmap_heap.c\000"
.LASF0:
	.ascii	"signed char\000"
.LASF28:
	.ascii	"notify_heap_alloc\000"
.LASF50:
	.ascii	"get_bitmap_bit\000"
.LASF9:
	.ascii	"long long int\000"
.LASF44:
	.ascii	"bitmap_heap_bytes_free\000"
.LASF53:
	.ascii	"locate_free\000"
.LASF39:
	.ascii	"heap_size\000"
.LASF11:
	.ascii	"long int\000"
.LASF74:
	.ascii	"heap_num\000"
.LASF41:
	.ascii	"pageWords\000"
.LASF46:
	.ascii	"block\000"
.LASF20:
	.ascii	"heap_blocks_allocated\000"
.LASF48:
	.ascii	"bitOffset\000"
.LASF60:
	.ascii	"deallocate\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF55:
	.ascii	"blocks_used\000"
.LASF25:
	.ascii	"flags\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF38:
	.ascii	"heap_end\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF30:
	.ascii	"blocks\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF21:
	.ascii	"heap_flags\000"
.LASF23:
	.ascii	"thread\000"
.LASF65:
	.ascii	"bitmap_heap_malloc\000"
.LASF59:
	.ascii	"allocate\000"
.LASF68:
	.ascii	"pTarget\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF45:
	.ascii	"heap_state\000"
.LASF12:
	.ascii	"char\000"
.LASF22:
	.ascii	"heap_state_t\000"
.LASF36:
	.ascii	"bitmap_heap_init\000"
.LASF80:
	.ascii	"bitmap_heap_block_size\000"
.LASF6:
	.ascii	"int32_t\000"
.LASF70:
	.ascii	"nmemb\000"
.LASF76:
	.ascii	"malloc_mutex\000"
.LASF66:
	.ascii	"bitmap_heap_realloc\000"
.LASF75:
	.ascii	"caribou_heap_state\000"
.LASF34:
	.ascii	"size\000"
.LASF19:
	.ascii	"heap_blocks\000"
.LASF29:
	.ascii	"notify_heap_dealloc\000"
.LASF16:
	.ascii	"heap_last_bitmap\000"
.LASF49:
	.ascii	"wordOffset\000"
.LASF71:
	.ascii	"bytes\000"
.LASF35:
	.ascii	"notify_heap_alloc_failed\000"
.LASF64:
	.ascii	"bitmap_heap_sizeof\000"
.LASF51:
	.ascii	"is_free_sequence\000"
.LASF32:
	.ascii	"pointer\000"
.LASF62:
	.ascii	"extend\000"
.LASF77:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF17:
	.ascii	"heap_bitmap_size\000"
.LASF61:
	.ascii	"can_extend\000"
.LASF56:
	.ascii	"used\000"
.LASF42:
	.ascii	"bitmap_heap_blocks_allocated\000"
.LASF63:
	.ascii	"total\000"
.LASF54:
	.ascii	"page\000"
.LASF15:
	.ascii	"heap_free_bitmap\000"
.LASF27:
	.ascii	"caribou_mutex_t\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
