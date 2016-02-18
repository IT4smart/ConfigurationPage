/******************************************************************************\
|******************************************************************************|
|* 				remove_file.h				      *|
|******************************************************************************|
\******************************************************************************/
#ifndef REMOVE_FILE_H
#define REMOVE_FILE_H

//remove (+check)
bool check_file_for_existence	(std::string path);
bool remove_file		(std::string path);
void remove_wlan_if_existing	(std::string path);

#endif //REMOVE_FILE_H
