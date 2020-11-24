#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/menu.h>
#include <mode/menu/measurements.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Measurements menu
 **
 **/

static uint32_t measurements_bits = 0;

static void measurements_choose(uint32_t arg32) {
  measurements_bits ^= 1 << arg32;
}

static gu8_choice_t measurements_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _AIR_FLOW } }, "AF 1",
    .choose = measurements_choose, .choose_arg32 = 0,
    .drill = menu_drill_context,
    .drill_arg32 = MENU_AIRFLOW1_LINEAR_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _AIR_FLOW } }, "AF 2",
    .choose = measurements_choose, .choose_arg32 = 1,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _AIR_FLOW } }, "AF 3",
    .choose = measurements_choose, .choose_arg32 = 2,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _AIR_FLOW } }, "AF 4",
    .choose = measurements_choose, .choose_arg32 = 3,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 1A",
    .choose = measurements_choose, .choose_arg32 = 4,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 1B",
    .choose = measurements_choose, .choose_arg32 = 5,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 2A",
    .choose = measurements_choose, .choose_arg32 = 6,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 2B",
    .choose = measurements_choose, .choose_arg32 = 7,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 3A",
    .choose = measurements_choose, .choose_arg32 = 8,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 3B",
    .choose = measurements_choose, .choose_arg32 = 9,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 4A",
    .choose = measurements_choose, .choose_arg32 = 10,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "AF 4B",
    .choose = measurements_choose, .choose_arg32 = 11,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "THP 1",
    .choose = measurements_choose, .choose_arg32 = 12,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _HUMIDITY } }, "THP 1",
    .choose = measurements_choose, .choose_arg32 = 13,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _PRESSURE } }, "THP 1",
    .choose = measurements_choose, .choose_arg32 = 14,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DIFFPRESS } }, "DP 1",
    .choose = measurements_choose, .choose_arg32 = 15,
  },
};

static uint32_t measurements_get_state() {
  return measurements_bits;
};

gu8_chooser_t measurements_chooser = {
  .type = GU8_CHOOSER_MANY,
  .size = 16,
  .choices = measurements_choices,
  .get_state = &measurements_get_state,
};
