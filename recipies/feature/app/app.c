#include <app.h>

/***************************************************************************
 ***************************************************************************
 **
 ** synopsis:   File paths
 **
 **/

#define _SLASH   "/"

static char *app_path_file(char *directory, char *path, char *filename)
{
  int i=0, j;
  for (j=0; (path[i+j] = directory[i+j]); j++);
  i += j;
  for (j=0; (path[i+j] = _SLASH[j]); j++);
  i += j;
  for (j=0; (path[i+j] = *(filename+j)); j++);
  return path;
}

static char *app_path_file_factory(char *path, char *filename)
{
  return app_path_file(app.path.directory.factory, path, filename);
}

static char *app_path_file_backup(char *path, char *filename)
{
  return app_path_file(app.path.directory.backup, path, "BACKUP.BAK");
}

static char *app_path_file_log(char *path, char *filename)
{
  return app_path_file(app.path.directory.log, path, filename);
}

static char *app_path_file_data(char *path, char *filename)
{
  return app_path_file(app.path.directory.data, path, filename);
}

/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	Application
 **
 **/
  
app_t app = {
  .identity = { // TODO: Integrate with the build or manufacturing processes.
    .manufacturer       = APP_IDENTITY_MANUFACTURER,
    .model              = APP_IDENTITY_MODEL,
    .serial             = 0x0,
  },
 .version = {
    .major = 0,
    .minor = 1,
    .patch = 0,
  },
 .path = {
    .directory = {
      .base     = _SLASH APP_IDENTITY_MODEL,
      .factory  = _SLASH APP_IDENTITY_MODEL _SLASH "FACTORY",
      .backup   = _SLASH APP_IDENTITY_MODEL _SLASH "BACKUP",
      .log      = _SLASH APP_IDENTITY_MODEL _SLASH "LOG",
      .data     = _SLASH APP_IDENTITY_MODEL _SLASH "DATA",
    },
    .file = {
      .factory  = &app_path_file_factory,
      .backup   = &app_path_file_backup,
      .log      = &app_path_file_log,
      .data     = &app_path_file_data,
    },
  },
};


/*****************************************************************************
 *****************************************************************************
 **
 ** TODO:       Move this to the measurement functions.
 **
 **/

/*
 * synopsis:	Air flow
 */

#define AIRFLOW_AREA 100.0	// TODO: Parameterise.

float get_airflow_linear(void) {
  return 4.32;
};

extern ui_dimension_t airflow_linear_dimension;

ui_quantity_t airflow_linear_quantity = {
  .dimension	= &airflow_linear_dimension,
  .maximum	= 10.0f,
  .minimum	= 0.1f,
  .get		= get_airflow_linear,
};

float get_airflow_volume(void) {
  return get_airflow_linear() * AIRFLOW_AREA;
};

extern ui_dimension_t airflow_volume_dimension;

ui_quantity_t airflow_volume_quantity = {
  .dimension	= &airflow_volume_dimension,
  .maximum	= 1000.0f,
  .minimum	= 10.0f,
  .get		= get_airflow_volume,
};

/*
 * synopsis:	Internal temperature
 */
    
float get_internal_temperature(void) {
  return 92.3;
};

extern ui_dimension_t temperature_dimension;

ui_quantity_t internal_temperature_quantity = {
  .dimension	= &temperature_dimension,
  .maximum	= 100.0f,
  .minimum	= 1.0f,
  .get		= get_internal_temperature,
};


/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	User interface
 **
 **/

#include <ui/gu8/gu8.h>
#include <mode/easy.h>
#include <mode/menu.h>
#include <mode/saver.h>
#include <mode/splash.h>
#include <mode/status.h>
#include <mode/update.h>

void status_watchdog_callback(uint32_t arg32) {
  gu8_set_mode(SAVER_MODE_ID);
}

static gu8_timeout_t status_watchdog = {
  .milliseconds = 20 * 60 * 1000,
  .callback = status_watchdog_callback,
};

void easy_menu_watchdog_callback(uint32_t arg32) {
  gu8_set_mode(STATUS_MODE_ID);
}

static gu8_timeout_t easy_menu_watchdog = {
  .milliseconds = 10 * 60 * 1000,
  .callback = easy_menu_watchdog_callback,
};

static bool splash_status_button_callback(uint8_t key_states, uint32_t arg32) {
  if (key_states & GU8_BUTTON_EASY) {
    gu8_set_mode(EASY_MODE_ID);
    return false;
  } else if (key_states & GU8_BUTTON_MENU) {
    gu8_set_mode(MENU_MODE_ID);
    return false;
  }
  return true;
}

static gu8_button_handler_t splash_status_button_handler = {
  .callback = splash_status_button_callback,
};

static void splash_timeout_callback(uint32_t arg32) {
  gu8_set_mode(STATUS_MODE_ID);
}

static gu8_timeout_t splash_timeout = {
  .milliseconds = SPLASH_INTERVAL * GU8_MILLISECONDS,
  .callback = splash_timeout_callback,
};

static bool easy_button_callback(uint8_t key_states, uint32_t arg32) {
  if (key_states & GU8_BUTTON_EASY) {
    gu8_set_context((gu8_get_context() % (EASY_CONTEXT_ID - 1)) + 1);
    return false;
  } else if (key_states & GU8_BUTTON_MENU) {
    gu8_set_mode(MENU_MODE_ID);
    return false;
  }
  return true;
}

static gu8_button_handler_t easy_button_handler = {
  .callback = easy_button_callback,
};

static bool menu_button_callback(uint8_t key_states, uint32_t arg32) {
  if (key_states & GU8_BUTTON_EASY) {
    gu8_set_mode(EASY_MODE_ID);
    return false;
  }
  return true;
}

static gu8_button_handler_t menu_button_handler = {
  .callback = menu_button_callback,
};

static gu8_button_handler_t saver_button_handler = {
  .callback = splash_status_button_callback,
};

gu8_mode_t modes[] = {
  {
    .id = UPDATE_MODE_ID,
    .contexts = update_mode_contexts,
  },
  {
    .id = SPLASH_MODE_ID,
    .contexts = splash_mode_contexts,
    .timeout = &splash_timeout,
    .button_handler = &splash_status_button_handler,
  },
  {
    .id = STATUS_MODE_ID,
    .contexts = status_mode_contexts,
    .button_handler = &splash_status_button_handler,
    .watchdog = &status_watchdog,
  },
  {
    .id = EASY_MODE_ID,
    .contexts = easy_mode_contexts,
    .button_handler = &easy_button_handler,
    .watchdog = &easy_menu_watchdog,
  },
  {
    .id = MENU_MODE_ID,
    .contexts = menu_mode_contexts,
    .button_handler = &menu_button_handler,
    .watchdog = &easy_menu_watchdog,
  },
  {
    .id = SAVER_MODE_ID,
    .contexts = saver_mode_contexts,
    .button_handler = &saver_button_handler,
  },
  { .contexts = NULL },
};
