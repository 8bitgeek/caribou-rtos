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
#ifndef _CARIBOU_ADC_STM32F407_H_
#define _CARIBOU_ADC_STM32F407_H_

#include <caribou/kernel/types.h>
#include <chip/vectors.h>

#include <stm32f4xx.h>
#include <stm32f4xx_adc.h>
#include <stm32f4xx_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define chip_adc_port_t	ADC_TypeDef*
#define chip_adc_channel_t	uint16_t
#define	chip_adc_value_t	uint16_t

extern int				chip_adc_start(chip_adc_port_t port, chip_adc_channel_t channel);
extern int				chip_adc_ready(chip_adc_port_t port);
extern chip_adc_value_t	chip_adc_value(chip_adc_port_t port);

#ifdef __cplusplus
}
#endif

#endif

