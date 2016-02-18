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
  |* 				setting.cpp				      *|
  |******************************************************************************|
  \******************************************************************************/
#include "../inc/setting.h"
#include <QSettings>
#include <QApplication>
#include <iostream>
#include <string>
#include "../inc/ini_parser.h"
#include "../inc/custom_exceptions.h"

Setting::Setting():
	// set the total-path for the settings file
	mSettingsFile {SETTING_PATH}, mMap{} 
{ }


/**
 *  Loads the setting.ini file into the mMap, including ordering by groups
 *  may throw an exception: developer_error, which needs to be caught
 */
void Setting::loadSettings()
{
	// load all settings in the mSettingsFile with the give format IniFormat
	// save all keys in a Map of Map, for each group a Map
	// insert the value for each key given into the Map

	//may throw an exception: developer_error, which needs to be caught
	mMap = ini_reader(mSettingsFile);
}

/**
 *  if change to ini_saver, 
 *  then catch any developer_error-exceptions of ini_saver in e.g. mainwindow.cpp
 *
 *  saves the given profile to it last_profile
 *  @param profileName Name of the profile that is saved as last_profile
 *  @param clientLogoName Name of the cleint_logo that is saved as last_client_logo
 */
void Setting::saveSettings(QString profileName, QString clientLogoName)
{
	QSettings settings(mSettingsFile, QSettings::IniFormat);
	settings.beginGroup("profile");
	const QString key_profile = "last_profile";
	const QString key_client_logo = "last_client_logo";
	settings.setValue(key_profile, profileName);
	settings.setValue(key_client_logo, clientLogoName);
	settings.endGroup();
}


/**
 *  return the mMap
 *  @return give back the mMap
 */
QMap < QString, QMap < QString, QString >> &Setting::getSetting()
{
	return mMap;
}
