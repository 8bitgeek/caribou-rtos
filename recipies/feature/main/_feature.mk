# dependencies
include $(FEATURE_ROOT)/${FEATURE}/${TARGET}/_feature.mk

# source containing main() function
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/${TARGET}/main.c

# final build
include ${FEATURE_ROOT}/_common/build.mk
