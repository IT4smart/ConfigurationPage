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
  |* 				mainwindow.h				      *|
  |******************************************************************************|
  \******************************************************************************/
#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include "../../libs/tools/inc/IniFile.h"

namespace Ui {
	class MainWindow;
}

//TODO export in another tool file
bool check_for_empty_or_whitespace(QString input);

class MainWindow : public QMainWindow
{
	Q_OBJECT

	public:
		explicit MainWindow(QWidget *parent = 0);
		~MainWindow();

		// delete the copy contructors, because they are not needed and
		// otherwise there will be problems with the copying of the ui* pointer
		MainWindow(const MainWindow&) = delete;
		MainWindow* operator=(const MainWindow&) = delete;


		//both profile & client_logo/picture
		void save_last_profile_and_client_logo();
		

		//mainwindow_handle_custom_exceptions.cpp
		//error handling
		void handle_developer_error(const std::exception& e);
		void handle_developer_error(const std::exception& e, bool customer_msg);
		void handle_customer_error(const std::exception& e);
		void handle_customer_info(const std::exception& e);
		void print_customer_info(QString message);


		//mainwindow_picture.cpp
		void set_logos();
		QStringList readInPictures();
		void setDrDwPicturesList(QStringList list);
		void drdw_pictures_select(const QString &logo);
		void pictures_delete();


		//mainwindow_profile.cpp
		//profile
		void reload_profile();
		void printProfile();
		void delProfile();
		void new_profile_clicked();
		void save_new_profile_clicked();
		void check_input_and_save_new_profile();


		//DrDw-Profiles
		void setDefaultSettingButtonsProfile();
		void setDrDwProfilesList(		QStringList listOfProfiles);
		void setDrDwProfilesOpt();
		void setDrDwProfilesOne();
		void setDrDwProfilesCurrent();
		void setDrDwProfilesCurrentNew();

		//mainwindow_nm_network_wlan.cpp
		//nm_network_wlan
		void check_wlan();
		bool check_network_input();
		bool check_wlan_input();
		bool renew_nm();
		void activate_network_wlan(		bool input);
		void activate_wlan(			bool input);
		void activate_network(			bool input);
		void activate_btn_network_wlan(		bool input);


		//mainwindow_citrix_rdp.cpp
		void activate_btn_citrix_rdp(		bool input);
		void activate_citrix(			bool input);
		void activate_rdp(			bool input);
		bool check_citrix_rdp_input();

		//language

		void change_language_GUI();
		void set_current_language_to_default();
		void activate_btn_language(bool input);






		private slots:

		void on_btn_cancel_clicked();
		void on_btn_save_quit_clicked();

		//network & wlan
		void on_rdb_network_type_dhcp_clicked();
		void on_rdb_network_type_static_clicked();
		void on_btn_change_network_clicked();
		void on_btn_change_wlan_clicked();
		void on_chk_wlan_active_clicked();

		//profile
		void on_btn_profile_delete_clicked();
		void on_drdw_profiles_activated(const QString &profile_Name);
		void on_btn_profile_new_clicked();

		//citrix & rdp
		void on_rdb_citrix_rdp_type_citrix_clicked();
		void on_rdb_citrix_rdp_type_rdp_clicked();
		void on_btn_change_citrix_rdp_clicked();

		//pictures
		void on_drdw_pictures_activated(const QString &arg1);
		void on_btn_pictures_delete_clicked();
		void on_btn_pictures_upload_clicked();
		void selectNewPicture(const QString &logo);

		//certificates
		void on_btn_certificates_upload_clicked();

		//language & keyboard
		void on_drdw_languages_activated(const QString &language_Name);

private:
		// caused by the change of the user and not only by manually indexChange
		Ui::MainWindow *ui;
		IniFile setting;
		IniFile profile;
		IniFile language;
		IniFile language_fallback;

};

#endif // MAINWINDOW_H
