# bsp
include ${FEATURE_ROOT}/caribou/_feature.mk

# sources
include ${SRC_ROOT}/syslog/_src.mk
include ${SRC_ROOT}/util/_src.mk

# source containing main() function
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/main.c

# final build
include ${FEATURE_ROOT}/_common/build.mk
