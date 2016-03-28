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
	print_customer_info(e.what());
	//std::cout << "customer-error\n";
}
/**
 *  give information to user/customer
 *  @param e the customer_info
 */
void MainWindow::handle_customer_info(const std::exception& e)
{
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

