#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/easy.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Easy mode
 **
 **/

gu8_context_t easy_mode_contexts[] = {
  {
    .quantity_context = {
      .frame = {
	.id = EASY_AIRFLOW_LINEAR_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
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
	.id = EASY_AIRFLOW_VOLUME_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
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
	.id = EASY_INTERNAL_TEMPERATURE_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _TEMPERATURE,
      },
      .quantity = &internal_temperature_quantity,
    },
  },
  { /**/ },
};
