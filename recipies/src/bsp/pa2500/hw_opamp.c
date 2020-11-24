#include <hw_opamp.h>

OPAMP_TypeDef* opamp = OPAMP;

static bool hw_opamp_get_follower( void );
static void hw_opamp_set_follower( void );
static void hw_opamp_set_pga     ( void );

extern void hw_opamp_setup( void )
{
	opamp->CSR |= OPAMP1_CSR_OPARANGE;		// High range.
	opamp->CSR &= ~OPAMP1_CSR_VPSEL;		// GPIO connected to VINP
	opamp->CSR |= OPAMP1_CSR_VMSEL_1;		// Inverting input not externally connected
	hw_opamp_set_gain( OPAMP_GAIN_1 );
	//opamp->CSR |= OPAMP1_CSR_USERTRIM;
}

extern void hw_opamp_enable( void )
{
	opamp->CSR |= OPAMP1_CSR_OPAEN;
}

extern void hw_opamp_disable( void )
{
	opamp->CSR &= ~OPAMP1_CSR_OPAEN;
}

extern void hw_opamp_set_gain( uint8_t gain )
{
	gain &= 0x7;
	if ( gain == OPAMP_GAIN_1 )
	{
		hw_opamp_set_follower();
	}
	else
	{
		gain-=1;
		hw_opamp_set_pga();
		opamp->CSR &= ~OPAMP1_CSR_PGAGAIN_Msk;
		opamp->CSR |= gain << OPAMP1_CSR_PGAGAIN_Pos;
	}
}

extern uint8_t hw_opamp_get_gain( void )
{
	uint8_t gain;
	if ( hw_opamp_get_follower() )
	{
		return OPAMP_GAIN_1;
	}
	else
	{
		gain = ((opamp->CSR & OPAMP1_CSR_PGAGAIN_Msk) >> OPAMP1_CSR_PGAGAIN_Pos) + 1;
	}
	return gain;
}

extern void	hw_opamp_set_offset_p( uint8_t offset )
{
	offset &= 0x1F;
	opamp->OTR &= ~OPAMP1_OTR_TRIMOFFSETP_Msk;
	opamp->OTR |= offset << OPAMP1_OTR_TRIMOFFSETP_Pos;
}

extern void	hw_opamp_set_offset_n( uint8_t offset )
{
	offset &= 0x1F;
	opamp->OTR &= ~OPAMP1_OTR_TRIMOFFSETN_Msk;
	opamp->OTR |= offset << OPAMP1_OTR_TRIMOFFSETN_Pos;
}

extern uint8_t hw_opamp_get_offset_p( void )
{
	uint8_t offset = (opamp->OTR & OPAMP1_OTR_TRIMOFFSETP_Msk) >> OPAMP1_OTR_TRIMOFFSETP_Pos;
	return offset;
}

extern uint8_t hw_opamp_get_offset_n( void )
{
	uint8_t offset = (opamp->OTR & OPAMP1_OTR_TRIMOFFSETN_Msk) >> OPAMP1_OTR_TRIMOFFSETN_Pos;
	return offset;
}


static bool hw_opamp_get_follower( void )
{
	return (opamp->CSR & ( OPAMP1_CSR_OPAMODE_1 | OPAMP1_CSR_OPAMODE_0 )) == ( OPAMP1_CSR_OPAMODE_1 | OPAMP1_CSR_OPAMODE_0 );
}

static void hw_opamp_set_follower( void )
{
	opamp->CSR |= ( OPAMP1_CSR_OPAMODE_1 | OPAMP1_CSR_OPAMODE_0 );
}

static void hw_opamp_set_pga( void )
{
	opamp->CSR |= OPAMP1_CSR_OPAMODE_1;
	opamp->CSR &= ~OPAMP1_CSR_OPAMODE_0;
}


