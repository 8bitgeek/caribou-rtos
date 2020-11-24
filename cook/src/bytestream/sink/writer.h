#ifndef _BS_WRITER_H_
#define _BS_WRITER_H_

/****************************************************************************
 *
 * name:        bytestream/sink/writer.h
 *
 * synopsis:    Byte stream writer interface
 */

#include <board.h>


/****************************************************************************
 *
 * synopsis:	Byte writer.
 *
 */

typedef struct {
  uint32_t      (*write)(void *sink, uint8_t *buffer, uint32_t count);
  bool          (*is_eof)(void *sink);
  // Seekable
  int32_t       (*seek)(void *sink, int32_t count);
  // Addressable
  uint32_t      (*get_position)(void *sink);
  uint32_t      (*go_to)(void *sink, uint32_t position);
} bs_writer_t;

#endif
