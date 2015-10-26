//
// compile with (new):
// make
//
// execute with (old):
// sudo apt-get install libgtk-3-dev
// gcc andi.c $(pkg-config --cflags --libs gtk+-3.0) -o andi.out -Wall -Wextra
//
// start with 
// andi.out >> log
// for logpreparations 
//
//
// image IT4S_small.png must be small enough, 
// because there is no working possibility, of smallen it

// wlan:
// at first activate wlan with right ssid and pw
// and then plug in the wlan stick
// the other hand around is not possible
// then press change wlan to get the new ip, gateway, netmask


#include <gtk/gtk.h>
#include <string.h>		//strlen, strcat, strcpy
//#include <unistd.h> 		//for the exec
//#include <stdlib.h> 		//for system()
#include <stdbool.h> 		//for bools
#include "vars.h"
#include "func.h"


//this function updates the interfaces file 
//and copies it to the right direction
//and restarts the network
void update_interfaces() {
	char* net_type = (char*) config_read(STR(NET_TYPE));
printf("net_type=%s\n", net_type);
	if (strcmp(net_type, "DHCP") == 0) {
		system( STR(sudo cp PATH_SETTINGS/interfaces.dhcp PATH_INTERFACES)); // copy sample dhcp file to PATH_INTERFACES
	} else {
		interfacesp = fopen (STR(PATH_SETTINGS/interfaces.static),"w");		//loescht vorhandenes file
		fprintf(interfacesp,"auto lo\n");
		fprintf(interfacesp,"iface lo inet loopback\n\n");
		fprintf(interfacesp,"auto eth0\n");
		fprintf(interfacesp,"iface eth0 inet static\n");
		fprintf(interfacesp, "address %s\n", config_read(STR(NET_IP)));
		fprintf(interfacesp, "netmask %s\n", config_read(STR(NET_NETMASK)));
		fprintf(interfacesp, "gateway %s\n", config_read(STR(NET_GATEWAY)));
		fclose(interfacesp);
		system( STR(sudo cp PATH_SETTINGS/interfaces.static PATH_INTERFACES)); // create interfaces file and copy it tho PATH_INTERFACES
	}

	// restart network service 
	system("sudo service networking restart");

	//the ip could have been changed by some settings made
	find_network();
}


//function analyse_input
//analyses the stream of a command
void analyse_input(FILE *fp, char buffer[MAX_BUFFER]) {
	char buffer_size[MAX_BUFFER];
	if (fp == NULL) {
		printf("Failed to run command\n" );
		//exit -1;
	}
	while (fgets(buffer, sizeof(buffer_size), fp) != NULL) {
		printf("%s", buffer);
	}
	strtok(buffer, "\n");
}


////////////////////////////////////////
////////// network functions ///////////
////////////////////////////////////////

void click_button_network() {
	char* new_ip	 	= (char*) gtk_entry_get_text(GTK_ENTRY(entry_network_ip));
	char* new_netmask	= (char*) gtk_entry_get_text(GTK_ENTRY(entry_network_netmask));
	char* new_gateway	= (char*) gtk_entry_get_text(GTK_ENTRY(entry_network_gateway));

	config_write(STR(NET_IP), new_ip);
	config_write(STR(NET_NETMASK), new_netmask);
	config_write(STR(NET_GATEWAY), new_gateway);

	//create a new interface	
	update_interfaces();
}


//function default_network 
//sets default values at startup
void default_network() {
	// read network from config
	char* net_type = (char*) config_read(STR(NET_TYPE));
printf("compare: %d\n", strcmp(net_type, "DHCP" ));
	if (strcmp(net_type, "DHCP") == 0) {
		g_print("DHCP an\n");
		gtk_widget_set_sensitive(entry_network_ip, 	FALSE);
		gtk_widget_set_sensitive(entry_network_netmask, FALSE);
		gtk_widget_set_sensitive(entry_network_gateway, FALSE);
		gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(button_radio_network_dhcp), TRUE);
	//inactive
	} else {
		g_print("STATISCH an\n");
		gtk_widget_set_sensitive(entry_network_ip, 	TRUE);
		gtk_widget_set_sensitive(entry_network_netmask, TRUE);
		gtk_widget_set_sensitive(entry_network_gateway, TRUE);
		gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(button_radio_network_static), TRUE);
	}
}

// function default ctxrdp
// sets default values at startup
void default_ctxrdp() {
	char* buffer = (char*) config_read(STR(CTXRDP_TYPE));
	if (strcmp(buffer, "RDP") == 0) {
		printf("RDP aktiviert\n");
		gtk_widget_set_sensitive(entry_ctxrdp_ctx, 	FALSE);
		gtk_widget_set_sensitive(button_ctxrdp_ctx, FALSE);
		gtk_widget_set_sensitive(entry_ctxrdp_rdp, 	TRUE);
		gtk_widget_set_sensitive(entry_ctxrdp_rdp_domain, 	TRUE);
		gtk_widget_set_sensitive(button_ctxrdp_rdp, TRUE);
		gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(button_radio_ctxrdp_rdp), TRUE);
	} else {
		printf("CTX aktiviert\n");
		gtk_widget_set_sensitive(entry_ctxrdp_ctx, 	TRUE);
		gtk_widget_set_sensitive(button_ctxrdp_ctx, TRUE);
		gtk_widget_set_sensitive(entry_ctxrdp_rdp, 	FALSE);
		gtk_widget_set_sensitive(entry_ctxrdp_rdp_domain, 	FALSE);
		gtk_widget_set_sensitive(button_ctxrdp_rdp, FALSE);
		gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(button_radio_ctxrdp_ctx), TRUE);
 		}	
}

// get net settings
void find_network() {
	char buffer_ip[MAX_BUFFER];
	//eth0 ip
	fp = popen("ifconfig |grep eth0 -A 1  |grep 'inet' | head -1 |  cut -d':' -f2 | cut -d' ' -f1", "r");

	//store the ip
	analyse_input(fp, buffer_ip);
	pclose(fp);
	gtk_entry_set_text(GTK_ENTRY(entry_network_ip), buffer_ip);
	config_write(STR(NET_IP), buffer_ip);


	char buffer_netmask[MAX_BUFFER];
	//get the netmask and store it
	fp = popen("route -nee | tail -1 | awk '{print $3; }'", "r");
	analyse_input(fp, buffer_netmask);
	pclose(fp);
	gtk_entry_set_text(GTK_ENTRY(entry_network_netmask), buffer_netmask);
	config_write(STR(NET_NETMASK), buffer_netmask);

	char buffer_gateway[MAX_BUFFER];
	//get the gateway and store it
	fp = popen("route -nee | head -3 | tail -1 | awk '{print $2; }'", "r");
	analyse_input(fp, buffer_gateway);
	pclose(fp);
	gtk_entry_set_text(GTK_ENTRY(entry_network_gateway), buffer_gateway);
	config_write(STR(NET_GATEWAY), buffer_gateway);

}

// finde ctxrdp einstellungen
void find_ctxrdp() {
	// Citrix
	char* buffer_ctx = (char*) config_read(STR(CTXRDP_CTX_LINK));
printf("buffer_ctx=%s, CONST=%s\n", buffer_ctx, STR(CTXRDP_CTX_LINK));
	gtk_entry_set_text(GTK_ENTRY(entry_ctxrdp_ctx), buffer_ctx);

	// RDP
	char* buffer_rdp = (char*) config_read(STR(CTXRDP_RDP_LINK));
	gtk_entry_set_text(GTK_ENTRY(entry_ctxrdp_rdp), buffer_rdp);

	char* buffer_rdp_domain = (char*) config_read(STR(CTXRDP_RDP_DOMAIN));
	gtk_entry_set_text(GTK_ENTRY(entry_ctxrdp_rdp_domain), buffer_rdp_domain);
}

//network dhcp/static toggle
//turns the fields in network gray, while dhcp
void toggle_button_radio_network () {
	if(gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(button_radio_network_dhcp))) {
		g_print ("DHCP aktiviert\n");
		gtk_widget_set_sensitive(entry_network_ip, 	FALSE);
		gtk_widget_set_sensitive(entry_network_netmask, FALSE);
		gtk_widget_set_sensitive(entry_network_gateway, FALSE);
		config_write(STR(NET_TYPE), "DHCP");	// speichere in config
	}
	if(gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(button_radio_network_static))) {
		g_print ("STATIC aktiviert\n" );
		gtk_widget_set_sensitive(entry_network_ip, 	TRUE);
		gtk_widget_set_sensitive(entry_network_netmask, TRUE);
		gtk_widget_set_sensitive(entry_network_gateway, TRUE);
		config_write(STR(NET_TYPE), "STATIC");	// speichere in config
	}
}
//ctxrdp ctx/rdp toggle
//turns the fields in ctxrdp gray, depending on which button is active
void toggle_button_radio_ctxrdp () {
	if(gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(button_radio_ctxrdp_ctx))) {
		g_print ("CTX aktiviert \n");
		gtk_widget_set_sensitive(entry_ctxrdp_rdp, 	FALSE);
		gtk_widget_set_sensitive(entry_ctxrdp_rdp_domain, 	FALSE);
		gtk_widget_set_sensitive(button_ctxrdp_rdp, FALSE);
		gtk_widget_set_sensitive(entry_ctxrdp_ctx, 	TRUE);
		gtk_widget_set_sensitive(button_ctxrdp_ctx, TRUE);
		config_write(STR(CTXRDP_TYPE), "CTX");	// speichere in config
	}
	if(gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(button_radio_ctxrdp_rdp))) {
		g_print ("RDP aktiviert\n" );
		gtk_widget_set_sensitive(entry_ctxrdp_rdp, 	TRUE);
		gtk_widget_set_sensitive(entry_ctxrdp_rdp_domain, 	TRUE);
		gtk_widget_set_sensitive(button_ctxrdp_rdp, TRUE);
		gtk_widget_set_sensitive(entry_ctxrdp_ctx, FALSE);
		gtk_widget_set_sensitive(button_ctxrdp_ctx, FALSE);
		config_write(STR(CTXRDP_TYPE), "RDP"); // speichere in config
	}
	
}

//function quit_window
void quit_window () {
	g_print ("quit window");
//	restart_uzbl();
	gtk_widget_destroy(window);
//	system("xbindkeys");
}

// hauptfunktion die von main aufgerufen wird
void activate (GtkApplication *app) {
	// create a new window, and set its title
	window = gtk_application_window_new (app);
	gtk_window_set_title (GTK_WINDOW (window), "Konfiguration ThinClient"); // fenstertitel
	gtk_container_set_border_width (GTK_CONTAINER (window), 50); // rahmendicke rahmen außen um alle elemente
	g_signal_connect (G_OBJECT (window), "delete_event", 
		G_CALLBACK(quit_window), NULL);
		gtk_window_set_keep_above(GTK_WINDOW(window),TRUE);

	//deactivate xbindkeys
	//system("killall xbindkeys");
	//execl ("/usr/bin/firefox", "", "firefox",  NULL);
	

	//create grid
	grid = gtk_grid_new();
	gtk_container_add (GTK_CONTAINER (window), grid); 

	//init.c - initiiert alle fensterelemente
	init();
	//fill the formular with config data
	find_network();
	find_ctxrdp();
printf("3\n");	
	default_network();
printf("4\n");
	default_ctxrdp();

	//layout.c - erstellt layout für alle fensterelemente
	set_layout();

	// show all widgets
	gtk_widget_show_all (window);
}

int main (int argc, char **argv) {
	config_load(STR(PATH_CONFIG));

	int status;
	if (argc > 1) {
		// aufruf mit parameter --> gebe info aus
		printf("%s\n", config_read(argv[1]));

	} else {
		// aufruf ohne parameter --> configpage aufrufen
		GtkApplication *app;

		app = gtk_application_new ("org.gtk.example", G_APPLICATION_FLAGS_NONE);
		g_signal_connect (app, "activate", G_CALLBACK (activate), NULL); // diese funktion wird gestartet
		status = g_application_run (G_APPLICATION (app), argc, argv);
		g_object_unref (app);

		config_save(STR(PATH_CONFIG));
	}

	return status;
}
