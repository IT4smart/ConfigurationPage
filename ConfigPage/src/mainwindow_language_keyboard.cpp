/******************************************************************************
 ******************************************************************************
 * 			mainwindow_language_keyboard.cpp		      *
 ******************************************************************************
 ******************************************************************************/
#include <QString>
#include <iostream>
#include <memory>
#include "../mainwindow.h"
#include "../ui_mainwindow.h"
#include "../../../libs/tools/inc/custom_exceptions.h"

/**
 * read in the default language and the fallback language
 * set the dropdown list to all available languages
 * show the content of the default language on the screen
 * take the right language for the exception-handling
 */
void MainWindow::init_language() 
{
	//set language
	QString language_name 		= setting.get_Map_Value("language&keyboard", "language");
	QString language_fallback_name 	= setting.get_Map_Value("language&keyboard", "language_fallback");
	QString language_ending 	= setting.get_Map_Value("language&keyboard", "language_ending");
	QString language_folder 	= setting.get_Map_Value("path", "path_languages_system");
	QString language_extern_folder 	= setting.get_Map_Value("path", "path_languages_extern");
	//the fallback-languages need to exist, because it should be english, this is essential
	try {
		language_fallback 	= IniFile(language_folder, 	  language_fallback_name, 	language_ending);
		language_extern_fallback= IniFile(language_extern_folder, language_fallback_name, 	language_ending);
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}
	//if the saved language doesn't exist (e.g. wrong name in setting.ini)  
	try {
		language 		= IniFile(language_folder, 	  language_name, 		language_ending);
	} catch(const developer_error& e) {
		handle_developer_error(e, false); //false for silent, that the user gets no message
		language 		= language_fallback;
	}

	//if the language may exist for the normal gui but not for the extern saved language (e.g. in tools)
	try {
		language_extern		= IniFile(language_extern_folder, language_name, 		language_ending);
	} catch(const developer_error& e) {
		handle_developer_error(e, false); //false for silent, that the user gets no message
		language_extern		= language_extern_fallback;
	}

	setDrDwLanguagesList(language.get_List_of_IniFiles());

	change_language_GUI();




	//set the language of the exceptions right
	//initialize the exception-MapMap from the language, same for _fallback
	exception 		= ControlMapMap(language.get_Map());
	exception_fallback 	= ControlMapMap(language_fallback.get_Map());
	//extend the exception-MapMap with the entries of the extern language IniFile, same for _fallback
	exception 		+= language_extern.get_Map();
	exception_fallback 	+= language_extern_fallback.get_Map();
}


/**
 *  set the names of all languages given in the DropDown Language and set the default one
 *  @param List_of_Languages list with all language names that will be displayed in the DropDown Menu
 */
void MainWindow::setDrDwLanguagesList(QStringList List_of_Languages)
{
	// add ordered languages list to dropdown and examine the default language
	int defaultIndex = 0;
	ui->drdw_languages->clear ();
	for ( auto str : List_of_Languages) {
		ui->drdw_languages->addItem(str);
		if ( !str.compare(setting.get_Map_Value("language&keyboard", "language")))
			ui->drdw_languages->setCurrentIndex(defaultIndex);
		++defaultIndex;
	}
}




/**
 *  save the current language as default language in the setting.ini
 *  TODO maybe set the language system wide to this language
 */
void MainWindow::set_current_language_to_default() {
	try {
		//set the name and reload Map
		setting.set_Map_Value("language&keyboard", "language", language.get_IniFile_Name());
		setting.save_Map_to_IniFile();
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}
}

/**
 * ask for the value in the language. if the response is empty, the value of the language_fallback is taken
 * @param group the group name of the language-ini-file
 * @param key the key of the language-ini-file
 * @return the value saved under group-value combination
 */
QString MainWindow::language_than_fallback(QString group, QString key) {
	return (language.get_Map_Value(group, key) != "") 
			? language.get_Map_Value(group, key) 
			: language_fallback.get_Map_Value(group, key);
}

/**
 * Take the values in the IniFile language
 * and try to set all values that are shown on the GUI
 * if a value in language is emtpy ("") then use the value saved in the language_fallback
 *
 */
void MainWindow::change_language_GUI() {
	QString lb = "label";
	QString bt = "button";
	
	//title
	setWindowTitle( 			language_than_fallback(lb, "title"));
	//language_keyboard
	ui->lb_drdw_languages->setText( 	language_than_fallback(lb, "language") + ":");
	//profile
	ui->lb_drdw_profiles->setText( 		language_than_fallback(lb, "profile") + ":");
	ui->btn_profile_new->setText( 		language_than_fallback(bt, "profile_new"));
	ui->btn_profile_delete->setText( 	language_than_fallback(bt, "profile_delete"));
	//network
	ui->btn_change_network->setText( 	language_than_fallback(bt, "network"));
	ui->gb_network->setTitle( 		language_than_fallback(lb, "frame_network"));
	ui->rdb_network_type_dhcp->setText( 	language_than_fallback(lb, "network_dhcp"));
	ui->rdb_network_type_static->setText( 	language_than_fallback(lb, "network_static"));
	ui->lb_network_ip->setText( 		language_than_fallback(lb, "network_ip") + ":");
	ui->lb_network_gateway->setText( 	language_than_fallback(lb, "network_gateway") + ":");
	ui->lb_network_netmask->setText( 	language_than_fallback(lb, "network_netmask") + ":");
	ui->lb_network_dns->setText( 		language_than_fallback(lb, "network_dns") + ":");
	//wlan
	ui->btn_change_wlan->setText( 		language_than_fallback(bt, "wlan"));
	ui->gb_wlan->setTitle( 			language_than_fallback(lb, "frame_wlan"));
	ui->lb_wlan_ssid->setText( 		language_than_fallback(lb, "wlan_ssid") + ":");
	ui->chk_wlan_active->setText( 		language_than_fallback(lb, "wlan_active") + " ?");
	ui->lb_wlan_passwd->setText( 		language_than_fallback(lb, "wlan_password") + ":");
	//citrix_rdp
	ui->btn_change_citrix_rdp->setText( 	language_than_fallback(bt, "citrix_rdp"));
	ui->gb_citrix_rdp->setTitle( 		language_than_fallback(lb, "frame_citrix_rdp"));
	ui->rdb_citrix_rdp_type_citrix->setText(language_than_fallback(lb, "citrix_rdp_citrix"));
	ui->rdb_citrix_rdp_type_rdp->setText( 	language_than_fallback(lb, "citrix_rdp_rdp"));
	ui->lb_citrix_rdp_citrix_store->setText(language_than_fallback(lb, "citrix_rdp_citrix_store") + ":");
	ui->lb_citrix_rdp_citrix_url->setText( 	language_than_fallback(lb, "citrix_rdp_citrix_url") + ":");
	ui->lb_citrix_rdp_rdp_server->setText( 	language_than_fallback(lb, "citrix_rdp_rdp_server") + ":");
	ui->lb_citrix_rdp_rdp_domain->setText( 	language_than_fallback(lb, "citrix_rdp_rdp_domain") + ":");
	//logo_certificate
	ui->btn_pictures_delete->setText( 	language_than_fallback(bt, "logo_delete"));
	ui->gb_logo_certificate->setTitle( 	language_than_fallback(lb, "frame_logo_certififate"));
	ui->btn_pictures_upload->setText( 	language_than_fallback(bt, "logo_upload"));
	ui->btn_certificates_upload->setText( 	language_than_fallback(bt, "certificate_upload"));
	ui->lb_logo_configure->setText( 	language_than_fallback(lb, "logo_configure") + ":");
	//cancel & save_quit
	ui->btn_cancel->setText( 		language_than_fallback(bt, "cancel"));
	ui->btn_save_quit->setText( 		language_than_fallback(bt, "quit_and_save"));
}


/**
 *  de/activation of the language dropdown-list
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_btn_language(bool input)
{
	ui->drdw_languages	->setEnabled(input);
}
