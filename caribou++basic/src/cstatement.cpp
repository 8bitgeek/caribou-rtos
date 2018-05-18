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
#include <cstatement.h>

namespace CARIBOU_BASIC
{
	#define inherited CFunction

	CStatement::CStatement(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
	{
	}

	CStatement::~CStatement()
	{
		clear_stack();
	}

	void CStatement::reset()
	{
		clear_stack();
		inherited::reset();
	}

	void CStatement::clear_stack()
	{
		while(m_stack.count())
		{
			pop(ANY_FRAME,NULL,0);
		}
	}

	/**
	* @brief Make a copy of data and push to top of the stack.
	* @param frametype A signature indicating the kind of stack frame.
	* @param data a copy of the stack data.
	* @param size the size of the stack data
	* @return >= 1 on success, < 0 on overflow
	*/
	int CStatement::push(t_frametype frametype, void* data, uint8_t size)
	{
		int rc = -1;
		t_stack_frame* stack_frame = (t_stack_frame*)malloc(sizeof(t_stack_frame));
		if ( stack_frame )
		{
			stack_frame->data = malloc(size);
			if ( stack_frame->data )
			{
				stack_frame->frametype = frametype;
				memcpy(stack_frame->data,data,size);
				if ( m_stack.append(stack_frame) )
				{
				    rc = m_stack.count();
				}
				else
				{
                    free( stack_frame->data );
                    free( stack_frame );
                    set_runtime_error( RUNTIME_STACK_OVERFLOW );
				}
			}
			else
			{
				free( stack_frame );
                set_runtime_error( RUNTIME_STACK_OVERFLOW );
			}
		}
		if ( rc < 0 )
		{
			set_runtime_error( RUNTIME_STACK_OVERFLOW );
		}
		return rc;
	}

	/**
	* @brief Take a copy of top data from the stack and remove the frame from the stack.
	* @param frametype A signature indicating the kind of stack frame.
	* @param data a copy of the stack data if not NULL.
	* @param size the size of the stack data
	* @return >= 1 on success, < 0 on overflow
	*/
	int CStatement::pop(t_frametype frametype, void* data, uint8_t size)
	{
		int idx = -1; // the index of the frame to pop
		t_stack_frame* stack_frame=NULL;
		if ( m_stack.count() )
		{
			idx = m_stack.count()-1;
			if ( frametype != ANY_FRAME )
			{
				for(;idx>=0;idx--)
				{
					stack_frame = m_stack.at(idx);
					if ( frametype == stack_frame->frametype )
					{
						break;
					}
				}
			}
			if ( idx >= 0 )
			{
				stack_frame = m_stack.take(idx);
				if ( data )
				{
				    memcpy(data,stack_frame->data,size);
				}
				free(stack_frame->data);
				free(stack_frame);
			}
		}
		return idx;
	}

	/**
	* @brief Get a pointer to top data from the stack.
	* @param frametype A signature indicating the kind of stack frame.
	* @param data a pointer to the stack data.
	* @return >= 1 on success, < 0 on overflow
	*/
	int CStatement::topframe(t_frametype frametype, void** data)
	{
		int idx = -1; // the index of the frame to pop
		t_stack_frame* stack_frame=NULL;
		if ( m_stack.count() )
		{
			idx = m_stack.count()-1;
			if ( frametype != ANY_FRAME )
			{
				for(;idx>=0;idx--)
				{
					stack_frame = m_stack.at(idx);
					if ( frametype == stack_frame->frametype )
					{
						break;
					}
				}
			}
			if ( idx >= 0 )
			{
				stack_frame = m_stack.at(idx);
				*data = stack_frame->data;
			}
		}
		return idx;
	}

    /**
    * @brief  PRINT <<...<;>>...>
    */
	void CStatement::do_print()
	{
		token_t token;
		accept(TOKEN_PRINT);
		while((token=CTokenizer::token()) != TOKEN_EOF)
		{
			switch(token)
			{
				case TOKEN_STRING:
					{
						CARIBOU::CString str =  string();
						fprintf(io(),"%s",str.data());
						token = next();
					}
					break;
				case TOKEN_COMMA:
					fprintf(io()," ");
					token = next();
					break;
				case TOKEN_SEMICOLON:
					token = next();
					if ( CTokenizer::token() == TOKEN_CR )
					{
						token= next();
						return;
					}
					break;
				case TOKEN_CR:
					fprintf(io(),"\n");
					token = next();
					return;
				default:
                    {
                        CVariable rc = eval();
                        if ( rc.data() )
                        {
                            fprintf(io(),"%s",rc.data());
                        }
                    }
					token = CTokenizer::token();
					break;
			}
		}
	}

    /**
    * @brief Execute an IF statement
    */
	void CStatement::do_if()
	{
		CVariable rc(autoname());
		accept(TOKEN_IF);
		rc = eval();
		if ( accept(TOKEN_THEN) )
		{
            if( rc.toDouble() != 0.0 )
            {
                /// if the condition is true...
                do_statement();
            }
            else
            {
                /// if the condition is false...skip till end of statement or until an ELSE is encountered...
                do
                {
                    next();
                } while(CTokenizer::token() != TOKEN_ELSE && CTokenizer::token() != TOKEN_CR && CTokenizer::token() != TOKEN_EOF);
                if(CTokenizer::token() == TOKEN_ELSE)
                {
                    next();
                    do_statement();
                }
                else if(CTokenizer::token() == TOKEN_CR)
                {
                    next();
                }
            }
		}
	}

	/**
	* @param Execute LET (variable assignment) statement.
	*/
	void CStatement::do_let()
	{
		if ( token() == TOKEN_LET )
		{
			accept( TOKEN_LET );
		}
		if ( token() == TOKEN_VARIABLE )
		{
			CARIBOU::CString target_name = variable_name();
			accept(TOKEN_VARIABLE);
			if ( token() == TOKEN_EQ )
			{
				next();
				set(target_name, eval());
			}
			else
			if ( token() == TOKEN_LBRACKET ) // a dimensioned variable?
			{
				CVariable* target = get(target_name);
				if ( target && target->is_dim() )
				{
					int offset;
					do
					{
						accept(token());
						offset = eval().toInt();
						static_cast<CDimVariable*>(target)->push(offset);
					} while(!finished() && token() == TOKEN_COMMA);
					if ( accept( TOKEN_RBRACKET ) && accept( TOKEN_EQ ) )
					{
						CARIBOU::CString* value = static_cast<CDimVariable*>(target)->value();
						if ( value )
						{
							CVariable rc = eval();
							value->copy(rc.data());
						}
					}
					static_cast<CDimVariable*>(target)->pop_frame();
				}
			}
		}
	}

    /**
    * @param Execute a GOTO <expr> statement
    */
	void CStatement::do_goto()
	{
		accept(TOKEN_GOTO);
		int target = eval().toInt();
		if ( target <= 0 || jump(target) != target )
		{
			set_runtime_error( RUNTIME_MISSING_LINENO );
		}
	}

    /**
    * @brief Execute a GOSUB <expr> statement
    */
	void CStatement::do_gosub()
	{
		int target;
		int return_target;
		accept(TOKEN_GOSUB);
		target = eval().toInt();
		if ( target > 0 )
		{
            accept(TOKEN_CR);
            return_target = number(); // line after gosub
            if ( push(CALL_FRAME,&return_target,sizeof(return_target)) > 0 )
            {
                if ( jump(target) != target )
                {
                    set_runtime_error( RUNTIME_MISSING_LINENO );
                }
            }
            else
            {
                set_runtime_error( RUNTIME_STACK_OVERFLOW );
            }
		}
	}

	void CStatement::do_return(void)
	{
		int return_target;
		accept(TOKEN_RETURN);
		if ( pop(CALL_FRAME,&return_target,sizeof(return_target)) >= 0 )
		{
			jump(return_target);
		}
		else
		{
			set_runtime_error( RUNTIME_STACK_UNDERFLOW );
		}
	}

    /**
    * @brief Execute a FOR ... TO ... <STEP ...> statement.
    */
	void CStatement::do_for()
	{
		t_for_frame for_frame;
		for_frame.step=1;			/* default step */
		accept(TOKEN_FOR);
		for_frame.control_variable = get( variable_name() );
		if ( for_frame.control_variable )
		{
            if ( accept(TOKEN_VARIABLE) && accept(TOKEN_EQ) )
            {
                CVariable t1(eval());
                *for_frame.control_variable = t1;
                if ( accept(TOKEN_TO) )
                {
                    for_frame.to = eval().toDouble();
                    if ( CTokenizer::token() == TOKEN_STEP )
                    {
                        accept(TOKEN_STEP);
                        for_frame.step = eval().toDouble();
                    }
                    else if ( CTokenizer::token() != TOKEN_CR )
                    {
                        set_runtime_error( RUNTIME_SYNTAX_ERROR );
                        return;
                    }
                    if ( accept(TOKEN_CR) )
                    {
                        if ( token() == TOKEN_NUMBER ) // only if ther's something to do...
                        {
                            for_frame.loop_lineno = number();
                            if ( push(FOR_FRAME,&for_frame,sizeof(for_frame)) <= 0 )
                            {
                                set_runtime_error( RUNTIME_STACK_OVERFLOW );
                                return;
                            }
                        }
                    }
                }
            }
		}
		else
		{
		    set_runtime_error( RUNTIME_LOW_MEMORY );
		}
	}

	void CStatement::do_next()
	{
		t_for_frame for_frame;
		t_for_frame* p_for_frame;
		CVariable* var;;
		accept(TOKEN_NEXT);
		var = get(variable_name());
		if ( accept(TOKEN_VARIABLE) )
		{
			if ( topframe(FOR_FRAME,(void**)&p_for_frame) >=  0 )
			{
			    if ( var == p_for_frame->control_variable )
			    {
			        var->fromDouble( var->toDouble() + p_for_frame->step );
			        if (var->toDouble() <= p_for_frame->to )
			        {
			            jump(p_for_frame->loop_lineno);
			        }
                    else
                    {
                        pop(FOR_FRAME,&for_frame,sizeof(for_frame));
                    }
			    }
			    else
			    {
			        set_runtime_error( RUNTIME_MISMATCH_CONTROL );
			    }
			}
 			else
 			{
 			    set_runtime_error( RUNTIME_STACK_UNDERFLOW );
 			}
		}
	}

    void CStatement::do_while()
    {
        CVariable rc(autoname());
        int loop_lineno=lineno();
        accept(TOKEN_WHILE);
        rc = eval();
        if ( token() == TOKEN_DO )
        {
            accept( TOKEN_DO );
        }
        if ( rc.toDouble() != 0.0 )
        {
            if ( push(WHILE_FRAME,&loop_lineno,sizeof(loop_lineno)) < 0 )
            {
                set_runtime_error( RUNTIME_STACK_OVERFLOW );
            }
        }
		else
		{
			do
			{
				next();
			} while(CTokenizer::token() != TOKEN_DONE && CTokenizer::token() != TOKEN_EOF);
			if(CTokenizer::token() == TOKEN_DONE)
			{
				next();
			}
		}
		accept(TOKEN_CR);
	}

    void CStatement::do_do()
    {
        // FIXME do something
    }

    /**
    * @brief Execute the terminating DONE stament of a WHILE...DO...DONE loop.
    */
    void CStatement::do_done()
    {
        int loop_lineno;
        accept(TOKEN_DONE);
        if ( pop(WHILE_FRAME,&loop_lineno,sizeof(loop_lineno)) >= 0 )
        {
            jump(loop_lineno);
        }
        else
        {
            set_runtime_error( RUNTIME_STACK_UNDERFLOW );
        }
    }

    /**
    * @brief execute the 'list' statement
    */
	void CStatement::do_list()
	{
		accept(TOKEN_LIST);
		/** do nothing - editor should override */
		accept(TOKEN_CR);
	}

	/**
	* @brief execite the DIR (directory) command.
	*/
	void CStatement::do_dir()
	{
		int rc;
        accept(TOKEN_DIR);
        /** FIXME FAT_FS Directory */
        #if 0
		DIR dir;
		FILINFO fi;
		memset(&fi,0,sizeof(FILINFO));
		rc = (int)f_opendir(&dir,"/");
		if ( rc == 0 )
		{
			rc = (int)f_readdir(&dir,&fi);
		}
		#endif
		accept(TOKEN_CR);
	}

    /**
    * @brief execute the 'run' statement
    */
    void CStatement::do_run()
	{
		clear();
		accept(TOKEN_RUN);
		interpret();
	}

	void CStatement::do_dump()
	{
		accept(TOKEN_DUMP);
		for(int n=0; n < variables().count(); n++)
		{
			CVariable* var = variables().at(n);
			fprintf( io(), "%s\t", var->name().data() ? var->name().data() : "(null)" );
			if ( var )
			{
                switch(var->type())
                {
                    default:
                    case CVariable::TYPE_AUTO:			fprintf( io(), "TYPE_AUTO          " );	break;
                    case CVariable::TYPE_CHARCTER:		fprintf( io(), "TYPE_CHARACTER     " );	break;
                    case CVariable::TYPE_INTEGER:		fprintf( io(), "TYPE_INTEGER       " );	break;
                    case CVariable::TYPE_NUMBER:		fprintf( io(), "TYPE_NUMBER        " );	break;
                    case CVariable::TYPE_STRING:		fprintf( io(), "TYPE_STRING        " );	break;
                    case CVariable::TYPE_DIM_AUTO:		fprintf( io(), "TYPE_DIM_AUTO      " );	break;
                    case CVariable::TYPE_DIM_CHARACTER:	fprintf( io(), "TYPE_DIM_CHARACTER " );	break;
                    case CVariable::TYPE_DIM_INTEGER:	fprintf( io(), "TYPE_DIM_INTEGER   " );	break;
                    case CVariable::TYPE_DIM_NUMBER:	fprintf( io(), "TYPE_DIM_NUMBER    " );	break;
                    case CVariable::TYPE_DIM_STRING:	fprintf( io(), "TYPE_DIM_STRING    " );	break;
                }
                if ( var->type() == CVariable::TYPE_STRING )
                    fprintf(io(), "\"%s\"",var->isNull() ? "" : var->data());
                else
                    fprintf(io(), "%s",var->isNull() ? "(null)" : var->data());
			}
			fprintf(io(), "\n");
		}
		accept(TOKEN_CR);
	}

	void CStatement::do_end()
	{
		accept(TOKEN_END);
		set_ended( true );
	}

    /**
    * The NEW statement resets the interpreter to it's initial state.
    */
	void CStatement::do_new()
	{
		next();
        inherited::program().clear();
        reset();
		clear();
 		//fprintf( io(), "%sH%s2J", csi(), csi() );
		fprintf( io(), "%s V%s\n", title(), version() );
		fprintf( io(), "%s\n", copyright() );
		fprintf( io(), "%s\n", license() );
		fprintf( io(), "%d bytes free\n", bytes_free() );
	}

    /**
    * The CLEAR statement sends the ANSI clear-screen sequence.
    */
    void CStatement::do_clear()
    {
        accept( TOKEN_CLEAR );
        fprintf( io(), "%sH%s2J", csi(), csi() );
        accept( TOKEN_CR );
    }

    /**
    * The REM statement provides a means of embedding comments in the BASIC code.
    * Everything following the REM statement up to the line terminator is ignored.
    */
    void CStatement::do_rem()
    {
        accept( TOKEN_REM );
        next_line();
    }

	/**
	* The DIM statement provides support for dimensioned variables
	*/
	void CStatement::do_dim()
	{
		accept( TOKEN_DIM );
		CARIBOU::CString target_name( variable_name() );
		if ( !target_name.isEmpty() )
		{
			if ( accept( TOKEN_VARIABLE )  && token() == TOKEN_LBRACKET )
			{
				CVariable* target = find(target_name);
				if (!target)
				{
					target = new CDimVariable(target_name);
				}
				if ( target )
				{
					if ( target->is_dim() )
					{
						do
						{
							int dim;
							accept(token());
							dim = eval().toInt();
							if ( dim > 0 )
							{
								if ( !static_cast<CDimVariable*>(target)->new_dimension(dim) )
								{
									set_runtime_error( RUNTIME_LOW_MEMORY );
								}
							}
							else
							{
								set_runtime_error( RUNTIME_OUT_OF_RANGE );
								break;
							}
						} while(!finished() && token() == TOKEN_COMMA);
						accept( TOKEN_RBRACKET );
					}
					else
					{
						set_runtime_error( RUNTIME_TYPE_MISMATCH );
					}
				}
				else
				{
					set_runtime_error( RUNTIME_LOW_MEMORY );
				}
			}
			else
			{
				set_runtime_error( RUNTIME_UNEXPECTED_TOKEN );
			}
		}
	}

    void CStatement::do_bye()
    {
        accept( TOKEN_BYE );
#if defined(__linux__)
        exit(0);
#endif
        accept( TOKEN_CR );
    }

	void CStatement::do_statement()
	{
		token_t token = inherited::token();
		switch(token)
		{
			case TOKEN_GOTO:		do_goto();		break;
			case TOKEN_GOSUB:		do_gosub();		break;
			case TOKEN_RETURN:		do_return();	break;
			case TOKEN_IF:			do_if();		break;
			case TOKEN_FOR:			do_for();		break;
			case TOKEN_NEXT:		do_next();		break;
			case TOKEN_WHILE:       do_while();     break;
			case TOKEN_LET:			do_let();		break;
			case TOKEN_VARIABLE:	do_let();		break;
			case TOKEN_DIM:			do_dim();		break;
		    case TOKEN_CR:          next();         break;
			case TOKEN_DO:          do_do();        break;
			case TOKEN_DONE:        do_done();      break;
			case TOKEN_END:			do_end();		break;
			case TOKEN_LIST:		do_list();		break;
			case TOKEN_DUMP:		do_dump();		break;
			case TOKEN_RUN:		    do_run();		break;
			case TOKEN_NEW:		    do_new();		break;
			case TOKEN_PRINT:		do_print();		break;
			case TOKEN_CLEAR:	    do_clear();		break;
		    case TOKEN_BYE:         do_bye();       break;
		    case TOKEN_DIR:			do_dir();		break;
			default:
				{
					CVariable t1(autoname());
					fnfactor(t1);
				}
				break;
		}
	}

	void CStatement::do_line()
	{
       if ( !interrupted() )
        {
            if ( token() == TOKEN_NUMBER )
                next();
			do
			{
				if ( token() == TOKEN_SEMICOLON )
					next();
				do_statement();
			} while( token() == TOKEN_SEMICOLON && !interrupted() );
			/** only accept these conditions after end of statement... */
			if ( token() == TOKEN_CR || token() == TOKEN_EOF )
			{
				next();
			}
			else if ( token() != TOKEN_NUMBER ) // some statements eat TOKEN_CR
			{
				set_runtime_error(RUNTIME_UNEXPECTED_TOKEN);
			}
        }
        if ( interrupted() )
        {
            set_runtime_error(RUNTIME_INTERRUPTED);
        }
	}

} // namespace CARIBOU_BASIC

