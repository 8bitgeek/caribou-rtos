	.syntax unified
	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"fault.c"
	.text
.Ltext0:
	.section	.text.isr_wdg,"ax",%progbits
	.align	2
	.global	isr_wdg
	.code	16
	.thumb_func
	.type	isr_wdg, %function
isr_wdg:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/src/fault.c"
	.loc 1 21 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 22 0
	movs	r0, #127
	bl	WWDG_SetCounter
	.loc 1 23 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE32:
	.size	isr_wdg, .-isr_wdg
	.section	.text.fault,"ax",%progbits
	.align	2
	.global	fault
	.code	16
	.thumb_func
	.type	fault, %function
fault:
.LFB33:
	.loc 1 49 0
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #64
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
	.loc 1 65 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3]
	str	r3, [r7, #60]
	.loc 1 66 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #4]
	str	r3, [r7, #56]
	.loc 1 67 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #8]
	str	r3, [r7, #52]
	.loc 1 68 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #12]
	str	r3, [r7, #48]
	.loc 1 69 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #16]
	str	r3, [r7, #44]
	.loc 1 70 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #20]
	str	r3, [r7, #40]
	.loc 1 71 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #24]
	str	r3, [r7, #36]
	.loc 1 72 0
	ldr	r3, [r7, #4]
	ldr	r3, [r3, #28]
	str	r3, [r7, #32]
	.loc 1 76 0
	ldr	r3, .L3
	ldr	r3, [r3]
	str	r3, [r7, #28]
	.loc 1 79 0
	ldr	r3, .L3+4
	ldr	r3, [r3]
	str	r3, [r7, #24]
	.loc 1 82 0
	ldr	r3, .L3+8
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 85 0
	ldr	r3, .L3+12
	ldr	r3, [r3]
	str	r3, [r7, #16]
	.loc 1 90 0
	ldr	r3, .L3+16
	ldr	r3, [r3]
	str	r3, [r7, #8]
	.loc 1 92 0
	ldr	r3, .L3+20
	ldr	r3, [r3]
	str	r3, [r7, #12]
	.loc 1 94 0
	.syntax divided
@ 94 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/src/fault.c" 1
		bkpt #0

@ 0 "" 2
	.loc 1 96 0
	.thumb
	.syntax unified
	nop
	mov	sp, r7
	add	sp, sp, #64
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	-536810200
	.word	-536810196
	.word	-536810192
	.word	-536810180
	.word	-536810188
	.word	-536810184
.LFE33:
	.size	fault, .-fault
	.section	.text._fault,"ax",%progbits
	.align	2
	.global	_fault
	.code	16
	.thumb_func
	.type	_fault, %function
_fault:
.LFB34:
	.loc 1 106 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 1 113 0
	.syntax divided
@ 113 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/src/fault.c" 1
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
	.thumb
	.syntax unified
	nop
.LFE34:
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
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x4
	.4byte	.LCFI0-.LFB32
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI3-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xd
	.uleb128 0x7
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
	.file 2 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x27c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0xc
	.4byte	.LASF64
	.4byte	.LASF65
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
	.4byte	.LASF66
	.byte	0x1
	.4byte	0x25
	.byte	0x2
	.byte	0xaa
	.4byte	0x14f
	.uleb128 0x5
	.4byte	.LASF10
	.sleb128 -14
	.uleb128 0x5
	.4byte	.LASF11
	.sleb128 -13
	.uleb128 0x5
	.4byte	.LASF12
	.sleb128 -5
	.uleb128 0x5
	.4byte	.LASF13
	.sleb128 -2
	.uleb128 0x5
	.4byte	.LASF14
	.sleb128 -1
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0x9
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0xa
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0xb
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0xd
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0xe
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0xf
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x11
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x13
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x17
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x19
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x1a
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x1b
	.uleb128 0x6
	.4byte	.LASF42
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF43
	.byte	0x1e
	.byte	0
	.uleb128 0x7
	.4byte	.LASF44
	.byte	0x1
	.byte	0x14
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x173
	.uleb128 0x8
	.4byte	.LASF46
	.byte	0x1
	.byte	0x14
	.4byte	0x72
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x9
	.4byte	.LASF45
	.byte	0x1
	.byte	0x30
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25c
	.uleb128 0x8
	.4byte	.LASF47
	.byte	0x1
	.byte	0x30
	.4byte	0x25c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xa
	.4byte	.LASF48
	.byte	0x1
	.byte	0x32
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF49
	.byte	0x1
	.byte	0x33
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.4byte	.LASF50
	.byte	0x1
	.byte	0x34
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xa
	.4byte	.LASF51
	.byte	0x1
	.byte	0x35
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.4byte	.LASF52
	.byte	0x1
	.byte	0x36
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xa
	.4byte	.LASF53
	.byte	0x1
	.byte	0x37
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.4byte	.LASF54
	.byte	0x1
	.byte	0x38
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xa
	.4byte	.LASF55
	.byte	0x1
	.byte	0x39
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.4byte	.LASF56
	.byte	0x1
	.byte	0x3a
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xa
	.4byte	.LASF57
	.byte	0x1
	.byte	0x3b
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xa
	.4byte	.LASF58
	.byte	0x1
	.byte	0x3c
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xa
	.4byte	.LASF59
	.byte	0x1
	.byte	0x3d
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xa
	.4byte	.LASF60
	.byte	0x1
	.byte	0x3e
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0xa
	.4byte	.LASF61
	.byte	0x1
	.byte	0x3f
	.4byte	0x269
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x262
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF62
	.uleb128 0xc
	.4byte	0x262
	.uleb128 0xd
	.4byte	.LASF67
	.byte	0x1
	.byte	0x69
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
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.uleb128 0x2134
	.uleb128 0x19
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
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x2116
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
	.uleb128 0x18
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.section	.debug_pubnames,"",%progbits
	.4byte	0x2f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x280
	.4byte	0x14f
	.ascii	"isr_wdg\000"
	.4byte	0x173
	.ascii	"fault\000"
	.4byte	0x26e
	.ascii	"_fault\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xdd
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x280
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x2c
	.ascii	"unsigned char\000"
	.4byte	0x33
	.ascii	"short int\000"
	.4byte	0x3a
	.ascii	"short unsigned int\000"
	.4byte	0x41
	.ascii	"int\000"
	.4byte	0x48
	.ascii	"unsigned int\000"
	.4byte	0x4f
	.ascii	"long long int\000"
	.4byte	0x56
	.ascii	"long long unsigned int\000"
	.4byte	0x5d
	.ascii	"long int\000"
	.4byte	0x64
	.ascii	"char\000"
	.4byte	0x6b
	.ascii	"sizetype\000"
	.4byte	0x72
	.ascii	"IRQn\000"
	.4byte	0x262
	.ascii	"long unsigned int\000"
	.4byte	0
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
.LASF14:
	.ascii	"SysTick_IRQn\000"
.LASF60:
	.ascii	"_BFAR\000"
.LASF19:
	.ascii	"RCC_IRQn\000"
.LASF36:
	.ascii	"TIM17_IRQn\000"
.LASF61:
	.ascii	"_MMAR\000"
.LASF34:
	.ascii	"TIM15_IRQn\000"
.LASF2:
	.ascii	"short int\000"
.LASF56:
	.ascii	"_CFSR\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF44:
	.ascii	"isr_wdg\000"
.LASF11:
	.ascii	"HardFault_IRQn\000"
.LASF64:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/src/fault.c\000"
.LASF66:
	.ascii	"IRQn\000"
.LASF39:
	.ascii	"SPI1_IRQn\000"
.LASF32:
	.ascii	"TIM6_DAC_IRQn\000"
.LASF37:
	.ascii	"I2C1_IRQn\000"
.LASF46:
	.ascii	"vector\000"
.LASF18:
	.ascii	"FLASH_IRQn\000"
.LASF24:
	.ascii	"DMA1_Channel1_IRQn\000"
.LASF0:
	.ascii	"signed char\000"
.LASF15:
	.ascii	"WWDG_IRQn\000"
.LASF5:
	.ascii	"long long int\000"
.LASF67:
	.ascii	"_fault\000"
.LASF41:
	.ascii	"USART1_IRQn\000"
.LASF13:
	.ascii	"PendSV_IRQn\000"
.LASF58:
	.ascii	"_DFSR\000"
.LASF7:
	.ascii	"long int\000"
.LASF57:
	.ascii	"_HFSR\000"
.LASF16:
	.ascii	"PVD_IRQn\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"TIM2_IRQn\000"
.LASF43:
	.ascii	"CEC_IRQn\000"
.LASF29:
	.ascii	"TIM1_CC_IRQn\000"
.LASF51:
	.ascii	"stacked_r3\000"
.LASF20:
	.ascii	"EXTI0_1_IRQn\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF54:
	.ascii	"stacked_pc\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF35:
	.ascii	"TIM16_IRQn\000"
.LASF59:
	.ascii	"_AFSR\000"
.LASF27:
	.ascii	"ADC1_COMP_IRQn\000"
.LASF33:
	.ascii	"TIM14_IRQn\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF8:
	.ascii	"char\000"
.LASF40:
	.ascii	"SPI2_IRQn\000"
.LASF21:
	.ascii	"EXTI2_3_IRQn\000"
.LASF45:
	.ascii	"fault\000"
.LASF12:
	.ascii	"SVC_IRQn\000"
.LASF38:
	.ascii	"I2C2_IRQn\000"
.LASF25:
	.ascii	"DMA1_Channel2_3_IRQn\000"
.LASF47:
	.ascii	"hardfault_args\000"
.LASF62:
	.ascii	"long unsigned int\000"
.LASF17:
	.ascii	"RTC_IRQn\000"
.LASF52:
	.ascii	"stacked_r12\000"
.LASF65:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF10:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF28:
	.ascii	"TIM1_BRK_UP_TRG_COM_IRQn\000"
.LASF23:
	.ascii	"TS_IRQn\000"
.LASF42:
	.ascii	"USART2_IRQn\000"
.LASF22:
	.ascii	"EXTI4_15_IRQn\000"
.LASF63:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF48:
	.ascii	"stacked_r0\000"
.LASF49:
	.ascii	"stacked_r1\000"
.LASF50:
	.ascii	"stacked_r2\000"
.LASF55:
	.ascii	"stacked_psr\000"
.LASF26:
	.ascii	"DMA1_Channel4_5_IRQn\000"
.LASF31:
	.ascii	"TIM3_IRQn\000"
.LASF53:
	.ascii	"stacked_lr\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
