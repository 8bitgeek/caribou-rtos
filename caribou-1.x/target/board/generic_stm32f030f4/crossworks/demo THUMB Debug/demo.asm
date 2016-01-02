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
	.code	16
	.file	"demo.c"
	.text
.Ltext0:
	.global	stack1
	.section	.bss.stack1,"aw",%nobits
	.align	2
	.type	stack1, %object
	.size	stack1, 256
stack1:
	.space	256
	.global	stack2
	.section	.bss.stack2,"aw",%nobits
	.align	2
	.type	stack2, %object
	.size	stack2, 256
stack2:
	.space	256
	.section	.text.thread1,"ax",%progbits
	.align	2
	.global	thread1
	.code	16
	.thumb_func
	.type	thread1, %function
thread1:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../src/demo.c"
	.loc 1 29 0
	push	{r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	str	r0, [r7, #4]
.L2:
	.loc 1 32 0 discriminator 1
	b	.L2
.LFE32:
	.size	thread1, .-thread1
	.section	.text.thread2,"ax",%progbits
	.align	2
	.global	thread2
	.code	16
	.thumb_func
	.type	thread2, %function
thread2:
.LFB33:
	.loc 1 41 0
	push	{r7, lr}
.LCFI3:
	sub	sp, sp, #8
.LCFI4:
	add	r7, sp, #0
.LCFI5:
	str	r0, [r7, #4]
.L4:
	.loc 1 44 0 discriminator 1
	b	.L4
.LFE33:
	.size	thread2, .-thread2
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"thread1\000"
	.align	2
.LC4:
	.ascii	"thread2\000"
	.section	.text.main,"ax",%progbits
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB34:
	.loc 1 48 0
	push	{r7, lr}
.LCFI6:
	sub	sp, sp, #24
.LCFI7:
	add	r7, sp, #16
.LCFI8:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 52 0
	mov	r0, #0
	bl	caribou_init
	.loc 1 55 0
	ldr	r2, .L7
	ldr	r3, .L7+4
	ldr	r1, .L7+8
	str	r1, [sp]
	mov	r1, #128
	lsl	r1, r1, #1
	str	r1, [sp, #4]
	mov	r1, #0
	str	r1, [sp, #8]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	bl	caribou_thread_create
	.loc 1 56 0
	ldr	r2, .L7+12
	ldr	r3, .L7+16
	ldr	r1, .L7+20
	str	r1, [sp]
	mov	r1, #128
	lsl	r1, r1, #1
	str	r1, [sp, #4]
	mov	r1, #0
	str	r1, [sp, #8]
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	mov	r3, #0
	bl	caribou_thread_create
	.loc 1 63 0
	bl	caribou_exec
	mov	r3, #0
	.loc 1 64 0
	mov	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	thread1
	.word	stack1
	.word	.LC4
	.word	thread2
	.word	stack2
.LFE34:
	.size	main, .-main
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
	.uleb128 0x10
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
	.byte	0x4
	.4byte	.LCFI6-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xc
	.uleb128 0x7
	.uleb128 0x10
	.align	2
.LEFDE4:
	.text
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x137
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x1
	.4byte	.LASF17
	.4byte	.LASF18
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
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x5
	.byte	0x4
	.4byte	0x6c
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1c
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9e
	.uleb128 0x7
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x28
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xc2
	.uleb128 0x7
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x5d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2f
	.4byte	0x41
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x102
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x2f
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x2f
	.4byte	0x102
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xa
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x31
	.4byte	0x41
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x66
	.uleb128 0xb
	.4byte	0x6c
	.4byte	0x118
	.uleb128 0xc
	.4byte	0x73
	.byte	0xff
	.byte	0
	.uleb128 0xd
	.4byte	.LASF14
	.byte	0x1
	.byte	0x14
	.4byte	0x108
	.uleb128 0x5
	.byte	0x3
	.4byte	stack1
	.uleb128 0xd
	.4byte	.LASF15
	.byte	0x1
	.byte	0x15
	.4byte	0x108
	.uleb128 0x5
	.byte	0x3
	.4byte	stack2
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x8
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
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
.LASF5:
	.ascii	"long long int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF18:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF14:
	.ascii	"stack1\000"
.LASF19:
	.ascii	"main\000"
.LASF0:
	.ascii	"signed char\000"
.LASF10:
	.ascii	"thread1\000"
.LASF11:
	.ascii	"thread2\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF15:
	.ascii	"stack2\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF8:
	.ascii	"char\000"
.LASF7:
	.ascii	"long int\000"
.LASF2:
	.ascii	"short int\000"
.LASF12:
	.ascii	"argc\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF16:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -fno-dwa"
	.ascii	"rf2-cfi-asm -fno-builtin -ffunction-sections -fdata"
	.ascii	"-sections -fshort-double -fshort-enums -fno-common\000"
.LASF17:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"src/demo.c\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF13:
	.ascii	"argv\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
