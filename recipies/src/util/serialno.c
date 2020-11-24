#include <serialno.h>

#ifndef SERIAL_NO_BASE_ADDRESS
	#define SERIAL_NO_BASE_ADDRESS	0x1FFF7590
#endif

void serialno_get( serialno_t* serialno )
{
	uint32_t* src = (uint32_t*)SERIAL_NO_BASE_ADDRESS;
	for(int n=0; n < 3; n++)
		serialno->word[n] = *src++;
}

uint8_t* serialno_get_hex ( serialno_t* serialno )
{
	static char hexbuf[25];
	hexbuf[24]='\0';
	for(int n=0; n < 12; n++)
		sprintf(&hexbuf[n*2],"%02X",serialno->byte[n]);
	return (uint8_t*)hexbuf;
}
