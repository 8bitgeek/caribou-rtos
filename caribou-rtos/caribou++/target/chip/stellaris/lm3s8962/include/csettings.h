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

#ifndef CARIBOUCSETTINGS_H
#define CARIBOUCSETTINGS_H

#include "ceeprom.h"
#include "cbytearray.h"
#include "cstring.h"

namespace CARIBOU
{
	class CSettings : public CEEPROM
	{
		public:
			CSettings();
			virtual ~CSettings();

			void				erase();
			bool				emptySerialNo();

			CByteArray			serialNo();
			CByteArray			macAddr();
			CByteArray			ipAddr();
			CByteArray			ipMask();
			CByteArray			ipGateway();
			bool				dhcpEnabled();
			bool				serialConsoleEnabled();
			CString				login();
			CString				password();

			void				setSerialNo(CByteArray& serialNo);
			void				setMacAddr(CByteArray& mac);
			void				setIpAddr(CByteArray& addr);
			void				setIpMask(CByteArray& mask);
			void				setIpGateway(CByteArray& gateway);
			void				setDHCPEnabled(bool dhcpEnabled);
			void				setSerialCOnsoleEnabled(bool serialConsoleEnabled);
			void				setLogin(CString& a);
			void				setPassword(CString& a);

		private:
			void				init();
	};

}

#endif
