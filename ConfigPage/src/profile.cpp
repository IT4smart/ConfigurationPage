/******************************************************************************\
  |******************************************************************************|
  |* 				profile.cpp				      *|
  |******************************************************************************|
  \******************************************************************************/
#include <QSettings>
#include <QFile>
#include <QTextStream>
#include <QApplication>
#include <iostream>
#include <exception>
#include "../inc/profile.h"
#include "../inc/errorMsg.h"
#include "../../../libs/tools/inc/ini_parser.h"
#include "../../../libs/tools/inc/custom_exceptions.h"

Profile::Profile(): mProfilesFolder { }, 
	//LastProfileName{ }, 
	mListOfProfilesName{ }, mMap{ } 
{
}

Profile::Profile(QString profilesFolder):
	mProfilesFolder { profilesFolder}, 
	//LastProfileName{ }, 
	mListOfProfilesName{ }, mMap{ } 
{
}

/**
 *  get the Name of all Profile
 *  @return List of all profile name
 */
QList < QString > &Profile::getmListOfProfilesName(void)
{
	return this->mListOfProfilesName;
}

/**
 *  set the Name of the Profile folder
 *  @param _profileFolderName: Name of the profile folder, that should be set
 */
void Profile::setProfileFolderName(QString _profileFolderName)
{
	this->mProfilesFolder = _profileFolderName;
}

/**
 *  get the Name of the Profile folder
 *  @return Name of the profile folder
 */
QString Profile::getProfileFolderName()
{
	return mProfilesFolder;
}


/**
 *  Loads the _profile.ini file into the mMap, including ordering by groups
 *  may throw an exception: developer_error, which needs to be caught
 *  @param _profileName Name of the profile, that should be loaded
 */
void Profile::loadProfile(QString _profileName)
{
	QString profilePath =
		mProfilesFolder + "/" + _profileName + "_profile.ini";
	//load all settings in the mSettingsFile with the giving format IniFormat
	//save all keys in a Map of Map, for each group a Map
	//insert the value for each given key into the Map
	QSettings settings(profilePath, QSettings::IniFormat);


	//may throw an exception: developer_error, which needs to be caught
	mMap = ini_reader(profilePath);
}


/**
 *  saves the current profile (mMap) to its "..."_profile.ini file
 *  may throw an exception: developer_error, which needs to be caught
 *  @return errorMessage, if error occurs, otherwise empty string
 */
QString Profile::saveProfile()
{
	if (this->getProfile().value("global").value("profile_name").isEmpty()
			|| this->getProfile().value("global").value("profile_name").
			isNull()) {
		return
			("first set a profilename, which will be used to save current profile");
	}

	QString profileFullName = mProfilesFolder + "/"
		+ this->getProfile().value("global").value("profile_name")
		+ "_profile.ini";


	//may throw an exception: developer_error, which needs to be caught
	ini_saver(profileFullName, mMap);

	return QString::null;
}

/**
 *  set last profile name
 *  @param name last profile name
 */
/*
   void Profile::setLastProfileName(QString name)
   {
   this->LastProfileName = name;
   }
   */

/**
 *  return the last profile name
 *  @return last profile name
 */
/*
   QString & Profile::getLastProfileName()
   {
   return this->LastProfileName;
   }
   */

/**
 *  return the mMap
 *  @return give back the mMap
 */
QMap < QString, QMap < QString, QString >> &Profile::getProfile()
{
	return mMap;
}
