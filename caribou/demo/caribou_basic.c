/***************************************************************************
 *	Copyright © 2005-2011 by Pike Aerospace Research Corporation		   *
 *	info@pikeaero.com													  *
 ***************************************************************************/

#include <caribou.h>
#include <caribou/lib/queue.h>

#define THREAD_STACK_SIZE	512
#define QUEUE_DEPTH			4
#define	MESSAGE_SZ			128

char stack_thread1[THREAD_STACK_SIZE];
char stack_thread2[THREAD_STACK_SIZE];
char stack_thread3[THREAD_STACK_SIZE];
caribou_mutex_t mutex_a;
caribou_queue_t* queue_a;
int global_a=0;
int nlen=0;

/* get here on heap allocation failure */
void notify_heap_alloc_failed(size_t size)
{
	for(;;);
}

void threadfn1(void* arg)
{
	for(;;)
	{
		char* message_a;
		for( int n=0; n < QUEUE_DEPTH; n++ )
		{
			if ( ( message_a = (char*)malloc(MESSAGE_SZ) ) )
			{
				memset(message_a,'A'+n,MESSAGE_SZ);
				message_a[MESSAGE_SZ-1]='\0';
				nlen += strlen(message_a);
			}
			caribou_queue_post(queue_a,message_a);
		}
		caribou_mutex_lock(&mutex_a,0);
		++global_a;
		caribou_mutex_unlock(&mutex_a);
	}
}

void threadfn2(void* arg)
{
	for(;;)
	{
		char* message_a;
		caribou_queue_fetch(queue_a,&message_a);
		free(message_a);
		caribou_mutex_lock(&mutex_a,0);
		--global_a;
		caribou_mutex_unlock(&mutex_a);
	}
}

void threadfn3(void* arg)
{
	for(;;)
	{
		caribou_thread_lock();
		--global_a;
		caribou_thread_unlock();
	}
}

int main(int argc,char* argv[])
{
	caribou_init(0);
	printf( "CARIBOU V%s Demo\n", caribou_version() );
	caribou_mutex_init(&mutex_a,0);
	queue_a = caribou_queue_new(QUEUE_DEPTH);
	caribou_thread_create("enqueue_thread",threadfn1,NULL,NULL,stack_thread1,THREAD_STACK_SIZE,1);
	caribou_thread_create("dequeue_thread",threadfn2,NULL,NULL,stack_thread2,THREAD_STACK_SIZE,1);
	caribou_thread_create("lock_thread",threadfn3,NULL,NULL,stack_thread3,THREAD_STACK_SIZE,1);
	caribou_exec();
}
