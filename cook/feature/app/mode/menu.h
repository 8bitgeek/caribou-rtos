#ifndef _GU8_MODE_MENU_H_
#define _GU8_MODE_MENU_H_

void menu_drill_context(uint32_t arg32);
void menu_choose_undefined(uint32_t arg32);
  
typedef enum {
  MENU_MAIN_CONTEXT_ID = 1,
  MENU_MEASUREMENTS_CONTEXT_ID,
  MENU_AIRFLOW1_LINEAR_CONTEXT_ID,
  MENU_AIRFLOW1_VOLUME_CONTEXT_ID,
  MENU_AIRFLOW1_SETUP_CONTEXT_ID,
  MENU_AIRFLOW1_DISTANCE_CONTEXT_ID,
  MENU_AIRFLOW1_BASELINE_CONTEXT_ID,
  MENU_AIRFLOW1_FACETOFACE_CONTEXT_ID,
  MENU_AIRFLOW2_LINEAR_CONTEXT_ID,
  MENU_AIRFLOW2_VOLUME_CONTEXT_ID,
  MENU_AIRFLOW3_LINEAR_CONTEXT_ID,
  MENU_AIRFLOW3_VOLUME_CONTEXT_ID,
  MENU_AIRFLOW4_LINEAR_CONTEXT_ID,
  MENU_AIRFLOW4_VOLUME_CONTEXT_ID,
  MENU_INTERNAL_TEMPERATURE_CONTEXT_ID,
  MENU_DISTANCE_CONTEXT_ID,
  MENU_DISPLAY_CONTEXT_ID,
  MENU_UNITS_CONTEXT_ID,
  MENU_LENGTH_UNITS_CONTEXT_ID,
  MENU_TEMPERATURE_UNITS_CONTEXT_ID,
  MENU_UI_LANGUAGES_CONTEXT_ID,
  MENU_STORAGE_CONTEXT_ID,
  MENU_FIRMWARE_CONTEXT_ID,
  MENU_SETTINGS_CONTEXT_ID,
  MENU_SETTINGS_BACKUP_SURE_CONTEXT_ID,
  MENU_SETTINGS_BACKUP_MEDIA_CONTEXT_ID,
  MENU_SETTINGS_BACKUP_REMOVE_CONTEXT_ID,
  MENU_SETTINGS_BACKUP_LABEL_CONTEXT_ID,
  MENU_SETTINGS_RESTORE_SURE_CONTEXT_ID,
  MENU_SETTINGS_RESTORE_MEDIA_CONTEXT_ID,
  MENU_SETTINGS_RESTORE_REMOVE_CONTEXT_ID,
  MENU_SETTINGS_FACTORY_SURE_CONTEXT_ID,
  MENU_SETTINGS_FACTORY_CONTEXT_ID,
  MENU_CONTEXT_ID,
} gu8_menu_context_id_t;

gu8_context_t menu_mode_contexts[MENU_CONTEXT_ID];

#endif
