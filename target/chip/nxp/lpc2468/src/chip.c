/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS.
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
#include <chip/lpc2468.h>
#include <chip/stack.h>
#include <caribou/kernel/thread.h>

#define TM_PRE 9000000
#define MR_1KHZ	1000*(TM_PRE/1000000)		/* Match Register 1KHz */

#if defined(CARIBOU_TIMER0MR0)
	/* TIMER0 MR0 */
	#if !defined(Vector_TIMERx)
		#define Vector_TIMERx	Vector_TIMER0
	#endif
	#define	TxMRx			T0MR0						/* Match Register */
	#define TxTC			T0TC						/* Count Register */
	#define	TxPR			T0PR						/* Prescale Register */
	#define TxTCR			T0TCR						/* Timer Control Register */
	#define TxTCR_Counter_Reset		T0TCR_Counter_Reset
	#define	TxTCR_Counter_Enable	T0TCR_Counter_Enable
	#define	TxCCR			T0CCR						/* Capture Control Register */
	#define	TxMCR			T0MCR						/* Match Control Register */
	#define	TxMCR_MRxI		T0MCR_MR0I					/* Match Register Interrupt */
	#define	TxMCR_MRxR		T0MCR_MR0R					/* Match Register Interrupt */
	#define	TxMCR_MRxS		T0MCR_MR0S					/* Match Register Interrupt */
	#define TxIR			T0IR						/* Interrupt Register */
	#define TxIR_MRx		T0IR_MR0					/* Match Register Interruopr */
#elif defined(CARIBOU_TIMER1MR1)
	/* TIMER1 MR1 */
	#if !defined(Vector_TIMERx)
		#define Vector_TIMERx	Vector_TIMER1
	#endif
	#define	TxMRx			T1MR1						/* Match Register */
	#define TxTC			T1TC						/* Count Register */
	#define	TxPR			T1PR						/* Prescale Register */
	#define TxTCR			T1TCR						/* Timer Control Register */
	#define TxTCR_Counter_Reset		T1TCR_Counter_Reset
	#define	TxTCR_Counter_Enable	T1TCR_Counter_Enable
	#define	TxCCR			T1CCR						/* Capture Control Register */
	#define	TxMCR			T1MCR						/* Match Control Register */
	#define	TxMCR_MRxI		T1MCR_MR1I					/* Match Register Interrupt */
	#define	TxMCR_MRxR		T1MCR_MR1R					/* Match Register Interrupt */
	#define	TxMCR_MRxS		T1MCR_MR1S					/* Match Register Interrupt */
	#define TxIR			T1IR						/* Interrupt Register */
	#define TxIR_MRx		T1IR_MR1					/* Match Register Interruopr */
#else
	#error CARIBOU_TIMERxMRy not defined
#endif

extern _configure();						/* configure the PLL clock */

#define	MODE_USR			0x10			/* User Mode */
#define	MODE_FIQ			0x11			/* FIQ Mode */
#define	MODE_IRQ			0x12			/* IRQ Mode */
#define	MODE_SVC			0x13			/* Supervisor Mode */
#define	MODE_ABT			0x17			/* Abort Mode */
#define	MODE_UND			0x1B			/* Undefined Mode */
#define	MODE_SYS			0x1F			/* System Mode */

#define	I_BIT				0x80			/* when I bit is set, IRQ is disabled */
#define	F_BIT				0x40			/* when F bit is set, FIQ is disabled */

#define MAX_IRQ	32

extern uint64_t _caribou_jiffies;


__attribute__((weak)) void swi()
{
}

/**
* @brief Hook that gets called upon systick entry.
*/
void chip_systick_enter()
{
	if ( !(VICSoftInt & (1<<(uint32_t)Vector_TIMERx )) )
	{
		TxTCR |= TxTCR_Counter_Reset;		/** reset the counter */
		TxIR = TxIR_MRx;					/** clear the int flag */
		TxTCR &= ~TxTCR_Counter_Reset;		/** release the counter reset */
	}
}

/**
* @brief Hook that gets called upon systick exit.
*/
void chip_systick_exit()
{
	if ( VICSoftInt & (1<<(uint32_t)Vector_TIMERx ) )
	{
		VICSoftIntClear = 1<<(uint32_t)Vector_TIMERx;
		/* If it was a SW interrupt, then discount the jiffy */
		--caribou_state.jiffies;
	}
}

/**
* @brief Force a systick timeout, such that systick will go negative in order to
* provide a means of detecting that it was a forced systick() call, i.e. thread yield() or so.
*/
void chip_pend_svc_req(void)
{
	VICSoftInt |= 1<<(uint32_t)Vector_TIMERx;
}

/**
* @brief Is the systick IRQ enabled?
*/
int chip_systick_irq_state(void)
{
	return (TxMCR & TxMCR_MRxI) ? 1 : 0;
}

/**
* @brief Enable the systick IRQ
*/
int chip_systick_irq_enable(void)
{
	int state = chip_interrupts_disable();
	int rc = chip_systick_irq_state();
	TxMCR |= TxMCR_MRxI;	/** enable interrupts on this timer channel. */
	chip_interrupts_set(state);
}

/**
* @brief Disbale the systick IRQ
*/
int chip_systick_irq_disable(void)
{
	int state = chip_interrupts_disable();
	int rc = chip_systick_irq_state();
	TxMCR &= ~TxMCR_MRxI;	/** disable interrupts on this timer channel. */
	TxIR = TxIR_MRx;		/** clear pending interrupt */
	chip_interrupts_set(state);
	return rc;
}

/**
* @brief Set the systick IRQ state.
*/
void chip_systick_irq_set(int enable)
{
	if (enable)
		chip_systick_irq_enable();
	else
		chip_systick_irq_disable();
}

/**
* @brief Initializ the TIMER0 to generrate a 1 KHz "SysTick" interrupt
* Run the clock at pclk/2 so we have a high rez source clock on TIMER0 for other uses.
*/
static void initializeTIMERx(void)
{
	TxTCR = TxTCR_Counter_Reset;						/** disable counting and hold the counter in reset */
	TxCCR = 0x00;										/** Increment TC in PCLK rising edges */
	TxMCR = TxMCR_MRxI;									/** Interrupt when MR0 matches TC */
	TxMCR |= TxMCR_MRxR;								/** Reset TC when TC MR0 matches TC */
	TxPR  = (chip_peripheral_clock_freq()/1000000)-1;	/** 1 MHz Prescale Counter */
	TxMRx = 1000;										/** 1 KHz Timer Match Interrupt */
	TxTCR = TxTCR_Counter_Enable;						/** Enable counting */
	TxTCR &= ~TxTCR_Counter_Reset;						/** release the counter reset */
}

static int resetVectorIRQCount()
{
	return 0;
}

void chip_reset_watchdog()
{
}

void chip_idle()
{
	//driver_reset_watchdog();
}

/**
** @brief Initialize the Enhanced Interrupt Controller Module (EIC)
*/
static void initializeVIC()
{
    VICIntEnable = 0;
    VICIntEnClr = 0xFFFFFFFF;

    /** Initialize the vectored interrupt table for hooking
	 * the vectors into the caribou interrupt manager.
	 */
    VICVectAddr0	=	0;
    VICVectAddr1	=	1;
    VICVectAddr2	=	2;
    VICVectAddr3	=	3;
    VICVectAddr4	=	4;
    VICVectAddr5	=	5;
    VICVectAddr6	=	6;
    VICVectAddr7	=	7;
    VICVectAddr8	=	8;
    VICVectAddr9	=	9;
    VICVectAddr10	=	10;
    VICVectAddr11	=	11;
    VICVectAddr12	=	12;
    VICVectAddr13	=	13;
    VICVectAddr14	=	14;
    VICVectAddr15	=	15;
    VICVectAddr16	=	16;
    VICVectAddr17	=	17;
    VICVectAddr18	=	18;
    VICVectAddr19	=	19;
    VICVectAddr20	=	20;
    VICVectAddr21	=	21;
    VICVectAddr22	=	22;
    VICVectAddr23	=	23;
    VICVectAddr24	=	24;
    VICVectAddr25	=	25;
    VICVectAddr26	=	26;
    VICVectAddr27	=	27;
    VICVectAddr28	=	28;
    VICVectAddr29	=	29;
    VICVectAddr30	=	30;
    VICVectAddr31	=	31;

    /** Unmask the subsystem interrupt flags. */
    //chip_vector_enable(Vector_WDT);
    chip_vector_enable(Vector_TIMERx);
    //chip_vector_enable(Vector_TIMER1);
    chip_vector_enable(Vector_UART0);
	chip_vector_enable(Vector_UART1);
    //driver_vector_enable(Vector_PWM0_1);
    //driver_vector_enable(Vector_I2C0);
    //chip_vector_enable(Vector_SPI_SSP0);
    //chip_vector_enable(Vector_SSP1);
    //driver_vector_enable(Vector_PLL);
    //driver_vector_enable(Vector_RTC);
    //chip_vector_enable(Vector_EINT0);
    //chip_vector_enable(Vector_EINT1);
    //chip_vector_enable(Vector_EINT2);
    //chip_vector_enable(Vector_EINT3);
    //driver_vector_enable(Vector_ADC0);
    //chip_vector_enable(Vector_I2C1);
    //chip_vector_enable(Vector_BOD);
    //driver_vector_enable(Vector_Ethernet);
    //driver_vector_enable(Vector_USB);
    //chip_vector_enable(Vector_CAN);
    //driver_vector_enable(Vector_SD_MMC);
    //chip_vector_enable(Vector_DMA);
    //chip_vector_enable(Vector_TIMER2);
    //chip_vector_enable(Vector_TIMER3);
    //chip_vector_enable(Vector_UART2);
   // chip_vector_enable(Vector_UART3);
    //driver_vector_enable(Vector_I2C2);
    //driver_vector_enable(Vector_I2S);

    /** Enable FIQ for TIMER 0 */
    VICIntSelect = (1<<Vector_TIMERx);
}

/**
** @brief Initialize the watchdog timer.
*/
static void initializeWDG()
{
}

/**
* Initialize the Driver
*/
void chip_init(int systick_hz)
{
	/** Interrupts are now disabled... */
	disable_interrupts();
	resetVectorIRQCount();

	/** initialize major subsystems... */
    #if defined(CARIBOU_CHIP_INIT_VIC)
        initializeVIC();						/* initialize the Vectored Interrupt Controller */
    #endif

	/** initialize system timer */
	initializeTIMERx();

    /** Watchdog active from here on... */
	initializeWDG();
}

void chip_interrupts_enable(void)
{
	enable_interrupts();
}

int chip_interrupts_disable(void)
{
	int rc = chip_interrupts_enabled();
	disable_interrupts();
	return rc;
}

__attribute__((naked)) int chip_interrupts_enabled(void)
{
	__asm(
		"	mrs		r0,cpsr					\n"
		"	ands	r0,r0,#(0x80|0x40)		\n"
		"	moveq	r0,#1					\n"
		"	movne	r0,#0					\n"
		"	bx		lr						\n"
		);
}

void chip_wfi(void)
{
	/* no ARM7 wait for interrupt instruction */
	__asm(" nop\n");
}

// return the current interrupt Vector
uint32_t chip_interrupt_level(void)
{
    return VICAddress;
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

int chip_vector_enabled(uint32_t vector)
{
	int rc = (VICIntEnable & (1<<vector)) ? 1 : 0;
	return rc;
}

// enable a vectored interrupt
int chip_vector_enable(uint32_t vector)
{
	int rc = chip_vector_enabled(vector);
	VICIntEnable = (1<<vector);
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc = chip_vector_enabled(vector);
	VICIntEnClr = (1<<vector);
	return rc;
}

int chip_vector_set(uint32_t vector,int state)
{
	int rc = chip_vector_enabled(vector);
	if ( state )
		chip_vector_enable(vector);
	else
		chip_vector_disable(vector);
	return rc;
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
	return fCCLK;
}

// return the peripheral clock frequency
uint32_t chip_peripheral_clock_freq(void)
{
	return fPCLK;
}

void chip_reset()
{
	/** FIXME */
	for(;;);
}
