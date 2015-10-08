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

void isr_wdg(InterruptVector vector)
{
	WWDG_SetCounter(0x7F);
}

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

