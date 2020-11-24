#ifndef __HW_RAND_H__
#define __HW_RAND_H__

#include <board.h>
#include <caribou/lib/rand.h>


#define HW_RAND_MAX     RAND_MAX
#define hw_srand(seed)  srand((seed))
#define hw_rand()       rand()

#endif
