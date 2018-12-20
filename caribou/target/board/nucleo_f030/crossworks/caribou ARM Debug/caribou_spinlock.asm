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
	.file	"spinlock.c"
	.text
.Ltext0:
	.section	.text.caribou_spinlock_init,"ax",%progbits
	.align	2
	.global	caribou_spinlock_init
	.code	16
	.thumb_func
	.type	caribou_spinlock_init, %function
caribou_spinlock_init:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/lib/spinlock.c"
	.loc 1 25 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 26 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3]
	.loc 1 27 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	caribou_spinlock_init, .-caribou_spinlock_init
	.section	.text.caribou_spinlock_lock,"ax",%progbits
	.align	2
	.global	caribou_spinlock_lock
	.code	16
	.thumb_func
	.type	caribou_spinlock_lock, %function
caribou_spinlock_lock:
.LFB33:
	.loc 1 31 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 32 0
	b	.L3
.L4:
	.loc 1 33 0
	bl	caribou_thread_yield
.L3:
	.loc 1 32 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	caribou_spinlock_trylock
	subs	r3, r0, #0
	beq	.L4
	.loc 1 34 0
	movs	r3, #1
	.loc 1 35 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	caribou_spinlock_lock, .-caribou_spinlock_lock
	.section	.text.caribou_spinlock_trylock,"ax",%progbits
	.align	2
	.global	caribou_spinlock_trylock
	.code	16
	.thumb_func
	.type	caribou_spinlock_trylock, %function
caribou_spinlock_trylock:
.LFB34:
	.loc 1 39 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #16
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 41 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 42 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	movs	r3, #11
	adds	r3, r7, r3
	strb	r2, [r3]
	.loc 1 43 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L7
	.loc 1 44 0
	bl	caribou_thread_current
	movs	r2, r0
	ldr	r3, [r7, #4]
	str	r2, [r3]
.L7:
	.loc 1 45 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 46 0
	movs	r3, #11
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 47 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	caribou_spinlock_trylock, .-caribou_spinlock_trylock
	.section	.text.caribou_spinlock_unlock,"ax",%progbits
	.align	2
	.global	caribou_spinlock_unlock
	.code	16
	.thumb_func
	.type	caribou_spinlock_unlock, %function
caribou_spinlock_unlock:
.LFB35:
	.loc 1 51 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #16
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	.loc 1 52 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	.loc 1 53 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 54 0
	ldr	r3, [r7, #4]
	movs	r2, #1
	str	r2, [r3]
	.loc 1 55 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 56 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 57 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	caribou_spinlock_unlock, .-caribou_spinlock_unlock
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../../include/caribou/kernel/timer.h"
	.file 4 "../../../../include/caribou/lib/errno.h"
	.file 5 "../../../../include/caribou/kernel/thread.h"
	.file 6 "../../../../include/caribou/lib/spinlock.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x34b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0xc
	.4byte	.LASF49
	.4byte	.LASF50
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0xf
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x14
	.4byte	0x49
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x15
	.4byte	0x5b
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
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
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x24
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.uleb128 0x6
	.byte	0x4
	.4byte	0xaa
	.uleb128 0x7
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2f
	.4byte	0xc1
	.uleb128 0x8
	.4byte	0x94
	.4byte	0xda
	.uleb128 0x9
	.4byte	0x94
	.uleb128 0x9
	.4byte	0xda
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xe0
	.uleb128 0xa
	.4byte	.LASF25
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x1c
	.byte	0x3
	.byte	0x38
	.4byte	0x146
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x3
	.byte	0x3b
	.4byte	0x146
	.byte	0
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x3
	.byte	0x3d
	.4byte	0x146
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3f
	.4byte	0x14c
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x3
	.byte	0x41
	.4byte	0x94
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x3
	.byte	0x43
	.4byte	0x69
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x3
	.byte	0x45
	.4byte	0x69
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x3
	.byte	0x47
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xe5
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb6
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x3
	.byte	0x48
	.4byte	0xe5
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x108
	.4byte	0x62
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x48
	.byte	0x5
	.byte	0x1f
	.4byte	0x241
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x5
	.byte	0x22
	.4byte	0x241
	.byte	0
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x5
	.byte	0x25
	.4byte	0x241
	.byte	0x4
	.uleb128 0xe
	.ascii	"sp\000"
	.byte	0x5
	.byte	0x28
	.4byte	0x94
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x5
	.byte	0x2b
	.4byte	0x94
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x5
	.byte	0x2e
	.4byte	0x94
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x5
	.byte	0x31
	.4byte	0x94
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x5
	.byte	0x34
	.4byte	0x94
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x5
	.byte	0x37
	.4byte	0x50
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x5
	.byte	0x3a
	.4byte	0x3e
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3d
	.4byte	0xa4
	.byte	0x20
	.uleb128 0xe
	.ascii	"arg\000"
	.byte	0x5
	.byte	0x40
	.4byte	0x94
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x5
	.byte	0x43
	.4byte	0x82
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x5
	.byte	0x46
	.4byte	0x3e
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x5
	.byte	0x49
	.4byte	0x252
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x5
	.byte	0x4c
	.4byte	0x258
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4f
	.4byte	0x15d
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x5
	.byte	0x52
	.4byte	0x3e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x169
	.uleb128 0xf
	.4byte	0x252
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x247
	.uleb128 0x6
	.byte	0x4
	.4byte	0x152
	.uleb128 0x3
	.4byte	.LASF41
	.byte	0x5
	.byte	0x5f
	.4byte	0x169
	.uleb128 0x6
	.byte	0x4
	.4byte	0x25e
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x6
	.byte	0x1a
	.4byte	0x269
	.uleb128 0x10
	.4byte	.LASF46
	.byte	0x1
	.byte	0x18
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29e
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x18
	.4byte	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x26f
	.uleb128 0x12
	.4byte	.LASF44
	.byte	0x1
	.byte	0x1e
	.4byte	0x9d
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2cc
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x1e
	.4byte	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.byte	0x26
	.4byte	0x9d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30f
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x26
	.4byte	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x14
	.4byte	.LASF32
	.byte	0x1
	.byte	0x29
	.4byte	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF47
	.byte	0x1
	.byte	0x32
	.4byte	0x9d
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x32
	.4byte	0x29e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x9d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x14
	.4byte	.LASF32
	.byte	0x1
	.byte	0x35
	.4byte	0x62
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x16
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
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xf
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.4byte	0x7b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x34f
	.4byte	0x27a
	.ascii	"caribou_spinlock_init\000"
	.4byte	0x2a4
	.ascii	"caribou_spinlock_lock\000"
	.4byte	0x2cc
	.ascii	"caribou_spinlock_trylock\000"
	.4byte	0x30f
	.ascii	"caribou_spinlock_unlock\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x192
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x34f
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x49
	.ascii	"short int\000"
	.4byte	0x3e
	.ascii	"int16_t\000"
	.4byte	0x5b
	.ascii	"short unsigned int\000"
	.4byte	0x50
	.ascii	"uint16_t\000"
	.4byte	0x62
	.ascii	"int\000"
	.4byte	0x74
	.ascii	"unsigned int\000"
	.4byte	0x69
	.ascii	"uint32_t\000"
	.4byte	0x7b
	.ascii	"long long int\000"
	.4byte	0x8d
	.ascii	"long long unsigned int\000"
	.4byte	0x82
	.ascii	"uint64_t\000"
	.4byte	0x96
	.ascii	"long int\000"
	.4byte	0x9d
	.ascii	"char\000"
	.4byte	0xaf
	.ascii	"sizetype\000"
	.4byte	0xb6
	.ascii	"caribou_timer_callback_fn\000"
	.4byte	0xe5
	.ascii	"_caribou_timer_t\000"
	.4byte	0x152
	.ascii	"caribou_timer_t\000"
	.4byte	0x15d
	.ascii	"errno_t\000"
	.4byte	0x169
	.ascii	"_caribou_thread_t\000"
	.4byte	0x25e
	.ascii	"caribou_thread_t\000"
	.4byte	0x26f
	.ascii	"caribou_spinlock_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x34
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF50:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF40:
	.ascii	"sleep\000"
.LASF33:
	.ascii	"prio\000"
.LASF20:
	.ascii	"ticks\000"
.LASF17:
	.ascii	"next\000"
.LASF42:
	.ascii	"caribou_spinlock_t\000"
.LASF32:
	.ascii	"state\000"
.LASF44:
	.ascii	"caribou_spinlock_lock\000"
.LASF12:
	.ascii	"long int\000"
.LASF37:
	.ascii	"finishfn\000"
.LASF25:
	.ascii	"_caribou_timer_t\000"
.LASF10:
	.ascii	"uint64_t\000"
.LASF30:
	.ascii	"stack_top\000"
.LASF15:
	.ascii	"caribou_timer_callback_fn\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF35:
	.ascii	"runtime\000"
.LASF38:
	.ascii	"timer\000"
.LASF46:
	.ascii	"caribou_spinlock_init\000"
.LASF21:
	.ascii	"reloadticks\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF34:
	.ascii	"name\000"
.LASF31:
	.ascii	"stack_base\000"
.LASF23:
	.ascii	"caribou_timer_t\000"
.LASF29:
	.ascii	"stack_low\000"
.LASF48:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"flags\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF45:
	.ascii	"caribou_spinlock_trylock\000"
.LASF3:
	.ascii	"int16_t\000"
.LASF43:
	.ascii	"spinlock\000"
.LASF14:
	.ascii	"sizetype\000"
.LASF19:
	.ascii	"fnarg\000"
.LASF9:
	.ascii	"long long int\000"
.LASF13:
	.ascii	"char\000"
.LASF24:
	.ascii	"errno_t\000"
.LASF4:
	.ascii	"short int\000"
.LASF18:
	.ascii	"timerfn\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF39:
	.ascii	"__errno\000"
.LASF47:
	.ascii	"caribou_spinlock_unlock\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF49:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/l"
	.ascii	"ib/spinlock.c\000"
.LASF0:
	.ascii	"signed char\000"
.LASF41:
	.ascii	"caribou_thread_t\000"
.LASF36:
	.ascii	"lock\000"
.LASF28:
	.ascii	"stack_usage\000"
.LASF27:
	.ascii	"parent\000"
.LASF16:
	.ascii	"prev\000"
.LASF26:
	.ascii	"_caribou_thread_t\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
