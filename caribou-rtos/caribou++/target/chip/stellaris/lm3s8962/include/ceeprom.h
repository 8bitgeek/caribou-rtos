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
#ifndef CARIBOUCEEPROM_H
#define CARIBOUCEEPROM_H

#include "ci2c.h"
#include "cbytearray.h"
#include "cstring.h"

namespace CARIBOU {

/**
 ** @brief Implements the serial EEPROM interface
 ** @author Mike Sharkey <mike@pikeaero.com>
 **/
class CEEPROM : public  CI2C
{
	public:
		CEEPROM();
		virtual ~CEEPROM();

		size_t							size();
		bool							erased();
		bool							erase();

		int								write(uint32_t addr, void* buf, size_t size);
		int								write(uint32_t addr, CByteArray& buf, int size=-1);
		int								write(uint32_t addr, CString& buf, int size=-1);

		int								read(uint32_t addr, void* buf, size_t size);
		int								read(uint32_t	addr, CByteArray& buf, size_t size);
		int								read(uint32_t	addr, CString& buf, size_t size=-1);

	protected:
		int								masterWrite(uint32_t addr, uint8_t* buf, size_t size);
		int								masterWrite(uint32_t addr, uint8_t ch);
		int								masterRead(uint32_t addr);
		uint8_t							deviceSelect(uint32_t addr);

};


}

#endif
