# tools

GCC_ROOT   = ${ENV_GCC_ROOT}
GCC_PREFIX = ${ENV_GCC_PREFIX}
GCC_LIB    = ${ENV_GCC_LIB}

# GCC_ROOT = /opt/gcc-arm-none-eabi98-2019-q4-major/bin
# GCC_PREFIX   = $(GCC_ROOT)/arm-none-eabi-
# GCC_LIB  = /../lib/gcc/arm-none-eabi/9.2.1

# GCC_ROOT = /opt/gcc-arm-none-eabi-8-2018-q4-major/bin
# GCC_PREFIX   = $(GCC_ROOT)/arm-none-eabi-
# GCC_LIB  = /../lib/gcc/arm-none-eabi/8.2.1

# GCC_ROOT = /opt/gcc-arm-none-eabi-7-2018-q2-update/bin
# GCC_PREFIX   = $(GCC_ROOT)/arm-none-eabi-
# GCC_LIB  = /../lib/gcc/arm-none-eabi/7.3.1

CC=$(GCC_PREFIX)gcc
CXX=$(GCC_PREFIX)g++
#LD=$(GCC_PREFIX)gcc
LD=$(GCC_PREFIX)g++
DB=$(GCC_PREFIX)gdb
AR=$(GCC_PREFIX)ar
AS=$(GCC_PREFIX)as
CP=$(GCC_PREFIX)objcopy
OD=$(GCC_PREFIX)objdump
SZ=$(GCC_PREFIX)size
LS=${COOK_PROJECT}/ld/${TARGET}.ld 
