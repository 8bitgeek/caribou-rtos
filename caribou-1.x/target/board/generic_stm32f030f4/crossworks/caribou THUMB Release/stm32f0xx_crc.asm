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
	.file	"stm32f0xx_crc.c"
	.text
.Ltext0:
	.section	.text.CRC_DeInit,"ax",%progbits
	.align	2
	.global	CRC_DeInit
	.code	16
	.thumb_func
	.type	CRC_DeInit, %function
CRC_DeInit:
.LFB32:
	ldr	r3, .L2
	mov	r2, #1
	neg	r2, r2
	str	r2, [r3]
	mov	r1, #0
	strb	r1, [r3, #4]
	str	r2, [r3, #16]
	mov	r2, #1
	str	r2, [r3, #8]
	@ sp needed
	bx	lr
.L3:
	.align	2
.L2:
	.word	1073885184
.LFE32:
	.size	CRC_DeInit, .-CRC_DeInit
	.section	.text.CRC_ResetDR,"ax",%progbits
	.align	2
	.global	CRC_ResetDR
	.code	16
	.thumb_func
	.type	CRC_ResetDR, %function
CRC_ResetDR:
.LFB33:
	mov	r2, #1
	ldr	r3, .L5
	str	r2, [r3, #8]
	@ sp needed
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073885184
.LFE33:
	.size	CRC_ResetDR, .-CRC_ResetDR
	.section	.text.CRC_ReverseInputDataSelect,"ax",%progbits
	.align	2
	.global	CRC_ReverseInputDataSelect
	.code	16
	.thumb_func
	.type	CRC_ReverseInputDataSelect, %function
CRC_ReverseInputDataSelect:
.LFB34:
	ldr	r3, .L8
	ldr	r2, [r3, #8]
	mov	r1, #96
	bic	r2, r1
	orr	r0, r2
	str	r0, [r3, #8]
	@ sp needed
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073885184
.LFE34:
	.size	CRC_ReverseInputDataSelect, .-CRC_ReverseInputDataSelect
	.section	.text.CRC_ReverseOutputDataCmd,"ax",%progbits
	.align	2
	.global	CRC_ReverseOutputDataCmd
	.code	16
	.thumb_func
	.type	CRC_ReverseOutputDataCmd, %function
CRC_ReverseOutputDataCmd:
.LFB35:
	cmp	r0, #0
	beq	.L11
	ldr	r3, .L13
	ldr	r1, [r3, #8]
	mov	r2, #128
	orr	r2, r1
	str	r2, [r3, #8]
	b	.L10
.L11:
	ldr	r3, .L13
	ldr	r2, [r3, #8]
	mov	r1, #128
	bic	r2, r1
	str	r2, [r3, #8]
.L10:
	@ sp needed
	bx	lr
.L14:
	.align	2
.L13:
	.word	1073885184
.LFE35:
	.size	CRC_ReverseOutputDataCmd, .-CRC_ReverseOutputDataCmd
	.section	.text.CRC_SetInitRegister,"ax",%progbits
	.align	2
	.global	CRC_SetInitRegister
	.code	16
	.thumb_func
	.type	CRC_SetInitRegister, %function
CRC_SetInitRegister:
.LFB36:
	ldr	r3, .L16
	str	r0, [r3, #16]
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073885184
.LFE36:
	.size	CRC_SetInitRegister, .-CRC_SetInitRegister
	.section	.text.CRC_CalcCRC,"ax",%progbits
	.align	2
	.global	CRC_CalcCRC
	.code	16
	.thumb_func
	.type	CRC_CalcCRC, %function
CRC_CalcCRC:
.LFB37:
	ldr	r3, .L19
	str	r0, [r3]
	ldr	r0, [r3]
	@ sp needed
	bx	lr
.L20:
	.align	2
.L19:
	.word	1073885184
.LFE37:
	.size	CRC_CalcCRC, .-CRC_CalcCRC
	.section	.text.CRC_CalcBlockCRC,"ax",%progbits
	.align	2
	.global	CRC_CalcBlockCRC
	.code	16
	.thumb_func
	.type	CRC_CalcBlockCRC, %function
CRC_CalcBlockCRC:
.LFB38:
	push	{r4, lr}
.LCFI0:
	cmp	r1, #0
	beq	.L22
	mov	r3, r0
	lsl	r1, r1, #2
	add	r0, r0, r1
	ldr	r4, .L24
.L23:
	ldmia	r3!, {r2}
	str	r2, [r4]
	cmp	r3, r0
	bne	.L23
.L22:
	ldr	r3, .L24
	ldr	r0, [r3]
	@ sp needed
	pop	{r4, pc}
.L25:
	.align	2
.L24:
	.word	1073885184
.LFE38:
	.size	CRC_CalcBlockCRC, .-CRC_CalcBlockCRC
	.section	.text.CRC_GetCRC,"ax",%progbits
	.align	2
	.global	CRC_GetCRC
	.code	16
	.thumb_func
	.type	CRC_GetCRC, %function
CRC_GetCRC:
.LFB39:
	ldr	r3, .L27
	ldr	r0, [r3]
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
	.word	1073885184
.LFE39:
	.size	CRC_GetCRC, .-CRC_GetCRC
	.section	.text.CRC_SetIDRegister,"ax",%progbits
	.align	2
	.global	CRC_SetIDRegister
	.code	16
	.thumb_func
	.type	CRC_SetIDRegister, %function
CRC_SetIDRegister:
.LFB40:
	ldr	r3, .L30
	strb	r0, [r3, #4]
	@ sp needed
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073885184
.LFE40:
	.size	CRC_SetIDRegister, .-CRC_SetIDRegister
	.section	.text.CRC_GetIDRegister,"ax",%progbits
	.align	2
	.global	CRC_GetIDRegister
	.code	16
	.thumb_func
	.type	CRC_GetIDRegister, %function
CRC_GetIDRegister:
.LFB41:
	ldr	r3, .L33
	ldrb	r0, [r3, #4]
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
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
	.byte	0x4
	.4byte	.LCFI0-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_crc.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xc6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF10
	.byte	0x1
	.4byte	.LASF11
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x5e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x6f
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x7f
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
	.byte	0xb0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x1
	.byte	0xca
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x1
	.byte	0xd7
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x1
	.byte	0xe7
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x101
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x10b
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
	.uleb128 0x5
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
.LASF6:
	.ascii	"CRC_CalcBlockCRC\000"
.LASF11:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_crc.c\000"
.LASF4:
	.ascii	"CRC_SetInitRegister\000"
.LASF8:
	.ascii	"CRC_SetIDRegister\000"
.LASF9:
	.ascii	"CRC_GetIDRegister\000"
.LASF1:
	.ascii	"CRC_ResetDR\000"
.LASF10:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF7:
	.ascii	"CRC_GetCRC\000"
.LASF5:
	.ascii	"CRC_CalcCRC\000"
.LASF2:
	.ascii	"CRC_ReverseInputDataSelect\000"
.LASF3:
	.ascii	"CRC_ReverseOutputDataCmd\000"
.LASF0:
	.ascii	"CRC_DeInit\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
