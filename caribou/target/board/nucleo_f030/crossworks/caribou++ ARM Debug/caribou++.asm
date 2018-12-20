	.syntax unified
	.cpu cortex-m0plus
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
	.file	"caribou++.cpp"
	.text
.Ltext0:
	.section	.text.__aeabi_atexit,"ax",%progbits
	.align	2
	.global	__aeabi_atexit
	.code	16
	.thumb_func
	.type	__aeabi_atexit, %function
__aeabi_atexit:
.LFB125:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../../caribou++/src/caribou++.cpp"
	.loc 1 28 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 29 0
	movs	r3, #0
	.loc 1 30 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE125:
	.size	__aeabi_atexit, .-__aeabi_atexit
	.global	__dso_handle
	.section	.bss.__dso_handle,"aw",%nobits
	.align	2
	.type	__dso_handle, %object
	.size	__dso_handle, 4
__dso_handle:
	.space	4
	.section	.text.__cxa_pure_virtual,"ax",%progbits
	.align	2
	.weak	__cxa_pure_virtual
	.code	16
	.thumb_func
	.type	__cxa_pure_virtual, %function
__cxa_pure_virtual:
.LFB126:
	.loc 1 41 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	.loc 1 42 0
	bl	chip_reset
	.loc 1 43 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE126:
	.size	__cxa_pure_virtual, .-__cxa_pure_virtual
	.section	.text.thread_fault_fn,"ax",%progbits
	.align	2
	.weak	thread_fault_fn
	.code	16
	.thumb_func
	.type	thread_fault_fn, %function
thread_fault_fn:
.LFB127:
	.loc 1 49 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 50 0
	bl	chip_reset
	.loc 1 51 0
	movs	r3, #0
	.loc 1 52 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE127:
	.size	thread_fault_fn, .-thread_fault_fn
	.section	.text._Znwj,"ax",%progbits
	.align	2
	.global	_Znwj
	.code	16
	.thumb_func
	.type	_Znwj, %function
_Znwj:
.LFB128:
	.loc 1 55 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI8:
	sub	sp, sp, #16
.LCFI9:
	add	r7, sp, #0
.LCFI10:
	str	r0, [r7, #4]
	.loc 1 57 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 64 0
	ldr	r3, [r7, #12]
	.loc 1 65 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE128:
	.size	_Znwj, .-_Znwj
	.section	.text._Znaj,"ax",%progbits
	.align	2
	.global	_Znaj
	.code	16
	.thumb_func
	.type	_Znaj, %function
_Znaj:
.LFB129:
	.loc 1 68 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI11:
	sub	sp, sp, #16
.LCFI12:
	add	r7, sp, #0
.LCFI13:
	str	r0, [r7, #4]
	.loc 1 70 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 77 0
	ldr	r3, [r7, #12]
	.loc 1 78 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE129:
	.size	_Znaj, .-_Znaj
	.section	.text._ZnwjPv,"ax",%progbits
	.align	2
	.global	_ZnwjPv
	.code	16
	.thumb_func
	.type	_ZnwjPv, %function
_ZnwjPv:
.LFB130:
	.loc 1 81 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI14:
	sub	sp, sp, #8
.LCFI15:
	add	r7, sp, #0
.LCFI16:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 82 0
	ldr	r3, [r7]
	.loc 1 83 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE130:
	.size	_ZnwjPv, .-_ZnwjPv
	.section	.text._ZdlPv,"ax",%progbits
	.align	2
	.global	_ZdlPv
	.code	16
	.thumb_func
	.type	_ZdlPv, %function
_ZdlPv:
.LFB131:
	.loc 1 86 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI17:
	sub	sp, sp, #8
.LCFI18:
	add	r7, sp, #0
.LCFI19:
	str	r0, [r7, #4]
	.loc 1 87 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
	.loc 1 88 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE131:
	.size	_ZdlPv, .-_ZdlPv
	.section	.text._ZdaPv,"ax",%progbits
	.align	2
	.global	_ZdaPv
	.code	16
	.thumb_func
	.type	_ZdaPv, %function
_ZdaPv:
.LFB132:
	.loc 1 91 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI20:
	sub	sp, sp, #8
.LCFI21:
	add	r7, sp, #0
.LCFI22:
	str	r0, [r7, #4]
	.loc 1 92 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	free
	.loc 1 93 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE132:
	.size	_ZdaPv, .-_ZdaPv
	.global	_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE
	.section	.bss._ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE,"aw",%nobits
	.align	2
	.type	_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE, %object
	.size	_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE, 4
_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE:
	.space	4
	.section	.text._ZN7CARIBOU18CCaribouMainThread4initEhPv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU18CCaribouMainThread4initEhPv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU18CCaribouMainThread4initEhPv, %function
_ZN7CARIBOU18CCaribouMainThread4initEhPv:
.LFB133:
	.loc 1 99 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI23:
	sub	sp, sp, #8
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 100 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	movs	r0, r3
	bl	caribou_init
	.loc 1 101 0
	ldr	r3, .L15
	movs	r1, #0
	movs	r0, r3
	bl	caribou_thread_fault_set
	.loc 1 102 0
	bl	caribou_thread_current
	movs	r2, r0
	ldr	r3, .L15+4
	str	r2, [r3]
	.loc 1 103 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L16:
	.align	2
.L15:
	.word	thread_fault_fn
	.word	_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE
.LFE133:
	.size	_ZN7CARIBOU18CCaribouMainThread4initEhPv, .-_ZN7CARIBOU18CCaribouMainThread4initEhPv
	.section	.text._ZN7CARIBOU18CCaribouMainThread4onceEv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU18CCaribouMainThread4onceEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU18CCaribouMainThread4onceEv, %function
_ZN7CARIBOU18CCaribouMainThread4onceEv:
.LFB134:
	.loc 1 106 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI26:
	add	r7, sp, #0
.LCFI27:
	.loc 1 107 0
	bl	caribou_thread_once
	.loc 1 108 0
	bl	_ZN7CARIBOU7CObject8periodicEv
	.loc 1 109 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE134:
	.size	_ZN7CARIBOU18CCaribouMainThread4onceEv, .-_ZN7CARIBOU18CCaribouMainThread4onceEv
	.section	.text._ZN7CARIBOU18CCaribouMainThread3runEv,"ax",%progbits
	.align	2
	.global	_ZN7CARIBOU18CCaribouMainThread3runEv
	.code	16
	.thumb_func
	.type	_ZN7CARIBOU18CCaribouMainThread3runEv, %function
_ZN7CARIBOU18CCaribouMainThread3runEv:
.LFB135:
	.loc 1 112 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI28:
	add	r7, sp, #0
.LCFI29:
.L19:
	.loc 1 115 0 discriminator 1
	bl	_ZN7CARIBOU18CCaribouMainThread4onceEv
	.loc 1 113 0 discriminator 1
	b	.L19
.LFE135:
	.size	_ZN7CARIBOU18CCaribouMainThread3runEv, .-_ZN7CARIBOU18CCaribouMainThread3runEv
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
	.4byte	.LFB125
	.4byte	.LFE125-.LFB125
	.byte	0x4
	.4byte	.LCFI0-.LFB125
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
	.4byte	.LFB126
	.4byte	.LFE126-.LFB126
	.byte	0x4
	.4byte	.LCFI3-.LFB126
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB127
	.4byte	.LFE127-.LFB127
	.byte	0x4
	.4byte	.LCFI5-.LFB127
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB128
	.4byte	.LFE128-.LFB128
	.byte	0x4
	.4byte	.LCFI8-.LFB128
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB129
	.4byte	.LFE129-.LFB129
	.byte	0x4
	.4byte	.LCFI11-.LFB129
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB130
	.4byte	.LFE130-.LFB130
	.byte	0x4
	.4byte	.LCFI14-.LFB130
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB131
	.4byte	.LFE131-.LFB131
	.byte	0x4
	.4byte	.LCFI17-.LFB131
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xe
	.uleb128 0x10
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
	.4byte	.LFB132
	.4byte	.LFE132-.LFB132
	.byte	0x4
	.4byte	.LCFI20-.LFB132
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
	.4byte	.LFB133
	.4byte	.LFE133-.LFB133
	.byte	0x4
	.4byte	.LCFI23-.LFB133
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
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.byte	0x4
	.4byte	.LCFI26-.LFB134
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB135
	.4byte	.LFE135-.LFB135
	.byte	0x4
	.4byte	.LCFI28-.LFB135
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE20:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stddef.h"
	.file 4 "../../../../include/caribou/kernel/timer.h"
	.file 5 "../../../../include/caribou/lib/errno.h"
	.file 6 "../../../../include/caribou/kernel/thread.h"
	.file 7 "../../../../../caribou++/include/caribou++.h"
	.file 8 "../../../../../caribou++/include/caribou++/cobject.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4f0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF4479
	.byte	0x4
	.4byte	.LASF4480
	.4byte	.LASF4481
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF4411
	.uleb128 0x3
	.4byte	.LASF4413
	.byte	0x2
	.byte	0xf
	.4byte	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4412
	.uleb128 0x3
	.4byte	.LASF4414
	.byte	0x2
	.byte	0x14
	.4byte	0x4d
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4415
	.uleb128 0x3
	.4byte	.LASF4416
	.byte	0x2
	.byte	0x15
	.4byte	0x5f
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4417
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF4418
	.byte	0x2
	.byte	0x17
	.4byte	0x78
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4419
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF4420
	.uleb128 0x3
	.4byte	.LASF4421
	.byte	0x2
	.byte	0x24
	.4byte	0x91
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF4422
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4423
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4424
	.uleb128 0x6
	.byte	0x4
	.4byte	0xae
	.uleb128 0x7
	.4byte	0xa1
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4425
	.uleb128 0x3
	.4byte	.LASF4426
	.byte	0x3
	.byte	0x16
	.4byte	0x78
	.uleb128 0x3
	.4byte	.LASF4427
	.byte	0x4
	.byte	0x2f
	.4byte	0xd0
	.uleb128 0x8
	.4byte	0x98
	.4byte	0xe9
	.uleb128 0x9
	.4byte	0x98
	.uleb128 0x9
	.4byte	0xe9
	.uleb128 0x9
	.4byte	0x98
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xef
	.uleb128 0xa
	.4byte	.LASF4437
	.byte	0x1c
	.byte	0x4
	.byte	0x38
	.4byte	0x150
	.uleb128 0xb
	.4byte	.LASF4428
	.byte	0x4
	.byte	0x3b
	.4byte	0xe9
	.byte	0
	.uleb128 0xb
	.4byte	.LASF4429
	.byte	0x4
	.byte	0x3d
	.4byte	0xe9
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF4430
	.byte	0x4
	.byte	0x3f
	.4byte	0x150
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF4431
	.byte	0x4
	.byte	0x41
	.4byte	0x98
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF4432
	.byte	0x4
	.byte	0x43
	.4byte	0x6d
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF4433
	.byte	0x4
	.byte	0x45
	.4byte	0x6d
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF4434
	.byte	0x4
	.byte	0x47
	.4byte	0x30
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc5
	.uleb128 0x3
	.4byte	.LASF4435
	.byte	0x4
	.byte	0x48
	.4byte	0xef
	.uleb128 0xc
	.4byte	.LASF4436
	.byte	0x5
	.2byte	0x108
	.4byte	0x66
	.uleb128 0xa
	.4byte	.LASF4438
	.byte	0x48
	.byte	0x6
	.byte	0x1f
	.4byte	0x245
	.uleb128 0xb
	.4byte	.LASF4429
	.byte	0x6
	.byte	0x22
	.4byte	0x245
	.byte	0
	.uleb128 0xb
	.4byte	.LASF4439
	.byte	0x6
	.byte	0x25
	.4byte	0x245
	.byte	0x4
	.uleb128 0xd
	.ascii	"sp\000"
	.byte	0x6
	.byte	0x28
	.4byte	0x98
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF4440
	.byte	0x6
	.byte	0x2b
	.4byte	0x98
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF4441
	.byte	0x6
	.byte	0x2e
	.4byte	0x98
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF4442
	.byte	0x6
	.byte	0x31
	.4byte	0x98
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF4443
	.byte	0x6
	.byte	0x34
	.4byte	0x98
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF4444
	.byte	0x6
	.byte	0x37
	.4byte	0x54
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF4445
	.byte	0x6
	.byte	0x3a
	.4byte	0x42
	.byte	0x1e
	.uleb128 0xb
	.4byte	.LASF4446
	.byte	0x6
	.byte	0x3d
	.4byte	0xa8
	.byte	0x20
	.uleb128 0xd
	.ascii	"arg\000"
	.byte	0x6
	.byte	0x40
	.4byte	0x98
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF4447
	.byte	0x6
	.byte	0x43
	.4byte	0x86
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF4448
	.byte	0x6
	.byte	0x46
	.4byte	0x42
	.byte	0x30
	.uleb128 0xb
	.4byte	.LASF4449
	.byte	0x6
	.byte	0x49
	.4byte	0x256
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF4450
	.byte	0x6
	.byte	0x4c
	.4byte	0x25c
	.byte	0x38
	.uleb128 0xb
	.4byte	.LASF4451
	.byte	0x6
	.byte	0x4f
	.4byte	0x161
	.byte	0x3c
	.uleb128 0xb
	.4byte	.LASF4452
	.byte	0x6
	.byte	0x52
	.4byte	0x42
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x16d
	.uleb128 0xe
	.4byte	0x256
	.uleb128 0x9
	.4byte	0x98
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x24b
	.uleb128 0x6
	.byte	0x4
	.4byte	0x156
	.uleb128 0x3
	.4byte	.LASF4453
	.byte	0x6
	.byte	0x5f
	.4byte	0x16d
	.uleb128 0x6
	.byte	0x4
	.4byte	0x262
	.uleb128 0xf
	.4byte	.LASF4482
	.byte	0x8
	.byte	0x19
	.4byte	0x2d6
	.uleb128 0x10
	.4byte	.LASF4483
	.byte	0x1
	.byte	0x7
	.byte	0x48
	.uleb128 0x11
	.4byte	.LASF4484
	.byte	0x7
	.byte	0x52
	.4byte	0x26d
	.uleb128 0x12
	.4byte	.LASF4485
	.byte	0x7
	.byte	0x4c
	.4byte	.LASF4486
	.byte	0x1
	.4byte	0x2ac
	.uleb128 0x9
	.4byte	0x30
	.uleb128 0x9
	.4byte	0x98
	.byte	0
	.uleb128 0x13
	.4byte	.LASF4454
	.byte	0x7
	.byte	0x4d
	.4byte	.LASF4487
	.byte	0x1
	.uleb128 0x14
	.ascii	"run\000"
	.byte	0x7
	.byte	0x4e
	.4byte	.LASF4488
	.byte	0x1
	.uleb128 0x15
	.4byte	.LASF4458
	.byte	0x7
	.byte	0x4f
	.4byte	.LASF4489
	.4byte	0x26d
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x16
	.4byte	.LASF4460
	.byte	0x1
	.byte	0x19
	.4byte	0x66
	.4byte	.LFB125
	.4byte	.LFE125-.LFB125
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x31a
	.uleb128 0x17
	.4byte	.LASF4455
	.byte	0x1
	.byte	0x19
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.4byte	.LASF4456
	.byte	0x1
	.byte	0x1a
	.4byte	0x256
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x17
	.4byte	.LASF4457
	.byte	0x1
	.byte	0x1b
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.4byte	.LASF4459
	.byte	0x1
	.byte	0x28
	.4byte	.LFB126
	.4byte	.LFE126-.LFB126
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x19
	.4byte	.LASF4461
	.byte	0x1
	.byte	0x30
	.4byte	0x98
	.4byte	.LFB127
	.4byte	.LFE127-.LFB127
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x361
	.uleb128 0x17
	.4byte	.LASF4462
	.byte	0x1
	.byte	0x30
	.4byte	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x30
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF4464
	.byte	0x1
	.byte	0x36
	.4byte	.LASF4466
	.4byte	0x98
	.4byte	.LFB128
	.4byte	.LFE128-.LFB128
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x399
	.uleb128 0x17
	.4byte	.LASF4463
	.byte	0x1
	.byte	0x36
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF4465
	.byte	0x1
	.byte	0x43
	.4byte	.LASF4467
	.4byte	0x98
	.4byte	.LFB129
	.4byte	.LFE129-.LFB129
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d1
	.uleb128 0x17
	.4byte	.LASF4463
	.byte	0x1
	.byte	0x43
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.ascii	"p\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF4464
	.byte	0x1
	.byte	0x50
	.4byte	.LASF4468
	.4byte	0x98
	.4byte	.LFB130
	.4byte	.LFE130-.LFB130
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x40b
	.uleb128 0x17
	.4byte	.LASF4463
	.byte	0x1
	.byte	0x50
	.4byte	0xba
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.ascii	"ptr\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF4469
	.byte	0x1
	.byte	0x55
	.4byte	.LASF4471
	.4byte	.LFB131
	.4byte	.LFE131-.LFB131
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x431
	.uleb128 0x1a
	.ascii	"p\000"
	.byte	0x1
	.byte	0x55
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF4470
	.byte	0x1
	.byte	0x5a
	.4byte	.LASF4472
	.4byte	.LFB132
	.4byte	.LFE132-.LFB132
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x457
	.uleb128 0x1a
	.ascii	"p\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x1f
	.4byte	0x291
	.byte	0x1
	.byte	0x62
	.4byte	.LFB133
	.4byte	.LFE133-.LFB133
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x489
	.uleb128 0x17
	.4byte	.LASF4473
	.byte	0x1
	.byte	0x62
	.4byte	0x30
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x17
	.4byte	.LASF4474
	.byte	0x1
	.byte	0x62
	.4byte	0x98
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x20
	.4byte	0x2ac
	.byte	0x1
	.byte	0x69
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	0x2b8
	.byte	0x1
	.byte	0x6f
	.4byte	.LFB135
	.4byte	.LFE135-.LFB135
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.4byte	.LASF4475
	.byte	0x5
	.byte	0x18
	.4byte	0x4b6
	.uleb128 0x7
	.4byte	0x66
	.uleb128 0x21
	.4byte	.LASF4476
	.byte	0x5
	.byte	0x19
	.4byte	0x4b6
	.uleb128 0x21
	.4byte	.LASF4477
	.byte	0x5
	.byte	0x1a
	.4byte	0x4b6
	.uleb128 0x22
	.4byte	.LASF4478
	.byte	0x1
	.byte	0x22
	.4byte	0x98
	.uleb128 0x5
	.byte	0x3
	.4byte	__dso_handle
	.uleb128 0x23
	.4byte	0x286
	.byte	0x1
	.byte	0x61
	.4byte	.LASF4490
	.uleb128 0x5
	.byte	0x3
	.4byte	_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE
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
	.uleb128 0x2119
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x39
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x6e
	.uleb128 0xe
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
	.uleb128 0x6e
	.uleb128 0xe
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
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
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
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
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
	.uleb128 0x21
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x16b
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4f4
	.4byte	0x273
	.ascii	"CARIBOU\000"
	.4byte	0x2d6
	.ascii	"__aeabi_atexit\000"
	.4byte	0x31a
	.ascii	"__cxa_pure_virtual\000"
	.4byte	0x32b
	.ascii	"thread_fault_fn\000"
	.4byte	0x361
	.ascii	"operator new\000"
	.4byte	0x399
	.ascii	"operator new []\000"
	.4byte	0x3d1
	.ascii	"operator new\000"
	.4byte	0x40b
	.ascii	"operator delete\000"
	.4byte	0x431
	.ascii	"operator delete []\000"
	.4byte	0x457
	.ascii	"CARIBOU::CCaribouMainThread::init\000"
	.4byte	0x489
	.ascii	"CARIBOU::CCaribouMainThread::once\000"
	.4byte	0x49a
	.ascii	"CARIBOU::CCaribouMainThread::run\000"
	.4byte	0x4d1
	.ascii	"__dso_handle\000"
	.4byte	0x4e2
	.ascii	"CARIBOU::CCaribouMainThread::mCaribouThread\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x1c6
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x4f4
	.4byte	0x29
	.ascii	"signed char\000"
	.4byte	0x3b
	.ascii	"unsigned char\000"
	.4byte	0x30
	.ascii	"uint8_t\000"
	.4byte	0x4d
	.ascii	"short int\000"
	.4byte	0x42
	.ascii	"int16_t\000"
	.4byte	0x5f
	.ascii	"short unsigned int\000"
	.4byte	0x54
	.ascii	"uint16_t\000"
	.4byte	0x66
	.ascii	"int\000"
	.4byte	0x78
	.ascii	"unsigned int\000"
	.4byte	0x6d
	.ascii	"uint32_t\000"
	.4byte	0x7f
	.ascii	"long long int\000"
	.4byte	0x91
	.ascii	"long long unsigned int\000"
	.4byte	0x86
	.ascii	"uint64_t\000"
	.4byte	0x9a
	.ascii	"long int\000"
	.4byte	0xa1
	.ascii	"char\000"
	.4byte	0xb3
	.ascii	"sizetype\000"
	.4byte	0xba
	.ascii	"size_t\000"
	.4byte	0xc5
	.ascii	"caribou_timer_callback_fn\000"
	.4byte	0xef
	.ascii	"_caribou_timer_t\000"
	.4byte	0x156
	.ascii	"caribou_timer_t\000"
	.4byte	0x161
	.ascii	"errno_t\000"
	.4byte	0x16d
	.ascii	"_caribou_thread_t\000"
	.4byte	0x262
	.ascii	"caribou_thread_t\000"
	.4byte	0x27e
	.ascii	"CARIBOU::CCaribouMainThread\000"
	.4byte	0x27e
	.ascii	"CARIBOU::CCaribouMainThread\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x6c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB125
	.4byte	.LFE125-.LFB125
	.4byte	.LFB126
	.4byte	.LFE126-.LFB126
	.4byte	.LFB127
	.4byte	.LFE127-.LFB127
	.4byte	.LFB128
	.4byte	.LFE128-.LFB128
	.4byte	.LFB129
	.4byte	.LFE129-.LFB129
	.4byte	.LFB130
	.4byte	.LFE130-.LFB130
	.4byte	.LFB131
	.4byte	.LFE131-.LFB131
	.4byte	.LFB132
	.4byte	.LFE132-.LFB132
	.4byte	.LFB133
	.4byte	.LFE133-.LFB133
	.4byte	.LFB134
	.4byte	.LFE134-.LFB134
	.4byte	.LFB135
	.4byte	.LFE135-.LFB135
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB125
	.4byte	.LFE125
	.4byte	.LFB126
	.4byte	.LFE126
	.4byte	.LFB127
	.4byte	.LFE127
	.4byte	.LFB128
	.4byte	.LFE128
	.4byte	.LFB129
	.4byte	.LFE129
	.4byte	.LFB130
	.4byte	.LFE130
	.4byte	.LFB131
	.4byte	.LFE131
	.4byte	.LFB132
	.4byte	.LFE132
	.4byte	.LFB133
	.4byte	.LFE133
	.4byte	.LFB134
	.4byte	.LFE134
	.4byte	.LFB135
	.4byte	.LFE135
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x3
	.uleb128 0x11
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF360
	.file 9 "../../../../include/caribou.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x9
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF361
	.file 10 "../include/caribou_config.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xa
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.file 11 "../include/board.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xb
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF366
	.byte	0x3
	.uleb128 0x12
	.uleb128 0x9
	.byte	0x4
	.file 12 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/chip.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xc
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF367
	.file 13 "../../../../include/caribou/kernel/types.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF368
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x3
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF429
	.file 14 "/usr/share/crossworks_for_arm_3.7/include/__crossworks.h"
	.byte	0x3
	.uleb128 0xe
	.uleb128 0xe
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.file 15 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/vectors.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0xf
	.byte	0x7
	.4byte	.Ldebug_macro7
	.byte	0x4
	.file 16 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x10
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF470
	.file 17 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x11
	.byte	0x7
	.4byte	.Ldebug_macro8
	.file 18 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.byte	0x3
	.uleb128 0xd7
	.uleb128 0x12
	.byte	0x7
	.4byte	.Ldebug_macro9
	.file 19 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmInstr.h"
	.byte	0x3
	.uleb128 0x7a
	.uleb128 0x13
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF496
	.byte	0x4
	.file 20 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cmFunc.h"
	.byte	0x3
	.uleb128 0x7b
	.uleb128 0x14
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF497
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.file 21 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/system_stm32f0xx.h"
	.byte	0x3
	.uleb128 0xd8
	.uleb128 0x15
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF581
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro11
	.file 22 "../include/stm32f0xx_conf.h"
	.byte	0x3
	.uleb128 0xc7c
	.uleb128 0x16
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF2454
	.file 23 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_adc.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x17
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2455
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x11
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro12
	.byte	0x4
	.file 24 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_cec.h"
	.byte	0x3
	.uleb128 0x20
	.uleb128 0x18
	.byte	0x7
	.4byte	.Ldebug_macro13
	.byte	0x4
	.file 25 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_crc.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x19
	.byte	0x7
	.4byte	.Ldebug_macro14
	.byte	0x4
	.file 26 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_comp.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x1a
	.byte	0x7
	.4byte	.Ldebug_macro15
	.byte	0x4
	.file 27 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_dac.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x1b
	.byte	0x7
	.4byte	.Ldebug_macro16
	.byte	0x4
	.file 28 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_dbgmcu.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x1c
	.byte	0x7
	.4byte	.Ldebug_macro17
	.byte	0x4
	.file 29 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_dma.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x7
	.4byte	.Ldebug_macro18
	.byte	0x4
	.file 30 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_exti.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x1e
	.byte	0x7
	.4byte	.Ldebug_macro19
	.byte	0x4
	.file 31 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_flash.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x1f
	.byte	0x7
	.4byte	.Ldebug_macro20
	.byte	0x4
	.file 32 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_gpio.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x20
	.byte	0x7
	.4byte	.Ldebug_macro21
	.byte	0x4
	.file 33 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_syscfg.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x21
	.byte	0x7
	.4byte	.Ldebug_macro22
	.byte	0x4
	.file 34 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_i2c.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x22
	.byte	0x7
	.4byte	.Ldebug_macro23
	.byte	0x4
	.file 35 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_iwdg.h"
	.byte	0x3
	.uleb128 0x2b
	.uleb128 0x23
	.byte	0x7
	.4byte	.Ldebug_macro24
	.byte	0x4
	.file 36 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_pwr.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x24
	.byte	0x7
	.4byte	.Ldebug_macro25
	.byte	0x4
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x10
	.byte	0x4
	.file 37 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rtc.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x25
	.byte	0x7
	.4byte	.Ldebug_macro26
	.byte	0x4
	.file 38 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_spi.h"
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x26
	.byte	0x7
	.4byte	.Ldebug_macro27
	.byte	0x4
	.file 39 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_tim.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x27
	.byte	0x7
	.4byte	.Ldebug_macro28
	.byte	0x4
	.file 40 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_usart.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x28
	.byte	0x7
	.4byte	.Ldebug_macro29
	.byte	0x4
	.file 41 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_wwdg.h"
	.byte	0x3
	.uleb128 0x32
	.uleb128 0x29
	.byte	0x7
	.4byte	.Ldebug_macro30
	.byte	0x4
	.file 42 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_misc.h"
	.byte	0x3
	.uleb128 0x33
	.uleb128 0x2a
	.byte	0x7
	.4byte	.Ldebug_macro31
	.byte	0x4
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF3805
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro32
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro33
	.byte	0x4
	.file 43 "../../../../include/caribou/dev/gpio.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x2b
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF3973
	.file 44 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/gpio.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x2c
	.byte	0x7
	.4byte	.Ldebug_macro34
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro35
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro36
	.byte	0x4
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro37
	.byte	0x4
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x6
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4071
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x7
	.4byte	.Ldebug_macro38
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro39
	.byte	0x4
	.file 45 "../../../../include/caribou/kernel/interrupt.h"
	.byte	0x3
	.uleb128 0x19
	.uleb128 0x2d
	.byte	0x7
	.4byte	.Ldebug_macro40
	.byte	0x4
	.file 46 "../../../../include/caribou/lib/bytequeue.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4244
	.file 47 "../../../../include/caribou/lib/mutex.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x2f
	.byte	0x7
	.4byte	.Ldebug_macro41
	.byte	0x4
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF4251
	.byte	0x4
	.file 48 "../../../../include/caribou/lib/cbmath.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x30
	.byte	0x7
	.4byte	.Ldebug_macro42
	.byte	0x4
	.file 49 "../../../../include/caribou/lib/fault.h"
	.byte	0x3
	.uleb128 0x1e
	.uleb128 0x31
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4303
	.byte	0x4
	.file 50 "../../../../include/caribou/lib/heap.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x32
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4304
	.byte	0x4
	.file 51 "../../../../include/caribou/lib/qsort.h"
	.byte	0x3
	.uleb128 0x21
	.uleb128 0x33
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4305
	.byte	0x4
	.file 52 "../../../../include/caribou/lib/queue.h"
	.byte	0x3
	.uleb128 0x22
	.uleb128 0x34
	.byte	0x7
	.4byte	.Ldebug_macro43
	.byte	0x4
	.file 53 "../../../../include/caribou/lib/rand.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x35
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4313
	.byte	0x4
	.file 54 "../../../../include/caribou/lib/semaphore.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x36
	.byte	0x7
	.4byte	.Ldebug_macro44
	.byte	0x4
	.file 55 "../../../../include/caribou/lib/spinlock.h"
	.byte	0x3
	.uleb128 0x25
	.uleb128 0x37
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4319
	.byte	0x4
	.file 56 "../../../../include/caribou/lib/stdarg.h"
	.byte	0x3
	.uleb128 0x26
	.uleb128 0x38
	.byte	0x7
	.4byte	.Ldebug_macro45
	.byte	0x4
	.file 57 "../../../../include/caribou/lib/stddef.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x39
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4325
	.byte	0x4
	.file 58 "../../../../include/caribou/lib/stdint.h"
	.byte	0x3
	.uleb128 0x28
	.uleb128 0x3a
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4326
	.byte	0x4
	.file 59 "../../../../include/caribou/lib/stdio.h"
	.byte	0x3
	.uleb128 0x29
	.uleb128 0x3b
	.byte	0x7
	.4byte	.Ldebug_macro46
	.byte	0x4
	.file 60 "../../../../include/caribou/lib/string.h"
	.byte	0x3
	.uleb128 0x2a
	.uleb128 0x3c
	.byte	0x7
	.4byte	.Ldebug_macro47
	.byte	0x4
	.file 61 "../../../../include/caribou/dev/adc.h"
	.byte	0x3
	.uleb128 0x2c
	.uleb128 0x3d
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4342
	.file 62 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/adc.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x3e
	.byte	0x7
	.4byte	.Ldebug_macro48
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro49
	.byte	0x4
	.file 63 "../../../../include/caribou/dev/i2c.h"
	.byte	0x3
	.uleb128 0x2e
	.uleb128 0x3f
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4380
	.file 64 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/i2c.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x40
	.byte	0x7
	.4byte	.Ldebug_macro50
	.byte	0x4
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4383
	.byte	0x4
	.file 65 "../../../../include/caribou/dev/i2s.h"
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x41
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4384
	.file 66 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/i2s.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x42
	.byte	0x7
	.4byte	.Ldebug_macro51
	.byte	0x4
	.byte	0x4
	.file 67 "../../../../include/caribou/dev/spi.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x43
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4388
	.file 68 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/spi.h"
	.byte	0x3
	.uleb128 0x13
	.uleb128 0x44
	.byte	0x7
	.4byte	.Ldebug_macro52
	.byte	0x4
	.byte	0x4
	.file 69 "../../../../include/caribou/dev/uart.h"
	.byte	0x3
	.uleb128 0x31
	.uleb128 0x45
	.byte	0x7
	.4byte	.Ldebug_macro53
	.file 70 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/uart.h"
	.byte	0x3
	.uleb128 0x90
	.uleb128 0x46
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4399
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x45
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro54
	.byte	0x4
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x8
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4402
	.byte	0x4
	.file 71 "../../../../../caribou++/include/caribou++/cthread.h"
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0x47
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4403
	.file 72 "../../../../../caribou++/include/caribou++/cstring.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x48
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4404
	.file 73 "../../../../../caribou++/include/caribou++/cbytearray.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x49
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4405
	.byte	0x4
	.file 74 "../../../../../caribou++/include/caribou++/clist.h"
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x4a
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4406
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.file 75 "../../../../../caribou++/include/caribou++/ctimerevent.h"
	.byte	0x3
	.uleb128 0x1f
	.uleb128 0x4b
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4407
	.file 76 "../../../../../caribou++/include/caribou++/cevent.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x4c
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4408
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF4409
	.byte	0x4
	.file 77 "../../../../../caribou++/include/caribou++/cmutex.h"
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x4d
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4410
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.0.fefc1653436e9cd31ae315aa23be959b,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF0
	.byte	0x5
	.uleb128 0
	.4byte	.LASF1
	.byte	0x5
	.uleb128 0
	.4byte	.LASF2
	.byte	0x5
	.uleb128 0
	.4byte	.LASF3
	.byte	0x5
	.uleb128 0
	.4byte	.LASF4
	.byte	0x5
	.uleb128 0
	.4byte	.LASF5
	.byte	0x5
	.uleb128 0
	.4byte	.LASF6
	.byte	0x5
	.uleb128 0
	.4byte	.LASF7
	.byte	0x5
	.uleb128 0
	.4byte	.LASF8
	.byte	0x5
	.uleb128 0
	.4byte	.LASF9
	.byte	0x5
	.uleb128 0
	.4byte	.LASF10
	.byte	0x5
	.uleb128 0
	.4byte	.LASF11
	.byte	0x5
	.uleb128 0
	.4byte	.LASF12
	.byte	0x5
	.uleb128 0
	.4byte	.LASF13
	.byte	0x5
	.uleb128 0
	.4byte	.LASF14
	.byte	0x5
	.uleb128 0
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0
	.4byte	.LASF16
	.byte	0x5
	.uleb128 0
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0
	.4byte	.LASF23
	.byte	0x5
	.uleb128 0
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0
	.4byte	.LASF44
	.byte	0x5
	.uleb128 0
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.caribou_config.h.18.aa9ba0c879a67a396c27ce76eefb94f8,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF365
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdint.h.12.a46364249816572e638a099e1e002568,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF423
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF428
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.__crossworks.h.12.61bb4fabf92630af048d0ccca36b2d0e,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF431
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF450
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.17.843c62562a57aee81b0862358e7a7896,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x11
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF454
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.types.h.46.460eacf32782db15e99728547c2652d4,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF467
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.vectors.h.18.cfd6be0f50d11d9f1d0e79a5e1610d92,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x14
	.4byte	.LASF469
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx.h.54.664bd2bdbb20859ae6a5c66c16d4ee5a,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF487
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.core_cm0.h.32.41c1bd92799bc17b3c8424dd5c622427,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF495
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.core_cm0.h.130.a487ad9384999061f9f351c3b3d09770,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x149
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x165
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0x175
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0x19f
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0x1a3
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0x1a7
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0x1a8
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0x1ab
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0x1c5
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0x1c7
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0x1cb
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0x1cd
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0x1e8
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0x1ea
	.4byte	.LASF580
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx.h.226.38dd78fa77e64690c744af5bf4bffc7b,comdat
.Ldebug_macro11:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0x293
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0x294
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0x295
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0x298
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0x299
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0x29a
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0x29c
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0x29d
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0x29e
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0x29f
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0x2a0
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0x2a1
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0x2a2
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0x2a3
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0x2a4
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0x2a5
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0x2a6
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0x2a7
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0x2a8
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0x2a9
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0x2ab
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0x2ac
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0x2ad
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0x2ae
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0x2af
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0x2b0
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0x2b1
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0x2b2
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0x2b3
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0x2b4
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0x2b5
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0x2b6
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0x2b8
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0x2b9
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0x2ba
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0x2bb
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0x2bc
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0x2bd
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0x2be
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0x2bf
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0x2c0
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0x2c1
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x2c2
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x2c4
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x2c5
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x2c6
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x2c7
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x2c8
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x2d2
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x2d3
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x2d4
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x2d5
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x2d6
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x2d7
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x2d8
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x2d9
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x2da
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x2db
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x2dc
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x2dd
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x2de
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x2df
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x2e1
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x2e2
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x2e3
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0x2e4
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0x2e5
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0x2e6
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0x2e7
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0x2e8
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x2e9
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x2ea
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x2eb
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x2ec
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x2ee
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x2ef
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x2f0
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x2f1
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x2f2
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x2f3
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x2f4
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x2f5
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x2f6
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x2f7
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x2f8
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x2fa
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x2fb
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x2fc
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x2fd
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x2fe
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x315
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x316
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x317
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x318
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x319
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x31a
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x31d
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x320
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x321
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x322
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x323
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x324
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x325
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x328
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x32b
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x32c
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x32d
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x32e
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x32f
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x332
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x333
	.4byte	.LASF693
	.byte	0x5
	.uleb128 0x334
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x335
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x336
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x337
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x338
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x339
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x33a
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x33b
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x33c
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x33d
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x33e
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x33f
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x340
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x341
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0x342
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x343
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x344
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x345
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x346
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x347
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x348
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x349
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x34a
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x34b
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x34c
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x34f
	.4byte	.LASF719
	.byte	0x5
	.uleb128 0x352
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x353
	.4byte	.LASF721
	.byte	0x5
	.uleb128 0x356
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x357
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x358
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x359
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x35c
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x35f
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x362
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x363
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x364
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x365
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x366
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x367
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x368
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x369
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x36a
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0x36b
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0x36c
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0x36d
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0x36e
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0x36f
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0x370
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0x371
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0x372
	.4byte	.LASF744
	.byte	0x5
	.uleb128 0x373
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x374
	.4byte	.LASF746
	.byte	0x5
	.uleb128 0x377
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x37a
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x37b
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x37c
	.4byte	.LASF750
	.byte	0x5
	.uleb128 0x385
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0x386
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0x387
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0x38a
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0x38b
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0x38c
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0x38d
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0x38e
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0x38f
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0x390
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0x391
	.4byte	.LASF761
	.byte	0x5
	.uleb128 0x392
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0x395
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0x398
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0x39b
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0x39c
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0x39d
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x39e
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0x39f
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0x3a0
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0x3a1
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0x3a2
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0x3a3
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0x3a4
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0x3a5
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0x3a6
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0x3a7
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0x3aa
	.4byte	.LASF778
	.byte	0x5
	.uleb128 0x3ab
	.4byte	.LASF779
	.byte	0x5
	.uleb128 0x3ac
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0x3ad
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0x3ae
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0x3af
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0x3b0
	.4byte	.LASF784
	.byte	0x5
	.uleb128 0x3b1
	.4byte	.LASF785
	.byte	0x5
	.uleb128 0x3b2
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0x3b3
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0x3b4
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0x3b5
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0x3b6
	.4byte	.LASF790
	.byte	0x5
	.uleb128 0x3bf
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0x3c0
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0x3c1
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0x3c2
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0x3c3
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0x3c4
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0x3c5
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0x3c6
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0x3c7
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0x3c8
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0x3c9
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0x3ca
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0x3cb
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0x3cc
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0x3cd
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0x3ce
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0x3cf
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0x3d0
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x3d1
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x3d3
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x3d4
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x3d5
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x3d6
	.4byte	.LASF813
	.byte	0x5
	.uleb128 0x3d7
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x3d8
	.4byte	.LASF815
	.byte	0x5
	.uleb128 0x3d9
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x3da
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x3db
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x3dc
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x3dd
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x3de
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x3df
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x3e0
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x3e1
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x3e2
	.4byte	.LASF825
	.byte	0x5
	.uleb128 0x3e3
	.4byte	.LASF826
	.byte	0x5
	.uleb128 0x3e4
	.4byte	.LASF827
	.byte	0x5
	.uleb128 0x3e5
	.4byte	.LASF828
	.byte	0x5
	.uleb128 0x3ed
	.4byte	.LASF829
	.byte	0x5
	.uleb128 0x3f0
	.4byte	.LASF830
	.byte	0x5
	.uleb128 0x3f3
	.4byte	.LASF831
	.byte	0x5
	.uleb128 0x3f4
	.4byte	.LASF832
	.byte	0x5
	.uleb128 0x3f5
	.4byte	.LASF833
	.byte	0x5
	.uleb128 0x3f6
	.4byte	.LASF834
	.byte	0x5
	.uleb128 0x3f7
	.4byte	.LASF835
	.byte	0x5
	.uleb128 0x3fa
	.4byte	.LASF836
	.byte	0x5
	.uleb128 0x402
	.4byte	.LASF837
	.byte	0x5
	.uleb128 0x403
	.4byte	.LASF838
	.byte	0x5
	.uleb128 0x404
	.4byte	.LASF839
	.byte	0x5
	.uleb128 0x406
	.4byte	.LASF840
	.byte	0x5
	.uleb128 0x407
	.4byte	.LASF841
	.byte	0x5
	.uleb128 0x408
	.4byte	.LASF842
	.byte	0x5
	.uleb128 0x409
	.4byte	.LASF843
	.byte	0x5
	.uleb128 0x40b
	.4byte	.LASF844
	.byte	0x5
	.uleb128 0x40c
	.4byte	.LASF845
	.byte	0x5
	.uleb128 0x40e
	.4byte	.LASF846
	.byte	0x5
	.uleb128 0x411
	.4byte	.LASF847
	.byte	0x5
	.uleb128 0x414
	.4byte	.LASF848
	.byte	0x5
	.uleb128 0x417
	.4byte	.LASF849
	.byte	0x5
	.uleb128 0x41a
	.4byte	.LASF850
	.byte	0x5
	.uleb128 0x41d
	.4byte	.LASF851
	.byte	0x5
	.uleb128 0x427
	.4byte	.LASF852
	.byte	0x5
	.uleb128 0x429
	.4byte	.LASF853
	.byte	0x5
	.uleb128 0x42a
	.4byte	.LASF854
	.byte	0x5
	.uleb128 0x42b
	.4byte	.LASF855
	.byte	0x5
	.uleb128 0x42c
	.4byte	.LASF856
	.byte	0x5
	.uleb128 0x42d
	.4byte	.LASF857
	.byte	0x5
	.uleb128 0x42e
	.4byte	.LASF858
	.byte	0x5
	.uleb128 0x42f
	.4byte	.LASF859
	.byte	0x5
	.uleb128 0x430
	.4byte	.LASF860
	.byte	0x5
	.uleb128 0x431
	.4byte	.LASF861
	.byte	0x5
	.uleb128 0x432
	.4byte	.LASF862
	.byte	0x5
	.uleb128 0x433
	.4byte	.LASF863
	.byte	0x5
	.uleb128 0x434
	.4byte	.LASF864
	.byte	0x5
	.uleb128 0x435
	.4byte	.LASF865
	.byte	0x5
	.uleb128 0x436
	.4byte	.LASF866
	.byte	0x5
	.uleb128 0x437
	.4byte	.LASF867
	.byte	0x5
	.uleb128 0x438
	.4byte	.LASF868
	.byte	0x5
	.uleb128 0x439
	.4byte	.LASF869
	.byte	0x5
	.uleb128 0x43c
	.4byte	.LASF870
	.byte	0x5
	.uleb128 0x43d
	.4byte	.LASF871
	.byte	0x5
	.uleb128 0x440
	.4byte	.LASF872
	.byte	0x5
	.uleb128 0x441
	.4byte	.LASF873
	.byte	0x5
	.uleb128 0x442
	.4byte	.LASF874
	.byte	0x5
	.uleb128 0x443
	.4byte	.LASF875
	.byte	0x5
	.uleb128 0x444
	.4byte	.LASF876
	.byte	0x5
	.uleb128 0x445
	.4byte	.LASF877
	.byte	0x5
	.uleb128 0x446
	.4byte	.LASF878
	.byte	0x5
	.uleb128 0x447
	.4byte	.LASF879
	.byte	0x5
	.uleb128 0x44a
	.4byte	.LASF880
	.byte	0x5
	.uleb128 0x44b
	.4byte	.LASF881
	.byte	0x5
	.uleb128 0x44c
	.4byte	.LASF882
	.byte	0x5
	.uleb128 0x44d
	.4byte	.LASF883
	.byte	0x5
	.uleb128 0x456
	.4byte	.LASF884
	.byte	0x5
	.uleb128 0x457
	.4byte	.LASF885
	.byte	0x5
	.uleb128 0x458
	.4byte	.LASF886
	.byte	0x5
	.uleb128 0x459
	.4byte	.LASF887
	.byte	0x5
	.uleb128 0x45a
	.4byte	.LASF888
	.byte	0x5
	.uleb128 0x45b
	.4byte	.LASF889
	.byte	0x5
	.uleb128 0x45c
	.4byte	.LASF890
	.byte	0x5
	.uleb128 0x45d
	.4byte	.LASF891
	.byte	0x5
	.uleb128 0x45e
	.4byte	.LASF892
	.byte	0x5
	.uleb128 0x45f
	.4byte	.LASF893
	.byte	0x5
	.uleb128 0x460
	.4byte	.LASF894
	.byte	0x5
	.uleb128 0x461
	.4byte	.LASF895
	.byte	0x5
	.uleb128 0x462
	.4byte	.LASF896
	.byte	0x5
	.uleb128 0x463
	.4byte	.LASF897
	.byte	0x5
	.uleb128 0x464
	.4byte	.LASF898
	.byte	0x5
	.uleb128 0x465
	.4byte	.LASF899
	.byte	0x5
	.uleb128 0x466
	.4byte	.LASF900
	.byte	0x5
	.uleb128 0x467
	.4byte	.LASF901
	.byte	0x5
	.uleb128 0x468
	.4byte	.LASF902
	.byte	0x5
	.uleb128 0x469
	.4byte	.LASF903
	.byte	0x5
	.uleb128 0x46c
	.4byte	.LASF904
	.byte	0x5
	.uleb128 0x46d
	.4byte	.LASF905
	.byte	0x5
	.uleb128 0x46e
	.4byte	.LASF906
	.byte	0x5
	.uleb128 0x46f
	.4byte	.LASF907
	.byte	0x5
	.uleb128 0x470
	.4byte	.LASF908
	.byte	0x5
	.uleb128 0x471
	.4byte	.LASF909
	.byte	0x5
	.uleb128 0x472
	.4byte	.LASF910
	.byte	0x5
	.uleb128 0x473
	.4byte	.LASF911
	.byte	0x5
	.uleb128 0x474
	.4byte	.LASF912
	.byte	0x5
	.uleb128 0x475
	.4byte	.LASF913
	.byte	0x5
	.uleb128 0x476
	.4byte	.LASF914
	.byte	0x5
	.uleb128 0x477
	.4byte	.LASF915
	.byte	0x5
	.uleb128 0x478
	.4byte	.LASF916
	.byte	0x5
	.uleb128 0x479
	.4byte	.LASF917
	.byte	0x5
	.uleb128 0x47a
	.4byte	.LASF918
	.byte	0x5
	.uleb128 0x47b
	.4byte	.LASF919
	.byte	0x5
	.uleb128 0x47c
	.4byte	.LASF920
	.byte	0x5
	.uleb128 0x47d
	.4byte	.LASF921
	.byte	0x5
	.uleb128 0x47e
	.4byte	.LASF922
	.byte	0x5
	.uleb128 0x47f
	.4byte	.LASF923
	.byte	0x5
	.uleb128 0x482
	.4byte	.LASF924
	.byte	0x5
	.uleb128 0x483
	.4byte	.LASF925
	.byte	0x5
	.uleb128 0x484
	.4byte	.LASF926
	.byte	0x5
	.uleb128 0x485
	.4byte	.LASF927
	.byte	0x5
	.uleb128 0x486
	.4byte	.LASF928
	.byte	0x5
	.uleb128 0x487
	.4byte	.LASF929
	.byte	0x5
	.uleb128 0x488
	.4byte	.LASF930
	.byte	0x5
	.uleb128 0x489
	.4byte	.LASF931
	.byte	0x5
	.uleb128 0x48b
	.4byte	.LASF932
	.byte	0x5
	.uleb128 0x48c
	.4byte	.LASF933
	.byte	0x5
	.uleb128 0x48d
	.4byte	.LASF934
	.byte	0x5
	.uleb128 0x48f
	.4byte	.LASF935
	.byte	0x5
	.uleb128 0x490
	.4byte	.LASF936
	.byte	0x5
	.uleb128 0x491
	.4byte	.LASF937
	.byte	0x5
	.uleb128 0x493
	.4byte	.LASF938
	.byte	0x5
	.uleb128 0x494
	.4byte	.LASF939
	.byte	0x5
	.uleb128 0x495
	.4byte	.LASF940
	.byte	0x5
	.uleb128 0x497
	.4byte	.LASF941
	.byte	0x5
	.uleb128 0x49a
	.4byte	.LASF942
	.byte	0x5
	.uleb128 0x49d
	.4byte	.LASF943
	.byte	0x5
	.uleb128 0x4a0
	.4byte	.LASF944
	.byte	0x5
	.uleb128 0x4a8
	.4byte	.LASF945
	.byte	0x5
	.uleb128 0x4a9
	.4byte	.LASF946
	.byte	0x5
	.uleb128 0x4aa
	.4byte	.LASF947
	.byte	0x5
	.uleb128 0x4ab
	.4byte	.LASF948
	.byte	0x5
	.uleb128 0x4ac
	.4byte	.LASF949
	.byte	0x5
	.uleb128 0x4ad
	.4byte	.LASF950
	.byte	0x5
	.uleb128 0x4ae
	.4byte	.LASF951
	.byte	0x5
	.uleb128 0x4af
	.4byte	.LASF952
	.byte	0x5
	.uleb128 0x4b0
	.4byte	.LASF953
	.byte	0x5
	.uleb128 0x4b1
	.4byte	.LASF954
	.byte	0x5
	.uleb128 0x4b2
	.4byte	.LASF955
	.byte	0x5
	.uleb128 0x4b3
	.4byte	.LASF956
	.byte	0x5
	.uleb128 0x4b4
	.4byte	.LASF957
	.byte	0x5
	.uleb128 0x4b5
	.4byte	.LASF958
	.byte	0x5
	.uleb128 0x4b6
	.4byte	.LASF959
	.byte	0x5
	.uleb128 0x4b7
	.4byte	.LASF960
	.byte	0x5
	.uleb128 0x4b8
	.4byte	.LASF961
	.byte	0x5
	.uleb128 0x4b9
	.4byte	.LASF962
	.byte	0x5
	.uleb128 0x4ba
	.4byte	.LASF963
	.byte	0x5
	.uleb128 0x4bb
	.4byte	.LASF964
	.byte	0x5
	.uleb128 0x4bc
	.4byte	.LASF965
	.byte	0x5
	.uleb128 0x4bd
	.4byte	.LASF966
	.byte	0x5
	.uleb128 0x4be
	.4byte	.LASF967
	.byte	0x5
	.uleb128 0x4bf
	.4byte	.LASF968
	.byte	0x5
	.uleb128 0x4c2
	.4byte	.LASF969
	.byte	0x5
	.uleb128 0x4c3
	.4byte	.LASF970
	.byte	0x5
	.uleb128 0x4c4
	.4byte	.LASF971
	.byte	0x5
	.uleb128 0x4c5
	.4byte	.LASF972
	.byte	0x5
	.uleb128 0x4c6
	.4byte	.LASF973
	.byte	0x5
	.uleb128 0x4c7
	.4byte	.LASF974
	.byte	0x5
	.uleb128 0x4c8
	.4byte	.LASF975
	.byte	0x5
	.uleb128 0x4c9
	.4byte	.LASF976
	.byte	0x5
	.uleb128 0x4ca
	.4byte	.LASF977
	.byte	0x5
	.uleb128 0x4cb
	.4byte	.LASF978
	.byte	0x5
	.uleb128 0x4cc
	.4byte	.LASF979
	.byte	0x5
	.uleb128 0x4cd
	.4byte	.LASF980
	.byte	0x5
	.uleb128 0x4ce
	.4byte	.LASF981
	.byte	0x5
	.uleb128 0x4cf
	.4byte	.LASF982
	.byte	0x5
	.uleb128 0x4d0
	.4byte	.LASF983
	.byte	0x5
	.uleb128 0x4d1
	.4byte	.LASF984
	.byte	0x5
	.uleb128 0x4d2
	.4byte	.LASF985
	.byte	0x5
	.uleb128 0x4d3
	.4byte	.LASF986
	.byte	0x5
	.uleb128 0x4d4
	.4byte	.LASF987
	.byte	0x5
	.uleb128 0x4d5
	.4byte	.LASF988
	.byte	0x5
	.uleb128 0x4d6
	.4byte	.LASF989
	.byte	0x5
	.uleb128 0x4d7
	.4byte	.LASF990
	.byte	0x5
	.uleb128 0x4d8
	.4byte	.LASF991
	.byte	0x5
	.uleb128 0x4d9
	.4byte	.LASF992
	.byte	0x5
	.uleb128 0x4dc
	.4byte	.LASF993
	.byte	0x5
	.uleb128 0x4dd
	.4byte	.LASF994
	.byte	0x5
	.uleb128 0x4de
	.4byte	.LASF995
	.byte	0x5
	.uleb128 0x4df
	.4byte	.LASF996
	.byte	0x5
	.uleb128 0x4e0
	.4byte	.LASF997
	.byte	0x5
	.uleb128 0x4e1
	.4byte	.LASF998
	.byte	0x5
	.uleb128 0x4e2
	.4byte	.LASF999
	.byte	0x5
	.uleb128 0x4e3
	.4byte	.LASF1000
	.byte	0x5
	.uleb128 0x4e4
	.4byte	.LASF1001
	.byte	0x5
	.uleb128 0x4e5
	.4byte	.LASF1002
	.byte	0x5
	.uleb128 0x4e6
	.4byte	.LASF1003
	.byte	0x5
	.uleb128 0x4e7
	.4byte	.LASF1004
	.byte	0x5
	.uleb128 0x4e8
	.4byte	.LASF1005
	.byte	0x5
	.uleb128 0x4e9
	.4byte	.LASF1006
	.byte	0x5
	.uleb128 0x4ea
	.4byte	.LASF1007
	.byte	0x5
	.uleb128 0x4eb
	.4byte	.LASF1008
	.byte	0x5
	.uleb128 0x4ec
	.4byte	.LASF1009
	.byte	0x5
	.uleb128 0x4ed
	.4byte	.LASF1010
	.byte	0x5
	.uleb128 0x4ee
	.4byte	.LASF1011
	.byte	0x5
	.uleb128 0x4f1
	.4byte	.LASF1012
	.byte	0x5
	.uleb128 0x4f2
	.4byte	.LASF1013
	.byte	0x5
	.uleb128 0x4f3
	.4byte	.LASF1014
	.byte	0x5
	.uleb128 0x4f4
	.4byte	.LASF1015
	.byte	0x5
	.uleb128 0x4f5
	.4byte	.LASF1016
	.byte	0x5
	.uleb128 0x4f6
	.4byte	.LASF1017
	.byte	0x5
	.uleb128 0x4f7
	.4byte	.LASF1018
	.byte	0x5
	.uleb128 0x4f8
	.4byte	.LASF1019
	.byte	0x5
	.uleb128 0x4f9
	.4byte	.LASF1020
	.byte	0x5
	.uleb128 0x4fa
	.4byte	.LASF1021
	.byte	0x5
	.uleb128 0x4fb
	.4byte	.LASF1022
	.byte	0x5
	.uleb128 0x4fc
	.4byte	.LASF1023
	.byte	0x5
	.uleb128 0x4fd
	.4byte	.LASF1024
	.byte	0x5
	.uleb128 0x4fe
	.4byte	.LASF1025
	.byte	0x5
	.uleb128 0x4ff
	.4byte	.LASF1026
	.byte	0x5
	.uleb128 0x500
	.4byte	.LASF1027
	.byte	0x5
	.uleb128 0x501
	.4byte	.LASF1028
	.byte	0x5
	.uleb128 0x502
	.4byte	.LASF1029
	.byte	0x5
	.uleb128 0x503
	.4byte	.LASF1030
	.byte	0x5
	.uleb128 0x506
	.4byte	.LASF1031
	.byte	0x5
	.uleb128 0x507
	.4byte	.LASF1032
	.byte	0x5
	.uleb128 0x508
	.4byte	.LASF1033
	.byte	0x5
	.uleb128 0x509
	.4byte	.LASF1034
	.byte	0x5
	.uleb128 0x50a
	.4byte	.LASF1035
	.byte	0x5
	.uleb128 0x50b
	.4byte	.LASF1036
	.byte	0x5
	.uleb128 0x50c
	.4byte	.LASF1037
	.byte	0x5
	.uleb128 0x50d
	.4byte	.LASF1038
	.byte	0x5
	.uleb128 0x50e
	.4byte	.LASF1039
	.byte	0x5
	.uleb128 0x50f
	.4byte	.LASF1040
	.byte	0x5
	.uleb128 0x510
	.4byte	.LASF1041
	.byte	0x5
	.uleb128 0x511
	.4byte	.LASF1042
	.byte	0x5
	.uleb128 0x512
	.4byte	.LASF1043
	.byte	0x5
	.uleb128 0x513
	.4byte	.LASF1044
	.byte	0x5
	.uleb128 0x514
	.4byte	.LASF1045
	.byte	0x5
	.uleb128 0x515
	.4byte	.LASF1046
	.byte	0x5
	.uleb128 0x516
	.4byte	.LASF1047
	.byte	0x5
	.uleb128 0x517
	.4byte	.LASF1048
	.byte	0x5
	.uleb128 0x518
	.4byte	.LASF1049
	.byte	0x5
	.uleb128 0x51b
	.4byte	.LASF1050
	.byte	0x5
	.uleb128 0x51c
	.4byte	.LASF1051
	.byte	0x5
	.uleb128 0x51d
	.4byte	.LASF1052
	.byte	0x5
	.uleb128 0x51e
	.4byte	.LASF1053
	.byte	0x5
	.uleb128 0x51f
	.4byte	.LASF1054
	.byte	0x5
	.uleb128 0x520
	.4byte	.LASF1055
	.byte	0x5
	.uleb128 0x521
	.4byte	.LASF1056
	.byte	0x5
	.uleb128 0x522
	.4byte	.LASF1057
	.byte	0x5
	.uleb128 0x523
	.4byte	.LASF1058
	.byte	0x5
	.uleb128 0x524
	.4byte	.LASF1059
	.byte	0x5
	.uleb128 0x525
	.4byte	.LASF1060
	.byte	0x5
	.uleb128 0x526
	.4byte	.LASF1061
	.byte	0x5
	.uleb128 0x527
	.4byte	.LASF1062
	.byte	0x5
	.uleb128 0x528
	.4byte	.LASF1063
	.byte	0x5
	.uleb128 0x529
	.4byte	.LASF1064
	.byte	0x5
	.uleb128 0x52a
	.4byte	.LASF1065
	.byte	0x5
	.uleb128 0x52b
	.4byte	.LASF1066
	.byte	0x5
	.uleb128 0x52c
	.4byte	.LASF1067
	.byte	0x5
	.uleb128 0x52d
	.4byte	.LASF1068
	.byte	0x5
	.uleb128 0x536
	.4byte	.LASF1069
	.byte	0x5
	.uleb128 0x538
	.4byte	.LASF1070
	.byte	0x5
	.uleb128 0x539
	.4byte	.LASF1071
	.byte	0x5
	.uleb128 0x53c
	.4byte	.LASF1072
	.byte	0x5
	.uleb128 0x53f
	.4byte	.LASF1073
	.byte	0x5
	.uleb128 0x542
	.4byte	.LASF1074
	.byte	0x5
	.uleb128 0x543
	.4byte	.LASF1075
	.byte	0x5
	.uleb128 0x546
	.4byte	.LASF1076
	.byte	0x5
	.uleb128 0x547
	.4byte	.LASF1077
	.byte	0x5
	.uleb128 0x54b
	.4byte	.LASF1078
	.byte	0x5
	.uleb128 0x54c
	.4byte	.LASF1079
	.byte	0x5
	.uleb128 0x54d
	.4byte	.LASF1080
	.byte	0x5
	.uleb128 0x54e
	.4byte	.LASF1081
	.byte	0x5
	.uleb128 0x551
	.4byte	.LASF1082
	.byte	0x5
	.uleb128 0x552
	.4byte	.LASF1083
	.byte	0x5
	.uleb128 0x553
	.4byte	.LASF1084
	.byte	0x5
	.uleb128 0x554
	.4byte	.LASF1085
	.byte	0x5
	.uleb128 0x555
	.4byte	.LASF1086
	.byte	0x5
	.uleb128 0x556
	.4byte	.LASF1087
	.byte	0x5
	.uleb128 0x557
	.4byte	.LASF1088
	.byte	0x5
	.uleb128 0x558
	.4byte	.LASF1089
	.byte	0x5
	.uleb128 0x559
	.4byte	.LASF1090
	.byte	0x5
	.uleb128 0x55a
	.4byte	.LASF1091
	.byte	0x5
	.uleb128 0x55b
	.4byte	.LASF1092
	.byte	0x5
	.uleb128 0x55e
	.4byte	.LASF1093
	.byte	0x5
	.uleb128 0x561
	.4byte	.LASF1094
	.byte	0x5
	.uleb128 0x562
	.4byte	.LASF1095
	.byte	0x5
	.uleb128 0x563
	.4byte	.LASF1096
	.byte	0x5
	.uleb128 0x565
	.4byte	.LASF1097
	.byte	0x5
	.uleb128 0x566
	.4byte	.LASF1098
	.byte	0x5
	.uleb128 0x567
	.4byte	.LASF1099
	.byte	0x5
	.uleb128 0x568
	.4byte	.LASF1100
	.byte	0x5
	.uleb128 0x569
	.4byte	.LASF1101
	.byte	0x5
	.uleb128 0x56a
	.4byte	.LASF1102
	.byte	0x5
	.uleb128 0x56d
	.4byte	.LASF1103
	.byte	0x5
	.uleb128 0x570
	.4byte	.LASF1104
	.byte	0x5
	.uleb128 0x573
	.4byte	.LASF1105
	.byte	0x5
	.uleb128 0x578
	.4byte	.LASF1106
	.byte	0x5
	.uleb128 0x579
	.4byte	.LASF1107
	.byte	0x5
	.uleb128 0x57c
	.4byte	.LASF1108
	.byte	0x5
	.uleb128 0x57d
	.4byte	.LASF1109
	.byte	0x5
	.uleb128 0x580
	.4byte	.LASF1110
	.byte	0x5
	.uleb128 0x581
	.4byte	.LASF1111
	.byte	0x5
	.uleb128 0x584
	.4byte	.LASF1112
	.byte	0x5
	.uleb128 0x585
	.4byte	.LASF1113
	.byte	0x5
	.uleb128 0x58d
	.4byte	.LASF1114
	.byte	0x5
	.uleb128 0x58e
	.4byte	.LASF1115
	.byte	0x5
	.uleb128 0x58f
	.4byte	.LASF1116
	.byte	0x5
	.uleb128 0x590
	.4byte	.LASF1117
	.byte	0x5
	.uleb128 0x591
	.4byte	.LASF1118
	.byte	0x5
	.uleb128 0x592
	.4byte	.LASF1119
	.byte	0x5
	.uleb128 0x593
	.4byte	.LASF1120
	.byte	0x5
	.uleb128 0x594
	.4byte	.LASF1121
	.byte	0x5
	.uleb128 0x595
	.4byte	.LASF1122
	.byte	0x5
	.uleb128 0x596
	.4byte	.LASF1123
	.byte	0x5
	.uleb128 0x597
	.4byte	.LASF1124
	.byte	0x5
	.uleb128 0x598
	.4byte	.LASF1125
	.byte	0x5
	.uleb128 0x599
	.4byte	.LASF1126
	.byte	0x5
	.uleb128 0x59a
	.4byte	.LASF1127
	.byte	0x5
	.uleb128 0x59b
	.4byte	.LASF1128
	.byte	0x5
	.uleb128 0x59c
	.4byte	.LASF1129
	.byte	0x5
	.uleb128 0x59d
	.4byte	.LASF1130
	.byte	0x5
	.uleb128 0x59e
	.4byte	.LASF1131
	.byte	0x5
	.uleb128 0x59f
	.4byte	.LASF1132
	.byte	0x5
	.uleb128 0x5a0
	.4byte	.LASF1133
	.byte	0x5
	.uleb128 0x5a1
	.4byte	.LASF1134
	.byte	0x5
	.uleb128 0x5a2
	.4byte	.LASF1135
	.byte	0x5
	.uleb128 0x5a3
	.4byte	.LASF1136
	.byte	0x5
	.uleb128 0x5a4
	.4byte	.LASF1137
	.byte	0x5
	.uleb128 0x5a5
	.4byte	.LASF1138
	.byte	0x5
	.uleb128 0x5a6
	.4byte	.LASF1139
	.byte	0x5
	.uleb128 0x5a7
	.4byte	.LASF1140
	.byte	0x5
	.uleb128 0x5a8
	.4byte	.LASF1141
	.byte	0x5
	.uleb128 0x5a9
	.4byte	.LASF1142
	.byte	0x5
	.uleb128 0x5aa
	.4byte	.LASF1143
	.byte	0x5
	.uleb128 0x5ab
	.4byte	.LASF1144
	.byte	0x5
	.uleb128 0x5ac
	.4byte	.LASF1145
	.byte	0x5
	.uleb128 0x5ad
	.4byte	.LASF1146
	.byte	0x5
	.uleb128 0x5ae
	.4byte	.LASF1147
	.byte	0x5
	.uleb128 0x5af
	.4byte	.LASF1148
	.byte	0x5
	.uleb128 0x5b0
	.4byte	.LASF1149
	.byte	0x5
	.uleb128 0x5b1
	.4byte	.LASF1150
	.byte	0x5
	.uleb128 0x5b2
	.4byte	.LASF1151
	.byte	0x5
	.uleb128 0x5b3
	.4byte	.LASF1152
	.byte	0x5
	.uleb128 0x5b4
	.4byte	.LASF1153
	.byte	0x5
	.uleb128 0x5b5
	.4byte	.LASF1154
	.byte	0x5
	.uleb128 0x5b6
	.4byte	.LASF1155
	.byte	0x5
	.uleb128 0x5b7
	.4byte	.LASF1156
	.byte	0x5
	.uleb128 0x5b8
	.4byte	.LASF1157
	.byte	0x5
	.uleb128 0x5b9
	.4byte	.LASF1158
	.byte	0x5
	.uleb128 0x5ba
	.4byte	.LASF1159
	.byte	0x5
	.uleb128 0x5bb
	.4byte	.LASF1160
	.byte	0x5
	.uleb128 0x5bc
	.4byte	.LASF1161
	.byte	0x5
	.uleb128 0x5bf
	.4byte	.LASF1162
	.byte	0x5
	.uleb128 0x5c0
	.4byte	.LASF1163
	.byte	0x5
	.uleb128 0x5c1
	.4byte	.LASF1164
	.byte	0x5
	.uleb128 0x5c2
	.4byte	.LASF1165
	.byte	0x5
	.uleb128 0x5c3
	.4byte	.LASF1166
	.byte	0x5
	.uleb128 0x5c4
	.4byte	.LASF1167
	.byte	0x5
	.uleb128 0x5c5
	.4byte	.LASF1168
	.byte	0x5
	.uleb128 0x5c6
	.4byte	.LASF1169
	.byte	0x5
	.uleb128 0x5c7
	.4byte	.LASF1170
	.byte	0x5
	.uleb128 0x5c8
	.4byte	.LASF1171
	.byte	0x5
	.uleb128 0x5c9
	.4byte	.LASF1172
	.byte	0x5
	.uleb128 0x5ca
	.4byte	.LASF1173
	.byte	0x5
	.uleb128 0x5cb
	.4byte	.LASF1174
	.byte	0x5
	.uleb128 0x5cc
	.4byte	.LASF1175
	.byte	0x5
	.uleb128 0x5cd
	.4byte	.LASF1176
	.byte	0x5
	.uleb128 0x5ce
	.4byte	.LASF1177
	.byte	0x5
	.uleb128 0x5d1
	.4byte	.LASF1178
	.byte	0x5
	.uleb128 0x5d2
	.4byte	.LASF1179
	.byte	0x5
	.uleb128 0x5d3
	.4byte	.LASF1180
	.byte	0x5
	.uleb128 0x5d4
	.4byte	.LASF1181
	.byte	0x5
	.uleb128 0x5d5
	.4byte	.LASF1182
	.byte	0x5
	.uleb128 0x5d6
	.4byte	.LASF1183
	.byte	0x5
	.uleb128 0x5d7
	.4byte	.LASF1184
	.byte	0x5
	.uleb128 0x5d8
	.4byte	.LASF1185
	.byte	0x5
	.uleb128 0x5d9
	.4byte	.LASF1186
	.byte	0x5
	.uleb128 0x5da
	.4byte	.LASF1187
	.byte	0x5
	.uleb128 0x5db
	.4byte	.LASF1188
	.byte	0x5
	.uleb128 0x5dc
	.4byte	.LASF1189
	.byte	0x5
	.uleb128 0x5dd
	.4byte	.LASF1190
	.byte	0x5
	.uleb128 0x5de
	.4byte	.LASF1191
	.byte	0x5
	.uleb128 0x5df
	.4byte	.LASF1192
	.byte	0x5
	.uleb128 0x5e0
	.4byte	.LASF1193
	.byte	0x5
	.uleb128 0x5e1
	.4byte	.LASF1194
	.byte	0x5
	.uleb128 0x5e2
	.4byte	.LASF1195
	.byte	0x5
	.uleb128 0x5e3
	.4byte	.LASF1196
	.byte	0x5
	.uleb128 0x5e4
	.4byte	.LASF1197
	.byte	0x5
	.uleb128 0x5e5
	.4byte	.LASF1198
	.byte	0x5
	.uleb128 0x5e6
	.4byte	.LASF1199
	.byte	0x5
	.uleb128 0x5e7
	.4byte	.LASF1200
	.byte	0x5
	.uleb128 0x5e8
	.4byte	.LASF1201
	.byte	0x5
	.uleb128 0x5e9
	.4byte	.LASF1202
	.byte	0x5
	.uleb128 0x5ea
	.4byte	.LASF1203
	.byte	0x5
	.uleb128 0x5eb
	.4byte	.LASF1204
	.byte	0x5
	.uleb128 0x5ec
	.4byte	.LASF1205
	.byte	0x5
	.uleb128 0x5ed
	.4byte	.LASF1206
	.byte	0x5
	.uleb128 0x5ee
	.4byte	.LASF1207
	.byte	0x5
	.uleb128 0x5ef
	.4byte	.LASF1208
	.byte	0x5
	.uleb128 0x5f0
	.4byte	.LASF1209
	.byte	0x5
	.uleb128 0x5f1
	.4byte	.LASF1210
	.byte	0x5
	.uleb128 0x5f2
	.4byte	.LASF1211
	.byte	0x5
	.uleb128 0x5f3
	.4byte	.LASF1212
	.byte	0x5
	.uleb128 0x5f4
	.4byte	.LASF1213
	.byte	0x5
	.uleb128 0x5f5
	.4byte	.LASF1214
	.byte	0x5
	.uleb128 0x5f6
	.4byte	.LASF1215
	.byte	0x5
	.uleb128 0x5f7
	.4byte	.LASF1216
	.byte	0x5
	.uleb128 0x5f8
	.4byte	.LASF1217
	.byte	0x5
	.uleb128 0x5f9
	.4byte	.LASF1218
	.byte	0x5
	.uleb128 0x5fa
	.4byte	.LASF1219
	.byte	0x5
	.uleb128 0x5fb
	.4byte	.LASF1220
	.byte	0x5
	.uleb128 0x5fc
	.4byte	.LASF1221
	.byte	0x5
	.uleb128 0x5fd
	.4byte	.LASF1222
	.byte	0x5
	.uleb128 0x5fe
	.4byte	.LASF1223
	.byte	0x5
	.uleb128 0x5ff
	.4byte	.LASF1224
	.byte	0x5
	.uleb128 0x600
	.4byte	.LASF1225
	.byte	0x5
	.uleb128 0x603
	.4byte	.LASF1226
	.byte	0x5
	.uleb128 0x604
	.4byte	.LASF1227
	.byte	0x5
	.uleb128 0x605
	.4byte	.LASF1228
	.byte	0x5
	.uleb128 0x606
	.4byte	.LASF1229
	.byte	0x5
	.uleb128 0x607
	.4byte	.LASF1230
	.byte	0x5
	.uleb128 0x608
	.4byte	.LASF1231
	.byte	0x5
	.uleb128 0x609
	.4byte	.LASF1232
	.byte	0x5
	.uleb128 0x60a
	.4byte	.LASF1233
	.byte	0x5
	.uleb128 0x60b
	.4byte	.LASF1234
	.byte	0x5
	.uleb128 0x60c
	.4byte	.LASF1235
	.byte	0x5
	.uleb128 0x60d
	.4byte	.LASF1236
	.byte	0x5
	.uleb128 0x60e
	.4byte	.LASF1237
	.byte	0x5
	.uleb128 0x60f
	.4byte	.LASF1238
	.byte	0x5
	.uleb128 0x610
	.4byte	.LASF1239
	.byte	0x5
	.uleb128 0x611
	.4byte	.LASF1240
	.byte	0x5
	.uleb128 0x612
	.4byte	.LASF1241
	.byte	0x5
	.uleb128 0x613
	.4byte	.LASF1242
	.byte	0x5
	.uleb128 0x614
	.4byte	.LASF1243
	.byte	0x5
	.uleb128 0x615
	.4byte	.LASF1244
	.byte	0x5
	.uleb128 0x616
	.4byte	.LASF1245
	.byte	0x5
	.uleb128 0x617
	.4byte	.LASF1246
	.byte	0x5
	.uleb128 0x618
	.4byte	.LASF1247
	.byte	0x5
	.uleb128 0x619
	.4byte	.LASF1248
	.byte	0x5
	.uleb128 0x61a
	.4byte	.LASF1249
	.byte	0x5
	.uleb128 0x61b
	.4byte	.LASF1250
	.byte	0x5
	.uleb128 0x61c
	.4byte	.LASF1251
	.byte	0x5
	.uleb128 0x61d
	.4byte	.LASF1252
	.byte	0x5
	.uleb128 0x61e
	.4byte	.LASF1253
	.byte	0x5
	.uleb128 0x61f
	.4byte	.LASF1254
	.byte	0x5
	.uleb128 0x620
	.4byte	.LASF1255
	.byte	0x5
	.uleb128 0x621
	.4byte	.LASF1256
	.byte	0x5
	.uleb128 0x622
	.4byte	.LASF1257
	.byte	0x5
	.uleb128 0x623
	.4byte	.LASF1258
	.byte	0x5
	.uleb128 0x624
	.4byte	.LASF1259
	.byte	0x5
	.uleb128 0x625
	.4byte	.LASF1260
	.byte	0x5
	.uleb128 0x626
	.4byte	.LASF1261
	.byte	0x5
	.uleb128 0x627
	.4byte	.LASF1262
	.byte	0x5
	.uleb128 0x628
	.4byte	.LASF1263
	.byte	0x5
	.uleb128 0x629
	.4byte	.LASF1264
	.byte	0x5
	.uleb128 0x62a
	.4byte	.LASF1265
	.byte	0x5
	.uleb128 0x62b
	.4byte	.LASF1266
	.byte	0x5
	.uleb128 0x62c
	.4byte	.LASF1267
	.byte	0x5
	.uleb128 0x62d
	.4byte	.LASF1268
	.byte	0x5
	.uleb128 0x62e
	.4byte	.LASF1269
	.byte	0x5
	.uleb128 0x62f
	.4byte	.LASF1270
	.byte	0x5
	.uleb128 0x630
	.4byte	.LASF1271
	.byte	0x5
	.uleb128 0x631
	.4byte	.LASF1272
	.byte	0x5
	.uleb128 0x632
	.4byte	.LASF1273
	.byte	0x5
	.uleb128 0x635
	.4byte	.LASF1274
	.byte	0x5
	.uleb128 0x636
	.4byte	.LASF1275
	.byte	0x5
	.uleb128 0x637
	.4byte	.LASF1276
	.byte	0x5
	.uleb128 0x638
	.4byte	.LASF1277
	.byte	0x5
	.uleb128 0x639
	.4byte	.LASF1278
	.byte	0x5
	.uleb128 0x63a
	.4byte	.LASF1279
	.byte	0x5
	.uleb128 0x63b
	.4byte	.LASF1280
	.byte	0x5
	.uleb128 0x63c
	.4byte	.LASF1281
	.byte	0x5
	.uleb128 0x63d
	.4byte	.LASF1282
	.byte	0x5
	.uleb128 0x63e
	.4byte	.LASF1283
	.byte	0x5
	.uleb128 0x63f
	.4byte	.LASF1284
	.byte	0x5
	.uleb128 0x640
	.4byte	.LASF1285
	.byte	0x5
	.uleb128 0x641
	.4byte	.LASF1286
	.byte	0x5
	.uleb128 0x642
	.4byte	.LASF1287
	.byte	0x5
	.uleb128 0x643
	.4byte	.LASF1288
	.byte	0x5
	.uleb128 0x644
	.4byte	.LASF1289
	.byte	0x5
	.uleb128 0x647
	.4byte	.LASF1290
	.byte	0x5
	.uleb128 0x648
	.4byte	.LASF1291
	.byte	0x5
	.uleb128 0x649
	.4byte	.LASF1292
	.byte	0x5
	.uleb128 0x64a
	.4byte	.LASF1293
	.byte	0x5
	.uleb128 0x64b
	.4byte	.LASF1294
	.byte	0x5
	.uleb128 0x64c
	.4byte	.LASF1295
	.byte	0x5
	.uleb128 0x64d
	.4byte	.LASF1296
	.byte	0x5
	.uleb128 0x64e
	.4byte	.LASF1297
	.byte	0x5
	.uleb128 0x64f
	.4byte	.LASF1298
	.byte	0x5
	.uleb128 0x650
	.4byte	.LASF1299
	.byte	0x5
	.uleb128 0x651
	.4byte	.LASF1300
	.byte	0x5
	.uleb128 0x652
	.4byte	.LASF1301
	.byte	0x5
	.uleb128 0x653
	.4byte	.LASF1302
	.byte	0x5
	.uleb128 0x654
	.4byte	.LASF1303
	.byte	0x5
	.uleb128 0x655
	.4byte	.LASF1304
	.byte	0x5
	.uleb128 0x656
	.4byte	.LASF1305
	.byte	0x5
	.uleb128 0x659
	.4byte	.LASF1306
	.byte	0x5
	.uleb128 0x65a
	.4byte	.LASF1307
	.byte	0x5
	.uleb128 0x65b
	.4byte	.LASF1308
	.byte	0x5
	.uleb128 0x65c
	.4byte	.LASF1309
	.byte	0x5
	.uleb128 0x65d
	.4byte	.LASF1310
	.byte	0x5
	.uleb128 0x65e
	.4byte	.LASF1311
	.byte	0x5
	.uleb128 0x65f
	.4byte	.LASF1312
	.byte	0x5
	.uleb128 0x660
	.4byte	.LASF1313
	.byte	0x5
	.uleb128 0x661
	.4byte	.LASF1314
	.byte	0x5
	.uleb128 0x662
	.4byte	.LASF1315
	.byte	0x5
	.uleb128 0x663
	.4byte	.LASF1316
	.byte	0x5
	.uleb128 0x664
	.4byte	.LASF1317
	.byte	0x5
	.uleb128 0x665
	.4byte	.LASF1318
	.byte	0x5
	.uleb128 0x666
	.4byte	.LASF1319
	.byte	0x5
	.uleb128 0x667
	.4byte	.LASF1320
	.byte	0x5
	.uleb128 0x668
	.4byte	.LASF1321
	.byte	0x5
	.uleb128 0x669
	.4byte	.LASF1322
	.byte	0x5
	.uleb128 0x66a
	.4byte	.LASF1323
	.byte	0x5
	.uleb128 0x66b
	.4byte	.LASF1324
	.byte	0x5
	.uleb128 0x66c
	.4byte	.LASF1325
	.byte	0x5
	.uleb128 0x66d
	.4byte	.LASF1326
	.byte	0x5
	.uleb128 0x66e
	.4byte	.LASF1327
	.byte	0x5
	.uleb128 0x66f
	.4byte	.LASF1328
	.byte	0x5
	.uleb128 0x670
	.4byte	.LASF1329
	.byte	0x5
	.uleb128 0x671
	.4byte	.LASF1330
	.byte	0x5
	.uleb128 0x672
	.4byte	.LASF1331
	.byte	0x5
	.uleb128 0x673
	.4byte	.LASF1332
	.byte	0x5
	.uleb128 0x674
	.4byte	.LASF1333
	.byte	0x5
	.uleb128 0x675
	.4byte	.LASF1334
	.byte	0x5
	.uleb128 0x676
	.4byte	.LASF1335
	.byte	0x5
	.uleb128 0x677
	.4byte	.LASF1336
	.byte	0x5
	.uleb128 0x678
	.4byte	.LASF1337
	.byte	0x5
	.uleb128 0x67b
	.4byte	.LASF1338
	.byte	0x5
	.uleb128 0x67c
	.4byte	.LASF1339
	.byte	0x5
	.uleb128 0x67d
	.4byte	.LASF1340
	.byte	0x5
	.uleb128 0x67e
	.4byte	.LASF1341
	.byte	0x5
	.uleb128 0x67f
	.4byte	.LASF1342
	.byte	0x5
	.uleb128 0x680
	.4byte	.LASF1343
	.byte	0x5
	.uleb128 0x681
	.4byte	.LASF1344
	.byte	0x5
	.uleb128 0x682
	.4byte	.LASF1345
	.byte	0x5
	.uleb128 0x683
	.4byte	.LASF1346
	.byte	0x5
	.uleb128 0x684
	.4byte	.LASF1347
	.byte	0x5
	.uleb128 0x685
	.4byte	.LASF1348
	.byte	0x5
	.uleb128 0x686
	.4byte	.LASF1349
	.byte	0x5
	.uleb128 0x687
	.4byte	.LASF1350
	.byte	0x5
	.uleb128 0x688
	.4byte	.LASF1351
	.byte	0x5
	.uleb128 0x689
	.4byte	.LASF1352
	.byte	0x5
	.uleb128 0x68a
	.4byte	.LASF1353
	.byte	0x5
	.uleb128 0x68b
	.4byte	.LASF1354
	.byte	0x5
	.uleb128 0x68e
	.4byte	.LASF1355
	.byte	0x5
	.uleb128 0x68f
	.4byte	.LASF1356
	.byte	0x5
	.uleb128 0x690
	.4byte	.LASF1357
	.byte	0x5
	.uleb128 0x691
	.4byte	.LASF1358
	.byte	0x5
	.uleb128 0x692
	.4byte	.LASF1359
	.byte	0x5
	.uleb128 0x693
	.4byte	.LASF1360
	.byte	0x5
	.uleb128 0x694
	.4byte	.LASF1361
	.byte	0x5
	.uleb128 0x695
	.4byte	.LASF1362
	.byte	0x5
	.uleb128 0x698
	.4byte	.LASF1363
	.byte	0x5
	.uleb128 0x699
	.4byte	.LASF1364
	.byte	0x5
	.uleb128 0x69a
	.4byte	.LASF1365
	.byte	0x5
	.uleb128 0x69b
	.4byte	.LASF1366
	.byte	0x5
	.uleb128 0x69c
	.4byte	.LASF1367
	.byte	0x5
	.uleb128 0x69d
	.4byte	.LASF1368
	.byte	0x5
	.uleb128 0x69e
	.4byte	.LASF1369
	.byte	0x5
	.uleb128 0x69f
	.4byte	.LASF1370
	.byte	0x5
	.uleb128 0x6a2
	.4byte	.LASF1371
	.byte	0x5
	.uleb128 0x6a3
	.4byte	.LASF1372
	.byte	0x5
	.uleb128 0x6a4
	.4byte	.LASF1373
	.byte	0x5
	.uleb128 0x6a5
	.4byte	.LASF1374
	.byte	0x5
	.uleb128 0x6a6
	.4byte	.LASF1375
	.byte	0x5
	.uleb128 0x6a7
	.4byte	.LASF1376
	.byte	0x5
	.uleb128 0x6a8
	.4byte	.LASF1377
	.byte	0x5
	.uleb128 0x6a9
	.4byte	.LASF1378
	.byte	0x5
	.uleb128 0x6aa
	.4byte	.LASF1379
	.byte	0x5
	.uleb128 0x6ab
	.4byte	.LASF1380
	.byte	0x5
	.uleb128 0x6ac
	.4byte	.LASF1381
	.byte	0x5
	.uleb128 0x6ad
	.4byte	.LASF1382
	.byte	0x5
	.uleb128 0x6ae
	.4byte	.LASF1383
	.byte	0x5
	.uleb128 0x6af
	.4byte	.LASF1384
	.byte	0x5
	.uleb128 0x6b0
	.4byte	.LASF1385
	.byte	0x5
	.uleb128 0x6b1
	.4byte	.LASF1386
	.byte	0x5
	.uleb128 0x6ba
	.4byte	.LASF1387
	.byte	0x5
	.uleb128 0x6bb
	.4byte	.LASF1388
	.byte	0x5
	.uleb128 0x6bc
	.4byte	.LASF1389
	.byte	0x5
	.uleb128 0x6bd
	.4byte	.LASF1390
	.byte	0x5
	.uleb128 0x6be
	.4byte	.LASF1391
	.byte	0x5
	.uleb128 0x6bf
	.4byte	.LASF1392
	.byte	0x5
	.uleb128 0x6c0
	.4byte	.LASF1393
	.byte	0x5
	.uleb128 0x6c1
	.4byte	.LASF1394
	.byte	0x5
	.uleb128 0x6c2
	.4byte	.LASF1395
	.byte	0x5
	.uleb128 0x6c3
	.4byte	.LASF1396
	.byte	0x5
	.uleb128 0x6c4
	.4byte	.LASF1397
	.byte	0x5
	.uleb128 0x6c5
	.4byte	.LASF1398
	.byte	0x5
	.uleb128 0x6c6
	.4byte	.LASF1399
	.byte	0x5
	.uleb128 0x6c7
	.4byte	.LASF1400
	.byte	0x5
	.uleb128 0x6c8
	.4byte	.LASF1401
	.byte	0x5
	.uleb128 0x6c9
	.4byte	.LASF1402
	.byte	0x5
	.uleb128 0x6ca
	.4byte	.LASF1403
	.byte	0x5
	.uleb128 0x6cb
	.4byte	.LASF1404
	.byte	0x5
	.uleb128 0x6cc
	.4byte	.LASF1405
	.byte	0x5
	.uleb128 0x6cd
	.4byte	.LASF1406
	.byte	0x5
	.uleb128 0x6ce
	.4byte	.LASF1407
	.byte	0x5
	.uleb128 0x6d1
	.4byte	.LASF1408
	.byte	0x5
	.uleb128 0x6d2
	.4byte	.LASF1409
	.byte	0x5
	.uleb128 0x6d3
	.4byte	.LASF1410
	.byte	0x5
	.uleb128 0x6d4
	.4byte	.LASF1411
	.byte	0x5
	.uleb128 0x6d5
	.4byte	.LASF1412
	.byte	0x5
	.uleb128 0x6d6
	.4byte	.LASF1413
	.byte	0x5
	.uleb128 0x6d7
	.4byte	.LASF1414
	.byte	0x5
	.uleb128 0x6d8
	.4byte	.LASF1415
	.byte	0x5
	.uleb128 0x6d9
	.4byte	.LASF1416
	.byte	0x5
	.uleb128 0x6da
	.4byte	.LASF1417
	.byte	0x5
	.uleb128 0x6db
	.4byte	.LASF1418
	.byte	0x5
	.uleb128 0x6de
	.4byte	.LASF1419
	.byte	0x5
	.uleb128 0x6df
	.4byte	.LASF1420
	.byte	0x5
	.uleb128 0x6e0
	.4byte	.LASF1421
	.byte	0x5
	.uleb128 0x6e3
	.4byte	.LASF1422
	.byte	0x5
	.uleb128 0x6e4
	.4byte	.LASF1423
	.byte	0x5
	.uleb128 0x6e5
	.4byte	.LASF1424
	.byte	0x5
	.uleb128 0x6e8
	.4byte	.LASF1425
	.byte	0x5
	.uleb128 0x6e9
	.4byte	.LASF1426
	.byte	0x5
	.uleb128 0x6ea
	.4byte	.LASF1427
	.byte	0x5
	.uleb128 0x6eb
	.4byte	.LASF1428
	.byte	0x5
	.uleb128 0x6ec
	.4byte	.LASF1429
	.byte	0x5
	.uleb128 0x6ef
	.4byte	.LASF1430
	.byte	0x5
	.uleb128 0x6f0
	.4byte	.LASF1431
	.byte	0x5
	.uleb128 0x6f1
	.4byte	.LASF1432
	.byte	0x5
	.uleb128 0x6f2
	.4byte	.LASF1433
	.byte	0x5
	.uleb128 0x6f3
	.4byte	.LASF1434
	.byte	0x5
	.uleb128 0x6f6
	.4byte	.LASF1435
	.byte	0x5
	.uleb128 0x6f7
	.4byte	.LASF1436
	.byte	0x5
	.uleb128 0x6f8
	.4byte	.LASF1437
	.byte	0x5
	.uleb128 0x6f9
	.4byte	.LASF1438
	.byte	0x5
	.uleb128 0x6fa
	.4byte	.LASF1439
	.byte	0x5
	.uleb128 0x6fb
	.4byte	.LASF1440
	.byte	0x5
	.uleb128 0x6fc
	.4byte	.LASF1441
	.byte	0x5
	.uleb128 0x6fd
	.4byte	.LASF1442
	.byte	0x5
	.uleb128 0x6fe
	.4byte	.LASF1443
	.byte	0x5
	.uleb128 0x6ff
	.4byte	.LASF1444
	.byte	0x5
	.uleb128 0x700
	.4byte	.LASF1445
	.byte	0x5
	.uleb128 0x701
	.4byte	.LASF1446
	.byte	0x5
	.uleb128 0x702
	.4byte	.LASF1447
	.byte	0x5
	.uleb128 0x703
	.4byte	.LASF1448
	.byte	0x5
	.uleb128 0x704
	.4byte	.LASF1449
	.byte	0x5
	.uleb128 0x705
	.4byte	.LASF1450
	.byte	0x5
	.uleb128 0x706
	.4byte	.LASF1451
	.byte	0x5
	.uleb128 0x709
	.4byte	.LASF1452
	.byte	0x5
	.uleb128 0x70a
	.4byte	.LASF1453
	.byte	0x5
	.uleb128 0x70b
	.4byte	.LASF1454
	.byte	0x5
	.uleb128 0x70c
	.4byte	.LASF1455
	.byte	0x5
	.uleb128 0x70d
	.4byte	.LASF1456
	.byte	0x5
	.uleb128 0x70e
	.4byte	.LASF1457
	.byte	0x5
	.uleb128 0x70f
	.4byte	.LASF1458
	.byte	0x5
	.uleb128 0x710
	.4byte	.LASF1459
	.byte	0x5
	.uleb128 0x711
	.4byte	.LASF1460
	.byte	0x5
	.uleb128 0x714
	.4byte	.LASF1461
	.byte	0x5
	.uleb128 0x717
	.4byte	.LASF1462
	.byte	0x5
	.uleb128 0x71a
	.4byte	.LASF1463
	.byte	0x5
	.uleb128 0x722
	.4byte	.LASF1464
	.byte	0x5
	.uleb128 0x725
	.4byte	.LASF1465
	.byte	0x5
	.uleb128 0x726
	.4byte	.LASF1466
	.byte	0x5
	.uleb128 0x727
	.4byte	.LASF1467
	.byte	0x5
	.uleb128 0x728
	.4byte	.LASF1468
	.byte	0x5
	.uleb128 0x72b
	.4byte	.LASF1469
	.byte	0x5
	.uleb128 0x72e
	.4byte	.LASF1470
	.byte	0x5
	.uleb128 0x72f
	.4byte	.LASF1471
	.byte	0x5
	.uleb128 0x730
	.4byte	.LASF1472
	.byte	0x5
	.uleb128 0x733
	.4byte	.LASF1473
	.byte	0x5
	.uleb128 0x73c
	.4byte	.LASF1474
	.byte	0x5
	.uleb128 0x73d
	.4byte	.LASF1475
	.byte	0x5
	.uleb128 0x73e
	.4byte	.LASF1476
	.byte	0x5
	.uleb128 0x73f
	.4byte	.LASF1477
	.byte	0x5
	.uleb128 0x740
	.4byte	.LASF1478
	.byte	0x5
	.uleb128 0x742
	.4byte	.LASF1479
	.byte	0x5
	.uleb128 0x743
	.4byte	.LASF1480
	.byte	0x5
	.uleb128 0x744
	.4byte	.LASF1481
	.byte	0x5
	.uleb128 0x745
	.4byte	.LASF1482
	.byte	0x5
	.uleb128 0x748
	.4byte	.LASF1483
	.byte	0x5
	.uleb128 0x749
	.4byte	.LASF1484
	.byte	0x5
	.uleb128 0x74a
	.4byte	.LASF1485
	.byte	0x5
	.uleb128 0x74b
	.4byte	.LASF1486
	.byte	0x5
	.uleb128 0x74c
	.4byte	.LASF1487
	.byte	0x5
	.uleb128 0x74d
	.4byte	.LASF1488
	.byte	0x5
	.uleb128 0x74e
	.4byte	.LASF1489
	.byte	0x5
	.uleb128 0x74f
	.4byte	.LASF1490
	.byte	0x5
	.uleb128 0x751
	.4byte	.LASF1491
	.byte	0x5
	.uleb128 0x754
	.4byte	.LASF1492
	.byte	0x5
	.uleb128 0x755
	.4byte	.LASF1493
	.byte	0x5
	.uleb128 0x756
	.4byte	.LASF1494
	.byte	0x5
	.uleb128 0x757
	.4byte	.LASF1495
	.byte	0x5
	.uleb128 0x759
	.4byte	.LASF1496
	.byte	0x5
	.uleb128 0x75a
	.4byte	.LASF1497
	.byte	0x5
	.uleb128 0x763
	.4byte	.LASF1498
	.byte	0x5
	.uleb128 0x764
	.4byte	.LASF1499
	.byte	0x5
	.uleb128 0x765
	.4byte	.LASF1500
	.byte	0x5
	.uleb128 0x766
	.4byte	.LASF1501
	.byte	0x5
	.uleb128 0x767
	.4byte	.LASF1502
	.byte	0x5
	.uleb128 0x768
	.4byte	.LASF1503
	.byte	0x5
	.uleb128 0x769
	.4byte	.LASF1504
	.byte	0x5
	.uleb128 0x76a
	.4byte	.LASF1505
	.byte	0x5
	.uleb128 0x76b
	.4byte	.LASF1506
	.byte	0x5
	.uleb128 0x76c
	.4byte	.LASF1507
	.byte	0x5
	.uleb128 0x770
	.4byte	.LASF1508
	.byte	0x5
	.uleb128 0x771
	.4byte	.LASF1509
	.byte	0x5
	.uleb128 0x772
	.4byte	.LASF1510
	.byte	0x5
	.uleb128 0x774
	.4byte	.LASF1511
	.byte	0x5
	.uleb128 0x775
	.4byte	.LASF1512
	.byte	0x5
	.uleb128 0x776
	.4byte	.LASF1513
	.byte	0x5
	.uleb128 0x779
	.4byte	.LASF1514
	.byte	0x5
	.uleb128 0x77a
	.4byte	.LASF1515
	.byte	0x5
	.uleb128 0x77b
	.4byte	.LASF1516
	.byte	0x5
	.uleb128 0x77d
	.4byte	.LASF1517
	.byte	0x5
	.uleb128 0x77e
	.4byte	.LASF1518
	.byte	0x5
	.uleb128 0x77f
	.4byte	.LASF1519
	.byte	0x5
	.uleb128 0x782
	.4byte	.LASF1520
	.byte	0x5
	.uleb128 0x783
	.4byte	.LASF1521
	.byte	0x5
	.uleb128 0x784
	.4byte	.LASF1522
	.byte	0x5
	.uleb128 0x785
	.4byte	.LASF1523
	.byte	0x5
	.uleb128 0x786
	.4byte	.LASF1524
	.byte	0x5
	.uleb128 0x788
	.4byte	.LASF1525
	.byte	0x5
	.uleb128 0x789
	.4byte	.LASF1526
	.byte	0x5
	.uleb128 0x78a
	.4byte	.LASF1527
	.byte	0x5
	.uleb128 0x78b
	.4byte	.LASF1528
	.byte	0x5
	.uleb128 0x78c
	.4byte	.LASF1529
	.byte	0x5
	.uleb128 0x78d
	.4byte	.LASF1530
	.byte	0x5
	.uleb128 0x78e
	.4byte	.LASF1531
	.byte	0x5
	.uleb128 0x78f
	.4byte	.LASF1532
	.byte	0x5
	.uleb128 0x790
	.4byte	.LASF1533
	.byte	0x5
	.uleb128 0x793
	.4byte	.LASF1534
	.byte	0x5
	.uleb128 0x794
	.4byte	.LASF1535
	.byte	0x5
	.uleb128 0x795
	.4byte	.LASF1536
	.byte	0x5
	.uleb128 0x796
	.4byte	.LASF1537
	.byte	0x5
	.uleb128 0x798
	.4byte	.LASF1538
	.byte	0x5
	.uleb128 0x799
	.4byte	.LASF1539
	.byte	0x5
	.uleb128 0x79a
	.4byte	.LASF1540
	.byte	0x5
	.uleb128 0x79b
	.4byte	.LASF1541
	.byte	0x5
	.uleb128 0x79c
	.4byte	.LASF1542
	.byte	0x5
	.uleb128 0x79f
	.4byte	.LASF1543
	.byte	0x5
	.uleb128 0x7a1
	.4byte	.LASF1544
	.byte	0x5
	.uleb128 0x7a2
	.4byte	.LASF1545
	.byte	0x5
	.uleb128 0x7a4
	.4byte	.LASF1546
	.byte	0x5
	.uleb128 0x7a6
	.4byte	.LASF1547
	.byte	0x5
	.uleb128 0x7a9
	.4byte	.LASF1548
	.byte	0x5
	.uleb128 0x7aa
	.4byte	.LASF1549
	.byte	0x5
	.uleb128 0x7ab
	.4byte	.LASF1550
	.byte	0x5
	.uleb128 0x7ac
	.4byte	.LASF1551
	.byte	0x5
	.uleb128 0x7ad
	.4byte	.LASF1552
	.byte	0x5
	.uleb128 0x7af
	.4byte	.LASF1553
	.byte	0x5
	.uleb128 0x7b0
	.4byte	.LASF1554
	.byte	0x5
	.uleb128 0x7b2
	.4byte	.LASF1555
	.byte	0x5
	.uleb128 0x7b3
	.4byte	.LASF1556
	.byte	0x5
	.uleb128 0x7b5
	.4byte	.LASF1557
	.byte	0x5
	.uleb128 0x7b6
	.4byte	.LASF1558
	.byte	0x5
	.uleb128 0x7b7
	.4byte	.LASF1559
	.byte	0x5
	.uleb128 0x7b8
	.4byte	.LASF1560
	.byte	0x5
	.uleb128 0x7b9
	.4byte	.LASF1561
	.byte	0x5
	.uleb128 0x7ba
	.4byte	.LASF1562
	.byte	0x5
	.uleb128 0x7bb
	.4byte	.LASF1563
	.byte	0x5
	.uleb128 0x7bc
	.4byte	.LASF1564
	.byte	0x5
	.uleb128 0x7bd
	.4byte	.LASF1565
	.byte	0x5
	.uleb128 0x7be
	.4byte	.LASF1566
	.byte	0x5
	.uleb128 0x7bf
	.4byte	.LASF1567
	.byte	0x5
	.uleb128 0x7c0
	.4byte	.LASF1568
	.byte	0x5
	.uleb128 0x7c1
	.4byte	.LASF1569
	.byte	0x5
	.uleb128 0x7c2
	.4byte	.LASF1570
	.byte	0x5
	.uleb128 0x7c3
	.4byte	.LASF1571
	.byte	0x5
	.uleb128 0x7c6
	.4byte	.LASF1572
	.byte	0x5
	.uleb128 0x7c7
	.4byte	.LASF1573
	.byte	0x5
	.uleb128 0x7c8
	.4byte	.LASF1574
	.byte	0x5
	.uleb128 0x7c9
	.4byte	.LASF1575
	.byte	0x5
	.uleb128 0x7cb
	.4byte	.LASF1576
	.byte	0x5
	.uleb128 0x7cc
	.4byte	.LASF1577
	.byte	0x5
	.uleb128 0x7cd
	.4byte	.LASF1578
	.byte	0x5
	.uleb128 0x7ce
	.4byte	.LASF1579
	.byte	0x5
	.uleb128 0x7cf
	.4byte	.LASF1580
	.byte	0x5
	.uleb128 0x7d0
	.4byte	.LASF1581
	.byte	0x5
	.uleb128 0x7d1
	.4byte	.LASF1582
	.byte	0x5
	.uleb128 0x7d2
	.4byte	.LASF1583
	.byte	0x5
	.uleb128 0x7d5
	.4byte	.LASF1584
	.byte	0x5
	.uleb128 0x7d6
	.4byte	.LASF1585
	.byte	0x5
	.uleb128 0x7d7
	.4byte	.LASF1586
	.byte	0x5
	.uleb128 0x7d8
	.4byte	.LASF1587
	.byte	0x5
	.uleb128 0x7d9
	.4byte	.LASF1588
	.byte	0x5
	.uleb128 0x7da
	.4byte	.LASF1589
	.byte	0x5
	.uleb128 0x7db
	.4byte	.LASF1590
	.byte	0x5
	.uleb128 0x7dc
	.4byte	.LASF1591
	.byte	0x5
	.uleb128 0x7dd
	.4byte	.LASF1592
	.byte	0x5
	.uleb128 0x7de
	.4byte	.LASF1593
	.byte	0x5
	.uleb128 0x7df
	.4byte	.LASF1594
	.byte	0x5
	.uleb128 0x7e0
	.4byte	.LASF1595
	.byte	0x5
	.uleb128 0x7e1
	.4byte	.LASF1596
	.byte	0x5
	.uleb128 0x7e2
	.4byte	.LASF1597
	.byte	0x5
	.uleb128 0x7e3
	.4byte	.LASF1598
	.byte	0x5
	.uleb128 0x7e4
	.4byte	.LASF1599
	.byte	0x5
	.uleb128 0x7e5
	.4byte	.LASF1600
	.byte	0x5
	.uleb128 0x7e6
	.4byte	.LASF1601
	.byte	0x5
	.uleb128 0x7e7
	.4byte	.LASF1602
	.byte	0x5
	.uleb128 0x7e8
	.4byte	.LASF1603
	.byte	0x5
	.uleb128 0x7eb
	.4byte	.LASF1604
	.byte	0x5
	.uleb128 0x7ec
	.4byte	.LASF1605
	.byte	0x5
	.uleb128 0x7ed
	.4byte	.LASF1606
	.byte	0x5
	.uleb128 0x7ee
	.4byte	.LASF1607
	.byte	0x5
	.uleb128 0x7ef
	.4byte	.LASF1608
	.byte	0x5
	.uleb128 0x7f0
	.4byte	.LASF1609
	.byte	0x5
	.uleb128 0x7f1
	.4byte	.LASF1610
	.byte	0x5
	.uleb128 0x7f2
	.4byte	.LASF1611
	.byte	0x5
	.uleb128 0x7f3
	.4byte	.LASF1612
	.byte	0x5
	.uleb128 0x7f6
	.4byte	.LASF1613
	.byte	0x5
	.uleb128 0x7f7
	.4byte	.LASF1614
	.byte	0x5
	.uleb128 0x7f8
	.4byte	.LASF1615
	.byte	0x5
	.uleb128 0x7f9
	.4byte	.LASF1616
	.byte	0x5
	.uleb128 0x7fa
	.4byte	.LASF1617
	.byte	0x5
	.uleb128 0x7fb
	.4byte	.LASF1618
	.byte	0x5
	.uleb128 0x7fc
	.4byte	.LASF1619
	.byte	0x5
	.uleb128 0x7fd
	.4byte	.LASF1620
	.byte	0x5
	.uleb128 0x7fe
	.4byte	.LASF1621
	.byte	0x5
	.uleb128 0x7ff
	.4byte	.LASF1622
	.byte	0x5
	.uleb128 0x800
	.4byte	.LASF1623
	.byte	0x5
	.uleb128 0x801
	.4byte	.LASF1624
	.byte	0x5
	.uleb128 0x804
	.4byte	.LASF1625
	.byte	0x5
	.uleb128 0x805
	.4byte	.LASF1626
	.byte	0x5
	.uleb128 0x806
	.4byte	.LASF1627
	.byte	0x5
	.uleb128 0x807
	.4byte	.LASF1628
	.byte	0x5
	.uleb128 0x808
	.4byte	.LASF1629
	.byte	0x5
	.uleb128 0x809
	.4byte	.LASF1630
	.byte	0x5
	.uleb128 0x80a
	.4byte	.LASF1631
	.byte	0x5
	.uleb128 0x80b
	.4byte	.LASF1632
	.byte	0x5
	.uleb128 0x80c
	.4byte	.LASF1633
	.byte	0x5
	.uleb128 0x80d
	.4byte	.LASF1634
	.byte	0x5
	.uleb128 0x810
	.4byte	.LASF1635
	.byte	0x5
	.uleb128 0x811
	.4byte	.LASF1636
	.byte	0x5
	.uleb128 0x812
	.4byte	.LASF1637
	.byte	0x5
	.uleb128 0x813
	.4byte	.LASF1638
	.byte	0x5
	.uleb128 0x814
	.4byte	.LASF1639
	.byte	0x5
	.uleb128 0x815
	.4byte	.LASF1640
	.byte	0x5
	.uleb128 0x816
	.4byte	.LASF1641
	.byte	0x5
	.uleb128 0x817
	.4byte	.LASF1642
	.byte	0x5
	.uleb128 0x818
	.4byte	.LASF1643
	.byte	0x5
	.uleb128 0x81b
	.4byte	.LASF1644
	.byte	0x5
	.uleb128 0x81c
	.4byte	.LASF1645
	.byte	0x5
	.uleb128 0x81d
	.4byte	.LASF1646
	.byte	0x5
	.uleb128 0x81e
	.4byte	.LASF1647
	.byte	0x5
	.uleb128 0x81f
	.4byte	.LASF1648
	.byte	0x5
	.uleb128 0x820
	.4byte	.LASF1649
	.byte	0x5
	.uleb128 0x821
	.4byte	.LASF1650
	.byte	0x5
	.uleb128 0x822
	.4byte	.LASF1651
	.byte	0x5
	.uleb128 0x823
	.4byte	.LASF1652
	.byte	0x5
	.uleb128 0x824
	.4byte	.LASF1653
	.byte	0x5
	.uleb128 0x825
	.4byte	.LASF1654
	.byte	0x5
	.uleb128 0x826
	.4byte	.LASF1655
	.byte	0x5
	.uleb128 0x829
	.4byte	.LASF1656
	.byte	0x5
	.uleb128 0x82a
	.4byte	.LASF1657
	.byte	0x5
	.uleb128 0x82b
	.4byte	.LASF1658
	.byte	0x5
	.uleb128 0x82d
	.4byte	.LASF1659
	.byte	0x5
	.uleb128 0x82e
	.4byte	.LASF1660
	.byte	0x5
	.uleb128 0x82f
	.4byte	.LASF1661
	.byte	0x5
	.uleb128 0x831
	.4byte	.LASF1662
	.byte	0x5
	.uleb128 0x832
	.4byte	.LASF1663
	.byte	0x5
	.uleb128 0x833
	.4byte	.LASF1664
	.byte	0x5
	.uleb128 0x836
	.4byte	.LASF1665
	.byte	0x5
	.uleb128 0x837
	.4byte	.LASF1666
	.byte	0x5
	.uleb128 0x838
	.4byte	.LASF1667
	.byte	0x5
	.uleb128 0x839
	.4byte	.LASF1668
	.byte	0x5
	.uleb128 0x83b
	.4byte	.LASF1669
	.byte	0x5
	.uleb128 0x83c
	.4byte	.LASF1670
	.byte	0x5
	.uleb128 0x83f
	.4byte	.LASF1671
	.byte	0x5
	.uleb128 0x840
	.4byte	.LASF1672
	.byte	0x5
	.uleb128 0x841
	.4byte	.LASF1673
	.byte	0x5
	.uleb128 0x842
	.4byte	.LASF1674
	.byte	0x5
	.uleb128 0x843
	.4byte	.LASF1675
	.byte	0x5
	.uleb128 0x844
	.4byte	.LASF1676
	.byte	0x5
	.uleb128 0x845
	.4byte	.LASF1677
	.byte	0x5
	.uleb128 0x846
	.4byte	.LASF1678
	.byte	0x5
	.uleb128 0x847
	.4byte	.LASF1679
	.byte	0x5
	.uleb128 0x848
	.4byte	.LASF1680
	.byte	0x5
	.uleb128 0x849
	.4byte	.LASF1681
	.byte	0x5
	.uleb128 0x84c
	.4byte	.LASF1682
	.byte	0x5
	.uleb128 0x84d
	.4byte	.LASF1683
	.byte	0x5
	.uleb128 0x84e
	.4byte	.LASF1684
	.byte	0x5
	.uleb128 0x84f
	.4byte	.LASF1685
	.byte	0x5
	.uleb128 0x850
	.4byte	.LASF1686
	.byte	0x5
	.uleb128 0x851
	.4byte	.LASF1687
	.byte	0x5
	.uleb128 0x855
	.4byte	.LASF1688
	.byte	0x5
	.uleb128 0x856
	.4byte	.LASF1689
	.byte	0x5
	.uleb128 0x857
	.4byte	.LASF1690
	.byte	0x5
	.uleb128 0x858
	.4byte	.LASF1691
	.byte	0x5
	.uleb128 0x859
	.4byte	.LASF1692
	.byte	0x5
	.uleb128 0x85b
	.4byte	.LASF1693
	.byte	0x5
	.uleb128 0x85c
	.4byte	.LASF1694
	.byte	0x5
	.uleb128 0x85d
	.4byte	.LASF1695
	.byte	0x5
	.uleb128 0x85e
	.4byte	.LASF1696
	.byte	0x5
	.uleb128 0x85f
	.4byte	.LASF1697
	.byte	0x5
	.uleb128 0x860
	.4byte	.LASF1698
	.byte	0x5
	.uleb128 0x861
	.4byte	.LASF1699
	.byte	0x5
	.uleb128 0x862
	.4byte	.LASF1700
	.byte	0x5
	.uleb128 0x863
	.4byte	.LASF1701
	.byte	0x5
	.uleb128 0x864
	.4byte	.LASF1702
	.byte	0x5
	.uleb128 0x865
	.4byte	.LASF1703
	.byte	0x5
	.uleb128 0x866
	.4byte	.LASF1704
	.byte	0x5
	.uleb128 0x867
	.4byte	.LASF1705
	.byte	0x5
	.uleb128 0x868
	.4byte	.LASF1706
	.byte	0x5
	.uleb128 0x869
	.4byte	.LASF1707
	.byte	0x5
	.uleb128 0x86a
	.4byte	.LASF1708
	.byte	0x5
	.uleb128 0x86e
	.4byte	.LASF1709
	.byte	0x5
	.uleb128 0x86f
	.4byte	.LASF1710
	.byte	0x5
	.uleb128 0x870
	.4byte	.LASF1711
	.byte	0x5
	.uleb128 0x872
	.4byte	.LASF1712
	.byte	0x5
	.uleb128 0x873
	.4byte	.LASF1713
	.byte	0x5
	.uleb128 0x874
	.4byte	.LASF1714
	.byte	0x5
	.uleb128 0x877
	.4byte	.LASF1715
	.byte	0x5
	.uleb128 0x878
	.4byte	.LASF1716
	.byte	0x5
	.uleb128 0x879
	.4byte	.LASF1717
	.byte	0x5
	.uleb128 0x87a
	.4byte	.LASF1718
	.byte	0x5
	.uleb128 0x87b
	.4byte	.LASF1719
	.byte	0x5
	.uleb128 0x883
	.4byte	.LASF1720
	.byte	0x5
	.uleb128 0x884
	.4byte	.LASF1721
	.byte	0x5
	.uleb128 0x885
	.4byte	.LASF1722
	.byte	0x5
	.uleb128 0x886
	.4byte	.LASF1723
	.byte	0x5
	.uleb128 0x887
	.4byte	.LASF1724
	.byte	0x5
	.uleb128 0x888
	.4byte	.LASF1725
	.byte	0x5
	.uleb128 0x889
	.4byte	.LASF1726
	.byte	0x5
	.uleb128 0x88a
	.4byte	.LASF1727
	.byte	0x5
	.uleb128 0x88b
	.4byte	.LASF1728
	.byte	0x5
	.uleb128 0x88c
	.4byte	.LASF1729
	.byte	0x5
	.uleb128 0x88d
	.4byte	.LASF1730
	.byte	0x5
	.uleb128 0x88e
	.4byte	.LASF1731
	.byte	0x5
	.uleb128 0x88f
	.4byte	.LASF1732
	.byte	0x5
	.uleb128 0x890
	.4byte	.LASF1733
	.byte	0x5
	.uleb128 0x891
	.4byte	.LASF1734
	.byte	0x5
	.uleb128 0x892
	.4byte	.LASF1735
	.byte	0x5
	.uleb128 0x893
	.4byte	.LASF1736
	.byte	0x5
	.uleb128 0x894
	.4byte	.LASF1737
	.byte	0x5
	.uleb128 0x895
	.4byte	.LASF1738
	.byte	0x5
	.uleb128 0x896
	.4byte	.LASF1739
	.byte	0x5
	.uleb128 0x897
	.4byte	.LASF1740
	.byte	0x5
	.uleb128 0x898
	.4byte	.LASF1741
	.byte	0x5
	.uleb128 0x899
	.4byte	.LASF1742
	.byte	0x5
	.uleb128 0x89a
	.4byte	.LASF1743
	.byte	0x5
	.uleb128 0x89b
	.4byte	.LASF1744
	.byte	0x5
	.uleb128 0x89c
	.4byte	.LASF1745
	.byte	0x5
	.uleb128 0x89d
	.4byte	.LASF1746
	.byte	0x5
	.uleb128 0x8a0
	.4byte	.LASF1747
	.byte	0x5
	.uleb128 0x8a1
	.4byte	.LASF1748
	.byte	0x5
	.uleb128 0x8a2
	.4byte	.LASF1749
	.byte	0x5
	.uleb128 0x8a3
	.4byte	.LASF1750
	.byte	0x5
	.uleb128 0x8a4
	.4byte	.LASF1751
	.byte	0x5
	.uleb128 0x8a5
	.4byte	.LASF1752
	.byte	0x5
	.uleb128 0x8a6
	.4byte	.LASF1753
	.byte	0x5
	.uleb128 0x8a7
	.4byte	.LASF1754
	.byte	0x5
	.uleb128 0x8a8
	.4byte	.LASF1755
	.byte	0x5
	.uleb128 0x8a9
	.4byte	.LASF1756
	.byte	0x5
	.uleb128 0x8aa
	.4byte	.LASF1757
	.byte	0x5
	.uleb128 0x8ab
	.4byte	.LASF1758
	.byte	0x5
	.uleb128 0x8ac
	.4byte	.LASF1759
	.byte	0x5
	.uleb128 0x8ad
	.4byte	.LASF1760
	.byte	0x5
	.uleb128 0x8ae
	.4byte	.LASF1761
	.byte	0x5
	.uleb128 0x8af
	.4byte	.LASF1762
	.byte	0x5
	.uleb128 0x8b0
	.4byte	.LASF1763
	.byte	0x5
	.uleb128 0x8b1
	.4byte	.LASF1764
	.byte	0x5
	.uleb128 0x8b2
	.4byte	.LASF1765
	.byte	0x5
	.uleb128 0x8b3
	.4byte	.LASF1766
	.byte	0x5
	.uleb128 0x8b4
	.4byte	.LASF1767
	.byte	0x5
	.uleb128 0x8b5
	.4byte	.LASF1768
	.byte	0x5
	.uleb128 0x8b6
	.4byte	.LASF1769
	.byte	0x5
	.uleb128 0x8b7
	.4byte	.LASF1770
	.byte	0x5
	.uleb128 0x8b8
	.4byte	.LASF1771
	.byte	0x5
	.uleb128 0x8b9
	.4byte	.LASF1772
	.byte	0x5
	.uleb128 0x8ba
	.4byte	.LASF1773
	.byte	0x5
	.uleb128 0x8bb
	.4byte	.LASF1774
	.byte	0x5
	.uleb128 0x8be
	.4byte	.LASF1775
	.byte	0x5
	.uleb128 0x8bf
	.4byte	.LASF1776
	.byte	0x5
	.uleb128 0x8c0
	.4byte	.LASF1777
	.byte	0x5
	.uleb128 0x8c1
	.4byte	.LASF1778
	.byte	0x5
	.uleb128 0x8c2
	.4byte	.LASF1779
	.byte	0x5
	.uleb128 0x8c3
	.4byte	.LASF1780
	.byte	0x5
	.uleb128 0x8c4
	.4byte	.LASF1781
	.byte	0x5
	.uleb128 0x8c5
	.4byte	.LASF1782
	.byte	0x5
	.uleb128 0x8c6
	.4byte	.LASF1783
	.byte	0x5
	.uleb128 0x8c7
	.4byte	.LASF1784
	.byte	0x5
	.uleb128 0x8c8
	.4byte	.LASF1785
	.byte	0x5
	.uleb128 0x8c9
	.4byte	.LASF1786
	.byte	0x5
	.uleb128 0x8ca
	.4byte	.LASF1787
	.byte	0x5
	.uleb128 0x8cb
	.4byte	.LASF1788
	.byte	0x5
	.uleb128 0x8cc
	.4byte	.LASF1789
	.byte	0x5
	.uleb128 0x8cd
	.4byte	.LASF1790
	.byte	0x5
	.uleb128 0x8ce
	.4byte	.LASF1791
	.byte	0x5
	.uleb128 0x8cf
	.4byte	.LASF1792
	.byte	0x5
	.uleb128 0x8d2
	.4byte	.LASF1793
	.byte	0x5
	.uleb128 0x8d3
	.4byte	.LASF1794
	.byte	0x5
	.uleb128 0x8d4
	.4byte	.LASF1795
	.byte	0x5
	.uleb128 0x8d5
	.4byte	.LASF1796
	.byte	0x5
	.uleb128 0x8d6
	.4byte	.LASF1797
	.byte	0x5
	.uleb128 0x8d7
	.4byte	.LASF1798
	.byte	0x5
	.uleb128 0x8d8
	.4byte	.LASF1799
	.byte	0x5
	.uleb128 0x8d9
	.4byte	.LASF1800
	.byte	0x5
	.uleb128 0x8da
	.4byte	.LASF1801
	.byte	0x5
	.uleb128 0x8db
	.4byte	.LASF1802
	.byte	0x5
	.uleb128 0x8dc
	.4byte	.LASF1803
	.byte	0x5
	.uleb128 0x8dd
	.4byte	.LASF1804
	.byte	0x5
	.uleb128 0x8de
	.4byte	.LASF1805
	.byte	0x5
	.uleb128 0x8e1
	.4byte	.LASF1806
	.byte	0x5
	.uleb128 0x8e2
	.4byte	.LASF1807
	.byte	0x5
	.uleb128 0x8e5
	.4byte	.LASF1808
	.byte	0x5
	.uleb128 0x8e6
	.4byte	.LASF1809
	.byte	0x5
	.uleb128 0x8e7
	.4byte	.LASF1810
	.byte	0x5
	.uleb128 0x8e8
	.4byte	.LASF1811
	.byte	0x5
	.uleb128 0x8e9
	.4byte	.LASF1812
	.byte	0x5
	.uleb128 0x8ea
	.4byte	.LASF1813
	.byte	0x5
	.uleb128 0x8eb
	.4byte	.LASF1814
	.byte	0x5
	.uleb128 0x8ec
	.4byte	.LASF1815
	.byte	0x5
	.uleb128 0x8ed
	.4byte	.LASF1816
	.byte	0x5
	.uleb128 0x8ee
	.4byte	.LASF1817
	.byte	0x5
	.uleb128 0x8ef
	.4byte	.LASF1818
	.byte	0x5
	.uleb128 0x8f0
	.4byte	.LASF1819
	.byte	0x5
	.uleb128 0x8f1
	.4byte	.LASF1820
	.byte	0x5
	.uleb128 0x8f2
	.4byte	.LASF1821
	.byte	0x5
	.uleb128 0x8f3
	.4byte	.LASF1822
	.byte	0x5
	.uleb128 0x8f4
	.4byte	.LASF1823
	.byte	0x5
	.uleb128 0x8f5
	.4byte	.LASF1824
	.byte	0x5
	.uleb128 0x8f6
	.4byte	.LASF1825
	.byte	0x5
	.uleb128 0x8f7
	.4byte	.LASF1826
	.byte	0x5
	.uleb128 0x8f8
	.4byte	.LASF1827
	.byte	0x5
	.uleb128 0x8f9
	.4byte	.LASF1828
	.byte	0x5
	.uleb128 0x8fa
	.4byte	.LASF1829
	.byte	0x5
	.uleb128 0x8fb
	.4byte	.LASF1830
	.byte	0x5
	.uleb128 0x8fc
	.4byte	.LASF1831
	.byte	0x5
	.uleb128 0x8fd
	.4byte	.LASF1832
	.byte	0x5
	.uleb128 0x8fe
	.4byte	.LASF1833
	.byte	0x5
	.uleb128 0x8ff
	.4byte	.LASF1834
	.byte	0x5
	.uleb128 0x900
	.4byte	.LASF1835
	.byte	0x5
	.uleb128 0x901
	.4byte	.LASF1836
	.byte	0x5
	.uleb128 0x902
	.4byte	.LASF1837
	.byte	0x5
	.uleb128 0x903
	.4byte	.LASF1838
	.byte	0x5
	.uleb128 0x904
	.4byte	.LASF1839
	.byte	0x5
	.uleb128 0x905
	.4byte	.LASF1840
	.byte	0x5
	.uleb128 0x906
	.4byte	.LASF1841
	.byte	0x5
	.uleb128 0x907
	.4byte	.LASF1842
	.byte	0x5
	.uleb128 0x908
	.4byte	.LASF1843
	.byte	0x5
	.uleb128 0x909
	.4byte	.LASF1844
	.byte	0x5
	.uleb128 0x90a
	.4byte	.LASF1845
	.byte	0x5
	.uleb128 0x90b
	.4byte	.LASF1846
	.byte	0x5
	.uleb128 0x90c
	.4byte	.LASF1847
	.byte	0x5
	.uleb128 0x90f
	.4byte	.LASF1848
	.byte	0x5
	.uleb128 0x912
	.4byte	.LASF1849
	.byte	0x5
	.uleb128 0x915
	.4byte	.LASF1850
	.byte	0x5
	.uleb128 0x916
	.4byte	.LASF1851
	.byte	0x5
	.uleb128 0x919
	.4byte	.LASF1852
	.byte	0x5
	.uleb128 0x91a
	.4byte	.LASF1853
	.byte	0x5
	.uleb128 0x91b
	.4byte	.LASF1854
	.byte	0x5
	.uleb128 0x91c
	.4byte	.LASF1855
	.byte	0x5
	.uleb128 0x91d
	.4byte	.LASF1856
	.byte	0x5
	.uleb128 0x91e
	.4byte	.LASF1857
	.byte	0x5
	.uleb128 0x91f
	.4byte	.LASF1858
	.byte	0x5
	.uleb128 0x920
	.4byte	.LASF1859
	.byte	0x5
	.uleb128 0x921
	.4byte	.LASF1860
	.byte	0x5
	.uleb128 0x922
	.4byte	.LASF1861
	.byte	0x5
	.uleb128 0x923
	.4byte	.LASF1862
	.byte	0x5
	.uleb128 0x924
	.4byte	.LASF1863
	.byte	0x5
	.uleb128 0x925
	.4byte	.LASF1864
	.byte	0x5
	.uleb128 0x926
	.4byte	.LASF1865
	.byte	0x5
	.uleb128 0x927
	.4byte	.LASF1866
	.byte	0x5
	.uleb128 0x928
	.4byte	.LASF1867
	.byte	0x5
	.uleb128 0x929
	.4byte	.LASF1868
	.byte	0x5
	.uleb128 0x92a
	.4byte	.LASF1869
	.byte	0x5
	.uleb128 0x92b
	.4byte	.LASF1870
	.byte	0x5
	.uleb128 0x92c
	.4byte	.LASF1871
	.byte	0x5
	.uleb128 0x92d
	.4byte	.LASF1872
	.byte	0x5
	.uleb128 0x92e
	.4byte	.LASF1873
	.byte	0x5
	.uleb128 0x92f
	.4byte	.LASF1874
	.byte	0x5
	.uleb128 0x930
	.4byte	.LASF1875
	.byte	0x5
	.uleb128 0x931
	.4byte	.LASF1876
	.byte	0x5
	.uleb128 0x932
	.4byte	.LASF1877
	.byte	0x5
	.uleb128 0x933
	.4byte	.LASF1878
	.byte	0x5
	.uleb128 0x936
	.4byte	.LASF1879
	.byte	0x5
	.uleb128 0x937
	.4byte	.LASF1880
	.byte	0x5
	.uleb128 0x938
	.4byte	.LASF1881
	.byte	0x5
	.uleb128 0x939
	.4byte	.LASF1882
	.byte	0x5
	.uleb128 0x93a
	.4byte	.LASF1883
	.byte	0x5
	.uleb128 0x93b
	.4byte	.LASF1884
	.byte	0x5
	.uleb128 0x93c
	.4byte	.LASF1885
	.byte	0x5
	.uleb128 0x93d
	.4byte	.LASF1886
	.byte	0x5
	.uleb128 0x93e
	.4byte	.LASF1887
	.byte	0x5
	.uleb128 0x93f
	.4byte	.LASF1888
	.byte	0x5
	.uleb128 0x940
	.4byte	.LASF1889
	.byte	0x5
	.uleb128 0x941
	.4byte	.LASF1890
	.byte	0x5
	.uleb128 0x942
	.4byte	.LASF1891
	.byte	0x5
	.uleb128 0x943
	.4byte	.LASF1892
	.byte	0x5
	.uleb128 0x944
	.4byte	.LASF1893
	.byte	0x5
	.uleb128 0x945
	.4byte	.LASF1894
	.byte	0x5
	.uleb128 0x946
	.4byte	.LASF1895
	.byte	0x5
	.uleb128 0x947
	.4byte	.LASF1896
	.byte	0x5
	.uleb128 0x94a
	.4byte	.LASF1897
	.byte	0x5
	.uleb128 0x94d
	.4byte	.LASF1898
	.byte	0x5
	.uleb128 0x94e
	.4byte	.LASF1899
	.byte	0x5
	.uleb128 0x94f
	.4byte	.LASF1900
	.byte	0x5
	.uleb128 0x950
	.4byte	.LASF1901
	.byte	0x5
	.uleb128 0x951
	.4byte	.LASF1902
	.byte	0x5
	.uleb128 0x952
	.4byte	.LASF1903
	.byte	0x5
	.uleb128 0x953
	.4byte	.LASF1904
	.byte	0x5
	.uleb128 0x954
	.4byte	.LASF1905
	.byte	0x5
	.uleb128 0x955
	.4byte	.LASF1906
	.byte	0x5
	.uleb128 0x956
	.4byte	.LASF1907
	.byte	0x5
	.uleb128 0x957
	.4byte	.LASF1908
	.byte	0x5
	.uleb128 0x958
	.4byte	.LASF1909
	.byte	0x5
	.uleb128 0x959
	.4byte	.LASF1910
	.byte	0x5
	.uleb128 0x95c
	.4byte	.LASF1911
	.byte	0x5
	.uleb128 0x95d
	.4byte	.LASF1912
	.byte	0x5
	.uleb128 0x95e
	.4byte	.LASF1913
	.byte	0x5
	.uleb128 0x95f
	.4byte	.LASF1914
	.byte	0x5
	.uleb128 0x960
	.4byte	.LASF1915
	.byte	0x5
	.uleb128 0x961
	.4byte	.LASF1916
	.byte	0x5
	.uleb128 0x962
	.4byte	.LASF1917
	.byte	0x5
	.uleb128 0x963
	.4byte	.LASF1918
	.byte	0x5
	.uleb128 0x964
	.4byte	.LASF1919
	.byte	0x5
	.uleb128 0x965
	.4byte	.LASF1920
	.byte	0x5
	.uleb128 0x966
	.4byte	.LASF1921
	.byte	0x5
	.uleb128 0x967
	.4byte	.LASF1922
	.byte	0x5
	.uleb128 0x968
	.4byte	.LASF1923
	.byte	0x5
	.uleb128 0x969
	.4byte	.LASF1924
	.byte	0x5
	.uleb128 0x96a
	.4byte	.LASF1925
	.byte	0x5
	.uleb128 0x96b
	.4byte	.LASF1926
	.byte	0x5
	.uleb128 0x96c
	.4byte	.LASF1927
	.byte	0x5
	.uleb128 0x96d
	.4byte	.LASF1928
	.byte	0x5
	.uleb128 0x96e
	.4byte	.LASF1929
	.byte	0x5
	.uleb128 0x96f
	.4byte	.LASF1930
	.byte	0x5
	.uleb128 0x972
	.4byte	.LASF1931
	.byte	0x5
	.uleb128 0x973
	.4byte	.LASF1932
	.byte	0x5
	.uleb128 0x974
	.4byte	.LASF1933
	.byte	0x5
	.uleb128 0x975
	.4byte	.LASF1934
	.byte	0x5
	.uleb128 0x976
	.4byte	.LASF1935
	.byte	0x5
	.uleb128 0x977
	.4byte	.LASF1936
	.byte	0x5
	.uleb128 0x97a
	.4byte	.LASF1937
	.byte	0x5
	.uleb128 0x97d
	.4byte	.LASF1938
	.byte	0x5
	.uleb128 0x980
	.4byte	.LASF1939
	.byte	0x5
	.uleb128 0x983
	.4byte	.LASF1940
	.byte	0x5
	.uleb128 0x986
	.4byte	.LASF1941
	.byte	0x5
	.uleb128 0x98e
	.4byte	.LASF1942
	.byte	0x5
	.uleb128 0x98f
	.4byte	.LASF1943
	.byte	0x5
	.uleb128 0x990
	.4byte	.LASF1944
	.byte	0x5
	.uleb128 0x991
	.4byte	.LASF1945
	.byte	0x5
	.uleb128 0x992
	.4byte	.LASF1946
	.byte	0x5
	.uleb128 0x993
	.4byte	.LASF1947
	.byte	0x5
	.uleb128 0x994
	.4byte	.LASF1948
	.byte	0x5
	.uleb128 0x995
	.4byte	.LASF1949
	.byte	0x5
	.uleb128 0x996
	.4byte	.LASF1950
	.byte	0x5
	.uleb128 0x997
	.4byte	.LASF1951
	.byte	0x5
	.uleb128 0x998
	.4byte	.LASF1952
	.byte	0x5
	.uleb128 0x999
	.4byte	.LASF1953
	.byte	0x5
	.uleb128 0x99a
	.4byte	.LASF1954
	.byte	0x5
	.uleb128 0x99b
	.4byte	.LASF1955
	.byte	0x5
	.uleb128 0x99c
	.4byte	.LASF1956
	.byte	0x5
	.uleb128 0x99d
	.4byte	.LASF1957
	.byte	0x5
	.uleb128 0x99e
	.4byte	.LASF1958
	.byte	0x5
	.uleb128 0x9a1
	.4byte	.LASF1959
	.byte	0x5
	.uleb128 0x9a2
	.4byte	.LASF1960
	.byte	0x5
	.uleb128 0x9a3
	.4byte	.LASF1961
	.byte	0x5
	.uleb128 0x9a4
	.4byte	.LASF1962
	.byte	0x5
	.uleb128 0x9a5
	.4byte	.LASF1963
	.byte	0x5
	.uleb128 0x9a6
	.4byte	.LASF1964
	.byte	0x5
	.uleb128 0x9a7
	.4byte	.LASF1965
	.byte	0x5
	.uleb128 0x9a8
	.4byte	.LASF1966
	.byte	0x5
	.uleb128 0x9a9
	.4byte	.LASF1967
	.byte	0x5
	.uleb128 0x9aa
	.4byte	.LASF1968
	.byte	0x5
	.uleb128 0x9ab
	.4byte	.LASF1969
	.byte	0x5
	.uleb128 0x9ac
	.4byte	.LASF1970
	.byte	0x5
	.uleb128 0x9ad
	.4byte	.LASF1971
	.byte	0x5
	.uleb128 0x9ae
	.4byte	.LASF1972
	.byte	0x5
	.uleb128 0x9af
	.4byte	.LASF1973
	.byte	0x5
	.uleb128 0x9b0
	.4byte	.LASF1974
	.byte	0x5
	.uleb128 0x9b3
	.4byte	.LASF1975
	.byte	0x5
	.uleb128 0x9b4
	.4byte	.LASF1976
	.byte	0x5
	.uleb128 0x9b5
	.4byte	.LASF1977
	.byte	0x5
	.uleb128 0x9b6
	.4byte	.LASF1978
	.byte	0x5
	.uleb128 0x9b7
	.4byte	.LASF1979
	.byte	0x5
	.uleb128 0x9b8
	.4byte	.LASF1980
	.byte	0x5
	.uleb128 0x9b9
	.4byte	.LASF1981
	.byte	0x5
	.uleb128 0x9ba
	.4byte	.LASF1982
	.byte	0x5
	.uleb128 0x9bb
	.4byte	.LASF1983
	.byte	0x5
	.uleb128 0x9bc
	.4byte	.LASF1984
	.byte	0x5
	.uleb128 0x9bd
	.4byte	.LASF1985
	.byte	0x5
	.uleb128 0x9be
	.4byte	.LASF1986
	.byte	0x5
	.uleb128 0x9bf
	.4byte	.LASF1987
	.byte	0x5
	.uleb128 0x9c0
	.4byte	.LASF1988
	.byte	0x5
	.uleb128 0x9c1
	.4byte	.LASF1989
	.byte	0x5
	.uleb128 0x9c4
	.4byte	.LASF1990
	.byte	0x5
	.uleb128 0x9c7
	.4byte	.LASF1991
	.byte	0x5
	.uleb128 0x9ca
	.4byte	.LASF1992
	.byte	0x5
	.uleb128 0x9cd
	.4byte	.LASF1993
	.byte	0x5
	.uleb128 0x9d0
	.4byte	.LASF1994
	.byte	0x5
	.uleb128 0x9d1
	.4byte	.LASF1995
	.byte	0x5
	.uleb128 0x9d2
	.4byte	.LASF1996
	.byte	0x5
	.uleb128 0x9d3
	.4byte	.LASF1997
	.byte	0x5
	.uleb128 0x9d4
	.4byte	.LASF1998
	.byte	0x5
	.uleb128 0x9d5
	.4byte	.LASF1999
	.byte	0x5
	.uleb128 0x9d6
	.4byte	.LASF2000
	.byte	0x5
	.uleb128 0x9d7
	.4byte	.LASF2001
	.byte	0x5
	.uleb128 0x9d8
	.4byte	.LASF2002
	.byte	0x5
	.uleb128 0x9d9
	.4byte	.LASF2003
	.byte	0x5
	.uleb128 0x9da
	.4byte	.LASF2004
	.byte	0x5
	.uleb128 0x9db
	.4byte	.LASF2005
	.byte	0x5
	.uleb128 0x9dc
	.4byte	.LASF2006
	.byte	0x5
	.uleb128 0x9dd
	.4byte	.LASF2007
	.byte	0x5
	.uleb128 0x9e0
	.4byte	.LASF2008
	.byte	0x5
	.uleb128 0x9e1
	.4byte	.LASF2009
	.byte	0x5
	.uleb128 0x9e2
	.4byte	.LASF2010
	.byte	0x5
	.uleb128 0x9ea
	.4byte	.LASF2011
	.byte	0x5
	.uleb128 0x9eb
	.4byte	.LASF2012
	.byte	0x5
	.uleb128 0x9ec
	.4byte	.LASF2013
	.byte	0x5
	.uleb128 0x9ed
	.4byte	.LASF2014
	.byte	0x5
	.uleb128 0x9ee
	.4byte	.LASF2015
	.byte	0x5
	.uleb128 0x9ef
	.4byte	.LASF2016
	.byte	0x5
	.uleb128 0x9f0
	.4byte	.LASF2017
	.byte	0x5
	.uleb128 0x9f1
	.4byte	.LASF2018
	.byte	0x5
	.uleb128 0x9f2
	.4byte	.LASF2019
	.byte	0x5
	.uleb128 0x9f3
	.4byte	.LASF2020
	.byte	0x5
	.uleb128 0x9f4
	.4byte	.LASF2021
	.byte	0x5
	.uleb128 0x9f5
	.4byte	.LASF2022
	.byte	0x5
	.uleb128 0x9f8
	.4byte	.LASF2023
	.byte	0x5
	.uleb128 0x9f9
	.4byte	.LASF2024
	.byte	0x5
	.uleb128 0x9fa
	.4byte	.LASF2025
	.byte	0x5
	.uleb128 0x9fb
	.4byte	.LASF2026
	.byte	0x5
	.uleb128 0xa00
	.4byte	.LASF2027
	.byte	0x5
	.uleb128 0xa01
	.4byte	.LASF2028
	.byte	0x5
	.uleb128 0xa02
	.4byte	.LASF2029
	.byte	0x5
	.uleb128 0xa03
	.4byte	.LASF2030
	.byte	0x5
	.uleb128 0xa08
	.4byte	.LASF2031
	.byte	0x5
	.uleb128 0xa09
	.4byte	.LASF2032
	.byte	0x5
	.uleb128 0xa0a
	.4byte	.LASF2033
	.byte	0x5
	.uleb128 0xa0b
	.4byte	.LASF2034
	.byte	0x5
	.uleb128 0xa10
	.4byte	.LASF2035
	.byte	0x5
	.uleb128 0xa11
	.4byte	.LASF2036
	.byte	0x5
	.uleb128 0xa12
	.4byte	.LASF2037
	.byte	0x5
	.uleb128 0xa13
	.4byte	.LASF2038
	.byte	0x5
	.uleb128 0xa18
	.4byte	.LASF2039
	.byte	0x5
	.uleb128 0xa19
	.4byte	.LASF2040
	.byte	0x5
	.uleb128 0xa1a
	.4byte	.LASF2041
	.byte	0x5
	.uleb128 0xa1d
	.4byte	.LASF2042
	.byte	0x5
	.uleb128 0xa1e
	.4byte	.LASF2043
	.byte	0x5
	.uleb128 0xa1f
	.4byte	.LASF2044
	.byte	0x5
	.uleb128 0xa20
	.4byte	.LASF2045
	.byte	0x5
	.uleb128 0xa25
	.4byte	.LASF2046
	.byte	0x5
	.uleb128 0xa26
	.4byte	.LASF2047
	.byte	0x5
	.uleb128 0xa27
	.4byte	.LASF2048
	.byte	0x5
	.uleb128 0xa28
	.4byte	.LASF2049
	.byte	0x5
	.uleb128 0xa2d
	.4byte	.LASF2050
	.byte	0x5
	.uleb128 0xa2e
	.4byte	.LASF2051
	.byte	0x5
	.uleb128 0xa2f
	.4byte	.LASF2052
	.byte	0x5
	.uleb128 0xa30
	.4byte	.LASF2053
	.byte	0x5
	.uleb128 0xa35
	.4byte	.LASF2054
	.byte	0x5
	.uleb128 0xa36
	.4byte	.LASF2055
	.byte	0x5
	.uleb128 0xa37
	.4byte	.LASF2056
	.byte	0x5
	.uleb128 0xa38
	.4byte	.LASF2057
	.byte	0x5
	.uleb128 0xa3d
	.4byte	.LASF2058
	.byte	0x5
	.uleb128 0xa3e
	.4byte	.LASF2059
	.byte	0x5
	.uleb128 0xa3f
	.4byte	.LASF2060
	.byte	0x5
	.uleb128 0xa40
	.4byte	.LASF2061
	.byte	0x5
	.uleb128 0xa43
	.4byte	.LASF2062
	.byte	0x5
	.uleb128 0xa44
	.4byte	.LASF2063
	.byte	0x5
	.uleb128 0xa45
	.4byte	.LASF2064
	.byte	0x5
	.uleb128 0xa46
	.4byte	.LASF2065
	.byte	0x5
	.uleb128 0xa4b
	.4byte	.LASF2066
	.byte	0x5
	.uleb128 0xa4c
	.4byte	.LASF2067
	.byte	0x5
	.uleb128 0xa4d
	.4byte	.LASF2068
	.byte	0x5
	.uleb128 0xa52
	.4byte	.LASF2069
	.byte	0x5
	.uleb128 0xa53
	.4byte	.LASF2070
	.byte	0x5
	.uleb128 0xa54
	.4byte	.LASF2071
	.byte	0x5
	.uleb128 0xa59
	.4byte	.LASF2072
	.byte	0x5
	.uleb128 0xa5a
	.4byte	.LASF2073
	.byte	0x5
	.uleb128 0xa5b
	.4byte	.LASF2074
	.byte	0x5
	.uleb128 0xa60
	.4byte	.LASF2075
	.byte	0x5
	.uleb128 0xa61
	.4byte	.LASF2076
	.byte	0x5
	.uleb128 0xa62
	.4byte	.LASF2077
	.byte	0x5
	.uleb128 0xa65
	.4byte	.LASF2078
	.byte	0x5
	.uleb128 0xa66
	.4byte	.LASF2079
	.byte	0x5
	.uleb128 0xa67
	.4byte	.LASF2080
	.byte	0x5
	.uleb128 0xa68
	.4byte	.LASF2081
	.byte	0x5
	.uleb128 0xa6d
	.4byte	.LASF2082
	.byte	0x5
	.uleb128 0xa6e
	.4byte	.LASF2083
	.byte	0x5
	.uleb128 0xa6f
	.4byte	.LASF2084
	.byte	0x5
	.uleb128 0xa74
	.4byte	.LASF2085
	.byte	0x5
	.uleb128 0xa75
	.4byte	.LASF2086
	.byte	0x5
	.uleb128 0xa76
	.4byte	.LASF2087
	.byte	0x5
	.uleb128 0xa7b
	.4byte	.LASF2088
	.byte	0x5
	.uleb128 0xa7c
	.4byte	.LASF2089
	.byte	0x5
	.uleb128 0xa7d
	.4byte	.LASF2090
	.byte	0x5
	.uleb128 0xa82
	.4byte	.LASF2091
	.byte	0x5
	.uleb128 0xa83
	.4byte	.LASF2092
	.byte	0x5
	.uleb128 0xa84
	.4byte	.LASF2093
	.byte	0x5
	.uleb128 0xa87
	.4byte	.LASF2094
	.byte	0x5
	.uleb128 0xa88
	.4byte	.LASF2095
	.byte	0x5
	.uleb128 0xa89
	.4byte	.LASF2096
	.byte	0x5
	.uleb128 0xa8a
	.4byte	.LASF2097
	.byte	0x5
	.uleb128 0xa92
	.4byte	.LASF2098
	.byte	0x5
	.uleb128 0xa93
	.4byte	.LASF2099
	.byte	0x5
	.uleb128 0xa94
	.4byte	.LASF2100
	.byte	0x5
	.uleb128 0xa95
	.4byte	.LASF2101
	.byte	0x5
	.uleb128 0xa96
	.4byte	.LASF2102
	.byte	0x5
	.uleb128 0xa98
	.4byte	.LASF2103
	.byte	0x5
	.uleb128 0xa99
	.4byte	.LASF2104
	.byte	0x5
	.uleb128 0xa9a
	.4byte	.LASF2105
	.byte	0x5
	.uleb128 0xa9c
	.4byte	.LASF2106
	.byte	0x5
	.uleb128 0xa9e
	.4byte	.LASF2107
	.byte	0x5
	.uleb128 0xa9f
	.4byte	.LASF2108
	.byte	0x5
	.uleb128 0xaa0
	.4byte	.LASF2109
	.byte	0x5
	.uleb128 0xaa3
	.4byte	.LASF2110
	.byte	0x5
	.uleb128 0xaa4
	.4byte	.LASF2111
	.byte	0x5
	.uleb128 0xaa5
	.4byte	.LASF2112
	.byte	0x5
	.uleb128 0xaa7
	.4byte	.LASF2113
	.byte	0x5
	.uleb128 0xaa8
	.4byte	.LASF2114
	.byte	0x5
	.uleb128 0xaa9
	.4byte	.LASF2115
	.byte	0x5
	.uleb128 0xaaa
	.4byte	.LASF2116
	.byte	0x5
	.uleb128 0xaac
	.4byte	.LASF2117
	.byte	0x5
	.uleb128 0xaad
	.4byte	.LASF2118
	.byte	0x5
	.uleb128 0xaae
	.4byte	.LASF2119
	.byte	0x5
	.uleb128 0xaaf
	.4byte	.LASF2120
	.byte	0x5
	.uleb128 0xab0
	.4byte	.LASF2121
	.byte	0x5
	.uleb128 0xab1
	.4byte	.LASF2122
	.byte	0x5
	.uleb128 0xab2
	.4byte	.LASF2123
	.byte	0x5
	.uleb128 0xab3
	.4byte	.LASF2124
	.byte	0x5
	.uleb128 0xab6
	.4byte	.LASF2125
	.byte	0x5
	.uleb128 0xab7
	.4byte	.LASF2126
	.byte	0x5
	.uleb128 0xab8
	.4byte	.LASF2127
	.byte	0x5
	.uleb128 0xab9
	.4byte	.LASF2128
	.byte	0x5
	.uleb128 0xabb
	.4byte	.LASF2129
	.byte	0x5
	.uleb128 0xabd
	.4byte	.LASF2130
	.byte	0x5
	.uleb128 0xabe
	.4byte	.LASF2131
	.byte	0x5
	.uleb128 0xabf
	.4byte	.LASF2132
	.byte	0x5
	.uleb128 0xac0
	.4byte	.LASF2133
	.byte	0x5
	.uleb128 0xac2
	.4byte	.LASF2134
	.byte	0x5
	.uleb128 0xac4
	.4byte	.LASF2135
	.byte	0x5
	.uleb128 0xac5
	.4byte	.LASF2136
	.byte	0x5
	.uleb128 0xac6
	.4byte	.LASF2137
	.byte	0x5
	.uleb128 0xac7
	.4byte	.LASF2138
	.byte	0x5
	.uleb128 0xac8
	.4byte	.LASF2139
	.byte	0x5
	.uleb128 0xaca
	.4byte	.LASF2140
	.byte	0x5
	.uleb128 0xacb
	.4byte	.LASF2141
	.byte	0x5
	.uleb128 0xacc
	.4byte	.LASF2142
	.byte	0x5
	.uleb128 0xace
	.4byte	.LASF2143
	.byte	0x5
	.uleb128 0xacf
	.4byte	.LASF2144
	.byte	0x5
	.uleb128 0xad2
	.4byte	.LASF2145
	.byte	0x5
	.uleb128 0xad3
	.4byte	.LASF2146
	.byte	0x5
	.uleb128 0xad4
	.4byte	.LASF2147
	.byte	0x5
	.uleb128 0xad5
	.4byte	.LASF2148
	.byte	0x5
	.uleb128 0xad6
	.4byte	.LASF2149
	.byte	0x5
	.uleb128 0xad7
	.4byte	.LASF2150
	.byte	0x5
	.uleb128 0xad8
	.4byte	.LASF2151
	.byte	0x5
	.uleb128 0xad9
	.4byte	.LASF2152
	.byte	0x5
	.uleb128 0xada
	.4byte	.LASF2153
	.byte	0x5
	.uleb128 0xadb
	.4byte	.LASF2154
	.byte	0x5
	.uleb128 0xadc
	.4byte	.LASF2155
	.byte	0x5
	.uleb128 0xadd
	.4byte	.LASF2156
	.byte	0x5
	.uleb128 0xade
	.4byte	.LASF2157
	.byte	0x5
	.uleb128 0xadf
	.4byte	.LASF2158
	.byte	0x5
	.uleb128 0xae0
	.4byte	.LASF2159
	.byte	0x5
	.uleb128 0xae3
	.4byte	.LASF2160
	.byte	0x5
	.uleb128 0xae4
	.4byte	.LASF2161
	.byte	0x5
	.uleb128 0xae5
	.4byte	.LASF2162
	.byte	0x5
	.uleb128 0xae6
	.4byte	.LASF2163
	.byte	0x5
	.uleb128 0xae7
	.4byte	.LASF2164
	.byte	0x5
	.uleb128 0xae8
	.4byte	.LASF2165
	.byte	0x5
	.uleb128 0xae9
	.4byte	.LASF2166
	.byte	0x5
	.uleb128 0xaea
	.4byte	.LASF2167
	.byte	0x5
	.uleb128 0xaeb
	.4byte	.LASF2168
	.byte	0x5
	.uleb128 0xaec
	.4byte	.LASF2169
	.byte	0x5
	.uleb128 0xaed
	.4byte	.LASF2170
	.byte	0x5
	.uleb128 0xaee
	.4byte	.LASF2171
	.byte	0x5
	.uleb128 0xaf1
	.4byte	.LASF2172
	.byte	0x5
	.uleb128 0xaf2
	.4byte	.LASF2173
	.byte	0x5
	.uleb128 0xaf3
	.4byte	.LASF2174
	.byte	0x5
	.uleb128 0xaf4
	.4byte	.LASF2175
	.byte	0x5
	.uleb128 0xaf5
	.4byte	.LASF2176
	.byte	0x5
	.uleb128 0xaf6
	.4byte	.LASF2177
	.byte	0x5
	.uleb128 0xaf7
	.4byte	.LASF2178
	.byte	0x5
	.uleb128 0xaf8
	.4byte	.LASF2179
	.byte	0x5
	.uleb128 0xafb
	.4byte	.LASF2180
	.byte	0x5
	.uleb128 0xafc
	.4byte	.LASF2181
	.byte	0x5
	.uleb128 0xafd
	.4byte	.LASF2182
	.byte	0x5
	.uleb128 0xaff
	.4byte	.LASF2183
	.byte	0x5
	.uleb128 0xb00
	.4byte	.LASF2184
	.byte	0x5
	.uleb128 0xb02
	.4byte	.LASF2185
	.byte	0x5
	.uleb128 0xb03
	.4byte	.LASF2186
	.byte	0x5
	.uleb128 0xb04
	.4byte	.LASF2187
	.byte	0x5
	.uleb128 0xb05
	.4byte	.LASF2188
	.byte	0x5
	.uleb128 0xb07
	.4byte	.LASF2189
	.byte	0x5
	.uleb128 0xb09
	.4byte	.LASF2190
	.byte	0x5
	.uleb128 0xb0a
	.4byte	.LASF2191
	.byte	0x5
	.uleb128 0xb0b
	.4byte	.LASF2192
	.byte	0x5
	.uleb128 0xb0d
	.4byte	.LASF2193
	.byte	0x5
	.uleb128 0xb0e
	.4byte	.LASF2194
	.byte	0x5
	.uleb128 0xb10
	.4byte	.LASF2195
	.byte	0x5
	.uleb128 0xb11
	.4byte	.LASF2196
	.byte	0x5
	.uleb128 0xb12
	.4byte	.LASF2197
	.byte	0x5
	.uleb128 0xb13
	.4byte	.LASF2198
	.byte	0x5
	.uleb128 0xb15
	.4byte	.LASF2199
	.byte	0x5
	.uleb128 0xb19
	.4byte	.LASF2200
	.byte	0x5
	.uleb128 0xb1a
	.4byte	.LASF2201
	.byte	0x5
	.uleb128 0xb1b
	.4byte	.LASF2202
	.byte	0x5
	.uleb128 0xb1d
	.4byte	.LASF2203
	.byte	0x5
	.uleb128 0xb1e
	.4byte	.LASF2204
	.byte	0x5
	.uleb128 0xb1f
	.4byte	.LASF2205
	.byte	0x5
	.uleb128 0xb20
	.4byte	.LASF2206
	.byte	0x5
	.uleb128 0xb21
	.4byte	.LASF2207
	.byte	0x5
	.uleb128 0xb23
	.4byte	.LASF2208
	.byte	0x5
	.uleb128 0xb24
	.4byte	.LASF2209
	.byte	0x5
	.uleb128 0xb25
	.4byte	.LASF2210
	.byte	0x5
	.uleb128 0xb27
	.4byte	.LASF2211
	.byte	0x5
	.uleb128 0xb28
	.4byte	.LASF2212
	.byte	0x5
	.uleb128 0xb29
	.4byte	.LASF2213
	.byte	0x5
	.uleb128 0xb2a
	.4byte	.LASF2214
	.byte	0x5
	.uleb128 0xb2b
	.4byte	.LASF2215
	.byte	0x5
	.uleb128 0xb2e
	.4byte	.LASF2216
	.byte	0x5
	.uleb128 0xb2f
	.4byte	.LASF2217
	.byte	0x5
	.uleb128 0xb30
	.4byte	.LASF2218
	.byte	0x5
	.uleb128 0xb32
	.4byte	.LASF2219
	.byte	0x5
	.uleb128 0xb33
	.4byte	.LASF2220
	.byte	0x5
	.uleb128 0xb35
	.4byte	.LASF2221
	.byte	0x5
	.uleb128 0xb36
	.4byte	.LASF2222
	.byte	0x5
	.uleb128 0xb37
	.4byte	.LASF2223
	.byte	0x5
	.uleb128 0xb38
	.4byte	.LASF2224
	.byte	0x5
	.uleb128 0xb3a
	.4byte	.LASF2225
	.byte	0x5
	.uleb128 0xb3c
	.4byte	.LASF2226
	.byte	0x5
	.uleb128 0xb3d
	.4byte	.LASF2227
	.byte	0x5
	.uleb128 0xb3e
	.4byte	.LASF2228
	.byte	0x5
	.uleb128 0xb40
	.4byte	.LASF2229
	.byte	0x5
	.uleb128 0xb41
	.4byte	.LASF2230
	.byte	0x5
	.uleb128 0xb43
	.4byte	.LASF2231
	.byte	0x5
	.uleb128 0xb44
	.4byte	.LASF2232
	.byte	0x5
	.uleb128 0xb45
	.4byte	.LASF2233
	.byte	0x5
	.uleb128 0xb46
	.4byte	.LASF2234
	.byte	0x5
	.uleb128 0xb48
	.4byte	.LASF2235
	.byte	0x5
	.uleb128 0xb4c
	.4byte	.LASF2236
	.byte	0x5
	.uleb128 0xb4d
	.4byte	.LASF2237
	.byte	0x5
	.uleb128 0xb4e
	.4byte	.LASF2238
	.byte	0x5
	.uleb128 0xb50
	.4byte	.LASF2239
	.byte	0x5
	.uleb128 0xb51
	.4byte	.LASF2240
	.byte	0x5
	.uleb128 0xb52
	.4byte	.LASF2241
	.byte	0x5
	.uleb128 0xb53
	.4byte	.LASF2242
	.byte	0x5
	.uleb128 0xb54
	.4byte	.LASF2243
	.byte	0x5
	.uleb128 0xb56
	.4byte	.LASF2244
	.byte	0x5
	.uleb128 0xb57
	.4byte	.LASF2245
	.byte	0x5
	.uleb128 0xb58
	.4byte	.LASF2246
	.byte	0x5
	.uleb128 0xb5a
	.4byte	.LASF2247
	.byte	0x5
	.uleb128 0xb5b
	.4byte	.LASF2248
	.byte	0x5
	.uleb128 0xb5c
	.4byte	.LASF2249
	.byte	0x5
	.uleb128 0xb5d
	.4byte	.LASF2250
	.byte	0x5
	.uleb128 0xb5e
	.4byte	.LASF2251
	.byte	0x5
	.uleb128 0xb61
	.4byte	.LASF2252
	.byte	0x5
	.uleb128 0xb62
	.4byte	.LASF2253
	.byte	0x5
	.uleb128 0xb63
	.4byte	.LASF2254
	.byte	0x5
	.uleb128 0xb64
	.4byte	.LASF2255
	.byte	0x5
	.uleb128 0xb65
	.4byte	.LASF2256
	.byte	0x5
	.uleb128 0xb66
	.4byte	.LASF2257
	.byte	0x5
	.uleb128 0xb67
	.4byte	.LASF2258
	.byte	0x5
	.uleb128 0xb68
	.4byte	.LASF2259
	.byte	0x5
	.uleb128 0xb69
	.4byte	.LASF2260
	.byte	0x5
	.uleb128 0xb6a
	.4byte	.LASF2261
	.byte	0x5
	.uleb128 0xb6b
	.4byte	.LASF2262
	.byte	0x5
	.uleb128 0xb6c
	.4byte	.LASF2263
	.byte	0x5
	.uleb128 0xb6d
	.4byte	.LASF2264
	.byte	0x5
	.uleb128 0xb6e
	.4byte	.LASF2265
	.byte	0x5
	.uleb128 0xb6f
	.4byte	.LASF2266
	.byte	0x5
	.uleb128 0xb72
	.4byte	.LASF2267
	.byte	0x5
	.uleb128 0xb75
	.4byte	.LASF2268
	.byte	0x5
	.uleb128 0xb78
	.4byte	.LASF2269
	.byte	0x5
	.uleb128 0xb7b
	.4byte	.LASF2270
	.byte	0x5
	.uleb128 0xb7e
	.4byte	.LASF2271
	.byte	0x5
	.uleb128 0xb81
	.4byte	.LASF2272
	.byte	0x5
	.uleb128 0xb84
	.4byte	.LASF2273
	.byte	0x5
	.uleb128 0xb87
	.4byte	.LASF2274
	.byte	0x5
	.uleb128 0xb8a
	.4byte	.LASF2275
	.byte	0x5
	.uleb128 0xb8b
	.4byte	.LASF2276
	.byte	0x5
	.uleb128 0xb8c
	.4byte	.LASF2277
	.byte	0x5
	.uleb128 0xb8d
	.4byte	.LASF2278
	.byte	0x5
	.uleb128 0xb8e
	.4byte	.LASF2279
	.byte	0x5
	.uleb128 0xb8f
	.4byte	.LASF2280
	.byte	0x5
	.uleb128 0xb90
	.4byte	.LASF2281
	.byte	0x5
	.uleb128 0xb91
	.4byte	.LASF2282
	.byte	0x5
	.uleb128 0xb92
	.4byte	.LASF2283
	.byte	0x5
	.uleb128 0xb94
	.4byte	.LASF2284
	.byte	0x5
	.uleb128 0xb95
	.4byte	.LASF2285
	.byte	0x5
	.uleb128 0xb96
	.4byte	.LASF2286
	.byte	0x5
	.uleb128 0xb98
	.4byte	.LASF2287
	.byte	0x5
	.uleb128 0xb99
	.4byte	.LASF2288
	.byte	0x5
	.uleb128 0xb9a
	.4byte	.LASF2289
	.byte	0x5
	.uleb128 0xb9b
	.4byte	.LASF2290
	.byte	0x5
	.uleb128 0xb9c
	.4byte	.LASF2291
	.byte	0x5
	.uleb128 0xb9d
	.4byte	.LASF2292
	.byte	0x5
	.uleb128 0xba0
	.4byte	.LASF2293
	.byte	0x5
	.uleb128 0xba1
	.4byte	.LASF2294
	.byte	0x5
	.uleb128 0xba2
	.4byte	.LASF2295
	.byte	0x5
	.uleb128 0xba3
	.4byte	.LASF2296
	.byte	0x5
	.uleb128 0xba4
	.4byte	.LASF2297
	.byte	0x5
	.uleb128 0xba5
	.4byte	.LASF2298
	.byte	0x5
	.uleb128 0xba7
	.4byte	.LASF2299
	.byte	0x5
	.uleb128 0xba8
	.4byte	.LASF2300
	.byte	0x5
	.uleb128 0xba9
	.4byte	.LASF2301
	.byte	0x5
	.uleb128 0xbaa
	.4byte	.LASF2302
	.byte	0x5
	.uleb128 0xbab
	.4byte	.LASF2303
	.byte	0x5
	.uleb128 0xbac
	.4byte	.LASF2304
	.byte	0x5
	.uleb128 0xbaf
	.4byte	.LASF2305
	.byte	0x5
	.uleb128 0xbb2
	.4byte	.LASF2306
	.byte	0x5
	.uleb128 0xbb3
	.4byte	.LASF2307
	.byte	0x5
	.uleb128 0xbb4
	.4byte	.LASF2308
	.byte	0x5
	.uleb128 0xbbd
	.4byte	.LASF2309
	.byte	0x5
	.uleb128 0xbbe
	.4byte	.LASF2310
	.byte	0x5
	.uleb128 0xbbf
	.4byte	.LASF2311
	.byte	0x5
	.uleb128 0xbc0
	.4byte	.LASF2312
	.byte	0x5
	.uleb128 0xbc1
	.4byte	.LASF2313
	.byte	0x5
	.uleb128 0xbc2
	.4byte	.LASF2314
	.byte	0x5
	.uleb128 0xbc3
	.4byte	.LASF2315
	.byte	0x5
	.uleb128 0xbc4
	.4byte	.LASF2316
	.byte	0x5
	.uleb128 0xbc5
	.4byte	.LASF2317
	.byte	0x5
	.uleb128 0xbc6
	.4byte	.LASF2318
	.byte	0x5
	.uleb128 0xbc7
	.4byte	.LASF2319
	.byte	0x5
	.uleb128 0xbc8
	.4byte	.LASF2320
	.byte	0x5
	.uleb128 0xbc9
	.4byte	.LASF2321
	.byte	0x5
	.uleb128 0xbca
	.4byte	.LASF2322
	.byte	0x5
	.uleb128 0xbcb
	.4byte	.LASF2323
	.byte	0x5
	.uleb128 0xbcc
	.4byte	.LASF2324
	.byte	0x5
	.uleb128 0xbcd
	.4byte	.LASF2325
	.byte	0x5
	.uleb128 0xbce
	.4byte	.LASF2326
	.byte	0x5
	.uleb128 0xbcf
	.4byte	.LASF2327
	.byte	0x5
	.uleb128 0xbd0
	.4byte	.LASF2328
	.byte	0x5
	.uleb128 0xbd1
	.4byte	.LASF2329
	.byte	0x5
	.uleb128 0xbd2
	.4byte	.LASF2330
	.byte	0x5
	.uleb128 0xbd3
	.4byte	.LASF2331
	.byte	0x5
	.uleb128 0xbd4
	.4byte	.LASF2332
	.byte	0x5
	.uleb128 0xbd5
	.4byte	.LASF2333
	.byte	0x5
	.uleb128 0xbd6
	.4byte	.LASF2334
	.byte	0x5
	.uleb128 0xbd7
	.4byte	.LASF2335
	.byte	0x5
	.uleb128 0xbd8
	.4byte	.LASF2336
	.byte	0x5
	.uleb128 0xbd9
	.4byte	.LASF2337
	.byte	0x5
	.uleb128 0xbda
	.4byte	.LASF2338
	.byte	0x5
	.uleb128 0xbdd
	.4byte	.LASF2339
	.byte	0x5
	.uleb128 0xbde
	.4byte	.LASF2340
	.byte	0x5
	.uleb128 0xbdf
	.4byte	.LASF2341
	.byte	0x5
	.uleb128 0xbe0
	.4byte	.LASF2342
	.byte	0x5
	.uleb128 0xbe1
	.4byte	.LASF2343
	.byte	0x5
	.uleb128 0xbe2
	.4byte	.LASF2344
	.byte	0x5
	.uleb128 0xbe3
	.4byte	.LASF2345
	.byte	0x5
	.uleb128 0xbe4
	.4byte	.LASF2346
	.byte	0x5
	.uleb128 0xbe5
	.4byte	.LASF2347
	.byte	0x5
	.uleb128 0xbe6
	.4byte	.LASF2348
	.byte	0x5
	.uleb128 0xbe7
	.4byte	.LASF2349
	.byte	0x5
	.uleb128 0xbe8
	.4byte	.LASF2350
	.byte	0x5
	.uleb128 0xbe9
	.4byte	.LASF2351
	.byte	0x5
	.uleb128 0xbea
	.4byte	.LASF2352
	.byte	0x5
	.uleb128 0xbeb
	.4byte	.LASF2353
	.byte	0x5
	.uleb128 0xbec
	.4byte	.LASF2354
	.byte	0x5
	.uleb128 0xbed
	.4byte	.LASF2355
	.byte	0x5
	.uleb128 0xbee
	.4byte	.LASF2356
	.byte	0x5
	.uleb128 0xbef
	.4byte	.LASF2357
	.byte	0x5
	.uleb128 0xbf0
	.4byte	.LASF2358
	.byte	0x5
	.uleb128 0xbf1
	.4byte	.LASF2359
	.byte	0x5
	.uleb128 0xbf2
	.4byte	.LASF2360
	.byte	0x5
	.uleb128 0xbf5
	.4byte	.LASF2361
	.byte	0x5
	.uleb128 0xbf6
	.4byte	.LASF2362
	.byte	0x5
	.uleb128 0xbf7
	.4byte	.LASF2363
	.byte	0x5
	.uleb128 0xbf8
	.4byte	.LASF2364
	.byte	0x5
	.uleb128 0xbf9
	.4byte	.LASF2365
	.byte	0x5
	.uleb128 0xbfa
	.4byte	.LASF2366
	.byte	0x5
	.uleb128 0xbfb
	.4byte	.LASF2367
	.byte	0x5
	.uleb128 0xbfc
	.4byte	.LASF2368
	.byte	0x5
	.uleb128 0xbfd
	.4byte	.LASF2369
	.byte	0x5
	.uleb128 0xbfe
	.4byte	.LASF2370
	.byte	0x5
	.uleb128 0xbff
	.4byte	.LASF2371
	.byte	0x5
	.uleb128 0xc00
	.4byte	.LASF2372
	.byte	0x5
	.uleb128 0xc01
	.4byte	.LASF2373
	.byte	0x5
	.uleb128 0xc02
	.4byte	.LASF2374
	.byte	0x5
	.uleb128 0xc03
	.4byte	.LASF2375
	.byte	0x5
	.uleb128 0xc04
	.4byte	.LASF2376
	.byte	0x5
	.uleb128 0xc05
	.4byte	.LASF2377
	.byte	0x5
	.uleb128 0xc06
	.4byte	.LASF2378
	.byte	0x5
	.uleb128 0xc07
	.4byte	.LASF2379
	.byte	0x5
	.uleb128 0xc08
	.4byte	.LASF2380
	.byte	0x5
	.uleb128 0xc09
	.4byte	.LASF2381
	.byte	0x5
	.uleb128 0xc0a
	.4byte	.LASF2382
	.byte	0x5
	.uleb128 0xc0b
	.4byte	.LASF2383
	.byte	0x5
	.uleb128 0xc0c
	.4byte	.LASF2384
	.byte	0x5
	.uleb128 0xc0f
	.4byte	.LASF2385
	.byte	0x5
	.uleb128 0xc10
	.4byte	.LASF2386
	.byte	0x5
	.uleb128 0xc13
	.4byte	.LASF2387
	.byte	0x5
	.uleb128 0xc14
	.4byte	.LASF2388
	.byte	0x5
	.uleb128 0xc18
	.4byte	.LASF2389
	.byte	0x5
	.uleb128 0xc19
	.4byte	.LASF2390
	.byte	0x5
	.uleb128 0xc1c
	.4byte	.LASF2391
	.byte	0x5
	.uleb128 0xc1d
	.4byte	.LASF2392
	.byte	0x5
	.uleb128 0xc1e
	.4byte	.LASF2393
	.byte	0x5
	.uleb128 0xc1f
	.4byte	.LASF2394
	.byte	0x5
	.uleb128 0xc20
	.4byte	.LASF2395
	.byte	0x5
	.uleb128 0xc23
	.4byte	.LASF2396
	.byte	0x5
	.uleb128 0xc24
	.4byte	.LASF2397
	.byte	0x5
	.uleb128 0xc25
	.4byte	.LASF2398
	.byte	0x5
	.uleb128 0xc26
	.4byte	.LASF2399
	.byte	0x5
	.uleb128 0xc27
	.4byte	.LASF2400
	.byte	0x5
	.uleb128 0xc28
	.4byte	.LASF2401
	.byte	0x5
	.uleb128 0xc29
	.4byte	.LASF2402
	.byte	0x5
	.uleb128 0xc2a
	.4byte	.LASF2403
	.byte	0x5
	.uleb128 0xc2b
	.4byte	.LASF2404
	.byte	0x5
	.uleb128 0xc2c
	.4byte	.LASF2405
	.byte	0x5
	.uleb128 0xc2d
	.4byte	.LASF2406
	.byte	0x5
	.uleb128 0xc2e
	.4byte	.LASF2407
	.byte	0x5
	.uleb128 0xc2f
	.4byte	.LASF2408
	.byte	0x5
	.uleb128 0xc30
	.4byte	.LASF2409
	.byte	0x5
	.uleb128 0xc31
	.4byte	.LASF2410
	.byte	0x5
	.uleb128 0xc32
	.4byte	.LASF2411
	.byte	0x5
	.uleb128 0xc33
	.4byte	.LASF2412
	.byte	0x5
	.uleb128 0xc34
	.4byte	.LASF2413
	.byte	0x5
	.uleb128 0xc35
	.4byte	.LASF2414
	.byte	0x5
	.uleb128 0xc36
	.4byte	.LASF2415
	.byte	0x5
	.uleb128 0xc37
	.4byte	.LASF2416
	.byte	0x5
	.uleb128 0xc38
	.4byte	.LASF2417
	.byte	0x5
	.uleb128 0xc3b
	.4byte	.LASF2418
	.byte	0x5
	.uleb128 0xc3c
	.4byte	.LASF2419
	.byte	0x5
	.uleb128 0xc3d
	.4byte	.LASF2420
	.byte	0x5
	.uleb128 0xc3e
	.4byte	.LASF2421
	.byte	0x5
	.uleb128 0xc3f
	.4byte	.LASF2422
	.byte	0x5
	.uleb128 0xc40
	.4byte	.LASF2423
	.byte	0x5
	.uleb128 0xc41
	.4byte	.LASF2424
	.byte	0x5
	.uleb128 0xc42
	.4byte	.LASF2425
	.byte	0x5
	.uleb128 0xc43
	.4byte	.LASF2426
	.byte	0x5
	.uleb128 0xc44
	.4byte	.LASF2427
	.byte	0x5
	.uleb128 0xc45
	.4byte	.LASF2428
	.byte	0x5
	.uleb128 0xc46
	.4byte	.LASF2429
	.byte	0x5
	.uleb128 0xc49
	.4byte	.LASF2430
	.byte	0x5
	.uleb128 0xc4c
	.4byte	.LASF2431
	.byte	0x5
	.uleb128 0xc55
	.4byte	.LASF2432
	.byte	0x5
	.uleb128 0xc56
	.4byte	.LASF2433
	.byte	0x5
	.uleb128 0xc57
	.4byte	.LASF2434
	.byte	0x5
	.uleb128 0xc58
	.4byte	.LASF2435
	.byte	0x5
	.uleb128 0xc59
	.4byte	.LASF2436
	.byte	0x5
	.uleb128 0xc5a
	.4byte	.LASF2437
	.byte	0x5
	.uleb128 0xc5b
	.4byte	.LASF2438
	.byte	0x5
	.uleb128 0xc5c
	.4byte	.LASF2439
	.byte	0x5
	.uleb128 0xc5e
	.4byte	.LASF2440
	.byte	0x5
	.uleb128 0xc61
	.4byte	.LASF2441
	.byte	0x5
	.uleb128 0xc62
	.4byte	.LASF2442
	.byte	0x5
	.uleb128 0xc63
	.4byte	.LASF2443
	.byte	0x5
	.uleb128 0xc64
	.4byte	.LASF2444
	.byte	0x5
	.uleb128 0xc65
	.4byte	.LASF2445
	.byte	0x5
	.uleb128 0xc66
	.4byte	.LASF2446
	.byte	0x5
	.uleb128 0xc67
	.4byte	.LASF2447
	.byte	0x5
	.uleb128 0xc68
	.4byte	.LASF2448
	.byte	0x5
	.uleb128 0xc6a
	.4byte	.LASF2449
	.byte	0x5
	.uleb128 0xc6b
	.4byte	.LASF2450
	.byte	0x5
	.uleb128 0xc6c
	.4byte	.LASF2451
	.byte	0x5
	.uleb128 0xc6e
	.4byte	.LASF2452
	.byte	0x5
	.uleb128 0xc71
	.4byte	.LASF2453
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_adc.h.85.97900172261010e774b61b2a04e3b7ff,comdat
.Ldebug_macro12:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF2456
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF2457
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF2458
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF2459
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF2460
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF2461
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF2462
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF2463
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF2464
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF2465
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF2466
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF2467
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF2468
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF2469
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF2470
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF2471
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF2472
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF2473
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF2474
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF2475
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF2476
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF2477
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF2478
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF2479
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF2480
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF2481
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF2482
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF2483
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF2484
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF2485
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF2486
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF2487
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF2488
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF2489
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF2490
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF2491
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF2492
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF2493
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF2494
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF2495
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF2496
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF2497
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF2498
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF2499
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF2500
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF2501
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF2502
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF2503
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF2504
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF2505
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF2506
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF2507
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF2508
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF2509
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF2510
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF2511
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF2512
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF2513
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF2514
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF2515
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF2516
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF2517
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF2518
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF2519
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF2520
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF2521
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF2522
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF2523
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF2524
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF2525
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF2526
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF2527
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF2528
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF2529
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF2530
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF2531
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF2532
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF2533
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF2534
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF2535
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF2536
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF2537
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF2538
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF2539
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF2540
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF2541
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF2542
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF2543
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF2544
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF2545
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF2546
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF2547
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF2548
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF2549
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF2550
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF2551
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF2552
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF2553
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF2554
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF2555
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF2556
	.byte	0x5
	.uleb128 0x160
	.4byte	.LASF2557
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF2558
	.byte	0x5
	.uleb128 0x164
	.4byte	.LASF2559
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_cec.h.31.cbead9587d6f5205735191e084956263,comdat
.Ldebug_macro13:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2560
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF2561
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF2562
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF2563
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF2564
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF2565
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF2566
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF2567
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF2568
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF2569
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF2570
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF2571
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF2572
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF2573
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF2574
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF2575
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF2576
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF2577
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF2578
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF2579
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF2580
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF2581
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF2582
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF2583
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF2584
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF2585
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF2586
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF2587
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF2588
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF2589
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF2590
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF2591
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF2592
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF2593
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF2594
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF2595
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF2596
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF2597
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF2598
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF2599
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF2600
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF2601
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF2602
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF2603
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF2604
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF2605
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF2606
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF2607
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF2608
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF2609
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF2610
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF2611
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF2612
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF2613
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF2614
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF2615
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF2616
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF2617
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF2618
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_crc.h.31.48fbd36307d848f32978567b16118557,comdat
.Ldebug_macro14:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2619
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF2620
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF2621
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF2622
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF2623
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF2624
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_comp.h.31.a640b8c7673f3e181cfd826dce70b6e2,comdat
.Ldebug_macro15:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2625
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF2626
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF2627
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF2628
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF2629
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF2630
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF2631
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF2632
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF2633
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF2634
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF2635
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF2636
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF2637
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF2638
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF2639
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF2640
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF2641
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF2642
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF2643
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF2644
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF2645
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF2646
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF2647
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF2648
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF2649
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF2650
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF2651
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF2652
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF2653
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF2654
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF2655
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF2656
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF2657
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF2658
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF2659
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_dac.h.31.3e178ad0888f70df8fbc4c999d855b3e,comdat
.Ldebug_macro16:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2660
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF2661
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF2662
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF2663
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF2664
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF2665
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF2666
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF2667
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF2668
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF2669
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF2670
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF2671
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF2672
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF2673
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF2674
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF2675
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF2676
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF2677
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF2678
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF2679
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF2680
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF2681
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF2682
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_dbgmcu.h.31.282da985c6ed8dd33417cf074ecfdf63,comdat
.Ldebug_macro17:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2683
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF2684
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF2685
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF2686
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF2687
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF2688
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF2689
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF2690
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF2691
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF2692
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF2693
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF2694
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF2695
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF2696
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF2697
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF2698
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF2699
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF2700
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_dma.h.31.68def2497939cb34c3f292e0c507724a,comdat
.Ldebug_macro18:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2701
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF2702
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF2703
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF2704
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF2705
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF2706
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF2707
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF2708
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF2709
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF2710
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF2711
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF2712
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF2713
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF2714
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF2715
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF2716
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF2717
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF2718
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF2719
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF2720
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF2721
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF2722
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF2723
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF2724
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF2725
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF2726
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF2727
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF2728
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF2729
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF2730
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF2731
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF2732
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF2733
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF2734
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF2735
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF2736
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF2737
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF2738
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF2739
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF2740
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF2741
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF2742
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF2743
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF2744
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF2745
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF2746
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF2747
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF2748
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF2749
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF2750
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF2751
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF2752
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF2753
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF2754
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF2755
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF2756
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF2757
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF2758
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF2759
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF2760
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF2761
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF2762
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF2763
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF2764
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF2765
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF2766
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF2767
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF2768
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF2769
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF2770
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF2771
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF2772
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF2773
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF2774
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF2775
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF2776
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF2777
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF2778
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF2779
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_exti.h.31.81a00331ef3e014ed4dafe9e9baacca3,comdat
.Ldebug_macro19:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2780
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF2781
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF2782
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF2783
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF2784
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF2785
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF2786
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF2787
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF2788
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF2789
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF2790
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF2791
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF2792
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF2793
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF2794
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF2795
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF2796
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF2797
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF2798
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF2799
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF2800
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF2801
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF2802
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF2803
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF2804
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF2805
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF2806
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF2807
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF2808
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_flash.h.31.60d92ed32439cfb92572ec2678e2be21,comdat
.Ldebug_macro20:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2809
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF2810
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF2811
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF2812
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF2813
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF2814
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF2815
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF2816
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF2817
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF2818
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF2819
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF2820
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF2821
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF2822
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF2823
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF2824
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF2825
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF2826
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF2827
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF2828
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF2829
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF2830
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF2831
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF2832
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF2833
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF2834
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF2835
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF2836
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF2837
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF2838
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF2839
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF2840
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF2841
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF2842
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF2843
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF2844
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF2845
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF2846
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF2847
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF2848
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF2849
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF2850
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF2851
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF2852
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF2853
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF2854
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF2855
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF2856
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF2857
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF2858
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF2859
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF2860
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF2861
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF2862
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF2863
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_gpio.h.31.df5c3a39b21131ade11d30b7e1580be6,comdat
.Ldebug_macro21:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2864
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF2865
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF2866
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF2867
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF2868
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF2869
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF2870
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF2871
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF2872
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF2873
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF2874
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF2875
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF2876
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF2877
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF2878
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF2879
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF2880
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF2881
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF2882
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF2883
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF2884
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF2885
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF2886
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF2887
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF2888
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF2889
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF2890
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF2891
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF2892
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF2893
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF2894
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF2895
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF2896
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF2897
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF2898
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF2899
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF2900
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF2901
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF2902
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF2903
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF2904
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF2905
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF2906
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF2907
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF2908
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF2909
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF2910
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF2911
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF2912
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF2913
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF2914
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF2915
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF2916
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF2917
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF2918
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF2919
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_syscfg.h.31.f98c72ea26c47fccafefd977b75786d3,comdat
.Ldebug_macro22:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2920
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF2921
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF2922
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF2923
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF2924
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF2925
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF2926
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF2927
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF2928
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF2929
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF2930
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF2931
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF2932
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF2933
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF2934
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF2935
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF2936
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF2937
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF2938
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF2939
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF2940
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF2941
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF2942
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF2943
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF2944
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF2945
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF2946
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF2947
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF2948
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF2949
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF2950
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF2951
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF2952
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF2953
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF2954
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF2955
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF2956
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF2957
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF2958
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF2959
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF2960
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF2961
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF2962
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF2963
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF2964
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_i2c.h.31.83969866ec38bbcc1bff9238f01a1954,comdat
.Ldebug_macro23:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF2965
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF2966
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF2967
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF2968
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF2969
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF2970
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF2971
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF2972
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF2973
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF2974
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF2975
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF2976
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF2977
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF2978
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF2979
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF2980
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF2981
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF2982
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF2983
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF2984
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF2985
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF2986
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF2987
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF2988
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF2989
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF2990
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF2991
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF2992
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF2993
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF2994
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF2995
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF2996
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF2997
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF2998
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF2999
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF3000
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF3001
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF3002
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF3003
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF3004
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF3005
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF3006
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF3007
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF3008
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF3009
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF3010
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF3011
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF3012
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF3013
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF3014
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF3015
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF3016
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF3017
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF3018
	.byte	0x5
	.uleb128 0x11c
	.4byte	.LASF3019
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF3020
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF3021
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF3022
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF3023
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF3024
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF3025
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF3026
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF3027
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF3028
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF3029
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF3030
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF3031
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF3032
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF3033
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF3034
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF3035
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF3036
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF3037
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF3038
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF3039
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF3040
	.byte	0x5
	.uleb128 0x14f
	.4byte	.LASF3041
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF3042
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF3043
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF3044
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF3045
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF3046
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF3047
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF3048
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF3049
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF3050
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF3051
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF3052
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF3053
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF3054
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF3055
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF3056
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF3057
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF3058
	.byte	0x5
	.uleb128 0x181
	.4byte	.LASF3059
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF3060
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF3061
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_iwdg.h.31.bb16f7e18e54df66bf9bd0e2b29bdc93,comdat
.Ldebug_macro24:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3062
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF3063
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF3064
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF3065
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF3066
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF3067
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF3068
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF3069
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF3070
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF3071
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF3072
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF3073
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF3074
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF3075
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF3076
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF3077
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF3078
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF3079
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_pwr.h.31.5b469253a65db741700e0b45f396c99d,comdat
.Ldebug_macro25:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3080
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF3081
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF3082
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF3083
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF3084
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF3085
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF3086
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF3087
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF3088
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF3089
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF3090
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF3091
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF3092
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF3093
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF3094
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF3095
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF3096
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF3097
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF3098
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF3099
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF3100
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF3101
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF3102
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF3103
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF3104
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF3105
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF3106
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF3107
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_rtc.h.31.bc9d631913a743746cf54f04d4efbf7b,comdat
.Ldebug_macro26:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3108
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF3109
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF3110
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF3111
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF3112
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF3113
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF3114
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF3115
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF3116
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF3117
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF3118
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF3119
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF3120
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF3121
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF3122
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF3123
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF3124
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF3125
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF3126
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF3127
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF3128
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF3129
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF3130
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF3131
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF3132
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF3133
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF3134
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF3135
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF3136
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF3137
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF3138
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF3139
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF3140
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF3141
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF3142
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF3143
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF3144
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF3145
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF3146
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF3147
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF3148
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF3149
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF3150
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF3151
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF3152
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF3153
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF3154
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF3155
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF3156
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF3157
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF3158
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF3159
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF3160
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF3161
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF3162
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF3163
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF3164
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF3165
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF3166
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF3167
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF3168
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF3169
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF3170
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF3171
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF3172
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF3173
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF3174
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF3175
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF3176
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF3177
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF3178
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF3179
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF3180
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF3181
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF3182
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF3183
	.byte	0x5
	.uleb128 0x184
	.4byte	.LASF3184
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF3185
	.byte	0x5
	.uleb128 0x18f
	.4byte	.LASF3186
	.byte	0x5
	.uleb128 0x190
	.4byte	.LASF3187
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF3188
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF3189
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF3190
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF3191
	.byte	0x5
	.uleb128 0x1a0
	.4byte	.LASF3192
	.byte	0x5
	.uleb128 0x1ab
	.4byte	.LASF3193
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF3194
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF3195
	.byte	0x5
	.uleb128 0x1ba
	.4byte	.LASF3196
	.byte	0x5
	.uleb128 0x1c3
	.4byte	.LASF3197
	.byte	0x5
	.uleb128 0x1c4
	.4byte	.LASF3198
	.byte	0x5
	.uleb128 0x1c5
	.4byte	.LASF3199
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF3200
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF3201
	.byte	0x5
	.uleb128 0x1ca
	.4byte	.LASF3202
	.byte	0x5
	.uleb128 0x1d3
	.4byte	.LASF3203
	.byte	0x5
	.uleb128 0x1d4
	.4byte	.LASF3204
	.byte	0x5
	.uleb128 0x1d5
	.4byte	.LASF3205
	.byte	0x5
	.uleb128 0x1d6
	.4byte	.LASF3206
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF3207
	.byte	0x5
	.uleb128 0x1e3
	.4byte	.LASF3208
	.byte	0x5
	.uleb128 0x1e5
	.4byte	.LASF3209
	.byte	0x5
	.uleb128 0x1e7
	.4byte	.LASF3210
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF3211
	.byte	0x5
	.uleb128 0x1eb
	.4byte	.LASF3212
	.byte	0x5
	.uleb128 0x1f6
	.4byte	.LASF3213
	.byte	0x5
	.uleb128 0x1f8
	.4byte	.LASF3214
	.byte	0x5
	.uleb128 0x1fa
	.4byte	.LASF3215
	.byte	0x5
	.uleb128 0x1fc
	.4byte	.LASF3216
	.byte	0x5
	.uleb128 0x1fe
	.4byte	.LASF3217
	.byte	0x5
	.uleb128 0x200
	.4byte	.LASF3218
	.byte	0x5
	.uleb128 0x202
	.4byte	.LASF3219
	.byte	0x5
	.uleb128 0x204
	.4byte	.LASF3220
	.byte	0x5
	.uleb128 0x206
	.4byte	.LASF3221
	.byte	0x5
	.uleb128 0x216
	.4byte	.LASF3222
	.byte	0x5
	.uleb128 0x218
	.4byte	.LASF3223
	.byte	0x5
	.uleb128 0x21a
	.4byte	.LASF3224
	.byte	0x5
	.uleb128 0x21c
	.4byte	.LASF3225
	.byte	0x5
	.uleb128 0x21f
	.4byte	.LASF3226
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF3227
	.byte	0x5
	.uleb128 0x22c
	.4byte	.LASF3228
	.byte	0x5
	.uleb128 0x22e
	.4byte	.LASF3229
	.byte	0x5
	.uleb128 0x231
	.4byte	.LASF3230
	.byte	0x5
	.uleb128 0x23a
	.4byte	.LASF3231
	.byte	0x5
	.uleb128 0x23b
	.4byte	.LASF3232
	.byte	0x5
	.uleb128 0x23c
	.4byte	.LASF3233
	.byte	0x5
	.uleb128 0x246
	.4byte	.LASF3234
	.byte	0x5
	.uleb128 0x247
	.4byte	.LASF3235
	.byte	0x5
	.uleb128 0x248
	.4byte	.LASF3236
	.byte	0x5
	.uleb128 0x251
	.4byte	.LASF3237
	.byte	0x5
	.uleb128 0x25b
	.4byte	.LASF3238
	.byte	0x5
	.uleb128 0x25c
	.4byte	.LASF3239
	.byte	0x5
	.uleb128 0x25d
	.4byte	.LASF3240
	.byte	0x5
	.uleb128 0x25e
	.4byte	.LASF3241
	.byte	0x5
	.uleb128 0x25f
	.4byte	.LASF3242
	.byte	0x5
	.uleb128 0x260
	.4byte	.LASF3243
	.byte	0x5
	.uleb128 0x26c
	.4byte	.LASF3244
	.byte	0x5
	.uleb128 0x26d
	.4byte	.LASF3245
	.byte	0x5
	.uleb128 0x26e
	.4byte	.LASF3246
	.byte	0x5
	.uleb128 0x277
	.4byte	.LASF3247
	.byte	0x5
	.uleb128 0x278
	.4byte	.LASF3248
	.byte	0x5
	.uleb128 0x279
	.4byte	.LASF3249
	.byte	0x5
	.uleb128 0x27a
	.4byte	.LASF3250
	.byte	0x5
	.uleb128 0x27b
	.4byte	.LASF3251
	.byte	0x5
	.uleb128 0x27c
	.4byte	.LASF3252
	.byte	0x5
	.uleb128 0x27d
	.4byte	.LASF3253
	.byte	0x5
	.uleb128 0x27e
	.4byte	.LASF3254
	.byte	0x5
	.uleb128 0x27f
	.4byte	.LASF3255
	.byte	0x5
	.uleb128 0x280
	.4byte	.LASF3256
	.byte	0x5
	.uleb128 0x281
	.4byte	.LASF3257
	.byte	0x5
	.uleb128 0x283
	.4byte	.LASF3258
	.byte	0x5
	.uleb128 0x289
	.4byte	.LASF3259
	.byte	0x5
	.uleb128 0x292
	.4byte	.LASF3260
	.byte	0x5
	.uleb128 0x293
	.4byte	.LASF3261
	.byte	0x5
	.uleb128 0x294
	.4byte	.LASF3262
	.byte	0x5
	.uleb128 0x295
	.4byte	.LASF3263
	.byte	0x5
	.uleb128 0x296
	.4byte	.LASF3264
	.byte	0x5
	.uleb128 0x297
	.4byte	.LASF3265
	.byte	0x5
	.uleb128 0x299
	.4byte	.LASF3266
	.byte	0x5
	.uleb128 0x29a
	.4byte	.LASF3267
	.byte	0x5
	.uleb128 0x29d
	.4byte	.LASF3268
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_spi.h.31.5b4d0d36c03feb5b081143cdba79744d,comdat
.Ldebug_macro27:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3269
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF3270
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF3271
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF3272
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF3273
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF3274
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF3275
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF3276
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF3277
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF3278
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF3279
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF3280
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF3281
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF3282
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF3283
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF3284
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF3285
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF3286
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF3287
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF3288
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF3289
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF3290
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF3291
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF3292
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF3293
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF3294
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF3295
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF3296
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF3297
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF3298
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF3299
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF3300
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF3301
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF3302
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF3303
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF3304
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF3305
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF3306
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF3307
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF3308
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF3309
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF3310
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF3311
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF3312
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF3313
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF3314
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF3315
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF3316
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF3317
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF3318
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF3319
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF3320
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF3321
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF3322
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF3323
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF3324
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF3325
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF3326
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF3327
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF3328
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF3329
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF3330
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF3331
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF3332
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF3333
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF3334
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF3335
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF3336
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF3337
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF3338
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF3339
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF3340
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF3341
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF3342
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF3343
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF3344
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF3345
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF3346
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF3347
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF3348
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF3349
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF3350
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF3351
	.byte	0x5
	.uleb128 0x173
	.4byte	.LASF3352
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF3353
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF3354
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF3355
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF3356
	.byte	0x5
	.uleb128 0x189
	.4byte	.LASF3357
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF3358
	.byte	0x5
	.uleb128 0x18b
	.4byte	.LASF3359
	.byte	0x5
	.uleb128 0x18c
	.4byte	.LASF3360
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF3361
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF3362
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF3363
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF3364
	.byte	0x5
	.uleb128 0x1a4
	.4byte	.LASF3365
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF3366
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF3367
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF3368
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF3369
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF3370
	.byte	0x5
	.uleb128 0x1bb
	.4byte	.LASF3371
	.byte	0x5
	.uleb128 0x1bc
	.4byte	.LASF3372
	.byte	0x5
	.uleb128 0x1bd
	.4byte	.LASF3373
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF3374
	.byte	0x5
	.uleb128 0x1c3
	.4byte	.LASF3375
	.byte	0x5
	.uleb128 0x1c4
	.4byte	.LASF3376
	.byte	0x5
	.uleb128 0x1c5
	.4byte	.LASF3377
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF3378
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF3379
	.byte	0x5
	.uleb128 0x1d4
	.4byte	.LASF3380
	.byte	0x5
	.uleb128 0x1d5
	.4byte	.LASF3381
	.byte	0x5
	.uleb128 0x1d6
	.4byte	.LASF3382
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF3383
	.byte	0x5
	.uleb128 0x1e0
	.4byte	.LASF3384
	.byte	0x5
	.uleb128 0x1e1
	.4byte	.LASF3385
	.byte	0x5
	.uleb128 0x1e2
	.4byte	.LASF3386
	.byte	0x5
	.uleb128 0x1e3
	.4byte	.LASF3387
	.byte	0x5
	.uleb128 0x1ee
	.4byte	.LASF3388
	.byte	0x5
	.uleb128 0x1ef
	.4byte	.LASF3389
	.byte	0x5
	.uleb128 0x1f0
	.4byte	.LASF3390
	.byte	0x5
	.uleb128 0x1f1
	.4byte	.LASF3391
	.byte	0x5
	.uleb128 0x1f2
	.4byte	.LASF3392
	.byte	0x5
	.uleb128 0x1f3
	.4byte	.LASF3393
	.byte	0x5
	.uleb128 0x1f4
	.4byte	.LASF3394
	.byte	0x5
	.uleb128 0x1f5
	.4byte	.LASF3395
	.byte	0x5
	.uleb128 0x1f6
	.4byte	.LASF3396
	.byte	0x5
	.uleb128 0x1fa
	.4byte	.LASF3397
	.byte	0x5
	.uleb128 0x1fb
	.4byte	.LASF3398
	.byte	0x5
	.uleb128 0x208
	.4byte	.LASF3399
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_tim.h.31.21b4d7229c685868595d751757b51e1b,comdat
.Ldebug_macro28:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3400
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF3401
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF3402
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF3403
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF3404
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF3405
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF3406
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF3407
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF3408
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF3409
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF3410
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF3411
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF3412
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF3413
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF3414
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF3415
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF3416
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF3417
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF3418
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF3419
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF3420
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF3421
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF3422
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF3423
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF3424
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF3425
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF3426
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF3427
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF3428
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF3429
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF3430
	.byte	0x5
	.uleb128 0x14b
	.4byte	.LASF3431
	.byte	0x5
	.uleb128 0x14c
	.4byte	.LASF3432
	.byte	0x5
	.uleb128 0x14d
	.4byte	.LASF3433
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF3434
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF3435
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF3436
	.byte	0x5
	.uleb128 0x15b
	.4byte	.LASF3437
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF3438
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF3439
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF3440
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF3441
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF3442
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF3443
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF3444
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF3445
	.byte	0x5
	.uleb128 0x179
	.4byte	.LASF3446
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF3447
	.byte	0x5
	.uleb128 0x184
	.4byte	.LASF3448
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF3449
	.byte	0x5
	.uleb128 0x18f
	.4byte	.LASF3450
	.byte	0x5
	.uleb128 0x190
	.4byte	.LASF3451
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF3452
	.byte	0x5
	.uleb128 0x19b
	.4byte	.LASF3453
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF3454
	.byte	0x5
	.uleb128 0x19d
	.4byte	.LASF3455
	.byte	0x5
	.uleb128 0x1a7
	.4byte	.LASF3456
	.byte	0x5
	.uleb128 0x1a8
	.4byte	.LASF3457
	.byte	0x5
	.uleb128 0x1a9
	.4byte	.LASF3458
	.byte	0x5
	.uleb128 0x1b3
	.4byte	.LASF3459
	.byte	0x5
	.uleb128 0x1b4
	.4byte	.LASF3460
	.byte	0x5
	.uleb128 0x1b5
	.4byte	.LASF3461
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF3462
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF3463
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF3464
	.byte	0x5
	.uleb128 0x1cb
	.4byte	.LASF3465
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF3466
	.byte	0x5
	.uleb128 0x1cd
	.4byte	.LASF3467
	.byte	0x5
	.uleb128 0x1d7
	.4byte	.LASF3468
	.byte	0x5
	.uleb128 0x1d8
	.4byte	.LASF3469
	.byte	0x5
	.uleb128 0x1d9
	.4byte	.LASF3470
	.byte	0x5
	.uleb128 0x1da
	.4byte	.LASF3471
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF3472
	.byte	0x5
	.uleb128 0x1e7
	.4byte	.LASF3473
	.byte	0x5
	.uleb128 0x1e8
	.4byte	.LASF3474
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF3475
	.byte	0x5
	.uleb128 0x1f3
	.4byte	.LASF3476
	.byte	0x5
	.uleb128 0x1f4
	.4byte	.LASF3477
	.byte	0x5
	.uleb128 0x1f5
	.4byte	.LASF3478
	.byte	0x5
	.uleb128 0x1ff
	.4byte	.LASF3479
	.byte	0x5
	.uleb128 0x200
	.4byte	.LASF3480
	.byte	0x5
	.uleb128 0x201
	.4byte	.LASF3481
	.byte	0x5
	.uleb128 0x20b
	.4byte	.LASF3482
	.byte	0x5
	.uleb128 0x20c
	.4byte	.LASF3483
	.byte	0x5
	.uleb128 0x20d
	.4byte	.LASF3484
	.byte	0x5
	.uleb128 0x217
	.4byte	.LASF3485
	.byte	0x5
	.uleb128 0x218
	.4byte	.LASF3486
	.byte	0x5
	.uleb128 0x219
	.4byte	.LASF3487
	.byte	0x5
	.uleb128 0x21a
	.4byte	.LASF3488
	.byte	0x5
	.uleb128 0x225
	.4byte	.LASF3489
	.byte	0x5
	.uleb128 0x227
	.4byte	.LASF3490
	.byte	0x5
	.uleb128 0x229
	.4byte	.LASF3491
	.byte	0x5
	.uleb128 0x22a
	.4byte	.LASF3492
	.byte	0x5
	.uleb128 0x235
	.4byte	.LASF3493
	.byte	0x5
	.uleb128 0x236
	.4byte	.LASF3494
	.byte	0x5
	.uleb128 0x237
	.4byte	.LASF3495
	.byte	0x5
	.uleb128 0x238
	.4byte	.LASF3496
	.byte	0x5
	.uleb128 0x239
	.4byte	.LASF3497
	.byte	0x5
	.uleb128 0x245
	.4byte	.LASF3498
	.byte	0x5
	.uleb128 0x246
	.4byte	.LASF3499
	.byte	0x5
	.uleb128 0x247
	.4byte	.LASF3500
	.byte	0x5
	.uleb128 0x248
	.4byte	.LASF3501
	.byte	0x5
	.uleb128 0x249
	.4byte	.LASF3502
	.byte	0x5
	.uleb128 0x24a
	.4byte	.LASF3503
	.byte	0x5
	.uleb128 0x24b
	.4byte	.LASF3504
	.byte	0x5
	.uleb128 0x24c
	.4byte	.LASF3505
	.byte	0x5
	.uleb128 0x24d
	.4byte	.LASF3506
	.byte	0x5
	.uleb128 0x24f
	.4byte	.LASF3507
	.byte	0x5
	.uleb128 0x25f
	.4byte	.LASF3508
	.byte	0x5
	.uleb128 0x260
	.4byte	.LASF3509
	.byte	0x5
	.uleb128 0x261
	.4byte	.LASF3510
	.byte	0x5
	.uleb128 0x262
	.4byte	.LASF3511
	.byte	0x5
	.uleb128 0x263
	.4byte	.LASF3512
	.byte	0x5
	.uleb128 0x264
	.4byte	.LASF3513
	.byte	0x5
	.uleb128 0x265
	.4byte	.LASF3514
	.byte	0x5
	.uleb128 0x266
	.4byte	.LASF3515
	.byte	0x5
	.uleb128 0x267
	.4byte	.LASF3516
	.byte	0x5
	.uleb128 0x268
	.4byte	.LASF3517
	.byte	0x5
	.uleb128 0x269
	.4byte	.LASF3518
	.byte	0x5
	.uleb128 0x26a
	.4byte	.LASF3519
	.byte	0x5
	.uleb128 0x26b
	.4byte	.LASF3520
	.byte	0x5
	.uleb128 0x26c
	.4byte	.LASF3521
	.byte	0x5
	.uleb128 0x26d
	.4byte	.LASF3522
	.byte	0x5
	.uleb128 0x26e
	.4byte	.LASF3523
	.byte	0x5
	.uleb128 0x26f
	.4byte	.LASF3524
	.byte	0x5
	.uleb128 0x270
	.4byte	.LASF3525
	.byte	0x5
	.uleb128 0x271
	.4byte	.LASF3526
	.byte	0x5
	.uleb128 0x272
	.4byte	.LASF3527
	.byte	0x5
	.uleb128 0x273
	.4byte	.LASF3528
	.byte	0x5
	.uleb128 0x290
	.4byte	.LASF3529
	.byte	0x5
	.uleb128 0x291
	.4byte	.LASF3530
	.byte	0x5
	.uleb128 0x292
	.4byte	.LASF3531
	.byte	0x5
	.uleb128 0x293
	.4byte	.LASF3532
	.byte	0x5
	.uleb128 0x294
	.4byte	.LASF3533
	.byte	0x5
	.uleb128 0x295
	.4byte	.LASF3534
	.byte	0x5
	.uleb128 0x296
	.4byte	.LASF3535
	.byte	0x5
	.uleb128 0x297
	.4byte	.LASF3536
	.byte	0x5
	.uleb128 0x298
	.4byte	.LASF3537
	.byte	0x5
	.uleb128 0x299
	.4byte	.LASF3538
	.byte	0x5
	.uleb128 0x29a
	.4byte	.LASF3539
	.byte	0x5
	.uleb128 0x29b
	.4byte	.LASF3540
	.byte	0x5
	.uleb128 0x29c
	.4byte	.LASF3541
	.byte	0x5
	.uleb128 0x29d
	.4byte	.LASF3542
	.byte	0x5
	.uleb128 0x29e
	.4byte	.LASF3543
	.byte	0x5
	.uleb128 0x29f
	.4byte	.LASF3544
	.byte	0x5
	.uleb128 0x2a0
	.4byte	.LASF3545
	.byte	0x5
	.uleb128 0x2a1
	.4byte	.LASF3546
	.byte	0x5
	.uleb128 0x2a2
	.4byte	.LASF3547
	.byte	0x5
	.uleb128 0x2bc
	.4byte	.LASF3548
	.byte	0x5
	.uleb128 0x2bd
	.4byte	.LASF3549
	.byte	0x5
	.uleb128 0x2be
	.4byte	.LASF3550
	.byte	0x5
	.uleb128 0x2bf
	.4byte	.LASF3551
	.byte	0x5
	.uleb128 0x2c0
	.4byte	.LASF3552
	.byte	0x5
	.uleb128 0x2c1
	.4byte	.LASF3553
	.byte	0x5
	.uleb128 0x2c2
	.4byte	.LASF3554
	.byte	0x5
	.uleb128 0x2c3
	.4byte	.LASF3555
	.byte	0x5
	.uleb128 0x2cd
	.4byte	.LASF3556
	.byte	0x5
	.uleb128 0x2ce
	.4byte	.LASF3557
	.byte	0x5
	.uleb128 0x2cf
	.4byte	.LASF3558
	.byte	0x5
	.uleb128 0x2d0
	.4byte	.LASF3559
	.byte	0x5
	.uleb128 0x2d1
	.4byte	.LASF3560
	.byte	0x5
	.uleb128 0x2dd
	.4byte	.LASF3561
	.byte	0x5
	.uleb128 0x2de
	.4byte	.LASF3562
	.byte	0x5
	.uleb128 0x2df
	.4byte	.LASF3563
	.byte	0x5
	.uleb128 0x2e0
	.4byte	.LASF3564
	.byte	0x5
	.uleb128 0x2e1
	.4byte	.LASF3565
	.byte	0x5
	.uleb128 0x2e2
	.4byte	.LASF3566
	.byte	0x5
	.uleb128 0x2e3
	.4byte	.LASF3567
	.byte	0x5
	.uleb128 0x2e4
	.4byte	.LASF3568
	.byte	0x5
	.uleb128 0x2e5
	.4byte	.LASF3569
	.byte	0x5
	.uleb128 0x2ed
	.4byte	.LASF3570
	.byte	0x5
	.uleb128 0x2f9
	.4byte	.LASF3571
	.byte	0x5
	.uleb128 0x2fa
	.4byte	.LASF3572
	.byte	0x5
	.uleb128 0x2fb
	.4byte	.LASF3573
	.byte	0x5
	.uleb128 0x304
	.4byte	.LASF3574
	.byte	0x5
	.uleb128 0x305
	.4byte	.LASF3575
	.byte	0x5
	.uleb128 0x306
	.4byte	.LASF3576
	.byte	0x5
	.uleb128 0x310
	.4byte	.LASF3577
	.byte	0x5
	.uleb128 0x311
	.4byte	.LASF3578
	.byte	0x5
	.uleb128 0x312
	.4byte	.LASF3579
	.byte	0x5
	.uleb128 0x31c
	.4byte	.LASF3580
	.byte	0x5
	.uleb128 0x31d
	.4byte	.LASF3581
	.byte	0x5
	.uleb128 0x31e
	.4byte	.LASF3582
	.byte	0x5
	.uleb128 0x328
	.4byte	.LASF3583
	.byte	0x5
	.uleb128 0x329
	.4byte	.LASF3584
	.byte	0x5
	.uleb128 0x32a
	.4byte	.LASF3585
	.byte	0x5
	.uleb128 0x32b
	.4byte	.LASF3586
	.byte	0x5
	.uleb128 0x337
	.4byte	.LASF3587
	.byte	0x5
	.uleb128 0x338
	.4byte	.LASF3588
	.byte	0x5
	.uleb128 0x339
	.4byte	.LASF3589
	.byte	0x5
	.uleb128 0x33a
	.4byte	.LASF3590
	.byte	0x5
	.uleb128 0x33b
	.4byte	.LASF3591
	.byte	0x5
	.uleb128 0x33c
	.4byte	.LASF3592
	.byte	0x5
	.uleb128 0x33d
	.4byte	.LASF3593
	.byte	0x5
	.uleb128 0x33e
	.4byte	.LASF3594
	.byte	0x5
	.uleb128 0x33f
	.4byte	.LASF3595
	.byte	0x5
	.uleb128 0x349
	.4byte	.LASF3596
	.byte	0x5
	.uleb128 0x34c
	.4byte	.LASF3597
	.byte	0x5
	.uleb128 0x34d
	.4byte	.LASF3598
	.byte	0x5
	.uleb128 0x357
	.4byte	.LASF3599
	.byte	0x5
	.uleb128 0x358
	.4byte	.LASF3600
	.byte	0x5
	.uleb128 0x359
	.4byte	.LASF3601
	.byte	0x5
	.uleb128 0x363
	.4byte	.LASF3602
	.byte	0x5
	.uleb128 0x364
	.4byte	.LASF3603
	.byte	0x5
	.uleb128 0x365
	.4byte	.LASF3604
	.byte	0x5
	.uleb128 0x370
	.4byte	.LASF3605
	.byte	0x5
	.uleb128 0x371
	.4byte	.LASF3606
	.byte	0x5
	.uleb128 0x372
	.4byte	.LASF3607
	.byte	0x5
	.uleb128 0x37c
	.4byte	.LASF3608
	.byte	0x5
	.uleb128 0x37d
	.4byte	.LASF3609
	.byte	0x5
	.uleb128 0x37e
	.4byte	.LASF3610
	.byte	0x5
	.uleb128 0x37f
	.4byte	.LASF3611
	.byte	0x5
	.uleb128 0x380
	.4byte	.LASF3612
	.byte	0x5
	.uleb128 0x381
	.4byte	.LASF3613
	.byte	0x5
	.uleb128 0x382
	.4byte	.LASF3614
	.byte	0x5
	.uleb128 0x383
	.4byte	.LASF3615
	.byte	0x5
	.uleb128 0x384
	.4byte	.LASF3616
	.byte	0x5
	.uleb128 0x394
	.4byte	.LASF3617
	.byte	0x5
	.uleb128 0x395
	.4byte	.LASF3618
	.byte	0x5
	.uleb128 0x396
	.4byte	.LASF3619
	.byte	0x5
	.uleb128 0x397
	.4byte	.LASF3620
	.byte	0x5
	.uleb128 0x398
	.4byte	.LASF3621
	.byte	0x5
	.uleb128 0x3a4
	.4byte	.LASF3622
	.byte	0x5
	.uleb128 0x3a5
	.4byte	.LASF3623
	.byte	0x5
	.uleb128 0x3a6
	.4byte	.LASF3624
	.byte	0x5
	.uleb128 0x3b0
	.4byte	.LASF3625
	.byte	0x5
	.uleb128 0x3b1
	.4byte	.LASF3626
	.byte	0x5
	.uleb128 0x3b2
	.4byte	.LASF3627
	.byte	0x5
	.uleb128 0x3b3
	.4byte	.LASF3628
	.byte	0x5
	.uleb128 0x3b4
	.4byte	.LASF3629
	.byte	0x5
	.uleb128 0x3b5
	.4byte	.LASF3630
	.byte	0x5
	.uleb128 0x3b6
	.4byte	.LASF3631
	.byte	0x5
	.uleb128 0x3b7
	.4byte	.LASF3632
	.byte	0x5
	.uleb128 0x3b8
	.4byte	.LASF3633
	.byte	0x5
	.uleb128 0x3b9
	.4byte	.LASF3634
	.byte	0x5
	.uleb128 0x3ba
	.4byte	.LASF3635
	.byte	0x5
	.uleb128 0x3bb
	.4byte	.LASF3636
	.byte	0x5
	.uleb128 0x3bc
	.4byte	.LASF3637
	.byte	0x5
	.uleb128 0x3ca
	.4byte	.LASF3638
	.byte	0x5
	.uleb128 0x3d4
	.4byte	.LASF3639
	.byte	0x5
	.uleb128 0x3dd
	.4byte	.LASF3640
	.byte	0x5
	.uleb128 0x3e5
	.4byte	.LASF3641
	.byte	0x5
	.uleb128 0x3e6
	.4byte	.LASF3642
	.byte	0x5
	.uleb128 0x3e7
	.4byte	.LASF3643
	.byte	0x5
	.uleb128 0x3f0
	.4byte	.LASF3644
	.byte	0x5
	.uleb128 0x3f1
	.4byte	.LASF3645
	.byte	0x5
	.uleb128 0x3f2
	.4byte	.LASF3646
	.byte	0x5
	.uleb128 0x3f3
	.4byte	.LASF3647
	.byte	0x5
	.uleb128 0x3f5
	.4byte	.LASF3648
	.byte	0x5
	.uleb128 0x401
	.4byte	.LASF3649
	.byte	0x5
	.uleb128 0x402
	.4byte	.LASF3650
	.byte	0x5
	.uleb128 0x403
	.4byte	.LASF3651
	.byte	0x5
	.uleb128 0x404
	.4byte	.LASF3652
	.byte	0x5
	.uleb128 0x405
	.4byte	.LASF3653
	.byte	0x5
	.uleb128 0x406
	.4byte	.LASF3654
	.byte	0x5
	.uleb128 0x407
	.4byte	.LASF3655
	.byte	0x5
	.uleb128 0x408
	.4byte	.LASF3656
	.byte	0x5
	.uleb128 0x409
	.4byte	.LASF3657
	.byte	0x5
	.uleb128 0x40a
	.4byte	.LASF3658
	.byte	0x5
	.uleb128 0x40b
	.4byte	.LASF3659
	.byte	0x5
	.uleb128 0x40c
	.4byte	.LASF3660
	.byte	0x5
	.uleb128 0x40d
	.4byte	.LASF3661
	.byte	0x5
	.uleb128 0x40e
	.4byte	.LASF3662
	.byte	0x5
	.uleb128 0x40f
	.4byte	.LASF3663
	.byte	0x5
	.uleb128 0x410
	.4byte	.LASF3664
	.byte	0x5
	.uleb128 0x411
	.4byte	.LASF3665
	.byte	0x5
	.uleb128 0x412
	.4byte	.LASF3666
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_usart.h.31.8abae79a1c4f266d08faf5996370b48f,comdat
.Ldebug_macro29:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3667
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF3668
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF3669
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF3670
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF3671
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF3672
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF3673
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF3674
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF3675
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF3676
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF3677
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF3678
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF3679
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF3680
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF3681
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF3682
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF3683
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF3684
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF3685
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF3686
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF3687
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF3688
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF3689
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF3690
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF3691
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF3692
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF3693
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF3694
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF3695
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF3696
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF3697
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF3698
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF3699
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF3700
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF3701
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF3702
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF3703
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF3704
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF3705
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF3706
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF3707
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF3708
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF3709
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF3710
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF3711
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF3712
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF3713
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF3714
	.byte	0x5
	.uleb128 0x11f
	.4byte	.LASF3715
	.byte	0x5
	.uleb128 0x120
	.4byte	.LASF3716
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF3717
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF3718
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF3719
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF3720
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF3721
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF3722
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF3723
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF3724
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF3725
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF3726
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF3727
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF3728
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF3729
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF3730
	.byte	0x5
	.uleb128 0x15f
	.4byte	.LASF3731
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF3732
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF3733
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF3734
	.byte	0x5
	.uleb128 0x174
	.4byte	.LASF3735
	.byte	0x5
	.uleb128 0x175
	.4byte	.LASF3736
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF3737
	.byte	0x5
	.uleb128 0x177
	.4byte	.LASF3738
	.byte	0x5
	.uleb128 0x178
	.4byte	.LASF3739
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF3740
	.byte	0x5
	.uleb128 0x186
	.4byte	.LASF3741
	.byte	0x5
	.uleb128 0x187
	.4byte	.LASF3742
	.byte	0x5
	.uleb128 0x188
	.4byte	.LASF3743
	.byte	0x5
	.uleb128 0x189
	.4byte	.LASF3744
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF3745
	.byte	0x5
	.uleb128 0x18b
	.4byte	.LASF3746
	.byte	0x5
	.uleb128 0x18c
	.4byte	.LASF3747
	.byte	0x5
	.uleb128 0x18d
	.4byte	.LASF3748
	.byte	0x5
	.uleb128 0x18e
	.4byte	.LASF3749
	.byte	0x5
	.uleb128 0x18f
	.4byte	.LASF3750
	.byte	0x5
	.uleb128 0x190
	.4byte	.LASF3751
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF3752
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF3753
	.byte	0x5
	.uleb128 0x193
	.4byte	.LASF3754
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF3755
	.byte	0x5
	.uleb128 0x195
	.4byte	.LASF3756
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF3757
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF3758
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF3759
	.byte	0x5
	.uleb128 0x199
	.4byte	.LASF3760
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF3761
	.byte	0x5
	.uleb128 0x19b
	.4byte	.LASF3762
	.byte	0x5
	.uleb128 0x19c
	.4byte	.LASF3763
	.byte	0x5
	.uleb128 0x1a8
	.4byte	.LASF3764
	.byte	0x5
	.uleb128 0x1bc
	.4byte	.LASF3765
	.byte	0x5
	.uleb128 0x1bd
	.4byte	.LASF3766
	.byte	0x5
	.uleb128 0x1be
	.4byte	.LASF3767
	.byte	0x5
	.uleb128 0x1bf
	.4byte	.LASF3768
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF3769
	.byte	0x5
	.uleb128 0x1c1
	.4byte	.LASF3770
	.byte	0x5
	.uleb128 0x1c2
	.4byte	.LASF3771
	.byte	0x5
	.uleb128 0x1c3
	.4byte	.LASF3772
	.byte	0x5
	.uleb128 0x1c4
	.4byte	.LASF3773
	.byte	0x5
	.uleb128 0x1c5
	.4byte	.LASF3774
	.byte	0x5
	.uleb128 0x1c6
	.4byte	.LASF3775
	.byte	0x5
	.uleb128 0x1c7
	.4byte	.LASF3776
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF3777
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF3778
	.byte	0x5
	.uleb128 0x1ca
	.4byte	.LASF3779
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF3780
	.byte	0x5
	.uleb128 0x1d3
	.4byte	.LASF3781
	.byte	0x5
	.uleb128 0x1db
	.4byte	.LASF3782
	.byte	0x5
	.uleb128 0x1e9
	.4byte	.LASF3783
	.byte	0x5
	.uleb128 0x1ea
	.4byte	.LASF3784
	.byte	0x5
	.uleb128 0x1eb
	.4byte	.LASF3785
	.byte	0x5
	.uleb128 0x1ec
	.4byte	.LASF3786
	.byte	0x5
	.uleb128 0x1ed
	.4byte	.LASF3787
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_wwdg.h.31.0cf1a9b3d89d147c688025fdd33d9c49,comdat
.Ldebug_macro30:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3788
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF3789
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF3790
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF3791
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF3792
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF3793
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF3794
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF3795
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_misc.h.31.d5c08c37e69b8a852dbb75e9252454c6,comdat
.Ldebug_macro31:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF3796
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF3797
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF3798
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF3799
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF3800
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF3801
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF3802
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF3803
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF3804
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stm32f0xx_rcc.h.71.f0dc012196db8dce1bacd311f0194ee9,comdat
.Ldebug_macro32:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF3806
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF3807
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF3808
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF3809
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF3810
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF3811
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF3812
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF3813
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF3814
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF3815
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF3816
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF3817
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF3818
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF3819
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF3820
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF3821
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF3822
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF3823
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF3824
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF3825
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF3826
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF3827
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF3828
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF3829
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF3830
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF3831
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF3832
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF3833
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF3834
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF3835
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF3836
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF3837
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF3838
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF3839
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF3840
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF3841
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF3842
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF3843
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF3844
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF3845
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF3846
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF3847
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF3848
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF3849
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF3850
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF3851
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF3852
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF3853
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF3854
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF3855
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF3856
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF3857
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF3858
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF3859
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF3860
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF3861
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF3862
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF3863
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF3864
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF3865
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF3866
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF3867
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF3868
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF3869
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF3870
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF3871
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF3872
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF3873
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF3874
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF3875
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF3876
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF3877
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF3878
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF3879
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF3880
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF3881
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF3882
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF3883
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF3884
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF3885
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF3886
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF3887
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF3888
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF3889
	.byte	0x5
	.uleb128 0x11d
	.4byte	.LASF3890
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF3891
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF3892
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF3893
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF3894
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF3895
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF3896
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF3897
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF3898
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF3899
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF3900
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF3901
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF3902
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF3903
	.byte	0x5
	.uleb128 0x151
	.4byte	.LASF3904
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF3905
	.byte	0x5
	.uleb128 0x153
	.4byte	.LASF3906
	.byte	0x5
	.uleb128 0x154
	.4byte	.LASF3907
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF3908
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF3909
	.byte	0x5
	.uleb128 0x157
	.4byte	.LASF3910
	.byte	0x5
	.uleb128 0x158
	.4byte	.LASF3911
	.byte	0x5
	.uleb128 0x159
	.4byte	.LASF3912
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF3913
	.byte	0x5
	.uleb128 0x15c
	.4byte	.LASF3914
	.byte	0x5
	.uleb128 0x15d
	.4byte	.LASF3915
	.byte	0x5
	.uleb128 0x167
	.4byte	.LASF3916
	.byte	0x5
	.uleb128 0x168
	.4byte	.LASF3917
	.byte	0x5
	.uleb128 0x169
	.4byte	.LASF3918
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF3919
	.byte	0x5
	.uleb128 0x16b
	.4byte	.LASF3920
	.byte	0x5
	.uleb128 0x16c
	.4byte	.LASF3921
	.byte	0x5
	.uleb128 0x16d
	.4byte	.LASF3922
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF3923
	.byte	0x5
	.uleb128 0x16f
	.4byte	.LASF3924
	.byte	0x5
	.uleb128 0x171
	.4byte	.LASF3925
	.byte	0x5
	.uleb128 0x17b
	.4byte	.LASF3926
	.byte	0x5
	.uleb128 0x17c
	.4byte	.LASF3927
	.byte	0x5
	.uleb128 0x17d
	.4byte	.LASF3928
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF3929
	.byte	0x5
	.uleb128 0x17f
	.4byte	.LASF3930
	.byte	0x5
	.uleb128 0x180
	.4byte	.LASF3931
	.byte	0x5
	.uleb128 0x181
	.4byte	.LASF3932
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF3933
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF3934
	.byte	0x5
	.uleb128 0x184
	.4byte	.LASF3935
	.byte	0x5
	.uleb128 0x185
	.4byte	.LASF3936
	.byte	0x5
	.uleb128 0x186
	.4byte	.LASF3937
	.byte	0x5
	.uleb128 0x188
	.4byte	.LASF3938
	.byte	0x5
	.uleb128 0x191
	.4byte	.LASF3939
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF3940
	.byte	0x5
	.uleb128 0x193
	.4byte	.LASF3941
	.byte	0x5
	.uleb128 0x194
	.4byte	.LASF3942
	.byte	0x5
	.uleb128 0x195
	.4byte	.LASF3943
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF3944
	.byte	0x5
	.uleb128 0x197
	.4byte	.LASF3945
	.byte	0x5
	.uleb128 0x198
	.4byte	.LASF3946
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF3947
	.byte	0x5
	.uleb128 0x1a5
	.4byte	.LASF3948
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF3949
	.byte	0x5
	.uleb128 0x1a7
	.4byte	.LASF3950
	.byte	0x5
	.uleb128 0x1a8
	.4byte	.LASF3951
	.byte	0x5
	.uleb128 0x1a9
	.4byte	.LASF3952
	.byte	0x5
	.uleb128 0x1aa
	.4byte	.LASF3953
	.byte	0x5
	.uleb128 0x1ab
	.4byte	.LASF3954
	.byte	0x5
	.uleb128 0x1ac
	.4byte	.LASF3955
	.byte	0x5
	.uleb128 0x1ad
	.4byte	.LASF3956
	.byte	0x5
	.uleb128 0x1ae
	.4byte	.LASF3957
	.byte	0x5
	.uleb128 0x1af
	.4byte	.LASF3958
	.byte	0x5
	.uleb128 0x1b0
	.4byte	.LASF3959
	.byte	0x5
	.uleb128 0x1b1
	.4byte	.LASF3960
	.byte	0x5
	.uleb128 0x1b2
	.4byte	.LASF3961
	.byte	0x5
	.uleb128 0x1b4
	.4byte	.LASF3962
	.byte	0x5
	.uleb128 0x1bc
	.4byte	.LASF3963
	.byte	0x5
	.uleb128 0x1bd
	.4byte	.LASF3964
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.chip.h.29.e57dee7b2bd7a0447607522dceb06312,comdat
.Ldebug_macro33:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF3965
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF3966
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF3967
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF3968
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF3969
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF3970
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF3971
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF3972
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.gpio.h.18.44a98427ac8ac5ebf58ffd07ba0ed309,comdat
.Ldebug_macro34:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF3974
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF3975
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF3976
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.gpio.h.36.5d0801ed2589ed0cd22ce0a63537150c,comdat
.Ldebug_macro35:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF3977
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF3978
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF3979
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF3980
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF3981
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF3982
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF3983
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF3984
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF3985
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF3986
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF3987
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF3988
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF3989
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF3990
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF3991
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF3992
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF3993
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF3994
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF3995
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF3996
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF3997
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF3998
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF3999
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF4000
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF4001
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF4002
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF4003
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF4004
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF4005
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF4006
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF4007
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF4008
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF4009
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF4010
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF4011
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF4012
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF4013
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF4014
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF4015
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF4016
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF4017
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF4018
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF4019
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.board.h.35.a545bf4e373923939f13f03e775ea300,comdat
.Ldebug_macro36:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF4020
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF4021
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF4022
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4023
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF4024
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF4025
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF4026
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF4027
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF4028
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF4029
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF4030
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF4031
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF4032
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF4033
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF4034
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF4035
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF4036
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF4037
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF4038
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF4039
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF4040
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF4041
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF4042
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF4043
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF4044
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF4045
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF4046
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF4047
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF4048
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF4049
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF4050
	.byte	0x5
	.uleb128 0x150
	.4byte	.LASF4051
	.byte	0x5
	.uleb128 0x161
	.4byte	.LASF4052
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF4053
	.byte	0x5
	.uleb128 0x183
	.4byte	.LASF4054
	.byte	0x5
	.uleb128 0x18b
	.4byte	.LASF4055
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF4056
	.byte	0x5
	.uleb128 0x1a7
	.4byte	.LASF4057
	.byte	0x5
	.uleb128 0x1b8
	.4byte	.LASF4058
	.byte	0x5
	.uleb128 0x1c9
	.4byte	.LASF4059
	.byte	0x5
	.uleb128 0x1da
	.4byte	.LASF4060
	.byte	0x5
	.uleb128 0x1e2
	.4byte	.LASF4061
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.timer.h.16.82495a059188152a855e5b8076a80948,comdat
.Ldebug_macro37:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4062
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF4063
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF4064
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF4065
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF4066
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF4067
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF4068
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF4069
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF4070
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.errno.h.16.4b71bb95434a8db6020433e163a6021f,comdat
.Ldebug_macro38:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4072
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF4073
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF4074
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF4075
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4076
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF4077
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF4078
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF4079
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF4080
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF4081
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF4082
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF4083
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF4084
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF4085
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF4086
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF4087
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF4088
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF4089
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF4090
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF4091
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF4092
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF4093
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF4094
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF4095
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF4096
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF4097
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF4098
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF4099
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF4100
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF4101
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF4102
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF4103
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF4104
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF4105
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF4106
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF4107
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF4108
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF4109
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF4110
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF4111
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF4112
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF4113
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF4114
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF4115
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF4116
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF4117
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF4118
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF4119
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF4120
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF4121
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF4122
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF4123
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF4124
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF4125
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF4126
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF4127
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF4128
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF4129
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF4130
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF4131
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF4132
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF4133
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF4134
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF4135
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF4136
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF4137
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF4138
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF4139
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF4140
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF4141
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF4142
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF4143
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF4144
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF4145
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF4146
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF4147
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF4148
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF4149
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF4150
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF4151
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF4152
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF4153
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF4154
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF4155
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF4156
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF4157
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF4158
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF4159
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF4160
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF4161
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF4162
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF4163
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF4164
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF4165
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF4166
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF4167
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF4168
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF4169
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF4170
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF4171
	.byte	0x5
	.uleb128 0xd8
	.4byte	.LASF4172
	.byte	0x5
	.uleb128 0xd9
	.4byte	.LASF4173
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF4174
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF4175
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF4176
	.byte	0x5
	.uleb128 0xdd
	.4byte	.LASF4177
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF4178
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF4179
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF4180
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF4181
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF4182
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF4183
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF4184
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF4185
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF4186
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF4187
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF4188
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF4189
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF4190
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF4191
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF4192
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF4193
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF4194
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF4195
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF4196
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF4197
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF4198
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF4199
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF4200
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF4201
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF4202
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF4203
	.byte	0x5
	.uleb128 0xf9
	.4byte	.LASF4204
	.byte	0x5
	.uleb128 0xfa
	.4byte	.LASF4205
	.byte	0x5
	.uleb128 0xfb
	.4byte	.LASF4206
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF4207
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF4208
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF4209
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF4210
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF4211
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF4212
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF4213
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF4214
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.thread.h.128.a60f737614345b79974682ee776b8b73,comdat
.Ldebug_macro39:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF4215
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF4216
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF4217
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF4218
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF4219
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF4220
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF4221
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF4222
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF4223
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF4224
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF4225
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF4226
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF4227
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF4228
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF4229
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.interrupt.h.16.86c45a4a785f8ae2cdb9896ca0c23431,comdat
.Ldebug_macro40:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4230
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF4231
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF4232
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF4233
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4234
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF4235
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF4236
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF4237
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF4238
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF4239
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF4240
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4241
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF4242
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF4243
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.mutex.h.16.4475f5894e878bbcd9cd723013378b12,comdat
.Ldebug_macro41:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4245
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF4246
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF4247
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF4248
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4249
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF4250
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.cbmath.h.16.dfdd20f34b02c315c8f3c6604015d0f3,comdat
.Ldebug_macro42:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4252
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF4253
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF4254
	.byte	0x5
	.uleb128 0x18
	.4byte	.LASF4255
	.byte	0x5
	.uleb128 0x19
	.4byte	.LASF4256
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF4257
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF4258
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF4259
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF4260
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF4261
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF4262
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF4263
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF4264
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4265
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF4266
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF4267
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF4268
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF4269
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF4270
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF4271
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF4272
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF4273
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF4274
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF4275
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF4276
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF4277
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF4278
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF4279
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF4280
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF4281
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF4282
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF4283
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF4284
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF4285
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF4286
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF4287
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF4288
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF4289
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF4290
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF4291
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF4292
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF4293
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF4294
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF4295
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF4296
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF4297
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF4298
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF4299
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF4300
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF4301
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF4302
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.queue.h.16.9750e3067461798c1c237a495a153bd5,comdat
.Ldebug_macro43:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4306
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF4307
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF4308
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF4309
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF4310
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF4311
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF4312
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.semaphore.h.16.d9fff1f14fafb8e8ac657ad145e62f42,comdat
.Ldebug_macro44:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4314
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4315
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF4316
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF4317
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF4318
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.16.a684a922919ea279530a2545e63f67e2,comdat
.Ldebug_macro45:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4320
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF4321
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF4322
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4323
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF4324
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdio.h.16.b808ac61145d12d1a8811cacb83c67c1,comdat
.Ldebug_macro46:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4327
	.byte	0x5
	.uleb128 0x1a
	.4byte	.LASF4328
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF4329
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF4330
	.byte	0x5
	.uleb128 0x1d
	.4byte	.LASF4331
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF4332
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF4333
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF4334
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF4335
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.string.h.16.d39b72ab8da17ce46050b0232bfaad15,comdat
.Ldebug_macro47:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4336
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF4337
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF4338
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF4339
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF4340
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF4341
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.adc.h.18.3b378a1ec2b7f053374a27faecf0fbbb,comdat
.Ldebug_macro48:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4343
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4344
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF4345
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF4346
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.adc.h.32.0cceb0f5e1c38360aef3fad57b4e0bf2,comdat
.Ldebug_macro49:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4347
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF4348
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF4349
	.byte	0x5
	.uleb128 0x24
	.4byte	.LASF4350
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF4351
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF4352
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4353
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF4354
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF4355
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF4356
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF4357
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF4358
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF4359
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF4360
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF4361
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF4362
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF4363
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF4364
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF4365
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF4366
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF4367
	.byte	0x5
	.uleb128 0x36
	.4byte	.LASF4368
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF4369
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF4370
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF4371
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF4372
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF4373
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF4374
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF4375
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF4376
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF4377
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF4378
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF4379
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.i2c.h.18.1b47493d53264ec134aa98995a4d3832,comdat
.Ldebug_macro50:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4381
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4382
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.i2s.h.18.5d46a03d1e1522b2f2a1827d7b941961,comdat
.Ldebug_macro51:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4385
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF4386
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF4387
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.spi.h.18.aaf08f3dde16a8b44af5ed4d823a17f9,comdat
.Ldebug_macro52:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x12
	.4byte	.LASF4389
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF4390
	.byte	0x5
	.uleb128 0x22
	.4byte	.LASF4391
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.uart.h.16.00a651927f89db5c1b217a4efd1bb154,comdat
.Ldebug_macro53:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x10
	.4byte	.LASF4392
	.byte	0x5
	.uleb128 0x1b
	.4byte	.LASF4393
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF4394
	.byte	0x5
	.uleb128 0x23
	.4byte	.LASF4395
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF4396
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF4397
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF4398
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.caribou.h.57.03a3aa9a9cda9bf3e890b01ad666d4c1,comdat
.Ldebug_macro54:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x39
	.4byte	.LASF4400
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF4401
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF1665:
	.ascii	"RCC_BDCR_RTCSEL_NOCLOCK ((uint32_t)0x00000000)\000"
.LASF2026:
	.ascii	"SYSCFG_EXTICR1_EXTI3 ((uint16_t)0xF000)\000"
.LASF260:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF3366:
	.ascii	"SPI_CRC_Rx ((uint8_t)0x01)\000"
.LASF3615:
	.ascii	"TIM_TRGOSource_OC4Ref ((uint16_t)0x0070)\000"
.LASF1965:
	.ascii	"SPI_CR2_RXNEIE ((uint16_t)0x0040)\000"
.LASF874:
	.ascii	"DBGMCU_APB1_FZ_DBG_TIM6_STOP ((uint32_t)0x00000010)"
	.ascii	"\000"
.LASF1358:
	.ascii	"GPIO_AFRL_AFRL3 ((uint32_t)0x0000F000)\000"
.LASF820:
	.ascii	"COMP_CSR_COMP2OUTSEL_0 ((uint32_t)0x01000000)\000"
.LASF1649:
	.ascii	"RCC_APB1ENR_SPI2EN ((uint32_t)0x00004000)\000"
.LASF1162:
	.ascii	"GPIO_OTYPER_OT_0 ((uint32_t)0x00000001)\000"
.LASF3410:
	.ascii	"IS_TIM_LIST9_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIP"
	.ascii	"H) == TIM6) || ((PERIPH) == TIM15))\000"
.LASF3663:
	.ascii	"TIM_DMABurstLength_15Bytes TIM_DMABurstLength_15Tra"
	.ascii	"nsfers\000"
.LASF3425:
	.ascii	"TIM_Channel_2 ((uint16_t)0x0004)\000"
.LASF2474:
	.ascii	"ADC_ExternalTrigConv_T15_TRGO ADC_CFGR1_EXTSEL_2\000"
.LASF4190:
	.ascii	"ETIMEDOUT 110\000"
.LASF2325:
	.ascii	"USART_CR1_DEDT ((uint32_t)0x001F0000)\000"
.LASF1596:
	.ascii	"RCC_CIR_HSI14RDYIE ((uint32_t)0x00002000)\000"
.LASF1553:
	.ascii	"RCC_CFGR_PLLSRC_HSI_Div2 ((uint32_t)0x00000000)\000"
.LASF4019:
	.ascii	"caribou_gpio_write(gpio,state) {if((state)) caribou"
	.ascii	"_gpio_set(gpio); else caribou_gpio_reset(gpio);}\000"
.LASF2272:
	.ascii	"TIM_CCR2_CCR2 ((uint16_t)0xFFFF)\000"
.LASF1380:
	.ascii	"GPIO_BRR_BR_9 ((uint32_t)0x00000200)\000"
.LASF3055:
	.ascii	"I2C_SoftEnd_Mode ((uint32_t)0x00000000)\000"
.LASF2144:
	.ascii	"TIM_SMCR_ETP ((uint16_t)0x8000)\000"
.LASF1987:
	.ascii	"SPI_SR_FTLVL ((uint16_t)0x1800)\000"
.LASF4052:
	.ascii	"CARIBOU_PORTD_OSPEEDR PIN_OSPEEDR(0,GPIO_Speed_2MHz"
	.ascii	") | PIN_OSPEEDR(1,GPIO_Speed_2MHz) | PIN_OSPEEDR(2,"
	.ascii	"GPIO_Speed_2MHz) | PIN_OSPEEDR(3,GPIO_Speed_2MHz) |"
	.ascii	" PIN_OSPEEDR(4,GPIO_Speed_2MHz) | PIN_OSPEEDR(5,GPI"
	.ascii	"O_Speed_2MHz) | PIN_OSPEEDR(6,GPIO_Speed_2MHz) | PI"
	.ascii	"N_OSPEEDR(7,GPIO_Speed_2MHz) | PIN_OSPEEDR(8,GPIO_S"
	.ascii	"peed_2MHz) | PIN_OSPEEDR(9,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(10,GPIO_Speed_2MHz) | PIN_OSPEEDR(11,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(12,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(13,GPIO_Speed_2MHz) | PIN_OSPEEDR(14,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(15,GPIO_Speed_2MHz)\000"
.LASF55:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF2261:
	.ascii	"TIM_CCER_CC3P ((uint16_t)0x0200)\000"
.LASF2575:
	.ascii	"IS_CEC_STOP_RECEPTION(RECEPTION) (((RECEPTION) == C"
	.ascii	"EC_StopReception_On) || ((RECEPTION) == CEC_StopRec"
	.ascii	"eption_Off))\000"
.LASF150:
	.ascii	"__DBL_MAX__ double(1.1)\000"
.LASF1509:
	.ascii	"RCC_CFGR_SW_0 ((uint32_t)0x00000001)\000"
.LASF2569:
	.ascii	"IS_CEC_SIGNAL_FREE_TIME(TIME) (((TIME) == CEC_Signa"
	.ascii	"lFreeTime_Standard) || ((TIME) == CEC_SignalFreeTim"
	.ascii	"e_1T)|| ((TIME) == CEC_SignalFreeTime_2T)|| ((TIME)"
	.ascii	" == CEC_SignalFreeTime_3T)|| ((TIME) == CEC_SignalF"
	.ascii	"reeTime_4T)|| ((TIME) == CEC_SignalFreeTime_5T)|| ("
	.ascii	"(TIME) == CEC_SignalFreeTime_6T)|| ((TIME) == CEC_S"
	.ascii	"ignalFreeTime_7T))\000"
.LASF1845:
	.ascii	"RTC_ALRMAR_SU_1 ((uint32_t)0x00000002)\000"
.LASF3462:
	.ascii	"TIM_BreakPolarity_Low ((uint16_t)0x0000)\000"
.LASF2877:
	.ascii	"GPIO_Pin_5 ((uint16_t)0x0020)\000"
.LASF3367:
	.ascii	"IS_SPI_CRC(CRC) (((CRC) == SPI_CRC_Tx) || ((CRC) =="
	.ascii	" SPI_CRC_Rx))\000"
.LASF1605:
	.ascii	"RCC_APB2RSTR_ADC1RST ((uint32_t)0x00000200)\000"
.LASF4156:
	.ascii	"ENOTUNIQ 76\000"
.LASF3434:
	.ascii	"IS_TIM_CKD_DIV(DIV) (((DIV) == TIM_CKD_DIV1) || ((D"
	.ascii	"IV) == TIM_CKD_DIV2) || ((DIV) == TIM_CKD_DIV4))\000"
.LASF792:
	.ascii	"COMP_CSR_COMP1SW1 ((uint32_t)0x00000002)\000"
.LASF1717:
	.ascii	"RCC_CR2_HSI14DIS ((uint32_t)0x00000004)\000"
.LASF1855:
	.ascii	"RTC_TSTR_HT_1 ((uint32_t)0x00200000)\000"
.LASF1373:
	.ascii	"GPIO_BRR_BR_2 ((uint32_t)0x00000004)\000"
.LASF134:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF1103:
	.ascii	"FLASH_OBR_BOOT1 FLASH_OBR_nBOOT1\000"
.LASF893:
	.ascii	"DMA_ISR_TCIF3 ((uint32_t)0x00000200)\000"
.LASF3817:
	.ascii	"RCC_PLLMul_6 RCC_CFGR_PLLMULL6\000"
.LASF1834:
	.ascii	"RTC_ALRMAR_MNU_0 ((uint32_t)0x00000100)\000"
.LASF2537:
	.ascii	"IS_ADC_CHANNEL(CHANNEL) (((CHANNEL) != (uint32_t)RE"
	.ascii	"SET) && (((CHANNEL) & 0xFFF80000) == (uint32_t)RESE"
	.ascii	"T))\000"
.LASF648:
	.ascii	"ADC1 ((ADC_TypeDef *) ADC1_BASE)\000"
.LASF3915:
	.ascii	"IS_RCC_AHB_RST_PERIPH(PERIPH) ((((PERIPH) & 0xFEA1F"
	.ascii	"FFF) == 0x00) && ((PERIPH) != 0x00))\000"
.LASF1966:
	.ascii	"SPI_CR2_TXEIE ((uint16_t)0x0080)\000"
.LASF847:
	.ascii	"DAC_DHR12R1_DACC1DHR ((uint32_t)0x00000FFF)\000"
.LASF3180:
	.ascii	"RTC_Output_Disable ((uint32_t)0x00000000)\000"
.LASF4081:
	.ascii	"EPERM 1\000"
.LASF3747:
	.ascii	"USART_FLAG_BUSY USART_ISR_BUSY\000"
.LASF3889:
	.ascii	"IS_RCC_GET_IT(IT) (((IT) == RCC_IT_LSIRDY) || ((IT)"
	.ascii	" == RCC_IT_LSERDY) || ((IT) == RCC_IT_HSIRDY) || (("
	.ascii	"IT) == RCC_IT_HSERDY) || ((IT) == RCC_IT_PLLRDY) ||"
	.ascii	" ((IT) == RCC_IT_HSI14RDY) || ((IT) == RCC_IT_CSS))"
	.ascii	"\000"
.LASF2477:
	.ascii	"ADC_DataAlign_Left ADC_CFGR1_ALIGN\000"
.LASF3181:
	.ascii	"RTC_Output_AlarmA ((uint32_t)0x00200000)\000"
.LASF2204:
	.ascii	"TIM_CCMR1_IC1F_0 ((uint16_t)0x0010)\000"
.LASF1197:
	.ascii	"GPIO_OSPEEDER_OSPEEDR6_0 ((uint32_t)0x00001000)\000"
.LASF254:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF1781:
	.ascii	"RTC_CR_BCK ((uint32_t)0x00040000)\000"
.LASF3379:
	.ascii	"IS_SPI_I2S_GET_IT(IT) (((IT) == SPI_I2S_IT_RXNE) ||"
	.ascii	" ((IT) == SPI_I2S_IT_TXE) || ((IT) == SPI_I2S_IT_OV"
	.ascii	"R) || ((IT) == SPI_IT_MODF) || ((IT) == SPI_I2S_IT_"
	.ascii	"FRE)|| ((IT) == I2S_IT_UDR))\000"
.LASF1369:
	.ascii	"GPIO_AFRH_AFRH6 ((uint32_t)0x0F000000)\000"
.LASF326:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF1194:
	.ascii	"GPIO_OSPEEDER_OSPEEDR5_0 ((uint32_t)0x00000400)\000"
.LASF4245:
	.ascii	"CARIBOUMUTEX_H \000"
.LASF2203:
	.ascii	"TIM_CCMR1_IC1F ((uint16_t)0x00F0)\000"
.LASF2655:
	.ascii	"COMP_Mode_LowPower COMP_CSR_COMP1MODE_1\000"
.LASF3263:
	.ascii	"RTC_IT_TAMP1 ((uint32_t)0x00020000)\000"
.LASF2887:
	.ascii	"GPIO_Pin_15 ((uint16_t)0x8000)\000"
.LASF1650:
	.ascii	"RCC_APB1ENR_USART2EN ((uint32_t)0x00020000)\000"
.LASF1252:
	.ascii	"GPIO_PUPDR_PUPDR8_1 ((uint32_t)0x00020000)\000"
.LASF1259:
	.ascii	"GPIO_PUPDR_PUPDR11 ((uint32_t)0x00C00000)\000"
.LASF3691:
	.ascii	"IS_USART_CLOCK(CLOCK) (((CLOCK) == USART_Clock_Disa"
	.ascii	"ble) || ((CLOCK) == USART_Clock_Enable))\000"
.LASF2226:
	.ascii	"TIM_CCMR2_CC4S ((uint16_t)0x0300)\000"
.LASF2947:
	.ascii	"IS_SYSCFG_MEMORY_REMAP(REMAP) (((REMAP) == SYSCFG_M"
	.ascii	"emoryRemap_Flash) || ((REMAP) == SYSCFG_MemoryRemap"
	.ascii	"_SystemMemory) || ((REMAP) == SYSCFG_MemoryRemap_SR"
	.ascii	"AM))\000"
.LASF1054:
	.ascii	"EXTI_PR_PR4 ((uint32_t)0x00000010)\000"
.LASF1073:
	.ascii	"FLASH_OPTKEYR_OPTKEYR ((uint32_t)0xFFFFFFFF)\000"
.LASF3337:
	.ascii	"I2S_AudioFreq_192k ((uint32_t)192000)\000"
.LASF2672:
	.ascii	"DAC_Channel_1 ((uint32_t)0x00000000)\000"
.LASF3507:
	.ascii	"IS_TIM_GET_IT(IT) (((IT) == TIM_IT_Update) || ((IT)"
	.ascii	" == TIM_IT_CC1) || ((IT) == TIM_IT_CC2) || ((IT) =="
	.ascii	" TIM_IT_CC3) || ((IT) == TIM_IT_CC4) || ((IT) == TI"
	.ascii	"M_IT_COM) || ((IT) == TIM_IT_Trigger) || ((IT) == T"
	.ascii	"IM_IT_Break))\000"
.LASF2215:
	.ascii	"TIM_CCMR1_IC2F_3 ((uint16_t)0x8000)\000"
.LASF3616:
	.ascii	"IS_TIM_TRGO_SOURCE(SOURCE) (((SOURCE) == TIM_TRGOSo"
	.ascii	"urce_Reset) || ((SOURCE) == TIM_TRGOSource_Enable) "
	.ascii	"|| ((SOURCE) == TIM_TRGOSource_Update) || ((SOURCE)"
	.ascii	" == TIM_TRGOSource_OC1) || ((SOURCE) == TIM_TRGOSou"
	.ascii	"rce_OC1Ref) || ((SOURCE) == TIM_TRGOSource_OC2Ref) "
	.ascii	"|| ((SOURCE) == TIM_TRGOSource_OC3Ref) || ((SOURCE)"
	.ascii	" == TIM_TRGOSource_OC4Ref))\000"
.LASF4127:
	.ascii	"EL3RST 47\000"
.LASF3948:
	.ascii	"RCC_FLAG_HSIRDY ((uint8_t)0x01)\000"
.LASF1776:
	.ascii	"RTC_CR_OSEL ((uint32_t)0x00600000)\000"
.LASF636:
	.ascii	"WWDG ((WWDG_TypeDef *) WWDG_BASE)\000"
.LASF1082:
	.ascii	"FLASH_CR_PG ((uint32_t)0x00000001)\000"
.LASF3139:
	.ascii	"RTC_Weekday_Thursday ((uint8_t)0x04)\000"
.LASF3541:
	.ascii	"TIM_DMABurstLength_13Transfers ((uint16_t)0x0C00)\000"
.LASF4058:
	.ascii	"CARIBOU_PORTF_OSPEEDR PIN_OSPEEDR(0,GPIO_Speed_2MHz"
	.ascii	") | PIN_OSPEEDR(1,GPIO_Speed_2MHz) | PIN_OSPEEDR(2,"
	.ascii	"GPIO_Speed_2MHz) | PIN_OSPEEDR(3,GPIO_Speed_2MHz) |"
	.ascii	" PIN_OSPEEDR(4,GPIO_Speed_2MHz) | PIN_OSPEEDR(5,GPI"
	.ascii	"O_Speed_2MHz) | PIN_OSPEEDR(6,GPIO_Speed_2MHz) | PI"
	.ascii	"N_OSPEEDR(7,GPIO_Speed_2MHz) | PIN_OSPEEDR(8,GPIO_S"
	.ascii	"peed_2MHz) | PIN_OSPEEDR(9,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(10,GPIO_Speed_2MHz) | PIN_OSPEEDR(11,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(12,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(13,GPIO_Speed_2MHz) | PIN_OSPEEDR(14,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(15,GPIO_Speed_2MHz)\000"
.LASF3419:
	.ascii	"IS_TIM_OC_MODE(MODE) (((MODE) == TIM_OCMode_Timing)"
	.ascii	" || ((MODE) == TIM_OCMode_Active) || ((MODE) == TIM"
	.ascii	"_OCMode_Inactive) || ((MODE) == TIM_OCMode_Toggle)|"
	.ascii	"| ((MODE) == TIM_OCMode_PWM1) || ((MODE) == TIM_OCM"
	.ascii	"ode_PWM2))\000"
.LASF319:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 1\000"
.LASF1053:
	.ascii	"EXTI_PR_PR3 ((uint32_t)0x00000008)\000"
.LASF1503:
	.ascii	"RCC_CR_HSERDY ((uint32_t)0x00020000)\000"
.LASF491:
	.ascii	"__CM0_CMSIS_VERSION ((__CM0_CMSIS_VERSION_MAIN << 1"
	.ascii	"6) | __CM0_CMSIS_VERSION_SUB)\000"
.LASF1601:
	.ascii	"RCC_CIR_PLLRDYC ((uint32_t)0x00100000)\000"
.LASF2009:
	.ascii	"SPI_I2SPR_ODD ((uint16_t)0x0100)\000"
.LASF2486:
	.ascii	"ADC_AnalogWatchdog_Channel_1 ((uint32_t)0x04000000)"
	.ascii	"\000"
.LASF428:
	.ascii	"WINT_MAX 2147483647L\000"
.LASF2688:
	.ascii	"DBGMCU_TIM3_STOP DBGMCU_APB1_FZ_DBG_TIM3_STOP\000"
.LASF3771:
	.ascii	"USART_IT_TC ((uint32_t)0x00060106)\000"
.LASF57:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF3024:
	.ascii	"I2C_FLAG_ADDR I2C_ISR_ADDR\000"
.LASF3499:
	.ascii	"TIM_IT_CC1 ((uint16_t)0x0002)\000"
.LASF2975:
	.ascii	"IS_I2C_MODE(MODE) (((MODE) == I2C_Mode_I2C) || ((MO"
	.ascii	"DE) == I2C_Mode_SMBusDevice) || ((MODE) == I2C_Mode"
	.ascii	"_SMBusHost))\000"
.LASF3752:
	.ascii	"USART_FLAG_nCTSS USART_ISR_CTS\000"
.LASF3801:
	.ascii	"IS_NVIC_PRIORITY(PRIORITY) ((PRIORITY) < 0x04)\000"
.LASF4167:
	.ascii	"EUSERS 87\000"
.LASF2157:
	.ascii	"TIM_DIER_CC4DE ((uint16_t)0x1000)\000"
.LASF1398:
	.ascii	"I2C_CR1_TXDMAEN ((uint32_t)0x00004000)\000"
.LASF4398:
	.ascii	"CARIBOU_UART_CONFIG_INIT { CARIBOU_UART_BAUD_RATE_9"
	.ascii	"600, CARIBOU_UART_WORDSIZE_8, CARIBOU_UART_STOPBITS"
	.ascii	"_1, CARIBOU_UART_PARITY_NONE, CARIBOU_UART_FLOW_NON"
	.ascii	"E, CARIBOU_UART_DMA_NONE }\000"
.LASF227:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF507:
	.ascii	"SCB_CPUID_ARCHITECTURE_Msk (0xFUL << SCB_CPUID_ARCH"
	.ascii	"ITECTURE_Pos)\000"
.LASF2584:
	.ascii	"IS_CEC_BDR_NO_GEN_ERROR(ERROR) (((ERROR) == CEC_BRD"
	.ascii	"NoGen_Off) || ((ERROR) == CEC_BRDNoGen_On))\000"
.LASF751:
	.ascii	"CEC_CR_CECEN ((uint32_t)0x00000001)\000"
.LASF3126:
	.ascii	"RTC_Month_May ((uint8_t)0x05)\000"
.LASF4441:
	.ascii	"stack_low\000"
.LASF3532:
	.ascii	"TIM_DMABurstLength_4Transfers ((uint16_t)0x0300)\000"
.LASF2518:
	.ascii	"ADC_Channel_3 ADC_CHSELR_CHSEL3\000"
.LASF3034:
	.ascii	"I2C_FLAG_ALERT I2C_ISR_ALERT\000"
.LASF1699:
	.ascii	"RCC_CFGR2_PREDIV1_DIV7 ((uint32_t)0x00000006)\000"
.LASF2001:
	.ascii	"SPI_I2SCFGR_I2SSTD_1 ((uint16_t)0x0020)\000"
.LASF3035:
	.ascii	"I2C_FLAG_BUSY I2C_ISR_BUSY\000"
.LASF4403:
	.ascii	"_CARIBOU_CTHREAD_H_ \000"
.LASF4271:
	.ascii	"MAX_EXP 127\000"
.LASF3190:
	.ascii	"RTC_SmoothCalibPeriod_16sec ((uint32_t)0x00002000)\000"
.LASF4304:
	.ascii	"CARIBOU_HEAP_H \000"
.LASF1401:
	.ascii	"I2C_CR1_NOSTRETCH ((uint32_t)0x00020000)\000"
.LASF3270:
	.ascii	"IS_SPI_ALL_PERIPH(PERIPH) (((PERIPH) == SPI1) || (("
	.ascii	"PERIPH) == SPI2))\000"
.LASF2365:
	.ascii	"USART_CR3_NACK ((uint32_t)0x00000010)\000"
.LASF1937:
	.ascii	"RTC_BKP0R ((uint32_t)0xFFFFFFFF)\000"
.LASF2162:
	.ascii	"TIM_SR_CC2IF ((uint16_t)0x0004)\000"
.LASF3709:
	.ascii	"IS_USART_MUTEMODE_WAKEUP(WAKEUP) (((WAKEUP) == USAR"
	.ascii	"T_WakeUp_IdleLine) || ((WAKEUP) == USART_WakeUp_Add"
	.ascii	"ressMark))\000"
.LASF3775:
	.ascii	"USART_IT_CTS ((uint32_t)0x0009030A)\000"
.LASF856:
	.ascii	"DBGMCU_IDCODE_REV_ID_2 ((uint32_t)0x00040000)\000"
.LASF447:
	.ascii	"__CTYPE_GRAPH (__CTYPE_PUNCT | __CTYPE_UPPER | __CT"
	.ascii	"YPE_LOWER | __CTYPE_DIGIT)\000"
.LASF2644:
	.ascii	"IS_COMP_OUTPUT(OUTPUT) (((OUTPUT) == COMP_Output_No"
	.ascii	"ne) || ((OUTPUT) == COMP_Output_TIM1BKIN) || ((OUTP"
	.ascii	"UT) == COMP_Output_TIM1IC1) || ((OUTPUT) == COMP_Ou"
	.ascii	"tput_TIM1OCREFCLR) || ((OUTPUT) == COMP_Output_TIM2"
	.ascii	"IC4) || ((OUTPUT) == COMP_Output_TIM2OCREFCLR) || ("
	.ascii	"(OUTPUT) == COMP_Output_TIM3IC1) || ((OUTPUT) == CO"
	.ascii	"MP_Output_TIM3OCREFCLR))\000"
.LASF2187:
	.ascii	"TIM_CCMR1_OC1M_1 ((uint16_t)0x0020)\000"
.LASF1723:
	.ascii	"RTC_TR_HT_1 ((uint32_t)0x00200000)\000"
.LASF3175:
	.ascii	"IS_RTC_ALARM_SUB_SECOND_MASK(MASK) (((MASK) == RTC_"
	.ascii	"AlarmSubSecondMask_All) || ((MASK) == RTC_AlarmSubS"
	.ascii	"econdMask_SS14_1) || ((MASK) == RTC_AlarmSubSecondM"
	.ascii	"ask_SS14_2) || ((MASK) == RTC_AlarmSubSecondMask_SS"
	.ascii	"14_3) || ((MASK) == RTC_AlarmSubSecondMask_SS14_4) "
	.ascii	"|| ((MASK) == RTC_AlarmSubSecondMask_SS14_5) || ((M"
	.ascii	"ASK) == RTC_AlarmSubSecondMask_SS14_6) || ((MASK) ="
	.ascii	"= RTC_AlarmSubSecondMask_SS14_7) || ((MASK) == RTC_"
	.ascii	"AlarmSubSecondMask_SS14_8) || ((MASK) == RTC_AlarmS"
	.ascii	"ubSecondMask_SS14_9) || ((MASK) == RTC_AlarmSubSeco"
	.ascii	"ndMask_SS14_10) || ((MASK) == RTC_AlarmSubSecondMas"
	.ascii	"k_SS14_11) || ((MASK) == RTC_AlarmSubSecondMask_SS1"
	.ascii	"4_12) || ((MASK) == RTC_AlarmSubSecondMask_SS14_13)"
	.ascii	" || ((MASK) == RTC_AlarmSubSecondMask_SS14) || ((MA"
	.ascii	"SK) == RTC_AlarmSubSecondMask_None))\000"
.LASF2219:
	.ascii	"TIM_CCMR2_OC3FE ((uint16_t)0x0004)\000"
.LASF1623:
	.ascii	"RCC_APB1RSTR_DACRST ((uint32_t)0x20000000)\000"
.LASF2999:
	.ascii	"IS_I2C_OWN_ADDRESS2_MASK(MASK) (((MASK) == I2C_OA2_"
	.ascii	"NoMask) || ((MASK) == I2C_OA2_Mask01) || ((MASK) =="
	.ascii	" I2C_OA2_Mask02) || ((MASK) == I2C_OA2_Mask03) || ("
	.ascii	"(MASK) == I2C_OA2_Mask04) || ((MASK) == I2C_OA2_Mas"
	.ascii	"k05) || ((MASK) == I2C_OA2_Mask06) || ((MASK) == I2"
	.ascii	"C_OA2_Mask07))\000"
.LASF3511:
	.ascii	"TIM_DMABase_DIER ((uint16_t)0x0003)\000"
.LASF170:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF1973:
	.ascii	"SPI_CR2_LDMARX ((uint16_t)0x2000)\000"
.LASF3504:
	.ascii	"TIM_IT_Trigger ((uint16_t)0x0040)\000"
.LASF176:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF2395:
	.ascii	"USART_RQR_TXFRQ ((uint16_t)0x0010)\000"
.LASF2613:
	.ascii	"CEC_FLAG_BRE CEC_ISR_BRE\000"
.LASF3654:
	.ascii	"TIM_DMABurstLength_6Bytes TIM_DMABurstLength_6Trans"
	.ascii	"fers\000"
.LASF2627:
	.ascii	"COMP_Selection_COMP2 ((uint32_t)0x00000010)\000"
.LASF1207:
	.ascii	"GPIO_OSPEEDER_OSPEEDR9_1 ((uint32_t)0x00080000)\000"
.LASF997:
	.ascii	"EXTI_RTSR_TR4 ((uint32_t)0x00000010)\000"
.LASF1577:
	.ascii	"RCC_CFGR_MCO_HSI14 ((uint32_t)0x01000000)\000"
.LASF160:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF2953:
	.ascii	"IS_SYSCFG_DMA_REMAP(REMAP) (((REMAP) == SYSCFG_DMAR"
	.ascii	"emap_TIM17) || ((REMAP) == SYSCFG_DMARemap_TIM16) |"
	.ascii	"| ((REMAP) == SYSCFG_DMARemap_USART1Rx) || ((REMAP)"
	.ascii	" == SYSCFG_DMARemap_USART1Tx) || ((REMAP) == SYSCFG"
	.ascii	"_DMARemap_ADC1))\000"
.LASF549:
	.ascii	"SCB_CCR_UNALIGN_TRP_Msk (1UL << SCB_CCR_UNALIGN_TRP"
	.ascii	"_Pos)\000"
.LASF1289:
	.ascii	"GPIO_IDR_15 ((uint32_t)0x00008000)\000"
.LASF2235:
	.ascii	"TIM_CCMR2_OC4CE ((uint16_t)0x8000)\000"
.LASF3593:
	.ascii	"TIM_EventSource_Trigger ((uint16_t)0x0040)\000"
.LASF3443:
	.ascii	"IS_TIM_OC_POLARITY(POLARITY) (((POLARITY) == TIM_OC"
	.ascii	"Polarity_High) || ((POLARITY) == TIM_OCPolarity_Low"
	.ascii	"))\000"
.LASF3155:
	.ascii	"IS_RTC_ALARM_MASK(MASK) (((MASK) & 0x7F7F7F7F) == ("
	.ascii	"uint32_t)RESET)\000"
.LASF1740:
	.ascii	"RTC_TR_ST_1 ((uint32_t)0x00000020)\000"
.LASF1281:
	.ascii	"GPIO_IDR_7 ((uint32_t)0x00000080)\000"
.LASF3864:
	.ascii	"RCC_HCLK_Div16 RCC_CFGR_PPRE_DIV16\000"
.LASF3992:
	.ascii	"CARIBOU_GPIO_PIN_14 (1<<14)\000"
.LASF1904:
	.ascii	"RTC_CAL_CALM_2 ((uint32_t)0x00000004)\000"
.LASF593:
	.ascii	"RTC_BASE (APBPERIPH_BASE + 0x00002800)\000"
.LASF809:
	.ascii	"COMP_CSR_COMP1LOCK ((uint32_t)0x00008000)\000"
.LASF3628:
	.ascii	"TIM_FLAG_CC3 ((uint16_t)0x0008)\000"
.LASF3104:
	.ascii	"PWR_FLAG_PVDO PWR_CSR_PVDO\000"
.LASF623:
	.ascii	"OB_BASE ((uint32_t)0x1FFFF800)\000"
.LASF2301:
	.ascii	"TIM_DCR_DBL_1 ((uint16_t)0x0200)\000"
.LASF4484:
	.ascii	"mCaribouThread\000"
.LASF4020:
	.ascii	"PIN_MODE_MASK(n) (0x3<<(n*2))\000"
.LASF1155:
	.ascii	"GPIO_MODER_MODER13_1 ((uint32_t)0x08000000)\000"
.LASF3576:
	.ascii	"IS_TIM_EXT_POLARITY(POLARITY) (((POLARITY) == TIM_E"
	.ascii	"xtTRGPolarity_Inverted) || ((POLARITY) == TIM_ExtTR"
	.ascii	"GPolarity_NonInverted))\000"
.LASF1666:
	.ascii	"RCC_BDCR_RTCSEL_LSE ((uint32_t)0x00000100)\000"
.LASF1739:
	.ascii	"RTC_TR_ST_0 ((uint32_t)0x00000010)\000"
.LASF2497:
	.ascii	"ADC_AnalogWatchdog_Channel_12 ((uint32_t)0x30000000"
	.ascii	")\000"
.LASF2694:
	.ascii	"DBGMCU_I2C1_SMBUS_TIMEOUT DBGMCU_APB1_FZ_DBG_I2C1_S"
	.ascii	"MBUS_TIMEOUT\000"
.LASF2825:
	.ascii	"OB_WRP_Pages28to31 ((uint32_t)0x00000080)\000"
.LASF223:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF2206:
	.ascii	"TIM_CCMR1_IC1F_2 ((uint16_t)0x0040)\000"
.LASF2028:
	.ascii	"SYSCFG_EXTICR1_EXTI0_PB ((uint16_t)0x0001)\000"
.LASF3846:
	.ascii	"RCC_SYSCLKSource_HSI RCC_CFGR_SW_HSI\000"
.LASF3996:
	.ascii	"CARIBOU_GPIO_PIN_18 (1<<18)\000"
.LASF989:
	.ascii	"EXTI_EMR_MR22 ((uint32_t)0x00400000)\000"
.LASF711:
	.ascii	"ADC_CFGR1_EXTSEL_2 ((uint32_t)0x00000100)\000"
.LASF202:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF3515:
	.ascii	"TIM_DMABase_CCMR2 ((uint16_t)0x0007)\000"
.LASF3751:
	.ascii	"USART_FLAG_RTO USART_ISR_RTOF\000"
.LASF2371:
	.ascii	"USART_CR3_CTSIE ((uint32_t)0x00000400)\000"
.LASF2374:
	.ascii	"USART_CR3_DDRE ((uint32_t)0x00002000)\000"
.LASF4340:
	.ascii	"ishex(c) isnum(c) || ( toupper(c)>='A' && toupper(c"
	.ascii	")<='F' )\000"
.LASF3733:
	.ascii	"USART_OVRDetection_Disable USART_CR3_OVRDIS\000"
.LASF4388:
	.ascii	"_CARIBOU_SPI_H_ \000"
.LASF1238:
	.ascii	"GPIO_PUPDR_PUPDR4 ((uint32_t)0x00000300)\000"
.LASF1148:
	.ascii	"GPIO_MODER_MODER11_0 ((uint32_t)0x00400000)\000"
.LASF705:
	.ascii	"ADC_CFGR1_EXTEN ((uint32_t)0x00000C00)\000"
.LASF996:
	.ascii	"EXTI_RTSR_TR3 ((uint32_t)0x00000008)\000"
.LASF4339:
	.ascii	"isnum(c) ( (c)>='0' && (c)<='9' )\000"
.LASF4265:
	.ascii	"ROOT_05 0.70710678118654752440\000"
.LASF523:
	.ascii	"SCB_ICSR_ISRPREEMPT_Msk (1UL << SCB_ICSR_ISRPREEMPT"
	.ascii	"_Pos)\000"
.LASF762:
	.ascii	"CEC_CFGR_LSTN ((uint32_t)0x80000000)\000"
.LASF2567:
	.ascii	"CEC_SignalFreeTime_6T ((uint32_t)0x00000006)\000"
.LASF1367:
	.ascii	"GPIO_AFRH_AFRH4 ((uint32_t)0x000F0000)\000"
.LASF49:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF3758:
	.ascii	"USART_FLAG_IDLE USART_ISR_IDLE\000"
.LASF4446:
	.ascii	"name\000"
.LASF3094:
	.ascii	"PWR_Regulator_LowPower PWR_CR_LPSDSR\000"
.LASF4115:
	.ascii	"EDEADLK 35\000"
.LASF1950:
	.ascii	"SPI_CR1_LSBFIRST ((uint16_t)0x0080)\000"
.LASF867:
	.ascii	"DBGMCU_IDCODE_REV_ID_13 ((uint32_t)0x20000000)\000"
.LASF2944:
	.ascii	"SYSCFG_MemoryRemap_Flash ((uint8_t)0x00)\000"
.LASF1171:
	.ascii	"GPIO_OTYPER_OT_9 ((uint32_t)0x00000200)\000"
.LASF943:
	.ascii	"DMA_CPAR_PA ((uint32_t)0xFFFFFFFF)\000"
.LASF3586:
	.ascii	"IS_TIM_ENCODER_MODE(MODE) (((MODE) == TIM_EncoderMo"
	.ascii	"de_TI1) || ((MODE) == TIM_EncoderMode_TI2) || ((MOD"
	.ascii	"E) == TIM_EncoderMode_TI12))\000"
.LASF2464:
	.ascii	"IS_ADC_RESOLUTION(RESOLUTION) (((RESOLUTION) == ADC"
	.ascii	"_Resolution_12b) || ((RESOLUTION) == ADC_Resolution"
	.ascii	"_10b) || ((RESOLUTION) == ADC_Resolution_8b) || ((R"
	.ascii	"ESOLUTION) == ADC_Resolution_6b))\000"
.LASF3254:
	.ascii	"RTC_FLAG_INITF ((uint32_t)0x00000040)\000"
.LASF4147:
	.ascii	"ENOLINK 67\000"
.LASF776:
	.ascii	"CEC_ISR_TXERR ((uint32_t)0x00000800)\000"
.LASF1847:
	.ascii	"RTC_ALRMAR_SU_3 ((uint32_t)0x00000008)\000"
.LASF2706:
	.ascii	"DMA_PeripheralInc_Disable ((uint32_t)0x00000000)\000"
.LASF3845:
	.ascii	"IS_RCC_PREDIV1(PREDIV1) (((PREDIV1) == RCC_PREDIV1_"
	.ascii	"Div1) || ((PREDIV1) == RCC_PREDIV1_Div2) || ((PREDI"
	.ascii	"V1) == RCC_PREDIV1_Div3) || ((PREDIV1) == RCC_PREDI"
	.ascii	"V1_Div4) || ((PREDIV1) == RCC_PREDIV1_Div5) || ((PR"
	.ascii	"EDIV1) == RCC_PREDIV1_Div6) || ((PREDIV1) == RCC_PR"
	.ascii	"EDIV1_Div7) || ((PREDIV1) == RCC_PREDIV1_Div8) || ("
	.ascii	"(PREDIV1) == RCC_PREDIV1_Div9) || ((PREDIV1) == RCC"
	.ascii	"_PREDIV1_Div10) || ((PREDIV1) == RCC_PREDIV1_Div11)"
	.ascii	" || ((PREDIV1) == RCC_PREDIV1_Div12) || ((PREDIV1) "
	.ascii	"== RCC_PREDIV1_Div13) || ((PREDIV1) == RCC_PREDIV1_"
	.ascii	"Div14) || ((PREDIV1) == RCC_PREDIV1_Div15) || ((PRE"
	.ascii	"DIV1) == RCC_PREDIV1_Div16))\000"
.LASF1241:
	.ascii	"GPIO_PUPDR_PUPDR5 ((uint32_t)0x00000C00)\000"
.LASF2587:
	.ascii	"IS_CEC_SFT_OPTION(OPTION) (((OPTION) == CEC_SFTOpti"
	.ascii	"on_Off) || ((OPTION) == CEC_SFTOption_On))\000"
.LASF3693:
	.ascii	"USART_CPOL_High USART_CR2_CPOL\000"
.LASF4293:
	.ascii	"FP_ARSC 17\000"
.LASF1366:
	.ascii	"GPIO_AFRH_AFRH3 ((uint32_t)0x0000F000)\000"
.LASF2729:
	.ascii	"DMA_M2M_Enable DMA_CCR_MEM2MEM\000"
.LASF3872:
	.ascii	"IS_RCC_CECCLK(CECCLK) (((CECCLK) == RCC_CECCLK_HSI_"
	.ascii	"Div244) || ((CECCLK) == RCC_CECCLK_LSE))\000"
.LASF1816:
	.ascii	"RTC_ALRMAR_DU_2 ((uint32_t)0x04000000)\000"
.LASF1383:
	.ascii	"GPIO_BRR_BR_12 ((uint32_t)0x00001000)\000"
.LASF1164:
	.ascii	"GPIO_OTYPER_OT_2 ((uint32_t)0x00000004)\000"
.LASF688:
	.ascii	"ADC_CR_ADSTP ((uint32_t)0x00000010)\000"
.LASF878:
	.ascii	"DBGMCU_APB1_FZ_DBG_IWDG_STOP ((uint32_t)0x00001000)"
	.ascii	"\000"
.LASF1180:
	.ascii	"GPIO_OSPEEDER_OSPEEDR0_1 ((uint32_t)0x00000002)\000"
.LASF3210:
	.ascii	"RTC_TamperFilter_4Sample ((uint32_t)0x00001000)\000"
.LASF758:
	.ascii	"CEC_CFGR_LREGEN ((uint32_t)0x00000040)\000"
.LASF1093:
	.ascii	"FLASH_AR_FAR ((uint32_t)0xFFFFFFFF)\000"
.LASF3440:
	.ascii	"IS_TIM_COUNTER_MODE(MODE) (((MODE) == TIM_CounterMo"
	.ascii	"de_Up) || ((MODE) == TIM_CounterMode_Down) || ((MOD"
	.ascii	"E) == TIM_CounterMode_CenterAligned1) || ((MODE) =="
	.ascii	" TIM_CounterMode_CenterAligned2) || ((MODE) == TIM_"
	.ascii	"CounterMode_CenterAligned3))\000"
.LASF3998:
	.ascii	"CARIBOU_GPIO_PIN_20 (1<<20)\000"
.LASF286:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF2283:
	.ascii	"TIM_BDTR_DTG_7 ((uint16_t)0x0080)\000"
.LASF3255:
	.ascii	"RTC_FLAG_RSF ((uint32_t)0x00000020)\000"
.LASF3537:
	.ascii	"TIM_DMABurstLength_9Transfers ((uint16_t)0x0800)\000"
.LASF2368:
	.ascii	"USART_CR3_DMAT ((uint32_t)0x00000080)\000"
.LASF783:
	.ascii	"CEC_IER_LBPEIE ((uint32_t)0x00000020)\000"
.LASF1109:
	.ascii	"OB_USER_nUSER ((uint32_t)0xFF000000)\000"
.LASF3516:
	.ascii	"TIM_DMABase_CCER ((uint16_t)0x0008)\000"
.LASF2132:
	.ascii	"TIM_SMCR_TS_1 ((uint16_t)0x0020)\000"
.LASF1078:
	.ascii	"FLASH_SR_BSY ((uint32_t)0x00000001)\000"
.LASF2753:
	.ascii	"DMA1_IT_HT5 DMA_ISR_HTIF5\000"
.LASF1390:
	.ascii	"I2C_CR1_ADDRIE ((uint32_t)0x00000008)\000"
.LASF3787:
	.ascii	"IS_USART_DATA(DATA) ((DATA) <= 0x1FF)\000"
.LASF2925:
	.ascii	"EXTI_PortSourceGPIOF ((uint8_t)0x05)\000"
.LASF1632:
	.ascii	"RCC_AHBENR_GPIODEN ((uint32_t)0x00100000)\000"
.LASF145:
	.ascii	"__DBL_MIN_EXP__ (-125)\000"
.LASF3229:
	.ascii	"RTC_Tamper_3 RTC_TAFCR_TAMP3E\000"
.LASF1686:
	.ascii	"RCC_AHBRSTR_GPIOFRST ((uint32_t)0x00040000)\000"
.LASF3474:
	.ascii	"TIM_OSSIState_Disable ((uint16_t)0x0000)\000"
.LASF1946:
	.ascii	"SPI_CR1_BR_0 ((uint16_t)0x0008)\000"
.LASF2125:
	.ascii	"TIM_SMCR_SMS ((uint16_t)0x0007)\000"
.LASF716:
	.ascii	"ADC_CFGR1_SCANDIR ((uint32_t)0x00000004)\000"
.LASF2932:
	.ascii	"EXTI_PinSource5 ((uint8_t)0x05)\000"
.LASF204:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF4001:
	.ascii	"CARIBOU_GPIO_PIN_23 (1<<23)\000"
.LASF3192:
	.ascii	"IS_RTC_SMOOTH_CALIB_PERIOD(PERIOD) (((PERIOD) == RT"
	.ascii	"C_SmoothCalibPeriod_32sec) || ((PERIOD) == RTC_Smoo"
	.ascii	"thCalibPeriod_16sec) || ((PERIOD) == RTC_SmoothCali"
	.ascii	"bPeriod_8sec))\000"
.LASF2611:
	.ascii	"CEC_FLAG_LBPE CEC_ISR_LBPE\000"
.LASF521:
	.ascii	"SCB_ICSR_PENDSTCLR_Msk (1UL << SCB_ICSR_PENDSTCLR_P"
	.ascii	"os)\000"
.LASF39:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF2601:
	.ascii	"CEC_IT_RXBR CEC_IER_RXBRIE\000"
.LASF1637:
	.ascii	"RCC_APB2ENR_TIM1EN ((uint32_t)0x00000800)\000"
.LASF559:
	.ascii	"SysTick_CTRL_ENABLE_Msk (1UL << SysTick_CTRL_ENABLE"
	.ascii	"_Pos)\000"
.LASF3508:
	.ascii	"TIM_DMABase_CR1 ((uint16_t)0x0000)\000"
.LASF4477:
	.ascii	"__aeabi_ERANGE\000"
.LASF3207:
	.ascii	"IS_RTC_TAMPER_TRIGGER(TRIGGER) (((TRIGGER) == RTC_T"
	.ascii	"amperTrigger_RisingEdge) || ((TRIGGER) == RTC_Tampe"
	.ascii	"rTrigger_FallingEdge) || ((TRIGGER) == RTC_TamperTr"
	.ascii	"igger_LowLevel) || ((TRIGGER) == RTC_TamperTrigger_"
	.ascii	"HighLevel))\000"
.LASF453:
	.ascii	"__RAL_WCHAR_T_DEFINED \000"
.LASF3545:
	.ascii	"TIM_DMABurstLength_17Transfers ((uint16_t)0x1000)\000"
.LASF4318:
	.ascii	"CARIBOU_SEMAPHORE(COUNT,DEPTH,THREADS) {COUNT,CARAB"
	.ascii	"OU_QUEUE_INIT(DEPTH,THREADS)}\000"
.LASF2741:
	.ascii	"DMA1_IT_HT2 DMA_ISR_HTIF2\000"
.LASF148:
	.ascii	"__DBL_MAX_10_EXP__ 38\000"
.LASF2095:
	.ascii	"SYSCFG_CFGR2_SRAM_PARITY_LOCK ((uint32_t)0x00000002"
	.ascii	")\000"
.LASF4197:
	.ascii	"EUCLEAN 117\000"
.LASF1478:
	.ascii	"PWR_CR_PVDE ((uint16_t)0x0010)\000"
.LASF3549:
	.ascii	"TIM_DMA_CC1 ((uint16_t)0x0200)\000"
.LASF2649:
	.ascii	"COMP_Hysteresis_Low COMP_CSR_COMP1HYST_0\000"
.LASF3115:
	.ascii	"IS_RTC_HOUR24(HOUR) ((HOUR) <= 23)\000"
.LASF1883:
	.ascii	"RTC_TSDR_MT ((uint32_t)0x00001000)\000"
.LASF358:
	.ascii	"DEBUG 1\000"
.LASF4042:
	.ascii	"CARIBOU_PORTB_AFRL PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF3042:
	.ascii	"I2C_IT_STOPF I2C_ISR_STOPF\000"
.LASF2038:
	.ascii	"SYSCFG_EXTICR1_EXTI2_PD ((uint16_t)0x0300)\000"
.LASF3671:
	.ascii	"USART_WordLength_9b USART_CR1_M\000"
.LASF2618:
	.ascii	"IS_CEC_GET_FLAG(FLAG) (((FLAG) == CEC_FLAG_TXACKE) "
	.ascii	"|| ((FLAG) == CEC_FLAG_TXERR)|| ((FLAG) == CEC_FLAG"
	.ascii	"_TXUDR)|| ((FLAG) == CEC_FLAG_TXEND)|| ((FLAG) == C"
	.ascii	"EC_FLAG_TXBR)|| ((FLAG) == CEC_FLAG_ARBLST)|| ((FLA"
	.ascii	"G) == CEC_FLAG_RXACKE)|| ((FLAG) == CEC_FLAG_LBPE)|"
	.ascii	"| ((FLAG) == CEC_FLAG_SBPE)|| ((FLAG) == CEC_FLAG_B"
	.ascii	"RE)|| ((FLAG) == CEC_FLAG_RXOVR)|| ((FLAG) == CEC_F"
	.ascii	"LAG_RXEND)|| ((FLAG) == CEC_FLAG_RXBR))\000"
.LASF1394:
	.ascii	"I2C_CR1_ERRIE ((uint32_t)0x00000080)\000"
.LASF2209:
	.ascii	"TIM_CCMR1_IC2PSC_0 ((uint16_t)0x0400)\000"
.LASF780:
	.ascii	"CEC_IER_RXOVRIE ((uint32_t)0x00000004)\000"
.LASF2669:
	.ascii	"DAC_OutputBuffer_Enable ((uint32_t)0x00000000)\000"
.LASF2129:
	.ascii	"TIM_SMCR_OCCS ((uint16_t)0x0008)\000"
.LASF4252:
	.ascii	"_CBMATH_H_ \000"
.LASF2033:
	.ascii	"SYSCFG_EXTICR1_EXTI1_PC ((uint16_t)0x0020)\000"
.LASF2239:
	.ascii	"TIM_CCMR2_IC3F ((uint16_t)0x00F0)\000"
.LASF2796:
	.ascii	"EXTI_Line13 ((uint32_t)0x00002000)\000"
.LASF3433:
	.ascii	"TIM_CKD_DIV4 ((uint16_t)0x0200)\000"
.LASF2750:
	.ascii	"DMA1_IT_TE4 DMA_ISR_TEIF4\000"
.LASF3368:
	.ascii	"SPI_Direction_Rx ((uint16_t)0xBFFF)\000"
.LASF3226:
	.ascii	"IS_RTC_TAMPER_PRECHARGE_DURATION(DURATION) (((DURAT"
	.ascii	"ION) == RTC_TamperPrechargeDuration_1RTCCLK) || ((D"
	.ascii	"URATION) == RTC_TamperPrechargeDuration_2RTCCLK) ||"
	.ascii	" ((DURATION) == RTC_TamperPrechargeDuration_4RTCCLK"
	.ascii	") || ((DURATION) == RTC_TamperPrechargeDuration_8RT"
	.ascii	"CCLK))\000"
.LASF4063:
	.ascii	"CARIBOU_TIMER_F_DYNAMIC 0x01\000"
.LASF3362:
	.ascii	"SPI_NSSInternalSoft_Set SPI_CR1_SSI\000"
.LASF1434:
	.ascii	"I2C_TIMEOUTR_TEXTEN ((uint32_t)0x80000000)\000"
.LASF2631:
	.ascii	"COMP_InvertingInput_3_4VREFINT COMP_CSR_COMP1INSEL_"
	.ascii	"1\000"
.LASF1274:
	.ascii	"GPIO_IDR_0 ((uint32_t)0x00000001)\000"
.LASF591:
	.ascii	"TIM6_BASE (APBPERIPH_BASE + 0x00001000)\000"
.LASF1872:
	.ascii	"RTC_TSTR_ST_1 ((uint32_t)0x00000020)\000"
.LASF1751:
	.ascii	"RTC_DR_YT_3 ((uint32_t)0x00800000)\000"
.LASF4479:
	.ascii	"GNU C++98 5.4.1 20160609 (release) [ARM/embedded-5-"
	.ascii	"branch revision 237715] -fmessage-length=0 -fno-exc"
	.ascii	"eptions -fno-rtti -mtp=soft -mcpu=cortex-m0plus -ml"
	.ascii	"ittle-endian -mfloat-abi=soft -mthumb -fmerge-all-c"
	.ascii	"onstants -g3 -gpubnames -std=gnu++98 -fno-dwarf2-cf"
	.ascii	"i-asm -fno-builtin -ffunction-sections -fdata-secti"
	.ascii	"ons -fshort-double -fshort-enums -fno-common\000"
.LASF695:
	.ascii	"ADC_CFGR1_AWDCH_2 ((uint32_t)0x10000000)\000"
.LASF635:
	.ascii	"RTC ((RTC_TypeDef *) RTC_BASE)\000"
.LASF1701:
	.ascii	"RCC_CFGR2_PREDIV1_DIV9 ((uint32_t)0x00000008)\000"
.LASF2697:
	.ascii	"DBGMCU_TIM15_STOP DBGMCU_APB2_FZ_DBG_TIM15_STOP\000"
.LASF3740:
	.ascii	"IS_USART_REQUEST(REQUEST) (((REQUEST) == USART_Requ"
	.ascii	"est_TXFRQ) || ((REQUEST) == USART_Request_RXFRQ) ||"
	.ascii	" ((REQUEST) == USART_Request_MMRQ) || ((REQUEST) =="
	.ascii	" USART_Request_SBKRQ) || ((REQUEST) == USART_Reques"
	.ascii	"t_ABRRQ))\000"
.LASF2363:
	.ascii	"USART_CR3_IRLP ((uint32_t)0x00000004)\000"
.LASF2268:
	.ascii	"TIM_PSC_PSC ((uint16_t)0xFFFF)\000"
.LASF4096:
	.ascii	"EBUSY 16\000"
.LASF1346:
	.ascii	"GPIO_LCKR_LCK8 ((uint32_t)0x00000100)\000"
.LASF178:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF1547:
	.ascii	"RCC_CFGR_PLLXTPRE ((uint32_t)0x00020000)\000"
.LASF2738:
	.ascii	"DMA1_IT_TE1 DMA_ISR_TEIF1\000"
.LASF2452:
	.ascii	"WWDG_CFR_EWI ((uint16_t)0x0200)\000"
.LASF4418:
	.ascii	"uint32_t\000"
.LASF3256:
	.ascii	"RTC_FLAG_INITS ((uint32_t)0x00000010)\000"
.LASF547:
	.ascii	"SCB_CCR_STKALIGN_Msk (1UL << SCB_CCR_STKALIGN_Pos)\000"
.LASF3438:
	.ascii	"TIM_CounterMode_CenterAligned2 ((uint16_t)0x0040)\000"
.LASF4384:
	.ascii	"_CARIBOU_I2S_H_ \000"
.LASF816:
	.ascii	"COMP_CSR_COMP2INSEL_1 ((uint32_t)0x00200000)\000"
.LASF1988:
	.ascii	"SPI_SR_FTLVL_0 ((uint16_t)0x0800)\000"
.LASF3755:
	.ascii	"USART_FLAG_TXE USART_ISR_TXE\000"
.LASF3209:
	.ascii	"RTC_TamperFilter_2Sample ((uint32_t)0x00000800)\000"
.LASF394:
	.ascii	"UINT_LEAST16_MAX UINT16_MAX\000"
.LASF2936:
	.ascii	"EXTI_PinSource9 ((uint8_t)0x09)\000"
.LASF4131:
	.ascii	"EL2HLT 51\000"
.LASF3243:
	.ascii	"IS_RTC_BKP(BKP) (((BKP) == RTC_BKP_DR0) || ((BKP) ="
	.ascii	"= RTC_BKP_DR1) || ((BKP) == RTC_BKP_DR2) || ((BKP) "
	.ascii	"== RTC_BKP_DR3) || ((BKP) == RTC_BKP_DR4))\000"
.LASF114:
	.ascii	"__INT_FAST8_MAX__ 0x7fffffff\000"
.LASF931:
	.ascii	"DMA_CCR_MINC ((uint32_t)0x00000080)\000"
.LASF3957:
	.ascii	"RCC_FLAG_SFTRST ((uint8_t)0x5C)\000"
.LASF4041:
	.ascii	"CARIBOU_PORTB_PUPDR PIN_PUPDR(0,GPIO_PuPd_NOPULL) |"
	.ascii	" PIN_PUPDR(1,GPIO_PuPd_NOPULL) | PIN_PUPDR(2,GPIO_P"
	.ascii	"uPd_NOPULL) | PIN_PUPDR(3,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(4,GPIO_PuPd_NOPULL) | PIN_PUPDR(5,GPIO_PuPd_NO"
	.ascii	"PULL) | PIN_PUPDR(6,GPIO_PuPd_NOPULL) | PIN_PUPDR(7"
	.ascii	",GPIO_PuPd_NOPULL) | PIN_PUPDR(8,GPIO_PuPd_NOPULL) "
	.ascii	"| PIN_PUPDR(9,GPIO_PuPd_NOPULL) | PIN_PUPDR(10,GPIO"
	.ascii	"_PuPd_NOPULL) | PIN_PUPDR(11,GPIO_PuPd_NOPULL) | PI"
	.ascii	"N_PUPDR(12,GPIO_PuPd_NOPULL) | PIN_PUPDR(13,GPIO_Pu"
	.ascii	"Pd_NOPULL) | PIN_PUPDR(14,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(15,GPIO_PuPd_NOPULL)\000"
.LASF1126:
	.ascii	"GPIO_MODER_MODER4 ((uint32_t)0x00000300)\000"
.LASF3690:
	.ascii	"USART_Clock_Enable USART_CR2_CLKEN\000"
.LASF1134:
	.ascii	"GPIO_MODER_MODER6_1 ((uint32_t)0x00002000)\000"
.LASF217:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF4067:
	.ascii	"TIMEOUT_INFINITE 0\000"
.LASF1754:
	.ascii	"RTC_DR_YU_1 ((uint32_t)0x00020000)\000"
.LASF2066:
	.ascii	"SYSCFG_EXTICR3_EXTI8_PA ((uint16_t)0x0000)\000"
.LASF3929:
	.ascii	"RCC_APB1Periph_TIM14 RCC_APB1ENR_TIM14EN\000"
.LASF2682:
	.ascii	"IS_DAC_FLAG(FLAG) (((FLAG) == DAC_FLAG_DMAUDR))\000"
.LASF2039:
	.ascii	"SYSCFG_EXTICR1_EXTI3_PA ((uint16_t)0x0000)\000"
.LASF3420:
	.ascii	"IS_TIM_OCM(MODE) (((MODE) == TIM_OCMode_Timing) || "
	.ascii	"((MODE) == TIM_OCMode_Active) || ((MODE) == TIM_OCM"
	.ascii	"ode_Inactive) || ((MODE) == TIM_OCMode_Toggle)|| (("
	.ascii	"MODE) == TIM_OCMode_PWM1) || ((MODE) == TIM_OCMode_"
	.ascii	"PWM2) || ((MODE) == TIM_ForcedAction_Active) || ((M"
	.ascii	"ODE) == TIM_ForcedAction_InActive))\000"
.LASF2783:
	.ascii	"EXTI_Line0 ((uint32_t)0x00000001)\000"
.LASF2189:
	.ascii	"TIM_CCMR1_OC1CE ((uint16_t)0x0080)\000"
.LASF569:
	.ascii	"SysTick_CALIB_TENMS_Msk (0xFFFFFFUL << SysTick_VAL_"
	.ascii	"CURRENT_Pos)\000"
.LASF3765:
	.ascii	"USART_IT_WU ((uint32_t)0x00140316)\000"
.LASF3436:
	.ascii	"TIM_CounterMode_Down ((uint16_t)0x0010)\000"
.LASF4187:
	.ascii	"ENOTCONN 107\000"
.LASF4087:
	.ascii	"E2BIG 7\000"
.LASF2700:
	.ascii	"IS_DBGMCU_APB2PERIPH(PERIPH) ((((PERIPH) & 0xFFF8F7"
	.ascii	"FF) == 0x00) && ((PERIPH) != 0x00))\000"
.LASF1337:
	.ascii	"GPIO_BSRR_BR_15 ((uint32_t)0x80000000)\000"
.LASF4011:
	.ascii	"caribou_gpio_set_input(gpio) chip_gpio_set_input((g"
	.ascii	"pio)->port,(gpio)->pinmask)\000"
.LASF321:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 1\000"
.LASF774:
	.ascii	"CEC_ISR_TXEND ((uint32_t)0x00000200)\000"
.LASF2813:
	.ascii	"FLASH_IT_EOP FLASH_CR_EOPIE\000"
.LASF2135:
	.ascii	"TIM_SMCR_ETF ((uint16_t)0x0F00)\000"
.LASF4239:
	.ascii	"caribou_vector_disable(vector) chip_vector_disable("
	.ascii	"vector)\000"
.LASF1863:
	.ascii	"RTC_TSTR_MNT_1 ((uint32_t)0x00002000)\000"
.LASF3447:
	.ascii	"TIM_OutputState_Disable ((uint16_t)0x0000)\000"
.LASF2445:
	.ascii	"WWDG_CFR_W3 ((uint16_t)0x0008)\000"
.LASF1364:
	.ascii	"GPIO_AFRH_AFRH1 ((uint32_t)0x000000F0)\000"
.LASF1591:
	.ascii	"RCC_CIR_LSIRDYIE ((uint32_t)0x00000100)\000"
.LASF1287:
	.ascii	"GPIO_IDR_13 ((uint32_t)0x00002000)\000"
.LASF2480:
	.ascii	"ADC_ScanDirection_Backward ADC_CFGR1_SCANDIR\000"
.LASF205:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF3292:
	.ascii	"SPI_DataSize_16b ((uint16_t)0x0F00)\000"
.LASF2016:
	.ascii	"SYSCFG_CFGR1_USART1RX_DMA_RMP ((uint32_t)0x00000400"
	.ascii	")\000"
.LASF1065:
	.ascii	"EXTI_PR_PR15 ((uint32_t)0x00008000)\000"
.LASF1496:
	.ascii	"PWR_CSR_EWUP1 ((uint16_t)0x0100)\000"
.LASF1233:
	.ascii	"GPIO_PUPDR_PUPDR2_0 ((uint32_t)0x00000010)\000"
.LASF3458:
	.ascii	"IS_TIM_CCXN(CCXN) (((CCXN) == TIM_CCxN_Enable) || ("
	.ascii	"(CCXN) == TIM_CCxN_Disable))\000"
.LASF3102:
	.ascii	"PWR_FLAG_WU PWR_CSR_WUF\000"
.LASF3378:
	.ascii	"SPI_I2S_IT_FRE ((uint8_t)0x58)\000"
.LASF592:
	.ascii	"TIM14_BASE (APBPERIPH_BASE + 0x00002000)\000"
.LASF298:
	.ascii	"__TA_FBIT__ 63\000"
.LASF1516:
	.ascii	"RCC_CFGR_SWS_1 ((uint32_t)0x00000008)\000"
.LASF261:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF4485:
	.ascii	"init\000"
.LASF2724:
	.ascii	"DMA_Priority_High DMA_CCR_PL_1\000"
.LASF4249:
	.ascii	"CARIBOU_MUTEX_DECL_F(x,F) caribou_mutex_t x={NULL,0"
	.ascii	",F,0}\000"
.LASF3873:
	.ascii	"RCC_I2C1CLK_HSI ((uint32_t)0x00000000)\000"
.LASF952:
	.ascii	"EXTI_IMR_MR7 ((uint32_t)0x00000080)\000"
.LASF2086:
	.ascii	"SYSCFG_EXTICR4_EXTI13_PB ((uint16_t)0x0010)\000"
.LASF3841:
	.ascii	"RCC_PREDIV1_Div13 RCC_CFGR2_PREDIV1_DIV13\000"
.LASF4330:
	.ascii	"STDIO_STATE_OPENED 0x00000004\000"
.LASF2324:
	.ascii	"USART_CR1_OVER8 ((uint32_t)0x00008000)\000"
.LASF610:
	.ascii	"USART1_BASE (APBPERIPH_BASE + 0x00013800)\000"
.LASF2190:
	.ascii	"TIM_CCMR1_CC2S ((uint16_t)0x0300)\000"
.LASF3107:
	.ascii	"IS_PWR_CLEAR_FLAG(FLAG) (((FLAG) == PWR_FLAG_WU) ||"
	.ascii	" ((FLAG) == PWR_FLAG_SB))\000"
.LASF421:
	.ascii	"INT64_C(x) (x ##LL)\000"
.LASF4407:
	.ascii	"_CARIBOU_CTIMEREVENT_H_ \000"
.LASF3813:
	.ascii	"RCC_PLLMul_2 RCC_CFGR_PLLMULL2\000"
.LASF863:
	.ascii	"DBGMCU_IDCODE_REV_ID_9 ((uint32_t)0x02000000)\000"
.LASF187:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF2884:
	.ascii	"GPIO_Pin_12 ((uint16_t)0x1000)\000"
.LASF2853:
	.ascii	"IS_OB_VDDA_ANALOG(ANALOG) (((ANALOG) == OB_VDDA_ANA"
	.ascii	"LOG_ON) || ((ANALOG) == OB_VDDA_ANALOG_OFF))\000"
.LASF1916:
	.ascii	"RTC_TAFCR_TAMPFLT ((uint32_t)0x00001800)\000"
.LASF1545:
	.ascii	"RCC_CFGR_ADCPRE_DIV4 ((uint32_t)0x00004000)\000"
.LASF4200:
	.ascii	"EISNAM 120\000"
.LASF4342:
	.ascii	"_CARIBOU_ADC_H_ \000"
.LASF2377:
	.ascii	"USART_CR3_SCARCNT ((uint32_t)0x000E0000)\000"
.LASF2939:
	.ascii	"EXTI_PinSource12 ((uint8_t)0x0C)\000"
.LASF3719:
	.ascii	"IS_USART_LIN_BREAK_DETECT_LENGTH(LENGTH) (((LENGTH)"
	.ascii	" == USART_LINBreakDetectLength_10b) || ((LENGTH) =="
	.ascii	" USART_LINBreakDetectLength_11b))\000"
.LASF1105:
	.ascii	"FLASH_WRPR_WRP ((uint32_t)0x0000FFFF)\000"
.LASF1737:
	.ascii	"RTC_TR_MNU_3 ((uint32_t)0x00000800)\000"
.LASF3997:
	.ascii	"CARIBOU_GPIO_PIN_19 (1<<19)\000"
.LASF3336:
	.ascii	"IS_I2S_MCLK_OUTPUT(OUTPUT) (((OUTPUT) == I2S_MCLKOu"
	.ascii	"tput_Enable) || ((OUTPUT) == I2S_MCLKOutput_Disable"
	.ascii	"))\000"
.LASF472:
	.ascii	"HSE_VALUE ((uint32_t)8000000)\000"
.LASF2149:
	.ascii	"TIM_DIER_CC4IE ((uint16_t)0x0010)\000"
.LASF1974:
	.ascii	"SPI_CR2_LDMATX ((uint16_t)0x4000)\000"
.LASF2491:
	.ascii	"ADC_AnalogWatchdog_Channel_6 ((uint32_t)0x18000000)"
	.ascii	"\000"
.LASF726:
	.ascii	"ADC_HTR_HT ((uint32_t)0x00000FFF)\000"
.LASF1917:
	.ascii	"RTC_TAFCR_TAMPFLT_0 ((uint32_t)0x00000800)\000"
.LASF3949:
	.ascii	"RCC_FLAG_HSERDY ((uint8_t)0x11)\000"
.LASF465:
	.ascii	"caribou_lib_unlock() chip_interrupts_enable()\000"
.LASF2123:
	.ascii	"TIM_CR2_OIS3N ((uint16_t)0x2000)\000"
.LASF4307:
	.ascii	"CARIBOU_QUEUE(DEPTH,MSGS) {DEPTH,0,MSGS}\000"
.LASF3144:
	.ascii	"IS_RTC_ALARM_DATE_WEEKDAY_DATE(DATE) (((DATE) > 0) "
	.ascii	"&& ((DATE) <= 31))\000"
.LASF1681:
	.ascii	"RCC_CSR_LPWRRSTF ((uint32_t)0x80000000)\000"
.LASF2160:
	.ascii	"TIM_SR_UIF ((uint16_t)0x0001)\000"
.LASF4436:
	.ascii	"errno_t\000"
.LASF3588:
	.ascii	"TIM_EventSource_CC1 ((uint16_t)0x0002)\000"
.LASF732:
	.ascii	"ADC_CHSELR_CHSEL14 ((uint32_t)0x00004000)\000"
.LASF2386:
	.ascii	"USART_BRR_DIV_MANTISSA ((uint16_t)0xFFF0)\000"
.LASF2668:
	.ascii	"IS_DAC_TRIGGER(TRIGGER) (((TRIGGER) == DAC_Trigger_"
	.ascii	"None) || ((TRIGGER) == DAC_Trigger_T6_TRGO) || ((TR"
	.ascii	"IGGER) == DAC_Trigger_T3_TRGO) || ((TRIGGER) == DAC"
	.ascii	"_Trigger_T15_TRGO) || ((TRIGGER) == DAC_Trigger_T2_"
	.ascii	"TRGO) || ((TRIGGER) == DAC_Trigger_Ext_IT9) || ((TR"
	.ascii	"IGGER) == DAC_Trigger_Software))\000"
.LASF1549:
	.ascii	"RCC_CFGR_PLLMULL_0 ((uint32_t)0x00040000)\000"
.LASF998:
	.ascii	"EXTI_RTSR_TR5 ((uint32_t)0x00000020)\000"
.LASF4409:
	.ascii	"CARIBOU_NEW_SIZE_T size_t\000"
.LASF153:
	.ascii	"__DBL_DENORM_MIN__ double(1.1)\000"
.LASF1227:
	.ascii	"GPIO_PUPDR_PUPDR0_0 ((uint32_t)0x00000001)\000"
.LASF1512:
	.ascii	"RCC_CFGR_SW_HSE ((uint32_t)0x00000001)\000"
.LASF2871:
	.ascii	"IS_GPIO_BIT_ACTION(ACTION) (((ACTION) == Bit_RESET)"
	.ascii	" || ((ACTION) == Bit_SET))\000"
.LASF3697:
	.ascii	"IS_USART_CPHA(CPHA) (((CPHA) == USART_CPHA_1Edge) |"
	.ascii	"| ((CPHA) == USART_CPHA_2Edge))\000"
.LASF3985:
	.ascii	"CARIBOU_GPIO_PIN_7 (1<<7)\000"
.LASF1291:
	.ascii	"GPIO_ODR_1 ((uint32_t)0x00000002)\000"
.LASF927:
	.ascii	"DMA_CCR_TEIE ((uint32_t)0x00000008)\000"
.LASF4285:
	.ascii	"FP_NESQ 9\000"
.LASF2072:
	.ascii	"SYSCFG_EXTICR3_EXTI10_PA ((uint16_t)0x0000)\000"
.LASF206:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF2793:
	.ascii	"EXTI_Line10 ((uint32_t)0x00000400)\000"
.LASF1084:
	.ascii	"FLASH_CR_MER ((uint32_t)0x00000004)\000"
.LASF987:
	.ascii	"EXTI_EMR_MR19 ((uint32_t)0x00080000)\000"
.LASF846:
	.ascii	"DAC_SWTRIGR_SWTRIG1 ((uint32_t)0x00000001)\000"
.LASF717:
	.ascii	"ADC_CFGR1_DMACFG ((uint32_t)0x00000002)\000"
.LASF3569:
	.ascii	"IS_TIM_TRIGGER_SELECTION(SELECTION) (((SELECTION) ="
	.ascii	"= TIM_TS_ITR0) || ((SELECTION) == TIM_TS_ITR1) || ("
	.ascii	"(SELECTION) == TIM_TS_ITR2) || ((SELECTION) == TIM_"
	.ascii	"TS_ITR3) || ((SELECTION) == TIM_TS_TI1F_ED) || ((SE"
	.ascii	"LECTION) == TIM_TS_TI1FP1) || ((SELECTION) == TIM_T"
	.ascii	"S_TI2FP2) || ((SELECTION) == TIM_TS_ETRF))\000"
.LASF121:
	.ascii	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF2315:
	.ascii	"USART_CR1_TCIE ((uint32_t)0x00000040)\000"
.LASF1600:
	.ascii	"RCC_CIR_HSERDYC ((uint32_t)0x00080000)\000"
.LASF3274:
	.ascii	"SPI_Direction_1Line_Rx ((uint16_t)0x8000)\000"
.LASF3331:
	.ascii	"I2S_DataFormat_24b ((uint16_t)0x0003)\000"
.LASF2117:
	.ascii	"TIM_CR2_TI1S ((uint16_t)0x0080)\000"
.LASF1763:
	.ascii	"RTC_DR_MU_0 ((uint32_t)0x00000100)\000"
.LASF3325:
	.ascii	"I2S_Standard_LSB ((uint16_t)0x0020)\000"
.LASF3852:
	.ascii	"RCC_SYSCLK_Div4 RCC_CFGR_HPRE_DIV4\000"
.LASF2459:
	.ascii	"IS_ADC_JITTEROFF(JITTEROFF) (((JITTEROFF) & 0x3FFFF"
	.ascii	"FFF) == (uint32_t)RESET)\000"
.LASF4189:
	.ascii	"ETOOMANYREFS 109\000"
.LASF3158:
	.ascii	"IS_RTC_CMD_ALARM(ALARM) (((ALARM) & (RTC_Alarm_A)) "
	.ascii	"!= (uint32_t)RESET)\000"
.LASF3467:
	.ascii	"IS_TIM_AUTOMATIC_OUTPUT_STATE(STATE) (((STATE) == T"
	.ascii	"IM_AutomaticOutput_Enable) || ((STATE) == TIM_Autom"
	.ascii	"aticOutput_Disable))\000"
.LASF467:
	.ascii	"ASSERT(x) \000"
.LASF2909:
	.ascii	"GPIO_AF_1 ((uint8_t)0x01)\000"
.LASF190:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF385:
	.ascii	"INT_LEAST8_MIN INT8_MIN\000"
.LASF45:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF3514:
	.ascii	"TIM_DMABase_CCMR1 ((uint16_t)0x0006)\000"
.LASF4004:
	.ascii	"CARIBOU_GPIO_PIN_26 (1<<26)\000"
.LASF3187:
	.ascii	"RTC_CalibOutput_1Hz ((uint32_t)0x00080000)\000"
.LASF131:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF76:
	.ascii	"__LONG_MAX__ 0x7fffffffL\000"
.LASF3548:
	.ascii	"TIM_DMA_Update ((uint16_t)0x0100)\000"
.LASF869:
	.ascii	"DBGMCU_IDCODE_REV_ID_15 ((uint32_t)0x80000000)\000"
.LASF682:
	.ascii	"ADC_IER_EOSEQIE ((uint32_t)0x00000008)\000"
.LASF1770:
	.ascii	"RTC_DR_DU ((uint32_t)0x0000000F)\000"
.LASF1707:
	.ascii	"RCC_CFGR2_PREDIV1_DIV15 ((uint32_t)0x0000000E)\000"
.LASF3185:
	.ascii	"IS_RTC_OUTPUT_POL(POL) (((POL) == RTC_OutputPolarit"
	.ascii	"y_High) || ((POL) == RTC_OutputPolarity_Low))\000"
.LASF4468:
	.ascii	"_ZnwjPv\000"
.LASF2881:
	.ascii	"GPIO_Pin_9 ((uint16_t)0x0200)\000"
.LASF323:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF446:
	.ascii	"__CTYPE_ALNUM (__CTYPE_UPPER | __CTYPE_LOWER | __CT"
	.ascii	"YPE_DIGIT)\000"
.LASF740:
	.ascii	"ADC_CHSELR_CHSEL6 ((uint32_t)0x00000040)\000"
.LASF2761:
	.ascii	"DMA1_FLAG_GL2 DMA_ISR_GIF2\000"
.LASF64:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF1410:
	.ascii	"I2C_CR2_ADD10 ((uint32_t)0x00000800)\000"
.LASF4286:
	.ascii	"FP_LEXP 10\000"
.LASF4328:
	.ascii	"STDIO_STATE_RX_PENDING 0x00000001\000"
.LASF4177:
	.ascii	"EAFNOSUPPORT 97\000"
.LASF4466:
	.ascii	"_Znwj\000"
.LASF1270:
	.ascii	"GPIO_PUPDR_PUPDR14_1 ((uint32_t)0x20000000)\000"
.LASF2916:
	.ascii	"IS_GPIO_AF(AF) (((AF) == GPIO_AF_0) || ((AF) == GPI"
	.ascii	"O_AF_1) || ((AF) == GPIO_AF_2) || ((AF) == GPIO_AF_"
	.ascii	"3) || ((AF) == GPIO_AF_4) || ((AF) == GPIO_AF_5) ||"
	.ascii	" ((AF) == GPIO_AF_6) || ((AF) == GPIO_AF_7))\000"
.LASF2458:
	.ascii	"ADC_JitterOff_PCLKDiv4 ADC_CFGR2_JITOFFDIV4\000"
.LASF3196:
	.ascii	"IS_RTC_SMOOTH_CALIB_MINUS(VALUE) ((VALUE) <= 0x0000"
	.ascii	"01FF)\000"
.LASF1283:
	.ascii	"GPIO_IDR_9 ((uint32_t)0x00000200)\000"
.LASF2634:
	.ascii	"COMP_InvertingInput_IO ((uint32_t)0x00000060)\000"
.LASF3882:
	.ascii	"RCC_IT_LSERDY ((uint8_t)0x02)\000"
.LASF2502:
	.ascii	"ADC_AnalogWatchdog_Channel_17 ((uint32_t)0x44000000"
	.ascii	")\000"
.LASF495:
	.ascii	"__FPU_USED 0\000"
.LASF2734:
	.ascii	"IS_DMA_CONFIG_IT(IT) ((((IT) & 0xFFFFFFF1) == 0x00)"
	.ascii	" && ((IT) != 0x00))\000"
.LASF1782:
	.ascii	"RTC_CR_SUB1H ((uint32_t)0x00020000)\000"
.LASF1416:
	.ascii	"I2C_CR2_RELOAD ((uint32_t)0x01000000)\000"
.LASF2055:
	.ascii	"SYSCFG_EXTICR2_EXTI6_PB ((uint16_t)0x0100)\000"
.LASF3489:
	.ascii	"TIM_ICSelection_DirectTI ((uint16_t)0x0001)\000"
.LASF1985:
	.ascii	"SPI_SR_FRLVL_0 ((uint16_t)0x0200)\000"
.LASF3448:
	.ascii	"TIM_OutputState_Enable ((uint16_t)0x0001)\000"
.LASF1539:
	.ascii	"RCC_CFGR_PPRE_DIV2 ((uint32_t)0x00000400)\000"
.LASF1276:
	.ascii	"GPIO_IDR_2 ((uint32_t)0x00000004)\000"
.LASF330:
	.ascii	"__ARM_SIZEOF_WCHAR_T 4\000"
.LASF2973:
	.ascii	"I2C_Mode_SMBusDevice I2C_CR1_SMBDEN\000"
.LASF4139:
	.ascii	"EBFONT 59\000"
.LASF2539:
	.ascii	"ADC_IT_EOSMP ADC_IER_EOSMPIE\000"
.LASF1470:
	.ascii	"IWDG_SR_PVU ((uint8_t)0x01)\000"
.LASF2770:
	.ascii	"DMA1_FLAG_TC4 DMA_ISR_TCIF4\000"
.LASF1187:
	.ascii	"GPIO_OSPEEDER_OSPEEDR3 ((uint32_t)0x000000C0)\000"
.LASF1284:
	.ascii	"GPIO_IDR_10 ((uint32_t)0x00000400)\000"
.LASF706:
	.ascii	"ADC_CFGR1_EXTEN_0 ((uint32_t)0x00000400)\000"
.LASF4066:
	.ascii	"to_ms(ticks) (ticks*JIFFIES)\000"
.LASF3084:
	.ascii	"PWR_PVDLevel_3 PWR_CR_PLS_LEV3\000"
.LASF1469:
	.ascii	"IWDG_RLR_RL ((uint16_t)0x0FFF)\000"
.LASF3802:
	.ascii	"SysTick_CLKSource_HCLK_Div8 ((uint32_t)0xFFFFFFFB)\000"
.LASF302:
	.ascii	"__USA_FBIT__ 16\000"
.LASF2552:
	.ascii	"ADC_FLAG_AWD ADC_ISR_AWD\000"
.LASF576:
	.ascii	"SysTick ((SysTick_Type *) SysTick_BASE )\000"
.LASF1042:
	.ascii	"EXTI_SWIER_SWIER11 ((uint32_t)0x00000800)\000"
.LASF3250:
	.ascii	"RTC_FLAG_TAMP1F ((uint32_t)0x00002000)\000"
.LASF3900:
	.ascii	"RCC_LSEDrive_MediumLow RCC_BDCR_LSEDRV_0\000"
.LASF3347:
	.ascii	"IS_I2S_AUDIO_FREQ(FREQ) ((((FREQ) >= I2S_AudioFreq_"
	.ascii	"8k) && ((FREQ) <= I2S_AudioFreq_192k)) || ((FREQ) ="
	.ascii	"= I2S_AudioFreq_Default))\000"
.LASF1216:
	.ascii	"GPIO_OSPEEDER_OSPEEDR12_1 ((uint32_t)0x02000000)\000"
.LASF3978:
	.ascii	"CARIBOU_GPIO_PIN_0 (1<<0)\000"
.LASF27:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF4335:
	.ascii	"stderr _stderr\000"
.LASF2639:
	.ascii	"COMP_Output_TIM1OCREFCLR ((uint32_t)0x00000300)\000"
.LASF2590:
	.ascii	"CEC_IT_TXERR CEC_IER_TXERRIE\000"
.LASF398:
	.ascii	"INT_FAST16_MIN INT32_MIN\000"
.LASF1323:
	.ascii	"GPIO_BSRR_BR_1 ((uint32_t)0x00020000)\000"
.LASF1927:
	.ascii	"RTC_TAFCR_TAMP2E ((uint32_t)0x00000008)\000"
.LASF727:
	.ascii	"ADC_LTR_LT ((uint32_t)0x00000FFF)\000"
.LASF965:
	.ascii	"EXTI_IMR_MR22 ((uint32_t)0x00400000)\000"
.LASF945:
	.ascii	"EXTI_IMR_MR0 ((uint32_t)0x00000001)\000"
.LASF2758:
	.ascii	"DMA1_FLAG_TC1 DMA_ISR_TCIF1\000"
.LASF4121:
	.ascii	"EWOULDBLOCK EAGAIN\000"
.LASF1441:
	.ascii	"I2C_ISR_TC ((uint32_t)0x00000040)\000"
.LASF880:
	.ascii	"DBGMCU_APB2_FZ_DBG_TIM1_STOP ((uint32_t)0x00000800)"
	.ascii	"\000"
.LASF1156:
	.ascii	"GPIO_MODER_MODER14 ((uint32_t)0x30000000)\000"
.LASF3397:
	.ascii	"IS_SPI_CLEAR_FLAG(FLAG) (((FLAG) == SPI_FLAG_CRCERR"
	.ascii	"))\000"
.LASF287:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF3170:
	.ascii	"RTC_AlarmSubSecondMask_SS14_11 ((uint8_t)0x0B)\000"
.LASF3022:
	.ascii	"I2C_FLAG_TXIS I2C_ISR_TXIS\000"
.LASF4180:
	.ascii	"ENETDOWN 100\000"
.LASF1852:
	.ascii	"RTC_TSTR_PM ((uint32_t)0x00400000)\000"
.LASF4242:
	.ascii	"caribou_vector_pend(vector) chip_vector_pend(vector"
	.ascii	")\000"
.LASF1438:
	.ascii	"I2C_ISR_ADDR ((uint32_t)0x00000008)\000"
.LASF3045:
	.ascii	"I2C_IT_BERR I2C_ISR_BERR\000"
.LASF2662:
	.ascii	"DAC_Trigger_T6_TRGO ((uint32_t)0x00000004)\000"
.LASF0:
	.ascii	"__STDC__ 1\000"
.LASF4463:
	.ascii	"size\000"
.LASF3186:
	.ascii	"RTC_CalibOutput_512Hz ((uint32_t)0x00000000)\000"
.LASF3484:
	.ascii	"IS_TIM_OCNIDLE_STATE(STATE) (((STATE) == TIM_OCNIdl"
	.ascii	"eState_Set) || ((STATE) == TIM_OCNIdleState_Reset))"
	.ascii	"\000"
.LASF3655:
	.ascii	"TIM_DMABurstLength_7Bytes TIM_DMABurstLength_7Trans"
	.ascii	"fers\000"
.LASF3252:
	.ascii	"RTC_FLAG_TSF ((uint32_t)0x00000800)\000"
.LASF3019:
	.ascii	"I2C_IT_TXI I2C_CR1_TXIE\000"
.LASF650:
	.ascii	"TIM1 ((TIM_TypeDef *) TIM1_BASE)\000"
.LASF901:
	.ascii	"DMA_ISR_TCIF5 ((uint32_t)0x00020000)\000"
.LASF2696:
	.ascii	"DBGMCU_TIM1_STOP DBGMCU_APB2_FZ_DBG_TIM1_STOP\000"
.LASF4089:
	.ascii	"EBADF 9\000"
.LASF2490:
	.ascii	"ADC_AnalogWatchdog_Channel_5 ((uint32_t)0x14000000)"
	.ascii	"\000"
.LASF3025:
	.ascii	"I2C_FLAG_NACKF I2C_ISR_NACKF\000"
.LASF843:
	.ascii	"DAC_CR_TSEL1_2 ((uint32_t)0x00000020)\000"
.LASF3661:
	.ascii	"TIM_DMABurstLength_13Bytes TIM_DMABurstLength_13Tra"
	.ascii	"nsfers\000"
.LASF1719:
	.ascii	"RCC_CR2_HSI14CAL ((uint32_t)0x0000FF00)\000"
.LASF3215:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div8192 ((uint32_t)0x"
	.ascii	"00000200)\000"
.LASF1687:
	.ascii	"RCC_AHBRSTR_TSRST ((uint32_t)0x00100000)\000"
.LASF3646:
	.ascii	"TIM14_HSEDiv32 ((uint16_t)0x0002)\000"
.LASF4119:
	.ascii	"ENOTEMPTY 39\000"
.LASF2152:
	.ascii	"TIM_DIER_BIE ((uint16_t)0x0080)\000"
.LASF633:
	.ascii	"TIM6 ((TIM_TypeDef *) TIM6_BASE)\000"
.LASF1272:
	.ascii	"GPIO_PUPDR_PUPDR15_0 ((uint32_t)0x40000000)\000"
.LASF2155:
	.ascii	"TIM_DIER_CC2DE ((uint16_t)0x0400)\000"
.LASF1191:
	.ascii	"GPIO_OSPEEDER_OSPEEDR4_0 ((uint32_t)0x00000100)\000"
.LASF3827:
	.ascii	"RCC_PLLMul_16 RCC_CFGR_PLLMULL16\000"
.LASF1748:
	.ascii	"RTC_DR_YT_0 ((uint32_t)0x00100000)\000"
.LASF2509:
	.ascii	"ADC_SampleTime_41_5Cycles ((uint32_t)0x00000004)\000"
.LASF3280:
	.ascii	"SPI_DataSize_4b ((uint16_t)0x0300)\000"
.LASF530:
	.ascii	"SCB_AIRCR_VECTKEY_Pos 16\000"
.LASF212:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF2927:
	.ascii	"EXTI_PinSource0 ((uint8_t)0x00)\000"
.LASF647:
	.ascii	"EXTI ((EXTI_TypeDef *) EXTI_BASE)\000"
.LASF1657:
	.ascii	"RCC_BDCR_LSERDY ((uint32_t)0x00000002)\000"
.LASF487:
	.ascii	"__Vendor_SysTickConfig 0\000"
.LASF459:
	.ascii	"min(a,b) (((a) < (b)) ? (a) : (b))\000"
.LASF3039:
	.ascii	"I2C_IT_RXNE I2C_ISR_RXNE\000"
.LASF2785:
	.ascii	"EXTI_Line2 ((uint32_t)0x00000004)\000"
.LASF1063:
	.ascii	"EXTI_PR_PR13 ((uint32_t)0x00002000)\000"
.LASF3971:
	.ascii	"chip_pendsv_enter() (SCB->ICSR |= SCB_ICSR_PENDSVCL"
	.ascii	"R_Msk)\000"
.LASF3430:
	.ascii	"IS_TIM_PWMI_CHANNEL(CHANNEL) (((CHANNEL) == TIM_Cha"
	.ascii	"nnel_1) || ((CHANNEL) == TIM_Channel_2))\000"
.LASF531:
	.ascii	"SCB_AIRCR_VECTKEY_Msk (0xFFFFUL << SCB_AIRCR_VECTKE"
	.ascii	"Y_Pos)\000"
.LASF3989:
	.ascii	"CARIBOU_GPIO_PIN_11 (1<<11)\000"
.LASF917:
	.ascii	"DMA_IFCR_CTCIF4 ((uint32_t)0x00002000)\000"
.LASF48:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF3863:
	.ascii	"RCC_HCLK_Div8 RCC_CFGR_PPRE_DIV8\000"
.LASF203:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF3064:
	.ascii	"IWDG_WriteAccess_Disable ((uint16_t)0x0000)\000"
.LASF267:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF3898:
	.ascii	"IS_RCC_RTCCLK_SOURCE(SOURCE) (((SOURCE) == RCC_RTCC"
	.ascii	"LKSource_LSE) || ((SOURCE) == RCC_RTCCLKSource_LSI)"
	.ascii	" || ((SOURCE) == RCC_RTCCLKSource_HSE_Div32))\000"
.LASF1870:
	.ascii	"RTC_TSTR_ST ((uint32_t)0x00000070)\000"
.LASF301:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF3647:
	.ascii	"TIM14_MCO ((uint16_t)0x0003)\000"
.LASF1898:
	.ascii	"RTC_CAL_CALP ((uint32_t)0x00008000)\000"
.LASF3519:
	.ascii	"TIM_DMABase_ARR ((uint16_t)0x000B)\000"
.LASF642:
	.ascii	"PWR ((PWR_TypeDef *) PWR_BASE)\000"
.LASF3140:
	.ascii	"RTC_Weekday_Friday ((uint8_t)0x05)\000"
.LASF2608:
	.ascii	"CEC_FLAG_TXBR CEC_ISR_TXBR\000"
.LASF3785:
	.ascii	"IS_USART_AUTO_RETRY_COUNTER(COUNTER) ((COUNTER) <= "
	.ascii	"0x7)\000"
.LASF687:
	.ascii	"ADC_CR_ADCAL ((uint32_t)0x80000000)\000"
.LASF1940:
	.ascii	"RTC_BKP3R ((uint32_t)0xFFFFFFFF)\000"
.LASF3630:
	.ascii	"TIM_FLAG_COM ((uint16_t)0x0020)\000"
.LASF16:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF4253:
	.ascii	"PI 3.14159265358979324\000"
.LASF2450:
	.ascii	"WWDG_CFR_WDGTB0 ((uint16_t)0x0080)\000"
.LASF3281:
	.ascii	"SPI_DataSize_5b ((uint16_t)0x0400)\000"
.LASF396:
	.ascii	"UINT_LEAST64_MAX UINT64_MAX\000"
.LASF1511:
	.ascii	"RCC_CFGR_SW_HSI ((uint32_t)0x00000000)\000"
.LASF3020:
	.ascii	"IS_I2C_CONFIG_IT(IT) ((((IT) & (uint32_t)0xFFFFFF01"
	.ascii	") == 0x00) && ((IT) != 0x00))\000"
.LASF283:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF3943:
	.ascii	"RCC_MCOSource_SYSCLK ((uint8_t)0x04)\000"
.LASF2255:
	.ascii	"TIM_CCER_CC1NP ((uint16_t)0x0008)\000"
.LASF2331:
	.ascii	"USART_CR1_DEAT ((uint32_t)0x03E00000)\000"
.LASF3605:
	.ascii	"TIM_OCClear_Enable ((uint16_t)0x0080)\000"
.LASF2847:
	.ascii	"IS_OB_STDBY_SOURCE(SOURCE) (((SOURCE) == OB_STDBY_N"
	.ascii	"oRST) || ((SOURCE) == OB_STDBY_RST))\000"
.LASF3072:
	.ascii	"IWDG_Prescaler_256 ((uint8_t)0x06)\000"
.LASF116:
	.ascii	"__INT_FAST32_MAX__ 0x7fffffff\000"
.LASF3666:
	.ascii	"TIM_DMABurstLength_18Bytes TIM_DMABurstLength_18Tra"
	.ascii	"nsfers\000"
.LASF445:
	.ascii	"__CTYPE_ALPHA (__CTYPE_UPPER | __CTYPE_LOWER)\000"
.LASF4426:
	.ascii	"size_t\000"
.LASF849:
	.ascii	"DAC_DHR8R1_DACC1DHR ((uint32_t)0x000000FF)\000"
.LASF4374:
	.ascii	"CARIBOU_ADC_Channel_26 ((uint8_t)0x1A)\000"
.LASF838:
	.ascii	"DAC_CR_BOFF1 ((uint32_t)0x00000002)\000"
.LASF992:
	.ascii	"EXTI_EMR_MR27 ((uint32_t)0x08000000)\000"
.LASF3163:
	.ascii	"RTC_AlarmSubSecondMask_SS14_4 ((uint8_t)0x04)\000"
.LASF2593:
	.ascii	"CEC_IT_TXBR CEC_IER_TXBRIE\000"
.LASF309:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF4099:
	.ascii	"ENODEV 19\000"
.LASF1447:
	.ascii	"I2C_ISR_TIMEOUT ((uint32_t)0x00001000)\000"
.LASF2078:
	.ascii	"SYSCFG_EXTICR4_EXTI12 ((uint16_t)0x000F)\000"
.LASF1643:
	.ascii	"RCC_APB2ENR_DBGMCUEN ((uint32_t)0x00400000)\000"
.LASF4016:
	.ascii	"caribou_gpio_reset(gpio) chip_gpio_reset((gpio)->po"
	.ascii	"rt,(gpio)->pinmask)\000"
.LASF3332:
	.ascii	"I2S_DataFormat_32b ((uint16_t)0x0005)\000"
.LASF3621:
	.ascii	"IS_TIM_SLAVE_MODE(MODE) (((MODE) == TIM_SlaveMode_R"
	.ascii	"eset) || ((MODE) == TIM_SlaveMode_Gated) || ((MODE)"
	.ascii	" == TIM_SlaveMode_Trigger) || ((MODE) == TIM_SlaveM"
	.ascii	"ode_External1))\000"
.LASF1506:
	.ascii	"RCC_CR_PLLON ((uint32_t)0x01000000)\000"
.LASF2571:
	.ascii	"CEC_RxTolerance_Extended CEC_CFGR_RXTOL\000"
.LASF665:
	.ascii	"RCC ((RCC_TypeDef *) RCC_BASE)\000"
.LASF373:
	.ascii	"UINT16_MAX 65535\000"
.LASF3656:
	.ascii	"TIM_DMABurstLength_8Bytes TIM_DMABurstLength_8Trans"
	.ascii	"fers\000"
.LASF369:
	.ascii	"__stdint_H \000"
.LASF571:
	.ascii	"CoreDebug_BASE (0xE000EDF0UL)\000"
.LASF305:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF2720:
	.ascii	"DMA_Mode_Normal ((uint32_t)0x00000000)\000"
.LASF1208:
	.ascii	"GPIO_OSPEEDER_OSPEEDR10 ((uint32_t)0x00300000)\000"
.LASF499:
	.ascii	"__I volatile\000"
.LASF1483:
	.ascii	"PWR_CR_PLS_LEV0 ((uint16_t)0x0000)\000"
.LASF4104:
	.ascii	"EMFILE 24\000"
.LASF4367:
	.ascii	"CARIBOU_ADC_Channel_19 ((uint8_t)0x13)\000"
.LASF2359:
	.ascii	"USART_CR2_RTOEN ((uint32_t)0x00800000)\000"
.LASF3271:
	.ascii	"IS_SPI_1_PERIPH(PERIPH) (((PERIPH) == SPI1))\000"
.LASF2400:
	.ascii	"USART_ISR_IDLE ((uint32_t)0x00000010)\000"
.LASF1234:
	.ascii	"GPIO_PUPDR_PUPDR2_1 ((uint32_t)0x00000020)\000"
.LASF1510:
	.ascii	"RCC_CFGR_SW_1 ((uint32_t)0x00000002)\000"
.LASF752:
	.ascii	"CEC_CR_TXSOM ((uint32_t)0x00000002)\000"
.LASF4192:
	.ascii	"EHOSTDOWN 112\000"
.LASF3676:
	.ascii	"IS_USART_STOPBITS(STOPBITS) (((STOPBITS) == USART_S"
	.ascii	"topBits_1) || ((STOPBITS) == USART_StopBits_2) || ("
	.ascii	"(STOPBITS) == USART_StopBits_1_5))\000"
.LASF538:
	.ascii	"SCB_AIRCR_VECTCLRACTIVE_Pos 1\000"
.LASF1463:
	.ascii	"I2C_TXDR_TXDATA ((uint32_t)0x000000FF)\000"
.LASF3559:
	.ascii	"TIM_ExtTRGPSC_DIV8 ((uint16_t)0x3000)\000"
.LASF3501:
	.ascii	"TIM_IT_CC3 ((uint16_t)0x0008)\000"
.LASF4387:
	.ascii	"chip_i2s_word_t uint16_t\000"
.LASF1423:
	.ascii	"I2C_OAR2_OA2MSK ((uint32_t)0x00000700)\000"
.LASF512:
	.ascii	"SCB_ICSR_NMIPENDSET_Pos 31\000"
.LASF2698:
	.ascii	"DBGMCU_TIM16_STOP DBGMCU_APB2_FZ_DBG_TIM16_STOP\000"
.LASF253:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF3264:
	.ascii	"RTC_IT_TAMP2 ((uint32_t)0x00040000)\000"
.LASF3779:
	.ascii	"USART_IT_FE ((uint32_t)0x00010300)\000"
.LASF1986:
	.ascii	"SPI_SR_FRLVL_1 ((uint16_t)0x0400)\000"
.LASF66:
	.ascii	"__has_include(STR) __has_include__(STR)\000"
.LASF4068:
	.ascii	"TIMEOUT_IMMEDIATE -1\000"
.LASF3773:
	.ascii	"USART_IT_IDLE ((uint32_t)0x00040104)\000"
.LASF1480:
	.ascii	"PWR_CR_PLS_0 ((uint16_t)0x0020)\000"
.LASF4254:
	.ascii	"HALF_PI 1.57079632679489662\000"
.LASF1689:
	.ascii	"RCC_CFGR2_PREDIV1_0 ((uint32_t)0x00000001)\000"
.LASF889:
	.ascii	"DMA_ISR_TCIF2 ((uint32_t)0x00000020)\000"
.LASF3278:
	.ascii	"SPI_Mode_Slave ((uint16_t)0x0000)\000"
.LASF3769:
	.ascii	"USART_IT_PE ((uint32_t)0x00000108)\000"
.LASF2487:
	.ascii	"ADC_AnalogWatchdog_Channel_2 ((uint32_t)0x08000000)"
	.ascii	"\000"
.LASF1427:
	.ascii	"I2C_TIMINGR_SDADEL ((uint32_t)0x000F0000)\000"
.LASF3767:
	.ascii	"USART_IT_EOB ((uint32_t)0x000C011B)\000"
.LASF662:
	.ascii	"DMA1_Channel5 ((DMA_Channel_TypeDef *) DMA1_Channel"
	.ascii	"5_BASE)\000"
.LASF690:
	.ascii	"ADC_CR_ADDIS ((uint32_t)0x00000002)\000"
.LASF2478:
	.ascii	"IS_ADC_DATA_ALIGN(ALIGN) (((ALIGN) == ADC_DataAlign"
	.ascii	"_Right) || ((ALIGN) == ADC_DataAlign_Left))\000"
.LASF663:
	.ascii	"FLASH ((FLASH_TypeDef *) FLASH_R_BASE)\000"
.LASF1020:
	.ascii	"EXTI_FTSR_TR8 ((uint32_t)0x00000100)\000"
.LASF796:
	.ascii	"COMP_CSR_COMP1INSEL ((uint32_t)0x00000070)\000"
.LASF350:
	.ascii	"__CROSSWORKS_MAJOR_VERSION 3\000"
.LASF1331:
	.ascii	"GPIO_BSRR_BR_9 ((uint32_t)0x02000000)\000"
.LASF1237:
	.ascii	"GPIO_PUPDR_PUPDR3_1 ((uint32_t)0x00000080)\000"
.LASF1990:
	.ascii	"SPI_DR_DR ((uint16_t)0xFFFF)\000"
.LASF1266:
	.ascii	"GPIO_PUPDR_PUPDR13_0 ((uint32_t)0x04000000)\000"
.LASF1543:
	.ascii	"RCC_CFGR_ADCPRE ((uint32_t)0x00004000)\000"
.LASF4294:
	.ascii	"FP_SINH 18\000"
.LASF877:
	.ascii	"DBGMCU_APB1_FZ_DBG_WWDG_STOP ((uint32_t)0x00000800)"
	.ascii	"\000"
.LASF1775:
	.ascii	"RTC_CR_COE ((uint32_t)0x00800000)\000"
.LASF1047:
	.ascii	"EXTI_SWIER_SWIER16 ((uint32_t)0x00010000)\000"
.LASF4361:
	.ascii	"CARIBOU_ADC_Channel_13 ((uint8_t)0x0D)\000"
.LASF1060:
	.ascii	"EXTI_PR_PR10 ((uint32_t)0x00000400)\000"
.LASF3575:
	.ascii	"TIM_ExtTRGPolarity_NonInverted ((uint16_t)0x0000)\000"
.LASF2873:
	.ascii	"GPIO_Pin_1 ((uint16_t)0x0002)\000"
.LASF3700:
	.ascii	"IS_USART_LASTBIT(LASTBIT) (((LASTBIT) == USART_Last"
	.ascii	"Bit_Disable) || ((LASTBIT) == USART_LastBit_Enable)"
	.ascii	")\000"
.LASF4456:
	.ascii	"destructor\000"
.LASF1789:
	.ascii	"RTC_CR_FMT ((uint32_t)0x00000040)\000"
.LASF2080:
	.ascii	"SYSCFG_EXTICR4_EXTI14 ((uint16_t)0x0F00)\000"
.LASF2221:
	.ascii	"TIM_CCMR2_OC3M ((uint16_t)0x0070)\000"
.LASF3495:
	.ascii	"TIM_ICPSC_DIV4 ((uint16_t)0x0008)\000"
.LASF3953:
	.ascii	"RCC_FLAG_V18PWRRSTF ((uint8_t)0x57)\000"
.LASF574:
	.ascii	"SCB_BASE (SCS_BASE + 0x0D00UL)\000"
.LASF766:
	.ascii	"CEC_ISR_RXEND ((uint32_t)0x00000002)\000"
.LASF954:
	.ascii	"EXTI_IMR_MR9 ((uint32_t)0x00000200)\000"
.LASF3711:
	.ascii	"USART_AddressLength_7b USART_CR2_ADDM7\000"
.LASF3565:
	.ascii	"TIM_TS_TI1F_ED ((uint16_t)0x0040)\000"
.LASF3077:
	.ascii	"IS_IWDG_FLAG(FLAG) (((FLAG) == IWDG_FLAG_PVU) || (("
	.ascii	"FLAG) == IWDG_FLAG_RVU) || ((FLAG) == IWDG_FLAG_WVU"
	.ascii	"))\000"
.LASF4191:
	.ascii	"ECONNREFUSED 111\000"
.LASF3131:
	.ascii	"RTC_Month_October ((uint8_t)0x10)\000"
.LASF1502:
	.ascii	"RCC_CR_HSEON ((uint32_t)0x00010000)\000"
.LASF1499:
	.ascii	"RCC_CR_HSIRDY ((uint32_t)0x00000002)\000"
.LASF937:
	.ascii	"DMA_CCR_MSIZE_1 ((uint32_t)0x00000800)\000"
.LASF2451:
	.ascii	"WWDG_CFR_WDGTB1 ((uint16_t)0x0100)\000"
.LASF36:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF2673:
	.ascii	"IS_DAC_CHANNEL(CHANNEL) (((CHANNEL) == DAC_Channel_"
	.ascii	"1))\000"
.LASF612:
	.ascii	"TIM16_BASE (APBPERIPH_BASE + 0x00014400)\000"
.LASF1639:
	.ascii	"RCC_APB2ENR_USART1EN ((uint32_t)0x00004000)\000"
.LASF799:
	.ascii	"COMP_CSR_COMP1INSEL_2 ((uint32_t)0x00000040)\000"
.LASF1654:
	.ascii	"RCC_APB1ENR_DACEN ((uint32_t)0x20000000)\000"
.LASF2562:
	.ascii	"CEC_SignalFreeTime_1T ((uint32_t)0x00000001)\000"
.LASF1217:
	.ascii	"GPIO_OSPEEDER_OSPEEDR13 ((uint32_t)0x0C000000)\000"
.LASF2527:
	.ascii	"ADC_Channel_12 ADC_CHSELR_CHSEL12\000"
.LASF947:
	.ascii	"EXTI_IMR_MR2 ((uint32_t)0x00000004)\000"
.LASF3488:
	.ascii	"IS_TIM_IC_POLARITY(POLARITY) (((POLARITY) == TIM_IC"
	.ascii	"Polarity_Rising) || ((POLARITY) == TIM_ICPolarity_F"
	.ascii	"alling)|| ((POLARITY) == TIM_ICPolarity_BothEdge))\000"
.LASF839:
	.ascii	"DAC_CR_TEN1 ((uint32_t)0x00000004)\000"
.LASF797:
	.ascii	"COMP_CSR_COMP1INSEL_0 ((uint32_t)0x00000010)\000"
.LASF1473:
	.ascii	"IWDG_WINR_WIN ((uint16_t)0x0FFF)\000"
.LASF1918:
	.ascii	"RTC_TAFCR_TAMPFLT_1 ((uint32_t)0x00001000)\000"
.LASF2302:
	.ascii	"TIM_DCR_DBL_2 ((uint16_t)0x0400)\000"
.LASF3604:
	.ascii	"IS_TIM_OCFAST_STATE(STATE) (((STATE) == TIM_OCFast_"
	.ascii	"Enable) || ((STATE) == TIM_OCFast_Disable))\000"
.LASF3891:
	.ascii	"RCC_LSE_OFF ((uint32_t)0x00000000)\000"
.LASF2111:
	.ascii	"TIM_CR2_CCUS ((uint16_t)0x0004)\000"
.LASF4380:
	.ascii	"_CARIBOU_I2C_H_ \000"
.LASF2488:
	.ascii	"ADC_AnalogWatchdog_Channel_3 ((uint32_t)0x0C000000)"
	.ascii	"\000"
.LASF618:
	.ascii	"DMA1_Channel3_BASE (DMA1_BASE + 0x00000030)\000"
.LASF2511:
	.ascii	"ADC_SampleTime_71_5Cycles ((uint32_t)0x00000006)\000"
.LASF1520:
	.ascii	"RCC_CFGR_HPRE ((uint32_t)0x000000F0)\000"
.LASF981:
	.ascii	"EXTI_EMR_MR12 ((uint32_t)0x00001000)\000"
.LASF4235:
	.ascii	"caribou_interrupts_set(enable) chip_interrupts_set("
	.ascii	"enable)\000"
.LASF970:
	.ascii	"EXTI_EMR_MR1 ((uint32_t)0x00000002)\000"
.LASF1106:
	.ascii	"OB_RDP_RDP ((uint32_t)0x000000FF)\000"
.LASF1174:
	.ascii	"GPIO_OTYPER_OT_12 ((uint32_t)0x00001000)\000"
.LASF3800:
	.ascii	"IS_NVIC_LP(LP) (((LP) == NVIC_LP_SEVONPEND) || ((LP"
	.ascii	") == NVIC_LP_SLEEPDEEP) || ((LP) == NVIC_LP_SLEEPON"
	.ascii	"EXIT))\000"
.LASF1989:
	.ascii	"SPI_SR_FTLVL_1 ((uint16_t)0x1000)\000"
.LASF4181:
	.ascii	"ENETUNREACH 101\000"
.LASF2282:
	.ascii	"TIM_BDTR_DTG_6 ((uint16_t)0x0040)\000"
.LASF266:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF179:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF4248:
	.ascii	"CARIBOU_MUTEX_DECL(x) caribou_mutex_t x={NULL,0,0,0"
	.ascii	"}\000"
.LASF2256:
	.ascii	"TIM_CCER_CC2E ((uint16_t)0x0010)\000"
.LASF1923:
	.ascii	"RTC_TAFCR_TAMPTS ((uint32_t)0x00000080)\000"
.LASF2481:
	.ascii	"IS_ADC_SCAN_DIRECTION(DIRECTION) (((DIRECTION) == A"
	.ascii	"DC_ScanDirection_Upward) || ((DIRECTION) == ADC_Sca"
	.ascii	"nDirection_Backward))\000"
.LASF2987:
	.ascii	"I2C_DMAReq_Rx I2C_CR1_RXDMAEN\000"
.LASF967:
	.ascii	"EXTI_IMR_MR25 ((uint32_t)0x02000000)\000"
.LASF1602:
	.ascii	"RCC_CIR_HSI14RDYC ((uint32_t)0x00200000)\000"
.LASF2423:
	.ascii	"USART_ICR_TCCF ((uint32_t)0x00000040)\000"
.LASF1576:
	.ascii	"RCC_CFGR_MCO_NOCLOCK ((uint32_t)0x00000000)\000"
.LASF3713:
	.ascii	"USART_WakeUpSource_AddressMatch ((uint32_t)0x000000"
	.ascii	"00)\000"
.LASF3195:
	.ascii	"IS_RTC_SMOOTH_CALIB_PLUS(PLUS) (((PLUS) == RTC_Smoo"
	.ascii	"thCalibPlusPulses_Set) || ((PLUS) == RTC_SmoothCali"
	.ascii	"bPlusPulses_Reset))\000"
.LASF4094:
	.ascii	"EFAULT 14\000"
.LASF3100:
	.ascii	"PWR_STOPEntry_WFE ((uint8_t)0x02)\000"
.LASF3301:
	.ascii	"SPI_CPHA_2Edge SPI_CR1_CPHA\000"
.LASF1914:
	.ascii	"RTC_TAFCR_TAMPPRCH_0 ((uint32_t)0x00002000)\000"
.LASF1568:
	.ascii	"RCC_CFGR_PLLMULL13 ((uint32_t)0x002C0000)\000"
.LASF3620:
	.ascii	"TIM_SlaveMode_External1 ((uint16_t)0x0007)\000"
.LASF50:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF1293:
	.ascii	"GPIO_ODR_3 ((uint32_t)0x00000008)\000"
.LASF122:
	.ascii	"__INTPTR_MAX__ 0x7fffffff\000"
.LASF2822:
	.ascii	"OB_WRP_Pages16to19 ((uint32_t)0x00000010)\000"
.LASF4470:
	.ascii	"operator delete []\000"
.LASF3911:
	.ascii	"RCC_AHBPeriph_FLITF RCC_AHBENR_FLITFEN\000"
.LASF1349:
	.ascii	"GPIO_LCKR_LCK11 ((uint32_t)0x00000800)\000"
.LASF2548:
	.ascii	"ADC_FLAG_EOSMP ADC_ISR_EOSMP\000"
.LASF2616:
	.ascii	"CEC_FLAG_RXBR CEC_ISR_RXBR\000"
.LASF2136:
	.ascii	"TIM_SMCR_ETF_0 ((uint16_t)0x0100)\000"
.LASF4195:
	.ascii	"EINPROGRESS 115\000"
.LASF2328:
	.ascii	"USART_CR1_DEDT_2 ((uint32_t)0x00040000)\000"
.LASF4305:
	.ascii	"CARIBOUQSORT_H \000"
.LASF502:
	.ascii	"SCB_CPUID_IMPLEMENTER_Pos 24\000"
.LASF3268:
	.ascii	"IS_RTC_CLEAR_IT(IT) (((IT) != (uint32_t)RESET) && ("
	.ascii	"((IT) & 0xFFF16FFF) == (uint32_t)RESET))\000"
.LASF4350:
	.ascii	"CARIBOU_ADC_Channel_2 ((uint8_t)0x02)\000"
.LASF2312:
	.ascii	"USART_CR1_TE ((uint32_t)0x00000008)\000"
.LASF4026:
	.ascii	"PIN_PUPDR_MASK(n) (0x3<<(n*2))\000"
.LASF3930:
	.ascii	"RCC_APB1Periph_WWDG RCC_APB1ENR_WWDGEN\000"
.LASF3748:
	.ascii	"USART_FLAG_ABRF USART_ISR_ABRF\000"
.LASF2294:
	.ascii	"TIM_DCR_DBA_0 ((uint16_t)0x0001)\000"
.LASF3204:
	.ascii	"RTC_TamperTrigger_FallingEdge ((uint32_t)0x00000001"
	.ascii	")\000"
.LASF526:
	.ascii	"SCB_ICSR_VECTPENDING_Pos 12\000"
.LASF3648:
	.ascii	"IS_TIM_REMAP(TIM_REMAP) (((TIM_REMAP) == TIM14_GPIO"
	.ascii	")|| ((TIM_REMAP) == TIM14_RTC_CLK) || ((TIM_REMAP) "
	.ascii	"== TIM14_HSEDiv32) || ((TIM_REMAP) == TIM14_MCO))\000"
.LASF1405:
	.ascii	"I2C_CR1_SMBDEN ((uint32_t)0x00200000)\000"
.LASF830:
	.ascii	"CRC_IDR_IDR ((uint8_t)0xFF)\000"
.LASF4085:
	.ascii	"EIO 5\000"
.LASF505:
	.ascii	"SCB_CPUID_VARIANT_Msk (0xFUL << SCB_CPUID_VARIANT_P"
	.ascii	"os)\000"
.LASF71:
	.ascii	"__cpp_runtime_arrays 198712\000"
.LASF2146:
	.ascii	"TIM_DIER_CC1IE ((uint16_t)0x0002)\000"
.LASF2860:
	.ascii	"FLASH_FLAG_EOP FLASH_SR_EOP\000"
.LASF2416:
	.ascii	"USART_ISR_TEACK ((uint32_t)0x00200000)\000"
.LASF127:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF1586:
	.ascii	"RCC_CIR_HSIRDYF ((uint32_t)0x00000004)\000"
.LASF4430:
	.ascii	"timerfn\000"
.LASF2964:
	.ascii	"IS_SYSCFG_FLAG(FLAG) (((FLAG) == SYSCFG_FLAG_PE))\000"
.LASF3253:
	.ascii	"RTC_FLAG_ALRAF ((uint32_t)0x00000100)\000"
.LASF4474:
	.ascii	"pnetif\000"
.LASF3728:
	.ascii	"IS_USART_INVERSTION_PIN(PIN) ((((PIN) & (uint32_t)0"
	.ascii	"xFFFCFFFF) == 0x00) && ((PIN) != (uint32_t)0x00))\000"
.LASF1953:
	.ascii	"SPI_CR1_RXONLY ((uint16_t)0x0400)\000"
.LASF2241:
	.ascii	"TIM_CCMR2_IC3F_1 ((uint16_t)0x0020)\000"
.LASF142:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF4037:
	.ascii	"CARIBOU_PORTA_AFRH PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_0) | PIN_AFR(6,GPIO_AF_0) | PIN_AFR(7"
	.ascii	",GPIO_AF_GPIO)\000"
.LASF2777:
	.ascii	"IS_DMA_CLEAR_FLAG(FLAG) ((((FLAG) & 0xFFF00000) == "
	.ascii	"0x00) && ((FLAG) != 0x00))\000"
.LASF4072:
	.ascii	"CARIBOUERRNO_H \000"
.LASF4138:
	.ascii	"EDEADLOCK EDEADLK\000"
.LASF3976:
	.ascii	"chip_gpio_pinmask_t uint16_t\000"
.LASF1564:
	.ascii	"RCC_CFGR_PLLMULL9 ((uint32_t)0x001C0000)\000"
.LASF1424:
	.ascii	"I2C_OAR2_OA2EN ((uint32_t)0x00008000)\000"
.LASF2184:
	.ascii	"TIM_CCMR1_OC1PE ((uint16_t)0x0008)\000"
.LASF1702:
	.ascii	"RCC_CFGR2_PREDIV1_DIV10 ((uint32_t)0x00000009)\000"
.LASF718:
	.ascii	"ADC_CFGR1_DMAEN ((uint32_t)0x00000001)\000"
.LASF4226:
	.ascii	"THREAD_FAULT_STACK_OVERFLOW 0x0004\000"
.LASF899:
	.ascii	"DMA_ISR_TEIF4 ((uint32_t)0x00008000)\000"
.LASF3117:
	.ascii	"IS_RTC_SECONDS(SECONDS) ((SECONDS) <= 59)\000"
.LASF2998:
	.ascii	"I2C_OA2_Mask07 ((uint8_t)0x07)\000"
.LASF1251:
	.ascii	"GPIO_PUPDR_PUPDR8_0 ((uint32_t)0x00010000)\000"
.LASF278:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF2908:
	.ascii	"GPIO_AF_0 ((uint8_t)0x00)\000"
.LASF4174:
	.ascii	"ESOCKTNOSUPPORT 94\000"
.LASF363:
	.ascii	"CONSOLE_USART 0\000"
.LASF158:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF1426:
	.ascii	"I2C_TIMINGR_SCLH ((uint32_t)0x0000FF00)\000"
.LASF3402:
	.ascii	"IS_TIM_LIST1_PERIPH(PERIPH) ((PERIPH) == TIM1)\000"
.LASF3330:
	.ascii	"I2S_DataFormat_16bextended ((uint16_t)0x0001)\000"
.LASF2106:
	.ascii	"TIM_CR1_ARPE ((uint16_t)0x0080)\000"
.LASF3855:
	.ascii	"RCC_SYSCLK_Div64 RCC_CFGR_HPRE_DIV64\000"
.LASF3783:
	.ascii	"IS_USART_BAUDRATE(BAUDRATE) (((BAUDRATE) > 0) && (("
	.ascii	"BAUDRATE) < 0x005B8D81))\000"
.LASF2394:
	.ascii	"USART_RQR_RXFRQ ((uint16_t)0x0008)\000"
.LASF3675:
	.ascii	"USART_StopBits_1_5 ((uint32_t)USART_CR2_STOP_0 | US"
	.ascii	"ART_CR2_STOP_1)\000"
.LASF2614:
	.ascii	"CEC_FLAG_RXOVR CEC_ISR_RXOVR\000"
.LASF2307:
	.ascii	"TIM14_OR_TI1_RMP_0 ((uint16_t)0x0001)\000"
.LASF1382:
	.ascii	"GPIO_BRR_BR_11 ((uint32_t)0x00000800)\000"
.LASF801:
	.ascii	"COMP_CSR_COMP1OUTSEL_0 ((uint32_t)0x00000100)\000"
.LASF2076:
	.ascii	"SYSCFG_EXTICR3_EXTI11_PB ((uint16_t)0x1000)\000"
.LASF1535:
	.ascii	"RCC_CFGR_PPRE_0 ((uint32_t)0x00000100)\000"
.LASF3444:
	.ascii	"TIM_OCNPolarity_High ((uint16_t)0x0000)\000"
.LASF2287:
	.ascii	"TIM_BDTR_OSSI ((uint16_t)0x0400)\000"
.LASF2570:
	.ascii	"CEC_RxTolerance_Standard ((uint32_t)0x00000000)\000"
.LASF1836:
	.ascii	"RTC_ALRMAR_MNU_2 ((uint32_t)0x00000400)\000"
.LASF3550:
	.ascii	"TIM_DMA_CC2 ((uint16_t)0x0400)\000"
.LASF3248:
	.ascii	"RTC_FLAG_TAMP3F ((uint32_t)0x00008000)\000"
.LASF930:
	.ascii	"DMA_CCR_PINC ((uint32_t)0x00000040)\000"
.LASF900:
	.ascii	"DMA_ISR_GIF5 ((uint32_t)0x00010000)\000"
.LASF3669:
	.ascii	"IS_USART_1_PERIPH(PERIPH) (((PERIPH) == USART1))\000"
.LASF1924:
	.ascii	"RTC_TAFCR_TAMP3EDGE ((uint32_t)0x00000040)\000"
.LASF3184:
	.ascii	"RTC_OutputPolarity_Low ((uint32_t)0x00100000)\000"
.LASF1571:
	.ascii	"RCC_CFGR_PLLMULL16 ((uint32_t)0x00380000)\000"
.LASF2710:
	.ascii	"DMA_MemoryInc_Enable DMA_CCR_MINC\000"
.LASF4337:
	.ascii	"tolower(c) ( ( (c)>='A' && (c)<='Z' ) ? ((c)+0x20) "
	.ascii	": (c) )\000"
.LASF1875:
	.ascii	"RTC_TSTR_SU_0 ((uint32_t)0x00000001)\000"
.LASF3844:
	.ascii	"RCC_PREDIV1_Div16 RCC_CFGR2_PREDIV1_DIV16\000"
.LASF3649:
	.ascii	"TIM_DMABurstLength_1Byte TIM_DMABurstLength_1Transf"
	.ascii	"er\000"
.LASF1588:
	.ascii	"RCC_CIR_PLLRDYF ((uint32_t)0x00000010)\000"
.LASF1247:
	.ascii	"GPIO_PUPDR_PUPDR7 ((uint32_t)0x0000C000)\000"
.LASF508:
	.ascii	"SCB_CPUID_PARTNO_Pos 4\000"
.LASF3208:
	.ascii	"RTC_TamperFilter_Disable ((uint32_t)0x00000000)\000"
.LASF2921:
	.ascii	"EXTI_PortSourceGPIOA ((uint8_t)0x00)\000"
.LASF3487:
	.ascii	"TIM_ICPolarity_BothEdge ((uint16_t)0x000A)\000"
.LASF2121:
	.ascii	"TIM_CR2_OIS2N ((uint16_t)0x0800)\000"
.LASF692:
	.ascii	"ADC_CFGR1_AWDCH ((uint32_t)0x7C000000)\000"
.LASF2336:
	.ascii	"USART_CR1_DEAT_4 ((uint32_t)0x02000000)\000"
.LASF1613:
	.ascii	"RCC_APB1RSTR_TIM2RST ((uint32_t)0x00000001)\000"
.LASF895:
	.ascii	"DMA_ISR_TEIF3 ((uint32_t)0x00000800)\000"
.LASF1814:
	.ascii	"RTC_ALRMAR_DU_0 ((uint32_t)0x01000000)\000"
.LASF2882:
	.ascii	"GPIO_Pin_10 ((uint16_t)0x0400)\000"
.LASF4050:
	.ascii	"CARIBOU_PORTD_MODE PIN_MODE(0,GPIO_Mode_IN) | PIN_M"
	.ascii	"ODE(1,GPIO_Mode_IN) | PIN_MODE(2,GPIO_Mode_IN) | PI"
	.ascii	"N_MODE(3,GPIO_Mode_IN) | PIN_MODE(4,GPIO_Mode_IN) |"
	.ascii	" PIN_MODE(5,GPIO_Mode_IN) | PIN_MODE(6,GPIO_Mode_IN"
	.ascii	") | PIN_MODE(7,GPIO_Mode_IN) | PIN_MODE(8,GPIO_Mode"
	.ascii	"_IN) | PIN_MODE(9,GPIO_Mode_IN) | PIN_MODE(10,GPIO_"
	.ascii	"Mode_IN) | PIN_MODE(11,GPIO_Mode_IN) | PIN_MODE(12,"
	.ascii	"GPIO_Mode_IN) | PIN_MODE(13,GPIO_Mode_IN) | PIN_MOD"
	.ascii	"E(14,GPIO_Mode_IN) | PIN_MODE(15,GPIO_Mode_IN)\000"
.LASF1948:
	.ascii	"SPI_CR1_BR_2 ((uint16_t)0x0020)\000"
.LASF2059:
	.ascii	"SYSCFG_EXTICR2_EXTI7_PB ((uint16_t)0x1000)\000"
.LASF2238:
	.ascii	"TIM_CCMR2_IC3PSC_1 ((uint16_t)0x0008)\000"
.LASF1144:
	.ascii	"GPIO_MODER_MODER10 ((uint32_t)0x00300000)\000"
.LASF2122:
	.ascii	"TIM_CR2_OIS3 ((uint16_t)0x1000)\000"
.LASF2841:
	.ascii	"IS_OB_IWDG_SOURCE(SOURCE) (((SOURCE) == OB_IWDG_SW)"
	.ascii	" || ((SOURCE) == OB_IWDG_HW))\000"
.LASF107:
	.ascii	"__UINT8_C(c) c\000"
.LASF2732:
	.ascii	"DMA_IT_HT DMA_CCR_HTIE\000"
.LASF1037:
	.ascii	"EXTI_SWIER_SWIER6 ((uint32_t)0x00000040)\000"
.LASF3130:
	.ascii	"RTC_Month_September ((uint8_t)0x09)\000"
.LASF4448:
	.ascii	"lock\000"
.LASF3388:
	.ascii	"SPI_I2S_FLAG_RXNE SPI_SR_RXNE\000"
.LASF2004:
	.ascii	"SPI_I2SCFGR_I2SCFG_0 ((uint16_t)0x0100)\000"
.LASF4149:
	.ascii	"ESRMNT 69\000"
.LASF4379:
	.ascii	"CARIBOU_ADC_Channel_31 ((uint8_t)0x1F)\000"
.LASF4483:
	.ascii	"CCaribouMainThread\000"
.LASF1357:
	.ascii	"GPIO_AFRL_AFRL2 ((uint32_t)0x00000F00)\000"
.LASF1711:
	.ascii	"RCC_CFGR3_USART1SW_1 ((uint32_t)0x00000002)\000"
.LASF3056:
	.ascii	"IS_RELOAD_END_MODE(MODE) (((MODE) == I2C_Reload_Mod"
	.ascii	"e) || ((MODE) == I2C_AutoEnd_Mode) || ((MODE) == I2"
	.ascii	"C_SoftEnd_Mode))\000"
.LASF2042:
	.ascii	"SYSCFG_EXTICR2_EXTI4 ((uint16_t)0x000F)\000"
.LASF3623:
	.ascii	"TIM_MasterSlaveMode_Disable ((uint16_t)0x0000)\000"
.LASF3298:
	.ascii	"SPI_CPOL_High SPI_CR1_CPOL\000"
.LASF1461:
	.ascii	"I2C_PECR_PEC ((uint32_t)0x000000FF)\000"
.LASF2104:
	.ascii	"TIM_CR1_CMS_0 ((uint16_t)0x0020)\000"
.LASF2392:
	.ascii	"USART_RQR_SBKRQ ((uint16_t)0x0002)\000"
.LASF2521:
	.ascii	"ADC_Channel_6 ADC_CHSELR_CHSEL6\000"
.LASF1691:
	.ascii	"RCC_CFGR2_PREDIV1_2 ((uint32_t)0x00000004)\000"
.LASF3614:
	.ascii	"TIM_TRGOSource_OC3Ref ((uint16_t)0x0060)\000"
.LASF490:
	.ascii	"__CM0_CMSIS_VERSION_SUB (0x10)\000"
.LASF3566:
	.ascii	"TIM_TS_TI1FP1 ((uint16_t)0x0050)\000"
.LASF1832:
	.ascii	"RTC_ALRMAR_MNT_2 ((uint32_t)0x00004000)\000"
.LASF3010:
	.ascii	"I2C_Register_RXDR ((uint8_t)0x24)\000"
.LASF986:
	.ascii	"EXTI_EMR_MR17 ((uint32_t)0x00020000)\000"
.LASF1587:
	.ascii	"RCC_CIR_HSERDYF ((uint32_t)0x00000008)\000"
.LASF2120:
	.ascii	"TIM_CR2_OIS2 ((uint16_t)0x0400)\000"
.LASF2085:
	.ascii	"SYSCFG_EXTICR4_EXTI13_PA ((uint16_t)0x0000)\000"
.LASF4297:
	.ascii	"FP_POWO 21\000"
.LASF3947:
	.ascii	"IS_RCC_MCO_SOURCE(SOURCE) (((SOURCE) == RCC_MCOSour"
	.ascii	"ce_NoClock) || ((SOURCE) == RCC_MCOSource_HSI14) ||"
	.ascii	" ((SOURCE) == RCC_MCOSource_SYSCLK) || ((SOURCE) =="
	.ascii	" RCC_MCOSource_HSI) || ((SOURCE) == RCC_MCOSource_H"
	.ascii	"SE) || ((SOURCE) == RCC_MCOSource_PLLCLK_Div2)|| (("
	.ascii	"SOURCE) == RCC_MCOSource_LSI) || ((SOURCE) == RCC_M"
	.ascii	"COSource_LSE))\000"
.LASF3317:
	.ascii	"IS_SPI_FIRST_BIT(BIT) (((BIT) == SPI_FirstBit_MSB) "
	.ascii	"|| ((BIT) == SPI_FirstBit_LSB))\000"
.LASF342:
	.ascii	"__ARM_ARCH_6M__ 1\000"
.LASF539:
	.ascii	"SCB_AIRCR_VECTCLRACTIVE_Msk (1UL << SCB_AIRCR_VECTC"
	.ascii	"LRACTIVE_Pos)\000"
.LASF2046:
	.ascii	"SYSCFG_EXTICR2_EXTI4_PA ((uint16_t)0x0000)\000"
.LASF257:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF4460:
	.ascii	"__aeabi_atexit\000"
.LASF2429:
	.ascii	"USART_ICR_WUCF ((uint32_t)0x00100000)\000"
.LASF1504:
	.ascii	"RCC_CR_HSEBYP ((uint32_t)0x00040000)\000"
.LASF1505:
	.ascii	"RCC_CR_CSSON ((uint32_t)0x00080000)\000"
.LASF2544:
	.ascii	"IS_ADC_CONFIG_IT(IT) (((IT) != (uint32_t)RESET) && "
	.ascii	"(((IT) & 0xFFFFFF60) == (uint32_t)RESET))\000"
.LASF1153:
	.ascii	"GPIO_MODER_MODER13 ((uint32_t)0x0C000000)\000"
.LASF3307:
	.ascii	"SPI_BaudRatePrescaler_4 ((uint16_t)0x0008)\000"
.LASF3629:
	.ascii	"TIM_FLAG_CC4 ((uint16_t)0x0010)\000"
.LASF1780:
	.ascii	"RTC_CR_CALSEL ((uint32_t)0x00080000)\000"
.LASF3524:
	.ascii	"TIM_DMABase_CCR4 ((uint16_t)0x0010)\000"
.LASF1459:
	.ascii	"I2C_ICR_TIMOUTCF ((uint32_t)0x00001000)\000"
.LASF4093:
	.ascii	"EACCES 13\000"
.LASF3768:
	.ascii	"USART_IT_RTO ((uint32_t)0x000B011A)\000"
.LASF3704:
	.ascii	"USART_DMAOnError_Enable ((uint32_t)0x00000000)\000"
.LASF2827:
	.ascii	"OB_WRP_Pages36to39 ((uint32_t)0x00000200)\000"
.LASF2715:
	.ascii	"IS_DMA_PERIPHERAL_DATA_SIZE(SIZE) (((SIZE) == DMA_P"
	.ascii	"eripheralDataSize_Byte) || ((SIZE) == DMA_Periphera"
	.ascii	"lDataSize_HalfWord) || ((SIZE) == DMA_PeripheralDat"
	.ascii	"aSize_Word))\000"
.LASF1794:
	.ascii	"RTC_ISR_TAMP3F ((uint32_t)0x00008000)\000"
.LASF1755:
	.ascii	"RTC_DR_YU_2 ((uint32_t)0x00040000)\000"
.LASF2671:
	.ascii	"IS_DAC_OUTPUT_BUFFER_STATE(STATE) (((STATE) == DAC_"
	.ascii	"OutputBuffer_Enable) || ((STATE) == DAC_OutputBuffe"
	.ascii	"r_Disable))\000"
.LASF3203:
	.ascii	"RTC_TamperTrigger_RisingEdge ((uint32_t)0x00000000)"
	.ascii	"\000"
.LASF2931:
	.ascii	"EXTI_PinSource4 ((uint8_t)0x04)\000"
.LASF3008:
	.ascii	"I2C_Register_ICR ((uint8_t)0x1C)\000"
.LASF1099:
	.ascii	"FLASH_OBR_nRST_STOP ((uint32_t)0x00000200)\000"
.LASF3153:
	.ascii	"RTC_AlarmMask_Seconds ((uint32_t)0x00000080)\000"
.LASF3390:
	.ascii	"I2S_FLAG_CHSIDE SPI_SR_CHSIDE\000"
.LASF4054:
	.ascii	"CARIBOU_PORTD_AFRL PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF4440:
	.ascii	"stack_usage\000"
.LASF686:
	.ascii	"ADC_IER_EOSIE ADC_IER_EOSEQIE\000"
.LASF990:
	.ascii	"EXTI_EMR_MR23 ((uint32_t)0x00800000)\000"
.LASF2096:
	.ascii	"SYSCFG_CFGR2_PVD_LOCK ((uint32_t)0x00000004)\000"
.LASF534:
	.ascii	"SCB_AIRCR_ENDIANESS_Pos 15\000"
.LASF4225:
	.ascii	"THREAD_FAULT_STACK_UNDERFLOW 0x0002\000"
.LASF155:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF1552:
	.ascii	"RCC_CFGR_PLLMULL_3 ((uint32_t)0x00200000)\000"
.LASF3833:
	.ascii	"RCC_PREDIV1_Div5 RCC_CFGR2_PREDIV1_DIV5\000"
.LASF402:
	.ascii	"INT_FAST16_MAX INT32_MAX\000"
.LASF3659:
	.ascii	"TIM_DMABurstLength_11Bytes TIM_DMABurstLength_11Tra"
	.ascii	"nsfers\000"
.LASF606:
	.ascii	"ADC1_BASE (APBPERIPH_BASE + 0x00012400)\000"
.LASF1743:
	.ascii	"RTC_TR_SU_0 ((uint32_t)0x00000001)\000"
.LASF1081:
	.ascii	"FLASH_SR_EOP ((uint32_t)0x00000020)\000"
.LASF2816:
	.ascii	"IS_FLASH_PROGRAM_ADDRESS(ADDRESS) (((ADDRESS) >= 0x"
	.ascii	"08000000) && ((ADDRESS) <= 0x0800FFFF))\000"
.LASF2969:
	.ascii	"I2C_AnalogFilter_Disable I2C_CR1_ANFOFF\000"
.LASF2044:
	.ascii	"SYSCFG_EXTICR2_EXTI6 ((uint16_t)0x0F00)\000"
.LASF1119:
	.ascii	"GPIO_MODER_MODER1_1 ((uint32_t)0x00000008)\000"
.LASF2776:
	.ascii	"DMA1_FLAG_TE5 DMA_ISR_TEIF5\000"
.LASF2218:
	.ascii	"TIM_CCMR2_CC3S_1 ((uint16_t)0x0002)\000"
.LASF423:
	.ascii	"INTMAX_C(x) (x ##LL)\000"
.LASF2010:
	.ascii	"SPI_I2SPR_MCKOE ((uint16_t)0x0200)\000"
.LASF941:
	.ascii	"DMA_CCR_MEM2MEM ((uint32_t)0x00004000)\000"
.LASF2709:
	.ascii	"DMA_MemoryInc_Disable ((uint32_t)0x00000000)\000"
.LASF1077:
	.ascii	"FLASH_OPTKEY2 ((uint32_t)0xCDEF89AB)\000"
.LASF1560:
	.ascii	"RCC_CFGR_PLLMULL5 ((uint32_t)0x000C0000)\000"
.LASF2015:
	.ascii	"SYSCFG_CFGR1_USART1TX_DMA_RMP ((uint32_t)0x00000200"
	.ascii	")\000"
.LASF88:
	.ascii	"__SIG_ATOMIC_MAX__ 0x7fffffff\000"
.LASF628:
	.ascii	"GPIOC_BASE (AHB2PERIPH_BASE + 0x00000800)\000"
.LASF3037:
	.ascii	"IS_I2C_GET_FLAG(FLAG) (((FLAG) == I2C_FLAG_TXE) || "
	.ascii	"((FLAG) == I2C_FLAG_TXIS) || ((FLAG) == I2C_FLAG_RX"
	.ascii	"NE) || ((FLAG) == I2C_FLAG_ADDR) || ((FLAG) == I2C_"
	.ascii	"FLAG_NACKF) || ((FLAG) == I2C_FLAG_STOPF) || ((FLAG"
	.ascii	") == I2C_FLAG_TC) || ((FLAG) == I2C_FLAG_TCR) || (("
	.ascii	"FLAG) == I2C_FLAG_BERR) || ((FLAG) == I2C_FLAG_ARLO"
	.ascii	") || ((FLAG) == I2C_FLAG_OVR) || ((FLAG) == I2C_FLA"
	.ascii	"G_PECERR) || ((FLAG) == I2C_FLAG_TIMEOUT) || ((FLAG"
	.ascii	") == I2C_FLAG_ALERT) || ((FLAG) == I2C_FLAG_BUSY))\000"
.LASF2767:
	.ascii	"DMA1_FLAG_HT3 DMA_ISR_HTIF3\000"
.LASF1377:
	.ascii	"GPIO_BRR_BR_6 ((uint32_t)0x00000040)\000"
.LASF1345:
	.ascii	"GPIO_LCKR_LCK7 ((uint32_t)0x00000080)\000"
.LASF3373:
	.ascii	"SPI_I2S_IT_ERR ((uint8_t)0x50)\000"
.LASF1962:
	.ascii	"SPI_CR2_NSSP ((uint16_t)0x0008)\000"
.LASF222:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF2577:
	.ascii	"CEC_BitRisingError_On CEC_CFGR_BREGEN\000"
.LASF2956:
	.ascii	"SYSCFG_I2CFastModePlus_PB8 SYSCFG_CFGR1_I2C_FMP_PB8"
	.ascii	"\000"
.LASF3159:
	.ascii	"RTC_AlarmSubSecondMask_All ((uint8_t)0x00)\000"
.LASF2764:
	.ascii	"DMA1_FLAG_TE2 DMA_ISR_TEIF2\000"
.LASF760:
	.ascii	"CEC_CFGR_SFTOPT ((uint32_t)0x00000100)\000"
.LASF198:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF2918:
	.ascii	"GPIO_Speed_2MHz GPIO_Speed_Level_2\000"
.LASF933:
	.ascii	"DMA_CCR_PSIZE_0 ((uint32_t)0x00000100)\000"
.LASF3490:
	.ascii	"TIM_ICSelection_IndirectTI ((uint16_t)0x0002)\000"
.LASF731:
	.ascii	"ADC_CHSELR_CHSEL15 ((uint32_t)0x00008000)\000"
.LASF1304:
	.ascii	"GPIO_ODR_14 ((uint32_t)0x00004000)\000"
.LASF710:
	.ascii	"ADC_CFGR1_EXTSEL_1 ((uint32_t)0x00000080)\000"
.LASF509:
	.ascii	"SCB_CPUID_PARTNO_Msk (0xFFFUL << SCB_CPUID_PARTNO_P"
	.ascii	"os)\000"
.LASF3851:
	.ascii	"RCC_SYSCLK_Div2 RCC_CFGR_HPRE_DIV2\000"
.LASF2007:
	.ascii	"SPI_I2SCFGR_I2SMOD ((uint16_t)0x0800)\000"
.LASF2904:
	.ascii	"GPIO_PinSource13 ((uint8_t)0x0D)\000"
.LASF907:
	.ascii	"DMA_IFCR_CTEIF1 ((uint32_t)0x00000008)\000"
.LASF78:
	.ascii	"__WCHAR_MAX__ 0xffffffffU\000"
.LASF2065:
	.ascii	"SYSCFG_EXTICR3_EXTI11 ((uint16_t)0xF000)\000"
.LASF3632:
	.ascii	"TIM_FLAG_Break ((uint16_t)0x0080)\000"
.LASF1546:
	.ascii	"RCC_CFGR_PLLSRC ((uint32_t)0x00010000)\000"
.LASF4154:
	.ascii	"EBADMSG 74\000"
.LASF3141:
	.ascii	"RTC_Weekday_Saturday ((uint8_t)0x6)\000"
.LASF2699:
	.ascii	"DBGMCU_TIM17_STOP DBGMCU_APB2_FZ_DBG_TIM17_STOP\000"
.LASF374:
	.ascii	"INT16_MIN (-32767-1)\000"
.LASF1258:
	.ascii	"GPIO_PUPDR_PUPDR10_1 ((uint32_t)0x00200000)\000"
.LASF2431:
	.ascii	"USART_TDR_TDR ((uint16_t)0x01FF)\000"
.LASF452:
	.ascii	"NULL 0\000"
.LASF2779:
	.ascii	"IS_DMA_BUFFER_SIZE(SIZE) (((SIZE) >= 0x1) && ((SIZE"
	.ascii	") < 0x10000))\000"
.LASF3047:
	.ascii	"I2C_IT_OVR I2C_ISR_OVR\000"
.LASF1801:
	.ascii	"RTC_ISR_INITF ((uint32_t)0x00000040)\000"
.LASF1472:
	.ascii	"IWDG_SR_WVU ((uint8_t)0x04)\000"
.LASF1795:
	.ascii	"RTC_ISR_TAMP2F ((uint32_t)0x00004000)\000"
.LASF928:
	.ascii	"DMA_CCR_DIR ((uint32_t)0x00000010)\000"
.LASF2990:
	.ascii	"IS_I2C_OWN_ADDRESS2(ADDRESS2) ((ADDRESS2) <= (uint1"
	.ascii	"6_t)0x00FF)\000"
.LASF1583:
	.ascii	"RCC_CFGR_MCO_PLL ((uint32_t)0x07000000)\000"
.LASF3002:
	.ascii	"I2C_Register_CR2 ((uint8_t)0x04)\000"
.LASF3642:
	.ascii	"TIM_OCReferenceClear_OCREFCLR ((uint16_t)0x0000)\000"
.LASF3051:
	.ascii	"IS_I2C_CLEAR_IT(IT) ((((IT) & (uint32_t)0xFFFFC001)"
	.ascii	" == 0x00) && ((IT) != 0x00))\000"
.LASF972:
	.ascii	"EXTI_EMR_MR3 ((uint32_t)0x00000008)\000"
.LASF3935:
	.ascii	"RCC_APB1Periph_PWR RCC_APB1ENR_PWREN\000"
.LASF2559:
	.ascii	"IS_ADC_GET_FLAG(FLAG) (((FLAG) == ADC_FLAG_ADRDY) |"
	.ascii	"| ((FLAG) == ADC_FLAG_EOSMP) || ((FLAG) == ADC_FLAG"
	.ascii	"_EOC) || ((FLAG)== ADC_FLAG_EOSEQ) || ((FLAG) == AD"
	.ascii	"C_FLAG_AWD) || ((FLAG)== ADC_FLAG_OVR) || ((FLAG) ="
	.ascii	"= ADC_FLAG_ADEN) || ((FLAG)== ADC_FLAG_ADDIS) || (("
	.ascii	"FLAG) == ADC_FLAG_ADSTART) || ((FLAG)== ADC_FLAG_AD"
	.ascii	"STP) || ((FLAG) == ADC_FLAG_ADCAL))\000"
.LASF876:
	.ascii	"DBGMCU_APB1_FZ_DBG_RTC_STOP ((uint32_t)0x00000400)\000"
.LASF15:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF1947:
	.ascii	"SPI_CR1_BR_1 ((uint16_t)0x0010)\000"
.LASF3714:
	.ascii	"USART_WakeUpSource_StartBit ((uint32_t)USART_CR3_WU"
	.ascii	"S_1)\000"
.LASF2443:
	.ascii	"WWDG_CFR_W1 ((uint16_t)0x0002)\000"
.LASF563:
	.ascii	"SysTick_VAL_CURRENT_Msk (0xFFFFFFUL << SysTick_VAL_"
	.ascii	"CURRENT_Pos)\000"
.LASF1295:
	.ascii	"GPIO_ODR_5 ((uint32_t)0x00000020)\000"
.LASF1055:
	.ascii	"EXTI_PR_PR5 ((uint32_t)0x00000020)\000"
.LASF1730:
	.ascii	"RTC_TR_MNT_0 ((uint32_t)0x00001000)\000"
.LASF1307:
	.ascii	"GPIO_BSRR_BS_1 ((uint32_t)0x00000002)\000"
.LASF3961:
	.ascii	"RCC_FLAG_HSI14RDY ((uint8_t)0x61)\000"
.LASF159:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF708:
	.ascii	"ADC_CFGR1_EXTSEL ((uint32_t)0x000001C0)\000"
.LASF2073:
	.ascii	"SYSCFG_EXTICR3_EXTI10_PB ((uint16_t)0x0100)\000"
.LASF973:
	.ascii	"EXTI_EMR_MR4 ((uint32_t)0x00000010)\000"
.LASF1884:
	.ascii	"RTC_TSDR_MU ((uint32_t)0x00000F00)\000"
.LASF1759:
	.ascii	"RTC_DR_WDU_1 ((uint32_t)0x00004000)\000"
.LASF3734:
	.ascii	"IS_USART_OVRDETECTION(OVR) (((OVR) == USART_OVRDete"
	.ascii	"ction_Enable)|| ((OVR) == USART_OVRDetection_Disabl"
	.ascii	"e))\000"
.LASF3206:
	.ascii	"RTC_TamperTrigger_HighLevel ((uint32_t)0x00000001)\000"
.LASF1720:
	.ascii	"RTC_TR_PM ((uint32_t)0x00400000)\000"
.LASF616:
	.ascii	"DMA1_Channel1_BASE (DMA1_BASE + 0x00000008)\000"
.LASF2588:
	.ascii	"IS_CEC_ADDRESS(ADDRESS) ((ADDRESS) < 0x10)\000"
.LASF3121:
	.ascii	"IS_RTC_YEAR(YEAR) ((YEAR) <= 99)\000"
.LASF1889:
	.ascii	"RTC_TSDR_DT ((uint32_t)0x00000030)\000"
.LASF3534:
	.ascii	"TIM_DMABurstLength_6Transfers ((uint16_t)0x0500)\000"
.LASF296:
	.ascii	"__DA_FBIT__ 31\000"
.LASF2657:
	.ascii	"IS_COMP_MODE(MODE) (((MODE) == COMP_Mode_UltraLowPo"
	.ascii	"wer) || ((MODE) == COMP_Mode_LowPower) || ((MODE) ="
	.ascii	"= COMP_Mode_MediumSpeed) || ((MODE) == COMP_Mode_Hi"
	.ascii	"ghSpeed))\000"
.LASF1659:
	.ascii	"RCC_BDCR_LSEDRV ((uint32_t)0x00000018)\000"
.LASF4231:
	.ascii	"caribou_wfi() chip_wfi()\000"
.LASF667:
	.ascii	"TSC ((TSC_TypeDef *) TSC_BASE)\000"
.LASF3415:
	.ascii	"TIM_OCMode_Inactive ((uint16_t)0x0020)\000"
.LASF588:
	.ascii	"AHB2PERIPH_BASE (PERIPH_BASE + 0x08000000)\000"
.LASF3922:
	.ascii	"RCC_APB2Periph_TIM16 RCC_APB2ENR_TIM16EN\000"
.LASF1835:
	.ascii	"RTC_ALRMAR_MNU_1 ((uint32_t)0x00000200)\000"
.LASF2482:
	.ascii	"ADC_DMAMode_OneShot ((uint32_t)0x00000000)\000"
.LASF4171:
	.ascii	"EPROTOTYPE 91\000"
.LASF1563:
	.ascii	"RCC_CFGR_PLLMULL8 ((uint32_t)0x00180000)\000"
.LASF3236:
	.ascii	"IS_RTC_SHIFT_ADD1S(SEL) (((SEL) == RTC_ShiftAdd1S_R"
	.ascii	"eset) || ((SEL) == RTC_ShiftAdd1S_Set))\000"
.LASF2036:
	.ascii	"SYSCFG_EXTICR1_EXTI2_PB ((uint16_t)0x0100)\000"
.LASF902:
	.ascii	"DMA_ISR_HTIF5 ((uint32_t)0x00040000)\000"
.LASF3377:
	.ascii	"SPI_I2S_IT_OVR ((uint8_t)0x56)\000"
.LASF67:
	.ascii	"__has_include_next(STR) __has_include_next__(STR)\000"
.LASF4279:
	.ascii	"FP_FTOI 3\000"
.LASF2278:
	.ascii	"TIM_BDTR_DTG_2 ((uint16_t)0x0004)\000"
.LASF418:
	.ascii	"UINT16_C(x) (x ##U)\000"
.LASF1058:
	.ascii	"EXTI_PR_PR8 ((uint32_t)0x00000100)\000"
.LASF4306:
	.ascii	"CARIBOUQUEUE_H \000"
.LASF393:
	.ascii	"UINT_LEAST8_MAX UINT8_MAX\000"
.LASF235:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF1619:
	.ascii	"RCC_APB1RSTR_USART2RST ((uint32_t)0x00020000)\000"
.LASF164:
	.ascii	"__LDBL_MAX__ 1.1\000"
.LASF3683:
	.ascii	"IS_USART_MODE(MODE) ((((MODE) & (uint32_t)0xFFFFFFF"
	.ascii	"3) == 0x00) && ((MODE) != (uint32_t)0x00))\000"
.LASF171:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF3313:
	.ascii	"SPI_BaudRatePrescaler_256 ((uint16_t)0x0038)\000"
.LASF3282:
	.ascii	"SPI_DataSize_6b ((uint16_t)0x0500)\000"
.LASF3982:
	.ascii	"CARIBOU_GPIO_PIN_4 (1<<4)\000"
.LASF161:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF2900:
	.ascii	"GPIO_PinSource9 ((uint8_t)0x09)\000"
.LASF3689:
	.ascii	"USART_Clock_Disable ((uint32_t)0x00000000)\000"
.LASF3381:
	.ascii	"SPI_TransmissionFIFOStatus_1QuarterFull ((uint16_t)"
	.ascii	"0x0800)\000"
.LASF2483:
	.ascii	"ADC_DMAMode_Circular ADC_CFGR1_DMACFG\000"
.LASF1877:
	.ascii	"RTC_TSTR_SU_2 ((uint32_t)0x00000004)\000"
.LASF2849:
	.ascii	"OB_BOOT1_SET ((uint8_t)0x10)\000"
.LASF83:
	.ascii	"__SIZE_MAX__ 0xffffffffU\000"
.LASF2126:
	.ascii	"TIM_SMCR_SMS_0 ((uint16_t)0x0001)\000"
.LASF1800:
	.ascii	"RTC_ISR_INIT ((uint32_t)0x00000080)\000"
.LASF850:
	.ascii	"DAC_DOR1_DACC1DOR ((uint32_t)0x00000FFF)\000"
.LASF1753:
	.ascii	"RTC_DR_YU_0 ((uint32_t)0x00010000)\000"
.LASF3702:
	.ascii	"USART_DMAReq_Rx USART_CR3_DMAR\000"
.LASF1682:
	.ascii	"RCC_AHBRSTR_GPIOARST ((uint32_t)0x00020000)\000"
.LASF2246:
	.ascii	"TIM_CCMR2_IC4PSC_1 ((uint16_t)0x0800)\000"
.LASF3068:
	.ascii	"IWDG_Prescaler_16 ((uint8_t)0x02)\000"
.LASF1633:
	.ascii	"RCC_AHBENR_GPIOFEN ((uint32_t)0x00400000)\000"
.LASF1083:
	.ascii	"FLASH_CR_PER ((uint32_t)0x00000002)\000"
.LASF980:
	.ascii	"EXTI_EMR_MR11 ((uint32_t)0x00000800)\000"
.LASF2259:
	.ascii	"TIM_CCER_CC2NP ((uint16_t)0x0080)\000"
.LASF4213:
	.ascii	"EHWPOISON 133\000"
.LASF3679:
	.ascii	"USART_Parity_Odd ((uint32_t)USART_CR1_PCE | USART_C"
	.ascii	"R1_PS)\000"
.LASF1685:
	.ascii	"RCC_AHBRSTR_GPIODRST ((uint32_t)0x00010000)\000"
.LASF4164:
	.ascii	"EILSEQ 84\000"
.LASF1581:
	.ascii	"RCC_CFGR_MCO_HSI ((uint32_t)0x05000000)\000"
.LASF4331:
	.ascii	"STDIO_STATE_RX_OVERFLOW 0x00000010\000"
.LASF1688:
	.ascii	"RCC_CFGR2_PREDIV1 ((uint32_t)0x0000000F)\000"
.LASF372:
	.ascii	"INT8_MIN (-128)\000"
.LASF1246:
	.ascii	"GPIO_PUPDR_PUPDR6_1 ((uint32_t)0x00002000)\000"
.LASF361:
	.ascii	"__CARIBOU_H__ \000"
.LASF1803:
	.ascii	"RTC_ISR_INITS ((uint32_t)0x00000010)\000"
.LASF3969:
	.ascii	"chip_systick_enter() (SCB->ICSR |= SCB_ICSR_PENDSTC"
	.ascii	"LR_Msk)\000"
.LASF4101:
	.ascii	"EISDIR 21\000"
.LASF3403:
	.ascii	"IS_TIM_LIST2_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM15)|| ((PERIPH) == TIM16)|| ((PERIP"
	.ascii	"H) == TIM17))\000"
.LASF572:
	.ascii	"SysTick_BASE (SCS_BASE + 0x0010UL)\000"
.LASF4168:
	.ascii	"ENOTSOCK 88\000"
.LASF1026:
	.ascii	"EXTI_FTSR_TR14 ((uint32_t)0x00004000)\000"
.LASF514:
	.ascii	"SCB_ICSR_PENDSVSET_Pos 28\000"
.LASF3975:
	.ascii	"chip_gpio_port_t GPIO_TypeDef*\000"
.LASF1338:
	.ascii	"GPIO_LCKR_LCK0 ((uint32_t)0x00000001)\000"
.LASF2810:
	.ascii	"FLASH_Latency_0 ((uint32_t)0x00000000)\000"
.LASF2173:
	.ascii	"TIM_EGR_CC1G ((uint8_t)0x02)\000"
.LASF4125:
	.ascii	"EL2NSYNC 45\000"
.LASF892:
	.ascii	"DMA_ISR_GIF3 ((uint32_t)0x00000100)\000"
.LASF52:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF2659:
	.ascii	"COMP_OutputLevel_Low ((uint32_t)0x00000000)\000"
.LASF1592:
	.ascii	"RCC_CIR_LSERDYIE ((uint32_t)0x00000200)\000"
.LASF1311:
	.ascii	"GPIO_BSRR_BS_5 ((uint32_t)0x00000020)\000"
.LASF4166:
	.ascii	"ESTRPIPE 86\000"
.LASF3988:
	.ascii	"CARIBOU_GPIO_PIN_10 (1<<10)\000"
.LASF753:
	.ascii	"CEC_CR_TXEOM ((uint32_t)0x00000004)\000"
.LASF368:
	.ascii	"_CARIBOU_TYPES_H_ \000"
.LASF196:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF1355:
	.ascii	"GPIO_AFRL_AFRL0 ((uint32_t)0x0000000F)\000"
.LASF30:
	.ascii	"__GNUG__ 5\000"
.LASF3349:
	.ascii	"I2S_CPOL_High SPI_I2SCFGR_CKPOL\000"
.LASF2843:
	.ascii	"OB_STOP_RST ((uint8_t)0x00)\000"
.LASF3737:
	.ascii	"USART_Request_MMRQ USART_RQR_MMRQ\000"
.LASF942:
	.ascii	"DMA_CNDTR_NDT ((uint32_t)0x0000FFFF)\000"
.LASF4062:
	.ascii	"CARIBOUTIMER_H \000"
.LASF2276:
	.ascii	"TIM_BDTR_DTG_0 ((uint16_t)0x0001)\000"
.LASF2320:
	.ascii	"USART_CR1_WAKE ((uint32_t)0x00000800)\000"
.LASF1644:
	.ascii	"RCC_APB1ENR_TIM2EN ((uint32_t)0x00000001)\000"
.LASF590:
	.ascii	"TIM3_BASE (APBPERIPH_BASE + 0x00000400)\000"
.LASF3636:
	.ascii	"TIM_FLAG_CC4OF ((uint16_t)0x1000)\000"
.LASF1397:
	.ascii	"I2C_CR1_SWRST ((uint32_t)0x00002000)\000"
.LASF1001:
	.ascii	"EXTI_RTSR_TR8 ((uint32_t)0x00000100)\000"
.LASF4097:
	.ascii	"EEXIST 17\000"
.LASF2832:
	.ascii	"OB_WRP_Pages56to59 ((uint32_t)0x00004000)\000"
.LASF881:
	.ascii	"DBGMCU_APB2_FZ_DBG_TIM15_STOP ((uint32_t)0x00010000"
	.ascii	")\000"
.LASF4260:
	.ascii	"ROOT_2 1.4142135623730950488\000"
.LASF3780:
	.ascii	"IS_USART_CONFIG_IT(IT) (((IT) == USART_IT_PE) || (("
	.ascii	"IT) == USART_IT_TXE) || ((IT) == USART_IT_TC) || (("
	.ascii	"IT) == USART_IT_RXNE) || ((IT) == USART_IT_IDLE) ||"
	.ascii	" ((IT) == USART_IT_LBD) || ((IT) == USART_IT_CTS) |"
	.ascii	"| ((IT) == USART_IT_ERR) || ((IT) == USART_IT_RTO) "
	.ascii	"|| ((IT) == USART_IT_EOB) || ((IT) == USART_IT_CM) "
	.ascii	"|| ((IT) == USART_IT_WU))\000"
.LASF771:
	.ascii	"CEC_ISR_RXACKE ((uint32_t)0x00000040)\000"
.LASF2357:
	.ascii	"USART_CR2_ABRMODE_0 ((uint32_t)0x00200000)\000"
.LASF2045:
	.ascii	"SYSCFG_EXTICR2_EXTI7 ((uint16_t)0xF000)\000"
.LASF162:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF3991:
	.ascii	"CARIBOU_GPIO_PIN_13 (1<<13)\000"
.LASF2989:
	.ascii	"IS_I2C_SLAVE_ADDRESS(ADDRESS) ((ADDRESS) <= (uint16"
	.ascii	"_t)0x03FF)\000"
.LASF2361:
	.ascii	"USART_CR3_EIE ((uint32_t)0x00000001)\000"
.LASF4111:
	.ascii	"EMLINK 31\000"
.LASF3314:
	.ascii	"IS_SPI_BAUDRATE_PRESCALER(PRESCALER) (((PRESCALER) "
	.ascii	"== SPI_BaudRatePrescaler_2) || ((PRESCALER) == SPI_"
	.ascii	"BaudRatePrescaler_4) || ((PRESCALER) == SPI_BaudRat"
	.ascii	"ePrescaler_8) || ((PRESCALER) == SPI_BaudRatePresca"
	.ascii	"ler_16) || ((PRESCALER) == SPI_BaudRatePrescaler_32"
	.ascii	") || ((PRESCALER) == SPI_BaudRatePrescaler_64) || ("
	.ascii	"(PRESCALER) == SPI_BaudRatePrescaler_128) || ((PRES"
	.ascii	"CALER) == SPI_BaudRatePrescaler_256))\000"
.LASF2499:
	.ascii	"ADC_AnalogWatchdog_Channel_14 ((uint32_t)0x38000000"
	.ascii	")\000"
.LASF1007:
	.ascii	"EXTI_RTSR_TR14 ((uint32_t)0x00004000)\000"
.LASF141:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF334:
	.ascii	"__APCS_32__ 1\000"
.LASF2528:
	.ascii	"ADC_Channel_13 ADC_CHSELR_CHSEL13\000"
.LASF4091:
	.ascii	"EAGAIN 11\000"
.LASF3967:
	.ascii	"isr_enter() __asm ( \"\011push\011{lr}\011\011\011\\"
	.ascii	"n\" \"\011push\011{r4-r7}\011\011\011\\n\" \"\011mo"
	.ascii	"v\011\011r4,r8\011\011\011\\n\" \"\011mov\011\011r5"
	.ascii	",r9\011\011\011\\n\" \"\011mov\011\011r6,r10\011\011"
	.ascii	"\011\\n\" \"\011mov\011\011r7,r11\011\011\011\\n\" "
	.ascii	"\"\011push\011{r4-r7}\011\011\011\\n\" )\000"
.LASF2690:
	.ascii	"DBGMCU_TIM14_STOP DBGMCU_APB1_FZ_DBG_TIM14_STOP\000"
.LASF1087:
	.ascii	"FLASH_CR_STRT ((uint32_t)0x00000040)\000"
.LASF3050:
	.ascii	"I2C_IT_ALERT I2C_ISR_ALERT\000"
.LASF3717:
	.ascii	"USART_LINBreakDetectLength_10b ((uint32_t)0x0000000"
	.ascii	"0)\000"
.LASF573:
	.ascii	"NVIC_BASE (SCS_BASE + 0x0100UL)\000"
.LASF2506:
	.ascii	"ADC_SampleTime_7_5Cycles ((uint32_t)0x00000001)\000"
.LASF3393:
	.ascii	"SPI_FLAG_MODF SPI_SR_MODF\000"
.LASF3345:
	.ascii	"I2S_AudioFreq_8k ((uint32_t)8000)\000"
.LASF653:
	.ascii	"TIM15 ((TIM_TypeDef *) TIM15_BASE)\000"
.LASF1269:
	.ascii	"GPIO_PUPDR_PUPDR14_0 ((uint32_t)0x10000000)\000"
.LASF2090:
	.ascii	"SYSCFG_EXTICR4_EXTI14_PC ((uint16_t)0x0200)\000"
.LASF250:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF4178:
	.ascii	"EADDRINUSE 98\000"
.LASF2914:
	.ascii	"GPIO_AF_6 ((uint8_t)0x06)\000"
.LASF4077:
	.ascii	"ENOMEM 0x05\000"
.LASF1168:
	.ascii	"GPIO_OTYPER_OT_6 ((uint32_t)0x00000040)\000"
.LASF3994:
	.ascii	"CARIBOU_GPIO_PIN_16 (1<<16)\000"
.LASF4223:
	.ascii	"CARIBOU_THREAD_F_IDLE_MASK (CARIBOU_THREAD_F_YIELD "
	.ascii	"| CARIBOU_THREAD_F_TERMINATED)\000"
.LASF1508:
	.ascii	"RCC_CFGR_SW ((uint32_t)0x00000003)\000"
.LASF4046:
	.ascii	"CARIBOU_PORTC_OSPEEDR PIN_OSPEEDR(0,GPIO_Speed_2MHz"
	.ascii	") | PIN_OSPEEDR(1,GPIO_Speed_2MHz) | PIN_OSPEEDR(2,"
	.ascii	"GPIO_Speed_2MHz) | PIN_OSPEEDR(3,GPIO_Speed_2MHz) |"
	.ascii	" PIN_OSPEEDR(4,GPIO_Speed_2MHz) | PIN_OSPEEDR(5,GPI"
	.ascii	"O_Speed_2MHz) | PIN_OSPEEDR(6,GPIO_Speed_2MHz) | PI"
	.ascii	"N_OSPEEDR(7,GPIO_Speed_2MHz) | PIN_OSPEEDR(8,GPIO_S"
	.ascii	"peed_2MHz) | PIN_OSPEEDR(9,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(10,GPIO_Speed_2MHz) | PIN_OSPEEDR(11,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(12,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(13,GPIO_Speed_2MHz) | PIN_OSPEEDR(14,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(15,GPIO_Speed_2MHz)\000"
.LASF3739:
	.ascii	"USART_Request_TXFRQ USART_RQR_TXFRQ\000"
.LASF112:
	.ascii	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL\000"
.LASF3494:
	.ascii	"TIM_ICPSC_DIV2 ((uint16_t)0x0004)\000"
.LASF1745:
	.ascii	"RTC_TR_SU_2 ((uint32_t)0x00000004)\000"
.LASF2116:
	.ascii	"TIM_CR2_MMS_2 ((uint16_t)0x0040)\000"
.LASF4027:
	.ascii	"PIN_PUPDR(n,pupdr) ((pupdr&0x3)<<(n*2))\000"
.LASF1869:
	.ascii	"RTC_TSTR_MNU_3 ((uint32_t)0x00000800)\000"
.LASF2484:
	.ascii	"IS_ADC_DMA_MODE(MODE) (((MODE) == ADC_DMAMode_OneSh"
	.ascii	"ot) || ((MODE) == ADC_DMAMode_Circular))\000"
.LASF352:
	.ascii	"__CROSSWORKS_REVISION 4\000"
.LASF1273:
	.ascii	"GPIO_PUPDR_PUPDR15_1 ((uint32_t)0x80000000)\000"
.LASF1260:
	.ascii	"GPIO_PUPDR_PUPDR11_0 ((uint32_t)0x00400000)\000"
.LASF4243:
	.ascii	"caribou_vector_unpend(vector) chip_vector_unpend(ve"
	.ascii	"ctor)\000"
.LASF915:
	.ascii	"DMA_IFCR_CTEIF3 ((uint32_t)0x00000800)\000"
.LASF698:
	.ascii	"ADC_CFGR1_AWDEN ((uint32_t)0x00800000)\000"
.LASF1566:
	.ascii	"RCC_CFGR_PLLMULL11 ((uint32_t)0x00240000)\000"
.LASF914:
	.ascii	"DMA_IFCR_CHTIF3 ((uint32_t)0x00000400)\000"
.LASF2151:
	.ascii	"TIM_DIER_TIE ((uint16_t)0x0040)\000"
.LASF468:
	.ascii	"_CARIBOU_VECTORS_H_ \000"
.LASF3453:
	.ascii	"TIM_CCx_Enable ((uint16_t)0x0001)\000"
.LASF211:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF3015:
	.ascii	"I2C_IT_STOPI I2C_CR1_STOPIE\000"
.LASF3500:
	.ascii	"TIM_IT_CC2 ((uint16_t)0x0004)\000"
.LASF1182:
	.ascii	"GPIO_OSPEEDER_OSPEEDR1_0 ((uint32_t)0x00000004)\000"
.LASF130:
	.ascii	"__FLT_DIG__ 6\000"
.LASF2139:
	.ascii	"TIM_SMCR_ETF_3 ((uint16_t)0x0800)\000"
.LASF550:
	.ascii	"SCB_SHCSR_SVCALLPENDED_Pos 15\000"
.LASF3239:
	.ascii	"RTC_BKP_DR1 ((uint32_t)0x00000001)\000"
.LASF3480:
	.ascii	"TIM_OCIdleState_Reset ((uint16_t)0x0000)\000"
.LASF1206:
	.ascii	"GPIO_OSPEEDER_OSPEEDR9_0 ((uint32_t)0x00040000)\000"
.LASF3672:
	.ascii	"IS_USART_WORD_LENGTH(LENGTH) (((LENGTH) == USART_Wo"
	.ascii	"rdLength_8b) || ((LENGTH) == USART_WordLength_9b))\000"
.LASF1559:
	.ascii	"RCC_CFGR_PLLMULL4 ((uint32_t)0x00080000)\000"
.LASF4346:
	.ascii	"chip_adc_value_t uint16_t\000"
.LASF1976:
	.ascii	"SPI_SR_TXE ((uint16_t)0x0002)\000"
.LASF348:
	.ascii	"__SHORT_DOUBLES 1\000"
.LASF1306:
	.ascii	"GPIO_BSRR_BS_0 ((uint32_t)0x00000001)\000"
.LASF1046:
	.ascii	"EXTI_SWIER_SWIER15 ((uint32_t)0x00008000)\000"
.LASF2265:
	.ascii	"TIM_CCER_CC4P ((uint16_t)0x2000)\000"
.LASF2803:
	.ascii	"EXTI_Line22 ((uint32_t)0x00400000)\000"
.LASF1124:
	.ascii	"GPIO_MODER_MODER3_0 ((uint32_t)0x00000040)\000"
.LASF3493:
	.ascii	"TIM_ICPSC_DIV1 ((uint16_t)0x0000)\000"
.LASF3011:
	.ascii	"I2C_Register_TXDR ((uint8_t)0x28)\000"
.LASF2541:
	.ascii	"ADC_IT_EOSEQ ADC_IER_EOSEQIE\000"
.LASF1747:
	.ascii	"RTC_DR_YT ((uint32_t)0x00F00000)\000"
.LASF944:
	.ascii	"DMA_CMAR_MA ((uint32_t)0xFFFFFFFF)\000"
.LASF2946:
	.ascii	"SYSCFG_MemoryRemap_SRAM ((uint8_t)0x03)\000"
.LASF478:
	.ascii	"LSE_VALUE ((uint32_t)32768)\000"
.LASF4357:
	.ascii	"CARIBOU_ADC_Channel_9 ((uint8_t)0x09)\000"
.LASF2752:
	.ascii	"DMA1_IT_TC5 DMA_ISR_TCIF5\000"
.LASF2759:
	.ascii	"DMA1_FLAG_HT1 DMA_ISR_HTIF1\000"
.LASF1675:
	.ascii	"RCC_CSR_OBL ((uint32_t)0x02000000)\000"
.LASF355:
	.ascii	"USE_STDPERIPH_DRIVER 1\000"
.LASF2470:
	.ascii	"ADC_ExternalTrigConv_T1_TRGO ((uint32_t)0x00000000)"
	.ascii	"\000"
.LASF2476:
	.ascii	"ADC_DataAlign_Right ((uint32_t)0x00000000)\000"
.LASF2165:
	.ascii	"TIM_SR_COMIF ((uint16_t)0x0020)\000"
.LASF3865:
	.ascii	"IS_RCC_PCLK(PCLK) (((PCLK) == RCC_HCLK_Div1) || ((P"
	.ascii	"CLK) == RCC_HCLK_Div2) || ((PCLK) == RCC_HCLK_Div4)"
	.ascii	" || ((PCLK) == RCC_HCLK_Div8) || ((PCLK) == RCC_HCL"
	.ascii	"K_Div16))\000"
.LASF824:
	.ascii	"COMP_CSR_COMP2HYST ((uint32_t)0x30000000)\000"
.LASF4391:
	.ascii	"chip_spi_word_t uint16_t\000"
.LASF3232:
	.ascii	"RTC_OutputType_PushPull ((uint32_t)0x00040000)\000"
.LASF2598:
	.ascii	"CEC_IT_BRE CEC_IER_BREIEIE\000"
.LASF2024:
	.ascii	"SYSCFG_EXTICR1_EXTI1 ((uint16_t)0x00F0)\000"
.LASF1922:
	.ascii	"RTC_TAFCR_TAMPFREQ_2 ((uint32_t)0x00000400)\000"
.LASF4136:
	.ascii	"EBADRQC 56\000"
.LASF2448:
	.ascii	"WWDG_CFR_W6 ((uint16_t)0x0040)\000"
.LASF3437:
	.ascii	"TIM_CounterMode_CenterAligned1 ((uint16_t)0x0020)\000"
.LASF3538:
	.ascii	"TIM_DMABurstLength_10Transfers ((uint16_t)0x0900)\000"
.LASF3099:
	.ascii	"PWR_STOPEntry_WFI ((uint8_t)0x01)\000"
.LASF3784:
	.ascii	"IS_USART_DE_ASSERTION_DEASSERTION_TIME(TIME) ((TIME"
	.ascii	") <= 0x1F)\000"
.LASF376:
	.ascii	"UINT32_MAX 4294967295UL\000"
.LASF1101:
	.ascii	"FLASH_OBR_nBOOT1 ((uint32_t)0x00001000)\000"
.LASF4325:
	.ascii	"CARIBOUSTDDEF_H \000"
.LASF2740:
	.ascii	"DMA1_IT_TC2 DMA_ISR_TCIF2\000"
.LASF461:
	.ascii	"LONG_MAX (0x7FFFFFFFFFFFFFFF)\000"
.LASF643:
	.ascii	"DAC ((DAC_TypeDef *) DAC_BASE)\000"
.LASF2574:
	.ascii	"CEC_StopReception_On CEC_CFGR_BRESTP\000"
.LASF1783:
	.ascii	"RTC_CR_ADD1H ((uint32_t)0x00010000)\000"
.LASF58:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF4088:
	.ascii	"ENOEXEC 8\000"
.LASF2589:
	.ascii	"CEC_IT_TXACKE CEC_IER_TXACKEIE\000"
.LASF1636:
	.ascii	"RCC_APB2ENR_ADC1EN ((uint32_t)0x00000200)\000"
.LASF2182:
	.ascii	"TIM_CCMR1_CC1S_1 ((uint16_t)0x0002)\000"
.LASF1778:
	.ascii	"RTC_CR_OSEL_1 ((uint32_t)0x00400000)\000"
.LASF1828:
	.ascii	"RTC_ALRMAR_MSK2 ((uint32_t)0x00008000)\000"
.LASF3358:
	.ascii	"SPI_LastDMATransfer_TxOddRxEven ((uint16_t)0x4000)\000"
.LASF101:
	.ascii	"__INT16_C(c) c\000"
.LASF98:
	.ascii	"__INT_LEAST8_MAX__ 0x7f\000"
.LASF4108:
	.ascii	"ENOSPC 28\000"
.LASF2098:
	.ascii	"TIM_CR1_CEN ((uint16_t)0x0001)\000"
.LASF1086:
	.ascii	"FLASH_CR_OPTER ((uint32_t)0x00000020)\000"
.LASF3919:
	.ascii	"RCC_APB2Periph_SPI1 RCC_APB2ENR_SPI1EN\000"
.LASF2517:
	.ascii	"ADC_Channel_2 ADC_CHSELR_CHSEL2\000"
.LASF4137:
	.ascii	"EBADSLT 57\000"
.LASF1211:
	.ascii	"GPIO_OSPEEDER_OSPEEDR11 ((uint32_t)0x00C00000)\000"
.LASF916:
	.ascii	"DMA_IFCR_CGIF4 ((uint32_t)0x00001000)\000"
.LASF2252:
	.ascii	"TIM_CCER_CC1E ((uint16_t)0x0001)\000"
.LASF4007:
	.ascii	"CARIBOU_GPIO_PIN_29 (1<<29)\000"
.LASF4290:
	.ascii	"FP_TRIG 14\000"
.LASF511:
	.ascii	"SCB_CPUID_REVISION_Msk (0xFUL << SCB_CPUID_REVISION"
	.ascii	"_Pos)\000"
.LASF1603:
	.ascii	"RCC_CIR_CSSC ((uint32_t)0x00800000)\000"
.LASF3959:
	.ascii	"RCC_FLAG_WWDGRST ((uint8_t)0x5E)\000"
.LASF3760:
	.ascii	"USART_FLAG_NE USART_ISR_NE\000"
.LASF3954:
	.ascii	"RCC_FLAG_OBLRST ((uint8_t)0x59)\000"
.LASF2737:
	.ascii	"DMA1_IT_HT1 DMA_ISR_HTIF1\000"
.LASF1822:
	.ascii	"RTC_ALRMAR_HT_1 ((uint32_t)0x00200000)\000"
.LASF2891:
	.ascii	"GPIO_PinSource0 ((uint8_t)0x00)\000"
.LASF3970:
	.ascii	"chip_systick_exit() \000"
.LASF2288:
	.ascii	"TIM_BDTR_OSSR ((uint16_t)0x0800)\000"
.LASF20:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF4313:
	.ascii	"CARIBOU_RAND_H \000"
.LASF1104:
	.ascii	"FLASH_OBR_VDDA_ANALOG FLASH_OBR_VDDA_MONITOR\000"
.LASF3619:
	.ascii	"TIM_SlaveMode_Trigger ((uint16_t)0x0006)\000"
.LASF535:
	.ascii	"SCB_AIRCR_ENDIANESS_Msk (1UL << SCB_AIRCR_ENDIANESS"
	.ascii	"_Pos)\000"
.LASF3279:
	.ascii	"IS_SPI_MODE(MODE) (((MODE) == SPI_Mode_Master) || ("
	.ascii	"(MODE) == SPI_Mode_Slave))\000"
.LASF2565:
	.ascii	"CEC_SignalFreeTime_4T ((uint32_t)0x00000004)\000"
.LASF4250:
	.ascii	"CARIBOU_MUTEX_INIT(thread,flags) {thread,0,flags,0}"
	.ascii	"\000"
.LASF3128:
	.ascii	"RTC_Month_July ((uint8_t)0x07)\000"
.LASF62:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF4302:
	.ascii	"SIGFPE 108\000"
.LASF3635:
	.ascii	"TIM_FLAG_CC3OF ((uint16_t)0x0800)\000"
.LASF974:
	.ascii	"EXTI_EMR_MR5 ((uint32_t)0x00000020)\000"
.LASF3658:
	.ascii	"TIM_DMABurstLength_10Bytes TIM_DMABurstLength_10Tra"
	.ascii	"nsfers\000"
.LASF1487:
	.ascii	"PWR_CR_PLS_LEV4 ((uint16_t)0x0080)\000"
.LASF1475:
	.ascii	"PWR_CR_PDDS ((uint16_t)0x0002)\000"
.LASF31:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF3346:
	.ascii	"I2S_AudioFreq_Default ((uint32_t)2)\000"
.LASF407:
	.ascii	"UINT_FAST32_MAX UINT32_MAX\000"
.LASF1322:
	.ascii	"GPIO_BSRR_BR_0 ((uint32_t)0x00010000)\000"
.LASF1595:
	.ascii	"RCC_CIR_PLLRDYIE ((uint32_t)0x00001000)\000"
.LASF4321:
	.ascii	"_INTSIZEOF(n) ( (sizeof(n) + sizeof(int) - 1) & ~(s"
	.ascii	"izeof(int) - 1) )\000"
.LASF138:
	.ascii	"__FLT_EPSILON__ 1.1\000"
.LASF3422:
	.ascii	"TIM_OPMode_Repetitive ((uint16_t)0x0000)\000"
.LASF2002:
	.ascii	"SPI_I2SCFGR_PCMSYNC ((uint16_t)0x0080)\000"
.LASF2000:
	.ascii	"SPI_I2SCFGR_I2SSTD_0 ((uint16_t)0x0010)\000"
.LASF165:
	.ascii	"__LDBL_MIN__ 1.1\000"
.LASF4165:
	.ascii	"ERESTART 85\000"
.LASF1926:
	.ascii	"RTC_TAFCR_TAMP2EDGE ((uint32_t)0x00000010)\000"
.LASF3944:
	.ascii	"RCC_MCOSource_HSI ((uint8_t)0x05)\000"
.LASF3319:
	.ascii	"I2S_Mode_SlaveRx ((uint16_t)0x0100)\000"
.LASF2912:
	.ascii	"GPIO_AF_4 ((uint8_t)0x04)\000"
.LASF1944:
	.ascii	"SPI_CR1_MSTR ((uint16_t)0x0004)\000"
.LASF4358:
	.ascii	"CARIBOU_ADC_Channel_10 ((uint8_t)0x0A)\000"
.LASF1150:
	.ascii	"GPIO_MODER_MODER12 ((uint32_t)0x03000000)\000"
.LASF3062:
	.ascii	"__STM32F0XX_IWDG_H \000"
.LASF2868:
	.ascii	"IS_GPIO_OTYPE(OTYPE) (((OTYPE) == GPIO_OType_PP) ||"
	.ascii	" ((OTYPE) == GPIO_OType_OD))\000"
.LASF750:
	.ascii	"ADC_CCR_VREFEN ((uint32_t)0x00400000)\000"
.LASF1840:
	.ascii	"RTC_ALRMAR_ST_0 ((uint32_t)0x00000010)\000"
.LASF1069:
	.ascii	"FLASH_ACR_LATENCY ((uint32_t)0x00000001)\000"
.LASF680:
	.ascii	"ADC_IER_AWDIE ((uint32_t)0x00000080)\000"
.LASF1724:
	.ascii	"RTC_TR_HU ((uint32_t)0x000F0000)\000"
.LASF3079:
	.ascii	"IS_IWDG_WINDOW_VALUE(VALUE) ((VALUE) <= 0xFFF)\000"
.LASF1363:
	.ascii	"GPIO_AFRH_AFRH0 ((uint32_t)0x0000000F)\000"
.LASF1772:
	.ascii	"RTC_DR_DU_1 ((uint32_t)0x00000002)\000"
.LASF3391:
	.ascii	"I2S_FLAG_UDR SPI_SR_UDR\000"
.LASF2595:
	.ascii	"CEC_IT_RXACKE CEC_IER_RXACKEIE\000"
.LASF3049:
	.ascii	"I2C_IT_TIMEOUT I2C_ISR_TIMEOUT\000"
.LASF3162:
	.ascii	"RTC_AlarmSubSecondMask_SS14_3 ((uint8_t)0x03)\000"
.LASF3283:
	.ascii	"SPI_DataSize_7b ((uint16_t)0x0600)\000"
.LASF480:
	.ascii	"__STM32F0XX_STDPERIPH_VERSION_SUB1 (0x00)\000"
.LASF1347:
	.ascii	"GPIO_LCKR_LCK9 ((uint32_t)0x00000200)\000"
.LASF2440:
	.ascii	"WWDG_CR_WDGA ((uint8_t)0x80)\000"
.LASF180:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF2346:
	.ascii	"USART_CR2_STOP ((uint32_t)0x00003000)\000"
.LASF3622:
	.ascii	"TIM_MasterSlaveMode_Enable ((uint16_t)0x0080)\000"
.LASF3662:
	.ascii	"TIM_DMABurstLength_14Bytes TIM_DMABurstLength_14Tra"
	.ascii	"nsfers\000"
.LASF2967:
	.ascii	"IS_I2C_1_PERIPH(PERIPH) ((PERIPH) == I2C1)\000"
.LASF1019:
	.ascii	"EXTI_FTSR_TR7 ((uint32_t)0x00000080)\000"
.LASF2935:
	.ascii	"EXTI_PinSource8 ((uint8_t)0x08)\000"
.LASF1661:
	.ascii	"RCC_BDCR_LSEDRV_1 ((uint32_t)0x00000010)\000"
.LASF4476:
	.ascii	"__aeabi_EILSEQ\000"
.LASF3972:
	.ascii	"chip_pendsv_exit() \000"
.LASF299:
	.ascii	"__TA_IBIT__ 64\000"
.LASF1091:
	.ascii	"FLASH_CR_EOPIE ((uint32_t)0x00001000)\000"
.LASF657:
	.ascii	"DMA1 ((DMA_TypeDef *) DMA1_BASE)\000"
.LASF300:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF963:
	.ascii	"EXTI_IMR_MR19 ((uint32_t)0x00080000)\000"
.LASF3466:
	.ascii	"TIM_AutomaticOutput_Disable ((uint16_t)0x0000)\000"
.LASF3471:
	.ascii	"TIM_LOCKLevel_3 ((uint16_t)0x0300)\000"
.LASF3577:
	.ascii	"TIM_PSCReloadMode_Update ((uint16_t)0x0000)\000"
.LASF1310:
	.ascii	"GPIO_BSRR_BS_4 ((uint32_t)0x00000010)\000"
.LASF1340:
	.ascii	"GPIO_LCKR_LCK2 ((uint32_t)0x00000004)\000"
.LASF3225:
	.ascii	"RTC_TamperPrechargeDuration_8RTCCLK ((uint32_t)0x00"
	.ascii	"006000)\000"
.LASF3910:
	.ascii	"RCC_AHBPeriph_CRC RCC_AHBENR_CRCEN\000"
.LASF2533:
	.ascii	"ADC_Channel_18 ADC_CHSELR_CHSEL18\000"
.LASF2176:
	.ascii	"TIM_EGR_CC4G ((uint8_t)0x10)\000"
.LASF1660:
	.ascii	"RCC_BDCR_LSEDRV_0 ((uint32_t)0x00000008)\000"
.LASF1978:
	.ascii	"SPI_SR_UDR ((uint16_t)0x0008)\000"
.LASF1683:
	.ascii	"RCC_AHBRSTR_GPIOBRST ((uint32_t)0x00040000)\000"
.LASF2339:
	.ascii	"USART_CR2_ADDM7 ((uint32_t)0x00000010)\000"
.LASF1524:
	.ascii	"RCC_CFGR_HPRE_3 ((uint32_t)0x00000080)\000"
.LASF553:
	.ascii	"SysTick_CTRL_COUNTFLAG_Msk (1UL << SysTick_CTRL_COU"
	.ascii	"NTFLAG_Pos)\000"
.LASF4008:
	.ascii	"CARIBOU_GPIO_PIN_30 (1<<30)\000"
.LASF2960:
	.ascii	"SYSCFG_Break_SRAMParity SYSCFG_CFGR2_SRAM_PARITY_LO"
	.ascii	"CK\000"
.LASF75:
	.ascii	"__INT_MAX__ 0x7fffffff\000"
.LASF382:
	.ascii	"INTMAX_MIN (-9223372036854775807LL-1)\000"
.LASF4188:
	.ascii	"ESHUTDOWN 108\000"
.LASF1309:
	.ascii	"GPIO_BSRR_BS_3 ((uint32_t)0x00000008)\000"
.LASF412:
	.ascii	"INTPTR_MIN INT32_MIN\000"
.LASF3627:
	.ascii	"TIM_FLAG_CC2 ((uint16_t)0x0004)\000"
.LASF4233:
	.ascii	"caribou_interrupts_disable() chip_interrupts_disabl"
	.ascii	"e()\000"
.LASF2297:
	.ascii	"TIM_DCR_DBA_3 ((uint16_t)0x0008)\000"
.LASF3017:
	.ascii	"I2C_IT_ADDRI I2C_CR1_ADDRIE\000"
.LASF828:
	.ascii	"COMP_CSR_COMP2LOCK ((uint32_t)0x80000000)\000"
.LASF684:
	.ascii	"ADC_IER_EOSMPIE ((uint32_t)0x00000002)\000"
.LASF3276:
	.ascii	"IS_SPI_DIRECTION_MODE(MODE) (((MODE) == SPI_Directi"
	.ascii	"on_2Lines_FullDuplex) || ((MODE) == SPI_Direction_2"
	.ascii	"Lines_RxOnly) || ((MODE) == SPI_Direction_1Line_Rx)"
	.ascii	" || ((MODE) == SPI_Direction_1Line_Tx))\000"
.LASF1079:
	.ascii	"FLASH_SR_PGERR ((uint32_t)0x00000004)\000"
.LASF4451:
	.ascii	"__errno\000"
.LASF2938:
	.ascii	"EXTI_PinSource11 ((uint8_t)0x0B)\000"
.LASF1449:
	.ascii	"I2C_ISR_BUSY ((uint32_t)0x00008000)\000"
.LASF332:
	.ascii	"__arm__ 1\000"
.LASF4316:
	.ascii	"DECL_STATIC_CARIBOU_SEMAPHORE(SEMAPHORE,COUNT) DECL"
	.ascii	"_STATIC_CARIBOU_QUEUE(SEMAPHORE ## queue); static c"
	.ascii	"aribou_semaphore_t SEMAPHORE={COUNT,&SEMAPHORE ## q"
	.ascii	"ueue}\000"
.LASF833:
	.ascii	"CRC_CR_REV_IN_0 ((uint32_t)0x00000020)\000"
.LASF477:
	.ascii	"LSI_VALUE ((uint32_t)40000)\000"
.LASF1604:
	.ascii	"RCC_APB2RSTR_SYSCFGRST ((uint32_t)0x00000001)\000"
.LASF110:
	.ascii	"__UINT_LEAST32_MAX__ 0xffffffffUL\000"
.LASF1728:
	.ascii	"RTC_TR_HU_3 ((uint32_t)0x00080000)\000"
.LASF207:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF3820:
	.ascii	"RCC_PLLMul_9 RCC_CFGR_PLLMULL9\000"
.LASF1901:
	.ascii	"RTC_CAL_CALM ((uint32_t)0x000001FF)\000"
.LASF4345:
	.ascii	"chip_adc_channel_t uint16_t\000"
.LASF3909:
	.ascii	"RCC_AHBPeriph_TS RCC_AHBENR_TSEN\000"
.LASF607:
	.ascii	"ADC_BASE (APBPERIPH_BASE + 0x00012708)\000"
.LASF169:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF2057:
	.ascii	"SYSCFG_EXTICR2_EXTI6_PF ((uint16_t)0x0300)\000"
.LASF1431:
	.ascii	"I2C_TIMEOUTR_TIDLE ((uint32_t)0x00001000)\000"
.LASF891:
	.ascii	"DMA_ISR_TEIF2 ((uint32_t)0x00000080)\000"
.LASF2830:
	.ascii	"OB_WRP_Pages48to51 ((uint32_t)0x00001000)\000"
.LASF2469:
	.ascii	"IS_ADC_EXT_TRIG_EDGE(EDGE) (((EDGE) == ADC_External"
	.ascii	"TrigConvEdge_None) || ((EDGE) == ADC_ExternalTrigCo"
	.ascii	"nvEdge_Rising) || ((EDGE) == ADC_ExternalTrigConvEd"
	.ascii	"ge_Falling) || ((EDGE) == ADC_ExternalTrigConvEdge_"
	.ascii	"RisingFalling))\000"
.LASF17:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF575:
	.ascii	"SCB ((SCB_Type *) SCB_BASE )\000"
.LASF226:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF444:
	.ascii	"__CTYPE_XDIGIT 0x80\000"
.LASF814:
	.ascii	"COMP_CSR_COMP2INSEL ((uint32_t)0x00700000)\000"
.LASF3554:
	.ascii	"TIM_DMA_Trigger ((uint16_t)0x4000)\000"
.LASF697:
	.ascii	"ADC_CFGR1_AWDCH_4 ((uint32_t)0x40000000)\000"
.LASF3707:
	.ascii	"USART_WakeUp_IdleLine ((uint32_t)0x00000000)\000"
.LASF1578:
	.ascii	"RCC_CFGR_MCO_LSI ((uint32_t)0x02000000)\000"
.LASF34:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF3241:
	.ascii	"RTC_BKP_DR3 ((uint32_t)0x00000003)\000"
.LASF228:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF3811:
	.ascii	"RCC_PLLSource_PREDIV1 RCC_CFGR_PLLSRC_PREDIV1\000"
.LASF1474:
	.ascii	"PWR_CR_LPSDSR ((uint16_t)0x0001)\000"
.LASF3835:
	.ascii	"RCC_PREDIV1_Div7 RCC_CFGR2_PREDIV1_DIV7\000"
.LASF2808:
	.ascii	"IS_GET_EXTI_LINE(LINE) (((LINE) == EXTI_Line0) || ("
	.ascii	"(LINE) == EXTI_Line1) || ((LINE) == EXTI_Line2) || "
	.ascii	"((LINE) == EXTI_Line3) || ((LINE) == EXTI_Line4) ||"
	.ascii	" ((LINE) == EXTI_Line5) || ((LINE) == EXTI_Line6) |"
	.ascii	"| ((LINE) == EXTI_Line7) || ((LINE) == EXTI_Line8) "
	.ascii	"|| ((LINE) == EXTI_Line9) || ((LINE) == EXTI_Line10"
	.ascii	") || ((LINE) == EXTI_Line11) || ((LINE) == EXTI_Lin"
	.ascii	"e12) || ((LINE) == EXTI_Line13) || ((LINE) == EXTI_"
	.ascii	"Line14) || ((LINE) == EXTI_Line15) || ((LINE) == EX"
	.ascii	"TI_Line16) || ((LINE) == EXTI_Line17) || ((LINE) =="
	.ascii	" EXTI_Line19) || ((LINE) == EXTI_Line21) || ((LINE)"
	.ascii	" == EXTI_Line22))\000"
.LASF3417:
	.ascii	"TIM_OCMode_PWM1 ((uint16_t)0x0060)\000"
.LASF2743:
	.ascii	"DMA1_IT_GL3 DMA_ISR_GIF3\000"
.LASF277:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF102:
	.ascii	"__INT_LEAST32_MAX__ 0x7fffffffL\000"
.LASF397:
	.ascii	"INT_FAST8_MIN INT8_MIN\000"
.LASF2840:
	.ascii	"OB_IWDG_HW ((uint8_t)0x00)\000"
.LASF2257:
	.ascii	"TIM_CCER_CC2P ((uint16_t)0x0020)\000"
.LASF2419:
	.ascii	"USART_ICR_FECF ((uint32_t)0x00000002)\000"
.LASF2535:
	.ascii	"ADC_Channel_Vrefint ((uint32_t)ADC_Channel_17)\000"
.LASF1201:
	.ascii	"GPIO_OSPEEDER_OSPEEDR7_1 ((uint32_t)0x00008000)\000"
.LASF1479:
	.ascii	"PWR_CR_PLS ((uint16_t)0x00E0)\000"
.LASF4309:
	.ascii	"DECL_STATIC_CARIBOU_QUEUE(QUEUE,DEPTH) static void*"
	.ascii	" QUEUE ## msgs[DEPTH]; static caribou_queue_t QUEUE"
	.ascii	" = CARIBOU_QUEUE(DEPTH,QUEUE ## msgs)\000"
.LASF2069:
	.ascii	"SYSCFG_EXTICR3_EXTI9_PA ((uint16_t)0x0000)\000"
.LASF4421:
	.ascii	"uint64_t\000"
.LASF2402:
	.ascii	"USART_ISR_TC ((uint32_t)0x00000040)\000"
.LASF4288:
	.ascii	"FP_NLOG 12\000"
.LASF2983:
	.ascii	"I2C_Direction_Transmitter ((uint16_t)0x0000)\000"
.LASF3542:
	.ascii	"TIM_DMABurstLength_14Transfers ((uint16_t)0x0D00)\000"
.LASF3296:
	.ascii	"IS_SPI_CRC_LENGTH(LENGTH) (((LENGTH) == SPI_CRCLeng"
	.ascii	"th_8b) || ((LENGTH) == SPI_CRCLength_16b))\000"
.LASF2919:
	.ascii	"GPIO_Speed_50MHz GPIO_Speed_Level_3\000"
.LASF3353:
	.ascii	"IS_SPI_RX_FIFO_THRESHOLD(THRESHOLD) (((THRESHOLD) ="
	.ascii	"= SPI_RxFIFOThreshold_HF) || ((THRESHOLD) == SPI_Rx"
	.ascii	"FIFOThreshold_QF))\000"
.LASF132:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF3441:
	.ascii	"TIM_OCPolarity_High ((uint16_t)0x0000)\000"
.LASF1044:
	.ascii	"EXTI_SWIER_SWIER13 ((uint32_t)0x00002000)\000"
.LASF2711:
	.ascii	"IS_DMA_MEMORY_INC_STATE(STATE) (((STATE) == DMA_Mem"
	.ascii	"oryInc_Disable) || ((STATE) == DMA_MemoryInc_Enable"
	.ascii	"))\000"
.LASF435:
	.ascii	"__RAL_PTRDIFF_T int\000"
.LASF4064:
	.ascii	"CARIBOU_TIMER_F_ONESHOT 0x02\000"
.LASF3725:
	.ascii	"IS_USART_DE_POLARITY(POLARITY) (((POLARITY) == USAR"
	.ascii	"T_DEPolarity_Low) || ((POLARITY) == USART_DEPolarit"
	.ascii	"y_High))\000"
.LASF293:
	.ascii	"__HA_IBIT__ 8\000"
.LASF673:
	.ascii	"ADC_ISR_AWD ((uint32_t)0x00000080)\000"
.LASF2636:
	.ascii	"COMP_Output_None ((uint32_t)0x00000000)\000"
.LASF367:
	.ascii	"_CARIBOU_STM32F03x_CHIP_H \000"
.LASF763:
	.ascii	"CEC_TXDR_TXD ((uint32_t)0x000000FF)\000"
.LASF3816:
	.ascii	"RCC_PLLMul_5 RCC_CFGR_PLLMULL5\000"
.LASF3570:
	.ascii	"IS_TIM_INTERNAL_TRIGGER_SELECTION(SELECTION) (((SEL"
	.ascii	"ECTION) == TIM_TS_ITR0) || ((SELECTION) == TIM_TS_I"
	.ascii	"TR1) || ((SELECTION) == TIM_TS_ITR2) || ((SELECTION"
	.ascii	") == TIM_TS_ITR3))\000"
.LASF416:
	.ascii	"UINT8_C(x) (x ##U)\000"
.LASF3199:
	.ascii	"IS_RTC_DAYLIGHT_SAVING(SAVING) (((SAVING) == RTC_Da"
	.ascii	"yLightSaving_SUB1H) || ((SAVING) == RTC_DayLightSav"
	.ascii	"ing_ADD1H))\000"
.LASF1280:
	.ascii	"GPIO_IDR_6 ((uint32_t)0x00000040)\000"
.LASF3303:
	.ascii	"SPI_NSS_Soft SPI_CR1_SSM\000"
.LASF3450:
	.ascii	"TIM_OutputNState_Disable ((uint16_t)0x0000)\000"
.LASF262:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF4429:
	.ascii	"next\000"
.LASF2835:
	.ascii	"IS_OB_WRP(PAGE) (((PAGE) != 0x0000000))\000"
.LASF2493:
	.ascii	"ADC_AnalogWatchdog_Channel_8 ((uint32_t)0x20000000)"
	.ascii	"\000"
.LASF1372:
	.ascii	"GPIO_BRR_BR_1 ((uint32_t)0x00000002)\000"
.LASF983:
	.ascii	"EXTI_EMR_MR14 ((uint32_t)0x00004000)\000"
.LASF2323:
	.ascii	"USART_CR1_CMIE ((uint32_t)0x00004000)\000"
.LASF2271:
	.ascii	"TIM_CCR1_CCR1 ((uint16_t)0xFFFF)\000"
.LASF354:
	.ascii	"STM32F0XX 1\000"
.LASF4487:
	.ascii	"_ZN7CARIBOU18CCaribouMainThread4onceEv\000"
.LASF2536:
	.ascii	"ADC_Channel_Vbat ((uint32_t)ADC_Channel_18)\000"
.LASF1921:
	.ascii	"RTC_TAFCR_TAMPFREQ_1 ((uint32_t)0x00000200)\000"
.LASF2769:
	.ascii	"DMA1_FLAG_GL4 DMA_ISR_GIF4\000"
.LASF794:
	.ascii	"COMP_CSR_COMP1MODE_0 ((uint32_t)0x00000004)\000"
.LASF1050:
	.ascii	"EXTI_PR_PR0 ((uint32_t)0x00000001)\000"
.LASF1530:
	.ascii	"RCC_CFGR_HPRE_DIV64 ((uint32_t)0x000000C0)\000"
.LASF2383:
	.ascii	"USART_CR3_WUS_1 ((uint32_t)0x00200000)\000"
.LASF425:
	.ascii	"WCHAR_MIN (-2147483647L-1)\000"
.LASF464:
	.ascii	"caribou_lib_lock() chip_interrupts_disable()\000"
.LASF4332:
	.ascii	"FILE stdio_t\000"
.LASF479:
	.ascii	"__STM32F0XX_STDPERIPH_VERSION_MAIN (0x01)\000"
.LASF557:
	.ascii	"SysTick_CTRL_TICKINT_Msk (1UL << SysTick_CTRL_TICKI"
	.ascii	"NT_Pos)\000"
.LASF1494:
	.ascii	"PWR_CSR_PVDO ((uint16_t)0x0004)\000"
.LASF1178:
	.ascii	"GPIO_OSPEEDER_OSPEEDR0 ((uint32_t)0x00000003)\000"
.LASF3414:
	.ascii	"TIM_OCMode_Active ((uint16_t)0x0010)\000"
.LASF1531:
	.ascii	"RCC_CFGR_HPRE_DIV128 ((uint32_t)0x000000D0)\000"
.LASF1808:
	.ascii	"RTC_ALRMAR_MSK4 ((uint32_t)0x80000000)\000"
.LASF3729:
	.ascii	"USART_AutoBaudRate_StartBit ((uint32_t)0x00000000)\000"
.LASF105:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF1626:
	.ascii	"RCC_AHBENR_SRAMEN ((uint32_t)0x00000004)\000"
.LASF861:
	.ascii	"DBGMCU_IDCODE_REV_ID_7 ((uint32_t)0x00800000)\000"
.LASF1899:
	.ascii	"RTC_CAL_CALW8 ((uint32_t)0x00004000)\000"
.LASF4464:
	.ascii	"operator new\000"
.LASF1995:
	.ascii	"SPI_I2SCFGR_DATLEN ((uint16_t)0x0006)\000"
.LASF755:
	.ascii	"CEC_CFGR_RXTOL ((uint32_t)0x00000008)\000"
.LASF3328:
	.ascii	"IS_I2S_STANDARD(STANDARD) (((STANDARD) == I2S_Stand"
	.ascii	"ard_Phillips) || ((STANDARD) == I2S_Standard_MSB) |"
	.ascii	"| ((STANDARD) == I2S_Standard_LSB) || ((STANDARD) ="
	.ascii	"= I2S_Standard_PCMShort) || ((STANDARD) == I2S_Stan"
	.ascii	"dard_PCMLong))\000"
.LASF303:
	.ascii	"__USA_IBIT__ 16\000"
.LASF4175:
	.ascii	"EOPNOTSUPP 95\000"
.LASF1012:
	.ascii	"EXTI_FTSR_TR0 ((uint32_t)0x00000001)\000"
.LASF3938:
	.ascii	"IS_RCC_APB1_PERIPH(PERIPH) ((((PERIPH) & 0x8F9DB6EC"
	.ascii	") == 0x00) && ((PERIPH) != 0x00))\000"
.LASF2496:
	.ascii	"ADC_AnalogWatchdog_Channel_11 ((uint32_t)0x2C000000"
	.ascii	")\000"
.LASF1094:
	.ascii	"FLASH_OBR_OPTERR ((uint32_t)0x00000001)\000"
.LASF387:
	.ascii	"INT_LEAST32_MIN INT32_MIN\000"
.LASF2789:
	.ascii	"EXTI_Line6 ((uint32_t)0x00000040)\000"
.LASF2027:
	.ascii	"SYSCFG_EXTICR1_EXTI0_PA ((uint16_t)0x0000)\000"
.LASF3884:
	.ascii	"RCC_IT_HSERDY ((uint8_t)0x08)\000"
.LASF2330:
	.ascii	"USART_CR1_DEDT_4 ((uint32_t)0x00100000)\000"
.LASF3038:
	.ascii	"I2C_IT_TXIS I2C_ISR_TXIS\000"
.LASF2048:
	.ascii	"SYSCFG_EXTICR2_EXTI4_PC ((uint16_t)0x0002)\000"
.LASF2903:
	.ascii	"GPIO_PinSource12 ((uint8_t)0x0C)\000"
.LASF664:
	.ascii	"OB ((OB_TypeDef *) OB_BASE)\000"
.LASF482:
	.ascii	"__STM32F0XX_STDPERIPH_VERSION_RC (0x00)\000"
.LASF2389:
	.ascii	"USART_RTOR_RTO ((uint32_t)0x00FFFFFF)\000"
.LASF1913:
	.ascii	"RTC_TAFCR_TAMPPRCH ((uint32_t)0x00006000)\000"
.LASF221:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF3310:
	.ascii	"SPI_BaudRatePrescaler_32 ((uint16_t)0x0020)\000"
.LASF912:
	.ascii	"DMA_IFCR_CGIF3 ((uint32_t)0x00000100)\000"
.LASF4419:
	.ascii	"unsigned int\000"
.LASF3904:
	.ascii	"RCC_AHBPeriph_GPIOA RCC_AHBENR_GPIOAEN\000"
.LASF853:
	.ascii	"DBGMCU_IDCODE_REV_ID ((uint32_t)0xFFFF0000)\000"
.LASF660:
	.ascii	"DMA1_Channel3 ((DMA_Channel_TypeDef *) DMA1_Channel"
	.ascii	"3_BASE)\000"
.LASF4373:
	.ascii	"CARIBOU_ADC_Channel_25 ((uint8_t)0x19)\000"
.LASF641:
	.ascii	"I2C2 ((I2C_TypeDef *) I2C2_BASE)\000"
.LASF3169:
	.ascii	"RTC_AlarmSubSecondMask_SS14_10 ((uint8_t)0x0A)\000"
.LASF327:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF4455:
	.ascii	"object\000"
.LASF1147:
	.ascii	"GPIO_MODER_MODER11 ((uint32_t)0x00C00000)\000"
.LASF3858:
	.ascii	"RCC_SYSCLK_Div512 RCC_CFGR_HPRE_DIV512\000"
.LASF694:
	.ascii	"ADC_CFGR1_AWDCH_1 ((uint32_t)0x08000000)\000"
.LASF4021:
	.ascii	"PIN_MODE(n,mode) ((mode&0x3)<<(n*2))\000"
.LASF1452:
	.ascii	"I2C_ICR_ADDRCF ((uint32_t)0x00000008)\000"
.LASF2890:
	.ascii	"IS_GET_GPIO_PIN(PIN) (((PIN) == GPIO_Pin_0) || ((PI"
	.ascii	"N) == GPIO_Pin_1) || ((PIN) == GPIO_Pin_2) || ((PIN"
	.ascii	") == GPIO_Pin_3) || ((PIN) == GPIO_Pin_4) || ((PIN)"
	.ascii	" == GPIO_Pin_5) || ((PIN) == GPIO_Pin_6) || ((PIN) "
	.ascii	"== GPIO_Pin_7) || ((PIN) == GPIO_Pin_8) || ((PIN) ="
	.ascii	"= GPIO_Pin_9) || ((PIN) == GPIO_Pin_10) || ((PIN) ="
	.ascii	"= GPIO_Pin_11) || ((PIN) == GPIO_Pin_12) || ((PIN) "
	.ascii	"== GPIO_Pin_13) || ((PIN) == GPIO_Pin_14) || ((PIN)"
	.ascii	" == GPIO_Pin_15))\000"
.LASF3322:
	.ascii	"IS_I2S_MODE(MODE) (((MODE) == I2S_Mode_SlaveTx) || "
	.ascii	"((MODE) == I2S_Mode_SlaveRx) || ((MODE) == I2S_Mode"
	.ascii	"_MasterTx)|| ((MODE) == I2S_Mode_MasterRx))\000"
.LASF2485:
	.ascii	"ADC_AnalogWatchdog_Channel_0 ((uint32_t)0x00000000)"
	.ascii	"\000"
.LASF1305:
	.ascii	"GPIO_ODR_15 ((uint32_t)0x00008000)\000"
.LASF3324:
	.ascii	"I2S_Standard_MSB ((uint16_t)0x0010)\000"
.LASF2573:
	.ascii	"CEC_StopReception_Off ((uint32_t)0x00000000)\000"
.LASF2580:
	.ascii	"CEC_LongBitPeriodError_On CEC_CFGR_LREGEN\000"
.LASF3673:
	.ascii	"USART_StopBits_1 ((uint32_t)0x00000000)\000"
.LASF808:
	.ascii	"COMP_CSR_COMP1OUT ((uint32_t)0x00004000)\000"
.LASF443:
	.ascii	"__CTYPE_BLANK 0x40\000"
.LASF54:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF3741:
	.ascii	"USART_FLAG_REACK USART_ISR_REACK\000"
.LASF3371:
	.ascii	"SPI_I2S_IT_TXE ((uint8_t)0x71)\000"
.LASF2858:
	.ascii	"FLASH_FLAG_PGERR FLASH_SR_PGERR\000"
.LASF3211:
	.ascii	"RTC_TamperFilter_8Sample ((uint32_t)0x00001800)\000"
.LASF1617:
	.ascii	"RCC_APB1RSTR_WWDGRST ((uint32_t)0x00000800)\000"
.LASF4222:
	.ascii	"CARIBOU_THREAD_F_TERMINATED 0x0004\000"
.LASF320:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 1\000"
.LASF2920:
	.ascii	"__STM32F0XX_SYSCFG_H \000"
.LASF370:
	.ascii	"UINT8_MAX 255\000"
.LASF2388:
	.ascii	"USART_GTPR_GT ((uint16_t)0xFF00)\000"
.LASF37:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF3260:
	.ascii	"RTC_IT_TS ((uint32_t)0x00008000)\000"
.LASF4283:
	.ascii	"FP_BIGI 7\000"
.LASF1997:
	.ascii	"SPI_I2SCFGR_DATLEN_1 ((uint16_t)0x0004)\000"
.LASF4435:
	.ascii	"caribou_timer_t\000"
.LASF1202:
	.ascii	"GPIO_OSPEEDER_OSPEEDR8 ((uint32_t)0x00030000)\000"
.LASF378:
	.ascii	"INT32_MIN (-2147483647L-1)\000"
.LASF2986:
	.ascii	"I2C_DMAReq_Tx I2C_CR1_TXDMAEN\000"
.LASF268:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF2124:
	.ascii	"TIM_CR2_OIS4 ((uint16_t)0x4000)\000"
.LASF2495:
	.ascii	"ADC_AnalogWatchdog_Channel_10 ((uint32_t)0x28000000"
	.ascii	")\000"
.LASF1786:
	.ascii	"RTC_CR_TSE ((uint32_t)0x00000800)\000"
.LASF2084:
	.ascii	"SYSCFG_EXTICR4_EXTI12_PC ((uint16_t)0x0002)\000"
.LASF769:
	.ascii	"CEC_ISR_SBPE ((uint32_t)0x00000010)\000"
.LASF3839:
	.ascii	"RCC_PREDIV1_Div11 RCC_CFGR2_PREDIV1_DIV11\000"
.LASF2664:
	.ascii	"DAC_Trigger_T15_TRGO ((uint32_t)0x0000001C)\000"
.LASF656:
	.ascii	"DBGMCU ((DBGMCU_TypeDef *) DBGMCU_BASE)\000"
.LASF3365:
	.ascii	"SPI_CRC_Tx ((uint8_t)0x00)\000"
.LASF2421:
	.ascii	"USART_ICR_ORECF ((uint32_t)0x00000008)\000"
.LASF1332:
	.ascii	"GPIO_BSRR_BR_10 ((uint32_t)0x04000000)\000"
.LASF3021:
	.ascii	"I2C_FLAG_TXE I2C_ISR_TXE\000"
.LASF2390:
	.ascii	"USART_RTOR_BLEN ((uint32_t)0xFF000000)\000"
.LASF3429:
	.ascii	"IS_TIM_COMPLEMENTARY_CHANNEL(CHANNEL) (((CHANNEL) ="
	.ascii	"= TIM_Channel_1) || ((CHANNEL) == TIM_Channel_2) ||"
	.ascii	" ((CHANNEL) == TIM_Channel_3))\000"
.LASF3290:
	.ascii	"SPI_DataSize_14b ((uint16_t)0x0D00)\000"
.LASF3183:
	.ascii	"RTC_OutputPolarity_High ((uint32_t)0x00000000)\000"
.LASF3657:
	.ascii	"TIM_DMABurstLength_9Bytes TIM_DMABurstLength_9Trans"
	.ascii	"fers\000"
.LASF3705:
	.ascii	"USART_DMAOnError_Disable USART_CR3_DDRE\000"
.LASF959:
	.ascii	"EXTI_IMR_MR14 ((uint32_t)0x00004000)\000"
.LASF608:
	.ascii	"TIM1_BASE (APBPERIPH_BASE + 0x00012C00)\000"
.LASF2677:
	.ascii	"IS_DAC_ALIGN(ALIGN) (((ALIGN) == DAC_Align_12b_R) |"
	.ascii	"| ((ALIGN) == DAC_Align_12b_L) || ((ALIGN) == DAC_A"
	.ascii	"lign_8b_R))\000"
.LASF3392:
	.ascii	"SPI_FLAG_CRCERR SPI_SR_CRCERR\000"
.LASF238:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF1422:
	.ascii	"I2C_OAR2_OA2 ((uint32_t)0x000000FE)\000"
.LASF2468:
	.ascii	"ADC_ExternalTrigConvEdge_RisingFalling ADC_CFGR1_EX"
	.ascii	"TEN\000"
.LASF4060:
	.ascii	"CARIBOU_PORTF_AFRL PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF2728:
	.ascii	"DMA_M2M_Disable ((uint32_t)0x00000000)\000"
.LASF1527:
	.ascii	"RCC_CFGR_HPRE_DIV4 ((uint32_t)0x00000090)\000"
.LASF1041:
	.ascii	"EXTI_SWIER_SWIER10 ((uint32_t)0x00000400)\000"
.LASF4489:
	.ascii	"_ZN7CARIBOU18CCaribouMainThread6threadEv\000"
.LASF1804:
	.ascii	"RTC_ISR_SHPF ((uint32_t)0x00000008)\000"
.LASF4065:
	.ascii	"from_ms(msec) (msec/JIFFIES)\000"
.LASF577:
	.ascii	"NVIC ((NVIC_Type *) NVIC_BASE )\000"
.LASF3723:
	.ascii	"USART_DEPolarity_High ((uint32_t)0x00000000)\000"
.LASF2686:
	.ascii	"IS_DBGMCU_PERIPH(PERIPH) ((((PERIPH) & 0xFFFFFFF9) "
	.ascii	"== 0x00) && ((PERIPH) != 0x00))\000"
.LASF2170:
	.ascii	"TIM_SR_CC3OF ((uint16_t)0x0800)\000"
.LASF2778:
	.ascii	"IS_DMA_GET_FLAG(FLAG) (((FLAG) == DMA1_FLAG_GL1) ||"
	.ascii	" ((FLAG) == DMA1_FLAG_TC1) || ((FLAG) == DMA1_FLAG_"
	.ascii	"HT1) || ((FLAG) == DMA1_FLAG_TE1) || ((FLAG) == DMA"
	.ascii	"1_FLAG_GL2) || ((FLAG) == DMA1_FLAG_TC2) || ((FLAG)"
	.ascii	" == DMA1_FLAG_HT2) || ((FLAG) == DMA1_FLAG_TE2) || "
	.ascii	"((FLAG) == DMA1_FLAG_GL3) || ((FLAG) == DMA1_FLAG_T"
	.ascii	"C3) || ((FLAG) == DMA1_FLAG_HT3) || ((FLAG) == DMA1"
	.ascii	"_FLAG_TE3) || ((FLAG) == DMA1_FLAG_GL4) || ((FLAG) "
	.ascii	"== DMA1_FLAG_TC4) || ((FLAG) == DMA1_FLAG_HT4) || ("
	.ascii	"(FLAG) == DMA1_FLAG_TE4) || ((FLAG) == DMA1_FLAG_GL"
	.ascii	"5) || ((FLAG) == DMA1_FLAG_TC5) || ((FLAG) == DMA1_"
	.ascii	"FLAG_HT5) || ((FLAG) == DMA1_FLAG_TE5))\000"
.LASF3823:
	.ascii	"RCC_PLLMul_12 RCC_CFGR_PLLMULL12\000"
.LASF3237:
	.ascii	"IS_RTC_SHIFT_SUBFS(FS) ((FS) <= 0x00007FFF)\000"
.LASF1453:
	.ascii	"I2C_ICR_NACKCF ((uint32_t)0x00000010)\000"
.LASF61:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF3682:
	.ascii	"USART_Mode_Tx USART_CR1_TE\000"
.LASF4:
	.ascii	"__GNUC_MINOR__ 4\000"
.LASF1785:
	.ascii	"RTC_CR_ALRAIE ((uint32_t)0x00001000)\000"
.LASF1572:
	.ascii	"RCC_CFGR_MCO ((uint32_t)0x07000000)\000"
.LASF1799:
	.ascii	"RTC_ISR_ALRAF ((uint32_t)0x00000100)\000"
.LASF401:
	.ascii	"INT_FAST8_MAX INT8_MAX\000"
.LASF1929:
	.ascii	"RTC_TAFCR_TAMP1TRG ((uint32_t)0x00000002)\000"
.LASF1968:
	.ascii	"SPI_CR2_DS_0 ((uint16_t)0x0100)\000"
.LASF2012:
	.ascii	"SYSCFG_CFGR1_MEM_MODE_0 ((uint32_t)0x00000001)\000"
.LASF1841:
	.ascii	"RTC_ALRMAR_ST_1 ((uint32_t)0x00000020)\000"
.LASF1021:
	.ascii	"EXTI_FTSR_TR9 ((uint32_t)0x00000200)\000"
.LASF1330:
	.ascii	"GPIO_BSRR_BR_8 ((uint32_t)0x01000000)\000"
.LASF3837:
	.ascii	"RCC_PREDIV1_Div9 RCC_CFGR2_PREDIV1_DIV9\000"
.LASF767:
	.ascii	"CEC_ISR_RXOVR ((uint32_t)0x00000004)\000"
.LASF3568:
	.ascii	"TIM_TS_ETRF ((uint16_t)0x0070)\000"
.LASF429:
	.ascii	"__stddef_H \000"
.LASF2444:
	.ascii	"WWDG_CFR_W2 ((uint16_t)0x0004)\000"
.LASF417:
	.ascii	"INT16_C(x) (x)\000"
.LASF3459:
	.ascii	"TIM_Break_Enable ((uint16_t)0x1000)\000"
.LASF40:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF2725:
	.ascii	"DMA_Priority_Medium DMA_CCR_PL_0\000"
.LASF310:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF3825:
	.ascii	"RCC_PLLMul_14 RCC_CFGR_PLLMULL14\000"
.LASF1089:
	.ascii	"FLASH_CR_OPTWRE ((uint32_t)0x00000200)\000"
.LASF1567:
	.ascii	"RCC_CFGR_PLLMULL12 ((uint32_t)0x00280000)\000"
.LASF3311:
	.ascii	"SPI_BaudRatePrescaler_64 ((uint16_t)0x0028)\000"
.LASF773:
	.ascii	"CEC_ISR_TXBR ((uint32_t)0x00000100)\000"
.LASF528:
	.ascii	"SCB_ICSR_VECTACTIVE_Pos 0\000"
.LASF2972:
	.ascii	"I2C_Mode_I2C ((uint32_t)0x00000000)\000"
.LASF745:
	.ascii	"ADC_CHSELR_CHSEL1 ((uint32_t)0x00000002)\000"
.LASF3933:
	.ascii	"RCC_APB1Periph_I2C1 RCC_APB1ENR_I2C1EN\000"
.LASF810:
	.ascii	"COMP_CSR_COMP2EN ((uint32_t)0x00010000)\000"
.LASF436:
	.ascii	"__CODE \000"
.LASF1993:
	.ascii	"SPI_TXCRCR_TXCRC ((uint16_t)0xFFFF)\000"
.LASF669:
	.ascii	"GPIOB ((GPIO_TypeDef *) GPIOB_BASE)\000"
.LASF485:
	.ascii	"__MPU_PRESENT 0\000"
.LASF276:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF1244:
	.ascii	"GPIO_PUPDR_PUPDR6 ((uint32_t)0x00003000)\000"
.LASF4355:
	.ascii	"CARIBOU_ADC_Channel_7 ((uint8_t)0x07)\000"
.LASF3498:
	.ascii	"TIM_IT_Update ((uint16_t)0x0001)\000"
.LASF2208:
	.ascii	"TIM_CCMR1_IC2PSC ((uint16_t)0x0C00)\000"
.LASF3386:
	.ascii	"SPI_ReceptionFIFOStatus_HalfFull ((uint16_t)0x0400)"
	.ascii	"\000"
.LASF913:
	.ascii	"DMA_IFCR_CTCIF3 ((uint32_t)0x00000200)\000"
.LASF4324:
	.ascii	"va_end(ap) ( ap = (va_list)0)\000"
.LASF3188:
	.ascii	"IS_RTC_CALIB_OUTPUT(OUTPUT) (((OUTPUT) == RTC_Calib"
	.ascii	"Output_512Hz) || ((OUTPUT) == RTC_CalibOutput_1Hz))"
	.ascii	"\000"
.LASF3142:
	.ascii	"RTC_Weekday_Sunday ((uint8_t)0x07)\000"
.LASF2678:
	.ascii	"IS_DAC_DATA(DATA) ((DATA) <= 0xFFF0)\000"
.LASF1767:
	.ascii	"RTC_DR_DT ((uint32_t)0x00000030)\000"
.LASF1635:
	.ascii	"RCC_APB2ENR_SYSCFGEN ((uint32_t)0x00000001)\000"
.LASF1130:
	.ascii	"GPIO_MODER_MODER5_0 ((uint32_t)0x00000400)\000"
.LASF1548:
	.ascii	"RCC_CFGR_PLLMULL ((uint32_t)0x003C0000)\000"
.LASF689:
	.ascii	"ADC_CR_ADSTART ((uint32_t)0x00000004)\000"
.LASF1145:
	.ascii	"GPIO_MODER_MODER10_0 ((uint32_t)0x00100000)\000"
.LASF251:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF2142:
	.ascii	"TIM_SMCR_ETPS_1 ((uint16_t)0x2000)\000"
.LASF803:
	.ascii	"COMP_CSR_COMP1OUTSEL_2 ((uint32_t)0x00000400)\000"
.LASF1158:
	.ascii	"GPIO_MODER_MODER14_1 ((uint32_t)0x20000000)\000"
.LASF3041:
	.ascii	"I2C_IT_NACKF I2C_ISR_NACKF\000"
.LASF4284:
	.ascii	"FP_BADC 8\000"
.LASF2199:
	.ascii	"TIM_CCMR1_OC2CE ((uint16_t)0x8000)\000"
.LASF1537:
	.ascii	"RCC_CFGR_PPRE_2 ((uint32_t)0x00000400)\000"
.LASF3316:
	.ascii	"SPI_FirstBit_LSB SPI_CR1_LSBFIRST\000"
.LASF2110:
	.ascii	"TIM_CR2_CCPC ((uint16_t)0x0001)\000"
.LASF2819:
	.ascii	"OB_WRP_Pages4to7 ((uint32_t)0x00000002)\000"
.LASF4073:
	.ascii	"EDOM (__aeabi_EDOM)\000"
.LASF2626:
	.ascii	"COMP_Selection_COMP1 ((uint32_t)0x00000000)\000"
.LASF1489:
	.ascii	"PWR_CR_PLS_LEV6 ((uint16_t)0x00C0)\000"
.LASF411:
	.ascii	"SIZE_MAX INT32_MAX\000"
.LASF1327:
	.ascii	"GPIO_BSRR_BR_5 ((uint32_t)0x00200000)\000"
.LASF4366:
	.ascii	"CARIBOU_ADC_Channel_18 ((uint8_t)0x12)\000"
.LASF1656:
	.ascii	"RCC_BDCR_LSEON ((uint32_t)0x00000001)\000"
.LASF100:
	.ascii	"__INT_LEAST16_MAX__ 0x7fff\000"
.LASF97:
	.ascii	"__UINT64_MAX__ 0xffffffffffffffffULL\000"
.LASF185:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF4334:
	.ascii	"stdout _stdout\000"
.LASF4140:
	.ascii	"ENOSTR 60\000"
.LASF2806:
	.ascii	"EXTI_Line27 ((uint32_t)0x08000000)\000"
.LASF4360:
	.ascii	"CARIBOU_ADC_Channel_12 ((uint8_t)0x0C)\000"
.LASF434:
	.ascii	"__RAL_SIZE_MAX 4294967295UL\000"
.LASF4270:
	.ascii	"MIN_EXP -128\000"
.LASF2311:
	.ascii	"USART_CR1_RE ((uint32_t)0x00000004)\000"
.LASF2118:
	.ascii	"TIM_CR2_OIS1 ((uint16_t)0x0100)\000"
.LASF1774:
	.ascii	"RTC_DR_DU_3 ((uint32_t)0x00000008)\000"
.LASF3916:
	.ascii	"RCC_APB2Periph_SYSCFG RCC_APB2ENR_SYSCFGEN\000"
.LASF3273:
	.ascii	"SPI_Direction_2Lines_RxOnly ((uint16_t)0x0400)\000"
.LASF2193:
	.ascii	"TIM_CCMR1_OC2FE ((uint16_t)0x0400)\000"
.LASF951:
	.ascii	"EXTI_IMR_MR6 ((uint32_t)0x00000040)\000"
.LASF1071:
	.ascii	"FLASH_ACR_PRFTBS ((uint32_t)0x00000020)\000"
.LASF279:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF1935:
	.ascii	"RTC_ALRMASSR_MASKSS_3 ((uint32_t)0x08000000)\000"
.LASF337:
	.ascii	"__ARMEL__ 1\000"
.LASF1253:
	.ascii	"GPIO_PUPDR_PUPDR9 ((uint32_t)0x000C0000)\000"
.LASF2378:
	.ascii	"USART_CR3_SCARCNT_0 ((uint32_t)0x00020000)\000"
.LASF2281:
	.ascii	"TIM_BDTR_DTG_5 ((uint16_t)0x0020)\000"
.LASF3293:
	.ascii	"IS_SPI_DATA_SIZE(SIZE) (((SIZE) == SPI_DataSize_4b)"
	.ascii	" || ((SIZE) == SPI_DataSize_5b) || ((SIZE) == SPI_D"
	.ascii	"ataSize_6b) || ((SIZE) == SPI_DataSize_7b) || ((SIZ"
	.ascii	"E) == SPI_DataSize_8b) || ((SIZE) == SPI_DataSize_9"
	.ascii	"b) || ((SIZE) == SPI_DataSize_10b) || ((SIZE) == SP"
	.ascii	"I_DataSize_11b) || ((SIZE) == SPI_DataSize_12b) || "
	.ascii	"((SIZE) == SPI_DataSize_13b) || ((SIZE) == SPI_Data"
	.ascii	"Size_14b) || ((SIZE) == SPI_DataSize_15b) || ((SIZE"
	.ascii	") == SPI_DataSize_16b))\000"
.LASF2524:
	.ascii	"ADC_Channel_9 ADC_CHSELR_CHSEL9\000"
.LASF1831:
	.ascii	"RTC_ALRMAR_MNT_1 ((uint32_t)0x00002000)\000"
.LASF4032:
	.ascii	"CARIBOU_PORTA_MODE PIN_MODE(0,GPIO_Mode_IN) | PIN_M"
	.ascii	"ODE(1,GPIO_Mode_IN) | PIN_MODE(2,GPIO_Mode_IN) | PI"
	.ascii	"N_MODE(3,GPIO_Mode_IN) | PIN_MODE(4,GPIO_Mode_IN) |"
	.ascii	" PIN_MODE(5,GPIO_Mode_OUT) | PIN_MODE(6,GPIO_Mode_I"
	.ascii	"N) | PIN_MODE(7,GPIO_Mode_IN) | PIN_MODE(8,GPIO_Mod"
	.ascii	"e_IN) | PIN_MODE(9,GPIO_Mode_IN) | PIN_MODE(10,GPIO"
	.ascii	"_Mode_OUT) | PIN_MODE(11,GPIO_Mode_IN) | PIN_MODE(1"
	.ascii	"2,GPIO_Mode_IN) | PIN_MODE(13,GPIO_Mode_AF) | PIN_M"
	.ascii	"ODE(14,GPIO_Mode_AF) | PIN_MODE(15,GPIO_Mode_IN)\000"
.LASF1736:
	.ascii	"RTC_TR_MNU_2 ((uint32_t)0x00000400)\000"
.LASF4194:
	.ascii	"EALREADY 114\000"
.LASF2093:
	.ascii	"SYSCFG_EXTICR4_EXTI15_PC ((uint16_t)0x2000)\000"
.LASF1784:
	.ascii	"RTC_CR_TSIE ((uint32_t)0x00008000)\000"
.LASF4215:
	.ascii	"CARIBOU_MAIN_THREAD_NAME \"CARIBOU\"\000"
.LASF4275:
	.ascii	"ROOT_EPS 0.372529029846191406e-8\000"
.LASF1790:
	.ascii	"RTC_CR_BYPSHAD ((uint32_t)0x00000020)\000"
.LASF2348:
	.ascii	"USART_CR2_STOP_1 ((uint32_t)0x00002000)\000"
.LASF1027:
	.ascii	"EXTI_FTSR_TR15 ((uint32_t)0x00008000)\000"
.LASF3668:
	.ascii	"IS_USART_ALL_PERIPH(PERIPH) (((PERIPH) == USART1) |"
	.ascii	"| ((PERIPH) == USART2))\000"
.LASF3043:
	.ascii	"I2C_IT_TC I2C_ISR_TC\000"
.LASF2895:
	.ascii	"GPIO_PinSource4 ((uint8_t)0x04)\000"
.LASF419:
	.ascii	"INT32_C(x) (x ##L)\000"
.LASF3012:
	.ascii	"IS_I2C_REGISTER(REGISTER) (((REGISTER) == I2C_Regis"
	.ascii	"ter_CR1) || ((REGISTER) == I2C_Register_CR2) || ((R"
	.ascii	"EGISTER) == I2C_Register_OAR1) || ((REGISTER) == I2"
	.ascii	"C_Register_OAR2) || ((REGISTER) == I2C_Register_TIM"
	.ascii	"INGR) || ((REGISTER) == I2C_Register_TIMEOUTR) || ("
	.ascii	"(REGISTER) == I2C_Register_ISR) || ((REGISTER) == I"
	.ascii	"2C_Register_ICR) || ((REGISTER) == I2C_Register_PEC"
	.ascii	"R) || ((REGISTER) == I2C_Register_RXDR) || ((REGIST"
	.ascii	"ER) == I2C_Register_TXDR))\000"
.LASF2225:
	.ascii	"TIM_CCMR2_OC3CE ((uint16_t)0x0080)\000"
.LASF3110:
	.ascii	"RTC_HourFormat_12 ((uint32_t)0x00000040)\000"
.LASF3029:
	.ascii	"I2C_FLAG_BERR I2C_ISR_BERR\000"
.LASF3059:
	.ascii	"I2C_Generate_Start_Read (uint32_t)(I2C_CR2_START | "
	.ascii	"I2C_CR2_RD_WRN)\000"
.LASF3585:
	.ascii	"TIM_EncoderMode_TI12 ((uint16_t)0x0003)\000"
.LASF864:
	.ascii	"DBGMCU_IDCODE_REV_ID_10 ((uint32_t)0x04000000)\000"
.LASF4084:
	.ascii	"EINTR 4\000"
.LASF386:
	.ascii	"INT_LEAST16_MIN INT16_MIN\000"
.LASF503:
	.ascii	"SCB_CPUID_IMPLEMENTER_Msk (0xFFUL << SCB_CPUID_IMPL"
	.ascii	"EMENTER_Pos)\000"
.LASF2290:
	.ascii	"TIM_BDTR_BKP ((uint16_t)0x2000)\000"
.LASF3595:
	.ascii	"IS_TIM_EVENT_SOURCE(SOURCE) ((((SOURCE) & (uint16_t"
	.ascii	")0xFF00) == 0x0000) && ((SOURCE) != 0x0000))\000"
.LASF74:
	.ascii	"__SHRT_MAX__ 0x7fff\000"
.LASF3054:
	.ascii	"I2C_AutoEnd_Mode I2C_CR2_AUTOEND\000"
.LASF2749:
	.ascii	"DMA1_IT_HT4 DMA_ISR_HTIF4\000"
.LASF151:
	.ascii	"__DBL_MIN__ double(1.1)\000"
.LASF1662:
	.ascii	"RCC_BDCR_RTCSEL ((uint32_t)0x00000300)\000"
.LASF1476:
	.ascii	"PWR_CR_CWUF ((uint16_t)0x0004)\000"
.LASF4301:
	.ascii	"FP_NMAR 14\000"
.LASF2367:
	.ascii	"USART_CR3_DMAR ((uint32_t)0x00000040)\000"
.LASF910:
	.ascii	"DMA_IFCR_CHTIF2 ((uint32_t)0x00000040)\000"
.LASF1298:
	.ascii	"GPIO_ODR_8 ((uint32_t)0x00000100)\000"
.LASF139:
	.ascii	"__FLT_DENORM_MIN__ 1.1\000"
.LASF481:
	.ascii	"__STM32F0XX_STDPERIPH_VERSION_SUB2 (0x00)\000"
.LASF1014:
	.ascii	"EXTI_FTSR_TR2 ((uint32_t)0x00000004)\000"
.LASF77:
	.ascii	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL\000"
.LASF897:
	.ascii	"DMA_ISR_TCIF4 ((uint32_t)0x00002000)\000"
.LASF44:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF2633:
	.ascii	"COMP_InvertingInput_DAC1 COMP_CSR_COMP1INSEL_2\000"
.LASF1139:
	.ascii	"GPIO_MODER_MODER8_0 ((uint32_t)0x00010000)\000"
.LASF4298:
	.ascii	"FP_POWU 22\000"
.LASF99:
	.ascii	"__INT8_C(c) c\000"
.LASF3167:
	.ascii	"RTC_AlarmSubSecondMask_SS14_8 ((uint8_t)0x08)\000"
.LASF4482:
	.ascii	"CARIBOU\000"
.LASF515:
	.ascii	"SCB_ICSR_PENDSVSET_Msk (1UL << SCB_ICSR_PENDSVSET_P"
	.ascii	"os)\000"
.LASF770:
	.ascii	"CEC_ISR_LBPE ((uint32_t)0x00000020)\000"
.LASF1597:
	.ascii	"RCC_CIR_LSIRDYC ((uint32_t)0x00010000)\000"
.LASF1008:
	.ascii	"EXTI_RTSR_TR15 ((uint32_t)0x00008000)\000"
.LASF1068:
	.ascii	"EXTI_PR_PR19 ((uint32_t)0x00080000)\000"
.LASF1885:
	.ascii	"RTC_TSDR_MU_0 ((uint32_t)0x00000100)\000"
.LASF4431:
	.ascii	"fnarg\000"
.LASF4397:
	.ascii	"CARIBOU_UART_FLOW_DEFAULT CARIBOU_UART_FLOW_NONE\000"
.LASF609:
	.ascii	"SPI1_BASE (APBPERIPH_BASE + 0x00013000)\000"
.LASF1809:
	.ascii	"RTC_ALRMAR_WDSEL ((uint32_t)0x40000000)\000"
.LASF318:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1\000"
.LASF4317:
	.ascii	"DECL_CARIBOU_BINARY_SEMAPHORE(SEMAPHORE) caribou_se"
	.ascii	"maphore_t SEMAPHORE={1}\000"
.LASF1231:
	.ascii	"GPIO_PUPDR_PUPDR1_1 ((uint32_t)0x00000008)\000"
.LASF3594:
	.ascii	"TIM_EventSource_Break ((uint16_t)0x0080)\000"
.LASF2572:
	.ascii	"IS_CEC_RX_TOLERANCE(TOLERANCE) (((TOLERANCE) == CEC"
	.ascii	"_RxTolerance_Standard) || ((TOLERANCE) == CEC_RxTol"
	.ascii	"erance_Extended))\000"
.LASF1672:
	.ascii	"RCC_CSR_LSIRDY ((uint32_t)0x00000002)\000"
.LASF4003:
	.ascii	"CARIBOU_GPIO_PIN_25 (1<<25)\000"
.LASF3249:
	.ascii	"RTC_FLAG_TAMP2F ((uint32_t)0x00004000)\000"
.LASF2270:
	.ascii	"TIM_RCR_REP ((uint8_t)0xFF)\000"
.LASF2654:
	.ascii	"COMP_Mode_MediumSpeed COMP_CSR_COMP1MODE_0\000"
.LASF858:
	.ascii	"DBGMCU_IDCODE_REV_ID_4 ((uint32_t)0x00100000)\000"
.LASF3583:
	.ascii	"TIM_EncoderMode_TI1 ((uint16_t)0x0001)\000"
.LASF1264:
	.ascii	"GPIO_PUPDR_PUPDR12_1 ((uint32_t)0x02000000)\000"
.LASF80:
	.ascii	"__WINT_MAX__ 0xffffffffU\000"
.LASF1627:
	.ascii	"RCC_AHBENR_FLITFEN ((uint32_t)0x00000010)\000"
.LASF3523:
	.ascii	"TIM_DMABase_CCR3 ((uint16_t)0x000F)\000"
.LASF209:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF197:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF1477:
	.ascii	"PWR_CR_CSBF ((uint16_t)0x0008)\000"
.LASF92:
	.ascii	"__INT32_MAX__ 0x7fffffffL\000"
.LASF3398:
	.ascii	"IS_SPI_I2S_GET_FLAG(FLAG) (((FLAG) == SPI_I2S_FLAG_"
	.ascii	"BSY) || ((FLAG) == SPI_I2S_FLAG_OVR) || ((FLAG) == "
	.ascii	"SPI_FLAG_MODF) || ((FLAG) == SPI_FLAG_CRCERR) || (("
	.ascii	"FLAG) == SPI_I2S_FLAG_TXE) || ((FLAG) == SPI_I2S_FL"
	.ascii	"AG_RXNE)|| ((FLAG) == SPI_I2S_FLAG_FRE)|| ((FLAG) ="
	.ascii	"= I2S_FLAG_CHSIDE)|| ((FLAG) == I2S_FLAG_UDR))\000"
.LASF2746:
	.ascii	"DMA1_IT_TE3 DMA_ISR_TEIF3\000"
.LASF4029:
	.ascii	"PIN_AFR(n,afr) ((afr&0xf)<<(n*4))\000"
.LASF3665:
	.ascii	"TIM_DMABurstLength_17Bytes TIM_DMABurstLength_17Tra"
	.ascii	"nsfers\000"
.LASF4269:
	.ascii	"LOG_TINY -0.887228391116729997E+02\000"
.LASF4090:
	.ascii	"ECHILD 10\000"
.LASF1268:
	.ascii	"GPIO_PUPDR_PUPDR14 ((uint32_t)0x30000000)\000"
.LASF3579:
	.ascii	"IS_TIM_PRESCALER_RELOAD(RELOAD) (((RELOAD) == TIM_P"
	.ascii	"SCReloadMode_Update) || ((RELOAD) == TIM_PSCReloadM"
	.ascii	"ode_Immediate))\000"
.LASF3966:
	.ascii	"JIFFIES (1000/HZ)\000"
.LASF781:
	.ascii	"CEC_IER_BREIEIE ((uint32_t)0x00000008)\000"
.LASF2267:
	.ascii	"TIM_CNT_CNT ((uint16_t)0xFFFF)\000"
.LASF3979:
	.ascii	"CARIBOU_GPIO_PIN_1 (1<<1)\000"
.LASF964:
	.ascii	"EXTI_IMR_MR21 ((uint32_t)0x00200000)\000"
.LASF2622:
	.ascii	"CRC_ReverseInputData_16bits CRC_CR_REV_IN_1\000"
.LASF2349:
	.ascii	"USART_CR2_LINEN ((uint32_t)0x00004000)\000"
.LASF1160:
	.ascii	"GPIO_MODER_MODER15_0 ((uint32_t)0x40000000)\000"
.LASF2453:
	.ascii	"WWDG_SR_EWIF ((uint8_t)0x01)\000"
.LASF1303:
	.ascii	"GPIO_ODR_13 ((uint32_t)0x00002000)\000"
.LASF2412:
	.ascii	"USART_ISR_CMF ((uint32_t)0x00020000)\000"
.LASF3870:
	.ascii	"RCC_CECCLK_HSI_Div244 ((uint32_t)0x00000000)\000"
.LASF1760:
	.ascii	"RTC_DR_WDU_2 ((uint32_t)0x00008000)\000"
.LASF41:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF46:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF2143:
	.ascii	"TIM_SMCR_ECE ((uint16_t)0x4000)\000"
.LASF3730:
	.ascii	"USART_AutoBaudRate_FallingEdge USART_CR2_ABRMODE_0\000"
.LASF3782:
	.ascii	"IS_USART_CLEAR_IT(IT) (((IT) == USART_IT_TC) || ((I"
	.ascii	"T) == USART_IT_PE) || ((IT) == USART_IT_FE) || ((IT"
	.ascii	") == USART_IT_NE) || ((IT) == USART_IT_ORE) || ((IT"
	.ascii	") == USART_IT_IDLE) || ((IT) == USART_IT_LBD) || (("
	.ascii	"IT) == USART_IT_CTS) || ((IT) == USART_IT_RTO) || ("
	.ascii	"(IT) == USART_IT_EOB) || ((IT) == USART_IT_CM) || ("
	.ascii	"(IT) == USART_IT_WU))\000"
.LASF2942:
	.ascii	"EXTI_PinSource15 ((uint8_t)0x0F)\000"
.LASF3955:
	.ascii	"RCC_FLAG_PINRST ((uint8_t)0x5A)\000"
.LASF81:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF2795:
	.ascii	"EXTI_Line12 ((uint32_t)0x00001000)\000"
.LASF625:
	.ascii	"TSC_BASE (AHBPERIPH_BASE + 0x00004000)\000"
.LASF4103:
	.ascii	"ENFILE 23\000"
.LASF854:
	.ascii	"DBGMCU_IDCODE_REV_ID_0 ((uint32_t)0x00010000)\000"
.LASF2335:
	.ascii	"USART_CR1_DEAT_3 ((uint32_t)0x01000000)\000"
.LASF3718:
	.ascii	"USART_LINBreakDetectLength_11b USART_CR2_LBDL\000"
.LASF4257:
	.ascii	"E 2.718281828459045235\000"
.LASF2063:
	.ascii	"SYSCFG_EXTICR3_EXTI9 ((uint16_t)0x00F0)\000"
.LASF2760:
	.ascii	"DMA1_FLAG_TE1 DMA_ISR_TEIF1\000"
.LASF2192:
	.ascii	"TIM_CCMR1_CC2S_1 ((uint16_t)0x0200)\000"
.LASF4442:
	.ascii	"stack_top\000"
.LASF4051:
	.ascii	"CARIBOU_PORTD_OTYPER PIN_OTYPER(0,GPIO_OType_PP) | "
	.ascii	"PIN_OTYPER(1,GPIO_OType_PP) | PIN_OTYPER(2,GPIO_OTy"
	.ascii	"pe_PP) | PIN_OTYPER(3,GPIO_OType_PP) | PIN_OTYPER(4"
	.ascii	",GPIO_OType_PP) | PIN_OTYPER(5,GPIO_OType_PP) | PIN"
	.ascii	"_OTYPER(6,GPIO_OType_PP) | PIN_OTYPER(7,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(8,GPIO_OType_PP) | PIN_OTYPER(9,GP"
	.ascii	"IO_OType_PP) | PIN_OTYPER(10,GPIO_OType_PP) | PIN_O"
	.ascii	"TYPER(11,GPIO_OType_PP) | PIN_OTYPER(12,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(13,GPIO_OType_PP) | PIN_OTYPER(14,"
	.ascii	"GPIO_OType_PP) | PIN_OTYPER(15,GPIO_OType_PP)\000"
.LASF3512:
	.ascii	"TIM_DMABase_SR ((uint16_t)0x0004)\000"
.LASF2997:
	.ascii	"I2C_OA2_Mask06 ((uint8_t)0x06)\000"
.LASF685:
	.ascii	"ADC_IER_ADRDYIE ((uint32_t)0x00000001)\000"
.LASF1451:
	.ascii	"I2C_ISR_ADDCODE ((uint32_t)0x00FE0000)\000"
.LASF2513:
	.ascii	"IS_ADC_SAMPLE_TIME(TIME) (((TIME) == ADC_SampleTime"
	.ascii	"_1_5Cycles) || ((TIME) == ADC_SampleTime_7_5Cycles)"
	.ascii	" || ((TIME) == ADC_SampleTime_13_5Cycles) || ((TIME"
	.ascii	") == ADC_SampleTime_28_5Cycles) || ((TIME) == ADC_S"
	.ascii	"ampleTime_41_5Cycles) || ((TIME) == ADC_SampleTime_"
	.ascii	"55_5Cycles) || ((TIME) == ADC_SampleTime_71_5Cycles"
	.ascii	") || ((TIME) == ADC_SampleTime_239_5Cycles))\000"
.LASF2077:
	.ascii	"SYSCFG_EXTICR3_EXTI11_PC ((uint16_t)0x2000)\000"
.LASF3786:
	.ascii	"IS_USART_TIMEOUT(TIMEOUT) ((TIMEOUT) <= 0x00FFFFFF)"
	.ascii	"\000"
.LASF2263:
	.ascii	"TIM_CCER_CC3NP ((uint16_t)0x0800)\000"
.LASF2428:
	.ascii	"USART_ICR_CMCF ((uint32_t)0x00020000)\000"
.LASF413:
	.ascii	"INTPTR_MAX INT32_MAX\000"
.LASF1132:
	.ascii	"GPIO_MODER_MODER6 ((uint32_t)0x00003000)\000"
.LASF4118:
	.ascii	"ENOSYS 38\000"
.LASF4000:
	.ascii	"CARIBOU_GPIO_PIN_22 (1<<22)\000"
.LASF2234:
	.ascii	"TIM_CCMR2_OC4M_2 ((uint16_t)0x4000)\000"
.LASF2112:
	.ascii	"TIM_CR2_CCDS ((uint16_t)0x0008)\000"
.LASF1354:
	.ascii	"GPIO_LCKR_LCKK ((uint32_t)0x00010000)\000"
.LASF3173:
	.ascii	"RTC_AlarmSubSecondMask_SS14 ((uint8_t)0x0E)\000"
.LASF2681:
	.ascii	"DAC_FLAG_DMAUDR DAC_SR_DMAUDR1\000"
.LASF1000:
	.ascii	"EXTI_RTSR_TR7 ((uint32_t)0x00000080)\000"
.LASF1419:
	.ascii	"I2C_OAR1_OA1 ((uint32_t)0x000003FF)\000"
.LASF605:
	.ascii	"EXTI_BASE (APBPERIPH_BASE + 0x00010400)\000"
.LASF649:
	.ascii	"ADC ((ADC_Common_TypeDef *) ADC_BASE)\000"
.LASF438:
	.ascii	"__CTYPE_LOWER 0x02\000"
.LASF137:
	.ascii	"__FLT_MIN__ 1.1\000"
.LASF2319:
	.ascii	"USART_CR1_PCE ((uint32_t)0x00000400)\000"
.LASF2727:
	.ascii	"IS_DMA_PRIORITY(PRIORITY) (((PRIORITY) == DMA_Prior"
	.ascii	"ity_VeryHigh) || ((PRIORITY) == DMA_Priority_High) "
	.ascii	"|| ((PRIORITY) == DMA_Priority_Medium) || ((PRIORIT"
	.ascii	"Y) == DMA_Priority_Low))\000"
.LASF193:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF1141:
	.ascii	"GPIO_MODER_MODER9 ((uint32_t)0x000C0000)\000"
.LASF343:
	.ascii	"__ARM_PCS 1\000"
.LASF2345:
	.ascii	"USART_CR2_CLKEN ((uint32_t)0x00000800)\000"
.LASF1286:
	.ascii	"GPIO_IDR_12 ((uint32_t)0x00001000)\000"
.LASF870:
	.ascii	"DBGMCU_CR_DBG_STOP ((uint32_t)0x00000002)\000"
.LASF123:
	.ascii	"__UINTPTR_MAX__ 0xffffffffU\000"
.LASF504:
	.ascii	"SCB_CPUID_VARIANT_Pos 20\000"
.LASF3819:
	.ascii	"RCC_PLLMul_8 RCC_CFGR_PLLMULL8\000"
.LASF4031:
	.ascii	"GPIO_AF_USART1 GPIO_AF_1\000"
.LASF3046:
	.ascii	"I2C_IT_ARLO I2C_ISR_ARLO\000"
.LASF1669:
	.ascii	"RCC_BDCR_RTCEN ((uint32_t)0x00008000)\000"
.LASF1294:
	.ascii	"GPIO_ODR_4 ((uint32_t)0x00000010)\000"
.LASF1704:
	.ascii	"RCC_CFGR2_PREDIV1_DIV12 ((uint32_t)0x0000000B)\000"
.LASF817:
	.ascii	"COMP_CSR_COMP2INSEL_2 ((uint32_t)0x00400000)\000"
.LASF713:
	.ascii	"ADC_CFGR1_RES ((uint32_t)0x00000018)\000"
.LASF1860:
	.ascii	"RTC_TSTR_HU_3 ((uint32_t)0x00080000)\000"
.LASF2676:
	.ascii	"DAC_Align_8b_R ((uint32_t)0x00000008)\000"
.LASF3218:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div1024 ((uint32_t)0x"
	.ascii	"00000500)\000"
.LASF2020:
	.ascii	"SYSCFG_CFGR1_I2C_FMP_PB7 ((uint32_t)0x00020000)\000"
.LASF2233:
	.ascii	"TIM_CCMR2_OC4M_1 ((uint16_t)0x2000)\000"
.LASF2653:
	.ascii	"COMP_Mode_HighSpeed 0x00000000\000"
.LASF3285:
	.ascii	"SPI_DataSize_9b ((uint16_t)0x0800)\000"
.LASF4443:
	.ascii	"stack_base\000"
.LASF2127:
	.ascii	"TIM_SMCR_SMS_1 ((uint16_t)0x0002)\000"
.LASF4450:
	.ascii	"timer\000"
.LASF3640:
	.ascii	"IS_TIM_EXT_FILTER(EXTFILTER) ((EXTFILTER) <= 0xF)\000"
.LASF3465:
	.ascii	"TIM_AutomaticOutput_Enable ((uint16_t)0x4000)\000"
.LASF3906:
	.ascii	"RCC_AHBPeriph_GPIOC RCC_AHBENR_GPIOCEN\000"
.LASF2435:
	.ascii	"WWDG_CR_T2 ((uint8_t)0x04)\000"
.LASF1154:
	.ascii	"GPIO_MODER_MODER13_0 ((uint32_t)0x04000000)\000"
.LASF2337:
	.ascii	"USART_CR1_RTOIE ((uint32_t)0x04000000)\000"
.LASF757:
	.ascii	"CEC_CFGR_BREGEN ((uint32_t)0x00000020)\000"
.LASF627:
	.ascii	"GPIOB_BASE (AHB2PERIPH_BASE + 0x00000400)\000"
.LASF1694:
	.ascii	"RCC_CFGR2_PREDIV1_DIV2 ((uint32_t)0x00000001)\000"
.LASF3531:
	.ascii	"TIM_DMABurstLength_3Transfers ((uint16_t)0x0200)\000"
.LASF3214:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div16384 ((uint32_t)0"
	.ascii	"x00000100)\000"
.LASF2340:
	.ascii	"USART_CR2_LBDL ((uint32_t)0x00000020)\000"
.LASF488:
	.ascii	"__CORE_CM0_H_GENERIC \000"
.LASF802:
	.ascii	"COMP_CSR_COMP1OUTSEL_1 ((uint32_t)0x00000200)\000"
.LASF1846:
	.ascii	"RTC_ALRMAR_SU_2 ((uint32_t)0x00000004)\000"
.LASF832:
	.ascii	"CRC_CR_REV_IN ((uint32_t)0x00000060)\000"
.LASF1536:
	.ascii	"RCC_CFGR_PPRE_1 ((uint32_t)0x00000200)\000"
.LASF409:
	.ascii	"PTRDIFF_MIN INT32_MIN\000"
.LASF3551:
	.ascii	"TIM_DMA_CC3 ((uint16_t)0x0800)\000"
.LASF2864:
	.ascii	"__STM32F0XX_GPIO_H \000"
.LASF4074:
	.ascii	"EILSEQ (__aeabi_EILSEQ)\000"
.LASF1961:
	.ascii	"SPI_CR2_SSOE ((uint16_t)0x0004)\000"
.LASF364:
	.ascii	"CARIBOU_LIB_IRQ_SAFE 1\000"
.LASF674:
	.ascii	"ADC_ISR_OVR ((uint32_t)0x00000010)\000"
.LASF619:
	.ascii	"DMA1_Channel4_BASE (DMA1_BASE + 0x00000044)\000"
.LASF1052:
	.ascii	"EXTI_PR_PR2 ((uint32_t)0x00000004)\000"
.LASF2461:
	.ascii	"ADC_Resolution_10b ADC_CFGR1_RES_0\000"
.LASF1378:
	.ascii	"GPIO_BRR_BR_7 ((uint32_t)0x00000080)\000"
.LASF2896:
	.ascii	"GPIO_PinSource5 ((uint8_t)0x05)\000"
.LASF3555:
	.ascii	"IS_TIM_DMA_SOURCE(SOURCE) ((((SOURCE) & (uint16_t)0"
	.ascii	"x80FF) == 0x0000) && ((SOURCE) != 0x0000))\000"
.LASF5:
	.ascii	"__GNUC_PATCHLEVEL__ 1\000"
.LASF723:
	.ascii	"ADC_SMPR1_SMPR_0 ((uint32_t)0x00000001)\000"
.LASF431:
	.ascii	"__THREAD __thread\000"
.LASF2617:
	.ascii	"IS_CEC_CLEAR_FLAG(FLAG) ((((FLAG) & (uint32_t)0xFFF"
	.ascii	"FE000) == 0x00) && ((FLAG) != 0x00))\000"
.LASF2332:
	.ascii	"USART_CR1_DEAT_0 ((uint32_t)0x00200000)\000"
.LASF1300:
	.ascii	"GPIO_ODR_10 ((uint32_t)0x00000400)\000"
.LASF2471:
	.ascii	"ADC_ExternalTrigConv_T1_CC4 ADC_CFGR1_EXTSEL_0\000"
.LASF4102:
	.ascii	"EINVAL 22\000"
.LASF2568:
	.ascii	"CEC_SignalFreeTime_7T ((uint32_t)0x00000007)\000"
.LASF59:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF3259:
	.ascii	"IS_RTC_CLEAR_FLAG(FLAG) (((FLAG) != (uint32_t)RESET"
	.ascii	") && (((FLAG) & 0xFFFF06DF) == (uint32_t)RESET))\000"
.LASF1570:
	.ascii	"RCC_CFGR_PLLMULL15 ((uint32_t)0x00340000)\000"
.LASF2949:
	.ascii	"SYSCFG_DMARemap_TIM16 SYSCFG_CFGR1_TIM16_DMA_RMP\000"
.LASF3134:
	.ascii	"IS_RTC_MONTH(MONTH) (((MONTH) >= 1) && ((MONTH) <= "
	.ascii	"12))\000"
.LASF4338:
	.ascii	"toupper(c) ( ( (c)>='a' && (c)<='z' ) ? ((c)-0x20) "
	.ascii	": (c) )\000"
.LASF90:
	.ascii	"__INT8_MAX__ 0x7f\000"
.LASF1143:
	.ascii	"GPIO_MODER_MODER9_1 ((uint32_t)0x00080000)\000"
.LASF3266:
	.ascii	"IS_RTC_CONFIG_IT(IT) (((IT) != (uint32_t)RESET) && "
	.ascii	"(((IT) & 0xFFFF6FFB) == (uint32_t)RESET))\000"
.LASF4122:
	.ascii	"ENOMSG 42\000"
.LASF1574:
	.ascii	"RCC_CFGR_MCO_1 ((uint32_t)0x02000000)\000"
.LASF3587:
	.ascii	"TIM_EventSource_Update ((uint16_t)0x0001)\000"
.LASF258:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF2108:
	.ascii	"TIM_CR1_CKD_0 ((uint16_t)0x0100)\000"
.LASF1542:
	.ascii	"RCC_CFGR_PPRE_DIV16 ((uint32_t)0x00000700)\000"
.LASF291:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF3590:
	.ascii	"TIM_EventSource_CC3 ((uint16_t)0x0008)\000"
.LASF1271:
	.ascii	"GPIO_PUPDR_PUPDR15 ((uint32_t)0xC0000000)\000"
.LASF4010:
	.ascii	"caribou_gpio_set_output(gpio) chip_gpio_set_output("
	.ascii	"(gpio)->port,(gpio)->pinmask)\000"
.LASF294:
	.ascii	"__SA_FBIT__ 15\000"
.LASF345:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF4035:
	.ascii	"CARIBOU_PORTA_PUPDR PIN_PUPDR(0,GPIO_PuPd_NOPULL) |"
	.ascii	" PIN_PUPDR(1,GPIO_PuPd_NOPULL) | PIN_PUPDR(2,GPIO_P"
	.ascii	"uPd_NOPULL) | PIN_PUPDR(3,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(4,GPIO_PuPd_NOPULL) | PIN_PUPDR(5,GPIO_PuPd_NO"
	.ascii	"PULL) | PIN_PUPDR(6,GPIO_PuPd_NOPULL) | PIN_PUPDR(7"
	.ascii	",GPIO_PuPd_NOPULL) | PIN_PUPDR(8,GPIO_PuPd_NOPULL) "
	.ascii	"| PIN_PUPDR(9,GPIO_PuPd_NOPULL) | PIN_PUPDR(10,GPIO"
	.ascii	"_PuPd_NOPULL) | PIN_PUPDR(11,GPIO_PuPd_NOPULL) | PI"
	.ascii	"N_PUPDR(12,GPIO_PuPd_NOPULL) | PIN_PUPDR(13,GPIO_Pu"
	.ascii	"Pd_UP) | PIN_PUPDR(14,GPIO_PuPd_DOWN) | PIN_PUPDR(1"
	.ascii	"5,GPIO_PuPd_NOPULL)\000"
.LASF1025:
	.ascii	"EXTI_FTSR_TR13 ((uint32_t)0x00002000)\000"
.LASF887:
	.ascii	"DMA_ISR_TEIF1 ((uint32_t)0x00000008)\000"
.LASF3539:
	.ascii	"TIM_DMABurstLength_11Transfers ((uint16_t)0x0A00)\000"
.LASF2373:
	.ascii	"USART_CR3_OVRDIS ((uint32_t)0x00001000)\000"
.LASF787:
	.ascii	"CEC_IER_TXENDIE ((uint32_t)0x00000200)\000"
.LASF742:
	.ascii	"ADC_CHSELR_CHSEL4 ((uint32_t)0x00000010)\000"
.LASF4406:
	.ascii	"_CARIBOU_CLIST_H_ \000"
.LASF701:
	.ascii	"ADC_CFGR1_AUTOFF ((uint32_t)0x00008000)\000"
.LASF53:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF2607:
	.ascii	"CEC_FLAG_TXEND CEC_ISR_TXEND\000"
.LASF1964:
	.ascii	"SPI_CR2_ERRIE ((uint16_t)0x0020)\000"
.LASF2800:
	.ascii	"EXTI_Line17 ((uint32_t)0x00020000)\000"
.LASF4343:
	.ascii	"_CARIBOU_ADC_STM32F0xx_H_ \000"
.LASF384:
	.ascii	"UINTMAX_MAX 18446744073709551615ULL\000"
.LASF4415:
	.ascii	"short int\000"
.LASF1648:
	.ascii	"RCC_APB1ENR_WWDGEN ((uint32_t)0x00000800)\000"
.LASF506:
	.ascii	"SCB_CPUID_ARCHITECTURE_Pos 16\000"
.LASF2427:
	.ascii	"USART_ICR_EOBCF ((uint32_t)0x00001000)\000"
.LASF2962:
	.ascii	"IS_SYSCFG_LOCK_CONFIG(CONFIG) (((CONFIG) == SYSCFG_"
	.ascii	"Break_PVD) || ((CONFIG) == SYSCFG_Break_SRAMParity)"
	.ascii	" || ((CONFIG) == SYSCFG_Break_Lockup))\000"
.LASF391:
	.ascii	"INT_LEAST32_MAX INT32_MAX\000"
.LASF743:
	.ascii	"ADC_CHSELR_CHSEL3 ((uint32_t)0x00000008)\000"
.LASF4128:
	.ascii	"ELNRNG 48\000"
.LASF1261:
	.ascii	"GPIO_PUPDR_PUPDR11_1 ((uint32_t)0x00800000)\000"
.LASF3875:
	.ascii	"IS_RCC_I2CCLK(I2CCLK) (((I2CCLK) == RCC_I2C1CLK_HSI"
	.ascii	") || ((I2CCLK) == RCC_I2C1CLK_SYSCLK))\000"
.LASF2372:
	.ascii	"USART_CR3_ONEBIT ((uint32_t)0x00000800)\000"
.LASF4447:
	.ascii	"runtime\000"
.LASF1625:
	.ascii	"RCC_AHBENR_DMA1EN ((uint32_t)0x00000001)\000"
.LASF2097:
	.ascii	"SYSCFG_CFGR2_SRAM_PE ((uint32_t)0x00000100)\000"
.LASF2612:
	.ascii	"CEC_FLAG_SBPE CEC_ISR_SBPE\000"
.LASF4038:
	.ascii	"CARIBOU_PORTB_MODE PIN_MODE(0,GPIO_Mode_IN) | PIN_M"
	.ascii	"ODE(1,GPIO_Mode_IN) | PIN_MODE(2,GPIO_Mode_IN) | PI"
	.ascii	"N_MODE(3,GPIO_Mode_OUT) | PIN_MODE(4,GPIO_Mode_IN) "
	.ascii	"| PIN_MODE(5,GPIO_Mode_IN) | PIN_MODE(6,GPIO_Mode_I"
	.ascii	"N) | PIN_MODE(7,GPIO_Mode_IN) | PIN_MODE(8,GPIO_Mod"
	.ascii	"e_IN) | PIN_MODE(9,GPIO_Mode_IN) | PIN_MODE(10,GPIO"
	.ascii	"_Mode_IN) | PIN_MODE(11,GPIO_Mode_IN) | PIN_MODE(12"
	.ascii	",GPIO_Mode_IN) | PIN_MODE(13,GPIO_Mode_IN) | PIN_MO"
	.ascii	"DE(14,GPIO_Mode_IN) | PIN_MODE(15,GPIO_Mode_IN)\000"
.LASF2286:
	.ascii	"TIM_BDTR_LOCK_1 ((uint16_t)0x0200)\000"
.LASF4481:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF957:
	.ascii	"EXTI_IMR_MR12 ((uint32_t)0x00001000)\000"
.LASF3470:
	.ascii	"TIM_LOCKLevel_2 ((uint16_t)0x0200)\000"
.LASF3712:
	.ascii	"IS_USART_ADDRESS_DETECTION(ADDRESS) (((ADDRESS) == "
	.ascii	"USART_AddressLength_4b) || ((ADDRESS) == USART_Addr"
	.ascii	"essLength_7b))\000"
.LASF1359:
	.ascii	"GPIO_AFRL_AFRL4 ((uint32_t)0x000F0000)\000"
.LASF1006:
	.ascii	"EXTI_RTSR_TR13 ((uint32_t)0x00002000)\000"
.LASF473:
	.ascii	"HSE_STARTUP_TIMEOUT ((uint16_t)0x0500)\000"
.LASF1116:
	.ascii	"GPIO_MODER_MODER0_1 ((uint32_t)0x00000002)\000"
.LASF2718:
	.ascii	"DMA_MemoryDataSize_Word DMA_CCR_MSIZE_1\000"
.LASF1495:
	.ascii	"PWR_CSR_VREFINTRDYF ((uint16_t)0x0008)\000"
.LASF1555:
	.ascii	"RCC_CFGR_PLLXTPRE_PREDIV1 ((uint32_t)0x00000000)\000"
.LASF1230:
	.ascii	"GPIO_PUPDR_PUPDR1_0 ((uint32_t)0x00000004)\000"
.LASF3759:
	.ascii	"USART_FLAG_ORE USART_ISR_ORE\000"
.LASF2174:
	.ascii	"TIM_EGR_CC2G ((uint8_t)0x04)\000"
.LASF2854:
	.ascii	"OB_SRAM_PARITY_SET ((uint8_t)0x00)\000"
.LASF167:
	.ascii	"__LDBL_DENORM_MIN__ 1.1\000"
.LASF1095:
	.ascii	"FLASH_OBR_RDPRT1 ((uint32_t)0x00000002)\000"
.LASF3536:
	.ascii	"TIM_DMABurstLength_8Transfers ((uint16_t)0x0700)\000"
.LASF3920:
	.ascii	"RCC_APB2Periph_USART1 RCC_APB2ENR_USART1EN\000"
.LASF2454:
	.ascii	"__STM32F0XX_CONF_H \000"
.LASF3492:
	.ascii	"IS_TIM_IC_SELECTION(SELECTION) (((SELECTION) == TIM"
	.ascii	"_ICSelection_DirectTI) || ((SELECTION) == TIM_ICSel"
	.ascii	"ection_IndirectTI) || ((SELECTION) == TIM_ICSelecti"
	.ascii	"on_TRC))\000"
.LASF3897:
	.ascii	"RCC_RTCCLKSource_HSE_Div32 RCC_BDCR_RTCSEL_HSE\000"
.LASF1967:
	.ascii	"SPI_CR2_DS ((uint16_t)0x0F00)\000"
.LASF993:
	.ascii	"EXTI_RTSR_TR0 ((uint32_t)0x00000001)\000"
.LASF1912:
	.ascii	"RTC_TAFCR_TAMPPUDIS ((uint32_t)0x00008000)\000"
.LASF3941:
	.ascii	"RCC_MCOSource_LSI ((uint8_t)0x02)\000"
.LASF2773:
	.ascii	"DMA1_FLAG_GL5 DMA_ISR_GIF5\000"
.LASF2052:
	.ascii	"SYSCFG_EXTICR2_EXTI5_PC ((uint16_t)0x0020)\000"
.LASF4417:
	.ascii	"short unsigned int\000"
.LASF1433:
	.ascii	"I2C_TIMEOUTR_TIMEOUTB ((uint32_t)0x0FFF0000)\000"
.LASF3364:
	.ascii	"IS_SPI_NSS_INTERNAL(INTERNAL) (((INTERNAL) == SPI_N"
	.ascii	"SSInternalSoft_Set) || ((INTERNAL) == SPI_NSSIntern"
	.ascii	"alSoft_Reset))\000"
.LASF2766:
	.ascii	"DMA1_FLAG_TC3 DMA_ISR_TCIF3\000"
.LASF1651:
	.ascii	"RCC_APB1ENR_I2C1EN ((uint32_t)0x00200000)\000"
.LASF247:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF3890:
	.ascii	"IS_RCC_CLEAR_IT(IT) ((((IT) & (uint8_t)0x40) == 0x0"
	.ascii	"0) && ((IT) != 0x00))\000"
.LASF3426:
	.ascii	"TIM_Channel_3 ((uint16_t)0x0008)\000"
.LASF2008:
	.ascii	"SPI_I2SPR_I2SDIV ((uint16_t)0x00FF)\000"
.LASF2344:
	.ascii	"USART_CR2_CPOL ((uint32_t)0x00000400)\000"
.LASF3557:
	.ascii	"TIM_ExtTRGPSC_DIV2 ((uint16_t)0x1000)\000"
.LASF2273:
	.ascii	"TIM_CCR3_CCR3 ((uint16_t)0xFFFF)\000"
.LASF3556:
	.ascii	"TIM_ExtTRGPSC_OFF ((uint16_t)0x0000)\000"
.LASF498:
	.ascii	"__CORE_CM0_H_DEPENDANT \000"
.LASF433:
	.ascii	"__RAL_SIZE_T unsigned\000"
.LASF1437:
	.ascii	"I2C_ISR_RXNE ((uint32_t)0x00000004)\000"
.LASF3004:
	.ascii	"I2C_Register_OAR2 ((uint8_t)0x0C)\000"
.LASF3950:
	.ascii	"RCC_FLAG_PLLRDY ((uint8_t)0x19)\000"
.LASF4146:
	.ascii	"EREMOTE 66\000"
.LASF3522:
	.ascii	"TIM_DMABase_CCR2 ((uint16_t)0x000E)\000"
.LASF720:
	.ascii	"ADC_CFGR2_JITOFFDIV4 ((uint32_t)0x80000000)\000"
.LASF4182:
	.ascii	"ENETRESET 102\000"
.LASF2703:
	.ascii	"DMA_DIR_PeripheralSRC ((uint32_t)0x00000000)\000"
.LASF249:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF4276:
	.ascii	"REC_HUGE 0.587747175411143754E-38\000"
.LASF3776:
	.ascii	"USART_IT_ERR ((uint32_t)0x00000300)\000"
.LASF4221:
	.ascii	"CARIBOU_THREAD_F_YIELD 0x0002\000"
.LASF1157:
	.ascii	"GPIO_MODER_MODER14_0 ((uint32_t)0x10000000)\000"
.LASF2088:
	.ascii	"SYSCFG_EXTICR4_EXTI14_PA ((uint16_t)0x0000)\000"
.LASF4322:
	.ascii	"va_start(ap,v) (ap=(va_list)&v+_INTSIZEOF(v))\000"
.LASF3300:
	.ascii	"SPI_CPHA_1Edge ((uint16_t)0x0000)\000"
.LASF1032:
	.ascii	"EXTI_SWIER_SWIER1 ((uint32_t)0x00000002)\000"
.LASF1544:
	.ascii	"RCC_CFGR_ADCPRE_DIV2 ((uint32_t)0x00000000)\000"
.LASF4368:
	.ascii	"CARIBOU_ADC_Channel_20 ((uint8_t)0x14)\000"
.LASF3396:
	.ascii	"SPI_I2S_FLAG_FRE SPI_SR_FRE\000"
.LASF2258:
	.ascii	"TIM_CCER_CC2NE ((uint16_t)0x0040)\000"
.LASF3217:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div2048 ((uint32_t)0x"
	.ascii	"00000400)\000"
.LASF2050:
	.ascii	"SYSCFG_EXTICR2_EXTI5_PA ((uint16_t)0x0000)\000"
.LASF2264:
	.ascii	"TIM_CCER_CC4E ((uint16_t)0x1000)\000"
.LASF3901:
	.ascii	"RCC_LSEDrive_MediumHigh RCC_BDCR_LSEDRV_1\000"
.LASF1236:
	.ascii	"GPIO_PUPDR_PUPDR3_0 ((uint32_t)0x00000040)\000"
.LASF4377:
	.ascii	"CARIBOU_ADC_Channel_29 ((uint8_t)0x1D)\000"
.LASF1072:
	.ascii	"FLASH_KEYR_FKEYR ((uint32_t)0xFFFFFFFF)\000"
.LASF3132:
	.ascii	"RTC_Month_November ((uint8_t)0x11)\000"
.LASF389:
	.ascii	"INT_LEAST8_MAX INT8_MAX\000"
.LASF65:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF2872:
	.ascii	"GPIO_Pin_0 ((uint16_t)0x0001)\000"
.LASF934:
	.ascii	"DMA_CCR_PSIZE_1 ((uint32_t)0x00000200)\000"
.LASF2755:
	.ascii	"IS_DMA_CLEAR_IT(IT) ((((IT) & 0xFFF00000) == 0x00) "
	.ascii	"&& ((IT) != 0x00))\000"
.LASF2974:
	.ascii	"I2C_Mode_SMBusHost I2C_CR1_SMBHEN\000"
.LASF129:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF3931:
	.ascii	"RCC_APB1Periph_SPI2 RCC_APB1ENR_SPI2EN\000"
.LASF3974:
	.ascii	"_CARIBOU_GPIO_STM32F0xx_H_ \000"
.LASF4375:
	.ascii	"CARIBOU_ADC_Channel_27 ((uint8_t)0x1B)\000"
.LASF4472:
	.ascii	"_ZdaPv\000"
.LASF1758:
	.ascii	"RTC_DR_WDU_0 ((uint32_t)0x00002000)\000"
.LASF4238:
	.ascii	"caribou_vector_enable(vector) chip_vector_enable(ve"
	.ascii	"ctor)\000"
.LASF1996:
	.ascii	"SPI_I2SCFGR_DATLEN_0 ((uint16_t)0x0002)\000"
.LASF882:
	.ascii	"DBGMCU_APB2_FZ_DBG_TIM16_STOP ((uint32_t)0x00020000"
	.ascii	")\000"
.LASF297:
	.ascii	"__DA_IBIT__ 32\000"
.LASF4159:
	.ascii	"ELIBACC 79\000"
.LASF2765:
	.ascii	"DMA1_FLAG_GL3 DMA_ISR_GIF3\000"
.LASF1881:
	.ascii	"RTC_TSDR_WDU_1 ((uint32_t)0x00004000)\000"
.LASF4005:
	.ascii	"CARIBOU_GPIO_PIN_27 (1<<27)\000"
.LASF2168:
	.ascii	"TIM_SR_CC1OF ((uint16_t)0x0200)\000"
.LASF1706:
	.ascii	"RCC_CFGR2_PREDIV1_DIV14 ((uint32_t)0x0000000D)\000"
.LASF3842:
	.ascii	"RCC_PREDIV1_Div14 RCC_CFGR2_PREDIV1_DIV14\000"
.LASF2407:
	.ascii	"USART_ISR_RTOF ((uint32_t)0x00000800)\000"
.LASF977:
	.ascii	"EXTI_EMR_MR8 ((uint32_t)0x00000100)\000"
.LASF3013:
	.ascii	"I2C_IT_ERRI I2C_CR1_ERRIE\000"
.LASF3597:
	.ascii	"TIM_UpdateSource_Regular ((uint16_t)0x0001)\000"
.LASF1805:
	.ascii	"RTC_ISR_ALRAWF ((uint32_t)0x00000001)\000"
.LASF4410:
	.ascii	"CARIBOUCMUTEX_H \000"
.LASF2318:
	.ascii	"USART_CR1_PS ((uint32_t)0x00000200)\000"
.LASF1062:
	.ascii	"EXTI_PR_PR12 ((uint32_t)0x00001000)\000"
.LASF3513:
	.ascii	"TIM_DMABase_EGR ((uint16_t)0x0005)\000"
.LASF399:
	.ascii	"INT_FAST32_MIN INT32_MIN\000"
.LASF451:
	.ascii	"__RAL_SIZE_T_DEFINED \000"
.LASF2153:
	.ascii	"TIM_DIER_UDE ((uint16_t)0x0100)\000"
.LASF772:
	.ascii	"CEC_ISR_ARBLST ((uint32_t)0x00000080)\000"
.LASF554:
	.ascii	"SysTick_CTRL_CLKSOURCE_Pos 2\000"
.LASF1022:
	.ascii	"EXTI_FTSR_TR10 ((uint32_t)0x00000400)\000"
.LASF2150:
	.ascii	"TIM_DIER_COMIE ((uint16_t)0x0020)\000"
.LASF475:
	.ascii	"HSI_VALUE ((uint32_t)8000000)\000"
.LASF1074:
	.ascii	"FLASH_FKEY1 ((uint32_t)0x45670123)\000"
.LASF2982:
	.ascii	"IS_I2C_OWN_ADDRESS1(ADDRESS1) ((ADDRESS1) <= (uint3"
	.ascii	"2_t)0x000003FF)\000"
.LASF4457:
	.ascii	"dso_handle\000"
.LASF1696:
	.ascii	"RCC_CFGR2_PREDIV1_DIV4 ((uint32_t)0x00000003)\000"
.LASF3770:
	.ascii	"USART_IT_TXE ((uint32_t)0x00070107)\000"
.LASF1003:
	.ascii	"EXTI_RTSR_TR10 ((uint32_t)0x00000400)\000"
.LASF703:
	.ascii	"ADC_CFGR1_CONT ((uint32_t)0x00002000)\000"
.LASF1059:
	.ascii	"EXTI_PR_PR9 ((uint32_t)0x00000200)\000"
.LASF1752:
	.ascii	"RTC_DR_YU ((uint32_t)0x000F0000)\000"
.LASF2780:
	.ascii	"__STM32F0XX_EXTI_H \000"
.LASF1998:
	.ascii	"SPI_I2SCFGR_CKPOL ((uint16_t)0x0008)\000"
.LASF3924:
	.ascii	"RCC_APB2Periph_DBGMCU RCC_APB2ENR_DBGMCUEN\000"
.LASF857:
	.ascii	"DBGMCU_IDCODE_REV_ID_3 ((uint32_t)0x00080000)\000"
.LASF2899:
	.ascii	"GPIO_PinSource8 ((uint8_t)0x08)\000"
.LASF1057:
	.ascii	"EXTI_PR_PR7 ((uint32_t)0x00000080)\000"
.LASF2514:
	.ascii	"IS_ADC_THRESHOLD(THRESHOLD) ((THRESHOLD) <= 0xFFF)\000"
.LASF3089:
	.ascii	"IS_PWR_PVD_LEVEL(LEVEL) (((LEVEL) == PWR_PVDLevel_0"
	.ascii	") || ((LEVEL) == PWR_PVDLevel_1)|| ((LEVEL) == PWR_"
	.ascii	"PVDLevel_2) || ((LEVEL) == PWR_PVDLevel_3)|| ((LEVE"
	.ascii	"L) == PWR_PVDLevel_4) || ((LEVEL) == PWR_PVDLevel_5"
	.ascii	")|| ((LEVEL) == PWR_PVDLevel_6) || ((LEVEL) == PWR_"
	.ascii	"PVDLevel_7))\000"
.LASF1971:
	.ascii	"SPI_CR2_DS_3 ((uint16_t)0x0800)\000"
.LASF3582:
	.ascii	"IS_TIM_FORCED_ACTION(ACTION) (((ACTION) == TIM_Forc"
	.ascii	"edAction_Active) || ((ACTION) == TIM_ForcedAction_I"
	.ascii	"nActive))\000"
.LASF1612:
	.ascii	"RCC_APB2RSTR_DBGMCURST ((uint32_t)0x00400000)\000"
.LASF725:
	.ascii	"ADC_SMPR1_SMPR_2 ((uint32_t)0x00000004)\000"
.LASF3376:
	.ascii	"SPI_IT_MODF ((uint8_t)0x55)\000"
.LASF3026:
	.ascii	"I2C_FLAG_STOPF I2C_ISR_STOPF\000"
.LASF2955:
	.ascii	"SYSCFG_I2CFastModePlus_PB7 SYSCFG_CFGR1_I2C_FMP_PB7"
	.ascii	"\000"
.LASF2526:
	.ascii	"ADC_Channel_11 ADC_CHSELR_CHSEL11\000"
.LASF2836:
	.ascii	"OB_RDP_Level_0 ((uint8_t)0xAA)\000"
.LASF2:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF3726:
	.ascii	"USART_InvPin_Tx USART_CR2_TXINV\000"
.LASF546:
	.ascii	"SCB_CCR_STKALIGN_Pos 9\000"
.LASF2988:
	.ascii	"IS_I2C_DMA_REQ(REQ) ((((REQ) & (uint32_t)0xFFFF3FFF"
	.ascii	") == 0x00) && ((REQ) != 0x00))\000"
.LASF4413:
	.ascii	"uint8_t\000"
.LASF3902:
	.ascii	"RCC_LSEDrive_High RCC_BDCR_LSEDRV\000"
.LASF2237:
	.ascii	"TIM_CCMR2_IC3PSC_0 ((uint16_t)0x0004)\000"
.LASF483:
	.ascii	"__STM32F0XX_STDPERIPH_VERSION ((__STM32F0XX_STDPERI"
	.ascii	"PH_VERSION_MAIN << 24) |(__STM32F0XX_STDPERIPH_VERS"
	.ascii	"ION_SUB1 << 16) |(__STM32F0XX_STDPERIPH_VERSION_SUB"
	.ascii	"2 << 8) |(__STM32F0XX_STDPERIPH_VERSION_RC))\000"
.LASF1982:
	.ascii	"SPI_SR_BSY ((uint16_t)0x0080)\000"
.LASF3384:
	.ascii	"SPI_ReceptionFIFOStatus_Empty ((uint16_t)0x0000)\000"
.LASF1255:
	.ascii	"GPIO_PUPDR_PUPDR9_1 ((uint32_t)0x00080000)\000"
.LASF991:
	.ascii	"EXTI_EMR_MR25 ((uint32_t)0x02000000)\000"
.LASF1994:
	.ascii	"SPI_I2SCFGR_CHLEN ((uint16_t)0x0001)\000"
.LASF3600:
	.ascii	"TIM_OCPreload_Disable ((uint16_t)0x0000)\000"
.LASF1562:
	.ascii	"RCC_CFGR_PLLMULL7 ((uint32_t)0x00140000)\000"
.LASF2227:
	.ascii	"TIM_CCMR2_CC4S_0 ((uint16_t)0x0100)\000"
.LASF1655:
	.ascii	"RCC_APB1ENR_CECEN ((uint32_t)0x40000000)\000"
.LASF2621:
	.ascii	"CRC_ReverseInputData_8bits CRC_CR_REV_IN_0\000"
.LASF935:
	.ascii	"DMA_CCR_MSIZE ((uint32_t)0x00000C00)\000"
.LASF1856:
	.ascii	"RTC_TSTR_HU ((uint32_t)0x000F0000)\000"
.LASF4024:
	.ascii	"PIN_OSPEEDR_MASK(n) (0x3<<(n*2))\000"
.LASF96:
	.ascii	"__UINT32_MAX__ 0xffffffffUL\000"
.LASF2520:
	.ascii	"ADC_Channel_5 ADC_CHSELR_CHSEL5\000"
.LASF645:
	.ascii	"SYSCFG ((SYSCFG_TypeDef *) SYSCFG_BASE)\000"
.LASF599:
	.ascii	"I2C2_BASE (APBPERIPH_BASE + 0x00005800)\000"
.LASF3189:
	.ascii	"RTC_SmoothCalibPeriod_32sec ((uint32_t)0x00000000)\000"
.LASF2366:
	.ascii	"USART_CR3_SCEN ((uint32_t)0x00000020)\000"
.LASF2068:
	.ascii	"SYSCFG_EXTICR3_EXTI8_PC ((uint16_t)0x0002)\000"
.LASF4264:
	.ascii	"LOGB10E 0.434294481903251828\000"
.LASF2298:
	.ascii	"TIM_DCR_DBA_4 ((uint16_t)0x0010)\000"
.LASF1582:
	.ascii	"RCC_CFGR_MCO_HSE ((uint32_t)0x06000000)\000"
.LASF3867:
	.ascii	"RCC_ADCCLK_PCLK_Div2 ((uint32_t)0x01000000)\000"
.LASF675:
	.ascii	"ADC_ISR_EOSEQ ((uint32_t)0x00000008)\000"
.LASF4323:
	.ascii	"va_arg(ap,t) (*(t*)((ap +=_INTSIZEOF(t))-_INTSIZEOF"
	.ascii	"(t)))\000"
.LASF4295:
	.ascii	"FP_COSH 19\000"
.LASF2414:
	.ascii	"USART_ISR_RWU ((uint32_t)0x00080000)\000"
.LASF3372:
	.ascii	"SPI_I2S_IT_RXNE ((uint8_t)0x60)\000"
.LASF3962:
	.ascii	"IS_RCC_FLAG(FLAG) (((FLAG) == RCC_FLAG_HSIRDY) || ("
	.ascii	"(FLAG) == RCC_FLAG_HSERDY) || ((FLAG) == RCC_FLAG_P"
	.ascii	"LLRDY) || ((FLAG) == RCC_FLAG_LSERDY) || ((FLAG) =="
	.ascii	" RCC_FLAG_LSIRDY) || ((FLAG) == RCC_FLAG_OBLRST) ||"
	.ascii	" ((FLAG) == RCC_FLAG_PINRST) || ((FLAG) == RCC_FLAG"
	.ascii	"_PORRST) || ((FLAG) == RCC_FLAG_SFTRST) || ((FLAG) "
	.ascii	"== RCC_FLAG_IWDGRST)|| ((FLAG) == RCC_FLAG_WWDGRST)"
	.ascii	" || ((FLAG) == RCC_FLAG_LPWRRST)|| ((FLAG) == RCC_F"
	.ascii	"LAG_HSI14RDY)|| ((FLAG) == RCC_FLAG_V18PWRRSTF))\000"
.LASF4017:
	.ascii	"caribou_gpio_pinstate(gpio) chip_gpio_pinstate((gpi"
	.ascii	"o)->port,(gpio)->pinmask)\000"
.LASF4201:
	.ascii	"EREMOTEIO 121\000"
.LASF921:
	.ascii	"DMA_IFCR_CTCIF5 ((uint32_t)0x00020000)\000"
.LASF1844:
	.ascii	"RTC_ALRMAR_SU_0 ((uint32_t)0x00000001)\000"
.LASF1640:
	.ascii	"RCC_APB2ENR_TIM15EN ((uint32_t)0x00010000)\000"
.LASF3427:
	.ascii	"TIM_Channel_4 ((uint16_t)0x000C)\000"
.LASF3874:
	.ascii	"RCC_I2C1CLK_SYSCLK RCC_CFGR3_I2C1SW\000"
.LASF1820:
	.ascii	"RTC_ALRMAR_HT ((uint32_t)0x00300000)\000"
.LASF3625:
	.ascii	"TIM_FLAG_Update ((uint16_t)0x0001)\000"
.LASF3424:
	.ascii	"TIM_Channel_1 ((uint16_t)0x0000)\000"
.LASF1219:
	.ascii	"GPIO_OSPEEDER_OSPEEDR13_1 ((uint32_t)0x08000000)\000"
.LASF3973:
	.ascii	"_CARIBOU_GPIO_H_ \000"
.LASF1615:
	.ascii	"RCC_APB1RSTR_TIM6RST ((uint32_t)0x00000010)\000"
.LASF1321:
	.ascii	"GPIO_BSRR_BS_15 ((uint32_t)0x00008000)\000"
.LASF24:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF960:
	.ascii	"EXTI_IMR_MR15 ((uint32_t)0x00008000)\000"
.LASF2409:
	.ascii	"USART_ISR_ABRE ((uint32_t)0x00004000)\000"
.LASF1810:
	.ascii	"RTC_ALRMAR_DT ((uint32_t)0x30000000)\000"
.LASF3111:
	.ascii	"IS_RTC_HOUR_FORMAT(FORMAT) (((FORMAT) == RTC_HourFo"
	.ascii	"rmat_12) || ((FORMAT) == RTC_HourFormat_24))\000"
.LASF3469:
	.ascii	"TIM_LOCKLevel_1 ((uint16_t)0x0100)\000"
.LASF818:
	.ascii	"COMP_CSR_WNDWEN ((uint32_t)0x00800000)\000"
.LASF1248:
	.ascii	"GPIO_PUPDR_PUPDR7_0 ((uint32_t)0x00004000)\000"
.LASF256:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF377:
	.ascii	"INT32_MAX 2147483647L\000"
.LASF1663:
	.ascii	"RCC_BDCR_RTCSEL_0 ((uint32_t)0x00000100)\000"
.LASF2198:
	.ascii	"TIM_CCMR1_OC2M_2 ((uint16_t)0x4000)\000"
.LASF2197:
	.ascii	"TIM_CCMR1_OC2M_1 ((uint16_t)0x2000)\000"
.LASF2794:
	.ascii	"EXTI_Line11 ((uint32_t)0x00000800)\000"
.LASF4471:
	.ascii	"_ZdlPv\000"
.LASF4036:
	.ascii	"CARIBOU_PORTA_AFRL PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF430:
	.ascii	"__crossworks_H \000"
.LASF1325:
	.ascii	"GPIO_BSRR_BR_3 ((uint32_t)0x00080000)\000"
.LASF1606:
	.ascii	"RCC_APB2RSTR_TIM1RST ((uint32_t)0x00000800)\000"
.LASF1673:
	.ascii	"RCC_CSR_V18PWRRSTF ((uint32_t)0x00800000)\000"
.LASF1444:
	.ascii	"I2C_ISR_ARLO ((uint32_t)0x00000200)\000"
.LASF3932:
	.ascii	"RCC_APB1Periph_USART2 RCC_APB1ENR_USART2EN\000"
.LASF1448:
	.ascii	"I2C_ISR_ALERT ((uint32_t)0x00002000)\000"
.LASF3861:
	.ascii	"RCC_HCLK_Div2 RCC_CFGR_PPRE_DIV2\000"
.LASF2422:
	.ascii	"USART_ICR_IDLECF ((uint32_t)0x00000010)\000"
.LASF3205:
	.ascii	"RTC_TamperTrigger_LowLevel ((uint32_t)0x00000000)\000"
.LASF1465:
	.ascii	"IWDG_PR_PR ((uint8_t)0x07)\000"
.LASF3652:
	.ascii	"TIM_DMABurstLength_4Bytes TIM_DMABurstLength_4Trans"
	.ascii	"fers\000"
.LASF2180:
	.ascii	"TIM_CCMR1_CC1S ((uint16_t)0x0003)\000"
.LASF2220:
	.ascii	"TIM_CCMR2_OC3PE ((uint16_t)0x0008)\000"
.LASF747:
	.ascii	"ADC_DR_DATA ((uint32_t)0x0000FFFF)\000"
.LASF344:
	.ascii	"__ARM_EABI__ 1\000"
.LASF585:
	.ascii	"PERIPH_BASE ((uint32_t)0x40000000)\000"
.LASF1092:
	.ascii	"FLASH_CR_OBL_LAUNCH ((uint32_t)0x00002000)\000"
.LASF2735:
	.ascii	"DMA1_IT_GL1 DMA_ISR_GIF1\000"
.LASF699:
	.ascii	"ADC_CFGR1_AWDSGL ((uint32_t)0x00400000)\000"
.LASF4274:
	.ascii	"TRIG_MAX 3.1415926535897932385e12\000"
.LASF3807:
	.ascii	"RCC_HSE_ON ((uint8_t)0x01)\000"
.LASF1002:
	.ascii	"EXTI_RTSR_TR9 ((uint32_t)0x00000200)\000"
.LASF437:
	.ascii	"__CTYPE_UPPER 0x01\000"
.LASF2284:
	.ascii	"TIM_BDTR_LOCK ((uint16_t)0x0300)\000"
.LASF3075:
	.ascii	"IWDG_FLAG_RVU IWDG_SR_RVU\000"
.LASF4412:
	.ascii	"unsigned char\000"
.LASF1497:
	.ascii	"PWR_CSR_EWUP2 ((uint16_t)0x0200)\000"
.LASF580:
	.ascii	"_IP_IDX(IRQn) ( ((uint32_t)(IRQn) >> 2) )\000"
.LASF3883:
	.ascii	"RCC_IT_HSIRDY ((uint8_t)0x04)\000"
.LASF3742:
	.ascii	"USART_FLAG_TEACK USART_ISR_TEACK\000"
.LASF422:
	.ascii	"UINT64_C(x) (x ##ULL)\000"
.LASF3525:
	.ascii	"TIM_DMABase_BDTR ((uint16_t)0x0011)\000"
.LASF2660:
	.ascii	"__STM32F0XX_DAC_H \000"
.LASF715:
	.ascii	"ADC_CFGR1_RES_1 ((uint32_t)0x00000010)\000"
.LASF500:
	.ascii	"__O volatile\000"
.LASF1285:
	.ascii	"GPIO_IDR_11 ((uint32_t)0x00000800)\000"
.LASF3903:
	.ascii	"IS_RCC_LSE_DRIVE(DRIVE) (((DRIVE) == RCC_LSEDrive_L"
	.ascii	"ow) || ((DRIVE) == RCC_LSEDrive_MediumLow) || ((DRI"
	.ascii	"VE) == RCC_LSEDrive_MediumHigh) || ((DRIVE) == RCC_"
	.ascii	"LSEDrive_High))\000"
.LASF785:
	.ascii	"CEC_IER_ARBLSTIE ((uint32_t)0x00000080)\000"
.LASF1843:
	.ascii	"RTC_ALRMAR_SU ((uint32_t)0x0000000F)\000"
.LASF741:
	.ascii	"ADC_CHSELR_CHSEL5 ((uint32_t)0x00000020)\000"
.LASF4043:
	.ascii	"CARIBOU_PORTB_AFRH PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF1199:
	.ascii	"GPIO_OSPEEDER_OSPEEDR7 ((uint32_t)0x0000C000)\000"
.LASF3129:
	.ascii	"RTC_Month_August ((uint8_t)0x08)\000"
.LASF1490:
	.ascii	"PWR_CR_PLS_LEV7 ((uint16_t)0x00E0)\000"
.LASF3560:
	.ascii	"IS_TIM_EXT_PRESCALER(PRESCALER) (((PRESCALER) == TI"
	.ascii	"M_ExtTRGPSC_OFF) || ((PRESCALER) == TIM_ExtTRGPSC_D"
	.ascii	"IV2) || ((PRESCALER) == TIM_ExtTRGPSC_DIV4) || ((PR"
	.ascii	"ESCALER) == TIM_ExtTRGPSC_DIV8))\000"
.LASF3686:
	.ascii	"USART_HardwareFlowControl_CTS ((uint32_t)USART_CR3_"
	.ascii	"CTSE)\000"
.LASF2100:
	.ascii	"TIM_CR1_URS ((uint16_t)0x0004)\000"
.LASF3518:
	.ascii	"TIM_DMABase_PSC ((uint16_t)0x000A)\000"
.LASF3048:
	.ascii	"I2C_IT_PECERR I2C_ISR_PECERR\000"
.LASF714:
	.ascii	"ADC_CFGR1_RES_0 ((uint32_t)0x00000008)\000"
.LASF2025:
	.ascii	"SYSCFG_EXTICR1_EXTI2 ((uint16_t)0x0F00)\000"
.LASF3687:
	.ascii	"USART_HardwareFlowControl_RTS_CTS ((uint32_t)USART_"
	.ascii	"CR3_RTSE | USART_CR3_CTSE)\000"
.LASF106:
	.ascii	"__UINT_LEAST8_MAX__ 0xff\000"
.LASF3080:
	.ascii	"__STM32F0XX_PWR_H \000"
.LASF2006:
	.ascii	"SPI_I2SCFGR_I2SE ((uint16_t)0x0400)\000"
.LASF1229:
	.ascii	"GPIO_PUPDR_PUPDR1 ((uint32_t)0x0000000C)\000"
.LASF1067:
	.ascii	"EXTI_PR_PR17 ((uint32_t)0x00020000)\000"
.LASF2254:
	.ascii	"TIM_CCER_CC1NE ((uint16_t)0x0004)\000"
.LASF2501:
	.ascii	"ADC_AnalogWatchdog_Channel_16 ((uint32_t)0x40000000"
	.ascii	")\000"
.LASF2902:
	.ascii	"GPIO_PinSource11 ((uint8_t)0x0B)\000"
.LASF2926:
	.ascii	"IS_EXTI_PORT_SOURCE(PORTSOURCE) (((PORTSOURCE) == E"
	.ascii	"XTI_PortSourceGPIOA) || ((PORTSOURCE) == EXTI_PortS"
	.ascii	"ourceGPIOB) || ((PORTSOURCE) == EXTI_PortSourceGPIO"
	.ascii	"C) || ((PORTSOURCE) == EXTI_PortSourceGPIOD) || ((P"
	.ascii	"ORTSOURCE) == EXTI_PortSourceGPIOF))\000"
.LASF1146:
	.ascii	"GPIO_MODER_MODER10_1 ((uint32_t)0x00200000)\000"
.LASF1941:
	.ascii	"RTC_BKP4R ((uint32_t)0xFFFFFFFF)\000"
.LASF3815:
	.ascii	"RCC_PLLMul_4 RCC_CFGR_PLLMULL4\000"
.LASF582:
	.ascii	"IS_FUNCTIONAL_STATE(STATE) (((STATE) == DISABLE) ||"
	.ascii	" ((STATE) == ENABLE))\000"
.LASF1009:
	.ascii	"EXTI_RTSR_TR16 ((uint32_t)0x00010000)\000"
.LASF2693:
	.ascii	"DBGMCU_IWDG_STOP DBGMCU_APB1_FZ_DBG_IWDG_STOP\000"
.LASF2417:
	.ascii	"USART_ISR_REACK ((uint32_t)0x00400000)\000"
.LASF1607:
	.ascii	"RCC_APB2RSTR_SPI1RST ((uint32_t)0x00001000)\000"
.LASF290:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF1232:
	.ascii	"GPIO_PUPDR_PUPDR2 ((uint32_t)0x00000030)\000"
.LASF707:
	.ascii	"ADC_CFGR1_EXTEN_1 ((uint32_t)0x00000800)\000"
.LASF3097:
	.ascii	"PWR_SLEEPEntry_WFE ((uint8_t)0x02)\000"
.LASF174:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF510:
	.ascii	"SCB_CPUID_REVISION_Pos 0\000"
.LASF2172:
	.ascii	"TIM_EGR_UG ((uint8_t)0x01)\000"
.LASF4344:
	.ascii	"chip_adc_port_t ADC_TypeDef*\000"
.LASF2322:
	.ascii	"USART_CR1_MME ((uint32_t)0x00002000)\000"
.LASF3357:
	.ascii	"SPI_LastDMATransfer_TxEvenRxEven ((uint16_t)0x0000)"
	.ascii	"\000"
.LASF1708:
	.ascii	"RCC_CFGR2_PREDIV1_DIV16 ((uint32_t)0x0000000F)\000"
.LASF79:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF2134:
	.ascii	"TIM_SMCR_MSM ((uint16_t)0x0080)\000"
.LASF4132:
	.ascii	"EBADE 52\000"
.LASF2642:
	.ascii	"COMP_Output_TIM3IC1 ((uint32_t)0x00000600)\000"
.LASF4030:
	.ascii	"GPIO_AF_GPIO 0\000"
.LASF2369:
	.ascii	"USART_CR3_RTSE ((uint32_t)0x00000100)\000"
.LASF292:
	.ascii	"__HA_FBIT__ 7\000"
.LASF3580:
	.ascii	"TIM_ForcedAction_Active ((uint16_t)0x0050)\000"
.LASF1624:
	.ascii	"RCC_APB1RSTR_CECRST ((uint32_t)0x40000000)\000"
.LASF289:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF2114:
	.ascii	"TIM_CR2_MMS_0 ((uint16_t)0x0010)\000"
.LASF449:
	.ascii	"__RAL_WCHAR_T unsigned\000"
.LASF784:
	.ascii	"CEC_IER_RXACKEIE ((uint32_t)0x00000040)\000"
.LASF3824:
	.ascii	"RCC_PLLMul_13 RCC_CFGR_PLLMULL13\000"
.LASF215:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF2643:
	.ascii	"COMP_Output_TIM3OCREFCLR COMP_CSR_COMP1OUTSEL\000"
.LASF4199:
	.ascii	"ENAVAIL 119\000"
.LASF525:
	.ascii	"SCB_ICSR_ISRPENDING_Msk (1UL << SCB_ICSR_ISRPENDING"
	.ascii	"_Pos)\000"
.LASF95:
	.ascii	"__UINT16_MAX__ 0xffff\000"
.LASF3113:
	.ascii	"IS_RTC_SYNCH_PREDIV(PREDIV) ((PREDIV) <= 0x7FFF)\000"
.LASF1185:
	.ascii	"GPIO_OSPEEDER_OSPEEDR2_0 ((uint32_t)0x00000010)\000"
.LASF3497:
	.ascii	"IS_TIM_IC_PRESCALER(PRESCALER) (((PRESCALER) == TIM"
	.ascii	"_ICPSC_DIV1) || ((PRESCALER) == TIM_ICPSC_DIV2) || "
	.ascii	"((PRESCALER) == TIM_ICPSC_DIV4) || ((PRESCALER) == "
	.ascii	"TIM_ICPSC_DIV8))\000"
.LASF596:
	.ascii	"SPI2_BASE (APBPERIPH_BASE + 0x00003800)\000"
.LASF4151:
	.ascii	"EPROTO 71\000"
.LASF2924:
	.ascii	"EXTI_PortSourceGPIOD ((uint8_t)0x03)\000"
.LASF640:
	.ascii	"I2C1 ((I2C_TypeDef *) I2C1_BASE)\000"
.LASF3624:
	.ascii	"IS_TIM_MSM_STATE(STATE) (((STATE) == TIM_MasterSlav"
	.ascii	"eMode_Enable) || ((STATE) == TIM_MasterSlaveMode_Di"
	.ascii	"sable))\000"
.LASF3808:
	.ascii	"RCC_HSE_Bypass ((uint8_t)0x05)\000"
.LASF3491:
	.ascii	"TIM_ICSelection_TRC ((uint16_t)0x0003)\000"
.LASF1558:
	.ascii	"RCC_CFGR_PLLMULL3 ((uint32_t)0x00040000)\000"
.LASF1575:
	.ascii	"RCC_CFGR_MCO_2 ((uint32_t)0x04000000)\000"
.LASF848:
	.ascii	"DAC_DHR12L1_DACC1DHR ((uint32_t)0x0000FFF0)\000"
.LASF1455:
	.ascii	"I2C_ICR_BERRCF ((uint32_t)0x00000100)\000"
.LASF2245:
	.ascii	"TIM_CCMR2_IC4PSC_0 ((uint16_t)0x0400)\000"
.LASF4143:
	.ascii	"ENOSR 63\000"
.LASF3321:
	.ascii	"I2S_Mode_MasterRx ((uint16_t)0x0300)\000"
.LASF281:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF3114:
	.ascii	"IS_RTC_HOUR12(HOUR) (((HOUR) > 0) && ((HOUR) <= 12)"
	.ascii	")\000"
.LASF3945:
	.ascii	"RCC_MCOSource_HSE ((uint8_t)0x06)\000"
.LASF3483:
	.ascii	"TIM_OCNIdleState_Reset ((uint16_t)0x0000)\000"
.LASF312:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF779:
	.ascii	"CEC_IER_RXENDIE ((uint32_t)0x00000002)\000"
.LASF826:
	.ascii	"COMP_CSR_COMP2HYST_1 ((uint32_t)0x20000000)\000"
.LASF2274:
	.ascii	"TIM_CCR4_CCR4 ((uint16_t)0xFFFF)\000"
.LASF3383:
	.ascii	"SPI_TransmissionFIFOStatus_Full ((uint16_t)0x1800)\000"
.LASF1344:
	.ascii	"GPIO_LCKR_LCK6 ((uint32_t)0x00000040)\000"
.LASF611:
	.ascii	"TIM15_BASE (APBPERIPH_BASE + 0x00014000)\000"
.LASF3677:
	.ascii	"USART_Parity_No ((uint32_t)0x00000000)\000"
.LASF601:
	.ascii	"DAC_BASE (APBPERIPH_BASE + 0x00007400)\000"
.LASF1788:
	.ascii	"RTC_CR_DCE ((uint32_t)0x00000080)\000"
.LASF940:
	.ascii	"DMA_CCR_PL_1 ((uint32_t)0x00002000)\000"
.LASF1641:
	.ascii	"RCC_APB2ENR_TIM16EN ((uint32_t)0x00020000)\000"
.LASF3830:
	.ascii	"RCC_PREDIV1_Div2 RCC_CFGR2_PREDIV1_DIV2\000"
.LASF2379:
	.ascii	"USART_CR3_SCARCNT_1 ((uint32_t)0x00040000)\000"
.LASF489:
	.ascii	"__CM0_CMSIS_VERSION_MAIN (0x02)\000"
.LASF1858:
	.ascii	"RTC_TSTR_HU_1 ((uint32_t)0x00020000)\000"
.LASF2525:
	.ascii	"ADC_Channel_10 ADC_CHSELR_CHSEL10\000"
.LASF1414:
	.ascii	"I2C_CR2_NACK ((uint32_t)0x00008000)\000"
.LASF2178:
	.ascii	"TIM_EGR_TG ((uint8_t)0x40)\000"
.LASF2070:
	.ascii	"SYSCFG_EXTICR3_EXTI9_PB ((uint16_t)0x0010)\000"
.LASF1734:
	.ascii	"RTC_TR_MNU_0 ((uint32_t)0x00000100)\000"
.LASF1714:
	.ascii	"RCC_CFGR3_ADCSW ((uint32_t)0x00000100)\000"
.LASF709:
	.ascii	"ADC_CFGR1_EXTSEL_0 ((uint32_t)0x00000040)\000"
.LASF3724:
	.ascii	"USART_DEPolarity_Low USART_CR3_DEP\000"
.LASF2217:
	.ascii	"TIM_CCMR2_CC3S_0 ((uint16_t)0x0001)\000"
.LASF3463:
	.ascii	"TIM_BreakPolarity_High ((uint16_t)0x2000)\000"
.LASF1209:
	.ascii	"GPIO_OSPEEDER_OSPEEDR10_0 ((uint32_t)0x00100000)\000"
.LASF1491:
	.ascii	"PWR_CR_DBP ((uint16_t)0x0100)\000"
.LASF4278:
	.ascii	"FP_ZDIV 2\000"
.LASF241:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF3405:
	.ascii	"IS_TIM_LIST4_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIP"
	.ascii	"H) == TIM14) || ((PERIPH) == TIM15)|| ((PERIPH) == "
	.ascii	"TIM16)|| ((PERIPH) == TIM17))\000"
.LASF325:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF144:
	.ascii	"__DBL_DIG__ 6\000"
.LASF3143:
	.ascii	"IS_RTC_WEEKDAY(WEEKDAY) (((WEEKDAY) == RTC_Weekday_"
	.ascii	"Monday) || ((WEEKDAY) == RTC_Weekday_Tuesday) || (("
	.ascii	"WEEKDAY) == RTC_Weekday_Wednesday) || ((WEEKDAY) =="
	.ascii	" RTC_Weekday_Thursday) || ((WEEKDAY) == RTC_Weekday"
	.ascii	"_Friday) || ((WEEKDAY) == RTC_Weekday_Saturday) || "
	.ascii	"((WEEKDAY) == RTC_Weekday_Sunday))\000"
.LASF1450:
	.ascii	"I2C_ISR_DIR ((uint32_t)0x00010000)\000"
.LASF1163:
	.ascii	"GPIO_OTYPER_OT_1 ((uint32_t)0x00000002)\000"
.LASF410:
	.ascii	"PTRDIFF_MAX INT32_MAX\000"
.LASF1107:
	.ascii	"OB_RDP_nRDP ((uint32_t)0x0000FF00)\000"
.LASF2056:
	.ascii	"SYSCFG_EXTICR2_EXTI6_PC ((uint16_t)0x0200)\000"
.LASF860:
	.ascii	"DBGMCU_IDCODE_REV_ID_6 ((uint32_t)0x00400000)\000"
.LASF1190:
	.ascii	"GPIO_OSPEEDER_OSPEEDR4 ((uint32_t)0x00000300)\000"
.LASF392:
	.ascii	"INT_LEAST64_MAX INT64_MAX\000"
.LASF2321:
	.ascii	"USART_CR1_M ((uint32_t)0x00001000)\000"
.LASF3715:
	.ascii	"USART_WakeUpSource_RXNE ((uint32_t)USART_CR3_WUS_0 "
	.ascii	"| USART_CR3_WUS_1)\000"
.LASF2185:
	.ascii	"TIM_CCMR1_OC1M ((uint16_t)0x0070)\000"
.LASF3088:
	.ascii	"PWR_PVDLevel_7 PWR_CR_PLS_LEV7\000"
.LASF4013:
	.ascii	"caribou_gpio_set_pulldown(gpio) chip_gpio_set_pulld"
	.ascii	"own((gpio)->port,(gpio)->pinmask)\000"
.LASF1925:
	.ascii	"RTC_TAFCR_TAMP3E ((uint32_t)0x00000020)\000"
.LASF3869:
	.ascii	"IS_RCC_ADCCLK(ADCCLK) (((ADCCLK) == RCC_ADCCLK_HSI1"
	.ascii	"4) || ((ADCCLK) == RCC_ADCCLK_PCLK_Div2) || ((ADCCL"
	.ascii	"K) == RCC_ADCCLK_PCLK_Div4))\000"
.LASF3503:
	.ascii	"TIM_IT_COM ((uint16_t)0x0020)\000"
.LASF2632:
	.ascii	"COMP_InvertingInput_VREFINT ((uint32_t)0x00000030)\000"
.LASF1127:
	.ascii	"GPIO_MODER_MODER4_0 ((uint32_t)0x00000100)\000"
.LASF347:
	.ascii	"__SIZEOF_WCHAR_T 4\000"
.LASF2801:
	.ascii	"EXTI_Line19 ((uint32_t)0x00080000)\000"
.LASF3073:
	.ascii	"IS_IWDG_PRESCALER(PRESCALER) (((PRESCALER) == IWDG_"
	.ascii	"Prescaler_4) || ((PRESCALER) == IWDG_Prescaler_8) |"
	.ascii	"| ((PRESCALER) == IWDG_Prescaler_16) || ((PRESCALER"
	.ascii	") == IWDG_Prescaler_32) || ((PRESCALER) == IWDG_Pre"
	.ascii	"scaler_64) || ((PRESCALER) == IWDG_Prescaler_128)||"
	.ascii	" ((PRESCALER) == IWDG_Prescaler_256))\000"
.LASF3093:
	.ascii	"PWR_Regulator_ON ((uint32_t)0x00000000)\000"
.LASF1314:
	.ascii	"GPIO_BSRR_BS_8 ((uint32_t)0x00000100)\000"
.LASF4196:
	.ascii	"ESTALE 116\000"
.LASF4117:
	.ascii	"ENOLCK 37\000"
.LASF1035:
	.ascii	"EXTI_SWIER_SWIER4 ((uint32_t)0x00000010)\000"
.LASF3344:
	.ascii	"I2S_AudioFreq_11k ((uint32_t)11025)\000"
.LASF2391:
	.ascii	"USART_RQR_ABRRQ ((uint16_t)0x0001)\000"
.LASF2141:
	.ascii	"TIM_SMCR_ETPS_0 ((uint16_t)0x1000)\000"
.LASF2979:
	.ascii	"I2C_AcknowledgedAddress_7bit ((uint32_t)0x00000000)"
	.ascii	"\000"
.LASF2723:
	.ascii	"DMA_Priority_VeryHigh DMA_CCR_PL\000"
.LASF2934:
	.ascii	"EXTI_PinSource7 ((uint8_t)0x07)\000"
.LASF932:
	.ascii	"DMA_CCR_PSIZE ((uint32_t)0x00000300)\000"
.LASF3983:
	.ascii	"CARIBOU_GPIO_PIN_5 (1<<5)\000"
.LASF214:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF1812:
	.ascii	"RTC_ALRMAR_DT_1 ((uint32_t)0x20000000)\000"
.LASF2976:
	.ascii	"I2C_Ack_Enable ((uint32_t)0x00000000)\000"
.LASF1179:
	.ascii	"GPIO_OSPEEDER_OSPEEDR0_0 ((uint32_t)0x00000001)\000"
.LASF1034:
	.ascii	"EXTI_SWIER_SWIER3 ((uint32_t)0x00000008)\000"
.LASF2911:
	.ascii	"GPIO_AF_3 ((uint8_t)0x03)\000"
.LASF3853:
	.ascii	"RCC_SYSCLK_Div8 RCC_CFGR_HPRE_DIV8\000"
.LASF4214:
	.ascii	"errno __errno\000"
.LASF2658:
	.ascii	"COMP_OutputLevel_High COMP_CSR_COMP1OUT\000"
.LASF1949:
	.ascii	"SPI_CR1_SPE ((uint16_t)0x0040)\000"
.LASF3984:
	.ascii	"CARIBOU_GPIO_PIN_6 (1<<6)\000"
.LASF3416:
	.ascii	"TIM_OCMode_Toggle ((uint16_t)0x0030)\000"
.LASF1117:
	.ascii	"GPIO_MODER_MODER1 ((uint32_t)0x0000000C)\000"
.LASF1593:
	.ascii	"RCC_CIR_HSIRDYIE ((uint32_t)0x00000400)\000"
.LASF2685:
	.ascii	"DBGMCU_STANDBY DBGMCU_CR_DBG_STANDBY\000"
.LASF958:
	.ascii	"EXTI_IMR_MR13 ((uint32_t)0x00002000)\000"
.LASF658:
	.ascii	"DMA1_Channel1 ((DMA_Channel_TypeDef *) DMA1_Channel"
	.ascii	"1_BASE)\000"
.LASF3412:
	.ascii	"IS_TIM_LIST11_PERIPH(PERIPH) ((PERIPH) == TIM14)\000"
.LASF3136:
	.ascii	"RTC_Weekday_Monday ((uint8_t)0x01)\000"
.LASF3161:
	.ascii	"RTC_AlarmSubSecondMask_SS14_2 ((uint8_t)0x02)\000"
.LASF3543:
	.ascii	"TIM_DMABurstLength_15Transfers ((uint16_t)0x0E00)\000"
.LASF2277:
	.ascii	"TIM_BDTR_DTG_1 ((uint16_t)0x0002)\000"
.LASF1729:
	.ascii	"RTC_TR_MNT ((uint32_t)0x00007000)\000"
.LASF1350:
	.ascii	"GPIO_LCKR_LCK12 ((uint32_t)0x00001000)\000"
.LASF2913:
	.ascii	"GPIO_AF_5 ((uint8_t)0x05)\000"
.LASF1963:
	.ascii	"SPI_CR2_FRF ((uint16_t)0x0010)\000"
.LASF4116:
	.ascii	"ENAMETOOLONG 36\000"
.LASF4262:
	.ascii	"PI_BY_2 1.57079632679489662\000"
.LASF234:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF4292:
	.ascii	"FP_COTE 16\000"
.LASF1120:
	.ascii	"GPIO_MODER_MODER2 ((uint32_t)0x00000030)\000"
.LASF1684:
	.ascii	"RCC_AHBRSTR_GPIOCRST ((uint32_t)0x00080000)\000"
.LASF2554:
	.ascii	"ADC_FLAG_ADDIS ((uint32_t)0x01000002)\000"
.LASF2731:
	.ascii	"DMA_IT_TC DMA_CCR_TCIE\000"
.LASF3174:
	.ascii	"RTC_AlarmSubSecondMask_None ((uint8_t)0x0F)\000"
.LASF239:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF2119:
	.ascii	"TIM_CR2_OIS1N ((uint16_t)0x0200)\000"
.LASF19:
	.ascii	"__SIZEOF_DOUBLE__ 4\000"
.LASF1977:
	.ascii	"SPI_SR_CHSIDE ((uint16_t)0x0004)\000"
.LASF1417:
	.ascii	"I2C_CR2_AUTOEND ((uint32_t)0x02000000)\000"
.LASF237:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF133:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF1515:
	.ascii	"RCC_CFGR_SWS_0 ((uint32_t)0x00000004)\000"
.LASF754:
	.ascii	"CEC_CFGR_SFT ((uint32_t)0x00000007)\000"
.LASF2563:
	.ascii	"CEC_SignalFreeTime_2T ((uint32_t)0x00000002)\000"
.LASF702:
	.ascii	"ADC_CFGR1_WAIT ((uint32_t)0x00004000)\000"
.LASF1579:
	.ascii	"RCC_CFGR_MCO_LSE ((uint32_t)0x03000000)\000"
.LASF2424:
	.ascii	"USART_ICR_LBDCF ((uint32_t)0x00000100)\000"
.LASF2602:
	.ascii	"IS_CEC_IT(IT) ((((IT) & (uint32_t)0xFFFFE000) == 0x"
	.ascii	"00) && ((IT) != 0x00))\000"
.LASF128:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF586:
	.ascii	"APBPERIPH_BASE PERIPH_BASE\000"
.LASF3149:
	.ascii	"RTC_AlarmMask_None ((uint32_t)0x00000000)\000"
.LASF3696:
	.ascii	"USART_CPHA_2Edge USART_CR2_CPHA\000"
.LASF2719:
	.ascii	"IS_DMA_MEMORY_DATA_SIZE(SIZE) (((SIZE) == DMA_Memor"
	.ascii	"yDataSize_Byte) || ((SIZE) == DMA_MemoryDataSize_Ha"
	.ascii	"lfWord) || ((SIZE) == DMA_MemoryDataSize_Word))\000"
.LASF1319:
	.ascii	"GPIO_BSRR_BS_13 ((uint32_t)0x00002000)\000"
.LASF4034:
	.ascii	"CARIBOU_PORTA_OSPEEDR PIN_OSPEEDR(0,GPIO_Speed_2MHz"
	.ascii	") | PIN_OSPEEDR(1,GPIO_Speed_2MHz) | PIN_OSPEEDR(2,"
	.ascii	"GPIO_Speed_2MHz) | PIN_OSPEEDR(3,GPIO_Speed_2MHz) |"
	.ascii	" PIN_OSPEEDR(4,GPIO_Speed_2MHz) | PIN_OSPEEDR(5,GPI"
	.ascii	"O_Speed_2MHz) | PIN_OSPEEDR(6,GPIO_Speed_2MHz) | PI"
	.ascii	"N_OSPEEDR(7,GPIO_Speed_2MHz) | PIN_OSPEEDR(8,GPIO_S"
	.ascii	"peed_2MHz) | PIN_OSPEEDR(9,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(10,GPIO_Speed_2MHz) | PIN_OSPEEDR(11,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(12,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(13,GPIO_Speed_10MHz) | PIN_OSPEEDR(14,GPIO_S"
	.ascii	"peed_10MHz) | PIN_OSPEEDR(15,GPIO_Speed_2MHz)\000"
.LASF3369:
	.ascii	"SPI_Direction_Tx ((uint16_t)0x4000)\000"
.LASF1324:
	.ascii	"GPIO_BSRR_BR_2 ((uint32_t)0x00040000)\000"
.LASF4246:
	.ascii	"CARIBOU_MUTEX_F_NOYIELD 0x01\000"
.LASF4227:
	.ascii	"THREAD_FAULT_ALLOC_FAILURE 0x0008\000"
.LASF2824:
	.ascii	"OB_WRP_Pages24to27 ((uint32_t)0x00000040)\000"
.LASF1297:
	.ascii	"GPIO_ODR_7 ((uint32_t)0x00000080)\000"
.LASF4389:
	.ascii	"_CARIBOU_SPI_STM32F0xx_H_ \000"
.LASF103:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF2823:
	.ascii	"OB_WRP_Pages20to23 ((uint32_t)0x00000020)\000"
.LASF3908:
	.ascii	"RCC_AHBPeriph_GPIOF RCC_AHBENR_GPIOFEN\000"
.LASF3528:
	.ascii	"IS_TIM_DMA_BASE(BASE) (((BASE) == TIM_DMABase_CR1) "
	.ascii	"|| ((BASE) == TIM_DMABase_CR2) || ((BASE) == TIM_DM"
	.ascii	"ABase_SMCR) || ((BASE) == TIM_DMABase_DIER) || ((BA"
	.ascii	"SE) == TIM_DMABase_SR) || ((BASE) == TIM_DMABase_EG"
	.ascii	"R) || ((BASE) == TIM_DMABase_CCMR1) || ((BASE) == T"
	.ascii	"IM_DMABase_CCMR2) || ((BASE) == TIM_DMABase_CCER) |"
	.ascii	"| ((BASE) == TIM_DMABase_CNT) || ((BASE) == TIM_DMA"
	.ascii	"Base_PSC) || ((BASE) == TIM_DMABase_ARR) || ((BASE)"
	.ascii	" == TIM_DMABase_RCR) || ((BASE) == TIM_DMABase_CCR1"
	.ascii	") || ((BASE) == TIM_DMABase_CCR2) || ((BASE) == TIM"
	.ascii	"_DMABase_CCR3) || ((BASE) == TIM_DMABase_CCR4) || ("
	.ascii	"(BASE) == TIM_DMABase_BDTR) || ((BASE) == TIM_DMABa"
	.ascii	"se_DCR) || ((BASE) == TIM_DMABase_OR))\000"
.LASF570:
	.ascii	"SCS_BASE (0xE000E000UL)\000"
.LASF798:
	.ascii	"COMP_CSR_COMP1INSEL_1 ((uint32_t)0x00000020)\000"
.LASF4155:
	.ascii	"EOVERFLOW 75\000"
.LASF2579:
	.ascii	"CEC_LongBitPeriodError_Off ((uint32_t)0x00000000)\000"
.LASF2216:
	.ascii	"TIM_CCMR2_CC3S ((uint16_t)0x0003)\000"
.LASF3341:
	.ascii	"I2S_AudioFreq_32k ((uint32_t)32000)\000"
.LASF2833:
	.ascii	"OB_WRP_Pages60to63 ((uint32_t)0x00008000)\000"
.LASF2937:
	.ascii	"EXTI_PinSource10 ((uint8_t)0x0A)\000"
.LASF2191:
	.ascii	"TIM_CCMR1_CC2S_0 ((uint16_t)0x0100)\000"
.LASF2656:
	.ascii	"COMP_Mode_UltraLowPower COMP_CSR_COMP1MODE\000"
.LASF3496:
	.ascii	"TIM_ICPSC_DIV8 ((uint16_t)0x000C)\000"
.LASF1061:
	.ascii	"EXTI_PR_PR11 ((uint32_t)0x00000800)\000"
.LASF2092:
	.ascii	"SYSCFG_EXTICR4_EXTI15_PB ((uint16_t)0x1000)\000"
.LASF1931:
	.ascii	"RTC_ALRMASSR_MASKSS ((uint32_t)0x0F000000)\000"
.LASF4372:
	.ascii	"CARIBOU_ADC_Channel_24 ((uint8_t)0x18)\000"
.LASF1161:
	.ascii	"GPIO_MODER_MODER15_1 ((uint32_t)0x80000000)\000"
.LASF3423:
	.ascii	"IS_TIM_OPM_MODE(MODE) (((MODE) == TIM_OPMode_Single"
	.ascii	") || ((MODE) == TIM_OPMode_Repetitive))\000"
.LASF233:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF2647:
	.ascii	"IS_COMP_OUTPUT_POL(POL) (((POL) == COMP_OutputPol_N"
	.ascii	"onInverted) || ((POL) == COMP_OutputPol_Inverted))\000"
.LASF2679:
	.ascii	"DAC_IT_DMAUDR DAC_SR_DMAUDR1\000"
.LASF12:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF1700:
	.ascii	"RCC_CFGR2_PREDIV1_DIV8 ((uint32_t)0x00000007)\000"
.LASF2730:
	.ascii	"IS_DMA_M2M_STATE(STATE) (((STATE) == DMA_M2M_Disabl"
	.ascii	"e) || ((STATE) == DMA_M2M_Enable))\000"
.LASF2529:
	.ascii	"ADC_Channel_14 ADC_CHSELR_CHSEL14\000"
.LASF1726:
	.ascii	"RTC_TR_HU_1 ((uint32_t)0x00020000)\000"
.LASF1429:
	.ascii	"I2C_TIMINGR_PRESC ((uint32_t)0xF0000000)\000"
.LASF3095:
	.ascii	"IS_PWR_REGULATOR(REGULATOR) (((REGULATOR) == PWR_Re"
	.ascii	"gulator_ON) || ((REGULATOR) == PWR_Regulator_LowPow"
	.ascii	"er))\000"
.LASF2775:
	.ascii	"DMA1_FLAG_HT5 DMA_ISR_HTIF5\000"
.LASF3277:
	.ascii	"SPI_Mode_Master ((uint16_t)0x0104)\000"
.LASF3028:
	.ascii	"I2C_FLAG_TCR I2C_ISR_TCR\000"
.LASF733:
	.ascii	"ADC_CHSELR_CHSEL13 ((uint32_t)0x00002000)\000"
.LASF1375:
	.ascii	"GPIO_BRR_BR_4 ((uint32_t)0x00000010)\000"
.LASF400:
	.ascii	"INT_FAST64_MIN INT64_MIN\000"
.LASF2815:
	.ascii	"IS_FLASH_IT(IT) ((((IT) & (uint32_t)0xFFFFEBFF) == "
	.ascii	"0x00000000) && (((IT) != 0x00000000)))\000"
.LASF617:
	.ascii	"DMA1_Channel2_BASE (DMA1_BASE + 0x0000001C)\000"
.LASF3305:
	.ascii	"IS_SPI_NSS(NSS) (((NSS) == SPI_NSS_Soft) || ((NSS) "
	.ascii	"== SPI_NSS_Hard))\000"
.LASF654:
	.ascii	"TIM16 ((TIM_TypeDef *) TIM16_BASE)\000"
.LASF3896:
	.ascii	"RCC_RTCCLKSource_LSI RCC_BDCR_RTCSEL_LSI\000"
.LASF263:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF4272:
	.ascii	"MAXLONG 017777777777L\000"
.LASF671:
	.ascii	"GPIOD ((GPIO_TypeDef *) GPIOD_BASE)\000"
.LASF2546:
	.ascii	"IS_ADC_CLEAR_IT(IT) (((IT) != (uint32_t)RESET) && ("
	.ascii	"((IT) & 0xFFFFFF60) == (uint32_t)RESET))\000"
.LASF1867:
	.ascii	"RTC_TSTR_MNU_1 ((uint32_t)0x00000200)\000"
.LASF3431:
	.ascii	"TIM_CKD_DIV1 ((uint16_t)0x0000)\000"
.LASF9:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF1374:
	.ascii	"GPIO_BRR_BR_3 ((uint32_t)0x00000008)\000"
.LASF696:
	.ascii	"ADC_CFGR1_AWDCH_3 ((uint32_t)0x20000000)\000"
.LASF3520:
	.ascii	"TIM_DMABase_RCR ((uint16_t)0x000C)\000"
.LASF1486:
	.ascii	"PWR_CR_PLS_LEV3 ((uint16_t)0x0060)\000"
.LASF2763:
	.ascii	"DMA1_FLAG_HT2 DMA_ISR_HTIF2\000"
.LASF11:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF2341:
	.ascii	"USART_CR2_LBDIE ((uint32_t)0x00000040)\000"
.LASF3148:
	.ascii	"IS_RTC_ALARM_DATE_WEEKDAY_SEL(SEL) (((SEL) == RTC_A"
	.ascii	"larmDateWeekDaySel_Date) || ((SEL) == RTC_AlarmDate"
	.ascii	"WeekDaySel_WeekDay))\000"
.LASF2236:
	.ascii	"TIM_CCMR2_IC3PSC ((uint16_t)0x000C)\000"
.LASF2992:
	.ascii	"I2C_OA2_Mask01 ((uint8_t)0x01)\000"
.LASF3076:
	.ascii	"IWDG_FLAG_WVU IWDG_SR_WVU\000"
.LASF439:
	.ascii	"__CTYPE_DIGIT 0x04\000"
.LASF4480:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../../ca"
	.ascii	"ribou++/src/caribou++.cpp\000"
.LASF388:
	.ascii	"INT_LEAST64_MIN INT64_MIN\000"
.LASF560:
	.ascii	"SysTick_LOAD_RELOAD_Pos 0\000"
.LASF2179:
	.ascii	"TIM_EGR_BG ((uint8_t)0x80)\000"
.LASF2540:
	.ascii	"ADC_IT_EOC ADC_IER_EOCIE\000"
.LASF885:
	.ascii	"DMA_ISR_TCIF1 ((uint32_t)0x00000002)\000"
.LASF4109:
	.ascii	"ESPIPE 29\000"
.LASF2171:
	.ascii	"TIM_SR_CC4OF ((uint16_t)0x1000)\000"
.LASF1749:
	.ascii	"RTC_DR_YT_1 ((uint32_t)0x00200000)\000"
.LASF1460:
	.ascii	"I2C_ICR_ALERTCF ((uint32_t)0x00002000)\000"
.LASF1670:
	.ascii	"RCC_BDCR_BDRST ((uint32_t)0x00010000)\000"
.LASF2053:
	.ascii	"SYSCFG_EXTICR2_EXTI5_PF ((uint16_t)0x0030)\000"
.LASF1903:
	.ascii	"RTC_CAL_CALM_1 ((uint32_t)0x00000002)\000"
.LASF2772:
	.ascii	"DMA1_FLAG_TE4 DMA_ISR_TEIF4\000"
.LASF2965:
	.ascii	"__STM32F0XX_I2C_H \000"
.LASF173:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF2017:
	.ascii	"SYSCFG_CFGR1_TIM16_DMA_RMP ((uint32_t)0x00000800)\000"
.LASF3091:
	.ascii	"PWR_WakeUpPin_2 PWR_CSR_EWUP2\000"
.LASF639:
	.ascii	"USART2 ((USART_TypeDef *) USART2_BASE)\000"
.LASF3995:
	.ascii	"CARIBOU_GPIO_PIN_17 (1<<17)\000"
.LASF1425:
	.ascii	"I2C_TIMINGR_SCLL ((uint32_t)0x000000FF)\000"
.LASF2107:
	.ascii	"TIM_CR1_CKD ((uint16_t)0x0300)\000"
.LASF825:
	.ascii	"COMP_CSR_COMP2HYST_0 ((uint32_t)0x10000000)\000"
.LASF1129:
	.ascii	"GPIO_MODER_MODER5 ((uint32_t)0x00000C00)\000"
.LASF1443:
	.ascii	"I2C_ISR_BERR ((uint32_t)0x00000100)\000"
.LASF4433:
	.ascii	"reloadticks\000"
.LASF3033:
	.ascii	"I2C_FLAG_TIMEOUT I2C_ISR_TIMEOUT\000"
.LASF1610:
	.ascii	"RCC_APB2RSTR_TIM16RST ((uint32_t)0x00020000)\000"
.LASF1403:
	.ascii	"I2C_CR1_GCEN ((uint32_t)0x00080000)\000"
.LASF172:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF3147:
	.ascii	"RTC_AlarmDateWeekDaySel_WeekDay ((uint32_t)0x400000"
	.ascii	"00)\000"
.LASF3731:
	.ascii	"IS_USART_AUTOBAUDRATE_MODE(MODE) (((MODE) == USART_"
	.ascii	"AutoBaudRate_StartBit) || ((MODE) == USART_AutoBaud"
	.ascii	"Rate_FallingEdge))\000"
.LASF4371:
	.ascii	"CARIBOU_ADC_Channel_23 ((uint8_t)0x17)\000"
.LASF3442:
	.ascii	"TIM_OCPolarity_Low ((uint16_t)0x0002)\000"
.LASF3698:
	.ascii	"USART_LastBit_Disable ((uint32_t)0x00000000)\000"
.LASF2675:
	.ascii	"DAC_Align_12b_L ((uint32_t)0x00000004)\000"
.LASF2467:
	.ascii	"ADC_ExternalTrigConvEdge_Falling ADC_CFGR1_EXTEN_1\000"
.LASF1420:
	.ascii	"I2C_OAR1_OA1MODE ((uint32_t)0x00000400)\000"
.LASF244:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF3309:
	.ascii	"SPI_BaudRatePrescaler_16 ((uint16_t)0x0018)\000"
.LASF1316:
	.ascii	"GPIO_BSRR_BS_10 ((uint32_t)0x00000400)\000"
.LASF4458:
	.ascii	"thread\000"
.LASF1716:
	.ascii	"RCC_CR2_HSI14RDY ((uint32_t)0x00000002)\000"
.LASF955:
	.ascii	"EXTI_IMR_MR10 ((uint32_t)0x00000400)\000"
.LASF8:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF3561:
	.ascii	"TIM_TS_ITR0 ((uint16_t)0x0000)\000"
.LASF3744:
	.ascii	"USART_FLAG_RWU USART_ISR_RWU\000"
.LASF3840:
	.ascii	"RCC_PREDIV1_Div12 RCC_CFGR2_PREDIV1_DIV12\000"
.LASF4287:
	.ascii	"FP_SEXP 11\000"
.LASF4219:
	.ascii	"CARIBOU_THREAD_HIGHPRIO 2\000"
.LASF3200:
	.ascii	"RTC_StoreOperation_Reset ((uint32_t)0x00000000)\000"
.LASF1407:
	.ascii	"I2C_CR1_PECEN ((uint32_t)0x00800000)\000"
.LASF936:
	.ascii	"DMA_CCR_MSIZE_0 ((uint32_t)0x00000400)\000"
.LASF545:
	.ascii	"SCB_SCR_SLEEPONEXIT_Msk (1UL << SCB_SCR_SLEEPONEXIT"
	.ascii	"_Pos)\000"
.LASF855:
	.ascii	"DBGMCU_IDCODE_REV_ID_1 ((uint32_t)0x00020000)\000"
.LASF3486:
	.ascii	"TIM_ICPolarity_Falling ((uint16_t)0x0002)\000"
.LASF1890:
	.ascii	"RTC_TSDR_DT_0 ((uint32_t)0x00000010)\000"
.LASF3291:
	.ascii	"SPI_DataSize_15b ((uint16_t)0x0E00)\000"
.LASF3631:
	.ascii	"TIM_FLAG_Trigger ((uint16_t)0x0040)\000"
.LASF3681:
	.ascii	"USART_Mode_Rx USART_CR1_RE\000"
.LASF3081:
	.ascii	"PWR_PVDLevel_0 PWR_CR_PLS_LEV0\000"
.LASF403:
	.ascii	"INT_FAST32_MAX INT32_MAX\000"
.LASF3057:
	.ascii	"I2C_No_StartStop ((uint32_t)0x00000000)\000"
.LASF2818:
	.ascii	"OB_WRP_Pages0to3 ((uint32_t)0x00000001)\000"
.LASF3609:
	.ascii	"TIM_TRGOSource_Enable ((uint16_t)0x0010)\000"
.LASF2635:
	.ascii	"IS_COMP_INVERTING_INPUT(INPUT) (((INPUT) == COMP_In"
	.ascii	"vertingInput_1_4VREFINT) || ((INPUT) == COMP_Invert"
	.ascii	"ingInput_1_2VREFINT) || ((INPUT) == COMP_InvertingI"
	.ascii	"nput_3_4VREFINT) || ((INPUT) == COMP_InvertingInput"
	.ascii	"_VREFINT) || ((INPUT) == COMP_InvertingInput_DAC1) "
	.ascii	"|| ((INPUT) == COMP_InvertingInput_1_4VREFINT) || ("
	.ascii	"(INPUT) == COMP_InvertingInput_IO))\000"
.LASF1906:
	.ascii	"RTC_CAL_CALM_4 ((uint32_t)0x00000010)\000"
.LASF2958:
	.ascii	"IS_SYSCFG_I2C_FMP(PIN) (((PIN) == SYSCFG_I2CFastMod"
	.ascii	"ePlus_PB6) || ((PIN) == SYSCFG_I2CFastModePlus_PB7)"
	.ascii	" || ((PIN) == SYSCFG_I2CFastModePlus_PB8) || ((PIN)"
	.ascii	" == SYSCFG_I2CFastModePlus_PB9))\000"
.LASF1186:
	.ascii	"GPIO_OSPEEDER_OSPEEDR2_1 ((uint32_t)0x00000020)\000"
.LASF2592:
	.ascii	"CEC_IT_TXEND CEC_IER_TXENDIE\000"
.LASF2232:
	.ascii	"TIM_CCMR2_OC4M_0 ((uint16_t)0x1000)\000"
.LASF4247:
	.ascii	"CARIBOU_MUTEX_F_RECURSIVE 0x02\000"
.LASF2202:
	.ascii	"TIM_CCMR1_IC1PSC_1 ((uint16_t)0x0008)\000"
.LASF1928:
	.ascii	"RTC_TAFCR_TAMPIE ((uint32_t)0x00000004)\000"
.LASF104:
	.ascii	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF1991:
	.ascii	"SPI_CRCPR_CRCPOLY ((uint16_t)0xFFFF)\000"
.LASF3832:
	.ascii	"RCC_PREDIV1_Div4 RCC_CFGR2_PREDIV1_DIV4\000"
.LASF615:
	.ascii	"DMA1_BASE (AHBPERIPH_BASE + 0x00000000)\000"
.LASF2248:
	.ascii	"TIM_CCMR2_IC4F_0 ((uint16_t)0x1000)\000"
.LASF43:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF2651:
	.ascii	"COMP_Hysteresis_High COMP_CSR_COMP1HYST\000"
.LASF1290:
	.ascii	"GPIO_ODR_0 ((uint32_t)0x00000001)\000"
.LASF1471:
	.ascii	"IWDG_SR_RVU ((uint8_t)0x02)\000"
.LASF218:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF35:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF587:
	.ascii	"AHBPERIPH_BASE (PERIPH_BASE + 0x00020000)\000"
.LASF1352:
	.ascii	"GPIO_LCKR_LCK14 ((uint32_t)0x00004000)\000"
.LASF775:
	.ascii	"CEC_ISR_TXUDR ((uint32_t)0x00000400)\000"
.LASF3197:
	.ascii	"RTC_DayLightSaving_SUB1H ((uint32_t)0x00020000)\000"
.LASF143:
	.ascii	"__DBL_MANT_DIG__ 24\000"
.LASF679:
	.ascii	"ADC_ISR_EOS ADC_ISR_EOSEQ\000"
.LASF1854:
	.ascii	"RTC_TSTR_HT_0 ((uint32_t)0x00100000)\000"
.LASF3980:
	.ascii	"CARIBOU_GPIO_PIN_2 (1<<2)\000"
.LASF2707:
	.ascii	"DMA_PeripheralInc_Enable DMA_CCR_PINC\000"
.LASF4303:
	.ascii	"CARIBOUFAULT_H \000"
.LASF2005:
	.ascii	"SPI_I2SCFGR_I2SCFG_1 ((uint16_t)0x0200)\000"
.LASF2384:
	.ascii	"USART_CR3_WUFIE ((uint32_t)0x00400000)\000"
.LASF1242:
	.ascii	"GPIO_PUPDR_PUPDR5_0 ((uint32_t)0x00000400)\000"
.LASF1887:
	.ascii	"RTC_TSDR_MU_2 ((uint32_t)0x00000400)\000"
.LASF905:
	.ascii	"DMA_IFCR_CTCIF1 ((uint32_t)0x00000002)\000"
.LASF2137:
	.ascii	"TIM_SMCR_ETF_1 ((uint16_t)0x0200)\000"
.LASF4268:
	.ascii	"LOG_HUGE 0.880296919311130543E+02\000"
.LASF2842:
	.ascii	"OB_STOP_NoRST ((uint8_t)0x02)\000"
.LASF1668:
	.ascii	"RCC_BDCR_RTCSEL_HSE ((uint32_t)0x00000300)\000"
.LASF835:
	.ascii	"CRC_CR_REV_OUT ((uint32_t)0x00000080)\000"
.LASF356:
	.ascii	"PLL_SOURCE_HSI 1\000"
.LASF1837:
	.ascii	"RTC_ALRMAR_MNU_3 ((uint32_t)0x00000800)\000"
.LASF2834:
	.ascii	"OB_WRP_AllPages ((uint32_t)0x0000FFFF)\000"
.LASF4092:
	.ascii	"ENOMEM 12\000"
.LASF1952:
	.ascii	"SPI_CR1_SSM ((uint16_t)0x0200)\000"
.LASF4315:
	.ascii	"DECL_CARIBOU_SEMAPHORE(SEMAPHORE,COUNT) DECL_CARIBO"
	.ascii	"U_QUEUE(SEMAPHORE ## queue); caribou_semaphore_t SE"
	.ascii	"MAPHORE={COUNT,&SEMAPHORE ## queue}\000"
.LASF85:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF2991:
	.ascii	"I2C_OA2_NoMask ((uint8_t)0x00)\000"
.LASF4028:
	.ascii	"PIN_AFR_MASK(n) (0xf<<(n*4))\000"
.LASF3905:
	.ascii	"RCC_AHBPeriph_GPIOB RCC_AHBENR_GPIOBEN\000"
.LASF1492:
	.ascii	"PWR_CSR_WUF ((uint16_t)0x0001)\000"
.LASF328:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF1098:
	.ascii	"FLASH_OBR_IWDG_SW ((uint32_t)0x00000100)\000"
.LASF338:
	.ascii	"__THUMBEL__ 1\000"
.LASF1999:
	.ascii	"SPI_I2SCFGR_I2SSTD ((uint16_t)0x0030)\000"
.LASF4071:
	.ascii	"_CARIBOU_THREAD_H_ \000"
.LASF1245:
	.ascii	"GPIO_PUPDR_PUPDR6_0 ((uint32_t)0x00001000)\000"
.LASF2901:
	.ascii	"GPIO_PinSource10 ((uint8_t)0x0A)\000"
.LASF1943:
	.ascii	"SPI_CR1_CPOL ((uint16_t)0x0002)\000"
.LASF2031:
	.ascii	"SYSCFG_EXTICR1_EXTI1_PA ((uint16_t)0x0000)\000"
.LASF4135:
	.ascii	"ENOANO 55\000"
.LASF4049:
	.ascii	"CARIBOU_PORTC_AFRH PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF3245:
	.ascii	"RTC_Format_BCD ((uint32_t)0x000000001)\000"
.LASF371:
	.ascii	"INT8_MAX 127\000"
.LASF1959:
	.ascii	"SPI_CR2_RXDMAEN ((uint16_t)0x0001)\000"
.LASF3963:
	.ascii	"IS_RCC_HSI_CALIBRATION_VALUE(VALUE) ((VALUE) <= 0x1"
	.ascii	"F)\000"
.LASF2296:
	.ascii	"TIM_DCR_DBA_2 ((uint16_t)0x0004)\000"
.LASF192:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF2181:
	.ascii	"TIM_CCMR1_CC1S_0 ((uint16_t)0x0001)\000"
.LASF2510:
	.ascii	"ADC_SampleTime_55_5Cycles ((uint32_t)0x00000005)\000"
.LASF4230:
	.ascii	"CARIBOU_INTERRUPT_H \000"
.LASF1189:
	.ascii	"GPIO_OSPEEDER_OSPEEDR3_1 ((uint32_t)0x00000080)\000"
.LASF556:
	.ascii	"SysTick_CTRL_TICKINT_Pos 1\000"
.LASF4124:
	.ascii	"ECHRNG 44\000"
.LASF3418:
	.ascii	"TIM_OCMode_PWM2 ((uint16_t)0x0070)\000"
.LASF1036:
	.ascii	"EXTI_SWIER_SWIER5 ((uint32_t)0x00000020)\000"
.LASF2019:
	.ascii	"SYSCFG_CFGR1_I2C_FMP_PB6 ((uint32_t)0x00010000)\000"
.LASF2875:
	.ascii	"GPIO_Pin_3 ((uint16_t)0x0008)\000"
.LASF4356:
	.ascii	"CARIBOU_ADC_Channel_8 ((uint8_t)0x08)\000"
.LASF1136:
	.ascii	"GPIO_MODER_MODER7_0 ((uint32_t)0x00004000)\000"
.LASF1275:
	.ascii	"GPIO_IDR_1 ((uint32_t)0x00000002)\000"
.LASF1882:
	.ascii	"RTC_TSDR_WDU_2 ((uint32_t)0x00008000)\000"
.LASF3454:
	.ascii	"TIM_CCx_Disable ((uint16_t)0x0000)\000"
.LASF1942:
	.ascii	"SPI_CR1_CPHA ((uint16_t)0x0001)\000"
.LASF1861:
	.ascii	"RTC_TSTR_MNT ((uint32_t)0x00007000)\000"
.LASF210:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF2663:
	.ascii	"DAC_Trigger_T3_TRGO ((uint32_t)0x0000000C)\000"
.LASF3505:
	.ascii	"TIM_IT_Break ((uint16_t)0x0080)\000"
.LASF3251:
	.ascii	"RTC_FLAG_TSOVF ((uint32_t)0x00001000)\000"
.LASF2436:
	.ascii	"WWDG_CR_T3 ((uint8_t)0x08)\000"
.LASF786:
	.ascii	"CEC_IER_TXBRIE ((uint32_t)0x00000100)\000"
.LASF3795:
	.ascii	"IS_WWDG_COUNTER(COUNTER) (((COUNTER) >= 0x40) && (("
	.ascii	"COUNTER) <= 0x7F))\000"
.LASF3847:
	.ascii	"RCC_SYSCLKSource_HSE RCC_CFGR_SW_HSE\000"
.LASF1507:
	.ascii	"RCC_CR_PLLRDY ((uint32_t)0x02000000)\000"
.LASF395:
	.ascii	"UINT_LEAST32_MAX UINT32_MAX\000"
.LASF3063:
	.ascii	"IWDG_WriteAccess_Enable ((uint16_t)0x5555)\000"
.LASF1980:
	.ascii	"SPI_SR_MODF ((uint16_t)0x0020)\000"
.LASF3389:
	.ascii	"SPI_I2S_FLAG_TXE SPI_SR_TXE\000"
.LASF1166:
	.ascii	"GPIO_OTYPER_OT_4 ((uint32_t)0x00000010)\000"
.LASF1975:
	.ascii	"SPI_SR_RXNE ((uint16_t)0x0001)\000"
.LASF1638:
	.ascii	"RCC_APB2ENR_SPI1EN ((uint32_t)0x00001000)\000"
.LASF1674:
	.ascii	"RCC_CSR_RMVF ((uint32_t)0x01000000)\000"
.LASF1679:
	.ascii	"RCC_CSR_IWDGRSTF ((uint32_t)0x20000000)\000"
.LASF2667:
	.ascii	"DAC_Trigger_Software ((uint32_t)0x0000003C)\000"
.LASF2310:
	.ascii	"USART_CR1_UESM ((uint32_t)0x00000002)\000"
.LASF1385:
	.ascii	"GPIO_BRR_BR_14 ((uint32_t)0x00004000)\000"
.LASF2425:
	.ascii	"USART_ICR_CTSCF ((uint32_t)0x00000200)\000"
.LASF4232:
	.ascii	"caribou_interrupts_enable() chip_interrupts_enable("
	.ascii	")\000"
.LASF4150:
	.ascii	"ECOMM 70\000"
.LASF761:
	.ascii	"CEC_CFGR_OAR ((uint32_t)0x7FFF0000)\000"
.LASF4237:
	.ascii	"caribou_vector_enabled(vector) chip_vector_enabled("
	.ascii	"vector)\000"
.LASF119:
	.ascii	"__UINT_FAST16_MAX__ 0xffffffffU\000"
.LASF1018:
	.ascii	"EXTI_FTSR_TR6 ((uint32_t)0x00000040)\000"
.LASF2684:
	.ascii	"DBGMCU_STOP DBGMCU_CR_DBG_STOP\000"
.LASF1165:
	.ascii	"GPIO_OTYPER_OT_3 ((uint32_t)0x00000008)\000"
.LASF2889:
	.ascii	"IS_GPIO_PIN(PIN) ((PIN) != (uint16_t)0x00)\000"
.LASF4365:
	.ascii	"CARIBOU_ADC_Channel_17 ((uint8_t)0x11)\000"
.LASF1406:
	.ascii	"I2C_CR1_ALERTEN ((uint32_t)0x00400000)\000"
.LASF3502:
	.ascii	"TIM_IT_CC4 ((uint16_t)0x0010)\000"
.LASF60:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF2558:
	.ascii	"IS_ADC_CLEAR_FLAG(FLAG) (((FLAG) != (uint32_t)RESET"
	.ascii	") && (((FLAG) & 0xEFFFFF60) == (uint32_t)RESET))\000"
.LASF1722:
	.ascii	"RTC_TR_HT_0 ((uint32_t)0x00100000)\000"
.LASF712:
	.ascii	"ADC_CFGR1_ALIGN ((uint32_t)0x00000020)\000"
.LASF3340:
	.ascii	"I2S_AudioFreq_44k ((uint32_t)44100)\000"
.LASF2784:
	.ascii	"EXTI_Line1 ((uint32_t)0x00000002)\000"
.LASF2862:
	.ascii	"IS_FLASH_GET_FLAG(FLAG) (((FLAG) == FLASH_FLAG_BSY)"
	.ascii	" || ((FLAG) == FLASH_FLAG_PGERR) || ((FLAG) == FLAS"
	.ascii	"H_FLAG_WRPERR) || ((FLAG) == FLASH_FLAG_EOP))\000"
.LASF1411:
	.ascii	"I2C_CR2_HEAD10R ((uint32_t)0x00001000)\000"
.LASF3406:
	.ascii	"IS_TIM_LIST5_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIP"
	.ascii	"H) == TIM15)|| ((PERIPH) == TIM16)|| ((PERIPH) == T"
	.ascii	"IM17))\000"
.LASF1765:
	.ascii	"RTC_DR_MU_2 ((uint32_t)0x00000400)\000"
.LASF3108:
	.ascii	"__STM32F0XX_RTC_H \000"
.LASF3592:
	.ascii	"TIM_EventSource_COM ((uint16_t)0x0020)\000"
.LASF274:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF3626:
	.ascii	"TIM_FLAG_CC1 ((uint16_t)0x0002)\000"
.LASF1629:
	.ascii	"RCC_AHBENR_GPIOAEN ((uint32_t)0x00020000)\000"
.LASF1523:
	.ascii	"RCC_CFGR_HPRE_2 ((uint32_t)0x00000040)\000"
.LASF1445:
	.ascii	"I2C_ISR_OVR ((uint32_t)0x00000400)\000"
.LASF4251:
	.ascii	"CARIBOU_BYTEQUEUE_INIT {0,0,0,0}\000"
.LASF734:
	.ascii	"ADC_CHSELR_CHSEL12 ((uint32_t)0x00001000)\000"
.LASF840:
	.ascii	"DAC_CR_TSEL1 ((uint32_t)0x00000038)\000"
.LASF2304:
	.ascii	"TIM_DCR_DBL_4 ((uint16_t)0x1000)\000"
.LASF2739:
	.ascii	"DMA1_IT_GL2 DMA_ISR_GIF2\000"
.LASF2606:
	.ascii	"CEC_FLAG_TXUDR CEC_ISR_TXUDR\000"
.LASF108:
	.ascii	"__UINT_LEAST16_MAX__ 0xffff\000"
.LASF719:
	.ascii	"ADC_CFGR1_AUTDLY ADC_CFGR1_WAIT\000"
.LASF4045:
	.ascii	"CARIBOU_PORTC_OTYPER PIN_OTYPER(0,GPIO_OType_PP) | "
	.ascii	"PIN_OTYPER(1,GPIO_OType_PP) | PIN_OTYPER(2,GPIO_OTy"
	.ascii	"pe_PP) | PIN_OTYPER(3,GPIO_OType_PP) | PIN_OTYPER(4"
	.ascii	",GPIO_OType_PP) | PIN_OTYPER(5,GPIO_OType_PP) | PIN"
	.ascii	"_OTYPER(6,GPIO_OType_PP) | PIN_OTYPER(7,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(8,GPIO_OType_PP) | PIN_OTYPER(9,GP"
	.ascii	"IO_OType_PP) | PIN_OTYPER(10,GPIO_OType_PP) | PIN_O"
	.ascii	"TYPER(11,GPIO_OType_PP) | PIN_OTYPER(12,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(13,GPIO_OType_PP) | PIN_OTYPER(14,"
	.ascii	"GPIO_OType_PP) | PIN_OTYPER(15,GPIO_OType_PP)\000"
.LASF339:
	.ascii	"__SOFTFP__ 1\000"
.LASF2358:
	.ascii	"USART_CR2_ABRMODE_1 ((uint32_t)0x00400000)\000"
.LASF1262:
	.ascii	"GPIO_PUPDR_PUPDR12 ((uint32_t)0x03000000)\000"
.LASF3848:
	.ascii	"RCC_SYSCLKSource_PLLCLK RCC_CFGR_SW_PLL\000"
.LASF280:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF1263:
	.ascii	"GPIO_PUPDR_PUPDR12_0 ((uint32_t)0x01000000)\000"
.LASF621:
	.ascii	"RCC_BASE (AHBPERIPH_BASE + 0x00001000)\000"
.LASF2674:
	.ascii	"DAC_Align_12b_R ((uint32_t)0x00000000)\000"
.LASF4095:
	.ascii	"ENOTBLK 15\000"
.LASF2894:
	.ascii	"GPIO_PinSource3 ((uint8_t)0x03)\000"
.LASF1335:
	.ascii	"GPIO_BSRR_BR_13 ((uint32_t)0x20000000)\000"
.LASF1908:
	.ascii	"RTC_CAL_CALM_6 ((uint32_t)0x00000040)\000"
.LASF1811:
	.ascii	"RTC_ALRMAR_DT_0 ((uint32_t)0x10000000)\000"
.LASF2205:
	.ascii	"TIM_CCMR1_IC1F_1 ((uint16_t)0x0020)\000"
.LASF562:
	.ascii	"SysTick_VAL_CURRENT_Pos 0\000"
.LASF1102:
	.ascii	"FLASH_OBR_VDDA_MONITOR ((uint32_t)0x00002000)\000"
.LASF3145:
	.ascii	"IS_RTC_ALARM_DATE_WEEKDAY_WEEKDAY(WEEKDAY) (((WEEKD"
	.ascii	"AY) == RTC_Weekday_Monday) || ((WEEKDAY) == RTC_Wee"
	.ascii	"kday_Tuesday) || ((WEEKDAY) == RTC_Weekday_Wednesda"
	.ascii	"y) || ((WEEKDAY) == RTC_Weekday_Thursday) || ((WEEK"
	.ascii	"DAY) == RTC_Weekday_Friday) || ((WEEKDAY) == RTC_We"
	.ascii	"ekday_Saturday) || ((WEEKDAY) == RTC_Weekday_Sunday"
	.ascii	"))\000"
.LASF3359:
	.ascii	"SPI_LastDMATransfer_TxEvenRxOdd ((uint16_t)0x2000)\000"
.LASF2620:
	.ascii	"CRC_ReverseInputData_No ((uint32_t)0x00000000)\000"
.LASF904:
	.ascii	"DMA_IFCR_CGIF1 ((uint32_t)0x00000001)\000"
.LASF2790:
	.ascii	"EXTI_Line7 ((uint32_t)0x00000080)\000"
.LASF224:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF351:
	.ascii	"__CROSSWORKS_MINOR_VERSION 7\000"
.LASF1203:
	.ascii	"GPIO_OSPEEDER_OSPEEDR8_0 ((uint32_t)0x00010000)\000"
.LASF2560:
	.ascii	"__STM32F0XX_CEC_H \000"
.LASF2981:
	.ascii	"IS_I2C_ACKNOWLEDGE_ADDRESS(ADDRESS) (((ADDRESS) == "
	.ascii	"I2C_AcknowledgedAddress_7bit) || ((ADDRESS) == I2C_"
	.ascii	"AcknowledgedAddress_10bit))\000"
.LASF3684:
	.ascii	"USART_HardwareFlowControl_None ((uint32_t)0x0000000"
	.ascii	"0)\000"
.LASF259:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF3176:
	.ascii	"IS_RTC_ALARM_SUB_SECOND_VALUE(VALUE) ((VALUE) <= 0x"
	.ascii	"00007FFF)\000"
.LASF976:
	.ascii	"EXTI_EMR_MR7 ((uint32_t)0x00000080)\000"
.LASF240:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF2619:
	.ascii	"__STM32F0XX_CRC_H \000"
.LASF2748:
	.ascii	"DMA1_IT_TC4 DMA_ISR_TCIF4\000"
.LASF216:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF3231:
	.ascii	"RTC_OutputType_OpenDrain ((uint32_t)0x00000000)\000"
.LASF126:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF2915:
	.ascii	"GPIO_AF_7 ((uint8_t)0x07)\000"
.LASF2799:
	.ascii	"EXTI_Line16 ((uint32_t)0x00010000)\000"
.LASF2807:
	.ascii	"IS_EXTI_LINE(LINE) ((((LINE) & (uint32_t)0xF5140000"
	.ascii	") == 0x00) && ((LINE) != (uint16_t)0x00))\000"
.LASF2410:
	.ascii	"USART_ISR_ABRF ((uint32_t)0x00008000)\000"
.LASF1900:
	.ascii	"RTC_CAL_CALW16 ((uint32_t)0x00002000)\000"
.LASF1526:
	.ascii	"RCC_CFGR_HPRE_DIV2 ((uint32_t)0x00000080)\000"
.LASF1440:
	.ascii	"I2C_ISR_STOPF ((uint32_t)0x00000020)\000"
.LASF2829:
	.ascii	"OB_WRP_Pages44to47 ((uint32_t)0x00000800)\000"
.LASF2532:
	.ascii	"ADC_Channel_17 ADC_CHSELR_CHSEL17\000"
.LASF3007:
	.ascii	"I2C_Register_ISR ((uint8_t)0x18)\000"
.LASF805:
	.ascii	"COMP_CSR_COMP1HYST ((uint32_t)0x00003000)\000"
.LASF4185:
	.ascii	"ENOBUFS 105\000"
.LASF340:
	.ascii	"__VFP_FP__ 1\000"
.LASF3885:
	.ascii	"RCC_IT_PLLRDY ((uint8_t)0x10)\000"
.LASF520:
	.ascii	"SCB_ICSR_PENDSTCLR_Pos 25\000"
.LASF3165:
	.ascii	"RTC_AlarmSubSecondMask_SS14_6 ((uint8_t)0x06)\000"
.LASF4255:
	.ascii	"REC_PI 0.318309886183790672\000"
.LASF1228:
	.ascii	"GPIO_PUPDR_PUPDR0_1 ((uint32_t)0x00000002)\000"
.LASF2081:
	.ascii	"SYSCFG_EXTICR4_EXTI15 ((uint16_t)0xF000)\000"
.LASF1796:
	.ascii	"RTC_ISR_TAMP1F ((uint32_t)0x00002000)\000"
.LASF2356:
	.ascii	"USART_CR2_ABRMODE ((uint32_t)0x00600000)\000"
.LASF3667:
	.ascii	"__STM32F0XX_USART_H \000"
.LASF4169:
	.ascii	"EDESTADDRREQ 89\000"
.LASF4404:
	.ascii	"_CARIBOU_CSTRING_H_ \000"
.LASF157:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF3343:
	.ascii	"I2S_AudioFreq_16k ((uint32_t)16000)\000"
.LASF594:
	.ascii	"WWDG_BASE (APBPERIPH_BASE + 0x00002C00)\000"
.LASF678:
	.ascii	"ADC_ISR_ADRDY ((uint32_t)0x00000001)\000"
.LASF22:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF4452:
	.ascii	"sleep\000"
.LASF2609:
	.ascii	"CEC_FLAG_ARBLST CEC_ISR_ARBLST\000"
.LASF316:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1\000"
.LASF4056:
	.ascii	"CARIBOU_PORTF_MODE PIN_MODE(0,GPIO_Mode_IN) | PIN_M"
	.ascii	"ODE(1,GPIO_Mode_IN) | PIN_MODE(2,GPIO_Mode_IN) | PI"
	.ascii	"N_MODE(3,GPIO_Mode_IN) | PIN_MODE(4,GPIO_Mode_IN) |"
	.ascii	" PIN_MODE(5,GPIO_Mode_IN) | PIN_MODE(6,GPIO_Mode_IN"
	.ascii	") | PIN_MODE(7,GPIO_Mode_IN) | PIN_MODE(8,GPIO_Mode"
	.ascii	"_IN) | PIN_MODE(9,GPIO_Mode_IN) | PIN_MODE(10,GPIO_"
	.ascii	"Mode_IN) | PIN_MODE(11,GPIO_Mode_IN) | PIN_MODE(12,"
	.ascii	"GPIO_Mode_IN) | PIN_MODE(13,GPIO_Mode_IN) | PIN_MOD"
	.ascii	"E(14,GPIO_Mode_IN) | PIN_MODE(15,GPIO_Mode_IN)\000"
.LASF1653:
	.ascii	"RCC_APB1ENR_PWREN ((uint32_t)0x10000000)\000"
.LASF1611:
	.ascii	"RCC_APB2RSTR_TIM17RST ((uint32_t)0x00040000)\000"
.LASF3157:
	.ascii	"IS_RTC_ALARM(ALARM) ((ALARM) == RTC_Alarm_A)\000"
.LASF442:
	.ascii	"__CTYPE_CNTRL 0x20\000"
.LASF1:
	.ascii	"__cplusplus 199711L\000"
.LASF1299:
	.ascii	"GPIO_ODR_9 ((uint32_t)0x00000200)\000"
.LASF2364:
	.ascii	"USART_CR3_HDSEL ((uint32_t)0x00000008)\000"
.LASF2809:
	.ascii	"__STM32F0XX_FLASH_H \000"
.LASF3257:
	.ascii	"RTC_FLAG_SHPF ((uint32_t)0x00000008)\000"
.LASF2200:
	.ascii	"TIM_CCMR1_IC1PSC ((uint16_t)0x000C)\000"
.LASF4385:
	.ascii	"_CARIBOU_I2S_STM32F0xx_H_ \000"
.LASF3408:
	.ascii	"IS_TIM_LIST7_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIP"
	.ascii	"H) == TIM6) || ((PERIPH) == TIM14))\000"
.LASF1879:
	.ascii	"RTC_TSDR_WDU ((uint32_t)0x0000E000)\000"
.LASF1519:
	.ascii	"RCC_CFGR_SWS_PLL ((uint32_t)0x00000008)\000"
.LASF94:
	.ascii	"__UINT8_MAX__ 0xff\000"
.LASF213:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF7:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF1528:
	.ascii	"RCC_CFGR_HPRE_DIV8 ((uint32_t)0x000000A0)\000"
.LASF985:
	.ascii	"EXTI_EMR_MR16 ((uint32_t)0x00010000)\000"
.LASF2300:
	.ascii	"TIM_DCR_DBL_0 ((uint16_t)0x0100)\000"
.LASF2917:
	.ascii	"GPIO_Speed_10MHz GPIO_Speed_Level_1\000"
.LASF4453:
	.ascii	"caribou_thread_t\000"
.LASF1620:
	.ascii	"RCC_APB1RSTR_I2C1RST ((uint32_t)0x00200000)\000"
.LASF1886:
	.ascii	"RTC_TSDR_MU_1 ((uint32_t)0x00000200)\000"
.LASF2736:
	.ascii	"DMA1_IT_TC1 DMA_ISR_TCIF1\000"
.LASF1541:
	.ascii	"RCC_CFGR_PPRE_DIV8 ((uint32_t)0x00000600)\000"
.LASF2512:
	.ascii	"ADC_SampleTime_239_5Cycles ((uint32_t)0x00000007)\000"
.LASF644:
	.ascii	"CEC ((CEC_TypeDef *) CEC_BASE)\000"
.LASF2585:
	.ascii	"CEC_SFTOption_Off ((uint32_t)0x00000000)\000"
.LASF1792:
	.ascii	"RTC_CR_TSEDGE ((uint32_t)0x00000008)\000"
.LASF1088:
	.ascii	"FLASH_CR_LOCK ((uint32_t)0x00000080)\000"
.LASF3912:
	.ascii	"RCC_AHBPeriph_SRAM RCC_AHBENR_SRAMEN\000"
.LASF118:
	.ascii	"__UINT_FAST8_MAX__ 0xffffffffU\000"
.LASF2941:
	.ascii	"EXTI_PinSource14 ((uint8_t)0x0E)\000"
.LASF1031:
	.ascii	"EXTI_SWIER_SWIER0 ((uint32_t)0x00000001)\000"
.LASF3799:
	.ascii	"NVIC_LP_SLEEPONEXIT ((uint8_t)0x02)\000"
.LASF1362:
	.ascii	"GPIO_AFRL_AFRL7 ((uint32_t)0xF0000000)\000"
.LASF2289:
	.ascii	"TIM_BDTR_BKE ((uint16_t)0x1000)\000"
.LASF1584:
	.ascii	"RCC_CIR_LSIRDYF ((uint32_t)0x00000001)\000"
.LASF831:
	.ascii	"CRC_CR_RESET ((uint32_t)0x00000001)\000"
.LASF3058:
	.ascii	"I2C_Generate_Stop I2C_CR2_STOP\000"
.LASF3923:
	.ascii	"RCC_APB2Periph_TIM17 RCC_APB2ENR_TIM17EN\000"
.LASF69:
	.ascii	"__DEPRECATED 1\000"
.LASF3342:
	.ascii	"I2S_AudioFreq_22k ((uint32_t)22050)\000"
.LASF1585:
	.ascii	"RCC_CIR_LSERDYF ((uint32_t)0x00000002)\000"
.LASF1891:
	.ascii	"RTC_TSDR_DT_1 ((uint32_t)0x00000020)\000"
.LASF638:
	.ascii	"SPI2 ((SPI_TypeDef *) SPI2_BASE)\000"
.LASF3732:
	.ascii	"USART_OVRDetection_Enable ((uint32_t)0x00000000)\000"
.LASF1618:
	.ascii	"RCC_APB1RSTR_SPI2RST ((uint32_t)0x00004000)\000"
.LASF602:
	.ascii	"CEC_BASE (APBPERIPH_BASE + 0x00007800)\000"
.LASF537:
	.ascii	"SCB_AIRCR_SYSRESETREQ_Msk (1UL << SCB_AIRCR_SYSRESE"
	.ascii	"TREQ_Pos)\000"
.LASF584:
	.ascii	"SRAM_BASE ((uint32_t)0x20000000)\000"
.LASF2968:
	.ascii	"I2C_AnalogFilter_Enable ((uint32_t)0x00000000)\000"
.LASF4390:
	.ascii	"chip_spi_port_t SPI_TypeDef*\000"
.LASF2326:
	.ascii	"USART_CR1_DEDT_0 ((uint32_t)0x00010000)\000"
.LASF2163:
	.ascii	"TIM_SR_CC3IF ((uint16_t)0x0008)\000"
.LASF1907:
	.ascii	"RTC_CAL_CALM_5 ((uint32_t)0x00000020)\000"
.LASF3318:
	.ascii	"I2S_Mode_SlaveTx ((uint16_t)0x0000)\000"
.LASF595:
	.ascii	"IWDG_BASE (APBPERIPH_BASE + 0x00003000)\000"
.LASF3796:
	.ascii	"__STM32F0XX_MISC_H \000"
.LASF3409:
	.ascii	"IS_TIM_LIST8_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIP"
	.ascii	"H) == TIM14))\000"
.LASF3481:
	.ascii	"IS_TIM_OCIDLE_STATE(STATE) (((STATE) == TIM_OCIdleS"
	.ascii	"tate_Set) || ((STATE) == TIM_OCIdleState_Reset))\000"
.LASF3533:
	.ascii	"TIM_DMABurstLength_5Transfers ((uint16_t)0x0400)\000"
.LASF3294:
	.ascii	"SPI_CRCLength_8b ((uint16_t)0x0000)\000"
.LASF200:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF3354:
	.ascii	"SPI_I2S_DMAReq_Tx SPI_CR2_TXDMAEN\000"
.LASF2821:
	.ascii	"OB_WRP_Pages12to15 ((uint32_t)0x00000008)\000"
.LASF242:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF152:
	.ascii	"__DBL_EPSILON__ double(1.1)\000"
.LASF2861:
	.ascii	"IS_FLASH_CLEAR_FLAG(FLAG) ((((FLAG) & (uint32_t)0xF"
	.ascii	"FFFFFC3) == 0x00000000) && ((FLAG) != 0x00000000))\000"
.LASF3602:
	.ascii	"TIM_OCFast_Enable ((uint16_t)0x0004)\000"
.LASF2582:
	.ascii	"CEC_BRDNoGen_Off ((uint32_t)0x00000000)\000"
.LASF1534:
	.ascii	"RCC_CFGR_PPRE ((uint32_t)0x00000700)\000"
.LASF501:
	.ascii	"__IO volatile\000"
.LASF4018:
	.ascii	"caribou_gpio_pinmask(gpio) ((gpio)->pinmask)\000"
.LASF2814:
	.ascii	"FLASH_IT_ERR FLASH_CR_ERRIE\000"
.LASF1839:
	.ascii	"RTC_ALRMAR_ST ((uint32_t)0x00000070)\000"
.LASF2439:
	.ascii	"WWDG_CR_T6 ((uint8_t)0x40)\000"
.LASF1880:
	.ascii	"RTC_TSDR_WDU_0 ((uint32_t)0x00002000)\000"
.LASF3680:
	.ascii	"IS_USART_PARITY(PARITY) (((PARITY) == USART_Parity_"
	.ascii	"No) || ((PARITY) == USART_Parity_Even) || ((PARITY)"
	.ascii	" == USART_Parity_Odd))\000"
.LASF2060:
	.ascii	"SYSCFG_EXTICR2_EXTI7_PC ((uint16_t)0x2000)\000"
.LASF4057:
	.ascii	"CARIBOU_PORTF_OTYPER PIN_OTYPER(0,GPIO_OType_PP) | "
	.ascii	"PIN_OTYPER(1,GPIO_OType_PP) | PIN_OTYPER(2,GPIO_OTy"
	.ascii	"pe_PP) | PIN_OTYPER(3,GPIO_OType_PP) | PIN_OTYPER(4"
	.ascii	",GPIO_OType_PP) | PIN_OTYPER(5,GPIO_OType_PP) | PIN"
	.ascii	"_OTYPER(6,GPIO_OType_PP) | PIN_OTYPER(7,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(8,GPIO_OType_PP) | PIN_OTYPER(9,GP"
	.ascii	"IO_OType_PP) | PIN_OTYPER(10,GPIO_OType_PP) | PIN_O"
	.ascii	"TYPER(11,GPIO_OType_PP) | PIN_OTYPER(12,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(13,GPIO_OType_PP) | PIN_OTYPER(14,"
	.ascii	"GPIO_OType_PP) | PIN_OTYPER(15,GPIO_OType_PP)\000"
.LASF2996:
	.ascii	"I2C_OA2_Mask05 ((uint8_t)0x05)\000"
.LASF195:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF2812:
	.ascii	"IS_FLASH_LATENCY(LATENCY) (((LATENCY) == FLASH_Late"
	.ascii	"ncy_0) || ((LATENCY) == FLASH_Latency_1))\000"
.LASF3990:
	.ascii	"CARIBOU_GPIO_PIN_12 (1<<12)\000"
.LASF1573:
	.ascii	"RCC_CFGR_MCO_0 ((uint32_t)0x01000000)\000"
.LASF2250:
	.ascii	"TIM_CCMR2_IC4F_2 ((uint16_t)0x4000)\000"
.LASF4427:
	.ascii	"caribou_timer_callback_fn\000"
.LASF4327:
	.ascii	"CARIBOUSTDIO_H \000"
.LASF1356:
	.ascii	"GPIO_AFRL_AFRL1 ((uint32_t)0x000000F0)\000"
.LASF3880:
	.ascii	"IS_RCC_USARTCLK(USARTCLK) (((USARTCLK) == RCC_USART"
	.ascii	"1CLK_PCLK) || ((USARTCLK) == RCC_USART1CLK_SYSCLK) "
	.ascii	"|| ((USARTCLK) == RCC_USART1CLK_LSE) || ((USARTCLK)"
	.ascii	" == RCC_USART1CLK_HSI))\000"
.LASF2196:
	.ascii	"TIM_CCMR1_OC2M_0 ((uint16_t)0x1000)\000"
.LASF271:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF4112:
	.ascii	"EPIPE 32\000"
.LASF1292:
	.ascii	"GPIO_ODR_2 ((uint32_t)0x00000004)\000"
.LASF3:
	.ascii	"__GNUC__ 5\000"
.LASF518:
	.ascii	"SCB_ICSR_PENDSTSET_Pos 26\000"
.LASF729:
	.ascii	"ADC_CHSELR_CHSEL17 ((uint32_t)0x00020000)\000"
.LASF4234:
	.ascii	"caribou_interrupts_enabled() chip_interrupts_enable"
	.ascii	"d()\000"
.LASF2434:
	.ascii	"WWDG_CR_T1 ((uint8_t)0x02)\000"
.LASF3888:
	.ascii	"IS_RCC_IT(IT) ((((IT) & (uint8_t)0xC0) == 0x00) && "
	.ascii	"((IT) != 0x00))\000"
.LASF4244:
	.ascii	"CARIBOUBYTEQUEUE_H \000"
.LASF1402:
	.ascii	"I2C_CR1_WUPEN ((uint32_t)0x00040000)\000"
.LASF1395:
	.ascii	"I2C_CR1_DFN ((uint32_t)0x00000F00)\000"
.LASF140:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF315:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 1\000"
.LASF1436:
	.ascii	"I2C_ISR_TXIS ((uint32_t)0x00000002)\000"
.LASF3968:
	.ascii	"isr_exit() __asm ( \"\011pop\011\011{r4-r7}\011\011"
	.ascii	"\011\\n\" \"\011mov\011\011r11,r7\011\011\011\\n\" "
	.ascii	"\"\011mov\011\011r10,r6\011\011\011\\n\" \"\011mov\011"
	.ascii	"\011r9,r5\011\011\011\\n\" \"\011mov\011\011r8,r4\011"
	.ascii	"\011\011\\n\" \"\011pop\011\011{r4-r7}\011\011\011\\"
	.ascii	"n\" \"\011pop\011\011{pc}\011\011\011\\n\" )\000"
.LASF1110:
	.ascii	"OB_WRP0_WRP0 ((uint32_t)0x000000FF)\000"
.LASF969:
	.ascii	"EXTI_EMR_MR0 ((uint32_t)0x00000001)\000"
.LASF333:
	.ascii	"__ARM_ARCH 6\000"
.LASF32:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF4053:
	.ascii	"CARIBOU_PORTD_PUPDR PIN_PUPDR(0,GPIO_PuPd_NOPULL) |"
	.ascii	" PIN_PUPDR(1,GPIO_PuPd_NOPULL) | PIN_PUPDR(2,GPIO_P"
	.ascii	"uPd_NOPULL) | PIN_PUPDR(3,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(4,GPIO_PuPd_NOPULL) | PIN_PUPDR(5,GPIO_PuPd_NO"
	.ascii	"PULL) | PIN_PUPDR(6,GPIO_PuPd_NOPULL) | PIN_PUPDR(7"
	.ascii	",GPIO_PuPd_NOPULL) | PIN_PUPDR(8,GPIO_PuPd_NOPULL) "
	.ascii	"| PIN_PUPDR(9,GPIO_PuPd_NOPULL) | PIN_PUPDR(10,GPIO"
	.ascii	"_PuPd_NOPULL) | PIN_PUPDR(11,GPIO_PuPd_NOPULL) | PI"
	.ascii	"N_PUPDR(12,GPIO_PuPd_NOPULL) | PIN_PUPDR(13,GPIO_Pu"
	.ascii	"Pd_NOPULL) | PIN_PUPDR(14,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(15,GPIO_PuPd_NOPULL)\000"
.LASF4055:
	.ascii	"CARIBOU_PORTD_AFRH PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF3446:
	.ascii	"IS_TIM_OCN_POLARITY(POLARITY) (((POLARITY) == TIM_O"
	.ascii	"CNPolarity_High) || ((POLARITY) == TIM_OCNPolarity_"
	.ascii	"Low))\000"
.LASF201:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF404:
	.ascii	"INT_FAST64_MAX INT64_MAX\000"
.LASF890:
	.ascii	"DMA_ISR_HTIF2 ((uint32_t)0x00000040)\000"
.LASF3552:
	.ascii	"TIM_DMA_CC4 ((uint16_t)0x1000)\000"
.LASF2430:
	.ascii	"USART_RDR_RDR ((uint16_t)0x01FF)\000"
.LASF3119:
	.ascii	"RTC_H12_PM ((uint8_t)0x40)\000"
.LASF3460:
	.ascii	"TIM_Break_Disable ((uint16_t)0x0000)\000"
.LASF3040:
	.ascii	"I2C_IT_ADDR I2C_ISR_ADDR\000"
.LASF1764:
	.ascii	"RTC_DR_MU_1 ((uint32_t)0x00000200)\000"
.LASF1070:
	.ascii	"FLASH_ACR_PRFTBE ((uint32_t)0x00000010)\000"
.LASF3320:
	.ascii	"I2S_Mode_MasterTx ((uint16_t)0x0200)\000"
.LASF533:
	.ascii	"SCB_AIRCR_VECTKEYSTAT_Msk (0xFFFFUL << SCB_AIRCR_VE"
	.ascii	"CTKEYSTAT_Pos)\000"
.LASF4186:
	.ascii	"EISCONN 106\000"
.LASF815:
	.ascii	"COMP_CSR_COMP2INSEL_0 ((uint32_t)0x00100000)\000"
.LASF1435:
	.ascii	"I2C_ISR_TXE ((uint32_t)0x00000001)\000"
.LASF177:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF3375:
	.ascii	"I2S_IT_UDR ((uint8_t)0x53)\000"
.LASF3754:
	.ascii	"USART_FLAG_LBD USART_ISR_LBD\000"
.LASF2083:
	.ascii	"SYSCFG_EXTICR4_EXTI12_PB ((uint16_t)0x0001)\000"
.LASF2856:
	.ascii	"IS_OB_SRAM_PARITY(PARITY) (((PARITY) == OB_SRAM_PAR"
	.ascii	"ITY_SET) || ((PARITY) == OB_SRAM_PARITY_RESET))\000"
.LASF2037:
	.ascii	"SYSCFG_EXTICR1_EXTI2_PC ((uint16_t)0x0200)\000"
.LASF295:
	.ascii	"__SA_IBIT__ 16\000"
.LASF454:
	.ascii	"offsetof(s,m) ((size_t)&(((s *)0)->m))\000"
.LASF2291:
	.ascii	"TIM_BDTR_AOE ((uint16_t)0x4000)\000"
.LASF1769:
	.ascii	"RTC_DR_DT_1 ((uint32_t)0x00000020)\000"
.LASF3101:
	.ascii	"IS_PWR_STOP_ENTRY(ENTRY) (((ENTRY) == PWR_STOPEntry"
	.ascii	"_WFI) || ((ENTRY) == PWR_STOPEntry_WFE))\000"
.LASF2498:
	.ascii	"ADC_AnalogWatchdog_Channel_13 ((uint32_t)0x34000000"
	.ascii	")\000"
.LASF2175:
	.ascii	"TIM_EGR_CC3G ((uint8_t)0x08)\000"
.LASF1960:
	.ascii	"SPI_CR2_TXDMAEN ((uint16_t)0x0002)\000"
.LASF3599:
	.ascii	"TIM_OCPreload_Enable ((uint16_t)0x0008)\000"
.LASF2859:
	.ascii	"FLASH_FLAG_WRPERR FLASH_SR_WRPERR\000"
.LASF3893:
	.ascii	"RCC_LSE_Bypass ((uint32_t)(RCC_BDCR_LSEON | RCC_BDC"
	.ascii	"R_LSEBYP))\000"
.LASF1829:
	.ascii	"RTC_ALRMAR_MNT ((uint32_t)0x00007000)\000"
.LASF3928:
	.ascii	"RCC_APB1Periph_TIM6 RCC_APB1ENR_TIM6EN\000"
.LASF2128:
	.ascii	"TIM_SMCR_SMS_2 ((uint16_t)0x0004)\000"
.LASF4022:
	.ascii	"PIN_OTYPER_MASK(n) (1<<n)\000"
.LASF335:
	.ascii	"__thumb__ 1\000"
.LASF1278:
	.ascii	"GPIO_IDR_4 ((uint32_t)0x00000010)\000"
.LASF4107:
	.ascii	"EFBIG 27\000"
.LASF3547:
	.ascii	"IS_TIM_DMA_LENGTH(LENGTH) (((LENGTH) == TIM_DMABurs"
	.ascii	"tLength_1Transfer) || ((LENGTH) == TIM_DMABurstLeng"
	.ascii	"th_2Transfers) || ((LENGTH) == TIM_DMABurstLength_3"
	.ascii	"Transfers) || ((LENGTH) == TIM_DMABurstLength_4Tran"
	.ascii	"sfers) || ((LENGTH) == TIM_DMABurstLength_5Transfer"
	.ascii	"s) || ((LENGTH) == TIM_DMABurstLength_6Transfers) |"
	.ascii	"| ((LENGTH) == TIM_DMABurstLength_7Transfers) || (("
	.ascii	"LENGTH) == TIM_DMABurstLength_8Transfers) || ((LENG"
	.ascii	"TH) == TIM_DMABurstLength_9Transfers) || ((LENGTH) "
	.ascii	"== TIM_DMABurstLength_10Transfers) || ((LENGTH) == "
	.ascii	"TIM_DMABurstLength_11Transfers) || ((LENGTH) == TIM"
	.ascii	"_DMABurstLength_12Transfers) || ((LENGTH) == TIM_DM"
	.ascii	"ABurstLength_13Transfers) || ((LENGTH) == TIM_DMABu"
	.ascii	"rstLength_14Transfers) || ((LENGTH) == TIM_DMABurst"
	.ascii	"Length_15Transfers) || ((LENGTH) == TIM_DMABurstLen"
	.ascii	"gth_16Transfers) || ((LENGTH) == TIM_DMABurstLength"
	.ascii	"_17Transfers) || ((LENGTH) == TIM_DMABurstLength_18"
	.ascii	"Transfers))\000"
.LASF1418:
	.ascii	"I2C_CR2_PECBYTE ((uint32_t)0x04000000)\000"
.LASF3572:
	.ascii	"TIM_TIxExternalCLK1Source_TI2 ((uint16_t)0x0060)\000"
.LASF871:
	.ascii	"DBGMCU_CR_DBG_STANDBY ((uint32_t)0x00000004)\000"
.LASF3927:
	.ascii	"RCC_APB1Periph_TIM3 RCC_APB1ENR_TIM3EN\000"
.LASF1167:
	.ascii	"GPIO_OTYPER_OT_5 ((uint32_t)0x00000020)\000"
.LASF1043:
	.ascii	"EXTI_SWIER_SWIER12 ((uint32_t)0x00001000)\000"
.LASF28:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF3299:
	.ascii	"IS_SPI_CPOL(CPOL) (((CPOL) == SPI_CPOL_Low) || ((CP"
	.ascii	"OL) == SPI_CPOL_High))\000"
.LASF1176:
	.ascii	"GPIO_OTYPER_OT_14 ((uint32_t)0x00004000)\000"
.LASF3001:
	.ascii	"I2C_Register_CR1 ((uint8_t)0x00)\000"
.LASF3172:
	.ascii	"RTC_AlarmSubSecondMask_SS14_13 ((uint8_t)0x0D)\000"
.LASF1594:
	.ascii	"RCC_CIR_HSERDYIE ((uint32_t)0x00000800)\000"
.LASF4261:
	.ascii	"ROOT_3 1.732050807568877293\000"
.LASF961:
	.ascii	"EXTI_IMR_MR16 ((uint32_t)0x00010000)\000"
.LASF2338:
	.ascii	"USART_CR1_EOBIE ((uint32_t)0x08000000)\000"
.LASF1277:
	.ascii	"GPIO_IDR_3 ((uint32_t)0x00000008)\000"
.LASF4083:
	.ascii	"ESRCH 3\000"
.LASF3633:
	.ascii	"TIM_FLAG_CC1OF ((uint16_t)0x0200)\000"
.LASF1859:
	.ascii	"RTC_TSTR_HU_2 ((uint32_t)0x00040000)\000"
.LASF4444:
	.ascii	"state\000"
.LASF1817:
	.ascii	"RTC_ALRMAR_DU_3 ((uint32_t)0x08000000)\000"
.LASF738:
	.ascii	"ADC_CHSELR_CHSEL8 ((uint32_t)0x00000100)\000"
.LASF1412:
	.ascii	"I2C_CR2_START ((uint32_t)0x00002000)\000"
.LASF3060:
	.ascii	"I2C_Generate_Start_Write I2C_CR2_START\000"
.LASF4386:
	.ascii	"chip_i2s_port_t SPI_TypeDef*\000"
.LASF4229:
	.ascii	"caribou_thread_yield_while(e) while(e) caribou_thre"
	.ascii	"ad_yield()\000"
.LASF3122:
	.ascii	"RTC_Month_January ((uint8_t)0x01)\000"
.LASF2194:
	.ascii	"TIM_CCMR1_OC2PE ((uint16_t)0x0800)\000"
.LASF1379:
	.ascii	"GPIO_BRR_BR_8 ((uint32_t)0x00000100)\000"
.LASF3946:
	.ascii	"RCC_MCOSource_PLLCLK_Div2 ((uint8_t)0x07)\000"
.LASF2456:
	.ascii	"IS_ADC_ALL_PERIPH(PERIPH) ((PERIPH) == ADC1)\000"
.LASF1152:
	.ascii	"GPIO_MODER_MODER12_1 ((uint32_t)0x02000000)\000"
.LASF3809:
	.ascii	"IS_RCC_HSE(HSE) (((HSE) == RCC_HSE_OFF) || ((HSE) ="
	.ascii	"= RCC_HSE_ON) || ((HSE) == RCC_HSE_Bypass))\000"
.LASF2600:
	.ascii	"CEC_IT_RXEND CEC_IER_RXENDIE\000"
.LASF3546:
	.ascii	"TIM_DMABurstLength_18Transfers ((uint16_t)0x1100)\000"
.LASF3584:
	.ascii	"TIM_EncoderMode_TI2 ((uint16_t)0x0002)\000"
.LASF3960:
	.ascii	"RCC_FLAG_LPWRRST ((uint8_t)0x5F)\000"
.LASF3987:
	.ascii	"CARIBOU_GPIO_PIN_9 (1<<9)\000"
.LASF2305:
	.ascii	"TIM_DMAR_DMAB ((uint16_t)0xFFFF)\000"
.LASF807:
	.ascii	"COMP_CSR_COMP1HYST_1 ((uint32_t)0x00002000)\000"
.LASF2479:
	.ascii	"ADC_ScanDirection_Upward ((uint32_t)0x00000000)\000"
.LASF908:
	.ascii	"DMA_IFCR_CGIF2 ((uint32_t)0x00000010)\000"
.LASF313:
	.ascii	"__WCHAR_UNSIGNED__ 1\000"
.LASF2624:
	.ascii	"IS_CRC_REVERSE_INPUT_DATA(DATA) (((DATA) == CRC_Rev"
	.ascii	"erseInputData_No) || ((DATA) == CRC_ReverseInputDat"
	.ascii	"a_8bits) || ((DATA) == CRC_ReverseInputData_16bits)"
	.ascii	" || ((DATA) == CRC_ReverseInputData_32bits))\000"
.LASF3790:
	.ascii	"WWDG_Prescaler_2 ((uint32_t)0x00000080)\000"
.LASF2381:
	.ascii	"USART_CR3_WUS ((uint32_t)0x00300000)\000"
.LASF3213:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div32768 ((uint32_t)0"
	.ascii	"x00000000)\000"
.LASF1721:
	.ascii	"RTC_TR_HT ((uint32_t)0x00300000)\000"
.LASF2683:
	.ascii	"__STM32F0XX_DBGMCU_H \000"
.LASF1715:
	.ascii	"RCC_CR2_HSI14ON ((uint32_t)0x00000001)\000"
.LASF448:
	.ascii	"__CTYPE_PRINT (__CTYPE_BLANK | __CTYPE_PUNCT | __CT"
	.ascii	"YPE_UPPER | __CTYPE_LOWER | __CTYPE_DIGIT)\000"
.LASF558:
	.ascii	"SysTick_CTRL_ENABLE_Pos 0\000"
.LASF3745:
	.ascii	"USART_FLAG_SBK USART_ISR_SBKF\000"
.LASF2929:
	.ascii	"EXTI_PinSource2 ((uint8_t)0x02)\000"
.LASF3822:
	.ascii	"RCC_PLLMul_11 RCC_CFGR_PLLMULL11\000"
.LASF2839:
	.ascii	"OB_IWDG_SW ((uint8_t)0x01)\000"
.LASF2879:
	.ascii	"GPIO_Pin_7 ((uint16_t)0x0080)\000"
.LASF248:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF1955:
	.ascii	"SPI_CR1_CRCNEXT ((uint16_t)0x1000)\000"
.LASF166:
	.ascii	"__LDBL_EPSILON__ 1.1\000"
.LASF4486:
	.ascii	"_ZN7CARIBOU18CCaribouMainThread4initEhPv\000"
.LASF4023:
	.ascii	"PIN_OTYPER(n,otyper) ((otyper&1)<<n)\000"
.LASF2243:
	.ascii	"TIM_CCMR2_IC3F_3 ((uint16_t)0x0080)\000"
.LASF2342:
	.ascii	"USART_CR2_LBCL ((uint32_t)0x00000100)\000"
.LASF2566:
	.ascii	"CEC_SignalFreeTime_5T ((uint32_t)0x00000005)\000"
.LASF220:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF231:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF1742:
	.ascii	"RTC_TR_SU ((uint32_t)0x0000000F)\000"
.LASF3843:
	.ascii	"RCC_PREDIV1_Div15 RCC_CFGR2_PREDIV1_DIV15\000"
.LASF2850:
	.ascii	"IS_OB_BOOT1(BOOT1) (((BOOT1) == OB_BOOT1_RESET) || "
	.ascii	"((BOOT1) == OB_BOOT1_SET))\000"
.LASF1118:
	.ascii	"GPIO_MODER_MODER1_0 ((uint32_t)0x00000004)\000"
.LASF1569:
	.ascii	"RCC_CFGR_PLLMULL14 ((uint32_t)0x00300000)\000"
.LASF1066:
	.ascii	"EXTI_PR_PR16 ((uint32_t)0x00010000)\000"
.LASF1768:
	.ascii	"RTC_DR_DT_0 ((uint32_t)0x00000010)\000"
.LASF1142:
	.ascii	"GPIO_MODER_MODER9_0 ((uint32_t)0x00040000)\000"
.LASF681:
	.ascii	"ADC_IER_OVRIE ((uint32_t)0x00000010)\000"
.LASF1370:
	.ascii	"GPIO_AFRH_AFRH7 ((uint32_t)0xF0000000)\000"
.LASF1690:
	.ascii	"RCC_CFGR2_PREDIV1_1 ((uint32_t)0x00000002)\000"
.LASF2665:
	.ascii	"DAC_Trigger_T2_TRGO ((uint32_t)0x00000024)\000"
.LASF1806:
	.ascii	"RTC_PRER_PREDIV_A ((uint32_t)0x007F0000)\000"
.LASF3374:
	.ascii	"IS_SPI_I2S_CONFIG_IT(IT) (((IT) == SPI_I2S_IT_TXE) "
	.ascii	"|| ((IT) == SPI_I2S_IT_RXNE) || ((IT) == SPI_I2S_IT"
	.ascii	"_ERR))\000"
.LASF3743:
	.ascii	"USART_FLAG_WU USART_ISR_WUF\000"
.LASF2370:
	.ascii	"USART_CR3_CTSE ((uint32_t)0x00000200)\000"
.LASF2787:
	.ascii	"EXTI_Line4 ((uint32_t)0x00000010)\000"
.LASF926:
	.ascii	"DMA_CCR_HTIE ((uint32_t)0x00000004)\000"
.LASF2596:
	.ascii	"CEC_IT_LBPE CEC_IER_LBPEIE\000"
.LASF2615:
	.ascii	"CEC_FLAG_RXEND CEC_ISR_RXEND\000"
.LASF3517:
	.ascii	"TIM_DMABase_CNT ((uint16_t)0x0009)\000"
.LASF3772:
	.ascii	"USART_IT_RXNE ((uint32_t)0x00050105)\000"
.LASF1787:
	.ascii	"RTC_CR_ALRAE ((uint32_t)0x00000100)\000"
.LASF1192:
	.ascii	"GPIO_OSPEEDER_OSPEEDR4_1 ((uint32_t)0x00000200)\000"
.LASF471:
	.ascii	"__STM32F0XX_H \000"
.LASF2977:
	.ascii	"I2C_Ack_Disable I2C_CR2_NACK\000"
.LASF331:
	.ascii	"__ARM_ARCH_PROFILE 77\000"
.LASF1220:
	.ascii	"GPIO_OSPEEDER_OSPEEDR14 ((uint32_t)0x30000000)\000"
.LASF2130:
	.ascii	"TIM_SMCR_TS ((uint16_t)0x0070)\000"
.LASF813:
	.ascii	"COMP_CSR_COMP2MODE_1 ((uint32_t)0x00080000)\000"
.LASF2828:
	.ascii	"OB_WRP_Pages40to43 ((uint32_t)0x00000400)\000"
.LASF1400:
	.ascii	"I2C_CR1_SBC ((uint32_t)0x00010000)\000"
.LASF13:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF1873:
	.ascii	"RTC_TSTR_ST_2 ((uint32_t)0x00000040)\000"
.LASF2087:
	.ascii	"SYSCFG_EXTICR4_EXTI13_PC ((uint16_t)0x0020)\000"
.LASF3152:
	.ascii	"RTC_AlarmMask_Minutes ((uint32_t)0x00008000)\000"
.LASF3030:
	.ascii	"I2C_FLAG_ARLO I2C_ISR_ARLO\000"
.LASF3018:
	.ascii	"I2C_IT_RXI I2C_CR1_RXIE\000"
.LASF1198:
	.ascii	"GPIO_OSPEEDER_OSPEEDR6_1 ((uint32_t)0x00002000)\000"
.LASF486:
	.ascii	"__NVIC_PRIO_BITS 2\000"
.LASF1710:
	.ascii	"RCC_CFGR3_USART1SW_0 ((uint32_t)0x00000001)\000"
.LASF2418:
	.ascii	"USART_ICR_PECF ((uint32_t)0x00000001)\000"
.LASF2260:
	.ascii	"TIM_CCER_CC3E ((uint16_t)0x0100)\000"
.LASF269:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF3934:
	.ascii	"RCC_APB1Periph_I2C2 RCC_APB1ENR_I2C2EN\000"
.LASF3818:
	.ascii	"RCC_PLLMul_7 RCC_CFGR_PLLMULL7\000"
.LASF620:
	.ascii	"DMA1_Channel5_BASE (DMA1_BASE + 0x00000058)\000"
.LASF2211:
	.ascii	"TIM_CCMR1_IC2F ((uint16_t)0xF000)\000"
.LASF282:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF1173:
	.ascii	"GPIO_OTYPER_OT_11 ((uint32_t)0x00000800)\000"
.LASF2705:
	.ascii	"IS_DMA_DIR(DIR) (((DIR) == DMA_DIR_PeripheralSRC) |"
	.ascii	"| ((DIR) == DMA_DIR_PeripheralDST))\000"
.LASF1113:
	.ascii	"OB_WRP1_nWRP1 ((uint32_t)0xFF000000)\000"
.LASF4336:
	.ascii	"CARIBOUSTRING_H \000"
.LASF3125:
	.ascii	"RTC_Month_April ((uint8_t)0x04)\000"
.LASF1818:
	.ascii	"RTC_ALRMAR_MSK3 ((uint32_t)0x00800000)\000"
.LASF6:
	.ascii	"__VERSION__ \"5.4.1 20160609 (release) [ARM/embedde"
	.ascii	"d-5-branch revision 237715]\"\000"
.LASF1727:
	.ascii	"RTC_TR_HU_2 ((uint32_t)0x00040000)\000"
.LASF3781:
	.ascii	"IS_USART_GET_IT(IT) (((IT) == USART_IT_PE) || ((IT)"
	.ascii	" == USART_IT_TXE) || ((IT) == USART_IT_TC) || ((IT)"
	.ascii	" == USART_IT_RXNE) || ((IT) == USART_IT_IDLE) || (("
	.ascii	"IT) == USART_IT_LBD) || ((IT) == USART_IT_CTS) || ("
	.ascii	"(IT) == USART_IT_ORE) || ((IT) == USART_IT_NE) || ("
	.ascii	"(IT) == USART_IT_FE) || ((IT) == USART_IT_RTO) || ("
	.ascii	"(IT) == USART_IT_EOB) || ((IT) == USART_IT_CM) || ("
	.ascii	"(IT) == USART_IT_WU))\000"
.LASF3223:
	.ascii	"RTC_TamperPrechargeDuration_2RTCCLK ((uint32_t)0x00"
	.ascii	"002000)\000"
.LASF2266:
	.ascii	"TIM_CCER_CC4NP ((uint16_t)0x8000)\000"
.LASF4299:
	.ascii	"FP_NFPU 6\000"
.LASF735:
	.ascii	"ADC_CHSELR_CHSEL11 ((uint32_t)0x00000800)\000"
.LASF4376:
	.ascii	"CARIBOU_ADC_Channel_28 ((uint8_t)0x1C)\000"
.LASF4152:
	.ascii	"EMULTIHOP 72\000"
.LASF1334:
	.ascii	"GPIO_BSRR_BR_12 ((uint32_t)0x10000000)\000"
.LASF1646:
	.ascii	"RCC_APB1ENR_TIM6EN ((uint32_t)0x00000010)\000"
.LASF3952:
	.ascii	"RCC_FLAG_LSIRDY ((uint8_t)0x41)\000"
.LASF3220:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div256 ((uint32_t)0x0"
	.ascii	"0000700)\000"
.LASF2463:
	.ascii	"ADC_Resolution_6b ADC_CFGR1_RES\000"
.LASF3688:
	.ascii	"IS_USART_HARDWARE_FLOW_CONTROL(CONTROL) (((CONTROL)"
	.ascii	" == USART_HardwareFlowControl_None) || ((CONTROL) ="
	.ascii	"= USART_HardwareFlowControl_RTS) || ((CONTROL) == U"
	.ascii	"SART_HardwareFlowControl_CTS) || ((CONTROL) == USAR"
	.ascii	"T_HardwareFlowControl_RTS_CTS))\000"
.LASF1056:
	.ascii	"EXTI_PR_PR6 ((uint32_t)0x00000040)\000"
.LASF3339:
	.ascii	"I2S_AudioFreq_48k ((uint32_t)48000)\000"
.LASF793:
	.ascii	"COMP_CSR_COMP1MODE ((uint32_t)0x0000000C)\000"
.LASF1458:
	.ascii	"I2C_ICR_PECCF ((uint32_t)0x00000800)\000"
.LASF4075:
	.ascii	"ERANGE (__aeabi_ERANGE)\000"
.LASF3473:
	.ascii	"TIM_OSSIState_Enable ((uint16_t)0x0400)\000"
.LASF1432:
	.ascii	"I2C_TIMEOUTR_TIMOUTEN ((uint32_t)0x00008000)\000"
.LASF2034:
	.ascii	"SYSCFG_EXTICR1_EXTI1_PF ((uint16_t)0x0030)\000"
.LASF691:
	.ascii	"ADC_CR_ADEN ((uint32_t)0x00000001)\000"
.LASF3356:
	.ascii	"IS_SPI_I2S_DMA_REQ(REQ) ((((REQ) & (uint16_t)0xFFFC"
	.ascii	") == 0x00) && ((REQ) != 0x00))\000"
.LASF3227:
	.ascii	"RTC_Tamper_1 RTC_TAFCR_TAMP1E\000"
.LASF2492:
	.ascii	"ADC_AnalogWatchdog_Channel_7 ((uint32_t)0x1C000000)"
	.ascii	"\000"
.LASF1532:
	.ascii	"RCC_CFGR_HPRE_DIV256 ((uint32_t)0x000000E0)\000"
.LASF2062:
	.ascii	"SYSCFG_EXTICR3_EXTI8 ((uint16_t)0x000F)\000"
.LASF3567:
	.ascii	"TIM_TS_TI2FP2 ((uint16_t)0x0060)\000"
.LASF380:
	.ascii	"INT64_MAX 9223372036854775807LL\000"
.LASF4105:
	.ascii	"ENOTTY 25\000"
.LASF836:
	.ascii	"CRC_INIT_INIT ((uint32_t)0xFFFFFFFF)\000"
.LASF2169:
	.ascii	"TIM_SR_CC2OF ((uint16_t)0x0400)\000"
.LASF168:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF3262:
	.ascii	"RTC_IT_TAMP ((uint32_t)0x00000004)\000"
.LASF2049:
	.ascii	"SYSCFG_EXTICR2_EXTI4_PF ((uint16_t)0x0003)\000"
.LASF3762:
	.ascii	"USART_FLAG_PE USART_ISR_PE\000"
.LASF1598:
	.ascii	"RCC_CIR_LSERDYC ((uint32_t)0x00020000)\000"
.LASF579:
	.ascii	"_SHP_IDX(IRQn) ( ((((uint32_t)(IRQn) & 0x0F)-8) >> "
	.ascii	"2) )\000"
.LASF2591:
	.ascii	"CEC_IT_TXUDR CEC_IER_TXUDRIE\000"
.LASF4363:
	.ascii	"CARIBOU_ADC_Channel_15 ((uint8_t)0x0F)\000"
.LASF188:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF2195:
	.ascii	"TIM_CCMR1_OC2M ((uint16_t)0x7000)\000"
.LASF84:
	.ascii	"__INTMAX_MAX__ 0x7fffffffffffffffLL\000"
.LASF978:
	.ascii	"EXTI_EMR_MR9 ((uint32_t)0x00000200)\000"
.LASF2051:
	.ascii	"SYSCFG_EXTICR2_EXTI5_PB ((uint16_t)0x0010)\000"
.LASF2229:
	.ascii	"TIM_CCMR2_OC4FE ((uint16_t)0x0400)\000"
.LASF1930:
	.ascii	"RTC_TAFCR_TAMP1E ((uint32_t)0x00000001)\000"
.LASF1958:
	.ascii	"SPI_CR1_BIDIMODE ((uint16_t)0x8000)\000"
.LASF186:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF3881:
	.ascii	"RCC_IT_LSIRDY ((uint8_t)0x01)\000"
.LASF3926:
	.ascii	"RCC_APB1Periph_TIM2 RCC_APB1ENR_TIM2EN\000"
.LASF1048:
	.ascii	"EXTI_SWIER_SWIER17 ((uint32_t)0x00020000)\000"
.LASF2003:
	.ascii	"SPI_I2SCFGR_I2SCFG ((uint16_t)0x0300)\000"
.LASF1857:
	.ascii	"RTC_TSTR_HU_0 ((uint32_t)0x00010000)\000"
.LASF86:
	.ascii	"__UINTMAX_MAX__ 0xffffffffffffffffULL\000"
.LASF3286:
	.ascii	"SPI_DataSize_10b ((uint16_t)0x0900)\000"
.LASF988:
	.ascii	"EXTI_EMR_MR21 ((uint32_t)0x00200000)\000"
.LASF524:
	.ascii	"SCB_ICSR_ISRPENDING_Pos 22\000"
.LASF2306:
	.ascii	"TIM14_OR_TI1_RMP ((uint16_t)0x0003)\000"
.LASF3479:
	.ascii	"TIM_OCIdleState_Set ((uint16_t)0x0100)\000"
.LASF1866:
	.ascii	"RTC_TSTR_MNU_0 ((uint32_t)0x00000100)\000"
.LASF3370:
	.ascii	"IS_SPI_DIRECTION(DIRECTION) (((DIRECTION) == SPI_Di"
	.ascii	"rection_Rx) || ((DIRECTION) == SPI_Direction_Tx))\000"
.LASF4424:
	.ascii	"char\000"
.LASF3736:
	.ascii	"USART_Request_SBKRQ USART_RQR_SBKRQ\000"
.LASF971:
	.ascii	"EXTI_EMR_MR2 ((uint32_t)0x00000004)\000"
.LASF1446:
	.ascii	"I2C_ISR_PECERR ((uint32_t)0x00000800)\000"
.LASF2091:
	.ascii	"SYSCFG_EXTICR4_EXTI15_PA ((uint16_t)0x0000)\000"
.LASF2603:
	.ascii	"IS_CEC_GET_IT(IT) (((IT) == CEC_IT_TXACKE) || ((IT)"
	.ascii	" == CEC_IT_TXERR)|| ((IT) == CEC_IT_TXUDR)|| ((IT) "
	.ascii	"== CEC_IT_TXEND)|| ((IT) == CEC_IT_TXBR)|| ((IT) =="
	.ascii	" CEC_IT_ARBLST)|| ((IT) == CEC_IT_RXACKE)|| ((IT) ="
	.ascii	"= CEC_IT_LBPE)|| ((IT) == CEC_IT_SBPE)|| ((IT) == C"
	.ascii	"EC_IT_BRE)|| ((IT) == CEC_IT_RXOVR)|| ((IT) == CEC_"
	.ascii	"IT_RXEND)|| ((IT) == CEC_IT_RXBR))\000"
.LASF3074:
	.ascii	"IWDG_FLAG_PVU IWDG_SR_PVU\000"
.LASF3468:
	.ascii	"TIM_LOCKLevel_OFF ((uint16_t)0x0000)\000"
.LASF2898:
	.ascii	"GPIO_PinSource7 ((uint8_t)0x07)\000"
.LASF2472:
	.ascii	"ADC_ExternalTrigConv_T2_TRGO ADC_CFGR1_EXTSEL_1\000"
.LASF3269:
	.ascii	"__STM32F0XX_SPI_H \000"
.LASF476:
	.ascii	"HSI14_VALUE ((uint32_t)14000000)\000"
.LASF1565:
	.ascii	"RCC_CFGR_PLLMULL10 ((uint32_t)0x00200000)\000"
.LASF2054:
	.ascii	"SYSCFG_EXTICR2_EXTI6_PA ((uint16_t)0x0000)\000"
.LASF1590:
	.ascii	"RCC_CIR_CSSF ((uint32_t)0x00000080)\000"
.LASF1862:
	.ascii	"RTC_TSTR_MNT_0 ((uint32_t)0x00001000)\000"
.LASF4281:
	.ascii	"FP_UFLO 5\000"
.LASF2523:
	.ascii	"ADC_Channel_8 ADC_CHSELR_CHSEL8\000"
.LASF1239:
	.ascii	"GPIO_PUPDR_PUPDR4_0 ((uint32_t)0x00000100)\000"
.LASF3651:
	.ascii	"TIM_DMABurstLength_3Bytes TIM_DMABurstLength_3Trans"
	.ascii	"fers\000"
.LASF2798:
	.ascii	"EXTI_Line15 ((uint32_t)0x00008000)\000"
.LASF3720:
	.ascii	"USART_IrDAMode_LowPower USART_CR3_IRLP\000"
.LASF3036:
	.ascii	"IS_I2C_CLEAR_FLAG(FLAG) ((((FLAG) & (uint32_t)0xFFF"
	.ascii	"F4000) == 0x00) && ((FLAG) != 0x00))\000"
.LASF1030:
	.ascii	"EXTI_FTSR_TR19 ((uint32_t)0x00080000)\000"
.LASF29:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF3083:
	.ascii	"PWR_PVDLevel_2 PWR_CR_PLS_LEV2\000"
.LASF184:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF4202:
	.ascii	"EDQUOT 122\000"
.LASF782:
	.ascii	"CEC_IER_SBPEIE ((uint32_t)0x00000010)\000"
.LASF2805:
	.ascii	"EXTI_Line25 ((uint32_t)0x02000000)\000"
.LASF4236:
	.ascii	"caribou_interrupt_level() chip_interrupt_level()\000"
.LASF2578:
	.ascii	"IS_CEC_BIT_RISING_ERROR(ERROR) (((ERROR) == CEC_Bit"
	.ascii	"RisingError_Off) || ((ERROR) == CEC_BitRisingError_"
	.ascii	"On))\000"
.LASF1827:
	.ascii	"RTC_ALRMAR_HU_3 ((uint32_t)0x00080000)\000"
.LASF2985:
	.ascii	"IS_I2C_DIRECTION(DIRECTION) (((DIRECTION) == I2C_Di"
	.ascii	"rection_Transmitter) || ((DIRECTION) == I2C_Directi"
	.ascii	"on_Receiver))\000"
.LASF4113:
	.ascii	"EDOM 33\000"
.LASF829:
	.ascii	"CRC_DR_DR ((uint32_t)0xFFFFFFFF)\000"
.LASF999:
	.ascii	"EXTI_RTSR_TR6 ((uint32_t)0x00000040)\000"
.LASF1353:
	.ascii	"GPIO_LCKR_LCK15 ((uint32_t)0x00008000)\000"
.LASF2886:
	.ascii	"GPIO_Pin_14 ((uint16_t)0x4000)\000"
.LASF2885:
	.ascii	"GPIO_Pin_13 ((uint16_t)0x2000)\000"
.LASF3589:
	.ascii	"TIM_EventSource_CC2 ((uint16_t)0x0004)\000"
.LASF1933:
	.ascii	"RTC_ALRMASSR_MASKSS_1 ((uint32_t)0x02000000)\000"
.LASF3078:
	.ascii	"IS_IWDG_RELOAD(RELOAD) ((RELOAD) <= 0xFFF)\000"
.LASF4148:
	.ascii	"EADV 68\000"
.LASF1647:
	.ascii	"RCC_APB1ENR_TIM14EN ((uint32_t)0x00000100)\000"
.LASF2712:
	.ascii	"DMA_PeripheralDataSize_Byte ((uint32_t)0x00000000)\000"
.LASF949:
	.ascii	"EXTI_IMR_MR4 ((uint32_t)0x00000010)\000"
.LASF1223:
	.ascii	"GPIO_OSPEEDER_OSPEEDR15 ((uint32_t)0xC0000000)\000"
.LASF1468:
	.ascii	"IWDG_PR_PR_2 ((uint8_t)0x04)\000"
.LASF4106:
	.ascii	"ETXTBSY 26\000"
.LASF2138:
	.ascii	"TIM_SMCR_ETF_2 ((uint16_t)0x0400)\000"
.LASF458:
	.ascii	"max(a,b) (((a) > (b)) ? (a) : (b))\000"
.LASF2214:
	.ascii	"TIM_CCMR1_IC2F_2 ((uint16_t)0x4000)\000"
.LASF2213:
	.ascii	"TIM_CCMR1_IC2F_1 ((uint16_t)0x2000)\000"
.LASF2708:
	.ascii	"IS_DMA_PERIPHERAL_INC_STATE(STATE) (((STATE) == DMA"
	.ascii	"_PeripheralInc_Disable) || ((STATE) == DMA_Peripher"
	.ascii	"alInc_Enable))\000"
.LASF273:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF1741:
	.ascii	"RTC_TR_ST_2 ((uint32_t)0x00000040)\000"
.LASF923:
	.ascii	"DMA_IFCR_CTEIF5 ((uint32_t)0x00080000)\000"
.LASF544:
	.ascii	"SCB_SCR_SLEEPONEXIT_Pos 1\000"
.LASF4204:
	.ascii	"EMEDIUMTYPE 124\000"
.LASF1100:
	.ascii	"FLASH_OBR_nRST_STDBY ((uint32_t)0x00000400)\000"
.LASF2079:
	.ascii	"SYSCFG_EXTICR4_EXTI13 ((uint16_t)0x00F0)\000"
.LASF948:
	.ascii	"EXTI_IMR_MR3 ((uint32_t)0x00000008)\000"
.LASF542:
	.ascii	"SCB_SCR_SLEEPDEEP_Pos 2\000"
.LASF925:
	.ascii	"DMA_CCR_TCIE ((uint32_t)0x00000002)\000"
.LASF2721:
	.ascii	"DMA_Mode_Circular DMA_CCR_CIRC\000"
.LASF3069:
	.ascii	"IWDG_Prescaler_32 ((uint8_t)0x03)\000"
.LASF1011:
	.ascii	"EXTI_RTSR_TR19 ((uint32_t)0x00080000)\000"
.LASF748:
	.ascii	"ADC_CCR_VBATEN ((uint32_t)0x01000000)\000"
.LASF469:
	.ascii	"SYS_IRQ 32\000"
.LASF1149:
	.ascii	"GPIO_MODER_MODER11_1 ((uint32_t)0x00800000)\000"
.LASF842:
	.ascii	"DAC_CR_TSEL1_1 ((uint32_t)0x00000010)\000"
.LASF2405:
	.ascii	"USART_ISR_CTSIF ((uint32_t)0x00000200)\000"
.LASF3385:
	.ascii	"SPI_ReceptionFIFOStatus_1QuarterFull ((uint16_t)0x0"
	.ascii	"200)\000"
.LASF4401:
	.ascii	"CARIBOU_VERSION \"0.9.5\"\000"
.LASF1404:
	.ascii	"I2C_CR1_SMBHEN ((uint32_t)0x00100000)\000"
.LASF811:
	.ascii	"COMP_CSR_COMP2MODE ((uint32_t)0x000C0000)\000"
.LASF2804:
	.ascii	"EXTI_Line23 ((uint32_t)0x00800000)\000"
.LASF3856:
	.ascii	"RCC_SYSCLK_Div128 RCC_CFGR_HPRE_DIV128\000"
.LASF2542:
	.ascii	"ADC_IT_OVR ADC_IER_OVRIE\000"
.LASF3138:
	.ascii	"RTC_Weekday_Wednesday ((uint8_t)0x03)\000"
.LASF441:
	.ascii	"__CTYPE_PUNCT 0x10\000"
.LASF2023:
	.ascii	"SYSCFG_EXTICR1_EXTI0 ((uint16_t)0x000F)\000"
.LASF4393:
	.ascii	"CARIBOU_UART_BAUD_RATE_DEFAULT CARIBOU_UART_BAUD_RA"
	.ascii	"TE_9600\000"
.LASF3404:
	.ascii	"IS_TIM_LIST3_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3))\000"
.LASF1658:
	.ascii	"RCC_BDCR_LSEBYP ((uint32_t)0x00000004)\000"
.LASF841:
	.ascii	"DAC_CR_TSEL1_0 ((uint32_t)0x00000008)\000"
.LASF3788:
	.ascii	"__STM32F0XX_WWDG_H \000"
.LASF1732:
	.ascii	"RTC_TR_MNT_2 ((uint32_t)0x00004000)\000"
.LASF2347:
	.ascii	"USART_CR2_STOP_0 ((uint32_t)0x00001000)\000"
.LASF995:
	.ascii	"EXTI_RTSR_TR2 ((uint32_t)0x00000004)\000"
.LASF3472:
	.ascii	"IS_TIM_LOCK_LEVEL(LEVEL) (((LEVEL) == TIM_LOCKLevel"
	.ascii	"_OFF) || ((LEVEL) == TIM_LOCKLevel_1) || ((LEVEL) ="
	.ascii	"= TIM_LOCKLevel_2) || ((LEVEL) == TIM_LOCKLevel_3))"
	.ascii	"\000"
.LASF906:
	.ascii	"DMA_IFCR_CHTIF1 ((uint32_t)0x00000004)\000"
.LASF1876:
	.ascii	"RTC_TSTR_SU_1 ((uint32_t)0x00000002)\000"
.LASF3617:
	.ascii	"TIM_SlaveMode_Reset ((uint16_t)0x0004)\000"
.LASF4353:
	.ascii	"CARIBOU_ADC_Channel_5 ((uint8_t)0x05)\000"
.LASF1525:
	.ascii	"RCC_CFGR_HPRE_DIV1 ((uint32_t)0x00000000)\000"
.LASF1938:
	.ascii	"RTC_BKP1R ((uint32_t)0xFFFFFFFF)\000"
.LASF1514:
	.ascii	"RCC_CFGR_SWS ((uint32_t)0x0000000C)\000"
.LASF2314:
	.ascii	"USART_CR1_RXNEIE ((uint32_t)0x00000020)\000"
.LASF1797:
	.ascii	"RTC_ISR_TSOVF ((uint32_t)0x00001000)\000"
.LASF3610:
	.ascii	"TIM_TRGOSource_Update ((uint16_t)0x0020)\000"
.LASF1561:
	.ascii	"RCC_CFGR_PLLMULL6 ((uint32_t)0x00100000)\000"
.LASF1279:
	.ascii	"GPIO_IDR_5 ((uint32_t)0x00000020)\000"
.LASF3940:
	.ascii	"RCC_MCOSource_HSI14 ((uint8_t)0x01)\000"
.LASF866:
	.ascii	"DBGMCU_IDCODE_REV_ID_12 ((uint32_t)0x10000000)\000"
.LASF2503:
	.ascii	"ADC_AnalogWatchdog_Channel_18 ((uint32_t)0x48000000"
	.ascii	")\000"
.LASF629:
	.ascii	"GPIOD_BASE (AHB2PERIPH_BASE + 0x00000C00)\000"
.LASF1664:
	.ascii	"RCC_BDCR_RTCSEL_1 ((uint32_t)0x00000200)\000"
.LASF1725:
	.ascii	"RTC_TR_HU_0 ((uint32_t)0x00010000)\000"
.LASF2687:
	.ascii	"DBGMCU_TIM2_STOP DBGMCU_APB1_FZ_DBG_TIM2_STOP\000"
.LASF1137:
	.ascii	"GPIO_MODER_MODER7_1 ((uint32_t)0x00008000)\000"
.LASF1328:
	.ascii	"GPIO_BSRR_BR_6 ((uint32_t)0x00400000)\000"
.LASF1033:
	.ascii	"EXTI_SWIER_SWIER2 ((uint32_t)0x00000004)\000"
.LASF2222:
	.ascii	"TIM_CCMR2_OC3M_0 ((uint16_t)0x0010)\000"
.LASF1485:
	.ascii	"PWR_CR_PLS_LEV2 ((uint16_t)0x0040)\000"
.LASF2701:
	.ascii	"__STM32F0XX_DMA_H \000"
.LASF3202:
	.ascii	"IS_RTC_STORE_OPERATION(OPERATION) (((OPERATION) == "
	.ascii	"RTC_StoreOperation_Reset) || ((OPERATION) == RTC_St"
	.ascii	"oreOperation_Set))\000"
.LASF2449:
	.ascii	"WWDG_CFR_WDGTB ((uint16_t)0x0180)\000"
.LASF3194:
	.ascii	"RTC_SmoothCalibPlusPulses_Reset ((uint32_t)0x000000"
	.ascii	"00)\000"
.LASF136:
	.ascii	"__FLT_MAX__ 1.1\000"
.LASF1830:
	.ascii	"RTC_ALRMAR_MNT_0 ((uint32_t)0x00001000)\000"
.LASF1467:
	.ascii	"IWDG_PR_PR_1 ((uint8_t)0x02)\000"
.LASF1501:
	.ascii	"RCC_CR_HSICAL ((uint32_t)0x0000FF00)\000"
.LASF3151:
	.ascii	"RTC_AlarmMask_Hours ((uint32_t)0x00800000)\000"
.LASF4394:
	.ascii	"CARIBOU_UART_WORDSIZE_DEFAULT CARIBOU_UART_WORDSIZE"
	.ascii	"_8\000"
.LASF1538:
	.ascii	"RCC_CFGR_PPRE_DIV1 ((uint32_t)0x00000000)\000"
.LASF2522:
	.ascii	"ADC_Channel_7 ADC_CHSELR_CHSEL7\000"
.LASF3400:
	.ascii	"__STM32F0XX_TIM_H \000"
.LASF4370:
	.ascii	"CARIBOU_ADC_Channel_22 ((uint8_t)0x16)\000"
.LASF2855:
	.ascii	"OB_SRAM_PARITY_RESET ((uint8_t)0x40)\000"
.LASF3224:
	.ascii	"RTC_TamperPrechargeDuration_4RTCCLK ((uint32_t)0x00"
	.ascii	"004000)\000"
.LASF3571:
	.ascii	"TIM_TIxExternalCLK1Source_TI1 ((uint16_t)0x0050)\000"
.LASF2327:
	.ascii	"USART_CR1_DEDT_1 ((uint32_t)0x00020000)\000"
.LASF2754:
	.ascii	"DMA1_IT_TE5 DMA_ISR_TEIF5\000"
.LASF3756:
	.ascii	"USART_FLAG_TC USART_ISR_TC\000"
.LASF3735:
	.ascii	"USART_Request_ABRRQ USART_RQR_ABRRQ\000"
.LASF484:
	.ascii	"__CM0_REV 0\000"
.LASF232:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF189:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF4002:
	.ascii	"CARIBOU_GPIO_PIN_24 (1<<24)\000"
.LASF1386:
	.ascii	"GPIO_BRR_BR_15 ((uint32_t)0x00008000)\000"
.LASF4425:
	.ascii	"sizetype\000"
.LASF362:
	.ascii	"_CARIBOU_CONFIG_H_ \000"
.LASF3326:
	.ascii	"I2S_Standard_PCMShort ((uint16_t)0x0030)\000"
.LASF2745:
	.ascii	"DMA1_IT_HT3 DMA_ISR_HTIF3\000"
.LASF3284:
	.ascii	"SPI_DataSize_8b ((uint16_t)0x0700)\000"
.LASF851:
	.ascii	"DAC_SR_DMAUDR1 ((uint32_t)0x00002000)\000"
.LASF56:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF4203:
	.ascii	"ENOMEDIUM 123\000"
.LASF4157:
	.ascii	"EBADFD 77\000"
.LASF1500:
	.ascii	"RCC_CR_HSITRIM ((uint32_t)0x000000F8)\000"
.LASF2583:
	.ascii	"CEC_BRDNoGen_On CEC_CFGR_BRDNOGEN\000"
.LASF2432:
	.ascii	"WWDG_CR_T ((uint8_t)0x7F)\000"
.LASF3722:
	.ascii	"IS_USART_IRDA_MODE(MODE) (((MODE) == USART_IrDAMode"
	.ascii	"_LowPower) || ((MODE) == USART_IrDAMode_Normal))\000"
.LASF632:
	.ascii	"TIM3 ((TIM_TypeDef *) TIM3_BASE)\000"
.LASF4326:
	.ascii	"CARIBOUSTDINT_H \000"
.LASF765:
	.ascii	"CEC_ISR_RXBR ((uint32_t)0x00000001)\000"
.LASF2742:
	.ascii	"DMA1_IT_TE2 DMA_ISR_TEIF2\000"
.LASF3834:
	.ascii	"RCC_PREDIV1_Div6 RCC_CFGR2_PREDIV1_DIV6\000"
.LASF4414:
	.ascii	"int16_t\000"
.LASF4349:
	.ascii	"CARIBOU_ADC_Channel_1 ((uint8_t)0x01)\000"
.LASF496:
	.ascii	"__CORE_CMINSTR_H \000"
.LASF2303:
	.ascii	"TIM_DCR_DBL_3 ((uint16_t)0x0800)\000"
.LASF2844:
	.ascii	"IS_OB_STOP_SOURCE(SOURCE) (((SOURCE) == OB_STOP_NoR"
	.ascii	"ST) || ((SOURCE) == OB_STOP_RST))\000"
.LASF3892:
	.ascii	"RCC_LSE_ON RCC_BDCR_LSEON\000"
.LASF2561:
	.ascii	"CEC_SignalFreeTime_Standard ((uint32_t)0x00000000)\000"
.LASF672:
	.ascii	"GPIOF ((GPIO_TypeDef *) GPIOF_BASE)\000"
.LASF1614:
	.ascii	"RCC_APB1RSTR_TIM3RST ((uint32_t)0x00000002)\000"
.LASF1302:
	.ascii	"GPIO_ODR_12 ((uint32_t)0x00001000)\000"
.LASF3166:
	.ascii	"RTC_AlarmSubSecondMask_SS14_7 ((uint8_t)0x07)\000"
.LASF2247:
	.ascii	"TIM_CCMR2_IC4F ((uint16_t)0xF000)\000"
.LASF3793:
	.ascii	"IS_WWDG_PRESCALER(PRESCALER) (((PRESCALER) == WWDG_"
	.ascii	"Prescaler_1) || ((PRESCALER) == WWDG_Prescaler_2) |"
	.ascii	"| ((PRESCALER) == WWDG_Prescaler_4) || ((PRESCALER)"
	.ascii	" == WWDG_Prescaler_8))\000"
.LASF4369:
	.ascii	"CARIBOU_ADC_Channel_21 ((uint8_t)0x15)\000"
.LASF551:
	.ascii	"SCB_SHCSR_SVCALLPENDED_Msk (1UL << SCB_SHCSR_SVCALL"
	.ascii	"PENDED_Pos)\000"
.LASF3925:
	.ascii	"IS_RCC_APB2_PERIPH(PERIPH) ((((PERIPH) & 0xFFB8A5FE"
	.ascii	") == 0x00) && ((PERIPH) != 0x00))\000"
.LASF463:
	.ascii	"INT_MAX (0x7FFFFFFF)\000"
.LASF3003:
	.ascii	"I2C_Register_OAR1 ((uint8_t)0x08)\000"
.LASF1979:
	.ascii	"SPI_SR_CRCERR ((uint16_t)0x0010)\000"
.LASF2350:
	.ascii	"USART_CR2_SWAP ((uint32_t)0x00008000)\000"
.LASF3272:
	.ascii	"SPI_Direction_2Lines_FullDuplex ((uint16_t)0x0000)\000"
.LASF2788:
	.ascii	"EXTI_Line5 ((uint32_t)0x00000020)\000"
.LASF3120:
	.ascii	"IS_RTC_H12(PM) (((PM) == RTC_H12_AM) || ((PM) == RT"
	.ascii	"C_H12_PM))\000"
.LASF4428:
	.ascii	"prev\000"
.LASF2586:
	.ascii	"CEC_SFTOption_On CEC_CFGR_SFTOPT\000"
.LASF1972:
	.ascii	"SPI_CR2_FRXTH ((uint16_t)0x1000)\000"
.LASF4241:
	.ascii	"caribou_vector_pending(vector) chip_vector_pending("
	.ascii	"vector)\000"
.LASF3506:
	.ascii	"IS_TIM_IT(IT) ((((IT) & (uint16_t)0xFF00) == 0x0000"
	.ascii	") && ((IT) != 0x0000))\000"
.LASF1678:
	.ascii	"RCC_CSR_SFTRSTF ((uint32_t)0x10000000)\000"
.LASF2385:
	.ascii	"USART_BRR_DIV_FRACTION ((uint16_t)0x000F)\000"
.LASF1779:
	.ascii	"RTC_CR_POL ((uint32_t)0x00100000)\000"
.LASF2029:
	.ascii	"SYSCFG_EXTICR1_EXTI0_PC ((uint16_t)0x0002)\000"
.LASF517:
	.ascii	"SCB_ICSR_PENDSVCLR_Msk (1UL << SCB_ICSR_PENDSVCLR_P"
	.ascii	"os)\000"
.LASF3150:
	.ascii	"RTC_AlarmMask_DateWeekDay ((uint32_t)0x80000000)\000"
.LASF1744:
	.ascii	"RTC_TR_SU_1 ((uint32_t)0x00000002)\000"
.LASF3878:
	.ascii	"RCC_USART1CLK_LSE RCC_CFGR3_USART1SW_1\000"
.LASF208:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF1580:
	.ascii	"RCC_CFGR_MCO_SYSCLK ((uint32_t)0x04000000)\000"
.LASF2224:
	.ascii	"TIM_CCMR2_OC3M_2 ((uint16_t)0x0040)\000"
.LASF285:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF3596:
	.ascii	"TIM_UpdateSource_Global ((uint16_t)0x0000)\000"
.LASF3716:
	.ascii	"IS_USART_STOPMODE_WAKEUPSOURCE(SOURCE) (((SOURCE) ="
	.ascii	"= USART_WakeUpSource_AddressMatch) || ((SOURCE) == "
	.ascii	"USART_WakeUpSource_StartBit) || ((SOURCE) == USART_"
	.ascii	"WakeUpSource_RXNE))\000"
.LASF1634:
	.ascii	"RCC_AHBENR_TSEN ((uint32_t)0x01000000)\000"
.LASF683:
	.ascii	"ADC_IER_EOCIE ((uint32_t)0x00000004)\000"
.LASF2447:
	.ascii	"WWDG_CFR_W5 ((uint16_t)0x0020)\000"
.LASF311:
	.ascii	"__NO_INLINE__ 1\000"
.LASF366:
	.ascii	"_CARIBOU_BOARD_H_ \000"
.LASF2811:
	.ascii	"FLASH_Latency_1 FLASH_ACR_LATENCY\000"
.LASF14:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF2275:
	.ascii	"TIM_BDTR_DTG ((uint16_t)0x00FF)\000"
.LASF1871:
	.ascii	"RTC_TSTR_ST_0 ((uint32_t)0x00000010)\000"
.LASF26:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF135:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF3876:
	.ascii	"RCC_USART1CLK_PCLK ((uint32_t)0x00000000)\000"
.LASF2183:
	.ascii	"TIM_CCMR1_OC1FE ((uint16_t)0x0004)\000"
.LASF3464:
	.ascii	"IS_TIM_BREAK_POLARITY(POLARITY) (((POLARITY) == TIM"
	.ascii	"_BreakPolarity_Low) || ((POLARITY) == TIM_BreakPola"
	.ascii	"rity_High))\000"
.LASF336:
	.ascii	"__ARM_ARCH_ISA_THUMB 1\000"
.LASF93:
	.ascii	"__INT64_MAX__ 0x7fffffffffffffffLL\000"
.LASF4123:
	.ascii	"EIDRM 43\000"
.LASF3267:
	.ascii	"IS_RTC_GET_IT(IT) (((IT) == RTC_IT_TS) || ((IT) == "
	.ascii	"RTC_IT_ALRA) || ((IT) == RTC_IT_TAMP1) || ((IT) == "
	.ascii	"RTC_IT_TAMP2) || ((IT) == RTC_IT_TAMP3))\000"
.LASF4141:
	.ascii	"ENODATA 61\000"
.LASF2557:
	.ascii	"ADC_FLAG_ADCAL ((uint32_t)0x11000000)\000"
.LASF4015:
	.ascii	"caribou_gpio_set(gpio) chip_gpio_set((gpio)->port,("
	.ascii	"gpio)->pinmask)\000"
.LASF2534:
	.ascii	"ADC_Channel_TempSensor ((uint32_t)ADC_Channel_16)\000"
.LASF1039:
	.ascii	"EXTI_SWIER_SWIER8 ((uint32_t)0x00000100)\000"
.LASF2553:
	.ascii	"ADC_FLAG_ADEN ((uint32_t)0x01000001)\000"
.LASF3449:
	.ascii	"IS_TIM_OUTPUT_STATE(STATE) (((STATE) == TIM_OutputS"
	.ascii	"tate_Disable) || ((STATE) == TIM_OutputState_Enable"
	.ascii	"))\000"
.LASF2231:
	.ascii	"TIM_CCMR2_OC4M ((uint16_t)0x7000)\000"
.LASF1557:
	.ascii	"RCC_CFGR_PLLMULL2 ((uint32_t)0x00000000)\000"
.LASF1076:
	.ascii	"FLASH_OPTKEY1 ((uint32_t)0x45670123)\000"
.LASF4145:
	.ascii	"ENOPKG 65\000"
.LASF2102:
	.ascii	"TIM_CR1_DIR ((uint16_t)0x0010)\000"
.LASF2857:
	.ascii	"FLASH_FLAG_BSY FLASH_SR_BSY\000"
.LASF661:
	.ascii	"DMA1_Channel4 ((DMA_Channel_TypeDef *) DMA1_Channel"
	.ascii	"4_BASE)\000"
.LASF2950:
	.ascii	"SYSCFG_DMARemap_USART1Rx SYSCFG_CFGR1_USART1RX_DMA_"
	.ascii	"RMP\000"
.LASF2115:
	.ascii	"TIM_CR2_MMS_1 ((uint16_t)0x0020)\000"
.LASF924:
	.ascii	"DMA_CCR_EN ((uint32_t)0x00000001)\000"
.LASF1893:
	.ascii	"RTC_TSDR_DU_0 ((uint32_t)0x00000001)\000"
.LASF2628:
	.ascii	"IS_COMP_ALL_PERIPH(PERIPH) (((PERIPH) == COMP_Selec"
	.ascii	"tion_COMP1) || ((PERIPH) == COMP_Selection_COMP2))\000"
.LASF568:
	.ascii	"SysTick_CALIB_TENMS_Pos 0\000"
.LASF3071:
	.ascii	"IWDG_Prescaler_128 ((uint8_t)0x05)\000"
.LASF2880:
	.ascii	"GPIO_Pin_8 ((uint16_t)0x0100)\000"
.LASF492:
	.ascii	"__CORTEX_M (0x00)\000"
.LASF3222:
	.ascii	"RTC_TamperPrechargeDuration_1RTCCLK ((uint32_t)0x00"
	.ascii	"000000)\000"
.LASF3201:
	.ascii	"RTC_StoreOperation_Set ((uint32_t)0x00040000)\000"
.LASF768:
	.ascii	"CEC_ISR_BRE ((uint32_t)0x00000008)\000"
.LASF3382:
	.ascii	"SPI_TransmissionFIFOStatus_HalfFull ((uint16_t)0x10"
	.ascii	"00)\000"
.LASF1498:
	.ascii	"RCC_CR_HSION ((uint32_t)0x00000001)\000"
.LASF2103:
	.ascii	"TIM_CR1_CMS ((uint16_t)0x0060)\000"
.LASF3521:
	.ascii	"TIM_DMABase_CCR1 ((uint16_t)0x000D)\000"
.LASF3510:
	.ascii	"TIM_DMABase_SMCR ((uint16_t)0x0002)\000"
.LASF2519:
	.ascii	"ADC_Channel_4 ADC_CHSELR_CHSEL4\000"
.LASF1735:
	.ascii	"RTC_TR_MNU_1 ((uint32_t)0x00000200)\000"
.LASF1016:
	.ascii	"EXTI_FTSR_TR4 ((uint32_t)0x00000010)\000"
.LASF3198:
	.ascii	"RTC_DayLightSaving_ADD1H ((uint32_t)0x00010000)\000"
.LASF646:
	.ascii	"COMP ((COMP_TypeDef *) COMP_BASE)\000"
.LASF3942:
	.ascii	"RCC_MCOSource_LSE ((uint8_t)0x03)\000"
.LASF2923:
	.ascii	"EXTI_PortSourceGPIOC ((uint8_t)0x02)\000"
.LASF3312:
	.ascii	"SPI_BaudRatePrescaler_128 ((uint16_t)0x0030)\000"
.LASF1698:
	.ascii	"RCC_CFGR2_PREDIV1_DIV6 ((uint32_t)0x00000005)\000"
.LASF819:
	.ascii	"COMP_CSR_COMP2OUTSEL ((uint32_t)0x07000000)\000"
.LASF3238:
	.ascii	"RTC_BKP_DR0 ((uint32_t)0x00000000)\000"
.LASF3674:
	.ascii	"USART_StopBits_2 ((uint32_t)USART_CR2_STOP_1)\000"
.LASF1351:
	.ascii	"GPIO_LCKR_LCK13 ((uint32_t)0x00002000)\000"
.LASF2910:
	.ascii	"GPIO_AF_2 ((uint8_t)0x02)\000"
.LASF3219:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div512 ((uint32_t)0x0"
	.ascii	"0000600)\000"
.LASF1159:
	.ascii	"GPIO_MODER_MODER15 ((uint32_t)0xC0000000)\000"
.LASF3452:
	.ascii	"IS_TIM_OUTPUTN_STATE(STATE) (((STATE) == TIM_Output"
	.ascii	"NState_Disable) || ((STATE) == TIM_OutputNState_Ena"
	.ascii	"ble))\000"
.LASF375:
	.ascii	"INT16_MAX 32767\000"
.LASF2299:
	.ascii	"TIM_DCR_DBL ((uint16_t)0x1F00)\000"
.LASF3087:
	.ascii	"PWR_PVDLevel_6 PWR_CR_PLS_LEV6\000"
.LASF2637:
	.ascii	"COMP_Output_TIM1BKIN COMP_CSR_COMP1OUTSEL_0\000"
.LASF1360:
	.ascii	"GPIO_AFRL_AFRL5 ((uint32_t)0x00F00000)\000"
.LASF3061:
	.ascii	"IS_START_STOP_MODE(MODE) (((MODE) == I2C_Generate_S"
	.ascii	"top) || ((MODE) == I2C_Generate_Start_Read) || ((MO"
	.ascii	"DE) == I2C_Generate_Start_Write) || ((MODE) == I2C_"
	.ascii	"No_StartStop))\000"
.LASF1616:
	.ascii	"RCC_APB1RSTR_TIM14RST ((uint32_t)0x00000100)\000"
.LASF2113:
	.ascii	"TIM_CR2_MMS ((uint16_t)0x0070)\000"
.LASF1718:
	.ascii	"RCC_CR2_HSI14TRIM ((uint32_t)0x000000F8)\000"
.LASF2713:
	.ascii	"DMA_PeripheralDataSize_HalfWord DMA_CCR_PSIZE_0\000"
.LASF2460:
	.ascii	"ADC_Resolution_12b ((uint32_t)0x00000000)\000"
.LASF2505:
	.ascii	"ADC_SampleTime_1_5Cycles ((uint32_t)0x00000000)\000"
.LASF4259:
	.ascii	"LOGB2E 1.44269504088896341\000"
.LASF4216:
	.ascii	"CARIBOU_THREAD_DEF_STKSZ 1024\000"
.LASF3160:
	.ascii	"RTC_AlarmSubSecondMask_SS14_1 ((uint8_t)0x01)\000"
.LASF3407:
	.ascii	"IS_TIM_LIST6_PERIPH(PERIPH) (((PERIPH) == TIM1) || "
	.ascii	"((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIP"
	.ascii	"H) == TIM15))\000"
.LASF3137:
	.ascii	"RTC_Weekday_Tuesday ((uint8_t)0x02)\000"
.LASF3850:
	.ascii	"RCC_SYSCLK_Div1 RCC_CFGR_HPRE_DIV1\000"
.LASF2531:
	.ascii	"ADC_Channel_16 ADC_CHSELR_CHSEL16\000"
.LASF4314:
	.ascii	"CARIBOUSEMAPHORE_H \000"
.LASF1128:
	.ascii	"GPIO_MODER_MODER4_1 ((uint32_t)0x00000200)\000"
.LASF1807:
	.ascii	"RTC_PRER_PREDIV_S ((uint32_t)0x00007FFF)\000"
.LASF2105:
	.ascii	"TIM_CR1_CMS_1 ((uint16_t)0x0040)\000"
.LASF494:
	.ascii	"__INLINE inline\000"
.LASF2851:
	.ascii	"OB_VDDA_ANALOG_ON ((uint8_t)0x00)\000"
.LASF2933:
	.ascii	"EXTI_PinSource6 ((uint8_t)0x06)\000"
.LASF1315:
	.ascii	"GPIO_BSRR_BS_9 ((uint32_t)0x00000200)\000"
.LASF3836:
	.ascii	"RCC_PREDIV1_Div8 RCC_CFGR2_PREDIV1_DIV8\000"
.LASF4296:
	.ascii	"FP_POWN 20\000"
.LASF548:
	.ascii	"SCB_CCR_UNALIGN_TRP_Pos 3\000"
.LASF3306:
	.ascii	"SPI_BaudRatePrescaler_2 ((uint16_t)0x0000)\000"
.LASF1387:
	.ascii	"I2C_CR1_PE ((uint32_t)0x00000001)\000"
.LASF4461:
	.ascii	"thread_fault_fn\000"
.LASF3527:
	.ascii	"TIM_DMABase_OR ((uint16_t)0x0013)\000"
.LASF25:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF567:
	.ascii	"SysTick_CALIB_SKEW_Msk (1UL << SysTick_CALIB_SKEW_P"
	.ascii	"os)\000"
.LASF4114:
	.ascii	"ERANGE 34\000"
.LASF1894:
	.ascii	"RTC_TSDR_DU_1 ((uint32_t)0x00000002)\000"
.LASF2333:
	.ascii	"USART_CR1_DEAT_1 ((uint32_t)0x00400000)\000"
.LASF1267:
	.ascii	"GPIO_PUPDR_PUPDR13_1 ((uint32_t)0x08000000)\000"
.LASF3761:
	.ascii	"USART_FLAG_FE USART_ISR_FE\000"
.LASF2906:
	.ascii	"GPIO_PinSource15 ((uint8_t)0x0F)\000"
.LASF1819:
	.ascii	"RTC_ALRMAR_PM ((uint32_t)0x00400000)\000"
.LASF3937:
	.ascii	"RCC_APB1Periph_CEC RCC_APB1ENR_CECEN\000"
.LASF2883:
	.ascii	"GPIO_Pin_11 ((uint16_t)0x0800)\000"
.LASF614:
	.ascii	"DBGMCU_BASE (APBPERIPH_BASE + 0x00015800)\000"
.LASF1308:
	.ascii	"GPIO_BSRR_BS_2 ((uint32_t)0x00000004)\000"
.LASF2876:
	.ascii	"GPIO_Pin_4 ((uint16_t)0x0010)\000"
.LASF2555:
	.ascii	"ADC_FLAG_ADSTART ((uint32_t)0x01000004)\000"
.LASF749:
	.ascii	"ADC_CCR_TSEN ((uint32_t)0x00800000)\000"
.LASF194:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF3611:
	.ascii	"TIM_TRGOSource_OC1 ((uint16_t)0x0030)\000"
.LASF4289:
	.ascii	"FP_TANE 13\000"
.LASF3986:
	.ascii	"CARIBOU_GPIO_PIN_8 (1<<8)\000"
.LASF622:
	.ascii	"FLASH_R_BASE (AHBPERIPH_BASE + 0x00002000)\000"
.LASF2692:
	.ascii	"DBGMCU_WWDG_STOP DBGMCU_APB1_FZ_DBG_WWDG_STOP\000"
.LASF3000:
	.ascii	"IS_I2C_TIMEOUT(TIMEOUT) ((TIMEOUT) <= (uint16_t)0x0"
	.ascii	"FFF)\000"
.LASF1554:
	.ascii	"RCC_CFGR_PLLSRC_PREDIV1 ((uint32_t)0x00010000)\000"
.LASF862:
	.ascii	"DBGMCU_IDCODE_REV_ID_8 ((uint32_t)0x01000000)\000"
.LASF3477:
	.ascii	"TIM_OSSRState_Disable ((uint16_t)0x0000)\000"
.LASF3789:
	.ascii	"WWDG_Prescaler_1 ((uint32_t)0x00000000)\000"
.LASF2280:
	.ascii	"TIM_BDTR_DTG_4 ((uint16_t)0x0010)\000"
.LASF3133:
	.ascii	"RTC_Month_December ((uint8_t)0x12)\000"
.LASF823:
	.ascii	"COMP_CSR_COMP2POL ((uint32_t)0x08000000)\000"
.LASF2473:
	.ascii	"ADC_ExternalTrigConv_T3_TRGO ((uint32_t)(ADC_CFGR1_"
	.ascii	"EXTSEL_0 | ADC_CFGR1_EXTSEL_1))\000"
.LASF306:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF4445:
	.ascii	"prio\000"
.LASF1939:
	.ascii	"RTC_BKP2R ((uint32_t)0xFFFFFFFF)\000"
.LASF2355:
	.ascii	"USART_CR2_ABREN ((uint32_t)0x00100000)\000"
.LASF89:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF21:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF2041:
	.ascii	"SYSCFG_EXTICR1_EXTI3_PC ((uint16_t)0x2000)\000"
.LASF950:
	.ascii	"EXTI_IMR_MR5 ((uint32_t)0x00000020)\000"
.LASF2210:
	.ascii	"TIM_CCMR1_IC2PSC_1 ((uint16_t)0x0800)\000"
.LASF3334:
	.ascii	"I2S_MCLKOutput_Enable SPI_I2SPR_MCKOE\000"
.LASF700:
	.ascii	"ADC_CFGR1_DISCEN ((uint32_t)0x00010000)\000"
.LASF175:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF1905:
	.ascii	"RTC_CAL_CALM_3 ((uint32_t)0x00000008)\000"
.LASF3067:
	.ascii	"IWDG_Prescaler_8 ((uint8_t)0x01)\000"
.LASF2043:
	.ascii	"SYSCFG_EXTICR2_EXTI5 ((uint16_t)0x00F0)\000"
.LASF1934:
	.ascii	"RTC_ALRMASSR_MASKSS_2 ((uint32_t)0x04000000)\000"
.LASF1024:
	.ascii	"EXTI_FTSR_TR12 ((uint32_t)0x00001000)\000"
.LASF3777:
	.ascii	"USART_IT_ORE ((uint32_t)0x00030300)\000"
.LASF3866:
	.ascii	"RCC_ADCCLK_HSI14 ((uint32_t)0x00000000)\000"
.LASF4211:
	.ascii	"ENOTRECOVERABLE 131\000"
.LASF4173:
	.ascii	"EPROTONOSUPPORT 93\000"
.LASF4383:
	.ascii	"CARIBOU_I2C_INIT(port,device_address) {port,device_"
	.ascii	"address}\000"
.LASF1005:
	.ascii	"EXTI_RTSR_TR12 ((uint32_t)0x00001000)\000"
.LASF2438:
	.ascii	"WWDG_CR_T5 ((uint8_t)0x20)\000"
.LASF3016:
	.ascii	"I2C_IT_NACKI I2C_CR1_NACKIE\000"
.LASF1969:
	.ascii	"SPI_CR2_DS_1 ((uint16_t)0x0200)\000"
.LASF2774:
	.ascii	"DMA1_FLAG_TC5 DMA_ISR_TCIF5\000"
.LASF519:
	.ascii	"SCB_ICSR_PENDSTSET_Msk (1UL << SCB_ICSR_PENDSTSET_P"
	.ascii	"os)\000"
.LASF791:
	.ascii	"COMP_CSR_COMP1EN ((uint32_t)0x00000001)\000"
.LASF1396:
	.ascii	"I2C_CR1_ANFOFF ((uint32_t)0x00001000)\000"
.LASF2952:
	.ascii	"SYSCFG_DMARemap_ADC1 SYSCFG_CFGR1_ADC_DMA_RMP\000"
.LASF3964:
	.ascii	"IS_RCC_HSI14_CALIBRATION_VALUE(VALUE) ((VALUE) <= 0"
	.ascii	"x1F)\000"
.LASF156:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF2021:
	.ascii	"SYSCFG_CFGR1_I2C_FMP_PB8 ((uint32_t)0x00040000)\000"
.LASF1384:
	.ascii	"GPIO_BRR_BR_13 ((uint32_t)0x00002000)\000"
.LASF3814:
	.ascii	"RCC_PLLMul_3 RCC_CFGR_PLLMULL3\000"
.LASF3639:
	.ascii	"IS_TIM_IC_FILTER(ICFILTER) ((ICFILTER) <= 0xF)\000"
.LASF3127:
	.ascii	"RTC_Month_June ((uint8_t)0x06)\000"
.LASF1339:
	.ascii	"GPIO_LCKR_LCK1 ((uint32_t)0x00000002)\000"
.LASF270:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF2067:
	.ascii	"SYSCFG_EXTICR3_EXTI8_PB ((uint16_t)0x0001)\000"
.LASF728:
	.ascii	"ADC_CHSELR_CHSEL18 ((uint32_t)0x00040000)\000"
.LASF1936:
	.ascii	"RTC_ALRMASSR_SS ((uint32_t)0x00007FFF)\000"
.LASF3701:
	.ascii	"USART_DMAReq_Tx USART_CR3_DMAT\000"
.LASF1628:
	.ascii	"RCC_AHBENR_CRCEN ((uint32_t)0x00000040)\000"
.LASF2408:
	.ascii	"USART_ISR_EOBF ((uint32_t)0x00001000)\000"
.LASF3070:
	.ascii	"IWDG_Prescaler_64 ((uint8_t)0x04)\000"
.LASF23:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF3792:
	.ascii	"WWDG_Prescaler_8 ((uint32_t)0x00000180)\000"
.LASF474:
	.ascii	"HSI_STARTUP_TIMEOUT ((uint16_t)0x0500)\000"
.LASF3244:
	.ascii	"RTC_Format_BIN ((uint32_t)0x000000000)\000"
.LASF2922:
	.ascii	"EXTI_PortSourceGPIOB ((uint8_t)0x01)\000"
.LASF2866:
	.ascii	"IS_GPIO_LIST_PERIPH(PERIPH) (((PERIPH) == GPIOA) ||"
	.ascii	" ((PERIPH) == GPIOB))\000"
.LASF3763:
	.ascii	"IS_USART_FLAG(FLAG) (((FLAG) == USART_FLAG_PE) || ("
	.ascii	"(FLAG) == USART_FLAG_TXE) || ((FLAG) == USART_FLAG_"
	.ascii	"TC) || ((FLAG) == USART_FLAG_RXNE) || ((FLAG) == US"
	.ascii	"ART_FLAG_IDLE) || ((FLAG) == USART_FLAG_LBD) || ((F"
	.ascii	"LAG) == USART_FLAG_CTS) || ((FLAG) == USART_FLAG_OR"
	.ascii	"E) || ((FLAG) == USART_FLAG_NE) || ((FLAG) == USART"
	.ascii	"_FLAG_FE) || ((FLAG) == USART_FLAG_nCTSS) || ((FLAG"
	.ascii	") == USART_FLAG_RTO) || ((FLAG) == USART_FLAG_EOB) "
	.ascii	"|| ((FLAG) == USART_FLAG_ABRE) || ((FLAG) == USART_"
	.ascii	"FLAG_ABRF) || ((FLAG) == USART_FLAG_BUSY) || ((FLAG"
	.ascii	") == USART_FLAG_CM) || ((FLAG) == USART_FLAG_SBK) |"
	.ascii	"| ((FLAG) == USART_FLAG_RWU) || ((FLAG) == USART_FL"
	.ascii	"AG_WU) || ((FLAG) == USART_FLAG_TEACK)|| ((FLAG) =="
	.ascii	" USART_FLAG_REACK))\000"
.LASF1771:
	.ascii	"RTC_DR_DU_0 ((uint32_t)0x00000001)\000"
.LASF984:
	.ascii	"EXTI_EMR_MR15 ((uint32_t)0x00008000)\000"
.LASF357:
	.ascii	"CARIBOU_BITMAP_HEAP 1\000"
.LASF1177:
	.ascii	"GPIO_OTYPER_OT_15 ((uint32_t)0x00008000)\000"
.LASF756:
	.ascii	"CEC_CFGR_BRESTP ((uint32_t)0x00000010)\000"
.LASF4205:
	.ascii	"ECANCELED 125\000"
.LASF2605:
	.ascii	"CEC_FLAG_TXERR CEC_ISR_TXERR\000"
.LASF3066:
	.ascii	"IWDG_Prescaler_4 ((uint8_t)0x00)\000"
.LASF2516:
	.ascii	"ADC_Channel_1 ADC_CHSELR_CHSEL1\000"
.LASF1733:
	.ascii	"RTC_TR_MNU ((uint32_t)0x00000F00)\000"
.LASF406:
	.ascii	"UINT_FAST16_MAX UINT32_MAX\000"
.LASF2954:
	.ascii	"SYSCFG_I2CFastModePlus_PB6 SYSCFG_CFGR1_I2C_FMP_PB6"
	.ascii	"\000"
.LASF390:
	.ascii	"INT_LEAST16_MAX INT16_MAX\000"
.LASF2625:
	.ascii	"__STM32F0XX_COMP_H \000"
.LASF1045:
	.ascii	"EXTI_SWIER_SWIER14 ((uint32_t)0x00004000)\000"
.LASF2820:
	.ascii	"OB_WRP_Pages8to11 ((uint32_t)0x00000004)\000"
.LASF3703:
	.ascii	"IS_USART_DMAREQ(DMAREQ) ((((DMAREQ) & (uint32_t)0xF"
	.ascii	"FFFFF3F) == 0x00) && ((DMAREQ) != (uint32_t)0x00))\000"
.LASF219:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF1090:
	.ascii	"FLASH_CR_ERRIE ((uint32_t)0x00000400)\000"
.LASF4014:
	.ascii	"caribou_gpio_toggle(gpio) chip_gpio_toggle((gpio)->"
	.ascii	"port,(gpio)->pinmask)\000"
.LASF255:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF2878:
	.ascii	"GPIO_Pin_6 ((uint16_t)0x0040)\000"
.LASF3177:
	.ascii	"RTC_TimeStampEdge_Rising ((uint32_t)0x00000000)\000"
.LASF3764:
	.ascii	"IS_USART_CLEAR_FLAG(FLAG) (((FLAG) == USART_FLAG_WU"
	.ascii	") || ((FLAG) == USART_FLAG_TC) || ((FLAG) == USART_"
	.ascii	"FLAG_IDLE) || ((FLAG) == USART_FLAG_ORE) || ((FLAG)"
	.ascii	" == USART_FLAG_NE) || ((FLAG) == USART_FLAG_FE) || "
	.ascii	"((FLAG) == USART_FLAG_LBD) || ((FLAG) == USART_FLAG"
	.ascii	"_CTS) || ((FLAG) == USART_FLAG_RTO) || ((FLAG) == U"
	.ascii	"SART_FLAG_EOB) || ((FLAG) == USART_FLAG_CM) || ((FL"
	.ascii	"AG) == USART_FLAG_PE))\000"
.LASF70:
	.ascii	"__cpp_binary_literals 201304\000"
.LASF3287:
	.ascii	"SPI_DataSize_11b ((uint16_t)0x0A00)\000"
.LASF3105:
	.ascii	"PWR_FLAG_VREFINTRDY PWR_CSR_VREFINTRDYF\000"
.LASF668:
	.ascii	"GPIOA ((GPIO_TypeDef *) GPIOA_BASE)\000"
.LASF522:
	.ascii	"SCB_ICSR_ISRPREEMPT_Pos 23\000"
.LASF1348:
	.ascii	"GPIO_LCKR_LCK10 ((uint32_t)0x00000400)\000"
.LASF1235:
	.ascii	"GPIO_PUPDR_PUPDR3 ((uint32_t)0x000000C0)\000"
.LASF2352:
	.ascii	"USART_CR2_TXINV ((uint32_t)0x00020000)\000"
.LASF3914:
	.ascii	"IS_RCC_AHB_PERIPH(PERIPH) ((((PERIPH) & 0xFEA1FFAA)"
	.ascii	" == 0x00) && ((PERIPH) != 0x00))\000"
.LASF1981:
	.ascii	"SPI_SR_OVR ((uint16_t)0x0040)\000"
.LASF2762:
	.ascii	"DMA1_FLAG_TC2 DMA_ISR_TCIF2\000"
.LASF2186:
	.ascii	"TIM_CCMR1_OC1M_0 ((uint16_t)0x0010)\000"
.LASF1551:
	.ascii	"RCC_CFGR_PLLMULL_2 ((uint32_t)0x00100000)\000"
.LASF1408:
	.ascii	"I2C_CR2_SADD ((uint32_t)0x000003FF)\000"
.LASF527:
	.ascii	"SCB_ICSR_VECTPENDING_Msk (0x1FFUL << SCB_ICSR_VECTP"
	.ascii	"ENDING_Pos)\000"
.LASF3871:
	.ascii	"RCC_CECCLK_LSE RCC_CFGR3_CECSW\000"
.LASF1709:
	.ascii	"RCC_CFGR3_USART1SW ((uint32_t)0x00000003)\000"
.LASF2446:
	.ascii	"WWDG_CFR_W4 ((uint16_t)0x0010)\000"
.LASF821:
	.ascii	"COMP_CSR_COMP2OUTSEL_1 ((uint32_t)0x02000000)\000"
.LASF3297:
	.ascii	"SPI_CPOL_Low ((uint16_t)0x0000)\000"
.LASF2343:
	.ascii	"USART_CR2_CPHA ((uint32_t)0x00000200)\000"
.LASF3179:
	.ascii	"IS_RTC_TIMESTAMP_EDGE(EDGE) (((EDGE) == RTC_TimeSta"
	.ascii	"mpEdge_Rising) || ((EDGE) == RTC_TimeStampEdge_Fall"
	.ascii	"ing))\000"
.LASF3797:
	.ascii	"NVIC_LP_SEVONPEND ((uint8_t)0x10)\000"
.LASF1131:
	.ascii	"GPIO_MODER_MODER5_1 ((uint32_t)0x00000800)\000"
.LASF1910:
	.ascii	"RTC_CAL_CALM_8 ((uint32_t)0x00000100)\000"
.LASF2640:
	.ascii	"COMP_Output_TIM2IC4 COMP_CSR_COMP1OUTSEL_2\000"
.LASF4061:
	.ascii	"CARIBOU_PORTF_AFRH PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF4411:
	.ascii	"signed char\000"
.LASF3564:
	.ascii	"TIM_TS_ITR3 ((uint16_t)0x0030)\000"
.LASF3849:
	.ascii	"IS_RCC_SYSCLK_SOURCE(SOURCE) (((SOURCE) == RCC_SYSC"
	.ascii	"LKSource_HSI) || ((SOURCE) == RCC_SYSCLKSource_HSE)"
	.ascii	" || ((SOURCE) == RCC_SYSCLKSource_PLLCLK))\000"
.LASF2018:
	.ascii	"SYSCFG_CFGR1_TIM17_DMA_RMP ((uint32_t)0x00001000)\000"
.LASF827:
	.ascii	"COMP_CSR_COMP2OUT ((uint32_t)0x40000000)\000"
.LASF120:
	.ascii	"__UINT_FAST32_MAX__ 0xffffffffU\000"
.LASF4179:
	.ascii	"EADDRNOTAVAIL 99\000"
.LASF2269:
	.ascii	"TIM_ARR_ARR ((uint16_t)0xFFFF)\000"
.LASF875:
	.ascii	"DBGMCU_APB1_FZ_DBG_TIM14_STOP ((uint32_t)0x00000100"
	.ascii	")\000"
.LASF1802:
	.ascii	"RTC_ISR_RSF ((uint32_t)0x00000020)\000"
.LASF4160:
	.ascii	"ELIBBAD 80\000"
.LASF42:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF1878:
	.ascii	"RTC_TSTR_SU_3 ((uint32_t)0x00000008)\000"
.LASF721:
	.ascii	"ADC_CFGR2_JITOFFDIV2 ((uint32_t)0x40000000)\000"
.LASF3993:
	.ascii	"CARIBOU_GPIO_PIN_15 (1<<15)\000"
.LASF3221:
	.ascii	"IS_RTC_TAMPER_SAMPLING_FREQ(FREQ) (((FREQ) ==RTC_Ta"
	.ascii	"mperSamplingFreq_RTCCLK_Div32768) || ((FREQ) ==RTC_"
	.ascii	"TamperSamplingFreq_RTCCLK_Div16384) || ((FREQ) ==RT"
	.ascii	"C_TamperSamplingFreq_RTCCLK_Div8192) || ((FREQ) ==R"
	.ascii	"TC_TamperSamplingFreq_RTCCLK_Div4096) || ((FREQ) =="
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div2048) || ((FREQ) ="
	.ascii	"=RTC_TamperSamplingFreq_RTCCLK_Div1024) || ((FREQ) "
	.ascii	"==RTC_TamperSamplingFreq_RTCCLK_Div512) || ((FREQ) "
	.ascii	"==RTC_TamperSamplingFreq_RTCCLK_Div256))\000"
.LASF2167:
	.ascii	"TIM_SR_BIF ((uint16_t)0x0080)\000"
.LASF2838:
	.ascii	"IS_OB_RDP(LEVEL) (((LEVEL) == OB_RDP_Level_0)|| ((L"
	.ascii	"EVEL) == OB_RDP_Level_1))\000"
.LASF600:
	.ascii	"PWR_BASE (APBPERIPH_BASE + 0x00007000)\000"
.LASF4490:
	.ascii	"_ZN7CARIBOU18CCaribouMainThread14mCaribouThreadE\000"
.LASF3544:
	.ascii	"TIM_DMABurstLength_16Transfers ((uint16_t)0x0F00)\000"
.LASF1793:
	.ascii	"RTC_ISR_RECALPF ((uint32_t)0x00010000)\000"
.LASF3766:
	.ascii	"USART_IT_CM ((uint32_t)0x0011010E)\000"
.LASF1112:
	.ascii	"OB_WRP1_WRP1 ((uint32_t)0x00FF0000)\000"
.LASF3854:
	.ascii	"RCC_SYSCLK_Div16 RCC_CFGR_HPRE_DIV16\000"
.LASF3156:
	.ascii	"RTC_Alarm_A ((uint32_t)0x00000100)\000"
.LASF3826:
	.ascii	"RCC_PLLMul_15 RCC_CFGR_PLLMULL15\000"
.LASF2156:
	.ascii	"TIM_DIER_CC3DE ((uint16_t)0x0800)\000"
.LASF2837:
	.ascii	"OB_RDP_Level_1 ((uint8_t)0xBB)\000"
.LASF3235:
	.ascii	"RTC_ShiftAdd1S_Set ((uint32_t)0x80000000)\000"
.LASF3860:
	.ascii	"RCC_HCLK_Div1 RCC_CFGR_PPRE_DIV1\000"
.LASF3240:
	.ascii	"RTC_BKP_DR2 ((uint32_t)0x00000002)\000"
.LASF3085:
	.ascii	"PWR_PVDLevel_4 PWR_CR_PLS_LEV4\000"
.LASF1393:
	.ascii	"I2C_CR1_TCIE ((uint32_t)0x00000040)\000"
.LASF1556:
	.ascii	"RCC_CFGR_PLLXTPRE_PREDIV1_Div2 ((uint32_t)0x0002000"
	.ascii	"0)\000"
.LASF1911:
	.ascii	"RTC_TAFCR_ALARMOUTTYPE ((uint32_t)0x00040000)\000"
.LASF1257:
	.ascii	"GPIO_PUPDR_PUPDR10_0 ((uint32_t)0x00100000)\000"
.LASF2826:
	.ascii	"OB_WRP_Pages32to35 ((uint32_t)0x00000100)\000"
.LASF3216:
	.ascii	"RTC_TamperSamplingFreq_RTCCLK_Div4096 ((uint32_t)0x"
	.ascii	"00000300)\000"
.LASF111:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF2437:
	.ascii	"WWDG_CR_T4 ((uint8_t)0x10)\000"
.LASF1518:
	.ascii	"RCC_CFGR_SWS_HSE ((uint32_t)0x00000004)\000"
.LASF2641:
	.ascii	"COMP_Output_TIM2OCREFCLR ((uint32_t)0x00000500)\000"
.LASF2022:
	.ascii	"SYSCFG_CFGR1_I2C_FMP_PB9 ((uint32_t)0x00080000)\000"
.LASF82:
	.ascii	"__PTRDIFF_MAX__ 0x7fffffff\000"
.LASF4082:
	.ascii	"ENOENT 2\000"
.LASF1895:
	.ascii	"RTC_TSDR_DU_2 ((uint32_t)0x00000004)\000"
.LASF3877:
	.ascii	"RCC_USART1CLK_SYSCLK RCC_CFGR3_USART1SW_0\000"
.LASF613:
	.ascii	"TIM17_BASE (APBPERIPH_BASE + 0x00014800)\000"
.LASF2500:
	.ascii	"ADC_AnalogWatchdog_Channel_15 ((uint32_t)0x3C000000"
	.ascii	")\000"
.LASF1133:
	.ascii	"GPIO_MODER_MODER6_0 ((uint32_t)0x00001000)\000"
.LASF1029:
	.ascii	"EXTI_FTSR_TR17 ((uint32_t)0x00020000)\000"
.LASF1892:
	.ascii	"RTC_TSDR_DU ((uint32_t)0x0000000F)\000"
.LASF1049:
	.ascii	"EXTI_SWIER_SWIER19 ((uint32_t)0x00080000)\000"
.LASF2869:
	.ascii	"IS_GPIO_SPEED(SPEED) (((SPEED) == GPIO_Speed_Level_"
	.ascii	"1) || ((SPEED) == GPIO_Speed_Level_2) || ((SPEED) ="
	.ascii	"= GPIO_Speed_Level_3))\000"
.LASF146:
	.ascii	"__DBL_MIN_10_EXP__ (-37)\000"
.LASF3638:
	.ascii	"IS_TIM_CLEAR_FLAG(TIM_FLAG) ((((TIM_FLAG) & (uint16"
	.ascii	"_t)0xE100) == 0x0000) && ((TIM_FLAG) != 0x0000))\000"
.LASF1388:
	.ascii	"I2C_CR1_TXIE ((uint32_t)0x00000002)\000"
.LASF2360:
	.ascii	"USART_CR2_ADD ((uint32_t)0xFF000000)\000"
.LASF2071:
	.ascii	"SYSCFG_EXTICR3_EXTI9_PC ((uint16_t)0x0020)\000"
.LASF3009:
	.ascii	"I2C_Register_PECR ((uint8_t)0x20)\000"
.LASF603:
	.ascii	"SYSCFG_BASE (APBPERIPH_BASE + 0x00010000)\000"
.LASF1667:
	.ascii	"RCC_BDCR_RTCSEL_LSI ((uint32_t)0x00000200)\000"
.LASF1391:
	.ascii	"I2C_CR1_NACKIE ((uint32_t)0x00000010)\000"
.LASF543:
	.ascii	"SCB_SCR_SLEEPDEEP_Msk (1UL << SCB_SCR_SLEEPDEEP_Pos"
	.ascii	")\000"
.LASF1376:
	.ascii	"GPIO_BRR_BR_5 ((uint32_t)0x00000020)\000"
.LASF4378:
	.ascii	"CARIBOU_ADC_Channel_30 ((uint8_t)0x1E)\000"
.LASF2594:
	.ascii	"CEC_IT_ARBLST CEC_IER_ARBLSTIE\000"
.LASF1462:
	.ascii	"I2C_RXDR_RXDATA ((uint32_t)0x000000FF)\000"
.LASF4291:
	.ascii	"FP_ATAN 15\000"
.LASF3261:
	.ascii	"RTC_IT_ALRA ((uint32_t)0x00001000)\000"
.LASF873:
	.ascii	"DBGMCU_APB1_FZ_DBG_TIM3_STOP ((uint32_t)0x00000002)"
	.ascii	"\000"
.LASF4220:
	.ascii	"CARIBOU_THREAD_DEF_PRIO CARIBOU_THREAD_LOWPRIO\000"
.LASF2317:
	.ascii	"USART_CR1_PEIE ((uint32_t)0x00000100)\000"
.LASF3351:
	.ascii	"SPI_RxFIFOThreshold_HF ((uint16_t)0x0000)\000"
.LASF4454:
	.ascii	"once\000"
.LASF1368:
	.ascii	"GPIO_AFRH_AFRH5 ((uint32_t)0x00F00000)\000"
.LASF3413:
	.ascii	"TIM_OCMode_Timing ((uint16_t)0x0000)\000"
.LASF2292:
	.ascii	"TIM_BDTR_MOE ((uint16_t)0x8000)\000"
.LASF3899:
	.ascii	"RCC_LSEDrive_Low ((uint32_t)0x00000000)\000"
.LASF1381:
	.ascii	"GPIO_BRR_BR_10 ((uint32_t)0x00000400)\000"
.LASF3308:
	.ascii	"SPI_BaudRatePrescaler_8 ((uint16_t)0x0010)\000"
.LASF3803:
	.ascii	"SysTick_CLKSource_HCLK ((uint32_t)0x00000004)\000"
.LASF2786:
	.ascii	"EXTI_Line3 ((uint32_t)0x00000008)\000"
.LASF47:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF2650:
	.ascii	"COMP_Hysteresis_Medium COMP_CSR_COMP1HYST_1\000"
.LASF3650:
	.ascii	"TIM_DMABurstLength_2Bytes TIM_DMABurstLength_2Trans"
	.ascii	"fers\000"
.LASF2638:
	.ascii	"COMP_Output_TIM1IC1 COMP_CSR_COMP1OUTSEL_1\000"
.LASF3258:
	.ascii	"IS_RTC_GET_FLAG(FLAG) (((FLAG) == RTC_FLAG_RECALPF)"
	.ascii	" || ((FLAG) == RTC_FLAG_TAMP3F) || ((FLAG) == RTC_F"
	.ascii	"LAG_TAMP2F) || ((FLAG) == RTC_FLAG_TAMP1F) || ((FLA"
	.ascii	"G) == RTC_FLAG_TSOVF) || ((FLAG) == RTC_FLAG_TSF) |"
	.ascii	"| ((FLAG) == RTC_FLAG_ALRAF) || ((FLAG) == RTC_FLAG"
	.ascii	"_INITF) || ((FLAG) == RTC_FLAG_RSF) || ((FLAG) == R"
	.ascii	"TC_FLAG_INITS) || ((FLAG) == RTC_FLAG_SHPF))\000"
.LASF778:
	.ascii	"CEC_IER_RXBRIE ((uint32_t)0x00000001)\000"
.LASF3106:
	.ascii	"IS_PWR_GET_FLAG(FLAG) (((FLAG) == PWR_FLAG_WU) || ("
	.ascii	"(FLAG) == PWR_FLAG_SB) || ((FLAG) == PWR_FLAG_PVDO)"
	.ascii	" || ((FLAG) == PWR_FLAG_VREFINTRDY))\000"
.LASF3553:
	.ascii	"TIM_DMA_COM ((uint16_t)0x2000)\000"
.LASF2717:
	.ascii	"DMA_MemoryDataSize_HalfWord DMA_CCR_MSIZE_0\000"
.LASF4400:
	.ascii	"__CARIBOU_RTOS__ \000"
.LASF1983:
	.ascii	"SPI_SR_FRE ((uint16_t)0x0100)\000"
.LASF1010:
	.ascii	"EXTI_RTSR_TR17 ((uint32_t)0x00020000)\000"
.LASF3706:
	.ascii	"IS_USART_DMAONERROR(DMAERROR) (((DMAERROR) == USART"
	.ascii	"_DMAOnError_Disable)|| ((DMAERROR) == USART_DMAOnEr"
	.ascii	"ror_Enable))\000"
.LASF1825:
	.ascii	"RTC_ALRMAR_HU_1 ((uint32_t)0x00020000)\000"
.LASF2961:
	.ascii	"SYSCFG_Break_Lockup SYSCFG_CFGR2_LOCKUP_LOCK\000"
.LASF739:
	.ascii	"ADC_CHSELR_CHSEL7 ((uint32_t)0x00000080)\000"
.LASF4469:
	.ascii	"operator delete\000"
.LASF4206:
	.ascii	"ENOKEY 126\000"
.LASF4161:
	.ascii	"ELIBSCN 81\000"
.LASF1738:
	.ascii	"RTC_TR_ST ((uint32_t)0x00000070)\000"
.LASF730:
	.ascii	"ADC_CHSELR_CHSEL16 ((uint32_t)0x00010000)\000"
.LASF3727:
	.ascii	"USART_InvPin_Rx USART_CR2_RXINV\000"
.LASF3573:
	.ascii	"TIM_TIxExternalCLK1Source_TI1ED ((uint16_t)0x0040)\000"
.LASF1170:
	.ascii	"GPIO_OTYPER_OT_8 ((uint32_t)0x00000100)\000"
.LASF790:
	.ascii	"CEC_IER_TXACKEIE ((uint32_t)0x00001000)\000"
.LASF1413:
	.ascii	"I2C_CR2_STOP ((uint32_t)0x00004000)\000"
.LASF2131:
	.ascii	"TIM_SMCR_TS_0 ((uint16_t)0x0010)\000"
.LASF1517:
	.ascii	"RCC_CFGR_SWS_HSI ((uint32_t)0x00000000)\000"
.LASF2030:
	.ascii	"SYSCFG_EXTICR1_EXTI0_PF ((uint16_t)0x0003)\000"
.LASF2148:
	.ascii	"TIM_DIER_CC3IE ((uint16_t)0x0008)\000"
.LASF1609:
	.ascii	"RCC_APB2RSTR_TIM15RST ((uint32_t)0x00010000)\000"
.LASF1301:
	.ascii	"GPIO_ODR_11 ((uint32_t)0x00000800)\000"
.LASF308:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF2316:
	.ascii	"USART_CR1_TXEIE ((uint32_t)0x00000080)\000"
.LASF4079:
	.ascii	"errno (*__aeabi_errno_addr())\000"
.LASF18:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF493:
	.ascii	"__ASM __asm\000"
.LASF2188:
	.ascii	"TIM_CCMR1_OC1M_2 ((uint16_t)0x0040)\000"
.LASF1746:
	.ascii	"RTC_TR_SU_3 ((uint32_t)0x00000008)\000"
.LASF3031:
	.ascii	"I2C_FLAG_OVR I2C_ISR_OVR\000"
.LASF426:
	.ascii	"WCHAR_MAX 2147483647L\000"
.LASF2610:
	.ascii	"CEC_FLAG_RXACKE CEC_ISR_RXACKE\000"
.LASF1123:
	.ascii	"GPIO_MODER_MODER3 ((uint32_t)0x000000C0)\000"
.LASF3530:
	.ascii	"TIM_DMABurstLength_2Transfers ((uint16_t)0x0100)\000"
.LASF2354:
	.ascii	"USART_CR2_MSBFIRST ((uint32_t)0x00080000)\000"
.LASF420:
	.ascii	"UINT32_C(x) (x ##UL)\000"
.LASF1421:
	.ascii	"I2C_OAR1_OA1EN ((uint32_t)0x00008000)\000"
.LASF427:
	.ascii	"WINT_MIN (-2147483647L-1)\000"
.LASF230:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF3644:
	.ascii	"TIM14_GPIO ((uint16_t)0x0000)\000"
.LASF3014:
	.ascii	"I2C_IT_TCI I2C_CR1_TCIE\000"
.LASF3886:
	.ascii	"RCC_IT_HSI14RDY ((uint8_t)0x20)\000"
.LASF360:
	.ascii	"_CARIBOU_PLUSPLUS_H_ \000"
.LASF4162:
	.ascii	"ELIBMAX 82\000"
.LASF2375:
	.ascii	"USART_CR3_DEM ((uint32_t)0x00004000)\000"
.LASF4465:
	.ascii	"operator new []\000"
.LASF3794:
	.ascii	"IS_WWDG_WINDOW_VALUE(VALUE) ((VALUE) <= 0x7F)\000"
.LASF1183:
	.ascii	"GPIO_OSPEEDER_OSPEEDR1_1 ((uint32_t)0x00000008)\000"
.LASF1320:
	.ascii	"GPIO_BSRR_BS_14 ((uint32_t)0x00004000)\000"
.LASF2401:
	.ascii	"USART_ISR_RXNE ((uint32_t)0x00000020)\000"
.LASF3476:
	.ascii	"TIM_OSSRState_Enable ((uint16_t)0x0800)\000"
.LASF1482:
	.ascii	"PWR_CR_PLS_2 ((uint16_t)0x0080)\000"
.LASF4176:
	.ascii	"EPFNOSUPPORT 96\000"
.LASF2652:
	.ascii	"IS_COMP_HYSTERESIS(HYSTERESIS) (((HYSTERESIS) == CO"
	.ascii	"MP_Hysteresis_No) || ((HYSTERESIS) == COMP_Hysteres"
	.ascii	"is_Low) || ((HYSTERESIS) == COMP_Hysteresis_Medium)"
	.ascii	" || ((HYSTERESIS) == COMP_Hysteresis_High))\000"
.LASF460:
	.ascii	"LONG_MIN (0x8000000000000000)\000"
.LASF3951:
	.ascii	"RCC_FLAG_LSERDY ((uint8_t)0x21)\000"
.LASF1766:
	.ascii	"RTC_DR_MU_3 ((uint32_t)0x00000800)\000"
.LASF414:
	.ascii	"UINTPTR_MAX UINT32_MAX\000"
.LASF597:
	.ascii	"USART2_BASE (APBPERIPH_BASE + 0x00004400)\000"
.LASF1457:
	.ascii	"I2C_ICR_OVRCF ((uint32_t)0x00000400)\000"
.LASF3868:
	.ascii	"RCC_ADCCLK_PCLK_Div4 ((uint32_t)0x01004000)\000"
.LASF125:
	.ascii	"__GCC_IEC_559_COMPLEX 0\000"
.LASF4402:
	.ascii	"_CARIBOU_COBJECT_H_ \000"
.LASF3247:
	.ascii	"RTC_FLAG_RECALPF ((uint32_t)0x00010000)\000"
.LASF2109:
	.ascii	"TIM_CR1_CKD_1 ((uint16_t)0x0200)\000"
.LASF4423:
	.ascii	"long int\000"
.LASF2399:
	.ascii	"USART_ISR_ORE ((uint32_t)0x00000008)\000"
.LASF2032:
	.ascii	"SYSCFG_EXTICR1_EXTI1_PB ((uint16_t)0x0010)\000"
.LASF859:
	.ascii	"DBGMCU_IDCODE_REV_ID_5 ((uint32_t)0x00200000)\000"
.LASF2666:
	.ascii	"DAC_Trigger_Ext_IT9 ((uint32_t)0x00000034)\000"
.LASF3612:
	.ascii	"TIM_TRGOSource_OC1Ref ((uint16_t)0x0040)\000"
.LASF2648:
	.ascii	"COMP_Hysteresis_No 0x00000000\000"
.LASF1371:
	.ascii	"GPIO_BRR_BR_0 ((uint32_t)0x00000001)\000"
.LASF4416:
	.ascii	"uint16_t\000"
.LASF3879:
	.ascii	"RCC_USART1CLK_HSI RCC_CFGR3_USART1SW\000"
.LASF1622:
	.ascii	"RCC_APB1RSTR_PWRRST ((uint32_t)0x10000000)\000"
.LASF1813:
	.ascii	"RTC_ALRMAR_DU ((uint32_t)0x0F000000)\000"
.LASF4280:
	.ascii	"FP_OFLO 4\000"
.LASF1777:
	.ascii	"RTC_CR_OSEL_0 ((uint32_t)0x00200000)\000"
.LASF3804:
	.ascii	"IS_SYSTICK_CLK_SOURCE(SOURCE) (((SOURCE) == SysTick"
	.ascii	"_CLKSource_HCLK) || ((SOURCE) == SysTick_CLKSource_"
	.ascii	"HCLK_Div8))\000"
.LASF1954:
	.ascii	"SPI_CR1_CRCL ((uint16_t)0x0800)\000"
.LASF1222:
	.ascii	"GPIO_OSPEEDER_OSPEEDR14_1 ((uint32_t)0x20000000)\000"
.LASF4070:
	.ascii	"caribou_timer_period() (JIFFIES)\000"
.LASF2951:
	.ascii	"SYSCFG_DMARemap_USART1Tx SYSCFG_CFGR1_USART1TX_DMA_"
	.ascii	"RMP\000"
.LASF655:
	.ascii	"TIM17 ((TIM_TypeDef *) TIM17_BASE)\000"
.LASF2994:
	.ascii	"I2C_OA2_Mask03 ((uint8_t)0x03)\000"
.LASF2970:
	.ascii	"IS_I2C_ANALOG_FILTER(FILTER) (((FILTER) == I2C_Anal"
	.ascii	"ogFilter_Enable) || ((FILTER) == I2C_AnalogFilter_D"
	.ascii	"isable))\000"
.LASF2646:
	.ascii	"COMP_OutputPol_Inverted COMP_CSR_COMP1POL\000"
.LASF2604:
	.ascii	"CEC_FLAG_TXACKE CEC_ISR_TXACKE\000"
.LASF2630:
	.ascii	"COMP_InvertingInput_1_2VREFINT COMP_CSR_COMP1INSEL_"
	.ascii	"0\000"
.LASF2362:
	.ascii	"USART_CR3_IREN ((uint32_t)0x00000002)\000"
.LASF3154:
	.ascii	"RTC_AlarmMask_All ((uint32_t)0x80808080)\000"
.LASF1762:
	.ascii	"RTC_DR_MU ((uint32_t)0x00000F00)\000"
.LASF4364:
	.ascii	"CARIBOU_ADC_Channel_16 ((uint8_t)0x10)\000"
.LASF1957:
	.ascii	"SPI_CR1_BIDIOE ((uint16_t)0x4000)\000"
.LASF2747:
	.ascii	"DMA1_IT_GL4 DMA_ISR_GIF4\000"
.LASF3482:
	.ascii	"TIM_OCNIdleState_Set ((uint16_t)0x0200)\000"
.LASF3618:
	.ascii	"TIM_SlaveMode_Gated ((uint16_t)0x0005)\000"
.LASF3135:
	.ascii	"IS_RTC_DATE(DATE) (((DATE) >= 1) && ((DATE) <= 31))"
	.ascii	"\000"
.LASF3124:
	.ascii	"RTC_Month_March ((uint8_t)0x03)\000"
.LASF2035:
	.ascii	"SYSCFG_EXTICR1_EXTI2_PA ((uint16_t)0x0000)\000"
.LASF651:
	.ascii	"SPI1 ((SPI_TypeDef *) SPI1_BASE)\000"
.LASF4341:
	.ascii	"hex(c) ( (c)<0xa ? (c)+'0' : ((c)-0xa)+'A' )\000"
.LASF3653:
	.ascii	"TIM_DMABurstLength_5Bytes TIM_DMABurstLength_5Trans"
	.ascii	"fers\000"
.LASF4422:
	.ascii	"long long unsigned int\000"
.LASF1456:
	.ascii	"I2C_ICR_ARLOCF ((uint32_t)0x00000200)\000"
.LASF1773:
	.ascii	"RTC_DR_DU_2 ((uint32_t)0x00000004)\000"
.LASF3118:
	.ascii	"RTC_H12_AM ((uint8_t)0x00)\000"
.LASF918:
	.ascii	"DMA_IFCR_CHTIF4 ((uint32_t)0x00004000)\000"
.LASF2094:
	.ascii	"SYSCFG_CFGR2_LOCKUP_LOCK ((uint32_t)0x00000001)\000"
.LASF637:
	.ascii	"IWDG ((IWDG_TypeDef *) IWDG_BASE)\000"
.LASF199:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF3242:
	.ascii	"RTC_BKP_DR4 ((uint32_t)0x00000004)\000"
.LASF3338:
	.ascii	"I2S_AudioFreq_96k ((uint32_t)96000)\000"
.LASF2309:
	.ascii	"USART_CR1_UE ((uint32_t)0x00000001)\000"
.LASF3432:
	.ascii	"TIM_CKD_DIV2 ((uint16_t)0x0100)\000"
.LASF381:
	.ascii	"UINT64_MAX 18446744073709551615ULL\000"
.LASF314:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 1\000"
.LASF2133:
	.ascii	"TIM_SMCR_TS_2 ((uint16_t)0x0040)\000"
.LASF736:
	.ascii	"ADC_CHSELR_CHSEL10 ((uint32_t)0x00000400)\000"
.LASF982:
	.ascii	"EXTI_EMR_MR13 ((uint32_t)0x00002000)\000"
.LASF2867:
	.ascii	"IS_GPIO_MODE(MODE) (((MODE) == GPIO_Mode_IN)|| ((MO"
	.ascii	"DE) == GPIO_Mode_OUT) || ((MODE) == GPIO_Mode_AF)||"
	.ascii	" ((MODE) == GPIO_Mode_AN))\000"
.LASF3230:
	.ascii	"IS_RTC_TAMPER(TAMPER) ((((TAMPER) & (uint32_t)0xFFF"
	.ascii	"FFFD6) == 0x00) && ((TAMPER) != (uint32_t)RESET))\000"
.LASF3578:
	.ascii	"TIM_PSCReloadMode_Immediate ((uint16_t)0x0001)\000"
.LASF1175:
	.ascii	"GPIO_OTYPER_OT_13 ((uint32_t)0x00002000)\000"
.LASF2455:
	.ascii	"__STM32F0XX_ADC_H \000"
.LASF3526:
	.ascii	"TIM_DMABase_DCR ((uint16_t)0x0012)\000"
.LASF884:
	.ascii	"DMA_ISR_GIF1 ((uint32_t)0x00000001)\000"
.LASF1140:
	.ascii	"GPIO_MODER_MODER8_1 ((uint32_t)0x00020000)\000"
.LASF2515:
	.ascii	"ADC_Channel_0 ADC_CHSELR_CHSEL0\000"
.LASF598:
	.ascii	"I2C1_BASE (APBPERIPH_BASE + 0x00005400)\000"
.LASF2704:
	.ascii	"DMA_DIR_PeripheralDST DMA_CCR_DIR\000"
.LASF4320:
	.ascii	"CARIBOUSTDARG_H_ \000"
.LASF2893:
	.ascii	"GPIO_PinSource2 ((uint8_t)0x02)\000"
.LASF408:
	.ascii	"UINT_FAST64_MAX UINT64_MAX\000"
.LASF626:
	.ascii	"GPIOA_BASE (AHB2PERIPH_BASE + 0x00000000)\000"
.LASF1865:
	.ascii	"RTC_TSTR_MNU ((uint32_t)0x00000F00)\000"
.LASF2670:
	.ascii	"DAC_OutputBuffer_Disable DAC_CR_BOFF1\000"
.LASF3753:
	.ascii	"USART_FLAG_CTS USART_ISR_CTSIF\000"
.LASF3246:
	.ascii	"IS_RTC_FORMAT(FORMAT) (((FORMAT) == RTC_Format_BIN)"
	.ascii	" || ((FORMAT) == RTC_Format_BCD))\000"
.LASF2011:
	.ascii	"SYSCFG_CFGR1_MEM_MODE ((uint32_t)0x00000003)\000"
.LASF3535:
	.ascii	"TIM_DMABurstLength_7Transfers ((uint16_t)0x0600)\000"
.LASF1853:
	.ascii	"RTC_TSTR_HT ((uint32_t)0x00300000)\000"
.LASF3323:
	.ascii	"I2S_Standard_Phillips ((uint16_t)0x0000)\000"
.LASF4033:
	.ascii	"CARIBOU_PORTA_OTYPER PIN_OTYPER(0,GPIO_OType_PP) | "
	.ascii	"PIN_OTYPER(1,GPIO_OType_PP) | PIN_OTYPER(2,GPIO_OTy"
	.ascii	"pe_PP) | PIN_OTYPER(3,GPIO_OType_PP) | PIN_OTYPER(4"
	.ascii	",GPIO_OType_PP) | PIN_OTYPER(5,GPIO_OType_PP) | PIN"
	.ascii	"_OTYPER(6,GPIO_OType_PP) | PIN_OTYPER(7,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(8,GPIO_OType_PP) | PIN_OTYPER(9,GP"
	.ascii	"IO_OType_PP) | PIN_OTYPER(10,GPIO_OType_PP) | PIN_O"
	.ascii	"TYPER(11,GPIO_OType_PP) | PIN_OTYPER(12,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(13,GPIO_OType_PP) | PIN_OTYPER(14,"
	.ascii	"GPIO_OType_PP) | PIN_OTYPER(15,GPIO_OType_PP)\000"
.LASF3895:
	.ascii	"RCC_RTCCLKSource_LSE RCC_BDCR_RTCSEL_LSE\000"
.LASF541:
	.ascii	"SCB_SCR_SEVONPEND_Msk (1UL << SCB_SCR_SEVONPEND_Pos"
	.ascii	")\000"
.LASF540:
	.ascii	"SCB_SCR_SEVONPEND_Pos 4\000"
.LASF561:
	.ascii	"SysTick_LOAD_RELOAD_Msk (0xFFFFFFUL << SysTick_LOAD"
	.ascii	"_RELOAD_Pos)\000"
.LASF3092:
	.ascii	"IS_PWR_WAKEUP_PIN(PIN) (((PIN) == PWR_WakeUpPin_1) "
	.ascii	"|| ((PIN) == PWR_WakeUpPin_2))\000"
.LASF1296:
	.ascii	"GPIO_ODR_6 ((uint32_t)0x00000040)\000"
.LASF346:
	.ascii	"__ELF__ 1\000"
.LASF1342:
	.ascii	"GPIO_LCKR_LCK4 ((uint32_t)0x00000010)\000"
.LASF2930:
	.ascii	"EXTI_PinSource3 ((uint8_t)0x03)\000"
.LASF1956:
	.ascii	"SPI_CR1_CRCEN ((uint16_t)0x2000)\000"
.LASF1951:
	.ascii	"SPI_CR1_SSI ((uint16_t)0x0100)\000"
.LASF117:
	.ascii	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL\000"
.LASF3044:
	.ascii	"I2C_IT_TCR I2C_ISR_TCR\000"
.LASF3958:
	.ascii	"RCC_FLAG_IWDGRST ((uint8_t)0x5D)\000"
.LASF894:
	.ascii	"DMA_ISR_HTIF3 ((uint32_t)0x00000400)\000"
.LASF746:
	.ascii	"ADC_CHSELR_CHSEL0 ((uint32_t)0x00000001)\000"
.LASF968:
	.ascii	"EXTI_IMR_MR27 ((uint32_t)0x08000000)\000"
.LASF822:
	.ascii	"COMP_CSR_COMP2OUTSEL_2 ((uint32_t)0x04000000)\000"
.LASF1920:
	.ascii	"RTC_TAFCR_TAMPFREQ_0 ((uint32_t)0x00000100)\000"
.LASF3098:
	.ascii	"IS_PWR_SLEEP_ENTRY(ENTRY) (((ENTRY) == PWR_SLEEPEnt"
	.ascii	"ry_WFI) || ((ENTRY) == PWR_SLEEPEntry_WFE))\000"
.LASF789:
	.ascii	"CEC_IER_TXERRIE ((uint32_t)0x00000800)\000"
.LASF2549:
	.ascii	"ADC_FLAG_EOC ADC_ISR_EOC\000"
.LASF2756:
	.ascii	"IS_DMA_GET_IT(IT) (((IT) == DMA1_IT_GL1) || ((IT) ="
	.ascii	"= DMA1_IT_TC1) || ((IT) == DMA1_IT_HT1) || ((IT) =="
	.ascii	" DMA1_IT_TE1) || ((IT) == DMA1_IT_GL2) || ((IT) == "
	.ascii	"DMA1_IT_TC2) || ((IT) == DMA1_IT_HT2) || ((IT) == D"
	.ascii	"MA1_IT_TE2) || ((IT) == DMA1_IT_GL3) || ((IT) == DM"
	.ascii	"A1_IT_TC3) || ((IT) == DMA1_IT_HT3) || ((IT) == DMA"
	.ascii	"1_IT_TE3) || ((IT) == DMA1_IT_GL4) || ((IT) == DMA1"
	.ascii	"_IT_TC4) || ((IT) == DMA1_IT_HT4) || ((IT) == DMA1_"
	.ascii	"IT_TE4) || ((IT) == DMA1_IT_GL5) || ((IT) == DMA1_I"
	.ascii	"T_TC5) || ((IT) == DMA1_IT_HT5) || ((IT) == DMA1_IT"
	.ascii	"_TE5))\000"
.LASF2201:
	.ascii	"TIM_CCMR1_IC1PSC_0 ((uint16_t)0x0004)\000"
.LASF2791:
	.ascii	"EXTI_Line8 ((uint32_t)0x00000100)\000"
.LASF939:
	.ascii	"DMA_CCR_PL_0 ((uint32_t)0x00001000)\000"
.LASF1224:
	.ascii	"GPIO_OSPEEDER_OSPEEDR15_0 ((uint32_t)0x40000000)\000"
.LASF359:
	.ascii	"__ARM 1\000"
.LASF2846:
	.ascii	"OB_STDBY_RST ((uint8_t)0x00)\000"
.LASF1254:
	.ascii	"GPIO_PUPDR_PUPDR9_0 ((uint32_t)0x00040000)\000"
.LASF462:
	.ascii	"INT_MIN (0x80000000)\000"
.LASF3810:
	.ascii	"RCC_PLLSource_HSI_Div2 RCC_CFGR_PLLSRC_HSI_Div2\000"
.LASF589:
	.ascii	"TIM2_BASE (APBPERIPH_BASE + 0x00000000)\000"
.LASF2380:
	.ascii	"USART_CR3_SCARCNT_2 ((uint32_t)0x00080000)\000"
.LASF4133:
	.ascii	"EBADR 53\000"
.LASF4408:
	.ascii	"_CARIBOU_CEVENT_H_ \000"
.LASF4048:
	.ascii	"CARIBOU_PORTC_AFRL PIN_AFR(0,GPIO_AF_GPIO) | PIN_AF"
	.ascii	"R(1,GPIO_AF_GPIO) | PIN_AFR(2,GPIO_AF_GPIO) | PIN_A"
	.ascii	"FR(3,GPIO_AF_GPIO) | PIN_AFR(4,GPIO_AF_GPIO) | PIN_"
	.ascii	"AFR(5,GPIO_AF_GPIO) | PIN_AFR(6,GPIO_AF_GPIO) | PIN"
	.ascii	"_AFR(7,GPIO_AF_GPIO)\000"
.LASF4047:
	.ascii	"CARIBOU_PORTC_PUPDR PIN_PUPDR(0,GPIO_PuPd_NOPULL) |"
	.ascii	" PIN_PUPDR(1,GPIO_PuPd_NOPULL) | PIN_PUPDR(2,GPIO_P"
	.ascii	"uPd_NOPULL) | PIN_PUPDR(3,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(4,GPIO_PuPd_NOPULL) | PIN_PUPDR(5,GPIO_PuPd_NO"
	.ascii	"PULL) | PIN_PUPDR(6,GPIO_PuPd_NOPULL) | PIN_PUPDR(7"
	.ascii	",GPIO_PuPd_NOPULL) | PIN_PUPDR(8,GPIO_PuPd_NOPULL) "
	.ascii	"| PIN_PUPDR(9,GPIO_PuPd_NOPULL) | PIN_PUPDR(10,GPIO"
	.ascii	"_PuPd_NOPULL) | PIN_PUPDR(11,GPIO_PuPd_NOPULL) | PI"
	.ascii	"N_PUPDR(12,GPIO_PuPd_NOPULL) | PIN_PUPDR(13,GPIO_Pu"
	.ascii	"Pd_NOPULL) | PIN_PUPDR(14,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(15,GPIO_PuPd_NOPULL)\000"
.LASF4347:
	.ascii	"CARIBOU_ADC_INIT(port,channel) {port,channel}\000"
.LASF2984:
	.ascii	"I2C_Direction_Receiver ((uint16_t)0x0400)\000"
.LASF3288:
	.ascii	"SPI_DataSize_12b ((uint16_t)0x0B00)\000"
.LASF1540:
	.ascii	"RCC_CFGR_PPRE_DIV4 ((uint32_t)0x00000500)\000"
.LASF38:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF147:
	.ascii	"__DBL_MAX_EXP__ 128\000"
.LASF2285:
	.ascii	"TIM_BDTR_LOCK_0 ((uint16_t)0x0100)\000"
.LASF2145:
	.ascii	"TIM_DIER_UIE ((uint16_t)0x0001)\000"
.LASF4120:
	.ascii	"ELOOP 40\000"
.LASF652:
	.ascii	"USART1 ((USART_TypeDef *) USART1_BASE)\000"
.LASF2466:
	.ascii	"ADC_ExternalTrigConvEdge_Rising ADC_CFGR1_EXTEN_0\000"
.LASF1023:
	.ascii	"EXTI_FTSR_TR11 ((uint32_t)0x00000800)\000"
.LASF1874:
	.ascii	"RTC_TSTR_SU ((uint32_t)0x0000000F)\000"
.LASF624:
	.ascii	"CRC_BASE (AHBPERIPH_BASE + 0x00003000)\000"
.LASF3348:
	.ascii	"I2S_CPOL_Low ((uint16_t)0x0000)\000"
.LASF2943:
	.ascii	"IS_EXTI_PIN_SOURCE(PINSOURCE) (((PINSOURCE) == EXTI"
	.ascii	"_PinSource0) || ((PINSOURCE) == EXTI_PinSource1) ||"
	.ascii	" ((PINSOURCE) == EXTI_PinSource2) || ((PINSOURCE) ="
	.ascii	"= EXTI_PinSource3) || ((PINSOURCE) == EXTI_PinSourc"
	.ascii	"e4) || ((PINSOURCE) == EXTI_PinSource5) || ((PINSOU"
	.ascii	"RCE) == EXTI_PinSource6) || ((PINSOURCE) == EXTI_Pi"
	.ascii	"nSource7) || ((PINSOURCE) == EXTI_PinSource8) || (("
	.ascii	"PINSOURCE) == EXTI_PinSource9) || ((PINSOURCE) == E"
	.ascii	"XTI_PinSource10) || ((PINSOURCE) == EXTI_PinSource1"
	.ascii	"1) || ((PINSOURCE) == EXTI_PinSource12) || ((PINSOU"
	.ascii	"RCE) == EXTI_PinSource13) || ((PINSOURCE) == EXTI_P"
	.ascii	"inSource14) || ((PINSOURCE) == EXTI_PinSource15))\000"
.LASF1200:
	.ascii	"GPIO_OSPEEDER_OSPEEDR7_0 ((uint32_t)0x00004000)\000"
.LASF1341:
	.ascii	"GPIO_LCKR_LCK3 ((uint32_t)0x00000008)\000"
.LASF1004:
	.ascii	"EXTI_RTSR_TR11 ((uint32_t)0x00000800)\000"
.LASF2792:
	.ascii	"EXTI_Line9 ((uint32_t)0x00000200)\000"
.LASF3053:
	.ascii	"I2C_Reload_Mode I2C_CR2_RELOAD\000"
.LASF2089:
	.ascii	"SYSCFG_EXTICR4_EXTI14_PB ((uint16_t)0x0100)\000"
.LASF1226:
	.ascii	"GPIO_PUPDR_PUPDR0 ((uint32_t)0x00000003)\000"
.LASF800:
	.ascii	"COMP_CSR_COMP1OUTSEL ((uint32_t)0x00000700)\000"
.LASF1599:
	.ascii	"RCC_CIR_HSIRDYC ((uint32_t)0x00040000)\000"
.LASF4142:
	.ascii	"ETIME 62\000"
.LASF1196:
	.ascii	"GPIO_OSPEEDER_OSPEEDR6 ((uint32_t)0x00003000)\000"
.LASF513:
	.ascii	"SCB_ICSR_NMIPENDSET_Msk (1UL << SCB_ICSR_NMIPENDSET"
	.ascii	"_Pos)\000"
.LASF578:
	.ascii	"_BIT_SHIFT(IRQn) ( (((uint32_t)(IRQn) ) & 0x03) * 8"
	.ascii	" )\000"
.LASF3191:
	.ascii	"RTC_SmoothCalibPeriod_8sec ((uint32_t)0x00004000)\000"
.LASF1204:
	.ascii	"GPIO_OSPEEDER_OSPEEDR8_1 ((uint32_t)0x00020000)\000"
.LASF3478:
	.ascii	"IS_TIM_OSSR_STATE(STATE) (((STATE) == TIM_OSSRState"
	.ascii	"_Enable) || ((STATE) == TIM_OSSRState_Disable))\000"
.LASF2733:
	.ascii	"DMA_IT_TE DMA_CCR_TEIE\000"
.LASF243:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF3750:
	.ascii	"USART_FLAG_EOB USART_ISR_EOBF\000"
.LASF2940:
	.ascii	"EXTI_PinSource13 ((uint8_t)0x0D)\000"
.LASF3485:
	.ascii	"TIM_ICPolarity_Rising ((uint16_t)0x0000)\000"
.LASF405:
	.ascii	"UINT_FAST8_MAX UINT8_MAX\000"
.LASF3859:
	.ascii	"IS_RCC_HCLK(HCLK) (((HCLK) == RCC_SYSCLK_Div1) || ("
	.ascii	"(HCLK) == RCC_SYSCLK_Div2) || ((HCLK) == RCC_SYSCLK"
	.ascii	"_Div4) || ((HCLK) == RCC_SYSCLK_Div8) || ((HCLK) =="
	.ascii	" RCC_SYSCLK_Div16) || ((HCLK) == RCC_SYSCLK_Div64) "
	.ascii	"|| ((HCLK) == RCC_SYSCLK_Div128) || ((HCLK) == RCC_"
	.ascii	"SYSCLK_Div256) || ((HCLK) == RCC_SYSCLK_Div512))\000"
.LASF1849:
	.ascii	"RTC_SSR_SS ((uint32_t)0x0003FFFF)\000"
.LASF1550:
	.ascii	"RCC_CFGR_PLLMULL_1 ((uint32_t)0x00080000)\000"
.LASF1013:
	.ascii	"EXTI_FTSR_TR1 ((uint32_t)0x00000002)\000"
.LASF1205:
	.ascii	"GPIO_OSPEEDER_OSPEEDR9 ((uint32_t)0x000C0000)\000"
.LASF4240:
	.ascii	"caribou_vector_set(vector,state) chip_vector_set(ve"
	.ascii	"ctor,state)\000"
.LASF3439:
	.ascii	"TIM_CounterMode_CenterAligned3 ((uint16_t)0x0060)\000"
.LASF4354:
	.ascii	"CARIBOU_ADC_Channel_6 ((uint8_t)0x06)\000"
.LASF979:
	.ascii	"EXTI_EMR_MR10 ((uint32_t)0x00000400)\000"
.LASF3581:
	.ascii	"TIM_ForcedAction_InActive ((uint16_t)0x0040)\000"
.LASF3006:
	.ascii	"I2C_Register_TIMEOUTR ((uint8_t)0x14)\000"
.LASF4207:
	.ascii	"EKEYEXPIRED 127\000"
.LASF1172:
	.ascii	"GPIO_OTYPER_OT_10 ((uint32_t)0x00000400)\000"
.LASF3738:
	.ascii	"USART_Request_RXFRQ USART_RQR_RXFRQ\000"
.LASF3913:
	.ascii	"RCC_AHBPeriph_DMA1 RCC_AHBENR_DMA1EN\000"
.LASF3678:
	.ascii	"USART_Parity_Even ((uint32_t)USART_CR1_PCE)\000"
.LASF3123:
	.ascii	"RTC_Month_February ((uint8_t)0x02)\000"
.LASF844:
	.ascii	"DAC_CR_DMAEN1 ((uint32_t)0x00001000)\000"
.LASF1680:
	.ascii	"RCC_CSR_WWDGRSTF ((uint32_t)0x40000000)\000"
.LASF566:
	.ascii	"SysTick_CALIB_SKEW_Pos 30\000"
.LASF2212:
	.ascii	"TIM_CCMR1_IC2F_0 ((uint16_t)0x1000)\000"
.LASF2441:
	.ascii	"WWDG_CFR_W ((uint16_t)0x007F)\000"
.LASF236:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF1821:
	.ascii	"RTC_ALRMAR_HT_0 ((uint32_t)0x00100000)\000"
.LASF677:
	.ascii	"ADC_ISR_EOSMP ((uint32_t)0x00000002)\000"
.LASF3806:
	.ascii	"RCC_HSE_OFF ((uint8_t)0x00)\000"
.LASF2874:
	.ascii	"GPIO_Pin_2 ((uint16_t)0x0004)\000"
.LASF3178:
	.ascii	"RTC_TimeStampEdge_Falling ((uint32_t)0x00000008)\000"
.LASF3435:
	.ascii	"TIM_CounterMode_Up ((uint16_t)0x0000)\000"
.LASF1642:
	.ascii	"RCC_APB2ENR_TIM17EN ((uint32_t)0x00040000)\000"
.LASF4110:
	.ascii	"EROFS 30\000"
.LASF2433:
	.ascii	"WWDG_CR_T0 ((uint8_t)0x01)\000"
.LASF4069:
	.ascii	"caribou_tick_t int64_t\000"
.LASF2489:
	.ascii	"ADC_AnalogWatchdog_Channel_4 ((uint32_t)0x10000000)"
	.ascii	"\000"
.LASF1256:
	.ascii	"GPIO_PUPDR_PUPDR10 ((uint32_t)0x00300000)\000"
.LASF1361:
	.ascii	"GPIO_AFRL_AFRL6 ((uint32_t)0x0F000000)\000"
.LASF4434:
	.ascii	"flags\000"
.LASF353:
	.ascii	"STM32F0xx 1\000"
.LASF3116:
	.ascii	"IS_RTC_MINUTES(MINUTES) ((MINUTES) <= 59)\000"
.LASF3613:
	.ascii	"TIM_TRGOSource_OC2Ref ((uint16_t)0x0050)\000"
.LASF2061:
	.ascii	"SYSCFG_EXTICR2_EXTI7_PF ((uint16_t)0x3000)\000"
.LASF898:
	.ascii	"DMA_ISR_HTIF4 ((uint32_t)0x00004000)\000"
.LASF288:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF3387:
	.ascii	"SPI_ReceptionFIFOStatus_Full ((uint16_t)0x0600)\000"
.LASF2995:
	.ascii	"I2C_OA2_Mask04 ((uint8_t)0x04)\000"
.LASF3956:
	.ascii	"RCC_FLAG_PORRST ((uint8_t)0x5B)\000"
.LASF4039:
	.ascii	"CARIBOU_PORTB_OTYPER PIN_OTYPER(0,GPIO_OType_PP) | "
	.ascii	"PIN_OTYPER(1,GPIO_OType_PP) | PIN_OTYPER(2,GPIO_OTy"
	.ascii	"pe_PP) | PIN_OTYPER(3,GPIO_OType_PP) | PIN_OTYPER(4"
	.ascii	",GPIO_OType_PP) | PIN_OTYPER(5,GPIO_OType_PP) | PIN"
	.ascii	"_OTYPER(6,GPIO_OType_PP) | PIN_OTYPER(7,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(8,GPIO_OType_PP) | PIN_OTYPER(9,GP"
	.ascii	"IO_OType_PP) | PIN_OTYPER(10,GPIO_OType_PP) | PIN_O"
	.ascii	"TYPER(11,GPIO_OType_PP) | PIN_OTYPER(12,GPIO_OType_"
	.ascii	"PP) | PIN_OTYPER(13,GPIO_OType_PP) | PIN_OTYPER(14,"
	.ascii	"GPIO_OType_PP) | PIN_OTYPER(15,GPIO_OType_PP)\000"
.LASF2551:
	.ascii	"ADC_FLAG_OVR ADC_ISR_OVR\000"
.LASF379:
	.ascii	"INT64_MIN (-9223372036854775807LL-1)\000"
.LASF2420:
	.ascii	"USART_ICR_NCF ((uint32_t)0x00000004)\000"
.LASF837:
	.ascii	"DAC_CR_EN1 ((uint32_t)0x00000001)\000"
.LASF63:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF3757:
	.ascii	"USART_FLAG_RXNE USART_ISR_RXNE\000"
.LASF1250:
	.ascii	"GPIO_PUPDR_PUPDR8 ((uint32_t)0x00030000)\000"
.LASF1318:
	.ascii	"GPIO_BSRR_BS_12 ((uint32_t)0x00001000)\000"
.LASF1919:
	.ascii	"RTC_TAFCR_TAMPFREQ ((uint32_t)0x00000700)\000"
.LASF2398:
	.ascii	"USART_ISR_NE ((uint32_t)0x00000004)\000"
.LASF1151:
	.ascii	"GPIO_MODER_MODER12_0 ((uint32_t)0x01000000)\000"
.LASF3862:
	.ascii	"RCC_HCLK_Div4 RCC_CFGR_PPRE_DIV4\000"
.LASF3027:
	.ascii	"I2C_FLAG_TC I2C_ISR_TC\000"
.LASF3456:
	.ascii	"TIM_CCxN_Enable ((uint16_t)0x0004)\000"
.LASF1218:
	.ascii	"GPIO_OSPEEDER_OSPEEDR13_0 ((uint32_t)0x04000000)\000"
.LASF1464:
	.ascii	"IWDG_KR_KEY ((uint16_t)0xFFFF)\000"
.LASF2457:
	.ascii	"ADC_JitterOff_PCLKDiv2 ADC_CFGR2_JITOFFDIV2\000"
.LASF2550:
	.ascii	"ADC_FLAG_EOSEQ ADC_ISR_EOSEQ\000"
.LASF225:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF1533:
	.ascii	"RCC_CFGR_HPRE_DIV512 ((uint32_t)0x000000F0)\000"
.LASF1692:
	.ascii	"RCC_CFGR2_PREDIV1_3 ((uint32_t)0x00000008)\000"
.LASF759:
	.ascii	"CEC_CFGR_BRDNOGEN ((uint32_t)0x00000080)\000"
.LASF2465:
	.ascii	"ADC_ExternalTrigConvEdge_None ((uint32_t)0x00000000"
	.ascii	")\000"
.LASF845:
	.ascii	"DAC_CR_DMAUDRIE1 ((uint32_t)0x00002000)\000"
.LASF2543:
	.ascii	"ADC_IT_AWD ADC_IER_AWDIE\000"
.LASF3350:
	.ascii	"IS_I2S_CPOL(CPOL) (((CPOL) == I2S_CPOL_Low) || ((CP"
	.ascii	"OL) == I2S_CPOL_High))\000"
.LASF4006:
	.ascii	"CARIBOU_GPIO_PIN_28 (1<<28)\000"
.LASF3475:
	.ascii	"IS_TIM_OSSI_STATE(STATE) (((STATE) == TIM_OSSIState"
	.ascii	"_Enable) || ((STATE) == TIM_OSSIState_Disable))\000"
.LASF4438:
	.ascii	"_caribou_thread_t\000"
.LASF1313:
	.ascii	"GPIO_BSRR_BS_7 ((uint32_t)0x00000080)\000"
.LASF4478:
	.ascii	"__dso_handle\000"
.LASF2075:
	.ascii	"SYSCFG_EXTICR3_EXTI11_PA ((uint16_t)0x0000)\000"
.LASF564:
	.ascii	"SysTick_CALIB_NOREF_Pos 31\000"
.LASF3228:
	.ascii	"RTC_Tamper_2 RTC_TAFCR_TAMP2E\000"
.LASF1097:
	.ascii	"FLASH_OBR_USER ((uint32_t)0x00003700)\000"
.LASF2645:
	.ascii	"COMP_OutputPol_NonInverted ((uint32_t)0x00000000)\000"
.LASF3710:
	.ascii	"USART_AddressLength_4b ((uint32_t)0x00000000)\000"
.LASF2295:
	.ascii	"TIM_DCR_DBA_1 ((uint16_t)0x0002)\000"
.LASF3421:
	.ascii	"TIM_OPMode_Single ((uint16_t)0x0008)\000"
.LASF2406:
	.ascii	"USART_ISR_CTS ((uint32_t)0x00000400)\000"
.LASF795:
	.ascii	"COMP_CSR_COMP1MODE_1 ((uint32_t)0x00000008)\000"
.LASF3939:
	.ascii	"RCC_MCOSource_NoClock ((uint8_t)0x00)\000"
.LASF764:
	.ascii	"CEC_TXDR_RXD ((uint32_t)0x000000FF)\000"
.LASF583:
	.ascii	"FLASH_BASE ((uint32_t)0x08000000)\000"
.LASF804:
	.ascii	"COMP_CSR_COMP1POL ((uint32_t)0x00000800)\000"
.LASF2771:
	.ascii	"DMA1_FLAG_HT4 DMA_ISR_HTIF4\000"
.LASF115:
	.ascii	"__INT_FAST16_MAX__ 0x7fffffff\000"
.LASF4405:
	.ascii	"_CARIBOU_CBYTEARRAY_H_ \000"
.LASF1188:
	.ascii	"GPIO_OSPEEDER_OSPEEDR3_0 ((uint32_t)0x00000040)\000"
.LASF1868:
	.ascii	"RTC_TSTR_MNU_2 ((uint32_t)0x00000400)\000"
.LASF456:
	.ascii	"true ((bool)1)\000"
.LASF3778:
	.ascii	"USART_IT_NE ((uint32_t)0x00020300)\000"
.LASF896:
	.ascii	"DMA_ISR_GIF4 ((uint32_t)0x00001000)\000"
.LASF272:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF3112:
	.ascii	"IS_RTC_ASYNCH_PREDIV(PREDIV) ((PREDIV) <= 0x7F)\000"
.LASF1282:
	.ascii	"GPIO_IDR_8 ((uint32_t)0x00000100)\000"
.LASF2547:
	.ascii	"ADC_FLAG_ADRDY ADC_ISR_ADRDY\000"
.LASF1108:
	.ascii	"OB_USER_USER ((uint32_t)0x00FF0000)\000"
.LASF1466:
	.ascii	"IWDG_PR_PR_0 ((uint8_t)0x01)\000"
.LASF3275:
	.ascii	"SPI_Direction_1Line_Tx ((uint16_t)0xC000)\000"
.LASF3562:
	.ascii	"TIM_TS_ITR1 ((uint16_t)0x0010)\000"
.LASF2013:
	.ascii	"SYSCFG_CFGR1_MEM_MODE_1 ((uint32_t)0x00000002)\000"
.LASF3805:
	.ascii	"assert_param(expr) ((void)0)\000"
.LASF3894:
	.ascii	"IS_RCC_LSE(LSE) (((LSE) == RCC_LSE_OFF) || ((LSE) ="
	.ascii	"= RCC_LSE_ON) || ((LSE) == RCC_LSE_Bypass))\000"
.LASF2716:
	.ascii	"DMA_MemoryDataSize_Byte ((uint32_t)0x00000000)\000"
.LASF2228:
	.ascii	"TIM_CCMR2_CC4S_1 ((uint16_t)0x0200)\000"
.LASF1265:
	.ascii	"GPIO_PUPDR_PUPDR13 ((uint32_t)0x0C000000)\000"
.LASF3445:
	.ascii	"TIM_OCNPolarity_Low ((uint16_t)0x0008)\000"
.LASF4359:
	.ascii	"CARIBOU_ADC_Channel_11 ((uint8_t)0x0B)\000"
.LASF2797:
	.ascii	"EXTI_Line14 ((uint32_t)0x00004000)\000"
.LASF1114:
	.ascii	"GPIO_MODER_MODER0 ((uint32_t)0x00000003)\000"
.LASF1761:
	.ascii	"RTC_DR_MT ((uint32_t)0x00001000)\000"
.LASF2722:
	.ascii	"IS_DMA_MODE(MODE) (((MODE) == DMA_Mode_Normal) || ("
	.ascii	"(MODE) == DMA_Mode_Circular))\000"
.LASF834:
	.ascii	"CRC_CR_REV_IN_1 ((uint32_t)0x00000040)\000"
.LASF3746:
	.ascii	"USART_FLAG_CM USART_ISR_CMF\000"
.LASF2308:
	.ascii	"TIM14_OR_TI1_RMP_1 ((uint16_t)0x0002)\000"
.LASF1193:
	.ascii	"GPIO_OSPEEDER_OSPEEDR5 ((uint32_t)0x00000C00)\000"
.LASF2244:
	.ascii	"TIM_CCMR2_IC4PSC ((uint16_t)0x0C00)\000"
.LASF2403:
	.ascii	"USART_ISR_TXE ((uint32_t)0x00000080)\000"
.LASF3171:
	.ascii	"RTC_AlarmSubSecondMask_SS14_12 ((uint8_t)0x0C)\000"
.LASF3798:
	.ascii	"NVIC_LP_SLEEPDEEP ((uint8_t)0x04)\000"
.LASF565:
	.ascii	"SysTick_CALIB_NOREF_Msk (1UL << SysTick_CALIB_NOREF"
	.ascii	"_Pos)\000"
.LASF1677:
	.ascii	"RCC_CSR_PORRSTF ((uint32_t)0x08000000)\000"
.LASF3193:
	.ascii	"RTC_SmoothCalibPlusPulses_Set ((uint32_t)0x00008000"
	.ascii	")\000"
.LASF888:
	.ascii	"DMA_ISR_GIF2 ((uint32_t)0x00000010)\000"
.LASF2768:
	.ascii	"DMA1_FLAG_TE3 DMA_ISR_TEIF3\000"
.LASF2404:
	.ascii	"USART_ISR_LBD ((uint32_t)0x00000100)\000"
.LASF2014:
	.ascii	"SYSCFG_CFGR1_ADC_DMA_RMP ((uint32_t)0x00000100)\000"
.LASF909:
	.ascii	"DMA_IFCR_CTCIF2 ((uint32_t)0x00000020)\000"
.LASF4439:
	.ascii	"parent\000"
.LASF676:
	.ascii	"ADC_ISR_EOC ((uint32_t)0x00000004)\000"
.LASF737:
	.ascii	"ADC_CHSELR_CHSEL9 ((uint32_t)0x00000200)\000"
.LASF552:
	.ascii	"SysTick_CTRL_COUNTFLAG_Pos 16\000"
.LASF1703:
	.ascii	"RCC_CFGR2_PREDIV1_DIV11 ((uint32_t)0x0000000A)\000"
.LASF1329:
	.ascii	"GPIO_BSRR_BR_7 ((uint32_t)0x00800000)\000"
.LASF788:
	.ascii	"CEC_IER_TXUDRIE ((uint32_t)0x00000400)\000"
.LASF1798:
	.ascii	"RTC_ISR_TSF ((uint32_t)0x00000800)\000"
.LASF1621:
	.ascii	"RCC_APB1RSTR_I2C2RST ((uint32_t)0x00400000)\000"
.LASF4282:
	.ascii	"FP_UDEF 6\000"
.LASF322:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 1\000"
.LASF929:
	.ascii	"DMA_CCR_CIRC ((uint32_t)0x00000020)\000"
.LASF2426:
	.ascii	"USART_ICR_RTOCF ((uint32_t)0x00000800)\000"
.LASF1513:
	.ascii	"RCC_CFGR_SW_PLL ((uint32_t)0x00000002)\000"
.LASF2963:
	.ascii	"SYSCFG_FLAG_PE SYSCFG_CFGR2_SRAM_PE\000"
.LASF1249:
	.ascii	"GPIO_PUPDR_PUPDR7_1 ((uint32_t)0x00008000)\000"
.LASF3090:
	.ascii	"PWR_WakeUpPin_1 PWR_CSR_EWUP1\000"
.LASF4395:
	.ascii	"CARIBOU_UART_STOPBITS_DEFAULT CARIBOU_UART_STOPBITS"
	.ascii	"_1\000"
.LASF2154:
	.ascii	"TIM_DIER_CC1DE ((uint16_t)0x0200)\000"
.LASF2831:
	.ascii	"OB_WRP_Pages52to55 ((uint32_t)0x00002000)\000"
.LASF113:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF1399:
	.ascii	"I2C_CR1_RXDMAEN ((uint32_t)0x00008000)\000"
.LASF72:
	.ascii	"__GXX_ABI_VERSION 1009\000"
.LASF744:
	.ascii	"ADC_CHSELR_CHSEL2 ((uint32_t)0x00000004)\000"
.LASF4263:
	.ascii	"PI_BY_4 0.785398163397448310\000"
.LASF154:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF2928:
	.ascii	"EXTI_PinSource1 ((uint8_t)0x01)\000"
.LASF1693:
	.ascii	"RCC_CFGR2_PREDIV1_DIV1 ((uint32_t)0x00000000)\000"
.LASF3563:
	.ascii	"TIM_TS_ITR2 ((uint16_t)0x0020)\000"
.LASF124:
	.ascii	"__GCC_IEC_559 0\000"
.LASF68:
	.ascii	"__GXX_WEAK__ 1\000"
.LASF3829:
	.ascii	"RCC_PREDIV1_Div1 RCC_CFGR2_PREDIV1_DIV1\000"
.LASF3212:
	.ascii	"IS_RTC_TAMPER_FILTER(FILTER) (((FILTER) == RTC_Tamp"
	.ascii	"erFilter_Disable) || ((FILTER) == RTC_TamperFilter_"
	.ascii	"2Sample) || ((FILTER) == RTC_TamperFilter_4Sample) "
	.ascii	"|| ((FILTER) == RTC_TamperFilter_8Sample))\000"
.LASF3607:
	.ascii	"IS_TIM_OCCLEAR_STATE(STATE) (((STATE) == TIM_OCClea"
	.ascii	"r_Enable) || ((STATE) == TIM_OCClear_Disable))\000"
.LASF3637:
	.ascii	"IS_TIM_GET_FLAG(FLAG) (((FLAG) == TIM_FLAG_Update) "
	.ascii	"|| ((FLAG) == TIM_FLAG_CC1) || ((FLAG) == TIM_FLAG_"
	.ascii	"CC2) || ((FLAG) == TIM_FLAG_CC3) || ((FLAG) == TIM_"
	.ascii	"FLAG_CC4) || ((FLAG) == TIM_FLAG_COM) || ((FLAG) =="
	.ascii	" TIM_FLAG_Trigger) || ((FLAG) == TIM_FLAG_Break) ||"
	.ascii	" ((FLAG) == TIM_FLAG_CC1OF) || ((FLAG) == TIM_FLAG_"
	.ascii	"CC2OF) || ((FLAG) == TIM_FLAG_CC3OF) || ((FLAG) == "
	.ascii	"TIM_FLAG_CC4OF))\000"
.LASF2556:
	.ascii	"ADC_FLAG_ADSTP ((uint32_t)0x01000008)\000"
.LASF3333:
	.ascii	"IS_I2S_DATA_FORMAT(FORMAT) (((FORMAT) == I2S_DataFo"
	.ascii	"rmat_16b) || ((FORMAT) == I2S_DataFormat_16bextende"
	.ascii	"d) || ((FORMAT) == I2S_DataFormat_24b) || ((FORMAT)"
	.ascii	" == I2S_DataFormat_32b))\000"
.LASF4333:
	.ascii	"stdin _stdin\000"
.LASF4351:
	.ascii	"CARIBOU_ADC_Channel_3 ((uint8_t)0x03)\000"
.LASF1731:
	.ascii	"RTC_TR_MNT_1 ((uint32_t)0x00002000)\000"
.LASF1750:
	.ascii	"RTC_DR_YT_2 ((uint32_t)0x00400000)\000"
.LASF722:
	.ascii	"ADC_SMPR1_SMPR ((uint32_t)0x00000007)\000"
.LASF3918:
	.ascii	"RCC_APB2Periph_TIM1 RCC_APB2ENR_TIM1EN\000"
.LASF1864:
	.ascii	"RTC_TSTR_MNT_2 ((uint32_t)0x00004000)\000"
.LASF962:
	.ascii	"EXTI_IMR_MR17 ((uint32_t)0x00020000)\000"
.LASF1970:
	.ascii	"SPI_CR2_DS_2 ((uint16_t)0x0400)\000"
.LASF2253:
	.ascii	"TIM_CCER_CC1P ((uint16_t)0x0002)\000"
.LASF1833:
	.ascii	"RTC_ALRMAR_MNU ((uint32_t)0x00000F00)\000"
.LASF1288:
	.ascii	"GPIO_IDR_14 ((uint32_t)0x00004000)\000"
.LASF2382:
	.ascii	"USART_CR3_WUS_0 ((uint32_t)0x00100000)\000"
.LASF1138:
	.ascii	"GPIO_MODER_MODER8 ((uint32_t)0x00030000)\000"
.LASF4129:
	.ascii	"EUNATCH 49\000"
.LASF329:
	.ascii	"__ARM_SIZEOF_MINIMAL_ENUM 1\000"
.LASF2293:
	.ascii	"TIM_DCR_DBA ((uint16_t)0x001F)\000"
.LASF4319:
	.ascii	"CARIBOUSPINLOCK_H \000"
.LASF1343:
	.ascii	"GPIO_LCKR_LCK5 ((uint32_t)0x00000020)\000"
.LASF1038:
	.ascii	"EXTI_SWIER_SWIER7 ((uint32_t)0x00000080)\000"
.LASF3540:
	.ascii	"TIM_DMABurstLength_12Transfers ((uint16_t)0x0B00)\000"
.LASF975:
	.ascii	"EXTI_EMR_MR6 ((uint32_t)0x00000040)\000"
.LASF1221:
	.ascii	"GPIO_OSPEEDER_OSPEEDR14_0 ((uint32_t)0x10000000)\000"
.LASF1121:
	.ascii	"GPIO_MODER_MODER2_0 ((uint32_t)0x00000010)\000"
.LASF457:
	.ascii	"false ((bool)0)\000"
.LASF4449:
	.ascii	"finishfn\000"
.LASF4267:
	.ascii	"HUGE 0.170141183460469230E+39\000"
.LASF2397:
	.ascii	"USART_ISR_FE ((uint32_t)0x00000002)\000"
.LASF938:
	.ascii	"DMA_CCR_PL ((uint32_t)0x00003000)\000"
.LASF2047:
	.ascii	"SYSCFG_EXTICR2_EXTI4_PB ((uint16_t)0x0001)\000"
.LASF3355:
	.ascii	"SPI_I2S_DMAReq_Rx SPI_CR2_RXDMAEN\000"
.LASF630:
	.ascii	"GPIOF_BASE (AHB2PERIPH_BASE + 0x00001400)\000"
.LASF3289:
	.ascii	"SPI_DataSize_13b ((uint16_t)0x0C00)\000"
.LASF3361:
	.ascii	"IS_SPI_LAST_DMA_TRANSFER(TRANSFER) (((TRANSFER) == "
	.ascii	"SPI_LastDMATransfer_TxEvenRxEven) || ((TRANSFER) =="
	.ascii	" SPI_LastDMATransfer_TxOddRxEven) || ((TRANSFER) =="
	.ascii	" SPI_LastDMATransfer_TxEvenRxOdd) || ((TRANSFER) =="
	.ascii	" SPI_LastDMATransfer_TxOddRxOdd))\000"
.LASF2396:
	.ascii	"USART_ISR_PE ((uint32_t)0x00000001)\000"
.LASF2164:
	.ascii	"TIM_SR_CC4IF ((uint16_t)0x0010)\000"
.LASF879:
	.ascii	"DBGMCU_APB1_FZ_DBG_I2C1_SMBUS_TIMEOUT ((uint32_t)0x"
	.ascii	"00200000)\000"
.LASF2166:
	.ascii	"TIM_SR_TIF ((uint16_t)0x0040)\000"
.LASF3052:
	.ascii	"IS_I2C_GET_IT(IT) (((IT) == I2C_IT_TXIS) || ((IT) ="
	.ascii	"= I2C_IT_RXNE) || ((IT) == I2C_IT_ADDR) || ((IT) =="
	.ascii	" I2C_IT_NACKF) || ((IT) == I2C_IT_STOPF) || ((IT) ="
	.ascii	"= I2C_IT_TC) || ((IT) == I2C_IT_TCR) || ((IT) == I2"
	.ascii	"C_IT_BERR) || ((IT) == I2C_IT_ARLO) || ((IT) == I2C"
	.ascii	"_IT_OVR) || ((IT) == I2C_IT_PECERR) || ((IT) == I2C"
	.ascii	"_IT_TIMEOUT) || ((IT) == I2C_IT_ALERT))\000"
.LASF245:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF440:
	.ascii	"__CTYPE_SPACE 0x08\000"
.LASF3335:
	.ascii	"I2S_MCLKOutput_Disable ((uint16_t)0x0000)\000"
.LASF3660:
	.ascii	"TIM_DMABurstLength_12Bytes TIM_DMABurstLength_12Tra"
	.ascii	"nsfers\000"
.LASF2817:
	.ascii	"IS_OB_DATA_ADDRESS(ADDRESS) (((ADDRESS) == 0x1FFFF8"
	.ascii	"04) || ((ADDRESS) == 0x1FFFF806))\000"
.LASF2393:
	.ascii	"USART_RQR_MMRQ ((uint16_t)0x0004)\000"
.LASF2978:
	.ascii	"IS_I2C_ACK(ACK) (((ACK) == I2C_Ack_Enable) || ((ACK"
	.ascii	") == I2C_Ack_Disable))\000"
.LASF3977:
	.ascii	"CARIBOU_GPIO_INIT(port,pinmask) {port,pinmask}\000"
.LASF966:
	.ascii	"EXTI_IMR_MR23 ((uint32_t)0x00800000)\000"
.LASF3233:
	.ascii	"IS_RTC_OUTPUT_TYPE(TYPE) (((TYPE) == RTC_OutputType"
	.ascii	"_OpenDrain) || ((TYPE) == RTC_OutputType_PushPull))"
	.ascii	"\000"
.LASF3598:
	.ascii	"IS_TIM_UPDATE_SOURCE(SOURCE) (((SOURCE) == TIM_Upda"
	.ascii	"teSource_Global) || ((SOURCE) == TIM_UpdateSource_R"
	.ascii	"egular))\000"
.LASF812:
	.ascii	"COMP_CSR_COMP2MODE_0 ((uint32_t)0x00040000)\000"
.LASF3451:
	.ascii	"TIM_OutputNState_Enable ((uint16_t)0x0004)\000"
.LASF2413:
	.ascii	"USART_ISR_SBKF ((uint32_t)0x00040000)\000"
.LASF3265:
	.ascii	"RTC_IT_TAMP3 ((uint32_t)0x00080000)\000"
.LASF3695:
	.ascii	"USART_CPHA_1Edge ((uint32_t)0x00000000)\000"
.LASF3302:
	.ascii	"IS_SPI_CPHA(CPHA) (((CPHA) == SPI_CPHA_1Edge) || (("
	.ascii	"CPHA) == SPI_CPHA_2Edge))\000"
.LASF4488:
	.ascii	"_ZN7CARIBOU18CCaribouMainThread3runEv\000"
.LASF4382:
	.ascii	"chip_i2c_port_t I2C_TypeDef*\000"
.LASF2966:
	.ascii	"IS_I2C_ALL_PERIPH(PERIPH) (((PERIPH) == I2C1) || (("
	.ascii	"PERIPH) == I2C2))\000"
.LASF4100:
	.ascii	"ENOTDIR 20\000"
.LASF872:
	.ascii	"DBGMCU_APB1_FZ_DBG_TIM2_STOP ((uint32_t)0x00000001)"
	.ascii	"\000"
.LASF284:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF946:
	.ascii	"EXTI_IMR_MR1 ((uint32_t)0x00000002)\000"
.LASF2629:
	.ascii	"COMP_InvertingInput_1_4VREFINT ((uint32_t)0x0000000"
	.ascii	"0)\000"
.LASF2507:
	.ascii	"ADC_SampleTime_13_5Cycles ((uint32_t)0x00000002)\000"
.LASF2892:
	.ascii	"GPIO_PinSource1 ((uint8_t)0x01)\000"
.LASF191:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF1897:
	.ascii	"RTC_TSSSR_SS ((uint32_t)0x0003FFFF)\000"
.LASF4300:
	.ascii	"FP_NSTR 2\000"
.LASF1984:
	.ascii	"SPI_SR_FRLVL ((uint16_t)0x0600)\000"
.LASF2074:
	.ascii	"SYSCFG_EXTICR3_EXTI10_PC ((uint16_t)0x0200)\000"
.LASF4473:
	.ascii	"priority\000"
.LASF3023:
	.ascii	"I2C_FLAG_RXNE I2C_ISR_RXNE\000"
.LASF265:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF1214:
	.ascii	"GPIO_OSPEEDER_OSPEEDR12 ((uint32_t)0x03000000)\000"
.LASF3327:
	.ascii	"I2S_Standard_PCMLong ((uint16_t)0x00B0)\000"
.LASF2564:
	.ascii	"CEC_SignalFreeTime_3T ((uint32_t)0x00000003)\000"
.LASF1488:
	.ascii	"PWR_CR_PLS_LEV5 ((uint16_t)0x00A0)\000"
.LASF415:
	.ascii	"INT8_C(x) (x)\000"
.LASF2865:
	.ascii	"IS_GPIO_ALL_PERIPH(PERIPH) (((PERIPH) == GPIOA) || "
	.ascii	"((PERIPH) == GPIOB) || ((PERIPH) == GPIOC) || ((PER"
	.ascii	"IPH) == GPIOD) || ((PERIPH) == GPIOF))\000"
.LASF3234:
	.ascii	"RTC_ShiftAdd1S_Reset ((uint32_t)0x00000000)\000"
.LASF304:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF3032:
	.ascii	"I2C_FLAG_PECERR I2C_ISR_PECERR\000"
.LASF4059:
	.ascii	"CARIBOU_PORTF_PUPDR PIN_PUPDR(0,GPIO_PuPd_NOPULL) |"
	.ascii	" PIN_PUPDR(1,GPIO_PuPd_NOPULL) | PIN_PUPDR(2,GPIO_P"
	.ascii	"uPd_NOPULL) | PIN_PUPDR(3,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(4,GPIO_PuPd_NOPULL) | PIN_PUPDR(5,GPIO_PuPd_NO"
	.ascii	"PULL) | PIN_PUPDR(6,GPIO_PuPd_NOPULL) | PIN_PUPDR(7"
	.ascii	",GPIO_PuPd_NOPULL) | PIN_PUPDR(8,GPIO_PuPd_NOPULL) "
	.ascii	"| PIN_PUPDR(9,GPIO_PuPd_NOPULL) | PIN_PUPDR(10,GPIO"
	.ascii	"_PuPd_NOPULL) | PIN_PUPDR(11,GPIO_PuPd_NOPULL) | PI"
	.ascii	"N_PUPDR(12,GPIO_PuPd_NOPULL) | PIN_PUPDR(13,GPIO_Pu"
	.ascii	"Pd_NOPULL) | PIN_PUPDR(14,GPIO_PuPd_NOPULL) | PIN_P"
	.ascii	"UPDR(15,GPIO_PuPd_NOPULL)\000"
.LASF1631:
	.ascii	"RCC_AHBENR_GPIOCEN ((uint32_t)0x00080000)\000"
.LASF4437:
	.ascii	"_caribou_timer_t\000"
.LASF2207:
	.ascii	"TIM_CCMR1_IC1F_3 ((uint16_t)0x0080)\000"
.LASF631:
	.ascii	"TIM2 ((TIM_TypeDef *) TIM2_BASE)\000"
.LASF2040:
	.ascii	"SYSCFG_EXTICR1_EXTI3_PB ((uint16_t)0x1000)\000"
.LASF1932:
	.ascii	"RTC_ALRMASSR_MASKSS_0 ((uint32_t)0x01000000)\000"
.LASF4362:
	.ascii	"CARIBOU_ADC_Channel_14 ((uint8_t)0x0E)\000"
.LASF2099:
	.ascii	"TIM_CR1_UDIS ((uint16_t)0x0002)\000"
.LASF4209:
	.ascii	"EKEYREJECTED 129\000"
.LASF4228:
	.ascii	"THREAD_FAULT_HEAP_CORRUPT 0x0010\000"
.LASF3721:
	.ascii	"USART_IrDAMode_Normal ((uint32_t)0x00000000)\000"
.LASF2695:
	.ascii	"IS_DBGMCU_APB1PERIPH(PERIPH) ((((PERIPH) & 0xFFDFE2"
	.ascii	"EC) == 0x00) && ((PERIPH) != 0x00))\000"
.LASF2661:
	.ascii	"DAC_Trigger_None ((uint32_t)0x00000000)\000"
.LASF51:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF1135:
	.ascii	"GPIO_MODER_MODER7 ((uint32_t)0x0000C000)\000"
.LASF2702:
	.ascii	"IS_DMA_ALL_PERIPH(PERIPH) (((PERIPH) == DMA1_Channe"
	.ascii	"l1) || ((PERIPH) == DMA1_Channel2) || ((PERIPH) == "
	.ascii	"DMA1_Channel3) || ((PERIPH) == DMA1_Channel4) || (("
	.ascii	"PERIPH) == DMA1_Channel5))\000"
.LASF919:
	.ascii	"DMA_IFCR_CTEIF4 ((uint32_t)0x00008000)\000"
.LASF252:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF1838:
	.ascii	"RTC_ALRMAR_MSK1 ((uint32_t)0x00000080)\000"
.LASF693:
	.ascii	"ADC_CFGR1_AWDCH_0 ((uint32_t)0x04000000)\000"
.LASF1115:
	.ascii	"GPIO_MODER_MODER0_0 ((uint32_t)0x00000001)\000"
.LASF1195:
	.ascii	"GPIO_OSPEEDER_OSPEEDR5_1 ((uint32_t)0x00000800)\000"
.LASF2781:
	.ascii	"IS_EXTI_MODE(MODE) (((MODE) == EXTI_Mode_Interrupt)"
	.ascii	" || ((MODE) == EXTI_Mode_Event))\000"
.LASF4467:
	.ascii	"_Znaj\000"
.LASF4218:
	.ascii	"CARIBOU_THREAD_NORMALPRIO 1\000"
.LASF1712:
	.ascii	"RCC_CFGR3_I2C1SW ((uint32_t)0x00000010)\000"
.LASF1225:
	.ascii	"GPIO_OSPEEDER_OSPEEDR15_1 ((uint32_t)0x80000000)\000"
.LASF3399:
	.ascii	"IS_SPI_CRC_POLYNOMIAL(POLYNOMIAL) ((POLYNOMIAL) >= "
	.ascii	"0x1)\000"
.LASF3005:
	.ascii	"I2C_Register_TIMINGR ((uint8_t)0x10)\000"
.LASF666:
	.ascii	"CRC ((CRC_TypeDef *) CRC_BASE)\000"
.LASF1671:
	.ascii	"RCC_CSR_LSION ((uint32_t)0x00000001)\000"
.LASF149:
	.ascii	"__DBL_DECIMAL_DIG__ 9\000"
.LASF383:
	.ascii	"INTMAX_MAX 9223372036854775807LL\000"
.LASF2140:
	.ascii	"TIM_SMCR_ETPS ((uint16_t)0x3000)\000"
.LASF4273:
	.ascii	"SIGFIGS 18\000"
.LASF1713:
	.ascii	"RCC_CFGR3_CECSW ((uint32_t)0x00000040)\000"
.LASF4078:
	.ascii	"EINVAL 0x06\000"
.LASF2262:
	.ascii	"TIM_CCER_CC3NE ((uint16_t)0x0400)\000"
.LASF1075:
	.ascii	"FLASH_FKEY2 ((uint32_t)0xCDEF89AB)\000"
.LASF2897:
	.ascii	"GPIO_PinSource6 ((uint8_t)0x06)\000"
.LASF2980:
	.ascii	"I2C_AcknowledgedAddress_10bit I2C_OAR1_OA1MODE\000"
.LASF1521:
	.ascii	"RCC_CFGR_HPRE_0 ((uint32_t)0x00000010)\000"
.LASF2101:
	.ascii	"TIM_CR1_OPM ((uint16_t)0x0008)\000"
.LASF4217:
	.ascii	"CARIBOU_THREAD_LOWPRIO 0\000"
.LASF4352:
	.ascii	"CARIBOU_ADC_Channel_4 ((uint8_t)0x04)\000"
.LASF4208:
	.ascii	"EKEYREVOKED 128\000"
.LASF2387:
	.ascii	"USART_GTPR_PSC ((uint16_t)0x00FF)\000"
.LASF1484:
	.ascii	"PWR_CR_PLS_LEV1 ((uint16_t)0x0020)\000"
.LASF4012:
	.ascii	"caribou_gpio_set_pullup(gpio) chip_gpio_set_pullup("
	.ascii	"(gpio)->port,(gpio)->pinmask)\000"
.LASF3509:
	.ascii	"TIM_DMABase_CR2 ((uint16_t)0x0001)\000"
.LASF365:
	.ascii	"NEW_TAKES_SIZE_T \000"
.LASF2313:
	.ascii	"USART_CR1_IDLEIE ((uint32_t)0x00000010)\000"
.LASF2802:
	.ascii	"EXTI_Line21 ((uint32_t)0x00200000)\000"
.LASF1085:
	.ascii	"FLASH_CR_OPTPG ((uint32_t)0x00000010)\000"
.LASF3082:
	.ascii	"PWR_PVDLevel_1 PWR_CR_PLS_LEV1\000"
.LASF1240:
	.ascii	"GPIO_PUPDR_PUPDR4_1 ((uint32_t)0x00000200)\000"
.LASF953:
	.ascii	"EXTI_IMR_MR8 ((uint32_t)0x00000100)\000"
.LASF4025:
	.ascii	"PIN_OSPEEDR(n,ospeedr) ((ospeedr&0x3)<<(n*2))\000"
.LASF1392:
	.ascii	"I2C_CR1_STOPIE ((uint32_t)0x00000020)\000"
.LASF3887:
	.ascii	"RCC_IT_CSS ((uint8_t)0x80)\000"
.LASF4420:
	.ascii	"long long int\000"
.LASF3917:
	.ascii	"RCC_APB2Periph_ADC1 RCC_APB2ENR_ADC1EN\000"
.LASF3304:
	.ascii	"SPI_NSS_Hard ((uint16_t)0x0000)\000"
.LASF1336:
	.ascii	"GPIO_BSRR_BR_14 ((uint32_t)0x40000000)\000"
.LASF806:
	.ascii	"COMP_CSR_COMP1HYST_0 ((uint32_t)0x00001000)\000"
.LASF2334:
	.ascii	"USART_CR1_DEAT_2 ((uint32_t)0x00800000)\000"
.LASF1015:
	.ascii	"EXTI_FTSR_TR3 ((uint32_t)0x00000008)\000"
.LASF87:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF4098:
	.ascii	"EXDEV 18\000"
.LASF2538:
	.ascii	"ADC_IT_ADRDY ADC_IER_ADRDYIE\000"
.LASF659:
	.ascii	"DMA1_Channel2 ((DMA_Channel_TypeDef *) DMA1_Channel"
	.ascii	"2_BASE)\000"
.LASF1481:
	.ascii	"PWR_CR_PLS_1 ((uint16_t)0x0040)\000"
.LASF4459:
	.ascii	"__cxa_pure_virtual\000"
.LASF1705:
	.ascii	"RCC_CFGR2_PREDIV1_DIV13 ((uint32_t)0x0000000C)\000"
.LASF4086:
	.ascii	"ENXIO 6\000"
.LASF3608:
	.ascii	"TIM_TRGOSource_Reset ((uint16_t)0x0000)\000"
.LASF2494:
	.ascii	"ADC_AnalogWatchdog_Channel_9 ((uint32_t)0x24000000)"
	.ascii	"\000"
.LASF2475:
	.ascii	"IS_ADC_EXTERNAL_TRIG_CONV(CONV) (((CONV) == ADC_Ext"
	.ascii	"ernalTrigConv_T1_TRGO) || ((CONV) == ADC_ExternalTr"
	.ascii	"igConv_T1_CC4) || ((CONV) == ADC_ExternalTrigConv_T"
	.ascii	"2_TRGO) || ((CONV) == ADC_ExternalTrigConv_T3_TRGO)"
	.ascii	" || ((CONV) == ADC_ExternalTrigConv_T15_TRGO))\000"
.LASF324:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 1\000"
.LASF3168:
	.ascii	"RTC_AlarmSubSecondMask_SS14_9 ((uint8_t)0x09)\000"
.LASF1409:
	.ascii	"I2C_CR2_RD_WRN ((uint32_t)0x00000400)\000"
.LASF3828:
	.ascii	"IS_RCC_PLL_MUL(MUL) (((MUL) == RCC_PLLMul_2) || ((M"
	.ascii	"UL) == RCC_PLLMul_3) || ((MUL) == RCC_PLLMul_4) || "
	.ascii	"((MUL) == RCC_PLLMul_5) || ((MUL) == RCC_PLLMul_6) "
	.ascii	"|| ((MUL) == RCC_PLLMul_7) || ((MUL) == RCC_PLLMul_"
	.ascii	"8) || ((MUL) == RCC_PLLMul_9) || ((MUL) == RCC_PLLM"
	.ascii	"ul_10) || ((MUL) == RCC_PLLMul_11) || ((MUL) == RCC"
	.ascii	"_PLLMul_12) || ((MUL) == RCC_PLLMul_13) || ((MUL) ="
	.ascii	"= RCC_PLLMul_14) || ((MUL) == RCC_PLLMul_15) || ((M"
	.ascii	"UL) == RCC_PLLMul_16))\000"
.LASF2329:
	.ascii	"USART_CR1_DEDT_3 ((uint32_t)0x00080000)\000"
.LASF2945:
	.ascii	"SYSCFG_MemoryRemap_SystemMemory ((uint8_t)0x01)\000"
.LASF4310:
	.ascii	"QUEUE_DEPTH_DYNAMIC -1\000"
.LASF1389:
	.ascii	"I2C_CR1_RXIE ((uint32_t)0x00000004)\000"
.LASF536:
	.ascii	"SCB_AIRCR_SYSRESETREQ_Pos 2\000"
.LASF264:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF2240:
	.ascii	"TIM_CCMR2_IC3F_0 ((uint16_t)0x0010)\000"
.LASF1493:
	.ascii	"PWR_CSR_SBF ((uint16_t)0x0002)\000"
.LASF4266:
	.ascii	"TINY 0.293873587705571877E-38\000"
.LASF4172:
	.ascii	"ENOPROTOOPT 92\000"
.LASF4212:
	.ascii	"ERFKILL 132\000"
.LASF4399:
	.ascii	"_CARIBOU_CHIP_UART_STM32F0xx_H_ \000"
.LASF2948:
	.ascii	"SYSCFG_DMARemap_TIM17 SYSCFG_CFGR1_TIM17_DMA_RMP\000"
.LASF532:
	.ascii	"SCB_AIRCR_VECTKEYSTAT_Pos 16\000"
.LASF1695:
	.ascii	"RCC_CFGR2_PREDIV1_DIV3 ((uint32_t)0x00000002)\000"
.LASF3692:
	.ascii	"USART_CPOL_Low ((uint32_t)0x00000000)\000"
.LASF2751:
	.ascii	"DMA1_IT_GL5 DMA_ISR_GIF5\000"
.LASF3857:
	.ascii	"RCC_SYSCLK_Div256 RCC_CFGR_HPRE_DIV256\000"
.LASF1630:
	.ascii	"RCC_AHBENR_GPIOBEN ((uint32_t)0x00040000)\000"
.LASF2597:
	.ascii	"CEC_IT_SBPE CEC_IER_SBPEIE\000"
.LASF10:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF73:
	.ascii	"__SCHAR_MAX__ 0x7f\000"
.LASF163:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF3182:
	.ascii	"IS_RTC_OUTPUT(OUTPUT) (((OUTPUT) == RTC_Output_Disa"
	.ascii	"ble) || ((OUTPUT) == RTC_Output_AlarmA))\000"
.LASF4009:
	.ascii	"CARIBOU_GPIO_PIN_31 (1<<31)\000"
.LASF4198:
	.ascii	"ENOTNAM 118\000"
.LASF4308:
	.ascii	"DECL_CARIBOU_QUEUE(QUEUE,DEPTH) void* QUEUE ## msgs"
	.ascii	"[DEPTH]; caribou_queue_t QUEUE = CARIBOU_QUEUE(DEPT"
	.ascii	"H,QUEUE ## msgs)\000"
.LASF516:
	.ascii	"SCB_ICSR_PENDSVCLR_Pos 27\000"
.LASF3461:
	.ascii	"IS_TIM_BREAK_STATE(STATE) (((STATE) == TIM_Break_En"
	.ascii	"able) || ((STATE) == TIM_Break_Disable))\000"
.LASF455:
	.ascii	"bool char\000"
.LASF1326:
	.ascii	"GPIO_BSRR_BR_4 ((uint32_t)0x00100000)\000"
.LASF2058:
	.ascii	"SYSCFG_EXTICR2_EXTI7_PA ((uint16_t)0x0000)\000"
.LASF4329:
	.ascii	"STDIO_STATE_TX_EMPTY 0x00000002\000"
.LASF1826:
	.ascii	"RTC_ALRMAR_HU_2 ((uint32_t)0x00040000)\000"
.LASF4256:
	.ascii	"RPIBY2 0.636619772367581343\000"
.LASF2251:
	.ascii	"TIM_CCMR2_IC4F_3 ((uint16_t)0x8000)\000"
.LASF724:
	.ascii	"ADC_SMPR1_SMPR_1 ((uint32_t)0x00000002)\000"
.LASF1210:
	.ascii	"GPIO_OSPEEDER_OSPEEDR10_1 ((uint32_t)0x00200000)\000"
.LASF3936:
	.ascii	"RCC_APB1Periph_DAC RCC_APB1ENR_DACEN\000"
.LASF4144:
	.ascii	"ENONET 64\000"
.LASF3103:
	.ascii	"PWR_FLAG_SB PWR_CSR_SBF\000"
.LASF1051:
	.ascii	"EXTI_PR_PR1 ((uint32_t)0x00000002)\000"
.LASF1442:
	.ascii	"I2C_ISR_TCR ((uint32_t)0x00000080)\000"
.LASF1909:
	.ascii	"RTC_CAL_CALM_7 ((uint32_t)0x00000080)\000"
.LASF1430:
	.ascii	"I2C_TIMEOUTR_TIMEOUTA ((uint32_t)0x00000FFF)\000"
.LASF2249:
	.ascii	"TIM_CCMR2_IC4F_1 ((uint16_t)0x2000)\000"
.LASF2848:
	.ascii	"OB_BOOT1_RESET ((uint8_t)0x00)\000"
.LASF4392:
	.ascii	"__CARIBOU_UART_H__ \000"
.LASF2957:
	.ascii	"SYSCFG_I2CFastModePlus_PB9 SYSCFG_CFGR1_I2C_FMP_PB9"
	.ascii	"\000"
.LASF275:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF2714:
	.ascii	"DMA_PeripheralDataSize_Word DMA_CCR_PSIZE_1\000"
.LASF3146:
	.ascii	"RTC_AlarmDateWeekDaySel_Date ((uint32_t)0x00000000)"
	.ascii	"\000"
.LASF1848:
	.ascii	"RTC_WPR_KEY ((uint32_t)0x000000FF)\000"
.LASF2689:
	.ascii	"DBGMCU_TIM6_STOP DBGMCU_APB1_FZ_DBG_TIM6_STOP\000"
.LASF2082:
	.ascii	"SYSCFG_EXTICR4_EXTI12_PA ((uint16_t)0x0000)\000"
.LASF2223:
	.ascii	"TIM_CCMR2_OC3M_1 ((uint16_t)0x0020)\000"
.LASF3428:
	.ascii	"IS_TIM_CHANNEL(CHANNEL) (((CHANNEL) == TIM_Channel_"
	.ascii	"1) || ((CHANNEL) == TIM_Channel_2) || ((CHANNEL) =="
	.ascii	" TIM_Channel_3) || ((CHANNEL) == TIM_Channel_4))\000"
.LASF1064:
	.ascii	"EXTI_PR_PR14 ((uint32_t)0x00004000)\000"
.LASF3641:
	.ascii	"TIM_OCReferenceClear_ETRF ((uint16_t)0x0008)\000"
.LASF3921:
	.ascii	"RCC_APB2Periph_TIM15 RCC_APB2ENR_TIM15EN\000"
.LASF3315:
	.ascii	"SPI_FirstBit_MSB ((uint16_t)0x0000)\000"
.LASF2744:
	.ascii	"DMA1_IT_TC3 DMA_ISR_TCIF3\000"
.LASF1317:
	.ascii	"GPIO_BSRR_BS_11 ((uint32_t)0x00000800)\000"
.LASF2177:
	.ascii	"TIM_EGR_COMG ((uint8_t)0x20)\000"
.LASF956:
	.ascii	"EXTI_IMR_MR11 ((uint32_t)0x00000800)\000"
.LASF3685:
	.ascii	"USART_HardwareFlowControl_RTS ((uint32_t)USART_CR3_"
	.ascii	"RTSE)\000"
.LASF1428:
	.ascii	"I2C_TIMINGR_SCLDEL ((uint32_t)0x00F00000)\000"
.LASF349:
	.ascii	"__CROSSWORKS_ARM 1\000"
.LASF2576:
	.ascii	"CEC_BitRisingError_Off ((uint32_t)0x00000000)\000"
.LASF183:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF3965:
	.ascii	"HZ 1000\000"
.LASF3363:
	.ascii	"SPI_NSSInternalSoft_Reset ((uint16_t)0xFEFF)\000"
.LASF2442:
	.ascii	"WWDG_CFR_W0 ((uint16_t)0x0001)\000"
.LASF4158:
	.ascii	"EREMCHG 78\000"
.LASF1608:
	.ascii	"RCC_APB2RSTR_USART1RST ((uint32_t)0x00004000)\000"
.LASF4312:
	.ascii	"caribou_queue_lock_restore(lvl) caribou_lib_lock_re"
	.ascii	"store(lvl)\000"
.LASF3643:
	.ascii	"TIM_OCREFERENCECECLEAR_SOURCE(SOURCE) (((SOURCE) =="
	.ascii	" TIM_OCReferenceClear_ETRF) || ((SOURCE) == TIM_OCR"
	.ascii	"eferenceClear_OCREFCLR))\000"
.LASF3603:
	.ascii	"TIM_OCFast_Disable ((uint16_t)0x0000)\000"
.LASF2064:
	.ascii	"SYSCFG_EXTICR3_EXTI10 ((uint16_t)0x0F00)\000"
.LASF1213:
	.ascii	"GPIO_OSPEEDER_OSPEEDR11_1 ((uint32_t)0x00800000)\000"
.LASF1888:
	.ascii	"RTC_TSDR_MU_3 ((uint32_t)0x00000800)\000"
.LASF2971:
	.ascii	"IS_I2C_DIGITAL_FILTER(FILTER) ((FILTER) <= 0x000000"
	.ascii	"0F)\000"
.LASF3699:
	.ascii	"USART_LastBit_Enable USART_CR2_LBCL\000"
.LASF3749:
	.ascii	"USART_FLAG_ABRE USART_ISR_ABRE\000"
.LASF4130:
	.ascii	"ENOCSI 50\000"
.LASF4183:
	.ascii	"ECONNABORTED 103\000"
.LASF4475:
	.ascii	"__aeabi_EDOM\000"
.LASF3329:
	.ascii	"I2S_DataFormat_16b ((uint16_t)0x0000)\000"
.LASF670:
	.ascii	"GPIOC ((GPIO_TypeDef *) GPIOC_BASE)\000"
.LASF3457:
	.ascii	"TIM_CCxN_Disable ((uint16_t)0x0000)\000"
.LASF3812:
	.ascii	"IS_RCC_PLL_SOURCE(SOURCE) (((SOURCE) == RCC_PLLSour"
	.ascii	"ce_HSI_Div2) || ((SOURCE) == RCC_PLLSource_PREDIV1)"
	.ascii	")\000"
.LASF2680:
	.ascii	"IS_DAC_IT(IT) (((IT) == DAC_IT_DMAUDR))\000"
.LASF3981:
	.ascii	"CARIBOU_GPIO_PIN_3 (1<<3)\000"
.LASF4258:
	.ascii	"LOGBE2 0.69314718055994530942\000"
.LASF91:
	.ascii	"__INT16_MAX__ 0x7fff\000"
.LASF1823:
	.ascii	"RTC_ALRMAR_HU ((uint32_t)0x000F0000)\000"
.LASF604:
	.ascii	"COMP_BASE (APBPERIPH_BASE + 0x0001001C)\000"
.LASF1365:
	.ascii	"GPIO_AFRH_AFRH2 ((uint32_t)0x00000F00)\000"
.LASF3601:
	.ascii	"IS_TIM_OCPRELOAD_STATE(STATE) (((STATE) == TIM_OCPr"
	.ascii	"eload_Enable) || ((STATE) == TIM_OCPreload_Disable)"
	.ascii	")\000"
.LASF2353:
	.ascii	"USART_CR2_DATAINV ((uint32_t)0x00040000)\000"
.LASF1333:
	.ascii	"GPIO_BSRR_BR_11 ((uint32_t)0x08000000)\000"
.LASF2159:
	.ascii	"TIM_DIER_TDE ((uint16_t)0x4000)\000"
.LASF2508:
	.ascii	"ADC_SampleTime_28_5Cycles ((uint32_t)0x00000003)\000"
.LASF4348:
	.ascii	"CARIBOU_ADC_Channel_0 ((uint8_t)0x00)\000"
.LASF4076:
	.ascii	"EHEAP 0x04\000"
.LASF4462:
	.ascii	"fault\000"
.LASF3352:
	.ascii	"SPI_RxFIFOThreshold_QF SPI_CR2_FRXTH\000"
.LASF2782:
	.ascii	"IS_EXTI_TRIGGER(TRIGGER) (((TRIGGER) == EXTI_Trigge"
	.ascii	"r_Rising) || ((TRIGGER) == EXTI_Trigger_Falling) ||"
	.ascii	" ((TRIGGER) == EXTI_Trigger_Rising_Falling))\000"
.LASF1851:
	.ascii	"RTC_SHIFTR_ADD1S ((uint32_t)0x80000000)\000"
.LASF1529:
	.ascii	"RCC_CFGR_HPRE_DIV16 ((uint32_t)0x000000B0)\000"
.LASF4396:
	.ascii	"CARIBOU_UART_PARITY_DEFAULT CARIBOU_UART_PARITY_NON"
	.ascii	"E\000"
.LASF3109:
	.ascii	"RTC_HourFormat_24 ((uint32_t)0x00000000)\000"
.LASF1842:
	.ascii	"RTC_ALRMAR_ST_2 ((uint32_t)0x00000040)\000"
.LASF920:
	.ascii	"DMA_IFCR_CGIF5 ((uint32_t)0x00010000)\000"
.LASF3831:
	.ascii	"RCC_PREDIV1_Div3 RCC_CFGR2_PREDIV1_DIV3\000"
.LASF3360:
	.ascii	"SPI_LastDMATransfer_TxOddRxOdd ((uint16_t)0x6000)\000"
.LASF1169:
	.ascii	"GPIO_OTYPER_OT_7 ((uint32_t)0x00000080)\000"
.LASF555:
	.ascii	"SysTick_CTRL_CLKSOURCE_Msk (1UL << SysTick_CTRL_CLK"
	.ascii	"SOURCE_Pos)\000"
.LASF1243:
	.ascii	"GPIO_PUPDR_PUPDR5_1 ((uint32_t)0x00000800)\000"
.LASF994:
	.ascii	"EXTI_RTSR_TR1 ((uint32_t)0x00000002)\000"
.LASF2279:
	.ascii	"TIM_BDTR_DTG_3 ((uint16_t)0x0008)\000"
.LASF1791:
	.ascii	"RTC_CR_REFCKON ((uint32_t)0x00000010)\000"
.LASF3999:
	.ascii	"CARIBOU_GPIO_PIN_21 (1<<21)\000"
.LASF4170:
	.ascii	"EMSGSIZE 90\000"
.LASF903:
	.ascii	"DMA_ISR_TEIF5 ((uint32_t)0x00080000)\000"
.LASF3295:
	.ascii	"SPI_CRCLength_16b SPI_CR1_CRCL\000"
.LASF4193:
	.ascii	"EHOSTUNREACH 113\000"
.LASF868:
	.ascii	"DBGMCU_IDCODE_REV_ID_14 ((uint32_t)0x40000000)\000"
.LASF2230:
	.ascii	"TIM_CCMR2_OC4PE ((uint16_t)0x0800)\000"
.LASF1122:
	.ascii	"GPIO_MODER_MODER2_1 ((uint32_t)0x00000020)\000"
.LASF2242:
	.ascii	"TIM_CCMR2_IC3F_2 ((uint16_t)0x0040)\000"
.LASF2959:
	.ascii	"SYSCFG_Break_PVD SYSCFG_CFGR2_PVD_LOCK\000"
.LASF3380:
	.ascii	"SPI_TransmissionFIFOStatus_Empty ((uint16_t)0x0000)"
	.ascii	"\000"
.LASF4153:
	.ascii	"EDOTDOT 73\000"
.LASF246:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF3065:
	.ascii	"IS_IWDG_WRITE_ACCESS(ACCESS) (((ACCESS) == IWDG_Wri"
	.ascii	"teAccess_Enable) || ((ACCESS) == IWDG_WriteAccess_D"
	.ascii	"isable))\000"
.LASF3708:
	.ascii	"USART_WakeUp_AddressMark USART_CR1_WAKE\000"
.LASF1757:
	.ascii	"RTC_DR_WDU ((uint32_t)0x0000E000)\000"
.LASF1589:
	.ascii	"RCC_CIR_HSI14RDYF ((uint32_t)0x00000020)\000"
.LASF2351:
	.ascii	"USART_CR2_RXINV ((uint32_t)0x00010000)\000"
.LASF109:
	.ascii	"__UINT16_C(c) c\000"
.LASF2907:
	.ascii	"IS_GPIO_PIN_SOURCE(PINSOURCE) (((PINSOURCE) == GPIO"
	.ascii	"_PinSource0) || ((PINSOURCE) == GPIO_PinSource1) ||"
	.ascii	" ((PINSOURCE) == GPIO_PinSource2) || ((PINSOURCE) ="
	.ascii	"= GPIO_PinSource3) || ((PINSOURCE) == GPIO_PinSourc"
	.ascii	"e4) || ((PINSOURCE) == GPIO_PinSource5) || ((PINSOU"
	.ascii	"RCE) == GPIO_PinSource6) || ((PINSOURCE) == GPIO_Pi"
	.ascii	"nSource7) || ((PINSOURCE) == GPIO_PinSource8) || (("
	.ascii	"PINSOURCE) == GPIO_PinSource9) || ((PINSOURCE) == G"
	.ascii	"PIO_PinSource10) || ((PINSOURCE) == GPIO_PinSource1"
	.ascii	"1) || ((PINSOURCE) == GPIO_PinSource12) || ((PINSOU"
	.ascii	"RCE) == GPIO_PinSource13) || ((PINSOURCE) == GPIO_P"
	.ascii	"inSource14) || ((PINSOURCE) == GPIO_PinSource15))\000"
.LASF883:
	.ascii	"DBGMCU_APB2_FZ_DBG_TIM17_STOP ((uint32_t)0x00040000"
	.ascii	")\000"
.LASF3634:
	.ascii	"TIM_FLAG_CC2OF ((uint16_t)0x0400)\000"
.LASF1096:
	.ascii	"FLASH_OBR_RDPRT2 ((uint32_t)0x00000004)\000"
.LASF3907:
	.ascii	"RCC_AHBPeriph_GPIOD RCC_AHBENR_GPIODEN\000"
.LASF317:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1\000"
.LASF886:
	.ascii	"DMA_ISR_HTIF1 ((uint32_t)0x00000004)\000"
.LASF581:
	.ascii	"__SYSTEM_STM32F0XX_H \000"
.LASF3394:
	.ascii	"SPI_I2S_FLAG_OVR SPI_SR_OVR\000"
.LASF4311:
	.ascii	"caribou_queue_lock() caribou_lib_lock()\000"
.LASF3401:
	.ascii	"IS_TIM_ALL_PERIPH(PERIPH) (((PERIPH) == TIM1) || (("
	.ascii	"PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERIPH)"
	.ascii	" == TIM6) || ((PERIPH) == TIM14)|| ((PERIPH) == TIM"
	.ascii	"15)|| ((PERIPH) == TIM16)|| ((PERIPH) == TIM17))\000"
.LASF3821:
	.ascii	"RCC_PLLMul_10 RCC_CFGR_PLLMULL10\000"
.LASF3591:
	.ascii	"TIM_EventSource_CC4 ((uint16_t)0x0010)\000"
.LASF4080:
	.ascii	"EOKAY 0\000"
.LASF341:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF3574:
	.ascii	"TIM_ExtTRGPolarity_Inverted ((uint16_t)0x8000)\000"
.LASF1756:
	.ascii	"RTC_DR_YU_3 ((uint32_t)0x00080000)\000"
.LASF1850:
	.ascii	"RTC_SHIFTR_SUBFS ((uint32_t)0x00007FFF)\000"
.LASF1945:
	.ascii	"SPI_CR1_BR ((uint16_t)0x0038)\000"
.LASF3606:
	.ascii	"TIM_OCClear_Disable ((uint16_t)0x0000)\000"
.LASF2581:
	.ascii	"IS_CEC_LONG_BIT_PERIOD_ERROR(ERROR) (((ERROR) == CE"
	.ascii	"C_LongBitPeriodError_Off) || ((ERROR) == CEC_LongBi"
	.ascii	"tPeriodError_On))\000"
.LASF2530:
	.ascii	"ADC_Channel_15 ADC_CHSELR_CHSEL15\000"
.LASF3645:
	.ascii	"TIM14_RTC_CLK ((uint16_t)0x0001)\000"
.LASF3791:
	.ascii	"WWDG_Prescaler_4 ((uint32_t)0x00000100)\000"
.LASF2376:
	.ascii	"USART_CR3_DEP ((uint32_t)0x00008000)\000"
.LASF1040:
	.ascii	"EXTI_SWIER_SWIER9 ((uint32_t)0x00000200)\000"
.LASF3164:
	.ascii	"RTC_AlarmSubSecondMask_SS14_5 ((uint8_t)0x05)\000"
.LASF450:
	.ascii	"__MAX_CATEGORY 5\000"
.LASF1181:
	.ascii	"GPIO_OSPEEDER_OSPEEDR1 ((uint32_t)0x0000000C)\000"
.LASF1312:
	.ascii	"GPIO_BSRR_BS_6 ((uint32_t)0x00000040)\000"
.LASF2623:
	.ascii	"CRC_ReverseInputData_32bits CRC_CR_REV_IN\000"
.LASF1697:
	.ascii	"RCC_CFGR2_PREDIV1_DIV5 ((uint32_t)0x00000004)\000"
.LASF634:
	.ascii	"TIM14 ((TIM_TypeDef *) TIM14_BASE)\000"
.LASF1454:
	.ascii	"I2C_ICR_STOPCF ((uint32_t)0x00000020)\000"
.LASF2158:
	.ascii	"TIM_DIER_COMDE ((uint16_t)0x2000)\000"
.LASF1028:
	.ascii	"EXTI_FTSR_TR16 ((uint32_t)0x00010000)\000"
.LASF4277:
	.ascii	"FP_OPER 1\000"
.LASF3529:
	.ascii	"TIM_DMABurstLength_1Transfer ((uint16_t)0x0000)\000"
.LASF2411:
	.ascii	"USART_ISR_BUSY ((uint32_t)0x00010000)\000"
.LASF1896:
	.ascii	"RTC_TSDR_DU_3 ((uint32_t)0x00000008)\000"
.LASF4126:
	.ascii	"EL3HLT 46\000"
.LASF1184:
	.ascii	"GPIO_OSPEEDER_OSPEEDR2 ((uint32_t)0x00000030)\000"
.LASF1902:
	.ascii	"RTC_CAL_CALM_0 ((uint32_t)0x00000001)\000"
.LASF922:
	.ascii	"DMA_IFCR_CHTIF5 ((uint32_t)0x00040000)\000"
.LASF3411:
	.ascii	"IS_TIM_LIST10_PERIPH(PERIPH) (((PERIPH) == TIM1) ||"
	.ascii	" ((PERIPH) == TIM2) || ((PERIPH) == TIM3) || ((PERI"
	.ascii	"PH) == TIM6) || ((PERIPH) == TIM15)|| ((PERIPH) == "
	.ascii	"TIM16)|| ((PERIPH) == TIM17))\000"
.LASF497:
	.ascii	"__CORE_CMFUNC_H \000"
.LASF1824:
	.ascii	"RTC_ALRMAR_HU_0 ((uint32_t)0x00010000)\000"
.LASF1415:
	.ascii	"I2C_CR2_NBYTES ((uint32_t)0x00FF0000)\000"
.LASF4184:
	.ascii	"ECONNRESET 104\000"
.LASF1080:
	.ascii	"FLASH_SR_WRPERR ((uint32_t)0x00000010)\000"
.LASF1212:
	.ascii	"GPIO_OSPEEDER_OSPEEDR11_0 ((uint32_t)0x00400000)\000"
.LASF470:
	.ascii	"__STM32F0XX_RCC_H \000"
.LASF529:
	.ascii	"SCB_ICSR_VECTACTIVE_Msk (0x1FFUL << SCB_ICSR_VECTAC"
	.ascii	"TIVE_Pos)\000"
.LASF466:
	.ascii	"caribou_lib_lock_restore(n) chip_interrupts_set(n)\000"
.LASF1125:
	.ascii	"GPIO_MODER_MODER3_1 ((uint32_t)0x00000080)\000"
.LASF704:
	.ascii	"ADC_CFGR1_OVRMOD ((uint32_t)0x00001000)\000"
.LASF3670:
	.ascii	"USART_WordLength_8b ((uint32_t)0x00000000)\000"
.LASF2757:
	.ascii	"DMA1_FLAG_GL1 DMA_ISR_GIF1\000"
.LASF2888:
	.ascii	"GPIO_Pin_All ((uint16_t)0xFFFF)\000"
.LASF432:
	.ascii	"__RAL_SIZE_T\000"
.LASF2415:
	.ascii	"USART_ISR_WUF ((uint32_t)0x00100000)\000"
.LASF3838:
	.ascii	"RCC_PREDIV1_Div10 RCC_CFGR2_PREDIV1_DIV10\000"
.LASF1815:
	.ascii	"RTC_ALRMAR_DU_1 ((uint32_t)0x02000000)\000"
.LASF3558:
	.ascii	"TIM_ExtTRGPSC_DIV4 ((uint16_t)0x2000)\000"
.LASF2599:
	.ascii	"CEC_IT_RXOVR CEC_IER_RXOVRIE\000"
.LASF33:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF181:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF1645:
	.ascii	"RCC_APB1ENR_TIM3EN ((uint32_t)0x00000002)\000"
.LASF4432:
	.ascii	"ticks\000"
.LASF911:
	.ascii	"DMA_IFCR_CTEIF2 ((uint32_t)0x00000080)\000"
.LASF1992:
	.ascii	"SPI_RXCRCR_RXCRC ((uint16_t)0xFFFF)\000"
.LASF4210:
	.ascii	"EOWNERDEAD 130\000"
.LASF4134:
	.ascii	"EXFULL 54\000"
.LASF2993:
	.ascii	"I2C_OA2_Mask02 ((uint8_t)0x02)\000"
.LASF4044:
	.ascii	"CARIBOU_PORTC_MODE PIN_MODE(0,GPIO_Mode_IN) | PIN_M"
	.ascii	"ODE(1,GPIO_Mode_IN) | PIN_MODE(2,GPIO_Mode_IN) | PI"
	.ascii	"N_MODE(3,GPIO_Mode_IN) | PIN_MODE(4,GPIO_Mode_IN) |"
	.ascii	" PIN_MODE(5,GPIO_Mode_IN) | PIN_MODE(6,GPIO_Mode_IN"
	.ascii	") | PIN_MODE(7,GPIO_Mode_IN) | PIN_MODE(8,GPIO_Mode"
	.ascii	"_IN) | PIN_MODE(9,GPIO_Mode_IN) | PIN_MODE(10,GPIO_"
	.ascii	"Mode_IN) | PIN_MODE(11,GPIO_Mode_IN) | PIN_MODE(12,"
	.ascii	"GPIO_Mode_IN) | PIN_MODE(13,GPIO_Mode_IN) | PIN_MOD"
	.ascii	"E(14,GPIO_Mode_IN) | PIN_MODE(15,GPIO_Mode_IN)\000"
.LASF4224:
	.ascii	"THREAD_FAULT_STACK_LOW 0x0001\000"
.LASF2852:
	.ascii	"OB_VDDA_ANALOG_OFF ((uint8_t)0x20)\000"
.LASF2147:
	.ascii	"TIM_DIER_CC2IE ((uint16_t)0x0004)\000"
.LASF2726:
	.ascii	"DMA_Priority_Low ((uint32_t)0x00000000)\000"
.LASF2504:
	.ascii	"IS_ADC_ANALOG_WATCHDOG_CHANNEL(CHANNEL) (((CHANNEL)"
	.ascii	" == ADC_AnalogWatchdog_Channel_0) || ((CHANNEL) == "
	.ascii	"ADC_AnalogWatchdog_Channel_1) || ((CHANNEL) == ADC_"
	.ascii	"AnalogWatchdog_Channel_2) || ((CHANNEL) == ADC_Anal"
	.ascii	"ogWatchdog_Channel_3) || ((CHANNEL) == ADC_AnalogWa"
	.ascii	"tchdog_Channel_4) || ((CHANNEL) == ADC_AnalogWatchd"
	.ascii	"og_Channel_5) || ((CHANNEL) == ADC_AnalogWatchdog_C"
	.ascii	"hannel_6) || ((CHANNEL) == ADC_AnalogWatchdog_Chann"
	.ascii	"el_7) || ((CHANNEL) == ADC_AnalogWatchdog_Channel_8"
	.ascii	") || ((CHANNEL) == ADC_AnalogWatchdog_Channel_9) ||"
	.ascii	" ((CHANNEL) == ADC_AnalogWatchdog_Channel_10) || (("
	.ascii	"CHANNEL) == ADC_AnalogWatchdog_Channel_11) || ((CHA"
	.ascii	"NNEL) == ADC_AnalogWatchdog_Channel_12) || ((CHANNE"
	.ascii	"L) == ADC_AnalogWatchdog_Channel_13) || ((CHANNEL) "
	.ascii	"== ADC_AnalogWatchdog_Channel_14) || ((CHANNEL) == "
	.ascii	"ADC_AnalogWatchdog_Channel_15) || ((CHANNEL) == ADC"
	.ascii	"_AnalogWatchdog_Channel_16) || ((CHANNEL) == ADC_An"
	.ascii	"alogWatchdog_Channel_17) || ((CHANNEL) == ADC_Analo"
	.ascii	"gWatchdog_Channel_18))\000"
.LASF307:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF229:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF182:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF3455:
	.ascii	"IS_TIM_CCX(CCX) (((CCX) == TIM_CCx_Enable) || ((CCX"
	.ascii	") == TIM_CCx_Disable))\000"
.LASF852:
	.ascii	"DBGMCU_IDCODE_DEV_ID ((uint32_t)0x00000FFF)\000"
.LASF3395:
	.ascii	"SPI_I2S_FLAG_BSY SPI_SR_BSY\000"
.LASF3664:
	.ascii	"TIM_DMABurstLength_16Bytes TIM_DMABurstLength_16Tra"
	.ascii	"nsfers\000"
.LASF4381:
	.ascii	"_CARIBOU_I2C_STM32F0xx_H_ \000"
.LASF777:
	.ascii	"CEC_ISR_TXACKE ((uint32_t)0x00001000)\000"
.LASF1439:
	.ascii	"I2C_ISR_NACKF ((uint32_t)0x00000010)\000"
.LASF4163:
	.ascii	"ELIBEXEC 83\000"
.LASF3774:
	.ascii	"USART_IT_LBD ((uint32_t)0x00080206)\000"
.LASF1676:
	.ascii	"RCC_CSR_PINRSTF ((uint32_t)0x04000000)\000"
.LASF3096:
	.ascii	"PWR_SLEEPEntry_WFI ((uint8_t)0x01)\000"
.LASF1215:
	.ascii	"GPIO_OSPEEDER_OSPEEDR12_0 ((uint32_t)0x01000000)\000"
.LASF2691:
	.ascii	"DBGMCU_RTC_STOP DBGMCU_APB1_FZ_DBG_RTC_STOP\000"
.LASF1522:
	.ascii	"RCC_CFGR_HPRE_1 ((uint32_t)0x00000020)\000"
.LASF2845:
	.ascii	"OB_STDBY_NoRST ((uint8_t)0x04)\000"
.LASF3086:
	.ascii	"PWR_PVDLevel_5 PWR_CR_PLS_LEV5\000"
.LASF2545:
	.ascii	"IS_ADC_GET_IT(IT) (((IT) == ADC_IT_ADRDY) || ((IT) "
	.ascii	"== ADC_IT_EOSMP) || ((IT) == ADC_IT_EOC) || ((IT) ="
	.ascii	"= ADC_IT_EOSEQ) || ((IT) == ADC_IT_OVR) || ((IT) =="
	.ascii	" ADC_IT_AWD))\000"
.LASF2905:
	.ascii	"GPIO_PinSource14 ((uint8_t)0x0E)\000"
.LASF1915:
	.ascii	"RTC_TAFCR_TAMPPRCH_1 ((uint32_t)0x00004000)\000"
.LASF865:
	.ascii	"DBGMCU_IDCODE_REV_ID_11 ((uint32_t)0x08000000)\000"
.LASF4040:
	.ascii	"CARIBOU_PORTB_OSPEEDR PIN_OSPEEDR(0,GPIO_Speed_2MHz"
	.ascii	") | PIN_OSPEEDR(1,GPIO_Speed_2MHz) | PIN_OSPEEDR(2,"
	.ascii	"GPIO_Speed_2MHz) | PIN_OSPEEDR(3,GPIO_Speed_2MHz) |"
	.ascii	" PIN_OSPEEDR(4,GPIO_Speed_2MHz) | PIN_OSPEEDR(5,GPI"
	.ascii	"O_Speed_2MHz) | PIN_OSPEEDR(6,GPIO_Speed_2MHz) | PI"
	.ascii	"N_OSPEEDR(7,GPIO_Speed_2MHz) | PIN_OSPEEDR(8,GPIO_S"
	.ascii	"peed_2MHz) | PIN_OSPEEDR(9,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(10,GPIO_Speed_2MHz) | PIN_OSPEEDR(11,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(12,GPIO_Speed_2MHz) | PIN_O"
	.ascii	"SPEEDR(13,GPIO_Speed_2MHz) | PIN_OSPEEDR(14,GPIO_Sp"
	.ascii	"eed_2MHz) | PIN_OSPEEDR(15,GPIO_Speed_2MHz)\000"
.LASF2870:
	.ascii	"IS_GPIO_PUPD(PUPD) (((PUPD) == GPIO_PuPd_NOPULL) ||"
	.ascii	" ((PUPD) == GPIO_PuPd_UP) || ((PUPD) == GPIO_PuPd_D"
	.ascii	"OWN))\000"
.LASF1111:
	.ascii	"OB_WRP0_nWRP0 ((uint32_t)0x0000FF00)\000"
.LASF3694:
	.ascii	"IS_USART_CPOL(CPOL) (((CPOL) == USART_CPOL_Low) || "
	.ascii	"((CPOL) == USART_CPOL_High))\000"
.LASF1017:
	.ascii	"EXTI_FTSR_TR5 ((uint32_t)0x00000020)\000"
.LASF424:
	.ascii	"UINTMAX_C(x) (x ##ULL)\000"
.LASF2863:
	.ascii	"FLASH_ER_PRG_TIMEOUT ((uint32_t)0x000B0000)\000"
.LASF2462:
	.ascii	"ADC_Resolution_8b ADC_CFGR1_RES_1\000"
.LASF2161:
	.ascii	"TIM_SR_CC1IF ((uint16_t)0x0002)\000"
.LASF1652:
	.ascii	"RCC_APB1ENR_I2C2EN ((uint32_t)0x00400000)\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
