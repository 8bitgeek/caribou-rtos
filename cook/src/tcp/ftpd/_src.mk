SRC_TCP_FTPSERVER=${SRC_ROOT}/tcp/ftpd
INC += -I $(SRC_TCP_FTPSERVER)

SRCS_CXX += $(SRC_TCP_FTPSERVER)/cdirpath.cpp
SRCS_CXX += $(SRC_TCP_FTPSERVER)/cftpserver.cpp
SRCS_CXX += $(SRC_TCP_FTPSERVER)/cftpsession.cpp
SRCS_CXX += $(SRC_TCP_FTPSERVER)/coctetarray.cpp
