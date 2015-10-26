#include <gtk/gtk.h>
#include <stdbool.h> //for bools
#include "vars.h"
#include "func.h"
#include "layout.h"

// baut layout auf - wird von main/activate aufgerufen
void set_layout() { 
	set_layout_order();
	set_headline();
	set_network();
	set_ctxrdp();
	set_footline();
}


static void set_layout_order() {
	//set optical properties
	gtk_grid_set_row_spacing (GTK_GRID (grid), 3); //set the lines between two sections
	//gtk_grid_set_column_homogeneous (GTK_GRID (grid), FALSE);


	//distance
	//int dist	=	1; //minimum 1; distance between little boxes

	right 		=	5;		// all buttons are in column right

	//network
	network 	=	2;		// starting row
	network_type	=	1;		// relative row
	ip		=	2;		// relative row
	netmask		=	3;		// relative row
	gateway		=	4;		// relative row
	network_height 	=	5;		// number of rows incl frametitle

	//ctxrdp
	ctxrdp		=	9;		// starting row
	ctxrdp_type	=	1;		// relative row
	citrix_link	=	2;		// relative row
	rdp_link	=	3;		// relative row
	rdp_domain	=	4;		// relative row
	ctxrdp_height	=	5;		// number of rows incl frametitle

	//quit
	quit		=	19;		// starting row
}


static void set_headline(){
	gtk_grid_attach (
			GTK_GRID (grid), 
				label_headline,		0, 	0,	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				image_it4s,		right, 	0,	1, 1);
}


static void set_network(){
	//network
	gtk_grid_attach (
		GTK_GRID (grid), 
				empty_row_network,	0, 	network	,1, 1);
	gtk_grid_attach ( 
		GTK_GRID (grid), 
				frame_network, 		0, 	network, 	
							right+1,network_height); 
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_network_type,	0, 	network+network_type, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_radio_network_dhcp, 		1, 	network+network_type, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_radio_network_static, 		2, 	network+network_type, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_network_ip,	0, 	network+ip, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				entry_network_ip,	1, 	network+ip, 	right-2, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_network_netmask,	0, 	network+netmask, 1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				entry_network_netmask,	1, 	network+netmask, right-2, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_network_gateway,	0, 	network+gateway, 1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				entry_network_gateway,	1, 	network+gateway, right-2, 1);

	gtk_grid_attach (
		GTK_GRID (grid), 
				button_network,		right, 	network+network_height-1, 1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				empty_row_network_back,		right, 	network+network_height, 1, 1);
}


static void set_ctxrdp(){

	//ctxrdp
	gtk_grid_attach (
		GTK_GRID (grid), 
				empty_row_ctxrdp,		0, 	ctxrdp,		1, 1);
	gtk_grid_attach ( 
		GTK_GRID (grid), 
				frame_ctxrdp, 		0, 	ctxrdp, 	
							right+1,ctxrdp_height); 
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_ctxrdp_type,	0, 	ctxrdp+ctxrdp_type, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_radio_ctxrdp_ctx, 		1, 	ctxrdp+ctxrdp_type, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_radio_ctxrdp_rdp, 		2, 	ctxrdp+ctxrdp_type, 	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_ctx_link,	0, 	ctxrdp+citrix_link,	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				entry_ctxrdp_ctx,	1, 	ctxrdp+citrix_link, 	right - 2, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_ctxrdp_ctx, 		right, 	ctxrdp+citrix_link, 		1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_rdp_link,	0, 	ctxrdp+rdp_link,	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				entry_ctxrdp_rdp,	1, 	ctxrdp+rdp_link, 	right - 2, 1);
	gtk_grid_attach (
		GTK_GRID (grid),
				label_rdp_domain, 0,	ctxrdp+rdp_domain,	1, 1);
	gtk_grid_attach (
		GTK_GRID (grid),
				entry_ctxrdp_rdp_domain,	1,	ctxrdp+rdp_domain,	right - 2, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_ctxrdp_rdp, 		right, 	ctxrdp+network_height-1, 1, 1);
	gtk_grid_attach (
		GTK_GRID (grid), 
				empty_row_ctxrdp_back,	right, 	ctxrdp+ctxrdp_height, 1, 1);

}


static void set_footline() {
	//statusline
	gtk_grid_attach (
		GTK_GRID (grid), 
				label_status, 		0, quit, 		right-1, 1);
	//quit
	gtk_grid_attach (
		GTK_GRID (grid), 
				button_quit, 		right, quit, 		1, 1);
}
