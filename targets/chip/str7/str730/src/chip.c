/***************************************************************************
 *   Copyright © 2005-2012 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 ***************************************************************************/

#include "chip.h"
#include "STR730.h"
#include "stack.h"
#include "eic.h"

#define	MODE_USR			0x10			/* User Mode */
#define	MODE_FIQ			0x11			/* FIQ Mode */
#define	MODE_IRQ			0x12			/* IRQ Mode */
#define	MODE_SVC			0x13			/* Supervisor Mode */
#define	MODE_ABT			0x17			/* Abort Mode */
#define	MODE_UND			0x1B			/* Undefined Mode */
#define	MODE_SYS			0x1F			/* System Mode */

#define	I_BIT				0x80			/* when I bit is set, IRQ is disabled */
#define	F_BIT				0x40			/* when F bit is set, FIQ is disabled */

#define MAX_IRQ	64
#define MAX_FIQ	2

#define	EIC_TIM0	0x02

static	uint32_t	vectorIRQCount=0;
static	void*		vectorIRQ[MAX_IRQ];
TIM_TypeDef*		tim=NULL;
WDG_TypeDef*		wdg=NULL;
PRCCU_TypeDef*		prccu=NULL;



__attribute__((weak)) void _isr(InterruptVector vector)
{
}

__attribute__((weak)) void swi()
{
}

__attribute__((weak)) void isr_PRCCU()
{
	prccu = PRCCU;
	prccu->CFR &= ~PRCCU_CK2_16_I;
	prccu->CFR &= ~PRCCU_LOCK_I;
	prccu->CFR &= ~PRCCU_STOP_I;
}

void vsr_IRQ(void)
{
	InterruptVector vector = (InterruptVector)EIC->CICR;
    switch(vector)
    {
		case Vector_CMU_PRCCU:
			isr_PRCCU();
			break;
		default:
			_isr(vector);
			break;
    }
}

void vsr_SWI (void)
{
	swi();			/** dispatch the interrupt */
}

void driver_systick_enter()
{
	//TIM0->CR1 &= ~TIM_EN;		/* stop timer */
	EIC->FIER &= ~EIC_TIM0;		/* disable TIM0 interrupts */
	TIM0->SR &= ~TIM_TOF;		/* clear TIMER overflow flag */
	EIC->FIPR = EIC_TIM0;		/* clear EIC pending bit */
}

void driver_systick_exit()
{
	//TIM0->CR1 |= TIM_EN;		/* start timer */
	EIC->FIER |= EIC_TIM0;		/* enable TIM0 interrupts */
	TIM0->SR &= ~TIM_OCFA;		/* clear the output compare A flag */
	TIM0->CR2 &= ~TIM_OCAIE;	/* disable output compare interrupts */
}

/**
* @brief Is the systick IRQ enabled?
*/
int driver_systick_irq_state(void)
{
	return (EIC->FIER | EIC_TIM0) ? 1 : 0;
}

/**
* @brief Enable the systick IRQ
*/
void driver_systick_irq_enable(void)
{
	/** enable interrupts on this timer channel. */
	EIC->FIER |= EIC_TIM0;
}

/**
* @brief Disbale the systick IRQ
*/
void driver_systick_irq_disable(void)
{
	/** disable interrupts on this timer channel. */
	EIC->FIER &= ~EIC_TIM0;
}

/**
* @brief Set the systick IRQ state.
*/
void driver_systick_irq_set(int enable)
{
	if (enable)
		driver_systick_irq_enable();
	else
		driver_systick_irq_disable();
}

/**
* @brief Did the systick timer cause the systick?
* @return true of the systick was causedd by a hardware interrupt.
*/
bool driver_systick_count_bit(void)
{
	//return ( TIM0->SR & TIM_TOF ) ? true : false;
	return !(TIM0->SR & TIM_OCFA);
}

/**
* @brief Force a systick timeout, such that systick will go negative in order to
* provide a means of detecting that it was a forced systick() call, i.e. thread yield() or so.
*/
void driver_systick_irq_force(void)
{
	TIM0->CR2 |= TIM_OCAIE;	/** Output Compare A Interrupt Enable */
	TIM0->OCAR = TIM0->CNTR;
	TIM0->OCAR = TIM0->CNTR;
}

/**
* @brief Initializ the TIM0 timer. 32000000/65535 = 488.2887007 Hz SysTick
* The Timer Overflow TOF interrupts drives the SYstick interrupt.
* The Output Compare A OCA interrupt and
*/
static void initTIM0(void)
{
	tim = TIM0;

	tim->CR2 |= TIM_TOIE;	/** Timer Overflow Interrupt Enable */
//	tim->CR2 |= TIM_OCAIE;	/** Output Compare A Interrupt Enable */

	tim->CR1 |= TIM_EN;		/** TimerEnabler */
	tim->CR1 |= TIM_OCAE;	/** Output COmpare A Enable */
}


static resetVectorIRQCount()
{
	vectorIRQCount=0;
}

static void lockCMU()
{
	CMU->WE = (CMU_KEY1|CMU_KEY2);
}

static void unlockCMU()
{
	CMU->WE = CMU_KEY1;
	CMU->WE = CMU_KEY2;
}

void driver_reset_watchdog()
{
	wdg->KR=WDG_KEY1;
	wdg->KR=WDG_KEY2;
}

void driver_idle()
{
	driver_reset_watchdog();
}

/**
 ** @brief Initialize the clock monitor unit (CMU)
 */
static void initializeCMU()
{
	unlockCMU();

	/**
    ** Select the clock source for CKOUT = Main Oscillator or Backup oscillator
    ** Select the clock source for Frequency Meter = PLL output from PRCCU or Main Oscillator
	** Select the clock source for driving the CMU logic = Main Oscillator or Backup oscillator
    */
    CMU->CTRL |= ( CMU_CKSEL0 | CMU_CKSEL1 | CMU_CKSEL2 | CMU_CRFR );

	/** Initializes RC oscillator control bits */
	CMU->RCCTL = 0x0008;

	/** Configure end of count value (longest) */
	CMU->EOCV = 0x00FF;

	/** Configure Frequency reference high bits */
	CMU->FRH = 0x0FFF;

	/** configure Frequency reference low bits */
	CMU->FRL = 0x0000;

    /** Set the CMU interrupt mask */
	CMU->IM = ( CMU_OLRM | CMU_FLLM | CMU_ROIM );

	lockCMU();
}

/**
** @brief Initialize the Power, reset and clock control unit (PRCCU)
** @brief Targets fMCLK 32MHz fEXT 2MHz
*/
static void initializePRCCU()
{
	volatile uint32_t timeout;
    /** Voltage Regulator On. */
    PRCCU->VRCTR &= ~PRCCU_VROFF_REG;
	/** configure the PLL Multiplication Factor x16 */
	PRCCU->PLLCR = ( PRCCU_FREF_RANGE | PRCCU_PLLMUL_16 /* | PRCCU_PLLDIV_2 */ );
    /** Enable PLL by setting CSU_CKSEL bit in PRCCU_CFR register */
    PRCCU->CFR |= ( PRCCU_DIV2 | PRCCU_CK2_16 | PRCCU_CSU_CKSEL );
    /** Wait for PLL lock for roughly one second timeout */
    for( timeout = 1000000; timeout && ( (PRCCU->CFR & PRCCU_LOCK) == 0 || (PRCCU->VRCTR & PRCCU_VROK) == 0 ); timeout-- );
	/** Enable PRCCU interrutps */
    PRCCU->CCR |= ( PRCCU_EN_HALT | PRCCU_EN_STOP | PRCCU_EN_LOCK | PRCCU_SRESEN );
}

/**
** @brief Initialize system configuration and peripheral clocks (CFG).
*/
static void initializeCFG()
{
	/** Setup Peripheral Clock Gate Registers (PCGR0/1) to enable clock to the peripherals **/
	CFG->PCGR0 |= (
					CFG_PCGR0_RAM	|
					CFG_PCGR0_UART0	|
					CFG_PCGR0_UART1	|
					CFG_PCGR0_TIM0	|
					CFG_PCGR0_TIM1	|
					CFG_PCGR0_TB0	|
					CFG_PCGR0_CAN0	|
					CFG_PCGR0_PWM0	|
					CFG_PCGR0_PWM1	|
					CFG_PCGR0_PWM2	|
					CFG_PCGR0_PWM3	|
					CFG_PCGR0_PWM4	|
					CFG_PCGR0_PWM5	|
					CFG_PCGR0_BSPI1	|
					CFG_PCGR0_BSPI2	|
					CFG_PCGR0_ADC	|
					CFG_PCGR0_EIC	|
					CFG_PCGR0_WUT	|
					CFG_PCGR0_PORT0	|
					CFG_PCGR0_PORT1	|
					CFG_PCGR0_PORT2	|
					CFG_PCGR0_PORT3	|
					CFG_PCGR0_PORT4	|
					CFG_PCGR0_PORT5	|
					CFG_PCGR0_PORT6
				);

	CFG->PCGR1 = (
					CFG_PCGR1_TIM2	|
					CFG_PCGR1_TIM2	|
					CFG_PCGR1_TIM3	|
					CFG_PCGR1_TIM4	|
					CFG_PCGR1_TIM5	|
					CFG_PCGR1_TIM6	|
					CFG_PCGR1_TIM7	|
					CFG_PCGR1_TIM8	|
					CFG_PCGR1_TIM9	|
					CFG_PCGR1_TB1	|
					CFG_PCGR1_TB2	|
					CFG_PCGR1_DMA0	|
					CFG_PCGR1_DMA1	|
					CFG_PCGR1_DMA2	|
					CFG_PCGR1_DMA3	|
					CFG_PCGR1_NBA	|
					CFG_PCGR1_AHB
				);
	CFG->PCGRB0 = 0x00000000;
	CFG->PCGRB1 = 0x00000000;
	/* Stretch the clocks in emulation mode... */
	CFG->PECGR0 = 0xFFFFFFFF; CFG->PECGR0 &= ~(CFG_PCGR0_UART0|CFG_PCGR0_UART1);
	CFG->PECGR1 = 0xFFFFFFFF;
    /* UART emulation protection */
    CFG->ESPR = 0x7F;
}

/**
** @brief Initializes the GPIOx peripheral according to the specified parameters in the GPIO_InitTypeDef structure.
**/
static void initializeGPIOPins(GPIO_TypeDef* GPIOx, uint16_t mode, uint16_t pins )
{
	/** GPIOx Mode and Pins Set */
	switch (mode)
	{
		case GPIO_HI_AIN_TRI:
			GPIOx->PC0&=~pins;
			GPIOx->PC1&=~pins;
			GPIOx->PC2&=~pins;
			break;

		case GPIO_IN_TRI_TTL:
			GPIOx->PC0|=pins;
			GPIOx->PC1&=~pins;
			GPIOx->PC2&=~pins;
			break;

		case GPIO_INOUT_WP:
			GPIOx->PC0|=pins;
			GPIOx->PC1|=pins;
			GPIOx->PC2&=~pins;
			break;

		case GPIO_OUT_OD:
			GPIOx->PC0&=~pins;
			GPIOx->PC1&=~pins;
			GPIOx->PC2|=pins;
			break;

		case GPIO_OUT_PP:
			GPIOx->PC0|=pins;
			GPIOx->PC1&=~pins;
			GPIOx->PC2|=pins;
			break;

		case GPIO_AF_OD:
			GPIOx->PC0&=~pins;
			GPIOx->PC1|=pins;
			GPIOx->PC2|=pins;
			break;

		case GPIO_AF_PP:
			GPIOx->PC0|=pins;
			GPIOx->PC1|=pins;
			GPIOx->PC2|=pins;
			break;
	}
}


/**
** @brief Initialize the GPIO peripherals according to their functions.
** @brief USE EXTREME CARE when modifying this method. Hardware damage can result from carelessness
*/
static initializeGPIO()
{
	/** Initialize all GPIO pins to be HiZ Inputs. */
	initializeGPIOPins( GPIO0, GPIO_INOUT_WP, GPIO_PIN_ALL );
	initializeGPIOPins( GPIO1, GPIO_INOUT_WP, GPIO_PIN_ALL );
	initializeGPIOPins( GPIO2, GPIO_INOUT_WP, GPIO_PIN_ALL );
	initializeGPIOPins( GPIO3, GPIO_HI_AIN_TRI, GPIO_PIN_ALL ); /* analog */
	initializeGPIOPins( GPIO4, GPIO_INOUT_WP, GPIO_PIN_ALL );
	initializeGPIOPins( GPIO5, GPIO_INOUT_WP, GPIO_PIN_ALL );
	initializeGPIOPins( GPIO6, GPIO_INOUT_WP, GPIO_PIN_ALL );

	/** Clear all the GPIO data ports */
	GPIO0->PD=0;
	GPIO1->PD=0;
	GPIO2->PD=0;
	GPIO4->PD=0;
	GPIO5->PD=0;
	GPIO6->PD=0;
}

/**
** @brief Initialize the Enhanced Interrupt Controller Module (EIC)
*/
static void initializeEIC()
{
    /** Initialize the CObject vectored interrupt table... */
    for ( uint32_t vector=0; vector < (MAX_IRQ+MAX_FIQ); vector++ )
    {
    	vectorIRQ[vector] = NULL;
    }
    /** Unmask the subsystem interrupt flags. */
    driver_vector_enable(Vector_CMU_PRCCU);
    driver_vector_enable(Vector_FLASH);
    driver_vector_enable(Vector_ADC);
    driver_vector_enable(Vector_UART0);
    driver_vector_enable(Vector_UART1);
    driver_vector_enable(Vector_BSPI1);
    driver_vector_enable(Vector_BSPI2);
    driver_vector_enable(Vector_CAN0);
    //driver_vector_enable(Vector_TB0);
    driver_vector_enable(Vector_TB1);
    driver_vector_enable(Vector_TB2);
    driver_vector_enable(Vector_PWM0);
    driver_vector_enable(Vector_PWM1);
    driver_vector_enable(Vector_PWM2);
    driver_vector_enable(Vector_PWM3);
    driver_vector_enable(Vector_PWM4);
    driver_vector_enable(Vector_PWM5);
    driver_vector_enable(Vector_TIM0);
    driver_vector_enable(Vector_TIM1);
    driver_vector_enable(Vector_TIM2);
    driver_vector_enable(Vector_TIM3);
    driver_vector_enable(Vector_TIM4);
    driver_vector_enable(Vector_TIM5);
    driver_vector_enable(Vector_TIM6);
    driver_vector_enable(Vector_TIM7);
    driver_vector_enable(Vector_TIM8);
    driver_vector_enable(Vector_TIM9);
    driver_vector_enable(Vector_DMA);
    driver_vector_enable(Vector_DMA0);
    driver_vector_enable(Vector_DMA1);
    driver_vector_enable(Vector_DMA2);
    driver_vector_enable(Vector_DMA3);
    /** Enable IRQ. */
    EIC->ICR = ( EIC_IRQ_EN | EIC_FIQ_EN );

    /** Enable FIQ */
    EIC->FIR = EIC_TIM0;
}

/**
** @brief Initialize the watchdog timer.
*/
static void initializeWDG()
{
	wdg = WDG;
    wdg->MR=0;
    wdg->CR=0;

	/** Reset timeout bit */
	wdg->SR=WDG_MR_ECM;

	/** 256*65535*31/100000 = 520 milliseconds watchdog timeout */
	wdg->PR=0xFF;
	wdg->VR=0xFFFF;

	#if 1
		/** watchdog mode */
		wdg->CR=(WDG_CR_WE|WDG_CR_SC);
	#else
		/** interrupt mode */
		wdg->MR=WDG_MR_ECM;
		wdg->CR=WDG_CR_SC;
	#endif
}


/*
*/
void driver_init(int systick_hz)
{
	/** Capture the reset mode first thing. */
	uint32_t resetMode = ( (PRCCU->CFR >> 5) & 0x0F );

	/** Interrupts are now disabled... */
	disableInterrupts();
	resetVectorIRQCount();

	/** initialize major subsystems... */
	initializeCMU();						/* clock monitor */
	initializePRCCU();						/* reset and clock controls */
	initializeCFG();						/* chip configuration */
	initializeGPIO();						/* I/O pin configuration */
	startEIC();
	initializeEIC();						/* enhanced interrupt controller - needs heap to be already initialized */

	/** initialize system timer */
	initTIM0();

    /** Watchdog active from here on... */
	//initializeWDG();
}


//*****************************************************************************
void driver_hw_peripheral_enable(uint32_t periph)
{
	/** FIXME */
}

//*****************************************************************************
void driver_hw_peripheral_disable(uint32_t periph)
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
void driver_hw_set_pintype_uart(uint32_t ulPort, uint8_t ucPins)
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
void driver_hw_set_gpio_dirmode(uint32_t ulPort, uint8_t ucPins, uint32_t ulPinIO)
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
void driver_hw_set_gpio_padconfig(uint32_t ulPort, uint8_t ucPins, uint32_t ulStrength, uint32_t ulPinType)
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
void driver_hw_config_gpio_pin(uint32_t ulPinConfig)
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
void driver_gpio_pin_type_input(uint32_t ulPort, uint8_t ucPins)
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
void driver_gpio_pin_type_output(uint32_t ulPort, uint8_t ucPins)
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
uint32_t driver_hw_gpio_pin_read(uint32_t ulPort, uint8_t ucPins)
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
void driver_hw_gpio_pin_write(uint32_t ulPort, uint8_t ucPins, uint8_t ucVal)
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
void driver_hw_set_pin_type_i2c(uint32_t ulPort, uint8_t ucPins)
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
void driver_hw_set_pin_type_ssi(uint32_t ulPort, uint8_t ucPins)
{
	/** FIXME */
}

void driver_interrupts_enable(void)
{
	enableInterrupts();
}

void driver_interrupts_disable(void)
{
	disableInterrupts();
}

int	driver_interrupts_enabled(void)
{
	return interruptsEnabled();
}

void driver_wfi(void)
{
	/* no ARM7 wait for interrupt instruction */
	__asm(" nop\n");
}

// return the current interrupt level from the CICR register
uint32_t driver_interrupt_level(void)
{
    return EIC->CICR;
}

void driver_interrupts_set(int enable)
{
	if (enable)
		driver_interrupts_enable();
	else
		driver_interrupts_disable();
}


// enable a vectored interrupt
void driver_vector_enable(uint32_t vector)
{
	if ( (uint32_t)vector < 32 )
	{
        /** Low 32 IRQs */
		EIC->IER0 |= (uint32_t)(1<<(uint32_t)vector);
	}
	else if ( (uint32_t)vector >= 32 && (uint32_t)vector < 64 )
	{
        /** Hi 32 IRQs */
		EIC->IER1 |= (uint32_t)(1<<((uint32_t)vector-32));
	}
    else if ( (uint32_t)vector >= 64 && (uint32_t)vector < 66 )
    {
        /** 2 FIQs */
        EIC->FIER |= ( ( 1 << ( (uint32_t)vector - 64 ) ) & 0x03 );
        EIC->FIR |= ( ( 1 << ( (uint32_t)vector - 64 ) ) & 0x03 );
    }
}

// disable a vectored interrupt
void driver_vector_disable(uint32_t vector)
{
	if ( (uint32_t)vector < 32 )
	{
		EIC->IER0 &= ~((uint32_t)(1<<(uint32_t)vector));
	}
	else if ( (uint32_t)vector >= 32 && (uint32_t)vector < 64 )
	{
		EIC->IER1 &= ~((uint32_t)(1<<((uint32_t)vector-32)));
	}
    else if ( (uint32_t)vector >= 64 && (uint32_t)vector < 66 )
    {
        /** 2 FIQs */
        EIC->FIER &= ~( ( 1 << ( (uint32_t)vector - 64 ) ) & 0x03 );
        EIC->FIR &= ~( ( 1 << ( (uint32_t)vector - 64 ) ) & 0x03 );
    }
}
// a brief delay
uint32_t driver_delay(uint32_t count)
{
	while(count) --count;
	return count; /* needed for optimizer */
}

// return the clock frequency
uint32_t driver_clock_freq(void)
{
	uint32_t	Tmp=0;
	uint32_t	CLOCK1=0;
	uint32_t	CLOCK2=0;
	uint8_t		MUL_Factor=1;
	uint8_t		DIV_Factor=1;

	if((CMU->CTRL & CMU_CKSEL0) == CMU_CKSEL0)
	{
		CLOCK1 = RCCU_OSC_MAIN ;
	}
	else
	{
		CLOCK1 = RCCU_OSC_RC;
	}

	/** Get the value of the fMCLK to CPU and peripherals */
	/** Depending on the status of the DIV2_EN bit get the CLOCK2 value  */
	if((PRCCU->CFR & PRCCU_DIV2) != 0)
	{
		CLOCK2 = CLOCK1 / 2;  /* Set CLOCK2 value to Half CLOCK1 */
	}
	else /** DIV2_EN bit is reset */
	{
		/** Set CLOCK2 value equal to CLOCK1 */
		CLOCK2 =  CLOCK1;
	}

	/** fMCLK is derived from CLOCK2 instead of CLOCK2/16 */
	if((PRCCU->CFR & PRCCU_CK2_16) != 0)
	{
		if ((PRCCU->CFR & PRCCU_CSU_CKSEL) !=0 )
		{
			/** Get the PLL Multiplication and the Division Factor */
			Tmp = PRCCU->PLLCR;
			MUL_Factor =  ((Tmp & 0x30) >> 4);
			switch (MUL_Factor)
			{
				case 0: MUL_Factor = 20; break;
				case 1: MUL_Factor = 12; break;
				case 2: MUL_Factor = 28; break;
				case 3: MUL_Factor = 16; break;
			}
 			DIV_Factor = (Tmp& 0x07) +1;
			/** return the value of the Main Clock MCLK*/
			return(CLOCK2 * MUL_Factor / DIV_Factor) ;
		}
		else /** CSU_CKSEL bit Reset */
		{
			/** Set the MCLK value to CLOCK2  */
			return CLOCK2;
		}
	}
	/** Set the MCLK value to CLOCK2 / 16  */
	return (CLOCK2 /16) ;
}
