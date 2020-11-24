#include <ui/gu8/gu8.h>
#include <uon/uon.h>

#include <app.h>
#include <mode/menu.h>
#include <mode/menu/airflow.h>
#include <mode/menu/measurements.h>
#include <mode/menu/storage.h>
#include <mode/menu/settings.h>
#include <mode/menu/display.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Menu mode
 **
 **/

void menu_drill_context(uint32_t arg32) {
  gu8_push_context((uint8_t) arg32);
}

static ui_scalar_t menu_scalar_undefined = {
  .label = { .type = UI_SCALAR_LABEL, .value = _UNDEFINED },
};

static gu8_overlay_t menu_overlay_undefined = {
  .type = GU8_OVERLAY_ONCE,
  .scalar = &menu_scalar_undefined,
};

void menu_choose_undefined(uint32_t arg32) {
  gu8_set_context_overlay(&menu_overlay_undefined);
}

/**
 ** synopsis:	Main menu
 **/

static gu8_choice_t main_menu_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _STORAGE } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_STORAGE_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _MEASUREMENTS } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_MEASUREMENTS_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _NETWORKS } }, "",
    .drill = menu_choose_undefined,
    .is_disabled = true,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DATA } }, "",
    .drill = menu_choose_undefined,
    .is_disabled = true,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DISPLAY } }, "",
    .drill = menu_drill_context, .drill_arg32 = MENU_DISPLAY_CONTEXT_ID,
  },
};

static gu8_chooser_t main_menu_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 5,
  .choices = main_menu_choices,
};

gu8_context_t menu_mode_contexts[] = {
  {
    .chooser_context = {
      .frame = {
	.id = MENU_MAIN_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_mode_id = STATUS_MODE_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _AIR_QUALITY, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = APP_IDENTITY_MODEL, } },
      .chooser = &main_menu_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_MEASUREMENTS_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_MAIN_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _MEASUREMENTS, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &measurements_chooser,
    }
  },
  {
    .quantity_context = {
      .frame = {
	.id = MENU_AIRFLOW1_LINEAR_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
	.parent_id = MENU_MAIN_CONTEXT_ID,
	.drill = menu_drill_context,
	.drill_arg32 = MENU_AIRFLOW1_VOLUME_CONTEXT_ID,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _LINEAR_AIR_FLOW,
      },
      .subtitle = {
	.string.type = UI_SCALAR_STRING,
	.string.value = "AF 1",
      },
      .quantity = &airflow_linear_quantity,
    },
  },
  {
    .quantity_context = {
      .frame = {
	.id = MENU_AIRFLOW1_VOLUME_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
	.drill = menu_drill_context,
	.drill_arg32 = MENU_AIRFLOW1_SETUP_CONTEXT_ID,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _VOLUME_AIR_FLOW,
      },
      .subtitle = {
	.string.type = UI_SCALAR_STRING,
	.string.value = "AF 1",
      },
      .quantity = &airflow_volume_quantity,
    },
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_AIRFLOW1_SETUP_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _AIR_FLOW_SETUP, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "AF 1", } },
      .chooser = &airflow_setup_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_AIRFLOW1_DISTANCE_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DISTANCE, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "AF 1", } },
      .chooser = &airflow_distance_chooser,
    }
  },
  {
    .quantity_context = {
      .frame = {
	.id = MENU_AIRFLOW1_BASELINE_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _BASELINE,
      },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "AF 1", } },
      .quantity = &airflow1_baseline_quantity,
    },
  },
  {
    .quantity_context = {
      .frame = {
	.id = MENU_AIRFLOW1_FACETOFACE_CONTEXT_ID,
	.type = GU8_CONTEXT_QUANTITY,
	.screen = gu8_screen_quantity,
      },
      .title = {
	.label.type = UI_SCALAR_LABEL,
	.label.value = _FACE_TO_FACE,
      },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "AF 1", } },
      .quantity = &airflow1_facetoface_quantity,
    },
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_DISPLAY_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_MAIN_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _DISPLAY, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &display_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_UI_LANGUAGES_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_DISPLAY_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _LANGUAGE, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &language_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_UNITS_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_DISPLAY_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _UNITS, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &units_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_LENGTH_UNITS_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_UNITS_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _LENGTH, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &length_units_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_TEMPERATURE_UNITS_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_UNITS_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _TEMPERATURE, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &temperature_units_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_STORAGE_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_MAIN_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _STORAGE, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &storage_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_SETTINGS_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_STORAGE_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _SETTINGS, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &settings_chooser,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_SETTINGS_BACKUP_SURE_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_SETTINGS_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _BACKUP, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &settings_backup_sure_chooser,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = MENU_SETTINGS_BACKUP_MEDIA_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.parent_id = MENU_SETTINGS_BACKUP_SURE_CONTEXT_ID,
	.execute = &settings_backup_media_execute,
      },
      .image = GU8_IMAGE_USDINSERT,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = MENU_SETTINGS_BACKUP_REMOVE_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.execute = &settings_backup_remove_execute,
      },
      .image = GU8_IMAGE_USDREMOVE,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = MENU_SETTINGS_BACKUP_LABEL_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.parent_id = MENU_SETTINGS_CONTEXT_ID,
	.execute = &settings_backup_label_execute,
	.anykey = &settings_backup_label_anykey,
      },
      .image = GU8_IMAGE_USDLABEL,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_SETTINGS_RESTORE_SURE_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_SETTINGS_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _RESTORE, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &settings_restore_sure_chooser,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = MENU_SETTINGS_RESTORE_MEDIA_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.execute = &settings_restore_media_execute,
      },
      .image = GU8_IMAGE_USDINSERT,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = MENU_SETTINGS_RESTORE_REMOVE_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.parent_id = MENU_SETTINGS_CONTEXT_ID,
	.execute = &settings_restore_remove_execute,
	.anykey = &settings_restore_remove_anykey,
      },
      .image = GU8_IMAGE_USDREMOVE,
    }
  },
  {
    .chooser_context = {
      .frame = {
	.id = MENU_SETTINGS_FACTORY_SURE_CONTEXT_ID,
	.type = GU8_CONTEXT_CHOOSER,
	.screen = gu8_screen_chooser,
	.parent_id = MENU_SETTINGS_CONTEXT_ID,
      },
      .title = { .label = { .type = UI_SCALAR_LABEL, .value = _FACTORY, } },
      .subtitle = { .string = { .type = UI_SCALAR_STRING, .value = "", } },
      .chooser = &settings_factory_sure_chooser,
    }
  },
  {
    .canvas_context = {
      .frame = {
	.id = MENU_SETTINGS_FACTORY_CONTEXT_ID,
	.type = GU8_CONTEXT_CANVAS,
	.screen = gu8_screen_canvas,
	.parent_id = MENU_SETTINGS_CONTEXT_ID,
	.execute = &settings_factory_execute,
        .anykey = &settings_factory_anykey
      },
      .renderer = settings_factory_renderer,
    },
  },
  { /**/ },
};
