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
#include <chip/chip.h>

//*****************************************************************************
//
// An array that maps the crystal number in RCC to a frequency.
//
//*****************************************************************************
static const unsigned long g_pulXtals[] =
{
    1000000,
    1843200,
    2000000,
    2457600,
    3579545,
    3686400,
    4000000,
    4096000,
    4915200,
    5000000,
    5120000,
    6000000,
    6144000,
    7372800,
    8000000,
    8192000,
    10000000,
    12000000,
    12288000,
    13560000,
    14318180,
    16000000,
    16384000
};

#define isr_enter()					\
	__asm (	"	push	{lr}			\n" \
			"	push	{r4-r7}			\n"	\
			"	push	{r8-r11}		\n"	)

#define isr_exit()					\
	__asm (	"	pop		{r8-r11}		\n"	\
			"	pop		{r4-r7}			\n"	\
			"	pop		{pc}			\n"	)

__attribute__((weak)) void assert_param(int n)		
{
	while(!n);
}

/**
** Get here from the interrupt vector. Query the NVIC to get the active vector,
** and then dispatch it.
*/
void __attribute__((naked)) nvic_isr()
{
	isr_enter();
	caribou_interrupt_service((InterruptVector)(HWREG(NVIC_INT_CTRL) & NVIC_INT_CTRL_VEC_ACT_M));
	isr_exit();
}

__attribute__((weak)) void _swi()
{
}

__attribute__((weak)) void _nmi()
{
}

void __attribute__((naked)) chip_interrupts_enable(void)
{
	__asm(" cpsie   i\n"
          " bx      lr\n");
}

int __attribute__((naked)) chip_interrupts_disable(void)
{
    __asm(" mrs 	r0, primask\n"
		  "	eor 	r0,r0,#1\n"
		  " cpsid   i\n"
          " bx      lr\n");
}

int	__attribute__((naked)) chip_interrupts_enabled(void)
{
    __asm(" mrs 	r0, primask\n"
		  "	eor 	r0,r0,#1\n"
		  " bx  	lr\n");
}

void __attribute__((naked)) chip_wfi(void)
{
	__asm(" wfi\n bx lr\n");
}

// return the current interrupt level from the IPSR register
uint32_t __attribute__((naked)) chip_interrupt_level(void)
{
    __asm(" mrs 	r0, psr\n"
		  "	and 	r0,r0,#0x3F\n"
		  " bx  	lr\n");
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

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc = chip_vector_enabled(vector);
	switch(vector)
	{
		case 4: // Vector_MPU_Fault
			HWREG(NVIC_SYS_HND_CTRL) |= NVIC_SYS_HND_CTRL_MEM;
			break;
		case 5: // Vector_Bus_Fault:
			HWREG(NVIC_SYS_HND_CTRL) |= NVIC_SYS_HND_CTRL_BUS;
			break;
		case 6: // Vector_Usage_Fault
			HWREG(NVIC_SYS_HND_CTRL) |= NVIC_SYS_HND_CTRL_USAGE;
			break;
		case 15: // Vector_SysTick
			HWREG(NVIC_ST_CTRL) |= NVIC_ST_CTRL_INTEN;
			break;
		default:
			if(((int)vector >= 16) && ((int)vector <= 47))		/* Enable the general interrupt. */
				HWREG(NVIC_EN0) = 1 << ((int)vector - 16);
			else if((int)vector >= 48)
				HWREG(NVIC_EN1) = 1 << ((int)vector - 48);
			break;
	}
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc = chip_vector_enabled(vector);
	/** Determine the interrupt to disable. */
	switch(vector)
	{
		case 4: // Vector_MPU_Fault
			HWREG(NVIC_SYS_HND_CTRL) &= ~(NVIC_SYS_HND_CTRL_MEM);
			break;
		case 5: // Vector_Bus_Fault
			HWREG(NVIC_SYS_HND_CTRL) &= ~(NVIC_SYS_HND_CTRL_BUS);
			break;
		case 6: // Vector_Usage_Fault
			HWREG(NVIC_SYS_HND_CTRL) &= ~(NVIC_SYS_HND_CTRL_USAGE);
			break;
		case 15: // Vector_SysTick
			HWREG(NVIC_ST_CTRL) &= ~(NVIC_ST_CTRL_INTEN);
			break;
		default:
			if(((int)vector >= 16) && ((int)vector <= 47))			/* Disable the general interrupt. */
				HWREG(NVIC_DIS0) = 1 << ((int)vector - 16);
			else if((int)vector >= 48)
				HWREG(NVIC_DIS1) = 1 << ((int)vector - 48);
			break;
	}
	return rc;
}

int chip_vector_enabled(uint32_t vector)
{
	int rc;
	if(((int)vector >= 16) && ((int)vector <= 47))			/* Disable the general interrupt. */
		rc = HWREG(NVIC_EN0) & (1 << ((int)vector - 16));
	else if((int)vector >= 48)
		rc = HWREG(NVIC_EN1) & (1 << ((int)vector - 48));
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

extern int chip_vector_pending(uint32_t vector)
{
	int rc;
	if(((int)vector >= 16) && ((int)vector <= 47))
		rc = HWREG(NVIC_PEND0) & (1 << ((int)vector - 16));
	else if((int)vector >= 48)
		rc = HWREG(NVIC_PEND1) & (1 << ((int)vector - 48));
	return rc;
}

extern int chip_vector_pend(uint32_t vector)
{
	int rc = chip_vector_pending(vector);
	if(((int)vector >= 16) && ((int)vector <= 47))
		HWREG(NVIC_PEND0) = 1 << ((int)vector - 16);
	else if((int)vector >= 48)
		HWREG(NVIC_PEND1) = 1 << ((int)vector - 48);
	return rc;
}

extern int chip_vector_unpend(uint32_t vector)
{
	int rc = chip_vector_pending(vector);
	if(((int)vector >= 16) && ((int)vector <= 47))
		HWREG(NVIC_UNPEND0) = 1 << ((int)vector - 16);
	else if((int)vector >= 48)
		HWREG(NVIC_UNPEND1) = 1 << ((int)vector - 48);
	return rc;
}

/***
** FIXME - these SysTick related functions should be common to all Cortex-M
** and should be moved to a common (cpu) source file.
*/

// enable the SysTick IRQ
int chip_systick_irq_enable(void)
{
	int rc = chip_systick_irq_state();
	HWREG(NVIC_ST_CTRL) |= NVIC_ST_CTRL_INTEN;
	return rc;
}

// disable the SysTick IRQ
int chip_systick_irq_disable(void)
{
	int rc = chip_systick_irq_state();
	HWREG(NVIC_ST_CTRL) &= ~NVIC_ST_CTRL_INTEN;
	return rc;
}

// set the SysTick IRQ enablement state
void chip_systick_irq_set(int enable)
{
	if (enable)
		HWREG(NVIC_ST_CTRL) |= NVIC_ST_CTRL_INTEN;
	else
		HWREG(NVIC_ST_CTRL) &= ~NVIC_ST_CTRL_INTEN;
}

// return the SysTick IRQ state
int chip_systick_irq_state(void)
{
	return (HWREG(NVIC_ST_CTRL) & NVIC_ST_CTRL_INTEN) ? 1 : 0;
}

// force systic IRQ
void chip_systick_irq_force(void)
{
	HWREG(NVIC_INT_CTRL) |= NVIC_INT_CTRL_PEND_SV;
}

// a brief delay
uint32_t chip_delay(uint32_t count)
{
	while(count) --count;
	return count; /* needed for optimizer */
}

// return the clock frequency
uint32_t chip_clock_freq(void)
{
	return SysCtlClockGet();
}

static void systick_init()
{
	uint32_t period = chip_clock_freq()/(1000/JIFFIES);
	HWREG(NVIC_ST_CTRL) &= ~NVIC_ST_CTRL_INTEN;							/* disable NVIC interrupt */
	HWREG(NVIC_ST_RELOAD) = period - 1;
	HWREG(NVIC_ST_CTRL) |= NVIC_ST_CTRL_CLK_SRC | NVIC_ST_CTRL_ENABLE;	/* enable Cortex SysTick. */
	HWREG(NVIC_ST_CTRL) |= NVIC_ST_CTRL_INTEN;
	chip_delay(32);
}

/*
* 50 MHz Clock
* Set the clocking to run directly from the PLL at 50 MHz.
* The following code:
* -sets the system clock divider to 4 (200 MHz PLL divide by 4 = 50 MHz)
* -sets the system clock to use the PLL
* -uses the main oscillator
* -configures for use of 8 MHz crystal/oscillator input
*/
void chip_init(int systick_hz)
{
	systick_init();
}

void chip_init_watchdog()
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_WDOG0);

	HWREG(WATCHDOG0_BASE + WDT_O_LOCK) = WDT_LOCK_UNLOCK;
	HWREG(WATCHDOG0_BASE + WDT_O_LOAD) = 0xFFFFFFFF;
	HWREG(WATCHDOG0_BASE + WDT_O_CTL) = (HWREG(WATCHDOG0_BASE + WDT_O_CTL) & ~WDT_CTL_INTTYPE) | WATCHDOG_INT_TYPE_INT;
	HWREG(WATCHDOG0_BASE + WDT_O_CTL) |= WDT_CTL_RESEN;
	HWREG(WATCHDOG0_BASE + WDT_O_CTL) |= WDT_CTL_INTEN;
    HWREG(WATCHDOG0_BASE + WDT_O_LOCK) = WDT_LOCK_LOCKED;
}

void chip_reset_watchdog()
{
	HWREG(WATCHDOG0_BASE + WDT_O_LOCK) = WDT_LOCK_UNLOCK;
	HWREG(WATCHDOG0_BASE + WDT_O_LOAD) = 0xFFFFFFFF;
    HWREG(WATCHDOG0_BASE + WDT_O_LOCK) = WDT_LOCK_LOCKED;
}

void chip_idle()
{
	/** FIXME */
	//chip_reset_watchdog();
}

void chip_reset()
{
	HWREG(NVIC_APINT) = NVIC_APINT_VECTKEY | NVIC_APINT_SYSRESETREQ;
	// The device should have reset, 
	// Just in case, loop until watchdog reset.
	chip_interrupts_disable();
	for(;;);
}


