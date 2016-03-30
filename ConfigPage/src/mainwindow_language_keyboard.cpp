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
 */
void MainWindow::init_language() 
{
	//set language
	QString language_name = setting.get_Map_Value("language&keyboard", "language");
	QString language_fallback_name = setting.get_Map_Value("language&keyboard", "language_fallback");
	QString language_ending = setting.get_Map_Value("language&keyboard", "language_ending");
	QString language_folder = setting.get_Map_Value("path", "path_languages_system");
	try {
		language 		= IniFile(language_folder, language_name, 		language_ending);
		language_fallback 	= IniFile(language_folder, language_fallback_name, 	language_ending);
	} catch(const developer_error& e) {
		handle_developer_error(e);
	}

	setDrDwLanguagesList(language.get_List_of_IniFiles());

	change_language_GUI();
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
 * Take the values in the IniFile language
 * and try to set all values that are shown on the GUI
 * if a value in language is emtpy ("") then use the value saved in the language_fallback
 *
 */
void MainWindow::change_language_GUI() {
	QString lb = "label";
	QString btn = "button";
	
	//title
	setWindowTitle(
			(language.get_Map_Value(lb, "title") != "") 
			? language.get_Map_Value(lb, "title") 
			: language_fallback.get_Map_Value(lb, "title"));
	//language_keyboard
	ui->lb_drdw_languages->setText(
			(language.get_Map_Value(lb, "language") != "") 
			? language.get_Map_Value(lb, "language") 
			: language_fallback.get_Map_Value(lb, "language"));
	//profile
	ui->lb_drdw_profiles->setText(
			(language.get_Map_Value(lb, "profile") != "") 
			? language.get_Map_Value(lb, "profile") 
			: language_fallback.get_Map_Value(lb, "profile"));	
	ui->btn_profile_new->setText(
			(language.get_Map_Value(btn, "profile_new") != "") 
			? language.get_Map_Value(btn, "profile_new") 
			: language_fallback.get_Map_Value(btn, "profile_new"));	
	ui->btn_profile_delete->setText(
			(language.get_Map_Value(btn, "profile_delete") != "") 
			? language.get_Map_Value(btn, "profile_delete") 
			: language_fallback.get_Map_Value(btn, "profile_delete"));	
	//network
	ui->btn_change_network->setText(
			(language.get_Map_Value(btn, "network") != "") 
			? language.get_Map_Value(btn, "network") 
			: language_fallback.get_Map_Value(btn, "network"));
	ui->gb_network->setTitle(
			(language.get_Map_Value(lb, "frame_network") != "") 
			? language.get_Map_Value(lb, "frame_network") 
			: language_fallback.get_Map_Value(lb, "frame_network"));
	ui->rdb_network_type_dhcp->setText(
			(language.get_Map_Value(lb, "network_dhcp") != "") 
			? language.get_Map_Value(lb, "network_dhcp") 
			: language_fallback.get_Map_Value(lb, "network_dhcp"));
	ui->rdb_network_type_static->setText(
			(language.get_Map_Value(lb, "network_static") != "") 
			? language.get_Map_Value(lb, "network_static") 
			: language_fallback.get_Map_Value(lb, "network_static"));
	ui->lb_network_ip->setText(
			(language.get_Map_Value(lb, "network_ip") != "") 
			? language.get_Map_Value(lb, "network_ip") 
			: language_fallback.get_Map_Value(lb, "network_ip"));
	ui->lb_network_gateway->setText(
			(language.get_Map_Value(lb, "network_gateway") != "") 
			? language.get_Map_Value(lb, "network_gateway") 
			: language_fallback.get_Map_Value(lb, "network_gateway"));
	ui->lb_network_netmask->setText(
			(language.get_Map_Value(lb, "network_netmask") != "") 
			? language.get_Map_Value(lb, "network_netmask") 
			: language_fallback.get_Map_Value(lb, "network_netmask"));
	ui->lb_network_dns->setText(
			(language.get_Map_Value(lb, "network_dns") != "") 
			? language.get_Map_Value(lb, "network_dns") 
			: language_fallback.get_Map_Value(lb, "network_dns"));
	//wlan
	ui->btn_change_wlan->setText(
			(language.get_Map_Value(btn, "wlan") != "") 
			? language.get_Map_Value(btn, "wlan") 
			: language_fallback.get_Map_Value(btn, "wlan"));
	ui->gb_wlan->setTitle(
			(language.get_Map_Value(lb, "frame_wlan") != "") 
			? language.get_Map_Value(lb, "frame_wlan") 
			: language_fallback.get_Map_Value(lb, "frame_wlan"));
	ui->lb_wlan_ssid->setText(
			(language.get_Map_Value(lb, "wlan_ssid") != "") 
			? language.get_Map_Value(lb, "wlan_ssid") 
			: language_fallback.get_Map_Value(lb, "wlan_ssid"));
	ui->chk_wlan_active->setText(
			(language.get_Map_Value(lb, "wlan_active") != "") 
			? language.get_Map_Value(lb, "wlan_active") 
			: language_fallback.get_Map_Value(lb, "wlan_active"));
	ui->lb_wlan_passwd->setText(
			(language.get_Map_Value(lb, "wlan_password") != "") 
			? language.get_Map_Value(lb, "wlan_password") 
			: language_fallback.get_Map_Value(lb, "wlan_password"));
	//citrix_rdp
	ui->btn_change_citrix_rdp->setText(
			(language.get_Map_Value(btn, "citrix_rdp") != "") 
			? language.get_Map_Value(btn, "citrix_rdp") 
			: language_fallback.get_Map_Value(btn, "citrix_rdp"));
	ui->gb_citrix_rdp->setTitle(
			(language.get_Map_Value(lb, "frame_citrix_rdp") != "") 
			? language.get_Map_Value(lb, "frame_citrix_rdp") 
			: language_fallback.get_Map_Value(lb, "frame_citrix_rdp"));
	ui->rdb_citrix_rdp_type_citrix->setText(
			(language.get_Map_Value(lb, "citrix_rdp_citrix") != "") 
			? language.get_Map_Value(lb, "citrix_rdp_citrix") 
			: language_fallback.get_Map_Value(lb, "citrix_rdp_citrix"));
	ui->rdb_citrix_rdp_type_rdp->setText(
			(language.get_Map_Value(lb, "citrix_rdp_rdp") != "") 
			? language.get_Map_Value(lb, "citrix_rdp_rdp") 
			: language_fallback.get_Map_Value(lb, "citrix_rdp_rdp"));
	ui->lb_citrix_rdp_citrix_store->setText(
			(language.get_Map_Value(lb, "citrix_rdp_citrix_store") != "") 
			? language.get_Map_Value(lb, "citrix_rdp_citrix_store") 
			: language_fallback.get_Map_Value(lb, "citrix_rdp_citrix_store"));
	ui->lb_citrix_rdp_citrix_url->setText(
			(language.get_Map_Value(lb, "citrix_rdp_citrix_url") != "") 
			? language.get_Map_Value(lb, "citrix_rdp_citrix_url") 
			: language_fallback.get_Map_Value(lb, "citrix_rdp_citrix_url"));
	ui->lb_citrix_rdp_rdp_server->setText(
			(language.get_Map_Value(lb, "citrix_rdp_rdp_server") != "") 
			? language.get_Map_Value(lb, "citrix_rdp_rdp_server") 
			: language_fallback.get_Map_Value(lb, "citrix_rdp_rdp_server"));
	ui->lb_citrix_rdp_rdp_domain->setText(
			(language.get_Map_Value(lb, "citrix_rdp_rdp_domain") != "") 
			? language.get_Map_Value(lb, "citrix_rdp_rdp_domain") 
			: language_fallback.get_Map_Value(lb, "citrix_rdp_rdp_domain"));
	//logo_certificate
	ui->btn_pictures_delete->setText(
			(language.get_Map_Value(btn, "logo_delete") != "") 
			? language.get_Map_Value(btn, "logo_delete") 
			: language_fallback.get_Map_Value(btn, "logo_delete"));
	ui->gb_logo_certificate->setTitle(
			(language.get_Map_Value(lb, "frame_logo_certificate") != "") 
			? language.get_Map_Value(lb, "frame_logo_certificate") 
			: language_fallback.get_Map_Value(lb, "frame_logo_certificate"));
	ui->btn_pictures_upload->setText(
			(language.get_Map_Value(btn, "logo_upload") != "") 
			? language.get_Map_Value(btn, "logo_upload") 
			: language_fallback.get_Map_Value(btn, "logo_upload"));
	ui->btn_certificates_upload->setText(
			(language.get_Map_Value(btn, "certificate_upload") != "") 
			? language.get_Map_Value(btn, "certificate_upload") 
			: language_fallback.get_Map_Value(btn, "certificate_upload"));
	ui->lb_logo_configure->setText(
			(language.get_Map_Value(lb, "logo_configure") != "") 
			? language.get_Map_Value(lb, "logo_configure") 
			: language_fallback.get_Map_Value(lb, "logo_configure"));
	//cancel & save_quit
	ui->btn_cancel->setText(
			(language.get_Map_Value(btn, "cancel") != "") 
			? language.get_Map_Value(btn, "cancel") 
			: language_fallback.get_Map_Value(btn, "cancel"));
	ui->btn_save_quit->setText(
			(language.get_Map_Value(btn, "quit_and_save") != "") 
			? language.get_Map_Value(btn, "quit_and_save") 
			: language_fallback.get_Map_Value(btn, "quit_and_save"));
}


/**
 *  de/activation of the language dropdown-list
 *  @param input true=activate, false=deactivate
 */
void MainWindow::activate_btn_language(bool input)
{
	ui->drdw_languages	->setEnabled(input);
}
