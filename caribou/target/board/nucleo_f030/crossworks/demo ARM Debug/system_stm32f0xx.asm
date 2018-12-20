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
	.file	"system_stm32f0xx.c"
	.text
.Ltext0:
	.global	SystemCoreClock
	.section	.data.SystemCoreClock,"aw",%progbits
	.align	2
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	48000000
	.global	AHBPrescTable
	.section	.data.AHBPrescTable,"aw",%progbits
	.align	2
	.type	AHBPrescTable, %object
	.size	AHBPrescTable, 16
AHBPrescTable:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.section	.text.SystemInit,"ax",%progbits
	.align	2
	.global	SystemInit
	.code	16
	.thumb_func
	.type	SystemInit, %function
SystemInit:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../src/system_stm32f0xx.c"
	.loc 1 160 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 162 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 165 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #4]
	ldr	r1, .L2+4
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 168 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	ldr	r1, .L2+8
	ands	r2, r1
	str	r2, [r3]
	.loc 1 171 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2]
	ldr	r1, .L2+12
	ands	r2, r1
	str	r2, [r3]
	.loc 1 174 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #4]
	ldr	r1, .L2+16
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 177 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #44]
	movs	r1, #15
	bics	r2, r1
	str	r2, [r3, #44]
	.loc 1 180 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #48]
	ldr	r1, .L2+20
	ands	r2, r1
	str	r2, [r3, #48]
	.loc 1 183 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #52]
	movs	r1, #1
	bics	r2, r1
	str	r2, [r3, #52]
	.loc 1 186 0
	ldr	r3, .L2
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 1 189 0
	bl	SetSysClock
	.loc 1 190 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	-117458932
	.word	-17367041
	.word	-262145
	.word	-4128769
	.word	-340
.LFE32:
	.size	SystemInit, .-SystemInit
	.global	__aeabi_uidiv
	.section	.text.SystemCoreClockUpdate,"ax",%progbits
	.align	2
	.global	SystemCoreClockUpdate
	.code	16
	.thumb_func
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
.LFB33:
	.loc 1 228 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	sub	sp, sp, #16
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	.loc 1 229 0
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	.loc 1 232 0
	ldr	r3, .L13
	ldr	r3, [r3, #4]
	movs	r2, #12
	ands	r3, r2
	str	r3, [r7, #12]
	.loc 1 234 0
	ldr	r3, [r7, #12]
	cmp	r3, #4
	beq	.L6
	cmp	r3, #8
	beq	.L7
	cmp	r3, #0
	bne	.L12
	.loc 1 237 0
	ldr	r3, .L13+4
	ldr	r2, .L13+8
	str	r2, [r3]
	.loc 1 238 0
	b	.L9
.L6:
	.loc 1 240 0
	ldr	r3, .L13+4
	ldr	r2, .L13+8
	str	r2, [r3]
	.loc 1 241 0
	b	.L9
.L7:
	.loc 1 244 0
	ldr	r3, .L13
	ldr	r2, [r3, #4]
	movs	r3, #240
	lsls	r3, r3, #14
	ands	r3, r2
	str	r3, [r7, #8]
	.loc 1 245 0
	ldr	r3, .L13
	ldr	r2, [r3, #4]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	str	r3, [r7, #4]
	.loc 1 246 0
	ldr	r3, [r7, #8]
	lsrs	r3, r3, #18
	adds	r3, r3, #2
	str	r3, [r7, #8]
	.loc 1 248 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L10
	.loc 1 251 0
	ldr	r3, [r7, #8]
	ldr	r2, .L13+12
	muls	r2, r3
	ldr	r3, .L13+4
	str	r2, [r3]
	.loc 1 259 0
	b	.L9
.L10:
	.loc 1 255 0
	ldr	r3, .L13
	ldr	r3, [r3, #44]
	movs	r2, #15
	ands	r3, r2
	adds	r3, r3, #1
	str	r3, [r7]
	.loc 1 257 0
	ldr	r1, [r7]
	ldr	r0, .L13+8
	bl	__aeabi_uidiv
	movs	r3, r0
	movs	r2, r3
	ldr	r3, [r7, #8]
	muls	r2, r3
	ldr	r3, .L13+4
	str	r2, [r3]
	.loc 1 259 0
	b	.L9
.L12:
	.loc 1 261 0
	ldr	r3, .L13+4
	ldr	r2, .L13+8
	str	r2, [r3]
	.loc 1 262 0
	nop
.L9:
	.loc 1 266 0
	ldr	r3, .L13
	ldr	r3, [r3, #4]
	movs	r2, #240
	ands	r3, r2
	lsrs	r3, r3, #4
	ldr	r2, .L13+16
	ldrb	r3, [r2, r3]
	uxtb	r3, r3
	str	r3, [r7, #12]
	.loc 1 268 0
	ldr	r3, .L13+4
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	lsrs	r2, r2, r3
	ldr	r3, .L13+4
	str	r2, [r3]
	.loc 1 269 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	1073876992
	.word	SystemCoreClock
	.word	8000000
	.word	4000000
	.word	AHBPrescTable
.LFE33:
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.section	.text.SetSysClock,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	SetSysClock, %function
SetSysClock:
.LFB34:
	.loc 1 280 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	sub	sp, sp, #8
.LCFI6:
	add	r7, sp, #0
.LCFI7:
	.loc 1 281 0
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7]
	.loc 1 285 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #9
	orrs	r2, r1
	str	r2, [r3]
.L17:
	.loc 1 290 0 discriminator 2
	ldr	r3, .L27
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #10
	ands	r3, r2
	str	r3, [r7]
	.loc 1 291 0 discriminator 2
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	.loc 1 292 0 discriminator 2
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L16
	.loc 1 292 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #4]
	movs	r3, #160
	lsls	r3, r3, #3
	cmp	r2, r3
	bne	.L17
.L16:
	.loc 1 294 0 is_stmt 1
	ldr	r3, .L27
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #10
	ands	r3, r2
	beq	.L18
	.loc 1 296 0
	movs	r3, #1
	str	r3, [r7]
	b	.L19
.L18:
	.loc 1 300 0
	movs	r3, #0
	str	r3, [r7]
.L19:
	.loc 1 303 0
	ldr	r3, [r7]
	cmp	r3, #1
	bne	.L20
	.loc 1 306 0
	ldr	r3, .L27+4
	movs	r2, #17
	str	r2, [r3]
	.loc 1 309 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	.loc 1 312 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	.loc 1 315 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	ldr	r1, .L27+8
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 316 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	movs	r1, #136
	lsls	r1, r1, #13
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 319 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 322 0
	nop
.L21:
	.loc 1 322 0 is_stmt 0 discriminator 1
	ldr	r3, .L27
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #18
	ands	r3, r2
	beq	.L21
	.loc 1 327 0 is_stmt 1
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	movs	r1, #3
	bics	r2, r1
	str	r2, [r3, #4]
	.loc 1 328 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 331 0
	nop
.L22:
	.loc 1 331 0 is_stmt 0 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3, #4]
	movs	r2, #12
	ands	r3, r2
	cmp	r3, #8
	bne	.L22
	.loc 1 369 0 is_stmt 1
	b	.L26
.L20:
	.loc 1 340 0
	ldr	r3, .L27+4
	movs	r2, #17
	str	r2, [r3]
	.loc 1 343 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	.loc 1 346 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	.loc 1 349 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	ldr	r1, .L27+8
	ands	r2, r1
	str	r2, [r3, #4]
	.loc 1 350 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	movs	r1, #160
	lsls	r1, r1, #14
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 353 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 356 0
	nop
.L24:
	.loc 1 356 0 is_stmt 0 discriminator 1
	ldr	r3, .L27
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #18
	ands	r3, r2
	beq	.L24
	.loc 1 361 0 is_stmt 1
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	movs	r1, #3
	bics	r2, r1
	str	r2, [r3, #4]
	.loc 1 362 0
	ldr	r3, .L27
	ldr	r2, .L27
	ldr	r2, [r2, #4]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 365 0
	nop
.L25:
	.loc 1 365 0 is_stmt 0 discriminator 1
	ldr	r3, .L27
	ldr	r3, [r3, #4]
	movs	r2, #12
	ands	r3, r2
	cmp	r3, #8
	bne	.L25
.L26:
	.loc 1 369 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L28:
	.align	2
.L27:
	.word	1073876992
	.word	1073881088
	.word	-4128769
.LFE34:
	.size	SetSysClock, .-SetSysClock
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
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
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
	.4byte	.LCFI5-.LFB34
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x2cd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0xc
	.4byte	.LASF36
	.4byte	.LASF37
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
	.byte	0xdf
	.4byte	0xa3
	.uleb128 0x7
	.4byte	.LASF11
	.byte	0
	.uleb128 0x8
	.ascii	"SET\000"
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x2c
	.uleb128 0x9
	.byte	0x24
	.byte	0x3
	.2byte	0x16c
	.4byte	0x124
	.uleb128 0xa
	.ascii	"ACR\000"
	.byte	0x3
	.2byte	0x16e
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x16f
	.4byte	0x85
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x170
	.4byte	0x85
	.byte	0x8
	.uleb128 0xa
	.ascii	"SR\000"
	.byte	0x3
	.2byte	0x171
	.4byte	0x85
	.byte	0xc
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x172
	.4byte	0x85
	.byte	0x10
	.uleb128 0xa
	.ascii	"AR\000"
	.byte	0x3
	.2byte	0x173
	.4byte	0x85
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x174
	.4byte	0x85
	.byte	0x18
	.uleb128 0xa
	.ascii	"OBR\000"
	.byte	0x3
	.2byte	0x175
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x176
	.4byte	0x85
	.byte	0x20
	.byte	0
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x177
	.4byte	0xa8
	.uleb128 0x9
	.byte	0x38
	.byte	0x3
	.2byte	0x1d8
	.4byte	0x1ef
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x1da
	.4byte	0x85
	.byte	0
	.uleb128 0xb
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x1db
	.4byte	0x85
	.byte	0x4
	.uleb128 0xa
	.ascii	"CIR\000"
	.byte	0x3
	.2byte	0x1dc
	.4byte	0x85
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x1dd
	.4byte	0x85
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x1de
	.4byte	0x85
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1df
	.4byte	0x85
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1e0
	.4byte	0x85
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x1e1
	.4byte	0x85
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1e2
	.4byte	0x85
	.byte	0x20
	.uleb128 0xa
	.ascii	"CSR\000"
	.byte	0x3
	.2byte	0x1e3
	.4byte	0x85
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1e4
	.4byte	0x85
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x1e5
	.4byte	0x85
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x1e6
	.4byte	0x85
	.byte	0x30
	.uleb128 0xa
	.ascii	"CR2\000"
	.byte	0x3
	.2byte	0x1e7
	.4byte	0x85
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x1e8
	.4byte	0x130
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x1
	.byte	0x9f
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF39
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25a
	.uleb128 0xf
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0xe5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x1
	.byte	0xe5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF29
	.byte	0x1
	.byte	0xe5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LASF30
	.byte	0x1
	.byte	0xe5
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x11
	.4byte	.LASF40
	.byte	0x1
	.2byte	0x117
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x28f
	.uleb128 0x12
	.4byte	.LASF31
	.byte	0x1
	.2byte	0x119
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x119
	.4byte	0x85
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF33
	.byte	0x1
	.byte	0x83
	.4byte	0x5e
	.uleb128 0x5
	.byte	0x3
	.4byte	SystemCoreClock
	.uleb128 0x14
	.4byte	0x2b0
	.4byte	0x2b0
	.uleb128 0x15
	.4byte	0x7e
	.byte	0xf
	.byte	0
	.uleb128 0x16
	.4byte	0xa3
	.uleb128 0x13
	.4byte	.LASF34
	.byte	0x1
	.byte	0x84
	.4byte	0x2cb
	.uleb128 0x5
	.byte	0x3
	.4byte	AHBPrescTable
	.uleb128 0x5
	.4byte	0x2a0
	.uleb128 0x16
	.4byte	0x2c6
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
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x12
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x7f
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2d1
	.4byte	0x96
	.ascii	"RESET\000"
	.4byte	0x9c
	.ascii	"SET\000"
	.4byte	0x1fb
	.ascii	"SystemInit\000"
	.4byte	0x20c
	.ascii	"SystemCoreClockUpdate\000"
	.4byte	0x25a
	.ascii	"SetSysClock\000"
	.4byte	0x28f
	.ascii	"SystemCoreClock\000"
	.4byte	0x2b5
	.ascii	"AHBPrescTable\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xf0
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x2d1
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
	.4byte	0x124
	.ascii	"FLASH_TypeDef\000"
	.4byte	0x1ef
	.ascii	"RCC_TypeDef\000"
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
.LASF21:
	.ascii	"APB2ENR\000"
.LASF28:
	.ascii	"pllmull\000"
.LASF23:
	.ascii	"BDCR\000"
.LASF31:
	.ascii	"StartUpCounter\000"
.LASF17:
	.ascii	"CFGR\000"
.LASF29:
	.ascii	"pllsource\000"
.LASF24:
	.ascii	"AHBRSTR\000"
.LASF40:
	.ascii	"SetSysClock\000"
.LASF32:
	.ascii	"HSEStatus\000"
.LASF16:
	.ascii	"FLASH_TypeDef\000"
.LASF20:
	.ascii	"AHBENR\000"
.LASF15:
	.ascii	"WRPR\000"
.LASF36:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../src/system_stm"
	.ascii	"32f0xx.c\000"
.LASF34:
	.ascii	"AHBPrescTable\000"
.LASF25:
	.ascii	"CFGR2\000"
.LASF26:
	.ascii	"CFGR3\000"
.LASF11:
	.ascii	"RESET\000"
.LASF13:
	.ascii	"OPTKEYR\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF30:
	.ascii	"prediv1factor\000"
.LASF37:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF14:
	.ascii	"RESERVED\000"
.LASF19:
	.ascii	"APB1RSTR\000"
.LASF22:
	.ascii	"APB1ENR\000"
.LASF18:
	.ascii	"APB2RSTR\000"
.LASF35:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF7:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF3:
	.ascii	"uint8_t\000"
.LASF38:
	.ascii	"SystemInit\000"
.LASF10:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF33:
	.ascii	"SystemCoreClock\000"
.LASF39:
	.ascii	"SystemCoreClockUpdate\000"
.LASF2:
	.ascii	"short int\000"
.LASF4:
	.ascii	"uint16_t\000"
.LASF27:
	.ascii	"RCC_TypeDef\000"
.LASF6:
	.ascii	"uint32_t\000"
.LASF12:
	.ascii	"KEYR\000"
.LASF0:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"short unsigned int\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
