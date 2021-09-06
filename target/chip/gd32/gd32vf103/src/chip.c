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
#include <chip/chip.h>
#include <gd32vf103.h>
#include <gd32vf103_rcu.h>

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
void __attribute__((naked)) caribou_isr_19() { caribou_isr_n(19); }
void __attribute__((naked)) caribou_isr_20() { caribou_isr_n(20); }
void __attribute__((naked)) caribou_isr_21() { caribou_isr_n(21); }
void __attribute__((naked)) caribou_isr_22() { caribou_isr_n(22); }
void __attribute__((naked)) caribou_isr_23() { caribou_isr_n(23); }
void __attribute__((naked)) caribou_isr_24() { caribou_isr_n(24); }
void __attribute__((naked)) caribou_isr_25() { caribou_isr_n(25); }
void __attribute__((naked)) caribou_isr_26() { caribou_isr_n(26); }
void __attribute__((naked)) caribou_isr_27() { caribou_isr_n(27); }
void __attribute__((naked)) caribou_isr_28() { caribou_isr_n(28); }
void __attribute__((naked)) caribou_isr_29() { caribou_isr_n(29); }
void __attribute__((naked)) caribou_isr_30() { caribou_isr_n(30); }
void __attribute__((naked)) caribou_isr_31() { caribou_isr_n(31); }
void __attribute__((naked)) caribou_isr_32() { caribou_isr_n(32); }
void __attribute__((naked)) caribou_isr_33() { caribou_isr_n(33); }
void __attribute__((naked)) caribou_isr_34() { caribou_isr_n(34); }
void __attribute__((naked)) caribou_isr_35() { caribou_isr_n(35); }
void __attribute__((naked)) caribou_isr_36() { caribou_isr_n(36); }
void __attribute__((naked)) caribou_isr_37() { caribou_isr_n(37); }
void __attribute__((naked)) caribou_isr_38() { caribou_isr_n(38); }
void __attribute__((naked)) caribou_isr_39() { caribou_isr_n(39); }
void __attribute__((naked)) caribou_isr_40() { caribou_isr_n(40); }
void __attribute__((naked)) caribou_isr_41() { caribou_isr_n(41); }
void __attribute__((naked)) caribou_isr_42() { caribou_isr_n(42); }
void __attribute__((naked)) caribou_isr_43() { caribou_isr_n(43); }
void __attribute__((naked)) caribou_isr_44() { caribou_isr_n(44); }
void __attribute__((naked)) caribou_isr_45() { caribou_isr_n(45); }
void __attribute__((naked)) caribou_isr_46() { caribou_isr_n(46); }
void __attribute__((naked)) caribou_isr_47() { caribou_isr_n(47); }
void __attribute__((naked)) caribou_isr_48() { caribou_isr_n(48); }
void __attribute__((naked)) caribou_isr_49() { caribou_isr_n(49); }
void __attribute__((naked)) caribou_isr_50() { caribou_isr_n(50); }
void __attribute__((naked)) caribou_isr_51() { caribou_isr_n(51); }
void __attribute__((naked)) caribou_isr_52() { caribou_isr_n(52); }
void __attribute__((naked)) caribou_isr_53() { caribou_isr_n(53); }
void __attribute__((naked)) caribou_isr_54() { caribou_isr_n(54); }
void __attribute__((naked)) caribou_isr_55() { caribou_isr_n(55); }
void __attribute__((naked)) caribou_isr_56() { caribou_isr_n(56); }
void __attribute__((naked)) caribou_isr_57() { caribou_isr_n(57); }
void __attribute__((naked)) caribou_isr_58() { caribou_isr_n(58); }
void __attribute__((naked)) caribou_isr_59() { caribou_isr_n(59); }
void __attribute__((naked)) caribou_isr_60() { caribou_isr_n(60); }
void __attribute__((naked)) caribou_isr_61() { caribou_isr_n(61); }
void __attribute__((naked)) caribou_isr_62() { caribou_isr_n(62); }
void __attribute__((naked)) caribou_isr_63() { caribou_isr_n(63); }
void __attribute__((naked)) caribou_isr_64() { caribou_isr_n(64); }
void __attribute__((naked)) caribou_isr_65() { caribou_isr_n(65); }
void __attribute__((naked)) caribou_isr_66() { caribou_isr_n(66); }
void __attribute__((naked)) caribou_isr_67() { caribou_isr_n(67); }
void __attribute__((naked)) caribou_isr_68() { caribou_isr_n(68); }
void __attribute__((naked)) caribou_isr_69() { caribou_isr_n(69); }
void __attribute__((naked)) caribou_isr_70() { caribou_isr_n(70); }
void __attribute__((naked)) caribou_isr_71() { caribou_isr_n(71); }
void __attribute__((naked)) caribou_isr_72() { caribou_isr_n(72); }
void __attribute__((naked)) caribou_isr_73() { caribou_isr_n(73); }
void __attribute__((naked)) caribou_isr_74() { caribou_isr_n(74); }
void __attribute__((naked)) caribou_isr_75() { caribou_isr_n(75); }
void __attribute__((naked)) caribou_isr_76() { caribou_isr_n(76); }
void __attribute__((naked)) caribou_isr_77() { caribou_isr_n(77); }
void __attribute__((naked)) caribou_isr_78() { caribou_isr_n(78); }
void __attribute__((naked)) caribou_isr_79() { caribou_isr_n(79); }
void __attribute__((naked)) caribou_isr_80() { caribou_isr_n(80); }
void __attribute__((naked)) caribou_isr_81() { caribou_isr_n(81); }
void __attribute__((naked)) caribou_isr_82() { caribou_isr_n(82); }
void __attribute__((naked)) caribou_isr_83() { caribou_isr_n(83); }
void __attribute__((naked)) caribou_isr_84() { caribou_isr_n(84); }
void __attribute__((naked)) caribou_isr_85() { caribou_isr_n(85); }
void __attribute__((naked)) caribou_isr_86() { caribou_isr_n(86); }

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
* @brief Force a systick timeout, such that systick will go negative in order to
* provide a means of detecting that it was a forced systick() call, i.e. thread yield() or so.
*/
void chip_systick_irq_assert(void)
{
	SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
}

void chip_reset_watchdog()
{
}

void chip_idle()
{
	chip_reset_watchdog();
}

/**
** @brief Initialize the PLL
*/
static void initPLL()
{
	/* SystemInit(); */ /* early_init() should do this */
}

/**
** @brief Initialize the system TImer (Systick)
*/
static void initSysTick()
{
	uint32_t ticks = chip_clock_freq() / 1000;				/* number of ticks between interrupts */
	SysTick->LOAD  = (ticks & SysTick_LOAD_RELOAD_Msk) - 1;		/* set reload register */
	NVIC_SetPriority (SysTick_IRQn, (1<<__NVIC_PRIO_BITS) - 1);	/* set Priority for Cortex-M0 System Interrupts */
	SysTick->VAL   = 0;											/* Load the SysTick Counter Value */
	SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
					SysTick_CTRL_TICKINT_Msk   |
					SysTick_CTRL_ENABLE_Msk;					/* Enable SysTick IRQ and SysTick Timer */
}

/**
** @brief Initialize the watchdog timer.
*/
static void initializeWWDG()
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
	initPLL();
	initSysTick();
	initializeWWDG();
}

void __attribute__((naked)) chip_interrupts_enable(void)
{
	__asm(" cpsie   i\n"
		  " bx		lr\n");
}

int __attribute__((naked)) chip_interrupts_disable(void)
{
	__asm(" mrs	r0, primask\n"
		  "	eor	r0,r0,#1\n"
		  " cpsid	 i\n"
		  " bx		lr\n");
}

int	__attribute__((naked)) chip_interrupts_enabled(void)
{
	__asm(" mrs	r0, primask\n"
		  "	eor	r0,r0,#1\n"
		  " bx		lr\n");
}
// return the current interrupt level from the IPSR register
uint32_t __attribute__((naked)) chip_interrupt_level(void)
{
	__asm(" mrs	r0, psr\n"
		  "	and	r0,r0,#0x3F\n"
		  " bx		lr\n");
}

void __attribute__((naked)) chip_interrupts_set(int enable)
{
	__asm("		cmp		r0, #0			\n"
		  "		beq		1f				\n"
		  "		cpsie   i				\n"
		  "		b		2f				\n"
		  "1:							\n"
		  "		cpsid   i				\n"
		  "2:							\n"
		  "		bx		lr				\n");
}

void __attribute__((naked)) chip_wfi(void)
{
	__asm(" wfi\n bx lr\n");
}

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc=0;
	if ( vector < 32 )
	{
		uint32_t bit = (1 << (uint32_t)vector);
		rc = (NVIC->ISER[0] & bit) ? 1 : 0;
		NVIC->ISER[0] = bit;
	}
	else
	{
		uint32_t bit = (1 << (uint32_t)(vector-32));
		rc = (NVIC->ISER[1] & bit) ? 1 : 0;
		NVIC->ISER[1] = bit;
	}
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc=0;
	if ( vector < 32 )
	{
		uint32_t bit = (1 << (uint32_t)vector);
		rc = (NVIC->ISER[0] & bit) ? 1 : 0;
		NVIC->ICER[0] = bit;
	}
	else
	{
		uint32_t bit = (1 << (uint32_t)(vector-32));
		rc = (NVIC->ISER[1] & bit) ? 1 : 0;
		NVIC->ICER[1] = bit;
	}
	return rc;
}

int chip_vector_enabled(uint32_t vector)
{
	int rc;
	if ( vector < 32 )
		rc = (NVIC->ISER[0] & (1 << (uint32_t)vector)) ? 1 : 0;
	else
		rc = (NVIC->ISER[1] & (1 << (uint32_t)(vector-32))) ? 1 : 0;
	return rc;
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
	/** FIXME */
	for(;;);
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
