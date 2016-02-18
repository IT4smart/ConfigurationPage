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
  |* 				parameter_return.cpp			      *|
  |******************************************************************************|
  \******************************************************************************/
//To control all the arguments passed to the executable 
//and return the right function

#include <QString>
#include <iostream>
#include <string>
#include <memory>
#include <regex>

#include "../inc/parameter_return.h"
#include "../inc/setting.h"
#include "../inc/profile.h"
#include "../inc/custom_exceptions.h"
#include "../inc/exec_cmd.h"
#include "../inc/nm_make_functions.h"
#include "../inc/nm_make_file.h"
#include "../inc/remove_file.h"



/**
 *  Print the correct output/return value for each command to the stdout  
 *  e.g. return the current IP (in regard to static/dhcp)
 *  @param _executable how the programm will be executed, e.g. ./execute
 *  @param _input the parameter with which the program will be executed
 */
void parameter_return(const char *_executable, const char *_input)
{
	std::string input = _input;

	if (input == "-v" || input == "--version")
		std::cout << "Version " << VERSION_MAJOR << "." << VERSION_MINOR <<
			std::endl;
	else if (input == "-h" || input == "--help")
		print_help(_executable);
	//check for 2 leading --
	else if (input.substr(0, 2) == "--")
		return_profile_info(_executable, input.replace(0,2, ""));
	//check for 1 leading -
	else if (input.substr(0, 1) == "-")
		return_profile_info(_executable, input.replace(0,1, ""));
	//no leading - or --
	else
		return_profile_info(_executable, input);
	//print_help(_executable); is included in the return_profile_info if no valid argument has been passed
}






/**
 *  print -1 on failure
 *  Print the correct output/return value for each command to the stdout  
 *  if input doesn't fit any known parameter, print help message
 *  @param _executable how the programm will be executed, e.g. ./execute
 *  @param input the parameter with which the program will be executed
 */
void return_profile_info(const char *_executable, std::string input)
{
	std::unique_ptr<Setting> setting(new Setting);
	std::unique_ptr<Profile> profile(new Profile);
	// loads global settings of setting.ini
	try {
		setting.get()->loadSettings();
	} catch(const developer_error& e) {
		std::cout << -1 << std::endl;
		return;
	}

	// load last profile
	QString profilesFolder 	= setting.get()->getSetting().value("path").value("path_profiles");
	profile.get()->setProfileFolderName(profilesFolder);
	try {
		profile.get()->loadProfile(setting.get()->getSetting().value("profile").value("last_profile") );
	} catch(const developer_error& e) {
		std::cout << -1 << std::endl;
		return;
	}	



	//read out the profile and setting
	QString system 	= setting.get()->getSetting().value("system").value("system");

	auto& profile_map = profile.get()->getProfile();
	QString profile_name	= profile_map.value("global")	.value("profile_name");

	//network
	QString ip 		= profile_map.value("network")	.value("network_ip");
	QString netmask_profile	= profile_map.value("network")	.value("network_netmask");
	QString netmask 	= "-1";
	QString netmask_short	= "-1";
	//netmask conversion
	try {
		netmask_short 	= nm_make_netmask_x(netmask_profile);
		netmask 	= nm_make_netmask_wxyz(netmask_profile);
	} catch (const customer_error& e){
		netmask = "-1";
		netmask_short = "-1";
	}

	QString gateway		= profile_map.value("network")	.value("network_gateway");
	QString dns 		= profile_map.value("network")	.value("network_dns");
	QString network_type  	= profile_map.value("network")	.value("network_type");

	//wlan
	QString wlan_active	= profile_map.value("wlan")	.value("wlan_active");
	QString ssid 		= profile_map.value("wlan")	.value("wlan_ssid");
	QString passwd 		= profile_map.value("wlan")	.value("wlan_passwd");

	//citrix&rdp
	QString citrix_rdp_type	= profile_map.value("citrix&rdp")	.value("citrix_rdp_type");
	QString citrix		= profile_map.value("citrix&rdp")	.value("citrix_rdp_citrix");
	QString rdp_server 	= profile_map.value("citrix&rdp")	.value("citrix_rdp_rdp_server");
	QString rdp_domain 	= profile_map.value("citrix&rdp")	.value("citrix_rdp_rdp_domain");

	//go through every possible input
	if (input == "profile_info") {
		std::cout << 
			"system:\t\t\t" 	<< system << "\n" <<
			"profile_name:\t\t" 	<< profile_name << "\n" 
			<< "\n" <<
			//network
			"network_type:\t\t" 	<< network_type << "\n" <<
			"ip:\t\t\t"	 	<< ip << "\n" <<
			"netmask_profile:\t" 	<< netmask_profile << "\n" <<
			"netmask:\t\t" 		<< netmask << "\n" <<
			"netmask_short:\t\t" 	<< netmask_short << "\n" <<
			"gateway:\t\t" 		<< gateway << "\n" <<
			"dns:\t\t\t" 		<< dns << "\n" 
			<< "\n" <<
			//wlan
			"wlan_active:\t\t" 	<< wlan_active << "\n" <<
			"ssid:\t\t\t" 		<< ssid << "\n" <<
			"passwd:\t\t\t" 	<< passwd << "\n" 
			<< "\n" <<
			//citrix&rdp
			"citrix_rdp_type:\t" 	<< citrix_rdp_type << "\n" <<
			"citrix:\t\t\t" 	<< citrix << "\n" <<
			"rdp_server:\t\t" 	<< rdp_server << "\n" <<
			"rdp_domain:\t\t" 	<< rdp_domain << "\n" 
			<< "\n"; 


		//system & profile_name
	} else if (input == "system") {
		std::cout << system << std::endl;
	} else if (input == "profile_name") {
		std::cout << profile_name << std::endl;
		//network
	} else if (input == "network_type") {
		std::cout << network_type << std::endl;
	} else if (input == "netmask_profile") {
		std::cout << netmask_profile << std::endl;

		//static
	} else if (input == "ip" && network_type == "static") {
		std::cout << ip << std::endl;
	} else if (input == "ip_wlan" && network_type == "static") {
		std::cout << ip << std::endl;
	} else if (input == "netmask_short" && network_type == "static") {
		std::cout << netmask_short << std::endl;
	} else if (input == "netmask" && network_type == "static") {
		std::cout << netmask << std::endl;
	} else if (input == "gateway" && network_type == "static") {
		std::cout << gateway << std::endl;
	} else if (input == "dns" && network_type == "static") {
		std::cout << dns << std::endl;	

		//dhcp
	} else if (input == "ip" && network_type == "dhcp") {
		std::cout << get_dhcp_info("ip") << std::endl;	
	} else if (input == "ip_wlan" && network_type == "dhcp") {
		std::cout << get_dhcp_info("ip_wlan") << std::endl;	
	} else if (input == "netmask_short" && network_type == "dhcp") {
		std::cout << get_dhcp_info("netmask_short") << std::endl;	
	} else if (input == "netmask" && network_type == "dhcp") {
		std::cout << get_dhcp_info("netmask") << std::endl;	
	} else if (input == "gateway" && network_type == "dhcp") {
		std::cout << get_dhcp_info("gateway") << std::endl;	
	} else if (input == "dns" && network_type == "dhcp") {
		std::cout << get_dhcp_info("dns") << std::endl;	

		//system-calls
	} else if (input == "ip_system") {
		std::cout << get_dhcp_info("ip") << std::endl;	
	} else if (input == "ip_wlan_system") {
		std::cout << get_dhcp_info("ip_wlan") << std::endl;	
	} else if (input == "netmask_short_system") {
		std::cout << get_dhcp_info("netmask_short") << std::endl;	
	} else if (input == "netmask_system") {
		std::cout << get_dhcp_info("netmask") << std::endl;	
	} else if (input == "gateway_system") {
		std::cout << get_dhcp_info("gateway") << std::endl;	
	} else if (input == "dns_system") {
		std::cout << get_dhcp_info("dns") << std::endl;	

		//out of profile
	} else if (input == "ip_profile") {
		std::cout << ip << std::endl;
		//netmask_profile is the same as some time before: see above:
	} else if (input == "gateway_profile") {
		std::cout << gateway << std::endl;
	} else if (input == "dns_profile") {
		std::cout << dns << std::endl;	


		//wlan
	} else if (input == "wlan_active") {
		std::cout << wlan_active << std::endl;
	} else if (input == "ssid") {
		std::cout << ssid << std::endl;
	} else if (input == "passwd") {
		std::cout << passwd << std::endl;

		//citrix&rdp
	} else if (input == "citrix_rdp_type") {
		std::cout << citrix_rdp_type << std::endl;
	} else if (input == "citrix") {
		std::cout << citrix << std::endl;
	} else if (input == "rdp_server") {
		std::cout << rdp_server << std::endl;
	} else if (input == "rdp_domain") {
		std::cout << rdp_domain << std::endl;
		//
		//NETWORK-MANAGER nm
	} else if (input == "renew_nm") {
		if (renew_nm_terminal(std::move(setting), std::move(profile)))
			std::cout << "0" << std::endl;

		//help if nothing found
	} else {
		print_help(_executable);
	}
}





/**
 *  evaluate input in system-call
 *  @param input ip, ip_wlan, netmask_short, netmask, gateway, dns
 *  @return if successful: input evaluated by system call, else: -1
 */
std::string get_dhcp_info(std::string input)
{
	std::string output;
	std::string cmd;

	bool netmask_long = false;
	if (input == "ip") {
		cmd = "ip address |grep -A 2 ' e[a-zA-Z0-9]*0: '| grep inet | sed 's/\\// /g' | awk {'print $2'}| tr -d '\n'";

	} else if (input == "ip_wlan") {
		cmd = "ip address |grep -A 2 ' wl.*: ' | grep inet | sed 's/\\// /g' | awk {'print $2'}| tr -d '\n'";

	} else if (input == "netmask_short") {
		cmd = "ip address |grep -A 2 ' e[a-zA-Z0-9]*0: '| grep inet | sed 's/\\// /g' | awk {'print $3'}| tr -d '\n'";

	} else if (input == "netmask") {
		cmd = "ip address |grep -A 2 ' e[a-zA-Z0-9]*0: '| grep inet | sed 's/\\// /g' | awk {'print $3'}| tr -d '\n'";
		netmask_long = true;

	} else if (input == "gateway") {
		cmd = "ip route | grep default | head -1 | awk {'print $3'} |tr -d '\n'";

	} else if (input == "dns") {
		cmd = "cat /etc/resolv.conf | grep nameserver | awk {'print $2\";\"'} |tr -d '\n'";
	}

	//execute the cmd:
	//exec_cmd returns "" if something went wrong and throws exception
	try {
		output = exec_cmd(cmd);

	} catch (const developer_error& e){
		return "-1";
	}

	//netmask-conversion
	if (netmask_long) {
		QString netmask;
		//if conversion from netmask_x to netmask_wxyz fails, throws only customer_errors
		try {
			netmask 	= nm_make_netmask_wxyz(QString::fromStdString(output));
		} catch (const customer_error& e){
			netmask = "-1";
		}
		output = netmask.toStdString();
	}
	//if empty return of exec_cmd
	if (output == "")
		output = "-1";
	return output;
}



/**
 *  TODO always keep it up to date
 *  print the help-message for useage with a parameter
 *  @param _executable how the programm will be executed, e.g. ./execute
 */
void print_help(const char *_executable)
{
	std::string executable = _executable;
	std::cout 
		<< "\n" << "USEAGE:" 
		<< "\n" << "\t" << executable << " [0 Option] to start GUI" 
		<< "\n" << "\t" << executable << " [1 Option]" 
		<< "\n";

	std::cout 
		<< "\n" << "PARMETER:" 
		<< "\n" << "\t-v | --version		Print the version" 					
		<< "\n" << "\t-h | --help		Print this help-message" 				
		<< "\n"
		<< "\n" << "\tUse the following commands with leading '-' or '--' or without any leading '-'"	
		<< "\n" << "\tThese information will be taken from current profile if not told something else"
		<< "\n";
	std::cout 
		<< "\n" << "\t[GENERAL]\n"
		<< "\n" << "\tprofile_info		Print all information from the profile (ip, etc; no system-call used)" 
		<< "\n" << "\tsystem			Print the used system out of the setting.ini" 
		<< "\n" << "\trenew_nm		needs root-rights (sudo)"
		<< "\n" << "\t\t			Create the NetworkManager-file(s) of the current Profile and restart it" 
		<< "\n" << "\t\t			Exceptions are saved in the logfiles with '_terminal' suffix" 
		<< "\n" << "\t\t			All failures (with the logfile too) are printed on stdout"
		<< "\n" << "\t\t			Return only 0 on success"
		<< "\n"; 
	std::cout 
		<< "\n" << "\n\t[NETWORK]\n"
		<< "\n" << "\tnetwork_type		dhcp or static" 
		<< "\n" << "\tip			ip 	depending on network_type from profile (static) or from system-call (dhcp)" 
		<< "\n" << "\tip_wlan			ip of wlan: makes only sense for dhcp with system-call; with static: same as ip" 
		<< "\n" << "\tnetmask_profile		netmask out of profile" 
		<< "\n" << "\tnetmask			netmask format like ip, depending on network_type from profile (static) or from system-call (dhcp)" 
		<< "\n" << "\tnetmask_short		netmask in [0,32] depending on network_type from profile (static) or from system-call (dhcp)" 
		<< "\n" << "\t->netmask->failure	if netmask has no valid format and static, the netmask(_short) will be -1" 
		<< "\n" << "\tgateway			gateway depending on network_type from profile (static) or from system-call (dhcp)" 
		<< "\n" << "\tdns			dns 	depending on network_type from profile (static) or from system-call (dhcp)" 
		<< "\n" << "\t->dhcp->failure		if dhcp and some system-call failure happens, the value will be: -1" 
		<< "\n";
	std::cout 
		<< "\n" << "\n\t[NETWORK-PROFILE]"
		<< ""   << "\tAll values taken out of the current Profile:\n"
		<< "\n" << "\tip_profile		ip" 
		<< "\n" << "\tnetmask_profile		netmask" 
		<< "\n" << "\tgateway_profile		gateway" 
		<< "\n" << "\tdns_profile		dns"
		<< "\n";
	std::cout 
		<< "\n" << "\n\t[NETWORK-SYSTEM]"
		<< ""   << "\tAll values are delivered by a system-call:\n"
		<< "\n" << "\tip_system		ip" 
		<< "\n" << "\tip_wlan_system		ip of wlan: makes only sense for dhcp" 
		<< "\n" << "\tnetmask_system		netmask in short format in [0,32]" 
		<< "\n" << "\tgateway_system		gateway" 
		<< "\n" << "\tdns_system		dns"
		<< "\n";
	std::cout 
		<< "\n" << "\n\t[WLAN]\n"
		<< "\n" << "\twlan_active		true if wlan is active, false else (may be active (in profile) without an existing wlan-module)" 
		<< "\n" << "\tssid			ssid of wlan" 		
		<< "\n" << "\tpasswd			encrypted password" 	
		<< "\n";
	std::cout 
		<< "\n" << "\n\t[CITRIX&RDP]\n"
		<< "\n" << "\tcitrix_rdp_type		citrix or rdp" 		
		<< "\n" << "\tcitrix			citrix-url" 		
		<< "\n" << "\trdp_server		rdp-server" 		
		<< "\n" << "\trdp_domain		rdp-domain" 		
		<< "\n";

	std::cout 
		<< "\n" << "ERROR:\n\treturn -1 on error" 
		<< "\n\n";
}


/**
 * create the networkmanager-files and restart the nm-service
 * TODO content is nearly the same as in MainWindow::renew_nm(), caution with changes
 * @param profile Profile of current profile
 * @param setting Setting
 * no user-output (information-box) is used
 * @return true if successful, else false
 */
bool renew_nm_terminal(std::unique_ptr<Setting> setting, std::unique_ptr<Profile> profile) {

	bool isOK = true;
	QString logFolder = "";
	try {
		QString logFolder 	= setting.get()->getSetting().value("path").value("path_log");
		QString path 		= setting.get()->getSetting().value("path").value("path_networkmanager");
		QString system 		= setting.get()->getSetting().value("system").value("system");

		auto& profile_map 	= profile.get()->getProfile();
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
		if (wlan_active == "false") {
			remove_wlan_if_existing(path.toStdString());
		} else {
			//wlan with static ip
			if (network_type == "static") {
				nm_make_file_wlan_static	(system, path, ssid, passwd, ip, netmask, gateway, dns);
			} else {
				nm_make_file_wlan_dhcp		(system, path, ssid, passwd);
			}
		}

		if (network_type == "static") {
			nm_make_file_ethernet_static	(system, path, ip, netmask, gateway, dns);
		} else {
			nm_make_file_ethernet_dhcp	(system, path);
		}

	} catch(const developer_error& e) {
		handle_error_terminal(e, logFolder);
		isOK = false;
	} catch(const customer_error& e) {
		handle_error_terminal(e, logFolder);
		isOK = false;
	}
	return isOK;
}





/**
 *  log the exception
 *  print exception to shell
 *
 *  @param e the developer_error
 *  @param logFolder folder in which the logfiles should be saved
 *  @return false on failure instead of exception
 */
bool handle_error_terminal(const std::exception& e, QString logFolder)
{
	//important as return-value to get the error-message
	std::cout << typeid(e).name() << ": " << e.what() << std::endl;
	//if something with the log-file goes wrong, false is returned
	try {
		xml_log_saver(logFolder, "_terminal", typeid(e).name(), e.what());
	} catch(const customer_error& ex) {
		//ErrorMessage
		//direct message on the screen, not an exception
		std::cout << typeid(ex).name() << ": " << ex.what() << std::endl;
		return false;
	}
	return true;
}
