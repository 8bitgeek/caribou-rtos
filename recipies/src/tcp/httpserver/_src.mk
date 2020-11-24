SRC_TCP_HTTPSERVER=${SRC_ROOT}/tcp/httpserver
INC += -I $(SRC_TCP_HTTPSERVER)

SRCS_CXX += $(SRC_TCP_HTTPSERVER)/chttprequest.cpp
SRCS_CXX += $(SRC_TCP_HTTPSERVER)/chttpserver.cpp
SRCS_CXX += $(SRC_TCP_HTTPSERVER)/chttpsession.cpp
SRCS_CXX += $(SRC_TCP_HTTPSERVER)/chttpstring.cpp
SRCS_CXX += $(SRC_TCP_HTTPSERVER)/cmimetype.cpp
SRCS_CXX += $(SRC_TCP_HTTPSERVER)/coctetarray.cpp
