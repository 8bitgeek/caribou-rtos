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
	.file	"stm32f0xx_crc.c"
	.text
.Ltext0:
	.section	.text.CRC_DeInit,"ax",%progbits
	.align	1
	.global	CRC_DeInit
	.code	16
	.thumb_func
	.type	CRC_DeInit, %function
CRC_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_crc.c"
	.loc 1 95 0
	.loc 1 97 0
	ldr	r3, .L2
	mov	r2, #1
	neg	r2, r2
	.loc 1 99 0
	mov	r1, #0
	.loc 1 97 0
	str	r2, [r3]
	.loc 1 99 0
	strb	r1, [r3, #4]
	.loc 1 101 0
	str	r2, [r3, #16]
	.loc 1 103 0
	mov	r2, #1
	str	r2, [r3, #8]
	.loc 1 104 0
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073885184
.LFE32:
	.size	CRC_DeInit, .-CRC_DeInit
	.section	.text.CRC_ResetDR,"ax",%progbits
	.align	1
	.global	CRC_ResetDR
	.code	16
	.thumb_func
	.type	CRC_ResetDR, %function
CRC_ResetDR:
.LFB33:
	.loc 1 112 0
	.loc 1 114 0
	ldr	r3, .L5
	mov	r2, #1
	str	r2, [r3, #8]
	.loc 1 115 0
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073885184
.LFE33:
	.size	CRC_ResetDR, .-CRC_ResetDR
	.section	.text.CRC_ReverseInputDataSelect,"ax",%progbits
	.align	1
	.global	CRC_ReverseInputDataSelect
	.code	16
	.thumb_func
	.type	CRC_ReverseInputDataSelect, %function
CRC_ReverseInputDataSelect:
.LFB34:
	.loc 1 128 0
.LVL0:
	.loc 1 135 0
	ldr	r3, .L8
	.loc 1 138 0
	mov	r1, #96
	.loc 1 135 0
	ldr	r2, [r3, #8]
.LVL1:
	.loc 1 144 0
	@ sp needed
	.loc 1 138 0
	bic	r2, r1
.LVL2:
	.loc 1 140 0
	orr	r0, r2
.LVL3:
	.loc 1 143 0
	str	r0, [r3, #8]
	.loc 1 144 0
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073885184
.LFE34:
	.size	CRC_ReverseInputDataSelect, .-CRC_ReverseInputDataSelect
	.section	.text.CRC_ReverseOutputDataCmd,"ax",%progbits
	.align	1
	.global	CRC_ReverseOutputDataCmd
	.code	16
	.thumb_func
	.type	CRC_ReverseOutputDataCmd, %function
CRC_ReverseOutputDataCmd:
.LFB35:
	.loc 1 154 0
.LVL4:
	ldr	r3, .L15
	mov	r2, #128
	.loc 1 161 0
	ldr	r1, [r3, #8]
	.loc 1 158 0
	cmp	r0, #0
	beq	.L11
	.loc 1 161 0
	orr	r2, r1
	b	.L13
.L11:
	.loc 1 166 0
	bic	r1, r2
	mov	r2, r1
.L13:
	str	r2, [r3, #8]
	.loc 1 168 0
	@ sp needed
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073885184
.LFE35:
	.size	CRC_ReverseOutputDataCmd, .-CRC_ReverseOutputDataCmd
	.section	.text.CRC_SetInitRegister,"ax",%progbits
	.align	1
	.global	CRC_SetInitRegister
	.code	16
	.thumb_func
	.type	CRC_SetInitRegister, %function
CRC_SetInitRegister:
.LFB36:
	.loc 1 177 0
.LVL5:
	.loc 1 178 0
	ldr	r3, .L18
	.loc 1 179 0
	@ sp needed
	.loc 1 178 0
	str	r0, [r3, #16]
	.loc 1 179 0
	bx	lr
.L19:
	.align	2
.L18:
	.word	1073885184
.LFE36:
	.size	CRC_SetInitRegister, .-CRC_SetInitRegister
	.section	.text.CRC_CalcCRC,"ax",%progbits
	.align	1
	.global	CRC_CalcCRC
	.code	16
	.thumb_func
	.type	CRC_CalcCRC, %function
CRC_CalcCRC:
.LFB37:
	.loc 1 203 0
.LVL6:
	.loc 1 204 0
	ldr	r3, .L21
	.loc 1 207 0
	@ sp needed
	.loc 1 204 0
	str	r0, [r3]
	.loc 1 206 0
	ldr	r0, [r3]
.LVL7:
	.loc 1 207 0
	bx	lr
.L22:
	.align	2
.L21:
	.word	1073885184
.LFE37:
	.size	CRC_CalcCRC, .-CRC_CalcCRC
	.section	.text.CRC_CalcBlockCRC,"ax",%progbits
	.align	1
	.global	CRC_CalcBlockCRC
	.code	16
	.thumb_func
	.type	CRC_CalcBlockCRC, %function
CRC_CalcBlockCRC:
.LFB38:
	.loc 1 216 0
.LVL8:
	lsl	r1, r1, #2
.LVL9:
	add	r1, r0, r1
.LVL10:
.L24:
	ldr	r3, .L27
	.loc 1 219 0 discriminator 1
	cmp	r0, r1
	beq	.L26
	.loc 1 221 0 discriminator 2
	ldmia	r0!, {r2}
	str	r2, [r3]
	b	.L24
.L26:
	.loc 1 223 0
	ldr	r0, [r3]
	.loc 1 224 0
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
	.word	1073885184
.LFE38:
	.size	CRC_CalcBlockCRC, .-CRC_CalcBlockCRC
	.section	.text.CRC_GetCRC,"ax",%progbits
	.align	1
	.global	CRC_GetCRC
	.code	16
	.thumb_func
	.type	CRC_GetCRC, %function
CRC_GetCRC:
.LFB39:
	.loc 1 232 0
	.loc 1 233 0
	ldr	r3, .L30
	.loc 1 234 0
	@ sp needed
	.loc 1 233 0
	ldr	r0, [r3]
	.loc 1 234 0
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073885184
.LFE39:
	.size	CRC_GetCRC, .-CRC_GetCRC
	.section	.text.CRC_SetIDRegister,"ax",%progbits
	.align	1
	.global	CRC_SetIDRegister
	.code	16
	.thumb_func
	.type	CRC_SetIDRegister, %function
CRC_SetIDRegister:
.LFB40:
	.loc 1 258 0
.LVL11:
	.loc 1 259 0
	ldr	r3, .L33
	.loc 1 260 0
	@ sp needed
	.loc 1 259 0
	strb	r0, [r3, #4]
	.loc 1 260 0
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073885184
.LFE40:
	.size	CRC_SetIDRegister, .-CRC_SetIDRegister
	.section	.text.CRC_GetIDRegister,"ax",%progbits
	.align	1
	.global	CRC_GetIDRegister
	.code	16
	.thumb_func
	.type	CRC_GetIDRegister, %function
CRC_GetIDRegister:
.LFB41:
	.loc 1 268 0
	.loc 1 269 0
	ldr	r3, .L36
	.loc 1 270 0
	@ sp needed
	.loc 1 269 0
	ldrb	r0, [r3, #4]
	uxtb	r0, r0
	.loc 1 270 0
	bx	lr
.L37:
	.align	2
.L36:
	.word	1073885184
.LFE41:
	.size	CRC_GetIDRegister, .-CRC_GetIDRegister
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
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.align	2
.LEFDE18:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x27d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x1
	.4byte	.LASF39
	.4byte	.LASF40
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
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	0x5e
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0x9f
	.uleb128 0x7
	.4byte	.LASF11
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF12
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0xe1
	.4byte	0x8a
	.uleb128 0x8
	.byte	0x14
	.byte	0x3
	.2byte	0x120
	.4byte	0x10d
	.uleb128 0x9
	.ascii	"DR\000"
	.byte	0x3
	.2byte	0x122
	.4byte	0x85
	.byte	0
	.uleb128 0x9
	.ascii	"IDR\000"
	.byte	0x3
	.2byte	0x123
	.4byte	0x10d
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x124
	.4byte	0x2c
	.byte	0x5
	.uleb128 0xa
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x125
	.4byte	0x45
	.byte	0x6
	.uleb128 0x9
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x126
	.4byte	0x85
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x127
	.4byte	0x5e
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x128
	.4byte	0x85
	.byte	0x10
	.byte	0
	.uleb128 0x5
	.4byte	0x2c
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x129
	.4byte	0xaa
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x6f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x7f
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x174
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x7f
	.4byte	0x5e
	.4byte	.LLST0
	.uleb128 0xf
	.4byte	.LASF32
	.byte	0x1
	.byte	0x81
	.4byte	0x5e
	.4byte	.LLST1
	.byte	0
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x99
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x197
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x1
	.byte	0x99
	.4byte	0x9f
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0xb0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ba
	.uleb128 0x10
	.4byte	.LASF26
	.byte	0x1
	.byte	0xb0
	.4byte	0x5e
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0xca
	.4byte	0x5e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e3
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x1
	.byte	0xca
	.4byte	0x5e
	.4byte	.LLST2
	.byte	0
	.uleb128 0x11
	.4byte	.LASF29
	.byte	0x1
	.byte	0xd7
	.4byte	0x5e
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x22a
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x1
	.byte	0xd7
	.4byte	0x22a
	.4byte	.LLST3
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x1
	.byte	0xd7
	.4byte	0x5e
	.4byte	.LLST4
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0xd9
	.4byte	0x5e
	.4byte	.LLST5
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x5e
	.uleb128 0x13
	.4byte	.LASF36
	.byte	0x1
	.byte	0xe7
	.4byte	0x5e
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x101
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26a
	.uleb128 0x15
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x101
	.4byte	0x2c
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x16
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x10b
	.4byte	0x2c
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
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
	.uleb128 0xa
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
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x5
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
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
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
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL3
	.4byte	.LFE34
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL7
	.4byte	.LFE37
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL10
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL9
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x64
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
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
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
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF0:
	.ascii	"signed char\000"
.LASF25:
	.ascii	"CRC_SetInitRegister\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF32:
	.ascii	"tmpcr\000"
.LASF17:
	.ascii	"INIT\000"
.LASF13:
	.ascii	"FunctionalState\000"
.LASF36:
	.ascii	"CRC_GetCRC\000"
.LASF14:
	.ascii	"RESERVED0\000"
.LASF15:
	.ascii	"RESERVED1\000"
.LASF16:
	.ascii	"RESERVED2\000"
.LASF28:
	.ascii	"CRC_CalcCRC\000"
.LASF21:
	.ascii	"CRC_ReverseInputDataSelect\000"
.LASF12:
	.ascii	"ENABLE\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF26:
	.ascii	"CRC_InitValue\000"
.LASF35:
	.ascii	"CRC_IDValue\000"
.LASF24:
	.ascii	"NewState\000"
.LASF18:
	.ascii	"CRC_TypeDef\000"
.LASF38:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF22:
	.ascii	"CRC_ReverseOutputDataCmd\000"
.LASF27:
	.ascii	"CRC_Data\000"
.LASF29:
	.ascii	"CRC_CalcBlockCRC\000"
.LASF23:
	.ascii	"CRC_ReverseInputData\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF30:
	.ascii	"pBuffer\000"
.LASF20:
	.ascii	"CRC_ResetDR\000"
.LASF39:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../chip/stm32/stm32f030/lib/src/stm32f0"
	.ascii	"xx_crc.c\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF33:
	.ascii	"index\000"
.LASF37:
	.ascii	"CRC_GetIDRegister\000"
.LASF2:
	.ascii	"short int\000"
.LASF31:
	.ascii	"BufferLength\000"
.LASF40:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF19:
	.ascii	"CRC_DeInit\000"
.LASF11:
	.ascii	"DISABLE\000"
.LASF34:
	.ascii	"CRC_SetIDRegister\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
