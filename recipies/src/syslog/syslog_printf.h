#ifndef _SYSLOG_PRINTF_H_
#define _SYSLOG_PRINTF_H_

#include <board.h>
#include <syslog.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef enum {
    SYSLOG_NONE = 0,
    SYSLOG_DEBUG,
    SYSLOG_INFO,
    SYSLOG_WARN,
    SYSLOG_ERROR,
    SYSLOG_FATAL,
    SYSLOG_LEVEL,
} syslog_level_t;

#if 1
#define SYSLOG_PRINTF(syslog,level,fmt,...) syslog_printf(syslog,__FUNCTION__,__LINE__,level,fmt,##__VA_ARGS__)

#else
/* HACK flush */
#define SYSLOG_PRINTF(syslog,level,fmt,...) syslog_printf(syslog,__FUNCTION__,__LINE__,level,fmt,##__VA_ARGS__); fflush(stderr)
#endif

extern void                 syslog_printf    ( syslog_t* syslog, const char* fn, int line, syslog_level_t level, const char* fmt, ... );
extern void                 syslog_vfprintf  ( syslog_t* syslog, const char* fn, int line, syslog_level_t level, const char* fmt, va_list ap);

extern char*                log_level_string ( syslog_level_t level );
extern void                 syslog_fputc     ( void* fp, uint8_t c );

extern uint32_t             syslog_no_promote_to_double( float value );
#define _syslog_float_(x)   syslog_no_promote_to_double(x)

#ifdef __cplusplus
}
#endif

#endif
