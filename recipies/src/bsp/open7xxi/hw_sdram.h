#ifndef _HW_SDRAM_H_
#define _HW_SDRAM_H_

#include <board.h>

#ifdef __cplusplus
 extern "C" {
#endif 


bool hw_sdram_setup(void);

uint32_t hw_sdram_base(void);
uint32_t hw_sdram_end(void);
uint32_t hw_sdram_size(void);

#ifdef __cplusplus
}
#endif

#endif
