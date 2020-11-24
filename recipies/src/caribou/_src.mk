# ** CARIBOU
SRC_CARIBOU  = ${ENV_CARIBOU_ROOT}
INC += -I $(SRC_CARIBOU)/caribou/include

SRCS_CC += $(SRC_CARIBOU)/caribou/src/dev/adc.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/dev/gpio.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/dev/i2c.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/dev/i2s.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/dev/spi.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/dev/uart.c

SRCS_CC += $(SRC_CARIBOU)/caribou/src/kernel/caribou.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/kernel/interrupt.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/kernel/interrupt_chaining.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/kernel/ipc.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/kernel/thread.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/kernel/timer.c

SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/bytequeue.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/caribou_ftoa.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/cbmath.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/errno.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/heap.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/mutex.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/qsort.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/queue.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/rand.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/semaphore.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/spinlock.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/stdio.c
SRCS_CC += $(SRC_CARIBOU)/caribou/src/lib/string.c
