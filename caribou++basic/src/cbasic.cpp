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
#include <cbasic.h>

namespace CARIBOU_BASIC
{
	#define inherited CStatement

	CBasic::CBasic(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
	, m_io(io)
	, m_lineno(0)
	{
	}

	CBasic::~CBasic()
	{
	}

	void CBasic::reset()
	{
		inherited::reset();
		m_lineno=0;
		set_runtime_error( RUNTIME_READY );
	}

	void CBasic::interpret(void)
	{
		reset();
		while(!finished())
		{
			m_lineno = integer();
			do_line();
		}
	}

	bool CBasic::finished(void)
	{
		return get_ended() || CTokenizer::finished();
	}

	int CBasic::lineno()
	{
		return m_lineno;
	}

	void CBasic::run()
	{
		interpret();
	}

	stdio_t* CBasic::io()
	{
		return m_io;
	}


} // namespace CARIBOU_BASIC

