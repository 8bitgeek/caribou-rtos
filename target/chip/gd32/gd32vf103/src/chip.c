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

static bool eclic_interrupt_enabled (uint32_t source);

#define DELAY_CAL_FACTOR ( 100 )		/* FIXME - run-time calibrate this */

#define isr_enter()					    \
	__asm (								\
        "   addi    sp,sp,-128      \n"     /* allocate space for 32 registers on the stack */      \
        "   csrw    mscratch,x5     \n"     /* preserve x5 in the scratch registers */              \
        "   csrr    x5,mepc         \n"     /* fetch the return PC */                               \
        "   sw      x5,124(sp)      \n"     /* store the return PC */                               \
        "   csrr    x5,mscratch     \n"     /* retrieve x5 from the scratch register */             \
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
        "   lw      x5,124(sp)      \n"     /* retrieve return PC from the stack */             \
        "   csrw    mepc,x5         \n"     /* store the return PC in the mepc register */      \
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
 * ELIC Interrupt vector
 */
void __attribute__((naked)) __attribute__((aligned (64))) chip_int_handler(void)
{
	isr_enter();
    cpu_reg_t csr_mcause = read_csr(mcause);
    int is_int = (csr_mcause>>31);
    if ( is_int )
    {
	    caribou_interrupt_service(csr_mcause&0x3f);
    }
    else
    {
        _fault();
    }
    isr_exit();
}

__attribute__((weak)) void _swi()
{
}

__attribute__((weak)) void _nmi()
{
    _fault();
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

void chip_reset_watchdog()
{
}

void chip_idle()
{
	caribou_thread_wfi();
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
    /* suspend watchdogs when debug is halted */
    DBG_CTL |= DBG_FWDGT_HOLD;     
	DBG_CTL |= DBG_WWDGT_HOLD;

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

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc = eclic_interrupt_enabled(vector);
    if ( !rc )
    {
        // Set 'vector mode' so the interrupt uses the vector table.
        // eclic_set_vmode( vector );
        // Enable the timer interrupt (#7) with low priority and 'level'.
        eclic_set_level_trig( vector );
        eclic_enable_interrupt( vector );
        eclic_set_irq_lvl_abs( vector, 3 );
        eclic_set_irq_priority( vector, 3 );
    }
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc = eclic_interrupt_enabled(vector);
    if ( rc )
	{
        eclic_disable_interrupt(vector);
    }
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
