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
	.file	"interrupt.c"
	.text
.Ltext0:
	.section	.text.caribou_vector_installed,"ax",%progbits
	.align	2
	.global	caribou_vector_installed
	.code	16
	.thumb_func
	.type	caribou_vector_installed, %function
caribou_vector_installed:
.LFB33:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI0:
	mov	r6, r0
	mov	r4, r1
	mov	r5, r2
	bl	chip_interrupts_disable
	ldr	r3, .L9
	ldrb	r3, [r3]
	mov	r7, #0
	cmp	r3, r6
	bls	.L2
.LBB2:
	ldr	r3, .L9+4
	ldr	r3, [r3]
	lsl	r6, r6, #2
	ldr	r3, [r6, r3]
	cmp	r3, #0
	beq	.L6
.L4:
	ldr	r2, [r3]
	cmp	r2, r4
	bne	.L3
	ldr	r2, [r3, #4]
	cmp	r2, r5
	beq	.L7
.L3:
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L4
	b	.L8
.L6:
.LBE2:
	mov	r7, #0
	b	.L2
.L7:
.LBB3:
	mov	r7, #1
	b	.L2
.L8:
.LBE3:
	mov	r7, #0
.L2:
	bl	chip_interrupts_set
	mov	r0, r7
	@ sp needed
	pop	{r3, r4, r5, r6, r7, pc}
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE33:
	.size	caribou_vector_installed, .-caribou_vector_installed
	.section	.text.caribou_vector_install,"ax",%progbits
	.align	2
	.global	caribou_vector_install
	.code	16
	.thumb_func
	.type	caribou_vector_install, %function
caribou_vector_install:
.LFB34:
	push	{r4, r5, r6, r7, lr}
.LCFI1:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI2:
	mov	r6, r0
	mov	r10, r1
	mov	r9, r2
	bl	caribou_vector_installed
	cmp	r0, #0
	bne	.L20
.LBB11:
	bl	chip_interrupts_disable
	mov	r8, r0
	mov	r7, r6
	add	r5, r6, #1
.LBB12:
.LBB13:
	ldr	r3, .L22
	ldr	r3, [r3]
	cmp	r5, r3
	ble	.L13
	ldr	r4, .L22+4
	lsl	r1, r5, #2
	ldr	r0, [r4]
	bl	realloc
	str	r0, [r4]
	cmp	r0, #0
	beq	.L13
.LBB14:
	ldr	r3, .L22
	ldr	r3, [r3]
	cmp	r5, r3
	ble	.L14
	lsl	r4, r3, #2
	ldr	r1, .L22+4
	mov	r2, #0
.L15:
	ldr	r0, [r1]
	str	r2, [r0, r4]
	add	r3, r3, #1
	add	r4, r4, #4
	cmp	r5, r3
	bgt	.L15
.L14:
.LBE14:
	ldr	r3, .L22
	str	r5, [r3]
.L13:
	ldr	r3, .L22
.LBE13:
.LBE12:
	ldr	r3, [r3]
	cmp	r7, r3
	bge	.L16
.LBB15:
	mov	r0, #12
	bl	malloc
	sub	r4, r0, #0
	beq	.L16
.LBB16:
	mov	r1, #0
	mov	r2, #12
	bl	memset
	mov	r3, r10
	str	r3, [r4]
	mov	r0, r9
	str	r0, [r4, #4]
	lsl	r6, r6, #2
	ldr	r3, .L22+4
	ldr	r3, [r3]
	add	r6, r3, r6
	ldr	r2, [r6]
	cmp	r2, #0
	bne	.L21
	str	r4, [r6]
	b	.L16
.L21:
.LBB17:
	ldr	r3, [r2, #8]
	cmp	r3, #0
	beq	.L18
	mov	r2, r3
	b	.L21
.L18:
	str	r4, [r2, #8]
.L16:
.LBE17:
.LBE16:
.LBE15:
	mov	r0, r8
	bl	chip_interrupts_set
	b	.L12
.L20:
.LBE11:
	mov	r7, #1
	neg	r7, r7
.L12:
	mov	r0, r7
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE34:
	.size	caribou_vector_install, .-caribou_vector_install
	.section	.text.caribou_vector_remove,"ax",%progbits
	.align	2
	.global	caribou_vector_remove
	.code	16
	.thumb_func
	.type	caribou_vector_remove, %function
caribou_vector_remove:
.LFB35:
	push	{r4, r5, r6, r7, lr}
.LCFI3:
	mov	r7, r10
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
.LCFI4:
	mov	r8, r0
	mov	r6, r1
	lsl	r7, r0, #2
	ldr	r3, .L30
	ldr	r3, [r3]
	ldr	r4, [r3, r7]
	bl	chip_interrupts_disable
	mov	r10, r0
	cmp	r4, #0
	beq	.L25
	mov	r5, r4
	ldr	r2, .L30
	mov	r9, r2
.L29:
	ldr	r3, [r4]
	cmp	r3, r6
	bne	.L26
	mov	r2, r9
	ldr	r2, [r2]
	add	r3, r2, r7
	ldr	r2, [r3]
	cmp	r2, r4
	bne	.L27
	ldr	r2, [r2, #8]
	str	r2, [r3]
	b	.L28
.L27:
	ldr	r3, [r4, #8]
	str	r3, [r5, #8]
.L28:
	mov	r0, r4
	bl	free
	ldr	r4, [r5, #8]
.L26:
	ldr	r3, [r4, #8]
	cmp	r3, #0
	beq	.L25
	mov	r5, r4
	mov	r4, r3
	b	.L29
.L25:
	mov	r0, r10
	bl	chip_interrupts_set
	mov	r0, r8
	@ sp needed
	pop	{r2, r3, r4}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	pop	{r4, r5, r6, r7, pc}
.L31:
	.align	2
.L30:
	.word	.LANCHOR1
.LFE35:
	.size	caribou_vector_remove, .-caribou_vector_remove
	.section	.text.caribou_vector_remove_all,"ax",%progbits
	.align	2
	.global	caribou_vector_remove_all
	.code	16
	.thumb_func
	.type	caribou_vector_remove_all, %function
caribou_vector_remove_all:
.LFB36:
	push	{r4, r5, r6, r7, lr}
.LCFI5:
	mov	r7, fp
	mov	r6, r10
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6, r7}
.LCFI6:
	sub	sp, sp, #12
.LCFI7:
	mov	r8, r0
.LBB18:
	ldr	r3, .L40
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L33
	mov	r1, #0
	str	r1, [sp]
.LBB19:
	ldr	r2, .L40+4
	mov	fp, r2
.LBB20:
	mov	r10, r2
.LBE20:
.LBE19:
	ldr	r1, .L40
	mov	r9, r1
.L39:
	mov	r3, #255
	ldr	r2, [sp]
	and	r3, r2
.LBB23:
	lsl	r3, r3, #2
	str	r3, [sp, #4]
	mov	r1, fp
	ldr	r1, [r1]
	ldr	r4, [r1, r3]
	cmp	r4, #0
	beq	.L34
	mov	r7, r4
.L38:
.LBB21:
	bl	chip_interrupts_disable
	mov	r6, r0
	ldr	r2, [r4, #4]
	cmp	r2, r8
	bne	.L35
	mov	r1, r10
	ldr	r1, [r1]
	ldr	r2, [sp, #4]
	add	r3, r1, r2
	ldr	r2, [r3]
	cmp	r2, r4
	bne	.L36
	ldr	r2, [r2, #8]
	str	r2, [r3]
	b	.L37
.L36:
	ldr	r2, [r4, #8]
	str	r2, [r7, #8]
.L37:
	mov	r0, r4
	bl	free
	ldr	r4, [r7, #8]
.L35:
	ldr	r5, [r4, #8]
	mov	r0, r6
	bl	chip_interrupts_set
.LBE21:
	cmp	r5, #0
	beq	.L34
.LBB22:
	mov	r7, r4
	mov	r4, r5
	b	.L38
.L34:
.LBE22:
.LBE23:
	ldr	r3, [sp]
	add	r3, r3, #1
	str	r3, [sp]
	mov	r1, r9
	ldr	r1, [r1]
	cmp	r1, r3
	bgt	.L39
.L33:
.LBE18:
	mov	r0, #1
	add	sp, sp, #12
	@ sp needed
	pop	{r2, r3, r4, r5}
	mov	r8, r2
	mov	r9, r3
	mov	r10, r4
	mov	fp, r5
	pop	{r4, r5, r6, r7, pc}
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE36:
	.size	caribou_vector_remove_all, .-caribou_vector_remove_all
	.section	.text.caribou_interrupt_service,"ax",%progbits
	.align	2
	.weak	caribou_interrupt_service
	.code	16
	.thumb_func
	.type	caribou_interrupt_service, %function
caribou_interrupt_service:
.LFB37:
	push	{r3, r4, r5, lr}
.LCFI8:
	mov	r5, r0
	ldr	r3, .L45
	ldr	r3, [r3]
	lsl	r2, r0, #2
	ldr	r4, [r2, r3]
	cmp	r4, #0
	beq	.L42
.L44:
	mov	r0, r5
	ldr	r1, [r4, #4]
	ldr	r3, [r4]
	blx	r3
	ldr	r4, [r4, #8]
	cmp	r4, #0
	bne	.L44
.L42:
	@ sp needed
	pop	{r3, r4, r5, pc}
.L46:
	.align	2
.L45:
	.word	.LANCHOR1
.LFE37:
	.size	caribou_interrupt_service, .-caribou_interrupt_service
	.global	isr_map_size
	.global	isr_map
	.section	.bss.isr_map,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	isr_map, %object
	.size	isr_map, 4
isr_map:
	.space	4
	.section	.bss.isr_map_size,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	isr_map_size, %object
	.size	isr_map_size, 4
isr_map_size:
	.space	4
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
	.uleb128 0x14
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
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI3-.LFB35
	.byte	0xe
	.uleb128 0x14
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
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x20
	.byte	0x88
	.uleb128 0x8
	.byte	0x89
	.uleb128 0x7
	.byte	0x8a
	.uleb128 0x6
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI5-.LFB36
	.byte	0xe
	.uleb128 0x14
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
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x24
	.byte	0x88
	.uleb128 0x9
	.byte	0x89
	.uleb128 0x8
	.byte	0x8a
	.uleb128 0x7
	.byte	0x8b
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x30
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI8-.LFB37
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
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/kernel/interrupt.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x77
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF5
	.byte	0x1
	.4byte	.LASF6
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
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.byte	0x1d
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x52
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x77
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x98
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xba
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
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
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
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF3:
	.ascii	"caribou_vector_remove_all\000"
.LASF5:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF6:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/kernel/interrupt.c\000"
.LASF1:
	.ascii	"caribou_vector_install\000"
.LASF0:
	.ascii	"caribou_vector_installed\000"
.LASF7:
	.ascii	"isr_map_extend\000"
.LASF4:
	.ascii	"caribou_interrupt_service\000"
.LASF2:
	.ascii	"caribou_vector_remove\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
