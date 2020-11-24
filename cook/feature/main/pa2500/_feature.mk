# bsp + common
include ${FEATURE_ROOT}/_common/_feature.mk

# features
include ${FEATURE_ROOT}/caribou/_feature.mk
include ${FEATURE_ROOT}/caribou-chip-stm32l4xx/_feature.mk

# features 
include ${SRC_ROOT}/delay/_src.mk
include ${SRC_ROOT}/piezo/_src.mk
include ${SRC_ROOT}/rx-gain/_src.mk
include ${SRC_ROOT}/sram/_src.mk
include ${SRC_ROOT}/ds18b20/_src.mk
include ${SRC_ROOT}/comms/_src.mk
# include ${FEATURE_ROOT}/main/_src.mk
