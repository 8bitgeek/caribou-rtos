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
#ifndef __CARIBOU_BASIC_VARIABLE_H__
#define __CARIBOU_BASIC_VARIABLE_H__

#include <caribou++/cstring.h>
#include <caribou++/clist.h>
#include <caribou++/cmap.h>
#include <caribou++/cthread.h>
#include <caribou++/cmutex.h>

#define AUTO_SIG "#"

namespace CARIBOU_BASIC
{
	class CExpr;
	class CVariable : public CARIBOU::CString
	{
		public:
			typedef enum
			{
				TYPE_AUTO=0,	    // automatically determined by suffix
				TYPE_STRING,	    // string (auto='$')
				TYPE_NUMBER,	    // real number (default)
				TYPE_INTEGER,	    // integer (auto='#')
				TYPE_CHARCTER,	    // char (auto='@')
                TYPE_DIM_AUTO,      // dimensioned auto
                TYPE_DIM_STRING,    // dimensioned string
                TYPE_DIM_NUMBER,    // dimensioned number
                TYPE_DIM_INTEGER,   // dimensioned integer
                TYPE_DIM_CHARACTER,	// dimensioned character
			} type_t;
			CVariable( CARIBOU::CString name, const int value=0 );
			CVariable( CARIBOU::CString name, const double value );
			CVariable( CARIBOU::CString name, CARIBOU::CString value );
			CVariable( const char* name, const int value );
			CVariable( const char* name, const double value );
			CVariable( const char* name, const char* value );
			CVariable( const CVariable& other );
			virtual ~CVariable();

			virtual bool			            is_dim() {return false;}

			CVariable&				            operator=( const double& other );
			CVariable&				            operator=( const int& other );
			CVariable&				            operator=( const CVariable& other );
			CVariable&				            operator=( const CARIBOU::CString& other );
			CVariable&				            operator=( const char* data );

            void                                shl( const CVariable& other );
            void                                shr( const CVariable& other );
			void					            add( const CVariable& other );
			void					            subtract( const CVariable& other );
			bool					            logicState();
			bool					            logicAnd( const CVariable& other );
			bool					            logicOr( const CVariable& other );
			void					            bitwiseAnd( const CVariable& other );
			void					            bitwiseOr( const CVariable& other );
			void					            bitwiseXor( const CVariable& other );
			int						            compare( const CVariable& other );

			bool					            annonymous();
			CARIBOU::CString&		            name();
			void					            set_name(const char* name);
			void					            set_name(CARIBOU::CString& name);
			type_t					            set_type(type_t type);
			virtual type_t			            type();

		protected:
			CExpr*								owner();
			const uint8_t			            character();
			void					            publish();
			virtual void			            dispose();

		protected:
			CARIBOU::CString		            m_name;
			type_t					            m_type;
	};
} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_VARIABLE_H__
