#include <cmimetype.h>

namespace PikeAero
{
	#define inherited CARIBOU::CString

	CMimeType::CMimeType()
	 : inherited()
	{
	}

	CMimeType::CMimeType( const char* str, int len )
	: inherited()
	{
		copy(str,len);
	}

	CMimeType::CMimeType(const CMimeType& other)
	: inherited()
	{
		copy(other);
	}

	CMimeType::~CMimeType()
	{
	}

	bool CMimeType::copy( const char* data, int len )
	{
		bool rc;
		clear();
		rc = inherited::copy(data,len);
		return rc;
	}

	CMimeType& CMimeType::copy(const CMimeType& other)
	{
		clear();
		inherited::copy(other);
		return *this;
	}

	void CMimeType::clear()
	{
		inherited::clear();
	}

	CMimeType::mime_t CMimeType::type()
	{
		mime_t rc=tTXT;
		toLower();
		if ( isEmpty() || right(5).casecompare(".html") == 0 || right(4).casecompare(".htm") == 0 )
			rc=tHTML;
		else if ( right(3).casecompare(".js" ) == 0 )
			rc=tJS;
		else if ( right(4).casecompare(".css" ) == 0 )
			rc=tCSS;
		else if ( right(4).casecompare(".xml" ) == 0 )
			rc=tXML;
		else if ( right(4).casecompare(".png") == 0 )
			rc=tPNG;
		else if ( right(4).casecompare(".jpg") == 0 || right(5).casecompare(".jpeg") == 0 || right(4).casecompare(".ico") == 0 )
			rc=tJPG;
		else if ( right(4).casecompare(".svg") == 0 )
			rc=tSVG;
		else if ( right(4).casecompare(".gif") == 0 )
			rc=tGIF;
		else if ( right(4).casecompare(".bin") == 0 || right(4).casecompare(".dat") == 0 )
			rc=tBIN;
		else if ( right(4).casecompare(".csv") == 0 )
			rc=tCSV;
		else if ( right(4).casecompare(".log") == 0 || right(4).casecompare(".txt") == 0 )
			rc=tTXT;
		return rc;
	}

	const char* CMimeType::convert()
	{
		const char* rc;
		switch( type() )
		{
			default:
			case tMultiPartMime: rc = "multipart/form-data";break;
			case tHTML: rc = "text/html";					break;
			case tTXT:	rc = "text/plain";					break;
			case tJPG:	rc = "image/jpeg";					break;
			case tPNG:	rc = "image/png";					break;
			case tSVG:	rc = "image/svg+xml";				break;
			case tGIF:	rc = "image/gif";					break;
			case tBIN:	rc = "application/octet-stream";	break;
			case tJS:	rc = "text/javascript";				break;
			case tCSV:	rc = "text/csv";					break;
			case tXML:	rc = "text/xml";					break;
			case tCSS:	rc = "text/css";					break;
		}
		return rc;
	}
}

