#include <log/json.h>
#include <log/log.h>

static bool write_string(log_json_output_t *j_o, char * string)
{
  return j_o->ts_writer.write(j_o->sink, string);
}

static bool write_newline(log_json_output_t *j_o)
{
  char *newline = "\r\n";
  if (!write_string(j_o, newline)) return false;
  return true;
}

static bool write_line(log_json_output_t *j_o, char * line)
{
  if (!write_string(j_o, line)) return false;
  if (!write_newline(j_o)) return false;
  return true;
}

static bool write_lines(log_json_output_t *j_o, char * lines[])
{
  for (uint8_t i=0; lines[i]; i++)
    if (!write_line(j_o, lines[i])) return false;
  return true;
}

static bool json_log
(
 void *output,
 log_level_t level,
 char *file,
 int line,
 char *message,
 bool is_last
 )
{
  uint32_t timestamp = caribou_timer_ticks();
  char digits_buffer[10];       // strlen(2^31)
  log_json_output_t *j_o = (log_json_output_t *) output;

  if (j_o->is_first) { if (!write_line(j_o, "")) return false; }
  else if (!write_line(j_o, ",")) return false;
  j_o->is_first = false;
  if (!write_string(j_o, "  [ ")) return false;

  sprintf(digits_buffer, "%u", timestamp);
  if (!write_string(j_o, digits_buffer)) return false;
  if (!write_string(j_o, ", ")) return false;
  
  if (!write_string(j_o, "\"")) return false;
  if (!write_string(j_o, log_level_string(level))) return false;
  if (!write_string(j_o, "\"")) return false;
  if (!write_string(j_o, ", ")) return false;
  
  if (!write_string(j_o, "\"")) return false;
  if (!write_string(j_o, log_filename(file))) return false;
  if (!write_string(j_o, "\"")) return false;
  if (!write_string(j_o, ", ")) return false;

  sprintf(digits_buffer, "%d", line);
  if (!write_string(j_o, digits_buffer)) return false;
  if (!write_string(j_o, ", ")) return false;
  
  if (!write_string(j_o, "\"")) return false;
  if (!write_string(j_o, message)) return false;
  if (!write_string(j_o, "\"")) return false;
  
  if (!write_string(j_o, " ]")) return false;

  return true;
}
  
bool log_json_output_open
(
 log_json_output_t *json_output,
 ts_writer_t ts_writer,
 void *sink
 )
{
  json_output->ts_writer = ts_writer;
  json_output->sink = sink;
  json_output->is_first = true;
  if (!write_line(json_output, "{")) return false;
  char * fields[] = {
    "  \"fields\" :",
    "  [",
    "    {",
    "      \"name\" : \"timestamp\",",
    "      \"type\" : \"u32\"",
    "    },",
    "    {",
    "      \"name\" : \"level\",",
    "      \"type\" : \"string\"",
    "    },",
    "    {",
    "      \"name\" : \"file\",",
    "      \"type\" : \"string\"",
    "    },",
    "    {",
    "      \"name\" : \"line\",",
    "      \"type\" : \"u16\"",
    "    },",
    "    {",
    "      \"name\" : \"message\",",
    "      \"type\" : \"string\"",
    "    }",
    "  ],",
    (char *) NULL,
  };
  if (!write_lines(json_output, fields)) return false;
  if (!write_string(json_output, "\"levels\": [")) return false;
  for (log_level_t level=1; level < LOG_LEVEL; level++) {
    if (1 < level)
      if (!write_string(json_output, ",")) return false;
    if (!write_string(json_output, " \"")) return false;
    if (!write_string(json_output, log_level_string(level))) return false;
    if (!write_string(json_output, "\"")) return false;
  }
  if (!write_line(json_output, "],")) return false;
  if (!write_line(json_output, "\"records\" :")) return false;
  if (!write_string(json_output, "[")) return false;
  return true;
}

bool log_json_output_close(log_json_output_t *json_output)
{
  char * footer[] = {
    "",
    "]",
    "}",
    (char *) NULL,
  };
  if (!write_lines(json_output, footer)) return false;
  return true;
}

void json_logger(log_logger_t *logger)
{
  logger->log = (bool (*)(void *, log_level_t, char *, int, char *)) &json_log;
}
