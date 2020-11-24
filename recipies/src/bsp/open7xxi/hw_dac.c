#include <hw_dac.h>

extern void hw_dac_setup( void )
{
	DAC->CR |= ( DAC_CR_EN2 | DAC_CR_EN1 );
}

extern void hw_dac_set( uint8_t channel, uint16_t value )
{
	value &= 0x0FFF; // 12 bit
	switch( channel )
	{
		case DAC_CHANNEL_1:
			DAC->DHR12R1 = value;
			break;
		case DAC_CHANNEL_2:
			DAC->DHR12R2 = value;
			break;
	}
}
