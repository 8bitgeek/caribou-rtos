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
#ifndef __CARIBOU_BASIC_CEDITOR_H__
#define __CARIBOU_BASIC_CEDITOR_H__

#include <cbasic.h>
#include <caribou++/cstring.h>

namespace CARIBOU_BASIC
{
	class CEdit : public CBasic
	{
		public:
			CEdit(const char* name, stdio_t* io, uint16_t stksize=(1024*4), uint16_t priority=1);
			virtual ~CEdit();

			virtual void				reset();
			virtual void				interpret();
        protected:
            virtual CARIBOU::CString&	program();
            virtual bool				interrupted();
            virtual CARIBOU::CString	input();
            virtual void				do_list();
            virtual	bool				compile(CARIBOU::CString& output);

		private:

            void						delete_line(int offset);
			int							line_offset(int linenum);
			int							insert_offset(int linenum);
			void						place();
			void						read_line();
			char*						locate_insert_ptr(char* line);
			void						show_prompt();

			bool						m_running;
			CARIBOU::CString			m_command;
	};

} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_CEDITOR_H__
