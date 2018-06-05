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
#ifndef CARIBOU_INTERRUPT_H
#define CARIBOU_INTERRUPT_H

#include <caribou_types.h>
#include <chip/chip.h>
#include <chip/vectors.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef void (*caribou_isr_t)(InterruptVector,void*);

#define	caribou_wfi()						chip_wfi()
#define caribou_interrupts_enable()			chip_interrupts_enable()
#define	caribou_interrupts_disable()		chip_interrupts_disable()
#define	caribou_interrupts_enabled()		chip_interrupts_enabled()
#define	caribou_interrupts_set(enable)		chip_interrupts_set(enable)
#define	caribou_interrupt_level()			chip_interrupt_level()
#define caribou_vector_enabled(vector)		chip_vector_enabled(vector)
#define	caribou_vector_enable(vector)		chip_vector_enable(vector)
#define caribou_vector_disable(vector)		chip_vector_disable(vector)
#define caribou_vector_set(vector,state)	chip_vector_set(vector,state)
#define	caribou_vector_pending(vector)		chip_vector_pending(vector)
#define	caribou_vector_pend(vector)			chip_vector_pend(vector)
#define caribou_vector_unpend(vector)		chip_vector_unpend(vector)

/**
 ** @brief User-land Interrupt Service Routine entry point.
 **/
extern void		caribou_interrupt_service(InterruptVector vector);

extern int		caribou_vector_installed(InterruptVector vector,caribou_isr_t isr,void* arg);
extern int		caribou_vector_install(InterruptVector vector,caribou_isr_t isr,void* arg);
extern int		caribou_vector_remove(InterruptVector vector,caribou_isr_t isr);
extern int		caribou_vector_remove_all(void* arg);

#ifdef __cplusplus
}
#endif


#endif
