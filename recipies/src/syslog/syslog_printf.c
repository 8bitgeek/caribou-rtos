#include <syslog_printf.h>
#include <syslog_timestamp.h>
#if defined(_CARIBOU_RTOS_)
  #include <caribou/lib/stdarg.h>
#else
  #include <stdarg.h>
#endif

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12
#define PAD_RIGHT 1
#define PAD_ZERO 2
#define ISSPACE " \t\n\r\f\v"
#define MAXLN 255

#define in_range(c, lo, up)  ((uint8_t)c >= lo && (uint8_t)c <= up)
#define isprint(c)           in_range(c, 0x20, 0x7f)
#define isdigit(c)           in_range(c, '0', '9')
#define isxdigit(c)          (isdigit(c) || in_range(c, 'a', 'f') || in_range(c, 'A', 'F'))
#define islower(c)           in_range(c, 'a', 'z')
#define isspace(c)           (c == ' ' || c == '\f' || c == '\n' || c == '\r' || c == '\t' || c == '\v')

static int    prints                  (syslog_t* syslog, const char *string, int width, int pad);
static int    printi                  (syslog_t* syslog, long i, int b, int sg, int width, int pad, int letbase);
static int    print                   (syslog_t* syslog, const char *format, va_list args );
static void   syslog_private_printf   (syslog_t* syslog, char* fmt, ... );
extern int    syslog_private_vfprintf (syslog_t* syslog, const char *format, va_list args );

#define printchar(syslog,c)   (syslog)->fputc_callback((syslog)->fp,(uint8_t)(c));


extern void syslog_fputc(void* fp, uint8_t c)
{
    if ( c == '\n' )
        fputc('\r',(FILE*)fp);
    fputc(c,(FILE*)fp);
}

static int prints(syslog_t* syslog, const char *string, int width, int pad)
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
      printchar(syslog, padchar);
      ++pc;
    }
  }
  for ( ; *string ; ++string)
  {
    printchar(syslog, *string);
    ++pc;
  }
  for ( ; width > 0; --width)
  {
    printchar(syslog, padchar);
    ++pc;
  }

  return pc;
}

static int printi(syslog_t* syslog, long i, int b, int sg, int width, int pad, int letbase)
{
  char print_buf[PRINT_BUF_LEN];
  char *s;
  long t, neg = 0, pc = 0;
  unsigned long u = i;

  if (i == 0)
  {
    print_buf[0] = '0';
    print_buf[1] = '\0';
    return prints (syslog, print_buf, width, pad);
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
      printchar (syslog, '-');
      ++pc;
      --width;
    }
    else {
      *--s = '-';
    }
  }

  return pc + prints (syslog, s, width, pad);
}

extern int syslog_private_vfprintf(syslog_t* syslog, const char *format, va_list args )
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
        precision = *format++;
        if ( precision < '0' || precision > '9' )
          precision = 0;
      }

      switch( *format )
      {
        case 's':
          {
            char *s = (char *)va_arg( args, char* );
            pc += prints(syslog, s?s:"(null)", width, pad);
          }
          break;
        case 'd':
          pc += printi(syslog, va_arg( args, int ), 10, 1, width, pad, 'a');
          break;
        case 'l':
          pc += printi(syslog, va_arg( args, long ), 10, 1, width, pad, 'a');
          break;
        case 'x':
          pc += printi(syslog, va_arg( args, int ), 16, 0, width, pad, 'a');
          break;
        case 'X':
        case 'p':
          pc += printi(syslog, va_arg( args, int ), 16, 0, width, pad, 'A');
          break;
        case 'u':
          pc += printi(syslog, va_arg( args, int ), 10, 0, width, pad, 'a');
          break;
        case 'c':
          /* char are converted to int then pushed on the stack */
          scr[0] = (char)va_arg( args, int );
          scr[1] = '\0';
          pc += prints (syslog,  scr, width, pad );
          break;
        case 'f':
        case 'g':
          {
            char temp[49];
            temp[48]='\0';
            dtoa(temp,'f',48,precision?(precision-'0'):2,(double)va_arg( args, double ));
            pc += prints(syslog, temp, width, pad);
          }
          break;
        case 'F':
          {
            char temp[48];
            float f = (float)va_arg( args, uint32_t /* float */ );
            caribou_ftoa(&f,temp,precision?(precision-'0'):2);
            pc += prints(syslog, temp, width, pad);
          }
          break;
      }
    }
    else
    {
    out:
      printchar(syslog, *format);
      ++pc;
    }
  }
  return pc;
}

static void syslog_private_printf( syslog_t* syslog, char* fmt, ... )
{
  va_list ap;
  va_start( ap, fmt );
  syslog_private_vfprintf( syslog, fmt, ap );
  va_end( ap );
}


extern void syslog_printf( syslog_t* syslog, const char* fn, int line, syslog_level_t level, const char* fmt, ... )
{
  va_list ap;
  va_start( ap, fmt );
  if ( level != SYSLOG_NONE )
  {
    if ( syslog == NULL )
      syslog = syslog_get_global();
    syslog_vfprintf(syslog, fn, line, level, fmt, ap );
  }
  va_end( ap );
}

extern void syslog_vfprintf( syslog_t* syslog, const char* fn, int line, syslog_level_t level, const char* fmt, va_list ap)
{
    if ( syslog == NULL )
      syslog = syslog_get_global();
    syslog_private_printf( syslog, "%09l, ", syslog_timestamp() );
    syslog_private_printf( syslog, "%s, ", log_level_string(level) );
    syslog_private_printf( syslog, "%s:%d, ", fn, line );
    syslog_private_vfprintf( syslog, fmt, ap );
    syslog_private_printf( syslog, "\n" );
}

uint32_t syslog_no_promote_to_double( float value )
{
  uint32_t* i = (uint32_t*)&value;
  return *i;
}

char *log_level_string(syslog_level_t level)
{
  switch (level) {
  case SYSLOG_DEBUG:       return "DEBUG";
  case SYSLOG_INFO:        return "INFO";
  case SYSLOG_WARN:        return "WARN";
  case SYSLOG_ERROR:       return "ERROR";
  case SYSLOG_FATAL:       return "FATAL";
  default:
  case SYSLOG_NONE:        return "NONE";
  }
}

