#include <stdio.h>
#include <rt_misc.h>

#pragma import(__use_no_semihosting_swi)

struct __FILE
{
   int handle;
};

FILE __stdout;
FILE __stdin;
FILE __stderr;

/*int fputc(int c, FILE *stream)
{
   return c;
}*/

int fgetc(FILE *stream)
{
   return EOF;
}

int ferror(FILE *stream)
{
   return EOF;
}

void _ttywrch(int c)
{
   fputc(c, stdout);
}

void _sys_exit(int code)
{
   while(1);
}
