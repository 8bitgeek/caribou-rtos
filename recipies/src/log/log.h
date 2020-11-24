#ifndef _LOG_H_
#define _LOG_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef enum {
  LOG_NONE = 0,
  LOG_DEBUG,
  LOG_INFO,
  LOG_WARN,
  LOG_ERROR,
  LOG_FATAL,
  LOG_LEVEL,
} log_level_t;

char *log_level_string(log_level_t level);

char *log_filename(char *filename);

typedef struct {
  bool (*log)(void *output, log_level_t level, char *file, int line, char *message);
} log_logger_t;

#ifdef __cplusplus
}
#endif

#endif
