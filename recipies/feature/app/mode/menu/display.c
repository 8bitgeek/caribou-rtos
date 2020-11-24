#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/menu.h>
#include <mode/menu/display.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Display menu
 **
 **/

/*
 * synopsis:	ui_language_t
 */

static void language_choose(uint32_t parameter) {
  ui_set_language((ui_language_t) parameter);
}

static gu8_choice_t language_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _ENGLISH } }, "en",
    .choose = language_choose, .choose_arg32 = _EN,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _SPANISH } }, "es",
    .choose = language_choose, .choose_arg32 = _ES,
  },
};

static uint32_t language_get_state() {
  return (uint32_t) ui_get_language();
};

gu8_chooser_t language_chooser = {
  .type = GU8_CHOOSER_ONE,
  .size = 2,
  .choices = language_choices,
  .get_state = &language_get_state,
};

/*
 * synopsis:	Display
 */

static gu8_choice_t display_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _LANGUAGE } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_UI_LANGUAGES_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _UNITS } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_UNITS_CONTEXT_ID,
  },
};

gu8_chooser_t display_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 2,
  .choices = display_choices,
};

/*
 * synopsis:	Units
 */

static gu8_choice_t units_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _LENGTH } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_LENGTH_UNITS_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_TEMPERATURE_UNITS_CONTEXT_ID,
  },
};

gu8_chooser_t units_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 2,
  .choices = units_choices,
};

/*
 * synopsis:	Length units
 */

static void length_unit_choose(uint32_t parameter) {
  ui_set_length_index((uint8_t) parameter);
}

static gu8_choice_t length_units_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _METERS } }, "",
    .choose = length_unit_choose, .choose_arg32 = 0,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _FEET } }, "",
    .choose = length_unit_choose, .choose_arg32 = 1,
  },
};

static uint32_t length_unit_get_state() {
  return (uint32_t) ui_get_length_index();
};

gu8_chooser_t length_units_chooser = {
  .type = GU8_CHOOSER_ONE,
  .size = 2,
  .choices = length_units_choices,
  .get_state = &length_unit_get_state,
};

/*
 * synopsis:	Temperature units
 */

static void temperature_unit_choose(uint32_t arg32) {
  ui_set_temperature_index((uint8_t) arg32);
}

static gu8_choice_t temperature_units_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _CELSIUS } }, "",
    .choose = temperature_unit_choose, .choose_arg32 = 0,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _FAHRENHEIT } }, "",
    .choose = temperature_unit_choose, .choose_arg32 = 1,
  },
};

static uint32_t temperature_unit_get_state() {
  return (uint32_t) ui_get_temperature_index();
};

gu8_chooser_t temperature_units_chooser = {
  .type = GU8_CHOOSER_ONE,
  .size = 2,
  .choices = temperature_units_choices,
  .get_state = &temperature_unit_get_state,
};
