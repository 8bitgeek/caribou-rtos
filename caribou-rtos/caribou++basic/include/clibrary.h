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
#ifndef _CARIBOU_BASIC_LIBRARY_H_
#define _CARIBOU_BASIC_LIBRARY_H_

#include <constants.h>
#include <caribou/lib/stdio.h>
#include <caribou++/clist.h>
#include <caribou++/cthread.h>
#include <caribou++/cmutex.h>

namespace CARIBOU_BASIC
{
	class CLibrary : public CARIBOU::CThread
	{
		public:
			CLibrary(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority);
			virtual ~CLibrary();

			typedef enum {
				RUNTIME_READY=0,
				RUNTIME_MISSING_LINENO,		// Line number does not exist
				RUNTIME_SYNTAX_ERROR,		// General syntax error
				RUNTIME_OPEN_QUOTE,			// Expected to find a quotation
				RUNTIME_UNEXPECTED_TOKEN,	// Unexpected token
				RUNTIME_STACK_OVERFLOW,		// Stack overflow
				RUNTIME_STACK_UNDERFLOW,	// GOSUB stack underflow
				RUNTIME_NUMBER_TOO_LONG,	// Number is too long
				RUNTIME_NUMBER_INVALID,		// Number is invalid
				RUNTIME_NO_SUCH_FUNCTION,	// No Such Function
				RUNTIME_LOW_MEMORY,			// Low memory
				RUNTIME_MISSING_RPAREN,     // Missing )
				RUNTIME_MISMATCH_CONTROL,   // Control variable mismatch
				RUNTIME_DIVIDE_BY_ZERO,     // Divide by Zero
				RUNTIME_IO_ERROR,           // Input/Output Error
				RUNTIME_INTERRUPTED,        // Interrupted
				RUNTIME_OUT_OF_RANGE,		// Out o Range
				RUNTIME_TYPE_MISMATCH,		// Type Mismatch
			} runtime_error_t;

			static void					print_prompt();
			static const char*			copyright();
			static const char*          license();
			static const char*			title();
			static const char*			version();
			static const char*			prompt();
			static const char*			csi();

			void						set_runtime_error(runtime_error_t e);
			runtime_error_t 			get_runtime_error();
			const char*					get_runtime_error_str();

			bool						set_ended(bool ended);
			bool						get_ended();

			static size_t               bytes_free();

			static CLibrary*			instance();

		private:
			bool						m_ended;
			runtime_error_t 			m_runtime_error;
			static CARIBOU::CList<CLibrary*> m_instance;
			static CARIBOU::CMutex		m_instance_mutex;
	};
} // namespace CARIBOU_BASIC

#endif // _CARIBOU_BASIC_LIBRARY_H_
