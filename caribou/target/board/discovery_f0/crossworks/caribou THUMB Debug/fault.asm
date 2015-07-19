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
	.file	"fault.c"
	.text
.Ltext0:
	.section	.text.isr_wdg,"ax",%progbits
	.align	1
	.global	isr_wdg
	.code	16
	.thumb_func
	.type	isr_wdg, %function
isr_wdg:
.LFB0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/src/fault.c"
	.loc 1 21 0
.LVL0:
	push	{r3, lr}
.LCFI0:
	.loc 1 22 0
	mov	r0, #127
.LVL1:
	bl	WWDG_SetCounter
.LVL2:
	.loc 1 23 0
	@ sp needed
	pop	{r3, pc}
.LFE0:
	.size	isr_wdg, .-isr_wdg
	.section	.text.fault,"ax",%progbits
	.align	1
	.global	fault
	.code	16
	.thumb_func
	.type	fault, %function
fault:
.LFB1:
	.loc 1 49 0
.LVL3:
	.loc 1 65 0
	ldr	r3, [r0]
	.loc 1 49 0
	sub	sp, sp, #56
.LCFI1:
	.loc 1 65 0
	str	r3, [sp]
	.loc 1 66 0
	ldr	r3, [r0, #4]
	str	r3, [sp, #4]
	.loc 1 67 0
	ldr	r3, [r0, #8]
	str	r3, [sp, #8]
	.loc 1 68 0
	ldr	r3, [r0, #12]
	str	r3, [sp, #12]
	.loc 1 69 0
	ldr	r3, [r0, #16]
	str	r3, [sp, #16]
	.loc 1 70 0
	ldr	r3, [r0, #20]
	str	r3, [sp, #20]
	.loc 1 71 0
	ldr	r3, [r0, #24]
	str	r3, [sp, #24]
	.loc 1 72 0
	ldr	r3, [r0, #28]
	str	r3, [sp, #28]
	.loc 1 76 0
	ldr	r3, .L3
	ldr	r3, [r3]
	str	r3, [sp, #32]
	.loc 1 79 0
	ldr	r3, .L3+4
	ldr	r3, [r3]
	str	r3, [sp, #36]
	.loc 1 82 0
	ldr	r3, .L3+8
	ldr	r3, [r3]
	str	r3, [sp, #40]
	.loc 1 85 0
	ldr	r3, .L3+12
	ldr	r3, [r3]
	str	r3, [sp, #44]
	.loc 1 90 0
	ldr	r3, .L3+16
	ldr	r3, [r3]
	str	r3, [sp, #52]
	.loc 1 92 0
	ldr	r3, .L3+20
	ldr	r3, [r3]
	str	r3, [sp, #48]
	.loc 1 94 0
@ 94 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/src/fault.c" 1
		bkpt #0

@ 0 "" 2
	.loc 1 96 0
	.code	16
	add	sp, sp, #56
	@ sp needed
	bx	lr
.L4:
	.align	2
.L3:
	.word	-536810200
	.word	-536810196
	.word	-536810192
	.word	-536810180
	.word	-536810188
	.word	-536810184
.LFE1:
	.size	fault, .-fault
	.section	.text._fault,"ax",%progbits
	.align	1
	.global	_fault
	.code	16
	.thumb_func
	.type	_fault, %function
_fault:
.LFB2:
	.loc 1 106 0
	.loc 1 113 0
@ 113 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/discovery_f0/crossworks/../../../chip/stm32/stm32f030/src/fault.c" 1
	.syntax unified
 movs   r0, #4  
 mov	r1, lr  
 tst	r0, r1  
 beq	_msp	
 mrs	r0, psp 
 b	  fault   
_msp:  
 mrs	r0, msp 
 b	  fault   
 b	  _fault	 
.syntax divided

@ 0 "" 2
	.loc 1 125 0
	.code	16
.LFE2:
	.size	_fault, .-_fault
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
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x4
	.4byte	.LCFI0-.LFB0
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI1-.LFB1
	.byte	0xe
	.uleb128 0x38
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/vectors.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2a0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x1
	.4byte	.LASF62
	.4byte	.LASF63
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
	.uleb128 0x4
	.byte	0x1
	.byte	0x2
	.byte	0x1a
	.4byte	0x13b
	.uleb128 0x5
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0x5
	.4byte	.LASF11
	.sleb128 1
	.uleb128 0x5
	.4byte	.LASF12
	.sleb128 2
	.uleb128 0x5
	.4byte	.LASF13
	.sleb128 3
	.uleb128 0x5
	.4byte	.LASF14
	.sleb128 4
	.uleb128 0x5
	.4byte	.LASF15
	.sleb128 5
	.uleb128 0x5
	.4byte	.LASF16
	.sleb128 6
	.uleb128 0x5
	.4byte	.LASF17
	.sleb128 7
	.uleb128 0x5
	.4byte	.LASF18
	.sleb128 8
	.uleb128 0x5
	.4byte	.LASF19
	.sleb128 9
	.uleb128 0x5
	.4byte	.LASF20
	.sleb128 10
	.uleb128 0x5
	.4byte	.LASF21
	.sleb128 11
	.uleb128 0x5
	.4byte	.LASF22
	.sleb128 12
	.uleb128 0x5
	.4byte	.LASF23
	.sleb128 13
	.uleb128 0x5
	.4byte	.LASF24
	.sleb128 14
	.uleb128 0x5
	.4byte	.LASF25
	.sleb128 15
	.uleb128 0x5
	.4byte	.LASF26
	.sleb128 16
	.uleb128 0x5
	.4byte	.LASF27
	.sleb128 17
	.uleb128 0x5
	.4byte	.LASF28
	.sleb128 18
	.uleb128 0x5
	.4byte	.LASF29
	.sleb128 19
	.uleb128 0x5
	.4byte	.LASF30
	.sleb128 20
	.uleb128 0x5
	.4byte	.LASF31
	.sleb128 21
	.uleb128 0x5
	.4byte	.LASF32
	.sleb128 22
	.uleb128 0x5
	.4byte	.LASF33
	.sleb128 23
	.uleb128 0x5
	.4byte	.LASF34
	.sleb128 24
	.uleb128 0x5
	.4byte	.LASF35
	.sleb128 25
	.uleb128 0x5
	.4byte	.LASF36
	.sleb128 26
	.uleb128 0x5
	.4byte	.LASF37
	.sleb128 27
	.uleb128 0x5
	.4byte	.LASF38
	.sleb128 28
	.uleb128 0x5
	.4byte	.LASF39
	.sleb128 29
	.uleb128 0x5
	.4byte	.LASF40
	.sleb128 30
	.uleb128 0x5
	.4byte	.LASF41
	.sleb128 31
	.byte	0
	.uleb128 0x6
	.4byte	.LASF64
	.byte	0x2
	.byte	0x3e
	.4byte	0x72
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x1
	.byte	0x14
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x18c
	.uleb128 0x8
	.4byte	.LASF44
	.byte	0x1
	.byte	0x14
	.4byte	0x13b
	.4byte	.LLST0
	.uleb128 0x9
	.4byte	.LASF65
	.byte	0x1
	.byte	0x16
	.4byte	0x41
	.4byte	0x17b
	.uleb128 0xa
	.byte	0
	.uleb128 0xb
	.4byte	.LVL2
	.4byte	0x296
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x8
	.byte	0x7f
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x1
	.byte	0x30
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x273
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x1
	.byte	0x30
	.4byte	0x273
	.uleb128 0x1
	.byte	0x50
	.uleb128 0xe
	.4byte	.LASF46
	.byte	0x1
	.byte	0x32
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xe
	.4byte	.LASF47
	.byte	0x1
	.byte	0x33
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.4byte	.LASF48
	.byte	0x1
	.byte	0x34
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x1
	.byte	0x35
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xe
	.4byte	.LASF50
	.byte	0x1
	.byte	0x36
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.4byte	.LASF51
	.byte	0x1
	.byte	0x37
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x1
	.byte	0x38
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x1
	.byte	0x39
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.4byte	.LASF54
	.byte	0x1
	.byte	0x3a
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x1
	.byte	0x3b
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.4byte	.LASF56
	.byte	0x1
	.byte	0x3c
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LASF57
	.byte	0x1
	.byte	0x3d
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x1
	.byte	0x3e
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0xe
	.4byte	.LASF59
	.byte	0x1
	.byte	0x3f
	.4byte	0x280
	.uleb128 0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.4byte	0x279
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF60
	.uleb128 0x10
	.4byte	0x279
	.uleb128 0x11
	.4byte	.LASF66
	.byte	0x1
	.byte	0x69
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF65
	.byte	0x1
	.byte	0x16
	.4byte	0x41
	.uleb128 0xa
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
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.4byte	.LFE0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF10:
	.ascii	"Vector_WWDG\000"
.LASF30:
	.ascii	"Vector_TIM15\000"
.LASF31:
	.ascii	"Vector_TIM16\000"
.LASF32:
	.ascii	"Vector_TIM17\000"
.LASF35:
	.ascii	"Vector_SPI1\000"
.LASF36:
	.ascii	"Vector_SPI2\000"
.LASF58:
	.ascii	"_BFAR\000"
.LASF59:
	.ascii	"_MMAR\000"
.LASF2:
	.ascii	"short int\000"
.LASF27:
	.ascii	"Vector_TIM6_DAC\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF42:
	.ascii	"isr_wdg\000"
.LASF54:
	.ascii	"_CFSR\000"
.LASF63:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks\000"
.LASF26:
	.ascii	"Vector_TIM3\000"
.LASF28:
	.ascii	"Vector_Reserved1\000"
.LASF39:
	.ascii	"Vector_Reserved2\000"
.LASF44:
	.ascii	"vector\000"
.LASF62:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/discovery_f0/crossworks/../../../c"
	.ascii	"hip/stm32/stm32f030/src/fault.c\000"
.LASF37:
	.ascii	"Vector_USART1\000"
.LASF21:
	.ascii	"Vector_DMA_CH4_5\000"
.LASF56:
	.ascii	"_DFSR\000"
.LASF33:
	.ascii	"Vector_I2C1\000"
.LASF34:
	.ascii	"Vector_I2C2\000"
.LASF5:
	.ascii	"long long int\000"
.LASF66:
	.ascii	"_fault\000"
.LASF14:
	.ascii	"Vector_RCC\000"
.LASF7:
	.ascii	"long int\000"
.LASF55:
	.ascii	"_HFSR\000"
.LASF18:
	.ascii	"Vector_TSC\000"
.LASF13:
	.ascii	"Vector_FLASH\000"
.LASF23:
	.ascii	"Vector_TIM1_BRK_UP_TRG_COM\000"
.LASF25:
	.ascii	"Vector_TIM2\000"
.LASF19:
	.ascii	"Vector_DMA_CH1\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF16:
	.ascii	"Vector_EXTI2_3\000"
.LASF20:
	.ascii	"Vector_DMA_CH2_3\000"
.LASF0:
	.ascii	"signed char\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF41:
	.ascii	"Vector_SoftSysTick\000"
.LASF22:
	.ascii	"Vector_ADC_COMP\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF65:
	.ascii	"WWDG_SetCounter\000"
.LASF53:
	.ascii	"stacked_psr\000"
.LASF57:
	.ascii	"_AFSR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF17:
	.ascii	"Vector_EXTI4_15\000"
.LASF40:
	.ascii	"Vector_CEC\000"
.LASF8:
	.ascii	"char\000"
.LASF11:
	.ascii	"Vector_PVD\000"
.LASF48:
	.ascii	"stacked_r2\000"
.LASF43:
	.ascii	"fault\000"
.LASF61:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF15:
	.ascii	"Vector_EXTI0_1\000"
.LASF45:
	.ascii	"hardfault_args\000"
.LASF60:
	.ascii	"long unsigned int\000"
.LASF50:
	.ascii	"stacked_r12\000"
.LASF29:
	.ascii	"Vector_TIM14\000"
.LASF64:
	.ascii	"InterruptVector\000"
.LASF46:
	.ascii	"stacked_r0\000"
.LASF47:
	.ascii	"stacked_r1\000"
.LASF38:
	.ascii	"Vector_USART2\000"
.LASF49:
	.ascii	"stacked_r3\000"
.LASF12:
	.ascii	"Vector_RTC\000"
.LASF52:
	.ascii	"stacked_pc\000"
.LASF24:
	.ascii	"Vector_TIM1_CC\000"
.LASF51:
	.ascii	"stacked_lr\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
