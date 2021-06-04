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
#include <caribou.h>
#include <caribou/kernel/thread.h>
#include <caribou/lib/stdio.h>
#include <caribou/lib/heap.h>
#include <caribou/lib/string.h>
#include <caribou/lib/stdarg.h>
#include <caribou/lib/cbmath.h>
#include <caribou/lib/caribou_ftoa.h>
#include <caribou/dev/uart.h>
#include <chip/uart.h>

stdio_t* _stdin=0;
stdio_t* _stdout=0;
stdio_t* _stderr=0;

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12
#define PAD_RIGHT 1
#define PAD_ZERO 2
#define ISSPACE " \t\n\r\f\v"
#define MAXLN	255

#define in_range(c, lo, up)  ((uint8_t)c >= lo && (uint8_t)c <= up)
#define isprint(c)           in_range(c, 0x20, 0x7f)
#define isdigit(c)           in_range(c, '0', '9')
#define isxdigit(c)          (isdigit(c) || in_range(c, 'a', 'f') || in_range(c, 'A', 'F'))
#define islower(c)           in_range(c, 'a', 'z')
#define isspace(c)           (c == ' ' || c == '\f' || c == '\n' || c == '\r' || c == '\t' || c == '\v')

static char *_getbase(char *p, int *basep)
{
	if (p[0] == '0') {
		switch (p[1]) {
		case 'x':
			*basep = 16;
			break;
		case 't': case 'n':
			*basep = 10;
			break;
		case 'o':
			*basep = 8;
			break;
		default:
			*basep = 10;
			return (p);
		}
		return (p + 2);
	}
	*basep = 10;
	return (p);
}


/*
 *  _atob(vp,p,base)
 */
static int _atob (unsigned long long *vp, char *p, int base)
{
	unsigned long long value, v1, v2;
	char *q, tmp[20];
	int digit;

	if (p[0] == '0' && (p[1] == 'x' || p[1] == 'X')) {
		base = 16;
		p += 2;
	}

	if (base == 16 && (q = strchr (p, '.')) != 0) {
		if (q - p > sizeof(tmp) - 1)
			return (0);

		strncpy (tmp, p, q - p);
		tmp[q - p] = '\0';
		if (!_atob (&v1, tmp, 16))
			return (0);

		q++;
		if (strchr (q, '.'))
			return (0);

		if (!_atob (&v2, q, 16))
			return (0);
		*vp = (v1 << 16) + v2;
		return (1);
	}

	value = *vp = 0;
	for (; *p; p++) {
		if (*p >= '0' && *p <= '9')
			digit = *p - '0';
		else if (*p >= 'a' && *p <= 'f')
			digit = *p - 'a' + 10;
		else if (*p >= 'A' && *p <= 'F')
			digit = *p - 'A' + 10;
		else
			return (0);

		if (digit >= base)
			return (0);
		value *= base;
		value += digit;
	}
	*vp = value;
	return (1);
}

/*
 *  atob(vp,p,base) 
 *      converts p to binary result in vp, rtn 1 on success
 */
int atob(uint32_t *vp, char *p, int base)
{
	unsigned long long v;

	if (base == 0)
		p = _getbase (p, &base);
	if (_atob (&v, p, base)) {
		*vp = v;
		return (1);
	}
	return (0);
}


/*
 *  llatob(vp,p,base) 
 *      converts p to binary result in vp, rtn 1 on success
 */
int llatob(unsigned long long *vp, char *p, int base)
{
	if (base == 0)
		p = _getbase (p, &base);
	return _atob(vp, p, base);
}


/*
 *  char *btoa(dst,value,base) 
 *      converts value to ascii, result in dst
 */
char *btoa(char *dst, uint32_t value, int base)
{
	char buf[34], digit='?';
	int i, j, rem, neg;

	if (value == 0) {
		dst[0] = '0';
		dst[1] = 0;
		return (dst);
	}

	neg = 0;
	if (base == -10) {
		base = 10;
		if (value & (1L << 31)) {
			value = (~value) + 1;
			neg = 1;
		}
	}

	for (i = 0; value != 0; i++) {
		rem = value % base;
		value /= base;
		if (rem >= 0 && rem <= 9)
			digit = rem + '0';
		else if (rem >= 10 && rem <= 36)
			digit = (rem - 10) + 'a';
		buf[i] = digit;
	}

	buf[i] = 0;
	if (neg)
		strcat (buf, "-");

	/* reverse the string */
	for (i = 0, j = strlen (buf) - 1; j >= 0; i++, j--)
		dst[i] = buf[j];
	dst[i] = 0;
	return (dst);
}

/*
 *  char *btoa(dst,value,base) 
 *      converts value to ascii, result in dst
 */
char *llbtoa(char *dst, unsigned long long value, int base)
{
	char buf[66], digit='?';
	int i, j, rem, neg;

	if (value == 0) {
		dst[0] = '0';
		dst[1] = 0;
		return (dst);
	}

	neg = 0;
	if (base == -10) {
		base = 10;
		if (value & (1LL << 63)) {
			value = (~value) + 1;
			neg = 1;
		}
	}

	for (i = 0; value != 0; i++) {
		rem = value % base;
		value /= base;
		if (rem >= 0 && rem <= 9)
			digit = rem + '0';
		else if (rem >= 10 && rem <= 36)
			digit = (rem - 10) + 'a';
		buf[i] = digit;
	}

	buf[i] = 0;
	if (neg)
		strcat (buf, "-");

	/* reverse the string */
	for (i = 0, j = strlen (buf) - 1; j >= 0; i++, j--)
		dst[i] = buf[j];
	dst[i] = 0;
	return (dst);
}

/*
 *  gethex(vp,p,n) 
 *      convert n hex digits from p to binary, result in vp, 
 *      rtn 1 on success
 */
int gethex(int32_t *vp, char *p, int n)
{
	unsigned long v;
	int digit;

	for (v = 0; n > 0; n--) {
		if (*p == 0)
			return (0);
		if (*p >= '0' && *p <= '9')
			digit = *p - '0';
		else if (*p >= 'a' && *p <= 'f')
			digit = *p - 'a' + 10;
		else if (*p >= 'A' && *p <= 'F')
			digit = *p - 'A' + 10;
		else
			return (0);

		v <<= 4;
		v |= digit;
		p++;
	}
	*vp = v;
	return (1);
}

int _fd(stdio_t* fp)
{
	int fd;
	if ( fp )
	{
		for(fd=0;_stdio_[fd].device_private;fd++)
		{
			if ( fp == &_stdio_[fd] )
				return fd;
		}
	}
	errno = EBADF;
	return -1;
}

extern int fileno(stdio_t* fp)
{
	return _fd(fp);
}

FILE* fopen(int ndev, const char* mode)
{
	FILE* fp=NULL;
	int fd = caribou_uart_open(ndev,NULL);
	if ( fd >= 0 )
	{
		fp = (FILE*)&_stdio_[fd];
	}
	return fp;
}

int fclose(FILE* fp)
{
	int fd = _fd(fp);
	if ( fd >= 0 )
	{
		caribou_uart_close(fd);
	}
	return fd;
}

/**
 * @brief Flush the stream
 */
int fflush(FILE* fp)
{

	return caribou_uart_private_flush(fp);
}

/**
 * @brief Write a character to the FILE* stream.
 * @return return character written or -1 + errno if character was not written.
 */
int fputc(int c, FILE *fp)
{
	if ( fp->writefn(fp,&c,1) == 1 )
	{
		return c;
	}
	return -1;
}

/**
 * @brief Write a character to the FILE* stream.
 * @return return character written or -1 + errno if character was not written.
 */
int putc(int c, FILE *fp)
{
	if ( fp->writefn(fp,&c,1) == 1 )
	{
		return c;
	}
	return -1;
}

__attribute__((weak)) int _fputc(int c, FILE *fp)
{
	return fputc(c, fp);
}

/// Write a characters to the FILE* stream.
/// return number of characters written or -1 + errno if characters where not written.
int fputs(const char *s, FILE *fp)
{
	int len = strlen(s);
	if ( fp->writefn(fp,(char*)s,len) == len )
	{
		return len;
	}
	return -1;
}

/// Write a characters to the FILE* stream.
/// return number of characters written or -1 + errno if characters where not written.
int puts(const char *s)
{
	if ( stdout )
	{
		int length = fputs(s, stdout);
		fputs("\n", stdout);
		return length + 2;
	}
	else
		return -1;
}

/**
 * @brief non-blocking read character from input stream. 
 * @return The character read, or -1 if character not ready or EOF was encountered.
 */
int fgetc(FILE* fp)
{
	if ( fp->readqueuefn(fp) > 0 )
	{
		int ch=0;
		if ( fp->readfn(fp,&ch,1) == 1 )
		{
			return ch;
		}
	}
	return -1;
}

/**
 * @brief fgets() reads in at most one less than size characters from stream and stores them into the buffer pointed
 * to by s.  Reading stops after an EOF or a newline.  If a newline is read, it is stored into the buffer.  A
 * terminating null byte ('\0') is stored after the last character in the buffer.
 * @return gets() and fgets() return s on success, and NULL on error or when end of file occurs while no characters
 * have been read.
 */
char *fgets(char *s, int size, FILE *fp)
{
	if ( size > 0 )
	{
		for( int n=0; n < size-1; n++ )
		{
			int ch = fgetc(fp);
			if ( ch >= 0 )
			{
				s[n] = ch;
				s[n+1]='\0';
				if ( ch == '\r' || ch == '\n' )
				{
					return s;
				}
			}
			caribou_thread_yield();
		}
	}
	return NULL;
}

static void printchar(FILE *fp, char **str, int c)
{
	if (str && *str)
	{
		**str = c;
		++(*str);
	}
	else
	{
		if ( c == '\n')
			_fputc('\r',fp);
		_fputc(c,fp);
	}
}

static int prints(FILE *fp, char **out, const char *string, int width, int pad)
{
	int pc = 0, padchar = ' ';

	if (width > 0)
	{
		int len = 0;
		const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT))
	{
		for ( ; width > 0; --width)
		{
			printchar(fp, out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string)
	{
		printchar(fp, out, *string);
		++pc;
	}
	for ( ; width > 0; --width)
	{
		printchar(fp, out, padchar);
		++pc;
	}

	return pc;
}

static int printi(FILE *fp, char **out, long i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	char *s;
	long t, neg = 0, pc = 0;
	unsigned long u = i;

	if (i == 0)
	{
		print_buf[0] = '0';
		print_buf[1] = '\0';
		return prints (fp, out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0)
	{
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u)
	{
		t = u % b;
		if( t >= 10 )
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg)
	{
		if( width && (pad & PAD_ZERO) ) {
			printchar (fp, out, '-');
			++pc;
			--width;
		}
		else {
			*--s = '-';
		}
	}

	return pc + prints (fp, out, s, width, pad);
}

static int print(FILE *fp, char **out, const char *format, va_list args )
{
	int width, pad;
	int pc = 0;
	char scr[2];
	char precision;

	for (; *format != 0; ++format)
	{
		if (*format == '%')
		{
			++format;
			width = pad = 0;
			precision = 0;
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0')
			{
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format)
			{
				width *= 10;
				width += *format - '0';
			}
			if (*format == '.')
			{
				++format;
				precision=0;
				for ( ; *format >= '0' && *format <= '9'; ++format)
				{
					precision *= 10;
					precision += *format - '0';
				}				
			}

			switch(*format)
			{
				case 's':
				{
					char *s = (char *)va_arg( args, char* );
					pc += prints(fp, out, s?s:"(null)", width, pad);
					break;
				}
				case  'd':
					pc += printi(fp, out, va_arg( args, int ), 10, 1, width, pad, 'a');
					break;
				case  'l':
					pc += printi(fp, out, va_arg( args, long ), 10, 1, width, pad, 'a');
					break;
				case  'x':
					pc += printi(fp, out, va_arg( args, int ), 16, 0, width, pad, 'a');
					break;
				case  'X':
				case  'p':
					pc += printi(fp, out, va_arg( args, int ), 16, 0, width, pad, 'A');
					break;
				case  'u':
					pc += printi(fp, out, va_arg( args, int ), 10, 0, width, pad, 'a');
					break;
				case  'c':
					/* char are converted to int then pushed on the stack */
					scr[0] = (char)va_arg( args, int );
					scr[1] = '\0';
					pc += prints (fp,  out, scr, width, pad );
					break;

				#if defined(CARIBOU_FLOAT)

					#if !defined(USE_NATIVE_STDARG)
						#warning CARIBOU_FLOAT used without USE_NATIVE_STDARG may lead to unpredictable results.
					#endif

					case  'f':
					case  'g':
						{
							char temp[48];
							dtoa(temp,'f',48,precision?(precision-'0'):2,(double)va_arg( args, double ));
							pc += prints(fp, out, temp, width, pad);
						}
						break;

					case  'F': /* requires '_float_(x)'' macro to be used in ... in the case of gcc */
					{
						char temp[48];
						float* f = (float*)va_arg( args, uint32_t /* float */  );
						caribou_ftoa(f,temp,precision?(precision-'0'):2);
						pc += prints(fp, out, temp, width, pad);
					}
					break;

				#endif
			}
		}
		else
		{
		out:
			printchar(fp, out, *format);
			++pc;
		}
	}
	if (out)
	{
		**out = '\0';
	}
	return pc;
}

uint32_t no_promote_to_double( float value )
{
  uint32_t* i = (uint32_t*)&value;
  return *i;
}

/*
 *  scanf(fmt,va_alist) 
 */
int scanf(const char *fmt, ...)
{
    int             count;
    va_list ap;
    
    va_start (ap, fmt);
    count = vfscanf (stdin, fmt, ap);
    va_end (ap);
    return (count);
}

/*
 *  fscanf(fp,fmt,va_alist)
 */
int fscanf(FILE *fp, const char *fmt, ...)
{
    int             count;
    va_list ap;

    va_start (ap, fmt);
    count = vfscanf (fp, fmt, ap);
    va_end (ap);
    return (count);
}

/*
 *  sscanf(buf,fmt,va_alist)
 */
int sscanf(const char *buf, const char *fmt, ...)
{
    int             count;
    va_list ap;
    
    va_start (ap, fmt);
    count = vsscanf (buf, fmt, ap);
    va_end (ap);
    return (count);
}

/*
 *  vfscanf(fp,fmt,ap) 
 */
int vfscanf(FILE *fp, const char *fmt, va_list ap)
{
    int             count;
    char            buf[MAXLN + 1];

	if ( fgets(buf, MAXLN, fp) == 0 )
		return (-1);
    count = vsscanf (buf, fmt, ap);
    return (count);
}

/*
 *  vsscanf(buf,fmt,ap)
 */
int vsscanf(const char *buf, const char *s, va_list ap)
{
    uint32_t count, noassign, width, base, lflag;
    const char   *tc;
    char         *t, tmp[MAXLN];

	base=10;
    count = noassign = width = lflag = 0;
    while (*s && *buf) {
	while (isspace (*s))
	    s++;
	if (*s == '%') {
	    s++;
	    for (; *s; s++) {
		if (strchr ("dibouxcsefg%", *s))
		    break;
		if (*s == '*')
		    noassign = 1;
		else if (*s == 'l' || *s == 'L')
		    lflag = 1;
		else if (*s >= '1' && *s <= '9') {
		    for (tc = s; isdigit (*s); s++);
		    strncpy (tmp, tc, s - tc);
		    tmp[s - tc] = '\0';
		    atob (&width, tmp, 10);
		    s--;
		}
	    }
	    if (*s == 's') {
		while (isspace (*buf))
		    buf++;
		if (!width)
		    width = strcspn (buf, ISSPACE);
		if (!noassign) {
		    strncpy (t = va_arg (ap, char *), buf, width);
		    t[width] = '\0';
		}
		buf += width;
	    } else if (*s == 'c') {
		if (!width)
		    width = 1;
		if (!noassign) {
		    strncpy (t = va_arg (ap, char *), buf, width);
		    t[width] = '\0';
		}
		buf += width;
	    } else if (strchr ("dobxu", *s)) {
		while (isspace (*buf))
		    buf++;
		if (*s == 'd' || *s == 'u')
		    base = 10;
		else if (*s == 'x')
		    base = 16;
		else if (*s == 'o')
		    base = 8;
		else if (*s == 'b')
		    base = 2;
		if (!width) {
		    if (isspace (*(s + 1)) || *(s + 1) == 0)
			width = strcspn (buf, ISSPACE);
		    else
			width = strchr (buf, *(s + 1)) - buf;
		}
		strncpy (tmp, buf, width);
		tmp[width] = '\0';
		buf += width;
		if (!noassign)
		    atob (va_arg (ap, uint32_t *), tmp, base);
	    }
	    if (!noassign)
		count++;
	    width = noassign = lflag = 0;
	    s++;
	} else {
	    while (isspace (*buf))
		buf++;
	    if (*s != *buf)
		break;
	    else
		s++, buf++;
	}
    }
    return (count);
}

#if 0
/// Formatted print to FILE* stream
int vsprintf(char* str, const char *format, va_list args )
{
	int rc=0;
	va_start( args, format );
	rc = print(NULL, &str, format, args );
	va_end( args );
	return rc;
}
#endif

int vfprintf(FILE *stream, const char *format, va_list ap)
{
	int rc=0;
	rc = print(stream, 0, format, ap );
	return rc;	
}

/**
 * @brief Formatted print to FILE* stream
 */
int sprintf(char* str, const char *format, ... )
{
	int rc=0;
	va_list args;
	va_start( args, format );
	rc = print(NULL, &str, format, args );
	va_end( args );
	return rc;
}

/**
 * @brief Formatted print to FILE* stream
 */
int snprintf(char *str, size_t size, const char *format, ...)
{
	int rc=0;
	va_list args;
	va_start( args, format );
	rc = print(NULL, &str, format, args );
	va_end( args );
	return rc;
}

/**
 * @brief Formatted print to FILE* stream
 */
int fprintf(FILE *fp, const char *format, ... )
{
	int rc=0;
	va_list args;
	va_start( args, format );
	if ( fp )
		rc = print(fp, 0, format, args );
	va_end( args );
	return rc;
}

/**
 * @brief Formatted print to FILE* stdout
 */
extern int printf(const char *format, ...)
{
	int rc=0;
	va_list args;
	va_start( args, format );
	if ( stdout )
	{
		#if CARIBOU_FLUSH_PRINTF
		caribou_thread_lock();
		#endif

		rc = print(stdout, 0, format, args );
        
		#if CARIBOU_FLUSH_PRINTF
		fflush(stdout);
        caribou_thread_unlock();
		#endif
	}
	va_end( args );
	return rc;
}

/**
 * @brief Formatted print to debug
 */
#if defined(CARIBOU_DEBUG_PRINTF)
extern __attribute__((weak)) int debug_printf(const char *format, ...)
{
	int rc=0;
	va_list args;
	va_start( args, format );
	{
		if ( caribou_interrupts_enabled() )
		{
			caribou_thread_lock();
			rc = print(stderr, 0, format, args );
			fflush(stderr);
			caribou_thread_unlock();
		}
	}
	va_end( args );
	return rc;
}
#endif

int fwrite(void* p, size_t len, size_t nmemb, FILE* fp)
{
	return  fp->writefn(fp,p,len * nmemb);
}

int fread(void* p, size_t len, size_t nmemb, FILE* fp)
{
	return  fp->readfn(fp,p,len * nmemb);
}

int fioctl(FILE* fp)
{
	return fp->statefn(fp);
}

int getchar()
{
	return fgetc(stdin);
}

int putchar(int ch)
{
	return fputc(ch,stdout);
}

#if 0
int toupper(int ch)
{
	if ( ch >= 'a' && ch <= 'z' )
	{
		ch -= 0x20;
	}
	return ch;
}

int isnum(int ch)
{
	if ( ch >= '0' && ch <= '9' )
	{
		return 1;
	}
	return 0;
}
#endif



