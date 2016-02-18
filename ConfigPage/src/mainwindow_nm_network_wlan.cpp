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
#include "../inc/custom_exceptions.h"
#include "../inc/nm_make_functions.h"
#include "../inc/nm_make_file.h"
//#include "../inc/nm_check_functions.h"
#include "../inc/nm_get_functions.h" 	//for wlan-module: yes or no
#include "../inc/remove_file.h" 		//for removing wlan-file in nm





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
 *  if yes, then save into the map, otherwise show ErrorMessage
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

		auto& profile_map = profile.getProfile();
		// First level is an iterator.
		auto first_level = profile_map.find("network");
		if( first_level != profile_map.end() ) {
			// Second map is a map.
			auto& second_map = first_level.value();
			//        Q_ASSERT( second_map.find("network_i") != second_map.end() ); //doesn't throw an error
			assert( second_map.find("network_ip") 		!= second_map.end() );
			*( second_map.find("network_ip") ) 		= ip;

			assert( second_map.find("network_netmask") 	!= second_map.end() );
			*( second_map.find("network_netmask") ) 	= netmask;

			assert( second_map.find("network_gateway") 	!= second_map.end() );
			*( second_map.find("network_gateway") ) 	= gateway;

			assert( second_map.find("network_dns") 		!= second_map.end() );
			*( second_map.find("network_dns") ) 		= dns;

			assert( second_map.find("network_type") != second_map.end() );
			if (ui->rdb_network_type_dhcp->isChecked()) {
				*( second_map.find("network_type") ) 	= "dhcp";
				//std::cout << "dhcp\n";
			} else if  (ui->rdb_network_type_static->isChecked()) {
				*( second_map.find("network_type") ) 	= "static";
				//std::cout << "static\n";
			} else {
				throw customer_error(std::string("dhcp or static must be selected"));
			}
		} else {
			throw customer_error(std::string("Please select a valid Profile"));
		}

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

		auto& profile_map = profile.getProfile();
		// First level is an iterator.
		auto first_level = profile_map.find("wlan");
		if( first_level != profile_map.end() ) {
			// Second map is a map.
			auto& second_map = first_level.value();
			assert( second_map.find("wlan_ssid") 	!= second_map.end() );
			*( second_map.find("wlan_ssid") ) 	= ssid;

			assert( second_map.find("wlan_passwd") 	!= second_map.end() );
			*( second_map.find("wlan_passwd") ) 	= passwd;

			assert( second_map.find("wlan_active") 	!= second_map.end() );
			if (ui->chk_wlan_active->isChecked())
				*( second_map.find("wlan_active") ) = "true";
			else
				*( second_map.find("wlan_active") ) = "false";

		} else {
			throw customer_error(std::string("Please select a valid Profile"));
		}

	} catch(const developer_error& e) {
		handle_developer_error(e);
		isOK = false;
	} catch(const customer_error& e) {
		//print into an error-box on screen
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
		QString path 	= setting.getSetting().value("path").value("path_networkmanager");
		QString system 	= setting.getSetting().value("system").value("system");

		auto& profile_map = profile.getProfile();
		QString ip 		= profile_map.value("network")	.value("network_ip");
		QString netmask		= profile_map.value("network")	.value("network_netmask");
		QString gateway		= profile_map.value("network")	.value("network_gateway");
		QString dns 		= profile_map.value("network")	.value("network_dns");
		QString network_type  	= profile_map.value("network")	.value("network_type");

		QString wlan_active	= profile_map.value("wlan")	.value("wlan_active");
		QString ssid 		= profile_map.value("wlan")	.value("wlan_ssid");
		QString passwd 		= profile_map.value("wlan")	.value("wlan_passwd");

		//Create the networkmanager-files:
		//delete wlan, if wlan is inactive in Map or disabled, because there is no wlan-module
		if (wlan_active == "false" || !(ui->chk_wlan_active->isEnabled()) ) {
			remove_wlan_if_existing(path.toStdString());
		} else {
			//wlan with static ip
			if (network_type == "static") {
				nm_make_file_wlan_static	(system, path, ssid, passwd, ip, netmask, gateway, dns);
				print_customer_info("You added a new WLan-Configuration:\nIt may need up to 30 sec to get WLan access");
			} else {
				nm_make_file_wlan_dhcp		(system, path, ssid, passwd);
				print_customer_info("You added a new WLan-Configuration:\nIt may need up to 30 sec to get WLan access");
			}
		}

		if (network_type == "static") {
			nm_make_file_ethernet_static	(system, path, ip, netmask, gateway, dns);
		} else {
			nm_make_file_ethernet_dhcp	(system, path);
		}


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


