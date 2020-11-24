#ifndef __SERIALNO_H__
#define __SERIALNO_H__

#include <board.h>

#ifdef __cplusplus
extern "C"
{
#endif

typedef	union
{
	uint8_t 	byte[12];
	uint16_t 	hword[6];
	uint32_t	word[3];
} serialno_t;

void     serialno_get     ( serialno_t* serialno );
uint8_t* serialno_get_hex ( serialno_t* serialno ); 
int      serialno_compare ( serialno_t* a, serialno_t* b ); 

#define  serialno_compare(a,b)	(memcmp((a),(b),sizeof(serialno_t)))
#define  serialno_equal(a,b)    (serialno_compare((a),(b))==0)

#ifdef __cplusplus
}
#endif

#endif
