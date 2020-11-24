#include <bytestream/storage/array.h>
#include <bytestream/source/array.h>

uint32_t bs_array_source_go_to(void *source, uint32_t position)
{
  return bs_array_storage_go_to(source, position);
}

int32_t bs_array_source_seek(void *source, int32_t count)
{
  return bs_array_storage_seek(source, count);
}

bool bs_array_source_is_eof(void *source)
{
  return bs_array_storage_is_eof(source);
}

uint32_t bs_array_source_get_position(void *source)
{
  return bs_array_storage_get_position(source);
}

uint32_t bs_array_source_read(void *source, uint8_t *buffer, uint32_t count)
{
  bs_array_storage_t *array_storage = (bs_array_storage_t *) source;
  if (array_storage->position + count < array_storage->size) {
    memcpy
      (
       (void *) buffer,
       (void *) (array_storage->array + array_storage->position),
       (size_t) count
       );
    array_storage->position += count;
    return count;
  }
  return 0;
};

bool bs_array_source_open(bs_array_source_t *array_source, uint8_t *array, uint32_t size)
{
  return bs_array_storage_open((bs_array_storage_t *) array_source, array, size);
}

bool bs_array_source_close(bs_array_source_t *array_source)
{
  return bs_array_storage_close((bs_array_storage_t *) array_source);
}

void bs_array_reader(bs_reader_t *reader)
{
  reader->read = (uint32_t (*)(void *, uint8_t *, uint32_t)) &bs_array_source_read;
  reader->is_eof = (bool (*)(void *)) &bs_array_source_is_eof;
  reader->seek = (int32_t (*)(void *, int32_t)) &bs_array_source_seek;
  reader->get_position = (uint32_t (*)(void *)) &bs_array_source_get_position;
  reader->go_to = (uint32_t (*)(void *, uint32_t)) &bs_array_source_go_to;
}
