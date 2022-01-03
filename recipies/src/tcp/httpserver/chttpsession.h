#ifndef _PIKEAERO_CHTTPSESSION_H_
#define _PIKEAERO_CHTTPSESSION_H_

#include <caribou++/cthread.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/ctcpsession.h>
#include <caribou++/cmutex.h>
#include <caribou/kernel/timer.h>
#include <caribou++/cspinlock.h>
#include <caribou++/clist.h>
#include <chttprequest.h>
#include <cmimetype.h>
#include <caribou++/clist.h>
#include <chttpstring.h>

namespace PikeAero
{

	/***************************************************************************
	*                    HTTP PROTOCOL SESSION THREAD                          *
	****************************************************************************/
	class CHttpSession : public CARIBOU::CTcpSession
	{
		friend class CHttpServer;
		public:
	
			CHttpSession(	
							int sockfd, 
							const char* name=PRODUCT_HTTP_SESSION_NAME, 
							size_t stksize=PRODUCT_HTTP_THREAD_STK_SZ, 
							uint16_t priority=PRODUCT_HTTP_SESSION_PRIO,
							uint16_t watchdog_count=PRODUCT_HTTP_WD_COUNT
						);
			virtual ~CHttpSession();

		protected:

			virtual void		enter();
			virtual void		leave();

			virtual void		renderBody() {};

			virtual void		renderHeader();
			virtual void		renderFooter();

			virtual void		render404();

			int					send(const char* buf);
			int					send(CARIBOU::CString& buf);
			int					send( void );

			void				renderTableRowStart(const char* title);
			void				renderTableRowEnd();
			void				renderTextInputBox(const char* name, const char* value);

			void				renderMacAddress(const char* name, const char* title, CARIBOU::CString macs, bool input=true);
			void				renderIPV4Address(const char* name, const char* title, uint8_t* ip, bool input=true);
			void				renderInteger(const char* name, const char* title, int integer, int min, int max, bool input=true);
			
			void				renderComboBox(const char* name, const char* title, int selected, const char* options[]);
			void				renderComboBox(const char* name, const char* title, const char* selected, const char* options[]);

			void				renderCheckBox(const char* name, const char* title, int checked);

			void				htmlTextInput(const char* name, 
												int seq, 
												int maxlen, 
												int size, 
												CARIBOU::CString defaultValue,
												CARIBOU::CString* actualValue, 
												bool enabled);

			void				renderFault(CARIBOU::CString msg);

			CHttpString&		postData() 		{ return mPostData; }
			CARIBOU::CString&	sendBuffer() 	{ return mSendBuffer; }
			CARIBOU::CString&	path()			{ return mPath; }

		private:

			void				run();

			void				render();

			int					flush(size_t size);

			int					readHeaderLine(CARIBOU::CString& line);
			CARIBOU::CString	extractHeaderPath(int skipLeft, CARIBOU::CString& line);
			int					readPostData();
			bool				parseHeader();

			void				sendHTTPResponse(const char* code, const char* msg, const char* mime);

			static CARIBOU::CMutex		mMutex;				/* Session limiting mutex */

			CARIBOU::CString			mSendBuffer;		/* buffered send data */
			CARIBOU::CString			mPath;				/* The HTTP path */
			CHttpString					mPostData;			/* raw posted data */
	};

}

#endif
