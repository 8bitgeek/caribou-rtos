#include <syslog_timestamp.h>

#if defined(_CARIBOU_RTOS_)
  
  #include <caribou/kernel/timer.h>

  extern  syslog_timestamp_t  syslog_timestamp(void)
  {
    return caribou_timer_ticks();
  }  

#else
  #error define syslog_timestamp
#endif