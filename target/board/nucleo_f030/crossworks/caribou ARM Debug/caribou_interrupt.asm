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
	.file	"interrupt.c"
	.text
.Ltext0:
	.global	isr_map
	.section	.bss.isr_map,"aw",%nobits
	.align	2
	.type	isr_map, %object
	.size	isr_map, 4
isr_map:
	.space	4
	.global	isr_map_size
	.section	.bss.isr_map_size,"aw",%nobits
	.align	2
	.type	isr_map_size, %object
	.size	isr_map_size, 4
isr_map_size:
	.space	4
	.section	.text.isr_map_extend,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	isr_map_extend, %function
isr_map_extend:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../../src/kernel/interrupt.c"
	.loc 1 30 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #16
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 31 0
	ldr	r3, .L6
	ldr	r3, [r3]
	ldr	r2, [r7, #4]
	cmp	r2, r3
	ble	.L2
	.loc 1 33 0
	ldr	r3, .L6+4
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	movs	r1, r3
	movs	r0, r2
	bl	realloc
	movs	r2, r0
	ldr	r3, .L6+4
	str	r2, [r3]
	.loc 1 34 0
	ldr	r3, .L6+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L2
.LBB2:
	.loc 1 37 0
	ldr	r3, .L6
	ldr	r3, [r3]
	str	r3, [r7, #12]
	b	.L3
.L4:
	.loc 1 39 0 discriminator 3
	ldr	r3, .L6+4
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	movs	r2, #0
	str	r2, [r3]
	.loc 1 37 0 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L3:
	.loc 1 37 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	blt	.L4
.LBE2:
	.loc 1 41 0 is_stmt 1
	ldr	r3, .L6
	ldr	r2, [r7, #4]
	str	r2, [r3]
.L2:
	.loc 1 44 0
	ldr	r3, .L6
	ldr	r3, [r3]
	.loc 1 45 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L7:
	.align	2
.L6:
	.word	isr_map_size
	.word	isr_map
.LFE32:
	.size	isr_map_extend, .-isr_map_extend
	.section	.text.caribou_vector_installed,"ax",%progbits
	.align	2
	.global	caribou_vector_installed
	.code	16
	.thumb_func
	.type	caribou_vector_installed, %function
caribou_vector_installed:
.LFB33:
	.loc 1 55 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #32
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #15
	adds	r3, r7, r3
	adds	r2, r0, #0
	strb	r2, [r3]
	.loc 1 56 0
	movs	r3, #0
	str	r3, [r7, #28]
	.loc 1 57 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 58 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r3]
	ldr	r3, .L14
	ldr	r3, [r3]
	movs	r1, #255
	ands	r3, r1
	cmp	r2, r3
	bge	.L9
.LBB3:
	.loc 1 60 0
	ldr	r3, .L14+4
	ldr	r2, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #24]
	.loc 1 61 0
	b	.L10
.L12:
	.loc 1 63 0
	ldr	r3, [r7, #24]
	ldr	r2, [r3]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bne	.L11
	.loc 1 63 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #24]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L11
	.loc 1 65 0 is_stmt 1
	movs	r3, #1
	str	r3, [r7, #28]
	.loc 1 66 0
	b	.L9
.L11:
	.loc 1 68 0
	ldr	r3, [r7, #24]
	ldr	r3, [r3, #8]
	str	r3, [r7, #24]
.L10:
	.loc 1 61 0
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L12
.L9:
.LBE3:
	.loc 1 71 0
	ldr	r3, [r7, #20]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 72 0
	ldr	r3, [r7, #28]
	.loc 1 73 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
	.word	isr_map_size
	.word	isr_map
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
	.loc 1 83 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #32
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #15
	adds	r3, r7, r3
	adds	r2, r0, #0
	strb	r2, [r3]
	.loc 1 84 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	movs	r0, r3
	bl	caribou_vector_installed
	subs	r3, r0, #0
	bne	.L17
.LBB4:
	.loc 1 86 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #24]
	.loc 1 87 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	adds	r3, r3, #1
	movs	r0, r3
	bl	isr_map_extend
	movs	r2, r0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r2, r3
	ble	.L18
.LBB5:
	.loc 1 89 0
	movs	r0, #12
	bl	malloc
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 90 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	beq	.L18
.LBB6:
	.loc 1 92 0
	ldr	r3, [r7, #20]
	movs	r2, #12
	movs	r1, #0
	movs	r0, r3
	bl	memset
	.loc 1 93 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #8]
	str	r2, [r3]
	.loc 1 94 0
	ldr	r3, [r7, #20]
	ldr	r2, [r7, #4]
	str	r2, [r3, #4]
	.loc 1 95 0
	ldr	r3, .L23
	ldr	r2, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L19
	.loc 1 97 0
	ldr	r3, .L23
	ldr	r2, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #20]
	str	r2, [r3]
	b	.L18
.L19:
.LBB7:
	.loc 1 101 0
	ldr	r3, .L23
	ldr	r2, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #28]
	.loc 1 102 0
	b	.L20
.L21:
	.loc 1 102 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #8]
	str	r3, [r7, #28]
.L20:
	.loc 1 102 0 discriminator 1
	ldr	r3, [r7, #28]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L21
	.loc 1 103 0 is_stmt 1
	ldr	r3, [r7, #28]
	ldr	r2, [r7, #20]
	str	r2, [r3, #8]
.L18:
.LBE7:
.LBE6:
.LBE5:
	.loc 1 107 0
	ldr	r3, [r7, #24]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 108 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	b	.L22
.L17:
.LBE4:
	.loc 1 110 0
	movs	r3, #1
	rsbs	r3, r3, #0
.L22:
	.loc 1 111 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	isr_map
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
	.loc 1 120 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #24
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 121 0
	ldr	r3, .L32
	ldr	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 122 0
	ldr	r3, [r7, #20]
	str	r3, [r7, #16]
	.loc 1 123 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #12]
	.loc 1 124 0
	b	.L26
.L30:
	.loc 1 126 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3]
	ldr	r3, [r7]
	cmp	r2, r3
	bne	.L27
	.loc 1 128 0
	ldr	r3, .L32
	ldr	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	cmp	r2, r3
	bne	.L28
	.loc 1 130 0
	ldr	r3, .L32
	ldr	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #20]
	ldr	r2, [r2, #8]
	str	r2, [r3]
	b	.L29
.L28:
	.loc 1 134 0
	ldr	r3, [r7, #20]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #16]
	str	r2, [r3, #8]
.L29:
	.loc 1 136 0
	ldr	r3, [r7, #20]
	movs	r0, r3
	bl	free
	.loc 1 137 0
	ldr	r3, [r7, #16]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
.L27:
	.loc 1 139 0
	ldr	r3, [r7, #20]
	str	r3, [r7, #16]
	.loc 1 140 0
	ldr	r3, [r7, #20]
	ldr	r3, [r3, #8]
	str	r3, [r7, #20]
.L26:
	.loc 1 124 0
	ldr	r3, [r7, #20]
	cmp	r3, #0
	bne	.L30
	.loc 1 142 0
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	chip_interrupts_set
	.loc 1 143 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 144 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L33:
	.align	2
.L32:
	.word	isr_map
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
	.loc 1 153 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #24
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	str	r0, [r7, #4]
.LBB8:
	.loc 1 154 0
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L35
.L41:
.LBB9:
	.loc 1 156 0
	ldr	r3, .L43
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	movs	r1, #255
	ands	r3, r1
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #16]
	.loc 1 157 0
	ldr	r3, [r7, #16]
	str	r3, [r7, #12]
	.loc 1 158 0
	b	.L36
.L40:
.LBB10:
	.loc 1 160 0
	bl	chip_interrupts_disable
	movs	r3, r0
	str	r3, [r7, #8]
	.loc 1 161 0
	ldr	r3, [r7, #16]
	ldr	r2, [r3, #4]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L37
	.loc 1 163 0
	ldr	r3, .L43
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	movs	r1, #255
	ands	r3, r1
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	bne	.L38
	.loc 1 165 0
	ldr	r3, .L43
	ldr	r2, [r3]
	ldr	r3, [r7, #20]
	movs	r1, #255
	ands	r3, r1
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r2, [r7, #16]
	ldr	r2, [r2, #8]
	str	r2, [r3]
	b	.L39
.L38:
	.loc 1 169 0
	ldr	r3, [r7, #16]
	ldr	r2, [r3, #8]
	ldr	r3, [r7, #12]
	str	r2, [r3, #8]
.L39:
	.loc 1 171 0
	ldr	r3, [r7, #16]
	movs	r0, r3
	bl	free
	.loc 1 172 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	str	r3, [r7, #16]
.L37:
	.loc 1 174 0
	ldr	r3, [r7, #16]
	str	r3, [r7, #12]
	.loc 1 175 0
	ldr	r3, [r7, #16]
	ldr	r3, [r3, #8]
	str	r3, [r7, #16]
	.loc 1 176 0
	ldr	r3, [r7, #8]
	movs	r0, r3
	bl	chip_interrupts_set
.L36:
.LBE10:
	.loc 1 158 0
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne	.L40
.LBE9:
	.loc 1 154 0 discriminator 2
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L35:
	.loc 1 154 0 is_stmt 0 discriminator 1
	ldr	r3, .L43+4
	ldr	r3, [r3]
	ldr	r2, [r7, #20]
	cmp	r2, r3
	blt	.L41
.LBE8:
	.loc 1 179 0 is_stmt 1
	movs	r3, #1
	.loc 1 180 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L44:
	.align	2
.L43:
	.word	isr_map
	.word	isr_map_size
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
	.loc 1 187 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #16
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 192 0
	ldr	r3, .L49
	ldr	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	lsls	r3, r3, #2
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 193 0
	b	.L46
.L48:
	.loc 1 195 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L47
	.loc 1 196 0
	ldr	r3, [r7, #12]
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	ldr	r1, [r3, #4]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r0, r3
	blx	r2
.L47:
	.loc 1 197 0
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
.L46:
	.loc 1 193 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bne	.L48
	.loc 1 206 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L50:
	.align	2
.L49:
	.word	isr_map
.LFE37:
	.size	caribou_interrupt_service, .-caribou_interrupt_service
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
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
	.4byte	.LCFI6-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
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
	.4byte	.LCFI9-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
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
	.4byte	.LCFI12-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
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
	.4byte	.LCFI15-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
	.text
.Letext0:
	.file 2 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/vectors.h"
	.file 3 "../../../../include/caribou/kernel/interrupt.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x446
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0xc
	.4byte	.LASF58
	.4byte	.LASF59
	.4byte	.Ldebug_ranges0+0
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
	.byte	0x1
	.4byte	0x2c
	.byte	0x2
	.byte	0x1a
	.4byte	0x141
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x9
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0xa
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0xb
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0xd
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0xe
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0xf
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x11
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x12
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x13
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x17
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x19
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x1a
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x1b
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x1d
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x1e
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x1f
	.byte	0
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x2
	.byte	0x3e
	.4byte	0x74
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x3
	.byte	0x1b
	.4byte	0x157
	.uleb128 0x8
	.byte	0x4
	.4byte	0x15d
	.uleb128 0x9
	.4byte	0x16d
	.uleb128 0xa
	.4byte	0x141
	.uleb128 0xa
	.4byte	0x5d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF60
	.byte	0xc
	.byte	0x1
	.byte	0x12
	.4byte	0x19e
	.uleb128 0xc
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x14c
	.byte	0
	.uleb128 0xc
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x5d
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF44
	.byte	0x1
	.byte	0x16
	.4byte	0x19e
	.byte	0x8
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x16d
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x1
	.byte	0x17
	.4byte	0x16d
	.uleb128 0xe
	.4byte	.LASF61
	.byte	0x1
	.byte	0x1d
	.4byte	0x41
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ed
	.uleb128 0xf
	.4byte	.LASF46
	.byte	0x1
	.byte	0x1d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x11
	.ascii	"n\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF50
	.byte	0x1
	.byte	0x36
	.4byte	0x41
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x264
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x36
	.4byte	0x141
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x13
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x11
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x39
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0x3c
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1a4
	.uleb128 0x12
	.4byte	.LASF51
	.byte	0x1
	.byte	0x52
	.4byte	0x41
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x311
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x52
	.4byte	0x141
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x13
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x56
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0x59
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.uleb128 0x15
	.4byte	.LASF62
	.byte	0x1
	.byte	0x5c
	.4byte	0x41
	.4byte	0x2f5
	.uleb128 0x16
	.byte	0
	.uleb128 0x10
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x65
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF52
	.byte	0x1
	.byte	0x77
	.4byte	0x41
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x371
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0x77
	.4byte	0x141
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x13
	.ascii	"isr\000"
	.byte	0x1
	.byte	0x77
	.4byte	0x14c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x79
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0x7a
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0x7b
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x1
	.byte	0x98
	.4byte	0x41
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ef
	.uleb128 0x13
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x98
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.byte	0x9a
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x9c
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0x9d
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0x1
	.byte	0xa0
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF63
	.byte	0x1
	.byte	0xba
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x421
	.uleb128 0xf
	.4byte	.LASF47
	.byte	0x1
	.byte	0xba
	.4byte	0x141
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0x1
	.byte	0xc0
	.4byte	0x264
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF55
	.byte	0x1
	.byte	0x19
	.4byte	0x432
	.uleb128 0x5
	.byte	0x3
	.4byte	isr_map
	.uleb128 0x8
	.byte	0x4
	.4byte	0x264
	.uleb128 0x18
	.4byte	.LASF56
	.byte	0x1
	.byte	0x1a
	.4byte	0x41
	.uleb128 0x5
	.byte	0x3
	.4byte	isr_map_size
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x2116
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
	.uleb128 0x18
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x18
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0xd7
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x44a
	.4byte	0x1af
	.ascii	"isr_map_extend\000"
	.4byte	0x1ed
	.ascii	"caribou_vector_installed\000"
	.4byte	0x26a
	.ascii	"caribou_vector_install\000"
	.4byte	0x2e4
	.ascii	"memset\000"
	.4byte	0x311
	.ascii	"caribou_vector_remove\000"
	.4byte	0x371
	.ascii	"caribou_vector_remove_all\000"
	.4byte	0x3ef
	.ascii	"caribou_interrupt_service\000"
	.4byte	0x421
	.ascii	"isr_map\000"
	.4byte	0x438
	.ascii	"isr_map_size\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x124
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x44a
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x3a
	.ascii	"short unsigned int\000"
	.4byte	0x41
	.ascii	"int\000"
	.4byte	0x48
	.ascii	"unsigned int\000"
	.4byte	0x4f
	.ascii	"long long int\000"
	.4byte	0x56
	.ascii	"long long unsigned int\000"
	.4byte	0x5f
	.ascii	"long int\000"
	.4byte	0x66
	.ascii	"char\000"
	.4byte	0x6d
	.ascii	"sizetype\000"
	.4byte	0x141
	.ascii	"InterruptVector\000"
	.4byte	0x14c
	.ascii	"caribou_isr_t\000"
	.4byte	0x16d
	.ascii	"caribou_interrupt_handler_s\000"
	.4byte	0x1a4
	.ascii	"caribou_interrupt_handler_t\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x44
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF10:
	.ascii	"Vector_WWDG\000"
.LASF30:
	.ascii	"Vector_TIM15\000"
.LASF31:
	.ascii	"Vector_TIM16\000"
.LASF32:
	.ascii	"Vector_TIM17\000"
.LASF35:
	.ascii	"Vector_SPI1\000"
.LASF36:
	.ascii	"Vector_SPI2\000"
.LASF48:
	.ascii	"state\000"
.LASF2:
	.ascii	"short int\000"
.LASF27:
	.ascii	"Vector_TIM6_DAC\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF59:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF25:
	.ascii	"Vector_TIM2\000"
.LASF26:
	.ascii	"Vector_TIM3\000"
.LASF28:
	.ascii	"Vector_Reserved1\000"
.LASF39:
	.ascii	"Vector_Reserved2\000"
.LASF56:
	.ascii	"isr_map_size\000"
.LASF47:
	.ascii	"vector\000"
.LASF37:
	.ascii	"Vector_USART1\000"
.LASF38:
	.ascii	"Vector_USART2\000"
.LASF0:
	.ascii	"signed char\000"
.LASF33:
	.ascii	"Vector_I2C1\000"
.LASF34:
	.ascii	"Vector_I2C2\000"
.LASF5:
	.ascii	"long long int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF62:
	.ascii	"memset\000"
.LASF14:
	.ascii	"Vector_RCC\000"
.LASF7:
	.ascii	"long int\000"
.LASF52:
	.ascii	"caribou_vector_remove\000"
.LASF18:
	.ascii	"Vector_TSC\000"
.LASF13:
	.ascii	"Vector_FLASH\000"
.LASF49:
	.ascii	"node\000"
.LASF23:
	.ascii	"Vector_TIM1_BRK_UP_TRG_COM\000"
.LASF19:
	.ascii	"Vector_DMA_CH1\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF50:
	.ascii	"caribou_vector_installed\000"
.LASF16:
	.ascii	"Vector_EXTI2_3\000"
.LASF20:
	.ascii	"Vector_DMA_CH2_3\000"
.LASF61:
	.ascii	"isr_map_extend\000"
.LASF55:
	.ascii	"isr_map\000"
.LASF58:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../../src/k"
	.ascii	"ernel/interrupt.c\000"
.LASF21:
	.ascii	"Vector_DMA_CH4_5\000"
.LASF41:
	.ascii	"Vector_SoftSysTick\000"
.LASF22:
	.ascii	"Vector_ADC_COMP\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF17:
	.ascii	"Vector_EXTI4_15\000"
.LASF60:
	.ascii	"caribou_interrupt_handler_s\000"
.LASF45:
	.ascii	"caribou_interrupt_handler_t\000"
.LASF8:
	.ascii	"char\000"
.LASF63:
	.ascii	"caribou_interrupt_service\000"
.LASF11:
	.ascii	"Vector_PVD\000"
.LASF51:
	.ascii	"caribou_vector_install\000"
.LASF15:
	.ascii	"Vector_EXTI0_1\000"
.LASF43:
	.ascii	"caribou_isr_t\000"
.LASF46:
	.ascii	"size\000"
.LASF29:
	.ascii	"Vector_TIM14\000"
.LASF42:
	.ascii	"InterruptVector\000"
.LASF57:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF54:
	.ascii	"caribou_vector_remove_all\000"
.LASF12:
	.ascii	"Vector_RTC\000"
.LASF53:
	.ascii	"prev\000"
.LASF40:
	.ascii	"Vector_CEC\000"
.LASF24:
	.ascii	"Vector_TIM1_CC\000"
.LASF44:
	.ascii	"next\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
