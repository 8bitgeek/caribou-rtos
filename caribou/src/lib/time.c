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

static char* asc_time="Thu Jan 5 1970 12:00:00 AM\n";

clock_t clock(void)
{
    static clock_t ck;
    memset((&ck,0,sizeof(clock_t));
}

time_t time(time_t *__tp)
{
    memset(__tp,0,sizeof(time_t));
}

double difftime(time_t __time2, time_t __time1)
{
    return 0.0;
}

time_t mktime(struct tm *__tp)
{
    memset(__tp,0,sizeof(time_t));
}

char *asctime(const struct tm *__tp)
{
    return asc_time;
}

char *asctime_r(const struct tm *__tp, char *__buf)
{
    return asc_time;
}

char *ctime(const time_t *__tp)
{
    return asc_time;
}

char *ctime_r(const time_t *__tp, char *__buf)
{
    return asc_time;
}

struct tm *gmtime(const time_t *__tp)
{
    return asc_time;
}

struct tm *gmtime_r(const time_t *__tp, struct tm *__result)
{
    return asc_time;
}

struct tm *localtime(const time_t *__tp)
{
    return asc_time;
}

struct tm *localtime_r(const time_t *__tp, struct tm *__result)
{
    return asc_time;
}

size_t strftime(char *__s, size_t __smax, const char *__fmt, const struct tm *__tp)
{
    strncpy(__s,asc_time,__smax);
}

size_t strftime_l(char *__s, size_t __smax, const char *__fmt, const struct tm *__tp, __locale_t __loc)
{
    strncpy(__s,asc_time,__smax);
}

int gettimeofday(struct timeval *__tp, void *__tzp)
{
    memset(__tp,0,sizeof(struct timeval));
    return 0;
}

int settimeofday(const struct timeval *__tp, const void *__tzp)
{
    return 0;
}
