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
#include <clibrary.h>
#include <constants.h>
#include <caribou/lib/string.h>
#include <caribou++/cthread.h>

namespace CARIBOU_BASIC
{
	#define inherited CARIBOU::CThread
	CARIBOU::CList<CLibrary*>	CLibrary::m_instance;
	CARIBOU::CMutex				CLibrary::m_instance_mutex;

	CLibrary::CLibrary(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,stksize,priority)
	, m_ended(false)
	, m_runtime_error(RUNTIME_READY)
	{
		m_instance_mutex.lock();
		m_instance.append(this);
		m_instance_mutex.unlock();
	}

	CLibrary::~CLibrary()
	{
		m_instance_mutex.lock();
		m_instance.take(m_instance.indexOf(this));
		m_instance_mutex.unlock();
	}

	/**
	* Return a library instance from the current thread
	*/
	CLibrary* CLibrary::instance()
	{
		int n;
		CLibrary* thread;
		m_instance_mutex.lock();
		for(int n=0; n < m_instance.count(); n++)
		{
			thread = m_instance.at(n);
			if ((CARIBOU::CThread*)thread == CARIBOU::CThread::current())
			{
				m_instance_mutex.unlock();
				return thread;
			}
		}
		m_instance_mutex.unlock();
		return NULL;
	}

	void CLibrary::set_runtime_error(runtime_error_t e)
	{
		m_ended = false;
		if (!m_runtime_error || !e) // don't overwrite previous error (FIXME make a error history stack?)
            m_runtime_error = e;
		if (m_runtime_error)
			m_ended = true;
	}

	CLibrary::runtime_error_t CLibrary::get_runtime_error()
	{
		return m_runtime_error;
	}

	bool CLibrary::set_ended(bool ended)
	{
		m_ended = ended;
	}

	bool CLibrary::get_ended()
	{
		return m_ended;
	}

	const char* CLibrary::get_runtime_error_str()
	{
		char* str = "";
		switch(get_runtime_error())
		{
			case RUNTIME_READY:				str = "Ready\n";				        break;
			case RUNTIME_MISSING_LINENO:	str = "No Such Line #\n";		        break;
			case RUNTIME_SYNTAX_ERROR:		str = "Syntax Error\n";			        break;
			case RUNTIME_OPEN_QUOTE:		str = "Quotation Mismatch\n";	        break;
			case RUNTIME_UNEXPECTED_TOKEN:	str = "Unexpected Token\n";		        break;
			case RUNTIME_STACK_OVERFLOW:	str = "Stack Overflow\n";		        break;
			case RUNTIME_STACK_UNDERFLOW:	str = "Stack Underflow\n";		        break;
			case RUNTIME_NUMBER_TOO_LONG:	str = "Number too long\n";		        break;
			case RUNTIME_NUMBER_INVALID:	str = "Number Invalid\n";		        break;
			case RUNTIME_NO_SUCH_FUNCTION:	str = "No Such Function\n";		        break;
			case RUNTIME_LOW_MEMORY:		str = "Low Memory\n";			        break;
			case RUNTIME_MISSING_RPAREN:	str = "Missing ')'\n";			        break;
			case RUNTIME_MISMATCH_CONTROL:  str = "Control Variable Mismatch\n";    break;
			case RUNTIME_DIVIDE_BY_ZERO:    str = "Divide By Zero\n";               break;
			case RUNTIME_IO_ERROR:          str = "Input / Output Error\n";         break;
			case RUNTIME_INTERRUPTED:       str = "Interrupted\n";                  break;
			case RUNTIME_OUT_OF_RANGE:		str = "Out Of Range\n";					break;
			case RUNTIME_TYPE_MISMATCH:		str = "Type Mismatch\n";				break;
		}
		return str;
	}

	const char* CLibrary::copyright()
	{
		return COPYRIGHT_STRING;
	}

	const char* CLibrary::title()
	{
		return TITLE_STRING;
	}

	const char* CLibrary::version()
	{
		return VERSION_STRING;
	}

	const char* CLibrary::prompt()
	{
		return PROMPT_STRING;
	}

	const char* CLibrary::license()
	{
	    return LICENSE_STRING;
	}

	const char* CLibrary::csi()
	{
		return "\033[";
	}

	size_t CLibrary::bytes_free()
	{
#if !defined(DESKTOP_OS)
	    return heap_bytes_free();
#endif
        return 0xFFFF;
	}

} // namespace CARIBOU_BASIC
