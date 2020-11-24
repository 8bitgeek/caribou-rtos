#include <chttpformsession.h>
#include <csettings.h>
#include <chttpstring.h>
#include <coctetarray.h>
#include <syslog_printf.h>

static const char*				/* CHttpFormSession:: */mBaudRates[] __attribute__ ((section(".rodata"))) = 
{
	"110",
	"300",
	"1200",
	"2400",
	"4800",
	"9600",
	"19200",
	"28800",
	"38400",
	"57600",
	"115200",
	"230400",
	"460800",
	"921600",
	NULL
};

static const char*				/* CHttpFormSession:: */ mDataBits[] __attribute__ ((section(".rodata"))) = 
{
	"7",
	"8",
	NULL
};

static const char*				/* CHttpFormSession:: */ mStopBits[] __attribute__ ((section(".rodata"))) = 
{
	"1",
	"2",
	NULL
};

static const char*				/* CHttpFormSession:: */ mParityBits[] __attribute__ ((section(".rodata"))) = 
{
	"None",
	"Odd",
	"Even",
	NULL
};

static const char*				/* CHttpFormSession:: */ mModbusProtocol[] __attribute__ ((section(".rodata"))) =
{
	"ASCII",
	"RTU",
	NULL
};


namespace MineAirQuality
{
	#define inherited MineAirQuality::CHttpSession

	CHttpFormSession::CHttpFormSession( 
								int sockfd, 
								const char* name, 
								size_t stksize, 
								uint16_t priority,
                                uint16_t watchdog_count
							  )
	: inherited(sockfd,(char*)name,stksize,priority,watchdog_count)
	{
	}

	CHttpFormSession::~CHttpFormSession()
	{
	}


	void CHttpFormSession::enter()
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "enter");
		inherited::enter();
	}

	void CHttpFormSession::leave()
	{
		SYSLOG_PRINTF( NULL, SYSLOG_DEBUG, "leave");
		inherited::leave();
	}

	void CHttpFormSession::renderHeader()
	{
		inherited::renderHeader();
	}

	void CHttpFormSession::renderFooter()
	{
		inherited::renderFooter();
	}

	void CHttpFormSession::renderBody()
	{
		if ( path() == PRODUCT_HTTP_ROOT )
		{
			CARIBOU::CString t; // temp str

			sendBuffer() += "<form action=\"/\" method=\"post\">\n";
			sendBuffer() += "<table>\n";
			send();

   			sendBuffer() += "<tr><td colspan=\"2\"><b>GATEWAY MODE</b></td></tr>\n";

			renderCheckBox(		
								"tcpm",
								"<i>TCP Master / RTU Slave</i>",
								postData().length() ? (postData().valueOfTag("tcpm").length()?1:0) : MineAirQuality::CSettings::instance()->values().modbus.tcpm 
							);

			/* Set the settings field right away for this flag as it determine page rendering */
			MineAirQuality::CSettings::instance()->values().modbus.tcpm = postData().length() ? (postData().valueOfTag("tcpm").length()?1:0) : MineAirQuality::CSettings::instance()->values().modbus.tcpm;

			sendBuffer() += "<tr><td colspan=\"2\"><b>ETHERNET INTERFACE</b></td></tr>\n";
			send();

			renderCheckBox(		
								"dhcp",
								"DHCP",
                                postData().length() ? (postData().valueOfTag("dhcp").length()?1:0) : MineAirQuality::CSettings::instance()->values().ethernet.dhcp
							);

			renderMacAddress(	
								"host",	
								"Hostname",		
								postData().valueOfTag(
													"host",
													(const char*)CSettings::instance()->values().ethernet.hostname
												)
							);

			renderMacAddress(	
								"mac",	
								"MAC Address",		
								postData().valueOfTag(
													"mac",
													COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.mac.octets,6,':').toString()
												)
							);

			renderIPV4Address(	
								"ip",	
								"IP Address",		
								COctetArray(postData().valueOfTag("ip",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.ip.octets,4,'.').toString())).octets() 
							);

			renderIPV4Address(	
								"gw",	
								"Gateway Address",	
								COctetArray(postData().valueOfTag("gw",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.gw.octets,4,'.').toString())).octets()
							);

			renderIPV4Address(	
								"nm",	
								"Net Mask",			
								COctetArray(postData().valueOfTag("nm",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.mask.octets,4,'.').toString())).octets()
							);

			sendBuffer() += "<tr><td colspan=\"2\"><b>MODBUS/TCP</b></td></tr>\n";
			send();

			if ( MineAirQuality::CSettings::instance()->values().modbus.tcpm )
			{
				/* Only when TCP is Master */
				renderInteger(		
									"msid",	
									"<i>Slave ID</i>",	
									postData().valueOfTag("msid",MineAirQuality::CSettings::instance()->values().modbus.slave_id).toInt(),
									0,
									0xFF
								);

				renderIPV4Address(	
									"sip",	
									"<i>Slave IP</i>",		
									COctetArray(postData().valueOfTag("sip",COctetArray(MineAirQuality::CSettings::instance()->values().modbus.slave_ip.octets,4,'.').toString())).octets() 
								);
			}

			renderInteger(		
								"port",	
								MineAirQuality::CSettings::instance()->values().modbus.tcpm ? "<i>TCP Port</i>" : "TCP Port",	
								postData().valueOfTag("port",MineAirQuality::CSettings::instance()->values().modbus.tcpport).toInt(),
								1,
								0xFFFF
							);


			renderInteger(		
								"tcpto",	
								"Timeout (milliseconds)",	
								postData().valueOfTag("tcpto",MineAirQuality::CSettings::instance()->values().modbus.timeout).toInt(),
								0,
								0x7FFF
							);

			sendBuffer() += "<tr><td colspan=\"2\"><b>RS485 MODBUS/RTU/ASCII</b></td></tr>\n";
			send();

			if ( MineAirQuality::CSettings::instance()->values().modbus.tcpm )
			{
				/* Only when TCP is Master */
				renderInteger(		
									"ssid",	
									"<i>Slave ID</i>",	
									postData().valueOfTag("ssid",MineAirQuality::CSettings::instance()->values().serial.slave_id).toInt(),
									0,
									0xFF
								);
			}

			renderComboBox(		
								"rtu",	
								"Protocol",	
										MineAirQuality::CSettings::instance()->values().modbus.tcpm ?
											modbusToStr((MineAirQuality::CSettings::instance()->values().serial.rtu=1)) :
											postData().valueOfTag("rtu",modbusToStr(MineAirQuality::CSettings::instance()->values().serial.rtu)).data(),
								mModbusProtocol
							);

			t.fromInt((int)MineAirQuality::CSettings::instance()->values().serial.baud);
			renderComboBox(		
								"br",	
								"Baud Rate (BPS)",	
								postData().valueOfTag("br",t).toInt(),
								mBaudRates 
							);

			t.fromInt((int)MineAirQuality::CSettings::instance()->values().serial.bits);
			renderComboBox(		
								"db",	
								"Data Bits",		
								postData().valueOfTag("db",t).toInt(), 
								mDataBits
							);

			
			renderComboBox(		
								"pr",	
								"Parity",			
								postData().valueOfTag("pr",parityToStr(MineAirQuality::CSettings::instance()->values().serial.parity)).data(),
								mParityBits
							);

			t.fromInt((int)MineAirQuality::CSettings::instance()->values().serial.stopbits);
			renderComboBox(		
								"sb",	
								"Stop Bits",		
								postData().valueOfTag("sb",t).toInt(), 
								mStopBits
							);

			renderInteger(		
								"sto",	
								"Timeout (milliseconds)",	
								postData().valueOfTag("sto",MineAirQuality::CSettings::instance()->values().serial.timeout).toInt(),
								0,
								0x7FFF
							);

			postDataStore();

			sendBuffer() += "<tr><td colspan=\"2\"><input type=\"submit\" value=\"Submit\"></td></tr>\n";
			sendBuffer() += "</table>\n";
			sendBuffer() += "</form>\n";
			send();
		}
	}

	/**
	 * @brief Store settings of post data
	 */
	void CHttpFormSession::postDataStore()
	{
		if ( !postData().isEmpty() )
		{
			bool valid=true;

			strncpy((char*)MineAirQuality::CSettings::instance()->values().ethernet.hostname,postData().valueOfTag("host",(const char*)MineAirQuality::CSettings::instance()->values().ethernet.hostname).data(),SETTINGS_MAX_HOSTNAME);
			MineAirQuality::CSettings::instance()->values().ethernet.hostname[SETTINGS_MAX_HOSTNAME]='\0';
			//board_set_net_hostname((char*)MineAirQuality::CSettings::instance()->values().ethernet.hostname);

			if ( !COctetArray(postData().valueOfTag("mac",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.mac.octets,6,':').toString()),':').isZero() &&
				 !COctetArray(postData().valueOfTag("mac",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.mac.octets,6,':').toString()),':').isOnes() )
			{
				memcpy(
						MineAirQuality::CSettings::instance()->values().ethernet.mac.octets,
						COctetArray(postData().valueOfTag("mac",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.mac.octets,6,':').toString()),':').octets(),
						6
					);
			}
			else
			{
				valid=false;
				renderFault("Invalid MAC");
			}

			memcpy(
					MineAirQuality::CSettings::instance()->values().ethernet.ip.octets,
					COctetArray(postData().valueOfTag("ip",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.ip.octets,4,'.').toString())).octets(),
					4
				);

			memcpy(
					MineAirQuality::CSettings::instance()->values().ethernet.gw.octets,
					COctetArray(postData().valueOfTag("gw",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.gw.octets,4,'.').toString())).octets(),
					4
				);

			memcpy(
					MineAirQuality::CSettings::instance()->values().ethernet.mask.octets,
					COctetArray(postData().valueOfTag("nm",COctetArray(MineAirQuality::CSettings::instance()->values().ethernet.mask.octets,4,'.').toString())).octets(),
					4
				);


			memcpy(
					MineAirQuality::CSettings::instance()->values().modbus.slave_ip.octets,
					COctetArray(postData().valueOfTag("sip",COctetArray(MineAirQuality::CSettings::instance()->values().modbus.slave_ip.octets,4,'.').toString())).octets(),
					4
				);

			MineAirQuality::CSettings::instance()->values().ethernet.dhcp = postData().length() ? (postData().valueOfTag("dhcp").length()?1:0) : MineAirQuality::CSettings::instance()->values().ethernet.dhcp;
			MineAirQuality::CSettings::instance()->values().modbus.tcpm = postData().length() ? (postData().valueOfTag("tcpm").length()?1:0) : MineAirQuality::CSettings::instance()->values().modbus.tcpm;

			//MineAirQuality::CSettings::instance()->values().ethernet.dhcp = !postData().valueOfTag("dhcp").isEmpty();
			//MineAirQuality::CSettings::instance()->values().modbus.tcpm = !postData().valueOfTag("tcpm").isEmpty();

			MineAirQuality::CSettings::instance()->values().serial.rtu = modbusToInt(postData().valueOfTag("rtu",modbusToStr(MineAirQuality::CSettings::instance()->values().serial.rtu)));
			MineAirQuality::CSettings::instance()->values().serial.baud = postData().valueOfTag("br",CARIBOU::CString((int)MineAirQuality::CSettings::instance()->values().serial.baud)).toInt();
			MineAirQuality::CSettings::instance()->values().serial.bits = postData().valueOfTag("db",CARIBOU::CString((int)MineAirQuality::CSettings::instance()->values().serial.bits)).toInt();
			MineAirQuality::CSettings::instance()->values().serial.parity = parityToInt(postData().valueOfTag("pr",parityToStr(MineAirQuality::CSettings::instance()->values().serial.parity)));
			MineAirQuality::CSettings::instance()->values().serial.stopbits = postData().valueOfTag("sb",CARIBOU::CString((int)MineAirQuality::CSettings::instance()->values().serial.stopbits)).toInt();
			MineAirQuality::CSettings::instance()->values().serial.timeout = postData().valueOfTag("sto",CARIBOU::CString(MineAirQuality::CSettings::instance()->values().serial.timeout)).toUInt();

			MineAirQuality::CSettings::instance()->values().modbus.tcpport = postData().valueOfTag("port",MineAirQuality::CSettings::instance()->values().modbus.tcpport).toInt();
			MineAirQuality::CSettings::instance()->values().modbus.timeout = postData().valueOfTag("tcpto",CARIBOU::CString(MineAirQuality::CSettings::instance()->values().modbus.timeout)).toUInt();

			MineAirQuality::CSettings::instance()->values().serial.slave_id = postData().valueOfTag("ssid",MineAirQuality::CSettings::instance()->values().serial.slave_id).toInt();
			MineAirQuality::CSettings::instance()->values().modbus.slave_id = postData().valueOfTag("msid",MineAirQuality::CSettings::instance()->values().modbus.slave_id).toInt();

			if ( valid )
			{
				MineAirQuality::CSettings::instance()->write();
			}
		}		
	}

	const char* CHttpFormSession::parityToStr(int parity)
	{
		switch(parity)
		{
			default:
			case 0:	return "None"; break;
			case 1: return "Odd"; break;
			case 2: return "Even"; break;
		}
	}

	int CHttpFormSession::parityToInt(CARIBOU::CString parity)
	{
		int rc;
		for(rc=0; mParityBits[rc] != NULL && parity.casecompare(mParityBits[rc]) != 0; rc++);
		return rc;		
	}

	const char* CHttpFormSession::modbusToStr(int mb)
	{
		switch(mb)
		{
			default:
			case 0:	return "ASCII"; break;
			case 1: return "RTU"; break;
		}
	}

	int CHttpFormSession::modbusToInt(CARIBOU::CString mb)
	{
		int rc;
		for(rc=0; mModbusProtocol[rc] != NULL && mb.casecompare(mModbusProtocol[rc]) != 0; rc++);
		return rc;
	}

}

