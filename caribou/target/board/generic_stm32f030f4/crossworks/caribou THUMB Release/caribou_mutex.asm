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
	.file	"mutex.c"
	.text
.Ltext0:
	.section	.text.caribou_mutex_free,"ax",%progbits
	.align	2
	.global	caribou_mutex_free
	.code	16
	.thumb_func
	.type	caribou_mutex_free, %function
caribou_mutex_free:
.LFB33:
	push	{r3, lr}
.LCFI0:
	cmp	r0, #0
	beq	.L1
	bl	free
.L1:
	@ sp needed
	pop	{r3, pc}
.LFE33:
	.size	caribou_mutex_free, .-caribou_mutex_free
	.section	.text.caribou_mutex_init,"ax",%progbits
	.align	2
	.global	caribou_mutex_init
	.code	16
	.thumb_func
	.type	caribou_mutex_init, %function
caribou_mutex_init:
.LFB34:
	push	{r3, r4, r5, lr}
.LCFI1:
	mov	r4, r0
	mov	r5, r1
	mov	r1, #0
	mov	r2, #8
	bl	memset
	strb	r5, [r4, #5]
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE34:
	.size	caribou_mutex_init, .-caribou_mutex_init
	.section	.text.caribou_mutex_new,"ax",%progbits
	.align	2
	.global	caribou_mutex_new
	.code	16
	.thumb_func
	.type	caribou_mutex_new, %function
caribou_mutex_new:
.LFB32:
	push	{r3, r4, r5, lr}
.LCFI2:
	mov	r5, r0
	mov	r0, #8
	bl	malloc
	sub	r4, r0, #0
	beq	.L5
	mov	r1, r5
	bl	caribou_mutex_init
	mov	r2, #0
	ldr	r3, .L7
	str	r2, [r3]
	b	.L6
.L5:
	mov	r2, #12
	ldr	r3, .L7
	str	r2, [r3]
.L6:
	mov	r0, r4
	@ sp needed
	pop	{r3, r4, r5, pc}
.L8:
	.align	2
.L7:
	.word	__errno
.LFE32:
	.size	caribou_mutex_new, .-caribou_mutex_new
	.section	.text.caribou_mutex_trylock,"ax",%progbits
	.align	2
	.global	caribou_mutex_trylock
	.code	16
	.thumb_func
	.type	caribou_mutex_trylock, %function
caribou_mutex_trylock:
.LFB36:
	push	{r4, r5, r6, lr}
.LCFI3:
	mov	r4, r0
	bl	caribou_thread_current
	mov	r6, r0
	bl	caribou_lock
	ldrb	r3, [r4, #4]
	cmp	r3, #0
	beq	.L10
	mov	r5, #0
	ldr	r2, [r4]
	cmp	r2, r6
	bne	.L11
.L10:
	add	r3, r3, #1
	strb	r3, [r4, #4]
	str	r6, [r4]
	mov	r5, #1
.L11:
	bl	caribou_lock_set
	mov	r0, r5
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE36:
	.size	caribou_mutex_trylock, .-caribou_mutex_trylock
	.section	.text.caribou_mutex_lock,"ax",%progbits
	.align	2
	.global	caribou_mutex_lock
	.code	16
	.thumb_func
	.type	caribou_mutex_lock, %function
caribou_mutex_lock:
.LFB35:
	push	{r4, r5, r6, lr}
.LCFI4:
	sub	sp, sp, #32
.LCFI5:
	mov	r4, r0
	mov	r5, r1
	bl	caribou_lock
	ldrb	r3, [r4, #6]
	add	r3, r3, #1
	strb	r3, [r4, #6]
	bl	caribou_lock_set
	cmp	r5, #0
	beq	.L14
	add	r0, sp, #4
	mov	r1, r5
	bl	caribou_timer_set
	add	r0, sp, #4
	mov	r1, #0
	mov	r2, #0
	mov	r3, #2
	bl	caribou_timer_init
.L14:
	mov	r6, #1
	b	.L17
.L19:
	ldrb	r3, [r4, #5]
	tst	r6, r3
	bne	.L17
	bl	caribou_thread_yield
.L17:
	mov	r0, r4
	bl	caribou_mutex_trylock
	cmp	r0, #0
	bne	.L18
	cmp	r5, #0
	beq	.L19
	add	r0, sp, #4
	bl	caribou_timer_expired
	cmp	r0, #0
	beq	.L19
.L18:
	bl	caribou_lock
	ldrb	r3, [r4, #6]
	sub	r3, r3, #1
	strb	r3, [r4, #6]
	bl	caribou_lock_set
	mov	r0, #1
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE35:
	.size	caribou_mutex_lock, .-caribou_mutex_lock
	.section	.text.caribou_mutex_unlock,"ax",%progbits
	.align	2
	.global	caribou_mutex_unlock
	.code	16
	.thumb_func
	.type	caribou_mutex_unlock, %function
caribou_mutex_unlock:
.LFB37:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI6:
	mov	r4, r0
	bl	caribou_lock
	mov	r6, r0
	ldrb	r3, [r4, #4]
	mov	r5, #0
	cmp	r3, #0
	beq	.L21
	ldr	r7, [r4]
	bl	caribou_thread_current
	cmp	r7, r0
	bne	.L21
	ldrb	r3, [r4, #4]
	sub	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r4, #4]
	mov	r5, #1
	cmp	r3, #0
	bne	.L21
	str	r3, [r4]
.L21:
	ldrb	r3, [r4, #6]
	cmp	r3, #0
	beq	.L22
	mov	r0, r6
	bl	caribou_lock_set
	ldrb	r3, [r4, #5]
	lsl	r2, r3, #31
	bmi	.L23
	bl	caribou_thread_yield
	b	.L23
.L22:
	mov	r0, r6
	bl	caribou_lock_set
.L23:
	mov	r0, r5
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.LFE37:
	.size	caribou_mutex_unlock, .-caribou_mutex_unlock
	.section	.text.caribou_mutex_flags,"ax",%progbits
	.align	2
	.global	caribou_mutex_flags
	.code	16
	.thumb_func
	.type	caribou_mutex_flags, %function
caribou_mutex_flags:
.LFB38:
	push	{r4, lr}
.LCFI7:
	mov	r4, r0
	bl	caribou_lock
	ldrb	r4, [r4, #5]
	bl	caribou_lock_set
	mov	r0, r4
	@ sp needed
	pop	{r4, pc}
.LFE38:
	.size	caribou_mutex_flags, .-caribou_mutex_flags
	.section	.text.caribou_mutex_set_flags,"ax",%progbits
	.align	2
	.global	caribou_mutex_set_flags
	.code	16
	.thumb_func
	.type	caribou_mutex_set_flags, %function
caribou_mutex_set_flags:
.LFB39:
	push	{r3, r4, r5, lr}
.LCFI8:
	mov	r4, r0
	mov	r5, r1
	bl	caribou_lock
	strb	r5, [r4, #5]
	bl	caribou_lock_set
	@ sp needed
	pop	{r3, r4, r5, pc}
.LFE39:
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
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI2-.LFB32
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
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI3-.LFB36
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
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI4-.LFB35
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
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x30
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
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI7-.LFB38
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
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI8-.LFB39
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/mutex.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xa2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF8
	.byte	0x1
	.4byte	.LASF9
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x36
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x45
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x23
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x78
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0x56
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0x95
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0xc5
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
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
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x54
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"caribou_mutex_flags\000"
.LASF7:
	.ascii	"caribou_mutex_set_flags\000"
.LASF2:
	.ascii	"caribou_mutex_new\000"
.LASF8:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF4:
	.ascii	"caribou_mutex_lock\000"
.LASF3:
	.ascii	"caribou_mutex_trylock\000"
.LASF5:
	.ascii	"caribou_mutex_unlock\000"
.LASF9:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/mutex.c\000"
.LASF0:
	.ascii	"caribou_mutex_free\000"
.LASF1:
	.ascii	"caribou_mutex_init\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
