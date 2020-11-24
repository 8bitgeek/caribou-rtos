
/***************************************************************************
 ***************************************************************************
 **
 ** synopsis:   Settings
 **
 **/

#include <bytestream/sink/array.h>
#include <bytestream/sink/writer.h>
#include <bytestream/source/array.h>
#include <bytestream/source/reader.h>
#include <uon/uon.h>
#include <uon/bytes/bytes.h>
#include <version/version.h>

bool settings_load(char *file_path);
void settings_reload(void);
bool settings_restore(char *file_path);
bool settings_update(char *file_path);
bool settings_save(char *file_path);

typedef uon_bytes_reference_t settings_ref_t;

typedef struct {
  bool (*open)(void);
  bool (*close)(void);
  bool (*refer)(settings_ref_t *reference, char * path, uon_type_t type);
  bool (*wrefer)(settings_ref_t *reference, char * path, uon_type_t type);
  bool (*get)(settings_ref_t *reference, void *value);
  bool (*set)(settings_ref_t *reference, void *value);
  bool (*get_version)(version_t *version);
} settings_t;

settings_t settings;
