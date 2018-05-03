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
	.file	"board.c"
	.text
.Ltext0:
	.section	.text.early_init,"ax",%progbits
	.align	1
	.global	early_init
	.code	16
	.thumb_func
	.type	early_init, %function
early_init:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../src/board.c"
	.loc 1 20 0
	.loc 1 21 0
	ldr	r3, .L2
	ldr	r1, .L2+4
	ldr	r2, [r3, #20]
	.loc 1 56 0
	@ sp needed
	.loc 1 21 0
	orr	r2, r1
	str	r2, [r3, #20]
	.loc 1 26 0
	ldr	r2, [r3, #28]
	ldr	r1, .L2+8
	orr	r2, r1
	str	r2, [r3, #28]
	.loc 1 31 0
	ldr	r1, [r3, #24]
	mov	r2, #148
	lsl	r2, r2, #7
	orr	r2, r1
	str	r2, [r3, #24]
	.loc 1 36 0
	mov	r2, #144
	mov	r3, #160
	lsl	r2, r2, #23
	lsl	r3, r3, #22
	.loc 1 38 0
	ldr	r1, .L2+12
	.loc 1 36 0
	str	r3, [r2]
	.loc 1 37 0
	mov	r3, #0
	strh	r3, [r2, #4]
	.loc 1 38 0
	str	r1, [r2, #8]
	.loc 1 39 0
	mov	r1, #144
	lsl	r1, r1, #22
	str	r1, [r2, #12]
	.loc 1 40 0
	str	r3, [r2, #32]
	.loc 1 45 0
	ldr	r1, .L2+16
	.loc 1 41 0
	str	r3, [r2, #36]
	.loc 1 43 0
	ldr	r2, .L2+20
	str	r3, [r2]
	.loc 1 44 0
	strh	r3, [r2, #4]
	.loc 1 45 0
	str	r1, [r2, #8]
	.loc 1 46 0
	str	r3, [r2, #12]
	.loc 1 47 0
	str	r3, [r2, #32]
	.loc 1 48 0
	str	r3, [r2, #36]
	.loc 1 50 0
	ldr	r2, .L2+24
	str	r3, [r2]
	.loc 1 51 0
	strh	r3, [r2, #4]
	.loc 1 52 0
	str	r1, [r2, #8]
	.loc 1 53 0
	str	r3, [r2, #12]
	.loc 1 54 0
	str	r3, [r2, #32]
	.loc 1 55 0
	str	r3, [r2, #36]
	.loc 1 56 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	4587521
	.word	270534658
	.word	-1767200086
	.word	-1431655766
	.word	1207960576
	.word	1207964672
.LFE32:
	.size	early_init, .-early_init
	.section	.text.late_init,"ax",%progbits
	.align	1
	.global	late_init
	.code	16
	.thumb_func
	.type	late_init, %function
late_init:
.LFB33:
	.loc 1 59 0
	.loc 1 60 0
	@ sp needed
	bx	lr
.LFE33:
	.size	late_init, .-late_init
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.align	2
.LEFDE2:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_gpio.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2d4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x1
	.4byte	.LASF50
	.4byte	.LASF51
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0xf
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x15
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x17
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x5
	.4byte	0x5e
	.uleb128 0x6
	.4byte	0x5e
	.4byte	0xa8
	.uleb128 0x7
	.4byte	0x8c
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x45
	.uleb128 0x8
	.byte	0x2c
	.byte	0x3
	.2byte	0x18c
	.4byte	0x16d
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x18e
	.4byte	0x93
	.byte	0
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x18f
	.4byte	0xa8
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x190
	.4byte	0x45
	.byte	0x6
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x191
	.4byte	0x93
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x192
	.4byte	0x93
	.byte	0xc
	.uleb128 0xa
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x193
	.4byte	0xa8
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x194
	.4byte	0x45
	.byte	0x12
	.uleb128 0xa
	.ascii	"ODR\000"
	.byte	0x3
	.2byte	0x195
	.4byte	0xa8
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x196
	.4byte	0x45
	.byte	0x16
	.uleb128 0x9
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x197
	.4byte	0x93
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x198
	.4byte	0x93
	.byte	0x1c
	.uleb128 0xa
	.ascii	"AFR\000"
	.byte	0x3
	.2byte	0x199
	.4byte	0x16d
	.byte	0x20
	.uleb128 0xa
	.ascii	"BRR\000"
	.byte	0x3
	.2byte	0x19a
	.4byte	0xa8
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x19b
	.4byte	0x45
	.byte	0x2a
	.byte	0
	.uleb128 0x5
	.4byte	0x98
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x19c
	.4byte	0xad
	.uleb128 0x8
	.byte	0x38
	.byte	0x3
	.2byte	0x1d8
	.4byte	0x23d
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x1da
	.4byte	0x93
	.byte	0
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1db
	.4byte	0x93
	.byte	0x4
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x3
	.2byte	0x1dc
	.4byte	0x93
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x1dd
	.4byte	0x93
	.byte	0xc
	.uleb128 0x9
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x1de
	.4byte	0x93
	.byte	0x10
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x1df
	.4byte	0x93
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x1e0
	.4byte	0x93
	.byte	0x18
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x1e1
	.4byte	0x93
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1e2
	.4byte	0x93
	.byte	0x20
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x1e3
	.4byte	0x93
	.byte	0x24
	.uleb128 0x9
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x1e4
	.4byte	0x93
	.byte	0x28
	.uleb128 0x9
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x1e5
	.4byte	0x93
	.byte	0x2c
	.uleb128 0x9
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x1e6
	.4byte	0x93
	.byte	0x30
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x1e7
	.4byte	0x93
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x1e8
	.4byte	0x17e
	.uleb128 0xc
	.byte	0x1
	.byte	0x4
	.byte	0x3e
	.4byte	0x26a
	.uleb128 0xd
	.4byte	.LASF35
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF36
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF37
	.sleb128 2
	.uleb128 0xd
	.4byte	.LASF38
	.sleb128 3
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.byte	0x4
	.byte	0x4f
	.4byte	0x27f
	.uleb128 0xd
	.4byte	.LASF39
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF40
	.sleb128 1
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.byte	0x4
	.byte	0x5e
	.4byte	0x29a
	.uleb128 0xd
	.4byte	.LASF41
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF42
	.sleb128 2
	.uleb128 0xd
	.4byte	.LASF43
	.sleb128 3
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.byte	0x4
	.byte	0x6e
	.4byte	0x2b5
	.uleb128 0xd
	.4byte	.LASF44
	.sleb128 0
	.uleb128 0xd
	.4byte	.LASF45
	.sleb128 1
	.uleb128 0xd
	.4byte	.LASF46
	.sleb128 2
	.byte	0
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x1
	.byte	0x13
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x1
	.byte	0x3a
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.4byte	0x24
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
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF30:
	.ascii	"BDCR\000"
.LASF16:
	.ascii	"OSPEEDR\000"
.LASF24:
	.ascii	"CFGR\000"
.LASF27:
	.ascii	"AHBENR\000"
.LASF13:
	.ascii	"MODER\000"
.LASF31:
	.ascii	"AHBRSTR\000"
.LASF40:
	.ascii	"GPIO_OType_OD\000"
.LASF47:
	.ascii	"early_init\000"
.LASF38:
	.ascii	"GPIO_Mode_AN\000"
.LASF20:
	.ascii	"BSRR\000"
.LASF15:
	.ascii	"RESERVED0\000"
.LASF18:
	.ascii	"RESERVED1\000"
.LASF19:
	.ascii	"RESERVED2\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF34:
	.ascii	"RCC_TypeDef\000"
.LASF14:
	.ascii	"OTYPER\000"
.LASF26:
	.ascii	"APB1RSTR\000"
.LASF48:
	.ascii	"late_init\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF41:
	.ascii	"GPIO_Speed_Level_1\000"
.LASF32:
	.ascii	"CFGR2\000"
.LASF33:
	.ascii	"CFGR3\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF50:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../src/board.c\000"
.LASF49:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF44:
	.ascii	"GPIO_PuPd_NOPULL\000"
.LASF28:
	.ascii	"APB2ENR\000"
.LASF29:
	.ascii	"APB1ENR\000"
.LASF25:
	.ascii	"APB2RSTR\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF23:
	.ascii	"GPIO_TypeDef\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF17:
	.ascii	"PUPDR\000"
.LASF39:
	.ascii	"GPIO_OType_PP\000"
.LASF8:
	.ascii	"long long int\000"
.LASF35:
	.ascii	"GPIO_Mode_IN\000"
.LASF11:
	.ascii	"char\000"
.LASF45:
	.ascii	"GPIO_PuPd_UP\000"
.LASF46:
	.ascii	"GPIO_PuPd_DOWN\000"
.LASF2:
	.ascii	"short int\000"
.LASF51:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF42:
	.ascii	"GPIO_Speed_Level_2\000"
.LASF43:
	.ascii	"GPIO_Speed_Level_3\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF10:
	.ascii	"long int\000"
.LASF37:
	.ascii	"GPIO_Mode_AF\000"
.LASF0:
	.ascii	"signed char\000"
.LASF36:
	.ascii	"GPIO_Mode_OUT\000"
.LASF21:
	.ascii	"LCKR\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
