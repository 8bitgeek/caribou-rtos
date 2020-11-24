# bsp + common
include ${FEATURE_ROOT}/bsp/${TARGET}/_feature.mk
include ${FEATURE_ROOT}/_common/_feature.mk

# features
include ${FEATURE_ROOT}/caribou/_feature.mk
include ${FEATURE_ROOT}/caribou-chip-stm32l4xx/_feature.mk

# sources 
include ${SRC_ROOT}/filesystem/_src.mk
include ${SRC_ROOT}/keypad/_src.mk
include ${SRC_ROOT}/u8g2/_src.mk
include ${SRC_ROOT}/oled/_src.mk
include ${SRC_ROOT}/delay/_src.mk
include ${SRC_ROOT}/ui/_src.mk

# SRCS_CC += $(SRC_BSP)/diskio_test.c
# SRCS_CC += $(SRC_BSP)/diskio.c
