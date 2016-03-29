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
 

#ifndef PARAMETER_RETURN_H
#define PARAMETER_RETURN_H


//Variables for the version numbers declared in the CMakeLists.txt
#define VERSION_MAJOR 1
#define VERSION_MINOR 0

#include <memory>
#include "../../../libs/tools/inc/IniFile.h"
#include "../mainwindow.h"

//the parameter won't be changed in the function, therefore a "const"
void parameter_return(const char* _executable, const char* _input);
void set_parameter(const char* _executable, const char* _command, const char* _value);
void print_help(const char* _executable);
void return_profile_info(const char *_executable, std::string input);
std::string get_dhcp_info(std::string input);
bool renew_nm_terminal(std::unique_ptr<IniFile> setting, std::unique_ptr<IniFile> profile);
bool handle_error_terminal(const std::exception& e, QString logFolder);

#endif // PARAMETER_RETURN_H
