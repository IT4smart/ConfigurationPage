/*******************************************************************************
 * Copyright (c) 2016, Andreas Thomas Haller, Cedrique Tassi
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    1. Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *    2. Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *    3. The name of the authors may not be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************/

/******************************************************************************\
|******************************************************************************|
|* 				remove_file.cpp				      *|
|******************************************************************************|
\******************************************************************************/

#include <unistd.h>		//F_OK and access
#include <iostream>
#include <string>
#include <cstring>		//strerror
#include "../inc/custom_exceptions.h"

/**
*  check if the given file exists
*  @param path path of the file, which wants to be checked for existence: e.g. /etc/test.txt
*  @return true if file exists, else false
*/
bool check_file_for_existence(std::string path)
{
    //man access
    //return 0 on existance, -1 else
    if (access(path.c_str(), F_OK) != -1)
	// file exists
	return true;
    else
	return false;
}

/**
*  removes the given file or empty directory
*  @param path path of the file, which wants to be deleted: e.g. /etc/test.txt
*  @return true if remove worked, else false
*/
bool remove_file(std::string path)
{
    //remove() deletes a name from the filesystem.  It calls unlink(2)
    //for files, and rmdir(2) for directories.
    //If the removed name was the last link to a file and no processes
    //have  the  file  open,  the file is deleted and the space it was
    //using is made available for reuse.
    //return 0 on succes, -1 on failure
    int ret = remove(path.c_str());
    if (ret == 0) {
	return true;
    } else if (ret == -1) {
	//std::cout << "remove: " << strerror(errno) << std::endl;
	//ErrorMessage LOGIC
	throw developer_error(std::string("remove: ") + strerror(errno));
    } else {
	//std::cout << "Unkown error in function remove_file"<<std::endl;
	//ErrorMessage LOGIC
	throw developer_error(std::string
			      ("Unkown error in function remove_file"));
    }
    return false;
}



/**
*  removes the file 'wlan' under the given path
*  if no file 'wlan' was found, nothing will be done
*  @param _path path/directory of the file 'wlan': e.g. /etc/ or /etc
*/
void remove_wlan_if_existing(std::string path)
{
    path += "/wlan";

    if (check_file_for_existence(path)) {
	remove_file(path);
    } else {
	//TODO ErrorMessage DEBUG 
	//only for debug, otherwise the return-parameter for renew_nm_terminal will be wrong
	//std::cout << "The file 'wlan' doesn't exist" << std::endl;
    }
}
