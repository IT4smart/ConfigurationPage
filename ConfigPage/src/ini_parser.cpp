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
|* 				ini_parser.cpp				      *|
|******************************************************************************|
\******************************************************************************/

/* 
*  This parser is necessary, because the Qt-parser saves string like "8.8.8.8;1.1.1.1;"
*  in an ini-file like 
*  key="8.8.8.8;1.1.1.1;"
*  and the apostrophes won't work in files for the networkmanager
*  This only works if there is no [,;=] in the QString, otherwise QSetting will put some "" around the QString, not good
*/


//for the trim
#include <cctype>
#include <string>
#include <algorithm>

//for the rest
#include <iostream>
#include <fstream>
#include <regex>
#include <QMap>
#include <QString>
#include <QStringList>
#include "../inc/ini_parser.h"
#include "../inc/custom_exceptions.h"

/**
* This function is inspired of http://stackoverflow.com/questions/216823/whats-the-best-way-to-trim-stdstring from David G
*  trims the given string, so that there is no more whitespace in the beginning and in the end
*  @param s the string to be trimmed
*  @return the trimmed string; if the string is only whitespace, then give back an emtpy string
*/
inline std::string trim(const std::string & str)
{
    //use lambda: 
    //InputIterator find_if_not (InputIterator first, InputIterator last, UnaryPredicate pred);
    //Returns an iterator to the first element in the range [first,last) for which pred returns false. 
    //If no such element is found, the function returns last
    //so: return the first character, that isn't a whitespace, including " " "\t" etc
    auto wsfront = std::find_if_not(str.begin(), str.end(),
				    [](int c) { return std::isspace(c);}
    );
    auto wsback = std::find_if_not(str.rbegin(), str.rend(),
				   [](int c) { return std::isspace(c);}
    ).base();
    //if we have only whitespace, then return the empty string, otherwise only the trimmed string
    return (wsback <=
	    wsfront ? std::string() : std::string(wsfront, wsback));
}


/**
*  read in the ini-file [group] key=value and return this file as a Map-Map
*  Map: (group.name , UnderMap)
*  Undermap: (key, value) with all keys of this group
*  restrictions: 
*  -no ] is allowed in the group declaration: don't do [test]root], only test will be the groupname
*  -only use '=' as key-value quantifier, a second '=' will return an error
*  @param _path the path, where the ini file can be found. e.g /etc/ini-file.ini or /etc/ini-file.txt
*  @return the file under _path as a Map-Map
*/
QMap < QString, QMap < QString, QString >> ini_reader(QString _path)
{
    std::string path = _path.toStdString();
    QMap < QString, QMap < QString, QString >> gmap;
    QMap < QString, QString > cmap;

    //after the lifetime of myfile (run out of scope), the file will be closed in its destructor, 
    //so no need of a unique_ptr and of myfile.close() (only if I would like to check the failbit
    std::ifstream myfile(path, std::ios::in);
    if (myfile.is_open()) {
	std::regex pat_group {
	R"(^\s?\[.*\]\s?$)"};	//for groups with optinal whitespace (leading or trailing)
	std::regex pat_key {
	R"(^.*=.*$)"};		//for key value

	//add group to the gmap only after one group has already be found 
	int group = 0;
	QString group_key;
	std::string line;
	while (std::getline(myfile, line)) {
	    //std::cout << line << std::endl;
	    //if new group
	    if (std::regex_match(line, pat_group)) {
		//add old group to the gmap
		if (group == 1) {
		    gmap.insert(group_key, cmap);
		    cmap.clear();
		} else {
		    group = 1;
		}
		//cut off leading or trailing whitespace
		line = trim(line);
		std::string delimiter = "]";
		//only start after the first [ and end one before the first ]
		line = line.substr(1, line.find(delimiter) - 1);	// token is innerpart of []
		//cut off leading or trailing whitespace for ' [ wlan ] '
		line = trim(line);
		//std::cout << "group: '" << line << "'" << std::endl;
		group_key = QString::fromStdString(line);

		//if line is key=value
	    } else if (std::regex_match(line, pat_key)) {
		//std::cout << "key?: " << line << std::endl;

		QStringList list = QString::fromStdString(line).split('=');
		//only one '='
		if (2 < list.size()) {
		    //std::cout << "ERROR: too many '='" << std::endl; 
		    //ErrorMessage LOGIC
		    throw developer_error(std::string
					  ("Too many '=' for the ini_reader under path:")
					  + path);
		}
		QString key =
		    QString::fromStdString(trim(list[0].toStdString()));
		QString value =
		    QString::fromStdString(trim(list[1].toStdString()));
		cmap.insert(key, value);
	    }
	}
	//save the last group
	if (group == 1) {
	    gmap.insert(group_key, cmap);
	    cmap.clear();
	}
	//not needed because of destructor
	//myfile.close();
    } else {
	//ErrorMessage LOGIC
	//std::cout << "error ini_reader\n";
	throw developer_error(std::string("ini_reader can't open file under path:") +
			      path);
    }
    return gmap;
}


/**
*  save the given Map-Map  as an ini-file [group] key=value and return true if successful
*  Map: (group.name , UnderMap)
*  Undermap: (key, value) with all keys of this group
*  restrictions: (for ini_reader)
*  -no ] is allowed in the group declaration: don't do [test]root], only test will be the groupname
*  -only use '=' as key-value quantifier, a second '=' will return an error
*  @param _path the path, where the ini file shall be saved. e.g /etc/ini-file.ini or /etc/ini-file.txt
*  @return true if successful, else false
*/
bool ini_saver(QString _path, QMap < QString, QMap < QString,
	       QString >> gmap)
{
    std::string path = _path.toStdString();
    //std::cout << "ini_saver\n";
    //after the lifetime of myfile (run out of scope), the file will be closed in its destructor, 
    //so no need of a unique_ptr and of myfile.close() (only if I would like to check the failbit
    std::ofstream ofs;
    ofs.open(path, std::ios::out);
    if (ofs.is_open()) {
      for (QString key:gmap.keys()) {
	    ofs << "[" << key.toStdString() << "]" << "\n";
	  for (QString subKey:gmap.value(key).keys()) {
		ofs << subKey.toStdString() << "="
		    << gmap.value(key).value(subKey).
		    toStdString() << "\n";
	    }
	    ofs << "\n";
	}
	return true;
    } else {
	//std::cout << "couldn't open 'target' for writing in ini_saver";
	//ErrorMessage LOGIC
	throw developer_error(std::string("ini_saver can't open file under path:") +
			      path);
    }
    return false;
}
