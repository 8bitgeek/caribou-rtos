/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/kernel/types.h>
#include <caribou/lib/cbmath.h>
#include <caribou/lib/math_private.h>

#define PZERO 38			/* index of 1e0 in powten[]	*/
#define PMAX 76				/* highest index of powten[]	*/
#define HUGE_NOR 1.70141183460469228		/* normalised HUGE	*/
#define PZERO 38		/* index of 1e0 in powten[]	*/
#define PMAX 76			/* highest index in powten[]	*/

const double powten[] = {
	1e-38, 1e-37, 1e-36, 1e-35, 1e-34, 1e-33,
	1e-32, 1e-31, 1e-30, 1e-29, 1e-28, 1e-27, 1e-26, 1e-25, 1e-24,
	1e-23, 1e-22, 1e-21, 1e-20, 1e-19, 1e-18, 1e-17, 1e-16, 1e-15,
	1e-14, 1e-13, 1e-12, 1e-11, 1e-10, 1e-9, 1e-8, 1e-7, 1e-6, 1e-5,
	1e-4, 1e-3, 1e-2, 1e-1, 1e0, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7,
	1e8, 1e9, 1e10, 1e11, 1e12, 1e13, 1e14, 1e15, 1e16, 1e17, 1e18,
	1e19, 1e20, 1e21, 1e22, 1e23, 1e24, 1e25, 1e26, 1e27, 1e28, 1e29,
	1e30, 1e31, 1e32, 1e33, 1e34, 1e35, 1e36, 1e37, 1e38
};

static const double	two54		=  1.80143985094819840000e+16; /* 0x43500000, 0x00000000 */
static const double	ivln10		=  4.34294481903251816668e-01; /* 0x3FDBCB7B, 0x1526E50E */
static const double	log10_2hi	=  3.01029995663611771306e-01; /* 0x3FD34413, 0x509F6000 */
static const double	log10_2lo	=  3.69423907715893078616e-13; /* 0x3D59FEF3, 0x11F12B36 */
static const double	ln2_hi		=  6.93147180369123816490e-01;	/* 3fe62e42 fee00000 */
static const double	ln2_lo		=  1.90821492927058770002e-10;	/* 3dea39ef 35793c76 */
static const double	Lg1			=  6.666666666666735130e-01;  /* 3FE55555 55555593 */
static const double	Lg2			=  3.999999999940941908e-01;  /* 3FD99999 9997FA04 */
static const double	Lg3			=  2.857142874366239149e-01;  /* 3FD24924 94229359 */
static const double	Lg4			=  2.222219843214978396e-01;  /* 3FCC71C5 1D8E78AF */
static const double	Lg5			=  1.818357216161805012e-01;  /* 3FC74664 96CB03DE */
static const double	Lg6			=  1.531383769920937332e-01;  /* 3FC39A09 D078C69F */
static const double	Lg7			=  1.479819860511658591e-01;  /* 3FC2F112 DF3E5244 */
static const double	zero		=  0.0;

/**
 * @brief Integer exponentiation
 */
int ipow(int base, int exp)
{
    int result = 1;
    while (exp)
    {
        if (exp & 1)
            result *= base;
        exp >>= 1;
        base *= base;
    }

    return result;
}

/**
* @brief Convert an IEEE 754 number to ASCII
* @param buff space for result string
* @param conv conversion type 'e', 'f', or 'g' others default to e
* @param bsize size of allocated buffer
* @param dplace places after the point
* @param value value to converted
*/
double dtoa(register char *buff, char conv, int bsize, int dplace, double value)
{
	double modf(), v;
	register int i;
	int imax;
	int j;
	int exp;
	int ndigits;
	int nlead;

	/* set default value of dplace */
	if (dplace < 0)
		dplace = 6;

	/* strip off sign */
	if (value < 0.0)
	{
		value = -value;
		*buff++ = '-';
	}

	/* scale and compute no of leading digits */
	if (value == 0.0)
		imax = PZERO;
	else
	{
		for (imax = PMAX; value < powten[imax] && imax > 0; imax--)
		{
			if (conv == 'f' && imax <= PZERO)
			break;
		}
	}
	exp = imax - PZERO;
	nlead = exp + 1;

	/* decide if 'g' goes to 'e' or 'f' */
	if (conv == 'g')
	{
		if (nlead > 6)
			conv = 'e';
		else
			conv = 'f';
	}

	/* compute no of digits to print */
	/* change 'f' to 'e' if insufficient space for result */
	if (conv == 'f')
	{
		ndigits = dplace + nlead;
		if (ndigits + 3 > bsize)
		{
			conv = 'e';
			dplace = SIGFIGS;
		}
	}
	if (conv != 'f')
	{
		nlead  = 1;
		ndigits = dplace + nlead;
		if (ndigits > SIGFIGS)
			ndigits = SIGFIGS;
	}

	/* scale to range 1.0 - 10.0 and round up */
	if (conv == 'e' && imax == 0 && value < powten[0])
	{
		value *= 10.0;
		exp--;
	}
	value = value / powten[imax] + 0.5 * powten[PZERO - ndigits + 1];
	value = modf(value, &v);
	if (v >= 10.0)
	{
		*buff++ = '1';
		v -= 10.0;
	}

	/* build digit string */
	for (i = 0; i < ndigits; i++)
	{
		if (i == nlead)
			*buff++ = '.';
		*buff++ = (int)v + '0';
		value = modf(value * 10.0, &v);
		//caribou_thread_yield();
	}

	/* if not 'f' print exponent part */
	if (conv != 'f')
	{
		*buff++ = 'e';
		if (exp < 0)
		{
			exp = -exp;
			*buff++ = '-';
		}
		else
			*buff++ = '+';
		j = exp/10;
		*buff++ = '0' + j;
		*buff++ = '0' + exp - 10*j;
	}
	/* print final null */
	*buff++ = '\0';

	return value;
}

/**
* @brief convert a string to double
* @return resulting double
*/
double atof(const char* s)
{
	double val;
	int i, j, sign, esign, ex, ex1;

	/* skip white space */
	for (i=0; s[i]==' ' || s[i]=='\n' || s[i]=='\t'; i++);
	/* set sign to be +1 or -1 */
	sign = 1;
	if (s[i] == '+' || s[i] == '-')	/* sign */
		sign = (s[i++]=='+') ? 1 : -1;
	/* read digits and build value for as long as there are digits */
	ex = PZERO - 1;
	for (val = 0.0, j = PZERO; s[i] >= '0' && s[i] <= '9'; i++)
	{
		if (j >= 0)
			val += powten[j] * (s[i] - '0');
		j--;
		ex++;
	}
	/* if first non-digit is decimal point skip it and keep going */
	/* if it is not a decimal point we fall through to test for exponent */
	if (s[i] == '.')
		i++;
	/* continue to build value while the digits keep coming */
	for (; s[i] >= '0' && s[i] <= '9'; i++)
	{
		if (j >= 0)
			val += powten[j] * (s[i] - '0');
		j--;
	}
	/* if non-digit was an exponent flag deal with exponent */
	if (s[i]=='e' || s[i]=='E' || s[i]=='d' || s[i]=='D')
	{
		i++;
		esign = 1;
		/* check for explicit + or - sign in exponent and deal with it */
		if (s[i] == '+' || s[i] == '-')
			esign = (s[i++]=='+') ? 1 : -1;
		for (ex1 = 0; s[i] >= '0' && s[i] <= '9'; i++)
			ex1 = 10 * ex1 + s[i] - '0';
		ex += ex1 * esign;
	}
	/* incorporate exponent into val */
	if (ex < 0)
		val = 0.0;
	else if (ex < PMAX || (ex == PMAX && val < HUGE_NOR))
		val *= powten[ex];
	else
	{
		//cmemsg(FP_BIGI, s);
		val = HUGE;
	}
	/* check that we have an acceptable termination; if not call error system
	before returning with what we have */
	if (s[i] != ' ' && s[i] != '\t' && s[i] != '\n' && s[i] != '\0')
	{
		/* cmemsg(FP_BADC, s) */
	}
	return sign*val;
}

#ifndef __CROSSWORKS_ARM

/* log10(x)
 * Return the base 10 logarithm of x
 *
 * Method :
 *	Let log10_2hi = leading 40 bits of log10(2) and
 *		log10_2lo = log10(2) - log10_2hi,
 *		ivln10	= 1/log(10) rounded.
 *	Then
 *		n = ilogb(x),
 *		if(n<0)  n = n+1;
 *		x = scalbn(x,-n);
 *		log10(x) := n*log10_2hi + (n*log10_2lo + ivln10*log(x))
 *
 * Note 1:
 *	To guarantee log10(10**n)=n, where 10**n is normal, the rounding
 *	mode must set to Round-to-Nearest.
 * Note 2:
 *	[1/log(10)] rounded to 53 bits has error  .198	ulps;
 *	log10 is monotonic at all binary break points.
 *
 * Special cases:
 *	log10(x) is NaN with signal if x < 0;
 *	log10(+INF) is +INF with no signal; log10(0) is -INF with signal;
 *	log10(NaN) is that NaN with no signal;
 *	log10(10**N) = N  for N=0,1,...,22.
 *
 * Constants:
 * The hexadecimal values are the intended ones for the following constants.
 * The decimal values may be used, provided that the compiler will convert
 * from decimal to binary accurately enough to produce the hexadecimal values
 * shown.
 */
double log10(double x)
{
	double y,z;
	int32_t i,k,hx;
	uint32_t lx;

	EXTRACT_WORDS(hx,lx,x);

	k=0;
	if (hx < 0x00100000)						/* x < 2**-1022  */
	{
		if (((hx&0x7fffffff)|lx)==0)
			return -two54/zero;				/* log(+-0)=-inf */
		if (hx<0) return (x-x)/zero;			/* log(-#) = NaN */
		k -= 54; x *= two54;					/* subnormal number, scale up x */
		GET_HIGH_WORD(hx,x);
	}
	if (hx >= 0x7ff00000) return x+x;
	k += (hx>>20)-1023;
	i  = ((uint32_t)k&0x80000000)>>31;
	hx = (hx&0x000fffff)|((0x3ff-i)<<20);
	y  = (double)(k+i);
	SET_HIGH_WORD(x,hx);
	z  = y*log10_2lo + ivln10*log(x);
	return  z+y*log10_2hi;
}


/* log(x)
 * Return the logrithm of x
 *
 * Method :
 *	1. Argument Reduction: find k and f such that
 *			x = 2^k * (1+f),
 *	   where  sqrt(2)/2 < 1+f < sqrt(2) .
 *
 *	2. Approximation of log(1+f).
 *	Let s = f/(2+f) ; based on log(1+f) = log(1+s) - log(1-s)
 *		 = 2s + 2/3 s**3 + 2/5 s**5 + .....,
 *			 = 2s + s*R
 *	   We use a special Reme algorithm on [0,0.1716] to generate
 *	a polynomial of degree 14 to approximate R The maximum error
 *	of this polynomial approximation is bounded by 2**-58.45. In
 *	other words,
 *				2	   4	   6	   8	   10	   12	   14
 *		R(z) ~ Lg1*s +Lg2*s +Lg3*s +Lg4*s +Lg5*s  +Lg6*s  +Lg7*s
 *	(the values of Lg1 to Lg7 are listed in the program)
 *	and
 *		|	   2		   14		   |	  -58.45
 *		| Lg1*s +...+Lg7*s	 -  R(z) | <= 2
 *		|							  |
 *	Note that 2s = f - s*f = f - hfsq + s*hfsq, where hfsq = f*f/2.
 *	In order to guarantee error in log below 1ulp, we compute log
 *	by
 *		log(1+f) = f - s*(f - R)	(if f is not too large)
 *		log(1+f) = f - (hfsq - s*(hfsq+R)).	(better accuracy)
 *
 *	3. Finally,  log(x) = k*ln2 + log(1+f).
 *				= k*ln2_hi+(f-(hfsq-(s*(hfsq+R)+k*ln2_lo)))
 *	   Here ln2 is split into two floating point number:
 *			ln2_hi + ln2_lo,
 *	   where n*ln2_hi is always exact for |n| < 2000.
 *
 * Special cases:
 *	log(x) is NaN with signal if x < 0 (including -INF) ;
 *	log(+INF) is +INF; log(0) is -INF with signal;
 *	log(NaN) is that NaN with no signal.
 *
 * Accuracy:
 *	according to an error analysis, the error is always less than
 *	1 ulp (unit in the last place).
 *
 * Constants:
 * The hexadecimal values are the intended ones for the following
 * constants. The decimal values may be used, provided that the
 * compiler will convert from decimal to binary accurately enough
 * to produce the hexadecimal values shown.
 */
double log(double x)
{
	double hfsq,f,s,z,R,w,t1,t2,dk;
	int32_t k,hx,i,j;
	uint32_t lx;

	EXTRACT_WORDS(hx,lx,x);

	k=0;
	if (hx < 0x00100000)				/* x < 2**-1022  */
	{
		if (((hx&0x7fffffff)|lx)==0)
		return -two54/zero;			/* log(+-0)=-inf */
		if (hx<0) return (x-x)/zero;	/* log(-#) = NaN */
		k -= 54; x *= two54;			/* subnormal number, scale up x */
		GET_HIGH_WORD(hx,x);
	}
	if (hx >= 0x7ff00000)
		return x+x;
	k += (hx>>20)-1023;
	hx &= 0x000fffff;
	i = (hx+0x95f64)&0x100000;
	SET_HIGH_WORD(x,hx|(i^0x3ff00000));	/* normalize x or x/2 */
	k += (i>>20);
	f = x-1.0;
	if((0x000fffff&(2+hx))<3)			/* |f| < 2**-20 */
	{
		if(f==zero)
		{
			if(k==0)
				return zero;
			else
			{
				dk=(double)k;
				return dk*ln2_hi+dk*ln2_lo;
			}
		}
		R = f*f*(0.5-0.33333333333333333*f);
		if(k==0)
			return f-R;
		else
		{
			dk=(double)k;
			return dk*ln2_hi-((R-dk*ln2_lo)-f);
		}
	}
	s = f/(2.0+f);
	dk = (double)k;
	z = s*s;
	i = hx-0x6147a;
	w = z*z;
	j = 0x6b851-hx;
	t1= w*(Lg2+w*(Lg4+w*Lg6));
	t2= z*(Lg1+w*(Lg3+w*(Lg5+w*Lg7)));
	i |= j;
	R = t2+t1;
	if(i>0)
	{
		hfsq=0.5*f*f;
		if(k==0)
			return f-(hfsq-s*(hfsq+R));
		else
			 return dk*ln2_hi-((hfsq-(s*(hfsq+R)+dk*ln2_lo))-f);
	}
	else
	{
		if(k==0)
			return f-s*(f-R);
		else
			 return dk*ln2_hi-((s*(f-R)-dk*ln2_lo)-f);
	}
}

#endif /* __CROSSWORKS_ARM */