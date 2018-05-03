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
#ifndef _CARIBOU_ADC_H_
#define _CARIBOU_ADC_H_

#include <caribou/kernel/types.h>
#include <chip/adc.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct
{
	chip_adc_port_t		port;
	chip_adc_channel_t	channel;
} caribou_adc_t;

#define CARIBOU_ADC_INIT(port,channel) {port,channel}

#define CARIBOU_ADC_Channel_0		((uint8_t)0x00)
#define CARIBOU_ADC_Channel_1		((uint8_t)0x01)
#define CARIBOU_ADC_Channel_2		((uint8_t)0x02)
#define CARIBOU_ADC_Channel_3		((uint8_t)0x03)
#define CARIBOU_ADC_Channel_4		((uint8_t)0x04)
#define CARIBOU_ADC_Channel_5		((uint8_t)0x05)
#define CARIBOU_ADC_Channel_6		((uint8_t)0x06)
#define CARIBOU_ADC_Channel_7		((uint8_t)0x07)
#define CARIBOU_ADC_Channel_8		((uint8_t)0x08)
#define CARIBOU_ADC_Channel_9		((uint8_t)0x09)
#define CARIBOU_ADC_Channel_10		((uint8_t)0x0A)
#define CARIBOU_ADC_Channel_11		((uint8_t)0x0B)
#define CARIBOU_ADC_Channel_12		((uint8_t)0x0C)
#define CARIBOU_ADC_Channel_13		((uint8_t)0x0D)
#define CARIBOU_ADC_Channel_14		((uint8_t)0x0E)
#define CARIBOU_ADC_Channel_15		((uint8_t)0x0F)
#define CARIBOU_ADC_Channel_16		((uint8_t)0x10)
#define CARIBOU_ADC_Channel_17		((uint8_t)0x11)
#define CARIBOU_ADC_Channel_18		((uint8_t)0x12)
#define CARIBOU_ADC_Channel_19		((uint8_t)0x13)
#define CARIBOU_ADC_Channel_20		((uint8_t)0x14)
#define CARIBOU_ADC_Channel_21		((uint8_t)0x15)
#define CARIBOU_ADC_Channel_22		((uint8_t)0x16)
#define CARIBOU_ADC_Channel_23		((uint8_t)0x17)
#define CARIBOU_ADC_Channel_24		((uint8_t)0x18)
#define CARIBOU_ADC_Channel_25		((uint8_t)0x19)
#define CARIBOU_ADC_Channel_26		((uint8_t)0x1A)
#define CARIBOU_ADC_Channel_27		((uint8_t)0x1B)
#define CARIBOU_ADC_Channel_28		((uint8_t)0x1C)
#define CARIBOU_ADC_Channel_29		((uint8_t)0x1D)
#define CARIBOU_ADC_Channel_30		((uint8_t)0x1E)
#define CARIBOU_ADC_Channel_31		((uint8_t)0x1F)

extern int				caribou_adc_start(caribou_adc_t* adc);
extern int				caribou_adc_ready(caribou_adc_t* adc);
extern chip_adc_value_t	caribou_adc_value(caribou_adc_t* adc);

#ifdef __cplusplus
}
#endif

#endif
