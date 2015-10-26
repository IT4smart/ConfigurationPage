#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>


#define MAX 128				// max. Zeilenlänge der configdatei

// struct for config
typedef struct {
	char *name;		// name of the variable 
	char *content;		// content of the variable
} Config;

// einfach verkettete liste
typedef struct ConfigList ConfigList;
struct ConfigList {
	Config *actual;
	ConfigList *next;
};


static char UNWANTED[] = " \t\n;=\\"; // nicht erlaubte zeichen
static char DELIMITER[] = "="; // trennzeichen
static char COMMENT_CHAR = '#'; // kommentarzeichen
ConfigList *config_p_start; // start der config liste
ConfigList *config_p_last; // ende der config liste (für einfügen)


// remove linefeed
void remove_lf(char *str) {
   size_t p = strlen(str);
   str[p-1] = '\0';   // '\n' mit '\0' überschreiben
}

// remove unwanted chars
void remove_unwanted(char *str) {
	if (str==NULL) { return;}

	int length = strlen(str);
		char new_str[length];
	int i,j;
	j=0;
	for (i=0;i<length;i++) {
		if (strchr(UNWANTED, str[i]) != NULL) { // mache nichts
		} else {
			new_str[j++] = str[i];
		}
	}
	new_str[j]='\0';
	memcpy(str, new_str, length);
}

// füge config knoten an ende von liste an
void config_create(const char *name, const char *content) {
	// erstelle struct Config
	Config *pc = malloc(sizeof(Config));
	pc->name = strdup(name);
	pc->content = strdup(content);

	// erstelle Listenelement
	ConfigList *pl = malloc(sizeof(ConfigList));
	pl->actual = pc;
	pl->next = NULL;

	// verlinke Listenelement
	if (config_p_start == NULL) { // behandle erstes listenelement anders
		config_p_start = pl;
		config_p_last = pl;
	} else {
		config_p_last->next = pl;
		config_p_last = pl;
	}
}

// entferne config knoten aus liste
void config_remove(const char *name) {
	ConfigList *cl = config_p_start;
	ConfigList *vl; // voriges listenelement 
	while (cl != NULL) {
		Config *c = cl->actual;
		if ((c->name != NULL) && (strcmp(c->name, name) == 0)) {
			vl->next = cl->next;
			if (cl->next == NULL) { // letztes element
				config_p_last = vl; // setze zeiger auf letztes element
			}
			return;
		}
		vl = cl;
		cl = cl->next;
	}
}

// setze config content auf null zurück
void config_delete(const char *name) {
	ConfigList *cl = config_p_start;
	while (cl != NULL) {
		Config *c = cl->actual;
		if ((c->name != NULL) && (strcmp(c->name, name) == 0)) {
			c->content = NULL;
		}
		cl = cl->next;
	}
}

// schreibe content in knoten
bool config_write(const char *name, const char *content) {
	ConfigList *cl = config_p_start;
	while (cl != NULL) {
		Config *c = cl->actual;
		if ((c->name != NULL) && (strcmp(c->name, name) == 0)) {
			if (content != NULL) {
				c->content = strdup(content);
			}
			return true;
		}
		cl = cl->next;
	}
	
	// knoten ist noch nicht da, erzeuge einen
	config_create(name, content);
	return true;
}

// lese content aus knoten mit dem namen name
char *config_read(const char *name) {
	ConfigList *cl = config_p_start;
	while (cl != NULL) {
		Config *c = cl->actual;
		if ((c->name != NULL) && (strcmp(c->name, name) == 0)) {
			if (c->content != NULL) {
				char *content = malloc(sizeof(*content));
				content = strdup(c->content);
				return content;
			} else {
				return NULL; // content is NULL
			}
		}
		cl = cl->next;
	}
	
	return NULL;
}

// lade Configdatei
bool config_load(const char *filename) {
	FILE *configfile;
	char line[MAX];

	// datei zum lesen öffnen	
	configfile = fopen(filename, "r");
	if(configfile != NULL) {
 		while(fgets(line, MAX, configfile)) {
			remove_lf(line); // entferne linefeed
			
			// erstelle struct Config
			Config *pc = malloc(sizeof(Config));

			char *c_name = strtok(line, DELIMITER);// teile zeile in substrings name und content auf
			if (c_name != NULL) { // ist keine kommentarzeile
				pc->name = strdup(c_name);
				if (strchr(pc->name, COMMENT_CHAR) == NULL) { // keine kommentarzeile
					remove_unwanted(pc->name); // nimm alle ungewünschten zeichen raus
				}
			}

			char *c_content = strtok(NULL, DELIMITER);
			if (c_content != NULL) {
				pc->content = strdup(c_content);
				remove_unwanted(pc->content);
			}

			// erstelle Listenelement
			ConfigList *pl = malloc(sizeof(ConfigList));
			pl->actual = pc;
			if (config_p_start == NULL) {
				config_p_start = pl; // setze start auf liste
			} else {
				config_p_last->next = pl; // verkette voriges listenelement mit aktuellem listenelement
			}
			config_p_last = pl;

//			printf("name=%s, content=%s\n", pc->name, pc->content);	
		}
		fclose(configfile);
		return true;
   	} else {
      		printf("Fehler beim Öffnen der Datei\n");
		return false;
   	}

}

// speichere Configdatei
bool config_save(const char *filename) {
	FILE *configfile;
	ConfigList *cl;
	cl = config_p_start;
	char *tmp1, *tmp2;

	// datei zum speichern öffnen	
	configfile = fopen(filename, "w");
	if(configfile != NULL) {
 		while(cl != NULL) {	
			if (cl->actual->name == NULL) { // wenn kein inhalt schreibe "" statt (null)
				tmp1 = "";			
			} else {
				tmp1 = strdup(cl->actual->name);
			}
			if (cl->actual->content == NULL) { // wenn kein inhalt schreibe "" statt (null)
				tmp2 = "";			
			} else {
				tmp2 = strdup(cl->actual->content);
			}

			if ((cl->actual->name == NULL) || (strchr(cl->actual->name, COMMENT_CHAR) != NULL)) { // kommentarzeile 
				fprintf(configfile, "%s%s\n", tmp1, tmp2);
//				printf("%s%s\n", tmp1, tmp2);
			} else { // configzeile
				fprintf(configfile, "%s = %s\n", tmp1, tmp2);
//				printf("%s = %s\n", tmp1, tmp2);
			}

			cl = cl->next;
		}
		fclose(configfile);
		return true;
   	} else {
      		printf("Fehler beim Öffnen der Datei\n");
		return false;
   	}

}

// gib Configdatei aus --> zu Testzwecken
void config_print() {
	if (config_p_start==NULL) {
		printf("keine Konfiguration vorhanden\n");
	} else {
		ConfigList *p = config_p_start;
		do {
			Config *c = p->actual;
			printf("name=%s, content=%s\n", c->name, c->content);
			p = p->next;
		} while (p!=NULL);
	}
}

