
#include <ff.h>
#include <filesystem/filesystem.h>
#include <ui/gu8/gu8.h>
#include <version/version.h>

#include <app.h>
#include <settings.h>
#include <mode/update.h>

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Update mode
 **
 **/

static void update_check_firmware(void)
{
}

static void update_check_settings(void)
{
  version_t settings_version;
  if (settings.get_version(&settings_version)) {
    if (version_compare(&app.version, &settings_version) <= 0) {
      gu8_set_mode(SPLASH_MODE_ID);
      return;
    }
  }
  gu8_set_context(UPDATE_SETTINGS_CONTEXT_ID);
  return;
}

static void update_check_execute(uint32_t arg32)
{
  update_check_firmware();
  update_check_settings();
}

static ui_scalar_t update_scalar_version = {
  .string = { .type = UI_SCALAR_STRING },
};
static char version_string_plus[VERSION_STRING_SIZE];
static gu8_overlay_t update_overlay_version = {
  .type = GU8_OVERLAY_FLASH,
  .scalar = &update_scalar_version,
};

static void update_settings(void)
{
  version_t     file_version, settings_version;
  DIR           directory;
  FILINFO       file_info;
  version_string(&(app.version), version_string_plus, true);
  update_scalar_version.string.value = version_string_plus;
  gu8_set_context_overlay(&update_overlay_version);
  if (filesystem_is_mounted()) {
    if (f_opendir(&directory, app.path.directory.factory) == FR_OK) {
      if (f_findfirst(&directory, &file_info, app.path.directory.factory,
                      VERSION_FILE_PATTERN) == FR_OK) {
        if (strlen(file_info.fname)) {
          version_from_filename(file_info.fname, &file_version);
          if (version_compare(&app.version, &file_version) <= 0) {
            char path[APP_PATH_SIZE];
            app.path.file.factory(path, "SETTINGS.UON");
            if (settings.get_version(&settings_version)) {
              if (version_compare(&settings_version, &file_version) <= 0) {
                /*settings_update(path)*/
              }
              goto end;
            } else {
              if (settings_load(path)) {
                gu8_set_context(UPDATE_CHECK_CONTEXT_ID);
                goto end;
              } else {
                // TODO gu8_set_mode(FAILURE_MODE_ID);
                goto end;
              }
            }
          }
        }
      }
    }
    gu8_set_context_image(GU8_IMAGE_USDREPLACE);
  } else {
    gu8_set_context_image(GU8_IMAGE_USDINSERT);
  }
 end:
  f_closedir(&directory);
  return;
}

static void update_settings_execute(uint32_t arg32)
{
  update_settings();
}

gu8_context_t update_mode_contexts[] = {
  {
    .image_context = {
      .frame = {
	.id = UPDATE_CHECK_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.execute = &update_check_execute,
      },
      .image = GU8_IMAGE_LOGO,
    }
  },
  {
    .image_context = {
      .frame = {
	.id = UPDATE_SETTINGS_CONTEXT_ID,
	.type = GU8_CONTEXT_IMAGE,
	.screen = gu8_screen_image,
	.execute = &update_settings_execute,
      },
      .image = GU8_IMAGE_USDINSERT,
    }
  },
  { /**/ },
};
