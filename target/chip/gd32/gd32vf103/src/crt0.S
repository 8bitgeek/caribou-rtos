#include "riscv_encoding.h"

		.extern	early_init          // first initialization     
		.extern	caribou_heap_ini    // second initialization    
		.extern	late_init		    // third initialization     
		.extern main			    // main program entry point 

		.extern _isr

		.global exit
		.global _exit
		.global _fault
		.global _halt
		.global _hard_fault
		.global _mpu_fault
		.global _bus_fault
		.global _usage_fault

        .global __main_stack_base__
        .global __main_stack_size__
        .global __main_stack_end__
        .global __process_stack_base__
        .global __process_stack_size__
        .global __process_stack_end__

		.global __bss_start__
		.global __bss_end__

		.global __heap_base__
		.global __heap_end__

		.global __init_array_start
		.global __init_array_end
		.global __fini_array_start
		.global __fini_array_end

        .global eclic_msip_handler
        .global eclic_mtip_handler
        .global chip_int_handler
        .global bss_init
        .global board_init
        .global board_timer_init
        .global main

        // 'reset handler' function to initialize core CPU registers.

        .global reset_handler
        .type   reset_handler,@function

reset_handler:

        // Disable interrupts until they are needed.
        csrc    CSR_MSTATUS, MSTATUS_MIE

        // Move from 0x00000000 to 0x08000000 address space if necessary.
        la      a0, in_address_space
        li      a1, 1
        slli    a1, a1, 27
        bleu    a1, a0, in_address_space
        add     a0, a0, a1
        jr      a0

in_address_space:

        // Load the initial stack pointer value.
        la      sp, _sp

        // Set the vector table's base address.
        la      a0, vtable
        csrw    CSR_MTVT, a0

        // Set non-vectored interrupts to use the default handler.
        la      a0, chip_int_handler
        csrw    CSR_MTVEC, a0

        // Initialize RAM sections
        call    bss_init

        // Initialize the timer
        call    board_timer_init
        
        // Initialize the board
        call    board_init
 
        // Call 'main(0,0)' (.data/.bss sections initialized there)
        li      a0, 0
        li      a1, 0
        call    main
        j       reset_handler





    // A 'default' interrupt handler, in case an interrupt triggers
    // without a handler being defined.
    .section .text.chip_int_handler,"ax",%progbits

chip_int_handler:
 
default_interrupt_loop:
        j       default_interrupt_loop








reset_handler:
		cpsid	i					// disable interrupts
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
