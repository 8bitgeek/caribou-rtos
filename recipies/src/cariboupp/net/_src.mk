# ** CARIBOUPP
SRC_CARIBOUPP  = ${ENV_CARIBOU_ROOT}/caribou++
INC += -I $(SRC_CARIBOUPP)/include

SRCS_CXX += $(SRC_CARIBOUPP)/src/cabstractsocket.cpp
SRCS_CXX += $(SRC_CARIBOUPP)/src/ctcpserver.cpp
SRCS_CXX += $(SRC_CARIBOUPP)/src/ctcpsession.cpp
SRCS_CXX += $(SRC_CARIBOUPP)/src/ctcpsocket.cpp
SRCS_CXX += $(SRC_CARIBOUPP)/src/cudpserver.cpp
SRCS_CXX += $(SRC_CARIBOUPP)/src/cudpsession.cpp
SRCS_CXX += $(SRC_CARIBOUPP)/src/cudpsocket.cpp
#SRCS_CXX += $(SRC_CARIBOUPP)/src/cwebsocket.cpp
#SRCS_CXX += $(SRC_CARIBOUPP)/src/cwebsocketserver.cpp
#SRCS_CXX += $(SRC_CARIBOUPP)/src/cwebsocketsession.cpp
