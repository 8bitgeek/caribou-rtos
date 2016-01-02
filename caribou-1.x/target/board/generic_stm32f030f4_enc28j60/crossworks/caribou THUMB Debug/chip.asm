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
	.file	"chip.c"
	.text
.Ltext0:
	.section	.text.nvic_isr,"ax",%progbits
	.align	1
	.global	nvic_isr
	.code	16
	.thumb_func
	.type	nvic_isr, %function
nvic_isr:
.LFB32:
	.file 1 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c"
	.loc 1 26 0
	.loc 1 27 0
@ 27 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
		push	{lr}			
	push	{r4-r7}			
	mov		r4,r8			
	mov		r5,r9			
	mov		r6,r10			
	mov		r7,r11			
	push	{r4-r7}			

@ 0 "" 2
	.loc 1 28 0
	.code	16
	ldr	r3, .L2
	ldr	r0, [r3, #4]
	uxtb	r0, r0
	sub	r0, r0, #16
	bl	caribou_interrupt_service
.LVL0:
	.loc 1 29 0
@ 29 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
		pop		{r4-r7}			
	mov		r11,r7			
	mov		r10,r6			
	mov		r9,r5			
	mov		r8,r4			
	pop		{r4-r7}			
	pop		{pc}			

@ 0 "" 2
	.loc 1 30 0
	.code	16
.L3:
	.align	2
.L2:
	.word	-536810240
.LFE32:
	.size	nvic_isr, .-nvic_isr
	.section	.text._swi,"ax",%progbits
	.align	1
	.weak	_swi
	.code	16
	.thumb_func
	.type	_swi, %function
_swi:
.LFB33:
	.loc 1 33 0
	.loc 1 34 0
	@ sp needed
	bx	lr
.LFE33:
	.size	_swi, .-_swi
	.section	.text._nmi,"ax",%progbits
	.align	1
	.weak	_nmi
	.code	16
	.thumb_func
	.type	_nmi, %function
_nmi:
.LFB34:
	.loc 1 37 0
	.loc 1 38 0
	@ sp needed
	bx	lr
.LFE34:
	.size	_nmi, .-_nmi
	.section	.text.chip_move_vectors,"ax",%progbits
	.align	1
	.global	chip_move_vectors
	.code	16
	.thumb_func
	.type	chip_move_vectors, %function
chip_move_vectors:
.LFB35:
	.loc 1 41 0
.LVL1:
	.loc 1 43 0
	mov	r0, #0
.LVL2:
	@ sp needed
	bx	lr
.LFE35:
	.size	chip_move_vectors, .-chip_move_vectors
	.section	.text.chip_systick_irq_state,"ax",%progbits
	.align	1
	.global	chip_systick_irq_state
	.code	16
	.thumb_func
	.type	chip_systick_irq_state, %function
chip_systick_irq_state:
.LFB36:
	.loc 1 49 0
	.loc 1 50 0
	ldr	r3, .L8
	.loc 1 51 0
	@ sp needed
	.loc 1 50 0
	ldr	r0, [r3]
	lsl	r0, r0, #30
	lsr	r0, r0, #31
	.loc 1 51 0
	bx	lr
.L9:
	.align	2
.L8:
	.word	-536813552
.LFE36:
	.size	chip_systick_irq_state, .-chip_systick_irq_state
	.section	.text.chip_systick_irq_enable,"ax",%progbits
	.align	1
	.global	chip_systick_irq_enable
	.code	16
	.thumb_func
	.type	chip_systick_irq_enable, %function
chip_systick_irq_enable:
.LFB37:
	.loc 1 57 0
	.loc 1 58 0
	ldr	r3, .L11
	.loc 1 59 0
	mov	r1, #2
	.loc 1 58 0
	ldr	r0, [r3]
.LVL3:
	.loc 1 59 0
	ldr	r2, [r3]
	.loc 1 58 0
	lsl	r0, r0, #30
.LVL4:
	.loc 1 59 0
	orr	r2, r1
	.loc 1 58 0
	lsr	r0, r0, #31
	.loc 1 59 0
	str	r2, [r3]
	.loc 1 61 0
	@ sp needed
	bx	lr
.L12:
	.align	2
.L11:
	.word	-536813552
.LFE37:
	.size	chip_systick_irq_enable, .-chip_systick_irq_enable
	.section	.text.chip_systick_irq_disable,"ax",%progbits
	.align	1
	.global	chip_systick_irq_disable
	.code	16
	.thumb_func
	.type	chip_systick_irq_disable, %function
chip_systick_irq_disable:
.LFB38:
	.loc 1 68 0
	.loc 1 69 0
	ldr	r3, .L14
	.loc 1 70 0
	mov	r1, #2
	.loc 1 69 0
	ldr	r0, [r3]
.LVL5:
	.loc 1 70 0
	ldr	r2, [r3]
	.loc 1 69 0
	lsl	r0, r0, #30
.LVL6:
	.loc 1 70 0
	bic	r2, r1
	.loc 1 69 0
	lsr	r0, r0, #31
	.loc 1 70 0
	str	r2, [r3]
	.loc 1 72 0
	@ sp needed
	bx	lr
.L15:
	.align	2
.L14:
	.word	-536813552
.LFE38:
	.size	chip_systick_irq_disable, .-chip_systick_irq_disable
	.section	.text.chip_systick_irq_set,"ax",%progbits
	.align	1
	.global	chip_systick_irq_set
	.code	16
	.thumb_func
	.type	chip_systick_irq_set, %function
chip_systick_irq_set:
.LFB39:
	.loc 1 78 0
.LVL7:
	ldr	r3, .L21
	mov	r2, #2
	.loc 1 80 0
	ldr	r1, [r3]
	.loc 1 79 0
	cmp	r0, #0
	beq	.L17
	.loc 1 80 0
	orr	r2, r1
	b	.L19
.L17:
	.loc 1 82 0
	bic	r1, r2
	mov	r2, r1
.L19:
	str	r2, [r3]
	.loc 1 83 0
	@ sp needed
	bx	lr
.L22:
	.align	2
.L21:
	.word	-536813552
.LFE39:
	.size	chip_systick_irq_set, .-chip_systick_irq_set
	.section	.text.chip_systick_count_bit,"ax",%progbits
	.align	1
	.global	chip_systick_count_bit
	.code	16
	.thumb_func
	.type	chip_systick_count_bit, %function
chip_systick_count_bit:
.LFB40:
	.loc 1 90 0
	.loc 1 91 0
	ldr	r3, .L24
	.loc 1 93 0
	@ sp needed
	.loc 1 91 0
	ldr	r0, [r3]
.LVL8:
	lsl	r0, r0, #15
.LVL9:
	.loc 1 92 0
	lsr	r0, r0, #31
	.loc 1 93 0
	bx	lr
.L25:
	.align	2
.L24:
	.word	-536813552
.LFE40:
	.size	chip_systick_count_bit, .-chip_systick_count_bit
	.section	.text.chip_systick_irq_force,"ax",%progbits
	.align	1
	.global	chip_systick_irq_force
	.code	16
	.thumb_func
	.type	chip_systick_irq_force, %function
chip_systick_irq_force:
.LFB41:
	.loc 1 100 0
	.loc 1 101 0
	ldr	r3, .L27
	mov	r2, #128
	ldr	r1, [r3, #4]
	lsl	r2, r2, #21
	orr	r2, r1
	str	r2, [r3, #4]
	.loc 1 102 0
	@ sp needed
	bx	lr
.L28:
	.align	2
.L27:
	.word	-536810240
.LFE41:
	.size	chip_systick_irq_force, .-chip_systick_irq_force
	.section	.text.chip_systick_enter,"ax",%progbits
	.align	1
	.global	chip_systick_enter
	.code	16
	.thumb_func
	.type	chip_systick_enter, %function
chip_systick_enter:
.LFB42:
	.loc 1 105 0
	.loc 1 106 0
	ldr	r3, .L34
	ldr	r2, [r3, #4]
.LVL10:
	lsl	r2, r2, #23
.LVL11:
	lsr	r2, r2, #23
	.loc 1 107 0
	cmp	r2, #14
	beq	.L31
	cmp	r2, #15
	bne	.L29
	.loc 1 113 0
	mov	r2, #128
	ldr	r1, [r3, #4]
	lsl	r2, r2, #18
	b	.L33
.L31:
	.loc 1 110 0
	mov	r2, #128
	ldr	r1, [r3, #4]
	lsl	r2, r2, #20
.L33:
	.loc 1 113 0
	orr	r2, r1
	str	r2, [r3, #4]
.L29:
	.loc 1 116 0
	@ sp needed
	bx	lr
.L35:
	.align	2
.L34:
	.word	-536810240
.LFE42:
	.size	chip_systick_enter, .-chip_systick_enter
	.section	.text.chip_systick_exit,"ax",%progbits
	.align	1
	.global	chip_systick_exit
	.code	16
	.thumb_func
	.type	chip_systick_exit, %function
chip_systick_exit:
.LFB43:
	.loc 1 119 0
	.loc 1 120 0
	@ sp needed
	bx	lr
.LFE43:
	.size	chip_systick_exit, .-chip_systick_exit
	.section	.text.chip_reset_watchdog,"ax",%progbits
	.align	1
	.global	chip_reset_watchdog
	.code	16
	.thumb_func
	.type	chip_reset_watchdog, %function
chip_reset_watchdog:
.LFB44:
	.loc 1 123 0
	.loc 1 124 0
	@ sp needed
	bx	lr
.LFE44:
	.size	chip_reset_watchdog, .-chip_reset_watchdog
	.section	.text.chip_idle,"ax",%progbits
	.align	1
	.global	chip_idle
	.code	16
	.thumb_func
	.type	chip_idle, %function
chip_idle:
.LFB45:
	.loc 1 127 0
	.loc 1 129 0
	@ sp needed
	bx	lr
.LFE45:
	.size	chip_idle, .-chip_idle
	.section	.text.chip_interrupts_enable,"ax",%progbits
	.align	1
	.global	chip_interrupts_enable
	.code	16
	.thumb_func
	.type	chip_interrupts_enable, %function
chip_interrupts_enable:
.LFB48:
	.loc 1 155 0
	.loc 1 156 0
@ 156 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsie   i
 bx      lr

@ 0 "" 2
	.loc 1 158 0
	.code	16
.LFE48:
	.size	chip_interrupts_enable, .-chip_interrupts_enable
	.section	.text.chip_interrupts_disable,"ax",%progbits
	.align	1
	.global	chip_interrupts_disable
	.code	16
	.thumb_func
	.type	chip_interrupts_disable, %function
chip_interrupts_disable:
.LFB49:
	.loc 1 161 0
	.loc 1 162 0
@ 162 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 movs    r1,#1
 mrs     r0, primask
 eor     r0,r1
 pop     {r1}
 cpsid	i
 bx  	lr

@ 0 "" 2
	.loc 1 169 0
	.code	16
.LFE49:
	.size	chip_interrupts_disable, .-chip_interrupts_disable
	.section	.text.chip_interrupts_enabled,"ax",%progbits
	.align	1
	.global	chip_interrupts_enabled
	.code	16
	.thumb_func
	.type	chip_interrupts_enabled, %function
chip_interrupts_enabled:
.LFB50:
	.loc 1 172 0
	.loc 1 173 0
@ 173 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 movs    r1,#1
 mrs     r0, primask
 eor     r0,r1
 pop     {r1}
 bx  	lr

@ 0 "" 2
	.loc 1 179 0
	.code	16
.LFE50:
	.size	chip_interrupts_enabled, .-chip_interrupts_enabled
	.section	.text.chip_wfi,"ax",%progbits
	.align	1
	.global	chip_wfi
	.code	16
	.thumb_func
	.type	chip_wfi, %function
chip_wfi:
.LFB51:
	.loc 1 182 0
	.loc 1 183 0
@ 183 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 wfi
 bx lr

@ 0 "" 2
	.loc 1 184 0
	.code	16
.LFE51:
	.size	chip_wfi, .-chip_wfi
	.section	.text.chip_interrupt_level,"ax",%progbits
	.align	1
	.global	chip_interrupt_level
	.code	16
	.thumb_func
	.type	chip_interrupt_level, %function
chip_interrupt_level:
.LFB52:
	.loc 1 188 0
	.loc 1 189 0
@ 189 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 push    {r1}
 mov     r1,#0x3F
 mrs     r0, psr
 and     r0,r1
 pop     {r1}
 bx  	lr

@ 0 "" 2
	.loc 1 195 0
	.code	16
.LFE52:
	.size	chip_interrupt_level, .-chip_interrupt_level
	.section	.text.chip_interrupts_set,"ax",%progbits
	.align	1
	.global	chip_interrupts_set
	.code	16
	.thumb_func
	.type	chip_interrupts_set, %function
chip_interrupts_set:
.LFB53:
	.loc 1 198 0
.LVL12:
	.loc 1 199 0
	cmp	r0, #0
	beq	.L45
	.loc 1 200 0
@ 200 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsie   i

@ 0 "" 2
	.code	16
	b	.L44
.L45:
	.loc 1 202 0
@ 202 "/home/mike/Documents/caribou-rtos/branches/0.9/caribou/target/board/generic_stm32f030f4_enc28j60/crossworks/../../../chip/stm32/stm32f030/src/chip.c" 1
	 cpsid   i

@ 0 "" 2
	.code	16
.L44:
	.loc 1 203 0
	@ sp needed
	bx	lr
.LFE53:
	.size	chip_interrupts_set, .-chip_interrupts_set
	.section	.text.chip_vector_enable,"ax",%progbits
	.align	1
	.global	chip_vector_enable
	.code	16
	.thumb_func
	.type	chip_vector_enable, %function
chip_vector_enable:
.LFB54:
	.loc 1 207 0
.LVL13:
	mov	r2, #1
	ldr	r3, .L50
	.loc 1 209 0
	cmp	r0, #31
	bhi	.L48
.LBB4:
	.loc 1 211 0
	lsl	r2, r2, r0
.LVL14:
	.loc 1 212 0
	ldr	r0, [r3]
.LVL15:
	.loc 1 213 0
	str	r2, [r3]
	.loc 1 212 0
	and	r0, r2
	sub	r1, r0, #1
	sbc	r0, r0, r1
.LVL16:
.LBE4:
	b	.L49
.LVL17:
.L48:
.LBB5:
	.loc 1 217 0
	sub	r0, r0, #32
.LVL18:
	lsl	r2, r2, r0
.LVL19:
	.loc 1 218 0
	ldr	r0, [r3, #4]
.LVL20:
	.loc 1 219 0
	str	r2, [r3, #4]
	.loc 1 218 0
	and	r0, r2
	sub	r1, r0, #1
	sbc	r0, r0, r1
.LVL21:
.L49:
.LBE5:
	.loc 1 222 0
	@ sp needed
	bx	lr
.L51:
	.align	2
.L50:
	.word	-536813312
.LFE54:
	.size	chip_vector_enable, .-chip_vector_enable
	.section	.text.chip_vector_disable,"ax",%progbits
	.align	1
	.global	chip_vector_disable
	.code	16
	.thumb_func
	.type	chip_vector_disable, %function
chip_vector_disable:
.LFB55:
	.loc 1 226 0
.LVL22:
	mov	r3, #1
	ldr	r2, .L56
	.loc 1 228 0
	cmp	r0, #31
	bhi	.L53
.LBB6:
	.loc 1 230 0
	lsl	r3, r3, r0
.LVL23:
	.loc 1 231 0
	ldr	r0, [r2]
.LVL24:
	and	r0, r3
	sub	r2, r0, #1
	sbc	r0, r0, r2
.LVL25:
	.loc 1 232 0
	ldr	r2, .L56+4
	b	.L55
.LVL26:
.L53:
.LBE6:
.LBB7:
	.loc 1 236 0
	sub	r0, r0, #32
.LVL27:
	lsl	r3, r3, r0
.LVL28:
	.loc 1 237 0
	ldr	r0, [r2, #4]
.LVL29:
	and	r0, r3
	sub	r2, r0, #1
	sbc	r0, r0, r2
.LVL30:
	.loc 1 238 0
	ldr	r2, .L56+8
.LVL31:
.L55:
	str	r3, [r2, #124]
.LVL32:
.LBE7:
	.loc 1 241 0
	@ sp needed
	bx	lr
.L57:
	.align	2
.L56:
	.word	-536813312
	.word	-536813308
	.word	-536813304
.LFE55:
	.size	chip_vector_disable, .-chip_vector_disable
	.section	.text.chip_vector_enabled,"ax",%progbits
	.align	1
	.global	chip_vector_enabled
	.code	16
	.thumb_func
	.type	chip_vector_enabled, %function
chip_vector_enabled:
.LFB56:
	.loc 1 244 0
.LVL33:
	ldr	r2, .L62
	mov	r3, #1
	.loc 1 246 0
	cmp	r0, #31
	bhi	.L59
	.loc 1 247 0
	ldr	r2, [r2]
	lsl	r3, r3, r0
	mov	r0, r3
.LVL34:
	and	r0, r2
	b	.L61
.LVL35:
.L59:
	.loc 1 249 0
	ldr	r2, [r2, #4]
	sub	r0, r0, #32
.LVL36:
	lsl	r3, r3, r0
	mov	r0, r2
.LVL37:
	and	r0, r3
.L61:
	sub	r3, r0, #1
	sbc	r0, r0, r3
.LVL38:
	.loc 1 251 0
	@ sp needed
	bx	lr
.L63:
	.align	2
.L62:
	.word	-536813312
.LFE56:
	.size	chip_vector_enabled, .-chip_vector_enabled
	.section	.text.chip_vector_set,"ax",%progbits
	.align	1
	.global	chip_vector_set
	.code	16
	.thumb_func
	.type	chip_vector_set, %function
chip_vector_set:
.LFB57:
	.loc 1 254 0
.LVL39:
	push	{r3, lr}
.LCFI0:
	.loc 1 256 0
	cmp	r1, #0
	beq	.L65
	.loc 1 257 0
	bl	chip_vector_enable
.LVL40:
	b	.L66
.LVL41:
.L65:
	.loc 1 259 0
	bl	chip_vector_disable
.LVL42:
.L66:
	.loc 1 261 0
	@ sp needed
	pop	{r3, pc}
.LFE57:
	.size	chip_vector_set, .-chip_vector_set
	.section	.text.chip_delay,"ax",%progbits
	.align	1
	.global	chip_delay
	.code	16
	.thumb_func
	.type	chip_delay, %function
chip_delay:
.LFB58:
	.loc 1 265 0
.LVL43:
	.loc 1 268 0
	mov	r0, #0
.LVL44:
	@ sp needed
	bx	lr
.LFE58:
	.size	chip_delay, .-chip_delay
	.section	.text.chip_clock_freq,"ax",%progbits
	.align	1
	.global	chip_clock_freq
	.code	16
	.thumb_func
	.type	chip_clock_freq, %function
chip_clock_freq:
.LFB59:
	.loc 1 272 0
	push	{lr}
.LCFI1:
	sub	sp, sp, #36
.LCFI2:
	.loc 1 274 0
	add	r0, sp, #4
	bl	RCC_GetClocksFreq
.LVL45:
	.loc 1 276 0
	ldr	r0, [sp, #4]
	add	sp, sp, #36
	@ sp needed
	pop	{pc}
.LFE59:
	.size	chip_clock_freq, .-chip_clock_freq
	.global	__aeabi_uidiv
	.section	.text.chip_init,"ax",%progbits
	.align	1
	.global	chip_init
	.code	16
	.thumb_func
	.type	chip_init, %function
chip_init:
.LFB47:
	.loc 1 148 0
.LVL46:
	push	{r3, lr}
.LCFI3:
	.loc 1 150 0
	bl	chip_interrupts_disable
.LVL47:
.LBB12:
.LBB13:
	.loc 1 136 0
	bl	chip_clock_freq
.LVL48:
	mov	r1, #250
	lsl	r1, r1, #2
	bl	__aeabi_uidiv
.LVL49:
	.loc 1 137 0
	ldr	r3, .L70
.LBB14:
.LBB15:
	.file 2 "../../../chip/stm32/stm32f030/lib/CMSIS/Include/core_cm0.h"
	.loc 2 574 0
	ldr	r2, .L70+4
.LBE15:
.LBE14:
	.loc 1 137 0
	sub	r0, r0, #1
	str	r0, [r3, #4]
.LVL50:
.LBB17:
.LBB16:
	.loc 2 574 0
	ldr	r0, [r2, #32]
	mov	r1, #192
	lsl	r0, r0, #8
	lsr	r0, r0, #8
	lsl	r1, r1, #24
	orr	r1, r0
	str	r1, [r2, #32]
.LBE16:
.LBE17:
	.loc 1 139 0
	mov	r2, #0
	str	r2, [r3, #8]
	.loc 1 140 0
	mov	r2, #7
	str	r2, [r3]
.LBE13:
.LBE12:
	.loc 1 152 0
	@ sp needed
	pop	{r3, pc}
.L71:
	.align	2
.L70:
	.word	-536813552
	.word	-536810240
.LFE47:
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
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.align	2
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
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
	.4byte	.LCFI0-.LFB57
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE46:
.LSFDE48:
	.4byte	.LEFDE48-.LASFDE48
.LASFDE48:
	.4byte	.Lframe0
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.align	2
.LEFDE48:
.LSFDE50:
	.4byte	.LEFDE50-.LASFDE50
.LASFDE50:
	.4byte	.Lframe0
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.byte	0x4
	.4byte	.LCFI1-.LFB59
	.byte	0xe
	.uleb128 0x4
	.byte	0x8e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x28
	.align	2
.LEFDE50:
.LSFDE52:
	.4byte	.LEFDE52-.LASFDE52
.LASFDE52:
	.4byte	.Lframe0
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x4
	.4byte	.LCFI3-.LFB47
	.byte	0xe
	.uleb128 0x8
	.byte	0x83
	.uleb128 0x2
	.byte	0x8e
	.uleb128 0x1
	.align	2
.LEFDE52:
	.text
.Letext0:
	.file 3 "/usr/share/crossworks_for_arm_3.3/include/stdint.h"
	.file 4 "../../../chip/stm32/stm32f030/include/stm32f030f/chip/vectors.h"
	.file 5 "../../../chip/stm32/stm32f030/lib/CMSIS/ST/STM32F0xx/Include/stm32f0xx.h"
	.file 6 "../../../chip/stm32/stm32f030/lib/include/stm32f0xx_rcc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x96d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF143
	.byte	0x1
	.4byte	.LASF144
	.4byte	.LASF145
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x4
	.4byte	.LASF42
	.byte	0x3
	.byte	0x17
	.4byte	0x25
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
	.byte	0x4
	.byte	0x1a
	.4byte	0x146
	.uleb128 0x6
	.4byte	.LASF10
	.sleb128 0
	.uleb128 0x6
	.4byte	.LASF11
	.sleb128 1
	.uleb128 0x6
	.4byte	.LASF12
	.sleb128 2
	.uleb128 0x6
	.4byte	.LASF13
	.sleb128 3
	.uleb128 0x6
	.4byte	.LASF14
	.sleb128 4
	.uleb128 0x6
	.4byte	.LASF15
	.sleb128 5
	.uleb128 0x6
	.4byte	.LASF16
	.sleb128 6
	.uleb128 0x6
	.4byte	.LASF17
	.sleb128 7
	.uleb128 0x6
	.4byte	.LASF18
	.sleb128 8
	.uleb128 0x6
	.4byte	.LASF19
	.sleb128 9
	.uleb128 0x6
	.4byte	.LASF20
	.sleb128 10
	.uleb128 0x6
	.4byte	.LASF21
	.sleb128 11
	.uleb128 0x6
	.4byte	.LASF22
	.sleb128 12
	.uleb128 0x6
	.4byte	.LASF23
	.sleb128 13
	.uleb128 0x6
	.4byte	.LASF24
	.sleb128 14
	.uleb128 0x6
	.4byte	.LASF25
	.sleb128 15
	.uleb128 0x6
	.4byte	.LASF26
	.sleb128 16
	.uleb128 0x6
	.4byte	.LASF27
	.sleb128 17
	.uleb128 0x6
	.4byte	.LASF28
	.sleb128 18
	.uleb128 0x6
	.4byte	.LASF29
	.sleb128 19
	.uleb128 0x6
	.4byte	.LASF30
	.sleb128 20
	.uleb128 0x6
	.4byte	.LASF31
	.sleb128 21
	.uleb128 0x6
	.4byte	.LASF32
	.sleb128 22
	.uleb128 0x6
	.4byte	.LASF33
	.sleb128 23
	.uleb128 0x6
	.4byte	.LASF34
	.sleb128 24
	.uleb128 0x6
	.4byte	.LASF35
	.sleb128 25
	.uleb128 0x6
	.4byte	.LASF36
	.sleb128 26
	.uleb128 0x6
	.4byte	.LASF37
	.sleb128 27
	.uleb128 0x6
	.4byte	.LASF38
	.sleb128 28
	.uleb128 0x6
	.4byte	.LASF39
	.sleb128 29
	.uleb128 0x6
	.4byte	.LASF40
	.sleb128 30
	.uleb128 0x6
	.4byte	.LASF41
	.sleb128 31
	.byte	0
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x4
	.byte	0x3e
	.4byte	0x7d
	.uleb128 0x7
	.4byte	.LASF107
	.byte	0x1
	.byte	0x5
	.byte	0xaa
	.4byte	0x22a
	.uleb128 0x6
	.4byte	.LASF44
	.sleb128 -14
	.uleb128 0x6
	.4byte	.LASF45
	.sleb128 -13
	.uleb128 0x6
	.4byte	.LASF46
	.sleb128 -5
	.uleb128 0x6
	.4byte	.LASF47
	.sleb128 -2
	.uleb128 0x6
	.4byte	.LASF48
	.sleb128 -1
	.uleb128 0x6
	.4byte	.LASF49
	.sleb128 0
	.uleb128 0x6
	.4byte	.LASF50
	.sleb128 1
	.uleb128 0x6
	.4byte	.LASF51
	.sleb128 2
	.uleb128 0x6
	.4byte	.LASF52
	.sleb128 3
	.uleb128 0x6
	.4byte	.LASF53
	.sleb128 4
	.uleb128 0x6
	.4byte	.LASF54
	.sleb128 5
	.uleb128 0x6
	.4byte	.LASF55
	.sleb128 6
	.uleb128 0x6
	.4byte	.LASF56
	.sleb128 7
	.uleb128 0x6
	.4byte	.LASF57
	.sleb128 8
	.uleb128 0x6
	.4byte	.LASF58
	.sleb128 9
	.uleb128 0x6
	.4byte	.LASF59
	.sleb128 10
	.uleb128 0x6
	.4byte	.LASF60
	.sleb128 11
	.uleb128 0x6
	.4byte	.LASF61
	.sleb128 12
	.uleb128 0x6
	.4byte	.LASF62
	.sleb128 13
	.uleb128 0x6
	.4byte	.LASF63
	.sleb128 14
	.uleb128 0x6
	.4byte	.LASF64
	.sleb128 15
	.uleb128 0x6
	.4byte	.LASF65
	.sleb128 16
	.uleb128 0x6
	.4byte	.LASF66
	.sleb128 17
	.uleb128 0x6
	.4byte	.LASF67
	.sleb128 19
	.uleb128 0x6
	.4byte	.LASF68
	.sleb128 20
	.uleb128 0x6
	.4byte	.LASF69
	.sleb128 21
	.uleb128 0x6
	.4byte	.LASF70
	.sleb128 22
	.uleb128 0x6
	.4byte	.LASF71
	.sleb128 23
	.uleb128 0x6
	.4byte	.LASF72
	.sleb128 24
	.uleb128 0x6
	.4byte	.LASF73
	.sleb128 25
	.uleb128 0x6
	.4byte	.LASF74
	.sleb128 26
	.uleb128 0x6
	.4byte	.LASF75
	.sleb128 27
	.uleb128 0x6
	.4byte	.LASF76
	.sleb128 28
	.uleb128 0x6
	.4byte	.LASF77
	.sleb128 30
	.byte	0
	.uleb128 0x4
	.4byte	.LASF78
	.byte	0x5
	.byte	0xd1
	.4byte	0x151
	.uleb128 0x8
	.2byte	0x320
	.byte	0x2
	.2byte	0x10b
	.4byte	0x2c7
	.uleb128 0x9
	.4byte	.LASF79
	.byte	0x2
	.2byte	0x10d
	.4byte	0x2d7
	.byte	0
	.uleb128 0x9
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x10e
	.4byte	0x2dc
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x10f
	.4byte	0x2ec
	.byte	0x80
	.uleb128 0x9
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x110
	.4byte	0x2dc
	.byte	0x84
	.uleb128 0xa
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x111
	.4byte	0x2f1
	.2byte	0x100
	.uleb128 0xa
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x112
	.4byte	0x2dc
	.2byte	0x104
	.uleb128 0xa
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x113
	.4byte	0x2f6
	.2byte	0x180
	.uleb128 0xa
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x114
	.4byte	0x2dc
	.2byte	0x184
	.uleb128 0xa
	.4byte	.LASF87
	.byte	0x2
	.2byte	0x115
	.4byte	0x2fb
	.2byte	0x200
	.uleb128 0xb
	.ascii	"IP\000"
	.byte	0x2
	.2byte	0x116
	.4byte	0x31b
	.2byte	0x300
	.byte	0
	.uleb128 0xc
	.4byte	0x4f
	.4byte	0x2d7
	.uleb128 0xd
	.4byte	0x76
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0x2c7
	.uleb128 0xc
	.4byte	0x4f
	.4byte	0x2ec
	.uleb128 0xd
	.4byte	0x76
	.byte	0x1e
	.byte	0
	.uleb128 0xe
	.4byte	0x2c7
	.uleb128 0xe
	.4byte	0x2c7
	.uleb128 0xe
	.4byte	0x2c7
	.uleb128 0xc
	.4byte	0x4f
	.4byte	0x30b
	.uleb128 0xd
	.4byte	0x76
	.byte	0x3f
	.byte	0
	.uleb128 0xc
	.4byte	0x4f
	.4byte	0x31b
	.uleb128 0xd
	.4byte	0x76
	.byte	0x7
	.byte	0
	.uleb128 0xe
	.4byte	0x30b
	.uleb128 0xf
	.4byte	.LASF88
	.byte	0x2
	.2byte	0x117
	.4byte	0x235
	.uleb128 0x10
	.byte	0x28
	.byte	0x2
	.2byte	0x124
	.4byte	0x3ab
	.uleb128 0x9
	.4byte	.LASF89
	.byte	0x2
	.2byte	0x126
	.4byte	0x3ab
	.byte	0
	.uleb128 0x9
	.4byte	.LASF90
	.byte	0x2
	.2byte	0x127
	.4byte	0x3b0
	.byte	0x4
	.uleb128 0x9
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x128
	.4byte	0x4f
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x129
	.4byte	0x3b0
	.byte	0xc
	.uleb128 0x11
	.ascii	"SCR\000"
	.byte	0x2
	.2byte	0x12a
	.4byte	0x3b0
	.byte	0x10
	.uleb128 0x11
	.ascii	"CCR\000"
	.byte	0x2
	.2byte	0x12b
	.4byte	0x3b0
	.byte	0x14
	.uleb128 0x9
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x12c
	.4byte	0x4f
	.byte	0x18
	.uleb128 0x11
	.ascii	"SHP\000"
	.byte	0x2
	.2byte	0x12d
	.4byte	0x3c5
	.byte	0x1c
	.uleb128 0x9
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x12e
	.4byte	0x3b0
	.byte	0x24
	.byte	0
	.uleb128 0x12
	.4byte	0x3b0
	.uleb128 0xe
	.4byte	0x4f
	.uleb128 0xc
	.4byte	0x4f
	.4byte	0x3c5
	.uleb128 0xd
	.4byte	0x76
	.byte	0x1
	.byte	0
	.uleb128 0xe
	.4byte	0x3b5
	.uleb128 0xf
	.4byte	.LASF94
	.byte	0x2
	.2byte	0x12f
	.4byte	0x32c
	.uleb128 0x10
	.byte	0x10
	.byte	0x2
	.2byte	0x18d
	.4byte	0x414
	.uleb128 0x9
	.4byte	.LASF95
	.byte	0x2
	.2byte	0x18f
	.4byte	0x3b0
	.byte	0
	.uleb128 0x9
	.4byte	.LASF96
	.byte	0x2
	.2byte	0x190
	.4byte	0x3b0
	.byte	0x4
	.uleb128 0x11
	.ascii	"VAL\000"
	.byte	0x2
	.2byte	0x191
	.4byte	0x3b0
	.byte	0x8
	.uleb128 0x9
	.4byte	.LASF97
	.byte	0x2
	.2byte	0x192
	.4byte	0x3ab
	.byte	0xc
	.byte	0
	.uleb128 0xf
	.4byte	.LASF98
	.byte	0x2
	.2byte	0x193
	.4byte	0x3d6
	.uleb128 0x13
	.byte	0x1c
	.byte	0x6
	.byte	0x32
	.4byte	0x47d
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0x6
	.byte	0x34
	.4byte	0x4f
	.byte	0
	.uleb128 0x14
	.4byte	.LASF100
	.byte	0x6
	.byte	0x35
	.4byte	0x4f
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x6
	.byte	0x36
	.4byte	0x4f
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF102
	.byte	0x6
	.byte	0x37
	.4byte	0x4f
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF103
	.byte	0x6
	.byte	0x38
	.4byte	0x4f
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF104
	.byte	0x6
	.byte	0x39
	.4byte	0x4f
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF105
	.byte	0x6
	.byte	0x3a
	.4byte	0x4f
	.byte	0x18
	.byte	0
	.uleb128 0x4
	.4byte	.LASF106
	.byte	0x6
	.byte	0x3b
	.4byte	0x420
	.uleb128 0x15
	.4byte	.LASF146
	.byte	0x1
	.byte	0x7a
	.byte	0x1
	.uleb128 0x16
	.4byte	.LASF147
	.byte	0x2
	.2byte	0x23b
	.byte	0x3
	.4byte	0x4b6
	.uleb128 0x17
	.4byte	.LASF107
	.byte	0x2
	.2byte	0x23b
	.4byte	0x22a
	.uleb128 0x17
	.4byte	.LASF108
	.byte	0x2
	.2byte	0x23b
	.4byte	0x4f
	.byte	0
	.uleb128 0x18
	.4byte	.LASF148
	.byte	0x1
	.byte	0x19
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e6
	.uleb128 0x19
	.4byte	.LASF141
	.byte	0x1
	.byte	0x1c
	.4byte	0x48
	.4byte	0x4dc
	.uleb128 0x1a
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL0
	.4byte	0x947
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF109
	.byte	0x1
	.byte	0x20
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF110
	.byte	0x1
	.byte	0x24
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.4byte	.LASF114
	.byte	0x1
	.byte	0x28
	.4byte	0x6f
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x53e
	.uleb128 0x1e
	.ascii	"ram\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x48
	.4byte	.LLST0
	.uleb128 0x1f
	.4byte	.LASF111
	.byte	0x1
	.byte	0x28
	.4byte	0x48
	.uleb128 0x1
	.byte	0x51
	.byte	0
	.uleb128 0x20
	.4byte	.LASF124
	.byte	0x1
	.byte	0x30
	.4byte	0x48
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x21
	.4byte	.LASF112
	.byte	0x1
	.byte	0x38
	.4byte	0x48
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57b
	.uleb128 0x22
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0x48
	.4byte	.LLST1
	.byte	0
	.uleb128 0x21
	.4byte	.LASF113
	.byte	0x1
	.byte	0x43
	.4byte	0x48
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a3
	.uleb128 0x22
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x45
	.4byte	0x48
	.4byte	.LLST2
	.byte	0
	.uleb128 0x23
	.4byte	.LASF115
	.byte	0x1
	.byte	0x4d
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5c6
	.uleb128 0x1f
	.4byte	.LASF116
	.byte	0x1
	.byte	0x4d
	.4byte	0x48
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x21
	.4byte	.LASF117
	.byte	0x1
	.byte	0x59
	.4byte	0x6f
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5ee
	.uleb128 0x22
	.ascii	"rc\000"
	.byte	0x1
	.byte	0x5b
	.4byte	0x6f
	.4byte	.LLST3
	.byte	0
	.uleb128 0x24
	.4byte	.LASF120
	.byte	0x1
	.byte	0x63
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF118
	.byte	0x1
	.byte	0x68
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x624
	.uleb128 0x25
	.4byte	.LASF119
	.byte	0x1
	.byte	0x6a
	.4byte	0x48
	.4byte	.LLST4
	.byte	0
	.uleb128 0x24
	.4byte	.LASF121
	.byte	0x1
	.byte	0x76
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x26
	.4byte	0x488
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1c
	.4byte	.LASF122
	.byte	0x1
	.byte	0x7e
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.4byte	.LASF123
	.byte	0x1
	.byte	0x9a
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF125
	.byte	0x1
	.byte	0xa0
	.4byte	0x48
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF126
	.byte	0x1
	.byte	0xab
	.4byte	0x48
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x24
	.4byte	.LASF127
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x20
	.4byte	.LASF128
	.byte	0x1
	.byte	0xbb
	.4byte	0x4f
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF129
	.byte	0x1
	.byte	0xc5
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d9
	.uleb128 0x1f
	.4byte	.LASF116
	.byte	0x1
	.byte	0xc5
	.4byte	0x48
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x21
	.4byte	.LASF130
	.byte	0x1
	.byte	0xce
	.4byte	0x48
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x746
	.uleb128 0x27
	.4byte	.LASF119
	.byte	0x1
	.byte	0xce
	.4byte	0x4f
	.4byte	.LLST5
	.uleb128 0x22
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xd0
	.4byte	0x48
	.4byte	.LLST6
	.uleb128 0x28
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x72c
	.uleb128 0x22
	.ascii	"bit\000"
	.byte	0x1
	.byte	0xd3
	.4byte	0x4f
	.4byte	.LLST7
	.byte	0
	.uleb128 0x29
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.uleb128 0x22
	.ascii	"bit\000"
	.byte	0x1
	.byte	0xd9
	.4byte	0x4f
	.4byte	.LLST8
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF131
	.byte	0x1
	.byte	0xe1
	.4byte	0x48
	.4byte	.LFB55
	.4byte	.LFE55-.LFB55
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b3
	.uleb128 0x27
	.4byte	.LASF119
	.byte	0x1
	.byte	0xe1
	.4byte	0x4f
	.4byte	.LLST9
	.uleb128 0x22
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xe3
	.4byte	0x48
	.4byte	.LLST10
	.uleb128 0x28
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x799
	.uleb128 0x22
	.ascii	"bit\000"
	.byte	0x1
	.byte	0xe6
	.4byte	0x4f
	.4byte	.LLST11
	.byte	0
	.uleb128 0x29
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.uleb128 0x22
	.ascii	"bit\000"
	.byte	0x1
	.byte	0xec
	.4byte	0x4f
	.4byte	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF132
	.byte	0x1
	.byte	0xf3
	.4byte	0x48
	.4byte	.LFB56
	.4byte	.LFE56-.LFB56
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7e8
	.uleb128 0x27
	.4byte	.LASF119
	.byte	0x1
	.byte	0xf3
	.4byte	0x4f
	.4byte	.LLST13
	.uleb128 0x2a
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xf5
	.4byte	0x48
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x21
	.4byte	.LASF133
	.byte	0x1
	.byte	0xfd
	.4byte	0x48
	.4byte	.LFB57
	.4byte	.LFE57-.LFB57
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x84c
	.uleb128 0x27
	.4byte	.LASF119
	.byte	0x1
	.byte	0xfd
	.4byte	0x4f
	.4byte	.LLST14
	.uleb128 0x27
	.4byte	.LASF134
	.byte	0x1
	.byte	0xfd
	.4byte	0x48
	.4byte	.LLST15
	.uleb128 0x22
	.ascii	"rc\000"
	.byte	0x1
	.byte	0xff
	.4byte	0x48
	.4byte	.LLST16
	.uleb128 0x2b
	.4byte	.LVL40
	.4byte	0x6d9
	.4byte	0x842
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL42
	.4byte	0x746
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF135
	.byte	0x1
	.2byte	0x108
	.4byte	0x4f
	.4byte	.LFB58
	.4byte	.LFE58-.LFB58
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x877
	.uleb128 0x2e
	.4byte	.LASF136
	.byte	0x1
	.2byte	0x108
	.4byte	0x4f
	.4byte	.LLST17
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF137
	.byte	0x1
	.2byte	0x10f
	.4byte	0x4f
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8b1
	.uleb128 0x2f
	.4byte	.LASF138
	.byte	0x1
	.2byte	0x111
	.4byte	0x47d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x30
	.4byte	.LVL45
	.4byte	0x958
	.uleb128 0x2c
	.uleb128 0x1
	.byte	0x50
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x31
	.4byte	.LASF149
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.4byte	0x8c9
	.uleb128 0x32
	.4byte	.LASF150
	.byte	0x1
	.byte	0x88
	.4byte	0x4f
	.byte	0
	.uleb128 0x33
	.4byte	.LASF139
	.byte	0x1
	.byte	0x93
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x947
	.uleb128 0x27
	.4byte	.LASF140
	.byte	0x1
	.byte	0x93
	.4byte	0x48
	.4byte	.LLST18
	.uleb128 0x34
	.4byte	0x8b1
	.4byte	.LBB12
	.4byte	.LBE12-.LBB12
	.byte	0x1
	.byte	0x97
	.4byte	0x93d
	.uleb128 0x29
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.uleb128 0x35
	.4byte	0x8bd
	.4byte	.LLST19
	.uleb128 0x36
	.4byte	0x490
	.4byte	.LBB14
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x8a
	.4byte	0x932
	.uleb128 0x37
	.4byte	0x49d
	.sleb128 -1
	.uleb128 0x38
	.4byte	0x4a9
	.byte	0x3
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL48
	.4byte	0x877
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	.LVL47
	.4byte	0x666
	.byte	0
	.uleb128 0x19
	.4byte	.LASF141
	.byte	0x1
	.byte	0x1c
	.4byte	0x48
	.4byte	0x958
	.uleb128 0x1a
	.byte	0
	.uleb128 0x39
	.4byte	.LASF142
	.byte	0x6
	.2byte	0x1e7
	.4byte	0x96a
	.uleb128 0x3a
	.4byte	0x96a
	.byte	0
	.uleb128 0x3b
	.byte	0x4
	.4byte	0x47d
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
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
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
	.uleb128 0x8
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0xb
	.uleb128 0x20
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
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x2117
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x25
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x27
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
	.uleb128 0x2b
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
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
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x36
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x39
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL2
	.4byte	.LFE35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0xa
	.byte	0x70
	.sleb128 0
	.byte	0x32
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0xa
	.byte	0x70
	.sleb128 0
	.byte	0x32
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x9
	.byte	0x70
	.sleb128 0
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x7
	.byte	0x72
	.sleb128 0
	.byte	0xa
	.2byte	0x1ff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x3
	.byte	0x70
	.sleb128 32
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LFE54
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL13
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL17
	.4byte	.LVL21
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LFE54
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL14
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL22
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL27
	.4byte	.LVL29
	.2byte	0x3
	.byte	0x70
	.sleb128 32
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LFE55
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL22
	.4byte	.LVL25
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL26
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL32
	.4byte	.LFE55
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL23
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL28
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x3
	.byte	0x70
	.sleb128 32
	.byte	0x9f
	.4byte	.LVL37
	.4byte	.LFE56
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL39
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL40-1
	.4byte	.LVL41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	.LVL41
	.4byte	.LVL42-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42-1
	.4byte	.LFE57
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL39
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL40-1
	.4byte	.LVL41
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	.LVL41
	.4byte	.LVL42-1
	.2byte	0x1
	.byte	0x51
	.4byte	.LVL42-1
	.4byte	.LFE57
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL40
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL42
	.4byte	.LFE57
	.2byte	0x1
	.byte	0x50
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL44
	.4byte	.LFE58
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL46
	.4byte	.LVL47-1
	.2byte	0x1
	.byte	0x50
	.4byte	.LVL47-1
	.4byte	.LFE47
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x50
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL48
	.4byte	.LVL49-1
	.2byte	0xd
	.byte	0x70
	.sleb128 0
	.byte	0xf7
	.uleb128 0x25
	.byte	0xa
	.2byte	0x3e8
	.byte	0xf7
	.uleb128 0x25
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0xec
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
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
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
	.4byte	.LFB59
	.4byte	.LFE59-.LFB59
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	0
	.4byte	0
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
	.4byte	.LFB59
	.4byte	.LFE59
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF37:
	.ascii	"Vector_USART1\000"
.LASF38:
	.ascii	"Vector_USART2\000"
.LASF125:
	.ascii	"chip_interrupts_disable\000"
.LASF104:
	.ascii	"I2C1CLK_Frequency\000"
.LASF143:
	.ascii	"GNU C 4.8.4 20140725 (release) [ARM/embedded-4_8-br"
	.ascii	"anch revision 213147] -fmessage-length=0 -mtp=soft "
	.ascii	"-mcpu=cortex-m0 -mlittle-endian -mfloat-abi=soft -m"
	.ascii	"thumb -fmerge-all-constants -g2 -std=gnu99 -Os -fno"
	.ascii	"-dwarf2-cfi-asm -fno-builtin -ffunction-sections -f"
	.ascii	"data-sections -fshort-double -fshort-enums -fno-com"
	.ascii	"mon\000"
.LASF56:
	.ascii	"EXTI4_15_IRQn\000"
.LASF55:
	.ascii	"EXTI2_3_IRQn\000"
.LASF112:
	.ascii	"chip_systick_irq_enable\000"
.LASF46:
	.ascii	"SVC_IRQn\000"
.LASF147:
	.ascii	"NVIC_SetPriority\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF96:
	.ascii	"LOAD\000"
.LASF69:
	.ascii	"TIM16_IRQn\000"
.LASF132:
	.ascii	"chip_vector_enabled\000"
.LASF52:
	.ascii	"FLASH_IRQn\000"
.LASF140:
	.ascii	"systick_hz\000"
.LASF145:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works\000"
.LASF97:
	.ascii	"CALIB\000"
.LASF106:
	.ascii	"RCC_ClocksTypeDef\000"
.LASF54:
	.ascii	"EXTI0_1_IRQn\000"
.LASF21:
	.ascii	"Vector_DMA_CH4_5\000"
.LASF149:
	.ascii	"initSysTick\000"
.LASF71:
	.ascii	"I2C1_IRQn\000"
.LASF47:
	.ascii	"PendSV_IRQn\000"
.LASF101:
	.ascii	"PCLK_Frequency\000"
.LASF53:
	.ascii	"RCC_IRQn\000"
.LASF131:
	.ascii	"chip_vector_disable\000"
.LASF117:
	.ascii	"chip_systick_count_bit\000"
.LASF42:
	.ascii	"uint32_t\000"
.LASF133:
	.ascii	"chip_vector_set\000"
.LASF17:
	.ascii	"Vector_EXTI4_15\000"
.LASF144:
	.ascii	"/home/mike/Documents/caribou-rtos/branches/0.9/cari"
	.ascii	"bou/target/board/generic_stm32f030f4_enc28j60/cross"
	.ascii	"works/../../../chip/stm32/stm32f030/src/chip.c\000"
.LASF136:
	.ascii	"count\000"
.LASF82:
	.ascii	"RSERVED1\000"
.LASF73:
	.ascii	"SPI1_IRQn\000"
.LASF123:
	.ascii	"chip_interrupts_enable\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"Vector_Reserved1\000"
.LASF39:
	.ascii	"Vector_Reserved2\000"
.LASF119:
	.ascii	"vector\000"
.LASF110:
	.ascii	"_nmi\000"
.LASF41:
	.ascii	"Vector_SoftSysTick\000"
.LASF142:
	.ascii	"RCC_GetClocksFreq\000"
.LASF99:
	.ascii	"SYSCLK_Frequency\000"
.LASF102:
	.ascii	"ADCCLK_Frequency\000"
.LASF116:
	.ascii	"enable\000"
.LASF141:
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
.LASF122:
	.ascii	"chip_idle\000"
.LASF148:
	.ascii	"nvic_isr\000"
.LASF100:
	.ascii	"HCLK_Frequency\000"
.LASF113:
	.ascii	"chip_systick_irq_disable\000"
.LASF150:
	.ascii	"ticks\000"
.LASF135:
	.ascii	"chip_delay\000"
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
.LASF146:
	.ascii	"chip_reset_watchdog\000"
.LASF68:
	.ascii	"TIM15_IRQn\000"
.LASF129:
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
.LASF124:
	.ascii	"chip_systick_irq_state\000"
.LASF23:
	.ascii	"Vector_TIM1_BRK_UP_TRG_COM\000"
.LASF137:
	.ascii	"chip_clock_freq\000"
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
.LASF139:
	.ascii	"chip_init\000"
.LASF98:
	.ascii	"SysTick_Type\000"
.LASF138:
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
.LASF3:
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
.LASF127:
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
.LASF134:
	.ascii	"state\000"
.LASF15:
	.ascii	"Vector_EXTI0_1\000"
.LASF48:
	.ascii	"SysTick_IRQn\000"
.LASF120:
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
.LASF128:
	.ascii	"chip_interrupt_level\000"
.LASF22:
	.ascii	"Vector_ADC_COMP\000"
.LASF59:
	.ascii	"DMA1_Channel2_3_IRQn\000"
.LASF66:
	.ascii	"TIM6_DAC_IRQn\000"
.LASF13:
	.ascii	"Vector_FLASH\000"
.LASF2:
	.ascii	"unsigned char\000"
.LASF130:
	.ascii	"chip_vector_enable\000"
.LASF81:
	.ascii	"ICER\000"
.LASF40:
	.ascii	"Vector_CEC\000"
.LASF74:
	.ascii	"SPI2_IRQn\000"
.LASF118:
	.ascii	"chip_systick_enter\000"
.LASF109:
	.ascii	"_swi\000"
.LASF27:
	.ascii	"Vector_TIM6_DAC\000"
.LASF1:
	.ascii	"signed char\000"
.LASF4:
	.ascii	"short unsigned int\000"
.LASF126:
	.ascii	"chip_interrupts_enabled\000"
.LASF121:
	.ascii	"chip_systick_exit\000"
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
.LASF95:
	.ascii	"CTRL\000"
	.ident	"GCC: (GNU) 4.8.4 20140725 (release) [ARM/embedded-4_8-branch revision 213147]"
