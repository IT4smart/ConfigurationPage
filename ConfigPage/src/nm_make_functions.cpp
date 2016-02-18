/******************************************************************************\
|******************************************************************************|
|* 				nm_make_functions.cpp			      *|
|******************************************************************************|
\******************************************************************************/

#include <QMap>
#include <QString>
#include <QStringList>
#include <regex>
#include <iostream>
#include "../inc/custom_exceptions.h"
#include "../inc/exec_cmd.h"
#include "../inc/nm_check_functions.h"
#include "../inc/nm_make_functions.h"
#include "../inc/nm_get_functions.h"

/**
*  check for id [wlan,ethernet] and system [debian,arch] and set type
*  @param id the id of the network wifi/ethernet
*  @param system e.g. debian/arch needs diffrent typenames
*  @return type of the network depending on the system, if invalid id or system: empty String ""
*/
QString nm_make_type(QString id, QString system)
{
    if (id == "wlan") {
	if (system == "debian")
	    return "802-11-wireless";
	else if (system == "arch")
	    return "wifi";
	else {
	    //std::cout << "Wrong system '" << system.toUtf8().constData() 
	    //<< "' for saving networkmanager-settings\n only [debian,arch] allowed"<<std::endl;
	    //ErrorMessage LOGIC
	    throw developer_error(std::string("Wrong system '") +
				  system.toUtf8().constData() +
				  std::string
				  ("' for saving networkmanager-settings\n only [debian,arch] allowed"));
	    return "";
	}
    } else if (id == "ethernet") {
	if (system == "debian")
	    return "802-3-ethernet";
	else if (system == "arch")
	    return "ethernet";
	else {
	    //std::cout << "Wrong system '" << system.toUtf8().constData() 
	    //<< "' for saving networkmanager-settings\n only [debian,arch] allowed"<<std::endl;
	    //ErrorMessage LOGIC
	    throw developer_error(std::string("Wrong system '") +
				  system.toUtf8().constData() +
				  std::string
				  ("' for saving networkmanager-settings\n only [debian,arch] allowed"));
	    return "";
	}
    } else {
	//std::cout << "Wrong id '" << id.toUtf8().constData() 
	//      << "' for saving networkmanager-settings\n only [wlan,ethernet] allowed"<<std::endl;
	//ErrorMessage LOGIC
	throw developer_error(std::string("Wrong id '") +
			      id.toUtf8().constData() +
			      std::string
			      ("' for saving networkmanager-settings\n only [wlan,ethernet] allowed"));
	return "";
    }
}


/**
*  the function calculates an integer netmask to better handle it
*  and checks whether the _netmask has the right format
*  @param _netmask receives the netmask in the two common formats
*	x in [0,30] or w.x.y.z with w,x,y,z in [0,255]
*  @return the netmask in the format of a number with 2 digits
*  	if invalid, only an empty QString
*/
QString nm_make_netmask_x(QString _netmask)
{
    std::string temp = _netmask.toUtf8().constData();

    std::regex pat {
    R"(^\d{1,2}$)"};		//netmask must look like x in [0,99] 

    int netmask_num = 0;	//number of bits in netmask
    if (std::regex_match(temp, pat)) {	//select strings only with pat in i
	netmask_num = _netmask.toInt();
    } else if (check_addr(_netmask, "netmask")) {	//checks whether we have an address (regex) and with numbers smaller than 256
	//otherwise there will be an exception thrown in check_addr
	QStringList list = _netmask.split('.');
	//need conversion from QString to int: easier to compare und to print than QString
	std::vector < int >vec;
      for (QString i:list) {
	    vec.push_back(i.toInt());
	    //std::cout<< i.toUtf8().constData() <<std::endl;
	}
	for (unsigned int i = 0; i < vec.size(); i++) {
	    //Check if this value is less than 255, the value before must be 255
	    if (i > 0 && vec[i] < 255 && vec[i] != 0) {
		if (vec.at(i - 1) != 255) {
		    //std::cout << vec[i-1]<<" is not 255 although " <<  "0!=" << vec[i] << "<255" << std::endl;
		    //ErrorMessage
		    throw customer_error(std::to_string(vec.at(i - 1)) +
					 std::string
					 (" is not 255 although 0!=")
					 + std::to_string(vec[i]) +
					 std::string("<255"));
		    return "";
		}
		//special case for i=0, so prevent cases like 0.255.0.0 or 7.255.0.0
	    } else if (i == 0 && vec[i] < 255) {
		if (vec.at(i + 1) != 0) {
		    //std::cout << vec[i+1]<<" is not 0 although " << vec[i] << "<255" << std::endl;
		    //ErrorMessage
		    throw customer_error(std::to_string(vec.at(i + 1)) +
					 std::string(" is not 0 although ")
					 + std::to_string(vec[i]) +
					 std::string("<255"));
		    return "";
		}
	    }
	    //Check if there wont be values that aren't powers of 2 minus 1, or not 0
	    if (vec[i] != 0) {
		//if (vec[i] < 0) //won't happen because of regex
		int x = vec[i] + 1;
		while (((x % 2) == 0) && x > 1) {	// While x is even and > 1 
		    x /= 2;
		    netmask_num++;
		}
		if (x != 1) {
		    //std::cout << vec[i] << " is not a power of 2 minus 1" << std::endl;
		    //ErrorMessage
		    throw customer_error(std::to_string(vec[i]) +
					 std::string
					 (" is not a power of 2 minus 1"));
		    return "";
		}
	    }
	    //std::cout << vec[i] << std::endl;
	}

    } else {			//netmask doesn't fit any regex pattern
	//ErrorMessage is included in check_addr(_netmask, "netmask")
	//if it doesn't fit the pattern, to no exception needed here
	return "";
    }

    //netmask must be smaller or equal to 30, otherwise there is no possible ipv4 number:
    //because 2 addresses are needed for the TCP/IP protocol, e.g. the device-ip and the broadcast-ip
    if (netmask_num > 30) {
	//std::cout << "The netmask is too big! netmask <= 30 to make sense"<<std::endl;
	//ErrorMessage
	throw customer_error(std::string
			     ("The netmask is too big! netmask <= 30 to make sense"));
	return "";
    }
    //std::cout << "netmask is: " << netmask_num << std::endl;
    return QString::number(netmask_num);
}

/**
*  the function calculates an netmask of the format w.x.y.z
*  and checks whether the _netmask has the right format
*  @param _netmask receives the netmask in the two common formats
*	x in [0,30] or w.x.y.z with w,x,y,z in [0,255]
*  @return the netmask in the format of w.x.y.z
*  	if invalid, only an empty QString
*/
QString nm_make_netmask_wxyz(QString _netmask)
{
    //if the given netmask doesn't fit the rules, return "";
    if (nm_make_netmask_x(_netmask) == "")
	return "";

    std::string temp = _netmask.toUtf8().constData();
    std::regex pat {
    R"(^\d{1,2}$)"};		//netmask must look like x in [0,99] 
    //netmask is in the xy format and needs to transformed to w.x.y.z
    if (std::regex_match(temp, pat)) {
	int netmask_num = _netmask.toInt();
	if (netmask_num == 0)
	    return "0.0.0.0";
	int count = 0;
	QString netmask;
	while (netmask_num > 8) {
	    netmask += "255.";
	    count++;
	    netmask_num -= 8;
	}
	//make the last number, which is not 0
	int last = 1;
	while (netmask_num > 0) {
	    last *= 2;
	    netmask_num--;
	}
	last--;			//to get values from 0 to 255
	netmask += QString::number(last);
	count++;
	while (count < 4) {
	    netmask += ".0";
	    count++;
	}
	return netmask;
	//if the netmask has already the right format of w.x.y.z
    } else if (check_addr(_netmask, "netmask"))
	return _netmask;
    else
	return "";
}



/**
*  make the section connection in the networkmanager-page
*  @param id the id of the network wifi/ethernet
*  @param type QString of format e.g. wifi/802-11-wireless
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_connection(QString id, QString type)
{
    //[connection]
    QMap < QString, QString > cmap;
    cmap.insert("id", id);
    cmap.insert("uuid", get_uuid());
    cmap.insert("type", type);
    cmap.insert("autoconnect", "true");
    return cmap;
}

/**
*  make the section wifi in the networkmanager-page
*  @param id wlan
*  @param ssid the ssid of the WLAN
*  @param security QString of format e.g. wifi-security/802-11-wireless-security
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_wifi(QString id, QString ssid,
				       QString security)
{
    //[wifi]
    QMap < QString, QString > cmap;
    cmap.insert("ssid", ssid);
    cmap.insert("mode", "infrastructure");
    cmap.insert("security", security);
    cmap.insert("mac-address", get_mac(id));
    return cmap;
}

/**
*  make the section ethernet in the networkmanager-page
*  @param id ethernet
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_ethernet(QString id)
{
    //[ethernet]
    QMap < QString, QString > cmap;
    cmap.insert("mac-address", get_mac(id));
    return cmap;
}

/**
*  make the section wifi-security in the networkmanager-page
*  @param psk the encrypted wifi-password
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_wifi_security(QString passwd)
{
    //[wifi-security]
    QMap < QString, QString > cmap;
    cmap.insert("key-mgmt", "wpa-psk");
    cmap.insert("auth-alg", "open");
    cmap.insert("psk", passwd);
    return cmap;
}


/**
*  checks whether the ssid and the passwd can be encrypted 
*  (long enough and without e.g. apostrophe and = (= for the ini_parser)) by wpa_passphrase
*  if yes, it will do it
*  Additionally:
*  Tests if the given Password is already encryted 
*  (that means if the given password is: 64-characters [a-z0-9])
*  this has a loophole, because if the user's password is of 64 it won't be encrypted, 
*  but it will work unencrypted as well
*  @param ssid ssid of the WLAN
*  @param passwd password of the WLAN
*  @return 64-characters [a-z0-9] long encrypted passphrase 
*/
QString nm_make_encrypt_password(QString ssid, QString passwd)
{
    if (check_for_apostrophe(ssid, "SSID")
	&& check_for_apostrophe(passwd, "Password")
	&& check_for_equal_sign(ssid, "SSID")
	&& check_for_equal_sign(passwd, "Password")) {
	//Control: Passphrase must be 8..63 characters
	std::regex pat {
	R"(^.{8,63}$)"};
	std::regex pat_encrypted {
	R"(^[a-z0-9]{64}$)"};
	//check for already encrypted
	if (std::regex_match(passwd.toUtf8().constData(), pat_encrypted)) {
	    //TODO ErrorMessage DEBUG and std::cout 
	    std::cout <<
		"Password already encrypted or in the same format (won't be encrypted)"
		<< std::endl;
	    return passwd;
	} else if (!(std::regex_match(passwd.toUtf8().constData(), pat))) {
	    std::cout << "Password must be 8..63 characters" << std::endl;
	    //ErrorMessage
	    throw customer_error(std::string
				 ("Password must be 8..63 characters"));
	    return "";
	}
	//wpa_passphrase 'name of accesspoint' 'max. 63-character WPA-key' 
	QString cmd = "wpa_passphrase '" + ssid + "'  '" + passwd + "'";
	//to grep only the new made psk
	cmd =
	    cmd +
	    " | grep psk | tail -1 | sed s/=/' '/g | awk {'print $2'} | tr -d '\n'";
	std::string output = exec_cmd(cmd.toUtf8().constData());
	//std::cout << output << std::endl;
	return QString::fromStdString(output);
    }
    return "";
}

/**
*  check whether ip, gateway and netmask have the right format and fit together and
*  then returns the ipv4_address in the format as
*  ip;netmask[0,32];gateway;
*  e.g. ipv4_address ="192.168.178.70;24;192.168.178.1;";
*  is needed for the networkmanager
*  @param ip ip-address
*  @param netmask netmask in both formats possible
*  @param gateway gateway
*  @return if everything is valid: the ipv4_address in the format as it is needed for the networkmanager
*  	else empty String
*/
QString nm_make_ipv4_address(QString ip, QString netmask, QString gateway)
{
    //doesn't need to throw an exception, because every function itself would do
    if (check_addr(ip, "ip") && check_addr(gateway, "gateway")) {
	//netmask is checked inside the nm_make_netmask_x/wxyz function
	QString new_netmask = nm_make_netmask_x(netmask);
	if (check_ip_fits_gateway_with_netmask(ip, gateway, new_netmask)) {
	    return ip + ";" + new_netmask + ";" + gateway + ";";
	}
    }
    return "";
}


/**
*  make the section ipv4 for static in the networkmanager-page
*  @param ip ip-address
*  @param netmask netmask in both formats possible
*  @param gateway gateway
*  @param dns dns
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_ipv4_static(QString ip, QString netmask,
					      QString gateway, QString dns)
{
    QMap < QString, QString > cmap;
    //checks made for ip, netmask and gateway in nm_make_ipv4_address
    cmap.insert("addresses1", nm_make_ipv4_address(ip, netmask, gateway));
    if (check_dns(dns))
	cmap.insert("dns", dns);
    cmap.insert("method", "manual");
    return cmap;
}



/**
*  make the section ipv4 for dhcp in the networkmanager-page
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_ipv4_dhcp()
{
    QMap < QString, QString > cmap;
    cmap.insert("method", "auto");
    return cmap;
}


/**
*  make the section ipv6 for dhcp in the networkmanager-page
*  @return QMap to be directly added to the network-page
*/
QMap < QString, QString > nm_make_ipv6_dhcp()
{
    QMap < QString, QString > cmap;
    cmap.insert("method", "auto");
    return cmap;
}

/**
*  TODO untested for debian
*  restart the networkmanager service on debian or arch
*  and check for correctness
*  @param system debian or arch
*  @return true if everything worked fine, else false
*/
bool nm_make_networkmanager_restart(QString system)
{
    //      sudo systemctl restart NetworkManager.service
    //      sudo service network-manager restart
    std::string output;
    std::string cmd;
    if (system == "debian") {
	cmd = "service network-manager restart";
    } else if (system == "arch") {
	cmd = "systemctl restart NetworkManager.service";
    } else {
	//ErrorMessage LOGIC
	throw developer_error(std::string("Wrong system '") +
			      system.toUtf8().constData() +
			      std::string
			      ("' for restarting the networkmanager\n only [debian,arch] allowed"));
	return false;
    }
    //exec_cmd returns "" if something went wrong
    output = exec_cmd(cmd);
    QString q_output = QString::fromStdString(output);
    //throws exception if it doesn't fit the pattern
    check_networkmanager_restart(system, q_output);
    return true;
}
