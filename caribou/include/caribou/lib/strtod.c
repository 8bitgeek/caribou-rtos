/* vi:set ts=8 sts=4 sw=4: */
/*
 * strtod implementation.
 * author: Yasuhiro Matsumoto
 * license: public domain
 */
#include <caribou/lib/stdio.h>
#include <caribou/lib/stdlib.h>
#include <caribou/lib/string.h>
#include <caribou/lib/cbmath.h>
#include <caribou/kernel/types.h>
#include <caribou/lib/errno.h>

static char* skipwhite(char	*q)
{
    char	*p = q;
    while (isspace(*p))
	++p;
    return p;
}
#define vim_isdigit(x) isdigit(x)

extern double strtod(const char *str, char **end)
{
    double d = 0.0;
    int sign;
    int n = 0;
    const char *p, *a;

    a = p = str;
    p = skipwhite(p);

    /* decimal part */
    sign = 1;
    if (*p == '-')
    {
	sign = -1;
	++p;
    } else if (*p == '+')
	++p;
    if (vim_isdigit(*p))
    {
	d = (double)(*p++ - '0');
	while (*p && vim_isdigit(*p))
	{
	    d = d * 10.0 + (double)(*p - '0');
	    ++p;
	    ++n;
	}
	a = p;
    } else if (*p != '.')
	goto done;
    d *= sign;

    /* fraction part */
    if (*p == '.')
    {
	double f = 0.0;
	double base = 0.1;
	++p;

	if (vim_isdigit(*p))
	{
	    while (*p && vim_isdigit(*p))
	    {
		f += base * (*p - '0') ;
		base /= 10.0;
		++p;
		++n;
	    }
	}
	d += f * sign;
	a = p;
    }

    /* exponential part */
    if ((*p == 'E') || (*p == 'e'))
    {
	int e = 0;
	++p;

	sign = 1;
	if (*p == '-')
	{
	    sign = -1;
	    ++p;
	} else if (*p == '+')
	    ++p;

	if (vim_isdigit(*p))
	{
	    while (*p == '0')
		++p;
            if (*p == '\0') --p;
	    e = (int)(*p++ - '0');
	    while (*p && vim_isdigit(*p))
	    {
		e = e * 10 + (int)(*p - '0');
		++p;
	    }
	    e *= sign;
	}
	else if (!vim_isdigit(*(a-1)))
	{
	    a = str;
	    goto done;
	}
	else if (*p == 0)
	    goto done;

	if (d == 2.2250738585072011 && e == -308)
	{
	    d = 0.0;
	    a = p;
	    errno = ERANGE;
	    goto done;
	}
	if (d == 2.2250738585072012 && e <= -308)
	{
	    d *= 1.0e-308;
	    a = p;
	    goto done;
	}
	d *= pow(10.0, (double) e);
	a = p;
    }
    else if (p > str && !vim_isdigit(*(p-1)))
    {
	a = str;
	goto done;
    }

done:
    if (end)
	*end = (char*)a;
    return d;
}
