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
	.file	"stm32f0xx_dbgmcu.c"
	.text
.Ltext0:
	.section	.text.DBGMCU_GetREVID,"ax",%progbits
	.align	1
	.global	DBGMCU_GetREVID
	.code	16
	.thumb_func
	.type	DBGMCU_GetREVID, %function
DBGMCU_GetREVID:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dbgmcu.c"
	.loc 1 78 0
	.loc 1 79 0
	ldr	r3, .L2
	.loc 1 80 0
	@ sp needed
	.loc 1 79 0
	ldr	r0, [r3]
	lsr	r0, r0, #16
	.loc 1 80 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073829888
.LFE32:
	.size	DBGMCU_GetREVID, .-DBGMCU_GetREVID
	.section	.text.DBGMCU_GetDEVID,"ax",%progbits
	.align	1
	.global	DBGMCU_GetDEVID
	.code	16
	.thumb_func
	.type	DBGMCU_GetDEVID, %function
DBGMCU_GetDEVID:
.LFB33:
	.loc 1 88 0
	.loc 1 89 0
	ldr	r3, .L5
	.loc 1 90 0
	@ sp needed
	.loc 1 89 0
	ldr	r0, [r3]
	lsl	r0, r0, #20
	lsr	r0, r0, #20
	.loc 1 90 0
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073829888
.LFE33:
	.size	DBGMCU_GetDEVID, .-DBGMCU_GetDEVID
	.section	.text.DBGMCU_Config,"ax",%progbits
	.align	1
	.global	DBGMCU_Config
	.code	16
	.thumb_func
	.type	DBGMCU_Config, %function
DBGMCU_Config:
.LFB34:
	.loc 1 119 0
.LVL0:
	ldr	r3, .L11
	.loc 1 126 0
	ldr	r2, [r3, #4]
	.loc 1 124 0
	cmp	r1, #0
	beq	.L8
	.loc 1 126 0
	orr	r0, r2
.LVL1:
	str	r0, [r3, #4]
	b	.L7
.LVL2:
.L8:
	.loc 1 130 0
	bic	r2, r0
	str	r2, [r3, #4]
.LVL3:
.L7:
	.loc 1 132 0
	@ sp needed
	bx	lr
.L12:
	.align	2
.L11:
	.word	1073829888
.LFE34:
	.size	DBGMCU_Config, .-DBGMCU_Config
	.section	.text.DBGMCU_APB1PeriphConfig,"ax",%progbits
	.align	1
	.global	DBGMCU_APB1PeriphConfig
	.code	16
	.thumb_func
	.type	DBGMCU_APB1PeriphConfig, %function
DBGMCU_APB1PeriphConfig:
.LFB35:
	.loc 1 154 0
.LVL4:
	ldr	r3, .L16
	.loc 1 161 0
	ldr	r2, [r3, #8]
	.loc 1 159 0
	cmp	r1, #0
	beq	.L14
	.loc 1 161 0
	orr	r0, r2
.LVL5:
	str	r0, [r3, #8]
	b	.L13
.LVL6:
.L14:
	.loc 1 165 0
	bic	r2, r0
	str	r2, [r3, #8]
.LVL7:
.L13:
	.loc 1 167 0
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073829888
.LFE35:
	.size	DBGMCU_APB1PeriphConfig, .-DBGMCU_APB1PeriphConfig
	.section	.text.DBGMCU_APB2PeriphConfig,"ax",%progbits
	.align	1
	.global	DBGMCU_APB2PeriphConfig
	.code	16
	.thumb_func
	.type	DBGMCU_APB2PeriphConfig, %function
DBGMCU_APB2PeriphConfig:
.LFB36:
	.loc 1 182 0
.LVL8:
	ldr	r3, .L21
	.loc 1 189 0
	ldr	r2, [r3, #12]
	.loc 1 187 0
	cmp	r1, #0
	beq	.L19
	.loc 1 189 0
	orr	r0, r2
.LVL9:
	str	r0, [r3, #12]
	b	.L18
.LVL10:
.L19:
	.loc 1 193 0
	bic	r2, r0
	str	r2, [r3, #12]
.LVL11:
.L18:
	.loc 1 195 0
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073829888
.LFE36:
	.size	DBGMCU_APB2PeriphConfig, .-DBGMCU_APB2PeriphConfig
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
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x196
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x1
	.4byte	.LASF23
	.4byte	.LASF24
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
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x17
	.4byte	0x53
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
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x5
	.4byte	0x48
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0x89
	.uleb128 0x7
	.4byte	.LASF8
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF9
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0xe1
	.4byte	0x74
	.uleb128 0x8
	.byte	0x10
	.byte	0x3
	.2byte	0x141
	.4byte	0xd1
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x143
	.4byte	0x6f
	.byte	0
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x144
	.4byte	0x6f
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x145
	.4byte	0x6f
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x146
	.4byte	0x6f
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x147
	.4byte	0x94
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4d
	.4byte	0x48
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x57
	.4byte	0x48
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x76
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x139
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x76
	.4byte	0x48
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0x76
	.4byte	0x89
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x99
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16b
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x99
	.4byte	0x48
	.4byte	.LLST1
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0x99
	.4byte	0x89
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0xb5
	.4byte	0x48
	.4byte	.LLST2
	.uleb128 0xf
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb5
	.4byte	0x89
	.uleb128 0x1
	.byte	0x51
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
	.uleb128 0x5
	.uleb128 0x35
	.byte	0
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
	.4byte	.LVL2
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL3
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE36
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
.LASF5:
	.ascii	"long long int\000"
.LASF24:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF15:
	.ascii	"DBGMCU_TypeDef\000"
.LASF11:
	.ascii	"FunctionalState\000"
.LASF8:
	.ascii	"DISABLE\000"
.LASF20:
	.ascii	"DBGMCU_Config\000"
.LASF13:
	.ascii	"APB1FZ\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF19:
	.ascii	"NewState\000"
.LASF16:
	.ascii	"DBGMCU_GetREVID\000"
.LASF25:
	.ascii	"DBGMCU_APB2PeriphConfig\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"ENABLE\000"
.LASF14:
	.ascii	"APB2FZ\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF21:
	.ascii	"DBGMCU_APB1PeriphConfig\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF22:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF18:
	.ascii	"DBGMCU_Periph\000"
.LASF23:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_dbgmcu.c\000"
.LASF2:
	.ascii	"short int\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF12:
	.ascii	"IDCODE\000"
.LASF17:
	.ascii	"DBGMCU_GetDEVID\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
