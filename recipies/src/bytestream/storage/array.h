#ifndef _BS_STORAGE_ARRAY_H_
#define _BS_STORAGE_ARRAY_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

/*
 * synopsis:    Byte storage array
 */

typedef struct {
  uint32_t      size;
  uint32_t      position;
  uint8_t       *array;
} bs_array_storage_t;

uint32_t bs_array_storage_go_to(void *storage, uint32_t position);
int32_t bs_array_storage_seek(void *storage, int32_t count);
bool bs_array_storage_is_eof(void *storage);
uint32_t bs_array_storage_get_position(void *storage);
bool bs_array_storage_open(bs_array_storage_t *array_storage, uint8_t *array, uint32_t size);
bool bs_array_storage_close(bs_array_storage_t *array_storage);

#ifdef __cplusplus
}
#endif

#endif
