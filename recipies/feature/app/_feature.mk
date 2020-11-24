# bsp + common
include ${FEATURE_ROOT}/caribou/_feature.mk

# sources
include ${SRC_ROOT}/delay/_src.mk
include ${SRC_ROOT}/filesystem/_src.mk
include ${SRC_ROOT}/keypad/_src.mk
include ${SRC_ROOT}/oled/_src.mk
include ${SRC_ROOT}/u8g2/_src.mk
include ${SRC_ROOT}/ui/gu8/_src.mk
include ${SRC_ROOT}/ui/gu8/language/_src.mk
include ${SRC_ROOT}/ui/language/_src.mk
include ${SRC_ROOT}/ui/quantity/_src.mk
include ${SRC_ROOT}/ui/scalar/_src.mk
include ${SRC_ROOT}/uon/_src.mk
include ${SRC_ROOT}/version/_src.mk

INC += -I $(FEATURE_ROOT)/${FEATURE}

SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/app.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/easy.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/menu.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/menu/airflow.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/menu/display.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/menu/measurements.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/menu/settings.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/menu/storage.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/saver.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/splash.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/status.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/mode/update.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/main.c
SRCS_CC += $(FEATURE_ROOT)/${FEATURE}/settings.c

# final build
include ${FEATURE_ROOT}/_common/build.mk
