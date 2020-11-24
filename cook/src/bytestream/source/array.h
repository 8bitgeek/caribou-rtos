#ifndef _BS_SOURCE_ARRAY_H_
#define _BS_SOURCE_ARRAY_H_

#include <bytestream/storage/array.h>
#include <bytestream/source/reader.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef bs_array_storage_t bs_array_source_t;

uint32_t bs_array_source_go_to(void *source, uint32_t position);
int32_t bs_array_source_seek(void *source, int32_t count);
bool bs_array_source_is_eof(void *source);
uint32_t bs_array_source_get_position(void *source);
uint32_t bs_array_storage_read(void *source, uint8_t *buffer, uint32_t count);
bool bs_array_source_open(bs_array_source_t *array_source, uint8_t *array, uint32_t size);
bool bs_array_source_close(bs_array_source_t *array_source);
void bs_array_reader(bs_reader_t *reader);

#ifdef __cplusplus
}
#endif

#endif
