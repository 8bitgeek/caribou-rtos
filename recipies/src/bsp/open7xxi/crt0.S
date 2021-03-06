/******************************************************************************
******************************************************************************/
   		.syntax unified
		.section .init, "ax"

		.extern	early_init		// first initialization
		.extern	caribou_heap_init		// second initialization
		.extern	late_init		// third initialization
		.extern main			// main program entry point

		.extern _isr

		.global	exit
		.global	_exit
		.global _panic
		.global _fault
		.global _halt
		.global _hard_fault
		.global _mpu_fault
		.global _bus_fault
		.global _usage_fault

        .global	__main_stack_base__
        .global	__main_stack_size__
        .global __main_stack_end__
        .global	__process_stack_base__
        .global	__process_stack_size__
        .global	__process_stack_end__

		.global	__bss_start__
		.global	__bss_end__

		.global	__heap_base__
		.global	__heap_end__

		.global	__init_array_start
		.global	__init_array_end
		.global	__fini_array_start
		.global	__fini_array_end

		.global reset_handler
		.type	reset_handler, %function
		.code   16
        .align 	2
		.thumb_func
reset_handler:
		cpsid	i					// disable interrupts
		
		ldr	r0, =__main_stack_end__
		mov	sp, r0

		ldr		r0,=__process_stack_end__
		msr		psp,r0
		movs	r0,#0x02		// PSP stack, unprivilaged can run in thread mode.
		msr		control,r0
		isb

		// Set up process stack
		ldr 	r0, =__process_stack_base__
		ldr 	r1, =__process_stack_end__
		movs	r2, #0xFA
		bl 		memory_set

		// Initialize stack
		ldr 	r0, =__main_stack_base__
		ldr 	r1, =__main_stack_end__
		movs	r2, #0xFA
		bl 		memory_set
		
		// enable fpu begin 
		ldr.w	r0, =0xE000ED88
		ldr		r1,[r0]
		orr		r1,#(0xF << 20)
		str		r1,[r0]
		// enable fpu end 

		// Data initialization.
		// NOTE: It assumes that the DATA size is a multiple of 4.
        ldr     r0, =_textdata
        ldr     r1, =_data
        ldr     r2, =_edata
        bl		memory_copy

		// Zero the bss.
		ldr 	r0, =__bss_start__
		ldr 	r1, =__bss_end__
		movs	r2, #0
		bl 		memory_set

		// Early init
		ldr		r2, =early_init
		blx		r2

		// initialize the heap
		ldr 	r0, =__heap_base__
		ldr		r1, =__heap_end__
		ldr		r2, =caribou_heap_init
		blx		r2

		// Call constructors
		ldr 	r0, =__init_array_start
		ldr 	r1, =__init_array_end

		// HACK work around libg++ inserting reference to crtbegin.o first in list (skip it)
		adds 	r0, #4					

ctor_loop:
		cmp		r0, r1
		beq 	ctor_end
		ldr 	r2, [r0]
		adds 	r0, #4
		push 	{r0-r1}
		blx 	r2
		pop 	{r0-r1}
		b 		ctor_loop
ctor_end:

start:
		// Jump to application entry point
		ldr		r2, =late_init
		blx		r2
		movs	r0, #0
		movs 	r1, #0
		mov 	lr, r0
		mov 	r12, sp
		ldr 	r2, =main
		blx 	r2

		// Call destructors
		ldr 	r0, =__fini_array_start
		ldr 	r1, =__fini_array_end
dtor_loop:
		cmp		 r0, r1
		beq 	dtor_end
		ldr 	r2, [r0]
		adds 	r0, #4
		push 	{r0-r1}
		blx 	r2
		pop 	{r0-r1}
		b 		dtor_loop
dtor_end:

		// Returned from application entry point, loop forever.
exit:
_exit:	b 		reset_handler


_halt:	b		_halt

_hard_fault:
		b		_fault
_mpu_fault:
		b		_fault
_bus_fault:
		b		_fault
_usage_fault:
		b		_fault

		// src = r0
		// dest = r1
		// end = r2
memory_copy:
		cmp 	r0, r1
		beq 	2f
		subs 	r2, r2, r1
		beq 	2f
1:
		ldrb 	r3, [r0]
		adds 	r0, r0, #1
		strb 	r3, [r1]
		adds 	r1, r1, #1
		subs 	r2, r2, #1
		bne 	1b
2:
		bx 		lr

memory_set:
		cmp		r0, r1
		beq 	1f
		strb 	r2, [r0]
		adds 	r0, r0, #1
		b 		memory_set
1:
		bx lr

		.end
