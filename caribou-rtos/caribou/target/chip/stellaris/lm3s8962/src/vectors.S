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
		.extern	nvic_isr
		.extern reset_handler
		.extern _pendsv
		.extern _systick
		.extern _hard_fault
		.extern _mpu_fault
		.extern _bus_fault
		.extern _usage_fault
		.extern hard_fault_handler

		.global _vectors
		.section vectors, "ax"
		.code 16
		.align 4
		.thumb_func

_vectors:
		.word __main_stack_end__		/** Stack for MSP */
		.word reset_handler    			/* Reset Vector */
		.word nvic_isr					/* Nminvic_isr */
		/* .word _hard_fault */			/* Hard Faultnvic_isr */
		.word _hard_fault				/* Hard Faultnvic_isr */
		.word _mpu_fault				/* MPU_Faultnvic_isr */
		.word _bus_fault				/* Bus_Faultnvic_isr */
		.word _usage_fault				/* UsageFaultnvic_isr */
		.word 0							/* Reserved */
		.word 0							/* Reserved */
		.word 0							/* Reserved */
		.word 0							/* Reserved */
		.word nvic_isr					/* SVCallnvic_isr */
		.word nvic_isr					/* Populate if using a debug monitor */
		.word 0							/* Reserved */
		.word _pendsv					/* PendSVnvic_isr */
		.word _systick					/* SysTicknvic_isr */
		.word nvic_isr					/* GPIO_Port_Anvic_isr */
		.word nvic_isr					/* GPIO_Port_Bnvic_isr */
		.word nvic_isr					/* GPIO_Port_Cnvic_isr */
		.word nvic_isr					/* GPIO_Port_Dnvic_isr */
		.word nvic_isr					/* GPIO_Port_Envic_isr */
		.word nvic_isr					/* UART0nvic_isr */
		.word nvic_isr					/* UART1nvic_isr */
		.word nvic_isr					/* SSInvic_isr */
		.word nvic_isr					/* I2Cnvic_isr */
		.word nvic_isr					/* PWM_Faultnvic_isr */
		.word nvic_isr					/* PWM_Generator_0nvic_isr */
		.word nvic_isr					/* PWM_Generator_1nvic_isr */
		.word nvic_isr					/* PWM_Generator_2nvic_isr */
		.word nvic_isr					/* QEInvic_isr */
		.word nvic_isr					/* ADC_Sequence_0nvic_isr */
		.word nvic_isr					/* ADC_Sequence_1nvic_isr */
		.word nvic_isr					/* ADC_Sequence_2nvic_isr */
		.word nvic_isr					/* ADC_Sequence_3nvic_isr */
		.word nvic_isr					/* Watchdog_Timernvic_isr */
		.word nvic_isr					/* Timer0Anvic_isr */
		.word nvic_isr					/* Timer0Bnvic_isr */
		.word nvic_isr					/* Timer1Anvic_isr */
		.word nvic_isr					/* Timer1Bnvic_isr */
		.word nvic_isr					/* Timer2Anvic_isr */
		.word nvic_isr					/* Timer2Bnvic_isr */
		.word nvic_isr					/* Analog_Comparator_0nvic_isr */
		.word nvic_isr					/* Analog_Comparator_1nvic_isr */
		.word nvic_isr					/* Analog_Comparator_2nvic_isr */
		.word nvic_isr					/* System_Controlnvic_isr */
		.word nvic_isr					/* FLASH_Controlnvic_isr */
		.word nvic_isr					/* GPIO_Port_Fnvic_isr */
		.word nvic_isr					/* GPIO_Port_Gnvic_isr */
		.word nvic_isr					/* GPIO_Port_Hnvic_isr */
		.word nvic_isr					/* UART2nvic_isr */
		.word nvic_isr					/* SSI1nvic_isr */
		.word nvic_isr					/* Timer3Anvic_isr */
		.word nvic_isr					/* Timer3Bnvic_isr */
		.word nvic_isr					/* I2C1nvic_isr */
		.word nvic_isr					/* QEI1nvic_isr */
		.word nvic_isr					/* CAN0nvic_isr */
		.word nvic_isr					/* CAN1nvic_isr */
		.word nvic_isr					/* CAN2nvic_isr */
		.word nvic_isr					/* ETHERNETnvic_isr */
		.word nvic_isr					/* HIBERNATEnvic_isr */
		.word nvic_isr					/* USB0nvic_isr */
		.word nvic_isr					/* PWM_Generator_3nvic_isr */
		.word nvic_isr					/* uDMA_Software_Transfernvic_isr */
		.word nvic_isr					/* uDMA_Errornvic_isr */
_vectors_end:

		.end
