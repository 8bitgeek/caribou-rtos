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
	.file	"stm32f0xx_dma.c"
	.text
.Ltext0:
	.section	.text.DMA_DeInit,"ax",%progbits
	.align	1
	.global	DMA_DeInit
	.code	16
	.thumb_func
	.type	DMA_DeInit, %function
DMA_DeInit:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dma.c"
	.loc 1 127 0
.LVL0:
	.loc 1 132 0
	ldr	r2, [r0]
	ldr	r3, .L9
	and	r3, r2
	str	r3, [r0]
	.loc 1 135 0
	mov	r3, #0
	str	r3, [r0]
	.loc 1 138 0
	str	r3, [r0, #4]
	.loc 1 141 0
	str	r3, [r0, #8]
	.loc 1 144 0
	str	r3, [r0, #12]
	.loc 1 146 0
	ldr	r3, .L9+4
	cmp	r0, r3
	bne	.L2
	.loc 1 149 0
	ldr	r3, .L9+8
	mov	r1, #15
	ldr	r2, [r3, #4]
	b	.L7
.L2:
	.loc 1 151 0
	ldr	r3, .L9+12
	cmp	r0, r3
	bne	.L4
	.loc 1 154 0
	ldr	r3, .L9+8
	mov	r1, #240
	ldr	r2, [r3, #4]
	b	.L7
.L4:
	.loc 1 156 0
	ldr	r3, .L9+16
	cmp	r0, r3
	bne	.L5
	.loc 1 159 0
	ldr	r3, .L9+8
	mov	r2, #240
	ldr	r1, [r3, #4]
	lsl	r2, r2, #4
	b	.L7
.L5:
	.loc 1 161 0
	ldr	r3, .L9+20
	cmp	r0, r3
	bne	.L6
	.loc 1 164 0
	ldr	r3, .L9+8
	mov	r2, #240
	ldr	r1, [r3, #4]
	lsl	r2, r2, #8
	b	.L7
.L6:
	.loc 1 168 0
	ldr	r3, .L9+24
	cmp	r0, r3
	bne	.L1
	.loc 1 171 0
	ldr	r3, .L9+8
	mov	r2, #240
	ldr	r1, [r3, #4]
	lsl	r2, r2, #12
.L7:
	orr	r2, r1
	str	r2, [r3, #4]
.L1:
	.loc 1 174 0
	@ sp needed
	bx	lr
.L10:
	.align	2
.L9:
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
	.align	1
	.global	DMA_Init
	.code	16
	.thumb_func
	.type	DMA_Init, %function
DMA_Init:
.LFB33:
	.loc 1 186 0
.LVL1:
	.loc 1 203 0
	ldr	r2, [r0]
.LVL2:
	.loc 1 206 0
	ldr	r3, .L12
	.loc 1 186 0
	push	{r4, lr}
.LCFI0:
	.loc 1 206 0
	and	r2, r3
.LVL3:
	.loc 1 217 0
	ldr	r4, [r1, #8]
	ldr	r3, [r1, #32]
	.loc 1 236 0
	@ sp needed
	.loc 1 217 0
	orr	r3, r4
	ldr	r4, [r1, #16]
	orr	r3, r4
	.loc 1 218 0
	ldr	r4, [r1, #20]
	orr	r3, r4
	ldr	r4, [r1, #24]
	orr	r3, r4
	.loc 1 219 0
	ldr	r4, [r1, #28]
	orr	r3, r4
	ldr	r4, [r1, #36]
	orr	r3, r4
	.loc 1 220 0
	ldr	r4, [r1, #40]
	orr	r3, r4
	.loc 1 217 0
	orr	r3, r2
.LVL4:
	.loc 1 223 0
	str	r3, [r0]
	.loc 1 227 0
	ldr	r3, [r1, #12]
.LVL5:
	.loc 1 231 0
	ldr	r4, [r1]
	.loc 1 227 0
	str	r3, [r0, #4]
.LVL6:
	.loc 1 235 0
	ldr	r3, [r1, #4]
	.loc 1 231 0
	str	r4, [r0, #8]
	.loc 1 235 0
	str	r3, [r0, #12]
	.loc 1 236 0
	pop	{r4, pc}
.L13:
	.align	2
.L12:
	.word	-32753
.LFE33:
	.size	DMA_Init, .-DMA_Init
	.section	.text.DMA_StructInit,"ax",%progbits
	.align	1
	.global	DMA_StructInit
	.code	16
	.thumb_func
	.type	DMA_StructInit, %function
DMA_StructInit:
.LFB34:
	.loc 1 245 0
.LVL7:
	.loc 1 248 0
	mov	r3, #0
	str	r3, [r0]
	.loc 1 250 0
	str	r3, [r0, #4]
	.loc 1 252 0
	str	r3, [r0, #8]
	.loc 1 254 0
	str	r3, [r0, #12]
	.loc 1 256 0
	str	r3, [r0, #16]
	.loc 1 258 0
	str	r3, [r0, #20]
	.loc 1 260 0
	str	r3, [r0, #24]
	.loc 1 262 0
	str	r3, [r0, #28]
	.loc 1 264 0
	str	r3, [r0, #32]
	.loc 1 266 0
	str	r3, [r0, #36]
	.loc 1 268 0
	str	r3, [r0, #40]
	.loc 1 269 0
	@ sp needed
	bx	lr
.LFE34:
	.size	DMA_StructInit, .-DMA_StructInit
	.section	.text.DMA_Cmd,"ax",%progbits
	.align	1
	.global	DMA_Cmd
	.code	16
	.thumb_func
	.type	DMA_Cmd, %function
DMA_Cmd:
.LFB35:
	.loc 1 280 0
.LVL8:
	.loc 1 285 0
	cmp	r1, #0
	beq	.L16
	.loc 1 288 0
	ldr	r3, [r0]
	mov	r2, #1
	orr	r3, r2
	b	.L18
.L16:
	.loc 1 293 0
	ldr	r2, [r0]
	ldr	r3, .L19
	and	r3, r2
.L18:
	str	r3, [r0]
	.loc 1 295 0
	@ sp needed
	bx	lr
.L20:
	.align	2
.L19:
	.word	65534
.LFE35:
	.size	DMA_Cmd, .-DMA_Cmd
	.section	.text.DMA_SetCurrDataCounter,"ax",%progbits
	.align	1
	.global	DMA_SetCurrDataCounter
	.code	16
	.thumb_func
	.type	DMA_SetCurrDataCounter, %function
DMA_SetCurrDataCounter:
.LFB36:
	.loc 1 339 0
.LVL9:
	.loc 1 345 0
	str	r1, [r0, #4]
	.loc 1 346 0
	@ sp needed
	bx	lr
.LFE36:
	.size	DMA_SetCurrDataCounter, .-DMA_SetCurrDataCounter
	.section	.text.DMA_GetCurrDataCounter,"ax",%progbits
	.align	1
	.global	DMA_GetCurrDataCounter
	.code	16
	.thumb_func
	.type	DMA_GetCurrDataCounter, %function
DMA_GetCurrDataCounter:
.LFB37:
	.loc 1 357 0
.LVL10:
	.loc 1 361 0
	ldr	r0, [r0, #4]
.LVL11:
	.loc 1 362 0
	@ sp needed
	.loc 1 361 0
	uxth	r0, r0
	.loc 1 362 0
	bx	lr
.LFE37:
	.size	DMA_GetCurrDataCounter, .-DMA_GetCurrDataCounter
	.section	.text.DMA_ITConfig,"ax",%progbits
	.align	1
	.global	DMA_ITConfig
	.code	16
	.thumb_func
	.type	DMA_ITConfig, %function
DMA_ITConfig:
.LFB38:
	.loc 1 432 0
.LVL12:
	.loc 1 441 0
	ldr	r3, [r0]
	.loc 1 438 0
	cmp	r2, #0
	beq	.L24
	.loc 1 441 0
	orr	r1, r3
.LVL13:
	str	r1, [r0]
	b	.L23
.LVL14:
.L24:
	.loc 1 446 0
	bic	r3, r1
	str	r3, [r0]
.LVL15:
.L23:
	.loc 1 448 0
	@ sp needed
	bx	lr
.LFE38:
	.size	DMA_ITConfig, .-DMA_ITConfig
	.section	.text.DMA_GetFlagStatus,"ax",%progbits
	.align	1
	.global	DMA_GetFlagStatus
	.code	16
	.thumb_func
	.type	DMA_GetFlagStatus, %function
DMA_GetFlagStatus:
.LFB39:
	.loc 1 484 0
.LVL16:
	.loc 1 491 0
	ldr	r3, .L27
	.loc 1 504 0
	@ sp needed
	.loc 1 491 0
	ldr	r3, [r3]
.LVL17:
	and	r0, r3
.LVL18:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL19:
	.loc 1 503 0
	uxtb	r0, r0
	.loc 1 504 0
	bx	lr
.L28:
	.align	2
.L27:
	.word	1073872896
.LFE39:
	.size	DMA_GetFlagStatus, .-DMA_GetFlagStatus
	.section	.text.DMA_ClearFlag,"ax",%progbits
	.align	1
	.global	DMA_ClearFlag
	.code	16
	.thumb_func
	.type	DMA_ClearFlag, %function
DMA_ClearFlag:
.LFB40:
	.loc 1 539 0
.LVL20:
	.loc 1 544 0
	ldr	r3, .L30
	.loc 1 545 0
	@ sp needed
	.loc 1 544 0
	str	r0, [r3, #4]
	.loc 1 545 0
	bx	lr
.L31:
	.align	2
.L30:
	.word	1073872896
.LFE40:
	.size	DMA_ClearFlag, .-DMA_ClearFlag
	.section	.text.DMA_GetITStatus,"ax",%progbits
	.align	1
	.global	DMA_GetITStatus
	.code	16
	.thumb_func
	.type	DMA_GetITStatus, %function
DMA_GetITStatus:
.LFB41:
	.loc 1 581 0
.LVL21:
	.loc 1 588 0
	ldr	r3, .L33
	.loc 1 600 0
	@ sp needed
	.loc 1 588 0
	ldr	r3, [r3]
.LVL22:
	and	r0, r3
.LVL23:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL24:
	.loc 1 599 0
	uxtb	r0, r0
	.loc 1 600 0
	bx	lr
.L34:
	.align	2
.L33:
	.word	1073872896
.LFE41:
	.size	DMA_GetITStatus, .-DMA_GetITStatus
	.section	.text.DMA_ClearITPendingBit,"ax",%progbits
	.align	1
	.global	DMA_ClearITPendingBit
	.code	16
	.thumb_func
	.type	DMA_ClearITPendingBit, %function
DMA_ClearITPendingBit:
.LFB42:
	.loc 1 636 0
.LVL25:
	.loc 1 641 0
	ldr	r3, .L36
	.loc 1 642 0
	@ sp needed
	.loc 1 641 0
	str	r0, [r3, #4]
	.loc 1 642 0
	bx	lr
.L37:
	.align	2
.L36:
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
	.file 2 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 4 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_dma.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x3fa
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x1
	.4byte	.LASF53
	.4byte	.LASF54
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
	.4byte	.LASF4
	.byte	0x2
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
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x17
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x5
	.4byte	0x53
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xdf
	.4byte	0x94
	.uleb128 0x7
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0x8
	.ascii	"SET\000"
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0xdf
	.4byte	0x7f
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0xdf
	.4byte	0x7f
	.uleb128 0x6
	.byte	0x1
	.byte	0x3
	.byte	0xe1
	.4byte	0xbf
	.uleb128 0x7
	.4byte	.LASF13
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF14
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0xe1
	.4byte	0xaa
	.uleb128 0x9
	.byte	0x10
	.byte	0x3
	.2byte	0x14d
	.4byte	0x108
	.uleb128 0xa
	.ascii	"CCR\000"
	.byte	0x3
	.2byte	0x14f
	.4byte	0x7a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x150
	.4byte	0x7a
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x151
	.4byte	0x7a
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x152
	.4byte	0x7a
	.byte	0xc
	.byte	0
	.uleb128 0xc
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x153
	.4byte	0xca
	.uleb128 0x9
	.byte	0x8
	.byte	0x3
	.2byte	0x155
	.4byte	0x138
	.uleb128 0xa
	.ascii	"ISR\000"
	.byte	0x3
	.2byte	0x157
	.4byte	0x7a
	.byte	0
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x158
	.4byte	0x7a
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x159
	.4byte	0x114
	.uleb128 0xd
	.byte	0x2c
	.byte	0x4
	.byte	0x34
	.4byte	0x1d1
	.uleb128 0xe
	.4byte	.LASF22
	.byte	0x4
	.byte	0x36
	.4byte	0x53
	.byte	0
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x4
	.byte	0x38
	.4byte	0x53
	.byte	0x4
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x4
	.byte	0x3a
	.4byte	0x53
	.byte	0x8
	.uleb128 0xe
	.4byte	.LASF25
	.byte	0x4
	.byte	0x3d
	.4byte	0x53
	.byte	0xc
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x4
	.byte	0x41
	.4byte	0x53
	.byte	0x10
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x4
	.byte	0x44
	.4byte	0x53
	.byte	0x14
	.uleb128 0xe
	.4byte	.LASF28
	.byte	0x4
	.byte	0x47
	.4byte	0x53
	.byte	0x18
	.uleb128 0xe
	.4byte	.LASF29
	.byte	0x4
	.byte	0x4a
	.4byte	0x53
	.byte	0x1c
	.uleb128 0xe
	.4byte	.LASF30
	.byte	0x4
	.byte	0x4d
	.4byte	0x53
	.byte	0x20
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x4
	.byte	0x52
	.4byte	0x53
	.byte	0x24
	.uleb128 0xe
	.4byte	.LASF32
	.byte	0x4
	.byte	0x55
	.4byte	0x53
	.byte	0x28
	.byte	0
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x4
	.byte	0x57
	.4byte	0x144
	.uleb128 0xf
	.4byte	.LASF34
	.byte	0x1
	.byte	0x7e
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1ff
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0x7e
	.4byte	0x1ff
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x108
	.uleb128 0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x244
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0xb9
	.4byte	0x1ff
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0xb9
	.4byte	0x244
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x12
	.4byte	.LASF48
	.byte	0x1
	.byte	0xbb
	.4byte	0x53
	.4byte	.LLST0
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x1d1
	.uleb128 0xf
	.4byte	.LASF38
	.byte	0x1
	.byte	0xf4
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26d
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0xf4
	.4byte	0x244
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x13
	.4byte	.LASF39
	.byte	0x1
	.2byte	0x117
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2a0
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x117
	.4byte	0x1ff
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x117
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x13
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x152
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d3
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x152
	.4byte	0x1ff
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x152
	.4byte	0x3a
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x15
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x164
	.4byte	0x3a
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2fe
	.uleb128 0x16
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x164
	.4byte	0x1ff
	.4byte	.LLST1
	.byte	0
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x1af
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x341
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x1af
	.4byte	0x1ff
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x1af
	.4byte	0x53
	.4byte	.LLST2
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x1af
	.4byte	0xbf
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.uleb128 0x15
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x1e3
	.4byte	0x94
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x37c
	.uleb128 0x16
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x1e3
	.4byte	0x53
	.4byte	.LLST3
	.uleb128 0x17
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x1e5
	.4byte	0x94
	.4byte	.LLST4
	.byte	0
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x21a
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a1
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x21a
	.4byte	0x53
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x244
	.4byte	0x9f
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3dc
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x244
	.4byte	0x53
	.4byte	.LLST5
	.uleb128 0x17
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x246
	.4byte	0x9f
	.4byte	.LLST6
	.byte	0
	.uleb128 0x18
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x27b
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x27b
	.4byte	0x53
	.uleb128 0x1
	.byte	0x50
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x70
	.sleb128 0
	.4byte	.LVL6
	.4byte	.LFE33
	.2byte	0x23
	.byte	0x71
	.sleb128 32
	.byte	0x6
	.byte	0x71
	.sleb128 8
	.byte	0x6
	.byte	0x21
	.byte	0x71
	.sleb128 16
	.byte	0x6
	.byte	0x21
	.byte	0x71
	.sleb128 20
	.byte	0x6
	.byte	0x21
	.byte	0x71
	.sleb128 24
	.byte	0x6
	.byte	0x21
	.byte	0x71
	.sleb128 28
	.byte	0x6
	.byte	0x21
	.byte	0x71
	.sleb128 36
	.byte	0x6
	.byte	0x21
	.byte	0x71
	.sleb128 40
	.byte	0x6
	.byte	0x21
	.byte	0x72
	.sleb128 0
	.byte	0x21
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL11
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL15
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL16
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL21
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL23
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x8
	.byte	0x70
	.sleb128 0
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x73
	.sleb128 0
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
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
.LASF51:
	.ascii	"DMA_GetITStatus\000"
.LASF12:
	.ascii	"ITStatus\000"
.LASF18:
	.ascii	"CMAR\000"
.LASF49:
	.ascii	"bitstatus\000"
.LASF34:
	.ascii	"DMA_DeInit\000"
.LASF43:
	.ascii	"DMA_ITConfig\000"
.LASF35:
	.ascii	"DMA_Init\000"
.LASF15:
	.ascii	"FunctionalState\000"
.LASF26:
	.ascii	"DMA_PeripheralInc\000"
.LASF39:
	.ascii	"DMA_Cmd\000"
.LASF20:
	.ascii	"IFCR\000"
.LASF55:
	.ascii	"DMA_ClearITPendingBit\000"
.LASF53:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/lib/src/stm32f0xx_dma.c\000"
.LASF47:
	.ascii	"DMA_FLAG\000"
.LASF0:
	.ascii	"signed char\000"
.LASF31:
	.ascii	"DMA_Priority\000"
.LASF45:
	.ascii	"DMA_GetCurrDataCounter\000"
.LASF16:
	.ascii	"CNDTR\000"
.LASF11:
	.ascii	"FlagStatus\000"
.LASF32:
	.ascii	"DMA_M2M\000"
.LASF10:
	.ascii	"RESET\000"
.LASF44:
	.ascii	"DMA_IT\000"
.LASF37:
	.ascii	"DMA_InitStruct\000"
.LASF24:
	.ascii	"DMA_DIR\000"
.LASF52:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF33:
	.ascii	"DMA_InitTypeDef\000"
.LASF21:
	.ascii	"DMA_TypeDef\000"
.LASF46:
	.ascii	"DMA_GetFlagStatus\000"
.LASF27:
	.ascii	"DMA_MemoryInc\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF6:
	.ascii	"unsigned int\000"
.LASF50:
	.ascii	"DMA_ClearFlag\000"
.LASF30:
	.ascii	"DMA_Mode\000"
.LASF8:
	.ascii	"long long unsigned int\000"
.LASF23:
	.ascii	"DMA_MemoryBaseAddr\000"
.LASF41:
	.ascii	"DMA_SetCurrDataCounter\000"
.LASF54:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF38:
	.ascii	"DMA_StructInit\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF29:
	.ascii	"DMA_MemoryDataSize\000"
.LASF7:
	.ascii	"long long int\000"
.LASF42:
	.ascii	"DataNumber\000"
.LASF25:
	.ascii	"DMA_BufferSize\000"
.LASF2:
	.ascii	"short int\000"
.LASF48:
	.ascii	"tmpreg\000"
.LASF40:
	.ascii	"NewState\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF14:
	.ascii	"ENABLE\000"
.LASF17:
	.ascii	"CPAR\000"
.LASF5:
	.ascii	"uint32_t\000"
.LASF28:
	.ascii	"DMA_PeripheralDataSize\000"
.LASF13:
	.ascii	"DISABLE\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF22:
	.ascii	"DMA_PeripheralBaseAddr\000"
.LASF36:
	.ascii	"DMAy_Channelx\000"
.LASF19:
	.ascii	"DMA_Channel_TypeDef\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
