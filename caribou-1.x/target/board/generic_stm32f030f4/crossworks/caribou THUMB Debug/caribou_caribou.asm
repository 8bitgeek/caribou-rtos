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
	.file	"caribou.c"
	.text
.Ltext0:
	.section	.text.caribou_version,"ax",%progbits
	.align	1
	.global	caribou_version
	.code	16
	.thumb_func
	.type	caribou_version, %function
caribou_version:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/caribou.c"
	.loc 1 22 0
	.loc 1 24 0
	ldr	r0, .L2
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
.LFE32:
	.size	caribou_version, .-caribou_version
	.section	.text.caribou_lock_state,"ax",%progbits
	.align	1
	.global	caribou_lock_state
	.code	16
	.thumb_func
	.type	caribou_lock_state, %function
caribou_lock_state:
.LFB33:
	.loc 1 33 0
	push	{r3, lr}
.LCFI0:
	.loc 1 34 0
	bl	chip_systick_irq_state
.LVL0:
	.loc 1 35 0
	@ sp needed
	pop	{r3, pc}
.LFE33:
	.size	caribou_lock_state, .-caribou_lock_state
	.section	.text.caribou_lock,"ax",%progbits
	.align	1
	.global	caribou_lock
	.code	16
	.thumb_func
	.type	caribou_lock, %function
caribou_lock:
.LFB34:
	.loc 1 41 0
	push	{r3, lr}
.LCFI1:
	.loc 1 42 0
	bl	chip_systick_irq_disable
.LVL1:
	.loc 1 43 0
	@ sp needed
	pop	{r3, pc}
.LFE34:
	.size	caribou_lock, .-caribou_lock
	.section	.text.caribou_unlock,"ax",%progbits
	.align	1
	.global	caribou_unlock
	.code	16
	.thumb_func
	.type	caribou_unlock, %function
caribou_unlock:
.LFB35:
	.loc 1 49 0
	push	{r3, lr}
.LCFI2:
	.loc 1 50 0
	bl	chip_systick_irq_enable
.LVL2:
	.loc 1 51 0
	@ sp needed
	pop	{r3, pc}
.LFE35:
	.size	caribou_unlock, .-caribou_unlock
	.section	.text.caribou_lock_set,"ax",%progbits
	.align	1
	.global	caribou_lock_set
	.code	16
	.thumb_func
	.type	caribou_lock_set, %function
caribou_lock_set:
.LFB36:
	.loc 1 57 0
.LVL3:
	push	{r3, lr}
.LCFI3:
	.loc 1 58 0
	bl	chip_systick_irq_set
.LVL4:
	.loc 1 59 0
	@ sp needed
	pop	{r3, pc}
.LFE36:
	.size	caribou_lock_set, .-caribou_lock_set
	.section	.text.caribou_preempt,"ax",%progbits
	.align	1
	.global	caribou_preempt
	.code	16
	.thumb_func
	.type	caribou_preempt, %function
caribou_preempt:
.LFB37:
	.loc 1 65 0
	push	{r3, lr}
.LCFI4:
	.loc 1 66 0
	bl	chip_systick_irq_force
.LVL5:
	.loc 1 67 0
	@ sp needed
	pop	{r3, pc}
.LFE37:
	.size	caribou_preempt, .-caribou_preempt
	.section	.text.abort,"ax",%progbits
	.align	1
	.weak	abort
	.code	16
	.thumb_func
	.type	abort, %function
abort:
.LFB38:
	.loc 1 73 0
	push	{r3, lr}
.LCFI5:
	.loc 1 78 0
	bl	_halt
.LVL6:
	.loc 1 79 0
	@ sp needed
	pop	{r3, pc}
.LFE38:
	.size	abort, .-abort
	.section	.text.caribou_exec,"ax",%progbits
	.align	1
	.global	caribou_exec
	.code	16
	.thumb_func
	.type	caribou_exec, %function
caribou_exec:
.LFB39:
	.loc 1 89 0
	push	{r3, lr}
.LCFI6:
	.loc 1 90 0
	bl	caribou_thread_exec
.LVL7:
	.loc 1 91 0
	@ sp needed
	pop	{r3, pc}
.LFE39:
	.size	caribou_exec, .-caribou_exec
	.section	.text.caribou_init,"ax",%progbits
	.align	1
	.global	caribou_init
	.code	16
	.thumb_func
	.type	caribou_init, %function
caribou_init:
.LFB40:
	.loc 1 101 0
.LVL8:
	push	{r4, lr}
.LCFI7:
	.loc 1 101 0
	mov	r4, r0
	.loc 1 102 0
	bl	chip_interrupts_disable
.LVL9:
	.loc 1 103 0
	mov	r0, #1
	bl	chip_init
.LVL10:
	.loc 1 104 0
	mov	r0, r4
	bl	caribou_thread_init
.LVL11:
	.loc 1 106 0
	@ sp needed
	.loc 1 105 0
	bl	chip_interrupts_enable
.LVL12:
	.loc 1 106 0
	pop	{r4, pc}
.LFE40:
	.size	caribou_init, .-caribou_init
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"0.9.5\000"
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
	.byte	0x4
	.4byte	.LCFI0-.LFB33
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
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI1-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
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
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI4-.LFB37
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
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI5-.LFB38
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
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI6-.LFB39
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
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI7-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE16:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../../include/caribou/kernel/timer.h"
	.file 4 "../../../../include/caribou/lib/errno.h"
	.file 5 "../../../../include/caribou/kernel/thread.h"
	.file 6 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/chip.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x471
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x1
	.4byte	.LASF62
	.4byte	.LASF63
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0xe
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0xf
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0x14
	.4byte	0x54
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x2
	.byte	0x15
	.4byte	0x66
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF8
	.byte	0x2
	.byte	0x17
	.4byte	0x7f
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x2
	.byte	0x24
	.4byte	0x98
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x6
	.byte	0x4
	.4byte	0xb5
	.uleb128 0x7
	.4byte	0xa8
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2f
	.4byte	0xcc
	.uleb128 0x8
	.4byte	0x9f
	.4byte	0xe5
	.uleb128 0x9
	.4byte	0x9f
	.uleb128 0x9
	.4byte	0xe5
	.uleb128 0x9
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xeb
	.uleb128 0xa
	.4byte	.LASF26
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1c
	.byte	0x3
	.byte	0x38
	.4byte	0x151
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x3
	.byte	0x3b
	.4byte	0x151
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3d
	.4byte	0x151
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x3
	.byte	0x3f
	.4byte	0x157
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x3
	.byte	0x41
	.4byte	0x9f
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x3
	.byte	0x43
	.4byte	0x74
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x3
	.byte	0x45
	.4byte	0x74
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x3
	.byte	0x47
	.4byte	0x37
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xf0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc1
	.uleb128 0x2
	.4byte	.LASF24
	.byte	0x3
	.byte	0x48
	.4byte	0xf0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x108
	.4byte	0x6d
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x48
	.byte	0x5
	.byte	0x1f
	.4byte	0x24c
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x5
	.byte	0x22
	.4byte	0x24c
	.byte	0
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x5
	.byte	0x25
	.4byte	0x24c
	.byte	0x4
	.uleb128 0xe
	.ascii	"sp\000"
	.byte	0x5
	.byte	0x28
	.4byte	0x9f
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x5
	.byte	0x2b
	.4byte	0x9f
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x5
	.byte	0x2e
	.4byte	0x9f
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x5
	.byte	0x31
	.4byte	0x9f
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x5
	.byte	0x34
	.4byte	0x9f
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x5
	.byte	0x37
	.4byte	0x5b
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x5
	.byte	0x3a
	.4byte	0x49
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x5
	.byte	0x3d
	.4byte	0xaf
	.byte	0x20
	.uleb128 0xe
	.ascii	"arg\000"
	.byte	0x5
	.byte	0x40
	.4byte	0x9f
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x5
	.byte	0x43
	.4byte	0x8d
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x5
	.byte	0x46
	.4byte	0x49
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x5
	.byte	0x49
	.4byte	0x25d
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x5
	.byte	0x4c
	.4byte	0x263
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x5
	.byte	0x4f
	.4byte	0x168
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x5
	.byte	0x52
	.4byte	0x49
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x174
	.uleb128 0xf
	.4byte	0x25d
	.uleb128 0x9
	.4byte	0x9f
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x252
	.uleb128 0x6
	.byte	0x4
	.4byte	0x15d
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x5
	.byte	0x55
	.4byte	0x174
	.uleb128 0x6
	.byte	0x4
	.4byte	0x269
	.uleb128 0x10
	.4byte	.LASF64
	.byte	0x1
	.byte	0x15
	.4byte	0xaf
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF43
	.byte	0x1
	.byte	0x20
	.4byte	0x6d
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b2
	.uleb128 0x12
	.4byte	.LVL0
	.4byte	0x3e9
	.byte	0
	.uleb128 0x11
	.4byte	.LASF44
	.byte	0x1
	.byte	0x28
	.4byte	0x6d
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d5
	.uleb128 0x12
	.4byte	.LVL1
	.4byte	0x3f4
	.byte	0
	.uleb128 0x11
	.4byte	.LASF45
	.byte	0x1
	.byte	0x30
	.4byte	0x6d
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f8
	.uleb128 0x12
	.4byte	.LVL2
	.4byte	0x3ff
	.byte	0
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x1
	.byte	0x38
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x32e
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x1
	.byte	0x38
	.4byte	0x6d
	.4byte	.LLST0
	.uleb128 0x15
	.4byte	.LVL4
	.4byte	0x40a
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF65
	.byte	0x1
	.byte	0x40
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34d
	.uleb128 0x12
	.4byte	.LVL5
	.4byte	0x41b
	.byte	0
	.uleb128 0x13
	.4byte	.LASF47
	.byte	0x1
	.byte	0x48
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x36c
	.uleb128 0x12
	.4byte	.LVL6
	.4byte	0x422
	.byte	0
	.uleb128 0x13
	.4byte	.LASF48
	.byte	0x1
	.byte	0x58
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x38b
	.uleb128 0x12
	.4byte	.LVL7
	.4byte	0x42f
	.byte	0
	.uleb128 0x13
	.4byte	.LASF49
	.byte	0x1
	.byte	0x64
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e9
	.uleb128 0x14
	.4byte	.LASF50
	.byte	0x1
	.byte	0x64
	.4byte	0x25
	.4byte	.LLST1
	.uleb128 0x12
	.4byte	.LVL9
	.4byte	0x43c
	.uleb128 0x18
	.4byte	.LVL10
	.4byte	0x447
	.4byte	0x3cb
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x18
	.4byte	.LVL11
	.4byte	0x458
	.4byte	0x3df
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x12
	.4byte	.LVL12
	.4byte	0x46d
	.byte	0
	.uleb128 0x19
	.4byte	.LASF51
	.byte	0x6
	.byte	0x51
	.4byte	0x6d
	.uleb128 0x19
	.4byte	.LASF52
	.byte	0x6
	.byte	0x53
	.4byte	0x6d
	.uleb128 0x19
	.4byte	.LASF53
	.byte	0x6
	.byte	0x52
	.4byte	0x6d
	.uleb128 0x1a
	.4byte	.LASF57
	.byte	0x6
	.byte	0x54
	.4byte	0x41b
	.uleb128 0x9
	.4byte	0x6d
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF59
	.byte	0x6
	.byte	0x55
	.uleb128 0x1c
	.4byte	.LASF54
	.byte	0x1
	.byte	0x1a
	.4byte	0x42f
	.uleb128 0x1d
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF55
	.byte	0x5
	.byte	0xd3
	.4byte	0x43c
	.uleb128 0x1d
	.byte	0
	.uleb128 0x19
	.4byte	.LASF56
	.byte	0x6
	.byte	0x45
	.4byte	0x6d
	.uleb128 0x1a
	.4byte	.LASF58
	.byte	0x6
	.byte	0x42
	.4byte	0x458
	.uleb128 0x9
	.4byte	0x6d
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF66
	.byte	0x5
	.byte	0xb0
	.4byte	0x274
	.4byte	0x46d
	.uleb128 0x9
	.4byte	0x49
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF60
	.byte	0x6
	.byte	0x44
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
	.uleb128 0x3
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
	.byte	0
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL3
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-1
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL8
	.4byte	.LVL9-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9-1
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
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
.LASF21:
	.ascii	"ticks\000"
.LASF42:
	.ascii	"caribou_thread_t\000"
.LASF50:
	.ascii	"priority\000"
.LASF0:
	.ascii	"int8_t\000"
.LASF33:
	.ascii	"state\000"
.LASF11:
	.ascii	"uint64_t\000"
.LASF5:
	.ascii	"short int\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF46:
	.ascii	"caribou_lock_set\000"
.LASF43:
	.ascii	"caribou_lock_state\000"
.LASF63:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF22:
	.ascii	"reloadticks\000"
.LASF20:
	.ascii	"fnarg\000"
.LASF45:
	.ascii	"caribou_unlock\000"
.LASF1:
	.ascii	"uint8_t\000"
.LASF39:
	.ascii	"timer\000"
.LASF28:
	.ascii	"parent\000"
.LASF49:
	.ascii	"caribou_init\000"
.LASF44:
	.ascii	"caribou_lock\000"
.LASF56:
	.ascii	"chip_interrupts_disable\000"
.LASF62:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/kernel/caribou.c\000"
.LASF10:
	.ascii	"long long int\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"long int\000"
.LASF54:
	.ascii	"_halt\000"
.LASF58:
	.ascii	"chip_init\000"
.LASF59:
	.ascii	"chip_systick_irq_force\000"
.LASF53:
	.ascii	"chip_systick_irq_enable\000"
.LASF55:
	.ascii	"caribou_thread_exec\000"
.LASF35:
	.ascii	"name\000"
.LASF60:
	.ascii	"chip_interrupts_enable\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF25:
	.ascii	"errno_t\000"
.LASF32:
	.ascii	"stack_base\000"
.LASF47:
	.ascii	"abort\000"
.LASF2:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"flags\000"
.LASF8:
	.ascii	"uint32_t\000"
.LASF36:
	.ascii	"runtime\000"
.LASF9:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"uint16_t\000"
.LASF41:
	.ascii	"sleep\000"
.LASF29:
	.ascii	"stack_usage\000"
.LASF19:
	.ascii	"timerfn\000"
.LASF24:
	.ascii	"caribou_timer_t\000"
.LASF14:
	.ascii	"char\000"
.LASF37:
	.ascii	"lock\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF4:
	.ascii	"int16_t\000"
.LASF51:
	.ascii	"chip_systick_irq_state\000"
.LASF65:
	.ascii	"caribou_preempt\000"
.LASF38:
	.ascii	"finishfn\000"
.LASF61:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF27:
	.ascii	"_caribou_thread_t\000"
.LASF57:
	.ascii	"chip_systick_irq_set\000"
.LASF66:
	.ascii	"caribou_thread_init\000"
.LASF52:
	.ascii	"chip_systick_irq_disable\000"
.LASF30:
	.ascii	"stack_low\000"
.LASF16:
	.ascii	"caribou_timer_callback_fn\000"
.LASF31:
	.ascii	"stack_top\000"
.LASF64:
	.ascii	"caribou_version\000"
.LASF48:
	.ascii	"caribou_exec\000"
.LASF17:
	.ascii	"prev\000"
.LASF34:
	.ascii	"prio\000"
.LASF18:
	.ascii	"next\000"
.LASF40:
	.ascii	"__errno\000"
.LASF26:
	.ascii	"_caribou_timer_t\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
