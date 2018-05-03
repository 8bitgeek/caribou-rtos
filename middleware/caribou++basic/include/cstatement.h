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
#ifndef __CARIBOU_BASIC_STATEMENT_H__
#define __CARIBOU_BASIC_STATEMENT_H__

#include <cfunction.h>
#include <caribou++/clist.h>

namespace CARIBOU_BASIC
{
	class CStatement : public CFunction
	{
		public:
			CStatement(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority);
			virtual ~CStatement();

			virtual void 					interpret()	PURE_VIRTUAL
			virtual void					reset();

		protected:
			void							do_goto();
			void							do_print();
			void							do_if();
			void							do_let();
			void							do_gosub();
			void							do_return();
			void							do_for();
			void							do_end();
			void							do_next();
			void                			do_while();
			void                			do_do();
			void                			do_done();
			void							do_line();
			void							do_statement();
			virtual void					do_list();
			void							do_dump();
			void							do_run();
			void                			do_new();
			void                			do_clear();
			void                			do_bye();
			void                			do_rem();
			void							do_dim();
			void							do_dir();
		protected:
			typedef enum {
				ANY_FRAME,
				CALL_FRAME,
				FOR_FRAME,
				WHILE_FRAME,
			} t_frametype;
			typedef struct {
				t_frametype		frametype;
				void*			data;
			} t_stack_frame;
			typedef struct {
				CVariable*		control_variable;
				int				loop_lineno;
				double			to;
				double			step;
			} t_for_frame;

			int								push(t_frametype frametype, void* data, uint8_t size);
			int								pop(t_frametype frametype, void* data, uint8_t size);
			int								topframe(t_frametype frametype, void** data);

			virtual int						lineno()		PURE_VIRTUAL	// current line number
			virtual bool					interrupted()	PURE_VIRTUAL	// program break

		private:

			void							clear_stack();

			CARIBOU::CList<t_stack_frame*>	m_stack;
	};
} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_STATEMENT_H__
