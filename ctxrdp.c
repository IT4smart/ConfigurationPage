#include <gtk/gtk.h>
#include <string.h>		//strlen, strcat, strcpy
#include <stdlib.h> //for system()
#include <stdbool.h> //for bools
#include "vars.h"
#include "func.h"
#include "ctxrdp.h"


// speichere ctx link
void click_button_ctxrdp_ctx() {
	char* new_link = (char*) gtk_entry_get_text(GTK_ENTRY(entry_ctxrdp_ctx));
	config_write(STR(CTXRDP_CTX_LINK), new_link);
}

// speichere rdp link
void click_button_ctxrdp_rdp() {
	char* new_link = (char*) gtk_entry_get_text(GTK_ENTRY(entry_ctxrdp_rdp));
	config_write(STR(CTXRDP_RDP_LINK), new_link);

	char* new_domain = (char*) gtk_entry_get_text(GTK_ENTRY(entry_ctxrdp_rdp_domain));
	config_write(STR(CTXRDP_RDP_DOMAIN), new_domain);
}

//function restart_uzbl with new url 
void restart_uzbl () {
	//einfacher
	system("killall uzbl-core");
	
	//figure out pid of uzbl-core programm
	char file_type[MAX_BUFFER];
	//get the SSID and store it
	fp = popen(STR(ps x | grep 'uzbl-core -u' -m 1 | awk '{print $1;}'), "r");
	analyse_input(fp, file_type);
	//g_print(file_type);
	pclose(fp);	
	
	char* new_link 		= (char*) gtk_entry_get_text(GTK_ENTRY(entry_ctxrdp_ctx));
	int size_link		= strlen(new_link);
	//g_print("size %d\n", size);
	char uzbl[]		= "uzbl -u ";
	int size_uzbl		= strlen(uzbl);
	int size		= size_link + size_uzbl + 3;// +3 for ' &'
	char new_uzbl[size];
	strcpy (new_uzbl, uzbl);
	strcat (new_uzbl, new_link);
	strcat (new_uzbl, " &");
	
	const char* comment	= new_uzbl;
//for testing not here
//system(comment);
	
}
