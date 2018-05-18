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
#include <cfunction.h>
#include <math.h>
#include <caribou/kernel/thread.h>

namespace CARIBOU_BASIC
{
	#define inherited CExpr

	CFunction::CFunction(const char* name, stdio_t* io, uint16_t stksize, uint16_t priority)
	: inherited(name,io,stksize,priority)
	, m_rand_next(0)
	{
	}

	CFunction::~CFunction()
	{
	}

    void CFunction::srand(uint32_t seed)
    {
        m_rand_next = seed;
    }

    uint16_t CFunction::rand()
    {
        m_rand_next = (m_rand_next * 1103515245) + 12345;
        return((unsigned)(m_rand_next/65536) % 32768);
    }

	CVariable& CFunction::fnfactor(CVariable& t1)
	{
		static token_t token;
        token = CTokenizer::token();
		switch(token)
		{
            #if defined(__STM32__)
			case TOKEN_FN_PIN:      t1=fn_pin();    break;  /// PIN(PORT,PIN,DIR,MODE)
			case TOKEN_FN_IN:       t1=fn_in();     break;  /// IN#(PORT#,PIN#)
			case TOKEN_FN_OUT:      t1=fn_out();    break;  /// OUT#(PORT#,PIN#,STATE);
            #endif
			case TOKEN_FN_POKE:	    t1=fn_poke();	break;	/// POKE(ADDR,DATA)
			case TOKEN_FN_PEEK:	    t1=fn_peek();	break;	/// PEEK(ADDR)
		    case TOKEN_FN_ABS:      t1=fn_abs();    break;  /// ABS(NUM)
			case TOKEN_FN_USR:	    t1=fn_usr();	break;	/// USR(ADDR,ARG)
			case TOKEN_FN_LEFT:	    t1=fn_left();	break;	/// LEFT$(STR$,NUM)
			case TOKEN_FN_RIGHT:	t1=fn_right();	break;	/// RIGHT$(STR$,NUM)
			case TOKEN_FN_MID:	    t1=fn_mid();	break;	/// MID$(STR$,AT,LEN)
			case TOKEN_FN_INT:      t1=fn_int();    break;  /// INT(NUM)
			case TOKEN_FN_LEN:      t1=fn_len();    break;  /// LEN(STR$)
			case TOKEN_FN_SIN:      t1=fn_sin();    break;  /// SIN()
			case TOKEN_FN_COS:      t1=fn_cos();    break;  /// COS()
			case TOKEN_FN_TAN:      t1=fn_tan();    break;  /// TAN()
			case TOKEN_FN_PI:       t1=fn_pi();     break;  /// PI()
			case TOKEN_FN_MOD:      t1=fn_mod();    break;  /// MOD(NUM,NUM)
            case TOKEN_FN_VAL:      t1=fn_val();    break;  /// VAL#(STR$)
            case TOKEN_FN_HEX:      t1=fn_hex();    break;  /// HEX$(NUM)
            case TOKEN_FN_FREE:     t1=fn_free();   break;  /// FREE()
            case TOKEN_FN_INPUT:    t1=fn_input();  break;  /// INPUT$()
            case TOKEN_FN_RAND:     t1=fn_rand();   break;  /// RAND()
            case TOKEN_FN_SRAND:    t1=fn_srand();  break;  /// SRAND()
            case TOKEN_FN_CHR:		t1=fn_chr();	break;	/// CHR$(NUM)
            case TOKEN_FN_SLEEP:	t1=fn_sleep();	break;	/// SLEEP(NUM)
		}
		return t1;
	}


	/// Function entry. Parse the arguments into argument list
	/// @param min The minimum number of arguments.
	/// @param max The maximum number of arguments, or zero (0) indicating @arg min specifies the exact number of arguments.
	/// @return argument list count
	int CFunction::fn_enter(int min, int max)
	{
		int args=0;
		next();
		while( CTokenizer::token() != TOKEN_RPAREN )
		{
			if ( args < min && (max==0 || (max>0 && args < max)) )
			{
				m_arguments.append( new CVariable( eval() ) );
				++args;
			}
			if ( CTokenizer::token() == TOKEN_COMMA )
			{
				accept(TOKEN_COMMA);
			}
			else if ( CTokenizer::token() != TOKEN_RPAREN )
			{
				set_runtime_error( RUNTIME_UNEXPECTED_TOKEN );
				break;
			}
		}
		if ( args < min || (args==0 && args > min) || (max>0 && args > max) )
		{
		    fn_exit(args);
		    args = 0;
		}
		next();
		return args;
	}

    /// Exit a function after having called fn_enter, to clean up...
    void CFunction::fn_exit(int args)
    {
        for(int n=0; n < args; n++)
        {
            CVariable* var = m_arguments.take(m_arguments.count()-1);
            delete var;
        }
    }

    #if defined(__STM32__)
    /// convert a logical GPIO port number to hardware port number.
    uint32_t CFunction::gpio_port(uint32_t port)
    {
        switch(port)   // PORT#
        {
            case 0: port = RCC_APB2Periph_GPIOA;    break;
            case 1: port = RCC_APB2Periph_GPIOB;    break;
            case 2: port = RCC_APB2Periph_GPIOC;    break;
            case 3: port = RCC_APB2Periph_GPIOD;    break;
            case 4: port = RCC_APB2Periph_GPIOE;    break;
            case 6: port = RCC_APB2Periph_GPIOF;    break;
            case 7: port = RCC_APB2Periph_GPIOG;    break;
            default:
                set_runtime_error( RUNTIME_IO_ERROR );
                break;
        }
        return port;
    }

    /// convert a logical GPIO port number to hardware port number.
    GPIO_TypeDef* CFunction::gpio_port_ptr(uint32_t port)
    {
        GPIO_TypeDef* ptr = NULL;
        switch(port)   // PORT#
        {
            case 0: ptr = GPIOA;    break;
            case 1: ptr = GPIOB;    break;
            case 2: ptr = GPIOC;    break;
            case 3: ptr = GPIOD;    break;
            case 4: ptr = GPIOE;    break;
            case 6: ptr = GPIOF;    break;
            case 7: ptr = GPIOG;    break;
            default:
                set_runtime_error( RUNTIME_IO_ERROR );
                break;
        }
        return ptr;
    }

    uint32_t CFunction::gpio_mode(uint32_t mode)
    {
        switch(mode)
        {
            case 0: mode = GPIO_Mode_AIN;           break;
            case 1: mode = GPIO_Mode_IN_FLOATING;   break;
            case 2: mode = GPIO_Mode_IPD;           break;
            case 3: mode = GPIO_Mode_IPU;           break;
            case 4: mode = GPIO_Mode_Out_OD;        break;
            case 5: mode = GPIO_Mode_Out_PP;        break;
            case 6: mode = GPIO_Mode_AF_OD;         break;
            case 7: mode = GPIO_Mode_AF_PP;         break;
            default:
                set_runtime_error( RUNTIME_IO_ERROR );
                break;
        }
        return mode;
    }

	/// <> PIN(PORT#,PIN#,#MODE)
	variable CFunction::fn_pin()
	{
	    variable rc;
		if ( fn_enter(3) == 3 )
		{
            uint32_t pin = 1 << m_arguments.at(1)->toUInt();
            if ( pin )
            {
                GPIO_InitTypeDef  GPIO_InitStructure;
                uint32_t port = gpio_port( m_arguments.at(0)->toUInt() );
                uint32_t mode = gpio_mode( m_arguments.at(2)->toUInt() );
                /// Enable the port clock.
                RCC_APB2PeriphClockCmd(port, ENABLE);
                /// Initialize the pin...
                GPIO_TypeDef * port_ptr = gpio_port_ptr( m_arguments.at(0)->toUInt() );
                GPIO_InitStructure.GPIO_Pin   = pin;
                GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
                GPIO_InitStructure.GPIO_Mode  = static_cast<GPIOMode_TypeDef>(mode);
                GPIO_Init(port_ptr, &GPIO_InitStructure);
            }
            else
            {
                set_runtime_error( RUNTIME_IO_ERROR );
            }
            fn_exit(3);
		}
		return rc;
	}

	/// <#> IN#(PORT#,PIN#)
	/// <#> IN#(PORT#)
	variable CFunction::fn_in()
	{
	    variable rc;
	    int nargs;
		if ( (nargs=fn_enter(1,2)) >= 1 )
		{
		    uint32_t input = 0;
            GPIO_TypeDef * port = gpio_port_ptr( m_arguments.at(0)->toUInt() );
		    if ( nargs == 1 )
		    {
                input = GPIO_ReadInputData(port);
		    }
 		    else if ( nargs == 2 )
		    {
                input = GPIO_ReadInputDataBit(port, static_cast<uint16_t>(1 << m_arguments.at(1)->toUInt()));
		    }
            rc.fromUInt( input );
            fn_exit(nargs);
		}
        rc.set_type(variable::TYPE_INTEGER);
		return rc;
	}

	/// <#> OUT#(PORT#,BITS#)
	/// <#> OUT#(PORT#,BIT#,BOOL)
	variable CFunction::fn_out()
	{
	    variable rc;
	    int nargs;
		if ( (nargs=fn_enter(2,3)) >= 2 )
		{
		    uint32_t input = 0;
            GPIO_TypeDef * port = gpio_port_ptr( m_arguments.at(0)->toUInt() );
            if ( nargs == 2 )
            {
                GPIO_Write( port, static_cast<uint16_t>(m_arguments.at(1)->toUInt()) );
                input = GPIO_ReadInputData(port);
            }
            else if ( nargs == 3 )
            {
                uint16_t bit = static_cast<uint16_t>(1 << m_arguments.at(1)->toUInt());
                GPIO_WriteBit( port,
                               bit,
                               static_cast<BitAction>(m_arguments.at(2)->toUInt()) );
                input = GPIO_ReadInputDataBit(port, bit);
            }
            rc.fromUInt( input );
            fn_exit(nargs);
		}
        rc.set_type(variable::TYPE_INTEGER);
		return rc;
	}
    #endif // __STM32__

 	/// <double> ABS(NUM)
	CVariable CFunction::fn_abs()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
			double t = m_arguments.at(0)->toDouble();
			if ( t < 0.0 )
			{
				t = t - (t*2);
			}
		    rc.fromDouble( t );
            fn_exit(1);
		}
		return rc;
	}

   /// <int> USR#(ADDR#)
	CVariable CFunction::fn_usr()
	{
	    CVariable rc(autoname());
		if ( fn_enter(2) == 2 )
		{
		    // FIXME - do something here
            fn_exit(2);
		}
		return rc;
	}

	/// <int> POKE#(ADDR#,DATA#,WIDTH#))
	CVariable CFunction::fn_poke()
	{
	    CVariable rc(autoname());
		if ( fn_enter(3) == 3 )
		{
			void* p = (char*)m_arguments.at(0)->toUInt();
		    uint32_t width = m_arguments.at(2)->toUInt();   // word size
		    switch(width)
		    {
		        case 1: *((uint8_t*)p) = (uint8_t)(m_arguments.at(1)->toUInt());    break;
		        case 2: *((uint16_t*)p) = (uint16_t)(m_arguments.at(1)->toUInt());  break;
		        case 4: *((uint32_t*)p) = (uint32_t)(m_arguments.at(1)->toUInt());  break;
            }
            fn_exit(3);
		}
        rc.set_type(CVariable::TYPE_INTEGER);
		return rc;
	}

	///  <int> PEEK#(ADDR#,WIDTH#)
	CVariable CFunction::fn_peek()
	{
	    CVariable rc(autoname());
		if ( fn_enter(2) == 2 )
		{
		    uint32_t width = m_arguments.at(1)->toUInt();   // word size
		    void* p = (void*)(m_arguments.at(0)->toUInt()); // peek address
		    switch(width)
		    {
		        case 1: rc.fromUInt( *((uint8_t*)p) );    break;
		        case 2: rc.fromUInt( *((uint16_t*)p) );   break;
		        case 4: rc.fromUInt( *((uint32_t*)p) );   break;
            }
            fn_exit(2);
 		}
       rc.set_type(CVariable::TYPE_INTEGER);
		return rc;
	}

	/// <$> LEFT$(STR$,CNT%)
	CVariable CFunction::fn_left()
	{
	    CVariable rc(autoname());
		if ( fn_enter(2) == 2 )
		{
			rc = m_arguments.at(0)->left(m_arguments.at(1)->toUInt());
            fn_exit(2);
		}
		return rc;
	    rc.set_type(CVariable::TYPE_STRING);
	}

	/// <$> RIGHT$(STR$,CNT%)
	CVariable CFunction::fn_right()
	{
	    CVariable rc(autoname());
		if ( fn_enter(2) == 2 )
		{
			rc = m_arguments.at(0)->right(m_arguments.at(1)->toUInt());
            fn_exit(2);
		}
	    rc.set_type(CVariable::TYPE_STRING);
		return rc;
	}

	/// <$> MID$(STR$,POS%,CNT%)
	CVariable CFunction::fn_mid()
	{
	    CVariable rc(autoname());
		if ( fn_enter(3) == 3 )
		{
			rc = m_arguments.at(0)->mid(m_arguments.at(1)->toUInt(),m_arguments.at(2)->toUInt());
            fn_exit(3);
		}
	    rc.set_type(CVariable::TYPE_STRING);
		return rc;
	}

	/// <int> LEN#(STR$)
	CVariable CFunction::fn_len()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    rc.fromInt( m_arguments.at(0)->length() );
            fn_exit(1);
		}
        rc.set_type(CVariable::TYPE_INTEGER);
		return rc;
	}

    /// <void> SRAND(<INTEGER>)
    CVariable CFunction::fn_srand()
    {
	    CVariable rc(autoname());
        if ( fn_enter(1) == 1 )
        {
            srand( m_arguments.at(0)->toInt() );
            fn_exit(1);
        }
        return rc;
    }

    /// <double> RAND()
    CVariable CFunction::fn_rand()
    {
	    CVariable rc(autoname());
        if ( fn_enter(0) == 0 )
        {
            rc.fromInt( rand() );
            fn_exit(0);
        }
        return rc;
    }

    /// <double> PI()
    CVariable CFunction::fn_pi()
    {
	    CVariable rc(autoname());
        if ( fn_enter(0) == 0 )
        {
            rc.fromDouble( PI_CONST );
            fn_exit(0);
        }
        return rc;
    }

	/// <double> SIN(NUM)
	CVariable CFunction::fn_sin()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    rc.fromDouble( sin( m_arguments.at(0)->toDouble() ) );
            fn_exit(1);
		}
		return rc;
	}

	/// <double> COS(NUM)
	CVariable CFunction::fn_cos()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    rc.fromDouble( cos( m_arguments.at(0)->toDouble() ) );
            fn_exit(1);
		}
		return rc;
	}

	/// <double> TAN(NUM)
	CVariable CFunction::fn_tan()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    rc.fromDouble( tan( m_arguments.at(0)->toDouble() ) );
            fn_exit(1);
		}
		return rc;
	}

	/// <double> MOD#(NUM,NUM)
	CVariable CFunction::fn_mod()
	{
	    CVariable rc(autoname());
		if ( fn_enter(2) == 2 )
		{
		    rc.fromDouble( m_arguments.at(0)->toInt() % m_arguments.at(1)->toInt() );
            fn_exit(2);
		}
        rc.set_type(CVariable::TYPE_INTEGER);
		return rc;
	}

	/// <number> VAL(STR$)
	CVariable CFunction::fn_val()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    CVariable* arg0 = m_arguments.at(0);
		    if ( static_cast<CARIBOU::CString*>(arg0)->find("0x") == 0 || static_cast<CARIBOU::CString*>(arg0)->find("0X") == 0 )
		    {
		        rc.fromUInt( arg0->fromHex() );
                rc.set_type(CVariable::TYPE_INTEGER);
		    }
		    else if ( static_cast<CARIBOU::CString*>(arg0)->find(".") >= 0 )
		    {
		        rc.fromDouble( arg0->toDouble() );
                rc.set_type(CVariable::TYPE_NUMBER);
		    }
		    else
		    {
		        rc.fromInt( arg0->toInt() );
                rc.set_type(CVariable::TYPE_INTEGER);
		    }
            fn_exit(1);
		}
		return rc;
	}

	/// <$> HEX$(NUM)
	CVariable CFunction::fn_hex()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    CVariable* arg0 = m_arguments.at(0);
		    rc.toHex( (uint32_t)arg0->toUInt() );
            fn_exit(1);
		}
	    rc.set_type(CVariable::TYPE_STRING);
		return rc;
	}

	/// <int> FREE()
	CVariable CFunction::fn_free()
	{
	    CVariable rc(autoname());
		if ( fn_enter(0) == 0 )
		{
            rc.fromUInt( bytes_free() );
            fn_exit(0);
		}
	    rc.set_type(CVariable::TYPE_INTEGER);
	    return rc;
	}

	/// <$> INPUT$()
	CVariable CFunction::fn_input()
	{
	    CVariable rc(autoname());
	    if ( fn_enter(0) == 0 )
	    {
	        rc = input();
	        fn_exit(0);
	    }
	    rc.set_type(CVariable::TYPE_STRING);
	    return rc;
	}

	/// <$> CHR$(NUM)
	CVariable CFunction::fn_chr()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    CVariable* arg0 = m_arguments.at(0);
		    rc.append((char)(arg0->toUInt()&0xFF));
            fn_exit(1);
		}
	    rc.set_type(CVariable::TYPE_STRING);
		return rc;
	}

	/// <""> SLEEP(NUM) millisecond sleep
	CVariable CFunction::fn_sleep()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    CVariable* arg0 = m_arguments.at(0);
		    caribou_thread_sleep( caribou_thread_current(), from_ms( arg0->toUInt() ) );
            fn_exit(1);
		}
	    rc.set_type(CVariable::TYPE_STRING);
		return rc;
	}

	/// <INT> INT(NUM)
	CVariable CFunction::fn_int()
	{
	    CVariable rc(autoname());
		if ( fn_enter(1) == 1 )
		{
		    CVariable* arg0 = m_arguments.at(0);
		    rc.fromInt( arg0->toUInt() );
            fn_exit(1);
		}
	    rc.set_type(CVariable::TYPE_INTEGER);
		return rc;
	}

} // namespace CARIBOU_BASIC
