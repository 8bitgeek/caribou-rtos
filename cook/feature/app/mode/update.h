#ifndef _GU8_MODE_UPDATE_H_
#define _GU8_MODE_UPDATE_H_

typedef enum {
  UPDATE_CHECK_CONTEXT_ID = 1,
  UPDATE_SETTINGS_CONTEXT_ID,
  UPDATE_CONTEXT_ID,
} gu8_update_context_id_t;

gu8_context_t update_mode_contexts[UPDATE_CONTEXT_ID];

#endif
