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

#include <caribou_types.h>
#include <caribou_stdarg.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define	CARIBOU_STDIO_STATE_RX_PENDING		0x00000001		/// Receive data pending.
#define	CARIBOU_STDIO_STATE_TX_EMPTY		0x00000002		/// Transmit data empty.
#define	CARIBOU_STDIO_STATE_OPENED			0x00000004		/// The device is opened.
#define	CARIBOU_STDIO_STATE_RX_OVERFLOW		0x00000010		/// The receiver buffer has over flowed.

typedef struct _stdio_t
{
	void*	device_private;							/// Device Driver private data.
	int		(*readfn)(struct _stdio_t*,void*,int);	/// Device Driver read-data function.
	int		(*writefn)(struct _stdio_t*,void*,int);	/// Device Driver write-data function.
	int		(*readqueuefn)(struct _stdio_t*);		/// Device Driver read-data available function.
	int		(*writequeuefn)(struct _stdio_t*);		/// Device Driver write-data pending.
	int		(*statefn)(struct _stdio_t*);			/// Return the device state.
} caribou_stdio_t;

extern const caribou_stdio_t _stdio_[];
extern caribou_stdio_t* _caribou_stdin;
extern caribou_stdio_t* _caribou_stdout;
extern caribou_stdio_t* _caribou_stderr;

#define FILE 			caribou_stdio_t
#define stdin 			_caribou_stdin
#define stdout 			_caribou_stdout
#define stderr 			_stderr

extern FILE* caribou_fopen(int ndev, const char* mode);
extern int 	 caribou_fclose(FILE* fp);
extern int 	 caribou_fflush(FILE* fp);
extern int 	 caribou_fputc(int c, FILE *fp);
extern int 	 caribou_putc(int c, FILE *fp);
extern int 	 caribou_fputs(const char *s, FILE *fp);
extern int 	 caribou_fprintf(FILE* fp, const char *format, ...);
extern int 	 caribou_printf(const char *format, ...);

#if defined(CARIBOU_DEBUG_PRINTF)
	extern int debug_printf(const char *format, ...);
#endif
extern int	caribou_fwrite(void* p, size_t len, size_t nmemb, FILE* fp);
extern int	caribou_fread(void* p, size_t len, size_t nmemb, FILE* fp);
extern int	caribou_fgetc(FILE* fp);
extern int	caribou_fioctl(FILE* fp);
extern char *caribou_fgets(char *s, int size, FILE *fp);

extern int	caribou_getchar();
extern int 	caribou_putchar(int ch);

//extern int toupper(int ch);
//extern int isnum(int ch);

extern int 	caribou_scanf(const char *format, ...);
extern int 	caribou_fscanf(FILE *stream, const char *format, ...);
extern int 	caribou_sscanf(const char *str, const char *format, ...);

extern int 	caribou_vscanf(const char *format, va_list ap);
extern int 	caribou_vsscanf(const char *str, const char *format, va_list ap);
extern int 	caribou_vfscanf(FILE *stream, const char *format, va_list ap);

extern int 	caribou_vsprintf(char* str, const char *format, va_list args);
extern int 	caribou_sprintf(char *str, const char *format, ...);
extern int 	caribou_snprintf(char *str, size_t size, const char *format, ...);

extern int 	caribou_fd(stdio_t* fp);

#ifndef CARIBOU_ASSERT
#define CARIBOU_ASSERT(x) if(!x) while(;;) {}
#endif

#ifdef __cplusplus
}
#endif

#endif
