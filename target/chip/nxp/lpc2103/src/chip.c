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
#include <chip/lpc2103.h>
#include <chip/stack.h>

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

#define	disable_interrupts() \
	__asm( \
		"	mrs		r0,cpsr					\n"	\
		"	orr		r0,r0,#0x80				\n" \
		"	msr		cpsr_c,r0				\n" \
		"	orr		r0,r0,#0x40				\n" \
		"	msr		cpsr_c,r0				\n" \
		)

#define enable_interrupts() \
	__asm( \
		"	mrs		r0,cpsr					\n"	\
		"	bic		r0,r0,#(0x80|0x40)		\n" \
		"	msr		cpsr_c,r0				\n" \
		)

#define disable_irq() \
	__asm( \
		"	mrs		r0,cpsr					\n"	\
		"	orr		r0,r0,#0x80				\n" \
		"	msr		cpsr_c,r0				\n" \
		)

#define enable_irq() \
	__asm( \
		"	mrs		r0,cpsr					\n"	\
		"	bic		r0,r0,#0x80				\n" \
		"	msr		cpsr_c,r0				\n" \
		)

#define disable_fiq() \
	__asm( \
		"	mrs		r0,cpsr					\n"	\
		"	orr		r0,r0,#0x40				\n" \
		"	msr		cpsr_c,r0				\n" \
		)

#define enable_fiq() \
	__asm( \
		"	mrs		r0,cpsr					\n"	\
		"	bic		r0,r0,#0x40				\n" \
		"	msr		cpsr_c,r0				\n" \
		)

__attribute__((weak)) void isr_vector(InterruptVector vector)		{}

__attribute__((weak)) void spi0_isr()
{
}

__attribute__((weak)) void spi1_isr()
{
}

__attribute__((weak)) void usart0_isr()
{
}

__attribute__((weak)) void usart1_isr()
{
}

__attribute__((weak)) void eint0_isr()
{
}
   
__attribute__((weak)) void eint1_isr()
{
}
   
__attribute__((weak)) void eint2_isr()
{
}
   
/**
* @brief Get here from assember language IRQ entry and exit handler.
* Calls _isr(vector).
*/
void irq_vector_lpc2468(InterruptVector vector)
{
	uint32_t soft_int_bit = (1<<(uint32_t)vector);
	if ( VICSoftInt & soft_int_bit )				// was it a soft interrupt?
		VICSoftIntClear = soft_int_bit;				// clear the soft int flag
	// send to the canned service routines first.
	switch ( vector )
	{
		case Vector_UART0:		usart0_isr();	break;
		case Vector_UART1:		usart1_isr();	break;
		case Vector_SPI_SSP0:	spi0_isr();		break;
		case Vector_SSP1:		spi1_isr();		break;
		case Vector_EINT0:		eint0_isr();	break;
		case Vector_EINT1:		eint1_isr();	break;
		case Vector_EINT2:		eint2_isr();	break;
	}
	// then to the soft service routines next...
	isr_vector((int)vector);						// call user-land interrupt service routine	
}

__attribute__((weak)) void swi()
{
}

/**
* @brief Hook that gets called upon systick entry.
*/
void chip_systick_enter()
{
	T0TCR |= T0TCR_Counter_Reset;		/** reset the counter */
	T0IR |= T0IR_MR0;					/** clear the int flag */
	T0TCR &= ~T0TCR_Counter_Reset;		/** release the counter reset */
}

/**
* @brief Hook that gets called upon systick exit.
*/
void chip_systick_exit()
{
	if ( VICSoftInt & (1<<(uint32_t)Vector_TIMER0 ) )
	{
		VICSoftIntClear = 1<<(uint32_t)Vector_TIMER0;
	}
	else if ( T0IR & T0IR_MR0 )
	{
		T0TCR |= T0TCR_Counter_Reset;		/** reset the counter */
		T0IR |= T0IR_MR0;					/** clear the int flag */
		T0TCR &= ~T0TCR_Counter_Reset;		/** release the counter reset */
	}
}

/**
* @brief Force a systick timeout, such that systick will go negative in order to
* provide a means of detecting that it was a forced systick() call, i.e. thread yield() or so.
*/
void chip_systick_irq_force(void)
{
	VICSoftInt |= 1<<(uint32_t)Vector_TIMER0;
}

/**
* @brief Is the systick IRQ enabled?
*/
int chip_systick_irq_state(void)
{
	return (T0MCR & T0MCR_MR0I) ? 1 : 0;
}

/**
* @brief Enable the systick IRQ
*/
int chip_systick_irq_enable(void)
{
	int state = chip_interrupts_disable();
	int rc = chip_systick_irq_state();
	T0MCR |= T0MCR_MR0I; /** enable interrupts on this timer channel. */
	chip_interrupts_set(state);
}

/**
* @brief Disbale the systick IRQ
*/
int chip_systick_irq_disable(void)
{
	int state = chip_interrupts_disable();
	int rc = chip_systick_irq_state();
	T0MCR &= ~T0MCR_MR0I; /** disable interrupts on this timer channel. */
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
*/
static void initializeTIMER0(void)
{
	T0TCR = T0TCR_Counter_Reset;						/** disable counting and hold the counter in reset */
	T0CCR = 0x00;										/** Increment TC in PCLK rising edges */
	T0MCR = T0MCR_MR0I |								/** Interrupt when MR0 matches TC */
			T0MCR_MR0R ;								/** Reset TC when TC MR0 matches TC */
	T0PR  = (chip_peripheral_clock_freq()/1000000);	/** 1 MHz Prescale Counter */
	T0MR0 = 1000;										/** 1 KHz Timer Match Interrupt */
	T0TCR = T0TCR_Counter_Enable;						/** Anable counting */
	T0TCR &= ~T0TCR_Counter_Reset;						/** release the counter reset */
	VICIntEnable |= (1<<(int)Vector_TIMER0);
}

//

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
	VICIntEnClr = 0xFFFFFFFF;
	VICIntSelect = 0;
	VICVectCntl0 = 0;
	VICVectCntl1 = 0;
	VICVectAddr0 = 0;
	VICVectAddr1 = 0;

    /** Initialize the CObject vectored interrupt table... */
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


    /** Unmask the subsystem interrupt flags. */
    chip_vector_disable(Vector_WDT);
    chip_vector_enable(Vector_TIMER0);
    chip_vector_enable(Vector_TIMER1);
    chip_vector_enable(Vector_UART0);
    chip_vector_enable(Vector_UART1);
    //driver_vector_enable(Vector_PWM0_1);
    //driver_vector_enable(Vector_I2C0);
    chip_vector_enable(Vector_SPI_SSP0);
    chip_vector_enable(Vector_SSP1);
    //driver_vector_enable(Vector_PLL);
    //driver_vector_enable(Vector_RTC);
    //chip_vector_enable(Vector_EINT0);
    //chip_vector_enable(Vector_EINT1);
    //chip_vector_enable(Vector_EINT2);
    //chip_vector_enable(Vector_EINT3);
    //driver_vector_enable(Vector_ADC0);
    //chip_vector_enable(Vector_I2C1);
    //driver_vector_enable(Vector_Ethernet);
    //driver_vector_enable(Vector_USB);
    //driver_vector_enable(Vector_SD_MMC);
    chip_vector_enable(Vector_TIMER2);
    chip_vector_enable(Vector_TIMER3);
    //driver_vector_enable(Vector_I2C2);
    //driver_vector_enable(Vector_I2S);

    /** Enable FIQ for TIMER 0 */
    VICIntSelect = (1<<Vector_TIMER0);
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
	//initializeVIC();						/* initialize the Vectored Interrupt Controller */

	/** initialize system timer */
	initializeTIMER0();

    /** Watchdog active from here on... */
	initializeWDG();
}


//*****************************************************************************
void chip_hw_peripheral_enable(uint32_t periph)
{
	/** FIXME */
}

//*****************************************************************************
void chip_hw_peripheral_disable(uint32_t periph)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use by the UART peripheral.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The UART pins must be properly configured for the UART peripheral to
//! function correctly.  This function provides a typical configuration for
//! those pin(s); other configurations may work as well depending upon the
//! board setup (for example, using the on-chip pull-ups).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note This cannot be used to turn any pin into a UART pin; it only
//! configures a UART pin for proper operation.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_pintype_uart(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Sets the direction and mode of the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port
//! \param ucPins is the bit-packed representation of the pin(s).
//! \param ulPinIO is the pin direction and/or mode.
//!
//! This function will set the specified pin(s) on the selected GPIO port
//! as either an input or output under software control, or it will set the
//! pin to be under hardware control.
//!
//! The parameter \e ulPinIO is an enumerated data type that can be one of
//! the following values:
//!
//! - \b GPIO_DIR_MODE_IN
//! - \b GPIO_DIR_MODE_OUT
//! - \b GPIO_DIR_MODE_HW
//!
//! where \b GPIO_DIR_MODE_IN specifies that the pin will be programmed as
//! a software controlled input, \b GPIO_DIR_MODE_OUT specifies that the pin
//! will be programmed as a software controlled output, and
//! \b GPIO_DIR_MODE_HW specifies that the pin will be placed under
//! hardware control.
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note GPIOPadConfigSet() must also be used to configure the corresponding
//! pad(s) in order for them to propagate the signal to/from the GPIO.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_gpio_dirmode(uint32_t ulPort, uint8_t ucPins, uint32_t ulPinIO)
{
	/** FIXME */
}


//*****************************************************************************
//
//! Sets the pad configuration for the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//! \param ulStrength specifies the output drive strength.
//! \param ulPinType specifies the pin type.
//!
//! This function sets the drive strength and type for the specified pin(s)
//! on the selected GPIO port.  For pin(s) configured as input ports, the
//! pad is configured as requested, but the only real effect on the input
//! is the configuration of the pull-up or pull-down termination.
//!
//! The parameter \e ulStrength can be one of the following values:
//!
//! - \b GPIO_STRENGTH_2MA
//! - \b GPIO_STRENGTH_4MA
//! - \b GPIO_STRENGTH_8MA
//! - \b GPIO_STRENGTH_8MA_SC
//!
//! where \b GPIO_STRENGTH_xMA specifies either 2, 4, or 8 mA output drive
//! strength, and \b GPIO_OUT_STRENGTH_8MA_SC specifies 8 mA output drive with
//! slew control.
//!
//! The parameter \e ulPinType can be one of the following values:
//!
//! - \b GPIO_PIN_TYPE_STD
//! - \b GPIO_PIN_TYPE_STD_WPU
//! - \b GPIO_PIN_TYPE_STD_WPD
//! - \b GPIO_PIN_TYPE_OD
//! - \b GPIO_PIN_TYPE_OD_WPU
//! - \b GPIO_PIN_TYPE_OD_WPD
//! - \b GPIO_PIN_TYPE_ANALOG
//!
//! where \b GPIO_PIN_TYPE_STD* specifies a push-pull pin, \b GPIO_PIN_TYPE_OD*
//! specifies an open-drain pin, \b *_WPU specifies a weak pull-up, \b *_WPD
//! specifies a weak pull-down, and \b GPIO_PIN_TYPE_ANALOG specifies an
//! analog input (for the comparators).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_gpio_padconfig(uint32_t ulPort, uint8_t ucPins, uint32_t ulStrength, uint32_t ulPinType)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures the alternate function of a GPIO pin.
//!
//! \param ulPinConfig is the pin configuration value, specified as only one of
//! the \b GPIO_P??_??? values.
//!
//! This function configures the pin mux that selects the peripheral function
//! associated with a particular GPIO pin.  Only one peripheral function at a
//! time can be associated with a GPIO pin, and each peripheral function should
//! only be associated with a single GPIO pin at a time (despite the fact that
//! many of them can be associated with more than one GPIO pin).
//!
//! \note This function is only valid on Tempest-class devices.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_config_gpio_pin(uint32_t ulPinConfig)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use as GPIO inputs.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The GPIO pins must be properly configured in order to function correctly as
//! GPIO inputs; this is especially true of Fury-class devices where the
//! digital input enable is turned off by default.  This function provides the
//! proper configuration for those pin(s).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_gpio_pin_type_input(uint32_t ulPort, uint8_t ucPins)
{
    /** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use as GPIO outputs.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The GPIO pins must be properly configured in order to function correctly as
//! GPIO outputs; this is especially true of Fury-class devices where the
//! digital input enable is turned off by default.  This function provides the
//! proper configuration for those pin(s).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_gpio_pin_type_output(uint32_t ulPort, uint8_t ucPins)
{
    /** FIXME */
}



//*****************************************************************************
//
//! Reads the values present of the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The values at the specified pin(s) are read, as specified by \e ucPins.
//! Values are returned for both input and output pin(s), and the value
//! for pin(s) that are not specified by \e ucPins are set to 0.
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return Returns a bit-packed byte providing the state of the specified
//! pin, where bit 0 of the byte represents GPIO port pin 0, bit 1 represents
//! GPIO port pin 1, and so on.  Any bit that is not specified by \e ucPins
//! is returned as a 0.  Bits 31:8 should be ignored.
//
//*****************************************************************************
uint32_t chip_hw_gpio_pin_read(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
    return 0;
}

//*****************************************************************************
//
//! Writes a value to the specified pin(s).
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//! \param ucVal is the value to write to the pin(s).
//!
//! Writes the corresponding bit values to the output pin(s) specified by
//! \e ucPins.  Writing to a pin configured as an input pin has no effect.
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_gpio_pin_write(uint32_t ulPort, uint8_t ucPins, uint8_t ucVal)
{
    /** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use by the I2C peripheral.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The I2C pins must be properly configured for the I2C peripheral to function
//! correctly.  This function provides the proper configuration for those
//! pin(s).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note This cannot be used to turn any pin into an I2C pin; it only
//! configures an I2C pin for proper operation.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_pin_type_i2c(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

//*****************************************************************************
//
//! Configures pin(s) for use by the SSI peripheral.
//!
//! \param ulPort is the base address of the GPIO port.
//! \param ucPins is the bit-packed representation of the pin(s).
//!
//! The SSI pins must be properly configured for the SSI peripheral to function
//! correctly.  This function provides a typical configuration for those
//! pin(s); other configurations may work as well depending upon the board
//! setup (for example, using the on-chip pull-ups).
//!
//! The pin(s) are specified using a bit-packed byte, where each bit that is
//! set identifies the pin to be accessed, and where bit 0 of the byte
//! represents GPIO port pin 0, bit 1 represents GPIO port pin 1, and so on.
//!
//! \note This function cannot be used to turn any pin into a SSI pin; it only
//! configures a SSI pin for proper operation. Devices with flexible pin
//! muxing also require a GPIOPinConfigure() function call.
//!
//! \return None.
//
//*****************************************************************************
void chip_hw_set_pin_type_ssi(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
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
	#if 0 /* !defined(JTAG_DEBUG) */
		static volatile uint32_t dummy;
		dummy = 0xFF00FF00;		/* A couple of memory writes (manual recommends this). */
		dummy = 0x00FF00FF;
		PCON |= PCON_IDL;		/* Idle Mode; power down CPU core & wait for an interrupt. */
	#endif
}

// return the current interrupt Vector
uint32_t chip_interrupt_level(void)
{
	uint32_t* base = (uint32_t)(VIC_BASE+VICVectAddr0_OFFSET);
	int level;
	for(level=0;level<16;level++)
	{
		if ( base[level] == VICVectAddr )
			break;
	}
    return level;
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
	uint32_t vectCntlVal = (vector&0x1F) | (1<<5);
	VICIntEnable = (1<<vector);
	switch(vector)
	{
		case 0:		VICVectCntl0 = vectCntlVal;		break;
		case 1:		VICVectCntl1 = vectCntlVal;		break;
		case 2:		VICVectCntl2 = vectCntlVal;		break;
		case 3:		VICVectCntl3 = vectCntlVal;		break;
		case 4:		VICVectCntl4 = vectCntlVal;		break;
		case 5:		VICVectCntl5 = vectCntlVal;		break;
		case 6:		VICVectCntl6 = vectCntlVal;		break;
		case 7:		VICVectCntl7 = vectCntlVal;		break;
		case 8:		VICVectCntl8 = vectCntlVal;		break;
		case 9:		VICVectCntl9 = vectCntlVal;		break;
		case 10:	VICVectCntl10 = vectCntlVal;	break;
		case 11:	VICVectCntl11 = vectCntlVal;	break;
		case 12:	VICVectCntl12 = vectCntlVal;	break;
		case 13:	VICVectCntl13 = vectCntlVal;	break;
		case 14:	VICVectCntl14 = vectCntlVal;	break;
		case 15:	VICVectCntl15 = vectCntlVal;	break;
	}
	return rc;
}

// disable a vectored interrupt
int chip_vector_disable(uint32_t vector)
{
	int rc = chip_vector_enabled(vector);
	uint32_t vectCntlVal = 0;
	VICIntEnClr = (1<<vector);
	switch(vector)
	{
		case 0:		VICVectCntl0 = vectCntlVal;		break;
		case 1:		VICVectCntl1 = vectCntlVal;		break;
		case 2:		VICVectCntl2 = vectCntlVal;		break;
		case 3:		VICVectCntl3 = vectCntlVal;		break;
		case 4:		VICVectCntl4 = vectCntlVal;		break;
		case 5:		VICVectCntl5 = vectCntlVal;		break;
		case 6:		VICVectCntl6 = vectCntlVal;		break;
		case 7:		VICVectCntl7 = vectCntlVal;		break;
		case 8:		VICVectCntl8 = vectCntlVal;		break;
		case 9:		VICVectCntl9 = vectCntlVal;		break;
		case 10:	VICVectCntl10 = vectCntlVal;	break;
		case 11:	VICVectCntl11 = vectCntlVal;	break;
		case 12:	VICVectCntl12 = vectCntlVal;	break;
		case 13:	VICVectCntl13 = vectCntlVal;	break;
		case 14:	VICVectCntl14 = vectCntlVal;	break;
		case 15:	VICVectCntl15 = vectCntlVal;	break;
	}
	return rc;
}

int chip_vector_set(uint32_t vector,int state)
{
	if ( state )
		return chip_vector_enable(vector);
	else
		return chip_vector_disable(vector);
}

int chip_vector_enabled(uint32_t vector)
{
	int rc = (VICIntEnable & (1<<vector)) ? 1 : 0;
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
