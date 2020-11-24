#ifndef _BS_SINK_ARRAY_H_
#define _BS_SINK_ARRAY_H_

#include <bytestream/storage/array.h>
#include <bytestream/sink/writer.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef bs_array_storage_t bs_array_sink_t;

uint32_t bs_array_sink_go_to(void *sink, uint32_t position);
int32_t bs_array_sink_seek(void *sink, int32_t count);
bool bs_array_sink_is_eof(void *sink);
uint32_t bs_array_sink_get_position(void *sink);
uint32_t bs_array_sink_write(void *sink, uint8_t *buffer, uint32_t count);
bool bs_array_sink_open(bs_array_sink_t *array_sink, uint8_t *array, uint32_t size);
bool bs_array_sink_close(bs_array_sink_t *array_sink);
void bs_array_writer(bs_writer_t *writer);

#ifdef __cplusplus
}
#endif

#endif
