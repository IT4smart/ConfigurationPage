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
|* 		mainwindow_handle_custom_exceptions.cpp	   		      *|
|******************************************************************************|
\******************************************************************************/

#include <typeinfo> 			//for errortype of exception
#include <iostream>

#include "../mainwindow.h"
#include "../../../libs/tools/inc/custom_exceptions.h"

/**
 *  log the exception
 *  give information to user/customer
 *  print exception to shell
 *
 *  because of the path, this is a MainWindow-member function
 *  @param e the developer_error
 */
void MainWindow::handle_developer_error(const std::exception& e)
{
	handle_developer_error(e, true);
}

/**
 *  log the exception
 *  give information to user/customer
 *  print exception to shell
 *
 *  because of the path, this is a MainWindow-member function
 *  @param e the developer_error
 *  @param customer_msg control the feedback to customer
 */
void MainWindow::handle_developer_error(const std::exception& e, bool customer_msg)
{
	QString logFolder 	= setting.get_Map_Value("path", "path_log");
	
	try {
		//if something with the log-file goes wrong, we can still see the error
		xml_log_saver(logFolder, "",  typeid(e).name(), e.what());
	} catch(const customer_error& e) {
		handle_customer_error(e);
	}

	//TODO give the developer_error.what() also in debug mode to std::cout, correct the description of the functions
	std::cout << "EXEPTION-D: " << e.what() << std::endl;



	//User-feedback
	if (customer_msg)
		print_customer_info("Ops! Something went wrong. Please try again or contact your Admin.");
}
/**
 *  give information to user/customer
 *  @param e the customer_error
 */
void MainWindow::handle_customer_error(const std::exception& e)
{
	//get the right error-message and replace some Identifiers like FILE with the 
	//values given in the exception-message
	QString message = analyse_and_create_error_message("customer_error", e);
	if (message != "")
		print_customer_info(message);
	else
		print_customer_info(e.what());
}
/**
 *  give information to user/customer
 *  @param e the customer_info
 */
void MainWindow::handle_customer_info(const std::exception& e)
{
	//take the message of exception in the customer_info section 
	//if not available, take the fallback
	QString message = (exception.get_Map_Value("customer_info", e.what()) != "") ? 
			exception.get_Map_Value("customer_info", e.what()) : 
			exception_fallback.get_Map_Value("customer_info", e.what());
	//if fallback is empty too, print the error-code
	if (message != "")
		print_customer_info(message);
	else
		print_customer_info(e.what());
}

/**
 *  needed for non-exception information
 *  give information to user/customer
 *  @param e the customer_error
 */
void MainWindow::print_customer_info(QString message)
{
	informationMessage (this, message);
}


#include "../../../libs/tools/inc/maps.h"
#include "../../../libs/tools/inc/ini_parser.h"




/**
 * parses the exception-message that has been thrown
 * this message should look like this, that it can be used
 * e.what/message = "this_is_wrong; FILE=test.txt; FUNCTION=remove;"
 * this_is_wrong without leading identifier like FILE
 * delimiters are ; and =
 * in en.ini
 * this_is_wrong=FUNCTION can't open FILE
 *
 * @param message exception-message
 * @return map with standard message, if message was empty, 
 * 	else: return map of key-value to use with the identifier in a *.ini file
 * 	these keys and values are trimmed, means not leading or ending whitespace
 */
Map error_message_parser(QString message) {
	QStringList list = message.split(";");
	Map map;

	//check if the list has at least one element. the first one needs to be the errorcode, identifier for a .ini-file
	if (list.size() >= 1) 
		map.insert("ERRORCODE", list[0]);
	else 
		map.insert("ERRORCODE", "empty_msg");

	for (auto iter : list) {
		QStringList key_value = iter.split("=");
		//only if key and value exist, but no more od less (so the ERRORCODE falls through this net)
		if (key_value.size() == 2) {
		//trim away all the leading or ending whitespace
			QString key 	= QString::fromStdString(trim(key_value[0].toStdString()));
			QString value 	= QString::fromStdString(trim(key_value[1].toStdString()));
			map.insert(key, value);
		}
	}
	return map;
}

/**
 * How the exception-message and the ini-file entry fit together:
 *
 * 1. example
 * exception message: 
 * 	std::string("identifier_word")
 * inifile-entry:
 * 	identifier_word= The Password is too short.
 * result-message:
 * 	The Password is too short.
 *
 * 2. example
 * exception message: 
 * 	std::string("identifier; FUNCTION=ini_saver; FILE=maps.h;")
 * inifile-entry:
 * 	identifier=In FUNCTION the file FILE can't be opened.
 * result-message:
 * 	In ini_saver the file maps.h can't be opened. 
 * 
 *
 * 3. example (only BUTTON. or LABEL. allowed, others don't make sense)
 * exception message: 
 * 	std::string("identifier; FUNCTION=ini_saver; ADDRESS=LABEL.network_ip; CANCEL=BUTTON.cancel;")
 * inifile-entries:
 * 	identifier=In FUNCTION the address ADDRESS can't be saved. Please push CANCEL.
 * 	[button]
 * 		cancel=Abbrechen
 * 	[label]
 *		network_ip=IP-Adresse
 * result-message:
 * 	In ini_saver the address IP-Addresse can't be saved. Please push Abbrechen.
 *
 *
 *
 * Analyses the given exception-message and replaces the given identifiers in the message of an *.ini file to get the right 
 * error-message in the right language
 *
 * @param e the whole exception
 * @param group the group in which it looks for the error-messsage-identifier 
 * @return the right error-message in the right language
 */
QString MainWindow::analyse_and_create_error_message(QString group, const std::exception& e) {
	//get Map of the error-message with identifiers
	Map map = error_message_parser(e.what());
	//get the therefore fitting message from an *.ini-file, use the fallback, if the original language doesn't have this entry
	QString message = (exception.get_Map_Value(group, map.value("ERRORCODE")) != "") ? 
			exception.get_Map_Value(group, map.value("ERRORCODE")) : 
			exception_fallback.get_Map_Value(group, map.value("ERRORCODE"));
	//if there is only one entry: the identifier
	if (map.size() == 1) 
		return message;
	
	//go through the map and try to take these values and replace the same identifiers in the message of the *.ini-file
	//the first one is ERRORCODE but this one can't be found in the IniFile so it doesn't matter to look for it
	for (MapIter iter = map.begin(); iter != map.end(); iter++) {
		QString button 	= "BUTTON.";
		QString label 	= "LABEL.";
		QString value	= iter.value();
		//check if the value doesn't begin with BUTTON. or LABEL. 
		//if they do, the value will be replaced with the value in the language(fallback) 
		//under the group: button or label
		//e.g. LABEL.network_ip will then have the new value under 
		//[label] 
		//network_ip=IP-Adresse (de) or IP (en)
		if (value.startsWith(button)) {
			QString btn = "button";
			value.remove(button);
			QString replace_value = (language.get_Map_Value(btn, value) != "") 
				? language.get_Map_Value(btn, value) 
				: language_fallback.get_Map_Value(btn, value);
			//only replace the value with the language value, if it can be found there
			if (replace_value != "")
				value = replace_value;

		} else if (value.startsWith(label)) {
			QString lb = "label";
			value.remove(label);
			QString replace_value = (language.get_Map_Value(lb, value) != "") 
				? language.get_Map_Value(lb, value) 
				: language_fallback.get_Map_Value(lb, value);
			//only replace the value with the language value, if it can be found there
			if (replace_value != "")
				value = replace_value;
		} 
		//check if the (new) value is not empty
		if (value != "") {
			//replace the key in the message with its value
			message.replace(iter.key(), value, Qt::CaseSensitive);
		}
	}
	return message;
}



