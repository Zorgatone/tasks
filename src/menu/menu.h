#ifndef MENU_H
#define MENU_H

#include <string.h>

typedef enum {
	MENU_HELP,
	MENU_UNKNOWN
} menu_action;

static inline menu_action menu(char *arg) {
	if (strcmp(arg, "help") == 0) {
		return MENU_HELP;
	}

	return MENU_UNKNOWN;
}

void help(int argc, char **argv);

#endif
