#include <gtk/gtk.h>
#include <stdbool.h> //for bools
#include "vars.h"
#include "func.h"
#include "init.h"


// initialisiert alle fensterelemente auf (wird von main/activate aufgerufen)
void init() {
	init_header();
	init_label();
	init_entry();
	init_button();
	init_frame();
	init_empty_row();
	init_button_functionality();
}


static void init_header() {
	//header
	label_headline = gtk_label_new("");
	gtk_label_set_markup(GTK_LABEL(label_headline), "<span font_desc=\"20.0\">Konfiguration ThinClient\n</span>");

	//worked but to big
	image_it4s 		= gtk_image_new();
	gtk_image_set_from_file(GTK_IMAGE (image_it4s), STR(PATH_SETTINGS/IT4S_low.png));

	//int size  = gtk_image_get_pixel_size (GTK_IMAGE (image_it4s));
	//gtk_image_set_pixel_size(GTK_IMAGE (image_it4s), 10);
}


static void init_empty_row() {
	empty_row_network	= gtk_label_new("");
	empty_row_network_back	= gtk_label_new("");
	empty_row_ctxrdp	= gtk_label_new("");
	empty_row_ctxrdp_back= gtk_label_new("");
}


static void init_label() {
	//network
	label_network		= gtk_label_new("Netzwerk");
	label_network_type	= gtk_label_new("Netzwerktyp:");
	label_network_ip	= gtk_label_new("Lokale IP:");
	label_network_netmask	= gtk_label_new("Netzmaske:");
	label_network_gateway	= gtk_label_new("Gateway:");

	//ctxrdp
	label_ctxrdp		= gtk_label_new("Citrix und Remote Desktop");
	label_ctxrdp_type	= gtk_label_new("Anmeldung:");
	label_ctx_link		= gtk_label_new("Citrix Link:");
	label_rdp 		= gtk_label_new("RDP");
	label_rdp_link		= gtk_label_new("RDP Link:");
	label_rdp_domain	= gtk_label_new("RDP Domain:");

	//status
	label_status		= gtk_label_new("");
}


static void init_entry() {
	//network
	entry_network_ip	= gtk_entry_new();
	gtk_entry_set_width_chars (entry_network_ip, 40); // eines gibt die groesse fuer alle entry boxen vor!
	entry_network_netmask	= gtk_entry_new();
	// gtk_entry_set_max_width_chars (entry_network_netmask, 20); --> supported from gtk+-3.12 on, here gtk+-3.0
	entry_network_gateway	= gtk_entry_new();

	//ctxrdp
	entry_ctxrdp_ctx	= gtk_entry_new();
		///fuer url link citrix falls es mal was werden soll
		//GTK_INPUT_PURPOSE_URL
	entry_ctxrdp_rdp	= gtk_entry_new();
	entry_ctxrdp_rdp_domain	= gtk_entry_new();

}


static void init_button() {
	//network
	button_network		= gtk_button_new_with_label ("Netzwerk speichern");

	//ctxrdp
	button_ctxrdp_ctx		= gtk_button_new_with_label ("Link speichern");
	button_ctxrdp_rdp 		= gtk_button_new_with_label ("Link speichern");

	//quit
	button_quit 		= gtk_button_new_with_label ("Anwenden");

	//radio buttons
	button_radio_network_dhcp 	= gtk_radio_button_new_with_label (NULL, "DHCP");
	button_radio_network_static 	= gtk_radio_button_new_with_label (gtk_radio_button_get_group(GTK_RADIO_BUTTON(button_radio_network_dhcp)), "Statisch");

	button_radio_ctxrdp_ctx 		= gtk_radio_button_new_with_label (NULL, "Citrix");
	button_radio_ctxrdp_rdp 		= gtk_radio_button_new_with_label (gtk_radio_button_get_group(GTK_RADIO_BUTTON(button_radio_ctxrdp_ctx)), "RDP");
}


static void init_frame() {
	//network
	frame_network		= gtk_frame_new(NULL);
	gtk_frame_set_label_widget(GTK_FRAME(frame_network), label_network);

	//citrixrd
	frame_ctxrdp		= gtk_frame_new(NULL);
	gtk_frame_set_label_widget(GTK_FRAME(frame_ctxrdp), label_ctxrdp);
}



static void init_button_functionality() {
	//it's important that the init of buttons is before the 
	//button functionalities, because so references for the buttons are existing

	//network
	g_signal_connect (button_network, 		"clicked", G_CALLBACK (click_button_network), 	NULL);
	g_signal_connect (button_radio_network_dhcp,	"toggled", G_CALLBACK (toggle_button_radio_network), 	NULL);

	//ctxrdp
	//ctxrdp radio_button
	g_signal_connect (button_ctxrdp_ctx, 	"clicked", G_CALLBACK (click_button_ctxrdp_ctx),	NULL);
	g_signal_connect (button_ctxrdp_rdp,	"clicked", G_CALLBACK (click_button_ctxrdp_rdp),	NULL);
	g_signal_connect (button_radio_ctxrdp_ctx,"toggled", G_CALLBACK (toggle_button_radio_ctxrdp), 	NULL);

	//quit
	g_signal_connect_swapped (button_quit,		"clicked", G_CALLBACK (quit_window), 		NULL);
}
