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
#include <ccompile.h>

namespace CARIBOU_BASIC
{

	#define inherited CBasic

	CCompile::CCompile(CARIBOU::CString& input,const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
	, m_input(&input)
	{
		start();
	}

	CCompile::~CCompile()
	{
	}

	void CCompile::reset()
	{
	    inherited::reset();
	}


    CARIBOU::CString& CCompile::program()
    {
        return *m_input;
    }

    /**
    * @brief Compile the program code.
    */
	void CCompile::interpret()
	{
        reset();
        while(token() != TOKEN_EOF && token() != TOKEN_ERROR && !get_ended() )
        {
            switch(token())
            {
				case TOKEN_NUMBER:
				case TOKEN_STRING:
				case TOKEN_VARIABLE:
                    {
                        int len = tok_nextptr()-tok_ptr();
                        for(int n=0; n < len; n++)
                            m_output.append(tok_ptr()[n]);
                    }
                    accept(token());
                    break;
                case TOKEN_REM:
                    {
                        uint8_t* p = (uint8_t*)tok_nextptr();
                        m_output.append((uint8_t)token());
                        while (*p && *p != TOKEN_CR && *p != '\n')
                        {
                            m_output.append(*p++);
                        }
                    }
                    next_line();
                    /* fall through... */
                 default:
                    m_output.append((uint8_t)token());
                    accept(token());
                   break;
            }
        }
        if ( get_runtime_error() )
        {
            fprintf(io(),"Compile @%d, %s\n",lineno(),get_runtime_error_str());
        }
	}

    /**
    * @brief de-compile the code in order to list in human readable fashion.
    */
	void CCompile::list()
	{
		int k=0;
        reset();
        while(token() != TOKEN_EOF && token() != TOKEN_ERROR && !get_ended() )
        {
            switch(token())
            {
                case TOKEN_REM:
                    {
                        uint8_t* p = (uint8_t*)tok_nextptr();
                        fprintf(io(),"%s ",tokkeyword());
                        while (*p && *p != TOKEN_CR && *p != '\n')
                        {
                            fprintf(io(),"%c",*p++);
                        }
                    }
                    next_line();
                    break;
                case TOKEN_CR:
                    fprintf(io(),"\n");
                    accept(token());
                    k=-1;
                    break;
				case TOKEN_NUMBER:
				case TOKEN_STRING:
				case TOKEN_VARIABLE:
                    {
                        int len = tok_nextptr()-tok_ptr();
                        for(int n=0; n < len; n++)
                            fputc(tok_ptr()[n],io());
						if (k==0)
							fputc(' ',io());
                    }
                    accept(token());
                    break;
                default:
					{
						char* p = (char*)tokkeyword();
						if ( k != 1 && *p >= 'A' && *p <= 'Z' && p[strlen(p)-1]!='(' )
							fputc(' ',io());
						fprintf(io(),"%s",p);
						if ( *p >= 'A' && *p <= 'Z' && p[strlen(p)-1]!='(' )
							fputc(' ',io());
						accept(token());
					}
                    break;
            }
            ++k;
        }
        if ( get_runtime_error() )
        {
            fprintf(io(),"@%d, %s\n",lineno(),get_runtime_error_str());
        }
	}

} // namespace CARIBOU_BASIC
