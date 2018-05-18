/******************************************************************************
* Copyright © 2005-2012 by Pike Aerospace Research Corporation
* All Rights Reserved
*
*   This file is part of CARIBOU RTOS
*
*   CARIBOU RTOS is free software: you can redistribute it and/or modify
*   it under the terms of the Beerware License Version 43.
*
* ----------------------------------------------------------------------------
* "THE BEER-WARE LICENSE" (Revision 43):
* <mike@pikeaero.com> wrote this file. As long as you retain this notice you
* can do whatever you want with this stuff. If we meet some day, and you think
* this stuff is worth it, you can buy me a beer in return ~ Mike Sharkey
* ----------------------------------------------------------------------------
******************************************************************************/
#ifndef __CARIBOU_BASIC_DIM_VARIABLE_H__
#define __CARIBOU_BASIC_DIM_VARIABLE_H__

#include <cvariable.h>
#include <caribou++/clist.h>
#include <caribou++/cstring.h>

namespace CARIBOU_BASIC
{
	class CDimVariable : public CVariable
	{
		public:
			CDimVariable( CARIBOU::CString name );
			CDimVariable( const CDimVariable& other );
			virtual ~CDimVariable();

			CVariable&							operator=( const CDimVariable& other );

			virtual bool						is_dim() {return true;}
			virtual type_t			            type();
			bool					            new_dimension(size_t mag);
			size_t					            dimensions();
			size_t					            dimension(size_t n);
			CARIBOU::CString*	                value(size_t offset);
			CARIBOU::CString*                   value();
			void					            push(size_t offset);
			void					            pop();
			void					            pop_frame();
			size_t					            offsets();
			size_t					            offset();
		protected:
			virtual void			            dispose();
			size_t					            max_offset();
		private:
			void					            private_copy(CDimVariable* p_other);
			CARIBOU::CList<size_t>	            m_offsets;		// push'ed in to query an element.
            CARIBOU::CList<size_t>		        m_dimensions;
			CARIBOU::CList<CARIBOU::CString*>   m_values;
	};
} // namespace CARIBOU_BASIC

#endif // __CARIBOU_BASIC_DIM_VARIABLE_H__
