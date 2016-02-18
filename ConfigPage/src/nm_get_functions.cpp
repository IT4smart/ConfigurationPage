/******************************************************************************\
|******************************************************************************|
|* 				nm_get_functions.cpp			      *|
|******************************************************************************|
\******************************************************************************/

#include <QString>
#include <regex>
#include "../inc/custom_exceptions.h"
#include "../inc/exec_cmd.h"
#include "../inc/nm_check_functions.h"


/**
*  get the mac-address of wifi or ethernet
*  and check for correctness
*  throws exception in check_mac if the mac is empty/in wrong format
*  @param id the id of the network wifi/ethernet
*  @return the mac-address, if invalid: empty QString
*/
QString get_mac(QString id)
{
    std::string output;
    std::string cmd;
    if (id == "wlan")
	cmd =
	    "ip address |grep -A 1 ' wl.*: ' | grep link/ether | awk {'print $2'} | tr [:lower:] [:upper:] | tr -d '\n'";
    else
	cmd =
	    "ip address |grep -A 1 ' e[a-zA-Z0-9]*0: ' | grep link/ether | awk {'print $2'} | tr [:lower:] [:upper:] | tr -d '\n'";
    //exec_cmd returns "" if something went wrong and throws exception
    output = exec_cmd(cmd);
    QString mac = QString::fromStdString(output);
    //throws exception if it doesn't fit the pattern
    check_mac(mac);
    return mac;
}

/**
*  get a new generated uuid for the connection part
*  @return the uuid, if invalid: empty QString
*/
QString get_uuid()
{
    std::string output;
    std::string cmd;
    cmd = "uuid -n 1 | tr -d '\n'";
    //exec_cmd returns "" if something went wrong
    output = exec_cmd(cmd);
    //output should be 12345678-abcd-abcd-abcd-123456789012 means 8+4*4+12=36 times [:alnum:]=/letter or \d=digit or -
    std::regex pat {
    R"(^[-[:alnum:]\d]{36}$)"};
    if (!(std::regex_match(output, pat))) {
	//std::cout << "'" << output << "'" << std::endl << "This no valid uuid" << std::endl;
	//ErrorMessage LOGIC
	throw developer_error(std::string("'") + output +
			      std::string("'\n") +
			      std::string("This no valid uuid"));
	return "";
    }
    //std::cout << output << std::endl;
    return QString::fromStdString(output);
}
