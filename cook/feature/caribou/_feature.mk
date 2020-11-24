
CFLAGS_COMMON += -D_CARIBOU_RTOS_=1 

# bsp
include ${FEATURE_ROOT}/_common/_feature.mk

# sources
include ${SRC_ROOT}/caribou/_src.mk

# # source containing main() function
SRCS_CC += $(FEATURE_ROOT)/caribou/main.c

# # final build
# include ${FEATURE_ROOT}/_common/build.mk
