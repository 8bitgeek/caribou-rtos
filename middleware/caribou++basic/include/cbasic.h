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
#ifndef __CARIBOU_BASIC_CBASIC_H__
#define __CARIBOU_BASIC_CBASIC_H__

#include <constants.h>
#include <cvariable.h>
#include <cstatement.h>
#include <caribou/lib/stdio.h>
#include <caribou++/cthread.h>

namespace CARIBOU_BASIC
{
	class CBasic : public CStatement
	{
		public:
			CBasic(const char* name, stdio_t* io, uint16_t stksize=(1024*4), uint16_t priority=1);
			virtual ~CBasic();

			virtual void						reset();
			virtual void						interpret();
			virtual	void						run();
		protected:
			stdio_t*							io();
			virtual bool						finished();
			virtual int							lineno();
		private:
			stdio_t*							m_io;
			int									m_lineno;

	};
} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_CBASIC_H__
