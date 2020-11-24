# build

OBJS_CXX := $(SRCS_CXX:.cpp=.o)
OBJS_CC  := $(SRCS_CC:.c=.o)
OBJS_AS  := $(SRCS_AS:.S=.o)

${TARGET}: ${TARGET}.elf

${TARGET}.elf: $(OBJS_CXX) $(OBJS_CC) $(OBJS_AS)
	$(LD) $(LFLAGS) -o $@ $^ $(LIBS) 
	$(CP) -O ihex ${TARGET}.elf ${TARGET}.hex
	$(CP) -O srec ${TARGET}.elf ${TARGET}.srec
	$(SZ) ${TARGET}.elf

%.o : %.S %.h
	$(AS) $(ASFLAGS) -o $@  $<

%.o : %.c %.h
	$(CC) $(CFLAGS) -o $@ $<

%.o : %.cpp %.h
	$(CXX) $(CXXFLAGS) -o $@ $<

clean:
		rm -f $(OBJS_CXX) $(OBJS_CC) $(OBJS_AS) ${TARGET}.elf ${TARGET}.bin ${TARGET}.hex ${TARGET}.srec ${TARGET}.map

flash: ${TARGET}.elf
		openocd -f $(OPENOCD_INTERFACE_CFG) -c "$(ENV_HLA_SERIAL)" -f $(OPENOCD_TARGET_CFG) -c "program ${TARGET}.elf verify reset exit"
		#openocd -f $(OPENOCD_INTERFACE_CFG) -f $(OPENOCD_TARGET_CFG) -c "program ${TARGET}.elf verify reset exit"

debug: ${TARGET}.elf
	openocd -f $(OPENOCD_INTERFACE_CFG) -c "$(ENV_HLA_SERIAL)" -f $(OPENOCD_TARGET_CFG) 2> /dev/null &
	#openocd -f $(OPENOCD_INTERFACE_CFG) -c "$(ENV_HLA_SERIAL)" -f $(OPENOCD_TARGET_CFG) &
	$(DB) -quiet -tui -x ${COOK_PROJECT}/gdb/${TARGET}/gdbinit

kill:
	killall openocd
