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
	.file	"stm32f0xx_dbgmcu.c"
	.text
.Ltext0:
	.section	.text.DBGMCU_GetREVID,"ax",%progbits
	.align	2
	.global	DBGMCU_GetREVID
	.code	16
	.thumb_func
	.type	DBGMCU_GetREVID, %function
DBGMCU_GetREVID:
.LFB32:
	.file 1 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/lib/src/stm32f0xx_dbgmcu.c"
	.loc 1 78 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI0:
	add	r7, sp, #0
.LCFI1:
	.loc 1 79 0
	ldr	r3, .L3
	ldr	r3, [r3]
	lsrs	r3, r3, #16
	.loc 1 80 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L4:
	.align	2
.L3:
	.word	1073829888
.LFE32:
	.size	DBGMCU_GetREVID, .-DBGMCU_GetREVID
	.section	.text.DBGMCU_GetDEVID,"ax",%progbits
	.align	2
	.global	DBGMCU_GetDEVID
	.code	16
	.thumb_func
	.type	DBGMCU_GetDEVID, %function
DBGMCU_GetDEVID:
.LFB33:
	.loc 1 88 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI2:
	add	r7, sp, #0
.LCFI3:
	.loc 1 89 0
	ldr	r3, .L7
	ldr	r3, [r3]
	lsls	r3, r3, #20
	lsrs	r3, r3, #20
	.loc 1 90 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	1073829888
.LFE33:
	.size	DBGMCU_GetDEVID, .-DBGMCU_GetDEVID
	.section	.text.DBGMCU_Config,"ax",%progbits
	.align	2
	.global	DBGMCU_Config
	.code	16
	.thumb_func
	.type	DBGMCU_Config, %function
DBGMCU_Config:
.LFB34:
	.loc 1 119 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI4:
	sub	sp, sp, #8
.LCFI5:
	add	r7, sp, #0
.LCFI6:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 124 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L10
	.loc 1 126 0
	ldr	r3, .L13
	ldr	r2, .L13
	ldr	r1, [r2, #4]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 132 0
	b	.L12
.L10:
	.loc 1 130 0
	ldr	r3, .L13
	ldr	r2, .L13
	ldr	r2, [r2, #4]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #4]
.L12:
	.loc 1 132 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	1073829888
.LFE34:
	.size	DBGMCU_Config, .-DBGMCU_Config
	.section	.text.DBGMCU_APB1PeriphConfig,"ax",%progbits
	.align	2
	.global	DBGMCU_APB1PeriphConfig
	.code	16
	.thumb_func
	.type	DBGMCU_APB1PeriphConfig, %function
DBGMCU_APB1PeriphConfig:
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
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 159 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L16
	.loc 1 161 0
	ldr	r3, .L19
	ldr	r2, .L19
	ldr	r1, [r2, #8]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 167 0
	b	.L18
.L16:
	.loc 1 165 0
	ldr	r3, .L19
	ldr	r2, .L19
	ldr	r2, [r2, #8]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #8]
.L18:
	.loc 1 167 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L20:
	.align	2
.L19:
	.word	1073829888
.LFE35:
	.size	DBGMCU_APB1PeriphConfig, .-DBGMCU_APB1PeriphConfig
	.section	.text.DBGMCU_APB2PeriphConfig,"ax",%progbits
	.align	2
	.global	DBGMCU_APB2PeriphConfig
	.code	16
	.thumb_func
	.type	DBGMCU_APB2PeriphConfig, %function
DBGMCU_APB2PeriphConfig:
.LFB36:
	.loc 1 182 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI10:
	sub	sp, sp, #8
.LCFI11:
	add	r7, sp, #0
.LCFI12:
	str	r0, [r7, #4]
	movs	r2, r1
	adds	r3, r7, #3
	strb	r2, [r3]
	.loc 1 187 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L22
	.loc 1 189 0
	ldr	r3, .L25
	ldr	r2, .L25
	ldr	r1, [r2, #12]
	ldr	r2, [r7, #4]
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 195 0
	b	.L24
.L22:
	.loc 1 193 0
	ldr	r3, .L25
	ldr	r2, .L25
	ldr	r2, [r2, #12]
	ldr	r1, [r7, #4]
	mvns	r1, r1
	ands	r2, r1
	str	r2, [r3, #12]
.L24:
	.loc 1 195 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L26:
	.align	2
.L25:
	.word	1073829888
.LFE36:
	.size	DBGMCU_APB2PeriphConfig, .-DBGMCU_APB2PeriphConfig
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
	.uleb128 0x10
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
	.text
.Letext0:
	.file 2 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 3 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x19a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0xc
	.4byte	.LASF23
	.4byte	.LASF24
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
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x17
	.4byte	0x53
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
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x5
	.4byte	0x48
	.uleb128 0x6
	.byte	0x1
	.4byte	0x2c
	.byte	0x3
	.byte	0xe1
	.4byte	0x8d
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0xe1
	.4byte	0x74
	.uleb128 0x8
	.byte	0x10
	.byte	0x3
	.2byte	0x141
	.4byte	0xd5
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x3
	.2byte	0x143
	.4byte	0x6f
	.byte	0
	.uleb128 0xa
	.ascii	"CR\000"
	.byte	0x3
	.2byte	0x144
	.4byte	0x6f
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x145
	.4byte	0x6f
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF14
	.byte	0x3
	.2byte	0x146
	.4byte	0x6f
	.byte	0xc
	.byte	0
	.uleb128 0xb
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x147
	.4byte	0x98
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x4d
	.4byte	0x48
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF17
	.byte	0x1
	.byte	0x57
	.4byte	0x48
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0x76
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x13d
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x76
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x76
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x99
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16f
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0x99
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0x99
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
	.byte	0
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF18
	.byte	0x1
	.byte	0xb5
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xe
	.4byte	.LASF19
	.byte	0x1
	.byte	0xb5
	.4byte	0x8d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -13
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x97
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x19e
	.4byte	0x80
	.ascii	"DISABLE\000"
	.4byte	0x86
	.ascii	"ENABLE\000"
	.4byte	0xe1
	.ascii	"DBGMCU_GetREVID\000"
	.4byte	0xf6
	.ascii	"DBGMCU_GetDEVID\000"
	.4byte	0x10b
	.ascii	"DBGMCU_Config\000"
	.4byte	0x13d
	.ascii	"DBGMCU_APB1PeriphConfig\000"
	.4byte	0x16f
	.ascii	"DBGMCU_APB2PeriphConfig\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0xdc
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x19e
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
	.4byte	0x53
	.ascii	"unsigned int\000"
	.4byte	0x48
	.ascii	"uint32_t\000"
	.4byte	0x5a
	.ascii	"long long int\000"
	.4byte	0x61
	.ascii	"long long unsigned int\000"
	.4byte	0x68
	.ascii	"sizetype\000"
	.4byte	0x8d
	.ascii	"FunctionalState\000"
	.4byte	0xd5
	.ascii	"DBGMCU_TypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x3c
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF5:
	.ascii	"long long int\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF15:
	.ascii	"DBGMCU_TypeDef\000"
.LASF11:
	.ascii	"FunctionalState\000"
.LASF8:
	.ascii	"DISABLE\000"
.LASF20:
	.ascii	"DBGMCU_Config\000"
.LASF13:
	.ascii	"APB1FZ\000"
.LASF19:
	.ascii	"NewState\000"
.LASF2:
	.ascii	"short int\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF22:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF16:
	.ascii	"DBGMCU_GetREVID\000"
.LASF25:
	.ascii	"DBGMCU_APB2PeriphConfig\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"ENABLE\000"
.LASF10:
	.ascii	"uint32_t\000"
.LASF24:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF21:
	.ascii	"DBGMCU_APB1PeriphConfig\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF14:
	.ascii	"APB2FZ\000"
.LASF18:
	.ascii	"DBGMCU_Periph\000"
.LASF23:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/lib/src/stm32f0xx_dbgmcu.c\000"
.LASF7:
	.ascii	"sizetype\000"
.LASF12:
	.ascii	"IDCODE\000"
.LASF17:
	.ascii	"DBGMCU_GetDEVID\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
