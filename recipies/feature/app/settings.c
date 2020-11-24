/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Settings storage
 **
 **/

#include <settings.h>
#include <textstream/source/reader.h>
#include <textstream/source/file.h>
#include <textstream/sink/file.h>
#include <uon/bytes/restore.h>
#include <uon/generate.h>
#include <uon/parse.h>

#define SETTINGS_ARRAY_SIZE         1024

static uint8_t          ro_array[SETTINGS_ARRAY_SIZE];
static uint8_t          rw_array[SETTINGS_ARRAY_SIZE];
static bs_reader_t      bs_reader;
static bs_array_source_t bs_array_source;
static bs_writer_t      bs_writer;
static bs_array_sink_t  bs_array_sink;
#pragma pack(push, 1)
static uon_bytes_input_t bytes_input;
static uon_bytes_output_t bytes_output;
#pragma pack(pop)
static uon_getter_t     getter;
static uon_setter_t     setter;

/****************************************************************************
 *
 * synopsis:    Back end
 */

bool settings_load(char *file_path)
{
  ts_reader_t           ts_reader;
  ts_file_source_t      text_source;
  ts_tracker_t          ts_tracker;
  uon_serialiser_t      serialiser;
  uon_parser_t          parser;

  // TODO Replace error-reporting printf() with log()
  ts_file_reader(&ts_reader);
  ts_reader_tracker_open(&ts_tracker);
  if (!ts_file_source_open(&text_source, &ts_tracker, file_path)) {
    printf("Error: File source failed to open\n");
    return false;
  }
  bs_array_writer(&bs_writer);
  bs_array_sink_open(&bs_array_sink, ro_array, SETTINGS_ARRAY_SIZE);
  uon_bytes_output_open(&bytes_output, &bs_writer, (void *) &bs_array_sink);
  uon_bytes_serialiser(&serialiser);

  parser.ts_reader = (ts_reader_t *) &ts_reader;
  parser.serialiser = (uon_serialiser_t *) &serialiser;
  parser.output = (void *) &bytes_output;

  if (!uon_parse(&parser, (void *) &text_source)) {
    uint32_t line, column;
    char context[TS_TRACKER_CONTEXT_SIZE];
    ts_reader_tracker_close(&ts_tracker, (ts_reader_t *) &ts_reader, (void *) &text_source, &line, &column, context);
    printf("Error: Parser failed at (%u, %u) '%s'\n",
           line, column, context);
    return false;
  }

  ts_string_source_close(&text_source);
  ts_file_source_open(&text_source);
  uon_bytes_output_close(&bytes_output);
  bs_array_sink_close(&bs_array_sink);

  settings_reload();

  return true;
}

void settings_reload(void)
{
  // TODO Replace with Update into read-write memory, preserving extant values
  memcpy(rw_array, ro_array, SETTINGS_ARRAY_SIZE);
}

bool settings_restore(char *file_path)
{
  bs_reader_t           bs_reader;
  bs_array_source_t     bs_array_source;
  bs_writer_t           bs_writer;
  bs_array_sink_t       bs_array_sink;
#pragma pack(push, 1)
  uon_bytes_input_t     bytes_input;
  uon_bytes_output_t    bytes_output;
#pragma pack(pop)
  ts_reader_t           ts_reader;
  ts_file_source_t      text_source;
  ts_tracker_t          ts_tracker;
  uon_deserialiser_t    bytes_deserialiser;
  uon_serialiser_t      bytes_serialiser;
  uon_restore_output_t  restore_output;
  uon_serialiser_t      restore_serialiser;
  uon_parser_t          parser;
  
  if (!bs_array_source_open(&bs_array_source, rw_array, SETTINGS_ARRAY_SIZE)) {
    printf("Error: Byte source failed to open\n");
    return false;
  }
  bs_array_reader(&bs_reader);
  uon_bytes_input_open(&bytes_input, &bs_reader, &bs_array_source);

  uon_bytes_deserialiser(&bytes_deserialiser);

  // TODO Replace error-reporting printf() with log()
  ts_file_reader(&ts_reader);
  ts_reader_tracker_open(&ts_tracker);
  if (!ts_file_source_open(&text_source, &ts_tracker, file_path)) {
    printf("Error: File source failed to open\n");
    return false;
  }
  bs_array_writer(&bs_writer);
  bs_array_sink_open(&bs_array_sink, rw_array, SETTINGS_ARRAY_SIZE);
  uon_bytes_output_open(&bytes_output, &bs_writer, (void *) &bs_array_sink);
  uon_bytes_serialiser(&bytes_serialiser);

  uon_restore_output_open
    (
     &restore_output,
     &bytes_input,
     &bytes_deserialiser,
     &bytes_output,
     &bytes_serialiser
     );
  uon_restore_serialiser(&restore_serialiser);

  parser.ts_reader = (ts_reader_t *) &ts_reader;
  parser.serialiser = (uon_serialiser_t *) &restore_serialiser;
  parser.output = (void *) &restore_output;

  printf("\n"); // Remove after testing
  if (!uon_parse(&parser, (void *) &text_source)) {
    uint32_t line, column;
    char context[TS_TRACKER_CONTEXT_SIZE];
    ts_reader_tracker_close(&ts_tracker, (ts_reader_t *) &ts_reader, (void *) &text_source, &line, &column, context);
    printf("Error: Parser failed at (%u, %u) '%s'\n",
           line, column, context);
    return false;
  }

  uon_restore_output_close(&restore_output);
  ts_string_source_close(&text_source);
  uon_bytes_output_close(&bytes_output);
  ts_file_source_close(&text_source);
  bs_array_sink_close(&bs_array_sink);
  return true;
}

bool settings_save(char *file_path)
{
  bool                  result;
  ts_file_sink_t        file_sink;
  bs_reader_t           bs_reader;
  ts_writer_t           ts_writer;
  uon_generator_t       generator;

  // TODO Replace error-reporting printf() with log()
  if (!bs_array_source_open(&bs_array_source, rw_array, SETTINGS_ARRAY_SIZE)) {
    printf("Error: Byte source failed to open\n");
    return false;
  }
  if (!ts_file_sink_open(&file_sink, file_path)) {
    printf("Error: Text sink failed to open: %s\n", file_path);
    return false;
  }

  bs_array_reader(&bs_reader);
  ts_file_writer(&ts_writer);
  generator.bs_reader = &bs_reader;
  generator.ts_writer = &ts_writer;
  
  result =
    uon_generate(&generator, (void *) &bs_array_source, (void *) &file_sink);

  ts_file_sink_close(&file_sink);
  bs_array_source_close(&bs_array_source);
  
  return result;
}

/****************************************************************************
 *
 * synopsis:    Front end
 */

static bool open(void)
{
  // TODO Replace error-reporting printf() with log()
  if (!bs_array_source_open(&bs_array_source, rw_array, SETTINGS_ARRAY_SIZE)) {
    printf("Error: Byte source failed to open\n");
    return false;
  }

  bs_array_reader(&bs_reader);
  
  if (!uon_bytes_input_open(&bytes_input, &bs_reader, (void *) &bs_array_source)) {
    printf("Error: Bytes input failed to open\n");
    return false;
  }

  uon_bytes_getter(&getter);

  if (!bs_array_sink_open(&bs_array_sink, rw_array, SETTINGS_ARRAY_SIZE)) {
    printf("Error: Array sink failed to open\n");
    return false;
  }

  if (!uon_bytes_output_open(&bytes_output, &bs_writer, (void *) &bs_array_sink)) {
    printf("Error: Bytes output failed to open\n");
    return false;
  }

  uon_bytes_setter(&setter);
  
  return true;
}

static bool refer(settings_ref_t *reference, char * path, uon_type_t type)
{
  return uon_bytes_refer
    (
     (uon_bytes_reference_t *) reference,
     &bytes_input,
     path,
     type
     );
}

static bool get(settings_ref_t *reference, void *value)
{
  return getter.get((void *) reference, value);
}

static bool close(void)
{
  return
    uon_bytes_input_close(&bytes_input)
    &&
    bs_array_source_close(&bs_array_source)
    &&
    uon_bytes_output_close(&bytes_output)
    &&
    bs_array_sink_close(&bs_array_sink)
    ;
}

static bool get_version(version_t *version)
{
  settings_ref_t major_ref;
  settings_ref_t minor_ref;
  settings_ref_t patch_ref;
     
  if (open()) {
    if (
        refer(&major_ref, "version.major", UON_TYPE_U8)
        &&
        refer(&minor_ref, "version.minor", UON_TYPE_U8)
        &&
        refer(&patch_ref, "version.patch", UON_TYPE_U8)
        ) {
      get(&major_ref, &(version->major));
      get(&minor_ref, &(version->minor));
      get(&patch_ref, &(version->patch));
      close();
      return true;
    }
    close();
  }
  return false;
}

settings_t settings = {
  .open       = &open,
  .close      = &close,
  .refer      = &refer,
  //.wrefer   = &wrefer,
  .get        = &get,
  .get_version = &get_version,
};
