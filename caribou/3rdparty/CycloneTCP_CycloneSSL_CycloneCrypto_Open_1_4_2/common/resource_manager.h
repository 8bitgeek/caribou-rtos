/**
 * @file resource_manager.h
 * @brief Embedded resource management
 *
 * @section License
 *
 * Copyright (C) 2010-2014 Oryx Embedded. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * @author Oryx Embedded (www.oryx-embedded.com)
 * @version 1.4.2
 **/

#ifndef _RESOURCE_MANAGER_H
#define _RESOURCE_MANAGER_H

//Dependencies
#include "error.h"

#define MODE_BINARY 0
#define MODE_TEXT 1

#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2

/**
 * @brief Resource type
 **/

typedef enum
{
   RES_TYPE_DIR  = 1,
   RES_TYPE_FILE = 2
} ResType;


#ifdef _WIN32
   #define strncasecmp _strnicmp
#endif

#if (defined(__GNUC__) || defined(_WIN32))
   #define __packed
   #pragma pack(push, 1)
#endif


/**
 * @brief Resource entry
 **/

typedef __packed struct
{
   char_t type;
   uint32_t dataStart;
   uint32_t dataLength;
   uint8_t nameLength;
   char_t name[];
} ResEntry;


/**
 * @brief Root entry
 **/

typedef __packed struct
{
   char_t type;
   uint32_t dataStart;
   uint32_t dataLength;
   uint8_t nameLength;
} ResRootEntry;


/**
 * @brief Resource header
 **/

typedef __packed struct
{
   uint32_t totalSize;
   ResRootEntry rootEntry;
} ResHeader;


#if (defined(__GNUC__) || defined(_WIN32))
   #undef __packed
   #pragma pack(pop)
#endif


typedef struct
{
   uint_t type;
   uint_t volume;
   uint32_t dataStart;
   uint32_t dataLength;
   uint8_t nameLength;
   char_t name[];
} DirEntry;


typedef struct
{
   uint_t mode;
   uint32_t start;
   uint32_t size;
   uint32_t offset;
} FsFile;


//Resource management
error_t resGetData(const char_t *path, uint8_t **data, size_t *length);

error_t resSearchFile(const char_t *path, DirEntry *dirEntry);

//error_t resOpenDirectory(Directory *directory, const DirEntry *entry);
//error_t resReadDirectory(Directory *directory, DirEntry *entry);

error_t resOpenFile(FsFile *file, const DirEntry *dirEntry, uint_t mode);
error_t resSeekFile(FsFile *file, uint32_t *position);
uint_t resReadFile(FsFile *file, void *data, size_t length);

#endif
