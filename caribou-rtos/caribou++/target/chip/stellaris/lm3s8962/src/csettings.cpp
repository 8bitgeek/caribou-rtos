/***************************************************************************
 *   Copyright © 2005-2012 by Pike Aerospace Research Corporation          *
 *   info@pikeaero.com                                                     *
 *                                                                         *
 *   This program is free software: you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation, either version 3 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>. *
 **************************************************************************/

/***************************************************************************
* OFFSET    DESCRIPTION                                                    *
* ======	===========                                                    *
*	0		Config file version                                            *
*	1		MAC Address                                                    *
*   7		Ip Address                                                     *
*   11		Netmask                                                        *
*   15		Gateway                                                        *
*   19      DHCP Enabled                                                   *
*   20      Serial Console Enabled                                         *
****************************************************************************/

#include "csettings.h"
#include "ceeprom.h"

#define		SERIAL_NO_OFFSET	0
#define		VERSION_OFFSET		(SERIAL_NO_OFFSET+8)
#define		MAC_ADDR_OFFSET		(VERSION_OFFSET+1)
#define		IP_ADDR_OFFSET		(VERSION_OFFSET+7)
#define		NETMASK_ADDR_OFFSET	(VERSION_OFFSET+11)
#define		GATEWAY_ADDR_OFFSET	(VERSION_OFFSET+15)
#define		DHCP_ENABLED_OFFSET	(VERSION_OFFSET+19)
#define		CONS_ENABLED_OFFSET	(VERSION_OFFSET+20)
#define		LOGIN_OFFSET		(VERSION_OFFSET+21)  /* 10 chars + null max. */
#define		PASSWORD_OFFSET		(VERSION_OFFSET+32)  /* 10 chars + null max. */

/** configuration constants */
#define	CONFIG_VERSION				0x13
#define DEFAULT_MAC_ADDR			{0x00,0xED,0x39,0x76,0xC3,0x8B}
#define DEFAULT_IP_ADDR				{192,168,1,50}
#define DEFAULT_NETMASK				{255,255,255,0}
#define DEFAULT_GATEWAY				{192,168,1,1}
#define	DEFAULT_LOGIN				"admin"
#define	DEFAULT_PASSWORD			"admin"

namespace CARIBOU
{

	#define inherited CEEPROM

	static uint8_t defaultVersion	= CONFIG_VERSION;
	static uint8_t defaultMac[6]	= DEFAULT_MAC_ADDR;
	static uint8_t defaultIp[4]		= DEFAULT_IP_ADDR;
	static uint8_t defaultMask[4]	= DEFAULT_NETMASK;
	static uint8_t defaultGw[4]		= DEFAULT_GATEWAY;
	static uint8_t defaultDHCP		= 0;

	CSettings::CSettings()
	: inherited()
	{
	}

	CSettings::~CSettings()
	{
	}

	/**
	* @brief Erase the config record
	*/
	void CSettings::erase()
	{
		for(int n=VERSION_OFFSET; n < size(); n++)
		{
			uint8_t ch=0xFF;
			write(n,&ch,1);
		}
	}

	/**
	* @brief is the serial number empty?
	*/
	bool CSettings::emptySerialNo()
	{
		CByteArray sn = serialNo();
		for(int n=0; n < sn.size(); n++)
		{
			if ( sn.at(n) !=0xFF )
				return false;
		}
		return true;
	}

	/**
	* @return the device serial number
	*/
	CByteArray CSettings::serialNo()
	{
		CByteArray a;
		int rc;
		init();
		read(SERIAL_NO_OFFSET,a,8);
		return a;
	}

	CByteArray CSettings::macAddr()
	{
		CByteArray a;
		int rc;
		init();
		read(MAC_ADDR_OFFSET,a,6);
		return a;
	}

	CByteArray CSettings::ipAddr()
	{
		CByteArray a;
		int rc;
		init();
		read(IP_ADDR_OFFSET,a,4);
		return a;
	}

	CByteArray CSettings::ipMask()
	{
		CByteArray a;
		int rc;
		init();
		read(NETMASK_ADDR_OFFSET,a,4);
		return a;
	}

	CByteArray CSettings::ipGateway()
	{
		CByteArray a;
		int rc;
		init();
		read(GATEWAY_ADDR_OFFSET,a,4);
		return a;
	}

	bool CSettings::dhcpEnabled()
	{
		int rc;
		char a;
		init();
		read(DHCP_ENABLED_OFFSET,&a,1);
		return a?true:false;
	}

	bool CSettings::serialConsoleEnabled()
	{
		return false;
	}

	CString CSettings::login()
	{
		CString a;
		int rc;
		init();
		read(LOGIN_OFFSET,a,11);
		return a;
	}

	CString CSettings::password()
	{
		CString a;
		int rc;
		init();
		read(PASSWORD_OFFSET,a,11);
		return a;
	}


	void CSettings::setSerialNo(CByteArray& a)
	{
		init();
		write(SERIAL_NO_OFFSET,(void*)a.data(),8);
	}

	void CSettings::setMacAddr(CByteArray& a)
	{
		init();
		write(MAC_ADDR_OFFSET,(void*)a.data(),6);
	}

	void CSettings::setIpAddr(CByteArray& a)
	{
		init();
		write(IP_ADDR_OFFSET,(void*)a.data(),4);
	}

	void CSettings::setIpMask(CByteArray& a)
	{
		init();
		write(NETMASK_ADDR_OFFSET,(void*)a.data(),4);
	}

	void CSettings::setIpGateway(CByteArray& a)
	{
		init();
		write(GATEWAY_ADDR_OFFSET,(void*)a.data(),4);
	}

	void CSettings::setDHCPEnabled(bool dhcpEnabled)
	{
		char a = dhcpEnabled ? 1 : 0;
		init();
		write(DHCP_ENABLED_OFFSET,&a,1);
	}

	void CSettings::setSerialCOnsoleEnabled(bool serialConsoleEnabled)
	{
		init();
	}

	void CSettings::setLogin(CString& a)
	{
		init();
		write(LOGIN_OFFSET,a,11);
	}

	void CSettings::setPassword(CString& a)
	{
		init();
		write(PASSWORD_OFFSET,a,11);
	}


	/**
	* Initialize the EEPROM if required
	*/
	void CSettings::init()
	{
		uint8_t version;
		read(VERSION_OFFSET,&version,1);
		if ( version != CONFIG_VERSION || erased() )
		{
			write(VERSION_OFFSET,		&defaultVersion,	1);
			write(MAC_ADDR_OFFSET,		defaultMac,			6);
			write(IP_ADDR_OFFSET,		defaultIp,			4);
			write(NETMASK_ADDR_OFFSET,	defaultMask,		4);
			write(GATEWAY_ADDR_OFFSET,	defaultGw,			4);
			write(DHCP_ENABLED_OFFSET,	&defaultDHCP,		1);
		}
	}


}
