#ifndef __DELAY_H__
#define __DELAY_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

#define usleep(us) usdelay((us))
#define sleep(sec)  msdelay((sec)*1000) 

extern void usdelay(register uint32_t us);

extern void msdelay(uint32_t ms);

#ifdef __cplusplus
}
#endif

#endif
