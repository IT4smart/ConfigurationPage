#ifndef layout_h
#define layout_h


//vars
	//distance
	//int dist;			 //minimum 1; distance between little boxes

	int right;			//all buttons are in column right

	//network
	int network;
	int network_type;
	int ip;
	int netmask;
	int gateway;
	int network_height;		//the number of columns incl frametitle

	//wlan
	int wlan;
	int active;
	int ssid;
	int pw;
	int wlan_height;

	//ctxrdp
	int ctxrdp;
	int ctxrdp_type;
	int citrix_link;
	int rdp_link;
	int rdp_domain;
	int ctxrdp_height;

	//quit
	int quit;




//funtions
	static void set_headline();
	static void set_footline();
	static void set_layout_order();
	static void set_network();
	static void set_wlan();
	static void set_ctxrdp();

#endif
