#ifndef _GU8_MODE_EASY_H_
#define _GU8_MODE_EASY_H_

typedef enum {
  EASY_AIRFLOW_LINEAR_CONTEXT_ID = 1,
  EASY_AIRFLOW_VOLUME_CONTEXT_ID,
  EASY_INTERNAL_TEMPERATURE_CONTEXT_ID,
  EASY_CONTEXT_ID,
} gu8_easy_context_id_t;

gu8_context_t easy_mode_contexts[EASY_CONTEXT_ID];

#endif
