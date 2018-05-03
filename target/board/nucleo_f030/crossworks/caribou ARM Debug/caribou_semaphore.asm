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
	.file	"semaphore.c"
	.text
.Ltext0:
	.section	.text.caribou_semaphore_new,"ax",%progbits
	.align	2
	.global	caribou_semaphore_new
	.code	16
	.thumb_func
	.type	caribou_semaphore_new, %function
caribou_semaphore_new:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/semaphore.c"
	.loc 1 28 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 29 0
	movs	r0, #4
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 30 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	beq	.L2
	.loc 1 32 0
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #4]
	str	r2, [r3]
.L2:
	.loc 1 34 0
	ldr	r3, [r7, #12]
	.loc 1 35 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	caribou_semaphore_new, .-caribou_semaphore_new
	.section	.text.caribou_semaphore_delete,"ax",%progbits
	.align	2
	.global	caribou_semaphore_delete
	.code	16
	.thumb_func
	.type	caribou_semaphore_delete, %function
caribou_semaphore_delete:
.LFB33:
	.loc 1 38 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 39 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L6
	.loc 1 41 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
.L6:
	.loc 1 43 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	caribou_semaphore_delete, .-caribou_semaphore_delete
	.section	.text.caribou_semaphore_init,"ax",%progbits
	.align	2
	.global	caribou_semaphore_init
	.code	16
	.thumb_func
	.type	caribou_semaphore_init, %function
caribou_semaphore_init:
.LFB34:
	.loc 1 46 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 47 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 48 0
	ldr	r3, [r7, #4]
	ldr	r2, [r7]
	str	r2, [r3]
	.loc 1 49 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 50 0
	ldr	r3, [r7, #4]
	.loc 1 51 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	caribou_semaphore_init, .-caribou_semaphore_init
	.section	.text.caribou_semaphore_signal,"ax",%progbits
	.align	2
	.global	caribou_semaphore_signal
	.code	16
	.thumb_func
	.type	caribou_semaphore_signal, %function
caribou_semaphore_signal:
.LFB35:
	.loc 1 59 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 60 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 61 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 62 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 63 0
	movs	r3, #1
	.loc 1 64 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	caribou_semaphore_signal, .-caribou_semaphore_signal
	.section	.text.caribou_semaphore_wait,"ax",%progbits
	.align	2
	.global	caribou_semaphore_wait
	.code	16
	.thumb_func
	.type	caribou_semaphore_wait, %function
caribou_semaphore_wait:
.LFB36:
	.loc 1 72 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
.LCFI12:
	sub	sp, sp, #36
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #12]
	str	r2, [r7]
	str	r3, [r7, #4]
	.loc 1 73 0
	movs	r3, #31
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 74 0
	bl	caribou_timer_ticks
	movs	r3, r0
	movs	r4, r1
	str	r3, [r7, #16]
	str	r4, [r7, #20]
	.loc 1 75 0
	b	.L12
.L15:
	.loc 1 77 0
	ldr	r3, [r7]
	ldr	r4, [r7, #4]
	ldr	r0, [r7, #16]
	ldr	r1, [r7, #20]
	movs	r2, r3
	movs	r3, r4
	bl	caribou_timer_ticks_timeout
	subs	r3, r0, #0
	beq	.L13
	.loc 1 79 0
	movs	r3, #31
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 80 0
	b	.L14
.L13:
	.loc 1 82 0
	bl	caribou_thread_yield
.L12:
	.loc 1 75 0
	movs	r3, #31
	adds	r4, r7, r3
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	caribou_semaphore_try_wait
	movs	r3, r0
	strb	r3, [r4]
	movs	r3, #31
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L15
.L14:
	.loc 1 84 0
	movs	r3, #31
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 85 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r7, pc}
.LFE36:
	.size	caribou_semaphore_wait, .-caribou_semaphore_wait
	.section	.text.caribou_semaphore_try_wait,"ax",%progbits
	.align	2
	.global	caribou_semaphore_try_wait
	.code	16
	.thumb_func
	.type	caribou_semaphore_try_wait, %function
caribou_semaphore_try_wait:
.LFB37:
	.loc 1 93 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	str	r0, [r7, #4]
	.loc 1 94 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
	.loc 1 95 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 96 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L18
	.loc 1 98 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	subs	r2, r3, #1
	ldr	r3, [r7, #4]
	str	r2, [r3]
	.loc 1 99 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
.L18:
	.loc 1 101 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 102 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 103 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	caribou_semaphore_try_wait, .-caribou_semaphore_try_wait
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0x18
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
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x30
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
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../../include/caribou/lib/semaphore.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x208
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0xc
	.4byte	.LASF24
	.4byte	.LASF25
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
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x23
	.4byte	0x5a
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
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
	.4byte	.LASF26
	.byte	0x4
	.byte	0x3
	.byte	0x1b
	.4byte	0x96
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x3
	.byte	0x1d
	.4byte	0x41
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x1e
	.4byte	0x7d
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1b
	.4byte	0xd7
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xd7
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1d
	.4byte	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x96
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x25
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x101
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x25
	.4byte	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x2d
	.4byte	0xd7
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x145
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x2d
	.4byte	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x2d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x2f
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3a
	.4byte	0x6f
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x17b
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3a
	.4byte	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x3c
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x47
	.4byte	0x6f
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1cc
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x47
	.4byte	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0x47
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xc
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4a
	.4byte	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x5c
	.4byte	0x6f
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x5c
	.4byte	0xd7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xc
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x5e
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x5f
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xb7
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x20c
	.4byte	0xa1
	.ascii	"caribou_semaphore_new\000"
	.4byte	0xdd
	.ascii	"caribou_semaphore_delete\000"
	.4byte	0x101
	.ascii	"caribou_semaphore_init\000"
	.4byte	0x145
	.ascii	"caribou_semaphore_signal\000"
	.4byte	0x17b
	.ascii	"caribou_semaphore_wait\000"
	.4byte	0x1cc
	.ascii	"caribou_semaphore_try_wait\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xfb
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x20c
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
	.4byte	0x5a
	.ascii	"long long int\000"
	.4byte	0x4f
	.ascii	"int64_t\000"
	.4byte	0x61
	.ascii	"long long unsigned int\000"
	.4byte	0x68
	.ascii	"long int\000"
	.4byte	0x6f
	.ascii	"char\000"
	.4byte	0x76
	.ascii	"sizetype\000"
	.4byte	0x7d
	.ascii	"_caribou_semaphore_t\000"
	.4byte	0x96
	.ascii	"caribou_semaphore_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF24:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/semaphore.c\000"
.LASF17:
	.ascii	"caribou_semaphore_signal\000"
.LASF16:
	.ascii	"state\000"
.LASF20:
	.ascii	"start\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF19:
	.ascii	"timeout\000"
.LASF22:
	.ascii	"caribou_semaphore_try_wait\000"
.LASF18:
	.ascii	"caribou_semaphore_wait\000"
.LASF12:
	.ascii	"count\000"
.LASF7:
	.ascii	"long int\000"
.LASF2:
	.ascii	"short int\000"
.LASF25:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF15:
	.ascii	"caribou_semaphore_init\000"
.LASF13:
	.ascii	"semaphore\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"int64_t\000"
.LASF0:
	.ascii	"signed char\000"
.LASF14:
	.ascii	"caribou_semaphore_new\000"
.LASF11:
	.ascii	"caribou_semaphore_t\000"
.LASF21:
	.ascii	"caribou_semaphore_delete\000"
.LASF23:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF26:
	.ascii	"_caribou_semaphore_t\000"
.LASF8:
	.ascii	"char\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
