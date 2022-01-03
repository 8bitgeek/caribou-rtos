#include <chttpsession.h>
#include <chttpstring.h>
#include <coctetarray.h>

#define HTTP_HEADER_TIMEOUT		(3000)		/* Timeout waiting for HTTP header */
#define HTTP_TRANSMIT_DELAY		(20)		/* Small Transmit delay to avoid flooding LwIP */

namespace PikeAero
{
	#define inherited CARIBOU::CTcpSession

	CARIBOU::CMutex		CHttpSession::mMutex(CARIBOU_MUTEX_F_RECURSIVE);

	CHttpSession::CHttpSession( 
								int sockfd, 
								const char* name, 
								size_t stksize, 
								uint16_t priority,
                                uint16_t watchdog_count
							  )
	: inherited(sockfd,(char*)name,stksize,priority,watchdog_count)
	{
	}

	CHttpSession::~CHttpSession()
	{
	}

	int CHttpSession::flush(size_t size)
	{
		int rc=0;
		if ( mSendBuffer.length() >= size )
		{
			#if PRODUCT_DEBUG_HTTP_SESSION
				fprintf(stderr,"CHttpSession::flush(%d)\n",mSendBuffer.length());
			#endif
			while(mSendBuffer.length()>0)
			{
				rc = socket()->send(mSendBuffer.data(),mSendBuffer.size()-1);
				if ( rc > 0 && rc < (int)mSendBuffer.length() )
				{
					mSendBuffer.remove(0,rc);
				}
				else
				{
					#if PRODUCT_DEBUG_HTTP_SESSION
						fprintf(stderr,"CHttpSession::flush(%d) errno=%d\n",mSendBuffer.length(),errno);
					#endif
					mSendBuffer.clear();
				}
			}
			//sleep(HTTP_TRANSMIT_DELAY);	/* give the TCP stack a little break. */
		}
		return rc;
	}

	int CHttpSession::send(void)
	{
		return flush(PRODUCT_HTTP_SEND_BUFFER_SZ);
	}

	int CHttpSession::send(const char* buf)
	{
		int rc=0;
		#if 1
			mSendBuffer.append(buf);
			rc = flush(PRODUCT_HTTP_SEND_BUFFER_SZ);
		#else
			rc = socket()->send((char*)buf);
		#endif
		return rc;
	}

	int CHttpSession::send(CARIBOU::CString& buf)
	{
		int rc = send(buf.data());
		return rc;
	}

	void CHttpSession::enter()
	{
		mMutex.lock();
		socket()->setNoDelay(true);
		#if PRODUCT_DEBUG_HTTP_SESSION
			fprintf(stderr,">>>>CHttpSession::enter() isRunnable()==%d isRunning()==%d\n",CModbusServer::isRunnable(),CModbusServer::isRunning());
		#endif
		caribou_thread_sleep_current(100);
	}

	void CHttpSession::leave()
	{
		flush(0);
		socket()->close();					/* close the socket conn */
		caribou_thread_sleep_current(100);
		#if PRODUCT_DEBUG_HTTP_SESSION
			fprintf(stderr,">>>>CHttpSession::leave() isRunnable()==%d isRunning()==%d\n",CModbusServer::isRunnable(),CModbusServer::isRunning());
		#endif
		mMutex.unlock();
	}

	void CHttpSession::run()
	{
		enter();
		render();
		leave();
	}

	void CHttpSession::render()
	{
		if ( parseHeader() )
		{
			#if PRODUCT_DEBUG_HTTP_SESSION
				debug_printf("path='%s'\n",mPath.data());
			#endif
			if ( mPath == PRODUCT_HTTP_ROOT )
			{
				sendHTTPResponse("200","OK","text/html");
				renderHeader();
				renderBody();
				renderFooter();
				send("\r\n");
			}
			else
			{
				render404();
			}
		}
		//else
		//{
		//	render404();
		//}
	}

	/**
	 * @brief Read a trimmed line of HTTP header from the input.
	 * @param Trimmed line of text that will be returned.
	 * @return Length of line or -1 on EOF or Err.
	 */
	int CHttpSession::readHeaderLine(CARIBOU::CString& line)
	{
		int rc=(-1);
		uint8_t ch='\0';
        caribou_tick_t start;

		line.clear();

		/* Wait for something that looks like header data, or timeout while waiting... */
		for( start = timerTicks(); ch != '\n' &&  !timerTimeout(start,from_ms(HTTP_HEADER_TIMEOUT)); )
		{
			int count;
			if ( (count=socket()->bytesAvailable()) > 0 )
			{
				for(int n=0; ch != '\n' && n < count; n++)
				{
					if ( socket()->recv((char*)&ch,1) == 1 )
					{
						line.append((char)ch);
					}
				}
				start = timerTicks();
			}
			watchdogFeed();
		}
		if ( ch == '\n' )
		{
			#if PRODUCT_DEBUG_HTTP_SESSION
				debug_printf("%s",line.data());
			#endif
			line.trim();
			rc = line.length();
		}
		return rc;
	}

	/**
	 * @brief Extract the path from the input.
	 */
	CARIBOU::CString CHttpSession::extractHeaderPath(int skipLeft, CARIBOU::CString& line)
	{
		CARIBOU::CString path;
		int pos;
		path = line.right(line.length()-skipLeft);
		path.trim();
		/* trim off the "HTTP/1.x" part... */
		pos = path.find(' ');
		if ( pos >= 0 )
		{
			path = path.left(pos);
		}
		return path;
	}

	/**
	 * @brief Read the post data string.
	 */
	int CHttpSession::readPostData()
	{
		int rc=0;
		mPostData.clear();
		while(socket()->bytesAvailable() > 0 )
		{
			CARIBOU::CString tmp;
			rc = socket()->read(tmp,socket()->bytesAvailable());
			mPostData.append(tmp);
			watchdogFeed();
		}
		#if PRODUCT_DEBUG_HTTP_SESSION
			debug_printf("%s\n",mPostData.data());
		#endif
		return rc;
	}

	/**
	 * @brief Parse out the important bits of the header that we're interested in.
	 * @param The path extracted from the header.
	 * @return true if the header was parsed correctly.
	 */
	bool CHttpSession::parseHeader()
	{
		bool rc = false;
		CARIBOU::CString line;
		bool post=false;
		do
		{
			readHeaderLine(line);
			if ( line.left(4).casecompare("GET ") == 0 )
			{
				mPath = extractHeaderPath(4,line);
				rc=true;
			}
			if ( line.left(5).casecompare("POST ") == 0 )
			{
				mPath = extractHeaderPath(5,line);
				post = true;
				rc = true;
			}
		} while (!line.isEmpty() && !(line == "\r\n") );
		if ( post )
		{
			readPostData();
		}
		return rc;
	}

	void CHttpSession::renderTableRowStart(const char* title)
	{
		mSendBuffer.asprintf("<tr><td>%s:</td><td>",title);
		send();
	}

	void CHttpSession::renderTableRowEnd()
	{
		mSendBuffer.asprintf("</td></tr>\n");	
		send();
	}

	void CHttpSession::renderTextInputBox(const char* name, const char* value)
	{
		mSendBuffer.asprintf("<input type=\"text\" name=\"%s\" value=\"%s\" />",name,value);
		send();
	}

	void CHttpSession::render404()
	{
		sendHTTPResponse("404","Not Found","text/html");
		send("<html><head><title>404 Error</title></head><body>404 Error</body></html>\n");
	}

	void CHttpSession::sendHTTPResponse(const char* code, const char* msg, const char* mime)
	{
		mSendBuffer.asprintf( "HTTP/1.1 %s %s\r\n"
					  "Server: %s/%s (CARIBOU++)\r\n"
					  "Content-Type: %s\r\n"
					  "Connection: Closed\r\n"
					  "\r\n",
					  code,
					  msg,
                      PRODUCT_HTTP_SERVER_NAME,PRODUCT_VERSION,
					  mime);
		send();
	}

	void CHttpSession::renderHeader()
	{
		send( "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n"
					  "<html xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\">\n"
					  " <head>\n"
					  " <style>body{font-family:Arial,Helvetica,sans-serif;}table,th,td{border:1px solid black;}h2{font-size:75%;}</style>\n"
					  "  <meta charset=\"ISO-8859-1\">\n");
		mSendBuffer.asprintf("  <title>SONIC-1C</title>\n");
		send( " </head>\n"
					  " <body>\n" );
	}

	void CHttpSession::renderFooter()
	{
		send( "<hr/><div class=\"footer\"><h2>");
		send();
		send( " <a href=\"http://www.8bitgeek.net\" "
					    "target=\"_blank\">8BITGEEK.NET</a></h2></div>\n"
						" </body>\n"
						"</html>\n" );
	}

	void CHttpSession::renderMacAddress(const char* name, const char* title,CARIBOU::CString macs,bool input)
	{
		renderTableRowStart(title);
		renderTextInputBox(name,macs.data());
		renderTableRowEnd();	
	}

	void CHttpSession::renderIPV4Address(const char* name, const char* title,uint8_t* ip,bool input)
	{
		CARIBOU::CString sip;
		sip.sprintf("%d.%d.%d.%d",ip[0],ip[1],ip[2],ip[3]);
		renderTableRowStart(title);
		renderTextInputBox(name,sip.data());
        renderTableRowEnd();
	}

	void CHttpSession::renderInteger(const char* name, const char* title, int integer,int min, int max,  bool input)
	{
		renderTableRowStart(title);
		mSendBuffer.asprintf("<input type=\"number\" name=\"%s\" min=\"%d\" max=\"%d\" value=\"%d\" />",name,min,max,integer);
		send();
        renderTableRowEnd();
	}

	void CHttpSession::renderComboBox(const char* name, const char* title, int selected, const char* options[])
	{
		CARIBOU::CString strSelected;
		strSelected.fromInt(selected);
		renderComboBox(name,title,strSelected.data(),options);
	}

	void CHttpSession::renderComboBox(const char* name, const char* title, const char* selected, const char* options[])
	{
		renderTableRowStart(title);
		mSendBuffer.asprintf("<select name=\"%s\">\n",name);
		send();
		for(int index=0; options[index]!= NULL; index++)
		{
			mSendBuffer.asprintf("<option value=\"%s\" ",options[index]);
			send();
			if ( strcasecmp(options[index],selected) == 0 )
			{
				mSendBuffer.asprintf("selected=\"%s\"",selected);
				send();
			}
			mSendBuffer.asprintf(">%s</option>\n",options[index]);
			send();
		}
		mSendBuffer.asprintf("</select>\n");
        send();
		renderTableRowEnd();
	}

	void CHttpSession::renderCheckBox(const char* name, const char* title, int checked)
	{
		renderTableRowStart(title);
		mSendBuffer.asprintf("<input type=\"checkbox\" name=\"%s\" %s>\n",name,checked?"checked":"");
        send();
		renderTableRowEnd();
	}

	/**
	 * @brief Render a fault message in the table
	 */
	void CHttpSession::renderFault(CARIBOU::CString msg)
	{
		mSendBuffer.asprintf("<tr><td><font color=\"red\">ERROR:</font></td><td><font color=\"red\">%s!</font></td></tr>\n",msg.data());
		send();
	}

	/**
	* Format an html input box. Attempt to populate the value by the field's name from the GET or PUT in the http request header.
	* @param html The html string to add the htmp text to.
	* @param name the html name
	* @param seq the sequence number (-1) if it's a single input box (e.g. not part of a series).
	* @param maxlen html maxlen parameter
	* @param size html size parameter
	* @param defaultValue a value to use if there is no POST or GET value.
	* @return Number of bytes sent.
	*/
	void CHttpSession::htmlTextInput(const char* name, 
										int seq, 
										int maxlen, 
										int size, 
										CARIBOU::CString defaultValue, 
										CARIBOU::CString* actualValue, 
										bool enabled)
	{
		mSendBuffer.asprintf("<input type=\"text\" maxlength=\"%d\" size=\"%d\" name=\"%s\" value=\"%s\" %s/>",
					maxlen,
					size,
					name,
					defaultValue.data(),
					enabled?"":"disabled");
		send();
	}


}

