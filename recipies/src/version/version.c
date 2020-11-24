#include <version/version.h>

int version_compare(version_t *this, version_t *that)
{
  return
    this->major < that->major ? -1 :
    that->major < this->major ? +1 :
    this->minor < that->minor ? -1 :
    that->minor < this->minor ? +1 :
    this->patch < that->patch ? -1 :
    that->patch < this->patch ? +1 :
    0;
}

char *version_string(version_t *version, char *string, bool is_plus)
{
  char *p = string;
  p += sprintf(p, "%u.", min(version->major, 99));
  p += sprintf(p, "%u.", min(version->minor, 99));
  p += sprintf(p, "%u%s", min(version->patch, 99), is_plus ? "+" : "");
  *p++ = '\0';
  return string;
}

char *version_to_filename(version_t *version, char *string)
{
  char *p = string;
  p += sprintf(p, "%u_", min(version->major, 99));
  p += sprintf(p, "%u_", min(version->minor, 99));
  p += sprintf(p, "%u.%s", min(version->patch, 99), VERSION_EXT);
  *p++ = '\0';
  return string;
}

void version_from_filename(char *filename, version_t *version)
{
  version->major = version->minor = version->patch = 0;
  char digits[10];
  char *p = filename;
  int i, j;
  i = 0;
  for (j=0; isnum(p[i+j]); j++) digits[j] = p[i+j];
  digits[j] = '\0';
  version->major = atoi(digits);
  i += j + (p[i+j] == '_' ? 1 : 0);
  for (j=0; isnum(p[i+j]); j++) digits[j] = p[i+j];
  digits[j] = '\0';
  version->minor = atoi(digits);
  i += j + (p[i+j] == '_' ? 1 : 0);
  for (j=0; isnum(p[i+j]); j++) digits[j] = p[i+j];
  digits[j] = '\0';
  version->patch = atoi(digits);
}
