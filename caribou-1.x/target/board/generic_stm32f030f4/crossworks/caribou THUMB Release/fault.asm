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
	push	{r3, lr}
.LCFI0:
	mov	r0, #127
	bl	WWDG_SetCounter
	@ sp needed
	pop	{r3, pc}
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
	sub	sp, sp, #56
.LCFI1:
	ldr	r3, [r0]
	str	r3, [sp, #52]
	ldr	r3, [r0, #4]
	str	r3, [sp, #48]
	ldr	r3, [r0, #8]
	str	r3, [sp, #44]
	ldr	r3, [r0, #12]
	str	r3, [sp, #40]
	ldr	r3, [r0, #16]
	str	r3, [sp, #36]
	ldr	r3, [r0, #20]
	str	r3, [sp, #32]
	ldr	r3, [r0, #24]
	str	r3, [sp, #28]
	ldr	r3, [r0, #28]
	str	r3, [sp, #24]
	ldr	r3, .L3
	ldr	r3, [r3]
	str	r3, [sp, #20]
	ldr	r3, .L3+4
	ldr	r3, [r3]
	str	r3, [sp, #16]
	ldr	r3, .L3+8
	ldr	r3, [r3]
	str	r3, [sp, #12]
	ldr	r3, .L3+12
	ldr	r3, [r3]
	str	r3, [sp, #8]
	ldr	r3, .L3+16
	ldr	r3, [r3]
	str	r3, [sp]
	ldr	r3, .L3+20
	ldr	r3, [r3]
	str	r3, [sp, #4]
@ 94 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/fault.c" 1
		bkpt #0

@ 0 "" 2
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
@ 113 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/fault.c" 1
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
	.code	16
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
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x4
	.4byte	.LCFI1-.LFB33
	.byte	0xe
	.uleb128 0x38
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
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/fault.c"
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
	.byte	0x14
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF1
	.byte	0x1
	.byte	0x30
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.4byte	.LASF2
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
	.uleb128 0x2116
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
.LASF4:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/src/fault.c\000"
.LASF3:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF1:
	.ascii	"fault\000"
.LASF2:
	.ascii	"_fault\000"
.LASF0:
	.ascii	"isr_wdg\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
