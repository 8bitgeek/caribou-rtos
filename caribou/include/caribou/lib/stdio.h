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
#ifndef CARIBOUSTDIO_H
#define CARIBOUSTDIO_H

#include <caribou/kernel/types.h>
#include <caribou/lib/stdarg.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct _stdio_t
{
	void*	device_private;							/// Device Driver private data.
	int		(*readfn)(struct _stdio_t*,void*,int);	/// Device Driver read-data function.
	int		(*writefn)(struct _stdio_t*,void*,int);	/// Device Driver write-data function.
	int		(*readqueuefn)(struct _stdio_t*);		/// Device Driver read-data available function.
	int		(*writequeuefn)(struct _stdio_t*);		/// Device Driver write-data pending.
	int		(*statefn)(struct _stdio_t*);			/// Return the device state.
} stdio_t;

extern const stdio_t _stdio_[];
extern stdio_t* _stdin;
extern stdio_t* _stdout;
extern stdio_t* _stderr;
#define FILE stdio_t
#define stdin _stdin
#define stdout _stdout
#define stderr _stderr

extern FILE* caribou_fopen(int ndev, const char* mode);
extern int caribou_fclose(FILE* fp);
extern int caribou_fflush(FILE* fp);
extern int caribou_fputc(int c, FILE *fp);
extern int caribou_putc(int c, FILE *fp);
extern int caribou_fputs(const char *s, FILE *fp);
extern int caribou_fprintf(FILE* fp, const char *format, ...);
extern int caribou_printf(const char *format, ...);
#if defined(CARIBOU_DEBUG_PRINTF)
	extern int debug_printf(const char *format, ...);
#endif
extern int caribou_fwrite(void* p, size_t len, size_t nmemb, FILE* fp);
extern int caribou_fread(void* p, size_t len, size_t nmemb, FILE* fp);
extern int caribou_fgetc(FILE* fp);
extern int caribou_fioctl(FILE* fp);
extern char *caribou_fgets(char *s, int size, FILE *fp);

extern int caribou_getchar();
extern int caribou_putchar(int ch);

//extern int toupper(int ch);
//extern int isnum(int ch);

extern int caribou_scanf(const char *format, ...);
extern int caribou_fscanf(FILE *stream, const char *format, ...);
extern int caribou_sscanf(const char *str, const char *format, ...);

extern int caribou_vscanf(const char *format, va_list ap);
extern int caribou_vsscanf(const char *str, const char *format, va_list ap);
extern int caribou_vfscanf(FILE *stream, const char *format, va_list ap);

extern int caribou_vfprintf(FILE *stream, const char *format, va_list ap);
extern int caribou_vsprintf(char* str, const char *format, va_list args);
extern int caribou_sprintf(char *str, const char *format, ...);
extern int caribou_snprintf(char *str, size_t size, const char *format, ...);

extern int _fd(stdio_t* fp);
extern int fileno(stdio_t* fp);

extern uint32_t no_promote_to_double( float value );
#define _float_(x) no_promote_to_double(x)

#ifndef ASSERT
#define ASSERT(x) if(!x) while(;;) {}
#endif

#if defined(CARIBOU_POSIX_STDIO)
	#define fopen		caribou_fopen
	#define fclose		caribou_fclose
	#define fflush		caribou_fflush
	#define fputc		caribou_fputc
	#define fputs		caribou_fputs 
	#define putc		caribou_putc 
	#define fputs		caribou_fputs
	#define fprintf		caribou_fprintf
	#define printf		caribou_printf
	#define fwrite		caribou_fwrite
	#define fread		caribou_fread
	#define fgetc		caribou_fgetc
	#define fioctl		caribou_fioctl
	#define fgets		caribou_fgets
	#define getchar		caribou_getchar
	#define putchar		caribou_putchar
	#define scanf		caribou_scanf
	#define fscanf		caribou_fscanf
	#define sscanf		caribou_sscanf
	#define vscanf		caribou_vscanf
	#define vsscanf		caribou_vsscanf
	#define vfscanf		caribou_vfscanf
	#define vfprintf	caribou_vfprintf
	#define vsprintf	caribou_vsprintf
	#define sprintf		caribou_sprintf
	#define snprintf	caribou_snprintf
#endif

#ifdef __cplusplus
}
#endif

#endif
