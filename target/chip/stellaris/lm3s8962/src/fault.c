/***************************************************************************
 *   Copyright © 2005-2012 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software: you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation, either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 **************************************************************************/
#include <board.h>
#include <caribou/lib/fault.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/heap.h>

typedef struct
{
	unsigned long stacked_r0 ;
	unsigned long stacked_r1 ;
	unsigned long stacked_r2 ;
	unsigned long stacked_r3 ;
	unsigned long stacked_r12 ;
	unsigned long stacked_lr ;
	unsigned long stacked_pc ;
	unsigned long stacked_psr ;
	unsigned long _CFSR ;
	unsigned long _HFSR ;
	unsigned long _DFSR ;
	unsigned long _AFSR ;
	unsigned long _BFAR ;
	unsigned long _MMAR ;
} proc_state_t;

static volatile proc_state_t proc_state;

/**
 * hard_fault_handler_c:
 * This is called from the hard_fault_handler() entry point with a pointer to the Fault stack
 * as the parameter. We can then read the values from the stack and place them
 * into local variables for ease of reading.
 * We then read the various Fault Status and Address Registers to help decode
 * cause of the fault.
 * The function ends with a BKPT instruction to force control back into the debugger
 */
void _panic(unsigned long *hardfault_args)
{
        proc_state.stacked_r0	= ((unsigned long)hardfault_args[0]) ;
        proc_state.stacked_r1	= ((unsigned long)hardfault_args[1]) ;
        proc_state.stacked_r2	= ((unsigned long)hardfault_args[2]) ;
        proc_state.stacked_r3	= ((unsigned long)hardfault_args[3]) ;
        proc_state.stacked_r12	= ((unsigned long)hardfault_args[4]) ;
        proc_state.stacked_lr	= ((unsigned long)hardfault_args[5]) ;
        proc_state.stacked_pc	= ((unsigned long)hardfault_args[6]) ;
        proc_state.stacked_psr	= ((unsigned long)hardfault_args[7]) ;

        // Configurable Fault Status Register
        // Consists of MMSR, BFSR and UFSR
        proc_state._CFSR = *((volatile unsigned long *)0xE000ED28) ;

        // Hard Fault Status Register
        proc_state._HFSR = *((volatile unsigned long *)0xE000ED2C) ;

        // Debug Fault Status Register
        proc_state._DFSR = *((volatile unsigned long *)0xE000ED30) ;

        // Auxiliary Fault Status Register
        proc_state._AFSR = *((volatile unsigned long *)0xE000ED3C) ;

        // Read the Fault Address Registers. These may not contain valid values.
        // Check BFARVALID/MMARVALID to see if they are valid values
        // MemManage Fault Address Register
        proc_state._MMAR = *((volatile unsigned long *)0xE000ED34) ;
        // Bus Fault Address Register
        proc_state._BFAR = *((volatile unsigned long *)0xE000ED38) ;

		__asm (												\
		"	ldr		r0,=__process_stack_end__			\n" \
		"	msr		msp,r0								\n"	\
		);

		debug_printf( "**** PANIC ****\n" );
		debug_printf( "free: %d\t aloc: %d\n", heap_bytes_free(), heap_bytes_used() );
		debug_printf( "  sp: %08x\n", hardfault_args );
		debug_printf( "  r0: %08x\t r1: %08x\t r2: %08x\t r3: %08x\n", proc_state.stacked_r0, proc_state.stacked_r1, proc_state.stacked_r2, proc_state.stacked_r3 );
		debug_printf( " r12: %08x\t lr: %08x\t pc: %08x\tpsr: %08x\n", proc_state.stacked_r12, proc_state.stacked_lr, proc_state.stacked_pc, proc_state.stacked_psr );
		debug_printf( "CFSR: %08x\tHFSR: %08x\tDFSR: %08x\tAFSR: %08x\n", proc_state._CFSR, proc_state._HFSR, proc_state._DFSR, proc_state._AFSR );
		debug_printf( "MMAR: %08x\tBFAR: %08x\n", proc_state._MMAR, proc_state._BFAR );

		// Usage Faults
		uint32_t UFSR = proc_state._CFSR>>16;
		uint32_t BFSR = (proc_state._CFSR>>8)&0xFF;
		if ( UFSR )
		{
			debug_printf( "UFSR: ");
			if ( UFSR & 0x0001)	debug_printf( "UNDEFINSTR " );
			if ( UFSR & 0x0002)	debug_printf( "INVSTATE " );
			if ( UFSR & 0x0004)	debug_printf( "INVPC " );
			if ( UFSR & 0x0008)	debug_printf( "NOCP " );
			if ( UFSR & 0x0100)	debug_printf( "UNALIGNED " );
			if ( UFSR & 0x0200)	debug_printf( "DIVBYZERO " );
			debug_printf("\n");
		}

		if ( BFSR )
		{
			debug_printf( "BFSR: ");
			if ( BFSR & 0x01)	debug_printf( "IBUSERR " );
			if ( BFSR & 0x02)	debug_printf( "PRECISERR " );
			if ( BFSR & 0x04)	debug_printf( "IMPRECISERR " );
			if ( BFSR & 0x08)	debug_printf( "UNSTKERR " );
			if ( BFSR & 0x10)	debug_printf( "STKERR " );
			if ( BFSR & 0x80)	debug_printf( "BFARVALID " );
			debug_printf("\n");
		}

		if ( proc_state._HFSR )
		{
			debug_printf( "HFSR: ");
			if ( proc_state._HFSR & 0x00000001) debug_printf( "RESERVED " );
			if ( proc_state._HFSR & 0x00000002) debug_printf( "VECTTBL " );
			if ( proc_state._HFSR & 0x40000000) debug_printf( "FORCED " );
			if ( proc_state._HFSR & 0x80000000) debug_printf( "DEBUGEVT " );
			debug_printf("\n");
		}

		caribou_thread_dump();

        __asm("BKPT #0\n") ; // Break into the debugger

}

__attribute__((naked)) void _hard_fault(void)
{
#if !defined(DEBUG)
	chip_reset();
#else

 	__asm volatile
		(
			" tst	lr, #4                                              \n"
			" ite	eq                                                  \n"
			" mrseq	r0, msp                                             \n"
			" mrsne	r0, psp                                             \n"
			" ldr	r1, [r0, #24]                                       \n"
			" ldr	r2, handler2_address_const                          \n"
			" bx	r2                                                  \n"
			" handler2_address_const: .word _panic   					\n"
		);
#endif
}

