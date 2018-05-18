/***************************************************************************
 *   Copyright © 2005-2012 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 ***************************************************************************/
#ifndef _CARABOU_VECTORS_H_
#define _CARABOU_VECTORS_H_

#define SYS_IRQ	64

/**
** Interrupt vectors enumerated...
*/
typedef	enum
{

	Vector_CMU_PRCCU=0,
	Vector_INT1,
	Vector_INT2,
	Vector_INT3,
	Vector_INT4,
	Vector_INT5,
	Vector_INT6,
	Vector_INT7,
	Vector_INT8,
	Vector_INT9,
	Vector_INT10,
	Vector_INT11,
	Vector_INT12,
	Vector_INT13,
	Vector_INT14,
	Vector_INT15,

	Vector_DMA,										/** DMA Error */
	Vector_TIM1,
	Vector_TIM2,
	Vector_TIM3,
	Vector_TIM4,
	Vector_TB0,										/** 21 Time Base #0 */
	Vector_TB1,
	Vector_TB2,
	Vector_TIM5,
	Vector_TIM6,
	Vector_TIM7,
	Vector_TIM8,
	Vector_TIM9,
	Vector_Reserved0,
	Vector_Reserved1,
	Vector_UART2,

	Vector_UART3,
	Vector_FLASH,
	Vector_PWM0,
	Vector_PWM1,
	Vector_PWM2,
	Vector_PWM3,
	Vector_PWM4,
	Vector_PWM5,
	Vector_WIU,
	Vector_WDG_WUT,
	Vector_BSPI0,
	Vector_BSPI1,
	Vector_BSPI2,
	Vector_UART0,
	Vector_UART1,
	Vector_I2C0_ITEER,

	Vector_I2C1_ITERR,
	Vector_Reserved2,
	Vector_Reserved3,
	Vector_I2C0_ITDDC,
	Vector_I2C1_ITDDC,
	Vector_Reserved4,
	Vector_Reserved5,
	Vector_CAN0,
	Vector_CAN1,
	Vector_CAN2,
	Vector_DMA0,
	Vector_DMA1,
	Vector_DMA2,
	Vector_DMA3,
	Vector_ADC,
	Vector_RTC,

	Vector_INT0,                                    /** FIQ0 : INT0 - External Interrupt 0 */
	Vector_TIM0,                                    /** FIQ1 : TIM0 - Timer 0 Global Interrupt */
	Vector_SWI										/** SWI **/
} InterruptVector;

#ifdef __cplusplus
}
#endif

#endif
