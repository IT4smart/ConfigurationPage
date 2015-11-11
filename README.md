# README #
Test
## Installation: ##
sudo apt-get install libgtk-3-dev

## Compiling: ##
make clean
make

## Preparations: ##
1. install latest Citrix Receiver for Linux
2. chown test:test -R /etc/ssl/certs

## paths: ##
are stored in vars.h

## image header: ##
* see function init
* stored in PATH_SETTINGS

## function-declaration: ##
* all static functions (only useable in the same file) are definied in their .h file.
* not static functions are defined in the func.h file

## functions: ##
set_layout
* is responsable of the layout of the gui, not more		
init
* initialises all the widgets as labels, entries, etc
* pairing button clicks with functions
* the header includes the image

## Voraussetzungen: ##
pfade sind angepasst
sudo funktioniert ohne PW-Eingabe --> sonst wird in console nach PW gefragt
netzwerk restart funktioniert über 'sudo service networking restart'


## Auskunftsmodus: ##
es kann mit ./configuration (ohne Parameter) die config page aufgerufen werden oder es kann der Inhalt eines Parameters der config datei 'thinclient.cfg' ausgegeben werden. Das ist wichtig zum Aufruf der passenden Programme mit den passenden Parametern
--> Aufruf von Citrix/Browser
--> Aufruf von RDP/Browser
	
z.B. gibt
./configuration NET_NETMASK
	
das Ergebnis
255.255.255.0

aus. Sollte der Parameter in der config datei nicht enthalten sein, wird (null) zurück gegeben.	Die möglichen Parameter sind bereits in der Datei 'thinclient.cfg' enthalten
