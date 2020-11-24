#ifndef _LOG_JSON_H_
#define _LOG_JSON_H_

#include <log/log.h>
#include <textstream/sink/writer.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef struct {
  ts_writer_t   ts_writer;
  void          *sink;
  bool          is_first;
} log_json_output_t;

bool log_json_output_open(log_json_output_t *json_output, ts_writer_t ts_writer,void *sink);
bool log_json_output_close(log_json_output_t *json_output);

void json_logger(log_logger_t *logger);

#ifdef __cplusplus
}
#endif

#endif
