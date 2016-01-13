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
#ifndef CARIBOUSTRING_H
#define CARIBOUSTRING_H

#include <caribou/kernel/types.h>

#ifdef __cplusplus
extern "C"
{
#endif

/**
 ** @brief The  memcpy()  function  copies n bytes from memory area src to memory area dest. The memory areas should not overlap.
 ** @return void
 */
extern void* memcpy(void* dest, const void *src, register size_t n);

/**
 ** @brief The  memmove() method copies n bytes from memory area src to memory area dest.  The memory areas may overlap.
 ** @return The memmove() function returns a pointer to dest.
 */
extern void* memmove(void *dest, const void *src, register size_t n);

/**
 ** @brief The memset() function fills the first n bytes of the memory area pointed to by dest with the constant byte c.
 ** @return The memset() function returns a pointer to the memory area dest.
 */
extern void* memset(void* dest, register int c, register size_t n);

/**
 ** @brief The memcmp() function compares the first n bytes of the memory areas s1 and s2.  It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.
 ** @return The memcmp() function returns an integer less than, equal to, or greater than zero if the  first  n  bytes  of  s1  is  found, respectively, to be less than, to match, or be greater than the first n bytes of s2.
 */
extern int memcmp(const void *s1, const void *s2, size_t n);

/**
 ** The  strcpy()  function copies the string pointed to by src, including the terminating null byte ('\0'), to the buffer pointed to
 ** by dest.  The strings may not overlap, and the destination string dest must be large enough to receive the copy.
 ** @return The strcpy() and strncpy() functions return a pointer to the destination string dest.
 */
extern char* strcpy(register char *dest, register const char *src);

/**
 ** The  strcpy()  function copies the string pointed to by src, including the terminating null byte ('\0'), to the buffer pointed to
 ** by dest.  The strings may not overlap, and the destination string dest must be large enough to receive the copy.
 ** @return The strcpy() and strncpy() functions return a pointer to the destination string dest.
 */
extern char* strncpy( register char *dest, register const char *src, size_t len );

/**
 ** @brief The  strcmp()  function  compares  the  two  strings s1 and s2.
 ** @return It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.
 */
extern int strcmp(register const char *s1, register const char *s2);

/**
 ** @brief The  strcasecmp()  function  performs case insensitive compare  the  two  strings s1 and s2.
 ** @return It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.
 */
extern int strcasecmp(register const char *s1, register const char *s2);

/**
 ** @brief The  strcmp()  function  compares  the  two  strings s1 and s2.
 ** @return It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.
 */
extern int strncmp(register const char* s1, register const char* s2, size_t n);

/**
 ** @brief The  strcmp()  function  compares  the  two  strings s1 and s2.
 ** @return It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.
 */
extern int strncasecmp(register const char* s1, register const char* s2, size_t n);

/**
 ** @brief The strlen() function calculates the length of the string s, not including the terminating '\0' character.
 ** @return The strlen() function returns the number of characters in s.
 */
extern size_t strlen(const char* s);

/**
 ** @return The strchr() functions return a pointer to the matched character or NULL if the character is not found.
 */
extern char *strchr(const char *s, int c);

/**
 ** @brief The strcat() function appends the src string to the dest string, overwriting the terminating null byte ('\0') at the end of dest, and then adds a terminating null byte.
 ** The strings may not overlap, and the dest string must have enough space for the result.
 ** @return The strchr() functions return a pointer to the matched character or NULL if the character is not found.
 */
extern char *strcat(char *dest, const char *src);

/**
 ** @brief The strcat() function appends the src string to the dest string, overwriting the terminating null byte ('\0') at the end of dest, and then adds a terminating null byte.
 ** The strings may not overlap, and the dest string must have enough space for the result.
 ** @return The strchr() functions return a pointer to the matched character or NULL if the character is not found.
 */
extern char *strncat(char *__s1, const char *__s2, size_t __n);

extern char *strdup(const char *s);

extern int atoi(const char* a);
extern int64_t atoll(const char* a);

extern size_t strcspn (const char *p, const char *s);

#define	tolower(c) ( ( (c)>='A' && (c)<='Z' ) ? ((c)+0x20) : (c) )
#define toupper(c) ( ( (c)>='a' && (c)<='z' ) ? ((c)-0x20) : (c) )
#define isnum(c) ( (c)>='0' && (c)<='9' )
#define ishex(c) isnum(c) || ( toupper(c)>='A' && toupper(c)<='F' )
#define hex(c) ( (c)<0xa ? (c)+'0' : ((c)-0xa)+'A' )

#ifdef __cplusplus
}
#endif

#endif
