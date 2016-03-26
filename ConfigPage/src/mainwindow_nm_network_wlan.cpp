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
|* 			mainwindow_nm_network_wlan.cpp			      *|
|******************************************************************************|
\******************************************************************************/

#include <QString>
#include <cassert>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>
#include "../mainwindow.h"
#include "../ui_mainwindow.h"
#include "../inc/errorMsg.h"
#include "../../../libs/tools/inc/custom_exceptions.h"
#include "../../../libs/nm+tools/inc/nm_make_functions.h"
#include "../../../libs/nm+tools/inc/nm_make_file.h"
//#include "../inc/nm_check_functions.h"
#include "../../../libs/nm+tools/inc/nm_get_functions.h" 	//for wlan-module: yes or no





/**
 *  checks if there is a wlan-module by searching for its mac-address
 *  if available: nothing; else: disable the wlan and all its properties
 */
void MainWindow::check_wlan() {
	try {
		get_mac("wlan");
		//catch if mac-address has wrong format, e.g. empty
	} catch(const developer_error& e) {
		/* no error message, because here, we only want to check whether we have a wlan module

		//so we get an better specification of the error-msg in the log-file
		try {
			throw developer_error(std::string("No real Exception: No WLAN-Module: ") + e.what());
		} catch(const developer_error& e) {
			//also info in debug included
			handle_developer_error(e, false);
		}
		*/
		//handle_developer_error(e, false);
		activate_wlan(false);
		ui->chk_wlan_active	->setEnabled(false); //important for save&quit button
		ui->btn_change_wlan 	->setEnabled(false);
	}
}



/**
 *  check if the input is correct for static
 *  if yes, then save into the map, otherwise throw exception
 *  @throw developer_error (maybe not)
 *  @throw customer_error if a value is not in the right form
 *  @return status of success
 */
bool MainWindow::check_network_input() {

	bool isOK = true;

	try {
		QString ip 	= ui->txb_network_ip->text();
		QString netmask = ui->txb_network_netmask->text();
		QString gateway = ui->txb_network_gateway->text();
		QString dns 	= ui->txb_network_dns->text();
		//throws an exception if something went wrong
		//static:check ip, netmask, gateway and dns
		if (ui->rdb_network_type_static->isChecked()) {
			nm_make_ipv4_static(ip, netmask, gateway, dns);
		}
		profile.set_Map_Value("network", "network_ip", ip);
		profile.set_Map_Value("network", "network_netmask", netmask);
		profile.set_Map_Value("network", "network_gateway", gateway);
		profile.set_Map_Value("network", "network_dns", dns);

		if (ui->rdb_network_type_dhcp->isChecked()) 
			profile.set_Map_Value("network", "network_type", "dhcp");
		else if  (ui->rdb_network_type_static->isChecked()) 
			profile.set_Map_Value("network", "network_type", "static");
		else 
			throw customer_error(std::string("dhcp or static must be selected"));

	} catch(const developer_error& e) {
		handle_developer_error(e);
		isOK = false;
	} catch(const customer_error& e) {
		handle_customer_error(e);
		isOK = false;
	}
	return isOK;
}



/**
 *  check if the input is correct for wlan
 *  if yes, then save into the map, otherwise show ErrorMessage
 *  @return status of success
 */
bool MainWindow::check_wlan_input() {

	bool isOK = true;
	try {
		QString ssid 	= ui->txb_wlan_ssid->text();
		QString passwd 	= ui->txb_wlan_passwd->text();
		//check for correctness and encrypt
		if (ui->chk_wlan_active->isChecked())
			passwd = nm_make_encrypt_password(ssid, passwd);

		//set content
		profile.set_Map_Value("wlan", "wlan_ssid", ssid);
		profile.set_Map_Value("wlan", "wlan_passwd", passwd);
		//active?
		if (ui->chk_wlan_active->isChecked())
			profile.set_Map_Value("wlan", "wlan_active", "true");
		else
			profile.set_Map_Value("wlan", "wlan_active", "false");

	} catch(const developer_error& e) {
		handle_developer_error(e);
		isOK = false;
	} catch(const customer_error& e) {
		handle_customer_error(e);
		isOK = false;
	}
	return isOK;
}

/**
 * TODO content is nearly the same as in parameter_return.cpp renew_nm_terminal(...), caution with changes
 * create the networkmanager-files and restart the nm-service
 * @return true if successful, else false
 */
bool MainWindow::renew_nm() {

	bool isOK = true;
	try {
		QString path 		= setting.get_Map_Value("path", "path_networkmanager");
		QString system 		= setting.get_Map_Value("system", "system");

		QString ip 		= profile.get_Map_Value("network", "network_ip");
		QString netmask		= profile.get_Map_Value("network", "network_netmask");
		QString gateway		= profile.get_Map_Value("network", "network_gateway");
		QString dns 		= profile.get_Map_Value("network", "network_dns");
		QString network_type  	= profile.get_Map_Value("network", "network_type");

		QString wlan_active	= profile.get_Map_Value("wlan", "wlan_active");
		QString ssid 		= profile.get_Map_Value("wlan", "wlan_ssid");
		QString passwd 		= profile.get_Map_Value("wlan", "wlan_passwd");

		//controls what happens with the given information of the profile
		renew_nm_exec_commands(system, path, wlan_active, ssid, passwd, network_type, ip, netmask, gateway, dns);

	} catch(const developer_error& e) {
		handle_developer_error(e);
		isOK = false;
	} catch(const customer_error& e) {
		handle_customer_error(e);
		isOK = false;
	} catch(const customer_info& e) {
		handle_customer_info(e); //TODO funktion gibt es noch nicht
		isOK = true;
	}
	return isOK;
}



/**
*  enable/disable all the input-Lines
*  @param input true or false
*/
void MainWindow::activate_network_wlan(bool input) {

	activate_network(input);
	activate_wlan(input);
	// check if there is an useable wlan
	check_wlan();
}


/**
 * TODO call activate_network_input_fields
 *  de/activation of the network input-fields
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_network(bool input)
{
	ui->txb_network_ip		->setEnabled(input);
	ui->txb_network_netmask		->setEnabled(input);
	ui->txb_network_gateway 	->setEnabled(input);
	ui->txb_network_dns	 	->setEnabled(input);
}



/**
 *  de/activation of the WLan
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_wlan(bool input)
{
	ui->chk_wlan_active	->setChecked(input);
	ui->txb_wlan_ssid 	->setEnabled(input);
	ui->txb_wlan_passwd 	->setEnabled(input);
}


/**
 *  de/activation of the network and wlan(if existing) buttons
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_btn_network_wlan(bool input)
{
	ui->btn_change_network	->setEnabled(input);
	ui->btn_change_wlan	->setEnabled(input);
	check_wlan();
}


