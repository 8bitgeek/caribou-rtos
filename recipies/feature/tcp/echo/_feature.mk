# bsp
include ${FEATURE_ROOT}/caribou/_feature.mk

# sources
include ${SRC_ROOT}/syslog/_src.mk
include ${SRC_ROOT}/lwip/_src.mk
include ${SRC_ROOT}/delay/_src.mk
include ${SRC_ROOT}/util/_src.mk
include ${SRC_ROOT}/cariboupp/_src.mk
include ${SRC_ROOT}/cariboupp/net/_src.mk
include ${SRC_ROOT}/tcp/echoserver/_src.mk

# source containing main() function
SRCS_CXX += $(FEATURE_ROOT)/${FEATURE}/main.cpp

# final build
include ${FEATURE_ROOT}/_common/build.mk
