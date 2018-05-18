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
#include <caribou/lib/stdio.h>
#include <caribou/lib/errno.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <chip/chip.h>
#include <chip/adc.h>

int chip_adc_start(chip_adc_port_t port, chip_adc_channel_t channel)
{
	/* ADC regular channel8 configuration */ 
	ADC_RegularChannelConfig(port, channel, 1, ADC_SampleTime_55Cycles5);
	/* Start ADC Software Conversion */ 
	ADC_SoftwareStartConvCmd(port, ENABLE);
	return 0;
}

int chip_adc_ready(chip_adc_port_t port)
{
	/* Check the end of ADC1 calibration */
	return !ADC_GetSoftwareStartConvStatus(port);
}

chip_adc_value_t chip_adc_value(chip_adc_port_t port)
{
	return ADC_GetConversionValue(port);
}
