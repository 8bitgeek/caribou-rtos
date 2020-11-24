#include <log/log.h>

char *log_level_string(log_level_t level)
{
  switch (level) {
  case LOG_DEBUG:       return "debug";
  case LOG_INFO:        return "info";
  case LOG_WARN:        return "warn";
  case LOG_ERROR:       return "error";
  case LOG_FATAL:       return "fatal";
  default:
  case LOG_NONE:        return "none";
  }
}

#define xstr(s) str(s)
#define str(s)  #s

char *log_filename(char *filename)
{
  char *p = xstr(PWD);
  uint16_t i = 0;
  while (filename[i] && filename[i] == p[i]) i++;
  if (filename[i] == '/') i++;
  return filename + i;
}
