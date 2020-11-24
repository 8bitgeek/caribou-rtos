SRC_FILESYSTEM=${SRC_ROOT}/filesystem/ff13c/source
INC += -I $(SRC_FILESYSTEM)

SRCS_CC += $(SRC_FILESYSTEM)/ff.c
SRCS_CC += $(SRC_FILESYSTEM)/ffsystem.c
SRCS_CC += $(SRC_FILESYSTEM)/ffunicode.c
SRCS_CC += ${SRC_ROOT}/filesystem/filesystem.c

