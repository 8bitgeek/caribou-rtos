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
	.file	"chip.c"
	.text
.Ltext0:
	.section	.text.nvic_isr,"ax",%progbits
	.align	2
	.global	nvic_isr
	.code	16
	.thumb_func
	.type	nvic_isr, %function
nvic_isr:
.LFB32:
@ 27 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
		push	{lr}			
	push	{r4-r7}			
	mov		r4,r8			
	mov		r5,r9			
	mov		r6,r10			
	mov		r7,r11			
	push	{r4-r7}			

@ 0 "" 2
	.code	16
	ldr	r3, .L2
	ldr	r3, [r3, #4]
	mov	r0, #255
	and	r0, r3
	sub	r0, r0, #16
	bl	caribou_interrupt_service
@ 29 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
		pop		{r4-r7}			
	mov		r11,r7			
	mov		r10,r6			
	mov		r9,r5			
	mov		r8,r4			
	pop		{r4-r7}			
	pop		{pc}			

@ 0 "" 2
	.code	16
.L3:
	.align	2
.L2:
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
	@ sp needed
	bx	lr
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
	@ sp needed
	bx	lr
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
	mov	r0, #0
	@ sp needed
	bx	lr
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
	ldr	r3, .L8
	ldr	r0, [r3]
	lsl	r0, r0, #30
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.L9:
	.align	2
.L8:
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
	ldr	r3, .L11
	ldr	r0, [r3]
	ldr	r1, [r3]
	mov	r2, #2
	orr	r2, r1
	str	r2, [r3]
	lsl	r0, r0, #30
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.L12:
	.align	2
.L11:
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
	ldr	r3, .L14
	ldr	r0, [r3]
	ldr	r2, [r3]
	mov	r1, #2
	bic	r2, r1
	str	r2, [r3]
	lsl	r0, r0, #30
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
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
	cmp	r0, #0
	beq	.L17
	ldr	r3, .L19
	ldr	r1, [r3]
	mov	r2, #2
	orr	r2, r1
	str	r2, [r3]
	b	.L16
.L17:
	ldr	r3, .L19
	ldr	r2, [r3]
	mov	r1, #2
	bic	r2, r1
	str	r2, [r3]
.L16:
	@ sp needed
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	r3, .L22
	ldr	r0, [r3]
	lsl	r0, r0, #15
	lsr	r0, r0, #31
	@ sp needed
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r3, .L25
	ldr	r1, [r3, #4]
	mov	r2, #128
	lsl	r2, r2, #21
	orr	r2, r1
	str	r2, [r3, #4]
	@ sp needed
	bx	lr
.L26:
	.align	2
.L25:
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
	@ sp needed
	bx	lr
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
	@ sp needed
	bx	lr
.LFE43:
	.size	chip_idle, .-chip_idle
	.section	.text.chip_interrupts_enable,"ax",%progbits
	.align	2
	.global	chip_interrupts_enable
	.code	16
	.thumb_func
	.type	chip_interrupts_enable, %function
chip_interrupts_enable:
.LFB46:
@ 138 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsie   i
 bx      lr

@ 0 "" 2
	.code	16
.LFE46:
	.size	chip_interrupts_enable, .-chip_interrupts_enable
	.section	.text.chip_interrupts_disable,"ax",%progbits
	.align	2
	.global	chip_interrupts_disable
	.code	16
	.thumb_func
	.type	chip_interrupts_disable, %function
chip_interrupts_disable:
.LFB47:
@ 144 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 movs    r1,#1
 mrs     r0, primask
 eor     r0,r1
 pop     {r1}
 cpsid	i
 bx  	lr

@ 0 "" 2
	.code	16
.LFE47:
	.size	chip_interrupts_disable, .-chip_interrupts_disable
	.section	.text.chip_interrupts_enabled,"ax",%progbits
	.align	2
	.global	chip_interrupts_enabled
	.code	16
	.thumb_func
	.type	chip_interrupts_enabled, %function
chip_interrupts_enabled:
.LFB48:
@ 155 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 movs    r1,#1
 mrs     r0, primask
 eor     r0,r1
 pop     {r1}
 bx  	lr

@ 0 "" 2
	.code	16
.LFE48:
	.size	chip_interrupts_enabled, .-chip_interrupts_enabled
	.section	.text.chip_wfi,"ax",%progbits
	.align	2
	.global	chip_wfi
	.code	16
	.thumb_func
	.type	chip_wfi, %function
chip_wfi:
.LFB49:
@ 165 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 wfi
 bx lr

@ 0 "" 2
	.code	16
.LFE49:
	.size	chip_wfi, .-chip_wfi
	.section	.text.chip_interrupt_level,"ax",%progbits
	.align	2
	.global	chip_interrupt_level
	.code	16
	.thumb_func
	.type	chip_interrupt_level, %function
chip_interrupt_level:
.LFB50:
@ 171 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 mov     r1,#0x3F
 mrs     r0, psr
 and     r0,r1
 pop     {r1}
 bx  	lr

@ 0 "" 2
	.code	16
.LFE50:
	.size	chip_interrupt_level, .-chip_interrupt_level
	.section	.text.chip_interrupts_set,"ax",%progbits
	.align	2
	.global	chip_interrupts_set
	.code	16
	.thumb_func
	.type	chip_interrupts_set, %function
chip_interrupts_set:
.LFB51:
	cmp	r0, #0
	beq	.L35
@ 182 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsie   i

@ 0 "" 2
	.code	16
	b	.L34
.L35:
@ 184 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsid   i

@ 0 "" 2
	.code	16
.L34:
	@ sp needed
	bx	lr
.LFE51:
	.size	chip_interrupts_set, .-chip_interrupts_set
	.section	.text.chip_vector_enable,"ax",%progbits
	.align	2
	.global	chip_vector_enable
	.code	16
	.thumb_func
	.type	chip_vector_enable, %function
chip_vector_enable:
.LFB52:
	cmp	r0, #31
	bhi	.L38
.LBB2:
	mov	r2, #1
	lsl	r2, r2, r0
	ldr	r3, .L40
	ldr	r0, [r3]
	and	r0, r2
	sub	r1, r0, #1
	sbc	r0, r0, r1
	str	r2, [r3]
.LBE2:
	b	.L39
.L38:
.LBB3:
	sub	r0, r0, #32
	mov	r2, #1
	lsl	r2, r2, r0
	ldr	r3, .L40
	ldr	r0, [r3, #4]
	and	r0, r2
	sub	r1, r0, #1
	sbc	r0, r0, r1
	str	r2, [r3, #4]
.L39:
.LBE3:
	@ sp needed
	bx	lr
.L41:
	.align	2
.L40:
	.word	-536813312
.LFE52:
	.size	chip_vector_enable, .-chip_vector_enable
	.section	.text.chip_vector_disable,"ax",%progbits
	.align	2
	.global	chip_vector_disable
	.code	16
	.thumb_func
	.type	chip_vector_disable, %function
chip_vector_disable:
.LFB53:
	cmp	r0, #31
	bhi	.L43
.LBB4:
	mov	r2, #1
	lsl	r2, r2, r0
	ldr	r3, .L45
	ldr	r0, [r3]
	and	r0, r2
	sub	r1, r0, #1
	sbc	r0, r0, r1
	mov	r1, #128
	str	r2, [r3, r1]
.LBE4:
	b	.L44
.L43:
.LBB5:
	sub	r0, r0, #32
	mov	r2, #1
	lsl	r2, r2, r0
	ldr	r3, .L45
	ldr	r0, [r3, #4]
	and	r0, r2
	sub	r1, r0, #1
	sbc	r0, r0, r1
	mov	r1, #132
	str	r2, [r3, r1]
.L44:
.LBE5:
	@ sp needed
	bx	lr
.L46:
	.align	2
.L45:
	.word	-536813312
.LFE53:
	.size	chip_vector_disable, .-chip_vector_disable
	.section	.text.chip_vector_enabled,"ax",%progbits
	.align	2
	.global	chip_vector_enabled
	.code	16
	.thumb_func
	.type	chip_vector_enabled, %function
chip_vector_enabled:
.LFB54:
	cmp	r0, #31
	bhi	.L48
	ldr	r3, .L50
	ldr	r3, [r3]
	mov	r2, #1
	lsl	r2, r2, r0
	mov	r0, r2
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
	b	.L49
.L48:
	ldr	r3, .L50
	ldr	r3, [r3, #4]
	sub	r0, r0, #32
	mov	r2, #1
	lsl	r2, r2, r0
	mov	r0, r2
	and	r0, r3
	sub	r3, r0, #1
	sbc	r0, r0, r3
.L49:
	@ sp needed
	bx	lr
.L51:
	.align	2
.L50:
	.word	-536813312
.LFE54:
	.size	chip_vector_enabled, .-chip_vector_enabled
	.section	.text.chip_vector_set,"ax",%progbits
	.align	2
	.global	chip_vector_set
	.code	16
	.thumb_func
	.type	chip_vector_set, %function
chip_vector_set:
.LFB55:
	push	{r3, lr}
.LCFI0:
	cmp	r1, #0
	beq	.L53
	bl	chip_vector_enable
	b	.L54
.L53:
	bl	chip_vector_disable
.L54:
	@ sp needed
	pop	{r3, pc}
.LFE55:
	.size	chip_vector_set, .-chip_vector_set
	.section	.text.chip_delay,"ax",%progbits
	.align	2
	.global	chip_delay
	.code	16
	.thumb_func
	.type	chip_delay, %function
chip_delay:
.LFB56:
	cmp	r0, #0
	beq	.L56
.L57:
	sub	r0, r0, #1
	cmp	r0, #0
	bne	.L57
.L56:
	@ sp needed
	bx	lr
.LFE56:
	.size	chip_delay, .-chip_delay
	.section	.text.chip_clock_freq,"ax",%progbits
	.align	2
	.global	chip_clock_freq
	.code	16
	.thumb_func
	.type	chip_clock_freq, %function
chip_clock_freq:
.LFB57:
	push	{lr}
.LCFI1:
	sub	sp, sp, #36
.LCFI2:
	add	r0, sp, #4
	bl	RCC_GetClocksFreq
	ldr	r0, [sp, #4]
	add	sp, sp, #36
	@ sp needed
	pop	{pc}
.LFE57:
	.size	chip_clock_freq, .-chip_clock_freq
	.global	__aeabi_uidiv
	.section	.text.chip_init,"ax",%progbits
	.align	2
	.global	chip_init
	.code	16
	.thumb_func
	.type	chip_init, %function
chip_init:
.LFB45:
	push	{r3, lr}
.LCFI3:
	bl	chip_interrupts_disable
.LBB10:
.LBB11:
	bl	chip_clock_freq
	mov	r1, #250
	lsl	r1, r1, #2
	bl	__aeabi_uidiv
	lsl	r0, r0, #8
	lsr	r0, r0, #8
	sub	r0, r0, #1
	ldr	r3, .L60
	str	r0, [r3, #4]
.LBB12:
.LBB13:
	ldr	r2, .L60+4
	ldr	r0, [r2, #32]
	lsl	r0, r0, #8
	lsr	r0, r0, #8
	mov	r1, #192
	lsl	r1, r1, #24
	orr	r1, r0
	str	r1, [r2, #32]
.LBE13:
.LBE12:
	mov	r2, #0
	str	r2, [r3, #8]
	mov	r2, #7
	str	r2, [r3]
.LBE11:
.LBE10:
	@ sp needed
	pop	{r3, pc}
.L61:
	.align	2
.L60:
	.word	-536813552
	.word	-536810240
.LFE45:
	.size	chip_init, .-chip_init
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
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.align	2
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.align	2
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.align	2
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.align	2
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.align	2
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.align	2
.LEFDE34:
.LSFDE36:
	.4byte	.LEFDE36-.LASFDE36
.LASFDE36:
	.4byte	.Lframe0
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.align	2
.LEFDE36:
.LSFDE38:
	.4byte	.LEFDE38-.LASFDE38
.LASFDE38:
	.4byte	.Lframe0
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.align	2
.LEFDE38:
.LSFDE40:
	.4byte	.LEFDE40-.LASFDE40
.LASFDE40:
	.4byte	.Lframe0
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.align	2
.LEFDE40:
.LSFDE42:
	.4byte	.LEFDE42-.LASFDE42
.LASFDE42:
	.4byte	.Lframe0
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.byte	0x4
	.4byte	.LCFI0-.LFB55
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE42:
.LSFDE44:
	.4byte	.LEFDE44-.LASFDE44
.LASFDE44:
	.4byte	.Lframe0
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.align	2
.LEFDE44:
.LSFDE46:
	.4byte	.LEFDE46-.LASFDE46
.LASFDE46:
	.4byte	.Lframe0
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.byte	0x4
	.4byte	.LCFI1-.LFB57
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x28
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x4
	.4byte	.LCFI3-.LFB45
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE48:
	.text
.Letext0:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4/crossworks/../../../chip/stm32/stm32f030/src/chip.c"
	.file 2 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1e4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x1
	.4byte	.LASF27
	.4byte	.LASF28
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x1
	.byte	0x19
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3e
	.uleb128 0x3
	.4byte	.LASF30
	.byte	0x1
	.byte	0x1c
	.byte	0
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x1
	.byte	0x20
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x1
	.byte	0x24
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x1
	.byte	0x28
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x1
	.byte	0x30
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x1
	.byte	0x38
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.byte	0x43
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.byte	0x4d
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x1
	.byte	0x59
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x1
	.byte	0x63
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x1
	.byte	0x68
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x1
	.byte	0x6c
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.byte	0x88
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8e
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.byte	0x99
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x1
	.byte	0xa3
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.byte	0xa9
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.byte	0xb3
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.byte	0xbc
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x1
	.byte	0xcf
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x1
	.byte	0xe1
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x1
	.byte	0xeb
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x1
	.byte	0xf6
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0x1
	.byte	0xfd
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x1
	.byte	0x74
	.byte	0x1
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x23b
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x1
	.byte	0x81
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
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
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xdc
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
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
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
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
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
	.4byte	.LFB43
	.4byte	.LFE43
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
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF6:
	.ascii	"chip_systick_irq_set\000"
.LASF25:
	.ascii	"chip_init\000"
.LASF28:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks\000"
.LASF21:
	.ascii	"chip_delay\000"
.LASF7:
	.ascii	"chip_systick_count_bit\000"
.LASF3:
	.ascii	"chip_systick_irq_state\000"
.LASF14:
	.ascii	"chip_wfi\000"
.LASF23:
	.ascii	"initSysTick\000"
.LASF30:
	.ascii	"caribou_interrupt_service\000"
.LASF5:
	.ascii	"chip_systick_irq_disable\000"
.LASF22:
	.ascii	"chip_clock_freq\000"
.LASF12:
	.ascii	"chip_interrupts_disable\000"
.LASF9:
	.ascii	"chip_reset_watchdog\000"
.LASF13:
	.ascii	"chip_interrupts_enabled\000"
.LASF15:
	.ascii	"chip_interrupt_level\000"
.LASF20:
	.ascii	"chip_vector_set\000"
.LASF29:
	.ascii	"nvic_isr\000"
.LASF4:
	.ascii	"chip_systick_irq_enable\000"
.LASF26:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g1 -std=gnu99 -O1 -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF24:
	.ascii	"NVIC_SetPriority\000"
.LASF8:
	.ascii	"chip_systick_irq_force\000"
.LASF10:
	.ascii	"chip_idle\000"
.LASF11:
	.ascii	"chip_interrupts_enable\000"
.LASF27:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4/crossworks/../"
	.ascii	"../../chip/stm32/stm32f030/src/chip.c\000"
.LASF2:
	.ascii	"chip_move_vectors\000"
.LASF16:
	.ascii	"chip_interrupts_set\000"
.LASF0:
	.ascii	"_swi\000"
.LASF18:
	.ascii	"chip_vector_disable\000"
.LASF1:
	.ascii	"_nmi\000"
.LASF19:
	.ascii	"chip_vector_enabled\000"
.LASF17:
	.ascii	"chip_vector_enable\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
