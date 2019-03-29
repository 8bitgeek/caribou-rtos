#ifndef __CARIBOU_FTOA_H__
#define __CARIBOU_FTOA_H__

#ifdef __cplusplus
extern "C" {
#endif

#if defined(CARIBOU_FLOAT)
	extern char * caribou_ftoa(float* f, char * buf, int precision);
#endif

#ifdef __cplusplus
}
#endif

#endif // __CARIBOU_FTOA_H__
