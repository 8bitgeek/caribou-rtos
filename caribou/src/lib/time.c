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
#include <caribou/kernel/timer.h>
#include <caribou/lib/time.h>

clock_t clock(void)
{
}

time_t time(time_t *__tp)
{
}


double difftime(time_t __time2, time_t __time1)
{
}


time_t mktime(struct tm *__tp)
{
}

char *asctime(const struct tm *__tp)
{
}

char *asctime_r(const struct tm *__tp, char *__buf)
{
}

char *ctime(const time_t *__tp)
{
}

char *ctime_r(const time_t *__tp, char *__buf)
{
}

struct tm *gmtime(const time_t *__tp)
{
}

struct tm *gmtime_r(const time_t *__tp, struct tm *__result)
{
}

struct tm *localtime(const time_t *__tp)
{
}

struct tm *localtime_r(const time_t *__tp, struct tm *__result)
{
}

size_t strftime(char *__s, size_t __smax, const char *__fmt, const struct tm *__tp)
{
}

size_t strftime_l(char *__s, size_t __smax, const char *__fmt, const struct tm *__tp, __locale_t __loc)
{
}

int gettimeofday(struct timeval *__tp, void *__tzp)
{
}

int settimeofday(const struct timeval *__tp, const void *__tzp)
{
}
