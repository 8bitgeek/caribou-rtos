SRC_TCP_ECHOSERVER=${SRC_ROOT}/tcp/echoserver
INC += -I $(SRC_TCP_ECHOSERVER)

SRCS_CXX += $(SRC_TCP_ECHOSERVER)/ctcpechoserver.cpp
SRCS_CXX += $(SRC_TCP_ECHOSERVER)/ctcpechosession.cpp

