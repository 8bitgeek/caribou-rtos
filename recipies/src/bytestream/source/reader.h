#ifndef _BS_READER_H_
#define _BS_READER_H_

/****************************************************************************
 *
 * name:        bytestream/source/reader.h
 *
 * synopsis:    Byte stream reader interface
 */

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

/****************************************************************************
 *
 * synopsis:	Byte reader.
 *
 */

typedef struct {
  uint32_t      (*read)(void *source, uint8_t *buffer, uint32_t count);
  bool          (*is_eof)(void *source);
  // Seekable
  int32_t       (*seek)(void *source, int32_t count);
  // Addressable
  uint32_t      (*get_position)(void *source);
  uint32_t      (*go_to)(void *source, uint32_t position);
} bs_reader_t;

#ifdef __cplusplus
}
#endif

#endif
