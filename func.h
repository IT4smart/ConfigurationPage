#ifndef func_h
#define func_h


//to expand a token to a string: STR(100)-> "100"
#define STR_EXPAND(tok) #tok
#define STR(tok) STR_EXPAND(tok)
//


//function prototypes

//layout.c
void set_layout();

//init.c
void init();


//network
void click_button_network();
void default_network();
void find_ip();
void find_netmask();
void find_gateway();
void change_network ();
void toggle_button_radio_network ();

//wlan --> aktuell deaktiviert
/*void click_button_wlan();
void default_wlan();
bool test_for_wlan_module();
void delete_configure_wlan();
void configure_wlan();
void find_wlan_savings();
void change_wlan ();
void toggle_button_check_wlan_active();
*/

//citrix&rdp
void toggle_button_radio_ctxrdp ();
void click_button_ctxrdp_ctx();
void find_ctx_link();
void change_ctx ();
void restart_uzbl ();
void click_button_ctxrdp_rdp();
void find_rdp_link();
void change_rdp ();

//other
void analyse_input(FILE *fp, char file_type[MAX_BUFFER]);
// bool test_for_wlan_module(); --> aktuell deaktiviert
void quit_window ();
#endif
