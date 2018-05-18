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
#ifndef __CARIBOU_BASIC_CEXPR_H__
#define __CARIBOU_BASIC_CEXPR_H__

#include <constants.h>
#include <cvariable.h>
#include <cdimvariable.h>
#include <ctokenizer.h>

namespace CARIBOU_BASIC
{
	class CExpr : public CTokenizer
	{
    		friend class CVariable;
		public:
			CExpr(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority);
			virtual ~CExpr();

			virtual void		reset();

		protected:
			CVariable			eval();
			CARIBOU::CList<CVariable*>&	variables();
			CVariable*			find(CARIBOU::CString& name);
            CVariable*			set(CARIBOU::CString name, CVariable* value);
			CVariable*			set(CARIBOU::CString name, CARIBOU::CString value);
			CVariable*			get(CARIBOU::CString name);
			CARIBOU::CString	autoname();
			virtual void		clear();
		private:
			virtual CVariable&	fnfactor(CVariable& t1)	PURE_VIRTUAL
			CVariable&			varfactor(CVariable& t1);
			CVariable&			factor(CVariable& t1);
			CVariable&			level12(CVariable& t1);
			CVariable&			level11(CVariable& t1);
			CVariable&			level10(CVariable& t1);
			CVariable&			level9(CVariable& t1);
			CVariable&			level8(CVariable& t1);
			CVariable&			level7(CVariable& t1);
			CVariable&			level6(CVariable& t1);
			CVariable&			level5(CVariable& t1);
			CVariable&			level4(CVariable& t1);
			CVariable&			level3(CVariable& t1);
			CVariable&			level2(CVariable& t1);
			CVariable&			level1(CVariable& t1);
		private:
            CARIBOU::CList<CVariable*>	m_variables;
			uint32_t			m_autonum;
	};
} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_CEXPR_H__
