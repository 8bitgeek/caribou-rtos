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
#ifndef __CARIBOU_BASIC_CCOMPILE_H__
#define __CARIBOU_BASIC_CCOMPILE_H__

#include <cbasic.h>
#include <caribou/lib/stdio.h>

namespace CARIBOU_BASIC
{
	class CCompile : public CBasic
	{
		public:
			CCompile(CARIBOU::CString& input,const char* name, stdio_t* io, uint16_t stksize=2048, uint16_t priority=1);
			virtual ~CCompile();

			virtual void		        reset();
			virtual void 			    interpret();
			virtual void                list();
			virtual	void				run()			{for(;;);}
			CARIBOU::CString&           output()        {return m_output;}
        protected:
            virtual CARIBOU::CString&   program();
            virtual bool                interrupted()   {return false;}
            virtual CARIBOU::CString    input()    		{return "\n";}
		private:
            CARIBOU::CString*           m_input;
            CARIBOU::CString            m_output;
	};

} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_CCOMPILE_H__
