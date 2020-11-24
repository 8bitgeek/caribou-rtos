#ifndef _MENU_SETTINGS_H_
#define _MENU_SETTINGS_H_

gu8_chooser_t settings_chooser;
gu8_chooser_t settings_backup_sure_chooser;
gu8_chooser_t settings_restore_sure_chooser;
gu8_chooser_t settings_factory_sure_chooser;

void settings_backup_remove_execute(uint32_t arg32);
void settings_backup_media_execute(uint32_t arg32);
void settings_backup_label_anykey(uint8_t key_state, uint32_t arg32);
void settings_backup_label_execute(uint32_t arg32);
void settings_restore_media_execute(uint32_t arg32);
void settings_restore_remove_execute(uint32_t arg32);
void settings_restore_remove_anykey(uint8_t key_state, uint32_t arg32);
void settings_factory_anykey(uint8_t key_state, uint32_t arg32);
void settings_factory_execute(uint32_t arg32);
void settings_factory_renderer(gu8_render_t *r);

#endif
