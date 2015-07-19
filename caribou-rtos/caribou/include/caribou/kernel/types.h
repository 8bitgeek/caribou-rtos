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
#ifndef _CARIBOU_TYPES_H_
#define _CARIBOU_TYPES_H_

#include <caribou_config.h>

#if defined(CARIBOU_STDINT)
	/** define standard word sizes.... */
	#define	int64_t		long long						/** 64 bits - signed */
	#define	int32_t		int								/** 32 bits - signed */
	#define	int16_t		short							/** 16 bits - signed */
	#define	int8_t		char							/**  8 bits - signed */
	#define	uint64_t	unsigned long long				/** 64 bits - unsigned */
	#define	uint32_t	unsigned int					/** 32 bits - unsigned */
	#define	uint16_t	unsigned short					/** 16 bits - unsigned */
	#define	uint8_t		unsigned char					/**  8 bits - unsigned */
	#define	vuint64_t	volatile unsigned long long		/** 64 bits - unsigned volatile */
	#define	vuint32_t	volatile unsigned int			/** 32 bits - unsigned volatile */
	#define	vuint16_t	volatile unsigned short			/** 16 bits - unsigned volatile */
	#define	vuint8_t	volatile unsigned char			/**  8 bits - unsigned volatile */
	#define	real_t		double							/** 64 bits - signed floating point (IEEE 754) */
	typedef unsigned size_t;
#else
	#include <stdint.h>
	#include <stddef.h>
#endif

#ifndef NULL
	#define NULL (0)
#endif

#ifndef bool
	#define bool char
#endif

#ifndef true
	#define true ((bool)1)
#endif

#ifndef false
	#define false ((bool)0)
#endif

#ifndef max
    #define max(a,b) (((a) > (b)) ? (a) : (b))
#endif
#ifndef min
	#define min(a,b) (((a) < (b)) ? (a) : (b))
#endif

#ifndef INT_MAX
	#define INT_MAX 2147483647
#endif

#if defined(CARIBOU_LIB_IRQ_SAFE)
	/* heap operations are safe within interrupt handlers - disable global interrupts - increased irq jitter */
	#define caribou_lib_lock()				chip_interrupts_disable()
	#define caribou_lib_unlock()			chip_interrupts_enable()
	#define	caribou_lib_lock_restore(n)		chip_interrupts_set(n)
#else
	/* heap operations are thread-safe - no interrupts are disabled - minimal impact on irq jitter */
	#define caribou_lib_lock()				caribou_thread_lock()
	#define	caribou_lib_unlock()			caribou_thread_unlock()
	#define	caribou_lib_lock_restore(n)		caribou_thread_unlock()
#endif

#ifdef __cplusplus
extern "C"
{
#endif

#ifndef ASSERT
#define ASSERT(x)
#endif

/******************************************************************************
* GPIO types
******************************************************************************/

#ifdef __cplusplus
}
#endif

#endif /* _CARIBOU_TYPES_H_ */
