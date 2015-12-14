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
	.file	"stm32f0xx_dma.c"
	.text
.Ltext0:
	.section	.text.DMA_DeInit,"ax",%progbits
	.align	2
	.global	DMA_DeInit
	.code	16
	.thumb_func
	.type	DMA_DeInit, %function
DMA_DeInit:
.LFB32:
	ldr	r2, [r0]
	ldr	r3, .L7
	and	r3, r2
	str	r3, [r0]
	mov	r3, #0
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	ldr	r3, .L7+4
	cmp	r0, r3
	bne	.L2
	ldr	r3, .L7+8
	ldr	r1, [r3, #4]
	mov	r2, #15
	orr	r2, r1
	str	r2, [r3, #4]
	b	.L1
.L2:
	ldr	r3, .L7+12
	cmp	r0, r3
	bne	.L4
	ldr	r3, .L7+8
	ldr	r1, [r3, #4]
	mov	r2, #240
	orr	r2, r1
	str	r2, [r3, #4]
	b	.L1
.L4:
	ldr	r3, .L7+16
	cmp	r0, r3
	bne	.L5
	ldr	r3, .L7+8
	ldr	r1, [r3, #4]
	mov	r2, #240
	lsl	r2, r2, #4
	orr	r2, r1
	str	r2, [r3, #4]
	b	.L1
.L5:
	ldr	r3, .L7+20
	cmp	r0, r3
	bne	.L6
	ldr	r3, .L7+8
	ldr	r1, [r3, #4]
	mov	r2, #240
	lsl	r2, r2, #8
	orr	r2, r1
	str	r2, [r3, #4]
	b	.L1
.L6:
	ldr	r3, .L7+24
	cmp	r0, r3
	bne	.L1
	ldr	r3, .L7+8
	ldr	r1, [r3, #4]
	mov	r2, #240
	lsl	r2, r2, #12
	orr	r2, r1
	str	r2, [r3, #4]
.L1:
	@ sp needed
	bx	lr
.L8:
	.align	2
.L7:
	.word	65534
	.word	1073872904
	.word	1073872896
	.word	1073872924
	.word	1073872944
	.word	1073872964
	.word	1073872984
.LFE32:
	.size	DMA_DeInit, .-DMA_DeInit
	.section	.text.DMA_Init,"ax",%progbits
	.align	2
	.global	DMA_Init
	.code	16
	.thumb_func
	.type	DMA_Init, %function
DMA_Init:
.LFB33:
	push	{r4, lr}
.LCFI0:
	ldr	r2, [r0]
	ldr	r3, .L10
	and	r2, r3
	ldr	r3, [r1, #32]
	ldr	r4, [r1, #8]
	orr	r3, r4
	ldr	r4, [r1, #16]
	orr	r3, r4
	ldr	r4, [r1, #20]
	orr	r3, r4
	ldr	r4, [r1, #24]
	orr	r3, r4
	ldr	r4, [r1, #28]
	orr	r3, r4
	ldr	r4, [r1, #36]
	orr	r3, r4
	ldr	r4, [r1, #40]
	orr	r3, r4
	orr	r3, r2
	str	r3, [r0]
	ldr	r3, [r1, #12]
	str	r3, [r0, #4]
	ldr	r4, [r1]
	str	r4, [r0, #8]
	ldr	r3, [r1, #4]
	str	r3, [r0, #12]
	@ sp needed
	pop	{r4, pc}
.L11:
	.align	2
.L10:
	.word	-32753
.LFE33:
	.size	DMA_Init, .-DMA_Init
	.section	.text.DMA_StructInit,"ax",%progbits
	.align	2
	.global	DMA_StructInit
	.code	16
	.thumb_func
	.type	DMA_StructInit, %function
DMA_StructInit:
.LFB34:
	mov	r3, #0
	str	r3, [r0]
	str	r3, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	str	r3, [r0, #40]
	@ sp needed
	bx	lr
.LFE34:
	.size	DMA_StructInit, .-DMA_StructInit
	.section	.text.DMA_Cmd,"ax",%progbits
	.align	2
	.global	DMA_Cmd
	.code	16
	.thumb_func
	.type	DMA_Cmd, %function
DMA_Cmd:
.LFB35:
	cmp	r1, #0
	beq	.L14
	ldr	r2, [r0]
	mov	r3, #1
	orr	r3, r2
	str	r3, [r0]
	b	.L13
.L14:
	ldr	r2, [r0]
	ldr	r3, .L16
	and	r3, r2
	str	r3, [r0]
.L13:
	@ sp needed
	bx	lr
.L17:
	.align	2
.L16:
	.word	65534
.LFE35:
	.size	DMA_Cmd, .-DMA_Cmd
	.section	.text.DMA_SetCurrDataCounter,"ax",%progbits
	.align	2
	.global	DMA_SetCurrDataCounter
	.code	16
	.thumb_func
	.type	DMA_SetCurrDataCounter, %function
DMA_SetCurrDataCounter:
.LFB36:
	str	r1, [r0, #4]
	@ sp needed
	bx	lr
.LFE36:
	.size	DMA_SetCurrDataCounter, .-DMA_SetCurrDataCounter
	.section	.text.DMA_GetCurrDataCounter,"ax",%progbits
	.align	2
	.global	DMA_GetCurrDataCounter
	.code	16
	.thumb_func
	.type	DMA_GetCurrDataCounter, %function
DMA_GetCurrDataCounter:
.LFB37:
	ldr	r0, [r0, #4]
	uxth	r0, r0
	@ sp needed
	bx	lr
.LFE37:
	.size	DMA_GetCurrDataCounter, .-DMA_GetCurrDataCounter
	.section	.text.DMA_ITConfig,"ax",%progbits
	.align	2
	.global	DMA_ITConfig
	.code	16
	.thumb_func
	.type	DMA_ITConfig, %function
DMA_ITConfig:
.LFB38:
	cmp	r2, #0
	beq	.L21
	ldr	r3, [r0]
	orr	r1, r3
	str	r1, [r0]
	b	.L20
.L21:
	ldr	r3, [r0]
	bic	r3, r1
	str	r3, [r0]
.L20:
	@ sp needed
	bx	lr
.LFE38:
	.size	DMA_ITConfig, .-DMA_ITConfig
	.section	.text.DMA_GetFlagStatus,"ax",%progbits
	.align	2
	.global	DMA_GetFlagStatus
	.code	16
	.thumb_func
	.type	DMA_GetFlagStatus, %function
DMA_GetFlagStatus:
.LFB39:
	ldr	r3, .L24
	ldr	r3, [r3]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	1073872896
.LFE39:
	.size	DMA_GetFlagStatus, .-DMA_GetFlagStatus
	.section	.text.DMA_ClearFlag,"ax",%progbits
	.align	2
	.global	DMA_ClearFlag
	.code	16
	.thumb_func
	.type	DMA_ClearFlag, %function
DMA_ClearFlag:
.LFB40:
	ldr	r3, .L27
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
	.word	1073872896
.LFE40:
	.size	DMA_ClearFlag, .-DMA_ClearFlag
	.section	.text.DMA_GetITStatus,"ax",%progbits
	.align	2
	.global	DMA_GetITStatus
	.code	16
	.thumb_func
	.type	DMA_GetITStatus, %function
DMA_GetITStatus:
.LFB41:
	ldr	r3, .L30
	ldr	r3, [r3]
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	uxtb	r0, r0
	@ sp needed
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073872896
.LFE41:
	.size	DMA_GetITStatus, .-DMA_GetITStatus
	.section	.text.DMA_ClearITPendingBit,"ax",%progbits
	.align	2
	.global	DMA_ClearITPendingBit
	.code	16
	.thumb_func
	.type	DMA_ClearITPendingBit, %function
DMA_ClearITPendingBit:
.LFB42:
	ldr	r3, .L33
	str	r0, [r3, #4]
	@ sp needed
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073872896
.LFE42:
	.size	DMA_ClearITPendingBit, .-DMA_ClearITPendingBit
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
	.byte	0x4
	.4byte	.LCFI0-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
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
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.align	2
.LEFDE20:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dma.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xdd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0x1
	.4byte	.LASF12
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x7e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0xf4
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x117
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.2byte	0x152
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x1
	.2byte	0x164
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x1
	.2byte	0x1e3
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x21a
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF9
	.byte	0x1
	.2byte	0x244
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x1
	.2byte	0x27b
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
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
	.4byte	0x6c
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
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
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
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF4:
	.ascii	"DMA_SetCurrDataCounter\000"
.LASF8:
	.ascii	"DMA_ClearFlag\000"
.LASF7:
	.ascii	"DMA_GetFlagStatus\000"
.LASF1:
	.ascii	"DMA_Init\000"
.LASF5:
	.ascii	"DMA_GetCurrDataCounter\000"
.LASF11:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF9:
	.ascii	"DMA_GetITStatus\000"
.LASF10:
	.ascii	"DMA_ClearITPendingBit\000"
.LASF12:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_dma.c\000"
.LASF2:
	.ascii	"DMA_StructInit\000"
.LASF6:
	.ascii	"DMA_ITConfig\000"
.LASF0:
	.ascii	"DMA_DeInit\000"
.LASF3:
	.ascii	"DMA_Cmd\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
