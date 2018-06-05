TODO:

* caribou express timer time in milliseconds / convert to/from jiffies transparent to consumer.
* differentiate /dev file names from /chip file names.
* fix errno warnings - fix/remove dirty hacks - ifdef on each type.
* GHOST build (pthread wrapper?)
* fix no return value warnings in uart dma functions (return state or void?).
* uart.c enable disable dma unused channel warnings
* atoll/atoi parens around sub-exprs in condition eval.
* uint count assign, etc. from int type
* remove spinlock 
* variable 'used' in heap is not used;
* stack size should be uint32_t
* type casts in thread. from uint32 to void* casts.
* unused timer ptr in timer.c 
* process_frame_t cast warnings in thread.c
* caribou uart.c tarnsmit_data needs to return chip_transmit return.
* btoa uninitialized
* impliment puts() to eliminate compiler optimization emitting  
* Look into try-catch for C (GitHub).

+ Initialize caribou_state struct in caribou_init
+ strdup() function notreturning 'other'.
+ bytequeue dma functions should return void.
+ interrupt.c (char)vector to (unsigned char)vector
+ include caribou/lib/string.h in interrupt.c
+ include caribou.h in thread.c
+ include <caribou/lib/string.h> in timer.c
+ _halt() should for(;;) to satisfy compiler warning
