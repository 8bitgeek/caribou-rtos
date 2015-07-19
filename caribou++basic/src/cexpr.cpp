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
#include <cexpr.h>

namespace CARIBOU_BASIC
{
	#define inherited CTokenizer

	CExpr::CExpr(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
    , m_autonum(0)
	{
	}

	CExpr::~CExpr()
	{
		clear();
    	m_variables.dispose();
	}

	void CExpr::reset()
	{
		inherited::reset();
	}

	/**
	* Locate a variable.
	*/
	CVariable& CExpr::varfactor(CVariable& t1)
	{
		CVariable* target;
		if ( (target=get(variable_name())) )
		{
            accept(TOKEN_VARIABLE);
			if ( target->is_dim() )
			{
				if ( token() == TOKEN_LBRACKET )
				{
					int offset;
					do
					{
						accept(token());
						offset = eval().toInt();
						static_cast<CDimVariable*>(target)->push(offset);
					} while(!finished() && token() == TOKEN_COMMA);
					if ( accept( TOKEN_RBRACKET ) )
					{
						CARIBOU::CString* value = static_cast<CDimVariable*>(target)->value();
						if ( value )
						{
							t1 = *value;
						}
					}
					static_cast<CDimVariable*>(target)->pop_frame();
				}
			}
			else
			{
				t1 = *target;
			}
		}
		return t1;
	}

	CVariable& CExpr::factor(CVariable& t1)
	{
		switch(token())
		{
			case TOKEN_NUMBER:
				t1.fromDouble(number());
				accept(TOKEN_NUMBER);
			break;
			case TOKEN_STRING:
				t1 = string();
				accept(TOKEN_STRING);
			break;
			case TOKEN_LPAREN:
				accept(TOKEN_LPAREN);
				t1 = eval();
				accept(TOKEN_RPAREN);
			break;
			case TOKEN_VARIABLE:
				varfactor(t1);
				break;
			default:
				fnfactor(t1);
			break;
		}
		return t1;
	}

	/**
	* @brief Brackets
	*/
	CVariable& CExpr::level12(CVariable& t1)
	{
		token_t op = token();
		if(op == TOKEN_LPAREN)
		{
			next();
			level1(t1);
			op = token();
			if ( op != TOKEN_RPAREN )
			{
				set_runtime_error( RUNTIME_MISSING_RPAREN );
			}
			next();
			return t1;
		}
		return factor(t1);
	}

	/**
	* @brief Unary plus, minus, logical not, bitwise not
	*/
	CVariable& CExpr::level11(CVariable& t1)
	{
		token_t op = token();
		if ( op == TOKEN_TILDE || op == TOKEN_BANG || op == TOKEN_LOGICNOT || op == TOKEN_PLUS || op == TOKEN_MINUS )
        {
            token_t op = token();
            next();
            level1(t1);
            switch(op)
            {
                case TOKEN_TILDE:
                    t1.fromUInt( ~t1.toUInt() );
                    break;
                case TOKEN_LOGICNOT:
                case TOKEN_BANG:
                    t1.fromUInt( !t1.toUInt() );
                    break;
                case TOKEN_PLUS:
                    t1.fromDouble( 0.0 + t1.toDouble() );
                    break;
                case TOKEN_MINUS:
                    t1.fromDouble( 0.0 - t1.toDouble() );
                    break;
            }
            return t1;
        }
        level12(t1);
        return t1;
	}


	/**
	* @brief Multiplication Division and Modulus
	*/
	CVariable& CExpr::level10(CVariable& t1)
	{
		level11(t1);
		token_t op = token();
		while(op == TOKEN_ASTR || op == TOKEN_SLASH || op == TOKEN_MOD)
		{
			next();
            CVariable t2(autoname());
			level11(t2);
			switch(op)
			{
				case TOKEN_ASTR:
					t1.fromDouble( t1.toDouble() * t2.toDouble() );
					break;
				case TOKEN_SLASH:
                    if ( t2.toDouble() != 0.0 )
                    {
                        t1.fromDouble( t1.toDouble() / t2.toDouble() );
                    }
                    else
                    {
                        set_runtime_error( RUNTIME_DIVIDE_BY_ZERO );
                    }
					break;
				case TOKEN_MOD:
					t1.fromDouble( t1.toInt() % t2.toInt() );
					break;
			}
			op = token();
		}
		return t1;
	}

	/**
	* @brief Addition and Subtraction
	*/
	CVariable& CExpr::level9(CVariable& t1)
	{
		level10(t1);
		token_t op = token();
		while(op == TOKEN_PLUS || op == TOKEN_MINUS)
		{
			next();
			CVariable t2(autoname());
			level10(t2);
			if ( op == TOKEN_PLUS )
				t1.add( t2 );
			else if ( op == TOKEN_MINUS )
				t1.subtract( t2 );
			op = token();
		}
		return t1;
	}

    /**
    * @brief Bitwise left shift and right shift
    */
    CVariable& CExpr::level8(CVariable& t1)
    {
		level9(t1);
		token_t op = token();
		while(op == TOKEN_SHL || op == TOKEN_SHR)
		{
			next();
			CVariable t2(autoname());
			level9(t2);
			if ( op == TOKEN_SHL )
				t1.shl( t2 );
			else if ( op == TOKEN_SHR )
				t1.shr( t2 );
			op = token();
		}
		return t1;
    }

	/**
	* @brief Magnitude comparators >=, <= <, >
	*/
	CVariable& CExpr::level7(CVariable& t1)
	{
		level8(t1);
		token_t op = token();
		while(op == TOKEN_LT || op == TOKEN_GT || op == TOKEN_LE || op == TOKEN_GE )
		{
			next();
			CVariable t2(autoname());
			level8(t2);
			switch(op) {
				case TOKEN_LT:
					t1.fromInt( t1.compare( t2 ) < 0 );
					break;
				case TOKEN_LE:
					t1.fromInt( t1.compare( t2 ) <= 0 );
					break;
				case TOKEN_GT:
					t1.fromInt( t1.compare( t2 ) > 0 );
					break;
				case TOKEN_GE:
					t1.fromInt( t1.compare( t2 ) >= 0 );
					break;
			}
			op = token();
		}
		return t1;
	}

	/**
	* @brief Logic Equality and Inequality
	*/
	CVariable& CExpr::level6(CVariable& t1)
	{
		level7(t1);
		token_t op = token();
		while(op == TOKEN_EQ || op == TOKEN_NE)
		{
			next();
            CVariable t2(autoname());
			level7(t2);
			if ( op == TOKEN_EQ )
				t1.fromInt( t1.compare( t2 ) == 0 );
			else if ( op == TOKEN_NE )
				t1.fromInt( t1.compare( t2 ) != 0 );
			op = token();
		}
		return t1;
	}

    /**
    * Bitwise AND
    */
    CVariable& CExpr::level5(CVariable& t1)
    {
		level6(t1);
        token_t op = token();
        while(op == TOKEN_BITWISEAND)
        {
            next();
            CVariable t2(autoname());
			level6(t2);
            t1.bitwiseAnd( t2 );
            op = token();
        }
        return t1;
    }

    /**
    * Bitwise XOR
    */
    CVariable& CExpr::level4(CVariable& t1)
    {
		level5(t1);
        token_t op = token();
        while(op == TOKEN_BITWISEXOR)
        {
            next();
            CVariable t2(autoname());
			level5(t2);
            t1.bitwiseXor(t2);
            op = token();
        }
        return t1;
    }

    /**
    * Bitwise OR
    */
    CVariable& CExpr::level3(CVariable& t1)
    {
		level4(t1);
        token_t op = token();
        while(op == TOKEN_BITWISEOR)
        {
            next();
            CVariable t2(autoname());
			level4(t2);
            t1.bitwiseOr(t2);
            op = token();
        }
        return t1;
    }

	/**
	* @brief Logic AND
	*/
	CVariable& CExpr::level2(CVariable& t1)
	{
		level3(t1);
		token_t op = token();
		while(op == TOKEN_LOGICAND)
		{
			next();
			CVariable t2(autoname());
			level3(t2);
			t1.logicAnd(t2);
			op = token();
		}
		return t1;
	}

	/**
	* @brief Logic OR
	*/
	CVariable& CExpr::level1(CVariable& t1)
	{
		level2(t1);
		token_t op = token();
		while(op == TOKEN_LOGICOR)
		{
			next();
			CVariable t2(autoname());
			level2(t2);
			t1.logicOr(t2);
			op = token();
		}
		return t1;
	}

	/**
	* @brief Evaluate an expression
	*/
	CVariable CExpr::eval()
	{
		CVariable t1(autoname());
		level1(t1);
		return t1;
	}

	CARIBOU::CList<CVariable*>&	CExpr::variables()
	{
		return m_variables;
	}

	/**
	* @brief Find the variable by name and return the pointer
	*/
	CVariable* CExpr::find(CARIBOU::CString& name)
	{
		for(int n=0; n < variables().count(); n++)
		{
			CVariable* other = variables().at(n);
			if ( other->name() == name )
			{
				return other;
			}
		}
		return NULL;
	}
	/**
	* @brief Set a variable by name, if the variable does not exist, create it.
	* @param name The name of the variable.
	* @param value The value of the variable.
	* @return A pointer to the variable
	*/
	CVariable* CExpr::set(CARIBOU::CString name, CARIBOU::CString value)
	{
		CVariable* rc=find(name);
		if ( rc )
		{
			rc->strcpy( value.isNull() ? "" : value.data() );
		}
		else
		{
			if ( name.isEmpty() )
				rc = new CVariable(autoname().data(),value.data());
			else
				rc = new CVariable(name,value);
			if ( !rc )
				CLibrary::instance()->set_runtime_error( CLibrary::RUNTIME_LOW_MEMORY );
		}
		return rc;
	}

	CVariable* CExpr::set(CARIBOU::CString name, CVariable* value)
	{
		return set(name, *value);
	}


	/**
	* @brief Get a poiunter to a variable, and create and empty variable if it does not exist.
	* @param name The name of the variable to get.
	* @return A pointer to the variable or NULL.
	*/
	CVariable* CExpr::get(CARIBOU::CString name)
	{
		CVariable* rc = find (name);
		if (!rc )
		{
			return set(name,"");
		}
		return rc;
	}

	/**
	* @brief Produce a name for an automatic variable
	* @return a unique string.
	*/CARIBOU::CString CExpr::autoname()
	{
		CARIBOU::CString rc;
		CARIBOU::CString num;
		do
		{
			rc = AUTO_SIG;
			rc += num.toHex( m_autonum++ );
		} while (find(rc));
		return rc;
	}

	/**
	* @brief Clear the variables
	*/
	void CExpr::clear()
	{
		int cnt=variables().count();
		for(int n=0;n<cnt;n++)
		{
			CVariable* var = variables().take(0);
			if ( var->name().left(strlen(AUTO_SIG)) != AUTO_SIG )
			{
				delete var;
			}
		}
	}

} // namespace CARIBOU_BASIC

