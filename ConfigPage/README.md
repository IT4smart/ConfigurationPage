/*******************************************************************************
 ** Copyright (c) 2016, Andreas Thomas Haller, Cedrique Tassi
 ** All rights reserved.
 **
 ** Redistribution and use in source and binary forms, with or without
 ** modification, are permitted provided that the following conditions are met:
 **    1. Redistributions of source code must retain the above copyright
 **       notice, this list of conditions and the following disclaimer.
 **    2. Redistributions in binary form must reproduce the above copyright
 **       notice, this list of conditions and the following disclaimer in the
 **       documentation and/or other materials provided with the distribution.
 **    3. The name of the authors may not be used to endorse or promote products
 **       derived from this software without specific prior written permission.
 **
 ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 ** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 ** DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 ** DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 ** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 ** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 ** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************/
 

- TODO: actually with nm-applet the ehternet must be selected, after adding a new ethernet-possibility. 
Maybe this is an individual problem, because of some installed services, but controll this


- Compile:

	go into the ConfigPage directory
	cmake .
	make clean
	make

	Recompile with: "cmake ." when you add oder remove a .cpp, .h, .hpp, etc.




- TEST:
	test-files are all stored in ./test/
	including all .cpp/.h/.hpp

	start the all tests with: 
	ctest

	start each test individually:
	./unitTest
	./defaultTest 
	etc.


	If you do not want to have tests built all the time, remove
	enable_testing()
	and run cmake with
	cmake . -DENABLE_TESTING=true
	in order to build tests. 





- profile:
	The profile must have the format of: "profile_name"_profile.ini
	with the name saved into the profiles profile_name
	!!!if no profile is found, then the whole configpage is useless!!!

- setting.ini
		
	the path to this file is set in the setting.h file

	Options for the key in setting.ini
	profiles = [one, current, current_new]
	system=[arch,debian]

	for using the networkmanager, this should be like this:
	path_networkmanager=/etc/NetworkManager/system-connections

	if paths are set relatively, then you have to be in the same directory as the executable, otherwise many exceptions

	Changing from one Profile to another, will discard all changes

	The changebutton will save the values into the map, 
	the save and quit will save only the current Profil into the profiles file. 
	Therefore it(S&Q) checks all inputs again and puts them into the Profil-Map before saving the Map.
	Cancel will discard the changes made with changebuttons


	Only after Quit&Save the networkmanager will be restarted, not after adding a new profile



- Installations:
	networkmanager should be installed and running at startup
	for arch:
	sudo pacman -S networkmanager
	graphical usage:
	sudo pacman -S network-manager-applet
	icons: 
	sudo pacman -S gnome-icon-theme


	After first installation on arch, this can be sufficient: sudo systemctl daemon-reload
	Very Important. On arch the programm totally fails and returns this message, which can't be catched:
	Failed to restart NetworkManager.service: Unit NetworkManager.service failed to load: No such file or directory.

	Restart for debian still not tested


	wpa_passphrase needs to be installed (should be part of wpa_supplicant) 
	it is used by encrypt_passwd


	uuid needs to be installed to get an unique identifier for each ethernet/wlan file


- Usage:

	- dns 
		needs to be in the format: "8.8.8.8;8.8.4.4;" or "8.8.8.8;8.8.4.4" but delimited with semicolon
		ARCH: standard: 82.212.62.62;78.42.43.62 
			under sudo cat /etc/resolv.conf

	- SSID and Password:
		mustn't contain a "'" or a "="
		if they do, an error will return

		Password only: 8..63 characters "Umlaute äüößÄÜÖ" and "Aktenzeichen" ` could make diffuculties

		Maybe the Password needs to be entered manually ( TODO therefore the nm-applet should be running?) 
		if an special character is at the beginning 
		of the password. The Programm shifts automatically and excepts the input by keyboard. 



- Logo:
	- bigger:
		to have bigger Logos, you just have to resize the TextLabel where the Logos are located in the QtCreator

- Permissions: 
	- all new profiles and log-files have read&write permissions set for everyone if created new
	  shouldn't be necessary for new logos and certificates. and the setting.ini should be set right before

- Make new Folder:
	- for all folders, that are normally/possibly not there at Start, the folders will be created if necessary
	  e.g. profiles, log, client_logo, certificates 
	  (but no specific permissions of these folders are set, but for log this doesn't have any effect of created by root or user )

- Paths: 
	- relative to each other: in libs/tools/inc/paths.h the path to the scripts is relative to the path where the 
	executable of ConfigPage lies.
