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
	.file	"i2s.c"
	.text
.Ltext0:
	.section	.text.caribou_i2s_rx_ready,"ax",%progbits
	.align	2
	.global	caribou_i2s_rx_ready
	.code	16
	.thumb_func
	.type	caribou_i2s_rx_ready, %function
caribou_i2s_rx_ready:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../../src/dev/i2s.c"
	.loc 1 18 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
	.loc 1 19 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_i2s_rx_ready
	movs	r3, r0
	.loc 1 20 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	caribou_i2s_rx_ready, .-caribou_i2s_rx_ready
	.section	.text.caribou_i2s_rx,"ax",%progbits
	.align	2
	.global	caribou_i2s_rx
	.code	16
	.thumb_func
	.type	caribou_i2s_rx, %function
caribou_i2s_rx:
.LFB33:
	.loc 1 23 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 24 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_i2s_rx
	movs	r3, r0
	.loc 1 25 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	caribou_i2s_rx, .-caribou_i2s_rx
	.section	.text.caribou_i2s_tx_ready,"ax",%progbits
	.align	2
	.global	caribou_i2s_tx_ready
	.code	16
	.thumb_func
	.type	caribou_i2s_tx_ready, %function
caribou_i2s_tx_ready:
.LFB34:
	.loc 1 28 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #8
.LCFI7:
	add	r7, sp, #0
.LCFI8:
	str	r0, [r7, #4]
	.loc 1 29 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	movs	r0, r3
	bl	chip_i2s_tx_ready
	movs	r3, r0
	.loc 1 30 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	caribou_i2s_tx_ready, .-caribou_i2s_tx_ready
	.section	.text.caribou_i2s_tx,"ax",%progbits
	.align	2
	.global	caribou_i2s_tx
	.code	16
	.thumb_func
	.type	caribou_i2s_tx, %function
caribou_i2s_tx:
.LFB35:
	.loc 1 33 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI9:
	sub	sp, sp, #8
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #2
	strh	r2, [r3]
	.loc 1 34 0
	ldr	r3, [r7, #4]
	ldr	r2, [r3]
	adds	r3, r7, #2
	ldrh	r3, [r3]
	movs	r1, r3
	movs	r0, r2
	bl	caribou_i2s_tx
	.loc 1 35 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	caribou_i2s_tx, .-caribou_i2s_tx
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
	.text
.Letext0:
	.file 2 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 4 "../../../../include/caribou/dev/i2s.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x24f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0xc
	.4byte	.LASF33
	.4byte	.LASF34
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
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x3
	.byte	0x15
	.4byte	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x4
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
	.4byte	0x3a
	.uleb128 0x6
	.byte	0x24
	.byte	0x2
	.2byte	0x210
	.4byte	0x174
	.uleb128 0x7
	.ascii	"CR1\000"
	.byte	0x2
	.2byte	0x212
	.4byte	0x7d
	.byte	0
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x213
	.4byte	0x3a
	.byte	0x2
	.uleb128 0x7
	.ascii	"CR2\000"
	.byte	0x2
	.2byte	0x214
	.4byte	0x7d
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x215
	.4byte	0x3a
	.byte	0x6
	.uleb128 0x7
	.ascii	"SR\000"
	.byte	0x2
	.2byte	0x216
	.4byte	0x7d
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x2
	.2byte	0x217
	.4byte	0x3a
	.byte	0xa
	.uleb128 0x7
	.ascii	"DR\000"
	.byte	0x2
	.2byte	0x218
	.4byte	0x7d
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x2
	.2byte	0x219
	.4byte	0x3a
	.byte	0xe
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x21a
	.4byte	0x7d
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x21b
	.4byte	0x3a
	.byte	0x12
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x21c
	.4byte	0x7d
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x21d
	.4byte	0x3a
	.byte	0x16
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x21e
	.4byte	0x7d
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x21f
	.4byte	0x3a
	.byte	0x1a
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x220
	.4byte	0x7d
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x221
	.4byte	0x3a
	.byte	0x1e
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x222
	.4byte	0x7d
	.byte	0x20
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x223
	.4byte	0x3a
	.byte	0x22
	.byte	0
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x224
	.4byte	0x82
	.uleb128 0xa
	.byte	0x4
	.byte	0x4
	.byte	0x1a
	.4byte	0x195
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x4
	.byte	0x1c
	.4byte	0x195
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x174
	.uleb128 0x3
	.4byte	.LASF27
	.byte	0x4
	.byte	0x1d
	.4byte	0x180
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x11
	.4byte	0x6f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ce
	.uleb128 0xe
	.ascii	"i2s\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x1ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x19b
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x1
	.byte	0x16
	.4byte	0x3a
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1fc
	.uleb128 0xe
	.ascii	"i2s\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x1ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x1
	.byte	0x1b
	.4byte	0x6f
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x224
	.uleb128 0xe
	.ascii	"i2s\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x1ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0x20
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.ascii	"i2s\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x1ce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF31
	.byte	0x1
	.byte	0x20
	.4byte	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -14
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0x10
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x66
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x253
	.4byte	0x1a6
	.ascii	"caribou_i2s_rx_ready\000"
	.4byte	0x1d4
	.ascii	"caribou_i2s_rx\000"
	.4byte	0x1fc
	.ascii	"caribou_i2s_tx_ready\000"
	.4byte	0x224
	.ascii	"caribou_i2s_tx\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xed
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x253
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x45
	.ascii	"short unsigned int\000"
	.4byte	0x3a
	.ascii	"uint16_t\000"
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
	.4byte	0x76
	.ascii	"sizetype\000"
	.4byte	0x174
	.ascii	"SPI_TypeDef\000"
	.4byte	0x19b
	.ascii	"caribou_i2s_t\000"
	.4byte	0
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF31:
	.ascii	"word\000"
.LASF33:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../../src/d"
	.ascii	"ev/i2s.c\000"
.LASF28:
	.ascii	"caribou_i2s_rx_ready\000"
.LASF16:
	.ascii	"RXCRCR\000"
.LASF10:
	.ascii	"RESERVED0\000"
.LASF11:
	.ascii	"RESERVED1\000"
.LASF12:
	.ascii	"RESERVED2\000"
.LASF13:
	.ascii	"RESERVED3\000"
.LASF15:
	.ascii	"RESERVED4\000"
.LASF17:
	.ascii	"RESERVED5\000"
.LASF19:
	.ascii	"RESERVED6\000"
.LASF21:
	.ascii	"RESERVED7\000"
.LASF23:
	.ascii	"RESERVED8\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF20:
	.ascii	"I2SCFGR\000"
.LASF27:
	.ascii	"caribou_i2s_t\000"
.LASF14:
	.ascii	"CRCPR\000"
.LASF29:
	.ascii	"caribou_i2s_rx\000"
.LASF35:
	.ascii	"caribou_i2s_tx\000"
.LASF32:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"char\000"
.LASF26:
	.ascii	"port\000"
.LASF30:
	.ascii	"caribou_i2s_tx_ready\000"
.LASF2:
	.ascii	"short int\000"
.LASF24:
	.ascii	"uint16_t\000"
.LASF18:
	.ascii	"TXCRCR\000"
.LASF7:
	.ascii	"long int\000"
.LASF34:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF0:
	.ascii	"signed char\000"
.LASF22:
	.ascii	"I2SPR\000"
.LASF25:
	.ascii	"SPI_TypeDef\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
