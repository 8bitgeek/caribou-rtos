#include <board.h>
#include <delay.h>
#include <filesystem/filesystem.h>
#include <ui/gu8/gu8.h>
#include <ui/gu8/chooser.h>
#include <ui/language/language.h>

#include <app.h>

#define USER_THREAD_STK_SZ	(1024*3)
#define USER_EVENT_LOOP_MS      100

static uint32_t user_stack[ USER_THREAD_STK_SZ/sizeof(uint32_t) ];
static caribou_thread_t *user_thread = NULL;

static caribou_timer_t event_loop_timer;
static void user_thread_run(void *arg);

extern void feature_main(void)
{
  user_thread = caribou_thread_create
    ("user", user_thread_run, NULL, NULL,
     user_stack, USER_THREAD_STK_SZ, 1, 0
     );
}

/** Call-back from caribou main thread. */
extern void board_idle()
{
  static caribou_tick_t last_jiffies = 0;
  caribou_thread_yield();
  if (caribou_state.jiffies != last_jiffies) {
    disk_timerproc(); // Chan's filesystem needs 1ms service call
    last_jiffies = caribou_state.jiffies;
  }
}

static void *event_loop_timer_callback(void *thread, struct _caribou_timer_t* timer, void*arg) {
  caribou_thread_wakeup(user_thread);
  return NULL;
}

extern void user_thread_run(void *arg)
{
  filesystem_setup();
  gu8_setup();
  gu8_set_modes(modes);
  caribou_timer_init(&event_loop_timer, event_loop_timer_callback, NULL, 0);
  caribou_timer_set(&event_loop_timer, from_ms(USER_EVENT_LOOP_MS));
  for (;;)
    {
      filesystem_service();
      gu8_service();
      caribou_thread_sleep_current(TIMEOUT_INFINITE);
    }
}
