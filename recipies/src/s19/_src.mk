# ** S19
SRC_LIBS19=${ENV_LIBS19_ROOT}
INC += 	-I $(SRC_LIBS19)

SRCS_CC += $(SRC_LIBS19)/srec.c
SRCS_CC += $(SRC_LIBS19)/srecreader.c

