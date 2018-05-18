/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
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
#ifndef __CARIBOU_BASIC_FUNCTION_H__
#define __CARIBOU_BASIC_FUNCTION_H__

#include <constants.h>
#include <cexpr.h>
#include <cvariable.h>
#include <caribou++/clist.h>

namespace CARIBOU_BASIC
{
	class CFunction : public CExpr
	{
		public:
			CFunction(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority);
			virtual ~CFunction();

            void                srand(uint32_t seed);    // random number seed

		protected:
            virtual CARIBOU::CString	input()     PURE_VIRTUAL
			CVariable&					fnfactor(CVariable& t1);
			CVariable					fn_abs();
			CVariable					fn_hex();
			CVariable					fn_val();
			CVariable					fn_usr();
			CVariable					fn_poke();
			CVariable					fn_peek();
			CVariable					fn_left();
			CVariable					fn_right();
			CVariable					fn_mid();
			CVariable					fn_int();
			CVariable					fn_len();
			CVariable					fn_pi();
			CVariable					fn_mod();
            CVariable					fn_sin();
            CVariable					fn_cos();
            CVariable					fn_tan();
            CVariable					fn_free();
            CVariable					fn_input();
            CVariable					fn_rand();
            CVariable					fn_srand();
            CVariable					fn_chr();
            CVariable					fn_sleep();
		private:
            #if defined(__STM32__)
            CVariable            fn_pin();
            CVariable            fn_in();
            CVariable            fn_out();
            uint32_t            gpio_port(uint32_t port);
            GPIO_TypeDef*       gpio_port_ptr(uint32_t);
            uint32_t            gpio_mode(uint32_t mode);
            #endif // __STM32__
			int                 		fn_enter(int min=0,int max=0);
			void	            		fn_exit(int args=0);
		private:
            uint16_t            		rand();
            uint32_t            		m_rand_next;
			CARIBOU::CList<CVariable*>	m_arguments;
	};
} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_FUNCTION_H__
