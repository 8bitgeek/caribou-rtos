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
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f091/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_crc.c"
	.loc 1 95 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 97 0
	ldr	r3, .L2
	movs	r2, #1
	rsbs	r2, r2, #0
	str	r2, [r3]
	.loc 1 99 0
	ldr	r3, .L2
	movs	r2, #0
	strb	r2, [r3, #4]
	.loc 1 101 0
	ldr	r3, .L2
	movs	r2, #1
	rsbs	r2, r2, #0
	str	r2, [r3, #16]
	.loc 1 103 0
	ldr	r3, .L2
	movs	r2, #1
	str	r2, [r3, #8]
	.loc 1 104 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 112 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	add	r7, sp, #0
.LCFI3:
	.loc 1 114 0
	ldr	r3, .L5
	movs	r2, #1
	str	r2, [r3, #8]
	.loc 1 115 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 128 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI4:
	sub	sp, sp, #16
.LCFI5:
	add	r7, sp, #0
.LCFI6:
	str	r0, [r7, #4]
	.loc 1 129 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 135 0
	ldr	r3, .L8
	ldr	r3, [r3, #8]
	str	r3, [r7, #12]
	.loc 1 138 0
	ldr	r3, [r7, #12]
	movs	r2, #96
	bics	r3, r2
	str	r3, [r7, #12]
	.loc 1 140 0
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	orrs	r3, r2
	str	r3, [r7, #12]
	.loc 1 143 0
	ldr	r3, .L8
	ldr	r2, [r7, #12]
	str	r2, [r3, #8]
	.loc 1 144 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
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
	.loc 1 154 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI7:
	sub	sp, sp, #8
.LCFI8:
	add	r7, sp, #0
.LCFI9:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 158 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L11
	.loc 1 161 0
	ldr	r3, .L14
	ldr	r2, .L14
	ldr	r2, [r2, #8]
	movs	r1, #128
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 168 0
	b	.L13
.L11:
	.loc 1 166 0
	ldr	r3, .L14
	ldr	r2, .L14
	ldr	r2, [r2, #8]
	movs	r1, #128
	bics	r2, r1
	str	r2, [r3, #8]
.L13:
	.loc 1 168 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L15:
	.align	2
.L14:
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
	.loc 1 177 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI10:
	sub	sp, sp, #8
.LCFI11:
	add	r7, sp, #0
.LCFI12:
	str	r0, [r7, #4]
	.loc 1 178 0
	ldr	r3, .L17
	ldr	r2, [r7, #4]
	str	r2, [r3, #16]
	.loc 1 179 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L18:
	.align	2
.L17:
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
	.loc 1 203 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI13:
	sub	sp, sp, #8
.LCFI14:
	add	r7, sp, #0
.LCFI15:
	str	r0, [r7, #4]
	.loc 1 204 0
	ldr	r3, .L21
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 206 0
	ldr	r3, .L21
	ldr	r3, [r3]
	.loc 1 207 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L22:
	.align	2
.L21:
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
	.loc 1 216 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI16:
	sub	sp, sp, #16
.LCFI17:
	add	r7, sp, #0
.LCFI18:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 217 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 219 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L24
.L25:
	.loc 1 221 0 discriminator 3
	ldr	r2, .L27
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r1, [r7, #4]
	adds	r3, r1, r3
	ldr	r3, [r3]
	str	r3, [r2]
	.loc 1 219 0 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L24:
	.loc 1 219 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L25
	.loc 1 223 0 is_stmt 1
	ldr	r3, .L27
	ldr	r3, [r3]
	.loc 1 224 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L28:
	.align	2
.L27:
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
	.loc 1 232 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	.loc 1 233 0
	ldr	r3, .L31
	ldr	r3, [r3]
	.loc 1 234 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L32:
	.align	2
.L31:
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
	.loc 1 258 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 259 0
	ldr	r2, .L34
	adds	r3, r7, #7
	ldrb	r3, [r3]
	strb	r3, [r2, #4]
	.loc 1 260 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L35:
	.align	2
.L34:
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
	.loc 1 268 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	.loc 1 269 0
	ldr	r3, .L38
	ldrb	r3, [r3, #4]
	uxtb	r3, r3
	.loc 1 270 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L39:
	.align	2
.L38:
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
	.4byte	.LCFI2-.LFB33
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
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
	.4byte	.LCFI4-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x4
	.4byte	.LCFI7-.LFB35
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI8-.LCFI7
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x4
	.4byte	.LCFI10-.LFB36
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI13-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI16-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI19-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x4
	.4byte	.LCFI21-.LFB40
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x4
	.4byte	.LCFI24-.LFB41
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE18:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f091/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x27e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0xc
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
	.4byte	0x37
	.byte	0x3
	.byte	0xe1
	.4byte	0xa3
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0
	.uleb128 0x7
	.4byte	.LASF12
	.byte	0x1
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
	.4byte	0x111
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
	.4byte	0x111
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
	.4byte	0xae
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
	.4byte	0x176
	.uleb128 0xe
	.4byte	.LASF23
	.byte	0x1
	.byte	0x7f
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xf
	.4byte	.LASF32
	.byte	0x1
	.byte	0x81
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF22
	.byte	0x1
	.byte	0x99
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x19a
	.uleb128 0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x99
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x1
	.byte	0xb0
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1be
	.uleb128 0xe
	.4byte	.LASF26
	.byte	0x1
	.byte	0xb0
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x1
	.byte	0xca
	.4byte	0x5e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e6
	.uleb128 0xe
	.4byte	.LASF27
	.byte	0x1
	.byte	0xca
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0xe
	.4byte	.LASF31
	.byte	0x1
	.byte	0xd7
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF33
	.byte	0x1
	.byte	0xd9
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.4byte	0x5e
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0xe7
	.4byte	0x5e
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x101
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x26b
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.2byte	0x101
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x18
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.section	.debug_pubnames,"",%progbits
	.4byte	0xf8
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x282
	.4byte	0x96
	.ascii	"DISABLE\000"
	.4byte	0x9c
	.ascii	"ENABLE\000"
	.4byte	0x122
	.ascii	"CRC_DeInit\000"
	.4byte	0x133
	.ascii	"CRC_ResetDR\000"
	.4byte	0x144
	.ascii	"CRC_ReverseInputDataSelect\000"
	.4byte	0x176
	.ascii	"CRC_ReverseOutputDataCmd\000"
	.4byte	0x19a
	.ascii	"CRC_SetInitRegister\000"
	.4byte	0x1be
	.ascii	"CRC_CalcCRC\000"
	.4byte	0x1e6
	.ascii	"CRC_CalcBlockCRC\000"
	.4byte	0x230
	.ascii	"CRC_GetCRC\000"
	.4byte	0x245
	.ascii	"CRC_SetIDRegister\000"
	.4byte	0x26b
	.ascii	"CRC_GetIDRegister\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xf2
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x282
	.4byte	0x25
	.ascii	"signed char\000"
	.4byte	0x37
	.ascii	"unsigned char\000"
	.4byte	0x2c
	.ascii	"uint8_t\000"
	.4byte	0x3e
	.ascii	"short int\000"
	.4byte	0x50
	.ascii	"short unsigned int\000"
	.4byte	0x45
	.ascii	"uint16_t\000"
	.4byte	0x57
	.ascii	"int\000"
	.4byte	0x69
	.ascii	"unsigned int\000"
	.4byte	0x5e
	.ascii	"uint32_t\000"
	.4byte	0x70
	.ascii	"long long int\000"
	.4byte	0x77
	.ascii	"long long unsigned int\000"
	.4byte	0x7e
	.ascii	"sizetype\000"
	.4byte	0xa3
	.ascii	"FunctionalState\000"
	.4byte	0x116
	.ascii	"CRC_TypeDef\000"
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
.LASF39:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_crc.c\000"
.LASF18:
	.ascii	"CRC_TypeDef\000"
.LASF22:
	.ascii	"CRC_ReverseOutputDataCmd\000"
.LASF27:
	.ascii	"CRC_Data\000"
.LASF29:
	.ascii	"CRC_CalcBlockCRC\000"
.LASF38:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
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
.LASF24:
	.ascii	"NewState\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF40:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f091/crossworks\000"
.LASF19:
	.ascii	"CRC_DeInit\000"
.LASF11:
	.ascii	"DISABLE\000"
.LASF34:
	.ascii	"CRC_SetIDRegister\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
