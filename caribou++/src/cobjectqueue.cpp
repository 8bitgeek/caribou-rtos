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
#include <caribou++/cobjectqueue.h>

namespace CARIBOU {

	CObjectQueue::CObjectQueue()
	 : CObjectList()
	{
	}


	CObjectQueue::~CObjectQueue()
	{
	}

	/**
	** Dequeue the object by removing if from list at index [0]
	**/
	CObject* CObjectQueue::dequeue()
	{
		CObject* object = at(0);
		remove(object);
		return object;
	}

}