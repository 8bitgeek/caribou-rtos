#include <bytestream/storage/array.h>

uint32_t bs_array_storage_go_to(void *storage, uint32_t position)
{
  bs_array_storage_t *array_storage = (bs_array_storage_t *) storage;
  if (position < array_storage->size) {
    array_storage->position = position;
  }
  return array_storage->position;
}

int32_t bs_array_storage_seek(void *storage, int32_t count)
{
  bs_array_storage_t *array_storage = (bs_array_storage_t *) storage;
  if (
      0 <= array_storage->position + count
      &&
      array_storage->position + count <= array_storage->size
      ) {
    array_storage->position += count;
    return count;
  }
  return 0;
}

bool bs_array_storage_is_eof(void *storage)
{
  bs_array_storage_t *array_storage = (bs_array_storage_t *) storage;
  return array_storage->position == array_storage->size;
}

uint32_t bs_array_storage_get_position(void *storage)
{
  bs_array_storage_t *array_storage = (bs_array_storage_t *) storage;
  return array_storage->position;
}

bool bs_array_storage_open(bs_array_storage_t *array_storage, uint8_t *array, uint32_t size)
{
  if (size < UINT32_MAX / 2) {
    array_storage->size = size;
    array_storage->position = 0;
    array_storage->array = array;
    return true;
  }
  return false;
}

bool bs_array_storage_close(bs_array_storage_t *array_storage)
{
  array_storage->size = 0;
  array_storage->position = 0;
  array_storage->array = (uint8_t *) NULL;
  return true;
}
