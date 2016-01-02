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
	.file	"heap.c"
	.text
.Ltext0:
	.section	.text.notify_heap_alloc,"ax",%progbits
	.align	1
	.weak	notify_heap_alloc
	.code	16
	.thumb_func
	.type	notify_heap_alloc, %function
notify_heap_alloc:
.LFB0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/heap.c"
	.loc 1 31 0
.LVL0:
	.loc 1 32 0
	@ sp needed
	bx	lr
.LFE0:
	.size	notify_heap_alloc, .-notify_heap_alloc
	.section	.text.notify_heap_dealloc,"ax",%progbits
	.align	1
	.weak	notify_heap_dealloc
	.code	16
	.thumb_func
	.type	notify_heap_dealloc, %function
notify_heap_dealloc:
.LFB1:
	.loc 1 41 0
.LVL1:
	.loc 1 42 0
	@ sp needed
	bx	lr
.LFE1:
	.size	notify_heap_dealloc, .-notify_heap_dealloc
	.section	.text.notify_heap_invalid_dealloc,"ax",%progbits
	.align	1
	.weak	notify_heap_invalid_dealloc
	.code	16
	.thumb_func
	.type	notify_heap_invalid_dealloc, %function
notify_heap_invalid_dealloc:
.LFB2:
	.loc 1 51 0
.LVL2:
.L4:
	b	.L4
.LFE2:
	.size	notify_heap_invalid_dealloc, .-notify_heap_invalid_dealloc
	.section	.text.notify_heap_invalid_realloc,"ax",%progbits
	.align	1
	.weak	notify_heap_invalid_realloc
	.code	16
	.thumb_func
	.type	notify_heap_invalid_realloc, %function
notify_heap_invalid_realloc:
.LFB3:
	.loc 1 62 0
.LVL3:
.L6:
	b	.L6
.LFE3:
	.size	notify_heap_invalid_realloc, .-notify_heap_invalid_realloc
	.section	.text.notify_heap_alloc_failed,"ax",%progbits
	.align	1
	.weak	notify_heap_alloc_failed
	.code	16
	.thumb_func
	.type	notify_heap_alloc_failed, %function
notify_heap_alloc_failed:
.LFB4:
	.loc 1 73 0
.LVL4:
.L8:
	b	.L8
.LFE4:
	.size	notify_heap_alloc_failed, .-notify_heap_alloc_failed
	.section	.text.heap_init,"ax",%progbits
	.align	1
	.global	heap_init
	.code	16
	.thumb_func
	.type	heap_init, %function
heap_init:
.LFB5:
	.loc 1 120 0
.LVL5:
	.loc 1 120 0
	push	{r3, lr}
.LCFI0:
	.loc 1 121 0
	bl	bitmap_heap_init
.LVL6:
	.loc 1 122 0
	@ sp needed
	pop	{r3, pc}
.LFE5:
	.size	heap_init, .-heap_init
	.section	.text.heap_block_size,"ax",%progbits
	.align	1
	.global	heap_block_size
	.code	16
	.thumb_func
	.type	heap_block_size, %function
heap_block_size:
.LFB6:
	.loc 1 128 0
	push	{r3, lr}
.LCFI1:
	.loc 1 129 0
	bl	bitmap_heap_block_size
.LVL7:
	.loc 1 130 0
	@ sp needed
	pop	{r3, pc}
.LFE6:
	.size	heap_block_size, .-heap_block_size
	.section	.text.heap_blocks_allocated,"ax",%progbits
	.align	1
	.global	heap_blocks_allocated
	.code	16
	.thumb_func
	.type	heap_blocks_allocated, %function
heap_blocks_allocated:
.LFB7:
	.loc 1 136 0
	push	{r3, lr}
.LCFI2:
	.loc 1 137 0
	bl	bitmap_heap_blocks_allocated
.LVL8:
	.loc 1 138 0
	@ sp needed
	pop	{r3, pc}
.LFE7:
	.size	heap_blocks_allocated, .-heap_blocks_allocated
	.section	.text.heap_bytes_used,"ax",%progbits
	.align	1
	.global	heap_bytes_used
	.code	16
	.thumb_func
	.type	heap_bytes_used, %function
heap_bytes_used:
.LFB8:
	.loc 1 141 0
	push	{r3, lr}
.LCFI3:
	.loc 1 142 0
	bl	bitmap_heap_bytes_used
.LVL9:
	.loc 1 143 0
	@ sp needed
	pop	{r3, pc}
.LFE8:
	.size	heap_bytes_used, .-heap_bytes_used
	.section	.text.heap_bytes_free,"ax",%progbits
	.align	1
	.global	heap_bytes_free
	.code	16
	.thumb_func
	.type	heap_bytes_free, %function
heap_bytes_free:
.LFB9:
	.loc 1 146 0
	push	{r3, lr}
.LCFI4:
	.loc 1 147 0
	bl	bitmap_heap_bytes_free
.LVL10:
	.loc 1 148 0
	@ sp needed
	pop	{r3, pc}
.LFE9:
	.size	heap_bytes_free, .-heap_bytes_free
	.section	.text.heap_sizeof,"ax",%progbits
	.align	1
	.global	heap_sizeof
	.code	16
	.thumb_func
	.type	heap_sizeof, %function
heap_sizeof:
.LFB10:
	.loc 1 152 0
.LVL11:
	push	{r3, lr}
.LCFI5:
	.loc 1 153 0
	bl	bitmap_heap_sizeof
.LVL12:
	.loc 1 154 0
	@ sp needed
	pop	{r3, pc}
.LFE10:
	.size	heap_sizeof, .-heap_sizeof
	.section	.text.malloc,"ax",%progbits
	.align	1
	.global	malloc
	.code	16
	.thumb_func
	.type	malloc, %function
malloc:
.LFB11:
	.loc 1 161 0
.LVL13:
	push	{r3, lr}
.LCFI6:
	.loc 1 162 0
	bl	bitmap_heap_malloc
.LVL14:
	.loc 1 163 0
	@ sp needed
	pop	{r3, pc}
.LFE11:
	.size	malloc, .-malloc
	.section	.text.realloc,"ax",%progbits
	.align	1
	.global	realloc
	.code	16
	.thumb_func
	.type	realloc, %function
realloc:
.LFB12:
	.loc 1 173 0
.LVL15:
	push	{r3, lr}
.LCFI7:
	.loc 1 174 0
	bl	bitmap_heap_realloc
.LVL16:
	.loc 1 175 0
	@ sp needed
	pop	{r3, pc}
.LFE12:
	.size	realloc, .-realloc
	.section	.text.calloc,"ax",%progbits
	.align	1
	.global	calloc
	.code	16
	.thumb_func
	.type	calloc, %function
calloc:
.LFB13:
	.loc 1 183 0
.LVL17:
	push	{r3, lr}
.LCFI8:
	.loc 1 184 0
	bl	bitmap_heap_calloc
.LVL18:
	.loc 1 185 0
	@ sp needed
	pop	{r3, pc}
.LFE13:
	.size	calloc, .-calloc
	.section	.text.free,"ax",%progbits
	.align	1
	.global	free
	.code	16
	.thumb_func
	.type	free, %function
free:
.LFB14:
	.loc 1 193 0
.LVL19:
	push	{r3, lr}
.LCFI9:
	.loc 1 194 0
	bl	bitmap_heap_free
.LVL20:
	.loc 1 195 0
	@ sp needed
	pop	{r3, pc}
.LFE14:
	.size	free, .-free
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
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI0-.LFB5
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI1-.LFB6
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI2-.LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI3-.LFB8
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI4-.LFB9
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI5-.LFB10
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI6-.LFB11
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI7-.LFB12
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.byte	0x4
	.4byte	.LCFI8-.LFB13
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI9-.LFB14
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE28:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 4 "../../../../include/caribou/lib/bitmap_heap.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x42d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x1
	.4byte	.LASF43
	.4byte	.LASF44
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
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x14
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x16
	.4byte	0x57
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
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
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb8
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1e
	.4byte	0x33
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x28
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdb
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x28
	.4byte	0x33
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0x32
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfe
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x32
	.4byte	0x73
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0x3d
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12e
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3d
	.4byte	0x73
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3d
	.4byte	0x8a
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x48
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x151
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x48
	.4byte	0x8a
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0x77
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19d
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x1
	.byte	0x77
	.4byte	0x73
	.4byte	.LLST0
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x1
	.byte	0x77
	.4byte	0x73
	.4byte	.LLST1
	.uleb128 0x9
	.4byte	.LVL6
	.4byte	0x371
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x7f
	.4byte	0x33
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1c0
	.uleb128 0xc
	.4byte	.LVL7
	.4byte	0x387
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x1
	.byte	0x87
	.4byte	0x33
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e3
	.uleb128 0xc
	.4byte	.LVL8
	.4byte	0x392
	.byte	0
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1
	.byte	0x8c
	.4byte	0x4c
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x206
	.uleb128 0xc
	.4byte	.LVL9
	.4byte	0x3a3
	.byte	0
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0x91
	.4byte	0x4c
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x229
	.uleb128 0xc
	.4byte	.LVL10
	.4byte	0x3b4
	.byte	0
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x1
	.byte	0x97
	.4byte	0x8a
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x261
	.uleb128 0xd
	.ascii	"p\000"
	.byte	0x1
	.byte	0x97
	.4byte	0x73
	.4byte	.LLST2
	.uleb128 0x9
	.4byte	.LVL12
	.4byte	0x3c5
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x1
	.byte	0xa0
	.4byte	0x73
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29b
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa0
	.4byte	0x8a
	.4byte	.LLST3
	.uleb128 0x9
	.4byte	.LVL14
	.4byte	0x3da
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x1
	.byte	0xac
	.4byte	0x73
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2eb
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x1
	.byte	0xac
	.4byte	0x73
	.4byte	.LLST4
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0xac
	.4byte	0x8a
	.4byte	.LLST5
	.uleb128 0x9
	.4byte	.LVL16
	.4byte	0x3ef
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x1
	.byte	0xb6
	.4byte	0x73
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x33b
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x1
	.byte	0xb6
	.4byte	0x8a
	.4byte	.LLST6
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb6
	.4byte	0x8a
	.4byte	.LLST7
	.uleb128 0x9
	.4byte	.LVL18
	.4byte	0x409
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x1
	.byte	0xc0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x371
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x1
	.byte	0xc0
	.4byte	0x73
	.4byte	.LLST8
	.uleb128 0x9
	.4byte	.LVL20
	.4byte	0x423
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF34
	.byte	0x4
	.byte	0x34
	.4byte	0x387
	.uleb128 0xf
	.4byte	0x73
	.uleb128 0xf
	.4byte	0x73
	.byte	0
	.uleb128 0x10
	.4byte	.LASF45
	.byte	0x4
	.byte	0x35
	.4byte	0x33
	.uleb128 0x11
	.4byte	.LASF35
	.byte	0x4
	.byte	0x36
	.4byte	0x33
	.4byte	0x3a3
	.uleb128 0x12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF36
	.byte	0x4
	.byte	0x37
	.4byte	0x4c
	.4byte	0x3b4
	.uleb128 0x12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF37
	.byte	0x4
	.byte	0x38
	.4byte	0x4c
	.4byte	0x3c5
	.uleb128 0x12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF38
	.byte	0x4
	.byte	0x39
	.4byte	0x8a
	.4byte	0x3da
	.uleb128 0xf
	.4byte	0x73
	.byte	0
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x4
	.byte	0x2f
	.4byte	0x73
	.4byte	0x3ef
	.uleb128 0xf
	.4byte	0x8a
	.byte	0
	.uleb128 0x13
	.4byte	.LASF40
	.byte	0x4
	.byte	0x30
	.4byte	0x73
	.4byte	0x409
	.uleb128 0xf
	.4byte	0x73
	.uleb128 0xf
	.4byte	0x8a
	.byte	0
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x4
	.byte	0x31
	.4byte	0x73
	.4byte	0x423
	.uleb128 0xf
	.4byte	0x8a
	.uleb128 0xf
	.4byte	0x8a
	.byte	0
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0x4
	.byte	0x32
	.uleb128 0xf
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
	.uleb128 0x9
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.4byte	.LVL5
	.4byte	.LVL6-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL6-1
	.4byte	.LFE5
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL5
	.4byte	.LVL6-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL6-1
	.4byte	.LFE5
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-1
	.4byte	.LFE10
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL13
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL14-1
	.4byte	.LFE11
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL15
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL16-1
	.4byte	.LFE12
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL15
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL16-1
	.4byte	.LFE12
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18-1
	.4byte	.LFE13
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL18-1
	.4byte	.LFE13
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL19
	.4byte	.LVL20-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-1
	.4byte	.LFE14
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x8c
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
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
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
	.4byte	.LFB10
	.4byte	.LFE10
	.4byte	.LFB11
	.4byte	.LFE11
	.4byte	.LFB12
	.4byte	.LFE12
	.4byte	.LFB13
	.4byte	.LFE13
	.4byte	.LFB14
	.4byte	.LFE14
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF22:
	.ascii	"heap_base\000"
.LASF2:
	.ascii	"short int\000"
.LASF12:
	.ascii	"size_t\000"
.LASF29:
	.ascii	"malloc\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF36:
	.ascii	"bitmap_heap_bytes_used\000"
.LASF44:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF16:
	.ascii	"notify_heap_invalid_dealloc\000"
.LASF41:
	.ascii	"bitmap_heap_calloc\000"
.LASF28:
	.ascii	"heap_sizeof\000"
.LASF43:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/heap.c\000"
.LASF18:
	.ascii	"notify_heap_invalid_realloc\000"
.LASF33:
	.ascii	"free\000"
.LASF46:
	.ascii	"bitmap_heap_free\000"
.LASF13:
	.ascii	"notify_heap_alloc\000"
.LASF7:
	.ascii	"long long int\000"
.LASF37:
	.ascii	"bitmap_heap_bytes_free\000"
.LASF9:
	.ascii	"long int\000"
.LASF26:
	.ascii	"heap_bytes_used\000"
.LASF24:
	.ascii	"heap_block_size\000"
.LASF25:
	.ascii	"heap_blocks_allocated\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"heap_end\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF39:
	.ascii	"bitmap_heap_malloc\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF38:
	.ascii	"bitmap_heap_sizeof\000"
.LASF27:
	.ascii	"heap_bytes_free\000"
.LASF10:
	.ascii	"char\000"
.LASF34:
	.ascii	"bitmap_heap_init\000"
.LASF45:
	.ascii	"bitmap_heap_block_size\000"
.LASF5:
	.ascii	"int32_t\000"
.LASF32:
	.ascii	"nmemb\000"
.LASF31:
	.ascii	"calloc\000"
.LASF4:
	.ascii	"int16_t\000"
.LASF40:
	.ascii	"bitmap_heap_realloc\000"
.LASF30:
	.ascii	"realloc\000"
.LASF42:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF21:
	.ascii	"heap_init\000"
.LASF14:
	.ascii	"notify_heap_dealloc\000"
.LASF20:
	.ascii	"notify_heap_alloc_failed\000"
.LASF19:
	.ascii	"size\000"
.LASF17:
	.ascii	"pointer\000"
.LASF15:
	.ascii	"blocks\000"
.LASF35:
	.ascii	"bitmap_heap_blocks_allocated\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
