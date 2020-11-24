#ifndef _SYSLOG_H_
#define _SYSLOG_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef void (*syslog_fputc_callback_fn_t)(void* fp, uint8_t c); 

typedef struct _syslog_t_
{
    void*                       fp;
    syslog_fputc_callback_fn_t  fputc_callback;
} syslog_t;

extern syslog_t*                    syslog_init         ( syslog_t* syslog, void* fp, syslog_fputc_callback_fn_t  fputc_callback );
extern void*                        syslog_get_fp       ( syslog_t* syslog );
extern syslog_fputc_callback_fn_t   syslog_get_callback ( syslog_t* syslog );
extern syslog_t*                    syslog_get_global   ( void );

#ifdef __cplusplus
}
#endif

#endif
