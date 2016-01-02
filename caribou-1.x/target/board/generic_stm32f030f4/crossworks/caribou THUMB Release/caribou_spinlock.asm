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
	mov	r3, #1
	str	r3, [r0]
	@ sp needed
	bx	lr
.LFE32:
	.size	caribou_spinlock_init, .-caribou_spinlock_init
	.section	.text.caribou_spinlock_trylock,"ax",%progbits
	.align	2
	.global	caribou_spinlock_trylock
	.code	16
	.thumb_func
	.type	caribou_spinlock_trylock, %function
caribou_spinlock_trylock:
.LFB34:
	push	{r4, r5, r6, lr}
.LCFI0:
	mov	r5, r0
	bl	chip_interrupts_disable
	mov	r6, r0
	ldr	r4, [r5]
	sub	r4, r4, #1
	neg	r3, r4
	adc	r4, r4, r3
	uxtb	r4, r4
	cmp	r4, #0
	beq	.L3
	bl	caribou_thread_current
	str	r0, [r5]
.L3:
	mov	r0, r6
	bl	chip_interrupts_set
	mov	r0, r4
	@ sp needed
	pop	{r4, r5, r6, pc}
.LFE34:
	.size	caribou_spinlock_trylock, .-caribou_spinlock_trylock
	.section	.text.caribou_spinlock_lock,"ax",%progbits
	.align	2
	.global	caribou_spinlock_lock
	.code	16
	.thumb_func
	.type	caribou_spinlock_lock, %function
caribou_spinlock_lock:
.LFB33:
	push	{r4, lr}
.LCFI1:
	mov	r4, r0
	b	.L5
.L6:
	bl	caribou_thread_yield
.L5:
	mov	r0, r4
	bl	caribou_spinlock_trylock
	cmp	r0, #0
	beq	.L6
	mov	r0, #1
	@ sp needed
	pop	{r4, pc}
.LFE33:
	.size	caribou_spinlock_lock, .-caribou_spinlock_lock
	.section	.text.caribou_spinlock_unlock,"ax",%progbits
	.align	2
	.global	caribou_spinlock_unlock
	.code	16
	.thumb_func
	.type	caribou_spinlock_unlock, %function
caribou_spinlock_unlock:
.LFB35:
	push	{r4, lr}
.LCFI2:
	mov	r4, r0
	bl	chip_interrupts_disable
	mov	r3, #1
	str	r3, [r4]
	bl	chip_interrupts_set
	mov	r0, #1
	@ sp needed
	pop	{r4, pc}
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
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/lib/spinlock.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF4
	.byte	0x1
	.4byte	.LASF5
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x18
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x26
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x1
	.byte	0x1e
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.byte	0x32
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.uleb128 0x2117
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
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
.LASF4:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF2:
	.ascii	"caribou_spinlock_lock\000"
.LASF5:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/lib/spinlock.c\000"
.LASF0:
	.ascii	"caribou_spinlock_init\000"
.LASF3:
	.ascii	"caribou_spinlock_unlock\000"
.LASF1:
	.ascii	"caribou_spinlock_trylock\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
