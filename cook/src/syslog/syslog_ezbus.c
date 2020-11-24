#include <syslog_printf.h>
#if defined(_CARIBOU_RTOS_)
  #include <caribou/lib/stdarg.h>
#else
  #include <stdarg.h>
#endif

void ezbus_log( const char* fn, int line, int level, char* fmt, ... )
{
  va_list ap;
  va_start( ap, fmt );
  if ( level )
  {
    syslog_vfprintf( syslog_get_global(), fn, line, SYSLOG_DEBUG, fmt, ap);
  }
  va_end( ap );
}

