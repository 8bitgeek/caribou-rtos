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
#ifndef _CBMATH_H_
#define _CBMATH_H_

/*
 * absolute constants
 */

#define PI 3.14159265358979324		/* pi				*/
#define HALF_PI 1.57079632679489662	/* pi/2				*/
#define REC_PI 0.318309886183790672	/* 1/pi				*/
#define RPIBY2 0.636619772367581343	/* reciprocal of pi/2		*/
#define E 2.718281828459045235		/* e				*/
#define LOGBE2 0.69314718055994530942	/* log of 2 to base e		*/
#define LOGB2E 1.44269504088896341	/* log of e to base 2		*/
#define ROOT_2 1.4142135623730950488	/* square root of 2		*/
#define ROOT_3  1.732050807568877293	/* square root of 3		*/

/*
 * checked octal constants
 */

#define PI_BY_2 1.57079632679489662	/* pi/2				*/
#define PI_BY_4 0.785398163397448310	/* pi/4				*/
#define LOGB10E 0.434294481903251828	/* log of e to base 10		*/
#define ROOT_05 0.70710678118654752440	/* square root of 0.5		*/

/*
 * system dependent constants
 */

#define TINY 0.293873587705571877E-38	/* smallest no = 2**-128	*/
#define HUGE 0.170141183460469230E+39	/* largest no = 2**+127		*/
#define LOG_HUGE 0.880296919311130543E+02	/* log of HUGE		*/
#define LOG_TINY -0.887228391116729997E+02	/* log of TINY		*/
#define MIN_EXP -128			/* minimum base 2 exponent	*/
#define MAX_EXP 127			/* maximum base 2 exponent	*/
#define MAXLONG 017777777777L		/* largest long integer		*/
#define SIGFIGS 18			/* max no useful digits in dtoa	*/
#define TRIG_MAX 3.1415926535897932385e12/* arg limit for trig functions*/
#define ROOT_EPS 0.372529029846191406e-8	/* 2**-(t/2), t = 56	*/
#define REC_HUGE 0.587747175411143754E-38/* 2**-127 = 1 / HUGE		*/

/*
 * error codes to communicate with cmathe
 */

#define FP_OPER 1		/* FPU op code error			*/
#define FP_ZDIV 2		/* FPU divide by zero			*/
#define FP_FTOI 3		/* FPU float to integer conv error	*/
#define FP_OFLO 4		/* FPU overflow				*/
#define FP_UFLO 5		/* FPU underflow			*/
#define FP_UDEF 6		/* FPU undefined variable (-0)		*/
#define FP_BIGI 7		/* Atof input too large			*/
#define FP_BADC 8		/* Bad character in atof input string	*/
#define FP_NESQ 9		/* Square root of negative number	*/
#define FP_LEXP	10		/* Exp argument too large		*/
#define FP_SEXP 11		/* Exp argument too small		*/
#define FP_NLOG 12		/* Log argument zero or negative	*/
#define FP_TANE 13		/* Argument of tan too large		*/
#define FP_TRIG 14		/* Argument of sin/cos too large	*/
#define FP_ATAN 15		/* Atan2 arguments both zero		*/
#define FP_COTE 16		/* Argument of cotan too small		*/
#define FP_ARSC 17		/* Bad argument for asin/acos		*/
#define FP_SINH 18		/* Argument of sinh too large		*/
#define FP_COSH 19		/* Argument of cosh too large		*/
#define FP_POWN 20		/* Negative argument in pow		*/
#define FP_POWO 21		/* Result of pow overflows		*/
#define FP_POWU 22		/* Result of pow underflows		*/

/* numbers of each type of error - used to determine argument type	*/

#define FP_NFPU 6		/* No of FPU generated errors		*/
#define FP_NSTR 2		/* No of string argument errors		*/
#define FP_NMAR 14		/* No of math routine double arg errors	*/

/* The following define error codes which are assigned to $$ferr by
 * the cmathe error package. They will be flagged as unknown errors by
 * the perror() function and these error numbers printed.  Normally that
 * error reporting mechanism will not be used, it has been included for
 * benefit of programs which have been transported from systems which
 * use the perror() function.						*/

#ifndef SIGFPE
	#define SIGFPE	108	/* floating point exception error		*/
#endif
#ifndef EDOM
	#define EDOM	133	/* domain error (input argument inadmissable)	*/
#endif
#ifndef ERANGE
	#define ERANGE	134	/* range error (result too large or small)	*/
#endif


#ifdef __cplusplus
extern "C"
{
#endif

#ifndef __CROSSWORKS_ARM
extern double modf(double x, double *iptr);
extern double log10(double x);
extern double log(double x);
#endif /* __CROSSWORKS_ARM */
extern double dtoa(char *buff, char conv, int bsize, int dplace, double value);
extern double atof(const char* s);

#ifdef __cplusplus
}
#endif

#endif /* _MATH_H_ */
