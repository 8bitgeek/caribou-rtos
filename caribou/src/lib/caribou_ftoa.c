/*
 ________  ________  ________  ___  ________  ________  ___  ___          ________  _________  ________  ________      
|\   ____\|\   __  \|\   __  \|\  \|\   __  \|\   __  \|\  \|\  \        |\   __  \|\___   ___\\   __  \|\   ____\     
\ \  \___|\ \  \|\  \ \  \|\  \ \  \ \  \|\ /\ \  \|\  \ \  \\\  \       \ \  \|\  \|___ \  \_\ \  \|\  \ \  \___|_    
 \ \  \    \ \   __  \ \   _  _\ \  \ \   __  \ \  \\\  \ \  \\\  \       \ \   _  _\   \ \  \ \ \  \\\  \ \_____  \   
  \ \  \____\ \  \ \  \ \  \\  \\ \  \ \  \|\  \ \  \\\  \ \  \\\  \       \ \  \\  \|   \ \  \ \ \  \\\  \|____|\  \  
   \ \_______\ \__\ \__\ \__\\ _\\ \__\ \_______\ \_______\ \_______\       \ \__\\ _\    \ \__\ \ \_______\____\_\  \ 
    \|_______|\|__|\|__|\|__|\|__|\|__|\|_______|\|_______|\|_______|        \|__|\|__|    \|__|  \|_______|\_________\
                                                                                                           \|_________|                                                                                                                       
*/

#include <caribou/lib/caribou_ftoa.h>

#define MAX_PRECISION	(10)

static const float rounders[MAX_PRECISION + 1] =
{
	0.5,				// 0
	0.05,				// 1
	0.005,				// 2
	0.0005,				// 3
	0.00005,			// 4
	0.000005,			// 5
	0.0000005,			// 6
	0.00000005,			// 7
	0.000000005,		// 8
	0.0000000005,		// 9
	0.00000000005		// 10
};

char * caribou_ftoa(float f, char * buf, int precision)
{
	char * ptr = buf;
	char * p = ptr;
	char * p1;
	char c;
	long intPart;

	// check precision bounds
	if (precision > MAX_PRECISION)
		precision = MAX_PRECISION;

	// sign stuff
	if (f < 0)
	{
		f = -f;
		*ptr++ = '-';
	}

	if (precision < 0)  // negative precision == automatic precision guess
	{
		if (f < 1.0) precision = 6;
		else if (f < 10.0) precision = 5;
		else if (f < 100.0) precision = 4;
		else if (f < 1000.0) precision = 3;
		else if (f < 10000.0) precision = 2;
		else if (f < 100000.0) precision = 1;
		else precision = 0;
	}

	// round value according the precision
	if (precision)
		f += rounders[precision];

	// integer part...
	intPart = f;
	f -= intPart;

	if (!intPart)
		*ptr++ = '0';
	else
	{
		// save start pointer
		p = ptr;

		// convert (reverse order)
		while (intPart)
		{
			*p++ = '0' + intPart % 10;
			intPart /= 10;
		}

		// save end pos
		p1 = p;

		// reverse result
		while (p > ptr)
		{
			c = *--p;
			*p = *ptr;
			*ptr++ = c;
		}

		// restore end pos
		ptr = p1;
	}

	// decimal part
	if (precision)
	{
		// place decimal point
		*ptr++ = '.';

		// convert
		while (precision--)
		{
			f *= 10.0;
			c = f;
			*ptr++ = '0' + c;
			f -= c;
		}
	}

	// terminating zero
	*ptr = 0;

	return buf;
}
