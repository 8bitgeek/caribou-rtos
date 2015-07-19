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
#include <cvue.h>
#include <caribou/lib/stdio.h>

namespace CARIBOU_BASIC
{

	#define inherited CBasic

	CVue::CVue(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
	, m_running(false)
	, m_insert(true)
	{
		screen().setWidth(80);
		screen().setHeight(25);
	}

	CVue::~CVue()
	{
	}

    /**
    * @brief Compile the program code.
    */
	bool CVue::compile(CARIBOU::CString& output)
	{
		bool rc=true;
		output.clear();
		inherited::reset();
        while(rc && token() != TOKEN_EOF && token() != TOKEN_ERROR && !get_ended() )
        {
            switch(token())
            {
				case TOKEN_NUMBER:
				case TOKEN_STRING:
				case TOKEN_VARIABLE:
                    {
                        int len = tok_nextptr()-tok_ptr();
                        for(int n=0; n < len; n++)
                            output.append(tok_ptr()[n]);
                    }
                    rc = accept(token());
                    break;
                case TOKEN_REM:
                    {
                        uint8_t* p = (uint8_t*)tok_nextptr();
                        output.append((uint8_t)token());
                        while (*p && *p != TOKEN_CR && *p != '\n')
                        {
                            output.append(*p++);
                        }
                    }
                    next_line();
                    /* fall through... */
                 default:
                    output.append((uint8_t)token());
                    rc = accept(token());
                   break;
            }
        }
        if ( get_runtime_error() )
        {
            fprintf(io(),"Compile @%d, %s\n",lineno(),get_runtime_error_str());
            rc = false;
        }
        return rc;
	}

    /**
    * @brief de-compile the code in order to list in human readable fashion.
    */
	void CVue::do_list()
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

	void CVue::reset()
	{
	    m_command.clear();
	    inherited::reset();
        ansiEID();
		update();
	}


    CARIBOU::CString& CVue::program()
    {
        if ( m_command.length() )
        {
            return m_command;
        }
        return inherited::program();
    }

	/** read a line */
	void CVue::read_line()
	{
		int ch;
		m_command.clear();
		do
		{
			ch = fgetc(io());
			switch(ch)
			{
			    case 0x7F: // delete?
			    case 0x08: // backspace?
                    if ( m_command.length() > 0 )
                    {
                        fprintf(io(),"%c %c",0x08,0x08);
                        m_command.remove(m_command.length()-1);
                    }
                    break;
                case ('C'-0x40):
                    fprintf(io(),"\n^C\n");
                    m_command.clear();
                    return;
                    break;
                case '\r': // CR?
                    fputc(ch,io());
                    ch = '\n';
                    // fall through...
                default:
                    if ( ch == '\n' || (ch >= ' ' && ch <= '~') )
                    {
                        m_command.append(ch);
                        fputc(ch,io());
                    }
					else
					{
						yield();
					}
                break;
			}
		} while(ch!='\n');
	}

	/**
	** Has the program been interrupted?
	*/
	bool CVue::interrupted()
	{
	    if ( fgetc(io()) == ('C'-0x40) )
	    {
	        return true;
	    }
	    return false;
	}

    /**
    ** Get keyboard input for the BASIC program input.
    */
    CARIBOU::CString CVue::input()
    {
        CARIBOU::CString rc;
        read_line();
        rc = m_command;
        m_command.clear(); // so we don't catch program() override!
        return rc;
    }

	/**
	* locate the character offset of a line number.
	* @param p Pointer to the line number to look for.
	* @return offset to first char or < 0
	*/
	int CVue::line_offset(int linenum)
	{
        CARIBOU::CString skipchars;
        skipchars.append(TOKEN_CR);
        skipchars.append(" \t");
	    int length = inherited::program().length();
	    int offset=0;
	    while( offset >= 0 && offset < length )
	    {
			if ( linenum == atoi(inherited::program().data(offset)) )
			{
				return offset;
			}
			offset = inherited::program().find(TOKEN_CR,offset);
			if ( offset >= 0 )
			{
			    // skip terminator and white space
			    offset = inherited::program().skip(skipchars.data(),offset);
			}
	    }
        return offset;
	}

    /**
    * Delete the line at the offset
    * @param offset The line offset
    */
    void CVue::delete_line(int offset)
    {
        int eol = inherited::program().find(TOKEN_CR,offset);
        if ( offset >= 0 && eol > offset )
        {
            inherited::program().remove(offset,(eol+1)-offset);
        }
    }

	/**
	 * Find the insertion point for a new line based on the value of the line number
	 */
	int CVue::insert_offset(int linenum)
	{
	    int length = inherited::program().length();
	    int offset=0;
	    while( offset >= 0 && offset < length )
	    {
			if ( linenum < atoi(inherited::program().data(offset)) )
			{
				return offset;
			}
			offset = inherited::program().find(TOKEN_CR,offset);
			if ( offset >= 0 )
			{
                CARIBOU::CString skipchars;
                skipchars.append(TOKEN_CR);
                skipchars.append(" \t");
			    // skip terminator and white space
			    offset = inherited::program().skip(skipchars.data(),offset);
			}
	    }
	    if ( offset < 0 || offset >= length )
	    {
	        if ( length )
	        {
	            return length;
	        }
	    }
        return offset;
	}

	/**
	 * Place a new line into  the buffer, deleting existing line and so forth.
	 * @param line The line to insert.
	 */
	void CVue::place()
	{
        CARIBOU::CString skipchars;
        skipchars.append(TOKEN_CR);
        skipchars.append("0123456789 \t");

        /* delete existing? */
 		delete_line(line_offset(m_command.toInt()));

        /* any content after line#? */
		if ( m_command.skip(skipchars.data()) < m_command.length() )
		{
            /* insert */
		    inherited::program().insert(
                                    m_command.data(),
                                    insert_offset(m_command.toInt()),
                                    inherited::program().length() ? m_command.length() : m_command.size() );
		}
	}

	void CVue::show_prompt()
	{
		const char* error_str;
		if ( get_runtime_error() != RUNTIME_READY )
		{
			fprintf(io(),"@%d ",lineno());
		}
		error_str = get_runtime_error_str();
		fprintf(io(),"%s%s", error_str,prompt() );
		set_runtime_error(RUNTIME_READY);
	}

	/**
	 * Perform the user interface function of editing a program buffer.
	 * @param program The base pointer to the buffer text to edit.
	 * Never returns.
	 */
	void CVue::interpret()
	{
	    if ( !m_running )
	    {
	        reset();
            do_new();
            for(;;)
            {
            	CARIBOU::CString output;
                show_prompt();
                read_line();
                if ( compile(output) )
				{
					m_command = output;
					if (m_command.toInt())
					{
						inherited::reset();
						place();
					}
					else
					{
						m_running = true;
						inherited::reset();
						do_line();
						m_running=false;
					}
				}
            }
	    }
	    inherited::interpret();
	}

	/**
	 * @brief Update the display
	 */
	void CVue::update()
	{
		ansiCUP(0,0);
		ansiSGR(sgrNegative);
		fprintf( io(), "%s", status().data() );
		ansiCUP(0,1);
		ansiSGR();
	}

	/**
	 * @brief Compile the status line string.
	 */
	CARIBOU::CString CVue::status()
	{
		CARIBOU::CString rc;
		rc = title();
		rc += " ";
		rc += version();
		rc += " [";
		rc += CARIBOU::CString().fromInt(cursor().x());
		rc += ",";
		rc += CARIBOU::CString().fromInt(cursor().y());
		rc += "] ";
		rc += insert() ? "INS " : "OVR ";
		return rc;
	}

	/**
	 * @brief Move the screen cursor to the positiion
	 */
	void CVue::ansiCUP(CARIBOU::CPoint pos)
	{
		fprintf( io(), "%s%d;%dH", csi(), pos.y()+1, pos.x()+1 );
	}

	/**
	 * @brief Move the screen cursor to the positiion
	 */
	void CVue::ansiCUP(int col, int row)
	{
		fprintf( io(), "%s%d;%dH", csi(), row+1, col+1 );
	}

	/**
	 * @brief Move the cursor to the home position relative to the screen
	 */
	void CVue::ansiEID(char mode)
	{
		fprintf( io(), "%s%cJ", csi(), mode );
	}

	/**
	 * @brief Erase from the cursor position to the EOL.
	 */
	void CVue::ansiEIL(char mode)
	{
		fprintf( io(), "%s%cK", csi(), mode );
	}

	/**
	 * @brief Reverse the video.
	 */
	void CVue::ansiSGR(t_sgr sgr)
	{
		fprintf( io(), "%s%dm", csi(), (int)sgr );
	}

} // namespace CARIBOU_BASIC
