#include <ui/gu8/gu8.h>

#include <app.h>
#include <mode/menu.h>
#include <mode/menu/storage.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Update menu
 **
 **/

// TODO Remove "undefined" once all functions are implemented.

static gu8_choice_t storage_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _SETTINGS } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_SETTINGS_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DATA } }, "",
    .drill = menu_choose_undefined,
    .is_disabled = true,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _FIRMWARE } }, "",
    .drill = menu_choose_undefined,
    .is_disabled = true,
  },
};

gu8_chooser_t storage_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 3,
  .choices = storage_choices,
};
