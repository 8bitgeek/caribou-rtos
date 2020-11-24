#include <syslog.h>

static syslog_t* global_syslog = NULL;

extern syslog_t* syslog_init ( syslog_t* syslog, void* fp, syslog_fputc_callback_fn_t  fputc_callback )
{
    syslog = (syslog == NULL) ? global_syslog : syslog;
    if ( syslog )
    {
        syslog->fp = fp;
        syslog->fputc_callback = fputc_callback;
        global_syslog = ( global_syslog == NULL ) ? syslog : global_syslog;
    }
    return syslog;
}

extern void* syslog_get_fp ( syslog_t* syslog )
{
    syslog = (syslog == NULL) ? global_syslog : syslog;
    return syslog != NULL ? syslog->fp : NULL;
}

extern syslog_fputc_callback_fn_t syslog_get_callback ( syslog_t* syslog )
{
    syslog = (syslog == NULL) ? global_syslog : syslog;
    return syslog != NULL ? syslog->fputc_callback : NULL;
}

extern syslog_t* syslog_get_global ( void )
{
    return global_syslog;
}
