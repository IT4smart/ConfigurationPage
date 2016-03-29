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
#include "../../../libs/tools/inc/custom_exceptions.h"
#include "../../../libs/tools/inc/exec_cmd.h"
#include "../../../libs/tools/inc/nm_make_functions.h"
#include "../../../libs/tools/inc/nm_make_file.h"
#include "../../../libs/tools/inc/remove_file.h"
#include "../../../libs/tools/inc/paths.h" //for path to setting.ini



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
 *  print 1 on succes and error-message on failure
 *  Print the correct output/return value for each command to the stdout  
 *  if input doesn't fit any known parameter, print help message
 *  @param _executable how the programm will be executed, e.g. ./execute
 *  @param _command give the variable/parameter-identifier that shall be set, e.g. set_citrix_store
 *  @param _value the value to be set. it is automatically non-empty, so no need to check this
 */
void set_parameter(const char* _executable, const char* _command, const char* _value) {
	QString command 	= _command;
	QString value 		= _value;
	(void) _executable;
	//std::string command 	= _command;
	//std::string value 	= _value;
	try {
		std::unique_ptr<IniFile> setting(new IniFile(SETTING_PATH, SETTING_FILE, SETTING_ENDING));
		// load last profile
		QString profilesFolder 	= setting.get()->get_Map_Value("path", "path_profiles");
		QString profilesLast 	= setting.get()->get_Map_Value("profile", "last_profile");
		QString profilesEnding 	= setting.get()->get_Map_Value("profile", "profile_ending");
		std::unique_ptr<IniFile> profile(new IniFile(profilesFolder, profilesLast, profilesEnding));

		QString group 	= "";
		QString key 	= "";
		//check for citrix&rdp
		if ( 		   command == "set_citrix_url" 
				|| command == "set_citrix_store" 
				|| command == "set_rdp_domain" 
				|| command == "set_rdp_server") {
			//set the right group and value like in the profile.ini
			group = "citrix&rdp";
			key = "citrix_rdp_" + command.remove(0,4);
			//std::cout << key << std::endl;
		}

		//check for other setters but then don't forget to control the input: TODO

		//if no valid command, the group will be empty
		if (group == "" || key == "") {
			std::cout << "invalid argument: '" << command << "'" << std::endl;
			return;
		}

		//set the Profile-Map
		profile.get()->set_Map_Value(group, key, value);
		//save Map to Disk
		profile.get()->save_Map_to_IniFile();

	} catch(const developer_error& e) {
		std::cout << e.what() << std::endl;
		return;
	}
	//no exception, no failure
	std::cout << "1" << std::endl;
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
	// loads global settings of setting.ini
	try {
		std::unique_ptr<IniFile> setting(new IniFile(SETTING_PATH, SETTING_FILE, SETTING_ENDING));
		// load last profile
		QString profilesFolder 	= setting.get()->get_Map_Value("path", "path_profiles");
		QString profilesLast 	= setting.get()->get_Map_Value("profile", "last_profile");
		QString profilesEnding 	= setting.get()->get_Map_Value("profile", "profile_ending");
		std::unique_ptr<IniFile> profile(new IniFile(profilesFolder, profilesLast, profilesEnding));


		//read out the profile and setting
		QString system 		= setting.get()->get_Map_Value("system", "system");
		QString language	= setting.get()->get_Map_Value("system", "language");
		QString keyboard	= setting.get()->get_Map_Value("system", "keyboard");
		QString client_logo_path= setting.get()->get_Map_Value("path", "path_client_logo");
		QString client_logo 	= setting.get()->get_Map_Value("profile", "last_client_logo");
		client_logo 		= client_logo_path + "/" + client_logo;

		QString profile_name	= profile.get()->get_Map_Value("global", "profile_name");

		//network
		QString ip 		= profile.get()->get_Map_Value("network", "network_ip");
		QString netmask_profile	= profile.get()->get_Map_Value("network", "network_netmask");
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

		QString gateway		= profile.get()->get_Map_Value("network", "network_gateway");
		QString dns 		= profile.get()->get_Map_Value("network", "network_dns");
		QString network_type  	= profile.get()->get_Map_Value("network", "network_type");

		//wlan
		QString wlan_active	= profile.get()->get_Map_Value("wlan", "wlan_active");
		QString ssid 		= profile.get()->get_Map_Value("wlan", "wlan_ssid");
		QString passwd 		= profile.get()->get_Map_Value("wlan", "wlan_passwd");

		//citrix&rdp
		QString citrix_rdp_type	= profile.get()->get_Map_Value("citrix&rdp", "citrix_rdp_type");
		QString citrix_store	= profile.get()->get_Map_Value("citrix&rdp", "citrix_rdp_citrix_store");
		QString citrix_url	= profile.get()->get_Map_Value("citrix&rdp", "citrix_rdp_citrix_url");
		QString rdp_server 	= profile.get()->get_Map_Value("citrix&rdp", "citrix_rdp_rdp_server");
		QString rdp_domain 	= profile.get()->get_Map_Value("citrix&rdp", "citrix_rdp_rdp_domain");

		//go through every possible input
		if (input == "profile_info") {
			std::cout << 
				"system:\t\t\t" 	<< system << "\n" <<
				"language:\t\t\t" 	<< language << "\n" <<
				"keyboard:\t\t\t" 	<< keyboard << "\n" <<
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
				"citrix_store:\t\t" 	<< citrix_store << "\n" <<
				"citrix_url:\t\t" 	<< citrix_url << "\n" <<
				"rdp_server:\t\t" 	<< rdp_server << "\n" <<
				"rdp_domain:\t\t" 	<< rdp_domain << "\n" 
				<< "\n"; 


			//system & profile_name
		} else if (input == "system") {
			std::cout << system << std::endl;
		} else if (input == "language") {
			std::cout << language << std::endl;
		} else if (input == "keyboard") {
			std::cout << keyboard << std::endl;
		} else if (input == "client_logo") {
			std::cout << client_logo << std::endl;	
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
		} else if (input == "citrix_store") {
			std::cout << citrix_store << std::endl;
		} else if (input == "citrix_url") {
			std::cout << citrix_url << std::endl;
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

	} catch(const developer_error& e) {
		std::cout << -1 << std::endl;
		return;
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
		<< "\n" << "\t" << executable << " [0 Option] to start GUI, recommended as root" 
		<< "\n" << "\t" << executable << " [1 Option] to get values"
		<< "\n" << "\t" << executable << " [2 Options] to set values"
		<< "\n";
	std::cout << "\n[1 Option]"
		<< "\n" << "\t" << executable << " PARAMETER";

	std::cout 
		<< "\n" << "PARAMETER:" 
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
		<< "\n" << "\tlanguage		Print the used language out of the setting.ini" 
		<< "\n" << "\tkeyboard		Print the used keyboard out of the setting.ini" 
		<< "\n" << "\tclient_logo		Print the path + name of the client_logo" 
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
		<< "\n" << "\tcitrix_store		citrix-store" 		
		<< "\n" << "\tcitrix_url		citrix-url" 		
		<< "\n" << "\trdp_server		rdp-server" 		
		<< "\n" << "\trdp_domain		rdp-domain" 		
		<< "\n";

	std::cout 
		<< "\n" << "ERROR:"
		<< "\n" << "\treturn -1 on error" 
		<< "\n\n";
	std::cout << "\n[2 Options]"
		<< "\n" << "\t" << executable << " PARAMETER VALUE"
		<< "\n" << "PARAMETER:";
	std::cout 
		<< "\n" << "\t[Setter]\n"
		<< "\n" << "\tset_citrix_store	Set the value of the current profile of the key: citrix_rdp_citrix_store"
		<< "\n" << "\tset_citrix_url		Set the value of the current profile of the key: citrix_rdp_citrix_url"
		<< "\n" << "\tset_rdp_domain		Set the value of the current profile of the key: citrix_rdp_rdp_domain"
		<< "\n" << "\tset_rdp_server		Set the value of the current profile of the key: citrix_rdp_rdp_server"
		<< "\n"; 
	std::cout 
		<< "\n" << "ERROR/RETURN-VALUE:"
		<< "\n" << "\treturn 1 on success" 
		<< "\n" << "\treturn error-message on failure"
		<< "\n\n";
}


/**
 * create the networkmanager-files and restart the nm-service
 * uses the same function renew_nm_exec_commands(...) as in MainWindow::renew_nm()
 * @param profile Profile of current profile
 * @param setting Setting
 * no user-output (information-box) is used
 * @return true if successful, else false
 */
bool renew_nm_terminal(std::unique_ptr<IniFile> setting, std::unique_ptr<IniFile> profile) {

	bool isOK = true;
	QString logFolder = "";
	try {
		QString logFolder 	= setting.get()->get_Map_Value("path", "path_log");
		QString path 		= setting.get()->get_Map_Value("path", "path_networkmanager");
		QString system 		= setting.get()->get_Map_Value("system", "system");

		QString ip 		= profile.get()->get_Map_Value("network", "network_ip");
		QString netmask		= profile.get()->get_Map_Value("network", "network_netmask");
		QString gateway		= profile.get()->get_Map_Value("network", "network_gateway");
		QString dns 		= profile.get()->get_Map_Value("network", "network_dns");
		QString network_type  	= profile.get()->get_Map_Value("network", "network_type");

		QString wlan_active	= profile.get()->get_Map_Value("wlan", "wlan_active");
		QString ssid 		= profile.get()->get_Map_Value("wlan", "wlan_ssid");
		QString passwd 		= profile.get()->get_Map_Value("wlan", "wlan_passwd");

		//controls what happens with the given information of the profile
		renew_nm_exec_commands(system, path, wlan_active, ssid, passwd, network_type, ip, netmask, gateway, dns);

	} catch(const developer_error& e) {
		handle_error_terminal(e, logFolder);
		isOK = false;
	} catch(const customer_error& e) {
		handle_error_terminal(e, logFolder);
		isOK = false;
	} catch(const customer_info& e) {
		//just ignore this message, because it is for information like: 
		//"new added wlan. please wait 30sec till it takes effect"
		isOK = true;
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
