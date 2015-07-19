	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 1
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.code	16
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
	push	{r4, r5, r6, lr}
.LCFI0:
	mov	r5, r0
	mov	r6, r1
	mov	r0, #8
	bl	malloc
	sub	r4, r0, #0
	beq	.L2
	mov	r0, r5
	bl	caribou_queue_new
	str	r0, [r4, #4]
	cmp	r0, #0
	beq	.L3
	str	r6, [r4]
	b	.L2
.L3:
	mov	r0, r4
	bl	free
	mov	r4, #0
.L2:
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE32:
	.size	caribou_semaphore_new, .-caribou_semaphore_new
	.section	.text.caribou_semaphore_init,"ax",%progbits
	.align	2
	.global	caribou_semaphore_init
	.code	16
	.thumb_func
	.type	caribou_semaphore_init, %function
caribou_semaphore_init:
.LFB34:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI1:
	mov	r4, r0
	mov	r6, r1
	mov	r7, r2
	bl	chip_interrupts_disable
	mov	r5, r0
	mov	r0, r4
	mov	r1, #0
	mov	r2, #8
	bl	memset
	str	r7, [r4]
	str	r6, [r4, #4]
	mov	r0, r5
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE34:
	.size	caribou_semaphore_init, .-caribou_semaphore_init
	.section	.text.caribou_semaphore_queue,"ax",%progbits
	.align	2
	.global	caribou_semaphore_queue
	.code	16
	.thumb_func
	.type	caribou_semaphore_queue, %function
caribou_semaphore_queue:
.LFB35:
	cmp	r0, #0
	beq	.L7
	ldr	r0, [r0, #4]
	b	.L6
.L7:
	mov	r0, #0
.L6:
	@ sp needed
	bx	lr
.LFE35:
	.size	caribou_semaphore_queue, .-caribou_semaphore_queue
	.section	.text.caribou_semaphore_signal,"ax",%progbits
	.align	2
	.global	caribou_semaphore_signal
	.code	16
	.thumb_func
	.type	caribou_semaphore_signal, %function
caribou_semaphore_signal:
.LFB36:
	push	{r4, r5, r6, lr}
.LCFI2:
	sub	sp, sp, #8
.LCFI3:
	mov	r4, r0
	bl	chip_interrupts_disable
	mov	r6, r0
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	mov	r5, #1
	cmp	r3, #0
	bgt	.L9
.LBB2:
	ldr	r0, [r4, #4]
	cmp	r0, #0
	beq	.L10
	add	r1, sp, #4
	mov	r2, #1
	neg	r2, r2
	asr	r3, r2, #31
	bl	caribou_queue_take_first
	sub	r5, r0, #0
	beq	.L10
	ldr	r0, [sp, #4]
	bl	caribou_thread_wakeup
	b	.L9
.L10:
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	mov	r5, #0
.L9:
.LBE2:
	mov	r0, r6
	bl	chip_interrupts_set
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE36:
	.size	caribou_semaphore_signal, .-caribou_semaphore_signal
	.section	.text.caribou_semaphore_delete,"ax",%progbits
	.align	2
	.global	caribou_semaphore_delete
	.code	16
	.thumb_func
	.type	caribou_semaphore_delete, %function
caribou_semaphore_delete:
.LFB33:
	push	{r3, r4, r5, lr}
.LCFI4:
	sub	r4, r0, #0
	beq	.L13
.LBB3:
	bl	chip_interrupts_disable
	mov	r5, r0
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L15
	ldr	r3, [r4]
	cmp	r3, #0
	bge	.L16
.L17:
	mov	r0, r4
	bl	caribou_semaphore_signal
	ldr	r3, [r4]
	cmp	r3, #0
	blt	.L17
.L16:
	ldr	r0, [r4, #4]
	bl	caribou_queue_delete
.L15:
	mov	r0, r4
	bl	free
	mov	r0, r5
	bl	chip_interrupts_set
.L13:
.LBE3:
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE33:
	.size	caribou_semaphore_delete, .-caribou_semaphore_delete
	.section	.text.caribou_semaphore_try_wait,"ax",%progbits
	.align	2
	.global	caribou_semaphore_try_wait
	.code	16
	.thumb_func
	.type	caribou_semaphore_try_wait, %function
caribou_semaphore_try_wait:
.LFB38:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI5:
	mov	r4, r0
	mov	r7, r2
	bl	chip_interrupts_disable
	mov	r6, r0
	ldr	r3, [r4]
	sub	r3, r3, #1
	str	r3, [r4]
	mov	r5, #1
	cmp	r3, #0
	bge	.L19
	ldr	r5, [r4, #4]
	cmp	r5, #0
	beq	.L20
	bl	caribou_thread_current
	mov	r1, r0
	mov	r0, r5
	bl	caribou_queue_try_post
	cmp	r0, #0
	beq	.L20
	bl	chip_interrupts_enable
	bl	caribou_thread_current
	mov	r1, r7
	bl	caribou_thread_sleep
	bl	chip_interrupts_disable
	mov	r5, #1
	b	.L19
.L20:
	ldr	r3, [r4]
	add	r3, r3, #1
	str	r3, [r4]
	mov	r5, #0
.L19:
	mov	r0, r6
	bl	chip_interrupts_set
	mov	r0, r5
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE38:
	.size	caribou_semaphore_try_wait, .-caribou_semaphore_try_wait
	.section	.text.caribou_semaphore_wait,"ax",%progbits
	.align	2
	.global	caribou_semaphore_wait
	.code	16
	.thumb_func
	.type	caribou_semaphore_wait, %function
caribou_semaphore_wait:
.LFB37:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI6:
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
.LCFI7:
	mov	r9, r0
	mov	r4, r2
	mov	r5, r3
	bl	caribou_timer_ticks
	mov	r6, r0
	mov	r7, r1
	b	.L23
.L25:
	mov	r0, r6
	mov	r1, r7
	mov	r2, r4
	mov	r3, r5
	bl	caribou_timer_ticks_timeout
	cmp	r0, #0
	bne	.L24
	bl	caribou_thread_yield
.L23:
	mov	r0, r9
	mov	r2, r4
	mov	r3, r5
	bl	caribou_semaphore_try_wait
	mov	r8, r0
	cmp	r0, #0
	beq	.L25
	mov	r3, #1
	mov	r8, r3
.L24:
	mov	r0, r8
	@ sp needed
	pop	{r2, r3}
	mov	r8, r2
	mov	r9, r3
	pop	{r3, r4, r5, r6, r7, pc}
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0x18
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI4-.LFB33
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
	.4byte	.LCFI5-.LFB38
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
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI6-.LFB37
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
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.align	2
.LEFDE12:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/semaphore.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x91
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF7
	.byte	0x1
	.4byte	.LASF8
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x1b
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x3f
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x49
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x57
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x2f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x84
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0x72
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
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
.LASF7:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF8:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/semaphore.c\000"
.LASF3:
	.ascii	"caribou_semaphore_signal\000"
.LASF4:
	.ascii	"caribou_semaphore_delete\000"
.LASF5:
	.ascii	"caribou_semaphore_try_wait\000"
.LASF1:
	.ascii	"caribou_semaphore_init\000"
.LASF0:
	.ascii	"caribou_semaphore_new\000"
.LASF2:
	.ascii	"caribou_semaphore_queue\000"
.LASF6:
	.ascii	"caribou_semaphore_wait\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
