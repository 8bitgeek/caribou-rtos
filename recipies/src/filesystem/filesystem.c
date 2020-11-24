#include <ff.h>
#include <filesystem/filesystem.h>

#define PERIOD  400     // ms

static uint32_t jiffies;
static uint32_t sustained;
static bool     is_media;
static bool     is_mounted;
static FATFS    filesystem;

void filesystem_setup(void)
{
  sustained = 0;
  jiffies = caribou_state.jiffies;
}

bool filesystem_is_media(void)
{
  return is_media;
}

bool filesystem_is_mounted(void)
{
  return is_mounted;
}

void filesystem_service(void)
{
  bool is_media_now = !hw_gpio_state(gpio_microsd_cd);
  uint32_t now = caribou_state.jiffies;
  uint32_t delta = now - jiffies;
  jiffies = now;

  if (is_media_now) {
    sustained += delta;
    if (PERIOD <= sustained) {
      if (!is_mounted) {
        is_mounted = (f_mount(&filesystem, "", 0) == FR_OK);
        sustained = 0;
      }
    }
  } else {
    sustained = 0;
    if (is_mounted && is_media) {
      is_mounted = !(f_mount(NULL, "", 0) == FR_OK);
    }
  }
  is_media = is_media_now;
}
