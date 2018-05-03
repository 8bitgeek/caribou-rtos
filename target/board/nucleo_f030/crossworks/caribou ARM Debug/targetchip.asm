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
	.file	"chip.c"
	.text
.Ltext0:
	.section	.text.NVIC_SetPriority,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	NVIC_SetPriority, %function
NVIC_SetPriority:
.LFB28:
	.file 1 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.loc 1 572 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r7, lr}
.LCFI0:
	sub	sp, sp, #8
.LCFI1:
	add	r7, sp, #0
.LCFI2:
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 573 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #127
	bls	.L2
	.loc 1 574 0
	ldr	r4, .L5
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #15
	ands	r3, r2
	subs	r3, r3, #8
	lsrs	r1, r3, #2
	ldr	r2, .L5
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r0, r3
	movs	r3, #15
	ands	r3, r0
	subs	r3, r3, #8
	lsrs	r3, r3, #2
	adds	r3, r3, #6
	lsls	r3, r3, #2
	adds	r3, r2, r3
	adds	r3, r3, #4
	ldr	r3, [r3]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r0, r2
	movs	r2, #3
	ands	r2, r0
	lsls	r2, r2, #3
	movs	r0, #255
	lsls	r0, r0, r2
	movs	r2, r0
	mvns	r2, r2
	ands	r2, r3
	.loc 1 575 0
	ldr	r3, [r7]
	lsls	r3, r3, #6
	movs	r0, #255
	ands	r0, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r5, r3
	movs	r3, #3
	ands	r3, r5
	lsls	r3, r3, #3
	lsls	r0, r0, r3
	movs	r3, r0
	.loc 1 574 0
	orrs	r2, r3
	adds	r3, r1, #6
	lsls	r3, r3, #2
	adds	r3, r4, r3
	adds	r3, r3, #4
	str	r2, [r3]
	.loc 1 579 0
	b	.L4
.L2:
	.loc 1 577 0
	ldr	r4, .L5+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	lsrs	r3, r3, #2
	ldr	r1, .L5+4
	adds	r2, r7, #7
	ldrb	r2, [r2]
	sxtb	r2, r2
	lsrs	r2, r2, #2
	adds	r2, r2, #192
	lsls	r2, r2, #2
	ldr	r2, [r2, r1]
	adds	r1, r7, #7
	ldrb	r1, [r1]
	movs	r0, r1
	movs	r1, #3
	ands	r1, r0
	lsls	r1, r1, #3
	movs	r0, #255
	lsls	r0, r0, r1
	movs	r1, r0
	mvns	r1, r1
	ands	r1, r2
	.loc 1 578 0
	ldr	r2, [r7]
	lsls	r2, r2, #6
	movs	r0, #255
	ands	r0, r2
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r5, r2
	movs	r2, #3
	ands	r2, r5
	lsls	r2, r2, #3
	lsls	r0, r0, r2
	movs	r2, r0
	.loc 1 577 0
	orrs	r2, r1
	adds	r3, r3, #192
	lsls	r3, r3, #2
	str	r2, [r3, r4]
.L4:
	.loc 1 579 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r7, pc}
.L6:
	.align	2
.L5:
	.word	-536810240
	.word	-536813312
.LFE28:
	.size	NVIC_SetPriority, .-NVIC_SetPriority
	.section	.text.nvic_isr,"ax",%progbits
	.align	2
	.global	nvic_isr
	.code	16
	.thumb_func
	.type	nvic_isr, %function
nvic_isr:
.LFB32:
	.file 2 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c"
	.loc 2 26 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 27 0
	.syntax divided
@ 27 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
		push	{lr}			
	push	{r4-r7}			
	mov		r4,r8			
	mov		r5,r9			
	mov		r6,r10			
	mov		r7,r11			
	push	{r4-r7}			

@ 0 "" 2
	.loc 2 28 0
	.thumb
	.syntax unified
	ldr	r3, .L8
	ldr	r3, [r3, #4]
	movs	r2, r3
	movs	r3, #255
	ands	r3, r2
	subs	r3, r3, #16
	movs	r0, r3
	bl	caribou_interrupt_service
	.loc 2 29 0
	.syntax divided
@ 29 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
		pop		{r4-r7}			
	mov		r11,r7			
	mov		r10,r6			
	mov		r9,r5			
	mov		r8,r4			
	pop		{r4-r7}			
	pop		{pc}			

@ 0 "" 2
	.loc 2 30 0
	.thumb
	.syntax unified
	nop
.L9:
	.align	2
.L8:
	.word	-536810240
.LFE32:
	.size	nvic_isr, .-nvic_isr
	.section	.text._swi,"ax",%progbits
	.align	2
	.weak	_swi
	.code	16
	.thumb_func
	.type	_swi, %function
_swi:
.LFB33:
	.loc 2 33 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI3:
	add	r7, sp, #0
.LCFI4:
	.loc 2 34 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE33:
	.size	_swi, .-_swi
	.section	.text._nmi,"ax",%progbits
	.align	2
	.weak	_nmi
	.code	16
	.thumb_func
	.type	_nmi, %function
_nmi:
.LFB34:
	.loc 2 37 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI5:
	add	r7, sp, #0
.LCFI6:
	.loc 2 38 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE34:
	.size	_nmi, .-_nmi
	.section	.text.chip_move_vectors,"ax",%progbits
	.align	2
	.global	chip_move_vectors
	.code	16
	.thumb_func
	.type	chip_move_vectors, %function
chip_move_vectors:
.LFB35:
	.loc 2 41 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI7:
	sub	sp, sp, #8
.LCFI8:
	add	r7, sp, #0
.LCFI9:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 42 0
	movs	r3, #0
	.loc 2 43 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE35:
	.size	chip_move_vectors, .-chip_move_vectors
	.section	.text.chip_systick_irq_state,"ax",%progbits
	.align	2
	.global	chip_systick_irq_state
	.code	16
	.thumb_func
	.type	chip_systick_irq_state, %function
chip_systick_irq_state:
.LFB36:
	.loc 2 49 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI10:
	add	r7, sp, #0
.LCFI11:
	.loc 2 50 0
	ldr	r3, .L16
	ldr	r3, [r3]
	movs	r2, #2
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	.loc 2 51 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L17:
	.align	2
.L16:
	.word	-536813552
.LFE36:
	.size	chip_systick_irq_state, .-chip_systick_irq_state
	.section	.text.chip_systick_irq_enable,"ax",%progbits
	.align	2
	.global	chip_systick_irq_enable
	.code	16
	.thumb_func
	.type	chip_systick_irq_enable, %function
chip_systick_irq_enable:
.LFB37:
	.loc 2 57 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI12:
	sub	sp, sp, #8
.LCFI13:
	add	r7, sp, #0
.LCFI14:
	.loc 2 58 0
	ldr	r3, .L20
	ldr	r3, [r3]
	movs	r2, #2
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #4]
	.loc 2 59 0
	ldr	r3, .L20
	ldr	r2, .L20
	ldr	r2, [r2]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3]
	.loc 2 60 0
	ldr	r3, [r7, #4]
	.loc 2 61 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L21:
	.align	2
.L20:
	.word	-536813552
.LFE37:
	.size	chip_systick_irq_enable, .-chip_systick_irq_enable
	.section	.text.chip_systick_irq_disable,"ax",%progbits
	.align	2
	.global	chip_systick_irq_disable
	.code	16
	.thumb_func
	.type	chip_systick_irq_disable, %function
chip_systick_irq_disable:
.LFB38:
	.loc 2 68 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI15:
	sub	sp, sp, #8
.LCFI16:
	add	r7, sp, #0
.LCFI17:
	.loc 2 69 0
	ldr	r3, .L24
	ldr	r3, [r3]
	movs	r2, #2
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #4]
	.loc 2 70 0
	ldr	r3, .L24
	ldr	r2, .L24
	ldr	r2, [r2]
	movs	r1, #2
	bics	r2, r1
	str	r2, [r3]
	.loc 2 71 0
	ldr	r3, [r7, #4]
	.loc 2 72 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L25:
	.align	2
.L24:
	.word	-536813552
.LFE38:
	.size	chip_systick_irq_disable, .-chip_systick_irq_disable
	.section	.text.chip_systick_irq_set,"ax",%progbits
	.align	2
	.global	chip_systick_irq_set
	.code	16
	.thumb_func
	.type	chip_systick_irq_set, %function
chip_systick_irq_set:
.LFB39:
	.loc 2 78 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI18:
	sub	sp, sp, #8
.LCFI19:
	add	r7, sp, #0
.LCFI20:
	str	r0, [r7, #4]
	.loc 2 79 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L27
	.loc 2 80 0
	ldr	r3, .L30
	ldr	r2, .L30
	ldr	r2, [r2]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3]
	.loc 2 83 0
	b	.L29
.L27:
	.loc 2 82 0
	ldr	r3, .L30
	ldr	r2, .L30
	ldr	r2, [r2]
	movs	r1, #2
	bics	r2, r1
	str	r2, [r3]
.L29:
	.loc 2 83 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L31:
	.align	2
.L30:
	.word	-536813552
.LFE39:
	.size	chip_systick_irq_set, .-chip_systick_irq_set
	.section	.text.chip_systick_count_bit,"ax",%progbits
	.align	2
	.global	chip_systick_count_bit
	.code	16
	.thumb_func
	.type	chip_systick_count_bit, %function
chip_systick_count_bit:
.LFB40:
	.loc 2 90 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI21:
	sub	sp, sp, #8
.LCFI22:
	add	r7, sp, #0
.LCFI23:
	.loc 2 91 0
	ldr	r3, .L34
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #9
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r2, r3
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 2 92 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 2 93 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L35:
	.align	2
.L34:
	.word	-536813552
.LFE40:
	.size	chip_systick_count_bit, .-chip_systick_count_bit
	.section	.text.chip_systick_irq_force,"ax",%progbits
	.align	2
	.global	chip_systick_irq_force
	.code	16
	.thumb_func
	.type	chip_systick_irq_force, %function
chip_systick_irq_force:
.LFB41:
	.loc 2 100 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI24:
	add	r7, sp, #0
.LCFI25:
	.loc 2 101 0
	ldr	r3, .L37
	ldr	r2, .L37
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #21
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 2 102 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L38:
	.align	2
.L37:
	.word	-536810240
.LFE41:
	.size	chip_systick_irq_force, .-chip_systick_irq_force
	.section	.text.chip_reset_watchdog,"ax",%progbits
	.align	2
	.global	chip_reset_watchdog
	.code	16
	.thumb_func
	.type	chip_reset_watchdog, %function
chip_reset_watchdog:
.LFB42:
	.loc 2 105 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI26:
	add	r7, sp, #0
.LCFI27:
	.loc 2 106 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE42:
	.size	chip_reset_watchdog, .-chip_reset_watchdog
	.section	.text.chip_idle,"ax",%progbits
	.align	2
	.global	chip_idle
	.code	16
	.thumb_func
	.type	chip_idle, %function
chip_idle:
.LFB43:
	.loc 2 109 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI28:
	add	r7, sp, #0
.LCFI29:
	.loc 2 110 0
	bl	chip_reset_watchdog
	.loc 2 111 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.LFE43:
	.size	chip_idle, .-chip_idle
	.section	.text.chip_reset,"ax",%progbits
	.align	2
	.global	chip_reset
	.code	16
	.thumb_func
	.type	chip_reset, %function
chip_reset:
.LFB44:
	.loc 2 114 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI30:
	add	r7, sp, #0
.LCFI31:
.L42:
	.loc 2 116 0 discriminator 1
	b	.L42
.LFE44:
	.size	chip_reset, .-chip_reset
	.global	__aeabi_uidiv
	.section	.text.initSysTick,"ax",%progbits
	.align	2
	.code	16
	.thumb_func
	.type	initSysTick, %function
initSysTick:
.LFB45:
	.loc 2 123 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI32:
	sub	sp, sp, #8
.LCFI33:
	add	r7, sp, #0
.LCFI34:
	.loc 2 124 0
	bl	chip_clock_freq
	movs	r2, r0
	movs	r3, #250
	lsls	r1, r3, #2
	movs	r0, r2
	bl	__aeabi_uidiv
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 2 125 0
	ldr	r3, .L44
	ldr	r2, [r7, #4]
	lsls	r2, r2, #8
	lsrs	r2, r2, #8
	subs	r2, r2, #1
	str	r2, [r3, #4]
	.loc 2 126 0
	movs	r3, #1
	rsbs	r3, r3, #0
	movs	r1, #3
	movs	r0, r3
	bl	NVIC_SetPriority
	.loc 2 127 0
	ldr	r3, .L44
	movs	r2, #0
	str	r2, [r3, #8]
	.loc 2 128 0
	ldr	r3, .L44
	movs	r2, #7
	str	r2, [r3]
	.loc 2 131 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
	.word	-536813552
.LFE45:
	.size	initSysTick, .-initSysTick
	.section	.text.chip_init,"ax",%progbits
	.align	2
	.global	chip_init
	.code	16
	.thumb_func
	.type	chip_init, %function
chip_init:
.LFB46:
	.loc 2 136 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI35:
	sub	sp, sp, #8
.LCFI36:
	add	r7, sp, #0
.LCFI37:
	str	r0, [r7, #4]
	.loc 2 138 0
	bl	chip_interrupts_disable
	.loc 2 139 0
	bl	initSysTick
	.loc 2 140 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE46:
	.size	chip_init, .-chip_init
	.section	.text.chip_interrupts_enable,"ax",%progbits
	.align	2
	.global	chip_interrupts_enable
	.code	16
	.thumb_func
	.type	chip_interrupts_enable, %function
chip_interrupts_enable:
.LFB47:
	.loc 2 143 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 144 0
	.syntax divided
@ 144 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsie   i
 bx      lr

@ 0 "" 2
	.loc 2 146 0
	.thumb
	.syntax unified
	nop
.LFE47:
	.size	chip_interrupts_enable, .-chip_interrupts_enable
	.section	.text.chip_interrupts_disable,"ax",%progbits
	.align	2
	.global	chip_interrupts_disable
	.code	16
	.thumb_func
	.type	chip_interrupts_disable, %function
chip_interrupts_disable:
.LFB48:
	.loc 2 149 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 150 0
	.syntax divided
@ 150 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 movs    r1,#1
 mrs     r0, primask
 eor     r0,r1
 pop     {r1}
 cpsid	i
 bx  	lr

@ 0 "" 2
	.loc 2 157 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE48:
	.size	chip_interrupts_disable, .-chip_interrupts_disable
	.section	.text.chip_interrupts_enabled,"ax",%progbits
	.align	2
	.global	chip_interrupts_enabled
	.code	16
	.thumb_func
	.type	chip_interrupts_enabled, %function
chip_interrupts_enabled:
.LFB49:
	.loc 2 160 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 161 0
	.syntax divided
@ 161 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 movs    r1,#1
 mrs     r0, primask
 eor     r0,r1
 pop     {r1}
 bx  	lr

@ 0 "" 2
	.loc 2 167 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE49:
	.size	chip_interrupts_enabled, .-chip_interrupts_enabled
	.section	.text.chip_wfi,"ax",%progbits
	.align	2
	.global	chip_wfi
	.code	16
	.thumb_func
	.type	chip_wfi, %function
chip_wfi:
.LFB50:
	.loc 2 170 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 171 0
	.syntax divided
@ 171 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 wfi
 bx lr

@ 0 "" 2
	.loc 2 172 0
	.thumb
	.syntax unified
	nop
.LFE50:
	.size	chip_wfi, .-chip_wfi
	.section	.text.chip_interrupt_level,"ax",%progbits
	.align	2
	.global	chip_interrupt_level
	.code	16
	.thumb_func
	.type	chip_interrupt_level, %function
chip_interrupt_level:
.LFB51:
	.loc 2 176 0
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	.loc 2 177 0
	.syntax divided
@ 177 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 mov     r1,#0x3F
 mrs     r0, psr
 and     r0,r1
 pop     {r1}
 bx  	lr

@ 0 "" 2
	.loc 2 183 0
	.thumb
	.syntax unified
	nop
	movs	r0, r3
.LFE51:
	.size	chip_interrupt_level, .-chip_interrupt_level
	.section	.text.chip_interrupts_set,"ax",%progbits
	.align	2
	.global	chip_interrupts_set
	.code	16
	.thumb_func
	.type	chip_interrupts_set, %function
chip_interrupts_set:
.LFB52:
	.loc 2 186 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI38:
	sub	sp, sp, #8
.LCFI39:
	add	r7, sp, #0
.LCFI40:
	str	r0, [r7, #4]
	.loc 2 187 0
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L53
	.loc 2 188 0
	.syntax divided
@ 188 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsie   i

@ 0 "" 2
	.loc 2 191 0
	.thumb
	.syntax unified
	b	.L55
.L53:
	.loc 2 190 0
	.syntax divided
@ 190 "/home/mike/Documents/GitHub/caribou-rtos/caribou/target/board/nucleo_f030/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsid   i

@ 0 "" 2
	.thumb
	.syntax unified
.L55:
	.loc 2 191 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE52:
	.size	chip_interrupts_set, .-chip_interrupts_set
	.section	.text.chip_vector_enable,"ax",%progbits
	.align	2
	.global	chip_vector_enable
	.code	16
	.thumb_func
	.type	chip_vector_enable, %function
chip_vector_enable:
.LFB53:
	.loc 2 195 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI41:
	sub	sp, sp, #24
.LCFI42:
	add	r7, sp, #0
.LCFI43:
	str	r0, [r7, #4]
	.loc 2 196 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 2 197 0
	ldr	r3, [r7, #4]
	cmp	r3, #31
	bhi	.L57
.LBB2:
	.loc 2 199 0
	movs	r2, #1
	ldr	r3, [r7, #4]
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #16]
	.loc 2 200 0
	ldr	r3, .L60
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #20]
	.loc 2 201 0
	ldr	r3, .L60
	ldr	r2, [r7, #16]
	str	r2, [r3]
.LBE2:
	b	.L58
.L57:
.LBB3:
	.loc 2 205 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #32
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #12]
	.loc 2 206 0
	ldr	r3, .L60
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #12]
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #20]
	.loc 2 207 0
	ldr	r3, .L60
	ldr	r2, [r7, #12]
	str	r2, [r3, #4]
.L58:
.LBE3:
	.loc 2 209 0
	ldr	r3, [r7, #20]
	.loc 2 210 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L61:
	.align	2
.L60:
	.word	-536813312
.LFE53:
	.size	chip_vector_enable, .-chip_vector_enable
	.section	.text.chip_vector_disable,"ax",%progbits
	.align	2
	.global	chip_vector_disable
	.code	16
	.thumb_func
	.type	chip_vector_disable, %function
chip_vector_disable:
.LFB54:
	.loc 2 214 0
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI44:
	sub	sp, sp, #24
.LCFI45:
	add	r7, sp, #0
.LCFI46:
	str	r0, [r7, #4]
	.loc 2 215 0
	movs	r3, #0
	str	r3, [r7, #20]
	.loc 2 216 0
	ldr	r3, [r7, #4]
	cmp	r3, #31
	bhi	.L63
.LBB4:
	.loc 2 218 0
	movs	r2, #1
	ldr	r3, [r7, #4]
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #16]
	.loc 2 219 0
	ldr	r3, .L66
	ldr	r3, [r3]
	ldr	r2, [r7, #16]
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #20]
	.loc 2 220 0
	ldr	r1, .L66
	movs	r2, #128
	ldr	r3, [r7, #16]
	str	r3, [r1, r2]
.LBE4:
	b	.L64
.L63:
.LBB5:
	.loc 2 224 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #32
	movs	r2, #1
	lsls	r2, r2, r3
	movs	r3, r2
	str	r3, [r7, #12]
	.loc 2 225 0
	ldr	r3, .L66
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #12]
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #20]
	.loc 2 226 0
	ldr	r1, .L66
	movs	r2, #132
	ldr	r3, [r7, #12]
	str	r3, [r1, r2]
.L64:
.LBE5:
	.loc 2 228 0
	ldr	r3, [r7, #20]
	.loc 2 229 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
.L67:
	.align	2
.L66:
	.word	-536813312
.LFE54:
	.size	chip_vector_disable, .-chip_vector_disable
	.section	.text.chip_vector_enabled,"ax",%progbits
	.align	2
	.global	chip_vector_enabled
	.code	16
	.thumb_func
	.type	chip_vector_enabled, %function
chip_vector_enabled:
.LFB55:
	.loc 2 232 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI47:
	sub	sp, sp, #16
.LCFI48:
	add	r7, sp, #0
.LCFI49:
	str	r0, [r7, #4]
	.loc 2 234 0
	ldr	r3, [r7, #4]
	cmp	r3, #31
	bhi	.L69
	.loc 2 235 0
	ldr	r3, .L72
	ldr	r3, [r3]
	movs	r1, #1
	ldr	r2, [r7, #4]
	lsls	r1, r1, r2
	movs	r2, r1
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #12]
	b	.L70
.L69:
	.loc 2 237 0
	ldr	r3, .L72
	ldr	r3, [r3, #4]
	ldr	r2, [r7, #4]
	subs	r2, r2, #32
	movs	r1, #1
	lsls	r1, r1, r2
	movs	r2, r1
	ands	r3, r2
	subs	r2, r3, #1
	sbcs	r3, r3, r2
	uxtb	r3, r3
	str	r3, [r7, #12]
.L70:
	.loc 2 238 0
	ldr	r3, [r7, #12]
	.loc 2 239 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L73:
	.align	2
.L72:
	.word	-536813312
.LFE55:
	.size	chip_vector_enabled, .-chip_vector_enabled
	.section	.text.chip_vector_set,"ax",%progbits
	.align	2
	.global	chip_vector_set
	.code	16
	.thumb_func
	.type	chip_vector_set, %function
chip_vector_set:
.LFB56:
	.loc 2 242 0
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI50:
	sub	sp, sp, #16
.LCFI51:
	add	r7, sp, #0
.LCFI52:
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 2 244 0
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L75
	.loc 2 245 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	chip_vector_enable
	movs	r3, r0
	str	r3, [r7, #12]
	b	.L76
.L75:
	.loc 2 247 0
	ldr	r3, [r7, #4]
	movs	r0, r3
	bl	chip_vector_disable
	movs	r3, r0
	str	r3, [r7, #12]
.L76:
	.loc 2 248 0
	ldr	r3, [r7, #12]
	.loc 2 249 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.LFE56:
	.size	chip_vector_set, .-chip_vector_set
	.section	.text.chip_delay,"ax",%progbits
	.align	2
	.global	chip_delay
	.code	16
	.thumb_func
	.type	chip_delay, %function
chip_delay:
.LFB57:
	.loc 2 253 0
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI53:
	sub	sp, sp, #8
.LCFI54:
	add	r7, sp, #0
.LCFI55:
	str	r0, [r7, #4]
	.loc 2 254 0
	b	.L79
.L80:
	.loc 2 254 0 is_stmt 0 discriminator 2
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	str	r3, [r7, #4]
.L79:
	.loc 2 254 0 discriminator 1
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L80
	.loc 2 255 0 is_stmt 1
	ldr	r3, [r7, #4]
	.loc 2 256 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.LFE57:
	.size	chip_delay, .-chip_delay
	.section	.text.chip_clock_freq,"ax",%progbits
	.align	2
	.global	chip_clock_freq
	.code	16
	.thumb_func
	.type	chip_clock_freq, %function
chip_clock_freq:
.LFB58:
	.loc 2 260 0
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
.LCFI56:
	sub	sp, sp, #32
.LCFI57:
	add	r7, sp, #0
.LCFI58:
	.loc 2 262 0
	adds	r3, r7, #4
	movs	r0, r3
	bl	RCC_GetClocksFreq
	.loc 2 263 0
	adds	r3, r7, #4
	ldr	r3, [r3]
	.loc 2 264 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #32
	@ sp needed
	pop	{r7, pc}
.LFE58:
	.size	chip_clock_freq, .-chip_clock_freq
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
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x4
	.4byte	.LCFI0-.LFB28
	.byte	0xe
	.uleb128 0x10
	.byte	0x84
	.uleb128 0x4
	.byte	0x85
	.uleb128 0x3
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x18
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
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
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
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
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
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
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
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
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
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x4
	.4byte	.LCFI12-.LFB37
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x4
	.4byte	.LCFI15-.LFB38
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI16-.LCFI15
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x4
	.4byte	.LCFI18-.LFB39
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI20-.LCFI19
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
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
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
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
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x4
	.4byte	.LCFI26-.LFB42
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI27-.LCFI26
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x4
	.4byte	.LCFI28-.LFB43
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI29-.LCFI28
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x4
	.4byte	.LCFI30-.LFB44
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI31-.LCFI30
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI32-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI33-.LCFI32
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI34-.LCFI33
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x4
	.4byte	.LCFI35-.LFB46
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI36-.LCFI35
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI37-.LCFI36
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x4
	.4byte	.LCFI38-.LFB52
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI39-.LCFI38
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI40-.LCFI39
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x4
	.4byte	.LCFI41-.LFB53
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI42-.LCFI41
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI43-.LCFI42
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x4
	.4byte	.LCFI44-.LFB54
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI45-.LCFI44
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI46-.LCFI45
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI47-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI48-.LCFI47
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI49-.LCFI48
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.byte	0x4
	.4byte	.LCFI50-.LFB56
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI51-.LCFI50
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI52-.LCFI51
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI53-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI54-.LCFI53
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI55-.LCFI54
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE52:
.LSFDE54:
	.4byte	.LEFDE54-.LASFDE54
.LASFDE54:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.byte	0x4
	.4byte	.LCFI56-.LFB58
	.byte	0xe
	.uleb128 0x8
	.byte	0x87
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI57-.LCFI56
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	.LCFI58-.LCFI57
	.byte	0xd
	.uleb128 0x7
	.align	2
.LEFDE54:
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.7/include/stdint.h"
	.file 4 "../../../chip/stm32/stm32f030/include/stm32f030r/chip/vectors.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 6 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x894
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF142
	.byte	0xc
	.4byte	.LASF143
	.4byte	.LASF144
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
	.4byte	.LASF42
	.byte	0x3
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
	.uleb128 0x5
	.byte	0x1
	.4byte	0x2c
	.byte	0x4
	.byte	0x1a
	.4byte	0x14a
	.uleb128 0x6
	.4byte	.LASF10
	.byte	0
	.uleb128 0x6
	.4byte	.LASF11
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF12
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF13
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF15
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF17
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x9
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0xa
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0xb
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0xd
	.uleb128 0x6
	.4byte	.LASF24
	.byte	0xe
	.uleb128 0x6
	.4byte	.LASF25
	.byte	0xf
	.uleb128 0x6
	.4byte	.LASF26
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF27
	.byte	0x11
	.uleb128 0x6
	.4byte	.LASF28
	.byte	0x12
	.uleb128 0x6
	.4byte	.LASF29
	.byte	0x13
	.uleb128 0x6
	.4byte	.LASF30
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF31
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF32
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF33
	.byte	0x17
	.uleb128 0x6
	.4byte	.LASF34
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF35
	.byte	0x19
	.uleb128 0x6
	.4byte	.LASF36
	.byte	0x1a
	.uleb128 0x6
	.4byte	.LASF37
	.byte	0x1b
	.uleb128 0x6
	.4byte	.LASF38
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF39
	.byte	0x1d
	.uleb128 0x6
	.4byte	.LASF40
	.byte	0x1e
	.uleb128 0x6
	.4byte	.LASF41
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x4
	.byte	0x3e
	.4byte	0x7d
	.uleb128 0x7
	.4byte	.LASF107
	.byte	0x1
	.4byte	0x25
	.byte	0x5
	.byte	0xaa
	.4byte	0x232
	.uleb128 0x8
	.4byte	.LASF44
	.sleb128 -14
	.uleb128 0x8
	.4byte	.LASF45
	.sleb128 -13
	.uleb128 0x8
	.4byte	.LASF46
	.sleb128 -5
	.uleb128 0x8
	.4byte	.LASF47
	.sleb128 -2
	.uleb128 0x8
	.4byte	.LASF48
	.sleb128 -1
	.uleb128 0x6
	.4byte	.LASF49
	.byte	0
	.uleb128 0x6
	.4byte	.LASF50
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF51
	.byte	0x2
	.uleb128 0x6
	.4byte	.LASF52
	.byte	0x3
	.uleb128 0x6
	.4byte	.LASF53
	.byte	0x4
	.uleb128 0x6
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0x6
	.4byte	.LASF55
	.byte	0x6
	.uleb128 0x6
	.4byte	.LASF56
	.byte	0x7
	.uleb128 0x6
	.4byte	.LASF57
	.byte	0x8
	.uleb128 0x6
	.4byte	.LASF58
	.byte	0x9
	.uleb128 0x6
	.4byte	.LASF59
	.byte	0xa
	.uleb128 0x6
	.4byte	.LASF60
	.byte	0xb
	.uleb128 0x6
	.4byte	.LASF61
	.byte	0xc
	.uleb128 0x6
	.4byte	.LASF62
	.byte	0xd
	.uleb128 0x6
	.4byte	.LASF63
	.byte	0xe
	.uleb128 0x6
	.4byte	.LASF64
	.byte	0xf
	.uleb128 0x6
	.4byte	.LASF65
	.byte	0x10
	.uleb128 0x6
	.4byte	.LASF66
	.byte	0x11
	.uleb128 0x6
	.4byte	.LASF67
	.byte	0x13
	.uleb128 0x6
	.4byte	.LASF68
	.byte	0x14
	.uleb128 0x6
	.4byte	.LASF69
	.byte	0x15
	.uleb128 0x6
	.4byte	.LASF70
	.byte	0x16
	.uleb128 0x6
	.4byte	.LASF71
	.byte	0x17
	.uleb128 0x6
	.4byte	.LASF72
	.byte	0x18
	.uleb128 0x6
	.4byte	.LASF73
	.byte	0x19
	.uleb128 0x6
	.4byte	.LASF74
	.byte	0x1a
	.uleb128 0x6
	.4byte	.LASF75
	.byte	0x1b
	.uleb128 0x6
	.4byte	.LASF76
	.byte	0x1c
	.uleb128 0x6
	.4byte	.LASF77
	.byte	0x1e
	.byte	0
	.uleb128 0x4
	.4byte	.LASF78
	.byte	0x5
	.byte	0xd1
	.4byte	0x155
	.uleb128 0x9
	.2byte	0x320
	.byte	0x1
	.2byte	0x10b
	.4byte	0x2cf
	.uleb128 0xa
	.4byte	.LASF79
	.byte	0x1
	.2byte	0x10d
	.4byte	0x2e4
	.byte	0
	.uleb128 0xa
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x10e
	.4byte	0x2e9
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF81
	.byte	0x1
	.2byte	0x10f
	.4byte	0x2f9
	.byte	0x80
	.uleb128 0xa
	.4byte	.LASF82
	.byte	0x1
	.2byte	0x110
	.4byte	0x2e9
	.byte	0x84
	.uleb128 0xb
	.4byte	.LASF83
	.byte	0x1
	.2byte	0x111
	.4byte	0x2fe
	.2byte	0x100
	.uleb128 0xb
	.4byte	.LASF84
	.byte	0x1
	.2byte	0x112
	.4byte	0x2e9
	.2byte	0x104
	.uleb128 0xb
	.4byte	.LASF85
	.byte	0x1
	.2byte	0x113
	.4byte	0x303
	.2byte	0x180
	.uleb128 0xb
	.4byte	.LASF86
	.byte	0x1
	.2byte	0x114
	.4byte	0x2e9
	.2byte	0x184
	.uleb128 0xb
	.4byte	.LASF87
	.byte	0x1
	.2byte	0x115
	.4byte	0x308
	.2byte	0x200
	.uleb128 0xc
	.ascii	"IP\000"
	.byte	0x1
	.2byte	0x116
	.4byte	0x328
	.2byte	0x300
	.byte	0
	.uleb128 0xd
	.4byte	0x2df
	.4byte	0x2df
	.uleb128 0xe
	.4byte	0x76
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	0x48
	.uleb128 0xf
	.4byte	0x2cf
	.uleb128 0xd
	.4byte	0x48
	.4byte	0x2f9
	.uleb128 0xe
	.4byte	0x76
	.byte	0x1e
	.byte	0
	.uleb128 0xf
	.4byte	0x2cf
	.uleb128 0xf
	.4byte	0x2cf
	.uleb128 0xf
	.4byte	0x2cf
	.uleb128 0xd
	.4byte	0x48
	.4byte	0x318
	.uleb128 0xe
	.4byte	0x76
	.byte	0x3f
	.byte	0
	.uleb128 0xd
	.4byte	0x2df
	.4byte	0x328
	.uleb128 0xe
	.4byte	0x76
	.byte	0x7
	.byte	0
	.uleb128 0xf
	.4byte	0x318
	.uleb128 0x10
	.4byte	.LASF88
	.byte	0x1
	.2byte	0x117
	.4byte	0x23d
	.uleb128 0x11
	.byte	0x28
	.byte	0x1
	.2byte	0x124
	.4byte	0x3b8
	.uleb128 0xa
	.4byte	.LASF89
	.byte	0x1
	.2byte	0x126
	.4byte	0x3b8
	.byte	0
	.uleb128 0xa
	.4byte	.LASF90
	.byte	0x1
	.2byte	0x127
	.4byte	0x2df
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF80
	.byte	0x1
	.2byte	0x128
	.4byte	0x48
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x129
	.4byte	0x2df
	.byte	0xc
	.uleb128 0x12
	.ascii	"SCR\000"
	.byte	0x1
	.2byte	0x12a
	.4byte	0x2df
	.byte	0x10
	.uleb128 0x12
	.ascii	"CCR\000"
	.byte	0x1
	.2byte	0x12b
	.4byte	0x2df
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF92
	.byte	0x1
	.2byte	0x12c
	.4byte	0x48
	.byte	0x18
	.uleb128 0x12
	.ascii	"SHP\000"
	.byte	0x1
	.2byte	0x12d
	.4byte	0x3cd
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF93
	.byte	0x1
	.2byte	0x12e
	.4byte	0x2df
	.byte	0x24
	.byte	0
	.uleb128 0x13
	.4byte	0x2df
	.uleb128 0xd
	.4byte	0x2df
	.4byte	0x3cd
	.uleb128 0xe
	.4byte	0x76
	.byte	0x1
	.byte	0
	.uleb128 0xf
	.4byte	0x3bd
	.uleb128 0x10
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x12f
	.4byte	0x339
	.uleb128 0x11
	.byte	0x10
	.byte	0x1
	.2byte	0x18d
	.4byte	0x41c
	.uleb128 0xa
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x18f
	.4byte	0x2df
	.byte	0
	.uleb128 0xa
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x190
	.4byte	0x2df
	.byte	0x4
	.uleb128 0x12
	.ascii	"VAL\000"
	.byte	0x1
	.2byte	0x191
	.4byte	0x2df
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF97
	.byte	0x1
	.2byte	0x192
	.4byte	0x3b8
	.byte	0xc
	.byte	0
	.uleb128 0x10
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x193
	.4byte	0x3de
	.uleb128 0x14
	.byte	0x1c
	.byte	0x6
	.byte	0x32
	.4byte	0x485
	.uleb128 0x15
	.4byte	.LASF99
	.byte	0x6
	.byte	0x34
	.4byte	0x48
	.byte	0
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x6
	.byte	0x35
	.4byte	0x48
	.byte	0x4
	.uleb128 0x15
	.4byte	.LASF101
	.byte	0x6
	.byte	0x36
	.4byte	0x48
	.byte	0x8
	.uleb128 0x15
	.4byte	.LASF102
	.byte	0x6
	.byte	0x37
	.4byte	0x48
	.byte	0xc
	.uleb128 0x15
	.4byte	.LASF103
	.byte	0x6
	.byte	0x38
	.4byte	0x48
	.byte	0x10
	.uleb128 0x15
	.4byte	.LASF104
	.byte	0x6
	.byte	0x39
	.4byte	0x48
	.byte	0x14
	.uleb128 0x15
	.4byte	.LASF105
	.byte	0x6
	.byte	0x3a
	.4byte	0x48
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.4byte	.LASF106
	.byte	0x6
	.byte	0x3b
	.4byte	0x428
	.uleb128 0x16
	.4byte	.LASF145
	.byte	0x1
	.2byte	0x23b
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c5
	.uleb128 0x17
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x23b
	.4byte	0x232
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x17
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x23b
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x18
	.4byte	.LASF146
	.byte	0x2
	.byte	0x19
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e8
	.uleb128 0x19
	.4byte	.LASF147
	.byte	0x2
	.byte	0x1c
	.4byte	0x41
	.uleb128 0x1a
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF109
	.byte	0x2
	.byte	0x20
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF110
	.byte	0x2
	.byte	0x24
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF114
	.byte	0x2
	.byte	0x28
	.4byte	0x6f
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x540
	.uleb128 0x1d
	.ascii	"ram\000"
	.byte	0x2
	.byte	0x28
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1e
	.4byte	.LASF111
	.byte	0x2
	.byte	0x28
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF126
	.byte	0x2
	.byte	0x30
	.4byte	0x41
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF112
	.byte	0x2
	.byte	0x38
	.4byte	0x41
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57c
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x3a
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x20
	.4byte	.LASF113
	.byte	0x2
	.byte	0x43
	.4byte	0x41
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a3
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x45
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x22
	.4byte	.LASF115
	.byte	0x2
	.byte	0x4d
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c7
	.uleb128 0x1e
	.4byte	.LASF116
	.byte	0x2
	.byte	0x4d
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x20
	.4byte	.LASF117
	.byte	0x2
	.byte	0x59
	.4byte	0x6f
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ee
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0x5b
	.4byte	0x6f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x23
	.4byte	.LASF124
	.byte	0x2
	.byte	0x63
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF118
	.byte	0x2
	.byte	0x68
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.4byte	.LASF119
	.byte	0x2
	.byte	0x6c
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1b
	.4byte	.LASF120
	.byte	0x2
	.byte	0x71
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x25
	.4byte	.LASF148
	.byte	0x2
	.byte	0x7a
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x656
	.uleb128 0x26
	.4byte	.LASF121
	.byte	0x2
	.byte	0x7c
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x27
	.4byte	.LASF122
	.byte	0x2
	.byte	0x87
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x67a
	.uleb128 0x1e
	.4byte	.LASF123
	.byte	0x2
	.byte	0x87
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x23
	.4byte	.LASF125
	.byte	0x2
	.byte	0x8e
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF127
	.byte	0x2
	.byte	0x94
	.4byte	0x41
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF128
	.byte	0x2
	.byte	0x9f
	.4byte	0x41
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF129
	.byte	0x2
	.byte	0xa9
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1f
	.4byte	.LASF130
	.byte	0x2
	.byte	0xaf
	.4byte	0x48
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x22
	.4byte	.LASF131
	.byte	0x2
	.byte	0xb9
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ff
	.uleb128 0x1e
	.4byte	.LASF116
	.byte	0x2
	.byte	0xb9
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x20
	.4byte	.LASF132
	.byte	0x2
	.byte	0xc2
	.4byte	0x41
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x768
	.uleb128 0x1e
	.4byte	.LASF133
	.byte	0x2
	.byte	0xc2
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0xc4
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x28
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x74f
	.uleb128 0x21
	.ascii	"bit\000"
	.byte	0x2
	.byte	0xc7
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x29
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x21
	.ascii	"bit\000"
	.byte	0x2
	.byte	0xcd
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF134
	.byte	0x2
	.byte	0xd5
	.4byte	0x41
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d1
	.uleb128 0x1e
	.4byte	.LASF133
	.byte	0x2
	.byte	0xd5
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0xd7
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x28
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x7b8
	.uleb128 0x21
	.ascii	"bit\000"
	.byte	0x2
	.byte	0xda
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x29
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x21
	.ascii	"bit\000"
	.byte	0x2
	.byte	0xe0
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF135
	.byte	0x2
	.byte	0xe7
	.4byte	0x41
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x806
	.uleb128 0x1e
	.4byte	.LASF133
	.byte	0x2
	.byte	0xe7
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0xe9
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2a
	.4byte	.LASF136
	.byte	0x2
	.byte	0xf1
	.4byte	0x41
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x849
	.uleb128 0x1e
	.4byte	.LASF133
	.byte	0x2
	.byte	0xf1
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1e
	.4byte	.LASF137
	.byte	0x2
	.byte	0xf1
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.ascii	"rc\000"
	.byte	0x2
	.byte	0xf3
	.4byte	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x20
	.4byte	.LASF138
	.byte	0x2
	.byte	0xfc
	.4byte	0x48
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x871
	.uleb128 0x1e
	.4byte	.LASF139
	.byte	0x2
	.byte	0xfc
	.4byte	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF140
	.byte	0x2
	.2byte	0x103
	.4byte	0x48
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2c
	.4byte	.LASF141
	.byte	0x2
	.2byte	0x105
	.4byte	0x485
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
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
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0xb
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.byte	0
	.section	.debug_pubnames,"",%progbits
	.4byte	0x4b1
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x898
	.4byte	0x165
	.ascii	"NonMaskableInt_IRQn\000"
	.4byte	0x16b
	.ascii	"HardFault_IRQn\000"
	.4byte	0x171
	.ascii	"SVC_IRQn\000"
	.4byte	0x177
	.ascii	"PendSV_IRQn\000"
	.4byte	0x17d
	.ascii	"SysTick_IRQn\000"
	.4byte	0x183
	.ascii	"WWDG_IRQn\000"
	.4byte	0x189
	.ascii	"PVD_IRQn\000"
	.4byte	0x18f
	.ascii	"RTC_IRQn\000"
	.4byte	0x195
	.ascii	"FLASH_IRQn\000"
	.4byte	0x19b
	.ascii	"RCC_IRQn\000"
	.4byte	0x1a1
	.ascii	"EXTI0_1_IRQn\000"
	.4byte	0x1a7
	.ascii	"EXTI2_3_IRQn\000"
	.4byte	0x1ad
	.ascii	"EXTI4_15_IRQn\000"
	.4byte	0x1b3
	.ascii	"TS_IRQn\000"
	.4byte	0x1b9
	.ascii	"DMA1_Channel1_IRQn\000"
	.4byte	0x1bf
	.ascii	"DMA1_Channel2_3_IRQn\000"
	.4byte	0x1c5
	.ascii	"DMA1_Channel4_5_IRQn\000"
	.4byte	0x1cb
	.ascii	"ADC1_COMP_IRQn\000"
	.4byte	0x1d1
	.ascii	"TIM1_BRK_UP_TRG_COM_IRQn\000"
	.4byte	0x1d7
	.ascii	"TIM1_CC_IRQn\000"
	.4byte	0x1dd
	.ascii	"TIM2_IRQn\000"
	.4byte	0x1e3
	.ascii	"TIM3_IRQn\000"
	.4byte	0x1e9
	.ascii	"TIM6_DAC_IRQn\000"
	.4byte	0x1ef
	.ascii	"TIM14_IRQn\000"
	.4byte	0x1f5
	.ascii	"TIM15_IRQn\000"
	.4byte	0x1fb
	.ascii	"TIM16_IRQn\000"
	.4byte	0x201
	.ascii	"TIM17_IRQn\000"
	.4byte	0x207
	.ascii	"I2C1_IRQn\000"
	.4byte	0x20d
	.ascii	"I2C2_IRQn\000"
	.4byte	0x213
	.ascii	"SPI1_IRQn\000"
	.4byte	0x219
	.ascii	"SPI2_IRQn\000"
	.4byte	0x21f
	.ascii	"USART1_IRQn\000"
	.4byte	0x225
	.ascii	"USART2_IRQn\000"
	.4byte	0x22b
	.ascii	"CEC_IRQn\000"
	.4byte	0x490
	.ascii	"NVIC_SetPriority\000"
	.4byte	0x4c5
	.ascii	"nvic_isr\000"
	.4byte	0x4da
	.ascii	"caribou_interrupt_service\000"
	.4byte	0x4e8
	.ascii	"_swi\000"
	.4byte	0x4f9
	.ascii	"_nmi\000"
	.4byte	0x50a
	.ascii	"chip_move_vectors\000"
	.4byte	0x540
	.ascii	"chip_systick_irq_state\000"
	.4byte	0x555
	.ascii	"chip_systick_irq_enable\000"
	.4byte	0x57c
	.ascii	"chip_systick_irq_disable\000"
	.4byte	0x5a3
	.ascii	"chip_systick_irq_set\000"
	.4byte	0x5c7
	.ascii	"chip_systick_count_bit\000"
	.4byte	0x5ee
	.ascii	"chip_systick_irq_force\000"
	.4byte	0x5ff
	.ascii	"chip_reset_watchdog\000"
	.4byte	0x610
	.ascii	"chip_idle\000"
	.4byte	0x621
	.ascii	"chip_reset\000"
	.4byte	0x632
	.ascii	"initSysTick\000"
	.4byte	0x656
	.ascii	"chip_init\000"
	.4byte	0x67a
	.ascii	"chip_interrupts_enable\000"
	.4byte	0x68b
	.ascii	"chip_interrupts_disable\000"
	.4byte	0x6a0
	.ascii	"chip_interrupts_enabled\000"
	.4byte	0x6b5
	.ascii	"chip_wfi\000"
	.4byte	0x6c6
	.ascii	"chip_interrupt_level\000"
	.4byte	0x6db
	.ascii	"chip_interrupts_set\000"
	.4byte	0x6ff
	.ascii	"chip_vector_enable\000"
	.4byte	0x768
	.ascii	"chip_vector_disable\000"
	.4byte	0x7d1
	.ascii	"chip_vector_enabled\000"
	.4byte	0x806
	.ascii	"chip_vector_set\000"
	.4byte	0x849
	.ascii	"chip_delay\000"
	.4byte	0x871
	.ascii	"chip_clock_freq\000"
	.4byte	0
	.section	.debug_pubtypes,"",%progbits
	.4byte	0x138
	.2byte	0x2
	.4byte	.Ldebug_info0
	.4byte	0x898
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
	.ascii	"long int\000"
	.4byte	0x6f
	.ascii	"char\000"
	.4byte	0x76
	.ascii	"sizetype\000"
	.4byte	0x14a
	.ascii	"InterruptVector\000"
	.4byte	0x155
	.ascii	"IRQn\000"
	.4byte	0x232
	.ascii	"IRQn_Type\000"
	.4byte	0x32d
	.ascii	"NVIC_Type\000"
	.4byte	0x3d2
	.ascii	"SCB_Type\000"
	.4byte	0x41c
	.ascii	"SysTick_Type\000"
	.4byte	0x485
	.ascii	"RCC_ClocksTypeDef\000"
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xf4
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
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
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB28
	.4byte	.LFE28
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
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	.LFB49
	.4byte	.LFE49
	.4byte	.LFB50
	.4byte	.LFE50
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	.LFB55
	.4byte	.LFE55
	.4byte	.LFB56
	.4byte	.LFE56
	.4byte	.LFB57
	.4byte	.LFE57
	.4byte	.LFB58
	.4byte	.LFE58
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"Vector_USART1\000"
.LASF38:
	.ascii	"Vector_USART2\000"
.LASF127:
	.ascii	"chip_interrupts_disable\000"
.LASF104:
	.ascii	"I2C1CLK_Frequency\000"
.LASF56:
	.ascii	"EXTI4_15_IRQn\000"
.LASF55:
	.ascii	"EXTI2_3_IRQn\000"
.LASF112:
	.ascii	"chip_systick_irq_enable\000"
.LASF46:
	.ascii	"SVC_IRQn\000"
.LASF145:
	.ascii	"NVIC_SetPriority\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF96:
	.ascii	"LOAD\000"
.LASF69:
	.ascii	"TIM16_IRQn\000"
.LASF135:
	.ascii	"chip_vector_enabled\000"
.LASF52:
	.ascii	"FLASH_IRQn\000"
.LASF123:
	.ascii	"systick_hz\000"
.LASF97:
	.ascii	"CALIB\000"
.LASF106:
	.ascii	"RCC_ClocksTypeDef\000"
.LASF54:
	.ascii	"EXTI0_1_IRQn\000"
.LASF21:
	.ascii	"Vector_DMA_CH4_5\000"
.LASF148:
	.ascii	"initSysTick\000"
.LASF71:
	.ascii	"I2C1_IRQn\000"
.LASF47:
	.ascii	"PendSV_IRQn\000"
.LASF101:
	.ascii	"PCLK_Frequency\000"
.LASF53:
	.ascii	"RCC_IRQn\000"
.LASF134:
	.ascii	"chip_vector_disable\000"
.LASF117:
	.ascii	"chip_systick_count_bit\000"
.LASF42:
	.ascii	"uint32_t\000"
.LASF142:
	.ascii	"GNU C99 5.4.1 20160609 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 237715] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -gpubnames -std=gnu"
	.ascii	"99 -fno-dwarf2-cfi-asm -fno-builtin -ffunction-sect"
	.ascii	"ions -fdata-sections -fshort-double -fshort-enums -"
	.ascii	"fno-common\000"
.LASF136:
	.ascii	"chip_vector_set\000"
.LASF17:
	.ascii	"Vector_EXTI4_15\000"
.LASF139:
	.ascii	"count\000"
.LASF82:
	.ascii	"RSERVED1\000"
.LASF73:
	.ascii	"SPI1_IRQn\000"
.LASF125:
	.ascii	"chip_interrupts_enable\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"Vector_Reserved1\000"
.LASF39:
	.ascii	"Vector_Reserved2\000"
.LASF133:
	.ascii	"vector\000"
.LASF110:
	.ascii	"_nmi\000"
.LASF41:
	.ascii	"Vector_SoftSysTick\000"
.LASF99:
	.ascii	"SYSCLK_Frequency\000"
.LASF102:
	.ascii	"ADCCLK_Frequency\000"
.LASF116:
	.ascii	"enable\000"
.LASF147:
	.ascii	"caribou_interrupt_service\000"
.LASF78:
	.ascii	"IRQn_Type\000"
.LASF76:
	.ascii	"USART2_IRQn\000"
.LASF20:
	.ascii	"Vector_DMA_CH2_3\000"
.LASF89:
	.ascii	"CPUID\000"
.LASF18:
	.ascii	"Vector_TSC\000"
.LASF119:
	.ascii	"chip_idle\000"
.LASF146:
	.ascii	"nvic_isr\000"
.LASF100:
	.ascii	"HCLK_Frequency\000"
.LASF113:
	.ascii	"chip_systick_irq_disable\000"
.LASF121:
	.ascii	"ticks\000"
.LASF138:
	.ascii	"chip_delay\000"
.LASF143:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks/../../../chip/stm"
	.ascii	"32/stm32f030/src/chip.c\000"
.LASF10:
	.ascii	"Vector_WWDG\000"
.LASF8:
	.ascii	"char\000"
.LASF79:
	.ascii	"ISER\000"
.LASF91:
	.ascii	"AIRCR\000"
.LASF65:
	.ascii	"TIM3_IRQn\000"
.LASF58:
	.ascii	"DMA1_Channel1_IRQn\000"
.LASF118:
	.ascii	"chip_reset_watchdog\000"
.LASF68:
	.ascii	"TIM15_IRQn\000"
.LASF131:
	.ascii	"chip_interrupts_set\000"
.LASF24:
	.ascii	"Vector_TIM1_CC\000"
.LASF14:
	.ascii	"Vector_RCC\000"
.LASF5:
	.ascii	"long long int\000"
.LASF49:
	.ascii	"WWDG_IRQn\000"
.LASF93:
	.ascii	"SHCSR\000"
.LASF126:
	.ascii	"chip_systick_irq_state\000"
.LASF23:
	.ascii	"Vector_TIM1_BRK_UP_TRG_COM\000"
.LASF140:
	.ascii	"chip_clock_freq\000"
.LASF120:
	.ascii	"chip_reset\000"
.LASF57:
	.ascii	"TS_IRQn\000"
.LASF62:
	.ascii	"TIM1_BRK_UP_TRG_COM_IRQn\000"
.LASF16:
	.ascii	"Vector_EXTI2_3\000"
.LASF33:
	.ascii	"Vector_I2C1\000"
.LASF34:
	.ascii	"Vector_I2C2\000"
.LASF114:
	.ascii	"chip_move_vectors\000"
.LASF85:
	.ascii	"ICPR\000"
.LASF61:
	.ascii	"ADC1_COMP_IRQn\000"
.LASF12:
	.ascii	"Vector_RTC\000"
.LASF122:
	.ascii	"chip_init\000"
.LASF98:
	.ascii	"SysTick_Type\000"
.LASF141:
	.ascii	"RCC_Clocks\000"
.LASF107:
	.ascii	"IRQn\000"
.LASF35:
	.ascii	"Vector_SPI1\000"
.LASF36:
	.ascii	"Vector_SPI2\000"
.LASF105:
	.ascii	"USART1CLK_Frequency\000"
.LASF103:
	.ascii	"CECCLK_Frequency\000"
.LASF51:
	.ascii	"RTC_IRQn\000"
.LASF80:
	.ascii	"RESERVED0\000"
.LASF92:
	.ascii	"RESERVED1\000"
.LASF84:
	.ascii	"RESERVED2\000"
.LASF86:
	.ascii	"RESERVED3\000"
.LASF87:
	.ascii	"RESERVED4\000"
.LASF2:
	.ascii	"short int\000"
.LASF7:
	.ascii	"long int\000"
.LASF75:
	.ascii	"USART1_IRQn\000"
.LASF44:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF25:
	.ascii	"Vector_TIM2\000"
.LASF26:
	.ascii	"Vector_TIM3\000"
.LASF108:
	.ascii	"priority\000"
.LASF129:
	.ascii	"chip_wfi\000"
.LASF63:
	.ascii	"TIM1_CC_IRQn\000"
.LASF67:
	.ascii	"TIM14_IRQn\000"
.LASF29:
	.ascii	"Vector_TIM14\000"
.LASF30:
	.ascii	"Vector_TIM15\000"
.LASF31:
	.ascii	"Vector_TIM16\000"
.LASF32:
	.ascii	"Vector_TIM17\000"
.LASF60:
	.ascii	"DMA1_Channel4_5_IRQn\000"
.LASF50:
	.ascii	"PVD_IRQn\000"
.LASF70:
	.ascii	"TIM17_IRQn\000"
.LASF88:
	.ascii	"NVIC_Type\000"
.LASF94:
	.ascii	"SCB_Type\000"
.LASF137:
	.ascii	"state\000"
.LASF15:
	.ascii	"Vector_EXTI0_1\000"
.LASF48:
	.ascii	"SysTick_IRQn\000"
.LASF124:
	.ascii	"chip_systick_irq_force\000"
.LASF77:
	.ascii	"CEC_IRQn\000"
.LASF9:
	.ascii	"sizetype\000"
.LASF90:
	.ascii	"ICSR\000"
.LASF72:
	.ascii	"I2C2_IRQn\000"
.LASF111:
	.ascii	"offset\000"
.LASF115:
	.ascii	"chip_systick_irq_set\000"
.LASF64:
	.ascii	"TIM2_IRQn\000"
.LASF130:
	.ascii	"chip_interrupt_level\000"
.LASF22:
	.ascii	"Vector_ADC_COMP\000"
.LASF59:
	.ascii	"DMA1_Channel2_3_IRQn\000"
.LASF66:
	.ascii	"TIM6_DAC_IRQn\000"
.LASF13:
	.ascii	"Vector_FLASH\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF132:
	.ascii	"chip_vector_enable\000"
.LASF81:
	.ascii	"ICER\000"
.LASF40:
	.ascii	"Vector_CEC\000"
.LASF74:
	.ascii	"SPI2_IRQn\000"
.LASF109:
	.ascii	"_swi\000"
.LASF27:
	.ascii	"Vector_TIM6_DAC\000"
.LASF0:
	.ascii	"signed char\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF128:
	.ascii	"chip_interrupts_enabled\000"
.LASF45:
	.ascii	"HardFault_IRQn\000"
.LASF83:
	.ascii	"ISPR\000"
.LASF19:
	.ascii	"Vector_DMA_CH1\000"
.LASF11:
	.ascii	"Vector_PVD\000"
.LASF43:
	.ascii	"InterruptVector\000"
.LASF144:
	.ascii	"/home/mike/Documents/GitHub/caribou-rtos/caribou/ta"
	.ascii	"rget/board/nucleo_f030/crossworks\000"
.LASF95:
	.ascii	"CTRL\000"
	.ident	"GCC: (GNU) 5.4.1 20160609 (release) [ARM/embedded-5-branch revision 237715]"
