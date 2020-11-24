#ifndef _VERSION_H_
#define _VERSION_H_

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define VERSION_EXT             "VER"
#define VERSION_FILE_PATTERN    "*_*_*." VERSION_EXT
#define VERSION_STRING_SIZE     13      // "00.00.00+" | 00_00_00.VER

typedef struct {
  uint8_t       major;
  uint8_t       minor;
  uint8_t       patch;
} version_t;

int version_compare(version_t *this, version_t *that);
char *version_string(version_t *version, char *string, bool is_plus);
char *version_to_filename(version_t *version, char *string);
void version_from_filename(char *string, version_t *version); // 00_00_00.VER

#ifdef __cplusplus
}
#endif

#endif
