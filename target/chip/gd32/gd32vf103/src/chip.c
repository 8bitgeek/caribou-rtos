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
#include <caribou/kernel/interrupt.h>
#include <cpu/cpu.h>
#include <chip/chip.h>
#include <gd32vf103.h>
#include <gd32vf103_rcu.h>
#include <gd32vf103_eclic.h>
#include <gd32vf103_fmc.h>
#include <riscv_encoding.h>

#include <n200_eclic.h>
#include <xprintf.h>

static void __attribute__((naked)) caribou_isr_n(int n);
static bool eclic_interrupt_enabled (uint32_t source);

#define DELAY_CAL_FACTOR ( 100 )		/* FIXME - run-time calibrate this */

#define isr_enter()					    \
	__asm (								\
        "   addi    sp,sp,-128      \n" \
        "   csrw    mscratch,x5     \n" \
        "   csrr    x5,mepc         \n" \
        "   sw      x5,124(sp)      \n" \
        "   csrr    x5,mscratch     \n" \
        "   sw      x1,120(sp)      \n" \
        "   sw      x2,116(sp)      \n" \
        "   sw      x3,112(sp)      \n" \
        "   sw      x4,108(sp)      \n" \
        "   sw      x5,104(sp)      \n" \
        "   sw      x6,100(sp)      \n" \
        "   sw      x7,96(sp)       \n" \
        "   sw      x8,92(sp)       \n" \
        "   sw      x9,88(sp)       \n" \
        "   sw      x10,84(sp)      \n" \
        "   sw      x11,80(sp)      \n" \
        "   sw      x12,76(sp)      \n" \
        "   sw      x13,72(sp)      \n" \
        "   sw      x14,68(sp)      \n" \
        "   sw      x15,64(sp)      \n" \
        "   sw      x16,60(sp)      \n" \
        "   sw      x17,56(sp)      \n" \
        "   sw      x18,52(sp)      \n" \
        "   sw      x19,48(sp)      \n" \
        "   sw      x20,44(sp)      \n" \
        "   sw      x21,40(sp)      \n" \
        "   sw      x22,36(sp)      \n" \
        "   sw      x23,32(sp)      \n" \
        "   sw      x24,28(sp)      \n" \
        "   sw      x25,24(sp)      \n" \
        "   sw      x26,20(sp)      \n" \
        "   sw      x27,16(sp)      \n" \
        "   sw      x28,12(sp)      \n" \
        "   sw      x29,8(sp)       \n" \
        "   sw      x30,4(sp)       \n" \
        "   sw      x31,0(sp)       \n" \
		);

#define isr_exit()					    \
	__asm (								\
        "   lw      x5,124(sp)      \n" \
        "   csrw    mepc,x5         \n" \
        "   lw      x1,120(sp)      \n" \
        "   lw      x2,116(sp)      \n" \
        "   lw      x3,112(sp)      \n" \
        "   lw      x4,108(sp)      \n" \
        "   lw      x5,104(sp)      \n" \
        "   lw      x6,100(sp)      \n" \
        "   lw      x7,96(sp)       \n" \
        "   lw      x8,92(sp)       \n" \
        "   lw      x9,88(sp)       \n" \
        "   lw      x10,84(sp)      \n" \
        "   lw      x11,80(sp)      \n" \
        "   lw      x12,76(sp)      \n" \
        "   lw      x13,72(sp)      \n" \
        "   lw      x14,68(sp)      \n" \
        "   lw      x15,64(sp)      \n" \
        "   lw      x16,60(sp)      \n" \
        "   lw      x17,56(sp)      \n" \
        "   lw      x18,52(sp)      \n" \
        "   lw      x19,48(sp)      \n" \
        "   lw      x20,44(sp)      \n" \
        "   lw      x21,40(sp)      \n" \
        "   lw      x22,36(sp)      \n" \
        "   lw      x23,32(sp)      \n" \
        "   lw      x24,28(sp)      \n" \
        "   lw      x25,24(sp)      \n" \
        "   lw      x26,20(sp)      \n" \
        "   lw      x27,16(sp)      \n" \
        "   lw      x28,12(sp)      \n" \
        "   lw      x29,8(sp)       \n" \
        "   lw      x30,4(sp)       \n" \
        "   lw      x31,0(sp)       \n" \
        "   addi    sp,sp,128       \n" \
        "   mret                    \n" \
 		)

#if defined USE_FULL_ASSERT
	void assert_failed(uint8_t* file, uint32_t line)
	{
		while(1);
	}
#endif

#if !defined(assert_param)
__attribute__((weak)) void assert_param(int n)		
{
	while(!n);
}
#endif

/**
 * @brief Interrupt vector table.
 */
void __attribute__((naked)) caribou_isr_19() { __asm( " li a0,19\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_20() { __asm( " li a0,20\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_21() { __asm( " li a0,21\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_22() { __asm( " li a0,22\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_23() { __asm( " li a0,23\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_24() { __asm( " li a0,24\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_25() { __asm( " li a0,25\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_26() { __asm( " li a0,26\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_27() { __asm( " li a0,27\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_28() { __asm( " li a0,28\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_29() { __asm( " li a0,29\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_30() { __asm( " li a0,30\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_31() { __asm( " li a0,31\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_32() { __asm( " li a0,32\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_33() { __asm( " li a0,33\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_34() { __asm( " li a0,34\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_35() { __asm( " li a0,35\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_36() { __asm( " li a0,36\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_37() { __asm( " li a0,37\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_38() { __asm( " li a0,38\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_39() { __asm( " li a0,39\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_40() { __asm( " li a0,40\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_41() { __asm( " li a0,41\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_42() { __asm( " li a0,42\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_43() { __asm( " li a0,43\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_44() { __asm( " li a0,44\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_45() { __asm( " li a0,45\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_46() { __asm( " li a0,46\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_47() { __asm( " li a0,47\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_48() { __asm( " li a0,48\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_49() { __asm( " li a0,49\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_50() { __asm( " li a0,50\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_51() { __asm( " li a0,51\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_52() { __asm( " li a0,52\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_53() { __asm( " li a0,53\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_54() { __asm( " li a0,54\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_55() { __asm( " li a0,55\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_56() { __asm( " li a0,56\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_57() { __asm( " li a0,57\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_58() { __asm( " li a0,58\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_59() { __asm( " li a0,59\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_60() { __asm( " li a0,60\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_61() { __asm( " li a0,61\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_62() { __asm( " li a0,62\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_63() { __asm( " li a0,63\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_64() { __asm( " li a0,64\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_65() { __asm( " li a0,65\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_66() { __asm( " li a0,66\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_67() { __asm( " li a0,67\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_68() { __asm( " li a0,68\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_69() { __asm( " li a0,69\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_70() { __asm( " li a0,70\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_71() { __asm( " li a0,71\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_72() { __asm( " li a0,72\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_73() { __asm( " li a0,73\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_74() { __asm( " li a0,74\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_75() { __asm( " li a0,75\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_76() { __asm( " li a0,76\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_77() { __asm( " li a0,77\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_78() { __asm( " li a0,78\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_79() { __asm( " li a0,79\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_80() { __asm( " li a0,80\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_81() { __asm( " li a0,81\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_82() { __asm( " li a0,82\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_83() { __asm( " li a0,83\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_84() { __asm( " li a0,84\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_85() { __asm( " li a0,85\n j caribou_isr_n\n "); }
void __attribute__((naked)) caribou_isr_86() { __asm( " li a0,86\n j caribou_isr_n\n "); }

static void __attribute__((naked)) caribou_isr_n(int n)
{
	isr_enter();
	caribou_interrupt_service(n);
	isr_exit();
}

__attribute__((weak)) void _swi()
{
}

__attribute__((weak)) void _nmi()
{
}

static bool eclic_interrupt_enabled (uint32_t source) 
{
    return *(volatile uint8_t*)(ECLIC_ADDR_BASE+ECLIC_INT_IE_OFFSET+source*4) == 1;
}

/**
* @brief Is the systick IRQ enabled?
*/
int chip_systick_irq_state(void)
{
	return eclic_interrupt_enabled(CLIC_INT_TMR);
}

/**
* @brief Enable the systick IRQ
*/
int chip_systick_irq_enable(void)
{
	int rc = eclic_interrupt_enabled(CLIC_INT_TMR);
	eclic_enable_interrupt(CLIC_INT_TMR);
	return rc;
}

/**
* @brief Disbale the systick IRQ
* @return the previous state.
*/
int chip_systick_irq_disable(void)
{
	int rc = eclic_interrupt_enabled(CLIC_INT_TMR);
	eclic_disable_interrupt(CLIC_INT_TMR);
	return rc;
}

/**
* @brief Set the systick IRQ state.
*/
void chip_systick_irq_set(int enable)
{
	if (enable)
		eclic_enable_interrupt(CLIC_INT_TMR);
	else
		eclic_disable_interrupt(CLIC_INT_TMR);;
}

/**
* @brief pend a service request
*/
void chip_pend_svc_req(void)
{
	cpu_yield();
}

void chip_reset_watchdog()
{
}

void chip_idle()
{
	//caribou_thread_wfi();
	caribou_thread_yield();    
}

/**
** @brief Initialize the PLL
*/
static void init_pll()
{
    SystemInit();
    SystemCoreClockUpdate();
}

/**
** @brief Initialize the system TImer (Systick)
*/
static void init_core_timer()
{
    // Disable interrupts globally.
    int int_state = cpu_int_disable();

    // Add flash wait states
    fmc_wscnt_set(WS_WSCNT_2);

    // Set up the global timer to generate an interrupt every ms.
    // Initialize the 'ECLIC' interrupt controller.
    eclic_init( ECLIC_NUM_INTERRUPTS );
    eclic_mode_enable();

    // Set 'vector mode' so the timer interrupt uses the vector table.
    eclic_set_vmode( CLIC_INT_TMR );
    // Enable the timer interrupt (#7) with low priority and 'level'.
    eclic_enable_interrupt( CLIC_INT_TMR );
    eclic_set_irq_lvl_abs( CLIC_INT_TMR, 1 );
    eclic_set_irq_priority( CLIC_INT_TMR, 1 );
    // Set the timer's comparison value to (frequency / 1000).
    *( volatile uint64_t * )( TIMER_CTRL_ADDR + TIMER_MTIMECMP ) = ( TIMER_FREQ / 1000 );
    // Reset the timer value to zero.
    *( volatile uint64_t * )( TIMER_CTRL_ADDR + TIMER_MTIME ) = 0;

    // Set 'vector mode' so the timer interrupt uses the vector table.
    eclic_set_vmode( CLIC_INT_SFT );
    // Enable the soft interrupt (#3) with low priority and 'level'.
    eclic_enable_interrupt( CLIC_INT_SFT );
    eclic_set_irq_lvl_abs( CLIC_INT_SFT, 2 );
    eclic_set_irq_priority( CLIC_INT_SFT, 2 );

    // Restore interrupt state
    cpu_int_set(int_state);
}

/**
** @brief Initialize the watchdog timer.
*/
static void init_wd_timer()
{
	//WWDG_SetPrescaler(WWDG_Prescaler_8);
	//WWDG_SetWindowValue(0x40);
	//WWDG_Enable(0x7F);
}

/*
*/
void chip_init(int systick_hz)
{
	/** Interrupts are now disabled... */
	chip_interrupts_disable();

	/** initialize system */
	init_pll();
	init_core_timer();
	init_wd_timer();

    eclic_priority_group_set(ECLIC_PRIGROUP_LEVEL3_PRIO1);

    // eclic_dump();
}

void chip_wfi(void)
{
    __asm volatile ("wfi");
}

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc = eclic_interrupt_enabled(vector);
    // Set 'vector mode' so the interrupt uses the vector table.
    eclic_set_vmode( vector );
    // Enable the timer interrupt (#7) with low priority and 'level'.
    eclic_enable_interrupt( vector );
    eclic_set_irq_lvl_abs( vector, 3 );
    eclic_set_irq_priority( vector, 3 );
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc = eclic_interrupt_enabled(vector);
	eclic_disable_interrupt(vector);
	return rc;
}

int chip_vector_enabled(uint32_t vector)
{
	return eclic_interrupt_enabled(vector);
}

int chip_vector_set(uint32_t vector, int state)
{
	int rc;
	if ( state )
		rc = chip_vector_enable( vector );
	else
		rc = chip_vector_disable( vector );
	return rc;
}

// return the clock frequency
uint32_t chip_clock_freq(void)
{
	return SystemCoreClock;
}

void chip_reset()
{
	eclic_system_reset();
}

void chip_usec_delay(uint32_t usecs)
{
	while(usecs--)
	{
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
		__asm(" nop\n");		
		__asm(" nop\n");
		__asm(" nop\n");
	}
}
