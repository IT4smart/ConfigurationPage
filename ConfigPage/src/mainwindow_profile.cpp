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
|* 			mainwindow_profile.cpp				      *|
|******************************************************************************|
\******************************************************************************/

#include <QString>
#include <cassert>
#include <iostream>
#include <dirent.h> // for finding all profiles a certain directory
#include <regex>
#include "../inc/proxyModel.h"
#include "../mainwindow.h"
#include "../ui_mainwindow.h"
#include "../inc/errorMsg.h"
#include "../../../libs/tools/inc/custom_exceptions.h"
#include "../../../libs/tools/inc/remove_file.h"
#include "../../../libs/tools/inc/ini_parser.h"




/******************************************************************************\
|******************************************************************************|
|* 				Profiles				      *|
|******************************************************************************|
\******************************************************************************/

/**
 * reload the profile with the folder, last_profile and profile_ending saved in setting.MapMap
 * via IniFile constructor
 */
void MainWindow::reload_profile() {
	// load last profile
	QString profilesFolder 	= setting.get_Map_Value("path", "path_profiles");
	QString profilesLast 	= setting.get_Map_Value("profile", "last_profile");
	QString profilesEnding 	= setting.get_Map_Value("profile", "profile_ending");
	try {
		profile = IniFile(profilesFolder, profilesLast, profilesEnding);
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}	
}




/**
 * TODO divide this into diffrent file: e.g. everything with citrix in mainwindow_citrix...
 *  print all information of the current profile to the GUI
 */
void MainWindow::printProfile()
{
	//network
	QString network_type = profile.get_Map_Value("network", "network_type");
	//check for dhcp or static, otherwise throw exception
	try {
		if (network_type == "dhcp") {
			//maybe the modified flag is set here
			on_rdb_network_type_dhcp_clicked();
		} else if (network_type == "static") {
			on_rdb_network_type_static_clicked();
		} else {
			//converting from QString to string
			std::string s_network_type = network_type.toStdString();
			std::string s_profile_name = profile.get_Map_Value("global", "profile_name").toStdString();
			//throw an exception
			throw developer_error(
					std::string("Error: network_type '") + s_network_type +
					std::string("' of your profile '") + s_profile_name +
					std::string("' is invalid" ));
		}
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}

	ui->txb_network_ip	->setText(profile.get_Map_Value("network", "network_ip"));
	ui->txb_network_netmask	->setText(profile.get_Map_Value("network", "network_netmask"));
	ui->txb_network_gateway ->setText(profile.get_Map_Value("network", "network_gateway"));
	ui->txb_network_dns 	->setText(profile.get_Map_Value("network", "network_dns"));

	//wlan
	//check if wlan is active
	if (profile.get_Map_Value("wlan", "wlan_active") == "true" )
		ui->chk_wlan_active	->setChecked(true);
	else
		ui->chk_wlan_active	->setChecked(false);

	on_chk_wlan_active_clicked();
	ui->txb_wlan_ssid	->setText(profile.get_Map_Value("wlan", "wlan_ssid"));
	ui->txb_wlan_passwd	->setText(profile.get_Map_Value("wlan", "wlan_passwd"));
	
	//citrix&rdp
	QString citrix_rdp_type = profile.get_Map_Value("citrix&rdp", "citrix_rdp_type");
	//check for dhcp or static, otherwise throw exception
	try {
		if (citrix_rdp_type == "citrix") {
			//maybe the modified flag is set here
			on_rdb_citrix_rdp_type_citrix_clicked();
		} else if (citrix_rdp_type == "rdp") {
			on_rdb_citrix_rdp_type_rdp_clicked();
		} else {
			//converting from QString to string
			std::string s_citrix_rdp_type = citrix_rdp_type.toStdString();
			std::string s_profile_name = profile.get_Map_Value("global", "profile_name").toStdString();
			//throw an exception
			throw developer_error(
					std::string("Error: citrix_rdp_type '") + s_citrix_rdp_type +
					std::string("' of your profile '") + s_profile_name +
					std::string("' is invalid" ));
		}
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}
	ui->txb_citrix_rdp_citrix_store	->setText(profile.get_Map_Value("citrix&rdp", "citrix_rdp_citrix_store"));
	ui->txb_citrix_rdp_citrix_url	->setText(profile.get_Map_Value("citrix&rdp", "citrix_rdp_citrix_url"));
	ui->txb_citrix_rdp_rdp_server	->setText(profile.get_Map_Value("citrix&rdp", "citrix_rdp_rdp_server"));
	ui->txb_citrix_rdp_rdp_domain	->setText(profile.get_Map_Value("citrix&rdp", "citrix_rdp_rdp_domain"));
}



/**
*  delete the current profile
*  check if text of profile to be deleted: 
*	last-exisiting profile
*	empty
*	last_profile in setting.ini -> then set a new last_profile and load it's nm-settings
*/
void MainWindow::delProfile()  {

	QString drdw_current = ui->drdw_profiles->currentText();
	//empty Name
	if(ui->drdw_profiles->currentText().isEmpty()
			|| ui->drdw_profiles->currentText().isNull()) {
		print_customer_info("Can't delete profile. \nPlease select a profilename to delete in combobox");
		return;
	}

	// last remaining profile
	if( !(profile.get_List_of_IniFiles().size() > 1) ) {
		print_customer_info("can't delete last remaining file");
		return;
	}

	QString profileFullName = profile.get_IniFile_Folder () + "/"
		+ drdw_current + profile.get_IniFile_ending();

	QMessageBox::StandardButton reply = questionMessage (this,"Do you really want to remove"
			"the selected profile from profiles-folder");

	//delete: yes
	if (reply == QMessageBox::Yes) {
		// delete profile out of the profiles-folder
		try{
			remove_file(profileFullName.toStdString());
		} catch(const developer_error& e) {
			handle_developer_error(e);
			return;
		}
		print_customer_info("profile successfully deleted");

	//delete: no
	} else {
		print_customer_info("no profile has been deleted!");
		return;
	}


	// delete profile out of the profiles-list, therefore use the constructor, 
	// that reads out all files in the iniFolder
	reload_profile();

	// update the dropdown list
	setDrDwProfilesList(profile.get_List_of_IniFiles());

	//check for last_profile in setting.ini
	QString last_profile = setting.get_Map_Value("profile", "last_profile");
	
	//////////////
	//if the deleted profile was the last_profile*/
	//
	//compare returns 0 if equal
	if ( !last_profile.compare(drdw_current)) {
		//save the now new profile as default into Map and disk
		save_last_profile_and_client_logo();

		//load the nm-settings of the new last_profile-map and handles incorrectness
		renew_nm();
		//reload the settings of the new profile
		on_drdw_profiles_activated(ui->drdw_profiles->currentText());
	} else {
		//Select the last_profile and reload it's settings
		on_drdw_profiles_activated(last_profile);
	}
	
	/*deleted everywhere
	//why? not needed!
	if( !profile.getLastProfileName().compare(drdw_current)) {
		profile.setLastProfileName ( QString::null );
	}
	*/
}



/**
* New Profile: make it possible to type a new profilename and variables like network, wlan, ...
* disabling the Save & Quit button, to prevent saving an invalid last_profile
*/
void MainWindow::new_profile_clicked() {
		ui->btn_new_profile->setText ("save");
		ui->drdw_profiles->setEditable (true);
		ui->drdw_profiles->clearEditText ();
		// no item need to be display by the combobox
		// no profile renaming possible
		ui->drdw_profiles->clear();
		//activate_network_wlan(true); 	//don't change anything of the buttons, 
						//otherwise in dhcp settings can be changed, but this is an unwanted behaviour
		//Important: Disables the Save&Quit-Button and all change buttons:
		//	to prevent saving an invalid last_profile
		ui->btn_save_quit->setEnabled (false);
		activate_btn_network_wlan(false);
		activate_btn_citrix_rdp(false);
}

/**
*  test for valid profilename
*  try to save values to map, afterwards to harddisk
*
*  doesn't change the last_profile
*/
void MainWindow::save_new_profile_clicked() {
	if(ui->drdw_profiles->currentText().toUtf8().isEmpty() ||
			ui->drdw_profiles->currentText ().toUtf8 ().isNull ()  ) {
		print_customer_info("Can't save profile. \nPlease type a profile name in combobox");
		return;
	}

	// check whether profilename already used
	if(this->profile.get_List_of_IniFiles().contains (ui->drdw_profiles->currentText ())) {
		print_customer_info("Can't save profile. \n Profile name already exists.");
		return;
	}

	//function executed
	check_input_and_save_new_profile();

	//reload the list of all available profiles
	setDrDwProfilesList(profile.get_List_of_IniFiles());
	ui->drdw_profiles->setEditable (false);
	// make the new profile the currently displayed profile
	ui->drdw_profiles->setCurrentText(profile.get_Map_Value("global", "profile_name").toUtf8().constData());
	ui->drdw_profiles->setFocus ();
	ui->btn_new_profile->setText ("new");
	ui->btn_save_quit->setEnabled (true);
	//activate the change-Buttons
	activate_btn_network_wlan(true);
	activate_btn_citrix_rdp(true);

	print_customer_info(
			QString("Profile successfully added. \n") +
			QString("Press the Save & Quit button to make this new profile your default profile."));

}

/**
*  Only used for a new Profile
*
*  TODO keep it up to date with new models
*  takes all inputs of inpufields and check them for correctness. 
*  write them to the Map if they are correct. 
*
*  then write the name of the new profile-name into the profile-map
*  and save this profile to hard-disk
*  then reload the profile with the new name and the new List_of_IniFiles
*  if this fails, then reload the last_profile of setting
*/
void MainWindow::check_input_and_save_new_profile() {

	//add network info to map
	if ( !check_network_input() ) {
		//check_network_input throws his own exception
		return ;
	}

	//add wlan info to map
	if ( !check_wlan_input() ) {
		//check_wlan_input throws his own exception
		return ;
	}
	
	//add citrix&rdp info to map
	if ( !check_citrix_rdp_input() ) {
		//check_wlan_input throws his own exception
		return ;
	}
	try {
		//get information about the profiles new name, folder, ending 
		QString profilesNewName = ui->drdw_profiles->currentText();
		QString profilesFolder 	= setting.get_Map_Value("path", "path_profiles");
		QString profilesEnding 	= setting.get_Map_Value("profile", "profile_ending");
		QString profileFullName = profilesFolder + "/" + profilesNewName + profilesEnding;

		//set the name of the Profile in the Map under [global] profile_name to the new name
		profile.set_Map_Value("global", "profile_name", profilesNewName);

		//save this new map to harddisk 
		ini_saver(profileFullName, profile.get_Map());
		// load new profile and new profiles list 
		profile = IniFile(profilesFolder, profilesNewName, profilesEnding);
	} catch(const developer_error& e) {
		handle_developer_error(e);
		//if something went wrong, load the last_profile in setting.ini
		reload_profile();
	}
}





/******************************************************************************\
|******************************************************************************|
|* 			drdw profiles   				      *|
|******************************************************************************|
\******************************************************************************/

/**
 *  unable the buttons for CurrentNew as default
 */
void MainWindow::setDefaultSettingButtonsProfile() {
	// set the default value for the delete Button of Profiles
	ui->btn_profile_delete->setEnabled(false);
	ui->btn_profile_delete->setVisible(false);
	ui->btn_new_profile->setEnabled (false);
	ui->btn_new_profile->setVisible (false);
}



/**
 *  set the names of all Profiles given in the DropDown Profiles and set the default one
 *  @param ListOfProfiles list with all profile names that will be displayed in the DropDown Menu
 */
void MainWindow::setDrDwProfilesList(QList<QString> listOfProfiles)
{
	// add ordered profiles list to dropdown and examine the default profile
	int defaultIndex = 0;
	ui->drdw_profiles->clear ();
	for ( auto str : listOfProfiles) {
		ui->drdw_profiles->addItem(str);
		if ( !str.compare(setting.get_Map_Value("profile", "last_profile").toUtf8().constData()))
			ui->drdw_profiles->setCurrentIndex(defaultIndex);
		++defaultIndex;
	}
}



/**
 *  take option of setting.ini: profile_opt
 *  which setting/option for the profiles will be possible
 */
void MainWindow::setDrDwProfilesOpt() 
{
	//read in all profiles in a dropdown menu
	try{
		QString profilesOpt = setting.get_Map_Value("profile", "profile_opt");
		//unable the buttons for CurrentNew as default
		setDefaultSettingButtonsProfile();
		//only use the default profile
		if (profilesOpt == "one") {
			setDrDwProfilesOne();

			//only use the available profiles, no new ones
		} else if (profilesOpt == "current") {
			setDrDwProfilesCurrent();

			//use the available, delete and create new profiles
		} else if (profilesOpt == "current_new") {
			setDrDwProfilesCurrentNew();

			//throw exception if not [one, current, current_new]
		} else {
			throw developer_error(
					std::string("Error: profile properties in setting.ini invalid - Contact Admin - Only default Profile"));
		}
		//catch it with only using the current profile accepted
	} catch(const developer_error& e) {
		handle_developer_error(e);
		setDrDwProfilesOne();
	}
}



/**
 *  read in only the default profile, not possible to switch
 */
void MainWindow::setDrDwProfilesOne() {
	ui->drdw_profiles->addItem(setting.get_Map_Value("profile", "last_profile"));
	ui->drdw_profiles->setEnabled(false);
	//see for initialisation:setDefaultSettingButtonsProfile
}


/**
 *  read in all profiles and add them ordered with default one to the dropdown bar
 *  no remove
 */
void MainWindow::setDrDwProfilesCurrent() {
	//readInProfiles(s_profilesFolder);
	setDrDwProfilesList(profile.get_List_of_IniFiles());
	ui->drdw_profiles->setEnabled(true);
	//see for initialisation:setDefaultSettingButtonsProfile
}


/**
 *  delete, create, and view all profiles, but no renaming possible
 */
void MainWindow::setDrDwProfilesCurrentNew() {
	// restrict every new input to be ordered alphabetically
	ui->drdw_profiles->setInsertPolicy(QComboBox::InsertAlphabetically);
	//readInProfiles(s_profilesFolder);
	setDrDwProfilesList(profile.get_List_of_IniFiles());
	// set the delete button visible and useable
	ui->btn_profile_delete->setEnabled(true);
	ui->btn_profile_delete->setVisible(true);
	ui->btn_new_profile->setEnabled (true);
	ui->btn_new_profile->setVisible(true);
}
