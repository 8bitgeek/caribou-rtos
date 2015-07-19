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
	.file	"stm32f0xx_dbgmcu.c"
	.text
.Ltext0:
	.section	.text.DBGMCU_GetREVID,"ax",%progbits
	.align	2
	.global	DBGMCU_GetREVID
	.code	16
	.thumb_func
	.type	DBGMCU_GetREVID, %function
DBGMCU_GetREVID:
.LFB32:
	ldr	r3, .L2
	ldr	r0, [r3]
	lsr	r0, r0, #16
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073829888
.LFE32:
	.size	DBGMCU_GetREVID, .-DBGMCU_GetREVID
	.section	.text.DBGMCU_GetDEVID,"ax",%progbits
	.align	2
	.global	DBGMCU_GetDEVID
	.code	16
	.thumb_func
	.type	DBGMCU_GetDEVID, %function
DBGMCU_GetDEVID:
.LFB33:
	ldr	r3, .L5
	ldr	r0, [r3]
	lsl	r0, r0, #20
	lsr	r0, r0, #20
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073829888
.LFE33:
	.size	DBGMCU_GetDEVID, .-DBGMCU_GetDEVID
	.section	.text.DBGMCU_Config,"ax",%progbits
	.align	2
	.global	DBGMCU_Config
	.code	16
	.thumb_func
	.type	DBGMCU_Config, %function
DBGMCU_Config:
.LFB34:
	cmp	r1, #0
	beq	.L8
	ldr	r3, .L10
	ldr	r2, [r3, #4]
	orr	r0, r2
	str	r0, [r3, #4]
	b	.L7
.L8:
	ldr	r3, .L10
	ldr	r2, [r3, #4]
	bic	r2, r0
	str	r2, [r3, #4]
.L7:
	@ sp needed
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073829888
.LFE34:
	.size	DBGMCU_Config, .-DBGMCU_Config
	.section	.text.DBGMCU_APB1PeriphConfig,"ax",%progbits
	.align	2
	.global	DBGMCU_APB1PeriphConfig
	.code	16
	.thumb_func
	.type	DBGMCU_APB1PeriphConfig, %function
DBGMCU_APB1PeriphConfig:
.LFB35:
	cmp	r1, #0
	beq	.L13
	ldr	r3, .L15
	ldr	r2, [r3, #8]
	orr	r0, r2
	str	r0, [r3, #8]
	b	.L12
.L13:
	ldr	r3, .L15
	ldr	r2, [r3, #8]
	bic	r2, r0
	str	r2, [r3, #8]
.L12:
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073829888
.LFE35:
	.size	DBGMCU_APB1PeriphConfig, .-DBGMCU_APB1PeriphConfig
	.section	.text.DBGMCU_APB2PeriphConfig,"ax",%progbits
	.align	2
	.global	DBGMCU_APB2PeriphConfig
	.code	16
	.thumb_func
	.type	DBGMCU_APB2PeriphConfig, %function
DBGMCU_APB2PeriphConfig:
.LFB36:
	cmp	r1, #0
	beq	.L18
	ldr	r3, .L20
	ldr	r2, [r3, #12]
	orr	r0, r2
	str	r0, [r3, #12]
	b	.L17
.L18:
	ldr	r3, .L20
	ldr	r2, [r3, #12]
	bic	r2, r0
	str	r2, [r3, #12]
.L17:
	@ sp needed
	bx	lr
.L21:
	.align	2
.L20:
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dbgmcu.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x6f
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
	.byte	0x4d
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x57
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x76
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x99
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
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
	.byte	0
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
.LASF4:
	.ascii	"DBGMCU_APB2PeriphConfig\000"
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
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_dbgmcu"
	.ascii	".c\000"
.LASF2:
	.ascii	"DBGMCU_Config\000"
.LASF3:
	.ascii	"DBGMCU_APB1PeriphConfig\000"
.LASF1:
	.ascii	"DBGMCU_GetDEVID\000"
.LASF0:
	.ascii	"DBGMCU_GetREVID\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
