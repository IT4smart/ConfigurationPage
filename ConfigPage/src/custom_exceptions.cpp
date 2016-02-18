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
  |* 				custom_exceptions.cpp			      *|
  |******************************************************************************|
  \******************************************************************************/
#include <iostream>
#include <fstream>
#include <QString>
#include <ctime>
#include "../inc/remove_file.h" 		//check_file_for_existence
#include "../inc/set_permission.h" 	//set_permission_all_rw
#include "../inc/custom_exceptions.h" 	
#include "../inc/setting.h" 	
#include <typeinfo> 	

/**
 * << operator for QString
 * @param os stream to print into 
 * @param e QString to be printed
 * @return QString into the os stream
 */
std::ostream& operator<<(std::ostream& os, const QString& e)
{
	return os << e.toStdString();
}

/**
 * calculate the actual time
 * @param input date or time, else date&time
 * @return the actual date and time
 */
std::string time_now(std::string input)
{
	time_t timer = time(0); //time now
	struct tm tm_struct = *localtime(&timer);
	time(&timer);
	char       buf[80];
	//write in the time in the wanted format
	if (input == "date") 
		strftime(buf, sizeof(buf), "%Y-%m-%d", &tm_struct);
	else if (input == "time")
		strftime(buf, sizeof(buf), "%H:%M:%S", &tm_struct);
	else
		strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", &tm_struct);
	return std::string(buf);
}


/**
 * throws an customer_exception if a system-failure with the log-file happens.
 * otherwise the error can't be found
 * @param _path path to the logfile
 * @param logfile_suffix add something at the end of the logfile-Name
 * @param ErrorType type of the exception
 * @param ErrorMsg message of the exception
 */
void xml_log_saver(QString _path, QString logfile_suffix, QString ErrorType, QString ErrorMsg)
{
	std::string path = _path.toStdString();
	path = path + "/" + time_now("date") + logfile_suffix.toStdString();
	bool new_file = false;
	if( !check_file_for_existence(path))
		new_file = true;

	{//that the ofs runs out of scope (destructor) and the files permissions can be changed
		std::ofstream ofs;
		
		//output and append
		ofs.open(path, std::ios::out | std::ios::app);
		if (ofs.is_open()) {
			if (new_file)
				ofs << "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n\n";

			ofs 	<< "<Exception>\n" 
				<< "\t" << "<Date>" 	<< time_now("both") 	<< "</Date>\n"
				<< "\t" << "<Type>" 	<< ErrorType 		<< "</Type>\n"
				<< "\t" << "<Message>" 	<< ErrorMsg 		<< "</Message>\n"
				<< "</Exception>\n" 
				<< "\n";
		} else {
			//ErrorMessage
			//direct message on the screen, not an exception
			throw customer_error("Fatal Error: log-file can't be saved!\nPlease contact Admin");
		}
	}
	if (new_file) {
		try {
			//so that there won't be problems if the executing user changes
			set_permission_all_rw(path);
		} catch(const developer_error& e) {
			//ErrorMessage
			//direct message on the screen, not an exception
			throw customer_error("Fatal Error: log-file permissions can't be set!\nPlease contact Admin");
		}
	}
}

