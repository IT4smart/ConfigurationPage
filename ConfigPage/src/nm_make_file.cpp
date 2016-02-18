/******************************************************************************\
|******************************************************************************|
|* 				nm_make_file.cpp 			      *|
|******************************************************************************|
\******************************************************************************/
#include <memory>		//unique_ptr
#include <QMap>
#include <QString>
#include "../inc/ini_parser.h"
#include "../inc/set_permission.h"
#include "../inc/nm_make_file.h"
#include "../inc/nm_make_functions.h"



/**
*  saves the file for the networkmanager ethernet dhcp
*  @param system (debian/arch) debian: 802-3-ethernet arch: ethernet
*  @param path path where the networkmanager file has to be saved, the name will be set by id 
*    	e.g. /etc/NetworkManager/system-connections or .../path/ with slash at the end
*/
void nm_make_file_ethernet_dhcp(QString system, QString path)
{
    nm_make_file("ethernet", system, path, "", "", "dhcp", "", "", "", "");
}

/**
*  saves the file for the networkmanager ethernet static
*  @param system (debian/arch) debian: 802-3-ethernet arch: ethernet 
*  @param path path where the networkmanager file has to be saved, the name will be set by id 
*    	e.g. /etc/NetworkManager/system-connections or .../path/ with slash at the end
*  @param ip ip-address
*  @param netmask netmask in both formats possible
*  @param gateway gateway
*  @param dns dns
*/
void nm_make_file_ethernet_static(QString system, QString path, QString ip,
				  QString netmask, QString gateway,
				  QString dns)
{
    nm_make_file("ethernet", system, path, "", "", "static", ip, netmask,
		 gateway, dns);
}

/**
*  saves the file for the networkmanager wlan dhcp
*  @param system (debian/arch) debian: 802-11-wireless arch: wifi 
*  @param path path where the networkmanager file has to be saved, the name will be set by id 
*    	e.g. /etc/NetworkManager/system-connections or .../path/ with slash at the end
*  @param ssid SSID of the WLAN
*  @param passwd unencrypted
*/
void nm_make_file_wlan_dhcp(QString system, QString path, QString ssid,
			    QString passwd)
{
    nm_make_file("wlan", system, path, ssid, passwd, "dhcp", "", "", "",
		 "");
}



/**
*  saves the file for the networkmanager wlan static
*  @param system (debian/arch) debian: 802-11-wireless arch: wifi 
*  @param path path where the networkmanager file has to be saved, the name will be set by id 
*    	e.g. /etc/NetworkManager/system-connections or .../path/ with slash at the end
*  @param ssid SSID of the WLAN
*  @param passwd unencrypted
*  @param ip ip-address
*  @param netmask netmask in both formats possible
*  @param gateway gateway
*  @param dns dns
*/
void nm_make_file_wlan_static(QString system, QString path, QString ssid,
			      QString passwd, QString ip, QString netmask,
			      QString gateway, QString dns)
{
    nm_make_file("wlan", system, path, ssid, passwd, "static", ip, netmask,
		 gateway, dns);
}


/**
*  saves the file for the networkmanager (ethernet/wlan)
*  @param id wlan or ethernet
*  @param system (debian/arch) debian: 802-11-wireless/802-3-ethernet arch: wifi/ethernet 
*  @param path path where the networkmanager file has to be saved, the name will be set by id 
*    	e.g. /etc/NetworkManager/system-connections or .../path/ with slash at the end
*  @param ssid SSID of the WLAN
*  @param passwd unencrypted
*  @param network_type dhcp; static (needs: ip, netmask, gateway, dns-server)
*  @param ip ip-address
*  @param netmask netmask in both formats possible
*  @param gateway gateway
*  @param dns dns
*/
void nm_make_file(QString id, QString system, QString path, QString ssid,
		  QString passwd, QString network_type, QString ip,
		  QString netmask, QString gateway, QString dns)
{
    QMap < QString, QMap < QString, QString >> gmap;
    QMap < QString, QString > cmap;

    QString type = nm_make_type(id, system);

    bool wlan = false;
    if (id == "wlan") {
	wlan = true;
    }
    //only needed with wlan
    QString security = type + "-security";

    //[conncetion]
    gmap.insert("connection", nm_make_connection(id, type));

    //[wifi/ethernet]
    if (wlan)
	gmap.insert(type, nm_make_wifi(id, ssid, security));
    else
	gmap.insert(type, nm_make_ethernet(id));

    //[wireless-securtity]
    if (wlan) {
	//nm_make_encrypt_password throws errorMesg if the ssid and passwd can't be used for encrytion, e.g. passwd is too short
	//if password is already encrypted, it will return the input (encrypted password)
	QString psk = nm_make_encrypt_password(ssid, passwd);

	gmap.insert(security, nm_make_wifi_security(psk));
    }
    //[ipv4] 
    if (network_type == "static")
	gmap.insert("ipv4",
		    nm_make_ipv4_static(ip, netmask, gateway, dns));
    else
	gmap.insert("ipv4", nm_make_ipv4_dhcp());


    //[ipv6] (dhcp only)
    gmap.insert("ipv6", nm_make_ipv4_dhcp());

    //there will be an error, in ini_saver if the directories of the path don't exist 
    path = path + "/" + id;
    //save ini-file 
    ini_saver(path, gmap);

    //set rights
    set_permission("root", path.toUtf8().constData());

    //restart networkmanager
    //TODO untested for debian
    nm_make_networkmanager_restart(system);
}
