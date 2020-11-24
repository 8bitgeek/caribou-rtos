#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/splash.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Splash mode
 **
 **/

static void splash_each_timeout_callback(uint32_t arg32) {
  gu8_set_context(arg32);
}

static gu8_timeout_t splash_logo_timeout = {
  .milliseconds = SPLASH_INTERVAL/2 * GU8_MILLISECONDS,
  .callback = splash_each_timeout_callback,
  .arg32 = SPLASH_MODEL_CONTEXT_ID,
};

static gu8_timeout_t splash_model_timeout = {
  .milliseconds = SPLASH_INTERVAL/2 * GU8_MILLISECONDS,
  .callback = splash_each_timeout_callback,
  .arg32 = SPLASH_LOGO_CONTEXT_ID
};

gu8_context_t splash_mode_contexts[] = {
  {
    .image_context = {
      .frame = {
	.id = SPLASH_LOGO_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.timeout = &splash_logo_timeout,
      },
      .image = GU8_IMAGE_LOGO,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = SPLASH_MODEL_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.timeout = &splash_model_timeout,
      },
      .image = GU8_IMAGE_MODEL,
    }
  },
  { /**/ },
};
