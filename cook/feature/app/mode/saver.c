#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/saver.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Saver mode
 **
 **/

static uint8_t saver_string_switch = 0;
static uint8_t saver_random_x;
static uint8_t saver_random_y;

static void saver_timeout_callback(uint32_t arg32) {
  gu8_set_context(arg32);
  saver_string_switch = (saver_string_switch + 1) % 4;
  saver_random_x = rand();
  saver_random_y = rand();
}

static void saver_message_renderer(gu8_render_t *r) {
  char * string = saver_string_switch
    ? APP_IDENTITY_MANUFACTURER
    : ui_translate(_PRESS_ANY_KEY);
  u8g2_uint_t string_width = u8g2_GetStrWidth(r->u8g2, string);
  uint8_t x = saver_random_x & ((r->w - string_width) - 1);
  uint8_t y = saver_random_y & (r->h - 1);
  y = y < 12 ? 12 : y;
  u8g2_SetFont(r->u8g2, GU8_FONT_SMALL);
  u8g2_DrawStr(r->u8g2, r->x+x, r->y+y, string);
}

static void saver_dot_renderer(gu8_render_t *r) {
  uint8_t x = saver_random_x & (r->w - 1);
  uint8_t y = saver_random_y & (r->h - 1);
  u8g2_DrawPixel(r->u8g2, r->x+x, r->y+y);
}

static gu8_timeout_t saver_message_timeout = {
  .milliseconds = SAVER_INTERVAL * GU8_MILLISECONDS,
  .callback = saver_timeout_callback,
  .arg32 = SAVER_DOT_CONTEXT_ID,
};

static gu8_timeout_t saver_dot_timeout = {
  .milliseconds = 3 * SAVER_INTERVAL * GU8_MILLISECONDS,
  .callback = saver_timeout_callback,
  .arg32 = SAVER_MESSAGE_CONTEXT_ID,
};

gu8_context_t saver_mode_contexts[] = {
  {
    .canvas_context = {
      .frame = {
	.id = SAVER_MESSAGE_CONTEXT_ID,
	.type = GU8_CONTEXT_CANVAS,
	.screen = gu8_screen_canvas,
	.timeout = &saver_message_timeout,
      },
    .renderer = saver_message_renderer,
    },
  },
  {
    .canvas_context = {
      .frame = {
	.id = SAVER_DOT_CONTEXT_ID,
	.type = GU8_CONTEXT_CANVAS,
	.screen = gu8_screen_canvas,
	.timeout = &saver_dot_timeout,
      },
    .renderer = saver_dot_renderer,
    },
  },
  { /**/ },
};
