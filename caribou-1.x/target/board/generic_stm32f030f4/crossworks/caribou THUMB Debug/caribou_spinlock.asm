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
	.file	"spinlock.c"
	.text
.Ltext0:
	.section	.text.caribou_spinlock_init,"ax",%progbits
	.align	1
	.global	caribou_spinlock_init
	.code	16
	.thumb_func
	.type	caribou_spinlock_init, %function
caribou_spinlock_init:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/spinlock.c"
	.loc 1 25 0
.LVL0:
	.loc 1 26 0
	mov	r3, #1
	str	r3, [r0]
	.loc 1 27 0
	@ sp needed
	bx	lr
.LFE32:
	.size	caribou_spinlock_init, .-caribou_spinlock_init
	.section	.text.caribou_spinlock_trylock,"ax",%progbits
	.align	1
	.global	caribou_spinlock_trylock
	.code	16
	.thumb_func
	.type	caribou_spinlock_trylock, %function
caribou_spinlock_trylock:
.LFB34:
	.loc 1 39 0
.LVL1:
	push	{r4, r5, r6, lr}
.LCFI0:
	.loc 1 39 0
	mov	r5, r0
	.loc 1 41 0
	bl	chip_interrupts_disable
.LVL2:
	.loc 1 42 0
	ldr	r4, [r5]
	.loc 1 41 0
	mov	r6, r0
.LVL3:
	.loc 1 42 0
	sub	r4, r4, #1
	neg	r3, r4
	adc	r4, r4, r3
	uxtb	r4, r4
.LVL4:
	.loc 1 43 0
	cmp	r4, #0
	beq	.L3
	.loc 1 44 0
	bl	caribou_thread_current
.LVL5:
	str	r0, [r5]
.L3:
	.loc 1 45 0
	mov	r0, r6
	bl	chip_interrupts_set
.LVL6:
	.loc 1 47 0
	@ sp needed
	mov	r0, r4
.LVL7:
.LVL8:
.LVL9:
	pop	{r4, r5, r6, pc}
.LFE34:
	.size	caribou_spinlock_trylock, .-caribou_spinlock_trylock
	.section	.text.caribou_spinlock_lock,"ax",%progbits
	.align	1
	.global	caribou_spinlock_lock
	.code	16
	.thumb_func
	.type	caribou_spinlock_lock, %function
caribou_spinlock_lock:
.LFB33:
	.loc 1 31 0
.LVL10:
	push	{r4, lr}
.LCFI1:
	mov	r4, r0
.LVL11:
.L9:
	.loc 1 32 0 discriminator 1
	mov	r0, r4
	bl	caribou_spinlock_trylock
.LVL12:
	cmp	r0, #0
	bne	.L11
	.loc 1 33 0
	bl	caribou_thread_yield
.LVL13:
	b	.L9
.L11:
	.loc 1 35 0
	mov	r0, #1
	@ sp needed
.LVL14:
	pop	{r4, pc}
.LFE33:
	.size	caribou_spinlock_lock, .-caribou_spinlock_lock
	.section	.text.caribou_spinlock_unlock,"ax",%progbits
	.align	1
	.global	caribou_spinlock_unlock
	.code	16
	.thumb_func
	.type	caribou_spinlock_unlock, %function
caribou_spinlock_unlock:
.LFB35:
	.loc 1 51 0
.LVL15:
	push	{r3, r4, r5, lr}
.LCFI2:
	.loc 1 51 0
	mov	r5, r0
	.loc 1 54 0
	mov	r4, #1
	.loc 1 53 0
	bl	chip_interrupts_disable
.LVL16:
	.loc 1 54 0
	str	r4, [r5]
	.loc 1 55 0
	bl	chip_interrupts_set
.LVL17:
	.loc 1 57 0
	@ sp needed
	mov	r0, r4
.LVL18:
	pop	{r3, r4, r5, pc}
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
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
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI2-.LFB35
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
.LEFDE6:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../../include/caribou/kernel/timer.h"
	.file 4 "../../../../include/caribou/lib/errno.h"
	.file 5 "../../../../include/caribou/kernel/thread.h"
	.file 6 "../../../../include/caribou/lib/spinlock.h"
	.file 7 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/chip.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3d1
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x1
	.4byte	.LASF50
	.4byte	.LASF51
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
	.byte	0x55
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
	.4byte	.LASF52
	.byte	0x1
	.byte	0x18
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29d
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x18
	.4byte	0x29d
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x26f
	.uleb128 0x12
	.4byte	.LASF44
	.byte	0x1
	.byte	0x26
	.4byte	0x9d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30b
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.byte	0x26
	.4byte	0x29d
	.4byte	.LLST0
	.uleb128 0x14
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x9d
	.4byte	.LLST1
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0x29
	.4byte	0x62
	.4byte	.LLST2
	.uleb128 0x16
	.4byte	.LVL2
	.4byte	0x3a6
	.uleb128 0x16
	.4byte	.LVL5
	.4byte	0x3b1
	.uleb128 0x17
	.4byte	.LVL6
	.4byte	0x3bc
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.byte	0x1e
	.4byte	0x9d
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x351
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.byte	0x1e
	.4byte	0x29d
	.4byte	.LLST3
	.uleb128 0x19
	.4byte	.LVL12
	.4byte	0x2a3
	.4byte	0x347
	.uleb128 0x18
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL13
	.4byte	0x3cd
	.byte	0
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x32
	.4byte	0x9d
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a6
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.byte	0x32
	.4byte	0x29d
	.4byte	.LLST4
	.uleb128 0x1a
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x34
	.4byte	0x9d
	.byte	0x1
	.uleb128 0x15
	.4byte	.LASF32
	.byte	0x1
	.byte	0x35
	.4byte	0x62
	.4byte	.LLST5
	.uleb128 0x16
	.4byte	.LVL16
	.4byte	0x3a6
	.uleb128 0x16
	.4byte	.LVL17
	.4byte	0x3bc
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF47
	.byte	0x7
	.byte	0x45
	.4byte	0x62
	.uleb128 0x1b
	.4byte	.LASF48
	.byte	0x5
	.byte	0xb8
	.4byte	0x269
	.uleb128 0x1c
	.4byte	.LASF53
	.byte	0x7
	.byte	0x47
	.4byte	0x3cd
	.uleb128 0x9
	.4byte	0x62
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF54
	.byte	0x5
	.byte	0xb4
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL2-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2-1
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL8
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL7
	.4byte	.LFE34
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5-1
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL14
	.4byte	.LFE33
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
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL18
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL16
	.4byte	.LVL17-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF40:
	.ascii	"sleep\000"
.LASF53:
	.ascii	"chip_interrupts_set\000"
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
.LASF45:
	.ascii	"caribou_spinlock_lock\000"
.LASF37:
	.ascii	"finishfn\000"
.LASF25:
	.ascii	"_caribou_timer_t\000"
.LASF10:
	.ascii	"uint64_t\000"
.LASF30:
	.ascii	"stack_top\000"
.LASF51:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF15:
	.ascii	"caribou_timer_callback_fn\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF35:
	.ascii	"runtime\000"
.LASF38:
	.ascii	"timer\000"
.LASF52:
	.ascii	"caribou_spinlock_init\000"
.LASF48:
	.ascii	"caribou_thread_current\000"
.LASF21:
	.ascii	"reloadticks\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF54:
	.ascii	"caribou_thread_yield\000"
.LASF49:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF34:
	.ascii	"name\000"
.LASF50:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/spinlock.c\000"
.LASF31:
	.ascii	"stack_base\000"
.LASF23:
	.ascii	"caribou_timer_t\000"
.LASF29:
	.ascii	"stack_low\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF22:
	.ascii	"flags\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF44:
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
.LASF47:
	.ascii	"chip_interrupts_disable\000"
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
.LASF46:
	.ascii	"caribou_spinlock_unlock\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF12:
	.ascii	"long int\000"
.LASF13:
	.ascii	"char\000"
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
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
