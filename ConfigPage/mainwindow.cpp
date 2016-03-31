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
  |* 				mainwindow.cpp				      *|
  |******************************************************************************|
  \******************************************************************************/
#include <QDesktopWidget>
#include <QString>
#include <iostream>
#include <stdexcept>
#include <string>
#include <memory>
#include <algorithm>
#include <QFile>
#include <QFileDialog>
#include <QFileSystemModel>
#include "./inc/proxyModel.h"
#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "../../libs/tools/inc/custom_exceptions.h"
#include "../../libs/tools/inc/paths.h" 		//for path to setting.ini
#include "../../libs/tools/inc/nm_get_functions.h" 		//for testing

//TODO DOCUMENTATION LIKE THIS:
/**
 *  read in the names of all possible profile in the profiles folder
 *  and sort these entries alphabetically
 *  @param s_profilesFolder directory of the folder in which the profiles lie in
 *  @throw developer_error why this exceptions is thrown
 *  @return Vector of Strings with all profile names in the profile Folder
 */

/**
 *
 * TODO exceptions mit sprachen
 *
 * TODO certificates upload with building certificates
 *
 */


/**
 * Constructor
 * @param parent take its parent
 */
MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow),
	setting{}, 
	profile{},
	language{},
	language_fallback{},
	language_extern{},
	language_extern_fallback{},
	exception{},
	exception_fallback{}
{
	ui->setupUi(this);




	// make the boxes look nice more info: http://doc.qt.io/qt-5/qtwidgets-widgets-stylesheet-example.html
	this->setStyleSheet("QGroupBox { border: 1px solid gray; border-radius: 9px; margin-top: 0.5em; };"
			"QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px; };");

	// set mask at screen center
	QRect rck = this->geometry ();
	rck.moveCenter (QApplication::desktop ()->availableGeometry().center()) ;
	this->setGeometry (rck);
	this->setMinimumSize (this->size ());
	this->setMaximumSize (this->size ());

	// loads global settings of setting.ini
	try {
		setting = IniFile(SETTING_PATH, SETTING_FILE, SETTING_ENDING);
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}

	//read in all languages and set the right one on screen, incl fallback
	init_language();
////////////////
	//initialize the exception-MapMap from the language, same for _fallback
	exception 		= ControlMapMap(language.get_Map());
	exception_fallback 	= ControlMapMap(language_fallback.get_Map());
	//extend the exception-MapMap with the entries of the extern language IniFile, same for _fallback
	exception 		+= language_extern.get_Map();
	exception_fallback 	+= language_extern_fallback.get_Map();

////////////////
	// load last profile
	reload_profile();

	// set profile option in setting.ini
	setDrDwProfilesOpt();

	// read in the last profile and show all information on the screen
	// check if there is an useable wlan
	// sets logos
	printProfile();
	check_wlan();
	set_logos();

}

/**
 * Destructor
 */
MainWindow::~MainWindow()
{
	delete ui;
}






/******************************************************************************\
|******************************************************************************|
|* 				slots	  				      *|
|******************************************************************************|
\******************************************************************************/

/**
 *  all new settings will be discard
 *  the app is closed with return 0;
 */
void MainWindow::on_btn_cancel_clicked()
{
	QApplication::quit();
}


/**
 *  TODO always keep the functions in there up to date
 *  check network-input and wlan (if-active) and save it to the Map
 *  make nm-files and restart nm
 *  save (only) the current Profile and save this as Default-Profile 
 *  the app is closed with return 0;
 */
void MainWindow::on_btn_save_quit_clicked()
{
	//check for network, wlan, citrix. In these functions the Map will be updated and exceptions are handled
	if (check_network_input() && check_wlan_input() && check_citrix_rdp_input()) {
		//try to save profile to harddisk
		try {
			profile.save_Map_to_IniFile();
		} catch(const developer_error& e) {
			handle_developer_error(e);
			return;
		}
		//if this worked, make new nm-file(s) and restart nm,
		//renwe_nm throw and catch its exceptions
		if (renew_nm()) {
			//save this profile as the last profile only if everything worked fine
			//and the last used client logo
			save_last_profile_from_ui();
			save_client_logo_from_ui();

			//quit
			QApplication::quit();
		}
	}
}






/******************************************************************************\
|******************************************************************************|
|* 				slots: network & wlan			      *|
|******************************************************************************|
\******************************************************************************/

/**
 *  write the new values in the MapMap of profile
 *  if dhcp: the ip, netmask, gateway and dns won't be checked
 */
void MainWindow::on_btn_change_network_clicked()
{
	if (check_network_input()) {
		//TODO print_customer_info
		informationMessage (this,"Network changed: Save & Quit to make changes permanent.");
	}
}


/**
 *  write the new values in the MapMap of profile
 *  if  WLan is inactive: ssid and passwd won't be checked and saved unencrypted
 */
void MainWindow::on_btn_change_wlan_clicked()
{
	if (check_wlan_input()) {
		//TODO print_customer_info
		informationMessage (this,"WLan changed: Save & Quit to make changes permanent.");
	}
}




/**
 *  the de/activation of the WLan
 */
void MainWindow::on_chk_wlan_active_clicked()
{
	if (ui->chk_wlan_active->isChecked())
		activate_inputfields_wlan(true);
	else
		activate_inputfields_wlan(false);
	
}

/**
 *  set dhcp and disable all input-fields
 */
void MainWindow::on_rdb_network_type_dhcp_clicked()
{
	ui->rdb_network_type_dhcp	->setChecked(true);
	ui->rdb_network_type_static	->setChecked(false);
	activate_inputfields_network(false);
}


/**
 *  set static and enable all input-fields
 */
void MainWindow::on_rdb_network_type_static_clicked()
{
	ui->rdb_network_type_dhcp	->setChecked(false);
	ui->rdb_network_type_static	->setChecked(true);
	activate_inputfields_network(true);
}





/******************************************************************************\
|******************************************************************************|
|* 				slots: citrix & rdp			      *|
|******************************************************************************|
\******************************************************************************/


/**
 *  set dhcp and disable all input-fields
 */
void MainWindow::on_rdb_citrix_rdp_type_citrix_clicked()
{
	ui->rdb_citrix_rdp_type_citrix	->setChecked(true);
	ui->rdb_citrix_rdp_type_rdp	->setChecked(false);
	activate_inputfields_citrix(true);
	activate_inputfields_rdp(false);
}


/**
 *  set static and enable all input-fields
 */
void MainWindow::on_rdb_citrix_rdp_type_rdp_clicked()
{
	ui->rdb_citrix_rdp_type_citrix	->setChecked(false);
	ui->rdb_citrix_rdp_type_rdp	->setChecked(true);
	activate_inputfields_citrix(false);
	activate_inputfields_rdp(true);
}

/**
 *  write the new values in the MapMap of profile
 *  and set the right type for it
 */
void MainWindow::on_btn_change_citrix_rdp_clicked()
{
	if (check_citrix_rdp_input()) {
		informationMessage (this,"Citrix & RDP changed: Save & Quit to make changes permanent.");
	}
}




/******************************************************************************\
|******************************************************************************|
|* 				slots: profiles		  		      *|
|******************************************************************************|
\******************************************************************************/


/**
 * Delet the current profile if possible (make checks for last_profile in setting.ini)
*/
void MainWindow::on_btn_profile_delete_clicked()
{
	delProfile();
}


/**
*  if new: 
*	New Profile: make it possible to type a new profilename and variables like network, wlan, ...
*  	disabling the Save & Quit button, to prevent saving an invalid last_profile
*  else:
*  	test for valid profilename
*  	try to save values to map, afterwards to harddisk
*
*  doesn't change the last_profile
*/
void MainWindow::on_btn_profile_new_clicked() {

	//think of language_fallback
	QString profile_new = (language.get_Map_Value("button", "profile_new") != "") 
			? language.get_Map_Value("button", "profile_new") 
			: language_fallback.get_Map_Value("button", "profile_new");

	if( !ui->btn_profile_new->text().compare(profile_new)) {
		new_profile_clicked();
	} else {
		save_new_profile_clicked();
	}
}



/**
 *  on each change of the dropdown menu profiles
 *  load & print the current profile, then check for wlan
 *  @param profile_Name Name of the selected profile
 */
void MainWindow::on_drdw_profiles_activated(const QString &profile_Name) 
{
	try {
		//set the name and reload Map
		profile.set_IniFile_Name(profile_Name);
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}
	printProfile();
	// deactivate the wlan if no wlan-module is available
	check_wlan();
}



/******************************************************************************\
|******************************************************************************|
|* 				slots: pictures		  		      *|
|******************************************************************************|
\******************************************************************************/


/**
 *  on each change of the dropdown menu pictures
 *  change the viewed pic
 *  @param logo name of the new logo
 */
void MainWindow::on_drdw_pictures_activated(const QString &logo)
{
	drdw_pictures_select(logo);
}


/**
*  delete the current client_logo
*  check if text of client_logo to be deleted: 
*	last-exisiting client_logo
*	empty
*	last_client_logo in setting.ini -> then set a new last_client_logo
*/
void MainWindow::on_btn_pictures_delete_clicked()
{
	pictures_delete();
}



/**
 * show dialog to upload a new picture
 * connect signals to update the new pic and the drdw-pic-list
 */
void MainWindow::on_btn_pictures_upload_clicked()
{
	QString usbPath = setting.get_Map_Value("path", "path_usb");
	QString outPath = setting.get_Map_Value("path", "path_client_logo");

	FileSystemModelDialog *dialog = new FileSystemModelDialog(this, usbPath, outPath, false,
								 ui->drdw_pictures, ui->lb_picture_left);	
	//connect the signal of a new picture accepted to update the list and then update the pic itself on the gui
	QObject::connect(dialog, 	SIGNAL(signalPictureAdd(const QString &)), 
			this, 		SLOT(selectNewPicture(const QString &)));
	QObject::connect(dialog, 	SIGNAL(signalPictureAdd(const QString &)), 
			this, 		SLOT(on_drdw_pictures_activated(const QString &)));	
	dialog->resize(700,500);
	dialog->show();
}

/**
 *  read in all possibly new pictures and updates the drdw-menu
 *  set the new picture-name to the given one
 */
void MainWindow::selectNewPicture(const QString &logo)
{
	ui->drdw_pictures->clear ();
	//read in and sort all the pictures of client logos and put them into the drdw
		//profile.loadProfile(setting.get_Map_Value("profile", "last_profile"));
	setDrDwPicturesList(readInPictures());
	ui->drdw_pictures->setCurrentText(logo);
}


/******************************************************************************\
|******************************************************************************|
|* 			slots: certificate 				      *|
|******************************************************************************|
\******************************************************************************/

/**
 * show dialog to upload a certificate
 */
void MainWindow::on_btn_certificates_upload_clicked()
{
	QString usbPath = setting.get_Map_Value("path", "path_usb");
	QString outPath = setting.get_Map_Value("path", "path_certificates");
	//unique_ptr not possbile, because directly running out of scope without even having seen the dialog
	FileSystemModelDialog* dialog = new FileSystemModelDialog(this, usbPath, outPath, true);
	dialog->resize (700,500);
	dialog->show();
}



/******************************************************************************
 ******************************************************************************
 * 			slots: languages and keyboard  			      *
 ******************************************************************************
 ******************************************************************************/

/**
 *  save the current language as default language in the setting.ini if clicked on a new language
 *
 *  on each change of the dropdown menu languages
 *  load & print the current language
 *  @param language_Name Name of the selected language
 */
void MainWindow::on_drdw_languages_activated(const QString &language_Name) 
{
	try {
		//set the name and reload Map
		language.set_IniFile_Name(language_Name);
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}
	//save the new language as default; afterwards the init_language can be used. 
	set_current_language_to_default();
	//catches the case where the language is not available as exception, and so the fallback is used. 
	//uses the values saved in the current language and the language_fallback
	init_language();
}
