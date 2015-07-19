/**
 * @file main.cpp
 * @brief Resource compiler
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

//Disable compiler warning
#define _CRT_SECURE_NO_WARNINGS

//Dependencies
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <direct.h>
#include <shlwapi.h>

//Libraries
#pragma comment(lib, "shlwapi.lib")

//Error codes
#define ERROR_FAILURE          1
#define ERROR_INVALID_RESOURCE 2

//Set data aligment
#pragma pack(push, 1)

/**
 * @brief Resource type
 **/

typedef enum
{
   RES_TYPE_DIR  = 1,
   RES_TYPE_FILE = 2
} tResType;


/**
 * @brief Resource entry
 **/

typedef struct
{
   unsigned char type;
   unsigned long dataOffset;
   unsigned long dataLength;
   unsigned char nameLength;
   char name[];
} tResEntry;


/**
 * @brief Resource header
 **/

typedef struct
{
   unsigned long totalSize;
   tResEntry rootEntry;
} tResHeader;

//Restore previous settings for data aligment
#pragma pack(pop)


/**
 * @brief Add the contents of a file to the resource data
 * @param[in] filename Path to the filename
 * @param[in] data Pointer to the resource data
 * @param[in] maxSize Maximum size of the resulting resource file
 * @param[out] length Actual length of the file
 * @return Status code
 **/

int addFile(const char *filename, unsigned char *data, unsigned long maxSize, unsigned long *length)
{
   int error;
   unsigned int n;
   fpos_t pos;
   FILE *fp;

   //Point to the header of the resource data
   tResHeader *ResHeader = (tResHeader *) data;

   //Open the specified file
   fp = fopen(filename, "rb");
   //Cannot open file?
   if(!fp)
      return ERROR_OPEN_FAILED;

   //Jump to the end of the file
   error = fseek(fp, 0, SEEK_END);
   //Any error to report?
   if(error)
      return ERROR_FAILURE;

   //Get the length of the file
   error = fgetpos(fp, &pos);
   //Any error to report?
   if(error)
      return ERROR_FAILURE;

   //Save the length
   *length = (unsigned long) pos;

   //Check the length of the file
   if((ResHeader->totalSize + *length) > maxSize)
      return ERROR_FILE_TOO_LARGE;

   //Back the beginning of the file
   error = fseek(fp, 0, SEEK_SET);
   //Any error to report?
   if(error)
      return ERROR_FAILURE;

   //Read file contents
   n = fread(data + ResHeader->totalSize, 1, *length, fp);
   //Failed to read data?
   if(n != *length)
      return ERROR_FAILURE;

   //Update the total length of the resource data
   ResHeader->totalSize += *length;

   //Close file
   fclose(fp);
   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Add the contents of a directory to the resource data
 * @param[in] parentOffset Offset of the parent directory
 * @param[in] parentSize Size of the parent directory
 * @param[in] directory Path to the directory
 * @param[in] data Pointer to the resource data
 * @param[in] maxSize Maximum size of the resulting resource file
 * @param[out] length Actual length of the directory
 * @return Status code
 **/

int addDirectory(unsigned long parentOffset, unsigned long parentSize,
   const char *directory, unsigned char *data, unsigned long maxSize, unsigned long *length)
{
   int error;
   char path[MAX_PATH];
   char filename[MAX_PATH];
   unsigned int i;
   unsigned int pos;
   tResEntry *entry;
   WIN32_FIND_DATA findFileData;
   HANDLE hFind;

   //Point to the header of the resource data
   tResHeader *ResHeader = (tResHeader *) data;
   //Point to the location where to write the directory contents
   pos = ResHeader->totalSize;
   //Initialize the length field
   *length = 0;

   //Copy the directory path
   strcpy(path, directory);
   //Append \* to the directory path
   PathAppend(path, "\\*");

   //Open source directory
   hFind = FindFirstFile(path, &findFileData);
   //Unable to read directory?
   if(hFind == INVALID_HANDLE_VALUE)
      return ERROR_OPEN_FAILED;

   //Point to the location where to write the directory contents
   i = pos;

   //Check the actual size of the resource data
   if((i + sizeof(tResEntry) + 1) >= maxSize)
   {
      FindClose(hFind);
      return ERROR_FILE_TOO_LARGE;
   }

   //Current directory
   entry = (tResEntry *) (data + i);
   entry->type = RES_TYPE_DIR;
   entry->dataOffset = 0;
   entry->dataLength = 0;
   entry->nameLength = 1;
   entry->name[0] = '.';

   //Jump to the following entry
   i += sizeof(tResEntry) + entry->nameLength;
   //Update the length of the directory
   *length += sizeof(tResEntry) + entry->nameLength;

   //Add a link to the parent directory?
   if(parentOffset && parentSize)
   {
      //Check the actual size of the resource data
      if((i + sizeof(tResEntry) + 2) >= maxSize)
      {
         FindClose(hFind);
         return ERROR_FILE_TOO_LARGE;
      }

      //Parent directory
      entry = (tResEntry *) (data + i);
      entry->type = RES_TYPE_DIR;
      entry->dataOffset = 0;
      entry->dataLength = 0;
      entry->nameLength = 2;
      entry->name[0] = '.';
      entry->name[1] = '.';

      //Jump to the following entry
      i += sizeof(tResEntry) + entry->nameLength;
      //Update the length of the directory
      *length += sizeof(tResEntry) + entry->nameLength;
   }

   //Loop through directory entries
   do
   {
      //Discard . and .. directories
      if(!strcmp(findFileData.cFileName, ".") || !strcmp(findFileData.cFileName, ".."))
         continue;
      //Discard hidden files
      if(findFileData.dwFileAttributes & FILE_ATTRIBUTE_HIDDEN)
         continue;

      //Make sure the maximum size is not exceeded
      if((i + sizeof(tResEntry) + strlen(findFileData.cFileName)) >= maxSize)
      {
         FindClose(hFind);
         return ERROR_FILE_TOO_LARGE;
      }

      //Add a new entry
      entry = (tResEntry *) (data + i);
      entry->type = (findFileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) ? RES_TYPE_DIR : RES_TYPE_FILE;
      entry->dataOffset = 0;
      entry->dataLength = 0;
      entry->nameLength = strlen(findFileData.cFileName);
      strncpy(entry->name, findFileData.cFileName, entry->nameLength);

      //Jump to the following entry
      i += sizeof(tResEntry) + entry->nameLength;
      //Update the length of the directory
      *length += sizeof(tResEntry) + entry->nameLength;

      //Get next file
   } while(FindNextFile(hFind, &findFileData));

   //Update the total size of the resource file
   ResHeader->totalSize += *length;

   //Parse the newly added entries
   for(i = 0; i < *length; i += sizeof(tResEntry) + entry->nameLength)
   {
      //Point to the current entry
      entry = (tResEntry *) (data + pos + i);

      //Special . directory?
      if(entry->nameLength == 1 && entry->name[0] == '.')
      {
         //Set data offset
         entry->dataOffset = pos;
         //Set directory size
         entry->dataLength = *length;
      }
      //Special .. directory?
      else if(entry->nameLength == 2 && entry->name[0] == '.' && entry->name[1] == '.')
      {
         //Set data offset
         entry->dataOffset = parentOffset;
         //Set directory size
         entry->dataLength = parentSize;
      }
      else
      {
         //Data must be aligned on 4-byte boundaries
         ResHeader->totalSize = (ResHeader->totalSize + 3) / 4 * 4;
         //Set data offset
         entry->dataOffset = ResHeader->totalSize;

         //Form the full path to the item
         strcpy(path, directory);
         strncpy(filename, entry->name, entry->nameLength);
         filename[entry->nameLength] = '\0';
         PathAppend(path, filename);

         //Check entry type
         if(entry->type == RES_TYPE_DIR)
         {
            //Add the contents of the directory to the resource data
            error = addDirectory(pos, *length, path, data, maxSize, &entry->dataLength);
         }
         else
         {
            //Add the contents of the file to the resource data
            error = addFile(path, data, maxSize, &entry->dataLength);
         }

         //Any error to report?
         if(error)
         {
            FindClose(hFind);
            return error;
         }
      }
   }

   //Close find search handle
   FindClose(hFind);
   //Successful processing
   return 0;
}


/**
 * @brief Dump the contents of a directory
 * @param[in] directory Directory to dump
 * @param[in] parentSize Size of the parent directory
 * @param[in] level Recursion level
 * @return Status code
 **/

int dumpDirectory(const unsigned char *data, tResEntry *directory, unsigned int level)
{
   int error;
   unsigned int i;
   unsigned int n;
   tResEntry *entry;
   char filename[MAX_PATH];

   //Check entry type
   if(directory->type != RES_TYPE_DIR)
      return ERROR_FAILURE;

   //Retrieve the length of the directory
   n = directory->dataLength;
   //Point to the first entry
   entry = (tResEntry *) (data + directory->dataOffset);

   //Loop through the directory
   while(n > 0)
   {
      //Check the number of remaining bytes
      if(n < sizeof(tResEntry))
         return ERROR_INVALID_RESOURCE;
      //Make sure the entry is valid
      if(n < (sizeof(tResEntry) + entry->nameLength))
         return ERROR_INVALID_RESOURCE;

      //Retrieve filename
      strncpy(filename, entry->name, entry->nameLength);
      //Properly terminate the string with a NULL character
      filename[entry->nameLength] = '\0';

      //Indent the current line
      for(i = 0; i < level; i++) printf("  ");

      //Display filename
      if(entry->type == RES_TYPE_DIR)
         printf("[%s]\r\n", filename);
      else
         printf("%s (%u bytes)\r\n", filename, entry->dataLength);

      //Directory found?
      if(entry->type == RES_TYPE_DIR)
      {
         if(strcmp(filename, ".") && strcmp(filename, ".."))
         {
            //Recursively dump the contents of the directory
            error = dumpDirectory(data, entry, level + 1);
            //Any error to report?
            if(error) return error;
         }
      }

      //Remaining bytes to process
      n -= sizeof(tResEntry) + entry->nameLength;
      //Point to the next entry
      entry = (tResEntry *) ((unsigned char *) entry + sizeof(tResEntry) + entry->nameLength);
   }

   //Successful processing
   return NO_ERROR;
}


/**
 * @brief Main routine
 **/

int main(int argc, char* argv[])
{
   char path[MAX_PATH];
   char sourceDir[MAX_PATH];
   int error;
   unsigned int i;
   unsigned int maxSize;
   unsigned char *data;
   const char *destFile;
   char *p;
   char *c;
   tResHeader *resHeader;
   FILE *fp;

   //Check parameters
   if(argc != 3 && argc != 4)
   {
      //Print command syntax
      printf("Usage: rc.exe input output [maxsize]\r\n");
      printf("  - input:   Source directory to include in resource file\r\n");
      printf("  - output:  Compiled resource file\r\n");
      printf("  - maxsize: Maximum size of the resource file\r\n");
      printf("Copyright (c) 2011-2012 Oryx Embedded\r\n");
      //Report an error
      return ERROR_FAILURE;
   }

   //Source directory to process
   if(PathIsRelative(argv[1]))
   {
      //Get current working directory
      _getcwd(sourceDir, MAX_PATH);
      //Retrieve the full path
      PathAppend(sourceDir, argv[1]);
   }
   else
   {
      //Copy the path to the source directory
      strcpy(sourceDir, argv[1]);
   }

   //Destination resource file
   destFile = argv[2];
   //Maximum size of the resulting resource file
   maxSize = (argc == 4) ? atoi(argv[3]) : (1024 * 1024);

   //Allocate a memory buffer to hold the resulting data
   data = malloc(maxSize);
   //Failed to allocate memory?
   if(!data)
   {
      printf("Error: Unable to allocate memory!\r\n");
      //Release previoulsy allocated memory
      free(data);
      return ERROR_FAILURE;
   }

   //Clear memory buffer
   memset(data, 0, maxSize);

   //Initialize resource data header
   resHeader = (tResHeader *) data;
   resHeader->totalSize = sizeof(tResHeader);
   resHeader->rootEntry.type = RES_TYPE_DIR;
   resHeader->rootEntry.dataOffset = sizeof(tResHeader);
   resHeader->rootEntry.dataLength = 0;
   resHeader->rootEntry.nameLength = 0;

   //Add the contents of the specified directory to the resource file
   error = addDirectory(0, 0, sourceDir, data, maxSize, &resHeader->rootEntry.dataLength);

   //Any error to report?
   if(error == ERROR_FILE_TOO_LARGE)
   {
      //User message
      printf("Error: Maximum size exceeded (%u bytes)!\r\n", maxSize);
      //Release previoulsy allocated memory
      free(data);
      //Report an error
      return ERROR_FAILURE;
   }
   else if(error)
   {
      //User message
      printf("Error: Unable to read source directory!\r\n");
      //Release previoulsy allocated memory
      free(data);
      //Report an error
      return ERROR_FAILURE;
   }

   //Open output file
   fp = fopen(destFile, "w+");

   //Cannot open output file
   if(!fp)
   {
      //User message
      printf("Error: Cannot open resource file!\r\n");
      //Release previoulsy allocated memory
      free(data);
      //Report an error
      return ERROR_FAILURE;
   }

   //Get filename
   strcpy(path, destFile);
   p = PathFindFileName(path);
   //Remove extension
   c = strchr(p, '.');
   if(c) *c = '\0';

   //Write header
   fprintf(fp, "const unsigned char %s[] =\n", p);
   fprintf(fp, "{\n");

   //Write data
   for(i = 0; i < resHeader->totalSize; i++)
   {
      //Beginning of a new line?
      if((i % 16) == 0)
         fprintf(fp, "   ");

      //Display current data byte
      fprintf(fp, "0x%02X", data[i]);

      //Last byte?
      if(i == (resHeader->totalSize - 1))
         fprintf(fp, "\n");
      //End of current line?
      else if((i % 16) == 15)
         fprintf(fp, ",\n");
      else
         fprintf(fp, ", ");
   }

   //Properly terminate the array
   fprintf(fp, "};\n");
   //Close output file
   fclose(fp);

   //Dump the contents of the resource file
   dumpDirectory(data, &resHeader->rootEntry, 0);
   //User message
   printf("\r\n%u bytes successfully written !\r\n", resHeader->totalSize);

   //Release previoulsy allocated memory
   free(data);

   //Successful processing
   return NO_ERROR;
}
