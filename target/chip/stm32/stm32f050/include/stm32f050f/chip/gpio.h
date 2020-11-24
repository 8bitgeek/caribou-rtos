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
#ifndef _CARIBOU_GPIO_STM32F050_H_
#define _CARIBOU_GPIO_STM32F050_H_

#include <caribou/types.h>
#include <chip/vectors.h>

#include <stm32f0xx.h>
#include <stm32f0xx_gpio.h>
#include <stm32f0xx_rcc.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define caribou_gpio_t	GPIO_TypeDef

void caribou_gpio_toggle(caribou_gpio_t* port,uint16_t pin);
void caribou_gpio_set(caribou_gpio_t* port,uint16_t pin);
void caribou_gpio_reset(caribou_gpio_t* port,uint16_t pin);
uint16_t caribou_gpio_pinstate(caribou_gpio_t* port,uint16_t pin);

#ifdef __cplusplus
}
#endif

#endif
