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
	.file	"swi.c"
	.text
.Ltext0:
	.section	.text.rd_thread_stack_ptr,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	rd_thread_stack_ptr, %function
rd_thread_stack_ptr:
.LFB32:
	.file 1 "../../../cpu/arm/cortex-m0/cpu/cpu.h"
	.loc 1 111 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 112 0
	.syntax divided
@ 112 "../../../cpu/arm/cortex-m0/cpu/cpu.h" 1
	 mrs	r0, psp
 bx	lr

@ 0 "" 2
	.loc 1 114 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE32:
	.size	rd_thread_stack_ptr, .-rd_thread_stack_ptr
	.section	.text.rd_stack_ptr,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	rd_stack_ptr, %function
rd_stack_ptr:
.LFB33:
	.loc 1 118 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 119 0
	.syntax divided
@ 119 "../../../cpu/arm/cortex-m0/cpu/cpu.h" 1
	 mrs 	r0, msp
 bx	lr

@ 0 "" 2
	.loc 1 121 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE33:
	.size	rd_stack_ptr, .-rd_stack_ptr
	.section	.text.kcall,"ax",%progbits
	.align	2
	.global	kcall
	.code	16
	.thumb_func
	.type	kcall, %function
kcall:
.LFB34:
	.file 2 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/swi.c"
	.loc 2 34 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 2 36 0
	adds	r3, r7, #7
	ldrb	r2, [r3]
	ldr	r3, [r7]
	.syntax divided
@ 36 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/swi.c" 1
		mov		r4,r2			
   mov		r5,r3			
	svc		#0				
	mov		r3,r4			

@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [r7, #12]
	.loc 2 44 0
	ldr	r3, [r7, #12]
	.loc 2 45 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r7, pc}
.LFE34:
	.size	kcall, .-kcall
	.section	.text._swi,"ax",%progbits
	.align	2
	.global	_swi
	.code	16
	.thumb_func
	.type	_swi, %function
_swi:
.LFB35:
	.loc 2 51 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 55 0
	.syntax divided
@ 55 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/swi.c" 1
		push	{lr}			
	mov		r2,r4			
   mov		r3,r5			

@ 0 "" 2
	.thumb
	.syntax unified
	uxtb	r4, r2
	movs	r5, r3
	.loc 2 63 0
	movs	r1, r5
	movs	r0, r4
	bl	kcall_service
	movs	r5, r0
	.loc 2 65 0
	.syntax divided
@ 65 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/swi.c" 1
		mov		r4,r5			
   pop		{pc}			

@ 0 "" 2
	.loc 2 71 0
	.thumb
	.syntax unified
	nop
.LFE35:
	.size	_swi, .-_swi
	.section	.text._kcall_malloc,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_kcall_malloc, %function
_kcall_malloc:
.LFB36:
	.loc 2 74 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #16
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 2 75 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 2 76 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #8]
	.loc 2 77 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	movs	r0, r3
	bl	malloc
	movs	r2, r0
	ldr	r3, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L7
	.loc 2 78 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
.L7:
	.loc 2 79 0
	ldr	r3, [r7, #12]
	.loc 2 80 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	_kcall_malloc, .-_kcall_malloc
	.section	.text._kcall_calloc,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_kcall_calloc, %function
_kcall_calloc:
.LFB37:
	.loc 2 83 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 2 84 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 2 85 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #8]
	.loc 2 86 0
	ldr	r3, [r7, #8]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	calloc
	movs	r2, r0
	ldr	r3, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L10
	.loc 2 87 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
.L10:
	.loc 2 88 0
	ldr	r3, [r7, #12]
	.loc 2 89 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	_kcall_calloc, .-_kcall_calloc
	.section	.text._kcall_realloc,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_kcall_realloc, %function
_kcall_realloc:
.LFB38:
	.loc 2 92 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 2 93 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 2 94 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #8]
	.loc 2 95 0
	ldr	r3, [r7, #8]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #4]
	movs	r1, r3
	movs	r0, r2
	bl	realloc
	movs	r2, r0
	ldr	r3, [r7, #8]
	str	r2, [r3, #8]
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L13
	.loc 2 96 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
.L13:
	.loc 2 97 0
	ldr	r3, [r7, #12]
	.loc 2 98 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	_kcall_realloc, .-_kcall_realloc
	.section	.text._kcall_free,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	_kcall_free, %function
_kcall_free:
.LFB39:
	.loc 2 101 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #16
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
	.loc 2 102 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 2 103 0
	ldr	r3, [r7, #4]
	str	r3, [r7, #8]
	.loc 2 104 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L16
	.loc 2 106 0
	ldr	r3, [r7, #8]
	ldr	r3, [r3, #8]
	movs	r0, r3
	bl	free
	.loc 2 107 0
	ldr	r3, [r7, #8]
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 2 108 0
	ldr	r3, [r7, #8]
	movs	r2, #0
	str	r2, [r3, #4]
	b	.L17
.L16:
	.loc 2 111 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
.L17:
	.loc 2 112 0
	ldr	r3, [r7, #12]
	.loc 2 113 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	_kcall_free, .-_kcall_free
	.section	.text.kcall_service,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	kcall_service, %function
kcall_service:
.LFB40:
	.loc 2 116 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 2 117 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
	.loc 2 118 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #4
	bhi	.L20
	lsls	r2, r3, #2
	ldr	r3, .L29
	adds	r3, r2, r3
	ldr	r3, [r3]
	mov	pc, r3
	.section	.rodata.kcall_service,"a",%progbits
	.align	2
.L22:
	.word	.L21
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L26
	.section	.text.kcall_service
.L21:
	.loc 2 120 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L27
.L23:
	.loc 2 121 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	_kcall_malloc
	movs	r3, r0
	str	r3, [r7, #12]
	b	.L27
.L24:
	.loc 2 122 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	_kcall_calloc
	movs	r3, r0
	str	r3, [r7, #12]
	b	.L27
.L25:
	.loc 2 123 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	_kcall_realloc
	movs	r3, r0
	str	r3, [r7, #12]
	b	.L27
.L26:
	.loc 2 124 0
	ldr	r3, [r7]
	movs	r0, r3
	bl	_kcall_free
	movs	r3, r0
	str	r3, [r7, #12]
	b	.L27
.L20:
	.loc 2 125 0
	movs	r3, #1
	rsbs	r3, r3, #0
	str	r3, [r7, #12]
	nop
.L27:
	.loc 2 127 0
	ldr	r3, [r7, #12]
	.loc 2 128 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	.L22
.LFE40:
	.size	kcall_service, .-kcall_service
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI0-.LFB34
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
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
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
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI3-.LFB36
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI6-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
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
	.4byte	.LCFI9-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
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
	.4byte	.LCFI12-.LFB39
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
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI15-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.file 4 "../../../../include/caribou/kernel/swi.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2dd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0xc
	.4byte	.LASF28
	.4byte	.LASF29
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x3
	.byte	0x16
	.4byte	0x48
	.uleb128 0x6
	.byte	0x1
	.4byte	0x2c
	.byte	0x4
	.byte	0x1b
	.4byte	0xaa
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x2
	.uleb128 0x7
	.4byte	.LASF13
	.byte	0x3
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x21
	.4byte	0x7f
	.uleb128 0x8
	.byte	0xc
	.byte	0x4
	.byte	0x26
	.4byte	0xe2
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x4
	.byte	0x28
	.4byte	0x74
	.byte	0
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.byte	0x29
	.4byte	0x74
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x4
	.byte	0x2a
	.4byte	0x5d
	.byte	0x8
	.byte	0
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x4
	.byte	0x2b
	.4byte	0xb5
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x6e
	.4byte	0x5d
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x75
	.4byte	0x5d
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x2
	.byte	0x21
	.4byte	0x41
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x159
	.uleb128 0xc
	.ascii	"fn\000"
	.byte	0x2
	.byte	0x21
	.4byte	0xaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x21
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x23
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x2
	.byte	0x32
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x194
	.uleb128 0xd
	.ascii	"fn\000"
	.byte	0x2
	.byte	0x34
	.4byte	0xaa
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xd
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x35
	.4byte	0x5d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x36
	.4byte	0x41
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0xf
	.4byte	.LASF23
	.byte	0x2
	.byte	0x49
	.4byte	0x41
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1d6
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x49
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x4b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.ascii	"mc\000"
	.byte	0x2
	.byte	0x4c
	.4byte	0x1d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.4byte	0xe2
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x2
	.byte	0x52
	.4byte	0x41
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21e
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x52
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x54
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.ascii	"mc\000"
	.byte	0x2
	.byte	0x55
	.4byte	0x1d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x2
	.byte	0x5b
	.4byte	0x41
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x260
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x5b
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x5d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.ascii	"mc\000"
	.byte	0x2
	.byte	0x5e
	.4byte	0x1d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xf
	.4byte	.LASF26
	.byte	0x2
	.byte	0x64
	.4byte	0x41
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a2
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x64
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x66
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.ascii	"mc\000"
	.byte	0x2
	.byte	0x67
	.4byte	0x1d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x11
	.4byte	.LASF32
	.byte	0x2
	.byte	0x73
	.4byte	0x41
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.ascii	"fn\000"
	.byte	0x2
	.byte	0x73
	.4byte	0xaa
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x2
	.byte	0x73
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x75
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x11c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2e1
	.4byte	0x8b
	.ascii	"CARIBOU_KCALL_NOP\000"
	.4byte	0x91
	.ascii	"CARIBOU_KCALL_MALLOC\000"
	.4byte	0x97
	.ascii	"CARIBOU_KCALL_CALLOC\000"
	.4byte	0x9d
	.ascii	"CARIBOU_KCALL_REALLOC\000"
	.4byte	0xa3
	.ascii	"CARIBOU_KCALL_FREE\000"
	.4byte	0xed
	.ascii	"rd_thread_stack_ptr\000"
	.4byte	0x102
	.ascii	"rd_stack_ptr\000"
	.4byte	0x117
	.ascii	"kcall\000"
	.4byte	0x159
	.ascii	"_swi\000"
	.4byte	0x194
	.ascii	"_kcall_malloc\000"
	.4byte	0x1dc
	.ascii	"_kcall_calloc\000"
	.4byte	0x21e
	.ascii	"_kcall_realloc\000"
	.4byte	0x260
	.ascii	"_kcall_free\000"
	.4byte	0x2a2
	.ascii	"kcall_service\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xe6
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2e1
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x3a
	.ascii	"short unsigned int\000"
	.4byte	0x41
	.ascii	"int\000"
	.4byte	0x48
	.ascii	"unsigned int\000"
	.4byte	0x4f
	.ascii	"long long int\000"
	.4byte	0x56
	.ascii	"long long unsigned int\000"
	.4byte	0x5f
	.ascii	"long int\000"
	.4byte	0x66
	.ascii	"char\000"
	.4byte	0x6d
	.ascii	"sizetype\000"
	.4byte	0x74
	.ascii	"size_t\000"
	.4byte	0xaa
	.ascii	"kcall_t\000"
	.4byte	0xe2
	.ascii	"kcall_heap_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x5c
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
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF19:
	.ascii	"memp\000"
.LASF14:
	.ascii	"CARIBOU_KCALL_FREE\000"
.LASF15:
	.ascii	"size_t\000"
.LASF23:
	.ascii	"_kcall_malloc\000"
.LASF31:
	.ascii	"_swi\000"
.LASF17:
	.ascii	"nmemb\000"
.LASF26:
	.ascii	"_kcall_free\000"
.LASF13:
	.ascii	"CARIBOU_KCALL_REALLOC\000"
.LASF32:
	.ascii	"kcall_service\000"
.LASF18:
	.ascii	"size\000"
.LASF22:
	.ascii	"rd_stack_ptr\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF12:
	.ascii	"CARIBOU_KCALL_CALLOC\000"
.LASF11:
	.ascii	"CARIBOU_KCALL_MALLOC\000"
.LASF21:
	.ascii	"rd_thread_stack_ptr\000"
.LASF30:
	.ascii	"kcall\000"
.LASF27:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF25:
	.ascii	"_kcall_realloc\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"char\000"
.LASF2:
	.ascii	"short int\000"
.LASF20:
	.ascii	"kcall_heap_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF29:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF24:
	.ascii	"_kcall_calloc\000"
.LASF0:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"kcall_t\000"
.LASF10:
	.ascii	"CARIBOU_KCALL_NOP\000"
.LASF28:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/k"
	.ascii	"ernel/swi.c\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
