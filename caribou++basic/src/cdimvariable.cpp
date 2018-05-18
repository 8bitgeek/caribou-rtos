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
#include <cdimvariable.h>
#include <clibrary.h>

namespace CARIBOU_BASIC
{
	#define inherited CVariable

	CDimVariable::CDimVariable( CARIBOU::CString name )
	: inherited(name.data(),"")
	{
		set_type(TYPE_DIM_AUTO);
	}

	CDimVariable::CDimVariable( const CDimVariable& other )
	: inherited( static_cast<const inherited&>(other) )
	{
		CDimVariable* p_other = (CDimVariable*)&other;
		if ( p_other != this )
		{
			private_copy(p_other);
		}
	}

	CDimVariable::~CDimVariable()
	{
		dispose();
	}

	void CDimVariable::private_copy(CDimVariable* p_other)
	{
		int n;
		if ( p_other != this )
		{
			dispose();
			// copy the value strings..
			for(n=0;n<p_other->m_values.count();n++)
			{
				if ( !m_values.append( p_other->m_values.at(n) ? new CARIBOU::CString( *p_other->m_values.at(n) ) : NULL ) )
				{
					CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_LOW_MEMORY );
					return;
				}
			}
			// copy the dimensions.
			for(n=0;n<p_other->m_dimensions.count();n++)
			{
				if ( !m_dimensions.append(p_other->m_dimensions.at(n)) )
				{
					CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_LOW_MEMORY );
					return;
				}
			}
		}
	}

	CVariable& CDimVariable::operator=( const CDimVariable& other )
	{
		CDimVariable* p_other = (CDimVariable*)&other;
		if ( p_other != this )
		{
			private_copy(p_other);
		}
		return *this;
	}

	void CDimVariable::dispose()
	{
		int sz = m_values.size();
		for(int n=sz-1;n>=0;n--)
		{
			CARIBOU::CString* value = m_values.take(n);
			if ( value )
			{
				delete value;
			}
		}
		m_values.clear();
		m_offsets.clear();
		m_dimensions.clear();
	}

	/**
	* @brief If the type has been expicetly set, then return that, else auto.
	*/
	CDimVariable::type_t CDimVariable::type()
	{
		type_t rc = m_type;
		if ( rc == TYPE_DIM_AUTO )
		{
			if ( name().length() )
			{
				char suffix = name().at(name().length()-1);
				switch (suffix)
				{
					case '$': rc = TYPE_DIM_STRING;		break;
					case '#': rc = TYPE_DIM_INTEGER;	break;
					case '@': rc = TYPE_DIM_CHARACTER;	break;
					default:
						rc = TYPE_DIM_NUMBER;
						break;
				}
			}
		}
		return rc;
	}

	/**
	* @brief Push a dimension offset.
	*/
	void CDimVariable::push(size_t offset)
	{
		if ( !m_offsets.append(offset) )
		{
			CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_LOW_MEMORY );
		}
	}

	/**
	* @brief Pop a dimension offset.
	*/
	void CDimVariable::pop()
	{
		if ( m_offsets.count() )
		{
			m_offsets.take(m_offsets.count()-1);
		}
		else
		{
			CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_STACK_UNDERFLOW );
		}
	}

	/**
	* @brief Pop the whole offset frame.
	*/
	void CDimVariable::pop_frame()
	{
		while( m_offsets.count() )
		{
			m_offsets.take(m_offsets.count()-1);
		}
	}

	/**
	* @return The number of offsets on the stack
	*/
	size_t CDimVariable::offsets()
	{
		return m_offsets.count();
	}


	/**
	* @brief Value storage is allocated on demand. If the value is not already stored,
	* then instantiate it. In either case, return a pointer to the value string.
	* @return A pointer to the value string or NULL if there was a problem.
	*/
	CARIBOU::CString* CDimVariable::value(size_t offset)
	{
		CARIBOU::CString* rc = NULL;
		if ( offset >= 0 && offset < max_offset() )
		{
			if ( !m_values.at(offset) )				// has the sub-variable been initialized yet?
			{
				if ( (rc=new CARIBOU::CString()) )
				{
					m_values.set(offset,rc);		// initialize it.
				}
			}
			if ( !(rc=m_values.at(offset)) )
			{
				CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_LOW_MEMORY );
			}
		}
		else
		{
			CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_OUT_OF_RANGE );
		}
		return rc;
	}

	/**
	* @return the value from the pushed offsets.
	*/
	CARIBOU::CString* CDimVariable::value()
	{
		CARIBOU::CString* rc = NULL;
		int i = offset();
		if ( i < max_offset() )
		{
			rc = value(i);
		}
		return rc;
	}

	/**
	* Append a new dimension of magnitude @arg dim
	*/
	bool CDimVariable::new_dimension(size_t mag)
	{
		int i = m_values.size();
		m_dimensions.append(mag);
		m_values.resize(m_values.size()+mag);
		for(int n=i; n < m_values.size();n++)
		{
			m_values.set(n,NULL);
		}
	}

	/**
	* @return The number of dimensions
	*/
	size_t CDimVariable::dimensions()
	{
		return m_dimensions.count();
	}

	/**
	* @return The magnitude of the dimension @arg n
	*/
	size_t CDimVariable::dimension(size_t n)
	{
		return m_dimensions.at(n);
	}

	/**
	* Calcul;ate the offset fro the stacked offsets
	*/
	size_t CDimVariable::offset()
	{
		size_t rc=0;
		for(int n=0; n < m_offsets.count();n++)
		{
			rc += m_offsets.at(n);
		}
		return rc;
	}

	/**
	* @brief Calculate the maximum offset
	*/
	size_t CDimVariable::max_offset()
	{
		int rc=0;
		for( int n=0;n<m_dimensions.count();n++)
		{
			rc += m_dimensions.at(n);
		}
		return rc;
	}

} // namespace CARIBOU_BASIC
