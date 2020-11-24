#ifndef _GU8_MODE_SAVER_H_
#define _GU8_MODE_SAVER_H_

#define SAVER_INTERVAL	1500

typedef enum {
  SAVER_MESSAGE_CONTEXT_ID = 1,
  SAVER_DOT_CONTEXT_ID,
  SAVER_CONTEXT_ID,
} gu8_saver_context_id_t;

gu8_context_t saver_mode_contexts[SAVER_CONTEXT_ID];

#endif
