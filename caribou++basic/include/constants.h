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
#ifndef CARIBOU_BASIC_CONSTANTS_H_INCLUDED
#define CARIBOU_BASIC_CONSTANTS_H_INCLUDED

#define INCLUDE_ATOI
#define PURE_VIRTUAL =0;

#ifndef MEM_SIZE
	#define MEM_SIZE				1024
#endif

#ifndef EDIT_BUFFER_SIZE
	#define EDIT_BUFFER_SIZE		80
#endif

#define		TITLE_STRING			"CaribouBASIC"
#define		SHORT_TITLE_STRING		"cBASIC"
#define		VERSION_STRING			"0.7"
#define		COPYRIGHT_STRING		"Copyright (c) 2012,2013,2014 Pike Aerospace Research Corp.\n" \
                                    "<http://www.pikeaero.com>\n" \
                                    "Mike Sharkey <mike@pikeaero.com>"
#define     LICENSE_STRING          "License LGPLv3: GNU LGPL version 3 or later\n" \
                                    "<http://www.gnu.org/copyleft/lesser.html>\n" \
                                    "This is free software: you are free to change and redistribute it.\n" \
                                    "There is NO WARRANTY, to the extent permitted by law."
#define		PROMPT_STRING			"] ";
#define 	PI_CONST 				3.141592653589793238462643383

#ifndef __cplusplus
	#define bool uint8_t
	#define true 1
	#define false 0
#endif

#endif // CARIBOU_BASIC_CONSTANTS_H_INCLUDED
