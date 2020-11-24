#include <bytestream/storage/array.h>
#include <bytestream/sink/array.h>

uint32_t bs_array_sink_go_to(void *sink, uint32_t position)
{
  return bs_array_storage_go_to(sink, position);
}

int32_t bs_array_sink_seek(void *sink, int32_t count)
{
  return bs_array_storage_seek(sink, count);
}

bool bs_array_sink_is_eof(void *sink)
{
  return bs_array_storage_is_eof(sink);
}

uint32_t bs_array_sink_get_position(void *sink)
{
  return bs_array_storage_get_position(sink);
}

uint32_t bs_array_sink_write(void *sink, uint8_t *buffer, uint32_t count)
{
  bs_array_storage_t *array_storage = (bs_array_storage_t *) sink;
  if (array_storage->position + count < array_storage->size) {
    memcpy
      (
       (void *) (array_storage->array + array_storage->position),
       (void *) buffer,
       (size_t) count
       );
    array_storage->position += count;
    return count;
  }
  return 0;
};

bool bs_array_sink_open(bs_array_sink_t *array_sink, uint8_t *array, uint32_t size)
{
  return bs_array_storage_open((bs_array_storage_t *) array_sink, array, size);
}

bool bs_array_sink_close(bs_array_sink_t *array_sink)
{
  return bs_array_storage_close((bs_array_storage_t *) array_sink);
}
  

void bs_array_writer(bs_writer_t *writer)
{
  writer->write = (uint32_t (*)(void *, uint8_t *, uint32_t)) &bs_array_sink_write;
  writer->is_eof = (bool (*)(void *)) &bs_array_sink_is_eof;
  writer->seek = (int32_t (*)(void *, int32_t)) &bs_array_sink_seek;
  writer->get_position = (uint32_t (*)(void *)) &bs_array_sink_get_position;
  writer->go_to = (uint32_t (*)(void *, uint32_t)) &bs_array_sink_go_to;
}
