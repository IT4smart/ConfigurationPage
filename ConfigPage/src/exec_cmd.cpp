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
|* 				exec_cmd.cpp  				      *|
|******************************************************************************|
\******************************************************************************/

#include <memory>		//unique_ptr
#include <cstring>		//strerror
#include "../inc/custom_exceptions.h"


/**
*  read out a stream and check for failure
*  @param fp stream
*  @return content of stream, if fp==NULL, return empty string
*/
std::string read_out_stream(std::unique_ptr < FILE, int (*)(FILE *) > fp)
{
    const int MAX_BUFFER = 500;
    char file_type[MAX_BUFFER];
    std::string output = "";
    if (fp == NULL) {
	//std::cout << "Failed to run command" << std::endl;
	//ErrorMessage LOGIC
	throw developer_error(std::string
			      ("Failed to run command in read_out_stream: ")
			      + strerror(errno));
    } else {
	while (fgets(file_type, sizeof(file_type), fp.get()) != NULL) {
	    output += file_type;
	}
    }
    return output;
}



/**
*  execute a command and return its output
*  @param cmd command to execute
*  @return output of command, or if invalid: return empty string
*/
std::string exec_cmd(std::string cmd)
{
    std::string output;
    /* unique_ptr with deleter and FILE     
       // http://stackoverflow.com/questions/17945031/some-stdunique-ptr-uses-and-gotchas
       // Custom deleter function for FILE*: fclose().
       //
       std::unique_ptr<FILE,          // <-- the wrapped raw pointer type: FILE*
       int(*)(FILE*)> // <-- the custom deleter type: fclose() prototype
       myFile( fopen("myfile", "rb"), // <-- resource (FILE*) is returned by fopen()
       fclose );              // <-- the deleter function: fclose()

       //how to use:
       //void use_fct(std::unique_ptr<FILE, int(*)(FILE*)> fp);
       //use: fp.get() to get the File*, like you normally would use fp
     */
    std::unique_ptr < FILE,
	int (*) (FILE *) > file(popen(cmd.c_str(), "r"), pclose);
    output = read_out_stream(std::move(file));
    return output;
}
