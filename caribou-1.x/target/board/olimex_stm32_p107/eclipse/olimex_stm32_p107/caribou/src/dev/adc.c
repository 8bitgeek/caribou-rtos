/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/dev/adc.h>

int caribou_adc_start(caribou_adc_t* adc)
{
	return chip_adc_start( adc->port, adc->channel);
}

int caribou_adc_ready(caribou_adc_t* adc)
{
	return chip_adc_ready( adc->port );;
}

chip_adc_value_t caribou_adc_value(caribou_adc_t* adc)
{
	return chip_adc_value( adc->port );
}

