/* See LICENSE of license details. */

#include <unistd.h>
#include <errno.h>
#include <signal.h>

#include "stub.h"

#if 1
extern int kill(pid_t pid, int sig)
{
  return EINVAL;
}
#endif
