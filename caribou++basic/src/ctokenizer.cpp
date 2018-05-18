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
#include <ctokenizer.h>
#include <caribou/lib/cbmath.h>

#define isdigit(d) ( d>='0' && d<='9' )

namespace CARIBOU_BASIC
{
	#define inherited CLibrary

	const CTokenizer::keyword_token_t CTokenizer::m_keywords[] =
	{
        {"IN(", 		TOKEN_FN_IN	    }, /// IN#(PORT#,PIN#)
        {"OUT(",		TOKEN_FN_OUT	}, /// OUT#(PORT#,PIN#,STATE);
        {"PEEK(",		TOKEN_FN_PEEK	}, /// PEEK#(ADDR)
        {"POKE(",		TOKEN_FN_POKE	}, /// POKE#(ADDR,DATA)
        {"BYE",		    TOKEN_BYE       },
        {"CLEAR",		TOKEN_CLEAR     },
        {"ABS(",        TOKEN_FN_ABS    }, /// ABS(N)
        {"COS(",        TOKEN_FN_COS    }, /// COS(NUM)
        {"DIR",        	TOKEN_DIR      	}, /// DIR
        {"DIM",        	TOKEN_DIM      	}, /// DIM <var>[n]
        {"DONE",        TOKEN_DONE      }, /// WHILE...DO...DONE
        {"DO",          TOKEN_DO        }, /// WHILE...DO...DONE
        {"DUMP",		TOKEN_DUMP		},
        {"ELSE", 		TOKEN_ELSE		},
        {"END", 		TOKEN_END		},
        {"FOR", 		TOKEN_FOR		},
        {"GOSUB", 		TOKEN_GOSUB		},
        {"GOTO", 		TOKEN_GOTO		},
        {"INT(",		TOKEN_FN_INT	}, /// INT()
        {"FREE(",		TOKEN_FN_FREE	}, /// FREE()
        {"HEX$(",		TOKEN_FN_HEX	}, /// HEX$(NUM)
        {"CHR$(",		TOKEN_FN_CHR	}, /// CHR$(NUM)
        {"VAL(",		TOKEN_FN_VAL	}, /// VAL(STR$)
        {"IF", 			TOKEN_IF		},
        {"PIN(",		TOKEN_FN_PIN	}, /// PIN(PORT#,PIN#,MODE)
        {"LEFT$(",		TOKEN_FN_LEFT	}, /// LEFT$(STR$,NUM)
        {"LEN(",        TOKEN_FN_LEN    }, /// LEN(STR$)
        {"LET",			TOKEN_LET		},
        {"LIST",		TOKEN_LIST		},
        {"MID$(",		TOKEN_FN_MID    }, /// MID$(STR$,AT,LEN)
        {"MOD(",		TOKEN_FN_MOD    }, /// MOD#(NUM,NUM)
        {"NEW",			TOKEN_NEW       },
        {"NEXT", 		TOKEN_NEXT		},
        {"PI(",         TOKEN_FN_PI     }, /// PI()
        {"PRINT", 		TOKEN_PRINT		},
        {"RETURN", 		TOKEN_RETURN	},
        {"RIGHT$(",		TOKEN_FN_RIGHT	}, /// RIGHT$(STR$,NUM)
        {"RUN",			TOKEN_RUN       },
        {"SIN(",        TOKEN_FN_SIN    }, /// SIN(NUM)
        {"STEP", 		TOKEN_STEP		}, /// FOR <var> = <expr> TO <expr> STEP <expr>
        {"TAN(",        TOKEN_FN_TAN    }, /// TAN(NUM)
        {"THEN", 		TOKEN_THEN		}, /// IF <expr> THEN <stmt>
        {"TO", 			TOKEN_TO		}, /// FOR <var> = <expr> TO <expr>
        {"USR(",		TOKEN_FN_USR	}, /// USR(ADDR,ARG)
        {"WHILE",       TOKEN_WHILE     }, /// WHILE...DO...DONE
        {"REM",         TOKEN_REM       }, /// REM
        {"INPUT$(",     TOKEN_FN_INPUT  }, /// INPUT$()
        {"AND",         TOKEN_LOGICAND  }, /// AND
        {"OR",          TOKEN_LOGICOR   }, /// OR
        {"NOT",         TOKEN_LOGICNOT  }, /// NOT
        {"RAND(",       TOKEN_FN_RAND   }, /// RAND()
        {"SRAND(",      TOKEN_FN_SRAND  }, /// SRAND()
		{"SLEEP(",      TOKEN_FN_SLEEP  }, /// SLEEP()
        {NULL, 			TOKEN_ERROR		}
	};

	CTokenizer::CTokenizer(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
	, m_ptr(NULL)
	, m_nextptr(NULL)
	, m_current_token(TOKEN_ERROR)
	{
	}

	CTokenizer::~CTokenizer()
	{
	}

    bool CTokenizer::valid_ptr(char* p)
    {
        bool rc = ( p>=program().data() && p<(program().data()+program().size()+1) );
        return rc;
    }

	void CTokenizer::reset()
	{
        restart();
	}

    void CTokenizer::restart()
    {
		m_ptr = program().data();
		m_nextptr = NULL;
		if ( m_ptr )
		{
			m_current_token = get_next_token();
		}
		else
		{
			m_current_token = TOKEN_ERROR;
		}
    }

	CARIBOU::CString& CTokenizer::program()
	{
		return m_pgm;
	}

	CTokenizer::token_t CTokenizer::singlechar(void)
	{
		token_t token=TOKEN_ERROR;
		switch(*m_ptr)
		{
			case ',':		token = TOKEN_COMMA;		break;
			case ';':		token = TOKEN_SEMICOLON;	break;
			case '+':		token = TOKEN_PLUS;			break;
			case '-':		token = TOKEN_MINUS;		break;
			case '&':		token = TOKEN_BITWISEAND;	break;
			case '|':		token = TOKEN_BITWISEOR;	break;
			case '^':		token = TOKEN_BITWISEXOR;	break;
			case '!':		token = TOKEN_BANG;			break;
			case '~':       token = TOKEN_TILDE;        break;
			case '*':		token = TOKEN_ASTR;			break;
			case '/':		token = TOKEN_SLASH;		break;
			case '%':		token = TOKEN_MOD;			break;
			case '[':		token = TOKEN_LBRACKET;		break;
			case ']':		token = TOKEN_RBRACKET;		break;
			case '(':		token = TOKEN_LPAREN;		break;
			case ')':		token = TOKEN_RPAREN;		break;
			case '<':		token = TOKEN_LT;			break;
			case '>':		token = TOKEN_GT;			break;
			case '=':		token = TOKEN_EQ;			break;
			case '\'':      token = TOKEN_REM;          break;
			case '\n':		token = TOKEN_CR;			break;
		}
		return token;
	}

	CTokenizer::token_t CTokenizer::next()
	{
		if(!finished())
		{
			m_ptr = m_nextptr;
			while(*m_ptr == ' '||*m_ptr == '\t')
			{
				++m_ptr;
			}
			m_current_token = get_next_token();
		}
		return m_current_token;
	}

    /**
    * Advance to the next line, in the case of REM for instance
    * Return first token of the next line.
    */
	CTokenizer::token_t CTokenizer::next_line()
	{
		if(!finished())
		{
			while(*m_ptr && *m_ptr != '\n' && (uint8_t)*m_ptr != TOKEN_CR )
			{
				++m_ptr;
			}
			m_nextptr = m_ptr;
			if (*m_nextptr)
			{
			    ++m_nextptr;
                while(*m_nextptr == ' '||*m_nextptr == '\t') ++m_nextptr;
			}
			m_current_token = get_next_token();
		}
		return m_current_token;
	}

	CTokenizer::token_t CTokenizer::token(void)
	{
		return m_current_token;
	}

	/**
	 * Convert the text pointed to by ptr into a number.
	 */
	double CTokenizer::number(void)
	{
		return atof(m_ptr);
	}

	/**
	 * Convert the text pointed to by ptr into a number.
	 */
	int CTokenizer::integer(void)
	{
		return atoi(m_ptr);
	}

	/**
	 * On entry pointing to first quote
	 */
	CARIBOU::CString CTokenizer::string()
	{
		CARIBOU::CString rc;
		char* string_start=m_ptr+1;
		char* string_end;
		int string_len;

		if(token() == TOKEN_STRING)
		{
			string_end = strchr(string_start, '"');
			if(string_end != NULL)
			{
				string_len = string_end - string_start;
				for(int n=0; n < string_len; n++)
				{
					rc.append(string_start[n]);
				}
			}
		}
		return rc;
	}

	/**
	 * Have we reached the end-of-file?
	 */
	bool CTokenizer::finished()
	{
		bool rc = (!m_ptr) || (*m_ptr == 0 || m_current_token == TOKEN_EOF);
		return rc;
	}

	/**
	 * Locate the function token.
	 */
	CTokenizer::token_t CTokenizer::functiontok()
	{
		int n=0;
		CARIBOU::CString fn;
		for(char* p=m_ptr; p < m_nextptr; p++) fn += *p;
		do
		{
			keyword_token_t* kw = (keyword_token_t*)&m_keywords[n];
			if ( fn.casecompare( kw->keyword ) == 0 )
			{
				return kw->token;
			}
		} while(m_keywords[++n].keyword);
		return TOKEN_ERROR;
	}

	/**
	 * Locate the keyword token.
	 */
	CTokenizer::token_t CTokenizer::keywordtok()
	{
		for(keyword_token_t* kt = (keyword_token_t*)m_keywords; kt->keyword != NULL; ++kt)
        {
            int len = strlen(kt->keyword);
            if(strncasecmp(m_ptr, kt->keyword, len) == 0)
            {
                m_nextptr = m_ptr + len;
                return kt->token;
            }
        }
 		return TOKEN_ERROR;
	}

	/**
	 * Locate the keyword from token.
	 */
	const char* CTokenizer::tokkeyword()
	{
		for(keyword_token_t* kt = (keyword_token_t*)m_keywords; kt->keyword != NULL; ++kt)
        {
            if ( kt->token == token() )
            {
                return kt->keyword;
            }
        }
        switch(token())
        {
            case TOKEN_CR:          return "\n";	break;
            case TOKEN_COMMA:       return ",";		break;
            case TOKEN_SEMICOLON:   return ";";	    break;
            case TOKEN_PLUS:        return "+";		break;
            case TOKEN_MINUS:       return "-";		break;
            case TOKEN_BITWISEAND:  return "&"; 	break;
            case TOKEN_BITWISEOR:	return "|";     break;
            case TOKEN_BITWISEXOR:  return "^"; 	break;
            case TOKEN_BANG:        return "!";     break;
            case TOKEN_TILDE:       return "~";     break;
            case TOKEN_ASTR:        return "*";		break;
            case TOKEN_SLASH:       return "/";		break;
            case TOKEN_MOD:         return "%";		break;
            case TOKEN_LBRACKET:    return "[";		break;
            case TOKEN_RBRACKET:    return "]";		break;
            case TOKEN_LPAREN:      return "(";		break;
            case TOKEN_RPAREN:      return ")";		break;
            case TOKEN_LT:          return "<";		break;
            case TOKEN_GT:          return ">";		break;
            case TOKEN_EQ:          return "=";		break;
            case TOKEN_LE:          return "<=";    break;
            case TOKEN_GE:          return ">=";    break;
            case TOKEN_NE:          return "<>";    break;
            case TOKEN_LOGICAND:    return "&&";    break;
            case TOKEN_LOGICOR:     return "||";    break;
            case TOKEN_SHL:         return "<<";    break;
            case TOKEN_SHR:         return ">>";    break;
        }
        return NULL;
	}

	/**
	 * Get the next token.
	 */
	CTokenizer::token_t CTokenizer::get_next_token()
	{
		token_t token=TOKEN_ERROR;

        if( static_cast<uint8_t>(*m_ptr) & (uint8_t)0x80 )  // compiled instruction?....
        {
            m_nextptr = m_ptr;
            token = (token_t)static_cast<uint8_t>(*m_ptr);
            ++m_nextptr;
            return token;
        }

		if(*m_ptr == 0)
		{
			return TOKEN_EOF;
		}

		if(isdigit(*m_ptr))
		{
		    uint8_t decimal_point=0;
		    for( m_nextptr = m_ptr; (isdigit(*m_nextptr) || *m_nextptr == '.') && decimal_point<=1; ++m_nextptr)
		    {
		        if ( *m_nextptr == '.' )
		        {
		            ++decimal_point;
		        }
		    }
			return TOKEN_NUMBER;
		}
		else if((token=singlechar()) != TOKEN_ERROR )
		{
			m_nextptr = m_ptr + 1;
			switch(token)
			{
			    case TOKEN_GT:
                    if ( *m_nextptr == '=' )
                        { token = TOKEN_GE; ++m_nextptr; }
                    else if ( *m_nextptr == '>' )
                        { token = TOKEN_SHR; ++m_nextptr; }
                    break;
			    case TOKEN_LT:
                    if ( *m_nextptr == '=' )
                        { token = TOKEN_LE; ++m_nextptr; }
                    else if ( *m_nextptr == '>' )
                        { token = TOKEN_NE; ++m_nextptr; }
                    else if ( *m_nextptr == '<' )
                        { token = TOKEN_SHL; ++m_nextptr; }
                    break;
                case TOKEN_BITWISEAND:
                    if ( *m_nextptr == '&' )
                        { token = TOKEN_LOGICAND; ++m_nextptr; }
                    break;
                case TOKEN_BITWISEOR:
                    if ( *m_nextptr == '|' )
                        { token = TOKEN_LOGICAND; ++m_nextptr; }
                    break;
			}
			return token;
		}
		else if(*m_ptr == '"')
		{
			m_nextptr = m_ptr;
			do
			{
				++m_nextptr;
			} while(valid_ptr(m_nextptr) && *m_nextptr != '"');
			if (valid_ptr(m_nextptr))
			{
				++m_nextptr;
				return TOKEN_STRING;
			}
			else
			{
				set_runtime_error( RUNTIME_OPEN_QUOTE );
				return TOKEN_ERROR;
			}
		}
		else if ( (token=keywordtok()) != TOKEN_ERROR )
		{
			return token;
		}

		if ( CARIBOU::CString::isalpha(*m_ptr) || *m_ptr == '_' )
		{
			/// Handle the case where it could be a variable or function...
			m_nextptr = m_ptr;
			while( valid_ptr(m_nextptr) && ( CARIBOU::CString::isalpha(*m_nextptr) || isnum(*m_nextptr) || *m_nextptr == '_' || *m_nextptr == '$' || *m_nextptr == '@' || *m_nextptr == '#' ) )
			{
				m_nextptr++;
			}
			if ( *m_nextptr == '(' )
			{
				token = functiontok();
				if ( token == TOKEN_ERROR )
				{
					set_runtime_error( RUNTIME_NO_SUCH_FUNCTION );
				}
				return token;
			}
            return TOKEN_VARIABLE;
		}

	  return TOKEN_ERROR;
	}

	/**
	 * Convert the variable name pointed to by ptr into an name index into the variable table.
	 */
	CARIBOU::CString CTokenizer::variable_name(void)
	{
		CARIBOU::CString name;
		while ( valid_ptr(m_ptr) && (CARIBOU::CString::isalpha(*m_ptr) || isnum(*m_ptr) ||  *m_ptr == '_'  || *m_ptr == '$' || *m_ptr == '@' || *m_ptr == '#' )  )
		{
			name += *m_ptr++;
		}
		return name;
	}

	/**
	 * Jump the tokenizer to a specific line number
	 */
	 int CTokenizer::jump(int lineno)
	 {
        restart();
		while(!finished() && number() != lineno)
		{
			do
			{
				do
				{
					next();
				} while(!finished() && token() != TOKEN_CR && token() != TOKEN_EOF);
				if(token() == TOKEN_CR)
				{
					next();
				}
			} while(!finished() && token() != TOKEN_NUMBER);
		}
		return number();
	}

	bool CTokenizer::accept(token_t token)
	{
		bool rc = true;
		if(token != CTokenizer::token())
		{
			set_runtime_error( RUNTIME_UNEXPECTED_TOKEN );
			m_current_token = TOKEN_EOF;
			rc = false;
		}
		next();
		return rc;
	}

} // namespace CARIBOU_BASIC
