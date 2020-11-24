#ifndef _APP_H_
#define _APP_H_

/***************************************************************************
 ***************************************************************************
 **
 ** synopsis:   Identity
 **
 **/

#define APP_IDENTITY_MANUFACTURER       "Mine Air Quality"
#define APP_IDENTITY_MODEL              "AQ-101"

typedef struct {
  char *manufacturer;
  char *model;
  char *serial;
} app_identity_t;


/***************************************************************************
 ***************************************************************************
 **
 ** synopsis:   File paths
 **
 **/

#define APP_FILENAME_BACKUP     "BACKUP.BAK"

#define APP_FILENAME_SIZE       (8+1+3+1)       // BASENAME.EXT\0
#define APP_PATH_SIZE           ((1+APP_FILENAME_SIZE)*4)

typedef struct {
  struct {
    char *base;
    char *factory;
    char *backup;
    char *log;
    char *data;
  } directory;
  struct {
    char *(*factory)(char *path, char *filename);
    char *(*backup)(char *path, char *filename);
    char *(*log)(char *path, char *filename);
    char *(*data)(char *path, char *filename);
  } file;
} app_path_t;


/***************************************************************************
 ***************************************************************************
 **
 ** synopsis:   Application
 **
 **/

#include <version/version.h>

typedef struct {
  app_identity_t        identity;
  version_t             version;
  app_path_t            path;
} app_t;

app_t app;


/*****************************************************************************
 *****************************************************************************
 **
 ** TODO:       Move this to the measurement functions.
 **
 **/

#include <ui/quantity/quantity.h>

float get_airflow_linear(void);
ui_quantity_t airflow_linear_quantity;

float get_airflow_volume(void);
ui_quantity_t airflow_volume_quantity;

float get_internal_temperature(void);
ui_quantity_t internal_temperature_quantity;


/*****************************************************************************
 *****************************************************************************
 **
 ** synopsis:	User interface
 **
 **/

#include <ui/gu8/gu8.h>

typedef enum {
  UPDATE_MODE_ID = 1,
  SPLASH_MODE_ID,
  STATUS_MODE_ID,
  EASY_MODE_ID,
  MENU_MODE_ID,
  SAVER_MODE_ID,
  MODE_ID,
} gu8_mode_id_t;

gu8_mode_t modes[MODE_ID];

#endif
