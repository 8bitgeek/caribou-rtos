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

#define	STDIO_STATE_RX_PENDING		0x00000001		/// Receive data pending.
#define	STDIO_STATE_TX_EMPTY		0x00000002		/// Transmit data empty.
#define	STDIO_STATE_OPENED			0x00000004		/// The device is opened.
#define	STDIO_STATE_RX_OVERFLOW		0x00000010		/// The receiver buffer has over flowed.

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

extern FILE* fopen(int ndev, const char* mode);
extern int fclose(FILE* fp);
extern int fflush(FILE* fp);
extern int fputc(int c, FILE *fp);
extern int putc(int c, FILE *fp);
extern int fputs(const char *s, FILE *fp);
extern int fprintf(FILE* fp, const char *format, ...);
extern int printf(const char *format, ...);
#if defined(CARIBOU_DEBUG_PRINTF)
	extern int debug_printf(const char *format, ...);
#endif
extern int fwrite(char* p, size_t len, size_t nmemb, FILE* fp);
extern int fread(char* p, size_t len, size_t nmemb, FILE* fp);
extern int fgetc(FILE* fp);
extern int fioctl(FILE* fp);
extern char *fgets(char *s, int size, FILE *fp);

extern int getchar();
extern int putchar(int ch);

//extern int toupper(int ch);
//extern int isnum(int ch);

extern int scanf(const char *format, ...);
extern int fscanf(FILE *stream, const char *format, ...);
extern int sscanf(const char *str, const char *format, ...);

extern int vscanf(const char *format, va_list ap);
extern int vsscanf(const char *str, const char *format, va_list ap);
extern int vfscanf(FILE *stream, const char *format, va_list ap);

extern int vsprintf(char* str, const char *format, va_list args);
extern int sprintf(char *str, const char *format, ...);
extern int snprintf(char *str, size_t size, const char *format, ...);

extern int _fd(stdio_t* fp);

#ifndef ASSERT
#define ASSERT(x) if(!x) while(;;) {}
#endif

#ifdef __cplusplus
}
#endif

#endif
