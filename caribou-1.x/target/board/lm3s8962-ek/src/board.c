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
#include <board.h>
#include <driverlib/sysctl.h>

void early_init()
{
#if defined(ACCUTRON_ACCTRX) // Building for Accutron CommTrax PCB?
	#if defined(PART_LM3S8C62)
		SysCtlClockSet(SYSCTL_SYSDIV_2_5 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN | SYSCTL_XTAL_6MHZ);
	#elif defined(PART_LM3S8962)
		SysCtlClockSet(SYSCTL_SYSDIV_4 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN | SYSCTL_XTAL_6MHZ);
	#else
		#error No PART_LM3Sxxxx defined
	#endif
#else
	#if defined(PART_LM3S8C62)
		SysCtlClockSet(SYSCTL_SYSDIV_2_5 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN | SYSCTL_XTAL_8MHZ);
	#elif defined(PART_LM3S8962)
		SysCtlClockSet(SYSCTL_SYSDIV_4 | SYSCTL_USE_PLL | SYSCTL_OSC_MAIN | SYSCTL_XTAL_8MHZ);
	#else
		#error No PART_LM3Sxxxx defined
	#endif
#endif

#if defined(IRQ_DEBUG)
	SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
	// Debug 0
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_0);
	GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_0, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
	// Debug 1
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_1);
	GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_1, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
	// Debug 2
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_4);
	GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_4, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
	// Debug 3
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_5);
	GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_5, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
	// Debug 4
	GPIOPinTypeGPIOOutput(GPIO_PORTD_BASE, GPIO_PIN_6);
	GPIOPadConfigSet(GPIO_PORTD_BASE, GPIO_PIN_6, GPIO_STRENGTH_8MA, GPIO_PIN_TYPE_STD);
#endif
}

void late_init()
{
}
