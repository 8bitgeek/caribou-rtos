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
	.file	"stm32f0xx_misc.c"
	.text
.Ltext0:
	.section	.text.NVIC_Init,"ax",%progbits
	.align	2
	.global	NVIC_Init
	.code	16
	.thumb_func
	.type	NVIC_Init, %function
NVIC_Init:
.LFB32:
	push	{r4, r5, r6, lr}
.LCFI0:
	ldrb	r3, [r0, #2]
	cmp	r3, #0
	beq	.L2
	ldrb	r5, [r0]
	lsr	r2, r5, #2
	lsl	r2, r2, #2
	ldr	r3, .L4
	add	r2, r2, r3
	mov	r3, #192
	lsl	r3, r3, #2
	ldr	r6, [r2, r3]
	mov	r1, #3
	and	r5, r1
	lsl	r1, r5, #3
	mov	r4, #255
	mov	r5, r4
	lsl	r5, r5, r1
	bic	r6, r5
	mov	r5, r6
	ldrb	r6, [r0, #1]
	lsl	r6, r6, #6
	and	r4, r6
	lsl	r4, r4, r1
	mov	r1, r5
	orr	r1, r4
	str	r1, [r2, r3]
	ldrb	r3, [r0]
	mov	r2, #31
	and	r2, r3
	mov	r3, #1
	lsl	r3, r3, r2
	mov	r2, r3
	ldr	r3, .L4
	str	r2, [r3]
	b	.L1
.L2:
	ldrb	r3, [r0]
	mov	r1, #31
	and	r1, r3
	mov	r3, #1
	lsl	r3, r3, r1
	mov	r1, r3
	mov	r3, #128
	ldr	r2, .L4
	str	r1, [r2, r3]
.L1:
	@ sp needed
	pop	{r4, r5, r6, pc}
.L5:
	.align	2
.L4:
	.word	-536813312
.LFE32:
	.size	NVIC_Init, .-NVIC_Init
	.section	.text.NVIC_SystemLPConfig,"ax",%progbits
	.align	2
	.global	NVIC_SystemLPConfig
	.code	16
	.thumb_func
	.type	NVIC_SystemLPConfig, %function
NVIC_SystemLPConfig:
.LFB33:
	cmp	r1, #0
	beq	.L7
	ldr	r3, .L9
	ldr	r2, [r3, #16]
	orr	r0, r2
	str	r0, [r3, #16]
	b	.L6
.L7:
	ldr	r3, .L9
	ldr	r2, [r3, #16]
	bic	r2, r0
	str	r2, [r3, #16]
.L6:
	@ sp needed
	bx	lr
.L10:
	.align	2
.L9:
	.word	-536810240
.LFE33:
	.size	NVIC_SystemLPConfig, .-NVIC_SystemLPConfig
	.section	.text.SysTick_CLKSourceConfig,"ax",%progbits
	.align	2
	.global	SysTick_CLKSourceConfig
	.code	16
	.thumb_func
	.type	SysTick_CLKSourceConfig, %function
SysTick_CLKSourceConfig:
.LFB34:
	cmp	r0, #4
	bne	.L12
	ldr	r3, .L14
	ldr	r1, [r3]
	mov	r2, #4
	orr	r2, r1
	str	r2, [r3]
	b	.L11
.L12:
	ldr	r3, .L14
	ldr	r2, [r3]
	mov	r1, #4
	bic	r2, r1
	str	r2, [r3]
.L11:
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
	.word	-536813552
.LFE34:
	.size	SysTick_CLKSourceConfig, .-SysTick_CLKSourceConfig
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
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x86
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
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_misc.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x4d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF3
	.byte	0x1
	.4byte	.LASF4
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x4f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x75
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
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
	.4byte	0x2c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF3:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"NVIC_SystemLPConfig\000"
.LASF4:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/lib/src/stm32f0xx_misc.c"
	.ascii	"\000"
.LASF2:
	.ascii	"SysTick_CLKSourceConfig\000"
.LASF0:
	.ascii	"NVIC_Init\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
