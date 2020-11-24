# feature-util

SRC_UTIL=${SRC_ROOT}/util
INC += -I $(SRC_UTIL)

SRCS_CC += $(SRC_UTIL)/linearmap.c
SRCS_CC += $(SRC_UTIL)/logmap.c
SRCS_CC += $(SRC_UTIL)/percent.c
SRCS_CC += $(SRC_UTIL)/pid.c
SRCS_CC += $(SRC_UTIL)/serialno.c

 