#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/status.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Status mode
 **
 **/

static ui_scalar_t status_scalar_offline = {
  .label = { .type = UI_SCALAR_LABEL, .value = _OFFLINE },
};

static gu8_overlay_t status_overlay_offline = {
  .type = GU8_OVERLAY_FLASH,
  .scalar = &status_scalar_offline,
};

static void status_timeout_callback(uint32_t arg32) {
  gu8_set_context(arg32);
  if (arg32 == STATUS_INTERNAL_TEMPERATURE_CONTEXT_ID) {
    gu8_set_context_overlay(&status_overlay_offline);
  }
}

/*
 * synopsis:	Setup
 */

static void status_setup_renderer(gu8_render_t *r) {
  u8g2_SetFont(r->u8g2, GU8_FONT_SMALL);
  u8g2_DrawTriangle(r->u8g2, r->x+64, r->y, r->x+50, r->y+14, r->x+78, r->y+14);
  u8g2_DrawTriangle(r->u8g2, r->x+45, r->y+12, r->x+31, r->y+26, r->x+45, r->y+40);
  u8g2_DrawRBox(r->u8g2, r->x+50, r->y+19, 28, 14, 1);
  u8g2_DrawTriangle(r->u8g2, r->x+50, r->y+38, r->x+64, r->y+52, r->x+78, r->y+38);
  u8g2_DrawTriangle(r->u8g2, r->x+83, r->y+12, r->x+83, r->y+40, r->x+97, r->y+26);
  
  char * string = ui_translate(_SETUP);
  u8g2_uint_t width = u8g2_GetStrWidth(r->u8g2, string);
  u8g2_DrawStr(r->u8g2, r->x+((r->w-width)/2), r->y+r->h-2, string);
}

/**
 ** synopsis:	Status mode
 **/

static gu8_timeout_t status_airflow_linear_timeout = {
  .milliseconds = STATUS_INTERVAL * GU8_MILLISECONDS,
  .callback = status_timeout_callback,
  .arg32 = STATUS_AIRFLOW_VOLUME_CONTEXT_ID,
};

static gu8_timeout_t status_airflow_volume_timeout = {
  .milliseconds = STATUS_INTERVAL * GU8_MILLISECONDS,
  .callback = status_timeout_callback,
  .arg32 = STATUS_INTERNAL_TEMPERATURE_CONTEXT_ID,
};

static gu8_timeout_t status_internal_temperature_timeout = {
  .milliseconds = STATUS_INTERVAL * GU8_MILLISECONDS,
  .callback = status_timeout_callback,
  .arg32 = STATUS_PRESS_CONTEXT_ID,
};

static gu8_timeout_t status_press_timeout = {
  .milliseconds = STATUS_INTERVAL * GU8_MILLISECONDS / 2,
  .callback = status_timeout_callback,
  .arg32 = STATUS_SETUP_CONTEXT_ID,
};

static gu8_timeout_t status_setup_timeout = {
  .milliseconds = STATUS_INTERVAL * GU8_MILLISECONDS / 2,
  .callback = status_timeout_callback,
  .arg32 = STATUS_AIRFLOW_LINEAR_CONTEXT_ID,
};

gu8_context_t status_mode_contexts[] = {
  {
    .quantity_context = {
      .frame = {
	.id = STATUS_AIRFLOW_LINEAR_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
	.timeout = &status_airflow_linear_timeout,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _LINEAR_AIR_FLOW,
      },
      .quantity = &airflow_linear_quantity,
    },
  },
  {
    .quantity_context = {
      .frame = {
	.id = STATUS_AIRFLOW_VOLUME_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
	.timeout = &status_airflow_volume_timeout,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _VOLUME_AIR_FLOW,
      },
      .quantity = &airflow_volume_quantity,
    },
  },
  {
    .quantity_context = {
      .frame = {
	.id = STATUS_INTERNAL_TEMPERATURE_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
	.timeout = &status_internal_temperature_timeout,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _TEMPERATURE,
      },
      .quantity = &internal_temperature_quantity,
    },
  },
  {
    .image_context = {
      .frame = {
	.id = STATUS_PRESS_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.timeout = &status_press_timeout,
      },
      .image = GU8_IMAGE_PRESS,
    }
  },
  {
    .canvas_context = {
      .frame = {
	.id = STATUS_SETUP_CONTEXT_ID,
	.type = GU8_CONTEXT_CANVAS,
	.screen = gu8_screen_canvas,
	.timeout = &status_setup_timeout,
      },
    .renderer = status_setup_renderer,
    },
  },
  { /**/ },
};
