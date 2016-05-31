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
|* 			mainwindow_citrix_rdp.cpp	   		      *|
|******************************************************************************|
\******************************************************************************/

#include <cassert>
#include <regex>
#include "../mainwindow.h"
#include "../ui_mainwindow.h"
#include "../../../libs/tools/inc/custom_exceptions.h"
#include "../../../libs/tools/inc/nm_check_functions.h"		//for check_for_empty_or_whitespace()




/**
 *  de/activation of the citrix/rdp button
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_btn_citrix_rdp(bool input)
{
    ui->btn_change_citrix_rdp   ->setEnabled(input);
}


/**
 *  de/activation of the citrix-input
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_inputfields_citrix(bool input)
{
	ui->txb_citrix_rdp_citrix_store	->setEnabled(input);
	ui->txb_citrix_rdp_citrix_url 	->setEnabled(input);
}

/**
 *  de/activation of the rdp-input
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_inputfields_rdp(bool input)
{
	ui->txb_citrix_rdp_rdp_server 	->setEnabled(input);
	ui->txb_citrix_rdp_rdp_domain 	->setEnabled(input);
}




/**
 *  check if the input is correct 
 *  if yes, then save into the map, otherwise show ErrorMessage
 *  @return status of success
 */
bool MainWindow::check_citrix_rdp_input() {

	bool isOK = true;

	QString citrix_store 	= ui->txb_citrix_rdp_citrix_store->text();
	QString citrix_url 	= ui->txb_citrix_rdp_citrix_url->text();
	QString rdp_server 	= ui->txb_citrix_rdp_rdp_server->text();
	QString rdp_domain 	= ui->txb_citrix_rdp_rdp_domain->text();
	try {
		//set the type
		if (ui->rdb_citrix_rdp_type_citrix->isChecked()) {
			//check for empty string
			if (check_for_empty_or_whitespace(citrix_store) || !check_for_empty_or_whitespace(citrix_url)) {
				//set the citrix_rdp_type to citrix
				profile.set_Map_Value("citrix&rdp", "citrix_rdp_type", "citrix");
			} else if (!check_for_empty_or_whitespace(citrix_store) || check_for_empty_or_whitespace(citrix_url)) {
				//set the citrix_rdp_type to citrix
				profile.set_Map_Value("citrix&rdp", "citrix_rdp_type", "citrix");
			} else {
				throw customer_error(std::string("citrix_empty; CITRIXURL=LABEL.citrix_rdp_citrix_url; CITRIXSTOR=LABEL.citrix_rdp_citrix_store;"));
			}

		} else if  (ui->rdb_citrix_rdp_type_rdp->isChecked()) {
			//check for empty string
			if (check_for_empty_or_whitespace(rdp_server) || check_for_empty_or_whitespace(rdp_domain))
				throw customer_error(std::string("rdp_empty; RDPSERVER=LABEL.citrix_rdp_rdp_server; RDPDOMAIN=LABEL.citrix_rdp_rdp_domain;"));
			//set the citrix_rdp_type to rdp
			profile.set_Map_Value("citrix&rdp", "citrix_rdp_type", "rdp");
		} else {
			throw customer_error(std::string("citrix_rdp_unselected; CITRIXNAME=LABEL.citrix_rdp_citrix; RDPNAME=LABEL.citrix_rdp_rdp"));
		}

		//set all contents
		profile.set_Map_Value("citrix&rdp", "citrix_rdp_citrix_store", citrix_store);
		profile.set_Map_Value("citrix&rdp", "citrix_rdp_citrix_url", citrix_url);
		profile.set_Map_Value("citrix&rdp", "citrix_rdp_rdp_server", rdp_server);
		profile.set_Map_Value("citrix&rdp", "citrix_rdp_rdp_domain", rdp_domain);

	} catch(const developer_error& e) {
		handle_developer_error(e);
		isOK = false;
	} catch(const customer_error& e) {
		handle_customer_error(e);
		isOK = false;
	}
	return isOK;
}


