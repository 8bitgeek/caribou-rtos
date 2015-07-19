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
	.file	"semaphore.c"
	.text
.Ltext0:
	.section	.text.caribou_semaphore_new,"ax",%progbits
	.align	1
	.global	caribou_semaphore_new
	.code	16
	.thumb_func
	.type	caribou_semaphore_new, %function
caribou_semaphore_new:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/semaphore.c"
	.loc 1 28 0
.LVL0:
	push	{r4, r5, r6, lr}
.LCFI0:
	.loc 1 28 0
	mov	r5, r0
	.loc 1 29 0
	mov	r0, #8
.LVL1:
	.loc 1 28 0
	mov	r6, r1
	.loc 1 29 0
	bl	malloc
.LVL2:
	sub	r4, r0, #0
.LVL3:
	.loc 1 30 0
	beq	.L2
	.loc 1 32 0
	mov	r0, r5
.LVL4:
	bl	caribou_queue_new
.LVL5:
	mov	r5, r0
.LVL6:
	str	r0, [r4, #4]
	.loc 1 33 0
	beq	.L3
	.loc 1 35 0
	str	r6, [r4]
	b	.L2
.L3:
	.loc 1 39 0
	mov	r0, r4
	bl	free
.LVL7:
	.loc 1 40 0
	mov	r4, r5
.LVL8:
.L2:
	.loc 1 45 0
	mov	r0, r4
	@ sp needed
.LVL9:
.LVL10:
	pop	{r4, r5, r6, pc}
.LFE32:
	.size	caribou_semaphore_new, .-caribou_semaphore_new
	.section	.text.caribou_semaphore_init,"ax",%progbits
	.align	1
	.global	caribou_semaphore_init
	.code	16
	.thumb_func
	.type	caribou_semaphore_init, %function
caribou_semaphore_init:
.LFB34:
	.loc 1 64 0
.LVL11:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI1:
	.loc 1 64 0
	mov	r4, r0
	mov	r6, r1
	mov	r7, r2
	.loc 1 65 0
	bl	chip_interrupts_disable
.LVL12:
	.loc 1 66 0
	mov	r1, #0
	.loc 1 65 0
	mov	r5, r0
.LVL13:
	.loc 1 66 0
	mov	r2, #8
	mov	r0, r4
.LVL14:
	bl	memset
.LVL15:
	.loc 1 69 0
	mov	r0, r5
	.loc 1 67 0
	str	r7, [r4]
	.loc 1 68 0
	str	r6, [r4, #4]
	.loc 1 69 0
	bl	chip_interrupts_set
.LVL16:
	.loc 1 71 0
	@ sp needed
	mov	r0, r4
.LVL17:
.LVL18:
.LVL19:
.LVL20:
	pop	{r3, r4, r5, r6, r7, pc}
.LFE34:
	.size	caribou_semaphore_init, .-caribou_semaphore_init
	.section	.text.caribou_semaphore_queue,"ax",%progbits
	.align	1
	.global	caribou_semaphore_queue
	.code	16
	.thumb_func
	.type	caribou_semaphore_queue, %function
caribou_semaphore_queue:
.LFB35:
	.loc 1 74 0
.LVL21:
	.loc 1 75 0
	cmp	r0, #0
	beq	.L10
	.loc 1 76 0
	ldr	r0, [r0, #4]
.LVL22:
.L10:
	.loc 1 78 0
	@ sp needed
	bx	lr
.LFE35:
	.size	caribou_semaphore_queue, .-caribou_semaphore_queue
	.section	.text.caribou_semaphore_signal,"ax",%progbits
	.align	1
	.global	caribou_semaphore_signal
	.code	16
	.thumb_func
	.type	caribou_semaphore_signal, %function
caribou_semaphore_signal:
.LFB36:
	.loc 1 88 0
.LVL23:
	push	{r0, r1, r4, r5, r6, lr}
.LCFI2:
	.loc 1 88 0
	mov	r4, r0
	.loc 1 90 0
	bl	chip_interrupts_disable
.LVL24:
	.loc 1 91 0
	ldr	r3, [r4]
	.loc 1 90 0
	mov	r6, r0
.LVL25:
	.loc 1 91 0
	add	r3, r3, #1
	str	r3, [r4]
	.loc 1 89 0
	mov	r5, #1
	.loc 1 91 0
	cmp	r3, #0
	bgt	.L13
.LBB2:
	.loc 1 94 0
	ldr	r0, [r4, #4]
.LVL26:
	cmp	r0, #0
	beq	.L14
	.loc 1 94 0 is_stmt 0 discriminator 1
	add	r1, sp, #4
	mov	r2, #1
	neg	r2, r2
	asr	r3, r2, #31
	bl	caribou_queue_take_first
.LVL27:
	sub	r5, r0, #0
.LVL28:
	beq	.L14
	.loc 1 96 0 is_stmt 1
	ldr	r0, [sp, #4]
.LVL29:
	bl	caribou_thread_wakeup
.LVL30:
	b	.L13
.LVL31:
.L14:
	.loc 1 100 0
	ldr	r3, [r4]
	.loc 1 101 0
	mov	r5, #0
	.loc 1 100 0
	sub	r3, r3, #1
	str	r3, [r4]
.LVL32:
.L13:
.LBE2:
	.loc 1 104 0
	mov	r0, r6
	bl	chip_interrupts_set
.LVL33:
	.loc 1 106 0
	@ sp needed
	mov	r0, r5
.LVL34:
.LVL35:
.LVL36:
	pop	{r1, r2, r4, r5, r6, pc}
.LFE36:
	.size	caribou_semaphore_signal, .-caribou_semaphore_signal
	.section	.text.caribou_semaphore_delete,"ax",%progbits
	.align	1
	.global	caribou_semaphore_delete
	.code	16
	.thumb_func
	.type	caribou_semaphore_delete, %function
caribou_semaphore_delete:
.LFB33:
	.loc 1 48 0
.LVL37:
	push	{r3, r4, r5, lr}
.LCFI3:
	.loc 1 48 0
	sub	r4, r0, #0
	.loc 1 49 0
	beq	.L23
.LBB3:
	.loc 1 51 0
	bl	chip_interrupts_disable
.LVL38:
	.loc 1 52 0
	ldr	r3, [r4, #4]
	.loc 1 51 0
	mov	r5, r0
.LVL39:
	.loc 1 52 0
	cmp	r3, #0
	beq	.L25
.LVL40:
.L26:
	.loc 1 54 0 discriminator 1
	ldr	r3, [r4]
	cmp	r3, #0
	bge	.L34
	.loc 1 55 0
	mov	r0, r4
	bl	caribou_semaphore_signal
.LVL41:
	b	.L26
.L34:
	.loc 1 56 0
	ldr	r0, [r4, #4]
	bl	caribou_queue_delete
.LVL42:
.L25:
	.loc 1 58 0
	mov	r0, r4
	bl	free
.LVL43:
	.loc 1 59 0
	mov	r0, r5
	bl	chip_interrupts_set
.LVL44:
.L23:
.LBE3:
	.loc 1 61 0
	@ sp needed
.LVL45:
	pop	{r3, r4, r5, pc}
.LFE33:
	.size	caribou_semaphore_delete, .-caribou_semaphore_delete
	.section	.text.caribou_semaphore_try_wait,"ax",%progbits
	.align	1
	.global	caribou_semaphore_try_wait
	.code	16
	.thumb_func
	.type	caribou_semaphore_try_wait, %function
caribou_semaphore_try_wait:
.LFB38:
	.loc 1 133 0
.LVL46:
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
.LCFI4:
	.loc 1 133 0
	mov	r4, r0
	str	r2, [sp, #4]
	.loc 1 135 0
	bl	chip_interrupts_disable
.LVL47:
	.loc 1 136 0
	ldr	r3, [r4]
	.loc 1 135 0
	mov	r7, r0
.LVL48:
	.loc 1 136 0
	sub	r3, r3, #1
	str	r3, [r4]
	.loc 1 134 0
	mov	r5, #1
	.loc 1 136 0
	cmp	r3, #0
	bge	.L36
	.loc 1 138 0
	ldr	r6, [r4, #4]
	cmp	r6, #0
	beq	.L37
	.loc 1 138 0 is_stmt 0 discriminator 1
	bl	caribou_thread_current
.LVL49:
	mov	r1, r0
	mov	r0, r6
	bl	caribou_queue_try_post
.LVL50:
	cmp	r0, #0
	beq	.L37
	.loc 1 140 0 is_stmt 1
	bl	chip_interrupts_enable
.LVL51:
	.loc 1 141 0
	bl	caribou_thread_current
.LVL52:
	ldr	r1, [sp, #4]
	bl	caribou_thread_sleep
.LVL53:
	.loc 1 142 0
	bl	chip_interrupts_disable
.LVL54:
	b	.L36
.L37:
	.loc 1 146 0
	ldr	r3, [r4]
	.loc 1 147 0
	mov	r5, #0
	.loc 1 146 0
	add	r3, r3, #1
	str	r3, [r4]
.LVL55:
.L36:
	.loc 1 150 0
	mov	r0, r7
	bl	chip_interrupts_set
.LVL56:
	.loc 1 152 0
	@ sp needed
	mov	r0, r5
.LVL57:
.LVL58:
.LVL59:
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.LFE38:
	.size	caribou_semaphore_try_wait, .-caribou_semaphore_try_wait
	.section	.text.caribou_semaphore_wait,"ax",%progbits
	.align	1
	.global	caribou_semaphore_wait
	.code	16
	.thumb_func
	.type	caribou_semaphore_wait, %function
caribou_semaphore_wait:
.LFB37:
	.loc 1 115 0
.LVL60:
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
.LCFI5:
	.loc 1 115 0
	mov	r7, r0
	mov	r4, r2
	mov	r5, r3
	.loc 1 116 0
	bl	caribou_timer_ticks
.LVL61:
	str	r0, [sp]
	str	r1, [sp, #4]
.LVL62:
.L46:
	.loc 1 117 0 discriminator 1
	mov	r0, r7
	mov	r2, r4
	mov	r3, r5
	bl	caribou_semaphore_try_wait
.LVL63:
	sub	r6, r0, #0
	bne	.L49
	.loc 1 119 0
	ldr	r0, [sp]
	ldr	r1, [sp, #4]
	mov	r2, r4
	mov	r3, r5
	bl	caribou_timer_ticks_timeout
.LVL64:
	cmp	r0, #0
	bne	.L47
	.loc 1 121 0
	bl	caribou_thread_yield
.LVL65:
	b	.L46
.L49:
	.loc 1 123 0
	mov	r6, #1
.L47:
	.loc 1 124 0
	mov	r0, r6
	@ sp needed
.LVL66:
	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
.LFE37:
	.size	caribou_semaphore_wait, .-caribou_semaphore_wait
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
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI1-.LFB34
	.byte	0xe
	.uleb128 0x18
	.byte	0x83
	.uleb128 0x6
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
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI2-.LFB36
	.byte	0xe
	.uleb128 0x18
	.byte	0x80
	.uleb128 0x6
	.byte	0x81
	.uleb128 0x5
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI4-.LFB38
	.byte	0xe
	.uleb128 0x20
	.byte	0x80
	.uleb128 0x8
	.byte	0x81
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x6
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
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI5-.LFB37
	.byte	0xe
	.uleb128 0x20
	.byte	0x80
	.uleb128 0x8
	.byte	0x81
	.uleb128 0x7
	.byte	0x82
	.uleb128 0x6
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
	.align	2
.LEFDE12:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 4 "../../../../include/caribou/kernel/timer.h"
	.file 5 "../../../../include/caribou/lib/errno.h"
	.file 6 "../../../../include/caribou/kernel/thread.h"
	.file 7 "../../../../include/caribou/lib/queue.h"
	.file 8 "../../../../include/caribou/lib/semaphore.h"
	.file 9 "../../../../include/caribou/lib/heap.h"
	.file 10 "../../../../include/caribou/lib/string.h"
	.file 11 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/chip.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x7ee
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x1
	.4byte	.LASF80
	.4byte	.LASF81
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0xf
	.4byte	0x3e
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x14
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x15
	.4byte	0x62
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x16
	.4byte	0x74
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x17
	.4byte	0x86
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x23
	.4byte	0x98
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x24
	.4byte	0x25
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x6
	.byte	0x4
	.4byte	0xc0
	.uleb128 0x7
	.4byte	0xb3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x16
	.4byte	0x86
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x4
	.byte	0x2f
	.4byte	0xe2
	.uleb128 0x8
	.4byte	0xaa
	.4byte	0xfb
	.uleb128 0x9
	.4byte	0xaa
	.uleb128 0x9
	.4byte	0xfb
	.uleb128 0x9
	.4byte	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x101
	.uleb128 0xa
	.4byte	.LASF28
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x1c
	.byte	0x4
	.byte	0x38
	.4byte	0x167
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x4
	.byte	0x3b
	.4byte	0x167
	.byte	0
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x4
	.byte	0x3d
	.4byte	0x167
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x4
	.byte	0x3f
	.4byte	0x16d
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF22
	.byte	0x4
	.byte	0x41
	.4byte	0xaa
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF23
	.byte	0x4
	.byte	0x43
	.4byte	0x7b
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF24
	.byte	0x4
	.byte	0x45
	.4byte	0x7b
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF25
	.byte	0x4
	.byte	0x47
	.4byte	0x33
	.byte	0x18
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x106
	.uleb128 0x6
	.byte	0x4
	.4byte	0xd7
	.uleb128 0x3
	.4byte	.LASF26
	.byte	0x4
	.byte	0x48
	.4byte	0x106
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x5
	.2byte	0x108
	.4byte	0x74
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x48
	.byte	0x6
	.byte	0x1f
	.4byte	0x262
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x6
	.byte	0x22
	.4byte	0x262
	.byte	0
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x6
	.byte	0x25
	.4byte	0x262
	.byte	0x4
	.uleb128 0xe
	.ascii	"sp\000"
	.byte	0x6
	.byte	0x28
	.4byte	0xaa
	.byte	0x8
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x6
	.byte	0x2b
	.4byte	0xaa
	.byte	0xc
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x6
	.byte	0x2e
	.4byte	0xaa
	.byte	0x10
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x6
	.byte	0x31
	.4byte	0xaa
	.byte	0x14
	.uleb128 0xc
	.4byte	.LASF34
	.byte	0x6
	.byte	0x34
	.4byte	0xaa
	.byte	0x18
	.uleb128 0xc
	.4byte	.LASF35
	.byte	0x6
	.byte	0x37
	.4byte	0x57
	.byte	0x1c
	.uleb128 0xc
	.4byte	.LASF36
	.byte	0x6
	.byte	0x3a
	.4byte	0x45
	.byte	0x1e
	.uleb128 0xc
	.4byte	.LASF37
	.byte	0x6
	.byte	0x3d
	.4byte	0xba
	.byte	0x20
	.uleb128 0xe
	.ascii	"arg\000"
	.byte	0x6
	.byte	0x40
	.4byte	0xaa
	.byte	0x24
	.uleb128 0xc
	.4byte	.LASF38
	.byte	0x6
	.byte	0x43
	.4byte	0x9f
	.byte	0x28
	.uleb128 0xc
	.4byte	.LASF39
	.byte	0x6
	.byte	0x46
	.4byte	0x45
	.byte	0x30
	.uleb128 0xc
	.4byte	.LASF40
	.byte	0x6
	.byte	0x49
	.4byte	0x273
	.byte	0x34
	.uleb128 0xc
	.4byte	.LASF41
	.byte	0x6
	.byte	0x4c
	.4byte	0x279
	.byte	0x38
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x6
	.byte	0x4f
	.4byte	0x17e
	.byte	0x3c
	.uleb128 0xc
	.4byte	.LASF43
	.byte	0x6
	.byte	0x52
	.4byte	0x45
	.byte	0x40
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x18a
	.uleb128 0xf
	.4byte	0x273
	.uleb128 0x9
	.4byte	0xaa
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x268
	.uleb128 0x6
	.byte	0x4
	.4byte	0x173
	.uleb128 0x3
	.4byte	.LASF44
	.byte	0x6
	.byte	0x55
	.4byte	0x18a
	.uleb128 0x6
	.byte	0x4
	.4byte	0x27f
	.uleb128 0x10
	.4byte	.LASF82
	.byte	0x7
	.byte	0x1e
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0xc
	.byte	0x7
	.byte	0x20
	.4byte	0x2c8
	.uleb128 0xc
	.4byte	.LASF46
	.byte	0x7
	.byte	0x22
	.4byte	0x74
	.byte	0
	.uleb128 0xc
	.4byte	.LASF47
	.byte	0x7
	.byte	0x23
	.4byte	0x74
	.byte	0x4
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x7
	.byte	0x24
	.4byte	0x2c8
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2ce
	.uleb128 0x6
	.byte	0x4
	.4byte	0x290
	.uleb128 0x3
	.4byte	.LASF49
	.byte	0x7
	.byte	0x25
	.4byte	0x297
	.uleb128 0xb
	.4byte	.LASF50
	.byte	0x8
	.byte	0x8
	.byte	0x1b
	.4byte	0x304
	.uleb128 0xc
	.4byte	.LASF47
	.byte	0x8
	.byte	0x1d
	.4byte	0x74
	.byte	0
	.uleb128 0xc
	.4byte	.LASF51
	.byte	0x8
	.byte	0x1e
	.4byte	0x304
	.byte	0x4
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x2d4
	.uleb128 0x3
	.4byte	.LASF52
	.byte	0x8
	.byte	0x1f
	.4byte	0x2df
	.uleb128 0x11
	.4byte	.LASF53
	.byte	0x1
	.byte	0x1b
	.4byte	0x393
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x393
	.uleb128 0x12
	.4byte	.LASF46
	.byte	0x1
	.byte	0x1b
	.4byte	0x74
	.4byte	.LLST0
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x1
	.byte	0x1b
	.4byte	0x74
	.4byte	.LLST1
	.uleb128 0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0x1d
	.4byte	0x393
	.4byte	.LLST2
	.uleb128 0x14
	.4byte	.LVL2
	.4byte	0x6c6
	.4byte	0x36e
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x14
	.4byte	.LVL5
	.4byte	0x6db
	.4byte	0x382
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL7
	.4byte	0x6f0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.4byte	0x30a
	.uleb128 0x11
	.4byte	.LASF54
	.byte	0x1
	.byte	0x3f
	.4byte	0x393
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x426
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.byte	0x3f
	.4byte	0x393
	.4byte	.LLST3
	.uleb128 0x12
	.4byte	.LASF51
	.byte	0x1
	.byte	0x3f
	.4byte	0x304
	.4byte	.LLST4
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x1
	.byte	0x3f
	.4byte	0x74
	.4byte	.LLST5
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0x41
	.4byte	0x74
	.4byte	.LLST6
	.uleb128 0x17
	.4byte	.LVL12
	.4byte	0x701
	.uleb128 0x14
	.4byte	.LVL15
	.4byte	0x70c
	.4byte	0x415
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x38
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL16
	.4byte	0x72b
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF56
	.byte	0x1
	.byte	0x49
	.4byte	0x304
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x44f
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.byte	0x49
	.4byte	0x393
	.4byte	.LLST7
	.byte	0
	.uleb128 0x11
	.4byte	.LASF57
	.byte	0x1
	.byte	0x57
	.4byte	0xb3
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4fb
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.byte	0x57
	.4byte	0x393
	.4byte	.LLST8
	.uleb128 0x18
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x59
	.4byte	0xb3
	.4byte	.LLST9
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0x5a
	.4byte	0x74
	.4byte	.LLST10
	.uleb128 0x19
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x4e1
	.uleb128 0x1a
	.4byte	.LASF58
	.byte	0x1
	.byte	0x5d
	.4byte	0x28a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LVL27
	.4byte	0x73c
	.4byte	0x4d7
	.uleb128 0x15
	.uleb128 0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.uleb128 0xb
	.byte	0xf4
	.uleb128 0x25
	.byte	0x8
	.8byte	0xffffffffffffffff
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7d
	.sleb128 4
	.byte	0
	.uleb128 0x17
	.4byte	.LVL30
	.4byte	0x75b
	.byte	0
	.uleb128 0x17
	.4byte	.LVL24
	.4byte	0x701
	.uleb128 0x16
	.4byte	.LVL33
	.4byte	0x72b
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF83
	.byte	0x1
	.byte	0x2f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x583
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.byte	0x2f
	.4byte	0x393
	.4byte	.LLST11
	.uleb128 0x1c
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0x33
	.4byte	0x74
	.4byte	.LLST12
	.uleb128 0x17
	.4byte	.LVL38
	.4byte	0x701
	.uleb128 0x14
	.4byte	.LVL41
	.4byte	0x44f
	.4byte	0x554
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL42
	.4byte	0x76c
	.uleb128 0x14
	.4byte	.LVL43
	.4byte	0x6f0
	.4byte	0x571
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL44
	.4byte	0x72b
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF59
	.byte	0x1
	.byte	0x84
	.4byte	0xb3
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x63e
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.byte	0x84
	.4byte	0x393
	.4byte	.LLST13
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x84
	.4byte	0x8d
	.4byte	.LLST14
	.uleb128 0x18
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x86
	.4byte	0xb3
	.4byte	.LLST15
	.uleb128 0x13
	.4byte	.LASF35
	.byte	0x1
	.byte	0x87
	.4byte	0x74
	.4byte	.LLST16
	.uleb128 0x17
	.4byte	.LVL47
	.4byte	0x701
	.uleb128 0x17
	.4byte	.LVL49
	.4byte	0x77d
	.uleb128 0x14
	.4byte	.LVL50
	.4byte	0x788
	.4byte	0x5fd
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL51
	.4byte	0x7a2
	.uleb128 0x17
	.4byte	.LVL52
	.4byte	0x77d
	.uleb128 0x14
	.4byte	.LVL53
	.4byte	0x7a9
	.4byte	0x624
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x7d
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.4byte	.LVL54
	.4byte	0x701
	.uleb128 0x16
	.4byte	.LVL56
	.4byte	0x72b
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF61
	.byte	0x1
	.byte	0x72
	.4byte	0xb3
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c6
	.uleb128 0x12
	.4byte	.LASF55
	.byte	0x1
	.byte	0x72
	.4byte	0x393
	.4byte	.LLST17
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x72
	.4byte	0x8d
	.4byte	.LLST18
	.uleb128 0x1a
	.4byte	.LASF62
	.byte	0x1
	.byte	0x74
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x17
	.4byte	.LVL61
	.4byte	0x7bf
	.uleb128 0x14
	.4byte	.LVL63
	.4byte	0x583
	.4byte	0x6a0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL64
	.4byte	0x7d0
	.4byte	0x6bc
	.uleb128 0x15
	.uleb128 0x6
	.byte	0x50
	.byte	0x93
	.uleb128 0x4
	.byte	0x51
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x5
	.byte	0x7d
	.sleb128 0
	.byte	0xf6
	.byte	0x8
	.uleb128 0x25
	.byte	0
	.uleb128 0x17
	.4byte	.LVL65
	.4byte	0x7ea
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF63
	.byte	0x9
	.byte	0x1d
	.4byte	0xaa
	.4byte	0x6db
	.uleb128 0x9
	.4byte	0xcc
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF64
	.byte	0x7
	.byte	0x46
	.4byte	0x304
	.4byte	0x6f0
	.uleb128 0x9
	.4byte	0x74
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF66
	.byte	0x9
	.byte	0x20
	.4byte	0x701
	.uleb128 0x9
	.4byte	0xaa
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF71
	.byte	0xb
	.byte	0x45
	.4byte	0x74
	.uleb128 0x1d
	.4byte	.LASF65
	.byte	0xa
	.byte	0x29
	.4byte	0xaa
	.4byte	0x72b
	.uleb128 0x9
	.4byte	0xaa
	.uleb128 0x9
	.4byte	0x74
	.uleb128 0x9
	.4byte	0xcc
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF67
	.byte	0xb
	.byte	0x47
	.4byte	0x73c
	.uleb128 0x9
	.4byte	0x74
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF68
	.byte	0x7
	.byte	0x51
	.4byte	0xb3
	.4byte	0x75b
	.uleb128 0x9
	.4byte	0x304
	.uleb128 0x9
	.4byte	0x2c8
	.uleb128 0x9
	.4byte	0x8d
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF69
	.byte	0x6
	.byte	0xcd
	.4byte	0x76c
	.uleb128 0x9
	.4byte	0x28a
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF70
	.byte	0x7
	.byte	0x47
	.4byte	0x77d
	.uleb128 0x9
	.4byte	0x304
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF72
	.byte	0x6
	.byte	0xb8
	.4byte	0x28a
	.uleb128 0x1d
	.4byte	.LASF73
	.byte	0x7
	.byte	0x52
	.4byte	0xb3
	.4byte	0x7a2
	.uleb128 0x9
	.4byte	0x304
	.uleb128 0x9
	.4byte	0x2ce
	.byte	0
	.uleb128 0x20
	.4byte	.LASF77
	.byte	0xb
	.byte	0x44
	.uleb128 0x1e
	.4byte	.LASF74
	.byte	0x6
	.byte	0xcc
	.4byte	0x7bf
	.uleb128 0x9
	.4byte	0x28a
	.uleb128 0x9
	.4byte	0x69
	.byte	0
	.uleb128 0x21
	.4byte	.LASF75
	.byte	0x4
	.byte	0x6e
	.4byte	0x8d
	.4byte	0x7d0
	.uleb128 0x22
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF76
	.byte	0x4
	.byte	0x6c
	.4byte	0xb3
	.4byte	0x7ea
	.uleb128 0x9
	.4byte	0x8d
	.uleb128 0x9
	.4byte	0x8d
	.byte	0
	.uleb128 0x20
	.4byte	.LASF78
	.byte	0x6
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL6
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL2-1
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL10
	.4byte	.LFE32
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL4
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL9
	.4byte	.LFE32
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL12-1
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17
	.4byte	.LFE34
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL12-1
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL19
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL12-1
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL20
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL14
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL22
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24-1
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL34
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL23
	.4byte	.LVL28
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL29
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL32
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL35
	.4byte	.LFE36
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL38-1
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL45
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL46
	.4byte	.LVL47-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL47-1
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL57
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL46
	.4byte	.LVL47-1
	.2byte	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL47-1
	.4byte	.LFE38
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL46
	.4byte	.LVL55
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL58
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL58
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL48
	.4byte	.LVL49-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL49-1
	.4byte	.LVL59
	.2byte	0x1
	.byte	0x57
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL60
	.4byte	.LVL61-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL61-1
	.4byte	.LVL66
	.2byte	0x1
	.byte	0x57
	.4byte	.LVL66
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL60
	.4byte	.LVL61-1
	.2byte	0x6
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL61-1
	.4byte	.LFE37
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x2
	.uleb128 0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x4c
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
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF23:
	.ascii	"ticks\000"
.LASF52:
	.ascii	"caribou_semaphore_t\000"
.LASF82:
	.ascii	"caribou_queue_msg_t\000"
.LASF44:
	.ascii	"caribou_thread_t\000"
.LASF35:
	.ascii	"state\000"
.LASF13:
	.ascii	"uint64_t\000"
.LASF5:
	.ascii	"short int\000"
.LASF17:
	.ascii	"size_t\000"
.LASF63:
	.ascii	"malloc\000"
.LASF16:
	.ascii	"sizetype\000"
.LASF81:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF24:
	.ascii	"reloadticks\000"
.LASF69:
	.ascii	"caribou_thread_wakeup\000"
.LASF22:
	.ascii	"fnarg\000"
.LASF55:
	.ascii	"semaphore\000"
.LASF72:
	.ascii	"caribou_thread_current\000"
.LASF11:
	.ascii	"int64_t\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF41:
	.ascii	"timer\000"
.LASF30:
	.ascii	"parent\000"
.LASF57:
	.ascii	"caribou_semaphore_signal\000"
.LASF66:
	.ascii	"free\000"
.LASF61:
	.ascii	"caribou_semaphore_wait\000"
.LASF53:
	.ascii	"caribou_semaphore_new\000"
.LASF71:
	.ascii	"chip_interrupts_disable\000"
.LASF12:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"long long unsigned int\000"
.LASF83:
	.ascii	"caribou_semaphore_delete\000"
.LASF65:
	.ascii	"memset\000"
.LASF14:
	.ascii	"long int\000"
.LASF50:
	.ascii	"_caribou_semaphore_t\000"
.LASF75:
	.ascii	"caribou_timer_ticks\000"
.LASF70:
	.ascii	"caribou_queue_delete\000"
.LASF51:
	.ascii	"queue\000"
.LASF37:
	.ascii	"name\000"
.LASF77:
	.ascii	"chip_interrupts_enable\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF27:
	.ascii	"errno_t\000"
.LASF34:
	.ascii	"stack_base\000"
.LASF76:
	.ascii	"caribou_timer_ticks_timeout\000"
.LASF1:
	.ascii	"signed char\000"
.LASF25:
	.ascii	"flags\000"
.LASF9:
	.ascii	"uint32_t\000"
.LASF38:
	.ascii	"runtime\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"uint16_t\000"
.LASF48:
	.ascii	"msgs\000"
.LASF58:
	.ascii	"thread\000"
.LASF43:
	.ascii	"sleep\000"
.LASF31:
	.ascii	"stack_usage\000"
.LASF21:
	.ascii	"timerfn\000"
.LASF62:
	.ascii	"start\000"
.LASF26:
	.ascii	"caribou_timer_t\000"
.LASF45:
	.ascii	"_caribou_queue_t\000"
.LASF15:
	.ascii	"char\000"
.LASF80:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/semaphore.c\000"
.LASF8:
	.ascii	"int32_t\000"
.LASF39:
	.ascii	"lock\000"
.LASF7:
	.ascii	"short unsigned int\000"
.LASF4:
	.ascii	"int16_t\000"
.LASF54:
	.ascii	"caribou_semaphore_init\000"
.LASF40:
	.ascii	"finishfn\000"
.LASF46:
	.ascii	"depth\000"
.LASF79:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF73:
	.ascii	"caribou_queue_try_post\000"
.LASF59:
	.ascii	"caribou_semaphore_try_wait\000"
.LASF74:
	.ascii	"caribou_thread_sleep\000"
.LASF29:
	.ascii	"_caribou_thread_t\000"
.LASF49:
	.ascii	"caribou_queue_t\000"
.LASF32:
	.ascii	"stack_low\000"
.LASF56:
	.ascii	"caribou_semaphore_queue\000"
.LASF64:
	.ascii	"caribou_queue_new\000"
.LASF47:
	.ascii	"count\000"
.LASF68:
	.ascii	"caribou_queue_take_first\000"
.LASF18:
	.ascii	"caribou_timer_callback_fn\000"
.LASF33:
	.ascii	"stack_top\000"
.LASF78:
	.ascii	"caribou_thread_yield\000"
.LASF67:
	.ascii	"chip_interrupts_set\000"
.LASF19:
	.ascii	"prev\000"
.LASF36:
	.ascii	"prio\000"
.LASF60:
	.ascii	"timeout\000"
.LASF20:
	.ascii	"next\000"
.LASF42:
	.ascii	"__errno\000"
.LASF28:
	.ascii	"_caribou_timer_t\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
