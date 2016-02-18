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
|* 				custom_exceptions.h			      *|
|******************************************************************************|
\******************************************************************************/

#ifndef CUSTOM_EXCEPTIONS_H
#define CUSTOM_EXCEPTIONS_H

//included dependencies
#include <QString>

class customer_error: public std::runtime_error{
	//inheritage of std::runtime_error
public:
	//no default constructor
	//customer_error():runtime_error("File not found"){}
	//header:
	//explicit runtime_error( const std::string& what_arg ); (1) 	
	//explicit runtime_error( const char* what_arg ); (2) 	(since C++11)
	//customer_error(std::string msg):runtime_error(msg.c_str()){} //I don't prefer this
	customer_error(std::string msg):runtime_error(msg){}
};

class developer_error: public std::runtime_error{
public:
	developer_error(std::string msg):runtime_error(msg){}
};


std::ostream& operator<<(std::ostream& os, const QString& e);
std::string time_now(std::string input);
void xml_log_saver(QString _path, QString logfile_suffix, QString ErrorType, QString ErrorMsg);

#endif // CUSTOM_EXCEPTIONS_H
