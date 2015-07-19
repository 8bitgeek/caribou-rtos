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
	.file	"interrupt.c"
	.text
.Ltext0:
	.section	.text.caribou_vector_installed,"ax",%progbits
	.align	1
	.global	caribou_vector_installed
	.code	16
	.thumb_func
	.type	caribou_vector_installed, %function
caribou_vector_installed:
.LFB1:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../../src/kernel/interrupt.c"
	.loc 1 55 0
.LVL0:
	push	{r3, r4, r5, r6, r7, lr}
.LCFI0:
	.loc 1 55 0
	mov	r7, r0
	mov	r5, r1
	mov	r6, r2
	.loc 1 57 0
	bl	chip_interrupts_disable
.LVL1:
	.loc 1 58 0
	ldr	r3, .L10
	.loc 1 56 0
	mov	r4, #0
	.loc 1 58 0
	ldrb	r3, [r3]
	cmp	r3, r7
	bls	.L2
.LBB2:
	.loc 1 60 0
	ldr	r3, .L10+4
	lsl	r7, r7, #2
	ldr	r3, [r3]
	ldr	r3, [r7, r3]
.LVL2:
.L3:
	.loc 1 61 0 discriminator 1
	cmp	r3, #0
	beq	.L9
	.loc 1 63 0
	ldr	r2, [r3]
	cmp	r2, r5
	bne	.L4
	.loc 1 63 0 is_stmt 0 discriminator 1
	ldr	r2, [r3, #4]
	cmp	r2, r6
	beq	.L7
.L4:
	.loc 1 68 0 is_stmt 1
	ldr	r3, [r3, #8]
.LVL3:
	b	.L3
.L9:
.LBE2:
	.loc 1 56 0
	mov	r4, r3
.LBB3:
	b	.L2
.L7:
	.loc 1 65 0
	mov	r4, #1
.LVL4:
.L2:
.LBE3:
	.loc 1 71 0
	bl	chip_interrupts_set
.LVL5:
	.loc 1 73 0
	@ sp needed
	mov	r0, r4
.LVL6:
.LVL7:
.LVL8:
	pop	{r3, r4, r5, r6, r7, pc}
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE1:
	.size	caribou_vector_installed, .-caribou_vector_installed
	.section	.text.caribou_vector_install,"ax",%progbits
	.align	1
	.global	caribou_vector_install
	.code	16
	.thumb_func
	.type	caribou_vector_install, %function
caribou_vector_install:
.LFB2:
	.loc 1 83 0
.LVL9:
	push	{r4, r5, r6, r7, lr}
.LCFI1:
	sub	sp, sp, #20
.LCFI2:
	.loc 1 83 0
	mov	r4, r0
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	.loc 1 84 0
	bl	caribou_vector_installed
.LVL10:
	cmp	r0, #0
	bne	.L25
.LBB11:
	.loc 1 86 0
	bl	chip_interrupts_disable
.LVL11:
.LBB12:
.LBB13:
	.loc 1 31 0
	ldr	r6, .L33
.LBE13:
.LBE12:
	.loc 1 87 0
	add	r5, r4, #1
.LBB17:
.LBB15:
	.loc 1 31 0
	ldr	r3, [r6]
.LBE15:
.LBE17:
	.loc 1 86 0
	str	r0, [sp, #12]
.LVL12:
	.loc 1 87 0
	str	r4, [sp]
.LBB18:
.LBB16:
	.loc 1 31 0
	cmp	r5, r3
	ble	.L15
	.loc 1 33 0
	ldr	r7, .L33+4
	lsl	r1, r5, #2
	ldr	r0, [r7]
.LVL13:
	bl	realloc
.LVL14:
	str	r0, [r7]
	.loc 1 34 0
	cmp	r0, #0
	beq	.L15
.LBB14:
	.loc 1 37 0
	ldr	r3, [r6]
.LVL15:
	lsl	r2, r3, #2
.L17:
	cmp	r3, r5
	bge	.L32
	.loc 1 39 0
	ldr	r0, [r7]
	mov	r1, #0
	str	r1, [r0, r2]
	.loc 1 37 0
	add	r3, r3, #1
.LVL16:
	add	r2, r2, #4
	b	.L17
.L32:
.LBE14:
	.loc 1 41 0
	str	r5, [r6]
.LVL17:
.L15:
.LBE16:
.LBE18:
	.loc 1 87 0
	ldr	r3, [r6]
	cmp	r3, r4
	ble	.L20
.LBB19:
	.loc 1 89 0
	mov	r0, #12
	bl	malloc
.LVL18:
	sub	r5, r0, #0
.LVL19:
	.loc 1 90 0
	beq	.L20
.LBB20:
	.loc 1 92 0
	mov	r1, #0
	mov	r2, #12
	bl	memset
.LVL20:
	.loc 1 94 0
	ldr	r3, [sp, #8]
	.loc 1 93 0
	ldr	r1, [sp, #4]
	.loc 1 94 0
	str	r3, [r5, #4]
	.loc 1 95 0
	ldr	r3, .L33+4
	lsl	r4, r4, #2
.LVL21:
	ldr	r3, [r3]
	.loc 1 93 0
	str	r1, [r5]
	.loc 1 95 0
	add	r4, r3, r4
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L24
	.loc 1 97 0
	str	r5, [r4]
	b	.L20
.L24:
.LVL22:
.LBB21:
	.loc 1 102 0 discriminator 1
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L23
	.loc 1 102 0 is_stmt 0
	mov	r3, r2
.LVL23:
	b	.L24
.LVL24:
.L23:
	.loc 1 103 0 is_stmt 1
	str	r5, [r3, #8]
.LVL25:
.L20:
.LBE21:
.LBE20:
.LBE19:
	.loc 1 107 0
	ldr	r0, [sp, #12]
	bl	chip_interrupts_set
.LVL26:
	.loc 1 108 0
	b	.L13
.LVL27:
.L25:
.LBE11:
	.loc 1 110 0
	mov	r3, #1
	neg	r3, r3
	str	r3, [sp]
.L13:
	.loc 1 111 0
	ldr	r0, [sp]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE2:
	.size	caribou_vector_install, .-caribou_vector_install
	.section	.text.caribou_vector_remove,"ax",%progbits
	.align	1
	.global	caribou_vector_remove
	.code	16
	.thumb_func
	.type	caribou_vector_remove, %function
caribou_vector_remove:
.LFB3:
	.loc 1 120 0
.LVL28:
	push	{r4, r5, r6, r7, lr}
.LCFI3:
	.loc 1 121 0
	ldr	r7, .L42
	.loc 1 120 0
	sub	sp, sp, #20
.LCFI4:
	.loc 1 121 0
	ldr	r2, [r7]
	.loc 1 120 0
	str	r1, [sp, #12]
	.loc 1 121 0
	lsl	r1, r0, #2
.LVL29:
	ldr	r4, [r2, r1]
.LVL30:
	.loc 1 120 0
	mov	r6, r0
	.loc 1 121 0
	str	r1, [sp, #8]
	.loc 1 123 0
	bl	chip_interrupts_disable
.LVL31:
	.loc 1 122 0
	mov	r5, r4
	.loc 1 123 0
	str	r0, [sp, #4]
.LVL32:
.L36:
	.loc 1 124 0 discriminator 1
	cmp	r4, #0
	beq	.L41
	.loc 1 126 0
	ldr	r3, [r4]
	ldr	r1, [sp, #12]
	cmp	r3, r1
	bne	.L37
	.loc 1 128 0
	ldr	r3, [r7]
	ldr	r1, [sp, #8]
	add	r2, r3, r1
	ldr	r1, [r2]
	ldr	r3, [r4, #8]
	cmp	r4, r1
	bne	.L38
	.loc 1 130 0
	str	r3, [r2]
	b	.L39
.L38:
	.loc 1 134 0
	str	r3, [r5, #8]
.L39:
	.loc 1 136 0
	mov	r0, r4
	bl	free
.LVL33:
	.loc 1 137 0
	ldr	r4, [r5, #8]
.LVL34:
.L37:
	.loc 1 139 0
	mov	r5, r4
	.loc 1 140 0
	ldr	r4, [r4, #8]
.LVL35:
	b	.L36
.L41:
	.loc 1 142 0
	ldr	r0, [sp, #4]
	bl	chip_interrupts_set
.LVL36:
	.loc 1 144 0
	mov	r0, r6
	add	sp, sp, #20
	@ sp needed
.LVL37:
.LVL38:
	pop	{r4, r5, r6, r7, pc}
.L43:
	.align	2
.L42:
	.word	.LANCHOR1
.LFE3:
	.size	caribou_vector_remove, .-caribou_vector_remove
	.section	.text.caribou_vector_remove_all,"ax",%progbits
	.align	1
	.global	caribou_vector_remove_all
	.code	16
	.thumb_func
	.type	caribou_vector_remove_all, %function
caribou_vector_remove_all:
.LFB4:
	.loc 1 153 0
.LVL39:
	push	{r4, r5, r6, r7, lr}
.LCFI5:
	sub	sp, sp, #20
.LCFI6:
	.loc 1 153 0
	str	r0, [sp, #12]
.LBB22:
	.loc 1 154 0
	mov	r5, #0
.LVL40:
.L45:
	.loc 1 154 0 is_stmt 0 discriminator 1
	ldr	r3, .L54
	ldr	r3, [r3]
	cmp	r5, r3
	bge	.L52
.LBB23:
	.loc 1 156 0 is_stmt 1
	ldr	r7, .L54+4
	uxtb	r3, r5
	ldr	r1, [r7]
	lsl	r3, r3, #2
	ldr	r4, [r1, r3]
.LVL41:
	str	r3, [sp, #8]
	.loc 1 157 0
	mov	r6, r4
.LVL42:
.L46:
	.loc 1 158 0 discriminator 1
	cmp	r4, #0
	beq	.L53
.LBB24:
	.loc 1 160 0
	bl	chip_interrupts_disable
.LVL43:
	.loc 1 161 0
	ldr	r2, [r4, #4]
	ldr	r3, [sp, #12]
	.loc 1 160 0
	str	r0, [sp, #4]
.LVL44:
	.loc 1 161 0
	cmp	r2, r3
	bne	.L47
	.loc 1 163 0
	ldr	r1, [r7]
	ldr	r3, [sp, #8]
	add	r2, r1, r3
	ldr	r1, [r2]
	ldr	r3, [r4, #8]
	cmp	r4, r1
	bne	.L48
	.loc 1 165 0
	str	r3, [r2]
	b	.L49
.L48:
	.loc 1 169 0
	str	r3, [r6, #8]
.L49:
	.loc 1 171 0
	mov	r0, r4
.LVL45:
	bl	free
.LVL46:
	.loc 1 172 0
	ldr	r4, [r6, #8]
.LVL47:
.L47:
	.loc 1 175 0
	ldr	r2, [r4, #8]
	.loc 1 176 0
	ldr	r0, [sp, #4]
	.loc 1 175 0
	str	r2, [sp]
.LVL48:
	.loc 1 174 0
	mov	r6, r4
	.loc 1 176 0
	bl	chip_interrupts_set
.LVL49:
	.loc 1 175 0
	ldr	r4, [sp]
.LVL50:
	b	.L46
.LVL51:
.L53:
.LBE24:
.LBE23:
	.loc 1 154 0
	add	r5, r5, #1
.LVL52:
	b	.L45
.LVL53:
.L52:
.LBE22:
	.loc 1 180 0
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
.LVL54:
	pop	{r4, r5, r6, r7, pc}
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	.LANCHOR1
.LFE4:
	.size	caribou_vector_remove_all, .-caribou_vector_remove_all
	.section	.text.caribou_interrupt_service,"ax",%progbits
	.align	1
	.weak	caribou_interrupt_service
	.code	16
	.thumb_func
	.type	caribou_interrupt_service, %function
caribou_interrupt_service:
.LFB5:
	.loc 1 187 0
.LVL55:
	push	{r3, r4, r5, lr}
.LCFI7:
	.loc 1 192 0
	ldr	r3, .L60
	lsl	r2, r0, #2
	ldr	r3, [r3]
	.loc 1 187 0
	mov	r5, r0
	.loc 1 192 0
	ldr	r4, [r2, r3]
.LVL56:
.L57:
	.loc 1 193 0 discriminator 1
	cmp	r4, #0
	beq	.L59
	.loc 1 195 0
	ldr	r1, [r4, #4]
	ldr	r3, [r4]
	mov	r0, r5
	blx	r3
.LVL57:
	.loc 1 196 0
	ldr	r4, [r4, #8]
.LVL58:
	b	.L57
.L59:
	.loc 1 205 0
	@ sp needed
.LVL59:
	pop	{r3, r4, r5, pc}
.L61:
	.align	2
.L60:
	.word	.LANCHOR1
.LFE5:
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
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
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI1-.LFB2
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
	.uleb128 0x28
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI3-.LFB3
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
	.uleb128 0x28
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI5-.LFB4
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
	.uleb128 0x28
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI7-.LFB5
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stddef.h"
	.file 3 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/vectors.h"
	.file 4 "../../../../include/caribou/kernel/interrupt.h"
	.file 5 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/chip.h"
	.file 6 "../../../../include/caribou/lib/heap.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5e7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x1
	.4byte	.LASF62
	.4byte	.LASF63
	.4byte	.Ldebug_ranges0+0x38
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0x2
	.byte	0x16
	.4byte	0x48
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0x1a
	.4byte	0x148
	.uleb128 0x7
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF11
	.sleb128 1
	.uleb128 0x7
	.4byte	.LASF12
	.sleb128 2
	.uleb128 0x7
	.4byte	.LASF13
	.sleb128 3
	.uleb128 0x7
	.4byte	.LASF14
	.sleb128 4
	.uleb128 0x7
	.4byte	.LASF15
	.sleb128 5
	.uleb128 0x7
	.4byte	.LASF16
	.sleb128 6
	.uleb128 0x7
	.4byte	.LASF17
	.sleb128 7
	.uleb128 0x7
	.4byte	.LASF18
	.sleb128 8
	.uleb128 0x7
	.4byte	.LASF19
	.sleb128 9
	.uleb128 0x7
	.4byte	.LASF20
	.sleb128 10
	.uleb128 0x7
	.4byte	.LASF21
	.sleb128 11
	.uleb128 0x7
	.4byte	.LASF22
	.sleb128 12
	.uleb128 0x7
	.4byte	.LASF23
	.sleb128 13
	.uleb128 0x7
	.4byte	.LASF24
	.sleb128 14
	.uleb128 0x7
	.4byte	.LASF25
	.sleb128 15
	.uleb128 0x7
	.4byte	.LASF26
	.sleb128 16
	.uleb128 0x7
	.4byte	.LASF27
	.sleb128 17
	.uleb128 0x7
	.4byte	.LASF28
	.sleb128 18
	.uleb128 0x7
	.4byte	.LASF29
	.sleb128 19
	.uleb128 0x7
	.4byte	.LASF30
	.sleb128 20
	.uleb128 0x7
	.4byte	.LASF31
	.sleb128 21
	.uleb128 0x7
	.4byte	.LASF32
	.sleb128 22
	.uleb128 0x7
	.4byte	.LASF33
	.sleb128 23
	.uleb128 0x7
	.4byte	.LASF34
	.sleb128 24
	.uleb128 0x7
	.4byte	.LASF35
	.sleb128 25
	.uleb128 0x7
	.4byte	.LASF36
	.sleb128 26
	.uleb128 0x7
	.4byte	.LASF37
	.sleb128 27
	.uleb128 0x7
	.4byte	.LASF38
	.sleb128 28
	.uleb128 0x7
	.4byte	.LASF39
	.sleb128 29
	.uleb128 0x7
	.4byte	.LASF40
	.sleb128 30
	.uleb128 0x7
	.4byte	.LASF41
	.sleb128 31
	.byte	0
	.uleb128 0x5
	.4byte	.LASF43
	.byte	0x3
	.byte	0x3e
	.4byte	0x7f
	.uleb128 0x5
	.4byte	.LASF44
	.byte	0x4
	.byte	0x1a
	.4byte	0x15e
	.uleb128 0x8
	.byte	0x4
	.4byte	0x164
	.uleb128 0x9
	.4byte	0x174
	.uleb128 0xa
	.4byte	0x148
	.uleb128 0xa
	.4byte	0x5d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF64
	.byte	0xc
	.byte	0x1
	.byte	0x12
	.4byte	0x1a5
	.uleb128 0xc
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x153
	.byte	0
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x5d
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x1
	.byte	0x16
	.4byte	0x1a5
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x174
	.uleb128 0x5
	.4byte	.LASF46
	.byte	0x1
	.byte	0x17
	.4byte	0x174
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x1
	.byte	0x36
	.4byte	0x41
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x245
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x36
	.4byte	0x148
	.4byte	.LLST0
	.uleb128 0x10
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x153
	.4byte	.LLST1
	.uleb128 0x10
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x5d
	.4byte	.LLST2
	.uleb128 0x11
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x41
	.4byte	.LLST3
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.byte	0x39
	.4byte	0x41
	.4byte	.LLST4
	.uleb128 0x13
	.4byte	.Ldebug_ranges0+0
	.4byte	0x232
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x3c
	.4byte	0x245
	.4byte	.LLST5
	.byte	0
	.uleb128 0x14
	.4byte	.LVL1
	.4byte	0x581
	.uleb128 0x14
	.4byte	.LVL5
	.4byte	0x58c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1ab
	.uleb128 0x15
	.4byte	.LASF65
	.byte	0x1
	.byte	0x1d
	.4byte	0x41
	.byte	0x1
	.4byte	0x272
	.uleb128 0x16
	.4byte	.LASF66
	.byte	0x1
	.byte	0x1d
	.4byte	0x41
	.uleb128 0x17
	.uleb128 0x18
	.ascii	"n\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x41
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x1
	.byte	0x52
	.4byte	0x41
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3d6
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x52
	.4byte	0x148
	.4byte	.LLST6
	.uleb128 0x10
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x153
	.4byte	.LLST7
	.uleb128 0x10
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x5d
	.4byte	.LLST8
	.uleb128 0x19
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0x3b7
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.byte	0x56
	.4byte	0x41
	.4byte	.LLST9
	.uleb128 0x1a
	.4byte	0x24b
	.4byte	.LBB12
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x57
	.4byte	0x31a
	.uleb128 0x1b
	.4byte	0x25b
	.4byte	.LLST10
	.uleb128 0x19
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.4byte	0x307
	.uleb128 0x1c
	.4byte	0x267
	.4byte	.LLST11
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL14
	.4byte	0x59d
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x4
	.byte	0x75
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LBB19
	.4byte	.LBE19-.LBB19
	.4byte	0x39c
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0x59
	.4byte	0x245
	.4byte	.LLST12
	.uleb128 0x19
	.4byte	.LBB20
	.4byte	.LBE20-.LBB20
	.4byte	0x38c
	.uleb128 0x1f
	.4byte	.LASF57
	.byte	0x1
	.byte	0x5c
	.4byte	0x41
	.4byte	0x354
	.uleb128 0x20
	.byte	0
	.uleb128 0x19
	.4byte	.LBB21
	.4byte	.LBE21-.LBB21
	.4byte	0x371
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.byte	0x65
	.4byte	0x245
	.4byte	.LLST13
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL20
	.4byte	0x5b7
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1
	.byte	0x3c
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL18
	.4byte	0x5c8
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x1
	.byte	0x3c
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL11
	.4byte	0x581
	.uleb128 0x1d
	.4byte	.LVL26
	.4byte	0x58c
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL10
	.4byte	0x1b6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x1
	.byte	0x77
	.4byte	0x41
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x468
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x77
	.4byte	0x148
	.4byte	.LLST14
	.uleb128 0x10
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x153
	.4byte	.LLST15
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.byte	0x79
	.4byte	0x245
	.4byte	.LLST16
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x1
	.byte	0x7a
	.4byte	0x245
	.4byte	.LLST17
	.uleb128 0x21
	.4byte	.LASF48
	.byte	0x1
	.byte	0x7b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x14
	.4byte	.LVL31
	.4byte	0x581
	.uleb128 0x22
	.4byte	.LVL33
	.4byte	0x5dd
	.4byte	0x456
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL36
	.4byte	0x58c
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x1
	.byte	0x98
	.4byte	0x41
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x519
	.uleb128 0x10
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x98
	.4byte	0x5d
	.4byte	.LLST18
	.uleb128 0x23
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.uleb128 0x12
	.4byte	.LASF47
	.byte	0x1
	.byte	0x9a
	.4byte	0x41
	.4byte	.LLST19
	.uleb128 0x23
	.4byte	.LBB23
	.4byte	.LBE23-.LBB23
	.uleb128 0x12
	.4byte	.LASF45
	.byte	0x1
	.byte	0x9c
	.4byte	0x245
	.4byte	.LLST20
	.uleb128 0x12
	.4byte	.LASF53
	.byte	0x1
	.byte	0x9d
	.4byte	0x245
	.4byte	.LLST21
	.uleb128 0x23
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.byte	0xa0
	.4byte	0x41
	.4byte	.LLST22
	.uleb128 0x14
	.4byte	.LVL43
	.4byte	0x581
	.uleb128 0x22
	.4byte	.LVL46
	.4byte	0x5dd
	.4byte	0x504
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x74
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL49
	.4byte	0x58c
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF67
	.byte	0x1
	.byte	0xba
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x559
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0xba
	.4byte	0x148
	.4byte	.LLST23
	.uleb128 0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0xc0
	.4byte	0x245
	.4byte	.LLST24
	.uleb128 0x25
	.4byte	.LVL57
	.uleb128 0x1e
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x75
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x26
	.4byte	.LASF55
	.byte	0x1
	.byte	0x19
	.4byte	0x56a
	.uleb128 0x5
	.byte	0x3
	.4byte	isr_map
	.uleb128 0x8
	.byte	0x4
	.4byte	0x245
	.uleb128 0x26
	.4byte	.LASF56
	.byte	0x1
	.byte	0x1a
	.4byte	0x41
	.uleb128 0x5
	.byte	0x3
	.4byte	isr_map_size
	.uleb128 0x27
	.4byte	.LASF68
	.byte	0x5
	.byte	0x3e
	.4byte	0x41
	.uleb128 0x28
	.4byte	.LASF58
	.byte	0x5
	.byte	0x40
	.4byte	0x59d
	.uleb128 0xa
	.4byte	0x41
	.byte	0
	.uleb128 0x29
	.4byte	.LASF59
	.byte	0x6
	.byte	0x1e
	.4byte	0x5d
	.4byte	0x5b7
	.uleb128 0xa
	.4byte	0x5d
	.uleb128 0xa
	.4byte	0x74
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF57
	.byte	0x1
	.byte	0x5c
	.4byte	0x41
	.4byte	0x5c8
	.uleb128 0x20
	.byte	0
	.uleb128 0x29
	.4byte	.LASF60
	.byte	0x6
	.byte	0x1d
	.4byte	0x5d
	.4byte	0x5dd
	.uleb128 0xa
	.4byte	0x74
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF69
	.byte	0x6
	.byte	0x20
	.uleb128 0xa
	.4byte	0x5d
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x4
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
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
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL1-1
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL7
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL1-1
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL8
	.4byte	.LFE1
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL4
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL6
	.4byte	.LFE1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL1
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL9
	.4byte	.LVL10-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10-1
	.4byte	.LFE2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL9
	.4byte	.LVL10-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL10-1
	.4byte	.LFE2
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL9
	.4byte	.LVL10-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL10-1
	.4byte	.LFE2
	.2byte	0x2
	.byte	0x91
	.sleb128 -32
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL13
	.4byte	.LVL27
	.2byte	0x2
	.byte	0x91
	.sleb128 -28
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL12
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x3
	.byte	0x74
	.sleb128 1
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL27
	.2byte	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x1
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL19
	.4byte	.LVL20-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL20-1
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL28
	.4byte	.LVL31-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL31-1
	.4byte	.LFE3
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL29
	.4byte	.LFE3
	.2byte	0x2
	.byte	0x91
	.sleb128 -28
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL30
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x74
	.sleb128 8
	.4byte	.LVL35
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL32
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL35
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40
	.4byte	.LFE4
	.2byte	0x2
	.byte	0x91
	.sleb128 -28
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL40
	.4byte	.LVL54
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL41
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL48
	.4byte	.LVL49-1
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL49-1
	.4byte	.LVL51
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LVL51
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL42
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL47
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL50
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x56
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL45
	.4byte	.LVL51
	.2byte	0x2
	.byte	0x91
	.sleb128 -36
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL55
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL56
	.4byte	.LFE5
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL56
	.4byte	.LVL59
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
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
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB2
	.4byte	.LBE2
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	0
	.4byte	0
	.4byte	.LBB12
	.4byte	.LBE12
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	0
	.4byte	0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF29:
	.ascii	"Vector_TIM14\000"
.LASF30:
	.ascii	"Vector_TIM15\000"
.LASF31:
	.ascii	"Vector_TIM16\000"
.LASF32:
	.ascii	"Vector_TIM17\000"
.LASF60:
	.ascii	"malloc\000"
.LASF42:
	.ascii	"size_t\000"
.LASF67:
	.ascii	"caribou_interrupt_service\000"
.LASF20:
	.ascii	"Vector_DMA_CH2_3\000"
.LASF53:
	.ascii	"prev\000"
.LASF24:
	.ascii	"Vector_TIM1_CC\000"
.LASF10:
	.ascii	"Vector_WWDG\000"
.LASF25:
	.ascii	"Vector_TIM2\000"
.LASF26:
	.ascii	"Vector_TIM3\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF47:
	.ascii	"vector\000"
.LASF45:
	.ascii	"next\000"
.LASF33:
	.ascii	"Vector_I2C1\000"
.LASF34:
	.ascii	"Vector_I2C2\000"
.LASF5:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF39:
	.ascii	"Vector_Reserved2\000"
.LASF48:
	.ascii	"state\000"
.LASF7:
	.ascii	"long int\000"
.LASF56:
	.ascii	"isr_map_size\000"
.LASF23:
	.ascii	"Vector_TIM1_BRK_UP_TRG_COM\000"
.LASF62:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../."
	.ascii	"./src/kernel/interrupt.c\000"
.LASF52:
	.ascii	"caribou_vector_remove\000"
.LASF17:
	.ascii	"Vector_EXTI4_15\000"
.LASF15:
	.ascii	"Vector_EXTI0_1\000"
.LASF64:
	.ascii	"caribou_interrupt_handler_s\000"
.LASF46:
	.ascii	"caribou_interrupt_handler_t\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF65:
	.ascii	"isr_map_extend\000"
.LASF55:
	.ascii	"isr_map\000"
.LASF43:
	.ascii	"InterruptVector\000"
.LASF66:
	.ascii	"size\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF35:
	.ascii	"Vector_SPI1\000"
.LASF36:
	.ascii	"Vector_SPI2\000"
.LASF19:
	.ascii	"Vector_DMA_CH1\000"
.LASF44:
	.ascii	"caribou_isr_t\000"
.LASF18:
	.ascii	"Vector_TSC\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF51:
	.ascii	"caribou_vector_install\000"
.LASF13:
	.ascii	"Vector_FLASH\000"
.LASF54:
	.ascii	"caribou_vector_remove_all\000"
.LASF11:
	.ascii	"Vector_PVD\000"
.LASF61:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF68:
	.ascii	"chip_interrupts_disable\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF49:
	.ascii	"node\000"
.LASF2:
	.ascii	"short int\000"
.LASF28:
	.ascii	"Vector_Reserved1\000"
.LASF21:
	.ascii	"Vector_DMA_CH4_5\000"
.LASF40:
	.ascii	"Vector_CEC\000"
.LASF14:
	.ascii	"Vector_RCC\000"
.LASF41:
	.ascii	"Vector_SoftSysTick\000"
.LASF8:
	.ascii	"char\000"
.LASF22:
	.ascii	"Vector_ADC_COMP\000"
.LASF37:
	.ascii	"Vector_USART1\000"
.LASF38:
	.ascii	"Vector_USART2\000"
.LASF69:
	.ascii	"free\000"
.LASF58:
	.ascii	"chip_interrupts_set\000"
.LASF57:
	.ascii	"memset\000"
.LASF27:
	.ascii	"Vector_TIM6_DAC\000"
.LASF50:
	.ascii	"caribou_vector_installed\000"
.LASF16:
	.ascii	"Vector_EXTI2_3\000"
.LASF12:
	.ascii	"Vector_RTC\000"
.LASF59:
	.ascii	"realloc\000"
.LASF63:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
