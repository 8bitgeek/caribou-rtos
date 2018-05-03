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
#ifndef CARIBOUSTDARG_H_
#define CARIBOUSTDARG_H_

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

#ifdef USE_NATIVE_STDARG
	#include <stdarg.h>
#else
	/* The version assumes all arguments are on the stack */
	typedef char* va_list;
	#define _INTSIZEOF(n) ( (sizeof(n) + sizeof(int) - 1) & ~(sizeof(int) - 1) )
	#define va_start(ap,v)(ap=(va_list)&v+_INTSIZEOF(v))
	#define va_arg(ap,t)(*(t*)((ap +=_INTSIZEOF(t))-_INTSIZEOF(t)))
	#define va_end(ap) ( ap = (va_list)0)

#endif

#ifdef __cplusplus
}
#endif

#endif
