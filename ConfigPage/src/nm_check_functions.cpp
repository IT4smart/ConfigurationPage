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
|* 				nm_check_functions.cpp			      *|
|******************************************************************************|
\******************************************************************************/



#include <regex>
//#include <QApplication> //too much
#include <QMap>
#include <QString>
#include <QStringList>
#include "../inc/custom_exceptions.h"
#include "../inc/nm_make_functions.h"





/**
*  checks whether the address has the right format, proof: w.x.y.z with w,x,y,z in [0,255]
*  very important:
*  each address part mustn't have a leading 0, so 192.178.1.001 would cause an error
*  @param _addr the address, e.g. ip, gateway, netmask, ...
*  @param _addr_name name of the address, e.g. ip, gateway, netmask, dns (for the error messages) and 
*  for comparison with "netmask" and
*  for comparison with "dns"
*  @return true if _addr fits the pattern, else false
*/
bool check_addr(QString _addr, QString _addr_name)
{
    std::string temp = _addr.toStdString();
    std::string addr_name = _addr_name.toStdString();

    std::regex pat {
    R"(^(\d{1,3}\.){3}\d{1,3}$)"};	//ip-address must look like between 0.0.0.0 or 123.456.789.0 

    if (std::regex_match(temp, pat)) {	//select strings only with pat in i
	QStringList list = _addr.split('.');
	//need conversion from QString to int: easier to compare und to print than QString
	std::vector < int >vec;
      for (QString i:list) {
	    vec.push_back(i.toInt());
	    //std::cout<< i.toUtf8().constData() <<std::endl;

	    //Check for leading 0's, they can only be found in the string, not in the integer (vec[i])
	    std::regex pat_0 {
	    R"(^0\d{1,2}$)"};	//?={0,1} \d=[0-9]   //no 000.00.001.011
	    if (std::regex_match(i.toStdString(), pat_0)) {
		//ErrorMessage
		throw customer_error(addr_name + std::string(":") + temp +
				     std::string
				     (" no leading 0, e.g. 000.00.001.011 is forbidden"));
		return false;
	    }
	}

	for (auto vect : vec) {
	    //Check if no value is greater than 255
	    if (vect > 255) {
		//std::cout << vect << " is bigger than 255" << std::endl;
		//ErrorMessage
		throw customer_error(std::to_string(vect) +
				     std::string(" is bigger than 255"));
		return false;
	    }

	}
	return true;
    } else {			//address doesn't fit the regex pattern
	if (addr_name == "netmask") {
	    //std::cout << "The netmask must be of the Format: x in [0,30] or w.x.y.z with w,x,y,z in [0,255]"<<std::endl;
	    //ErrorMessage
	    throw customer_error(std::string
				 ("The netmask must be of the Format: x in [0,30] or w.x.y.z with w,x,y,z in [0,255]"));
	} else if (addr_name == "dns") {
	    //std::cout << "The " << addr_name << " must be of the Format: w.x.y.z with w,x,y,z in [0,255]"<<std::endl;
	    //std::cout << "dns-server addresses seperated by semicolon ';', e.g. 8.8.8.8;8.8.4.4;" << std::endl;
	    //std::cout << "Your first faulty dns-part was:'" << _addr.toUtf8().constData() << "'" << std::endl;
	    //ErrorMessage
	    throw customer_error(std::string("The ") + addr_name +
				 std::string
				 (" must be of the Format: w.x.y.z with w,x,y,z in [0,255]")
				 +
				 std::string
				 ("dns-server addresses seperated by semicolon ';', e.g. 8.8.8.8;8.8.4.4;")
				 +
				 std::string
				 ("Your first faulty dns-part was:'")
				 + _addr.toStdString() +
				 std::string("'"));
	} else {
	    //std::cout << "The " << addr_name << " must be of the Format: w.x.y.z with w,x,y,z in [0,255]"<<std::endl;
	    //ErrorMessage
	    throw customer_error(std::string("The ") + addr_name +
				 std::string
				 (" must be of the Format: w.x.y.z with w,x,y,z in [0,255]"));
	}
	return false;
    }
}


/**
*  checks whether the dns fits into the given pattern: e.g. "8.8.8.8;8.8.4.4;"
*  @param dns dns to test
*  @return true if dns is in the right format, else false
*/
bool check_dns(QString dns)
{
    QStringList list = dns.split(';');
    //for (QString i : list) {
    for (int i = 0; i < list.size(); i++) {
	//test is needed for: "8.8.8.8;8.8.4.4;" & "8.8.8.8;8.8.4.4; "
	//otherwise list[i] would be for these examples: "" and " "
	//the first element mustn't be empty
	if (i == 0 || !(list[i] == "" || list[i] == " ")) {
	    //std::cout << "'" << i.toUtf8().constData() << "'" << std::endl;
	    //special error message in check_addr for dns
	    if (!(check_addr(list[i], "dns")))
		return false;
	}
    }
    return true;
}


/**
*  checks whether the ip-address fits into the subnet spanned by the gateway and netmask
*  @param _ip ip to test
*  @param _gateway gateway to test with
*  @param _netmask receives the netmask in the two common formats
*  @return true if _ip is possible in the gateway/netmask combination, else false
*/
bool check_ip_fits_gateway_with_netmask(QString _ip, QString _gateway,
					QString _netmask)
{
    QString netmask = nm_make_netmask_x(_netmask);
    int netmask_num = _netmask.toInt();
    int count = 0;
    while (netmask_num >= 8) {
	count++;
	netmask_num -= 8;
    }

    QStringList list_ip = _ip.split('.');
    QStringList list_gateway = _gateway.split('.');
    for (int i = 0;
	 i < count && i < list_ip.size() && i < list_gateway.size(); i++) {
	if (list_ip[i] != list_gateway[i]) {
	    //std::cout << "IP-Part " << list_ip[i].toUtf8().constData() 
	    //<<" doesn't fit Gateway-Part " << list_gateway[i].toUtf8().constData() << " with this given Netmask!" << std::endl;
	    //ErrorMessage
	    throw customer_error(std::string("IP-Part ") +
				 list_ip[i].toStdString() +
				 std::string(" doesn't fit Gateway-Part ")
				 + list_gateway[i].toStdString() +
				 std::string(" with this given Netmask!"));
	    return false;
	}
    }
    return true;
}



/**
*  checks whether the mac-address has the right format: e.g. 1A:B2:F3:19:08:57
*  @param mac the address in format: e.g. 1A:B2:F3:19:08:57
*  @return true if mac fits the pattern, else false
*/
bool check_mac(QString mac)
{
    std::string temp = mac.toStdString();

    std::regex pat {
    R"(^([A-F0-9]{2}:){5}[A-F0-9]{2}$)"};	//ip-address must look like between 0.0.0.0 or 123.456.789.000 

    if (!(std::regex_match(temp, pat))) {
	//std::cout << "The MAC-Address:" << temp << " must be of the Format: e.g. 1A:B2:F3:19:08:57" << std::endl;
	//ErrorMessage LOGIC
	throw developer_error(std::string("The MAC-Address: '") + temp +
			      std::string
			      ("' must be of the Format: e.g. 1A:B2:F3:19:08:57"));
	return false;
    }
    return true;
}



/**
*  the function checks whether there is at least one time the char sign  in the phrase
*  @param sign one single letter to be checked. no special regex letters allowed
*  @param phrase to be checked
*  @param name name of the phrase, so that the ErrorMessage can be without printing any password, etc.
*  @return true	if no sign e.g. '/apostrophe found in phrase, else false
*/
bool check_for_sign(QString sign, QString phrase, QString name)
{
    std::string temp = phrase.toStdString();
    std::string pat_part = sign.toStdString();

    //test that sign is only of one character 
    std::regex one_char {
    R"(^.{1}$)"};
    if (!(std::regex_match(pat_part, one_char))) {
	//std::cout << "in check_for_sign\nNOT ALLOWED:" << sign.toUtf8().constData() 
	//      << " is only allowed to be one character" << std::endl;
	//ErrorMessage LOGIC
	throw
	    developer_error(std::string("In check_for_sign\nNOT ALLOWED:")
			    + sign.toStdString() +
			    std::string
			    (" is only allowed to be one character"));
    }
    //and if there are special-letters, there will be a \\ before it
    if (pat_part == "." ||
	pat_part == "[" ||
	pat_part == "]" ||
	pat_part == "{" ||
	pat_part == "}" ||
	pat_part == "(" ||
	pat_part == ")" ||
	pat_part == "\\" ||
	pat_part == "*" ||
	pat_part == "+" ||
	pat_part == "?" ||
	pat_part == "|" || pat_part == "^" || pat_part == "$") {
	pat_part = "\\" + pat_part;

    }

    std::regex pat {
    "^.*" + pat_part + ".*$"};
    //std::regex pat {R"(^.*'.*$)"};
    if (std::regex_match(temp, pat)) {
	//std::cout << "NOT ALLOWED: there is a " << sign.toUtf8().constData() << " in the " << name.toUtf8().constData() << std::endl;
	//ErrorMessage
	throw customer_error(std::string("NOT ALLOWED: there is a ") +
			     sign.toStdString() +
			     std::string(" in the ") +
			     name.toStdString());
	return false;
    }
    //std::cout << "ALLOWED: there is a " << sign.toUtf8().constData() << " in the " << name.toUtf8().constData() << std::endl;
    return true;

}


/**
*  the function checks whether there is a single apostrophe in the phrase
*  @param phrase to be checked
*  @param name name of the phrase, so that the ErrorMessage can be without printing any password, etc.
*  @return true	if no '/apostrophe found in phrase, else false
*/
bool check_for_apostrophe(QString phrase, QString name)
{
    if (check_for_sign("'", phrase, name))
	return true;
    return false;
}

/**
*  the function checks whether there is a '=' in the phrase
*  @param phrase to be checked
*  @param name name of the phrase, so that the ErrorMessage can be without printing any password, etc.
*  @return true	if no = found in phrase, else false
*/
bool check_for_equal_sign(QString phrase, QString name)
{
    if (check_for_sign("=", phrase, name))
	return true;
    return false;
}

/**
*  TODO untested for debian
*  check the restart of the networkmanager service on debian or arch
*  @param system debian or arch
*  @return true if everything worked fine, else false
*/
bool check_networkmanager_restart(QString system, QString output)
{
    //arch not installed:
    //      Failed to restart NetworkManager.service: Unit NetworkManager.service failed to load: No such file or directory.
    //ubuntu not installed: 
    //      network-manager stop/waiting
    //      network-manager start/running
    //ubuntu installed: 
    //      network-manager stop/waiting
    //      network-manager start/running, process 2664
    //arch installed: 
    //      nothing
    std::string temp = output.toStdString();
    if (system == "debian") {
	//pid until 8 digits, although the normal maximum number is 32768, see "cat /proc/sys/kernel/pid_max"
	std::regex pat {
	R"(network-manager stop/waiting\snetwork-manager start/runnning, process \d{1,8}\s$)"};
	if (!(std::regex_match(temp, pat))) {
	    //ErrorMessage LOGIC
	    throw developer_error(std::string
				  ("Restart for network-manager failed with this message:'")
				  + temp + std::string("'"));
	    return false;
	}
    } else if (system == "arch") {
	if (temp != "") {
	    //std::cout << "ARCH FAILED IN CHECK..." << std::endl;
	    //ErrorMessage LOGIC
	    throw developer_error(std::string
				  ("Restart for NetworkManager failed with this message:'")
				  + temp + std::string("'"));
	    return false;
	}
    } else {
	//ErrorMessage LOGIC
	throw developer_error(std::string("Wrong system '") +
			      system.toStdString() +
			      std::string
			      ("' for restarting the networkmanager\n only [debian,arch] allowed"));
	return false;
    }
    return true;
}
