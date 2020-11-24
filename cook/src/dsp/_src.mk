# feature-delay
SRC_DSP=${SRC_ROOT}/dsp
INC += -I $(SRC_DSP)

SRCS_CC += $(SRC_DSP)/dsp.c             	\
		   $(SRC_DSP)/dsp_callback.c 		\
		   $(SRC_DSP)/dsp_data_point.c 		\
		   $(SRC_DSP)/dsp_prescan.c 		\
		   $(SRC_DSP)/dsp_spline.c 			\
		   $(SRC_DSP)/dsp_zero_crossing.c 	\
		   $(SRC_DSP)/point.c
