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
#ifndef __CARIBOU_BASIC_CVUE_H__
#define __CARIBOU_BASIC_CVUE_H__

#include <cbasic.h>
#include <caribou++/cstring.h>
#include <caribou++/cpoint.h>
#include <caribou++/crect.h>

namespace CARIBOU_BASIC
{
	class CVue : public CBasic
	{
		public:
			typedef enum
			{
				sgrReset=0,				/* all attributes off */
				sgrBold,
				sgrFaint,				/* not widely supported */
				sgrItalic,				/* not widely supported */
				sgrUnderline,
				sgrBlinkSlow,			/* less than 150 per minute */
				sgrBlinkRapid,			/* 150 per minute or more; not widely supported */
				sgrNegative,			/* inverse or reverse; swap foreground and background (reverse video) */
			} t_sgr;

			CVue(const char* name, stdio_t* io, uint16_t stksize=(1024*4), uint16_t priority=1);
			virtual ~CVue();

			virtual void				reset();
			virtual void				interpret();
        protected:
            virtual CARIBOU::CString&	program();
            virtual bool				interrupted();
            virtual CARIBOU::CString	input();
            virtual void				do_list();
            virtual	bool				compile(CARIBOU::CString& output);

			inline CARIBOU::CPoint		cursor()	{return m_cursor;}
			inline CARIBOU::CPoint		origin()	{return m_origin;}
			inline CARIBOU::CRect		viewport()	{return m_viewport;}
			inline CARIBOU::CRect		screen()	{return m_screen;}
			inline bool					insert()	{return m_insert;}

			CARIBOU::CString			status();

			void						ansiCUP(CARIBOU::CPoint pos);
			void						ansiCUP(int col, int row);
			void						ansiEID(char mode='2');
			void						ansiEIL(char mode='0');
			void						ansiSGR(t_sgr sgr=sgrReset);

			virtual void				update();

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

			CARIBOU::CPoint				m_cursor;		/* The cursor position within the text */
			CARIBOU::CPoint				m_origin;		/* The text origin(x,y) @ viewport(0,0) */
			CARIBOU::CRect				m_viewport;		/* The viewport relative to the screen */
			CARIBOU::CRect				m_screen;		/* The screen bounds */
			bool						m_insert;		/* Insert mode enabled */
	};

} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_CEDITOR_H__
