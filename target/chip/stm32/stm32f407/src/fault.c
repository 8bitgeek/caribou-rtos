/******************************************************************************
* Copyright © 2005-2013 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#include <caribou/lib/fault.h>
#include <chip/chip.h>
#include <caribou/lib/stdio.h>
#include <caribou/lib/heap.h>

typedef struct
{
	volatile unsigned long stacked_r0 ;
	volatile unsigned long stacked_r1 ;
	volatile unsigned long stacked_r2 ;
	volatile unsigned long stacked_r3 ;
	volatile unsigned long stacked_r12 ;
	volatile unsigned long stacked_lr ;
	volatile unsigned long stacked_pc ;
	volatile unsigned long stacked_psr ;
	volatile unsigned long _CFSR ;
	volatile unsigned long _HFSR ;
	volatile unsigned long _DFSR ;
	volatile unsigned long _AFSR ;
	volatile unsigned long _BFAR ;
	volatile unsigned long _MMAR ;

} fault_state_t;

volatile fault_state_t fault_state;

/**
 * fault:
 * This is called from the _fault() entry point with a pointer to the Fault stack
 * as the parameter. We can then read the values from the stack and place them
 * into local variables for ease of reading.
 * We then read the various Fault Status and Address Registers to help decode
 * cause of the fault.
 * The function ends with a BKPT instruction to force control back into the debugger
 */
extern void fault(unsigned long *hardfault_args)
{
        fault_state.stacked_r0 = ((unsigned long)hardfault_args[0]) ;
        fault_state.stacked_r1 = ((unsigned long)hardfault_args[1]) ;
        fault_state.stacked_r2 = ((unsigned long)hardfault_args[2]) ;
        fault_state.stacked_r3 = ((unsigned long)hardfault_args[3]) ;
        fault_state.stacked_r12 = ((unsigned long)hardfault_args[4]) ;
        fault_state.stacked_lr = ((unsigned long)hardfault_args[5]) ;
        fault_state.stacked_pc = ((unsigned long)hardfault_args[6]) ;
        fault_state.stacked_psr = ((unsigned long)hardfault_args[7]) ;

        // Configurable Fault Status Register
        // Consists of MMSR, BFSR and UFSR
        fault_state._CFSR = (*((volatile unsigned long *)(0xE000ED28))) ;

        // Hard Fault Status Register
        fault_state._HFSR = (*((volatile unsigned long *)(0xE000ED2C))) ;

        // Debug Fault Status Register
        fault_state._DFSR = (*((volatile unsigned long *)(0xE000ED30))) ;

        // Auxiliary Fault Status Register
        fault_state._AFSR = (*((volatile unsigned long *)(0xE000ED3C))) ;

        // Read the Fault Address Registers. These may not contain valid values.
        // Check BFARVALID/MMARVALID to see if they are valid values
        // MemManage Fault Address Register
        fault_state._MMAR = (*((volatile unsigned long *)(0xE000ED34))) ;
        // Bus Fault Address Register
        fault_state._BFAR = (*((volatile unsigned long *)(0xE000ED38))) ;

		/* FIXME - make a fault-capable printf(...) function that polls the UART (no interrupts) */

		__asm (												\
		"	ldr		r0,=__process_stack_end__			\n" \
		"	msr		msp,r0								\n"	\
		);
				
		printf( "**** PANIC ****\n" );
		printf( "free: %d\t aloc: %d\n", heap_bytes_free(), heap_bytes_used() );
		printf( "  sp: %08x\n", hardfault_args );
		printf( "  r0: %08x\t r1: %08x\t r2: %08x\t r3: %08x\n", fault_state.stacked_r0, fault_state.stacked_r1, fault_state.stacked_r2, fault_state.stacked_r3 );
		printf( " r12: %08x\t lr: %08x\t pc: %08x\tpsr: %08x\n", fault_state.stacked_r12, fault_state.stacked_lr, fault_state.stacked_pc, fault_state.stacked_psr );
		printf( "CFSR: %08x\tHFSR: %08x\tDFSR: %08x\tAFSR: %08x\n", fault_state._CFSR, fault_state._HFSR, fault_state._DFSR, fault_state._AFSR );
		printf( "MMAR: %08x\tBFAR: %08x\n", fault_state._MMAR, fault_state._BFAR );

		// Usage Faults
		uint32_t UFSR = fault_state._CFSR>>16;
		uint32_t BFSR = (fault_state._CFSR>>8)&0xFF;
		if ( UFSR )
		{
			printf( "UFSR: ");
			if ( UFSR & 0x0001)	printf( "UNDEFINSTR " );
			if ( UFSR & 0x0002)	printf( "INVSTATE " );
			if ( UFSR & 0x0004)	printf( "INVPC " );
			if ( UFSR & 0x0008)	printf( "NOCP " );
			if ( UFSR & 0x0100)	printf( "UNALIGNED " );
			if ( UFSR & 0x0200)	printf( "DIVBYZERO " );
			printf("\n");
		}

		if ( BFSR )
		{
			printf( "BFSR: ");
			if ( BFSR & 0x01)	printf( "IBUSERR " );
			if ( BFSR & 0x02)	printf( "PRECISERR " );
			if ( BFSR & 0x04)	printf( "IMPRECISERR " );
			if ( BFSR & 0x08)	printf( "UNSTKERR " );
			if ( BFSR & 0x10)	printf( "STKERR " );
			if ( BFSR & 0x80)	printf( "BFARVALID " );
			printf("\n");
		}

		if ( fault_state._HFSR )
		{
			printf( "HFSR: ");
			if ( fault_state._HFSR & 0x00000001) printf( "RESERVED " );
			if ( fault_state._HFSR & 0x00000002) printf( "VECTTBL " );
			if ( fault_state._HFSR & 0x40000000) printf( "FORCED " );
			if ( fault_state._HFSR & 0x80000000) printf( "DEBUGEVT " );
			printf("\n");
		}

        __asm("	bkpt #0\n") ; // Break into the debugger
}

/**
 * _fault:
 * Hard Fault handler to help debug the reason for a fault.
 * To use, edit the vector table to reference this function in the HardFault vector
 * This code is suitable for Cortex-M3 and Cortex-M0 cores
 */

extern __attribute__((naked)) void _fault(void)
{
	/*
	 * Get the appropriate stack pointer, depending on our mode,
	 * and use it as the parameter to the C handler. This function
	 * will never return
	 */

	__asm(  ".syntax unified\n"
					" movs   r0, #4  \n"
					" mov    r1, lr  \n"
					" tst    r0, r1  \n"
					" beq    _msp    \n"
					" mrs    r0, psp \n"
					" b      fault   \n"
			"_msp:  \n"
					" mrs    r0, msp \n"
					" b      fault   \n"
					" b      _fault	 \n"
			".syntax divided\n") ;
}

