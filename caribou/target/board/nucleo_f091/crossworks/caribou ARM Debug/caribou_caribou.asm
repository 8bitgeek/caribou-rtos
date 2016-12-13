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
	.file	"caribou.c"
	.text
.Ltext0:
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"0.9.5\000"
	.section	.text.caribou_version,"ax",%progbits
	.align	2
	.global	caribou_version
	.code	16
	.thumb_func
	.type	caribou_version, %function
caribou_version:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/kernel/caribou.c"
	.loc 1 22 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 23 0
	ldr	r3, .L3
	.loc 1 24 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	.LC0
.LFE32:
	.size	caribou_version, .-caribou_version
	.section	.text.caribou_lock_state,"ax",%progbits
	.align	2
	.global	caribou_lock_state
	.code	16
	.thumb_func
	.type	caribou_lock_state, %function
caribou_lock_state:
.LFB33:
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	add	r7, sp, #0
.LCFI3:
	.loc 1 34 0
	bl	chip_systick_irq_state
	movs	r3, r0
	.loc 1 35 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	caribou_lock_state, .-caribou_lock_state
	.section	.text.caribou_lock,"ax",%progbits
	.align	2
	.global	caribou_lock
	.code	16
	.thumb_func
	.type	caribou_lock, %function
caribou_lock:
.LFB34:
	.loc 1 41 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	.loc 1 42 0
	bl	chip_systick_irq_disable
	movs	r3, r0
	.loc 1 43 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	caribou_lock, .-caribou_lock
	.section	.text.caribou_unlock,"ax",%progbits
	.align	2
	.global	caribou_unlock
	.code	16
	.thumb_func
	.type	caribou_unlock, %function
caribou_unlock:
.LFB35:
	.loc 1 49 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	.loc 1 50 0
	bl	chip_systick_irq_enable
	movs	r3, r0
	.loc 1 51 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	caribou_unlock, .-caribou_unlock
	.section	.text.caribou_lock_set,"ax",%progbits
	.align	2
	.global	caribou_lock_set
	.code	16
	.thumb_func
	.type	caribou_lock_set, %function
caribou_lock_set:
.LFB36:
	.loc 1 57 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #8
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	str	r0, [r7, #4]
	.loc 1 58 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	chip_systick_irq_set
	.loc 1 59 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE36:
	.size	caribou_lock_set, .-caribou_lock_set
	.section	.text.caribou_preempt,"ax",%progbits
	.align	2
	.global	caribou_preempt
	.code	16
	.thumb_func
	.type	caribou_preempt, %function
caribou_preempt:
.LFB37:
	.loc 1 65 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	add	r7, sp, #0
.LCFI12:
	.loc 1 66 0
	bl	chip_systick_irq_force
	.loc 1 67 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE37:
	.size	caribou_preempt, .-caribou_preempt
	.section	.text.abort,"ax",%progbits
	.align	2
	.weak	abort
	.code	16
	.thumb_func
	.type	abort, %function
abort:
.LFB38:
	.loc 1 73 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	.loc 1 80 0
	bl	_halt
	.loc 1 81 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE38:
	.size	abort, .-abort
	.section	.text.caribou_exec,"ax",%progbits
	.align	2
	.global	caribou_exec
	.code	16
	.thumb_func
	.type	caribou_exec, %function
caribou_exec:
.LFB39:
	.loc 1 91 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	.loc 1 92 0
	bl	caribou_thread_exec
	.loc 1 93 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE39:
	.size	caribou_exec, .-caribou_exec
	.section	.text.caribou_init_clock,"ax",%progbits
	.align	2
	.global	caribou_init_clock
	.code	16
	.thumb_func
	.type	caribou_init_clock, %function
caribou_init_clock:
.LFB40:
	.loc 1 99 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	.loc 1 101 0
	ldr	r3, .L18
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L17
	.loc 1 103 0
	movs	r0, #1
	bl	chip_init
	.loc 1 104 0
	ldr	r3, .L18
	movs	r2, #1
	strb	r2, [r3]
.L17:
	.loc 1 106 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	clock_started.6852
.LFE40:
	.size	caribou_init_clock, .-caribou_init_clock
	.section	.text.caribou_init,"ax",%progbits
	.align	2
	.global	caribou_init
	.code	16
	.thumb_func
	.type	caribou_init, %function
caribou_init:
.LFB41:
	.loc 1 116 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI19:
	sub	sp, sp, #8
.LCFI20:
	add	r7, sp, #0
.LCFI21:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 117 0
	bl	chip_interrupts_disable
	.loc 1 118 0
	bl	caribou_init_clock
	.loc 1 119 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	sxth	r3, r3
	movs	r0, r3
	bl	caribou_thread_init
	.loc 1 123 0
	bl	chip_interrupts_enable
	.loc 1 124 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE41:
	.size	caribou_init, .-caribou_init
	.section	.bss.clock_started.6852,"aw",%nobits
	.type	clock_started.6852, %object
	.size	clock_started.6852, 1
clock_started.6852:
	.space	1
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
	.4byte	.LCFI2-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
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
	.4byte	.LCFI4-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
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
	.4byte	.LCFI6-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
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
	.4byte	.LCFI8-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
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
	.4byte	.LCFI11-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
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
	.4byte	.LCFI13-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
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
	.4byte	.LCFI15-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
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
	.4byte	.LCFI17-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
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
	.4byte	.LCFI19-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x177
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0xc
	.4byte	.LASF21
	.4byte	.LASF22
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF23
	.byte	0x2
	.byte	0xe
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x4
	.4byte	0x7c
	.uleb128 0x6
	.4byte	0x6f
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x7
	.4byte	.LASF10
	.byte	0x1
	.byte	0x15
	.4byte	0x76
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x20
	.4byte	0x4c
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x28
	.4byte	0x4c
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x30
	.4byte	0x4c
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x1
	.byte	0x38
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x100
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0x38
	.4byte	0x4c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x1
	.byte	0x40
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x48
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x1
	.byte	0x5a
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF16
	.byte	0x1
	.byte	0x62
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x15a
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x1
	.byte	0x64
	.4byte	0x6f
	.uleb128 0x5
	.byte	0x3
	.4byte	clock_started.6852
	.byte	0
	.uleb128 0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0x73
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0x73
	.4byte	0x25
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
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
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x2116
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
	.uleb128 0xc
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xc9
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x17b
	.4byte	0x88
	.ascii	"caribou_version\000"
	.4byte	0x9d
	.ascii	"caribou_lock_state\000"
	.4byte	0xb2
	.ascii	"caribou_lock\000"
	.4byte	0xc7
	.ascii	"caribou_unlock\000"
	.4byte	0xdc
	.ascii	"caribou_lock_set\000"
	.4byte	0x100
	.ascii	"caribou_preempt\000"
	.4byte	0x111
	.ascii	"abort\000"
	.4byte	0x122
	.ascii	"caribou_exec\000"
	.4byte	0x133
	.ascii	"caribou_init_clock\000"
	.4byte	0x15a
	.ascii	"caribou_init\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xc9
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x17b
	.4byte	0x30
	.ascii	"signed char\000"
	.4byte	0x25
	.ascii	"int8_t\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x45
	.ascii	"short unsigned int\000"
	.4byte	0x4c
	.ascii	"int\000"
	.4byte	0x53
	.ascii	"unsigned int\000"
	.4byte	0x5a
	.ascii	"long long int\000"
	.4byte	0x61
	.ascii	"long long unsigned int\000"
	.4byte	0x68
	.ascii	"long int\000"
	.4byte	0x6f
	.ascii	"char\000"
	.4byte	0x81
	.ascii	"sizetype\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x64
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
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"long long int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF22:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF11:
	.ascii	"caribou_lock_state\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF25:
	.ascii	"caribou_preempt\000"
.LASF19:
	.ascii	"priority\000"
.LASF12:
	.ascii	"caribou_lock\000"
.LASF15:
	.ascii	"caribou_exec\000"
.LASF10:
	.ascii	"caribou_version\000"
.LASF8:
	.ascii	"char\000"
.LASF23:
	.ascii	"int8_t\000"
.LASF26:
	.ascii	"clock_started\000"
.LASF7:
	.ascii	"long int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"caribou_init\000"
.LASF18:
	.ascii	"state\000"
.LASF16:
	.ascii	"caribou_init_clock\000"
.LASF21:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/k"
	.ascii	"ernel/caribou.c\000"
.LASF14:
	.ascii	"abort\000"
.LASF2:
	.ascii	"short int\000"
.LASF20:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF13:
	.ascii	"caribou_unlock\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF24:
	.ascii	"caribou_lock_set\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
