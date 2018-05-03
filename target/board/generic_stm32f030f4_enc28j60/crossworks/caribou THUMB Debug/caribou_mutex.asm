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
	.file	"mutex.c"
	.text
.Ltext0:
	.section	.text.caribou_mutex_free,"ax",%progbits
	.align	1
	.global	caribou_mutex_free
	.code	16
	.thumb_func
	.type	caribou_mutex_free, %function
caribou_mutex_free:
.LFB1:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../../src/lib/mutex.c"
	.loc 1 55 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 56 0
	cmp	r0, #0
	beq	.L1
	.loc 1 58 0
	bl	free
.LVL1:
.L1:
	.loc 1 60 0
	@ sp needed
	pop	{r3, pc}
.LFE1:
	.size	caribou_mutex_free, .-caribou_mutex_free
	.section	.text.caribou_mutex_init,"ax",%progbits
	.align	1
	.global	caribou_mutex_init
	.code	16
	.thumb_func
	.type	caribou_mutex_init, %function
caribou_mutex_init:
.LFB2:
	.loc 1 70 0
.LVL2:
	push	{r3, r4, r5, lr}
.LCFI1:
	.loc 1 71 0
	mov	r2, #8
	.loc 1 70 0
	mov	r5, r1
	mov	r4, r0
	.loc 1 71 0
	mov	r1, #0
.LVL3:
	bl	memset
.LVL4:
	.loc 1 73 0
	@ sp needed
	.loc 1 72 0
	strb	r5, [r4, #5]
.LVL5:
	.loc 1 73 0
	pop	{r3, r4, r5, pc}
.LFE2:
	.size	caribou_mutex_init, .-caribou_mutex_init
	.section	.text.caribou_mutex_new,"ax",%progbits
	.align	1
	.global	caribou_mutex_new
	.code	16
	.thumb_func
	.type	caribou_mutex_new, %function
caribou_mutex_new:
.LFB0:
	.loc 1 36 0
.LVL6:
	push	{r4, r5, r6, lr}
.LCFI2:
	.loc 1 36 0
	mov	r6, r0
	.loc 1 37 0
	mov	r0, #8
.LVL7:
	bl	malloc
.LVL8:
	ldr	r5, .L12
	mov	r4, r0
.LVL9:
	.loc 1 45 0
	mov	r3, #12
	.loc 1 38 0
	cmp	r0, #0
	beq	.L11
	.loc 1 40 0
	mov	r1, r6
	bl	caribou_mutex_init
.LVL10:
	.loc 1 41 0
	mov	r3, #0
.L11:
	.loc 1 45 0
	str	r3, [r5]
	.loc 1 48 0
	mov	r0, r4
	@ sp needed
.LVL11:
	pop	{r4, r5, r6, pc}
.L13:
	.align	2
.L12:
	.word	__errno
.LFE0:
	.size	caribou_mutex_new, .-caribou_mutex_new
	.section	.text.caribou_mutex_trylock,"ax",%progbits
	.align	1
	.global	caribou_mutex_trylock
	.code	16
	.thumb_func
	.type	caribou_mutex_trylock, %function
caribou_mutex_trylock:
.LFB4:
	.loc 1 121 0
.LVL12:
	push	{r4, r5, r6, lr}
.LCFI3:
	.loc 1 121 0
	mov	r4, r0
	.loc 1 123 0
	bl	caribou_thread_current
.LVL13:
	mov	r6, r0
.LVL14:
	.loc 1 124 0
	bl	caribou_lock
.LVL15:
	.loc 1 125 0
	ldrb	r3, [r4, #4]
	cmp	r3, #0
	beq	.L15
	.loc 1 125 0 is_stmt 0 discriminator 1
	ldr	r2, [r4]
	.loc 1 128 0 is_stmt 1 discriminator 1
	mov	r5, #0
	.loc 1 125 0 discriminator 1
	cmp	r2, r6
	bne	.L16
.L15:
	.loc 1 133 0
	add	r3, r3, #1
	strb	r3, [r4, #4]
	.loc 1 134 0
	str	r6, [r4]
.LVL16:
	.loc 1 135 0
	mov	r5, #1
.LVL17:
.L16:
	.loc 1 137 0
	bl	caribou_lock_set
.LVL18:
	.loc 1 139 0
	@ sp needed
	mov	r0, r5
.LVL19:
.LVL20:
.LVL21:
	pop	{r4, r5, r6, pc}
.LFE4:
	.size	caribou_mutex_trylock, .-caribou_mutex_trylock
	.section	.text.caribou_mutex_lock,"ax",%progbits
	.align	1
	.global	caribou_mutex_lock
	.code	16
	.thumb_func
	.type	caribou_mutex_lock, %function
caribou_mutex_lock:
.LFB3:
	.loc 1 87 0
.LVL22:
	push	{r4, r5, lr}
.LCFI4:
	mov	r4, r0
	sub	sp, sp, #36
.LCFI5:
	.loc 1 87 0
	mov	r5, r1
	.loc 1 89 0
	bl	caribou_lock
.LVL23:
	.loc 1 90 0
	ldrb	r3, [r4, #6]
	add	r3, r3, #1
	strb	r3, [r4, #6]
	.loc 1 91 0
	bl	caribou_lock_set
.LVL24:
	.loc 1 92 0
	cmp	r5, #0
	beq	.L25
	.loc 1 94 0
	mov	r1, r5
	add	r0, sp, #4
	bl	caribou_timer_set
.LVL25:
	.loc 1 95 0
	mov	r1, #0
	add	r0, sp, #4
	mov	r2, r1
	mov	r3, #2
	bl	caribou_timer_init
.LVL26:
	b	.L25
.L40:
	.loc 1 97 0 discriminator 2
	cmp	r5, #0
	bne	.L39
.L27:
	.loc 1 99 0
	ldrb	r3, [r4, #5]
	lsl	r2, r3, #31
	bmi	.L25
	.loc 1 101 0
	bl	caribou_thread_yield
.LVL27:
.L25:
	.loc 1 97 0 discriminator 1
	mov	r0, r4
	bl	caribou_mutex_trylock
.LVL28:
	cmp	r0, #0
	beq	.L40
	b	.L28
.L39:
	add	r0, sp, #4
	bl	caribou_timer_expired
.LVL29:
	cmp	r0, #0
	beq	.L27
.L28:
	.loc 1 104 0
	bl	caribou_lock
.LVL30:
	.loc 1 105 0
	ldrb	r3, [r4, #6]
	sub	r3, r3, #1
	strb	r3, [r4, #6]
	.loc 1 106 0
	bl	caribou_lock_set
.LVL31:
	.loc 1 108 0
	mov	r0, #1
	add	sp, sp, #36
	@ sp needed
.LVL32:
.LVL33:
	pop	{r4, r5, pc}
.LFE3:
	.size	caribou_mutex_lock, .-caribou_mutex_lock
	.section	.text.caribou_mutex_unlock,"ax",%progbits
	.align	1
	.global	caribou_mutex_unlock
	.code	16
	.thumb_func
	.type	caribou_mutex_unlock, %function
caribou_mutex_unlock:
.LFB5:
	.loc 1 150 0
.LVL34:
	push	{r4, r5, r6, lr}
.LCFI6:
	.loc 1 150 0
	mov	r4, r0
	.loc 1 152 0
	bl	caribou_lock
.LVL35:
	.loc 1 153 0
	ldrb	r3, [r4, #4]
	.loc 1 152 0
	mov	r6, r0
.LVL36:
	.loc 1 153 0
	cmp	r3, #0
	bne	.L42
.LVL37:
.L44:
	.loc 1 151 0
	mov	r5, #0
	b	.L43
.LVL38:
.L42:
	.loc 1 153 0 discriminator 1
	ldr	r5, [r4]
	bl	caribou_thread_current
.LVL39:
	cmp	r5, r0
	bne	.L44
	.loc 1 155 0
	ldrb	r3, [r4, #4]
	.loc 1 157 0
	mov	r5, #1
	.loc 1 155 0
	sub	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r4, #4]
	cmp	r3, #0
	bne	.L43
	.loc 1 156 0
	str	r3, [r4]
.L43:
.LVL40:
	.loc 1 160 0
	ldrb	r3, [r4, #6]
	.loc 1 162 0
	mov	r0, r6
	.loc 1 160 0
	cmp	r3, #0
	beq	.L45
.LVL41:
	.loc 1 162 0
	bl	caribou_lock_set
.LVL42:
	.loc 1 163 0
	ldrb	r3, [r4, #5]
	lsl	r2, r3, #31
	bmi	.L46
	.loc 1 165 0
	bl	caribou_thread_yield
.LVL43:
	b	.L46
.LVL44:
.L45:
	.loc 1 170 0
	bl	caribou_lock_set
.LVL45:
.L46:
	.loc 1 173 0
	mov	r0, r5
	@ sp needed
.LVL46:
.LVL47:
.LVL48:
	pop	{r4, r5, r6, pc}
.LFE5:
	.size	caribou_mutex_unlock, .-caribou_mutex_unlock
	.section	.text.caribou_mutex_flags,"ax",%progbits
	.align	1
	.global	caribou_mutex_flags
	.code	16
	.thumb_func
	.type	caribou_mutex_flags, %function
caribou_mutex_flags:
.LFB6:
	.loc 1 182 0
.LVL49:
	push	{r4, lr}
.LCFI7:
	.loc 1 182 0
	mov	r4, r0
	.loc 1 184 0
	bl	caribou_lock
.LVL50:
	.loc 1 185 0
	ldrb	r4, [r4, #5]
.LVL51:
	.loc 1 188 0
	@ sp needed
	.loc 1 186 0
	bl	caribou_lock_set
.LVL52:
	.loc 1 188 0
	mov	r0, r4
.LVL53:
	pop	{r4, pc}
.LFE6:
	.size	caribou_mutex_flags, .-caribou_mutex_flags
	.section	.text.caribou_mutex_set_flags,"ax",%progbits
	.align	1
	.global	caribou_mutex_set_flags
	.code	16
	.thumb_func
	.type	caribou_mutex_set_flags, %function
caribou_mutex_set_flags:
.LFB7:
	.loc 1 198 0
.LVL54:
	push	{r3, r4, r5, lr}
.LCFI8:
	.loc 1 198 0
	mov	r5, r1
	mov	r4, r0
	.loc 1 199 0
	bl	caribou_lock
.LVL55:
	.loc 1 200 0
	strb	r5, [r4, #5]
	.loc 1 201 0
	bl	caribou_lock_set
.LVL56:
	.loc 1 202 0
	@ sp needed
.LVL57:
	pop	{r3, r4, r5, pc}
.LFE7:
	.size	caribou_mutex_set_flags, .-caribou_mutex_set_flags
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI1-.LFB2
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
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI2-.LFB0
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI3-.LFB4
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
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI4-.LFB3
	.byte	0xe
	.uleb128 0xc
	.byte	0x84
	.uleb128 0x3
	.byte	0x85
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x30
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI6-.LFB5
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI7-.LFB6
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
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
	.4byte	.LCFI8-.LFB7
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
.LEFDE14:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 4 "../../../../include/caribou/kernel/timer.h"
	.file 5 "../../../../include/caribou/lib/errno.h"
	.file 6 "../../../../include/caribou/kernel/thread.h"
	.file 7 "../../../../include/caribou/lib/mutex.h"
	.file 8 "../../../../include/caribou/lib/string.h"
	.file 9 "../../../../include/caribou/lib/heap.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6fc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x1
	.4byte	.LASF67
	.4byte	.LASF68
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
	.byte	0x16
	.4byte	0x74
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x4
	.byte	0x2f
	.4byte	0xcc
	.uleb128 0x8
	.4byte	0x94
	.4byte	0xe5
	.uleb128 0x9
	.4byte	0x94
	.uleb128 0x9
	.4byte	0xe5
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xeb
	.uleb128 0xa
	.4byte	.LASF26
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x1c
	.byte	0x4
	.byte	0x38
	.4byte	0x151
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x4
	.byte	0x3b
	.4byte	0x151
	.byte	0
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x4
	.byte	0x3d
	.4byte	0x151
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x4
	.byte	0x3f
	.4byte	0x157
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x4
	.byte	0x41
	.4byte	0x94
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x4
	.byte	0x43
	.4byte	0x69
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x4
	.byte	0x45
	.4byte	0x69
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x4
	.byte	0x47
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xf0
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc1
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x4
	.byte	0x48
	.4byte	0xf0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x5
	.2byte	0x108
	.4byte	0x62
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x48
	.byte	0x6
	.byte	0x1f
	.4byte	0x24c
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x6
	.byte	0x22
	.4byte	0x24c
	.byte	0
	.uleb128 0xc
	.4byte	.LASF28
	.byte	0x6
	.byte	0x25
	.4byte	0x24c
	.byte	0x4
	.uleb128 0xe
	.ascii	"sp\000"
	.byte	0x6
	.byte	0x28
	.4byte	0x94
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x6
	.byte	0x2b
	.4byte	0x94
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x6
	.byte	0x2e
	.4byte	0x94
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x6
	.byte	0x31
	.4byte	0x94
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x6
	.byte	0x34
	.4byte	0x94
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x6
	.byte	0x37
	.4byte	0x50
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x6
	.byte	0x3a
	.4byte	0x3e
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x6
	.byte	0x3d
	.4byte	0xa4
	.byte	0x20
	.uleb128 0xe
	.ascii	"arg\000"
	.byte	0x6
	.byte	0x40
	.4byte	0x94
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x6
	.byte	0x43
	.4byte	0x82
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x6
	.byte	0x46
	.4byte	0x3e
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x6
	.byte	0x49
	.4byte	0x25d
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x6
	.byte	0x4c
	.4byte	0x263
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x6
	.byte	0x4f
	.4byte	0x168
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x6
	.byte	0x52
	.4byte	0x3e
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x174
	.uleb128 0xf
	.4byte	0x25d
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x252
	.uleb128 0x6
	.byte	0x4
	.4byte	0x15d
	.uleb128 0x3
	.4byte	.LASF42
	.byte	0x6
	.byte	0x55
	.4byte	0x174
	.uleb128 0x6
	.byte	0x4
	.4byte	0x269
	.uleb128 0x10
	.byte	0x8
	.byte	0x7
	.byte	0x1e
	.4byte	0x2b3
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x7
	.byte	0x20
	.4byte	0x94
	.byte	0
	.uleb128 0xc
	.4byte	.LASF44
	.byte	0x7
	.byte	0x21
	.4byte	0x2c
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x7
	.byte	0x22
	.4byte	0x2c
	.byte	0x5
	.uleb128 0xc
	.4byte	.LASF45
	.byte	0x7
	.byte	0x23
	.4byte	0x2c
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.4byte	.LASF46
	.byte	0x7
	.byte	0x24
	.4byte	0x27a
	.uleb128 0x11
	.4byte	.LASF47
	.byte	0x1
	.byte	0x36
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2f4
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x36
	.4byte	0x2f4
	.4byte	.LLST0
	.uleb128 0x13
	.4byte	.LVL1
	.4byte	0x637
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2b3
	.uleb128 0x11
	.4byte	.LASF48
	.byte	0x1
	.byte	0x45
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x348
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x45
	.4byte	0x2f4
	.4byte	.LLST1
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x45
	.4byte	0x2c
	.4byte	.LLST2
	.uleb128 0x13
	.4byte	.LVL4
	.4byte	0x648
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF50
	.byte	0x1
	.byte	0x23
	.4byte	0x2f4
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a9
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x23
	.4byte	0x2c
	.4byte	.LLST3
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0x1
	.byte	0x25
	.4byte	0x2f4
	.4byte	.LLST4
	.uleb128 0x17
	.4byte	.LVL8
	.4byte	0x667
	.4byte	0x392
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x13
	.4byte	.LVL10
	.4byte	0x2fa
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF51
	.byte	0x1
	.byte	0x78
	.4byte	0x9d
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x419
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x78
	.4byte	0x2f4
	.4byte	.LLST5
	.uleb128 0x18
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x7a
	.4byte	0x9d
	.4byte	.LLST6
	.uleb128 0x16
	.4byte	.LASF52
	.byte	0x1
	.byte	0x7b
	.4byte	0x274
	.4byte	.LLST7
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x7c
	.4byte	0x62
	.4byte	.LLST8
	.uleb128 0x19
	.4byte	.LVL13
	.4byte	0x67c
	.uleb128 0x19
	.4byte	.LVL15
	.4byte	0x687
	.uleb128 0x19
	.4byte	.LVL18
	.4byte	0x698
	.byte	0
	.uleb128 0x15
	.4byte	.LASF53
	.byte	0x1
	.byte	0x56
	.4byte	0x9d
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x500
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x56
	.4byte	0x2f4
	.4byte	.LLST9
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x1
	.byte	0x56
	.4byte	0x69
	.4byte	.LLST10
	.uleb128 0x1a
	.4byte	.LASF39
	.byte	0x1
	.byte	0x58
	.4byte	0x15d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x59
	.4byte	0x62
	.4byte	.LLST11
	.uleb128 0x19
	.4byte	.LVL23
	.4byte	0x687
	.uleb128 0x19
	.4byte	.LVL24
	.4byte	0x698
	.uleb128 0x17
	.4byte	.LVL25
	.4byte	0x6a9
	.4byte	0x499
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x17
	.4byte	.LVL26
	.4byte	0x6c3
	.4byte	0x4bc
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x1
	.byte	0x32
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x19
	.4byte	.LVL27
	.4byte	0x6e7
	.uleb128 0x17
	.4byte	.LVL28
	.4byte	0x3a9
	.4byte	0x4d9
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL29
	.4byte	0x6ee
	.4byte	0x4ed
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x19
	.4byte	.LVL30
	.4byte	0x687
	.uleb128 0x19
	.4byte	.LVL31
	.4byte	0x698
	.byte	0
	.uleb128 0x15
	.4byte	.LASF55
	.byte	0x1
	.byte	0x95
	.4byte	0x9d
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57e
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x95
	.4byte	0x2f4
	.4byte	.LLST12
	.uleb128 0x18
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x97
	.4byte	0x9d
	.4byte	.LLST13
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0x98
	.4byte	0x62
	.4byte	.LLST14
	.uleb128 0x19
	.4byte	.LVL35
	.4byte	0x687
	.uleb128 0x19
	.4byte	.LVL39
	.4byte	0x67c
	.uleb128 0x17
	.4byte	.LVL42
	.4byte	0x698
	.4byte	0x56b
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL43
	.4byte	0x6e7
	.uleb128 0x19
	.4byte	.LVL45
	.4byte	0x698
	.byte	0
	.uleb128 0x15
	.4byte	.LASF56
	.byte	0x1
	.byte	0xb5
	.4byte	0x2c
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5d6
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0xb5
	.4byte	0x2f4
	.4byte	.LLST15
	.uleb128 0x18
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xb7
	.4byte	0x2c
	.4byte	.LLST16
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0xb8
	.4byte	0x62
	.4byte	.LLST17
	.uleb128 0x19
	.4byte	.LVL50
	.4byte	0x687
	.uleb128 0x19
	.4byte	.LVL52
	.4byte	0x698
	.byte	0
	.uleb128 0x11
	.4byte	.LASF57
	.byte	0x1
	.byte	0xc5
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x62b
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0xc5
	.4byte	0x2f4
	.4byte	.LLST18
	.uleb128 0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0xc5
	.4byte	0x2c
	.4byte	.LLST19
	.uleb128 0x16
	.4byte	.LASF33
	.byte	0x1
	.byte	0xc7
	.4byte	0x62
	.4byte	.LLST20
	.uleb128 0x19
	.4byte	.LVL55
	.4byte	0x687
	.uleb128 0x19
	.4byte	.LVL56
	.4byte	0x698
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x109
	.4byte	0x168
	.uleb128 0x1c
	.4byte	.LASF60
	.byte	0x9
	.byte	0x20
	.4byte	0x648
	.uleb128 0x9
	.4byte	0x94
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF58
	.byte	0x8
	.byte	0x29
	.4byte	0x94
	.4byte	0x667
	.uleb128 0x9
	.4byte	0x94
	.uleb128 0x9
	.4byte	0x62
	.uleb128 0x9
	.4byte	0xb6
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF59
	.byte	0x9
	.byte	0x1d
	.4byte	0x94
	.4byte	0x67c
	.uleb128 0x9
	.4byte	0xb6
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF69
	.byte	0x6
	.byte	0xb8
	.4byte	0x274
	.uleb128 0x1f
	.4byte	.LASF61
	.byte	0x1
	.byte	0x16
	.4byte	0x62
	.4byte	0x698
	.uleb128 0x20
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF62
	.byte	0x1
	.byte	0x17
	.4byte	0x6a9
	.uleb128 0x9
	.4byte	0x62
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF63
	.byte	0x4
	.byte	0x71
	.4byte	0x263
	.4byte	0x6c3
	.uleb128 0x9
	.4byte	0x263
	.uleb128 0x9
	.4byte	0x69
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF64
	.byte	0x4
	.byte	0x6f
	.4byte	0x263
	.4byte	0x6e7
	.uleb128 0x9
	.4byte	0x263
	.uleb128 0x9
	.4byte	0x157
	.uleb128 0x9
	.4byte	0x94
	.uleb128 0x9
	.4byte	0x2c
	.byte	0
	.uleb128 0x21
	.4byte	.LASF70
	.byte	0x6
	.byte	0xb4
	.uleb128 0x22
	.4byte	.LASF65
	.byte	0x4
	.byte	0x72
	.4byte	0x9d
	.uleb128 0x9
	.4byte	0x263
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x3f
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1-1
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4-1
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL5
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL3
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9
	.4byte	.LVL10-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-1
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL11
	.4byte	.LFE0
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL12
	.4byte	.LVL13-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL13-1
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL19
	.4byte	.LFE4
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL20
	.4byte	.LFE4
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL14
	.4byte	.LVL15-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15-1
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL15
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL22
	.4byte	.LVL23-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23-1
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL32
	.4byte	.LFE3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL22
	.4byte	.LVL23-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL23-1
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL33
	.4byte	.LFE3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL30
	.4byte	.LVL31-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL34
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL35-1
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL46
	.4byte	.LFE5
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL34
	.4byte	.LVL40
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL40
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL47
	.4byte	.LFE5
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL38
	.4byte	.LVL39-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL39-1
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL41
	.4byte	.LVL42-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42-1
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL44
	.4byte	.LVL45-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45-1
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL49
	.4byte	.LVL50-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL50-1
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL51
	.4byte	.LFE6
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL51
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL53
	.4byte	.LFE6
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL50
	.4byte	.LVL52-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL54
	.4byte	.LVL55-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL55-1
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL57
	.4byte	.LFE7
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL54
	.4byte	.LVL55-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL55-1
	.4byte	.LFE7
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL55
	.4byte	.LVL56-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x54
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LFB7
	.4byte	.LFE7
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF59:
	.ascii	"malloc\000"
.LASF46:
	.ascii	"caribou_mutex_t\000"
.LASF15:
	.ascii	"size_t\000"
.LASF26:
	.ascii	"_caribou_timer_t\000"
.LASF31:
	.ascii	"stack_top\000"
.LASF10:
	.ascii	"uint64_t\000"
.LASF17:
	.ascii	"prev\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF16:
	.ascii	"caribou_timer_callback_fn\000"
.LASF20:
	.ascii	"fnarg\000"
.LASF18:
	.ascii	"next\000"
.LASF3:
	.ascii	"int16_t\000"
.LASF9:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF65:
	.ascii	"caribou_timer_expired\000"
.LASF28:
	.ascii	"parent\000"
.LASF33:
	.ascii	"state\000"
.LASF12:
	.ascii	"long int\000"
.LASF69:
	.ascii	"caribou_thread_current\000"
.LASF70:
	.ascii	"caribou_thread_yield\000"
.LASF29:
	.ascii	"stack_usage\000"
.LASF5:
	.ascii	"uint16_t\000"
.LASF62:
	.ascii	"caribou_lock_set\000"
.LASF48:
	.ascii	"caribou_mutex_init\000"
.LASF47:
	.ascii	"caribou_mutex_free\000"
.LASF56:
	.ascii	"caribou_mutex_flags\000"
.LASF32:
	.ascii	"stack_base\000"
.LASF49:
	.ascii	"mutex\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF61:
	.ascii	"caribou_lock\000"
.LASF54:
	.ascii	"timeout\000"
.LASF35:
	.ascii	"name\000"
.LASF57:
	.ascii	"caribou_mutex_set_flags\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF41:
	.ascii	"sleep\000"
.LASF52:
	.ascii	"current_thread\000"
.LASF27:
	.ascii	"_caribou_thread_t\000"
.LASF67:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../../src/lib/mutex.c\000"
.LASF30:
	.ascii	"stack_low\000"
.LASF14:
	.ascii	"sizetype\000"
.LASF21:
	.ascii	"ticks\000"
.LASF44:
	.ascii	"locks\000"
.LASF51:
	.ascii	"caribou_mutex_trylock\000"
.LASF39:
	.ascii	"timer\000"
.LASF34:
	.ascii	"prio\000"
.LASF25:
	.ascii	"errno_t\000"
.LASF66:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF40:
	.ascii	"__errno\000"
.LASF43:
	.ascii	"thread\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF4:
	.ascii	"short int\000"
.LASF50:
	.ascii	"caribou_mutex_new\000"
.LASF45:
	.ascii	"blocking\000"
.LASF7:
	.ascii	"uint32_t\000"
.LASF22:
	.ascii	"reloadticks\000"
.LASF13:
	.ascii	"char\000"
.LASF42:
	.ascii	"caribou_thread_t\000"
.LASF60:
	.ascii	"free\000"
.LASF19:
	.ascii	"timerfn\000"
.LASF38:
	.ascii	"finishfn\000"
.LASF58:
	.ascii	"memset\000"
.LASF2:
	.ascii	"uint8_t\000"
.LASF23:
	.ascii	"flags\000"
.LASF53:
	.ascii	"caribou_mutex_lock\000"
.LASF55:
	.ascii	"caribou_mutex_unlock\000"
.LASF24:
	.ascii	"caribou_timer_t\000"
.LASF64:
	.ascii	"caribou_timer_init\000"
.LASF68:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF37:
	.ascii	"lock\000"
.LASF63:
	.ascii	"caribou_timer_set\000"
.LASF36:
	.ascii	"runtime\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
