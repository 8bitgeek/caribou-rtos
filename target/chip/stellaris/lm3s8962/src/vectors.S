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
		.extern	caribou_isr
		.extern reset_handler
		.extern caribou_pendsv
		.extern caribou_systick
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
		.word caribou_isr					/* Nmicaribou_isr */
		/* .word _hard_fault */			/* Hard Faultcaribou_isr */
		.word _hard_fault				/* Hard Faultcaribou_isr */
		.word _mpu_fault				/* MPU_Faultcaribou_isr */
		.word _bus_fault				/* Bus_Faultcaribou_isr */
		.word _usage_fault				/* UsageFaultcaribou_isr */
		.word 0							/* Reserved */
		.word 0							/* Reserved */
		.word 0							/* Reserved */
		.word 0							/* Reserved */
		.word caribou_isr					/* SVCallcaribou_isr */
		.word caribou_isr					/* Populate if using a debug monitor */
		.word 0							/* Reserved */
		.word caribou_pendsv					/* PendSVcaribou_isr */
		.word caribou_systick					/* SysTickcaribou_isr */
		.word caribou_isr					/* GPIO_Port_Acaribou_isr */
		.word caribou_isr					/* GPIO_Port_Bcaribou_isr */
		.word caribou_isr					/* GPIO_Port_Ccaribou_isr */
		.word caribou_isr					/* GPIO_Port_Dcaribou_isr */
		.word caribou_isr					/* GPIO_Port_Ecaribou_isr */
		.word caribou_isr					/* UART0caribou_isr */
		.word caribou_isr					/* UART1caribou_isr */
		.word caribou_isr					/* SSIcaribou_isr */
		.word caribou_isr					/* I2Ccaribou_isr */
		.word caribou_isr					/* PWM_Faultcaribou_isr */
		.word caribou_isr					/* PWM_Generator_0caribou_isr */
		.word caribou_isr					/* PWM_Generator_1caribou_isr */
		.word caribou_isr					/* PWM_Generator_2caribou_isr */
		.word caribou_isr					/* QEIcaribou_isr */
		.word caribou_isr					/* ADC_Sequence_0caribou_isr */
		.word caribou_isr					/* ADC_Sequence_1caribou_isr */
		.word caribou_isr					/* ADC_Sequence_2caribou_isr */
		.word caribou_isr					/* ADC_Sequence_3caribou_isr */
		.word caribou_isr					/* Watchdog_Timercaribou_isr */
		.word caribou_isr					/* Timer0Acaribou_isr */
		.word caribou_isr					/* Timer0Bcaribou_isr */
		.word caribou_isr					/* Timer1Acaribou_isr */
		.word caribou_isr					/* Timer1Bcaribou_isr */
		.word caribou_isr					/* Timer2Acaribou_isr */
		.word caribou_isr					/* Timer2Bcaribou_isr */
		.word caribou_isr					/* Analog_Comparator_0caribou_isr */
		.word caribou_isr					/* Analog_Comparator_1caribou_isr */
		.word caribou_isr					/* Analog_Comparator_2caribou_isr */
		.word caribou_isr					/* System_Controlcaribou_isr */
		.word caribou_isr					/* FLASH_Controlcaribou_isr */
		.word caribou_isr					/* GPIO_Port_Fcaribou_isr */
		.word caribou_isr					/* GPIO_Port_Gcaribou_isr */
		.word caribou_isr					/* GPIO_Port_Hcaribou_isr */
		.word caribou_isr					/* UART2caribou_isr */
		.word caribou_isr					/* SSI1caribou_isr */
		.word caribou_isr					/* Timer3Acaribou_isr */
		.word caribou_isr					/* Timer3Bcaribou_isr */
		.word caribou_isr					/* I2C1caribou_isr */
		.word caribou_isr					/* QEI1caribou_isr */
		.word caribou_isr					/* CAN0caribou_isr */
		.word caribou_isr					/* CAN1caribou_isr */
		.word caribou_isr					/* CAN2caribou_isr */
		.word caribou_isr					/* ETHERNETcaribou_isr */
		.word caribou_isr					/* HIBERNATEcaribou_isr */
		.word caribou_isr					/* USB0caribou_isr */
		.word caribou_isr					/* PWM_Generator_3caribou_isr */
		.word caribou_isr					/* uDMA_Software_Transfercaribou_isr */
		.word caribou_isr					/* uDMA_Errorcaribou_isr */
_vectors_end:

		.end
