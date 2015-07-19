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
#include <cvariable.h>
#include <clibrary.h>
#include <cexpr.h>
#include <caribou++/cthread.h>

namespace CARIBOU_BASIC
{
	#define inherited CString

	CVariable::CVariable( CARIBOU::CString name, const int value )
	: inherited()
	, m_name(name.data())
	, m_type(CVariable::TYPE_AUTO)
	{
		fromInt(value);
		publish();
	}

	CVariable::CVariable( CARIBOU::CString name, const double value )
	: inherited()
	, m_name(name.data())
	, m_type(CVariable::TYPE_AUTO)
	{
		fromDouble(value);
		publish();
	}

	CVariable::CVariable( CARIBOU::CString name, CARIBOU::CString value )
	: inherited( value )
	, m_name(name.data())
	, m_type(CVariable::TYPE_AUTO)
	{
		publish();
	}

	CVariable::CVariable( const char* name, const int value )
	: inherited()
	, m_name(name)
	, m_type(CVariable::TYPE_AUTO)
	{
		fromInt(value);
		publish();
	}

	CVariable::CVariable( const char* name, const double value )
	: inherited()
	, m_name(name)
	, m_type(CVariable::TYPE_AUTO)
	{
		fromDouble(value);
		publish();
	}

	CVariable::CVariable( const char* name, const char* value )
	: inherited( value )
	, m_name(name)
	, m_type(CVariable::TYPE_AUTO)
	{
		publish();
	}


	CVariable::CVariable( const CVariable& other )
	: inherited( static_cast<const CARIBOU::CString&>(other) )
	{
		CVariable* p_other = (CVariable*)&other;
		m_type = p_other->type();
        m_name = owner()->autoname();
	}

	CVariable::~CVariable()
	{
		dispose();
	}

	CExpr* CVariable::owner()
	{
		CExpr* rc = (CExpr*)CARIBOU::CThread::current();
		return rc;
	}

	CVariable& CVariable::operator=( const CVariable& other )
	{
		m_type = other.m_type;
		if ( !copy(other) )
		{
		    CLibrary::instance()->set_runtime_error(CLibrary::RUNTIME_LOW_MEMORY);
		}
		return *this;
	}

	CVariable& CVariable::operator=( const double& other )
	{
		fromDouble(other);
		return *this;
	}


	CVariable& CVariable::operator=( const int& other )
	{
		fromInt(other);
		return *this;
	}

	CVariable& CVariable::operator=( const CARIBOU::CString& other )
	{
		if ( !copy(other) )
		{
		    CLibrary::instance()->set_runtime_error(CLibrary::RUNTIME_LOW_MEMORY);
		}
		return *this;
	}

	CVariable& CVariable::operator=( const char* data )
	{
		if ( !copy(data) )
		{
		    CLibrary::instance()->set_runtime_error(CLibrary::RUNTIME_LOW_MEMORY);
		}
		return *this;
	}

	void CVariable::publish()
	{
		owner()->variables().append(this);
	}

	void CVariable::dispose()
	{
		owner()->variables().take(owner()->variables().indexOf(this));
	}

	CARIBOU::CString& CVariable::name()
	{
		return m_name;
	}

    void CVariable::set_name(const char* name)
    {
        m_name = name;
    }

	void CVariable::set_name(CARIBOU::CString& name)
	{
		m_name = name;
	}

    /**
    * @brief Determin of this is an annonymous variable or a named variable.
    */
	bool CVariable::annonymous()
	{
	    bool rc = ( name().isEmpty() || strncmp(name().data(),AUTO_SIG,strlen(AUTO_SIG))==0 );
        return rc;
	}

	/**
	* @brief explicitly set the type.
	*/
	CVariable::type_t CVariable::set_type(type_t type)
	{
		m_type = type;
		return m_type;
	}

	/**
	* @brief If the type has been expicetly set, then return that, else auto.
	*/
	CVariable::type_t CVariable::type()
	{
		type_t rc = m_type;
		if ( rc == TYPE_AUTO )
		{
			if ( name().length() )
			{
				char suffix = name().at(name().length()-1);
				switch (suffix)
				{
					case '$': rc = TYPE_STRING;		break;
					case '#': rc = TYPE_INTEGER;	break;
					case '@': rc = TYPE_CHARCTER;	break;
					default:
						rc = TYPE_NUMBER;
						break;
				}
			}
		}
		return rc;
	}

	/**
	* @brief Shift Left
	*/
	void CVariable::shl(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		fromUInt( toUInt() << p->toUInt() );
	}


	/**
	* @brief Shift Right
	*/
	void CVariable::shr(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		fromUInt( toUInt() >> p->toUInt() );
	}

	/**
	* @brief Bitwise AND
	*/
	void CVariable::bitwiseAnd(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		fromUInt( toUInt() & p->toUInt() );
	}


	/**
	* @brief Bitwise OR
	*/
	void CVariable::bitwiseOr(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		fromUInt( toUInt() | p->toUInt() );
	}

	/**
	* @brief Bitwise XOR
	*/
	void CVariable::bitwiseXor(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		fromUInt( toUInt() ^ p->toUInt() );
	}

	/**
	* @brief Add the other variable
	* @return true of went well, otherwise false
	*/
	void CVariable::add(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		switch(type())
		{
			case TYPE_CHARCTER:
				fromUInt( (character() + p->character()) & 0xFF );
				break;
			case TYPE_INTEGER:
				fromUInt( toUInt() + p->toUInt() );
				break;
			case TYPE_STRING:
				append( p->data() );
				break;
			case TYPE_NUMBER:
			case TYPE_AUTO:
			default:
				fromDouble( toDouble() + p->toDouble() );
				break;;
		}
	}


	/**
	* @brief Subtract the other variable
	* @return true of went well, otherwise false
	*/
	void CVariable::subtract(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		switch(type())
		{
			case TYPE_CHARCTER:
				fromUInt( (character() + p->character()) & 0xFF );
				break;
			case TYPE_INTEGER:
				fromUInt( toUInt() - p->toUInt() );
				break;
			case TYPE_STRING:
				replace( p->data(), CARIBOU::CString(""), 0);
				break;
			case TYPE_NUMBER:
			case TYPE_AUTO:
			default:
				fromDouble( toDouble() - p->toDouble() );
				break;;
		}
	}

	/**
	* Determine the logic state of the variable.
	*/
	bool CVariable::logicState()
	{
		bool rc=false;
		switch(type())
		{
			case TYPE_CHARCTER:
				rc = character() != '\0';
				break;
			case TYPE_INTEGER:
				rc = toInt() != 0;
				break;
			case TYPE_STRING:
				rc = !isEmpty();
				break;
			case TYPE_NUMBER:
			case TYPE_AUTO:
			default:
				rc = toDouble() != 0.0;
				break;;
		}
		return rc;
	}

	bool CVariable::logicAnd(const CVariable& other)
	{
	    bool rc;
		CVariable* p = (CVariable*)&other;
		rc = logicState() && p->logicState();
		copy( rc ? "1" : "0" );
		set_type(TYPE_INTEGER);
		return rc;
	}

	bool CVariable::logicOr(const CVariable& other)
	{
	    bool rc;
		CVariable* p = (CVariable*)&other;
		rc = logicState() || p->logicState();
		copy( rc ? "1" : "0" );
		set_type(TYPE_INTEGER);
		return rc;
	}

	int CVariable::compare(const CVariable& other)
	{
		CVariable* p = (CVariable*)&other;
		int rc=0;
		switch(type())
		{
			case TYPE_STRING:
				rc = compare( *p );
				break;
			case TYPE_CHARCTER:
				rc = (int)character() - (int)p->character();
				break;
			case TYPE_INTEGER:
				rc = toInt() - p->toInt();
				break;
			case TYPE_AUTO:
			case TYPE_NUMBER:
			default:
				if ( toDouble() < p->toDouble() )
					rc = -1;
				else if ( toDouble() > p->toDouble() )
					rc = 1;
				break;
		}
		return rc;
	}

	/**
	* Return character data as an 8 bit int.
	*/
	const uint8_t CVariable::character()
	{
		if ( !isEmpty() )
		{
			return data()[0];
		}
		return '\0';
	}


} // namespace CARIBOU_BASIC
