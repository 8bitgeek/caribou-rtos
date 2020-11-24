/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Settings menu
 **
 **/

#include <ff.h>
#include <bytestream/source/array.h>
#include <filesystem/filesystem.h>
#include <ui/gu8/gu8.h>

#include <app.h>
#include <settings.h>
#include <mode/menu.h>
#include <mode/menu/settings.h>


/*
 * synopsis:    Backup
 */

static gu8_choice_t settings_backup_sure_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _COPY_TO_MICROSD } }, "",
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _BACKUP_THE_SETTINGS } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_SETTINGS_BACKUP_MEDIA_CONTEXT_ID,
  },
};

gu8_chooser_t settings_backup_sure_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 2,
  .choices = settings_backup_sure_choices,
};

static ui_scalar_t settings_scalar_backup_failed = {
  .label = { .type = UI_SCALAR_LABEL, .value = _BACKUP_FAILED },
};
static gu8_overlay_t settings_overlay_backup_failed = {
  .type = GU8_OVERLAY_FLASH,
  .scalar = &settings_scalar_backup_failed,
};

void settings_backup_media_execute(uint32_t arg32)
{
  FRESULT       fresult;
  DIR           directory;
  FIL           file;
  FILINFO       file_info;
  version_t     settings_version;
  char          version_filename[VERSION_STRING_SIZE];
  if (filesystem_is_mounted()) {
    fresult = f_mkdir(app.path.directory.base);
    if (fresult == FR_EXIST || fresult == FR_OK) {
      fresult = f_mkdir(app.path.directory.backup);
      if (fresult == FR_EXIST || fresult == FR_OK) {
        char path[APP_PATH_SIZE];
        if (f_opendir(&directory, app.path.directory.backup) == FR_OK) {
          if (f_findfirst(&directory, &file_info, app.path.directory.backup,
                          VERSION_FILE_PATTERN) == FR_OK) do {
              f_unlink(app.path.file.backup(path, file_info.fname));
              fresult = f_findnext(&directory, &file_info);
            } while(file_info.fname[0]);
        }
        f_closedir(&directory);
        if (settings_save(app.path.file.backup(path, APP_FILENAME_BACKUP))) {
          if (settings.get_version(&settings_version)) {
            app.path.file.backup
              (path, version_to_filename(&settings_version, version_filename));
            if (f_open(&file, path, FA_WRITE|FA_CREATE_ALWAYS)
                == FR_OK)
              f_close(&file);
            gu8_set_context(MENU_SETTINGS_BACKUP_REMOVE_CONTEXT_ID);
            return;
          }
        } else {
          gu8_set_context_overlay(&settings_overlay_backup_failed);
        }
      }
    }
    gu8_set_context_image(GU8_IMAGE_USDREPLACE);
  } else {
    gu8_set_context_image(GU8_IMAGE_USDINSERT);
  }
}

static ui_scalar_t settings_scalar_backup_saved = {
  .label = { .type = UI_SCALAR_LABEL, .value = _BACKUP_SAVED },
};
static gu8_overlay_t settings_overlay_backup_saved = {
  .type = GU8_OVERLAY_FLASH,
  .scalar = &settings_scalar_backup_saved,
};

void settings_backup_remove_execute(uint32_t arg32)
{
  gu8_set_context_overlay(&settings_overlay_backup_saved);
  if (!filesystem_is_media()) {
    gu8_set_context(MENU_SETTINGS_BACKUP_LABEL_CONTEXT_ID);
  }
}

void settings_backup_label_anykey(uint8_t key_state, uint32_t arg32)
{
  gu8_pop_context();
}

static ui_scalar_t settings_scalar_anykey = {
  .label = { .type = UI_SCALAR_LABEL, .value = _PRESS_ANY_KEY },
};
static gu8_overlay_t settings_overlay_anykey = {
  .type = GU8_OVERLAY_FLASH,
  .scalar = &settings_scalar_anykey,
};

void settings_backup_label_execute(uint32_t arg32)
{
  gu8_set_context_overlay(&settings_overlay_anykey);
}

/*
 * synopsis:    Restore
 */

static gu8_choice_t settings_restore_sure_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _COPY_FROM_MICROSD } }, "",
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _RESTORE_THE_SETTINGS } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_SETTINGS_RESTORE_MEDIA_CONTEXT_ID,
  },
};

gu8_chooser_t settings_restore_sure_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 2,
  .choices = settings_restore_sure_choices,
};

static ui_scalar_t settings_scalar_restore_failed = {
  .label = { .type = UI_SCALAR_LABEL, .value = _RESTORE_FAILED },
};
static gu8_overlay_t settings_overlay_restore_failed = {
  .type = GU8_OVERLAY_FLASH,
  .scalar = &settings_scalar_restore_failed,
};

void settings_restore_media_execute(uint32_t arg32)
{
  char  path[APP_PATH_SIZE];
  FIL   file;
  if (filesystem_is_mounted()) {
    app.path.file.backup(path, APP_FILENAME_BACKUP);
    if (f_open(&file, path, FA_READ|FA_OPEN_EXISTING) == FR_OK) {
      f_close(&file);
      if (settings_restore(path)) {
        gu8_set_context(MENU_SETTINGS_RESTORE_REMOVE_CONTEXT_ID);
        return;
      } else {
        gu8_set_context_overlay(&settings_overlay_restore_failed);
      }
    }
    gu8_set_context_image(GU8_IMAGE_USDREPLACE);
  } else {
    gu8_set_context_image(GU8_IMAGE_USDINSERT);
    gu8_set_context_overlay(&screen_overlay_none);
  }
}

void settings_restore_remove_anykey(uint8_t key_state, uint32_t arg32)
{
  gu8_pop_context();
}

static ui_scalar_t settings_scalar_backup_restored = {
  .label = { .type = UI_SCALAR_LABEL, .value = _BACKUP_RESTORED },
};
static gu8_overlay_t settings_overlay_backup_restored = {
  .type = GU8_OVERLAY_FLIP,
  .scalar = &settings_scalar_backup_restored,
  .scalar_flip = &settings_scalar_anykey,
};

void settings_restore_remove_execute(uint32_t arg32)
{
  gu8_set_context_overlay(&settings_overlay_backup_restored);
  if (!filesystem_is_media()) {
    gu8_set_context(MENU_SETTINGS_CONTEXT_ID);
  }
}

/*
 * synopsis:    Factory
 */

void settings_factory_sure(uint32_t arg32)
{
  settings_reload();
  gu8_set_context(arg32);       // warning: Avoids pushing the context.
}

static gu8_choice_t settings_factory_sure_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _CLEAR_ALL_SETTINGS } }, "",
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _RESTORE_TO_FACTORY } }, "",
    .drill = settings_factory_sure,
    .drill_arg32 = MENU_SETTINGS_FACTORY_CONTEXT_ID,
  },
};

void settings_factory_renderer(gu8_render_t *r) {
  u8g2_SetFont(r->u8g2, GU8_FONT_MEDIUM);
  char * string = ui_translate(_SET_TO_FACTORY);
  u8g2_uint_t width = u8g2_GetStrWidth(r->u8g2, string);
  u8g2_DrawStr(r->u8g2, r->x+((r->w-width)/2), r->y+(r->h/2), string);
}

void settings_factory_anykey(uint8_t key_state, uint32_t arg32)
{
  gu8_pop_context();
}

void settings_factory_execute(uint32_t arg32)
{
  gu8_set_context_overlay(&settings_overlay_anykey);
}

gu8_chooser_t settings_factory_sure_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 2,
  .choices = settings_factory_sure_choices,
};

/*
 * synopsis:    Settings
 */

static gu8_choice_t settings_choices[] = {
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _BACKUP } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_SETTINGS_BACKUP_SURE_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _RESTORE } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_SETTINGS_RESTORE_SURE_CONTEXT_ID,
  },
  {
    .title = { .label = { .type = UI_SCALAR_LABEL, .value = _FACTORY } }, "",
    .drill = menu_drill_context,
    .drill_arg32 = MENU_SETTINGS_FACTORY_SURE_CONTEXT_ID,
  },
};

gu8_chooser_t settings_chooser = {
  .type = GU8_CHOOSER_NONE,
  .size = 3,
  .choices = settings_choices,
};
