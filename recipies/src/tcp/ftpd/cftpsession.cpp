/*****************************************************************************
* Copyright (c) 2015 by Pike Aero Corp                                       *
* All Rights Reserved                                                        *
*****************************************************************************/
#include <cftpsession.h>
#include <caribou++/ctcpsocket.h>
#include <caribou++/cstring.h>
#include <caribou++/cfile.h>
#include <caribou++/cmd5.h>
#include <caribou/lib/errno.h>
#include <syslog_printf.h>
#include <lwip/api.h>
#include <network.h>
#include <net.h>

#define FTP_SRV_ROOT		"/"
#define FTP_USER			"guest"
#define FTP_PASSWORD		"guest"
#define FTP_WELCOME_MSG		"220 MineAirQuality FTP Server\r\n220 \r\n"
#define FTP_BUFFER_SIZE		1024
#define FTP_WELCOM_MAX_SZ	2048
#define FTP_DATA_PORT_MIN	1023
#define	FTP_DATA_PORT_MAX	2048

#define msg110 (char*) "110 MARK %s = %s.\r\n"    
#define msg120 (char*) "120 Service ready in nnn minutes.\r\n"   
#define msg125 (char*) "125 Data connection already open; transfer starting.\r\n"   
#define msg150 (char*) "150 File status okay; about to open data connection.\r\n"    
#define msg150recv (char*) "150 Opening BINARY mode data connection for %s (%i bytes).\r\n"   
#define msg150stor (char*) "150 Opening BINARY mode data connection for %s.\r\n"    
#define msg200 (char*) "200 Command okay.\r\n"   
#define msg202 (char*) "202 Command not implemented, superfluous at this site.\r\n"   
#define msg211 (char*) "211 System status, or system help reply.\r\n"   
#define msg212 (char*) "212 Directory status.\r\n"   
#define msg213 (char*) "213 .\r\n"   
#define msg214 (char*) "214 MineAirQuality.\r\n"
#define msg214SYST (char*) "214 MineAirQuality system type.\r\n"   
#define msg220 (char*) "220 MineAirQuality FTP Server ready.\r\n"     
#define msg221 (char*) "221 Goodbye.\r\n"    
#define msg225 (char*) "225 Data connection open; no transfer in progress.\r\n"   
#define msg226 (char*) "226 Closing data connection.\r\n"    
#define msg227 (char*) "227 Entering Passive Mode (%d,%d,%d,%d,%d,%d).\r\n"    
#define msg230 (char*) "230 User logged in, proceed.\r\n"   
#define msg250 (char*) "250 Requested file action okay, completed.\r\n"   
#define msg257PWD (char*) "257 \"%s\" is current directory.\r\n"   
#define msg257 (char*) "257 \"%s\" created.\r\n"   
#define msg331 (char*) "331 User name okay, need password.\r\n"   
#define msg332 (char*) "332 Need account for login.\r\n"   
#define msg350 (char*) "350 Requested file action pending further information.\r\n"   
#define msg421 (char*) "421 Service not available, closing control connection.\r\n"    
#define msg425 (char*) "425 Can't open data connection.\r\n"   
#define msg426 (char*) "426 Connection closed; transfer aborted.\r\n"   
#define msg450 (char*) "450 Requested file action not taken.\r\n"   
#define msg451 (char*) "451 Requested action aborted: local error in processing.\r\n"   
#define msg452 (char*) "452 Requested action not taken.\r\n"    
#define msg500 (char*) "500 Syntax error, command unrecognized.\r\n"    
#define msg501 (char*) "501 Syntax error in parameters or arguments.\r\n"   
#define msg502 (char*) "502 Command not implemented.\r\n"   
#define msg503 (char*) "503 Bad sequence of commands.\r\n"   
#define msg504 (char*) "504 Command not implemented for that parameter.\r\n"   
#define msg530 (char*) "530 Not logged in.\r\n"   
#define msg532 (char*) "532 Need account for storing files.\r\n"   
#define msg550 (char*) "550 Requested action not taken.\r\n"   
#define msg551 (char*) "551 Requested action aborted: page type unknown.\r\n"   
#define msg552 (char*) "552 Requested file action aborted.\r\n"   
#define msg553 (char*) "553 Requested action not taken.\r\n"   

namespace MineAirQuality
{
	#define inherited CARIBOU::CTcpSession

	CFtpSession::CFtpSession( int sockfd, const char* name, CARIBOU::CString rootPath, uint32_t stksize, uint16_t priority, uint16_t watchdog_count )
	: inherited(sockfd,(char*)name,stksize,priority,watchdog_count)
	, mRootPath(rootPath)
	, mPasvActive(0)
	, mPasvPort(0)
	, mRestOffset(0)
	, mNextDataPort(FTP_DATA_PORT_MIN)
	, mReadyToClose(false)
	, mTimer(NULL)
	, mDataSocket(NULL)
	, mListenSocket(NULL)
	, mErrno(0)
	, mValidated(false)
	{
	}

	CFtpSession::~CFtpSession()
	{
		leave();
	}

	void CFtpSession::enter()
	{
		//socket()->setBlocking(false);
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FTP session enter");
        sendWelcome();
	}

	void CFtpSession::leave()
	{
		if ( mDataSocket )
		{
			delete mDataSocket;
			mDataSocket = NULL;
		}
		if ( mListenSocket )
		{
			delete mListenSocket;
			mListenSocket = NULL;
		}
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FTP session leave");
	}

	/**
	 * @brief The main thread run method...
	 */
	void CFtpSession::run()
	{
		int rc;
		CARIBOU::CByteArray rawRequest;
		enter();
		while(mErrno==0)
		{
			char bytes[64];
			if ( (rc=commandSocket()->peek(bytes,64)/*commandSocket()->bytesAvailable()*/) > 0 )
			{
				processMessages(rc);
			}
			else if ( rc <= 0 && errno !=EAGAIN )
			{
				mErrno=(-1); // terminate
			}
			yield();
		}
		leave();
	}

	/**
	 * Set the error code
	 */
	int CFtpSession::raiseError(int err) 
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FTP session %08X error %d",err);
		return -err;
	}

	 /**
	 * Send reply to the client socket, given the reply.
	 */
	int CFtpSession::send(CARIBOU::CAbstractSocket* sock, char *msg) 
	{
		int rc;
		do 
		{ 
			rc=sock->send(msg, strlen(msg), NETCONN_COPY);
			//rc=sock->write(msg, strlen(msg));
			if ( rc < 0 )
			{
				if ( errno != EAGAIN )
				{
					sock->close();
					rc=raiseError(4);
				
				}
			}
		} while ( rc < 0 && errno != EAGAIN );
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FTP session %08X send '%s'",this,msg);
		return rc;
	}

	/**
	 * Send single reply to the client socket, given the reply and its length.
	 */
	int CFtpSession::send(CARIBOU::CAbstractSocket* sock, char *msg, int len) 
	{
		int rc;
		do 
		{ 
			rc=sock->send(msg, len, NETCONN_COPY);
			//rc=sock->write(msg, len);
			if ( rc < 0 )
			{
				if ( errno != EAGAIN )
				{
					sock->close();
					rc=raiseError(4);
				}
			}
		} while ( rc < 0 && errno != EAGAIN );
		return rc;
	}

	void CFtpSession::sendWelcome()
	{
		const char* line = "220 *** MineAirQuality FTP Server ***\r\n";
		if ( this->send(commandSocket(),(char*)line) < 0 )
		{
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FTP session %08X send '%s' failed",this,line);
		}
	}

	/**
	 * @brief Parse an incoming command message
	 * @param message The raw input message.
	 */
	CARIBOU::CString CFtpSession::parseCommand(CARIBOU::CByteArray& message,CARIBOU::CString& arg)
	{
		CARIBOU::CString rc;
		size_t index;
		for(index=0; index < message.size() && ((message.at(index) >= 'A' && message.at(index) <= 'Z') || (message.at(index) >= 'a' && message.at(index) <= 'z')); index++)
		{
			rc.append(message.at(index));
		}
		/* check for arguments... */
		arg.clear();
		if ( message.at(index++) == ' ' )
		{
			for(; index < message.size() && message.at(index) != '\r' && message.at(index) != '\n'; index++)
			{
				arg.append(message.at(index));
			}
		}
		return rc;
	}

	/**
	  * @brief Receive a command up to the line-feed, and allow for a timeout situation.
	  */
	int CFtpSession::recv(CARIBOU::CByteArray& message,int bytesAvailable,uint32_t timeout)
	{
		if ( bytesAvailable > 0 )
		{
			if ( commandSocket()->recv(message,bytesAvailable) == bytesAvailable )
			{
				caribou_tick_t start = caribou_timer_ticks();
				while( message.at(message.length()-1) != '\n' && !caribou_timer_ticks_timeout(start,timeout))
				{
					if((bytesAvailable=commandSocket()->bytesAvailable())>0)
					{
						CARIBOU::CByteArray moreBytes;
						if ( commandSocket()->recv(moreBytes,bytesAvailable) == bytesAvailable )
						{
							message.append(moreBytes);
							start = caribou_timer_ticks();
						}
					}
				}
			}
		}
		return message.length();
	}

	int CFtpSession::processMessages(int bytesAvailable)
	{
		int rc=0;
		CARIBOU::CByteArray message;
		if ( bytesAvailable > 0 )
		{
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "ftp bytes available %d",bytesAvailable);
			if ( recv(message,bytesAvailable,3000) >= bytesAvailable )
			{
				CARIBOU::CString arg;
				CARIBOU::CString command = parseCommand(message,arg);
				command.toUpper();
				SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FTP command='%s' arg='%s'",command.data(),arg.data());
				if ( command.casecompare("USER") == 0 ) cmd_user(arg);
				else if ( command.casecompare("PASS") == 0 ) cmd_pass(arg);
				else if ( command.casecompare("QUIT") == 0 ) cmd_quit();
				else if ( command.casecompare("PORT") == 0 ) cmd_port(arg);
				else if ( command.casecompare("EPRT") == 0 ) cmd_eprt(arg);
				else if ( command.casecompare("BYE")  == 0 ) cmd_quit();
				else if ( command.casecompare("CWD")  == 0 ) cmd_cwd(arg);
				else if ( command.casecompare("CDUP") == 0 ) cmd_cdup(arg);
				else if ( command.casecompare("PWD")  == 0 ) cmd_pwd();
				else if ( command.casecompare("XPWD") == 0 ) cmd_pwd();
				else if ( command.casecompare("NLST") == 0 ) cmd_nlst(arg);
				else if ( command.casecompare("LIST") == 0 ) cmd_list(arg);
				else if ( command.casecompare("RETR") == 0 ) cmd_retr(arg);
				else if ( command.casecompare("STOR") == 0 ) cmd_stor(arg);
				else if ( command.casecompare("NOOP") == 0 ) cmd_noop();
				else if ( command.casecompare("SYST") == 0 ) cmd_syst();
				else if ( command.casecompare("ABOR") == 0 ) cmd_abrt();
				else if ( command.casecompare("TYPE") == 0 ) cmd_type(arg);
				else if ( command.casecompare("MODE") == 0 ) cmd_mode();
				else if ( command.casecompare("RNFR") == 0 ) cmd_rnfr();
				else if ( command.casecompare("RNTO") == 0 ) cmd_rnto();
				else if ( command.casecompare("MKD")  == 0 ) cmd_mkd(arg);
				else if ( command.casecompare("XMKD") == 0 ) cmd_mkd(arg);
				else if ( command.casecompare("RMD")  == 0 ) cmd_rmd(arg);
				else if ( command.casecompare("XRMD") == 0 ) cmd_rmd(arg);
				else if ( command.casecompare("DELE") == 0 ) cmd_dele(arg);
				else if ( command.casecompare("PASV") == 0 ) cmd_pasv();
				else if ( command.casecompare("SIZE") == 0 ) cmd_size(arg);
				else if ( command.casecompare("APPE") == 0 ) cmd_appe();
				else if ( command .casecompare("REST") == 0 ) cmd_rest(arg);
				else 
				{
					send(commandSocket(), msg502);
				}
			}
		}
		return rc;
	}

	void CFtpSession::listCommon(CARIBOU::CString arg, bool shortlist)
	{
		bool rc=false;
		if( mDirPath.isDir() )
		{
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "mDirPath='%s'",mDirPath.path().data());
			if ( mPasvActive )
			{
				if ( mDataSocket )
				{
					delete mDataSocket;
					mDataSocket = NULL;
				}
				int dataSocket = mListenSocket->accept();
				if ( dataSocket >= 0 )
				{
					mDataSocket = new CARIBOU::CTcpSocket(dataSocket);
					send(commandSocket(), msg150);
                    rc=true;
				}
			}
			else
			{
				if (openDataConnection()==0)
				{
					send(commandSocket(), msg150);
					rc=true;
				}
				else
				{
					send(commandSocket(), msg451);
				}
			}

			if (rc)
			{
				SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "DIR %s",mDirPath.data());
				CARIBOU::CList<CARIBOU::CString*>* dirList = mDirPath.dirList(shortlist);
				for(size_t n=0; n < dirList->count(); n++)
				{
					CARIBOU::CString* file = dirList->at(n);
					file->trim();
					file->append("\r\n");
					mDataSocket->send(file->data());
					file->trim();
					SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "FILE %s",file->data());
				}
                send(commandSocket(), msg226);
				dirList->dispose();
				dirList->clear();
				delete dirList;
				closeDataConnection();
			}
			else
			{
				SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "data connection failed");
				send(commandSocket(), msg451);
			}
		}
		else
		{
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "(no dir) mDirPath='%s'",mDirPath.data());			
		}
	}

    uint16_t CFtpSession::nextDataPort()
	{
		if ( mNextDataPort > FTP_DATA_PORT_MAX )
			mNextDataPort = FTP_DATA_PORT_MIN;
		return mNextDataPort++;
	}
  
	/** @return 0 on success */
	int CFtpSession::openDataConnection()   
	{   
		int rc(-1);
		if ( mPasvActive )
		{
			if ( mListenSocket )
			{
				delete mListenSocket;
				mListenSocket = NULL;
			}
			mListenSocket = new CARIBOU::CTcpSocket;
			if ( mListenSocket )
			{
				if ( mListenSocket->bind(mListenSocket->localAddressString(),(mDataPort=nextDataPort())) == 0 )
				{
					for(int n=0; n < 3000; n++)
                    {
                        rc=mListenSocket->listen(8);
                        if ( rc == 0 )
                            break;
						yield();
                    }
					SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "openDataConnection(%d) rc=%d",mDataPort,rc);
				}
                else
                {
					SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "bind failed");
                }
			}
		}
		else
		{
			mDataSocket = new CARIBOU::CTcpSocket();
			if ( mDataSocket )
			{
				CARIBOU::CString host;
				host.sprintf("%d.%d.%d.%d",mRemoteIp[0],mRemoteIp[1],mRemoteIp[2],mRemoteIp[3]);
				SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "openDataConnection(%d.%d.%d.%d:%d)",mRemoteIp[0],mRemoteIp[1],mRemoteIp[2],mRemoteIp[3],mDataPort);
				if ( mDataSocket->connectToHost(host, mDataPort) == 0 )
				{
				    SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "->%d.%d.%d.%d:%d OK",mRemoteIp[0],mRemoteIp[1],mRemoteIp[2],mRemoteIp[3],mDataPort);
					rc=0;
				}
				else
				{
				    SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "->%d.%d.%d.%d:%d FAIL",mRemoteIp[0],mRemoteIp[1],mRemoteIp[2],mRemoteIp[3],mDataPort);
					delete mDataSocket;
					mDataSocket=NULL;
				}
			}
		}
		return rc;
	}   
  
	void CFtpSession::closeDataConnection()
	{
		if ( mDataSocket )
		{
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "close mDataSocket");
			mDataSocket->close();
			delete mDataSocket;
			mDataSocket = NULL;
		}
		if ( mListenSocket )
		{
        	SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "close mListenSocket");
			mListenSocket->close();
			delete mListenSocket;
			mListenSocket=NULL;
		}
	}

    bool CFtpSession::parseDataPort(CARIBOU::CString port)
	{
		bool rc=false;
		CARIBOU::CList<CARIBOU::CString*> parts = port.explode(',');
		if ( parts.count() == 6 )
		{
			mRemoteIp[0] = parts.at(0)->toUInt();
			mRemoteIp[1] = parts.at(1)->toUInt();
			mRemoteIp[2] = parts.at(2)->toUInt();
			mRemoteIp[3] = parts.at(3)->toUInt();
			mDataPort = parts.at(4)->toUInt()<<8 | parts.at(5)->toUInt();
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "dataPort(%d.%d.%d.%d:%d)",mRemoteIp[0],mRemoteIp[1],mRemoteIp[2],mRemoteIp[3],mDataPort);
			rc=true;
		}
		parts.dispose();
		parts.clear();
		return rc;
	}

	/**
	 * @brief Parse as EPRT |1|132.235.1.2|6275|
	 */
    bool CFtpSession::parseExtendedDataPort(CARIBOU::CString port)
	{
		bool rc=false;
		CARIBOU::CList<CARIBOU::CString*> parts = port.explode('|');
		if ( parts.count() == 3 && parts.at(0)->toInt()==1 )
		{
			CARIBOU::CList<CARIBOU::CString*> ipParts = parts.at(1)->explode('.');
			if ( ipParts.count() == 4 )
			{
				mRemoteIp[0] = ipParts.at(0)->toUInt();
				mRemoteIp[1] = ipParts.at(1)->toUInt();
				mRemoteIp[2] = ipParts.at(2)->toUInt();
				mRemoteIp[3] = ipParts.at(3)->toUInt();
				mDataPort = parts.at(2)->toUInt();
				SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "dataPort(%d.%d.%d.%d:%d)",mRemoteIp[0],mRemoteIp[1],mRemoteIp[2],mRemoteIp[3],mDataPort);
				rc=true;
			}
			ipParts.dispose();
			ipParts.clear();
		}
		parts.dispose();
		parts.clear();
		return rc;
	}

	void CFtpSession::cmd_user(CARIBOU::CString user)
	{
		/* Validate the user */
        if ( user == FTP_USER )
		{
			mUser = user;
			send(commandSocket(),msg331);
		}
		else
		{
			send(commandSocket(),msg332);
		}
	}

	void CFtpSession::cmd_pass(CARIBOU::CString pass)
	{
		/* Validate the user + password */
        if ( pass == FTP_PASSWORD )
		{
			mPass = pass;
			send(commandSocket(),msg230);
			mDirPath.setPath("/");  
		}
		else
		{
			send(commandSocket(),msg530);
		}
	}

	void CFtpSession::cmd_port(CARIBOU::CString port)
	{
		mPasvActive=false;
		if ( parseDataPort(port) )
		{
			send(commandSocket(),msg200);
		}
		else
		{
			send(commandSocket(),msg501);
		}
	}

	/**
	 *	The following command shows how to specify the server to use an IPv4 address to open a data connection to host 132.235.1.2 on TCP port 6275:
	 *	EPRT |1|132.235.1.2|6275|
	 *	The following command shows how to specify the server to use an IPv6 network protocol and a network address to open a TCP data connection on port 5282:
	 *	EPRT |2|1080::8:800:200C:417A|5282|
	 *	In this mode, FTP ALG focuses only on the EPRT command; it extracts the IPv6 address and port from the EPRT command and opens the pinhole.
	 */
	void CFtpSession::cmd_eprt(CARIBOU::CString port)
	{
		mPasvActive=false;
		if ( parseExtendedDataPort(port) )
		{
			send(commandSocket(),msg200);
		}
		else
		{
			send(commandSocket(),msg501);
		}
	}

	void CFtpSession::cmd_quit()
	{
		closeDataConnection();
		send(commandSocket(),msg221);
		mReadyToClose=true;
	}

	void CFtpSession::cmd_cwd(CARIBOU::CString arg)
	{
		if ( mDirPath.cd(arg) )
			send(commandSocket(),msg250);
		else
			send(commandSocket(),msg550);
	}

	void CFtpSession::cmd_cdup(CARIBOU::CString arg)
	{
		if ( mDirPath.cdup(arg) )
			send(commandSocket(),msg250);
		else
			send(commandSocket(),msg550);
	}

	void CFtpSession::cmd_pwd()
	{
		CARIBOU::CString msg;
		msg.sprintf(msg257PWD,mDirPath.path().data());
		send(commandSocket(),msg.data());
	}

	void CFtpSession::cmd_nlst(CARIBOU::CString arg)
	{
		listCommon(arg,true);
	}

	void CFtpSession::cmd_list(CARIBOU::CString arg)
	{
		listCommon(arg,false);
	}

	void CFtpSession::cmd_retr(CARIBOU::CString arg)
	{
		bool rc=false;
		if ( mPasvActive  )
		{
			if ( mDataSocket )
			{
				delete mDataSocket;
				mDataSocket = NULL;
			}
			int dataSocket = mListenSocket->accept();
			if ( dataSocket >= 0 )
			{
				mDataSocket = new CARIBOU::CTcpSocket(dataSocket);
				send(commandSocket(), msg150);
				rc=true;
			}
		}
		else
		{
			if (openDataConnection()==0)
			{
				send(commandSocket(),msg150);
				rc=true;
			}
			else
			{
				send(commandSocket(),msg451);
			}
		}
		if ( rc )
		{
			CARIBOU::CString filePath;
			arg.trim();
			if ( arg.length() && arg.at(0) != '/' )
			{
				filePath = mDirPath;
				if ( filePath != "/" )
					filePath += '/';
				filePath += arg;
			}
			else
			{
				filePath = arg;
			}
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "RETR %s",filePath.data());
			CARIBOU::CFile file(filePath);
			if ( file.open(FA_READ) )
			{
				while(!file.eof())
				{
					yield();
					CARIBOU::CByteArray data;
					file.read(data,256);
					mDataSocket->send(data);
				}
				file.close();
			}
			send(commandSocket(),msg226);
			closeDataConnection();
		}
		else
		{
			send(commandSocket(),msg451);
		}
	}

	void CFtpSession::cmd_stor(CARIBOU::CString arg)
	{
		bool rc=false;
		if ( mPasvActive )
		{
			if ( mDataSocket )
			{
				delete mDataSocket;
				mDataSocket = NULL;
			}
			int dataSocket = mListenSocket->accept();
			if ( dataSocket >= 0 )
			{
				mDataSocket = new CARIBOU::CTcpSocket(dataSocket);
				send(commandSocket(), msg150);
				rc=true;
			}
		}
		else
		{
			if (openDataConnection()==0)
			{
				send(commandSocket(),msg150);
				rc=true;
			}
			else
			{
				send(commandSocket(),msg451);
			}
		}
		if ( rc )
		{
			CARIBOU::CString filePath = mDirPath;
			if ( filePath != "/" )
				filePath += '/';
			filePath += arg;
			CARIBOU::CFile file(filePath);
			SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "STOR %s",filePath.data());
			if ( file.open(FA_READ|FA_WRITE|FA_CREATE_ALWAYS) )
			{
                SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "OPEN %s ok (%d)",filePath.data(), mDataSocket->socket() );
				int bytesAvailable=0;
                int totalBytesReceived=0;
				caribou_tick_t start = timerTicks();
				do
				{
					int bytesReceived;
					CARIBOU::CByteArray data;
					bytesAvailable = mDataSocket->bytesAvailable();
					if (bytesAvailable>0)
					{
                        SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "RECV %d (%d)",bytesAvailable,totalBytesReceived);
						if ( (bytesReceived=mDataSocket->recv(data,512)) > 0 )
						{
                            totalBytesReceived += bytesReceived;
 							file.write(data.data(),data.length());
                            SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "WRITE %d (%d)",bytesAvailable,totalBytesReceived);
							start = timerTicks();
						}
					}
                    else if ( bytesAvailable < 0 )
                    {
                        SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "RECV %d (%d)",bytesAvailable,totalBytesReceived);
                        break;
                    }
					else
					{
						yield();
					}
				} while( bytesAvailable >= 0 && !timerTimeout(start,3000) );
				file.close();
			}
            else
            {
                SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "OPEN %s failed",filePath.data() );
            }
			send(commandSocket(),msg226);
			closeDataConnection();
		}
		else
		{
			send(commandSocket(),msg451);
		}
	}

	// void CFtpSession::cmd_stor(CARIBOU::CString arg)
	// {
	// 	bool rc=false;
	// 	if ( mPasvActive )
	// 	{
	// 		if ( mDataSocket )
	// 		{
	// 			delete mDataSocket;
	// 			mDataSocket = NULL;
	// 		}
	// 		int dataSocket = mListenSocket->accept();
	// 		if ( dataSocket >= 0 )
	// 		{
	// 			mDataSocket = new CARIBOU::CTcpSocket(dataSocket);
	// 			send(commandSocket(), msg150);
	// 			rc=true;
	// 		}
	// 	}
	// 	else
	// 	{
	// 		if (openDataConnection()==0)
	// 		{
	// 			send(commandSocket(),msg150);
	// 			rc=true;
	// 		}
	// 		else
	// 		{
	// 			send(commandSocket(),msg451);
	// 		}
	// 	}
	// 	if ( rc )
	// 	{
	// 		CARIBOU::CString filePath = mDirPath;
	// 		if ( filePath != "/" )
	// 			filePath += '/';
	// 		filePath += arg;
	// 		CARIBOU::CFile file(filePath);
	// 		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "STOR %s",filePath.data());
	// 		if ( file.open(FA_READ|FA_WRITE|FA_CREATE_ALWAYS) )
	// 		{
    //             SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "OPEN %s ok (%d)",filePath.data(), mDataSocket->socket() );
	// 			int bytesAvailable=0;
    //             int totalBytesReceived=0;
	// 			caribou_tick_t start = timerTicks();
	// 			do
	// 			{
	// 				int bytesReceived;
	// 				CARIBOU::CByteArray data;
    //                 if ( (bytesReceived=mDataSocket->recv(data,512,MSG_DONTWAIT)) > 0 )
    //                 {
    //                     totalBytesReceived += bytesReceived;
    //                     file.write(data.data(),data.length());
    //                     SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "WRITE %d (%d)",bytesAvailable,totalBytesReceived);
    //                     start = timerTicks();
    //                 }
	// 				else
    //                 {
	// 					yield();
	// 				}
	// 			} while( /* bytesAvailable >= 0 && */ !timerTimeout(start,3000) );
	// 			file.close();
	// 		}
    //         else
    //         {
    //             SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "OPEN %s failed",filePath.data() );
    //         }
	// 		send(commandSocket(),msg226);
	// 		closeDataConnection();
	// 	}
	// 	else
	// 	{
	// 		send(commandSocket(),msg451);
	// 	}
	// }

	/**
	 * @brief Does nothing except return a response. 
	 */
	void CFtpSession::cmd_noop()
	{
		send(commandSocket(), msg200);
	}

	/**
	 * @brief Returns a word identifying the system, the word "Type:", and the default transfer type (as would be set by the TYPE command). For example: UNIX Type: L8
	 */
	void CFtpSession::cmd_syst()
	{
		send(commandSocket(),msg214SYST);
	}

	void CFtpSession::cmd_abrt()
	{
		/* FIXME */
        send(commandSocket(), msg202);
	}

	void CFtpSession::cmd_type(CARIBOU::CString arg)
	{
		mType = arg;
		send(commandSocket(),msg200);
	}

	void CFtpSession::cmd_mode()
	{
		send(commandSocket(),msg502);
	}

	void CFtpSession::cmd_rnfr()
	{
		/* FIXME */
        send(commandSocket(), msg202);
	}

	void CFtpSession::cmd_rnto()
	{
		/* FIXME */
        send(commandSocket(), msg202);
	}

	void CFtpSession::cmd_mkd(CARIBOU::CString arg)
	{
		CARIBOU::CFile file;
		CARIBOU::CString filePath(mDirPath.path());
		arg.trim();
		if ( filePath != "/" )
			filePath += "/";
		filePath += arg;
		file.setPath(filePath);
		if ( file.mkDir() )
			send(commandSocket(), msg200);
		else
			send(commandSocket(), msg450);
	}

	void CFtpSession::cmd_rmd(CARIBOU::CString arg)
	{
		CARIBOU::CFile file;
		CARIBOU::CString filePath(mDirPath.path());
		arg.trim();
		if ( filePath != "/" )
			filePath += "/";
		filePath += arg;
		file.setPath(filePath);
		if ( file.rmDir() )
			send(commandSocket(), msg200);
		else
        	send(commandSocket(), msg450);
	}

	void CFtpSession::cmd_dele(CARIBOU::CString arg)
	{
		CARIBOU::CFile file;
		CARIBOU::CString response;
		CARIBOU::CString filePath(mDirPath.path());
		arg.trim();
		if ( filePath != "/" )
			filePath += "/";
		filePath += arg;
		file.setPath(filePath);
		if( file.unlink() )
			send(commandSocket(),msg250);	// file action taken
		else
			send(commandSocket(),msg450);	// file action not taken
	}

	void CFtpSession::cmd_pasv()
	{
		mPasvActive=true;
		if ( openDataConnection() == 0 )
		{
            network_address_t* local_address = network_get_ip( net_state() );

			CARIBOU::CString pasvMsg;			/** send the listening ip address and port to the client */
			
            pasvMsg.sprintf(msg227,
                            network_address_octet( local_address, 0 ),
                            network_address_octet( local_address, 1 ),
                            network_address_octet( local_address, 2 ),
                            network_address_octet( local_address, 3 ),
							mDataPort>>8,
							mDataPort&0xFF);
			
            send(commandSocket(),pasvMsg.data());
		}
		else
		{
			send(commandSocket(),msg451);
		}
	}

	void CFtpSession::cmd_size(CARIBOU::CString arg)
	{
		CARIBOU::CFile file;
		CARIBOU::CString response;
		CARIBOU::CString filePath(mDirPath.path());
		arg.trim();
		if ( filePath != "/" )
			filePath += "/";
		filePath += arg;
		file.setPath(filePath);
		if ( file.open(FA_OPEN_EXISTING | FA_READ) )
		{
			response.sprintf("213 %d\r\n",file.size());
			file.close();
			send(commandSocket(),response.data());
		}
		else
		{
			send(commandSocket(),msg450);	// file action not taken
		}
	}

	void CFtpSession::cmd_appe()
	{
		/* FIXME */
        send(commandSocket(), msg202);
	}

	void CFtpSession::cmd_rest(CARIBOU::CString arg)
	{
		mRestOffset = arg.toUInt();
		send(commandSocket(),msg200);
	}

}

