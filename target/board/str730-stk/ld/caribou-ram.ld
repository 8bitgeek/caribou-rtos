/***************************************************************************
 *   Copyright © 2005-2009 by Pike Aerospace Research Corporation          *
 *   mike@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *
 ***************************************************************************/
/***************************************************************************
 * GNU Linker script for MAC7101 executing from ROM                        *
 **************************************************************************/
MEMORY
{
  SRAM (wx) : ORIGIN = 0xa0000000, LENGTH = 0x00004000
  FLASH (rx) : ORIGIN = 0x80000000, LENGTH = 0x00040000
}


SECTIONS
{
  __SRAM_segment_start__ = 0xa0000000;
  __SRAM_segment_end__ = 0xa0004000;
  __FLASH_segment_start__ = 0x80000000;
  __FLASH_segment_end__ = 0x80040000;

  __STACKSIZE__ = 0x0100;
  __STACKSIZE_IRQ__ = 0x10;
  __STACKSIZE_FIQ__ = 0x10;
  __STACKSIZE_SVC__ = 0x10;
  __STACKSIZE_ABT__ = 0x10;
  __STACKSIZE_UND__ = 0x10;
  __HEAPSIZE__ = 0x3000;

  __vectors_ram_load_start__ = __SRAM_segment_start__;
  .vectors_ram __SRAM_segment_start__ (NOLOAD) :
  {
    __vectors_ram_start__ = .;
    *(.vectors_ram)
    . = MAX(__vectors_ram_start__ + 0x3C , .);
  }
  __vectors_ram_end__ = __vectors_ram_start__ + SIZEOF(.vectors_ram);

  __vectors_load_start__ = __FLASH_segment_start__;
  .vectors __FLASH_segment_start__ :
  {
    __vectors_start__ = .;
    *(.vectors .vectors.*)
  }
  __vectors_end__ = __vectors_start__ + SIZEOF(.vectors);

  __init_load_start__ = ALIGN(__vectors_end__ , 4);
  .init ALIGN(__vectors_end__ , 4) :
  {
    __init_start__ = .;
    *(.init .init.*)
  }
  __init_end__ = __init_start__ + SIZEOF(.init);

  __text_load_start__ = ALIGN(__init_end__ , 4);
  .text ALIGN(__init_end__ , 4) :
  {
    __text_start__ = .;
    *(.text .text.* .glue_7t .glue_7 .gnu.linkonce.t.* .gcc_except_table)
  }
  __text_end__ = __text_start__ + SIZEOF(.text);

  __dtors_load_start__ = ALIGN(__text_end__ , 4);
  .dtors ALIGN(__text_end__ , 4) :
  {
    __dtors_start__ = .;
    KEEP (*(SORT(.dtors.*))) KEEP (*(.dtors))
  }
  __dtors_end__ = __dtors_start__ + SIZEOF(.dtors);

  __ctors_load_start__ = ALIGN(__dtors_end__ , 4);
  .ctors ALIGN(__dtors_end__ , 4) :
  {
    __ctors_start__ = .;
    KEEP (*(SORT(.ctors.*))) KEEP (*(.ctors))
  }
  __ctors_end__ = __ctors_start__ + SIZEOF(.ctors);

  __rodata_load_start__ = ALIGN(__ctors_end__ , 4);
  .rodata ALIGN(__ctors_end__ , 4) :
  {
    __rodata_start__ = .;
    *(.rodata .rodata.* .gnu.linkonce.r.*)
  }
  __rodata_end__ = __rodata_start__ + SIZEOF(.rodata);

  __fast_load_start__ = ALIGN(__rodata_end__ , 4);
  .fast ALIGN(__vectors_ram_end__ , 4) : AT(ALIGN(__rodata_end__ , 4))
  {
    __fast_start__ = .;
    *(.fast .fast.*)
  }
  __fast_end__ = __fast_start__ + SIZEOF(.fast);

  __fast_load_end__ = __fast_load_start__ + SIZEOF(.fast);

  .fast_run ALIGN(__vectors_ram_end__ , 4) (NOLOAD) :
  {
    __fast_run_start__ = .;
    . = MAX(__fast_run_start__ + SIZEOF(.fast), .);
  }
  __fast_run_end__ = __fast_run_start__ + SIZEOF(.fast_run);

  __data_load_start__ = ALIGN(__fast_load_start__ + SIZEOF(.fast) , 4);
  .data ALIGN(__fast_run_end__ , 4) : AT(ALIGN(__fast_load_start__ + SIZEOF(.fast) , 4))
  {
    __data_start__ = .;
    *(.data .data.* .gnu.linkonce.d.*)
  }
  __data_end__ = __data_start__ + SIZEOF(.data);

  __data_load_end__ = __data_load_start__ + SIZEOF(.data);

  __FLASH_segment_used_end__ = ALIGN(__fast_load_start__ + SIZEOF(.fast) , 4) + SIZEOF(.data);

  .data_run ALIGN(__fast_run_end__ , 4) (NOLOAD) :
  {
    __data_run_start__ = .;
    . = MAX(__data_run_start__ + SIZEOF(.data), .);
  }
  __data_run_end__ = __data_run_start__ + SIZEOF(.data_run);

  __bss_load_start__ = ALIGN(__data_run_end__ , 4);
  .bss ALIGN(__data_run_end__ , 4) (NOLOAD) :
  {
    __bss_start__ = .;
    *(.bss .bss.* .gnu.linkonce.b.*) *(COMMON)
  }
  __bss_end__ = __bss_start__ + SIZEOF(.bss);

  __non_init_load_start__ = ALIGN(__bss_end__ , 4);
  .non_init ALIGN(__bss_end__ , 4) (NOLOAD) :
  {
    __non_init_start__ = .;
    *(.non_init .non_init.*)
  }
  __non_init_end__ = __non_init_start__ + SIZEOF(.non_init);

  __heap_load_start__ = ALIGN(__non_init_end__ , 4);
  .heap ALIGN(__non_init_end__ , 4) (NOLOAD) :
  {
    __heap_start__ = .;
    *(.heap)
    . = ALIGN(MAX(__heap_start__ + __HEAPSIZE__ , .), 4);
  }
  __heap_end__ = __heap_start__ + SIZEOF(.heap);

  __stack_load_start__ = ALIGN(__heap_end__ , 4);
  .stack ALIGN(__heap_end__ , 4) (NOLOAD) :
  {
    __stack_start__ = .;
    *(.stack)
    . = ALIGN(MAX(__stack_start__ + __STACKSIZE__ , .), 4);
  }
  __stack_end__ = __stack_start__ + SIZEOF(.stack);

  __stack_irq_load_start__ = ALIGN(__stack_end__ , 4);
  .stack_irq ALIGN(__stack_end__ , 4) (NOLOAD) :
  {
    __stack_irq_start__ = .;
    *(.stack_irq)
    . = ALIGN(MAX(__stack_irq_start__ + __STACKSIZE_IRQ__ , .), 4);
  }
  __stack_irq_end__ = __stack_irq_start__ + SIZEOF(.stack_irq);

  __stack_fiq_load_start__ = ALIGN(__stack_irq_end__ , 4);
  .stack_fiq ALIGN(__stack_irq_end__ , 4) (NOLOAD) :
  {
    __stack_fiq_start__ = .;
    *(.stack_fiq)
    . = ALIGN(MAX(__stack_fiq_start__ + __STACKSIZE_FIQ__ , .), 4);
  }
  __stack_fiq_end__ = __stack_fiq_start__ + SIZEOF(.stack_fiq);

  __stack_svc_load_start__ = ALIGN(__stack_fiq_end__ , 4);
  .stack_svc ALIGN(__stack_fiq_end__ , 4) (NOLOAD) :
  {
    __stack_svc_start__ = .;
    *(.stack_svc)
    . = ALIGN(MAX(__stack_svc_start__ + __STACKSIZE_SVC__ , .), 4);
  }
  __stack_svc_end__ = __stack_svc_start__ + SIZEOF(.stack_svc);

  __stack_abt_load_start__ = ALIGN(__stack_svc_end__ , 4);
  .stack_abt ALIGN(__stack_svc_end__ , 4) (NOLOAD) :
  {
    __stack_abt_start__ = .;
    *(.stack_abt)
    . = ALIGN(MAX(__stack_abt_start__ + __STACKSIZE_ABT__ , .), 4);
  }
  __stack_abt_end__ = __stack_abt_start__ + SIZEOF(.stack_abt);

  __stack_und_load_start__ = ALIGN(__stack_abt_end__ , 4);
  .stack_und ALIGN(__stack_abt_end__ , 4) (NOLOAD) :
  {
    __stack_und_start__ = .;
    *(.stack_und)
    . = ALIGN(MAX(__stack_und_start__ + __STACKSIZE_UND__ , .), 4);
  }
  __stack_und_end__ = __stack_und_start__ + SIZEOF(.stack_und);

  __SRAM_segment_used_end__ = ALIGN(__stack_abt_end__ , 4) + SIZEOF(.stack_und);

}

