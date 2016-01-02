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
	.file	"spi.c"
	.text
.Ltext0:
	.section	.text.caribou_spi_exchange,"ax",%progbits
	.align	1
	.global	caribou_spi_exchange
	.code	16
	.thumb_func
	.type	caribou_spi_exchange, %function
caribou_spi_exchange:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../../src/dev/spi.c"
	.loc 1 18 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 19 0
	ldr	r0, [r0]
.LVL1:
	bl	chip_spi_exchange
.LVL2:
	.loc 1 20 0
	@ sp needed
	pop	{r3, pc}
.LFE32:
	.size	caribou_spi_exchange, .-caribou_spi_exchange
	.section	.text.caribou_spi_rx_ready,"ax",%progbits
	.align	1
	.global	caribou_spi_rx_ready
	.code	16
	.thumb_func
	.type	caribou_spi_rx_ready, %function
caribou_spi_rx_ready:
.LFB33:
	.loc 1 23 0
.LVL3:
	push	{r3, lr}
.LCFI1:
	.loc 1 24 0
	ldr	r0, [r0]
.LVL4:
	bl	chip_spi_rx_ready
.LVL5:
	.loc 1 25 0
	@ sp needed
	pop	{r3, pc}
.LFE33:
	.size	caribou_spi_rx_ready, .-caribou_spi_rx_ready
	.section	.text.caribou_spi_rx,"ax",%progbits
	.align	1
	.global	caribou_spi_rx
	.code	16
	.thumb_func
	.type	caribou_spi_rx, %function
caribou_spi_rx:
.LFB34:
	.loc 1 28 0
.LVL6:
	push	{r3, lr}
.LCFI2:
	.loc 1 29 0
	ldr	r0, [r0]
.LVL7:
	bl	chip_spi_rx
.LVL8:
	.loc 1 30 0
	@ sp needed
	pop	{r3, pc}
.LFE34:
	.size	caribou_spi_rx, .-caribou_spi_rx
	.section	.text.caribou_spi_tx_ready,"ax",%progbits
	.align	1
	.global	caribou_spi_tx_ready
	.code	16
	.thumb_func
	.type	caribou_spi_tx_ready, %function
caribou_spi_tx_ready:
.LFB35:
	.loc 1 33 0
.LVL9:
	push	{r3, lr}
.LCFI3:
	.loc 1 34 0
	ldr	r0, [r0]
.LVL10:
	bl	chip_spi_tx_ready
.LVL11:
	.loc 1 35 0
	@ sp needed
	pop	{r3, pc}
.LFE35:
	.size	caribou_spi_tx_ready, .-caribou_spi_tx_ready
	.section	.text.caribou_spi_tx,"ax",%progbits
	.align	1
	.global	caribou_spi_tx
	.code	16
	.thumb_func
	.type	caribou_spi_tx, %function
caribou_spi_tx:
.LFB36:
	.loc 1 38 0
.LVL12:
.L6:
	b	.L6
.LFE36:
	.size	caribou_spi_tx, .-caribou_spi_tx
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x4
	.4byte	.LCFI2-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
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
	.4byte	.LCFI3-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.align	2
.LEFDE8:
	.text
.Letext0:
	.file 2 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 4 "../../../../include/caribou/dev/spi.h"
	.file 5 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/spi.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x305
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x1
	.4byte	.LASF37
	.4byte	.LASF38
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
	.4byte	.LASF29
	.byte	0x1
	.byte	0x11
	.4byte	0x3a
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e7
	.uleb128 0xe
	.ascii	"spi\000"
	.byte	0x1
	.byte	0x11
	.4byte	0x1e7
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LASF28
	.byte	0x1
	.byte	0x11
	.4byte	0x3a
	.4byte	.LLST1
	.uleb128 0x10
	.4byte	.LVL2
	.4byte	0x2b3
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.4byte	0x19b
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x1
	.byte	0x16
	.4byte	0x6f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x21f
	.uleb128 0xe
	.ascii	"spi\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x1e7
	.4byte	.LLST2
	.uleb128 0x10
	.4byte	.LVL5
	.4byte	0x2cd
	.byte	0
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x1
	.byte	0x1b
	.4byte	0x3a
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x251
	.uleb128 0xe
	.ascii	"spi\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0x1e7
	.4byte	.LLST3
	.uleb128 0x10
	.4byte	.LVL8
	.4byte	0x2e2
	.byte	0
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x1
	.byte	0x20
	.4byte	0x6f
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x283
	.uleb128 0xe
	.ascii	"spi\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x1e7
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LVL11
	.4byte	0x2f7
	.byte	0
	.uleb128 0x11
	.4byte	.LASF39
	.byte	0x1
	.byte	0x25
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b3
	.uleb128 0x12
	.ascii	"spi\000"
	.byte	0x1
	.byte	0x25
	.4byte	0x1e7
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x13
	.4byte	.LASF28
	.byte	0x1
	.byte	0x25
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x14
	.4byte	.LASF33
	.byte	0x5
	.byte	0x24
	.4byte	0x3a
	.4byte	0x2cd
	.uleb128 0x15
	.4byte	0x195
	.uleb128 0x15
	.4byte	0x3a
	.byte	0
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x5
	.byte	0x25
	.4byte	0x6f
	.4byte	0x2e2
	.uleb128 0x15
	.4byte	0x195
	.byte	0
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x5
	.byte	0x26
	.4byte	0x3a
	.4byte	0x2f7
	.uleb128 0x15
	.4byte	0x195
	.byte	0
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0x5
	.byte	0x27
	.4byte	0x6f
	.uleb128 0x15
	.4byte	0x195
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
	.uleb128 0x2117
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
	.uleb128 0x17
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL1
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
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF28:
	.ascii	"word\000"
.LASF38:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF40:
	.ascii	"chip_spi_tx_ready\000"
.LASF16:
	.ascii	"RXCRCR\000"
.LASF10:
	.ascii	"RESERVED0\000"
.LASF11:
	.ascii	"RESERVED1\000"
.LASF35:
	.ascii	"chip_spi_rx\000"
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
.LASF0:
	.ascii	"signed char\000"
.LASF37:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../../src/dev/spi.c\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF33:
	.ascii	"chip_spi_exchange\000"
.LASF29:
	.ascii	"caribou_spi_exchange\000"
.LASF34:
	.ascii	"chip_spi_rx_ready\000"
.LASF20:
	.ascii	"I2SCFGR\000"
.LASF36:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF14:
	.ascii	"CRCPR\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF27:
	.ascii	"caribou_spi_t\000"
.LASF32:
	.ascii	"caribou_spi_tx_ready\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF31:
	.ascii	"caribou_spi_rx\000"
.LASF39:
	.ascii	"caribou_spi_tx\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF5:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"char\000"
.LASF26:
	.ascii	"port\000"
.LASF2:
	.ascii	"short int\000"
.LASF24:
	.ascii	"uint16_t\000"
.LASF18:
	.ascii	"TXCRCR\000"
.LASF7:
	.ascii	"long int\000"
.LASF22:
	.ascii	"I2SPR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF30:
	.ascii	"caribou_spi_rx_ready\000"
.LASF25:
	.ascii	"SPI_TypeDef\000"
.LASF12:
	.ascii	"RESERVED2\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
