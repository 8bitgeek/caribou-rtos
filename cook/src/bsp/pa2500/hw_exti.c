#include <hw_exti.h>

extern void hw_exti_setup( void )
{
	#if 0
    EXTI_InitTypeDef EXTI_InitStructure;

    /* Configure ENC28J60 EXTI Line to generate an interrupt on falling edge */
	EXTI->IMR |= ETH_LINE;		/* Enable Interrupt. */
	EXTI->RTSR &= ~ETH_LINE;	/* Disable Rising Edge Interrupt */
	EXTI->FTSR |= ETH_LINE;		/* Enable Falling Edge Interrupt */

	EXTI->PR = ETH_LINE;		/* Clear pending bit */
	#endif	
}
