#ifndef _GU8_MODE_SPLASH_H_
#define _GU8_MODE_SPLASH_H_

#define SPLASH_INTERVAL	4000

typedef enum {
  SPLASH_LOGO_CONTEXT_ID = 1,
  SPLASH_MODEL_CONTEXT_ID,
  SPLASH_CONTEXT_ID,
} gu8_splash_context_id_t;

gu8_context_t splash_mode_contexts[SPLASH_CONTEXT_ID];

#endif
