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
#ifndef CARIBOUQSORT_H
#define CARIBOUQSORT_H

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 ** The qsort() function sorts an array with nmemb elements of size size.  The base argument points to the start of the array.
 ** The  contents of the array are sorted in ascending order according to a comparison function pointed to by compar, which is called
 ** with two arguments that point to the objects being compared.
 ** The comparison function must return an integer less than, equal to, or greater than zero if the first argument is  considered  to
 ** be  respectively  less  than,  equal  to, or greater than the second.  If two members compare as equal, their order in the sorted
 ** array is undefined.
 ** The qsort_r() function is identical to qsort() except that the comparison function compar takes a third argument.  A  pointer  is
 ** passed  to  the  comparison function via arg.  In this way, the comparison function does not need to use global variables to pass
 ** through arbitrary arguments, and is therefore reentrant and safe to use in threads.
 */
extern void qsort( void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *) );
extern void qsort_r( void *base, size_t nmemb, size_t size, int (*compar)(const void *, const void *, void *), void *arg );

#ifdef __cplusplus
}
#endif

#endif
