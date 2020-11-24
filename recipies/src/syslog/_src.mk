SRC_SYSLOG=${SRC_ROOT}/syslog
INC += -I $(SRC_SYSLOG)

SRCS_CC += $(SRC_SYSLOG)/syslog.c
SRCS_CC += $(SRC_SYSLOG)/syslog_printf.c
SRCS_CC += $(SRC_SYSLOG)/syslog_timestamp.c
SRCS_CC += $(SRC_SYSLOG)/syslog_ezbus.c

