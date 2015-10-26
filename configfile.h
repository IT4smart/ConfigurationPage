#ifndef configfile_h
#define configfile_h

#define MAX 128				// max. Zeilenlänge der configdatei

static char UNWANTED[] = " \t\n;=\\"; // nicht erlaubte zeichen
static char DELIMITER[] = "="; // trennzeichen
static char COMMENT_CHAR = '#'; // kommentarzeichen
ConfigList *config_p_start; // start der config liste
ConfigList *config_p_last; // ende der config liste (für einfügen)

// remove linefeed
void remove_lf(char *str);

// remove unwanted chars
void remove_unwanted(char *str);
	
// füge config knoten an ende von liste an
void config_create(const char *name, const char *content);

// entferne config knoten aus liste
void config_remove(const char *name);

// setze config content auf null zurück
void config_delete(const char *name);

// schreibe content in knoten
bool config_write(const char *name, const char *content);

// lese content aus knoten mit dem namen name
char *config_read(const char *name);

// gib Configdatei aus --> zu Testzwecken
void config_print();

// lade Configdatei
bool config_load(const char *filename);

// speichere Configdatei
bool config_save(const char *filename);

