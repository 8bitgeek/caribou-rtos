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
	.file	"gpio.c"
	.text
.Ltext0:
	.section	.text.chip_gpio_toggle,"ax",%progbits
	.align	2
	.global	chip_gpio_toggle
	.code	16
	.thumb_func
	.type	chip_gpio_toggle, %function
chip_gpio_toggle:
.LFB32:
	ldrh	r3, [r0, #20]
	tst	r3, r1
	beq	.L2
	lsl	r1, r1, #16
	str	r1, [r0, #24]
	b	.L1
.L2:
	str	r1, [r0, #24]
.L1:
	@ sp needed
	bx	lr
.LFE32:
	.size	chip_gpio_toggle, .-chip_gpio_toggle
	.section	.text.chip_gpio_set,"ax",%progbits
	.align	2
	.global	chip_gpio_set
	.code	16
	.thumb_func
	.type	chip_gpio_set, %function
chip_gpio_set:
.LFB33:
	str	r1, [r0, #24]
	@ sp needed
	bx	lr
.LFE33:
	.size	chip_gpio_set, .-chip_gpio_set
	.section	.text.chip_gpio_reset,"ax",%progbits
	.align	2
	.global	chip_gpio_reset
	.code	16
	.thumb_func
	.type	chip_gpio_reset, %function
chip_gpio_reset:
.LFB34:
	lsl	r1, r1, #16
	str	r1, [r0, #24]
	@ sp needed
	bx	lr
.LFE34:
	.size	chip_gpio_reset, .-chip_gpio_reset
	.section	.text.chip_gpio_pinstate,"ax",%progbits
	.align	2
	.global	chip_gpio_pinstate
	.code	16
	.thumb_func
	.type	chip_gpio_pinstate, %function
chip_gpio_pinstate:
.LFB35:
	push	{r4, lr}
.LCFI0:
	lsl	r2, r1, #1
	ldr	r4, [r0]
	mov	r3, #3
	lsl	r3, r3, r2
	and	r3, r4
	lsr	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r3, #1
	beq	.L8
	cmp	r3, #2
	beq	.L9
	cmp	r3, #0
	bne	.L12
	ldrh	r0, [r0, #16]
	and	r0, r1
	b	.L7
.L8:
	ldrh	r0, [r0, #20]
	and	r0, r1
	b	.L7
.L9:
	ldrh	r0, [r0, #16]
	and	r0, r1
	b	.L7
.L12:
	mov	r0, #0
.L7:
	@ sp needed
	pop	{r4, pc}
.LFE35:
	.size	chip_gpio_pinstate, .-chip_gpio_pinstate
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
	.byte	0x4
	.4byte	.LCFI0-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x84
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE6:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/gpio.c"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF4
	.byte	0x1
	.4byte	.LASF5
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x1
	.byte	0x18
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x1
	.byte	0x21
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x26
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x2b
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.4byte	0x34
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF4:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF5:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/src/gpio.c\000"
.LASF1:
	.ascii	"chip_gpio_set\000"
.LASF0:
	.ascii	"chip_gpio_toggle\000"
.LASF3:
	.ascii	"chip_gpio_pinstate\000"
.LASF2:
	.ascii	"chip_gpio_reset\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
