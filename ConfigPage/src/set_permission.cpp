/******************************************************************************\
  |******************************************************************************|
  |* 				set_permission.cpp			      *|
  |******************************************************************************|
  \******************************************************************************/

#include <pwd.h>		//get the owner and group
#include <unistd.h>		//chown
#include <sys/stat.h>		//chmod
//#include <sys/types.h>//not used 
#include <cstring>		//strerror
#include <iostream>		//for exceptions
#include "../inc/custom_exceptions.h"




/**
 *  set the file unter the given _path to:
 *  read and write only for the given _user
 *  the given _user owns the file
 *  the group of the file will be the group of the given _user
 *
 *  Additional information:
 *  Changing the permissions to root, the execution must be done by root
 *  and if the owner is root, then the read/write flags can't be changed by not-root
 *  for more information see: "man 2 chown" (especially the example) and "man 2 chmod"
 *  @param _user tell which user you want to use, e.g. root 
 *  @param _path the full path to the file, for which the permissions will be set 
 *  @return true if it worked without failure, else false
 */
bool set_permission(std::string _user, std::string _path)
{
	const char *path = _path.c_str();
	const char *user = _user.c_str();

	uid_t uid;
	gid_t gid;
	struct passwd *pwd;
	pwd = getpwnam(user);	//try to get UID of given user

	//get the current executing user
	//uid = geteuid();		
	//pwd = getpwuid(uid);	

	if (pwd == NULL) {
		//std::cout << "getpwnam: " << strerror(errno) << std::endl;
		//ErrorMessage LOGIC
		throw developer_error(std::string("getpwnam: ") + strerror(errno));
		throw developer_error(
				std::string("In set_permission: getpwnam:") 
				+ strerror(errno)
				+ std::string("\nCommon failure: Execute as root?!"));
		return false;
		//perror("getpwnam");
		//exit(EXIT_FAILURE);
	}
	uid = pwd->pw_uid;
	gid = pwd->pw_gid;
	//int chown(const char *path, uid_t owner, gid_t group);
	//if you place -1 for gid, the gid won't be changed
	if (chown(path, uid, gid) == -1) {
		//std::cout << "chown: " << strerror(errno) << std::endl 
		//      << "Common failure: Execute as root?!" << std::endl; 
		//print global error-variable errno (int) as a human readable text: strerror(errno)
		//ErrorMessage LOGIC
		throw developer_error(
				std::string("In set_permission: chown of file: '") 
				+ _path + std::string("' \t")
				+ strerror(errno)
				+ std::string("\nCommon failure: Execute as root?!"));
		return false;

		//perror("chown"); //prints the errormessage with chown in front. the global variable errno is set and printed
		//exit(EXIT_FAILURE);
	}
	//set the permissions to read and write for Owner only
	//see man 2 chmod (for read, write by user / group / others)
	if (chmod(path, S_IRUSR | S_IWUSR) == -1) {
		//std::cout << "chmod: " << strerror(errno)<< std::endl 
		//      << "Common failure: Execute as root?!" << std::endl; 
		//print global error-variable errno (int) as a human readable text: strerror(errno)
		//ErrorMessage LOGIC
		throw developer_error(
				std::string("In set_permission: chmod of file: '") 
				+ _path + std::string("' \t")
				+ strerror(errno)
				+ std::string("\nCommon failure: Execute as root?!"));
		return false;
	}
	return true;
}


/**
 *  set the file unter the given _path to:
 *  read and write for all
 *  @param _path the full path to the file, for which the permissions will be set 
 *  @return true if it worked without failure, else false
 */
bool set_permission_all_rw(std::string _path)
{
	const char *path = _path.c_str();

	//see: man 2 chmod
	if (chmod(path, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH) == -1) {
		throw developer_error(
				std::string("In set_permission_all_rw: chmod of file: '") 
				+ _path + std::string("' \t")
				+ strerror(errno));
		return false;
	}
	return true;
}
