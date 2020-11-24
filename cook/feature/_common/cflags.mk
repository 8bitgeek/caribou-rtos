# flags

CFLAGS_COMMON += $(INC)
CFLAGS_COMMON += -D_${TARGET_CPP}_=1
CFLAGS_COMMON += -DUSE_NATIVE_STDARG=1
CFLAGS_COMMON += -DUSE_FULL_ASSERT=1 -D_CARIBOU_RTOS_=1
CFLAGS_COMMON += -Wall -Wno-unused-function -Wno-nonnull-compare -fno-builtin -Wno-unused-but-set-variable
CFLAGS_COMMON += -fsingle-precision-constant -ffunction-sections -fdata-sections
CFLAGS_COMMON += -Wno-double-promotion -Wno-attributes 
CFLAGS_COMMON += -Wfloat-conversion 
#CFLAGS_COMMON += -nostartfiles -nostdlib -c
#CFLAGS_COMMON += -nostartfiles -nostdlib
CFLAGS_COMMON += -c


CFLAGS += $(CFLAGS_COMMON)
CFLAGS += -std=gnu99 -Wno-implicit-function-declaration 

CXXFLAGS += $(CFLAGS_COMMON)

ASFLAGS	+= -mlittle-endian -mthumb -mthumb-interwork -mcpu=$(MCU_CORE)

LFLAGS += -Wl,-T,$(LS) -Wl,-Map=${TARGET}.map -Wl,--gc-sections -Wl,-ereset_handler -Wl,-allow-multiple-definition
