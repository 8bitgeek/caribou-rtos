/*****************************************************************************
* Copyright (c) 2015 by Pike Aero Corp                                       *
* All Rights Reserved                                                        *
*****************************************************************************/
#ifndef _PIKEAERO_CFTPSESSION_H_
#define _PIKEAERO_CFTPSESSION_H_

#include <caribou++/ctcpsession.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/cmutex.h>
#include <caribou/kernel/timer.h>
#include <caribou++/clist.h>
#include <caribou++/cstring.h>
#include <cdirpath.h>

namespace PikeAero
{
	/***************************************************************************
	*                    FTP PROTOCOL SESSION THREAD                           *
	****************************************************************************/
	class CFtpSession : public CARIBOU::CTcpSession
	{
		friend class CFtpServer;
		public:
	
			CFtpSession( int sockfd,  
                        const char* name="ftp",
                        CARIBOU::CString rootPath="/",
                        uint32_t stksize=2048, 
                        uint16_t priority=1, 
                        uint16_t watchdog_count=0 );
			virtual ~CFtpSession();

		protected:

			virtual void			run();
			void					enter();
			void					leave();

			int						raiseError(int err); 

			CARIBOU::CAbstractSocket*	commandSocket()		{return socket();}
			CARIBOU::CTcpSocket*	dataSocket()		{return mDataSocket;}

			int						send(CARIBOU::CAbstractSocket* sock,char *msg);
			int						send(CARIBOU::CAbstractSocket* sock,char *msg,int len);

			void					sendWelcome();
			CARIBOU::CString		parseCommand(CARIBOU::CByteArray& message,CARIBOU::CString& arg);
			int						recv(CARIBOU::CByteArray& message,int bytesAvailable,uint32_t timeout);
			int						processMessages(int bytesAvailable);
			int						openDataConnection(); 
			void					closeDataConnection();
			bool					parseDataPort(CARIBOU::CString port);
			bool					parseExtendedDataPort(CARIBOU::CString port);
			void					listCommon(CARIBOU::CString arg, bool shortlist);
			uint16_t				nextDataPort();

			void					cmd_user(CARIBOU::CString user);
			void					cmd_pass(CARIBOU::CString pass);
			void					cmd_port(CARIBOU::CString port);
			void					cmd_eprt(CARIBOU::CString port);
			void					cmd_quit();
			void					cmd_cwd(CARIBOU::CString arg);
			void					cmd_cdup(CARIBOU::CString arg);
			void					cmd_pwd();
			void					cmd_nlst(CARIBOU::CString arg);
			void					cmd_list(CARIBOU::CString arg);
			void					cmd_retr(CARIBOU::CString arg);
			void					cmd_stor(CARIBOU::CString arg);
			void					cmd_noop();
			void					cmd_syst();
			void					cmd_abrt();
			void					cmd_type(CARIBOU::CString arg);
			void					cmd_mode();
			void					cmd_rnfr();
			void					cmd_rnto();
			void					cmd_mkd(CARIBOU::CString arg);
			void					cmd_rmd(CARIBOU::CString arg);
			void					cmd_dele(CARIBOU::CString arg);
			void					cmd_pasv();
			void					cmd_size(CARIBOU::CString arg);
			void					cmd_appe();
			void					cmd_rest(CARIBOU::CString arg);
				
		private:

            CARIBOU::CString		mRootPath;		/* Root of FTP path */
            uint16_t				mDataPort;		/* Data Port */
			uint8_t					mRemoteIp[4];	/* Data IP Address */
            bool					mIsAnonymous;	/* Is this an anonymous login? */
			CARIBOU::CString		mUser;			/* User Login. */
			CARIBOU::CString		mPass;			/* User Password.  */
			CDirPath				mDirPath;		/* the directory path manipulator. */
			bool					mPasvActive;	/* pasv data is active? */
			uint16_t				mPasvPort;		/* pasv port. */
			uint32_t				mRestOffset;	/* File-transfer restart point. */
			CARIBOU::CString		mType;			/* File-transfer type. */
			uint16_t				mNextDataPort;	/* Next Data Port */
			bool					mReadyToClose;	/* Ready to cloes? */
			void*					mTimer;
			CARIBOU::CTcpSocket*	mDataSocket;
			CARIBOU::CTcpSocket*	mListenSocket;
			int						mErrno;
			bool					mValidated;
	};

}

#endif
