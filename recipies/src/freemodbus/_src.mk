# ** FREEMODBUS
SRC_FREEMODBUS=${ENV_FREEMODBUS_ROOT}
INC += 	-I $(SRC_FREEMODBUS) 			\
		-I $(SRC_FREEMODBUS)/include 	\
		-I $(SRC_FREEMODBUS)/ascii 		\
		-I $(SRC_FREEMODBUS)/rtu 		\
		-I $(SRC_FREEMODBUS)/tcp

SRCS_CC += $(SRC_FREEMODBUS)/mb.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbfunccoils.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbfuncdiag.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbfuncdisc.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbfuncholding.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbfuncinput.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbfuncother.c
SRCS_CC += $(SRC_FREEMODBUS)/functions/mbutils.c
SRCS_CC += $(SRC_FREEMODBUS)/ascii/mbascii.c
SRCS_CC += $(SRC_FREEMODBUS)/rtu/mbcrc.c
SRCS_CC += $(SRC_FREEMODBUS)/rtu/mbrtu.c
SRCS_CC += $(SRC_FREEMODBUS)/tcp/mbtcp.c
