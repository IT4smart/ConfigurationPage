
#ifndef vars_h
#define vars_h

#define MAX_BUFFER 255							//this is the buffer for all popen output streams

//test --> CHANGE FOR THINCLIENT
#define PATH_CONFIG /home/test/configuration/settings/thinclient.cfg		//path to the configuration file
#define PATH_SETTINGS /home/test/configuration/settings		//the path to the image_file and configuration
//#define PATH_CONFIG /home/test/configuration/settings/thinclient.cfg		//path to the configuration file
//#define PATH_SETTINGS /home/test/configuration/settings		//the path to the image_file and configuration
#define PATH_INTERFACES /etc/network/interfaces		// path to interfaces file

// config content
#define NET_TYPE NET_TYPE
#define NET_IP NET_IP	
#define NET_NETMASK NET_NETMASK
#define NET_GATEWAY NET_GATEWAY
#define CTXRDP_TYPE CTXRDP_TYPE
#define CTXRDP_CTX_LINK CTXRDP_CTX_LINK
#define CTXRDP_RDP_LINK CTXRDP_RDP_LINK
#define CTXRDP_RDP_DOMAIN CTXRDP_RDP_DOMAIN
#define CTXRDP_RDP_BIN CTXRDP_RDP_BIN
#define CUSTOM_LOGO CUSTOM_LOGO


GtkWidget *window;
GtkWidget *grid;
//GtkWidget *emtpy_row;//empty row in the grid


//header
GtkWidget *label_headline;
GtkWidget *image_it4s;


//frame
GtkWidget *frame_network;
GtkWidget *frame_ctxrdp;


//empty_row		in the grid
GtkWidget *empty_row_network;
GtkWidget *empty_row_wlan;
GtkWidget *empty_row_ctxrdp;
GtkWidget *empty_row_network_back;	//back is under the section
GtkWidget *empty_row_ctxrdp_back;


//label network
GtkWidget *label_network;
GtkWidget *label_network_type;
GtkWidget *label_network_ip;
GtkWidget *label_network_netmask;
GtkWidget *label_network_gateway;

//label ctxrdp
GtkWidget *label_ctxrdp;
GtkWidget *label_ctxrdp_type;
GtkWidget *label_ctx_link;
GtkWidget *label_rdp;
GtkWidget *label_rdp_domain;
GtkWidget *label_rdp_link;

//label status
GtkWidget *label_status;

//entry network
GtkWidget *entry_network_ip;
GtkWidget *entry_network_netmask;
GtkWidget *entry_network_gateway;

//entry ctxrdp
GtkWidget *entry_ctxrdp_ctx;
GtkWidget *entry_ctxrdp_rdp;
GtkWidget *entry_ctxrdp_rdp_domain;

//radio network
GtkWidget *button_radio_network_dhcp;
GtkWidget *button_radio_network_static; 

//radio ctxrdp
GtkWidget *button_radio_ctxrdp_ctx;
GtkWidget *button_radio_ctxrdp_rdp; 

//buttons
GtkWidget *button_network;
GtkWidget *button_ctxrdp_ctx;
GtkWidget *button_ctxrdp_rdp;
GtkWidget *button_quit;

//files
FILE *fp;                          // pointer to stdin/out file pipe
FILE *interfacesp;		// pointer to interfaces
#endif
