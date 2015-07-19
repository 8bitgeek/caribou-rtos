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
#ifndef __CARIBOU_BASIC_TOKEN_H__
#define __CARIBOU_BASIC_TOKEN_H__

#include <clibrary.h>
#include <caribou++/cstring.h>

namespace CARIBOU_BASIC
{
	class CBasic;
	class CTokenizer : public CLibrary
	{
		public:

			typedef enum
			{
				TOKEN_ERROR=0x80,		/// Some kind of error
				TOKEN_FN_USR,			/// USR(ADDR,ARG)
				TOKEN_FN_POKE,			/// POKE#(ADDR#,DATA#)
				TOKEN_FN_PEEK,			/// PEEK#(ADDR#,WIDTH#)
				TOKEN_FN_LEFT,			/// LEFT$(STR$,NUM)
				TOKEN_FN_RIGHT,			/// RIGHT$(STR$,NUM)
				TOKEN_FN_MID,			/// MID$(STR$,AT,LEN)
				TOKEN_FN_INT,			/// INT(NUM)
				TOKEN_FN_LEN,           /// LEN(STR$)
				TOKEN_FN_SIN,           /// SIN(NUM)
				TOKEN_FN_COS,           /// COS(NUM)
				TOKEN_FN_TAN,           /// TAN(NUM)
				TOKEN_FN_PI,            /// PI()
				TOKEN_FN_VAL,           /// VAL(STR$)
				TOKEN_FN_HEX,           /// HEX$(NUM)
				TOKEN_FN_CHR,           /// CHR$(NUM)
				TOKEN_FN_MOD,           /// MOD(NUM,NUM)
				TOKEN_FN_PIN,           /// PIN(PORT#,PIN#,MODE#)
				TOKEN_FN_IN,            /// IN#(PORT#,PIN#)
				TOKEN_FN_OUT,           /// OUT#(PORT#,PIN#,STATE);
				TOKEN_EOF,				/// We're at the end of the file
				TOKEN_NUMBER,			/// It's a raw number
				TOKEN_STRING,			/// It's a raw string
				TOKEN_VARIABLE,			/// It's a variable
				TOKEN_PLUS,				/// +
				TOKEN_MINUS,			/// -
				TOKEN_LOGICAND,         /// '&&'
				TOKEN_LOGICOR,          /// '||'
				TOKEN_BITWISEAND,       /// '&'
				TOKEN_BITWISEOR,        /// '|'
				TOKEN_BITWISEXOR,       /// '|'
				TOKEN_ASTR,				/// '*'
				TOKEN_SLASH,			/// '/'
				TOKEN_MOD,				/// '^'
				TOKEN_EXP,				/// '%'
				TOKEN_LBRACKET,			/// '['
				TOKEN_RBRACKET,			/// ']'
				TOKEN_LPAREN,			/// '('
				TOKEN_RPAREN,			/// ')'
				TOKEN_BANG,				/// '!'
				TOKEN_TILDE,			/// '~'
				TOKEN_LT,				/// <	less than
				TOKEN_LE,				/// <=	less than or equal to
				TOKEN_GT,				/// >	greater than
				TOKEN_GE,				/// >=	greater than or equal to
				TOKEN_EQ,				/// =	equal to
				TOKEN_SHL,              /// <<  shift left
				TOKEN_SHR,              /// >>  shift right
				TOKEN_NE,				/// <>  not equal
				TOKEN_CR,				/// new line
				TOKEN_LET,				/// LET <var> = <expr>
				TOKEN_PRINT,			/// PRINT <expr>[; <xpr>]...
				TOKEN_IF,				/// IF ...
				TOKEN_THEN,				/// ... THEN ...
				TOKEN_ELSE,
				TOKEN_FOR,
				TOKEN_TO,
				TOKEN_STEP,
				TOKEN_NEXT,
				TOKEN_WHILE,
				TOKEN_DO,
				TOKEN_DONE,
				TOKEN_GOTO,
				TOKEN_GOSUB,
				TOKEN_RETURN,
				TOKEN_END,
				TOKEN_COMMA,
				TOKEN_SEMICOLON,
				TOKEN_LIST,
				TOKEN_DUMP,
				TOKEN_RUN,
				TOKEN_NEW,
				TOKEN_CLEAR,
				TOKEN_BYE,
				TOKEN_FN_FREE,
				TOKEN_REM,
				TOKEN_FN_INPUT,         /// INPUT$()
				TOKEN_FN_ABS,           /// ABS(N)
				TOKEN_LOGICNOT,         /// NOT
				TOKEN_FN_RAND,          /// RAND()
				TOKEN_FN_SRAND,         /// SRAND()
				TOKEN_DIM,				/// DIM <var>[<n>]
				TOKEN_FN_SLEEP,			/// SLEEP(NUM)
				TOKEN_DIR,				/// DIR (directory)
			} token_t;

            typedef enum
            {
                TOKEN_SZ_SINGLE,        /// Single character token.
                TOKEN_SZ_KEYWORD,       /// Keyword sized token,
                TOKEN_SZ_FUNCTION,      /// Keyword sized token,
            } token_sz_t;

			typedef struct
			{
                const char*	keyword;    /// The keyword text
                token_t		token;      /// The condensed token
                //token_sz_t  size_hint;  /// FIXME The token size hint for program pretty printing
			} keyword_token_t;

			CTokenizer(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority);
			virtual ~CTokenizer();

			virtual void				reset();

		protected:
			virtual CARIBOU::CString&	program();
			virtual bool				finished();
			virtual	stdio_t*			io() PURE_VIRTUAL

			const char*             	tokkeyword();

			token_t						token();
			token_t						next();
			token_t                 	next_line(); // skip the remainder of current line.
			double 						number();
			int							integer();
			CARIBOU::CString			variable_name();
			CARIBOU::CString			string();
			int							jump(int lineno);
			bool 						accept(token_t token);

            const char*             	tok_ptr() {return m_ptr;}
            const char*             	tok_nextptr() {return m_nextptr;}

		private:
            void                    	restart();
            bool                    	valid_ptr(char* p);
			token_t						get_next_token();
			token_t						singlechar();
			token_t						functiontok();
			token_t                 	keywordtok();

			char* 						m_ptr;
			char*						m_nextptr;
			CARIBOU::CString			m_pgm;
			token_t 					m_current_token;
			static const keyword_token_t 	m_keywords[];
	};
} // namespace CARIBOU_BASIC

#endif /* __CARIBOU_BASIC_TOKEN_H__ */
