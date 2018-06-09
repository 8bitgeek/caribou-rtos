/** ***************************************************************************
* @file
* @author Mike Sharkey <mike@pikeaero.com>.
* @copyright © 2005-2013 by Pike Aerospace Research Corporation
* @copyright © 2014-2015 by Mike Sharkey
* @details This file is part of CARIBOU RTOS
* CARIBOU RTOS is free software: you can redistribute it and/or modify
* it under the terms of the Beerware License Version 43.
* "THE BEER-WARE LICENSE" (Revision 43):
* Mike Sharkey <mike@pikeaero.com> wrote this file. 
* As long as you retain this notice you can do whatever you want with
* this stuff. If we meet some day, and you think this stuff is 
* worth it, you can buy me a beer in return ~ Mike Sharkey
******************************************************************************/
#include <caribou/lib/qsort.h>

/**
 ** swap two object of arbritrary size
 */
static void swap(void* m1, void* m2, size_t size)
{
	uint8_t* p1=(uint8_t*)m1;
	uint8_t* p2=(uint8_t*)m2;
	for(int n=0;n<size;n++)
	{
		uint8_t t = p1[n];
		p1[n] = p2[n];
		p2[n] = t;
	}
}


/**
 ** @brief qsort is not quicksort.
 ** @param base The base address of the list of objects to be sorted.
 ** @param nmemb The number of members to be sorted.
 ** @param size The size of each member to be sorted.
 ** @param compar The function to compare two members.
 */
extern void qsort( void *base, size_t nmemb, size_t size, int (*compare)(const void *, const void *) )
{
	if (nmemb > 1 )
	{
		int a,b;
		int deltaA;
		for(a=0; a < nmemb-1; a++)
		{
			deltaA=a;
			for(b=a+1; b < nmemb; b++)
			{
				if ( compare(base+(size*deltaA),base+(size*b)) > 0 )
				{
					deltaA=b;
				}
			}
			swap(base+(size*a),base+(size*deltaA),size);
		}
	}
}

/**
 ** @brief qsort is not quicksort, thread-safe-argument-passing version.
 ** @param base The base address of the list of objects to be sorted.
 ** @param nmemb The number of members to be sorted.
 ** @param size The size of each member to be sorted.
 ** @param compar The function to compare two members.
 */
extern void qsort_r( void *base, size_t nmemb, size_t size, int (*compare)(const void *, const void *, void *), void *arg )
{
	if (nmemb > 1 )
	{
		int a,b;
		int deltaA;
		for(a=0; a < nmemb-1; a++)
		{
			deltaA=a;
			for(b=a+1; b < nmemb; b++)
			{
				if ( compare(base+(size*deltaA),base+(size*b),arg) > 0 )
				{
					deltaA=b;
				}
			}
			swap(base+(size*a),base+(size*deltaA),size);
		}
	}
}
