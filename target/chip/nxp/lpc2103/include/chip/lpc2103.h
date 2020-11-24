// Copyright (c) 2013 Rowley Associates Limited.
//
// This file may be distributed under the terms of the License Agreement
// provided with this software.
//
// THIS FILE IS PROVIDED AS IS WITH NO WARRANTY OF ANY KIND, INCLUDING THE
// WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

#ifndef LPC2103_h
#define LPC2103_h


#define FIO_BASE 0x3FFFC000

#define FIO0DIR (*(volatile unsigned long *)0x3FFFC000)
#define FIO0DIR_OFFSET 0x0

#define FIO0DIR0 (*(volatile unsigned char *)0x3FFFC000)
#define FIO0DIR0_OFFSET 0x0

#define FIO0DIR1 (*(volatile unsigned char *)0x3FFFC001)
#define FIO0DIR1_OFFSET 0x1

#define FIO0DIR2 (*(volatile unsigned char *)0x3FFFC002)
#define FIO0DIR2_OFFSET 0x2

#define FIO0DIR3 (*(volatile unsigned char *)0x3FFFC003)
#define FIO0DIR3_OFFSET 0x3

#define FIO0DIRL (*(volatile unsigned short *)0x3FFFC000)
#define FIO0DIRL_OFFSET 0x0

#define FIO0DIRU (*(volatile unsigned short *)0x3FFFC002)
#define FIO0DIRH FIO0DIRU
#define FIO0DIRU_OFFSET 0x2
#define FIO0DIRH_OFFSET FIO0DIRU_OFFSET

#define FIO0MASK (*(volatile unsigned long *)0x3FFFC010)
#define FIO0MASK_OFFSET 0x10

#define FIO0MASK0 (*(volatile unsigned char *)0x3FFFC010)
#define FIO0MASK0_OFFSET 0x10

#define FIO0MASK1 (*(volatile unsigned char *)0x3FFFC011)
#define FIO0MASK1_OFFSET 0x11

#define FIO0MASK2 (*(volatile unsigned char *)0x3FFFC012)
#define FIO0MASK2_OFFSET 0x12

#define FIO0MASK3 (*(volatile unsigned char *)0x3FFFC013)
#define FIO0MASK3_OFFSET 0x13

#define FIO0MASKL (*(volatile unsigned short *)0x3FFFC010)
#define FIO0MASKL_OFFSET 0x10

#define FIO0MASKU (*(volatile unsigned short *)0x3FFFC012)
#define FIO0MASKH FIO0MASKU
#define FIO0MASKU_OFFSET 0x12
#define FIO0MASKH_OFFSET FIO0MASKU_OFFSET

#define FIO0PIN (*(volatile unsigned long *)0x3FFFC014)
#define FIO0PIN_OFFSET 0x14

#define FIO0PIN0 (*(volatile unsigned char *)0x3FFFC014)
#define FIO0PIN0_OFFSET 0x14

#define FIO0PIN1 (*(volatile unsigned char *)0x3FFFC015)
#define FIO0PIN1_OFFSET 0x15

#define FIO0PIN2 (*(volatile unsigned char *)0x3FFFC016)
#define FIO0PIN2_OFFSET 0x16

#define FIO0PIN3 (*(volatile unsigned char *)0x3FFFC017)
#define FIO0PIN3_OFFSET 0x17

#define FIO0PINL (*(volatile unsigned short *)0x3FFFC014)
#define FIO0PINL_OFFSET 0x14

#define FIO0PINU (*(volatile unsigned short *)0x3FFFC016)
#define FIO0PINH FIO0PINU
#define FIO0PINU_OFFSET 0x16
#define FIO0PINH_OFFSET FIO0PINU_OFFSET

#define FIO0SET (*(volatile unsigned long *)0x3FFFC018)
#define FIO0SET_OFFSET 0x18

#define FIO0SET0 (*(volatile unsigned char *)0x3FFFC018)
#define FIO0SET0_OFFSET 0x18

#define FIO0SET1 (*(volatile unsigned char *)0x3FFFC019)
#define FIO0SET1_OFFSET 0x19

#define FIO0SET2 (*(volatile unsigned char *)0x3FFFC01A)
#define FIO0SET2_OFFSET 0x1A

#define FIO0SET3 (*(volatile unsigned char *)0x3FFFC01B)
#define FIO0SET3_OFFSET 0x1B

#define FIO0SETL (*(volatile unsigned short *)0x3FFFC018)
#define FIO0SETL_OFFSET 0x18

#define FIO0SETU (*(volatile unsigned short *)0x3FFFC01A)
#define FIO0SETH FIO0SETU
#define FIO0SETU_OFFSET 0x1A
#define FIO0SETH_OFFSET FIO0SETU_OFFSET

#define FIO0CLR (*(volatile unsigned long *)0x3FFFC01C)
#define FIO0CLR_OFFSET 0x1C

#define FIO0CLR0 (*(volatile unsigned char *)0x3FFFC01C)
#define FIO0CLR0_OFFSET 0x1C

#define FIO0CLR1 (*(volatile unsigned char *)0x3FFFC01D)
#define FIO0CLR1_OFFSET 0x1D

#define FIO0CLR2 (*(volatile unsigned char *)0x3FFFC01E)
#define FIO0CLR2_OFFSET 0x1E

#define FIO0CLR3 (*(volatile unsigned char *)0x3FFFC01F)
#define FIO0CLR3_OFFSET 0x1F

#define FIO0CLRL (*(volatile unsigned short *)0x3FFFC01C)
#define FIO0CLRL_OFFSET 0x1C

#define FIO0CLRU (*(volatile unsigned short *)0x3FFFC01E)
#define FIO0CLRH FIO0CLRU
#define FIO0CLRU_OFFSET 0x1E
#define FIO0CLRH_OFFSET FIO0CLRU_OFFSET

#define WDT_BASE 0xE0000000

#define WDMOD (*(volatile unsigned long *)0xE0000000)
#define WDMOD_OFFSET 0x0
#define WDMOD_WDEN_MASK 0x1
#define WDMOD_WDEN 0x1
#define WDMOD_WDEN_BIT 0
#define WDMOD_WDRESET_MASK 0x2
#define WDMOD_WDRESET 0x2
#define WDMOD_WDRESET_BIT 1
#define WDMOD_WDTOF_MASK 0x4
#define WDMOD_WDTOF 0x4
#define WDMOD_WDTOF_BIT 2
#define WDMOD_WDINT_MASK 0x8
#define WDMOD_WDINT 0x8
#define WDMOD_WDINT_BIT 3

#define WDTC (*(volatile unsigned long *)0xE0000004)
#define WDTC_OFFSET 0x4

#define WDFEED (*(volatile unsigned long *)0xE0000008)
#define WDFEED_OFFSET 0x8

#define WDTV (*(volatile unsigned long *)0xE000000C)
#define WDTV_OFFSET 0xC

#define TIMER0_BASE 0xE0004000

#define T0IR (*(volatile unsigned char *)0xE0004000)
#define T0IR_OFFSET 0x0
#define T0IR_MR0_MASK 0x1
#define T0IR_MR0 0x1
#define T0IR_MR0_BIT 0
#define T0IR_MR1_MASK 0x2
#define T0IR_MR1 0x2
#define T0IR_MR1_BIT 1
#define T0IR_MR2_MASK 0x4
#define T0IR_MR2 0x4
#define T0IR_MR2_BIT 2
#define T0IR_MR3_MASK 0x8
#define T0IR_MR3 0x8
#define T0IR_MR3_BIT 3
#define T0IR_CR0_MASK 0x10
#define T0IR_CR0 0x10
#define T0IR_CR0_BIT 4
#define T0IR_CR1_MASK 0x20
#define T0IR_CR1 0x20
#define T0IR_CR1_BIT 5
#define T0IR_CR2_MASK 0x40
#define T0IR_CR2 0x40
#define T0IR_CR2_BIT 6
#define T0IR_CR3_MASK 0x80
#define T0IR_CR3 0x80
#define T0IR_CR3_BIT 7

#define T0TCR (*(volatile unsigned char *)0xE0004004)
#define T0TCR_OFFSET 0x4
#define T0TCR_Counter_Enable_MASK 0x1
#define T0TCR_Counter_Enable 0x1
#define T0TCR_Counter_Enable_BIT 0
#define T0TCR_Counter_Reset_MASK 0x2
#define T0TCR_Counter_Reset 0x2
#define T0TCR_Counter_Reset_BIT 1

#define T0TC (*(volatile unsigned long *)0xE0004008)
#define T0TC_OFFSET 0x8

#define T0PR (*(volatile unsigned long *)0xE000400C)
#define T0PR_OFFSET 0xC

#define T0PC (*(volatile unsigned long *)0xE0004010)
#define T0PC_OFFSET 0x10

#define T0MCR (*(volatile unsigned short *)0xE0004014)
#define T0MCR_OFFSET 0x14
#define T0MCR_MR0I_MASK 0x1
#define T0MCR_MR0I 0x1
#define T0MCR_MR0I_BIT 0
#define T0MCR_MR0R_MASK 0x2
#define T0MCR_MR0R 0x2
#define T0MCR_MR0R_BIT 1
#define T0MCR_MR0S_MASK 0x4
#define T0MCR_MR0S 0x4
#define T0MCR_MR0S_BIT 2
#define T0MCR_MR1I_MASK 0x8
#define T0MCR_MR1I 0x8
#define T0MCR_MR1I_BIT 3
#define T0MCR_MR1R_MASK 0x10
#define T0MCR_MR1R 0x10
#define T0MCR_MR1R_BIT 4
#define T0MCR_MR1S_MASK 0x20
#define T0MCR_MR1S 0x20
#define T0MCR_MR1S_BIT 5
#define T0MCR_MR2I_MASK 0x40
#define T0MCR_MR2I 0x40
#define T0MCR_MR2I_BIT 6
#define T0MCR_MR2R_MASK 0x80
#define T0MCR_MR2R 0x80
#define T0MCR_MR2R_BIT 7
#define T0MCR_MR2S_MASK 0x100
#define T0MCR_MR2S 0x100
#define T0MCR_MR2S_BIT 8
#define T0MCR_MR3I_MASK 0x200
#define T0MCR_MR3I 0x200
#define T0MCR_MR3I_BIT 9
#define T0MCR_MR3R_MASK 0x400
#define T0MCR_MR3R 0x400
#define T0MCR_MR3R_BIT 10
#define T0MCR_MR3S_MASK 0x800
#define T0MCR_MR3S 0x800
#define T0MCR_MR3S_BIT 11

#define T0MR0 (*(volatile unsigned long *)0xE0004018)
#define T0MR0_OFFSET 0x18

#define T0MR1 (*(volatile unsigned long *)0xE000401C)
#define T0MR1_OFFSET 0x1C

#define T0MR2 (*(volatile unsigned long *)0xE0004020)
#define T0MR2_OFFSET 0x20

#define T0MR3 (*(volatile unsigned long *)0xE0004024)
#define T0MR3_OFFSET 0x24

#define T0CCR (*(volatile unsigned short *)0xE0004028)
#define T0CCR_OFFSET 0x28
#define T0CCR_CAP0RE_MASK 0x1
#define T0CCR_CAP0RE 0x1
#define T0CCR_CAP0RE_BIT 0
#define T0CCR_CAP0FE_MASK 0x2
#define T0CCR_CAP0FE 0x2
#define T0CCR_CAP0FE_BIT 1
#define T0CCR_CAP0I_MASK 0x4
#define T0CCR_CAP0I 0x4
#define T0CCR_CAP0I_BIT 2
#define T0CCR_CAP1RE_MASK 0x8
#define T0CCR_CAP1RE 0x8
#define T0CCR_CAP1RE_BIT 3
#define T0CCR_CAP1FE_MASK 0x10
#define T0CCR_CAP1FE 0x10
#define T0CCR_CAP1FE_BIT 4
#define T0CCR_CAP1I_MASK 0x20
#define T0CCR_CAP1I 0x20
#define T0CCR_CAP1I_BIT 5
#define T0CCR_CAP2RE_MASK 0x40
#define T0CCR_CAP2RE 0x40
#define T0CCR_CAP2RE_BIT 6
#define T0CCR_CAP2FE_MASK 0x80
#define T0CCR_CAP2FE 0x80
#define T0CCR_CAP2FE_BIT 7
#define T0CCR_CAP2I_MASK 0x100
#define T0CCR_CAP2I 0x100
#define T0CCR_CAP2I_BIT 8
#define T0CCR_CAP3RE_MASK 0x200
#define T0CCR_CAP3RE 0x200
#define T0CCR_CAP3RE_BIT 9
#define T0CCR_CAP3FE_MASK 0x400
#define T0CCR_CAP3FE 0x400
#define T0CCR_CAP3FE_BIT 10
#define T0CCR_CAP3I_MASK 0x800
#define T0CCR_CAP3I 0x800
#define T0CCR_CAP3I_BIT 11

#define T0CR0 (*(volatile unsigned long *)0xE000402C)
#define T0CR0_OFFSET 0x2C

#define T0CR1 (*(volatile unsigned long *)0xE0004030)
#define T0CR1_OFFSET 0x30

#define T0CR2 (*(volatile unsigned long *)0xE0004034)
#define T0CR2_OFFSET 0x34

#define T0CR3 (*(volatile unsigned long *)0xE0004038)
#define T0CR3_OFFSET 0x38

#define T0EMR (*(volatile unsigned short *)0xE000403C)
#define T0EMR_OFFSET 0x3C
#define T0EMR_EM0_MASK 0x1
#define T0EMR_EM0 0x1
#define T0EMR_EM0_BIT 0
#define T0EMR_EM1_MASK 0x2
#define T0EMR_EM1 0x2
#define T0EMR_EM1_BIT 1
#define T0EMR_EM2_MASK 0x4
#define T0EMR_EM2 0x4
#define T0EMR_EM2_BIT 2
#define T0EMR_EM3_MASK 0x8
#define T0EMR_EM3 0x8
#define T0EMR_EM3_BIT 3
#define T0EMR_EMC0_MASK 0x30
#define T0EMR_EMC0_BIT 4
#define T0EMR_EMC1_MASK 0xC0
#define T0EMR_EMC1_BIT 6
#define T0EMR_EMC2_MASK 0x300
#define T0EMR_EMC2_BIT 8
#define T0EMR_EMC3_MASK 0xC00
#define T0EMR_EMC3_BIT 10

#define T0CTCR (*(volatile unsigned long *)0xE0004070)
#define T0CTCR_OFFSET 0x70
#define T0CTCR_Counter_Timer_Mode_MASK 0x3
#define T0CTCR_Counter_Timer_Mode_BIT 0
#define T0CTCR_Count_Input_Select_MASK 0xC
#define T0CTCR_Count_Input_Select_BIT 2

#define PWM0CON (*(volatile unsigned long *)0xE0004074)
#define PWM0CON_OFFSET 0x74
#define PWM0CON_PWM0_MASK 0x1
#define PWM0CON_PWM0 0x1
#define PWM0CON_PWM0_BIT 0
#define PWM0CON_PWM1_MASK 0x2
#define PWM0CON_PWM1 0x2
#define PWM0CON_PWM1_BIT 1
#define PWM0CON_PWM2_MASK 0x4
#define PWM0CON_PWM2 0x4
#define PWM0CON_PWM2_BIT 2
#define PWM0CON_PWM3_MASK 0x8
#define PWM0CON_PWM3 0x8
#define PWM0CON_PWM3_BIT 3

#define TIMER1_BASE 0xE0008000

#define T1IR (*(volatile unsigned char *)0xE0008000)
#define T1IR_OFFSET 0x0
#define T1IR_MR0_MASK 0x1
#define T1IR_MR0 0x1
#define T1IR_MR0_BIT 0
#define T1IR_MR1_MASK 0x2
#define T1IR_MR1 0x2
#define T1IR_MR1_BIT 1
#define T1IR_MR2_MASK 0x4
#define T1IR_MR2 0x4
#define T1IR_MR2_BIT 2
#define T1IR_MR3_MASK 0x8
#define T1IR_MR3 0x8
#define T1IR_MR3_BIT 3
#define T1IR_CR0_MASK 0x10
#define T1IR_CR0 0x10
#define T1IR_CR0_BIT 4
#define T1IR_CR1_MASK 0x20
#define T1IR_CR1 0x20
#define T1IR_CR1_BIT 5
#define T1IR_CR2_MASK 0x40
#define T1IR_CR2 0x40
#define T1IR_CR2_BIT 6
#define T1IR_CR3_MASK 0x80
#define T1IR_CR3 0x80
#define T1IR_CR3_BIT 7

#define T1TCR (*(volatile unsigned char *)0xE0008004)
#define T1TCR_OFFSET 0x4
#define T1TCR_Counter_Enable_MASK 0x1
#define T1TCR_Counter_Enable 0x1
#define T1TCR_Counter_Enable_BIT 0
#define T1TCR_Counter_Reset_MASK 0x2
#define T1TCR_Counter_Reset 0x2
#define T1TCR_Counter_Reset_BIT 1

#define T1TC (*(volatile unsigned long *)0xE0008008)
#define T1TC_OFFSET 0x8

#define T1PR (*(volatile unsigned long *)0xE000800C)
#define T1PR_OFFSET 0xC

#define T1PC (*(volatile unsigned long *)0xE0008010)
#define T1PC_OFFSET 0x10

#define T1MCR (*(volatile unsigned short *)0xE0008014)
#define T1MCR_OFFSET 0x14
#define T1MCR_MR0I_MASK 0x1
#define T1MCR_MR0I 0x1
#define T1MCR_MR0I_BIT 0
#define T1MCR_MR0R_MASK 0x2
#define T1MCR_MR0R 0x2
#define T1MCR_MR0R_BIT 1
#define T1MCR_MR0S_MASK 0x4
#define T1MCR_MR0S 0x4
#define T1MCR_MR0S_BIT 2
#define T1MCR_MR1I_MASK 0x8
#define T1MCR_MR1I 0x8
#define T1MCR_MR1I_BIT 3
#define T1MCR_MR1R_MASK 0x10
#define T1MCR_MR1R 0x10
#define T1MCR_MR1R_BIT 4
#define T1MCR_MR1S_MASK 0x20
#define T1MCR_MR1S 0x20
#define T1MCR_MR1S_BIT 5
#define T1MCR_MR2I_MASK 0x40
#define T1MCR_MR2I 0x40
#define T1MCR_MR2I_BIT 6
#define T1MCR_MR2R_MASK 0x80
#define T1MCR_MR2R 0x80
#define T1MCR_MR2R_BIT 7
#define T1MCR_MR2S_MASK 0x100
#define T1MCR_MR2S 0x100
#define T1MCR_MR2S_BIT 8
#define T1MCR_MR3I_MASK 0x200
#define T1MCR_MR3I 0x200
#define T1MCR_MR3I_BIT 9
#define T1MCR_MR3R_MASK 0x400
#define T1MCR_MR3R 0x400
#define T1MCR_MR3R_BIT 10
#define T1MCR_MR3S_MASK 0x800
#define T1MCR_MR3S 0x800
#define T1MCR_MR3S_BIT 11

#define T1MR0 (*(volatile unsigned long *)0xE0008018)
#define T1MR0_OFFSET 0x18

#define T1MR1 (*(volatile unsigned long *)0xE000801C)
#define T1MR1_OFFSET 0x1C

#define T1MR2 (*(volatile unsigned long *)0xE0008020)
#define T1MR2_OFFSET 0x20

#define T1MR3 (*(volatile unsigned long *)0xE0008024)
#define T1MR3_OFFSET 0x24

#define T1CCR (*(volatile unsigned short *)0xE0008028)
#define T1CCR_OFFSET 0x28
#define T1CCR_CAP0RE_MASK 0x1
#define T1CCR_CAP0RE 0x1
#define T1CCR_CAP0RE_BIT 0
#define T1CCR_CAP0FE_MASK 0x2
#define T1CCR_CAP0FE 0x2
#define T1CCR_CAP0FE_BIT 1
#define T1CCR_CAP0I_MASK 0x4
#define T1CCR_CAP0I 0x4
#define T1CCR_CAP0I_BIT 2
#define T1CCR_CAP1RE_MASK 0x8
#define T1CCR_CAP1RE 0x8
#define T1CCR_CAP1RE_BIT 3
#define T1CCR_CAP1FE_MASK 0x10
#define T1CCR_CAP1FE 0x10
#define T1CCR_CAP1FE_BIT 4
#define T1CCR_CAP1I_MASK 0x20
#define T1CCR_CAP1I 0x20
#define T1CCR_CAP1I_BIT 5
#define T1CCR_CAP2RE_MASK 0x40
#define T1CCR_CAP2RE 0x40
#define T1CCR_CAP2RE_BIT 6
#define T1CCR_CAP2FE_MASK 0x80
#define T1CCR_CAP2FE 0x80
#define T1CCR_CAP2FE_BIT 7
#define T1CCR_CAP2I_MASK 0x100
#define T1CCR_CAP2I 0x100
#define T1CCR_CAP2I_BIT 8
#define T1CCR_CAP3RE_MASK 0x200
#define T1CCR_CAP3RE 0x200
#define T1CCR_CAP3RE_BIT 9
#define T1CCR_CAP3FE_MASK 0x400
#define T1CCR_CAP3FE 0x400
#define T1CCR_CAP3FE_BIT 10
#define T1CCR_CAP3I_MASK 0x800
#define T1CCR_CAP3I 0x800
#define T1CCR_CAP3I_BIT 11

#define T1CR0 (*(volatile unsigned long *)0xE000802C)
#define T1CR0_OFFSET 0x2C

#define T1CR1 (*(volatile unsigned long *)0xE0008030)
#define T1CR1_OFFSET 0x30

#define T1CR2 (*(volatile unsigned long *)0xE0008034)
#define T1CR2_OFFSET 0x34

#define T1CR3 (*(volatile unsigned long *)0xE0008038)
#define T1CR3_OFFSET 0x38

#define T1EMR (*(volatile unsigned short *)0xE000803C)
#define T1EMR_OFFSET 0x3C
#define T1EMR_EM0_MASK 0x1
#define T1EMR_EM0 0x1
#define T1EMR_EM0_BIT 0
#define T1EMR_EM1_MASK 0x2
#define T1EMR_EM1 0x2
#define T1EMR_EM1_BIT 1
#define T1EMR_EM2_MASK 0x4
#define T1EMR_EM2 0x4
#define T1EMR_EM2_BIT 2
#define T1EMR_EM3_MASK 0x8
#define T1EMR_EM3 0x8
#define T1EMR_EM3_BIT 3
#define T1EMR_EMC0_MASK 0x30
#define T1EMR_EMC0_BIT 4
#define T1EMR_EMC1_MASK 0xC0
#define T1EMR_EMC1_BIT 6
#define T1EMR_EMC2_MASK 0x300
#define T1EMR_EMC2_BIT 8
#define T1EMR_EMC3_MASK 0xC00
#define T1EMR_EMC3_BIT 10

#define T1CTCR (*(volatile unsigned long *)0xE0008070)
#define T1CTCR_OFFSET 0x70
#define T1CTCR_Counter_Timer_Mode_MASK 0x3
#define T1CTCR_Counter_Timer_Mode_BIT 0
#define T1CTCR_Count_Input_Select_MASK 0xC
#define T1CTCR_Count_Input_Select_BIT 2

#define PWM1CON (*(volatile unsigned long *)0xE0008074)
#define PWM1CON_OFFSET 0x74
#define PWM1CON_PWM0_MASK 0x1
#define PWM1CON_PWM0 0x1
#define PWM1CON_PWM0_BIT 0
#define PWM1CON_PWM1_MASK 0x2
#define PWM1CON_PWM1 0x2
#define PWM1CON_PWM1_BIT 1
#define PWM1CON_PWM2_MASK 0x4
#define PWM1CON_PWM2 0x4
#define PWM1CON_PWM2_BIT 2
#define PWM1CON_PWM3_MASK 0x8
#define PWM1CON_PWM3 0x8
#define PWM1CON_PWM3_BIT 3

#define UART0_BASE 0xE000C000

#define U0RBR (*(volatile unsigned char *)0xE000C000)
#define U0RBR_OFFSET 0x0

#define U0THR (*(volatile unsigned char *)0xE000C000)
#define U0THR_OFFSET 0x0

#define U0DLL (*(volatile unsigned char *)0xE000C000)
#define U0DLL_OFFSET 0x0

#define U0DLM (*(volatile unsigned char *)0xE000C004)
#define U0DLM_OFFSET 0x4

#define U0IER (*(volatile unsigned long *)0xE000C004)
#define U0IER_OFFSET 0x4
#define U0IER_RBR_Interrupt_Enable_MASK 0x1
#define U0IER_RBR_Interrupt_Enable 0x1
#define U0IER_RBR_Interrupt_Enable_BIT 0
#define U0IER_THRE_Interrupt_Enable_MASK 0x2
#define U0IER_THRE_Interrupt_Enable 0x2
#define U0IER_THRE_Interrupt_Enable_BIT 1
#define U0IER_Rx_Line_Status_Interrupt_Enable_MASK 0x4
#define U0IER_Rx_Line_Status_Interrupt_Enable 0x4
#define U0IER_Rx_Line_Status_Interrupt_Enable_BIT 2
#define U0IER_ABTOIntEn_MASK 0x100
#define U0IER_ABTOIntEn 0x100
#define U0IER_ABTOIntEn_BIT 8
#define U0IER_ABEOIntEn_MASK 0x200
#define U0IER_ABEOIntEn 0x200
#define U0IER_ABEOIntEn_BIT 9

#define U0IIR (*(volatile unsigned long *)0xE000C008)
#define U0IIR_OFFSET 0x8
#define U0IIR_Interrupt_Pending_MASK 0x1
#define U0IIR_Interrupt_Pending 0x1
#define U0IIR_Interrupt_Pending_BIT 0
#define U0IIR_Interrupt_Identification_MASK 0xE
#define U0IIR_Interrupt_Identification_BIT 1
#define U0IIR_FIFO_Enable_MASK 0xC0
#define U0IIR_FIFO_Enable_BIT 6
#define U0IIR_ABTOInt_MASK 0x100
#define U0IIR_ABTOInt 0x100
#define U0IIR_ABTOInt_BIT 8
#define U0IIR_ABEOInt_MASK 0x200
#define U0IIR_ABEOInt 0x200
#define U0IIR_ABEOInt_BIT 9

#define U0FCR (*(volatile unsigned char *)0xE000C008)
#define U0FCR_OFFSET 0x8
#define U0FCR_FIFO_Enable_MASK 0x1
#define U0FCR_FIFO_Enable 0x1
#define U0FCR_FIFO_Enable_BIT 0
#define U0FCR_Rx_FIFO_Reset_MASK 0x2
#define U0FCR_Rx_FIFO_Reset 0x2
#define U0FCR_Rx_FIFO_Reset_BIT 1
#define U0FCR_Tx_FIFO_Reset_MASK 0x4
#define U0FCR_Tx_FIFO_Reset 0x4
#define U0FCR_Tx_FIFO_Reset_BIT 2
#define U0FCR_Rx_Trigger_Level_Select_MASK 0xC0
#define U0FCR_Rx_Trigger_Level_Select_BIT 6

#define U0LCR (*(volatile unsigned char *)0xE000C00C)
#define U0LCR_OFFSET 0xC
#define U0LCR_Word_Length_Select_MASK 0x3
#define U0LCR_Word_Length_Select_BIT 0
#define U0LCR_Stop_Bit_Select_MASK 0x4
#define U0LCR_Stop_Bit_Select 0x4
#define U0LCR_Stop_Bit_Select_BIT 2
#define U0LCR_Parity_Enable_MASK 0x8
#define U0LCR_Parity_Enable 0x8
#define U0LCR_Parity_Enable_BIT 3
#define U0LCR_Parity_Select_MASK 0x30
#define U0LCR_Parity_Select_BIT 4
#define U0LCR_Break_Control_MASK 0x40
#define U0LCR_Break_Control 0x40
#define U0LCR_Break_Control_BIT 6
#define U0LCR_Divisor_Latch_Access_Bit_MASK 0x80
#define U0LCR_Divisor_Latch_Access_Bit 0x80
#define U0LCR_Divisor_Latch_Access_Bit_BIT 7

#define U0LSR (*(volatile unsigned char *)0xE000C014)
#define U0LSR_OFFSET 0x14
#define U0LSR_RDR_MASK 0x1
#define U0LSR_RDR 0x1
#define U0LSR_RDR_BIT 0
#define U0LSR_OE_MASK 0x2
#define U0LSR_OE 0x2
#define U0LSR_OE_BIT 1
#define U0LSR_PE_MASK 0x4
#define U0LSR_PE 0x4
#define U0LSR_PE_BIT 2
#define U0LSR_FE_MASK 0x8
#define U0LSR_FE 0x8
#define U0LSR_FE_BIT 3
#define U0LSR_BI_MASK 0x10
#define U0LSR_BI 0x10
#define U0LSR_BI_BIT 4
#define U0LSR_THRE_MASK 0x20
#define U0LSR_THRE 0x20
#define U0LSR_THRE_BIT 5
#define U0LSR_TEMT_MASK 0x40
#define U0LSR_TEMT 0x40
#define U0LSR_TEMT_BIT 6
#define U0LSR_RXFE_MASK 0x80
#define U0LSR_RXFE 0x80
#define U0LSR_RXFE_BIT 7

#define U0SCR (*(volatile unsigned char *)0xE000C01C)
#define U0SCR_OFFSET 0x1C

#define U0ACR (*(volatile unsigned long *)0xE000C020)
#define U0ACR_OFFSET 0x20
#define U0ACR_Start_MASK 0x1
#define U0ACR_Start 0x1
#define U0ACR_Start_BIT 0
#define U0ACR_Mode_MASK 0x2
#define U0ACR_Mode 0x2
#define U0ACR_Mode_BIT 1
#define U0ACR_AutoRestart_MASK 0x4
#define U0ACR_AutoRestart 0x4
#define U0ACR_AutoRestart_BIT 2
#define U0ACR_ABEOIntClr_MASK 0x100
#define U0ACR_ABEOIntClr 0x100
#define U0ACR_ABEOIntClr_BIT 8
#define U0ACR_ABTOIntClr_MASK 0x200
#define U0ACR_ABTOIntClr 0x200
#define U0ACR_ABTOIntClr_BIT 9

#define U0FDR (*(volatile unsigned long *)0xE000C028)
#define U0FDR_OFFSET 0x28
#define U0FDR_DIVADDVAL_MASK 0xF
#define U0FDR_DIVADDVAL_BIT 0
#define U0FDR_MULVAL_MASK 0xF0
#define U0FDR_MULVAL_BIT 4

#define U0TER (*(volatile unsigned char *)0xE000C030)
#define U0TER_OFFSET 0x30
#define U0TER_TXEN_MASK 0x80
#define U0TER_TXEN 0x80
#define U0TER_TXEN_BIT 7

#define UART1_BASE 0xE0010000

#define U1RBR (*(volatile unsigned char *)0xE0010000)
#define U1RBR_OFFSET 0x0

#define U1THR (*(volatile unsigned char *)0xE0010000)
#define U1THR_OFFSET 0x0

#define U1DLL (*(volatile unsigned char *)0xE0010000)
#define U1DLL_OFFSET 0x0

#define U1DLM (*(volatile unsigned char *)0xE0010004)
#define U1DLM_OFFSET 0x4

#define U1IER (*(volatile unsigned long *)0xE0010004)
#define U1IER_OFFSET 0x4
#define U1IER_RBR_Interrupt_Enable_MASK 0x1
#define U1IER_RBR_Interrupt_Enable 0x1
#define U1IER_RBR_Interrupt_Enable_BIT 0
#define U1IER_THRE_Interrupt_Enable_MASK 0x2
#define U1IER_THRE_Interrupt_Enable 0x2
#define U1IER_THRE_Interrupt_Enable_BIT 1
#define U1IER_Rx_Line_Status_Interrupt_Enable_MASK 0x4
#define U1IER_Rx_Line_Status_Interrupt_Enable 0x4
#define U1IER_Rx_Line_Status_Interrupt_Enable_BIT 2
#define U1IER_Modem_Status_Interrupt_Enable_MASK 0x8
#define U1IER_Modem_Status_Interrupt_Enable 0x8
#define U1IER_Modem_Status_Interrupt_Enable_BIT 3
#define U1IER_CTS_Interrupt_Enable_MASK 0x80
#define U1IER_CTS_Interrupt_Enable 0x80
#define U1IER_CTS_Interrupt_Enable_BIT 7
#define U1IER_ABTOIntEn_MASK 0x100
#define U1IER_ABTOIntEn 0x100
#define U1IER_ABTOIntEn_BIT 8
#define U1IER_ABEOIntEn_MASK 0x200
#define U1IER_ABEOIntEn 0x200
#define U1IER_ABEOIntEn_BIT 9

#define U1IIR (*(volatile unsigned long *)0xE0010008)
#define U1IIR_OFFSET 0x8
#define U1IIR_Interrupt_Pending_MASK 0x1
#define U1IIR_Interrupt_Pending 0x1
#define U1IIR_Interrupt_Pending_BIT 0
#define U1IIR_Interrupt_Identification_MASK 0xE
#define U1IIR_Interrupt_Identification_BIT 1
#define U1IIR_FIFO_Enable_MASK 0xC0
#define U1IIR_FIFO_Enable_BIT 6
#define U1IIR_ABEOInt_MASK 0x100
#define U1IIR_ABEOInt 0x100
#define U1IIR_ABEOInt_BIT 8
#define U1IIR_ABTOInt_MASK 0x200
#define U1IIR_ABTOInt 0x200
#define U1IIR_ABTOInt_BIT 9

#define U1FCR (*(volatile unsigned char *)0xE0010008)
#define U1FCR_OFFSET 0x8
#define U1FCR_FIFO_Enable_MASK 0x1
#define U1FCR_FIFO_Enable 0x1
#define U1FCR_FIFO_Enable_BIT 0
#define U1FCR_Rx_FIFO_Reset_MASK 0x2
#define U1FCR_Rx_FIFO_Reset 0x2
#define U1FCR_Rx_FIFO_Reset_BIT 1
#define U1FCR_Tx_FIFO_Reset_MASK 0x4
#define U1FCR_Tx_FIFO_Reset 0x4
#define U1FCR_Tx_FIFO_Reset_BIT 2
#define U1FCR_Rx_Trigger_Level_Select_MASK 0xC0
#define U1FCR_Rx_Trigger_Level_Select_BIT 6

#define U1LCR (*(volatile unsigned char *)0xE001000C)
#define U1LCR_OFFSET 0xC
#define U1LCR_Word_Length_Select_MASK 0x3
#define U1LCR_Word_Length_Select_BIT 0
#define U1LCR_Stop_Bit_Select_MASK 0x4
#define U1LCR_Stop_Bit_Select 0x4
#define U1LCR_Stop_Bit_Select_BIT 2
#define U1LCR_Parity_Enable_MASK 0x8
#define U1LCR_Parity_Enable 0x8
#define U1LCR_Parity_Enable_BIT 3
#define U1LCR_Parity_Select_MASK 0x30
#define U1LCR_Parity_Select_BIT 4
#define U1LCR_Break_Control_MASK 0x40
#define U1LCR_Break_Control 0x40
#define U1LCR_Break_Control_BIT 6
#define U1LCR_Divisor_Latch_Access_Bit_MASK 0x80
#define U1LCR_Divisor_Latch_Access_Bit 0x80
#define U1LCR_Divisor_Latch_Access_Bit_BIT 7

#define U1MCR (*(volatile unsigned char *)0xE0010010)
#define U1MCR_OFFSET 0x10
#define U1MCR_DTR_Control_MASK 0x1
#define U1MCR_DTR_Control 0x1
#define U1MCR_DTR_Control_BIT 0
#define U1MCR_RTS_Control_MASK 0x2
#define U1MCR_RTS_Control 0x2
#define U1MCR_RTS_Control_BIT 1
#define U1MCR_Loopback_Mode_Select_MASK 0x10
#define U1MCR_Loopback_Mode_Select 0x10
#define U1MCR_Loopback_Mode_Select_BIT 4
#define U1MCR_RTSen_MASK 0x40
#define U1MCR_RTSen 0x40
#define U1MCR_RTSen_BIT 6
#define U1MCR_CTSen_MASK 0x80
#define U1MCR_CTSen 0x80
#define U1MCR_CTSen_BIT 7

#define U1LSR (*(volatile unsigned char *)0xE0010014)
#define U1LSR_OFFSET 0x14
#define U1LSR_RDR_MASK 0x1
#define U1LSR_RDR 0x1
#define U1LSR_RDR_BIT 0
#define U1LSR_OE_MASK 0x2
#define U1LSR_OE 0x2
#define U1LSR_OE_BIT 1
#define U1LSR_PE_MASK 0x4
#define U1LSR_PE 0x4
#define U1LSR_PE_BIT 2
#define U1LSR_FE_MASK 0x8
#define U1LSR_FE 0x8
#define U1LSR_FE_BIT 3
#define U1LSR_BI_MASK 0x10
#define U1LSR_BI 0x10
#define U1LSR_BI_BIT 4
#define U1LSR_THRE_MASK 0x20
#define U1LSR_THRE 0x20
#define U1LSR_THRE_BIT 5
#define U1LSR_TEMT_MASK 0x40
#define U1LSR_TEMT 0x40
#define U1LSR_TEMT_BIT 6
#define U1LSR_RXFE_MASK 0x80
#define U1LSR_RXFE 0x80
#define U1LSR_RXFE_BIT 7

#define U1MSR (*(volatile unsigned char *)0xE0010018)
#define U1MSR_OFFSET 0x18
#define U1MSR_Delta_CTS_MASK 0x1
#define U1MSR_Delta_CTS 0x1
#define U1MSR_Delta_CTS_BIT 0
#define U1MSR_Delta_DSR_MASK 0x2
#define U1MSR_Delta_DSR 0x2
#define U1MSR_Delta_DSR_BIT 1
#define U1MSR_Trailing_Edge_RI_MASK 0x4
#define U1MSR_Trailing_Edge_RI 0x4
#define U1MSR_Trailing_Edge_RI_BIT 2
#define U1MSR_Delta_DCD_MASK 0x8
#define U1MSR_Delta_DCD 0x8
#define U1MSR_Delta_DCD_BIT 3
#define U1MSR_CTS_MASK 0x10
#define U1MSR_CTS 0x10
#define U1MSR_CTS_BIT 4
#define U1MSR_DSR_MASK 0x20
#define U1MSR_DSR 0x20
#define U1MSR_DSR_BIT 5
#define U1MSR_RI_MASK 0x40
#define U1MSR_RI 0x40
#define U1MSR_RI_BIT 6
#define U1MSR_DCD_MASK 0x80
#define U1MSR_DCD 0x80
#define U1MSR_DCD_BIT 7

#define U1SCR (*(volatile unsigned char *)0xE001001C)
#define U1SCR_OFFSET 0x1C

#define U1ACR (*(volatile unsigned long *)0xE0010020)
#define U1ACR_OFFSET 0x20
#define U1ACR_Start_MASK 0x1
#define U1ACR_Start 0x1
#define U1ACR_Start_BIT 0
#define U1ACR_Mode_MASK 0x2
#define U1ACR_Mode 0x2
#define U1ACR_Mode_BIT 1
#define U1ACR_AutoRestart_MASK 0x4
#define U1ACR_AutoRestart 0x4
#define U1ACR_AutoRestart_BIT 2
#define U1ACR_ABEOIntClr_MASK 0x100
#define U1ACR_ABEOIntClr 0x100
#define U1ACR_ABEOIntClr_BIT 8
#define U1ACR_ABTOIntClr_MASK 0x200
#define U1ACR_ABTOIntClr 0x200
#define U1ACR_ABTOIntClr_BIT 9

#define U1FDR (*(volatile unsigned long *)0xE0010028)
#define U1FDR_OFFSET 0x28
#define U1FDR_DIVADDVAL_MASK 0xF
#define U1FDR_DIVADDVAL_BIT 0
#define U1FDR_MULVAL_MASK 0xF0
#define U1FDR_MULVAL_BIT 4

#define U1TER (*(volatile unsigned char *)0xE0010030)
#define U1TER_OFFSET 0x30
#define U1TER_TXEN_MASK 0x80
#define U1TER_TXEN 0x80
#define U1TER_TXEN_BIT 7

#define I2C0_BASE 0xE001C000

#define I2C0CONSET (*(volatile unsigned char *)0xE001C000)
#define I2C0CONSET_OFFSET 0x0
#define I2C0CONSET_AA_MASK 0x4
#define I2C0CONSET_AA 0x4
#define I2C0CONSET_AA_BIT 2
#define I2C0CONSET_SI_MASK 0x8
#define I2C0CONSET_SI 0x8
#define I2C0CONSET_SI_BIT 3
#define I2C0CONSET_STO_MASK 0x10
#define I2C0CONSET_STO 0x10
#define I2C0CONSET_STO_BIT 4
#define I2C0CONSET_STA_MASK 0x20
#define I2C0CONSET_STA 0x20
#define I2C0CONSET_STA_BIT 5
#define I2C0CONSET_I2EN_MASK 0x40
#define I2C0CONSET_I2EN 0x40
#define I2C0CONSET_I2EN_BIT 6

#define I2C0STAT (*(volatile unsigned char *)0xE001C004)
#define I2C0STAT_OFFSET 0x4
#define I2C0STAT_Status_MASK 0xF8
#define I2C0STAT_Status_BIT 3

#define I2C0DAT (*(volatile unsigned char *)0xE001C008)
#define I2C0DAT_OFFSET 0x8

#define I2C0ADR (*(volatile unsigned char *)0xE001C00C)
#define I2C0ADR_OFFSET 0xC
#define I2C0ADR_GC_MASK 0x1
#define I2C0ADR_GC 0x1
#define I2C0ADR_GC_BIT 0
#define I2C0ADR_Address_MASK 0xFE
#define I2C0ADR_Address_BIT 1

#define I2C0SCLH (*(volatile unsigned short *)0xE001C010)
#define I2C0SCLH_OFFSET 0x10

#define I2C0SCLL (*(volatile unsigned short *)0xE001C014)
#define I2C0SCLL_OFFSET 0x14

#define I2C0CONCLR (*(volatile unsigned char *)0xE001C018)
#define I2C0CONCLR_OFFSET 0x18
#define I2C0CONCLR_AAC_MASK 0x4
#define I2C0CONCLR_AAC 0x4
#define I2C0CONCLR_AAC_BIT 2
#define I2C0CONCLR_SIC_MASK 0x8
#define I2C0CONCLR_SIC 0x8
#define I2C0CONCLR_SIC_BIT 3
#define I2C0CONCLR_STAC_MASK 0x20
#define I2C0CONCLR_STAC 0x20
#define I2C0CONCLR_STAC_BIT 5
#define I2C0CONCLR_I2ENC_MASK 0x40
#define I2C0CONCLR_I2ENC 0x40
#define I2C0CONCLR_I2ENC_BIT 6

#define SPI0_BASE 0xE0020000

#define S0SPCR (*(volatile unsigned short *)0xE0020000)
#define S0SPCR_OFFSET 0x0
#define S0SPCR_BitEnable_MASK 0x4
#define S0SPCR_BitEnable 0x4
#define S0SPCR_BitEnable_BIT 2
#define S0SPCR_CPHA_MASK 0x8
#define S0SPCR_CPHA 0x8
#define S0SPCR_CPHA_BIT 3
#define S0SPCR_CPOL_MASK 0x10
#define S0SPCR_CPOL 0x10
#define S0SPCR_CPOL_BIT 4
#define S0SPCR_MSTR_MASK 0x20
#define S0SPCR_MSTR 0x20
#define S0SPCR_MSTR_BIT 5
#define S0SPCR_LSBF_MASK 0x40
#define S0SPCR_LSBF 0x40
#define S0SPCR_LSBF_BIT 6
#define S0SPCR_SPIE_MASK 0x80
#define S0SPCR_SPIE 0x80
#define S0SPCR_SPIE_BIT 7
#define S0SPCR_BITS_MASK 0xF00
#define S0SPCR_BITS_BIT 8

#define S0SPSR (*(volatile unsigned char *)0xE0020004)
#define S0SPSR_OFFSET 0x4
#define S0SPSR_ABRT_MASK 0x8
#define S0SPSR_ABRT 0x8
#define S0SPSR_ABRT_BIT 3
#define S0SPSR_MODF_MASK 0x10
#define S0SPSR_MODF 0x10
#define S0SPSR_MODF_BIT 4
#define S0SPSR_ROVR_MASK 0x20
#define S0SPSR_ROVR 0x20
#define S0SPSR_ROVR_BIT 5
#define S0SPSR_WCOL_MASK 0x40
#define S0SPSR_WCOL 0x40
#define S0SPSR_WCOL_BIT 6
#define S0SPSR_SPIF_MASK 0x80
#define S0SPSR_SPIF 0x80
#define S0SPSR_SPIF_BIT 7

#define S0SPDR (*(volatile unsigned short *)0xE0020008)
#define S0SPDR_OFFSET 0x8

#define S0SPCCR (*(volatile unsigned char *)0xE002000C)
#define S0SPCCR_OFFSET 0xC

#define S0SPINT (*(volatile unsigned char *)0xE002001C)
#define S0SPINT_OFFSET 0x1C

#define RTC_BASE 0xE0024000

#define ILR (*(volatile unsigned long *)0xE0024000)
#define ILR_OFFSET 0x0
#define ILR_RTCCIF_MASK 0x1
#define ILR_RTCCIF 0x1
#define ILR_RTCCIF_BIT 0
#define ILR_RTCALF_MASK 0x2
#define ILR_RTCALF 0x2
#define ILR_RTCALF_BIT 1

#define CTC (*(volatile unsigned long *)0xE0024004)
#define CTC_OFFSET 0x4
#define CTC_Clock_Tick_Counter_MASK 0xFFFE
#define CTC_Clock_Tick_Counter_BIT 1

#define CCR (*(volatile unsigned long *)0xE0024008)
#define CCR_OFFSET 0x8
#define CCR_CLKEN_MASK 0x1
#define CCR_CLKEN 0x1
#define CCR_CLKEN_BIT 0
#define CCR_CTCRST_MASK 0x2
#define CCR_CTCRST 0x2
#define CCR_CTCRST_BIT 1
#define CCR_CTTEST_MASK 0xC
#define CCR_CTTEST_BIT 2
#define CCR_CLKSRC_MASK 0x10
#define CCR_CLKSRC 0x10
#define CCR_CLKSRC_BIT 4

#define CIIR (*(volatile unsigned long *)0xE002400C)
#define CIIR_OFFSET 0xC
#define CIIR_IMSEC_MASK 0x1
#define CIIR_IMSEC 0x1
#define CIIR_IMSEC_BIT 0
#define CIIR_IMMIN_MASK 0x2
#define CIIR_IMMIN 0x2
#define CIIR_IMMIN_BIT 1
#define CIIR_IMHOUR_MASK 0x4
#define CIIR_IMHOUR 0x4
#define CIIR_IMHOUR_BIT 2
#define CIIR_IMDOM_MASK 0x8
#define CIIR_IMDOM 0x8
#define CIIR_IMDOM_BIT 3
#define CIIR_IMDOW_MASK 0x10
#define CIIR_IMDOW 0x10
#define CIIR_IMDOW_BIT 4
#define CIIR_IMDOY_MASK 0x20
#define CIIR_IMDOY 0x20
#define CIIR_IMDOY_BIT 5
#define CIIR_IMMON_MASK 0x40
#define CIIR_IMMON 0x40
#define CIIR_IMMON_BIT 6
#define CIIR_IMYEAR_MASK 0x80
#define CIIR_IMYEAR 0x80
#define CIIR_IMYEAR_BIT 7

#define AMR (*(volatile unsigned long *)0xE0024010)
#define AMR_OFFSET 0x10
#define AMR_AMRSEC_MASK 0x1
#define AMR_AMRSEC 0x1
#define AMR_AMRSEC_BIT 0
#define AMR_AMRMIN_MASK 0x2
#define AMR_AMRMIN 0x2
#define AMR_AMRMIN_BIT 1
#define AMR_AMRHOUR_MASK 0x4
#define AMR_AMRHOUR 0x4
#define AMR_AMRHOUR_BIT 2
#define AMR_AMRDOM_MASK 0x8
#define AMR_AMRDOM 0x8
#define AMR_AMRDOM_BIT 3
#define AMR_AMRDOW_MASK 0x10
#define AMR_AMRDOW 0x10
#define AMR_AMRDOW_BIT 4
#define AMR_AMRDOY_MASK 0x20
#define AMR_AMRDOY 0x20
#define AMR_AMRDOY_BIT 5
#define AMR_AMRMON_MASK 0x40
#define AMR_AMRMON 0x40
#define AMR_AMRMON_BIT 6
#define AMR_AMRYEAR_MASK 0x80
#define AMR_AMRYEAR 0x80
#define AMR_AMRYEAR_BIT 7

#define CTIME0 (*(volatile unsigned long *)0xE0024014)
#define CTIME0_OFFSET 0x14
#define CTIME0_Seconds_MASK 0x3F
#define CTIME0_Seconds_BIT 0
#define CTIME0_Minutes_MASK 0x3F00
#define CTIME0_Minutes_BIT 8
#define CTIME0_Hours_MASK 0x1F0000
#define CTIME0_Hours_BIT 16
#define CTIME0_Day_of_Week_MASK 0x7000000
#define CTIME0_Day_of_Week_BIT 24

#define CTIME1 (*(volatile unsigned long *)0xE0024018)
#define CTIME1_OFFSET 0x18
#define CTIME1_Day_of_Month_MASK 0x1F
#define CTIME1_Day_of_Month_BIT 0
#define CTIME1_Month_MASK 0xF00
#define CTIME1_Month_BIT 8
#define CTIME1_Year_MASK 0xFFF0000
#define CTIME1_Year_BIT 16

#define CTIME2 (*(volatile unsigned long *)0xE002401C)
#define CTIME2_OFFSET 0x1C
#define CTIME2_Day_of_Year_MASK 0xFFF
#define CTIME2_Day_of_Year_BIT 0

#define SEC (*(volatile unsigned long *)0xE0024020)
#define SEC_OFFSET 0x20

#define MIN (*(volatile unsigned long *)0xE0024024)
#define MIN_OFFSET 0x24

#define HOUR (*(volatile unsigned long *)0xE0024028)
#define HOUR_OFFSET 0x28

#define DOM (*(volatile unsigned long *)0xE002402C)
#define DOM_OFFSET 0x2C

#define DOW (*(volatile unsigned long *)0xE0024030)
#define DOW_OFFSET 0x30

#define DOY (*(volatile unsigned long *)0xE0024034)
#define DOY_OFFSET 0x34

#define MONTH (*(volatile unsigned long *)0xE0024038)
#define MONTH_OFFSET 0x38

#define YEAR (*(volatile unsigned long *)0xE002403C)
#define YEAR_OFFSET 0x3C

#define ALSEC (*(volatile unsigned long *)0xE0024060)
#define ALSEC_OFFSET 0x60

#define ALMIN (*(volatile unsigned long *)0xE0024064)
#define ALMIN_OFFSET 0x64

#define ALHOUR (*(volatile unsigned long *)0xE0024068)
#define ALHOUR_OFFSET 0x68

#define ALDOM (*(volatile unsigned long *)0xE002406C)
#define ALDOM_OFFSET 0x6C

#define ALDOW (*(volatile unsigned long *)0xE0024070)
#define ALDOW_OFFSET 0x70

#define ALDOY (*(volatile unsigned long *)0xE0024074)
#define ALDOY_OFFSET 0x74

#define ALMON (*(volatile unsigned long *)0xE0024078)
#define ALMON_OFFSET 0x78

#define ALYEAR (*(volatile unsigned long *)0xE002407C)
#define ALYEAR_OFFSET 0x7C

#define PREINT (*(volatile unsigned long *)0xE0024080)
#define PREINT_OFFSET 0x80

#define PREFRAC (*(volatile unsigned long *)0xE0024084)
#define PREFRAC_OFFSET 0x84

#define GPIO_BASE 0xE0028000

#define IO0PIN (*(volatile unsigned long *)0xE0028000)
#define IO0PIN_OFFSET 0x0

#define IO0SET (*(volatile unsigned long *)0xE0028004)
#define IO0SET_OFFSET 0x4

#define IO0DIR (*(volatile unsigned long *)0xE0028008)
#define IO0DIR_OFFSET 0x8

#define IO0CLR (*(volatile unsigned long *)0xE002800C)
#define IO0CLR_OFFSET 0xC

#define PCB_BASE 0xE002C000

#define PINSEL0 (*(volatile unsigned long *)0xE002C000)
#define PINSEL0_OFFSET 0x0
#define PINSEL0_P0_0_MASK 0x3
#define PINSEL0_P0_0_BIT 0
#define PINSEL0_P0_1_MASK 0xC
#define PINSEL0_P0_1_BIT 2
#define PINSEL0_P0_2_MASK 0x30
#define PINSEL0_P0_2_BIT 4
#define PINSEL0_P0_3_MASK 0xC0
#define PINSEL0_P0_3_BIT 6
#define PINSEL0_P0_4_MASK 0x300
#define PINSEL0_P0_4_BIT 8
#define PINSEL0_P0_5_MASK 0xC00
#define PINSEL0_P0_5_BIT 10
#define PINSEL0_P0_6_MASK 0x3000
#define PINSEL0_P0_6_BIT 12
#define PINSEL0_P0_7_MASK 0xC000
#define PINSEL0_P0_7_BIT 14
#define PINSEL0_P0_8_MASK 0x30000
#define PINSEL0_P0_8_BIT 16
#define PINSEL0_P0_9_MASK 0xC0000
#define PINSEL0_P0_9_BIT 18
#define PINSEL0_P0_10_MASK 0x300000
#define PINSEL0_P0_10_BIT 20
#define PINSEL0_P0_11_MASK 0xC00000
#define PINSEL0_P0_11_BIT 22
#define PINSEL0_P0_12_MASK 0x3000000
#define PINSEL0_P0_12_BIT 24
#define PINSEL0_P0_13_MASK 0xC000000
#define PINSEL0_P0_13_BIT 26
#define PINSEL0_P0_14_MASK 0x30000000
#define PINSEL0_P0_14_BIT 28
#define PINSEL0_P0_15_MASK 0xC0000000
#define PINSEL0_P0_15_BIT 30

#define PINSEL1 (*(volatile unsigned long *)0xE002C004)
#define PINSEL1_OFFSET 0x4
#define PINSEL1_P0_16_MASK 0x3
#define PINSEL1_P0_16_BIT 0
#define PINSEL1_P0_17_MASK 0xC
#define PINSEL1_P0_17_BIT 2
#define PINSEL1_P0_18_MASK 0x30
#define PINSEL1_P0_18_BIT 4
#define PINSEL1_P0_19_MASK 0xC0
#define PINSEL1_P0_19_BIT 6
#define PINSEL1_P0_20_MASK 0x300
#define PINSEL1_P0_20_BIT 8
#define PINSEL1_P0_21_MASK 0xC00
#define PINSEL1_P0_21_BIT 10
#define PINSEL1_P0_22_MASK 0x3000
#define PINSEL1_P0_22_BIT 12
#define PINSEL1_P0_23_MASK 0xC000
#define PINSEL1_P0_23_BIT 14
#define PINSEL1_P0_24_MASK 0x30000
#define PINSEL1_P0_24_BIT 16
#define PINSEL1_P0_25_MASK 0xC0000
#define PINSEL1_P0_25_BIT 18
#define PINSEL1_P0_26_MASK 0x300000
#define PINSEL1_P0_26_BIT 20
#define PINSEL1_P0_27_MASK 0xC00000
#define PINSEL1_P0_27_BIT 22
#define PINSEL1_P0_28_MASK 0x3000000
#define PINSEL1_P0_28_BIT 24
#define PINSEL1_P0_29_MASK 0xC000000
#define PINSEL1_P0_29_BIT 26
#define PINSEL1_P0_30_MASK 0x30000000
#define PINSEL1_P0_30_BIT 28
#define PINSEL1_P0_31_MASK 0xC0000000
#define PINSEL1_P0_31_BIT 30

#define AD0_BASE 0xE0034000

#define AD0CR (*(volatile unsigned *)0xE0034000)
#define AD0CR_OFFSET 0x0
#define AD0CR_SEL_MASK 0xFF
#define AD0CR_SEL_BIT 0
#define AD0CR_CLKDIV_MASK 0xFF00
#define AD0CR_CLKDIV_BIT 8
#define AD0CR_BURST_MASK 0x10000
#define AD0CR_BURST 0x10000
#define AD0CR_BURST_BIT 16
#define AD0CR_CLKS_MASK 0xE0000
#define AD0CR_CLKS_BIT 17
#define AD0CR_PDN_MASK 0x200000
#define AD0CR_PDN 0x200000
#define AD0CR_PDN_BIT 21
#define AD0CR_START_MASK 0x7000000
#define AD0CR_START_BIT 24
#define AD0CR_EDGE_MASK 0x8000000
#define AD0CR_EDGE 0x8000000
#define AD0CR_EDGE_BIT 27

#define AD0GDR (*(volatile unsigned *)0xE0034004)
#define AD0GDR_OFFSET 0x4
#define AD0GDR_RESULT_MASK 0xFFC0
#define AD0GDR_RESULT_BIT 6
#define AD0GDR_CHN_MASK 0x7000000
#define AD0GDR_CHN_BIT 24
#define AD0GDR_OVERUN_MASK 0x40000000
#define AD0GDR_OVERUN 0x40000000
#define AD0GDR_OVERUN_BIT 30
#define AD0GDR_DONE_MASK 0x80000000
#define AD0GDR_DONE 0x80000000
#define AD0GDR_DONE_BIT 31

#define AD0INTEN (*(volatile unsigned *)0xE003400C)
#define AD0INTEN_OFFSET 0xC
#define AD0INTEN_ADINTEN0_MASK 0x1
#define AD0INTEN_ADINTEN0 0x1
#define AD0INTEN_ADINTEN0_BIT 0
#define AD0INTEN_ADINTEN1_MASK 0x2
#define AD0INTEN_ADINTEN1 0x2
#define AD0INTEN_ADINTEN1_BIT 1
#define AD0INTEN_ADINTEN2_MASK 0x4
#define AD0INTEN_ADINTEN2 0x4
#define AD0INTEN_ADINTEN2_BIT 2
#define AD0INTEN_ADINTEN3_MASK 0x8
#define AD0INTEN_ADINTEN3 0x8
#define AD0INTEN_ADINTEN3_BIT 3
#define AD0INTEN_ADINTEN4_MASK 0x10
#define AD0INTEN_ADINTEN4 0x10
#define AD0INTEN_ADINTEN4_BIT 4
#define AD0INTEN_ADINTEN5_MASK 0x20
#define AD0INTEN_ADINTEN5 0x20
#define AD0INTEN_ADINTEN5_BIT 5
#define AD0INTEN_ADINTEN6_MASK 0x40
#define AD0INTEN_ADINTEN6 0x40
#define AD0INTEN_ADINTEN6_BIT 6
#define AD0INTEN_ADINTEN7_MASK 0x80
#define AD0INTEN_ADINTEN7 0x80
#define AD0INTEN_ADINTEN7_BIT 7
#define AD0INTEN_ADGINTEN_MASK 0x100
#define AD0INTEN_ADGINTEN 0x100
#define AD0INTEN_ADGINTEN_BIT 8

#define AD0DR0 (*(volatile unsigned *)0xE0034010)
#define AD0DR0_OFFSET 0x10
#define AD0DR0_RESULT_MASK 0xFFC0
#define AD0DR0_RESULT_BIT 6
#define AD0DR0_OVERRUN_MASK 0x40000000
#define AD0DR0_OVERRUN 0x40000000
#define AD0DR0_OVERRUN_BIT 30
#define AD0DR0_DONE_MASK 0x80000000
#define AD0DR0_DONE 0x80000000
#define AD0DR0_DONE_BIT 31

#define AD0DR1 (*(volatile unsigned *)0xE0034014)
#define AD0DR1_OFFSET 0x14
#define AD0DR1_RESULT_MASK 0xFFC0
#define AD0DR1_RESULT_BIT 6
#define AD0DR1_OVERRUN_MASK 0x40000000
#define AD0DR1_OVERRUN 0x40000000
#define AD0DR1_OVERRUN_BIT 30
#define AD0DR1_DONE_MASK 0x80000000
#define AD0DR1_DONE 0x80000000
#define AD0DR1_DONE_BIT 31

#define AD0DR2 (*(volatile unsigned *)0xE0034018)
#define AD0DR2_OFFSET 0x18
#define AD0DR2_RESULT_MASK 0xFFC0
#define AD0DR2_RESULT_BIT 6
#define AD0DR2_OVERRUN_MASK 0x40000000
#define AD0DR2_OVERRUN 0x40000000
#define AD0DR2_OVERRUN_BIT 30
#define AD0DR2_DONE_MASK 0x80000000
#define AD0DR2_DONE 0x80000000
#define AD0DR2_DONE_BIT 31

#define AD0DR3 (*(volatile unsigned *)0xE003401C)
#define AD0DR3_OFFSET 0x1C
#define AD0DR3_RESULT_MASK 0xFFC0
#define AD0DR3_RESULT_BIT 6
#define AD0DR3_OVERRUN_MASK 0x40000000
#define AD0DR3_OVERRUN 0x40000000
#define AD0DR3_OVERRUN_BIT 30
#define AD0DR3_DONE_MASK 0x80000000
#define AD0DR3_DONE 0x80000000
#define AD0DR3_DONE_BIT 31

#define AD0DR4 (*(volatile unsigned *)0xE0034020)
#define AD0DR4_OFFSET 0x20
#define AD0DR4_RESULT_MASK 0xFFC0
#define AD0DR4_RESULT_BIT 6
#define AD0DR4_OVERRUN_MASK 0x40000000
#define AD0DR4_OVERRUN 0x40000000
#define AD0DR4_OVERRUN_BIT 30
#define AD0DR4_DONE_MASK 0x80000000
#define AD0DR4_DONE 0x80000000
#define AD0DR4_DONE_BIT 31

#define AD0DR5 (*(volatile unsigned *)0xE0034024)
#define AD0DR5_OFFSET 0x24
#define AD0DR5_RESULT_MASK 0xFFC0
#define AD0DR5_RESULT_BIT 6
#define AD0DR5_OVERRUN_MASK 0x40000000
#define AD0DR5_OVERRUN 0x40000000
#define AD0DR5_OVERRUN_BIT 30
#define AD0DR5_DONE_MASK 0x80000000
#define AD0DR5_DONE 0x80000000
#define AD0DR5_DONE_BIT 31

#define AD0DR6 (*(volatile unsigned *)0xE0034028)
#define AD0DR6_OFFSET 0x28
#define AD0DR6_RESULT_MASK 0xFFC0
#define AD0DR6_RESULT_BIT 6
#define AD0DR6_OVERRUN_MASK 0x40000000
#define AD0DR6_OVERRUN 0x40000000
#define AD0DR6_OVERRUN_BIT 30
#define AD0DR6_DONE_MASK 0x80000000
#define AD0DR6_DONE 0x80000000
#define AD0DR6_DONE_BIT 31

#define AD0DR7 (*(volatile unsigned *)0xE003402C)
#define AD0DR7_OFFSET 0x2C
#define AD0DR7_RESULT_MASK 0xFFC0
#define AD0DR7_RESULT_BIT 6
#define AD0DR7_OVERRUN_MASK 0x40000000
#define AD0DR7_OVERRUN 0x40000000
#define AD0DR7_OVERRUN_BIT 30
#define AD0DR7_DONE_MASK 0x80000000
#define AD0DR7_DONE 0x80000000
#define AD0DR7_DONE_BIT 31

#define AD0STAT (*(volatile unsigned *)0xE0034030)
#define AD0STAT_OFFSET 0x30
#define AD0STAT_DONE0_MASK 0x1
#define AD0STAT_DONE0 0x1
#define AD0STAT_DONE0_BIT 0
#define AD0STAT_DONE1_MASK 0x2
#define AD0STAT_DONE1 0x2
#define AD0STAT_DONE1_BIT 1
#define AD0STAT_DONE2_MASK 0x4
#define AD0STAT_DONE2 0x4
#define AD0STAT_DONE2_BIT 2
#define AD0STAT_DONE3_MASK 0x8
#define AD0STAT_DONE3 0x8
#define AD0STAT_DONE3_BIT 3
#define AD0STAT_DONE4_MASK 0x10
#define AD0STAT_DONE4 0x10
#define AD0STAT_DONE4_BIT 4
#define AD0STAT_DONE5_MASK 0x20
#define AD0STAT_DONE5 0x20
#define AD0STAT_DONE5_BIT 5
#define AD0STAT_DONE6_MASK 0x40
#define AD0STAT_DONE6 0x40
#define AD0STAT_DONE6_BIT 6
#define AD0STAT_DONE7_MASK 0x80
#define AD0STAT_DONE7 0x80
#define AD0STAT_DONE7_BIT 7
#define AD0STAT_OVERRUN0_MASK 0x100
#define AD0STAT_OVERRUN0 0x100
#define AD0STAT_OVERRUN0_BIT 8
#define AD0STAT_OVERRUN1_MASK 0x200
#define AD0STAT_OVERRUN1 0x200
#define AD0STAT_OVERRUN1_BIT 9
#define AD0STAT_OVERRUN2_MASK 0x400
#define AD0STAT_OVERRUN2 0x400
#define AD0STAT_OVERRUN2_BIT 10
#define AD0STAT_OVERRUN3_MASK 0x800
#define AD0STAT_OVERRUN3 0x800
#define AD0STAT_OVERRUN3_BIT 11
#define AD0STAT_OVERRUN4_MASK 0x1000
#define AD0STAT_OVERRUN4 0x1000
#define AD0STAT_OVERRUN4_BIT 12
#define AD0STAT_OVERRUN5_MASK 0x2000
#define AD0STAT_OVERRUN5 0x2000
#define AD0STAT_OVERRUN5_BIT 13
#define AD0STAT_OVERRUN6_MASK 0x4000
#define AD0STAT_OVERRUN6 0x4000
#define AD0STAT_OVERRUN6_BIT 14
#define AD0STAT_OVERRUN7_MASK 0x8000
#define AD0STAT_OVERRUN7 0x8000
#define AD0STAT_OVERRUN7_BIT 15
#define AD0STAT_ADINT_MASK 0x10000
#define AD0STAT_ADINT 0x10000
#define AD0STAT_ADINT_BIT 16

#define I2C1_BASE 0xE005C000

#define I2C1CONSET (*(volatile unsigned char *)0xE005C000)
#define I2C1CONSET_OFFSET 0x0
#define I2C1CONSET_AA_MASK 0x4
#define I2C1CONSET_AA 0x4
#define I2C1CONSET_AA_BIT 2
#define I2C1CONSET_SI_MASK 0x8
#define I2C1CONSET_SI 0x8
#define I2C1CONSET_SI_BIT 3
#define I2C1CONSET_STO_MASK 0x10
#define I2C1CONSET_STO 0x10
#define I2C1CONSET_STO_BIT 4
#define I2C1CONSET_STA_MASK 0x20
#define I2C1CONSET_STA 0x20
#define I2C1CONSET_STA_BIT 5
#define I2C1CONSET_I2EN_MASK 0x40
#define I2C1CONSET_I2EN 0x40
#define I2C1CONSET_I2EN_BIT 6

#define I2C1STAT (*(volatile unsigned char *)0xE005C004)
#define I2C1STAT_OFFSET 0x4
#define I2C1STAT_Status_MASK 0xF8
#define I2C1STAT_Status_BIT 3

#define I2C1DAT (*(volatile unsigned char *)0xE005C008)
#define I2C1DAT_OFFSET 0x8

#define I2C1ADR (*(volatile unsigned char *)0xE005C00C)
#define I2C1ADR_OFFSET 0xC
#define I2C1ADR_GC_MASK 0x1
#define I2C1ADR_GC 0x1
#define I2C1ADR_GC_BIT 0
#define I2C1ADR_Address_MASK 0xFE
#define I2C1ADR_Address_BIT 1

#define I2C1SCLH (*(volatile unsigned short *)0xE005C010)
#define I2C1SCLH_OFFSET 0x10

#define I2C1SCLL (*(volatile unsigned short *)0xE005C014)
#define I2C1SCLL_OFFSET 0x14

#define I2C1CONCLR (*(volatile unsigned char *)0xE005C018)
#define I2C1CONCLR_OFFSET 0x18
#define I2C1CONCLR_AAC_MASK 0x4
#define I2C1CONCLR_AAC 0x4
#define I2C1CONCLR_AAC_BIT 2
#define I2C1CONCLR_SIC_MASK 0x8
#define I2C1CONCLR_SIC 0x8
#define I2C1CONCLR_SIC_BIT 3
#define I2C1CONCLR_STAC_MASK 0x20
#define I2C1CONCLR_STAC 0x20
#define I2C1CONCLR_STAC_BIT 5
#define I2C1CONCLR_I2ENC_MASK 0x40
#define I2C1CONCLR_I2ENC 0x40
#define I2C1CONCLR_I2ENC_BIT 6

#define SSP_BASE 0xE0068000

#define SSPCR0 (*(volatile unsigned long *)0xE0068000)
#define SSPCR0_OFFSET 0x0
#define SSPCR0_SCR_MASK 0xFF00
#define SSPCR0_SCR_BIT 8
#define SSPCR0_CPHA_MASK 0x80
#define SSPCR0_CPHA 0x80
#define SSPCR0_CPHA_BIT 7
#define SSPCR0_CPOL_MASK 0x40
#define SSPCR0_CPOL 0x40
#define SSPCR0_CPOL_BIT 6
#define SSPCR0_FRF_MASK 0x30
#define SSPCR0_FRF_BIT 4
#define SSPCR0_DSS_MASK 0xF
#define SSPCR0_DSS_BIT 0

#define SSPCR1 (*(volatile unsigned long *)0xE0068004)
#define SSPCR1_OFFSET 0x4
#define SSPCR1_SOD_MASK 0x8
#define SSPCR1_SOD 0x8
#define SSPCR1_SOD_BIT 3
#define SSPCR1_MS_MASK 0x4
#define SSPCR1_MS 0x4
#define SSPCR1_MS_BIT 2
#define SSPCR1_SSE_MASK 0x2
#define SSPCR1_SSE 0x2
#define SSPCR1_SSE_BIT 1
#define SSPCR1_LBM_MASK 0x1
#define SSPCR1_LBM 0x1
#define SSPCR1_LBM_BIT 0

#define SSPDR (*(volatile unsigned long *)0xE0068008)
#define SSPDR_OFFSET 0x8

#define SSPSR (*(volatile unsigned long *)0xE006800C)
#define SSPSR_OFFSET 0xC
#define SSPSR_BSY_MASK 0x10
#define SSPSR_BSY 0x10
#define SSPSR_BSY_BIT 4
#define SSPSR_RFF_MASK 0x8
#define SSPSR_RFF 0x8
#define SSPSR_RFF_BIT 3
#define SSPSR_RNE_MASK 0x4
#define SSPSR_RNE 0x4
#define SSPSR_RNE_BIT 2
#define SSPSR_TNF_MASK 0x2
#define SSPSR_TNF 0x2
#define SSPSR_TNF_BIT 1
#define SSPSR_TFE_MASK 0x1
#define SSPSR_TFE 0x1
#define SSPSR_TFE_BIT 0

#define SSPCPSR (*(volatile unsigned long *)0xE0068010)
#define SSPCPSR_OFFSET 0x10
#define SSPCPSR_CPSDVSR_MASK 0xFF
#define SSPCPSR_CPSDVSR_BIT 0

#define SSPIMSC (*(volatile unsigned long *)0xE0068014)
#define SSPIMSC_OFFSET 0x14
#define SSPIMSC_TXIM_MASK 0x8
#define SSPIMSC_TXIM 0x8
#define SSPIMSC_TXIM_BIT 3
#define SSPIMSC_RXIM_MASK 0x4
#define SSPIMSC_RXIM 0x4
#define SSPIMSC_RXIM_BIT 2
#define SSPIMSC_RTIM_MASK 0x2
#define SSPIMSC_RTIM 0x2
#define SSPIMSC_RTIM_BIT 1
#define SSPIMSC_RORIM_MASK 0x1
#define SSPIMSC_RORIM 0x1
#define SSPIMSC_RORIM_BIT 0

#define SSPRIS (*(volatile unsigned long *)0xE0068018)
#define SSPRIS_OFFSET 0x18
#define SSPRIS_TXRIS_MASK 0x8
#define SSPRIS_TXRIS 0x8
#define SSPRIS_TXRIS_BIT 3
#define SSPRIS_RXRIS_MASK 0x4
#define SSPRIS_RXRIS 0x4
#define SSPRIS_RXRIS_BIT 2
#define SSPRIS_RTRIS_MASK 0x2
#define SSPRIS_RTRIS 0x2
#define SSPRIS_RTRIS_BIT 1
#define SSPRIS_RORRIS_MASK 0x1
#define SSPRIS_RORRIS 0x1
#define SSPRIS_RORRIS_BIT 0

#define SSPMIS (*(volatile unsigned long *)0xE006801C)
#define SSPMIS_OFFSET 0x1C
#define SSPMIS_TXMIS_MASK 0x8
#define SSPMIS_TXMIS 0x8
#define SSPMIS_TXMIS_BIT 3
#define SSPMIS_RXMIS_MASK 0x4
#define SSPMIS_RXMIS 0x4
#define SSPMIS_RXMIS_BIT 2
#define SSPMIS_RTMIS_MASK 0x2
#define SSPMIS_RTMIS 0x2
#define SSPMIS_RTMIS_BIT 1
#define SSPMIS_RORMIS_MASK 0x1
#define SSPMIS_RORMIS 0x1
#define SSPMIS_RORMIS_BIT 0

#define SSPICR (*(volatile unsigned long *)0xE0068020)
#define SSPICR_OFFSET 0x20
#define SSPICR_RTIC_MASK 0x2
#define SSPICR_RTIC 0x2
#define SSPICR_RTIC_BIT 1
#define SSPICR_RORIC_MASK 0x1
#define SSPICR_RORIC 0x1
#define SSPICR_RORIC_BIT 0

#define TIMER2_BASE 0xE0070000

#define T2IR (*(volatile unsigned char *)0xE0070000)
#define T2IR_OFFSET 0x0
#define T2IR_MR0_MASK 0x1
#define T2IR_MR0 0x1
#define T2IR_MR0_BIT 0
#define T2IR_MR1_MASK 0x2
#define T2IR_MR1 0x2
#define T2IR_MR1_BIT 1
#define T2IR_MR2_MASK 0x4
#define T2IR_MR2 0x4
#define T2IR_MR2_BIT 2
#define T2IR_MR3_MASK 0x8
#define T2IR_MR3 0x8
#define T2IR_MR3_BIT 3
#define T2IR_CR0_MASK 0x10
#define T2IR_CR0 0x10
#define T2IR_CR0_BIT 4
#define T2IR_CR1_MASK 0x20
#define T2IR_CR1 0x20
#define T2IR_CR1_BIT 5
#define T2IR_CR2_MASK 0x40
#define T2IR_CR2 0x40
#define T2IR_CR2_BIT 6
#define T2IR_CR3_MASK 0x80
#define T2IR_CR3 0x80
#define T2IR_CR3_BIT 7

#define T2TCR (*(volatile unsigned char *)0xE0070004)
#define T2TCR_OFFSET 0x4
#define T2TCR_Counter_Enable_MASK 0x1
#define T2TCR_Counter_Enable 0x1
#define T2TCR_Counter_Enable_BIT 0
#define T2TCR_Counter_Reset_MASK 0x2
#define T2TCR_Counter_Reset 0x2
#define T2TCR_Counter_Reset_BIT 1

#define T2TC (*(volatile unsigned short *)0xE0070008)
#define T2TC_OFFSET 0x8

#define T2PR (*(volatile unsigned short *)0xE007000C)
#define T2PR_OFFSET 0xC

#define T2PC (*(volatile unsigned short *)0xE0070010)
#define T2PC_OFFSET 0x10

#define T2MCR (*(volatile unsigned short *)0xE0070014)
#define T2MCR_OFFSET 0x14
#define T2MCR_MR0I_MASK 0x1
#define T2MCR_MR0I 0x1
#define T2MCR_MR0I_BIT 0
#define T2MCR_MR0R_MASK 0x2
#define T2MCR_MR0R 0x2
#define T2MCR_MR0R_BIT 1
#define T2MCR_MR0S_MASK 0x4
#define T2MCR_MR0S 0x4
#define T2MCR_MR0S_BIT 2
#define T2MCR_MR1I_MASK 0x8
#define T2MCR_MR1I 0x8
#define T2MCR_MR1I_BIT 3
#define T2MCR_MR1R_MASK 0x10
#define T2MCR_MR1R 0x10
#define T2MCR_MR1R_BIT 4
#define T2MCR_MR1S_MASK 0x20
#define T2MCR_MR1S 0x20
#define T2MCR_MR1S_BIT 5
#define T2MCR_MR2I_MASK 0x40
#define T2MCR_MR2I 0x40
#define T2MCR_MR2I_BIT 6
#define T2MCR_MR2R_MASK 0x80
#define T2MCR_MR2R 0x80
#define T2MCR_MR2R_BIT 7
#define T2MCR_MR2S_MASK 0x100
#define T2MCR_MR2S 0x100
#define T2MCR_MR2S_BIT 8
#define T2MCR_MR3I_MASK 0x200
#define T2MCR_MR3I 0x200
#define T2MCR_MR3I_BIT 9
#define T2MCR_MR3R_MASK 0x400
#define T2MCR_MR3R 0x400
#define T2MCR_MR3R_BIT 10
#define T2MCR_MR3S_MASK 0x800
#define T2MCR_MR3S 0x800
#define T2MCR_MR3S_BIT 11

#define T2MR0 (*(volatile unsigned short *)0xE0070018)
#define T2MR0_OFFSET 0x18

#define T2MR1 (*(volatile unsigned short *)0xE007001C)
#define T2MR1_OFFSET 0x1C

#define T2MR2 (*(volatile unsigned short *)0xE0070020)
#define T2MR2_OFFSET 0x20

#define T2MR3 (*(volatile unsigned short *)0xE0070024)
#define T2MR3_OFFSET 0x24

#define T2CCR (*(volatile unsigned short *)0xE0070028)
#define T2CCR_OFFSET 0x28
#define T2CCR_CAP0RE_MASK 0x1
#define T2CCR_CAP0RE 0x1
#define T2CCR_CAP0RE_BIT 0
#define T2CCR_CAP0FE_MASK 0x2
#define T2CCR_CAP0FE 0x2
#define T2CCR_CAP0FE_BIT 1
#define T2CCR_CAP0I_MASK 0x4
#define T2CCR_CAP0I 0x4
#define T2CCR_CAP0I_BIT 2
#define T2CCR_CAP1RE_MASK 0x8
#define T2CCR_CAP1RE 0x8
#define T2CCR_CAP1RE_BIT 3
#define T2CCR_CAP1FE_MASK 0x10
#define T2CCR_CAP1FE 0x10
#define T2CCR_CAP1FE_BIT 4
#define T2CCR_CAP1I_MASK 0x20
#define T2CCR_CAP1I 0x20
#define T2CCR_CAP1I_BIT 5
#define T2CCR_CAP2RE_MASK 0x40
#define T2CCR_CAP2RE 0x40
#define T2CCR_CAP2RE_BIT 6
#define T2CCR_CAP2FE_MASK 0x80
#define T2CCR_CAP2FE 0x80
#define T2CCR_CAP2FE_BIT 7
#define T2CCR_CAP2I_MASK 0x100
#define T2CCR_CAP2I 0x100
#define T2CCR_CAP2I_BIT 8
#define T2CCR_CAP3RE_MASK 0x200
#define T2CCR_CAP3RE 0x200
#define T2CCR_CAP3RE_BIT 9
#define T2CCR_CAP3FE_MASK 0x400
#define T2CCR_CAP3FE 0x400
#define T2CCR_CAP3FE_BIT 10
#define T2CCR_CAP3I_MASK 0x800
#define T2CCR_CAP3I 0x800
#define T2CCR_CAP3I_BIT 11

#define T2CR0 (*(volatile unsigned short *)0xE007002C)
#define T2CR0_OFFSET 0x2C

#define T2CR1 (*(volatile unsigned short *)0xE0070030)
#define T2CR1_OFFSET 0x30

#define T2CR2 (*(volatile unsigned short *)0xE0070034)
#define T2CR2_OFFSET 0x34

#define T2CR3 (*(volatile unsigned short *)0xE0070038)
#define T2CR3_OFFSET 0x38

#define T2EMR (*(volatile unsigned short *)0xE007003C)
#define T2EMR_OFFSET 0x3C
#define T2EMR_EM0_MASK 0x1
#define T2EMR_EM0 0x1
#define T2EMR_EM0_BIT 0
#define T2EMR_EM1_MASK 0x2
#define T2EMR_EM1 0x2
#define T2EMR_EM1_BIT 1
#define T2EMR_EM2_MASK 0x4
#define T2EMR_EM2 0x4
#define T2EMR_EM2_BIT 2
#define T2EMR_EM3_MASK 0x8
#define T2EMR_EM3 0x8
#define T2EMR_EM3_BIT 3
#define T2EMR_EMC0_MASK 0x30
#define T2EMR_EMC0_BIT 4
#define T2EMR_EMC1_MASK 0xC0
#define T2EMR_EMC1_BIT 6
#define T2EMR_EMC2_MASK 0x300
#define T2EMR_EMC2_BIT 8
#define T2EMR_EMC3_MASK 0xC00
#define T2EMR_EMC3_BIT 10

#define T2CTCR (*(volatile unsigned long *)0xE0070070)
#define T2CTCR_OFFSET 0x70
#define T2CTCR_Counter_Timer_Mode_MASK 0x3
#define T2CTCR_Counter_Timer_Mode_BIT 0
#define T2CTCR_Count_Input_Select_MASK 0xC
#define T2CTCR_Count_Input_Select_BIT 2

#define PWM2CON (*(volatile unsigned long *)0xE0070074)
#define PWM2CON_OFFSET 0x74
#define PWM2CON_PWM0_MASK 0x1
#define PWM2CON_PWM0 0x1
#define PWM2CON_PWM0_BIT 0
#define PWM2CON_PWM1_MASK 0x2
#define PWM2CON_PWM1 0x2
#define PWM2CON_PWM1_BIT 1
#define PWM2CON_PWM2_MASK 0x4
#define PWM2CON_PWM2 0x4
#define PWM2CON_PWM2_BIT 2
#define PWM2CON_PWM3_MASK 0x8
#define PWM2CON_PWM3 0x8
#define PWM2CON_PWM3_BIT 3

#define TIMER3_BASE 0xE0074000

#define T3IR (*(volatile unsigned char *)0xE0074000)
#define T3IR_OFFSET 0x0
#define T3IR_MR0_MASK 0x1
#define T3IR_MR0 0x1
#define T3IR_MR0_BIT 0
#define T3IR_MR1_MASK 0x2
#define T3IR_MR1 0x2
#define T3IR_MR1_BIT 1
#define T3IR_MR2_MASK 0x4
#define T3IR_MR2 0x4
#define T3IR_MR2_BIT 2
#define T3IR_MR3_MASK 0x8
#define T3IR_MR3 0x8
#define T3IR_MR3_BIT 3
#define T3IR_CR0_MASK 0x10
#define T3IR_CR0 0x10
#define T3IR_CR0_BIT 4
#define T3IR_CR1_MASK 0x20
#define T3IR_CR1 0x20
#define T3IR_CR1_BIT 5
#define T3IR_CR2_MASK 0x40
#define T3IR_CR2 0x40
#define T3IR_CR2_BIT 6
#define T3IR_CR3_MASK 0x80
#define T3IR_CR3 0x80
#define T3IR_CR3_BIT 7

#define T3TCR (*(volatile unsigned char *)0xE0074004)
#define T3TCR_OFFSET 0x4
#define T3TCR_Counter_Enable_MASK 0x1
#define T3TCR_Counter_Enable 0x1
#define T3TCR_Counter_Enable_BIT 0
#define T3TCR_Counter_Reset_MASK 0x2
#define T3TCR_Counter_Reset 0x2
#define T3TCR_Counter_Reset_BIT 1

#define T3TC (*(volatile unsigned short *)0xE0074008)
#define T3TC_OFFSET 0x8

#define T3PR (*(volatile unsigned short *)0xE007400C)
#define T3PR_OFFSET 0xC

#define T3PC (*(volatile unsigned short *)0xE0074010)
#define T3PC_OFFSET 0x10

#define T3MCR (*(volatile unsigned short *)0xE0074014)
#define T3MCR_OFFSET 0x14
#define T3MCR_MR0I_MASK 0x1
#define T3MCR_MR0I 0x1
#define T3MCR_MR0I_BIT 0
#define T3MCR_MR0R_MASK 0x2
#define T3MCR_MR0R 0x2
#define T3MCR_MR0R_BIT 1
#define T3MCR_MR0S_MASK 0x4
#define T3MCR_MR0S 0x4
#define T3MCR_MR0S_BIT 2
#define T3MCR_MR1I_MASK 0x8
#define T3MCR_MR1I 0x8
#define T3MCR_MR1I_BIT 3
#define T3MCR_MR1R_MASK 0x10
#define T3MCR_MR1R 0x10
#define T3MCR_MR1R_BIT 4
#define T3MCR_MR1S_MASK 0x20
#define T3MCR_MR1S 0x20
#define T3MCR_MR1S_BIT 5
#define T3MCR_MR2I_MASK 0x40
#define T3MCR_MR2I 0x40
#define T3MCR_MR2I_BIT 6
#define T3MCR_MR2R_MASK 0x80
#define T3MCR_MR2R 0x80
#define T3MCR_MR2R_BIT 7
#define T3MCR_MR2S_MASK 0x100
#define T3MCR_MR2S 0x100
#define T3MCR_MR2S_BIT 8
#define T3MCR_MR3I_MASK 0x200
#define T3MCR_MR3I 0x200
#define T3MCR_MR3I_BIT 9
#define T3MCR_MR3R_MASK 0x400
#define T3MCR_MR3R 0x400
#define T3MCR_MR3R_BIT 10
#define T3MCR_MR3S_MASK 0x800
#define T3MCR_MR3S 0x800
#define T3MCR_MR3S_BIT 11

#define T3MR0 (*(volatile unsigned short *)0xE0074018)
#define T3MR0_OFFSET 0x18

#define T3MR1 (*(volatile unsigned short *)0xE007401C)
#define T3MR1_OFFSET 0x1C

#define T3MR2 (*(volatile unsigned short *)0xE0074020)
#define T3MR2_OFFSET 0x20

#define T3MR3 (*(volatile unsigned short *)0xE0074024)
#define T3MR3_OFFSET 0x24

#define T3CCR (*(volatile unsigned short *)0xE0074028)
#define T3CCR_OFFSET 0x28
#define T3CCR_CAP0RE_MASK 0x1
#define T3CCR_CAP0RE 0x1
#define T3CCR_CAP0RE_BIT 0
#define T3CCR_CAP0FE_MASK 0x2
#define T3CCR_CAP0FE 0x2
#define T3CCR_CAP0FE_BIT 1
#define T3CCR_CAP0I_MASK 0x4
#define T3CCR_CAP0I 0x4
#define T3CCR_CAP0I_BIT 2
#define T3CCR_CAP1RE_MASK 0x8
#define T3CCR_CAP1RE 0x8
#define T3CCR_CAP1RE_BIT 3
#define T3CCR_CAP1FE_MASK 0x10
#define T3CCR_CAP1FE 0x10
#define T3CCR_CAP1FE_BIT 4
#define T3CCR_CAP1I_MASK 0x20
#define T3CCR_CAP1I 0x20
#define T3CCR_CAP1I_BIT 5
#define T3CCR_CAP2RE_MASK 0x40
#define T3CCR_CAP2RE 0x40
#define T3CCR_CAP2RE_BIT 6
#define T3CCR_CAP2FE_MASK 0x80
#define T3CCR_CAP2FE 0x80
#define T3CCR_CAP2FE_BIT 7
#define T3CCR_CAP2I_MASK 0x100
#define T3CCR_CAP2I 0x100
#define T3CCR_CAP2I_BIT 8
#define T3CCR_CAP3RE_MASK 0x200
#define T3CCR_CAP3RE 0x200
#define T3CCR_CAP3RE_BIT 9
#define T3CCR_CAP3FE_MASK 0x400
#define T3CCR_CAP3FE 0x400
#define T3CCR_CAP3FE_BIT 10
#define T3CCR_CAP3I_MASK 0x800
#define T3CCR_CAP3I 0x800
#define T3CCR_CAP3I_BIT 11

#define T3CR0 (*(volatile unsigned short *)0xE007402C)
#define T3CR0_OFFSET 0x2C

#define T3CR1 (*(volatile unsigned short *)0xE0074030)
#define T3CR1_OFFSET 0x30

#define T3CR2 (*(volatile unsigned short *)0xE0074034)
#define T3CR2_OFFSET 0x34

#define T3CR3 (*(volatile unsigned short *)0xE0074038)
#define T3CR3_OFFSET 0x38

#define T3EMR (*(volatile unsigned short *)0xE007403C)
#define T3EMR_OFFSET 0x3C
#define T3EMR_EM0_MASK 0x1
#define T3EMR_EM0 0x1
#define T3EMR_EM0_BIT 0
#define T3EMR_EM1_MASK 0x2
#define T3EMR_EM1 0x2
#define T3EMR_EM1_BIT 1
#define T3EMR_EM2_MASK 0x4
#define T3EMR_EM2 0x4
#define T3EMR_EM2_BIT 2
#define T3EMR_EM3_MASK 0x8
#define T3EMR_EM3 0x8
#define T3EMR_EM3_BIT 3
#define T3EMR_EMC0_MASK 0x30
#define T3EMR_EMC0_BIT 4
#define T3EMR_EMC1_MASK 0xC0
#define T3EMR_EMC1_BIT 6
#define T3EMR_EMC2_MASK 0x300
#define T3EMR_EMC2_BIT 8
#define T3EMR_EMC3_MASK 0xC00
#define T3EMR_EMC3_BIT 10

#define T3CTCR (*(volatile unsigned long *)0xE0074070)
#define T3CTCR_OFFSET 0x70
#define T3CTCR_Counter_Timer_Mode_MASK 0x3
#define T3CTCR_Counter_Timer_Mode_BIT 0
#define T3CTCR_Count_Input_Select_MASK 0xC
#define T3CTCR_Count_Input_Select_BIT 2

#define PWM3CON (*(volatile unsigned long *)0xE0074074)
#define PWM3CON_OFFSET 0x74
#define PWM3CON_PWM0_MASK 0x1
#define PWM3CON_PWM0 0x1
#define PWM3CON_PWM0_BIT 0
#define PWM3CON_PWM1_MASK 0x2
#define PWM3CON_PWM1 0x2
#define PWM3CON_PWM1_BIT 1
#define PWM3CON_PWM2_MASK 0x4
#define PWM3CON_PWM2 0x4
#define PWM3CON_PWM2_BIT 2
#define PWM3CON_PWM3_MASK 0x8
#define PWM3CON_PWM3 0x8
#define PWM3CON_PWM3_BIT 3

#define SCB_BASE 0xE01FC000

#define MAMCR (*(volatile unsigned char *)0xE01FC000)
#define MAMCR_OFFSET 0x0
#define MAMCR_MAM_mode_control_MASK 0x3
#define MAMCR_MAM_mode_control_BIT 0

#define MAMTIM (*(volatile unsigned char *)0xE01FC004)
#define MAMTIM_OFFSET 0x4
#define MAMTIM_MAM_fetch_cycle_timing_MASK 0x7
#define MAMTIM_MAM_fetch_cycle_timing_BIT 0

#define MEMMAP (*(volatile unsigned char *)0xE01FC040)
#define MEMMAP_OFFSET 0x40
#define MEMMAP_MAP_MASK 0x3
#define MEMMAP_MAP_BIT 0

#define PLLCON (*(volatile unsigned char *)0xE01FC080)
#define PLLCON_OFFSET 0x80
#define PLLCON_PLLE_MASK 0x1
#define PLLCON_PLLE 0x1
#define PLLCON_PLLE_BIT 0
#define PLLCON_PLLC_MASK 0x2
#define PLLCON_PLLC 0x2
#define PLLCON_PLLC_BIT 1

#define PLLCFG (*(volatile unsigned char *)0xE01FC084)
#define PLLCFG_OFFSET 0x84
#define PLLCFG_MSEL_MASK 0x1F
#define PLLCFG_MSEL_BIT 0
#define PLLCFG_PSEL_MASK 0x60
#define PLLCFG_PSEL_BIT 5

#define PLLSTAT (*(volatile unsigned short *)0xE01FC088)
#define PLLSTAT_OFFSET 0x88
#define PLLSTAT_MSEL_MASK 0x1F
#define PLLSTAT_MSEL_BIT 0
#define PLLSTAT_PSEL_MASK 0x60
#define PLLSTAT_PSEL_BIT 5
#define PLLSTAT_PLLE_MASK 0x100
#define PLLSTAT_PLLE 0x100
#define PLLSTAT_PLLE_BIT 8
#define PLLSTAT_PLLC_MASK 0x200
#define PLLSTAT_PLLC 0x200
#define PLLSTAT_PLLC_BIT 9
#define PLLSTAT_PLOCK_MASK 0x400
#define PLLSTAT_PLOCK 0x400
#define PLLSTAT_PLOCK_BIT 10

#define PLLFEED (*(volatile unsigned char *)0xE01FC08C)
#define PLLFEED_OFFSET 0x8C

#define PCON (*(volatile unsigned char *)0xE01FC0C0)
#define PCON_OFFSET 0xC0
#define PCON_IDL_MASK 0x1
#define PCON_IDL 0x1
#define PCON_IDL_BIT 0
#define PCON_PD_MASK 0x2
#define PCON_PD 0x2
#define PCON_PD_BIT 1

#define PCONP (*(volatile unsigned long *)0xE01FC0C4)
#define PCONP_OFFSET 0xC4
#define PCONP_PCTIM0_MASK 0x2
#define PCONP_PCTIM0 0x2
#define PCONP_PCTIM0_BIT 1
#define PCONP_PCTIM1_MASK 0x4
#define PCONP_PCTIM1 0x4
#define PCONP_PCTIM1_BIT 2
#define PCONP_PCUART0_MASK 0x8
#define PCONP_PCUART0 0x8
#define PCONP_PCUART0_BIT 3
#define PCONP_PCUART1_MASK 0x10
#define PCONP_PCUART1 0x10
#define PCONP_PCUART1_BIT 4
#define PCONP_PCPWM0_MASK 0x20
#define PCONP_PCPWM0 0x20
#define PCONP_PCPWM0_BIT 5
#define PCONP_PCI2C0_MASK 0x80
#define PCONP_PCI2C0 0x80
#define PCONP_PCI2C0_BIT 7
#define PCONP_PCSPI0_MASK 0x100
#define PCONP_PCSPI0 0x100
#define PCONP_PCSPI0_BIT 8
#define PCONP_PCRTC_MASK 0x200
#define PCONP_PCRTC 0x200
#define PCONP_PCRTC_BIT 9
#define PCONP_PCSPI1_MASK 0x400
#define PCONP_PCSPI1 0x400
#define PCONP_PCSPI1_BIT 10
#define PCONP_PCAD_MASK 0x1000
#define PCONP_PCAD 0x1000
#define PCONP_PCAD_BIT 12
#define PCONP_PCI2C1_MASK 0x80000
#define PCONP_PCI2C1 0x80000
#define PCONP_PCI2C1_BIT 19
#define PCONP_PCTIM2_MASK 0x10000000
#define PCONP_PCTIM2 0x10000000
#define PCONP_PCTIM2_BIT 28
#define PCONP_PCTIM3_MASK 0x20000000
#define PCONP_PCTIM3 0x20000000
#define PCONP_PCTIM3_BIT 29

#define APBDIV (*(volatile unsigned char *)0xE01FC100)
#define APBDIV_OFFSET 0x100
#define APBDIV_APBDIV_MASK 0x3
#define APBDIV_APBDIV_BIT 0

#define RSIR (*(volatile unsigned char *)0xE01FC180)
#define RSIR_OFFSET 0x180
#define RSIR_POR_MASK 0x1
#define RSIR_POR 0x1
#define RSIR_POR_BIT 0
#define RSIR_EXTR_MASK 0x2
#define RSIR_EXTR 0x2
#define RSIR_EXTR_BIT 1
#define RSIR_WDTR_MASK 0x4
#define RSIR_WDTR 0x4
#define RSIR_WDTR_BIT 2

#define CSPR (*(volatile unsigned char *)0xE01FC184)
#define CSPR_OFFSET 0x184

#define SCS (*(volatile unsigned *)0xE01FC1A0)
#define SCS_OFFSET 0x1A0
#define SCS_GPIO0M_MASK 0x1
#define SCS_GPIO0M 0x1
#define SCS_GPIO0M_BIT 0

#define EXTINT (*(volatile unsigned char *)0xE01FC140)
#define EXTINT_OFFSET 0x140
#define EXTINT_EINT0_MASK 0x1
#define EXTINT_EINT0 0x1
#define EXTINT_EINT0_BIT 0
#define EXTINT_EINT1_MASK 0x2
#define EXTINT_EINT1 0x2
#define EXTINT_EINT1_BIT 1
#define EXTINT_EINT2_MASK 0x4
#define EXTINT_EINT2 0x4
#define EXTINT_EINT2_BIT 2

#define INTWAKE (*(volatile unsigned short *)0xE01FC144)
#define INTWAKE_OFFSET 0x144
#define INTWAKE_EXTWAKE0_MASK 0x1
#define INTWAKE_EXTWAKE0 0x1
#define INTWAKE_EXTWAKE0_BIT 0
#define INTWAKE_EXTWAKE1_MASK 0x2
#define INTWAKE_EXTWAKE1 0x2
#define INTWAKE_EXTWAKE1_BIT 1
#define INTWAKE_EXTWAKE2_MASK 0x4
#define INTWAKE_EXTWAKE2 0x4
#define INTWAKE_EXTWAKE2_BIT 2
#define INTWAKE_RTCWAKE_MASK 0x8000
#define INTWAKE_RTCWAKE 0x8000
#define INTWAKE_RTCWAKE_BIT 15

#define EXTMODE (*(volatile unsigned char *)0xE01FC148)
#define EXTMODE_OFFSET 0x148
#define EXTMODE_EXTMODE0_MASK 0x1
#define EXTMODE_EXTMODE0 0x1
#define EXTMODE_EXTMODE0_BIT 0
#define EXTMODE_EXTMODE1_MASK 0x2
#define EXTMODE_EXTMODE1 0x2
#define EXTMODE_EXTMODE1_BIT 1
#define EXTMODE_EXTMODE2_MASK 0x4
#define EXTMODE_EXTMODE2 0x4
#define EXTMODE_EXTMODE2_BIT 2

#define EXTPOLAR (*(volatile unsigned char *)0xE01FC14C)
#define EXTPOLAR_OFFSET 0x14C
#define EXTPOLAR_EXTPOLAR0_MASK 0x1
#define EXTPOLAR_EXTPOLAR0 0x1
#define EXTPOLAR_EXTPOLAR0_BIT 0
#define EXTPOLAR_EXTPOLAR1_MASK 0x2
#define EXTPOLAR_EXTPOLAR1 0x2
#define EXTPOLAR_EXTPOLAR1_BIT 1
#define EXTPOLAR_EXTPOLAR2_MASK 0x4
#define EXTPOLAR_EXTPOLAR2 0x4
#define EXTPOLAR_EXTPOLAR2_BIT 2

#define VIC_BASE 0xFFFFF000

#define VICIRQStatus (*(volatile unsigned long *)0xFFFFF000)
#define VICIRQStatus_OFFSET 0x0
#define VICIRQStatus_WDT_MASK 0x1
#define VICIRQStatus_WDT 0x1
#define VICIRQStatus_WDT_BIT 0
#define VICIRQStatus_ARMCore0_MASK 0x4
#define VICIRQStatus_ARMCore0 0x4
#define VICIRQStatus_ARMCore0_BIT 2
#define VICIRQStatus_ARMCore1_MASK 0x8
#define VICIRQStatus_ARMCore1 0x8
#define VICIRQStatus_ARMCore1_BIT 3
#define VICIRQStatus_TIMER0_MASK 0x10
#define VICIRQStatus_TIMER0 0x10
#define VICIRQStatus_TIMER0_BIT 4
#define VICIRQStatus_TIMER1_MASK 0x20
#define VICIRQStatus_TIMER1 0x20
#define VICIRQStatus_TIMER1_BIT 5
#define VICIRQStatus_UART0_MASK 0x40
#define VICIRQStatus_UART0 0x40
#define VICIRQStatus_UART0_BIT 6
#define VICIRQStatus_UART1_MASK 0x80
#define VICIRQStatus_UART1 0x80
#define VICIRQStatus_UART1_BIT 7
#define VICIRQStatus_I2C0_MASK 0x200
#define VICIRQStatus_I2C0 0x200
#define VICIRQStatus_I2C0_BIT 9
#define VICIRQStatus_SPI0_MASK 0x400
#define VICIRQStatus_SPI0 0x400
#define VICIRQStatus_SPI0_BIT 10
#define VICIRQStatus_SPI1_SSP_MASK 0x800
#define VICIRQStatus_SPI1_SSP 0x800
#define VICIRQStatus_SPI1_SSP_BIT 11
#define VICIRQStatus_PLL_MASK 0x1000
#define VICIRQStatus_PLL 0x1000
#define VICIRQStatus_PLL_BIT 12
#define VICIRQStatus_RTC_MASK 0x2000
#define VICIRQStatus_RTC 0x2000
#define VICIRQStatus_RTC_BIT 13
#define VICIRQStatus_EINT0_MASK 0x4000
#define VICIRQStatus_EINT0 0x4000
#define VICIRQStatus_EINT0_BIT 14
#define VICIRQStatus_EINT1_MASK 0x8000
#define VICIRQStatus_EINT1 0x8000
#define VICIRQStatus_EINT1_BIT 15
#define VICIRQStatus_EINT2_MASK 0x10000
#define VICIRQStatus_EINT2 0x10000
#define VICIRQStatus_EINT2_BIT 16
#define VICIRQStatus_AD0_MASK 0x40000
#define VICIRQStatus_AD0 0x40000
#define VICIRQStatus_AD0_BIT 18
#define VICIRQStatus_I2C1_MASK 0x80000
#define VICIRQStatus_I2C1 0x80000
#define VICIRQStatus_I2C1_BIT 19
#define VICIRQStatus_TIMER2_MASK 0x4000000
#define VICIRQStatus_TIMER2 0x4000000
#define VICIRQStatus_TIMER2_BIT 26
#define VICIRQStatus_TIMER3_MASK 0x8000000
#define VICIRQStatus_TIMER3 0x8000000
#define VICIRQStatus_TIMER3_BIT 27

#define VICFIQStatus (*(volatile unsigned long *)0xFFFFF004)
#define VICFIQStatus_OFFSET 0x4
#define VICFIQStatus_WDT_MASK 0x1
#define VICFIQStatus_WDT 0x1
#define VICFIQStatus_WDT_BIT 0
#define VICFIQStatus_ARMCore0_MASK 0x4
#define VICFIQStatus_ARMCore0 0x4
#define VICFIQStatus_ARMCore0_BIT 2
#define VICFIQStatus_ARMCore1_MASK 0x8
#define VICFIQStatus_ARMCore1 0x8
#define VICFIQStatus_ARMCore1_BIT 3
#define VICFIQStatus_TIMER0_MASK 0x10
#define VICFIQStatus_TIMER0 0x10
#define VICFIQStatus_TIMER0_BIT 4
#define VICFIQStatus_TIMER1_MASK 0x20
#define VICFIQStatus_TIMER1 0x20
#define VICFIQStatus_TIMER1_BIT 5
#define VICFIQStatus_UART0_MASK 0x40
#define VICFIQStatus_UART0 0x40
#define VICFIQStatus_UART0_BIT 6
#define VICFIQStatus_UART1_MASK 0x80
#define VICFIQStatus_UART1 0x80
#define VICFIQStatus_UART1_BIT 7
#define VICFIQStatus_I2C0_MASK 0x200
#define VICFIQStatus_I2C0 0x200
#define VICFIQStatus_I2C0_BIT 9
#define VICFIQStatus_SPI0_MASK 0x400
#define VICFIQStatus_SPI0 0x400
#define VICFIQStatus_SPI0_BIT 10
#define VICFIQStatus_SPI1_SSP_MASK 0x800
#define VICFIQStatus_SPI1_SSP 0x800
#define VICFIQStatus_SPI1_SSP_BIT 11
#define VICFIQStatus_PLL_MASK 0x1000
#define VICFIQStatus_PLL 0x1000
#define VICFIQStatus_PLL_BIT 12
#define VICFIQStatus_RTC_MASK 0x2000
#define VICFIQStatus_RTC 0x2000
#define VICFIQStatus_RTC_BIT 13
#define VICFIQStatus_EINT0_MASK 0x4000
#define VICFIQStatus_EINT0 0x4000
#define VICFIQStatus_EINT0_BIT 14
#define VICFIQStatus_EINT1_MASK 0x8000
#define VICFIQStatus_EINT1 0x8000
#define VICFIQStatus_EINT1_BIT 15
#define VICFIQStatus_EINT2_MASK 0x10000
#define VICFIQStatus_EINT2 0x10000
#define VICFIQStatus_EINT2_BIT 16
#define VICFIQStatus_AD0_MASK 0x40000
#define VICFIQStatus_AD0 0x40000
#define VICFIQStatus_AD0_BIT 18
#define VICFIQStatus_I2C1_MASK 0x80000
#define VICFIQStatus_I2C1 0x80000
#define VICFIQStatus_I2C1_BIT 19
#define VICFIQStatus_TIMER2_MASK 0x4000000
#define VICFIQStatus_TIMER2 0x4000000
#define VICFIQStatus_TIMER2_BIT 26
#define VICFIQStatus_TIMER3_MASK 0x8000000
#define VICFIQStatus_TIMER3 0x8000000
#define VICFIQStatus_TIMER3_BIT 27

#define VICRawIntr (*(volatile unsigned long *)0xFFFFF008)
#define VICRawIntr_OFFSET 0x8
#define VICRawIntr_WDT_MASK 0x1
#define VICRawIntr_WDT 0x1
#define VICRawIntr_WDT_BIT 0
#define VICRawIntr_ARMCore0_MASK 0x4
#define VICRawIntr_ARMCore0 0x4
#define VICRawIntr_ARMCore0_BIT 2
#define VICRawIntr_ARMCore1_MASK 0x8
#define VICRawIntr_ARMCore1 0x8
#define VICRawIntr_ARMCore1_BIT 3
#define VICRawIntr_TIMER0_MASK 0x10
#define VICRawIntr_TIMER0 0x10
#define VICRawIntr_TIMER0_BIT 4
#define VICRawIntr_TIMER1_MASK 0x20
#define VICRawIntr_TIMER1 0x20
#define VICRawIntr_TIMER1_BIT 5
#define VICRawIntr_UART0_MASK 0x40
#define VICRawIntr_UART0 0x40
#define VICRawIntr_UART0_BIT 6
#define VICRawIntr_UART1_MASK 0x80
#define VICRawIntr_UART1 0x80
#define VICRawIntr_UART1_BIT 7
#define VICRawIntr_I2C0_MASK 0x200
#define VICRawIntr_I2C0 0x200
#define VICRawIntr_I2C0_BIT 9
#define VICRawIntr_SPI0_MASK 0x400
#define VICRawIntr_SPI0 0x400
#define VICRawIntr_SPI0_BIT 10
#define VICRawIntr_SPI1_SSP_MASK 0x800
#define VICRawIntr_SPI1_SSP 0x800
#define VICRawIntr_SPI1_SSP_BIT 11
#define VICRawIntr_PLL_MASK 0x1000
#define VICRawIntr_PLL 0x1000
#define VICRawIntr_PLL_BIT 12
#define VICRawIntr_RTC_MASK 0x2000
#define VICRawIntr_RTC 0x2000
#define VICRawIntr_RTC_BIT 13
#define VICRawIntr_EINT0_MASK 0x4000
#define VICRawIntr_EINT0 0x4000
#define VICRawIntr_EINT0_BIT 14
#define VICRawIntr_EINT1_MASK 0x8000
#define VICRawIntr_EINT1 0x8000
#define VICRawIntr_EINT1_BIT 15
#define VICRawIntr_EINT2_MASK 0x10000
#define VICRawIntr_EINT2 0x10000
#define VICRawIntr_EINT2_BIT 16
#define VICRawIntr_AD0_MASK 0x40000
#define VICRawIntr_AD0 0x40000
#define VICRawIntr_AD0_BIT 18
#define VICRawIntr_I2C1_MASK 0x80000
#define VICRawIntr_I2C1 0x80000
#define VICRawIntr_I2C1_BIT 19
#define VICRawIntr_TIMER2_MASK 0x4000000
#define VICRawIntr_TIMER2 0x4000000
#define VICRawIntr_TIMER2_BIT 26
#define VICRawIntr_TIMER3_MASK 0x8000000
#define VICRawIntr_TIMER3 0x8000000
#define VICRawIntr_TIMER3_BIT 27

#define VICIntSelect (*(volatile unsigned long *)0xFFFFF00C)
#define VICIntSelect_OFFSET 0xC
#define VICIntSelect_WDT_MASK 0x1
#define VICIntSelect_WDT 0x1
#define VICIntSelect_WDT_BIT 0
#define VICIntSelect_ARMCore0_MASK 0x4
#define VICIntSelect_ARMCore0 0x4
#define VICIntSelect_ARMCore0_BIT 2
#define VICIntSelect_ARMCore1_MASK 0x8
#define VICIntSelect_ARMCore1 0x8
#define VICIntSelect_ARMCore1_BIT 3
#define VICIntSelect_TIMER0_MASK 0x10
#define VICIntSelect_TIMER0 0x10
#define VICIntSelect_TIMER0_BIT 4
#define VICIntSelect_TIMER1_MASK 0x20
#define VICIntSelect_TIMER1 0x20
#define VICIntSelect_TIMER1_BIT 5
#define VICIntSelect_UART0_MASK 0x40
#define VICIntSelect_UART0 0x40
#define VICIntSelect_UART0_BIT 6
#define VICIntSelect_UART1_MASK 0x80
#define VICIntSelect_UART1 0x80
#define VICIntSelect_UART1_BIT 7
#define VICIntSelect_I2C0_MASK 0x200
#define VICIntSelect_I2C0 0x200
#define VICIntSelect_I2C0_BIT 9
#define VICIntSelect_SPI0_MASK 0x400
#define VICIntSelect_SPI0 0x400
#define VICIntSelect_SPI0_BIT 10
#define VICIntSelect_SPI1_SSP_MASK 0x800
#define VICIntSelect_SPI1_SSP 0x800
#define VICIntSelect_SPI1_SSP_BIT 11
#define VICIntSelect_PLL_MASK 0x1000
#define VICIntSelect_PLL 0x1000
#define VICIntSelect_PLL_BIT 12
#define VICIntSelect_RTC_MASK 0x2000
#define VICIntSelect_RTC 0x2000
#define VICIntSelect_RTC_BIT 13
#define VICIntSelect_EINT0_MASK 0x4000
#define VICIntSelect_EINT0 0x4000
#define VICIntSelect_EINT0_BIT 14
#define VICIntSelect_EINT1_MASK 0x8000
#define VICIntSelect_EINT1 0x8000
#define VICIntSelect_EINT1_BIT 15
#define VICIntSelect_EINT2_MASK 0x10000
#define VICIntSelect_EINT2 0x10000
#define VICIntSelect_EINT2_BIT 16
#define VICIntSelect_AD0_MASK 0x40000
#define VICIntSelect_AD0 0x40000
#define VICIntSelect_AD0_BIT 18
#define VICIntSelect_I2C1_MASK 0x80000
#define VICIntSelect_I2C1 0x80000
#define VICIntSelect_I2C1_BIT 19
#define VICIntSelect_TIMER2_MASK 0x4000000
#define VICIntSelect_TIMER2 0x4000000
#define VICIntSelect_TIMER2_BIT 26
#define VICIntSelect_TIMER3_MASK 0x8000000
#define VICIntSelect_TIMER3 0x8000000
#define VICIntSelect_TIMER3_BIT 27

#define VICIntEnable (*(volatile unsigned long *)0xFFFFF010)
#define VICIntEnable_OFFSET 0x10
#define VICIntEnable_WDT_MASK 0x1
#define VICIntEnable_WDT 0x1
#define VICIntEnable_WDT_BIT 0
#define VICIntEnable_ARMCore0_MASK 0x4
#define VICIntEnable_ARMCore0 0x4
#define VICIntEnable_ARMCore0_BIT 2
#define VICIntEnable_ARMCore1_MASK 0x8
#define VICIntEnable_ARMCore1 0x8
#define VICIntEnable_ARMCore1_BIT 3
#define VICIntEnable_TIMER0_MASK 0x10
#define VICIntEnable_TIMER0 0x10
#define VICIntEnable_TIMER0_BIT 4
#define VICIntEnable_TIMER1_MASK 0x20
#define VICIntEnable_TIMER1 0x20
#define VICIntEnable_TIMER1_BIT 5
#define VICIntEnable_UART0_MASK 0x40
#define VICIntEnable_UART0 0x40
#define VICIntEnable_UART0_BIT 6
#define VICIntEnable_UART1_MASK 0x80
#define VICIntEnable_UART1 0x80
#define VICIntEnable_UART1_BIT 7
#define VICIntEnable_I2C0_MASK 0x200
#define VICIntEnable_I2C0 0x200
#define VICIntEnable_I2C0_BIT 9
#define VICIntEnable_SPI0_MASK 0x400
#define VICIntEnable_SPI0 0x400
#define VICIntEnable_SPI0_BIT 10
#define VICIntEnable_SPI1_SSP_MASK 0x800
#define VICIntEnable_SPI1_SSP 0x800
#define VICIntEnable_SPI1_SSP_BIT 11
#define VICIntEnable_PLL_MASK 0x1000
#define VICIntEnable_PLL 0x1000
#define VICIntEnable_PLL_BIT 12
#define VICIntEnable_RTC_MASK 0x2000
#define VICIntEnable_RTC 0x2000
#define VICIntEnable_RTC_BIT 13
#define VICIntEnable_EINT0_MASK 0x4000
#define VICIntEnable_EINT0 0x4000
#define VICIntEnable_EINT0_BIT 14
#define VICIntEnable_EINT1_MASK 0x8000
#define VICIntEnable_EINT1 0x8000
#define VICIntEnable_EINT1_BIT 15
#define VICIntEnable_EINT2_MASK 0x10000
#define VICIntEnable_EINT2 0x10000
#define VICIntEnable_EINT2_BIT 16
#define VICIntEnable_AD0_MASK 0x40000
#define VICIntEnable_AD0 0x40000
#define VICIntEnable_AD0_BIT 18
#define VICIntEnable_I2C1_MASK 0x80000
#define VICIntEnable_I2C1 0x80000
#define VICIntEnable_I2C1_BIT 19
#define VICIntEnable_TIMER2_MASK 0x4000000
#define VICIntEnable_TIMER2 0x4000000
#define VICIntEnable_TIMER2_BIT 26
#define VICIntEnable_TIMER3_MASK 0x8000000
#define VICIntEnable_TIMER3 0x8000000
#define VICIntEnable_TIMER3_BIT 27

#define VICIntEnClr (*(volatile unsigned long *)0xFFFFF014)
#define VICIntEnClr_OFFSET 0x14

#define VICSoftInt (*(volatile unsigned long *)0xFFFFF018)
#define VICSoftInt_OFFSET 0x18
#define VICSoftInt_WDT_MASK 0x1
#define VICSoftInt_WDT 0x1
#define VICSoftInt_WDT_BIT 0
#define VICSoftInt_ARMCore0_MASK 0x4
#define VICSoftInt_ARMCore0 0x4
#define VICSoftInt_ARMCore0_BIT 2
#define VICSoftInt_ARMCore1_MASK 0x8
#define VICSoftInt_ARMCore1 0x8
#define VICSoftInt_ARMCore1_BIT 3
#define VICSoftInt_TIMER0_MASK 0x10
#define VICSoftInt_TIMER0 0x10
#define VICSoftInt_TIMER0_BIT 4
#define VICSoftInt_TIMER1_MASK 0x20
#define VICSoftInt_TIMER1 0x20
#define VICSoftInt_TIMER1_BIT 5
#define VICSoftInt_UART0_MASK 0x40
#define VICSoftInt_UART0 0x40
#define VICSoftInt_UART0_BIT 6
#define VICSoftInt_UART1_MASK 0x80
#define VICSoftInt_UART1 0x80
#define VICSoftInt_UART1_BIT 7
#define VICSoftInt_I2C0_MASK 0x200
#define VICSoftInt_I2C0 0x200
#define VICSoftInt_I2C0_BIT 9
#define VICSoftInt_SPI0_MASK 0x400
#define VICSoftInt_SPI0 0x400
#define VICSoftInt_SPI0_BIT 10
#define VICSoftInt_SPI1_SSP_MASK 0x800
#define VICSoftInt_SPI1_SSP 0x800
#define VICSoftInt_SPI1_SSP_BIT 11
#define VICSoftInt_PLL_MASK 0x1000
#define VICSoftInt_PLL 0x1000
#define VICSoftInt_PLL_BIT 12
#define VICSoftInt_RTC_MASK 0x2000
#define VICSoftInt_RTC 0x2000
#define VICSoftInt_RTC_BIT 13
#define VICSoftInt_EINT0_MASK 0x4000
#define VICSoftInt_EINT0 0x4000
#define VICSoftInt_EINT0_BIT 14
#define VICSoftInt_EINT1_MASK 0x8000
#define VICSoftInt_EINT1 0x8000
#define VICSoftInt_EINT1_BIT 15
#define VICSoftInt_EINT2_MASK 0x10000
#define VICSoftInt_EINT2 0x10000
#define VICSoftInt_EINT2_BIT 16
#define VICSoftInt_AD0_MASK 0x40000
#define VICSoftInt_AD0 0x40000
#define VICSoftInt_AD0_BIT 18
#define VICSoftInt_I2C1_MASK 0x80000
#define VICSoftInt_I2C1 0x80000
#define VICSoftInt_I2C1_BIT 19
#define VICSoftInt_TIMER2_MASK 0x4000000
#define VICSoftInt_TIMER2 0x4000000
#define VICSoftInt_TIMER2_BIT 26
#define VICSoftInt_TIMER3_MASK 0x8000000
#define VICSoftInt_TIMER3 0x8000000
#define VICSoftInt_TIMER3_BIT 27

#define VICSoftIntClear (*(volatile unsigned long *)0xFFFFF01C)
#define VICSoftIntClear_OFFSET 0x1C
#define VICSoftIntClear_WDT_MASK 0x1
#define VICSoftIntClear_WDT 0x1
#define VICSoftIntClear_WDT_BIT 0
#define VICSoftIntClear_ARMCore0_MASK 0x4
#define VICSoftIntClear_ARMCore0 0x4
#define VICSoftIntClear_ARMCore0_BIT 2
#define VICSoftIntClear_ARMCore1_MASK 0x8
#define VICSoftIntClear_ARMCore1 0x8
#define VICSoftIntClear_ARMCore1_BIT 3
#define VICSoftIntClear_TIMER0_MASK 0x10
#define VICSoftIntClear_TIMER0 0x10
#define VICSoftIntClear_TIMER0_BIT 4
#define VICSoftIntClear_TIMER1_MASK 0x20
#define VICSoftIntClear_TIMER1 0x20
#define VICSoftIntClear_TIMER1_BIT 5
#define VICSoftIntClear_UART0_MASK 0x40
#define VICSoftIntClear_UART0 0x40
#define VICSoftIntClear_UART0_BIT 6
#define VICSoftIntClear_UART1_MASK 0x80
#define VICSoftIntClear_UART1 0x80
#define VICSoftIntClear_UART1_BIT 7
#define VICSoftIntClear_I2C0_MASK 0x200
#define VICSoftIntClear_I2C0 0x200
#define VICSoftIntClear_I2C0_BIT 9
#define VICSoftIntClear_SPI0_MASK 0x400
#define VICSoftIntClear_SPI0 0x400
#define VICSoftIntClear_SPI0_BIT 10
#define VICSoftIntClear_SPI1_SSP_MASK 0x800
#define VICSoftIntClear_SPI1_SSP 0x800
#define VICSoftIntClear_SPI1_SSP_BIT 11
#define VICSoftIntClear_PLL_MASK 0x1000
#define VICSoftIntClear_PLL 0x1000
#define VICSoftIntClear_PLL_BIT 12
#define VICSoftIntClear_RTC_MASK 0x2000
#define VICSoftIntClear_RTC 0x2000
#define VICSoftIntClear_RTC_BIT 13
#define VICSoftIntClear_EINT0_MASK 0x4000
#define VICSoftIntClear_EINT0 0x4000
#define VICSoftIntClear_EINT0_BIT 14
#define VICSoftIntClear_EINT1_MASK 0x8000
#define VICSoftIntClear_EINT1 0x8000
#define VICSoftIntClear_EINT1_BIT 15
#define VICSoftIntClear_EINT2_MASK 0x10000
#define VICSoftIntClear_EINT2 0x10000
#define VICSoftIntClear_EINT2_BIT 16
#define VICSoftIntClear_AD0_MASK 0x40000
#define VICSoftIntClear_AD0 0x40000
#define VICSoftIntClear_AD0_BIT 18
#define VICSoftIntClear_I2C1_MASK 0x80000
#define VICSoftIntClear_I2C1 0x80000
#define VICSoftIntClear_I2C1_BIT 19
#define VICSoftIntClear_TIMER2_MASK 0x4000000
#define VICSoftIntClear_TIMER2 0x4000000
#define VICSoftIntClear_TIMER2_BIT 26
#define VICSoftIntClear_TIMER3_MASK 0x8000000
#define VICSoftIntClear_TIMER3 0x8000000
#define VICSoftIntClear_TIMER3_BIT 27

#define VICProtection (*(volatile unsigned long *)0xFFFFF020)
#define VICProtection_OFFSET 0x20
#define VICProtection_VIC_access_MASK 0x1
#define VICProtection_VIC_access 0x1
#define VICProtection_VIC_access_BIT 0

#define VICVectAddr (*(volatile unsigned long *)0xFFFFF030)
#define VICVectAddr_OFFSET 0x30

#define VICDefVectAddr (*(volatile unsigned long *)0xFFFFF034)
#define VICDefVectAddr_OFFSET 0x34

#define VICVectAddr0 (*(volatile unsigned long *)0xFFFFF100)
#define VICVectAddr0_OFFSET 0x100

#define VICVectAddr1 (*(volatile unsigned long *)0xFFFFF104)
#define VICVectAddr1_OFFSET 0x104

#define VICVectAddr2 (*(volatile unsigned long *)0xFFFFF108)
#define VICVectAddr2_OFFSET 0x108

#define VICVectAddr3 (*(volatile unsigned long *)0xFFFFF10C)
#define VICVectAddr3_OFFSET 0x10C

#define VICVectAddr4 (*(volatile unsigned long *)0xFFFFF110)
#define VICVectAddr4_OFFSET 0x110

#define VICVectAddr5 (*(volatile unsigned long *)0xFFFFF114)
#define VICVectAddr5_OFFSET 0x114

#define VICVectAddr6 (*(volatile unsigned long *)0xFFFFF118)
#define VICVectAddr6_OFFSET 0x118

#define VICVectAddr7 (*(volatile unsigned long *)0xFFFFF11C)
#define VICVectAddr7_OFFSET 0x11C

#define VICVectAddr8 (*(volatile unsigned long *)0xFFFFF120)
#define VICVectAddr8_OFFSET 0x120

#define VICVectAddr9 (*(volatile unsigned long *)0xFFFFF124)
#define VICVectAddr9_OFFSET 0x124

#define VICVectAddr10 (*(volatile unsigned long *)0xFFFFF128)
#define VICVectAddr10_OFFSET 0x128

#define VICVectAddr11 (*(volatile unsigned long *)0xFFFFF12C)
#define VICVectAddr11_OFFSET 0x12C

#define VICVectAddr12 (*(volatile unsigned long *)0xFFFFF130)
#define VICVectAddr12_OFFSET 0x130

#define VICVectAddr13 (*(volatile unsigned long *)0xFFFFF134)
#define VICVectAddr13_OFFSET 0x134

#define VICVectAddr14 (*(volatile unsigned long *)0xFFFFF138)
#define VICVectAddr14_OFFSET 0x138

#define VICVectAddr15 (*(volatile unsigned long *)0xFFFFF13C)
#define VICVectAddr15_OFFSET 0x13C

#define VICVectCntl0 (*(volatile unsigned long *)0xFFFFF200)
#define VICVectCntl0_OFFSET 0x200

#define VICVectCntl1 (*(volatile unsigned long *)0xFFFFF204)
#define VICVectCntl1_OFFSET 0x204

#define VICVectCntl2 (*(volatile unsigned long *)0xFFFFF208)
#define VICVectCntl2_OFFSET 0x208

#define VICVectCntl3 (*(volatile unsigned long *)0xFFFFF20C)
#define VICVectCntl3_OFFSET 0x20C

#define VICVectCntl4 (*(volatile unsigned long *)0xFFFFF210)
#define VICVectCntl4_OFFSET 0x210

#define VICVectCntl5 (*(volatile unsigned long *)0xFFFFF214)
#define VICVectCntl5_OFFSET 0x214

#define VICVectCntl6 (*(volatile unsigned long *)0xFFFFF218)
#define VICVectCntl6_OFFSET 0x218

#define VICVectCntl7 (*(volatile unsigned long *)0xFFFFF21C)
#define VICVectCntl7_OFFSET 0x21C

#define VICVectCntl8 (*(volatile unsigned long *)0xFFFFF220)
#define VICVectCntl8_OFFSET 0x220

#define VICVectCntl9 (*(volatile unsigned long *)0xFFFFF224)
#define VICVectCntl9_OFFSET 0x224

#define VICVectCntl10 (*(volatile unsigned long *)0xFFFFF228)
#define VICVectCntl10_OFFSET 0x228

#define VICVectCntl11 (*(volatile unsigned long *)0xFFFFF22C)
#define VICVectCntl11_OFFSET 0x22C

#define VICVectCntl12 (*(volatile unsigned long *)0xFFFFF230)
#define VICVectCntl12_OFFSET 0x230

#define VICVectCntl13 (*(volatile unsigned long *)0xFFFFF234)
#define VICVectCntl13_OFFSET 0x234

#define VICVectCntl14 (*(volatile unsigned long *)0xFFFFF238)
#define VICVectCntl14_OFFSET 0x238

#define VICVectCntl15 (*(volatile unsigned long *)0xFFFFF23C)
#define VICVectCntl15_OFFSET 0x23C

#endif
